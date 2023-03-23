Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D117310E466
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 09:02:26 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 62650580BF0
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 02:02:25 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pfGpz-0085vf-1Y
 for igt-dev@lists.freedesktop.org; Thu, 23 Mar 2023 10:02:23 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 10:02:19 +0100
Message-Id: <20230323090221.1929302-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230323090221.1929302-1-mauro.chehab@linux.intel.com>
References: <20230323090221.1929302-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 2/4] intel-ci: create a symlink for
 i915-blacklist.txt
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

In order to avoid disrupts at exiting intel-ci tests, keep a
symlink to the i915 blacklist:

	i915-blacklist.txt -> blacklist.txt

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel-ci/blacklist.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 tests/intel-ci/blacklist.txt

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
new file mode 120000
index 000000000000..e48e29e27f4e
--- /dev/null
+++ b/tests/intel-ci/blacklist.txt
@@ -0,0 +1 @@
+i915-blacklist.txt
\ No newline at end of file
-- 
2.39.2
