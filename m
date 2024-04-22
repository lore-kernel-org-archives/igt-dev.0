Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CED0C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 10:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BB51129A2;
	Mon, 22 Apr 2024 10:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1Kh/JUc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C1B1129A2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 10:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713782470; x=1745318470;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=04JW8UezFN7/rPfYhqOcpunObf4onf8caQjaPMwKKoE=;
 b=Y1Kh/JUcqQRkaKFn5OwgyQo6sHDqJLnqbqwNJL3lRMo7m2AGEDkXEDea
 9796jiOrHe5bNQLw8Qg3ZGsPdj+4mIrXB0heV1U3h74o8AcYMhcPlhT2C
 u/kN5xbAUbAeDxqhfM44hVVqpcnLdg7RuH2njS1w4fGZRwRJroovwSbKD
 /jg3cfZuYuaVu50yW8WW03qnxWJ49La1S/Yu+LM/iBGjTxkU0E94P8WXM
 D7kfiaZy2B4gk4sx59tsBrdOSjLcRf1I2SBwjSo8Sbses0WdHoxHRJCMA
 7dxbg/bGDh9yvTgOJDTAfhPVircViREVnmJPN9pQa+V6gu1NZaYTr/lZ6 Q==;
X-CSE-ConnectionGUID: 2bUGmfeQTfOOL35UrSwvjA==
X-CSE-MsgGUID: Tv2RLOyMSa+GKuW9bnKI5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="19918522"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="19918522"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 03:41:09 -0700
X-CSE-ConnectionGUID: 30Thm8tfRq6CzyBKnkzdSw==
X-CSE-MsgGUID: mznZD9PFTM6xFqtOHuGujw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24428487"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 03:41:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 03:41:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 03:41:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 03:41:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 03:41:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/bXU2tYfZ25tk6qMIn7oZ/ZoVh9e7LvGjZOm8xdVAVZtlOTJ37Ilj+xEh2ConP53UR45vYpewPd7KYTuQQyAG1/0T0haemvoC/9kY13cBmgLEgvo/jNjSleQZzuhfyhh/XsK9cnHMpOQ0l0Ick6FH7w0AbshJ4Y3nnmuqmddS/NOg7TcoQczbmAUylu82kBpAO8eqO7rkwFsd2H/ElFDVHVUYzKILw17hgzQnSWPKxLoU05zv+WDO50UovAXR1n+g8x1gTni3HjJskZuvGOgEsldgb5gran3/FQ+YZ0m4fHaDm4AuXEmIRI0A1ySl0Irz5u4gXaTbbeoah8/I6QPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCKiBwn2QayCB7dhSB4owi+oE5rLR9pWQZ2zsLHb5HA=;
 b=PZ1IdEiNjUKDnYN7GhoiX0q2BCVnWomaftc7BVIzQW13Aj46f9WRqYpJg4++D+1/D7V3wyvGzFDnJ23soCnPAZPh1GFzvZLJLYxyrW44Pm2XBP4WdfGn3sqa9GAhGcgyCwmM4U+Uhz0GiareozfmXya5HQ6que3VID+4bvGXVO7FlR4h0Ks2IEsphTtnDe04x+hZppoo4bDJfn1Uk3zDgA9KJTb/pkJY+zGraqcqEGwRVcGSxteIc5eRO3oZYFfe4DYYKk7SkW+KlqXCzl1HxZF4Pr/PT3JzMfz5IYfUNlZpxgnqrScPYx56Lv5r1yHoXCHzpcEVlbk126Jr5KbXOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH7PR11MB7594.namprd11.prod.outlook.com (2603:10b6:510:268::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 10:41:05 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 10:41:05 +0000
Message-ID: <b31cc252-d5cf-453d-a3ae-a2236d784259@intel.com>
Date: Mon, 22 Apr 2024 16:10:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/7] tests/intel/kms_big_joiner: add missing commit
 after reset
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Ankit
 Nautiyal" <ankit.k.nautiyal@intel.com>
