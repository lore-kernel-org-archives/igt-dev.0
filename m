Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 10 Oct 2023 18:30:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231010163044.pvbbajwua4jpi26g@kamilkon-desk.igk.intel.com>
References: <20231010110714.749239-1-tvrtko.ursulin@linux.intel.com>
 <20231010110714.749239-2-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231010110714.749239-2-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/4] tools/intel_gpu_top:
 Fix clients header width when no clients
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
On 2023-10-10 at 12:07:11 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Recent refactoring broke the clients header in cases when there are no
> clients displayed. To fix it we need to account the width of the "NAME"
> label.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_gpu_top.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 10601e66b18e..60fe06917531 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1967,6 +1967,8 @@ print_clients_header(struct igt_drm_clients *clients, int lines,
>  		     int con_w, int con_h, int *class_w)
>  {
>  	struct intel_clients *iclients = clients->private_data;
> +	const int max_name_len = clients->max_name_len < 4 ?
> +				 4 : clients->max_name_len; /* At least "NAME" */
>  
>  	if (output_mode == INTERACTIVE) {
>  		unsigned int num_active = 0;
> @@ -1990,9 +1992,8 @@ print_clients_header(struct igt_drm_clients *clients, int lines,
>  					num_active++;
>  			}
>  
> -			*class_w = width =
> -				(con_w - len - clients->max_name_len - 1) /
> -				num_active;
> +			*class_w = width = (con_w - len - max_name_len - 1) /
> +					   num_active;
>  
>  			for (i = 0; i <= iclients->classes.max_engine_id; i++) {
>  				const char *name = iclients->classes.names[i];
> -- 
> 2.39.2
> 
