Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DC6C47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A19D11276E;
	Fri, 22 Mar 2024 20:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRpRaz2x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A68211276D
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711140124; x=1742676124;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UMP26zp4066lBnkhFD89ETkinF1gXvOvnMR0XTp4pic=;
 b=GRpRaz2xeedsbuHrQlxOebr4chFr7SwPB/ddGMLQMo5nfVWqjCSuqYbx
 MoCpzSiXSo6Dql0QRngFphM89Sr00HLJB4AfvSRFfplPA3PawrP4cOYBQ
 avuz0z6K5g93ulvkuLzmmsKSTek/lbDdFVqUn1RM8+IYyMGGTI3cpgF0i
 k9Qf73H5NUqZK7YapeK4ddi/O8gHDA3C48Q2L0NBsdLGQwMzxmooARfyg
 tb968Kqw2xAhW+R4wyKOSyPqbqQdeT1I3wGfAroZVi7fQLO6W23w23hZj
 ZMkIBwdz3y6AxOTLKjmbxlMkG5p3ZeKN7ZTeNPRhaxqk8vq7QFi6XOpk9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329380"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329380"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783621"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783621"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:42:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:42:00 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/13] tools/intel_vbt_decode: Decode all the driver
 feature bits
Date: Fri, 22 Mar 2024 22:41:24 +0200
Message-ID: <20240322204125.17212-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
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

Add decoding for bunch of driver feature bits: Hpd wake, ADT, DFPS.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index aa15dbb5e3fd..f6549d6e0f76 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1574,8 +1574,14 @@ static void dump_driver_feature(struct context *context,
 
 	printf("\tPC Features field validity: %s\n",
 	       YESNO(feature->pc_feature_valid));
+	printf("\t\tHpd Wake: %s\n",
+	       YESNO(feature->hpd_wake));
+	printf("\t\tAssertive Display Technology (ADT): %s\n",
+	       YESNO(feature->adt_enabled));
 	printf("\tDynamic Media Refresh Rate Switching (DMRRS): %s\n",
 	       YESNO(feature->dmrrs_enabled));
+	printf("\tDynamic Frames Per Second (DFPS): %s\n",
+	       YESNO(feature->dfps_enabled));
 	printf("\tIntermediate Pixel Storage (IPS): %s\n",
 	       YESNO(feature->ips_enabled));
 	printf("\tPanel Self Refresh (PSR): %s\n",
-- 
2.43.2

