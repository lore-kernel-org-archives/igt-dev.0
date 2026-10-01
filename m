Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B70CA5FCB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 11:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3687C10E21A;
	Thu,  1 Oct 2026 11:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hl4NjtRa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BC210E029
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 11:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790853263; x=1822389263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YUIzOv4x0uqOqS0lEUlv9iKFz7J15zAUpQ5bvF2eFTU=;
 b=hl4NjtRaBW9dQtO9bK4x9UiQ+ANxD+aj2wRLL/4ldL80DsuQib28bvy3
 Pd/E/T3J7eXkrQx6uvF29KC0eW9D72NsYTJmb7qFgUUTsahUullz3wcS4
 EQ3frHbSyOIJ/C04goZ1Rv+sLKXA3pgCNFTWbtCgaAuwCTEDzIXeBI7B3
 O5pBSSbNqkfqZr2QPNh2lMeHQPcResP1al9MFANrt3p8NTnNdNnD9jZxB
 RUa8I5fQTYH1W2uuQ8UHCT0tizfFc/xENEB+WdxG5SNY1ipdzvjjEaFHv
 ZUPbH1zL3PKmrxx0ZZeP6YsM1tv2J103GWOK3M6S3xGJqwvD+HWM7OfNG g==;
X-CSE-ConnectionGUID: yLJ1YFTZQ0Cybzz9dc+LRg==
X-CSE-MsgGUID: Pyi6g9FBQtSjaPZEw3MfGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="117136251"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="117136251"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:23 -0700
X-CSE-ConnectionGUID: IDABVLCgQgqsgcxjQbSAuQ==
X-CSE-MsgGUID: Wpq+FfriQc+eRUp7WVsI8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275508932"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:14:22 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DN3QeCB8LGvEYZfMKdisKYouJDmxLoxHLzcdtKZFzGLSA8jgQ3jvLTZeAJGNwjG0ycDMjigwBu7f8PBDQJjPi9TQ/ge7ZNGHwjNTo7U+ceJ907UdGIrrw1TeHOWNPpgx2xEBcss7ne8jl4egn4fX+d5LRPWv0rkd/qTMeCNQwaaQbRLTFgSu6iLmUBRY+dl3qlxkxY+GJ9ijyl/iMGKtT4NYYV8vh/OI0xI/KtKfVqXIJMCJUY5egEK+Xu7U4lEoKq2XyyvP0hw2J+7DWXyJ4n9CkPdEIswgQOqZwGrjGIOuWDZj3nutSKJ0ne0qTe+f6PtvQLqCraMUZTEhMmrrWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arsOA+INh0SF4fPB/JZHy8lUOiuRdLBsfxeYCEFtB7E=;
 b=uzLHq40nccmlRGDEgQLdeZrVoeauWdiYvaXR4O/OD6ag/A6uW5uPgNbyc5Pw0emTAy/vAVErR7fjjli98s3biMZxypSXeslHkF7NIiZibGPPxBOgfEiofUMp8xJaDi46dGchXfyLj8YE9rIqVTO0zCLgmr8osYc/B66dKWHdlwX7p5jmRFiTXgC9PgS8/7DWXRtspOa1KpvUB46LeV+3LB6biEMeo6YeZWbe6UJ8RVzpvgCkZT1kfGpNFj/pvKY/yd0W4pXul6jWdqtHElZxTpzfkbjnbtnAoLDDT6bk40B7XUytP+9qMdwpLA8jC6AYCkjxuMBkTzQLAnpK355iKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 11:14:19 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 11:14:19 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 7/8] tools/gputop: integrate i915 and xe PMU engine
 monitoring
