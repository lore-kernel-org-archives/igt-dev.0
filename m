Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA0010E047
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Dec 2023 06:54:50 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH i-g-t 1/2] include/intel_gpu_commands: Add persistent
 batch buffer instruction.
Date: Tue, 26 Dec 2023 06:54:46 +0000
Message-ID: <MW3PR11MB4748E9FEE13591FBD0860966AE98A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231222105353.23355-1-sai.gowtham.ch@intel.com>
 <20231222105353.23355-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20231222105353.23355-2-sai.gowtham.ch@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> sai.gowtham.ch@intel.com
> Sent: Friday, December 22, 2023 4:24 PM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [PATCH i-g-t 1/2] include/intel_gpu_commands: Add persistent bat=
ch
> buffer instruction.
Don't end commit title with "."
Correct this in all patches wherever required.

Thanks,
Rahul
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Add persistent batct buffer instruction.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  include/intel_gpu_commands.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
> index e10507fa7..5a98fb63f 100644
> --- a/include/intel_gpu_commands.h
> +++ b/include/intel_gpu_commands.h
> @@ -134,6 +134,7 @@
>  #define MI_STORE_DWORD_IMM	MI_INSTR(0x20, 1)
>  #define MI_STORE_DWORD_IMM_GEN4	MI_INSTR(0x20, 2)
>  #define MI_STORE_QWORD_IMM_GEN8 (MI_INSTR(0x20, 3) | REG_BIT(21))
> +#define MI_PRT_BATCH_BUFFER_START (0x39 << 23)
>  #define   MI_MEM_VIRTUAL	(1 << 22) /* 945,g33,965 */
>  #define   MI_USE_GGTT		(1 << 22) /* g4x+ */
>  #define MI_STORE_DWORD_INDEX	MI_INSTR(0x21, 1)
> --
> 2.39.1
