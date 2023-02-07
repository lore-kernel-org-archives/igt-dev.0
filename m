Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 7 Feb 2023 14:15:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230207131541.dd7rfnqcculxplhe@kamilkon-desk1>
References: <20230203111636.4138202-1-tvrtko.ursulin@linux.intel.com>
 <20230203111636.4138202-3-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230203111636.4138202-3-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] intel_gpu_top: Rename STDOUT to TEXT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel-gfx@lists.freedesktop.org, Caleb Callaway <caleb.callaway@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-02-03 at 11:16:35 +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Internal cleanup only - the name text is more accurate given the output
> can also go to a file.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Caleb Callaway <caleb.callaway@intel.com>

Lgtm,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_gpu_top.c | 54 +++++++++++++++++++++----------------------
>  1 file changed, 26 insertions(+), 28 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index e2a7f4753099..a980cc7043dc 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1282,7 +1282,7 @@ usage(const char *appname)
>  
>  static enum {
>  	INTERACTIVE,
> -	STDOUT,
> +	TEXT,
>  	JSON
>  } output_mode;
>  
> @@ -1387,33 +1387,31 @@ json_add_member(const struct cnt_group *parent, struct cnt_item *item,
>  	return 1;
>  }
>  
> -static unsigned int stdout_level;
> +static unsigned int text_level;
>  
> -#define STDOUT_HEADER_REPEAT 20
> -static unsigned int stdout_lines = STDOUT_HEADER_REPEAT;
> -static bool stdout_header_repeat;
> +#define TEXT_HEADER_REPEAT 20
> +static unsigned int text_lines = TEXT_HEADER_REPEAT;
> +static bool text_header_repeat;
>  
> -static void
> -stdout_open_struct(const char *name)
> +static void text_open_struct(const char *name)
>  {
> -	stdout_level++;
> -	assert(stdout_level > 0);
> +	text_level++;
> +	assert(text_level > 0);
>  }
>  
> -static void
> -stdout_close_struct(void)
> +static void text_close_struct(void)
>  {
> -	assert(stdout_level > 0);
> -	if (--stdout_level == 0) {
> -		stdout_lines++;
> +	assert(text_level > 0);
> +	if (--text_level == 0) {
> +		text_lines++;
>  		fputs("\n", out);
>  		fflush(out);
>  	}
>  }
>  
>  static unsigned int
> -stdout_add_member(const struct cnt_group *parent, struct cnt_item *item,
> -		  unsigned int headers)
> +text_add_member(const struct cnt_group *parent, struct cnt_item *item,
> +		unsigned int headers)
>  {
>  	unsigned int fmt_tot = item->fmt_width + (item->fmt_precision ? 1 : 0);
>  	char buf[fmt_tot + 1];
> @@ -1565,10 +1563,10 @@ static const struct print_operations json_pops = {
>  	.print_group = print_group,
>  };
>  
> -static const struct print_operations stdout_pops = {
> -	.open_struct = stdout_open_struct,
> -	.close_struct = stdout_close_struct,
> -	.add_member = stdout_add_member,
> +static const struct print_operations text_pops = {
> +	.open_struct = text_open_struct,
> +	.close_struct = text_close_struct,
> +	.add_member = text_add_member,
>  	.print_group = print_group,
>  };
>  
> @@ -1584,9 +1582,9 @@ static bool print_groups(struct cnt_group **groups)
>  	static bool headers_printed = false;
>  	bool print_data = true;
>  
> -	if (output_mode == STDOUT &&
> -	    (stdout_header_repeat || !headers_printed)) {
> -		unsigned int headers = stdout_lines % STDOUT_HEADER_REPEAT + 1;
> +	if (output_mode == TEXT &&
> +	    (text_header_repeat || !headers_printed)) {
> +		unsigned int headers = text_lines % TEXT_HEADER_REPEAT + 1;
>  
>  		if (headers == 1 || headers == 2)
>  			for (struct cnt_group **grp = groups; *grp; grp++)
> @@ -2492,7 +2490,7 @@ int main(int argc, char **argv)
>  			list_device = true;
>  			break;
>  		case 'l':
> -			output_mode = STDOUT;
> +			output_mode = TEXT;
>  			break;
>  		case 'h':
>  			usage(argv[0]);
> @@ -2505,7 +2503,7 @@ int main(int argc, char **argv)
>  	}
>  
>  	if (output_mode == INTERACTIVE && (output_path || isatty(1) != 1))
> -		output_mode = STDOUT;
> +		output_mode = TEXT;
>  
>  	if (output_path && strcmp(output_path, "-")) {
>  		out = fopen(output_path, "w");
> @@ -2519,7 +2517,7 @@ int main(int argc, char **argv)
>  		out = stdout;
>  	}
>  
> -	stdout_header_repeat = output_mode == STDOUT && isatty(fileno(out));
> +	text_header_repeat = output_mode == TEXT && isatty(fileno(out));
>  
>  	if (signal(SIGINT, sigint_handler) == SIG_ERR)
>  		fprintf(stderr, "Failed to install signal handler!\n");
> @@ -2531,8 +2529,8 @@ int main(int argc, char **argv)
>  		pops = &term_pops;
>  		interactive_stdin();
>  		break;
> -	case STDOUT:
> -		pops = &stdout_pops;
> +	case TEXT:
> +		pops = &text_pops;
>  		break;
>  	case JSON:
>  		pops = &json_pops;
> -- 
> 2.34.1
> 
