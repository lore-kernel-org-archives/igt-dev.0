Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C32C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 10:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C29610E3C1;
	Mon, 31 Mar 2025 10:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Izspt6fx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2350810E3C1
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 10:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743415397; x=1774951397;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oZ4UTLTYWxHSO3bkJ0EsGGrrg0td1NtTexuhgxLkdXs=;
 b=Izspt6fx3hg/ZL6CupxITljQXTSgwcmTV4ZZXQg/Jf5GoKtsxnyZa4I7
 06qmvH4lKyEbjwHKpnK8Zntkqs1+Bx1XsRqVk1emDs5XBv8gQJKw+vCMQ
 PqFX5V4SnM+HI91KvF9xNA46Fr8TqnNto7PW+8N4DX7hDlk8fXsYIJ+qI
 C03W1ENfZapGLtlDmnu43qfzq0wfO32dMwfbmRUt/lMn337wgBV8DFE5J
 Ykept8xfThnP18MHb3ErISr2Xcfk7133+oP+2rqQxjB1SqRgc5BRPhDGv
 a6yF4GbE3WLWohFaZfpYkFL2vJe1XcGb+BKRnbf2hlgJP6rThBHzLaF9p w==;
X-CSE-ConnectionGUID: 0wq68wdFTA2RR6XsAYUpww==
X-CSE-MsgGUID: JCMKcDb+QK+c0rtHLDUhXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44606318"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44606318"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:03:17 -0700
X-CSE-ConnectionGUID: 4MAE1Tw8TBSR2z9ZOyMlwQ==
X-CSE-MsgGUID: ZVbWNN9lSliCLEUCgJiYXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="126038743"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:03:16 -0700
Date: Mon, 31 Mar 2025 12:03:12 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 1/2] CONTRIBUTING: Add subscription and
 patchwork info
Message-ID: <20250331100312.irwkwtiy5wggiehq@zkempczy-mobl2>
References: <20250327153139.37746-1-kamil.konieczny@linux.intel.com>
 <20250327153139.37746-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250327153139.37746-2-kamil.konieczny@linux.intel.com>
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

On Thu, Mar 27, 2025 at 04:31:29PM +0100, Kamil Konieczny wrote:
> Add guide and link to subscription into mailing list and link
> for patchwork.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  CONTRIBUTING.md | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index 81057a2ad..b571b5e68 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -63,6 +63,13 @@ Sending Patches
>  
>    on its first invocation.
>  
> +- If you plan contribute regularly please subscribe to igt-dev mailinglist:
> +  https://lists.freedesktop.org/mailman/listinfo/igt-dev
> +  When you are not subscribed, please note that your contribution will take
> +  more time to reach to mailing list. You could find out if it was delivered or
> +  what is a testing status of your patches at patchwork page:
> +  https://patchwork.freedesktop.org/project/igt/series/
> +
>  - Place relevant prefix in subject, for example when your change is in one
>    testfile, use its name without '.c' nor '.h' suffix, like:
>    tests/simple_test: short description
> -- 
> 2.49.0
> 
