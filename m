Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F9DC83F26
	for <igt-dev@archiver.kernel.org>; Fri, 25 Jul 2025 04:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDF610E035;
	Fri, 25 Jul 2025 04:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwSyYhBf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89C610E035
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jul 2025 04:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753418147; x=1784954147;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pJMdvhU510b7rNovLbDjdRct1bL/RV7HXjPdQ2K8qKU=;
 b=TwSyYhBffwP/m1iJqLlth/Z/octp53NsBSqMEQGV0JHVNAuybJeTIUOq
 eOE8kbjZ6RCZ9/KzgH2bayQVszCd2EN869idwnT3hB8C3zTofiNiGSI2i
 9eimiT0wl00y3F8TZWhbRcPwFBGPSCc94R+YputvmH99vtX7BspATNq03
 SiEHKbDXTg+dVrrhnFxJE4Pf3eg3Cg1AuTWwzkt32DGSTLPUMlTBhflwr
 fhmCgQda9oyE9S2FGcgN603yllJK4or8SprvVXfDMm5pLLXpRMT/UVRCK
 abkqel/UadiNu/swDwpJVIunJpURqz1/uLsFQI9hp4PpjwSHVv5BERLY+ g==;
X-CSE-ConnectionGUID: 7Wl29LbzTfSfHu6e7/Brqw==
X-CSE-MsgGUID: PcignQGBToa1MWGfp90//w==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55712053"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="55712053"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 21:35:47 -0700
X-CSE-ConnectionGUID: 6z82HiMNSh+LPlL8+rdTeg==
X-CSE-MsgGUID: 8whG/LhNRPq2DR6GmnhfGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="191697229"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 21:35:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 21:35:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 21:35:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 21:35:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1rZK+Dl8x0EAoP+t/pFKu5o/W4Rxqq5gnZaQ7ZzVZ8Ke+Bh0eoekS0vNv3vEd6/ovzHC2dbAH1W42wn6XdUb/3WSFJIYBmHyOVt1GpNQo58OtB6FMw5LjtVqwzbx5+GFaqm4AWLiqyFGG0zpCbBUUmKuWLzE05N8HYkeOmWo9rwyibETaG6qsw5WxdaavD8MJ9/zEdYcci0Lex8vbsOgkYdpAGbIl+6oAW90OKIpL0QOmiZYVTMUhdjURlhQ0OqP0kQI/BDqOuITT0hOz1wg8dR5a1oQSURzdAkd+lOJeo+H+g7AyG7ZXUGRHhzpH6g1x4YgIx6RfsxT9ZAoC0ShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MY8DNfCFHscaZKIoisLVB01XjKW2smJ2N8DYQFNI8Mo=;
 b=QWG5GoNHwySyccNZQDbXnRGdr+Qvr1+clOo4VTfkJZfx8CNagQA/qPYoODzGdWE0rfXQuAl1m6e2zD+yCvegcSNEIkEQ5ZAxbZC8VzgvzE5QY+mJL0/KtKiYtqDBd57cW1PCi986t3r7K0A+pTUGCR+VKqmkdLq/w42gE79wAxNejHdQulSHub/ZbA4AFMwfMWWp8ifDbzvXX+OoJxQMQhdsoAiiqfrRy+SFuXWBls8/FmjAttTySETagGhJXhcEpEqBYpBxmaqEKcNuoRW9g3AbuHPmArc+poj+WzP8HRtMUuqus1gyWS3oIYfmNY7Jm4HLOLU08H2OqUPKhjYR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA2PR11MB4796.namprd11.prod.outlook.com (2603:10b6:806:117::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 04:35:11 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8922.028; Fri, 25 Jul 2025
 04:35:11 +0000
Message-ID: <b98f91b3-539c-436c-a851-c77d827a6c47@intel.com>
Date: Fri, 25 Jul 2025 10:05:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pipe_stress: Skip invalid
 pipe-output combinations
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20250711092040.193732-1-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250711092040.193732-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA2PR11MB4796:EE_
X-MS-Office365-Filtering-Correlation-Id: 2910fa3c-1350-43e3-0ead-08ddcb34a3ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|42112799006|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHBPb1N0YlhlMStJdWxvamtveHdNVkxvYjVWV2RVMTBiUTBLaytZTTRWelpM?=
 =?utf-8?B?N1huUjlSeTFkbWJXaEFSM2JPSmtaMHo3MkxaUFhSci9wZEpNV2VoTktCY3Jt?=
 =?utf-8?B?R0NJVTk0UWtRaTg2cEcwMDMxYTdjMUREcGpqRnZNNUxVaU52ak1pQ2RETGpD?=
 =?utf-8?B?RURIWVc5bDdYNjRHRFpvZmQ0WDU3UkpMQmNrRkl2QjVvZTlNSTlQcHg5cUxS?=
 =?utf-8?B?dUcvbGY5eGVZR3VlQngvbXdULy9KS1lPT3ZtR2c1OEl4YmtaL1I2VjBiQmhw?=
 =?utf-8?B?TXAweWxoZXJYRURGNEpWTHBIbGVZNGNaakM2dWRUamNqNHU2WTZVc0wxTHF4?=
 =?utf-8?B?QjhmbzkxY0pNeDlBK2FzRjY0L1BkeEJhOUdhZHpPbVJiNXBNZFdOcDVDZTk1?=
 =?utf-8?B?bm10SFl0Q0Nqdk1ZN1VwbHAzNVZTa29XN1p1M2l1TFI3YlNRS09pamlMV3hM?=
 =?utf-8?B?ekRub0t3NUgvOU9rZTZIYjlVRUFRNlZla1dwckx5Z3RXMStOdUpwalBlcXVl?=
 =?utf-8?B?VmUra0gvS1Bobld5aFFWNTZIYVM1bElDcnRkREIrejlsdHJaa2R0WWorMEVr?=
 =?utf-8?B?UE45NllSdHFHNDBPa2JVNEpRcVp6bDVWUVlaUXQrdi9YMFRVeHEvNjZJY0Nw?=
 =?utf-8?B?YjJzaWtVNUd2OTFmZmF3Q0dyYThkRUtiajhlSC9CU1p3Q2IzczVEaHlFWStQ?=
 =?utf-8?B?OCtBQ0FjVFFhVEpwa0xNR3BXcmxXYzFNWGhpYlBYczU2b3krRE1ldmNyYnIv?=
 =?utf-8?B?NEhyeGhtUlNIQnZudVM4cTFidGdFelFIbHlMbXIvVXFVU243M1h6bFVKNExT?=
 =?utf-8?B?THM0RnVLK3Z6Q3BiRnQ5ejY1aGx5NlJxSG55UTlleEd6QVUxVGNtZmRUMjhF?=
 =?utf-8?B?TzlweEJ3SzcreEFYblRGUVBnVE0rSGtxTGJGM29WZ1pkRG96aGZkYnFvWGFi?=
 =?utf-8?B?UVEzM2xTTnhZSlFaU1VGM2hCT0wySkJVNkEyUUJJZFNMQmtHQzBUek5CRWFL?=
 =?utf-8?B?ZjNwV3kwQjd0WGVpMlZzME9BQXVNRzhlWExTRDJTWjJvM0JaNXZuVWFKWHdX?=
 =?utf-8?B?NVNlUEVORVA5VG51VlMvUHBxWkJ3VXZsaTJlM2xTWEEvcm5VbkY2U1NtM243?=
 =?utf-8?B?bUxFSUpPWnJndVBsR29WMkVDRFNzZEo4L0hENkkxOEJQUlVxSUpSTUZKSjRv?=
 =?utf-8?B?VWNyS244bllpdWhKQTBERUxsWnlNTkNQZXJzUnhPTVdTMmVnaVl5OXNZQlg0?=
 =?utf-8?B?ckdDQzdROEtRYWdQSmdid3I5Qm05SkVHcXU2b1dNTzl4dFNsQ1RjZ0xnNkF3?=
 =?utf-8?B?U0ZWNDJnRjlsaWxSZlRSd3ZlY015V0ExZkQ1Sk14aVVUUDVudGtEVTR0MURP?=
 =?utf-8?B?UUJOOHNzYzk5eFFTdnRsYk5lanNqdkxpQnBPN1lSNWp2aHRmZVFHRXNrZHln?=
 =?utf-8?B?UXdQMnV5dlk1bmNXNFN4YVNyd2ZoU0pPREFaM0pGRExCem5QYmRoaVFlUS9C?=
 =?utf-8?B?WllnUkZZUjdST1JlcmlSMEs1SzQzU2RieEo0SER0Z1FQVEZCbUlyM0E4SHM5?=
 =?utf-8?B?WWdEZUVSTHhGQ3YwRkg0TlFxcHRiekRseW5IY2xNQnRBOUVPQ1RscjJmOS9l?=
 =?utf-8?B?OXFETWxKbDVpNUs1MU1CREp4NHBaK1VzTjUxWSsvRGpUM05vbEJvRVZuVEY5?=
 =?utf-8?B?QXR3UEdZdmpBSUVZaVByazNTNHhuQnl3eVgxelRFV3dMelc3SEthRCtFMmdj?=
 =?utf-8?B?Vnc5OFVIUC9oMGhaWTU5SjJJZm56ZWpXTGNBRUpweWJ6NDdORlo0cUw0V2Jj?=
 =?utf-8?B?REFkOUJ4WEkySHdHM1hYd0dOR3hvenowYzFna3p0Y1B4dU9jUXlORitGanox?=
 =?utf-8?B?MUJoNkREQjlJSkFZY2czVEhhbFpxc0tDUnh4VzNzZEVGNFN1OU5UeUJ0MEM4?=
 =?utf-8?Q?t5Xz0j4OGU8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(42112799006)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Si9XQVhDSEJrK1VoV1BPcmI5K0N1Uk5USEZwKzg3N0lzSEp5aW1PaWF4RnpH?=
 =?utf-8?B?OTBEYXd5QmtXd3dMS3JMOEE2cnNQVkZRT0tzc3VJdnhxWVk2OUptcW1wRUs0?=
 =?utf-8?B?cGQrdVgvWXc2UUZGRFI0QjE5Mk14L2ZRUU9MWmtlK092VFRETXRtYWl6OW9T?=
 =?utf-8?B?NkI3VXRSTytJVFFlai9DNnovZEttUURzOGZsSzVmempmdnRYNDhKQWpvR0hX?=
 =?utf-8?B?RTcwSW9keUxaNTg3eWRzNG5TaitsR3JVUSswK0F0a1lJRjFPSlhRSUZ3NkFM?=
 =?utf-8?B?RWNzRHFLYThqK1VtY0xVMjBlSlVjbzBTcFFra2lUcXora3E1SzAvRGIvOXNH?=
 =?utf-8?B?Mm5OcEN2VTZTazFsOHViRkhlOWNTK1c2NTdOOVRvWDk5QXUycUdWTWhJaWpK?=
 =?utf-8?B?elZRL0NaSGo1ei9jb0F1bFZPbXRRWmo0TzVEOW9HNXNqeXdaTC9FUjlxVGw5?=
 =?utf-8?B?Yy9DWDBnYm1PVGhEZ3JoQURSUkptZFNWL0RGdUdlUHdEUTNnbzZ6aXVtMTFZ?=
 =?utf-8?B?L3hhSjVNS21IM1owd0gvSzcvTHNrWDZMaENIMHJiSDgyYWtHVUlRcVFJYjBG?=
 =?utf-8?B?cTdSODZsQjdLbEgrRGl1YmUwQjRsZ1FoTGczWG5KVTdlbGdoL0tSaml3Q3lJ?=
 =?utf-8?B?Qkh0VEthMy9wTDNPQm51eHpITUR4UzFwOG1uMjUzakc2dE9VTjVVdzkwM05T?=
 =?utf-8?B?bjFDdlNoTUJFL2EvTjdsdmpva0RhZldnWGNqa2dLdVBHbGtNNkd0L2Uzazk4?=
 =?utf-8?B?a0tOdklHQmk4NHBmL3BKQTBsTmFjdGVZTVNHN1UwaUVnN29OYkRVK3FJUDhm?=
 =?utf-8?B?ZkhsWWtTaW15eW5EZ2F1K0F2Z01qUWhmSU1HSm40Ny9OaTQ3YWtsM2xzaWJ1?=
 =?utf-8?B?cE9zRTBXYnV1c3ZEQzBUVXIyN3FEOGcyRWFLMmpKWFplTEtXanZiVm9ZSkF1?=
 =?utf-8?B?THRCS3MwcVU1QklxNjROd3RkU3k4NWJhZjVnbnM1ZFgyd1RqTHFGcHNFaGpj?=
 =?utf-8?B?RjB0cEo0NitCYll3UVBsSCtjNmdhUTRFeXM1eXpHL1JUTkM3R0tRV3Rnbngv?=
 =?utf-8?B?ckxFRnBBbFE3Q3o5Y29RYzZqRG1tMXIvVjJMYzFqcWJuQmtFVWtRd2N6Nk9U?=
 =?utf-8?B?MmJucE5nZll1R2srTzBYUG9oNkhpWjR0YVovTitjdW5kdVNONU5yR3hmN2tl?=
 =?utf-8?B?N3FxdzBjaGlpbVZQaVhPYTh1QytORDRNKy8zU0hXNE13a0hCZTgxVURkZitI?=
 =?utf-8?B?OXBQdnZTbXNhYzd1SlJrVmIxNzZwS2l5UVVLTlhCK0xZOHZlU0RHNmFWTXpJ?=
 =?utf-8?B?NCs2Ym15a1RCYXE0a0J0TFJ3TFQrd2VoRGhHbVJCSHRReXVQQUNxQW5tejNX?=
 =?utf-8?B?TXFHZ0J3aGJEVXlwMzQ3amVlRHp5MTA5ajdNZ0ZnUDRFUWVnQ280aXBBdzBB?=
 =?utf-8?B?Zlg5U1d0dkdETm9paCtVb1RLeUptaXAvaFk0cmF4V0NGL1R0K2FFZ08zdU9M?=
 =?utf-8?B?c3doWnVNaWcyNk82ZU5mQ1kyck0rOUVNUFErMHdFcDNDNC9hUEl2MWczbHd3?=
 =?utf-8?B?U25UVGlpaTZ2UktkZDU1bG5xVHRseVdtYi9zWGlzbk1FdUFwVGZEbEpHaWg3?=
 =?utf-8?B?YTB0SVZ3M3piZlArd1h3QWg2dG1SK3BFWFdRck42eW5GczgzbXU2anhDeit4?=
 =?utf-8?B?THJtUkxUK05neDlHQzJBS3dSQVJ5U0FXMUQ5N2tBTjgyVTdxazRjQ3RhZTNL?=
 =?utf-8?B?N2pWN1pWY0syZ28zMy9hOUJ0cTMxeC9VdkxMbjA3Q1haeStJMGxSYWYzY21j?=
 =?utf-8?B?SUJsSkgvZE1aRGNsbVF5dTdtSnZHZkVPaGVuM0hjeVZJVWtWOWk2VnZxUDVG?=
 =?utf-8?B?MGVSYVFUK2Yyc3hVTnRzczJpSElaUkpPSUN1d0Z5eGVCVWNEc2d6VFFUVndP?=
 =?utf-8?B?MHRHSjR3d1dGTW5xckxabzVwRFIwYlJRaEYrVDVlOVo5ZFBodGdqVWNCRUxh?=
 =?utf-8?B?YzhIVERLa0dxall6ZVp3V1RhanFwSVRhZzRmc0JrYnl1SWNNOEhXRDJUZmo3?=
 =?utf-8?B?ZUxyUzlyWnltalpmV2VDRWJyNitteVpkYkp0Nk5TV0NmRlA0Y0M5ZG1ieGhT?=
 =?utf-8?Q?i4p2PCPpRqjw0seGvX2/Vzt+q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2910fa3c-1350-43e3-0ead-08ddcb34a3ed
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 04:35:11.0681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOePP2UOHvVh7IUqL3CTLcmkomv1jKcd4kmYJTlKZBktr2tOQY3h0YIYcuRO0Ku8OOl0WiMQa/adxTJ+enYqxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4796
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

On 7/11/2025 2:50 PM, Jeevan B wrote:
> Add intel_pipe_output_combo_valid check to skip invalid pipe-output
> combinations which are not valid.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pipe_stress.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 296c93b58..a896c830b 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -578,6 +578,11 @@ static void stress_pipes(struct data *data, struct timespec *start,
>   		if (!data->highest_mode[pipe])
>   			continue;
>   
> +		if (!intel_pipe_output_combo_valid(&data->display)) {
> +			igt_output_set_pipe(output, PIPE_NONE);
> +			continue;
> +		}
> +

Since this is a stress test we wouldn't want to skip one output here 
incase we don't find a valid combo. Can we add the logic to try on the 
next pipe here so that we don't skip the output completely?

Regards,
Karthik.B.S
>   		igt_assert_f(data->display.pipes[pipe].n_planes < MAX_PLANES,
>   			    "Currently we don't support more than %d planes!",
>   			     MAX_PLANES);
