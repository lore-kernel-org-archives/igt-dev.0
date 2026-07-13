Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30C9C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3D910E346;
	Mon, 13 Jul 2026 09:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0zwDBiE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC42210E346
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 09:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783934048; x=1815470048;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Tj3pBy0oA4Jjphv1xbgdRLxT7kGOB8+DJNQSjE3rzuU=;
 b=T0zwDBiEB5eNnXR6WQJcsOm269M8RmWgB5PB8hU9cA/A52bdUTMw+rQ6
 JQMN9Bo5sLVwoRxLMXrV+NbbZBiG7hNQDCg0pl6C9pNVBQYU7/o9KJf7X
 pip13B+0fCCwT04GqGz9xltJq6DRGXvikYYQ0iUDUDlncgsCwpah8EGPJ
 Q8eSbC0cYPy9oOtRMYNo/uQ/8aNUICugF0PiEWJCVl21WCMvvVWFvpNJT
 UIEzzW/uf9iLlCYr9Wesa1eNmk4dPxcYlQvvC5i3BVBGKKuwQhXergOC6
 fKHXZ02+RifKiRQlXTWWxCEB0pcjUrtGov6cavAeo+LB5o1BBNUV5uCUk Q==;
X-CSE-ConnectionGUID: abX6QHKvSGepYwytW7oLCQ==
X-CSE-MsgGUID: 0kpZLtdHQM+FoNDUGRdtFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83654068"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83654068"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 02:14:08 -0700
X-CSE-ConnectionGUID: UGYr8DNISEOjTmchGFju1Q==
X-CSE-MsgGUID: ztCX2kcNT9G1WLwJuAfaVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="259356524"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 02:14:06 -0700
Date: Mon, 13 Jul 2026 11:14:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_cw_post_sync: Run
 walker-post-sync on all compute engines
Message-ID: <20260713091404.nr6vfkxl4i7j42of@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org
References: <20260713052820.2231844-4-priyanka.dandamudi@intel.com>
 <20260713052820.2231844-6-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713052820.2231844-6-priyanka.dandamudi@intel.com>
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

Hi priyanka.dandamudi,
On 2026-07-13 at 10:58:23 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Remove the break after the first compute engine subtest so that
> walker-post-sync runs dynamically across all available compute engine
> instances, not just the first one found.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

PS. before merge please look into Xe.CI.FULL failures, repaly
to them with cc to CI bug filing team, and also prepare new
intel-ci blocklist for expected skips.

> ---
>  tests/intel/xe_cw_post_sync.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/intel/xe_cw_post_sync.c b/tests/intel/xe_cw_post_sync.c
> index 5e65673115..1aa2f13139 100644
> --- a/tests/intel/xe_cw_post_sync.c
> +++ b/tests/intel/xe_cw_post_sync.c
> @@ -290,7 +290,6 @@ int igt_main()
>  				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
>  					      hwe->engine_instance)
>  					test_walker_notification(fd, hwe);
> -				break;
>  			}
>  		}
>  	}
> -- 
> 2.43.0
> 
