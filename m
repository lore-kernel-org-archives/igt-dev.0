Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B250C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 15:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B914210F056;
	Wed, 12 Aug 2026 15:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vfb0fFX8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EBE10F05D
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 15:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786547610; x=1818083610;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tAYY2B990gMNRQdAT4qOTWLZ9He6LvTIOwftLG5BPVk=;
 b=Vfb0fFX8PjPz9m3TkioNSiWst0O0RoZVz72vtGL18tlIb2BtN1P22bu3
 H2ot7Uq/N7OPrA5Viz2O+itYlX5g1W5/oesM4hqNlgMQajbooBgLIvcRH
 v9WeHaenMlo3qpNd78uFjgFjhwfB6E+AD6nXNiJN2w10O70nHc2miGN7j
 MInu/JqFQNwSvejDTPyGPWIrGGbqilnhkrirAof3CJ5MQJTXePZr+LKYp
 5Y6oUxzwstWmF3J/7OMIIVkMbBC+4YpbhvMlGhNz9VJd+BQW+z7WmAw23
 oT59yL2R3AkHeZhz/WzhlSF0jDd5po3vzOB2DBnKwZuWK1BpP1UvBFBK3 w==;
X-CSE-ConnectionGUID: jE4qReF+S1GYag2LjdocCA==
X-CSE-MsgGUID: jAhJNjpVTkWdyxhoJh3YNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104490149"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="104490149"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 08:13:29 -0700
X-CSE-ConnectionGUID: AbGxB9LYSDy7ScoyABL4RA==
X-CSE-MsgGUID: ZepBWFEiR0GfIfWxNoc81Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="261045610"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 08:13:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 08:13:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 08:13:27 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.16)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 08:13:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIIg/71HQZAH+oGkr2HJN/1KRl7FFCTxa3C/3Jjjg3zY+5SMb/rkl+mwNRBjP+IBfFtXCc30NCO72U39v/vW/KGZXkLS94CoTgmnQvLtxbfA104JwB8vGK5M3/yxeNhJefSIyH2c0nw7QUp9gbKy7UkGLwHmq9QspHQ3mXSP/ij6lDAYpteOKeuNamVTtTSCUgyqYSuJf9J+4RkIhldr8fu5M9kvVuxOfqqQ6KRJf8MXYUUBuvEJcAIKDz9pspT/n+Fpm8WGNHYeMvAnFbztussKeAU0gcf3MGhRrfJIzQFZ7E44g2oObHJgIhS/L8z3RYAElXX38Z2rvsZAnaG2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAF3sHUSNrS4Tb9FgSJy3rcnZgQjq8ajWBZSeBZdTUM=;
 b=kWiDbVXireTz7j5vJv5xU3csMcNPi/0TKvwv/xx0H5fsD4r1hD8ZQS75kaUaEE8twPeYCTBWo61nqmqyhk5YfdYI7SFRaWLsAJpf+HQjq7CSbVHWZbZdRxm6gqcjLdfVkmDsYroDS+VhvANfvPhX84V+V8a6XJlsXsYHIT02rkf1+58cQUuI+ZhAgZbqWVZ+ddxDpD/bOPP0il8trX2VJY0j6m5wMVN6r5H6kAfs6oSsNc7p/fv9FUiSPhV/SSNVmxSVS0oxr/oiLotJOIg5teCDu1QSK3gBmX71wwBk8OpKfy1rHHYJF2SsX8s6k1GO3rpP17TA/KkOqoN15/1DPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH0PR11MB5808.namprd11.prod.outlook.com (2603:10b6:510:129::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 12 Aug
 2026 15:13:05 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 15:13:05 +0000
Date: Wed, 12 Aug 2026 17:12:59 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v2] intel-ci: Block sriov tests on i915
Message-ID: <anyNQ1HIM3z0h-wh@kniemiec-mobl1>
References: <20260812150122.1380284-1-krzysztof.karas@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260812150122.1380284-1-krzysztof.karas@intel.com>
X-ClientProxiedBy: DU2PR04CA0222.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::17) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH0PR11MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a75688-9844-4064-7c34-08def88435bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zgQMrMMOOOwcsddCt4dCSEViu/tkkG3eNkHNhddT1ir/sxGHrHKh9Tun6rLbpn3T2fgIYiHGr7ssMfPjVw+tYEzgCsaO8lWVF46vOPk73rsH5gWJT/tmxfcmwsEqp1UwpQWYdBvzHZ3ge6/3VwnfyHFfwaXrPoapk/bgLpfrUrSC5b2E6G51b0AoZMBnmf7Xx1FYf2qU+hTc+ru/h3xHnzfxcgYDKuhctIr9rTj4FOzdW0ehYajLk4tGlj4h9JkawP285LYagz1qIeYslmJkI5ME3BWFhDslv8c4+bDHSiSh37jHH4pA2Kk41lw9tihi6DnAMttyCPQ2Poi6e6t84OCU4z9NRZ349FmGUvPKghJnu+D6kKHBXCNra2FH4jXl2B46x4wFTQfvuMCx1ck/KjV7p9mx1Ylep/mO2tnl/FBykGrsTgjJT+8wfq7ivUmWgV4Yg2PZQMYLuk+wV0ebYeurdaHv146IV70+0NwMLfU6pXD1JaDLTGJ9p+0aRcWfpw6w015b/I4CF7+sBCeSR1KO1gbTHVLtEAn0Kdnukkt5+OzbuBDC+R8PcTquTc5/3o7f1Y+0121Wux14+bGREjSBGJC69rXZqkFx/jSsoc93M33zHdfdYxeFvxRTNcjKhAbiOgV4dRmt4DRZL7bg0o8R6MaE0YPJFl7kkN3DgVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?My8vM0xnRjR4bDg5Q2RKUjdaclVGU2NHU3ZQT2R5VHN5ODlXWnJobXpzK2Fh?=
 =?utf-8?B?aVlCWVpnMEZLbVBGdGliSHp2cHh1YW02Mzd1QkF4K3EvTGRoSnBQanJwNjJH?=
 =?utf-8?B?MEU4aUJub1kxVitxeFJ1eDM0ZEVDcXNINGRsTFF4bWFLeUk3N29jbFRPd1g0?=
 =?utf-8?B?RXMrVVNOM1AxNHZVd2ZNdkhkVkFPamdjRFM1cG1OQlNBaERVVUxxYi9YaFN6?=
 =?utf-8?B?d0hLalZ5WGJEWkR4YXYxSUM3NFdPaHhzVkpzVjd3d0N6ZUpVUlNhOFR1WTdL?=
 =?utf-8?B?aDVTbUhxQkxMRmhGbVdDa2IvMGUxaHk1OXB4MVVsbHM5ZjlpS1cwUXlYUmRN?=
 =?utf-8?B?aW5SV0J4Uy9MWWxuMVBqTXdiWTQ0UGh2UG5ZcXRwU3hSc1oyV1YvR2h5NmFv?=
 =?utf-8?B?cGRCZnJIcVhjNDVDSG12UjM5aE9mdDNBbHRrYjB4VXUrV0oza0UvNzFEUUNl?=
 =?utf-8?B?VVNYVnNmWDlqSElPR2Y1Z0gxUXdpcDlDaHFlblZyWHljZjd0U1ZoMndmVnA4?=
 =?utf-8?B?R2x6UTY5VmZSMEVzRkJyZ29sZzZCWlBrcDJzVy8vcUFxU3M5b2p3cW5GZXZX?=
 =?utf-8?B?dTNiM0hXSGtVMzRMS2VFT0djdk9YdnhoQUNRbWhZbnMreWZpTm1PeXowZ2Z1?=
 =?utf-8?B?Yk1SeGhDdGxkWTFwZkdLTllUaHlKYUR1UVdqSUxiOENRL3Qxd1pBTUZuSlZy?=
 =?utf-8?B?YWp0dDlzSkRoeCtxeFBiSENpbzloUEpjK1FuUHh5dlJSVzRRYWh3MGYzM3RJ?=
 =?utf-8?B?OUxVZWhTVDdRUzhobS93a25lTjkrTExGcTRqQnBFYkpZOUtIQktwTWpTOHdo?=
 =?utf-8?B?OTVTaXY4Wk9vSXZUYUtPZWt3anJQVUNYWXljYk82UmNobCtOU1NJSk5qNnVy?=
 =?utf-8?B?M2FzREQ2WFd6c3RtQWNzN0N4N1AxaGRZY1g3Q0RjQ2RXTzZ6YjNTMmI1cDFp?=
 =?utf-8?B?YzdybnAyN2VqZFN3ZURFTzE2dzVNSktEL0tJL1RCcmpEZWVuSEZYd2VNODVk?=
 =?utf-8?B?Vm4zaTIrN0ZtaWk0T1NaamdpUGVEQ3NUVElMSXNDbDVONm9YQm0zV2k3R1lF?=
 =?utf-8?B?OVJqM092ZkNzZU8zVGJWem9wS29WNWNWbnF6Rk9TRjY2M0x0MkZnV2dqU1VJ?=
 =?utf-8?B?Vnd3UDRpRG92UUltQmxtbWxMSXMzbVJ0YjZoSXhpRnRILzRsT3pWTC9EWjBz?=
 =?utf-8?B?SWowa080M1Rhd0ptbFI0Q3dMYnQ1dXhFd2xmMkRUakNWcURXekYzOHFLVmt2?=
 =?utf-8?B?M1ZRaVFVL0ZiT1g2ZzZTK0tjQVhoN1Izc0pYdGkxdzMzRlB5WmQ5bEJ6b0Nt?=
 =?utf-8?B?TWN0V2wrdkpJd2RFalNUZUgvazV6WEZxQnR0WTkxUkpSRFVESEp1dXhCY3Zw?=
 =?utf-8?B?a3grR0Y2NGRwOFdsL3JJdU1Ja0FvZTl1REVNMTczMDR2UkNlUWllM1JOMm1v?=
 =?utf-8?B?K1Z2T3dKOCsrY3RucGRrZVNibDJRZkVnZHdVZXVHaVFCdFp5TDFRRmFPVjZ3?=
 =?utf-8?B?Yk9ZOWNad3FBOXVia2xNbXRmWUhMbXQ1UkcrcjArS1krSHpCbUNPb3Q3WXpw?=
 =?utf-8?B?NEU2bGVZd2YwWDI3TXBtdStraHJkbFpBeXQ5L1pyYVJQbm5CQ0hWcXdXaEhZ?=
 =?utf-8?B?eFc0NkRVQjVuZEVrR01nVm5JVndkNkQxNERwS0NFQjdZK2xLNisxL3ZDc3Zq?=
 =?utf-8?B?NzdzSlA5R3A3eEJDWUlvLzV5TEFhWHI1NGVFSHltVitZVDFWWCtaamdqcmpj?=
 =?utf-8?B?WlBHMW15azVmU2N6bmhIS0JpV0w2aFIrU1V6VmJ3ZGx0cmxGT2ZPby9vaE5p?=
 =?utf-8?B?cHdZTDNuK1VLSnN0c2w2dHczMzNpS1RJdjJyeDRBSUJCNXZSa255N0s3VFRY?=
 =?utf-8?B?TVVmQ3plZHJZQm9NRjJaelBBVUZIem1ONnRBQVVmZm9ZSmhKTE5wcFlBUnhx?=
 =?utf-8?B?QXIyMk9lcHF5cjJNUElGYTZkRW0xdXlUYklZSWZUcDNBRXFDVmt6REQ4VFIr?=
 =?utf-8?B?dnJCU2g5bHdkZk03OS9FYkc4MWttYUorTEZTSGRoNS9oTVEza0I4alUvWFQx?=
 =?utf-8?B?RDdqdUpucVN3eFRYN3VkQm1hSEFSOXFBRkdDS0hKTzFEaTdOR2UvczdjN29u?=
 =?utf-8?B?NGlnSEFMQVUyRjdOclBOdmZPemppNzBSV1BUdWV3TWlrTXNLaVJxc21CS2hR?=
 =?utf-8?B?UElMVmFYUlZ2YzdFZitHK0ZYOHRablNTSU9DbENpOTY2SXFZakFhWVQvZU9s?=
 =?utf-8?B?R1pDZElHOUExVEx4bkNqSm5vdXdmRmZubmFNdE95emFnMHpvV2VoNDZabTEw?=
 =?utf-8?B?SHlyU3BTcCtidGJTWmVBSEw3ZDlpWGo4THltOTA3YWR0ZnB3RmpNanVLN2Iy?=
 =?utf-8?Q?so3lwK0ktx6QmT+k=3D?=
