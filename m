Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ACC105F791
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 10:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE1710EB7A;
	Fri, 13 Mar 2026 10:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SBD2k5XO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A887C10EB7A
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 10:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773397695; x=1804933695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=86CpBDjK57MTLkI5urmIUzVhRMVeKRmmJQ7zdxHVcsM=;
 b=SBD2k5XOJC2cg7PPivAFb5UtDHBxejYlXK17AARJrnDqeLVcW1Cdie6I
 iX9pd8rl0691p3OXtY9Ko9jRO6bj47sEvgVETpnaRWOMbrHxz2TLYtt06
 20TMLs5HOpXpfxzcIZ5IM4jvR3+2hmGTLGSgixt0mKBMVSRvM2RGgbHaL
 U9EL2UZF4E+qlqFfGW9wf3z+/tiDiSxal9224XV/n5g/2i0h9GLpV9pTa
 hUBTnhLFZW1Zh8gzQDtHsFZxW6uHhwQKsu2NzzOwQrpSABWoTD/iRjYJH
 qf0nNI5eVFoUBBYZ9juF3xH8iV1F7Riwn2xreu6Cz2yqx8wQJfoEaVCNv g==;
X-CSE-ConnectionGUID: UpI3vmfiQSiiwR6UgbOHFQ==
X-CSE-MsgGUID: QT62lqvDRSyyy6lO/OK3hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74419730"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74419730"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 03:28:15 -0700
X-CSE-ConnectionGUID: LHTRpCuoRxqx+RweQQYSJw==
X-CSE-MsgGUID: qnIt3a+PSciRLo/OSYZNbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="216054931"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 03:28:14 -0700
Date: Fri, 13 Mar 2026 12:28:11 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/8] CRTC index vs. pipe fixes, drrs/fbc interface
 cleanups
Message-ID: <abPmu2Jm-6v-facX@intel.com>
References: <cover.1773394225.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1773394225.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, Mar 13, 2026 at 11:31:52AM +0200, Jani Nikula wrote:
> DRRS and FBC interface cleanups, along with a bunch of related CRTC
> index and pipe usage confusion fixes.
> 
> Jani Nikula (8):
>   lib/kms: add and use igt_crtc_debugfs_dir()
>   lib/kms: add igt_crtc_for_crtc_index()
>   lib/i915/drrs: convert the interface to igt_crtc_t
>   Revert "lib/i915/intel_fbc: Add fbc supported check based on wa"
>   lib/i915/fbc: make intel_fbc_max_plane_size() static
>   lib/i915/fbc: pass display to intel_fbc_plane_size_supported()
>   lib/i915/fbc: convert intel_fbc_{enable,disable}() into proper
>     functions
>   lib/i915/fbc: convert intel_fbc_supported_for_psr_mode() to
>     igt_display_t*

Series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Nuking the pointless igt_debugfs_*_dir() 'mode' arguments could
be done afterwards.

> 
>  lib/i915/intel_drrs.c                  | 40 +++++++++--------
>  lib/i915/intel_drrs.h                  | 10 +++--
>  lib/i915/intel_fbc.c                   | 61 +++++++++++---------------
>  lib/i915/intel_fbc.h                   | 11 ++---
>  lib/igt_kms.c                          | 19 +++++++-
>  lib/igt_kms.h                          |  3 ++
>  tests/intel/kms_dirtyfb.c              | 16 +++----
>  tests/intel/kms_fbc_dirty_rect.c       |  2 +-
>  tests/intel/kms_frontbuffer_tracking.c | 16 +++----
>  tests/intel/kms_psr.c                  |  4 +-
>  tests/intel/kms_psr2_sf.c              |  4 +-
>  tests/kms_flip.c                       |  8 +++-
>  tests/kms_setmode.c                    |  2 +-
>  tests/nouveau_crc.c                    |  4 +-
>  14 files changed, 103 insertions(+), 97 deletions(-)
> 
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
