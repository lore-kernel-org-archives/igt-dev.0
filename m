Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A76CFA765
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 10:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0784A10E2A5;
	Fri,  4 Oct 2024 10:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VTdUww+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686A110E2A5
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 10:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728038503; x=1759574503;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wjIKUgUHEplIqWY5NBmejGkjJwgWzK/tPoFbkUxaVKc=;
 b=VTdUww+5U54/gPGOKMNj/6fQhdfkDo4rzd4QHg0duoD6MGrTJV9PFuCr
 6om0UzJxYWDdph4FDEALj3n/aZWu6GoEVhIG2H8pzkHnIj8caF6g+Gbk2
 XMzP1iuyQR0TQoLKhdWoXkyg+K4U0tbPARuTlXa7h3co23Y3Z++yZv8b4
 OFq8r5ApoH/+en9OMlvmh6eG5obp5VXAjyBmFtlpJBFJE6OSKfYrMJkc0
 bZwce4X4zXnsg+iYZ3DnyBgPDDnntIbkrXIFAFA40zO7CkKgcxLT5V1uj
 +wR2HFslY99QrgyM2TBdVxhnMt3A1B0Nif9AG0D27ntfDC/LlSE1/pMl5 A==;
X-CSE-ConnectionGUID: 3lTTpYf3RdS8dLpS9uyNug==
X-CSE-MsgGUID: 2Go/CBcqQAi7sCcSS5wt0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31140525"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="31140525"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:41:43 -0700
X-CSE-ConnectionGUID: 65jySgSHSeu5Vjk/MtBGIQ==
X-CSE-MsgGUID: LYxdnCDKQ0yd6H/5HRx5jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74778342"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Oct 2024 03:41:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 13:41:40 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/14] lib/igt_draw: Add 64bpp support to the
 XY_FAST_COLOR_BLT path
Date: Fri,  4 Oct 2024 13:41:14 +0300
Message-ID: <20241004104121.32750-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
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

XY_FAST_COLOR_BLT supports 64bpp natively. Simply enable it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_draw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 93924ece8250..2312a0c71030 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -789,7 +789,8 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 			blt_cmd_depth = 2 << 19;
 			break;
 		case 64:
-			/* Not used or supported yet */
+			blt_cmd_depth = 3 << 19;
+			break;
 		default:
 			igt_assert(false);
 		}
@@ -824,7 +825,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 					   dst->addr.offset);
 		intel_bb_out(ibb, 0);	/* TODO: Pass down enough info for target memory hint */
 		intel_bb_out(ibb, color);
-		intel_bb_out(ibb, 0);	/* 64 bit color */
+		intel_bb_out(ibb, color >> 32);	/* 64 bit color */
 		intel_bb_out(ibb, 0);	/* 96 bit color */
 		intel_bb_out(ibb, 0);	/* 128 bit color */
 		intel_bb_out(ibb, 0);	/* clear address */
-- 
2.45.2

