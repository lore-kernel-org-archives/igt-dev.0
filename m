Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12561C7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 14:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B5210E2B1;
	Tue,  1 Jul 2025 14:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWueUsJS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1236610E2B1
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 14:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751381218; x=1782917218;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BpmQfF8F4PkvgRxKrRWQ8lLBaEPhqC2mQhr/o+cZ/yw=;
 b=BWueUsJSvYdc0syTz1/9ggfQzEtVbK2Elrg1Zz2VpriLL8SKbUjN608X
 N+KE9uN7xSuQrPDrd6+OpLJuBDOfeRGX5bQLsszWJda1woE5NVfeG1RC6
 /1zAelMXUWedwt+IZhFwbn8HiJQli6a8eQuOhXcGB3n9UC05wyt1nBomN
 790OoHZIB50uWPcduAyYW0Kh2j1oZgpN46PqQlx1UaN5C+YCxq6JOm4i2
 rajvoXMALdEUIcuyzO0fF3e8kYME7lZaRlH/ZU4F9AzogHRk4ErRglx+Z
 U4P3TaXjnhx5OQFS2WBTsAq2um/77QiBaiLaimm318SXx/doHwxfKik38 Q==;
X-CSE-ConnectionGUID: Ek0SnLFPQDu2LwsNZDD/qQ==
X-CSE-MsgGUID: 0ArT6cFeTIWfJTz/9y2AUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="56276478"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="56276478"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 07:46:57 -0700
X-CSE-ConnectionGUID: 5CBPbDG4R4a55bNUDcCssw==
X-CSE-MsgGUID: Raw+p+WyTwWy9YXCdQazTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="158067937"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 07:46:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 07:46:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 07:46:57 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.56)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 07:46:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjExs+teQ03zWgDk/aUasVWHJJWCFblDUpxs9cC1cuJqt5Pa6gleXzW+DQ4KTG0DCn23VZbTVIj99ALwNA0m0f/y1RNImQMOX1diWdqGD1yFCLRVgVqa+XrSqQz0YVR7fNVM4wYwBWmyqnPuUdLT/swwxrnva6BxlxFR6S+0yo5OZbjElTFv0y35JvPPy8FozlVf37+lcSXI06VohME2Feu7BNY0S+V+Hx6tXqumGLMU36Lp+xiNMLsMEXZiLezGi0q7k36boQisfZT7ROF5/O/4jab6jKIACT59/TGpc1P4TicBrahDwf+/7w9QIkn9UZSyb5jS0qrgULcGy97cmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itkjBAJImUstxICd7o6yJ8zLbJbExDzCoZsyAIy442g=;
 b=P1enmeYBz6r2uicg+/KO43TSuVUuo05SkYG4rY5q2odRp+LWTc+18HjnTFvNm2SO1/7pgzVZSeEY+DH6HtQXiiAT2XycGK7OjQGSi/POq79xs72mCx/r+/+QWle+krqp/u2CBkclzCFcAWUV2+kNxQpWmyH99J0DagHW7XiMomSyfM9yORRU6pJw973Zen5W7cpmsyv41ZswxlLy5/OXkA67mJli22r2GvRfoZexRgyPCdgNgMWir0/QwZGk94aZvqAHTNBGr8oLQrT3+pvCN8BFtOn6uw6BPuGd/6Yd40h1O9HOsR3uFDmAoSyocSHh8KxZ+nHO0PRFRi0a+a4rJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 14:46:54 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 14:46:54 +0000
Message-ID: <f0ad1894-d0e1-4f9c-8259-3b9c6acb0f1e@intel.com>
Date: Tue, 1 Jul 2025 20:16:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] tests/kms_flip: Adjust pass rate threshold
 based on frame rate
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <uma.shankar@intel.com>, <mitulkumar.ajitkumar.golani@intel.com>,
 <arun.r.murthy@intel.com>
