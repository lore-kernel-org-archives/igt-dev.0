Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDD5C369A2
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 08:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515F010EB28;
	Fri, 11 Apr 2025 08:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BN3K6Im9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7281A10EB28
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 08:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744358494; x=1775894494;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=UacWOhVXYV5rUibtHnmkcvZD726Uh4baxXObxL5toQc=;
 b=BN3K6Im9fUL7P3MaPvb1SbmLSlTlUJYRD3f8KH1POabtutuTX/9uZWyx
 fFlJJtYUc+dgQL0C/v5V45Cq9TRZtgRlw/2qebSxqkLCwCIcirNFw10DV
 fot8HNr0q3DadtWJjdB/tWrLs1Zvji2afetNPCBjG5BZeBtzAHWqlRhRI
 ymV7uCDtF2/MVEbZQQFR2zcWfd4PqV9i0MNWXk5nHj/9WMMEb3mbxrWZQ
 dTKJcilEJeCP7bFJrnwq80+V7t7Oot3kA9rXPUAJ9c4H4FXzq027rup0M
 ou+qiRdTiBikFjvwf0ClGIItafC9bh7YobEIhYPRbynZugs92JWdJT2Xu w==;
X-CSE-ConnectionGUID: lWkgG9WqSPamgWE7TXhcFQ==
X-CSE-MsgGUID: SnCcB1AOQkWpcOb73bXYdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="46032195"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="46032195"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 01:01:32 -0700
X-CSE-ConnectionGUID: b/ZVngA+RYuUz1CabPJDmw==
X-CSE-MsgGUID: 43prRiSkTaWGwUtL/NGhnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="129125334"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.254.149])
 ([10.245.254.149])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 01:01:14 -0700
Message-ID: <48ed6161-0215-4220-a456-00132d3b6cd8@linux.intel.com>
Date: Fri, 11 Apr 2025 10:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/intel_sysfs_debugfs: Remove xe-gt
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 matthew.brost@intel.com, pravalika.gurram@intel.com
References: <20250410090315.4201-1-peter.senna@linux.intel.com>
 <20250410181117.6ovckutjog7wleah@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250410181117.6ovckutjog7wleah@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 4/10/2025 8:11 PM, Kamil Konieczny wrote:
> Hi Peter,
> On 2025-04-10 at 11:03:15 +0200, Peter Senna Tschudin wrote:
>> The intel_sysfs_debugfs test now includes functionality to read all Xe
>> debugfs files, making the older xe-gt test redundant. Additionally,
>> xe-gt causes issues when testing Virtual Functions (VFs) in SR-IOV
>> setups, as some of the debugfs files it expects are not present for VFs.
>>
>> Rather than extending the overlapping and problematic xe-gt, this commit
>> removes it entirely.
> 
> I agree on removing reading part but not on existence checks.
> Imho start with small refactor:
> 
> - remove readings
> - change existing checks so they will print _all_ missing
>    debugfs nodes and only after that test will fail if there
>    were misses
Isn’t that what validate_entries() is supposed to handle? (Although the 
warnings are currently hidden unless you use the --warn-not-hit flag - 
and that only works properly after removing the leading -- in 
long_options to make it behave naturally 😉)

There are already missing nodes like: gtX/tunings, gtX/stats, 
gtX/uc/gsc_info, gtX/uc/guc_ctb, plus additional ones if certain 
features are enabled.

The main problems I see with this approach are:

1. Maintenance cost – the list is already outdated and it's unclear what 
criteria should be used to decide which attributes to include

2. Platform/feature-specific nodes – we’d need to replicate kernel logic 
to avoid false positives, which adds further maintenance overhead. Those 
specific feature checks are probably better handled by dedicated tests 
that directly use those attributes. Being a VF is just one specific case 
of this.
	
3. VM scenarios – we might be using an older kernel without some nodes. 
In IGT, we typically skip tests if the required feature isn’t available.

4. Private developer attributes – if a developer adds their own 
"non-public" attributes, the test would fail (though maybe that's not a 
major issue?).

