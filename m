Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5597C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 15:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B87510E1CC;
	Mon, 10 Feb 2025 15:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWVuyOEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C40F10E1CC
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739203100; x=1770739100;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pzQ83fKQwTlAA9iOWt3VQExf22kKIJR5d7Kgj6qAIOw=;
 b=LWVuyOEmfA75bmm1p+CCppp9nWTQmfmufSD2O3c/CIq6MFBOL8O8n54E
 E/INLPZ5M3Znf9kPmXu2EYMeRjHWg8C4jqAAsaAh3pCe6bjwBSkCjTVcy
 xXBJzG90m+mDYt+RCdKtVqJNo6G54OyPhUaJh7vRsgU9JqLhBDfN06+mr
 jflb1SMz9WuFMXiaiEptD94ziPpgygzTrUyo1YM7W/VQC5XfY8tgijLOW
 HxBDKYprbYcw86bLqQDq143ApSU7ZefewhPg4Fvs5FzpeH2cZ4vaEwtno
 +owCiNMqCgS5UPiaLYvMsH/t4VA4UYAc2qwTgzFNkbUtjjhlP3VmkRhoH w==;
X-CSE-ConnectionGUID: ss3k9UDATBSNAgcPEXnjcw==
X-CSE-MsgGUID: HXzEafS9RYqJGWzX5VT0FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57202540"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="57202540"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 07:58:20 -0800
X-CSE-ConnectionGUID: R1VMu0oBTkOZfalSSfRlBA==
X-CSE-MsgGUID: 42FTHM7XRw6DEBWW9arcmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135484585"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 07:58:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Leo Li <sunpeng.li@amd.com>, Pranay Samala <pranay.samala@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, "Wheeler, Daniel" <Daniel.Wheeler@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Reduce debug loglevel
 dynamically
In-Reply-To: <abf8b026-20b6-4566-9823-bb558deb97a7@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250128052825.424586-1-pranay.samala@intel.com>
 <abf8b026-20b6-4566-9823-bb558deb97a7@amd.com>
Date: Mon, 10 Feb 2025 17:58:12 +0200
Message-ID: <877c5x4wrv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 10 Feb 2025, Leo Li <sunpeng.li@amd.com> wrote:
> Hi Pranay,
>
> This change can also increase log verbosity; we observe this with amdgpu.
> Details inline.
>
> On 2025-01-28 00:28, Pranay Samala wrote:
>> This test is getting killed due to exceeding disk usage
>> limit on CI environment because its logging to many logs.
>> 
>> So dynamically reducing the debug log level to 10.
>> 
>> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
>> ---
>>   tests/kms_cursor_legacy.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>> 
>> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
>> index 1f082df2d..533972cd4 100644
>> --- a/tests/kms_cursor_legacy.c
>> +++ b/tests/kms_cursor_legacy.c
>> @@ -40,6 +40,7 @@
>>   #include "igt_psr.h"
>>   #include "igt_rand.h"
>>   #include "igt_stats.h"
>> +#include "igt_sysfs.h"
>>   
>>   /**
>>    * SUBTEST: %s-%s
>> @@ -1840,6 +1841,7 @@ igt_main
>>   	};
>>   
>>   	igt_fixture {
>> +		int dir, current_log_level;
>>   		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>>   		kmstest_set_vt_graphics_mode();
>>   
>> @@ -1850,6 +1852,15 @@ igt_main
>>   		 * fetch is enabled, so switching PSR1 for this whole test.
>>   		 */
>>   		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
>> +
>> +		dir = igt_sysfs_drm_module_params_open();
>> +		if (dir >= 0) {
>> +			current_log_level = igt_drm_debug_level_get(dir);
>> +			close(dir);
>> +
>> +			if (current_log_level > 10)
>> +				igt_drm_debug_level_update(10);
>
> Isn't the DRM debug mask a bitmask?
> https://elixir.bootlin.com/linux/v6.13.1/source/include/drm/drm_print.h#L97
>
> So setting 10 isn't guaranteed to reduce verbosity, depending on how the DRM
> driver uses the various drm_* debug prints.

Ugh. Yes.

> What is guaranteed to reduce verbosity is to unset unwanted bits. Maybe that is
> the better approach?
>
> For example, instead of
> `if (current_log_level > 10)`,
>
> Do
>
> `igt_drm_debug_level_update(current_log_level & !(DRM_UT_CORE | ...);`

Ditto for commit a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing
debug loglevel dynamically"). It got to v6 and nobody noticed?

Ditto for commit 56b91193b825 ("lib/igt_sysfs: Implement dynamic
adjustment of debug log level") adding the whole thing. It should not be
referred to as "level" because it has nothing to do with "level". It
also makes no sense to print it out in decimal; hex makes more sense.


BR,
Jani.


>
> Thanks,
> Leo
>
>> +		}
>>   	}
>>   
>>   	igt_describe("Test checks how many cursor updates we can fit between vblanks "
>

-- 
Jani Nikula, Intel
