Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648BBD25044
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 08:11:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1573410E05D;
	Mon, 12 Jan 2026 08:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iBeh/g5/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E3910E04C
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 08:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768205477; x=1799741477;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BW2ZLGFQOxhMMa/+znJkrfQGdV1Dw8cwDFh6jfTeVnc=;
 b=iBeh/g5/ivrcYWJyGwwIsU2uId0dCbUvIjLZG5TF27Inc4m+DKV2kaRk
 qFtd9HSiwLM44fJMpAbKaNZ1WyLvTvBYwvbUcOuVRcbKsFFpnAyj9eZYK
 j1qLNtTDo8kp8LF4cixkT0brfvjUzATiuNAeKRwkVyRmYVAQkqHiRdB/e
 1irg8Yc7QGALd77GgT7Yo+cGLzi7C1Vv35J23nmUCARIL+tiZkPb63vSg
 Zmq0lhQ92MHcgT1IugGTV35iC2c75sRQ3VmQueT7FaXCYjRxIKYZDQh8b
 OEX/fvsqMqj6KzoMNO9tvF/eKoUT2Gt5IGh6ysxABgLagz6cRQfSohK7f w==;
X-CSE-ConnectionGUID: dhT/+6NFSzqvkpLWQTHIKw==
X-CSE-MsgGUID: RCc5GizFRvCRtK0PIjX7jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="68480597"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="68480597"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:11:16 -0800
X-CSE-ConnectionGUID: oBkO5jIaTd2a+g4mliVwYw==
X-CSE-MsgGUID: 0pILTJ6fRtyOfuUlP7po7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="227295619"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:11:16 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 00:11:15 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 00:11:15 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 00:11:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t++e7mALsu7raxTxqO1K71m4UOBK8iRLLe7BPgW7hbX+HXNDhJ7SXSsh3qLoVlZ5ktnqRpEBVMQJi6QccAR4s6ukyR3gHg3NbtlKerXrvuB1Aq3YBPCSpYp1PWQul2v/NR33+5oZcmGRZbpsyb0whkGBWSqUWTBHU90Vi19cshcj5GwCeXEsc69TuWMSiSlmS8mZap2rWZ3qJYD5KSzDTdJsyjyqJgKFb34sMCGtRWJNkWedOjW8SM/5HHvzb8UDx1d2AUfXgpjAbmnHHeFP35heD3qLk9PRJ1BoCTRr5Fa0dXGIoexJlEukj3zld29WZf2wqgy6dBZcMMhUsFGOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRyVuqCgJ7xsRYTz2GOU5Q5IA/6Rftrge6pDKaMTOOg=;
 b=DODa8VOlAaNFIL6iqHxt+fvfJU4Dh1CGt5GKk9/DdzHxjE7oC+d6fdXygz/nLxirNcSr2X/iglGH6uLM/H/oVKAk7xOjTIhlu6joHbSJZ5jr3xBawFRKhTTXp29AubELtl6kIv8kKfDW+/Oc5rmt8WT+KuAfbHe9ml/Rt0WW92/KryJ/AYp9e6kEPx+eNHS4FyqS3WACY7QVCLLG7vAoTif7Ptz5eCJm9fDWjl5BlKBMySrqRWftlU83CIkPuFZTTCF1gEet/o7xhUzT1Za6au+SQe80CQAloJWhdX+TMOdo7vOzRk5Ew+M14ClLwIZiFBGUJ/Dx8JxWUciHvfR4Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 08:11:12 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 08:11:12 +0000
