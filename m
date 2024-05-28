Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0355C25B7E
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 05:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A84F10FF12;
	Tue, 28 May 2024 05:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qp1efnW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0165010FB4A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 05:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716875385; x=1748411385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wXBj65fgZ9/KZEA4SdGM/145f+6byqE8Zdxl/kaCi1c=;
 b=Qp1efnW5t5asJwZK/p4bTRLAPDoQDSpBI4bhAkbCy2UXzU99oftYFXUy
 zLDyLRJc/gJX9PRqgbAAvM00bImjDF3cEW5Y+XdsfW5UwyUOU8iPaxSPn
 gJro1NnOYZ4mMWmzJ0JQ+QfTaD9nBek5bvToak2u97SOcBBOB9HDPepTe
 FknWKFgnljlU2+VjnHuvhgyg1a113gVsILWcEH6KKUVazAw0cyTNEY+Z5
 DHrNwZgTNYGtE0g0+Ir7S6cRRHEVazBDGRmDxn/cZ0UCfYaC4i03HDKPQ
 VhmFVaUF7g2B6hWUk5PcSvp5VRvctstkA6UCcgceXi9I08vkw0GQ/0hvr g==;
X-CSE-ConnectionGUID: CeDmhzuDRuSS9ubtipRe7Q==
X-CSE-MsgGUID: jRhCvE5SQICX80Ff46vEqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24615873"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="24615873"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:49:44 -0700
X-CSE-ConnectionGUID: TAljMpDwSuCpXg16D34lxQ==
X-CSE-MsgGUID: WmsYGIUHS/23yjMp74CAWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="66165861"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:49:43 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/5] tests/fbdev: Fix fd closure
Date: Tue, 28 May 2024 11:12:19 +0530
Message-ID: <20240528054223.2945356-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
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

As the file descriptor in this test is not a drm device,
don't use drm_close_driver() to close the fd, instead
use close().

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 154e78b0f..794882a6a 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -443,6 +443,6 @@ igt_main
 	}
 
 	igt_fixture {
-		drm_close_driver(fd);
+		close(fd);
 	}
 }
-- 
2.43.2

