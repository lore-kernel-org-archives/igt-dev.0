Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3388510E8AE
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jan 2023 06:34:56 +0000 (UTC)
Message-ID: <ef066db6-395e-5c68-9a15-bd2089ea825c@intel.com>
Date: Thu, 19 Jan 2023 12:04:43 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230117080507.127924-1-mohammed.thasleem@intel.com>
 <20230118073339.141643-1-mohammed.thasleem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230118073339.141643-1-mohammed.thasleem@intel.com>
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


On 1/18/2023 1:03 PM, Mohammed Thasleem wrote:
> Close mcl.fd when drmModeSetCrtc retuns fail and it will
> unblock the resources so that test continue execution on
> another panels.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_lease.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 67e8d3be..c870bfd1 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -317,6 +317,7 @@ static void setcrtc_implicit_plane(data_t *data)
>   	struct drm_mode_create_lease mcl;
>   	drmModePlaneRes *plane_resources;
>   	uint32_t wrong_plane_id = 0;
> +	int ret = 0;
>   	igt_output_t *output =
>   		connector_id_to_output(&data->master.display,
>   				       data->connector_id);
> @@ -351,9 +352,10 @@ static void setcrtc_implicit_plane(data_t *data)
>   	/* sanity check */
>   	do_or_die(drmModeSetCrtc(data->master.fd, data->crtc_id, -1,
>   				 0, 0, object_ids, 1, mode));

If we've a failure in this check, will this not affect the following 
subtests? Might lead to similar failure?

Thanks,
Karthik.B.S
> -	do_or_die(drmModeSetCrtc(mcl.fd, data->crtc_id, -1,
> -				 0, 0, object_ids, 1, mode));
> +	ret = drmModeSetCrtc(mcl.fd, data->crtc_id, -1, 0, 0, object_ids,
> +			     1, mode);
>   	close(mcl.fd);
> +	igt_assert_eq(ret, 0);
>   
>   	object_ids[mcl.object_count++] = wrong_plane_id;
>   	do_or_die(create_lease(data->master.fd, &mcl));
