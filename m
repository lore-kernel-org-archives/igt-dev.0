Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF90110E48E
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 05:49:36 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Aug 2023 11:11:22 +0530
Message-Id: <20230824054123.820518-16-bhanuprakash.modem@intel.com>
In-Reply-To: <20230824054123.820518-1-bhanuprakash.modem@intel.com>
References: <20230824054123.820518-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 15/16] tests/intel-ci: Add tiling tests to XE BAT
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 026e06ab5..4f4991fba 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -183,7 +183,13 @@ igt@xe_vm@munmap-style-unbind-userptr-inval-front
 igt@xe_waitfence@abstime
 igt@xe_waitfence@reltime
 igt@kms_addfb_basic@addfb25-bad-modifier
+igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
 igt@kms_addfb_basic@addfb25-modifier-no-flag
+igt@kms_addfb_basic@addfb25-x-tiled-legacy
+igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
+igt@kms_addfb_basic@addfb25-yf-tiled-legacy
+igt@kms_addfb_basic@addfb25-y-tiled-legacy
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
 igt@kms_addfb_basic@bad-pitch-0
 igt@kms_addfb_basic@bad-pitch-1024
 igt@kms_addfb_basic@bad-pitch-128
@@ -193,7 +199,11 @@ igt@kms_addfb_basic@bad-pitch-63
 igt@kms_addfb_basic@bad-pitch-65536
 igt@kms_addfb_basic@bad-pitch-999
 igt@kms_addfb_basic@basic
+igt@kms_addfb_basic@basic-x-tiled-legacy
+igt@kms_addfb_basic@basic-y-tiled-legacy
 igt@kms_addfb_basic@bo-too-small
+igt@kms_addfb_basic@bo-too-small-due-to-tiling
+igt@kms_addfb_basic@framebuffer-vs-set-tiling
 igt@kms_addfb_basic@invalid-get-prop
 igt@kms_addfb_basic@invalid-get-prop-any
 igt@kms_addfb_basic@invalid-set-prop
@@ -201,6 +211,7 @@ igt@kms_addfb_basic@invalid-set-prop-any
 igt@kms_addfb_basic@no-handle
 igt@kms_addfb_basic@size-max
 igt@kms_addfb_basic@small-bo
+igt@kms_addfb_basic@tile-pitch-mismatch
 igt@kms_addfb_basic@too-high
 igt@kms_addfb_basic@too-wide
 igt@kms_addfb_basic@unused-handle
-- 
2.40.0
