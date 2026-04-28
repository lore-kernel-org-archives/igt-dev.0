Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988CAFF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1DD10E2ED;
	Tue, 28 Apr 2026 04:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KB1PqjG7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBAF10E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351652; x=1808887652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WVaq8r+GQiovx8IrsjYEgElNgcbFzgGlnlxUOFO5nog=;
 b=KB1PqjG7M4928d9liQF9m6G68hYcGdgLjHOBwRFTWNe6ay4s0gvR9VIx
 vbGpXd8YEv8SqMIulVegwnykRTzgHUjX80Mdmp6ogfOuWlKpHWzlRDlFg
 lL5T/e1hIh+LbHg4affFDSCLhvrIFG70dPjpd9NcF0A3rbLN1T4QazWqx
 RPVZSKYqbIoPrMGHYSKfjxYwaJpyzHAcAokG4OCBzeOs63A0ig4oR+Cq2
 tH1dzgAG8bidYFxGfy+5IBhStxDp9i7F7me3eJNDFn+YKaYhfQOWWC680
 Uz9DbYkEU+UW702X/+GsUY5C36dNTnBzYYAFxt5FSo9wH/hy9SZe8JTvO Q==;
X-CSE-ConnectionGUID: lQrAxREkQa69bfQ1M3ekBw==
X-CSE-MsgGUID: I7A8FzTZQq6P5SS4RNhUoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167854"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167854"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:32 -0700
X-CSE-ConnectionGUID: o+nCH0WaRKyvyIGbhVt8yQ==
X-CSE-MsgGUID: uFfLbtMdS0CTNSsalPpFSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706750"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:31 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v1 19/25] tests/chamelium/v3: Implement a basic
 Chamelium v3 accessibility test
Date: Tue, 28 Apr 2026 10:16:28 +0530
Message-ID: <20260428044644.257001-20-mohammed.bilal@intel.com>
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

Utilizing the RPC calls introduced earlier, this commit adds a simple test
to verify if the Chamelium v3 device is accessible.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/v3/kms_chamelium_v3_basic.c | 30 +++++++++++++++++++++
 tests/meson.build                           |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 tests/chamelium/v3/kms_chamelium_v3_basic.c

diff --git a/tests/chamelium/v3/kms_chamelium_v3_basic.c b/tests/chamelium/v3/kms_chamelium_v3_basic.c
new file mode 100644
index 000000000..1b806458b
--- /dev/null
+++ b/tests/chamelium/v3/kms_chamelium_v3_basic.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: MIT
+
+#include "igt.h"
+#include "chamelium/v3/igt_chamelium.h"
+
+int igt_main()
+{
+	struct igt_chamelium_v3 *chamelium;
+
+	igt_describe("Test if the chamelium can list all the ports.");
+	igt_subtest("chamelium-list-ports") {
+		chamelium_v3_port_id *ports;
+		int port_count;
+
+		chamelium = chamelium_v3_init_from_config();
+
+		port_count = chamelium_v3_get_supported_ports(chamelium, &ports);
+
+		for (int i = 0; i < port_count; i++) {
+			char *name = chamelium_v3_get_port_name(chamelium, ports[i]);
+
+			igt_info("Port %d: name: %s\n", ports[i], name);
+			free(name);
+		}
+
+		free(ports);
+
+		chamelium_v3_uninit(chamelium);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 17677e4e4..80e88954a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -373,6 +373,7 @@ chamelium_v2_progs = [
 ]
 
 chamelium_v3_progs = [
+	'kms_chamelium_v3_basic',
 ]
 
 test_deps = [ igt_deps ]
-- 
2.48.1

