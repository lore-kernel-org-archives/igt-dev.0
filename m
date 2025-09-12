Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9ECCAC582
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 13:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0225B10EC44;
	Fri, 12 Sep 2025 13:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUYxplLR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607A410EC43
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 13:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757683404; x=1789219404;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HFCaYDRhxTao5pYT3QGjhFx/mlohERRdfEKimSQ2oqQ=;
 b=RUYxplLR3DWuriGPKtFuTVfpLSo401BZpDvyMZyVvwL6O5RcKjr1815D
 hO9mUKE1b3pbVLKerGuD60ocjfOKGv/82ukzCvxalpW4XmNtLhN553zav
 ehauzvSQnCsOqArgM4330+wstdC4oaPk+TEnKL0MXs+jey3ixPufZejL3
 OADivwmaMdpXwJ1vGAmfTlIZI6fxqlUTiiESLLMQAYswzc4UMLJv1bMHr
 47WKUm+Ihi6dV9C0+p0LReztXqXcfONe5q6iNc9TrLocUg5xXFc4FgwUb
 oZ6Xp6TWagesK4rN27tBndX4wLePOBFLFK0sqM7OdL5oP0C8LOdScD2ZX g==;
X-CSE-ConnectionGUID: gkU0SA/9R/OotyM6+Rm8fw==
X-CSE-MsgGUID: A1dh1g0YS428HzbjuXK27g==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="71401262"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="71401262"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 06:23:24 -0700
X-CSE-ConnectionGUID: +5CU2CPlQuS4V35ze70nTQ==
X-CSE-MsgGUID: jfdxq79TRJuRvcKRTXswoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="179140416"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 06:23:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 06:23:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 06:23:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.74) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 06:23:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oy4/CO2dast9Oso3QxM8u+o5tvjEOYE9dH/ZHl5pmSC5doGZ2CfDJ04LaGsEpZP0MT8JSt5YUhpjYcIpaHTSMRQNuYAgNigWnV6igiDZ23tt8qRR9dIA9+RQBqapN5FJUQ/ZPEkPgHQ9Dp8I6vN/kr4HsB8nBOhb+YeMF+U0m46zrc8McQaFTyJg7YXYskRA7R6Wat6pnptSxJhop/dPuMAxz6ChQvmXeyZnlr5myDlJAOdGH5NevFT7cd/h77wxedTH94mJr4i8OvrkAWgH8UZoZP3UM9krdKbx2yIdKYYZU3KlhbYLOn/emYjO1ZtixLAE2XDloTEc2GzBzjGscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIL2lnKyeJ0997wePAbdxbZQiuYK4QSQFrzVCMhQRc0=;
 b=azm7KkhFLs4A2Cbu30Eay1XKonEq70RKDYpSYN7f2scqMPlVLIcwwtQswzAt1bf6YxgVeHXkb1jKMUFJRGMDptvh6d5mtaLkV3cQTX3uqgwIi1h9Jf+CPnPfTnFmKsYG1kaAZTz5GUfEXIdlW4SDeKtjSwar2MnotraAnTr+2Iea+483EL+31PG1kKBVGhzPEShGX/S1aGcZJEkE60D45gclCPULKBNfwbOhbs/0CGqQ/SyW2rMVEWuYc/kUDBcOvmG2SEl/7fTYXKjVb+UzlIIeMbTCku5lVhVhZzMFryev8Z81M73eRqpJQ7mOtpUXtT92uVsdSBaS90Th+f/B9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 13:23:20 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 13:23:20 +0000
Message-ID: <6d30e025-44d6-4e7c-8c7b-f890db71585c@intel.com>
Date: Fri, 12 Sep 2025 18:53:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] tests/intel/xe_exec_system_allocator: Add
 pat-index-madvise
