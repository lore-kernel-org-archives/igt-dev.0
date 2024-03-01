Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8753C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 12:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9258110EBA6;
	Fri,  1 Mar 2024 12:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkwUuSf1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6F810EBA6
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 12:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709296430; x=1740832430;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oY1ciXXDXc7suR+VciVWycSlA2qt51j+nu7SF0WXRW8=;
 b=lkwUuSf198RCeq1F79PwcfFFJTOVF41l37AKB5D2wS/cHqoenr5CECy5
 XuYfRlY43dCfU1+Rnu8NngqmthDsn9yl1NXLrUIKRrUEiwKLtlwpkCgpq
 qVLVudVOo1trAQqWQvdwBg2gPcgEFMe4w60zQ/oDJmIpM5G1Yk4sxaBE9
 kYr4wV62PPLqlJhF4kwAubsb/grnebbQl68ddta92KhWT16wjcXsgUzin
 GHrcXD4HhOdvZYf05TdKSqfAZvsfem52PDdjP/nJmbxvRJOpLRta6A2TF
 aWRQZxBzz4d4aBNVT78gjwnpRhddt0FzN5IWQYp3qYtNqzARFspjoYDwi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14401867"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="14401867"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 04:33:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8609759"
Received: from nelron-mobl.ger.corp.intel.com (HELO localhost) ([10.245.96.29])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 04:33:49 -0800
Date: Fri, 1 Mar 2024 13:33:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/igt_fb: on Xe device don't apply legacy
 blitter rules
Message-ID: <20240301123345.4x2i4j25q4qxjoiq@zkempczy-mobl2>
References: <20240228143904.859714-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240228143904.859714-1-juhapekka.heikkila@gmail.com>
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

On Wed, Feb 28, 2024 at 04:39:04PM +0200, Juha-Pekka Heikkila wrote:
> On Xe device legacy blitter size rules don't need to be applied
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 65e0638c2..0ac2a76b0 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2513,6 +2513,9 @@ static bool blitter_ok(const struct igt_fb *fb)
>  	     is_gen12_mc_ccs_modifier(fb->modifier))
>  		return false;
>  
> +	if (is_xe_device(fb->fd))
> +		return true;
> +

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	for (int i = 0; i < fb->num_planes; i++) {
>  		int width = fb->plane_width[i];
>  
> -- 
> 2.25.1
> 
