Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0FDC5472F
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 19:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C392210E115;
	Sun, 25 Aug 2024 19:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esg5n+4C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BDE10E10F
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 19:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724615669; x=1756151669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bx40CuY5v6RaYPlF07mRtwZ9DX04CfXk9joyepfPUPA=;
 b=esg5n+4CVlePpSOapsEMUB2zUsV4dnu+NEbcrn8py7U7eosK3FuG8/Xo
 NmuiwnXCUix+ShIw1dtyakMD4/eQfjfvVS6Q9sMhp4puLKBGrkIKkuz4e
 vwCTvOMxNCBMTolS06e2AekR5UGogvfGGNTr0ekNEWGtfapHzwLjYu/He
 6DsKsaQpacz1w1BhglaOWoh6pcn6Mc+WUfv+Ovv317W9r78vnPwCtyzAj
 ukrsZQJxz2LEn9CoxvUMGM2Z8TWbBkHtCE2eQmBQreXigvqMhEkMgKgZA
 PGjkAiXvMo24ke54d9zrMBQrbes9+D4kSt02XYRBEyUqzgFeGjWmzlEqF Q==;
X-CSE-ConnectionGUID: szW2eRk+Qw6+Lln3sqlV2g==
X-CSE-MsgGUID: gfSGs7ucSieAeiUhSiX+nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33591492"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="33591492"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 12:54:29 -0700
X-CSE-ConnectionGUID: AudL3UAaQH6Hwhhf+MDeGw==
X-CSE-MsgGUID: ntOfsWtTSyWYV/S88rtI+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="62283694"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 12:54:28 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 09/14] lib/igt_kms: add helper to get pending retrain
 count
Date: Mon, 26 Aug 2024 01:36:07 +0530
Message-Id: <20240825200612.4036178-10-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240825200612.4036178-1-kunal1.joshi@intel.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
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

i915_dp_force_link_retrain can be written to trigger
link retraining. add helper to get pending retrainig
failure count.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 727fa83f1..91f75243d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6941,3 +6941,26 @@ int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output)
 	sscanf(buf, "%d", &ret);
 	return ret;
 }
+
+/**
+ * igt_dp_pending_retrain:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * 
+ * Returns: Number of pending link retrains.
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
index 07dbcb263..640ec4e09 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1256,5 +1256,6 @@ void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
 bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
 bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
 int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
+int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.34.1

