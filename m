Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72871E64000
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 18:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2B310EA17;
	Thu, 21 Nov 2024 18:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGeBQA3c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC12A10EA17
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 18:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732212316; x=1763748316;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=s7av9uAQlp+LV/K8Es17kZc767iC4HRaGn2x54xp52I=;
 b=NGeBQA3cSyNoQ0us9HPtlsXaUSs3ZJIPkaiQQ2mEKyNU7sc4M8Y+/9ak
 6WDKKjoc7mUM7lOYdVYuFwTThlE66jqyLOov0qZu7C4xQW/2DL1WsoZTj
 iRRkpmC8+SzvxZ3s+3z+h4qT6tDqK3dRMFeMy3jtL4OptwUlbbpI1KFLC
 9PxtH0R4rMjBPvyRUwrEEhzCt/gBvy9NK/MKpulU2c1HKqA9xaV/wncoK
 xBnm3cxcU4rfEKFGt3fq+tzkIktyU2M+V0sof+q/UX9DmOdNQXy9xBom+
 7l65eZG9O+/AHyUQ1DcUP5OmREZI7vlkEHeEKKWstO8QovflhSk5N3nWT A==;
X-CSE-ConnectionGUID: uroa/MITQsGJxGHMQC6itw==
X-CSE-MsgGUID: jh2d5V7fTummv9LgDLcAhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32199458"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32199458"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 10:05:16 -0800
X-CSE-ConnectionGUID: KsNN3rxyT1Gu8Ujst6gBrw==
X-CSE-MsgGUID: +wtc85VkSimMKrmMJxpWfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90709743"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 10:05:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 10:05:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 10:05:15 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 10:05:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfHi/LNX6TWK3nC3EV3jB5SfUywPO0a10PiN0LNbppNLMWWpR18Wo+M5op6F1AHKX/nxo3aST2pawiF6WYRHTSMZthD8aXB+fiQP6z6YgdKTcBP1wFPJDpAKNRtTR8la+DlY00BHQ8k+iWpIswGN6i0RLVHDmWTgYQt3qWM3nNGa7lZXbDiqDuOzsNkH7psT9ppUTKf1wv6EbG/YYCZn8dsf6esO/xDnosjTJXJIsiy6/U96qNQGZF1uDiVy9BA58icXXCZRzeWfFGpnCOLWzsR7m8wXWoNnvdPUXzsdKv3NYmCSwPw+IBJqLdPOKiVct6q3yHgZlU54CMwyVQh7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqcWe5CkCWosTeVy5n73vXlt4SgNNHOQY255nqTnXWU=;
 b=jRcZyd8m7pjdEPQNT1atVUVaMbJ9q9ti9REo88Pvt0IiLaMVeEY0WCtpMokiO8e2F5nUpN4M9B/1o9w1PnpP4dJVw05voV8tPuFm9XqKeZbtnlJq6eqGFsJ2Sxg3rHGk5M+kbej7uJdE/JSRa82Q4sp3YcdQFwYMAngNmZwsS5A7J7oFWpXktehI7OWYnXinvfRIacWi2tohE19blg1K592hhUAJ5RZB+QdLZmKrq4YOkkcYqu63dqwEiRO/iWYRl807vGxJqHwc98ijUptGmkggcLcY8Jv06h3oitPGgRsZFfXB53neiySVkOGATZY6uRKX+KyumwV8iTzTF93Azw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH0PR11MB4888.namprd11.prod.outlook.com (2603:10b6:510:32::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 18:05:11 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 18:05:11 +0000
Message-ID: <6c583239-5f8c-4601-8e68-bedffa90db0d@intel.com>
Date: Thu, 21 Nov 2024 23:35:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/igt_kms: Add is_joiner_mode function
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>, "Santhosh
 Reddy Guddati" <santhosh.reddy.guddati@intel.com>
References: <20241120174345.1970095-1-jeevan.b@intel.com>
 <20241120174345.1970095-2-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241120174345.1970095-2-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::8) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH0PR11MB4888:EE_
