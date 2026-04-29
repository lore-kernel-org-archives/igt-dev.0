Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D6EFF8864
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 05:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9405610EE5A;
	Wed, 29 Apr 2026 05:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxAJ2rTH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B8610EE5C
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 05:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777441151; x=1808977151;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Q24+iVvCErXnoZmQyZMS2E4gM/l9ayv9q62YMq/4iEc=;
 b=hxAJ2rTHeRW0cPw1OsA7KlNlBj38vV4yHMaoecS5GsEkJkXUNjAt3DO0
 D2pO4YgOLypadbf9GLEPLcPie7lBUdz7J1D+SmMzPdVFnD/2c3MvM78L0
 gpLnRZcm6q42PVtaKeIBbtbPO9W+ZYNvaD0de+uwic1CjANAZadR0kUCv
 H3rmtxZHzUG0xmNTzzmnLe/B4TvwVPO8JHQKwkviQ9/+i2Bsarz4TrdNV
 pR4ELP/eO07JS7mXfUZsSUytlXGVk7cxRjfXpQ9GJgc0c0/zbo8gL4FNb
 d/LwgmmcHB2jlCyT2LA1hnthqPA+xPPjGihzyM84ykHjfJ/kGmQCovOLp A==;
X-CSE-ConnectionGUID: HDc+iTJ4SuWxQjjm0d/z8A==
X-CSE-MsgGUID: rft2yixhRhaUNZSik3bKtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="77530455"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="77530455"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:39:10 -0700
X-CSE-ConnectionGUID: 10bnd49MQ8SjRu/oA7uk5g==
X-CSE-MsgGUID: Q/10GiguQjaGJSVjGBZ0eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="234028917"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.246.22.155])
 ([10.246.22.155])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:39:09 -0700
Message-ID: <7ef59b71-4a9f-4a63-b1be-5675c857b59a@linux.intel.com>
Date: Wed, 29 Apr 2026 07:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools/vmtb: Add VMTB fast-feedback testlist
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@linux.intel.com,
 Ryszard Knop <ryszard.knop@intel.com>,
 Mateusz Grabski <mateusz.grabski@intel.com>
References: <20260428082243.299243-1-adam.miszczak@linux.intel.com>
 <20260428150934.5cifxdcou2jvhafv@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <20260428150934.5cifxdcou2jvhafv@kamilkon-DESK.igk.intel.com>
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


On 4/28/2026 5:09 PM, Kamil Konieczny wrote:
> Hi Adam,
> On 2026-04-28 at 10:22:43 +0200, Adam Miszczak wrote:
>> Enable basic VM tests as BATs:
>> - create and provision VFs, assign to VMs and probe guest driver
>> - execute simple IGT workloads on booted VMs
>>
>> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
>> ---
>>   .../vmtb/vmm_flows/intel-ci/fast-feedback.testlist | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>   create mode 100644 tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist
>>
>> diff --git a/tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist b/tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist
>> new file mode 100644
>> index 000000000..37c4dea3a
>> --- /dev/null
>> +++ b/tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist
> imho it would be better to keep CI-related lists in tests/intel-ci/
>
> +cc Ryszard
> Cc: Ryszard Knop <ryszard.knop@intel.com>
>
> Regards,
> Kamil

This is VMTB specific testlist, so I suppose it will be misleading to 
look for it in tests/ (dedicated for 'regular' IGT tests).
Also, this is just the first VMTB testlist file, we can expect more 
files for different CI configs.

++cc: Mateusz Grabski <mateusz.grabski@intel.com>

Thanks,
Adam

>> @@ -0,0 +1,14 @@
>> +#####################################################
>> +#
>> +# VMM Flows fast-feedback test list:
>> +# defines tests to be executed pre-/post-merge BATs.
>> +#
>> +# This is allow list, needs to be extended if new
>> +# tests need to be added to scope.
>> +#
>> +#####################################################
>> +######################
>> +# Basic VF/VM create
>> +######################
>> +test_basic.py::TestVmSetup
>> +test_basic.py::TestVmWorkload
>> -- 
>> 2.39.1
>>
