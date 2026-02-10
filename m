Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6E3EA3F3D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 22:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539BA10E0F5;
	Tue, 10 Feb 2026 22:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayYLorGX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C5E10E071
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 22:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770764160; x=1802300160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BOiz1/rDRslJoSJ2BzRzuqNjOpvhOiE0VqO9wFs2xTM=;
 b=ayYLorGXe0mlo9+mp5kRjnnrb3UDBvlILobshMUGBxXgiN0hCh8vhbw3
 9WnRHH0tZJcK8zqg+GEd/66HrHUt4A1XVJR7k14hiDUUxRy31ta+bd3RD
 llUFscYugcKhS1i1PUJ+U6St6RIlVzXyHIImRpovJ0VAqLx2Nro4dRLJ6
 JdJt8S24rC3WrgRc1FMbJLVv9WE0hFWn4yLQZhLBY2U7QKybju3oRH7k0
 AY9BgCNx+l5pIVT+HOcBotgulGVtr2QTHqrLgCQ54BLy/pNrbRFFmsg8H
 2fjWoo5piB7AfqfjEej9T7fyh5dOkQSd9RXfzPe7tSrphvW14sAXW4Yz4 A==;
X-CSE-ConnectionGUID: VVv5Jxn9QUqxlZxY3H/hPA==
X-CSE-MsgGUID: 2O/WgFo0TUSxc74Sk3tV+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72094845"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="72094845"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 14:55:59 -0800
X-CSE-ConnectionGUID: 3lRZ7CzKQz69kbzGUh1Ffw==
X-CSE-MsgGUID: GarOCGwuRIWgwWfcFls3Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211503820"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2026 14:55:59 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 2/4] tests/kms_flip: run suspend tests on one pipe
 per output
Date: Tue, 10 Feb 2026 23:55:44 +0100
Message-ID: <20260210225546.153728-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260210225546.153728-1-michal.grzelak@intel.com>
References: <20260210225546.153728-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

It is not necessary to test suspend on same output but different pipe.
In case of suspend tests, limit number of dynamic subtests run per
output when any pipe has already been tested.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 82d000fe5..c32d8c60b 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1846,6 +1846,10 @@ static void run_test(int duration, int flags)
 			    n != 0 && n != (resources->count_crtcs - 1))
 				continue;
 
+			/* Limit the execution to 1 CRTC (first) for suspend tests */
+			if ((flags & TEST_SUSPEND) && !all_pipes && n != 0)
+				continue;
+
 			memset(&o, 0, sizeof(o));
 			o.count = 1;
 			o._connector[0] = resources->connectors[i];
@@ -1878,6 +1882,10 @@ static void run_test(int duration, int flags)
 			    n != 0 && n != (resources->count_crtcs - 1))
 				continue;
 
+			/* Limit the execution to 1 CRTC (first) for suspend tests */
+			if ((flags & TEST_SUSPEND) && !all_pipes && n != 0)
+				continue;
+
 			memset(&o, 0, sizeof(o));
 			o.count = 1;
 			o._connector[0] = resources->connectors[i];
-- 
2.45.2

