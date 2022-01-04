Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E500110E3FD
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jan 2022 08:05:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Tue,  4 Jan 2022 13:32:35 +0530
Message-Id: <20220104080235.1715444-16-bhanuprakash.modem@intel.com>
In-Reply-To: <20220104080235.1715444-1-bhanuprakash.modem@intel.com>
References: <20220104080235.1715444-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 i-g-t 15/15] HAX: Add color mgmt tests to BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 112 ++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index de1c6cb46c..0bdd82f9bc 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -102,6 +102,118 @@ igt@kms_chamelium@hdmi-crc-fast
 igt@kms_chamelium@vga-hpd-fast
 igt@kms_chamelium@vga-edid-read
 igt@kms_chamelium@common-hpd-after-suspend
+igt@kms_color@pipe-A-ctm-red-to-blue
+igt@kms_color@pipe-A-ctm-green-to-red
+igt@kms_color@pipe-A-ctm-blue-to-red
+igt@kms_color@pipe-A-ctm-0-25
+igt@kms_color@pipe-A-ctm-0-5
+igt@kms_color@pipe-A-ctm-0-75
+igt@kms_color@pipe-A-ctm-max
+igt@kms_color@pipe-A-ctm-negative
+igt@kms_color@pipe-A-degamma
+igt@kms_color@pipe-A-gamma
+igt@kms_color@pipe-A-legacy-gamma
+igt@kms_color@pipe-A-legacy-gamma-reset
+igt@kms_color@pipe-A-invalid-gamma-lut-sizes
+igt@kms_color@pipe-A-invalid-degamma-lut-sizes
+igt@kms_color@pipe-A-invalid-ctm-matrix-sizes
+igt@kms_color@pipe-A-plane-gamma
+igt@kms_color@pipe-A-plane-degamma
+igt@kms_color@pipe-A-plane-ctm-red-to-blue
+igt@kms_color@pipe-A-plane-ctm-green-to-red
+igt@kms_color@pipe-A-plane-ctm-blue-to-red
+igt@kms_color@pipe-A-plane-ctm-max
+igt@kms_color@pipe-A-plane-ctm-negative
+igt@kms_color@pipe-A-plane-ctm-0-25
+igt@kms_color@pipe-A-plane-ctm-0-50
+igt@kms_color@pipe-A-plane-ctm-0-75
+igt@kms_color@pipe-A-invalid-plane-gamma-lut-sizes
+igt@kms_color@pipe-A-invalid-plane-degamma-lut-sizes
+igt@kms_color@pipe-A-invalid-plane-ctm-matrix-sizes
+igt@kms_color@pipe-B-ctm-red-to-blue
+igt@kms_color@pipe-B-ctm-green-to-red
+igt@kms_color@pipe-B-ctm-blue-to-red
+igt@kms_color@pipe-B-ctm-0-25
+igt@kms_color@pipe-B-ctm-0-5
+igt@kms_color@pipe-B-ctm-0-75
+igt@kms_color@pipe-B-ctm-max
+igt@kms_color@pipe-B-ctm-negative
+igt@kms_color@pipe-B-degamma
+igt@kms_color@pipe-B-gamma
+igt@kms_color@pipe-B-legacy-gamma
+igt@kms_color@pipe-B-legacy-gamma-reset
+igt@kms_color@pipe-B-invalid-gamma-lut-sizes
+igt@kms_color@pipe-B-invalid-degamma-lut-sizes
+igt@kms_color@pipe-B-invalid-ctm-matrix-sizes
+igt@kms_color@pipe-B-plane-gamma
+igt@kms_color@pipe-B-plane-degamma
+igt@kms_color@pipe-B-plane-ctm-red-to-blue
+igt@kms_color@pipe-B-plane-ctm-green-to-red
+igt@kms_color@pipe-B-plane-ctm-blue-to-red
+igt@kms_color@pipe-B-plane-ctm-max
+igt@kms_color@pipe-B-plane-ctm-negative
+igt@kms_color@pipe-B-plane-ctm-0-25
+igt@kms_color@pipe-B-plane-ctm-0-50
+igt@kms_color@pipe-B-plane-ctm-0-75
+igt@kms_color@pipe-B-invalid-plane-gamma-lut-sizes
+igt@kms_color@pipe-B-invalid-plane-degamma-lut-sizes
+igt@kms_color@pipe-B-invalid-plane-ctm-matrix-sizes
+igt@kms_color@pipe-C-ctm-red-to-blue
+igt@kms_color@pipe-C-ctm-green-to-red
+igt@kms_color@pipe-C-ctm-blue-to-red
+igt@kms_color@pipe-C-ctm-0-25
+igt@kms_color@pipe-C-ctm-0-5
+igt@kms_color@pipe-C-ctm-0-75
+igt@kms_color@pipe-C-ctm-max
+igt@kms_color@pipe-C-ctm-negative
+igt@kms_color@pipe-C-degamma
+igt@kms_color@pipe-C-gamma
+igt@kms_color@pipe-C-legacy-gamma
+igt@kms_color@pipe-C-legacy-gamma-reset
+igt@kms_color@pipe-C-invalid-gamma-lut-sizes
+igt@kms_color@pipe-C-invalid-degamma-lut-sizes
+igt@kms_color@pipe-C-invalid-ctm-matrix-sizes
+igt@kms_color@pipe-C-plane-gamma
+igt@kms_color@pipe-C-plane-degamma
+igt@kms_color@pipe-C-plane-ctm-red-to-blue
+igt@kms_color@pipe-C-plane-ctm-green-to-red
+igt@kms_color@pipe-C-plane-ctm-blue-to-red
+igt@kms_color@pipe-C-plane-ctm-max
+igt@kms_color@pipe-C-plane-ctm-negative
+igt@kms_color@pipe-C-plane-ctm-0-25
+igt@kms_color@pipe-C-plane-ctm-0-50
+igt@kms_color@pipe-C-plane-ctm-0-75
+igt@kms_color@pipe-C-invalid-plane-gamma-lut-sizes
+igt@kms_color@pipe-C-invalid-plane-degamma-lut-sizes
+igt@kms_color@pipe-C-invalid-plane-ctm-matrix-sizes
+igt@kms_color@pipe-D-ctm-red-to-blue
+igt@kms_color@pipe-D-ctm-green-to-red
+igt@kms_color@pipe-D-ctm-blue-to-red
+igt@kms_color@pipe-D-ctm-0-25
+igt@kms_color@pipe-D-ctm-0-5
+igt@kms_color@pipe-D-ctm-0-75
+igt@kms_color@pipe-D-ctm-max
+igt@kms_color@pipe-D-ctm-negative
+igt@kms_color@pipe-D-degamma
+igt@kms_color@pipe-D-gamma
+igt@kms_color@pipe-D-legacy-gamma
+igt@kms_color@pipe-D-legacy-gamma-reset
+igt@kms_color@pipe-D-invalid-gamma-lut-sizes
+igt@kms_color@pipe-D-invalid-degamma-lut-sizes
+igt@kms_color@pipe-D-invalid-ctm-matrix-sizes
+igt@kms_color@pipe-D-plane-gamma
+igt@kms_color@pipe-D-plane-degamma
+igt@kms_color@pipe-D-plane-ctm-red-to-blue
+igt@kms_color@pipe-D-plane-ctm-green-to-red
+igt@kms_color@pipe-D-plane-ctm-blue-to-red
+igt@kms_color@pipe-D-plane-ctm-max
+igt@kms_color@pipe-D-plane-ctm-negative
+igt@kms_color@pipe-D-plane-ctm-0-25
+igt@kms_color@pipe-D-plane-ctm-0-50
+igt@kms_color@pipe-D-plane-ctm-0-75
+igt@kms_color@pipe-D-invalid-plane-gamma-lut-sizes
+igt@kms_color@pipe-D-invalid-plane-degamma-lut-sizes
+igt@kms_color@pipe-D-invalid-plane-ctm-matrix-sizes
 igt@kms_prop_blob@basic
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
-- 
2.32.0
