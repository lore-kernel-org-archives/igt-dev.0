Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00ED66E7D5
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2020 12:22:13 +0000 (UTC)
Date: Fri, 14 Feb 2020 14:22:11 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200214122211.GD25209@platvala-desk.ger.corp.intel.com>
References: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
 <20200212132330.108947-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212132330.108947-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 8/9] lib/chamelium: Add functions to
 initialize XMLRPC only
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 03:23:30PM +0200, Arkadiusz Hiler wrote:
> Let's extract the bit that reads the config and initializes xmlrpc so we
> can do some basic things with chamelium without the need to do port
> auto-discovery and connector mapping.
> 
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  lib/igt_chamelium.c | 90 +++++++++++++++++++++++++++++++++------------
>  lib/igt_chamelium.h |  2 +
>  2 files changed, 69 insertions(+), 23 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 5f9f777c..d5d8dc60 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2294,7 +2294,7 @@ static bool chamelium_autodiscover(struct chamelium *chamelium, int drm_fd)
>  	return true;
>  }
>  
> -static bool chamelium_read_config(struct chamelium *chamelium, int drm_fd)
> +static bool chamelium_read_config(struct chamelium *chamelium)
>  {
>  	GError *error = NULL;
>  
> @@ -2311,10 +2311,7 @@ static bool chamelium_read_config(struct chamelium *chamelium, int drm_fd)
>  		return false;
>  	}
>  
> -	if (!chamelium_read_port_mappings(chamelium, drm_fd)) {
> -		return false;
> -	}
> -	return chamelium_autodiscover(chamelium, drm_fd);
> +	return true;
>  }
>  
>  /**
> @@ -2338,6 +2335,64 @@ static void chamelium_exit_handler(int sig)
>  		chamelium_deinit(cleanup_instance);
>  }
>  
> +/**
> + * chamelium_deinit_rpc_only:
> + * @chamelium: The Chamelium instance to use
> + *
> + * Frees the resources used by a connection to the chamelium that was set up
> + * with #chamelium_init_rpc_only.
> + */
> +void chamelium_deinit_rpc_only(struct chamelium *chamelium)
> +{
> +	xmlrpc_env_clean(&chamelium->env);
> +	free(chamelium);
> +}
> +
> +/**
> + * chamelium_init_rpc_only:
> + *
> + * Sets up a connection with a chamelium, using the URL specified in the
> + * Chamelium configuration. The function initializes only the RPC - no port
> + * autodiscovery happens, which means only the functions that do not require
> + * struct #chamelium_port can be called with an instance produced by this
> + * function.
> + *
> + * #chamelium_init is almost always a better choice.
> + *
> + * Returns: A newly initialized chamelium struct, or NULL on lack of
> + * configuration
> + */
> +struct chamelium *chamelium_init_rpc_only(void)
> +{
> +	struct chamelium *chamelium = malloc(sizeof(struct chamelium));
> +
> +	if (!chamelium)
> +		return NULL;
> +
> +	memset(chamelium, 0, sizeof(*chamelium));
> +
> +	chamelium->drm_fd = -1;
> +
> +	/* Setup the libxmlrpc context */
> +	xmlrpc_env_init(&chamelium->env);
> +	xmlrpc_client_setup_global_const(&chamelium->env);
> +	xmlrpc_client_create(&chamelium->env, XMLRPC_CLIENT_NO_FLAGS, PACKAGE,
> +			     PACKAGE_VERSION, NULL, 0, &chamelium->client);
> +	if (chamelium->env.fault_occurred) {
> +		igt_debug("Failed to init xmlrpc: %s\n",
> +			  chamelium->env.fault_string);
> +		goto error;
> +	}
> +
> +	if (!chamelium_read_config(chamelium))
> +		goto error;
> +
> +	return chamelium;
> +error:
> +	chamelium_deinit_rpc_only(chamelium);
> +	return NULL;
> +}
> +
>  /**
>   * chamelium_init:
>   * @chamelium: The Chamelium instance to use
> @@ -2354,9 +2409,9 @@ static void chamelium_exit_handler(int sig)
>   */
>  struct chamelium *chamelium_init(int drm_fd)
>  {
> -	struct chamelium *chamelium = malloc(sizeof(struct chamelium));
> +	struct chamelium *chamelium = chamelium_init_rpc_only();
>  
> -	if (!chamelium)
> +	if (chamelium == NULL)
>  		return NULL;
>  
>  	/* A chamelium instance was set up previously, so clean it up before
> @@ -2365,34 +2420,23 @@ struct chamelium *chamelium_init(int drm_fd)
>  	if (cleanup_instance)
>  		chamelium_deinit(cleanup_instance);
>  
> -	memset(chamelium, 0, sizeof(*chamelium));
>  	chamelium->drm_fd = drm_fd;
>  	IGT_INIT_LIST_HEAD(&chamelium->edids);
>  
> -	/* Setup the libxmlrpc context */
> -	xmlrpc_env_init(&chamelium->env);
> -	xmlrpc_client_setup_global_const(&chamelium->env);
> -	xmlrpc_client_create(&chamelium->env, XMLRPC_CLIENT_NO_FLAGS, PACKAGE,
> -			     PACKAGE_VERSION, NULL, 0, &chamelium->client);
> -	if (chamelium->env.fault_occurred) {
> -		igt_debug("Failed to init xmlrpc: %s\n",
> -			  chamelium->env.fault_string);
> +	if (!chamelium_read_port_mappings(chamelium, drm_fd))
>  		goto error;
> -	}
>  
> -	if (!chamelium_read_config(chamelium, drm_fd))
> +	if (!chamelium_autodiscover(chamelium, drm_fd))
>  		goto error;
>  
> +

Extra empty line.


Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
