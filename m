Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F1DC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 17:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F1C10E0E0;
	Thu, 27 Mar 2025 17:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfACjqqC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55DB10E0E0
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 17:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743096072; x=1774632072;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=us7/+7RQT+1dN1rTltn27oYiAdK6N5XEmJXFa+NfqL0=;
 b=hfACjqqC2gWByp5B+znlXZc96jTKrHCgYfFnt3AVYzkzf6iFrS7uF9EZ
 FLuHqvbFB4QELme8mHXtA/PT/GQZ4XQZHJtn1m1CZvYPD6ThQD4JFI0DQ
 Pvzy6dhYXZAEzrfxyllsKsJXaELS5gjN6GOjMai5IkVDCw/W7GjQrLc7J
 aIka+AR4c8bBSKB0Wa/7UVd0gohi/cWyogJY+Orl9VXTHiilE0Z13lnKW
 jFH4NQyoXf7qtudm079XtvN+sEPKc3g9ys7j2AY6zImOZ+EpLPdbDPcYf
 aO2KgU1RwGd4R43Sk/+eRjZfl963aqBW8gdbHxwgiOL2zY7hSzE2vNOsv Q==;
X-CSE-ConnectionGUID: oh2zV/9ZTa21WDUiqcto5w==
X-CSE-MsgGUID: sSC6UyozQgWP7i9yOwUg1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61976582"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="61976582"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 10:20:54 -0700
X-CSE-ConnectionGUID: aPkhkpcfSwmIRAs/aPAVQg==
X-CSE-MsgGUID: M5VBoMFzSFygeA88/EtmEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="125430651"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.254.149])
 ([10.245.254.149])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 10:20:52 -0700
Message-ID: <c14bae2c-4bf8-4806-8561-efdb878242fa@linux.intel.com>
Date: Thu, 27 Mar 2025 18:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t] tests/intel-ci/xe-sriov-vm.blocklist.txt:
 Blocklist for SR-IOV VM runs
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Adam Miszczak
 <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250326124203.222643-1-marcin.bernatowicz@linux.intel.com>
 <20250327170341.uyqvv6jni77qjmc2@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250327170341.uyqvv6jni77qjmc2@kamilkon-DESK.igk.intel.com>
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



On 3/27/2025 6:03 PM, Kamil Konieczny wrote:
> Hi Marcin,
> On 2025-03-26 at 13:42:03 +0100, Marcin Bernatowicz wrote:
>> This file contains tests that are not applicable for QEMU Virtual Machine
>> (VM) runs. It extends xe.blocklist.txt and should be kept as minimal as
>> possible.
> 
> Do this apply to all suspend related tests? I see only two added,
> but grep gives:
> 
> grep -A2 igt_system_suspend tests/intel/xe*c
> 
> tests/intel/xe_pm_residency.c
> tests/intel/xe_gt_freq.c

Those should be already SKIPs in VM due to missing sysfs attributes.

> 
>>
>> v2: Added igt@xe_css@suspend-resume.
>>      Removed inaccessible reference. (Lukasz)
>>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   tests/intel-ci/xe-sriov-vm.blocklist.txt | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>   create mode 100644 tests/intel-ci/xe-sriov-vm.blocklist.txt
>>
>> diff --git a/tests/intel-ci/xe-sriov-vm.blocklist.txt b/tests/intel-ci/xe-sriov-vm.blocklist.txt
>> new file mode 100644
>> index 000000000..06ed60b52
>> --- /dev/null
>> +++ b/tests/intel-ci/xe-sriov-vm.blocklist.txt
>> @@ -0,0 +1,8 @@
>> +##################################################################
>> +# Block list for VM runs
>> +##################################################################
>> +#
>> +# rtcwake does not wake the VM from s2idle
>> +#
>> +igt@xe_pm@s2idle.*
>> +igt@xe_ccs@suspend-resume
> 
> This last could be:
> igt@xe_.*@suspend.*
> 

To be more precise, we are interested in SUSPEND_STATE_FREEZE.
Let's keep it as is for now.

Thanks for feedback
--
marcin

> Up to you.
>
> Regards,
> Kamil
> 
>> -- 
>> 2.31.1
>>
