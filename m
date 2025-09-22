Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5B4CAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 07:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557CF10E3C7;
	Mon, 22 Sep 2025 07:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPhDQBqV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0181510E3C7
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758526095; x=1790062095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9eeXN7Lhmdveo0AQ9TmUSyKRg9W1Pl4lSj/mEDQHSt0=;
 b=JPhDQBqVO2Zg+Cwy3YdWjTDHnO9E18TojV7KxLvWSm8mARBXhMfjMvQr
 cXKDnAh9+pmfI/hqLydi3I2dJ12sIDuCZE7lDa52/GgPCCdxH1+U9cUpu
 PUuhRH/z6I7eGoHCNUAZaR4eqjX+EZ/7s1crM5TtNf9FF5+FFgj4ySYuy
 qHinpYCe9Rtrls2rk9/+t2Rk8x+r2KswPoWi7eW3CFaSV7K4Y5LsBURn2
 jEZyBmgCJYGz7iRMhqdWUqsQElzfil+EQS6nZLvMkLvVeHLFQge9rFwIC
 cUmtpgppDldY7H/qZcdGjS/G7mnjQZaUimNkf09gd/9kQGLkdcF+KRDuO Q==;
X-CSE-ConnectionGUID: ZhU30k60TASXFG19AEe7qw==
X-CSE-MsgGUID: sPYp3dMsTHiZx5NylVJoUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60708119"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="60708119"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 00:28:15 -0700
X-CSE-ConnectionGUID: EXZrPZ6XT6aiKHMMMMP9Nw==
X-CSE-MsgGUID: Exf7GEGqRmqnHkyY/ucgXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176013542"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 00:28:14 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_kms: add helper to check presence of lobf
 debugfs
Date: Mon, 22 Sep 2025 13:13:59 +0530
Message-Id: <20250922074401.2494339-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250922074401.2494339-1-kunal1.joshi@intel.com>
References: <20250922074401.2494339-1-kunal1.joshi@intel.com>
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

Added helper to check if i915_edp_lobf_info debugfs
exists for given output.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 20 ++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index df4a96a17..eab4cb92f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7540,3 +7540,23 @@ uint32_t igt_get_connected_output_count(igt_display_t *display)
 	}
 	return conn_outputs;
 }
+
+/**
+ * Checks if the lobf debugfs
+ * is available for a specific output.
+ *
+ * @drmfd: file descriptor of the DRM device.
+ * @output: output to check.
+ * Returns:
+ *  true if the debugfs is available, false otherwise.
+ */
+bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output)
+{
+        char buf[512];
+        int res;
+
+        res = igt_debugfs_read_connector_file(drmfd, output->name,
+                                              "i915_edp_lobf_info",
+                                              buf, sizeof(buf));
+        return res == 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6ef6871d5..7121ab985 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1232,6 +1232,7 @@ void igt_dump_connectors_fd(int drmfd);
 void igt_dump_crtcs_fd(int drmfd);
 bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
 bool igt_fit_modes_in_bw(igt_display_t *display);
+bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
 bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
 unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
-- 
2.25.1

