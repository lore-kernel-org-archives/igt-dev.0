Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE9EC04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 07:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9353910E6E8;
	Wed,  8 May 2024 07:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRXXCCUP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18F310E6E8
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 07:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715152431; x=1746688431;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KoxnKmlCNbqqB/HcFIr+iIfOXXUmosCC3kMdi4nwzoQ=;
 b=kRXXCCUPwWTuv3UcIAf+yxBkrvcU3egD8RRKAiNIKYK/fKkoXHE5crEa
 Cbhr7cpHXBgarpodnrTi+0znMHobzXrMhpsQEuEYKH6/7CjxPPGlOT2YL
 3Wr1Y6vktIt6wBpz4+XNe7VyVN5+tQRFR8KPKIIW1c27tdreW8fy27hTT
 7QEhw5Qq23Z4lSaHPIEBqXb/D9p7h324eRrCROozp4uKvhUErS+MF4xRj
 ghLlwTtCvIJ/GfnXkgKosDm7G0YJh+wh2r4wuFNGeD+6NHkowGSYAbqM1
 osSmQbZwNOHuF4cGBEP3EKGbSlZ8rEPYWHBP3gYgevS+qhqpeYIFbJbDz Q==;
X-CSE-ConnectionGUID: NjxgtHwsRUK0MYNWakP7vA==
X-CSE-MsgGUID: D4EYkW1PQ+av6iCEByt/6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10830943"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="10830943"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 00:13:51 -0700
X-CSE-ConnectionGUID: vj9YW1qUTPW5ZTPEidG3BQ==
X-CSE-MsgGUID: elCS8y5xTai0wpHjZ6mX0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="28767061"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.60])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 00:13:49 -0700
Date: Wed, 8 May 2024 09:13:46 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 07/11] lib/intel_cmds_info: Define tiling macros
Message-ID: <20240508071346.rl4rgfilnlwaehuk@zkempczy-mobl2>
References: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
 <20240507075836.259581-8-zbigniew.kempczynski@intel.com>
 <cb5485b2-21ec-40a4-9df8-d9db860c9e86@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb5485b2-21ec-40a4-9df8-d9db860c9e86@gmail.com>
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

On Tue, May 07, 2024 at 05:27:42PM +0300, Juha-Pekka Heikkila wrote:
> Hi Zbigniew,
> 
> On 7.5.2024 10.58, Zbigniew Kempczyński wrote:
> > Blitter tilings don't always matches supported render tilings so
> > it is necessary to add separate fields for this purpose. To avoid
> > multiple lines where supported tiling is glued with BIT(tiling)
> > it is worth to predefine them, especially they will be used in next
> > patch related to supported render copy tilings.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > 
> > ---
> > v3: Predefine single tiling first, then complex (Karolina)
> > ---
> >   lib/intel_cmds_info.c | 110 +++++++++++++++++-------------------------
> >   1 file changed, 45 insertions(+), 65 deletions(-)
> > 
> > diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> > index 669d3e5006..e7aabf6bfb 100644
> > --- a/lib/intel_cmds_info.c
> > +++ b/lib/intel_cmds_info.c
> > @@ -20,75 +20,59 @@
> >   		.flags = _flags, \
> >   	}
> > -static const struct blt_cmd_info src_copy = BLT_INFO(SRC_COPY, BIT(T_LINEAR));
> > -static const struct blt_cmd_info
> > -		pre_gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY,
> > -						BIT(T_LINEAR) |
> > -						BIT(T_XMAJOR));
> > -static const struct blt_cmd_info
> > -		gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY,
> > -					    BIT(T_LINEAR) |
> > -					    BIT(T_XMAJOR) |
> > -					    BIT(T_YMAJOR));
> > -static const struct blt_cmd_info
> > -		gen11_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> > -					      BIT(T_LINEAR)  |
> > -					      BIT(T_YMAJOR)  |
> > -					      BIT(T_YFMAJOR) |
> > -					      BIT(T_TILE64));
> > -static const struct blt_cmd_info
> > -		gen12_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> > -					      BIT(T_LINEAR) |
> > -					      BIT(T_YMAJOR) |
> > -					      BIT(T_TILE4)  |
> > -					      BIT(T_TILE64));
> > -static const struct blt_cmd_info
> > -		dg2_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> > -					    BIT(T_LINEAR) |
> > -					    BIT(T_XMAJOR) |
> > -					    BIT(T_TILE4)  |
> > -					    BIT(T_TILE64));
> > -static const struct blt_cmd_info
> > -		pvc_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> > -					    BIT(T_LINEAR) |
> > -					    BIT(T_TILE4)  |
> > -					    BIT(T_TILE64));
> > -
> > -static const struct blt_cmd_info
> > -		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
> > -					       BIT(T_LINEAR) |
> > -					       BIT(T_YMAJOR));
> > -static const struct blt_cmd_info
> > -		dg2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> > -						 BIT(T_LINEAR) |
> > -						 BIT(T_XMAJOR) |
> > -						 BIT(T_TILE4)  |
> > -						 BIT(T_TILE64),
> > +#define TILE_4		BIT(T_TILE4)
> > +#define TILE_64		BIT(T_TILE64)
> > +#define TILE_L		BIT(T_LINEAR)
> > +#define TILE_X		BIT(T_XMAJOR)
> > +#define TILE_Y		BIT(T_YMAJOR)
> > +#define TILE_Yf		BIT(T_YFMAJOR)
> > +
> > +#define TILE_L_4_64	(TILE_L | TILE_4 | TILE_64)
> > +#define TILE_L_X	(TILE_L | TILE_X)
> > +#define TILE_L_X_Y	(TILE_L | TILE_X | TILE_Y)
> > +#define TILE_L_X_4_64	(TILE_L | TILE_X | TILE_4 | TILE_64)
> > +#define TILE_L_Y	(TILE_L | TILE_Y)
> > +#define TILE_L_Y_4_64	(TILE_L | TILE_Y | TILE_4 | TILE_64)
> 
> I was wondering if this is intentional or a bug? I see this was already so
> in previous implementation so I guess it work.. but on above line is set
> bits for linear, y, 4 and 64tile. I think those y and 4 will never exist in
> same device? Should here 4 be x instead?

