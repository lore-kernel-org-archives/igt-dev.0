Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C0ECD6E4C
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 05:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42078112DA3;
	Mon,  1 Jun 2026 05:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5eDP1GX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC1C112DA1
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 05:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780292064; x=1811828064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y3FHnhWV8vBCWipoSHT1/y25ft4H57d92wiVVIh6/Lw=;
 b=D5eDP1GX4ciewj3zVT2l0DjDGQmsFf92b02o6IfGHvAqBFRkCUhW8Ipi
 H0dpnJZrdvQCS8PhNf9OYwpyIcyOjB2dvlJW8oo9cSY9ZTr1RwvrvqcZY
 umTi6o+XJni6D5c6nCqvPWdSv+8G9NGklLScVoA4XdJbguuJK9XEkJdTL
 P8AbmpqbWE05Tndt0b2nj+087MrfLKCB7vFYfpsQATT95jR2JrQbUcnCb
 1DI6QewKjuVeMg8Cx5IDVYmqOgF+r8zQnP1p6D4Y65p45fA/9Ko+bwF31
 uroVLGQrKAFFhkOsTWWTkpvxie2D+xduARQry+LKyMG4JxwP9wU9DvoBY A==;
X-CSE-ConnectionGUID: Cq9tsYVcTlSF2oGpegTBlw==
X-CSE-MsgGUID: th2RGAppSQKITKO9BgaNtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="103712757"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="103712757"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 22:34:24 -0700
X-CSE-ConnectionGUID: HJ/6kJrYQiSvVf8wRhVXCg==
X-CSE-MsgGUID: OHp/ggPjQtCv1qpctEhAbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="243310136"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 22:34:22 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 2/6] tests/intel/kms_mst_helper: Add helper to check for
 MST outputs
Date: Mon,  1 Jun 2026 11:25:41 +0530
Message-Id: <20260601055545.1982351-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260601055545.1982351-1-kunal1.joshi@intel.com>
References: <20260601055545.1982351-1-kunal1.joshi@intel.com>
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

Add igt_display_has_mst_output() to check
if a display has at least one DP MST output
connected. This is useful for tests that need
to verify MST output availability before running.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/intel/kms_mst_helper.c | 19 +++++++++++++++++++
 tests/intel/kms_mst_helper.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
index 38859cffc..1918c8d10 100644
--- a/tests/intel/kms_mst_helper.c
+++ b/tests/intel/kms_mst_helper.c
@@ -47,3 +47,22 @@ int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
 	}
 	return 0;
 }
+
+/**
+ * igt_display_has_mst_output:
+ * @display: pointer to #igt_display_t structure
+ *
+ * Check if a display has at least one DP MST output connected.
+ *
+ * Returns: true if MST output is found, false otherwise
+ */
+bool igt_display_has_mst_output(igt_display_t *display)
+{
+	igt_output_t *output;
+
+	for_each_connected_output(display, output) {
+		if (igt_check_output_is_dp_mst(output))
+			return true;
+	}
+	return false;
+}
diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h
index 7391494ab..0e8ece0a0 100644
--- a/tests/intel/kms_mst_helper.h
+++ b/tests/intel/kms_mst_helper.h
@@ -12,4 +12,5 @@ int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
 					igt_output_t *output,
 					igt_output_t *mst_outputs[],
 					int *num_mst_outputs);
+bool igt_display_has_mst_output(igt_display_t *display);
 #endif
-- 
2.25.1

