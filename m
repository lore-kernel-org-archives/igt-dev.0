Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF62410E345
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 07:34:32 +0000 (UTC)
Received: from linux.intel.com (ksebasti-mobl.ger.corp.intel.com
 [10.252.18.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E6A9C580DA3
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 00:34:30 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pwHrg-004qMs-1s
 for igt-dev@lists.freedesktop.org; Tue, 09 May 2023 09:34:28 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  9 May 2023 09:34:26 +0200
Message-Id: <20230509073426.1154390-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230509073426.1154390-1-mauro.chehab@linux.intel.com>
References: <20230509073426.1154390-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] meson_options.txt: disable Xe driver
 tests by default
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

Change the build default for Xe driver tests to disabled,
in order to prevent distros to ship them by accident.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 meson_options.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson_options.txt b/meson_options.txt
index 7b5a818cb72f..12b5bb3c32d9 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -44,6 +44,7 @@ option('tests',
 # drivers get upstreamed.
 option('xe_driver',
        type : 'feature',
+       value : 'disabled',
        description : 'Build tests for Xe driver (experimental)')
 
 option('libdrm_drivers',
-- 
2.40.1
