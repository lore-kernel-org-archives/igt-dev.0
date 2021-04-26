Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2306E53E
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Apr 2021 08:01:59 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Mon, 26 Apr 2021 13:42:08 +0530
Message-Id: <20210426081208.12586-5-kunal1.joshi@intel.com>
In-Reply-To: <20210426081208.12586-1-kunal1.joshi@intel.com>
References: <20210426081208.12586-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] HAX: Run in BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

BAT run to test the patch, not for merge

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index fa5006d2..2f807fcf 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,5 +1,12 @@
 # Keep alphabetically sorted by default
 
+igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium
+igt@kms_chamelium@dp-hpd-fast
+igt@kms_chamelium@dp-edid-read
+igt@kms_chamelium@dp-crc-fast
+igt@kms_chamelium@hdmi-hpd-fast
+igt@kms_chamelium@hdmi-edid-read
+igt@kms_chamelium@hdmi-crc-fast
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
 igt@fbdev@eof
@@ -89,12 +96,6 @@ igt@kms_addfb_basic@unused-modifier
 igt@kms_addfb_basic@unused-offsets
 igt@kms_addfb_basic@unused-pitches
 igt@kms_busy@basic
-igt@kms_chamelium@dp-hpd-fast
-igt@kms_chamelium@dp-edid-read
-igt@kms_chamelium@dp-crc-fast
-igt@kms_chamelium@hdmi-hpd-fast
-igt@kms_chamelium@hdmi-edid-read
-igt@kms_chamelium@hdmi-crc-fast
 igt@kms_chamelium@vga-hpd-fast
 igt@kms_chamelium@vga-edid-read
 igt@kms_chamelium@common-hpd-after-suspend
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
