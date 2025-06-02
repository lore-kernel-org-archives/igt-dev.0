Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C570C5B559
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 19:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FA010E587;
	Mon,  2 Jun 2025 19:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCyuT8Lc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3C510E587
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 19:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748892358; x=1780428358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T9inaW7HmajIMgecEL4NnnXtwtz1qC3Ru4mmH0kZmL8=;
 b=JCyuT8Lcywh80tKQ4SuHvKk8i2Cks7aUC+bmCCsBYcl1U5uTonkPutm2
 MBng7WGHlIQWXA6XXefr1FUCKazbB6k5gGWGxSVLHRe/nwmZH1sHS8kdn
 8fKeBNYsBRlyrdpOC5qyYJ8yol5ZhT7p1oFDaDw2Ia7S7EhW/UdxgyMXR
 j4rsyo4JYJDzH7yaigf32QtpecKkACZJu6S3OXnyHuZr0yG0MjqzmKE/6
 D1p/Tc1JNtmnH609a19kOLc7NMi5pmsnFeORSn+PTRPrNkJI9zGfOs0wp
 TeVgIaK8LCFwNde7rqODTvCCcPfa9VKXX4SnfHsshl3WfrQ5mujMkssct g==;
X-CSE-ConnectionGUID: b077IpKiQeu06K5PUeku2g==
X-CSE-MsgGUID: sZ7ufS8GRvC/fjh7HJ0aLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50777099"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="50777099"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 12:25:57 -0700
X-CSE-ConnectionGUID: wDF7rF8nRp2/pR+BmMNs5w==
X-CSE-MsgGUID: dahYhFlDTdesXc1F5v+f7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="144590220"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2025 12:25:55 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v12 03/11] tests/intel/*_intel_bb: handle base64 encode
 fail
Date: Mon,  2 Jun 2025 19:25:07 +0000
Message-ID: <20250602192515.95309-4-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
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

g_base64_encode function returns a newly allocated string containing
the Base64 encoded data. Upon failure, null can be returned.

When g_base64_encode function fails, exit the calling function with
error.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 tests/intel/api_intel_bb.c | 3 +++
 tests/intel/xe_intel_bb.c  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 4a1c9be91..13b1091d8 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -944,6 +944,9 @@ static int dump_base64(const char *name, struct intel_buf *buf)
 
 		igt_info("--- %s ---\n", name);
 		pos = str = g_base64_encode(destbuf, outsize);
+		if (str == NULL)
+			return -1;
+
 		outsize = strlen(str);
 		while (pos) {
 			char line[LINELEN + 1];
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index d8bd7b519..ef95b4a2a 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -595,6 +595,9 @@ static int dump_base64(const char *name, struct intel_buf *buf)
 
 		igt_info("--- %s ---\n", name);
 		pos = str = g_base64_encode(destbuf, outsize);
+		if (str == NULL)
+			return -1;
+
 		outsize = strlen(str);
 		while (pos) {
 			char line[LINELEN + 1];
-- 
2.49.0

