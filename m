Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12463108B901
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 11:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF37510EAD8;
	Fri, 20 Mar 2026 11:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmbRh+Ae";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C95210EAD8
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 11:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774006316; x=1805542316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cD6YU4zYSEMlDybRppy9MASP0Az+uhKVAN/3ygXNESM=;
 b=UmbRh+AejQYf+mooeFBQd4z72tB5z5rez+01yePAYWuax9PfoQSP5YZg
 LuPMEWwo5naRJgk/YucBMrb2WSySz6DvtAHmiwptFRwKMVoW2tcBTDCLI
 ngFknl2E3KbBRdfVRKYhsxMDSMUDPaYAnorYepb0Gt+SwdyqfEWFulqZ2
 4wMJlUlWmwB2sIMEwna2rqb/klk6O0aiJ0qfoZNu2QP2Ofda5BVaPQdhS
 txyew3ZwJpV5zFSO5Pu+dZpCWja+eOo4XtfjyEpM44MaSjK4+HHjVu7af
 mS2CGR5q/507pd14VP4YxTMcapYkJsjZVUzHFzgRmT5aTx2e/n68TAymL A==;
X-CSE-ConnectionGUID: MDAZjWo7Q6yN4/My2SXpSQ==
X-CSE-MsgGUID: yJPRBEzfSCqpEku+Orrflw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75163162"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75163162"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:31:56 -0700
X-CSE-ConnectionGUID: 94DfVnNtQW21XFwacbjc7Q==
X-CSE-MsgGUID: YjSGVzI9R3K5uftGRWjsYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227743306"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:31:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t 2/2] lib/kms: fix igt_crtc_connector_valid() validity
 check
Date: Fri, 20 Mar 2026 13:31:43 +0200
Message-ID: <20260320113143.2882422-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320113143.2882422-1-jani.nikula@intel.com>
References: <20260320113143.2882422-1-jani.nikula@intel.com>
MIME-Version: 1.0
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

output->config.valid_crtc_index_mask is a bit mask of CRTC indexes, not
pipes. Check the validity using crtc->crtc_index instead of crtc->pipe.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 71ed4604e7e0..318ff8ba9732 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -687,7 +687,7 @@ static inline bool igt_output_is_connected(igt_output_t *output)
 static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *output)
 {
 	return igt_output_is_connected(output) &&
-		output->config.valid_crtc_index_mask & (1 << crtc->pipe);
+		output->config.valid_crtc_index_mask & (1 << crtc->crtc_index);
 }
 
 #define for_each_if(condition) if (!(condition)) {} else
-- 
2.47.3

