Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FF36EE41
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 09:33:32 +0000 (UTC)
Date: Fri, 14 May 2021 12:36:49 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20210514093649.GB8606@intel.com>
References: <20210414022754.31710-1-ville.syrjala@linux.intel.com>
 <20210414022754.31710-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414022754.31710-3-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] tools/intel_watermark: Use
 WM_SR_CNT to observe SR residency
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

On Wed, Apr 14, 2021 at 05:27:48AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> WM_SR_CNT (exists since HSW) has some kind of SR residency counter,
> which is nice for checking whether the watermarks work decently.
> Let's use it.

As I understood this is just somekind of a counter which indicates,
how long we kept memory awake. =


Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@gmail.com>

> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_watermark.c | 53 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> =

> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index bc2a46232772..39aaf9fbe055 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -35,6 +35,7 @@
>  =

>  static uint32_t display_base;
>  static uint32_t devid;
> +static unsigned int sr_sleep;
>  =

>  static uint32_t read_reg(uint32_t addr)
>  {
> @@ -240,6 +241,22 @@ static const char *skl_nv12_buf_cfg_reg_name(int pip=
e, int plane)
>  	return reg_name;
>  }
>  =

> +static void hsw_wm_sr_cnt(void)
> +{
> +	if (sr_sleep) {
> +		uint32_t pre, post;
> +
> +		pre =3D read_reg(0x45264);
> +		sleep(sr_sleep);
> +		post =3D read_reg(0x45264);
> +
> +		printf("WM_SR_CNT: 0x%08x->0x%08x\n", pre, post);
> +		printf("SR residency: %u%%\n", ((post - pre) * 8 / (sr_sleep * 10000))=
);
> +	} else {
> +		printf("WM_SR_CNT: 0x%08x\n", read_reg(0x45264));
> +	}
> +}
> +
>  static void skl_wm_dump(void)
>  {
>  	struct intel_mmio_data mmio_data;
> @@ -462,6 +479,8 @@ static void skl_wm_dump(void)
>  	printf("* plane watermark enabled\n");
>  	printf("(x) line watermark if enabled\n");
>  =

> +	hsw_wm_sr_cnt();
> +
>  	wm_dbg =3D read_reg(0x45280);
>  	printf("WM_DBG: 0x%08x\n", wm_dbg);
>  	printf(" LP used:");
> @@ -627,7 +646,11 @@ static void ilk_wm_dump(void)
>  	       endis(!REG_DECODE1(arb_ctl, 15, 1)));
>  =

>  	if (IS_BROADWELL(devid) || IS_HASWELL(devid)) {
> -		uint32_t wm_dbg =3D read_reg(0x45280);
> +		uint32_t wm_dbg;
> +
> +		hsw_wm_sr_cnt();
> +
> +		wm_dbg =3D read_reg(0x45280);
>  		printf("WM_DBG: 0x%08x\n", wm_dbg);
>  		if (wm_dbg & (1 << 31))
>  			printf(" Full maxfifo used\n");
> @@ -1265,10 +1288,38 @@ static void gen2_wm_dump(void)
>  	}
>  }
>  =

> +static void __attribute__((noreturn)) usage(const char *name)
> +{
> +	fprintf(stderr, "Usage: %s [options]\n"
> +		" -s,--sr-sleep <seconds>\n",
> +		name);
> +	exit(1);
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	devid =3D intel_get_pci_device()->device_id;
>  =

> +	for (;;) {
> +		static const struct option long_options[] =3D {
> +			{ .name =3D "sr-sleep", .has_arg =3D required_argument, },
> +			{}
> +		};
> +
> +		int opt =3D getopt_long(argc, argv, "s:", long_options, NULL);
> +		if (opt =3D=3D -1)
> +			break;
> +
> +		switch (opt) {
> +		case 's':
> +			sr_sleep =3D atoi(optarg);
> +			break;
> +		default:
> +			usage(argv[0]);
> +			break;
> +		}
> +	}
> +
>  	if (intel_gen(devid) >=3D 9) {
>  		skl_wm_dump();
>  	} else if (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid)) {
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
