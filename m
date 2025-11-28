Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA11CFD376
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 11:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226D210E8C8;
	Fri, 28 Nov 2025 11:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fp+r4Oic";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8626D10E8C8
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 11:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764327852; x=1795863852;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YqzegU6WMcAXJL5Ol8z3SulTuq8rMIJfnFZUZvojS88=;
 b=Fp+r4OicjeOIvqDUX0APO7LN9snRV0e2zxjoEBWooWEajZJq6vAedWbF
 jHLKbl55GS+lrsbw2JwGfX1K71DUARP+xPF9O6Zxx7HkK1UDhF7cT46wy
 paPlFTO2ZT696+708+tZnBRkTa6yIGQRn6kfIbZ6kXtCfO0iRr/sLQcZZ
 9nvaw8q5owX3GngEId8zzxC85nQw82LRfDA68MGi8VZaTh0f1oBLuDL0A
 lQMK1hThhgilmfDAk0lubhfXmKYv8+xGHfSsCTNMdGKOjuwx4DVJPW/VB
 v8zvhgMqh7ERYzYquBTsOKcWaOqu+J+45L/Q6CTABWnsABZH6KZGhF/wW g==;
X-CSE-ConnectionGUID: LeCB05h2Taqv4P3AD4PfWw==
X-CSE-MsgGUID: lmGNZ7yWTjyPoCFw0Zw/6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77720694"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="77720694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 03:04:12 -0800
X-CSE-ConnectionGUID: xh3nb7OPTZu1dfhcj2FmHg==
X-CSE-MsgGUID: JfmwPN5pQ+iobgH7mNSnDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="224143130"
Received: from mkrakus-mobl1.ger.corp.intel.com (HELO [10.246.23.186])
 ([10.246.23.186])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 03:04:10 -0800
Message-ID: <09a5d3b7-20a9-4a68-9fc3-c6135508c181@linux.intel.com>
Date: Fri, 28 Nov 2025 12:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_auto_provisioning: Add
 restore_auto_provisioning tests
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>
References: <20251023203233.592113-1-marcin.bernatowicz@linux.intel.com>
 <55200caf-2c88-4d3c-9e7b-20040d1f020a@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <55200caf-2c88-4d3c-9e7b-20040d1f020a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 11/19/2025 12:44 PM, Laguna, Lukasz wrote:
