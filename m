Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7083110E008
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Nov 2022 04:38:36 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Nov 2022 10:08:14 +0530
Message-Id: <20221102043814.3821683-3-riana.tauro@intel.com>
In-Reply-To: <20221102043814.3821683-1-riana.tauro@intel.com>
References: <20221102043814.3821683-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/intel-ci/fast-feedback: Add
 basic-hwmon test to BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add basic-hwmon test to fast-feedback list. This test verifies the
hwmon directory for dgfx and prints all its entries.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index bd5538a0..f57f8ff3 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -4,6 +4,7 @@ igt@i915_module_load@load
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
+igt@debugfs_test@basic-hwmon
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.25.1
