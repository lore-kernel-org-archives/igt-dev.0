Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF605C47422
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 08:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A391112556;
	Mon, 29 Jan 2024 08:15:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623F811255C
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2024 08:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706516121; x=1738052121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XsnqE0tcpx6+Ll+ABQGShQ6YZkTGuey78jKanRHED5M=;
 b=PBngI2+Wj/go21v8+5DHpTTQiauHdTTclNKrvrIWtEsJa9v9GvU/hJ8p
 svEVhAVPMf+fThHY4/aLRgPFdmAhcB3M3xAXbQT6DQ9VvJ5PwNhuum72Q
 Y9wkDogw+c1Y2POBLZEx2+uuBee4HF8W3WdBpY2R72oHj0w5oclGFIvY9
 4ZhY4dO4KiLu9akZzYMgftjgz3JVFVGiIX6DyCre2ftGaPmv3mx7h1Q7q
 Vu+8FrDsool3ydMjcspKOjvYnGrBEwXqvYnnzpv253/I/k4Kkl5lN+Ym8
 LdptbpslgBN9ouseBwtfJUxicE4ELTeBetUahKBkV/LVU077dfnKOzKQd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="401750746"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="401750746"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 00:15:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="787758301"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="787758301"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 00:15:18 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2] tests/intel/xe_exec_atomic: Skip on unsupported
 config
Date: Mon, 29 Jan 2024 09:01:55 +0100
Message-ID: <20240129080155.31648-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Atomics on system memory for dGPU is not functional
at this moment hence skip on such configuration.

v2: remove the skip_on.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_exec_atomic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index 7ee80816c..48c70ec72 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -112,9 +112,8 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 
 static bool has_atomics(int fd, uint32_t region)
 {
-	/* System memory atomics on PVC doesn't work */
-	if (region == system_memory(fd) &&
-	    IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
+	/* System memory atomics on dGPU is not functional as of now */
+	if (region == system_memory(fd) && xe_has_vram(fd))
 		return false;
 
 	return true;
@@ -135,8 +134,8 @@ igt_main
 			uint64_t memreg = all_memory_regions(fd), region;
 
 			xe_for_each_mem_region(fd, memreg, region) {
-
-				igt_skip_on(!has_atomics(fd, region));
+				if (!has_atomics(fd, region))
+					continue;
 
 				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
 					      xe_engine_class_string(hwe->engine_class),
-- 
2.42.0

