Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A02C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 23:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AE910E55A;
	Tue, 20 Aug 2024 23:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/biMoqE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABC110E541
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 23:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724196583; x=1755732583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kZg/uukeK+eWxqKUnM5GjXepVhFqUSsdWDrO0G6gP4M=;
 b=Z/biMoqEYjLsZnb4xCMyBUxHsOlaJJterEAu/tow2Ff1hGVk9jLQc/ey
 4ueUprPeWuM7j0XOVL1TBzLkPODTccS1BMs+RowiZvZFTAM07vwtfZId9
 rgrh4MWU8kqryZivFMDnM4lNc9ihlLuX0dCjI+6iMTBE5efdKCJCBZxHO
 hnTsyBcMZ+cYIBm+cxv9eXqX1eLT3qtKgu0mrM0zL6EcfNXj7lVkAGlwt
 Ya1mT7o5N5fn0ZR596DPVuOGFwTNKN5TKdm143sP1DKYrbQFRGg/E13J1
 4apsEumUzolwBlSAixyBf6Fk/LP+KqoiKrQj6UNz27H91Wh6Zzbhg0KCX w==;
X-CSE-ConnectionGUID: tvp7Vwt5S6aZPhkZ0vuadA==
X-CSE-MsgGUID: gtejCKUWRXyQ5KoVRQslJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22339748"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208,223";a="22339748"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 16:29:42 -0700
X-CSE-ConnectionGUID: hBXC2QKsSmSN4+JnxLdvqQ==
X-CSE-MsgGUID: k2OxNa+QRvq3Pd8R3zyqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208,223";a="60599579"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 16:29:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 6/6] tools/intel-gfx-fw-info: do not use bare 'except'
Date: Tue, 20 Aug 2024 16:29:28 -0700
Message-ID: <20240820232928.458248-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820232928.458248-1-lucas.demarchi@intel.com>
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
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

From flake8:

	tools/intel-gfx-fw-info:137:1: E722 do not use bare 'except'

Now it passes clean with --ignore=E101,E501,W191 - those ignores are
needed because they are triggering in the C string we use, CDEF, and
flake8 can't bother enabling/disabling warnings per block.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel-gfx-fw-info | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
index cbabda913..3c9b47809 100755
--- a/tools/intel-gfx-fw-info
+++ b/tools/intel-gfx-fw-info
@@ -133,11 +133,11 @@ logging.basicConfig(format="%(levelname)s: %(message)s")
 
 try:
     from dissect import cstruct
-except:
+except ImportError as e:
     logging.critical(
         "Could not import dissect.cstruct module. See https://github.com/fox-it/dissect.cstruct for installation options"
     )
-    raise SystemExit(1)
+    raise SystemExit(1) from e
 
 
 GSC_CPD_ENTRY_OFFSET_MASK = 0x1FFFFFF
-- 
2.43.0

