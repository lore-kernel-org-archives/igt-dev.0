Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABB0CD1284
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 09:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F93310F666;
	Tue,  2 Apr 2024 09:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHbElLPE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D33110F666
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 09:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712051652; x=1743587652;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3yF0bTOZ/uyqAgs1QWi1zgn3VSLlS3iJl4TD6vKTRWo=;
 b=WHbElLPEmnvohFk7J/FwUxLaeAQvDGP22muqs6SOcuT4xnVGUg1dfEU0
 WA58853o+yXyGP6AR88v9dbfFXeetIoWQVr3SpP3CfY21dctZaOCIK1H9
 A9d3W4Jzd9L2xXw3jNZejso0Uuw5nJ0niYu9J6SYAzbOs2I1LqxqaIjct
 Rqi9cmMneJ+fOsWWhFA6ePHfxkh2kv+RsMZtGyiN4Kn7XZJlBo+qzx2b4
 Bg87TcyX8LzLWc+/uPdkzMWYM2Xve4MUQzAJGfdbD95gSQ8cH5NdLITLh
 QATRPJX8BEshkJeH+HWj5PZRJxvupIxjfFSqGDBWkurFunxpTCxrijQ4W g==;
X-CSE-ConnectionGUID: THJBWiRmR9yazaLgELayLw==
X-CSE-MsgGUID: HmjW3on2SEK8jULxStQ48w==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="18366439"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18366439"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 02:54:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="17988499"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 02:54:11 -0700
Date: Tue, 2 Apr 2024 11:53:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] lib/xe_spin: Fix doc whitespaces and typo
Message-ID: <20240402095347.22r4l5qiwytz7y7m@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240329211243.924363-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240329211243.924363-1-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-03-29 at 14:12:43 -0700, Lucas De Marchi wrote:
> Fix documentation to follow proper format.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/xe/xe_spin.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index d142f2cac..381e5e950 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -188,12 +188,12 @@ void xe_spin_end(struct xe_spin *spin)
>  
>  /**
>   * xe_spin_create:
> - *@opt: controlling options such as allocator handle, exec_queue, vm etc
> + * @opt: controlling options such as allocator handle, exec_queue, vm etc
>   *
>   * igt_spin_new for xe, xe_spin_create submits a batch using xe_spin_init
>   * which wraps around vm bind and unbinding the object associated to it.
> - * This returs a spinner after submitting a dummy load.
>   *
> + * This returns a spinner after submitting a dummy load.
>   */
>  igt_spin_t *
>  xe_spin_create(int fd, const struct igt_spin_factory *opt)
> @@ -260,7 +260,7 @@ void xe_spin_sync_wait(int fd, struct igt_spin *spin)
>  
>  /*
>   * xe_spin_free:
> - *@spin: spin state from igt_spin_new()
> + * @spin: spin state from igt_spin_new()
>   *
>   * Wrapper to free spinner whhich is triggered by xe_spin_create.
>   * which distroys vm, exec_queue and unbinds the vm which is binded to
> -- 
> 2.43.0
> 
