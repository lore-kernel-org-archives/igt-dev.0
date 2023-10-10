Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F3710E1E6
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Oct 2023 13:17:48 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.14.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1318E580B9E
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Oct 2023 06:17:47 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qqCcL-002FJo-0A
 for igt-dev@lists.freedesktop.org; Tue, 10 Oct 2023 15:17:45 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 10 Oct 2023 15:17:18 +0200
Message-ID: <20231010131743.535504-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Properly fix compilation breakage when
 Chamelium is disabled
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

There is an issue on checking KMS documentation: there is a single JSON
config that include files for both KMS and chamelium tests.

As it is possible to disable just chamelium, validating documentation
will fail, as the commented tests won't be parsed.

Fix it the right way by disabling KMS testplan check if chamelium
is disabled.

Mauro Carvalho Chehab (2):
  testplan/meson.build: disable kms check testlist if not chamelium
  scripts/test_list.py: fix and simplify missing doc check

 docs/testplan/meson.build | 15 +++++++++------
 scripts/test_list.py      | 34 ++++------------------------------
 2 files changed, 13 insertions(+), 36 deletions(-)

-- 
2.41.0
