Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9434CC56205
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429C210E7FF;
	Fri, 20 Feb 2026 15:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIpnBYxT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD2910E7FF
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771599719; x=1803135719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9mYyVA575pfP938ANO+IE2OAc8sSJvNMnVY2LjgFFGs=;
 b=dIpnBYxTLi7XG/aZ1vkUgljzNVvYk0957J3kzqTVJH91lMRF2SS/nREt
 dIB16hwNMQ5PZiLgZ3wU2Jf7FB1Cl/QeeB8pImlb8uNMGIl2PJa3HG6Ly
 xC/p9lgp8HPx0lB/cCHhRZaG4296Fu7P7He1Vy7qpPwEII/DzA1Qso2vr
 M1OMn8DKbJBqqQJrbiDWXG8alnQkG4SMMzu4wzrd3o+ec49lhkvNro7sn
 Uxys8XSMsHOzgldY0TsBx7AYWlLrrtGZGxQWk2b6kiUxG8r7tkviDDF4v
 HsSACgAEDsivDRC4G8Syt2lRKnY5HyBoaBY1QVP+1sNA7xMTOmA4hy9Ff A==;
X-CSE-ConnectionGUID: WRKtKzJURc6Fm2D316x6SA==
X-CSE-MsgGUID: F3nyl+JOSvO1hkftrz3hAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="60266692"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="60266692"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:01:59 -0800
X-CSE-ConnectionGUID: fqEos8nPQZypPzwTwmQ4EA==
X-CSE-MsgGUID: X84a75+ZRsS937DJttryZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252558105"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.6])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:01:57 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v1 5/6] lib/intel_batchbuffer: update api docs url
Date: Fri, 20 Feb 2026 16:01:59 +0100
Message-ID: <20260220150202.1013804-6-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220150202.1013804-1-pawel.sikora@intel.com>
References: <20260220150202.1013804-1-pawel.sikora@intel.com>
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

Due to the migration from gtk-doc to mkdocs(cdoc)
for API reference generation, the links
to the old documentation need to be adjusted
to match the new cross-referencing format.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 lib/intel_batchbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 3b25a385b..46eb82ab8 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -60,7 +60,7 @@
  * @title: Batch Buffer
  * @include: igt.h
  *
- * Note that this library's header pulls in the [i-g-t core](igt-gpu-tools-i-g-t-core.html)
+ * Note that this library's header pulls in the :file:`igt_core.h`
  * library as a dependency.
  */
 
-- 
2.51.0

