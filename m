Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5915DC48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 12:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E288910E9F8;
	Mon,  4 Mar 2024 12:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Avq7RpxN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D7010E9F8
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709554739; x=1741090739;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=g+zHdADq2QpmqzAyZRCi6z3IObF6bdLJ4dHMQX0CIkQ=;
 b=Avq7RpxN4HfHxVs49lYLbX3E278lRsR6tG7sWQtptZtdI+eKb70gV8UO
 jAtOp/KbevFYLlnCwlOz/onWkb7+gArWy8ybhOfp8/lIn/2OYqdMOFowa
 wJLaayAZ0LFAkij8uf33WNmh4jceN6ZS5KkzA2n33HBNz+mVSx5egzzm6
 wOsIiEfuGs4vEvrJfYDRJYimeU6mvzDKaOVkhQrWI/p037GKhMxzhH7uv
 iiSneLf9LTh0Hs01blG+TXlh4wJpUMIoSq8WpcpD8ar2t0fYAHDp/OIFw
 dzsRmiXqSTgmzWds1PjBoR0PSm+Z51J70jXlYlVo1Rv68JJ5D7ZSU3/ez Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7852228"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208,217";a="7852228"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 04:18:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208,217";a="8932422"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.221])
 ([10.94.250.221])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 04:18:57 -0800
Content-Type: multipart/alternative;
 boundary="------------qKXQ5dJ41pqLDRdV8p0s0dY2"
Message-ID: <fb2391b5-9fd6-43f0-a0e6-82aa068fa0d2@linux.intel.com>
Date: Mon, 4 Mar 2024 13:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_pat: verify wb-transient with
 pipe crc
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20240301171618.395851-1-matthew.auld@intel.com>
 <20240301171618.395851-5-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240301171618.395851-5-matthew.auld@intel.com>
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

