Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB097CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 13:38:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B79410E449;
	Mon, 18 Aug 2025 13:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wwme4X4g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90F910E449
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 13:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755524331; x=1787060331;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9IACHmdaNI90el9JIUTb0P3sU0a1ZjzqQVz0FlIpuD0=;
 b=Wwme4X4gwlOpnS5fn947HnZ3FIW7fPSW+A8Ux7bzkT5CnbTikwWSwAPE
 /f7XBxI37nXHStWp0XC5AAXorp2ZlhSICxBY04F2TcaousshYK0mvdkhY
 76/yjmVz+U+ck3dfoe8nlQKaSGVeqgfxiH30WyVJSEwJVfl/fSpppbRWP
 JGMkfBNA2usBlEVOp1bxMSF40Ey4w7juiZ1cMHFhqQnckcusKdfnAur0o
 L28BRiLQ4/PjIL2AShLvCPQU+L7F9uTns7M88VrghF0FJc5Xjpv3ijb9D
 ewvpLwrTRSuXbaTk8/8baxSvVFpcfm80UtTkypHOmuZUpyaSDABKV/p0w w==;
X-CSE-ConnectionGUID: UUgwaTiJRZKt9ysXe7SmbA==
X-CSE-MsgGUID: xJY2QjjyR/6veOddeFDQpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68011513"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="68011513"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 06:38:50 -0700
X-CSE-ConnectionGUID: nVck4xn3RCu6fFNizwtmXQ==
X-CSE-MsgGUID: QsSKDq00T1eLdQ6bL8djkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167491140"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 06:38:49 -0700
Date: Mon, 18 Aug 2025 15:38:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/5] tools/intel_vbt_decode: Remove intel_bios.h
Message-ID: <20250818133847.h3ssyizdtybautfh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <cover.1755175663.git.jani.nikula@intel.com>
 <7090e70d712c94aed53f52c49a8155eb4c6b966c.1755175663.git.jani.nikula@intel.com>
 <20250814164451.vymqgxvjddnks6ar@kamilkon-DESK.igk.intel.com>
 <c6545ab607e36451fab16dbdb1602fd14050b88d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c6545ab607e36451fab16dbdb1602fd14050b88d@intel.com>
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

Hi Jani,
On 2025-08-18 at 13:55:41 +0300, Jani Nikula wrote:
> On Thu, 14 Aug 2025, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > Please resend this as fdo patchwork has some problems and this one
> > is missing (so it cannot create a series and CI cannot test it).
> 
> I did, but it still fails [1].

Yes but at least it shows up in patchwork now.

> I presume it's because of the latin1
> copyright signs. I really can't be bothered to debug where it all goes
> wrong, so I sent a patch to convert the remaining latin1 files to utf8
> in igt [2]. I think that's trivial enough to push directly even if
> patchwork still trips over it, and we can move on.

That is another tooling bug, same with 'git pw as' but at least
it do apply when I take it from mailing list.

Imho I would review it and you can ignore patchwork error.

Also correct your other patch as after deletion of intel_bios.h
it will be shorter.

Regards,
Kamil

> 
> BR,
> Jani.
> 
> 
> [1] https://patchwork.freedesktop.org/series/152979/
> [2] https://lore.kernel.org/r/20250818105133.2676928-1-jani.nikula@intel.com
> 
> 
> -- 
> Jani Nikula, Intel
