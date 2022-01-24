Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAA110ED90
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jan 2022 11:27:10 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 24 Jan 2022 16:53:52 +0530
Message-Id: <20220124112352.1970255-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20220124112352.1970255-1-bhanuprakash.modem@intel.com>
References: <20220124112352.1970255-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] HAX: Add deep-color tests to BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, uma.shankar@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 5c867bbf7e..88c281734f 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -104,6 +104,10 @@ igt@kms_chamelium@vga-hpd-fast
 igt@kms_chamelium@vga-edid-read
 igt@kms_chamelium@common-hpd-after-suspend
 igt@kms_prop_blob@basic
+igt@kms_color@pipe-A-deep-color
+igt@kms_color@pipe-B-deep-color
+igt@kms_color@pipe-C-deep-color
+igt@kms_color@pipe-D-deep-color
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
 igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
-- 
2.32.0
