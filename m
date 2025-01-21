Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3094C02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 15:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8A010E5F8;
	Tue, 21 Jan 2025 15:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eH7DtB+l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E483310E5E2
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 15:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737474575; x=1769010575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nQaQFbCegyfV7z0KA77+X1h9axb2MdAhB0G3fNVTSYk=;
 b=eH7DtB+lACQpmg/hHsMX2qwZScz1rH8XSNSNMg0YBqbkHq5I/pSmVSNy
 1DmbIP30hh73a0sVkRc1ZsQy0PzJgGkux4lKwOHg3SJwxjKZjMyw35VkC
 gvFZmX2wvTS7D+eR/RbYWIIjjcVdCfCxOL2NhavHhHUcRWQki6OudZsK9
 F0iJg5ZCpk5C2RGZTLZAg8qjqtZ/QgI33a85eblvP2cndkpojff61zCBJ
 QYAOnmQBDKUFlo2M3IVTzG/d1ouriOjHljXtykRf4QNR78vGiQjz+gq1f
 pTEWXjbb+LnwV/n6b6XGvQ77qCGK65VDjMo4uOM5DAi2dTO6KjExckc5T A==;
X-CSE-ConnectionGUID: WhbBl/2aTM61euVYXcXHwg==
X-CSE-MsgGUID: HLx5UQpiRImk+KLMuWTa/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="60365840"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="60365840"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 07:49:34 -0800
X-CSE-ConnectionGUID: mHw3INYZTeG2y7KKGGPYuw==
X-CSE-MsgGUID: 4chWip6IQzOrokBVJd8Fsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="130132677"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.110])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 07:49:33 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jordan Justen <jljusten@debian.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t] tools: rename power into igt_power
Date: Tue, 21 Jan 2025 16:49:19 +0100
Message-ID: <20250121154919.181947-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Some distros installs igt tools in /usr/bin and as long as
a name of a tool has a prefix of igt_ or intel_ it will not
cause a problem. However name like 'power' is a little too
generic, so change it into igt_power.

Fixes: a886e0ad9783 ("tools/power: Introduce a small power/energy measurement tool")
Reported-by: Jordan Justen <jljusten@debian.org>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/168
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/{power.c => igt_power.c} | 0
 tools/meson.build              | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/{power.c => igt_power.c} (100%)

diff --git a/tools/power.c b/tools/igt_power.c
similarity index 100%
rename from tools/power.c
rename to tools/igt_power.c
diff --git a/tools/meson.build b/tools/meson.build
index 511aec69e..f091af380 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -12,6 +12,7 @@ foreach prog : tools_progs_noisnt
 endforeach
 
 tools_progs = [
+	'igt_power',
 	'igt_stats',
 	'intel_audio_dump',
 	'intel_backlight',
@@ -44,7 +45,6 @@ tools_progs = [
 	'dpcd_reg',
 	'lsfacts',
 	'lsgpu',
-	'power',
 ]
 tool_deps = igt_deps
 tool_deps += zlib
-- 
2.48.1

