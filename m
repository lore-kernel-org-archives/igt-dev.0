Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0B310E0A1
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 09:44:09 +0000 (UTC)
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Wed, 2 Aug 2023 09:43:49 +0000
Message-ID: <SJ1PR11MB620424696B6EC3F9C48F2EDA810BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230802083900.1175872-1-priyanka.dandamudi@intel.com>
 <20230802083900.1175872-5-priyanka.dandamudi@intel.com>
In-Reply-To: <20230802083900.1175872-5-priyanka.dandamudi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/intel-ci: Remove xe_sysfs
 from blacklist
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
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: Wednesday, August 2, 2023 2:09 PM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; igt-
> dev@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 4/4] tests/intel-ci: Remove xe_sysfs from blacklist
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Removing xe_sysfs tests as kernel related patches are ready.
>=20
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Acked-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> ---
>  tests/intel-ci/xe.blocklist.txt | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklis=
t.txt index
> b40dd4f70..d7d9c6c93 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -81,5 +81,3 @@ igt@kms_getfb@.*-ccs
>  igt@kms_plane_lowres@tiling-(4|x|y|yf)
>  igt@kms_.*@.*hang.*
>=20
> ################################################################
> ##
> -igt@xe_sysfs*
> -
> ################################################################
> ##
> --
> 2.25.1
