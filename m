Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0586C47DDF
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 10:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FF210F6D8;
	Wed, 24 Jan 2024 10:24:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A19410F454
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706091881; x=1737627881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ln0+subLTzKnh6fybJdaC21/6m8svD43K/JLfwz7GhI=;
 b=SRYexTjp5vnKK8rT5bIkrotenp0/beqSGVMtCoMvtnZv8B7cZ4GZC3zr
 JFmZhR+8gHsoWgSJjg/4NjysKEKS2eAK4des12W6mPHBoQXGXtVsbxTi8
 /8cRJrfRRU3GBz30WrMD13xzOytu0ZaGAmJzbatOmafujE5ZfQcPBXo79
 Cb7gJs39MTubHV76Wk4Jcp2OBOz1kPKArL60YCLOVhb0ftghwYnLQfoOx
 oGklNs5fn44cmcNKoUUPv6AfZ4utau7EU08tEYKLAUmCHKTBb3E4qk/VJ
 uoBd2d6CFpyQC4unibtmYBFDxmrHj8PIvTxoz96eM7zfJ0IO9OC8NZq4o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401463956"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401463956"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 02:24:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905546517"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="905546517"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 02:24:39 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] lib/igt_psr: add helper to check of given psr mode
 can be enabled
Date: Wed, 24 Jan 2024 16:04:09 +0530
Message-Id: <20240124103410.1259607-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240124103410.1259607-1-kunal1.joshi@intel.com>
References: <20240124103410.1259607-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Check if given psr mode can be enabled by reading enable_psr
modparam

Cc: Jeevan B <jeevan.b@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_psr.c | 20 ++++++++++++++++++++
 lib/igt_psr.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 663bac163..ac214fcfc 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -394,3 +394,23 @@ enum psr_mode psr_get_mode(int debugfs_fd)
 
 	return PSR_DISABLED;
 }
+
+/**
+ * is_psr_enable_possible
+ * Check if given psr mode can be enabled by reading enable_psr
+ * modparam
+ *
+ * Returns:
+ * True if given psr mode can be enabled, false otherwise.
+ */
+bool is_psr_enable_possible(int drm_fd, enum psr_mode mode)
+{
+	char *param_value;
+	int enable_psr;
+
+	param_value = __igt_params_get(drm_fd, "enable_psr");
+	igt_assert_f(param_value, "Could not read enable_psr modparam\n");
+	enable_psr = atoi(param_value);
+	free(param_value);
+	return enable_psr > mode;
+}
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 36711c0d4..82a4e8c5e 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -61,5 +61,6 @@ bool i915_psr2_selective_fetch_check(int drm_fd);
 
 bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
 void i915_psr2_sel_fetch_restore(int drm_fd);
+bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
 
 #endif
-- 
2.25.1