This is a multi-part message in MIME format.
--------------qKXQ5dJ41pqLDRdV8p0s0dY2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/1/2024 6:16 PM, Matthew Auld wrote:
> On Xe2 using the L3:XD (wb-transient) caching mode, which is intended
> for display use, verify we don't observe display corruption when
> rendering unto the display surface. Transient cache entries should be
> flushed by the time we do the flip, if not we will detect pipe crc
> mismatch vs reference fb.
>
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński<zbigniew.kempczynski@intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/intel/xe_pat.c | 121 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 121 insertions(+)
>
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 6918ebe7e..bee93ac2f 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -10,6 +10,8 @@
>    * Functionality: pat_index
>    */
>   
> +#include <fcntl.h>
> +
>   #include "igt.h"
>   #include "igt_vgem.h"
>   #include "intel_blt.h"
> @@ -722,6 +724,122 @@ static void prime_external_import_coh(void)
>   	drm_close_driver(fd2);
>   }
>   
> +/**
> + * SUBTEST: display-vs-wb-transient
> + * Test category: functionality test
> + * Description: Scanout with dirty L3:XD
> + */
> +static void display_vs_wb_transient(int fd)
> +{
> +	uint16_t pat_index_modes[] = {
> +		0, /* UC (baseline) */
> +		6, /* L3:XD (uncompressed) */
> +	};
> +	uint32_t devid = intel_get_drm_devid(fd);
> +	igt_render_copyfunc_t render_copy = NULL;
> +	igt_crc_t ref_crc = {}, crc = {};
> +	igt_plane_t *primary;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_pipe_crc_t *pipe_crc;
> +	drmModeModeInfoPtr mode;
> +	struct intel_bb *ibb;
> +	struct buf_ops *bops;
> +	struct igt_fb src_fb, dst_fb;
> +	struct intel_buf src, dst;
> +	enum pipe pipe;
> +	int bpp = 32;
> +	int i;
> +
> +	igt_require(intel_get_device_info(devid)->graphics_ver >= 20);
> +
> +	render_copy = igt_get_render_copyfunc(devid);
> +	igt_require(render_copy);
> +	igt_require(xe_has_engine_class(fd, DRM_XE_ENGINE_CLASS_RENDER));
> +
> +	igt_display_require(&display, fd);
> +	igt_display_require_output(&display);
> +	kmstest_set_vt_graphics_mode();
> +
> +	bops = buf_ops_create(fd);
> +	ibb = intel_bb_create(fd, SZ_4K);
> +
> +	for_each_pipe_with_valid_output(&display, pipe, output) {
> +		igt_display_reset(&display);
> +
> +		igt_output_set_pipe(output, pipe);
> +		if (!intel_pipe_output_combo_valid(&display))
> +			continue;
> +
> +		mode = igt_output_get_mode(output);
> +		pipe_crc = igt_pipe_crc_new(fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
> +		break;
> +	}
> +
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_create_fb(fd, mode->hdisplay, mode->vdisplay,
> +		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &src_fb);
> +	igt_draw_fill_fb(fd, &src_fb, 0xFF);
> +
> +	igt_plane_set_fb(primary, &src_fb);
> +	igt_assert_eq(igt_display_commit2(&display, COMMIT_ATOMIC), 0);
> +	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> +
> +	intel_buf_init_full(bops, src_fb.gem_handle, &src, src_fb.width,
> +			    src_fb.height, bpp, 0, I915_TILING_NONE,
> +			    I915_COMPRESSION_NONE, src_fb.size,
> +			    src_fb.strides[0], 0, DEFAULT_PAT_INDEX,
> +			    DEFAULT_MOCS_INDEX);
> +
> +	for (i = 0; i < ARRAY_SIZE(pat_index_modes); i++) {
> +		int fw_handle;
> +
> +		igt_create_fb(fd, mode->hdisplay, mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &dst_fb);
> +
> +		intel_buf_init_full(bops, dst_fb.gem_handle, &dst,
> +				    dst_fb.width, dst_fb.height, bpp, 0,
> +				    I915_TILING_NONE, I915_COMPRESSION_NONE,
> +				    dst_fb.size, dst_fb.strides[0], 0,
> +				    pat_index_modes[i],
> +				    intel_get_deferred_mocs_index(fd));
> +
> +		/* c0 -> c6 might flush caches */
> +		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +		igt_assert(fw_handle >= 0);
> +
> +		render_copy(ibb,
> +			    &src,
> +			    0, 0, dst_fb.width, dst_fb.height,
> +			    &dst,
> +			    0, 0);
> +		intel_bb_sync(ibb);
> +
> +		/*
> +		 * Display engine is not coherent with GPU/CPU caches, however
> +		 * with new L3:XD caching mode, the GPU cache entries marked as
> +		 * transient should be automatically flushed by the time we do
> +		 * the flip.
> +		 */
> +
> +		igt_plane_set_fb(primary, &dst_fb);
> +		igt_assert_eq(igt_display_commit2(&display, COMMIT_ATOMIC), 0);
> +		igt_pipe_crc_collect_crc(pipe_crc, &crc);
> +
> +		igt_assert_crc_equal(&crc, &ref_crc);
> +
> +		intel_bb_reset(ibb, false);
> +
> +		intel_buf_close(dst.bops, &dst);
> +		igt_remove_fb(fd, &dst_fb);
> +		close(fw_handle);
> +	}
> +
> +	igt_remove_fb(fd, &src_fb);
> +	intel_bb_destroy(ibb);
> +}
> +
>   static uint8_t get_pat_idx_uc(int fd, bool *compressed)
>   {
>   	if (compressed)
> @@ -1054,6 +1172,9 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
>   						     ARRAY_SIZE(xe2_pat_index_modes));
>   	}
>   
> +	igt_subtest("display-vs-wb-transient")
> +		display_vs_wb_transient(fd);
> +
>   	igt_fixture
>   		drm_close_driver(fd);
>   }
--------------qKXQ5dJ41pqLDRdV8p0s0dY2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/1/2024 6:16 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240301171618.395851-5-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">On Xe2 using the L3:XD (wb-transient) caching mode, which is intended
for display use, verify we don't observe display corruption when
rendering unto the display surface. Transient cache entries should be
flushed by the time we do the flip, if not we will detect pipe crc
mismatch vs reference fb.

Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Zbigniew Kempczyński <a class="moz-txt-link-rfc2396E" href="mailto:zbigniew.kempczynski@intel.com">&lt;zbigniew.kempczynski@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></pre>
    </blockquote>
    Reviewed-by: <span style="white-space: pre-wrap">Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></span>
    <blockquote type="cite"
      cite="mid:20240301171618.395851-5-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 tests/intel/xe_pat.c | 121 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 6918ebe7e..bee93ac2f 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -10,6 +10,8 @@
  * Functionality: pat_index
  */
 
+#include &lt;fcntl.h&gt;
+
 #include "igt.h"
 #include "igt_vgem.h"
 #include "intel_blt.h"
@@ -722,6 +724,122 @@ static void prime_external_import_coh(void)
 	drm_close_driver(fd2);
 }
 
