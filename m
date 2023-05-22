Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4495510E33A
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 14:22:11 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.143.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2A4E8580D67
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 07:22:08 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q16QH-00Abcw-1K
 for igt-dev@lists.freedesktop.org; Mon, 22 May 2023 16:22:05 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 22 May 2023 16:21:55 +0200
Message-Id: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] Add a method to create spreadsheets
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

It can be useful to have all documentation from IGT tests on a single
XLS spreadsheet. Add a method to do that. With that, it should be
easy to produce an "igt_tests.xls" file containing one sheet per
config file with:

	./scripts/doc_to_xls.py --xls igt_tests.xls --config tests/*/*json tests/kms*.json

Mauro Carvalho Chehab (6):
  scripts/test_list.py: add support to define a name at the config file
  kms_test_config.json: add a name for the KMS Intel testset
  i915_test_config.json: add a driver name
  xe_test_config.json: add a driver name
  scripts/test_list.py: add a method to return an spreadsheet-like array
  scripts/doc_to_xls.py: add an script to generate a doc spreadsheet

 scripts/doc_to_xls.py            | 70 ++++++++++++++++++++++++++++++++
 scripts/test_list.py             | 50 +++++++++++++++++++++--
 tests/i915/i915_test_config.json |  1 +
 tests/kms_test_config.json       |  1 +
 tests/xe/xe_test_config.json     |  1 +
 5 files changed, 119 insertions(+), 4 deletions(-)
 create mode 100755 scripts/doc_to_xls.py

-- 
2.40.1
