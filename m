Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A06F10F238
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 13:50:14 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 31 Mar 2023 19:15:56 +0530
Message-Id: <20230331134556.4077113-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230331134556.4077113-1-bhanuprakash.modem@intel.com>
References: <20230331134556.4077113-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 5/5] xe-fast-feedback: Add basic kms tests to
 XE BAT
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

Add display's connector detect, addfb2 and prop tests to XE BAT.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 5f3bd2e91..5efb226ca 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -140,3 +140,33 @@ igt@xe_vm@munmap-style-unbind-userptr-front
 igt@xe_vm@munmap-style-unbind-userptr-inval-end
 igt@xe_vm@munmap-style-unbind-userptr-inval-front
 igt@xe_waitfence@test
+igt@kms_addfb_basic@addfb25-bad-modifier
+igt@kms_addfb_basic@addfb25-modifier-no-flag
+igt@kms_addfb_basic@bad-pitch-0
+igt@kms_addfb_basic@bad-pitch-1024
+igt@kms_addfb_basic@bad-pitch-128
+igt@kms_addfb_basic@bad-pitch-256
+igt@kms_addfb_basic@bad-pitch-32
+igt@kms_addfb_basic@bad-pitch-63
+igt@kms_addfb_basic@bad-pitch-65536
+igt@kms_addfb_basic@bad-pitch-999
+igt@kms_addfb_basic@basic
+igt@kms_addfb_basic@bo-too-small
+igt@kms_addfb_basic@invalid-get-prop
+igt@kms_addfb_basic@invalid-get-prop-any
+igt@kms_addfb_basic@invalid-set-prop
+igt@kms_addfb_basic@invalid-set-prop-any
+igt@kms_addfb_basic@no-handle
+igt@kms_addfb_basic@size-max
+igt@kms_addfb_basic@small-bo
+igt@kms_addfb_basic@too-high
+igt@kms_addfb_basic@too-wide
+igt@kms_addfb_basic@unused-handle
+igt@kms_addfb_basic@unused-modifier
+igt@kms_addfb_basic@unused-offsets
+igt@kms_addfb_basic@unused-pitches
+igt@kms_force_connector_basic@force-connector-state
+igt@kms_force_connector_basic@force-edid
+igt@kms_force_connector_basic@force-load-detect
+igt@kms_force_connector_basic@prune-stale-modes
+igt@kms_prop_blob@basic
-- 
2.40.0
