Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FB5C83F21
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 14:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC2E10E5E1;
	Tue, 15 Jul 2025 14:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcRM7LfF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AE210E5E3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752588305; x=1784124305;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bQvVhOJkX+rxzFG2eoNZCc//jWRPSRoQvVPHpjJ2yDg=;
 b=mcRM7LfFqghCBK3iqVXN790sUoOJSWmz9oty7UGN2MzcdjtgyqXMLoYk
 FNaXMCl2+RsCDI4jTHKr5csqyzIaewQzBmihdjr/yY25Ad/2gEvy+OVW6
 F5ShHp03NGaugHaHPVDKMdxdIno+xzafGJ35dT48WEMRR8LMkMBH5knvT
 bDKM6KJhSCMzTLrXlPAukyQoE/oEwecPkgh7/ApXtu/lzuyPfqYQ/tQGC
 F+UggUF1hkLMqgmFsk+aRoXQO8Is9oZCnv5IwlQIhOmgR1dtCFAYcwbHT
 4HTTwSlN+Jis/sWuj1FfluqQEIepFItGYaRhePsyZbgeohFJ4Dy67+gal A==;
X-CSE-ConnectionGUID: lhE1sWTuRQu2G20LI29ygw==
X-CSE-MsgGUID: Msls+nJ+RpiStcoUXRKQog==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54027091"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54027091"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 07:05:04 -0700
X-CSE-ConnectionGUID: k6m1hM/mQdGuajDisitnhg==
X-CSE-MsgGUID: B9K6LRxvRUSJmYl/gn2gpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="161546928"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 07:05:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 07:05:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 07:05:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 07:05:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yS6t/Dck8rl/IlKmdUfpasHpfQZrqbc62I4bPzaHt9B2pwvJjijVgQkDWqqP1Krd3xsArMfmQHDIRVEvepXp+PbHbl6ytlTvQhEH1OHKLWZ2wp6fUXLkHeH5LTJJOiQ5KNXLhUsN2UVk9ZNxyRwy2vq35OXy7c1ncJSIzgYeubDZgQw0oSx4LdKSaZSlBhFtxj8R6dY/JTrU5h7P9w/bkEPcratGaasI1wsPdYvBUtPwdoWJOoPW3dFHyh7b+cswTDP9xmYLzX7ABRaROtBfFdWiJp4LPnOrR3K4NMsP3K+jtoEkr++EhDaFK3n/Xqp3jlclfTsNS6gcAdQOmPQDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pP2AGAmSQzQ9clLzaJxQtsu9DQDZNZRPu0b1k7LV2pI=;
 b=KBTPH+QCJqnunMhjLjPbnohWKsDjLYatkRDhb2kMN4dZdqbhDMVurVpnTKkSXtuop5rgJhwP6Tk+U/xNy02efLikUVyUWY8lfMEaTp8uotprE/1L29VsRDx1j9y9zqI5iN5Rr9hRbYPXqsG1uUY1sFfy7eSSNuXw+yvWD64Mik/H99SSe5fw6ZzXYZoh/5Pq6YRJLPf1tKAb+9eSC0zTaGwAz4NMlFsQN1Bqkm33EEksYsUSwRrTV1IKUxd5JK5/ermeGTf+dl7f+NgNHANgLFepUxs5sM/Q4eu3S//ezPkFo1LfWN+DEPXNRkphIAXD7SN9S/PH1rEzeqEEVMNqKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SJ5PPF16CC3A048.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::814)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 14:05:00 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 14:05:00 +0000
Message-ID: <8fd92947-a1f0-45dd-828b-49c6aa65997b@intel.com>
Date: Tue, 15 Jul 2025 19:34:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Reduce test
 complexity for simulation
