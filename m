Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FE110E576
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 12:59:02 +0000 (UTC)
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Thu, 27 Jul 2023 12:58:57 +0000
Message-ID: <SJ1PR11MB6204AB22EEEA8D24E3662C618101A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230720120147.1057467-1-priyanka.dandamudi@intel.com>
 <20230720120147.1057467-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20230720120147.1057467-3-priyanka.dandamudi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/intel-ci: Remove xe_sysfs
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
> Sent: Thursday, July 20, 2023 5:32 PM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; igt-
> dev@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 2/3] tests/intel-ci: Remove xe_sysfs from blacklist
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Removing xe_sysfs tests as kernel related patches are ready.

Once KMD patch is merged, this can go in.
Acked-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklis=
t.txt index
> ab3945f76..b984d835a 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -80,8 +80,6 @@ igt@kms_force_connector_basic@force-load-detect
>  igt@kms_getfb@.*-ccs
>  igt@kms_plane_lowres@tiling-(4|x|y|yf)
>=20
> ################################################################
> ##
> -igt@xe_sysfs*
> -
> ################################################################
> ##
>  # No chamelium/psr setup on XE bat
>=20
> ################################################################
> ##
>  igt@.*chamelium.*
> --
> 2.25.1
