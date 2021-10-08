Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665DF6E0B7
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 06:54:54 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  8 Oct 2021 08:54:29 +0200
Message-Id: <20211008065432.15482-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
References: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/7] tests/gem_evict_alignment: Skip if
 kernel doesn't support passing alignment
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/gem_evict_alignment.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_evict_alignment.c b/tests/i915/gem_evict_alignment.c
index e5176b9ba..ab1271788 100644
--- a/tests/i915/gem_evict_alignment.c
+++ b/tests/i915/gem_evict_alignment.c
@@ -198,6 +198,7 @@ igt_main
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_blitter(fd);
+		igt_require(gem_allows_passing_alignment(fd));
 		igt_fork_hang_detector(fd);
 	}
 
-- 
2.26.0
