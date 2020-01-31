Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CEB6FBB0
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 17:31:23 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 31 Jan 2020 23:01:06 +0530
Message-Id: <20200131173109.12527-7-ramalingam.c@intel.com>
In-Reply-To: <20200131173109.12527-1-ramalingam.c@intel.com>
References: <20200131173109.12527-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/9] tests/kms_available_modes_crc: Skip
 test if mappable aperture not supported
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
To: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

If the mappable aperture is not supported, skip the test.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 tests/kms_available_modes_crc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_available_modes_crc.c b/tests/kms_available_modes_crc.c
index d1b7b51708b0..12761343459a 100644
--- a/tests/kms_available_modes_crc.c
+++ b/tests/kms_available_modes_crc.c
@@ -448,6 +448,7 @@ igt_main
 	data.commit = data.display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY;
 
 	igt_subtest("available_mode_test_crc") {
+		gem_require_mappable_ggtt(data.gfx_fd);
 		test_available_modes(&data);
 	}
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
