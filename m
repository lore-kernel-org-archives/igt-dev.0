Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD2EC369B5
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 09:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3019010E69A;
	Tue, 15 Apr 2025 09:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9+ewlDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F40A10E696
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 09:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744707887; x=1776243887;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NCx/H2Xm0a7iBkgStSesYME2a3I6G8ydbVwNY7+0B2E=;
 b=C9+ewlDjEYDnj31QzzH8C1CNPbIoQLMhf4X76CDOjUgX6MHoGZO6mAV8
 gxvhp25x1O9BQk3a6y7un8xSKHzK1KCvg6kQdkH6Tk1pQ5Giy8ueU2Wxb
 rYaukXseScl5NkeyQ2PRoOFKVw8Yrc88k2CtyDkflue7ICmNP9LfrXP5u
 +wsLURmMXTSKr1/Br8+fV0hGiJs0a3SK6pP/5iHtiDiwNbLTpykJ9xUiN
 CifrHrGxecvQ0BEZ91PCblp/NveHhd6i27/iBn4/duHSLaZjx0o32qj2t
 PGr5zLn13Eo51Yx7QOeg9lJLeNUdRYPDdLr/iwaLPEVUVTLTWnJh2+q4c A==;
X-CSE-ConnectionGUID: TaEqL1aQRhSIx2dBTcxkVw==
X-CSE-MsgGUID: ZzSYbbdMQqW3BlucdjnYnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56383863"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="56383863"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:04:47 -0700
X-CSE-ConnectionGUID: odRhq5tjR+mlIszbGvi/cg==
X-CSE-MsgGUID: phy3UxQhS+KO5b9rU0cl8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130954698"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 02:04:45 -0700
Date: Tue, 15 Apr 2025 11:04:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 matthew.brost@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/intel_sysfs_debugfs: Remove xe-gt
Message-ID: <20250415090443.hk26ilwtti3jpj3z@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 matthew.brost@intel.com, pravalika.gurram@intel.com
References: <20250410090315.4201-1-peter.senna@linux.intel.com>
 <20250410181117.6ovckutjog7wleah@kamilkon-DESK.igk.intel.com>
 <48ed6161-0215-4220-a456-00132d3b6cd8@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48ed6161-0215-4220-a456-00132d3b6cd8@linux.intel.com>
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

Hi,
On 2025-04-11 at 10:01:12 +0200, Bernatowicz, Marcin wrote:
> 
> 
> On 4/10/2025 8:11 PM, Kamil Konieczny wrote:
> > Hi Peter,
> > On 2025-04-10 at 11:03:15 +0200, Peter Senna Tschudin wrote:
> > > The intel_sysfs_debugfs test now includes functionality to read all Xe
> > > debugfs files, making the older xe-gt test redundant. Additionally,
> > > xe-gt causes issues when testing Virtual Functions (VFs) in SR-IOV
> > > setups, as some of the debugfs files it expects are not present for VFs.
> > > 
> > > Rather than extending the overlapping and problematic xe-gt, this commit
> > > removes it entirely.
> > 
> > I agree on removing reading part but not on existence checks.
> > Imho start with small refactor:
> > 
> > - remove readings
> > - change existing checks so they will print _all_ missing
> >    debugfs nodes and only after that test will fail if there
> >    were misses
> Isn’t that what validate_entries() is supposed to handle? (Although the
> warnings are currently hidden unless you use the --warn-not-hit flag - and
> that only works properly after removing the leading -- in long_options to
> make it behave naturally 😉)
> 
> There are already missing nodes like: gtX/tunings, gtX/stats,
> gtX/uc/gsc_info, gtX/uc/guc_ctb, plus additional ones if certain features
> are enabled.

Good point.

