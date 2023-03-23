Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9952C10E0FB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 16:29:48 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.27.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7CD55580BBB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 09:29:46 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pfNou-008EIy-1C
 for igt-dev@lists.freedesktop.org; Thu, 23 Mar 2023 17:29:44 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 17:29:41 +0100
Message-Id: <20230323162943.1961396-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230323162943.1961396-1-mauro.chehab@linux.intel.com>
References: <20230323162943.1961396-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC 2/4] tests/intel-ci: add symlinks to avoid breaking
 CI pipelines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

There are lots of CI pipelines that rely on the old namespace
and testset.

Preserve them by adding symlinks to the old namespace.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel-ci/blacklist-pre-merge.txt | 1 +
 tests/intel-ci/blacklist.txt           | 1 +
 2 files changed, 2 insertions(+)
 create mode 120000 tests/intel-ci/blacklist-pre-merge.txt
 create mode 120000 tests/intel-ci/blacklist.txt

diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
new file mode 120000
index 000000000000..2d241498cacf
--- /dev/null
+++ b/tests/intel-ci/blacklist-pre-merge.txt
@@ -0,0 +1 @@
+i915-blocklist-pre-merge.txt
\ No newline at end of file
diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
new file mode 120000
index 000000000000..cc445e71e488
--- /dev/null
+++ b/tests/intel-ci/blacklist.txt
@@ -0,0 +1 @@
+i915-blocklist.txt
\ No newline at end of file
-- 
2.39.2
