import axios from "axios";
// import { cookies } from "next/dist/client/components/headers";

let axiosInstance = axios.create({
  baseURL: process.env.BASE_URL,
  withCredentials: true,
});

/*server side isteklerde zaten axios uyumlu degil fetch kodu ile
 kendimiz manuel cookie işlemlerini hallediyoruz. */

// try {
//   const cStore = cookies();
//   const cookees = cStore.get("connect.sid");
//   if (cookees) {
//     axiosInstance = axios.create({
//       baseURL: process.env.BASE_URL,
//       withCredentials: true,
//       headers: {
//         Cookie: `connect.sid=${cookees.value}`,
//       },
//     });
//   }
// } catch (error) {
//   console.log("kullanıcı henüz giriş yapmadı");
// }

export default axiosInstance;
