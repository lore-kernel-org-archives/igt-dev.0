Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCC1CFA466
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 08:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADE310E1DD;
	Mon, 24 Nov 2025 08:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9SSir9Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C57F10E1DD
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 08:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763971928; x=1795507928;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=488DIaz2YZ8tExZHUk4bvnQiNSaFNocv/r0WcUAsaV8=;
 b=U9SSir9Zquz+ESuxgUEvfQLk1QsXHe1xqAP3zBZKbRU0Pzimb3AiyBDT
 s0CHGJyGGePNspSNilWOfgrk4rN4H2/i8lEFuSPR7Zg9oh6IBFjrDnIVj
 cw2DbwgB/2bequ+TDxgeezN7MyHwAtyOyq1UQdR6Ez2qTwCvEk3fqWMNE
 gvtYADxmDFyquBBBqpNG5vwNpxcTBSLqBy6qCIA65qIrQpXU+ziUdvetx
 44aKHq+1evx3EjTG5nv+MQ2rsxirYWAJLsnlyCXtF+noSxm5lKH1Ds3r2
 s17qqJmQs0E3seZa05VQTA2AGrRSFVBTu9C8VGjpzk/nPrDLrKx1vJ8WW g==;
X-CSE-ConnectionGUID: pRhOwRaLR/KATq3dIHF2uQ==
X-CSE-MsgGUID: 4f2ZvdWpR9iA4gJns4m6vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77439210"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="77439210"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 00:12:07 -0800
X-CSE-ConnectionGUID: xbgVdgSOT5OK0AKgzsezFw==
X-CSE-MsgGUID: vrR0pRJYTkKYyMtFIyuJBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="192731444"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 00:12:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 00:12:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 00:12:05 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 00:12:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0nbh7urRyAZ+ILa2HL1Q+JBulpLfZLSWRIqj8O7nPh0IWlXUzsvH7Y0/SBY59mFL1U0W6NSWu10ZuCA9YzDDLfyzP506ex1PCJn610KQ35ORqGp4nQj/jSI/1cd2IObEr9CFZRTgVmERID1I8Ud/B/NFArBqT7pHZ4tZbu3TfpiSowM+F5SybnViyjQhvA1PK3IqiLNtX8gXwrgDjwFSDvFQMz2aZVlyESJ45nmihM8kM+huHad4C3CAvtpG/KuQCxNtTjD7Y/10spxlQC04jcXQlRQJ1Var8ZXPjYF+IR8dC3wVDoRK2zVDCpDeo6fA7qiOSaavVlWl2bXnH0VQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dQB61WK7iEdvbTxXiEMO+XFn8Z9nW5t/ElNmQ/kNO0=;
 b=HvPuK9SI3Rat1YtzqW+52FdAr00/qR+oav98L4xdZ/aeYelWN7a2nFHERpkzW+zO1HOjuq2WICTBm37S6UiUBuLF3LaT11Gyg7qjPTBa0oz9ba8nfdftrcF9zaPhlUoXEZJ5XOnqfnEXaW4gtVEi8DArxMRVVnidYCG+2AHdmfxQr5DVRfDkjcvJNRaHHBMI0pTgEi/Wd8qlQscHAzrM7NTqvATfAQIUgjhCpZma3WBazVapRjOPYP+w9HULySSgcsFVeDpkXLQVm0zd6NJnLL82u4IMt1KrmbU83HLhB5be/N8mGiM5U7w4dCyzQNFfq9QI1jYJ6iZAWmgec9XAJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DS0PR11MB7334.namprd11.prod.outlook.com (2603:10b6:8:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 08:11:58 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 08:11:58 +0000
Date: Mon, 24 Nov 2025 08:11:48 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, S Sebinraj <s.sebinraj@intel.com>, "Xin
 Wang" <x.wang@intel.com>
Subject: Re: [PATCH i-g-t v2 2/3] tools/intel_gpu_frequency: Change Intel
 card detection
Message-ID: <2xtnunbtp25sipffh5whv42wlxitkd2zlikug7lu7hdyzpnqss@emrt27rimshn>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251121193539.195005-1-kamil.konieczny@linux.intel.com>
 <20251121193539.195005-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251121193539.195005-3-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: LO4P123CA0282.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::17) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DS0PR11MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: 2235149e-47b8-4dea-727a-08de2b31234a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDU4bGJZVG02S3hwV1MrSWV4Sml0U3NiaFUwTnpJWHlFS010YUtIVTR4UHBx?=
 =?utf-8?B?U1Awa0ZFWnFFVllXZHJPa1BXQjBhL1JEQ2FjcHJlSElsZ3M0WVc2dktaWnBo?=
 =?utf-8?B?dHRpZUJWS0xYYUtLKzRTODZSZDNKVFpQNnZBWUk2TWJjU1lWZVlOd2swdlVM?=
 =?utf-8?B?YWNxNzVvSzNvQW9GZkMwY3QwTDlHSHZPeUtkdk9wV2JJNTlGNVNaWE9ZTlA1?=
 =?utf-8?B?RGNJdGhTZi9DRTBWNWdsUGJvanlvS3pqb3JFSHJ3aDJnbXl5eXlwQ3JNZndB?=
 =?utf-8?B?QjZ4TXlkdVFTbW9UVHdGZ0ozL0pVK2ZnMWtZYWZreVdZNkRpSys1dm8wbjF2?=
 =?utf-8?B?WG1wa0h5VDhpMFBzcm9NQUc4c1VaT0xJUmpNRmgrcHd6TFMrQzFZcjJ2SGZP?=
 =?utf-8?B?eGJHdXV5UjBZWHRhUXpPUzZBVkNDZkZwUmIxNjB0R2JBZWZQSm9XeUVBbkNU?=
 =?utf-8?B?WTFXM3ZkVUNzbHRCSC9hNUVMd1hGZ1FlM3J3Y1ErME95K1l6SGVRNDFTUHh3?=
 =?utf-8?B?V2Y0WThJMXMwQmd6QTlXbHRPaTZTdHRUNEU5R3NwNzEwN0lGZ0IwWTd3Q3dy?=
 =?utf-8?B?TWNaNmdNeFowcnpuMmNYMEpFNzVPV2ZSWjdEYWtnTURVV3lJdkJNNWw2S3Mz?=
 =?utf-8?B?R094dHpOdE9mL3c5aGRXRlpqUXoxUk1uT0Q0N3F6NGtQMEhmYUJkQk5UVWV4?=
 =?utf-8?B?VjhFeG5hVkh0b2ZsOU13UGh4Tks4SHluUVQxempEdkx6UUIzb2x1ejBIZWJn?=
 =?utf-8?B?TDBNcXpIcFJib2dsOEZWVVlkalREaERLdEJQL28weXo1aG1YQ2U5WjBEZyts?=
 =?utf-8?B?UXVRYlFPUzRHeGpxdGQrMmF5dWxqOVp6SW9kQXJzR2lsVHo3TzBiamNqVDhm?=
 =?utf-8?B?cWJmK1Y0WEZxV09GemY5Smg3SXlHUlN1NzM2V25DWG5MSG0wOHkzalp6S2tw?=
 =?utf-8?B?eUNIVm9ka2dnNkpvUStQT2JDTm9uU0ZUaHBPLytoNEtKOGg5TXNlOWR0QmQ1?=
 =?utf-8?B?bTZMWFBxQldYYnJRYXQ1S3pJeE5RQThCWE5vM3FBeEpxQVNvNzg0WFkvdm83?=
 =?utf-8?B?M0s3Zjg3S3NhbnZBL0ZFdXd5cTRZSm9jdzRHTWhLYkIvaFZBNXpGaTZUZlNi?=
 =?utf-8?B?elF0eWFzUTg1MFhBQzdnRFkzSlN2UHRIN2MySG5qVEJYT3ZXUnhTR3IyK2Ez?=
 =?utf-8?B?NWRmZlJpTXpKb0dvejk3NTZqMDEwbU93M3RoaTJUY2lxZ25wNkxRem5PWVpq?=
 =?utf-8?B?M05TOXpyTjVaV1I2aWd2UjdCcmczMHRvSFdYeEhyeUw0RkxONndnTzdiM09U?=
 =?utf-8?B?emcxZ2RxR2MxSE41OWRpRGZQOXZXZWpXL211L015NkNDMnBCaG04aVNUU3Ba?=
 =?utf-8?B?N1U5NmdMWHE1Y0l1TUp2QjZMd2padVhCZHdpMzBIeGg2dVgvSDZIcWwrS1g5?=
 =?utf-8?B?QnorM3Y4MHVMN2ZEQWdLMDBWZlkyRnhJNy9NeTNIdVNFckhLNDl1N0xHYXc5?=
 =?utf-8?B?Ums4elROam1yZStuUStLTW56VjlQQzNPWlFwMFJpc0IzaFg2RmE5NGVlUzFJ?=
 =?utf-8?B?QkV5MitvRnN1TnlkQlNwMmlJVUtmdVFwNzgzeVhpZTUrTnRLZkhXWTI5RTdU?=
 =?utf-8?B?YTI3SzdIeTBEZ0NEQkhjNmthOFpiUmNpM3IzQWxWVnRzdHY5QmhIdkhLRmRJ?=
 =?utf-8?B?NlM2QXF1MWM5MkZKcXFUREVXVTdGNHh6L2syYjZzWjR4T0JORFEySnVJT3VC?=
 =?utf-8?B?dERITm1LYWVZcDlvaWJqNUxlQzQ4YWgwRzRBcnN6Qm9JdVFWTmRlYkx4aGhi?=
 =?utf-8?B?V0t4cHU2SUNWNGw4bis4L0MxV3VQd3FLRUpaWEM3TWFZYStNUkE3VjdkcDli?=
 =?utf-8?B?cmt2NVNKMm1qbzdXeC9oTU4vdmU2WCtVWnlBT0cvTDFDdU9Lc2ozbGtESjFv?=
 =?utf-8?Q?1PAYZIMmHobtme0CvRJq36H8va0iCih2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUU0Z0F2WWxVYlExQzBONENseXRmMVgrSDZlbU1raFVNbTJwcTFKekVvbHZl?=
 =?utf-8?B?L3lRb1k1VjdiU25tWk43dWhMSUh1aVIvTmR5LzlzRHhDdUtJMGcvOEJqTjFs?=
 =?utf-8?B?QU9pWEE1RGpSeTc4dG1XWVE5V1JMQm9mOGFZL0gzM0tzVkxReFhhaXNzeE11?=
 =?utf-8?B?N1o0TitEa3F0U1VsbW9BZXYyQVZrRTU0TGRNL1NBalZRWlVJZFBEdGpVazB3?=
 =?utf-8?B?VzRMOFU2WlJLS3JUbGxmMnR2eExEeXlXU2FCaXUydzFYakswSGRNSjc0YUZV?=
 =?utf-8?B?ZXpDRTA2d2k5MHR1R2VCUlpBaWdWaFR3bVZMNlhlZ3JuZHNkOUVqVXVMNTZC?=
 =?utf-8?B?TGR6bVAwam95NWE4QzlVVlg3M05lUmpNL3E1RkZUMjVLK3h3Tk9JaUpEalBR?=
 =?utf-8?B?MjNueXpjNnpxelhRVjFZTjljOVRnWG5sZE1MQ2d2Y0VseFJwYzBFUllaY20w?=
 =?utf-8?B?bWNxQ2dzazJzUzZNMmhxUDZ3dWFTVU5GSDNIN2ZKb25GdTlTUlNvamI1TEt3?=
 =?utf-8?B?WGl2V2xaY0t0VHlpZTVyVkwwSStmRW5YRXUyME5QN2Zya24wd3JiZU9tdGpZ?=
 =?utf-8?B?KzliaW01ZzdEejV6WW8rSUJJWWtSUzhxa051SDVZaCsrdENJejB6NWtCN1hS?=
 =?utf-8?B?MW82SG9OWTFObnRPVzdsSEJuS29FcFJzbDgrQ0RML1hGODRZUmVobnkrTmp6?=
 =?utf-8?B?UzA2WEJRYzFiaFRwS0N2b1lrWlVQQ3VIRGZUaEtJbndOUlBFQTZ2aUNTdnZk?=
 =?utf-8?B?YnBzWDBKSG9tLzBLU0ttZ3FZN1hyTE9DN2hrZTNaZ2F4c0p2QTdPUm5IZ0tt?=
 =?utf-8?B?QkpkemJMNHBUa3RKdVViQzFMZUZWMnlHVkFQQWdnVklsbE9DN0Znci8vbWd6?=
 =?utf-8?B?M0xtRmdidmd0WjJSelh4OVkxdDFVdWd4TDNidDlVMXM2aFkzNmhBbUVsUDBH?=
 =?utf-8?B?aUpscWlwNVZ6VzN4emJ6MnlJdURTQ0crakpuVDRuWVpjQVRtaG14YlFUcXRk?=
 =?utf-8?B?bUc2NXBtNjR3VWtEYlhnM1NTd2FRamljUlhPZ3FKUmNyRU9JTGp4dlBmaG52?=
 =?utf-8?B?SEVuOTNyNVBCc3VpWG1pcmRkTnBPMGIrb05zakpkQXdENE8zcXJuQmlOT1VZ?=
 =?utf-8?B?d3NYcnlmaG52VDkycmxuQ3hnNy9yKzZaTithSi9nemxCeE10K0dCS0dnM1M4?=
 =?utf-8?B?dk1ic09qSFB2Rk9INnFCNmxJTDl0TWpXa3J2Y3FiUGl2dFpHNStEbTJWeFlL?=
 =?utf-8?B?ZE9UMXd4Z0pqeWVGOHN3WFRlNEpCZlJLenpybXppQVVuZWtDWmx6VGVGTHBS?=
 =?utf-8?B?MlBEemxlbjNPb3h0OTZLRFJMcHFrZjlJRUdLcW5ZdzlYZEFSRjMxSjdwcnZ6?=
 =?utf-8?B?RE1INTlyVlAybWRPWjJxNHJkTGRlS1o2a2ViUDZuK0M0ek56MDRMSm1kc3J2?=
 =?utf-8?B?VmU1cEpYWGRFZWZYSGhvRndTL29xQjZ2VGRyUWM4a0VnSXRXZGt0WTlsdFMr?=
 =?utf-8?B?NTloZGExU2xQaURnWkI4cVlheWhDYk9jdXJEYWpkNFNNWUdiTnZYc2VHcmlw?=
 =?utf-8?B?WFZBRnZWdFUwUkdjcUIrR2tvOFVIK05sbjFSRmNzZWJ1SWQyb0RLaHlJWVht?=
 =?utf-8?B?K2kzL1VqT0k2T1h1VVpjbUY0K3hFVERaSFh3T3lCUDBIcEYyMmFpWFlxV2Qw?=
 =?utf-8?B?ZWtxdHBVZkYwQkIrQmczK2NhQUZXcTFTRjN0Zm5ndjhZTC9Yc09PbUxYSGFv?=
 =?utf-8?B?RTlKOGN3bXRZT0FheHAzOHdEN2hOL25teHJWSm91elg2RGZ4M0o4UDd0bEpI?=
 =?utf-8?B?NXNFNXZiNGl5VlRnRzRpR2Q1SlNLUEg1M1Z4OFN0MjdpYm1jZWhTUTd1aGVK?=
 =?utf-8?B?S2J6ZWdiK3ZVd1hmSitibkdiaEg0WmxQdStXb0luNXl5VGRYcHBvZzFmcm9l?=
 =?utf-8?B?TzYwcC9ldnYvWGloWEdaUnluMnVJZldoNDdnVmVya0pZTFNqc3JLV3BKekxV?=
 =?utf-8?B?TzhkZng2SG5tZ1pDQzBSa3hBcVVDZkwzbXlLdDFnd1k5ZTBGaTFub2ZvbWFH?=
 =?utf-8?B?cjNJZk5yMGRjTll0NVFUdWQ4dzdET3JYdGlaWEZTMXh4akNyZGNPbXpmRWxU?=
 =?utf-8?B?TXp4VFo0WlVaNU5uVkdnY2xZdE13L2NXTDQvM2VFQzZrL1lUVU1LeGVmbk5r?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2235149e-47b8-4dea-727a-08de2b31234a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 08:11:58.3668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGW3xCJ5VdxGtLt3vHhJv9m57AhTpkCXu9aJ9QbcMGOpKFl631KlO7FumkuhyRf4u3QRc6Ti36S87GjmFG7Uir7TFu4zRl2T4EVRn+/CmZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7334
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

