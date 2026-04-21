Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579B2F327C5
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 08:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA2510E1A8;
	Tue, 21 Apr 2026 08:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2JWRF5z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DDB10E1A8
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 08:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776760528; x=1808296528;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kFUhKETxopabm+Z/0Hg+xHQKDMnUxKsmWCJU5vGIgZs=;
 b=h2JWRF5zFkA6zZuX2egDsa3Kp42Eb2rcoVJ1mXA8A2c7txqpb+ICPPRu
 ilTTtFaDouT5RdEEH7coN74Dn706zXKaOcyAcgXy7nTjwuGo+ohZZAMkd
 qhJpz2IsnAKYXzToJQa72E1cQHfaFmCPQtNoYEgbTOTDqLDa+vRJ6+XD7
 td0y9THCY9pW9peIRkqFLc6smSwmste0T5/HbkgsaU/jVfe5R+gptvfFw
 BmgZvyJiXnI55Vh8kPhWIM2vYbFUiL0PKk0a7IgsM9Ejfmnp5r1q7VwPP
 tJS+inEeKMq8tmIkysIZaBgX7WB2ByLC62PmS04l9r59yd8euYi3DzYDq w==;
X-CSE-ConnectionGUID: eG5ZJXM4RdqP/xhHBCy7BQ==
X-CSE-MsgGUID: 0jjVbTsNTiyq8LlJvpLQeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81300907"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="81300907"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 01:35:28 -0700
X-CSE-ConnectionGUID: /Kj5gvlXSPWZL0qFVN1P9A==
X-CSE-MsgGUID: cWCh8QHUS/exHLQjl7yUdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="235991165"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 01:35:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 01:35:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 01:35:27 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 01:35:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmEY13iZcLnuZZF3aHVL9nd3xGNu/xqjpU+X/2FztO4zb+0OWVAjtWw8xE4OMzmls4/9TzPH3KnLjcCrh9o4pV96uHcTEv5stgrc1WnjBoQeDcXuHRYyYfbPT1uQNkSsduFUzAOZo4Pq5YxGQgrtyP/qMJ2nq3H7jDeSWMYeENXkOW5QprQKFaGP6+nXBwb4qopaxzNKxpMsGKExZvEokFSQGO+NvovzkLvztU/HlcKOiJNL+vV15cn0YK75ZQAdVTqza9xhMG4Dduf7/C8hGTKuPJknQ8cDoFJe5o9UHRPHc0ViBUkZQRazYArk/WJzt6wx4TRJpi7nMJ2tnCxuGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5/d9yRIYFzl86fTMG95lafCOIV56JU4nGDzalLC48k=;
 b=NhQOCMaTcNeRiLpOtrJawKN76Uw9o1D0w7J8hJGIKMyF/OYeZHN6JzZiGPMswAmUYDp3m4/e56J/igpbiKQA36SZzBb0AIvomzvDCnTRHOxfUVUyhBjkdSLSbTTIJRJxQ5S1cS/iJz/pflCKmb15qhb8yP2oqR9KNknl6v2QuiGQc+rKypaJLSNMjo2d7laVKCGJGAfEb/jrlIhfo8LgMRwysOD6YsxX2/csKMxLIfpwJ0ROpJ9TE0iz3pGKP8YetqdDM+2X+HH5oTmkMppjpuD40Kw+iRyyD5voV+4YmVbMvrTmNLB8IYB44JYFBeb/CyJOLb1CkY5KLjOWIJffXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by IA1PR11MB8221.namprd11.prod.outlook.com (2603:10b6:208:451::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Tue, 21 Apr
 2026 08:35:22 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9846.014; Tue, 21 Apr 2026
 08:35:22 +0000
Date: Tue, 21 Apr 2026 08:35:12 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v4 4/4] runner/resultgen: Insert attachments list
 into results.json
