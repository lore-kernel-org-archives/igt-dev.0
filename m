Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47616C8303C
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 11:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AB510E6F0;
	Wed,  2 Jul 2025 11:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ex1GWwlD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D3310E6F0
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 11:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751455994; x=1782991994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YzKUPDcUIl6P0AUVo7NugU3ebgeGgrDCyONCPh7ksss=;
 b=ex1GWwlDISe3NHquIIObr2QBUBx8U4JrqLRMUdf6keH6M3QaCIt7zZod
 4VRm7v/eFb49aRV4/D5hlp06Bnau8LFQhyLETcCE+DcoE+3DjH5Qv6wQT
 kw5mswTntZbaATPSsuZyZwn3J0YDmWkGkLC2Oow0fsvl3Y2aT/XC8SLXo
 gFdnjBkL1buCdvFVor0REfSMVlq/5i+EXvOO9KDCOO+oU6veROFOM1kM/
 5u6HGxZj4olXnb5OxFTnEqCc3ClmhI9Rz0NJuZmQZR2O+HkRukfKU0BP+
 iSI2dYs8FUatXdS8/p6KE1VLqgGcd4s8vPDLZTc7pWG26qycotpIWZOb3 A==;
X-CSE-ConnectionGUID: VNKXIIKSTUSduHBDauoQwg==
X-CSE-MsgGUID: dfm3HLosQ6WnJcIz4m7aRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64344269"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64344269"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:33:14 -0700
X-CSE-ConnectionGUID: Ydu8xpotSr2/hJaI6DDbjQ==
X-CSE-MsgGUID: kmxG02V5SPiFDgjnVxeakw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158430451"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:33:13 -0700
Date: Wed, 2 Jul 2025 13:33:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 5/7] tests/intel/xe_query: Look up GT reference
 clock correctly
Message-ID: <aiflrennm7dako675g5bh3z6y5b47ldppsnhe35qa6r7esuhtn@gl6ochhaws4x>
References: <20250630163529.2096664-9-matthew.d.roper@intel.com>
 <20250630163529.2096664-14-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630163529.2096664-14-matthew.d.roper@intel.com>
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

On Mon, Jun 30, 2025 at 09:35:35AM -0700, Matt Roper wrote:
> The open-coded GT loop should be replaced by a direct GT ID lookup to
> obtain the reference clock in order to ensure this continues to work on
> future platforms where GT ID != index in the GT query list.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  tests/intel/xe_query.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 9c7bf1d6f..96352da2c 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -675,18 +675,13 @@ query_engine_cycles(int fd, struct drm_xe_query_engine_cycles *resp)
>  static uint32_t
>  __engine_reference_clock(int fd, int gt_id)
>  {
> -	uint32_t reference_clock = 0;
>  	struct xe_device *xe_dev = xe_device_get(fd);
> +	const struct drm_xe_gt *gt = drm_xe_get_gt(xe_dev, gt_id);
>  
> -	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
> -		if (gt == gt_id) {
> -			reference_clock = xe_dev->gt_list->gt_list[gt].reference_clock;
> -			break;
> -		}
> -	}
> -	igt_assert(reference_clock);
> +	igt_assert(gt);
> +	igt_assert(gt->reference_clock);
>  
> -	return reference_clock;
> +	return gt->reference_clock;
>  }
>  
>  static void
> -- 
> 2.49.0
>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
