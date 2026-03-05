Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1A4F3D31C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 16:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DCF10EC52;
	Thu,  5 Mar 2026 16:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqpFQKEk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494DD10E2CA
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 16:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772727686; x=1804263686;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=W+M1b/xj3MlFw+iRn8cWIUp+dM6VKvQjF5zPPAoLxC8=;
 b=aqpFQKEk3pwWwkWikyOtdb1r1lO/Os2eGgCIKxkSV9xyp9zyKrFOR1sL
 xF3j166xra3Di00JLOYKa9OPVKULGeELTKVMu3YT6vhbLjJ2M3MuykrgV
 2AeSyipdtvFbTihyb1ZnRH30I1jJSQc0bpHKsOSAXtdrDL9osNJ8qVmAj
 1cWWyyqL9De/i+HrUrLOWe0VBjhSE34baYbDKNi6+4BZI2747Q7kP9gE9
 bkvhTz3L91lBgk3zUqUmIoBE3/PHgEUeYzK3kkosy8dme/2jIOzKP5LDr
 6+fcWiUGJHab2edQcDGsMj9Q1YcCzySxFzQu/ynqUSfkJ0oBGbqqd/5do Q==;
X-CSE-ConnectionGUID: MKMqUXYtTjCO91YdjmNeFA==
X-CSE-MsgGUID: 3boCXTEDTOaP2IVfUOrzag==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84904946"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="84904946"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 08:21:25 -0800
X-CSE-ConnectionGUID: RkZjswhfTzuudfZzRokcYw==
X-CSE-MsgGUID: LW0dvKvKRTS5N6Bd7dzGag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="215943150"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.54])
 ([172.28.182.54])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 08:21:24 -0800
Message-ID: <09f01ecd-46dd-4712-90e7-a51aea8cd219@linux.intel.com>
Date: Thu, 5 Mar 2026 17:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_configfs: Skip ctx-restore subtests on
 SR-IOV VF
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, igt-dev@lists.freedesktop.org,
 michal.wajdeczko@intel.com, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20260224112041.297334-2-nitin.r.gote@intel.com>
 <20260224132012.prlzw36las3j4uzk@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260224132012.prlzw36las3j4uzk@kamilkon-DESK.igk.intel.com>
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


On 2/24/2026 2:20 PM, Kamil Konieczny wrote:
> Hi Nitin,
> On 2026-02-24 at 16:50:42 +0530, Nitin Gote wrote:
>> The ctx-restore subtests use intel_register_read() via direct MMIO
>> (PCI BAR) access to verify that the batch buffer wrote the expected
>> register values. On SR-IOV Virtual Functions (VF), only a very limited
>> subset of registers is accessible. Registers like 0x4F100 are not
>> exposed to VFs, so the read always returns 0, causing a false test
>> failure.
>>
>> Skip all ctx-restore subtests (post-bb, mid-bb, and their invalid
>> variants) when the device is running in SR-IOV VF mode.
Does it mean the feature is not applicable to VFs or just the 
verification is a bit harder ?
> +cc Lukasz and Marcin
>
>> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
>> ---
>>   tests/intel/xe_configfs.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>> index 0db4af201..ab55e333b 100644
>> --- a/tests/intel/xe_configfs.c
>> +++ b/tests/intel/xe_configfs.c
>> @@ -409,6 +409,7 @@ int igt_main()
>>   
>>   	igt_describe("Validate ctx_restore_post_bb with invalid options");
>>   	igt_subtest("ctx-restore-post-bb-invalid") {
>> +		igt_require_f(!is_vf_device, "ctx-restore not supported in VF\n");
>>   		configfs_device_fd = create_device_configfs_group(configfs_fd);
>>   		test_ctx_restore_invalid(configfs_device_fd, "post");
>>   		close_configfs_group(configfs_fd, configfs_device_fd);
>> @@ -416,6 +417,7 @@ int igt_main()
>>   
>>   	igt_describe("Validate ctx_restore_post_bb");
>>   	igt_subtest("ctx-restore-post-bb") {
>> +		igt_require_f(!is_vf_device, "ctx-restore not supported in VF\n");
>>   		configfs_device_fd = create_device_configfs_group(configfs_fd);
>>   		test_ctx_restore(configfs_device_fd, "post");
>>   		close_configfs_group(configfs_fd, configfs_device_fd);
>> @@ -423,6 +425,7 @@ int igt_main()
>>   
>>   	igt_describe("Validate ctx_restore_mid_bb with invalid options");
>>   	igt_subtest("ctx-restore-mid-bb-invalid") {
>> +		igt_require_f(!is_vf_device, "ctx-restore not supported in VF\n");
>>   		configfs_device_fd = create_device_configfs_group(configfs_fd);
>>   		test_ctx_restore_invalid(configfs_device_fd, "mid");
>>   		close_configfs_group(configfs_fd, configfs_device_fd);
>> @@ -430,6 +433,7 @@ int igt_main()
>>   
>>   	igt_describe("Validate ctx_restore_mid_bb");
>>   	igt_subtest("ctx-restore-mid-bb") {
>> +		igt_require_f(!is_vf_device, "ctx-restore not supported in VF\n");
>>   		configfs_device_fd = create_device_configfs_group(configfs_fd);
>>   		test_ctx_restore(configfs_device_fd, "mid");
>>   		close_configfs_group(configfs_fd, configfs_device_fd);
>> -- 
>> 2.50.1
>>
