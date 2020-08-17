Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181BE6E41F
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2020 07:03:24 +0000 (UTC)
Date: Mon, 17 Aug 2020 09:30:08 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200817063008.GA7444@platvala-desk.ger.corp.intel.com>
References: <20200815051637.2719528-1-kunal1.joshi@intel.com>
 <20200815051637.2719528-2-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200815051637.2719528-2-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/3] Make basic chamelium function
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

On Sat, Aug 15, 2020 at 10:46:35AM +0530, Kunal Joshi wrote:
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
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  lib/igt_chamelium.c   |  92 ++++++++++++++++++
>  lib/igt_chamelium.h   |  33 +++++++
>  lib/igt_kms.c         |  14 +++
>  lib/igt_kms.h         |   1 +
>  tests/kms_chamelium.c | 214 +++++++++++++++---------------------------
>  5 files changed, 215 insertions(+), 139 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index d9fab902..d55547db 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -218,6 +218,98 @@ const char *chamelium_port_get_name(struct chamelium_port *port)
>  	return port->name;
>  }
>  
> +void
> +chamelium_require_connector_present(struct chamelium_port **ports,
> +				    unsigned int type,
> +				    int port_count,
> +				    int count)
> +{
> +	int i;
> +	int found = 0;
> +
> +	for (i = 0; i < port_count && !found; i++) {
> +		if (chamelium_port_get_type(ports[i]) == type)
> +			found++;
> +	}
> +
> +	igt_require_f(found == count,
> +		      "port of type %s found %d and required %d\n",
> +		      kmstest_connector_type_str(type), found, count);
> +}
> +
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
> +void
> +chamelium_wait_for_connector(igt_display_t *display,
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
> +		chamelium_wait_for_connector(display, chamelium,
> +					     port, DRM_MODE_DISCONNECTED);
> +	} else {
> +		for (p = 0; p < port_count; p++) {
> +			port = ports[p];
> +			chamelium_wait_for_connector(display, chamelium, port,
> +						     DRM_MODE_DISCONNECTED);
> +		}
> +	}
> +}


Add documentation for all these functions.


> +
>  /**
>   * chamelium_destroy_frame_dump:
>   * @dump: The frame dump to destroy
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index 359f4ab3..92195e8c 100644
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


Hmm, this enum is used in tests/kms_chamelium to call the
corresponding igt_kms_get_<xyz>_edid() function. Useful to have in lib
maybe, but a igt_kms_get_special_edid() function that takes this enum
and gives you the edid I don't see getting added to lib in this patch.

The enum values need better names though.

> +
> +
>  struct chamelium_infoframe {
>  	int version;
>  	size_t payload_size;
> @@ -100,6 +111,8 @@ struct chamelium_edid;
>   */
>  #define CHAMELIUM_MAX_AUDIO_CHANNELS 8
>  
> +#define HOTPLUG_TIMEOUT 20 /* seconds */


Only used in lib/igt_chamelium.c now, chamelium_wait_for_connector?
Doesn't need to be in the header. Especially with a generic name such
as this.


> +
>  void chamelium_deinit_rpc_only(struct chamelium *chamelium);
>  struct chamelium *chamelium_init_rpc_only(void);
>  struct chamelium *chamelium_init(int drm_fd);
> @@ -113,6 +126,26 @@ drmModeConnector *chamelium_port_get_connector(struct chamelium *chamelium,
>  					       struct chamelium_port *port,
>  					       bool reprobe);
>  const char *chamelium_port_get_name(struct chamelium_port *port);
> +void
> +chamelium_require_connector_present(struct chamelium_port **ports,
> +				    unsigned int type,
> +				    int port_count,
> +				    int count);
> +drmModeConnection
> +chamelium_reprobe_connector(igt_display_t *display,
> +			    struct chamelium *chamelium,
> +			    struct chamelium_port *port);
> +void
> +chamelium_wait_for_connector(igt_display_t *display,
> +			     struct chamelium *chamelium,
> +			     struct chamelium_port *port,
> +			     drmModeConnection status);
> +void
> +chamelium_reset_state(igt_display_t *display,
> +		      struct chamelium *chamelium,
> +		      struct chamelium_port *port,
> +		      struct chamelium_port **ports,
> +		      int port_count);
>  
>  bool chamelium_wait_reachable(struct chamelium *chamelium, int timeout);
>  void chamelium_assert_reachable(struct chamelium *chamelium, int timeout);
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f57972f1..4157075a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2254,6 +2254,20 @@ const drmModeModeInfo *igt_std_1024_mode_get(void)
>  	return &std_1024_mode;
>  }
>  
> +void igt_disable_modeset(igt_display_t *display)
> +{
> +	int i;
> +
> +	for (i = 0; i < display->n_outputs; i++) {
> +		igt_output_t *output = &display->outputs[i];
> +
> +		igt_output_set_pipe(output, PIPE_NONE);
> +	}
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +}


In a test this name could pass by unnoticed, but in lib it really
needs to say what it's doing. It's not disabling modeset, it's issuing
a modeset that disables all outputs. Also, this needs documentation.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
