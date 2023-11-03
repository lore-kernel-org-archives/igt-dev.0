Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 3 Nov 2023 19:57:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231103185729.agdu2qkvty22rxwd@kamilkon-desk.igk.intel.com>
References: <20231012081547.852052-1-tvrtko.ursulin@linux.intel.com>
 <20231012081547.852052-8-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231012081547.852052-8-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 7/9] tools/intel_gpu_top: Fully wrap
 clients operations
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
On 2023-10-12 at 09:15:45 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Wrap all operations on clients via the Intel specific wrappers in order to
> simplify upcoming work.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_gpu_top.c | 42 ++++++++++++++++++++++--------------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 091fe28068dc..b2e81d5f9ffb 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -132,6 +132,7 @@ struct engines {
>  struct intel_clients {
>  	const char *pci_slot;
>  	struct igt_drm_client_engines classes;
> +	struct igt_drm_clients *clients;
>  };
>  
>  static struct termios termios_orig;
> @@ -2436,19 +2437,22 @@ intel_init_clients(struct intel_clients *iclients,
>  		iclients->classes.capacity[i] = engines->class[i].num_engines;
>  		iclients->classes.names[i] = strdup(engines->class[i].name);
>  	}
> +
> +	iclients->clients = igt_drm_clients_init(iclients);
>  }
>  
>  static void intel_free_clients(struct intel_clients *iclients)
>  {
> +	if (iclients->clients)
> +		igt_drm_clients_free(iclients->clients);
> +
>  	free((void *)iclients->pci_slot);
>  	free(iclients->classes.capacity);
>  	free(iclients->classes.names);
>  }
>  
> -int main(int argc, char **argv)
> +static void intel_scan_clients(struct intel_clients *iclients)
>  {
> -	unsigned int period_us = DEFAULT_PERIOD_MS * 1000;
> -	struct igt_drm_clients *clients = NULL;
>  	static const char *engine_map[] = {
>  		"render",
>  		"copy",
> @@ -2456,6 +2460,15 @@ int main(int argc, char **argv)
>  		"video-enhance",
>  		"compute",
>  	};
> +
> +	igt_drm_clients_scan(iclients->clients, client_match,
> +			     engine_map, ARRAY_SIZE(engine_map),
> +			     NULL, 0);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	unsigned int period_us = DEFAULT_PERIOD_MS * 1000;
>  	bool physical_engines = false;
>  	struct intel_clients iclients;
>  	int con_w = -1, con_h = -1;
> @@ -2613,15 +2626,11 @@ int main(int argc, char **argv)
>  
>  	init_engine_classes(engines);
>  
> -	if (has_drm_fdinfo(&card)) {
> +	if (has_drm_fdinfo(&card))
>  		intel_init_clients(&iclients, &card, engines);
> -		clients = igt_drm_clients_init(&iclients);
> -	}
>  
>  	pmu_sample(engines);
> -	igt_drm_clients_scan(clients, client_match,
> -			     engine_map, ARRAY_SIZE(engine_map),
> -			     NULL, 0);
> +	intel_scan_clients(&iclients);
>  	gettime(&ts);
>  
>  	if (output_mode == JSON)
> @@ -2652,12 +2661,8 @@ int main(int argc, char **argv)
>  		pmu_sample(engines);
>  		t = (double)(engines->ts.cur - engines->ts.prev) / 1e9;
>  
> -		disp_clients =
> -			display_clients(igt_drm_clients_scan(clients,
> -							     client_match,
> -							     engine_map,
> -							     ARRAY_SIZE(engine_map),
> -							     NULL, 0));
> +		intel_scan_clients(&iclients);
> +		disp_clients = display_clients(iclients.clients);
>  		scan_us = elapsed_us(&ts, period_us);
>  
>  		if (stop_top)
> @@ -2708,7 +2713,7 @@ int main(int argc, char **argv)
>  			pops->close_struct();
>  		}
>  
> -		if (disp_clients != clients)
> +		if (disp_clients != iclients.clients)
>  			free_display_clients(disp_clients);
>  
>  		if (stop_top)
> @@ -2723,10 +2728,7 @@ int main(int argc, char **argv)
>  	if (output_mode == JSON)
>  		printf("]\n");
>  
> -	if (clients) {
> -		igt_drm_clients_free(clients);
> -		intel_free_clients(&iclients);
> -	}
> +	intel_free_clients(&iclients);
>  
>  	free(codename);
>  err_pmu:
> -- 
> 2.39.2
> 
