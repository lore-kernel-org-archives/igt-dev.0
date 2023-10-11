Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7FC10E3F6
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 03:23:22 +0000 (UTC)
Message-ID: <7e27612a-bfd1-eb04-8328-8b872d6e776c@intel.com>
Date: Wed, 11 Oct 2023 08:52:53 +0530
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231010192752.281778-1-mohammed.thasleem@intel.com>
 <20231010192752.281778-3-mohammed.thasleem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231010192752.281778-3-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 2/2] tests/kms_lease: Add wrapper to create
 lease and store mcl.fd
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

Hi,

Overall the patch looks good to me now. Will wait for the CI results for 
this subtest before rb'ing.

On 10/11/2023 12:57 AM, Mohammed Thasleem wrote:
> Add wrapper to create_lease and store mcl.fd and to all
> required subtests.

"and to all required subtests"?

Could you please make this more clear.

>
> v2: -Add wrapper to create lease and store mcl.fd. (Ankit)
>      -Update terminate lease.
> v3: Add wrapper to all required subtests. (Ankit)
> v4: -Update create_lease. (Karthik)
> v5: Use lease fd instead mcl.fd for display dependent tests.
> v6: Replace all _create_lease calls with create_lease. (Karthik)

Nit: Please keep the version history comments uniform. Few have have 
'-', while others don't. I think we can remove it. Also few lines have 
mention has to whose review feedback is being addressed and few don't. 
(Same in patch 1). Please make this uniform.

