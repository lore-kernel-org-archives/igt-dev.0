Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACC7C3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 09:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7AC10E03F;
	Thu, 25 Jul 2024 09:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2ApGMdD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E285E10E17F
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 09:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721898372; x=1753434372;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=OYHmLeU5FbpNamK2WccPdQM2ehudirba7CdiY09Gqk4=;
 b=K2ApGMdDZXatKLaMH+Qb81Bb4ER0OtGlHWOY7x0PMeFWA5unPWmsS4d9
 cQ5KDkbm4lj86trRGbtUtbqrx4GvE4h+ip0YduChx9efq244eJQLp0kdP
 CyydS1rrlclNeLbqXcEFduKHYmp9pyU5FGxW+7hViv42U+HSipLtcLslA
 ULq1ylOpqrPnSsVDLkx5z0k2T26Ur47WZqe9YXd5/t5ig+VwdprtFaugx
 IfbP6MUC5gRwyBB/dRzEwVLdhFuEzSSAA5nx5CT6FC+jHS9wurXOZwPUv
 Bc2fSouQ2yuu16JJMLurzCtVxBtMckjYqahaoQXRE4BDoYnH6GtydXu9a Q==;
X-CSE-ConnectionGUID: A1Lm5yhrQfW3U7KPlpQoOg==
X-CSE-MsgGUID: xaTL7vuoTl+6CaBHofmi7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19579006"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="19579006"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 02:06:12 -0700
X-CSE-ConnectionGUID: 6uVPF+3XTQqva48B38Arxw==
X-CSE-MsgGUID: WSiv/A+0TAa4a6JxvQlHoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="90318006"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 25 Jul 2024 02:06:10 -0700
Received: from [10.245.82.99] (mwajdecz-MOBL.ger.corp.intel.com [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 69E9628198;
 Thu, 25 Jul 2024 10:06:08 +0100 (IST)
Message-ID: <2b651d12-6a40-43b2-bff1-92dfce927099@intel.com>
Date: Thu, 25 Jul 2024 11:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 2/2] benchmarks/gem_wsim: Fix mmap for discrete
 graphics cards
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tursulin@igalia.com>, zbigniew.kempczynski@intel.com,
 lukasz.laguna@intel.com
References: <20231214201302.29844-1-marcin.bernatowicz@linux.intel.com>
 <20231214201302.29844-3-marcin.bernatowicz@linux.intel.com>
 <20240723103626.tyo27oxjyjnjtyr7@kamilkon-DESK.igk.intel.com>
 <7a25163e-52f4-4d02-b609-bb7c48d90c71@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <7a25163e-52f4-4d02-b609-bb7c48d90c71@linux.intel.com>
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



On 25.07.2024 09:26, Bernatowicz, Marcin wrote:
> Hi Kamil,
> 
> On 7/23/2024 12:36 PM, Kamil Konieczny wrote:
>> Hi Marcin,
>> On 2023-12-14 at 21:13:02 +0100, Marcin Bernatowicz wrote:
>>> It appears that 'gem_mmap__wc' doesn't work for discrete graphics cards
>>> and 'I915_MMAP_OFFSET_FIXED' is needed instead.
>>> Adopt the mapping approach from 'lib/igt_dummyload'.
>>>
>>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>> ---
>>>   benchmarks/gem_wsim.c | 11 ++++++++++-
>>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
>>> index a1db37d4e..eafd9cab8 100644
>>> --- a/benchmarks/gem_wsim.c
>>> +++ b/benchmarks/gem_wsim.c
>>> @@ -1502,7 +1502,16 @@ static unsigned int create_bb(struct w_step
>>> *w, int self)
>>>       gem_set_domain(fd, w->bb_handle,
>>>                  I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
>>>   -    cs = ptr = gem_mmap__wc(fd, w->bb_handle, 0, w->bb_size,
>>> PROT_WRITE);
>>> +    if (__gem_set_caching(fd, w->bb_handle,
>>> +                  I915_CACHING_CACHED) == 0) {
>>> +        cs = ptr = gem_mmap__cpu(fd, w->bb_handle,
>>> +                       0, w->bb_size,
>>> +                       PROT_READ | PROT_WRITE);
>>> +    } else
>>
>> Be consistent, use brace after 'else':
>>     } else {
>>
>>> +        cs = ptr = gem_mmap__device_coherent(fd,
>>> +                               w->bb_handle,
>>> +                               0, w->bb_size,
>>> +                               PROT_READ | PROT_WRITE);
>>
>> so it will look like:
>>     } else {
>>         cs = ptr = gem_mmap__device_coherent(fd, w->bb_handle, 0,
>>                              w->bb_size,
>>                              PROT_READ | PROT_WRITE);
>>     }
> ok
>>
>> Please use checkpatch.pl script from Linux kernel, it could spot
>> such problems, see also CONTRIBUTE.md for some helpful options.
> 
> Strange, I did run checkpatch.pl but it didn't shout:
> 
> -----------------------------------------------------------------
> ./0001-benchmarks-gem_wsim-Support-gens-without-relocations.patch
> -----------------------------------------------------------------
> total: 0 errors, 0 warnings, 230 lines checked
> 
> ./0001-benchmarks-gem_wsim-Support-gens-without-relocations.patch has no
> obvious style problems and is ready for submission.
> -----------------------------------------------------------------
> ./0002-benchmarks-gem_wsim-Fix-mmap-for-discrete-graphics-c.patch
> -----------------------------------------------------------------
> total: 0 errors, 0 warnings, 17 lines checked
> 

try with --strict option

CHECK: multiple assignments should be avoided
#12: FILE: benchmarks/gem_wsim.c:1507:
+               cs = ptr = gem_mmap__cpu(fd, w->bb_handle,

CHECK: Unbalanced braces around else statement
#15: FILE: benchmarks/gem_wsim.c:1510:
+       } else

CHECK: multiple assignments should be avoided
#16: FILE: benchmarks/gem_wsim.c:1511:
+               cs = ptr = gem_mmap__device_coherent(fd,

total: 0 errors, 0 warnings, 3 checks, 17 lines checked


> 
>>
>> With above fixed
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Thanks
>>
>>>         /* Store initial 64b timestamp: start */
>>>       *cs++ = MI_LOAD_REGISTER_IMM(1) | MI_CS_MMIO_DST;
>>> -- 
>>> 2.31.1
>>>