+/**
+ * SUBTEST: display-vs-wb-transient
+ * Test category: functionality test
+ * Description: Scanout with dirty L3:XD
+ */
+static void display_vs_wb_transient(int fd)
+{
+	uint16_t pat_index_modes[] = {
+		0, /* UC (baseline) */
+		6, /* L3:XD (uncompressed) */
+	};
+	uint32_t devid = intel_get_drm_devid(fd);
+	igt_render_copyfunc_t render_copy = NULL;
+	igt_crc_t ref_crc = {}, crc = {};
+	igt_plane_t *primary;
+	igt_display_t display;
+	igt_output_t *output;
+	igt_pipe_crc_t *pipe_crc;
+	drmModeModeInfoPtr mode;
+	struct intel_bb *ibb;
+	struct buf_ops *bops;
+	struct igt_fb src_fb, dst_fb;
+	struct intel_buf src, dst;
+	enum pipe pipe;
+	int bpp = 32;
+	int i;
+
+	igt_require(intel_get_device_info(devid)-&gt;graphics_ver &gt;= 20);
+
+	render_copy = igt_get_render_copyfunc(devid);
+	igt_require(render_copy);
+	igt_require(xe_has_engine_class(fd, DRM_XE_ENGINE_CLASS_RENDER));
+
+	igt_display_require(&amp;display, fd);
+	igt_display_require_output(&amp;display);
+	kmstest_set_vt_graphics_mode();
+
+	bops = buf_ops_create(fd);
+	ibb = intel_bb_create(fd, SZ_4K);
+
+	for_each_pipe_with_valid_output(&amp;display, pipe, output) {
+		igt_display_reset(&amp;display);
+
+		igt_output_set_pipe(output, pipe);
+		if (!intel_pipe_output_combo_valid(&amp;display))
+			continue;
+
+		mode = igt_output_get_mode(output);
+		pipe_crc = igt_pipe_crc_new(fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+		break;
+	}
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	igt_create_fb(fd, mode-&gt;hdisplay, mode-&gt;vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &amp;src_fb);
+	igt_draw_fill_fb(fd, &amp;src_fb, 0xFF);
+
+	igt_plane_set_fb(primary, &amp;src_fb);
+	igt_assert_eq(igt_display_commit2(&amp;display, COMMIT_ATOMIC), 0);
+	igt_pipe_crc_collect_crc(pipe_crc, &amp;ref_crc);
+
+	intel_buf_init_full(bops, src_fb.gem_handle, &amp;src, src_fb.width,
+			    src_fb.height, bpp, 0, I915_TILING_NONE,
+			    I915_COMPRESSION_NONE, src_fb.size,
+			    src_fb.strides[0], 0, DEFAULT_PAT_INDEX,
+			    DEFAULT_MOCS_INDEX);
+
+	for (i = 0; i &lt; ARRAY_SIZE(pat_index_modes); i++) {
+		int fw_handle;
+
+		igt_create_fb(fd, mode-&gt;hdisplay, mode-&gt;vdisplay,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &amp;dst_fb);
+
+		intel_buf_init_full(bops, dst_fb.gem_handle, &amp;dst,
+				    dst_fb.width, dst_fb.height, bpp, 0,
+				    I915_TILING_NONE, I915_COMPRESSION_NONE,
+				    dst_fb.size, dst_fb.strides[0], 0,
+				    pat_index_modes[i],
+				    intel_get_deferred_mocs_index(fd));
+
+		/* c0 -&gt; c6 might flush caches */
+		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+		igt_assert(fw_handle &gt;= 0);
+
+		render_copy(ibb,
+			    &amp;src,
+			    0, 0, dst_fb.width, dst_fb.height,
+			    &amp;dst,
+			    0, 0);
+		intel_bb_sync(ibb);
+
+		/*
+		 * Display engine is not coherent with GPU/CPU caches, however
+		 * with new L3:XD caching mode, the GPU cache entries marked as
+		 * transient should be automatically flushed by the time we do
+		 * the flip.
+		 */
+
+		igt_plane_set_fb(primary, &amp;dst_fb);
+		igt_assert_eq(igt_display_commit2(&amp;display, COMMIT_ATOMIC), 0);
+		igt_pipe_crc_collect_crc(pipe_crc, &amp;crc);
+
+		igt_assert_crc_equal(&amp;crc, &amp;ref_crc);
+
+		intel_bb_reset(ibb, false);
+
+		intel_buf_close(dst.bops, &amp;dst);
+		igt_remove_fb(fd, &amp;dst_fb);
+		close(fw_handle);
+	}
+
+	igt_remove_fb(fd, &amp;src_fb);
+	intel_bb_destroy(ibb);
+}
+
 static uint8_t get_pat_idx_uc(int fd, bool *compressed)
 {
 	if (compressed)
@@ -1054,6 +1172,9 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
 						     ARRAY_SIZE(xe2_pat_index_modes));
 	}
 
+	igt_subtest("display-vs-wb-transient")
+		display_vs_wb_transient(fd);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
</pre>
    </blockquote>
  </body>
</html>

--------------qKXQ5dJ41pqLDRdV8p0s0dY2--
