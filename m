Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714EFCCD187
	for <igt-dev@archiver.kernel.org>; Sun, 12 Oct 2025 17:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A5910E189;
	Sun, 12 Oct 2025 17:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="nhkPvvGw";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411C710E187
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Oct 2025 17:15:12 +0000 (UTC)
X-UUID: fdb456baa78e11f0b33aeb1e7f16c2b6-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1Zn6b5f7pqDOLHBZgIDixpgBLX7JuPvMB5suDzHaFXM=; 
 b=nhkPvvGw5b0bfKscmPF5FLIp1uatIHUZcrC6nlDT0Hue7xJj1v4D3s0pvxc+JyP9VF5kUHBxdIP50HF0vkKHUIRkRjrAoAGZyqO2sUZ7pSCnPreYoLQnIrZ3Lcgzgt8btLHUdNVkLiH3Ev2QoBjFtJb0Q7ZY6hlfCQOYqcN0n/Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:0ff436a6-3530-46a1-8812-3ab6173dc1d0, IP:0,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-5
X-CID-META: VersionHash:a9d874c, CLOUDID:2cca13b9-795c-4f99-91f3-c115e0d49051,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fdb456baa78e11f0b33aeb1e7f16c2b6-20251013
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1093858937; Mon, 13 Oct 2025 01:15:03 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Oct 2025 01:15:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Mon, 13 Oct 2025 01:15:00 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Paul-PL
 Chen" <paul-pl.chen@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t 6/6] lib/igt_edid: Fix monitor name parsing and trim
 EDID string padding
Date: Mon, 13 Oct 2025 01:13:16 +0800
Message-ID: <20251012171459.3773990-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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

Fix the EDID parsing logic by supporting EDID_DETAIL_MONITOR_STRING in
addition to EDID_DETAIL_MONITOR_NAME. Also, trim the trailing padding
spaces from the monitor vendor name when parsing the EDID string to
ensure the monitor name is correctly returned.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 lib/igt_edid.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/lib/igt_edid.c b/lib/igt_edid.c
index 627201c342df..56ddfd07279a 100644
--- a/lib/igt_edid.c
+++ b/lib/igt_edid.c
@@ -26,6 +26,7 @@
 #include "config.h"
 
 #include <assert.h>
+#include <ctype.h>
 #include <string.h>
 #include <stdint.h>
 #include <time.h>
@@ -215,7 +216,7 @@ void edid_get_monitor_name(const struct edid *edid, char *name, size_t name_size
 	const struct detailed_timing *dt;
 	const struct detailed_non_pixel *np;
 	const struct detailed_data_string *ds;
-	size_t i;
+	size_t i, n;
 
 	assert(name_size > 0);
 	name[0] = '\0';
@@ -224,12 +225,18 @@ void edid_get_monitor_name(const struct edid *edid, char *name, size_t name_size
 		dt = &edid->detailed_timings[i];
 		np = &dt->data.other_data;
 
-		if (np->type != EDID_DETAIL_MONITOR_NAME)
+		if (np->type != EDID_DETAIL_MONITOR_NAME &&
+		    np->type != EDID_DETAIL_MONITOR_STRING)
 			continue;
 
 		ds = &np->data.string;
 		strncpy(name, ds->str, name_size - 1);
-		name[name_size - 1] = '\0';
+
+		/* remove the padding space from EDID */
+		n = strlen(ds->str);
+		while (n > 0 && isspace((unsigned char)name[n - 1]))
+			name[--n] = '\0';
+
 		igt_debug("Monitor name: %s\n", name);
 		return;
 	}
-- 
2.43.0

