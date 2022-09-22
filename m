Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E8210EA80
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 08:46:24 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.59.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B509A580C36
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 01:46:22 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1obHqf-00CcSI-5P
 for igt-dev@lists.freedesktop.org; Thu, 22 Sep 2022 10:46:21 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 10:46:12 +0200
Message-Id: <cover.1663836123.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/6] Fix some issues at gcov parse tool and add a
 new table on reports
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

Patches 1 to 4 fix some bugs at the script, some of them causing it to crash.

Patch 5 address a GCC optimization-related issue, where the function is
renamed at the object file, gaining a .irda.<number> extension.

Patch 6 adds a new functionality at the tool when producing an HTML output.
It basically calculates the interception of all code coverage sets, and shows
how many functions are common to all sets and with one are unique to an
specific tests. It helps to discover cases where tests or test sets are not needed
to be taken into account when producing a report.

Mauro Carvalho Chehab (6):
  scripts/code_cov_parse_info: avoid warning messages on parsing
  scripts/code_cov_parse_info: fix --only-drm filtering rules
  scripts/code_cov_parse_info: fix brf record handling
  scripts/code_cov_parse_info: Fix indentation at the output html file
  scripts/code_cov_parse_info: take gcc IPA optimizations into account
  scripts/code_cov_parse_info: print common coverage and extra per
    function

 scripts/code_cov_parse_info | 111 ++++++++++++++++++++++++++++++++----
 1 file changed, 99 insertions(+), 12 deletions(-)

-- 
2.37.2

