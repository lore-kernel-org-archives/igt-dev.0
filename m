Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E45C87FC9
	for <igt-dev@archiver.kernel.org>; Tue, 29 Jul 2025 07:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399DD10E1D4;
	Tue, 29 Jul 2025 07:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnLHOAWU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F0B10E1D4
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jul 2025 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753775629; x=1785311629;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yzu+M+/F51xpFzfbG/EoGA5aX41PX1JbL8zONhGhx9Y=;
 b=gnLHOAWUbBSErgJu/eRqaH6qmiKFh3Nn5iDIUIG+EUEjo/T/5RAo+95X
 up+ElSQFb7EGdm9gO6OZj9RIlSwHUS4Dw322CqmbZ0c3L3wzxM9uZMJaA
 3Hh7+RFyx23DbiM8VFNkKElKYgaibbwXigma6YGvphsszNarR/Oi96dpX
 BUeP3RDYDjyQSXGK7K3xyRCLMY5WKMb/MMc4YvQWN4cZ4l6nFZaPZsOQX
 iWig7zC8CIuL+MPayMrFY1xQ90tgcSucwT33AStX2szFNrOAoDA/L4yw7
 86WsJ9dhcMNu8Ldm672v23JzOgUnBGRJfxAFDQjWjAyzPo938IHcmVxMS A==;
X-CSE-ConnectionGUID: NSy3ZxW+TleGBCvHDIdLvg==
X-CSE-MsgGUID: ILXqnVyESFWy6HzKjY8IPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55974251"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55974251"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 00:53:49 -0700
X-CSE-ConnectionGUID: AIX/kJGLSyyMOyzZ7qPi4A==
X-CSE-MsgGUID: siuetYV+R3GanxOtU4WgqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="166889618"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 00:53:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 00:53:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 00:53:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.75) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 00:53:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsok/IOcgPS5YaL8OdgS+RPeRIZar2eN8DhM8aNqjuH9cjlbQGzOsfLFNS4kAy0Vec7ey9mpkOjKeEnb2Yd0kLC/lwjjs1Ck8Iqk0fd74WvOG1SrNqCZz3bB+lv9nhUhKYTuog86MNNhHAhcZJDdoMbd7O6DCFW8/ah4JpKadrUtIsRnv0b8H9AhNF/Ndy92MpDIesMcOPaXKl3eqSRddE12shwNZPgq0To1FlecUGG35OUmsInPN1L1twjLtZtd8G3OCTFD/fzl/nr/3sYYDjarLWrGS1CnN3fig+l1RAcvaAMD0YovECnYqdTJ165aqrrJYr+ueHitucWMYf4YVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpzY1Zx/qz7z3NXSO7qrnDOawqcG32OjoH6peqqTMJw=;
 b=XtJCNlwuuDJ9FawLFJcc5NsmU3oQxcf5UBIfZNzdkN1oM69i16xnpe+ndj1GTvbGBAy7ZHUGYBuudMddfed4Mx01BzkH42v6ZuyXHq600R5adjy2nGjiJcC6NWJ+/6KUbFuszZTsrCfg9WgDkJQcmi/tQhV0WoxED9YrQIbJLp0eDa4Rzc8qsGILfsgZqIUig4iYIK4GQwjzaxa8qUuHEfgl0Km9cvunPHBKmfVFKbZ2G4+Z4leccBo//ZoDNf00lXqTD61o19m7+1opXs+tx9rIX7tSaG1CzpVTiDbL6qN0OaeKGs5PtUnYctnkt0uKlOpDDOpO9vB7LYHWOWoUmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA1PR11MB6736.namprd11.prod.outlook.com (2603:10b6:806:25f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Tue, 29 Jul
 2025 07:53:46 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 07:53:46 +0000
