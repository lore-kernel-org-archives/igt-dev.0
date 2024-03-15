Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4FCC54E67
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 19:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A45112474;
	Fri, 15 Mar 2024 19:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+xlUuUr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2891112474
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 19:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710530135; x=1742066135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WLb/qi9vqPp6Od22qNanG6KEbhqBUEiQX4b2i7RKpZg=;
 b=P+xlUuUr2KU3H4eDNyJjkH1yLHD1rZ3y2FhalQTxxsuKrbQc9VTXCjPx
 k0mEyg8i00UI+2tppVhpk1VgpoBWkHI+1qdjr3DI1Xa9alqf2ww5ybCus
 +xd6Xqy0JSejKVZmAcrN01KHVQlo0c4Qh+D8T+FwoWCz1/wv4gN3E/nhk
 8DQvD3Z3yIrGiOiJTr6dnAucUnfdBaB5RSKeJdEPeYP32Nl2Kf5nZ4tuO
 +JVxqyXMomXW3gDBmZql9bzTgoloSz4HRjzr5JjS2qMBgRmyWPWeJRldK
 cDAIVMElwcTIglOYFahUPL9XxFmPRvQAHdib6zIoeIZ04PLegsDmBKJex A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16064050"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="16064050"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 12:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="827780758"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="827780758"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 15 Mar 2024 12:15:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Mar 2024 21:15:28 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: [PATCH i-g-t 4/5] tests/kms_cursor_crc: Test the SIZE_HINTS property
Date: Fri, 15 Mar 2024 21:15:04 +0200
Message-ID: <20240315191505.27620-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
References: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make sure the driver accepts all the sizes declared in the
plane's SIZE_HINTS property.

TODO: Actually test that each reported size works fully?
      Would need a bunch of restructuring of the test,
      and for the moment i915 is the only driver that
      supports SIZE_HINTS and it's already >100% covered
      by the existing tests. So I'll leave this for the
      next guy whose driver has different needs...

Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_cursor_crc.c | 63 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 38b354972afd..6543e09d3ebb 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -55,6 +55,10 @@
  * Description: Check random placement of a cursor with suspend.
  * Functionality: cursor, suspend
  *
+ * SUBTEST: cursor-size-hints
+ * Description: Check that sizes declared in SIZE_HINTS are accepted.
+ * Functionality: cursor
+ *
  * SUBTEST: cursor-%s
  * Description: %arg[1]
  *
@@ -817,6 +821,46 @@ static bool execution_constraint(enum pipe pipe)
 	return false;
 }
 
+static void test_size_hints(data_t *data)
+{
+	const struct drm_plane_size_hint *hints;
+	drmModePropertyBlobPtr blob;
+	uint64_t blob_id;
+	int count;
+
+	igt_require(igt_plane_has_prop(data->cursor, IGT_PLANE_SIZE_HINTS));
+
+	blob_id = igt_plane_get_prop(data->cursor, IGT_PLANE_SIZE_HINTS);
+	/*
+	 * blob_id==0 is reserved for potential future use, but the
+	 * meaning has not yet been defined for fail outright if we see it.
+	 */
+	igt_assert(blob_id);
+
+	blob = drmModeGetPropertyBlob(data->drm_fd, blob_id);
+	igt_assert(blob);
+
+	hints = blob->data;
+	count = blob->length / sizeof(hints[0]);
+	igt_assert_lt(0, count);
+
+	for (int i = 0; i < count; i++) {
+		int w = hints[i].width;
+		int h = hints[i].height;
+
+		igt_create_fb(data->drm_fd, w, h,
+			      DRM_FORMAT_ARGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &data->fb);
+
+		igt_assert(cursor_size_supported(data, w, h));
+
+		igt_remove_fb(data->drm_fd, &data->fb);
+	}
+
+	drmModeFreePropertyBlob(blob);
+}
+
 static void run_size_tests(data_t *data, int w, int h)
 {
 	enum pipe pipe;
@@ -1011,6 +1055,25 @@ static void run_tests_on_pipe(data_t *data)
 	igt_fixture
 		igt_remove_fb(data->drm_fd, &data->fb);
 
+	igt_describe("Check that sizes declared in SIZE_HINTS are accepted.");
+	igt_subtest_with_dynamic("cursor-size-hints") {
+		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
+			if (execution_constraint(pipe))
+				continue;
+
+			data->pipe = pipe;
+
+			if (!valid_pipe_output_combo(data))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s",
+				      kmstest_pipe_name(pipe),
+				      data->output->name)
+				run_test(data, test_size_hints,
+					 data->cursor_max_w, data->cursor_max_h);
+		}
+	}
+
 	for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
 		int w = cursor_size;
 		int h = cursor_size;
-- 
2.43.2

