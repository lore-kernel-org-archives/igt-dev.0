Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC4810E121
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 23:11:04 +0000 (UTC)
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Thu, 23 Mar 2023 23:10:52 +0000
Message-ID: <DM4PR11MB5971A96FA619A830AED98CF487879@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230323161808.1439499-1-imre.deak@intel.com>
In-Reply-To: <20230323161808.1439499-1-imre.deak@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_dp_aux_dev: Factor out
 helper checking for sink detect errors
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



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Imre D=
eak
> Sent: Thursday, March 23, 2023 9:18 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_dp_aux_dev: Factor out hel=
per
> checking for sink detect errors
>=20
> For clarity, factor out a helper to check if the AUX transfer failed
> due to not detecting the sink being connected.
>=20
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  tests/kms_dp_aux_dev.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> index 850ec8e26..86e111bf2 100644
> --- a/tests/kms_dp_aux_dev.c
> +++ b/tests/kms_dp_aux_dev.c
> @@ -42,6 +42,19 @@ static bool is_mst_connector(int drm_fd, uint32_t
> connector_id)
>  				    NULL, NULL);
>  }
>=20
> +static bool sink_detect_error(int drm_fd, uint32_t connector_id, int
> error_code)
> +{
> +	switch (error_code) {
> +	case ETIMEDOUT:
> +		return true;
> +	case EIO:
> +		return is_mst_connector(drm_fd, connector_id) ||
> +		       is_amdgpu_device(drm_fd);
> +	default:
> +		return false;
> +	};
> +}
> +
>  static bool test(int drm_fd, uint32_t connector_id)
>  {
>  	drmModeConnector *connector;
> @@ -85,9 +98,7 @@ static bool test(int drm_fd, uint32_t connector_id)
>  			 ret > 0 ? "success" : strerror(errno));
>=20
>  		igt_assert(ret =3D=3D sizeof(buf) ||
> -			   errno =3D=3D ETIMEDOUT ||
> -			   (errno =3D=3D EIO && (is_mst_connector(drm_fd,
> connector_id) ||
> -			    is_amdgpu_device(drm_fd))));
> +			   sink_detect_error(drm_fd, connector_id, errno));
>=20
>  		close(fd);
>=20
> --
> 2.37.1
