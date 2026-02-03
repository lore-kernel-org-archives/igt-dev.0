Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA953E87850
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 17:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9637C10E2AC;
	Tue,  3 Feb 2026 17:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0HU4KcL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B39610E2AC
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 17:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770140537; x=1801676537;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dCZNDhN3PjaEIi1Ymxa5ubJTIyx4mc8LSjsP3SR4wnk=;
 b=K0HU4KcLLNEbziixi+jqUqHGQpjDIdr9gs5svVxH0HeYZkar9XuytpCc
 qFnSDj8peXivrcTTAjBzGf9PQitj7JDm7S2cy2OLALBR5oOUf5RvXX8kG
 IC1QgasEw9Z/VEzLXQ1/qgqaLGarv7j/r+u5HaZgrN0BDi6/fUiRI40jY
 WIm8Yn8TYWxLIvgO5XVCkZU0p/bswLCZfq2umZ9CBBQqvKjTiXyB34KVV
 Zr3OCZsFtIYxlN4TWIefAcZErvETVZIa6hptimcoa49gb4YlnbTczoegx
 S6nOk0bQXXa0ze3N7YXrKtD9ZsAHQ2yscSYBTUK/Fh+HC/bufzXw5nGE/ w==;
X-CSE-ConnectionGUID: ABYMDtlcQSeeYBTzPK1fPg==
X-CSE-MsgGUID: TKHRVTN4QzifJ6nKY/zNfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="73917606"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="73917606"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 09:42:16 -0800
X-CSE-ConnectionGUID: ZQDqlsPGSa+BrfpM+ZzzCA==
X-CSE-MsgGUID: 6quNn2+yQVK/tvMl5ax+TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="209600823"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 09:42:14 -0800
Date: Tue, 3 Feb 2026 18:41:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH v2] lib/xe_gt: Handle non-C6 states with debug message
Message-ID: <20260203174159.f2rq32x2vasfpb3u@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sk Anirban <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com
References: <20260202114640.3366549-2-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260202114640.3366549-2-sk.anirban@intel.com>
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

Hi Sk,
On 2026-02-02 at 17:16:41 +0530, Sk Anirban wrote:
> When GT C-state is not "gt-c6", return false with a debug message
> showing the actual C-state value instead of silently failing the
> "gt-c6" comparison.
> 
> v2: Refactor code changes (Kamil)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

I would change a little subject, like: print debug message for non-C6 states

This could be done at merge, no need for resend.

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/xe/xe_gt.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index ed19bec74..8f54b6e25 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -220,7 +220,12 @@ bool xe_gt_is_in_c6(int fd, int gt)
>  	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_state) == 1);
>  	close(gt_fd);
>  
> -	return strcmp(gt_c_state, "gt-c6") == 0;
> +	if (!strcmp(gt_c_state, "gt-c6"))
> +		return true;
> +
> +	igt_debug("GT%d C-state is %s\n", gt, gt_c_state);
> +
> +	return false;
>  }
>  
>  /**
> -- 
> 2.43.0
> 
