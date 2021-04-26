Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13B06E17C
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Apr 2021 09:06:06 +0000 (UTC)
Date: Mon, 26 Apr 2021 12:07:17 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YIaCxYZl9xAlI9kW@platvala-desk.ger.corp.intel.com>
References: <20210426081208.12586-1-kunal1.joshi@intel.com>
 <20210426081208.12586-4-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426081208.12586-4-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] Added a subtest where chamelium
 acts as a tiled panel
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

On Mon, Apr 26, 2021 at 01:42:07PM +0530, Kunal Joshi wrote:
> Split kms_dp_tiled_display into to two subtest.First to execute the
> basic test with physical tiled panel and second with chamelium.
> 
> v2: Revised to just have basic test if chamelium dependencies are not
>     present. Reset ports after the test executes.Changed subtest name
>     from with-chamelium to basic-test-pattern-with-chamelium
> 
> v3: Changes required to adapt to changes done in first patch.
> 
> v4: Changes required to adapt to changes done in first patch.
> 
> v5: Changes required to adapt to changes done in first patch.
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Reviewed-by: Navare Manasi D <manasi.d.navare@intel.com>
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> ---
>  tests/kms_dp_tiled_display.c | 119 ++++++++++++++++++++++++++++-------
>  1 file changed, 95 insertions(+), 24 deletions(-)
> 
> diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
> index 9e738a4f..3681100d 100644
> --- a/tests/kms_dp_tiled_display.c
> +++ b/tests/kms_dp_tiled_display.c
> @@ -40,6 +40,7 @@
>  #include "poll.h"
>  #include "drm_mode.h"
>  #include "drm_fourcc.h"
> +#include "igt_edid.h"
>  
>  IGT_TEST_DESCRIPTION("Test for Transcoder Port Sync for Display Port Tiled Displays");
>  
> @@ -59,8 +60,22 @@ typedef struct {
>  	data_connector_t *conns;
>  	enum igt_commit_style commit;
>  	struct timeval first_ts;
> +
> +	#ifdef HAVE_CHAMELIUM
> +	struct chamelium *chamelium;
> +	struct chamelium_port **ports;
> +	int port_count;
> +	struct chamelium_edid *edids[IGT_CUSTOM_EDID_COUNT];
> +	#endif
> +
>  } data_t;
>  
> +void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd);
> +
> +#ifdef HAVE_CHAMELIUM
> +static void test_with_chamelium(data_t *data);
> +#endif
> +
>  static int drm_property_is_tile(drmModePropertyPtr prop)
>  {
>  	return (strcmp(prop->name, "TILE") ? 0 : 1) &&
> @@ -199,7 +214,6 @@ static void test_cleanup(data_t *data)
>  	igt_display_commit2(data->display, data->commit);
>  	memset(conns, 0, sizeof(data_connector_t) * data->num_h_tiles);
>  }
> -
>  static void setup_mode(data_t *data)
>  {
>  	int count = 0, prev = 0, i = 0;
> @@ -373,21 +387,83 @@ static bool got_all_page_flips(data_t *data)
>  	return true;
>  }
>  
> +#ifdef HAVE_CHAMELIUM
> +static void test_with_chamelium(data_t *data)
> +{
> +	int i, count = 0;
> +	uint8_t htile = 2, vtile = 1;
> +	struct edid **edid;
> +
> +	data->chamelium = chamelium_init(data->drm_fd);
> +	igt_assert(data->chamelium);

igt_require here, not igt_assert.


-- 
Petri Latvala



> +	data->ports = chamelium_get_ports
> +		(data->chamelium, &data->port_count);
> +	chamelium_require_connector_present(data->ports,
> +					    DRM_MODE_CONNECTOR_DisplayPort,
> +					    data->port_count, 2);
> +	edid = igt_kms_get_tiled_edid(htile-1, vtile-1);
> +
> +	for (i = 0; i < 2; i++)
> +		data->edids[i] =
> +			chamelium_new_edid(data->chamelium, edid[i]);
> +
> +	for (i = 0; i < data->port_count; i++) {
> +		if (chamelium_port_get_type(data->ports[i]) ==
> +				DRM_MODE_CONNECTOR_DisplayPort) {
> +
> +			chamelium_port_set_tiled_edid(data->chamelium,
> +				data->ports[i], data->edids[i]);
> +			chamelium_plug(data->chamelium,
> +				       data->ports[i]);
> +			chamelium_wait_for_conn_status_change(data->display,
> +							      data->chamelium,
> +							      data->ports[i],
> +							      DRM_MODE_CONNECTED);
> +			count++;
> +		}
> +		if (count == 2)
> +			break;
> +	}
> +}
> +#endif
> +
> +void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd)
> +{
> +		int ret;
> +
> +		get_number_of_h_tiles(data);
> +		igt_debug("Number of Horizontal Tiles: %d\n",
> +			  data->num_h_tiles);
> +		igt_require(data->num_h_tiles > 0);
> +		data->conns = calloc(data->num_h_tiles,
> +				     sizeof(data_connector_t));
> +		igt_assert(data->conns);
> +
> +		get_connectors(data);
> +		setup_mode(data);
> +		setup_framebuffer(data);
> +		timerclear(&data->first_ts);
> +		igt_display_commit_atomic(data->display,
> +			DRM_MODE_ATOMIC_NONBLOCK |
> +			DRM_MODE_PAGE_FLIP_EVENT, data);
> +		while (!got_all_page_flips(data)) {
> +			ret = poll(pfd, 1, 1000);
> +			igt_assert(ret == 1);
> +			drmHandleEvent(data->drm_fd, drm_event);
> +		}
> +}
> +
>  igt_main
>  {
>  	igt_display_t display;
>  	data_t data = {0};
>  	struct pollfd pfd = {0};
>  	drmEventContext drm_event = {0};
> -	int ret;
> -
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> -
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&display, data.drm_fd);
>  		igt_display_reset(&display);
> -
>  		data.display = &display;
>  		pfd.fd = data.drm_fd;
>  		pfd.events = POLLIN;
> @@ -395,33 +471,28 @@ igt_main
>  		drm_event.page_flip_handler2 = page_flip_handler;
>  		data.commit = data.display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY;
>  		igt_require(data.commit == COMMIT_ATOMIC);
> -
> -		get_number_of_h_tiles(&data);
> -		igt_debug("Number of Horizontal Tiles: %d\n", data.num_h_tiles);
> -		igt_require(data.num_h_tiles > 0);
> -		data.conns = calloc(data.num_h_tiles, sizeof(data_connector_t));
>  	}
>  
>  	igt_describe("Make sure the Tiled CRTCs are synchronized and we get "
>  		     "page flips for all tiled CRTCs in one vblank.");
>  	igt_subtest("basic-test-pattern") {
> -		igt_assert(data.conns);
> -
> -		get_connectors(&data);
> -		setup_mode(&data);
> -		setup_framebuffer(&data);
> -		timerclear(&data.first_ts);
> -		igt_display_commit_atomic(data.display, DRM_MODE_ATOMIC_NONBLOCK |
> -					  DRM_MODE_PAGE_FLIP_EVENT, &data);
> -		while (!got_all_page_flips(&data)) {
> -			ret = poll(&pfd, 1, 1000);
> -			igt_assert(ret == 1);
> -			drmHandleEvent(data.drm_fd, &drm_event);
> -		}
> -
> +		basic_test(&data, &drm_event, &pfd);
>  		test_cleanup(&data);
>  	}
>  
> +	#ifdef HAVE_CHAMELIUM
> +	igt_subtest_f("basic-test-pattern-with-chamelium") {
> +		int i;
> +
> +		test_with_chamelium(&data);
> +		basic_test(&data, &drm_event, &pfd);
> +		test_cleanup(&data);
> +		for (i = 0; i < data.port_count; i++)
> +			chamelium_reset_state(data.display, data.chamelium,
> +					      data.ports[i], data.ports,
> +					      data.port_count);
> +	}
> +	#endif
>  	igt_fixture {
>  		free(data.conns);
>  		close(data.drm_fd);
> -- 
> 2.25.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
