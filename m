Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CBAC19F4F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD74E113769;
	Tue, 23 Apr 2024 23:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVwddtse";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EBD1122AF
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915829; x=1745451829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0P3UQIhtpV/CmVbWB0v4jDYlh8Rn9uUjpVecUnWoPUk=;
 b=kVwddtsexqtc7GXSvgp8Zxl6lGiwCJyYRs4vhARK9vIyWeO0i8omx2v4
 4UlJo0BMUfB6Xc06m9VD3F4xUeqgzooVwmO1jDDZXznDIRhU/RmD8ulVX
 JpxhA2H48cnz08Pdw47Tu5j/uD6FEZqw+7d7SrBkpsCf8AKdp6AcZlbIu
 cBgCs2Kp7Q8LcP9eStvsXjGbN3oERizJpDKEegCNyOlFRX5pJ4jtH2pOk
 lrqi8vxLLLi1ogI4YfxApwDj+3f/+ycMfrKLuwfh14LXL3nfJKpFJw7CI
 V7+cIiSdyc6efQG+t7i+2bW8wDQujffiaqnNYxnRWsL0tJIt8aDdRLUvR w==;
X-CSE-ConnectionGUID: 8QhR4XWdTHC9/v+eazn2Dg==
X-CSE-MsgGUID: s9d4cM78SOiMmOuHTMTMSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13361981"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13361981"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
X-CSE-ConnectionGUID: CxUB1N6xRK+yl0rU0HtHNA==
X-CSE-MsgGUID: vRI75HLKRj6ihgT2QQRrbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180893"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t v2 01/21] lib/igt_drm_fdinfo: Fix wrong name len assert
Date: Tue, 23 Apr 2024 16:44:11 -0700
Message-ID: <20240423234431.1959354-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423234431.1959354-1-lucas.demarchi@intel.com>
References: <20240423234431.1959354-1-lucas.demarchi@intel.com>
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

When parsing engine name, at this point we have something like:

	"drm-engine-render:	232409619162 ns"
	            ^      ^
	            |      |
	          name     p

We are copying the engine name to the final destination, but
strlen(name) will actually contain the entire string. Since we already
know the name length, calculated previously, just use it for copying the
string.

Since each name is 256-bytes long, the assert doesn't trigger easily,
but it's better to be correct. And more efficient.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 18dbb5d0b..a1f4ad10d 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -90,8 +90,9 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
 
 		if (found < 0) {
 			assert((info->num_engines + 1) < ARRAY_SIZE(info->names));
-			assert((strlen(name) + 1) < sizeof(info->names[0]));
-			strncpy(info->names[info->num_engines], name, name_len);
+			assert(name_len  < sizeof(info->names[0]));
+			memcpy(info->names[info->num_engines], name, name_len);
+			info->names[info->num_engines][name_len] = '\0';
 			found = info->num_engines;
 		}
 	}
-- 
2.43.0

