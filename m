Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9184EC2BA15
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 12:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F6310E39C;
	Mon, 17 Jun 2024 12:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZX0j0Wg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9500410E39F
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 12:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718628252; x=1750164252;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w0UIGhOsYpRt3dIiX1+EMUpxQt5SSHml37V0cYzU5n0=;
 b=mZX0j0Wg3O5w+lfXiW8YXEznwS2INIcrRYL+wJxQeMUGW46SZ0WiEfKT
 9aswxfTG1IY2Tf7U+r7gJOguV5PKv0OT0X7nE3H4hEjynqbhv4Yay3xk8
 k6aUdFVWumjIxOEKkdJgAaO3oBhbz8NdPkhQJhQZOtov0+j/mBA2TsneZ
 3ltXyzVZJdMmlVAdMMWn8R9qAEj1PL7kKFVsWP7KvIDvgIB+EUsgeC8K0
 aZIgYqAayG6yJbSlTQn1oSFzxTa/zlfW/Ngx7N2UxTeyvMPmnQyqapFxS
 08GodXpMWREhFti+8C/V4/je6SkqkAnIp85abjSvrvB/Ph6Yy9uvzLGpv g==;
X-CSE-ConnectionGUID: qqOw4FgfR2+pj7ztiV3tiA==
X-CSE-MsgGUID: xLj8mB0bQ4C99vkxpxb7Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="19234767"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="19234767"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 05:44:11 -0700
X-CSE-ConnectionGUID: FIxmXXjKT3GamPxI1elwrg==
X-CSE-MsgGUID: LEkX5vh0TCW2ECfVZQh7dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="46138688"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 05:44:08 -0700
Date: Mon, 17 Jun 2024 14:44:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>
Subject: Re: [PATCH 2/2] lib/intel_chipset: add Battlemage support
Message-ID: <20240617124405.ufrvuzvbqj4itsiz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>
References: <20240617-bmg_chipset_info-v1-0-289e3215141e@intel.com>
 <20240617-bmg_chipset_info-v1-2-289e3215141e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240617-bmg_chipset_info-v1-2-289e3215141e@intel.com>
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

Hi Andrzej,
On 2024-06-17 at 09:51:45 +0200, Andrzej Hajda wrote:
> Add basic definition for the Battlemage platform.
> Follow Lunar Lake convention.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_chipset.h     |  2 ++
>  lib/intel_device_info.c | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 3f25345199b6..270392c83c2a 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -91,6 +91,7 @@ struct intel_device_info {
>  	bool is_meteorlake : 1;
>  	bool is_pontevecchio : 1;
>  	bool is_lunarlake : 1;
> +	bool is_battlemage : 1;
>  	const struct intel_cmds_info *cmds_info;
>  	const char *codename;
>  };
> @@ -205,6 +206,7 @@ void intel_check_pch(void);
>  #define IS_METEORLAKE(devid)	(intel_get_device_info(devid)->is_meteorlake)
>  #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
>  #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
> +#define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
>  
>  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
>  #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index e80ea54707de..9250abd444db 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -515,6 +515,16 @@ static const struct intel_device_info intel_lunarlake_info = {
>  	.cmds_info = &xe2_cmds_info,
>  };
>  
> +static const struct intel_device_info intel_battlemage_info = {
> +	.graphics_ver = 20,
> +	.graphics_rel = 1,
> +	.display_ver = 14,
> +	.has_4tile = true,
> +	.has_flatccs = true,
> +	.is_battlemage = true,
> +	.codename = "battlemage"
> +};
> +
>  static const struct pci_id_match intel_device_match[] = {
>  	INTEL_I810_IDS(INTEL_VGA_DEVICE, &intel_i810_info),
>  	INTEL_I815_IDS(INTEL_VGA_DEVICE, &intel_i815_info),
> @@ -621,6 +631,8 @@ static const struct pci_id_match intel_device_match[] = {
>  
>  	XE_LNL_IDS(INTEL_VGA_DEVICE, &intel_lunarlake_info),
>  
> +	XE_BMG_IDS(INTEL_VGA_DEVICE, &intel_battlemage_info),
> +
>  	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
>  };
>  
> 
> -- 
> 2.34.1
> 
