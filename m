Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87029D0E6E3
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 13:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A5210E3FF;
	Tue, 25 Nov 2025 13:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HkyLS9Vy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B63410E400
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 13:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764078271; x=1795614271;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0HGrwfosCwV35gpwdZffx0rJgwVCM4wV2DYISy6pIAI=;
 b=HkyLS9VyxOhy86EomtyRn/WG51iiXISIBtNcMNCNcARk5N1YlmJg5Sj6
 p4b+sf64JTHJEtCrSbWQUk9aU7L5zKQay1ZGINLPoDPfZhlTpPmctUgYE
 ZcC6eM4hmDluJhkNAcYYFsT0vvJ/Rad4Mm+IUIqpJAPx1iqpUmkSPnwei
 RONxUl2HEp782IPcW836uMfTkwlgHemD+7QKQbyoEk1+mvc0NCfDNMCcx
 FC9c+ZgoPFqD0TfS4pNjGKchUXwtBbvvZiOPPeTHy7VXNJFG2/PFPdPjZ
 DWIltWfBPb5g9ncDrnWWJtsdfNmlj6V76Wfin/6aEqr2fudJv9HO1wLl7 A==;
X-CSE-ConnectionGUID: wl3Oj7IwQtWtcvTHDhxNXQ==
X-CSE-MsgGUID: qjKTMzhLTSOCTS9u1sAtRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69952798"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="69952798"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:44:31 -0800
X-CSE-ConnectionGUID: 5qyubiSBQmmJdoWzvOTvHw==
X-CSE-MsgGUID: 6yRiP5CIQqO32LgKrv/XOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="196803068"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 05:44:30 -0800
Date: Tue, 25 Nov 2025 14:44:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH i-g-t 0/7] igt: Help out coccinelle
Message-ID: <20251125134427.r6i3d7iec5atxmgo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
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
On 2025-11-20 at 21:14:08 +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Coccinelle has trouble parsing a lot of the magic macros
> used throughout igt. Convert some of the macros to a form
> coccinelle understands, and provide a pre-made iterators.cocci
> script that people can include in their own scripts to help
> coccinelle with the iterator macros.
> 
> Ville Syrjälä (7):
>   igt: Make igt_fixture look like an iterator
>   igt: Make igt_subtest_group look like an iterator
>   igt: Make igt_main look more like a function
>   igt: Make igt_simple_main look more like a function
>   igt: Make igt_main*() look like normal function definition
>   igt: Make igt_simple_main*() look like normal function definition
>   scripts/cocci: Add iterators.cocci

All of those changes are mostly one-line sed modifications,
could they be just a part of bigger script to prepare
sources in some temporary place and then just run
cocinnelle over it? And moving those changes back into
igt source.

Or prepare changes in-place, do actual work and then reversing
sed changes in generated patches.

Regards,
Kamil

[cut]
>  472 files changed, 1930 insertions(+), 1875 deletions(-)
>  create mode 100644 scripts/iterators.cocci
> 
> -- 
> 2.49.1
> 
