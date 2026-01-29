Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6051CD61013
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 13:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F2B10E05A;
	Thu, 29 Jan 2026 13:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oLHRn5Tg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F2110E05A
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769692855; x=1801228855;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZUVyPFXKLDjh88BkEE24SM3uOa6GVS9WF8uhRWzXcQI=;
 b=oLHRn5Tg5MIbjYHivFnZjX+oA/ptwbeq/V1uyi9CwHXTMZP1zP//U3Ms
 8hW8CUnk1PG4rWsXjJeebrfc1Yfht9DRp6vSZYBXhycp8WD7wl6yZEeO9
 HQ1L0zUTdS904WTZ6crtj+mMqTg1KOUKBXFG2B0xbB1/ty7UUH9viO4wN
 Qnopfil56eqXHMr8XIDM0O5STLEype5D+5rQAB8MY9HjUw+GB6DdolXPb
 +AwVkYrKvypy2vUXOz1eyLwlomBVG/WpvH+btB1PwjWUGNzxsDk4+xetf
 aMJILCdIej5hjVN6y+lIRA84gVa4FNsVgnafEj+sKv1hpE0GdTq1HsDgI Q==;
X-CSE-ConnectionGUID: ZoykIRzPROCryIb4U0ldoQ==
X-CSE-MsgGUID: 3FmEtDgyQ+mHx2xdc8zR6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82042420"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82042420"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 05:20:55 -0800
X-CSE-ConnectionGUID: gRsOqBWVRaqR2qcj6sF6rw==
X-CSE-MsgGUID: Of3PIqzxQaCLH4i8ZBlvBg==
X-ExtLoop1: 1
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.23])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 05:20:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t] tools/intel_display_crc: fix DRM device selection
Date: Thu, 29 Jan 2026 15:20:49 +0200
Message-ID: <20260129132049.3934047-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Initialize DRM device fd to -1 to allow automatic DRM device selection
in igt_debugfs_path(). By the looks of it, this has been broken for
years.

While at it, make the context variable local and initialize using
designated initializers.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_display_crc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/intel_display_crc.c b/tools/intel_display_crc.c
index 357ffb8229f6..347a439053a8 100644
--- a/tools/intel_display_crc.c
+++ b/tools/intel_display_crc.c
@@ -83,14 +83,14 @@ static void print_crcs(display_crc_t *ctx)
 	igt_pipe_crc_free(pipe_crc);
 }
 
-static display_crc_t ctx;
-
 int main(int argc, char **argv)
 {
+	display_crc_t ctx = {
+		.fd = -1,
+		.n_crcs = 1,
+	};
 	int opt;
 
-	ctx.n_crcs = 1;
-
 	while ((opt = getopt(argc, argv, "p:n:")) != -1) {
 		switch (opt) {
 		case 'p':
-- 
2.47.3

