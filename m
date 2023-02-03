Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88E510E71E
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 08:26:59 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.31.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C634D580C55
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 00:26:54 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pNrPI-00AIe6-21
 for igt-dev@lists.freedesktop.org; Fri, 03 Feb 2023 09:26:52 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Feb 2023 09:26:49 +0100
Message-Id: <20230203082650.2454081-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] Add a script to document IGT tests
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

As the IGT and driver's code evolves, the meaning of the tests may
become unclear. The best way to avoid bitrot is to have in-code
documentation explaining what each test and subtest does.

This script adds support for in-code documentation placed on
a style similar to kernel-doc, e. g. it should parse test descriptions
like:

/**
 * TEST: Check if new IGT test documentation logic functionality is working
 * Category: Software build block
 * Sub-category: documentation
 * Coverered functionality: test documentation
 * Test type: ReST generation
 * Run type: IGT kunit test
 * Issue: none
 * Platforms: all
 * Platform requirements: none
 * Depends on: @igt@deadbeef@basic
 * Requirements: Need at least a script to test it
 * Description: Complete description of this test
 *
 * SUBTEST: foo
 * Description: do foo things
 * 	with description continuing on another line
 *
 * SUBTEST: bar
 * Description: do bar things
 * 	with description continuing on another line
 */

/**
 * SUBTEST: test-%s-binds-%s-with-%ld-size
 * Description: Test arg[2] arg[1] binds with arg[3] size
 *
 * arg[1]:
 *
 * @large:	large
 * 		something
 * @mixed:	mixed
 * 		something
 * @small:	small
 * 		something
 *
 * arg[2]:
 *
 * @binds:			foo
 * @misaligned-binds:		misaligned
 * @userptr-binds:		userptr
 * @userptr-misaligned-binds:	userptr misaligned
 *
 * arg[3]:	buffer size
 * 		in Kb
 */

Please notice that I'm sending this script in advance, in order to
have some upstream review. Such script currently is capable of
describing igt tests and IGT subtests, with wildcard support.

It is not currently prepared to handle dynamic subtests, nor to
describe Kernel selftest/KUnit. For those, it is probably worth
to have the documentation inside the Kernel, to keep them as close
as possible to the actual code.

The end goal is to use such script to describe the test bench for
the new Xe driver, auto-generating documentation. The Xe IGT upstream
work can be seen at https://patchwork.freedesktop.org/series/112191/.

Mauro Carvalho Chehab (1):
  scripts: add a parser to produce documentation from Kernel C file
    metatags

 scripts/igt-doc | 647 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 647 insertions(+)
 create mode 100755 scripts/igt-doc

-- 
2.39.0
