Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF2610E9E3
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Feb 2023 14:36:01 +0000 (UTC)
Date: Wed, 22 Feb 2023 15:35:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230222143557.qwh5oj57uljzw4lq@kamilkon-desk1>
References: <20230222104806.4817-1-swati2.sharma@intel.com>
 <20230222104806.4817-3-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230222104806.4817-3-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/kms_hdr: Add negative test
 to enforce HDR on non-HDR panel
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

On 2023-02-22 at 16:18:06 +0530, Swati Sharma wrote:
> Negative test is added to ensure HDR is not enabled on
> a non-HDR panel.
> Commit/modeset won't fail. However, in dmesg we can find
> 
> [drm:drm_hdmi_infoframe_set_hdr_metadata [drm_display_helper]]
> EOTF Not Supported
> 
> v2: -fixed nitpicks (Kamil)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_hdr.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 63b03089b..901b1da78 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -51,6 +51,7 @@ enum {
>  	TEST_SUSPEND = 1 << 2,
>  	TEST_SWAP = 1 << 3,
>  	TEST_INVALID_METADATA_SIZES = 1 << 4,
> +	TEST_INVALID_HDR = 1 << 5,
>  };
>  
>  /* BPC connector state. */
> @@ -414,6 +415,10 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
>  	set_hdr_output_metadata(data, &hdr);
>  	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (flags & TEST_INVALID_HDR) {
> +		igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"EOTF Not Supported\""), 0);
> +		goto cleanup;
> +	}
>  	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
>  
>  	/* Verify that the CRC are equal after DPMS or suspend. */
> @@ -429,6 +434,7 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
>  
>  	igt_assert_crc_equal(&ref_crc, &new_crc);
>  
> +cleanup:
>  	test_fini(data);
>  	igt_remove_fb(data->fd, &afb);
>  }
> @@ -568,7 +574,11 @@ static void test_hdr(data_t *data, uint32_t flags)
>  		if (!has_max_bpc(output) || !has_hdr(output))
>  			continue;
>  
> -		if (!is_panel_hdr(data, output))
> +		/* For negative test, panel should be non-hdr. */
> +		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output))
> +			continue;
> +
> +		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output))
>  			continue;
>  
>  		if (igt_get_output_max_bpc(data->fd, output->name) < 10)
> @@ -590,7 +600,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>  
>  				igt_dynamic_f("pipe-%s-%s",
>  					      kmstest_pipe_name(pipe), output->name) {
> -					if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
> +					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND | TEST_INVALID_HDR))
>  						test_static_toggle(data, pipe, output, flags);
>  					if (flags & TEST_SWAP)
>  						test_static_swap(data, pipe, output);
> @@ -648,6 +658,10 @@ igt_main
>  	igt_subtest_with_dynamic("invalid-metadata-sizes")
>  		test_hdr(&data, TEST_INVALID_METADATA_SIZES);
>  
> +	igt_describe("Test to ensure HDR is not enabled on non-HDR panel");
> +	igt_subtest_with_dynamic("invalid-hdr")
> +		test_hdr(&data, TEST_INVALID_HDR);
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		close(data.fd);
> -- 
> 2.25.1
> 
