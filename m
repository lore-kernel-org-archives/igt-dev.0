Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBD3CA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 12:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1943110E65F;
	Tue, 26 Aug 2025 12:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ih8S+daC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E470E10E651
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 12:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756212704; x=1787748704;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=i5FYLFIETTer6G23fukVijYZBrKud0KAj8eEfBlThwg=;
 b=ih8S+daC9SHr42k3DphDrQiZ00c1q+ijHylo9x8mvyGl5OoVQjmVMU4N
 fTrJWwIRSvKuOqdT4/8Ipk7xMZfWLjJGYSnpx5hPFhSe7WZuwGOtKjDqm
 f1zGBSF9iUlnILCqw7/YWAaeOhvabF300QjxnwOgnLVeDjQJupcTsIEM9
 wVBW8WebeuTx1WBMXbWIToRl3dbqCF+uMNGBzGkH/0xU+erN43F0yOspX
 QW+CSzIIPg5a7Drwz/CVSiLCMX5jf72ghZ/heaX7O4DmB0RXJtNjF55GE
 GHfaWLmaHF9Zaj7LT3K7VXTrOMBInVc5c2VgkgSnpiVLDmuv+NIH60dW9 w==;
X-CSE-ConnectionGUID: 93wTCZ1eSjS70gHn/Y/fUw==
X-CSE-MsgGUID: 1EA+zDuGQmK6eYXdYTnbpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="61081307"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="61081307"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 05:51:43 -0700
X-CSE-ConnectionGUID: 0WlWTknNQWmG6c/funYN6w==
X-CSE-MsgGUID: lwwGz4/6Sc6LAtTlshBeYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174871936"
Received: from jmkrefta-mobl2.ger.corp.intel.com (HELO [10.245.255.250])
 ([10.245.255.250])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 05:51:42 -0700
Message-ID: <140addea-b8f2-4a5e-8c62-2d40e16ed38d@linux.intel.com>
Date: Tue, 26 Aug 2025 14:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sysfs_file_perm: Verify sysfs file
 permissions for security
To: Michal Winiarski <michal.winiarski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20250813131948.573785-1-peter.senna@linux.intel.com>
 <tt62zjh6s72wxgz2eozbnm34ewxob323gcxfzwrm5sjv6l6e3y@u5dhkues2i4d>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <tt62zjh6s72wxgz2eozbnm34ewxob323gcxfzwrm5sjv6l6e3y@u5dhkues2i4d>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

Just a note to let you know that I am abandoning this patch. I will
modify existing tests instead of creating a a separate security test
like I attempted with this patch.

Thank you for your comments,

Peter

