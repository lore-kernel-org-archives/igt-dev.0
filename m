Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CF6D767FA
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 19:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BDF10E910;
	Thu, 31 Oct 2024 19:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HaHhxAiZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7827110E910
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 19:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730401349; x=1761937349;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IXqr0GPsKIqvpgI6uj2b0ifd/Kh0aaNEzbQbOVcwYwY=;
 b=HaHhxAiZuy2Z5om78j6vzFnJ8PglWYY+UxQ3d3ge4vlBuqVbPCPZaKCu
 28F45Rmh++o9fzqR9b9yH3nbFg6IZDo0bJ3/99UhvPNMc1e6HibVA8QzD
 OWqgDKLJ7ZZa1rW/o96QpDM63FFQGnPP3gMqURSLC/d7Yw5hx1Fzj2ccp
 ctp50Uj8QbDSXQ5FdL6nP+Gg5tXptyVnLkuBaQ30j+O1MAiwR4lA4TS4D
 gbB9/+DX3DGg6Vk1IVBulHZJQOzYdA1Y2l2c4Yb0bhC+HR+0O/G1BwqQk
 r7aOL9WlvKpLd3IfuVuz9QrpFtaimExtPkbZhooPTLMX4rWmWghl5L0Tg w==;
X-CSE-ConnectionGUID: Kuu572zKRc6qeE5aiJIMXg==
X-CSE-MsgGUID: RMw69XhGQauDUE1jNm8qpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29932071"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29932071"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 12:02:28 -0700
X-CSE-ConnectionGUID: nltpfaGDSzSIcokGDXbAgA==
X-CSE-MsgGUID: hfx1g4+9TIGftR3PYwyCWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82822448"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 12:01:38 -0700
Date: Thu, 31 Oct 2024 20:01:35 +0100
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
Subject: Re: [PATCH i-g-t v2 5/5] lib/monitor_edids: Add new EDID for HDMI 4k
Message-ID: <20241031190135.of4caoh7kfxmvhro@kamilkon-desk.igk.intel.com>
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
 <20241022-b4-cv3-02-monitor-edids-v2-5-7634786c21e6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022-b4-cv3-02-monitor-edids-v2-5-7634786c21e6@bootlin.com>
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
On 2024-10-22 at 14:53:14 +0200, Louis Chauvet wrote:
> Add EDID for the HDMI screen LG HDR 4K.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/monitor_edids/hdmi_edids.h | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
> index 8bcd1f31b458..cc6820d96231 100644
> --- a/lib/monitor_edids/hdmi_edids.h
> +++ b/lib/monitor_edids/hdmi_edids.h
> @@ -49,7 +49,23 @@ monitor_edid HDMI_EDIDS_4K[] = {
>  		  "5E00A0A0A0295030203500C48F210000"
>  		  "1EEF5100A0F070198030203500C48F21"
>  		  "00001E000000000000000000000000A8" },
> -
> +	{ .name = "4K_GSM_LG_HDR_4K_HDMI",
> +	  .edid = "00ffffffffffff001e6d4f77c75f1500"
> +		  "0521010380462878ea7ba1ae4f44a926"
> +		  "0c5054210800d1c06140454001010101"
> +		  "010101010101a0cb0046f0703e802010"
> +		  "3500b9882100001a000000fd00283c1e"
> +		  "873c000a202020202020000000fc004c"
> +		  "472048445220344b0a202020000000ff"
> +		  "003330354d414e4a43335a37350a01e4"
> +		  "0203427223090707830100004d010304"
> +		  "10121f202261605f5e5d6d030c001000"
> +		  "b83c20006001020367d85dc401788003"
> +		  "e30f0003e2006ae305c000e606050159"
> +		  "5952a36600a0f0701f8030203500b988"
> +		  "2100001a565e00a0a0a0295030203500"
> +		  "b9882100001a023a801871382d40582c"
> +		  "4500b9882100001a00000000000000af" },
>  };
>  
>  monitor_edid HDMI_EDIDS_NON_4K[] = {
> 
> -- 
> 2.46.2
> 
