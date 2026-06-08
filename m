Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08E0CD8C9D
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 12:44:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842B510E358;
	Mon,  8 Jun 2026 12:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P07Tj3yy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B05E10E257
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780922574; x=1812458574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jL4utYAHJNFupQfKwexH5FQhhP867Qv1KIZ2wRXUDc4=;
 b=P07Tj3yy1h+lRP1dTov/RbQLnok43jIX74P8np67A+UWeDA8zr44CTe5
 fua8tf2NlwOuHBqupNF73pwFF4wDR7y5mtEl1jkhCpcyiJRIcYeDGIHDo
 OIeBhQHB1Tz9tcq8H9BkiNMPexjlhLMWQZr30Fkt9r5UGRLSaK3SF1JMI
 sQ2mPoV43FbdKP9jh3p6WURrUXz29N1SKHQr9b8lBozOJX7mcDWIb0f8D
 yqLmbH9gEw1YUtwGVKzWDM5dfMWHPZRNdnF3GluuV/bzVhGM+VtJrKaaS
 cc+qisUbKIbYu+pcSAJm5ifSyB1aiKYWkfHm4egKFFkj5LL7PhCyKbQO5 A==;
X-CSE-ConnectionGUID: Zewxeth7S4SeCX/5rrvp1A==
X-CSE-MsgGUID: BcD4yXeORnuJxY3/MSf35w==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80683114"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80683114"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 05:42:54 -0700
X-CSE-ConnectionGUID: Lt+PiPy+QUW51NKrB/B/Pg==
X-CSE-MsgGUID: XD6IDqXjT9ea4yi+FsHhMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="244688436"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 08 Jun 2026 05:42:53 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 3/8] tools/vbt_decode: return 0 from get_device_id()
Date: Mon,  8 Jun 2026 14:41:16 +0200
Message-ID: <20260608124121.3131410-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260608124121.3131410-1-michal.grzelak@intel.com>
References: <20260608124121.3131410-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

This function returns -1 on errors and the caller checks for 0. This
leads to -1 being used as the device id. Return 0 instead of -1.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 5b7a6a49e9..6a9c1de7b3 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3700,13 +3700,13 @@ get_device_id(unsigned char *bios, int size)
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
2.45.2

