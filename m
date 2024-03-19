Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18704C54E60
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 13:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9036D10FAB7;
	Tue, 19 Mar 2024 13:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MvTHisus";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67FB10FAB7
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 13:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710854763; x=1742390763;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WJGTz+f6KAcIzo8gLhNdYJ3+cZrgNPZA6TX0V9IuJS0=;
 b=MvTHisustMu++rQXRoKIdR/viHJnSuuN3DGfagL3zJlwvkPmZCsJ0OAq
 AFAtFcDGz/iSmns08hZK6VA0Mpjg9S7dC4P/8WWR0vpRezpbn0dh9LzjK
 OeeWD6Ts/9opsSr6/negT5LNysybcRruxkHuU7u9ggPnd7TX27hwg5U09
 KgBvhSXDNQ3RnULbQEdSQGQZJ1eW/CAtoD5abotUMtgT8kLkFgKRT5QAy
 0KGsji21pMSqeZ23vPnlovfB3siYWD269meNRa/VzIz0pP1D5Ed1NYUYv
 MkIioh8Bc35L2c8Fxpe3UocwRBx1SqTSfg45TGLXd5Rh1y2dasDAHGx26 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5578139"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5578139"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 06:26:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="14198736"
Received: from unknown (HELO localhost) ([10.245.246.227])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 06:26:01 -0700
Date: Tue, 19 Mar 2024 14:25:57 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: igt-dev@lists.freedesktop.org, bhanuprakash.modem@intel.com
Subject: Re: [PATCH i-g-t 3/3] tests/kms_frontbuffer_tracking: Align to new
 igt_draw_rect usage
Message-ID: <20240319132557.moiklckaqlmkktci@zkempczy-mobl2>
References: <20240315061142.6591-1-vandita.kulkarni@intel.com>
 <20240315061142.6591-4-vandita.kulkarni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315061142.6591-4-vandita.kulkarni@intel.com>
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

On Fri, Mar 15, 2024 at 11:41:42AM +0530, Vandita Kulkarni wrote:
> Pass NULL as we dont have any mmaped buffers
> 
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index db2db0ff1..392539408 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2254,7 +2254,7 @@ static void *busy_thread_func(void *data)
>  {
>  	while (!busy_thread.stop)
>  		igt_draw_rect(drm.fd, drm.bops, 0, busy_thread.handle,
> -			      busy_thread.size, busy_thread.stride,
> +			      busy_thread.size, busy_thread.stride, NULL,
>  			      busy_thread.width, busy_thread.height,
>  			      busy_thread.tiling, IGT_DRAW_BLT, 0, 0,
>  			      busy_thread.width, busy_thread.height,
> -- 
> 2.34.1
> 

Likely requires squeezing where you introduce this field to the
igt_draw_rect(). Anyway code is correct.

--
Zbigniew