X-MS-Office365-Filtering-Correlation-Id: aee6c758-03c5-42c1-ea45-08dd0a570a43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnlDZTZUaUUzeXNWU085RUhtR1UvZkNPWXNuL3AxemFLY0lvdSswc3doSnN4?=
 =?utf-8?B?YldmRmJ4eFZhcEJ0TVdYbFRDR0ROZXBOaStXczAvblE2WEh0MEpkeHlBblVv?=
 =?utf-8?B?ZThsKzU3dDZreHhDNEZRQU11ZTFYaE85QlBySDdiV0RqSzU4TkdyMFhDY1ZB?=
 =?utf-8?B?WUZyemdUOGVFVUd1Q2QxVVZJak9RYnVaZzFLem5LUVBoT2NXNmg4VklVV2h5?=
 =?utf-8?B?cW5hYVlTTkR6YUZOVkkzWU5JczFDOWNLR0w2OXV0VWNXSm05dFQ3Y0h2emc4?=
 =?utf-8?B?ZHZxOWFqQjkrQ3k0UVUzeGFSWXdWTmIwQzYvcDhjMkZtUkl0TmFjRjhaTDZy?=
 =?utf-8?B?QnlGd1ZXU3JOMHNjZDFrbFlLcDRERlRjakpJakluamRUczFpcWk4bkd2dmg2?=
 =?utf-8?B?eFplTE9ZUjVzdEk1Wno2KytCclVJMlZaWk5iRVNta0tYRFBkY3hUSno3anA5?=
 =?utf-8?B?VmwrZFdxamFJeUtkMnlSOXR0eHNaeWpPOXRZai9ZUHo2WklodWlndlJ2U2FX?=
 =?utf-8?B?VnpNQUw1T09YZDZDQ3Rja0RaM0JPQnVTR204MlIyZXFZSFcrRVlHdTBVbHNE?=
 =?utf-8?B?SURHc3NuVWZyZWlrNWRSV0U2OC9waU5zeGpoU2x2enpSV0hSb1A2WlNaMEJ4?=
 =?utf-8?B?MzNxY3JXVEswOEw4RmxaMlJoM0wwTWh1QnAzV3ByM2VLTDd0NWk0eXk1K1Fq?=
 =?utf-8?B?dzNraXQ0bHFkd1NGUXZENXBrbGx2eGQ2QVJtdUhUb2VyTWkrS01QOFJkNFJr?=
 =?utf-8?B?RHExMFFobHdLNVNOTk16a1pYU0VabDJpOUhqWDZNeXNqUm9odTdTMjU2NDB4?=
 =?utf-8?B?UVRzRHArTmcwWUQvdElSdHV4cFpBR29rV0lyMlc5Y0MzYUlDT3cyTHZrYzNm?=
 =?utf-8?B?Y3RQamkxWWlRdDVjTjJMWks2dHNXRFc0ZmR3OXhQNHJMOWpZMzRraGFKWG8y?=
 =?utf-8?B?OXhOYnA5SndVTlVrOERPcFNiNmxYc2JoSXNwWWJtTnFSa2p3QXR0UUF3eEI4?=
 =?utf-8?B?dTUvRUlVRG1Xb1hkL2xKbjljQ01NcC83c0QxMDdvRmJsdytIN1YvemorVHJY?=
 =?utf-8?B?Y0Vpdk1tNW5lYjRXYTNMSnFKb1dUclIyNmhCUkc5YWxvNHNxcXVVc0hxeFdz?=
 =?utf-8?B?ZEFzMEI4dDR3bzQ3VjA4Rnd3SXY5RGhQQXVKYVg1Q3hGaVBmU3pUL05jQVdX?=
 =?utf-8?B?U0lGN3RmQUxPRjQvUmxLTVFPZXQrK2Y0MW50TzZock04ckcrSngwQ3A3eTVY?=
 =?utf-8?B?VnlSTTVWbHBwdTRJMWNVT3Y1U3dlaklFeXc0aEVyTnZpaVZFeGZFR3Axc09E?=
 =?utf-8?B?ZjRLd0VOUnlMS3hBM1VNL253ajluY09TOURObllUZmZqZCtXbE1aVE9VM2pv?=
 =?utf-8?B?d21OaVpMcWRvMWF6R2oxdFRpUE5vWjBaTlhuMEppWXdDc1ZwR211SGNsclhj?=
 =?utf-8?B?R3pJbjRpWWdUSi9HSGtXWk9nR1AvMzZqbk5ySGFYR3ZBWmlMbUFmZElFWHdr?=
 =?utf-8?B?OExvK1BrQ2xsWnNpSW5Ib1hCc3R4dXBXZGlmSHdlMEJoVFFsMm92QU1FRTV0?=
 =?utf-8?B?K0p1eEhSRGlzc3RBV0ZQZ1NleFQ1dTl6K0pUWjNRQmdzbFk4ekZQQVRPRy91?=
 =?utf-8?B?VnF1ZFFta2FpR0NiT1hnbXV2N2M3aEtSQlJteGt5NklaeFlONUtFbGo5NVBS?=
 =?utf-8?Q?cni4YjPQQekbFKPZDGH2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UisvQWxyRDk2d0NTdmpVekZHVnVLZktRN3dGcWdaSkNlYnlQV0RCRTdFKzRD?=
 =?utf-8?B?OEwyWWs2aHJ4VDlwMDY3NWhqenNKOWJrTUtza21NV0FTbGk1NUx2VXYxaFdY?=
 =?utf-8?B?TW8rV3JVU05lUjJXYXcraTB3a3p5cllJZDF3aDZJWTFLOTZ2RWJvejkzSlBJ?=
 =?utf-8?B?V3pRakJaWGdwQ0pDOVd3eW9OL0p0c2xUN2tjbjZIYThyQ2xud3Rwc2t0Y2J1?=
 =?utf-8?B?eFErbnplaytROGNDdkQxSU5BMUt6NmU2NmJpTG8vYmYzNE5uWUNxWWhOdlBm?=
 =?utf-8?B?WDVRZS9UMlJ5N1kxQVpMUXptWUozQktqMlVweWVxK0RhU0cxMGlkeHVteldF?=
 =?utf-8?B?MnliUVdlaEplOTdoNmZnKzB2aHN2SUZkMlgwNFNrclp6eW5DTkFyenpYLzBH?=
 =?utf-8?B?TnU2V0xNQXlLb1JNZzdUWExFZ1h4NlV1RVpjQk9tbDczU1VvMzk5SVZjYmo1?=
 =?utf-8?B?Sm8xMGtzMWVieGdnTTVRR1lpT3YwMm1hTkk0R0ZhREpIY1crLzZHTFJBL0xx?=
 =?utf-8?B?SHpjM1ZONGdZclVqM2Vwekpyd2tTbVNiMTFFZVQzNlp4eEV0aGdBbjQ0U1NP?=
 =?utf-8?B?dCtqQnJVZHNwcERqRHJ2dExXM253S2NlWnpyNHRHYUd2aWkvdHlseUhROWY2?=
 =?utf-8?B?N3BoQzFyWHJpdGZIenhwQ0pDdWVrcTJGUjZwYnZ5SUhzanlTcEtIcDl4VkE1?=
 =?utf-8?B?YmZXTm9VUGdvcjZXNERjaGZUUGE2V1Z5Szk5MURIVE5lTVplMFFyT25WRDYv?=
 =?utf-8?B?TG9yYko2bDROMG5sZkxWRkRzVHZSQTVyd002cDArQndqdWhnZ3ZlMUtRWWhk?=
 =?utf-8?B?ekJkV0UrNVhPY3BURjZ5YkZFL2JOUXRFWVpSbTUzWHE2NGdwMHdzeFVDejht?=
 =?utf-8?B?ZVdRNGlCcGd1Um4zVlg4T2hpS1dVei9IZ3YxbEJlcVpaM1JiQkFUOGRRQll4?=
 =?utf-8?B?ZXJWaGVENFR5cGEvZDFhZVBkVHhJdGRsa2k1YUlreG1xeG9RSFRXNjJ3VW15?=
 =?utf-8?B?TThMQlpzRVd6dC9WK1VQeWRIUVBkR3UyZXl3SVVKRUVkaDhIaytYdWUya3hW?=
 =?utf-8?B?R0hPVGJRUVNLazFLejFDdDVOT1MvZythMU10YzE2Y0hRVWlaUnhSSy95Q3V2?=
 =?utf-8?B?UDl1TTBrTUorOExTM0V1ZXdXZjlOYTJyaU9yUVNjeTR3WHpMZ3dkZFBDMG9a?=
 =?utf-8?B?L2pCU1FFR2xnMjNndGZKaGlFeGpibHFOY3dxR3V2amJmMlBNbk5JclJidVZr?=
 =?utf-8?B?SGsva1QvYXNkSkkxc0VvUkYweDU3TFVqZGRSWStMVGt2dm9yT2pGdWZxMTVT?=
 =?utf-8?B?SzQzWUY5QlkxWGQzNlFKY0RhU2JMUkdtZlc3NnhQSjFuMnNrdzhCQ01UdGI0?=
 =?utf-8?B?aHRUREtLUTM0SmhRZlZ1Mmo2eVBxWVFuZTFjU2UweDBrODMrZ2NqSEdDVkVU?=
 =?utf-8?B?UWxIN091SVhMZWRJRjJoMHRpRWZBWmtFc3F1OVduV1pWeHd3YlozUWhadUF2?=
 =?utf-8?B?TE1ZUHhZV1h1NWN6aDNlZFk4eUpFWlQrcDRsSlViSTBWK2dhOHM0OXlNVVR0?=
 =?utf-8?B?V216dlFBRFR2UkRmS21mSzVtditPZGxuK1VRYzJ4SUZjd1NuVzNneHdyYmRa?=
 =?utf-8?B?RTBOZXpWTHo1VUtzMGgwRklTejVMZmN1RDJLWERJL0s2U1NaaURSekswZTRk?=
 =?utf-8?B?R25uMXkydDhCZmFQY09KVDB6Q0t3Q2V4SkNUd1V6RFRyZ1doNWx4UlI5Wllo?=
 =?utf-8?B?L2dlSVEzM0xuU0hYSTh5cWN0aDRhd2xGQkJOajJreG1BY2F0VGZZLzBORlJF?=
 =?utf-8?B?eVJzS21iWFJHNkFxRlhqZVR1K1h1Szg0UFRSK2JNelRPOUQ2RXF1RkhXMjJr?=
 =?utf-8?B?b3RYck9GZkZBQUZtSDV2dEgxTmRYSDV6Rlo2RTZ0WWNFY3BWdlZ0UjBtVUhV?=
 =?utf-8?B?Zm9oZlI4QlBrU1laOFdPTGZPQy9yYm9FaWFQSExvM3ZMeDk1TDFHQmVpUjlx?=
 =?utf-8?B?SlRsSXcwTGNwemgvcEJ6eitBcUR4Z3pUNmxVM0llcEI4amhReHRvQ0ErcTdu?=
 =?utf-8?B?UzEwZkI5UXRxTVJ0aTJGL0w4OUg3WFQ4Q3lMeEw1MFJHVFRyQkVtcitOZy93?=
 =?utf-8?B?VWljaXlOOG1kMlFJZnBmYmdCRWV5OG5kL0IyalZLWDJKQjBMaDBrTThSUTlH?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aee6c758-03c5-42c1-ea45-08dd0a570a43
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 18:05:11.0859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0rGeLchbwDhm7gh88FyzqNJhQY+silcbNgZO8+E8/2ZpXO58HmWZUEh6TugKlkm9896UKzdZc5PdoK2TfMJsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4888
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

