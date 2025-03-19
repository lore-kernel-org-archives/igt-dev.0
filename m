Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED043C35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 08:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9356F10E0BD;
	Wed, 19 Mar 2025 08:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eC6W+dNa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F085910E0BD
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 08:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742372059; x=1773908059;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mtYDjN3LfF/GuaEXCJucV2HXR+HmUGtm4AxQIXSgx1Y=;
 b=eC6W+dNaegjvEg0IoNaf+7dUhuXd37t4MHwiZZmHZjzkWvBj9t8MRR8i
 FagkwFHgHUqWK6+hOFF1QL22HaDyxFb9LE5/Ttl7vdtm10sbLoM6B02Cq
 vhfUoPKWwYChWK76bjU3lhfZqnxe02Bi65w5wUwMZLW0SbXmB3xl/7+dS
 rVWRWA2xbiV6nZnsIYThYZuwYKe0w4ztqg91+aIIwRKrwKnUmia93V1yR
 DmjXDHFdBk3qTtKSbeMQhbctgi6DoY1p9cJ6aMcZIa47Y81J8QAw5ERF9
 GDggG44fdV6Al+xvA6wvtAfVLINRtpTC03KOs09znXpisEVu1a7XmFEaF w==;
X-CSE-ConnectionGUID: tLVz79Z+TEeHhv7ZK8qYBQ==
X-CSE-MsgGUID: tcszO+6NRqmx9lVWj7aYtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43563761"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43563761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 01:14:18 -0700
X-CSE-ConnectionGUID: TX+p4einRUuMZpIQYAUALg==
X-CSE-MsgGUID: dLeh9uy9T5urm4YHsXLaUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="153356831"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.0.167])
 ([10.246.0.167])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 01:14:17 -0700
Message-ID: <5c0a4a66-8e05-4f14-acc0-96487cc43590@linux.intel.com>
Date: Wed, 19 Mar 2025 09:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] tests/intel/xe_pm: Add a check for power
 management capability
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20250318150108.1055169-1-jakub1.kolakowski@intel.com>
 <20250318150108.1055169-3-jakub1.kolakowski@intel.com>
 <30298e71-5dc6-477a-b3ef-73f0996b9e35@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <30298e71-5dc6-477a-b3ef-73f0996b9e35@intel.com>
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



On 3/19/2025 9:05 AM, Poosa, Karthik wrote:
> 
> On 18-03-2025 20:31, Jakub Kolakowski wrote:
>> Add a check for power management capability of device tested in tests
>> related to D3 states. Currently if test is started on configuration
>> that does not support the PM capability it doesn't skip, instead
>> depending on test it may fail, abort or timeout.
>> With this change test will skip with a clear message why it did.
>>
>> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
>> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
>> Cc: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
>> Signed-off-by: Jakub Kolakowski<jakub1.kolakowski@intel.com>
>> ---
>>   tests/intel/xe_pm.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>> index c2026474d..70f0613fb 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -146,6 +146,9 @@ static void vram_d3cold_threshold_restore(int sig)
>>   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>>   {
>> +    igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
>> +              "PCI power management capability not found\n");
> 
> Hi Jakub,
> 
> As per PCIe Base spec, all PCI Express Functions are required to support 
> PCI Power Management Capability.
> 
> Only legacy PCI devices wouldn't have it.
> 
> Can you share details of failures without this capability.
> 
> All Xe supported GPUs are PCIe complaint, this check may not be needed 
> at all.

This happens for runs with Virtual Function (VF) passed to Virtual 
Machine (VM).

"9.6 SR-IOV Power Management
This section defines the PCI Express SR-IOV power management 
capabilities and protocols.
The Power Management Capability is required for PFs as described in 
Chapter 5 .
For VFs, the Power Management Capability is optional."

--
marcin

> 
> 
>> +
>>       dpms_on_off(device, DRM_MODE_DPMS_OFF);
>>       /*