Message-ID: <modz3q2embvaaimwkheli26vh3guscfzivthas2ksvlhf24e75@rzeoyqa46m3b>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260420085653.2587750-6-zbigniew.kempczynski@intel.com>
 <20260420085653.2587750-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260420085653.2587750-10-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: VI1PR06CA0091.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::20) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|IA1PR11MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d08695-b921-4b3b-25d7-08de9f80ed67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: BhEjzsroCkzZTAaEg5hO40LBJHe7gsHHaZvVnO1ICfGhwD+pbBbKI9DNx/eNC+pertYaNOgIbaog03fN2CwYUkL4vRY4iPOQ3UzmQ5Bs6g+0R8JeltKyyryyeilhxBRh+/YelEjvsOSk1aBkCceSDG5SX2a3K0FJtLHSGJkSwHAfnJqFLHMAiqLniq8payfIjevfyh41km2VvJf30jQUufww8x625jDkH1GCvDyBWhxPRQ4nEfoHHdRNrdRyjg+pSM9OFm9i7DSJYcFaPi5cShTVeGV4A5euX4m7BjIprgeA+6gMzYaaQdcUZiqEcBYVqpUNpEP7oGsHcciRjKZzrC4S33Yi9dsxDM+xesWpGPZNCfzby/rNhsDW7ih+uUG+8qMekY259pKgQMEDUcjVMbDmV8ocAvfvWCohMPocSnkZXrAXhna6ByDTjS91I4uzKFO/lvKgThHFlgeXSO+4holojl7BuHNfB3gsHZsQRCHH0bIk/J4CgndAlPga6RjMdI/0FhnMZT5NRNyjSHnbpU5i0Twn03SMpuMt1YiuMJyXmEMMszfpbM5qSfym73ZlT5sBQGxa8tDNfTR2BHA/VRJkn1CRmzJtp5ukZ3LIMV1YMRGAdSO/jNbe36xHF+VQFQeJC/tSkV77LJzT6MfEjdzPsgaoV/5im8Wmnjxwyu72ED6Yu19COovLNSucYzANPwuoY3M5gURcQmm5qhwOw9AruhRAtjBl1viRxijiiAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVNDcE05cm1ZSGVPeGV6RU9ORzZLK1ZYTStqSytzZVEvTGNXR3Vqb3BYeHVG?=
 =?utf-8?B?WnJ0RkNicXFrYU0vSktGTlllWW1EUFFDelhLN2l3SWYrcFZNdkdveU9hbXAr?=
 =?utf-8?B?NkpteFZ5QmFjNlFTcWNtbVJ2OHA0ejRJUUIwQWFTWGVFeEhndTZnSWh2eWJS?=
 =?utf-8?B?QXhaVUkySGxzN1IwWVR0b2xyNENRRXdPeE5QRUEzWXJ4VDJVeXAvbjRQNCtO?=
 =?utf-8?B?b1o3bUZzRDVUZE5Pb2Zya0NtRXJ5RUxtSVNWSVJwNENpY0l6UEdpcDFUbnZ0?=
 =?utf-8?B?SWh2a0E3Ukozbkx1ZXVUVzZ1RGYvb2pvTERTMEs3SGNod1E4UjduWTl6VTZQ?=
 =?utf-8?B?cGNENjZUNEt2WHdOTVd4OER2Q0xCUVNZM1NCU3hOUW9mT0FRVlFlNXlkTHhC?=
 =?utf-8?B?cVRpOWp4Y0JqeVJySnF3dWdUczF6NEF3THd1elhuM1VKR1ZCc3YwVzk0aGZK?=
 =?utf-8?B?bVYyTUUxdXhzVkZoOEhUdlVkOThTNVc3WlE4Ty9NQ3lLWllrek4reVY4Q3NK?=
 =?utf-8?B?MDZCbzd2ZWRvVWZRQUQvbE5ZaHNlQXZTMTJrTDhuUUpvbkRITlNJRHJDd2hQ?=
 =?utf-8?B?UDhmUW9pMmp5YUVDTnNONTlSM1RIdXVXQk1pMnE2SXZ0S01kUkRvN3ZpOXJK?=
 =?utf-8?B?TmZ5M2tDL0UwV3A1WVMrRGNwc2o3ay9LbkxpRGQyS2xwb2NjTXUxUFp2Mks0?=
 =?utf-8?B?cEh0bXM4ZWh2bUxLN1FTd3lqZ1RrZjNpNXhlVlJlOWcwV1RjOUxWRVkvYWNn?=
 =?utf-8?B?ZkxYa0VLZ0JhN0VqV040T3lqbFlLWkdNaGprSnh2OVZOL2c3QmRrUVJWeXJU?=
 =?utf-8?B?Z3dxS25qQVAwTktRbkxlcUNaU0lDTXg0UUFqYXlXd08xam5nWkhjSGhiSzhB?=
 =?utf-8?B?QXhPcjBHakt5T0Vwd0ltKzlNK3NuWUhBUk1yVHJYdlFXdml5Z3RQS1NCS05w?=
 =?utf-8?B?dmZHU282NFYwY0pRTy9jN05mZGcwZzJGN3g5b2tyTHFGL1V5cTdVSzZQcTFq?=
 =?utf-8?B?Y3A0Y1Ura0xhL0xCR1NkZVQxUnVuclBYcUFnbnZjYk1qSmlVSU1hM1R2bzZv?=
 =?utf-8?B?enYyZUdjZStBQXRKK2RvTkxKVU9LUU5FSEhHYWUyeEcvc3VTNlVEWjlUUjNs?=
 =?utf-8?B?VGh2MmMrc3loZE9ydFV4Z0ovT25VaFo1YTRUeTg0VTZWQzFTSmFhZzJrM2kw?=
 =?utf-8?B?TXBSWmw3M3M0VktrM1JMdXJOQ0Nka2dJRTRPVkJNWUJsQ3ZHSGM0SGowUjFr?=
 =?utf-8?B?RmRQUG1iSysyQ3gxRzJibWczNzFUWWVld0J4RkloMVdqUER5clIzeUVJb0pi?=
 =?utf-8?B?c2JyVkJXVXZVRlJxejkwYmJGVFY1K3k0QW1vNTdIa1NUYTFiZjdXbDdlcCtq?=
 =?utf-8?B?OTZwS0VoYkc0K0Q3dDRyQkFySHdWSmRXN0hhOHhOZWhQZ2VJMVZjSDhjSytU?=
 =?utf-8?B?SDUyT1ZoYkZuUnNPM3gvbG9ZZnRYZU5xaDE5WVNEQjR4UHdEWlIxWGY2cGs3?=
 =?utf-8?B?eERlRDVzN2JkMXBUbXRwLzJJcE5UVVlhYi9LSzVURldWMmpyeHZCbVRuek4w?=
 =?utf-8?B?cDA0U2gvSVpGaVUrdDAyZm5iRHlzOE5vL0tmUWsxNFVyRk14aHE2VmVoblR6?=
 =?utf-8?B?cGhmcEcxbjM5bkJMZjZLN0FTZTF4eWdLWm90NjlaZnZ3cFowdmdrOGVQV1Ry?=
 =?utf-8?B?WHVwVGZvTDV3Q2Rwa1ZabGg0ZUU1MXZwWEJMUmFyNFAwUU9lNXZQN21wRld6?=
 =?utf-8?B?ZnA2YVBLa0FUUzIzblZqMFlkUS9haGo4RUg3RldVb29iVG1YNWZLZWdqZmpL?=
 =?utf-8?B?MUVNakZyd0Z3d29wSmNyZTBHUVh6OUY5bGcrM3V0bkJzUDZuV1pTbFdUR0Zo?=
 =?utf-8?B?Q3FHc1hFc0tHbEUzU1gyTkE1Umxidy9nVndnRkR1MC92VHEyYkRHTEpkcnps?=
 =?utf-8?B?OTQ0L21hRFl1MUVoRXZaNUNsak1sTlM1QTc2azhSeGkrZVVJL1lZb1VicUoz?=
 =?utf-8?B?SHNQYzMrOEt4UkdhN2Z2aTE3MXlJaU9rVFc5bXZYMit0UEQ3SlVzMVR1cXQ2?=
 =?utf-8?B?dGpBTlkrYlNyb01UTFBnZDZ5RDhGanNkbmVUR051N2sxbENFSERkM2VOOU9j?=
 =?utf-8?B?L1ZMM2tYNUNqZFlzSkVLRUFXQ2FUS1Y1QzJNOWVnM09UejBraGVaWENPY3Ex?=
 =?utf-8?B?TUtkL2VYcWIxTFA0cGVzQlFmRVV2VkRleE5YbmZSYjhmOUhxWklaajZEV2Zi?=
 =?utf-8?B?R2o1Q1l2T3M0d3NicEQrdVZIazFxQ1hMa2RIK0xLWnRWU3VGQ3orQUtXZTM1?=
 =?utf-8?B?cGx3aC8rdzFFMncvZkQ4WWR2SWZzSkRlMitvbUs1UHdLM3E2M1NmdUVqZGdS?=
 =?utf-8?Q?sn7Sxim7PVhjF6Fw=3D?=
