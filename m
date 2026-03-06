Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A5AF0183C
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 14:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F7910E28D;
	Fri,  6 Mar 2026 14:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbHxjz1E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DBB10E28D
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 14:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772806042; x=1804342042;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=j2oO0MLZWE4AMbLVf6JfHIJf7+hgpFP6Ep3Ar7vYEdI=;
 b=dbHxjz1E0pynQ/P8qm2uPAbFF8GOcDUZiVbXOgEv7JwlSxRbyvjJKZYM
 3Nb9HCaB+zbFqxfibpkDIvb8ZlORw57BLIuje3IupyJW0tAeWI9VQgff2
 cVXbPkJihYlqH0v3K46Wpu6jvpOZuvd1MiuVseyQu94eX2wZcs3hT4w6h
 iBb7Gj45O7k2mm0nfIyUPW5LwGGN9WUz1yccNDRtTvue6mGWkaP+oJlFf
 CdGA8Ocu2cSA6Sx0+y/7+JQiGX+AnGxbCBAx3YPWy7Rk08yZUD/tK+h39
 iTl/4fEh3WncroMlZF33MOT30CHmZZ8FQ2P4VEPlvL0shj3gN97tAyiSA Q==;
X-CSE-ConnectionGUID: CHbznOspTfK44DXJsbsR+Q==
X-CSE-MsgGUID: cVdh4IBMR4qKswmx1Gmm9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="74029450"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="74029450"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 06:07:21 -0800
X-CSE-ConnectionGUID: dh0K+b4JQYiVs/OiH56ifQ==
X-CSE-MsgGUID: bilp9i9kS2uE8u8UcCqdJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="223995573"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.250])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 06:07:20 -0800
Date: Fri, 6 Mar 2026 16:07:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/5] igt: reduce igt_crtc_for_pipe() usage
Message-ID: <aarflc3kTTOm-8ln@intel.com>
References: <cover.1772803372.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1772803372.git.jani.nikula@intel.com>
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

On Fri, Mar 06, 2026 at 03:23:53PM +0200, Jani Nikula wrote:
> Add igt_next_crtc() and igt_random_crtc() to let us remove a few more
> igt_crtc_for_pipe() calls.
> 
> Jani Nikula (5):
>   lib/kms: add igt_next_crtc()
>   tests/intel/gem_pxp: use igt_next_crtc()
>   tests/intel/xe_pxp: use igt_next_crtc()
>   tests/kms_multipipe_modeset: use igt_next_crtc()
>   lib/kms: add igt_random_crtc() and use it in gem_eio

For the series
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  lib/igt_kms.c                 | 39 +++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h                 |  2 ++
>  tests/intel/gem_eio.c         |  7 +------
>  tests/intel/gem_pxp.c         |  7 +++----
>  tests/intel/xe_pxp.c          | 15 ++++++--------
>  tests/kms_multipipe_modeset.c | 32 +++++++++++++---------------
>  6 files changed, 65 insertions(+), 37 deletions(-)
> 
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
