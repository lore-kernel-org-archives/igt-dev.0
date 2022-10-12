Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FB410E343
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 16:02:44 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
In-Reply-To: <20220907094651.29527-4-ville.syrjala@linux.intel.com>
References: <20220907094651.29527-1-ville.syrjala@linux.intel.com>
 <20220907094651.29527-4-ville.syrjala@linux.intel.com>
Date: Wed, 12 Oct 2022 19:02:19 +0300
Message-ID: <87czaxt4hg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] tools/intel_vbt_decode: Add version
 checks for a lot of child dev fields
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 07 Sep 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Stop decoding most child dev fields if the BDB version
> is too old.

In general I like it, but was wondering about printing something if it's
non-zero in this case. *shrug*. Gets pretty ugly in code though.

BR,
Jani.

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_vbt_decode.c | 90 ++++++++++++++++++++++++----------------
>  1 file changed, 54 insertions(+), 36 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 3bd4d4b70fb3..0af7902c5102 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -948,37 +948,47 @@ static void dump_child_device(struct context *conte=
xt,
>  		printf("\t\tI2C speed: %s (0x%02x)\n",
>  		       i2c_speed(child->i2c_speed), child->i2c_speed);
>=20=20
> -		printf("\t\tDP onboard redriver:\n");
> -		printf("\t\t\tpresent: %s\n",
> -		       YESNO((child->dp_onboard_redriver_present)));
> -		printf("\t\t\tvswing: %s (0x%x)\n",
> -		       dp_vswing(child->dp_onboard_redriver_vswing),
> -		       child->dp_onboard_redriver_vswing);
> -		printf("\t\t\tpre-emphasis: %s (0x%x)\n",
> -		       dp_preemph(child->dp_onboard_redriver_preemph),
> -		       child->dp_onboard_redriver_preemph);
> +		if (context->bdb->version >=3D 158) {
> +			printf("\t\tDP onboard redriver:\n");
> +			printf("\t\t\tpresent: %s\n",
> +			       YESNO((child->dp_onboard_redriver_present)));
> +			printf("\t\t\tvswing: %s (0x%x)\n",
> +			       dp_vswing(child->dp_onboard_redriver_vswing),
> +			       child->dp_onboard_redriver_vswing);
> +			printf("\t\t\tpre-emphasis: %s (0x%x)\n",
> +			       dp_preemph(child->dp_onboard_redriver_preemph),
> +			       child->dp_onboard_redriver_preemph);
>=20=20
> -		printf("\t\tDP ondock redriver:\n");
> -		printf("\t\t\tpresent: %s\n",
> -		       YESNO((child->dp_ondock_redriver_present)));
> -		printf("\t\t\tvswing: %s (0x%x)\n",
> -		       dp_vswing(child->dp_ondock_redriver_vswing),
> -		       child->dp_ondock_redriver_vswing);
> -		printf("\t\t\tpre-emphasis: %s (0x%x)\n",
> -		       dp_preemph(child->dp_ondock_redriver_preemph),
> -		       child->dp_ondock_redriver_preemph);
> +			printf("\t\tDP ondock redriver:\n");
> +			printf("\t\t\tpresent: %s\n",
> +			       YESNO((child->dp_ondock_redriver_present)));
> +			printf("\t\t\tvswing: %s (0x%x)\n",
> +			       dp_vswing(child->dp_ondock_redriver_vswing),
> +			       child->dp_ondock_redriver_vswing);
> +			printf("\t\t\tpre-emphasis: %s (0x%x)\n",
> +			       dp_preemph(child->dp_ondock_redriver_preemph),
> +			       child->dp_ondock_redriver_preemph);
> +		}
>=20=20
> -		dump_hmdi_max_data_rate(child->hdmi_max_data_rate);
> -		printf("\t\tHDMI level shifter value: 0x%02x\n", child->hdmi_level_shi=
fter_value);
> +		if (context->bdb->version >=3D 204)
> +			dump_hmdi_max_data_rate(child->hdmi_max_data_rate);
> +		if (context->bdb->version >=3D 169)
> +			printf("\t\tHDMI level shifter value: 0x%02x\n", child->hdmi_level_sh=
ifter_value);
>=20=20
> -		printf("\t\tOffset to DTD buffer for edidless CHILD: 0x%02x\n", child-=
>dtd_buf_ptr);
> +		if (context->bdb->version >=3D 161)
> +			printf("\t\tOffset to DTD buffer for edidless CHILD: 0x%02x\n", child=
->dtd_buf_ptr);
>=20=20
> -		printf("\t\tDual pipe ganged eDP: %s\n", YESNO(child->ganged_edp));
> -		printf("\t\tCompression method CPS: %s\n", YESNO(child->compression_me=
thod_cps));
> -		printf("\t\tCompression enable: %s\n", YESNO(child->compression_enable=
));
> -		printf("\t\tEdidless EFP: %s\n", YESNO(child->edidless_efp));
> +		if (context->bdb->version >=3D 202)
> +			printf("\t\tDual pipe ganged eDP: %s\n", YESNO(child->ganged_edp));
> +		if (context->bdb->version >=3D 198) {
> +			printf("\t\tCompression method CPS: %s\n", YESNO(child->compression_m=
ethod_cps));
> +			printf("\t\tCompression enable: %s\n", YESNO(child->compression_enabl=
e));
> +		}
> +		if (context->bdb->version >=3D 161)
> +			printf("\t\tEdidless EFP: %s\n", YESNO(child->edidless_efp));
>=20=20
> -		printf("\t\tCompression structure index: %d\n", child->compression_str=
ucture_index);
> +		if (context->bdb->version >=3D 198)
> +			printf("\t\tCompression structure index: %d\n", child->compression_st=
ructure_index);
>=20=20
>  		if (context->bdb->version >=3D 237) {
>  			printf("\t\tHDMI Max FRL rate valid: %s\n",
> @@ -1007,16 +1017,24 @@ static void dump_child_device(struct context *con=
text,
>  	} else {
>  		if (context->bdb->version >=3D 244)
>  			printf("\t\teDP/DP max lane count: X%d\n", child->dp_max_lane_count +=
 1);
> -		printf("\t\tUse VBT vswing/premph table: %s\n", YESNO(child->use_vbt_v=
swing));
> -		printf("\t\tHPD sense invert: %s\n", YESNO(child->hpd_invert));
> -		printf("\t\tIboost enable: %s\n", YESNO(child->iboost));
> -		printf("\t\tOnboard LSPCON: %s\n", YESNO(child->lspcon));
> -		printf("\t\tLane reversal: %s\n", YESNO(child->lane_reversal));
> -		printf("\t\tEFP routed through dock: %s\n", YESNO(child->efp_routed));
> -
> -		printf("\t\tTMDS compatible? %s\n", YESNO(child->tmds_support));
> -		printf("\t\tDP compatible? %s\n", YESNO(child->dp_support));
> -		printf("\t\tHDMI compatible? %s\n", YESNO(child->hdmi_support));
> +		if (context->bdb->version >=3D 218)
> +			printf("\t\tUse VBT vswing/premph table: %s\n", YESNO(child->use_vbt_=
vswing));
> +		if (context->bdb->version >=3D 196) {
> +			printf("\t\tHPD sense invert: %s\n", YESNO(child->hpd_invert));
> +			printf("\t\tIboost enable: %s\n", YESNO(child->iboost));
> +		}
> +		if (context->bdb->version >=3D 192)
> +			printf("\t\tOnboard LSPCON: %s\n", YESNO(child->lspcon));
> +		if (context->bdb->version >=3D 184)
> +			printf("\t\tLane reversal: %s\n", YESNO(child->lane_reversal));
> +		if (context->bdb->version >=3D 158)
> +			printf("\t\tEFP routed through dock: %s\n", YESNO(child->efp_routed));
> +
> +		if (context->bdb->version >=3D 158) {
> +			printf("\t\tTMDS compatible? %s\n", YESNO(child->tmds_support));
> +			printf("\t\tDP compatible? %s\n", YESNO(child->dp_support));
> +			printf("\t\tHDMI compatible? %s\n", YESNO(child->hdmi_support));
> +		}
>=20=20
>  		printf("\t\tAux channel: %s (0x%02x)\n",
>  		       aux_ch(child->aux_channel), child->aux_channel);

--=20
Jani Nikula, Intel Open Source Graphics Center