X-Exchange-RoutingPolicyChecked: S+3z+CQRv25kuw8wo0BfDvG1OjICw1KN4HZz+YqLZgGDUovsVucfhCtgVfgaazv2ij9HSNPaFQjeg9TBpxv5BiNJiaTz4AuFD00cTFQoGcxMshO28Ovei2mdJeXkZeXs4Q0nSR6KSX+B/RLS8Ab1BPESZBIDf6zdrMYo7vic24oeEPsgXt8PJowAAZUSNxajpn5vEvdbUSBBC9H5tWFLhCrsf49oZgT0pf9NZfnWRrGDBip1kpwmKUOotOrn6+BprpYuIoTI/LRCtZ1g46PlI8SPm4CiS3UcNakgyBV4VG4LdYJIbZqMfFCl4y3Dt0xz66mXlhamrfdlBd8sjtMMCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d08695-b921-4b3b-25d7-08de9f80ed67
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 08:35:22.2171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOV1vm/GiM8lzEPAYi3i2zL8P0LtVMgbnmyqI3JVc6uDTJ3VDpIU7+OVYIY8AQHBdLYI5hs8dS53frHj7XXDCTSlhsCW3TwUZNdi24doSUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8221
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

Hi Zbigniew,

On 2026-04-20 at 10:56:58 +0200, Zbigniew Kempczyński wrote:
> Add list of filenames which were created by hooks in attachments directory
> (like GuC log copy) to results.json for allow presenting it in CI.
> 
> Due to lack of userdata pointer in nftw() implementation main json
> object is passed via temporary static variable. It shouldn't be the
> problem because results.json is created in single thread. This change
> is not too elegant but allows to minimize the code change and is
> much easier to read comparing to recursive readdir().
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
