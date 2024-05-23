Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFE8C25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 07:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1F010E1B0;
	Thu, 23 May 2024 07:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naSJXD4T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A9E10E1B0
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716449463; x=1747985463;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eZIxND8bFWYE6JFf9YU0aTGhVlNXZy1LS5I5owFuaeU=;
 b=naSJXD4Thhk8eUWbTcTc8XLuIMqC9ntT3Sj0n3QtDWuZGyDB1V0W5vf+
 KONIeeRZt9Haw2Qzj417A3M5fVWUrlGvOK09a7ODmZZ5RQhwnR/shFheC
 swB/XAXrN6cDaki6Zovq2xiMURN9eiB8dkxdWqgcDc/d7nGsKdZN6O3Yo
 JnSi5yhShshDTtbtCBSYGpUc0ES9yT2fxe8klRyeqTG0Q8Eu2CLflokPA
 76K0ZU/ovKtPjY1LnqHE+Oil4GnqTbzGAhSZ8gvX/zd5KF6EFxCRlL8sw
 ybskAi5WtUo+kXi5qAJr3iong5IlH0YDSK00lDfeMHCVtipylE6cxbU/o g==;
X-CSE-ConnectionGUID: VckytIz4SeSqG3FHHk7mKQ==
X-CSE-MsgGUID: aRRJEhCCRwaTOmesaze9Lw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="24154607"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="24154607"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 00:30:48 -0700
X-CSE-ConnectionGUID: S/0m5dT7RtCt0+YgdfjRXw==
X-CSE-MsgGUID: kki0hwGtSA+XtVkOYveqJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="34179625"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 00:30:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 kamil.konieczny@intel.com, katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v4] tools/mk_detect_intel_gpu: add a tool to
 detect Intel GPUs from their PCI IDs
In-Reply-To: <20240522144627.tdiadqyfgk67ox55@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
 <87a5kiqa6l.fsf@intel.com> <875xv6q8ob.fsf@intel.com>
 <20240522144627.tdiadqyfgk67ox55@kamilkon-DESK.igk.intel.com>
Date: Thu, 23 May 2024 10:30:37 +0300
Message-ID: <87r0dtouhu.fsf@intel.com>
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

On Wed, 22 May 2024, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> Looks like a good idea but this is also dependancy, btw

[snip]

> But this one is creating one more dependancy, one should have
> modules compiled in current running kernel.

Reading the comments about dependencies, I think this needs a different
perspective.

What is the target audience of the tool? What are they expected to have
around? What is the easiest for them to install?

lspci and modinfo are trivial to install, and most people have them
installed already. modinfo does not require the modules to be probed,
you can also point it at the .ko under /usr/lib/modules. For a user,
this gives information about the modules they actually have on their
system, which may be different from kernel or igt sources.

OTOH most people won't have kernel or igt sources available. (Let alone
specific versions of the source, which match the expectations of the
patch at hand.) Indeed, you can install igt via the distro package
manager, with no need to check out the sources.


BR,
Jani.


-- 
Jani Nikula, Intel
