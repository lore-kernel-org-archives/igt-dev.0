Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A68B6E22B
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 14:42:16 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Tue, 19 May 2020 16:41:57 +0200
Message-Id: <20200519144157.10075-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_busy: Remove unnecessary
 non-preemptible workload
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
List-ID: <igt-dev@lists.freedesktop.org>

Non-preemptible spinners should be avoided as often as possible.
gem_busy@basic has no reason to use non-preemptible workload, only
hung subtests need it.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/i915/gem_busy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index eb2b6d5c..9e28e2a9 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -347,8 +347,8 @@ static void basic(int fd, const struct intel_execution_engine2 *e, unsigned flag
 	igt_spin_t *spin =
 		igt_spin_new(fd,
 			     .engine = e->flags,
-			     .flags = IGT_SPIN_NO_PREEMPTION |
-			     (flags & HANG ? IGT_SPIN_INVALID_CS : 0));
+			     .flags = flags & HANG ?
+			     IGT_SPIN_NO_PREEMPTION | IGT_SPIN_INVALID_CS : 0);
 	struct timespec tv;
 	int timeout;
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
