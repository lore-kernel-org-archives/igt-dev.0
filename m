Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1607FE7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 10:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF99910EF9E;
	Fri, 13 Dec 2024 10:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKIfMzTy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECEE10EF9E
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 10:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734085631; x=1765621631;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y+M3uYjNWRv3xPsmevX7E0kJPx5bZTVV3pnDpjPesS0=;
 b=gKIfMzTylZioP1DOEjbSIkAsEsSTqtf9sPTVmqynITvSBHupE4g70vT1
 RP90I7LGQf7/m89Tz1Mk00NrLnCuQiBlGKz2YJyuajdeDEk7Jqg7nb9s0
 IEKEI7PEbnlUWyyfo0jJLMLasj9FPOinCn9fdkNMQ6kB7nuE5ryhnSVlU
 x1vgFM7a5CGVpj1dHnwUXtsmmndaxjnXAXn8mAHQRBRG3il+pAOIkC5/U
 7L7tCF6dRQ3HVQTGhfeFeWFrMhl6iRBGJTIgFOYg+HdbdYBBTTiWTd+Vb
 cEVMe9aDnrLlKqZFLeQOUeZ3hHtOgwo7p/uKCI5KK8r7VtK0YuubD3t17 Q==;
X-CSE-ConnectionGUID: EGcez88aR1ux120sddWpLg==
X-CSE-MsgGUID: Vrf+jv9jR3eGvGh4gCbKEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34582009"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34582009"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 02:27:11 -0800
X-CSE-ConnectionGUID: OZvlDuTkQ3i64CevKf0s1w==
X-CSE-MsgGUID: C7el1erPRTmxpYX5UwKApw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96362348"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 02:27:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 02:27:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 02:27:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 02:27:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLLhWFFEHHsf02kKUo89sZwS3Eb08W5HLNq7R2GzMQbc6HPiaqB9vSr9GOAiHZsifnuX1OPyhPglLDp8fL37RpKNCQQT258q26E/zMnfP7PWxQ9V237hZ91kOvxsg/BQ5IfsZ+XDC/G9umaBT0qgmzVQsVocNylrEDSAdy6AGmKyhxd3YShp7ftn9lNWWSZz/P8XqNnTO0XO8OuucLfzLvUU/daln98PbfzdK7uSkZBWs3WPWxIgOuI8SfDJ3ANbdy1l5rkAXbngTBMC5uphmgYbN1Fgkb4rEpE32ukvBKk4al+nx7etkcbP+y34sjsxREcTlFaXn6FYRM1bqO5t9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E82E7x+GCbtmwCC8pGJtrbZtQEHG8Wvu6YETddRwSs4=;
 b=hQz5SyWVOTf/Iow80zMy8//Iompk/FVERMHfgmesuMvBsznZLsI4wPsdxPFp4kZ2VShjaBg1t245S9M4ddCpUYSzqx7SsmVHIeXvtzLK/74GsVn+CH9e+2AmPO5PLR3qXo51dXHRdEJCjZ1r9D04jOfoToEWFoKANEsTQKoeJa44xJHMd7AJUgO1zVh0g5aazmo8fwUz8eYu0TrmGeODtfvQxIG0daotMXEqnxddTH4+x32idE0nIjNyNz+86xWa7wB/XhxcZlVXZs/7fy7qjMvohk2ovs+8YOS805e2sV0GxaDkCaEA73lU5WYzP4wSm5J6ieTNBTz55gI34pC+Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS7PR11MB8855.namprd11.prod.outlook.com (2603:10b6:8:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 10:26:28 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 10:26:28 +0000
