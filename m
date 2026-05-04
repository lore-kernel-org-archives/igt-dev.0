Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BBFFF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 12:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2375510E2A2;
	Mon,  4 May 2026 12:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9si8dUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44C710E2A2
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 12:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777897499; x=1809433499;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I8kDwaEFB7pj4Bt5PU+akNr0Mf5ZwQStvVJaou/xa3w=;
 b=K9si8dUNY9YtoyFCK8C3LnZIF6LZCw7l4SMwkW0i7ltMh+bnWDbbEVZH
 Sju10kVZAuEljRXYfkQD5m6vwHfpRK7r9F1+B4BQUcVmDP7EayKqR0LZ1
 +PgRc4sZNAOFoSAeWj0sY2vDiUAKZGj0adkPwW7YMSugqLASkqXIVzeqJ
 FSUlgM5TM04W8IaLgSsafeJ36+pUaS8XP8nx6kA6BSt8KeF6dEJNpAeLf
 EzoSOSxAyIbhtwjsNq53jfmojaGGeFnmlGkW8WTPFv1SNF/5lZLcNN68B
 yB3u5BkSuZ6OTXXVeuWBc7OSa9ys2ufsqVA3Nk0Vcz1aM6rnzfDMi9UQK w==;
X-CSE-ConnectionGUID: I3pUeO1KT+WvrcMYeyOKXA==
X-CSE-MsgGUID: k6nBZr0HR4+QHeVCz6Wv6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89059024"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="89059024"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 05:24:53 -0700
X-CSE-ConnectionGUID: v7qMSACzRCKCwgCYoMXKTQ==
X-CSE-MsgGUID: CGS3phO0RHiD9nl2Vchm7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="237280007"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 05:24:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 05:24:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 05:24:51 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 05:24:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8Jz+5RKVUFy3pLYKhWMthDSmArtBWpLunMlBzuDAIxpi62S/kgYUeyOmU8d6FcHgqCJtQplDot5XDFKwqqmNAX5jJkQjDkKURpwidagtAFQM8Y4ae3vfThfVAvCH0RMhP0YlFuHo3uYkVJamQHFByZ8s0VPUyfHzoyHVmGiH8mQxJ0jzDDLdOnYcYsk3CSURh3cgraaH2rDDDOThYrvEcz3hZq3xeF/BTFYLiuzPqZfZIMhWTSJQqpmwMEYh/6kTd31TO0FUh78Gf1rFinvu33vK2aaVU1W+/KTcey6OG2yseZtks9TmE5WU8s8TqfrawaKR0egy31oezilueBCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvdfFb9rQHrw5euGHtaHEg64jwovcVQoz7zWlquGJZs=;
 b=Gpm3uzFjeUuNgxJSXCB+3BUsHO/AvjgafBYFq24cO61TWe1Asif1EhHIFZrN6/0Mf/ui4F9N6fxULq1OPa3nR0+muEsm1Mqalj0A4+IiAzCM2To5DPhLFkm8jw8OVLepMNh3ddnE7Wdo9MqQgWzFkwf1YTlY2Cd9xeoHVF3F385SwVI60ZIsPICLwyu9coCEo0wptHHZglkOgv2VUYJs6TOrkEeIoYDzorFCJnFMfBtdj/vkQJ336kfzLGo5+l9g1LDhQR6NY/pnKJ+EgRhqQ0kU/u6TAG+GNBH079B5Q/4GRy8ooAM3EYEksWp2SFInPW0mQVbXdExLmbEu2MtUvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by MN2PR11MB4613.namprd11.prod.outlook.com (2603:10b6:208:26d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 12:24:47 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 12:24:47 +0000
Message-ID: <a0bb30d0-2b07-453d-ba33-8d2d35acc343@intel.com>
Date: Mon, 4 May 2026 14:24:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_flr: Restore xe_vfio_pci
 module state
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>
References: <20260504121609.2819906-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260504121609.2819906-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0184.eurprd09.prod.outlook.com
 (2603:10a6:800:120::38) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|MN2PR11MB4613:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ad1480-d348-4415-3073-08dea9d8217f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: e5wI6SlVQzqqLH3Vso+CwxjpFLjSq/Gv5ilmDYzHDyW+9qIDs28K8jG6AvE5ZaPRX4fLV6snyGRQq58gzgw4B7AdMEJ7xve2JcLJjRC/6+4mCPRe5N70xmlDLonL2gbGa8+WRoQmaPRP9jzfuARWvDa85wQTN6SvHEALoYCcX6waQnp0jotk/2PhKaIt1XGVankNVAbl2L38w0INhlyTnt760u14PRF/jKhnC+2+wlNn8cj7fnwAWGqyrBgh7f7tRJCvnBqRjuPUz+LJRjAa3AG9OKiAmKbJepcSHDP5fhaNgZ/xIuYGlkt5W0+rBtFCjC+KRsHXxuPWvmtPoRE6Dsx1+C3ETbpomTMMykFUUNubcNubUnQoNPtdILjsWWM/6yBj9836S4GWayxcK7JlZg0bGLDIZ15E0aicMotrC6Tj7AyLy1ptmlQauDcN2C72LNmNgDjKMBrLqAregGC2hwlH9ULWkOb9JE9Qe46/xRGV3m6ONMvdsiIzw80phviODk28vZXllqk/oT5sLTTPfjFr71TU6SOzWOUpDImawgBwp4/GQ7szgP2t8Y0snh2avWT/4hgV6QsyszJwAWnDPOTBj7BMJRV2xfJ/ZXTdv8AMEIgnsCB9SRlgM5n41Sokzj0e7DOOvXCOc62geLZs1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UisrakpuWmx2a2k2b3Vhckl0dkRjS3F5eFpRNEgwb3BoeFdscTl3Q0JGTjRC?=
 =?utf-8?B?djZxTXdvWk1mTzUxemxTYzgvQXYwalRjZWNndUUrdE10eHN4c2xBSDdneG5a?=
 =?utf-8?B?UHhwdUZhS05tdUZRaHNta051djZLQWM4UkRwUUZvckhZMHFVNW5heTBtMld3?=
 =?utf-8?B?dlF5cHRSTHQ2eFI5dk01aUZ1WXRSNDJQSnJob0x1NmwyWERreVdUelFBUVI3?=
 =?utf-8?B?RGN2REJLNEgvMXhMMTZLbnM0R0RGM280RmdCSjU0RldwMHBmYkpTQ0ZXMUpx?=
 =?utf-8?B?ek5ObnRiMHQvNkRsSTJtdEx0L0RIS3ZWWVdZbEEwYTVrQVVWaXo2c0tMT3Bt?=
 =?utf-8?B?WkVydW9Kb0ROQytWRG9CNE1DazJENzBvMFYxcFdMV2hmS3BFUmx1YmMwYXN2?=
 =?utf-8?B?dXZaVCtxWWg2Y05jZURER3FJVEs1RW82QklOTGVTaHpSQ2ttaXRqNkVoSmQ3?=
 =?utf-8?B?TzJUdHN2QXV2blpqTUc5RWpxQm4ydERmcXJlcWhQazB2bkVIOFRvaWhJNlAx?=
 =?utf-8?B?QzFHVm9tMmhVcUNPaGdpdEtadDhYMFJyUnpqYkNqY3FJaXdjdUJBbGVBd3hW?=
 =?utf-8?B?K2pGSWNvZkl0MFZld3UzM2JQaDIzTVY2WkE4WTNrMk5mWndWR0JxMU4yZW9U?=
 =?utf-8?B?UVA3Mm05azlkdTZRS0g2RkdONGxYM3U3U3laVnJoMHpOcE45Q3kwQ1dNWDZ4?=
 =?utf-8?B?SVZCcUJyL3lGTm45dmJHNWErcmdYanBRak9vSitkS2xwZ2xPS0c4NzJyejFj?=
 =?utf-8?B?UThXZUZ2Qzd3Und0TXR0b3VUV2hyU3RQS2FNQjJCcWVQMUtob2xMUFIwNXQr?=
 =?utf-8?B?UW5HcnBDUFpXc3RRUXFLSzlQRXhmTmJsN2pqb0VFYWlrYzJSenN1ankyd2Iz?=
 =?utf-8?B?YkwwYkxnYkF0dTR0VmQyZ3c3TUlHVTluU0NEVzZXblBvSWY4cXFacnpJeFpq?=
 =?utf-8?B?U3lBQTZlcnV4cGsxcjJ4aktleDcxK1hwQlZvVVZtTUdyV2ZZNHRlcHZnK2c2?=
 =?utf-8?B?WkFRajdHc1ZxenFRMGs3bEtMalRFNEh6MUFkeWlZdXZKeGNaVVNhbHViTEJF?=
 =?utf-8?B?b0dQQ1E2NHBDTnV1WUExOGRYNlZ5OTV6eDAzZEYrRUdScVYxVGk5c1RhVzd2?=
 =?utf-8?B?dHBUZlVjVFU2eFRqQ0tIR0hxc1JuNk8rR2hMTGYvaVpyUVZzTTd1T3d3YlJ0?=
 =?utf-8?B?S2dybnRON3dCaG9kRStKS3ppcFZvdmUzVk5PdmZzMzcxM2pub3JIQ1RlVXVp?=
 =?utf-8?B?NEJPK2duS01NNDBWcmFuZjJNb1FzWU9nQ2Z1MFFTZjJ1MTBuc0NOREFhclFR?=
 =?utf-8?B?UHNJcDZlZDNraW81MmgvUStPbG1BdnhKcDhLMGlzN25EbEFzL1oyZnZVVk9k?=
 =?utf-8?B?LzYrQ0ZjWSsyV2E3aFJqaTBteUpZZWRQUnFuOVNDcmZtUm0wNGdiZnQzZ0NJ?=
 =?utf-8?B?K2VlMGpHVnRBazZteGh2UXJEWjF3T1RZMW9KcVl3b3hYMlgwY3YrUEI2MU5y?=
 =?utf-8?B?SkQwTlBGS3ZlSHU5dmVMWU5wZnExWVhIUnJzQ0FYdkoyYjExZFY0cHpqc3Q0?=
 =?utf-8?B?UlM2bGZLZHlNQ0NZTytXanZuNXdQWXNGUm1XMDFIWjFZYVdHU2t0bDJ0dElP?=
 =?utf-8?B?Q3I2MWVWZ3VzU1ZZVDdTVFQxbDJXL2Z6OFRNVlBwRElCVUk0enlYWkpFSzJy?=
 =?utf-8?B?bVJtMGhEQVZzN3RqdXQ3Z2NxcGJwbU4zL2dzMXBZTlduWm9uSGpQVHY1aTgx?=
 =?utf-8?B?YXg4RzhZQnFUMkZhdktFNnRXTlVDVEovRWZvSUhrakxNL1cyaFo1MnhnUjF2?=
 =?utf-8?B?NS9PaWlzTS9oalBtZitrNHpwYkFzeU8vcExCUit5TVkyQXgxeTlPV2VDTnVP?=
 =?utf-8?B?L1VPVTVlNFRWNjlYZHhLZXBSODZsTG5qOHhiZUVnWFRjU2dwamdSZ0tzRWo2?=
 =?utf-8?B?OU93QmFielNOM25Kd3liZGg3ajlKWDlWdHVMVEx6YS9iMXR5Z3I4V1NaNVJi?=
 =?utf-8?B?c0tBZGgrbmlCcVdWQkk2K2ducUgvM2ZkSXQ5V3BDanlwR0FJcWJmLzZ1OU1T?=
 =?utf-8?B?STZndW1kOXEwaFN0cmdKbEp1aDNnT2RwYWlMbkVuMW44RGhYQzdNTXFZMzNI?=
 =?utf-8?B?eWpTUlJqMzdTYTBPUlB6dGlKNW8rdGNtVVhwc01EMW9BUGE5eVdXSUtCRkRO?=
 =?utf-8?B?NS85STdJNkFqZ05qUkNzNGpKTHNlVjdPRlQ2OEVLM2tkclZHc0Vlb0JEd2s4?=
 =?utf-8?B?SjVLVFRySFJ3Tk5ZNGJIVDkrd2lMQ1k3Q1Y1UUM3NDFRaTdOQml1OVM2UDZh?=
 =?utf-8?B?cmgwMitQUEVvUVFFNlpWeG9iS1BnZHNBN2ErVEp2WEg2VWhkejlMZz09?=
X-Exchange-RoutingPolicyChecked: GPbXhNzAa6dftqE2F0kbWAFtGMtJKeYZMNuBGmR4/bNWEvWZ7RI97O+go2duqGRNJt1c+rXrJe5OalSIMBVAPETqfUYFf4sSYCI75tFn28ClglnXUMyzkubnalcexpgDXdczJmMgCoXOmycvVw1Fr54jALt3rIPay8nw3JPU0j+EVQbNeOJUgPQz0VrRsgcKVSF71fZZZ8nqb9Tq4U4IdhBOtWtFscrb6smBaafR4KgUQ7WM2s15TkcQyKEGCtyIz6Jo5Uy/kHxVQL7oDFRqILuAvC1zTZqnx+nayA2LVALoNM0MCbsM/RiYmjoIlJAAsVsTjHsfkhvqoUvLaQz1FQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ad1480-d348-4415-3073-08dea9d8217f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 12:24:47.5396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThBMm8njxb85BZh5u0ZzkhMBx90s9ejHw7VhBhblMZKRJnBlxd2TY6nTgbs3zp2RdzN/gszLUYuxGTMWEkjZDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4613
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


On 5/4/2026 14:16, Marcin Bernatowicz wrote:
> Record the initial xe_vfio_pci module state in the test fixture
> and restore it during cleanup.
> This ensures xe_sriov_flr leaves xe_vfio_pci loaded or unloaded exactly
> as it was before test execution.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7699
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel/xe_sriov_flr.c | 30 ++++++++++++++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index be949fe01..861e647e4 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -65,12 +65,14 @@ IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
>   static const char STOP_REASON_ABORT[] = "ABORT";
>   static const char STOP_REASON_FAIL[]  = "FAIL";
>   static const char STOP_REASON_SKIP[]  = "SKIP";
> +static const char XE_VFIO_PCI_MODULE[] = "xe_vfio_pci";
>   
>   #define DRIVER_OVERRIDE_TIMEOUT_MS 200
>   
>   static int g_wait_flr_ms = 200;
>   static bool g_use_xe_vfio_pci = true;
>   static bool g_extended_scope;
> +static bool g_xe_vfio_loaded_initially;
>   
>   static struct g_mmio {
>   	struct xe_mmio *mmio;
> @@ -332,6 +334,28 @@ static void vf_unbind_driver_override(int pf_fd, unsigned int vf_id)
>   	free(slot);
>   }
>   
> +static void restore_xe_vfio_module(void)
> +{
> +	bool loaded = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
> +	int ret;
> +
> +	if (loaded == g_xe_vfio_loaded_initially)
> +		return;
> +
> +	ret = g_xe_vfio_loaded_initially ?
> +		igt_kmod_load(XE_VFIO_PCI_MODULE, NULL) :
> +		igt_kmod_unload(XE_VFIO_PCI_MODULE);
> +	igt_abort_on_f(ret,
> +		       "Failed to %s %s during cleanup\n",
> +		       g_xe_vfio_loaded_initially ? "load" : "unload",
> +		       XE_VFIO_PCI_MODULE);
> +
> +	loaded = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
> +	igt_abort_on_f(loaded != g_xe_vfio_loaded_initially,
> +		       "%s should be %s after cleanup\n",
> +		       XE_VFIO_PCI_MODULE,
> +		       g_xe_vfio_loaded_initially ? "loaded" : "unloaded");
> +}
>   /**
>    * flr_exec_strategy - Function pointer for FLR execution strategy
>    * @pf_fd: File descriptor for the Physical Function (PF).
> @@ -395,7 +419,7 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
>   
>   	xe_vfio_loaded = false;
>   	if (g_use_xe_vfio_pci)
> -		xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
> +		xe_vfio_loaded = igt_kmod_load(XE_VFIO_PCI_MODULE, NULL) >= 0;
>   	if (xe_vfio_loaded) {
>   		vf_bound = calloc(num_vfs + 1, sizeof(*vf_bound));
>   		igt_assert(vf_bound);
> @@ -1030,7 +1054,7 @@ static void reset_only_subcheck_init(struct subcheck_data *data)
>   		return;
>   	}
>   
> -	if (!igt_kmod_is_loaded("xe_vfio_pci"))
> +	if (!igt_kmod_is_loaded(XE_VFIO_PCI_MODULE))
>   		set_skip_reason(data, "xe_vfio_pci is not loaded\n");
>   }
>   
> @@ -1205,6 +1229,7 @@ int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
>   		igt_require(igt_sriov_is_pf(pf_fd));
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +		g_xe_vfio_loaded_initially = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
>   	}
>   
>   	igt_describe("Initiate FLR without any additional state checks.");
> @@ -1254,6 +1279,7 @@ int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
>   			    igt_sriov_disable_driver_autoprobe(pf_fd);
>   		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
>   			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		restore_xe_vfio_module();
>   		close(pf_fd);
>   	}
>   }
