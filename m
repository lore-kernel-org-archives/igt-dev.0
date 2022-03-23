Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BE210E6D3
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Mar 2022 13:08:28 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Mar 2022 14:06:53 +0100
Message-Id: <20220323130653.65094-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220323130653.65094-1-zbigniew.kempczynski@intel.com>
References: <20220323130653.65094-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_exec_parallel: Add 48b
 flag to execbuf
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

On dg2 and beyond safe alignment is bigger than on integrated so we
can enter offset range >= 2^32. Add execbuf flag which allows using
such offsets.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_exec_parallel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
index 36bf5f742e..1dfbaa2411 100644
--- a/tests/i915/gem_exec_parallel.c
+++ b/tests/i915/gem_exec_parallel.c
@@ -150,9 +150,10 @@ static void *thread(void *data)
 			batch[++i] = offset + 4*t->id;
 			batch[++i] = offset >> 32;
 			obj[0].offset = offset;
-			obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+			obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
+					EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 			obj[1].offset = get_offset(t->ahnd, obj[1].handle, 4096, 0);
-			obj[1].flags |= EXEC_OBJECT_PINNED;
+			obj[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 			gem_write(fd, obj[1].handle, 0, batch, sizeof(batch));
 		}
 
-- 
2.32.0
