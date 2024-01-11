Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE8D10E03A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 06:51:33 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH i-g-t] lib/intel_cmds_info: Add MEM_COPY/SET support for
 Lunarlake
Date: Thu, 11 Jan 2024 06:51:29 +0000
Message-ID: <MW3PR11MB474804972B9D2B17CCB52E32AE682@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240109095602.9620-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20240109095602.9620-1-sai.gowtham.ch@intel.com>
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
> Sent: Tuesday, January 9, 2024 3:26 PM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [PATCH i-g-t] lib/intel_cmds_info: Add MEM_COPY/SET support for
> Lunarlake
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Enable MEM_COPY/SET instructions support for Lunarlake, which allows to
> validate MEM_COPY/SET tests.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Acked-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Thanks,
Rahul
> ---
>  lib/intel_cmds_info.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c index
> 56073bd6d..669d3e500 100644
> --- a/lib/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -182,6 +182,8 @@ const struct intel_cmds_info xe2_cmds_info  =3D {
>  	.blt_cmds =3D {
>  		[XY_FAST_COPY] =3D &dg2_xy_fast_copy,
>  		[XY_BLOCK_COPY] =3D &xe2_xy_block_copy,
> +		[MEM_COPY] =3D &pvc_mem_copy,
> +		[MEM_SET] =3D &pvc_mem_set,
>  	}
>  };
>=20
> --
> 2.39.1
