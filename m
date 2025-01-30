Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB68C0218D
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 11:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7395810E93E;
	Thu, 30 Jan 2025 11:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gl1Jo634";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E36E10E93E;
 Thu, 30 Jan 2025 11:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738237523; x=1769773523;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2kRuGto7934nKtPtiMal7FsI+mahxki6A/jFZdKcSZk=;
 b=gl1Jo634StuweBJnExhGSBevs+I2ARzm/SaC8zO508K7pmMeidCEGFS5
 IKI2vtp3f8fgeVffmV9BdHps5uXtYELW/ulETiskquUJuKZ92fQLQ4FBg
 TRvMMfMmIFSlMWB1OrSSH/9zDzjIGWN9HZ7ycBdrw7BN/DZX+jMiKwaBE
 Yg3eIY4tlX6RSFBV4y1tWk0O79NskcTwNorviwLvCMZYIwfwgV8bgD4dO
 QdnmLKyiMGYpPsxPopuMwh4kcKzPBsWT90yrloQ6RClgQzE1sKjiqiD6l
 upxO6Se4dl5OUy1D2x4xQ2kQwRiDX+6iZbLK3LLRmQzbN1rXSSJBn224B w==;
X-CSE-ConnectionGUID: E0OXsFJrTASnSUwTIClQTg==
X-CSE-MsgGUID: +7zk+x7GTeG21dOCWQcNgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38017797"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38017797"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 03:45:23 -0800
X-CSE-ConnectionGUID: bNv6t8foS46PkBIvPnp66A==
X-CSE-MsgGUID: f9j2hRWxSdC+1wiuAXzH2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="114285475"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 03:45:22 -0800
Date: Thu, 30 Jan 2025 12:45:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 lib/pciids: sync with kernel (rev2)
Message-ID: <20250130114506.nwskobdn7nbh5fnc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250129105902.120630-1-kamil.konieczny@linux.intel.com>
 <173817006756.2503324.12809547340176412547@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173817006756.2503324.12809547340176412547@b555e5b46a47>
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

Hi igt-dev,
On 2025-01-29 at 17:01:07 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/pciids: sync with kernel (rev2)
> URL   : https://patchwork.freedesktop.org/series/141981/
> State : failure

these are unrelated to a change, no need for respin.

Regards,
Kamil

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16038_full -> IGTPW_12512_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12512_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12512_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12512/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12512_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_setmaster@master-drop-set-root:
>     - shard-tglu:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16038/shard-tglu-6/igt@core_setmaster@master-drop-set-root.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12512/shard-tglu-5/igt@core_setmaster@master-drop-set-root.html
> 
>   * igt@i915_hangman@gt-error-state-capture@vcs0:
>     - shard-mtlp:         [PASS][3] -> [ABORT][4] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16038/shard-mtlp-5/igt@i915_hangman@gt-error-state-capture@vcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12512/shard-mtlp-7/igt@i915_hangman@gt-error-state-capture@vcs0.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12512_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#6230])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12512/shard-tglu-8/igt@api_intel_bb@crc32.html
> 

...cut...

> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12512/index.htmlgggg