Thanks,
Karthik.B.S
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_lease.c | 85 ++++++++++++++++++++++++-----------------------
>   1 file changed, 43 insertions(+), 42 deletions(-)
>
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 44aa51362..a704601f5 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -280,7 +280,7 @@ static void cleanup_crtc(lease_t *lease, igt_output_t *output)
>   	igt_display_commit(display);
>   }
>   
> -static int create_lease(int fd, struct drm_mode_create_lease *mcl)
> +static int _create_lease(int fd, struct drm_mode_create_lease *mcl)
>   {
>   	int err = 0;
>   
> @@ -289,6 +289,17 @@ static int create_lease(int fd, struct drm_mode_create_lease *mcl)
>   	return err;
>   }
>   
> +static int create_lease(int fd, struct drm_mode_create_lease *mcl, int *lease_fd)
> +{
> +	int ret;
> +
> +	ret = _create_lease(fd, mcl);
> +
> +	if (lease_fd != NULL)
> +		*lease_fd = mcl->fd;
> +	return ret;
> +}
> +
>   static int revoke_lease(int fd, struct drm_mode_revoke_lease *mrl)
>   {
>   	int err = 0;
> @@ -331,12 +342,11 @@ static int make_lease(data_t *data)
>   	/* We use universal planes, must add the primary plane */
>   	object_ids[mcl.object_count++] = data->plane_id;
>   
> -	ret = create_lease(data->master.fd, &mcl);
> +	ret = create_lease(data->master.fd, &mcl, &data->lease.fd);
>   
>   	if (ret)
>   		return ret;
>   
> -	data->lease.fd = mcl.fd;
>   	data->lease.lessee_id = mcl.lessee_id;
>   	return 0;
>   }
> @@ -393,8 +403,7 @@ static void empty_lease(data_t *data)
>   {
>   	struct drm_mode_create_lease mcl = {0};
>   
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
> -	data->lease.fd = mcl.fd;
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, &data->lease.fd), 0);
>   }
>   
>   static void page_flip_implicit_plane(data_t *data)
> @@ -426,8 +435,7 @@ static void page_flip_implicit_plane(data_t *data)
>   	object_ids[mcl.object_count++] = data->crtc_id;
>   
>   	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
> -	do_or_die(create_lease(data->master.fd, &mcl));
> -	data->lease.fd = mcl.fd;
> +	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
>   	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
>   
>   	/* Set a mode on the leased output */
> @@ -449,8 +457,7 @@ static void page_flip_implicit_plane(data_t *data)
>   	close(data->lease.fd);
>   
>   	object_ids[mcl.object_count++] = wrong_plane_id;
> -	do_or_die(create_lease(data->master.fd, &mcl));
> -	data->lease.fd = mcl.fd;
> +	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
>   
>   	igt_wait_for_vblank(data->master.fd,
>   			display->pipes[pipe].crtc_offset);
> @@ -496,8 +503,7 @@ static void setcrtc_implicit_plane(data_t *data)
>   	object_ids[mcl.object_count++] = data->crtc_id;
>   
>   	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
> -	do_or_die(create_lease(data->master.fd, &mcl));
> -	data->lease.fd = mcl.fd;
> +	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
>   	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
>   
>   	/*
> @@ -521,9 +527,7 @@ static void setcrtc_implicit_plane(data_t *data)
>   	igt_assert_eq(ret_mcl, 0);
>   
>   	object_ids[mcl.object_count++] = wrong_plane_id;
> -	do_or_die(create_lease(data->master.fd, &mcl));
> -	data->lease.fd = mcl.fd;
> -
> +	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
>   	igt_assert_eq(drmModeSetCrtc(data->lease.fd, data->crtc_id, -1,
>   				     0, 0, object_ids, 1, mode),
>   		      -EACCES);
> @@ -548,8 +552,7 @@ static void cursor_implicit_plane(data_t *data)
>   	object_ids[mcl.object_count++] = data->crtc_id;
>   
>   	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
> -	do_or_die(create_lease(data->master.fd, &mcl));
> -	data->lease.fd = mcl.fd;
> +	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
>   	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
>   
>   	/* Set a mode on the leased output */
> @@ -562,8 +565,7 @@ static void cursor_implicit_plane(data_t *data)
>   
>   	/* primary plane is never the cursor */
>   	object_ids[mcl.object_count++] = data->plane_id;
> -	do_or_die(create_lease(data->master.fd, &mcl));
> -	data->lease.fd = mcl.fd;
> +	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
>   
>   	igt_assert_eq(drmModeSetCursor(data->lease.fd, data->crtc_id, 0, 0, 0),
>   		      -EACCES);
> @@ -624,8 +626,7 @@ static void atomic_implicit_crtc(data_t *data)
>   	drmModeFreeObjectProperties(props);
>   	igt_assert(crtc_id_prop);
>   
> -	do_or_die(create_lease(data->master.fd, &mcl));
> -	data->lease.fd = mcl.fd;
> +	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
>   	do_or_die(drmSetClientCap(data->lease.fd, DRM_CLIENT_CAP_ATOMIC, 1));
>   
>   	/* check CRTC_ID property on the plane */
> @@ -952,76 +953,76 @@ static void invalid_create_leases(data_t *data)
>   
>   	/* NULL array pointer */
>   	mcl.object_count = 1;
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), -EFAULT);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EFAULT);
>   
>   	/* nil object */
>   	object_ids[0] = 0;
>   	mcl.object_ids = (uint64_t) (uintptr_t) object_ids;
>   	mcl.object_count = 1;
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), -ENOENT);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -ENOENT);
>   
>   	/* no crtc, non-universal_plane */
>   	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
>   	object_ids[0] = data->master.display.outputs[0].id;
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EINVAL);
>   
>   	/* no connector, non-universal_plane */
>   	object_ids[0] = data->master.display.pipes[0].crtc_id;
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EINVAL);
>   
>   	/* sanity check */
>   	object_ids[0] = data->master.display.pipes[0].crtc_id;
>   	object_ids[1] = data->master.display.outputs[0].id;
>   	mcl.object_count = 2;
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), 0);
>   	close(mcl.fd);
>   
>   	/* no plane, universal planes */
>   	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EINVAL);
>   
>   	/* sanity check */
>   	object_ids[2] = igt_pipe_get_plane_type(&data->master.display.pipes[0],
>   						DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
>   	mcl.object_count = 3;
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), 0);
>   	close(mcl.fd);
>   
>   	/* array overflow, do a small scan around overflow sizes */
>   	for (int i = 1; i <= 4; i++) {
>   		mcl.object_count = UINT32_MAX / sizeof(object_ids[0]) + i;
> -		igt_assert_eq(create_lease(data->master.fd, &mcl), -ENOMEM);
> +		igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -ENOMEM);
>   	}
>   
>   	/* sanity check */
>   	mcl.object_count = 3;
>   	mcl.flags = O_CLOEXEC | O_NONBLOCK;
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), 0);
>   	close(mcl.fd);
>   
>   	/* invalid flags */
>   	mcl.flags = -1;
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EINVAL);
>   
>   	/* no subleasing */
>   	mcl.object_count = 3;
>   	mcl.flags = 0;
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), 0);
>   	tmp_fd = mcl.fd;
> -	igt_assert_eq(create_lease(tmp_fd, &mcl), -EINVAL);
> +	igt_assert_eq(create_lease(tmp_fd, &mcl, NULL), -EINVAL);
>   	close(tmp_fd);
>   
>   	/* no double-leasing */
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), 0);
>   	tmp_fd = mcl.fd;
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), -EBUSY);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EBUSY);
>   	close(tmp_fd);
>   
>   	/* no double leasing */
>   	object_ids[3] = object_ids[2];
>   	mcl.object_count = 4;
>   	/* Note: the ENOSPC is from idr double-insertion failing */
> -	ret = create_lease(data->master.fd, &mcl);
> +	ret = create_lease(data->master.fd, &mcl, NULL);
>   	assert_double_id_err(ret);
>   
>   	/* no encoder leasing */
> @@ -1029,7 +1030,7 @@ static void invalid_create_leases(data_t *data)
>   	igt_assert(resources);
>   	igt_assert(resources->count_encoders > 0);
>   	object_ids[3] = resources->encoders[0];
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EINVAL);
>   	drmModeFreeResources(resources);
>   }
>   
> @@ -1120,7 +1121,7 @@ static void possible_crtcs_filtering(data_t *data)
>   		object_ids[mcl.object_count - 1] =
>   			resources->crtcs[i];
>   
> -		igt_assert_eq(create_lease(master_fd, &mcl), 0);
> +		igt_assert_eq(create_lease(master_fd, &mcl, NULL), 0);
>   		lease_fd = mcl.fd;
>   
>   		drmSetClientCap(lease_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> @@ -1154,7 +1155,7 @@ static int _create_simple_lease(int master_fd, data_t *data, int expected_ret)
>   	mcl.object_count = 3;
>   	mcl.flags = 0;
>   
> -	igt_assert_eq(create_lease(master_fd, &mcl), expected_ret);
> +	igt_assert_eq(create_lease(master_fd, &mcl, NULL), expected_ret);
>   
>   	return expected_ret == 0 ? mcl.fd : 0;
>   }
> @@ -1248,13 +1249,13 @@ static void implicit_plane_lease(data_t *data)
>   	mcl.flags = 0;
>   
>   	/* sanity check */
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), 0);
>   	close(mcl.fd);
>   	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
>   
>   	/* non universal plane automatically adds primary/cursor plane */
>   	mcl.object_count = 2;
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
> +	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), 0);
>   
>   	mgl.pad = 0;
>   	mgl.count_objects = 0;
> @@ -1268,12 +1269,12 @@ static void implicit_plane_lease(data_t *data)
>   	/* check that implicit lease doesn't lead to confusion when
>   	 * explicitly adding primary plane */
>   	mcl.object_count = 3;
> -	ret = create_lease(data->master.fd, &mcl);
> +	ret = create_lease(data->master.fd, &mcl, NULL);
>   	assert_double_id_err(ret);
>   
>   	/* same for the cursor */
>   	object_ids[2] = cursor_id;
> -	ret = create_lease(data->master.fd, &mcl);
> +	ret = create_lease(data->master.fd, &mcl, NULL);
>   	assert_double_id_err(ret);
>   
>   	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
