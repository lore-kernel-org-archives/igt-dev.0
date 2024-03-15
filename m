Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA85C54E58
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 05:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6270C10F2B9;
	Fri, 15 Mar 2024 05:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0jJUigc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B771F10F1F2
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 05:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710479128; x=1742015128;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=t6iXwIbIfZ91hWM9QjkbwbfzN3tLof4t3CRjo27z27U=;
 b=a0jJUigc1+sqZaad6S9XwZzFxE8T8FmxMqOdMLJu9hkqaS6jFRqL4ql7
 QFKTgswxKs5J9QlWsrM4lDyzBBJbT5xVI5cUM0yuZJLue6NxZXM5PUMeo
 4tTL4nNCuF6Xq/SE+nz1an6RbdF/ROjx38w6L2r8TeZzxbhrKukwAHWP4
 tv7CPz0uBeV1WPHHkCq7OArqRuCH4oSOsVMrC7TaixmG4tHXA/7WBePXj
 NRWld3TPHl9rrzZEHU45gUhPUAMYmiNq4o45KveyI8ZA5U+lGQkRAl5oq
 dtz11LXQrWMmut5kWUkYwoQ8cxqCwVmOP7OE7UjNMkc7a3hMUPW+yMk3E g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15884253"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="15884253"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 22:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="35679291"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by fmviesa002.fm.intel.com with ESMTP; 14 Mar 2024 22:05:26 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 1/2] lib/xe/xe_spin: Add support to store/write ctx time
 stamps
Date: Fri, 15 Mar 2024 10:34:37 +0530
Message-Id: <20240315050438.21245-2-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240315050438.21245-1-sai.gowtham.ch@intel.com>
References: <20240315050438.21245-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
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

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 lib/xe/xe_spin.c | 12 ++++++++++++
 lib/xe/xe_spin.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 1ca54ea19..b73e72633 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -72,6 +72,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	uint64_t end_addr = opts->addr + offsetof(struct xe_spin, end);
 	uint64_t ticks_delta_addr = opts->addr + offsetof(struct xe_spin, ticks_delta);
 	uint64_t pad_addr = opts->addr + offsetof(struct xe_spin, pad);
+	uint64_t timestamp_addr = opts->addr + offsetof(struct xe_spin, time_stamp);
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
+		spin->batch[b++] = MI_STORE_REGISTER_MEM | MI_SRM_CS_MMIO | 2;
+		spin->batch[b++] = CS_GPR(NOW_TS);
+		spin->batch[b++] = timestamp_addr;
+		spin->batch[b++] = timestamp_addr >> 32;
+	}
+
 	if (opts->ctx_ticks) {
 		spin->batch[b++] = MI_LOAD_REGISTER_IMM(1) | MI_LRI_CS_MMIO;
 		spin->batch[b++] = CS_GPR(NOW_TS) + 4;
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index 5c8c45143..5af2ded0b 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -29,6 +29,7 @@ struct xe_spin_opts {
 	uint64_t addr;
 	bool preempt;
 	uint32_t ctx_ticks;
+	bool write_timestamp;
 };
 
 /* Mapped GPU object */
@@ -38,6 +39,7 @@ struct xe_spin {
 	uint32_t start;
 	uint32_t end;
 	uint32_t ticks_delta;
+	uint32_t time_stamp;
 };
 
 igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
-- 
2.39.1

