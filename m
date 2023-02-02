Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3BC10E163
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Feb 2023 11:38:31 +0000 (UTC)
Message-ID: <51236b7b-3753-cb41-1a4f-b62e0d2875f2@intel.com>
Date: Thu, 2 Feb 2023 17:08:13 +0530
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230130094701.111985-1-mohammed.thasleem@intel.com>
 <20230201101229.143115-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230201101229.143115-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_lease: close mcl.fd when
 drmModeSetCrtc fails
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


On 2/1/2023 3:42 PM, Mohammed Thasleem wrote:
> Close mcl.fd even when drmModeSetCrtc retuns fail.
> This will unblock the resources, so that test can
> continue to execute on another panels.
>
> v2: Removed if loop and updated the description. (Karthik)
>
> v3: Added igt_assert_eq for both master fd and mcl fd. (Karthik)
>
> v4: Minor updates in description. (Karthik)
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_lease.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 67e8d3be..6bd5bc15 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -317,6 +317,7 @@ static void setcrtc_implicit_plane(data_t *data)
>   	struct drm_mode_create_lease mcl;
>   	drmModePlaneRes *plane_resources;
>   	uint32_t wrong_plane_id = 0;
> +	int ret = 0, ret_mcl = 0;
>   	igt_output_t *output =
>   		connector_id_to_output(&data->master.display,
>   				       data->connector_id);
> @@ -349,11 +350,13 @@ static void setcrtc_implicit_plane(data_t *data)
>   	igt_assert_eq(0, prepare_crtc(&data->master, data));
>   
>   	/* sanity check */
> -	do_or_die(drmModeSetCrtc(data->master.fd, data->crtc_id, -1,
> -				 0, 0, object_ids, 1, mode));
> -	do_or_die(drmModeSetCrtc(mcl.fd, data->crtc_id, -1,
> -				 0, 0, object_ids, 1, mode));
> +	ret = drmModeSetCrtc(data->master.fd, data->crtc_id, -1,
> +			     0, 0, object_ids, 1, mode);
> +	ret_mcl = drmModeSetCrtc(mcl.fd, data->crtc_id, -1,
> +				 0, 0, object_ids, 1, mode);
>   	close(mcl.fd);
> +	igt_assert_eq(ret, 0);
> +	igt_assert_eq(ret_mcl, 0);
>   
>   	object_ids[mcl.object_count++] = wrong_plane_id;
>   	do_or_die(create_lease(data->master.fd, &mcl));
