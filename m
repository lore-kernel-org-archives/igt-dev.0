Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 26 Jan 2023 16:50:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230126155017.hx37o7gmvolcah5p@kamilkon-desk1>
References: <20230112174730.1101192-1-tvrtko.ursulin@linux.intel.com>
 <20230112174730.1101192-5-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230112174730.1101192-5-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 4/4] intel_gpu_top:
 Aggregate engine classes in all output modes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-01-12 at 17:47:30 +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Use the same default for stdout and JSON output modes as it is for
> interactive.
> 
> Previously added command line switch can be used to go back to showing all
> physical engines.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_gpu_top.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index e91b47baf72b..7aa233570463 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -2509,11 +2509,12 @@ int main(int argc, char **argv)
>  	if (signal(SIGINT, sigint_handler) == SIG_ERR)
>  		fprintf(stderr, "Failed to install signal handler!\n");
>  
> +	class_view = !physical_engines;
> +
>  	switch (output_mode) {
>  	case INTERACTIVE:
>  		pops = &term_pops;
>  		interactive_stdin();
> -		class_view = !physical_engines;
>  		break;
>  	case STDOUT:
>  		pops = &stdout_pops;
> -- 
> 2.34.1
> 
