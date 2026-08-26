Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70D3C61DBD
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 07:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4D510EC09;
	Wed, 26 Aug 2026 07:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McwfRpoR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0F110EC09
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 07:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787729848; x=1819265848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=feSXGhnKd+sikUPhfOpxvN9JlVuLFjAEKv/ppnBGwn0=;
 b=McwfRpoR/qkCoWkQCvF91+1jJcnne1Fot8op7CFotf2LgZhPR6nzpXvL
 Ez3uO32WAlsOeYuNFT0r7ndc1qMvEPndNOpNJKDAMrl6zsdnp/XtwfHh6
 G2juDe8RBDWQN08GQTdUTZ2HEc2HDmJf7Z5x7KY8Rwko9Kp21mKbt6QTN
 PKKAP99JHytfhWgaFQg9PtCY5mwSFBIz7GnSnAD7agFC83JOnHeuYOQtZ
 lmyW7BCijxNCVsU2HpoAX5QXER2TJ4/7dK9SDDe3iyhcJMqKxWxdGifw0
 u3M4bE+yCtg++VYNFHAOepB2kIF1hSYKf21ok1KSv5MiHadPiLl1EV/TM g==;
X-CSE-ConnectionGUID: q+ameYg0R+WJrB+UV88m2A==
X-CSE-MsgGUID: h/p4bp53S3y8uzFs37IbwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="113741656"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="113741656"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 00:37:27 -0700
X-CSE-ConnectionGUID: VVpwl+mZT0SjuGCdIEl6jA==
X-CSE-MsgGUID: oBjt2NA6TP6BZVbmKrCvMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="271296125"
Received: from dut1372bmgfrd.igk.intel.com ([10.211.177.125])
 by orviesa004.jf.intel.com with ESMTP; 26 Aug 2026 00:37:26 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 kamil.konieczny@intel.com, sobin.thomas@intel.com,
 smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v5 1/2] lib/igt_sysfs: add vram d3cold threshold helpers
Date: Wed, 26 Aug 2026 07:37:09 +0000
Message-ID: <20260826073710.37283-2-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826073710.37283-1-shivtej.eknath.patil@intel.com>
References: <20260826073710.37283-1-shivtej.eknath.patil@intel.com>
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

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

Refactor vram_d3cold_threshold helper functions
into igt_sysfs to allow reuse across tests.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 lib/igt_sysfs.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  3 +++
 2 files changed, 53 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 3646dbacb..9952c1c0d 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1012,6 +1012,56 @@ void igt_sysfs_set_u64(int dir, const char *attr, uint64_t value)
 		     value, attr, strerror(errno));
 }
 
+/**
+ * igt_sysfs_get_vram_d3cold_threshold:
+ * @sysfs: sysfs directory corresponding to the device
+ *
+ * Reads the value of the vram_d3cold_threshold sysfs attribute.
+ *
+ * Returns:
+ * Current vram_d3cold_threshold value.
+ */
+uint64_t igt_sysfs_get_vram_d3cold_threshold(int sysfs)
+{
+	uint64_t threshold;
+	char path[64];
+	int ret;
+
+	sprintf(path, "device/vram_d3cold_threshold");
+
+	igt_require_f(!faccessat(sysfs, path, R_OK, 0),
+		      "vram_d3cold_threshold is not present\n");
+
+	ret = igt_sysfs_scanf(sysfs, path, "%" PRIu64, &threshold);
+	igt_assert_lt(0, ret);
+
+	return threshold;
+}
+
+/**
+ * igt_sysfs_set_vram_d3cold_threshold:
+ * @sysfs: sysfs directory corresponding to the device
+ * @threshold: value to set
+ *
+ * Convenience wrapper to write a value to the
+ * vram_d3cold_threshold sysfs attribute.
+ * It asserts on failure.
+ */
+void igt_sysfs_set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
+{
+	char path[64];
+	int ret;
+
+	sprintf(path, "device/vram_d3cold_threshold");
+
+	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
+		ret = igt_sysfs_printf(sysfs, path, "%" PRIu64, threshold);
+	else
+		igt_warn("vram_d3cold_threshold is not present\n");
+
+	igt_assert_lt(0, ret);
+}
+
 /**
  * __igt_sysfs_get_boolean:
  * @dir: directory corresponding to attribute
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 9cbd216e6..8bdf97060 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -135,6 +135,9 @@ uint64_t igt_sysfs_get_u64(int dir, const char *attr);
 bool __igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
 void igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
 
+uint64_t igt_sysfs_get_vram_d3cold_threshold(int sysfs);
+void igt_sysfs_set_vram_d3cold_threshold(int sysfs, uint64_t threshold);
+
 bool __igt_sysfs_get_boolean(int dir, const char *attr, bool *value);
 bool igt_sysfs_get_boolean(int dir, const char *attr);
 bool __igt_sysfs_set_boolean(int dir, const char *attr, bool value);
-- 
2.43.0

