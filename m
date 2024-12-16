Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71BBE7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 06:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BD110E242;
	Mon, 16 Dec 2024 06:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ee5GZmy+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AE010E242
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 06:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734329472; x=1765865472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2sHE195EBlDbXxtSigveSyziIfeDIhasAM/subC1UOo=;
 b=Ee5GZmy+XjpBqawZk3mlIQd/TB0EYEn87SBUYcAvth5sIyv1yXAIkjhG
 PlqfxQocKLHupdCezQgEVLi35BR4ONx35IgAsF8qum1bm+vXrtioCDzHr
 V82YEe5Q9e+Nz9wWqD5jvJj+03BAwQGMaTGaV3D3TuawXztMpTytDRJi8
 lxRA837xolBM239oNdkDn/kHi/qRpjlUcyzrZKjz2TUYdRYp1gFxbZDha
 RVn/8Enci2Vh6I8GMekdV5yr/pT78LAEj2UOSgZ1mxHpLaB/Fw+1t3gCj
 GJjQhPJxTzQttl6QFeO6GEOBPel7F2R5pMMNRkd3tfPoacoUB68QXy7h0 A==;
X-CSE-ConnectionGUID: 0oSx9NoAQmm5Qd3gryt1Mg==
X-CSE-MsgGUID: WmAHUQ0WRuem7r3dQFX0mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="57186195"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; d="scan'208";a="57186195"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2024 22:11:12 -0800
X-CSE-ConnectionGUID: iX1WvNvOTvuoOSPEVxraXw==
X-CSE-MsgGUID: 1Nf6ncRGRh2DEQC57SmwUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102191526"
Received: from singhra3-mobl.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.213.201.245])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2024 22:11:07 -0800
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
Subject: [PATCH i-g-t v13 2/3] tools/lsfacts: Add tool for listing facts
Date: Mon, 16 Dec 2024 07:10:35 +0100
Message-Id: <20241216061036.194296-3-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216061036.194296-1-peter.senna@linux.intel.com>
References: <20241216061036.194296-1-peter.senna@linux.intel.com>
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tools/lsfacts.c   | 27 +++++++++++++++++++++++++++
 tools/meson.build |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 tools/lsfacts.c

diff --git a/tools/lsfacts.c b/tools/lsfacts.c
new file mode 100644
index 000000000..bbe77717a
--- /dev/null
+++ b/tools/lsfacts.c
@@ -0,0 +1,27 @@
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