Date: Thu, 1 Oct 2026 13:14:00 +0200
Message-ID: <08e2e0389dc29de1dbc24b7d1cb268b33391c891.1790853076.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790853076.git.sebastian.brzezinka@intel.com>
References: <cover.1790853076.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d022fa-5292-457f-65dc-08df1fad231a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pYRa8lmPC7P6w0K/H7+dFVjd6DfgB0hpcb7GFJaLgtZU+SMTMEu7T4+isl+nJHlY087n+NuGtmPmeCHQ6M+9kbxxLZhB0es9Ne8gY34xSTjIpY4jOntgY98Avsn5a7SG/kn1F1J1BODY92poMi7AMsvKiVumVvKZxRxcvHHRYKqb0OgJiU/7ynwiqA9+133Ub6fHfZyYJ39zBQKAV2R682yBnsYIiPB5aWbANNPGV9LtsSTesYMVkibNKt+7NGeO1fRnkzhphedV2KwfatQvWAyP0wyGTSE2eEr9JwZZj65FuqcQBjyKX9RNzC37Jqg4vVpLrwsjq2boJInqXOWGfuhsa9diI8BumE1UrZ+XZtItqdHUApivlpSNU8e5IZwBEUs3RvEGGhTxZ2LN1TYF69aRU9HHUljF+u6lnyx2rsfAw2CMiHzRe1KRVicKrio4ZT5BEHAADPZj0KTFyZZ0GP0OJGKRzwLdqfm7puXJ8cYPQPCeel46XAIkf72DR015sw8xt/ALTMjj/1arTd0g61uuAo9nNKXqsQHynnU3N3zA2rsmmHQkMXW6Bke2VbAZcTwc84B94UL3OLi4kGMqqUUW2da4TpWbzTF40Lw0V/k3AKZgoAHZ93Nth8fJeXNp2Kq54noHMcgJRzkpREdPBSrH8HCnf8EVgI2KmokAEAc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3RxWWxhNGdySXdTOXVEeitsY3lNVExoOXlCTEFMaDNYbEs4b0xxa1ZoYVc2?=
 =?utf-8?B?aENZa3JxS0V4UzVPNktwRVBzS3hBWmpSNFFVY3Bnb01LOXM4QWVoS1h4WXpJ?=
 =?utf-8?B?WkIrK1FPZzVtdnFoU092YVNSQW84Q2Jaa3RxSkJUNWY3TWdMb21GaENlT2lm?=
 =?utf-8?B?bmpSbkFGYnlYT1gxbDFJSC9KNmRwSE9INFhyajFtWlIwcENQRk9OY0U4WDRY?=
 =?utf-8?B?MitoejU3UzNIU0FacTg2Ni91MW0rUUZ4VFZSYjlINEhzS0FNZzhzdGhlb2pl?=
 =?utf-8?B?MHVHUEYyNE5nNktqKzVwd1ltanVFVE52cnh6TWdiRmZGaTVla2xCM2t2bDR3?=
 =?utf-8?B?L0xTbGxDd3NzZjZ1cnk3cGEyZXY4eWQyMHVHSkxGd1EyV3FlQnNKOCtBaFpt?=
 =?utf-8?B?MzhSRXo4R014dTVIaWk3cUhmTGJET2tydEhGTEhURlJHeEhPa1p5QUFXR1pD?=
 =?utf-8?B?SjNUbkMxUmdrN3VxaTFlb0MyS25rUGhiZkxGWnRnQ1U4Z2ZrMEZQVTRSeG1l?=
 =?utf-8?B?MDlrNENDVW5wbnZoZW9PZTdZNGdoaE9kcWRRVUxQalROUnZjaG90VUxJUUxW?=
 =?utf-8?B?eDNJOHJRZEF0clNJOVJacEV3SHMranJIbHV5TitpcW12WFBIL2NLd1lYRXRa?=
 =?utf-8?B?K3FnTloxNEFCUjVVSU4xeEswNW15OGk2VTlyMHF3RlVyd0VCdUNtaUNhTTQr?=
 =?utf-8?B?RmNGMEhVSFp4OWEvZ0lza1lrZTM5b2J5dm5CKzdxZzhiS0pzK1BwaURRMzF5?=
 =?utf-8?B?VE5QUms0RG1FbGNBMWYvanR4QUUxK3VTZmtCZmo2Uzc1N0pESHF6dUc5OHYy?=
 =?utf-8?B?ZFFkcThhaUVvcklIMTlNdFhZNllFUnNEaVZvWnk3RDJnOE5jYjhrbkZnWG1m?=
 =?utf-8?B?UDhPY1lrbHJXd3FnTHBJbWI5OXN5c3NaNFlUWG1tSHhEM0NOcHc5NlRWTVl1?=
 =?utf-8?B?RVBNOFhkeGJyRnZ3MUhyMlI4RGtQSDk0bzhCMjFvNUJleHd4RWRHd2NsMWlq?=
 =?utf-8?B?TXRvdEhDZnBqMVZLTUNaUjkzTU9teVU2OTNCejNzWUhuLzhmVllPdnMyQ2hj?=
 =?utf-8?B?clovMnk1WDRzbkY3QkJ0TDJBV0kydGcyaG5XcUlyakpvNU90aldBQXV4RFY1?=
 =?utf-8?B?QlRndDlFb0l0Y09mRnVJV244VXgxOTVqNXRrRWQ0VktHK2FSVm1BR2xXajMz?=
 =?utf-8?B?ODczN1JvclJURXNsWTdPZ0NuZlZVOFBYWGZwRDhjS2dUbG9RQ1M5UjZXME01?=
 =?utf-8?B?V1JTRVc5NlRsRXN0d0hIVGxTbnpPMHhneDd0d3lQY1NHajdkMVFtRmdVZGQw?=
 =?utf-8?B?bjJGRmw3QmZ3Zk9iWk95a0Z5ck81dXFONVlIZHoxNE9JYno2SEJlcmZaaWlr?=
 =?utf-8?B?VEV6MlpDZzhxYnFTN2J0NUlaSDUzUDZ2NzBTMFlkMnJpVWRRalZJWHRpT0Vp?=
 =?utf-8?B?b1FjTVVJby8zaVNDdy95M1JJc0laQmtibnVhcE1kL1VjeFN5WXE4ZXFqV21O?=
 =?utf-8?B?cDEyZ2wydE4xMGxwdithc2NZdXBsWVhObWovRDZ4ZmtETDNxOUVqUFlDY0pV?=
 =?utf-8?B?STJHZWdMMkZnWXB6U1lCNnFLTTd4S25USEtBdExENTRTeVUvRmRWRDFJSkVx?=
 =?utf-8?B?TGZNcUtFLzFXa1hpMHBVa0VRaFh3N3VLZkRJNktxeExtMk5VOEludVBaVDE5?=
 =?utf-8?B?Y0JTem43SEhPb01EZ3UrMVEwZnNkbjNDNXZ5WlI4RU1LcGIzUVFodFZLTm9p?=
 =?utf-8?B?bkRHY2NGK0E0MmR6aFpWcUkvV1lsdHdpZWVZNDJ6U1poa1N6UDBQLzNnRTdz?=
 =?utf-8?B?QldlMjRTb0NWSjFNTmZxRktNL1FYdE5ST2VWY1RYY2VFRFg1bnVvSWRkREJH?=
 =?utf-8?B?cTlyMVJhdllic1RGNU5BOVVXMTV1OU5yZzRGajNxaDRmOFE4alBPa0hQZUJy?=
 =?utf-8?B?OXVQY3I3Wkx2ZGVpZGFHcGthUlI3MnFTaEZFTkxnR3F3dldIcHRQdzRTVDZv?=
 =?utf-8?B?N1NwRXF4WmtFcUs2S1lveHZrK1VJaTRVMFVaS0hVNDhqSUlUTkJWNEVMdHQ0?=
 =?utf-8?B?MUxlenlKVmVoTXNwRTk5UkYzWDBCeFBxQUZFcXREeFFpd05FZytYT1ZKclpT?=
 =?utf-8?B?OThxOENocjBXTWs1aFd4alYrb01PVmdCQUpEUVZteTNqd1NOR3gvazdqWjBG?=
 =?utf-8?B?aWh6eVBZV3IyM0NLNWRkUnI2Sms4c0U1OGZ3SFhrVCtjdWxQcHhzOGprZGR1?=
 =?utf-8?B?OGUyRCtSZStqL3lpbzNlUXp3VVNPbXYrWUwweExMRUtadTFpWFp1RXRwS0R0?=
 =?utf-8?B?YlZHa05WZEFkbCtVZ05hYXAxR09rUkhSWHVrYzZ0V3MvN1NXV21NTjhrR1BY?=
 =?utf-8?Q?QbGU11o6F+f8l4+w=3D?=
