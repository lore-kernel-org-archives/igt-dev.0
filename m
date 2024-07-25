Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F18C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 07:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FF710E10C;
	Thu, 25 Jul 2024 07:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2bPa2qA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9099810E10C
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 07:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721892418; x=1753428418;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=WQHH9vZdKU5qgbYpns4bWBwRu1RH7lrKz/MwYzhsgE8=;
 b=T2bPa2qAief/AdDliBtbler1TL6JBCqT+GnUgjgxlf7Q6JgHjUG58xKE
 ZvAYtp6+IMl91VZS4MUwKKfckxYl7XLBw8UwiJYQiVvGpb8+3J0OetgtM
 4wo4sXoDrEX+Zsw5AlMcBoJcVqpUuQlK9oSirDN5c6PLA738Pib8iadTG
 4pK3cGfamIfTqNo6Yz0cIIBcOwP9U3BdDNAvpfMtuWecJNdEn9VaXarwL
 jLTg84129bFPG8y6xQ4TIHrGneCUlLjLwTNR88hcyuJbLzNN8QN19qqWs
 ceurJqoFE2cdGKedmBBE4wxI2GBxJpGq0nMZVmU0rUx67/tiKoV4ZRp4a g==;
X-CSE-ConnectionGUID: BgbG3EspS9CtcyAxzGJYLA==
X-CSE-MsgGUID: E5vdpXDISbC6XpKEOhduiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19415644"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="19415644"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 00:26:44 -0700
X-CSE-ConnectionGUID: TYnHGE6bQiG+xnnXosmP+A==
X-CSE-MsgGUID: 70j/+BF9QNGiNb/8w6e7+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="57140866"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.0.122])
 ([10.246.0.122])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 00:26:43 -0700
Message-ID: <7a25163e-52f4-4d02-b609-bb7c48d90c71@linux.intel.com>
Date: Thu, 25 Jul 2024 09:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 2/2] benchmarks/gem_wsim: Fix mmap for discrete
 graphics cards
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tursulin@igalia.com>, zbigniew.kempczynski@intel.com,
 lukasz.laguna@intel.com
References: <20231214201302.29844-1-marcin.bernatowicz@linux.intel.com>
 <20231214201302.29844-3-marcin.bernatowicz@linux.intel.com>
 <20240723103626.tyo27oxjyjnjtyr7@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240723103626.tyo27oxjyjnjtyr7@kamilkon-DESK.igk.intel.com>
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

Hi Kamil,

On 7/23/2024 12:36 PM, Kamil Konieczny wrote:
> Hi Marcin,
> On 2023-12-14 at 21:13:02 +0100, Marcin Bernatowicz wrote:
>> It appears that 'gem_mmap__wc' doesn't work for discrete graphics cards
>> and 'I915_MMAP_OFFSET_FIXED' is needed instead.
>> Adopt the mapping approach from 'lib/igt_dummyload'.
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   benchmarks/gem_wsim.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
>> index a1db37d4e..eafd9cab8 100644
>> --- a/benchmarks/gem_wsim.c
>> +++ b/benchmarks/gem_wsim.c
>> @@ -1502,7 +1502,16 @@ static unsigned int create_bb(struct w_step *w, int self)
>>   	gem_set_domain(fd, w->bb_handle,
>>   		       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
>>   
>> -	cs = ptr = gem_mmap__wc(fd, w->bb_handle, 0, w->bb_size, PROT_WRITE);
>> +	if (__gem_set_caching(fd, w->bb_handle,
>> +			      I915_CACHING_CACHED) == 0) {
>> +		cs = ptr = gem_mmap__cpu(fd, w->bb_handle,
>> +					   0, w->bb_size,
>> +					   PROT_READ | PROT_WRITE);
>> +	} else
> 
> Be consistent, use brace after 'else':
> 	} else {
> 
>> +		cs = ptr = gem_mmap__device_coherent(fd,
>> +						       w->bb_handle,
>> +						       0, w->bb_size,
>> +						       PROT_READ | PROT_WRITE);
> 
> so it will look like:
> 	} else {
> 		cs = ptr = gem_mmap__device_coherent(fd, w->bb_handle, 0,
> 						     w->bb_size,
> 						     PROT_READ | PROT_WRITE);
> 	}
ok
> 
> Please use checkpatch.pl script from Linux kernel, it could spot
> such problems, see also CONTRIBUTE.md for some helpful options.

Strange, I did run checkpatch.pl but it didn't shout:

-----------------------------------------------------------------
./0001-benchmarks-gem_wsim-Support-gens-without-relocations.patch
-----------------------------------------------------------------
total: 0 errors, 0 warnings, 230 lines checked

./0001-benchmarks-gem_wsim-Support-gens-without-relocations.patch has no 
obvious style problems and is ready for submission.
-----------------------------------------------------------------
./0002-benchmarks-gem_wsim-Fix-mmap-for-discrete-graphics-c.patch
-----------------------------------------------------------------
total: 0 errors, 0 warnings, 17 lines checked


> 
> With above fixed
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks
> 
>>   
>>   	/* Store initial 64b timestamp: start */
>>   	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_CS_MMIO_DST;
>> -- 
>> 2.31.1
>>
