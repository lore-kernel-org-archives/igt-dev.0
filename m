Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED25DC5321D
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 09:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD42610E227;
	Mon, 19 Aug 2024 09:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="furT/JCA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F08510E227
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 09:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724058866; x=1755594866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HktWvicNwnHPjfQrnYbnm2oWVXwl5pwVME0+6ky2WAY=;
 b=furT/JCA/nPF+yCmFYrcr8MTylfJqZ/SPUTzF3JRps+KjEfjS69tpTlR
 nHm3WzxvR1qt0tk+3KkNmP0j4/TkskPi2n40Gvc/FsSFQVcdN3qd5uBAI
 n2oQnXomobhojFicXdzRq/KVBMSltnImkvC1QM57jALJ6mvuc6Z5yMGw+
 MTj22QU5Qdz6dpDyVWO9juZSXLYnZhTfjSmyiPyT2uc7HAn2a+P+bu54l
 pejaOi9qN6HJh5tGJIjUK8pdgy98KlrQwjYFg29Es/WIfR0SMN4VZ6kC5
 uChnG06QCnR+tSQQLuMeWQ6ZU4BUEAQGSDuzD1Bo1bUCpL1P8IRaY9tWz w==;
X-CSE-ConnectionGUID: Tb7wgd7bTnK1UPFcZaWhuw==
X-CSE-MsgGUID: YAqUBjfJTQ+ZpKpfd5KLQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44816313"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="44816313"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:14:26 -0700
X-CSE-ConnectionGUID: Fh1NrUvvQW+kNq4HZJzKEg==
X-CSE-MsgGUID: h7b+7bNrSvGikcophMb4zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60884173"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 02:14:24 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 05/12] lib/igt_kms: add function to force link training
 failure
Date: Mon, 19 Aug 2024 14:56:08 +0530
Message-Id: <20240819092615.3669803-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819092615.3669803-1-kunal1.joshi@intel.com>
References: <20240819092615.3669803-1-kunal1.joshi@intel.com>
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

add helper to force link training failure

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 24 ++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 05e115d9c..f6ee7ab2e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6954,3 +6954,27 @@ void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
 	igt_sysfs_write(dir, "i915_dp_force_link_retrain", value, sizeof(value));
 	close(dir);
 }
+
+/**
+ * igt_force_lt_failure:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @failure_count: 1 for same link param and
+ *                2 for reduced link params
+ *
+ * Returns: force lt failure
+ */
+void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
+{
+	int dir;
+	char value[2];
+
+	snprintf(value, sizeof(value), "%d", failure_count);
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+			       igt_output_name(output));
+	igt_sysfs_write(dir, "i915_dp_force_link_training_failure",
+			     value, sizeof(value));
+	close(dir);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 4a90b5398..43bfd4a67 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1258,5 +1258,6 @@ enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t
 enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
+void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

