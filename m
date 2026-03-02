Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AEDE9B358
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 10:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3702210E47C;
	Mon,  2 Mar 2026 10:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEG534qY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB6F10E35E
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 10:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772446919; x=1803982919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ie48/sPW4Fc2Y+5P6dzTYIadXJ7aS9zBpsSNrpJsnaI=;
 b=eEG534qYqjcsoO9jM4F6AQXbyAk94ySE8s9GSk1DL9DTDj5udkNQF6Qd
 iIOdqno59AxOLngxUNGwk35r8Q0Pj/asQ4wksCtX/KiGP/oLjY4Ddkigx
 esRF/d3oQAnWXn5ffvBcPASnpiDFmCN9hHrZ1ZHJr3l5XnofuJtOkWc9d
 S+XVzKa7cm1GTF/57+PnFdd6qFdWjK1S8jXmaMllhw3R0pghy9ScLyFfH
 t9j256v6UBIc2xxQ41to7F+N0w6XG201kPMuhTqLTJmpy3OPpej52NC7V
 PQLWjayZJopzrgASBvkJat9+EblY+Dtq83F819TBAz9V/cBvaLYFhanya Q==;
X-CSE-ConnectionGUID: Q6KrX+7MSPqxRU9CG1XIIw==
X-CSE-MsgGUID: 7CptPkOkQoG4QKUcUnZpnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84917521"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="84917521"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 02:21:58 -0800
X-CSE-ConnectionGUID: BjEUIRODRiCK98WmfAgvmQ==
X-CSE-MsgGUID: xNepFFH8QrqkBWXFv9teFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="214844304"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 02:21:56 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 karol.krol@intel.com, ryszard.knop@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v4 1/5] intel-ci: Remove chamelium testlist symlinks
Date: Mon,  2 Mar 2026 15:49:22 +0530
Message-ID: <20260302101926.3015380-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260302101926.3015380-1-mohammed.bilal@intel.com>
References: <20260302101926.3015380-1-mohammed.bilal@intel.com>
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

Remove symlinks before splitting into driver-specific testlists.

v2:
-Remove symlinks first before renaming (Kamil)

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/i915.chamelium-only.testlist | 1 -
 tests/intel-ci/xe.chamelium-only.testlist   | 1 -
 2 files changed, 2 deletions(-)
 delete mode 120000 tests/intel-ci/i915.chamelium-only.testlist
 delete mode 120000 tests/intel-ci/xe.chamelium-only.testlist

diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
deleted file mode 120000
index d7c492973..000000000
--- a/tests/intel-ci/i915.chamelium-only.testlist
+++ /dev/null
@@ -1 +0,0 @@
-chamelium-only.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
deleted file mode 120000
index d7c492973..000000000
--- a/tests/intel-ci/xe.chamelium-only.testlist
+++ /dev/null
@@ -1 +0,0 @@
-chamelium-only.testlist
\ No newline at end of file
-- 
2.48.1

