Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB49810E62A
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 07:39:19 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 13:00:58 +0530
Message-Id: <20230825073059.856371-16-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825073059.856371-1-bhanuprakash.modem@intel.com>
References: <20230825073059.856371-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 15/16] tests/intel-ci: Add tiling tests to XE
 BAT
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

Add basic tiling tests to XE fast feedback testlist.

V2: - Drop i915 specific tests

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 026e06ab5..ef7ddff24 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -184,6 +184,11 @@ igt@xe_waitfence@abstime
 igt@xe_waitfence@reltime
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-modifier-no-flag
+igt@kms_addfb_basic@addfb25-x-tiled-legacy
+igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
+igt@kms_addfb_basic@addfb25-yf-tiled-legacy
+igt@kms_addfb_basic@addfb25-y-tiled-legacy
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
 igt@kms_addfb_basic@bad-pitch-0
 igt@kms_addfb_basic@bad-pitch-1024
 igt@kms_addfb_basic@bad-pitch-128
@@ -193,6 +198,8 @@ igt@kms_addfb_basic@bad-pitch-63
 igt@kms_addfb_basic@bad-pitch-65536
 igt@kms_addfb_basic@bad-pitch-999
 igt@kms_addfb_basic@basic
+igt@kms_addfb_basic@basic-x-tiled-legacy
+igt@kms_addfb_basic@basic-y-tiled-legacy
 igt@kms_addfb_basic@bo-too-small
 igt@kms_addfb_basic@invalid-get-prop
 igt@kms_addfb_basic@invalid-get-prop-any
@@ -201,6 +208,7 @@ igt@kms_addfb_basic@invalid-set-prop-any
 igt@kms_addfb_basic@no-handle
 igt@kms_addfb_basic@size-max
 igt@kms_addfb_basic@small-bo
+igt@kms_addfb_basic@tile-pitch-mismatch
 igt@kms_addfb_basic@too-high
 igt@kms_addfb_basic@too-wide
 igt@kms_addfb_basic@unused-handle
-- 
2.40.0
