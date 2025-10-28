Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9D2CCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 16:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A40B10E5F8;
	Tue, 28 Oct 2025 16:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="eAm4hkAD";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A6610E60F
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 16:07:47 +0000 (UTC)
X-UUID: 3a9ffdbeb41811f0b33aeb1e7f16c2b6-20251029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TETRCx1QMzrXrtgYJ+xm7uybogYpjwB201RihhKyNaI=; 
 b=eAm4hkADURJFL/GjCAnjqAxU6HtNzjOnAi8ZeU6N8p3fHBnjBEg9/bcaLf73yq5QO2EPk2LpaXfkhgJW21X4U/r7y97iphUomMH3Z9nfP0CuXXUUWIDuMpdtn+vSoEXJmJfeWMMdeqXar22MHJdGfzdLWQLpmFsqMl6f1CDUMYI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:037c21d2-55f4-41eb-b7d7-de321cfbd1a0, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:ca6a6684-4124-4606-b51d-d5c9eec0e7b9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3a9ffdbeb41811f0b33aeb1e7f16c2b6-20251029
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 254326201; Wed, 29 Oct 2025 00:07:40 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 29 Oct 2025 00:07:38 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 29 Oct 2025 00:07:37 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>,
 Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t v3 1/1] lib/igt_edid: Fix monitor name parsing and trim
 EDID string padding
Date: Wed, 29 Oct 2025 00:07:04 +0800
Message-ID: <20251028160738.3624415-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251028160738.3624415-1-jason-jh.lin@mediatek.com>
References: <20251028160738.3624415-1-jason-jh.lin@mediatek.com>
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

Improve EDID monitor name parsing by supporting both
EDID_DETAIL_MONITOR_NAME and EDID_DETAIL_MONITOR_STRING types.
Additionally, remove trailing padding spaces from the monitor name
extracted from the EDID string to ensure the returned name is accurate.
Also, fix the assert to guarantee name_size > 1 for '\0' termination.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
---
 lib/igt_edid.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/lib/igt_edid.c b/lib/igt_edid.c
index 627201c342df..c68ccf671eff 100644
--- a/lib/igt_edid.c
+++ b/lib/igt_edid.c
@@ -26,6 +26,7 @@
 #include "config.h"
 
 #include <assert.h>
+#include <ctype.h>
 #include <string.h>
 #include <stdint.h>
 #include <time.h>
@@ -215,22 +216,33 @@ void edid_get_monitor_name(const struct edid *edid, char *name, size_t name_size
 	const struct detailed_timing *dt;
 	const struct detailed_non_pixel *np;
 	const struct detailed_data_string *ds;
-	size_t i;
+	size_t i, n;
 
-	assert(name_size > 0);
+	/* need one char for '\0' */
+	assert(name_size > 1);
 	name[0] = '\0';
 
 	for (i = 0; i < DETAILED_TIMINGS_LEN; i++) {
 		dt = &edid->detailed_timings[i];
 		np = &dt->data.other_data;
 
-		if (np->type != EDID_DETAIL_MONITOR_NAME)
+		if (np->type != EDID_DETAIL_MONITOR_NAME &&
+		    np->type != EDID_DETAIL_MONITOR_STRING)
 			continue;
 
 		ds = &np->data.string;
 		strncpy(name, ds->str, name_size - 1);
 		name[name_size - 1] = '\0';
-		igt_debug("Monitor name: %s\n", name);
+
+		/* remove the padding space from EDID */
+		for (n = name_size - 1; n > 0; ) {
+			if (!isspace(name[--n]))
+				break;
+
+			name[n] = '\0';
+		}
+
+		igt_debug("Monitor name: %s\n", name[0] ? name : "(empty)");
 		return;
 	}
 	igt_debug("No monitor name found in EDID\n");
-- 
2.43.0

