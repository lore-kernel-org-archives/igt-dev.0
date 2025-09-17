Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8354FCA0EE8
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 08:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370F010E183;
	Wed, 17 Sep 2025 08:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFy70ME/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0972610E185
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 08:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758098949; x=1789634949;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=qhhIr/hsrszLyszgfUlR0lLYx206moSdMXgpR/k/ifs=;
 b=aFy70ME/8WvQKYqCkYdHPlS7QSXnIuEHZMHR9mfva1XM/bzV5pNlG2Ij
 VciUN2tKAUsUPEbiR4orlEoODbVc4AjLqgakycxi4BNu2kXBwxgjn8NDv
 2xWaoz7dQkbMVBTadIasAHnLix+F/+tY6A5FzNkQnITneOBE6Cv1vc0Ho
 lWQG8But+GD4j1MunrwzqGlNooHRSBtBNdcILoxg4l3u9TC1OriXhqg20
 nyjH/iMNs5zDlbTQ2akqsdpe5B7U5ao6XSs2nOI9DbFrwawO0AXn0zJt4
 pLXim4u19KeMnP7Qh52dT0jEcb6wjEJsK58HFh1a5K+5Lg5C45oqRK2OY A==;
X-CSE-ConnectionGUID: GBvE8xfvR4yDSMC6z0daLA==
X-CSE-MsgGUID: u6NazEIbTim21590+1FE6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60541765"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208,217";a="60541765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 01:49:08 -0700
X-CSE-ConnectionGUID: YpkPbYAqSfe9IXSwgZCEKQ==
X-CSE-MsgGUID: v4q5ImjVQyGDlRQGI+m3CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
 d="scan'208,217";a="175961196"
Received: from pshasthr-mobl.gar.corp.intel.com (HELO [10.247.240.3])
 ([10.247.240.3])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 01:49:07 -0700
Content-Type: multipart/alternative;
 boundary="------------5pWfvfFPUEeynGeejhrU3TvF"
Message-ID: <78599f4c-7cbf-4996-911d-a6040ce2e24d@intel.com>
Date: Wed, 17 Sep 2025 14:19:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/chamelium/kms_chamelium_audio: Reset chamelium
 before audio test and retry ALSA open
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
References: <20250912031502.1306841-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250912031502.1306841-1-jeevan.b@intel.com>
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

This is a multi-part message in MIME format.
--------------5pWfvfFPUEeynGeejhrU3TvF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Jeevan,

Is it fixing a bug? (add fixes tag)
Probably https://gitlab.freedesktop.org/drm/xe/kernel/issues/5982

 From the logs in the bugs it can be seen that we don't see the correct 
EDID in place which we intend to see.

(kms_chamelium_audio:2128) igt_alsa-DEBUG: ELD found for device hw:0,3, but it's empty (the screen is probably disconnected)
(kms_chamelium_audio:2128) igt_alsa-DEBUG: Device hw:0,3 matches the name but doesn't have an IGT ELD
(kms_chamelium_audio:2128) igt_alsa-DEBUG: ELD found for device hw:0,7, but it's empty (the screen is probably disconnected)
(kms_chamelium_audio:2128) igt_alsa-DEBUG: Device hw:0,7 matches the name but doesn't have an IGT ELD
(kms_chamelium_audio:2128) igt_alsa-DEBUG: ELD found for device hw:0,8, but it's empty (the screen is probably disconnected)
(kms_chamelium_audio:2128) igt_alsa-DEBUG: Device hw:0,8 matches the name but doesn't have an IGT ELD
(kms_chamelium_audio:2128) igt_alsa-DEBUG: ELD found for device hw:0,9, but it's empty (the screen is probably disconnected)
(kms_chamelium_audio:2128) igt_alsa-DEBUG: Device hw:0,9 matches the name but doesn't have an IGT ELD

We already do chamelium_reset in chamelium_reset_state.
I would suggest to add a check where we read back the applied EDID and 
check ELD field.
If we don't find the correct edid in place then we can issue unplug/plug 
and recheck.

Thanks and Regards
Kunal Joshi

