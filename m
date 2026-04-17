Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F924F99C69
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 21:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4722310EAA0;
	Fri, 17 Apr 2026 21:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBtbgwHU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49A710EAA1
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 21:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776461382; x=1807997382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iJrirSMvcPwtdxvAnpUNdCOEnIWS1IqFd45CV3j/YC0=;
 b=oBtbgwHU+NwK29sioujF7j+DZS8e7FX7XgP/L0yAV/EvbAzP5pfFsy0x
 yZ29FZCopCIUATmtCkAd7z43J9P/Cm0vVsg/RHN4IYf7kJ4XW9sAnvT4e
 d9/CrUqN4c5AsQKi7nqEIkHbopMGPwMhW2631GBCwAzuwMEun7Tligg3k
 WlvnY/6AKEd36P8GMiqtHWCVJ8PVFPO1OwZlAi8wDBfCsQ7B5dbrLKZwH
 WpgrT8jcfJqfoQraBvyXk9d+1YMBOCp8Hp5xaWzbW9Y1Bl2AdAD8Kjy1X
 45hTY8WE4nYcwaNtDFHYyos4HJr9INrOA6sb4G6inscnZSgIf55DXq/6N Q==;
X-CSE-ConnectionGUID: W5bw9mUiTF6ADaegq73AUQ==
X-CSE-MsgGUID: rfObNbcgSZ+uSKYuek9KJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76644127"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="76644127"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 14:29:41 -0700
X-CSE-ConnectionGUID: oypDtZi6SRKVXSzXzLKiIw==
X-CSE-MsgGUID: b95PlpQWQmyc8WPIN9cwyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="235140029"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 14:29:41 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t,
 v3 4/5] lib/igt_hdr: Add helpers to enable and disable HDR on an
 output
Date: Sat, 18 Apr 2026 03:08:17 +0530
Message-Id: <20260417213818.2050571-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260417213818.2050571-1-swati2.sharma@intel.com>
References: <20260417213818.2050571-1-swati2.sharma@intel.com>
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

Add convenience helpers to explicitly enable and disable HDR on an
output connector.

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 lib/igt_hdr.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_hdr.h b/lib/igt_hdr.h
index 0df1ac5ed..5fbb26796 100644
--- a/lib/igt_hdr.h
+++ b/lib/igt_hdr.h
@@ -30,4 +30,7 @@ int igt_hdr_set_invalid_metadata(igt_output_t *output,
 bool igt_output_supports_max_bpc(igt_output_t *output);
 bool igt_output_supports_hdr(igt_output_t *output);
 
+void igt_hdr_disable(igt_output_t *output);
+void igt_hdr_enable(igt_output_t *output);
+
 #endif /* IGT_HDR_H */
-- 
2.25.1

