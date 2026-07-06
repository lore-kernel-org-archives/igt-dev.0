Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8619CC43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 08:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B5810E25B;
	Mon,  6 Jul 2026 08:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+4poZPF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6495810E25B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 08:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783327093; x=1814863093;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=59QvdxsJFRIMZwahwgff3M/BFy8E93RYZpd66K15V2o=;
 b=g+4poZPFKZfaPR4FuwOvA+jp5xh82kIkfRyZ+dpOjiYtbdEVfdmw4p8M
 eUY84sXOjlR8mH7OlM+SeJH3RsOaq/GZWph8cg0Z2c9T5SPBYcSMY/7C1
 /pttkFTDjF4gUu/JFm/JnvGEuoelvuQ2h9fUVFAhFuNbSXMpRLh0cyO+l
 7DVXa+0gOnehyoYxRz6CXfjEiaKsq1TFAJMjh/+9dMrYg4X5/Q0PqmNEX
 yAyUL98DOEOKZzfL4l6XAnzG6e2I4VPmvNgsWtHcDe7xzEHxEZOYZmCQf
 2asOghGYS6Li2y8/aIbonDMt9IXJKVjWZTZdr9895eKoMULxp5gzoLpJC g==;
X-CSE-ConnectionGUID: ppWadtbUSwa32UOMRD47Zg==
X-CSE-MsgGUID: L3ha0X7mTpWJvTQFeFZ8Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94557560"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="94557560"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 01:38:13 -0700
X-CSE-ConnectionGUID: U/YoJ2Y7S/mRawXH3kFrgA==
X-CSE-MsgGUID: hoYfB2o1QRSWvsFhXGDUEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="257242439"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 01:38:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 01:38:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 01:38:12 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 01:38:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCDJJO6AhIZeX7jffIbIEzstu63Uy0oRVGTNoLPoqLd7FFF90G6rlfSOdX7/Z9Z/oSp5CfHsIjoSK3H9Veh75r7zba95Ds2HtDZsJC72H+EI8S//jpk+PLPRCqXdvOrYooh+fi4Us1PB98VtpZRJOHLlhF080ai2RAsgLQbfATWvr/J0/moiXSXPnDMZkHUklsiPtV22Masy88A06BngtkccuOjqjg7hjm37VGl3/BpBx5L9gqqk+dTvAbPMd2f06UkoQ0Z9d74/+SVI9oCRDUe2fMX1EaJaXN4uRHr2puZWQN2YmK19CTX43AtF73yXJXQ4GN+ufttumd5IZyEceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8OQqvrNQpQ8lnJGiP6UB9WUxCI0+qof/8XfFSDRB1I=;
 b=JxYBKiQIjzg+bM5u5ycZvi21SMCtm1o2Aw/PT43vZlmvvmBkBs+CwOb9ZShueWTqF+qRDMPBGMtsqg+WgzPDzp0KxDssJFYlNWmjPj+mdVvsQuav8r9Yl/g6XR8jFRAok26vmIV1qfQWu+PFGkttPO5hHU6M5cZinnwHi5g339gaUdrzK1Olp52x9K/xCDS1iOaRbHBKWZEEz7Tep5mCpsncTpvHBCnSybfYuwgUmLhYslILL5uCh+CJs8lBz2HNjt/JLiQqsgq9VecwVdwh0zNaHgOJTqqSl4ZnG7ULz/nq7YtHZSzwXAfx85fVLWrI5Wve9W/Smh2Kca4qmAH6eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH8PR11MB6731.namprd11.prod.outlook.com (2603:10b6:510:1c7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 08:38:08 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 08:38:08 +0000
Date: Mon, 6 Jul 2026 08:37:59 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 00/31] tools: remove unnecessary shared library
Message-ID: <rr6lkrcttkkhluky5qmtdelho2ze3gaqz6ipadgij7ekydowgt@dbqquv42dzng>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <szepo6g5enossqmt2b7piszdj4xjgfwqyyu7h3mxgrdkbssvrw@ryu72tf2idtt>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <szepo6g5enossqmt2b7piszdj4xjgfwqyyu7h3mxgrdkbssvrw@ryu72tf2idtt>
X-ClientProxiedBy: DU2PR04CA0305.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::10) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH8PR11MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abfeaed-b5d1-4040-a8e3-08dedb39e7f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WMo/J73a/qxqXW3bgyEf2CbIJGonmZtUndSBgcBFPAtt+OzqcOs8RJkYZMsYa4Ex9SEX/LRebImS0uUFLk+uEMJ7YXEbdfUeP6rAeyPtRxHbQKJKa9sy8sF4GNgiK9224V+VfJEYh1gSEN0uXueLg9fPgBvNBpiW6VqWGiK96/uqor2+w5ODCslcz5IfdBoJs0ccfvdWXTjWNyT40tNZbygPZqto2AYePh0Pvpjz6noLQ5+dvOgk5ueA97mRz4/oxr4DCT+tVmbzDCX+fCu7s3HMA4U8+tlaF9SACND0WQyiaCTnmmTQnPdQh0VDYZdroW1HTkaL0CDrI+RWkhA5mR6hgDcy1+htlxVuqMQpju/ER92eQzycAbkdpReICldpcI2pYq64jAg+7cLc4qqjDIvlJM+bnnf1hCdL29x7bFR8AxX8IXvElGwkDWq7pvfx9QA9R6jwIokYHMhvz+ISvKC4ql8nqb5TlKwKZIbvrFmRtReM/GDaQK6yh5FBtpHHTGgFlZzckP/BcibeisfSqNhhYUTh4L9i6gXftd3dTFNjRfAS6GIbJrqHrmD+TtwSCmUJdS3luN0j36eRpdBLhDSjeSlWW1zytL7lgwCSSA6zluvRVNq83CPkA1VCEOsZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDlxL01ZaWJqd3BsVnBoNnBIYW41OFRjRkFPckJuYmk2S2pyR0FCMWZ1SlpB?=
 =?utf-8?B?c3VxZ2NUWGpJb2VkWTlpbnE1QkpjYjFUQUlFSHI4N2duai9FV1hjdEhXMnph?=
 =?utf-8?B?OEZVZWQ1V2hCSnYyRXIrQ2FRL3VBWGxCU05MQm1zV05OVDlWQTRvTTNodVlE?=
 =?utf-8?B?dmlOVmtuVDNlb1pKbWpJM2RTSEd0OE9aczFIQmNXc3NYelhuN0xudTliejk1?=
 =?utf-8?B?RnBudWNtcFB2TXhpNlVKcHRTbFRHZ3UzejZoUUptK3ZyYm1Ed2FJampGWHJ5?=
 =?utf-8?B?V093elFXQ0xiYkMzS3hacjdyNnhRSzNCNHFiU252VjcvZWE1ejh2R0NRTkxl?=
 =?utf-8?B?VkwwbFYwd2Z0YzVKaXNJUjl1SjF1U2N6NGdCcisvR0xqZ2FRVWNRS25sU1dL?=
 =?utf-8?B?eHFaWFVwak94QmZHMlRoRUhHTHFsbkppdm00L1QrYWU4Y3dXelZwTGhyT3p3?=
 =?utf-8?B?Tlk3SHh3VWdlNklTeTZiOEN6eWhBaEtmOERraEZJQUpIcSsvS3JCd0JpeGts?=
 =?utf-8?B?NHMyM0hOVWVqTjNkUHl4Um4wMlRIME5EUjZqaVRhMjdvcEZ4YURmSlQwamVl?=
 =?utf-8?B?bVZLb2RNUjBsVmo0K0s5dmRXR3ZMa0xaTXhBS1dGZkNxTDF5ZnZRbGw4cHM1?=
 =?utf-8?B?TUVZVDdjSUt2QU13NVlJZU1FYStGYjI0MzZRSEJUTkZZV3BJaldFdlJ4Q0ti?=
 =?utf-8?B?Umx5L0htMktzakdzRFI0MWwvV1o5ZTlnYmpTdHc3TWFFdWxZVzU1S3RMZlNo?=
 =?utf-8?B?SEpiYWVYNjNSQjFCZXl1R3loRFNjS0JjU24zUCs5Mk4ycEdid0swUGZvMXV6?=
 =?utf-8?B?UnROejluaHRzdGZCa1JmdWtLODRqMVFGSis1Q1NFT3QyOVR6MURtc2FReFRW?=
 =?utf-8?B?Sm5ZMzBhc0VmWDZjSGIraDFORG5lU3NTQVF1eVlPYTlIaDRFNjRKNnZzTW1m?=
 =?utf-8?B?VGgyM0NUUFFVMDNCUElhbXpCdHhrb3pmVER2REI0WmpsWTNvMEs4TGdmK3Qr?=
 =?utf-8?B?c3FtNTJpZkgzUkV6eFZBbVpoZFV6cWRaOVBoSjF5MXJVbXRKRnBnMGxPZEhz?=
 =?utf-8?B?emkxc2ZNSE93ZDdEQlMrcDd0KzNnSlZVVVJ4WmxMeVhWRXp0UDFoNktHOVl2?=
 =?utf-8?B?QmVOaDFNYkRaZ05JL2NSTjl3S1MrUGJqaU5Oblk1Mk5UVmpDMVppVzB2Z2E3?=
 =?utf-8?B?T00vbmp4TERKSnBEeFVFVFZXUHd4VVdDejc5cTZpcGFlT0tEOXcrNlZvRVpM?=
 =?utf-8?B?SnZTcEY1UXYyMG9MNHNYRDhkZDIxU2tBaFlMMmhodE5RMHN5WDZ6c2VwNko5?=
 =?utf-8?B?b1BodzkrY0tVaExZY3lFd3JtVGgvSlVoSVN3eEFjZ1JuMVlhckRXYzE1em9B?=
 =?utf-8?B?ei84QWh1cHJPMlNXbVp4enk2TmlqZjRIMTJ5NFcrV081V2N1eEdsOTFsdEw3?=
 =?utf-8?B?R2hZTkNjRk5uYmZzcUFIVncvZm1zWmxCYytKUE45UU9mZmI2YURlcDZjYzI5?=
 =?utf-8?B?SDl6Umh4TXh3SVVhTVEzYysrcy9Sb2R6Y1BYcm9nT1FZOXF4WnozNnU4cklH?=
 =?utf-8?B?bG1pQnBhUEhaL1RIbXFzWWRLbEwrdFB0Wjd1K2NuZVhqcTFUMlMvWEg5TXVQ?=
 =?utf-8?B?LzBuakx5UnVXa0tiVHJkUnVVNU9EbjNnOVdSWExGdmNaZ2FvaTRNcWFPaWxl?=
 =?utf-8?B?dVh2U3kwNHNtdTR5YWxNWWJjdXRoWDNDNEI0UldEYU1GVndNdktZbHRIODF0?=
 =?utf-8?B?NXUvdWN5bURZR0luak5haXpnYjV0WnFyUXpuWU85SjdRQUJLcU1IS2kyd1BM?=
 =?utf-8?B?S3pNYzd3RTlWVmFOblhsYXdmMFBBWWNGZlI2QytNYTUzTlhmSXBLZnl3cnp2?=
 =?utf-8?B?TlBmU0dXbVUwT0JGdGszTS94V1VoaENmbFhVZU9xTFhuNjdIaG55OUdDbjhh?=
 =?utf-8?B?aE90UmhyNzQyS042VDQvc2pUdTI1NzJhdEpFVjMyQ0NyM1NJblpuTjlCdUdZ?=
 =?utf-8?B?SjR3YmxJTUhUdU1KRW00RnFUV1B0WUc2RUJjemlwT0NzOU1RdlZwbXUxYkhC?=
 =?utf-8?B?MStFeTc1NGlweGx4ckhzLzBVM01vM240ODNscUtqQ3ZybVI0SkVONWlGQ01z?=
 =?utf-8?B?ODJ0aFkwaWR5WGc5cThJY1B6VWdSZ3RTQUZIYTZHM0RmMSttQnREWlZoRmVQ?=
 =?utf-8?B?VnJwVEFXQzBnMmdXakZ5Sm50azVwbjN0czJ0cFpCSVBvekRxTnVrZVZDL0d1?=
 =?utf-8?B?V0lwNUVHa1BaZEw2K3VxN0VqbEZabkU4VXhEY0V1dVhDSUVYbkVJM0tybjRM?=
 =?utf-8?B?bnlmRm0xa2Y3ZGdYN2NhaElRTHVTNWJkN2NKVXFKQUVsTjdCaitSUTIwdEhF?=
 =?utf-8?Q?VAmGNcPmTUGRlzIY=3D?=
