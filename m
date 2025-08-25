Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636B9CA0EFA
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 16:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFE310E4FB;
	Mon, 25 Aug 2025 16:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ui9G1V0t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC44D10E4FB
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756138332; x=1787674332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1+i6A46lCjgib6Kk+yv9X5LmcqpfnhefnXJ8TzrDyuQ=;
 b=Ui9G1V0tXln/T6h7Yzi3EFlFY09Obg0Nao5efC/912VV9wQi2MzfvGif
 cOcKyULyavRlIBQHJzVu7KQhMVB9TWlMAIkdxysxs5H4wnEr/6fAtPXi0
 JfkqlMM0APaW4fuhx1u5DwHxB7Cmrm4+ahx2on5wYdCqOOMUJg6EtGKf6
 coBEXxyoq01csefx5xXLdh2yYecb+o201zK6vB6j2tJu72+PE3aL/DjGe
 F3TIOcVWrxWMbelsZroMGrc9XMxBs+rAhoOvSS9jwwQUoGc2gq+JHsTGs
 2pvBDHCEOVOeLPdA0X4X0m0qGhC5a2bcRgNkv7UKCgS3jd0HnnCTzWRJJ w==;
X-CSE-ConnectionGUID: TjEOjp+tRR2uXQIOEY5zrw==
X-CSE-MsgGUID: JQr8UO23Swuq9H9mz+eg0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58425024"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="58425024"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:12:01 -0700
X-CSE-ConnectionGUID: d11DIdjaQv6V9ecW0bQrHA==
X-CSE-MsgGUID: 0CrRmsBLQCSxNZCxOjBQuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168939668"
Received: from tmistat.igk.intel.com ([10.91.214.42])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:12:00 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_test_config.json: Add SR-IOV
 testlists
Date: Mon, 25 Aug 2025 16:53:46 +0000
Message-Id: <20250825165346.504290-3-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250825165346.504290-1-jakub1.kolakowski@intel.com>
References: <20250825165346.504290-1-jakub1.kolakowski@intel.com>
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

Currently we have bat.testlist and full.testlist being generated
by igt_doc.py script.
Add SR-IOV testlists to be generated:
- bat-vf.testlist
- bat-vm.testlist
- full-vm.testlist

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 tests/intel/xe_test_config.json | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 27de0efaa..a754ccda8 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -11,12 +11,14 @@
                 "default-testlist": "FULL",
                 "update-from-file": {
                     "exclude-type": "regex-ignorecase",
-                    "append-value-if-not-excluded": "Xe FULL",
+                    "append-value-if-not-excluded": "Xe FULL, Xe FULL VM",
                     "include": [
-                        { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
+                        { "Xe BAT, Xe BAT VF, Xe BAT VM": "../intel-ci/xe-fast-feedback.testlist" }
                     ],
                     "exclude": [
-                        { "Xe BAT, Xe FULL": "../intel-ci/xe.blocklist.txt" }
+                        { "Xe BAT, Xe BAT VF, Xe BAT VM, Xe FULL, Xe FULL VM": "../intel-ci/xe.blocklist.txt" },
+                        { "Xe BAT VF": "../intel-ci/xe-sriov-vf.blocklist.txt"},
+                        { "Xe BAT VM, Xe FULL VM": "../intel-ci/xe-sriov-vm.blocklist.txt"}
                     ]
                 },
                 "order": [
-- 
2.25.1

