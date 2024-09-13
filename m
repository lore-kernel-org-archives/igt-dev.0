Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D2CEEE26C
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 11:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3480810ECF3;
	Fri, 13 Sep 2024 11:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HYwKOnmI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314E110ECF3
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 11:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726228222; x=1757764222;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kufIkI8WY/X2YJqRNdFzIVaL00+75FdRMzWknsUQVpY=;
 b=HYwKOnmICs2A/FxqaCc2QI4DZPSP0kHGJ/qKn4t6D8GsP6IT3n0R+I7J
 etxBMG0bNZQMRhP/u4dbCBDAqjNDqthXaIZz0e5kuKtXBgq+Mw7li07VE
 xentkX9dRMDat3WjtRk9KY2MioQwKVd1EAxRS11JjUlV+WvSpPiP332+J
 voI3k2ddHnAGKmwzyveKDEnHnKzS4a/OLFCypLnrdIZUFL3IpB6co+pKj
 9/OOYbzgZbSYB1D4YFfG+MCGAC3clznx4CWJeMrp7Qk5IGlwf+mDWArdN
 6oRQGe6kmN+hSdEngZveTgHLmD9UtG+YyqvNEGvwdTKG4jJdmarpbWL4u g==;
X-CSE-ConnectionGUID: TGVUR5KzSaCtBnM/7ETpoQ==
X-CSE-MsgGUID: +BV93z3/Sjq/yqozKW9CdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36259695"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="36259695"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:50:21 -0700
X-CSE-ConnectionGUID: GgWTIYEISpKgbjY65CqH2g==
X-CSE-MsgGUID: gAMoTB05TlqfwAdRkgAGPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="98722221"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.112])
 ([10.245.246.112])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:50:18 -0700
Message-ID: <d1cdd13c-8130-4934-bef0-927830cdfc5b@intel.com>
Date: Fri, 13 Sep 2024 13:50:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 09/17] tests/xe_exec_sip: Introduce invalid
 instruction tests
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-10-christoph.manszewski@intel.com>
 <20240909072108.gdvdr5t74243s434@zkempczy-mobl2>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240909072108.gdvdr5t74243s434@zkempczy-mobl2>
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

Hi Zbigniew,

On 9.09.2024 09:21, Zbigniew Kempczyński wrote:
> On Thu, Sep 05, 2024 at 11:28:04AM +0200, Christoph Manszewski wrote:
>> From: Andrzej Hajda <andrzej.hajda@intel.com>
>>
>> Xe2 and earlier gens are able to handle very limited set of invalid
>> instructions - only illegal and undefined opcodes, other errors in
>> instruction can cause undefined behavior.
>> Illegal/undefined opcode results in:
>> - setting illegal opcode status bit - cr0.1[28],
>> - calling SIP if illegal opcode bit is enabled - cr0.1[12].
>> cr0.1[12] can be enabled directly from the thread or by thread dispatcher
>> from Interface Descriptor Data provided to COMPUTE_WALKER instruction.
>>
>> Implemented cases:
>> - check if SIP is not called when exception is not enabled,
>> - check if SIP is called when exception is enabled from EU thread,
>> - check if SIP is called when exception is enabled from COMPUTE_WALKER
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Mika Kuoppala <mika.kuoppala@intel.com>
>> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> I've some observation - tests are passing but I've doubts regarding
> their completion. I mean I observe hang and test report success after
> job timeout.

Well for the 'sanity-after-timeout' sub test this is what it actually 
intends to do - cause a timeout and see if we are able to run a basic 
workload after this.

As for 'invalidinstr-*-enabled' I also assume this is expected since 
executing an invalid instruction causes an exception and no one 
handles/clears it. But maybe we should? I will pass this one down to 
@Andrzej.

Thanks,
Christoph

> 
> --
> Zbigniew
