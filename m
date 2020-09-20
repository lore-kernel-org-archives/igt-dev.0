Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7878F89C89
 for <igt-dev@lists.freedesktop.org>; Sun, 20 Sep 2020 18:56:06 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Mon, 21 Sep 2020 00:26:15 +0530
Message-Id: <20200920185615.133623-5-kunal1.joshi@intel.com>
In-Reply-To: <20200920185615.133623-1-kunal1.joshi@intel.com>
References: <20200920185615.133623-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 4/4] HAX: Run in BAT
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
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index aa2eb329..3f14e966 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -83,6 +83,7 @@ igt@kms_addfb_basic@unused-modifier
 igt@kms_addfb_basic@unused-offsets
 igt@kms_addfb_basic@unused-pitches
 igt@kms_busy@basic
+igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium
 igt@kms_chamelium@dp-hpd-fast
 igt@kms_chamelium@dp-edid-read
 igt@kms_chamelium@dp-crc-fast
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
