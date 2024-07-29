Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39AFC3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 08:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F39E10E338;
	Mon, 29 Jul 2024 08:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVM6Katq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06FB10E338
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 08:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722243228; x=1753779228;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2p6hfVFZcDyRwciJMxEfZbKApLM/LFLp8jckMyzPvUM=;
 b=hVM6KatqEKlTdjkE2Hgll97sYjbszQHU6+67EjcBPAsCuSkHog92aYER
 q834zGVJOjt001dWkYYMlGQqA4459uK4duXLQCBigKPeWavtqS8RRDB9N
 25sHAgE6WrfkmPLDDfizClmblvhVxdDRsp1/9/Udu5bBeVwFIcAURhpVe
 eDOIugv5aj3ciw2g4Rhg8yzW7G3uYL5UTg+jBqKHeMWYt4bSp6FxnK6ZY
 t5Pr16xllMg4f3DhQgmlwPeOlKToTZ55Yjw4zBSkgpodcuju6pE0D1Ab+
 53b6ieJUEs/NExfe2W1IXFTgqbh2Y3gM75GlzVTqo0ORdLAeEdvXm5zVL Q==;
X-CSE-ConnectionGUID: 8f0glHODSeW67Xopp+JMTQ==
X-CSE-MsgGUID: SDDCDfIBRiaEEF9Fid7QZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="19827225"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="19827225"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 01:53:47 -0700
X-CSE-ConnectionGUID: 5IbvpxtuSbWoPIlcCRK+aA==
X-CSE-MsgGUID: tCNO3gpdSriApJns3Ray4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="58043470"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.84.149])
 ([10.245.84.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 01:53:45 -0700
Message-ID: <48ba12d9-4665-4e14-9d4d-3fcedc6fe8cf@linux.intel.com>
Date: Mon, 29 Jul 2024 10:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t] tests/intel-ci/xe-sriov-vf.blocklist.txt:
 Blocklist for SR-IOV VF BAT runs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>
References: <20240726170959.1378586-1-marcin.bernatowicz@linux.intel.com>
 <cbc1d30e-e606-4d4f-bda6-117825e1f067@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <cbc1d30e-e606-4d4f-bda6-117825e1f067@intel.com>
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



On 7/26/2024 8:33 PM, Michal Wajdeczko wrote:
> 
> 
> On 26.07.2024 19:09, Marcin Bernatowicz wrote:
>> Blocklist tests not applicable for Virtual Function (VF) BAT runs.
>> The list extends xe.blocklist.txt to enable xe-fast-feedback.testlist
>> execution on VF device.
>>
>> V2:
>> - Reduce blocklist to minimal, favoring SKIPs.
>> - Demonstrated minimal time impact on ADLP with increased skips.
>>
> 
> likely you wanted to include below details after the --- mark
> 
Ok, will put it after --- mark
>> Before:
>>
>> summary:
>>         name: vf_bats_results
>>         ----  ---------------
>>         pass:             171
>>         fail:               0
>>        crash:               0
>>         skip:              56
>>      timeout:               0
>>         warn:               0
>>   incomplete:               0
>>   dmesg-warn:               0
>>   dmesg-fail:               0
>>      changes:               0
>>        fixes:               0
>> regressions:               0
>>        total:             227
>>         time:        00:00:25
>>
>> After:
>>
>> summary:
>>         name: vf_bats_results
>>         ----  ---------------
>>         pass:             171
>>         fail:               0
>>        crash:               0
>>         skip:             119
>>      timeout:               0
>>         warn:               0
>>   incomplete:               0
>>   dmesg-warn:               0
>>   dmesg-fail:               0
>>      changes:               0
>>        fixes:               0
>> regressions:               0
>>        total:             290
>>         time:        00:00:27
>>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   tests/intel-ci/meson.build               |  1 +
>>   tests/intel-ci/xe-sriov-vf.blocklist.txt | 19 +++++++++++++++++++
>>   2 files changed, 20 insertions(+)
>>   create mode 100644 tests/intel-ci/xe-sriov-vf.blocklist.txt
>>
>> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
>> index f16243cbb..59323eda9 100644
>> --- a/tests/intel-ci/meson.build
>> +++ b/tests/intel-ci/meson.build
>> @@ -11,6 +11,7 @@ intelci_files = [
>>     'xe.blocklist.txt',
>>     'xe-fast-feedback.testlist',
>>     'xe-fast-feedback-chamelium-only.testlist',
>> +  'xe-sriov-vf.blocklist.txt',
>>   ]
>>   
>>   install_data(sources : intelci_files, install_dir : datadir)
>> diff --git a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe-sriov-vf.blocklist.txt
>> new file mode 100644
>> index 000000000..870082f5b
>> --- /dev/null
>> +++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
>> @@ -0,0 +1,19 @@
>> +##################################################################
>> +# Block list for VF xe-fast-feedback runs
> 
> IIUC, the 'xe.blocklist.txt' is applied to both BAT and FULL runs
> 
> so if this file will also be applied on FULL runs, then comment above is
> misleading, and if only BAT will be impacted, then filename does not
> reflect that

I'll update the comment, the list should be applicable to BAT/FULL runs

> 
>> +##################################################################
>> +# Prevent potential module reloads during tests
> 
> nit: decorations used in this file are so aggressive that it is hard to
> see what's the comment and where's next section

Taken style from existing lists. Is following be better?:

##################################################################
# Block list for VF runs
##################################################################
#
# Prevent potential module reloads during tests
#
igt@xe_module_load
#
# Not applicable on VF (requires PF)
#
igt@sriov_basic
> 
>> +##################################################################
>> +igt@xe_module_load
>> +##################################################################
>> +# Not applicable on VF (requires PF)
>> +##################################################################
>> +igt@sriov_basic
> 
> per comment above we favor SKIPs, so maybe we don't need to block this?

Yes, I will remove it
> 
>> +##################################################################
>> +# Modify tests to SKIP: No interface on VF.
>> +##################################################################
>> +igt@xe_gt_freq
>> +igt@xe_pm_residency
>> +##################################################################
>> +# Blocked because of abort
>> +##################################################################
>> +igt@xe_debugfs@gt
> 
> 1. do we really run debugfs tests in BAT ?

+Zbigniew +Kasia

> 2. IIRC there was one case where VF will complain while reading the
> debugfs, but maybe by time we enable the VF runs we could fix that
> rather then add everything to the block list ?

The enablement of VF BAT runs is pending due to this blocklist not merged.
Can we update it when fixes are ready ?
> 
