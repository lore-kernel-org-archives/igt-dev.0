Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09553E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 07:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD18F10E0E7;
	Thu, 12 Dec 2024 07:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbArY6VF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3AD10E0E7
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 07:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733987785; x=1765523785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dZb78B1RRNJY/ay1wQWrHmOAlc72pSAQb8huAJ/JD5g=;
 b=QbArY6VFWu+GdgS8/eypRlKlV/dCITcTeTFvbnz/5Sdi9+Jcb3G6IBnM
 9JOLkyCWemxP2APDdEX23RLuQ/yuRTHE2kWPtBY7NmYTuntxjEntdHHQf
 ssXfoD6c9RP/zlW51yFiHSJMJxOHFGHW9SVIw93Lww4x5W4fjHugdaaAJ
 F/jlFgdF6OQz62cpbtc2iVbCYbH+I7YB97/g2Au5IXiowFnmg+nbirvRV
 LrPU4ptOLEDua3nO3H4Mv4DomBDUyg1CCPe+qJQRz5eBchOatNpaKUQlJ
 5esNnTJqhjh9DoWIg7tju6yLL/2q0+0OgXxzT4Ust+FIHitS61EQpREha A==;
X-CSE-ConnectionGUID: TNqwBF61Q8GwjRmz97koGw==
X-CSE-MsgGUID: vTsEw9m+S5yBiuUF7+BfBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="59787907"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="59787907"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 23:16:25 -0800
X-CSE-ConnectionGUID: kydvyKq4QmW+ca/qOy4QuA==
X-CSE-MsgGUID: ePQz/ElzRcK5VttbewxUGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96943253"
Received: from pbangalo-mobl1.amr.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.213.201.113])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 23:16:21 -0800
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <robdclark@chromium.org>, Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 dominik.karol.piatkowski@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com
Subject: [PATCH i-g-t v12 2/3] tools/lsfacts: Add tool for listing facts
Date: Thu, 12 Dec 2024 08:15:26 +0100
Message-Id: <20241212071527.64595-3-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212071527.64595-1-peter.senna@linux.intel.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <20241212071527.64595-1-peter.senna@linux.intel.com>
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

Report the facts that are present on the system or 'No facts found...'
if no facts are detected.

CC: Helen Koike <helen.koike@collabora.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>
CC: Jani Saarinen <jani.saarinen@intel.com>
CC: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Maíra Canal <mcanal@igalia.com>
CC: Melissa Wen <mwen@igalia.com>
CC: Petri Latvala <adrinael@adrinael.net>
CC: Rob Clark <robdclark@chromium.org>
CC: Ryszard Knop <ryszard.knop@intel.com>
CC: Swati Sharma <swati2.sharma@intel.com>
CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
CC: dominik.karol.piatkowski@intel.com
CC: himal.prasad.ghimiray@intel.com
CC: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
CC: katarzyna.piecielska@intel.com
CC: luciano.coelho@intel.com
CC: nirmoy.das@intel.com
CC: stuart.summers@intel.com
Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tools/lsfacts.c   | 30 ++++++++++++++++++++++++++++++
 tools/meson.build |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 tools/lsfacts.c

diff --git a/tools/lsfacts.c b/tools/lsfacts.c
new file mode 100644
index 000000000..efdec5da4
--- /dev/null
+++ b/tools/lsfacts.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_facts.h"
+
+/**
+ * SECTION:lsfacts
+ * @short_description: lsfacts
+ * @title: lsfacts
+ * @include: lsfacts.c
+ *
+ * # lsfacts
+ *
+ * Scan for igt-facts and print them on screen. Indicate if no facts are found.
+ */
+int main(int argc, char *argv[])
+{
+	/* enable facts */
+	igt_facts_config.enabled = true;
+
+	igt_facts_lists_init();
+
+	igt_facts("lsfacts");
+
+	if (igt_facts_are_all_lists_empty())
+		igt_info("No facts found...\n");
+}
diff --git a/tools/meson.build b/tools/meson.build
index 38b04851c..511aec69e 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -42,6 +42,7 @@ tools_progs = [
 	'intel_gem_info',
 	'intel_gvtg_test',
 	'dpcd_reg',
+	'lsfacts',
 	'lsgpu',
 	'power',
 ]
-- 
2.34.1

