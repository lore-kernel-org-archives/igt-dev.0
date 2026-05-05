Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB8FFF885A
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 13:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F137910E43A;
	Tue,  5 May 2026 13:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YuxysG+4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD1110EAEF
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 13:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777987105; x=1809523105;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QOAOpIjgxwJFGxNhgT/G+iLOxEncJZAHVJ/xOnTia4c=;
 b=YuxysG+4sZV/krVaO1f5iY+QURCqDjk0icMUJ0ulnRzRBeqURUBxXECG
 ZPvBuyAplMY2x10QWiTnwP9WiBA1WOXY92powIm7kUiFAj2zv1PJIQcF3
 uoIWYAJLPXrtTdUft1MPrCQ6Gc1QeX2Frm/7lFGrpkPgLXt5KSLk0sc8d
 CfRf3WFT0o6XaMCohCJFl0ZsOblvpMhX8XdQaH3Un5OqOxwdWK3gT7zhk
 DleGy7N0vUnyPrHJGm95efxHP9/fKUfw8Ujm4ZAmQoVrZdrakyev5YRYJ
 whQnZT7XZ5a2PcaEcqDioFpt0CCEJaAKbg1aPHpo/S3oZOgbwHBN7wvul w==;
X-CSE-ConnectionGUID: QyIs0JztR9GsuZ3eDVIeIw==
X-CSE-MsgGUID: czkxK/8ZRIOm1et06xwCtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90313450"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="90313450"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 06:18:25 -0700
X-CSE-ConnectionGUID: PPiTy5s6ShyFk/4A+4iyvw==
X-CSE-MsgGUID: MGuPc5jJR1+w6FB0IUAg7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="231443373"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 06:18:24 -0700
Date: Tue, 5 May 2026 15:18:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2] tests/intel/xe_configfs: Fix ctx_restore BB path for
 post and mid variants
Message-ID: <20260505131821.6dyha2bqopdref3b@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260428105109.1146213-1-smitha.balasubramanyam@intel.com>
 <20260430061745.1157778-1-smitha.balasubramanyam@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430061745.1157778-1-smitha.balasubramanyam@intel.com>
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

Hi Smitha,
On 2026-04-30 at 11:47:45 +0530, Smitha Balasubramanyam wrote:
> Fixed the hardcoded "ctx_restore_post_bb" write with the computed
> file name ("ctx_restore_%s_bb") in test_ctx_restore_invalid so the
> invalid-case tests work for both "post" and "mid" variants.
> 
> Changes since v1:
> - Fix commit message wording
> 

You could add here Fixes: tag.

> Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_configfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index f024235f2..39762e030 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -234,7 +234,7 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
>  	char file[64] = { };
>  
>  	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
> -	igt_sysfs_set(configfs_device_fd, "ctx_restore_post_bb", "");
> +	igt_sysfs_set(configfs_device_fd, file, "");
>  
>  	/*
>  	 * These only test if command parsing is correct,
> -- 
> 2.43.0
> 
