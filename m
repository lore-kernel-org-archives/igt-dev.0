Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB496E811
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 10:14:08 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 7 Apr 2020 13:13:38 +0300
Message-ID: <20200407101338.1340310-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20200407101338.1340310-1-arkadiusz.hiler@intel.com>
References: <20200407101338.1340310-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] HAX: add dp-mode-timings to BAT
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
List-ID: <igt-dev@lists.freedesktop.org>

---
 tests/intel-ci/fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 620d5f3a..e7c59cfc 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -89,9 +89,11 @@ igt@kms_busy@basic
 igt@kms_chamelium@dp-hpd-fast
 igt@kms_chamelium@dp-edid-read
 igt@kms_chamelium@dp-crc-fast
+igt@kms_chamelium@dp-mode-timings
 igt@kms_chamelium@hdmi-hpd-fast
 igt@kms_chamelium@hdmi-edid-read
 igt@kms_chamelium@hdmi-crc-fast
+igt@kms_chamelium@hdmi-mode-timings
 igt@kms_chamelium@vga-hpd-fast
 igt@kms_chamelium@vga-edid-read
 igt@kms_chamelium@common-hpd-after-suspend
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
