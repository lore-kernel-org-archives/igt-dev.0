Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3046910E0C7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 09:15:41 +0000 (UTC)
Date: Tue, 27 Sep 2022 12:15:05 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>
Message-ID: <YzK/GfMQcmg4K0/o@platvala-desk.ger.corp.intel.com>
References: <20220921193629.244296-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220921193629.244296-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] Chamelium: Make autodiscover discover
 connectors one at a time.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, amstan@chromium.org, ihf@google.com,
 igt-dev@lists.freedesktop.org, seanpaul@chromium.org, matthewtlam@google.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 21, 2022 at 03:36:29PM -0400, Mark Yacoub wrote:
> [Why]
> On chamelium v3, the ITE chip can only hold 1 EDID at a time. We can
> only read the last EDID being set after a port is plugged.
> 
> [How]
> On autodiscover, instead of discovering all ports at once by setting
> EDIDs to all at once then read them all, perform the operation on 1 port
> at a time:
> 1. Reset Chamelium to unplug all ports.
> -for each port-
> 2. Create and Apply EDID
> 3. Plug
> 4. Wait for connector to update EDID
> 5. Check if we find the EDID or not.
> -
> 6. Turn on supported ports to bring the system back to the previous
>    state.
> 
> TEST=./kms_chamelium --run-subtest dp-hpd --debug [on intel volteer
> board and Chamelium V3]
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>


