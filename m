Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70ABFCD98CE
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 11:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2922B10F439;
	Fri, 12 Jun 2026 11:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKEMIAn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D4A10E9DA
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 11:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781262098; x=1812798098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EWJxfadIvmsUkLzeqZTxmRQTjQktyq8qs6qSFcQoDVc=;
 b=VKEMIAn/FFIPfDXi8ZGe/RkvEL/a0L0ux8L6gE9/eMpwN+KHbab/Wwrp
 FsD+1ztK7alTF7DMc1nDy+FAwn4thXfxwPFr0Tj5HK22qeo7TPqBMRaD5
 najbEAyxhyG8eq4FkuwxYO/7oVrl4ZEPw9mwgJYmJI9f59NfGot1SMZPP
 vw319+sEtWw0keIK0/x2cJpOu0AJfZT2jZ2leegm/DoAaqaoOT/iBbDk3
 0QdQHumz75FrxxGYaAGAW7tmmoum+Zq85UF3mRGQunbtu/tLb6O3Zmsab
 duxDJLONNO0FCCw8Lz7Zo+idWtbNrz0HxnRNx3qjbTsYFrcIDySqH/ldp Q==;
X-CSE-ConnectionGUID: 3VpjebUkTfycmoLn0Ktz0Q==
X-CSE-MsgGUID: nzHl6vI6R2a3TjxaUDSaIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81226241"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="81226241"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:01:09 -0700
X-CSE-ConnectionGUID: xQA5Li+MQx2rdLnkhdIG7w==
X-CSE-MsgGUID: aJLDhgHJRbyl1KHqnWJj/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="246818252"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:01:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 3/4] tools/vbt_decode: return 0 from get_device_id()
Date: Fri, 12 Jun 2026 14:00:43 +0300
Message-ID: <5f020e16d2604d820341ff2c476cca1dda3d9655.1781261899.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781261899.git.jani.nikula@intel.com>
References: <cover.1781261899.git.jani.nikula@intel.com>
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

