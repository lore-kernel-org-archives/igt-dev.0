Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABAEC021A4
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 17:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D19110ED24;
	Fri, 14 Feb 2025 17:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="a5parFJc";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119EF10ED24
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 17:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HuZ1L8aQPsimOxpe/vMtjwk8erj/AMJBDWPvY7tO5kk=; b=a5parFJc5LB/1e2Kq9FB5XObpQ
 Xebr1ZiSBlRQX4j55sjPQwYc6G339ZVTbPDk63TMli+Wlyagf9vHf6H/FB/0gUe9sx4APxooMAw1c
 fVKQi3PGzn5vP2Q6nmgKSwUlnb6a7x9M5JL0OCZquHH8uDZEVfWIym3EO3yJJcRNBTuMt2OiPB9ZI
 qQTKYFy58uEl+R//qtlyD/GNRMJ2xIfU3hIBM2LBLHuHaUaoLIS9VmARTDYOQ1FuzLUlgSNcj15Qe
 cPF/vm3lxfvzPHOjiuEnkP+z8CeA0uJPUiqnjvjTA34KxOfGMFQAwaJEATj8JIu+QES2NFmihDOI1
 tK2G3FsQ==;
Received: from [191.204.194.148] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tizdN-001tyR-8Y; Fri, 14 Feb 2025 18:37:55 +0100
Message-ID: <2229131e-d01d-499f-bf18-c6538a2a60d5@igalia.com>
Date: Fri, 14 Feb 2025 14:37:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/kms_async_flips: Create subtest for overlay
 planes
To: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: kernel-dev@igalia.com
References: <20241216202427.76168-1-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20241216202427.76168-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi all,

Em 16/12/2024 17:24, André Almeida escreveu:
> amdgpu can perform async flips in overlay planes as well, so create a
> test for that.
> 

The kernel part has been merged, so this test can be merged too:

https://lore.kernel.org/lkml/173948734065.719858.7405160715916126757.b4-ty@linaro.org/

> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v2: Add test description for GitLab compilation
> ---
>   tests/kms_async_flips.c | 45 +++++++++++++++++++++++++++++++++++++----
>   1 file changed, 41 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 4a72be7b5..dd0907d50 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -89,6 +89,9 @@
>    *
>    * SUBTEST: async-flip-suspend-resume
>    * Description: Verify the async flip functionality with suspend and resume cycle
> + *
> + * SUBTEST: overlay-atomic
> + * Description: Verify overlay planes with async flips in atomic API
>    */
>   
>   #define CURSOR_POS 128
> @@ -109,12 +112,14 @@ typedef struct {
>   	uint32_t crtc_id;
>   	uint32_t refresh_rate;
>   	struct igt_fb bufs[NUM_FBS];
> +	struct igt_fb bufs_overlay[NUM_FBS];
>   	igt_display_t display;
>   	igt_output_t *output;
>   	unsigned long flip_timestamp_us;
>   	double flip_interval;
>   	uint64_t modifier;
>   	igt_plane_t *plane;
> +	igt_plane_t *overlay_plane;
>   	igt_pipe_crc_t *pipe_crc;
>   	igt_crc_t ref_crc;
>   	int flip_count;
> @@ -126,6 +131,7 @@ typedef struct {
>   	bool allow_fail;
>   	struct buf_ops *bops;
>   	bool atomic_path;
> +	bool overlay_path;
>   } data_t;
>   
>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
> @@ -226,6 +232,8 @@ static void test_init(data_t *data)
>   	igt_output_set_pipe(data->output, data->pipe);
>   
>   	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +	if (data->overlay_path)
> +		data->overlay_plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_OVERLAY);
>   }
>   
>   static void test_init_fbs(data_t *data)
> @@ -246,16 +254,27 @@ static void test_init_fbs(data_t *data)
>   		prev_modifier = data->modifier;
>   
>   		if (data->bufs[0].fb_id) {
> -			for (i = 0; i < NUM_FBS; i++)
> +			for (i = 0; i < NUM_FBS; i++) {
>   				igt_remove_fb(data->drm_fd, &data->bufs[i]);
> +				if (data->overlay_path)
> +					igt_remove_fb(data->drm_fd, &data->bufs_overlay[i]);
> +			}
>   		}
>   
> -		for (i = 0; i < NUM_FBS; i++)
> +		for (i = 0; i < NUM_FBS; i++) {
>   			make_fb(data, &data->bufs[i], width, height, i);
> +			if (data->overlay_path)
> +				make_fb(data, &data->bufs_overlay[i], width, height, i);
> +		}
>   	}
>   
>   	igt_plane_set_fb(data->plane, &data->bufs[0]);
>   	igt_plane_set_size(data->plane, width, height);
> +
> +	if (data->overlay_path) {
> +		igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
> +		igt_plane_set_size(data->overlay_plane, width, height);
> +	}
>   }
>   
>   static bool async_flip_needs_extra_frame(data_t *data)
> @@ -283,12 +302,17 @@ static bool async_flip_needs_extra_frame(data_t *data)
>   static int perform_flip(data_t *data, int frame, int flags)
>   {
>   	int ret;
> +	igt_plane_t *plane;
> +	struct igt_fb *bufs;
> +
> +	plane = data->overlay_path ? data->overlay_plane : data->plane;
> +	bufs = data->overlay_path ? data->bufs_overlay : data->bufs;
>   
>   	if (!data->atomic_path) {
>   		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -				      data->bufs[frame % NUM_FBS].fb_id, flags, data);
> +				     bufs[frame % NUM_FBS].fb_id, flags, data);
>   	} else {
> -		igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
> +		igt_plane_set_fb(plane, &data->bufs[frame % NUM_FBS]);
>   		ret = igt_display_try_commit_atomic(&data->display, flags, data);
>   	}
>   
> @@ -772,6 +796,7 @@ igt_main
>   		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
>   			data.alternate_sync_async = false;
>   			data.atomic_path = false;
> +			data.overlay_path = false;
>   			if (is_intel_device(data.drm_fd))
>   				run_test_with_modifiers(&data, test_async_flip);
>   			else
> @@ -783,6 +808,7 @@ igt_main
>   		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
>   			data.alternate_sync_async = false;
>   			data.atomic_path = true;
> +			data.overlay_path = false;
>   			if (is_intel_device(data.drm_fd))
>   				run_test_with_modifiers(&data, test_async_flip);
>   			else
> @@ -793,6 +819,7 @@ igt_main
>   		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>   			data.alternate_sync_async = true;
>   			data.atomic_path = false;
> +			data.overlay_path = false;
>   			run_test(&data, test_async_flip);
>   		}
>   
> @@ -800,7 +827,17 @@ igt_main
>   		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
>   			data.alternate_sync_async = true;
>   			data.atomic_path = true;
> +			data.overlay_path = false;
> +			run_test(&data, test_async_flip);
> +		}
> +
> +		igt_describe("Verify overlay planes with async flips in atomic API");
> +		igt_subtest_with_dynamic("overlay-atomic") {
> +			igt_require(is_amdgpu_device(data.drm_fd));
> +			data.atomic_path = true;
> +			data.overlay_path = true;
>   			run_test(&data, test_async_flip);
> +			data.overlay_path = false;
>   		}
>   
>   		igt_describe("Verify that the async flip timestamp does not "

