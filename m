Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5E86E07D
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Apr 2021 03:56:04 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue,  6 Apr 2021 09:36:00 +0530
Message-Id: <20210406040600.4783-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_sequence : Added subtest
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added test description.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_sequence.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 081bd9d7..15afb2f1 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -305,6 +305,8 @@ igt_main
 			if (m->flags & ~f->valid)
 				continue;
 
+			igt_describe("This is a test of drmCrtcGetSequence and "
+				     "drmCrtcQueueSequence");
 			igt_subtest_f("%s-%s", f->name, m->name) {
 				data.flags = m->flags;
 				run_test(&data, fd, f->func);
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
