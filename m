Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BC0CDB466
	for <igt-dev@archiver.kernel.org>; Sun, 21 Jun 2026 08:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A5810E23A;
	Sun, 21 Jun 2026 08:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="WzHpJJuf";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAAC10E329
 for <igt-dev@lists.freedesktop.org>; Sun, 21 Jun 2026 08:44:54 +0000 (UTC)
X-UUID: 75d4257e6d4d11f1b1788b6acf885367-20260621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QZTPCqhl3uAg9F7lvBSWx3OIEaQ+4PWJOysqg8wniQQ=; 
 b=WzHpJJuf7ob5Kgpngq9x7uE0izuwvFx8HbfSE0OfcH4f5g5SXuwP3gMYyyYOUsfI1BQqbd67P1fsAagRxDBTnPnTg6jcxtLOUi3gzzEEnj+NxS3/NNVOu8DTLhxMN1JNbsJMC/UWw6ZcOI6EcGPRoGyxG2pNVdDJWCljGff8s9w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:ecc97fea-0fcf-4811-82a1-a73ff2d79654, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:d497b38, CLOUDID:5d93eced-45e6-4692-a476-3f71842ee83b,
 B
 ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
 0,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:
 0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 75d4257e6d4d11f1b1788b6acf885367-20260621
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1862306811; Sun, 21 Jun 2026 16:44:48 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Jun 2026 16:44:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sun, 21 Jun 2026 16:44:46 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Lancelot Wu
 <Lancelot.Wu@mediatek.com>, Manasi Navare <navaremanasi@google.com>, Gil
 Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t v2 1/2] lib/igt_pm: Add CPU idle state control for
 vblank timing stability
Date: Sun, 21 Jun 2026 16:43:27 +0800
Message-ID: <20260621084445.614024-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260621084445.614024-1-jason-jh.lin@mediatek.com>
References: <20260621084445.614024-1-jason-jh.lin@mediatek.com>
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

Add igt_pm_disable_cpu_deep_sleep() and igt_pm_enable_cpu_deep_sleep()
APIs to control deep CPU idle states (C-states) via sysfs. This prevents
IRQ latency spikes that affect vblank timestamp acquisition.

The functions control state1 and deeper states on all CPUs while keeping
state0 (WFI) unchanged, providing a balance between timing accuracy and
power efficiency.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 lib/igt_pm.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |  2 ++
 2 files changed, 77 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 64b15dd08302..7a8ad8ae3dea 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1713,3 +1713,78 @@ unsigned int igt_read_pkgc_counter(int debugfs_root_fd)
 
 	return igt_get_dc_counter(str);
 }
+
+static bool igt_pm_cpu_deep_sleep_control(bool disable)
+{
+	char cpu_path[256];
+	char state_path[512];
+	int cpu, state;
+	int count = 0;
+	FILE *fp;
+	const char *value = disable ? "1" : "0";
+	const char *action = disable ? "Disabled" : "Restored";
+
+	/* Control state1 and deeper for all CPUs */
+	for (cpu = 0; cpu < 256; cpu++) {
+		snprintf(cpu_path, sizeof(cpu_path),
+			 "/sys/devices/system/cpu/cpu%d", cpu);
+
+		/* Check if CPU exists */
+		if (access(cpu_path, F_OK) != 0)
+			break;
+
+		/* Control state1 and deeper (keep state0 WFI unchanged) */
+		for (state = 1; state < 10; state++) {
+			snprintf(state_path, sizeof(state_path),
+				 "%s/cpuidle/state%d/disable", cpu_path, state);
+
+			if (access(state_path, W_OK) != 0)
+				break;
+
+			/* Write '1' to disable, '0' to enable */
+			fp = fopen(state_path, "w");
+			if (fp) {
+				fprintf(fp, "%s", value);
+				fclose(fp);
+				count++;
+			}
+		}
+	}
+
+	if (count > 0)
+		igt_info("%s deep CPU idle states for %d CPU/state combinations\n",
+			 action, count);
+	else
+		igt_warn("No CPU idle states found to control\n");
+
+	return count > 0;
+}
+
+/**
+ * igt_pm_disable_cpu_deep_sleep:
+ *
+ * Disables deep CPU idle states (C-states) to prevent IRQ latency spikes
+ * during vblank events. This is a system-wide operation that affects all CPUs.
+ *
+ * Disables state1 and deeper states while keeping state0 (WFI) unchanged
+ * to ensure stable vblank timing.
+ *
+ * Returns: true on success, false on failure
+ */
+bool igt_pm_disable_cpu_deep_sleep(void)
+{
+	return igt_pm_cpu_deep_sleep_control(true);
+}
+
+/**
+ * igt_pm_enable_cpu_deep_sleep:
+ *
+ * Re-enables deep CPU idle states (C-states) that were previously disabled
+ * by igt_pm_disable_cpu_deep_sleep(). This restores power-saving idle states.
+ *
+ * Returns: true on success, false on failure
+ */
+bool igt_pm_enable_cpu_deep_sleep(void)
+{
+	return igt_pm_cpu_deep_sleep_control(false);
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 6a33c6db22fb..c0e35dbe721e 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -114,5 +114,7 @@ bool igt_dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count);
 const char *igt_dc_state_name(int dc_flag);
 void igt_require_dc_counter(int debugfs_fd, int dc_flag);
 unsigned int igt_read_pkgc_counter(int debugfs_root_fd);
+bool igt_pm_disable_cpu_deep_sleep(void);
+bool igt_pm_enable_cpu_deep_sleep(void);
 
 #endif /* IGT_PM_H */
-- 
2.43.0

