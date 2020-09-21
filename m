Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3556E24D
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2020 08:01:45 +0000 (UTC)
Date: Mon, 21 Sep 2020 11:01:40 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200921080140.GI7444@platvala-desk.ger.corp.intel.com>
References: <20200920185615.133623-1-kunal1.joshi@intel.com>
 <20200920185615.133623-2-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200920185615.133623-2-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/4] Make basic chamelium function
 accessible to other tests
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 12:26:12AM +0530, Kunal Joshi wrote:
> There are many use case where we can integrate chamelium with other tests,
> Migrating some of basic chamelium functions to igt_chamelium lib to avoid
> Code rewriting.
> 
> v2: Moved one more function reset_state from tests/kms_chamelium to
> lib/igt_chamelium.
> 
> v3: - Shifted disabling of modeset to igt_kms
>     - Replace connection_str with kmstest_connector_status_str (Petri)
>     - Generalized require__connector_present (Petri)
>     - Avoided using data_chamelium_t struct (Petri)
> 
> v4: - Moved function to library (Petri)
>     - Renamed some functions and added documentation (Petri)
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  lib/igt_chamelium.c   | 186 ++++++++++++++++++++++++++++
>  lib/igt_chamelium.h   |  40 ++++++
>  lib/igt_kms.c         |  23 ++++
>  lib/igt_kms.h         |   1 +
>  tests/kms_chamelium.c | 281 ++++++++++++------------------------------
>  5 files changed, 329 insertions(+), 202 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index d9fab902..0dddbe6f 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -218,6 +218,137 @@ const char *chamelium_port_get_name(struct chamelium_port *port)
>  	return port->name;
>  }
>  
> +/**
> + * chamelium_require_connector_present
> + * @ports: All connected ports
> + * @type: Required port type
> + * @port_count: Total port count
> + * @count: The required number of port count
> + *
> + * Check there are required ports connected of given type
> + */
> +void
> +chamelium_require_connector_present(struct chamelium_port **ports,
> +				    unsigned int type,
> +				    int port_count,
> +				    int count)
> +{
> +	int i;
> +	int found = 0;
> +
> +	for (i = 0; i < port_count; i++) {
> +		if (chamelium_port_get_type(ports[i]) == type)
> +			found++;
> +	}
> +
> +	igt_require_f(found == count,
> +		      "port of type %s found %d and required %d\n",
> +		      kmstest_connector_type_str(type), found, count);
> +}
> +
> +/**
> + * chamelium_reprobe_connector
> + * @display: A pointer to an #igt_display_t structure
> + * @chamelium: The Chamelium instance to use
> + * @port: Chamelium port to reprobe
> + *
> + *  Reprobe the given connector and fetch current status
> + *
> + *  Returns: drmModeConnection
> + */
> +drmModeConnection
> +chamelium_reprobe_connector(igt_display_t *display,
> +			    struct chamelium *chamelium,
> +			    struct chamelium_port *port)
> +{
> +	drmModeConnector *connector;
> +	drmModeConnection status;
> +	igt_output_t *output;
> +
> +	igt_debug("Reprobing %s...\n", chamelium_port_get_name(port));
> +	connector = chamelium_port_get_connector(chamelium, port, true);
> +	igt_assert(connector);
> +	status = connector->connection;
> +
> +	/* let's make sure that igt_display is up to date too */
> +	output = igt_output_from_connector(display, connector);
> +	output->force_reprobe = true;
> +	igt_output_refresh(output);
> +
> +	drmModeFreeConnector(connector);
> +	return status;
> +}
> +
> +/**
> + * chamelium_wait_for_conn_status_change
> + * @display: A pointer to an #igt_display_t structure
> + * @chamelium: The Chamelium instance to use
> + * @port: Chamelium port to check connector status update
> + * @status: Enum which describes connector states
> + *
> + * Wait for the connector to change the status
> + */
> +void
> +chamelium_wait_for_conn_status_change(igt_display_t *display,
> +			     struct chamelium *chamelium,
> +			     struct chamelium_port *port,
> +			     drmModeConnection status)
> +{
> +	igt_debug("Waiting for %s to get %s...\n",
> +			  chamelium_port_get_name(port),
> +			  kmstest_connector_status_str(status));
> +
> +	/*
> +	 * Rely on simple reprobing so we don't fail tests that don't require
> +	 * that hpd events work in the event that hpd doesn't work on the system
> +	 */
> +	igt_until_timeout(HOTPLUG_TIMEOUT) {
> +		if (chamelium_reprobe_connector(display,
> +						chamelium, port) == status)
> +			return;
> +
> +		usleep(50000);
> +	}
> +
> +	igt_assert_f(false, "Timed out waiting for %s to get %s\n",
> +				 chamelium_port_get_name(port),
> +				 kmstest_connector_status_str(status));
> +}
> +
> +/**
> + * chamelium_reset_state
> + *
> + * @chamelium: The Chamelium instance to use
> + * @port: Chamelium port to reset
> + * @ports: All connected ports
> + * @port_count: Count of connected ports
> + *
> + * Reset chamelium ports
> + */
> +void
> +chamelium_reset_state(igt_display_t *display,
> +		      struct chamelium *chamelium,
> +		      struct chamelium_port *port,
> +		      struct chamelium_port **ports,
> +		      int port_count)
> +{
> +	int p;
> +
> +	chamelium_reset(chamelium);
> +
> +	if (port) {
> +		chamelium_wait_for_conn_status_change(display, chamelium,
> +						      port,
> +						      DRM_MODE_DISCONNECTED);
> +	} else {
> +		for (p = 0; p < port_count; p++) {
> +			port = ports[p];
> +			chamelium_wait_for_conn_status_change(display, chamelium,
> +							      port, DRM_MODE_DISCONNECTED);
> +		}
> +	}
> +}
> +
>  /**
>   * chamelium_destroy_frame_dump:
>   * @dump: The frame dump to destroy
> @@ -627,6 +758,61 @@ void chamelium_schedule_hpd_toggle(struct chamelium *chamelium,
>  				    "(iii)", port->id, delay_ms, rising_edge));
>  }
>  
> +const struct edid *chamelium_get_aspect_ratio_edid(void)
> +{
> +	static unsigned char raw_edid[2 * EDID_BLOCK_SIZE] = {0};
> +	struct edid *edid;
> +	struct edid_ext *edid_ext;
> +	struct edid_cea *edid_cea;
> +	char *cea_data;
> +	struct edid_cea_data_block *block;
> +	size_t cea_data_size = 0, vsdb_size;
> +	const struct cea_vsdb *vsdb;
> +
> +	edid = (struct edid *) raw_edid;
> +	memcpy(edid, igt_kms_get_base_edid(), sizeof(struct edid));
> +	edid->extensions_len = 1;
> +	edid_ext = &edid->extensions[0];
> +	edid_cea = &edid_ext->data.cea;
> +	cea_data = edid_cea->data;
> +
> +	/* The HDMI VSDB advertises support for InfoFrames */
> +	block = (struct edid_cea_data_block *) &cea_data[cea_data_size];
> +	vsdb = cea_vsdb_get_hdmi_default(&vsdb_size);
> +	cea_data_size += edid_cea_data_block_set_vsdb(block, vsdb,
> +						      vsdb_size);
> +
> +	/* Short Video Descriptor */
> +	block = (struct edid_cea_data_block *) &cea_data[cea_data_size];
> +	cea_data_size += edid_cea_data_block_set_svd(block, edid_ar_svds,
> +						     sizeof(edid_ar_svds));
> +
> +	assert(cea_data_size <= sizeof(edid_cea->data));
> +
> +	edid_ext_set_cea(edid_ext, cea_data_size, 0, 0);
> +
> +	edid_update_checksum(edid);
> +
> +	return edid;
> +}

