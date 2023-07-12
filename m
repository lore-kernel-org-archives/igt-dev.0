Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0323310E540
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 13:59:01 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 44484580DD4
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 06:59:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qJaMs-00411n-0e
 for igt-dev@lists.freedesktop.org; Wed, 12 Jul 2023 15:58:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jul 2023 15:58:41 +0200
Message-Id: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 00/13] Make test_list.py more generic
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


While most of the code at test_list.py is generic, it contains a
couple of IGT-specific stuff on it.

I'm planning to make it more generic, as we also need to document
in-kernel tests (KUnit).

So, let's remove what's specific to IGT to the main logic. This
way, the same code can be sent to the Linux Kernel upstream,
to be used to document kunit and kselftests there.

Mauro Carvalho Chehab (13):
  tests/intel-ci/meson.build: Generate and store an intel-ci.testlist
  scripts/test_list.py: make the class more generic
  scripts/test_list.py: rename the internal summary value
  scripts/igt_doc.py: pass a single file when checking docs
  scripts/test_list.py: document what BAT stands for
  scripts/test_list.py: close config file before start processing
  scripts/test_list.py: don't rely on file name to parse config
  scripts/test_list.py: allow passing a config dict directly
  scripts/igt_doc.py: use field names when create a TestList instance
  scripts/test_list.py: add a check before deleting properties
  scripts/test_list.py: filename arguments for print_ methods are
    optional
  scripts/test_list.py: skip some internal fields
  scripts/test_list.py: add support to return a string instead of print

 docs/testplan/meson.build  |   2 +-
 scripts/igt_doc.py         |  10 +-
 scripts/test_list.py       | 363 ++++++++++++++++++++-----------------
 tests/intel-ci/meson.build |   8 +
 4 files changed, 212 insertions(+), 171 deletions(-)
 mode change 100755 => 100644 scripts/test_list.py

-- 
2.40.1
