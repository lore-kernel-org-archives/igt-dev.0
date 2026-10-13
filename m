Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4B5CC6B1C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 15:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EA610E929;
	Tue, 13 Oct 2026 15:18:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10C310E90B
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791904613; x=1823440613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MYqUO/nMCLxIpOjx+DOSCtWvxQdNqpnnuLlv1a1r7yM=;
 b=LuOR6dsOeV5RR2ebmAE7Px8qOPoC1wsLb0yYVErE6xH9IKSecmmLG23j
 8Blt7cy6jXzDl4ANwoB4TOvKuLGFSOqSghmab2w6dhbsX7znGGAe3iqlX
 TfNERlXKMyq78M4m9+UaGMkMhGVO51Xk4niqUnLScteYsX+8KL/a4SUdE
 t7EGOdjzUAWuOxpo4yPAan0nd+N+Il8Zg8rXz+l8Ncd0OWQanmNzA+rcd
 iqzrDm3Q2w2B/w13X5FtJYasEm+x9Nx7roXU3lbmzYxljtGyNh84wOnsf
 JMbCsFZ4N/kD1/sHIKLsyBq4ekIXWK5WZG31uCWuwSRChfiLQpnNt09gZ g==;
X-CSE-ConnectionGUID: PZ1zZdnJQfiGGupjDUit2A==
X-CSE-MsgGUID: TLZv6NsvQrqXp1l/ZfSbxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="626592"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="626592"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 08:16:53 -0700
X-CSE-ConnectionGUID: 4jbB9DROSZmYm7Jc+a9qhg==
X-CSE-MsgGUID: //edutWLTcyPXQcydk1wwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1078106"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 08:16:53 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/igt_chamelium_stream: Fix warn about
 discarded const
Date: Tue, 13 Oct 2026 17:16:43 +0200
Message-ID: <20261013151644.174387-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013151644.174387-1-kamil.konieczny@linux.intel.com>
References: <20261013151644.174387-1-kamil.konieczny@linux.intel.com>
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

Fix following warning which is observed on Ubuntu 26.04:

../lib/igt_chamelium_stream.c: In function ‘parse_url_host’:
../lib/igt_chamelium_stream.c:119:15: warning: assignment
	discards ‘const’ qualifier from pointer target type
	[-Wdiscarded-qualifiers]
  119 |         colon = strchr(url, ':');

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_chamelium_stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_chamelium_stream.c b/lib/igt_chamelium_stream.c
index a8cd19e51..062feca26 100644
--- a/lib/igt_chamelium_stream.c
+++ b/lib/igt_chamelium_stream.c
@@ -110,7 +110,7 @@ static const char *stream_error_str(enum stream_error err)
 static char *parse_url_host(const char *url)
 {
 	static const char prefix[] = "http://";
-	char *colon;
+	const char *colon;
 
 	if (strstr(url, prefix) != url)
 		return NULL;
-- 
2.55.0

