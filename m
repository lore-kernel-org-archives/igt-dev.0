Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F64CD8CA8
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 04:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422C010E097;
	Fri, 12 Jun 2026 04:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsKL5V27";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AD110E097
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 04:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781240307; x=1812776307;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=jbvJFzVrn45UdREkjZcCniEJ+gktaiJzHKzNh3R11yA=;
 b=NsKL5V27qwHFgxdM5Yczkm/fh6DZbyn8C0gkaGvZrM4XA4SrEFSA0E/S
 g26AIPpdixpTtyJWxNY+DqBORMT30CpcMkYmizGL/jZlIIBayEPNUYoTY
 WDKxdi300S2gdrJkz5v+PlNFX4oSp15PvSr7I3mbpBJrtky6JKN2py3NU
 cgG5KEP/grWBnEvWKlnlSWsFjC8JtoKKCCUJaQZCdPT15YPKV1bjQ8zNu
 ljdEinBnzcORMk7q2bb84ofZpkg+zXBw71OVvBzEzSs7r+0SeJW6sCIYm
 lLFKc2B1KNRgyw27+U32Kr+sLtlmz97ju9EUg6IXUNjo5EItsHzM2d0i4 g==;
X-CSE-ConnectionGUID: OrDyHMvPT0Krx0tP6F9Oig==
X-CSE-MsgGUID: t+8ymVqKSZKwpDIBTuMy8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92745864"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="92745864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 21:58:26 -0700
X-CSE-ConnectionGUID: ZujdbAkfSo+UAfFgkX30og==
X-CSE-MsgGUID: QbFGJsSGQMaW0fYYI5W7IQ==
X-ExtLoop1: 1
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.118.194])
 ([10.66.118.194])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 21:58:25 -0700
Message-ID: <e5b0a42a-826f-49b4-a4f0-34bf447f1506@intel.com>
Date: Fri, 12 Jun 2026 10:28:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/chamelium/kms_chamelium_audio: Add suspend/resume
 audio tests
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
References: <20260611035200.2296907-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260611035200.2296907-1-jeevan.b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hello Jeevan,

