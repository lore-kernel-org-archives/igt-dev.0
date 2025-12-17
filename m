Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C16D64079
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 07:01:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BD710EB8D;
	Wed, 17 Dec 2025 07:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h6YeWvdH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F95C10EB8D
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 07:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765954868; x=1797490868;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qDjuBoFVIoFQyGf1O1lM8Ar2AepDj/bQV6YhRjqvNPI=;
 b=h6YeWvdHDozmnbM0V50vb+EEknHupi6md3cebTsrAzwtF7hNTrjGyjQ5
 6y1CKHCyIfuzhn9kLR1bARhNhyUTpwhKj1acfmjddwhkDpDuEoT9bOAIJ
 cNxYX87zdh5BOwXpA+MAIfUlTH2Uh2+4y0BZFsCfW7OomQ7sgBdMMM7oH
 I9nxpVOSfXCcShC+KRiVvfW2MKCI5tS7OZVGCINJiMneI2lh/9MY4roTN
 ZW4vmTyxW5qs5vohcy2Sy/pUnLEoSgF6a1ksyHA9h4md5VS3T0TgCvgqk
 eEOOpKu3TW5Jvtw6EjPhmmH+7guX11vQ5ParifVOMNHjW2VU7c/FApYWw w==;
X-CSE-ConnectionGUID: W0eCZ2stRDG3z+brkHdkEg==
X-CSE-MsgGUID: PVLwfUGZTFSV+Voh/bsa5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71516368"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="71516368"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 23:01:08 -0800
X-CSE-ConnectionGUID: 4sw0IBP8Tey7WiB3UxPIUw==
X-CSE-MsgGUID: L1Pk9Xm/TB+HRgN3vbqTRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="199034401"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 23:01:08 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 23:01:07 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 23:01:07 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 23:01:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xh+LZBaS8k0HBFLMrrkLifkOD9aP6QcWqMUt7JLPV9eTCjqeAb9vDMrR8NztIAqvskYFKdbT7tGcALIJQJ4DLdoFZLeSp/WwtyNI5Z5M7TMHdLN8QNj5rLa42NWFXYk7Uc7reWzYLzCKpLAEEAK8lvlsxxSHvNFO1FQuWdH3PBaXvoQOtfWcuNE48xEvAjUvMvYLX0J6NkR8+XFfEb3fSqwF6GElPqokFUSdcpTZq5IRFCpdXiQ/CLHyYvbQeujH9j8bd2YPEhOa5fMk842idPChCdpov40infQWMjBrt8Y7SI7SNR8bOZ9e0PKXuBa/Z9hfJ4+dwrhNXo1qXuQ3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/I75zhxZog40dfYrYdX4j8DtDsiRwhhiBy3qMqrlVEY=;
 b=xF2TMiG8jMbkrC5cL7VCz6yK1eIGDL73vjfvZNSMPSLGfX3o9uapID6msAu4YC3qvhM1Daf342ORPsWakMZry3whkibzkn69TijJv7NNcH68g4481uR5II1BXddx3P3LZid32QUf7eLXIsAiauHNf9ck7U7+kWHqoEjVyYzLQkINGtoXp3rm6dDiBAZCpfzr/GKZwiq5YevkCH0amymfLXK8TMGJleZEq095igN95rESlUAO+wLCWwX4YJKrvqER1p1aheYAq4xRxvxjvvgHN1AuyUeeCCv+AF+kS1zLa01GhbmCTPefKEEp9/w04fDsOJSmlc9KbroPQJ4RMfVC3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Wed, 17 Dec 2025 07:00:58 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17%5]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 07:00:58 +0000
Message-ID: <a47268ef-899f-43d6-84be-740632354bc6@intel.com>
Date: Wed, 17 Dec 2025 12:30:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
 graphics versionsth