Message-ID: <0f5be1db-07b9-47cc-be68-c8144ab57e98@intel.com>
Date: Fri, 13 Dec 2024 15:56:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Update MAINTAINERS
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, Petri Latvala
 <adrinael@adrinael.net>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20241213101547.13411-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20241213101547.13411-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::12) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS7PR11MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 10babe42-bdfc-4661-0bcb-08dd1b609a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWt0U05IMWl1eFFhbEtFVGVZdGNXem9hRnp2MVZXNTl0dFIzbWswK0VtV3o5?=
 =?utf-8?B?YmFySzErT3llZGozb0ZYZExqSVZCaGVEUEdiTFBjRWNVNFRwa2FOblZhZkJ5?=
 =?utf-8?B?ZndJNjZ1T3V0dXVPQnBHU3pLOUFXTHdVelV0RjRtQ092WTQrU244MFdWTzlx?=
 =?utf-8?B?czFQeDlncjJNTnE5eW9heDJhYUY5Z2pvWkFkbWpndnZ5QnVjdEl3cUliZkI2?=
 =?utf-8?B?a1hLcCsrWGdYZ0FRQmFaNzlsZFpGYnZTWENubDNtL3ZTYVljWUwvdHdRbWxh?=
 =?utf-8?B?ZTgrR1IyS3J2a24rMjJmT3Arb1NRMTg0M2NhQU1iNnFaOXdLZTd0SzRaTzN0?=
 =?utf-8?B?S09GNFFISGJGcnpKSDYwRVBHM3orUzhJR1NsRjBTcmN6VStKS2NWczUxSy9Y?=
 =?utf-8?B?SmlOOGwvUllNV3pITG92ZGc1VnZyUHRnOTVOMDZ6dXNkRmdXbExwa2diRHJt?=
 =?utf-8?B?YTlUZEZUWmtZeDh5VHJTNjZ6azhFWHkvdU11RVVxU1ZqTnNDam1WQVE2dHBp?=
 =?utf-8?B?YlJxYTVLQ0tWY21zbnFld0l1OEwyR1BYYzJnQlovZmNWRm5Zd1FhNlM3d3dq?=
 =?utf-8?B?MTBsdVBPM05uZ2ZkR3IybE9lRXdxTXlLYm9HYzNWZ1d1VVNJaVBKTzRtUjB2?=
 =?utf-8?B?c25VS3BHdG9hZ1FyZUl0VWFTSW9iNURnaVlPRjVreThZN3FUWmRNWGdLQUp3?=
 =?utf-8?B?c3BXQm45SVB5WlJKV051TitNTHdMUk9PTGp1aG1hTDJjdWFCU05sSWxwVUdl?=
 =?utf-8?B?VFQ0QVc1OFhEUy8wZTFFZWYwbkRjRzEyWnVteXJhZ0JyNnROdUtmQ1I4dEFD?=
 =?utf-8?B?WjMwejRxT1EwVDJ2YWF3bkRiUW1VMnp0U0JSaDBDWXNtM3oxaFNsYmViVS9F?=
 =?utf-8?B?MHJwNm94bmlFQTJVeXcrL3pCYnZ1QmpGT1o1UXNoSllvbjBnbDZEK3BEWVZZ?=
 =?utf-8?B?bUdWRlRZbi9iRGRKb1ZCQjdia0Y2YUJXbDI3ajVDZ2s1dXlMNWExSW11UEZv?=
 =?utf-8?B?dUZMUHFDZ09sN3lOeGIxbXJhOCswVTlRQURFWEg2Y05meXJiZDNYR3Vmbjll?=
 =?utf-8?B?YzFYTVdadExWelBCUThNa3ZDWGtpQzk3ZmdEVVY4V2VSTGNuRXBtSnRtR0JY?=
 =?utf-8?B?VWRwZ2hpVzRFbXlSd0FBRmR3eFFYUHVvcUtOdWloVEg3T0NDbUxkNzBGWjdE?=
 =?utf-8?B?S2p1QnlrQ0tpeEM2K256b1B6ZE9xdlVnazhZWkk3RWg3VnJzUWNGWUM1N005?=
 =?utf-8?B?YVNlSVJXcmFTYnhCeGRGQmE2eXd0ZFJVOSthT0RDT2Z0bXZNRWk3bXBaYjds?=
 =?utf-8?B?WkoyYmNBUTlQNy9acTFZbEZ1RGhTRHhsMVBJQnFPZTVTVXljd3FZYVdNSU5G?=
 =?utf-8?B?NEMwUEpTM3JuMjdVRjRvVXZrUExYRlg5ZG5SVmV1QWdoK2MrdWtSVVhVVkdY?=
 =?utf-8?B?TUhhb0dWUlZ0SmtkaVlHTVNWV2c3cWtkNVNSVEljd0NhK3VaalJ0WC91QzI4?=
 =?utf-8?B?K2xHN2lPZ21ROUtQQjc0OVk3aXdhQW55TGVMYS8vemllS2hORFhQMGQ2ZzZm?=
 =?utf-8?B?Wit1UDR5Uzg0aHAzTjMzaCtXQ2h3eWkwT3Bqa1duV2k2WWtNUmdUQThVRStz?=
 =?utf-8?B?K2trMnJMZmxSYUs0eXRvWmVHdEExWGVTeTgzaDhXNVNvekFLTHhXUk4vOXQw?=
 =?utf-8?B?L1o5QlBMaFpGRE0xK2NSUnd1REJTZXhQYllBMjdscFZNQzZIRU5KMmFCbnZE?=
 =?utf-8?B?Q1RKdlZYa2M4QXpGZXdUSnpFR211dGdOVWpxSkozL2UwSXpoRFd5Nm9pT0pU?=
 =?utf-8?B?VVF1MXhrMldOU0xIWEZpOU4vS2thU24vMVdJRW1ZcTdDbWhoN1RKRUZTSCtL?=
 =?utf-8?Q?hjndSh/BCk33+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkFZMVBBeWVuS1gxWWdaMXRlT0dQcit2TEU3VVlyaEtBVVBFWXVDRHlPMjFS?=
 =?utf-8?B?MWpUWGlHZTQ1blBHUXJoNjEvaFkvVFpXcXZRWWluRHNYeGw1SHYrZURqM1Zt?=
 =?utf-8?B?T1NaRXlrQkhEN2NVclNFdy9iSmxnUzl5ZzQ3N3VMK3dkR0lqWFU0TjZpdk5G?=
 =?utf-8?B?TXNnSzV0bUNBamxuMlZ6QlFuV0ppSkhnRjhITlo5bmxkbkNVbXJGUWVoYWJi?=
 =?utf-8?B?ZFBsMUp4QkpHRmUvL1I5SFc2ajhhTUZNbFRRVnA4Tm13QXdpUGg1eUd2TDJX?=
 =?utf-8?B?WE4ydlBXL1Zwd1V4THMyS3NxVElJbnBBVG9oUnpYcHJBR1Bwb1ZObDZTTks0?=
 =?utf-8?B?NlNueGlwQnI1Q2ROZ0RrZzlZOG9ZS2U0NzZzSzk1aG9yUndReHQ0K3RGbzdE?=
 =?utf-8?B?aERFV2hFTVgvU1JJeVhkcFdCWTBBeUZMN3hqV0FtUXE4dW1kZFdUam11VjVN?=
 =?utf-8?B?ZTZDMmJOU2JZcFpVaGxxaWg0UVNkU3NtVzZMMjFSaGVMdXVIcmxmcVpiNkZn?=
 =?utf-8?B?Vm0wcUlKQUEvQ2l0bVQ5K1RMOXA2VXNVWTJBVi9WYzJ3aDRQcUkwYUY1NkpR?=
 =?utf-8?B?VWo1bkhkV1B4NkhyNmdmcWJjT3FlbkdxMUNaUHF5akRYbXp1b2RLYUxxdjhO?=
 =?utf-8?B?L1lNeTVxNWRzelFYd3pzU1JjYmRqa0lJZVZDZlhHeC9wRWQrTGRtWCtKU0Yv?=
 =?utf-8?B?K2xtejBLQ0VlOENqcG53YlUrbkhBUElGV0pVVjZtLzVqQ1hDU08rSmYxbERl?=
 =?utf-8?B?SGdNVzd1ODd3MjU3R3h0MXczOVJFSDNxWDZSM09EVlU5WVpVSVdRV3NOUEQr?=
 =?utf-8?B?dGlNSGlkVmRuNHh6amNTRWJ2clJRT3lGQ0RsNjhnS0FPT1dOcVpjV0h6S3Fm?=
 =?utf-8?B?dHRBNzNXOXdjRmtnczV1VGNzZFNpeVhPY0swRHl5bW83TVhBZTh2R0R4bXJh?=
 =?utf-8?B?TmFIMzhZZytBYUk0cmZBbzdTQm5zTFM4L1Z1NkdyWDFLNUgveCs1NjBhSU9I?=
 =?utf-8?B?dWk4M1ZoU2dNOGNBUkE3bGtXZ01zMlVsWmdBdWo4ZVJzQjRoM1J6TjdLSkpu?=
 =?utf-8?B?R0hWZjRPOENPSkJFMXpjWWNXckdWelZ5S3F4amxhVlZHcy9TRTNnWGZKUzJW?=
 =?utf-8?B?RzFhUUh5RVc4a3crS3RIaXhWdEUyUDBxcUFDVjlnTFB4TTZWejZCYnJpK3NK?=
 =?utf-8?B?QW1mV0ZWQTJUMzVYcXk5SXRpUzZYYkwzTkZwVjFxazdLMklOUml4VFgwZlhI?=
 =?utf-8?B?dFNha2VhNndEK01sWTJQQTJKRzRuT2hPT2ozTHJHVlphSnBjM29DSDNmaXBL?=
 =?utf-8?B?amxkSXFuMDhXM2I1SXZDNUFxUTJpTTZLWERPQTJQRU5SaVNqc1UrUXk3QjFk?=
 =?utf-8?B?QVlIN2tkK2JyOUMwUUVrVnRFR09iRC8wTnN3aU1EUFNHbmQrWW9rTStmMlE3?=
 =?utf-8?B?cHllT1hOclVScnRGT0hlN0tHbzJMNU5NMllOWEppS2F5NHREM2YvbzcrUXlN?=
 =?utf-8?B?Y2p5aS9mdG5nSXAxUEwyaVFMaFJDQUdEK1NHVmdQUHAwdFM0Nll1ZFNqMWZQ?=
 =?utf-8?B?TVVydnhJdUgrRjFSRTAraTZLODlTcWpWYWV3aXJLOCtSczFJUWQxN0lqUG5U?=
 =?utf-8?B?cHdjbkYzZXBFb0xsdGl5MkgybEdyNmtTK0ZVOHlHZTY5dDBVRDYyRmJhbTdp?=
 =?utf-8?B?QkMvMzVVcVNBMU5aWUtlVEV5WUY3bHhYYnVlalJOdFhPaUk1N0lha3hNTDN3?=
 =?utf-8?B?T2Qxd0xpRkwrejhZcmwvNlovUU9TRGpCLzA5QkxaRk1BVGYvSis5VERkYzND?=
 =?utf-8?B?ZTFWUkpIMVNpMElyTWxmZUNIYStha0NhekIvVWg0MDBERmhiNlhIZ2VZekd2?=
 =?utf-8?B?NDhSaWh3Y1NFVldIWGFMMFFRZ3hVeEdQS01MaUN2OE12cmd1UGpRU2F1dUE2?=
 =?utf-8?B?OVhVcWF1N242ZlBiRXFpa1dNcFoyb3VwcWdjM1pvOHdVWlp5YnNDbjdoelpn?=
 =?utf-8?B?c0t5cnlQU0xKek1LL2VkOGRtZHJoZWZMZ0s4eTVIZDdCNUpNYTg3ejA5S0Vq?=
 =?utf-8?B?Y2s3eURsU0toVFIwRFdhZlN4SWlOUE1QRFBKMG5NaGVVY09rd3hmTmRhTGZi?=
 =?utf-8?Q?NSYjLYOzku3k3c8zprW5GUk2S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10babe42-bdfc-4661-0bcb-08dd1b609a64
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 10:26:28.1088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kSaxJ8Ss29utBvHPSpFiRHbt0IEa9uzNWB8438vdA7QK53uihLxd/mxh7Jl16m0MH/grSDzcwXWq8PLDEPRIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8855
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


On 12/13/2024 3:45 PM, Kamil Konieczny wrote:
> Add Karthik B S.
>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90c3c0880..afc5dbb36 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4,3 +4,4 @@ Kamil Konieczny <kamil.konieczny@linux.intel.com>
>   Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>   Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
>   Ashutosh Dixit <ashutosh.dixit@intel.com>
> +Karthik B S <karthik.b.s@intel.com>
