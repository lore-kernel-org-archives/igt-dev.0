Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5080ECD98CE
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 11:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0676A10E9DA;
	Fri, 12 Jun 2026 11:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brOUN9GO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB32C10E9DA
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 11:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781262074; x=1812798074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l5KKGvxZICYTAoYYCkXu8xUrPizEzyNg6YBzu58uWHY=;
 b=brOUN9GOe9RTetnVEL+OvGSJraJAIqsSu+LD6X+b2vchttPTDSQKzson
 U5J921ca7I/dhmmA/dqtxsmioggpfQqMk0wU7XCnSTcoinAKQV8hkYtlq
 Vv5T0Yp+gb6xsyOEchfWV2XlJA+kH+YXu2QKsskyQi9LpCIyZTK8ElKQv
 E+We1DIFkgOqiX6GoEb33gpsloI4DaY+UN4GowhHcz/osZa34YCoX2HVb
 MxCEbtGwixCsh67AG811o/mD17PHXavhIWz1fyTYCb/qs2QTdTszqn02q
 9WOW8i7tSFUenvRuNQWBGLjpZD1BCZdfvuJptOtfv8xtcG3p9dfrQplv1 Q==;
X-CSE-ConnectionGUID: GbrlB+bgQpK8sPMKsm2PrA==
X-CSE-MsgGUID: 8GiRjdsTQe+Eb183uSPltg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82074275"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="82074275"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:01:14 -0700
X-CSE-ConnectionGUID: OPWadSchSHOblR9cvjALsw==
X-CSE-MsgGUID: bggQTwR1TXu7eX+pY6hRWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="284902123"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:01:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 4/4] tools/intel_vbt_decode: fall back to guessing PCI
 ID from VBT signature
Date: Fri, 12 Jun 2026 14:00:44 +0300
Message-ID: <0ff53a45d2067d0dbc8057723db45a91736a2df6.1781261899.git.jani.nikula@intel.com>
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

If the PCI ID wasn't passed on the command-line, DEVICE environment
variable, or VBIOS, fall back to guessing the device ID from the VBT
signature.

Cc: Michał Grzelak <michal.grzelak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 69961ce29e01..9451a77318ae 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -4331,6 +4331,8 @@ int main(int argc, char **argv)
 	}
 	if (!context.devid)
 		context.devid = get_device_id(VBIOS, size);
+	if (!context.devid)
+		context.devid = intel_guess_device_id(context.codename);
 	if (!context.devid)
 		fprintf(stderr, "Warning: could not find PCI device ID!\n");
 
-- 
2.47.3

