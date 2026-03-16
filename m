Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DC2F013CA
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3250110E28E;
	Mon, 16 Mar 2026 08:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/y4xXfQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA6110E49F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649191; x=1805185191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A9+8ItEOrEpPZi6SG1OdbQb4SB62rwR7joPGxmkLxOc=;
 b=b/y4xXfQIZzMRucOSmQSH7CUG9FTP7nMHGgzxGG6lC8O41Fuxjqo0kDx
 zOVr+timkKjH0thuD/9G81cOJcHWcWbpneL1cXyg6E50Xolnd8B4h9OP+
 3amRX6XWjPEzEmsb3/sqtWo/zB53h5ucKT/XhBvm7lsiPFwvy9sYZZPmp
 PrC2rwoiLq1MI6xc77DOY9SCBI9S7az58t5eLXdQwj+VrIgcFPl041AG5
 6BV6CgFwtpSI+2sE5R44xux9hFO1yq26ED46chVE+ALuS4vLD8roqKYLx
 2WSY22JHJDKskXlsFQh06A4TivAtT9TF3GT+8ncu/prPoVcb138ffh/Kg Q==;
X-CSE-ConnectionGUID: SHy2u0veRKOgqgZW3K5JnA==
X-CSE-MsgGUID: QRes6XD7QK2Ygmp8jVgDFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359458"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359458"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:51 -0700
X-CSE-ConnectionGUID: iyHiE5fET5eOZdf1jM84Mg==
X-CSE-MsgGUID: PEx843NtQAGwr/gob+eZCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300752"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:50 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 15/17] tests/kms_plane_cursor: Use CRC stop-on-fail
 assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:19 +0530
Message-ID: <20260316084021.419580-16-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316084021.419580-1-sowmiya.s@intel.com>
References: <20260316084021.419580-1-sowmiya.s@intel.com>
MIME-Version: 1.0
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

Replace igt_assert_crc_equal() with igt_assert_crc_equal_stop_on_fail()
in test_cursor_pos() to automatically stop CRC collection on mismatch.
Replace igt_pipe_crc_free() with igt_pipe_crc_cleanup() in test_fini()
and add cleanup in fixture teardown.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_plane_cursor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 4b69f1a17..3be00d483 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -122,7 +122,7 @@ static void test_init(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 /* Common test cleanup. */
 static void test_fini(data_t *data)
 {
-	igt_pipe_crc_free(data->pipe_crc);
+	igt_pipe_crc_cleanup(&data->pipe_crc);
 	igt_display_reset(&data->display);
 	igt_plane_set_fb(data->primary, NULL);
 	if (data->overlay)
@@ -193,9 +193,8 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 					  1);
 
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &test_crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &test_crc);
 	igt_pipe_crc_stop(data->pipe_crc);
-
-	igt_assert_crc_equal(&ref_crc, &test_crc);
 }
 
 /*
@@ -366,6 +365,7 @@ int igt_main()
 	}
 
 	igt_fixture() {
+		igt_pipe_crc_cleanup(&data.pipe_crc);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.43.0

