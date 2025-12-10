Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717ABD3B9A9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 09:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A7910E6C0;
	Wed, 10 Dec 2025 09:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fyvSixiB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5929810E6C0
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 09:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765359551; x=1796895551;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=r7609WzRdGQzFFadR2PgYoq1uGYnQsAVHEBeR45ovqk=;
 b=fyvSixiByz2nGagVDDTtj4nQGD0eNY8nZ0CLFvmHvsaeZo94U6Qj9OH9
 KeFSeom7C++Ag1wNEhFzjZubKwt4poqGaKpHfMWh771u5UwrDyX+FVgFW
 yFfiRo9gxclBMq3r+XYsyb+cXeisaBQBhXw6/Utwjl+uSiqcOy6SVB4yV
 XuWkR9ntadw+QjKnjWuMH9gnzFyk4v9MYRvI7MYUIukVPWEEGKRHqD4i0
 dFSfbBmHcEVELHTLukwDFBh+zZekTTKBnq6LSqsgssen112bhi2EP+Eib
 YNJ9HrsnzKZgRfRbxQ1mNhCIE3bKBqpF1hSqWWLJAMd4wQ8qGBpy0+NbK Q==;
X-CSE-ConnectionGUID: QXOZVpxVRJuvPYOOwgQHmQ==
X-CSE-MsgGUID: GPq4hBhRSeaTg9LdMVu7Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77943235"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="77943235"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:39:11 -0800
X-CSE-ConnectionGUID: rO9kJzPfSheg1kfhqFohwQ==
X-CSE-MsgGUID: IunoHCSETpCNFXCARfq+Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="233865761"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:39:09 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 01/10] tests/intel/kms_dp_linktrain_fallback: Reduce
 side effects in igt_output_set_pipe() args
Date: Wed, 10 Dec 2025 11:38:54 +0200
Message-ID: <20251210093903.15934-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
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

