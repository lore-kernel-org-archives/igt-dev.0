Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D9311A2A7
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 18:47:53 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 May 2022 00:18:22 +0530
Message-Id: <20220519184822.30496-6-jeevan.b@intel.com>
In-Reply-To: <20220519184822.30496-1-jeevan.b@intel.com>
References: <20220519184822.30496-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 5/5] HAX: Test CCS patches
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index b579c20a..3e944986 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -97,6 +97,10 @@ igt@kms_chamelium@hdmi-crc-fast
 igt@kms_chamelium@vga-hpd-fast
 igt@kms_chamelium@vga-edid-read
 igt@kms_prop_blob@basic
+igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc
+igt@kms_getfb@getfb2-accept-ccs
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
 igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
-- 
2.36.0
