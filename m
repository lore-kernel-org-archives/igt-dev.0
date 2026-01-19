Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ADCC9832F
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 04:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436BE10E35B;
	Mon, 19 Jan 2026 04:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUDtuaDp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDD910E35B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 04:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768798089; x=1800334089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Im7NvUNdA9ouh5fJ5OP8f1iZYUEsM4OKNKN2Nhbh4/k=;
 b=cUDtuaDpAjGELJeiNviN9+Pj8rd0SLMSqHWjnM/A7hGPT9GeXp/jZf35
 o3Ws7KAh+A8K3AL8NepFR6JSeF8UUkUn/LnbPC/f+M2swGxyY41PpGn5v
 X9TfcyHvkDjF2xzA+mlCC0PZfA+C3H3GRDF1SVVq7SWM5PpenFsq7bCmc
 KYwlt2A37WEjT6DcCyYOPt33/NLBjiGJIQXguyDbEhVd2Vamv4B6oyPlE
 NaEUhFX+dkiOCZm/VlMRyilxM/eGXXhZ/aYtGTa+CgoWMLc6qIa2IyoN4
 gQf682VQ9xFOcxwFnDSWIwHQ7F26RVcJqbKPWEXr2jf0Mp1OJui/JN+CD g==;
X-CSE-ConnectionGUID: gMbzsx5QSIqBFNDygL/S7A==
X-CSE-MsgGUID: Asld9av2SsucXo3ASmEV+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87581734"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="87581734"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:08 -0800
X-CSE-ConnectionGUID: tjn537DSQhiWWN8EiHEoIA==
X-CSE-MsgGUID: V9ldh/YBRIujuix985W0oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="210271074"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:07 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v6 3/8] tests/kms_writeback: Update checks for zero FB
 ID and empty writeback commit
Date: Mon, 19 Jan 2026 10:37:27 +0530
Message-ID: <20260119050732.110985-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119050732.110985-1-sowmiya.s@intel.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
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

Intel prohibits committing a framebuffer with fb_id 0
or performing an empty writeback commit. Update assertions
and validation checks accordingly to reflect this restriction.

v4: Restore drm_fd added in struct and access it from
    igt_display_t struct (Suraj)
v5: Revise commit message and subject with detailed
    explanation. (Suraj)
v6: Revise commit message (Suraj)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_writeback.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 691774777..defe43686 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -291,7 +291,7 @@ static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *
 
 	/* Zero WRITEBACK_FB_ID */
 	ret = do_writeback_test(output, 0, NULL, false);
-	igt_assert_eq(ret, 0);
+	igt_assert_eq(ret, is_intel_device(output->display->drm_fd) ? -EINVAL : 0);
 
 	/* Valid output buffer */
 	ret = do_writeback_test(output, valid_fb->fb_id, NULL, false);
@@ -406,7 +406,8 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
 
 	/* Two commits, the second with no writeback */
 	out_fbs[0] = output_fb;
-	writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
+	if (!is_intel_device(output->display->drm_fd))
+		writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
 
 	/* Two commits, both with writeback */
 	out_fbs[1] = output_fb;
-- 
2.43.0