> On 10/23/2025 22:32, Marcin Bernatowicz wrote:
>> Add subtests that verify restore_auto_provisioning with:
>> - disabled VFs (succeeds; idempotent)
>> - enabled VFs in auto mode (no-op)
>> - enabled VFs in custom mode (-EBUSY; succeeds after disable)
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   tests/intel/xe_sriov_auto_provisioning.c | 136 ++++++++++++++++++++++-
>>   1 file changed, 135 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_sriov_auto_provisioning.c 
>> b/tests/intel/xe_sriov_auto_provisioning.c
>> index 451c3c5ca..74cea5422 100644
>> --- a/tests/intel/xe_sriov_auto_provisioning.c
>> +++ b/tests/intel/xe_sriov_auto_provisioning.c
>> @@ -290,6 +290,98 @@ static void check_selfconfig(int pf_fd, unsigned 
>> int vf_num, unsigned int flags)
>>       igt_fail_on_f(fails, "selfconfig check failed\n");
>>   }
>>   +static bool empty_shared_res_attributes(int pf_fd)
>> +{
>> +    struct xe_sriov_provisioned_range *ranges = NULL;
>> +    enum xe_sriov_shared_res res;
>> +    unsigned int gt;
>> +    int fails = 0;
>> +
>> +    xe_for_each_gt(pf_fd, gt)
>> +        xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt)
>> +            if (xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res, 
>> gt, &ranges, 0))
>> +                fails++;
>> +
>> +    return fails == 0;
>> +}
>> +
>> +/**
>> + * SUBTEST: restore-auto-provisioning-disabled-vfs
>> + * Description: Verify restore auto provisioning when VFs are disabled
>> + */
>> +static void restore_auto_provisioning_disabled_vfs(int pf_fd)
>> +{
>> + 
>> igt_require(xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd));
>> +    igt_skip_on(igt_sriov_get_enabled_vfs(pf_fd));
>
> We have such prerequisite in the main test fixture so I'm not sure if 
> we need it here.
ok
>
> Let's add a new line to separate prerequisites from the subtest 
> operations.
ok
>
>> +    igt_assert_eq(0, 
>> xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
>> +    igt_assert(empty_shared_res_attributes(pf_fd));
>> +    // check second call is noop
>
> I think /* ... */ comment style is preferred in linux kernel
ok
>
>
>> +    igt_assert_eq(0, 
>> xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
>> +    igt_assert(empty_shared_res_attributes(pf_fd));
>> +}
>> +
>> +/**
>> + * SUBTEST: restore-auto-provisioning-enabled-vfs-auto_mode
>
> s/auto_mode/auto-mode ?
good catch, thanks
>
>> + * Description: Verify that restore auto provisioning with VFs 
>> enabled in auto mode is noop
>> + */
>> +static void restore_auto_provisioning_enabled_vfs_auto_mode(int 
>> pf_fd, unsigned int num_vfs)
>> +{
>> + 
>> igt_require(xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd));
>> +    igt_skip_on(igt_sriov_get_enabled_vfs(pf_fd));
>> +    igt_require(empty_shared_res_attributes(pf_fd));
>> +    // ensure auto provisioning on
>> +    igt_assert_eq(0, 
>> xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
>> +    igt_assert(empty_shared_res_attributes(pf_fd));
>
> New line + comments format
>
>> + igt_sriov_disable_driver_autoprobe(pf_fd);
>> +    igt_sriov_enable_vfs(pf_fd, num_vfs);
>> +    // ensure noop
>> +    igt_assert_eq(0, 
>> xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
>> +    igt_assert(!empty_shared_res_attributes(pf_fd));
>> +    igt_sriov_disable_vfs(pf_fd);
>> +    igt_assert(empty_shared_res_attributes(pf_fd));
>> +}
>> +
>> +/**
>> + * SUBTEST: restore-auto-provisioning-enabled-vfs-custom-mode
>> + * Description: Verify that restore auto provisioning with VFs 
>> enabled in custom mode is rejected
>> + *        and auto provisioning restored after VFs disabled
>> + */
>> +static void restore_auto_provisioning_enabled_vfs_custom_mode(int 
>> pf_fd, unsigned int num_vfs)
>> +{
>> +    enum xe_sriov_shared_res res;
>> +    unsigned int gt;
>> +    uint64_t dummy_value = 10;
>> +    uint64_t expected[num_vfs + 1];
>> +
>> + 
>> igt_require(xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd));
>> +    igt_skip_on(igt_sriov_get_enabled_vfs(pf_fd));
>> +    igt_require(empty_shared_res_attributes(pf_fd));
>> +    // ensure auto provisioning on
>> +    igt_assert_eq(0, 
>> xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
>
> New line + comments format
ok
>
>> + igt_sriov_disable_driver_autoprobe(pf_fd);
>> +
>> +    xe_for_each_gt(pf_fd, gt) {
>> +        xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
>> +            for (unsigned int vf = 1; vf <= num_vfs; vf++) {
>> +                xe_sriov_pf_set_shared_res_attr(pf_fd, res, vf, gt, 
>> dummy_value);
>> +                expected[vf] = 
>> xe_sriov_pf_get_shared_res_attr(pf_fd, res, vf, gt);
>
> assert(expected == dummy)

That may not be true,  the value set may be different (depends on 
resource granularity),

so expected >= dummy seems more appropriate or expected != 0

--

marcin

>> +            }
>> +
>> +            igt_sriov_enable_vfs(pf_fd, num_vfs);
>> + igt_assert_eq(xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd),
>> +                      -EBUSY);
>> +
>> +            for (unsigned int vf = 1; vf <= num_vfs; vf++)
>> +                igt_assert_eq(expected[vf],
>> + xe_sriov_pf_get_shared_res_attr(pf_fd, res, vf, gt));
>> +
>> +            igt_sriov_disable_vfs(pf_fd);
>> +            igt_assert_eq(0, 
>> xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
>> +            igt_assert(empty_shared_res_attributes(pf_fd));
>> +        }
>> +    }
>> +}
>> +
>>   static bool extended_scope;
>>     static int opts_handler(int opt, int opt_index, void *data)
>> @@ -432,10 +524,52 @@ igt_main_args("", long_opts, help_str, 
>> opts_handler, NULL)
>>           }
>>       }
>>   +    igt_describe("Verify restore-auto-provisioning when VFs are 
>> disabled");
>> +    igt_subtest("restore-auto-provisioning-disabled-vfs") {
>> +        restore_auto_provisioning_disabled_vfs(pf_fd);
>> +    }
>> +
>> +    igt_describe("Verify that restore auto provisioning with VFs 
>> enabled in auto mode is noop");
>> + 
>> igt_subtest_with_dynamic("restore-auto-provisioning-enabled-vfs-auto_mode") 
>> {
>> +        if (extended_scope)
>> +            for_each_sriov_num_vfs(pf_fd, num_vfs)
>> +                igt_dynamic_f("numvfs-%d", num_vfs)
>> + restore_auto_provisioning_enabled_vfs_auto_mode(pf_fd,
>> +                                            num_vfs);
>> +
>> +        for_random_sriov_num_vfs(pf_fd, num_vfs) {
>> +            igt_dynamic_f("numvfs-random") {
>> +                igt_debug("numvfs=%u\n", num_vfs);
>> + restore_auto_provisioning_enabled_vfs_auto_mode(pf_fd,
>> +                                        num_vfs);
>> +            }
>> +        }
>> +    }
>> +
>> +    igt_describe("Verify restore-auto-provisioning with VFs enabled 
>> in custom mode");
>> + 
>> igt_subtest_with_dynamic("restore-auto-provisioning-enabled-vfs-custom-mode") 
>> {
>> +        if (extended_scope)
>> +            for_each_sriov_num_vfs(pf_fd, num_vfs)
>> +                igt_dynamic_f("numvfs-%d", num_vfs)
>> + restore_auto_provisioning_enabled_vfs_custom_mode(pf_fd,
>> +                                              num_vfs);
>> +
>> +        for_random_sriov_num_vfs(pf_fd, num_vfs) {
>> +            igt_dynamic_f("numvfs-random") {
>> +                igt_debug("numvfs=%u\n", num_vfs);
>> + restore_auto_provisioning_enabled_vfs_custom_mode(pf_fd,
>> +                                          num_vfs);
>> +            }
>> +        }
>> +    }
>> +
>>       igt_fixture {
>>           igt_sriov_disable_vfs(pf_fd);
>>           /* abort to avoid execution of next tests with enabled VFs */
>> -        igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed 
>> to disable VF(s)");
>> +        igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed 
>> to disable VF(s)\n");
>> +        if 
>> (xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd))
>> + igt_abort_on_f(xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd),
>> +                       "Failed to restore auto provisioning\n");
>>           autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
>>                   igt_sriov_disable_driver_autoprobe(pf_fd);
>>           igt_abort_on_f(autoprobe != 
>> igt_sriov_is_driver_autoprobe_enabled(pf_fd),
