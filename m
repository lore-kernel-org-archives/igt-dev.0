Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9210810E121
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 23:11:26 +0000 (UTC)
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Thu, 23 Mar 2023 23:11:06 +0000
Message-ID: <DM4PR11MB5971D04B390A3AFDC7E66C8F87879@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230323161808.1439499-1-imre.deak@intel.com>
 <20230323161808.1439499-2-imre.deak@intel.com>
In-Reply-To: <20230323161808.1439499-2-imre.deak@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_dp_aux_dev: Treat ENXIO
 as a sink detect error
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
> Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_dp_aux_dev: Treat ENXIO as=
 a
> sink detect error
>=20
> The Nouveau/gm200 and the i915 drivers' AUX handlers return -ENXIO if
> there was no sink detected. The other drivers don't use this error code
> in the same handler, so assume this error always means a sink detect
> error.
>=20
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  tests/kms_dp_aux_dev.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> index 86e111bf2..69edc1585 100644
> --- a/tests/kms_dp_aux_dev.c
> +++ b/tests/kms_dp_aux_dev.c
> @@ -46,6 +46,7 @@ static bool sink_detect_error(int drm_fd, uint32_t
> connector_id, int error_code)
>  {
>  	switch (error_code) {
>  	case ETIMEDOUT:
> +	case ENXIO:
>  		return true;
>  	case EIO:
>  		return is_mst_connector(drm_fd, connector_id) ||
> --
> 2.37.1
