Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA330C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D52D10F946;
	Fri,  3 Jul 2026 21:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfGva1iv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A1A10F947
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783113762; x=1814649762;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e3YOXyVPt0/vkZg/8sL25mzqkCovkZIfjtrn3XeU3Us=;
 b=BfGva1iv+QZYBv6d5Lyhk4qS0Wk+YPzX8iOsehEX1wABwhEZ+v63exEl
 FvNAzVC1DygJcux8gzPiJXa3guBt/PAFMvpMJL+LxvlaEjEheDM1yxDbE
 O6ekSZg8TPLLsnjo0tR16W0ywCCY+uFh2uy8trBxRYTnrUy89OUk1G9+2
 /jCRRr1FGBUFBWZBqkhQBPIcPnfU6Q/6P2hOJeMbuyVCuOjEaiFMG5R3B
 BmuGQoXkFiGTd4mdRnvgkH7FmAtRy3KqKRJGFqaqlhOGbdsYslyVvwOCk
 xSCLix4Qn2pzelBO2Qv5P2cgO1wTNtoTMup7CLD0enbYvhGmutGiknxwD Q==;
X-CSE-ConnectionGUID: 1gF4Dv0lTjS45HwWnyY2bA==
X-CSE-MsgGUID: Z6PMS//mQcuCRs39Gpq9fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83726411"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83726411"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:22:42 -0700
X-CSE-ConnectionGUID: N0ogP9p5TribAvsZ9DBwkg==
X-CSE-MsgGUID: 1zRC24dDQhuonZTH2FL9tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="257080862"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:22:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:22:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:22:41 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtOm1pLo8kZhtXVVydVZ2lusFokvXTCbK+EwjAq5oKicRelkXecsm/4bxil7mTq94qL4mjaJWE1Q4Ojt45Cp5FLXfh8j4LNnjokuBiOfN7AVP20qe73GuXWav0xguOEYge3W2fx1Vv/pnffDsIlFtE5PDP2HGdQPk+9kFZ0jk6dCCPUCBAgjb5zEgdpNPgbocvnqodl16qvV4kSXRD/GWmABBGuzr5V0A35sZDeMWqnzdSthdIKH7EFY305D8HUoXH4/Rj5NROtKeYTWxQu2zJs09v8qKov3sjeuylVJFu2htWaMmugNLufMieqxgagSYFW2CJB3O/bP7+X+R9COJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXWfcHKH3bCR6lJJa2G0EFJZH29Ckyg1zrzPG4mRr3M=;
 b=k8OVC6YbVlyNXGDM3br0t58XVy8xZMArCEsfh4xT1f7R+OelNAVhCAL9ivuxVfZqnN0x3nGZqC/DdlmehlJclh26r+C0wvJrJt0Jq4MwiYQ3Ng5ep8AqukpXoUTWKElquzB8XvVFLVAxoFtcTcDwXxour4hiyo13fVhU8yPmNDZeE+lMhZHN4SY93D/5Vn3B+nzZGil/d3rUEhRhEgQPlvuo8hse8cnJCjPZhr+cadElOkwh67dWb9rkycU67u5FBlZIxchs8o4sLKTnNhdhNkIrUO0Akj5NUpSRyce8DcO3CyCPJob8XsoMIP9NqUVPcWKB0ZnEFhWOB32BOfCxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH3PPFC80959CE8.namprd11.prod.outlook.com (2603:10b6:518:1::d4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 21:22:34 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:22:34 +0000
Date: Fri, 3 Jul 2026 23:22:28 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 31/31] tools/lsgpu: link with minimal
 sub-libraries
