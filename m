Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A7010E181
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 08:55:29 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.7.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C8442580C28
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 01:55:26 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qBX92-00GiTM-16
 for igt-dev@lists.freedesktop.org; Tue, 20 Jun 2023 10:55:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Jun 2023 10:55:18 +0200
Message-Id: <20230620085522.3984101-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/4] generate an ordered testlist for Xe
 driver
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

Add support for ordering tests at the documentation tool, and produce
Xe fast feedback testlists on an ordered way.

---

v2: added an extra patch to sort the tests alphabetically before
    start ordering it.

Mauro Carvalho Chehab (4):
  scripts/test_list.py: add support for ordering testlists
  xe_test_config.json: add an order for run type
  tests/xe: add run type fields to order testlists
  scripts/test_list.py: produce alphabetically ordered testlists

 scripts/test_list.py         | 84 +++++++++++++++++++++++++++---------
 tests/xe/xe_live_ktest.c     |  2 +-
 tests/xe/xe_module_load.c    |  2 +-
 tests/xe/xe_test_config.json |  7 ++-
 4 files changed, 72 insertions(+), 23 deletions(-)

-- 
2.40.1
