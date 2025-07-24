Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68BFC83F26
	for <igt-dev@archiver.kernel.org>; Thu, 24 Jul 2025 18:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E37910E223;
	Thu, 24 Jul 2025 18:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQy0MHGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C4110E299
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jul 2025 18:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753383448; x=1784919448;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U7uKlCFUWOtPln0usCG/YpHXqqxRQfiBJd1134dpLl8=;
 b=DQy0MHGTiRVhZbE1mXvGKvNyTgmljDpvQ6hOCVpmuXx0LCS9hFr0w6D6
 3Zk5iWWVWTnG4sL8OLE48au/7bXHxzlQrP8Y2+K9qjw6bfF/ujChanMag
 ZEUtz1PjhlDKhvkVzg+pAE+yRdLR3DL1DVIYkfZzbLv3JmYET7OfChLlO
 QKvNIcJoUOrHeNKcEUeuZ2VKM+UYxAkF3ei5mbuwdsLpD6WCX2rqeu//u
 fLlsaWBwtYY3Yt3KcMhQOArATkV9DfcgUwusyXGdi0WN3kgjqY+nkW2dI
 e7OZW2vGajX/wYFaS+mtclb+DXhsEEvPo13IUyC/YysNYIcqrgj+yFUvs g==;
X-CSE-ConnectionGUID: NqfSRNoOThGCWvm4DBdE9w==
X-CSE-MsgGUID: jm/hLRdxQOyqOHWJHkad4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78262920"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="78262920"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 11:57:28 -0700
X-CSE-ConnectionGUID: QJU4oe0OS4it2VrvfgyD/w==
X-CSE-MsgGUID: F739E5/5QFyIGiGpoVg3Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160899292"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 11:57:26 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: soham.purkait@intel.com, riana.tauro@intel.com, lucas.demarchi@intel.com
Subject: [PATCH i-g-t] tools/gputop/xe_gputop: Keep engine activity percentage
 between 0 and 100
Date: Fri, 25 Jul 2025 00:20:40 +0530
Message-Id: <20250724185040.3163412-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
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

Engine activity percentage within the valid range of 0 to 100 prevents
out-of-bound values that could lead to undefined behavior during runtime.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop/xe_gputop.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
index 9757369a8..ced427c0c 100644
--- a/tools/gputop/xe_gputop.c
+++ b/tools/gputop/xe_gputop.c
@@ -281,6 +281,12 @@ static double pmu_active_percentage(struct xe_engine *engine)
 	double percentage;
 
 	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
+
+	if (percentage > 100)
+		percentage = 100;
+	else if (percentage < 0)
+		percentage = 0;
+
 	return percentage;
 }
 
-- 
2.43.0