Message-ID: <653ea6cc-dea8-4030-9219-88c88e81f340@intel.com>
Date: Tue, 29 Jul 2025 13:23:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane_alpha_blend: Reduce test complexity
 for simulation
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
References: <20250719170838.1340070-1-pranay.samala@intel.com>
 <d9a94bb7-767b-403a-b89f-e3c4c2ce7e02@intel.com>
 <PH7PR11MB605380A8A1EF9692DF9F893FE75AA@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <PH7PR11MB605380A8A1EF9692DF9F893FE75AA@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA1PR11MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d1298c-89bd-4720-7c51-08ddce750b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2RMK3NLQzBrOUZqVkZhSjlnQkxLWWJzbXB0ZjRkZWlJeVdIenYwekc2eVBt?=
 =?utf-8?B?SktUMUJDMmhicXYwb0tsWWtLMTZHTTRpS1ZxRFB5Um9YRUp0QzlFTUVDL2h0?=
 =?utf-8?B?a2NyQ20rTjFIQ1c4cVJqY3NlTW0zTURIeHFRdVh2RlVDWWJOKzMyWTRtOEpa?=
 =?utf-8?B?OG5IT2NGK2NaSGV1SEw1U2ZNdExxK0tERDF0bFRvM1FVRHNwbFRWUG54N2Jw?=
 =?utf-8?B?eWF2VWViOHNkeUlLUHVWdWR0OEhKR3laYTROekpqREFqUzZFQUV4cHYvdWc2?=
 =?utf-8?B?VjdRak9kY1ZxdHZ6VURYSEtJWGxSL3BQcU8vREtWS0NGM1lELzVFOURSQkp1?=
 =?utf-8?B?UEtPUEpZMHJtY3dQQ3JGVDJWbTBtc1NabDFYUUlWR0F1YzNlT0dXalAxQ0x4?=
 =?utf-8?B?Ym5mWWtLRDBZY1dBcDdFVWVKRHcvOVhiTzNJSWl4clNuWUllMkppZDZuKzNS?=
 =?utf-8?B?SCtaYlpEZFc0cE52UlhOVzNlNm1xRy90VHM2NXpUL2d6TTd4YU5OR29rK2Rz?=
 =?utf-8?B?TEd0eGJQWVJaZXFzWHpiTDNZN2dVRFNyL3psZ1ArM0hid1pDVGdwUlIxaC9q?=
 =?utf-8?B?ZWo5VFNHM0dsbmFveUxzTk05RmJHNlEzMzA4TFBIZURqUncvQWg5U3dvWXNM?=
 =?utf-8?B?cFZkb1B3c2h2aVlYL3dFc2RDK1JOOWJISEtIVXNXb1RaQ0hQbnBwV1JWbzJQ?=
 =?utf-8?B?MVk4MjZpVzNFaFdBK2NhZTBzNGM3SGFESC94d0NJeXlhM0RJZml1NzZEMkYz?=
 =?utf-8?B?d3NZYmNRS1pUUXViMCtRVG1OSU5TM2pjdGZwMURablFVeFJsVWtWaW4wM21w?=
 =?utf-8?B?cjBQek1TREl5RHo1SE1xLzVKd3F3SHAvWGN1ZWt1R2RJN1FMUzEwYUdyUDF5?=
 =?utf-8?B?UG9vM05xY1czOUNZUFM2VGZTaTRkNWhON1RDM0Z1NmdUMDU0RmY2RDNaNWpa?=
 =?utf-8?B?V05aVEM2NmwwT2l5WjJpNStNTFpzR3FTQlY3QVYxY0NnemF6VjV4Q3pHcS9L?=
 =?utf-8?B?RDA5WnludGI1U3VCdmxyS015dHpHS1RCRWFNbnRLMHhiZ3dCRTF1UTlJTndU?=
 =?utf-8?B?Z0tIdnNUWjltMFlqTlBPQXozR3NqL0pFcDcwRzJCRHNDb1J4T3JiaUhhcHV5?=
 =?utf-8?B?QWZTbUpKcjFwLyszdEp6SlNkTGdkQkJIeUN2ZU9walFNZWJ6M1o2TGpGRXl2?=
 =?utf-8?B?R3Y2QmdGSnlORi9CQlBLbVRkV3lPOEd1Y040MGtWZmlJSjJFalBBaVYyOHQ5?=
 =?utf-8?B?ZUd0UUVlQmE1bnFNcDF3TVptc3BQaVJBTUw4ZEMwVU1GMjRFZmNRNUFxcHVu?=
 =?utf-8?B?a3NiYnZSVFl4OXNvV0xaTkFuM2N1ZXg5YUlDOWdHZ2Z0dnF3dGp3NjkwaHNk?=
 =?utf-8?B?UmJweXF5L1hoQU4rQzFSL3BRMGpOaUNaUksyL0p3OVBxZC85YWkyS3NDR1JO?=
 =?utf-8?B?TTMzOXZ5YWhTSTRCYjd3MWZhNjZCMnVwQ1EzbVJISVRRbWx4Q2tDSElzdnR0?=
 =?utf-8?B?dmRUckhVT0pWZnRmL3dpdjZvanUwd1FlY3NkSGY4MWdSQjFKa29VQ3o5N1Zj?=
 =?utf-8?B?QnFBZFh3MmtEN0x1TXRscDdBUDVJYTR1cWx3WjRFYXQ1TEJXemR0UmxVT1dt?=
 =?utf-8?B?Um5RWTcrRnVVK2plL1hZZXhLNC8zc0M5R3lPUWEvNVYxNEQwVnp5WlFiTmp6?=
 =?utf-8?B?YUxwSVNzSWlWTmdtZ0tFeUpib2oxU3M3NWducy9WTlIrb2tsc1QwUzJQZW8r?=
 =?utf-8?B?ZVhmMzRCZUVHcW5VeVNmZk1icHVWcTd2MEJReS9UTkVJN1FmUDZjS2ZiZGk4?=
 =?utf-8?B?TUlaMEt6NVlXMWZXQVlqdjhBMm9YV0FvRVpmeG12bmk3SmQzNkExSXE3Mzdx?=
 =?utf-8?B?NEtma1pKMjZUbXd2SlJzK2Ivak1nNmdvQUVLVWt6Vm8yWG1QUE03dERXYUVl?=
 =?utf-8?Q?ZmLcnuZRYQc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MCtKWEN4aStUOWR6T1ZtKzNxOURmVTBKVkZyTmlnRkpqNy8vTEZmdnM3NVJO?=
 =?utf-8?B?U0d0cllDUHkwaUQvNnd1ZjM2L25Gajh4VlZ0MDFqVjZjejZmMHBTZFhiS1Qr?=
 =?utf-8?B?bUJKSW8xd3lQL245TEJSZis4ZDF6QlJHdkwrWFhDZzk0U1dHKzRoYXMyZXRj?=
 =?utf-8?B?aVg0azRDc0UvSDFoeDFLTi94U3M3VGp1cENvNllyTEk1SUlFZC9mVWNDNWd1?=
 =?utf-8?B?SG1yeDJGRFFrSy9YVkRSQkRqS0lOTkpQRG9LK0RVTm4wdEVoY2Zoa21EN3dk?=
 =?utf-8?B?MURQUTZNY3VCSmZsOUhKOCtQc2VhUDhEV1QxVWV2YTRaRTdNQ21rQVIweGNS?=
 =?utf-8?B?TGRqVlFBdGw2QkNEQ3Y1cDRzK0twTTVNT1RhMUJKblJJVGZYcXM3ZERWeXZ0?=
 =?utf-8?B?MWtUaGVNYWdKSHFFSG5PVkxBYWRGWDkwQjM1eVFVZlpTVlIweWpYYkxFRnI3?=
 =?utf-8?B?OHB1bUdqdXhMdjN6anEvUGZ0RTJobzgrSWFFeGdVY2ZuOWk5b2ZwemJyNVNu?=
 =?utf-8?B?WEEzMXVKdVpwSUplVjZjZlVvWmpuNjhNVEVmM1UrbEJEb2hVZGpkU3o2bXZG?=
 =?utf-8?B?Y1VrakpiN0dMN2xvUTk4TWlxSUxva0RsQkFGVndja3F1MU5VT01VWGp4clI0?=
 =?utf-8?B?cGR4K2Urd2s5TWhCVHNXV0oxeWYvUUc5VkZIMk5xVHZYWUlmM1cyVlNIWS9o?=
 =?utf-8?B?SjBhNC93cjUrMU9mMWwzWFlvTVhhUUxWaW1md3RXdTB3UTBLa1ZIcmhmL2hJ?=
 =?utf-8?B?OUVkT0E4dmtscG9iQTR5Y2JQZ0Y3L054UFJJZzZUbkZuZVZuWVN6RmZvVDVM?=
 =?utf-8?B?Uk1tSHlsd2RYdERTT3daUmU3cHpSSzhHVVZXS3BNVGJWMHF1NHdNa0kvR3Ni?=
 =?utf-8?B?L2NISlhVdEZGeWthYjRiYW4zd1hUTlczcWpVUktFWU9Fdm9oYkdGSEJkZ3RC?=
 =?utf-8?B?ZUNZclhzRkgyV05GTEx4c0xEK3JqdmFSWjNaN2d1QXp4TU03dWU3eCtxTnV0?=
 =?utf-8?B?NERSY1BPdndDY0tFRFI1TUE2NFFFTXgwbTVXQW5HblRRWnpmMUJaV09SQ1R1?=
 =?utf-8?B?Q21STlVRNzY3K043by9yRHd2QTlyOGVZUUdCYmpwL2pWZ1hGWFBJMjNSZDl5?=
 =?utf-8?B?Nndud1d1WURycnRoV2gwb2FFZndOeDEyTlhGc1R0RWQ3QWIxVFZyMmZIUXJn?=
 =?utf-8?B?cFB2WGZRSUIzTUhqd3VjWXhyaHJmL20vMmZiQ0VvRjY5Q3JKRHhLTU1JUXJu?=
 =?utf-8?B?QzFKdmFqVStNcTQyMU1ZMThCaVVvOTlZZ0VqYVl1V2d4ZU5WejVOL1loSGkz?=
 =?utf-8?B?OEFSaFFtRS9HUGZuVCtjc0xJb0IyRTJVa1BtcWt5eFVBalZMVGlkSENTVGVo?=
 =?utf-8?B?d2x3Rm5OMjZCWGY2UjdtMlFUdVRSUjQ2eXBOQWlJdFl6ZGdsTUozV2lXLy9M?=
 =?utf-8?B?U3pGVUdnMFJ3bXY3WmZ4ZmVEOHc5aHlTSW9TQ043c0JMNW00OVVOOHlXSjNK?=
 =?utf-8?B?bW83NjhDTmVmblZjZXBRV2NvdjN4WlIyN2lpdnJFbHhsTVB1cWJGbXhZblht?=
 =?utf-8?B?UEdJc1krZFZKQi90UTNyS3ovNTRycys5NDczQkxmTlVsN0I5eEhockQrc2h6?=
 =?utf-8?B?d0VwbkxuTExFbVdLTml2akFKblRUbUZ6U1BiUHA1aWdWS3ppRnhaTThQd0Fm?=
 =?utf-8?B?bHZxYmI4dTVIUS9IRWFGVXJiNzFyV3BkdFBiSEN1azRkUVZnK1M3RytUUFlB?=
 =?utf-8?B?NzhrdnFwM3NrV0xlOG04aEkzdTlpdW42dm12VHQvZUdtNGwydkxiNVFOWXM0?=
 =?utf-8?B?eTlIdS9NS3NUQ3FERGRkTEgyeTRKUlc3Zm91Q1o5ZnJnbzFPMngvVTZ0SDZE?=
 =?utf-8?B?Z2JvV0RSeVNmRjVmbjBjVllRTlNyYUJWVFJnMVQ0Y0IwRFZETGprOGg4NzZu?=
 =?utf-8?B?N1NReXlDMU4yT2IzRzZid3RuMm5QYmJrNDBlNDlWRWJ1ZU9ROVV4NHlTcWU0?=
 =?utf-8?B?QmRYUjYwUjRsd2Npc2RGWk14L0k5N2R3UVpNVUZsSGFoUTArV1QvOGZiMzA3?=
 =?utf-8?B?NTI5aGdmMm53YTVkQWQ5S3pqYkhyMDdCSHdwdUV6b3ZtWTk0U1JWZ3pZYWp2?=
 =?utf-8?B?ai9Ma2V4VkpVdUt0T3pac2lTclcxaTB1UmU0WGJLV2kyZTVjWk8yajNZNEZV?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d1298c-89bd-4720-7c51-08ddce750b47
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 07:53:46.0721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/9id7H6P3rY9N22A6aSWG7q5fyWkdlpyqZ7JM6Oe2FVZmXm+wJ0b8tHaaXdn6Htxl+OjAWjGZkaU9TYaRcClQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6736
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



