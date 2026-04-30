Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1088CD13D3
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 19:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757BA10F41D;
	Thu, 30 Apr 2026 19:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qwyo5rLh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FB210F41D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 19:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777575701; x=1809111701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=27R380OxWTOkjHEz810lrs3CamozaTDLpioAOiHxMLA=;
 b=Qwyo5rLhWUHzzBKo1qd0T5Jsw4vKSdHvLWX9askOSYlmmRcNpKc50Xbf
 Ixcbh/RhY5TmNXApKfA9RgLE8JloG3mTTMaYS00fgnUndzdTnp2dPK/tN
 kmrCGWAOlhhy8Dkvf051bhS41mnqBujPueUH2rRC4ZSwJuJ+JhmxWsrrD
 CoeTIQnh6vnJrEJM2cIUFeLTdxfpn4mB/3DwhRX/XYesFpZBvE4WNevRA
 IZXhQr8CQduEWnT5WTtlufj6j0OMOpDvspdjoAMCCZcUYxfigzefQo0Lk
 xWebnL8wvFplxSNEjN7imLF8rO+bj4/1vf/fF37nQfCxWKsKohZ4qH9VZ g==;
X-CSE-ConnectionGUID: Gzk7xJ2cRp+e71u7aDbb3A==
X-CSE-MsgGUID: wnq+3JjqQuKb9RKcLhYwhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="90003571"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="90003571"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 12:01:26 -0700
X-CSE-ConnectionGUID: +Pj/yHICS0mKtlyZyo6bpg==
X-CSE-MsgGUID: XgC5wJTDSg2srN5NK96+Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="234559267"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 12:01:24 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t, v6 1/4] tests/intel/kms_joiner_helper: Add
 igt_get_joined_pipes_name()
Date: Fri,  1 May 2026 00:39:44 +0530
Message-Id: <20260430190947.2347314-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260430190947.2347314-1-swati2.sharma@intel.com>
References: <20260430190947.2347314-1-swati2.sharma@intel.com>
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

Add function to transform the enum into a string.

v2: -Improved func() doc (Jeevan)
v3: -Return names without '-' dash prefix (Santhosh)
v4: -Move from lib/igt_kms to tests/intel/kms_joiner_helper (Jani)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_joiner_helper.c | 22 ++++++++++++++++++++++
 tests/intel/kms_joiner_helper.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
index e24d7ce94..0aa409ac2 100644
--- a/tests/intel/kms_joiner_helper.c
+++ b/tests/intel/kms_joiner_helper.c
@@ -183,3 +183,25 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 	}
 	return true;
 }
+
+/**
+ * igt_get_joined_pipes_name:
+ * @val: joined_pipes enum value
+ *
+ * Returns: A readable string for the given joined_pipes enum value.
+ */
+const char *igt_get_joined_pipes_name(enum joined_pipes val)
+{
+	switch (val) {
+	case JOINED_PIPES_DEFAULT:
+		return "";
+	case JOINED_PIPES_NONE:
+		return "none";
+	case JOINED_PIPES_BIG_JOINER:
+		return "bigjoiner";
+	case JOINED_PIPES_ULTRA_JOINER:
+		return "ultrajoiner";
+	default:
+		igt_assert(false);
+	}
+}
diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
index 6d21e7eb0..1ea871a3b 100644
--- a/tests/intel/kms_joiner_helper.h
+++ b/tests/intel/kms_joiner_helper.h
@@ -17,6 +17,7 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 				  uint32_t *used_pipes_mask,
 				  uint32_t master_pipes_mask,
 				  uint32_t valid_pipes_mask);
+const char *igt_get_joined_pipes_name(enum joined_pipes val);
 
 enum force_joiner_mode {
 	FORCE_JOINER_ENABLE = 0,
-- 
2.25.1