On 11-06-2026 09:22, Jeevan B wrote:
> Add test to validate audio works before and after suspend/resume on
> HDMI/DP connector.
>
> v2: Perform a single suspend/resume for all audio combinations.
>      Re-enable chamelium after suspend and separate pre-suspend
>      and post-resume validation paths for clearer failure diagnostics.
> v3: Drop commit and use igt_assert_f with explicit messages to
>      distinguish failure in audio tests.
> v4: Removed inner igt_assert, changed from tracking execution to
>      aggregating test results with success &=, so function now returns
>      actual pass/fail.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/chamelium/kms_chamelium_audio.c | 147 ++++++++++++++++++++++++++
>   1 file changed, 147 insertions(+)
>
> diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
> index df8d27c0c..bd121fa8d 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -52,6 +52,12 @@
>    * SUBTEST: hdmi-audio-edid
>    * Description: Plug a connector with an EDID suitable for audio, check ALSA's
>    *              EDID-Like Data reports the correct audio parameters
> + *
> + * SUBTEST: dp-audio-after-suspend
> + * Description: Verify audio works before and after system suspend/resume
> + *
> + * SUBTEST: hdmi-audio-after-suspend
> + * Description: Verify audio works before and after system suspend/resume
>    */
>   
>   /* Playback parameters control the audio signal we synthesize and send */
> @@ -695,6 +701,63 @@ static bool check_audio_configuration(struct alsa *alsa,
>   	return true;
>   }
>   
> +static bool run_audio_test_once(chamelium_data_t *data,
> +				struct alsa *alsa,
> +				struct chamelium_port *port,
> +				snd_pcm_format_t format,
> +				int channels,
> +				int sampling_rate)
> +{
> +	struct audio_state state;
> +	bool success;
> +
> +	audio_state_init(&state, data, alsa, port, format, channels,
> +			 sampling_rate);
> +	success = test_audio_frequencies(&state);
> +	success &= test_audio_flatline(&state);
> +	audio_state_fini(&state);
> +
> +	return success;
> +}
> +
> +static bool run_audio_tests(chamelium_data_t *data,
> +			    struct alsa *alsa,
> +			    struct chamelium_port *port,
> +			    const char *audio_device)
> +{
> +	bool success = true;
> +	int ret, i, j;
> +	int channels, sampling_rate;
> +	snd_pcm_format_t format;
> +
> +	for (i = 0; i < test_sampling_rates_count; i++) {
> +		for (j = 0; j < test_formats_count; j++) {
> +			ret = alsa_open_output(alsa, audio_device);
> +			igt_assert_f(ret >= 0,
> +				     "Failed to open ALSA output\n");
> +
> +			format = test_formats[j];
> +			channels = PLAYBACK_CHANNELS;
> +			sampling_rate = test_sampling_rates[i];
> +
> +			if (!check_audio_configuration(alsa, format,
> +						       channels,
> +						       sampling_rate)) {
> +				alsa_close_output(alsa);
> +				continue;
> +			}
> +
> +			success &= run_audio_test_once(data, alsa, port,
> +						       format, channels,
> +						       sampling_rate);
> +
> +			alsa_close_output(alsa);
> +		}
> +	}
> +
> +	return success;
> +}
> +
Looks there can be some possibility here that we can return success even 
though nothing ran,
>   static const char test_display_audio_desc[] =
>   	"Playback various audio signals with various audio formats/rates, "
>   	"capture them and check they are correct";
> @@ -789,6 +852,80 @@ static void test_display_audio(chamelium_data_t *data,
>   	free(alsa);
>   }
>   
> +static const char test_display_audio_suspend_resume_desc[] =
> +	"Verify audio works before and after system suspend/resume";
> +static void test_display_audio_suspend_resume(
> +				chamelium_data_t *data,
> +				struct chamelium_port *port,
> +				const char *audio_device,
> +				enum igt_custom_edid_type edid)
> +{
> +	struct alsa *alsa;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	struct igt_fb fb;
> +	drmModeModeInfo *mode;
> +	drmModeConnector *connector;
> +	int fb_id;
> +
> +	igt_require(alsa_has_exclusive_access());
> +
> +	igt_require(chamelium_has_audio_support(data->chamelium,
> +						port));
> +
> +	alsa = alsa_init();
> +	igt_assert(alsa);
> +
> +	igt_modeset_disable_all_outputs(&data->display);
> +
> +	chamelium_reset_state(&data->display, data->chamelium,
> +			      port, data->ports,
> +			      data->port_count);
> +
> +	output = chamelium_prepare_output(data, port, edid);
> +
> +	connector = chamelium_port_get_connector(data->chamelium,
> +						 port, false);
> +
> +	primary = igt_output_get_plane_type(output,
> +					    DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(primary);
> +
> +	igt_assert(connector->count_modes > 0);
> +
> +	mode = &connector->modes[0];
> +
> +	fb_id = igt_create_color_pattern_fb(data->drm_fd,
> +					    mode->hdisplay,
> +					    mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888,
> +					    DRM_FORMAT_MOD_LINEAR,
> +					    0, 0, 0, &fb);
> +
> +	igt_assert(fb_id > 0);
> +
> +	chamelium_enable_output(data, port, output,
> +				mode, &fb);
> +
> +	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
> +		     "Audio test failed before suspend\n");
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +				      SUSPEND_TEST_NONE);
> +
> +	chamelium_enable_output(data, port, output,
> +				mode, &fb);
Why are we re-enabling the output?
We can just reprobe connectors to make sure they are in connected state.

Thanks and Regards
Kunal Joshi
> +
> +	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
> +		     "Audio test failed after suspend\n");
> +
> +	igt_remove_fb(data->drm_fd, &fb);
> +
> +	drmModeFreeConnector(connector);
> +
> +	free(alsa);
> +}
> +
>   static const char test_display_audio_edid_desc[] =
>   	"Plug a connector with an EDID suitable for audio, check ALSA's "
>   	"EDID-Like Data reports the correct audio parameters";
> @@ -866,6 +1003,11 @@ int igt_main()
>   	connector_subtest("dp-audio-edid", DisplayPort, &data, test_display_audio_edid,
>   			  IGT_CUSTOM_EDID_DP_AUDIO);
>   
> +	igt_describe(test_display_audio_suspend_resume_desc);
> +	connector_subtest("dp-audio-after-suspend", DisplayPort, &data,
> +			  test_display_audio_suspend_resume,
> +			  "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
> +
>   	igt_describe("HDMI tests");
>   
>   	igt_describe(test_display_audio_desc);
> @@ -876,6 +1018,11 @@ int igt_main()
>   	connector_subtest("hdmi-audio-edid", HDMIA, &data, test_display_audio_edid,
>   			  IGT_CUSTOM_EDID_HDMI_AUDIO);
>   
> +	igt_describe(test_display_audio_suspend_resume_desc);
> +	connector_subtest("hdmi-audio-after-suspend", HDMIA, &data,
> +			  test_display_audio_suspend_resume,
> +			  "HDMI", IGT_CUSTOM_EDID_HDMI_AUDIO);
> +
>   	igt_fixture() {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
