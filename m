Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912E410EA98
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 09:22:31 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.29.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C7374580D25
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 02:22:05 -0700 (PDT)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Apr 2023 11:21:55 +0200
Message-Id: <20230413092159.146658-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/4] ./scripts/igt_doc.py: speedup check
 logic
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The logic which checks for missing/obsolete documentation is too
slow. Currently, on my notebook it takes 12 seconds:

	$ time ./scripts/igt_doc.py --check --config tests/xe/xe_*json

	real	0m12.085s
	user	0m10.468s
	sys	0m1.457s

Implent it on a different way, in order to speedup the build process.

After the change, it now takes less than 500ms:

	$ time ./scripts/igt_doc.py --check --config tests/xe/xe_*json

	real	0m0.460s
	user	0m0.357s
	sys	0m0.102s

It should be noticed that it is possible to speed it up even
further by running:

	 build/tests/* --list-subtests

tasks in parallel. I did some tests: the improvements weren't so
relevant on my notebook with 8 CPUs, and, on my tests with python 3.11
it seemed a little too fragile when using multithreading, as it was not
hard to mess with it, not having threads or subprocess forks not
happening, and without triggering an error.

As the benefit of such optimization was marginal, let's avoid the
additional complexity of multithreading.

---

v4:
- added a patch to disable Sphinx build by default, reducing
  even further the build time with the defaults.

Mauro Carvalho Chehab (4):
  scripts/igt_doc.py: cleanup some pylint warnings
  scripts/igt_doc.py: don't depend on igt_runner anymore
  scripts/test_list.py: use a compiled regex for check
  meson_options.txt: disable Sphinx by default

 docs/testplan/meson.build |  7 ++--
 meson_options.txt         |  1 +
 scripts/igt_doc.py        | 11 +++---
 scripts/test_list.py      | 73 ++++++++++++++++++++++++++-------------
 4 files changed, 56 insertions(+), 36 deletions(-)

-- 
2.39.2
