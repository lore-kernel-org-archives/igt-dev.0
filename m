Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6161CCCD1AF
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 17:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5A710E634;
	Tue, 21 Oct 2025 17:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="sLANJ5CT";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEB110E631
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Oct 2025 17:39:21 +0000 (UTC)
X-UUID: dd2947b2aea411f0ae1e63ff8927bad3-20251022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dlIK3+hCC9BXWckP1NKeotLhf12ZFOHAUMZz9PjPfLU=; 
 b=sLANJ5CTrV+EHhWu9D2TDsqtLo0eRbdNAEWsSi83Jr7YhPYXH2aiIwKgh8sTfvY+C7Vgxno7FoLApDU4D8AnzFXQYByVla4RasiZ4obFBh1AkhWYDaWRz1PF8Ur3RlTRh36mNX+PSNZuEmO9TsxK05TZ0jcBfWlH6rJKXZgH7ew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:ffad8eab-32c7-47e4-a38b-2e50101d1d49, IP:0,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-5
X-CID-META: VersionHash:a9d874c, CLOUDID:d5b8ad58-98d8-4d0a-b903-bc96efd77f78,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dd2947b2aea411f0ae1e63ff8927bad3-20251022
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1943950627; Wed, 22 Oct 2025 01:39:15 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 22 Oct 2025 01:39:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 22 Oct 2025 01:39:13 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t v2 5/5] lib/igt_edid: Fix monitor name parsing and trim
 EDID string padding
Date: Wed, 22 Oct 2025 01:37:53 +0800
Message-ID: <20251021173912.4050926-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
References: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
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
 lib/igt_edid.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/igt_edid.c b/lib/igt_edid.c
index 627201c342df..d98106c3c22d 100644
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
 		name[name_size - 1] = '\0';
+
+		/* remove the padding space from EDID */
+		for (n = name_size - 2; n > 0 && isspace(name[n]); n--)
+			name[n] = '\0';
+
 		igt_debug("Monitor name: %s\n", name);
 		return;
 	}
-- 
2.43.0

