Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC38C25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB90410E0D3;
	Fri, 31 May 2024 14:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KH2XXDyR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2881210E3EF
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165499; x=1748701499;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BlUlU+M06zpy1zKRhFQGP5DYSSDXp/Kagyc5CzFVg/Q=;
 b=KH2XXDyRNzJhY5ArZF1kPqz9lLeEf87eM5BB0FCROiVqzK8Xo7870xnd
 WXOvLxnQZP+PxcLI9C8DnsIN0Sd7O/n+IImJ9O+HF63Uq2tNyTUp8Be53
 cB3rCusYOp1o7Y3r6+uwOykPYV6w4BNVRYwZet6L38wQLrn9IWC4taGa3
 LIyQ8xu2NrMFRei+yBcgTV/QjTNBIVXCEQZQCvzNpti1jlb153+dvLI3C
 fFsU0532tO08C1Y9mF7a+Nm0P4Si5S6BZjWtR9kCkdueHctZQ8xxhgtpe
 TQclhS3uvSrW1CmnMmhZKegLK0ZnWpU8EdFOB0oKo+bhBjTX9J/50PhbP w==;
X-CSE-ConnectionGUID: qM2v8dLwQ3GEeXlUCsBy8A==
X-CSE-MsgGUID: 0mfkZEXlQKGz/rP7WMHkIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113676"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113676"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:10 -0700
X-CSE-ConnectionGUID: W/PnCd0ySVu/WRQj3Ik5kQ==
X-CSE-MsgGUID: u8MKjfJySwCCSZ4/cZyJ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160816"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:07 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/20] tools/intel_vbt_decode: Add missing newline
Date: Fri, 31 May 2024 17:23:39 +0300
Message-ID: <20240531142354.16528-6-ville.syrjala@linux.intel.com>
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

Add the missing newline after the fast link training
lane count printout.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 16a034e6e487..f9bc1deb906c 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1694,7 +1694,7 @@ static void dump_edp(struct context *context,
 			       edp->fast_link_params[i].rate);
 			break;
 		}
-		printf("\t\t\tlanes: X%d",
+		printf("\t\t\tlanes: X%d\n",
 		       edp->fast_link_params[i].lanes + 1);
 		printf("\t\t\tpre-emphasis: %s (0x%x)\n",
 		       dp_preemph(edp->fast_link_params[i].preemphasis),
-- 
2.44.1

