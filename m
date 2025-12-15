Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04969D5B17F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 15:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7A810E5D8;
	Mon, 15 Dec 2025 15:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XbSECsp3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBC610E5D2
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765811338; x=1797347338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gjVv/AV+JMMSQ+BxSGat693eqFW7OOnQ7D4bKlk00hM=;
 b=XbSECsp3nZXPEvPWaO9QNdbiCmDVHNJoKj/WriLtfoi4y/sPMZro3rzM
 S/kUWBMFIudUeqABEIO0RNwc+OFvYGRXRW13c7f43xiSZTq5ZXhQm7bQE
 ZMlCgMTdx5ruvAQ8Y6iNRt7GPuVRyJavHTXr+f0Jh406mUcpQi4ng7D/i
 omSAdKzCfvRIQDQ8XETIVLA5IOYGHaf7JIppN7GU1F2K4DoxmGskINg0Y
 /uRlu/mFHyyp376dpPyku1Ry9IXMrozspSbYQVbTaeW+8Nub6s02rfoqo
 9+2agC3qq+kMqZ2gm8XCXLoQN7TY7uqVhxJVdC2muRfwL4qo2rNVwPSDM A==;
X-CSE-ConnectionGUID: ahAKL0UNSUGp7Juc9px5cg==
X-CSE-MsgGUID: SfDg/GNsS9OImzbHwSj0Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79084813"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="79084813"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 07:08:58 -0800
X-CSE-ConnectionGUID: gci1qSiVQQ+v+gjLc929Tw==
X-CSE-MsgGUID: hv3fHpKRQLqQqUGbwKh5Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197633259"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 07:08:56 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, karthik.b.s@intel.com,
 sameer.lattannavar@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v4 1/2] lib/igt_chamelium: Add igt_chamelium_get_port()
 helper and connector_test() macro
Date: Mon, 15 Dec 2025 20:37:14 +0530
Message-ID: <20251215150717.1190726-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251215150717.1190726-1-mohammed.bilal@intel.com>
References: <20251215150717.1190726-1-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a helper to retrieve the first matching Chamelium port and introduce
a connector_test macro to streamline connector-based subtests with
automatic lookup and clean skipping.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 lib/igt_chamelium.c | 22 ++++++++++++++++++++++
 lib/igt_chamelium.h | 26 ++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index cb240a7df..95fd9dd4b 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -3260,6 +3260,28 @@ bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
 	return wait_for_connected_state(drm_fd, connectors, connectors_count);
 }
 
+/**
+ * igt_chamelium_get_port - Locate the first port matching a connector type
+ *
+ * Finds and returns the first Chamelium port that matches the requested
+ * connector type. Iterates through the provided port list and compares
+ * each port’s connector type. Returns NULL when no matching port exists.
+ */
+
+struct chamelium_port *
+igt_chamelium_get_port(struct chamelium_port **ports,
+		       int port_count, int connector_type)
+{
+	int i;
+
+	for (i = 0; i < port_count; i++) {
+		if (chamelium_port_get_type(ports[i]) == connector_type)
+			return ports[i];
+	}
+
+	return NULL;
+}
+
 igt_constructor {
 	/* Frame dumps can be large, so we need to be able to handle very large
 	 * responses
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index b5d13ddc8..2733e3a11 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -274,4 +274,30 @@ bool chamelium_plug_all(struct chamelium *chamelium);
 bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
 						   int drm_fd);
 
+struct chamelium_port *igt_chamelium_get_port(struct chamelium_port **ports,
+					      int port_count, int connector_type);
+
+/**
+ * connector_test() - Run a subtest bound to a specific connector type
+ *
+ * This macro wraps a subtest and automatically resolves the required
+ * Chamelium port using igt_chamelium_get_port(). If the requested
+ * connector type is not present, the subtest is skipped cleanly.
+ *
+ * Helps avoid repeated connector-lookup logic and provides a uniform
+ * pattern for connector-specific subtests.
+ */
+
+#define connector_test(name, connector_type, test_fn, ...)				\
+	do {										\
+		igt_subtest(name) {							\
+			struct chamelium_port *port =					\
+				igt_chamelium_get_port(data.ports, data.port_count,	\
+					DRM_MODE_CONNECTOR_##connector_type);		\
+			if (!port)							\
+				igt_skip(#connector_type " connector not available\n");	\
+			test_fn(&data, port, ##__VA_ARGS__);				\
+		}									\
+	} while (0)
+
 #endif /* IGT_CHAMELIUM_H */
-- 
2.48.1

