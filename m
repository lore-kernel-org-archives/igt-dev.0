Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5557810EE15
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 13:06:07 +0000 (UTC)
Received: from linux.intel.com (pludynia-mobl.ger.corp.intel.com [10.252.3.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4DD51580919
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 06:05:24 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1phrxy-00BSak-1F
 for igt-dev@lists.freedesktop.org; Thu, 30 Mar 2023 15:05:22 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Mar 2023 15:05:11 +0200
Message-Id: <20230330130518.2731441-6-mauro.chehab@linux.intel.com>
In-Reply-To: <20230330130518.2731441-1-mauro.chehab@linux.intel.com>
References: <20230330130518.2731441-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 05/12] scripts/test_list.py: prepare to
 place class on a separate file
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

Rename scripts/igt_doc.py to scripts/test_list.py, preparing to
split the main function from the class definition.

That allows re-using the class by other programs as well. It
also makes the module better organized, and ensures that all
variables inside the class are not global.

While this could be folded with the next patch, by splitting it
on two, it makes a lot easier to review the code changes, as most
of the contents of the igt_doc.py are actually the TestList class.

The next patch will re-introduce scripts/igt_doc.py, dropping
the global vars and the main code from test_list.py.

Acked-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/{igt_doc.py => test_list.py} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/{igt_doc.py => test_list.py} (100%)

diff --git a/scripts/igt_doc.py b/scripts/test_list.py
similarity index 100%
rename from scripts/igt_doc.py
rename to scripts/test_list.py
-- 
2.39.2
