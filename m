Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AA9CE9D5D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 15:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A386510E0AE;
	Tue,  6 Jan 2026 15:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cF8DdGWE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3428A10E51C
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 15:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767713642; x=1799249642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5jH4lOiJVjgsEq531lba3deAV6VrBzlg48j6WQ8Qx6c=;
 b=cF8DdGWEQD6O8B4M9yDURFZEufzCrl9ka4mcxMO6cPSjCOGxv9rMU//Y
 yay7PdQp3gym28zw7ZHxPQOn9Y3EnRczAoI80MqqFblkjzC027jCS1Qv7
 adRzku4i5zd+X3YaUp4YvTL1B+G7W+JlE5A1lb2ac0b0LYTi9WSQjd8QB
 YdsWokLDr8MZs5ioYdYRPaUyZ4f8B2mcEtQPdIOrvckLXzBUVNYkBoV3Z
 pP+AJQFGkTz9MbaMnqI2ifNv3D60NrLPeBHoDawyk2ZYkBcu36X+Y0w2k
 X2rYOqO9Mu0EmILXZuumBzqELyl02ZsV3OZuucmvB45rhvQ/m5no04Ly9 A==;
X-CSE-ConnectionGUID: DvNKg3nbSS2YTNZELJzXrg==
X-CSE-MsgGUID: uGsiOOmJQ5aJv7pBDqEqPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="94546763"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="94546763"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 07:33:57 -0800
X-CSE-ConnectionGUID: A6UhRtlsQROOl7gK8MG6vQ==
X-CSE-MsgGUID: /hjmsmhQQSSg59M+UCbqkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="206824495"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 07:33:55 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 karthik.b.s@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v5 1/2] lib/igt_chamelium: Add connector_test() macro
Date: Tue,  6 Jan 2026 21:02:31 +0530
Message-ID: <20260106153232.79004-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260106153232.79004-1-mohammed.bilal@intel.com>
References: <20260106153232.79004-1-mohammed.bilal@intel.com>
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

v5:
- Iterate and test all matching connected ports (Kunal)

v4:
- Rename helper to igt_chamelium_get_port (Jeevan)
- Add documentation for helper and macro (Jeevan)
- Use lowercase name for test macro (Sebastien)

Update connector handling to iterate over all matching connected ports and
execute tests accordingly, while fixing unintended fixture execution and
skipping cleanly when no matching connector is present.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 lib/igt_chamelium.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index b5d13ddc8..cf530d6cd 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -274,4 +274,35 @@ bool chamelium_plug_all(struct chamelium *chamelium);
 bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
 						   int drm_fd);
 
+/**
+ * connector_test() - Run a subtest for all ports of a given connector type
+ *
+ * Defines a subtest that iterates over all available Chamelium ports and
+ * executes the provided test function for each port matching the requested
+ * connector type. If no matching port is found, the subtest is skipped
+ * cleanly.
+ *
+ * This helper avoids repeated connector-iteration logic and provides a
+ * consistent pattern for running connector-specific tests.
+ */
+
+#define connector_test(name, connector_type, test_fn, ...)		\
+	{								\
+		int p;							\
+		struct chamelium_port *port;                            \
+		igt_subtest(name) {					\
+			bool found = false;				\
+			for_each_port(p, port) {			\
+				if (chamelium_port_get_type(port) !=	\
+					DRM_MODE_CONNECTOR_##connector_type)	\
+					continue;			\
+				found = true;				\
+				test_fn(&data, port, ##__VA_ARGS__);	\
+			}						\
+			if (!found)					\
+				igt_skip(#connector_type		\
+					 " connector not available\n"); \
+			}						\
+	}
+
 #endif /* IGT_CHAMELIUM_H */
-- 
2.48.1

