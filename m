Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EAB606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 01:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XxRC79A/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D9010F8E6;
	Wed,  4 Nov 2026 01:03:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9DA10E66C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 00:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793753719; x=1825289719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AWyeXlDhC1ybLynhxfEVPYwB6tUY1I5NIFnJMh2Fx2g=;
 b=XxRC79A/jyokz7TAbcM6+Dw96dAf7T2ls6kODKcDkMkID5fqCw0cSVLP
 UljtKjceIm1InpMUcyaL0wuLXKNC6ocqAzXus+sQLwRg1Z5qtAYizSsfP
 z2RmIOxiDph5EJ+1PJn1ljtECR+g8Uy70jmaFOH0im1/cephbI7+7Fosp
 6+THpNmmUX5d4YWsxB1eTUo5D/lF1ZzvlRgZgwTQjJ1qC7mlp77awQAYu
 2PYfwpZzqRubSEBmiXbW0dwKEH5QVA6tOWxvPW3OTvrT6CJiGwTMSCI97
 7/BriMdN297Yjvf4khdeW838kwOIETgt3qDlT1lDZQw0LpT/gzIDxS95r Q==;
X-CSE-ConnectionGUID: SedRRe/dT8Gv+SWQsGPpyw==
X-CSE-MsgGUID: SG8h9RtNSTqfKs2gSF+s1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2506017"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2506017"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:09 -0800
X-CSE-ConnectionGUID: DCOXa64TQL2lkg0PaPyiOQ==
X-CSE-MsgGUID: FFvNTeYgQOOTX79KaoBWdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6421543"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com
Subject: [PATCH v2 3/8] tests/intel/xe_oa: Check that a removed device can't
 open OA streams
Date: Tue,  3 Nov 2026 16:55:09 -0800
Message-ID: <20261104005505.3232485-13-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
References: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An OA ioctl that races with unbind must not reach OA once it is torn
down. Check that STREAM_OPEN on the drm fd of the removed device fails
with ENODEV.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 046d57c3f4e8..e10b77bca1b2 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2937,7 +2937,8 @@ static void unbind_rebind_recover(void)
 /**
  * SUBTEST: unbind-rebind-stream
  * Description: Open an OA stream and test the effects of unbind and rebind: the stream
- *		dies and the device works after rebind.
+ *		dies, no new streams can be opened on the removed device and the device
+ *		works after rebind.
  */
 static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int flags)
 {
@@ -2966,6 +2967,10 @@ static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int f
 	for (i = 0; i < unbind_num_streams; i++)
 		unbind_stream_check_dead(&streams[i], "after-unbind");
 
+	/* The drm fd of the removed device can't open new streams */
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &primary->param,
+				ENODEV);
+
 	if (flags & UNBIND_CLOSE_BEFORE_REBIND) {
 		igt_set_timeout(60, "stream close timed out (wedged?)");
 		for (i = 0; i < unbind_num_streams; i++)
-- 
2.55.0

