Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEB810E0E2
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 15:43:16 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.2.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C139A580BF1
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 08:43:14 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qxUQ4-000aSa-2h
 for igt-dev@lists.freedesktop.org; Mon, 30 Oct 2023 16:43:12 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 Oct 2023 16:43:11 +0100
Message-ID: <20231030154311.140142-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] scripts/test_list.py: fix subtest regex
 match
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

Fix a regression introduced by:
	6e3e8e6d7c05 ("scripts/test_list.py: better handle list of tests")

After such change, regex will only do full match, but it needs also to
consider subtests, if the syntax is just igt@test.

Fixes: 6e3e8e6d7c05 ("scripts/test_list.py: better handle list of tests")
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 06215242107a..741ec5f4b5b5 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -476,6 +476,8 @@ class TestList:
                 test = match.group(1)
                 subtest = match.group(2)
                 test_name = f"{test}{subtest}"
+                if not test_name.endswith("$"):
+                    test_name += r"(\@.*)?$"
 
                 if match_type in match_type_regex:
                     testlist[name].append(re.compile(test_name, flags))
-- 
2.41.0
