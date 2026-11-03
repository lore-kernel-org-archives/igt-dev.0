Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF53A606A326
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 04:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QPgN2v5S
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A14E10E74E;
	Tue,  3 Nov 2026 04:54:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B9610F350
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 04:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793681567; x=1825217567;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cpr7U0I8w+ruQyYIW9syzCQ09YWETjzsI6DjBtvKsRg=;
 b=QPgN2v5SPYMBe0nkcZ+1OLYcRkOg7fOwRzw47AYSILxl/KjZIaD+kyAR
 BzdSxDCZqPJvTM8xjMcYGWw0zPGBWptRtTkDxYau6UECHkB504KFPl1lL
 KIuG6l+BTyC1CpSNT2BPadN10dlNI3CBmCDEZRJ89ppFsVwzANsCG6FcP
 0wZzuqYEh2YSWpEn2fdxb+pJPe0efaWFmChJ3FSg2669HUAYyjYYbS4q2
 diVqR7FGtOEHzjkND9jXWS8w4J+aqe1r01Swm/cyS0MasiDFnrxgo4xhr
 Oab+Ffwov/I012lH35Q6QDvfULZuITrZP1Gfo/EFUybbcLnegbrz3YmCg g==;
X-CSE-ConnectionGUID: y4lviGd6Q1ypuabQDz7Zhg==
X-CSE-MsgGUID: lMr8yRbrRP2hs86K4q/igQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2291379"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2291379"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 20:52:47 -0800
X-CSE-ConnectionGUID: q+410LhdQW6JVcwo97MESQ==
X-CSE-MsgGUID: gr0MNl+MQaSdyRm/knghVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6222848"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa004.jf.intel.com with ESMTP; 02 Nov 2026 20:52:45 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 2/3] tests/intel/xe: fix missing bufops cleanups in test
Date: Tue,  3 Nov 2026 10:22:44 +0530
Message-ID: <20261103045241.3367590-7-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103045241.3367590-5-priyanka.dandamudi@intel.com>
References: <20261103045241.3367590-5-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Xe rendercopy test functions created buf_ops context without releasing them.
Add buf_ops_destroy() calls.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_render_copy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index c26c365c36..a2a0f652d4 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -634,6 +634,8 @@ static void render_stress_copy(int fd, struct igt_collection *set,
 		 render_duration_total / render_count,
 		 render_duration_min, render_duration_max);
 
+	buf_ops_destroy(bops);
+
 	/* End all mem copy threads */
 	for (int i = 0; i < thread_copy_count; i++)
 		xe_spin_end(data_mem_copy[i].spin);
-- 
2.43.0

