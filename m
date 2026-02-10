Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82BFEA8115
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 13:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A4710E573;
	Tue, 10 Feb 2026 13:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="asAdXzac";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E123B10E573
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 13:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770729948; x=1802265948;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=2hLffajNYgp4JlWzzCRvqpuHxBqKQTfRtcw+r6rtWCE=;
 b=asAdXzacjpmWd5gFwU0Fxt9UHwMNqFt20BAZXLDzRalNWxSybnLL89tW
 13cgYfXpStcKUtF37+FT0c4chEf84ikMMLSfvuWbNpzFgQgI7MKfIGHok
 BBsswfuNIxIAuACT2BoiYHm/TBK11TeXqxe7XuZCfw8DeNccWjFVqrd2q
 8qN8m9UtMfiGEVOYaohG5Fv9kjmr/t45HgpvaBFm7S5GecyI/+1g5Yy0x
 dv0pdeQqTTCEOoxzrCsSf0Gyp1o6SfsqnAgSkcBTZXmLcvr2JcQJLa54f
 Q1E18eD+vUo4YuOSpnvodAv8tfGvQeXDLsuqmVJDE30O8cE3xOi3LlUrW Q==;
X-CSE-ConnectionGUID: 8m4jR4aIQW+IW77IDrogwg==
X-CSE-MsgGUID: qS2dg2SCRHqQhNVIzfr9sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89270268"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89270268"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 05:25:48 -0800
X-CSE-ConnectionGUID: wWqS+gwOSR+CpvwL3k8KjQ==
X-CSE-MsgGUID: vnIamqJ4Rbyeiqk01mKFww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216434177"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 05:25:46 -0800
Date: Tue, 10 Feb 2026 14:25:44 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>
cc: "Grzelak, Michal" <michal.grzelak@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1] xe/igt_kmod_unbind: release audio before
 unbinding xe
In-Reply-To: <DM4PR11MB631299DF160170E04D441FCA9062A@DM4PR11MB6312.namprd11.prod.outlook.com>
Message-ID: <28c8c955-306c-7e90-6474-051a350eb6d7@intel.com>
References: <20260206224106.3845768-1-michal.grzelak@intel.com>
 <DM4PR11MB631299DF160170E04D441FCA9062A@DM4PR11MB6312.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="1527428566-708289798-1770728302=:124321"
Content-ID: <c0b6570a-e9de-b111-a67b-67d6e7e5664b@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1527428566-708289798-1770728302=:124321
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <5a6c658f-7a1c-669a-9f6c-3f393a769dfa@intel.com>

Hi Jeevan,

