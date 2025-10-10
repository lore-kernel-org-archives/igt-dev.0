Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C90CAC5BB
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 03:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A561010E042;
	Fri, 10 Oct 2025 03:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzfTmbKc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3CE10E042
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 03:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760068781; x=1791604781;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wrmJhfmsEiEktBwcDcXOHAWn67Yijxdzrr6lJ5itCJc=;
 b=SzfTmbKcP/Sb2nrGUTv43A3z7nt9chxCP4fdMJ3TMgaXIKclJRU/8iMz
 6tBEqQQjNenkJG5ZkzSEqEDKofEUMLiMYc4Jysz8nRbhoLLFg8K3QUaIG
 lnRsJ/wtDjAnchIO/xYJAV1nOR/UWWyfDY7F+pdb4Cac0K+IUxByjobpN
 zBgiObw8myyzZ3UCJgE5d8A44GBJyiMLnzMnsmut1IC77PFa7ZQY/QZ4I
 vUesb8p8Dues2OXnkBcRI1gKa+YlsqAxyHplztOsVVOKgkHB8B7oRjX86
 GrSV+k2XYf0yewk3v5YWJcwoMmYSZ2D1jYT9c92A3OKa5rjbYLtySB2MH g==;
X-CSE-ConnectionGUID: sldNBBInTDeUWhI5DvCL1g==
X-CSE-MsgGUID: ziLxsRpEQO+J6V2uSmz0Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="65937854"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="65937854"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 20:59:40 -0700
X-CSE-ConnectionGUID: 3lIhC+Z4TqWipIwlwGJfEA==
X-CSE-MsgGUID: IpUm6gmXTGCSIGOjwyBLYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="180893356"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 20:59:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 20:59:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 20:59:38 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 20:59:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaxyciYZJ6w7ozA5vaHtF92PlLe6U3TTpQG6joL8JIeNRi4Ge11aoORejEHM5189dk/QRuxbeUQHoxAbNcu0gHSDYJ55Qlumxfg1XrWneRV13r+IMyMrJYG3/2arHi6oYzPZ6qvmorGzwkuOLv9x3Yv6IZcbKgndy04KwbN5YZOp8V/gImuayE21ZVVAk5Vojr4qNkMLtx4i3B2MtGJShKaVpA/pTsULxZUBEVf5gvzv9QO/P6gBSpLJC7iMWk7IUFL7ymgQAdktY7mNV7sD9Dc5jwhfNhcAENhWkad7pcbejXN2RlvEcnnyTod3c1acy8kElV/fDuwgSWl76dBl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0tLYhv8jJk0KNAbInBH0yAUQVVX/kJQBbS/bsdOXgY=;
 b=sSnkMiQuGFO1pR8BFdcsV3iecg2cLU7r1oKWjiZ+p74GUxedwPDz6Otfr6++DbGa4QTy2ZGoIPYh6NsdGKOj4EWK9THH5WHM2d2IBxS6Niyco39rOhF2Bbj3vVD0rqCg6DTzh1Zq3uW2TDW7KSD6AkoE+aESo0MmCARR/ZksZKf76KLCc6AVzBJTxtF5olCMdQ36eOFfo588f1nkosmzKbDiEu0VRjbUeZv7cDSgCp8Rm5wB2T3mDbq9A75LqB6YoVZntFmsdvLTSwlpZk5INv54+1zKUHudHjB4yqLEa1+5ZSKd++wNaFfF/orWIsB0HNqcxZuW6qucihPU7OzijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA2PR11MB5196.namprd11.prod.outlook.com (2603:10b6:806:119::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 03:59:31 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 03:59:30 +0000
Message-ID: <f6de4a3f-60e2-44de-859a-1352bbaa3008@intel.com>
Date: Fri, 10 Oct 2025 09:29:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] kms_max_link_bpc: Add 'link bpc' DRM connector
 property
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Marius Vlad
 <marius.vlad@collabora.com>, <igt-dev@lists.freedesktop.org>,
 <ashutosh.dixit@intel.com>, <adrinael@adrinael.net>,
 <juhapekka.heikkila@gmail.com>, <dmitry.baryshkov@oss.qualcomm.com>, "Swati
 Sharma" <swati2.sharma@intel.com>
