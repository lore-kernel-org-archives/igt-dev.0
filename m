Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F701CFD35B
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 21:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E27893DB;
	Mon, 24 Nov 2025 21:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADKP0iNf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D018893DB
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 21:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764020393; x=1795556393;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KCuTuV6oZKLQW4zIajVlZcW0PwZI4KwRylbnKXYpRNo=;
 b=ADKP0iNfIa7Bl2UBHUziytm3v1bfttxU4jWhtfc7TZSQBE+/1UxUkjL3
 4ZqY0wPBuJB7UdYwPAtWoRiPI+iPJ/08qq7Cuio5DfEFekDc84IfNAHpM
 8yk1VhUygBQwtXcKWeKpziAkqvp65/ZAIf+JGTKrAAR84LbNTKWj1F3L2
 tKp84qaSvjJVya2rUWL/o43fvIHY/8tKD/VC1WEhKHKu8duTIyT1bUDkt
 xRNG1Q4SGfcJ9Jo3ZmKvqmkjbw5R1BbaoGTckzztMV0gQxx00aeEepYhL
 c048U3q186ibA6A1QZrJRsDwa8BwQQUgS99JDQNHUewo+fGbdE3Kow3n/ g==;
X-CSE-ConnectionGUID: GyDrZvuESKOq3EGFRrvheA==
X-CSE-MsgGUID: wTFItpuLRhqLxQdEqLuLYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65916705"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="65916705"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:39:52 -0800
X-CSE-ConnectionGUID: DL2lqRuNTlC2ZkKjyXI7hg==
X-CSE-MsgGUID: U/RL+U4SQ0i0RMqpZ9XuHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="192908208"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.124.222.176])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:39:50 -0800
Date: Mon, 24 Nov 2025 23:39:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/7] igt: Help out coccinelle
Message-ID: <aSTQo-enEW5TmAlv@intel.com>
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
 <b1d1fc5f-09d8-4046-b99c-77677a5b2b06@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1d1fc5f-09d8-4046-b99c-77677a5b2b06@linux.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Nov 24, 2025 at 07:12:12PM +0100, Peter Senna Tschudin wrote:
> Hi Ville,
> 
> I need to see the value proposition before supporting ~2000 lines of churn.
> 
> - Can you share the specific Coccinelle scripts that require these changes?

It doesn't matter what you want to change or how. Any time cocci sees
eg. igt_fixture or igt_main it barfs and gives up. So currently you
can't do any kind change with coccinelle to most of tests/.

> - What transformations are you planning that can't work with the current
> syntax?

We need to fix the massive pipe vs. crtc mess. And in general
it would be nice to be able to use cocci over the igt codebase.
Currently that is impossible.

> - Have you attempted these transformations and confirmed current syntax
> blocks them?

Of course I tried, How else do you think I could have
even come up with this stuff?

> 
> More importantly: Coccinelle provides mechanisms to handle non-standard
> macros (iterator declarations,

Iterators is exactly what I used. Did you read the
commit messages?

> custom isomorphisms, virtual rules,
> etc.). Have you exhausted all options for teaching Coccinelle about our
> existing macro syntax before concluding we need to modify the codebase
> itself?

"all options" would probably involev rewriting coccinelle. So no, I
haven't exhausted all options. I have spent quite a bit of time with
coccinelle and I'm not aware of any way to teach it about this kind of
non-standard syntax.

If you can pull some kind of rabbit out of your hat please do so,
and stick it into scripts/ so that other people can also use cocci
without spending a month reverse engineering the syntax.

> 
> It seems backwards to change ~2000 code locations to accommodate a tool

It doesn't really matter how many places need changing. It's all
done completely mechanically with sed, so entirely trivial.

> when the tool is designed to be configurable for exactly these situations.

It's designed to consume somewhat standard C. igt is not that.

> 
> Without concrete examples of problems being solved and evidence that
> Coccinelle-side solutions were explored, this looks like speculative
> refactoring with unclear ROI.

If you need to convince yourself then just try to do some kind of
trivial change over all of tests/ and see how far you can get
without this series and its scripts/iterators.cocci.

-- 
Ville Syrjälä
Intel