> 
> The main problems I see with this approach are:
> 
> 1. Maintenance cost – the list is already outdated and it's unclear what
> criteria should be used to decide which attributes to include
> 
> 2. Platform/feature-specific nodes – we’d need to replicate kernel logic to
> avoid false positives, which adds further maintenance overhead. Those
> specific feature checks are probably better handled by dedicated tests that
> directly use those attributes. Being a VF is just one specific case of this.
> 	
> 3. VM scenarios – we might be using an older kernel without some nodes. In
> IGT, we typically skip tests if the required feature isn’t available.
> 
> 4. Private developer attributes – if a developer adds their own "non-public"
> attributes, the test would fail (though maybe that's not a major issue?).
> 

I see that debugfs has two subtests for display-off and display-on
so maybe introduce something like this?
Also imho existance checks needs to be done separately for sysfs
as in sysfs they are user api. Debugfs should be considered unstable
so I am ok with removing this now but please work on improving
coverage.

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> --
> marcin>
> > Final step should be:
> > - adding a flag for those nodes which should not exist on VF,
> >    detect that and ignore this on VFs.
> > 
> > These could be done in one or in two patches.
> > 
> > Regards,
> > Kamil
> > 
> > > 
> > > Cc: marcin.bernatowicz@intel.com
> > > Cc: matthew.brost@intel.com
> > > Cc: pravalika.gurram@intel.com
> > > Cc: kamil.konieczny@linux.intel.com
> > > Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> > > ---
> > >   tests/intel/intel_sysfs_debugfs.c | 66 -------------------------------
> > >   1 file changed, 66 deletions(-)
> > > 
> > > diff --git a/tests/intel/intel_sysfs_debugfs.c b/tests/intel/intel_sysfs_debugfs.c
> > > index 6beb94109..431934aee 100644
> > > --- a/tests/intel/intel_sysfs_debugfs.c
> > > +++ b/tests/intel/intel_sysfs_debugfs.c
> > > @@ -322,63 +322,6 @@ xe_test_base(int fd, struct drm_xe_query_config *config)
> > >   	xe_validate_entries(fd, "", expected_files, ARRAY_SIZE(expected_files));
> > >   }
> > > -/**
> > > - * SUBTEST: xe-gt
> > > - * Description: Check all gt debugfs devnodes
> > > - * TODO: add support for ``force_reset`` entries
> > > - */
> > > -static void
> > > -xe_test_gt(int fd, int gt_id)
> > > -{
> > > -	char name[256];
> > > -	static const char * const expected_files[] = {
> > > -		"uc",
> > > -		"steering",
> > > -		"topology",
> > > -		"sa_info",
> > > -		"hw_engines",
> > > -		"pat",
> > > -		"mocs",
> > > -//		"force_reset"
> > > -		"ggtt",
> > > -		"register-save-restore",
> > > -		"workarounds",
> > > -		"default_lrc_rcs",
> > > -		"default_lrc_ccs",
> > > -		"default_lrc_bcs",
> > > -		"default_lrc_vcs",
> > > -		"default_lrc_vecs",
> > > -		"hwconfig"
> > > -
> > > -	};
> > > -	static const char * const expected_files_uc[] = {
> > > -		"huc_info",
> > > -		"guc_log",
> > > -		"guc_info",
> > > -//		"guc_ct_selftest"
> > > -	};
> > > -
> > > -	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
> > > -		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
> > > -		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > > -		if (igt_debugfs_is_dir(fd, expected_files[i], gt_id))
> > > -			continue;
> > > -		igt_debugfs_dump(fd, name);
> > > -	}
> > > -
> > > -	for (int i = 0; i < ARRAY_SIZE(expected_files_uc); i++) {
> > > -		sprintf(name, "gt%d/uc/%s", gt_id, expected_files_uc[i]);
> > > -		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > > -		igt_debugfs_dump(fd, name);
> > > -	}
> > > -
> > > -	sprintf(name, "/gt%d", gt_id);
> > > -	xe_validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));
> > > -
> > > -	sprintf(name, "/gt%d/uc", gt_id);
> > > -	xe_validate_entries(fd, name, expected_files_uc, ARRAY_SIZE(expected_files_uc));
> > > -}
> > > -
> > >   /**
> > >    * SUBTEST: xe-forcewake
> > >    * Description: Check forcewake debugfs devnode
> > > @@ -475,15 +418,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
> > >   			xe_test_base(fd, xe_config(fd));
> > >   		}
> > > -		igt_describe("Check all gt debugfs devnodes");
> > > -		igt_subtest("xe-gt") {
> > > -			xe_for_each_gt(fd, gt) {
> > > -				snprintf(devnode, sizeof(devnode), "gt%d", gt);
> > > -				igt_require(igt_debugfs_exists(fd, devnode, O_RDONLY));
> > > -				xe_test_gt(fd, gt);
> > > -			}
> > > -		}
> > > -
> > >   		igt_describe("Check forcewake debugfs devnode");
> > >   		igt_subtest("xe-forcewake") {
> > >   			xe_test_forcewake(fd);
> > > -- 
> > > 2.43.0
> > > 
> 
