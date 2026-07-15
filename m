Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6443C4450A
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 03:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3F210E11B;
	Wed, 15 Jul 2026 03:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="sKyLTRg1";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACC210E11B
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 03:05:43 +0000 (UTC)
X-UUID: 0d3c76a07ffa11f18dc8c9802ae25ab1-20260715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Ujed2MdBfsWvz+//KwWOAR+pc1bSGp0QvLzV7f+Gf2w=; 
 b=sKyLTRg14b+DZ+hEFX0yk4MapMOabjxvBMmi1anfSl0lSQ1sHT7+INJt9yuae+Pa+BX0ULBohcq1aI+p+edgXiB9arY/qyPnM7YR5k3sO/hgY2uGCgtQo2KlBHu3oKdhGlc8Cw04Kf2mqKIb1TJc+AVyuBPA8AFDKDPUhrj6hFs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:bec34d7b-709d-4494-8848-866f4737295e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:d497b38, CLOUDID:1b8d2219-ab14-4403-9336-76696324c5a8,
 B
 ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
 0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
 OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0d3c76a07ffa11f18dc8c9802ae25ab1-20260715
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 70789877; Wed, 15 Jul 2026 11:05:36 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 15 Jul 2026 11:05:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 15 Jul 2026 11:05:35 +0800
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
Subject: [PATCH i-g-t v4 1/2] lib/igt_pm: Add CPU idle state control
Date: Wed, 15 Jul 2026 11:04:28 +0800
Message-ID: <20260715030534.1209206-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260715030534.1209206-1-jason-jh.lin@mediatek.com>
References: <20260715030534.1209206-1-jason-jh.lin@mediatek.com>
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
APIs to control deep CPU idle states (C-states) via sysfs.

Exiting a deep C-state incurs a wakeup latency that can interfere with
latency-sensitive measurements. These helpers disable state1 and deeper
states (keeping state0/WFI unchanged) and re-enable them afterwards, so
tests that need stable timing can eliminate that interference.

The functions return the number of idle states they acted on, allowing
callers to skip when the platform exposes no controllable idle states.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 lib/igt_pm.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |  2 ++
 2 files changed, 79 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 64b15dd08302..7905deb8d43d 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1713,3 +1713,80 @@ unsigned int igt_read_pkgc_counter(int debugfs_root_fd)
 
 	return igt_get_dc_counter(str);
 }
+
+static int igt_pm_cpu_deep_sleep_control(const char *val)
+{
+	const char *cpu_root = "/sys/devices/system/cpu";
+	char state_path[512];
+	int count = 0;
+	struct dirent *de;
+	DIR *dir;
+
+	dir = opendir(cpu_root);
+	if (!dir)
+		return 0;
+
+	while ((de = readdir(dir))) {
+		int cpu, state = 1;
+
+		/* Match cpu topology entries named "cpu<N>" */
+		if (sscanf(de->d_name, "cpu%d", &cpu) != 1)
+			continue;
+
+		/*
+		 * Control state1 and deeper (keep state0 WFI unchanged),
+		 * walking consecutive states until one is missing.
+		 */
+		while (1) {
+			FILE *fp;
+
+			snprintf(state_path, sizeof(state_path),
+				 "%s/%s/cpuidle/state%d/disable",
+				 cpu_root, de->d_name, state++);
+
+			if (access(state_path, W_OK) != 0)
+				break;
+
+			/* Write '1' to disable, '0' to enable */
+			fp = fopen(state_path, "w");
+			if (fp) {
+				fprintf(fp, "%s", val);
+				fclose(fp);
+				count++;
+			}
+		}
+	}
+
+	closedir(dir);
+
+	return count;
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
+ * Returns: the number of CPU idle states that were disabled (0 if none).
+ */
+int igt_pm_disable_cpu_deep_sleep(void)
+{
+	return igt_pm_cpu_deep_sleep_control("1");
+}
+
+/**
+ * igt_pm_enable_cpu_deep_sleep:
+ *
+ * Re-enables deep CPU idle states (C-states) that were previously disabled
+ * by igt_pm_disable_cpu_deep_sleep(). This restores power-saving idle states.
+ *
+ * Returns: the number of CPU idle states that were enabled (0 if none).
+ */
+int igt_pm_enable_cpu_deep_sleep(void)
+{
+	return igt_pm_cpu_deep_sleep_control("0");
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 6a33c6db22fb..cd9dceb1e4e5 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -114,5 +114,7 @@ bool igt_dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count);
 const char *igt_dc_state_name(int dc_flag);
 void igt_require_dc_counter(int debugfs_fd, int dc_flag);
 unsigned int igt_read_pkgc_counter(int debugfs_root_fd);
+int igt_pm_disable_cpu_deep_sleep(void);
+int igt_pm_enable_cpu_deep_sleep(void);
 
 #endif /* IGT_PM_H */
-- 
2.43.0

