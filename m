Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A34CC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 09:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2E810E22C;
	Mon, 19 Aug 2024 09:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3JoU5Td";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F389710E22C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724058873; x=1755594873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K+t8aW/S/9oUpZ/1khtVriKxYo54swr1HUiU/XC3DNI=;
 b=h3JoU5TdQrEfKcDH/fAJQ2dom8wnMF5yQldP/EOzD/jMn5VGx3kMmRj5
 IKWWNbdb9aHNn4CisZHUYnP85d9F0Ng8YSdyo4FQHQVApPQvzMCzDhJg8
 OOPZDECM0EJSmHsL0rJwbf1G6YgeLkH8mbcmg4SJ3xw4Po4KYy+4rBlWb
 1l+VFM6EHSUUp8CzM6E46x8bwUVtDhMphMRwrRnVtOj2/AIHrzchM+2xQ
 n3kyA+YNw1rbWpKnRfci69RyPshLGWde67t594Lu++ZSAGc0XOaUUGgi9
 yMd9YJhwzVy4pVEc3gioO2wcqmIsnLeyhKdsKzbB6oa0wT87m18JN0/Oa A==;
X-CSE-ConnectionGUID: pHsmbaxSTJicxTDi1Ko9Kw==
X-CSE-MsgGUID: WwSigj/XSc2FSr6YTnKVPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44816326"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="44816326"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:14:33 -0700
X-CSE-ConnectionGUID: /klKxJ13SRqWr7Vioq0yDQ==
X-CSE-MsgGUID: Ac5+UqKlSye4MAKI/vhrdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60884191"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 02:14:31 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 09/12] lib/igt_kms: add helper to get pending retrain
 count
Date: Mon, 19 Aug 2024 14:56:12 +0530
Message-Id: <20240819092615.3669803-10-kunal1.joshi@intel.com>
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

add helper to get pending retrainig failure count

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 21 +++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4a501e6bf..64591b760 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7051,3 +7051,24 @@ int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output)
 	sscanf(buf, "%d", &ret);
 	return ret;
 }
+
+/**
+ * igt_dp_pending_retrain:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ */
+int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
+{
+	int dir, res, ret;
+	char buf[512];
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+			       igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_force_link_retrain", buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+	sscanf(buf, "%d", &ret);
+	return ret;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 88e88a6c7..182200899 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1262,5 +1262,6 @@ void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
 bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
 bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
 int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
+int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

