Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4B8CFD360
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 21:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8A210E26B;
	Mon, 24 Nov 2025 21:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/HoQlQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4BD10E26B
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 21:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764021224; x=1795557224;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ve8qUow637XAe/hkArTUHVfViMaMfMfU55oNUtr8A5g=;
 b=c/HoQlQ+YUfuPJwE73iTTAjuFlw91jl092a8xiZ7wSDr9M1V2sOCxUbp
 mdEmDUG6sd/esdiccJoU+Pq84eP/7aWHjRaiehiZUKqjy06NwmF88IA82
 p6+8sjWFKoNIfBaqPrS3bDrg4z96aALogjcKipfanlZj1mcuQuQrxl+yH
 Z1QzZjny/kDzrBLWfXi/ntOELMaP9SyhSnEOxg1j4l84utIjVGv5fJ904
 g4KJd/9GbP7r1FBeRANr4P0YrEY+K9ZgfZ6HlnmGfGNLASI90LUfsg7+d
 FqtP124kh8enhMSh1CpwdiRe3e8jWSrG4/MWmo1AefNZmMsJMW22n26Vp A==;
X-CSE-ConnectionGUID: pqgtz9KCRJOrGRHAywvyXw==
X-CSE-MsgGUID: 4mOPxgdOQDeuD1iwvjdIhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65917964"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="65917964"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:53:44 -0800
X-CSE-ConnectionGUID: 978mKGyfRtaOkhswcVV1jQ==
X-CSE-MsgGUID: bx1yW5DlQgeH9Hl2BPu4bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="191591576"
Received: from rubishem-mobl.ger.corp.intel.com (HELO [10.245.32.232])
 ([10.245.32.232])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:53:43 -0800
Message-ID: <5af7a698-bc84-48a6-99cb-fe3ce00efed2@linux.intel.com>
Date: Mon, 24 Nov 2025 22:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/7] igt: Help out coccinelle
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
 <b1d1fc5f-09d8-4046-b99c-77677a5b2b06@linux.intel.com>
 <aSTQo-enEW5TmAlv@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <aSTQo-enEW5TmAlv@intel.com>
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

Hi Ville,

Thank you for the detailed responses. That clarifies the technical
situation significantly.

I apologize if my initial questions came across as dismissive of the
work you've done. It wasn't clear from the cover letter that you'd
already explored the Coccinelle configuration approaches.

Based on your explanation:
- Coccinelle can't parse our current macro syntax even with iterator
declarations
- You've invested time exploring Coccinelle-side solutions
- The mechanical changes are straightforward via sed
- This unblocks important work on the pipe vs. crtc cleanup

This approach makes sense to me.

Thank you,

Peter

On 11/24/2025 10:39 PM, Ville Syrjälä wrote:
> On Mon, Nov 24, 2025 at 07:12:12PM +0100, Peter Senna Tschudin wrote:
>> Hi Ville,
>>
>> I need to see the value proposition before supporting ~2000 lines of churn.
>>
>> - Can you share the specific Coccinelle scripts that require these changes?
> 
> It doesn't matter what you want to change or how. Any time cocci sees
> eg. igt_fixture or igt_main it barfs and gives up. So currently you
> can't do any kind change with coccinelle to most of tests/.
> 
>> - What transformations are you planning that can't work with the current
>> syntax?
> 
> We need to fix the massive pipe vs. crtc mess. And in general
> it would be nice to be able to use cocci over the igt codebase.
> Currently that is impossible.
> 
>> - Have you attempted these transformations and confirmed current syntax
>> blocks them?
> 
> Of course I tried, How else do you think I could have
> even come up with this stuff?
> 
>>
>> More importantly: Coccinelle provides mechanisms to handle non-standard
>> macros (iterator declarations,
> 
> Iterators is exactly what I used. Did you read the
> commit messages?
> 
>> custom isomorphisms, virtual rules,
>> etc.). Have you exhausted all options for teaching Coccinelle about our
>> existing macro syntax before concluding we need to modify the codebase
>> itself?
> 
> "all options" would probably involev rewriting coccinelle. So no, I
> haven't exhausted all options. I have spent quite a bit of time with
> coccinelle and I'm not aware of any way to teach it about this kind of
> non-standard syntax.
> 
> If you can pull some kind of rabbit out of your hat please do so,
> and stick it into scripts/ so that other people can also use cocci
> without spending a month reverse engineering the syntax.
> 
>>
>> It seems backwards to change ~2000 code locations to accommodate a tool
> 
> It doesn't really matter how many places need changing. It's all
> done completely mechanically with sed, so entirely trivial.
> 
>> when the tool is designed to be configurable for exactly these situations.
> 
> It's designed to consume somewhat standard C. igt is not that.
> 
>>
>> Without concrete examples of problems being solved and evidence that
>> Coccinelle-side solutions were explored, this looks like speculative
>> refactoring with unclear ROI.
> 
> If you need to convince yourself then just try to do some kind of
> trivial change over all of tests/ and see how far you can get
> without this series and its scripts/iterators.cocci.
> 

