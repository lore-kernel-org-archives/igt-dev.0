Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA746EA5B
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2020 19:53:45 +0000 (UTC)
Date: Thu, 7 May 2020 22:53:05 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200507195305.GB10497@ideak-desk.fi.intel.com>
References: <20200506155803.358220-1-arkadiusz.hiler@intel.com>
 <20200506155803.358220-2-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506155803.358220-2-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_kms: Make
 igt_display_require() + chamelium more robust
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, May 06, 2020 at 06:58:03PM +0300, Arkadiusz Hiler wrote:
> 1. We don't reset Chamelium, as this generates extra unplug events if
>    any of the ports is already connected which is often the case
> 
> 2. We try to plug all the chamelium ports, it's a noop if they are
>    already plugged
> 
> 2. We wait for all the ports being connected:
>    - if the port mapping is provided: wait for the ports to be connected
>    - if there is no mapping: sleep(10) and hope for the best
> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  lib/igt_chamelium.c | 87 +++++++++++++++++++++++++++++++++++++++------
>  lib/igt_chamelium.h |  2 ++
>  lib/igt_kms.c       |  2 ++
>  3 files changed, 80 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 28be5248..69ad8378 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2532,17 +2532,6 @@ bool chamelium_plug_all(struct chamelium *chamelium)
>  	size_t port_count;
>  	int port_ids[CHAMELIUM_MAX_PORTS];
>  	xmlrpc_value *v;
> -	v = __chamelium_rpc(chamelium, NULL, "Reset", "()");
> -
> -	if (v != NULL)
> -		xmlrpc_DECREF(v);
> -
> -	if (chamelium->env.fault_occurred) {
> -		igt_debug("Chamelium RPC call failed: %s\n",
> -		     chamelium->env.fault_string);
> -
> -		return false;
> -	}

The reset could've been added for some stability issue in Chamelium, so
imo better to remove it in a separate patch.

>  	port_count = chamelium_get_video_ports(chamelium, port_ids);
>  	if (port_count <= 0)
> @@ -2565,6 +2554,82 @@ bool chamelium_plug_all(struct chamelium *chamelium)
>  	return true;
>  }
>  
> +bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium, int drm_fd)
> +{
> +	drmModeRes *res;
> +	drmModeConnector *connector;
> +	char **group_list;
> +	char *group;
> +	bool ret = true;
> +
> +	int connectors[CHAMELIUM_MAX_PORTS];
> +	int connectors_count = 0;
> +
> +	res = drmModeGetResources(drm_fd);
> +
> +	group_list = g_key_file_get_groups(igt_key_file, NULL);
> +
> +	for (int i = 0; group_list[i] != NULL; i++) {
> +		char *map_name;
> +		group = group_list[i];
> +
> +		if (!strstr(group, "Chamelium:"))
> +			continue;
> +
> +		igt_assert(chamelium->port_count <= CHAMELIUM_MAX_PORTS);
> +
> +		map_name = group + (sizeof("Chamelium:") - 1);
> +
> +		for (int j = 0;
> +		     j < res->count_connectors;
> +		     j++) {
> +			char name[50];
> +
> +			connector = drmModeGetConnectorCurrent(
> +			    drm_fd, res->connectors[j]);
> +
> +			/* We have to generate the connector name on our own */
> +			snprintf(name, 50, "%s-%u",
> +				 kmstest_connector_type_str(connector->connector_type),
> +				 connector->connector_type_id);
> +
> +
> +			if (strcmp(name, map_name) == 0) {
> +				igt_assert(connectors_count < CHAMELIUM_MAX_PORTS);
> +				connectors[connectors_count++] = connector->connector_id;
> +				break;
> +			}
> +
> +			drmModeFreeConnector(connector);
> +		}
> +	}
> +
> +	drmModeFreeResources(res);

Couldn't you reuse chamelium_read_port_mappings()?

> +	if (connectors_count == 0) {
> +		igt_info("No chamelium port mappping, sleeping for %d seconds "
> +			 "for the hotplug to take effect",
> +			 CHAMELIUM_HOTPLUG_DETECTION_DELAY);
> +		sleep(CHAMELIUM_HOTPLUG_DETECTION_DELAY);
> +		return true;
> +	}

In igt_chamlium this makes the startup delay 20 sec now with the
detection delay added in the previous patch.

Would it make sense to change autodiscover to retry detection for 10 sec
instead, which you could call from here? Then you could also call
autodiscover without the unconditional sleep in the previous patch.

> +
> +	igt_until_timeout(CHAMELIUM_HOTPLUG_DETECTION_DELAY) {
> +		ret = true;
> +		for (int i = 0; i < connectors_count; ++i) {
> +			connector = drmModeGetConnector(drm_fd, connectors[i]);
> +			if (connector->connection != DRM_MODE_CONNECTED)
> +				ret = false;
> +			drmModeFreeConnector(connector);
> +		}
> +
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
>  igt_constructor {
>  	/* Frame dumps can be large, so we need to be able to handle very large
>  	 * responses
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index c29741b4..359f4ab3 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -215,5 +215,7 @@ void chamelium_destroy_frame_dump(struct chamelium_frame_dump *dump);
>  void chamelium_destroy_audio_file(struct chamelium_audio_file *audio_file);
>  void chamelium_infoframe_destroy(struct chamelium_infoframe *infoframe);
>  bool chamelium_plug_all(struct chamelium *chamelium);
> +bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
> +						   int drm_fd);
>  
>  #endif /* IGT_CHAMELIUM_H */
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e9621e7e..d4cbc1c5 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1899,6 +1899,8 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  				       "cannot reach the configured chamelium!\n");
>  			igt_abort_on_f(!chamelium_plug_all(chamelium),
>  				       "failed to plug all the chamelium ports!\n");
> +			igt_abort_on_f(!chamelium_wait_all_configured_ports_connected(chamelium, drm_fd),
> +				       "not all configured chamelium ports are connected!\n");
>  			chamelium_deinit_rpc_only(chamelium);
>  		}
>  	}
> -- 
> 2.25.2
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