X-Exchange-RoutingPolicyChecked: rQzomOnXOMANlJ8r8qgny1YLvJ4RexxFM8Le0rXR9vhSCq2jS4GjX6G1z57Qmb8Pj29Ke1N7dH7e8BFpj2TEiZJyeoEMew7jD/3sMFFxDcrZDs24KnJqDQQ+oAwC67gqpPDt2/nPOAjBBCcvcdk0Fs7iK6dZBQ5/p92ZGGVXFVFb0aTnraAhV4tik+rX+VafIfzKGxmEs260G6NPasELBNDIPh2Oc6zYyGNTamqZ7Z6x4EY9hTcShCgGf0nfPzV60jsHwQVQm7xL0rjWRawXchBjIUJKxuSgbZ5joCoN94bzNrSr8CCGqqYCnxulsVgptv7eZJEKZjrCEei1BgAEmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abfeaed-b5d1-4040-a8e3-08dedb39e7f3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 08:38:08.5352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Z4bN/hgrcio2biXYKDtlxzdm4ELwE0JlduUihSYbs3uLfB8F6BoBCi53UVdoLxhMtzgkgzTCbLZ5k0fUtsrw4qM6jbjmIfCW+bnwZr5FZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6731
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

Hi,

On 2026-07-03 at 22:55:15 +0200, Krzysztof Niemiec wrote:
> Hi Sebastian,
> 
> On 2026-07-03 at 16:28:34 GMT, Sebastian Brzezinka wrote:
> > This issue was raised by the community back in 2019: 
> > https://bugs.freedesktop.org/show_bug.cgi?id=110249
> > 
> > Standalone tools linked libigt.so as a side effect, pulling in cairo,
> > pixman and libX11 even without framebuffer use.
> > 
> > Following intel_gpu_top's approach, each tool now links only the static
> > sub-libraries it needs. Five new ones are introduced:
> > 
> > lib_igt_tools_stub, lib_igt_drm_stub, lib_igt_halffloat,
> > lib_i915_decode, lib_igt_reg_tools.
> > 
> > igt_load_igtrc() is moved to igt_device_scan.c so lsgpu can use
> > lib_igt_device_scan without pulling in libigt.so.
> > 
> > All 20 tools: 35 shared libs -> 3-8.
> > 
> > Behavioural differences vs original binaries (no-hardware runs):
> > 
> > intel_backlight, intel_lid, intel_gpu_time, intel_audio_dump,
> > intel_infoframes, intel_panel_fitter, intel_firmware_decode:
> > assertion failure format: IGT CRITICAL block -> single-line message;
> > exit code: 98 (IGT_EXIT_FAILURE) -> 1.
> > 
> > intel_gtt, intel_display_poller, intel_watermark:
> > same as above; additionally print an extra "Test requirement passed:
> > pci_dev" line on stderr (previously suppressed by IGT log layer).
> > 
> > intel_guc_logger:
> > same exit code change (98->1); --help drops IGT framework options
> > (--list-subtests, --run-subtest, --device, etc.) which had no effect
> > on guc_logger since it opens debugfs directly, not via IGT device
> > selection; --version, --debug, --hook also removed.
> > Unknown option exit code: 79 (IGT_EXIT_INVALID) -> 1.
> > 
> > intel_gvtg_test:
> > skip message: IGT skip block -> single-line; exit code unchanged (77).
> > 
> 
> I'm halfway through reading your series, and I can't help but think that
> this series is only remedying the real problem of building almost
> everything in the lib/ folder as one big shared library. We're putting
> literally everything in libigt.so, even though at the source level
> everything is split nicely into .c and .h files. Correct me if I'm
> understanding the build system wrong but it looks like we're already
> even building static libraries for all the little files in lib/, and
> linking them into libigt.so at the end.
+1

> 
> I guess at this point this is a matter of a tradeoff, because all tests
> depend on libigt.so; after splitting its contents into smaller shared
> objects it would be almost a herculean task to isolate the correct
> dependencies in all the tests. If it was done from the start it would be
> very much feasible, because tests and its build files would be written
> with that in mind, but you know, benefit of hindsight.
> 
> And then if the core libs would have been split more properly, this
> series wouldn't be really needed - the tools would just include and link
> what they need.
> 
> So this series is solving the problem very pragmatically in my opinion,
> to my mind it should absolutely go in. However, I think we should assess
> whether it's worth leaving at least a "TODO: modularize libigt.so"
> somewhere, so it could be addressed at some point in the future.
It might be worth figuring out why we are where we are. Was
"build everything into a library and suff as much into it as
possible" a conscious decision or a design oversight?

I imagine this might have never came up as a point before, so it
would be worth checking with the maintainers.

-- 
Best Regards,
Krzysztof