X-Exchange-RoutingPolicyChecked: ogCsablDySoR27OknNbRDT8dF69RoOum5618ewHGcCIBRFC0d7xk8eVcYVJjVKJfHOBFv2ESAkFjGX9BHvwCzO0mDFD5HLwK+83iRlwZdar69KtBkgb/6QMxmM4KOcJDOpLVR5xdvGVIRcEJcR0aL63C6on9hIxnReQnUKV+vELhmiM/WtTt1x753CMvqbdauJsUez78SCKd0aOBB+5uaEndEpvVa1xOwhP6nXUg3bh70nkjOtPohZNDAyNx8Prw5Cpz1lF9JXBUWN5TEybu5irmQeCAbOjVnbfMzL/F3A6NX4rLRX+HU0HGtOT7cSpycpEkh8m3vwypRhbrwG4LMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a75688-9844-4064-7c34-08def88435bc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:13:05.6592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZQWiulX1q1SZnOGxUP88bbXdH2w+19rsqY7VS10lAXUdkhBvaLhZNC8GfMbjpwsZdBpioZM8SXHizM8HDxHVpzJmJ7ESqcSfFKzc3AsjxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5808
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

On 2026-08-12 at 15:01:22 +0000, Krzysztof Karas wrote:
> With addition of commit c9a41149d843
> ("tests/sriov_basic: Validate PF unbind with VFs enabled")
> a set of sriov tests was enabled on i915 machines what,
> expectedly, produces multitude of SKIPs in our CI [1].
> 
> Amend the problem by disabling all sriov testing on i915.
> 
> [1] https://gfx-ci.igk.intel.com/cibuglog-ng/issue/24557?table=&page=3&page_size=100#query_key=dc51d83bc41c2b44b58762c6cd35195d043d85ce
> 
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> v2 (Kamil):
>  * shorten the patch title,
>  * shorten the reason for SKIP,
>  * and capture all sriov tests in regex.
> 

LGTM

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof
