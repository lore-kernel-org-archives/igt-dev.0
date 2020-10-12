Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0596E44B
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2020 12:39:04 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 12 Oct 2020 14:38:59 +0200
Message-Id: <20201012123900.485289-3-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20201012123900.485289-1-maarten.lankhorst@linux.intel.com>
References: <20201012123900.485289-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/gem_exec_reloc: Cap max amount of
 active relocations in basic-many-active.
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

Especially with -EDEADLK handling we can add relocations many times,
cap the amount of relocations tested, so that we still correctly
test that we can fill more than PAGE_SIZE / sizeof(relocation)
relocations.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Bugzilla: https://gitlab.freedesktop.org/drm/intel/-/issues/2389
---
 tests/i915/gem_exec_reloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index cb1a04b111f0..d9cb5cc78d9e 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -405,7 +405,7 @@ static void __many_active(int i915, unsigned engine, unsigned long count)
 
 static void many_active(int i915, unsigned engine)
 {
-	const uint64_t max = gem_aperture_size(i915) / 2;
+	const uint64_t max = 8192;
 	unsigned long count = 256;
 
 	igt_until_timeout(2) {
@@ -419,7 +419,7 @@ static void many_active(int i915, unsigned engine)
 		__many_active(i915, engine, count);
 
 		count <<= 1;
-		if (count * 8 >= max)
+		if (count > max)
 			break;
 	}
 }
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
