Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A1BC25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E366410E3EF;
	Fri, 31 May 2024 14:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLqYqCvF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511E810E3EF
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717167062; x=1748703062;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=ugFa1ti2kwD1BFzCpGizFjEzIlireWNIsr9tgufgfo0=;
 b=bLqYqCvF1X3dLHDPZml6hWxsEodi1AWbz2hD3MpiaWu5aPC/tL0W4IX+
 QXsQ1qAuTpNxJh2q0YzUjOiW/cGRqIdsFLVCsOwpN7gdVUecWXZAFG9hU
 22I1bJoA1juRblmCVBhldAiLxU/8MdKlCoxQj7JMQjn+wauUXiXj5aac+
 kKlYgwJQf4WfuuXL9poEh2E3/0XzKbla4L7qUVX2hJ2l1d1oA4TeJvVS7
 n2ngqtVCaKUO7w56U+om+TaI0vOJdWY3B/WJlcdivMY/4Z8+pMOY+gB+T
 kl5n7ZHNUqiWUp95xfHseQZeoFsyBvMscX3pdrfNGF8sPf3wXPL+nUy9U w==;
X-CSE-ConnectionGUID: jHqln9a0QfOlek+83safKQ==
X-CSE-MsgGUID: ZKw3jtpZR9+vM6zlpL730Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24343269"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="24343269"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:51:00 -0700
X-CSE-ConnectionGUID: /jv8bQPOTLa8cz32x5efTA==
X-CSE-MsgGUID: 3ovG+XvHRMmo/FcdtQeNrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="41264320"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:50:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 10/20] tools/intel_vbt_decode: Reuse
 print_detail_timing_data()
In-Reply-To: <20240531142354.16528-11-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
 <20240531142354.16528-11-ville.syrjala@linux.intel.com>
Date: Fri, 31 May 2024 17:50:54 +0300
Message-ID: <87h6eedohd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 31 May 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> We currently have two copies of code to decode the basic EDID
> defined DTD. Get rid of the ad-hoc variant in dump_lfp_data()
> and just reuse print_detail_timing_data() for it.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_vbt_decode.c | 106 ++++++++++++++-------------------------
>  1 file changed, 39 insertions(+), 67 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 2a11490eed22..ed18a156c1ee 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -53,17 +53,6 @@ typedef uint64_t u64;
>  #define _INTEL_BIOS_PRIVATE
>  #include "intel_vbt_defs.h"
>=20=20
> -/* no bother to include "edid.h" */
> -#define _H_ACTIVE(x) (x[2] + ((x[4] & 0xF0) << 4))
> -#define _H_SYNC_OFF(x) (x[8] + ((x[11] & 0xC0) << 2))
> -#define _H_SYNC_WIDTH(x) (x[9] + ((x[11] & 0x30) << 4))
> -#define _H_BLANK(x) (x[3] + ((x[4] & 0x0F) << 8))
> -#define _V_ACTIVE(x) (x[5] + ((x[7] & 0xF0) << 4))
> -#define _V_SYNC_OFF(x) ((x[10] >> 4) + ((x[11] & 0x0C) << 2))
> -#define _V_SYNC_WIDTH(x) ((x[10] & 0x0F) + ((x[11] & 0x03) << 4))
> -#define _V_BLANK(x) (x[6] + ((x[7] & 0x0F) << 8))
> -#define _PIXEL_CLOCK(x) (x[0] + (x[1] << 8)) * 10000
> -
>  #define YESNO(val) ((val) ? "yes" : "no")
>=20=20
>  /* This is not for mapping to memory layout. */
> @@ -1382,6 +1371,38 @@ static void dump_lfp_data_ptrs(struct context *con=
text,
>  	}
>  }
>=20=20
> +static void
> +print_detail_timing_data(const struct bdb_edid_dtd *dvo_timing)

Here too params for "heading" line and indent/prefix might be
appropriate. Again, can be improved in follow-up.

