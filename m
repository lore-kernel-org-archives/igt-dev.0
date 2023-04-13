Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153D710EA95
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 09:22:30 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.29.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 08DA65804FA
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 02:22:06 -0700 (PDT)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Apr 2023 11:21:59 +0200
Message-Id: <20230413092159.146658-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20230413092159.146658-1-mauro.chehab@linux.intel.com>
References: <20230413092159.146658-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 4/4] meson_options.txt: disable Sphinx by
 default
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

Building IGT with Sphinx enabled and rst2pdf installed takes:

	$ touch tests/xe/xe_compute.c
	$ time ninja -C build

	...

        real    0m10.545s
        user    0m13.778s
        sys     0m0.724s

With Sphinx disabled, the same build is a lot faster:

	$ touch tests/xe/xe_compute.c
	$ time ninja -C build

	...

	real	0m1.746s
	user	0m1.574s
	sys	0m0.171s

As Sphinx and PDF outputs aren't something that every single
IGT developer would need, let's speedup the build by disabling
it by default.

Test plan and test documentation validation will still run,
as this is a necessary step to validate if the tests documentation
were not broken on a patch, but this will save some time during
normal builds.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 meson_options.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson_options.txt b/meson_options.txt
index d4e373d6cfc4..2cb44f20169b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -26,6 +26,7 @@ option('testplan',
 
 option('sphinx',
        type : 'feature',
+       value : 'disabled',
        description : 'Build testplan documentation using Sphinx')
 
 option('docs',
-- 
2.39.2
