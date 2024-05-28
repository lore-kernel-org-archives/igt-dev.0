Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC10EC25B78
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 15:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCBC11234D;
	Tue, 28 May 2024 15:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMhlmo5o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2544B11234D
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 15:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716910035; x=1748446035;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XEQ6yllEMFdNn0LCtulcJxuei91Gna39P6Ldfgkad3o=;
 b=lMhlmo5o1MKHMUI0lIjBqLCBEDzYxYfw9eO135uz6v3L4n8/6+DbjO6a
 qFvhIPMq5UufEXsOcDW3Dbt+OaOoMGQ+4i8XFRI1XexZd1zKKy5WMRzcv
 pVL0pfEajiZ1zPVOSfJckJwzB0D25IUxayAXIv5IFn628A43O43lpRKP5
 vXBCWMvTi2GAH3/6jhzhfNcQRPytcvzvpB+288b468cOqAMgLflg2l+nO
 8UqH8cmzIkFe+eNFKs3gCgdXjhGqaeBnQXzSUYLQuRWBtTLtUFznNDZQu
 tR0216LqcVXpg549iP5nxdkoeTek3Ef5Q5tTtTFDyQVhnEoVjLfZQmNb4 g==;
X-CSE-ConnectionGUID: nzOAaYVFRXWHuznVMuS4vg==
X-CSE-MsgGUID: ZJEE8mvfS0uulQnkQhT6QA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17096256"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="17096256"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 08:26:57 -0700
X-CSE-ConnectionGUID: IpUfM0ztQWuRuchYl/r1bw==
X-CSE-MsgGUID: rNUaWJ1ZQUyIKFL4iEHt0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="35182145"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 08:26:56 -0700
Date: Tue, 28 May 2024 17:26:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t 1/5] tests/fbdev: Fix fd closure
Message-ID: <20240528152628.cz2kjnrul3ykcvwi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
 <20240528054223.2945356-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240528054223.2945356-2-bhanuprakash.modem@intel.com>
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

Hi Bhanuprakash,
On 2024-05-28 at 11:12:19 +0530, Bhanuprakash Modem wrote:
> As the file descriptor in this test is not a drm device,
> don't use drm_close_driver() to close the fd, instead
> use close().
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Please add me also to Cc in cover letter, I could overlook
your patchseries otherwise.

> ---
>  tests/fbdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index 154e78b0f..794882a6a 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -443,6 +443,6 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		drm_close_driver(fd);
> +		close(fd);

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  	}
>  }
> -- 
> 2.43.2
> 
