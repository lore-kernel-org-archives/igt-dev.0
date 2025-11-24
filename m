Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DB2CFD356
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 20:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA31F10E25A;
	Mon, 24 Nov 2025 20:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c9xUAX73";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69DB10E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 20:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764017872; x=1795553872;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=FSJBUNIqG8+wlT4C9Hr8XAXZwbN5Z8R14UXpF/W6AtE=;
 b=c9xUAX733mCHkvZE3oIOFD2sObFledh4LjjIN3UHEXl972OaAYnKnSQ2
 CYIGULoKl60xVs38kb1MdeO93tgLADZwq94pEon18EyLvadEWWqYgHzLc
 qVOJxnYK38vraOPA9TP7/XYzZbTdYfdhvWu/gF7k7STGPUlHkqv9bSohR
 tmpRhTMwDz65CefaBNvv9rl/kqMDeWg88vUTWp1hFHOs2emcwaCzXVEpb
 OuOM+jsLEPZ/M48U585a4ofQOdPHPDDuJjiQuz0hLqM7Q3mXaz8Bjanlx
 PAYdSngkP3SUnPRRpJx6UH2L2Ae+yAa8JS5G3kF1GHT3xaeX9yJAgSvzM w==;
X-CSE-ConnectionGUID: oHuWzERQRkOexSPaDNX0+A==
X-CSE-MsgGUID: uL9nisWrTmaBKMXwuUymIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="53597562"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="53597562"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 12:57:48 -0800
X-CSE-ConnectionGUID: hVNRBy+CSCC15hCcXVEapw==
X-CSE-MsgGUID: PJIV199SRX6bXHlKzn3CZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="196619938"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.177])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 12:57:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 0/7] igt: Help out coccinelle
In-Reply-To: <b1d1fc5f-09d8-4046-b99c-77677a5b2b06@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
 <b1d1fc5f-09d8-4046-b99c-77677a5b2b06@linux.intel.com>
Date: Mon, 24 Nov 2025 22:57:43 +0200
Message-ID: <c22c7a7b942a53bc8699121226d0b4dc2895b066@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 24 Nov 2025, Peter Senna Tschudin <peter.senna@linux.intel.com> wrote:
> Hi Ville,
>
> I need to see the value proposition before supporting ~2000 lines of churn.
>
> - Can you share the specific Coccinelle scripts that require these changes?
> - What transformations are you planning that can't work with the current
> syntax?
> - Have you attempted these transformations and confirmed current syntax
> blocks them?
>
> More importantly: Coccinelle provides mechanisms to handle non-standard
> macros (iterator declarations, custom isomorphisms, virtual rules,
> etc.). Have you exhausted all options for teaching Coccinelle about our
> existing macro syntax before concluding we need to modify the codebase
> itself?
>
> It seems backwards to change ~2000 code locations to accommodate a tool
> when the tool is designed to be configurable for exactly these situations.

Generally speaking, Coccinelle is not a user-friendly tool. And that's
about the nicest way to put it. It takes a while to get used to, and to
get even the simplest changes done. But it can be really powerful when
you've banged it into submission.

I think the question here is about unlocking the powers of Coccinelle on
the igt code base. If you can't do the simplest transformations without
first figuring out how to dodge all the idiosyncrasies of igt syntax,
you're just not going to do it, are you?

Or are you proposing to start maintaining an igt library of mandatory
Coccinelle includes, something that very few people are going to
understand at all?

> Without concrete examples of problems being solved and evidence that
> Coccinelle-side solutions were explored, this looks like speculative
> refactoring with unclear ROI.

I presume the prime use case is to stop conflating crtc_index with enum
pipe [1].


BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/187


-- 
Jani Nikula, Intel
