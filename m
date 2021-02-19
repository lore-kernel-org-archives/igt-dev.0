Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC9F6EB3C
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Feb 2021 14:01:17 +0000 (UTC)
Date: Fri, 19 Feb 2021 16:01:26 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YC/EtvNG2qShjo8N@platvala-desk.ger.corp.intel.com>
References: <20210219114108.29110-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219114108.29110-1-venkata.sai.patnana@intel.com>
Subject: Re: [igt-dev] [PATCH v3 i-g-t] tests/kms_setmode: Restrict the test
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

On Fri, Feb 19, 2021 at 05:11:08PM +0530, venkata.sai.patnana@intel.com wro=
te:
> From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> =

> Restrict execution of all subtests to two pipes(default)
> If you want to execute on all pipes need to pass extra argument(-e)
> Example: ./build/tests/kms_setmode -e --r basic
> =

> V2: Handle when count_crtcs is less than 2 (petri)
> V3: Add helper function for limit_crtc_count (petri)
> =

> Cc: Juha-Pekka Heikkil=E4 <juha-pekka.heikkila@intel.com>
> Cc: Modem Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Latvala Petri <petri.latvala@intel.com>
> Tested-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> ---
>  tests/kms_setmode.c | 35 ++++++++++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 9 deletions(-)
> =

> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 16648087d0..e356bfee13 100644
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
> @@ -747,6 +751,14 @@ static void get_combinations(int n, int k, bool allo=
w_repetitions,
>  	iterate_combinations(n, k, allow_repetitions, 0, 0, &comb, set);
>  }
>  =

> +static int get_limit_crtc_count(int count_crtcs, bool all_pipe)
> +{
> +	if ((count_crtcs <=3D CRTC_RESTRICT_CNT) || all_pipe)

These inner parentheses are not needed. Those can be removed when
merging, no need for a new revision just for those.

If we can get someone to state for the record that limiting the crtc
count doesn't cause a coverage gap (J-P?), this is

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> +		return count_crtcs;
> +	else
> +		return CRTC_RESTRICT_CNT;
> +}
> +
>  static void test_combinations(const struct test_config *tconf,
>  			      int connector_count)
>  {
> @@ -754,6 +766,7 @@ static void test_combinations(const struct test_confi=
g *tconf,
>  	struct combination_set crtc_combs;
>  	struct connector_config *cconfs;
>  	int i;
> +	int crtc_count =3D get_limit_crtc_count(tconf->resources->count_crtcs, =
all_pipes);
>  =

>  	if (connector_count > 2 && (tconf->flags & TEST_STEALING))
>  		return;
> @@ -761,20 +774,19 @@ static void test_combinations(const struct test_con=
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
> @@ -812,9 +824,10 @@ free_cconfs:
>  static void run_test(const struct test_config *tconf)
>  {
>  	int connector_num;
> +	int crtc_count =3D get_limit_crtc_count(tconf->resources->count_crtcs, =
all_pipes);
>  =

>  	connector_num =3D tconf->flags & TEST_CLONE ? 2 : 1;
> -	for (; connector_num <=3D tconf->resources->count_crtcs; connector_num+=
+)
> +	for (; connector_num <=3D crtc_count; connector_num++)
>  		test_combinations(tconf, connector_num);
>  }
>  =

> @@ -824,6 +837,9 @@ static int opt_handler(int opt, int opt_index, void *=
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
> @@ -836,9 +852,10 @@ static int opt_handler(int opt, int opt_index, void =
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

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
