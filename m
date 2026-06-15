Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A4BCD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 09:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3B910E31C;
	Mon, 15 Jun 2026 09:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GryvOEIQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7395D10E22E
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 09:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781517264; x=1813053264;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+jkZWhQe6jfvMjbzTB9nWN8F27qn0aKJ+YbkIByKvNY=;
 b=GryvOEIQOeBwrgYiZoCW8pO3X4KzPEwBcKh0ZIiu5vKGdoeaBxi1i2sX
 XO2rGGMACfXeqbB0VxaYPiVH0WqOrKJDi4FEswJBC/bnZkZi29o3WcKAx
 nAO8NgivMf2W9eCLAtcWDiu8Vm1S7cvLfTcXdIIyUCpXupPF6VlBCW/hq
 Tz5b+VbAD+uZgMNGK17ys9pJL7R24pyl6n1zhVTVIf+zbgYNfklFVrkby
 5Smk1SoOXzYRnm6diWePAkUCh8YNxWIqoiWV7+9r/zLhMS4x2IgRSCZAl
 qn/b+hNCap5BaFN2lVdQm9vWFGC1ofvlFiVMwyr3d0cosXpWNRZT3pESL w==;
X-CSE-ConnectionGUID: xJAmCPWWQZOxm5jfMoIaWQ==
X-CSE-MsgGUID: 4W83Ij/fT8yTKh6LC9J4FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82359944"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82359944"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:54:24 -0700
X-CSE-ConnectionGUID: fYv8/nNKQA+YDvh/GJcc4Q==
X-CSE-MsgGUID: vRBFvsBIRbuXAo9Vgu4Dww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="251346830"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 02:54:22 -0700
Date: Mon, 15 Jun 2026 11:54:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: Re: [i-g-t v2] tests/intel/xe_madvise: Skip purge tests under low RAM
Message-ID: <20260615095419.eym65a3g4vmksg4w@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
References: <20260612045035.1942635-1-arvind.yadav@intel.com>
 <DJ6YFAG2CJJ7.1MSFMPH8P7TSM@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DJ6YFAG2CJJ7.1MSFMPH8P7TSM@intel.com>
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

Hi all,
On 2026-06-12 at 11:13:55 +0200, Sebastian Brzezinka wrote:
> Hi Arvind,
> 
> On Fri Jun 12, 2026 at 6:50 AM CEST, Arvind Yadav wrote:
> > The purge tests create memory pressure to trigger BO eviction. If the
> > system is already low on RAM, this extra pressure can push the machine
> > into OOM and kill the test before it can clean up.
> >
> > Check available RAM before starting the pressure allocation and skip when
> > there is not enough memory.
> >
> > v2:
> >   - Drop unrelated chunk/max_t() changes. (Kamil)
> >   - Keep the original overpressure calculation. (Kamil)
> >
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> > Cc: Nishit Sharma <nishit.sharma@intel.com>
> > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > ---
> Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> 
> -- 
> Best regards,
> Sebastian
> 

Thank you all, I merged this.

Regards,
Kamil

