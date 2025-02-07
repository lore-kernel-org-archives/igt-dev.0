Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370A8C021A1
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 23:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C844F10E34E;
	Fri,  7 Feb 2025 23:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGiXa9Xn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2C810E334
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 23:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738969869; x=1770505869;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SzbpXFQU+f+b2WRsF4RpcPtRi4T+lqZCVmS8s5k6Mqs=;
 b=dGiXa9XnwRp+8/AzmIAjRjaVEuU7HAgXaIHTiaBwYcMUEyDzYFWyV8rc
 2ndk10fxfRrZ14ktthWzNCnCABisL5sC7PAv4LZ1Jro7W9smgeFrIg/hj
 RlbtCAyHTImyrdMSTjNqjp5+575D0gI5RJq4DsTbBuSrD1NumyBC2PADB
 UrgoFzSYgTXdqxUTueMaTsrzyOztYJBNgHHKCAV/UcMvavcJe9m7vMxYh
 rQ3YgzZ1IZxqBaY5I6A8Yqi1X1y6rKkEI8I/sz8qGOrqshRn/aJs88FO7
 1yM/YS/VNIs1CXybwy+YkgidX11PBXCrcU0c4MxGXx5o3kHkmmke2Ykg7 g==;
X-CSE-ConnectionGUID: dPHQlF57S5CK6Inp4hxO3A==
X-CSE-MsgGUID: wfRzj7pxTK+L7tfmjwjqJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43281770"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="43281770"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
X-CSE-ConnectionGUID: 2v6XN68ITaOcaxUXzj4XiA==
X-CSE-MsgGUID: jAvZ4ZQhSsuMFt+Ty8JQdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111425856"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI i-g-t 01/10] runner/settings: Fix code_coverage_script leak
Date: Fri,  7 Feb 2025 15:09:35 -0800
Message-ID: <20250207231039.2883195-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207231039.2883195-2-lucas.demarchi@intel.com>
References: <20250207231039.2883195-2-lucas.demarchi@intel.com>
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

Make sure to free it when clearing settings.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/runner/settings.c b/runner/settings.c
index 92fd42ea6..afb312dc1 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -640,6 +640,7 @@ void clear_settings(struct settings *settings)
 	free(settings->name);
 	free(settings->test_root);
 	free(settings->results_path);
+	free(settings->code_coverage_script);
 
 	free_regexes(&settings->include_regexes);
 	free_regexes(&settings->exclude_regexes);
-- 
2.48.1

