Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB510C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 22:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C338D1120EE;
	Tue,  2 Apr 2024 22:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvkgUZFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162D21120E9
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 22:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712096218; x=1743632218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mq3VTGqnVrsvjcukYTxKYOSMJ6AJcT5y++q5F8hAFq4=;
 b=ZvkgUZFImiUfLLq5nF3G0m9dFXkVEAaaNXpJAT8eKEJJdu2QLi7FhAmC
 6Qsk3AKQTWNMUHyJR5Rs8/9nyrU4Zf1QrSavp4yjvUCqJDDfaVMT7Dad6
 s7bqyB6lFFBS5UibqzJKo+z9tN28+T+hKeW+BhQYtGg1B7y4F/nwSwm/O
 //5SVXfe0ICjn8mu7M0nFZA7SU30JwtynO1uwJqdZD5uoM+sbLKRtysHm
 ylKkXraqp+eGR/cDAR5f9t3U9C+gGz+b0zyBpDuwOrUrHbnFDG2be2VBx
 GP5H2m+Uc2Qtp5Y8i0ggta0u/xETE0d0MEuwXNP1/moef2EPd34DN14k+ A==;
X-CSE-ConnectionGUID: t7nX95dTS+SpwlrHoP8jwA==
X-CSE-MsgGUID: WPPT7pb0TpORRBePsaYT+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7424326"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7424326"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:57 -0700
X-CSE-ConnectionGUID: l7W2nJpiQMSBEPCq34ttYw==
X-CSE-MsgGUID: qR5ufuaSSJKw/+uu7e6QCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18035604"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 4/8] gputop: Free clients on exit
Date: Tue,  2 Apr 2024 15:17:12 -0700
Message-ID: <20240402221716.1840148-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240402221716.1840148-1-lucas.demarchi@intel.com>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
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

So it's easily checked with valgrind if we there's something leaking.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/gputop.c b/tools/gputop.c
index 71e28f43e..b13044b50 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -293,5 +293,7 @@ int main(int argc, char **argv)
 		usleep(period_us);
 	}
 
+	igt_drm_clients_free(clients);
+
 	return 0;
 }
-- 
2.43.0