Message-ID: <cji7vpmuwmbmsubcrtw5ljtzjrl2ooxw5vkcj4fapr77fbfdrn@dmvq2cikyplf>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <7eb931dd2fbb99b980e94fd52fff258fb82075f0.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <7eb931dd2fbb99b980e94fd52fff258fb82075f0.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU7P191CA0009.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::13) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH3PPFC80959CE8:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de5361b-cb62-4f38-6748-08ded94932e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10070799003|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 2FCRQTx9OGG7xJiNMQp760d+uDv3q6xbTmQZuUFrvz4sWPoSRc1PN5eLnRPP+RAQcBkgWBZruHNFaIMqqFeEvVIBWSG+eQ8ttz/4cAlumuK8IdkoQ25Yqna8VaSVL04nJa/0/adfcO2dBtWMX5afqidZUZr8YXFFcaFD3PfTtba1Xq6hp1qkq4o1i7RC1fz6IBsSIbRP+T79nUCdOBrX5VAz3Ir+Gmqy33xWxoVqH5thn4vMAXTGwRYOV60Tj+W8Nk2Ypbo8ZkyqzzUvsb29xv6jwJ5myjk0/e42x4nDJQbRA8MK90v7WBOwG8ZYSOmqpQLYWUOeKLJFUVC/yW7JoAtZsjXr51vyb4psRkKRhSLRLvkviET2yfY0CGms2hFlKkl2kuIuzR03M4/OA00n6OfPW4CE8zT3MYmYKAV/AM8U1TgCYwDtv0uiyVOtbT5/+K2ACYmisBnagpQ+zYY+a5sHudt88Dac+PaGtx6lhjjG6DaEj6symN4YNXxOsXa8PTexZf4RAlb43qelYXhWGraS372t/sDmM9QCMxV/w6jK8THOnfNaYfeFqw/lYw0Af4bzbtD24p0pJGhdAtXvh3DiA9Zm7+nQjShTlxgPM/+7U/s6x4YOTQuq/vBo/oI0SNbiUo606dzPYsJyVBoJlsdWhucq2ABNj4hUg0g4cY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10070799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUJrZGl0cFZtd3RFK2hHNGl6bWFkcXp2NTlySmRhMjhrWE9hN2l0VXFUSldM?=
 =?utf-8?B?djlaUTVwY1pPU1NjQUQzejBLREM1c3BuZ3VsRHdjZExvVUxCSFdsc3lrVmtj?=
 =?utf-8?B?U3BvbGxtUzMzRjZFaVhQamgrQ29HeEhTMkR3VTlMSGJiZ21yNFdnVzFBUkFv?=
 =?utf-8?B?dmlyOUNNUE0vYkNEaTVLY08wYU5CcTBLZHRkbWJ5M1FuZDNndnVVcVR5VVhq?=
 =?utf-8?B?NUNpVExHdGhXYW1NSGlOQmIveEhzWjVxaHZ3bU9Hdm5NdFJSRU1lMTZjVFhY?=
 =?utf-8?B?SjM4dE1ZejlFZWpDeTZlMWJzdDVIRzYrTUJMTGtiZU1waWhja0NCSFBMUDQ4?=
 =?utf-8?B?Zjd4MHQrWUFZd3c4RHU5ODEyTm5oY0E3Nk13dHhldnNwb09vb1hkdkx2dlpS?=
 =?utf-8?B?ZXJraFk0ZlE0WXJoZlM5RjJVK09wWE9ndDBJa2NCMlVOYS83UDcyVVlobFBZ?=
 =?utf-8?B?OTg5RUFGNlErcHFTTXdlQTBmRW1WUkxUZ25PSk1QMjlJSWlRZkljVEZOcVRw?=
 =?utf-8?B?Zy9PSmJtSnYySkhyVWM4ZlZiVUZXT0l6eUJsYjNybEY1dlhlZVRSYWtYV2FY?=
 =?utf-8?B?d21qdEZYUHdMNjhPNmR6N1cvU0VHRFJkK3JVRUNPd2VrblcxQy9TY1psQVha?=
 =?utf-8?B?bkEwRkM4Rm5rMTJmRml4QjdhL0ZnWVFtc0Z2Uk1kQkZ4K1lkM3VIR0oyRHdw?=
 =?utf-8?B?UHdNSkxhdEpyZ0R4OVFSandLVlhzOWN5VUJta280WlJ5bFB2MmErYVNDZEdT?=
 =?utf-8?B?TzVlMk81RHZmVGtvRnNzaXVubDNXeDFzcWVBN1NNRk9tN004amdkZGEvL1Z4?=
 =?utf-8?B?OW1naGU2eC91NkR6UFRkMlVxNjI0UHdBNzhUR3RjczlQZzB6T01GL3IyMG1X?=
 =?utf-8?B?TUUvdSswV2RweHh1Mk95K1VaS2haZTN4cmIrbDFMbEd6bUxpQ3lob1ZNaFJI?=
 =?utf-8?B?SHZ3dnZBZnVwdW04K0RaUktGUnRzTDRyWTVBUDQrT3hGS2lpd0VHMmhUakd4?=
 =?utf-8?B?Q3FQT3pVYkpCN3AwalBXU2NFRGVtUkJQWVRBOFY5Vm9IczZkZEJzYW5SNzJO?=
 =?utf-8?B?cmMzLzVHajZaSGY0bHZKR2hNRnpWUUNZSnFjQWpLby8yeVZNSndtdVpES1pX?=
 =?utf-8?B?Qnd3b0MvTEJNOWFyeURyM25nV2NKTUJMR1Vic2lBTDBUQlZxVldTdVNaUENm?=
 =?utf-8?B?WUpRU1EvaTA3SG9wcjdMc0ZUOVBvVjhxYmRhUThlTmZISnVBUjB5S0FaVkVv?=
 =?utf-8?B?ajRZdEF5a0MraG1FYktuZWo2SlF0bitmVUFvWmVuSUpWalpMb3R4ZkpyMXdt?=
 =?utf-8?B?RURYbDZyOFdiQzFlTXR3VVYyclAwelJGWDdYNVZCdmU4Ti9RTkdEWitXdXJD?=
 =?utf-8?B?ZHJBTE5wbXRFYjVCbnBENDBTdkVhWkdEdkFaTmF4eUpnb3o1YklvNHdpVDJ2?=
 =?utf-8?B?RVlINTZMaTdCUk5TYStnQVROR0Y3NzhBVUZUQ3FodEsrYmltZ1Z0S2tWcVRQ?=
 =?utf-8?B?RHplWTNNSTlxTUhrVytDT3EzVXJhQkdVY0pKS2kzWGZUN2F5OUxiSCtLYzND?=
 =?utf-8?B?QzllUFlOSHJ5SlgzL0tCTU91bzJGNjVmSXkydFhTcXR6bVlteCs1T3JMZWZr?=
 =?utf-8?B?NXpGRm03N3VXTk5VWDhGZnRudmt3Rll3MEF2ZHZtMDA1WEFOWTRiempSZnFK?=
 =?utf-8?B?RUQxbUxWZFBmWDgvKy9zUFJ3bm8zZit2b1d0N2NqUVZPZFBFZzJUN0NNS0pM?=
 =?utf-8?B?Vk9Da05YQXhNVlByM2JnZDV6U0MrVEVvcjZCUjkrbmY3ZHIwYVEzeThtbk45?=
 =?utf-8?B?QlQyNFFhMjZxUzBhSGMxQVZERWxBMmdKZjMwUElGZnhFL3l4SGloTzJ3a3Vl?=
 =?utf-8?B?djdNNXNYQ0VFVHNNMy9WcmFMRU9Fd2hndW9ISUVWQ2VySngrWmVrenBIc3Fx?=
 =?utf-8?B?TXRrQnBUVDg5WlgrOXBUT2hzS2tNMUg4UUo2cHRBT0tzazFUbllXRXdKbzVH?=
 =?utf-8?B?NE9IajdMcEV5RE44L3JwOFhmNksvUGdDZGZ6ZXUyK0VaQ1E5TFAvVi8rZ0I5?=
 =?utf-8?B?aTVPZGpYdUVxYUVYUjRoRHduUklGSVppREdsdXR0eFdrdkM3NU9WVjNkREJL?=
 =?utf-8?B?T3RkakdMSkYwWEk0b0ZucU1xNllIM0lOZ2FlbVdjMExCTTdOL1NmdXdSR2hS?=
 =?utf-8?B?SlkycEdzampPK0hrK3Q3Kys0SXhjMFVlWEdjUEhJYVJ0dEtjRXkyNUV5SSti?=
 =?utf-8?B?SkNsdkY2QVU2QldCR3VNOWRrNDRjWFc1bE5ISXdTcjlBb0JNSTBGaU5BR1Z5?=
 =?utf-8?B?ckkyNTQxWVAzSTFLZFMrS3IwR0VMcFdSdGFBVHR6UksxcFdnc0tWL2hnVkNJ?=
 =?utf-8?Q?aZ55lFWgVANTMCL68SXXenjV235Abswpj28SBPXb3u95l?=
