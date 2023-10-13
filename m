Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFCF10E5D1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 09:31:57 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.15.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8038C580E30
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 02:31:56 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qrEWQ-0035oj-1L
 for igt-dev@lists.freedesktop.org; Fri, 13 Oct 2023 11:31:54 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Oct 2023 11:29:26 +0200
Message-ID: <20231013093152.737239-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Improve testlist parsing by test_list.py
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

This small series improve testlist parsing by:

- allow using case-independent regexes to filter tests;
- change KMS testlist regexes to be case-insensitive;
- better name config options to include and exclude field data
  from files with a list of tests with the same value.

Mauro Carvalho Chehab (3):
  scripts/test_list.py: allow ignoring uppercase on testlist read
  intel/kms_test_config.json: set testlist read parser to ignore case
  scripts/test_list.py: better name testlist include/exclude config
    fields

 scripts/test_list.py             | 36 +++++++++++++++++---------------
 tests/intel/kms_test_config.json |  5 +++--
 tests/intel/xe_test_config.json  |  4 ++--
 3 files changed, 24 insertions(+), 21 deletions(-)

-- 
2.41.0