References: <20251006080705.2869-1-marius.vlad@collabora.com>
 <20251006095809.7ik5tgd74qi32nuj@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251006095809.7ik5tgd74qi32nuj@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0064.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA2PR11MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e6255e-91d8-4dd2-7ec9-08de07b16a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|42112799006|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzdMWTlxK0crdDJmQlJoV0dGVC9EVzYvVFJoa1VqV3Rab0xBaXZzR2xhZnhR?=
 =?utf-8?B?NGU3cHllVG92MEpNL0puZXdyQURjb0JxM05QQUtveDdrYnJzQ0xXak9rUTg5?=
 =?utf-8?B?YjdKYjJrdGZuVkhBaWNPR0ZhYXZ1dlduQ2x2eDVyZnVLdm5FY1VLem1McDdN?=
 =?utf-8?B?ZnV1SGd0Q3pjSlhvK0s1Y3VQL041WGk4K3FrTXNtbHl4UU9zaEw4YzlTVjZi?=
 =?utf-8?B?V0FJVEpZYjVCaS91LzFqVUZUWTlGUDNEcU1VamNBVlhNeUtXLzZVczdBTmoy?=
 =?utf-8?B?MHVxL2FpU1pSOU5JWjBsc2VhaFBwQlFDcTV2VnZjQnh2ZnRsbXI4blN5RHFP?=
 =?utf-8?B?SXJzM0JPZWFnV0tvUUhOVk95ZGdvdDNrOUtFaUIxU2V1MDkrMFdVeFRkWDVT?=
 =?utf-8?B?enJiTFJ0Nkc3bU55Tzh5MDRHWExRT0dGajNkVFU2OWROTElyYStiSGdJanNu?=
 =?utf-8?B?OHhjbXcwRDBWRWlHYWtXc1hPWHpveEE3Z0NXUGlpQTBCM25RcHl0ZGN4VGJB?=
 =?utf-8?B?WEY5aERSbjQ2cEs4a1F1dXlyeUM1VGRZem5TN3pibUpwdXkwR3NmNmk1THAv?=
 =?utf-8?B?a3Fvb2pVSldYWHdLUjFNeWY5Tis2SzZIaVM2dnZtd1hNVExDc1ZVNkg0L0tN?=
 =?utf-8?B?b09HajRRenhSYUVWZ3hUSVlSNUZ0QzM4bk1STERTMVMrVmNqYlVLZzVmTHhQ?=
 =?utf-8?B?UTRNbmxaZjByUFVuditLZVdRZ3kybHBGWDd0S1RaWTV3azR6Skx2SHR2YzB0?=
 =?utf-8?B?YkFtb293UzlXaWltTUtGaGdrb2tNQ0tGU3hJb3Q1SnVYSmdvOXhWNHRIWEVY?=
 =?utf-8?B?NGROSmk0KzYvN0NFUlpIYng5czBoUTNjUDhBNGY0SlhSSk10ZFpnSlVWNUtn?=
 =?utf-8?B?YmEzNWl1Mjd3bnhyYkUxQkIyUGwvcUFyc2NoVFo2NUxGSnRnNVRTVnJvM1NK?=
 =?utf-8?B?aHhlM1krZmk0dnVrUWtwdzgzdVk4dGEranI1bUJzMDM2WXVaM2FlcDJsSi9w?=
 =?utf-8?B?SmM3TW8zbi82andjblhwdStjOGJXRTNDUjN6QmVTM3VBR3hKS2dpS3VwWUlt?=
 =?utf-8?B?TkFDNGNrcyt3RzFJdktHbVdmai93M2pqeGN4MTRVSzNFV2Y3Ym0vWm4yRlBo?=
 =?utf-8?B?anJROHpwUnE1eXk4UzNaenczT0VHVzcvcE1rQ1EzNURsdldBbGUvaVBoazUv?=
 =?utf-8?B?TXJlUXhFL05sWXVWMmhkWTFpQi92Y0k0ZHZtV09Qamlmcmh3VW9keWxLUGxK?=
 =?utf-8?B?N2EweVdQYmk1WFU5WUo1QmZqc1V0SEsxWHdEb3VkNG5uaGFrU1V0dWtSaDly?=
 =?utf-8?B?c3ZSOEVTamRlZFNQdHFaT3h5aVdXNWFhVzkvd3VsaVhCVGlxVUJCZlpjMnZO?=
 =?utf-8?B?R09UN2kxdkRKbS9HbU1heVhwN1V0T3B5Q3FlVUVORVg4OWdsQktGZDdKM3ps?=
 =?utf-8?B?MnM4S08xK2FLeUhSNzNXZTRGL0Y3TktZYXhkczJGQ0dSRWRTY09oZE4zbUVF?=
 =?utf-8?B?a29aUStpY1BuelFXZUxnMlpzMnlDaUQ3eHlvRUxEaXZ0M1BXY3FZOXo5NEYr?=
 =?utf-8?B?aUI2MndwSEZXaVgwT2NQbnB4MUY4UWNsbUtwdGJMUVU3SjRteENjcDlqWUxW?=
 =?utf-8?B?K09wNEdNLzh0S3hVYUdoUUZ4NTIwelcvV0MrM210QnFzdGYvSTdQd2NSZU1u?=
 =?utf-8?B?RTAvZzFtNHR0S0huUkFDeHhEU2JEZGZQNTlwNk1QWTlDNnFpMWw4YjB6dGlx?=
 =?utf-8?B?N1JpZEVZaU13ZHQyamJTVVdmZy92UDFBMzhWdUU1TmthMmFaVm8rekRSMTVo?=
 =?utf-8?B?b21OM0J1dGdkZ0JFbG80NnBHeEZiVFdpYzFVckFmSzNwN2ZGR25FcWJ3NzN0?=
 =?utf-8?B?emxOUnBOeldQZHRQcXlqdHNya1ZydEFBKysxOUJIZGk1SlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWJnM3QxSjZLcFB3VFdzRGF4V29SdW5mdk5yU3BxeGVpeWVQRXNvUDJKaWFy?=
 =?utf-8?B?dXBzQm1uZER1Y0ZkSTRKcWtNRmhSVUhFNkZqSHJoNXI2L09vMHZqSW9aUDlD?=
 =?utf-8?B?c2JmNWFubW9DSWRJZ1VrZXJjMDBzSVFzeEVNbC8rVkErK0R2cnliNDZqSUJh?=
 =?utf-8?B?MWRQcTNHbHExQ3R2ZkNWejQzRkpSSC9OTkptb3poSC9YUk9EN2hWcTlRbVRj?=
 =?utf-8?B?T0x1VUFVdUJrTWxsK05nMHAwdVozRURDVWRTL3ZxcnI1dnZrak9FZHlDRTQ0?=
 =?utf-8?B?aHFaRDlIV0w5dUtpVHhRaEo2OS8xVi9md3I2WHZnQ3I1bHNaQkRJb2hzL2lV?=
 =?utf-8?B?MTVaZEsrcmF4d3MxdTAzRm9hSUV2d2VRV01GczRjRk9xWTBERElpYTNmOXYy?=
 =?utf-8?B?bGVTWHBVRXRMR2tBak9OdXlqVlByUlBjaXUyclovaTY5Zlh5bjZYeHU5Unll?=
 =?utf-8?B?L250dC81SkpqWHJRMytIVExFOFNaY1RlU1RUb3JzblZBeUsxcXNUYlJNT3I0?=
 =?utf-8?B?K1F4bk9BMHdINXEyTGIxTXJnMWxyMlB4U0MvZlFvZ2ppcjM5MXp2YlF2NlBB?=
 =?utf-8?B?eWVMNjBIZ1V1QkY0VXo4Rko4OFNtYU5sSGYzR2JQNGcwS0llRnNMai9maGVz?=
 =?utf-8?B?VlFyRXBmSTV3YjBvdUFuaXA3NnVQWVpYVHJPa1J4SXdGcmZPWHJ0NmlhMUNx?=
 =?utf-8?B?ZTZIZlZGRko5c3BlT3lZakdWRGsyY1NuSXV2MzVKT1RLVHR1RXhzOWNWRHBR?=
 =?utf-8?B?Wk9uSUVISDczVE80NDJZaUZJVlBYc0JQY3MvL2JTcmpFbTFzMFhqUVc3Z3Jm?=
 =?utf-8?B?Vm5zYnFEV2puQ0o4OXppRzJxdHJPaGdLYlNWSURkYUJNQmQ4SW9Ib052N0Nh?=
 =?utf-8?B?TGU0ZlVQWllVQ1lGT2JJa3htRzhpemsvK05FNVNna3hZS2xSZUtSZjBOMWtD?=
 =?utf-8?B?Z3VTUWk0ZXBYYklpUVFVSHZIWDBuRkFQOG1FTUZmWWpwcys0TkNNdXFacU45?=
 =?utf-8?B?NVpCQWNnRVhHVzBHMC8ybHd5VmxhU1FvdzlacWtGT0JjNmJvTlpCMmN1Z2dR?=
 =?utf-8?B?R1dPOEFSUGZGVHNEMzJBL1Y5bENUMkk2eW9XSlJVUVcyQ0RpV1FXeUNxajZa?=
 =?utf-8?B?YVAra3g4c2UydDVnaEN6RmNxdzdQWkNNRUozUWpYT1YzN2FvRUkzWE5Jc0Ew?=
 =?utf-8?B?OHplK3hiZWlzdkh1TURRdktRN25QRnBtUytINzF5UnlJbzhQMUtuR1dxOHFI?=
 =?utf-8?B?K1IzTDYrRlg5SmFMWG1YR2NlQmltRDFOK0FLbXg0R1lMdVZkRjFwaGVJa3Nj?=
 =?utf-8?B?OW84dC9PTldQcmRpeUVuZE5PVjlxYm14Sis4dUUraTdGbXhQSFhwVXdjdG1E?=
 =?utf-8?B?WjQ3c01SRXN4bHEvaW05YUVFb1gyMUNJZHo2WjNkd0M1S3dRbG92S3JYQkdr?=
 =?utf-8?B?dHpsUkFDenNmVDlINEpOamdJYmRMQ3ovWHJpRWdqRmlvTCs2Nm5ZdUt0VHUz?=
 =?utf-8?B?ZmFuaTVaa2lLUURZbGUwWElxbTZFaGFQN21KamREcVBlMGZUNmVUbDRzYlN0?=
 =?utf-8?B?SUNFRGtnOG1SS3R1WVFHZUxYWSttV1h0Z2ZjYllvSE1jeGZmeHR6MzM5Z3Nk?=
 =?utf-8?B?ZlBvb05xeVNhT29VSFRLQ1A3SnVLWC84U004WHB1Qm8yNUsySTltbWhPRGkr?=
 =?utf-8?B?MW1yWjd6cytPOFIyYlNxcVl6QnRuZytJSS9ZbkU4OVNoYjVmR2JOaFZuRytV?=
 =?utf-8?B?bnYxS0ZhaEZjd2FPeFNPUzR2Q0VjMTVreml6S01reUg0TERUTWVja3czZXN1?=
 =?utf-8?B?M1g1RHBRbmF6aG1JT01zRWtlWVkwTk5aQm9MNWZlVE91Y1hMNWZyUFJkRnND?=
 =?utf-8?B?OGM4NThyeGRvQ3ZQbVlETmttWFJaM3pZWHpZWVFRK2dqTytob1JMNnlCVUFl?=
 =?utf-8?B?MWd4WGFUQ3ZSZlZleXNsT0o5cjBxTDVnczhMekpiN09QY090cVNjb1d1Y1hh?=
 =?utf-8?B?UXhFRkUvbmpFS29OU1VXUkErdTFWOHpwUnd4WnIwS0ZPYXRhS2FPZi83cFha?=
 =?utf-8?B?NllpczJsd0E5YkMwdlV3VUhFeUZpQ2l6WXA0c05oZUJlMDhmNWFMcGVUL0Zt?=
 =?utf-8?Q?nu/SNKyOTKkhniA6UOTM/px9W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e6255e-91d8-4dd2-7ec9-08de07b16a09
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 03:59:30.7283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELx9IoyH6r0IhiZ2+i2hY5KgfRLWK86DrX8kx+dPmwMSmUquDVVOUQ4/1edI20cnnpJslELea+aere1HE6EdsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5196
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

