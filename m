Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6E7CD98C7
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 11:30:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE6310E38F;
	Mon, 15 Jun 2026 11:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0YKqM7j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84BA10E38F
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781522974; x=1813058974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1/E471t27idZTImjQcFgy85CVKZ0wLuM2c1/VA/VpCQ=;
 b=h0YKqM7jXAJy5bVsvco4nzT1jMCXkFK9d8sjYtl/R3KcOzf85H/nYtuz
 tzZ+FZsJlFhFDepUuYykGXvF8XDedmIK8yhsWjfn+3SzafGJcgcIP/xeY
 msZLY5peq13Cx/Etp1xWv2VjVArISDghxyYCqRlzM2VCdDJij4b2cu24Y
 tGBMMJhTKn+yKWXKDzQy/YQ04L+ubTa3tfp/GViNefbsdNvYTuREapXV/
 7aFtJ8HaQAKf9iB5HzqnoMf7wOeskuzrnnCCzM5gW4wXJIOxRLqUh8SZ0
 1i9DEVDSTtop3AvnMqULcmRaj43F6/6/OiN+tTjqGX6p22tXAioszriyo w==;
X-CSE-ConnectionGUID: 8NY+k4VjRMOv9VPjQMkq/w==
X-CSE-MsgGUID: f1Y11cgwRS+EtU72t3u5xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92578658"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="92578658"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:29:33 -0700
X-CSE-ConnectionGUID: bG/9Zz4lTc+/7flHljGJ+g==
X-CSE-MsgGUID: S5ijSNxqQIikShM0TSx0tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247533000"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:29:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Cc: ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 3/4] tools/vbt_decode: return 0 from get_device_id()
Date: Mon, 15 Jun 2026 14:29:13 +0300
Message-ID: <4d793131c2debe6487584a14ee6cc20004e620eb.1781522896.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781522896.git.jani.nikula@intel.com>
References: <cover.1781522896.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Michał Grzelak <michal.grzelak@intel.com>

This function returns -1 on errors and the caller checks for 0. This
leads to -1 being used as the device id. Return 0 instead of -1.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 5b39e0c1c33e..69961ce29e01 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3702,13 +3702,13 @@ get_device_id(unsigned char *bios, int size)
     int offset = (bios[0x19] << 8) + bios[0x18];
 
     if (offset + 7 >= size)
-	return -1;
+	return 0;
 
     if (bios[offset] != 'P' ||
 	bios[offset+1] != 'C' ||
 	bios[offset+2] != 'I' ||
 	bios[offset+3] != 'R')
-	return -1;
+	return 0;
 
     device = (bios[offset+7] << 8) + bios[offset+6];
 
-- 
2.47.3

