Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A13C83F0F
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 11:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E560710E187;
	Tue,  8 Jul 2025 11:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNWfPwhx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529A510E187
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 11:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751973518; x=1783509518;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QU8SjwRE0Ll0Yje3MA/wgGJhOZkru2ew6gPDcTlx0Xg=;
 b=NNWfPwhxeRQX33pgSFHb82vwR00pWjoAihdKlVAGS4CInoqQGUwyG/TJ
 PUXnPd05DtC706Sl49z0OnOtlqjP57pwgH56B79bTaCmy7ysCg6TZINDC
 aUOVGi/tvQxvkivEKziJLhVg6YLXOWpjpBHprtOt46evbG7oDyEJYC2jj
 EXMGZ1amXfOsCMj1jy5N4gE52e6St5FM9Fr1bjFW/NBNAMQBNxhB2vEuh
 zecUZ1/OlMRy6oGoVkwoQQP2P1OHMUv1rtqAUBSCSGykoi/RK+Ag4XzF3
 pdBjwS443mjW6GN2CI3NACk3FKnyUK3j0KHAYwubRfp2khLv7Mi+Ruatu A==;
X-CSE-ConnectionGUID: epPXoVFjTEmMyoG42S3rjw==
X-CSE-MsgGUID: K3mu192VSV+zBmHjb3fCbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="58009133"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="58009133"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 04:18:37 -0700
X-CSE-ConnectionGUID: DJ1f2w9PRbi/m+kpSHGi0A==
X-CSE-MsgGUID: dcytpPhFTrmc0mzUmvyA5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="155206407"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 04:18:35 -0700
Date: Tue, 8 Jul 2025 13:18:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t v1] tests/intel-ci: Add unsupported downscaling
 tests to blacklist
Message-ID: <20250708111833.n7g6mjjbdb6ww6gz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
References: <20250707192209.783141-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707192209.783141-1-ramanaidu.naladala@intel.com>
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

Hi Naladala,
On 2025-07-08 at 00:52:09 +0530, Naladala Ramanaidu wrote:

please improve subject, imho better:

[PATCH i-g-t v1] tests/intel-ci: Block unsupported downscaling tests

> Adds the scaling test to the blacklist due to failures when
s/scaling/downscaling/
s/blacklist/blocklist/

Regards,
Kamil

> the maximum downscale factor exceeds the 3.0 limit in either
> direction.
> 
> Bspec: 50441
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel-ci/blacklist.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 6c91f1a70..bb4b8dfec 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -84,6 +84,11 @@ igt@gem_exec_alignment@pi-shared
>  ###############################################
>  igt@kms_frontbuffer_tracking@.*drrs.*
>  ###############################################
> +# Maximum downscale must be less than 3.0 in
> +# each direction
> +###############################################
> +igt@kms_plane_scaling@.*downscale-factor-0-25.*
> +###############################################
>  # Tends to generate invalid configurations
>  # using CCS planes or configurations that
>  # exceed HW capabilities resulting in sporadic
> -- 
> 2.43.0
> 
