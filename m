Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C285B10E20E
 for <igt-dev@lists.freedesktop.org>; Sun, 27 Aug 2023 20:26:13 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Aug 2023 01:47:57 +0530
Message-Id: <20230827201757.49425-3-mohammed.thasleem@intel.com>
In-Reply-To: <20230827201757.49425-1-mohammed.thasleem@intel.com>
References: <20230827201757.49425-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 2/2] HAX: Check kms lease
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

Check kms lease test cases

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index c09c6c417..4042b690b 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,27 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_lease@simple_lease
+igt@kms_lease@empty_lease
+igt@kms_lease@lessee_list
+igt@kms_lease@lease_get
+igt@kms_lease@lease_unleased_connector
+igt@kms_lease@lease_unleased_crtc
+igt@kms_lease@lease_revoke
+igt@kms_lease@lease_again
+igt@kms_lease@lease_invalid_connector
+igt@kms_lease@lease_invalid_crtc
+igt@kms_lease@lease_invalid_plane
+igt@kms_lease@page_flip_implicit_plane
+igt@kms_lease@setcrtc_implicit_plane
+igt@kms_lease@cursor_implicit_plane
+igt@kms_lease@atomic_implicit_crtc
+igt@kms_lease@invalid-create-leases
+igt@kms_lease@possible-crtcs-filtering
+igt@kms_lease@master-vs-lease
+igt@kms_lease@multimaster-lease
+igt@kms_lease@implicit-plane-lease
+igt@kms_lease@lease-uevent
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.25.1
