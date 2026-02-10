Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D83EEB26F5
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 18:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4247610E3B0;
	Tue, 10 Feb 2026 18:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JMAbGOL0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6930610E399
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 18:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770747933; x=1802283933;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5FqYKRsCO26BJZiJyLRnHHK6IZN7BQGORg9pC2fbL/I=;
 b=JMAbGOL0R4AZPQxWP+VkCa3OCr86MXKu6vaNFLrgqXnLYeuJwmfnk0np
 X+2L55krnLKFkPYbAs/JZW7Rxf2G6j7+iEinil9ixd2czN8PwdZVAYcSy
 f5YGQlCIZg5t9e36PBm0eOQ7x22UER1WPJhxaaFT9iwk5WMN77ACi9Bbr
 /JsMKC4DA8Qgdfk5A+xX+oITzO035WwP6Nnnjzd133R2sSXxdVPTC5KA9
 W6fz+b2YgzZnwE5Mq9ckWF4Gkljb6gjLLK2Mpq+tA9o7QrR9mV0RiChGO
 OWHB1zdUzud2l2Yx547GA5379Nham4zqyPOasBZa2Wo1aNooS7Kk3QJQJ Q==;
X-CSE-ConnectionGUID: fWuRCRuLSkKTS6gOZ94C+g==
X-CSE-MsgGUID: bL8oYR1NQhazy6iPh0dolA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72073490"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="72073490"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 10:25:32 -0800
X-CSE-ConnectionGUID: FxBXBSRARLWn6+MZ2Yq+Xw==
X-CSE-MsgGUID: k3nD0yBdSciTEXzXYHWJ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211100741"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 10:25:31 -0800
Date: Tue, 10 Feb 2026 19:25:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with commit 835a0d544def
Message-ID: <20260210182528.sokdzf7pbyvurp5k@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260119111918.2686910-1-ankit.k.nautiyal@intel.com>
 <20260119111918.2686910-2-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119111918.2686910-2-ankit.k.nautiyal@intel.com>
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

Hi Ankit,
On 2026-01-19 at 16:49:17 +0530, Ankit Nautiyal wrote:
> Synchronize intel_vbt_defs.h with kernel commit:
> 835a0d544def ("drm/i915/bios: Add function to check if edp data override is needed")
> 

This kernel commit do not touch intel_vbt_defs.h:

git show 835a0d544def --stat
commit 835a0d544defa05d2425496d16d006b147df5bde
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu Aug 21 09:56:52 2025 +0530

drm/i915/bios: Add function to check if edp data override is needed
[cut]

drivers/gpu/drm/i915/display/intel_bios.c | 32 ++++++++++++++++++++++++++++++++
drivers/gpu/drm/i915/display/intel_bios.h |  2 ++
2 files changed, 34 insertions(+)

Checking changes for that file:
git log --oneline -5 drivers/gpu/drm/i915/display/intel_vbt_defs.h
1b85a9b04681 drm/i915/vbt: Add edp pipe joiner enable/disable bits
203c7904f2d8 drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc
4d33c77cf2c3 drm/i915/vbt: Add eDP Data rate overrride field in VBT
f3c65a8e9b09 drm/i915/vbt: split up DSI VBT defs to a separate file
96b451d53ae9 drm/{i915,xe}: convert i915 and xe display members into pointers

Last sync was with f3c65a8e9b09 so you need to bring new ones
starting from 4d33...

