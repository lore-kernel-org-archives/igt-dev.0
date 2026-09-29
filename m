Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADE4CA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 05:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E0D10E78C;
	Tue, 29 Sep 2026 05:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kUWWFTND";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2282B10E78C
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 05:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790659072; x=1822195072;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w3K2ImXoGt7rnaLJf3lYwADpY75D+GO0ciNA4fK3FyM=;
 b=kUWWFTNDSZY/TIL2ZRVASymJIwHEsIgkeroCG3Fwnc2J0GbxMbjVWxIm
 Z7y/Th3l5N9xGIkAK8FazXgBQF1UJbviy6oRDFSltkS7B2iMA+BNaegc9
 pnGAt2c4c35w7xY9JB9SZXazwwFSz8aDgU7URyhNKl7QE5Mc0VjJ37Ga9
 IGAESY1gKAsH+RYELQdD6ZZ6uJ4cguC/vpOkLPPcQdcjIUaRjK/UYZzcS
 96N94erEQ8jX3zNV0+5plKWB+CGdPm2CbWAn1+ERGqpt1ee6K7M5z+YjO
 uBiRWr5UP2CAkRSCHXyh8jH+Qmm0epCH4LBe0kPwZt1Quq+fFVVkH+cfq g==;
X-CSE-ConnectionGUID: WB9T/hBjSR6HuetHoEAxmw==
X-CSE-MsgGUID: 2h4ryfDzQEi1Lt+BPtnAgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="95180396"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="95180396"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:17:51 -0700
X-CSE-ConnectionGUID: ywW1dYB/S/+lSrMv+o9i4Q==
X-CSE-MsgGUID: AdfgP/C3TmK9r896dHC2og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="274776985"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:17:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:17:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 22:17:50 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:17:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1X0XIeLPEZUTpdDENHn2VqlblMD4llrFdxTeAQ6eg775hVpfOdZngeml1czn2KTivNJKzrT81u0doSNCVoVItXu3/t45L+162O17EAcPAd4/hfN65OWIkYFrCGmwWmwXBmnuyFqbU6kUG5yXGY111Hn7Lp3upXYXsG0uO3N8CKXxgM1f75vw4zCnEOAX2/NedfNHmKaMMS4HkzOZJGnUOyriwSRdoupNdWKvpf/D2o5+LcoyYFanYz7wQ531xIrpaY3Tdxy71krmzR3kL2pPRSITa/mJTc7fMLlky8JeyId7B9iyb7N+Vul7RMGxEU8MPPCKYbkUilURcEpeitwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WggCN3QIVxui0r9HxdT0BSOvFqXT8tnwH43Q4rnHj4E=;
 b=RJOJBbUiqBBASVfYhzEKypDKQ0znvxxotbRpVhLvTnl7NSEzRcpAfIZFepl8tMP/VarNqyTFpnu4z/FsO4fiE2oZFYU+pgkumM2e0aLW21IaS2B/mM1hu8V6fAEycINERde8X6Vc4ojouLCrPqH7cLJKM8x9ngcJ+tiviJNNvjAw9AaspXsRtDKrw8ic5/uXcg7P9mWabD0cuWfzJboqPOy4pkvqdTig1HVlyF2uMoa/jeLahnfEw6sXMGI6hj7RX7TorGGPXJ6pyfNrgxIuwdykFg+M/JMUeOoKtuooO42v9zeCgSYCijo0w1qQineAK4VVjLvcL7YUt4iN13E6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:17:48 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:17:48 +0000
Message-ID: <663ce7c8-e218-4f6a-bafd-bc2f78febfb9@intel.com>
Date: Tue, 29 Sep 2026 10:47:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 5/5] tests/intel: Add oversubscribe concurrent
 bind stress subtest
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>,
 <matthew.brost@intel.com>
