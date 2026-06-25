Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D45CDE009
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 19:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5DA10E260;
	Thu, 25 Jun 2026 19:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4i8fsQw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F2C10E24F
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 19:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782415668; x=1813951668;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=psAx7iF5OZWDsXDtzeicGq0LoQq1PhzWHatHVml0WTA=;
 b=O4i8fsQwFgyaHz+teAZOxsm4/TgZDrD6sbi66+Xk3syC8qQsPscCq8If
 MNur+TXyYjhWPXJOMIFAe9oAgWGYDeiSwspydfNYXZ4bGbxFc1ocHQCuY
 9d0GDI6mgy92kx5l1CsVfKWtTh2xsvsiCZdimlTZDvERrtxLoOv0kiOwp
 T0ef/jdKz/wgzb3uM4h9brEGylQfquekgJ5YbDxoIjL5bSdBA8UmVS8Nt
 u9NIEFjKVhjAf5T/ECjwyOSAgChWAv8l1gd91i+XdrA139JulQhTgm0wk
 zwAZ/YPOQxg4xcNcNcA3VphiJeZi/Vf7jQSLSZS50+VHelldVt1hSUtS4 Q==;
X-CSE-ConnectionGUID: qbwPdAARQuiFqinXhpWBUQ==
X-CSE-MsgGUID: v7YWm5enTs2FC4k5dTpcmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="108747835"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="108747835"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:27:48 -0700
X-CSE-ConnectionGUID: sizi1OUzT1CD0DUm8rjO5g==
X-CSE-MsgGUID: R8PKhJKQR0umdQqShxsj6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="250568074"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:27:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 12:27:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 12:27:47 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 12:27:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFbszo3Smpby7JS0wBDoyNLYhLZpdB097uqqbVkpncN+i81ERHzOG35RJ4XKODLgDdi137ry5lG8Q0vyn2FyORQfoUkHGtSL0Lugeiv6ztIbQABNfCjbEXRHboDB2iR1uwt7b0FQcGzbEW99IkqgUiEUm96CwG79UP8Xjzh6lxrh4nl/HhjVMcMMlXrx9XLWEp3h3HnwUj7yYVazPxK12UL6QX6Ssikjb6zxH/9BSj9GwbZBW1oY2zcV4OQBfUXgTHnWs2s9/wppV1TQJzhwBMLhUQk9R2TKNMrTpCBwX2+2UH4/0j5KKMDDxGFSPBOUVa/EkDH7nreHcjPmNBcNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIe9hqJ3yfiGbwJYwV0dkzuZN3fBUSO0gqbKXp+LRCI=;
 b=RaPjtPCZiYiYc6HN1JOZB465I9cw58d/N9MwP7WhAa61nlMX4p2seGoEW/hVUqUudfdi1z76D2s8khmW93a6YotuwwuXXZGb6w+ypS0DVh1SRfdufsmyHsq8LsB/dUvIvsda/KRk8lEyVa/iPFRujy7jhIFtUCAAgYmEO5a8srZeML+DnyqjLxhEJLn1hfl7RPr1ytvI5E0VhOv0bXhOd0C7s9STM9Fl1IfdMQeL4cdwNTxPESYxEgA9IhaQlSW8vzP3YmYZ9Hha5RcZ5S7lplEF2M+9uLyMKZfyG8vKI2J7+ybql+OsZmb3e1yyg5OCHrqllb5hdhg7mzkHyKUW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CH3PR11MB8545.namprd11.prod.outlook.com (2603:10b6:610:1bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 19:27:44 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 19:27:44 +0000
Date: Thu, 25 Jun 2026 21:27:27 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Andi Shyti <andi.shyti@linux.intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t 2/3] tests/gpu_buddy: Update buddy allocator tests
Message-ID: <lktqiksvup4errlll43i5tridxx4h5vpocqcczeyuiui2khpzg@mxq2ptsdvsps>
References: <20260623200152.12996-1-krzysztof.niemiec@intel.com>
 <20260623200152.12996-3-krzysztof.niemiec@intel.com>
 <DJH6SPTN4KBN.3JB1UQ6IQ2PS@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <DJH6SPTN4KBN.3JB1UQ6IQ2PS@intel.com>