X-Exchange-RoutingPolicyChecked: M8ycVZgGJcNSkbM0aGvfpbX9h08kx7JYaHlR4s3+pe1wWDYKNEhXukL2zu3d7yf9d+2YJuWJylukjXBbpUwkZELFVRUbbccd9PF2YOCKzrbEQHY4Brbkx/1KzyFasengJHxKkXIAKVLwSurjf4RzmRuzd+4czqDmv2s8Mu/43szMe24KzL5iwyJWAhzgKXttvpvQvoAFHExLp/rhGKkDva009u8r9v1lJ9VNasiv6j3nbYAa5IqsYwB2WDbfpO4wLn9LXmrZ7XCouhT65Y/DCSHz05sYOz+XCQ6nLzeVHLitYLcz809XYxEQAHA+rvDT0iO+yY6bJprIt8ZLgVGkxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d022fa-5292-457f-65dc-08df1fad231a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 11:14:19.6640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVPNlD/M5nBZw0yA+Sijx3aSjV476dBH+Ts0NBTwJmmEpG7Tve768WB0/BlIxVKgJVc5OuoQo7aXobyFHYa5N/PDTmcROhe8UhAjGZohvmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
X-OriginatorOrg: intel.com
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

Wire the i915 and xe PMU backends into the main gputop display loop.
Rename intel_driver_type/is_intel_device to gputop_driver_type/
gputop_is_intel_device to avoid symbol conflicts with drmtest.h, and
drop the local print_percentage_bar(), n_spaces(), bars[], ARRAY_SIZE
and ANSI_HEADER/ANSI_RESET now that utils.c/utils.h provide them.

