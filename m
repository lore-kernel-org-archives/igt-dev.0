Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB5DC87FCB
	for <igt-dev@archiver.kernel.org>; Wed, 30 Jul 2025 06:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C5010E409;
	Wed, 30 Jul 2025 06:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WX2gxpgj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020A810E409
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jul 2025 06:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753858719; x=1785394719;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ABdXDWecn7jw9+HTwANmh9jlRVbQw2JQToFDQoVmlSQ=;
 b=WX2gxpgjBH/OMDrtRcVe/4SZEk+HauzOnr/1NBTe7R5wX+X5CBz4cswH
 VD9bykuEgZmjAzqtyPQ65T+6HSYpKF2LNPrU7+znq6RNiBnPu7fq+xJWS
 er7NWT+udZb7HP0RG/3QFqtPV3lbVFrrNPNAj+2m9dGsfY5ZcWLfSDalk
 EbRMM5hmc6VqG+SGnhmDMZFLf9CXa1pp6mnFvKxBRmAbDuj/+CgZJE3OW
 5fR+ob5t5yLAeRtJ7sXj2mZlkwN9lbo1LEdYWokmbZpGzyTVsReaePwm0
 nn7ILOZMcQdF+NmiU6AJjKRRfyHe9K9WjfHdqCApgpo3Amhv5Lh3+djJH w==;
X-CSE-ConnectionGUID: XR3Kgf1gTVicEWAx9qYSjQ==
X-CSE-MsgGUID: U7Hl75P9RJi+u9pQv20PWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56227965"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56227965"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:58:30 -0700
X-CSE-ConnectionGUID: BTi++GPDRCCB69WiG8p5zw==
X-CSE-MsgGUID: v0QUs3VMQ3GqcDY0LCzWyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="200089574"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:58:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 23:58:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 23:58:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 23:58:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOvrh18jKV3IKU0pSLGsnmw9OMAXJ6DGl1eUOdZWTeUQMTABcag+MQjXk/JQ5PRYUKlcDEKQgC9uW/LRm+7z4zJxsO0iNHsJ+xd80Hxrar2WLCWVqFzRcWDF9Ft92YoN2MjtO61g1Fyo+SDxada4yiASMMizzeZWuozdYja4PQyNxDQG2bZR8bMwZsIkeZ4h+N2spIxtzvyWTp+9vpHtswR8G5IjhaPRSzTZCkjr1rnDPsMnlVmDgaRsivqRCy76EAT/p7elKrZZUo3uDgyVfHQBvsV3Lu3AigtSoSkJposXnGehffQS7mjB7xdW6NGzh4KoYdHmDFg2mRLCjXH1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vGIuHHd4fZKfByagWqPmUTZn6dwUF7qr5zctrJ5UAA=;
 b=LzW4536Q6H7090Ni08Xh0f/XF15d96HIX57m+GN5VKk//TxEkKFr9mEMC5E9o+igo+zsZEQjedlI71J920mupX/uQ1YMKXl1jtK5Y/DCdEqpAnvrj+X+CRelnMUJb49oWihsviQHDEcCMFhycrf1cdWupS9HrHzFjI7TaOkX+YH2Y+C1uwqzDITcdjbscPB9ytmmDEzoiQHc45XfJIGjLOgHFAEKc4cm+V/IjjBGFx30MjA/BCMHUeboT5b+uhWcchAv24QUX1GSH0uw6A7Nzj+HjhWhQ7tjBWOGeFPkVi7Gtt3SeqafQXVcrslcYa6IOzAIArNV3nq3RUOC4w3i+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by BL1PR11MB5319.namprd11.prod.outlook.com (2603:10b6:208:31b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Wed, 30 Jul
 2025 06:58:05 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%6]) with mapi id 15.20.8964.024; Wed, 30 Jul 2025
 06:58:05 +0000
Message-ID: <272c6c41-0ed2-4b93-9f22-ee77b6c695b8@intel.com>
Date: Wed, 30 Jul 2025 12:28:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/xe_gt: Assertion related to
 xe_gt_stats_get_count
