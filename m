Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4F9FD5333
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 10:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E56210EAE9;
	Fri, 27 Feb 2026 10:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXSnshGL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8A710EAE9
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 10:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772186835; x=1803722835;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=o2w4yKIw7/3RIqDkWWeT8rWSQttdrqKSgMQrAJ9oxWU=;
 b=VXSnshGLHAqTUcB7IVG3ylduquCzsaPcEi7A3JTQ+yfRbasU1SSEFvEI
 FRG5yJ08JDNh2D9EBtXyvsXx1PVIco6DM5qDgvVCVgr3DcY9rUhtXm6SA
 qZqrQgBTCWO99Z79Z/aTAemSxW30O0FTTEL/Ll/FJI/hTGNUdzE7SaLQ6
 ExnYY2my34nE8cBohMxFPA+sj00R5tfQi2W+YZjCrEuBh+A3doSMiUnsi
 vMikXwgoJl+XwO8J8dGxKTfEIZnodE3MVLr61g0ulcDXp7SBH3TShc2UB
 2/b1KXJVgdT7XaKwyvYinnkMW6Nmjs9QWAnPjV877j8kh8tKje3kNmY1x g==;
X-CSE-ConnectionGUID: L3yNBlHMQfSWGis67OlTRA==
X-CSE-MsgGUID: OiRFIRTPRlyffQI9XswzEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73172343"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73172343"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 02:07:15 -0800
X-CSE-ConnectionGUID: 8qzSqvSkRfCipiRjFUCtqQ==
X-CSE-MsgGUID: jsnU0gjIRQye7kdlVbu37w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="221362789"
Received: from amongesa-mobl.ger.corp.intel.com (HELO [10.94.249.110])
 ([10.94.249.110])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 02:07:14 -0800
Message-ID: <84c4e68b-6b0a-459f-b604-9dd408a81070@linux.intel.com>
Date: Fri, 27 Feb 2026 11:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_sriov_flr: Add reset-only FLR
 subtest
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, lukasz.laguna@intel.com
References: <20260226173137.3221419-1-marcin.bernatowicz@linux.intel.com>
 <20260226173137.3221419-2-marcin.bernatowicz@linux.intel.com>
 <20260227085809.dehznq3jz735x3rm@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260227085809.dehznq3jz735x3rm@intel.com>
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


On 2/27/2026 9:58 AM, Piotr Piórkowski wrote:
> Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com> wrote on czw [2026-lut-26 18:31:36 +0100]:
>> Add flr-reset-only subtest intended as a minimal smoke test
>> for the VF reset sysfs write path while still using the xe-vfio-pci
>> based synchronization: the test skips if xe-vfio-pci binding is disabled,
>> if the xe_vfio_pci module is not loaded, or if any VF under test is
>> not bound to xe-vfio-pci.
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> ---
>>   tests/intel/xe_sriov_flr.c | 65 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>
>> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
>> index b73727787..846731697 100644
>> --- a/tests/intel/xe_sriov_flr.c
>> +++ b/tests/intel/xe_sriov_flr.c
>> @@ -29,6 +29,12 @@
>>    * Functionality: FLR
>>    * Description: Examine behavior of SR-IOV VF FLR
>>    *
>> + * SUBTEST: flr-reset-only
> Or maybe just flr-basic?
>
>> + * Run type: BAT
>> + * Description:
>> + *   Initiates FLR without any additional state checks.
>> + *   Useful as a basic smoke test of the reset sysfs write path.
>> + *
>>    * SUBTEST: flr-vf1-clear
>>    * Run type: BAT
>>    * Description:
>> @@ -1016,6 +1022,60 @@ static void regs_subcheck_cleanup(struct subcheck_data *data)
>>   {
>>   }
>>   
>> +static void reset_only_subcheck_init(struct subcheck_data *data)
>> +{
>> +	if (!g_use_xe_vfio_pci) {
>> +		set_skip_reason(data, "xe-vfio-pci binding is disabled\n");
>> +		return;
>> +	}
>> +
>> +	if (!igt_kmod_is_loaded("xe_vfio_pci"))
> Sometimes it is xe_vfio_pci, sometimes xe-vfio-pci

xe_vfio_pci is a module name

xe-vfio-pci is a driver name

> What is the reason for this difference? Shouldn't we keep it somewhere as a constant?
I'll add some constants with xe_sriov_vfio test
> Or have helpers to handle this module at all?
>
>> +		set_skip_reason(data, "xe_vfio_pci is not loaded\n");
>> +}
>> +
>> +static void reset_only_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>> +{
>> +	char *slot = igt_sriov_get_vf_pci_slot_alloc(data->pf_fd, vf_id);
>> +	char bound[64];
>> +	int bound_ret;
>> +
>> +	igt_assert(slot);
>> +
>> +	bound_ret = igt_pci_get_bound_driver_name(slot, bound, sizeof(bound));
>> +	if (bound_ret <= 0 || strcmp(bound, "xe-vfio-pci") != 0)
>> +		set_skip_reason(data, "VF%u not bound to xe-vfio-pci\n", vf_id);
>> +
>> +	free(slot);
>> +}
>> +
>> +static void noop_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
>> +{
>> +}
>> +
>> +static void noop_subcheck_cleanup(struct subcheck_data *data)
>> +{
>> +}
>> +
>> +static void reset_only_test(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>> +{
>> +	struct subcheck_data base = {
>> +		.pf_fd = pf_fd,
>> +		.num_vfs = num_vfs,
>> +		.tile = 0,
>> +		.stop_reason = NULL,
>> +	};
>> +	struct subcheck check = {
>> +		.data = &base,
>> +		.name = "reset-only",
>> +		.init = reset_only_subcheck_init,
>> +		.prepare_vf = reset_only_subcheck_prepare_vf,
>> +		.verify_vf = noop_subcheck_verify_vf,
>> +		.cleanup = noop_subcheck_cleanup,
>> +	};
>> +
>> +	verify_flr(pf_fd, num_vfs, &check, 1, exec_strategy);
>> +}
>> +
>>   static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>>   {
>>   	const uint8_t num_tiles = xe_tiles_count(pf_fd);
>> @@ -1141,6 +1201,11 @@ int igt_main_args("vw:", long_options, help_str, opt_handler, NULL)
>>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>>   	}
>>   
>> +	igt_describe("Initiate FLR without any additional state checks.");
>> +	igt_subtest("flr-reset-only") {
>> +		reset_only_test(pf_fd, 1, execute_sequential_flr);
> In this case, shouldn't we have dynamic subtests regarding the number of VFs?
> I know that this will be expanded in the next patch, but maybe it should be the default.
> Because if someone wants to run tests on only one Vf's, they can still use
> the dynamic subtets filter.
Currently VF1 is default to keep CI time bounded.
In --extended mode (next patch), if numvfs-N is specified, we enable N 
VFs and run FLR sequentially on each.
If no specific numvfs-* dynamic subtest is selected, we iterate over the 
full range (numvfs-1 … numvfs-totalVFs).

If you prefer dynamic by default, which set would you suggest running - 
VF1 only, random number of VFs, total VFs ?

Thanks,

Marcin

>
> Thanks,
> Piotr
>
>> +	}
>> +
>>   	igt_describe("Verify LMEM, GGTT, and SCRATCH_REGS are properly cleared after VF1 FLR");
>>   	igt_subtest("flr-vf1-clear") {
>>   		clear_tests(pf_fd, 1, execute_sequential_flr);
>> -- 
>> 2.43.0
>>
