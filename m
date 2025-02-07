Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3376C02199
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 23:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C91D10E335;
	Fri,  7 Feb 2025 23:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrRF+uDW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACE210E334
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 23:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738969870; x=1770505870;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NzHNFKXSOt2UBttSevcZNyFPNQpXOKQ9XWuLe9pBhUU=;
 b=nrRF+uDWqMmVo3JLIxa/y3RIYtWtd3vrEHwHhyVVCvHM+UOJuW/KeKNS
 3omjJeHjg5VIZky+YFDaJtaDN8ifBk0uZtmqyiT0Gs1xX5Nb+kH07WOaB
 Yfw2vPUHpvQnpb26IwBtDqe4+1WUmcu0JRwHnXI+R4OTnlnmcX7B332Cf
 ceQIX/i44X3E3E9JIZDX51ionu2BT3D3AR3dvNFh/G8C/J/UkIkzUl36o
 2bZ0gewR9pfk6Ftggc5Kf/sVRPDW1u+IV2vhYLfFqXru71e7Ra19vWGDs
 Uw2rJJYQXDLzIkR+3A2she8wdTripLntZf2KXRvWSpVBsKBI3AYwoDb0Q A==;
X-CSE-ConnectionGUID: LPlxeluYQGu9JS1ndfh8fw==
X-CSE-MsgGUID: YNMDLYo/Q7yq8s5Eh4CfOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43281775"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="43281775"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
X-CSE-ConnectionGUID: QWSV6X8eSs2DBL3rM2yr0A==
X-CSE-MsgGUID: EO1elV+bRwiI902JGa41qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111425870"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI i-g-t 06/10] runner/settings: Drop extra strdup
Date: Fri,  7 Feb 2025 15:09:40 -0800
Message-ID: <20250207231039.2883195-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207231039.2883195-2-lucas.demarchi@intel.com>
References: <20250207231039.2883195-2-lucas.demarchi@intel.com>
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

No need to strdup() again since the fscanf() function is already
allocating the variable. Just set the pointer to NULL so we "leak" our
variable to be saved in the settings.

Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/runner/settings.c b/runner/settings.c
index 73d8aa13d..693c5484e 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1169,7 +1169,11 @@ static unsigned long parse_ul(char **val)
 
 static char *parse_str(char **val)
 {
-	return *val ? strdup(*val) : NULL;
+	char *ret = *val;
+
+	*val = NULL;
+
+	return ret;
 }
 
 #define PARSE_LINE(s, name, val, field, _f)	\
-- 
2.48.1

