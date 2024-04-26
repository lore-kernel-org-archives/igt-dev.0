Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768B6C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 08:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C2110F769;
	Fri, 26 Apr 2024 08:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjiNrCr5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E710510F769
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 08:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714118974; x=1745654974;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AAKgE5OD0UPyPNMk/8zvw77zsxfoLi3WlYVUxRLKs30=;
 b=YjiNrCr5iQm1lv5aeBirn6eSDDbZ65xerRgI2OcKhxbEjK11lXtBzYRl
 pEr3oQIIOaM8XTUEdBBKzkhEZWeghPLefTslZfm1PSY+FdI268IVo4c6d
 EDhm37O0fQyd/JkeIbfYF3/ts+zsI+ltUys/QnRzsL0tpZrbBDsgb7fqA
 +3YyqYS3WgKAKLSUWbJXOkdARDBJ3aC2+4ZSDATojwRZ6gBlKbECEUqd3
 7yG1ZvsaqxtHeG9b8Fd6B0OzEia3NyDyqr2KLzY43QBFAVSwe+nONUlU9
 oRWtzWC0AiB8OC/J+aCqCnjdVKGIAek1hzn/mmbykSAVgP7dbuVMIAytn A==;
X-CSE-ConnectionGUID: HVfRYrlXSiSjmr6Yr+C6IQ==
X-CSE-MsgGUID: 3NTUetGQQ66hMFY2mGm4QA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9773076"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9773076"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 01:09:34 -0700
X-CSE-ConnectionGUID: Qe93T9dJRaq7CrUTIgTuAA==
X-CSE-MsgGUID: KgxmqQWPTECFvZhc7N2p5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="25391945"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 01:09:33 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.182])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 72F4620B5739;
 Fri, 26 Apr 2024 01:09:31 -0700 (PDT)
Date: Fri, 26 Apr 2024 10:09:29 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Katarzyna Piecielska
 <katarzyna.piecielska@intel.com>, Aditya Chauhan
 <aditya.chauhan@intel.com>, Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: Re: [PATCH i-g-t v2 00/16] Introduce Mega feature to Xe and i915 tests
Message-ID: <20240426100929.3eb592a5@maurocar-mobl2>
In-Reply-To: <20240426092545.1b2e344c@maurocar-mobl2>
References: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
 <20240425173605.7a701d61@maurocar-mobl2>
 <20240425172913.vjbvnyfgtie4dueq@kamilkon-DESK.igk.intel.com>
 <20240426092545.1b2e344c@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 26 Apr 2024 09:25:45 +0200
Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:

> On Thu, 25 Apr 2024 19:29:13 +0200
> Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> 
> > > - for i915:
> > > 
> > > WARNING: feature CMD submission has multiple parents: None and Infrastructure
> > > WARNING: feature CMD submission has multiple hierarchical levels: 1 and 2    
> > 
> > 'None' here and below looks a little strange.  

I double-checked the logic which produces such warning: None means that
it is on the first level (so, no parents).

> 
> Indeed. I'll take a better look on how such warning was generated.

The output I pasted is bogus: the code was using a very old version of
definitions from an old repository (from the time  gem_pwrite_snooped.c 
was at tests/i915/).

Fixing it produces a different set of warnings:

WARNING: feature pwrite has multiple hierarchical levels: 3 and 4
WARNING: feature CMD submission has multiple parents: Desktop client and General Core features
WARNING: feature CMD submission has multiple hierarchical levels: 2 and 3
WARNING: feature General Core features has multiple parents: Server and Infrastructure
WARNING: feature buffer management has multiple parents: Memory management tests and CMD submission
WARNING: feature driver handler has multiple parents: CMD submission and driver
WARNING: feature sseu has multiple parents: uapi and Power management tests
WARNING: feature semaphore has multiple parents: CMD submission and Synchronization
WARNING: feature command parser has multiple parents: Blitter tests and CMD submission
WARNING: feature coherency has multiple parents: CMD submission and Caching
WARNING: feature fences has multiple parents: Memory management tests and CMD submission
WARNING: feature tiling has multiple parents: Blitter tests and Memory management tests
WARNING: feature context has multiple parents: Workarounds and Compute tests
WARNING: feature sysfs reset has multiple parents: Reset and SysMan tests
WARNING: feature drm_mm has multiple parents: Memory management and Memory management tests
WARNING: feature mock device has multiple parents: DRM and Core

Regards,
Mauro
