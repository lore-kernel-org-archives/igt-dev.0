Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A56CA0EE0
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 13:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED25B10E0D9;
	Wed, 13 Aug 2025 13:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fT3G94bS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A59F10E731
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755093563; x=1786629563;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uK4CAKvia8WJl7nwb3jduXFnRfjgyqy1M3oIlHnuG9g=;
 b=fT3G94bSNS6JukKccPM4mIUcqrHiusHmgMIgtxhte0CnyFjC+9v7olLZ
 4XUkEMsYxHSOodWajdxJXioLCGUKgxnCNMh+074i+az4ve3Dp8sftLN/E
 YfWlmOPibm1SHfRV4iN/iNnHjHnRo31/3kclIzA2Lo0dyARDsoTpX2CbB
 SIw5HTTXiGbVqDo6q7FCG1l9HR+DNsjBEjPyOei/TGB/dJXipokKxa3S1
 QB9DogHNW4fS1dgOD1B366V2mdDIO4Ht4xSdeFZ/Vkv4D9zw+AYzQ26is
 qnSil0Fk93egXq4VQUFycGPWnHkXN77hc7FU7uq8oKpVjZsDdulEeqDkT g==;
X-CSE-ConnectionGUID: pM0U9dbLRlGPnmUNMhHcMA==
X-CSE-MsgGUID: gOtqkT0sRoucYBNOFVq9aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57289931"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57289931"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 06:59:23 -0700
X-CSE-ConnectionGUID: 23DVgA+2Rga8JGZejp4Gig==
X-CSE-MsgGUID: q2R0pkENS6GUIBkwglEWPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="165663729"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:59:20 -0700
Date: Wed, 13 Aug 2025 15:59:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/4] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with kernel commit bc3ca4d94369
Message-ID: <20250813135918.klejosh6wravj2xd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <cover.1754916577.git.jani.nikula@intel.com>
 <83082d7c5ca34f7f71002f7493bb66dc89efe7e7.1754916577.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <83082d7c5ca34f7f71002f7493bb66dc89efe7e7.1754916577.git.jani.nikula@intel.com>
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

Hi Jani,
On 2025-08-11 at 15:50:23 +0300, Jani Nikula wrote:
> Synchronize intel_vbt_defs.h with kernel commit:
> 
> bc3ca4d94369 ("drm/i915: Make I2C terminology more inclusive")
> 
> Modify the tool accordingly.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Please change subject, for example:

[PATCH i-g-t 1/4] tools/intel_vbt_decode: Change field name in structure

or
[PATCH i-g-t 1/4] tools/intel_vbt_decode: Change printed name in structure

or
[PATCH i-g-t 1/4] tools/intel_vbt_decode: Change printed name

so it will be more informative when using git log --oneline

With this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_vbt_decode.c | 4 ++--
>  tools/intel_vbt_defs.h   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 1b0d93d37394..85a160e08b44 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -1196,7 +1196,7 @@ static void dump_child_device(struct context *context,
>  	       dvo_port(child->dvo_port), child->dvo_port);
>  
>  	printf("\t\tAIM I2C pin: 0x%02x\n", child->i2c_pin);
> -	printf("\t\tAIM Slave address: 0x%02x\n", child->slave_addr);
> +	printf("\t\tAIM Target address: 0x%02x\n", child->target_addr);
>  	printf("\t\tDDC pin: 0x%02x\n", child->ddc_pin);
>  	printf("\t\tEDID buffer ptr: 0x%02x\n", child->edid_ptr);
>  	printf("\t\tDVO config: 0x%02x\n", child->dvo_cfg);
> @@ -1204,7 +1204,7 @@ static void dump_child_device(struct context *context,
>  	if (context->bdb->version < 155) {
>  		printf("\t\tDVO2 Port: 0x%02x (%s)\n", child->dvo2_port, dvo_port(child->dvo2_port));
>  		printf("\t\tI2C2 pin: 0x%02x\n", child->i2c2_pin);
> -		printf("\t\tSlave2 address: 0x%02x\n", child->slave2_addr);
> +		printf("\t\tTarget2 address: 0x%02x\n", child->target2_addr);
>  		printf("\t\tDDC2 pin: 0x%02x\n", child->ddc2_pin);
>  	} else {
>  		if (context->bdb->version >= 244)
> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> index 1af8407e2081..e613288937e4 100644
> --- a/tools/intel_vbt_defs.h
> +++ b/tools/intel_vbt_defs.h
> @@ -493,7 +493,7 @@ struct child_device_config {
>  	u16 addin_offset;
>  	u8 dvo_port; /* See DEVICE_PORT_* and DVO_PORT_* above */
>  	u8 i2c_pin;
> -	u8 slave_addr;
> +	u8 target_addr;
>  	u8 ddc_pin;
>  	u16 edid_ptr;
>  	u8 dvo_cfg; /* See DEVICE_CFG_* above */
> @@ -502,7 +502,7 @@ struct child_device_config {
>  		struct {
>  			u8 dvo2_port;
>  			u8 i2c2_pin;
> -			u8 slave2_addr;
> +			u8 target2_addr;
>  			u8 ddc2_pin;
>  		} __packed;
>  		struct {
> -- 
> 2.47.2
> 
