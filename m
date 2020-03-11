Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F9489A34
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2020 08:23:33 +0000 (UTC)
Date: Wed, 11 Mar 2020 10:23:31 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200311082331.GC14594@platvala-desk.ger.corp.intel.com>
References: <1579494027-2018-1-git-send-email-kunal1.joshi@intel.com>
 <1579494027-2018-2-git-send-email-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579494027-2018-2-git-send-email-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/3] Make basic chamelium function
 accessible to other tests.
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
To: Kunal Joshi <kunal1.joshi@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 20, 2020 at 09:50:25AM +0530, Kunal Joshi wrote:
> There are many use case where we can integrate chamelium with other tests,
> Migrating some of basic chamelium functions to igt_chamelium lib to avoid
> Code rewriting.
> 
> v2: Moved one more function reset_state from tests/kms_chamelium to
> lib/igt_chamelium.
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  lib/igt_chamelium.c   | 85 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_chamelium.h   | 28 +++++++++++++++++
>  tests/kms_chamelium.c | 81 +-----------------------------------------------
>  3 files changed, 114 insertions(+), 80 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 9971f51..8b910bf 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -132,6 +132,91 @@ static struct chamelium *cleanup_instance;
>  static void chamelium_do_calculate_fb_crc(cairo_surface_t *fb_surface,
>  					  igt_crc_t *out);
>  
> +void
> +require_displayport_connector_present(struct data_chamelium_t *data,
> +							    unsigned int type)
> +{
> +	int i, count = 0;
> +	bool found = false;
> +
> +	for (i = 0; i < data->port_count && !found; i++) {
> +		if (chamelium_port_get_type(data->ports[i]) == type)
> +			count++;
> +		if (count == 2)
> +			found = true;
> +	}
> +	igt_require_f(found,
> +		"Need atleast 2 ports of type %s connected, found %d\n",
> +		kmstest_connector_type_str(type), count);
> +}

For a helper, this could use some generalizing. It's called "require
displayport connector" but requires exactly 2 connectors of a given
type, not displayport. The name also needs to be prefixed with
chamelium_. chamelium_require_connectors(chamelium, type, count)?

Comment below for data_chamelium_t usage.

> +
> +drmModeConnection
> +reprobe_connector(struct data_chamelium_t *data, struct chamelium_port *port)
> +{
> +	drmModeConnector *connector;
> +	drmModeConnection status;
> +
> +	igt_debug("Reprobing %s...\n", chamelium_port_get_name(port));
> +	connector = chamelium_port_get_connector(data->chamelium, port, true);
> +	igt_assert(connector);
> +	status = connector->connection;
> +
> +	drmModeFreeConnector(connector);
> +	return status;
> +}

As a library function, this functions looks redundant. Just keep
copies of that function in the tests IMHO.


> +
> +const char *connection_str(drmModeConnection c)
> +{
> +	switch (c) {
> +	case DRM_MODE_CONNECTED:
> +		return "connected";
> +	case DRM_MODE_DISCONNECTED:
> +		return "disconnected";
> +	case DRM_MODE_UNKNOWNCONNECTION:
> +		return "unknown";
> +	}
> +	assert(0); /* unreachable */
> +}

Isn't this just kmstest_connector_status_str()?

> +
> +void
> +wait_for_connector(struct data_chamelium_t *data, struct chamelium_port *port,
> +		   drmModeConnection status)
> +{
> +	igt_debug("Waiting for %s to get %s...\n",
> +		chamelium_port_get_name(port), connection_str(status));
> +
> +	/*
> +	 * Rely on simple reprobing so we don't fail tests that don't require
> +	 * that hpd events work in the event that hpd doesn't work on the system
> +	 */
> +	igt_until_timeout(HOTPLUG_TIMEOUT) {
> +	if (reprobe_connector(data, port) == status)
> +		return;
> +
> +	usleep(50000);
> +
> +	}
> +	igt_assert_f(false, "Timed out waiting for %s to get %s\n",
> +		chamelium_port_get_name(port), connection_str(status));
> +}
> +
> +void
> +reset_state(struct data_chamelium_t *data, struct chamelium_port *port)
> +{
> +	int p;
> +
> +	chamelium_reset(data->chamelium);
> +
> +	if (port) {
> +		wait_for_connector(data, port, DRM_MODE_DISCONNECTED);
> +	} else {
> +		for (p = 0; p < data->port_count; p++) {
> +			port = data->ports[p];
> +			wait_for_connector(data, port, DRM_MODE_DISCONNECTED);
> +		}
> +	}
> +}
> +

I'm fairly certain we already have helpers for doing these operations,
or if we don't, we don't need them in lib.


>  /**
>   * chamelium_get_ports:
>   * @chamelium: The Chamelium instance to use
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index 08705a9..71080f4 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -25,6 +25,8 @@
>  
>  #ifndef IGT_CHAMELIUM_H
>  #define IGT_CHAMELIUM_H
> +#define TEST_EDID_COUNT 5
> +#define HOTPLUG_TIMEOUT 20
>  
>  #include "config.h"
>  
> @@ -32,6 +34,7 @@
>  #include <xf86drmMode.h>
>  
>  #include "igt_debugfs.h"
> +#include "igt_kms.h"
>  
>  struct igt_fb;
>  struct edid;
> @@ -81,6 +84,17 @@ struct chamelium_infoframe {
>  
>  struct chamelium_edid;
>  
> +struct data_chamelium_t {
> +	struct chamelium *chamelium;
> +	struct chamelium_port **ports;
> +	igt_display_t display;
> +	int port_count;
> +
> +	int drm_fd;
> +
> +	struct chamelium_edid *edids[TEST_EDID_COUNT];
> +};
> +

This struct is entirely tests/kms_chamelium.c specific. Make the new
lib helpers take a struct chamelium* instead. Why kms_chamelium even
has this intermediary storage for all this data is beyond my expertise
but I'm not seeing it.

From a quick look, the only thing the new lib functions would need is
access to the chamelium ports, and they can be retrieved with
chamelium_get_ports(). 


CC'ing Arek for comments with his chamelium lib expertise.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