To: <pravalika.gurram@intel.com>, <igt-dev@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>
References: <20250911124208.1159281-1-pravalika.gurram@intel.com>
 <20250911124208.1159281-3-pravalika.gurram@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20250911124208.1159281-3-pravalika.gurram@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::9) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|PH8PR11MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ee2727-83bb-441e-411a-08ddf1ff8a45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0c2U24xRTM3SEFKbHZOQ3JsODhvamJubi9xQ0RDRmE1UDFKVG01NlJwVFl2?=
 =?utf-8?B?S3l0VnBlYlpURzB4YU81Um9qbkNIYXZTOFpyeE45Kzk1RGZvR2dSZEUvTVdB?=
 =?utf-8?B?WDhuYk05aFFmMEg4RVZTd09RUHFhemo5OUVUa09YRjBBVWxoSGpRdDc2cjhB?=
 =?utf-8?B?SGs1bk1QZWdNclVYTW41Zm5IQy9aQ3kzL0lQSm13Qzd6L2NCL2pqOTFhZUQr?=
 =?utf-8?B?a1dCak5xcGpGVHgyWmlpS2JZbTFaTmR6bVRDcG5rYVB4L2hMaXVnOG5RaCtM?=
 =?utf-8?B?OFFmbUl6V01XcDBMUkRvVjlURTNTTmtpaGdwUzhnSlB0YTRPK1JUODgwYzF5?=
 =?utf-8?B?ZkpiRHZuOFhmRStKNjFyS3lscjNUNVpiend1aWdkVlRpbWtTYzRIZ2hQaDVm?=
 =?utf-8?B?RlNGZSt6dHF3RUM3a1I3VmR2ZUpzdEdCZ1d6Zlc4Z2k3NlNiYWpoNUxxTHpN?=
 =?utf-8?B?RjFBRy9BRjhuZHEwZVh1bmNDNlFQd1BaQ0N2NjlUK01oNW8wVmFSMER3V01J?=
 =?utf-8?B?WXpQOTN2Z2d2dTd0OVMzSm41SjE3R0hMZnBYOHIrWmRiT3U1WnhJKzZFQi9q?=
 =?utf-8?B?cnVNZ2Z1RmU1cDNjRVNJVENTdlhDeXhKd0VmVlozL2UybnNRd3pkL0E5VDdF?=
 =?utf-8?B?MmRrQ0xUYksvdzFwSnMvYzBiUHV1SVBmSmpESDdHNEZ6SzRGblpWNWZtSEtJ?=
 =?utf-8?B?dGEra2d4VEVyMS9RVnZMTVNRbkVxVGw4NzFkOTMwdDZPeWtEQVFXcmcrMVRk?=
 =?utf-8?B?R3g2NXJGcUUvTitLdGFQSE93aVJIcWp5d2NZZUNiUVR0SW1weVBCcjBMVWd3?=
 =?utf-8?B?c3NDeVYrZnhwYXR0UExlempGczNCSzQwNitqM1BSL1Q5dlFGNUhuQ3I2c3FZ?=
 =?utf-8?B?MzFXQ29EYjVhTGdEcmNSSlhKWGRBanJVc1Y2M0lhUTdYbVhPMHUzckFsbHNB?=
 =?utf-8?B?UHZHbnhwRFQza3Z5d3Z5VTZ1ejlvZThSbHVhL3F2ZUo4UWxpaDdYaG9rQzhS?=
 =?utf-8?B?UjAxSkVJQ0pUdkFDc2VJeWJWajZWdGpkSDlXeTYrTUt2Nmp2dlUySmlFZlhq?=
 =?utf-8?B?SmtkeVhVeURWYmtpa3JTanlJaUZSZ1lXbDNEUHVZWXZ0eml4K1B6dkdRVzl3?=
 =?utf-8?B?TDEwdWVtOW5tTTV2QVdIK2pDUGZoVldsUVNVSjNhTXcvMGlsZ2FuaEFyMjRU?=
 =?utf-8?B?Q2NJVExkaG9ubHZVMmpwRXZveUVyYjhkaUNJdUNFVlY0b3dCNit0MTZaQWhC?=
 =?utf-8?B?VXdzQmVWdlc0WmQ3MHdMdDc3eUV3QWxpcVJwNktjNUdUcWlUY2xodmxqK1ZM?=
 =?utf-8?B?L0VhUTJhY0k1TW8vZjBrOVBaYjAvVk5YVjVZWnNhd3RWUyt6NGs2SnJUKzdH?=
 =?utf-8?B?amwzT05weEVvSDBOOGN1ZmgwOGplVmhIT2VhNU01QTdhdG9nanZlNHBxYlAr?=
 =?utf-8?B?bS9TaDhxOURxNzJDcVRwdjR4TVVoVlQwQlc5ODZXOFZrRGRObGs4TU02MnJy?=
 =?utf-8?B?ank3ZHptZ3JYUExRY1QvRXh0by9JNlJaZUk3aWNwRDZjS09SNGJMSnZ4eDlG?=
 =?utf-8?B?RSttKzFLL0xxbWthdC9JQjBJcWxoWDlGV3FqWGlDb1BVVlBCQ3VhNWgzSzdh?=
 =?utf-8?B?UmFVMEZOck1qQVFWNmhCcFNWRGFxSlpFOWJTT1BrK0RaeGpGL1g2dGxURWNp?=
 =?utf-8?B?Uks3MURyc3FKSXJpZjE4YjQweTRIWXhYbWFRaHZndW9lU05YMHZzbXZSNGR1?=
 =?utf-8?B?dzEwdHJHTk4rUFVWSHlHdWxoeVUyelQ1K24xZUovVUg0OS9td1NTWURnOVZD?=
 =?utf-8?B?NzNkYWxTRjRGZ1ZMUjcwQlptdzJQK3ArMnBnUXRTeVE5bHU1SVlabWJ6MVQ1?=
 =?utf-8?B?cVBOREhmMHdZanMwN0dJWmhnMmlYMndMQkE2angxSTBST2s0K00rUGVhWWtK?=
 =?utf-8?Q?wm/rcsR5otw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWxSL0VTU3JXdlUrUmRncW14OXVUMHYxR2VIRmhBeWREZTNuYVhlNWJFQ1Jm?=
 =?utf-8?B?MlJxanFxakhMTVRnNXZVSmxIMlkrVU1Md2FQSGlUOGNweHlDU0R4aGVKbU4r?=
 =?utf-8?B?Y2NWeExQSXpPK0NXNEdwdVI1aklYNVNSWHNMdDBLSnVRS1hMRlU5bDRHRlZk?=
 =?utf-8?B?a0Y0NjBjNmU4SHdMM1hXYkljVUp5ME1WbkgxNHF2Q1N2ZWFMVjhBS1E3VUh1?=
 =?utf-8?B?ZnF6YnBZdk1aMUhOZGZhbTl0WWVXRlY2UXprMFpoZFFYRFptandBTkdzUitm?=
 =?utf-8?B?dzQzL2ZnSi9yUEQ0bGowU0FlY0xOWjdnL00yL3A4bHBOdER4NXJ4VlBqTzhy?=
 =?utf-8?B?QVlYRmltc0JVeTFWeERGOGN6Z2Y1SGp2Q2x4ZnVlaUNZMU1TRHFQNm1aSVps?=
 =?utf-8?B?TVNmVkJuSndIVGdnU2tVbzBQK0FxQ3VLU1hsN2hxVmoycEdlSGFveFg4K2kv?=
 =?utf-8?B?UUc3QWJBV09tOGt0b0VJbTVodUlvOEthVHFWMnFoYUtzbWN2ZGFRVm1RVnFL?=
 =?utf-8?B?aVQ4bmQrMzBIQi8zeEN2MkRVRHZKTU9KMlJWbjB1Sjh1VVpBM0kwSndGVVBU?=
 =?utf-8?B?Q2hEUExOVmF4bHNFMWhsS1ZObDJSUWNPQldTNnRQNXM2eXBQa0Jzak1BRmFB?=
 =?utf-8?B?Q2ZKSCs4bU5XOWhYcjFRbkNuanYwQ0xLVCtwVlZ0U1U5b01ZUVozVmpSUCtX?=
 =?utf-8?B?azBpaU5zbEcxT1UwUVBMU0RVRE1odkNnY1M3TitpNlhPcnF1clVhV2dBRGNk?=
 =?utf-8?B?NG1Od0wwT0YwVFZFano2UGV4RHN5bi96VW1pbmZFMSt4Ny8vM0wvOTNEV0FO?=
 =?utf-8?B?bzBiaTI1Z2xRRVFuSzE2am5FZERmeXdwcjBlUk9IMlMvMTBZSy9IKzArK1JG?=
 =?utf-8?B?bThXUG1zV1lWMjhjS3QxeUcrT3I2d0RBWkRDa0VFY0k3R2lybG44VkJFV3J4?=
 =?utf-8?B?eWFzamlHWnFXUjAyVk53RUdaR2QwczYrQnlGMVFrcUt3OXJva1phNkRQUmJ3?=
 =?utf-8?B?WkwzTXZ4NVJiUlgwZDM3VkF2NlJSa0cyRjVXbXNvb0NUd2Y3Q1cyVmZUQ2Vh?=
 =?utf-8?B?L2laMFVBSEZvckRMSDZBRmZKT1VsTUh1b1paZGI3a1o3MlNwVXZ2dHdISHk0?=
 =?utf-8?B?SUc1aWdYSFZhSGZQTGFqMzVkMW43UERzejNCd2hqU1NuQWxJWEQ2QTdzcDA3?=
 =?utf-8?B?SEc0U2twQjhOblNsdFpXeXAveGp1UDJJblZvL0x0c0p6MGlwWW8yUUNJNVd3?=
 =?utf-8?B?VmJnM3FiRVJEeG0rZEMzMXlxaUVTSkE0Z2hxWDM3d29KT0RrRUNtZzQzbVRU?=
 =?utf-8?B?RTkvYWZNa1lJa2JnMloxeDg5V2dxK2hQdXppY1o4YmFtWFhycXJGVVBLYVh3?=
 =?utf-8?B?V2pUWHFFcnpxbCtNbHpBbDFYOFBLc05nd3M2MmxsV3Fobk5MT3RtNWN3QW1Q?=
 =?utf-8?B?VE5OSFRudENsYUtlVUN0NzN1UHQyUS9oZ08vcmlRdUlLUFljWCtRUXhoTWlI?=
 =?utf-8?B?YXlWYVRFWDhvb0NTK0M0dmVhZ3NPbUI3bTVVbkRGUGVReS83Tm1lNHd1ZTVI?=
 =?utf-8?B?OU9rZzZFWXYwS2laT2NaZkJKcFZMSWl3NXlEMXRQckxnYUVVY1p4Ynl4NjBo?=
 =?utf-8?B?U0FxRG9MdHhhcEVidTVBNHFGY2VscmdQNUJmR2JtQ2pGSy9BYTZvS0N0L1gy?=
 =?utf-8?B?Znc3YkcybTYrOXMvV25ZYitPc3doeWlob2x1Nytrd0NzMFFTK0xTYnZSMmhk?=
 =?utf-8?B?REF6Z3RnZVBwTS9QMTJRR0E1c0xFOHdkTFU5WFdCMkgxWW9ZeTRPb21jTzly?=
 =?utf-8?B?TmhXUnlxSUtoK3Y0WDg4NWU3aytPTzRtalhxT0w1R3ZWL1RJUTBJNGxuWlpE?=
 =?utf-8?B?ZWZ6cXBRcTB3bXRIZmFWSlhyLzI5dVg3V1JHOGJRc3lKdFdUM1hPK3RHcjlL?=
 =?utf-8?B?SjhiaDgzcGs0NWRnUmtLQWRYMnlxazZ3TG9IK2dHVlNZWDJQcXBBN2RZQUhU?=
 =?utf-8?B?ZUJ4cExBejg2VkVFSDEzMGNYbWx6RG1SQnRLOGMrRVREUUFoQUgxZEVTNWVD?=
 =?utf-8?B?cGNwQnA1WlpCZGM5djZqNStBMXFyUWJ1Ui9Bam9oTkFEL1BmdE1Ld251cTlK?=
 =?utf-8?B?NlNFQXV3cnE2eGZGalZWU2lweUxPSlNlWkF4djlQbzl4ZjJlK3FKN1laaWRs?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ee2727-83bb-441e-411a-08ddf1ff8a45
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 13:23:20.0157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jo1PjEOEaCvp6q4YoALQ4dfGvzSI/h6tuXSlxnrv7pf0FxGuJ5Z8hAfaTDup74F3a+p+/afF6oncicdi/iGaXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
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


