Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E5810E42F
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Mar 2022 16:35:13 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Mar 2022 18:34:30 +0200
Message-Id: <20220331163430.73167-4-kamil.konieczny@linux.intel.com>
In-Reply-To: <20220331163430.73167-1-kamil.konieczny@linux.intel.com>
References: <20220331163430.73167-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] i915/gem_concurrent_all: fix swap
 subtest group
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

In error path in fixture add unlocking memory. In run_modes
there is already another subtest group which will guard against
igt_asserts or igt_requires, so do unpinning unconditionally
without fixture.

There are still some problems with the code, while we run swap
subtest we will race between other programs using memory so we
may still experience oom-kill during test. Second problem will be
on test machines configured with no swap turned on or with swap
size much smaller than RAM size.

The problem was discovered by Zbigniew with running
./gem_concurrent_blit --run '16M*' on machine with no swap.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_concurrent_all.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_all.c
index 22c5d6ef..2b1788e1 100644
--- a/tests/i915/gem_concurrent_all.c
+++ b/tests/i915/gem_concurrent_all.c
@@ -1995,6 +1995,7 @@ igt_main
 						if (posix_memalign(&pinned, 4096, pin_sz) ||
 						    mlock(pinned, pin_sz) ||
 						    madvise(pinned, pin_sz, MADV_DONTFORK)) {
+							munlock(pinned, pin_sz);
 							free(pinned);
 							pinned = NULL;
 						}
@@ -2006,12 +2007,10 @@ igt_main
 				}
 				run_modes(name, c, modes, s, count);
 
-				igt_fixture {
-					if (pinned) {
-						munlock(pinned, pin_sz);
-						free(pinned);
-						pinned = NULL;
-					}
+				if (pinned) {
+					munlock(pinned, pin_sz);
+					free(pinned);
+					pinned = NULL;
 				}
 			}
 		}
-- 
2.32.0
