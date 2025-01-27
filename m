Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD6FC0218F
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 08:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE08F10E4D2;
	Mon, 27 Jan 2025 08:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bs3zt4bi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4374910E4D2
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737968221; x=1769504221;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CXJHhJOWAvOjeVjY8P402xrISYv7cOqccSadwgWzWVA=;
 b=bs3zt4biR6W4vkMw7EguCq5NS661vp34OZxesL/ntdI+RRLSD33T6foN
 PFodnXL4Sykc4xv4CABdRzugOvPh0X6NoyPsd9lRPeD5c0tLoBQAVWvPO
 tKcH6DlJ2tFXoF166ESPYlNiIRfZtFA2Olu4TCq0IZo4Qa1onY8CZdAmd
 J2qesW/Ligr4kap6CywGK/UjcokYiL3QVl88ExE5nzXoMMzu/T11Dyh+L
 1aiHiuJ6MuTYjtCbQhmVARgATueoJDIaMsFt+nJIq7Mgg5faFi7/SINSL
 UrrY5+lRHG8Ii4zLqYpwPqI+Mo9BUbnvbAhZbaS+xM12VqwQyk233Gj8A Q==;
X-CSE-ConnectionGUID: SknLP5prTs+xoKcCf3/R+g==
X-CSE-MsgGUID: iafjZIVVTqe/3yjopOmVMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38311048"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="38311048"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 00:57:00 -0800
X-CSE-ConnectionGUID: kDnVXYdiSKiAW57J9S5nGA==
X-CSE-MsgGUID: oUMRxiATT6em4HLQpF8omQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145603075"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 00:57:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 00:56:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 00:56:59 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 00:56:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SupLS7YYYkSBXYOOSy86I9HDVRDaDQoy0OjHomcS8bjZlN98guBEIl8j2to3ms/6dpXFvxb9mlYrQy2irGShN/UNXUy7YFUOfVVe+u3OpNwdllmjroW9rox6I9364j/G0BzDsjkoe5DwehD643TH3skETgu8og+eu91NdIdGzmBKwCXcQcNrUP842id3Vt6G7AetlIGDcFNd9Y4wL4O+R60VXsMj4Eq9PCW8654aWQ3201Z6F9fm++ya0Cb5Rk2jLtRSrQLCNSQbhJ0kNKydisGJrbviT/VbiOfddto1MiszijkLg/ATIznk7TGtFFWr+m1HJOfw3Et+r+IA38cRlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YslClgrkP2J+HoGDq97A/+xqQNol/nVMrfIXQ1rCQyQ=;
 b=wYGTtI9IsFoKOMVxM4OvVNr/83X9+u9UAg2HdJCwEftaDLXtrZPBNmT01otbcw8MM1h6QXIgl77JoTJ+DTvTMxAPK2BAfkFSf3oWwJ59TzQ8BsPXxG8nR9ES5FaogmaAnkmb0jB7jmj6gm1/mJ4zPfWDkLnJJyjC6g2HQGnN86RDtXmwryimM/7mjjWd34Emvd4XRODOuH1LNMnbd3MbO9xa+iyui47uwKML5wXVtKoDnuXIBKIkYFPiaKRCtFUmUqmwL3XKjgU2gTW5q03Z/HvjsrGFtfnJv1Px2ShllANtrbHTdVlDxkJgHkLfegrfX5QKEdKXHb35D+c0hjiR5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 08:56:17 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%7]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 08:56:17 +0000
