Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8054A6E072
 for <igt-dev@lists.freedesktop.org>; Thu, 13 May 2021 08:19:44 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Thu, 13 May 2021 13:48:32 +0530
Message-Id: <20210513081832.3756730-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
References: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_lease: Add subtest description
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

Added description for subtest

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: B S Karthik <karthik.b.s@intel.com>

v2: Modified & applied description to each tests seperately. (Petri)
---
 tests/kms_lease.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 6397ef8f..0c019a46 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1281,21 +1281,27 @@ igt_main
 	const struct {
 		const char *name;
 		void (*func)(data_t *);
+		const char *desc;
 	} funcs[] = {
-		{ "simple_lease", simple_lease },
-		{ "lessee_list", lessee_list },
-		{ "lease_get", lease_get },
-		{ "lease_unleased_connector", lease_unleased_connector },
-		{ "lease_unleased_crtc", lease_unleased_crtc },
-		{ "lease_revoke", lease_revoke },
-		{ "lease_again", lease_again },
-		{ "lease_invalid_connector", lease_invalid_connector },
-		{ "lease_invalid_crtc", lease_invalid_crtc },
-		{ "lease_invalid_plane", lease_invalid_plane },
-		{ "page_flip_implicit_plane", page_flip_implicit_plane },
-		{ "setcrtc_implicit_plane", setcrtc_implicit_plane },
-		{ "cursor_implicit_plane", cursor_implicit_plane },
-		{ "atomic_implicit_crtc", atomic_implicit_crtc },
+		{ "simple_lease", simple_lease, "Check if create lease ioctl call works correctly" },
+		{ "lessee_list", lessee_list, "Check if listed lease is same as corrected one" },
+		{ "lease_get", lease_get, "Tests getting the required contents of a lease" },
+		{ "lease_unleased_connector", lease_unleased_connector, "Check if func fails on an"
+			"unleased connector" },
+		{ "lease_unleased_crtc", lease_unleased_crtc, "Check if func fails on unleased crtc" },
+		{ "lease_revoke", lease_revoke, "Tests revocation of lease" },
+		{ "lease_again", lease_again, "Tests leasing objects more than once" },
+		{ "lease_invalid_connector", lease_invalid_connector, "Tests leasing an invalid connector" },
+		{ "lease_invalid_crtc", lease_invalid_crtc, "Tests leasing an invalid crtc" },
+		{ "lease_invalid_plane", lease_invalid_plane, "Tests leasing an invalid plane" },
+		{ "page_flip_implicit_plane", page_flip_implicit_plane, "Check that page-flip ioclt"
+			"fails correctly on implicit primary plane" },
+		{ "setcrtc_implicit_plane", setcrtc_implicit_plane, "Check that setcrtc ioctl fails"
+			"correctly on implicit primary plane" },
+		{ "cursor_implicit_plane", cursor_implicit_plane, "Check that setcursor ioctl fails"
+			"correctly on implicit primary plane" },
+		{ "atomic_implicit_crtc", atomic_implicit_crtc, "Check that atomic ioctl fails correctly"
+			"on crtc_id property" },
 		{ }
 	}, *f;
 
@@ -1307,6 +1313,7 @@ igt_main
 
 	for (f = funcs; f->name; f++) {
 
+		igt_describe(f->desc);
 		igt_subtest_f("%s", f->name) {
 			run_test(&data, f->func);
 		}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