Please add

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

He did similar changes in

https://patchwork.freedesktop.org/patch/625225/?series=140349&rev=4

With this fixed, patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 20-11-2024 11:13 pm, Jeevan B wrote:

> Introduce a utility to check if bigjoiner or ultrajoiner
> mode is required based on requirement.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   lib/igt_kms.c | 31 +++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 32 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 76f32e1e0..6fb5822ee 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6441,6 +6441,37 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	return found;
>   }
>   
> +/**
> + * is_joiner_mode:
> + * @drm_fd: drm file descriptor
> + * @output: pointer to the output structure
> + *
> + * Checks if the current configuration requires Big Joiner or Ultra Joiner mode
> + * based on the maximum dot clock and connector settings.
> + *
> + * Returns: True if joiner mode is required, otherwise False.
> + */
> +bool is_joiner_mode(int drm_fd, igt_output_t *output)
> +{
> +	bool is_joiner = false;
> +	bool is_ultra_joiner = false;
> +	int max_dotclock;
> +	drmModeModeInfo mode;
> +
> +	max_dotclock = igt_get_max_dotclock(drm_fd);
> +	is_joiner = bigjoiner_mode_found(drm_fd,
> +					 output->config.connector,
> +					 max_dotclock, &mode);
> +	is_ultra_joiner = ultrajoiner_mode_found(drm_fd,
> +						 output->config.connector,
> +						 max_dotclock, &mode);
> +
> +	if (is_joiner || is_ultra_joiner)
> +		return true;
> +
> +	return false;
> +}
> +
>   /**
>    * igt_has_force_joiner_debugfs
>    * @drmfd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 301f370df..c2fbbb5b0 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1248,6 +1248,7 @@ bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>   bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
>   bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
> +bool is_joiner_mode(int drm_fd, igt_output_t *output);
>   bool igt_check_force_joiner_status(int drmfd, char *connector_name);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
