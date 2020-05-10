Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF266E0F3
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2020 02:33:34 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Mon, 11 May 2020 01:05:51 +0530
Message-Id: <20200510193551.9818-3-kunal1.joshi@intel.com>
In-Reply-To: <20200510193551.9818-1-kunal1.joshi@intel.com>
References: <20200510193551.9818-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] HAX: Run in BAT
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
To: arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org, imre.deak@intel.com
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Run in bat

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 2ccad438..11833c6d 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -85,6 +85,7 @@ igt@kms_addfb_basic@unused-offsets
 igt@kms_addfb_basic@unused-pitches
 igt@kms_busy@basic
 igt@kms_chamelium@dp-hpd-fast
+igt@kms_chamelium@dp-mode-timings
 igt@kms_chamelium@dp-edid-read
 igt@kms_chamelium@dp-crc-fast
 igt@kms_chamelium@hdmi-hpd-fast
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
