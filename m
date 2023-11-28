Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBB210E4D2
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 10:51:06 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.94.248.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 680A5580D25
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 02:50:59 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1r7vg9-0006M9-1s
 for igt-dev@lists.freedesktop.org; Tue, 28 Nov 2023 11:50:57 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Nov 2023 11:48:55 +0100
Message-ID: <20231128105054.24317-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] Do dome cleanups at IGT doc tools
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

This series is aimed to do some cleanup at documentation testlist
scripts, solving some issues pointed by pylint and reorganizing
the code.

The first two patches were already reviewed. This series have them
at the beginning, untouched.

Mauro Carvalho Chehab (5):
  scripts/test_list.py: better expand subtests
  scripts/test_list.py: don't add a blank description
  scripts/test_list.py: Fix trivial pylint issues
  scripts/test_list.py: fix indent at get_subtests()
  igt_doc.py: move the main code to a main() function

 scripts/igt_doc.py   | 122 +++++++++++++++++++++++--------------------
 scripts/test_list.py |  95 +++++++++++++++++----------------
 2 files changed, 114 insertions(+), 103 deletions(-)

-- 
2.42.0
