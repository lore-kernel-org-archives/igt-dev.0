Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E561C6FD1F
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 15:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F2710FDA6;
	Wed, 20 Mar 2024 15:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnlfKI40";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B9C10FDA3
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710950127; x=1742486127;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=sSSiAzLZNiCe5nYxFhqszk/c4DdrPURSZdQIyYgMtz8=;
 b=jnlfKI40PJgRhGEqF+xRQJBZnLO0Z6vDyL6otD9sQUvyCp4cZW4RlCS9
 HmdFZBQhmanlKlPmkqMOvaI5i4bjziptP3IwAwklQA6y2vIQbDLFzF8i5
 X1zUeBc//ZirfRW+N3TO2OUh5O0eqSvsaQn4N6be0zZ4qk58USh81uU5o
 fqA0gmjCslryJcARsF4WBaSscDT8B8DxnrokD4o9ZrB/FBmYbnoAMm8wO
 NBranDmR1rLcmoDzcAx0Y0b18+ZIHd0HNko42VC/7+C3am2BQhG7wSEIC
 hc/guE+8aqVES+pBqYxzSA/zDtFHgBFJjQRGn9GEr+6KVQzX8Ur3Tivo2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5821263"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5821263"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14590087"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa006.jf.intel.com with ESMTP; 20 Mar 2024 08:55:27 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 2/3] lib/xe/xe_spin: Add support to store/write ctx time
Date: Wed, 20 Mar 2024 21:24:29 +0530
Message-Id: <20240320155430.11877-3-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240320155430.11877-1-sai.gowtham.ch@intel.com>
References: <20240320155430.11877-1-sai.gowtham.ch@intel.com>
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

support to Store or write ctx time stamps when a spinner is
triggers, which makes user to understand if spinner is still
submitting workload to a context.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
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

