Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84FBFF8868
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 12:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFE610EB30;
	Tue, 28 Apr 2026 12:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xymefc61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26E210EB30
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 12:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777380691; x=1808916691;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=penD4nm/3F2ZezTZFc/gaLppBRLIT0TwLuBoBeBr8mU=;
 b=Xymefc61lkxCFjJ6jwV9IgQbCe9KDtPRsiXqCnS5hHQQUEkTLTJWn4vE
 DdQxK4pwSEAfegfg0vNnMQ1vzTWAIXoCPX4fka+dXWUMQFnOz5pkmAhbE
 fkEEbHK/f9NyNFMmN7aXXVXhDQvThvKxBo0CGHfYprzrizJL8wjLFdoyu
 9kXVU/gLPkeaKo3+AX/wcQ3eYlZPCFZlvTl1E7lCL2+iHwE8RtSCMBTKz
 +zm0N3cPaATMd/N7PNgRFQUTlCypXnLvyI9feYEpK4awSZOi2haSY9bab
 x/9z6sKUxGJqq8NGPwEA57PywLXQGhIFQtQl6MtekMH94Nn6TGwCt5u04 g==;
X-CSE-ConnectionGUID: ZuwiKcBrQw+H4JzzABPXhQ==
X-CSE-MsgGUID: 0tC/zBC0QxerUnA1HUah6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="95701453"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95701453"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 05:51:30 -0700
X-CSE-ConnectionGUID: YV1KV26gQX+UUeKZJOEgqQ==
X-CSE-MsgGUID: JHO4Vhr5Q8GFTlAeizZaRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="235704932"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 05:51:28 -0700
Date: Tue, 28 Apr 2026 14:51:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests\intel\xe_configfs: Fix ctx_restore BB path for
 post and mid variants
Message-ID: <20260428125126.erq2qxcfrfv5x6db@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260428105109.1146213-1-smitha.balasubramanyam@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428105109.1146213-1-smitha.balasubramanyam@intel.com>
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
On 2026-04-28 at 16:21:09 +0530, Smitha Balasubramanyam wrote:

one nit in subject, please use '/' as path separator, not '\',

so instead of:
[PATCH] tests\intel\xe_configfs: Fix ctx_restore BB path

it should be
[PATCH] tests/intel/xe_configfs: Fix ctx_restore BB path

Please send with correct subject, with that fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> Fixed the hardcoded "ctx_restore_post_bb" write with the computed
> file name ("ctx_restore_%s_bb") in test_ctx_restore_invalid so the
> invalid-case tests work for both "post" and "mid" variants.
> 
> Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
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
