Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6A2D3B7ED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 15:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E1710E1E2;
	Tue,  9 Dec 2025 15:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FM+WwXuC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD03F10E1E2
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 15:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765293919; x=1796829919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PdMqGxouDbqvZwuksrvXmfyFX5QrMO56F7v5mjU+ELM=;
 b=FM+WwXuCn/jrVLBtH10Pv8P+yYUWzo96IvZdpX7Ua4O+zwY6lkJo4P9Z
 yDpsvvW56R1AfMoW0CxkXHt3l4egvxOMtphLOmopUzrRbqztkzJJEtdq3
 vieT0XYE5kC+OYYkThvEv0StodHM0Z5fU+lR/12ZtoNRLV1uMJNSNQTlY
 ZxVYNQEVdXZxbj6NHVewqcZy+3lciIvLN24kauISxuY6eItdBqoXcSzbk
 zKnTO9su6dQZb8vrvsSwr3vIiXBvw9P2JvbWHKEaRBk7H+653GNF56imZ
 AgHajSO4vHdYvX3YLP3eiyRmJZo711QlUAZX7E4lewxBdpY8n0UrBJQOO Q==;
X-CSE-ConnectionGUID: bCWAImH8QCuZtALhun/Kow==
X-CSE-MsgGUID: 5PiMGJgnTmiYLALl9WLJmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78718592"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="78718592"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 07:25:19 -0800
X-CSE-ConnectionGUID: iK+dHsPUSgajgeOEB4jleg==
X-CSE-MsgGUID: IhgKFMN0Twiu9wEH9VtwQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="197027760"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa010.fm.intel.com with ESMTP; 09 Dec 2025 07:25:18 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 karthik.b.s@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v3 1/2] lib/igt_chamelium: add get_port() helper and
 CONNECTOR_TEST macro
Date: Tue,  9 Dec 2025 20:53:58 +0530
Message-ID: <20251209152359.907648-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251209152359.907648-1-mohammed.bilal@intel.com>
References: <20251209152359.907648-1-mohammed.bilal@intel.com>
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

Add a get_port() helper to return the first matching connector type, and
introduce a CONNECTOR_TEST() macro to simplify connector lookup and
skip subtests cleanly when the requested connector is unavailable.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 lib/igt_chamelium.c | 10 ++++++++++
 lib/igt_chamelium.h | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index cb240a7df..782b34ebe 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -3260,6 +3260,16 @@ bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
 	return wait_for_connected_state(drm_fd, connectors, connectors_count);
 }
 
+struct chamelium_port *
+get_port(struct chamelium_port **ports, int port_count, int connector_type)
+{
+	for (int i = 0; i < port_count; i++) {
+		if (chamelium_port_get_type(ports[i]) == connector_type)
+			return ports[i];
+	}
+	return NULL;
+}
+
 igt_constructor {
 	/* Frame dumps can be large, so we need to be able to handle very large
 	 * responses
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index b5d13ddc8..07ef2b61f 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -274,4 +274,22 @@ bool chamelium_plug_all(struct chamelium *chamelium);
 bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
 						   int drm_fd);
 
+/* Helper to get first matching connector type */
+struct chamelium_port *
+get_port(struct chamelium_port **ports, int port_count, int connector_type);
+
+/* Generic connector test macro usable by all chamelium tests */
+#define CONNECTOR_TEST(name, connector_type, test_fn, ...)                    \
+	do {                                                                   \
+		igt_subtest(name) {                                            \
+			struct chamelium_port *port =                          \
+			       get_port(data.ports, data.port_count,         \
+					DRM_MODE_CONNECTOR_##connector_type); \
+			if (!port)                                              \
+				igt_skip(#connector_type                           \
+					 " connector not available\n");         \
+				test_fn(&data, port, ##__VA_ARGS__);                   \
+					 }                                              \
+	} while (0)
+
 #endif /* IGT_CHAMELIUM_H */
-- 
2.48.1

