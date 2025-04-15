Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60993C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 10:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1652010E70A;
	Tue, 15 Apr 2025 10:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOk1kG2z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A8910E70A
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 10:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744714272; x=1776250272;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AMWwjOzaccZZVzxf7+Ga38hg0JGfSWAOVeCcDiIYdEM=;
 b=JOk1kG2zxINyZIs3IOt+oB7O/tsRA1qo6RBOWHJMXw45UPsMxGugcEo+
 ynnjjMVy/AGbkao3XpuhU72omcz6R0LqktcwXn0JpCMsrxX8bMuCc1XH3
 urndnrpN8H4p1fvxzfZPrH7bL1xKCt5yv5XheTVfi+QzJo6296yYJjkZq
 yQFHfJ5RVZA1ZOFacRc9DZzEiGZAVrcpE9OtcW0VOf+ssMjGU7jUUL98V
 ZDSIf8OSUVnAQhZFXdUVV1rUzP1iqEtM6sjdM9c0wypFXpScFPtDDwniX
 xC0jE6d+AQoT0o3D4+SzsAkUknl7EuSfYBhW46DHJvNCwvUn79FsoON1y A==;
X-CSE-ConnectionGUID: 0vZMMHJKSEOMJdxaoM5UfA==
X-CSE-MsgGUID: ZGH23oc0Tmacbg7edATHTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="63619240"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="63619240"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:51:12 -0700
X-CSE-ConnectionGUID: 5m2RYR3xSq2BN73qN7lVZQ==
X-CSE-MsgGUID: 7mfoqrdeQbuO/1kiDE9gEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="134877839"
Received: from wisniew1-mobl1.ger.corp.intel.com (HELO [10.217.180.232])
 ([10.217.180.232])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:51:10 -0700
Message-ID: <41058da8-1b2c-4ccd-9a0b-0dc1b3d5682c@intel.com>
Date: Tue, 15 Apr 2025 12:50:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/1] lib/xe/xe_eudebug: skip when disabling
 eudebug with no eudebug support
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250415092217.11835-1-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250415092217.11835-1-jan.sokolowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Jan,

On 15.04.2025 11:22, Jan Sokolowski wrote:
> Tests using eudebug are not compatible with VF functionality.
> In such scenarios attempting to toggle eudebug support fails,
> which causes the test to fail, but we should instead
> skip it.
> 
> Skip a test that tries to use eudebug toggle if it doesn't
> exist.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Regards,
Christoph

> ---
>   lib/xe/xe_eudebug.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index ec946058b..667c31c6e 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1794,10 +1794,7 @@ bool xe_eudebug_enable(int fd, bool enable)
>   	bool old = false;
>   	int ret = __xe_eudebug_enable_getset(fd, &old, &enable);
>   
> -	if (ret) {
> -		igt_skip_on(enable);
> -		old = false;
> -	}
> +	igt_skip_on(ret);
>   
>   	return old;
>   }

