Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8BAE77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 18:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E07D10ED99;
	Thu, 19 Dec 2024 18:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SE619+pD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079E810ED99
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 18:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734632556; x=1766168556;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+IQYF6kJ3Q2hceOYKx7cGScHiIdfPRYc6k4YXbQh6rY=;
 b=SE619+pDa8HklRVO9uJJF12LNRjSkWzg+kmuPXCXkrT5OiiIHzj8YhRG
 JDBud9uUG1T/KKa8XZHiZNKey26UedVlbMNhQqaGKDz9Q+CroUu9lsjcO
 6jDNWsSni2PpW4npv9F5SFhwc6roP76wFDs0dfPOe3kk+EsVQ7ctHIDtW
 7y8UUZM7oVJS9lEh83BlikNIoohYLUwKllf93V3fRrfjkIWZw41z2svGG
 wLscdGUqOMdJwAZTwkbC5X7+L1r0GKEZKQrj/vJlG+E1CWFEfkW64VSZg
 I1w2k6/CwZ31N6RP8VvsT8n1pG6DVDCO7fb9lgFpsTou+RxludxJXjNak Q==;
X-CSE-ConnectionGUID: X7nfj/lTRVWcKZXVNx2m2g==
X-CSE-MsgGUID: UlDS/V8KT8WR8nKvEhabKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35381004"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35381004"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 10:22:35 -0800
X-CSE-ConnectionGUID: LPIVR2cnRVeJjfGH4iFU7w==
X-CSE-MsgGUID: dHPT7ScqQLifU1pt2h0vqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="129092019"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 10:22:34 -0800
Date: Thu, 19 Dec 2024 19:22:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org, peter.senna@linux.intel.com,
 matthew.brost@intel.com
Subject: Re: [PATCH v2] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
Message-ID: <20241219182231.znkxmtzydbzmqp24@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org, peter.senna@linux.intel.com,
 matthew.brost@intel.com
References: <20241219035609.680347-1-pravalika.gurram@intel.com>
 <dkyt2j7wyechttpdcdqs3xbi7sx7j64f3dohgw4rev6zndygil@mjxvzqstc6hd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dkyt2j7wyechttpdcdqs3xbi7sx7j64f3dohgw4rev6zndygil@mjxvzqstc6hd>
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

Hi Lucas,
On 2024-12-19 at 08:46:05 -0600, Lucas De Marchi wrote:
> On Thu, Dec 19, 2024 at 09:26:09AM +0530, Pravalika Gurram wrote:
> > Read and dump  below debugfs entries.
> > ggtt
> > register-save-restore
> > workarounds
> > default_lrc_rcs
> > default_lrc_ccs
> > default_lrc_bcs
> > default_lrc_vcs
> > default_lrc_vecs
> > hwconfig
> > 
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> > ---
> > tests/intel/xe_debugfs.c | 50 ++++++++++++----------------------------
> > 1 file changed, 15 insertions(+), 35 deletions(-)
> > 
> > diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> > index 700575031..a31de41a4 100644
> > --- a/tests/intel/xe_debugfs.c
> > +++ b/tests/intel/xe_debugfs.c
> > @@ -162,6 +162,16 @@ test_gt(int fd, int gt_id)
> > 		"pat",
> > 		"mocs",
> > //		"force_reset"
> > +		"ggtt",
> > +		"register-save-restore",
> > +		"workarounds",
> > +		"default_lrc_rcs",
> > +		"default_lrc_ccs",
> > +		"default_lrc_bcs",
> > +		"default_lrc_vcs",
> > +		"default_lrc_vecs",
> > +		"hwconfig"
> > +
> > 	};
> > 	static const char * const expected_files_uc[] = {
> > 		"huc_info",
> > @@ -170,41 +180,11 @@ test_gt(int fd, int gt_id)
> > //		"guc_ct_selftest"
> > 	};
> > 
> > -	sprintf(name, "gt%d/hw_engines", gt_id);
> > -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > -	igt_debugfs_dump(fd, name);
> > -
> > -	sprintf(name, "gt%d/sa_info", gt_id);
> > -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > -	igt_debugfs_dump(fd, name);
> > -
> > -	sprintf(name, "gt%d/steering", gt_id);
> > -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > -	igt_debugfs_dump(fd, name);
> > -
> > -	sprintf(name, "gt%d/topology", gt_id);
> > -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > -	igt_debugfs_dump(fd, name);
> > -
> > -	sprintf(name, "gt%d/pat", gt_id);
> > -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > -	igt_debugfs_dump(fd, name);
> > -
> > -	sprintf(name, "gt%d/mocs", gt_id);
> > -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > -	igt_debugfs_dump(fd, name);
> > -
> > -	sprintf(name, "gt%d/uc/guc_info", gt_id);
> > -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > -	igt_debugfs_dump(fd, name);
> > -
> > -	sprintf(name, "gt%d/uc/huc_info", gt_id);
> > -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > -	igt_debugfs_dump(fd, name);
> 
> these last 3 would be dropped from the dump. I don't think that's
> intentional, is it?
> 
> Ideally this would be more than 1 patch:
> 1) replace the copy and paste with the loop
> 2) add more files to be dumped
> 
> Also, it seems we are not actually running this
> "test" as part of BAT. I think that more than actually checking the
> asserts this would be useful to check the state of the hardware
> in the beginning of a BAT execution.
> 
> Lucas De Marchi
> 

Imho we should merge correct version 1 and then go to make clean,
shorter, correct improved test. It is better to have a coverage
now and make rework later.

Regards,
Kamil

> > -
> > -	sprintf(name, "gt%d/uc/guc_log", gt_id);
> > -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > -	igt_debugfs_dump(fd, name);
> > +	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
> > +		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
> > +		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > +		igt_debugfs_dump(fd, name);
> > +	}
> > 
> > 	sprintf(name, "/gt%d", gt_id);
> > 	validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));
> > -- 
> > 2.34.1
> > 