Hmm, is there anything actually chamelium-specific for this edid?


> +
> +const struct edid *chamelium_get_edid(enum test_edid edid)
> +{
> +	switch (edid) {
> +	case TEST_EDID_BASE:
> +		return igt_kms_get_base_edid();
> +	case TEST_EDID_ALT:
> +		return igt_kms_get_alt_edid();
> +	case TEST_EDID_HDMI_AUDIO:
> +		return igt_kms_get_hdmi_audio_edid();
> +	case TEST_EDID_DP_AUDIO:
> +		return igt_kms_get_dp_audio_edid();
> +	case TEST_EDID_ASPECT_RATIO:
> +		return chamelium_get_aspect_ratio_edid();
> +	}
> +	assert(0); /* unreachable */
> +}

Same here, doesn't look like chamelium-specific. Documentation for
both functions would be lovely as well.

Maybe igt_kms_get_aspect_ratio_edid and igt_kms_get_edid for the
names? Or igt_kms_get_special_edid. igt_kms_get_custom_edid?

Naturally if they're indeed not chamelium-specific, their place is
igt_kms.[ch] instead.


> +
>  static int chamelium_upload_edid(struct chamelium *chamelium,
>  				 const struct edid *edid)
>  {
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index 359f4ab3..bce6331d 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -32,6 +32,7 @@
>  #include <xf86drmMode.h>
>  
>  #include "igt_debugfs.h"
> +#include "igt_kms.h"
>  
>  struct igt_fb;
>  struct edid;
> @@ -73,6 +74,16 @@ enum chamelium_infoframe_type {
>  	CHAMELIUM_INFOFRAME_VENDOR,
>  };
>  
> +enum test_edid {
> +	TEST_EDID_BASE,
> +	TEST_EDID_ALT,
> +	TEST_EDID_HDMI_AUDIO,
> +	TEST_EDID_DP_AUDIO,
> +	TEST_EDID_ASPECT_RATIO,
> +};
> +#define TEST_EDID_COUNT 5

Name of enum and the prefix are too generic. enum
igt_custom_edid_type? IGT_CUSTOM_EDID_<type>?

Documentation for this enum is needed too, to explain that it's used
with igt_get_custom_edid or whatever it ends up called in the end.


> +
> +
>  struct chamelium_infoframe {
>  	int version;
>  	size_t payload_size;
> @@ -81,6 +92,11 @@ struct chamelium_infoframe {
>  
>  struct chamelium_edid;
>  
> +/* Set of Video Identification Codes advertised in the EDID */
> +static const uint8_t edid_ar_svds[] = {
> +	16, /* 1080p @ 60Hz, 16:9 */
> +};
> +
>  /**
>   * CHAMELIUM_MAX_PORTS: the maximum number of ports supported by igt_chamelium.
>   *
> @@ -100,6 +116,8 @@ struct chamelium_edid;
>   */
>  #define CHAMELIUM_MAX_AUDIO_CHANNELS 8
>  
> +#define HOTPLUG_TIMEOUT 20 /* seconds */

CHAMELIUM_HOTPLUG_TIMEOUT maybe? Oh, but is this even needed here in
the header, is it only used in the reprobe function?



-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
