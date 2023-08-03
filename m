Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF99A10E5D6
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 08:41:05 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Date: Thu, 3 Aug 2023 08:40:58 +0000
Message-ID: <DM6PR11MB449213D55D02858EE14FB6D68D08A@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20230803082134.3039513-1-katarzyna.dec@intel.com>
 <20230803082134.3039513-2-katarzyna.dec@intel.com>
In-Reply-To: <20230803082134.3039513-2-katarzyna.dec@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/intel-ci: Add detailed
 description to blocked tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dec, Katarzyna" <katarzyna.dec@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dec, Katarzyna <katarzyna.dec@intel.com>
> Sent: 03 August 2023 01:52 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Dec, Katarzyna <katarzyna.dec@intel.com>; Mauro Carvalho Chehab
> <mauro.chehab@linux.intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 1/1] tests/intel-ci: Add detailed description to bl=
ocked
> tests
>=20
> Update of description of blocked tests:
> * mock DRM KUnit:
> 	igt@dmabuf.*
> 	igt@drm_buddy
> 	igt@drm_mm
> 	igt@kms_selftest.*
> * test blocked as KMD not ready
> 	igt@xe_sysfs*
>=20
> Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklis=
t.txt index
> b40dd4f70..2398acf3d 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -21,7 +21,8 @@ igt@gen.*
>  igt@perf.*
>  igt@sysfs_.*
>=20
> ################################################################
> ##
> -# Exclude kselftest
> +# Exclude mock DRM KUnit from IGT, as those already run at build # time
> +on Intel CI
>=20
> ################################################################
> #
>  igt@dmabuf.*
>  igt@drm_buddy
> @@ -81,5 +82,8 @@ igt@kms_getfb@.*-ccs
>  igt@kms_plane_lowres@tiling-(4|x|y|yf)
>  igt@kms_.*@.*hang.*
>=20
> ################################################################
> ##
> +# xe_sysfs tests are blocked due to KMD not ready yet # To be UNBLOCKED
> +after KMD is merged
> +###############################################################
> ###
>  igt@xe_sysfs*
>=20
I am about to remove the test from the blocklist as the KMD patches are rev=
iewed and will be removed and related patch is in review.
> ################################################################
> ##
> --
> 2.34.1


