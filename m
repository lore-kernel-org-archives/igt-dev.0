Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B07C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 12:37:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F1510E1AC;
	Wed,  2 Apr 2025 12:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwlCREbP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FBB10E1AC
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 12:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743597433; x=1775133433;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jEH3TCJGvFMf1tZyEKOjSXOeapnmTxynlAHfYOcf++0=;
 b=LwlCREbPezo2v1TJttNX3USYi5z7OwHT8jdBFAO/jv9BkZ78MTdXhbLE
 GqZ+M5heABVxiS8XMqSAh5GSa4J4lJa5i6rbkD3kyFHoLv8EO0W3g66Cw
 pb4D36PdGx6Wc4Z6qZiKBKddEtEQrjm3rh7UTyqYEvNBqE88RDs5Zjdhd
 6iR/L3kqO8HeMjBO1vClkbkNVpwFwmt/ML2EzqzC0a2+Q1Y0hFWQBfnAY
 kkLxmVSwryX//QIFZEELAbMqwpxDkxvOxZ6rc7C5q5k2fzL+czqlas1jw
 DQMK1LRMaW5Na0PP4TzL1eXNpOpT16np63zahNqwdvnii42an18Z1zq+i A==;
X-CSE-ConnectionGUID: LHdr+mXgQSC+jqZB1HXxjQ==
X-CSE-MsgGUID: uPpgpYm4SameDea0qTabcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="32563881"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="32563881"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 05:37:05 -0700
X-CSE-ConnectionGUID: np612m0ZRYSh4DzfGpnCrg==
X-CSE-MsgGUID: aOEIN1ghSpGLY78QZPIpCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="131560812"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa003.jf.intel.com with ESMTP; 02 Apr 2025 05:37:03 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@intel.com, chaitanya.kumar.borah@intel.com,
 Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t] tests/kms_universal_plane: Fix fb count mismatch
Date: Wed,  2 Apr 2025 18:02:18 +0530
Message-Id: <20250402123218.106520-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

There is a mismatch in the count of fb before
start and end of the test. This is because cursor
fbs still not removed and we are counting the fbs.
Add a delay of 2 vblank before counting the fbs
so that all cursors fbs gets removed.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/kms_universal_plane.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 8e0b4dda0..1a4e9489f 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -703,6 +703,15 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 			    COMMIT_ATOMIC : COMMIT_LEGACY);
 	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
 
+	/* Since unpinning of cursor fb occurs during vblank in xe, we need
+	 * to wait atleast 1 vblank for driver to remove cursor fb. We need
+	 * 1 additional vblank because vbalnk event is scheduled before
+	 * unpinning. Therefore 2 vblank to ensures that all cursor-related
+	 * framebuffers can be removed before counting the framebuffer.
+	 */
+	if (get_intel_driver(data->drm_fd) == INTEL_DRIVER_XE)
+		igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 2);
+
 	/* We should be back to the same framebuffer count as when we started */
 	count2 = intel_gem_fb_count(data);
 
-- 
2.25.1

