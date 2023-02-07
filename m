Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 7 Feb 2023 14:25:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230207132519.m6zt5fqjw7jysqdy@kamilkon-desk1>
References: <20230203111636.4138202-1-tvrtko.ursulin@linux.intel.com>
 <20230203111636.4138202-2-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230203111636.4138202-2-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/3] intel_gpu_top: Do not
 repeat header lines in non-interactive output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel-gfx@lists.freedesktop.org, Caleb Callaway <caleb.callaway@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-02-03 at 11:16:34 +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> If output is redirected to a file, or a pipe, lets not repeat the headers
> because that can usually mean user is trying to parse the data later and
> so repeated headers are a hindrance.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Caleb Callaway <caleb.callaway@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_gpu_top.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 0a1de41b3374..e2a7f4753099 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1391,6 +1391,7 @@ static unsigned int stdout_level;
>  
>  #define STDOUT_HEADER_REPEAT 20
>  static unsigned int stdout_lines = STDOUT_HEADER_REPEAT;
> +static bool stdout_header_repeat;
>  
>  static void
>  stdout_open_struct(const char *name)
> @@ -1580,16 +1581,22 @@ static const struct print_operations term_pops = {
>  
>  static bool print_groups(struct cnt_group **groups)
>  {
> -	unsigned int headers = stdout_lines % STDOUT_HEADER_REPEAT + 1;
> +	static bool headers_printed = false;
>  	bool print_data = true;
>  
> -	if (output_mode == STDOUT && (headers == 1 || headers == 2)) {
> -		for (struct cnt_group **grp = groups; *grp; grp++)
> -			print_data = pops->print_group(*grp, headers);
> +	if (output_mode == STDOUT &&
> +	    (stdout_header_repeat || !headers_printed)) {
> +		unsigned int headers = stdout_lines % STDOUT_HEADER_REPEAT + 1;
> +
> +		if (headers == 1 || headers == 2)
> +			for (struct cnt_group **grp = groups; *grp; grp++)
> +				print_data = pops->print_group(*grp, headers);
> +
> +		headers_printed = print_data;
>  	}
>  
>  	for (struct cnt_group **grp = groups; print_data && *grp; grp++)
> -		pops->print_group(*grp, false);
> +		pops->print_group(*grp, 0);
>  
>  	return print_data;
>  }
> @@ -2512,6 +2519,8 @@ int main(int argc, char **argv)
>  		out = stdout;
>  	}
>  
> +	stdout_header_repeat = output_mode == STDOUT && isatty(fileno(out));
> +
>  	if (signal(SIGINT, sigint_handler) == SIG_ERR)
>  		fprintf(stderr, "Failed to install signal handler!\n");
>  
> -- 
> 2.34.1
> 
