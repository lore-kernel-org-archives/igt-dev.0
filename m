Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288A7C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 10:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D762510E834;
	Thu, 13 Mar 2025 10:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwmSRXG7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642B110E834
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741862006; x=1773398006;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HfDajoL3BAuewPydVnwdfCoo1eYw/BAHaWg/VCjdLfk=;
 b=mwmSRXG7+mVw8CBywYT3mrY6SskgYd1U+i+juCigiP3WdzwwfcNpLyoq
 KnB5L4P1DW+3ja8zwzNrPyBAMWDNpqEMaT2PfAlR5YLPAE+bbBW5L+bXn
 jk1S/Ar48M4z6F54kc4t4+RTTAsZzNiTVIS5eiop/eRg0kKJ+pNnOX8By
 7BkNKuUyDC+KdphGUXb5GW0eqs7yb91JLR7ADl2gOBWGeveyNFf/Qk35V
 LWj4tE0oV3z8TqoGYCIYemIoiNT4jAvxwHIP72H6TlY2Yf8/snnxc6zyv
 l3Hue3MnhfWw2vqEovu/8jT43Wk59tPb9mnh3mHD5LJlSjWMXb0x+x4Cx A==;
X-CSE-ConnectionGUID: nEOchYGHSGiLj8L9ednGFw==
X-CSE-MsgGUID: CPTP2scKRhKqu8YD93dDjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43103399"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="43103399"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 03:33:26 -0700
X-CSE-ConnectionGUID: DffDlxgvQLaDgbqXGCeNLQ==
X-CSE-MsgGUID: mAhe86C/TRiaAWceohMSBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="120904510"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.3.119])
 ([10.246.3.119])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 03:33:24 -0700
Message-ID: <c4cfe888-24e0-44d2-b8d8-f30a32e447cb@linux.intel.com>
Date: Thu, 13 Mar 2025 11:33:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_pm: Add a check for power
 management capability
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250311170144.602535-1-jakub1.kolakowski@intel.com>
 <20250311170144.602535-3-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250311170144.602535-3-jakub1.kolakowski@intel.com>
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



On 3/11/2025 6:01 PM, Jakub Kolakowski wrote:
> Add a check for power management capability of device tested in tests
> related to D-states. Currently if test is started on configuration
> that does not support the PM capability it doesn't skip, instead
> depending on test it may fail, abort or timeout.
> With this change test will skip with a clear message why it did.
> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   tests/intel/xe_pm.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index c2026474d..25fc7bc9f 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -854,6 +854,8 @@ igt_main
>   
>   		for (const struct d_state *d = d_states; d->name; d++) {
>   			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
> +				igt_require_f(igt_is_pm_supported(device.pci_root),
> +								"PCI power management capability not found\n");

Can we move the check to setup_d3 to avoid duplication ?

>   				igt_assert(setup_d3(device, d->state));
>   				test_exec(device, 1, 2, s->state, NO_RPM, 0);
>   				cleanup_d3(device);
> @@ -870,18 +872,24 @@ igt_main
>   
>   	for (const struct d_state *d = d_states; d->name; d++) {
>   		igt_subtest_f("%s-basic", d->name) {
> +			igt_require_f(igt_is_pm_supported(device.pci_root),
> +								"PCI power management capability not found\n");
>   			igt_assert(setup_d3(device, d->state));
>   			igt_assert(in_d3(device, d->state));
>   			cleanup_d3(device);
>   		}
>   
>   		igt_subtest_f("%s-basic-exec", d->name) {
> +			igt_require_f(igt_is_pm_supported(device.pci_root),
> +								"PCI power management capability not found\n");
>   			igt_assert(setup_d3(device, d->state));
>   			test_exec(device, 1, 1, NO_SUSPEND, d->state, 0);
>   			cleanup_d3(device);
>   		}
>   
>   		igt_subtest_f("%s-multiple-execs", d->name) {
> +			igt_require_f(igt_is_pm_supported(device.pci_root),
> +								"PCI power management capability not found\n");
>   			igt_assert(setup_d3(device, d->state));
>   			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0);
>   			cleanup_d3(device);
> @@ -890,6 +898,8 @@ igt_main
>   		igt_describe_f("Validate mmap memory mappings with system region,"
>   			       "when device along with parent bridge in %s", d->name);
>   		igt_subtest_f("%s-mmap-system", d->name) {
> +			igt_require_f(igt_is_pm_supported(device.pci_root),
> +								"PCI power management capability not found\n");
>   			igt_assert(setup_d3(device, d->state));
>   			test_mmap(device, system_memory(device.fd_xe), 0,
>   				  READ, d->state);
> @@ -903,6 +913,8 @@ igt_main
>   		igt_subtest_f("%s-mmap-vram", d->name) {
>   			int delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
>   
> +			igt_require_f(igt_is_pm_supported(device.pci_root),
> +								"PCI power management capability not found\n");
>   			/* Give some auto suspend delay to validate rpm active during page fault */
>   			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
>   			igt_assert(setup_d3(device, d->state));
> @@ -919,6 +931,8 @@ igt_main
>   
>   		igt_describe_f("Validate the contents of mocs registers over %s state", d->name);
>   		igt_subtest_f("%s-mocs", d->name) {
> +			igt_require_f(igt_is_pm_supported(device.pci_root),
> +								"PCI power management capability not found\n");
>   			igt_assert(setup_d3(device, d->state));
>   			test_mocs_suspend_resume(device, NO_SUSPEND, d->state);
>   			cleanup_d3(device);
> @@ -928,6 +942,8 @@ igt_main
>   	igt_describe("Validate whether card is limited to d3hot,"
>   		     "if vram used > vram threshold");
>   	igt_subtest("vram-d3cold-threshold") {
> +		igt_require_f(igt_is_pm_supported(device.pci_root),
> +								"PCI power management capability not found\n");
>   		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
>   		igt_install_exit_handler(vram_d3cold_threshold_restore);
>   		test_vram_d3cold_threshold(device, sysfs_fd);

