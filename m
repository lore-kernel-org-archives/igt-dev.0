Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75354D59D6A
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 15:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2603A10E910;
	Fri, 12 Dec 2025 15:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gI2iDl3I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB92D10E903
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765554395; x=1797090395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Us8CHqamd8nG1wUb43AeCTrU7ymsa5+HJUIdyusB9Vc=;
 b=gI2iDl3Io0Z1VbSLcFBVfwnz1QW4e54fNcYF7ldyfr4y6P0Wx7Xrye65
 YghRVGKFtMC9YA/OknKM/AOJGWBHa5bM2MPSbayvdELwCNcSb+aoDLIRo
 tIpUayQij0fT5JA6/OhfJPRB8ZtAZ53PJ2ICDle/xEdCMu6Ehb4kvyo0B
 VzfpaY3uO0E9ZIq8yJ6MX1ZNCNje0I0czRvLW+AQHvL0ik0PXQZy/y7LT
 VzV6GteKaaTtBJMl++exmVbCLU1n+8WBulZ5U2snGXRYqa7hsjthI6R6u
 gB51zaFIG63lvZ1olwjPepMsbAczmWpwXC+Y7SNlU3+/2T+sf6f1XoYKT w==;
X-CSE-ConnectionGUID: ih6GCqqTSoKg4LhS9HWuQA==
X-CSE-MsgGUID: R8ue92w+SVa6a10YPO8qYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="55124582"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="55124582"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:46:34 -0800
X-CSE-ConnectionGUID: 0IqtRBgqReuiP6y6ZBAZiQ==
X-CSE-MsgGUID: NTxaqHBxSkiVvyyy1PSbqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201295437"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:46:33 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 01/10] tests/intel/kms_dp_linktrain_fallback: Reduce
 side effects in igt_output_set_pipe() args
Date: Fri, 12 Dec 2025 17:46:17 +0200
Message-ID: <20251212154626.29471-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251212154626.29471-1-ville.syrjala@linux.intel.com>
References: <20251212154626.29471-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Move the i++ out from the igt_output_set_pipe(() arguments to
reduce the number of side effects there. This avoids breaking
things during upcoming cocci refactoring that wants to duplicate
the expression passed as the first argument.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index ac398ec5bb70..10c4d9e65ebf 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -103,7 +103,8 @@ static void setup_pipe_on_outputs(data_t *data,
 		igt_info("Setting pipe %s on output %s\n",
 			 kmstest_pipe_name(data->pipe),
 			 igt_output_name(outputs[i]));
-		igt_output_set_pipe(outputs[i++], data->pipe);
+		igt_output_set_pipe(outputs[i], data->pipe);
+		i++;
 	}
 }
 
-- 
2.51.2

