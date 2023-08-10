Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B50010E19E
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 15:13:14 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.3.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 25DF0580DA6
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 08:13:13 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qU7Lb-005cPK-0U
 for igt-dev@lists.freedesktop.org; Thu, 10 Aug 2023 17:13:11 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Aug 2023 17:10:29 +0200
Message-ID: <20230810151303.1338975-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Validate Xe field descriptions at
 build time
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

---

v2: remove the enforce RFC patch that was expected to fail due
    to tests with undocumented buckets.


Mauro Carvalho Chehab (2):
  xe_test_config.json: mark some fields are mandatory at subtest level
  scripts/test_list.py: add a check for missing features

 scripts/test_list.py         | 16 +++++++++++++++-
 tests/xe/xe_test_config.json |  5 +++++
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.41.0