On 9/11/2025 6:12 PM, pravalika.gurram@intel.com wrote:
> From: Pravalika Gurram <pravalika.gurram@intel.com>
>
> Add pat-index-madvise test to verify setting different
> pat_index values for multiple VMAs. This test uses
> madvise to set various pat_index values and
> verifies that different PAT values can be assigned to multiple VMAs as expected.
>
> v2:
>    - Remove macro which is not needed and alignment (Nishit)
>    - use existing struct by adding new member
>    - Remove num_ranges to NULL assignment
> v3:
>    - checkpatch.pl (Nishit)
>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>   lib/xe/xe_ioctl.c                      |  29 ++--
>   lib/xe/xe_ioctl.h                      |   4 +-
>   tests/intel/xe_exec_system_allocator.c | 190 +++++++++++++++++++++----
>   3 files changed, 182 insertions(+), 41 deletions(-)
>
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 62e9fe9eb..090180f37 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -79,20 +79,23 @@ int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
>   }
>   
>   /**
> - * xe_vm_print_mem_attr_values_in_range:
> + * xe_vm_get_mem_attr_values_in_range:
>    * @fd: xe device fd
>    * @vm: vm_id of the virtual range
>    * @start: start of the virtual address range
>    * @range: size of the virtual address range
> + * @num_ranges: number of vma ranges
>    *
>    * Calls QUERY_MEM_RANGES_ATTRS ioctl to get memory attributes for different
> - * memory ranges from KMD. prints memory attributes as returned by KMD for
> + * memory ranges from KMD. return memory attributes as returned by KMD for
>    * atomic, prefrred loc and pat index types.
>    *
> - * Returns 0 for success or error for failure
> + * Returns struct drm_xe_mem_range_attr for success or error for failure
>    */
>   
> -int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range)
> +struct drm_xe_mem_range_attr
> +*xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start,
> +				    uint64_t range, uint32_t *num_ranges)
>   {
>   	void *ptr_start, *ptr;
>   	int err;
> @@ -113,22 +116,26 @@ int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, ui
>   		igt_warn("ioctl failed for xe_vm_number_vmas_in_range\n");
>   		igt_debug("vmas_in_range err = %d query.num_mem_ranges = %u query.sizeof_mem_range_attr=%lld\n",
>   			  err, query.num_mem_ranges, query.sizeof_mem_range_attr);
> -		return err;
> +		return NULL;
>   	}
>   
>   	/* Allocate buffer for the memory region attributes */
>   	ptr = malloc(query.num_mem_ranges * query.sizeof_mem_range_attr);
>   	ptr_start = ptr;
>   
> -	if (!ptr)
> -		return -ENOMEM;
> +	if (!ptr) {
> +		igt_debug("memory allocation failed\n");
> +		return NULL;
> +	}
>   
>   	err = xe_vm_vma_attrs(fd, &query, ptr);
>   	if (err) {
>   		igt_warn("ioctl failed for vma_attrs err = %d\n", err);
> -		return err;
> +		free(ptr_start);
> +		return NULL;
>   	}
>   
> +	ptr = ptr_start; // Reset pointer for iteration
>   	/* Iterate over the returned memory region attributes */
>   	for (unsigned int i = 0; i < query.num_mem_ranges; ++i) {
>   		struct drm_xe_mem_range_attr *mem_attrs = (struct drm_xe_mem_range_attr *)ptr;
> @@ -144,8 +151,10 @@ int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, ui
>   		ptr += query.sizeof_mem_range_attr;
>   	}
>   
> -	free(ptr_start);
> -	return 0;
> +	if (num_ranges)
> +		*num_ranges = query.num_mem_ranges;
> +
> +	return (struct drm_xe_mem_range_attr *)ptr_start;
>   }
>   
>   uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index a1df810de..ae8a23a54 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -106,5 +106,7 @@ void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t
>   int xe_vm_number_vmas_in_range(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr);
>   int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
>   		    struct drm_xe_mem_range_attr *mem_attr);
> -int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range);
> +struct drm_xe_mem_range_attr
> +*xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start,
> +				    uint64_t range, uint32_t *num_ranges);
>   #endif /* XE_IOCTL_H */
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index f61a4ebf4..ba8ae8d47 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -515,6 +515,46 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
>    * SUBTEST: madvise-atomic-inc
>    * Description: Tests madvise atomic operations
>    * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-max-pat-index-multi-vma
> + * Description: Tests madvise max pat index multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-max-pat-index-single-vma
> + * Description: Test madvise with max pat index single operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-uc-comp-single-vma
> + * Description: Tests madvise with uc-comp single operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-uc-comp-multi-vma
> + * Description: Tests madvise with uc-comp multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-uc-multi-vma
> + * Description: Tests madvise with uc multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-uc-single-vma
> + * Description: Tests madvise with uc single operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-wb-multi-vma
> + * Description: Tests madvise with wb multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-wb-single-vma
> + * Description: Tests madvise with wb single operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-wt-multi-vma
> + * Description: Tests madvise with wt multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-wt-single-vma
> + * Description: Tests madvise with wt single operations
> + * Test category: functionality test
>    */
>   
>   static void
> @@ -861,6 +901,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   #define PREFETCH_SAME_ATTR		(0x1ull << 39)
>   #define PREFERRED_LOC_ATOMIC_UND	(0x1ull << 40)
>   #define MADVISE_ATOMIC_DEVICE		(0x1ull << 41)
> +#define MADVISE_PAT_INDEX		(0x1ull << 42)
>   
>   #define N_MULTI_FAULT		4
>   
> @@ -1127,11 +1168,10 @@ static void
>   xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   		size_t bo_size, struct drm_xe_engine_class_instance *eci,
>   		uint64_t addr, unsigned long long flags,
> -		struct drm_xe_sync *sync)
> +		struct drm_xe_sync *sync, uint8_t (*pat_value)(int))
>   {
>   	uint32_t bo_flags, bo = 0;
>   
> -
>   	if (flags & MADVISE_ATOMIC_DEVICE)
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>   				DRM_XE_ATOMIC_DEVICE);
> @@ -1203,32 +1243,79 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size/2,
>   				DRM_XE_ATOMIC_GLOBAL);
>   	}
> +
> +	if (flags & MADVISE_PAT_INDEX) {
> +		uint32_t num_ranges;
> +		struct drm_xe_mem_range_attr *mem_attrs;
> +
> +		if (bo_size)
> +			bo_size = ALIGN(bo_size, SZ_4K);
> +
> +		if (flags & MADVISE_MULTI_VMA) {
> +			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size,
> +					       bo_size/2, pat_value(fd));
> +			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size,
> +					       pat_value(fd));
> +			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size/2,
> +					       bo_size/4, pat_value(fd));
> +		} else
> +			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size,
> +					       pat_value(fd));
> +
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			igt_debug("Failed to get memory attributes\n");
> +			return;
> +		}
> +
> +		for (uint32_t i = 0; i < num_ranges; i++) {
> +			igt_debug("Processing mem_attr[%d]: start=0x%llx,
> +				   end=0x%llx pat_index = %d\n", i,
> +				   mem_attrs[i].start, mem_attrs[i].end,
> +				   mem_attrs[i].pat_index.val);
> +			igt_assert_eq_u32(mem_attrs[i].pat_index.val, pat_value(fd));
> +		}
> +
> +		free(mem_attrs);
> +	}
> +
>   }
>   
>   static void
>   madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
>   		unsigned long long flags, struct test_exec_data *data)
>   {
> -	uint32_t val;
> +	struct drm_xe_mem_range_attr *mem_attrs;
> +	uint32_t num_ranges;
>   
>   	if (flags & PREFETCH_SPLIT_VMA) {
>   		bo_size = ALIGN(bo_size, SZ_4K);
>   
>   		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, 0);
>   
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> -
> -		igt_debug("num_vmas before madvise = %d\n", val);
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   
>   		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size/2);
>   
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   
> -		igt_debug("num_vmas after madvise= %d\n", val);
>   	} else if (flags & PREFETCH_SAME_ATTR) {
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>   				DRM_XE_ATOMIC_GLOBAL);
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   
>   		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
>   				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> @@ -1239,7 +1326,11 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>   				DRM_XE_ATOMIC_GLOBAL);
>   
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   
>   		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
>   				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> @@ -1247,8 +1338,13 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>   				DRM_XE_ATOMIC_DEVICE);
>   
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   	}
> +	free(mem_attrs);
>   }
>   
>   static void
> @@ -1274,7 +1370,7 @@ static void
>   test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	  int n_exec_queues, int n_execs, size_t bo_size,
>   	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
> -	  unsigned long long flags)
> +	  unsigned long long flags, uint8_t (*pat_value)(int))
>   {
>   	uint64_t addr;
>   	struct drm_xe_sync sync[1] = {
> @@ -1406,7 +1502,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	addr = to_user_pointer(data);
>   
>   	if (flags & MADVISE_OP)
> -		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync);
> +		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
> +					    pat_value);
>   
>   	if (flags & BO_UNMAP) {
>   		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> @@ -1527,7 +1624,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   			next_data = aligned_alloc_type.ptr;
>   			igt_assert(next_data);
>   
> -			xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync);
> +			xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
> +						    pat_value);
>   			__aligned_partial_free(&aligned_alloc_type);
>   
>   			b = 0;
> @@ -1893,7 +1991,7 @@ static void *thread(void *data)
>   
>   	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
>   		  t->bo_size, t->stride, t->vm, t->alloc, t->barrier,
> -		  t->flags | THREADS);
> +		  t->flags | THREADS, NULL);
>   
>   	return NULL;
>   }
> @@ -2011,7 +2109,7 @@ static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
>   
>   	fd = drm_open_driver(DRIVER_XE);
>   	test_exec(fd, hwe, n_exec_queues, n_execs,
> -		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES);
> +		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES, NULL);
>   	drm_close_driver(fd);
>   
>   	close(map_fd);
> @@ -2106,6 +2204,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
>   struct section {
>   	const char *name;
>   	unsigned long long flags;
> +	uint8_t (*fn)(int pat);
>   };
>   
>   igt_main
> @@ -2238,6 +2337,31 @@ igt_main
>   		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
>   		{ NULL },
>   	};
> +
> +	const struct section intel_get_pat_idx_functions[] = {
> +		{ "madvise-pat-idx-wb-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> +		  intel_get_pat_idx_wb },
> +		{ "madvise-pat-idx-wb-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX |
> +		  MADVISE_MULTI_VMA, intel_get_pat_idx_wb },
> +		{ "madvise-pat-idx-wt-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> +		  intel_get_pat_idx_wt },
> +		{ "madvise-pat-idx-wt-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX |
> +		   MADVISE_MULTI_VMA, intel_get_pat_idx_wt },
> +		{ "madvise-pat-idx-uc-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> +		  intel_get_pat_idx_uc },
> +		{ "madvise-pat-idx-uc-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX |
> +		   MADVISE_MULTI_VMA, intel_get_pat_idx_uc },
> +		{ "madvise-pat-idx-uc-comp-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> +		  intel_get_pat_idx_uc_comp },
> +		{ "madvise-pat-idx-uc-comp-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX |
> +		  MADVISE_MULTI_VMA, intel_get_pat_idx_uc_comp },
> +		{ "madvise-max-pat-index-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> +		  intel_get_max_pat_index },
> +		{ "madvise-max-pat-index-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX |
> +		  MADVISE_MULTI_VMA, intel_get_max_pat_index },
> +		{ NULL },
> +	};
> +
>   	int fd;
>   
>   	igt_fixture {
> @@ -2255,52 +2379,52 @@ igt_main
>   		igt_subtest_f("once-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 1, 0, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("once-large-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 1, SZ_2M, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("twice-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 2, 0, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("twice-large-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 2, SZ_2M, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 128, 0, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-stride-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 128, 0, 256, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-execqueues-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 16, 128, 0, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-large-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 128, SZ_2M, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-64k-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 128, SZ_64K, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-large-execqueues-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 16, 128, SZ_2M, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("threads-many-%s", s->name)
>   			threads(fd, 1, 128, 0, 0, s->flags, false);
> @@ -2351,13 +2475,13 @@ igt_main
>   	igt_subtest_f("prefetch-benchmark")
>   		xe_for_each_engine(fd, hwe)
>   			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
> -				  NULL, PREFETCH | PREFETCH_BENCHMARK);
> +				  NULL, PREFETCH | PREFETCH_BENCHMARK, NULL);
>   
>   	igt_subtest_f("prefetch-sys-benchmark")
>   		xe_for_each_engine(fd, hwe)
>   			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
>   				  NULL, PREFETCH | PREFETCH_BENCHMARK |
> -				  PREFETCH_SYS_BENCHMARK);
> +				  PREFETCH_SYS_BENCHMARK, NULL);
>   
>   	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
>   		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
> @@ -2377,7 +2501,7 @@ igt_main
>   	igt_subtest_f("fault")
>   		xe_for_each_engine(fd, hwe)
>   			test_exec(fd, hwe, 4, 1, SZ_2M, 0, 0, NULL, NULL,
> -				  FAULT);
> +				  FAULT, NULL);
>   
>   	for (const struct section *s = psections; s->name; s++) {
>   		igt_subtest_f("partial-%s", s->name)
> @@ -2438,10 +2562,16 @@ igt_main
>   		igt_subtest_f("madvise-%s", s->name) {
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   		}
>   	}
>   
> +	for (const struct section *s = intel_get_pat_idx_functions; s->name; s++) {
> +		igt_subtest_f("pat-index-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
> +	}
> +
>   	igt_subtest("compute")
>   		xe_for_each_engine(fd, hwe)
>   			test_compute(fd, hwe, SZ_2M);

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

