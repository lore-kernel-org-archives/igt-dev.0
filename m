Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962FEC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8CC10E221;
	Fri, 31 May 2024 14:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmVMFaQD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581D710E0D3
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165498; x=1748701498;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=A7WuThTp+nT9ljRG5cWEjnHI5ZZm9f9YaP+kTkoxcgo=;
 b=LmVMFaQDddNUDMHy4CWIcaDC/olWC0gynW829z/cqMUreBEmMm2yU91Z
 rV8MxD9szD45ZXz6Wqw3OrGUQz1PZCfcNGIk6jFf+qTJMUHKCErjCZjqY
 YhaLUHYXdFqqTHZIywdEsxO6+VPhFmhZIEEE1AH01renzDHJH2jcU8Isn
 NZfMSpzqBEfkDOKz2/n7S2wSW2scg2WwowjIFjz894Hj4P5c676+WLfoe
 qbyo1ljpuakPbeeu8AU+TUvaMbvGNr0yrsTNC+OXU/THNJ71vOvpM/xFm
 sCJ28eVk+YZ+iz+aM/Vu9IWk1YpzkMQ/O13Hna1AroZqmBipCNGFKtKWW Q==;
X-CSE-ConnectionGUID: 9+GHOm+6R522/vOjgq0TSg==
X-CSE-MsgGUID: Y4XYvdS/QvG3DHM/wvyj/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113667"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113667"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:05 -0700
X-CSE-ConnectionGUID: K857NTVGT3Ov1bPAUjnoig==
X-CSE-MsgGUID: eLCDD7ntQQOGD+pi+yv1dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160806"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:02 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 03/20] lib: Define DIV_ROUND_CLOSEST()
Date: Fri, 31 May 2024 17:23:37 +0300
Message-ID: <20240531142354.16528-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
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

Add a helper for integer division with round to closest behaviour.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_aux.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index 4664559dca82..4b8116dc0998 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -335,6 +335,7 @@ void pipewire_pulse_stop_reserve(void);
 #define roundup_power_of_two(x) ((x) != 0 ? 1ULL << igt_fls((x) - 1) : 0)
 
 #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
+#define DIV_ROUND_CLOSEST(n, d) (((n) + (d) / 2) / (d))
 
 uint64_t vfs_file_max(void);
 
-- 
2.44.1

