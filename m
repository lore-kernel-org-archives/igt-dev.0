Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1046E15E
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2020 19:08:55 +0000 (UTC)
Date: Thu, 15 Oct 2020 22:08:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20201015190852.GN6112@intel.com>
References: <20201012175654.2422295-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012175654.2422295-1-imre.deak@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_dp_aux_dev: Handle AUX failures on
 disconnected MST connectors
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 12, 2020 at 08:56:54PM +0300, Imre Deak wrote:
> The DPCD of an MST connector is read out with a REMOTE_DPCD_READ MST
> request. If the given connector is disconnected this read will result in
> an MST NAK reply and this will be reported as an EIO error to the
> initiator of the AUX read.
> =

> Handle this in the test that attempts to read the DPCD of any exposed
> connector, whether they are connected or not.
> =

> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  tests/kms_dp_aux_dev.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> =

> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> index 4f52434a..39fc2b92 100644
> --- a/tests/kms_dp_aux_dev.c
> +++ b/tests/kms_dp_aux_dev.c
> @@ -34,6 +34,14 @@
>  =

>  IGT_TEST_DESCRIPTION("Test that /dev/drm_dp_aux reads work");
>  =

> +static bool is_mst_connector(int drm_fd, uint32_t connector_id)
> +{
> +	return kmstest_get_property(drm_fd, connector_id,
> +				    DRM_MODE_OBJECT_CONNECTOR,
> +				    "PATH", NULL,
> +				    NULL, NULL);
> +}
> +
>  static bool test(int drm_fd, uint32_t connector_id)
>  {
>  	drmModeConnector *connector;
> @@ -67,10 +75,12 @@ static bool test(int drm_fd, uint32_t connector_id)
>  		igt_assert(fd >=3D 0);
>  =

>  		ret =3D read(fd, buf, sizeof(buf));
> -		igt_assert(ret =3D=3D sizeof(buf) || errno =3D=3D ETIMEDOUT);
> -
>  		igt_info("%s: %s\n", path,
> -			 ret > 0 ? "success" : "timed out");
> +			 ret > 0 ? "success" : strerror(errno));
> +
> +		igt_assert(ret =3D=3D sizeof(buf) ||
> +			   errno =3D=3D ETIMEDOUT ||
> +			   (errno =3D=3D EIO && is_mst_connector(drm_fd, connector_id)));
>  =

>  		close(fd);
>  =

> -- =

> 2.20.1
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
