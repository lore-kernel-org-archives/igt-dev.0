Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92F5CD1284
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 23:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC64810EAD5;
	Wed, 10 Apr 2024 23:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvo4/T5t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB1F10EAD5
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 23:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712790984; x=1744326984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MLEJefPRq/s//vR5HuDXDp4oueggr2EFMnV3PNUJke0=;
 b=hvo4/T5tH7m9rApZ+V4RhKgQUxc3MqHIhVkt7mhGddpx9GIjwBZpYHyK
 uZyUsqoEBvq/I38jA2C6niPa3h356UyhcPbTVl5ZpxBjOdCrhny0OBZPi
 EFPVktsVAacMWs0mJ8ueOSk0Hwcsw+e5A2UN0bhTk/SGyGr4dWAG6MNk5
 e+UOI3gxV4cAId6vRG2/zfx60DLTtcZkHrHMCPD+hoEZQRp/Qp+96y9tp
 DbYslOLdpfB6CexMWNn58t2nD+JH45Hf3vQhgbWp7YB5K6TxhWmRfIJUc
 eTlHwroQ8DaTsSemwLwGNdF7ugIF57dTxH9QBomMlZrgkSb+Gk41dr3gQ g==;
X-CSE-ConnectionGUID: fa+3+gVmTzSpF0KWIuW3Ug==
X-CSE-MsgGUID: L0MRVxCdQSSk/j5gd4IjOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33583816"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="33583816"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 16:16:23 -0700
X-CSE-ConnectionGUID: 3uez2dOJQ22SeHiLgsxjZA==
X-CSE-MsgGUID: 37pmanQ6R6qDvw76bGZ+2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="21146796"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 16:16:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] intel_reg: Stop warning if register spec is not there
Date: Wed, 10 Apr 2024 16:17:10 -0700
Message-ID: <20240410231710.3113867-1-lucas.demarchi@intel.com>
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

Stop suffering when using igt from the git checkout, which is the case
for all/most developers.

	$ sudo ./build/tools/intel_reg write 0x2358 0xdeadbeef
	Warning: stat '/usr/local/share/igt-gpu-tools/registers' failed: No such file or directory. Using builtin register spec.

Pretty annoying when you have a bunch of commands to run and don't want
to simply ignore stderr.  Keep the other warnings as if the file is
there and can't be read for some reason, it's good to give a warning.
However if the file simply isn't there, let it pass.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel_reg.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 6c37e14d1..ec311a05a 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -1114,12 +1114,8 @@ static int read_reg_spec(struct config *config)
 		path = IGT_DATADIR"/registers";
 
 	r = stat(path, &st);
-	if (r) {
-		fprintf(stderr, "Warning: stat '%s' failed: %s. "
-			"Using builtin register spec.\n",
-			path, strerror(errno));
+	if (r)
 		goto builtin;
-	}
 
 	if (S_ISDIR(st.st_mode)) {
 		r = get_reg_spec_file(buf, sizeof(buf), path, config->devid);
-- 
2.43.0