Hi Kamil,

[...]

> +/* Returns:
> + * 1 if Intel card with i915 driver binded
binded -> bound

> + * 0 otherwise
> + * -errno on error
> + */
> +static int
> +is_intel_card(int card)

[...]

> +static int
> +get_intel_card(void)
> +{
> +	struct dirent *entry;
> +	int intel_card = -1;
> +	int dirfd, err;
> +	DIR *dirp;
> +
> +	dirfd = open("/dev/dri/", O_RDONLY | O_DIRECTORY);
> +	if (dirfd < 0)
> +		exit_error("Cannot open /dev/dri/", errno);
> +
> +	dirp = fdopendir(dirfd);
> +	if (!dirp) {
> +		err = errno;
> +		close(dirfd);
> +		exit_error("Cannot open dir /dev/dri/", err);
"Cannot open /dev/dri/" and "Cannot open dir /dev/dri/" look
very similar at first glance and may be misread as the other,
especially when parsing logs. Maybe you could use the full word
"directory", so the messages differ even more?

> +	}
> +
> +	while ((entry = readdir(dirp))) {
> +		int num;
> +
> +		if (strcmp(entry->d_name, ".") == 0 ||
> +		    strcmp(entry->d_name, "..") == 0)
> +			continue;
> +
> +		if (entry->d_type == DT_DIR)
> +			continue;
> +
> +		if (strncmp(entry->d_name, "card", 4))
> +			continue;
> +
> +		if (sscanf(entry->d_name, "card%d", &num) != 1)
> +			exit_error("cannot parse integer", 0);
"cannot parse integer" requires the user to know that we use
integers as card IDs, not floats, not doubles, etc. You could
change that to something a bit more generic, like:
"cannot parse card ID"
or if you want to include the information about this field being
an integer:
"cannot parse card ID as integer".

[...]

-- 
Best Regards,
Krzysztof
