Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D722C6EA05
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Feb 2021 09:40:05 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu, 18 Feb 2021 15:08:59 +0530
Message-Id: <20210218093859.29006-4-kunal1.joshi@intel.com>
In-Reply-To: <20210218093859.29006-1-kunal1.joshi@intel.com>
References: <20210218093859.29006-1-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t 3/3] HAX: BAT RUN,
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: mukunda.pramodh.kumar@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Just to run for testing purpose

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index eaa904fa..f8ceecdf 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -90,6 +90,8 @@ igt@kms_busy@basic
 igt@kms_chamelium@dp-hpd-fast
 igt@kms_chamelium@dp-edid-read
 igt@kms_chamelium@dp-crc-fast
+igt@kms_chamelium@dp-frame-dump
+igt@kms_color_chamelium@pipe-A-gamma
 igt@kms_chamelium@hdmi-hpd-fast
 igt@kms_chamelium@hdmi-edid-read
 igt@kms_chamelium@hdmi-crc-fast
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
