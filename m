Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5AA10E6B3
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 09:43:38 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
Subject: RE: [PATCH i-g-t 2/2] lib/xe/xe_query: Fix compilation -Wshadow
 warning
Date: Wed, 17 Jan 2024 09:43:33 +0000
Message-ID: <MW3PR11MB47486843C58054C2CF5A3A1FAE722@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240116144336.18068-1-nirmoy.das@intel.com>
 <20240116144336.18068-2-nirmoy.das@intel.com>
In-Reply-To: <20240116144336.18068-2-nirmoy.das@intel.com>
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
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Das, Nirmoy" <nirmoy.das@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nirmoy
> Das
> Sent: Tuesday, January 16, 2024 8:14 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>
> Subject: [PATCH i-g-t 2/2] lib/xe/xe_query: Fix compilation -Wshadow warn=
ing
>=20
> Fix -Wshadow warning when xe_for_each_engine() and
> xe_for_each_mem_region are used together.
>=20
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  lib/xe/xe_query.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h index 1e3a7bdb9..032db=
1308
> 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -67,8 +67,8 @@ struct xe_device {
>  	for (__gt =3D 0; __gt < xe_number_gt(__fd); ++__gt)
>=20
>  #define xe_for_each_mem_region(__fd, __memreg, __r) \
> -	for (uint64_t __i =3D 0; __i < igt_fls(__memreg); __i++) \
> -		for_if(__r =3D (__memreg & (1ull << __i)))
> +	for (uint64_t __j =3D 0; __j < igt_fls(__memreg); __j++) \
> +		for_if(__r =3D (__memreg & (1ull << __j)))
>=20
>  #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class =3D=3D
> DRM_XE_MEM_REGION_CLASS_SYSMEM)  #define
> XE_IS_CLASS_VRAM(__region) ((__region)->mem_class =3D=3D
> DRM_XE_MEM_REGION_CLASS_VRAM)
> --
> 2.42.0