CC: <priyanka.dandamudi@intel.com>
References: <20260922110438.2402109-1-sobin.thomas@intel.com>
 <20260922110438.2402109-6-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260922110438.2402109-6-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0212.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::9) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|IA0PR11MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c7bec0-c1fb-4dde-6e85-08df1de90029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|260925021311599003|260925021911599003|11063799006|56012099006|260925022911599003|10067099003|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: G2vAVu6RmgjGm10aTpGe/SxUhqAtp0zTRlulLqVDKL1Pp2+MeZvi0AuCzPW8GiNx9LXLAa4Vb78t4WELzQhji4tywLyqUceteiFrYHwN2xEYfiPkT6xWKgMXrvYRp91HdTsmRC+wNlaQ6FnoOp33Urd0vorMZ74j3pcywiiAkNdqK9LdJLGAtvVlnc7+9Ng2FYE6HQut090wOXUd6+DjML4uIF8cf8bJw8UYR+kypXMo87vhR1YpMh2xr3gu47AdFS7uM7+mWrj7d6J9MjciWURvh6Ivmv6HDJrPKt98H0jGAKWjhSE6UIN2Tyg6uofwLIcxryRk/gK3yXKpVJIm4Us6q4+YbBinZZnkNoHU+jl5BeJU0tjdRaywaDCjkX7WG1OpYOA9Zzzm6DEX5mLAyqfftvDKSxUO2tcX0uql7QWBTMU6cYEaia5XTbEC1FYP+dY4P6M7nOUddgT3K4P3vyGkgy5CTgqF9KvRvY7mac1TW5KvkNYrEyhh/AP/0lsEW8226i9IgRyE2rhwSDIMkGBhhbI0lRjfEAtT+WsmFZXJZ0zgj+IupVPr70hxW2x35yNdkyCQyaYiGddygm6Bd9IHRcQmvFPRKuLJSCUvXFeOr7BsUs9ITIrhBtk0iq6Ubu19JhCqeuZClXeg/C5YmrIXJOKuuEIusvVzSqbrAgw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(260925021311599003)(260925021911599003)(11063799006)(56012099006)(260925022911599003)(10067099003)(6133799003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnpYQkh6TFN0OXNBRXZBL0MyMENsS3JzOU9RcHp3VWZIakZrb2VIWmI3Unls?=
 =?utf-8?B?ZDNoMEFoaTVoTWl3TTJMbVVRMjNRSGMrd1ExZ0twbW5XS1RUd3JwcDBja1V2?=
 =?utf-8?B?OE5oVVJHUUZLUTRZVGhyeGlLVHA2VWcrS2FLSFEyS1ArZ25VVmVYNWhiLzNY?=
 =?utf-8?B?TzI4VDUwVHBFNWgyRzdtaE1QQXpiNlR1WmE0dzMrcU9KODUzMmlLQWhOU0RO?=
 =?utf-8?B?TG5PSG9taUVzT3pzMHM4czU5V3pMYTlyNnBqekpEenZObHNQbHZNbGFELzlE?=
 =?utf-8?B?cXJkOTBPNThOWkE5cmZFQUswVXZySi9FcS9oYkdxODBTcGJhOXRTL2JQSHJL?=
 =?utf-8?B?YzNyM3VuTE9jdkNtYjdESFR3WUpLR2VzK2JZak5xSUlWczIwbHRqT3J1bHFn?=
 =?utf-8?B?VmxYeEJJYmVVTU5wcXdPLzIzVENYR2ZxWGZqdkRJMlRNNjk4N0g3ZnpNeTAz?=
 =?utf-8?B?c1JlOW9qV2Z6NTYwYVpZbHBRWUsyclBUM2VXWXFYLzlnNTQrQUVMN0hyMGd6?=
 =?utf-8?B?Yno2WWJqQUN6QzVlMUtMNEFlTVI1VXg5NEgyc3JsdmZZZGxEN2E3UDZGWEZy?=
 =?utf-8?B?cTY3KzRVcy9FbVJlSmlYQzRSRWN4Um42d0ZtYzZaMFpPelBCRllicXpON0FM?=
 =?utf-8?B?NHJwMy9rMkVxNktLY09Yd2hSeGZwekRnRWlYS1MyZmFzYkFBQ2ZhN1VpR2xY?=
 =?utf-8?B?ZG5FNEdPNTk3alVEb0gzVDhNempMU3dCYm5pZG9xNDlDTHIxWitsZ1FDcnlP?=
 =?utf-8?B?c0FOS05kaTBjb1M4WXd5Mm9uR2h6cStYdVkxZTZ2UkZmTTh5ek5yTUYzL3Fz?=
 =?utf-8?B?dFQyRWtKaDMrRkNUQjZ0SlpCK2d1WGs5eTd3MFJTUjF0L1N4VUVPd2NFNTBX?=
 =?utf-8?B?M3JwZi84Rmp0T3Fxb0NLMTBXQ2FOQ01TN1RaOWpVeDIzajhIdGRZaUdWek5m?=
 =?utf-8?B?TXpENW1lblV6MXNPTllKRHkvdWd6VTZVdUlkVFI4eFNWQ3BhY1AxRmUvUFk5?=
 =?utf-8?B?WGdlTEFvRGtxU0x6T1IyZ2lZMGVKRGdEVXcyeUpVVWFQakNQTUJYdUh0dEk5?=
 =?utf-8?B?RTU1ZlQ2UUdOVTFpaGVtVG5wMmp5M0tRNEwzTk1MN0JkN3Q5SkFOTTVVekJG?=
 =?utf-8?B?QUMrRWgwU3pMcEJ0akIwTkY3eEFhdHJaNGczYUNGNWNqTTdKejM0TzM5U01H?=
 =?utf-8?B?QnUxa3hkZmZkY3hldTMyR2oyR011S2ZnNU1aMW1jV21JZ296VXB3Vk1ET0Vr?=
 =?utf-8?B?MzNCVVZzY3l6eWVKYk1DMExRL1EzVzNxS25ZMGZFZDVTWVlNcEwvT2dUdXl4?=
 =?utf-8?B?cTl4dHUrQTJtbjVqckprZldVTEZTbXkwSDVhdnl3TWpRdzlsZktJZkh2cXkv?=
 =?utf-8?B?ZzZJQkRscU1pSmEwRnkwU3NnY0Jmcmw1ZkduaGVxTHNId2o1OEM4Mko3TDFr?=
 =?utf-8?B?ZExlQU1TNkE1bzZGMUJhWUlNUUZQVFgxSk80UHhGY2N4SlVMcnB5RHhCOGlN?=
 =?utf-8?B?UWkxcjZFUlF3R2dZRnBycjZIWnJycnIwQXFENlg2TDRBMS9UWFMrT1BEcXpq?=
 =?utf-8?B?YzM0TVVyY3hKaWFTNmtqTlRINUo2a0FOWGI5bWt4WGpkeUQ0L0wwWGdiU3E2?=
 =?utf-8?B?ZXVSQkJTTllhRGxYNG1xTHJGdVlYRlpzNkh1VFNhUW5NYmE3ZVIxSnRVY3dH?=
 =?utf-8?B?V3Z2b1o1eUFPc0lzNVI4MWZDQTFpMStNTURtK3kvUnFBeGJpemtuMXdMbjBi?=
 =?utf-8?B?QzJMUDZrZ1VwRExUdnhJdWQ2UTl3MGNkaGo3QVdqMmY3cUZodm1QdzFIL1p4?=
 =?utf-8?B?SXBTYzc5cWQ2alRHQ3VjSUhGdkY0bDRvUnBBRWo4V1V6RXdRLzhNNWRkdTln?=
 =?utf-8?B?bzJpL09SR1FLRXJ3aEl3SkVmRVR0QmcraTZmVlg5aW9LQW5CaWh0Rzh0NFYx?=
 =?utf-8?B?aytLTnRraENuWVUxd3ZlOTN3Wm04U0prV01qa0ZibEJEV1hicUlLd0tVbWc1?=
 =?utf-8?B?TVdML2RTVlFuNlZtMTFURndJYTVzQ0hBY0RnVHMySnZuUzAwdEhxSWVTUm1V?=
 =?utf-8?B?RXZXeFNpYzNUZXVEaGMzNzQyc2lVc2xlUTZSM1pjQm1OWG1KdlFaa0FFM3pQ?=
 =?utf-8?B?SjN1MDF2OFpPdjFxTmNLWG8rVGZIbGFDZ2YyQXJpTzdzQWRhUld5Wjc1TEFs?=
 =?utf-8?B?RWVEeHh1YUpwK1RaVmxqT0ZyWkdncDVxNDkyemJXRWxNaE5EUUt1OTRiVHhj?=
 =?utf-8?B?RG9kTVY1Z081U0J4RjhEUHhYbGpDWC90ZkoxR0U0WG9IeUJ2ZFFZMzcxY09m?=
 =?utf-8?B?MVpIM3VQOHNxS3krcFNuTTdESnUyS1lGemUvNjlXdjhBL29kQnhmUT09?=
X-Exchange-RoutingPolicyChecked: G56E1tDgf8ppmp02WQeLvp7r6P6U3cc/cUkFjQEzknp/Y4h3EYGoJ4SXAdHhfR1D0ekNWK8EEXITMToJqfAtgPMN5YlQg3d/C+zaiV274HLvFoBH80j+Fwcr62I1WKByrB1e3SJOSqvU4ZqTVuibbczUQSXlAu2Ui4ecglApPmyB/4oYA/gzdG6dI0FImilKRz1pupxQI4SW889ssTrHFofa58ZD4IApvThSG/r4o2phRZNHKaOgNvIMTAAWicRjLFv6QmwbBcfo0W0kCQ+/kxpOK/b3Z921xO73GY00OzlhJKaJB/fJFirZFZ7gR8gg1vuKV9Urxm8hQ6H6sLsQcw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c7bec0-c1fb-4dde-6e85-08df1de90029
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:17:47.9662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMsCHdp2bwrd7bWONkKKwrenPFwAIpqkh39zzRDKDGOphyo9HGM8VlPbRxSIIsy1NzirCgJP3P/uBiNxTBaMNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
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


On 9/22/2026 4:34 PM, Sobin Thomas wrote:
> Add test for oversubscribing VRAM in multi process environment that
> creates VM, bind large BOs and submit workloads nearly simultaneously.
>
> Previous coverage lacked a scenario combining multi-process bind
> with VRAM oversubscription. This generates memory pressure with
> multi-process VM Bind activity and concurrent submission, exercising
> the bind pipeline under eviction pressure.
>
> v3: Fixed minor nits
> v4: Refactoring of the create_bo ( Nishit)
>      Fix child process exit deadlock in release_ready_processes() (Nishit)
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_bo_alloc.c | 533 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 532 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
> index d8368087b..2ee468c62 100644
> --- a/tests/intel/xe_bo_alloc.c
> +++ b/tests/intel/xe_bo_alloc.c
> @@ -29,6 +29,17 @@
>   #define THREAD_VA_STRIDE GB(1)
>   #define SZ_4K_SHIFT	12
>   #define MAX_ALLOCATIONS 50000
> +#define INT_ADD_CNT 4
> +#define TIMEOUT_NS (30ULL * 1000000000ULL)
> +#define MAX_SRAM_TEST_SIZE GB(32)
> +#define GPR_RX_ADDR(x)          (0x600 + (x) * 8)
> +#define MAX_PROCS 20
> +
> +#define EXEC_DATA_ADDR		0x100000ULL
> +#define EXEC_RESULT_ADDR	0x200000ULL
> +#define EXEC_BATCH_ADDR		0x300000ULL
> +#define EXEC_UFENCE_ADDR	0x400000ULL
> +#define STRESS_BIND_ADDR	0x40000000ULL
>   
>   /**
>    * SUBTEST: all-sizes-once
> @@ -76,14 +87,48 @@
>    * Description: Test 50 random BO allocation sizes in test table with a thread per engine,
>    * leak the binding, unaligned bind addresses
>    * Test category: stress test
> + *
> + * SUBTEST: test_vm_oversubscribe_concurrent_bind
> + * Description: Test enough random BO allocation sizes, bound as arrays of binds, to trigger
> + * evictions with 2 processes per engine, leak the BO munmap / gem close, unaligned bind addresses
> + * Test category: stress test
>    */
>   
>   #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
>   #define MIN_BUFS_PER_PROC 2
>   
>   #define N_ALLOC_SIZES	256
> +#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
> +
>   static uint64_t *alloc_sizes;
>   
> +struct gem_bo {
> +	uint32_t handle;
> +	uint64_t size;
> +	uint32_t *ptr;
> +	uint64_t addr;
> +};
> +
> +struct xe_oversubscribe_ctx {
> +	uint32_t vm_id;
> +	uint32_t exec_queue_id;
> +};
> +
> +struct mem_bind_sync {
> +	struct gem_bo *bufs;
> +	int n_bufs;
> +	uint64_t *binds_ufence;
> +};
> +
> +struct process_data {
> +	pthread_mutex_t mutex;
> +	pthread_cond_t cond;
> +	int ready;
> +	int failed;
> +	pthread_barrier_t barrier;
> +	bool go;
> +};
> +
>   /*
>    * Data-driven subtest matrix.
>    *
> @@ -103,7 +148,8 @@ enum test_type {
>   	TYPE_ALL_SIZES,
>   	TYPE_RANDOM_SIZE,
>   	TYPE_ARRAY_BIND,
> -	TYPE_THREAD
> +	TYPE_THREAD,
> +	TYPE_OVERSUBSCRIBE,
>   };
>   
>   struct test_case {
> @@ -114,6 +160,14 @@ struct test_case {
>   	bool requires_evict_ram;
>   };
>   
> +struct oversubscribe_params {
> +	int n_proc;
> +	int n_vram_bufs;
> +	int n_sram_bufs;
> +	uint64_t vram_size;
> +	uint64_t sram_size;
> +	uint64_t total_vram_demand;
> +};
>   #define LEAK_BINDING		(0x1 << 0)
>   #define LEAK_BO			(0x1 << 1)
>   #define EVICT			(0x1 << 2)
> @@ -244,6 +298,478 @@ static int __xe_vm_bind_array(int fd, uint32_t vm,
>   	return 0;
>   }
>   
> +static void init_pdata(struct process_data *pdata)
> +{
> +	pthread_mutexattr_t mattr;
> +	pthread_condattr_t cattr;
> +
> +	pthread_mutexattr_init(&mattr);
> +	igt_assert_eq(pthread_mutexattr_setpshared(&mattr, PTHREAD_PROCESS_SHARED), 0);
> +	igt_assert_eq(pthread_mutexattr_setrobust(&mattr, PTHREAD_MUTEX_ROBUST), 0);
> +	igt_assert_eq(pthread_mutex_init(&pdata->mutex, &mattr), 0);
> +	pthread_mutexattr_destroy(&mattr);
> +
> +	pthread_condattr_init(&cattr);
> +	igt_assert_eq(pthread_condattr_setpshared(&cattr, PTHREAD_PROCESS_SHARED), 0);
> +	igt_assert_eq(pthread_cond_init(&pdata->cond, &cattr), 0);
> +	pthread_condattr_destroy(&cattr);
> +	pdata->ready = 0;
> +	pdata->failed = 0;
> +	pdata->go = false;
> +}
> +
> +static void process_ready_and_wait(struct process_data *pdata)
> +{
> +	int ret = pthread_mutex_lock(&pdata->mutex);
> +
> +	if (ret == EOWNERDEAD)
> +		igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
> +	else
> +		igt_assert_eq(ret, 0);
> +	pdata->ready++;
> +	pthread_cond_broadcast(&pdata->cond);
> +	while (!pdata->go)
> +		pthread_cond_wait(&pdata->cond, &pdata->mutex);
> +	pthread_mutex_unlock(&pdata->mutex);
> +}
> +
> +static void process_setup_failed(struct process_data *pdata)
> +{
> +	int ret = pthread_mutex_lock(&pdata->mutex);
> +
> +	if (ret == EOWNERDEAD)
> +		igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
> +	else
> +		igt_assert_eq(ret, 0);
> +	pdata->failed++;
> +	pthread_cond_broadcast(&pdata->cond);
> +	pthread_mutex_unlock(&pdata->mutex);
> +}
> +
> +static void release_ready_processes(struct process_data *pdata, int n_proc)
> +{
> +	struct timespec timeout;
> +	int ret;
> +
> +	ret = pthread_mutex_lock(&pdata->mutex);
> +	if (ret == EOWNERDEAD)
> +		igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
release_ready_processes() asserts on EOWNERDEAD which cancels out the 
robust-mutex fix, If a child dies holding the mutex (exactly the case 
robust mutexes exist for),

the parent aborts instead of recovering, it should be

while (pdata->ready + pdata->failed < n_proc) {
         ret = pthread_cond_timedwait(&pdata->cond, &pdata->mutex, 
&timeout);
         if (ret == EOWNERDEAD) {
igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
             continue;

else ......

> +	else
> +		igt_assert_eq(ret, 0);
> +
> +	clock_gettime(CLOCK_REALTIME, &timeout);
> +	timeout.tv_sec += 30;
> +	/*
> +	 * Wait until all children have either reached VM Bind rendevouz
> +	 * Or, failed setup and exited the test path.
> +	 */
> +	while (pdata->ready + pdata->failed < n_proc) {
> +		ret = pthread_cond_timedwait(&pdata->cond, &pdata->mutex, &timeout);
> +		if (ret == EOWNERDEAD) {
> +			igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
> +		} else if (ret == ETIMEDOUT) {

After ETIMEDOUT, the parent sets pdata->go = true unconditionally, 
Children still stuck in setup (that never reached the rendezvous) get 
released

and proceed into bind_bos() / exec with a partially initialized state. 
On timeout you should mark the run as failed rather than letting 
stragglers run:

pdata->failed = n_proc;   /* stop stragglers proceeding */

> +			igt_warn("Timeout waiting for the child process: ready=%d, failed =%d, expected=%d",
> +			pdata->ready, pdata->failed, n_proc);
> +			break;
> +		}
> +		igt_assert_eq(ret, 0);
> +	}
> +
> +	igt_debug("Process rendezvous: ready=%d failed=%d total = %d\n",
> +		  pdata->ready, pdata->failed, n_proc);
> +
> +	/* Release every successful child into VM_Bind at same time*/
> +	pdata->go = true;
> +	pthread_cond_broadcast(&pdata->cond);
> +	pthread_mutex_unlock(&pdata->mutex);
> +}
> +
> +static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo *integers_bo,
> +			   struct gem_bo *result_bo, int ints_to_add)
> +{
> +	int pos = 0;
> +	int i;
> +	uint64_t tmp_addr;
> +
> +	batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
> +	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
> +	tmp_addr = integers_bo->addr + 0 * sizeof(uint32_t);
> +	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +	for (i = 1; i < ints_to_add; i++) {
> +		/* r1 = integers_bo[i] */
> +		batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
> +		batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
> +		tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
> +		batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +		batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +		/* r0 = r0 + r1 */
> +		batch_bo->ptr[pos++] = MI_MATH(4);
> +		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
> +		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1));
> +		batch_bo->ptr[pos++] = MI_MATH_ADD;
> +		batch_bo->ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0), MI_MATH_REG_ACCU);
> +	}
> +	/* result_bo[0] = r0 */
> +	batch_bo->ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 | MI_LRI_LRM_CS_MMIO;
> +	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
> +	tmp_addr = result_bo->addr + 0 * sizeof(uint32_t);
> +	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +
> +	batch_bo->ptr[pos++] = MI_BATCH_BUFFER_END;
> +	while (pos % 4 != 0)
> +		batch_bo->ptr[pos++] = MI_NOOP;
> +	return pos;
> +}
> +
> +static void create_exec_queue(int fd, struct xe_oversubscribe_ctx *ctx)
> +{
> +	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id,
> +						  &xe_engine(fd, 0)->instance, 0);
> +}
> +
> +static uint64_t *
> +vm_bind_bo_batch(int fd, struct xe_oversubscribe_ctx *ctx, struct gem_bo *bos, int size,
> +		 int *out_err)
> +{
> +	uint64_t *ufence;
> +	struct drm_xe_sync bind_sync;
> +	struct drm_xe_vm_bind_op *binds;
> +	int i;
> +
> +	binds = calloc(size, sizeof(*binds));
> +	igt_assert(binds);
> +
> +	ufence = calloc(1, sizeof(*ufence));
> +	igt_assert(ufence);
> +	bind_sync = (struct drm_xe_sync) {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.addr = to_user_pointer(ufence),
> +		.timeline_value = 1,
> +	};
> +
> +	for (i = 0; i < size; i++) {
> +		binds[i] = (struct drm_xe_vm_bind_op) {
> +			.obj = bos[i].handle,
> +			.obj_offset = 0,
> +			.range = bos[i].size,
> +			.addr = bos[i].addr,
> +			.op = DRM_XE_VM_BIND_OP_MAP,
> +			.flags = 0,
> +		};
> +	}
> +	*out_err = __xe_vm_bind_array(fd, ctx->vm_id, binds, size, &bind_sync, 1);
> +	free(binds);
> +	return ufence;
> +}
> +
> +/* Returns 1 (caller should skip exec) on an allowed OOM error, 0 otherwise. */
> +static int bind_bos(int fd, struct xe_oversubscribe_ctx *ctx, struct gem_bo *bufs,
> +		    struct mem_bind_sync *bind, int *bind_err, bool allow_oom)
> +{
> +	if (!bind->n_bufs)
> +		return 0;
> +
> +	bind->binds_ufence = vm_bind_bo_batch(fd, ctx, bufs, bind->n_bufs, bind_err);
> +
> +	if (*bind_err) {
> +		if (allow_oom) {
> +			igt_assert_f(*bind_err == -ENOMEM || *bind_err == -ENOSPC,
> +				     "Unexpected bind error: %d (%s)\n",
> +				     *bind_err, strerror(-*bind_err));
> +			igt_debug("Bind failed with expected OOM (%s), skipping exec\n",
> +				  strerror(-*bind_err));
> +			return 1;
> +		}
> +
> +		igt_assert_f(false, "Unexpected bind error: %d", *bind_err);
> +	}
> +
> +	xe_wait_ufence(fd, bind->binds_ufence, 1, 0, TIMEOUT_NS);
> +	return 0;
> +}
> +
> +static int fill_random_integers(struct gem_bo *int_bo, int ints_to_add)
> +{
> +	uint32_t expected_result = 0;
> +	char expr[256];
> +	int len = 0;
> +
> +	for (int i = 0; i < ints_to_add; i++) {
> +		uint32_t random_int = rand() % 8;
> +
> +		int_bo->ptr[i] = random_int;
> +		expected_result += random_int;
> +
> +		len += snprintf(expr + len, sizeof(expr) - len, "%s%u",
> +				i ? " + " : "", random_int);
> +	}
> +	igt_debug("%s = %u\n", expr, expected_result);
> +	return expected_result;
> +}
> +
> +static void cleanup_bo_resources(int fd, struct gem_bo *bo)
> +{
> +	if (bo->ptr) {
> +		igt_assert_eq(munmap(bo->ptr, bo->size), 0);
> +		bo->ptr = NULL;
> +	}
> +	if (bo->handle)
> +		gem_close(fd, bo->handle);
> +}
> +
> +static int create_test_bos(int fd, struct xe_oversubscribe_ctx *ctx,
> +			   struct mem_bind_sync *bind, uint32_t placement,
> +			   uint64_t *addr)
> +{
> +	const char *mem_type = (placement & vram_memory(fd, 0)) ? "VRAM" : "SRAM";
> +	int ret;
> +
> +	for (int i = 0; i < bind->n_bufs; i++) {
> +		struct gem_bo *bo = &bind->bufs[i];
> +
> +		bo->size = GB(1);
> +		ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, placement, 0,
> +					     DRM_XE_GEM_CPU_CACHING_WC, &bo->handle);
> +		if (ret) {
> +			int saved_errno = errno; /* capture before anything can clobber it */
> +
> +			bind->n_bufs = i;
> +			if (saved_errno == ENOMEM || saved_errno == ENOSPC) {
> +				/* Continue on OOM, expected when oversubscribing the VM */
> +				igt_debug("%s allocation failed at buffer %d (OOM)\n", mem_type, i);
> +				break;
> +			}
> +			/* We are returning as this is a fail scenario */
> +			igt_warn("%s allocation failed at buffer %d: %s\n",
> +				 mem_type, i, strerror(saved_errno));
> +			return -saved_errno;
> +		}
> +		bo->ptr = NULL;
> +		bo->addr = *addr;
> +		*addr += bo->size;
> +		igt_debug("%s buffer %d created at 0x%016lx\n", mem_type, i, bo->addr);
> +	}
> +	return 0;
> +}
> +
> +static void cleanup_sram_vram_objs(int fd, struct mem_bind_sync *vram_bind,
> +				   struct mem_bind_sync *sram_bind)
> +{
> +	for (int i = 0; i < vram_bind->n_bufs; i++)
> +		gem_close(fd, vram_bind->bufs[i].handle);
> +	for (int i = 0; i < sram_bind->n_bufs; i++)
> +		gem_close(fd, sram_bind->bufs[i].handle);
> +	free(vram_bind->bufs);
> +	free(sram_bind->bufs);
> +	if (vram_bind->binds_ufence)
> +		free(vram_bind->binds_ufence);
> +	if (sram_bind->binds_ufence)
> +		free(sram_bind->binds_ufence);
> +}
> +
> +static void create_bo(int fd, uint32_t vm, struct gem_bo *bo, uint64_t size,
> +		      uint64_t addr, bool map_now)
> +{
> +	bo->size = ALIGN(size, 4096);
> +	bo->handle = xe_bo_create_caching(fd, vm, bo->size, system_memory(fd), 0,
> +					  DRM_XE_GEM_CPU_CACHING_WC);
> +	igt_assert(bo->handle);
> +	bo->addr = addr;
> +	if (map_now) {
> +		bo->ptr = xe_bo_map(fd, bo->handle, bo->size);
> +		igt_assert(bo->ptr != MAP_FAILED);
> +	} else {
> +		bo->ptr = NULL;
> +	}
> +}
> +
> +static bool calc_oversubscribe_params(int fd, struct oversubscribe_params *p)
> +{
> +	uint64_t target_vram, target_sram;
> +	uint64_t total_vram_bufs, total_sram_bufs, max_by_mem;
> +
> +	p->vram_size =  xe_visible_available_vram_size(fd, 0);
> +	p->sram_size = (uint64_t)igt_get_avail_ram_mb() << 20;
> +	/*
> +	 * Dynamically cap VRAM oversubscription so the overflow into system
> +	 * RAM stays within 25% of available RAM. On small-VRAM platforms
> +	 * the 2x target fits within the cap and behavior is
> +	 * unchanged; on large-VRAM platforms (e.g. PVC) this prevents OOM.
> +	 */
> +
> +	target_vram = min(p->vram_size * 2, p->vram_size + p->sram_size / 4);
> +	target_sram = min_t(uint64_t, p->sram_size * 50 / 100,
> +			    MAX_SRAM_TEST_SIZE);
> +	total_vram_bufs = target_vram / GB(1);
> +	total_sram_bufs = target_sram / GB(1);
> +	max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
> +			 total_sram_bufs / MIN_BUFS_PER_PROC);
> +
> +	p->n_proc = min_t(int, max_by_mem, MAX_PROCS);
> +	if (p->n_proc <= 0)
> +		return false;
> +	p->n_vram_bufs = max_t(int, 2, total_vram_bufs / p->n_proc);
> +	p->n_sram_bufs = max_t(int, 2, total_sram_bufs / p->n_proc);
> +	p->total_vram_demand = (uint64_t)p->n_proc * p->n_vram_bufs * GB(1);
> +	return true;
> +}
> +
> +static void test_vm_oversubscribe_concurrent_bind(int fd)
> +{
> +	struct oversubscribe_params p;
> +	struct process_data *pdata;
> +
> +	igt_require_f(calc_oversubscribe_params(fd, &p),
> +		      "Not enough VRAM/RAM for oversubscription test\n");
> +
> +	igt_debug("VRAM size: %" PRIu64 "MB, System RAM available: %" PRIu64 "MB\n",
> +		  p.vram_size >> 20, p.sram_size >> 20);
> +
> +	igt_debug("n_proc = %d\n", p.n_proc);
> +	igt_debug("VRAM: %" PRIu64 "GB\n", p.vram_size >> 30);
> +	igt_debug("VRAM demand: %" PRIu64 "MB (%.2fx oversubscription)\n",
> +		  p.total_vram_demand >> 20, (double)p.total_vram_demand / p.vram_size);
> +	igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", p.n_proc,
> +		  p.n_vram_bufs, p.n_sram_bufs);
> +
> +	pdata = mmap(NULL, sizeof(*pdata), PROT_READ | PROT_WRITE,
> +		     MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +	igt_assert(pdata != MAP_FAILED);
> +	init_pdata(pdata);
> +
> +	igt_fork(child, p.n_proc) {
> +		struct xe_oversubscribe_ctx ctx = {0};
> +		int rc, ret, fd_c;
> +		uint64_t addr = STRESS_BIND_ADDR;
> +		uint32_t expected_result = 0;
> +		struct gem_bo integers_bo = {0}, result_bo = {0}, batch_bo = {0};
> +		struct gem_bo *vram_bufs, *sram_bufs;
> +		int pos = 0;
> +		struct mem_bind_sync vram_bind = {0};
> +		struct mem_bind_sync sram_bind = {0};
> +		struct drm_xe_sync batch_syncs[1];
> +		struct drm_xe_exec exec;
> +		struct gem_bo ufence_bo = {0};
> +		int vram_bind_err = 0, sram_bind_err = 0;
> +
> +		vram_bufs = calloc(p.n_vram_bufs, sizeof(*vram_bufs));
> +		sram_bufs = calloc(p.n_sram_bufs, sizeof(*sram_bufs));
> +		srand(child);
> +
> +		fd_c = drm_open_driver(DRIVER_XE);
> +
> +		igt_assert(vram_bufs && sram_bufs);
> +
> +		ctx.vm_id = xe_vm_create(fd_c, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);

The VM is created with only DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, but you 
then use xe_vm_bind_lr_sync()

and a DRM_XE_SYNC_TYPE_USER_FENCE out-sync on DRM_IOCTL_XE_EXEC.

LR/user-fence submission paths typically require 
DRM_XE_VM_CREATE_FLAG_LR_MODE.

Confirm the exec queue/VM are actually long-running; otherwise the exec 
user-fence may never

signal and xe_wait_ufence will hit TIMEOUT_NS. This is the most likely 
source of an intermittent hang under pressure.
> +		create_exec_queue(fd_c, &ctx);
> +		vram_bind.bufs = vram_bufs;
> +		vram_bind.n_bufs = p.n_vram_bufs;
> +		sram_bind.bufs = sram_bufs;
> +		sram_bind.n_bufs = p.n_sram_bufs;
> +
> +		ret = create_test_bos(fd_c, &ctx, &vram_bind, vram_memory(fd_c, 0), &addr);
> +		if (ret) {
> +			process_setup_failed(pdata);
> +			goto cleanup;
> +		}
> +
> +		ret = create_test_bos(fd_c, &ctx, &sram_bind, system_memory(fd_c), &addr);
> +		if (ret) {
> +			process_setup_failed(pdata);
> +			goto cleanup;
> +		}
> +
> +		if (!vram_bind.n_bufs || !sram_bind.n_bufs) {
> +			igt_debug("No BOs allocated; VRAM/SRAM unavailable, skipping\n");
> +			process_setup_failed(pdata);
> +			goto cleanup;
> +		}
> +
> +		/*
> +		 * All allocations are complete. Report Ready and wait until every
> +		 * child has either reached this point or repported a setup failure.
> +		 */
> +
> +		 process_ready_and_wait(pdata);
> +
> +		/*
> +		 * VM_Bind starts only after the parent releases all ready
> +		 * childen.
> +		 */
> +
> +		if (bind_bos(fd_c, &ctx, vram_bufs, &vram_bind, &vram_bind_err, true))
> +			goto cleanup;
> +
> +		if (bind_bos(fd_c, &ctx, sram_bufs, &sram_bind, &sram_bind_err, false))
> +			goto cleanup;
> +
> +		create_bo(fd_c, ctx.vm_id, &integers_bo, 4096, EXEC_DATA_ADDR, true);
> +		expected_result = fill_random_integers(&integers_bo, INT_ADD_CNT);
> +		igt_debug("%d\n", expected_result);
> +		create_bo(fd_c, ctx.vm_id, &result_bo, 4096, EXEC_RESULT_ADDR, false);
> +		create_bo(fd_c, ctx.vm_id, &batch_bo, 4096, EXEC_BATCH_ADDR, true);
> +		pos = build_add_batch(&batch_bo, &integers_bo, &result_bo, INT_ADD_CNT);
> +
> +		igt_assert(pos * sizeof(int) <= batch_bo.size);
> +
> +		xe_vm_bind_lr_sync(fd_c, ctx.vm_id, integers_bo.handle, 0, integers_bo.addr,
> +				   integers_bo.size, 0);
> +		xe_vm_bind_lr_sync(fd_c, ctx.vm_id, result_bo.handle, 0, result_bo.addr,
> +				   result_bo.size, 0);
> +		xe_vm_bind_lr_sync(fd_c, ctx.vm_id, batch_bo.handle, 0, batch_bo.addr,
> +				   batch_bo.size, 0);
> +		create_bo(fd_c, ctx.vm_id, &ufence_bo, 4096, EXEC_UFENCE_ADDR, true);
> +
> +		memset(ufence_bo.ptr, 0, ufence_bo.size);
> +		xe_vm_bind_lr_sync(fd_c, ctx.vm_id, ufence_bo.handle, 0, ufence_bo.addr,
> +				   ufence_bo.size, 0);
> +
> +		batch_syncs[0] = (struct drm_xe_sync){
> +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.addr = ufence_bo.addr,
> +			.timeline_value = USER_FENCE_VALUE,
> +		};
> +
> +		exec = (struct drm_xe_exec) {
> +			.exec_queue_id = ctx.exec_queue_id,
> +			.num_syncs = 1,
> +			.syncs = (uintptr_t)batch_syncs,
> +			.address = batch_bo.addr,
> +			.num_batch_buffer = 1,
> +		};
> +
> +		rc = igt_ioctl(fd_c, DRM_IOCTL_XE_EXEC, &exec);
> +		igt_assert_f(rc == 0, "xe_exec failed unexpectedly: %s (%d)\n",
> +			     strerror(errno), errno);
> +		xe_wait_ufence(fd_c, (uint64_t *)ufence_bo.ptr, USER_FENCE_VALUE, ctx.exec_queue_id,
> +			       TIMEOUT_NS);
> +		result_bo.ptr = xe_bo_map(fd_c, result_bo.handle, result_bo.size);
> +		igt_assert(result_bo.ptr != MAP_FAILED);
> +		igt_assert_eq(result_bo.ptr[0], expected_result);
> +cleanup:
> +		cleanup_bo_resources(fd_c, &ufence_bo);
> +		cleanup_bo_resources(fd_c, &result_bo);
> +		cleanup_bo_resources(fd_c, &batch_bo);
> +		cleanup_bo_resources(fd_c, &integers_bo);
> +		cleanup_sram_vram_objs(fd_c, &vram_bind, &sram_bind);
> +		xe_exec_queue_destroy(fd_c, ctx.exec_queue_id);
> +		xe_vm_destroy(fd_c, ctx.vm_id);
> +		drm_close_driver(fd_c);
> +	}
> +
> +	release_ready_processes(pdata, p.n_proc);
> +	igt_waitchildren();
> +	igt_reset_timeout();
> +
> +	pthread_cond_destroy(&pdata->cond);
> +	pthread_mutex_destroy(&pdata->mutex);
> +	igt_assert_eq(munmap(pdata, sizeof(*pdata)), 0);
> +}
> +
>   static void alloc_sizes_init(void)
>   {
>   	int i;
> @@ -986,6 +1512,7 @@ static const struct test_case test_matrix[] = {
>   	{ "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING, TYPE_THREAD, false },
>   	{ "threads-leak-binding-rand-sizes-50-unaligned", 50, LEAK_BINDING | UNALIGNED,
>   	  TYPE_THREAD, false },
> +	{ "test_vm_oversubscribe_concurrent_bind", 0, 0, TYPE_OVERSUBSCRIBE, false},
>   };
>   
>   int igt_main()
> @@ -1011,6 +1538,10 @@ int igt_main()
>   				run_threaded_bo_alloc_test(fd, t->count, t->flags);
>   			}
>   			break;
> +		case TYPE_OVERSUBSCRIBE:
> +			igt_subtest_f("%s", t->name)
> +				test_vm_oversubscribe_concurrent_bind(fd);
> +			break;
>   		case TYPE_ALL_SIZES:
>   		case TYPE_RANDOM_SIZE:
>   		case TYPE_ARRAY_BIND:
