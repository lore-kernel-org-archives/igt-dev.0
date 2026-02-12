Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49428EE368C
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 14:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C763310E774;
	Thu, 12 Feb 2026 14:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYU0LtkW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FE110E76A
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 14:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770907708; x=1802443708;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VlL/Ww6mQVKmBb/w1Y6BgUUpy2cSUKh0XI3hH1+vSrA=;
 b=KYU0LtkW9F7dXhrS6UPPE1ccZl0CRy0EeY6FEl0zslilIRzgo426Up4+
 zfiSa7otaxmqa+F6DQN+wWZ7yubouqVFM4nior+fNPzCySMTC1i253MfT
 RCdhUO3TmBu5wn2aPA8GC+aeIDiXU9zRFIarPZiWX5fW1gW3eXJ0RRJzt
 lhIsIsqUjve+qRSf///vMKIWvsenAi6z8f+oa3UkmgXOskLxPDnu0lHQw
 V+oUuRtl0XphkmvRE6BlwQsralQ2ARaWXNzxmL6YDLfAdSvLP89DWG4JO
 VArHIqQNIebsVLnTu4xQj8EoaRFMyWg/9c2CGb0mSspyYLQDiGhjmtWUX A==;
X-CSE-ConnectionGUID: lorhN1r/RNePeeBvyKHypQ==
X-CSE-MsgGUID: MIBfN7M1SfGp4eFJ1rUf+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="74678287"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="74678287"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 06:48:27 -0800
X-CSE-ConnectionGUID: PzOt6EyiR82dzfbsA1rKRQ==
X-CSE-MsgGUID: 9XPfID+1TnCjpLbrJrnSMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="243210538"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 06:48:26 -0800
Date: Thu, 12 Feb 2026 15:48:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/kms_color: Skip the test early if no outputs
 found
Message-ID: <20260212144810.idk5ugayxz44oqt3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
References: <20260212031816.896622-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260212031816.896622-1-karthik.b.s@intel.com>
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

Hi Karthik,
On 2026-02-12 at 08:48:16 +0530, Karthik B S wrote:
> Add igt_display_require_output call in the initial test fixture to avoid
> skipping the subtest down the line if output is not found.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_color.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index a50793651..aea7e008f 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -1168,6 +1168,7 @@ int igt_main()
>  		kmstest_set_vt_graphics_mode();
>  
>  		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  	}
>  
>  	igt_subtest_group()
> -- 
> 2.43.0
> 
