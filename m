Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AA110E280
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Sep 2022 07:44:10 +0000 (UTC)
Message-ID: <e9272cfc-d0be-f79b-afde-96a2e8e91386@intel.com>
Date: Mon, 12 Sep 2022 13:13:37 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220825111825.74620-1-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220825111825.74620-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_force_connector_basic: Test
 Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu-25-08-2022 04:48 pm, Mohammed Thasleem wrote:
> Sanitize the system state before starting the subtest.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_force_connector_basic.c | 51 ++++++++-----------------------
>   1 file changed, 13 insertions(+), 38 deletions(-)
> 
> diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
> index 683d3672..6ae2da09 100644
> --- a/tests/kms_force_connector_basic.c
> +++ b/tests/kms_force_connector_basic.c
> @@ -31,36 +31,11 @@ IGT_TEST_DESCRIPTION("Check the debugfs force connector/edid features work"
>   	igt_assert_eq(m.hdisplay, h); igt_assert_eq(m.vdisplay, w); \
>   	igt_assert_eq(m.vrefresh, r);
>   
> -static void reset_connectors(void)
> -{
> -	int drm_fd = 0;
> -	drmModeRes *res;
> -	drmModeConnector *connector = NULL;
> -
> -	drm_fd = drm_open_driver_master(DRIVER_ANY);
> -	res = drmModeGetResources(drm_fd);
> -
> -	for (int i = 0; i < res->count_connectors; i++) {
> -
> -		connector = drmModeGetConnectorCurrent(drm_fd,
> -						       res->connectors[i]);
> -
> -		kmstest_force_connector(drm_fd, connector,
> -					FORCE_CONNECTOR_UNSPECIFIED);
> -
> -		kmstest_force_edid(drm_fd, connector, NULL);
> -
> -		drmModeFreeConnector(connector);
> -	}
> -
> -	igt_set_module_param_int(drm_fd, "load_detect_test", 0);
> -}
> -
>   static int opt_handler(int opt, int opt_index, void *data)
>   {
>   	switch (opt) {
>   	case 'r':
> -		reset_connectors();
> +		igt_reset_connectors();

Intention of these two functions are different.

>   		exit(0);
>   		break;
>   	}
> @@ -80,6 +55,7 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
>   	/* force the VGA output and test that it worked */

https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_force_connector_basic.c#n94
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_force_connector_basic.c#n113

It seems, this test is intended to run on VGA & HDMI connectors only.

https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7690/shards-all.html?testfilter=kms_force_connector_basic

But it is executing on all connectors.

>   	int drm_fd = 0;
>   	drmModeRes *res;
> +	igt_display_t display;
>   	drmModeConnector *connector = NULL, *temp;
>   	int start_n_modes, start_connection;
>   
> @@ -87,6 +63,8 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
>   		unsigned connector_id = 0;
>   
>   		drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		igt_display_require(&display, drm_fd);
> +		kmstest_set_vt_graphics_mode();
>   
>   		res = drmModeGetResources(drm_fd);
>   		igt_require(res);
> @@ -156,8 +134,8 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
>   		 * disable all outputs to make sure we have a
>   		 * free crtc available for load detect
>   		 */
> -		kmstest_set_vt_graphics_mode();
> -		kmstest_unset_all_crtcs(drm_fd, res);
> +		igt_display_reset(&display);
> +		igt_display_commit(&display);

As we are using libdrm calls directly, igt_displa_reset() won't help much.

>   
>   		igt_set_module_param_int(drm_fd, "load_detect_test", 1);
>   
> @@ -228,7 +206,10 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
>   
>   	igt_describe("Test to check the forced connector state.");
>   	igt_subtest("force-connector-state") {
> -		igt_display_t display;
> +
> +		/*reset display before attempt to use it */
> +		igt_display_reset(&display);
> +		igt_display_commit(&display);
>   
>   		/* force the connector on and check the reported values */
>   		kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON);
> @@ -238,13 +219,6 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
>   		igt_assert_lt(0, temp->count_modes);
>   		drmModeFreeConnector(temp);
>   
> -		/* attempt to use the display */
> -		kmstest_set_vt_graphics_mode();
> -		igt_display_require(&display, drm_fd);
> -		igt_display_commit(&display);
> -		igt_display_fini(&display);
> -
> -
>   		/* force the connector off */
>   		kmstest_force_connector(drm_fd, connector,
>   					FORCE_CONNECTOR_OFF);
> @@ -261,6 +235,8 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
>   						  connector->connector_id);
>   		igt_assert_eq(temp->connection, start_connection);
>   		drmModeFreeConnector(temp);
> +
> +		igt_display_fini(&display);

Also, I can recommend to create a new function for each subtest instead 
of managing the full logic within the igt_subtest().

>   	}
>   
>   	igt_describe("Test to check the values after forcing edid.");
> @@ -341,8 +317,7 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
>   
>   	igt_fixture {
>   		drmModeFreeConnector(connector);
> +		igt_reset_connectors();
>   		close(drm_fd);
> -
> -		reset_connectors();
>   	}
>   }
