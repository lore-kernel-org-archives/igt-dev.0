Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E3FD73EBA
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 04:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D5C10E07F;
	Fri, 30 Jan 2026 04:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKiejPz6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE0710E07F
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 04:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769745972; x=1801281972;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=ddNsX7FbFaRjkzfvT0tO1QcogaZ1TM91xY4GyxGsmS4=;
 b=fKiejPz6ngVrd8Tn71B++X3Zs+Jg+z1/DqhPCnndGxBdH4bzhdtwydCu
 NsCmvPXEwqHx/PbbrUrWtP07BxCmmnRdUvMLif8wvOfBhYbGsQiuZc2C0
 nAR7Qif+WxGiuRiXH2mFBENhTtMyH9xtJgHnKXf8NSNaZYYYCVHtGX8yy
 bxsPIAPSygpJlm4CsD61z8ttVqOWPJNx4eKMJESyS01gPHQy7pZkm6Ci7
 fO/+OzmPY377AOJMaNioE98Sxo8O11a3zF1kwER0jCq9Qxj2OsJXYHF6R
 4eIRHZOwuz8l4CeCfe1/gaN1s2iDfakLFgWrxhWAK+3IiKYFd1mI5GAOQ w==;
X-CSE-ConnectionGUID: AsKbWWyOSR2M9ppJNEa3xg==
X-CSE-MsgGUID: ACjmkvztSuaqVoY/F3cp5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71033032"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208,217";a="71033032"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 20:06:11 -0800
X-CSE-ConnectionGUID: 1EWQW8FJRxy+imvN2/Zd2w==
X-CSE-MsgGUID: xE/LIS8vSsmrEb89rl+wxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
 d="scan'208,217";a="231671152"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.113.248])
 ([10.66.113.248])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 20:06:09 -0800
Content-Type: multipart/alternative;
 boundary="------------orYn2FETc1oUXZjdwWyNGVD3"
Message-ID: <7f68e3e7-848d-49e4-b139-efa9617e4f7f@intel.com>
Date: Fri, 30 Jan 2026 09:35:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v6,2/2] tests/chamelium/kms_chamelium_hpd: use helper
 function for connector lookup in DP/HDMI/VGA tests
To: Mohammed Bilal <mohammed.bilal@intel.com>, igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, sameer.lattannavar@intel.com, karthik.b.s@intel.com
References: <20260129074520.397133-3-mohammed.bilal@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260129074520.397133-3-mohammed.bilal@intel.com>
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
--------------orYn2FETc1oUXZjdwWyNGVD3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Bilal,

Please find comments inline.
Fix commit message on both as it seems interchanged.

