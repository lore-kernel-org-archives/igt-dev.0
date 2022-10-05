Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9F110E48A
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 07:46:05 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.61.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4DA705804E8
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 00:45:53 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1ofz6F-000EcN-01
 for igt-dev@lists.freedesktop.org; Wed, 05 Oct 2022 09:45:51 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Oct 2022 09:44:34 +0200
Message-Id: <20221005074546.55955-6-mauro.chehab@linux.intel.com>
In-Reply-To: <20221005074546.55955-1-mauro.chehab@linux.intel.com>
References: <20221005074546.55955-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 05/77] i915/gem_blits: Close device
 before exit
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

From: Chris Wilson <chris.p.wilson@intel.com>

Close the device fd before we check for leaks during the atexit
handlers.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Acked-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Nirmoy Das<nirmoy.das@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/gem_blits.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
index 46f157b9367a..24e83b9f512d 100644
--- a/tests/i915/gem_blits.c
+++ b/tests/i915/gem_blits.c
@@ -852,5 +852,6 @@ igt_main
 
 	igt_fixture {
 		put_ahnd(device.ahnd);
+		close(device.fd);
 	}
 }
-- 
2.37.3
