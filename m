Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7021810E888
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 13:10:06 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.131.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D6162580E3D
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 06:10:02 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qyXSS-001I0z-0n
 for igt-dev@lists.freedesktop.org; Thu, 02 Nov 2023 14:10:00 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Nov 2023 14:06:22 +0100
Message-ID: <20231102130957.307435-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] Fix a series of issues while handling
 testlist
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

There is still a huge gap between what igt_runner and test_list.py
generates. Those are related to several issues:

- The properties related to input file test list parsing are not grouped
  altogether and have weird names. A better namespace for JSON config
  for such options needs to be defined.
- FULL testlist is currently just the tests that don't belong to other
  testlists;
- i915 and Xe has a different set of FULL testlist;
- case-insensitive regex were not applied the right way, as we need
  to be able to define what kind of match applies for include and
  exclude files.

Mauro Carvalho Chehab (5):
  scripts/test_list.py: better parse list of tests
  scripts/test_list.py: speedup update testlist logic
  intel/*.json: better handle FULL testlist
  scripts/test_list.py: fix regex filtering logic
  scripts/test_list.py: use different types for include/exclude

 scripts/test_list.py             | 84 ++++++++++++++++++--------------
 tests/intel/kms_test_config.json | 28 ++++++-----
 tests/intel/xe_test_config.json  | 17 ++++---
 3 files changed, 73 insertions(+), 56 deletions(-)

-- 
2.41.0
