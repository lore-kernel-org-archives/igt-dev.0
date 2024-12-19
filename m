Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2425E7718B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 14:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9212610E2A4;
	Thu, 19 Dec 2024 14:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQZFJNCS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC2610E2A4
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 14:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734619571; x=1766155571;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UQ4fCurNRbBWJjs9mXoKEG9et2lsHNANHFj0JpqsI/s=;
 b=lQZFJNCSCXBZWb6rhaQnHX7a487PLbl30rCvoZ+Jw9t/NJXvt/oxF00V
 hHgBu17kZIml1Mqvm/G+CXivkrMww4dy/hb1KeY1q7V9lCH8MIWYo7qK5
 g2PPr4A+Cw27Oc4qEEzm8985mBbc3HREh6mYCz197JdR7y9KlS5O4xSDN
 pazpuT9Jf5KtfD3xc3mt+reb2vy18eiQ30O9RYXYwCbZkFQJdgsX9ptzz
 W9alfEsnT81ny2Wi0eap0AApAsx6Uanz6yFSN6h5EZX3kDcMbKyrZZK/V
 upBIlweP7egXo3iOv1m8dwk9MW/xfaxK6zfjTjbvRMt3VikIWFhZGxdJc A==;
X-CSE-ConnectionGUID: wdokum6jQh23IqbOrhiC/w==
X-CSE-MsgGUID: gVGsUK81RUq8B2b/+T1tVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="57604909"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="57604909"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 06:46:11 -0800
X-CSE-ConnectionGUID: 0+tshnj7R4CVrcazm6iFGA==
X-CSE-MsgGUID: 1QCP7g8AQxWl6QG0DTeiRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121482410"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.41])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 06:46:10 -0800
Date: Thu, 19 Dec 2024 08:46:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, peter.senna@linux.intel.com, 
 matthew.brost@intel.com
Subject: Re: [PATCH v2] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
Message-ID: <dkyt2j7wyechttpdcdqs3xbi7sx7j64f3dohgw4rev6zndygil@mjxvzqstc6hd>
References: <20241219035609.680347-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241219035609.680347-1-pravalika.gurram@intel.com>
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

On Thu, Dec 19, 2024 at 09:26:09AM +0530, Pravalika Gurram wrote:
>Read and dump  below debugfs entries.
>ggtt
>register-save-restore
>workarounds
>default_lrc_rcs
>default_lrc_ccs
>default_lrc_bcs
>default_lrc_vcs
>default_lrc_vecs
>hwconfig
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
>---
> tests/intel/xe_debugfs.c | 50 ++++++++++++----------------------------
> 1 file changed, 15 insertions(+), 35 deletions(-)
>
>diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
>index 700575031..a31de41a4 100644
>--- a/tests/intel/xe_debugfs.c
>+++ b/tests/intel/xe_debugfs.c
>@@ -162,6 +162,16 @@ test_gt(int fd, int gt_id)
> 		"pat",
> 		"mocs",
> //		"force_reset"
>+		"ggtt",
>+		"register-save-restore",
>+		"workarounds",
>+		"default_lrc_rcs",
>+		"default_lrc_ccs",
>+		"default_lrc_bcs",
>+		"default_lrc_vcs",
>+		"default_lrc_vecs",
>+		"hwconfig"
>+
> 	};
> 	static const char * const expected_files_uc[] = {
> 		"huc_info",
>@@ -170,41 +180,11 @@ test_gt(int fd, int gt_id)
> //		"guc_ct_selftest"
> 	};
>
>-	sprintf(name, "gt%d/hw_engines", gt_id);
>-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>-	igt_debugfs_dump(fd, name);
>-
>-	sprintf(name, "gt%d/sa_info", gt_id);
>-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>-	igt_debugfs_dump(fd, name);
>-
>-	sprintf(name, "gt%d/steering", gt_id);
>-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>-	igt_debugfs_dump(fd, name);
>-
>-	sprintf(name, "gt%d/topology", gt_id);
>-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>-	igt_debugfs_dump(fd, name);
>-
>-	sprintf(name, "gt%d/pat", gt_id);
>-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>-	igt_debugfs_dump(fd, name);
>-
>-	sprintf(name, "gt%d/mocs", gt_id);
>-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>-	igt_debugfs_dump(fd, name);
>-
>-	sprintf(name, "gt%d/uc/guc_info", gt_id);
>-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>-	igt_debugfs_dump(fd, name);
>-
>-	sprintf(name, "gt%d/uc/huc_info", gt_id);
>-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>-	igt_debugfs_dump(fd, name);

these last 3 would be dropped from the dump. I don't think that's
intentional, is it?

Ideally this would be more than 1 patch:
1) replace the copy and paste with the loop
2) add more files to be dumped

Also, it seems we are not actually running this
"test" as part of BAT. I think that more than actually checking the
asserts this would be useful to check the state of the hardware
in the beginning of a BAT execution.

Lucas De Marchi

>-
>-	sprintf(name, "gt%d/uc/guc_log", gt_id);
>-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>-	igt_debugfs_dump(fd, name);
>+	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
>+		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
>+		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>+		igt_debugfs_dump(fd, name);
>+	}
>
> 	sprintf(name, "/gt%d", gt_id);
> 	validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));
>-- 
>2.34.1
>
