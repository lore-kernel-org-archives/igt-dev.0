Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1669B10E360
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 08:58:50 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.37.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1B700580CB9
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 01:58:47 -0700 (PDT)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Sep 2022 10:58:42 +0200
Message-Id: <20220928085842.34107-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20220928085842.34107-1-mauro.chehab@linux.intel.com>
References: <20220928085842.34107-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH RFC 2/2] lib/igt_core: print card sysfs node at
 subtest results
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

This helps to identify what GPU failed on multi-GPU tests.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 0d018758ce38..6575eabca027 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1481,6 +1481,9 @@ __noreturn static void exit_subtest(const char *result)
 
 	igt_gettime(&now);
 
+	if (gpu_string)
+		igt_info("%s: ", gpu_string);
+
 	igt_info("%s%s %s: %s (%.3fs)%s\n",
 		 (!__igt_plain_output) ? "\x1b[1m" : "",
 		 subtest_text, *subtest_name, result,
-- 
2.37.3
