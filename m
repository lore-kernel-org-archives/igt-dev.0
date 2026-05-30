Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE41CD6E49
	for <igt-dev@archiver.kernel.org>; Sat, 30 May 2026 19:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CB610E3C7;
	Sat, 30 May 2026 19:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDx6oHCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DA31129AD
 for <igt-dev@lists.freedesktop.org>; Sat, 30 May 2026 19:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780169277; x=1811705277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1SC0/qp+j/FCeWMXSw2uSqshBPhteaIRhSgjS+k9n0c=;
 b=UDx6oHCw28heDci0cU1ptwoaj7+KUiMKb2gNXZ3Y/5jg706IA4e6CtBk
 eTBuRRQHbVSU3dLazABhH42AYc5qaQ+fs65F7ZVRqFC41Jo22eL0kxixt
 ZsLzoUxBGZRu9ELjT92FEsojMaqkotcdvXaT772c38GdBNu9qteJB05jW
 kju6XsvvPRAZwAak6lwq9lstLgg7vv4z3z8853FhGBVnEJU2b9cYvyBcs
 uvTaAxIBVHOH8BK0fmlAtzeznN8QLcLr8hRUKm8DXrrre3RLmSX1M3ItB
 +H/5dRMRsKFrvLeZ+0vXbaXj72iw06p4G7tdkBhUGW81iVMslZL01f9wj w==;
X-CSE-ConnectionGUID: zxAeicesQ/KlshbzdejSwA==
X-CSE-MsgGUID: r5eHOjFoSYePEJbRF8GHYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="103657575"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; d="scan'208";a="103657575"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2026 12:27:57 -0700
X-CSE-ConnectionGUID: ARUw4fadQ5eN/b9cnJgM6A==
X-CSE-MsgGUID: N+9PNL4wRbS8FpvYUKcdUw==
X-ExtLoop1: 1
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 12:27:55 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t, v7 2/5] tests/intel/kms_joiner_helper: Add
 igt_get_joined_pipes_name()
Date: Sun, 31 May 2026 01:06:37 +0530
Message-Id: <20260530193640.2551688-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260530193640.2551688-1-swati2.sharma@intel.com>
References: <20260530193640.2551688-1-swati2.sharma@intel.com>
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
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
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

