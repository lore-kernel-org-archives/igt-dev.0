Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BBAC54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 11:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AEF10E75F;
	Thu, 21 Mar 2024 11:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTsZTUye";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DD110E570
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 11:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711020517; x=1742556517;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4xQ1pW/TEUTJ8py0ULaNi1NyB28lctn5MfCXiAwQQgI=;
 b=XTsZTUyes46kERDUxYQUAc31tAExU6S/RSeXj4RzaqoeF98nORMh946h
 ytkScC3QGXd7qSCefSNAziucphsbn+x/D6a1E61VbPtBNjbyn3hIeIei3
 YyyvPl37FnnHAirAuWdIstk6sexoJpoTf9cj3CocS6ubzSCGCpnSEwu/N
 9uvq0bT2owNOd9qfbmEe2srj0tcXI7odiTGSSQI/aAKgU+Wb2meSTkTv/
 NnQjJQIF8f9DWjyeIB1xlvZYfdTs3mJlSaciWvlbibsTOLe/lpQBddjgC
 BSvlP7zAIOACHViLkUd0pSRGECwXqpv3/2ElmOZRm2b9YHn656oh6NW3m w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="17140071"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="17140071"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="15119384"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa008.jf.intel.com with ESMTP; 21 Mar 2024 04:28:36 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 2/3] lib/xe/xe_spin: Add support to store/write timestamp
Date: Thu, 21 Mar 2024 16:57:37 +0530
Message-Id: <20240321112738.8703-3-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240321112738.8703-1-sai.gowtham.ch@intel.com>
References: <20240321112738.8703-1-sai.gowtham.ch@intel.com>
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Store timestamp on demand in the spinner to allow user code verify
is it still running.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_spin.c | 12 ++++++++++++
 lib/xe/xe_spin.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 1ca54ea19..2c9b5848a 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -72,6 +72,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	uint64_t end_addr = opts->addr + offsetof(struct xe_spin, end);
 	uint64_t ticks_delta_addr = opts->addr + offsetof(struct xe_spin, ticks_delta);
 	uint64_t pad_addr = opts->addr + offsetof(struct xe_spin, pad);
+	uint64_t timestamp_addr = opts->addr + offsetof(struct xe_spin, timestamp);
 	int b = 0;
 
 	spin->start = 0;
@@ -98,6 +99,17 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	if (opts->preempt)
 		spin->batch[b++] = (0x5 << 23);
 
+	if (opts->write_timestamp) {
+		spin->batch[b++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
+		spin->batch[b++] = CTX_TIMESTAMP;
+		spin->batch[b++] = CS_GPR(NOW_TS);
+
+		spin->batch[b++] = MI_STORE_REGISTER_MEM_GEN8 | MI_SRM_CS_MMIO;
+		spin->batch[b++] = CS_GPR(NOW_TS);
+		spin->batch[b++] = timestamp_addr;
+		spin->batch[b++] = timestamp_addr >> 32;
+	}
+
 	if (opts->ctx_ticks) {
 		spin->batch[b++] = MI_LOAD_REGISTER_IMM(1) | MI_LRI_CS_MMIO;
 		spin->batch[b++] = CS_GPR(NOW_TS) + 4;
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index 87b7c1716..d65adb05c 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -29,6 +29,7 @@ struct xe_spin_opts {
 	uint64_t addr;
 	bool preempt;
 	uint32_t ctx_ticks;
+	bool write_timestamp;
 };
 
 /* Mapped GPU object */
@@ -39,6 +40,7 @@ struct xe_spin {
 	uint32_t end;
 	uint32_t ticks_delta;
 	uint64_t exec_sync;
+	uint32_t timestamp;
 };
 
 igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
-- 
2.39.1