On 8/25/2025 4:09 PM, Michal Winiarski wrote:
> On Wed, Aug 13, 2025 at 03:19:47PM +0200, Peter Senna Tschudin wrote:
>> This IGT adds checks for the 13 sysfs files identified in the Xe threat
>> model, ensuring they are only writable by the root user. If any of these
>> files are writable by non-root users, a warning is issued.
> 
> As sysfs is a proper uAPI, I'd expect we already have tests that
> excercise those sysfs'es from functional angle.
> 
>>
>> When files are not present in the system, only informational messages
>> are logged. No warnings or test aborts occur in such cases.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Michal Winiarski <michal.winiarski@intel.com>
>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> ---
>>  tests/intel/xe_sysfs_file_perm.c | 578 +++++++++++++++++++++++++++++++
>>  tests/meson.build                |   1 +
>>  2 files changed, 579 insertions(+)
>>  create mode 100644 tests/intel/xe_sysfs_file_perm.c
>>
>> diff --git a/tests/intel/xe_sysfs_file_perm.c b/tests/intel/xe_sysfs_file_perm.c
>> new file mode 100644
>> index 000000000..2833de10c
>> --- /dev/null
>> +++ b/tests/intel/xe_sysfs_file_perm.c
>> @@ -0,0 +1,578 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
> 
> [...]
> 
>> +
>> +igt_main
>> +{
>> +	struct igt_list_head fds_list;
>> +	struct igt_list_head files_list;
>> +	struct igt_list_head pattern_list;
>> +
>> +	/**
>> +	 * Do not change the list below without checking the Xe threat
>> +	 * modeling first. You can contact peter.senna@intel.com or
>> +	 * michal.winiarski@intel.com for questions and support.
>> +	 */
>> +
> 
> And indeed - it looks like we do have at least one existing test for
> each of those files.
> 
>> +	/* DO NOT CHANGE START */
>> +	static const char * const gt_patterns[] = {
>> +		"ccs_mode",
> 
> xe_compute
> 
>> +		"engines/[a-zA-Z0-9]+/job_timeout_ms",
>> +		"engines/[a-zA-Z0-9]+/preempt_timeout_us",
>> +		"engines/[a-zA-Z0-9]+/timeslice_duration_min",
>> +		"engines/[a-zA-Z0-9]+/timeslice_duration_max",
>> +		"engines/[a-zA-Z0-9]+/timeslice_duration_us",
> 
> xe_sysfs_scheduler
> 
>> +		"freq0/max_freq",
>> +		"freq0/min_freq"
> 
> xe_gt_freq
> 
>> +	};
>> +
>> +	static const char * const hwmon_patterns[] = {
>> +		"power[0-9]+_crit",
>> +		"curr[0-9]+_crit",
>> +		"power[0-9]+_max",
>> +		"power[0-9]+_max_interval"
> 
> intel_hwmon
> 
>> +	};
>> +
>> +	static const char * const devices_patterns[] = {
>> +		"vram_d3cold_threshold"
> 
> xe_pm
> 
> Access rights are just a property of some functionality, and I would
> prefer to test it in the right context.
> This could be handled as a subtest in a functional test (checking
> whether the API being used has proper access rights), instead of having
> a test that tries to check the access rights of everything that the
> driver exposes.
> 
> Thanks,
> -Michał
> 
>> +	};
>> +
>> +	struct dir_input dir_inputs[DIR_COUNT] = {
>> +		{ GT_DIR, gt_patterns, ARRAY_SIZE(gt_patterns) },
>> +		{ HWMON_DIR, hwmon_patterns, ARRAY_SIZE(hwmon_patterns) },
>> +		{ DEVICES_DIR, devices_patterns, ARRAY_SIZE(devices_patterns) }
>> +	};
>> +	/* DO NOT CHANGE END */
>> +
>> +	igt_fixture {
>> +		IGT_INIT_LIST_HEAD(&fds_list);
>> +		IGT_INIT_LIST_HEAD(&pattern_list);
>> +		IGT_INIT_LIST_HEAD(&files_list);
>> +
>> +		igt_require(prepare_patterns(dir_inputs, &pattern_list));
>> +
>> +		igt_require(fds_open_all(&fds_list));
>> +		igt_require(search_files(&fds_list, &pattern_list, &files_list));
>> +		igt_require(fds_close_and_free_list(&fds_list));
>> +
>> +		/* We do not warn or abort if not all patterns match
>> +		 * because not all nodes are always available
>> +		 */
>> +		check_pattern_match(&pattern_list);
>> +	}
>> +
>> +	igt_describe("Check if only root can write to important sysfs files.");
>> +	igt_subtest("check-file-permissions")
>> +		igt_assert(check_files_permissions(&files_list));
>> +
>> +	igt_fixture {
>> +		struct pattern_node *pattern_node, *pattern_tmp;
>> +		struct file_node *file_node, *file_tmp;
>> +
>> +		igt_list_for_each_entry_safe(pattern_node, pattern_tmp, &pattern_list, link) {
>> +			/* pattern_node->pattern is static and const and
>> +			 * should not be freed
>> +			 */
>> +			regfree(&pattern_node->regex);
>> +			igt_list_del(&pattern_node->link);
>> +			free(pattern_node);
>> +		}
>> +
>> +		igt_list_for_each_entry_safe(file_node, file_tmp, &files_list, link) {
>> +			free(file_node->full_path);
>> +			igt_list_del(&file_node->link);
>> +			free(file_node);
>> +		}
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 5c01c64e9..d904dffcd 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -330,6 +330,7 @@ intel_xe_progs = [
>>  	'xe_sriov_flr',
>>  	'xe_sriov_scheduling',
>>  	'xe_sysfs_defaults',
>> +	'xe_sysfs_file_perm',
>>  	'xe_sysfs_preempt_timeout',
>>  	'xe_sysfs_scheduler',
>>          'xe_sysfs_timeslice_duration',
>> -- 
>> 2.43.0
>>