On Tue, 10 Feb 2026, B, Jeevan wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Micha³
>> Grzelak
>> Sent: Saturday, February 7, 2026 4:11 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Grzelak, Michal <michal.grzelak@intel.com>
>> Subject: [PATCH i-g-t v1] xe/igt_kmod_unbind: release audio before
>> unbinding xe
>>
>> Audio driver should be unloaded before unbinding/unloading xe.
>> Otherwise audio has no chance to release the refcount:
>>
>> <7> [485.586766] xe 0000:03:00.0: [drm:drm_client_release] fbdev <3>
>> [485.587690] xe 0000:03:00.0: [drm] *ERROR* audio power refcount 1 after
>> unbind
>>
>> When audio is not properly released, further testing leads to warnings,
>> timeouts, etc. Release audio before xe is unbound.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7169
>> Signed-off-by: Micha³ Grzelak <michal.grzelak@intel.com>
>> ---
>>  lib/igt_kmod.c                   | 1 +
>>  tests/intel/xe_configfs.c        | 7 +++++++
>>  tests/intel/xe_fault_injection.c | 3 +++
>>  tests/intel/xe_survivability.c   | 2 ++
>>  4 files changed, 13 insertions(+)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c index d1d7a3840..82c005ff7
>> 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -716,6 +716,7 @@ igt_intel_driver_unload(const char *driver)
>>
>>  int igt_xe_driver_unload(void)
>>  {
>> +	igt_audio_driver_unload(NULL);
>>  	igt_kmod_unbind("xe", NULL);
>>
>>  	igt_kmod_unload("xe");
>> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c index
>> d2dfd2e87..9f32e2fc1 100644
>> --- a/tests/intel/xe_configfs.c
>> +++ b/tests/intel/xe_configfs.c
>> @@ -55,6 +55,7 @@ static void restore(int sig)  {
>>  	int configfs_fd;
>>
>> +	igt_audio_driver_unload(NULL);
>>  	igt_kmod_unbind("xe", bus_addr);
>>
>>  	/* Drop all custom configfs settings from subtests */ @@ -69,6 +70,7
>> @@ static void restore(int sig)
>>
>>  static void set_survivability_mode(int configfs_device_fd, bool value)  {
>> +	igt_audio_driver_unload(NULL);
>
> This should work fine when we have unload and load tests, My doubt is that when we are trying to unbind and bind if audio driver is unloaded
> Will that affect any tests which has dependency ?? kms_hdmi_inject tests.
>

Just got ack from Kai and either unloading / unbinding audio driver is
good. Shouldn't affect tests with dependencies.

BR,
Micha³

>>  	igt_kmod_unbind("xe", bus_addr);
>>  	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode",
>> value);
>>  	igt_kmod_bind("xe", bus_addr);
>> @@ -113,6 +115,7 @@ static void test_engines_allowed_invalid(int
>> configfs_device_fd)
>>  	 * These only test if engine parsing is correct, so just make sure
>>  	 * there's no device bound
>>  	 */
>> +	igt_audio_driver_unload(NULL);
>>  	igt_kmod_unbind("xe", bus_addr);
>>
>>  	for (size_t i = 0; i < ARRAY_SIZE(values); i++) { @@ -139,6 +142,7 @@
>> static void test_engines_allowed(int configfs_device_fd)
>>  	 * These only test if engine parsing is correct, so just make sure
>>  	 * there's no device bound
>>  	 */
>> +	igt_audio_driver_unload(NULL);
>>  	igt_kmod_unbind("xe", bus_addr);
>>
>>  	for (size_t i = 0; i < ARRAY_SIZE(values); i++) { @@ -169,6 +173,7 @@
>> static void test_gt_types_allowed(int configfs_device_fd)
>>  	 * These only test if gt type parsing is correct, so just make sure
>>  	 * there's no device bound
>>  	 */
>> +	igt_audio_driver_unload(NULL);
>>  	igt_kmod_unbind("xe", bus_addr);
>>
>>  	for (size_t i = 0; i < ARRAY_SIZE(values); i++) { @@ -231,6 +236,7 @@
>> static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
>>  	 * These only test if command parsing is correct,
>>  	 * so just make sure there's no device bound
>>  	 */
>> +	igt_audio_driver_unload(NULL);
>>  	igt_kmod_unbind("xe", bus_addr);
>>
>>  	for (size_t i = 0; i < ARRAY_SIZE(values); i++) { @@ -310,6 +316,7 @@
>> static void test_ctx_restore(int configfs_device_fd, const char *type)
>>  	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
>>  		const struct value *v = &values[i];
>>
>> +		igt_audio_driver_unload(NULL);
>>  		igt_kmod_unbind("xe", bus_addr);
>>
>>  		igt_info("Test %s\n", v->test);
>> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>> index f3bfc4b40..65add71a1 100644
>> --- a/tests/intel/xe_fault_injection.c
>> +++ b/tests/intel/xe_fault_injection.c
>> @@ -309,6 +309,7 @@ static void probe_fail_guc(int fd, const char
>> pci_slot[], const char function_na
>>  		fault_params->times = MAX_INJECTIONS_PER_ITER;
>>  		setup_injection_fault(fault_params);
>>  		inject_fault_probe(fd, pci_slot, function_name);
>> +		igt_audio_driver_unload(NULL);
>>  		igt_kmod_unbind("xe", pci_slot);
>>
>>  		/*
>> @@ -662,6 +663,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler,
>> NULL)
>>  			oa_add_config_fail(fd, sysfs, devid, pci_slot, s-
>>> name);
>>
>>  	igt_fixture() {
>> +		igt_audio_driver_unload(NULL);
>>  		igt_kmod_unbind("xe", pci_slot);
>>  	}
>>
>> @@ -673,6 +675,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler,
>> NULL)
>>  			err = inject_fault_probe(fd, pci_slot, s->name);
>>
>>  			igt_assert_eq(should_pass ? 0 : INJECT_ERRNO, err);
>> +			igt_audio_driver_unload(NULL);
>>  			igt_kmod_unbind("xe", pci_slot);
>>  		}
>>
>> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c index
>> 552414903..e842a76ec 100644
>> --- a/tests/intel/xe_survivability.c
>> +++ b/tests/intel/xe_survivability.c
>> @@ -150,6 +150,7 @@ static void restore(int sig)  {
>>  	int configfs_fd;
>>
>> +	igt_audio_driver_unload(NULL);
>>  	igt_kmod_unbind("xe", bus_addr);
>>
>>  	configfs_fd = igt_configfs_open("xe"); @@ -162,6 +163,7 @@ static
>> void restore(int sig)
>>
>>  static void set_survivability_mode(int configfs_device_fd, bool value)  {
>> +	igt_audio_driver_unload(NULL);
>>  	igt_kmod_unbind("xe", bus_addr);
>>  	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode",
>> value);
>>  	igt_kmod_bind("xe", bus_addr);
>> --
>> 2.45.2
>
>
--1527428566-708289798-1770728302=:124321--
