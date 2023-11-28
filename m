Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C91B10E16A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 16:45:56 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.94.248.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6171D580DA0
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 08:45:54 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1r81Dc-000K9r-1e
 for igt-dev@lists.freedesktop.org; Tue, 28 Nov 2023 17:45:52 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Nov 2023 17:43:00 +0100
Message-ID: <20231128164551.77343-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH RFC 0/3] Produce per-GPU testlists for IntelCI
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

Mauro Carvalho Chehab (3):
  tests/intel: *.json: specify what drivers use such tests
  scripts/igt_doc.py: add a logic to generate Intel CI testlists
  igt_doc: ensure that the driver name will be there

 scripts/igt_doc.py                | 162 +++++++++++++++++++++++++++++-
 scripts/test_list.py              |   8 ++
 tests/intel/i915_test_config.json |   1 +
 tests/intel/kms_test_config.json  |   1 +
 tests/intel/xe_test_config.json   |   1 +
 5 files changed, 172 insertions(+), 1 deletion(-)

-- 
2.42.0