Message-ID: <beed6586-4463-4402-b739-ebd8bc513e31@intel.com>
Date: Mon, 27 Jan 2025 14:26:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_joiner: Add a new test to validate
 non-joiner mode
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20250126181931.3356853-1-jeevan.b@intel.com>
 <DM4PR11MB63121D29207E8875D958452590EC2@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <DM4PR11MB63121D29207E8875D958452590EC2@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PEPF00000187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::4d) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM4PR11MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: de3be780-0c39-4f0a-0899-08dd3eb075c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGNxMC9yaHUrY1NlT1I3S0V4YVA3ZHc2OHczM0swYzRZRXE4TC83RnFPb3Bq?=
 =?utf-8?B?TnYzelY5dmpRYjhzSkZxMGttbCtRUWhjRG9XRTVVdW5wKy8yUnFhSHhtS2lz?=
 =?utf-8?B?V3NtbjdPcVNpSU1jWUlQMXk0U3RpM2lMTHNxNm9rVE1UL1FxYVd1cDA5VElm?=
 =?utf-8?B?bEtreVdqNG9FT05xR1NmaFlrWUQrOVg5VmlqU2I0MURtRGtDdjRMSm1ycW90?=
 =?utf-8?B?NG1ZUk13d0tFRmRkZnBET0ZsUXVBK05LQSt6UXdoZ3B4Vjl2dVFueGVwWjBG?=
 =?utf-8?B?Z2RqT1JYdkRXNU11ZlY1VStHM0NVT3d6Y29LbGgzZ2dRY1hUNU9sbDFHeG1S?=
 =?utf-8?B?ZTdCZnJVTEV1VGJhbG90QVRCUkpvN01tN3cwNjJZa3pmWVdJQkNvSmpnd2I3?=
 =?utf-8?B?bmxvWFhXTkF3cEMyci83VzhHSEdWUlBFcXVFRVo5RVVabWhNY2RKeXhoZkdE?=
 =?utf-8?B?Y3dxRDBORHNVTi93VFhsckFtVTdsVklXSHZEYit0NFhrcnl5bG8yaEhKMU9Y?=
 =?utf-8?B?Q3hEb1VIZDdycEdlR2xQcnVXcmFvNjcvOGRMS1ZxRUJqSGE0bFlIZmZ2NVpT?=
 =?utf-8?B?Z2E1TlUyRmFLcmNXQ01jV0llWGRHUWpwK2IrLzVsM3g4d1RjK21NcE1qYVFq?=
 =?utf-8?B?MXlNTCt2RWYzK1I3VUowbVAwenNFYWprbklndDBvZnE2dmd1ZHFzMmlJWHli?=
 =?utf-8?B?VmhWN3ZWOEUzMTllWkxQWFZFeHRpR2ZJVVFwcnBSSTlhbHVsZzhLYmQ4dU1u?=
 =?utf-8?B?c3FEVWpCMmoxQm9UN3dyME9uTHpCcERrd1NVOEJLMlpkNzRHQmNHdS9Obkgr?=
 =?utf-8?B?S1E2aWduN2QvM3NFUStiN0w4RlhXZGZKSFovZmM5Vkc3QjMxOEk3N3ZCVng1?=
 =?utf-8?B?RG5kelB0dEZWRFRYNU1uMHFmRHh2aGt6REFmeWsvL2E3MURzZ3JsMVRrb0F4?=
 =?utf-8?B?a282UVNzSHM0eVlMaHVwenl0eDhyYlQ0N0Q5TkZSOVdLUnlQYXBvYXNSYThU?=
 =?utf-8?B?eUFPNHFrY2dJOFNBRlloT2tVOWRLS3hYMHVIY01pREk2bWI3OWJEVHhQYnBM?=
 =?utf-8?B?UTdzYkt3TU0wdTlLb2VIcXk3Q20waVZDaytJT0V2L0RPR1JsTXFJbHZQRjB4?=
 =?utf-8?B?VFNjWXV6NEpZZUlUWUJrS3VVSHgvKy9lU25CaFVvWmJkTWhrZzRneUFiam8x?=
 =?utf-8?B?cGxLWjU0MVZNbmtZSjk4Zld4OWFyQm1TUU01NThFQlFkRUg3RVVBWFY5UHZ3?=
 =?utf-8?B?SWE1K083NVZmR1NvcGdXRURwN3g3TVhsa0tGZWtNNUlEcFpRdE56YmJnK3Fy?=
 =?utf-8?B?SFh3a01Md2xxRzJYS0FBYXdJdG1oWEtEa1FoOUdleVRSUE9xYXZVY3VqNGsz?=
 =?utf-8?B?T0hFblZmRUFybHVaaWp4QTdtcHB3WExpa2FPNko4L3RHbS9VVTZmV1dTNFNm?=
 =?utf-8?B?WEJlMFpWWmdPZUNEWmhQVVUrcTFxanFTMEllQjdhRGtjdmYwOGtLK3lLdnhK?=
 =?utf-8?B?L2cweWdCRTJxeGxhdmJkd1MxWjA4bHVHcFA4K25tMlBaV0VmeGYzdWwvM0Qr?=
 =?utf-8?B?ajRQd2g4bms4b2xObUt4VXhBNlFiMUltL0R2NjR2QTNSUG1oZW5IVFM1S0M1?=
 =?utf-8?B?WDByQVFBWFBDUHc0cDZGZG5ndkFvYXQ1VDlEVFpXN0swMS83NFJwcE5TbHY4?=
 =?utf-8?B?SXB4ZmVYR2V2dzM2M1ZMdUVBcG9yeUJjUnc0WU9xZzEwRTV2WElkNTQwWHRx?=
 =?utf-8?B?cEdhUHdBOE0yUEpaSGRNZ2JrNXJ3VzBieGkxWXNPaVJEZW5GRk1PTzFiaVpt?=
 =?utf-8?B?QmdqNkdnVzlrMHYrazhrQkZBeGhMa2hORHJPaWFqSUY5K2NpdkZ6MFJDMDM3?=
 =?utf-8?Q?0qypp5WXg/7IW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rjk1cUhMNm9sWEJyaFVueUJCcExBb2xqaXhrcEp0Q3UvQkFKZDZEUU41TVk2?=
 =?utf-8?B?dmtMWkxiVTMvejYrSWJLMzNTRU1wMCtMTGJkc3RkVjBKejdaZ2VtMFdIQnFl?=
 =?utf-8?B?U1k5VmNWRC9FSlg5cnZSbGI0M0NXbWFYSW9CSDBicGtFR0hpWUZXYWIvUm9X?=
 =?utf-8?B?d3FtejdrMytxSUNMZ3JCOEx2Y2JBMC9PQVNEcDAzSjZIcFVXd3BaRkR0SnZJ?=
 =?utf-8?B?TWVKcnJyQlJ2ckpiMnYzWkRaNm5vOWk0dnlrRnlmLzk5Qmgyc0pJTkZMMFNa?=
 =?utf-8?B?ZzMrTGNoQnF1SW5sWWdpdGNLUmRzeGowd1NmVEZoRndieEZmZjhUb1dQZllw?=
 =?utf-8?B?MzlhV2ZnbFJUQm1uTXpMUVY1MEo3NW9HZUdhRFIzbGRGQW10VmFHdXJINDVY?=
 =?utf-8?B?blNDbGlYVXExa1hEN3pablduN293TFpMSS9Kb3BqUjhsTVZuMTFFczRSZnZz?=
 =?utf-8?B?Nyt6SnJsTnY4TWhZQ1YwWFhaTWQwNFM1MkNNY1RXMUtrd3RRT3N5WFFxdlFT?=
 =?utf-8?B?M3lPdFNQSHVTVG81ZXBZOEg4bEhVMEdyektFa3VOTDdKSVNybk5LNnFGdldr?=
 =?utf-8?B?NGFXcU8rMi9aY0QySXlwL0dvRXlROWFnSXErTVFUTzAvTVNQV21MOUVKa01h?=
 =?utf-8?B?dXN1QVRGL29hOHlhQW1aNElRaWpaUzdnSGtwaGFIbFltZ3ZIWFlacUtwaWRj?=
 =?utf-8?B?Z0tCbkhtak5iSnU5ZWNVSXFUdHpaNkhzUnd1R1Q3SXhldmNOQ0dnZUhGK0J0?=
 =?utf-8?B?dXdFNEZuYlZMOGhpQnZOSTFNQW91OUFra3RhZEhYYU1MVjRyb0h3eko1TlRO?=
 =?utf-8?B?ZXg3b2s2V0Z3cVhFQURwbFBMRG1lTXc5MUhNMTBTZThEbmlLMWhiNUtOckF2?=
 =?utf-8?B?ajJBVVNFK3FXUDFEejJKcVF2aldNc1d6R3VKY2F1OXN5cUtRTGlrTUFsZDhj?=
 =?utf-8?B?VkM5UmdjcktibUJkOGtPdmRGOE13ME5tWWJHdDliU2pEVEE2YVNxdDJJOXdX?=
 =?utf-8?B?cG1mMXFhZ1A4Z3dVNERKcjFVYTFWeXVud3F3VGlxK0ZXYndSdy8wZ0MzeUdF?=
 =?utf-8?B?dmdWN3ZCTzhndXl5eWNpTjg3M0pMcTk4RGMxdG1YK3pObUpKSkxuY3gwb0Zx?=
 =?utf-8?B?eWpvbmdBdnRWMnR3VUFtOUEzVkZnRGNEdnlUS2FvaGlRNVpFZTdhUzdkVlVy?=
 =?utf-8?B?bWpLaDhwTDBoSDZzQ3FHaExmVlZDbzYwT2hhVEdmQmduSHNCTXZOdzgxM3FV?=
 =?utf-8?B?RTZJTy9UN3hSKzRUWE10YnpBUEFYNDVleFh5UTNVS3FtSHViZnpTSnhZNzJm?=
 =?utf-8?B?WEFzdjRQOUZZL0trZGMyQ003SnluQW85QWYrRmR0QzBEM1JyZytYQ0x3N0lh?=
 =?utf-8?B?czVadFZUNTgzejBHY1RxVHMvMVh6NlppQllQTTNMK2p3dmh3S0g4K3RMLzZK?=
 =?utf-8?B?REQ1WU5ockNXb0ZOVFZ2YzVPbXVuRFNUejVudXRQcUhSNWI4Mm5BMUM0TVpV?=
 =?utf-8?B?RWJVV0xqWlArMkFNYVJmRDNMcWUrZ05kSFkyQjczSzVvbzNYZTZBaVFqSEJt?=
 =?utf-8?B?UzBJYjNrTE5BMDFoMjZGYlFOa2QvM2FVd2ViUjNZU1ZqUE1vMWJWejNDaS8w?=
 =?utf-8?B?MHdpejJMMkFuWWZJNHArVG4rNk9aREJ0KzZmVmpjVVRWU2dHbjdNQURUMXRN?=
 =?utf-8?B?bjA0YkdnR0FBVjBrWnpDOHBEWmJDVDhZVUZJekc0YUlaMXI2UCtkY3V2ZFAz?=
 =?utf-8?B?NjB6TXpjdjRFeEU3U0hydHg0TGhXTFpxOWFmb25RWWZHejdYM3lrb2xiQWcx?=
 =?utf-8?B?NUhPelZBaG4yS2JrNEFjcktmamd1djg2NTVONkMrMjRYRHYyWUttMXl3SW8w?=
 =?utf-8?B?WHNzd0RLM1dWWjdnd2Nia3FQSm5XY1NVam1ITHlSQ3doVEZubDgwRFNjeklJ?=
 =?utf-8?B?MGI0ZHdtZU9kVDhsRVhSOHNzM0J2eXN2S0J1K251dXpiMFJzeitOT3Y3Zm1i?=
 =?utf-8?B?OUszeXRXdEh1Qm5CaVoxRTlFcjZvZmhQeFByNCtrMk02bnoyS1FBcTVjSXRp?=
 =?utf-8?B?eUpHNWpuUzd2QkhxRHBLQ1YwK0IxbHJqUEV2MUpNeFZwcmthZlp2eXNlaE1S?=
 =?utf-8?Q?WzWlCpiBo/sM5AjjG9EPcpx/Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de3be780-0c39-4f0a-0899-08dd3eb075c7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 08:56:17.2144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +uCKlxoyN6ATysnCOmXOMKuxLIYq3l8UBbvg38Si+xKSlfYitrQwwF9tGA9/sb5PNJUc/owBaWXmSHNpNVkpHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5995
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

Hi Jeevan,

There is no specific debugfs entry at a pipe level to confirm joiner is 
enabled, but I found an entry in display info which shows joiner is 
enabled. "Linked to <> pipes as a (master|slave)". We should be able to 
parse this from display_info to confirm if joiner is enabled for a 
particular mode.

Thanks,
Karthik.B.S

On 1/27/2025 11:20 AM, B, Jeevan wrote:
> Hi Karthik,
>
> I have addressed couple of comments you had given me regarding sorting can mode selection.
> But for validation method apart from commit failure I was trying to find alternate methods but couldn't find any lead, I have couple of opens. 1. Is there any debugfs entry where we get to know joiner is enabled or not. 2. Is it possible to get pipe active status after modeset/commit. Based on this we can validate.
>
> Thanks
> Jeevan B
>
