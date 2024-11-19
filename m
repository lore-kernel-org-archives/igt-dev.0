Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA788D44177
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 15:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B83910E679;
	Tue, 19 Nov 2024 15:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUXLoOiX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABFC10E672
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732031755; x=1763567755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EzoSV3JaBQ4RY06w43fZM3U+/CD3btz61I2ClVzzDZw=;
 b=mUXLoOiXkkoqzSgo/nQ9hQZrLr+WucgT+wOZvYT71qFvxxf4WJYTCQvL
 DgYNNYB6UPIm5hvIie5xtuK3zUJcV3eGWOFlqvzWxSgLu50jDGLt3LqmJ
 ByoiE6ChvLriFOiSsVGU9Q0r5O5+Q41WSdbIzDZHEdDXmW/n7C9LVcPYS
 rhfNi76xWPec1uftPaNQT5UBTvguQNwk0bj9mJ/LVHAhHJy/RXrf0jPaR
 2b1TDxVzkI/DkoN1ZA0OYKEM/7/T13xkBwDiN40XzCKi/98ZOzJ2Q7A1D
 7ex/0YyP2aEQTgxJVoE6nqOzaxTGjzF2RireD8h0OY3Qj065gbO5tJ20w g==;
X-CSE-ConnectionGUID: li1+NK9DSzqRiudqaInfQw==
X-CSE-MsgGUID: q+AwcVU+S4WrT5i22Iwuvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="57448849"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="57448849"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 07:55:54 -0800
X-CSE-ConnectionGUID: 8RVX4KjVRl2NSJuNpAgCEw==
X-CSE-MsgGUID: W2HDdh3kTsWZtL2Mqt3rJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="127126923"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 07:55:51 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 1/3] lib/xe/xe_mmio: Replace open-coded init/cleanup
 with existing functions
Date: Tue, 19 Nov 2024 16:55:36 +0100
Message-Id: <20241119155538.605000-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241119155538.605000-1-marcin.bernatowicz@linux.intel.com>
References: <20241119155538.605000-1-marcin.bernatowicz@linux.intel.com>
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

Use intel_register_access_init and intel_register_access_fini to handle
initialization and cleanup, reducing code duplication. This improves
maintainability and ensures consistency, including handling forcewake
for Xe.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 lib/xe/xe_mmio.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
index 0817c12f6..834816133 100644
--- a/lib/xe/xe_mmio.c
+++ b/lib/xe/xe_mmio.c
@@ -23,13 +23,8 @@ void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
 
 	igt_assert_f(pci_dev, "No PCI device found for VF%u\n", vf_id);
 
-	intel_mmio_use_pci_bar(&mmio->intel_mmio, pci_dev);
-
-	igt_assert(mmio->intel_mmio.igt_mmio);
-
+	intel_register_access_init(&mmio->intel_mmio, pci_dev, false);
 	mmio->fd = pf_fd;
-	mmio->intel_mmio.safe = false;
-	mmio->intel_mmio.pci_device_id = pci_dev->device_id;
 }
 
 /**
@@ -53,8 +48,7 @@ void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
  */
 void xe_mmio_access_fini(struct xe_mmio *mmio)
 {
-	mmio->intel_mmio.pci_device_id = 0;
-	intel_mmio_unmap_pci_bar(&mmio->intel_mmio);
+	intel_register_access_fini(&mmio->intel_mmio);
 }
 
 /**
-- 
2.31.1

