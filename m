Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CFA10E104
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 06:40:16 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 4 Jul 2023 06:40:12 +0000
Message-ID: <BYAPR11MB34139523EC5C4AAE426FE82ED02EA@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <20230704063816.670605-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20230704063816.670605-1-priyanka.dandamudi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel-ci: Block list xe_sysfs
 tests
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

LGTM
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

> -----Original Message-----
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: Tuesday, July 4, 2023 12:08 PM
> To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; igt-
> dev@lists.freedesktop.org; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t] tests/intel-ci: Block list xe_sysfs tests
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Black listing xe_sysfs tests until related KMD changes get merged.
>=20
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklis=
t.txt index
> 2a758359e..02edeb6b6 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -80,3 +80,5 @@ igt@kms_force_connector_basic@force-load-detect
>  igt@kms_getfb@.*-ccs
>  igt@kms_plane_lowres@tiling-(4|x|y|yf)
>=20
> #################################################################
> #
> +igt@xe_sysfs*
> +################################################################
> ##
> --
> 2.25.1
