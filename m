Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CF5E77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 18:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA25310E478;
	Thu,  9 Jan 2025 18:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwzDLTyn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B0110E478
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 18:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736445830; x=1767981830;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qeadx6o7ocPqnhd2Ma1OMYBcCYIwmCEebJ1hn9zTAdQ=;
 b=MwzDLTynSc2T86lhZ03ztq2VkKosp6KY3s0dIdqefnHNk7f/OFcYvpOI
 pAZm8b9vbCKRWEL51kAJ5PoPqKts6Kcorb5vU4zi8Uhyc5/J07oDDDp9C
 WE9PGpHxojUrQd4ADxmkZFGIRooASDCYXIpBHsHJyvd9RPVu6UBS/Da1S
 FwyIMuPp2+Sol9KWaz00tWTaf8x/TcmiH1cPbPKPUww0z2rTOqBHXN4gc
 b/sd5/NW7EWx5R9EHxSBLVYDHomylQSQbNwx5VW/PMkCcuRMXo/x+/Ago
 gUNW6OTqz5/dCOOmPuksCTABOoeO8tMtcMhNH/0op4JQAjMIUuRWienfU g==;
X-CSE-ConnectionGUID: s3ipbTYgStO/DRumjcFd3A==
X-CSE-MsgGUID: e3I1Sv0iTeK9g9IaPgXgpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48137074"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="48137074"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 10:03:49 -0800
X-CSE-ConnectionGUID: w17Yq9QmQTmmYMKSuIx0sw==
X-CSE-MsgGUID: yEY+a/EFRYylafYUIttqKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108111162"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.77])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 10:03:49 -0800
Date: Thu, 9 Jan 2025 12:03:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v1] tests/xe_debugfs: Improve test_gt subtest
Message-ID: <6miqrch7gr47uslneibcju7fcqjb3sfjx5kji4rq3j3jai5uwv@h7cak2uam3qx>
References: <20250109105721.914096-1-pravalika.gurram@intel.com>
 <v6a252t6spq7j4siiftwiasbi7jl3ognhqinhnwknr4e5xqeyi@awzm247ebwi2>
 <BL1PR11MB55253CE142100726556CFC6C84132@BL1PR11MB5525.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <BL1PR11MB55253CE142100726556CFC6C84132@BL1PR11MB5525.namprd11.prod.outlook.com>
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

On Thu, Jan 09, 2025 at 05:42:37PM +0000, Gurram, Pravalika wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Thursday, January 9, 2025 10:33 PM
>> To: Gurram, Pravalika <pravalika.gurram@intel.com>
>> Cc: igt-dev@lists.freedesktop.org
>> Subject: Re: [PATCH v1] tests/xe_debugfs: Improve test_gt subtest
>>
>> On Thu, Jan 09, 2025 at 04:27:21PM +0530, Pravalika Gurram wrote:
>> >Read the debugfs entries in the loop to improve the readability.
>> >
>> >Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
>> >---
>> > tests/intel/xe_debugfs.c | 84 +++++++---------------------------------
>> > 1 file changed, 13 insertions(+), 71 deletions(-)
>> >
>> >diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c index
>> >bcbb5036a..3d8c17921 100644
>> >--- a/tests/intel/xe_debugfs.c
>> >+++ b/tests/intel/xe_debugfs.c
>> >@@ -180,77 +180,19 @@ test_gt(int fd, int gt_id)
>> > //		"guc_ct_selftest"
>> > 	};
>> >
>> >-	sprintf(name, "gt%d/hw_engines", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/sa_info", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/steering", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/topology", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/pat", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/mocs", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/ggtt", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/register-save-restore", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/workarounds", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/default_lrc_rcs", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/default_lrc_ccs", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/default_lrc_bcs", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/default_lrc_vecs", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/default_lrc_vcs", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/hwconfig", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/uc/guc_info", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/uc/huc_info", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >-
>> >-	sprintf(name, "gt%d/uc/guc_log", gt_id);
>> >-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >-	igt_debugfs_dump(fd, name);
>> >+	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
>> >+		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
>> >+		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> >+		if (!strstr(name, "uc")) {
>>
>> strstr will find any substring "uc". You could do a strcmp() instead, but I don't
>> understand why we are doing this here.
>>
>> I'd just remove 'uc' from the array and update validate_entries to ignore
>> directories.
>>
>> Lucas De Marchi
>>
>
>Strcmp will not work here because sprintf will save  name = "gt0/uc"

if (strcmp(expected_files[i], "uc"))

>If we do strcmp(name,"gt0/uc") gt cannot be fixed 0  always correct it can change
>that's why I have added strstr

suppose we have a new file called chuck or touch or truck or truce or
yucks or.... They would all fall into the else condition which is not what we
want.

>
>I did not understand which directories can be ignored you meant say "uc"
>we don't need to dump "uc/*" data?

any dir. In that loop, just skip any check for 
de->d_type == DT_DIR

Lucas De Marchi

>
>--Pravalika
>> >+			igt_debugfs_dump(fd, name);
>> >+		} else {
>> >+			for (int j = 0; j < ARRAY_SIZE(expected_files_uc); j++)
>> {
>> >+				sprintf(name, "gt%d/uc/%s", gt_id,
>> expected_files_uc[j]);
>> >+				igt_assert(igt_debugfs_exists(fd, name,
>> O_RDONLY));
>> >+				igt_debugfs_dump(fd, name);
>> >+			}
>> >+		}
>> >+	}
>> >
>> > 	sprintf(name, "/gt%d", gt_id);
>> > 	validate_entries(fd, name, expected_files,
>> >ARRAY_SIZE(expected_files));
>> >--
>> >2.34.1
>> >
