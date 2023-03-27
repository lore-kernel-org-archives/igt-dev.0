Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D16710E5C5
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 13:32:12 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.3.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2169B580D95
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 06:32:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pgmx4-00ABnc-0W
 for igt-dev@lists.freedesktop.org; Mon, 27 Mar 2023 15:31:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Mar 2023 15:31:54 +0200
Message-Id: <20230327133155.2428454-11-mauro.chehab@linux.intel.com>
In-Reply-To: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
References: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 10/11] xe/xe_vm: add documentation for
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
---
 tests/xe/xe_vm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 15356c704d2c..9ba00f0885f5 100644
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