References: <20250701110149.395301-1-ramanaidu.naladala@intel.com>
 <20250701110149.395301-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250701110149.395301-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: e0fbba51-581a-42a0-e6f4-08ddb8ae1f0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|42112799006|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUlNYUcxVnFZeEtQb29NN1BrMWNDTTRLWStmY0Z6MzFkb2ZlOVpGc2I1RzIw?=
 =?utf-8?B?cnFrQkp0Y3Q0b3FyM1BvYkVpSElHeHp2SWM0N0ovUVhHYmRIS3VGWWNCTzFo?=
 =?utf-8?B?bWlYNGdPQU9aNWtldjcwOWJ5dnFITmhiazV0R3U0OFE2ZHg1elZqd0djWHl2?=
 =?utf-8?B?M1MzdE42UWpBV0JjbTgzWDZMcjZzZFM0T0t0aEd1TXVyYXdaOWpFK0NNdkpt?=
 =?utf-8?B?aUp2QXVNc0RwSE5wazYyRGhxbkd3Vll1QlU1RzB6bnBoNFNUM0ZtTW9vaGVM?=
 =?utf-8?B?SVdaV1hEdk1LUG8rWlNFSEVOcU1LQmVUNEpYUVBLQllmZnVqOGZ1RlcwVFZw?=
 =?utf-8?B?VHA2QmpMdVhQejVPdzdxTGp2RXptNm9uUkFqWkFtYlEvYlFZemhPRUUrOHRx?=
 =?utf-8?B?NnNuNy9lcDB0U1JvMFRUdUFhZDY4dmRxNDN5M3FnNXcrOUdnckZRZ0lKdmc2?=
 =?utf-8?B?aFJYa2VDa3ZXc3VqZ0c3SGFySGVVTGZsL3l2L2crSHZHTDFacHNEVkE4azdm?=
 =?utf-8?B?bG92ZmsxWktzZXRCM1dVU1gzZVU3emlnTTdqaUM2bmloYUpVT1BFclRyZTRu?=
 =?utf-8?B?YXdES011TGx0RG5kMzZnQTMwM1k5Mnl6WFF3dFVEa3hsaHlOaE9Vc3JwUzRF?=
 =?utf-8?B?NHJ5V3lSdTJuNnlROW5lMW41bEdKckxtZ3IzR3VKRlgyUU5RZkFVMWlicnhW?=
 =?utf-8?B?RTBTVGZ3Q0NYLzdVVnRGMEZGNm1VZzRsdUF3L2p4R3NFb3JwTHM4RzduUFVJ?=
 =?utf-8?B?ek5aQlh5ZWdyQlJjSmo2ZVppT2V3NlM4RnVrdDdSS0s0bjdST214RVNzclYx?=
 =?utf-8?B?T1lXbFNDdGhPa0JRQ0NROStxaFN4RS9HRkZiTU0wUDJ6QyttOGk0ZU1PYy9U?=
 =?utf-8?B?YkVDMTArdDJvREhNSWQ5OXVoRjJ1N2d0N1FzR2xzeTdiV0RaRmRmU2thVVBC?=
 =?utf-8?B?bzJ0anZSNHRjRzBLZWVPVitGN0k5Wk9LUWljaWU1MEtzS1QrWk9tUWt2UlJ2?=
 =?utf-8?B?aGtuUFVnNHY0R0FGNE1oUm4rNU84Z0hQYTJHY05zMkZ3MmJFUkpxNXlrdU4r?=
 =?utf-8?B?WlpMR2ZKbHByVytNRGl2ZnJ5RDBKbktiY0NhbW9rSGV4LzhEdnVoTkpkL2Vv?=
 =?utf-8?B?dUV5TzNVY0x1OGtWRjFCaXFneVRONWZTMHdNZzRncVhlQlhTbUtSWlVRZVdB?=
 =?utf-8?B?RVp2bU5KL1oxa3B2c01OcEZBMCt5bHd3SC9nOHY2eXhOMkRaaU5qVkpQbG81?=
 =?utf-8?B?TnNuQUxOSDlEZkh3M250M08vdTlNeXBZd1B3eS90MDBoVVFJcFI0T0hwZ1cx?=
 =?utf-8?B?U1Boc3pPR2kvckcvckdQOVdhVkZNdi9Rak56TE9tWjk0Z1VZamRPckt6SWlp?=
 =?utf-8?B?bzd1YVVORzZzUUR5SWZEa3RUZTRpRHJqSGhzK3QzY2lhRGZlNWpKN0VDNEt6?=
 =?utf-8?B?elhyUWFnazd3NDIxSUtYYnZ2L05TZU1tU3VZcW8rdmIzRFp2bFRkQ2VYRllx?=
 =?utf-8?B?WUxleGU3bk4xZUFScG5Ramt1bi8vODNyTktCUkQxZzZFNjFJTXhVRHBDWWd5?=
 =?utf-8?B?TXg0ZmtvS01wamhMcFo2bFNublZFNGl5cTBKdEV5Z2NvTEN0UCtJOXZndk9h?=
 =?utf-8?B?NnZaakR5MUQzYnJITlNaK2RrMWdRUGlQWlJPTTRQc0JvclZ4NThpdHd2aEk0?=
 =?utf-8?B?RFBVQTY4Ukh4bzMxRnNuRmUxVG1XSXRBVisvM3VJcGJ5K09RZXhIYS81Rkxu?=
 =?utf-8?B?NHZ3TU1TcUM3Tm9jMTVMQ0R0Y2hZZVpqOFl1cmdLdldHd1JuWHB4d3RLa0ZF?=
 =?utf-8?B?Vk9yeEdYT3FEZ2lJbHAyMit3YW0yTjBoOU95bzdlUi84RHlHZTE3NFFFaVZJ?=
 =?utf-8?B?QWpNWmdLSjdWMlZkckZUbVlvakJtZnVNbE16VW5TR1drazA4cHBzeVo4enRk?=
 =?utf-8?Q?YcOY/N5uVN8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0xVZEpiRTdLbE9BR2xVcmh1VmZjckhkNmp0RC90enpNcjFHemVxVXRZUUhF?=
 =?utf-8?B?Ynd2NmNkT0ZkUll3ZXcvaU1YNU1kVXc0c1lOSXp1MFVleGFjVExxRWVsMWVH?=
 =?utf-8?B?bms4VWthR3A1QnBzWnNGWXduTGZDQXlEbmdSaGhLQmp3YUVKVlJsaHllMmNW?=
 =?utf-8?B?UzRTT3Q2R1VhQ3R5d3ZRTGJDaTg3SkprS3podkdQSlhUeFE2TVNxT1Bsa0ps?=
 =?utf-8?B?ZnpEeUZoUnhNcVhydDhIMmg5a2ZvUWpmSm9DNXdkRUZnUk1qbFlTNW1ka1Zy?=
 =?utf-8?B?aE5wRDV4aUVtV0xBLzRRb00yOVpLRFZrZDhkekdKQ2Z5UXFyR1BOQ0RneGpy?=
 =?utf-8?B?aWY5czZXWW5HNkZJcnIydDkwK2dRaG40SlR4VE9OajBkMmh2ampuV0VsZ3ZY?=
 =?utf-8?B?V3lZM2RXWGNYSTkzdWVyMDRyN2JOUllCY1RhUjB4dE5aT3VYeUZ6VnBrQkV6?=
 =?utf-8?B?dEgxbzc4ekNvejNsbUYzQzNJMngxUkRFRDdSamkyNnVRYjNCMVlZR2toRVpD?=
 =?utf-8?B?WnQ2NU85Y0RKN21sQlR4N0xuZWVPQ0JOZmMxN2oxcWRpSGltZGJVYm1qZmR3?=
 =?utf-8?B?aG0yT0NtV3ltNXdZdzlMRjJ3SzVnYVE5N05NU0ZuU2VWQklaMjJhM3ZrNTVG?=
 =?utf-8?B?UHdWbzlEdEYrY3lhMUk2d0Ezc3Y0RXQ1THdFbDdIRnpWWDh4a0lWVTJ0SEp6?=
 =?utf-8?B?OS9NSmZLMmJONmR1T2VzbEFBMjNhYUlORVFyR2hXMEM2R1VMT0QzUTZnNjk2?=
 =?utf-8?B?bVd5bVEyUzRWNTFPYWk0OTllUk1NdTgvdklmWmhiTTVMM29OS0lpR2UvUmVw?=
 =?utf-8?B?bUNFUmI0cWtzM3NWSFRkN2swV3NoRzRnMUNIZkxrZXVMUlNTRnNOeXhwdFBj?=
 =?utf-8?B?MXgxLzhwNmRmV1JVei9QcDJVVDJRWGFGNGVZcHFpTS9INWFYdDN6czRlTmxU?=
 =?utf-8?B?cU5EVWFvWWRZU2ZSVHpVVFhCYXNwM2NXSHozN2RHbE9NdUlBNWtyV0ZFaW1Y?=
 =?utf-8?B?Q3cvckRzSHR1TDdEYnRYVnBIUWVrdDVYeDZHM2xJWE5kd2hOS3F6S1dPeTdk?=
 =?utf-8?B?UnZWYjZFLytUc295TFJrY3o0VEc1QmhsbnFQbExwd3NXZnk0N1FxL3U4Rk5u?=
 =?utf-8?B?VWZEWjNDNzA0KzZHcnFEMGppUytNTXA1TGRFbFhZSzMrY1dEYXZ1UFF4NW53?=
 =?utf-8?B?bGJOT2tJcXBTTGM4eTYxWXFHUUNFNk51YlozaWVrcmpwcXRhUDIrbDFyaEVL?=
 =?utf-8?B?cDZTN2wyV0tNYSttcmVSRkwwbzQvZlFEWlRHejR4NW05Wm5hc0c4cXd4VHlx?=
 =?utf-8?B?cDNDb0ExQVI2K0EvWlEvQXE1cUV2RFBWczErSmd6U2ZjTDJLRUw4d29hNzJM?=
 =?utf-8?B?eks1cm03dEU5MjBRSnp2dlJLbTZTVG5BQmdGZCtac3lkeE4vQWV5dHJUVzN5?=
 =?utf-8?B?a0Ywbmc3dEJXanBtdUQvYmxHTzIyNDBFQ2duQ05MaG13MkFhZ0RYWVFkZWtM?=
 =?utf-8?B?MFZEbEhCSUlPNjU0aUx2Z0pEYk5GWm9qUXNHaVkrSG9pTitCSW5xRVBnMUJo?=
 =?utf-8?B?M1lucjdpdlpJbHBnY1NnSEJoWVN1Tmd3Sk1OaTNqWHBlQXg3QWVoamxTUndD?=
 =?utf-8?B?MFlTWlB6aHZFanJXVkN0TFNkdTlCVDhxQWtCNjR6QU9tTUZ1VGxsbzh5QmtC?=
 =?utf-8?B?N1R4eTA5cU9DNGFKamg4RUJtamVSYkZHS0N4eTI0YUovRWdpNjhEM1VCSkMv?=
 =?utf-8?B?b0dNSTVSL1NNL3BHaGlGTDJLZCsvT2pseXMrZUUzcndOR0RKMWtZT2ZRM0Zo?=
 =?utf-8?B?UlhSeU5ndlBzb1pZRXJaN2ltSXpRajAvRmF2NERFKzk2d3k4aHJoelptUUZC?=
 =?utf-8?B?dXpzeW05NmYxcEozbFZyYzdyWDB5SXlvbFZwUUJ2enU0a28zT3poamRqY0o4?=
 =?utf-8?B?bDdFejBqdmRoREx0ZjVtYjNzSjI1eTVYZ2Rlanc3T2ZCQmt6ODRPdWF1SG9x?=
 =?utf-8?B?WmJGZWE5eGlzM3VIbTU0eDJCdmdzbkExcTB5TjE3cVE2alM0QW9LNUM0eVVx?=
 =?utf-8?B?dEhIdkFFK2RLdDRkbnZGUWQxdXFtVHpWQXBKMUs2Z1hSVnJlYTZUSUI0d3Rt?=
 =?utf-8?Q?uoh8Vj4yQVDtNn3kg/KPWcCJ6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fbba51-581a-42a0-e6f4-08ddb8ae1f0a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 14:46:54.5632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCt7A8iLWhIQeg5JBauMIjkimy0aTiYp5v3NSckhc+iCyi12hEkb8OEWKOixbZ2Ahg9HX8r912G0TtxEPuoE+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7733
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