To: "Wang, X" <x.wang@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20251020231253.138842-1-x.wang@intel.com>
 <20251020231253.138842-3-x.wang@intel.com>
 <20251107194739.s2yrsh2xt7greq3q@kamilkon-DESK.igk.intel.com>
 <SA3PR11MB80466F35AA1F6AA60C0CCDBE86D6A@SA3PR11MB8046.namprd11.prod.outlook.com>
 <bfaf0706-f710-4a45-99df-d2de8f203d3a@intel.com>
 <SA3PR11MB80463C3936A0C00DFD8EF47386AEA@SA3PR11MB8046.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <SA3PR11MB80463C3936A0C00DFD8EF47386AEA@SA3PR11MB8046.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0034.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::11) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 41aac2c4-4199-42bc-3ca8-08de3d3a0793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vyt6K05QWjJOTkNxM1ZScjhhdFhDOE4rQ2lvZmMzNzdINlFuM3BTbFRDTWVX?=
 =?utf-8?B?bHBhZy9ZbkZRTUlGMElaSG1RaG8yZUF6QUNZMzJoa1dyWmQ4bmZBSjAwZHJP?=
 =?utf-8?B?Y0w4ZU5Vem4rV3QxaFF0VGNMYjhCQm8rT1B5K3lCWnVaK3I1NCtaT2pBQVRn?=
 =?utf-8?B?NGY1bWZheGZndkNOYzlkaUUwbG1Zalh6cWJKRFp3MnZ2REp6RDhxaUNCVUk2?=
 =?utf-8?B?Y3F4SGlyaFRkUzJEeXIwNzBLZk5yVjFZTXg1V1ZpdUdHcFg3R3hySllMZ2R3?=
 =?utf-8?B?N2gxZGg2WHE0djRjYkUxbzJacjhZRjNmT1FCTktOWitCcHp0bHdjVWk3aDg1?=
 =?utf-8?B?S0NkUUZVOHpNY0l3anZvRzVWckYvTngxZmZJK1BXRmZYT3ZRK2FhY1VJeERC?=
 =?utf-8?B?WmhpMmFLUk5BbFplNGZlVUNrY3NONlJsMHdZbk5tdHZaRTFVYTByUjl6c2Zo?=
 =?utf-8?B?cGcybWtwKzQ5MGJJQ2lDeENTZWlPdXNvMVU0TVRsaGJzbUhBL0VCbU1IUXJZ?=
 =?utf-8?B?M1c3a3RGbElYNzlIREhhTzEveTZzYW9UQ2I0bU9tWlhHb1l1S1Bjb1dkMWdT?=
 =?utf-8?B?N2NVTEFHMVUzWUZhWmFLWFpaV0NtY0pWWDhxN3lmOFQ0bjkvY0JHQmQvaEtv?=
 =?utf-8?B?OXE2T0VySTlDbTZ1N2xDT3puME5lNmw0RzUvcEx6aTZTQnRzVzJqdHdic3VT?=
 =?utf-8?B?OXB6NlhxbDRKR3MyQ2hmREpDZnE4TnYrT0JNdlRmdmZYV3FNSzhoTC9iRFQ4?=
 =?utf-8?B?WjBCQU02OEQ2NXEvMDNBNlpSdHhPNTRPS1RoSkVLSmR5VTh2K0xlME5vcXRX?=
 =?utf-8?B?djBSYUwxRUN4SXVYQlJYOVJqdlVjcHNWSnR1elBvSmoyK2dFTWx5Tms5UjQx?=
 =?utf-8?B?bWlMMmlGNWZITGRFL3JKd3FNYXQ3QllKSGI1OHVXNDloT0Q5V1hqVTFjOVBO?=
 =?utf-8?B?SFJoTyt4dHpndVhVZjBYclM4dmZONjNldzdLeVQyc0xQbzMyS2lmUUJocWxL?=
 =?utf-8?B?akw1ZFl0YkxkQzVSVG1CVVh4TC90cHU1NGZYT0hRQ28vSkltNzRNa1JBS2pv?=
 =?utf-8?B?UmJsd3hiYXVaclhJOG9idnlLaCtUSGpWZmFYYVRVenpQU3d5R20rZ0RTYWJE?=
 =?utf-8?B?SUNhenhyRzZjSjZSUVRBSzJIY3hBa1RGbjFpeFJtTmlFYmJXYW52Y0hxb29C?=
 =?utf-8?B?d3VkYXptQ1h2bnFxR3pDZVhVSWxGMFJUc05QVjNTNUFZNVptVEk0YkxRS2lW?=
 =?utf-8?B?dzNNUUwrZnJsTkZSNlIxWDQyZFhzMHBmRGVSemV1SldDTmVjOHdkNGt5WHAx?=
 =?utf-8?B?cGxwaGsvc3J3MnZHTW1TQ3piWDFaM1BFZC9GT3o5SENOYXk2K3Q1clJxU2xC?=
 =?utf-8?B?cHFqYjNQaWJqczFvbEo5eXIzcEJrTnZTTm9yejN0bEVuNDA4SzAzQTlXUjla?=
 =?utf-8?B?cG9kZzRNbVlRbmhVaG9GVzRjT2pyeFovL21TcEdQM2pCZ1g4KzNrUC9NKy9R?=
 =?utf-8?B?MUhzMkhab1lLQ3EySEcyQStzRFZ5N1hDcWliV280SXAvOVhxbE5zOTV4c0hK?=
 =?utf-8?B?c0UxQjhhSklPOW55aFl5L0psSGFKbkNEMUU5b2pJRU1Nck41S3hEVklsU3pG?=
 =?utf-8?B?bXYrZU1KR3BlTGpTRzB0bk1vdG8xZklnQzVGVlJYTXZRQ1FnN1FQdXh1UlNN?=
 =?utf-8?B?SFZtNm55emxzaFVud1ByZDlsREJCb0VCSlZiTTNRbFBQUTR6TGtTbSt1bFhl?=
 =?utf-8?B?RjhXWUNTSDd1TGRnbDZXamZjQmw0M3NjTTBrdUtoVVhacmdnZ0xMYklwM3Mv?=
 =?utf-8?B?RUZ5U2Uza0FtaEdCRUVpTDVmTDBZS1BLRFNCVm15aHNXNmU0RnlRUFFFeDVE?=
 =?utf-8?B?VTVTVTBmL1h1T2QrMGVjRHFYSCtxVW92M3A3dDVjUHkxYVVpVkpha29rbWpS?=
 =?utf-8?Q?znOpot50k8zeUiCb7BUSv5Cqm+Bdn64E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlRIZEdTRFlKZ1BMMEZ6U1paWEVMVHduRC9oZ3ptZnFqeUhQZE9IR0lYekYw?=
 =?utf-8?B?c2REQk0zRFo3bDlGdzkrcCs0Y2IyS3ZQcUo3M2FhMk44MGY1d3RuWC9VV3VW?=
 =?utf-8?B?d1lWVnUwbkI0T0c3QVB3NnY0WkxJL2g2bGFNSUk3cVZ0bHZRZy9tRkJUUGln?=
 =?utf-8?B?MzFlckl2SXhWSFBUckNXLysxN0l0UncvZUZQWGUzTk5PeGE3QXVKeVV1dm4z?=
 =?utf-8?B?SW1qRHorc3U5UTVwZk1TTEsyS2IvTTVxVlRYZVRTMEViMUpFZS84bkI1cTlR?=
 =?utf-8?B?NzJ3QkxxaC9KQ2lKR3JrMURvbHQ1Q3BJNFp6ZTFnR29SZWppamx6cTJWRTg2?=
 =?utf-8?B?bUtodWlUMGZBN2JlMm02MW1WbnltR1ZZQ01xS2dtSnVSVHZ1Y2dsNGpUajBC?=
 =?utf-8?B?OUZ2M0JTTGZOaE9vdXExZVJ6UmQ3SUluVHpDQmVQbnE5VUd0R1NYUjl0elNv?=
 =?utf-8?B?VWlSMldOTlhEMzRWVnpFYjBGR3dIWXpZQXI0clBJeWVOM2JORUFKaXFqZVZL?=
 =?utf-8?B?ZGNNeGd4UkMvK2VrM0dKdDFNRVFncGFoaDd4Qm9UNnJ4RTdNeFppOXZFOXIx?=
 =?utf-8?B?bFoxdEc5ZnBzMElYM3p2WTloRTFMZmVtWTROMlNpS2pWOWpTOEFtWXBkU1Jt?=
 =?utf-8?B?UzBOUENvdktHRGh6NXphR0ZmMFd1dkxWVEhKdjBSQ0ttRXhJZXJwd0xpS3Rz?=
 =?utf-8?B?MUR4N0tEekkwNDZVMUN6L0N3VmJGdnQzOEU3azB2WE8wU2EyU2NLQ0liRzFo?=
 =?utf-8?B?VkJpYWVoeUxIMy9OMXY4NEpXTDZZdEQxMkkxK3c5ODZnV0ZlZmZjNy9mQXBL?=
 =?utf-8?B?SHc2V05iWUlMTnpnQ1lnaEhOTDZnWFpLb2RjS0kraExGOFhabFdXMkZzNFlw?=
 =?utf-8?B?c1lmQjdaN05DeWNnNmM5QS9LSEhGeW9lWFRvaWpoTDlzYWVlTytOZGFUcDFI?=
 =?utf-8?B?UDExbkk3VlFtWTJWaFM3ZHMzYjlBdHdKM1pFNjVMZC9JZ0NBbE9YOHg1cTRw?=
 =?utf-8?B?STRXOEZmSkJLR2M0dXZPSzBGN1U1SFhrMnprVXdlWWthbEhmOVd6SmNpQlRT?=
 =?utf-8?B?VjV0U1RzSWZNR0p5TEJOL1J0UzdJU3JiUFdGREhhMG9XaXVldnhINEM1c2Ru?=
 =?utf-8?B?bWVHdTlWR2x5K1JzMmp4bU8zZFhWT3ZhZzVxMVNVWmFzNHk5Z3B6clIvV1kr?=
 =?utf-8?B?djVuUmZQdFRXRmJwOUYwUlNWSkF3WXZKbHdwMGovRHExU21iSlYxMHVyR0J6?=
 =?utf-8?B?Z1J1RDdpTnlscDFQUzJaTFhvV3NYN1VVa1NVcnVMb0FYajh0Z0YvK1QvR2ZF?=
 =?utf-8?B?NWttOEFkL3RMTlFTcmFyTUExRTh6SkJGdEl0Y1k3ajZBelR5Q1JVMHVaK0hs?=
 =?utf-8?B?TnBNUWNLS3lmcHl4THNyWEU2VGptcDJVYlRVZ3dvdjdjUExDMGpYZUlsckVy?=
 =?utf-8?B?VE5heFQ0OEFWV0tRUkc2a0Nyb281Z3JhR2xIa1ZOTElyZHljUWx4YkVBVkZT?=
 =?utf-8?B?NnlyNndoUmlIZG5qamhncExFbkwzMkhUaGN0YzJ5ZVo4NnJYOE4xclQ4UnBn?=
 =?utf-8?B?VCt1NnRESWRKbFM1cmRVZndIc2pYTUs5UG5aTHVlZEg5YkhHQlVnN3d4K3hS?=
 =?utf-8?B?ZHNFaUYxNDhzY1lPUHZOSk1TYUdKZmFmNmJQV1hwdDFSZGtxSVhFaURZR3JO?=
 =?utf-8?B?R2tMb2dYNWVSTGNvNE1tL2QvRDk1UkcyOFNUV0VEdjNzVWVRQVJuNVg3eXBE?=
 =?utf-8?B?c2NpWWFQUEpBREVmb3BmRUpwTXU5Ty9ub2xnV1BRdTZZTjhoZWpNRnhEdk54?=
 =?utf-8?B?Y2E5QzhocjhJa0YvR0UrdTJ5cFhGNFhJK0dLYmlIUXBxRHR3dHM1QUtVZkp5?=
 =?utf-8?B?OXdvSmJGOC82Zk1pUjNna0Mrd1NST2JLOWQ3MkNMWHExSGV2V0FXNGNHUXdU?=
 =?utf-8?B?ZkF4RkZvR2ZkMGdzazRiQ1BWa2dRRlJTZXljbnZXaWNYb2puMWJaNUtrMWUz?=
 =?utf-8?B?ZGdRYTRlb3k4Sm53UnNVeXRVMUNCNWh0L3l1SmJ5QnkwRjNPMjJMOWhNRHBX?=
 =?utf-8?B?OEFmS3lQbVRYSEpMaitCSUFlTWM5ekJsZXFpRUJJREQ4WDBPOWxURTk3eDVO?=
 =?utf-8?B?VjVWbXFKRUZHUlljdVdBSnZDRnMxZFljM3ZpZ2RpVE40K2dkcmdYcERWU1Ux?=
 =?utf-8?Q?BmC/6dpsmlIZmEafygy8jwc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41aac2c4-4199-42bc-3ca8-08de3d3a0793
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 07:00:58.5766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7N9+XdYcIonoihftvnqCHn4oGK/J6/7QSWUzGyk9zTEG0AyIm23ikPXN8tIZG97sMhlRK/FTfY9RAeewmloetM1k3BjqXitAyRnM15AvMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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



