Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065DCD3F07E
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 15:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF3C10E2C7;
	Wed, 28 Jan 2026 15:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cR/KkQdo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F8110E2C7
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 15:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769613284; x=1801149284;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3T3GSpTs5htjg56KpKjT9sj1PzpnnUv8oUx/7CMBkvI=;
 b=cR/KkQdoxrUPj6mvXl7XutQyMur7Z39LKAxTIngj3ZTXtFRJsArDOs+z
 J2T9dOU4Z0/X0xrtWV8W7yQnYWk2TaA6uHgz2afcRo7dhEE9c2BwYurg5
 sf7/gE1/Qc2Hmm/E5IhnNN/Xar482MFeoIgey9SqQ38M/amjTjgE6fCI2
 gcAkexAxfV5xg806gnLhlgT9rjE3MIKkgzR+w3tM7QQULJSx1/We4dflA
 /KeZZvnxvHyjuH7w7X8T7kcUHPRbB+QEg3rWOoYc7tuCvhZnzwFpeh+hZ
 6LkIl5C05htJTkuT/pUipdI9GmCRHuEn54H2a01DwCXN/qhnAciV9uLkM g==;
X-CSE-ConnectionGUID: hz7/I4ZfRCSC8qTT9E8S3A==
X-CSE-MsgGUID: gQHstjuYTcygq7KzoVywwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70732621"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70732621"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 07:14:44 -0800
X-CSE-ConnectionGUID: sAagqB2QQFCc55lBQDVl7w==
X-CSE-MsgGUID: GmpLOnDdQr6YQEEDHLIOWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="212400562"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.54])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 07:14:43 -0800
Date: Wed, 28 Jan 2026 17:14:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/8] lib/igt_kms: pipe vs CRTC index cleanups
Message-ID: <aXon4Dk6azuIFd4w@intel.com>
References: <cover.1769514879.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1769514879.git.jani.nikula@intel.com>
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

On Tue, Jan 27, 2026 at 01:55:57PM +0200, Jani Nikula wrote:
> Some manual CRTC index vs pipe cleanups to complement Ville's coccinelle
> changes.
> 
> Superceeds [1].
> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/cover.1768906414.git.jani.nikula@intel.com
> 
> Jani Nikula (8):
>   lib/igt_kms: Drop the ioctl fallback for CRTC id to pipe mapping
>   lib/igt_kms: Remove kmstest_pipe_to_index()
>   tests/kms_setmode: drop redundant drmModeGetCrtc() call
>   tests/kms_setmode: use CRTC index instead of pipe for
>     intel_drrs_disable()
>   tests/kms_setmode: use __intel_get_pipe_from_crtc_index() directly
>   lib/igt_kms: Always return CRTC index from
>     kmstest_get_pipe_from_crtc_id()
>   lib/igt_debugfs: rename igt_debugfs_pipe_dir() to
>     igt_debugfs_crtc_dir()
>   lib/i915/drrs: switch the interface from pipe to CRTC index

Series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  lib/i915/intel_drrs.c                  | 36 ++++++------
>  lib/i915/intel_drrs.h                  |  8 +--
>  lib/i915/intel_fbc.c                   |  4 +-
>  lib/igt_debugfs.c                      | 10 ++--
>  lib/igt_debugfs.h                      |  4 +-
>  lib/igt_kms.c                          | 77 ++++++--------------------
>  lib/igt_kms.h                          |  4 +-
>  tests/intel/kms_fbcon_fbt.c            |  6 +-
>  tests/intel/kms_frontbuffer_tracking.c |  2 +-
>  tests/kms_async_flips.c                | 10 ++--
>  tests/kms_setmode.c                    | 14 ++---
>  tests/nouveau_crc.c                    |  2 +-
>  12 files changed, 66 insertions(+), 111 deletions(-)
> 
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
