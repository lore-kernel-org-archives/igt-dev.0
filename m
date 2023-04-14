Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 14 Apr 2023 17:26:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230414152640.dlxtiibthvjyby6a@kamilkon-desk1>
References: <20230328125429.1970202-1-tvrtko.ursulin@linux.intel.com>
 <20230328125429.1970202-3-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230328125429.1970202-3-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] intel_gpu_top: Use full console
 width for global metrics
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-03-28 at 13:54:28 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> It appears we had an off by one of a kind where we were not using the full
> width of the terminal window for the global metrics section.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_gpu_top.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 39be916297e4..36da016c3df0 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1960,8 +1960,7 @@ print_engines_header(struct engines *engines, double t,
>  				a = "          ENGINE     BUSY  ";
>  
>  			printf("\033[7m%s%*s%s\033[0m\n",
> -			       a, (int)(con_w - 1 - strlen(a) - strlen(b)),
> -			       " ", b);
> +			       a, (int)(con_w - strlen(a) - strlen(b)), " ", b);
>  
>  			lines++;
>  		}
> @@ -2000,7 +1999,6 @@ print_engine(struct engines *engines, unsigned int i, double t,
>  	print_groups(groups);
>  
>  	if (output_mode == INTERACTIVE) {
> -		unsigned int max_w = con_w - 1;
>  		unsigned int len;
>  		char buf[128];
>  		double val;
> @@ -2012,7 +2010,7 @@ print_engine(struct engines *engines, unsigned int i, double t,
>  			      engine->display_name, engine_items[0].buf);
>  
>  		val = pmu_calc(&engine->busy.val, 1e9, t, 100);
> -		print_percentage_bar(val, max_w > len ? max_w - len : 0, false);
> +		print_percentage_bar(val, con_w > len ? con_w - len : 0, false);
>  
>  		printf("%s\n", buf);
>  
> -- 
> 2.37.2
> 
