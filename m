Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053DE89308
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 09:52:06 +0000 (UTC)
References: <20200313195316.7494-1-umesh.nerlige.ramappa@intel.com>
 <20200313195316.7494-4-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <6774f930-2ec7-68e5-1e88-2f557499d335@intel.com>
Date: Mon, 16 Mar 2020 11:52:00 +0200
MIME-Version: 1.0
In-Reply-To: <20200313195316.7494-4-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tools: Allow user to set poll delay
 in i915 perf recorder
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 13/03/2020 21:53, Umesh Nerlige Ramappa wrote:
> Add poll delay parameter to the i915-perf-recorder tool so that the user
> can set the frequency of the poll timer that checks for available
> reports in the OA buffer.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Couple of nits below.

Either way :

Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>


Thanks!

> ---
>   tools/i915-perf/i915_perf_recorder.c | 37 +++++++++++++++++++++++++---
>   1 file changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
> index 6bbc451e..60b7b732 100644
> --- a/tools/i915-perf/i915_perf_recorder.c
> +++ b/tools/i915-perf/i915_perf_recorder.c
> @@ -353,14 +353,31 @@ struct recording_context {
>   
>   	const char *command_fifo;
>   	int command_fifo_fd;
> +
> +	uint32_t poll_delay;
Maybe just use a uint64_t as it's the type used by the kernel interface.
>   };
>   
> +static int
> +perf_revision(int drm_fd)
> +{
> +	drm_i915_getparam_t gp;
> +	int value = 1;
> +
> +	gp.param = I915_PARAM_PERF_REVISION;
> +	gp.value = &value;
> +	perf_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp);
> +
> +	return value;
> +}
> +
>   static int
>   perf_open(struct recording_context *ctx)
>   {
>   	uint64_t properties[DRM_I915_PERF_PROP_MAX * 2];
>   	struct drm_i915_perf_open_param param;
> -	int p = 0, stream_fd;
> +	int p = 0, stream_fd, revision;
> +
> +	revision = perf_revision(ctx->drm_fd);
>   
>   	properties[p++] = DRM_I915_PERF_PROP_SAMPLE_OA;
>   	properties[p++] = true;
> @@ -374,6 +391,11 @@ perf_open(struct recording_context *ctx)
>   	properties[p++] = DRM_I915_PERF_PROP_OA_EXPONENT;
>   	properties[p++] = ctx->oa_exponent;
>   
> +	if (revision >= 4) {
> +		properties[p++] = DRM_I915_PERF_PROP_POLL_OA_DELAY;
> +		properties[p++] = ctx->poll_delay;
> +	}
> +
>   	memset(&param, 0, sizeof(param));
>   	param.flags = 0;
>   	param.flags |= I915_PERF_FLAG_FD_CLOEXEC | I915_PERF_FLAG_FD_NONBLOCK;
> @@ -720,7 +742,10 @@ usage(const char *name)
>   		"                                       (To use with i915-perf-control)\n"
>   		"     --output,             -o <path>   Output file (default = i915_perf.record)\n"
>   		"     --cpu-clock,          -k <path>   Cpu clock to use for correlations\n"
> -		"                                       Values: boot, mono, mono_raw (default = mono)\n",
> +		"                                       Values: boot, mono, mono_raw (default = mono)\n"
> +		"     --poll-delay          -P <value>  Polling interval in microseconds used by a timer in the driver to query\n"
> +		"                                       for OA reports periodically\n"
> +		"                                       (default = 5000), Minimum = 100.\n",
>   		name);
>   }
>   
> @@ -762,6 +787,7 @@ main(int argc, char *argv[])
>   		{"size",                 required_argument, 0, 's'},
>   		{"command-fifo",         required_argument, 0, 'f'},
>   		{"cpu-clock",            required_argument, 0, 'k'},
> +		{"poll-delay",           required_argument, 0, 'P'},
>   		{0, 0, 0, 0}
>   	};
>   	const struct {
> @@ -788,9 +814,11 @@ main(int argc, char *argv[])
>   
>   		.command_fifo = I915_PERF_RECORD_FIFO_PATH,
>   		.command_fifo_fd = -1,
> +
> +		.poll_delay = 5 * 1000 * 1000,
>   	};
>   
> -	while ((opt = getopt_long(argc, argv, "hc:p:m:Co:s:f:k:", long_options, NULL)) != -1) {
> +	while ((opt = getopt_long(argc, argv, "hc:p:m:Co:s:f:k:P:", long_options, NULL)) != -1) {
>   		switch (opt) {
>   		case 'h':
>   			usage(argv[0]);
> @@ -832,6 +860,9 @@ main(int argc, char *argv[])
>   			}
>   			break;
>   		}
> +		case 'P':
> +			ctx.poll_delay = MAX(100, atoi(optarg)) * 1000;
atol() just to be sure?
> +			break;
>   		default:
>   			fprintf(stderr, "Internal error: "
>   				"unexpected getopt value: %d\n", opt);


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
