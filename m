Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3681410E0A7
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 07:12:59 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.246.50.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7EE48580AD7
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 23:12:57 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1r8bEF-000Tl9-1u
 for igt-dev@lists.freedesktop.org; Thu, 30 Nov 2023 08:12:55 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 08:11:49 +0100
Message-ID: <20231130071253.114028-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] Improve Intel CI testlist generator
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

Currently, testlist generation is done on 3 steps. Remove one of the
steps, optimizing the logic.

Mauro Carvalho Chehab (1):
  scripts/igt_doc.py: rewrite intelci testlist logic

 scripts/igt_doc.py | 181 +++++++++++++++++++++++++--------------------
 1 file changed, 99 insertions(+), 82 deletions(-)

-- 
2.42.0
