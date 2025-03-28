Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CE9C3600C
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 13:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D3810EA26;
	Fri, 28 Mar 2025 13:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="am+7ISnJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E153910EA1B
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743168377; x=1774704377;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xXeQ0hULqhb67AFy7MId7soNdtwE0X6P0WjV/5Ihhrg=;
 b=am+7ISnJ9RuHfXD2tI4lyKryIEwCG/sW5QgQNCYjeYYP5jaMderG0NJY
 8fLpKc4TJYajhCrY6ip2BN8EmF6Go+CkCAkGBdTJi0MbrdOjbJqii5BUO
 ABz4fURdbYWTZW6U4BCFk55x3B8aN/9Jhws9KPot6mCMaOLI5YgJpfLHN
 gi3cvnFA9FS50OSRw9rKIMwnT2ETKZJZfagJtpsZHlKU14IyWLwLr8Lub
 og958hHTIsSntWpkfJvkeEbtZPDKyO+igzKvTfgM5CELMacxeZrJ7nWT4
 nTgA47XFfKTN94cXd0xdhvVojhWa1qXJFAc9a8ZqHoXSbY9zN3WK26QqX w==;
X-CSE-ConnectionGUID: B7517KWhRI28aFZSxo2nQg==
X-CSE-MsgGUID: jB+IT9OsRBC9hkBnMsVeqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="43775590"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="43775590"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 06:26:09 -0700
X-CSE-ConnectionGUID: q4t93I+URgimUs3IF7+kWg==
X-CSE-MsgGUID: JZeAOwWOSCKg+VHOfazZmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="126257317"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.254.149])
 ([10.245.254.149])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 06:26:08 -0700
Message-ID: <39488952-aa09-4e92-803d-d71a71019f09@linux.intel.com>
Date: Fri, 28 Mar 2025 14:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci/meson.build: Add missing
 xe-sriov-vm.blocklist.txt
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Adam Miszczak
 <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250327170925.705874-1-marcin.bernatowicz@linux.intel.com>
 <20250328115653.5pkshfstekdqbekk@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250328115653.5pkshfstekdqbekk@kamilkon-DESK.igk.intel.com>
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



On 3/28/2025 12:56 PM, Kamil Konieczny wrote:
> Hi Marcin,
> On 2025-03-27 at 18:09:25 +0100, Marcin Bernatowicz wrote:
>> Add the missing blocklist file so it can be used in CI.
>>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks, patch merged.
--
marcin>
>> ---
>>   tests/intel-ci/meson.build | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
>> index 59323eda9..b6f1357cb 100644
>> --- a/tests/intel-ci/meson.build
>> +++ b/tests/intel-ci/meson.build
>> @@ -12,6 +12,7 @@ intelci_files = [
>>     'xe-fast-feedback.testlist',
>>     'xe-fast-feedback-chamelium-only.testlist',
>>     'xe-sriov-vf.blocklist.txt',
>> +  'xe-sriov-vm.blocklist.txt',
>>   ]
>>   
>>   install_data(sources : intelci_files, install_dir : datadir)
>> -- 
>> 2.31.1
>>

