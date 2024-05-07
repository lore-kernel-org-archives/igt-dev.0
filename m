Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD2CC25B75
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 09:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984EA10E8EF;
	Tue,  7 May 2024 09:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hHsBPESv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2129D10E8EF
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 09:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715075457; x=1746611457;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZymakgmxEsKbpCnaPq09mH4gu5HhsLLUMnlV+6bL6P4=;
 b=hHsBPESvhW2BRIolCnYkGFJk6awnJCHo1pwLtNdWQ81Hl6ihb+EFTvdb
 4NOXrwvlleVEJ9HWCsIwEInjNe0k9H8VrmoP8VKAEtGJQmsYDWzi0lLa4
 AckPP3xpuQgQQ2mNiAop9rkTanRufiNh1gwmg5F52e/Z5V2sXC/rf7ddA
 hv92F4LEx80/hTAT10fETrVouBJEFVjGNcYOY5vB8Jatu1tPEn82o+BnW
 N4KI3ks13KW0Cvt9ubVghpIGC1iV5e17JkqH66AqmItl6P5Wf+ieX588k
 wGsEsOURzJI7TqlgfAQRP0KVL5CFor4WLvWnDCtG256ucS+Su0xBYg70a g==;
X-CSE-ConnectionGUID: cXJZ6mW7RiOJtyfqnhqRzQ==
X-CSE-MsgGUID: IksWFidxSdeWHM42rzBODw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="28331934"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="28331934"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 02:50:57 -0700
X-CSE-ConnectionGUID: FsDegI7tQyaDCsTW/6UkwQ==
X-CSE-MsgGUID: RJLwDE2lTF2c4l/5dwcJXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="33288661"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 02:50:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 02:50:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 02:50:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 02:50:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 02:50:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0sHtU3McU3sJMYTcU275FQQZSZIM7cEzD/MX9Bie03QN74Dba8A4dua/WxWUC/Zpado7FlbkqykaTZ7he4T3xEeHjcNFHya24CIhoi1kg/rZWBhq0yKDcuZQS2VRT18lsvGUzaRCqGuso2xBN+wzUY7n6fl/Fkbb9pDHoyiKfRLRvEOEu2zulvN464Vbg8v6QsvjFqFPquUt2T3himsjsDlU5rHqqYImTakjF6zQcVxfdISgf29MkeifVCTFw73JizyMI0dX6gB8syZUhKfbwDEf6P/DMKWgKh2CM9L22Udjx78Dq1+G3igPwKk2pPG86o/milYaytUP7lFVgDx7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozWJHpB8rhezqNFv4MMUqebu9YhfegrKOQ1W54rpmXA=;
 b=LNgBdF34YfVkm69Qy9a+8EsyG/GBihNY3yirryDCJjpX2SkdjVhWX/iqsVfbZcV3SNSXNdlek2kDPsEZWJUGAHmT7BqOqldnIaNEEJxD5LAt0KM2phXLVTX8CqprEi6FcsBv4HauyKOz8SqlTg66Inm3gUcA6MZD6prT5SLYFi8R60vyRhXqYA2WYHTnM5KmqqVHiq8V99cBnCoaPI0E/z63sc4gPJOB27r4pGHexqr55K/SVK0nTEJ0NI1h5o7gP5V7Bvg9d/MWey9DwC9P8Qh+nQKxhSFXkVaKlpM3kcgkko2svFgLmC/dsWhHCAa2iQmaN1CqMpI5hxynA54/Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH3PR11MB8238.namprd11.prod.outlook.com (2603:10b6:610:155::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 09:50:54 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 09:50:54 +0000
Message-ID: <e008eaa9-b2a7-466a-8dd6-7d99f85f1abe@intel.com>
Date: Tue, 7 May 2024 15:20:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_pm: Add mocs S2-idle/S3/S4
 suspend resume test
To: <janga.rahul.kumar@intel.com>, <igt-dev@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>
CC: <matthew.d.roper@intel.com>
References: <20240504130458.2102132-1-janga.rahul.kumar@intel.com>
 <20240504130458.2102132-4-janga.rahul.kumar@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240504130458.2102132-4-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::32) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH3PR11MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: b4bc00a3-82ef-4893-dd26-08dc6e7b2f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGlwam5jVzdheUlzdTloQVBtWlRoc1UyRzN5YmNzcUFwVEdJNXR1VEl4R3lZ?=
 =?utf-8?B?TjQ4T2xSYjA3eFE5U29wYm1mVCs4NVdnRG4vTVRqYTdzTDdxOGRHSlh6ZXFl?=
 =?utf-8?B?Y1NGYlJuRXRvUGpZN1hkYWZFYlVIS2JObTRNMDVJZHNySHJ6M3RWWFNQb3Ro?=
 =?utf-8?B?cWQ5NXBDYVZEZFQvck5zL3I2VW5BelkweFBxSFhZb0tDYzlER2drMzdMUHcr?=
 =?utf-8?B?TllSK0xXQWkwdXdpd01LR21Pdk8vd2ZyZEhWWklya0ZzS1FaOHBIanZldzly?=
 =?utf-8?B?dC91R3cwd3l4Ymwxbzd0OVpvWEtRaFF0UnFDajVueWJMVk1ITXpDVlIzUzF2?=
 =?utf-8?B?Yk9nMkJxWVM2dHUzSnZQZWFxL0pxemZKSVh0a3lmZmtrdWFEbXhwTTZkQjdv?=
 =?utf-8?B?RnN6b3RNaWZmNGlsUHF6ZEV3Uk1vMm5oL1pxMlhpc3V6RDhGS0hLVkZEOWhq?=
 =?utf-8?B?b2ZieWJwcnoyMnVSQm1tdkRGZUxPcXNFeUJYcHdFUVpybzFWWWI4RnhOWjQy?=
 =?utf-8?B?TEFVVDR5bmFUMFJnQnFuYTNMRGZIUXExaERvYW83eDV0Q0J1QXNGMFpSaDhl?=
 =?utf-8?B?RXVmNmhnR2VlSFVtMGFXaE5keGh0b1VPTmRLK0dqTkNBN0E2RzVoSDNsMTV1?=
 =?utf-8?B?dm81b0RpaFdoa2dxenBvUm9kOTM4cEMyZTVZejBaWjZLRXZudzU4NHVMRmY3?=
 =?utf-8?B?UVBCS01HTkFBd0pNUmNNOFR2clM1WUxlNmFlR1ZLaUpZWHBJem8yZktYZC92?=
 =?utf-8?B?RktnaFBZWVFOTWRSaXVqY28xVytwZERWeXRnZFMvNDdsUjdOaTB5QjhyaE9v?=
 =?utf-8?B?NjJvcFlxU3NlKzhla0dpVlBrMjdJemFlWkFNRk5CQ3JUNE4rYXJDRiszQWpw?=
 =?utf-8?B?YmdaZEFyUk8rMjZWd2Z6YlhiRTlqK1pTd1N2SDlkQnRaVDdZdWJpeTRwbXF6?=
 =?utf-8?B?dTZ2R051Q0VETWEzbU9sSWhCc21nWVNnYXdYUFhSU29mWCtJNkd1alVBbm5N?=
 =?utf-8?B?dVQrVEpmS2FsdTVOVCtWK0NDT1R3blc1QXJPYklZUzhQUG4za2czSUc5cDVG?=
 =?utf-8?B?SUFVOE0xb3pyL0NxTG81bG4zYlBiV2lwcFFKaFRTYitza29Xc3g0L05SSmhZ?=
 =?utf-8?B?ZlNjeENjZ2JCdEtiOE1ldnIxWTJXd1V3Zkh2bExIWFhDK25LblBTY2lPaU1K?=
 =?utf-8?B?L0FVRkdEME9ncWNVUWpEbkZkd05sNXhyaFcwMXI4SlV6U3BDVi8xakJLVkht?=
 =?utf-8?B?MWtSaTBCWnU5aFEyM0c0eDRyS081YkJpTSswS3Z1ZFg4WWl6U0FhK2lVTjJw?=
 =?utf-8?B?RnRhamk1MmhNd3JzVTE1SElZZHNXaVFVbmcyMy9oUTJmMHNGRlNGWDNoejlY?=
 =?utf-8?B?RkI0a0xJOWVtc1FlMnVkUkdROTZhbW5FOWUzUnVKaU91c2dOUUQwS2toZit6?=
 =?utf-8?B?NThzRDFaa2dsNVNncjFnOUFHRVhnOTlYYVJOcitRaUVZRHk1TVlWVUlvT1cy?=
 =?utf-8?B?UlpLSk5JQTNnRUhKcmw3S202K0tGU2k3bXV5RXY2MnNrdUdWaWJKakR1YUZR?=
 =?utf-8?B?dlhjalkySnlWOC9YSXZWY2FwSUlJbkpLOWUvcXJzbGNLNGZjQXBoQ0JJcUtC?=
 =?utf-8?B?OVFORzd3TTdJRnJOWmNYMFlPWFFqZjNQdmJoUEdZdUV6YmxQRThIVEwvZ1lU?=
 =?utf-8?B?OGt1ZVpKeWR6VTlocFJNQVY1ME83cG5kQi9WL2l3dURnU0cxMGZrTWF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWVZbkE1a0MwTWxiMFBxaUZMS3o3MmNXUklrZUJVYWwram9PRHZkQS9KSHV1?=
 =?utf-8?B?UW5pNmRuRC9PZis3d1Bqa2MyNk5VQmlWVmZCcDZsaUxMY3cxQWloVkZqbHRs?=
 =?utf-8?B?VEhBcHNxUDArZ2tHOTI3Z1lMMitpbldtT3RWRm1yMnlCNUpUK3lJVVpXa1l1?=
 =?utf-8?B?QjNOaHdRN2s4ekxSMFUvRjlZQkJ2dVB1SzJxRVpuclRrU1ArMkpLWWViUksx?=
 =?utf-8?B?M0JJWC9KWHAzeUkvSk8yM3dZazBjYU1IQlFkekRPT2loRncwc05YUXU0TklO?=
 =?utf-8?B?VVZiTGdGRVNmdlNab3AzNlV1MFk5YkhvRURLZ0IxRWd4b1AveU5UZGNNRTFC?=
 =?utf-8?B?WFFwdzZIeDhlUnFBdEZ3cklyWXV1SlVEeWxCNG0rN0c0L2xwWlRqYlh4Z3RB?=
 =?utf-8?B?V3RLWTNzMER1S2E3ZklnNEp1TWZJbFZvYVdxZy9henIxNFpsSll0aEt2VjdW?=
 =?utf-8?B?dmYxQi9NeXpsbWRGeitNU2x5R3NQMmpiTk4zQkFVRk5oenJVSksrSlJQUXlz?=
 =?utf-8?B?SFlVNmpBbkoyN3FJTm9DbitSOVlQM08rc0NUZEpoTjJiM2E1R0JPa3JPWmdx?=
 =?utf-8?B?YXhGcisxU0pXdTB0NXlUQURrMEhRNTVKQytuUjBDaTJXejljeFVreHMrRldz?=
 =?utf-8?B?L1kzMml0cUFWQ0JWaTFDTHJUWEwvMWFuNVBqYjczOXhLeW91UlMzdlBrdjdz?=
 =?utf-8?B?a3FJZ1NaSFFaUlVuVFB1eUVMOCtPUGJXQW9XYVFFRE1mU3p2bjVObEhTaE9l?=
 =?utf-8?B?RGorL1VBVlJvTWtMRXJ1VUVyczc2QmNRL3IzVlR6L3htVnk0SGpVdnlsU1Vx?=
 =?utf-8?B?dnUxMS9tZXdRNTJZclNuVUhESHVvZEp6cHVqUE9XM3E0VTMzSW4yNEsxSmJk?=
 =?utf-8?B?WjFNMXppQlIvR0lGM0liYnRpdmNHUWlDVHhsaWI3Sk9XdDdXUEdFRWVJNHBM?=
 =?utf-8?B?VmI2azlZeGpYVnBLQnhFcGVMc3NXc3E1UDMrMjNoZUhkbnpBdzcrKzZsZmJ1?=
 =?utf-8?B?VTRHRGdpamNWV1UxeHI1QTZQUVJsM0tlcGVuTkIyRy9ldWd4bHY0MGJUVzcx?=
 =?utf-8?B?VUlHb1RlRWJHcjRrVHh2aVkxVDNjSlRkMzlzaGk0Mnd0amd5aHFuMklCVnhq?=
 =?utf-8?B?T2RKalZ4b3VrVHNwUGRWRURKOVR5NEtOZzdzN3kxb3B0THVnUHpOK29Nd0RZ?=
 =?utf-8?B?L1dwU1ZkbWo0YW5xUGhuRExhd1dDZlZVc0V3eGNhM2RrNjc5Wi92NHp4YjZu?=
 =?utf-8?B?TVFvTjZScEcrS2JsMklrMWdsMFc1bXJGbUdhaGs5djBPakExOWFHSy9GU2p2?=
 =?utf-8?B?T0hPYitlMHVrRjNIVmZDRjRhcmdhb2R4R3R4STNZdFp5TlQrdXBGYllmMys5?=
 =?utf-8?B?UGNsaFQxKzFzUTVJcDRGNVJPajVqWFU2RlUzNGROaVA0WlRZdDFnYnRoNVFR?=
 =?utf-8?B?KzZpOEowRERBdjAveEszbVNlSE1ockcxSlk3d3JrbmhuRFZjeXV0MGJDcU5j?=
 =?utf-8?B?dTdOY0xELzYrRWI0cTR4cnc2SjViWWlNZEwzMEFWM24rb3IvWitqODhYUlp5?=
 =?utf-8?B?eXFBN25XWGtyeW9KSFJMSE41ZkFZWktKY1kyVU14QWFBVU45TVdDYUZucWc1?=
 =?utf-8?B?VG5EVURseGFYZEJ5YmRaRjBaUmE3NVNGQW41aFFYNEFrRHBwb3pWMlFMb1pn?=
 =?utf-8?B?aE9icExJSnFBSWhMYjByNmpicTM1TnRyWVpLd2VMK2E3ZVpiRVltNTVXWmJC?=
 =?utf-8?B?SU1vMDd4SkR2cEtQNWN3em4vdDRkSlMyd3Z6cmM1cVVBVUZDVDloRVRDNlJJ?=
 =?utf-8?B?T0tHQnAxYU4wVlQreVRYWFE3TFVXQ2R5cXJlUEJpeDNudEpZelBiM1hCbDBy?=
 =?utf-8?B?bFB6NkdWcWFHbGhzV0toV3hnS3NidDNGZEN2eXJOaXl2dGphWDNxZmtSd0RM?=
 =?utf-8?B?WWdWRTdxdUxTdUNvSVh4UzFMdVFOc3Uyd0dlLzFCQS82R2E1TE1jclpDUUIy?=
 =?utf-8?B?T2RhR0xNUCsydmx5VnRTT2w5ZDVrdFM5Vy85MitDK2dlOFBEV3dMOWcyK0dr?=
 =?utf-8?B?R01QVWdIYXp3OW1ZRWI2YzcxQWVwT3hzYk5vaGJyZ21xQ3hZQm1EVEp4TnZD?=
 =?utf-8?B?T3d4Zlp4NXJjS0NtaGhPZmRiQzRmQk5weHVKTFJjTzZiSGRwUnFtSm9zczI5?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bc00a3-82ef-4893-dd26-08dc6e7b2f9c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 09:50:54.1697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpcHqYJ43MrChsyf+sF6N+QwfPiVVqs+4464zM1CwIlu7l3BhXK+11MOqmbx1BNGo0hEEO73lSiRom1Kk4JbxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8238
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



