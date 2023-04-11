Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D2E10E23A
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 16:16:25 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Apr 2023 19:15:54 +0300
Message-Id: <20230411161555.10001-10-ville.syrjala@linux.intel.com>
In-Reply-To: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
References: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 9/9] tests/intel-ci/fast-feedback: Run
 ctm tests
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

---
 tests/intel-ci/fast-feedback.testlist | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index d9fcb62d6e78..33e825772c96 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -181,3 +181,14 @@ igt@gem_exec_suspend@basic-s0
 igt@gem_exec_suspend@basic-s3
 igt@kms_chamelium_hpd@common-hpd-after-suspend
 igt@kms_pipe_crc_basic@suspend-read-crc
+
+igt@kms_color@ctm-red-to-blue
+igt@kms_color@ctm-green-to-red
+igt@kms_color@ctm-blue-to-red
+igt@kms_color@ctm-max
+igt@kms_color@ctm-negative
+igt@kms_color@ctm-0-25
+igt@kms_color@ctm-0-50
+igt@kms_color@ctm-0-75
+igt@kms_color@ctm-signed
+igt@kms_color@invalid-ctm-matrix-sizes
-- 
2.39.2
