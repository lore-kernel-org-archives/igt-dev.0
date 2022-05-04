Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C99D10EBA2
 for <igt-dev@lists.freedesktop.org>; Wed,  4 May 2022 13:35:57 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 May 2022 19:03:23 +0530
Message-Id: <20220504133324.2576100-3-riana.tauro@intel.com>
In-Reply-To: <20220504133324.2576100-1-riana.tauro@intel.com>
References: <20220504133324.2576100-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 2/3] tests/intel-ci/fast-feedback: Add
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
