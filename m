Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E54CA0EF2
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 21:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBC710E4D1;
	Mon, 18 Aug 2025 21:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DuR1NBRi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D24C10E4D1
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 21:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755553474; x=1787089474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FmwOkcmWAUnf+K+XcWQ1N3TJKdi5x7PkI0WlJ7Vw/TE=;
 b=DuR1NBRiMKGQ8dq4V3pGarbx5ltKYyOUO/WE+8VTCs54kP9VyPjMx+HV
 cbgVjZk41bE+2912P2urPnKD890SEeT/b5HKcWXJCxo2Bl/GU8zFew3DD
 /0tJ9MeB/vvQMvOKhV/9TLAVblNzH0LBugEZWwSSpwAOuBprYSv/PoKZO
 R4cGhU/Cbas0TfgRbRWNuS9LppXL1hH3O0tiRJn8GVGiFAP9SbwZIGJEX
 GKX3RkKYFFR0j7/wQRmMVSN1k2B5MJkAH62NstniChSLO+sbER7HY9Rt3
 nlh+K6q5l+vSKXMb+1GCNsCZi2Kd3BzlwH6oHcw9yJB/ZYVLACR3mly0M A==;
X-CSE-ConnectionGUID: aNy+BZypTt+jwX168CFtjQ==
X-CSE-MsgGUID: WIjdek+bRoKseYyHiLgMEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57645318"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57645318"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:44:33 -0700
X-CSE-ConnectionGUID: aqW/YLp5QZi23nrrw1qBWw==
X-CSE-MsgGUID: FQY6XhRqSSOGLie9jKGGrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="198539709"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:44:32 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/igt_kms: Add helper to measure vblank
 sequence difference
Date: Tue, 19 Aug 2025 03:14:30 +0530
Message-ID: <20250818214431.1331399-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818214431.1331399-1-ramanaidu.naladala@intel.com>
References: <20250818214431.1331399-1-ramanaidu.naladala@intel.com>
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

Add a new helper to calculate the number of vblank intervals
between two consecutive events. This enhancement enables more
precise timing and synchronization measurements in simulation
environments.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_kms.c | 21 +++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7191bf92e..1dfe70637 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2355,6 +2355,27 @@ static inline uint32_t pipe_select(int pipe)
 		return 0;
 }
 
+/**
+ * get_vblank_seq_diff:
+ * @fd: Opened drm file descriptor
+ * @pipe: Display pipe
+ *
+ * Measures the difference in vblank sequence numbers between
+ * two consecutive vblank events.
+ *
+ * Returns the number of vblank sequence numbers are elapsed.
+ */
+unsigned int get_vblank_seq_diff(int fd, enum pipe pipe)
+{
+	uint32_t vblank_start, vblank_end;
+
+	vblank_start = kmstest_get_vblank(fd, pipe, 0);
+	igt_wait_for_vblank(fd, pipe);
+	vblank_end = kmstest_get_vblank(fd, pipe, 0);
+
+	return vblank_end - vblank_start;
+}
+
 /**
  * kmstest_get_vblank:
  * @fd: Opened drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f140ad91a..01d1b8061 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -314,6 +314,7 @@ void kmstest_dumb_destroy(int fd, uint32_t handle);
 void kmstest_wait_for_pageflip(int fd);
 void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us);
 unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
+unsigned int get_vblank_seq_diff(int fd, enum pipe pipe);
 
 bool kms_has_vblank(int fd);
 
-- 
2.43.0

