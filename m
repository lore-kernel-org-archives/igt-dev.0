Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B379310E8CC
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 13:28:35 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C28F8580CD3
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 06:28:32 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pfKzW-008Av8-2L
 for igt-dev@lists.freedesktop.org; Thu, 23 Mar 2023 14:28:30 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 14:28:25 +0100
Message-Id: <20230323132827.1948500-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230323132827.1948500-1-mauro.chehab@linux.intel.com>
References: <20230323132827.1948500-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 1/3] intel-ci: update i915 blacklist to
 ignore the Xe driver
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

It doesn't make sense to run Xe tests with i915 driver loaded.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel-ci/blacklist.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 6e5cc43667cf..243bc60934f6 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -1,3 +1,8 @@
+###############################################
+# This file is for non-Xe tests only
+###############################################
+igt@xe.*
+
 igt@meta_test(@.*)?
 ###############################################
 # Handle module reloads with great care!
-- 
2.39.2