Message-ID: <bf8391cf-cb14-4d20-98ef-dc88c22ce005@intel.com>
Date: Mon, 12 Jan 2026 13:41:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v2 4/7] tests/kms_plane: modify the condition for
 odd pan
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Nemesa Garg <nemesa.garg@intel.com>
References: <20260107093535.70116-1-swati2.sharma@intel.com>
 <20260107093535.70116-5-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260107093535.70116-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA1PR11MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 318b6a7c-8e7f-4140-8325-08de51b225f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0lySXQ2LzVpSGowRzB1N1UxK3lmemhRcVdkY1hUOUlPcmRINjVkYzF0a0Jt?=
 =?utf-8?B?aGRtVGF1RnNncUpNSFFGZ2ZzVjVGcmJ1UWhDeEJ3QjZMT0Q2S29oWHJmUmQ4?=
 =?utf-8?B?c0o0RzlHa1MrbTUwdFhUKzdJOERLZDZSSS9CQ2I2Vlk3Q3Q0NS9xMHRiNDFL?=
 =?utf-8?B?ZjBKR0t2QVM0Z0ZmbHI3aHJxTXdqMkdhYjFUTHB0cXhvSmhoMzJSZ2NPMGhu?=
 =?utf-8?B?MnI3OFI4VlBsMTg0ZGJaWk5xS0FRTWt1NzhrejVKeWlwY2tuK1pxSUFtVGxh?=
 =?utf-8?B?bEJ3REp4MVVlcUNxRlFHd0pkSk5ZRlVKcklBRWxGYUt5TWNTZ0U1YVljb0FC?=
 =?utf-8?B?MHMxN1dLMEdlVmxscjRPQTIyeXE0N3VRUnRJcHRHWE5kYXl1cjBOcjhneXVW?=
 =?utf-8?B?WEUrZFRrQXNjTVJselNXRGYzeUZIdmNYV0ZseEY4bWFCTmdJWUVPRDdELzZG?=
 =?utf-8?B?SDJkSmN4bG1zWXNJMUtNS0VLamtkUXQ3cEkrNW1YbVR3K3BUZnQxaUpyZ3BG?=
 =?utf-8?B?Nkxib1NCUDFON1NKQ3lYK0ZRQ3FvZ2VMM2lBclRXakVYM3J4MlVkK2RwSkRq?=
 =?utf-8?B?MlNhczh3Skx3VUtNOXZ4K0VNZzN5TXdrZDhCd2ZhQnBRencwelluaFNsZnIy?=
 =?utf-8?B?ZERNZ1QxeEhmeFZyejRLbDdKSmh2c21tNmZCdU1zR1pkWTVKdUFkQ3FLSFll?=
 =?utf-8?B?VTNEbXpVcXdPSnJIaGFqN0Z5Q3k2ZE9Sa1ZIRjdJaVNOeDVGWDFIeGNPY2F6?=
 =?utf-8?B?bHJhRTBBWDFEWkEraHR4RkppdDZtaGZNVWRJdVNRNDVTbHhvdDFhYzNDVTNZ?=
 =?utf-8?B?Sk91SDg2bkFxODd6SW9QSjBESWhFNWEzRk5NNXRXQmdnb3NybEs5Zm9mM2RC?=
 =?utf-8?B?R3VLTW51TVZ6YWd3TGF3cGNjT2VsUkFXTndZRFlVNXh4WThpeEtpTmo2ZUIr?=
 =?utf-8?B?MUVqSmlsa1d1R3VTbGtSL0E5eHZPa0xVTnV4SDB5WXR4dENzemVpSmE2cDQy?=
 =?utf-8?B?bnFyaW5SRnMzdDNLWjBEYlNneVNnYW9mMGhGYjl6dTk0ZFg5djNUZzZRdk00?=
 =?utf-8?B?Mk42d0R1bVpMWm94S0NJSXZEbUo3T2Fvd2k5N1FHWXRvRmUwZStRSjBhUEVn?=
 =?utf-8?B?SDBnbnEyUXE2VCtzZ2gvdFNmUk9zT2FrK2lyV25BRCtRZndzOUhHOE1PMjBN?=
 =?utf-8?B?K3c0bHkza2JJODJGeE9rUkRpbDNRRitDaUpDQmduSTVBakJNZVhFcjNVZFRP?=
 =?utf-8?B?NjVkYlVVSEpaR2NkUjhTV3kzeWh0UEN4UGpzVkhpYWpzR3VyeExjZFVxSEFl?=
 =?utf-8?B?bmJYNUtmUmxSTE9QeHdlNkV3bU1pblMveWhlenBZangrMmVGR1UrbmRyc3R4?=
 =?utf-8?B?WXpjWXNwRzFPTmZqVTl5Uzh1eUgwdWxjaEZRK3FMSjMzZWJ0alo2MHE4bzM0?=
 =?utf-8?B?Rm9JU1Z1OVh0TVQ1RzU4NmNLVUoxRCtuc010aDVmU21aWVVhRVlHSG5JbERu?=
 =?utf-8?B?QmplZXFIRWFYcExYZUFtZ2lYR054aGhsbVpTc1V6WVMzUUtoNG5kN2JkNEhu?=
 =?utf-8?B?SmRFYnZiL3pySVFqdG13YUpzMDRXbUY0OXV6dXF5R3VjYkx4Nk5oRTN0ZHVN?=
 =?utf-8?B?c3JYeVZvYk9YblVMOUpUbjFmTGluTFRNcWlueXVvUTRxZWFrQkdQV2srOThj?=
 =?utf-8?B?cDBkVTFFeEJaR2x1VUJtUVQvNjRUY1dNUldjbGdSTGFVUVB2WXBPVS9NazEx?=
 =?utf-8?B?RE9WcktoempWVkpzcXJGM1dYNkl6STRjb0xoVFZyS25xUnRubW9GWE1TRHBT?=
 =?utf-8?B?ME1IZElPNVU4TVRnV3dGMHI4eHVFblpFZ2tWNkF2V1REQ0trN3pvOU11d0lF?=
 =?utf-8?B?UDZQMTVIdzJxY2NwVnIzdGsyT1Bvdk13SXV1dXQ4WjY1cmoxdlc2VkFHUklj?=
 =?utf-8?Q?SnBD9crvPHtBVA5oSOPFtgfYzT8ljAuO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjhlMlRXWHRmVURPTnhLb0hING5weCtCWHJWTDUwSE9nVU5mUUlPcW4wNm5K?=
 =?utf-8?B?UG04ZzlqbUE1U0RKQnpGeStkVHpXaWdHMEJ6TjVQbWQ1NVlpa05EVmtraUsx?=
 =?utf-8?B?blREWGtxQWhjSWRESTJZMXNFeXRGTFl4ZWZEYW5YS2N1OHdrZHZad2tUVml1?=
 =?utf-8?B?eWNuei9oeDR1K1JucWlsNkhvYitIVDVYUCt3VUx4TUZUMmJtZmwxQWoxSDFB?=
 =?utf-8?B?MlgxRGwrejFtb3JrRzNQRmF1ZzlOM0xSanBqOU9LSFpLVVIxZHFhM1lEUDhG?=
 =?utf-8?B?V05VQXBpMmZhWXMwNHpwUnlDaFN5dExTbUprd0luWCtZa3UzQXdqRHpUU3Bx?=
 =?utf-8?B?bCtTOE5zSHhac0xOYXFJd3lneW9SSzExaWNEL1N6UXNvb1RyUWtVb0w3Yysw?=
 =?utf-8?B?S295YjBCNmxmVHFqczJKYmtkdk9jYmU5aGxTelh0VnV2aE1CdWZRcFREK2NI?=
 =?utf-8?B?NnN4K0wyQkkyVURTQlJOcU9BRnJvaldYb3pmTEh3VjEzVVlrakZLT0JPTkti?=
 =?utf-8?B?ejN5WFVCNUZxQjdvbWk1ZkIxMTVQcFIwMUYxUzB4dTR6eDA0a3FYMHRjVVN0?=
 =?utf-8?B?eWlHOWw2ZzRObExNNTc3N1Fkckg3cERsWlFqdDlqMVRSK0diU2ZNNThiSW9i?=
 =?utf-8?B?WkhDZGFwcHFrZFljRGNtNkJQTldzeVFVVzhkNGFaQ29MQjVSb1R3Uy9QVXgw?=
 =?utf-8?B?OHlJeW1DdFBJTXV4MU5qYWdQQVBIbnNPL3VwREszYkIybFluMWZna1luemFl?=
 =?utf-8?B?Q1R6OVQ0MWJPMmlheUhrbjh1ZVBzazhGOWRjYjdrN09LTW1Ld1EvNUo4MnND?=
 =?utf-8?B?YTB5UHY1NllhVC92aHU3Q0ZHOWNrUkFROFk2U0VMeFZiR2t0aWZwNzFxcVJT?=
 =?utf-8?B?RDBTTTFpR3I3S0tucWRUOWtxVjd1ZTZ0N09PSkpEWVlzbXUrUGpJU0VkaFBp?=
 =?utf-8?B?MEs2Y29MN0JYK3NmRWdVaEJnUG1TajF4TVU2WnVNb0Jsd200YUNtZ3NCNUNN?=
 =?utf-8?B?VWQvOWczNnpEZjE2dk01YnZFVm13Ry8xWTh5VnVRSW9FQ3VNbnMrMVVKcUt5?=
 =?utf-8?B?aUdQQlRkb3ZnMDkvSU0rb1BMSzVoNVhON0JwdTZUVlN3elhFVWRrTXUxZkdF?=
 =?utf-8?B?Mkl3MWNZd0N0RjdrQUxCcDBYOUs5M0t6Nk5tOG9aUnloYjVXRjhka3d2cnVN?=
 =?utf-8?B?MGIwa3FVZmhIVkR0c3ZMVTdHTlBIS2piMnFyOGNIeUlscUZuYm5BVkIwelU4?=
 =?utf-8?B?NFhBamt3VCtQWXdPYitMUW1BSGhyZjJTUDFYTHhtQjNMV2ZLRTRBMmtQNEdE?=
 =?utf-8?B?SThCNEp3Q29iZUVlejZQUFE3M29lTHJXRFh2YlRqUDY0bVhvdGFUb2w5S2kv?=
 =?utf-8?B?NGVTL3dCSHg3V2JqZm4zQXdYTTY1V0MyRDRtVnFtNGlyVS9KRmRvNWRQeTBJ?=
 =?utf-8?B?S3BIMzUzZ2UzRi95YnRGSUMrLzhGWXpOQVJIc3puTWcrUCt2ZEVFVzcyVlFR?=
 =?utf-8?B?dmY3TzQxYkpYYmFQL0xHNVpLdmdYYVlEM2xmZVRYekF3YzNEdStQYlM5Ykdl?=
 =?utf-8?B?MDdrQkRMaUxscExKdkpoOVIrZGY0emlDclNuTGlnVW9hejNJRFNqUm05Nita?=
 =?utf-8?B?czcwczJNTzhBZVk0ejZwZ3BZUCtHZVZiYXZEZkRkaEF6bWNJSUQ3N0N3MzJj?=
 =?utf-8?B?Z1hNakpiQi9hR2NEN2Z5VHU1aHlySmxOR09Vd2wrSVNPV2pTM0hNVm9McU9H?=
 =?utf-8?B?SVk5Z0tMZ3NuZDUvYmJvRXdEdllXak1Yc3kza0NXMy8rTjI2MCtnZExGNG1J?=
 =?utf-8?B?NVdEWEY4ejdwbmhINjQybGhKQUQ1ZHphY05oM0hEUFdUK0owamxPaEpqaito?=
 =?utf-8?B?cFVZWis0blUxN0xMMENVTnRMOHNHL2h3bUYySlFTUEcyUDRaMFdoWFpDTEJw?=
 =?utf-8?B?dk15RmM4UlJLNHhOVXlhWHVyekNzNVZFUzFXSTFWT01RSDE1UE1LYTI0LzdX?=
 =?utf-8?B?eEU2TU5CSXo3cEhnK1h1QUVaamlBVkdYcm5icDMxaThYR0V4YVl2cUlnc2NJ?=
 =?utf-8?B?Vjh1VzQrT1pWK2FzOHZPQ1hOQnB6dzJxNUF2d01TeTB0T3RxN3UzY3E3NU1h?=
 =?utf-8?B?L3RRMzUrTW9mNEJKS0JYcU9ndU1Nd3BZTFVtWDIxR2xjL0JjUldiVmQ3K3Nq?=
 =?utf-8?B?U0FEbzFZWXZKQkNRa3pFY0dnR3ZPMVQ5VzlqQkR3NDRMeFZsKzdvYzY3VUVv?=
 =?utf-8?B?YmF5UmFqcTYzblpFc0FWOEV1anUyQlpVM2hjMEw2am5yMHk4cFdzc0VpUW53?=
 =?utf-8?B?OVNobDc5ZnN3VS9zWkFSdVh6ejB1K1p3L1FCNGlwS1JZUGd4bmRSdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 318b6a7c-8e7f-4140-8325-08de51b225f3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:11:11.9819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+LOqu2cfq2K8Jyv/mtTTQaU9wjFnCymOum+wV7bi2abPOssAmX0LQZcW90if8eMHYD9YwlyE5WQrHa75UizZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
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


On 1/7/2026 3:05 PM, Swati Sharma wrote:
> From: Nemesa Garg <nemesa.garg@intel.com>
>
> NVL onwards there is support for odd horizontal
> panning so add a platform check so that expected
> return value is 0 instead of EINVAL.
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_plane.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index cbc006d7e..ec3245c9f 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1322,6 +1322,9 @@ static void test_planar_settings(data_t *data)
>   				     DRM_FORMAT_MOD_LINEAR)) {
>   		int expected_rval = -EINVAL;
>   
> +		if (display_ver >= 35)
> +			expected_rval = 0;
> +
>   		igt_create_fb(data->drm_fd, 810, 590,
>   			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
>   		igt_plane_set_fb(primary, &fb);