On 04-05-2024 18:34, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Add test to check mocs values are retained over S2-idle/S3/S4
> suspend resume states.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   tests/intel/xe_pm.c | 29 +++++++++++++++++++----------
>   1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 73fd57636..fe77512fb 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -251,6 +251,10 @@ static void close_fw_handle(int sig)
>    * Description: suspend/autoresume on %arg[1] state and exec after RPM
>    * Functionality: pm - %arg[1]
>    *
> + * SUBTEST: %s-mocs
> + * Description: test checks for mocs state before and after %arg[1] state
> + * Functionality: pm - %arg[1]
> + *
>    * arg[1]:
>    *
>    * @s2idle:	s2idle
> @@ -617,7 +621,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>    * Functionality: mocs
>    * Run type: FULL
>    */
> -static void test_mocs_suspend_resume(device_t device)
> +static void test_mocs_suspend_resume(device_t device, bool runtime_sr, enum igt_suspend_state state)
>   {
>   	int gt;
>   
> @@ -632,14 +636,17 @@ static void test_mocs_suspend_resume(device_t device)
>   		igt_debugfs_dump(device.fd_xe, path);
>   		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
>   
> -		fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> -		igt_assert(fw_handle >= 0);
> -		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> -
> -		/* Runtime suspend  */
> -		close(fw_handle);
> -		igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +		if (runtime_sr) {
> +			fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> +			igt_assert(fw_handle >= 0);
> +			igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
>   
> +			/* Runtime suspend  */
> +			close(fw_handle);
> +			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +		} else {
> +			igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
> +		}
>   		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
>   		igt_debugfs_dump(device.fd_xe, path);
>   		igt_debugfs_read(device.fd_xe, path, mocs_contents_post);
> @@ -742,6 +749,9 @@ igt_main
>   				cleanup_d3(device);
>   			}
>   		}
> +
> +		igt_subtest_f("%s-mocs", s->name)
> +			test_mocs_suspend_resume(device, 0, s->state);
>   	}
>   
>   	for (const struct d_state *d = d_states; d->name; d++) {
> @@ -808,8 +818,7 @@ igt_main
>   		}
>   
>   		igt_subtest("mocs_suspend_resume")
> -			test_mocs_suspend_resume(device);
> -
> +			test_mocs_suspend_resume(device, 1, 0);
>   	}
>   
>   	igt_fixture {