Hi Marius,

On 10/6/2025 3:28 PM, Kamil Konieczny wrote:
> Hi Marius,
> On 2025-10-06 at 11:07:01 +0300, Marius Vlad wrote:
>> We can make use of 'link bpc' -- assuming that's available, to determine
>> the current physical bpc used by the driver on a particular connector.
>>
>> This adds support for the DRM connector property and adds a simple test
>> that would set-up 'max bpc' followed by reading back the 'link bpc'.
>> Test expect less or equal than 'max bpc'.
>>
>> kms_vrr, kms_hdr or kms_color assume CRC support  and all make use of
>> debugfs to query 'max bpc', while this test will get the actual min/max
>> values from 'max bpc' without the implication of having CRC support.
>>
>> A more thorough test would be to come up with a way that's known to
>> lower the bpc value to an expected one but that's left for another time.
>>
>> Reference: https://lore.kernel.org/dri-devel/20250801101750.1726-1-marius.vlad@collabora.com/T/#u
> +cc Karthik and Swati
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
>
>> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
>> ---
>>   lib/igt_kms.c            |  40 +++++++
>>   lib/igt_kms.h            |   4 +
>>   tests/kms_max_link_bpc.c | 225 +++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build        |   1 +
> Please split changes into lib/igt_kms and a new test
> tests/kms_max_link_bpc
>
> Btw why not a shorter name: tests/kms_link_bpc
>
> with one subtest basic-max-link-bpc
>
>>   4 files changed, 270 insertions(+)
>>   create mode 100644 tests/kms_max_link_bpc.c
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index df4a96a17..d00b85a96 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -732,6 +732,7 @@ const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
>>   	[IGT_CONNECTOR_WRITEBACK_FB_ID] = "WRITEBACK_FB_ID",
>>   	[IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR] = "WRITEBACK_OUT_FENCE_PTR",
>>   	[IGT_CONNECTOR_DITHERING_MODE] = "dithering mode",
>> +	[IGT_CONNECTOR_LINK_BPC] = "link bpc",
>>   };
>>   
>>   const char * const igt_rotation_names[] = {
>> @@ -6261,6 +6262,20 @@ unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name)
>>   	return maximum;
>>   }
>>   
>> +/**
>> + * igt_get_output_link_bpc:
>> + * @output: Target output
>> + *
>> + * Returns: The current 'link bpc' value from the connector property.
>> + */
>> +unsigned long int igt_get_output_link_bpc(igt_output_t *output)
>> +{
>> +	if (!igt_output_has_prop(output, IGT_CONNECTOR_LINK_BPC))
>> +		return 0;
>> +
>> +	return igt_output_get_prop(output, IGT_CONNECTOR_LINK_BPC);
>> +}
>> +
>>   /**
>>    * igt_get_pipe_current_bpc:
>>    * @drmfd: A drm file descriptor
>> @@ -6346,6 +6361,31 @@ bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
>>   	return (current == bpc);
>>   }
>>   
>> +/**
>> + * igt_assert_output_link_bpc_equal:
>> + * @output: Target output
>> + * @bpc: link bpc to compare with
>> + *
>> + * Assert if outputs's current link bpc is not matched with the requested one.
>> + */
>> +void igt_assert_output_link_bpc_equal(igt_output_t *output, unsigned int bpc)
>> +{
>> +	igt_assert_eq(igt_get_output_link_bpc(output), bpc);
>> +}
>> +
>> +/**
>> + * igt_check_output_link_bpc_equal:
>> + * @output: Target output
>> + * @bpc: link bpc to compare with
>> + *
>> + * Returns: True if outputs's current link bpc is matched with the requested bpc,
>> + * else False.
>> + */
>> +bool igt_check_output_link_bpc_equal(igt_output_t *output, unsigned int bpc)
>> +{
>> +	return (igt_get_output_link_bpc(output) == bpc);
>> +}
>> +
>>   /**
>>    * igt_max_bpc_constraint:
>>    * @display: a pointer to an #igt_display_t structure
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index 6ef6871d5..04dcd39df 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -191,6 +191,7 @@ enum igt_atomic_connector_properties {
>>          IGT_CONNECTOR_WRITEBACK_FB_ID,
>>          IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR,
>>          IGT_CONNECTOR_DITHERING_MODE,
>> +       IGT_CONNECTOR_LINK_BPC,
>>          IGT_NUM_CONNECTOR_PROPS
>>   };
>>   
>> @@ -1234,11 +1235,14 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
>>   bool igt_fit_modes_in_bw(igt_display_t *display);
>>   bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
>>   unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
>> +unsigned long int igt_get_output_link_bpc(igt_output_t *output);
>>   unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
>>   void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
>>   				char *output_name, unsigned int bpc);
>>   bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
>>   				char *output_name, unsigned int bpc);
>> +bool igt_check_output_link_bpc_equal(igt_output_t *output, unsigned int bpc);
>> +void igt_assert_output_link_bpc_equal(igt_output_t *output, unsigned int bpc);
>>   
>>   int sort_drm_modes_by_clk_dsc(const void *a, const void *b);
>>   int sort_drm_modes_by_clk_asc(const void *a, const void *b);
>> diff --git a/tests/kms_max_link_bpc.c b/tests/kms_max_link_bpc.c
>> new file mode 100644
>> index 000000000..f5e2006ab
>> --- /dev/null
>> +++ b/tests/kms_max_link_bpc.c
>> @@ -0,0 +1,225 @@
> Add SPDX here.
>
>> +/*
>> + * Copyright © 2025 Collabora Ltd.,
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
> And remove text from here as SPDX raplaces it.
>
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice (including the next
>> + * paragraph) shall be included in all copies or substantial portions of the
>> + * Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + */
>> +
>> +/**
>> + * TEST: kms max link bpc
>> + * Category: Display
>> + * Description: Test 'link bpc' connector property. 'max bpc' gives the
> Add also what BPC is (my guess: bits per color)
>
>> + * possiblity to set-up the maximum value but there's nothing to rely on for
>> + * the current physical link value, as drivers could downgrade the bpc value.
>> + * 'link bpc' can be used to get the current physical bpc value
>> + * Mega feature: General Display Features
> Karthik or Swati: do we need more fields here?
No, this is sufficient as this test is agnostic of xe/i915.
>
>> + */
>> +
>> +#include "igt.h"
> Move igt headers after system ones, also with one newline
> separating them.
>
>> +#include <fcntl.h>
>> +#include <termios.h>
>> +#include <unistd.h>
>> +
> Here should go igt headers.
>
>> +/**
>> + * SUBTEST: max-link-bpc
>> + * Description: Verifies that 'link bpc' is at least the set-up value of 'max
>> + * bpc'
Isn't it the other way around? "igt_assert_lte_u64(link_bpc, range.max)"
>> + *
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Test 'max bpc' and 'link bpc' connector properties");
>> +
>> +/* Common test data. */
>> +typedef struct data {
>> +	igt_display_t display;
>> +	igt_plane_t *primary;
>> +	igt_output_t *output;
>> +	int fd;
>> +} data_t;
>> +
>> +typedef struct range {
>> +	uint64_t min;
>> +	uint64_t max;
>> +} range_t;
>> +
>> +/* rather than using debugfs to get max bpc or current max bpc
>> + * use the actual range */
>> +static range_t
>> +get_bpc_range(igt_output_t *output, const char *prop_name)
This function should be moved to lib, IMHO.
>> +{
>> +	range_t range = { 0, 0 };
>> +	drmModeObjectPropertiesPtr proplist;
>> +	drmModePropertyPtr _prop;
>> +	int drm_fd = output->display->drm_fd;
>> +	int conn_id = output->config.connector->connector_id;
>> +	int i;
>> +
>> +	if (!prop_name)
>> +		return range;
>> +
>> +	proplist = drmModeObjectGetProperties(drm_fd, conn_id, DRM_MODE_OBJECT_CONNECTOR);
>> +	if (!proplist)
>> +		return range;
>> +
>> +	for (i = 0; i < proplist->count_props; i++) {
>> +		_prop = drmModeGetProperty(drm_fd, proplist->props[i]);
>> +		if (!_prop || !(_prop->flags & DRM_MODE_PROP_RANGE ||
>> +				_prop->flags & DRM_MODE_PROP_SIGNED_RANGE))
>> +			continue;
>> +
>> +		if (strcmp(_prop->name, prop_name) == 0) {
>> +			igt_assert_eq(_prop->count_values, 2);
>> +
>> +			range.max = _prop->values[1];
>> +			range.min = _prop->values[0];
>> +
>> +			igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO,
>> +				"Found %s property with min %lu max %lu\n",
>> +				prop_name, range.min, range.max);
>> +
>> +			drmModeFreeProperty(_prop);
>> +			break;
>> +		} else {
>> +			drmModeFreeProperty(_prop);
>> +		}
>> +	}
>> +
>> +	drmModeFreeObjectProperties(proplist);
>> +	return range;
>> +}
>> +
>> +static void
>> +run_test_bpc(data_t *data, igt_output_t *output, range_t range)
>> +{
>> +	cairo_t *cr = NULL;
>> +	igt_fb_t fb;
>> +	int fb_id;
>> +	unsigned long int link_bpc = 0;
>> +
>> +	fb_id = igt_create_fb(data->fd, 512, 512,
>> +			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
>> +	igt_assert(fb_id);
>> +	cr = igt_get_cairo_ctx(fb.fd, &fb);
>> +
>> +	igt_paint_color(cr, 0, 0, fb.width, fb.height, 1.0, 1.0, 1.0);
>> +	igt_paint_test_pattern(cr, fb.width, fb.height);
>> +
>> +	igt_put_cairo_ctx(cr);
>> +
>> +	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +
>> +	igt_plane_set_fb(data->primary, &fb);
>> +	igt_plane_set_size(data->primary, fb.width, fb.height);
>> +	igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
>> +
>> +	/* set to range.max */
>> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, range.max);
>> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +	link_bpc = igt_get_output_link_bpc(output);
>> +	igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO,
>> +		"Setting max bpc to %lu, link bpc is %lu\n", range.max, link_bpc);
Please use igt_info() here.
>> +	igt_assert_lte_u64(link_bpc, range.max);
>> +
>> +	/* FIXME: do a potential modeline change to determine a bpc downgrade
>> +	 * which should be followed by a check for
>> +	 * (igt_get_output_link_bpc(output) < range.max)) */
>> +
>> +	/* set to range.min */
>> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, range.min);
>> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +	link_bpc = igt_get_output_link_bpc(output);
>> +	igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO,
Please use igt_info() here.
>> +		"Setting max bpc to %lu, link bpc is %lu\n", range.min,
>> +		igt_get_output_link_bpc(output));
>> +	igt_assert_lte_u64(link_bpc, range.min);
>> +
>> +	/* go back to range.max */
>> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, range.max);
>> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +	link_bpc = igt_get_output_link_bpc(output);
>> +	igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO,

