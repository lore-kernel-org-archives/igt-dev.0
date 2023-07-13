Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A9410E004
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 07:51:01 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 19407580D7B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 00:51:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qJr6H-0044TN-38
 for igt-dev@lists.freedesktop.org; Thu, 13 Jul 2023 09:50:57 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Jul 2023 09:50:40 +0200
Message-Id: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 00/14] Make test_list.py more generic
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

---

v3:
  - fixed dependencies for built_script target;
  - added an extra cleanup patch to better handle internal fields.


Mauro Carvalho Chehab (14):
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
  scripts/test_list.py: better handle internal fields

 docs/testplan/meson.build  |   2 +-
 scripts/igt_doc.py         |  10 +-
 scripts/test_list.py       | 419 ++++++++++++++++++++-----------------
 tests/intel-ci/meson.build |   9 +
 4 files changed, 238 insertions(+), 202 deletions(-)
 mode change 100755 => 100644 scripts/test_list.py

-- 
2.40.1
