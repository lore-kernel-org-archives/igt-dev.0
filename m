Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C6110E74B
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 09:31:01 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
In-Reply-To: <20230125054239.26812-1-ville.syrjala@linux.intel.com>
References: <20230125054239.26812-1-ville.syrjala@linux.intel.com>
Date: Wed, 25 Jan 2023 11:30:56 +0200
Message-ID: <87zga755bj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] tools/intel_reg: Simplify negative
 ports
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

On Wed, 25 Jan 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Let's avoid having to type in the explicit negative value for
> all the port enums.
>
> v2: Copy-paste the comment from intel_reg.c (Jani)
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

On the series,

Acked-by: Jani Nikula <jani.nikula@intel.com>



> ---
>  tools/intel_reg_spec.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/tools/intel_reg_spec.h b/tools/intel_reg_spec.h
> index c94c61bab3f8..1a2c5ebd9a58 100644
> --- a/tools/intel_reg_spec.h
> +++ b/tools/intel_reg_spec.h
> @@ -25,10 +25,12 @@
>  #define __INTEL_REG_SPEC_H__
>=20=20
>  enum port_addr {
> +	/* Negative port numbers are not real sideband ports. */
> +	PORT_MMIO =3D -127,
> +	PORT_PORTIO_VGA,	/* see vga reg read/write */
> +	PORT_MMIO_VGA,		/* see vga reg read/write */
> +
>  	PORT_NONE =3D 0,
> -	PORT_MMIO =3D -1,
> -	PORT_PORTIO_VGA =3D -2,	/* see vga reg read/write */
> -	PORT_MMIO_VGA =3D -3,	/* see vga reg read/write */
>=20=20
>  	/* vlv */
>  	PORT_BUNIT =3D 0x03,

--=20
Jani Nikula, Intel Open Source Graphics Center
