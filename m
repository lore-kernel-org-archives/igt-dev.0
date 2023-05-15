Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741F010E1F8
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 14:39:28 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.14.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id ECC8C580D24
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 07:39:26 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pyZMC-006UAW-2v
 for igt-dev@lists.freedesktop.org; Mon, 15 May 2023 16:39:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 May 2023 16:39:23 +0200
Message-Id: <20230515143923.1545926-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] meson.build: update minimal version to 0.48
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

changeset 8ac9440e7bec ("meson: add an option to control Xe test builds")
require updating a dict with values from another dict. This seems
to be supported only on version 0.48 or above.

So, update meson minimal version.

Fixes: 8ac9440e7bec ("meson: add an option to control Xe test builds")
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 1c872cc9cb02..a1f646ee9239 100644
--- a/meson.build
+++ b/meson.build
@@ -7,7 +7,7 @@ project('igt-gpu-tools', 'c',
           'buildtype=debugoptimized',
         ],
 	license : 'MIT',
-	meson_version : '>=0.47.2')
+	meson_version : '>=0.48')
 
 if get_option('b_ndebug') != 'false'
 	error('Building without -Db_ndebug=false is not supported')
-- 
2.40.1
