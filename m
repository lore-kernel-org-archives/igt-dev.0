Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7376DC83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 14:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CB810E221;
	Fri,  4 Jul 2025 14:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHB8z886";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5588410E343
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 14:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751639407; x=1783175407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z3gGFyKKaDS83qi7j7QM8AKC5gqqg4c3XyahDpTKz/Y=;
 b=kHB8z886Ypi3ciykLA3iL9+0msqp6ldNY/kmD92heC+TA719Rh71aNJQ
 gi8Sn5co8mT35Dgd6cIjiENsVUbWv74yblsa4M4tjk3Ha/zxz/8V2SQdJ
 qnuhsQFsspCpI02Ft+ReZQXbeY14BilGn9JRRK8pzmlkdvK9gJ3p1UW/9
 tpqyFJc4w0AS33jNDYg8i+AqPqd/6tQVzj/XYyOpWnjnwFiUOZieKitEm
 GrJNY7I/yBvm6DlnZXzBJ7tnyVTD1WmUeaGFgZPwCsdaD7yEMkPLAkdab
 gVQFx+acWadOEcdj87wcUz2bbqy0Aw4CU+wIe7vb/5PLK9iJ+ywdlUPX+ Q==;
X-CSE-ConnectionGUID: i9GApONaSWulot9JXy0m/w==
X-CSE-MsgGUID: y5oe+V73RJ6q3q6rrW9Yag==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="79416933"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="79416933"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 07:30:06 -0700
X-CSE-ConnectionGUID: eo2zWPt+S52ETWlB4c2e+w==
X-CSE-MsgGUID: jxqt+WyURpyrW73gUr/IiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="155231941"
Received: from unknown (HELO rvodapal-mobl.iind.intel.com) ([10.190.239.40])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 07:30:04 -0700
From: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com,
 Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Subject: [PATCH] lib/pciids: Add one more PCI ID to BMG
Date: Fri,  4 Jul 2025 19:59:53 +0530
Message-Id: <20250704142953.101110-1-ravi.kumar.vodapalli@intel.com>
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

Align with kernel commit ccfb15b8158c ("drm/xe/bmg: Add one additional PCI ID")

It Adds one more pci id to BMG.

Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
---
 lib/pciids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/pciids.h b/lib/pciids.h
index 129c3172a..666265b5f 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -846,6 +846,7 @@
 /* BMG */
 #define INTEL_BMG_IDS(MACRO__, ...) \
 	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE209, ## __VA_ARGS__), \
 	MACRO__(0xE20B, ## __VA_ARGS__), \
 	MACRO__(0xE20C, ## __VA_ARGS__), \
 	MACRO__(0xE20D, ## __VA_ARGS__), \
-- 
2.34.1

