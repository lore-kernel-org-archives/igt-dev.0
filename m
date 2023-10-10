Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 10 Oct 2023 18:43:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231010164336.dikudseydggrrux7@kamilkon-desk.igk.intel.com>
References: <20231010110714.749239-1-tvrtko.ursulin@linux.intel.com>
 <20231010110714.749239-5-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231010110714.749239-5-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 4/4] tools/intel_gpu_top:
 Handle narrow terminals more gracefully
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Tvrtko,
On 2023-10-10 at 12:07:14 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Instead of asserting just skip trying to print columns when terminal is
> too narrow.
> 
> At the same time fix some type confusion to fix calculations going huge.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/143

Did you tested this in screensaver? I mean running intel_gpu_top
in terminal windows under X (Gnome or other) and leaving desktop
unattanded, entering screen saver mode (possible with screen
turned off) and then re-enabling screen?

> ---
>  tools/intel_gpu_top.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 472ce3f13ba9..6d1397cb8214 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -926,7 +926,7 @@ static void free_display_clients(struct igt_drm_clients *clients)
>  	free(clients);
>  }
>  
> -static unsigned int n_spaces(const unsigned int n)
> +static int n_spaces(const int n)
--------- ^^^
Could you make it int at your first patch touching this function?

With or without this suggestion,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  {
>  	static const char *spaces[] = {
>  		" ",
> @@ -950,7 +950,7 @@ static unsigned int n_spaces(const unsigned int n)
>  		"                   ",
>  #define MAX_SPACES 19
>  	};
> -	unsigned int i, r = n;
> +	int i, r = n;
>  
>  	while (r) {
>  		if (r > MAX_SPACES)
> @@ -972,7 +972,8 @@ print_percentage_bar(double percent, double max, int max_len, bool numeric)
>  	int bar_len, i, len = max_len - 2;
>  	const int w = 8;
>  
> -	assert(max_len > 0);
> +	if (len < 2) /* For edge lines '|' */
> +		return;
>  
>  	bar_len = ceil(w * percent * len / max);
>  	if (bar_len > w * len)
> @@ -986,6 +987,8 @@ print_percentage_bar(double percent, double max, int max_len, bool numeric)
>  		printf("%s", bars[i]);
>  
>  	len -= (bar_len + (w - 1)) / w;
> +	if (len < 1)
> +		return;
>  	n_spaces(len);
>  
>  	putchar('|');
> @@ -2001,8 +2004,7 @@ print_clients_header(struct igt_drm_clients *clients, int lines,
>  				 4 : clients->max_name_len; /* At least "NAME" */
>  
>  	if (output_mode == INTERACTIVE) {
> -		unsigned int num_active = 0;
> -		int len;
> +		int len, num_active = 0;
>  
>  		if (lines++ >= con_h)
>  			return lines;
> -- 
> 2.39.2
> 