Please use igt_info() here.

Regards,
Karthik.B.S
>> +		"Setting max bpc to %lu, link bpc is %lu\n", range.max,
>> +		igt_get_output_link_bpc(output));
>> +	igt_assert_lte_u64(link_bpc, range.max);
>> +
>> +	igt_display_reset(&data->display);
>> +	igt_remove_fb(data->fd, &fb);
>> +}
>> +
>> +static void
>> +test_bpc(data_t *data)
>> +{
>> +	igt_output_t *output;
>> +	igt_display_t *display = &data->display;
>> +
>> +	igt_display_reset(display);
>> +
>> +	for_each_connected_output(display, output) {
>> +		enum pipe pipe;
>> +		range_t max_bpc_range;
>> +
>> +		if (!igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC)) {
>> +			igt_info("Output %s: Doesn't support \"max bpc\" property.\n",
>> +				 igt_output_name(output));
>> +			continue;
>> +		}
>> +
>> +		if (!igt_output_has_prop(output, IGT_CONNECTOR_LINK_BPC)) {
>> +			igt_info("Output %s: Doesn't support \"link bpc\" property.\n",
>> +				 igt_output_name(output));
>> +			continue;
>> +		}
>> +
>> +		max_bpc_range = get_bpc_range(output, "max bpc");
>> +		for_each_pipe(&data->display, pipe) {
>> +			igt_output_set_pipe(output, pipe);
>> +			if (!intel_pipe_output_combo_valid(&data->display)) {
>> +				igt_output_set_pipe(output, PIPE_NONE);
>> +				continue;
>> +			}
>> +
>> +			igt_dynamic_f("output-%s-%s", kmstest_pipe_name(pipe), output->name)
>> +				run_test_bpc(data, output, max_bpc_range);
>> +		}
>> +	}
>> +}
>> +
>> +igt_main
>> +{
>> +	data_t data = { 0 };
>> +
>> +	igt_fixture {
>> +		data.fd = drm_open_driver_master(DRIVER_ANY);
>> +		kmstest_set_vt_graphics_mode();
>> +
>> +		igt_display_require(&data.display, data.fd);
>> +		igt_require(data.display.is_atomic);
>> +		igt_display_require_output(&data.display);
>> +	}
>> +
>> +	igt_describe("Tests 'link bpc' being the at least 'max bpc'");
>> +	igt_subtest_with_dynamic("max-link-bpc")
>> +		test_bpc(&data);
>> +
>> +	igt_fixture {
>> +		igt_display_fini(&data.display);
>> +		drm_close_driver(data.fd);
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index a7b9375ed..e948c5c3c 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -32,6 +32,7 @@ test_progs = [
>>   	'kms_cursor_legacy',
>>   	'kms_debugfs',
>>   	'kms_dither',
>> +	'kms_max_link_bpc',
> Move it to proper place to keep list in alphabeticall order.
>
> Regards,
> Kamil
>
>>   	'kms_display_modes',
>>   	'kms_dp_aux_dev',
>>   	'kms_feature_discovery',
>> -- 
>> 2.47.2
>>
