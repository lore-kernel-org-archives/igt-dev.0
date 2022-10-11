Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EC810E63C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 06:23:03 +0000 (UTC)
Date: Tue, 11 Oct 2022 09:22:42 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <Y0ULsllgX/R0ShLk@platvala-desk.ger.corp.intel.com>
References: <20221010214215.5378-1-umesh.nerlige.ramappa@intel.com>
 <20221010214215.5378-19-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010214215.5378-19-umesh.nerlige.ramappa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 18/36] tools/i915-perf-recorder: add
 ability to select device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 10, 2022 at 09:41:57PM +0000, Umesh Nerlige Ramappa wrote:
> From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> 
> We're starting to have system with multiple Intel GPUs.
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>  tools/i915-perf/i915_perf_recorder.c | 50 ++++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
> index 00195290..7ced7b40 100644
> --- a/tools/i915-perf/i915_perf_recorder.c
> +++ b/tools/i915-perf/i915_perf_recorder.c
> @@ -250,16 +250,37 @@ find_intel_render_node(void)
>  	return -1;
>  }
>  
> +static void
> +print_intel_devices(void)
> +{
> +	fprintf(stdout, "Available devices:\n");
> +	for (int i = 0; i < 128; i++) {
> +		if (read_device_param("card", i, "vendor") == 0x8086) {
> +			uint32_t devid = read_device_param("card", i, "device");
> +			const struct intel_device_info *devinfo =
> +				intel_get_device_info(devid);
> +			fprintf(stdout, "   %i: %s (0x%04hx)\n", i,
> +				devinfo ? devinfo->codename : "unknwon",

Typo, "unknown".

Is there a reason why this doesn't use the same device
filtering/selection machinery that other tools and the tests
themselves are using?


-- 
Petri Latvala



> +				devid);
> +		}
> +	}
> +}
> +
>  static int
> -open_render_node(uint32_t *devid)
> +open_render_node(uint32_t *devid, int card)
>  {
>  	char *name;
>  	int ret;
>  	int fd;
> +	int render;
>  
> -	int render = find_intel_render_node();
> -	if (render < 0)
> -		return -1;
> +	if (card < 0) {
> +		render = find_intel_render_node();
> +		if (render < 0)
> +			return -1;
> +	} else {
> +		render = 128 + card;
> +	}
>  
>  	ret = asprintf(&name, "/dev/dri/renderD%u", render);
>  	assert(ret != -1);
> @@ -722,6 +743,9 @@ usage(const char *name)
>  		"Recording tool for i915-perf.\n"
>  		"\n"
>  		"     --help,               -h          Print this screen\n"
> +		"     --device,             -d <value>  Device to use\n"
> +		"                                       (value=list to list devices\n"
> +		"                                        value=1 to use /dev/dri/card1)\n"
>  		"     --correlation-period, -c <value>  Time period of timestamp correlation in seconds\n"
>  		"                                       (default = 1.0)\n"
>  		"     --perf-period,        -p <value>  Time period of i915-perf reports in seconds\n"
> @@ -772,6 +796,7 @@ main(int argc, char *argv[])
>  {
>  	const struct option long_options[] = {
>  		{"help",                       no_argument, 0, 'h'},
> +		{"device",               required_argument, 0, 'd'},
>  		{"correlation-period",   required_argument, 0, 'c'},
>  		{"perf-period",          required_argument, 0, 'p'},
>  		{"metric",               required_argument, 0, 'm'},
> @@ -798,7 +823,7 @@ main(int argc, char *argv[])
>  	struct timespec now;
>  	uint64_t corr_period_ns, poll_time_ns;
>  	uint32_t circular_size = 0;
> -	int opt;
> +	int opt, dev_node_id = -1;
>  	bool list_counters = false;
>  	FILE *output = NULL;
>  	struct recording_context ctx = {
> @@ -812,7 +837,7 @@ main(int argc, char *argv[])
>  		.poll_period = 5 * 1000 * 1000,
>  	};
>  
> -	while ((opt = getopt_long(argc, argv, "hc:p:m:Co:s:f:k:P:", long_options, NULL)) != -1) {
> +	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:", long_options, NULL)) != -1) {
>  		switch (opt) {
>  		case 'h':
>  			usage(argv[0]);
> @@ -820,6 +845,12 @@ main(int argc, char *argv[])
>  		case 'c':
>  			corr_period = atof(optarg);
>  			break;
> +		case 'd':
> +			if (!strcmp(optarg, "list"))
> +				dev_node_id = -2;
> +			else
> +				dev_node_id = atoi(optarg);
> +			break;
>  		case 'p':
>  			perf_period = atof(optarg);
>  			break;
> @@ -865,7 +896,12 @@ main(int argc, char *argv[])
>  		}
>  	}
>  
> -	ctx.drm_fd = open_render_node(&ctx.devid);
> +	if (dev_node_id == -2) {
> +		print_intel_devices();
> +		return EXIT_SUCCESS;
> +	}
> +
> +	ctx.drm_fd = open_render_node(&ctx.devid, dev_node_id);
>  	if (ctx.drm_fd < 0) {
>  		fprintf(stderr, "Unable to open device.\n");
>  		return EXIT_FAILURE;
> -- 
> 2.25.1
> 