On 12-09-2025 08:45, Jeevan B wrote:
> Ensure chamelium is reset at the start of audio tests and retry ALSA
> output open once after reset to improve test stability.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   tests/chamelium/kms_chamelium_audio.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
> index 4feae6a93..a251bfb72 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -722,6 +722,9 @@ static void test_display_audio(chamelium_data_t *data,
>   	 * chamelium_get_audio_format support. */
>   	igt_require(chamelium_has_audio_support(data->chamelium, port));
>   
> +	chamelium_reset(data->chamelium);
> +	igt_info("Chamelium reset at start of audio test\n");
> +
>   	alsa = alsa_init();
>   	igt_assert(alsa);
>   
> @@ -752,7 +755,12 @@ static void test_display_audio(chamelium_data_t *data,
>   	for (i = 0; i < test_sampling_rates_count; i++) {
>   		for (j = 0; j < test_formats_count; j++) {
>   			ret = alsa_open_output(alsa, audio_device);
> -			igt_assert_f(ret >= 0, "Failed to open ALSA output\n");
> +			if (ret < 0) {
> +				sleep(1);
> +				igt_info("ALSA open failed, resetting Chamelium and retrying once\n");
> +				ret = alsa_open_output(alsa, audio_device);
> +			}
> +			igt_assert_f(ret >= 0, "Failed to open ALSA output after reset\n");
>   
>   			/* TODO: playback on all 8 available channels (this
>   			 * isn't supported by Chamelium devices yet, see
--------------5pWfvfFPUEeynGeejhrU3TvF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Jeevan,<br>
      <br>
      Is it fixing a bug? (add fixes tag)<br>
      Probably <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5982">https://gitlab.freedesktop.org/drm/xe/kernel/issues/5982</a><br>
      <br>
      From the logs in the bugs it can be seen that we don't see the
      correct EDID in place which we intend to see.</p>
    <pre
style="font-family: monospace; margin: 0px; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">(kms_chamelium_audio:2128) igt_alsa-DEBUG: ELD found for device hw:0,3, but it's empty (the screen is probably disconnected)
(kms_chamelium_audio:2128) igt_alsa-DEBUG: Device hw:0,3 matches the name but doesn't have an IGT ELD
(kms_chamelium_audio:2128) igt_alsa-DEBUG: ELD found for device hw:0,7, but it's empty (the screen is probably disconnected)
(kms_chamelium_audio:2128) igt_alsa-DEBUG: Device hw:0,7 matches the name but doesn't have an IGT ELD
(kms_chamelium_audio:2128) igt_alsa-DEBUG: ELD found for device hw:0,8, but it's empty (the screen is probably disconnected)
(kms_chamelium_audio:2128) igt_alsa-DEBUG: Device hw:0,8 matches the name but doesn't have an IGT ELD
(kms_chamelium_audio:2128) igt_alsa-DEBUG: ELD found for device hw:0,9, but it's empty (the screen is probably disconnected)
(kms_chamelium_audio:2128) igt_alsa-DEBUG: Device hw:0,9 matches the name but doesn't have an IGT ELD</pre>
    <p>We already do chamelium_reset in chamelium_reset_state.<br>
      I would suggest to add a check where we read back the applied EDID
      and check ELD field.<br>
      If we don't find the correct edid in place then we can issue
      unplug/plug and recheck.<br>
      <br>
      Thanks and Regards<br>
      Kunal Joshi</p>
    <div class="moz-cite-prefix">On 12-09-2025 08:45, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">Ensure chamelium is reset at the start of audio tests and retry ALSA
output open once after reset to improve test stability.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/chamelium/kms_chamelium_audio.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index 4feae6a93..a251bfb72 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -722,6 +722,9 @@ static void test_display_audio(chamelium_data_t *data,
 	 * chamelium_get_audio_format support. */
 	igt_require(chamelium_has_audio_support(data-&gt;chamelium, port));
 
+	chamelium_reset(data-&gt;chamelium);
+	igt_info("Chamelium reset at start of audio test\n");
+
 	alsa = alsa_init();
 	igt_assert(alsa);
 
@@ -752,7 +755,12 @@ static void test_display_audio(chamelium_data_t *data,
 	for (i = 0; i &lt; test_sampling_rates_count; i++) {
 		for (j = 0; j &lt; test_formats_count; j++) {
 			ret = alsa_open_output(alsa, audio_device);
-			igt_assert_f(ret &gt;= 0, "Failed to open ALSA output\n");
+			if (ret &lt; 0) {
+				sleep(1);
+				igt_info("ALSA open failed, resetting Chamelium and retrying once\n");
+				ret = alsa_open_output(alsa, audio_device);
+			}
+			igt_assert_f(ret &gt;= 0, "Failed to open ALSA output after reset\n");
 
 			/* TODO: playback on all 8 available channels (this
 			 * isn't supported by Chamelium devices yet, see
</pre>
    </blockquote>
  </body>
</html>

--------------5pWfvfFPUEeynGeejhrU3TvF--
