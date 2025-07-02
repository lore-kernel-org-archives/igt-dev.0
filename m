Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4501BC83038
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 05:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F4C10E5F6;
	Wed,  2 Jul 2025 05:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAFz8nob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876FA10E0A0
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 05:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751434462; x=1782970462;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tCYOh5oJ1uVDw20aEQSo8UQoj1l/jQQT5HQBTYVZa2s=;
 b=PAFz8nobXF61f23MipWNOxGWlXcjBIRktADSkmgX3KuDM2OURRyHiFD7
 L2Ybz7PEWFw6Nt0EdTVp2209UDwGa5M+Tj8mB68GGXJROXIR+DnWOi624
 lIEgIC3F+5wolTy8WzWjXuaymDSixWURFYiEyMTAjFaA+XAiyuzWOII6I
 nSDnTJsRtRc9jkxPVh5TUuiPAFF1dLEukO1Z05al2xzeOO0QGrh3BUok7
 rOJlMOJa5Xnq0MiK7mt4yIR+wZuq9QcSGazSE8ECA59e+CNgLc5JVGKG7
 eCooYYm9nJ7RER80njrTcDY1+ArM1IqlzE152mD6qn+aKlocTiBnJ6i35 Q==;
X-CSE-ConnectionGUID: 4HyU2eguQ9ijNcPjgD4+fg==
X-CSE-MsgGUID: NxkYMV3iRvaHYHhzSqma4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53827729"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53827729"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 22:34:22 -0700
X-CSE-ConnectionGUID: Pbkfys2lTRqslOrfKflGrg==
X-CSE-MsgGUID: 0vYQfCDlQTGafu0yoDJqBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158012333"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 22:34:19 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik.B.S@intel.com, uma.shankar@intel.com,
 mitulkumar.ajitkumar.golani@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 0/2] Relax link reset and frame rate checks
Date: Wed,  2 Jul 2025 11:04:13 +0530
Message-ID: <20250702053415.434831-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Improves test stability by adjusting pass rate to frame rate and
removing link reset assert to avoid false failures.

Naladala Ramanaidu (2):
  tests/kms_flip: Adjust pass rate threshold based on frame rate
  tests/kms_flip: Remove assertion dependency on link reset retry
    condition

 tests/kms_flip.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

-- 
2.43.0