This is a little bit of a hit on runtime on v2 using hosts, but it's
some low amount of seconds and only when autodiscovering, which is
basically... when running chamelium tests. Should be fine.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/igt_chamelium.c | 209 ++++++++++++++++++++++++--------------------
>  1 file changed, 114 insertions(+), 95 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index b2ce4174..0fee8a83 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2472,6 +2472,10 @@ static int port_id_from_edid(int drm_fd, drmModeConnector *connector)
>  	const struct edid *edid;
>  	char mfg[3];
>  
> +	/* MST connectors stop being valid on unplug but would still exist in DRM Resources. */
> +	if (!connector)
> +		return -1;
> +
>  	if (connector->connection != DRM_MODE_CONNECTED) {
>  		igt_debug("Skipping auto-discovery for connector %s-%d: "
>  			  "connector status is not connected\n",
> @@ -2524,6 +2528,52 @@ out:
>  	return port_id;
>  }
>  
> +static bool get_connector_id_for_port(struct chamelium *chamelium,
> +				      const int expected_port_id,
> +				      uint32_t *attached_connector_id)
> +{
> +	int i;
> +
> +	int drm_fd = chamelium->drm_fd;
> +	drmModeRes *res = drmModeGetResources(drm_fd);
> +	if (!res)
> +		return false;
> +
> +	for (i = 0; i < res->count_connectors; i++) {
> +		uint32_t conn_id;
> +		size_t j;
> +
> +		/* Read the EDID and parse the Chamelium port ID we stored there. */
> +		drmModeConnector *connector =
> +			drmModeGetConnector(drm_fd, res->connectors[i]);
> +		int port_id = port_id_from_edid(drm_fd, connector);
> +		drmModeFreeConnector(connector);
> +		if (port_id != expected_port_id)
> +			continue;
> +
> +		/* If we already have a mapping from the config file, check that it's consistent. */
> +		conn_id = res->connectors[i];
> +		for (j = 0; j < chamelium->port_count; j++) {
> +			struct chamelium_port *port = &chamelium->ports[j];
> +			if (port->connector_id == conn_id) {
> +				igt_assert_f(
> +					port->id == port_id,
> +					"Inconsistency detected in .igtrc: "
> +					"connector %s is configured with "
> +					"Chamelium port %d, but is "
> +					"connected to port %d\n",
> +					port->name, port->id, port_id);
> +				return false;
> +			}
> +		}
> +
> +		*attached_connector_id = conn_id;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  /**
>   * chamelium_autodiscover: automagically discover the Chamelium port mapping
>   *
> @@ -2533,44 +2583,47 @@ out:
>   * past (see #chamelium_read_port_mappings), but this function provides an
>   * automatic way to do it.
>   *
> - * We will plug all Chamelium ports with a different EDID on each. Then we'll
> - * read the EDID on each DRM connector and infer the Chamelium port ID.
> + * We will plug the Chamelium ports one by one with a different EDID on each. 
> + * Then we'll read the EDID on each DRM connector and infer the Chamelium port ID.
>   */
> -static bool chamelium_autodiscover(struct chamelium *chamelium, int drm_fd)
> +static bool chamelium_autodiscover(struct chamelium *chamelium)
>  {
> -	int candidate_ports[CHAMELIUM_MAX_PORTS];
> -	size_t candidate_ports_len;
> -	drmModeRes *res;
> -	drmModeConnector *connector;
> -	struct chamelium_port *port;
> -	size_t i, j, port_count;
> -	int port_id;
> -	uint32_t conn_id;
> -	struct chamelium_edid *edid;
> -	bool found;
> -	uint32_t discovered_conns[CHAMELIUM_MAX_PORTS] = {0};
> -	char conn_name[64];
>  	struct timespec start;
> +	struct chamelium_edid *edid;
> +	size_t port_count;
> +	size_t i;
> +	bool is_any_port_mapped = false;
>  	uint64_t elapsed_ns;
>  
> -	candidate_ports_len = chamelium_get_video_ports(chamelium,
> -							candidate_ports);
> -
> +	int candidate_ports[CHAMELIUM_MAX_PORTS];
> +	size_t candidate_ports_len =
> +		chamelium_get_video_ports(chamelium, candidate_ports);
>  	igt_assert(candidate_ports_len > 0);
>  
>  	igt_debug("Starting Chamelium port auto-discovery on %zu ports\n",
>  		  candidate_ports_len);
>  	igt_gettime(&start);
>  
> +	/* Reset Chamelium to turn off all ports and test them one at a time. */
> +	chamelium_reset(chamelium);
> +
>  	edid = chamelium_new_edid(chamelium, igt_kms_get_base_edid());
>  
>  	/* Set EDID and plug ports we want to auto-discover */
>  	port_count = chamelium->port_count;
> +	/* Iterate over every port that Chamelium supports and check if it's connected. */
>  	for (i = 0; i < candidate_ports_len; i++) {
> -		port_id = candidate_ports[i];
> -
> -		/* Get or add a chamelium_port slot */
> -		port = NULL;
> +		int j;
> +		int wait_interval_ms, wait_timeout_ms;
> +		bool ret;
> +		drmModeConnector *connector;
> +		uint32_t conn_id = 0;
> +		int drm_fd = chamelium->drm_fd;
> +		char conn_name[64];
> +
> +		int port_id = candidate_ports[i];
> +		/* Get or add a chamelium_port slot - The port could have been created earlier. */
> +		struct chamelium_port *port = NULL;
>  		for (j = 0; j < chamelium->port_count; j++) {
>  			if (chamelium->ports[j].id == port_id) {
>  				port = &chamelium->ports[j];
> @@ -2581,100 +2634,66 @@ static bool chamelium_autodiscover(struct chamelium *chamelium, int drm_fd)
>  			igt_assert(port_count < CHAMELIUM_MAX_PORTS);
>  			port = &chamelium->ports[port_count];
>  			port_count++;
> -
> +			igt_assert(port);
>  			port->id = port_id;
>  		}
>  
> +		/* Chameleon V3 works nicely with EDIDs assigned to ports that are not connected. */
>  		chamelium_port_set_edid(chamelium, port, edid);
>  		chamelium_plug(chamelium, port);
> -	}
> -
> -	igt_info("Sleeping %d seconds for the hotplug to take effect.\n",
> -		 CHAMELIUM_HOTPLUG_DETECTION_DELAY);
> -	sleep(CHAMELIUM_HOTPLUG_DETECTION_DELAY);
> -
> -	/* Reprobe connectors and build the mapping */
> -	res = drmModeGetResources(drm_fd);
> -	if (!res)
> -		return false;
> -
> -	for (i = 0; i < res->count_connectors; i++) {
> -		conn_id = res->connectors[i];
>  
> -		/* Read the EDID and parse the Chamelium port ID we stored
> -		 * there. */
> -		connector = drmModeGetConnector(drm_fd, res->connectors[i]);
> -		port_id = port_id_from_edid(drm_fd, connector);
> -		drmModeFreeConnector(connector);
> -		if (port_id < 0)
> -			continue;
> -
> -		/* If we already have a mapping from the config file, check
> -		 * that it's consistent. */
> -		found = false;
> -		for (j = 0; j < chamelium->port_count; j++) {
> -			port = &chamelium->ports[j];
> -			if (port->connector_id == conn_id) {
> -				found = true;
> -				igt_assert_f(port->id == port_id,
> -					     "Inconsistency detected in .igtrc: "
> -					     "connector %s is configured with "
> -					     "Chamelium port %d, but is "
> -					     "connected to port %d\n",
> -					     port->name, port->id, port_id);
> -				break;
> -			}
> +		/* The ITE chip on Chamelium V3 can only hold 1 EDID at a time, so let's test each port individually. */
> +		wait_interval_ms = 1000;
> +		wait_timeout_ms = CHAMELIUM_HOTPLUG_DETECTION_DELAY * 1000 +
> +				  wait_interval_ms;
> +		igt_info(
> +			"Polling every %f second(s) for %d seconds for the hotplug to take effect.\n",
> +			(float)wait_interval_ms / 1000,
> +			CHAMELIUM_HOTPLUG_DETECTION_DELAY);
> +
> +		ret = igt_wait(get_connector_id_for_port(chamelium, port_id,
> +							 &conn_id),
> +			       wait_timeout_ms, wait_interval_ms);
> +		if (!ret || conn_id < 1) {
> +			igt_info("Failed to auto-discover port %d\n", port_id);
> +			goto unplug_port;
>  		}
> -		if (found)
> -			continue;
> +		is_any_port_mapped = true;
>  
> -		/* We got a new mapping */
> -		found = false;
> -		for (j = 0; j < candidate_ports_len; j++) {
> -			if (port_id == candidate_ports[j]) {
> -				found = true;
> -				discovered_conns[j] = conn_id;
> -				break;
> -			}
> -		}
> -		igt_assert_f(found, "Auto-discovered a port (%d) we haven't "
> -			     "setup\n", port_id);
> -	}
> -
> -	drmModeFreeResources(res);
> -
> -	/* We now have a Chamelium port ID ↔ DRM connector ID mapping:
> -	 * candidate_ports contains the Chamelium port IDs and
> -	 * discovered_conns contains the DRM connector IDs. */
> -	for (i = 0; i < candidate_ports_len; i++) {
> -		port_id = candidate_ports[i];
> -		conn_id = discovered_conns[i];
> -		if (!conn_id) {
> -			continue;
> -		}
> -
> -		port = &chamelium->ports[chamelium->port_count];
> +		/* If we found a connector for our port, increment the number of valid Chamelium ports. */
>  		chamelium->port_count++;
>  
> -		port->id = port_id;
> +		/* With a valid port, assign all of its properties. */
>  		port->type = chamelium_get_port_type(chamelium, port);
>  		port->connector_id = conn_id;
>  		port->adapter_allowed = false;
> +		chamelium_set_port_path(port, conn_id, drm_fd);
>  
> +		/* Get and assign Connector name. */
>  		connector = drmModeGetConnectorCurrent(drm_fd, conn_id);
>  		snprintf(conn_name, sizeof(conn_name), "%s-%u",
> -				 kmstest_connector_type_str(connector->connector_type),
> -				 connector->connector_type_id);
> +			 kmstest_connector_type_str(connector->connector_type),
> +			 connector->connector_type_id);
>  		drmModeFreeConnector(connector);
>  		port->name = strdup(conn_name);
> -		chamelium_set_port_path(port, port->connector_id, drm_fd);
> +
> +unplug_port:
> +		/* Unplug the port so we can move on to the next one. */
> +		chamelium_unplug(chamelium, port);
>  	}
>  
> +	/* After we're all set, turn on all supported ports */
> +	for (i = 0; i < chamelium->port_count; i++) {
> +		struct chamelium_port *port = &chamelium->ports[i];
> +		chamelium_plug(chamelium, port);
> +	}
> +	sleep(CHAMELIUM_HOTPLUG_DETECTION_DELAY);
> +
>  	elapsed_ns = igt_nsec_elapsed(&start);
> -	igt_debug("Auto-discovery took %fms\n",
> -		  (float) elapsed_ns / (1000 * 1000));
> +	igt_debug("Auto-discovery took %fms and found %i connector(s)\n",
> +		  (float)elapsed_ns / (1000 * 1000), chamelium->port_count);
>  
> -	return true;
> +	return is_any_port_mapped;
>  }
>  
>  static bool chamelium_read_config(struct chamelium *chamelium)
> @@ -2828,7 +2847,7 @@ struct chamelium *chamelium_init(int drm_fd)
>  		igt_info("Chamelium configured without port mapping, "
>  			 "performing autodiscovery\n");
>  
> -		if (!chamelium_autodiscover(chamelium, drm_fd))
> +		if (!chamelium_autodiscover(chamelium))
>  			goto error;
>  
>  		if (chamelium->port_count != 0)
> -- 
> 2.37.3.998.g577e59143f-goog
> 
