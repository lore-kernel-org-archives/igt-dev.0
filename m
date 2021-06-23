Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220726E8A5
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jun 2021 10:28:59 +0000 (UTC)
Date: Wed, 23 Jun 2021 12:28:53 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210623102853.GA52740@zkempczy-mobl2>
References: <20210623101635.379278-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210623101635.379278-1-lionel.g.landwerlin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tools/i915-perf-recorder: add ability
 to select device
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 01:16:35PM +0300, Lionel Landwerlin wrote:
> We're starting to have system with multiple Intel GPUs.
> 
>   $ i915-perf-recorder --device list
>   Available devices:
>      0: tigerlake (0x9a49)
> 
>   $ i915-perf-recorder --device 0

Why not to incorporate our current device selection? If you're afraid
of linking just take a look how intel_gpu_top does.

--
Zbigniew

> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>  tools/i915-perf/i915_perf_recorder.c | 50 ++++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
> index 00195290b..3bf6dd693 100644
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
                                                               ^^^^^^^ type btw
> +				devid);
> +		}
> +	}
> +}
> +
>  static int
> -open_render_node(uint32_t *devid)
> +open_render_node(uint32_t *devid, int node_offset)
>  {
>  	char *name;
>  	int ret;
>  	int fd;
> +        int render;
>  
> -	int render = find_intel_render_node();
> -	if (render < 0)
> -		return -1;
> +        if (node_offset < 0) {
> +                render = find_intel_render_node();
> +                if (render < 0)
> +                        return -1;
> +	} else {
> +                render = 128 + node_offset;
> +        }
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
> +	int opt, dev_node_offset = -1;
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
> +				dev_node_offset = -2;
> +			else
> +				dev_node_offset = atoi(optarg);
> +			break;
>  		case 'p':
>  			perf_period = atof(optarg);
>  			break;
> @@ -865,7 +896,12 @@ main(int argc, char *argv[])
>  		}
>  	}
>  
> -	ctx.drm_fd = open_render_node(&ctx.devid);
> +	if (dev_node_offset == -2) {
> +		print_intel_devices();
> +		return EXIT_SUCCESS;
> +	}
> +
> +	ctx.drm_fd = open_render_node(&ctx.devid, dev_node_offset);
>  	if (ctx.drm_fd < 0) {
>  		fprintf(stderr, "Unable to open device.\n");
>  		return EXIT_FAILURE;
> -- 
> 2.30.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
