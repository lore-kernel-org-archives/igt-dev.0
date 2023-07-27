Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B33610E5CF
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 16:54:18 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Jul 2023 22:24:01 +0530
Message-Id: <20230727165401.926688-11-swati2.sharma@intel.com>
In-Reply-To: <20230727165401.926688-1-swati2.sharma@intel.com>
References: <20230727165401.926688-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 10/10] HAX: Add dsc tests to fast-feedback.testlist
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

---
 tests/intel-ci/fast-feedback.testlist | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 31639c892..fb33894ab 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -181,3 +181,13 @@ igt@gem_exec_suspend@basic-s0
 igt@gem_exec_suspend@basic-s3
 igt@kms_chamelium_hpd@common-hpd-after-suspend
 igt@kms_pipe_crc_basic@suspend-read-crc
+
+# hack
+igt@kms_dsc@dsc-basic
+igt@kms_dsc@dsc-fractional-bpp
+igt@kms_dsc@dsc-fractional-bpp-with-bpc
+igt@kms_dsc@dsc-with-bpc
+igt@kms_dsc@dsc-with-bpc-formats
+igt@kms_dsc@dsc-with-formats
+igt@kms_dsc@dsc-with-output-formats
+igt@kms_dsc@dsc-with-output-formats-with-bpc
-- 
2.25.1
