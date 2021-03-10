Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617116E1F4
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Mar 2021 12:42:11 +0000 (UTC)
Date: Wed, 10 Mar 2021 14:42:36 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YEi+vJSqnb5UEfBp@platvala-desk.ger.corp.intel.com>
References: <20210310201247.31535-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310201247.31535-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Restrict the hang tests
 execution to two pipes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 11, 2021 at 01:42:47AM +0530, Bhanuprakash Modem wrote:
> To save the CI execution time, instead of running on all pipes
> restrict the hang tests execution to two pipes.
> 
> If we want to execute on all pipes, we need to pass an extra
> argument "-e" indicates extended.
> 
> Example: ./build/tests/kms_flip -e --r flip-vs-modeset-vs-hang
> 
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_flip.c | 52 +++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index e0d009d22..5d47a1c2c 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -85,6 +85,10 @@
>  #define DRM_CAP_TIMESTAMP_MONOTONIC 6
>  #endif
>  
> +/* restricted pipe count */
> +#define CRTC_RESTRICT_CNT 2
> +static bool all_pipes = false;
> +
>  drmModeRes *resources;
>  int drm_fd;
>  static struct buf_ops *bops;
> @@ -1435,10 +1439,17 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>  		__run_test_on_crtc_set(o, crtc_idxs, crtc_count, duration_ms);
>  }
>  
> +static int limit_crtc_count(int count_crtcs)
> +{
> +	return (count_crtcs > CRTC_RESTRICT_CNT)?
> +			CRTC_RESTRICT_CNT : count_crtcs;
> +}
> +
>  static int run_test(int duration, int flags)
>  {
>  	struct test_output o;
>  	int i, n, modes = 0;
> +	int count_crtcs;
>  
>  	igt_require((flags & TEST_HANG) == 0 || !is_wedged(drm_fd));
>  	igt_require(!(flags & TEST_FENCE_STRESS) ||
> @@ -1447,9 +1458,14 @@ static int run_test(int duration, int flags)
>  	resources = drmModeGetResources(drm_fd);
>  	igt_require(resources);
>  
> +	count_crtcs = resources->count_crtcs;
> +	/* Limit the execution to 2 CRTCs for hang tests */
> +	if(!!(flags & TEST_HANG) && !all_pipes)
> +		count_crtcs = limit_crtc_count(count_crtcs);
> +
>  	/* Count output configurations to scale test runtime. */
>  	for (i = 0; i < resources->count_connectors; i++) {
> -		for (n = 0; n < resources->count_crtcs; n++) {
> +		for (n = 0; n < count_crtcs; n++) {
>  			memset(&o, 0, sizeof(o));
>  			o.count = 1;
>  			o._connector[0] = resources->connectors[i];
> @@ -1471,7 +1487,7 @@ static int run_test(int duration, int flags)
>  
>  	/* Find any connected displays */
>  	for (i = 0; i < resources->count_connectors; i++) {
> -		for (n = 0; n < resources->count_crtcs; n++) {
> +		for (n = 0; n < count_crtcs; n++) {
>  			int crtc_idx;
>  
>  			memset(&o, 0, sizeof(o));
> @@ -1494,6 +1510,7 @@ static int run_pair(int duration, int flags)
>  {
>  	struct test_output o;
>  	int i, j, m, n, modes = 0;
> +	int count_crtcs;
>  
>  	igt_require((flags & TEST_HANG) == 0 || !is_wedged(drm_fd));
>  	igt_require(!(flags & TEST_FENCE_STRESS) ||
> @@ -1502,11 +1519,16 @@ static int run_pair(int duration, int flags)
>  	resources = drmModeGetResources(drm_fd);
>  	igt_require(resources);
>  
> +	count_crtcs = resources->count_crtcs;
> +	/* Limit the execution to 2 CRTCs for hang tests */
> +	if(!!(flags & TEST_HANG) && !all_pipes)
> +		count_crtcs = limit_crtc_count(count_crtcs);
> +
>  	/* Find a pair of connected displays */
>  	for (i = 0; i < resources->count_connectors; i++) {
> -		for (n = 0; n < resources->count_crtcs; n++) {
> +		for (n = 0; n < count_crtcs; n++) {
>  			for (j = i + 1; j < resources->count_connectors; j++) {
> -				for (m = n + 1; m < resources->count_crtcs; m++) {
> +				for (m = n + 1; m < count_crtcs; m++) {
>  					memset(&o, 0, sizeof(o));
>  					o.count = 2;
>  					o._connector[0] = resources->connectors[i];
> @@ -1533,9 +1555,9 @@ static int run_pair(int duration, int flags)
>  
>  	/* Find a pair of connected displays */
>  	for (i = 0; i < resources->count_connectors; i++) {
> -		for (n = 0; n < resources->count_crtcs; n++) {
> +		for (n = 0; n < count_crtcs; n++) {
>  			for (j = i + 1; j < resources->count_connectors; j++) {
> -				for (m = n + 1; m < resources->count_crtcs; m++) {
> +				for (m = n + 1; m < count_crtcs; m++) {
>  					int crtc_idxs[2];
>  
>  					memset(&o, 0, sizeof(o));
> @@ -1604,7 +1626,23 @@ static void test_nonblocking_read(int in)
>  	close(fd);
>  }
>  
> -igt_main
> +static int opt_handler(int opt, int opt_index, void *data)
> +{
> +	switch (opt) {
> +		case 'e':
> +			all_pipes = true;
> +			break;
> +		default:
> +			return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =
> +	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
> +
> +igt_main_args("det:", NULL, help_str, opt_handler, NULL)

You handle only 'e' but declare that you support 'd' and 't' as well...

-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
