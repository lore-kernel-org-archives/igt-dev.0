Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 26 Jan 2023 16:48:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230126154854.evcd2ej357u5ifbo@kamilkon-desk1>
References: <20230112174730.1101192-1-tvrtko.ursulin@linux.intel.com>
 <20230112174730.1101192-4-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230112174730.1101192-4-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 3/4] intel_gpu_top: Add
 command line switch to start in physical engine mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org,
 Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-01-12 at 17:47:29 +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Default mode is to aggreate engines per class but some users would prefer
> to be able to start in physical engine mode too.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  man/intel_gpu_top.rst | 3 +++
>  tools/intel_gpu_top.c | 9 +++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
> index 3317e04816b4..b24216c0ae91 100644
> --- a/man/intel_gpu_top.rst
> +++ b/man/intel_gpu_top.rst
> @@ -48,6 +48,9 @@ OPTIONS
>  -d
>      Select a specific GPU using supported filter.
>  
> +-p
> +   Default to showing physical engines instead of classes.
> +
>  RUNTIME CONTROL
>  ===============
>  
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index c4d98de4fe31..e91b47baf72b 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1268,6 +1268,7 @@ usage(const char *appname)
>  		"\t[-s <ms>]       Refresh period in milliseconds (default %ums).\n"
>  		"\t[-L]            List all cards.\n"
>  		"\t[-d <device>]   Device filter, please check manual page for more details.\n"
> +		"\t[-p]            Default to showing physical engines instead of classes.\n"
>  		"\n",
>  		appname, DEFAULT_PERIOD_MS);
>  	igt_device_print_filter_types();
> @@ -2446,6 +2447,7 @@ int main(int argc, char **argv)
>  {
>  	unsigned int period_us = DEFAULT_PERIOD_MS * 1000;
>  	struct clients *clients = NULL;
> +	bool physical_engines = false;
>  	int con_w = -1, con_h = -1;
>  	char *output_path = NULL;
>  	struct engines *engines;
> @@ -2456,7 +2458,7 @@ int main(int argc, char **argv)
>  	char *codename = NULL;
>  
>  	/* Parse options */
> -	while ((ch = getopt(argc, argv, "o:s:d:JLlh")) != -1) {
> +	while ((ch = getopt(argc, argv, "o:s:d:pJLlh")) != -1) {
>  		switch (ch) {
>  		case 'o':
>  			output_path = optarg;
> @@ -2467,6 +2469,9 @@ int main(int argc, char **argv)
>  		case 'd':
>  			opt_device = strdup(optarg);
>  			break;
> +		case 'p':
> +			physical_engines = true;
> +			break;
>  		case 'J':
>  			output_mode = JSON;
>  			break;
> @@ -2508,7 +2513,7 @@ int main(int argc, char **argv)
>  	case INTERACTIVE:
>  		pops = &term_pops;
>  		interactive_stdin();
> -		class_view = true;
> +		class_view = !physical_engines;
>  		break;
>  	case STDOUT:
>  		pops = &stdout_pops;
> -- 
> 2.34.1
> 