On 28-07-2025 09:24 am, Samala, Pranay wrote:
> Hi Swati,
>
>> -----Original Message-----
>> From: Sharma, Swati2 <swati2.sharma@intel.com>
>> Sent: Monday, July 21, 2025 10:51 PM
>> To: Samala, Pranay <pranay.samala@intel.com>; igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer
>> <sameer.lattannavar@intel.com>
>> Subject: Re: [PATCH i-g-t] tests/kms_plane_alpha_blend: Reduce test
>> complexity for simulation
>>
>> Hi Pranay,
>>
>> On 19-07-2025 10:38 pm, Pranay Samala wrote:
>>> Reduce the number of plane alpha value iterations, and limit execution
>>> to a single plane for each pipe to enable this test on simulation.
>>>
>>> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
>>> ---
>>>    tests/kms_plane_alpha_blend.c | 13 +++++++++++--
>>>    1 file changed, 11 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/kms_plane_alpha_blend.c
>>> b/tests/kms_plane_alpha_blend.c index 047cc57b4..696bb1e5e 100644
>>> --- a/tests/kms_plane_alpha_blend.c
>>> +++ b/tests/kms_plane_alpha_blend.c
>>> @@ -79,6 +79,8 @@ typedef struct {
>>>    	igt_pipe_crc_t *pipe_crc;
>>>    } data_t;
>>>
>>> +static bool in_simulation;
>>> +
>>>    static void __draw_gradient(struct igt_fb *fb, int w, int h, double a, cairo_t
>> *cr)
>>>    {
>>>    	cairo_pattern_t *pat;
>>> @@ -289,7 +291,7 @@ static void basic_alpha(data_t *data, enum pipe
>> pipe, igt_plane_t *plane)
>>>    {
>>>    	igt_display_t *display = &data->display;
>>>    	igt_crc_t ref_crc, crc;
>>> -	int i;
>>> +	int i, max_alpha_value;
>>>
>>>    	/* Testcase 1: alpha = 0.0, plane should be transparent. */
>>>    	igt_display_commit2(display, COMMIT_ATOMIC); @@ -298,8 +300,10
>> @@
>>> static void basic_alpha(data_t *data, enum pipe pipe, igt_plane_t
>>> *plane)
>>>
>>>    	igt_plane_set_fb(plane, &data->argb_fb_0);
>>>
>>> +	max_alpha_value = in_simulation ? 160 : 256;
>>> +
>>>    	/* transparent fb should be transparent, no matter what.. */
>>> -	for (i = 7; i < 256; i += 8) {
>>> +	for (i = 7; i < max_alpha_value; i += 8) {
>>>    		igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, i | (i <<
>> 8));
>>>    		igt_display_commit2(display, COMMIT_ATOMIC);
>>>
>>> @@ -564,6 +568,9 @@ static void run_test_on_pipe_planes(data_t *data,
>> enum pipe pipe, igt_output_t *
>>>    		igt_info("Testing plane %u\n", plane->index);
>>>    		test(data, pipe, plane);
>>>    		igt_plane_set_fb(plane, NULL);
>>> +
>>> +		if (in_simulation)
>>> +			break;
>> If we are breaking after first plane, how do we know if that plane supports
>> alpha?
>> We need to have something like valid_plane which supports alpha and other
>> constraints and then break.
>> That will imply, we have tested with atleast 1 plane supporting alpha and
>> other constraints.
> In for loop it is checking the alpha property support for that plane.
> If plane supports alpha then only it will execute the test, else it will continue
> for the next plane.
>
> In this way we will test on atleast 1 plane supporting alpha.
>
> Regards,
> Pranay
Right, thanks for checking.
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>>>    	}
>>>
>>>    	igt_output_set_pipe(output, PIPE_NONE); @@ -743,6 +750,8 @@
>>> igt_main_args("e", NULL, help_str, opt_handler, NULL)
>>>    		for_each_pipe(&data.display, pipe)
>>>    			active_pipes[last_pipe++] = pipe;
>>>    		last_pipe--;
>>> +
>>> +		in_simulation = igt_run_in_simulation();
>>>    	}
>>>
>>>    	run_subtests(&data);