X-ClientProxiedBy: DU7PR01CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::29) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CH3PR11MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e5ba43-1fed-4bec-afb6-08ded2efd46f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|6133799003|4143699003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: MxYIfKuOHuQ1AbuBvXRJFHexyGlWPZbb+GaS+SrvYwCRXe9vuz/iSRRg+n+uTJn8s94MM3t5oKszXi8BvGhpWcZq4ouUN5EAHHGT7AMywjaSCBpgpJeBziy8gf59mEMHeZ2OfQsCt4M142KPsKiwjIUiIBXvE/hVizTme98w3kmV7r03VRqSMrMul6zQ6HM4FmplJbWlPvJQegsZYFqF2jgLumZsBX9VxhGxj6XbujT7CrYjIZPSJa174y3dpzD61wtGHMw6uKd0ruVpm4FiLSGoi50okQaG/fz1DiTsHIQ/135qHJ8n5pbVXBS35jvJ1h27yVrh6sMVwyoex3sOnbsdOcuhT29WHkLFKqpfdE1coiw+orXhIKud8/jWC/G9mGw5JEsF0fUWQBL4+Pk63itcuXzGTGEKLat5QK2xtNF6/fappIoAaVYw/ssNcdip/qR2qjUUokXbc6o0MMx3lkb5CbyMNg3dnu0fUbakT03/TCW5my2D3gwi803AWkTNYJZo76d8N2D8AVU6dk7wgvEAtL0HSetsdrM9S6b8REd/6boRALMFjcg2qgCFvvu+bDhCzz67bZsWaykvIAfCvZeIxUGLZUALL9ei8LwAtVjUDKub/iGyjO3AEGWwsYbznMS84/5vhrRLpaKb+cumF14VURrW8Yi8TuSIuGdOy64=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1F0RkJzUEtTb0Q3KzJCQ3k1Tkp1Y3NIb0N2ak12Q1d6TlFBMjhuQ2I0Z1lR?=
 =?utf-8?B?c1BvNVo0REFjNkpJbE1vamhEU2lPMnJGWCt0TThpNGcyc3BMVks3OFE2RDBJ?=
 =?utf-8?B?TlptS1BhZUE1Z2g4dFAwVVJleWllNWliVTNqNzh6TkdpSUtqeWxNVmtkcGhJ?=
 =?utf-8?B?VDJydzcrMlduVGNKUm4rMC9UYWhEV0hHZmFZUWdpbXRCV3QwNzlXUjlIUHIz?=
 =?utf-8?B?Z21JaEJuMmVObmZScVZxUXdzZ1ZrdG1SVXYxUnFEWVBoSUM0eHVWZkJUa2VU?=
 =?utf-8?B?Wmoyb2E4TkVSSVpIOGYwUzBzU1hvZlRJRnhlalFHUDJIdVUwUFVFMGd4K3gv?=
 =?utf-8?B?d2hwN200S2RjUDFMcDBxWjBaZkRKNmFEODNVZDFpWVpEb3VZQWI4d3V6MFQv?=
 =?utf-8?B?RWJkL21OYVNDNExWaXlxckNGUXF1TWE5OEZySGlJTTNJczVtUVVMaDhucE5l?=
 =?utf-8?B?SWwyWDVOOFZwZmNzelAvYjVKdmROQThOZ1RuYUhhUFF1S0M0VjZ4TkQ0TTll?=
 =?utf-8?B?aDNDSGg4Mk1PVmd4MFcvdzY4dEd4dUVvbEgvdG9mV0tkbVJ1WWFnZFpldzZC?=
 =?utf-8?B?SDlQRlFUSDl2LzBBWTE4WjVZeUh6Q3dNVThaTG9pZXBQcGxyRGxpejNVQkZN?=
 =?utf-8?B?WU82L2N3OUdaYWZnZitUN2x6Q3diOC9zdFE3S3pnZTdXOFRpRFJBbDJaRkpD?=
 =?utf-8?B?cWFaNDBZZWYySlF2WkJrY0NSS2hOUHY5am1MK2Y0cGxqeXhNNW9NRDE2N1pi?=
 =?utf-8?B?Tjc3cmlrR2xpWG1NRENnSzVtSU9SOEhOeE1BUVl0QXlyeWY2YnBtU2IwM2tK?=
 =?utf-8?B?UkFNNVkwUHdJYkcvOFNZbjB4OE1kTmt3a0NoODY5SHVreHhMamJEVnBIM1Nz?=
 =?utf-8?B?Q1RKQk9SSE1vaW5jUjl5cUt2MjdTb1QvWitrbE1ISmN6bFp1TVd1N240OEpr?=
 =?utf-8?B?QVlPNGwyZ1NMY0tjQm1ETVNUaVdjUjJ1eHZBczRQRU1meUJidFczNytMYXNn?=
 =?utf-8?B?M1U0bnhmVnd2TG9objFuNnZjSWZ0U1NSZEE1Y1BnbGx5dU9XZUw5eGlmUW1R?=
 =?utf-8?B?SzJvY3lQNlVlaEV0ZGUvZEgrN09GajI1aHl5bGJ5MWVaMEJMMVJSVVM5aDI4?=
 =?utf-8?B?TEVjblpQb28ycjAvalZaVGZEUnFpU2x4ZTFCSVdrZVR5a0w4aXFMcTZEY1lt?=
 =?utf-8?B?Sm5VeHhKOFF6U1VhQ3IyY05pZHllbnp6VWxoRGM3UU52KzBMVnZqRnExdy9Q?=
 =?utf-8?B?TkRUbDRlWlExa05TcUpGSm0xajJZeTdBenlCS0lJay92YnllUzQwUkxFWTdi?=
 =?utf-8?B?dzNZb3FCcFZQR3NnM0ltU3FFUVhqelBkbVZ4RnRoeXhvTm5maFBmUitxeXBn?=
 =?utf-8?B?dzRJVzkzUURQL3JuaCsxdFhYM1lKek0rU0VGano5aWdzT2lyMk5wcjRrLzN1?=
 =?utf-8?B?VDVXUGRwOWpXWGhNdjRINkFBOWZkVWJKTlIzT1JQQXMxdmVFUDk0b3lJNTRG?=
 =?utf-8?B?cTJ2ejYzUnlwRnYzWkR5eWk3QW1CVWNYZHhnbElpWWVIOHlsRzBNMXNCdFU0?=
 =?utf-8?B?N2o5NGNLTTZBcHlNWjBWYy9tQ3IwU2liWWdDWWQ3dWt2WmJwSDllRVZMY2o0?=
 =?utf-8?B?YmhOQWxvMk0yL05JS1RGNGVaOGRvZkFzbERzRkMwdEFiMFEyeHBSRmQ3UmJG?=
 =?utf-8?B?bnVsMm1TUzJWcUdSZkFXaTBpWFMwTlM1UkFKcjlQeHd2aDE4dHNxdFBKbE9o?=
 =?utf-8?B?NGxZZFYzaWltelV0Q1NONVhadURoakl3dXpJNFBDdHBMNXY5Q3hiMjM3eTFs?=
 =?utf-8?B?YVZPZVp2YnhSdFl5UFloWHJmcVNZd0RMWmtrb3JudnIrVTNDQm9oQmo2TXQw?=
 =?utf-8?B?U1kvKy8weXFuMGJ3UlpZL3ZsVk12d3B4Rmx6T0UrL1dzRy9jV0t2aUxOWGpL?=
 =?utf-8?B?QXBKeWNnZUlING5DeEtlT3dSSXNhdlhocktSMjNyTWJnZDRPeFZ4ajZETTNL?=
 =?utf-8?B?V0hOZU9lLzdmZmZnWkhMNkkwQ25xOGo5SWtNUzh3Mkl3bEVQY1cxaTBNZjBG?=
 =?utf-8?B?MHRLam1tbWpwWUx5OFh4N1FFUXFSYjdPaEtsQ3JCV2Y1cXdYQmRQaENoVU8w?=
 =?utf-8?B?UHJCTFBwRzlWK05GQkZxdjBqcWEyMWNLYmtWQnI4SXVHMHp2VHkzck9iZXJx?=
 =?utf-8?B?M0hENU9tTDhoYzhmVEpaT3gyZWtFREg4aDBmVHVBL0ljOUZaYkRzRS9zcnlT?=
 =?utf-8?B?Ti9JNUo4ZFJSSGYvRElSUDZhUGRmekppQmZXWEtrVCtaOU5HM2N2Yk54dmZU?=
 =?utf-8?B?NlRndHhkOW4rVTQzbWdvUHR1ZWlPSEtiRld5V2FuMlNsYlpWN2dhYzZhckFD?=
 =?utf-8?Q?DpmOBcGb+GkZrCGs=3D?=
