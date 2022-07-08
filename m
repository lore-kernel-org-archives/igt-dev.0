Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F24113054
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Jul 2022 12:27:12 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Jul 2022 14:27:04 +0200
Message-Id: <20220708122704.16216-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_create: use correct type for
 assert
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: matthew.auld@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

visible_size is u64 hence use igt_assert_neq_u64 instead
of igt_assert_neq.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/gem_create.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 1b694c6ad..d2b41e10b 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -707,7 +707,7 @@ static void create_ext_cpu_access_big(int fd)
 
 		lmem_size = qmr.probed_size;
 		visible_size = qmr.probed_cpu_visible_size;
-		igt_assert_neq(visible_size, 0);
+		igt_assert_neq_u64(visible_size, 0);
 
 		if (visible_size <= (0.70 * lmem_size)) {
 			/*
-- 
2.35.1

Intel Deutschland GmbH
Registered Address: Am Campeon 10, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de <http://www.intel.de>
Managing Directors: Christin Eisenschmid, Sharon Heck, Tiffany Doon Silva  
Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928
