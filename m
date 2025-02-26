Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D881C021BC
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 10:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A4B10E22D;
	Wed, 26 Feb 2025 10:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AmO8gqmz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCAA10E22D
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 10:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740565486; x=1772101486;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Wg8uyxLR2EFhy4C8Ho3bVb6FrxV+SXDD4fkCs5IhP64=;
 b=AmO8gqmzrfwCKFkrLBR2Gbv9u9WpuQX/BT53UrwLvzB0my2+LXjpqLV7
 3Th6iQOm9IHLzqTg2RbQS9JCI+8FJGp8vd6xaRs60qx5HbgEpyhrt1xiC
 Exfq4hY9fOCfF7AOtJFAcWYQbpYOAPGpLgZ6CSugSa1TVHYwo0WJ0RyBc
 FqbXy0RuSjuuNZ4GOTgvN+ShI8lyk5aJ3fVT9hII6Xv5tbTyPdZ8dIDd8
 5q4Lh4fOU9ig0EdSdyJy2au38Cf756MNOrccUvSUSJ4WqBtAcpKk0plHu
 oNcVW5dEmfhuQ0MnbuyZIAfDr8HMugOpka239jNzHR0hxdUFccfYRRw2v g==;
X-CSE-ConnectionGUID: CC9SxgyOTLq0C31sCTK6nQ==
X-CSE-MsgGUID: 3J+NMeGATuaOiCohQt35Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="63869056"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="63869056"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 02:24:45 -0800
X-CSE-ConnectionGUID: 6lmhmBrzTY6NauywWPgxyA==
X-CSE-MsgGUID: ymFGbOpAR2OAfgqpM7suGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117155744"
Received: from pbabighi-mobl1.amr.corp.intel.com (HELO [10.246.16.179])
 ([10.246.16.179])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 02:24:40 -0800
Message-ID: <1ec35fc8-92a5-4e69-a562-142745f59659@linux.intel.com>
Date: Wed, 26 Feb 2025 11:24:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amd: add memleak functions
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: vitaly prosyak <vprosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, vitaly.prosyak@amd.com,
 igt-dev@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Harry Wentland <harry.wentland@amd.com>
References: <20250218114341.122653-1-vitaly.prosyak@amd.com>
 <20250219104149.npgbvmtr5vikkkhr@kamilkon-desk.igk.intel.com>
 <93281b6c-1ae1-426e-aae7-46974d355532@amd.com>
 <20250226090958.32igx6wiy4svxw3h@zkempczy-mobl2>
 <9c5d27e4-12b2-4597-97cd-da72bc07d1dc@linux.intel.com>
 <20250226100926.2qkfqmrm4e5qsunb@zkempczy-mobl2>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250226100926.2qkfqmrm4e5qsunb@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8
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



On 26.02.2025 11:09, Zbigniew Kempczyński wrote:
> On Wed, Feb 26, 2025 at 10:43:08AM +0100, Peter Senna Tschudin wrote:
>> Hello Vitaly,
>>
>> On 26.02.2025 10:09, Zbigniew Kempczyński wrote:
>>> On Wed, Feb 19, 2025 at 12:50:49PM -0500, vitaly prosyak wrote:
>>>> Hi Kamil,
>>>>
>>>> Thanks for raising this question. Currently, only a single test uses the memleak feature. However, we are planning to add more. This effort requires careful selection, as we want to avoid unnecessary overhead or burden. Enabling the memleak configuration significantly slows down test execution—potentially increasing the duration by 2-3 times.
>>>>
>>>> Additionally, we aim to reach internal consensus on which tests should have this feature enabled. We also want to avoid enabling both KASAN and memleak simultaneously. These considerations are the reason for the delay.
>>>>
>>>> Thanks for your understanding!
>>>>
>>>> Vitaly
>>>
>>> +Peter
>>>
>>> Peter proposed solution which is global and vendor agnostic. I mean
>>> his changes https://patchwork.freedesktop.org/series/143996/
>>> allow you to selectively run with kmemleak on using runner (-k).
>>> Together with proper list selection passed to the runner you're
>>> able to run only tests which you want to check for memory leaks.
>>
>> Thank you, Zbigniew! Just to clarify, my patch currently supports:
>>  -konce, which collects a single kmemleak log after all tests have run.
>>  -keach, which collects kmemleak logs after each test.
>>
>> However, after reading this discussion, I came up with a proposal for a
>> new option: -kfile. With this mode, igt_runner will collect kmemleak
>> logs only after running the tests specified in a given text file.
> 
> You don't need this, testlist is your file.

Yes, indeed. A test list + -keach does it. Vitaly would you comment about
the current approach in the context of your needs?

[...]
