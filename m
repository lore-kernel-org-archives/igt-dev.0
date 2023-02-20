Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95F710E635
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Feb 2023 09:20:11 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.18.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id AFAD6580C7C
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Feb 2023 01:20:09 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pU2L9-003k5a-21
 for igt-dev@lists.freedesktop.org; Mon, 20 Feb 2023 10:20:07 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Feb 2023 10:20:04 +0100
Message-Id: <20230220092005.890959-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] Fix IGT runner error logic when listing
 subtests
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

Patches may end breaking --list-subtests if they, for instance, have a
pattern like:

	igt_fixture
		fd = drm_open_driver(DRIVER);
	...
	do_something(fd);

	igt_subtest("foo")
		...
	igt_subtest("bar")
		...

As any usage of (fd) will cause a crash. As result, currently IGT
will produce stderror outbut, but will keep executing, producing
a wrong testlist, as "foo" and "bar" won't be listed.

That will also break scripts that would depend on a reliable testlist.

So, return an error on such cases.

Mauro Carvalho Chehab (1):
  runner/job_list: return error on crashes while running --list-subtests

 runner/job_list.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.39.0
