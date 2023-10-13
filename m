Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76E510E137
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 09:31:57 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.15.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7449D580DC5
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 02:31:56 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qrEWQ-0035op-1S
 for igt-dev@lists.freedesktop.org; Fri, 13 Oct 2023 11:31:54 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Oct 2023 11:29:28 +0200
Message-ID: <20231013093152.737239-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20231013093152.737239-1-mauro.chehab@linux.intel.com>
References: <20231013093152.737239-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] intel/kms_test_config.json: set
 testlist read parser to ignore case
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

As KMS ports are described in upper case, relax testlist parser to
ignore case, as the regular expressions at intel-ci may be in lower
case.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/kms_test_config.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index ad3a3aa7abb5..6c9b7194a58f 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -4,6 +4,7 @@
     "files": [ "../chamelium/kms_*.c", "../kms_*.c", "../testdisplay.c", "kms_*.c" ],
     "exclude_files": [ "../chamelium/kms_chamelium_helper.c", "../kms_color_helper.c",
                        "kms_dsc_helper.c" ],
+    "case_insensitive_testlist": true,
     "fields": {
         "Category": {
             "_properties_": {
-- 
2.41.0
