Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F6AC52D71
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 10:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0021310E89F;
	Fri,  9 Aug 2024 10:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqcJIE7z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F166C10E89F
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 10:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723198443; x=1754734443;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+vk9rWL5rnZlRRRXHJvQFaRNCgCTCPXG6sLqdlYFfvc=;
 b=OqcJIE7zgYREf1Thvxisz4qyBF2guY6Vt7l91Z/vDaA2vdIF/gpuUes+
 91AIBtOkVLmtf7wdicTa6ANxSfBOp/8u5Xs5cGNFbKA2c8fGGTgntAB+L
 ex/oJbCxxeJp00wwKIFAWZFQCxGly6sjp77+CEcfgvJTfu5Tyem3WfW4P
 aypRVwuOZGp0KmwSrhJGqiZSfbpx9p//Mp9MVi35HVEKHlRPVlKnQJ35K
 RQ/Sko0oFps3btWU+a/+MfBEL8F7nY1hawIw/DGIzycmCLwbZYFBSZlOs
 be62iJEHOL1/SqQAe1507Z7ue/A0YZeG/z1DyczmACAUInSilhjxFLEKp Q==;
X-CSE-ConnectionGUID: c5SuF6+pSXWYws/4eAqEZw==
X-CSE-MsgGUID: udNGOMzGTxeinMMkaPWM3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21248346"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="21248346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:14:02 -0700
X-CSE-ConnectionGUID: vcPp9pjxTXSSSAd8o+IV1Q==
X-CSE-MsgGUID: iLg+2n7ETxKQcUeQCO3rmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="61929915"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 03:14:02 -0700
Date: Fri, 9 Aug 2024 12:13:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: Re: [PATCH i-g-t 1/1] tests/intel: Drop 'Run type' from xe_exec_sip
 documentation
Message-ID: <20240809101358.sx4mw3x47hip53vb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
References: <20240809093447.4001496-1-katarzyna.piecielska@intel.com>
 <20240809093447.4001496-2-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240809093447.4001496-2-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-08-09 at 09:34:47 +0000, Katarzyna Piecielska wrote:
> 'Run type' is not used in IGT test documentation for some time already.
> Let's remove it from the only test that has it.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> ---
>  tests/intel/xe_exec_sip.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
> index 4b599e7f6..f99726761 100644
> --- a/tests/intel/xe_exec_sip.c
> +++ b/tests/intel/xe_exec_sip.c
> @@ -126,7 +126,6 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
>  /**
>   * SUBTEST: sanity
>   * Description: check basic shader with write operation
> - * Run type: BAT
>   *

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>   */
>  static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
> -- 
> 2.34.1
> 
