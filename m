Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A020E77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 15:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D9E10E32C;
	Wed, 18 Dec 2024 15:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UuarK9HH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1D310E32C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 15:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734536179; x=1766072179;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hjded+OaekvTJioKPHEZKFELGcWFKv/UvcttW4BfFsI=;
 b=UuarK9HHcc32WEAqLZPwejzlTaQoiOQJUs/Z0RqPcGM1Hj5/WOV6BDU/
 7yhyYKcp0o4oL0Hj6nT6b2JC+zdy/7q40fsZybwb8g118etKv4eghgzaE
 XBYvFkdP1efeEOBmhY0XdYZPcxYYxCjZ8oB69RD2mfQjOtV7K/91EZskH
 F1luw3VDUdx0YPEDHODYGklLHjr6bSt6xXUY3fmehLa3XIry9OfS9inZ4
 lZfuXOgbDnOBMC5X2qrEAPDd/RX/ykL2yW/Nb/4zpIbX+pGtVQgKt4Zz1
 fc19C+YELmDJRdbmZNBmVBogGp5Oe95xNKfCGWLF54jMKTahpv5YFX7ai w==;
X-CSE-ConnectionGUID: LjvomKC2ST6stI0yRtDHvg==
X-CSE-MsgGUID: BnRKkcp+Tl6SLEsvTKGoow==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46436520"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="46436520"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 07:36:19 -0800
X-CSE-ConnectionGUID: 1SXsGJlkSX6F+Aw9ECQNJw==
X-CSE-MsgGUID: 4OyvzpvoTaS2QrEvzosdow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98714953"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.105])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 07:36:17 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, akshata.jahagirdar@intel.com,
 Nirmoy Das <nirmoy.das@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2] tests/intel-ci/xe*: Disable a few xe_evict subtests
Date: Wed, 18 Dec 2024 16:35:47 +0100
Message-ID: <20241218153547.11346-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.47.1
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

Threads may compete over VRAM resources, and since there is no
serialization in TTM, threaded evict tests may have a high
possibility of failing.

Disable such tests until we have a working exhaustive eviction
implementation in place.

v2:
- Disable also xe_evict@evict-cm-threads-small in BAT.
(Kamil).

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <akshata.jahagirdar@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 6 ------
 tests/intel-ci/xe.blocklist.txt          | 7 +++++++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 727be9230..0234d3e72 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -263,19 +263,13 @@ igt@xe_exec_threads@threads-mixed-shared-vm-basic
 igt@xe_exec_threads@threads-mixed-fd-basic
 igt@xe_exec_threads@threads-mixed-userptr-invalidate
 igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
-igt@xe_evict@evict-beng-mixed-threads-small-multi-vm
 igt@xe_evict@evict-beng-small
 igt@xe_evict@evict-beng-small-cm
 igt@xe_evict@evict-beng-small-external
 igt@xe_evict@evict-beng-small-external-cm
 igt@xe_evict@evict-beng-small-multi-vm
-igt@xe_evict@evict-cm-threads-small
-igt@xe_evict@evict-mixed-threads-small
-igt@xe_evict@evict-mixed-threads-small-multi-vm
 igt@xe_evict@evict-small
 igt@xe_evict@evict-small-cm
 igt@xe_evict@evict-small-external
 igt@xe_evict@evict-small-external-cm
 igt@xe_evict@evict-small-multi-vm
-igt@xe_evict@evict-small-multi-vm-cm
-igt@xe_evict@evict-threads-small
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index e29e745a0..ed9e572a5 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -90,3 +90,10 @@ igt@sriov_basic@enable-vfs-autoprobe-on$
 igt@sriov_basic@enable-vfs-bind-unbind-each$
 igt@sriov_basic@bind-unbind-vf$
 ##################################################################
+# Exclude xe_evict tests that are not expected to succeed
+# due to missing TTM exhaustive eviction
+##################################################################
+igt@xe_evict@*-multi-vm-cm*
+igt@xe_evict@*-threads-*
+# igt@xe_evict@*-cm* # Rebind and VM_BIND may race.
+##################################################################
-- 
2.47.1

