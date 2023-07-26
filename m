Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14FE10E41C
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 06:29:37 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 06:29:33 +0000
Message-ID: <MW3PR11MB47484B11C7DD1A1F0224A967AE00A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230726062403.11349-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230726062403.11349-1-sai.gowtham.ch@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe/xe_exec_store: Fix the num of
 placements check to run test on all engines.
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
> From: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
> Sent: 26 July 2023 11:54
> To: igt-dev@lists.freedesktop.org; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [PATCH i-g-t] tests/xe/xe_exec_store: Fix the num of placements =
check
> to run test on all engines.
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Intension is to submit workload on all engine instances, this change will=
 make
> test to run on all engines including render and copy engines.
  				        ^including engines which have single instance.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/xe/xe_exec_store.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/xe/xe_exec_store.c b/tests/xe/xe_exec_store.c index
> ab1bde36e..fbce1aecc 100644
> --- a/tests/xe/xe_exec_store.c
> +++ b/tests/xe/xe_exec_store.c
> @@ -149,7 +149,7 @@ static void store_all(int fd, int gt, int class)
>  		eci[num_placements++] =3D *hwe;
>  	}
>=20
> -	igt_require(num_placements > 1);
> +	igt_require(num_placements);
>=20
>  	for (i =3D 0; i < num_placements; i++) {
>  		struct drm_xe_engine_create create =3D {
> --
> 2.39.1

Update commit description

LGTM
Reviewed-by: Janga Rahul Kumar<janga.rahul.kumar@intel.com>
