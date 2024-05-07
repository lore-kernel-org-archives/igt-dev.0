Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B162C10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 05:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93E410ECF6;
	Tue,  7 May 2024 05:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ms0lVpB9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C285510ECF6
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 05:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715060786; x=1746596786;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BkVnsxVzSr0zVkNgFaP93SWRRYekC8As4pySA/N0M2A=;
 b=Ms0lVpB9IyNHyrcJzNgXoeMvLf7anxka+64R8MGyt6Lyu6azDAyjalxW
 ze+Eta00PVp3MVo0UM95bCmtpuK11zF7kzf3tnMF9mz5Y/J1czFCkE45T
 LJRect+LkN/VGKE+kLPJDWc/iqxBQmdTU+8OhnEo02CGgNRK/sWvnXUYg
 90LJVmajdjHf6cUxjsTLV7hmmxe2jOW0J3H2WjhU+JuZyPvq4xBPjoc4Y
 JbdPTeDXWKH5qnxZwzXRAQVS3oE0Yn4KNBP/qfeZ18Cwyf3dc7Dg4RaeU
 lOr3bH39xEUA4Xqpp5ftBceiE8Mtrmz5d2FRXHbfGImNHFaP30WMhK/1l w==;
X-CSE-ConnectionGUID: FuxSeDvqRXCS6VYs5KHvAw==
X-CSE-MsgGUID: wUKWT4/5SaWEzWRjVTjqFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21509279"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="21509279"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 22:46:26 -0700
X-CSE-ConnectionGUID: VhYrVd3RQ5W2vi+3Ugz+mA==
X-CSE-MsgGUID: 7J7zpIC7QGqPuVgX7cIMbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="32974160"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 22:46:25 -0700
Date: Tue, 7 May 2024 07:46:22 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 07/10] lib/intel_cmds_info: Define tiling macros
Message-ID: <20240507054622.bgicmblnn2whwezk@zkempczy-mobl2>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
 <20240426090117.78060-8-zbigniew.kempczynski@intel.com>
 <028c9697-63bc-4cb0-9b5b-6ca5d07199c9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <028c9697-63bc-4cb0-9b5b-6ca5d07199c9@intel.com>
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

On Fri, Apr 26, 2024 at 03:14:07PM +0200, Karolina Stolarek wrote:
> On 26.04.2024 11:01, Zbigniew Kempczyński wrote:
> > Blitter tilings don't always matches supported render tilings so
> > it is necessary to add separate fields for this purpose. To avoid
> > multiple lines where supported tiling is glued with BIT(tiling)
> > it is worth to predefine them, especially they will be used in next
> > patch related to supported render copy tilings.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >   lib/intel_cmds_info.c | 107 +++++++++++++++++-------------------------
> >   1 file changed, 42 insertions(+), 65 deletions(-)
> > 
> > diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> > index 669d3e5006..2baac54c28 100644
> > --- a/lib/intel_cmds_info.c
> > +++ b/lib/intel_cmds_info.c
> > @@ -20,75 +20,56 @@
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
> > +#define TILE_4		(BIT(T_TILE4))
> > +#define TILE_4_64	(BIT(T_TILE4) | BIT(T_TILE64))
> > +#define TILE_L		(BIT(T_LINEAR))
> > +#define TILE_L_4_64	(BIT(T_LINEAR) | BIT(T_TILE4) | BIT(T_TILE64))
> > +#define TILE_L_X	(BIT(T_LINEAR) | BIT(T_XMAJOR))
> > +#define TILE_L_X_4	(BIT(T_LINEAR) | BIT(T_XMAJOR) | BIT(T_TILE4))
> > +#define TILE_L_Y	(BIT(T_LINEAR) | BIT(T_YMAJOR))
> > +#define TILE_L_X_Y	(BIT(T_LINEAR) | BIT(T_XMAJOR) | BIT(T_YMAJOR))
> > +#define TILE_L_X_4_64	(BIT(T_LINEAR) | BIT(T_XMAJOR) | BIT(T_TILE4) | BIT(T_TILE64))
> > +#define TILE_L_Y_4_64	(BIT(T_LINEAR) | BIT(T_YMAJOR) | BIT(T_TILE4) | BIT(T_TILE64))
> > +#define TILE_L_Y_Yf_64	(BIT(T_LINEAR) | BIT(T_YMAJOR) | BIT(T_YFMAJOR) | BIT(T_TILE64))
> 
> Nit: I'd define simplest macros first and then follow with more complex
> definitions (i.e., TILE_4, TILE_L, TILE_4_64...)
> 
> I'm not sure what to think about these defines. On one hand, they are
> nice and tidy, on the other they can't be reused or coupled together.
> Ideally, we'd have smaller pairings that come together and are used as
> puzzles when defining render/blt info, but probably would take some time
> to implement it nicely, so I don't push for it (...too much)

I think above tiling definitions make code more readable and easier to
maintain, especially in render part where tilings for uncompressed and
compressed buffers varies.

If your intention is to have L/X/Y/Yf/4/64/others... predefined first
then glued with bitwise or operator, I agree this will look better than
all lines with BIT(tiling) glued together.

> 
> Also:
> 
> TILE_4_64 and TILE_L_X_4 are not used until patch 08/10, so I wouldn't
> define them here, but later on.

Right, I was lazy and packed everything to one bag here. I'll split this
according to usage.

Thank you for the review.

--
Zbigniew

> 
> All the best,
> Karolina
> 
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
> > @@ -102,17 +83,13 @@ static const struct blt_cmd_info
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
