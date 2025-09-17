Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A508CA0EE8
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 07:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EA710E175;
	Wed, 17 Sep 2025 07:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYC73X9X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B23110E175
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 07:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758093733; x=1789629733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mP9nDvmgBhEzbVrAqzBdixmfIzEq3w7tZu315Hj3WUE=;
 b=KYC73X9XWOAfkkT45DmmrZv4hSU4d5XuH0IdfNEU6xaX3aT6nAmhpVkX
 0pmtLQHO0P6oVH9aD5FnUgZzfZcYXD0YWoSL1JBbEEmQShwm9mAXuqnTt
 E1YT/HjROevW3+cQl2Bffl49Y56T6k4MsK/6o73Dyf0pC3fr4qqa8M2nt
 vbxbM0tis0+S8+f7vO9pcumAG8kNMIj3wrN1OvpEhGe/uroc9Ubl6I981
 hNq4X3LR6gk9AXbn7AcZLdeP+rqch1vpXHcHuSmVV6FWoczuBnu5cBjqN
 0wWk5feemOGQb3E8E/xv8LpVHcpu9Gakns+YiuHjZv7jxZVm4RZZGJNQs A==;
X-CSE-ConnectionGUID: DJh8rzcvS9WYQ4b5KmJKxw==
X-CSE-MsgGUID: YKK3QgXfSOqjZcTbfPAECA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60259178"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="60259178"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 00:22:11 -0700
X-CSE-ConnectionGUID: eCl1mFujQxWafJMYbiVFPA==
X-CSE-MsgGUID: YK/QJ8AwS521fH2mlzHQTw==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.26])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 00:22:10 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2] intel-ci: Unblock the xe_evict multi-thread tests
Date: Wed, 17 Sep 2025 09:21:53 +0200
Message-ID: <20250917072153.50919-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

With xe exhaustive eviction now merged, unblock the
xe_evict tests that saw failures due to lack of exhaustive eviction.

v2:
- Rebase

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 2e1ebf299..d464f6798 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -110,13 +110,6 @@ igt@sriov_basic@enable-vfs-autoprobe-on$
 igt@sriov_basic@enable-vfs-bind-unbind-each$
 igt@sriov_basic@bind-unbind-vf$
 ##################################################################
-# Exclude xe_evict tests that are not expected to succeed
-# due to missing TTM exhaustive eviction
-##################################################################
-igt@xe_evict@.*-multi-vm-cm.*
-igt@xe_evict@.*-threads-.*
-# igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
-##################################################################
 # Chamelium V1 HDMI receiver supports a maximum resolution
 # of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
 # which exceeds the capabilities of V1 hardware and results
-- 
2.51.0

