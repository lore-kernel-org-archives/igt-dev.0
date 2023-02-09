Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B0C10E9E4
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 11:57:20 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.4.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 15CC7580D24
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 03:57:19 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pQ5YD-00Db5D-0C
 for igt-dev@lists.freedesktop.org; Thu, 09 Feb 2023 12:57:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Feb 2023 12:57:11 +0100
Message-Id: <20230209115712.3240666-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/1] Add a script to allow inlined test
 documentation
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

Keeping documentation updated is hard, as text documents gets outdated
when code changes. The best practices are to keep documentation as close
as possible to the code.

This script allows adding documentation inside special tags at the
C files, and validate if the documentation actually meets the code.

It is meant to be used by the new Intel Xe driver, in the process of
being upstreamed. It can be used also for other drivers, as well.

This is a version of my previous script, that got translated to Python.

It supports three modes of operation:

1) Output documentation in ReST format (default if no arg provided):

	$ scripts/igt-doc.py --files tests/xe/*.c --rest

2) Output a list of tests that are documented

	$ scripts/igt-doc.py --files tests/xe/*.c --show-subtests

3) Compare the documented testlists with IGT runner testlist:

	$ scripts/igt-doc.py --files tests/xe/*.c --check-testlist

The idea is to add automation to generate the ReST files at the
Xe meson.build file. Once all documentation for Xe is placed inline,
the CI for it can also use this script to discover documentation
gaps.

v2:

- use a class for the testlist;
- remove some code duplication related to subtest expansion;
- cosmetic changes to make pylint happy.

Mauro Carvalho Chehab (1):
  scripts:igt-doc.py: add a parser to document tests inlined

 scripts/igt_doc.py | 487 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 487 insertions(+)
 create mode 100755 scripts/igt_doc.py

-- 
2.39.0
