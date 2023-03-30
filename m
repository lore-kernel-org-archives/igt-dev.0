Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C24510E0D5
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 05:42:28 +0000 (UTC)
Received: from linux.intel.com (mwrzeszc-mobl1.ger.corp.intel.com
 [10.252.27.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E64FF580D74
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 22:42:26 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1phl3I-00B517-2y
 for igt-dev@lists.freedesktop.org; Thu, 30 Mar 2023 07:42:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Mar 2023 07:42:19 +0200
Message-Id: <20230330054221.2640814-11-mauro.chehab@linux.intel.com>
In-Reply-To: <20230330054221.2640814-1-mauro.chehab@linux.intel.com>
References: <20230330054221.2640814-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 10/12] xe/xe_vm: add documentation for
 igt@xe_vm@userptr-invalid
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

Solves this build-time warning:

	Warning: Missing documentation for igt@xe_vm@userptr-invalid

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/xe/xe_vm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 203721c8e073..ce770f2a9550 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -294,9 +294,13 @@ static void unbind_all(int fd, int n_vmas)
 
 #define	MAP_ADDRESS	0x00007fadeadbe000
 
-/*
- * This tests verifies that mapping an invalid userptr returns -EFAULT,
- * and that it is correctly handled.
+/**
+ * SUBTEST: userptr-invalid
+ * Description:
+ *	Verifies that mapping an invalid userptr returns -EFAULT,
+ *	and that it is correctly handled.
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
  */
 static void userptr_invalid(int fd)
 {
-- 
2.39.2
