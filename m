Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D886E3F7
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 09:28:29 +0000 (UTC)
Date: Fri, 14 May 2021 12:31:39 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20210514093139.GA8606@intel.com>
References: <20210414022754.31710-1-ville.syrjala@linux.intel.com>
 <20210414022754.31710-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414022754.31710-2-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/8] tools/intel_watermark: Parse WM_DBG
 to help diagnose watermark issues
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 05:27:47AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> WM_DBG has some useful sticky bits which tell us whether the
> hardware has entered specific LP1+ and/or maxfifo modes since
> those bits were last cleared. Let's dump those out.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@gmail.com>

> ---
>  tools/intel_watermark.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> =

> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index 14d1ae0d80f7..bc2a46232772 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -41,6 +41,11 @@ static uint32_t read_reg(uint32_t addr)
>  	return INREG(display_base + addr);
>  }
>  =

> +static void write_reg(uint32_t addr, uint32_t val)
> +{
> +	OUTREG(display_base + addr, val);
> +}
> +
>  struct gmch_wm {
>  	int wm, wm1, dl, fifo, fbc, burst;
>  	bool dl_prec, valid;
> @@ -249,6 +254,7 @@ static void skl_wm_dump(void)
>  	uint32_t nv12_buf_cfg[num_pipes][max_planes];
>  	uint32_t plane_ctl[num_pipes][max_planes];
>  	uint32_t wm_linetime[num_pipes];
> +	uint32_t wm_dbg;
>  =

>  	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, -1);
>  =

> @@ -455,6 +461,17 @@ static void skl_wm_dump(void)
>  =

>  	printf("* plane watermark enabled\n");
>  	printf("(x) line watermark if enabled\n");
> +
> +	wm_dbg =3D read_reg(0x45280);
> +	printf("WM_DBG: 0x%08x\n", wm_dbg);
> +	printf(" LP used:");
> +	for (level =3D 1; level < num_levels; level++) {
> +		if (wm_dbg & (1 << (23 + level)))
> +			printf(" LP%d", level);
> +	}
> +	printf("\n");
> +	/* clear the sticky bits */
> +	write_reg(0x45280, wm_dbg);
>  }
>  =

>  static void ilk_wm_dump(void)
> @@ -608,6 +625,22 @@ static void ilk_wm_dump(void)
>  	}
>  	printf("FBC watermark =3D %s\n",
>  	       endis(!REG_DECODE1(arb_ctl, 15, 1)));
> +
> +	if (IS_BROADWELL(devid) || IS_HASWELL(devid)) {
> +		uint32_t wm_dbg =3D read_reg(0x45280);
> +		printf("WM_DBG: 0x%08x\n", wm_dbg);
> +		if (wm_dbg & (1 << 31))
> +			printf(" Full maxfifo used\n");
> +		if (wm_dbg & (1 << 30))
> +			printf(" Sprite maxfifo used\n");
> +		printf(" LP used:");
> +		for (i =3D 1; i < 4; i++) {
> +			if (wm_dbg & (1 << (23+i)))
> +				printf(" LP%d", i);
> +		}
> +		/* clear the sticky bits */
> +		write_reg(0x45280, wm_dbg);
> +	}
>  }
>  =

>  static void vlv_wm_dump(void)
> -- =

> 2.26.3
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
