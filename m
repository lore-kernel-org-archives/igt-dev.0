Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98CF10E7E3
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 18:12:21 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Jan 2023 19:12:03 +0100
Message-Id: <20230111181205.55997-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230111181205.55997-1-zbigniew.kempczynski@intel.com>
References: <20230111181205.55997-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/intel_allocator: Fix alignment
 variable used in debug path
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

During work on allocator I've missed alignment was replaced by
default_alignment what makes a compilation error when debug path
is enabled.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_allocator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index 060a65ce18..2b08dd5996 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -351,7 +351,7 @@ static struct allocator *allocator_open(int fd, uint32_t ctx, uint32_t vm,
 			   "default alignment: 0x%llx "
 			   "not found, creating one\n",
 			   fd, ctx, vm, (long long) start, (long long) end,
-			   (long long) alignment);
+			   (long long) default_alignment);
 		ial = intel_allocator_create(fd, start, end, allocator_type,
 					     allocator_strategy,
 					     default_alignment);
-- 
2.34.1
