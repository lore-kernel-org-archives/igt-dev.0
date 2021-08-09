Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A0189BF0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 13:08:58 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  9 Aug 2021 15:04:56 +0200
Message-Id: <20210809130533.27759-29-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
References: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 28/65] tests/gem_lut_handle: Require
 relocation support
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
Cc: Andrzej Turko <andrzej.turko@linux.intel.com>, =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Andrzej Turko <andrzej.turko@linux.intel.com>

This test only exercises relocations so it must be skipped on generations
which do not support them.

Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_lut_handle.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_lut_handle.c b/tests/i915/gem_lut_handle.c
index 64dbb87c5..32f76aaa0 100644
--- a/tests/i915/gem_lut_handle.c
+++ b/tests/i915/gem_lut_handle.c
@@ -170,6 +170,7 @@ igt_simple_main
 	int fd, i;
 
 	fd = drm_open_driver(DRIVER_INTEL);
+	igt_require(gem_has_relocations(fd));
 
 	handle = gem_create(fd, 4096);
 	gem_write(fd, handle, 0, batch, sizeof(batch));
-- 
2.26.0
