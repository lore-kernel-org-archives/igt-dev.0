Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2A7C5B56A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 13:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0484610EFCF;
	Wed, 12 Aug 2026 13:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMOj2/5j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34B510EFCB
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786541302; x=1818077302;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mtx0DvGLjftvY/FR8LdXBhmFfMVADzc0JPeQZQ6MH9g=;
 b=TMOj2/5ji3owUdiokDN5fbmFhwfIzUlow8XXlnnnwWmLmz2NNiVJSvbu
 iGgNUiQYdeSTqbLzyBBbRDoi78y5z/u0FWAR808MYny/zJdnLJhHWsSQ1
 5UOBCRQ+LVQpCJgSTL5rMxBFkkdCY1vCdRv04z4qKfYs0YPrTm6O2gfsr
 Ovk3VE9jchAKLkdDP547AWqBX5ilUSe9dR4qvbwqRGdfIYSB6+RpfrNl7
 eqxOu3GOLup6TXbLxXU8lh6P50KckjqAYZbQXSKG/n0ADJSNOcTs7Br8j
 1f9FeYsGR6ZPeol55K128sHSmJO7YsF9YnPcQbCf/lGQJO0tOyBPtTUHo A==;
X-CSE-ConnectionGUID: 8eM78RIyQfeCCIp6nkZpMw==
X-CSE-MsgGUID: kE0ofQs7SeCFiJj4nQZ4ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="112640985"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="112640985"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 06:28:21 -0700
X-CSE-ConnectionGUID: X4z7ntCMQB+ta40xtTG1VA==
X-CSE-MsgGUID: bNd+Yrm4Qs+cS7BUcF+0uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="301894635"
Received: from tmistat.igk.intel.com ([10.91.34.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 06:28:20 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH i-g-t v2] intel-ci: Add xe_sriov_vram to NVL blocklist
Date: Wed, 12 Aug 2026 14:21:34 +0000
Message-ID: <20260812142134.1371609-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.43.0
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

NVL does not have VRAM and xe_sriov_vram skips on this platform.
Add the test to NVL blocklist.

v2: move igt@xe_sriov_vram@.* before igt@xe_vm@out-of-memory (Kamil)

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel-ci/xe.nvl.core.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index 14e76df47..b36921519 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -19,6 +19,7 @@ igt@xe_evict.*
 igt@xe_pm@d3hot-mmap-vram
 igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
 igt@xe_compute_preempt@.*vram.*
+igt@xe_sriov_vram@.*
 igt@xe_vm@out-of-memory
 ##################################################################
 # Valid skip: PAT index tests targeting older/different platforms
-- 
2.43.0

