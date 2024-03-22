Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B76C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 16:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F26D1125DD;
	Fri, 22 Mar 2024 16:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHYO3qma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8D71125DC
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 16:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711125183; x=1742661183;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HBD1o1mw2GwGEHyhPciW9RgoTInywbiCVCjJASdbfQc=;
 b=MHYO3qma6qONjzKBxavNKmoPrOfjtUxYQwFi/W1QS0vQqPAe6nKG9/zm
 i1v582Q9Mm/4T3g5czB73pa+X7FsSUXstzKM/hWsgKHrBv4vo9y1ZR4zt
 aQ5FRzf71pC/1qAX5XIze95fTkfbfx+coE8api1FHILi+2jGYJH1jSkua
 WIYuVNuDC0tUP8uNB2N3s8jt8SlnqVUqyRxq3DOJtdxQxzcTjLVEmDyJC
 DbbN8tKfEhoz7vlZpVZz/86lkZ6L29E0Qwlw/y6hZHDCn1K+qByG1+fL3
 3Lw1DwNny6XL8FdTzGybQOD7PBGh2ncDMnkXOmu1LBRbpticKLvvgZRyi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17575024"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="17575024"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:33:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="827783532"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="827783532"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 09:33:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 18:33:00 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/5] tools/intel_vbt_decode: Change panel indicator from
 * to (1)
Date: Fri, 22 Mar 2024 18:32:49 +0200
Message-ID: <20240322163251.11102-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240322163251.11102-1-ville.syrjala@linux.intel.com>
References: <20240322163251.11102-1-ville.syrjala@linux.intel.com>
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

In preparation for also indicating the second panel (panel_type2)
change the indicator for the first panel (panel_type) to "(1)"
from "*".

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 2473812cca6d..98f64d0822c6 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -92,7 +92,7 @@ static bool dump_panel(const struct context *context, int panel_type)
 
 static const char *panel_str(const struct context *context, int panel_type)
 {
-	return panel_type == context->panel_type ? " *" : "";
+	return panel_type == context->panel_type ? " (1)" : "";
 }
 
 /* Get BDB block size given a pointer to Block ID. */
-- 
2.43.2

