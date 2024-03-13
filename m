Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AAAC54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 16:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A8910E4B5;
	Wed, 13 Mar 2024 16:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvwwFLss";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC0110E4B5
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 16:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710348862; x=1741884862;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZTFTKyO3TnbUmiFlbTUG7Ic32JPq7mf9dV4sjNURKaU=;
 b=TvwwFLssCiYwvYztZ3ELQ4U7hCR13ZWeuLN9HjkjW4MCJLv22hHZDn6f
 F4VUFIBsiLZcnumGK3FISCdyEnhZ7JTagUmjLHifYCMS6YYFyq1Ex3t9O
 WVdYIA9PeH3soAcDYxrROCY5uIzYuvFUbwV0KeQ3ztjTDFkfrh9JdYnxJ
 /9ya7TqT3Z+jnu3I3vfs8LqvLpZWe2uVxHa/JBsSGNKz3puc0ZYN4bnf6
 JpXI8S/uWlztB5H2Yeb+1OoG5Zj9UXClYVJJraInJHpH4XMnzmeAQOIJ2
 W99mc7dn1AgLdL/SykDp1B2chsVjxY5q8sArcYuut7ygGDDHFMOkClq1v w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15685341"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="15685341"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 09:54:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="12402527"
Received: from unknown (HELO [10.245.244.231]) ([10.245.244.231])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 09:54:19 -0700
Message-ID: <d78b0e4e-0113-4bc1-8b52-0c0dc886b904@intel.com>
Date: Wed, 13 Mar 2024 16:54:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_evict: Skip test if smem less than
 lmem
Content-Language: en-GB
To: "Nayana, Venkata Ramana" <venkata.ramana.nayana@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20240312071502.2188325-1-priyanka.dandamudi@intel.com>
 <ZfEldQt9qH1lLuTp@DUT025-TGLU.fm.intel.com>
 <DS7PR11MB6078B65CA9CB5429B73F0A3DA52A2@DS7PR11MB6078.namprd11.prod.outlook.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <DS7PR11MB6078B65CA9CB5429B73F0A3DA52A2@DS7PR11MB6078.namprd11.prod.outlook.com>
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

On 13/03/2024 09:47, Nayana, Venkata Ramana wrote:
> 
> 
>> -----Original Message-----
>> From: Brost, Matthew <matthew.brost@intel.com>
>> Sent: Wednesday, March 13, 2024 9:33 AM
>> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
>> Cc: Nayana, Venkata Ramana <venkata.ramana.nayana@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Subject: Re: [PATCH i-g-t] tests/intel/xe_evict: Skip test if smem less than
>> lmem
>>
>> On Tue, Mar 12, 2024 at 12:45:02PM +0530, priyanka.dandamudi@intel.com
>> wrote:
>>> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>>>
>>> Currently the tests are failing with OOO memory error.
>>> Added code to skip the test if the system memory size is less than
>>> local memory size.
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
>>> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>>> ---
>>>   tests/intel/xe_evict.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c index
>>> 4de82c3bd..2dc3fe542 100644
>>> --- a/tests/intel/xe_evict.c
>>> +++ b/tests/intel/xe_evict.c
>>> @@ -753,6 +753,8 @@ igt_main
>>>   		igt_require(xe_has_vram(fd));
>>>   		vram_size = xe_visible_vram_size(fd, 0);
>>>   		igt_assert(vram_size);
>>
>> I'd add a comment here explaining why we are skipping.
>>
>> Test requires SRAM to about as big as VRAM. For example, small-cm creates
>> (448 / 2) BOs with a size (1 / 128) of the total VRAM size. For simplicity ensure
>> the SRAM size >= VRAM before running this test.

Don't we also need ram_mb() / 2? IIRC that is the actual size of the 
system memory manager in ttm. Instead of using igt_get_avail_ram_mb() 
maybe use we can use the xe region query interface which already 
accounts for that?

>>
>> Matt
> Hi Matt,
> 
> If expectation is always SRAM >= VRAM then in pre-silicon environment tests will always skip
> because on emulation LMEM size is 64GB and SMEM is 8GB, we can't get 64gb system memory
> machines. Can't we change the design? Means in the test can we limit LMEM to 4GB and do object's
> evict if >4gb? My intension instead of skip on presil environments, at least test eviction flows.

fwiw we did something like that in i915 where you can set the usable 
VRAM size via a modparam, which we make use of in gem_lmem_swapping to 
force the VRAM size to be ~4G (for similar reasons). Here we could do 
maybe do something similar using the xe region size for system memory?

> 
> Any suggestions Matt.
> 
> Thanks,
> Venkat.
>>
>>> +		igt_skip_on_f(igt_get_avail_ram_mb() < (vram_size >> 20),
>>> +			      "System memory is less than local memory \n");
>>>
>>>   		xe_for_each_engine(fd, hwe)
>>>   			if (hwe->engine_class !=
>> DRM_XE_ENGINE_CLASS_COPY)
>>> --
>>> 2.25.1
>>>
