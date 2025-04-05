Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84811C36010
	for <igt-dev@archiver.kernel.org>; Sat,  5 Apr 2025 10:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4035810E0D3;
	Sat,  5 Apr 2025 10:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYu9ZUVJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E9D10E0D3
 for <igt-dev@lists.freedesktop.org>; Sat,  5 Apr 2025 10:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743848578; x=1775384578;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7YPD+90OrDyMJhzyYBz0xn2q6j8lH+QpmKahPaqAfNU=;
 b=KYu9ZUVJOKRSpD6bYKEzR+zeciYucT+dgLToPAgOa21yBW64IyuuOcSr
 85U3VeV+Nzm/FD7QWiTYqhOwNzQe7Fvx+BCj+1+EIOjYEuSIFlKFtFeaP
 cRBZhMLLl7ratbEWqLpuSvb9eOV8VdcQ1tYmYCdvUNXpAIqhcgxh1Co3i
 wHJOXZKnumeAe/8RiDnsqY4SAnyRA8NzCOZtyqdmtprH8A7nR2Lz6R1w3
 JALybC6fi74aYnIhHOtonmrKawoM/XCCNbuHHcsLOkT+Qnh3Gt2CXdxkh
 7iRfX03QNzMzqgKUMPslaZkzc6oLMxPlz9L4sclliFSDRSFEEs/c0WdEq A==;
X-CSE-ConnectionGUID: nb235bWIQVCfkprWTUaUWQ==
X-CSE-MsgGUID: Ervfy/IhT5SSy/7+jpuKmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="70661727"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; d="scan'208";a="70661727"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2025 03:22:55 -0700
X-CSE-ConnectionGUID: iXS1+2FLSy2/7QHZhJxPKA==
X-CSE-MsgGUID: z3AokcklR8uvOgpCA2L2qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; d="scan'208";a="128038112"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa007.jf.intel.com with ESMTP; 05 Apr 2025 03:22:53 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_universal_plane: Fix fb count mismatch
Date: Sat,  5 Apr 2025 15:48:07 +0530
Message-Id: <20250405101807.980810-1-nemesa.garg@intel.com>
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
Add a 2 vblank wait before counting the fbs so that
all cursors fbs gets removed.
Since unpinning of cursor fb occurs during vblank in xe,
we need to wait atleast 1 vblank for driver to remove
cursor fb. We need 1 additional vblank because vblank
event is scheduled before unpinning.

v2: Use is_xe_device[Chaitanya]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/kms_universal_plane.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 8e0b4dda0..2d9716575 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -703,6 +703,16 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 			    COMMIT_ATOMIC : COMMIT_LEGACY);
 	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
 
+	/* Since unpinning of cursor fb occurs during vblank in xe, we need
+	 * to wait atleast 1 vblank for driver to remove cursor fb. We need
+	 * 1 additional vblank because vblank event is scheduled before
+	 * unpinning. Therefore add 2 vblank wait to ensure that all
+	 * cursor-related framebuffers can be removed before counting the
+	 * framebuffer.
+	 */
+	if (is_xe_device(data->drm_fd))
+		igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 2);
+
 	/* We should be back to the same framebuffer count as when we started */
 	count2 = intel_gem_fb_count(data);
 
-- 
2.25.1

