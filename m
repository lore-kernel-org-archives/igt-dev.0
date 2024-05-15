Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E636C25B79
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 12:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E9C10E86D;
	Wed, 15 May 2024 12:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMRHlHnK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894FC10E834
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 12:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715774660; x=1747310660;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IO2E+X1By3Zpj/oM4xgqqRvUazLTCBbmWxM25besHyo=;
 b=dMRHlHnKXFaaqiASz46lwes2Gt6zmveab5Q9/oV5Y05zE2/7OTTGH6qV
 MhuwJQxTlkM30bvE+unU0qV+aL38ncqk2s2Lgoekboco0zVCVYW882rvi
 6vH6qBt1DC1/HOwYCI9qbkxPNeLvHJ0Eelcy6TPWRHAszVpcDAA4+GMDT
 xAzH3CWFePM0EqcO6PnqeB9rubeV3nHqNWyeUSK2DAsjJ4DKyi9Sp+rHU
 2JjrKbiWovhJ0tII6RsXJ2BuYS8Es7bs7piVagEhw+0h++ZZfYBmrnJqW
 CW06VYfqG7FdiZe6QazU9GehD0OjOl3f28lvuaAk9IaPsjeS/8ppJqrfp A==;
X-CSE-ConnectionGUID: JDdWHXQQQ1KsJIQDwzhUsw==
X-CSE-MsgGUID: e9jPxMXbSR+5tBO5EZQ0eg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11761991"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="11761991"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:04:20 -0700
X-CSE-ConnectionGUID: MfW7Xi1OSLivzHVvl8NfYw==
X-CSE-MsgGUID: G7Z8yH/fQ/C7JJtBSBGB9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="31154285"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:04:18 -0700
Date: Wed, 15 May 2024 14:04:14 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v5 08/11] lib/intel_cmds_info: Introduce render
 tilings
Message-ID: <20240515120414.geinvjei4p6p4byg@zkempczy-mobl2>
References: <20240509053359.449885-1-zbigniew.kempczynski@intel.com>
 <20240509053359.449885-9-zbigniew.kempczynski@intel.com>
 <bc4cf013-9e90-4834-92ad-96aac9f3c548@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc4cf013-9e90-4834-92ad-96aac9f3c548@gmail.com>
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

On Tue, May 14, 2024 at 08:26:15PM +0300, Juha-Pekka Heikkila wrote:
> On 9.5.2024 8.33, Zbigniew Kempczyński wrote:
> > Due to hardware differences between blitter and render regarding
> > supported tilings and compression add new fields in cmds-info
> > to identify available tilings via render engine.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >   lib/intel_cmds_info.c | 31 +++++++++++++++++++++++++++----
> >   lib/intel_cmds_info.h |  6 ++++++
> >   2 files changed, 33 insertions(+), 4 deletions(-)
> > 
> > diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> > index e7aabf6bfb..3f04f24f3c 100644
> > --- a/lib/intel_cmds_info.c
> > +++ b/lib/intel_cmds_info.c
> > @@ -27,8 +27,10 @@
> >   #define TILE_Y		BIT(T_YMAJOR)
> >   #define TILE_Yf		BIT(T_YFMAJOR)
> > +#define TILE_4_64	(TILE_4 | TILE_64)
> >   #define TILE_L_4_64	(TILE_L | TILE_4 | TILE_64)
> >   #define TILE_L_X	(TILE_L | TILE_X)
> > +#define TILE_L_X_4	(TILE_L | TILE_X | TILE_4)
> >   #define TILE_L_X_Y	(TILE_L | TILE_X | TILE_Y)
> >   #define TILE_L_X_4_64	(TILE_L | TILE_X | TILE_4 | TILE_64)
> >   #define TILE_L_Y	(TILE_L | TILE_Y)
> > @@ -93,6 +95,23 @@ static const struct blt_cmd_info
> >   						 BLT_CMD_EXTENDED);
> > +#define RENDER_TILING(_tiling, _compress_tiling)  { \
> > +		.supported_tiling = _tiling, \
> > +		.supported_compressed_tiling = _compress_tiling, \
> > +	}
> > +
> > +static const struct render_tiling_info
> > +		render_tiling_gen12 = RENDER_TILING(TILE_L_X_4, TILE_4);
> 
> Is this correct? I'm thinking for gen12 here would say
> RENDER_TILING(TILE_L_X_Y, TILE_Y); ?

