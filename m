Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CC2CFA466
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 08:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA77E10E1E8;
	Mon, 24 Nov 2025 08:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWoGjvKP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FB510E1E1
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 08:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763973255; x=1795509255;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wdKgCbelghT59XnyrClekEWTiRKlIp5R32fDaxveUTY=;
 b=CWoGjvKPVBdK+IqAuUrcYXjOo3Mbg7jn4k0qTNGTpdUXIvG8mF6bnx8N
 DXMwJKX7xRTud51Ol8Nz4w2ZbmqzA2E2mXdwbrgYsd7T9WA38Xqe0nIEu
 07C1UX2gr22G+haliHZv7svzkmTGY//2lkcv6rI6Va+lXl1oINF0BrwNa
 xqYY3McB5MerH+N4EsETOa6lzMqliSBWsxnJ+RlCnTox6J0r23BROFJ4r
 RIdBhPzuwL1SS4NH+IbuAAEc/20kcme+jxlkWwRw0rtK3OVNpxA/AD8/h
 q0K113t7p9aL+4ExVZ+M+iFZ4jhXVxcCBlyo+QIScxPA7VtMiaTRCLm8I g==;
X-CSE-ConnectionGUID: NrDEwT4yTB+RLICoXKjulw==
X-CSE-MsgGUID: 5oyzUPZUSlOZGZDqTifU2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="69585123"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="69585123"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 00:34:15 -0800
X-CSE-ConnectionGUID: UFFGlAuPS/y7YHeKievEoQ==
X-CSE-MsgGUID: wPunqrO2QR6VFyU7ZJhLpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="197200465"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 00:34:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 00:34:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 00:34:13 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 00:34:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjRFcmadFmbcGSCvu2Q8+hPJAe4PzanYnWA6qskeFPJ4lk5ROdwOg4srhJ9we7ntR1Qclq2ppPg2Sjmf/buc9dfUhlfFtTouGVPFJz78CzxEIVEwWcsP8SzolI1fXdyTtblV6+XZm1vBAaeYz1oNVZvVXd3IXa9xmY+jSpksgKM0ysNYVzRr/TWd8ThY/ZYMCj4VR+a7I3i9Xd6ShqDIHD/AYkEJubizq+xENtRvwUQxchGgfzNa2mkVNumix5ajsG+TvQ3hOgZE70GkJN7CMrb+PpvrhhG6Jjue/isgduUN/SdHYlsiF9lifc9TaYLLzmq3SH8c2m15TcJsRBMx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vc37IASG87y6vgOoLVJXSP1Gr7A5jpm2h7c1pI3q5Sw=;
 b=Ar5AKCdFbvDq1Ndil2uKIhEtShSGnRz81ymAw0+8PV5OHNW23awOin7FqJHpqBljjFS5Nz7+4MHmiqOiimcnnv+67If3kOnIcu9PXMf7pJxu4W5Z4dgAfmMDJAcaMIwuHVPpIJl6gGlAO+Y3aZ4YS12OWeZzloM3LWcGnDJaORnobb/i8MLuiQ6VgayHxYRsxEy0SfAI8uuOxIP1oJBo658t3+IfEh35EJHw8e7Fe6JCT3N5pR7PUi88QIXe51yasZqe/6CJkuaeAWXFX+Hg6HaL2RT7YsGsRrIP13cDIZ7uAwky6JVEjsvGi2fsRYD/wxUt04jOJkjOSwbtIXQGbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB8542.namprd11.prod.outlook.com (2603:10b6:806:3a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Mon, 24 Nov
 2025 08:34:12 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 08:34:12 +0000
Message-ID: <3213381e-cf4f-4200-9a49-653f698b9cef@intel.com>
Date: Mon, 24 Nov 2025 14:04:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/6] intel-ci: Add sharpness filter tests to i915
 blocklist
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20251121123134.1099006-1-swati2.sharma@intel.com>
 <20251121123134.1099006-3-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251121123134.1099006-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3ada55-172a-4b98-e2aa-08de2b343e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|42112799006|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGwzVHRGY01DREJkaGV4TVVkY1pLZW85UmVRMWV3bXI5cXhIbGxoVXEzU0wv?=
 =?utf-8?B?U2xxR3dSWDRvMG5Ea29KdityYS9HQnZTcWY5QWJubnpFSGJuL1ZJTjgrT0Zz?=
 =?utf-8?B?Y01kRU04bDVZYURnZ3BZaUJtVzVVVTZXZjk3Yk00dEtManEzamhVWHdTMzN1?=
 =?utf-8?B?NmZzMDZDLy9zaVVadjVmc3VOdGlZSU1NTHA3MHFKVW5XWEoxaVd0U3loZ0My?=
 =?utf-8?B?ZmErZi80SHB1TlhkcjNyTkJ6ckNPdkJiNGk0T29YMU04Vitua2N0UnUwQVVP?=
 =?utf-8?B?a1ZUY2UzNnhkYklGNkgydmpHaUhqbWZ2VHRJRWViL3Z3NDBqbnpXTzdDWStC?=
 =?utf-8?B?d0lCSnNGS3Azdlk2aklCalFrek9ydEZYcXJLQ3JYa1dFYjdLSy9wb0lDTDNz?=
 =?utf-8?B?SWtxV25rcjlJMGYyUWNJVDBHZDdLcG1ra2Y3cmxTWm1hNTdqd0NzOWJRVWtH?=
 =?utf-8?B?N3NLaTRMY21wMzdxQWhyaFBKRFY0cloxWWo4QzFaaTBmSi9vZkFGM1UzQmZU?=
 =?utf-8?B?bWJtMTNGbkQyQ2d5QzlCelBnZzJ4ZEJVR0xWamorRXRoOWRpSDJHVFNFbGdV?=
 =?utf-8?B?c3BLRW5tOHZyRFRCSTZsTXlZVjVLRDRxbWZTYkR3WVI1RG1KV3BaOU8zT3VM?=
 =?utf-8?B?WmlDSk15RkFNenAzdnBXV2xwU0VKSSs5Lys2NFo2OER1RWpXRHRKZGh5VXhv?=
 =?utf-8?B?ZGM5RGt0TkI1R0JqNGlJT283bHUyQmY0R3dBQTQ4TjVTdzZYbW1KOWJTbmFJ?=
 =?utf-8?B?b2lJcll5YlVoQkVmWkhQZ3d4dGswTnQycm1xeUVicEhtT0tqTVdpeS8rdm5k?=
 =?utf-8?B?T0tDdzAxM01ETHE0Q3FsUDgrZ0FLN2JvczIwa3F2SU1sMXFQcSswOGNrVnIw?=
 =?utf-8?B?ak1mOHR1RG01bVJIaHRMT016YzE3aTB5Q1hyZGwvUVd6aUM2azhPc053SmtK?=
 =?utf-8?B?ZWllTDUxY0x6VktJNWJEZU1UTUU1eUl6c291cWtBMElFSnkxNUphOTg4UDJJ?=
 =?utf-8?B?ZnVhZ0I5V2xyY3VQRkVyR1JyMGZFZHVZam5OMmdFNkNweG5ZN1RHNmhWUDU2?=
 =?utf-8?B?R24vVURYUFM1RDhjQkZsaGlvN0M1alh4WW1aRFNtTUZ1QlBDQkVpL3pSZmtq?=
 =?utf-8?B?ajNWR0VqSmxJWWlEUmgyU3J6aG5CdTB6Z0w3cHNmeHNzeHpzaHF3YkFUZFhF?=
 =?utf-8?B?QlU5dUlTU2JLWVM3SjBGeW9maVZqY2tPNk9HdDJSYmFMY25rSnA0Q3pSd2Fi?=
 =?utf-8?B?QlEzdE8zNWRhNVhONmhsRzhIT2MxSjRsUkNpTWpYZ0h4V1JseEM1elFZK1VD?=
 =?utf-8?B?SDNwazVsSWFiUnNMN0FJSVQ2eVlyMWFGT2docnlqaXZzOG1GYnhzTzlqT0ZQ?=
 =?utf-8?B?M2Y2dHZDVHo0dmhTUUdPakJkMyt3OTlodjV0TTJjK2JNbEVkTDdJVUZwVUpQ?=
 =?utf-8?B?SkF0TkY3eU5EVTY2SjZoTURmSExOMzUzMFB3ZWRvMmtzTSt1aVdjTTQ3RFJm?=
 =?utf-8?B?VXVXZnpFbEVPbjJOVXExeEJFWTUxYXlNdVdyU3hiM0ZCNkZBS1lrc2hnWk5s?=
 =?utf-8?B?NDh3T3l2WE5JdE5WZ3haTkhzaFdneWdhRVh4T2tqZG5uT1dIajFyWURDSTlO?=
 =?utf-8?B?SHNnTmlZTHpwbmRHK1IvUmdiUlY3VmttaUhLRytHRGlMazNQTTNoajNzRzVo?=
 =?utf-8?B?dVluMWxvazhPNTlrUityWEJ5V0U3NkVmbmg3UnNnTmtpdXdHYTgySzdXNnp4?=
 =?utf-8?B?bm9lUzFHVDZqTE9WQXJmRVh1c3JCYVphRjN5WnNnRkliVERmb3M1cENNbHZP?=
 =?utf-8?B?bElyQ1RWYmVqWDRFYUxqeU0wS2JEZEZJdmZ5VC84aWV1UmxrdlN1RE16UHRF?=
 =?utf-8?B?NURjeEZveS85dk5RQnFMeUx4eHhQSW5oN3FpZ01CUlhrcUpCc2wwZ1M4ei9o?=
 =?utf-8?Q?EXdJAkg/iYHD3z+6UHWf0CrAnYMOzavI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OElHelZmL3lGTldERHVVRFZ5OVZZVFB3dGRIeGVadzVmNEM4S09kNERBUWxr?=
 =?utf-8?B?VzJyVVJPbGZ2a2syZEt5N1VEYmloLzZiUmhxcW41TmNOanU4Zm1TL3oybzRH?=
 =?utf-8?B?Uk8rVzZkVnJjY2xzamZNakdVSHVSOGIzRlRYVFpjcjdNSmh2UXhaZTE0c24r?=
 =?utf-8?B?MmZzQUUrS1QyYVhnT1IwMkZWUnB6NTJ3aXFoelVLam5LS1RXZWpqRXNtdFFM?=
 =?utf-8?B?eFAxVTNnTGlMakIydk9zWkZCbE1sVjV3S1l5VVQ0bjE0Vnd6OXR3dVhOeTAx?=
 =?utf-8?B?aHlYbk5xa1dXZFk1dCttQm05aU9MTHl0T2NDZ015R1pZU1RtZWlFS0RjU2ZK?=
 =?utf-8?B?MjR0WnJnWkVwdDBNSXN4d2xwcU9sQlZHUXZWVnlFcDErWWExdG54ZDhOU25D?=
 =?utf-8?B?ck9DZjEweHEzQlZkRUo1aFVKTjNvSE5UeXVMZGFJMmphSmlBSm5pME1mMTRI?=
 =?utf-8?B?VElGTFpkZGNZMFhaTFo5U1R4d0lpN2puVDQzVXZZMG5CelZyZThpUGpuTkZa?=
 =?utf-8?B?Wk1kVnlwY0pTTHFyamJXMlQ0Sk9WTzhKZGtXdjhpMDZWQjZuTjFhVUN5RENk?=
 =?utf-8?B?Wm1RZDErejdvY2Z6dlE5bFZaMFVDd0FYK3dwQVh5RjdEMFZFdlJjeDVRalpQ?=
 =?utf-8?B?SE0yNlJMcXI1a1VXSXZLdkRNcy84TXdJd1dPR2YzWENpREYzUFhXdVNteGhu?=
 =?utf-8?B?bk56T2c5MVpqYnJjMXVvMVZqQUJKZXhRRWpDcUNOcFdVODluNVZqYnh2UmQ5?=
 =?utf-8?B?S1I5WUo5ZURMWXFRRzFMWkl3OWZFdVdJbTk4K0l4ZG5EeDk5OENDakVKMlNu?=
 =?utf-8?B?ZXY1WEtkQS9Lb0FiU1l4MkFXY2dKM0EwQXd1ODc5TlF4anFYSkVQZEwxRm90?=
 =?utf-8?B?NFhMSFNQY2h4d0Z4Qmxnb3FzNFF1SXl1dVZpZ2dJT01VRHNXeGJ4U2xDZkpL?=
 =?utf-8?B?bXFKdURoa3RkQzNhT3ZGaWVPRnUwWUo1dEpKOXZEaXhLM1dLRXNYS1FmV3h5?=
 =?utf-8?B?S0JiWkZaRDFHRlNPaVNpNFhtdSt5NnQ2dWYwb3p1N3lWMDlVOVZ5SXU1NnF1?=
 =?utf-8?B?Q0RGZmExQmlFWTJPd3dYZTY0d2tXVllnZzk2UjlVVHFLK2JqR09iK3gvSFEv?=
 =?utf-8?B?V0s1SDd1S3NvbmxWK0FVZGRPbWJIUSt1VVVtOUIvSDZOTHlIUEV6MUVuT2ND?=
 =?utf-8?B?bnpTSVdyS25CYVFvR2JGdUxzdUdHSVpOblgzb0RWUk9JOUFSM1ZxcUxaUlZL?=
 =?utf-8?B?QklYaGVFcVJhZEV2RWhHUk5BN0hxWjc3ajlZTC9JYzNPclJrakVNNnZTVHNL?=
 =?utf-8?B?R0c2Z2ZqRTBvK01tdmtRQVE0NVpmc0NZKzQ4MW8zNUZkenU3UkhtbHBvMGw2?=
 =?utf-8?B?aXM1Yzg2NDRjMVRHaUpKMVNYTkpGWExvMFc0Wlowb2ljRytHTCtWZEJ1U0xa?=
 =?utf-8?B?ZnVnbEcwUkpuQ0V4eFR4NzNSaXhXdldLbWpzL1dWYll6YUtaS3JjaExUTGJ1?=
 =?utf-8?B?c1dlQ3BmQXJjVUN3aXN3WEVWWExlUGFYQlo2cERjWUl5SFRDeFFubFFnY3VC?=
 =?utf-8?B?Y3IrN3Q0NGZUbHgwUUY5ZWJUR0w5ZUgzY2Y5elZLU0Q2dFNrTUVTK3J1alZh?=
 =?utf-8?B?UzRkNjVCTTRYVHZRNlg5emVkMmtncjBMSFRrTzJOb0FldzNzeFZJYmp5cStT?=
 =?utf-8?B?U3JIVVRWc05xTzR2dXpxSnBBa2FjYXNMeThtVno4UGdlNENqMG52aXBqeWJE?=
 =?utf-8?B?TXVPcFNMN3A4Y2hFVEsvOFVRRmNVcUxmVjQ3NDB3bGNxLzBpbFFQSDFueFZZ?=
 =?utf-8?B?bDVrNWVyYzRlYkEvMU80UzNKYmNKSk9wck5ULzhXZFkzUW0vekd3ZzNKcGNG?=
 =?utf-8?B?WHkzRjEvNkFlbXJoTVFXdURjQ3JqM3BFMldjVXVGbXU2YUFsWS9sQ0I1a2hU?=
 =?utf-8?B?Qy9hbmVJY2RqRThGKzNSOUs1UUMzaTVwOWI1cXlNdm5zVldRT0dTTEFGTDVu?=
 =?utf-8?B?aG1KV3ZvWDlJZFNyMElBRncva1l3WURHSXREdkFlWCtxZjJOTEtlRi9NbStr?=
 =?utf-8?B?ci9CRnVUSmVLMHFxaVVvQWM2M0JZbUpPOC9GTXRCc1lsL09iS1dCaDF6Z0x6?=
 =?utf-8?Q?ZcE1NBJUBHAv7KVafYkbpXpQH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3ada55-172a-4b98-e2aa-08de2b343e42
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 08:34:11.9300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYiwxWOdJhXG5HoD0kU6fKZWwjgWmcRJ3FP7byB0pg5g1JRwIiX4GiT21Lbl5rvveJydWMAwuQxgCqR9M0nmTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8542
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

On 11/21/2025 6:01 PM, Swati Sharma wrote:
> Blocklist the new sharpness filter tests for i915:
>   - kms_sharpness_filter
>   - kms_chamelium_sharpness_filter
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/i915.blocklist.txt | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index 083b660c7..96d69ca79 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -172,6 +172,8 @@ igt@kms_frontbuffer_tracking@plane-fbc-rte
>   igt@kms_pm_dc@deep-pkgc
>   igt@kms_vrr@cmrr
>   igt@kms_fbc_dirty_rect.*
> +igt@kms_sharpness_filter@.*
> +igt@kms_chamelium_sharpness_filter@.*
>   
>   ###############################################
>   # Test was written with the idea that edid read shouldn't take an