To: <priyanka.dandamudi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250729054703.3323716-1-priyanka.dandamudi@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20250729054703.3323716-1-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|BL1PR11MB5319:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7c7618-278d-43bb-b276-08ddcf366e9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MG80MlJ4UHQ2NjVYdDdYRlNHNmd1My9DWjl2T2ZVT2NnVC9LR3RyOVQ3Ynk4?=
 =?utf-8?B?NDVJWGRqeG0rOXJjUUVXeGp0bzZzK2J3NjN1U0ZJWnBYNGdQL3BRNmkrT2FW?=
 =?utf-8?B?T05zTEZGMzAwNjRRVGRBU0hjNWwzK1dzVTJ6ekE4Ym1ZaXdFaTNaTHNqNEhV?=
 =?utf-8?B?QzRuT1Jrb1RGTEVRd3lhakxONDFEOEg5NWQ4RHUxZzZmcWltQ0JxV2ZvY3hD?=
 =?utf-8?B?c3RpQUxmYW9STGZJcE8vSHRsaUhPVGVmalZBZjhSY1hVY0NvVGg5amNvZW1h?=
 =?utf-8?B?aWZlakFMMzl3SlZXUm4wa0toa0lmWGduaytwSWRsRWNvaHk2alBzTHhNQ1FH?=
 =?utf-8?B?OXc1ZFVuUmFQbHRIcml6OWd1RU1lRGtLcTBCTUZEdzkrK1FJUy95UHpRR1VN?=
 =?utf-8?B?eENHbUVrQTd0Z1RuQ3dqVTJGOHByNktLYXBaVGlvcWdZZDc1eEhRY3owQjdP?=
 =?utf-8?B?eUJPRlAyZXRKSm52L1Y0NmFua3RsM3J1SWx3YmRWTTRHclE0MHhNQzhtTGRw?=
 =?utf-8?B?cTc2UGJ5SnBmV2J2UlBkeWZlNUo3cVV0V1NPV0w0b3NCN1hhWk5TT2htYUpu?=
 =?utf-8?B?cVpCYkJaQ0szR2lIcG9TbWJIUC9BTzhHVGVOWDZVUFl3eDU0aGo2WVBCQVpx?=
 =?utf-8?B?WTlhTlUvRStkMjBOYUt2cGxCUjdvVklNVFdWUEs2RU8rb0FCeU9VRFBjRnB2?=
 =?utf-8?B?Mk8wdnpJNHhtT2FEUGhWbEh5UVdJRVJGRFJtTkE4empHZGZWQk1hOGVKbUFF?=
 =?utf-8?B?M2pMYUhxeGhhait4TlRhQ2hvUXNPaVV0Ry9HdHEySjM1cUcySjRuN3dzbGF0?=
 =?utf-8?B?M1J4Vm1EaXFpemNrSjdzZVlYVEhLUUIxVXduUGFDdEQrNy9nMFRFSEw0aWkr?=
 =?utf-8?B?R2YraEhEaURreTMrelZaczljakRYM0FEc0NQcG85TFUyeVhkT1ZzclNtYWVS?=
 =?utf-8?B?Z2wrRzhTdjBtSzFhQUM3VU13WHorYUgxYkJEUU1SWVpiQ3QwbGpoZlRZQUVL?=
 =?utf-8?B?TEpYbDk0bXZUTkRDdGw4L2JnSlVTaHJwTk5oODJvU0w1MXpJMFZXbi9EdG9V?=
 =?utf-8?B?SFd0K3lQN3BaRFljS3pydm52UWxoRGdjR3hicGRqcThHalZvMkxQMUd2V2Nl?=
 =?utf-8?B?VTArdzYzayt0OGIydzZ5NkNpaEw0b3JUL1NWbzN2a2lyUFJ2ZUVVZEkrNUJS?=
 =?utf-8?B?bnkwamJ2a2NTWkpDV3FXOG5pOXVDdFlEcjJKTnJWVjdPbjNEM2hyTERYQnpm?=
 =?utf-8?B?Yzdvcmp2SUdDYWpHODFFTEdISkxyTWx3OGpiMytXVWtSRHR2eHNVT2ZrcHdJ?=
 =?utf-8?B?RGxEaXVpaUJ5c0pUWGtGUmNud1BYdzVqdGFJS3RDN3I0azRWaHhueTFLcE1I?=
 =?utf-8?B?WjZMQ0ZONU1BeXZuM0RqUnVkZWsvSzBKZTNZTjBhVHJSVEJHR21COFVIU2RQ?=
 =?utf-8?B?V3plZnRsTzZJUkFDOVA1K3FtK01WUmE4aXl3L29yWlNnaktBT0JPOUw5WnRu?=
 =?utf-8?B?YWRWVDA2OTYrT1NndjFMUXAyTXFSNkVMeGhUcmoxN2dwc1VLMlZRcTYxMisy?=
 =?utf-8?B?QTNnU0V4SkZucjAzM1dlZFM3UC9Tell6M3JTbmFQQXl0UWhZa1oyZU9GbDdh?=
 =?utf-8?B?RnhRblJFVm80NFdUSjFtbytYKzl6SlRXeHIzZTByRW5hMGc3dFJrL3gvQ0F3?=
 =?utf-8?B?YXV0RHFMaHZxNnl5eTkrZ1JDSy96QjA4NEpLRlZoNUVxUS9zZkN1bFYybHVQ?=
 =?utf-8?B?aDZRTDVYMmJsTnJQd2lvKzZsWTJpYW5xTy9heWhCV2gyVVpYZWx4Ym4zcTdn?=
 =?utf-8?B?U1loUExvc2QrZHhzY1ZvM3F0UWZUKzY5OUpibU1HeDV0WW5iSXlRTCtQeHZF?=
 =?utf-8?B?YmRFeEtuNlZXS2t5bHhNS3Y5NHlobm9RR0hOdVhrb0s3NkV6Zk5pWFo0SGNZ?=
 =?utf-8?Q?31CX5kzaEWg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dCtTZGFJTjRyZ01TTSs5YW43ZFZMWmNteDNqZzk3SDloWHB3UnJtdUZGdzk0?=
 =?utf-8?B?N1VnNFNzVUFGVTBraFZTNU4rcHlQaFF1bHZJVXJxSk45djZJV0dpalZXRUtV?=
 =?utf-8?B?bEFuandrWUJmOFdBL3NqY2FoSnQ3ek9Qcmx5N0p4RHVMUUVKYXBJek96eDdW?=
 =?utf-8?B?VlR5VzN2c1BWQ0QwalF6anJSVFBMTmgveDFlS0dBTjg0cHpIVkJCZEkzOUlO?=
 =?utf-8?B?WUtiSktUNkJJejIvcERhUkJzblV5TTZJaGxrN1E2Qy94VnZJRDJmZVFIQnJ5?=
 =?utf-8?B?bHNBQllkR3NMYWlSRUlURXRMNlhLbFROa28wYTFCeDMwK0trSVAvMmVyZ2JP?=
 =?utf-8?B?SktXN3pjYTI1cVZ2TDlncWhSRVpkTm05YWFra3ZQVjdSZ0FPNVdoeU1wWVBt?=
 =?utf-8?B?VHUxeGVXb3ErMjFLRFRJRXhvTFZjZUhhSGRJUFVkdlUzUjVpbDhSUlNiZHVu?=
 =?utf-8?B?L3drQ2F4by9PTGo0ZTljdXBzVkkzUzNqSDhCb3ptQzV2WldwT2p0VUhQYlhF?=
 =?utf-8?B?Umc5eW5zTnoyYkhER2ZYa2JFMUhBM1ZZYlVseHlocG83Z1F4ODR6NGlVMWFD?=
 =?utf-8?B?c2RBMW16ZHRFTzR0d1EyL0pkL0NDTGZjVXlwZG5DczJPa2pCQTZoVmx6L2kr?=
 =?utf-8?B?S3lJc2ZlU0QxUFFJbW51NEczNmZ4TCtUUG5RTWorZ1pzL21nb0pRcERYZ0Vn?=
 =?utf-8?B?a2VUeEs5OVRFWU5ZWlp3d00zMmcvM2kwMDBOdm54dXAydnVlSkFETERBd3A2?=
 =?utf-8?B?ZjNTWEFMMDdzbm9tZkt5NzZZaXptbzE5NlF1cUxKaFQyQ0cvMnk4UlFheDBV?=
 =?utf-8?B?MXRkdERtVDAzYkNDQklzZDBUeVhiUERzUWcxUk1rTzFCMnFzMHorWUxxWGxk?=
 =?utf-8?B?eDQ5V25QOXc1MFBNTEdlbDNydWZEQ0hsWkZkbER0cU1pdDR4U212U3NtZDNR?=
 =?utf-8?B?cUpyN1Y3MlExdDhJWklJTzNzdTZCSDhZQXJPczYybFVlQTBkc2VlTEpaMWdL?=
 =?utf-8?B?Qk5FSE1RekEyaWpGd2tPK3VtVlNDb1lzWmxxVjkyYWQxeURsU1owVzhuZmJG?=
 =?utf-8?B?ZDN2aHlDbit5NjlsY2NzZmYvTGhCc1dLbUF3WHFXWnhYQVZaa0dkZXdLTWpw?=
 =?utf-8?B?MEUwTEYvVkFlWkdSRDl0cXpkd1Q1Z2hBcS9HMXgrdU5PZ3Ridk11dDhTeGFR?=
 =?utf-8?B?cEYzWGJ5elJ3SG9qMW1haWN4blBrWFRQQVFTd1BtRnVGYW13VnBkTE1JeXlM?=
 =?utf-8?B?eUpvWlEvK0NJdEZONE1ROWlwYUxnL2hkNDQrQ0I0dUkxOG9sRkRqbkFPLzFI?=
 =?utf-8?B?ZERndUtkclZ6TFBJV212amRjaG5UQkxEUFlhcHV0a2hyZjZKb0VHUDRTdkM4?=
 =?utf-8?B?T1BhV3NreU1rNXN2YThrTGk2VkJJQ3Z3L3pObFYxVlFTOVZTRTd3SHB6NVhO?=
 =?utf-8?B?S0JJTnlUTG41MkkzTkQrZmg1cEZzUlgrd1JVa2lBR3ZmWE9xUXUwQ2JTbnN0?=
 =?utf-8?B?UUFpNnNpVGIyVXgvYjI0MUpXbHZmaVZoVE54STFLUHdxUkFFZkZPK1JWNWt1?=
 =?utf-8?B?c3hCS0FGRDhENTdWZ1pYRWI3QWdNYjV0ckR4VFlQaTlhYzFIL3lFSEIwMEdU?=
 =?utf-8?B?T2oreFpGc0RwdHBrYzVZdTZWYVdIczFTOFRhMXFpWjdudFFkbjQvekg1Sm9U?=
 =?utf-8?B?SnpsSTBvL1pTZFZPQzF1RWVGd3VjQ3AvR3lyaTJlSEtrUW1zUFRGUE45Rnp4?=
 =?utf-8?B?SXY4Q1p2OVc5RkRWQVp5Rnl4bkZUT1JSMW9CUnZWU0JvVUZwdisrWHZ3dkdC?=
 =?utf-8?B?N0tlaUhsOC8rM0xvWkVxcG8wUWtOODE1Uk14aS8wRG1kN2FNZHA1empIaXZ0?=
 =?utf-8?B?MVRWaXNYQzJlYTVKNFNmMkFaRU1jWS9SQUZRL1c2UFRxL0FMU1NXaHJBbUY2?=
 =?utf-8?B?OVBhbFNLRWhYbkJNWEpuaThpWHNmMGdNZTVWb1VNbld1dW9CQTAyeFZwTEVv?=
 =?utf-8?B?M01PRmo5N2lydnIvbGVUMWl1bFVvc1IySHFHcytSZStpZk8vY0NlT0J4Ylpp?=
 =?utf-8?B?Z3JFMXpqRmo4UjY4R1A5Y3gybno3ZUFrZU53U3dYUzRpMjY2bHBrS3BxT3hN?=
 =?utf-8?B?bmN5Y05QajlnU01ZbEl0cjlDWENpS3YvUENQS3ptaVZaMWxiN2VEV1RXcW05?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7c7618-278d-43bb-b276-08ddcf366e9c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 06:58:05.0895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjzQguvEKJTM8ep4mflg09HHVkxuldcmeI1q8fgbqNZlluW8YRysnfGzkrYPYgw0QOC1O+U6hqeRh/qp6E7ZTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5319
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


On 7/29/2025 11:17 AM, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
> Currently, when the specific gt stats file is not found, it fails with
> an assertion. Due to this the test using this function also fails.
> In general, this lib function is just to count the stats count, test
> using this need not fail.So, now the function will warn the failure
> when file not found and return -1 as count.
>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>   lib/xe/xe_gt.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index afb757bfa..ed19bec74 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -185,8 +185,11 @@ int xe_gt_stats_get_count(int fd, int gt, const char *stat)
>   		minor(st.st_rdev), gt);
>   	f = fopen(path, "r");
>   
> -	igt_assert_f(f, "Failed to open /sys/kernel/debug/dri/%d/gt%d/stats",
> -		     minor(st.st_rdev), gt);
> +	if (!f) {
> +		igt_warn("Failed to open /sys/kernel/debug/dri/%d/gt%d/stats",
> +			 minor(st.st_rdev), gt);
> +		return -1;
> +	}
Looks fine!
>   
>   	while (fgets(tlb_path, sizeof(tlb_path), f)) {
>   		if (strstr(tlb_path, stat) != NULL) {
