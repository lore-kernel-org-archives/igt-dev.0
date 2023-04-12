Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5434910E7C2
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 12:37:10 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.30.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BBCEF580871
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 05:36:52 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pmZiU-000V8x-23
 for igt-dev@lists.freedesktop.org; Wed, 12 Apr 2023 14:36:50 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Apr 2023 14:35:42 +0200
Message-Id: <20230412123544.119534-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] ./scripts/igt_doc.py: speedup check
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

Mauro Carvalho Chehab (3):
  scripts/igt_doc.py: cleanup some pylint warnings
  scripts/igt_doc.py: don't depend on igt_runner anymore
  scripts/test_list.py: use a compiled regex for check

 docs/testplan/meson.build |  7 ++--
 scripts/igt_doc.py        | 11 +++----
 scripts/test_list.py      | 69 +++++++++++++++++++++++++++------------
 3 files changed, 54 insertions(+), 33 deletions(-)

-- 
2.39.2