On 7/1/2025 4:31 PM, Naladala Ramanaidu wrote:
> For high frame rates (>120 fps), the pass rate threshold is reduced
> from 85% to 75% to account for increased timing sensitivity. This
> change improves test reliability on high refresh rate displays,
> where occasional frame drops are more likely due to tighter frame
> intervals.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_flip.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 98bdc169d..4dfa1c483 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1228,6 +1228,7 @@ static bool check_final_state(const struct test_output *o,
>   			      const struct event_state *es,
>   			      unsigned int elapsed)
>   {
> +	int threshold = 85;
>   	igt_assert_f(es->count > 0,
>   		     "no %s event received\n", es->name);
>   
> @@ -1239,16 +1240,19 @@ static bool check_final_state(const struct test_output *o,
>   		int expected = elapsed / actual_frame_time(o);
>   		float pass_rate = ((float)(count - error_count) / count) * 100;
>   
> +		if ((1000000.0/actual_frame_time(o)) > 120)
> +			threshold = 75;
> +
>   		igt_info("Event %s: expected %d, counted %d, passrate = %.2f%%, encoder type %d\n",
>   			 es->name, expected, count, pass_rate, o->kencoder[0]->encoder_type);
>   
>   		/*
> -		 * TODO: Review the use of the hardcoded threshold (85). This value is
> +		 * TODO: Review the use of the hardcoded threshold (85/75). This value is
>   		 * currently a placeholder for the acceptable pass rate. In the future,
>   		 * we should either justify this value or refine the logic to skip
>   		 * frames near the evasion time.
>   		 */
> -		if (pass_rate < 85) {
> +		if (pass_rate < threshold) {
>   			igt_debug("dropped frames, expected %d, counted %d, passrate = %.2f%%, encoder type %d\n",
>   				  expected, count, pass_rate, o->kencoder[0]->encoder_type);
>   			return false;
