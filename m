Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3574610FBFA
 for <igt-dev@lists.freedesktop.org>; Thu, 12 May 2022 05:37:15 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 12 May 2022 11:04:27 +0530
Message-Id: <20220512053427.2754986-4-riana.tauro@intel.com>
In-Reply-To: <20220512053427.2754986-1-riana.tauro@intel.com>
References: <20220512053427.2754986-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 3/3] tests/intel-ci/fast-feedback: Add
 suspend tests without i915 to fast-feedback list
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

From: "Tauro, Riana" <riana.tauro@intel.com>

Add basic-s2idle-without-i915 and basic-s3-without-i915
to fast-feedback list.

v2: rebase
v3: rebase

Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Acked-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index d075aa31..b579c20a 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -176,7 +176,8 @@ igt@i915_selftest@live
 igt@dmabuf@all
 
 # System wide suspend tests
-igt@i915_suspend@system-suspend-without-i915
+igt@i915_suspend@basic-s2idle-without-i915
+igt@i915_suspend@basic-s3-without-i915
 igt@gem_exec_suspend@basic-s0
 igt@gem_exec_suspend@basic-s3
 igt@kms_chamelium@common-hpd-after-suspend
-- 
2.25.1
