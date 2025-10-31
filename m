Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1C6CCF9FE
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 12:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B861C10E0BE;
	Fri, 31 Oct 2025 12:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ElR5GtEK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2981310E0BE
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761915455; x=1793451455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lhfa/hGz2NnNIE4CF1c8WBKgJDeUymsuzGnCtDxvTts=;
 b=ElR5GtEK403s86L+xCNZ31Em6+N3kQE2kFOEy6cdgyluXLkUeNPYQBEu
 FB+iiYfIuQGfAYu/4wHN3yfn4em7MbkiwP7ygnf/HPK4gtl1EdJsax3kT
 2KXMIbl4sp//tN5z2ABMn78Jb0TiKkkK/F7BmFgwVhBlVQoeBVPgT24i7
 Cx/+dIY4kwZdnrmrNi9II7zJbnOkcrd4g8mbLl6sA1dcv0o8lOjiG5iID
 RdFWONjU8DRh9zTnYsdcsBh2wOM8RQmRzQgf0q2/cGjKVX973+BqmivQ8
 fJ4RurmgtHfy3eqmaO+fnH/zDFJSAvdjrXsMAUQF1JWibGA0NHNN1NkaS Q==;
X-CSE-ConnectionGUID: R4+ibpX/TXianoe/liNUjg==
X-CSE-MsgGUID: 2gc/n4sQQbWw9q1HF6w6aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="51647301"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="51647301"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:57:34 -0700
X-CSE-ConnectionGUID: F84wFel7SMWYJAmhpVUxow==
X-CSE-MsgGUID: mhzmAVz1Q0qFGTZcdNs3lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="191376460"
Received: from lburylo-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.246.19.11])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:57:32 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t 2/6] lib/xe_mmio: Add init flag and helper to check
 initialization
Date: Fri, 31 Oct 2025 13:56:29 +0100
Message-ID: <20251031125633.1374273-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031125633.1374273-1-marcin.bernatowicz@linux.intel.com>
References: <20251031125633.1374273-1-marcin.bernatowicz@linux.intel.com>
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Track MMIO initialization state via a new `init` flag and expose it
through xe_mmio_is_initialized().

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/xe/xe_mmio.c | 14 ++++++++++++++
 lib/xe/xe_mmio.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
index 8bc446fb9..43aa354ff 100644
--- a/lib/xe/xe_mmio.c
+++ b/lib/xe/xe_mmio.c
@@ -25,6 +25,7 @@ void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
 
 	intel_register_access_init(&mmio->intel_mmio, pci_dev, false);
 	mmio->fd = pf_fd;
+	mmio->init = true;
 }
 
 /**
@@ -39,6 +40,18 @@ void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
 	xe_mmio_vf_access_init(pf_fd, 0, mmio);
 }
 
+/**
+ * xe_mmio_is_initialized:
+ * @mmio: xe mmio structure for IO operations
+ *
+ * Returns:
+ * Non-zero if the xe mmio structure is initialized.
+ */
+bool xe_mmio_is_initialized(const struct xe_mmio *mmio)
+{
+	return mmio->init;
+}
+
 /**
  * xe_mmio_access_fini:
  * @mmio: xe mmio structure for IO operations
@@ -49,6 +62,7 @@ void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
 void xe_mmio_access_fini(struct xe_mmio *mmio)
 {
 	intel_register_access_fini(&mmio->intel_mmio);
+	mmio->init = false;
 }
 
 /**
diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
index f15017c96..1710a384f 100644
--- a/lib/xe/xe_mmio.h
+++ b/lib/xe/xe_mmio.h
@@ -16,11 +16,13 @@ typedef uint64_t xe_ggtt_pte_t;
 
 struct xe_mmio {
 	int fd;
+	bool init;
 	struct intel_mmio_data intel_mmio;
 };
 
 void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio);
 void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio);
+bool xe_mmio_is_initialized(const struct xe_mmio *mmio);
 void xe_mmio_access_fini(struct xe_mmio *mmio);
 
 uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t offset);
-- 
2.43.0

