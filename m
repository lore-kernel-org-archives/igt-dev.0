Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37BE10E1E5
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Dec 2023 19:11:44 +0000 (UTC)
From: Melissa Wen <mwen@igalia.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/3] tests/kms_async_flips: test with modifiers only on
 intel devices
Date: Tue, 26 Dec 2023 17:57:34 -0100
Message-ID: <20231226191054.23794-4-mwen@igalia.com>
In-Reply-To: <20231226191054.23794-1-mwen@igalia.com>
References: <20231226191054.23794-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel-dev@igalia.com, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Although increasing the coverage of tests with modifiers, the change
from run_test() to run_test_with_modifiers() is now a regression on
non-intel devices. run_test_with_modifiers() only ensures conditions for
modifiers != LINEAR on intel devices, and the original run_test() is
more consistent across vendors.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 tests/kms_async_flips.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 6fddad093..55d59196e 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -654,7 +654,10 @@ igt_main
 		igt_describe("Wait for page flip events in between successive asynchronous flips");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
 			data.alternate_sync_async = false;
-			run_test_with_modifiers(&data, test_async_flip);
+			if (is_intel_device(data.drm_fd))
+				run_test_with_modifiers(&data, test_async_flip);
+			else
+				run_test(&data, test_async_flip);
 		}
 
 		igt_describe("Alternate between sync and async flips");
-- 
2.43.0
