Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C171E10E53C
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 12:39:31 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.140.150])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BDB58580E33
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 04:32:24 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1r8Jjq-000Pq7-1o
 for igt-dev@lists.freedesktop.org; Wed, 29 Nov 2023 13:32:22 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Nov 2023 13:25:33 +0100
Message-ID: <20231129123221.98948-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Produce per-GPU testlists for IntelCI
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

This series contain an improvement to IGT documentation tool to
help generating per-GPU testlists.

This helps producing testlists to be used by Intel CI automation,
as tests that are specific to certain GPUs or ones that won't be
running on some specific configurations can be excluded from
the testlists, making the test results more reliable, saving
execution time on CI and keeping such exclusions properly
documented.

With such change, assuming that some tests would be needed to
be blocked on a "foo" configutation, running

	./scripts/igt_doc.py --config tests/intel/xe_test_config.json --intelci-testlist intel-ci

will produce a set of testlist files like:

	intel-ci/
	└── xe
	    ├── default
	    │   ├── bat.testlist
	    │   ├── full.testlist
	    │   └── other.testlist
	    └── foo
	        ├── bat.testlist
	        ├── full.testlist
	        └── other.testlist

Where the "foo" testlists will have a different set of sets on
their testlists, due to blocklisted tests.

Mauro Carvalho Chehab (3):
  igt_doc: Add driver name list at JSON configuration
  tests/intel: *.json: specify what drivers use such tests
  scripts/igt_doc.py: add a logic to generate Intel CI testlists

 scripts/igt_doc.py                | 192 +++++++++++++++++++++++++++++-
 scripts/test_list.py              |   5 +
 tests/intel/i915_test_config.json |   1 +
 tests/intel/kms_test_config.json  |   1 +
 tests/intel/xe_test_config.json   |   1 +
 5 files changed, 198 insertions(+), 2 deletions(-)

-- 
2.42.0
