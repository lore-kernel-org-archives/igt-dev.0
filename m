Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE4EC5AD5A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 12:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B2610E40C;
	Wed, 12 Aug 2026 12:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kd9yT9lB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8A310E40C
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 12:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786537041; x=1818073041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xAL+uU9tY1Ut27X7iYSsLvasRkevylVfHNG1PovjYD8=;
 b=Kd9yT9lBaTMklHZ4FJkZHRjta7lzl/WBhyrmrXsy9IsVQnqZIO4+eINp
 R04bQl6hI8XBbNbsk8HpeAPlYFBFBmKCcnwbRZCV3Y5HcrsCmRVF5FEnn
 WP9smayb6dfbtCBue9SbNU50Y3sPbSUjdznSRXEnD4PMRFM7P5MRKIQ11
 uaBJ+1bk/f24cbkEYlY/2JHc/CenfDSypQTfHm8+XeJBM4tfEOEFSDgkr
 09qZ/7YswTJbnkpWhunh3vR8kLayLwhXmk4ORCUrAAHIg0eg1mrjSyroQ
 uPJiO4MQjDqbBE8YQbaz9jsbs1vGlsdUTMtbcNAQpr4qoE5DDCu/Cjxsh w==;
X-CSE-ConnectionGUID: WE5AkbkCSx6PW2UNRArg0Q==
X-CSE-MsgGUID: yhfSEotOQZSf0GtNYUfinA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="74625437"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="74625437"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:17:21 -0700
X-CSE-ConnectionGUID: xCXLmNwCQkGi9lJRAk1xlA==
X-CSE-MsgGUID: R8MOwEmOTtqqQnU3cqfMjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="260317081"
Received: from tmistat.igk.intel.com ([10.91.34.58])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:17:19 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH i-g-t] intel-ci: Add xe_sriov_vram to NVL blocklist
Date: Wed, 12 Aug 2026 13:10:13 +0000
Message-ID: <20260812131013.1369674-1-jakub1.kolakowski@intel.com>
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

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel-ci/xe.nvl.core.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index 14e76df47..c73ae500e 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -20,6 +20,7 @@ igt@xe_pm@d3hot-mmap-vram
 igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
 igt@xe_compute_preempt@.*vram.*
 igt@xe_vm@out-of-memory
+igt@xe_sriov_vram@.*
 ##################################################################
 # Valid skip: PAT index tests targeting older/different platforms
 # These PAT (Page Attribute Table) index subtests validate
-- 
2.43.0