On 29-01-2026 13:15, Mohammed Bilal wrote:
> Introduce a unified connector_test() helper that iterates over and tests
> all matching connected ports, ensuring clean skipping and consistent
> connector handling across DP/HDMI/VGA tests, and avoiding unintended
> execution of unrelated fixtures.
>
> Signed-off-by: Mohammed Bilal<mohammed.bilal@intel.com>
> ---
>   tests/chamelium/kms_chamelium_hpd.c | 239 ++++++++++++----------------
>   1 file changed, 98 insertions(+), 141 deletions(-)
>
> diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
> index 8f13b380a..dd1735956 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -465,157 +465,117 @@ IGT_TEST_DESCRIPTION("Testing HPD with a Chamelium board");
>   int igt_main()
>   {
>   	chamelium_data_t data;
> -	struct chamelium_port *port;
> -	int p;
>   
>   	igt_fixture() {
>   		chamelium_init_test(&data);
>   	}
>   
>   	igt_describe("DisplayPort tests");
> -	igt_subtest_group() {
> -		igt_fixture() {
> -			chamelium_require_connector_present(
> -				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
> -				data.port_count, 1);
> -		}
>   
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd", DisplayPort)

Name your connector_test macro to connector_subtest("dp-hpd", DisplayPort)

Patch 1
introduce connector_test

Patch 2
Replace all calls to connector_subtest with your connector_test, 
including (audio, frames, edid)

Patch 3
Remove connector_subtest, rename connector_test -> connector_subtest and 
rename all calls

Thanks and Regards
Kunal Joshi
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_DP_HDMI,
> -				     TEST_MODESET_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd-fast", DisplayPort) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd-enable-disable-mode", DisplayPort)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd-with-enabled-mode", DisplayPort)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON);
> -
> -		igt_describe(test_hotplug_for_each_pipe_desc);
> -		connector_subtest("dp-hpd-for-each-pipe", DisplayPort)
> -			test_hotplug_for_each_pipe(&data, port);
> -
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("dp-hpd-after-suspend", DisplayPort)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
> -						SUSPEND_TEST_NONE);
> -
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("dp-hpd-after-hibernate", DisplayPort)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
> -						SUSPEND_TEST_DEVICES);
> -
> -		igt_describe(test_hpd_storm_detect_desc);
> -		connector_subtest("dp-hpd-storm", DisplayPort)
> -			test_hpd_storm_detect(&data, port,
> -					      HPD_STORM_PULSE_INTERVAL_DP);
> -
> -		igt_describe(test_hpd_storm_disable_desc);
> -		connector_subtest("dp-hpd-storm-disable", DisplayPort)
> -			test_hpd_storm_disable(&data, port,
> -					       HPD_STORM_PULSE_INTERVAL_DP);
> -	}
> +	igt_describe(test_basic_hotplug_desc);
> +	connector_test("dp-hpd", DisplayPort, &data, test_hotplug,
> +		       HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	connector_test("dp-hpd-fast", DisplayPort, &data, test_hotplug,
> +		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	connector_test("dp-hpd-enable-disable-mode", DisplayPort, &data, test_hotplug,
> +		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	connector_test("dp-hpd-with-enabled-mode", DisplayPort, &data, test_hotplug,
> +		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
> +
> +	igt_describe(test_hotplug_for_each_pipe_desc);
> +	connector_test("dp-hpd-for-each-pipe", DisplayPort, &data,
> +		       test_hotplug_for_each_pipe);
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	connector_test("dp-hpd-after-suspend", DisplayPort, &data, test_suspend_resume_hpd,
> +		       SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	connector_test("dp-hpd-after-hibernate", DisplayPort, &data, test_suspend_resume_hpd,
> +		       SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
> +
> +	igt_describe(test_hpd_storm_detect_desc);
> +	connector_test("dp-hpd-storm", DisplayPort, &data, test_hpd_storm_detect,
> +		       HPD_STORM_PULSE_INTERVAL_DP);
> +
> +	igt_describe(test_hpd_storm_disable_desc);
> +	connector_test("dp-hpd-storm-disable", DisplayPort, &data, test_hpd_storm_disable,
> +		       HPD_STORM_PULSE_INTERVAL_DP);
>   
>   	igt_describe("HDMI tests");
> -	igt_subtest_group() {
> -		igt_fixture() {
> -			chamelium_require_connector_present(
> -				data.ports, DRM_MODE_CONNECTOR_HDMIA,
> -				data.port_count, 1);
> -		}
>   
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd", HDMIA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_DP_HDMI,
> -				     TEST_MODESET_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd-fast", HDMIA) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd-enable-disable-mode", HDMIA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd-with-enabled-mode", HDMIA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON);
> -
> -		igt_describe(test_hotplug_for_each_pipe_desc);
> -		connector_subtest("hdmi-hpd-for-each-pipe", HDMIA)
> -			test_hotplug_for_each_pipe(&data, port);
> -
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("hdmi-hpd-after-suspend", HDMIA)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
> -						SUSPEND_TEST_NONE);
> -
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("hdmi-hpd-after-hibernate", HDMIA)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
> -						SUSPEND_TEST_DEVICES);
> -
> -		igt_describe(test_hpd_storm_detect_desc);
> -		connector_subtest("hdmi-hpd-storm", HDMIA)
> -			test_hpd_storm_detect(&data, port,
> -					      HPD_STORM_PULSE_INTERVAL_HDMI);
> -
> -		igt_describe(test_hpd_storm_disable_desc);
> -		connector_subtest("hdmi-hpd-storm-disable", HDMIA)
> -			test_hpd_storm_disable(&data, port,
> -					       HPD_STORM_PULSE_INTERVAL_HDMI);
> -	}
> +	igt_describe(test_basic_hotplug_desc);
> +	connector_test("hdmi-hpd", HDMIA, &data, test_hotplug,
> +		       HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	connector_test("hdmi-hpd-fast", HDMIA, &data, test_hotplug,
> +		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	connector_test("hdmi-hpd-enable-disable-mode", HDMIA, &data, test_hotplug,
> +		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	connector_test("hdmi-hpd-with-enabled-mode", HDMIA, &data, test_hotplug,
> +		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
> +
> +	igt_describe(test_hotplug_for_each_pipe_desc);
> +	connector_test("hdmi-hpd-for-each-pipe", HDMIA, &data, test_hotplug_for_each_pipe);
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	connector_test("hdmi-hpd-after-suspend", HDMIA, &data, test_suspend_resume_hpd,
> +		       SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	connector_test("hdmi-hpd-after-hibernate", HDMIA, &data, test_suspend_resume_hpd,
> +		       SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
> +
> +	igt_describe(test_hpd_storm_detect_desc);
> +	connector_test("hdmi-hpd-storm", HDMIA, &data, test_hpd_storm_detect,
> +		       HPD_STORM_PULSE_INTERVAL_HDMI);
> +
> +	igt_describe(test_hpd_storm_disable_desc);
> +	connector_test("hdmi-hpd-storm-disable", HDMIA, &data, test_hpd_storm_disable,
> +		       HPD_STORM_PULSE_INTERVAL_HDMI);
>   
>   	igt_describe("VGA tests");
> -	igt_subtest_group() {
> -		igt_fixture() {
> -			chamelium_require_connector_present(
> -				data.ports, DRM_MODE_CONNECTOR_VGA,
> -				data.port_count, 1);
> -		}
>   
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd", VGA) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd-fast", VGA) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd-enable-disable-mode", VGA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd-with-enabled-mode", VGA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON);
> -
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("vga-hpd-after-suspend", VGA)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
> -						SUSPEND_TEST_NONE);
> -
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("vga-hpd-after-hibernate", VGA)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
> -						SUSPEND_TEST_DEVICES);
> -
> -		igt_describe(test_hpd_without_ddc_desc);
> -		connector_subtest("vga-hpd-without-ddc", VGA)
> -			test_hpd_without_ddc(&data, port);
> -	}
> +	igt_describe(test_basic_hotplug_desc);
> +	connector_test("vga-hpd", VGA, &data, test_hotplug,
> +		       HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	connector_test("vga-hpd-fast", VGA, &data, test_hotplug,
> +		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	connector_test("vga-hpd-enable-disable-mode", VGA, &data,
> +		       test_hotplug, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	connector_test("vga-hpd-with-enabled-mode", VGA, &data,
> +		       test_hotplug, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	connector_test("vga-hpd-after-suspend", VGA, &data,
> +		       test_suspend_resume_hpd, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	connector_test("vga-hpd-after-hibernate", VGA, &data,
> +		       test_suspend_resume_hpd, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
> +
> +	igt_describe(test_hpd_without_ddc_desc);
> +	connector_test("vga-hpd-without-ddc", VGA, &data, test_hpd_without_ddc);
> +
> +	igt_describe(test_hotplug_for_each_pipe_desc);
> +	connector_test("vga-hpd-for-each-pipe", VGA, &data, test_hotplug_for_each_pipe);
>   
>   	igt_describe("Tests that operate on all connectors");
>   	igt_subtest_group() {
> @@ -635,9 +595,6 @@ int igt_main()
>   						       SUSPEND_TEST_DEVICES);
>   	}
>   
> -	igt_describe(test_hotplug_for_each_pipe_desc);
> -	connector_subtest("vga-hpd-for-each-pipe", VGA)
> -		test_hotplug_for_each_pipe(&data, port);
>   
>   	igt_fixture() {
>   		igt_display_fini(&data.display);
--------------orYn2FETc1oUXZjdwWyNGVD3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Bilal,<br>
      <br>
      Please find comments inline.<br>
      Fix commit message on both as it seems interchanged.<br>
      <br>
    </p>
    <div class="moz-cite-prefix">On 29-01-2026 13:15, Mohammed Bilal
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">Introduce a unified connector_test() helper that iterates over and tests
all matching connected ports, ensuring clean skipping and consistent
connector handling across DP/HDMI/VGA tests, and avoiding unintended
execution of unrelated fixtures.

Signed-off-by: Mohammed Bilal <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.bilal@intel.com">&lt;mohammed.bilal@intel.com&gt;</a>
---
 tests/chamelium/kms_chamelium_hpd.c | 239 ++++++++++++----------------
 1 file changed, 98 insertions(+), 141 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 8f13b380a..dd1735956 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -465,157 +465,117 @@ IGT_TEST_DESCRIPTION("Testing HPD with a Chamelium board");
 int igt_main()
 {
 	chamelium_data_t data;
-	struct chamelium_port *port;
-	int p;
 
 	igt_fixture() {
 		chamelium_init_test(&amp;data);
 	}
 
 	igt_describe("DisplayPort tests");
-	igt_subtest_group() {
-		igt_fixture() {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
-				data.port_count, 1);
-		}
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd", DisplayPort)</pre>
    </blockquote>
    <br>
    Name your connector_test macro to <span
    style="white-space: pre-wrap">connector_subtest("dp-hpd", DisplayPort)</span> <br>
    <br>
    Patch 1<br>
    introduce connector_test<br>
    <br>
    Patch 2<br>
    Replace all calls to connector_subtest with your connector_test,
    including (audio, frames, edid)<br>
    <br>
    Patch 3<br>
    Remove connector_subtest, rename connector_test -&gt;
    connector_subtest and rename all calls<br>
    <br>
    Thanks and Regards<br>
    Kunal Joshi
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
-			test_hotplug(&amp;data, port, HPD_TOGGLE_COUNT_DP_HDMI,
-				     TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd-fast", DisplayPort) test_hotplug(
-			&amp;data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd-enable-disable-mode", DisplayPort)
-			test_hotplug(&amp;data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd-with-enabled-mode", DisplayPort)
-			test_hotplug(&amp;data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON);
-
-		igt_describe(test_hotplug_for_each_pipe_desc);
-		connector_subtest("dp-hpd-for-each-pipe", DisplayPort)
-			test_hotplug_for_each_pipe(&amp;data, port);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("dp-hpd-after-suspend", DisplayPort)
-			test_suspend_resume_hpd(&amp;data, port, SUSPEND_STATE_MEM,
-						SUSPEND_TEST_NONE);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("dp-hpd-after-hibernate", DisplayPort)
-			test_suspend_resume_hpd(&amp;data, port, SUSPEND_STATE_DISK,
-						SUSPEND_TEST_DEVICES);
-
-		igt_describe(test_hpd_storm_detect_desc);
-		connector_subtest("dp-hpd-storm", DisplayPort)
-			test_hpd_storm_detect(&amp;data, port,
-					      HPD_STORM_PULSE_INTERVAL_DP);
-
-		igt_describe(test_hpd_storm_disable_desc);
-		connector_subtest("dp-hpd-storm-disable", DisplayPort)
-			test_hpd_storm_disable(&amp;data, port,
-					       HPD_STORM_PULSE_INTERVAL_DP);
-	}
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("dp-hpd", DisplayPort, &amp;data, test_hotplug,
+		       HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("dp-hpd-fast", DisplayPort, &amp;data, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("dp-hpd-enable-disable-mode", DisplayPort, &amp;data, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("dp-hpd-with-enabled-mode", DisplayPort, &amp;data, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+
+	igt_describe(test_hotplug_for_each_pipe_desc);
+	connector_test("dp-hpd-for-each-pipe", DisplayPort, &amp;data,
+		       test_hotplug_for_each_pipe);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("dp-hpd-after-suspend", DisplayPort, &amp;data, test_suspend_resume_hpd,
+		       SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("dp-hpd-after-hibernate", DisplayPort, &amp;data, test_suspend_resume_hpd,
+		       SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
+
+	igt_describe(test_hpd_storm_detect_desc);
+	connector_test("dp-hpd-storm", DisplayPort, &amp;data, test_hpd_storm_detect,
+		       HPD_STORM_PULSE_INTERVAL_DP);
+
+	igt_describe(test_hpd_storm_disable_desc);
+	connector_test("dp-hpd-storm-disable", DisplayPort, &amp;data, test_hpd_storm_disable,
+		       HPD_STORM_PULSE_INTERVAL_DP);
 
 	igt_describe("HDMI tests");
-	igt_subtest_group() {
-		igt_fixture() {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_HDMIA,
-				data.port_count, 1);
-		}
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd", HDMIA)
-			test_hotplug(&amp;data, port, HPD_TOGGLE_COUNT_DP_HDMI,
-				     TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd-fast", HDMIA) test_hotplug(
-			&amp;data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd-enable-disable-mode", HDMIA)
-			test_hotplug(&amp;data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd-with-enabled-mode", HDMIA)
-			test_hotplug(&amp;data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON);
-
-		igt_describe(test_hotplug_for_each_pipe_desc);
-		connector_subtest("hdmi-hpd-for-each-pipe", HDMIA)
-			test_hotplug_for_each_pipe(&amp;data, port);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("hdmi-hpd-after-suspend", HDMIA)
-			test_suspend_resume_hpd(&amp;data, port, SUSPEND_STATE_MEM,
-						SUSPEND_TEST_NONE);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("hdmi-hpd-after-hibernate", HDMIA)
-			test_suspend_resume_hpd(&amp;data, port, SUSPEND_STATE_DISK,
-						SUSPEND_TEST_DEVICES);
-
-		igt_describe(test_hpd_storm_detect_desc);
-		connector_subtest("hdmi-hpd-storm", HDMIA)
-			test_hpd_storm_detect(&amp;data, port,
-					      HPD_STORM_PULSE_INTERVAL_HDMI);
-
-		igt_describe(test_hpd_storm_disable_desc);
-		connector_subtest("hdmi-hpd-storm-disable", HDMIA)
-			test_hpd_storm_disable(&amp;data, port,
-					       HPD_STORM_PULSE_INTERVAL_HDMI);
-	}
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("hdmi-hpd", HDMIA, &amp;data, test_hotplug,
+		       HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("hdmi-hpd-fast", HDMIA, &amp;data, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("hdmi-hpd-enable-disable-mode", HDMIA, &amp;data, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("hdmi-hpd-with-enabled-mode", HDMIA, &amp;data, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+
+	igt_describe(test_hotplug_for_each_pipe_desc);
+	connector_test("hdmi-hpd-for-each-pipe", HDMIA, &amp;data, test_hotplug_for_each_pipe);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("hdmi-hpd-after-suspend", HDMIA, &amp;data, test_suspend_resume_hpd,
+		       SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("hdmi-hpd-after-hibernate", HDMIA, &amp;data, test_suspend_resume_hpd,
+		       SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
+
+	igt_describe(test_hpd_storm_detect_desc);
+	connector_test("hdmi-hpd-storm", HDMIA, &amp;data, test_hpd_storm_detect,
+		       HPD_STORM_PULSE_INTERVAL_HDMI);
+
+	igt_describe(test_hpd_storm_disable_desc);
+	connector_test("hdmi-hpd-storm-disable", HDMIA, &amp;data, test_hpd_storm_disable,
+		       HPD_STORM_PULSE_INTERVAL_HDMI);
 
 	igt_describe("VGA tests");
-	igt_subtest_group() {
-		igt_fixture() {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_VGA,
-				data.port_count, 1);
-		}
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd", VGA) test_hotplug(
-			&amp;data, port, HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd-fast", VGA) test_hotplug(
-			&amp;data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd-enable-disable-mode", VGA)
-			test_hotplug(&amp;data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd-with-enabled-mode", VGA)
-			test_hotplug(&amp;data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("vga-hpd-after-suspend", VGA)
-			test_suspend_resume_hpd(&amp;data, port, SUSPEND_STATE_MEM,
-						SUSPEND_TEST_NONE);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("vga-hpd-after-hibernate", VGA)
-			test_suspend_resume_hpd(&amp;data, port, SUSPEND_STATE_DISK,
-						SUSPEND_TEST_DEVICES);
-
-		igt_describe(test_hpd_without_ddc_desc);
-		connector_subtest("vga-hpd-without-ddc", VGA)
-			test_hpd_without_ddc(&amp;data, port);
-	}
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("vga-hpd", VGA, &amp;data, test_hotplug,
+		       HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("vga-hpd-fast", VGA, &amp;data, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("vga-hpd-enable-disable-mode", VGA, &amp;data,
+		       test_hotplug, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("vga-hpd-with-enabled-mode", VGA, &amp;data,
+		       test_hotplug, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("vga-hpd-after-suspend", VGA, &amp;data,
+		       test_suspend_resume_hpd, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("vga-hpd-after-hibernate", VGA, &amp;data,
+		       test_suspend_resume_hpd, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
+
+	igt_describe(test_hpd_without_ddc_desc);
+	connector_test("vga-hpd-without-ddc", VGA, &amp;data, test_hpd_without_ddc);
+
+	igt_describe(test_hotplug_for_each_pipe_desc);
+	connector_test("vga-hpd-for-each-pipe", VGA, &amp;data, test_hotplug_for_each_pipe);
 
 	igt_describe("Tests that operate on all connectors");
 	igt_subtest_group() {
@@ -635,9 +595,6 @@ int igt_main()
 						       SUSPEND_TEST_DEVICES);
 	}
 
-	igt_describe(test_hotplug_for_each_pipe_desc);
-	connector_subtest("vga-hpd-for-each-pipe", VGA)
-		test_hotplug_for_each_pipe(&amp;data, port);
 
 	igt_fixture() {
 		igt_display_fini(&amp;data.display);
</pre>
    </blockquote>
  </body>
</html>

--------------orYn2FETc1oUXZjdwWyNGVD3--
