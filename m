Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C5C8930C
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Mar 2021 23:51:32 +0000 (UTC)
Date: Mon, 1 Mar 2021 15:57:10 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210301235710.GA8065@labuser-Z97X-UD5H>
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
 <20210301203747.7177-8-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301203747.7177-8-manasi.d.navare@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 07/14] lib: Add transcoder VRR registers
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 12:37:40PM -0800, Manasi Navare wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Add definitions for the transcoder VRR registers.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Registers look good,

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  lib/intel_reg.h | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> =

> diff --git a/lib/intel_reg.h b/lib/intel_reg.h
> index 7b543109..d5017f3d 100644
> --- a/lib/intel_reg.h
> +++ b/lib/intel_reg.h
> @@ -880,6 +880,43 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWAR=
E.
>  #define VSYNC_EDP	0x6F014
>  #define VSYNCSHIFT_EDP	0x6F028
>  =

> +#define TRANS_VRR_CTL_A                0x60420
> +#define TRANS_VRR_CTL_B                0x61420
> +#define TRANS_VRR_CTL_C                0x62420
> +#define TRANS_VRR_CTL_D                0x63420
> +#define TRANS_VRR_VMAX_A               0x60424
> +#define TRANS_VRR_VMAX_B               0x61424
> +#define TRANS_VRR_VMAX_C               0x62424
> +#define TRANS_VRR_VMAX_D               0x63424
> +#define TRANS_VRR_VMIN_A               0x60434
> +#define TRANS_VRR_VMIN_B               0x61434
> +#define TRANS_VRR_VMIN_C               0x62434
> +#define TRANS_VRR_VMIN_D               0x63434
> +#define TRANS_VRR_VMAXSHIFT_A          0x60428
> +#define TRANS_VRR_VMAXSHIFT_B          0x61428
> +#define TRANS_VRR_VMAXSHIFT_C          0x62428
> +#define TRANS_VRR_VMAXSHIFT_D          0x63428
> +#define TRANS_VRR_STATUS_A             0x6042C
> +#define TRANS_VRR_STATUS_B             0x6142C
> +#define TRANS_VRR_STATUS_C             0x6242C
> +#define TRANS_VRR_STATUS_D             0x6342C
> +#define TRANS_VRR_VTOTAL_PREV_A        0x60480
> +#define TRANS_VRR_VTOTAL_PREV_B        0x61480
> +#define TRANS_VRR_VTOTAL_PREV_C        0x62480
> +#define TRANS_VRR_VTOTAL_PREV_D        0x63480
> +#define TRANS_VRR_FLIPLINE_A           0x60438
> +#define TRANS_VRR_FLIPLINE_B           0x61438
> +#define TRANS_VRR_FLIPLINE_C           0x62438
> +#define TRANS_VRR_FLIPLINE_D           0x63438
> +#define TRANS_VRR_STATUS2_A            0x6043C
> +#define TRANS_VRR_STATUS2_B            0x6143C
> +#define TRANS_VRR_STATUS2_C            0x6243C
> +#define TRANS_VRR_STATUS2_D            0x6343C
> +#define TRANS_PUSH_A                   0x60A70
> +#define TRANS_PUSH_B                   0x61A70
> +#define TRANS_PUSH_C                   0x62A70
> +#define TRANS_PUSH_D                   0x63A70
> +
>  #define PP_STATUS	0x61200
>  # define PP_ON					(1 << 31)
>  /*
> -- =

> 2.19.1
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
