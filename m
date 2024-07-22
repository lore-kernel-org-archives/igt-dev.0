Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C10AC3DA5D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 10:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2672410E4A3;
	Mon, 22 Jul 2024 10:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvW3xTm1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B309A10E4A3
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jul 2024 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721642545; x=1753178545;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=da1leEVjIWHXRHYrY05rlYl6TpNFblPn3PCDI015CLw=;
 b=GvW3xTm1T1PWZ0JfmPqin9xVcjrx0pGeb1k9yR57rej13M6OIgujqIzW
 L0HNWPLazvHvzTiVyUXUTn3bgD0JBEmfngNt6i5OF0fEpGkhD4+3Q92KG
 FU9AkCkFhZJyl/LJ47H+FGX1WsljDLOXDuzcJBqCgDxNzjTIo6E+XU0XP
 ODJIuIyjOdSzF0XMjbzT/mLh6X1VtBam4QhDKaHCgZHKlHw4SS5AOoRn/
 ZCyfKH8oiYW7FcmzDj5bB2Vhno8QOOBbsBjEYmW6Q9WDtUZbPasT9ykqT
 CWnIINfSNpR+cgES78uoYtAdEFhTEbEzjzHMnX31c8tALAqkRp1p6shqB w==;
X-CSE-ConnectionGUID: oxPJ1DBGR0KF2L8BuARo6A==
X-CSE-MsgGUID: /HXZL5BYQ82xsyWJx6aAfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19162980"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="19162980"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 03:02:25 -0700
X-CSE-ConnectionGUID: pfLWS+thSUuc6dLrjSxCvQ==
X-CSE-MsgGUID: OR27f+ufQk+98Jt5kQBflg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="56687320"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.186])
 ([10.94.250.186])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 03:02:23 -0700
Message-ID: <4cdcb1d2-263f-41fe-9456-fd0be8c39be1@linux.intel.com>
Date: Mon, 22 Jul 2024 12:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] BMG: lib/intel_compute: Enable compute tests for BMG
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
References: <20240722094500.92690-1-zbigniew.kempczynski@intel.com>
 <f968325d-bfd6-4ea6-8a89-b3ba18ddde93@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <f968325d-bfd6-4ea6-8a89-b3ba18ddde93@linux.intel.com>
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


On 7/22/2024 12:00 PM, Nirmoy Das wrote:
>
> On 7/22/2024 11:45 AM, Zbigniew Kempczyński wrote:
>> From: Nirmoy Das <nirmoy.das@intel.com>
>>
>> BMG is XE2 based so compute tests should run as it is.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> ---
>>   lib/intel_compute.c                | 31 ++++++++++++++++++++++++++++++
>>   lib/intel_compute_square_kernels.c | 28 +++++++++++++++++++++++++++
>>   2 files changed, 59 insertions(+)
>>
>> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
>> index 72025a4811..54d1814f38 100644
>> --- a/lib/intel_compute.c
>> +++ b/lib/intel_compute.c
>> @@ -1449,6 +1449,21 @@ static const struct {
>>           .compute_exec = xehpc_compute_exec,
>>           .compat = COMPAT_DRIVER_XE,
>>       },
>> +    {
>> +        .ip_ver = IP_VER(20, 00),
>> +        .compute_exec = xe2lpg_compute_exec,
>> +        .compat = COMPAT_DRIVER_XE,
>> +    },
>> +    {
>> +        .ip_ver = IP_VER(20, 01),
>> +        .compute_exec = xe2lpg_compute_exec,
>> +        .compat = COMPAT_DRIVER_XE,
>> +    },
>> +    {
>> +        .ip_ver = IP_VER(20, 02),
>> +        .compute_exec = xe2lpg_compute_exec,
>> +        .compat = COMPAT_DRIVER_XE,
>> +    },
>>       {
>>           .ip_ver = IP_VER(20, 04),
>>           .compute_exec = xe2lpg_compute_exec,
>> @@ -1719,11 +1734,27 @@ static const struct {
>>                    bool threadgroup_preemption);
>>       uint32_t compat;
>>   } intel_compute_preempt_batches[] = {
>> +    {
>> +        .ip_ver = IP_VER(20, 00),
>> +        .compute_exec = xe2lpg_compute_preempt_exec,
>> +        .compat = COMPAT_DRIVER_XE,
>> +    },
>> +    {
>> +        .ip_ver = IP_VER(20, 01),
>> +        .compute_exec = xe2lpg_compute_preempt_exec,
>> +        .compat = COMPAT_DRIVER_XE,
>> +    },
>> +    {
>> +        .ip_ver = IP_VER(20, 02),
>> +        .compute_exec = xe2lpg_compute_preempt_exec,
>> +        .compat = COMPAT_DRIVER_XE,
>> +    },
>>       {
>>           .ip_ver = IP_VER(20, 04),
>>           .compute_exec = xe2lpg_compute_preempt_exec,
>>           .compat = COMPAT_DRIVER_XE,
>>       },
>> +
>
> nit: Unwanted space
>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Opps sorry,  I didn't realize it was me as Author.  Please ignore this.


>
>>   };
>>     static bool __run_intel_compute_kernel_preempt(int fd,
>> diff --git a/lib/intel_compute_square_kernels.c 
>> b/lib/intel_compute_square_kernels.c
>> index efd55da0b9..39c34dc5e0 100644
>> --- a/lib/intel_compute_square_kernels.c
>> +++ b/lib/intel_compute_square_kernels.c
>> @@ -3866,6 +3866,34 @@ const struct intel_compute_kernels 
>> intel_compute_square_kernels[] = {
>>           .size = sizeof(xehpc_kernel_square_bin),
>>           .kernel = xehpc_kernel_square_bin,
>>       },
>> +    {
>> +        .ip_ver = IP_VER(20, 00),
>> +        .size = sizeof(xe2lpg_kernel_square_bin),
>> +        .kernel = xe2lpg_kernel_square_bin,
>> +        .long_kernel = xe2lpg_kernel_inc_bin,
>> +        .long_kernel_size = sizeof(xe2lpg_kernel_inc_bin),
>> +        .sip_kernel = xe2lpg_kernel_sip_bin,
>> +        .sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
>> +    },
>> +    {
>> +        .ip_ver = IP_VER(20, 01),
>> +        .size = sizeof(xe2lpg_kernel_square_bin),
>> +        .kernel = xe2lpg_kernel_square_bin,
>> +        .long_kernel = xe2lpg_kernel_inc_bin,
>> +        .long_kernel_size = sizeof(xe2lpg_kernel_inc_bin),
>> +        .sip_kernel = xe2lpg_kernel_sip_bin,
>> +        .sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
>> +    },
>> +    {
>> +        .ip_ver = IP_VER(20, 02),
>> +        .size = sizeof(xe2lpg_kernel_square_bin),
>> +        .kernel = xe2lpg_kernel_square_bin,
>> +        .long_kernel = xe2lpg_kernel_inc_bin,
>> +        .long_kernel_size = sizeof(xe2lpg_kernel_inc_bin),
>> +        .sip_kernel = xe2lpg_kernel_sip_bin,
>> +        .sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
>> +    },
>> +
>>       {
>>           .ip_ver = IP_VER(20, 04),
>>           .size = sizeof(xe2lpg_kernel_square_bin),
