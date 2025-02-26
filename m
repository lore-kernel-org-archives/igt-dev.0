Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EF6C19776
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 10:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A5B10E8C0;
	Wed, 26 Feb 2025 10:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVPC+jC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA60710E8C0
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740566701; x=1772102701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W/1skwi7wWmKI78U2HYqqPcYuzErDrjbtnac9z1qQqc=;
 b=lVPC+jC1F3NIc3rQVHz2KvI6U+kdIHfC6NOftZBXVVd+4TobW0uutGS1
 t+yds0J9y6jcEGaZGMDy3PIgqndtc3sr89rgJSZSsHFymmKzWPa8zYAGg
 wLL59gTxc1F+wqIW9sbrLnUu3BOCUV7/W2AsZncedx31pN8ROodyGd8Q9
 dfnTTUrbowrNBUnkcriF2kIOiKEFJWGGXd2gFLiQ/gZF1OS/PeGZ2yeRI
 vkVQPcNuqQx7gPOgUlZS1rw+9B0JeLKgRTFNt+bBXQ7U4Sn9vu5tszQM+
 mxcZ8C8ySptEsc74nqY5nVl2rCtleuVUn+zi62UQ7tOFKQ8koeaioIOsl g==;
X-CSE-ConnectionGUID: amFkBF+9R4OiGU4BUb9qWw==
X-CSE-MsgGUID: THpegtiQS0muCr6C491eBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="63870842"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="63870842"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 02:45:01 -0800
X-CSE-ConnectionGUID: zvHLYQ/LQ0WH9o4IwbuSeQ==
X-CSE-MsgGUID: ugwqFEzjR6uWJnZsKXixkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117160383"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.245.30])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 02:45:00 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 2/2] tests/xe_eudebug_online: Set VRT
Date: Wed, 26 Feb 2025 11:44:36 +0100
Message-Id: <20250226104436.257298-2-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226104436.257298-1-dominik.grzegorzek@intel.com>
References: <20250226104436.257298-1-dominik.grzegorzek@intel.com>
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

Limit number of GRFs used by single thread to utilize all
possible threads per EU.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug_online.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 472013fe1..7f36faee1 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -158,6 +158,9 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
 
 	shader = gpgpu_shader_create(fd);
 
+	if (shader->gen_ver == 3000)
+		gpgpu_shader_set_vrt(shader, VRT_96);
+
 	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
 	if (flags & SHADER_BREAKPOINT) {
 		gpgpu_shader__nop(shader);
-- 
2.34.1

