Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25615C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C607A10EC70;
	Fri,  7 Jun 2024 13:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHbkQMQo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB4C10EC70
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768687; x=1749304687;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DMp8OHUxDzJUVuwUhGnurxxXfG4P/gS5Ea8XP/egdRg=;
 b=GHbkQMQoH3GkHVX9/iEaJkOyxOPzv2Hz1s6ODE/+wnTe7ImUttpe5Ll3
 yIkC0dYLjCtMhdXYcKx1tVQfo0rq6Xmc23lj2FaJqaP/K1Nkfqrx6Ja1m
 7ZJpsCnexDDsOo8rM5Jc22RqsEleJNyDtbVLk7IPcwG2NoIfd+E6pejq1
 9JbRQOoNb3PVGlI6XWJGj8lgNWpJc1/PGTEbi7126Owo7mDaELcu1jBSS
 02N0XfybKuQ3MDyZCLfW65hOWXw040sKjeJvmcPF8tksdmF2IfyZnnFxa
 th2TFG8sYMTjFN2fPn9R4U6VPFohyWoJMQwGaEhy0txdBdZnOHtifu4Ig A==;
X-CSE-ConnectionGUID: HdvXSU+RSO6dYuimChcTpg==
X-CSE-MsgGUID: QQBxAHLhS0OJuDGKZLkqzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116767"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116767"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:07 -0700
X-CSE-ConnectionGUID: DLXgcEJMQPeCiiRryGrp9g==
X-CSE-MsgGUID: 1LIrzf9KTFGG5C6bJ4jdiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323725"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:04 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/27] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with kernel commit 3e8daf14c47d
Date: Fri,  7 Jun 2024 16:57:33 +0300
Message-ID: <20240607135758.31421-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
References: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Synchronize intel_vbt_defs.h with kernel commit:

3e8daf14c47d ("drm/i915/bios: Define the "luminance and gamma" sub-struct of block 46")

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_defs.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index da8694771f69..1af8407e2081 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -1395,8 +1395,20 @@ struct chromaticity {
 	u8 white_y_hi;
 } __packed;
 
+struct luminance_and_gamma {
+	u8 luminance_enable:1;						/* 211+ */
+	u8 gamma_enable:1;						/* 211+ */
+	u8 rsvd:6;
+
+	u16 min_luminance;						/* 211+ */
+	u16 max_luminance;						/* 211+ */
+	u16 one_percent_max_luminance;					/* 211+ */
+	u8 gamma;							/* 211+ */
+} __packed;
+
 struct bdb_chromaticity {
 	struct chromaticity chromaticity[16];
+	struct luminance_and_gamma luminance_and_gamma[16];		/* 211+ */
 } __packed;
 
 /*
-- 
2.44.2