On 12/12/2025 10:19 PM, Wang, X wrote:
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Vodapalli, Ravi Kumar
>> Sent: Friday, December 12, 2025 07:56
>> To: igt-dev@lists.freedesktop.org
>> Subject: Re: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
>> graphics versionsth
>>
>>
>>
>> On 11/18/2025 11:41 AM, Wang, X wrote:
>>>> -----Original Message-----
>>>> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>> Sent: Friday, November 7, 2025 11:48
>>>> To: Wang, X <x.wang@intel.com>
>>>> Cc: igt-dev@lists.freedesktop.org; Summers, Stuart
>>>> <stuart.summers@intel.com>
>>>> Subject: Re: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe
>>>> device graphics versions
>>>>
>>>> Hi Xin,
>>>> On 2025-10-20 at 23:12:53 +0000, Xin Wang wrote:
>>>>> For platforms with graphics_ver >= 20, query the runtime xe device
>>>>> ver instead of relying solely on hardcoded values from the PCI device
>> table.
>>>>> This enables accurate IP minor version (graphics_rel) detection for
>>>>> platforms like Xe2 where different steppings have different IP versions.
>>>>>
>>>>> Implementation details:
>>>>> - Use weak symbol linkage for xe_ipver_cache_lookup() to handle static
>>>>>     library compilation (libigt_chipset.a, libigt_device_scan.a) without
>>>>>     xe_query.c dependencies which are used for i915 tools (i915_perf and
>>>>>     intel_gpu_top)
>>>>> - Provide a weak stub that returns NULL when xe_query is not linked
>>>>> - For Gen20+ platforms, prefer runtime xe device versions over
>>>>> static data
>>>>> - Fall back to PCI table if xe device info is unavailable
>>>>> - Reset cache on query failure to allow retry
>>>>>
>>>>> Remove hardcoded graphics_rel from static table entries for xe
>>>>> devices as they will be populated at runtime from GMD_ID.
>>>>>
>>>>> This unifies device info handling between i915 and xe drivers, enabling:
>>>>> - Platform-specific workarounds based on accurate IP versions
>>>>> - Consistent device info API across both drivers
>>>> +Cc: "Stuart Summers" <stuart.summers@intel.com>
>>>>> Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Ravi Kumar V  <ravi.kumar.vodapalli@intel.com>

