Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FD910E8C1
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 12:35:35 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.4.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 73A10580D24
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 04:35:34 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pRuWy-0005w4-1Z
 for igt-dev@lists.freedesktop.org; Tue, 14 Feb 2023 13:35:32 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 13:35:29 +0100
Message-Id: <20230214123530.22525-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/1] Add a script to allow inlined test
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

Both modes (1) and (2) can be tested by running:

	$ ./scripts/igt_doc.py --files ./scripts/igt_doc.py

This will use the strings inside the class docstring added on version
3, parsing them as if they're C file documentatoin.

---

v3:
    - Added MIT license;
    - Some cleanups on its comments;
    - Use enumerate() and remove fileinput import;
    - Print an error if the field is invalid;
    - Kept just one form (either singular or plural) to fields;
    - Added a more comprehensive python documentation for the class,
      explaining how wildcards are processed;
    - Some cosmetic changes;
    - Fixed some typos at fields array.
    
v2:
    - Convert to Python

Mauro Carvalho Chehab (1):
  scripts:igt-doc.py: add a parser to document tests inlined

 scripts/igt_doc.py | 575 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 575 insertions(+)
 create mode 100755 scripts/igt_doc.py

-- 
2.39.0
