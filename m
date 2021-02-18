Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789616E9FE
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Feb 2021 09:15:54 +0000 (UTC)
Date: Thu, 18 Feb 2021 11:16:00 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YC4wUBvwokvVOve0@platvala-desk.ger.corp.intel.com>
References: <20210218053135.14068-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210218053135.14068-1-venkata.sai.patnana@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_setmode: Restrict the test
 execution to two pipes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 18, 2021 at 11:01:35AM +0530, venkata.sai.patnana@intel.com wro=
te:
> From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> =

> Restrict execution of all subtests to two pipes(default)
> If you want to execute on all pipes need to pass extra argument(-e)
> Example: ./build/tests/kms_setmode -e --r basic
> =

> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Juha-Pekka Heikkil=E4 <juha-pekka.heikkila@intel.com>
> Cc: Modem Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Tested-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> ---
>  tests/kms_setmode.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> =

> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 16648087d0..9432a7de12 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -37,10 +37,14 @@
>  /* max combinations with repetitions */
>  #define MAX_COMBINATION_ELEMS   MAX_CRTCS
>  =

> +/* restricted pipe count */
> +#define CRTC_RESTRICT_CNT 2
> +
>  static int drm_fd;
>  static drmModeRes *drm_resources;
>  static int filter_test_id;
>  static bool dry_run;
> +static bool all_pipes =3D false;
>  =

>  const drmModeModeInfo mode_640_480 =3D {
>  	.name		=3D "640x480",
> @@ -754,6 +758,7 @@ static void test_combinations(const struct test_confi=
g *tconf,
>  	struct combination_set crtc_combs;
>  	struct connector_config *cconfs;
>  	int i;
> +	int crtc_count =3D all_pipes ? tconf->resources->count_crtcs : CRTC_RES=
TRICT_CNT;

You need to account for the case when count_crtcs is less than 2.


-- =

Petri Latvala


>  =

>  	if (connector_count > 2 && (tconf->flags & TEST_STEALING))
>  		return;
> @@ -761,20 +766,19 @@ static void test_combinations(const struct test_con=
fig *tconf,
>  	igt_assert(tconf->resources);
>  =

>  	connector_combs.capacity =3D pow(tconf->resources->count_connectors,
> -				       tconf->resources->count_crtcs + 1);
> -	crtc_combs.capacity =3D pow(tconf->resources->count_crtcs,
> -				  tconf->resources->count_crtcs + 1);
> -
> +				       crtc_count + 1);
> +	crtc_combs.capacity =3D pow(crtc_count,
> +				  crtc_count + 1);
>  	connector_combs.items =3D malloc(connector_combs.capacity * sizeof(stru=
ct combination));
>  	crtc_combs.items =3D malloc(crtc_combs.capacity * sizeof(struct combina=
tion));
>  =

>  	get_combinations(tconf->resources->count_connectors, connector_count,
>  			 false, &connector_combs);
> -	get_combinations(tconf->resources->count_crtcs, connector_count,
> -			 true, &crtc_combs);
> +	get_combinations(crtc_count, connector_count, true, &crtc_combs);
>  =

>  	igt_info("Testing: %s %d connector combinations\n", tconf->name,
>  		 connector_count);
> +
>  	for (i =3D 0; i < connector_combs.count; i++) {
>  		int *connector_idxs;
>  		int ret;
> @@ -811,10 +815,11 @@ free_cconfs:
>  =

>  static void run_test(const struct test_config *tconf)
>  {
> -	int connector_num;
> +	int connector_num, crtc_count;
>  =

>  	connector_num =3D tconf->flags & TEST_CLONE ? 2 : 1;
> -	for (; connector_num <=3D tconf->resources->count_crtcs; connector_num+=
+)
> +	crtc_count =3D all_pipes ? tconf->resources->count_crtcs : CRTC_RESTRIC=
T_CNT;
> +	for (; connector_num <=3D crtc_count; connector_num++)
>  		test_combinations(tconf, connector_num);
>  }
>  =

> @@ -824,6 +829,9 @@ static int opt_handler(int opt, int opt_index, void *=
data)
>  	case 'd':
>  		dry_run =3D true;
>  		break;
> +	case 'e':
> +		all_pipes =3D true;
> +		break;
>  	case 't':
>  		filter_test_id =3D atoi(optarg);
>  		break;
> @@ -836,9 +844,10 @@ static int opt_handler(int opt, int opt_index, void =
*data)
>  =

>  const char *help_str =3D
>  	"  -d\t\tDon't run any test, only print what would be done. (still need=
s DRM access)\n"
> -	"  -t <test id>\tRun only the test with this id.";
> +	"  -t <test id>\tRun only the test with this id\n"
> +	"  -e \t\tRun on all pipes. (Default it will Run only two pipes)\n";
>  =

> -igt_main_args("dt:", NULL, help_str, opt_handler, NULL)
> +igt_main_args("det:", NULL, help_str, opt_handler, NULL)
>  {
>  	const struct {
>  		enum test_flags flags;
> -- =

> 2.25.1
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
