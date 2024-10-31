Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE18ED767FA
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 19:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A24C10E910;
	Thu, 31 Oct 2024 19:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDwvU/t4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2472C10E910
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 19:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730401236; x=1761937236;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4jdiQwdlWnBDZ6jAtPgLG6nXewqyauriKGzNlvPhh6Y=;
 b=mDwvU/t4Kh9Gk//evbUc6Ew5ypoy/xiCu9ga7zZJl/78M6C5NlDJHgKT
 KiehEJEJTK0289Hl2KX8Dh2mwi56M/C4sXBmE7a9goDWokvQJwzWdWlNT
 58UtT7oNvHTvYTfzfS28khlUFeb/cTEi7aKaV13ax5jKQe97ERfD/KDO+
 GVNQlLoBUiXIkZyXrp7+k4rHmMDzsWSJN/6Q4+uka3PW//KSbTsNtxVKU
 lz/T5xcMyuwE3uMKiZz9+1HPCcjaRD31E/YWNiHoP5gWTHXVnHONtDRFK
 m+Z08J950KN7uRHfAfdizNGqQHyRFfNVJq2kXYFp69a8ru8tfNAq98Ftx g==;
X-CSE-ConnectionGUID: MLH68YewRMSgZ+inh3YylA==
X-CSE-MsgGUID: v3shobF1TU6Yw3DlsjoZsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="40783471"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="40783471"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 12:00:35 -0700
X-CSE-ConnectionGUID: LyczxJ2fR+O52WY9nnZC8A==
X-CSE-MsgGUID: rwWddlNYTwOsXol6N0JpMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87265461"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 12:00:33 -0700
Date: Thu, 31 Oct 2024 20:00:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v2 4/5] lib/monitor_edids: Fix missing names in
 some monitor EDID
Message-ID: <20241031190030.h3wcmwuau7tpvpws@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
References: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
 <20241022-b4-cv3-02-monitor-edids-v2-4-7634786c21e6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022-b4-cv3-02-monitor-edids-v2-4-7634786c21e6@bootlin.com>
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

Hi Louis,
On 2024-10-22 at 14:53:13 +0200, Louis Chauvet wrote:
> Some HDMI EDID did not have a good name identifier. Add one to avoid
> confusion.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/monitor_edids/hdmi_edids.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
> index 573e2149d5d3..8bcd1f31b458 100644
> --- a/lib/monitor_edids/hdmi_edids.h
> +++ b/lib/monitor_edids/hdmi_edids.h
> @@ -241,7 +241,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
>  		  "33333633493056465320000000fc0044"
>  		  "454c4c20323430354650570a000000fd"
>  		  "00384c1e5111000a20202020202000e9" },
> -	{ .name = "`",
> +	{ .name = "DEL_DELL_2407WFP_HDMI",
>  	  .edid = "00ffffffffffff0010ac17a053575930"
>  		  "0511010380342178eeee91a3544c9926"
>  		  "0f5054a54b008180a940714fb3000101"
> @@ -438,7 +438,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
>  		  "60350000003200001c011d8018711c16"
>  		  "20582c2500c48e2100009e0000000000"
>  		  "0000000000000000000000000000000a" },
> -	{ .name = "",
> +	{ .name = "GSM_50294_M3704C_HDMI",
>  	  .edid = "00ffffffffffff001e6d76c401010101"
>  		  "2514010380522e78eaac27a355499b25"
>  		  "10474aa1080081807140614045403140"
> @@ -490,7 +490,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
>  		  "5011000a202020202020000000fc0048"
>  		  "50205a5232343430770a2020000000ff"
>  		  "00434e34333132303836580a2020007f" },
> -	{ .name = "",
> +	{ .name = "HWP_10582_HP_ZR2440w_HDMI",
>  	  .edid = "00ffffffffffff0022f0562901010101"
>  		  "0b170103803420782afc81a4554d9d25"
>  		  "125054210800d1c081c0814081809500"
> 
> -- 
> 2.46.2
> 
