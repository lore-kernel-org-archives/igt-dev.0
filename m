Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D985E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 12:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4D910E0B1;
	Wed, 18 Dec 2024 12:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMhk/K81";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA2110E0B1
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 12:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734525935; x=1766061935;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ChpANKLrJ+T08fmQicr/MmHdmkMemjXwW+Zsf7zBLEw=;
 b=hMhk/K81LIg6SkLlbNBiKdKhEyp54oYRVnLUvxXKNuBm3+zM7ZdtX81z
 C5se+hosNs0SpnZN6VTO4qx5fuCmh99SIsp+V6UOdE0/MLmFK80sdg1rc
 emtcXSEhWtviHhH7AJHdb4JUSmci8IusQ1MdrQgWI30iAeYCCN/XIO7AD
 plRmVVLYHcXSA9+PUK04rYAe/GsFJxouEzBh/OuEYZci45O7gmyj63kS4
 iOoU1dNWS02NSbLnwYglB4YLTwV++J5CqKbXzeBinG7dfSehpJTp3Lsj6
 V1r6vPGMLYAzoIBx6zNg9BTs382u6DHS0ptC0lq7n5vsqkJaRG2R0+u10 Q==;
X-CSE-ConnectionGUID: /lkk7BFcSrGijioy9ISzgw==
X-CSE-MsgGUID: UssBShexSqSZlQTGK8Tadg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38934674"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="38934674"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:45:34 -0800
X-CSE-ConnectionGUID: hh81NBLWTh+yNX0bvL6D0w==
X-CSE-MsgGUID: narhscqQTre9/bVRs+i21g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="98084538"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.105])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:45:33 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, akshata.jahagirdar@intel.com
Subject: [PATCH i-g-t] xe-ci: Disable xe_evict subtests that are expected to
 possibly fail
Date: Wed, 18 Dec 2024 13:45:19 +0100
Message-ID: <20241218124519.4697-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <akshata.jahagirdar@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 5 -----
 tests/intel-ci/xe.blocklist.txt          | 7 +++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 727be9230..f16ca9188 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -263,19 +263,14 @@ igt@xe_exec_threads@threads-mixed-shared-vm-basic
 igt@xe_exec_threads@threads-mixed-fd-basic
 igt@xe_exec_threads@threads-mixed-userptr-invalidate
 igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
-igt@xe_evict@evict-beng-mixed-threads-small-multi-vm
 igt@xe_evict@evict-beng-small
 igt@xe_evict@evict-beng-small-cm
 igt@xe_evict@evict-beng-small-external
 igt@xe_evict@evict-beng-small-external-cm
 igt@xe_evict@evict-beng-small-multi-vm
 igt@xe_evict@evict-cm-threads-small
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