Add per-driver device_operations dispatch tables (i915_ops,
xe_ops) and pmu_devices_init(), which discovers devices via
igt_device_card_match_all() and initializes each one. A failed
per-card allocation is now reported via stderr instead of being
silently skipped, matching the diagnostics already used for engine
and PMU init failures. main() seeds an initial PMU sample before the
display loop, samples and prints engine busyness each iteration, and
cleans up PMU resources on exit.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/gputop.c | 222 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 164 insertions(+), 58 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 0ed5af456..e49e31641 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -30,59 +30,21 @@
 #include "igt_drm_clients.h"
 #include "igt_drm_fdinfo.h"
 #include "igt_profiling.h"
+#include "igt_device_scan.h"
+#include "gputop/i915_gputop.h"
+#include "gputop/xe_gputop.h"
 
 enum utilization_type {
 	UTILIZATION_TYPE_ENGINE_TIME,
 	UTILIZATION_TYPE_TOTAL_CYCLES,
 };
 
-enum intel_driver_type {
-	INTEL_DRIVER_I915,
-	INTEL_DRIVER_XE,
-	INTEL_DRIVER_UNKNOWN,
+enum gputop_driver_type {
+	GPUTOP_DRIVER_I915,
+	GPUTOP_DRIVER_XE,
+	GPUTOP_DRIVER_UNKNOWN,
 };
 
-#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
-
-static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
-
-#define ANSI_HEADER "\033[7m"
-#define ANSI_RESET "\033[0m"
-
-static void n_spaces(const unsigned int n)
-{
-	unsigned int i;
-
-	for (i = 0; i < n; i++)
-		putchar(' ');
-}
-
-static void print_percentage_bar(double percent, int max_len)
-{
-	int bar_len, i, len = max_len - 1;
-	const int w = 8;
-
-	len -= printf("|%5.1f%% ", percent);
-
-	/* no space left for bars, do what we can */
-	if (len < 0)
-		len = 0;
-
-	bar_len = ceil(w * percent * len / 100.0);
-	if (bar_len > w * len)
-		bar_len = w * len;
-
-	for (i = bar_len; i >= w; i -= w)
-		printf("%s", bars[w]);
-	if (i)
-		printf("%s", bars[i]);
-
-	len -= (bar_len + (w - 1)) / w;
-	n_spaces(len);
-
-	putchar('|');
-}
-
 /* Get the correct sysfs prefix based on DRM minor number */
 static const char *get_sysfs_drm_path(unsigned int drm_minor)
 {
@@ -116,25 +78,25 @@ static bool is_bound(unsigned int drm_minor, const char *driver_name)
 	return strcmp(driver, driver_name) == 0;
 }
 
-/* Detect if this is an Intel device (i915 or Xe) */
-static bool is_intel_device(unsigned int drm_minor)
+/* Detect if this is an Intel device (i915 or Xe) by sysfs driver link */
+static bool gputop_is_intel_device(unsigned int drm_minor)
 {
 	return is_bound(drm_minor, "i915") || is_bound(drm_minor, "xe");
 }
 
 /* Detect Intel driver variant */
-static enum intel_driver_type detect_intel_driver(unsigned int drm_minor)
+static enum gputop_driver_type detect_intel_driver(unsigned int drm_minor)
 {
 	if (is_bound(drm_minor, "xe"))
-		return INTEL_DRIVER_XE;
+		return GPUTOP_DRIVER_XE;
 	else if (is_bound(drm_minor, "i915"))
-		return INTEL_DRIVER_I915;
+		return GPUTOP_DRIVER_I915;
 
-	return INTEL_DRIVER_UNKNOWN;
+	return GPUTOP_DRIVER_UNKNOWN;
 }
 
 /* Count the number of GTs by checking which gt* directories exist */
-static int get_num_gts(unsigned int drm_minor, enum intel_driver_type driver_type)
+static int get_num_gts(unsigned int drm_minor, enum gputop_driver_type driver_type)
 {
 	char path[256];
 	struct stat st;
@@ -142,7 +104,7 @@ static int get_num_gts(unsigned int drm_minor, enum intel_driver_type driver_typ
 
 	/* Check for gt0, gt1, gt2, etc. up to a reasonable maximum */
 	for (int i = 0; i < 8; i++) {
-		if (driver_type == INTEL_DRIVER_XE)
+		if (driver_type == GPUTOP_DRIVER_XE)
 			/* For Xe, all GTs are under tile0 */
 			snprintf(path, sizeof(path), "%s%u/device/tile0/gt%d",
 				 get_sysfs_drm_path(drm_minor), drm_minor, i);
@@ -185,12 +147,12 @@ static char *get_intel_frequencies(unsigned int drm_minor)
 	char gt_info[64];
 	int num_gts;
 	int gt;
-	enum intel_driver_type driver_type;
+	enum gputop_driver_type driver_type;
 	bool first = true;
 
 	/* Detect Intel driver variant */
 	driver_type = detect_intel_driver(drm_minor);
-	if (driver_type == INTEL_DRIVER_UNKNOWN)
+	if (driver_type == GPUTOP_DRIVER_UNKNOWN)
 		return NULL;
 
 	/* Get GT count from sysfs */
@@ -205,7 +167,7 @@ static char *get_intel_frequencies(unsigned int drm_minor)
 		bool has_cur = false, has_act = false;
 
 		/* Read requested frequency */
-		if (driver_type == INTEL_DRIVER_XE)
+		if (driver_type == GPUTOP_DRIVER_XE)
 			snprintf(freq_path, sizeof(freq_path),
 				 "%s%u/device/tile0/gt%d/freq0/cur_freq",
 				 get_sysfs_drm_path(drm_minor), drm_minor, gt);
@@ -217,7 +179,7 @@ static char *get_intel_frequencies(unsigned int drm_minor)
 		has_cur = read_freq_value(freq_path, &cur_freq);
 
 		/* Read actual frequency */
-		if (driver_type == INTEL_DRIVER_XE)
+		if (driver_type == GPUTOP_DRIVER_XE)
 			snprintf(freq_path, sizeof(freq_path),
 				 "%s%u/device/tile0/gt%d/freq0/act_freq",
 				 get_sysfs_drm_path(drm_minor), drm_minor, gt);
@@ -252,7 +214,7 @@ static char *get_intel_frequencies(unsigned int drm_minor)
 static char *get_frequencies(unsigned int drm_minor)
 {
 	/* Check for Intel devices (i915/Xe) */
-	if (is_intel_device(drm_minor))
+	if (gputop_is_intel_device(drm_minor))
 		return get_intel_frequencies(drm_minor);
 
 	return NULL;
@@ -523,6 +485,28 @@ static void clrscr(void)
 	printf("\033[H\033[J");
 }
 
+/* Check whether any DRM display/render device node exists at all. */
+static bool any_drm_device_present(void)
+{
+	struct dirent *dent;
+	bool found = false;
+	DIR *d;
+
+	d = opendir("/dev/dri");
+	if (!d)
+		return false;
+
+	while ((dent = readdir(d)) != NULL) {
+		if (!strncmp(dent->d_name, "card", 4)) {
+			found = true;
+			break;
+		}
+	}
+	closedir(d);
+
+	return found;
+}
+
 struct gputop_args {
 	long n_iter;
 	unsigned long delay_usec;
@@ -603,12 +587,76 @@ static void sigint_handler(int sig)
 	stop_top = true;
 }
 
+static const struct device_operations i915_ops = {
+	.gputop_init   = i915_gputop_init,
+	.init_engines  = i915_populate_engines,
+	.pmu_init      = i915_pmu_init,
+	.pmu_sample    = i915_pmu_sample,
+	.print_engines = i915_print_engines,
+	.clean_up      = i915_clean_up,
+};
+
+static const struct device_operations xe_ops = {
+	.gputop_init   = xe_gputop_init,
+	.init_engines  = xe_populate_engines,
+	.pmu_init      = xe_pmu_init,
+	.pmu_sample    = xe_pmu_sample,
+	.print_engines = xe_print_engines,
+	.clean_up      = xe_clean_up,
+};
+
+static void pmu_devices_init(struct gputop_driver *drv,
+			     const struct device_operations *ops,
+			     const char *filter, size_t instance_size)
+{
+	struct igt_device_card *cards;
+	int n;
+
+	n = igt_device_card_match_all(filter, &cards);
+	if (n <= 0)
+		return;
+
+	drv->instances = calloc(n, instance_size);
+	if (!drv->instances) {
+		free(cards);
+		return;
+	}
+
+	drv->len = n;
+
+	for (int i = 0; i < n; i++) {
+		struct igt_device_card *card = malloc(sizeof(*card));
+
+		if (!card) {
+			fprintf(stderr,
+				"gputop: failed to allocate card info for device %d\n",
+				i);
+			continue;
+		}
+
+		*card = cards[i];
+		ops->gputop_init(drv->instances, i, card);
+
+		if (!ops->init_engines(drv->instances, i)) {
+			fprintf(stderr, "gputop: failed to populate engines for device %d\n", i);
+			continue;
+		}
+
+		if (ops->pmu_init(drv->instances, i) < 0)
+			fprintf(stderr, "gputop: failed to init PMU for device %d\n", i);
+	}
+
+	drv->device_present = true;
+	free(cards);
+}
+
 int main(int argc, char **argv)
 {
 	struct gputop_args args;
 	unsigned int period_us;
 	struct igt_profiled_device *profiled_devices = NULL;
 	struct igt_drm_clients *clients = NULL;
+	struct gputop_driver i915_drv = {}, xe_drv = {};
 	int con_w = 80, con_h = 50;
 	int ret;
 	long n;
@@ -619,6 +667,11 @@ int main(int argc, char **argv)
 	if (!ret)
 		return EXIT_SUCCESS;
 
+	if (!any_drm_device_present()) {
+		fprintf(stderr, "gputop: no DRM device found\n");
+		return IGT_EXIT_SKIP;
+	}
+
 	n = args.n_iter;
 	period_us = args.delay_usec;
 
@@ -640,6 +693,28 @@ int main(int argc, char **argv)
 
 	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
 
+	/* Discover and initialise PMU-based per-engine monitoring. */
+	pmu_devices_init(&i915_drv, &i915_ops,
+			 "device:driver=i915,card=all",
+			 sizeof(struct i915_gputop));
+	pmu_devices_init(&xe_drv, &xe_ops,
+			 "device:driver=xe,card=all",
+			 sizeof(struct xe_gputop));
+
+	/* Seed initial PMU samples so the first display has valid deltas. */
+	for (int di = 0; di < i915_drv.len; di++) {
+		struct i915_gputop *s = (struct i915_gputop *)i915_drv.instances + di;
+
+		if (s->pmu_device_obj)
+			i915_ops.pmu_sample(i915_drv.instances, di);
+	}
+	for (int di = 0; di < xe_drv.len; di++) {
+		struct xe_gputop *s = (struct xe_gputop *)xe_drv.instances + di;
+
+		if (s->pmu_device_obj)
+			xe_ops.pmu_sample(xe_drv.instances, di);
+	}
+
 	while ((n != 0) && !stop_top) {
 		struct igt_drm_client *c, *prevc = NULL;
 		int i, engine_w = 0, lines = 0;
@@ -650,6 +725,28 @@ int main(int argc, char **argv)
 		update_console_size(&con_w, &con_h);
 		clrscr();
 
+		/* Sample and display PMU engine busyness per device. */
+		for (int di = 0; di < i915_drv.len && lines < con_h; di++) {
+			struct i915_gputop *s =
+				(struct i915_gputop *)i915_drv.instances + di;
+
+			if (!s->pmu_device_obj)
+				continue;
+			i915_ops.pmu_sample(i915_drv.instances, di);
+			lines = i915_ops.print_engines(i915_drv.instances, di,
+						       lines, con_w, con_h);
+		}
+		for (int di = 0; di < xe_drv.len && lines < con_h; di++) {
+			struct xe_gputop *s =
+				(struct xe_gputop *)xe_drv.instances + di;
+
+			if (!s->pmu_device_obj)
+				continue;
+			xe_ops.pmu_sample(xe_drv.instances, di);
+			lines = xe_ops.print_engines(xe_drv.instances, di,
+						     lines, con_w, con_h);
+		}
+
 		if (!clients->num_clients) {
 			const char *msg = " (No GPU clients yet. Start workload to see stats)";
 
@@ -682,6 +779,15 @@ int main(int argc, char **argv)
 
 	igt_drm_clients_free(clients);
 
+	if (i915_drv.device_present) {
+		i915_ops.clean_up(i915_drv.instances, i915_drv.len);
+		free(i915_drv.instances);
+	}
+	if (xe_drv.device_present) {
+		xe_ops.clean_up(xe_drv.instances, xe_drv.len);
+		free(xe_drv.instances);
+	}
+
 	if (profiled_devices != NULL) {
 		igt_devices_configure_profiling(profiled_devices, false);
 		igt_devices_free_profiling(profiled_devices);
-- 
2.55.0