--
marcin>
> Final step should be:
> - adding a flag for those nodes which should not exist on VF,
>    detect that and ignore this on VFs.
> 
> These could be done in one or in two patches.
> 
> Regards,
> Kamil
> 
>>
>> Cc: marcin.bernatowicz@intel.com
>> Cc: matthew.brost@intel.com
>> Cc: pravalika.gurram@intel.com
>> Cc: kamil.konieczny@linux.intel.com
>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> ---
>>   tests/intel/intel_sysfs_debugfs.c | 66 -------------------------------
>>   1 file changed, 66 deletions(-)
>>
>> diff --git a/tests/intel/intel_sysfs_debugfs.c b/tests/intel/intel_sysfs_debugfs.c
>> index 6beb94109..431934aee 100644
>> --- a/tests/intel/intel_sysfs_debugfs.c
>> +++ b/tests/intel/intel_sysfs_debugfs.c
>> @@ -322,63 +322,6 @@ xe_test_base(int fd, struct drm_xe_query_config *config)
>>   	xe_validate_entries(fd, "", expected_files, ARRAY_SIZE(expected_files));
>>   }
>>   
>> -/**
>> - * SUBTEST: xe-gt
>> - * Description: Check all gt debugfs devnodes
>> - * TODO: add support for ``force_reset`` entries
>> - */
>> -static void
>> -xe_test_gt(int fd, int gt_id)
>> -{
>> -	char name[256];
>> -	static const char * const expected_files[] = {
>> -		"uc",
>> -		"steering",
>> -		"topology",
>> -		"sa_info",
>> -		"hw_engines",
>> -		"pat",
>> -		"mocs",
>> -//		"force_reset"
>> -		"ggtt",
>> -		"register-save-restore",
>> -		"workarounds",
>> -		"default_lrc_rcs",
>> -		"default_lrc_ccs",
>> -		"default_lrc_bcs",
>> -		"default_lrc_vcs",
>> -		"default_lrc_vecs",
>> -		"hwconfig"
>> -
>> -	};
>> -	static const char * const expected_files_uc[] = {
>> -		"huc_info",
>> -		"guc_log",
>> -		"guc_info",
>> -//		"guc_ct_selftest"
>> -	};
>> -
>> -	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
>> -		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
>> -		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> -		if (igt_debugfs_is_dir(fd, expected_files[i], gt_id))
>> -			continue;
>> -		igt_debugfs_dump(fd, name);
>> -	}
>> -
>> -	for (int i = 0; i < ARRAY_SIZE(expected_files_uc); i++) {
>> -		sprintf(name, "gt%d/uc/%s", gt_id, expected_files_uc[i]);
>> -		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> -		igt_debugfs_dump(fd, name);
>> -	}
>> -
>> -	sprintf(name, "/gt%d", gt_id);
>> -	xe_validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));
>> -
>> -	sprintf(name, "/gt%d/uc", gt_id);
>> -	xe_validate_entries(fd, name, expected_files_uc, ARRAY_SIZE(expected_files_uc));
>> -}
>> -
>>   /**
>>    * SUBTEST: xe-forcewake
>>    * Description: Check forcewake debugfs devnode
>> @@ -475,15 +418,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>>   			xe_test_base(fd, xe_config(fd));
>>   		}
>>   
>> -		igt_describe("Check all gt debugfs devnodes");
>> -		igt_subtest("xe-gt") {
>> -			xe_for_each_gt(fd, gt) {
>> -				snprintf(devnode, sizeof(devnode), "gt%d", gt);
>> -				igt_require(igt_debugfs_exists(fd, devnode, O_RDONLY));
>> -				xe_test_gt(fd, gt);
>> -			}
>> -		}
>> -
>>   		igt_describe("Check forcewake debugfs devnode");
>>   		igt_subtest("xe-forcewake") {
>>   			xe_test_forcewake(fd);
>> -- 
>> 2.43.0
>>

