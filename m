Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0264D10E11D
 for <igt-dev@lists.freedesktop.org>; Sat, 26 Aug 2023 19:08:20 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 19:06:38 +0530
Message-Id: <20220421133638.1492-3-mohammed.thasleem@intel.com>
In-Reply-To: <20220421133638.1492-1-mohammed.thasleem@intel.com>
References: <20220421133638.1492-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 2/2] HAX: Check kms lease
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
 tests/intel-ci/xe-fast-feedback.testlist | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 311f90c79..3b617540d 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,27 @@
 # Should be the first test
 igt@xe_module_load@load
 
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
 igt@xe_compute@compute-square
 igt@xe_create@create-execqueues-noleak
 igt@xe_create@create-execqueues-leak
-- 
2.25.1