Regards,
Ravi Kumar V
>>>>> ---
>>>>>    lib/intel_device_info.c | 26 +++++++++++++++++++++++---
>>>>>    1 file changed, 23 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c index
>>>>> a853f9ab4..87b1069be 100644
>>>>> --- a/lib/intel_device_info.c
>>>>> +++ b/lib/intel_device_info.c
>>>>> @@ -3,6 +3,16 @@
>>>>>    #include "i915_pciids_local.h"
>>>>>
>>>>>    #include <strings.h> /* ffs() */
>>>>> +#include <stddef.h>
>>>>> +#include <string.h>
>>>>> +
>>>>> +/* Weak symbol stub - will be overridden if xe_query.c is linked */
>>>>> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid)
>>>>> +__attribute__((weak));
>>>>> +
>>>>> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid) {
>>>>> +	return NULL;
>>>>> +}
>>>>>
>>>> This seems wrong, you cannot cache by devid, either you already have
>>>> it or
>>> Why can't cache the ipver with the devid ??  We are not expecting to read the
>> register every time, so we must cache the value somewhere.
>>>> not. Also devid depends on register(s) reading and you can access
>>>> that only when you have fd already opened.
>>>>
>>>>>    static const struct intel_device_info intel_generic_info = {
>>>>>    	.graphics_ver = 0,
>>>>> @@ -505,7 +515,6 @@ static const struct intel_device_info
>>>>> intel_pontevecchio_info = {
>>>>>
>>>>>    static const struct intel_device_info intel_lunarlake_info = {
>>>>>    	.graphics_ver = 20,
>>>>> -	.graphics_rel = 4,
>>> In fact the purpose of the patch is to fix the .graphics_rel error on some
>> devices. And we already have the correct value so we can safely remove it.
>>> I keep the  .graphics_ver here is for some of the tools may need to
>>> check the graphics ver without opening the xe devices. For this kind of use
>> case the tool is not interested in the .graphics_rel.
>>>> This also seems wrong, please keep old values for compatibility, here
>>>> and below.
>>>>
>>>> Regards,
>>>> Kamil
>>>>
>>>>>    	.display_ver = 20,
>>>>>    	.has_4tile = true,
>>>>>    	.has_flatccs = true,
>>>>> @@ -517,7 +526,6 @@ static const struct intel_device_info
>>>>> intel_lunarlake_info = {
>>>>>
>>>>>    static const struct intel_device_info intel_battlemage_info = {
>>>>>    	.graphics_ver = 20,
>>>>> -	.graphics_rel = 1,
>>>>>    	.display_ver = 14,
>>>>>    	.has_4tile = true,
>>>>>    	.has_flatccs = true,
>>>>> @@ -529,7 +537,6 @@ static const struct intel_device_info
>>>>> intel_battlemage_info = {
>>>>>
>>>>>    static const struct intel_device_info intel_pantherlake_info = {
>>>>>    	.graphics_ver = 30,
>>>>> -	.graphics_rel = 0,
>>>>>    	.display_ver = 30,
>>>>>    	.has_4tile = true,
>>>>>    	.has_flatccs = true,
>>>>> @@ -675,6 +682,8 @@ const struct intel_device_info
>>>>> *intel_get_device_info(uint16_t devid)  {
>>>>>    	static __thread const struct intel_device_info *cache =
>>>> &intel_generic_info;
>>>>>    	static __thread uint16_t cached_devid;
>>>>> +	static __thread struct intel_device_info xe_dev_info;
>>>>> +	struct xe_device_ipver *ipver;
>>>>>    	int i;
>>>>>
>>>>>    	if (cached_devid == devid)
>>>>> @@ -689,6 +698,17 @@ const struct intel_device_info
>>>> *intel_get_device_info(uint16_t devid)
>>>>>    	cached_devid = devid;
>>>>>    	cache = (void *)intel_device_match[i].match_data;
>>>>>
>>>>> +	if (cache->graphics_ver >= 20) {
>>> xe_device_get(fd) (in xe_query.c) records the tuple (graphics_ver,
>> graphics_rel, devid) into xe_ipver.map once it has fetched
>> DRM_XE_QUERY_GT_LIST/CONFIG. The key is the PCI devid, the value is the IP
>> version we just read from GMD_ID.
>>> Every Xe use‑case calls xe_device_get(fd) when opening the device: the
>>> common drm_open_driver{,_another}() path already does this
>>> automatically (see lib/drmtest.c
>>>
>>>
>>>>> +		ipver = xe_ipver_cache_lookup(devid);
>>> xe_ipver_cache_lookup() is only a map lookup. If a given build(i915 only
>> tools and tests) doesn’t link in xe_query.c, the weak stub returns NULL and
>> intel_get_device_info() will not go to the if (cache->graphics_ver >= 20) { ...}
>> part in the intel_get_device_info() function so we still make the code
>> compatible with i915 devices.
>>>>> +		if (ipver && ipver->devid == devid) {
>>>>> +			memcpy(&xe_dev_info, cache, sizeof(struct
>>>> intel_device_info));
>>>>> +			xe_dev_info.graphics_ver = ipver->graphics_ver;
>>>>> +			xe_dev_info.graphics_rel = ipver->graphics_rel;
>>>>> +			cache = &xe_dev_info;
>> cache variable is a constant type we cannot update it, did the code compiled
>> without error.
>>
> cache is declared as const struct intel_device_info *cache, so the pointee is const, but the pointer itself is mutable.
> Reassigning cache = &xe_dev_info; is allowed; what’s forbidden is mutating the fields through cache.
> The code builds cleanly (no warnings or errors).
>
> Xin
>> Regards,
>> Ravi Kumar V
>>
>>>>> +		} else {
>>>>> +			cached_devid = 0;
>>> This function will be called before the drm_open_driver() so we should
>> remove the cache here.
>>> codename_intel()  is calling intel_get_device_info() at very early
>>> time in igt_device_scan.c
>>>>> +		}
>>>>> +	}
>>>>>    out:
>>>>>    	return cache;
>>>>>    }
>>>>> --
>>>>> 2.43.0
>>>>>

