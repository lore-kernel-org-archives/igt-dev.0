Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFF910E517
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 12:34:08 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.17.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9FF03580DA6
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 05:34:06 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qU4rc-0044FF-1h
 for igt-dev@lists.freedesktop.org; Thu, 10 Aug 2023 14:34:04 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Aug 2023 14:32:28 +0200
Message-ID: <20230810123402.969597-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Validate Xe field descriptions at build
 time
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

Some fields shall be mandatory on every subtest. Add a logic to check
if those are filled, enforcing it during build time.

We should probably merge patches 1 and 2 first, as currently, 83
subtests are not properly documented on Xe driver.

Mauro Carvalho Chehab (3):
  xe_test_config.json: mark some fields are mandatory at subtest level
  scripts/test_list.py: add a check for missing features
  [RFC] scripts/test_list.py: enforce mandatory fields to be filled

 scripts/test_list.py         | 18 ++++++++++++++++--
 tests/xe/xe_test_config.json |  5 +++++
 2 files changed, 21 insertions(+), 2 deletions(-)

-- 
2.41.0
