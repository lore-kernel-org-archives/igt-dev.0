Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6ADCA0EC0
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 10:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A1010E1D2;
	Mon, 18 Aug 2025 10:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9wZkf3B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDE010E1D2
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755514547; x=1787050547;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mpKL2RmFh30JWNQnO4ejpi0pBs4Qbw/1DaYM3e8ePeY=;
 b=C9wZkf3BP3/N9oMDcanXwreDW2Y36CMNXXSZnQ0E6iRFnqjLrKOdXhry
 dgTxwBK3tNp+uBxbzt1jnDe/ZY9a4WHVfrhs+83k9mF1tbMu6/gtjN/kf
 heG1Dok4b7UiFhVRnESAswdB+EWJfyyythMPc1SR6yD3TsKR1xZhugBh1
 bY2ojchQS76vikNy6vuTB6oe98AdgRiPD+b2xahQB5xgpa7VP4oqsT2Eo
 WLHzB9mIWNujoevYTGyszzQTOuUp/sGUKxnYRx6g7odFBi0rIznwFzcnI
 1rZ6njnM2ftoNYfjluEKRScpKfrs9ASo8SjSY2PAsK1aTKqrqVGuVYl4d w==;
X-CSE-ConnectionGUID: MncYQRuDQA6tdJY0A2t1cg==
X-CSE-MsgGUID: jmq/+COeRTihJya/BxHcSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="83165166"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="83165166"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 03:55:46 -0700
X-CSE-ConnectionGUID: bPMT3f+BScGITlEEt2GlGw==
X-CSE-MsgGUID: R32XUcBoRi6mnFHlC2wGfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166722457"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.188])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 03:55:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/5] tools/intel_vbt_decode: Remove intel_bios.h
In-Reply-To: <20250814164451.vymqgxvjddnks6ar@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1755175663.git.jani.nikula@intel.com>
 <7090e70d712c94aed53f52c49a8155eb4c6b966c.1755175663.git.jani.nikula@intel.com>
 <20250814164451.vymqgxvjddnks6ar@kamilkon-DESK.igk.intel.com>
Date: Mon, 18 Aug 2025 13:55:41 +0300
Message-ID: <c6545ab607e36451fab16dbdb1602fd14050b88d@intel.com>
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

On Thu, 14 Aug 2025, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> Please resend this as fdo patchwork has some problems and this one
> is missing (so it cannot create a series and CI cannot test it).

I did, but it still fails [1]. I presume it's because of the latin1
copyright signs. I really can't be bothered to debug where it all goes
wrong, so I sent a patch to convert the remaining latin1 files to utf8
in igt [2]. I think that's trivial enough to push directly even if
patchwork still trips over it, and we can move on.

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/152979/
[2] https://lore.kernel.org/r/20250818105133.2676928-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel
