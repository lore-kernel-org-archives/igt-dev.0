Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3F4CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 06:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A4510E084;
	Wed, 20 May 2026 06:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="noRYfsoX";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9D410E084
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 06:46:59 +0000 (UTC)
X-UUID: afe9c9e8541711f1a3561939bc42ff46-20260520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bQvbHHTyiguLDndlKINUqvSdhKbCT9caToHKmKT2iGA=; 
 b=noRYfsoXJUbq4iU/J0ZWtplAnMaNFNt4UdZR0SAi99PDKmDXRjJNzLlz7LLhZboc0hs9ve+G1HhUw4MmlMdwcCKpPzkVEfsVsSNqgyvPUJ6DUPY1Hx0+4d7NXxwHrKugMNOhdQrOJrw7rXF+di4c9ZinCzzQMQZpeR+OyXRC2gg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:228a3591-5566-4ac9-8682-30f681f8fc47, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:9091e75, CLOUDID:6959041f-023f-4f87-9e9c-6c116c694fb3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
 ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: afe9c9e8541711f1a3561939bc42ff46-20260520
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2131110256; Wed, 20 May 2026 14:46:53 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 20 May 2026 14:46:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 20 May 2026 14:46:52 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Manasi Navare
 <navaremanasi@google.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Add igt_disable_cpu_deep_sleep() to
 control CPU C-states
Date: Wed, 20 May 2026 14:46:25 +0800
Message-ID: <20260520064651.3266598-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
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

Add API to disable/enable deep CPU idle states via sysfs to prevent
CPU wakeup latency that affects vblank timestamp acquisition on
MediaTek devices.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 lib/igt_kms.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 67 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 99fc9fa05c96..f77b7af44e39 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6776,6 +6776,72 @@ bool igt_check_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
 	return (current == bpc);
 }
 
+/**
+ * igt_disable_cpu_deep_sleep:
+ * @fd: DRM device file descriptor
+ * @disable: true to disable deep sleep states, false to restore them
+ *
+ * Controls deep CPU idle states (C-states) to prevent IRQ latency spikes
+ * during vblank events. This is a system-wide operation that affects all CPUs.
+ *
+ * This is a general API that vendors can extend. Currently:
+ * - MediaTek: Disables/enables state1 and deeper states on all CPUs
+ *
+ * When @disable is true, disables deep sleep to ensure stable vblank timing.
+ * When @disable is false, restores power-saving idle states.
+ *
+ * Returns: true on success, false on failure
+ */
+bool igt_disable_cpu_deep_sleep(int fd, bool disable)
+{
+	char cpu_path[256];
+	char state_path[512];
+	int cpu, state;
+	int count = 0;
+	FILE *fp;
+	const char *value = disable ? "1" : "0";
+	const char *action = disable ? "Disabled" : "Restored";
+
+	/* Only MediaTek needs this currently - other vendors can extend here */
+	if (!is_mtk_device(fd))
+		return false;
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
 /**
  * igt_max_bpc_constraint:
  * @display: a pointer to an #igt_display_t structure
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a58cb5cd3430..c524d2ffea16 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1244,6 +1244,7 @@ void igt_assert_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
 				 unsigned int bpc);
 bool igt_check_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
 				unsigned int bpc);
+bool igt_disable_cpu_deep_sleep(int fd, bool disable);
 
 int sort_drm_modes_by_clk_dsc(const void *a, const void *b);
 int sort_drm_modes_by_clk_asc(const void *a, const void *b);
-- 
2.43.0

