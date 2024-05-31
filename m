Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E801C27C51
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EDC10E417;
	Fri, 31 May 2024 14:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NU57EPdx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AAB10E695
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165505; x=1748701505;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=h0oF7fb3eBMSBh53fuZWYbOJUzEapyS1VoQbt4PPkCQ=;
 b=NU57EPdxzMxL5/V1zX9Ho5OSSnoUf0U4WPY1luugBw0v6v1A8ZruCOKY
 eX1SAEv5Vf5urR1oEbz2xdxsD3SnUBUBUlpXQo/aAFr/xgvMXHBH/O02Z
 cuhrRkLx8YJfcwm2w7tTYCdyDLzxDUeace1RViSsbdMOqqsJ5ZAJyFjTQ
 HGQpTIdLOj43v59QcDlYRVYSR5O+UUauSkV+rLTlLkwYldAjO+fpg1x1a
 UIBoH9yW+u/HC3Qzu1dbI/FKdFxocwmqxiwzexRiVuCqPdOAxtaqEkSFT
 PojkRweI66qEJtodla5I0ukQ8z6FYIXFyNvZS1hdbF+d+epXvK2HcfAz5 Q==;
X-CSE-ConnectionGUID: o6tMIocXQTirDL/BnPws/g==
X-CSE-MsgGUID: 3ThQfmDsTmeKssU2dCBGfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113713"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113713"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:27 -0700
X-CSE-ConnectionGUID: Nz68mxR3RDCpCceETJAibw==
X-CSE-MsgGUID: znOPuIhhTqyafeOINKi2yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160861"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:24 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/20] tools/intel_vbt_decode: Dump the new eDP DSC
 disable bit
Date: Fri, 31 May 2024 17:23:45 +0300
Message-ID: <20240531142354.16528-12-ville.syrjala@linux.intel.com>
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

The eDP block has a new bit to indicate DSC should be disabled.
Dump it out.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index ed18a156c1ee..2d627c821978 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1777,6 +1777,10 @@ static void dump_edp(struct context *context,
 			printf("\t\teDP max port link rate: %g Gbps (0x%02x)\n",
 			       rate / 5000.0f, rate);
 		}
+
+		if (context->bdb->version >= 251)
+			printf("\t\teDP DSC disable: %s\n",
+			       YESNO(panel_bool(edp->edp_dsc_disable, i)));
 	}
 }
 
-- 
2.44.1