References: <20240422053454.2523989-1-kunal1.joshi@intel.com>
 <20240422053454.2523989-4-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240422053454.2523989-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::7) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH7PR11MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: 27373267-ba6c-4b12-6a97-08dc62b8b663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWJtNEdvTzdWUnd2aWd2eXdESkN5VTl4cWxVQTVtbEhkTCtFZkpEanJZT0I4?=
 =?utf-8?B?ZDlydHJtTVkrS0JrRmx4bk90MU5PMm1nOHc1SnIvaVFxcFp6ajhYUEZtVVBI?=
 =?utf-8?B?S3J0MDFqQThlTE9OMEhJbGV2a1J5MWcveHJMZVZrUFV4UUhDOVBTczBmbzN2?=
 =?utf-8?B?aituTXhweTUrUHI5c3FBYzJqR21mYkVlTU1nWDJKZ1FEc3J2dzFTeFFNQkNi?=
 =?utf-8?B?eWdWVU14NGtHQU1SNW10cVgwZ0NxbGk1cG1ld0pzakJUeUR1d2tKK29oMFpP?=
 =?utf-8?B?UTJUWEZNU0hMUDIxRnhQK3FtUUFVeWQ4ejZzcGh6eFlDQjdNZnkxdTlVZER0?=
 =?utf-8?B?eHNnaXN4Qzg5UjZDMzk4c1pXaFZ4aTVhSFRrcndITy9PYVBpSGRaOVA4TWFE?=
 =?utf-8?B?eEswNW1MSjFxZldKYUV0elFIc0oyOHA4a1FXVlhuWXR2ampQUTROVm1PbmlZ?=
 =?utf-8?B?RFUzNUl2WGtmbEtTcmFlTmRlTDZPdUhTeE02Ukk4RE52M0xicFB3RWJCeHk4?=
 =?utf-8?B?Qld5L3lLRHlqQ3Z4QWVJTHhjWmk5SnB5Z0ZBNUdjSUZRRUhObEFPOXRzUGNW?=
 =?utf-8?B?TWRyQys4Rkg3MGhmeGI3UndPL1FWOVVHeFpxRDRBZjdzcSsvZ2R6QVl2aVBQ?=
 =?utf-8?B?b09DUGRNa2xFOVk5bDZ3TnUxdEplWXk3OWwrZUlxekQrbWQ1MkpkRHhvNFMv?=
 =?utf-8?B?SDVsdVhQeExZNHJuSTJVQjJuWStzbGFWczlIWExyQnZrTDl2VDh3RVFWbUlz?=
 =?utf-8?B?c0tlNkh4WXIrT3pHeDIrVXJpL01oQ2lmREREOWg3Szd5dit4eVJYUWQ3Wnkx?=
 =?utf-8?B?cS9NVENWV3NDUnpNLzVBT3I4MUVsQ0NaRFRIQzNvaTFWd1FTb1VMNi9WTHEr?=
 =?utf-8?B?cDRjNkxmaGZUc25mMHZJbHFIdkpuNmxtWWNXSHNOcGNpTGM3SUt5VjZVSUpv?=
 =?utf-8?B?VitOM2dNaGpEZVpIUSsvUlJNMlFQT2Z4UTNHcW94bUY2dzk2SkxyclhIWTRD?=
 =?utf-8?B?a082K21GVXRIZlZLQ2dETGxBZXlKd2R6bFM5M09hMEl5dE5nQ2NmRW84VTNx?=
 =?utf-8?B?TDdrdTVwUWZqdmNpcXpMM1VRaUlETElqY21ERmxiRU9kRjEwSHhpV2g3N2R6?=
 =?utf-8?B?ZzVnZGRmNGlHcGdZRDQrUUN2SURUSG1YYmJPVnZ1V2g4aVlPTEJqWk9GUkNF?=
 =?utf-8?B?ODBNeTFjckZiMGd2R1JYclZWd3B6cXhmUWxTTnhvWjN1VUZqWWMwUnQ2R29S?=
 =?utf-8?B?TnRJNm1raUkzMERoem55Ynk2djdKN08ydC8xMkFzWkxhSVp0OWdpb29qa0Ur?=
 =?utf-8?B?YjNEWW8yY0QrZGhkbmFnNmw5aG1PUS9DRGsvVWFqdTkydFozQmsrdDROVFJD?=
 =?utf-8?B?L1hUYUVmNmc0UStwb3ZoZTh6K1h4K0xHYVZSRGhEYnVUQXdqMmNiWkdrYXRm?=
 =?utf-8?B?aHZQTktGaUJoQkJVSlI2UXVDRVVVR1MxSWpNOU9GS2E2MkM2d2hlWU84U0ZY?=
 =?utf-8?B?dkVoY0NuaHBOTFFNN0VLbWx0ZXdKdERIaHZiUmVsWmxWRGI4SFFqdzRUcE96?=
 =?utf-8?B?UVFKVHRVUHViQi9QWGQ0NlpzV2VXUmxEUlNUZDk0ZFd3MEwwSENuNnQ1bEtY?=
 =?utf-8?B?NGZEcHRMeHNaOW8wY0FSbHZRN0pRMlUzTUJQUFV5U2d1OVJtakhDVmwyR3I3?=
 =?utf-8?B?bHNyZHdyMU45YytqZVhyMm9mcTI2RDM0dmIzV0t3RUFIUVAwaGlhUVN3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDRHWFFKQVlXeERHYXVsOWFGV3ZTUW5WSmphRHdIMmJjaG5kNy82bUJGUXg3?=
 =?utf-8?B?RGQxa2ttejlsMzQyUmNwYkRabEZrZWU2Mkh1VVQ5RDh3akdsTllRUy8wWFR1?=
 =?utf-8?B?dHhuWVpNa242NFM1L1VPMjUwSzE1bEJMbmFIVXdzRWhkVGxPSW9HdjBnZzdy?=
 =?utf-8?B?RmdMOEk2V2diYWxaaDNjbjlJV3ZTelRzTVhuNysrZHY0NWd6U2VYczlJNUtI?=
 =?utf-8?B?T0pJN0kxY3Fra2xYZ1FLTjZKYWxjaHJEL2JybTNINXlvZUNIdTMrbENlckNu?=
 =?utf-8?B?UlJCV3pjVnpDVnhVbWZ5V0xKZ2RmVlFKaDhuTzNhZnRtaWVHQlJYZklBczd6?=
 =?utf-8?B?OGFaY3dlb2NkeG9Ja3F1MDhTbzRQbXA2b3dwOE54bGpKWmhwVlpqWEJSdTZX?=
 =?utf-8?B?MjM1UWhESng3WDJwcXp4MlBhYStKSTlqZmRHNXZvWWJLN2wrR0Z2cDlpS1Bh?=
 =?utf-8?B?RkhWZWc4OG8yaXdEVUxDZCt1QWdSa0dFMkY4OVhRbzBCbGNTdlpRQ1lEUWpC?=
 =?utf-8?B?OE1Ga3E3eXRGMldFaE5NbGlWUTFPbm1PZ2E3YkhCVWJXUmVUSkFrbTd2NFhU?=
 =?utf-8?B?azF3UzFpUFpEQmhxOWFPMTMyb2dybTh3MXVXUVNVa3gvdWRIQjU4dVF5cDZy?=
 =?utf-8?B?MExsTlBpc1J5V2JYN3ppdU1CaG1MdXg4YzgwMXI5Yzh2YzMzZk9uVXBxdXpt?=
 =?utf-8?B?TU5HWmtpUjhIa2p3bTlwZllDbTkxdnd1VVlreit1Y0pXMlNWdHZTNDlPdzRi?=
 =?utf-8?B?TmdValplcHgyM1hEQVZ0MDVCV3A0OVNLUGxzcVM0Q09wdTdHQ21VdGJrYzRo?=
 =?utf-8?B?MXU2Z3NGMjI5S0F5ZmoxeFJUOXBSUEVPcGRpZW5OL1F0eDdPeVUyUnVkeEp3?=
 =?utf-8?B?UHVZTXNRTzRvWndRM0tlU0lRS3ZmdllIVzFkb2NvMW54VGFQSTRXK0VRTi8x?=
 =?utf-8?B?ek5qYUpBTEQweERscnVES1VYckIvdDI3UFpzSHdUVnRXeGJiWnRCanFmMElK?=
 =?utf-8?B?Q3FNWURGS1ROcGxqYkg4ajRXRzN2YkQvQURyQUFlK0RxdWxkM25PSThoODRx?=
 =?utf-8?B?NUZUZHlkclJBRUpkVHh1QkNpYTJITitraEdWSUMxNmp5YU1qTml4cDJaSUN0?=
 =?utf-8?B?b2l1aGk5TkVBT2szQ3ZEb0FnT0FSWWliU1BWNVMrcjgrbGRuYVJ3TTRycmVv?=
 =?utf-8?B?MjdFd2xaYzNicmRaQ1RVTWFLQXlmMm56ejlBZ2ZrZFpqcXpyQzczeWJRNW5h?=
 =?utf-8?B?ckU2NHZtVFp5WDh4UFNlSmxBTFh0aHJMR1lXMkI1VVBaK2U2U2JwNzIvY2lR?=
 =?utf-8?B?UWV1RThoRmtPdFZzQ1MwQWNIVFdQdGI4bVpkY0VxSXpQemF4d3Myb3RzeU5u?=
 =?utf-8?B?TVhJcnU1QUlkb0wwMkpGbTZLc3NNYitzMUpoQk9GSkRleFpBd1FLYXdnVDRN?=
 =?utf-8?B?STlJcjZPL2tPQ1BIaGc0THBNcy9vaVJTQUMvWnJ4YkZUZzdRUzdqSGRhZHQ4?=
 =?utf-8?B?ZkpnU1BnRGtiWjBFa29wbmVoRVB2T3RUT0wxbmZreXJIdmIxV3BWOTlrL2pn?=
 =?utf-8?B?dlJDOGJOMXNXS05vUEVoQWZVcUdLSEs1Sk5vQ1Q3eEJZcVlPNFlCZEpHQkhO?=
 =?utf-8?B?Qnp3SmFiamEwUEJJTjNmYlNoMGEyZTB2UnlZQXJjYlU3OTZMVzVOWWlNQUVQ?=
 =?utf-8?B?WXlENkZQTVA3L0w4eXZIVE5ONGhuckxPWWcyQjlWc0NxSmpMeUx3Uk9jS3hi?=
 =?utf-8?B?ZXRaK1ZPQ2s3TEVPRm1ZVGRMMUtZVldGYjVWcUdlTkNVa29rRzdPTXVkWUxj?=
 =?utf-8?B?SHBXb0h4YU9DSWo2UmhGanNVYUl4Q1VKYmVCb1VCMFZEeCtLL21sNDZWZGMz?=
 =?utf-8?B?OWs4WmFkTXJzZmlVcUhiRDliSGNRMUEwY2hqcFJyQkw4UmRJRlRUc1J1aE42?=
 =?utf-8?B?blZid2FSeGZ3QnJRSHN6RlVDQ25pU3F5UVJpdDRraW9rcjhGRktoV2RCMnpH?=
 =?utf-8?B?Zzd2MWVmTzJxZjVIblczaC9Qb3hCUC9hcUtFekVURlAwdVdza3QrNG9Xb3N2?=
 =?utf-8?B?TzV3YVptUzR2VENLRThhM29XM2g2RGtuRHd6MXBjVFBER2ZiNjlYN3NHSmRJ?=
 =?utf-8?B?TGtpYzZaSytFTTk0U09xWUc4c1VNQTBCcjFUQ1ZrT3hZSWQ3VHFBUHVweWVs?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27373267-ba6c-4b12-6a97-08dc62b8b663
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 10:41:05.4022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qr3G7yJowM1BtNjN74aRwkp7tutYbe6Kw71M4Y54g2bLVL+BtoNECl0sPK9wjccacLl4oDNKhotDu0IqB+W0e7M7N2PWWPSXaX1kG8CPqC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7594
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


On 22-04-2024 11:04 am, Kunal Joshi wrote:
> add missing commit after reset
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_big_joiner.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index 88923be6b..f325a9839 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -267,6 +267,7 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
>   
>   	for (i = 0; i < len; i++) {
>   		igt_display_reset(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

>   		output = outputs[i];
>   		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
>   		mode = igt_output_get_mode(output);
