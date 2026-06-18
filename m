Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06844CD98ED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 12:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A797810EE15;
	Thu, 18 Jun 2026 12:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NK7/Lvpu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C6D10E476
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 12:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781786203; x=1813322203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AOeDatZzMNSDfvaCTStQeIf8B+6RR1Z77s9S/sfSevA=;
 b=NK7/Lvpuxg7F7rNIXobO2UWmBrO3BUet3kqd/pxOgZZ8SFjuiusy6T5g
 KMGpnoTycKEc5rw32wQDPC3d9WpiswJVVZaEKBE5mh+pt5dO9BFd79Bjv
 Xj+cGcD74IHAp0YCJgXif2ftPijs/fJvuHckN2Izh+Dpa0SpGEhX4ToKN
 vJXNvfep0nqWO3jLea7/GiSRLDZjfexI2xCmFMrXWhrwkrk1DhE/4iTAX
 zowFTtw0q27KBcEb4BEbl6ZmOcxvpry2x7OgzhRzy8FP92cuTENSZST8d
 zQgw5Q16kw22ragjxSDz1OGNHW9UtY1x+ybOGXi+kgc1/Kva6W8WCioSP Q==;
X-CSE-ConnectionGUID: ViMcCZ2HS1uH/uLYYV+gEQ==
X-CSE-MsgGUID: i+uJqOkTTrq1VayHtgEv7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="92955867"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="92955867"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 05:36:37 -0700
X-CSE-ConnectionGUID: i85ZA9eJTEqnXoMWCtjDFA==
X-CSE-MsgGUID: j7X7vFgSTLiVgge8ug+UWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="286479129"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.106])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 05:36:36 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 2/2] tools/intel_reg: Create default accelerator
 access
Date: Thu, 18 Jun 2026 14:36:22 +0200
Message-ID: <20260618123623.68006-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618123623.68006-1-kamil.konieczny@linux.intel.com>
References: <20260618123623.68006-1-kamil.konieczny@linux.intel.com>
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

Among computing devices there are GPU and accelerators and the
intel_reg tool worked only with former ones. Create new way for
finding a compute device and when no Intel GPU is found, then
search for Intel accelerator.

v2: removed printing info on success (Jani)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_reg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 49afe91c0..d08fa14f5 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -1382,6 +1382,13 @@ int main(int argc, char *argv[])
 				return EXIT_FAILURE;
 		} else {
 			config.pci_dev = intel_get_pci_device();
+			if (!config.pci_dev)
+				config.pci_dev = intel_get_pci_accelerator_device();
+
+			if (!config.pci_dev) {
+				fprintf(stderr, "Cannot find Intel GPU nor accelerator device\n");
+				return EXIT_FAILURE;
+			}
 		}
 
 		config.devid = config.pci_dev->device_id;
-- 
2.54.0