X-MS-Exchange-AntiSpam-MessageData-1: CbXHa6LJvYN6HXpAn6lFg0Sx4t8/E5UEP3Q=
X-Exchange-RoutingPolicyChecked: RsDhmF4qRqoq/SjdcsJ1EMLkkPRw86fJvFxan+ZbDD76GU3qme6gXFyWEx8PMIP+sZNvX84wN9JWaUjVhdKXAQgUN9UOWqgy7A3Ma3I5IHNakk0sCs1kopUv7y0WHfF2WPAZthJvz3oBrkNdVrr0b3PcdhrwPDlFvdiSw0r8XnmfNnEGAj/dBFLDI/ohmlusUO3UBe6qUk8u+YLpk9uV8IrSCd7I/uuHsPl4slmxVuBSziQ85pA5G2nb8x5hOvvaKj0BaYn2o7Wfhh06H2mIWo/bF+vL77JXwDJUnkju6LYcB7wDblWyyKkMo3WyF2Ii+/HKsIu24otkEAeRv7e6mQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de5361b-cb62-4f38-6748-08ded94932e7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:22:34.3836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: psCxElkzU1g93HEK0R/xVbdeG6uP36PRoH+jUXkmASbrHJBd8S1cZwsrlo7H8XyFm79Wlor6FIAXxLS4+ZFyj9jULJ9y0MKgGxDZt5dK0Ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFC80959CE8
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