To: <igt-dev@lists.freedesktop.org>
References: <20250711080458.1218533-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250711080458.1218533-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SJ5PPF16CC3A048:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f41e73-12a8-4646-ca67-08ddc3a89615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXFqb2dtSmN4c1pSUG5KODFEMi9FTnFzWGJFUklDbGRBcjhzWG0rL0VwSG5q?=
 =?utf-8?B?QmcwM1dlUm1qMkE3RjlaRFlmaHNuUHlnQTNzNG1BODJIZzhtNWxnU3ZrZlFT?=
 =?utf-8?B?VENUNmIxbXM0dzFXTTFzODc5L0lqSFZWQUxUUVlocUpkMUtwVDRhS3VhL255?=
 =?utf-8?B?YkVWZ2kwV3UvZkZ0Q2tYNDFTcU8vRUI4c1FVcHMvUFFvUlBhZkJQTDlORE5r?=
 =?utf-8?B?VndSU0NXTUUvditXWkp2dlRkZkhoT0dUMXJyZWNNb3NqRmxsbHJkRTR1bTBr?=
 =?utf-8?B?enZwSHNZclZlVmhTcGF4ZXFaVFFUQ2F4dWJMT2gxejJpb3BzTmVpNGo0RThp?=
 =?utf-8?B?MDRzMHo0N0NNeFFkRmdTYVJzU3dNOXBUS3hHbWVzMWtES3hMdWFRSjR6RXpO?=
 =?utf-8?B?VUphb3grajd4ekFTVmJQNkppbllEaEsrOFBNRzQ4Uko0eUNPUmxZS1pLbzlN?=
 =?utf-8?B?VEd1cEFuSUpNUHBQbDVOSlVwZ3l0MGZFeTBBT0tkSXZHT0RBTVdva2Irejdv?=
 =?utf-8?B?bUFrbHk3Njk3bDJ1Wk5IWW5kN1hNVm5XZkhuVWhPMEtoRHV5cjNNc0wyVysv?=
 =?utf-8?B?VjY1My9kU3RwRmRXcW9PcC94ZVAwbHR4ZjZMQmNmWUtybGhaVEx5dnROY1Q2?=
 =?utf-8?B?MnFLbHJ6c2tWNWhiWkR2MGlwVXFsYXNwNVd5QXdIa3Q0S2pZbGxGTmdUc3ZU?=
 =?utf-8?B?d0Nqcjc3UUk4U0JUZCsvdWRUanhTMjhNeFRTRXBqdW4rSHB3TUhwS2NncFNI?=
 =?utf-8?B?U284Y3NYRHFWZzA3c3ViZlYyaUJvWFdPb2RsMUhrakhNRGt3ekYvanh4Z0Zv?=
 =?utf-8?B?M0VwZWp3Nk1XZmJ4bWEyQzlmczNkRDRFbjJhczNYL2ZjVkRnZnlZbFp1TEpS?=
 =?utf-8?B?d0RXKzFKaUpkNWU1eDEreFkrOWhXZFFHUVJCaHJxbm5LMFpubkpVN0RwUll2?=
 =?utf-8?B?TGh4WTFWWXJHUW9GVU9VSkFSZjQ3cUVtaElSRnJLQklRZkgvWG5hVW1kMk41?=
 =?utf-8?B?bGNqaW9DeEJmR0VmVVpvRkUyZHI5a3RXZWh3OTd1a2I3eFdPVXlrRDJiV2xV?=
 =?utf-8?B?dVdtdDRiYUlKSWpqcUgzOG5JTGt5cXJBMnBSb3RHZzZITkY2WkMzMTBzcE9v?=
 =?utf-8?B?WlRGVGlyckZoaVJJQnh5TldqNDFJdjZtd0hVTTNVQ1BxU2lXb0tnaFRlL3hm?=
 =?utf-8?B?MmdlejJXdlZmVXMzdmFaRm5obGl5MmpYd3Izd2Y3WkNlMFlsZTI0KzliU3lW?=
 =?utf-8?B?REhYVFlPY2wyZkNNL2NzTy9mdnZwUERlbnYyZzc4VHUrcXV1UXlxUlZkb3lW?=
 =?utf-8?B?L3liTzI1ay9FeXNSNDAwUUduTnIzMU5NT2wvUThFMXZYVTlVTjB1aExWeVdx?=
 =?utf-8?B?L01GZVRTRFh1NDc4TVBrU0tURTJFeS9HVUIzK3NUa1pxOTBQMnBWblBOSXdV?=
 =?utf-8?B?dlMraHFDL3B0LzRMTStUUUxFUGhaTTA0M3JBYjVFWTVZcVlSci9KcHQ5UFNs?=
 =?utf-8?B?NGRucHNwY0xRYmhpaDE5VkZoNWdidDltOFNFUzV6REoxc2tNQlpuMWMydDJn?=
 =?utf-8?B?TG44TU9PaHJBZnlmSWFvSDJxNXFCLyt2bHpkdGdEZWZLUVBOWnhEUkE4VS9r?=
 =?utf-8?B?RFJqZFJkamJUWmlsem9MSHhXdUlaYjdhQVQ2RFp2RDh2d0R1VXh0c0hxYkUv?=
 =?utf-8?B?N2U1WlM2dXJCVXFTRkt3MmRrMHRFM2NkYUoyejQ1LzZza1VCOE9RSkVlZUhk?=
 =?utf-8?B?OXVhZ2Y3VlNSdnliMHBnby8yZlBmRzVHbGV4RkE0REhqQ1VibTZvS044NGI3?=
 =?utf-8?B?aUZyRTRXNFFzZUY4a3RTTnhRenpvMzNPM2hPeHZraWdsYUtieWdUMmlHN1pi?=
 =?utf-8?B?VFBNU3ZrV0V0SE5FdjZ3eWhiKzZ3d3pId2lGVGZOYklJbWE5MEFCVUpySkVq?=
 =?utf-8?Q?nCxGnUVLEIo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW1yV3N3b0dFRTFFcUM4bTJOM09PVEp0OE14S0pCZDdJMXkvUm9sKzk4ZWdR?=
 =?utf-8?B?M2RpT0RXRG9jTURuY04rYWkzZlR3Y1JoSHpRZFBrbmtJMVBpMlZ4TlFuMzRT?=
 =?utf-8?B?OUFicUNXWUowUGJXT1NWUTlmMTJaZnQ2Q0NjYk51Z3ZvY3dvQzN4blBVeVRO?=
 =?utf-8?B?UEppNVdXbWt0b1FaTjhxNUhrTy9KVTlRSkpIVUxkd1lObXhSRVJuamdhK2kw?=
 =?utf-8?B?dWYrbXNFWlRnODIxVUtlVjRjdG11QnJOYTZaR3RiUmRnZThGRHEvTkZ0TjBP?=
 =?utf-8?B?TjhJOE5QcUtwNGdOSDlVbStGRzNnWkpVOFhPSWNFZnR4bXIrTVhUcGE5eVpI?=
 =?utf-8?B?QUxGcDJkR040R3hsQmNVcjJoSXN1eTV3VjRaaGRwakJ1RkRaaUpxRkJDQ2RJ?=
 =?utf-8?B?MWVKVXovZVZHUUdZSjhBOGZMY0pIUTRvYktCUG9iSGQ5RmxCNzlBTEEybWpV?=
 =?utf-8?B?b0dkSzhtSVE4Nzg1aktjRkEvRjNJaHRwdzR5ZXVRbXBrSnpFV0NUWitzYlh6?=
 =?utf-8?B?WkZmNkh1bVQ2NTR6RHJKaTZiQkhOOUR6R0NOTUlIYlBoSlV6eU04bElRVCtY?=
 =?utf-8?B?UzRpbjdBVVh4Y1RWUU1RUnIxQis0Sml1UVhMK1RVVXNrdVdsNy84bkZEeXRH?=
 =?utf-8?B?RDV1aWplS1JmS3cwRlpRVjhuNHpqNDJEeEJXUnNTVjE0TjMveWtnbWN1MWRQ?=
 =?utf-8?B?MXA5UmNBSmc5Z3BBTlA0NWJHN2gyMDhlTnVtUi9jQTVueURmN0pyWHRCN0J3?=
 =?utf-8?B?S3hGakc4VG51SEE0anhwNHhLVUZKVHExaG1vY0lLMEsxWWdvcjV3WW1vZzVY?=
 =?utf-8?B?KytIMi9ncm1rYnArUjhMcjVEdmt3ejVMbXRoNng3bHJWbXc3aUgycmlZMTVJ?=
 =?utf-8?B?ZmRyalN5YXdyMmVzN3N6VGFXV3ZxTmhKak5qc0UzMS9xSEpWZUxIQVpoMThI?=
 =?utf-8?B?VVhMYVUvT3R0T21vQVJlMXBUUXF2RWVmTXRUdytuMitIbzFXSHBDVUcvbm9u?=
 =?utf-8?B?cFo1T3FqSEszcG1pTlAwOWhHY3hkTmhPcURLSU5hRG5YRTNFMXVhMXhURlVp?=
 =?utf-8?B?YlN5Mmt4eCt4eDhGTFRVRkg4YU1PKy9rYmpTNFk3cGpHQjRyVXl6Qk1FUFZy?=
 =?utf-8?B?VE9wK3NHeXoyZXhRYXJHcEtiS3QyTFFCaU1na3J0ZmJ5K3RhZm1rd1ZqZjh3?=
 =?utf-8?B?cFJ4ZHVIYndvUUs0T2VhRHBJT3VmZ25VV2NLalkzQ2pSWDdmRUlWbG5kM3JZ?=
 =?utf-8?B?cHlsSjNxSXVyQ3NOS01vK3E2RHI2Y1JDaVRuWjJGaTM5ODFPTzlneUFkT3Vk?=
 =?utf-8?B?b0xUTlQ0MHJJcXRQeFZEdTVkOWhnemdGSmcxQm5QSll2cEFoKy93ZTlPbjFB?=
 =?utf-8?B?d05yM0dTME9xNGJvNkVxbmRiZFFpMTJ6cUhNOTVUT2xBZjg1N0lobTNCajcr?=
 =?utf-8?B?Y3FQamFJU0hzUUdRTklBczNmRjdtcndjUXpoUUVxRTJZejJNOE92bXZ0KzFt?=
 =?utf-8?B?Y0FNVVdNRWNsMjR3Z1JrclRpbitxam5KVXUyRnlVUHdUZVJHcVRSWnpZTmV3?=
 =?utf-8?B?c2RiSFAwRFE5anpQMEIxaE5wZFEwcmtEMlA2TmRxeHFVU1pVQTBRUEk5eG9X?=
 =?utf-8?B?SzlPQ0puWDlJRG1BaXl1YTJJeUJIZ2NxalU4NzRueG9sQnBZUWlvSjhrNnFx?=
 =?utf-8?B?elBhRHR6ellKZ0xYaitrZ3pPSXJndWc5Q2JBeGVpUnpkbHdjTG1FUEJQSGRS?=
 =?utf-8?B?L3NnZ1RoaVlndXRDMHNCZi91MEJwRldESWN5UWI1dW9VSVJOaTk2Qk92U1Zl?=
 =?utf-8?B?cmcyQWdWQnkwdEhJMHkweVUzaTF0SEdkZFBuY3pUK0JPeHE4Wk5oVkJwaFJC?=
 =?utf-8?B?YkR3RUpSUWlSam9TSXVwQ0tITTd3QmdyeEVYM2pDTzBvK0NpSFVKRG1sOUMy?=
 =?utf-8?B?UENJZ0NwK3JDUzlZS1ZwdlZnZlRjR2dndGVldDhUOFBta0ZkWXR1S05Kbnhq?=
 =?utf-8?B?UHE0TVpxdmd6MTg3eUxpaVQxOVdyYmV4QUpzZUdGM2hKdi84VWxWUEpPMnZU?=
 =?utf-8?B?cURwN2YrT3N5VlBocnNoUXRXMEdMeG9lRnlmcmlZYmJBSktKeWxWOFN4RmRh?=
 =?utf-8?B?MldHT3M1Um1sRjNnV3NCU2EvZU9GSmhodUZMaDlRckd3cFFNR01RNmlOa0xN?=
 =?utf-8?Q?2krgXRAURgGreAe8DlMsprw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f41e73-12a8-4646-ca67-08ddc3a89615
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 14:04:59.9628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IDdLOWl295oxQsK9MnwwjlJaCq1cUs0CpK5OUPgLeIEjQINLJxisBoYWTnqDKb5UhRcT6Oc8eVPe7V6mb7+v0zsxyh78G7RLHFctOqVdUvFp108YMJr7iAjPGd0XLp4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF16CC3A048
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

