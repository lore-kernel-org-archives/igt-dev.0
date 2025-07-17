Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB93C83F1B
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 08:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B34C10E13F;
	Thu, 17 Jul 2025 08:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G60U99bD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0BD10E13F
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 08:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752742048; x=1784278048;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SxtR6Mn6SypH79CPA1khf629YkQkdIZzNrxUzQKZSc4=;
 b=G60U99bDB3Ys7QXHTIOUPY0duxkXDwiSZn4nPu6o40/cLCdNr8f94H/X
 1XJkgDF7FiqOOz9wFOEoJVYvqLeo2bTQkrXQe7f4LCJ5W7ciyj9rkOMnn
 BhgZRllfd49yLFMdmJ5IJGHPnDOLjgzQN1nmyORRIOC1eFDrO0XS3Y+PQ
 2J5yYrD0rThdQ1VfZlgnztZVhLi7Uzm8eho6tTkGAgZoHPa15vgGEkQdX
 w706+IFQTuwVAURLxvK2F3BgmaOJOKnfyIq12llFzEAFEWoJQ0t28pSik
 MldoK0mF92X9+4eJmHlpdAmOaYeJtJlVg2fskc+5HkGCtOPgEq/IGsIvy A==;
X-CSE-ConnectionGUID: GZTwdJ7cRJSH86Iic6EyVw==
X-CSE-MsgGUID: a9uneM7sQF6KEFtC1M2vdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54979975"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="54979975"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 01:47:27 -0700
X-CSE-ConnectionGUID: kPBk0Om2RzO/zyhXNNZmQQ==
X-CSE-MsgGUID: wBEYo7tlQOynuiA637mo1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="181434265"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 01:47:26 -0700
Message-ID: <6c614255-faa5-4db1-a3b4-e073d24678b8@linux.intel.com>
Date: Thu, 17 Jul 2025 10:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_debugfs: Add a commit after
 igt_fit_modes_in_bw
To: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, kamil.konieczny@intel.com
References: <20250717032031.1065575-1-karthik.b.s@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250717032031.1065575-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 7/17/2025 5:20 AM, Karthik B S wrote:
> A commit is required after igt_fit_modes_in_bw as this function only
> does a try commit.
> 
> Fixes: ebe65a923a2b ("tests: Add kms_debugfs")
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

> ---
>  tests/kms_debugfs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
> index f8a3360e6..75ef15353 100644
> --- a/tests/kms_debugfs.c
> +++ b/tests/kms_debugfs.c
> @@ -66,6 +66,8 @@ static void igt_display_all_on(igt_display_t *display)
>  
>  	/* Skip if bandwidth is insufficient for all simultaneous displays */
>  	igt_require(igt_fit_modes_in_bw(display));
> +
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>  }
>  
>  /**

