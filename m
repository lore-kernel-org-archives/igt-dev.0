Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F41EBFD36
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 10:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFA610E32A;
	Mon, 13 Apr 2026 10:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="c7T/EHal";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B1B10E32A
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1776076113;
 bh=D6KSqActCiCcrn+lLF3OoHC5AMJZJqBoZnc3P0yzA3w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c7T/EHalyZWVm/HvCWHM9YxN1GX++Ktq2zePOO3qSC+c/LwXrbvvRGEU3/vSkmTzF
 T53tNyg4fsuL+UMWyUQqRFxF3R8euEmpCw+iGO4xO7yAw+yHRAUyR5lVgwp0YGCJta
 fIh+BIlRt4sxbuW/sphScgjE49uwVR3LqGmu++XfNbGVOxx2uwPvhHToxPJnid3KEs
 eIk2zUIe1OSC4t1hw/B6IJKZ7vtV4JKMvNhypPPMguFysgzELw+1zYiie11OMgcDh3
 UF3QIS85ONL1DabbMr1GHWuKSAaX+lpHLC9JBA8ZXUdcq3j8+3wsg+45VNxGBvMy4F
 kPAn6waCa1ffw==
Message-ID: <e26ffc22-41dd-4ad8-9415-b2628151a645@lankhorst.se>
Date: Mon, 13 Apr 2026 12:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier when
 supported
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: "B, Jeevan" <jeevan.b@intel.com>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260316033807.24078-1-jeevan.b@intel.com>
 <abgWhvmToId2i7mj@intel.com>
 <DM4PR11MB6312386897459B61FF1CC3BA9040A@DM4PR11MB6312.namprd11.prod.outlook.com>
 <7b527da4-787f-4623-9bed-f574daec7fb4@intel.com>
 <DM4PR11MB6312D0A1A5310AF1ECBF47EB904EA@DM4PR11MB6312.namprd11.prod.outlook.com>
 <c60ad161-ae0a-47a3-acf0-85a517f6199e@lankhorst.se>
 <ady3cgAzN2t-HCpH@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <ady3cgAzN2t-HCpH@intel.com>
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

Hey,

Den 2026-04-13 kl. 11:29, skrev Ville Syrjälä:
> On Mon, Apr 13, 2026 at 11:21:09AM +0200, Maarten Lankhorst wrote:
>> Hey,
>>
>> My thoughts at the end, I think the focus on linear formats is misguided.
> 
> What's misguided is adding driver specific hacks to each and every
> test. If we think that the default modifier used for most things
> should be something other than linear, then we need to introduce
> a proper driver agnostic mechanism tests can use to pick the preferred
> modifier.

I think we should indeed try to abstract it so that it's not driver specific.
Looking into igt_fb.c, there is already tiling support for VC4, amd, nouveau,
xe and i915.

We already specify all the parameters needed to determine the best tiling
format when calling igt_create_fb, so the cleanest solution for IGT is
likely adding a new IGT-specific modifier that igt_fb.c maps to the
best performing tiled for this FB or fallbacks to linear.

The intended usecase of IGT is testing, so this would be the right way to
handle this.

Kind regards,
~Maarten Lankhorst

> 
>>
>> Den 2026-03-18 kl. 05:19, skrev B, Jeevan:
>>> Hi Ramanaidu,
>>>
>>>  
>>>
>>> Apart from set_fb_on_crtc I don’t think we need to add this change anywhere else, There are few fb creation happening for cursor.
>>>
>>>  
>>>
>>> Thanks
>>>
>>> Jeevan B
>>>
>>>  
>>>
>>> *From:*Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
>>> *Sent:* Wednesday, March 18, 2026 1:14 AM
>>> *To:* B, Jeevan <jeevan.b@intel.com>; Ville Syrjälä <ville.syrjala@linux.intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
>>> *Cc:* igt-dev@lists.freedesktop.org
>>> *Subject:* Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier when supported
>>>
>>>  
>>>
>>> ++ Arun
>>>
>>> Hi Ville,
>>>
>>> On 3/16/2026 10:57 PM, B, Jeevan wrote:
>>>
>>>         -----Original Message-----
>>>
>>>         From: Ville Syrjälä <ville.syrjala@linux.intel.com> <mailto:ville.syrjala@linux.intel.com>
>>>
>>>         Sent: Monday, March 16, 2026 8:15 PM
>>>
>>>         To: B, Jeevan <jeevan.b@intel.com> <mailto:jeevan.b@intel.com>
>>>
>>>         Cc: igt-dev@lists.freedesktop.org <mailto:igt-dev@lists.freedesktop.org>; Naladala, Ramanaidu
>>>
>>>         <ramanaidu.naladala@intel.com> <mailto:ramanaidu.naladala@intel.com>
>>>
>>>         Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier when
>>>
>>>         supported
>>>
>>>          
>>>
>>>         On Mon, Mar 16, 2026 at 09:08:07AM +0530, Jeevan B wrote:
>>>
>>>             While creating the framebuffer, prefer tile4 when it is supported
>>>
>>>             instead of always using linear. Fall back to linear if tile4 is not
>>>
>>>             available.
>>>
>>>          
>>>
>>>         Why?
>>>
>>>     On Xe platforms, using the linear modifier takes longer to prepare and submit a flip compared to tiled modifiers. 
>>>
>>>     On HRR panels, the available frame time is small, and this delay can cause flips to be submitted in the Evasion region, 
>>>
>>>     leading to sequence mismatches.
>>>
>>>  
>>>
>>> Adding some points:
>>>
>>> XE does not include memory optimizations for linear surfaces, which leads to higher processing time for linear buffers. Consequently, linear stress tests are intermittently failing.
>>
>> I've been working on GGTT and pinning. The problem with linear pinning is
>> that you pin the entire FB into GGTT, using uncached writes.
>>
>> Compositors are already aware that linear framebuffers are slow on all
>> drivers, not just xe, and will avoid using them at all costs.
>>
>> The tests should similarly avoid using linear framebuffers, as they will
>> not be representive of real workloads.
>> Any non-linear modifier is good, 4-tiled probably bst.
>>
>> If you keep using linear, the XRGB101010 format on a 4K monitor
>> (3840x2160) would need to over 8000 uncached writes in a row into GGTT,
>> stalling synchronously each time on the completion of the write by the
>> display hardware.
>> This only gets worse when you use other formats with the linear modifier.
>>
>> If there is still a problem when using tiled modifiers, and tests
>> continue to fail, I have some ideas to make DPT even faster, without
>> requiring unbound usage of GGTT.
>>
>> Acked-by: Maarten Lankhorst <dev@lankhorst.se>
>>
>> Kind regards,
>> ~Maarten Lankhorst
> 

