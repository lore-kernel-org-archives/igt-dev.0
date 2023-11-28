Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EF810E424
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 06:25:52 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Tue, 28 Nov 2023 11:45:32 +0530
Message-Id: <20231128061533.2612350-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20231128061533.2612350-1-bhanuprakash.modem@intel.com>
References: <20231128061533.2612350-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/3] tests/intel-ci/xe: Drop unsupported tests
 from XE BAT
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

Drop i915 specific tests from XE BAT.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 2a95bd037..67715519f 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -153,7 +153,6 @@ igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-modifier-no-flag
 igt@kms_addfb_basic@addfb25-x-tiled-legacy
-igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
 igt@kms_addfb_basic@addfb25-yf-tiled-legacy
 igt@kms_addfb_basic@addfb25-y-tiled-legacy
 igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
@@ -167,7 +166,6 @@ igt@kms_addfb_basic@bad-pitch-65536
 igt@kms_addfb_basic@bad-pitch-999
 igt@kms_addfb_basic@basic
 igt@kms_addfb_basic@basic-x-tiled-legacy
-igt@kms_addfb_basic@basic-y-tiled-legacy
 igt@kms_addfb_basic@bo-too-small
 igt@kms_addfb_basic@invalid-get-prop
 igt@kms_addfb_basic@invalid-get-prop-any
@@ -176,7 +174,6 @@ igt@kms_addfb_basic@invalid-set-prop-any
 igt@kms_addfb_basic@no-handle
 igt@kms_addfb_basic@size-max
 igt@kms_addfb_basic@small-bo
-igt@kms_addfb_basic@tile-pitch-mismatch
 igt@kms_addfb_basic@too-high
 igt@kms_addfb_basic@too-wide
 igt@kms_addfb_basic@unused-handle
-- 
2.40.0
