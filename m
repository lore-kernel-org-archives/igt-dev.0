Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6C310E322
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 07:12:23 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.28.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B2FD9580DAF
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 00:12:17 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qJ7Xj-0035rq-1b
 for igt-dev@lists.freedesktop.org; Tue, 11 Jul 2023 09:12:15 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Jul 2023 09:12:08 +0200
Message-Id: <20230711071213.737377-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] Make test_list.py more generic
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
way, the same class could some day be sent to Linux Kernel upstream,
to be used to document tests contained on sources out there.

Mauro Carvalho Chehab (5):
  tests/intel-ci/meson.build: Generate and store an intel-ci.testlist
  scripts/test_list.py: make the class more generic
  scripts/test_list.py: rename the internal summary value
  scripts/igt_doc.py: pass a single file when checking docs
  scripts/test_list.py: document what BAT stands for

 docs/testplan/meson.build  |   2 +-
 scripts/igt_doc.py         |   6 +-
 scripts/test_list.py       | 127 ++++++++++++++++++++-----------------
 tests/intel-ci/meson.build |   8 +++
 4 files changed, 82 insertions(+), 61 deletions(-)
 mode change 100755 => 100644 scripts/test_list.py

-- 
2.40.1
