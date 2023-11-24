Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A6F10E1B7
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 08:18:40 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.154.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 31BF6580DC5
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 00:18:39 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1r6ROW-0008nV-35
 for igt-dev@lists.freedesktop.org; Fri, 24 Nov 2023 09:18:36 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Nov 2023 09:16:04 +0100
Message-ID: <20231124081834.33714-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Small fixes/cleanups for test_list.py
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

This patch series contain:

- a cleanup optimizing subtests expansion regex;
- a fix of adding blank description for tests without description.
  This is actually a left-over from the initial version of
  test_list.py, where "Description" field was mandatory.

Mauro Carvalho Chehab (2):
  scripts/test_list.py: better expand subtests
  scripts/test_list.py: don't add a blank description

 scripts/test_list.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.42.0
