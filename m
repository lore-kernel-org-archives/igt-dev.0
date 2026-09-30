Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6FFCA5FC5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 14:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F2110F429;
	Wed, 30 Sep 2026 14:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YaKwbJCf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BF610F429
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790779193; x=1822315193;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Kkicd12DaTEuqivSF4IXDW/ZUE7/9D1M8Rzl2isVCx0=;
 b=YaKwbJCflgK7LkLn7iKLR/p0VKh9gV86oCUGRSH2g9/f73ioxkIVgWid
 ueHrFPOdbTzG8h5B7GCgWP1RCo/991g0e4IxYsz3OqwvSESQqrZ9CSCLU
 sN+3re+P3tYvXLfYjteAiWkcwhFuHIuLxlQIgLavgW3qcFrIA+ej6dx2w
 tIXff4j2tn2Tu/U2tQdJNFREsp0DqI/Da0FtaNCJgMVaK10ROkjWnZ2O8
 4zo64Pga7007GouiwUvyNAIdvQyjcNU7F+Yt5qlYSPnmV8kFGJaOKI0bt
 GzkYJrMvNUJsGvGnrjoRAR8Vrwf+F7pJD20Ir+k+bIzrnmRZOZ4ijIAOb g==;
X-CSE-ConnectionGUID: QLJ8wofzTcKBkNYrhJCvdA==
X-CSE-MsgGUID: R5sikJ4GS6OemMdcBSLNEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91616789"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="91616789"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 07:39:53 -0700
X-CSE-ConnectionGUID: z/7ja0UaRG2jWycAmDpcnw==
X-CSE-MsgGUID: s4362r8uQLmVNMsrQM6eCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="278916111"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:39:51 -0700
Date: Wed, 30 Sep 2026 16:39:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.niemiec@intel.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t 4/8] tools/gputop/i915_gputop: add i915 PMU engine
 monitoring
Message-ID: <20260930143949.yutrf4jbana7adcc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.niemiec@intel.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <84e6c1f62a64cd5f6a9ebe549ce32b123d623f42.1790331690.git.sebastian.brzezinka@intel.com>
 <2wlmpoiinqrdba6skfdwswlvce7fh64zawqfb4cx7kp7dfjjfp@mrocbsbiys5e>
 <DLSLPB47KBCX.3B4RTMBTWH25L@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DLSLPB47KBCX.3B4RTMBTWH25L@intel.com>
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

Hi Sebastian,
On 2026-09-30 at 13:06:22 +0200, Sebastian Brzezinka wrote:
> Hi, Krzysztof,
> thanks for review.
> 
> On Mon Sep 28, 2026 at 1:01 PM CEST, Krzysztof Karas wrote:
> > Hi Sebastian,
> >
> > The implementaion looks OK, I am wondering about the duplicated
> > bits and whether it is worth it to make funcitons forcibly stand
> > out from the Xe implementation, e.g. sometimes you have tiny bit
> > of difference in formatting, or there is one more helper
> > variable in one implementation, but not the other, etc.
> >
> > I'd say it would be worth considering extracting common parts
> > into a shared file, but not necessarily in this patch series.
> Agreed on not doing it in this series, and honestly, I'd lean towards
> not doing it at all unless we actually get more backend. Each vendor
> backend implements the same interface on its own terms, by design, so
> each one can do things however makes sense for that hardware. Merging
> the common bits now, with only two backends to generalize from, risks
> guessing wrong about what's actually shared, and we'd
> end up with an abstraction that doesn't fit either one cleanly.

We could ask AMD GPUs devs took into this,
+cc Vitaly Prosyak <vitaly.prosyak@amd.com>

Vitaly, could you ask other AMD GPUs devs if there are some
features which could be added to gputop? In other words, if this
extension could also be used by AMD GPU to extend gputop output?

Regards,
Kamil

> 
> It also helps that gputop is a small standalone tool, not core library
> code, so a bit of duplication here is cheap. If another backend shows
> up we can revisit this.
> 
> 
> -- 
> Best regards,
> Sebastian
> 
