import mysql from 'mysql';
import config from '../config';

const pool = mysql.createPool(config.db);

export const Query = (sql: string, values?: any) => {
  return new Promise((resolve, reject) => {
    const formatted = mysql.format(sql, values);
    console.log(formatted);

    pool.query(sql, (err, results) => {
      if (err) {
        return reject(err);
      }

      return resolve(results);
    });
  });
};