On 2026-07-03 at 16:29:05 GMT, Sebastian Brzezinka wrote:
> lsgpu only needs device enumeration and the lightweight tool stubs.
> Replace #include "igt.h" with the minimal header set and stop linking
> against libigt.so.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   8  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/lsgpu.c     | 2 +-
>  tools/meson.build | 7 ++++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> index 935371dea..7d6b70b9b 100644
> --- a/tools/lsgpu.c
> +++ b/tools/lsgpu.c
> @@ -34,7 +34,7 @@
>  #include <signal.h>
>  #include <sys/ioctl.h>
>  
> -#include "igt.h"
> +#include "igt_core.h"
>  #include "igt_device_scan.h"
>  
>  /**
> diff --git a/tools/meson.build b/tools/meson.build
> index 6e694164f..fbc6c0a00 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -27,7 +27,6 @@ tools_progs = [
>  	'intel_tiling_detect',
>  	'intel_gem_info',
>  	'dpcd_reg',
> -	'lsgpu',
>  ]
>  tool_deps = igt_deps
>  tool_deps += zlib
> @@ -172,6 +171,12 @@ install_data(['intel_gpu_abrt', 'intel-gfx-fw-info'], install_dir : bindir)
>  
>  install_subdir('registers', install_dir : datadir)
>  
> +executable('lsgpu', 'lsgpu.c',
> +	   dependencies : [lib_igt_device_scan, lib_igt_tools_stub,
> +	                    lib_igt_drm_stub, glib, libudev, libpci],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  executable('intel_gpu_top', 'intel_gpu_top.c',
>  	   install : true,
>  	   install_rpath : bindir_rpathdir,
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
