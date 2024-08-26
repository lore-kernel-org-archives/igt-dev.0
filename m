Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72D2C54732
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 15:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A6A10E233;
	Mon, 26 Aug 2024 15:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjC0TElG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BA610E080
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 15:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724686021; x=1756222021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7ITOJQhWTveQTEo9TKBk5Wy72oqojiSS/BziE5OK38g=;
 b=NjC0TElGKAD2tacS33cIyLKa/m6rBpjtIEMcmkmbLzrN/ufENHlHN76w
 5VkBXdCVyhCwa7LLK5x42JXjycIobfk32vLqJI7WIU1vSeuYxmdEoUfaL
 LN/XWX/vI8tUCJ9rFGQCZVtEOoNI1PwTH+xdD7BiiS302XlKBV6u5JJfj
 jCgUwl9nrVGBP/F3NPFhY2pdBai6YrsfwiRdNoKhtNSN10L2o+9Ai6zcq
 yXckG2hLeawWzyxSu0soozkp3LSIQLLuC/xiBi5ccGaTFDdeNuvlduUxl
 rB2zxNs8uxG3Y3xsFwuCX8WSJQxzlg04DGHjAVyf6APhNanDO3abBd9JG g==;
X-CSE-ConnectionGUID: 7p89V8T+QcGheAul2NPz4w==
X-CSE-MsgGUID: 03/10cO8ShO4yW5k0Wlz2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26013840"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208,223";a="26013840"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:27:00 -0700
X-CSE-ConnectionGUID: FxqfZyx2SG24o6mLDcSJ2w==
X-CSE-MsgGUID: ViVP9Uy0Qj+LcbUwcKxKMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208,223";a="63074304"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:26:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 5/6] tools/intel-gfx-fw-info: do not use bare 'except'
Date: Mon, 26 Aug 2024 08:26:55 -0700
Message-ID: <20240826152656.1306490-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826152656.1306490-1-lucas.demarchi@intel.com>
References: <20240826152656.1306490-1-lucas.demarchi@intel.com>
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

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel-gfx-fw-info | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
index 8fcb2961a..fb98f1bcc 100755
--- a/tools/intel-gfx-fw-info
+++ b/tools/intel-gfx-fw-info
@@ -84,11 +84,11 @@ logging.basicConfig(format="%(levelname)s: %(message)s")
 
 try:
     from dissect import cstruct
-except:
+except ImportError as e:
     logging.critical(
         "Could not import dissect.cstruct module. See https://github.com/fox-it/dissect.cstruct for installation options"
     )
-    raise SystemExit(1)
+    raise SystemExit(1) from e
 
 
 def ffs(x: int) -> int:
-- 
2.43.0

