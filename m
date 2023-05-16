Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBD010E27D
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 16:56:36 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 janga.rahul.kumar@intel.com
Date: Tue, 16 May 2023 22:20:48 +0530
Message-Id: <20230516165058.4047595-11-bhanuprakash.modem@intel.com>
In-Reply-To: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
References: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 10/20] tests/i915/kms_mmap_write_crc: Avoid
 closing the closed fd
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

Avoid closing the closed fd.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_mmap_write_crc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index bc51975f6..2a2526417 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -306,6 +306,5 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 		close(data.drm_fd);
 
 		igt_stop_helper(&hog);
-		close(data.drm_fd);
 	}
 }
-- 
2.40.0