Hi Pranay,

On 11-07-2025 13:34, Pranay Samala wrote:
> Reduce the number of iterations, draw_method combinations, and limit
> execution to a single pipe to enable this test to run on simulation.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 66dcdc281..631b13aa1 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2908,6 +2908,8 @@ static void multidraw_subtest(const struct test_mode *t)
>   					assertions |= ASSERT_PSR_DISABLED;
>   
>   				do_assertions(assertions);
> +				if (igt_run_in_simulation())
> +					break;
IMHO, Since the igt_run_in_simulation() is being called at multiple 
places and if there is further optimisation needed for further tests, I 
would recommend to add a static global variable and initialise it in 
main, replace all instances with this variable.  This way we can avoid 
function call overhead as the value remains constant through out the test.

Regards,
Santhosh>   			}
>   
>   			fill_fb_region(target, m2, COLOR_PRIM_BG);
> @@ -2915,7 +2917,11 @@ static void multidraw_subtest(const struct test_mode *t)
>   
>   			update_wanted_crc(t, &blue_crcs[t->format].crc);
>   			do_assertions(ASSERT_NO_ACTION_CHANGE);
> +			if (igt_run_in_simulation())
> +				break;
>   		}
> +		if (igt_run_in_simulation())
> +			break;
>   	}
>   }
>   
> @@ -3275,6 +3281,8 @@ static void move_subtest(const struct test_mode *t)
>   		update_wanted_crc(t, &pattern->crcs[t->format][r]);
>   
>   		do_assertions(assertions);
> +		if (igt_run_in_simulation())
> +			break;
>   
>   		/* "Move" the last rect to the same position just to make sure
>   		 * this works too. */
> @@ -3332,6 +3340,8 @@ static void onoff_subtest(const struct test_mode *t)
>   		}
>   
>   		do_assertions(assertions);
> +		if (igt_run_in_simulation())
> +			break;
>   	}
>   }
>   
> @@ -4184,6 +4194,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   
>   					break; /* One output is enough. */
>   				}
> +				if (igt_run_in_simulation())
> +					break;
>   			}
>   		}
>   

