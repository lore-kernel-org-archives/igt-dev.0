Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9A3C5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 20:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D589510E777;
	Thu, 29 May 2025 20:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ww/zT07c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A3F10E78B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 20:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748550568; x=1780086568;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q1WkE8zsFL4QEH4kOnOr8pQZnSlndUxugkzTcER2xcE=;
 b=Ww/zT07c7wZkFnRVqvCyjmmZpBQpL9Z4ff1x92CJfATj2m6VfAcm1sJf
 I8nkcEtjQtk5Do1qrg6IYN2kBatiN2acnzb0zaKr467G6OnuI7Whu3tUM
 nGGawhXEALhpER6HUz5+DZvTtCtaiUsh7Vtpnka8QOFjzuOFXVtVKXgvX
 mWameAUjAxob7aOfDX3Rbx/jIoGK3grblFORrBZIlehpMzsVX3mW//Lcd
 wd2ktvVjtbo5kiY/CrCCjkxtWHeNivLMr2nbAEEHf4BJtDlrnvLysS7yp
 05ScBhY8qIKiNUXsxFQmtvA36l6sEkyhreg2hdUkWgUuJXj0l4LlGpHhg A==;
X-CSE-ConnectionGUID: 7a6D0UzbTqaCtfrrv7Ai5A==
X-CSE-MsgGUID: OyUIkIpgTi2GdZDrJisq5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="62035820"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="62035820"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 13:29:28 -0700
X-CSE-ConnectionGUID: GG8jtsQGQy2vx6Vbdc53jA==
X-CSE-MsgGUID: pz3T53IjSDGm1w+nhRKvQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="180875953"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 29 May 2025 13:29:26 -0700
Received: from [10.245.113.199] (unknown [10.245.113.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 700233495A;
 Thu, 29 May 2025 21:29:24 +0100 (IST)
Message-ID: <0d4c919f-88a1-497d-84f5-25b8cb854d50@intel.com>
Date: Thu, 29 May 2025 22:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
References: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
 <b9aa7f22-aa4e-4f9a-9c5d-98d58066fcbb@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <b9aa7f22-aa4e-4f9a-9c5d-98d58066fcbb@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 29.05.2025 18:23, Daniele Ceraolo Spurio wrote:
> 
> 
> On 5/29/2025 6:31 AM, Satyanarayana K V P wrote:
>> Currently, numerous fault messages have been included in the dmesg
>> ignore list,
>> and this list continues to expand. Each time a new fault injection
>> point is
>> introduced or a new feature is activated, additional fault messages
>> appear,
>> making it cumbersome to manage the dmesg ignore list.
>>
>> This new patch automatically ignores all error messages from dmesg,
>> eliminating
>> the need to add or maintain a dmesg ignore message list.
> 
> This would make the test almost meaningless. If the test finds an actual
> bug (i.e., an error we didn't expect), how would CI detect and report it

but how can you tell upfront, without actually running a test, which
error is expected and which is not?

> if all errors are ignored? The only situations we would still fail on is
> when the kernel just dies.

and that perfectly fins, sine we should look only for BUG and WARNs, as
it's quite natural and expected that once we inject an error, the driver
will likely fail to load or proceed, and/or may report some error
messages, or even try to silently recover, *but* it shouldn't ever crash

and that should be taken as a test goal, not that we look for specific
error messages that could be changed, omitted, replaced by the different
driver release or when running on different platform or function

Michal

> 
> Daniele
> 
