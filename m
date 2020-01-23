Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6AF6FD64
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2020 14:59:37 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu, 23 Jan 2020 13:30:42 +0530
Message-Id: <1579766442-20285-5-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1579766442-20285-1-git-send-email-kunal1.joshi@intel.com>
References: <1579766442-20285-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t v4 4/4] HAX: Run in BAT
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>, ville.syrjala@intel.com, petri.latvala@intel.com, daniel.vetter@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

For running test on BAT machines.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Suggested-by: Uma Shankar <uma.shankar@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 66 +++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 40d273c..5dfe43d 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -165,6 +165,72 @@ igt@vgem_basic@dmabuf-mmap
 igt@vgem_basic@mmap
 igt@vgem_basic@second-client
 igt@vgem_basic@sysfs
+igt@kms_color_chamelium@pipe-A-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-A-ctm-green-to-red
+igt@kms_color_chamelium@pipe-A-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-A-ctm-0-25
+igt@kms_color_chamelium@pipe-A-ctm-0-5
+igt@kms_color_chamelium@pipe-A-ctm-0-75
+igt@kms_color_chamelium@pipe-A-ctm-max
+igt@kms_color_chamelium@pipe-A-ctm-negative
+igt@kms_color_chamelium@pipe-A-ctm-limited-range
+igt@kms_color_chamelium@pipe-A-degamma
+igt@kms_color_chamelium@pipe-A-gamma
+igt@kms_color_chamelium@pipe-B-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-B-ctm-green-to-red
+igt@kms_color_chamelium@pipe-B-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-B-ctm-0-25
+igt@kms_color_chamelium@pipe-B-ctm-0-5
+igt@kms_color_chamelium@pipe-B-ctm-0-75
+igt@kms_color_chamelium@pipe-B-ctm-max
+igt@kms_color_chamelium@pipe-B-ctm-negative
+igt@kms_color_chamelium@pipe-B-ctm-limited-range
+igt@kms_color_chamelium@pipe-B-degamma
+igt@kms_color_chamelium@pipe-B-gamma
+igt@kms_color_chamelium@pipe-C-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-C-ctm-green-to-red
+igt@kms_color_chamelium@pipe-C-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-C-ctm-0-25
+igt@kms_color_chamelium@pipe-C-ctm-0-5
+igt@kms_color_chamelium@pipe-C-ctm-0-75
+igt@kms_color_chamelium@pipe-C-ctm-max
+igt@kms_color_chamelium@pipe-C-ctm-negative
+igt@kms_color_chamelium@pipe-C-ctm-limited-range
+igt@kms_color_chamelium@pipe-C-degamma
+igt@kms_color_chamelium@pipe-C-gamma
+igt@kms_color_chamelium@pipe-D-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-D-ctm-green-to-red
+igt@kms_color_chamelium@pipe-D-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-D-ctm-0-25
+igt@kms_color_chamelium@pipe-D-ctm-0-5
+igt@kms_color_chamelium@pipe-D-ctm-0-75
+igt@kms_color_chamelium@pipe-D-ctm-max
+igt@kms_color_chamelium@pipe-D-ctm-negative
+igt@kms_color_chamelium@pipe-D-ctm-limited-range
+igt@kms_color_chamelium@pipe-D-degamma
+igt@kms_color_chamelium@pipe-D-gamma
+igt@kms_color_chamelium@pipe-E-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-E-ctm-green-to-red
+igt@kms_color_chamelium@pipe-E-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-E-ctm-0-25
+igt@kms_color_chamelium@pipe-E-ctm-0-5
+igt@kms_color_chamelium@pipe-E-ctm-0-75
+igt@kms_color_chamelium@pipe-E-ctm-max
+igt@kms_color_chamelium@pipe-E-ctm-negative
+igt@kms_color_chamelium@pipe-E-ctm-limited-range
+igt@kms_color_chamelium@pipe-E-degamma
+igt@kms_color_chamelium@pipe-E-gamma
+igt@kms_color_chamelium@pipe-F-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-F-ctm-green-to-red
+igt@kms_color_chamelium@pipe-F-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-F-ctm-0-25
+igt@kms_color_chamelium@pipe-F-ctm-0-5
+igt@kms_color_chamelium@pipe-F-ctm-0-75
+igt@kms_color_chamelium@pipe-F-ctm-max
+igt@kms_color_chamelium@pipe-F-ctm-negative
+igt@kms_color_chamelium@pipe-F-ctm-limited-range
+igt@kms_color_chamelium@pipe-F-degamma
+igt@kms_color_chamelium@pipe-F-gamma
 
 # All tests that do module unloading and reloading are executed last.
 # They will sometimes reveal issues of earlier tests leaving the
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