Regards,
Kamil

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  tools/intel_vbt_decode.c | 36 ++++++++++++++++++++++++++++++++++++
>  tools/intel_vbt_defs.h   | 18 ++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index d4aada743e42..6f6f70dcee63 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -1125,6 +1125,39 @@ static const char * const hdmi_frl_rate_str[] = {
>  	[5] = "12 GT/s",
>  };
>  
> +static void dump_edp_data_rate_override(uint32_t edp_data_rate_override)
> +{
> +	int i;
> +	static const uint32_t link_rates[BDB_263_VBT_EDP_NUM_RATES][2] = {
> +		{ BDB_263_VBT_EDP_LINK_RATE_1_62, 162000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_2_16, 216000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_2_43, 243000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_2_7, 270000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_3_24, 324000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_4_32, 432000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_5_4, 540000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_6_75, 675000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_8_1, 810000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_10, 1000000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_13_5, 1350000 },
> +		{ BDB_263_VBT_EDP_LINK_RATE_20, 2000000},
> +	};
> +
> +	edp_data_rate_override &= BDB_263_VBT_EDP_RATES_MASK;
> +
> +	printf("\t\teDP data rate override:");
> +
> +	if (!edp_data_rate_override) {
> +		printf("(none)\n");
> +		return;
> +	}
> +	printf("\n");
> +
> +	for (i = 0; i < BDB_263_VBT_EDP_NUM_RATES; i++)
> +		if (link_rates[i][0] & edp_data_rate_override)
> +			printf("\t\t\t%d kbps\n", link_rates[i][1]);
> +}
> +
>  static void dump_child_device(struct context *context,
>  			      const struct child_device_config *child)
>  {
> @@ -1285,6 +1318,9 @@ static void dump_child_device(struct context *context,
>  
>  	if (context->bdb->version >= 256)
>  		printf("\t\tEFP panel index: %d\n", child->efp_index);
> +
> +	if (context->bdb->version >= 263)
> +		dump_edp_data_rate_override(child->edp_data_rate_override);
>  }
>  
>  static void dump_child_devices(struct context *context, const uint8_t *devices,
> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> index 6612d3a4ec49..932305df2320 100644
> --- a/tools/intel_vbt_defs.h
> +++ b/tools/intel_vbt_defs.h
> @@ -437,6 +437,22 @@ enum vbt_gmbus_ddi {
>  #define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR13P5	6
>  #define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR20	7
>  
> +/* EDP link rate 263+ */
> +#define BDB_263_VBT_EDP_LINK_RATE_1_62		(1 << 0)
> +#define BDB_263_VBT_EDP_LINK_RATE_2_16		(1 << 1)
> +#define BDB_263_VBT_EDP_LINK_RATE_2_43		(1 << 2)
> +#define BDB_263_VBT_EDP_LINK_RATE_2_7		(1 << 3)
> +#define BDB_263_VBT_EDP_LINK_RATE_3_24		(1 << 4)
> +#define BDB_263_VBT_EDP_LINK_RATE_4_32		(1 << 5)
> +#define BDB_263_VBT_EDP_LINK_RATE_5_4		(1 << 6)
> +#define BDB_263_VBT_EDP_LINK_RATE_6_75		(1 << 7)
> +#define BDB_263_VBT_EDP_LINK_RATE_8_1		(1 << 8)
> +#define BDB_263_VBT_EDP_LINK_RATE_10		(1 << 9)
> +#define BDB_263_VBT_EDP_LINK_RATE_13_5		(1 << 10)
> +#define BDB_263_VBT_EDP_LINK_RATE_20		(1 << 11)
> +#define BDB_263_VBT_EDP_NUM_RATES		12
> +#define BDB_263_VBT_EDP_RATES_MASK		0xfff
> +
>  /*
>   * The child device config, aka the display device data structure, provides a
>   * description of a port and its configuration on the platform.
> @@ -547,6 +563,8 @@ struct child_device_config {
>  	u8 dp_max_link_rate:3;					/* 216+ */
>  	u8 dp_max_link_rate_reserved:5;				/* 216+ */
>  	u8 efp_index;						/* 256+ */
> +	u32 edp_data_rate_override:12;                          /* 263+ */
> +	u32 edp_data_rate_override_reserved:20;                 /* 263+ */
>  } __packed;
>  
>  struct bdb_general_definitions {
> -- 
> 2.45.2
> 
