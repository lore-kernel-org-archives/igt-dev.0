Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE32A10E9BD
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 13:42:47 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 May 2022 19:09:27 +0530
Message-Id: <20220530133927.3864033-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20220530133927.3864033-1-bhanuprakash.modem@intel.com>
References: <20220530133927.3864033-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V2 4/4] HAX: Add hdr & deep color tests to BAT
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index b579c20a..aa4db852 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -105,6 +105,13 @@ igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
 igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
 igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
 igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
+igt@kms_color@pipe-A-deep-color
+igt@kms_color@pipe-B-deep-color
+igt@kms_color@pipe-C-deep-color
+igt@kms_color@pipe-D-deep-color
+igt@kms_hdr@bpc-switch
+igt@kms_hdr@static-toggle
+igt@kms_hdr@static-swap
 igt@kms_flip@basic-flip-vs-dpms
 igt@kms_flip@basic-flip-vs-modeset
 igt@kms_flip@basic-flip-vs-wf_vblank
-- 
2.35.1