> +{
> +	int display, sync_start, sync_end, total;
> +
> +	display =3D (dvo_timing->hactive_hi << 8) | dvo_timing->hactive_lo;
> +	sync_start =3D display +
> +		((dvo_timing->hsync_off_hi << 8) | dvo_timing->hsync_off_lo);
> +	sync_end =3D sync_start + ((dvo_timing->hsync_pulse_width_hi << 8) |
> +				 dvo_timing->hsync_pulse_width_lo);
> +	total =3D display +
> +		((dvo_timing->hblank_hi << 8) | dvo_timing->hblank_lo);
> +	printf("\t\t  hdisplay: %d\n", display);
> +	printf("\t\t  hsync [%d, %d] %s\n", sync_start, sync_end,
> +	       dvo_timing->hsync_positive ? "+sync" : "-sync");
> +	printf("\t\t  htotal: %d\n", total);
> +
> +	display =3D (dvo_timing->vactive_hi << 8) | dvo_timing->vactive_lo;
> +	sync_start =3D display + ((dvo_timing->vsync_off_hi << 8) |
> +				dvo_timing->vsync_off_lo);
> +	sync_end =3D sync_start + ((dvo_timing->vsync_pulse_width_hi << 8) |
> +				 dvo_timing->vsync_pulse_width_lo);
> +	total =3D display +
> +		((dvo_timing->vblank_hi << 8) | dvo_timing->vblank_lo);
> +	printf("\t\t  vdisplay: %d\n", display);
> +	printf("\t\t  vsync [%d, %d] %s\n", sync_start, sync_end,
> +	       dvo_timing->vsync_positive ? "+sync" : "-sync");
> +	printf("\t\t  vtotal: %d\n", total);
> +
> +	printf("\t\t  clock: %d\n", dvo_timing->clock * 10);
> +}
> +
>  static char *decode_pnp_id(u16 mfg_name, char str[4])
>  {
>  	mfg_name =3D ntohs(mfg_name);
> @@ -1412,9 +1433,6 @@ static void dump_lfp_data(struct context *context,
>  	struct bdb_block *ptrs_block;
>  	const struct bdb_lfp_data_ptrs *ptrs;
>  	int i;
> -	int hdisplay, hsyncstart, hsyncend, htotal;
> -	int vdisplay, vsyncstart, vsyncend, vtotal;
> -	float clock;
>=20=20
>  	ptrs_block =3D find_section(context, BDB_LFP_DATA_PTRS);
>  	if (!ptrs_block)
> @@ -1425,7 +1443,7 @@ static void dump_lfp_data(struct context *context,
>  	for (i =3D 0; i < 16; i++) {
>  		const struct fp_timing *fp_timing =3D
>  			block_data(block) + ptrs->ptr[i].fp_timing.offset;
> -		const uint8_t *timing_data =3D
> +		const struct bdb_edid_dtd *dvo_timing =3D
>  			block_data(block) + ptrs->ptr[i].dvo_timing.offset;
>  		const struct bdb_edid_pnp_id *pnp_id =3D
>  			block_data(block) + ptrs->ptr[i].panel_pnp_id.offset;
> @@ -1435,22 +1453,10 @@ static void dump_lfp_data(struct context *context,
>  		if (!dump_panel(context, i))
>  			continue;
>=20=20
> -		hdisplay =3D _H_ACTIVE(timing_data);
> -		hsyncstart =3D hdisplay + _H_SYNC_OFF(timing_data);
> -		hsyncend =3D hsyncstart + _H_SYNC_WIDTH(timing_data);
> -		htotal =3D hdisplay + _H_BLANK(timing_data);
> -
> -		vdisplay =3D _V_ACTIVE(timing_data);
> -		vsyncstart =3D vdisplay + _V_SYNC_OFF(timing_data);
> -		vsyncend =3D vsyncstart + _V_SYNC_WIDTH(timing_data);
> -		vtotal =3D vdisplay + _V_BLANK(timing_data);
> -		clock =3D _PIXEL_CLOCK(timing_data) / 1000;
> -
>  		printf("\tPanel %d%s\n", i, panel_str(context, i));
> -		printf("\t\t%dx%d clock %d\n",
> -		       fp_timing->x_res, fp_timing->y_res,
> -		       _PIXEL_CLOCK(timing_data));
> -		printf("\t\tinfo:\n");
> +		printf("\t\tResolution: %dx%d\n",
> +		       fp_timing->x_res, fp_timing->y_res);
> +		printf("\t\tFP timing data:\n");
>  		printf("\t\t  LVDS: 0x%08lx\n",
>  		       (unsigned long)fp_timing->lvds_reg_val);
>  		printf("\t\t  PP_ON_DELAYS: 0x%08lx\n",
> @@ -1461,11 +1467,9 @@ static void dump_lfp_data(struct context *context,
>  		       (unsigned long)fp_timing->pp_cycle_reg_val);
>  		printf("\t\t  PFIT: 0x%08lx\n",
>  		       (unsigned long)fp_timing->pfit_reg_val);
> -		printf("\t\ttimings: %d %d %d %d %d %d %d %d %.2f (%s)\n",
> -		       hdisplay, hsyncstart, hsyncend, htotal,
> -		       vdisplay, vsyncstart, vsyncend, vtotal, clock,
> -		       (hsyncend > htotal || vsyncend > vtotal) ?
> -		       "BAD!" : "good");
> +
> +		printf("\t\tDVO timing:\n");
> +		print_detail_timing_data(dvo_timing);
>=20=20
>  		printf("\t\tPnP ID:\n");
>  		dump_pnp_id(pnp_id);
> @@ -1926,38 +1930,6 @@ static void dump_lfp_power(struct context *context,
>  	}
>  }
>=20=20
> -static void
> -print_detail_timing_data(const struct bdb_edid_dtd *dvo_timing)
> -{
> -	int display, sync_start, sync_end, total;
> -
> -	display =3D (dvo_timing->hactive_hi << 8) | dvo_timing->hactive_lo;
> -	sync_start =3D display +
> -		((dvo_timing->hsync_off_hi << 8) | dvo_timing->hsync_off_lo);
> -	sync_end =3D sync_start + ((dvo_timing->hsync_pulse_width_hi << 8) |
> -				 dvo_timing->hsync_pulse_width_lo);
> -	total =3D display +
> -		((dvo_timing->hblank_hi << 8) | dvo_timing->hblank_lo);
> -	printf("\thdisplay: %d\n", display);
> -	printf("\thsync [%d, %d] %s\n", sync_start, sync_end,
> -	       dvo_timing->hsync_positive ? "+sync" : "-sync");
> -	printf("\thtotal: %d\n", total);
> -
> -	display =3D (dvo_timing->vactive_hi << 8) | dvo_timing->vactive_lo;
> -	sync_start =3D display + ((dvo_timing->vsync_off_hi << 8) |
> -				dvo_timing->vsync_off_lo);
> -	sync_end =3D sync_start + ((dvo_timing->vsync_pulse_width_hi << 8) |
> -				 dvo_timing->vsync_pulse_width_lo);
> -	total =3D display +
> -		((dvo_timing->vblank_hi << 8) | dvo_timing->vblank_lo);
> -	printf("\tvdisplay: %d\n", display);
> -	printf("\tvsync [%d, %d] %s\n", sync_start, sync_end,
> -	       dvo_timing->vsync_positive ? "+sync" : "-sync");
> -	printf("\tvtotal: %d\n", total);
> -
> -	printf("\tclock: %d\n", dvo_timing->clock * 10);
> -}
> -
>  static void dump_sdvo_lvds_dtd(struct context *context,
>  			       const struct bdb_block *block)
>  {

--=20
Jani Nikula, Intel