I've just written tiling detection tool and it reports render is able
to use L/X/Y/Yf tilings (software tile64 is not yet implemented).
So you are right, it should be TILE_L_X_Y. I'm going to experiment
and update the supported tilings in intel_cmds_info.c later.

--
Zbigniew

> 
> > +
> > +static const struct render_tiling_info
> > +		render_tiling_mtl = RENDER_TILING(TILE_L_X_4_64, TILE_4);
> > +
> > +static const struct render_tiling_info
> > +		render_tiling_dg2 = RENDER_TILING(TILE_L_X_4_64, TILE_4_64);
> > +
> > +static const struct render_tiling_info
> > +		render_tiling_xe2 = RENDER_TILING(TILE_L_X_4_64, TILE_L_X_4_64);
> > +
> >   const struct intel_cmds_info pre_gen6_cmds_info = {
> >   	.blt_cmds = {
> >   		[SRC_COPY] = &src_copy,
> > @@ -130,7 +149,8 @@ const struct intel_cmds_info gen12_cmds_info = {
> >   		[XY_FAST_COPY] = &gen12_xy_fast_copy,
> >   		[XY_BLOCK_COPY] = &gen12_xy_block_copy,
> >   		[XY_COLOR_BLT] = &gen6_xy_color_blt,
> > -	}
> > +	},
> > +	.render_tilings = &render_tiling_gen12,
> >   };
> >   const struct intel_cmds_info gen12_dg2_cmds_info = {
> > @@ -139,14 +159,16 @@ const struct intel_cmds_info gen12_dg2_cmds_info = {
> >   		[XY_FAST_COPY] = &dg2_xy_fast_copy,
> >   		[XY_BLOCK_COPY] = &dg2_xy_block_copy,
> >   		[XY_COLOR_BLT] = &gen6_xy_color_blt,
> > -	}
> > +	},
> > +	.render_tilings = &render_tiling_dg2,
> >   };
> >   const struct intel_cmds_info gen12_mtl_cmds_info = {
> >   	.blt_cmds = {
> >   		[XY_FAST_COPY] = &dg2_xy_fast_copy,
> >   		[XY_BLOCK_COPY] = &mtl_xy_block_copy,
> > -	}
> > +	},
> > +	.render_tilings = &render_tiling_mtl,
> >   };
> >   const struct intel_cmds_info gen12_pvc_cmds_info = {
> > @@ -164,7 +186,8 @@ const struct intel_cmds_info xe2_cmds_info  = {
> >   		[XY_BLOCK_COPY] = &xe2_xy_block_copy,
> >   		[MEM_COPY] = &pvc_mem_copy,
> >   		[MEM_SET] = &pvc_mem_set,
> > -	}
> > +	},
> > +	.render_tilings = &render_tiling_xe2,
> >   };
> >   const struct blt_cmd_info *blt_get_cmd_info(const struct intel_cmds_info *cmds_info,
> > diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
> > index 0a83b6a446..6f7d655083 100644
> > --- a/lib/intel_cmds_info.h
> > +++ b/lib/intel_cmds_info.h
> > @@ -43,8 +43,14 @@ struct blt_cmd_info {
> >   #define BLT_CMD_SUPPORTS_COMPRESSION   (1 << 1)
> >   };
> > +struct render_tiling_info {
> > +	uint32_t supported_tiling;
> > +	uint32_t supported_compressed_tiling;
> > +};
> > +
> >   struct intel_cmds_info {
> >   	struct blt_cmd_info const *blt_cmds[__BLT_MAX_CMD];
> > +	struct render_tiling_info const *render_tilings;
> >   };
> >   extern const struct intel_cmds_info pre_gen6_cmds_info;
> 
