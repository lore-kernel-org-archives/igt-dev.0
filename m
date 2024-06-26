Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ABCC27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 13:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC7810E8BE;
	Wed, 26 Jun 2024 13:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cthImu5y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0841010E8BE
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719410286; x=1750946286;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qiqBbbELp/QyI1Tb/5DrClaMhuEYjvT8Gd1pBsh3bcw=;
 b=cthImu5y26RxMk1waScuu41DBbX65L3JkdCkgCNg5/lfrkqYxdurJ1FJ
 vJaV3uSvfY2FvYEHK2F6Y8nW94b5b8oZQZGovi7ZefagcgesEsLrRZfcT
 TJ4qMpjgD6+hENi++h95n4vByMotNO+K19m3KyfNtsje9rASF29ZGL97Q
 wyUSybQwwQtJJXM+WTuukDNdDEJg2wBi0/3iPkEhNZOHTxc84UHmXPswW
 3fQ6xzWE3a99yqruC2HxGhe0BJWU5smj+k5zJYtRIl3720Kod2RbNcV0k
 hn9MuWiVl+YEplLWnV+E5zm1VoQQuYpsaXT4SKE0RQo49JGIrzw19urWo g==;
X-CSE-ConnectionGUID: gOuupz2LS6+RP5caMx8EOw==
X-CSE-MsgGUID: OTDMU+r9QzKLNmNaEAU4tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16310399"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="16310399"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 06:58:06 -0700
X-CSE-ConnectionGUID: 3qrQ/UESRUGWd5aCalhFng==
X-CSE-MsgGUID: RJl/1Wp7RFGIVUqWh4otqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="44436820"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.87])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 06:58:03 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH i-g-t] lib/igt_kmod: unload mei_gsc_proxy for Intel drivers
Date: Wed, 26 Jun 2024 15:57:55 +0200
Message-ID: <20240626135755.48042-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

For Intel i915 or Xe drivers we should unload mei_gsc_proxy
before mei_gsc, otherwise unloading mei_gsc could fail.

Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kmod.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 33f059199..ca14186a8 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -623,6 +623,8 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
 		"mei_pxp",
 		"mei_hdcp",
+		/* mei_gsc_proxy should be unloaded before mei_gsc */
+		"mei_gsc_proxy",
 		"mei_gsc",
 		NULL,
 	};
-- 
2.43.0