X-Exchange-RoutingPolicyChecked: eZae8k39oQ6PKs/BOa2/mcJ9qhCJzSnxsujvmb9wOwyrXeaV0CecMVAsQkXkxgNu1l3LcmHwy6O04OH+aD4EorIg18y0dmtzNaZtNcXH2ngres3MVXHOM67id3OxcOSpkHdEiQ+v3GmALDu0ZYHW8vALqEDjmzYK5Kxxv0Q2P3VKtJqND+LMFmdlzsvga6NDBKlAzX8PVuUJbzYESEQKaMuHWK1F3Xn9D1k3MyUKTdoCwf7CAjJ88ALgwWmU8HYUbjSSv8omaZOOqLRTk7NUY9MuZRoUXBLhAeFhOnCrsQ0635FICe7FmhhKpm6Nrjlld4phMlpLiGVPUVNjbB+vGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e5ba43-1fed-4bec-afb6-08ded2efd46f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 19:27:43.9322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgaM3c43JzRzRMa7BK8n0LfcgZbSklRDHf/kEXSUzIz73ygtSeXv0u+rXAKPtD8ecLnQlFj27TRn5AwNyNnVuAZUFNI9+WiylS8cupgtC/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8545
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

On 2026-06-24 at 11:54:16 GMT, Sebastian Brzezinka wrote:
> Hi Krzysztof,
> 
> On Tue Jun 23, 2026 at 10:01 PM CEST, Krzysztof Niemiec wrote:
> > The DRM buddy allocator has been moved one level up, and is now renamed
> > to just the GPU buddy allocator. This means that the .ko object used to
> > run the KUnit test has been renamed, so IGT tries to run a test that
> > doesn't exist anymore.
> >
> > Rename the drm_buddy.c file to gpu_buddy.c to reflect the kernel change,
> > and update the igt_kunit() call to invoke the proper tests. Also update
> > tests/meson.build to prevent the build system from trying to build
> > drm_buddy, and make it build gpu_buddy in its stead.
> >
> > Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> > ---
> >  tests/{drm_buddy.c => gpu_buddy.c} | 4 ++--
> >  tests/meson.build                  | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >  rename tests/{drm_buddy.c => gpu_buddy.c} (51%)
> >
> > diff --git a/tests/drm_buddy.c b/tests/gpu_buddy.c
> > similarity index 51%
> > rename from tests/drm_buddy.c
> > rename to tests/gpu_buddy.c
> > index dbc7c957d..8683b5af0 100644
> > --- a/tests/drm_buddy.c
> > +++ b/tests/gpu_buddy.c
> > @@ -6,9 +6,9 @@
> >  #include "igt.h"
> >  #include "igt_kmod.h"
> >  
> > -IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_buddy)");
> > +IGT_TEST_DESCRIPTION("Basic sanity check of the GPU buddy allocator (struct gpu_buddy)");
> >  
> >  int igt_main()
> >  {
> > -	igt_kunit("drm_buddy_test", NULL, NULL);
> > +	igt_kunit("gpu_buddy_tests", NULL, NULL);
> For some reason, I checked it, and igt_kunit uses strstr() to match _test,
> so the _tests might be ok. Still, I would prefer the singular form.
> 
> But if it works, I'm fine with this.
> Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> 

The test doesn't run with "gpu_buddy_test". This is because IGT loads
the module by name (or alias), which I think in this case corresponds to
the object file name; the previous test was compiled as drm_buddy_test.o,
the current test is compiled as gpu_buddy_tests.o.

> -- 
> Best regards,
> Sebastian
> 
