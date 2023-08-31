Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976A710E690
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 14:55:19 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.5.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id F18CA580E9B
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 07:55:14 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qbj4i-0020Gy-2X
 for igt-dev@lists.freedesktop.org; Thu, 31 Aug 2023 16:55:12 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Aug 2023 16:52:02 +0200
Message-ID: <20230831145509.477543-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 00/11] Make test_list.py more generic
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

v4:
 - patches reordered;
 - removed the patches related to testplan check, as those caused
   build problems at the last submissions. Let's merge first the
   main changes. I'll submit the last two patches on a separate
   PR.

v3:
  - fixed dependencies for built_script target;
  - added an extra cleanup patch to better handle internal fields.


Mauro Carvalho Chehab (11):
  scripts/test_list.py: make the class more generic
  scripts/test_list.py: rename the internal summary value
  scripts/test_list.py: document what BAT stands for
  scripts/test_list.py: close config file before start processing
  scripts/test_list.py: filename arguments for print_ methods are
    optional
  scripts/test_list.py: add a check before deleting properties
  scripts/test_list.py: skip some internal fields
  scripts/test_list.py: add support to return a string instead of print
  scripts/test_list.py: don't rely on file name to parse config
  scripts/test_list.py: allow passing a config dict directly
  scripts/igt_doc.py: use field names when create a TestList instance

 scripts/igt_doc.py   |   6 +-
 scripts/test_list.py | 377 +++++++++++++++++++++++--------------------
 2 files changed, 205 insertions(+), 178 deletions(-)
 mode change 100755 => 100644 scripts/test_list.py

-- 
2.41.0