Looking at spec I see only Linear and Y are supported on TGL. I miss
tool which verifies what tile format are supported on given platform.
Unfortunately linear -> <intermediate surface> -> linear only proves
that operation is reversible, but we're not sure really what tiling
exists in <intermediate> surface.

I've checked for fast-copy and on TGL technically we should have
L/X/Y/4/64 (Y/4 are switched by Dword1 bit[31]). But I can't prove at
the moment is it correct.

--
Zbigniew

> 
> I see this is used for gen12_xy_fast_copy, could this play part in those
> failures I had with blitter on adlp w/ x-tile?
> 
> > +#define TILE_L_Y_Yf_64	(TILE_L | TILE_Y | TILE_Yf | TILE_64)
> > +
> > +static const struct blt_cmd_info src_copy = BLT_INFO(SRC_COPY, TILE_L);
> > +static const struct blt_cmd_info
> > +		pre_gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY, TILE_L_X);
> > +
> > +static const struct blt_cmd_info
> > +		gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY, TILE_L_X_Y);
> > +
> > +static const struct blt_cmd_info
> > +		gen11_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_Y_Yf_64);
> > +
> > +static const struct blt_cmd_info
> > +		gen12_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_Y_4_64);
> > +
> > +static const struct blt_cmd_info
> > +		dg2_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_X_4_64);
> > +
> > +static const struct blt_cmd_info
> > +		pvc_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_4_64);
> > +
> > +static const struct blt_cmd_info
> > +		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY, TILE_L_Y);
> > +
> > +static const struct blt_cmd_info
> > +		dg2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
> >   						 BLT_CMD_EXTENDED |
> >   						 BLT_CMD_SUPPORTS_COMPRESSION);
> >   static const struct blt_cmd_info
> > -		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> > -						 BIT(T_LINEAR) |
> > -						 BIT(T_XMAJOR) |
> > -						 BIT(T_TILE4)  |
> > -						 BIT(T_TILE64),
> > +		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
> >   						 BLT_CMD_EXTENDED |
> >   						 BLT_CMD_SUPPORTS_COMPRESSION);
> >   static const struct blt_cmd_info
> > -		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> > -						 BIT(T_LINEAR) |
> > -						 BIT(T_XMAJOR) |
> > -						 BIT(T_TILE4)  |
> > -						 BIT(T_TILE64),
> > +		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
> >   						 BLT_CMD_EXTENDED);
> >   static const struct blt_cmd_info
> > -		pvc_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> > -						 BIT(T_LINEAR) |
> > -						 BIT(T_TILE4)  |
> > -						 BIT(T_TILE64),
> > +		pvc_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_4_64,
> >   						 BLT_CMD_EXTENDED);
> >   static const struct blt_cmd_info
> > @@ -102,17 +86,13 @@ static const struct blt_cmd_info
> >   				       BIT(M_MATRIX));
> >   static const struct blt_cmd_info
> > -		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT,
> > -						 BIT(T_LINEAR) |
> > -						 BIT(T_XMAJOR));
> > +		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT, TILE_L_X);
> >   static const struct blt_cmd_info
> > -		gen6_xy_color_blt = BLT_INFO_EXT(XY_COLOR_BLT,
> > -						 BIT(T_LINEAR) |
> > -						 BIT(T_YMAJOR) |
> > -						 BIT(T_XMAJOR),
> > +		gen6_xy_color_blt = BLT_INFO_EXT(XY_COLOR_BLT, TILE_L_X_Y,
> >   						 BLT_CMD_EXTENDED);
> > +
> >   const struct intel_cmds_info pre_gen6_cmds_info = {
> >   	.blt_cmds = {
> >   		[SRC_COPY] = &src_copy,
> 
