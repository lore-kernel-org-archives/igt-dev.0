Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8296E2CD
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2020 10:41:53 +0000 (UTC)
Date: Thu, 16 Apr 2020 13:41:49 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200416104149.iptyqjw4r6rq5jak@ahiler-desk1.fi.intel.com>
References: <20200416032114.22318-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416032114.22318-1-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_chamelium Capture on type-c
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

On Thu, Apr 16, 2020 at 08:51:14AM +0530, Kunal Joshi wrote:
> When we try to capture from chamelium it sends hpd pulse
> when it needs fsm handling but on type-c connector we
> dodn't get it when the modeset is enabled, disabling
> modeset so  we get hpd pulse.

I am not 100% sure that the changes does what you state here.

The biggest difference is that you reset chamelium in-between switching
modes, so the board should not be mode-locked and thus not require FSM
handling in the first place.

The mode is still enabled when we call chamelium_capture(), so HPD would
still fail, but my guess is that we don't even need it because of the
above.

If my suspicion is correct we can consider dropping the HPD monitoring
thread and document the required sequence to do the capturing instead.


> Cc: Hiler Arkadiusz <arkadiusz.hiler@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Issue: https://gitlab.freedesktop.org/drm/intel/issues/262
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_chamelium.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> index 8b20bbb..2f53063 100644
> --- a/tests/kms_chamelium.c
> +++ b/tests/kms_chamelium.c
> @@ -672,7 +672,6 @@ test_suspend_resume_edid_change(data_t *data, struct chamelium_port *port,
>  	get_connectors_link_status_failed(data, link_status_failed[0]);
>  
>  	igt_flush_hotplugs(mon);
> -
>  	igt_system_suspend_autoresume(state, test);
>  	igt_assert(igt_hotplug_detected(mon, HOTPLUG_TIMEOUT));
>  	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
> @@ -833,14 +832,16 @@ static void test_display_all_modes(data_t *data, struct chamelium_port *port,
>  
>  	output = prepare_output(data, port, TEST_EDID_BASE);
>  	connector = chamelium_port_get_connector(data->chamelium, port, false);
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_assert(primary);
> -	igt_require(igt_plane_has_format_mod(primary, fourcc, LOCAL_DRM_FORMAT_MOD_NONE));
>  
>  	if (check == CHAMELIUM_CHECK_ANALOG)
>  		bridge = check_analog_bridge(data, port);
>  
>  	for (i = 0; i < connector->count_modes; i++) {
> +	        output = prepare_output(data, port, TEST_EDID_BASE);
> +	        connector = chamelium_port_get_connector(data->chamelium, port, false);
> +	        primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	        igt_assert(primary);
> +	        igt_require(igt_plane_has_format_mod(primary, fourcc, LOCAL_DRM_FORMAT_MOD_NONE));
>  		drmModeModeInfo *mode = &connector->modes[i];

Handling of *connector is broken here and in the other chunk:

1. you get connector first and then use it to start iteration

2. you refresh the connector each iteration after you plug leaking the
   old one

3. there are no guarantee that the amount of modes will stay the same -
   link training and mode pruning may kick in

4. you are preparing output two times in a row for the first iteration

You need to re-work the flow here and make sure that at least the number
of modes stays constant.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
