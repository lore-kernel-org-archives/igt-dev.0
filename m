Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6980A606A323
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 22:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DkyrgUPD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF4C10E25E;
	Fri, 30 Oct 2026 22:42:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0C110E42F
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 22:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793400020; x=1824936020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hw4eoW3anyvIhRzsuIu5HGx+Bhv2olB2nQSLZdvp8q4=;
 b=DkyrgUPDbah8moaNwiZWz23Ai69M8t0Z6WcLaksv+fAU37ZSeabsc3Q5
 N528prh6R5CoUKtpQIohlCkmCkF+z+rbPK61ZRMI5VV1TuiEWMNn/4Emg
 iJxEFn/xVFoDxS9FlxWBYRXgmNJbaX72foyIPH+hdf7+kljqRcbzkPdy3
 avqWysygS+rQlPWb0N6AeIILP1vo3Egzhf+UwEuZdst7KiC/i57H9yzeP
 yC3ENY4ENyyxyebgR+EE5VHZ4QRpB+vzMSTaPUiPrXc0VYnBP+7UK0Av1
 wQYgfIX0yv8YTyIOMIW74kMDpZZeGtXAR6ciUnbdWRsVaQbFfhdsFxC5N Q==;
X-CSE-ConnectionGUID: VNS2OK1aQz2NG3XiX8TyAw==
X-CSE-MsgGUID: OrYcMdm1SjuNn6T+9u01Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2165494"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2165494"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:40:14 -0700
X-CSE-ConnectionGUID: W4RQsHOZQpqEZS7NasVLYA==
X-CSE-MsgGUID: TQ6/ZrE6StirgaELbXCBpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5874298"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:40:15 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com,
	riana.tauro@intel.com
Subject: [PATCH v2 2/3] tests/intel/xe_oa: Check that OA buffer mmap rejects a
 non-zero offset
Date: Fri, 30 Oct 2026 15:40:14 -0700
Message-ID: <20261030224011.2268663-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030224011.2268663-5-umesh.nerlige.ramappa@intel.com>
References: <20261030224011.2268663-5-umesh.nerlige.ramappa@intel.com>
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

The OA buffer can only be mapped as a whole at offset 0 of the stream
fd. The kernel moves the mapping to the OA buffer's own range in the
drm device's address_space and rejects other offsets with -EINVAL.
Add that case to the invalid mmap parameter checks.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 07571eeb7e55..66e7bf88c745 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4393,6 +4393,12 @@ static void invalid_param_map_oa_buffer(const struct drm_xe_oa_unit *oau)
 	oa_vaddr = mmap(0, default_oa_buffer_size + 1, PROT_READ, MAP_PRIVATE, stream_fd, 0);
 	igt_assert(oa_vaddr == MAP_FAILED);
 
+	/* bad offset, the OA buffer can only be mapped at offset 0 */
+	oa_vaddr = mmap(0, default_oa_buffer_size, PROT_READ, MAP_PRIVATE, stream_fd,
+			sysconf(_SC_PAGESIZE));
+	igt_assert(oa_vaddr == MAP_FAILED);
+	igt_assert_eq(errno, EINVAL);
+
 	/* do the right thing */
 	oa_vaddr = mmap(0, default_oa_buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
 	igt_assert(oa_vaddr != MAP_FAILED && oa_vaddr != NULL);
-- 
2.55.0

