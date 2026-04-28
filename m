Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34D2FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D5B10E2C4;
	Tue, 28 Apr 2026 04:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HE01TL4e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16D610E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351650; x=1808887650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kulLsqX7qY91N1VCPDdbi22170fOZVYoj79+mhgQoms=;
 b=HE01TL4eInE6e8DOKvSQF+V/Dc8P1M6YMQsFsLSP3aT/QPqaJhzW7Bgp
 WcJq+Q3lJcMEQ7pb5exluzCueGB6XojeER2MLoxo1iNBuQYjHusU6Yqvz
 VEDYB6FpUMpMFQDp42Ef6TFyO9WDuGYbNoZJE6yeb64x4fuVGEpGO9Y9R
 eEsENum1t/sgVtGQ3t9jSsOgXvzldmkiyGSc0KJqTNpeUXwNNhZAv9J7t
 NJTSOYqEchA8BDiMD1BMqHAuuW5cu7aqC0lPx4uldlFVx1XFRynj4Rq7i
 Nlyah3syI0jE5LCJQrZSOSXC/1ztx66Aj/P89yKKuxfbiP1lxjtPCeefo w==;
X-CSE-ConnectionGUID: PZOfwW/GROO4yE9KnEeHfg==
X-CSE-MsgGUID: JP0OCBWzQoGcJXh72FleCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167850"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167850"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:30 -0700
X-CSE-ConnectionGUID: HQZ9mkV2RuOMiIw0sZ8bPw==
X-CSE-MsgGUID: aq2c+vZ2StewIpZTMfTXfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706738"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:29 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v1 18/25] lib/chamelium/v3: Implement method to retrieve
 Chamelium port names
Date: Tue, 28 Apr 2026 10:16:27 +0530
Message-ID: <20260428044644.257001-19-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

Chamelium ports have descriptive names associated with them. This commit
introduces an RPC call to fetch these names, facilitating easier debugging
and better understanding of the port configuration.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 25 +++++++++++++++++++++++++
 lib/chamelium/v3/igt_chamelium.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index 1122ce102..8fad88e74 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -282,3 +282,28 @@ bool chamelium_v3_is_mst(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_i
 
 	return is_mst;
 }
+
+/**
+ * chamelium_v3_get_port_name - Get the port name from its id
+ *
+ * @chamelium: Chamelium to get the ports from
+ * @port_id: Port to get the name
+ *
+ * Returns a string containing the port name for @port_id. The caller must free this pointer when
+ * not used anymore.
+ */
+char *chamelium_v3_get_port_name(struct igt_chamelium_v3 *chamelium,
+				 chamelium_v3_port_id port_id)
+{
+	xmlrpc_value *res;
+	char *port_name;
+
+	igt_debug("RPC GetPortName(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium, "GetPortName", "(i)", port_id);
+
+	xmlrpc_read_string(&chamelium->env, res, (const char **)&port_name);
+
+	xmlrpc_DECREF(res);
+
+	return port_name;
+}
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index af5258068..71351e579 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -47,5 +47,6 @@ int chamelium_v3_get_supported_ports(struct igt_chamelium_v3 *chamelium,
 int chamelium_v3_get_children(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id,
 			      chamelium_v3_port_id **port_ids);
 bool chamelium_v3_is_mst(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
+char *chamelium_v3_get_port_name(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
 
 #endif //V3_IGT_CHAMELIUM_H
-- 
2.48.1

