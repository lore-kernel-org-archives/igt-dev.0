Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159A810E10D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Feb 2023 10:10:52 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.3.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 71EC358068A
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Feb 2023 02:10:37 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pPKvr-00Cg1Y-1W
 for igt-dev@lists.freedesktop.org; Tue, 07 Feb 2023 11:10:35 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Feb 2023 11:10:33 +0100
Message-Id: <20230207101034.3021441-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/1] Add a script to allow inlined test
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

Mauro Carvalho Chehab (1):
  scripts:igt-doc.py: add a parser to document tests inlined

 scripts/igt-doc.py | 516 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 516 insertions(+)
 create mode 100755 scripts/igt-doc.py

-- 
2.39.0
