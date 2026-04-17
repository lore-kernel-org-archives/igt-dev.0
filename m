Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0566F8E4A1
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 03:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876F810E283;
	Fri, 17 Apr 2026 03:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmS8331E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575D410E285
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 03:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776396379; x=1807932379;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ztzBLqcC6cTOgbScRnUT28JM0Zy9hGQSVBX56G6HNgM=;
 b=UmS8331EpXhBmk4hzxLdMC1f07aC83fk9b0KUmpxcwkcmZMum7EpDouk
 6JNPFvuDsjnAiR/3jOsJOO0E+ZJE0bpXVfuOzqwBTpm+43/tO/TPcveAn
 WoBSDEEolsv2mLRQNsl3JcgmMuRvjoAuluTG7X9Zqje4Cu/bJ8YgJY4NQ
 9ceZH+cgs1T3aTJ6+2EnnJeU2FZHax7neNTntVayPbxuIssEU0Y8wJ4sl
 H+aNVZsGWjEvb/Yyf1KxDUi9jIEdjveqGoMt8t8N6yI1VLA5i0+b8Ogq9
 czrNUc/CN1y1MT+b2ERnbwXpj09v3XHxZ51+DGQvj9RH+9kNXNz7hrHAv w==;
X-CSE-ConnectionGUID: RVSvCm6gRHKAGlAbOo+R1g==
X-CSE-MsgGUID: XPoImsGqToG6WxHrvME5Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88109447"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88109447"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 20:26:19 -0700
X-CSE-ConnectionGUID: NJK6cco7SpChT0SmgJ+Sww==
X-CSE-MsgGUID: QB1kqtx/STKIYF2hcu3+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="254390629"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 20:26:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 20:26:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 20:26:18 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 20:26:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0TXCnHdyx2kVuaZjoK8BpMzVnPx6X5ph46rGZ7j3hfFXwud0QjtsymTqPtzFkBTIycNM4qDaTKEfu6KF5uCXfvV30Ny8aHqaGTJUhBsSxRldThqHyAiKVAm2qItnyNRpGL4aoiAGx/3kBx0GtKYv+1sqTU+zhPkO74hPF/eDSolPTHRDeForDUm2QEQfLpDEGZO/P+Pi0/kvFcoKDy8I5ErwUqRdAEO1lilwCF4RvvrKSgqJLGmzaO6aSjjIMYasetnhqqHuj/ki1IfmCt0pFqPPhinfiavSBUEgyxEoh4jWAx0ClR5/4XfpC+Yn4xGlgQBo7YhSgLl8Eu2dQh41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EovK4dYgamMYviE4Ha3hN626FFocNuoYb1kpUoejsO8=;
 b=QboHFarg+uJSAHl+jtWbRaCIqNPB7m+vdWaMtbgfNwUUgC5apy0UUoa7YUfjb02F+9f/NxfevNQswcfOQdNW2LWK6ew4+QUYSYjN9GNjQuA2tHIpmlYzi9mowp6MAoltR6+4HonxDmumtPsbRWDjmCFevYARFjyijPZRAIV5Da+ODkHzh4RnhwrTK3dGe0ThAlDs+5waI4XnSXhPKNSMvOCgW43PJOU3vzN9T1wX7eg5HqMDPEShr1GygCpOdokYJ1RWDKx62aL2UHJImUEvW+P4/fwZXs5g7JSilHNpmvkcdwK9DVesui12LLg8fnSaPMgGjPPrLgzStHYM2InK9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 03:26:10 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 03:26:10 +0000
Message-ID: <f573fb65-c254-4e74-8d51-bf4010521dab@intel.com>
Date: Fri, 17 Apr 2026 08:56:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/amdgpu/amd_plane: Remove unused parameters from
 test_plane()
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <aurabindo.pillai@amd.com>
References: <20260417002116.94208-1-alex.hung@amd.com>
 <20260417002116.94208-2-alex.hung@amd.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260417002116.94208-2-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::16) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|BL3PR11MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: e31b780f-cadd-4bbf-739b-08de9c31106b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 4FNCZGFyyzGniJuw+tURwXfY0w+HmWJ38YcxnHkPLMhjGh5GZ4B6y4oglEDzxLvu9Ay1XHssKVaapFn79iYmAQj4PIZP+wIhhtNa9Wmn4xepcz4nb9H0DkWbx/GqXNfyIO1zdORAHXrrgbkFL4FobNtzICUix4VhoQWUXSFzwVtT2q5cutlny0Yk9mtrOeR61wTvxsQHw3hZw3HdJAChJ+7t7hE4nMQY/nBvtPE7Jya9Vvf+ZDDGuJYyul6YdExcaC/RkFYto8mYcoAO7KlWMNnto7Be6fcPua4xl0OzWJKTAK0okXLMWIviX5DBUY5BPMCwXT3u/syq6VQ03JOHP+fu5LEdgLUI3/qI0egFyUOwx4CgSeUoPX8I1mKpYAKcfqbPyCnBzNdbM/3DXpDAgkCq4qcgqU+sCFrJz//VLN46p8FZTiQbiWa0a70I/sRdmBgk9/PVnbj5QIpQOT34TIf46Cx3TTL+IPE9ncZlb0FCQ07lxMvmuYXSjt0EM/gpFSs8U/W7zdDTkN1kMYsk9rrtPyMJ0jLZ8yQUOKiLmLxfsc/tIszYmKpHOf8PpdlxlRCsnqsYeh7zOQp7cp+ReTMV7XtIcSTYXPftx0z0nJo3Vnx+6ZXRU3CF4eAzPP/JltHWM0yxHSsNSy07UVhs0t2b4Hz6J4D3BD0/Wyqkmxffh+qnYqg2dKK0Ko29vWk/ahP32v/NNMMVpGcdmqOHAlRK+kSEE2a5bY7qEd769Ss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW84cDVnd0IyYlVZNjU2UWY1SDFaU0RXZythaDN3ODNVVlVDYWY1ZlhBeUZE?=
 =?utf-8?B?UUk3bi9vNmRtcTAzWDUzMVZlQmJPbWZhb0VPK0RtQThCOU1PRGs1K2IyeUZQ?=
 =?utf-8?B?a2JmRE5RaXc0emZ6eHQzMnlwZnJVTTdSeDJqb25mVmhjZXYyMWd2TXcwMnc1?=
 =?utf-8?B?d1FSVm03YjBOdjRjaWt1MlpDcythQ1Z3WHNhWis4SklhRHlhNDUycmFsYXRI?=
 =?utf-8?B?SDhKcGdzcHBaeEtGUXNPRk5OcFd5ZFMyeUh5cFJkNEpoTWZSMzVjZzZBck1Z?=
 =?utf-8?B?eTVZRmZJT2FHMzZBUGRhZ3dFSDJMUTdQL3AwWVhiY25wWndGOW1MaFpaV0lF?=
 =?utf-8?B?M0Q0aFA2TWNINEx3ZmJHSm1VaVF4VFh6empGZHRvWm1CcXZXMkhXNjJvM2Jn?=
 =?utf-8?B?ZVUxTUhyd2x5UUg4REMxVGN5bEpRMEJsMUo3Nkl4M1ljZ0t1dEM1WExHMFZO?=
 =?utf-8?B?Ry8wRG9oOVhGK0RxRUE2TVhFQVZWWnVHWlFKUDNuZHhSV3RzaVRZcVE2NWc3?=
 =?utf-8?B?K0FSdDhjUVVEc2ROTktoWE1xTHUyNTB5cUhOdUkwK2d6TDh1RS9BU3hFcEQv?=
 =?utf-8?B?SHl0VjI0c3NXek1MNFR0aERXelEvRzRJbHBvZG9MVXp1ZFYwWmJkd2h5Q3BN?=
 =?utf-8?B?WG5pRytvSHdUbmliTWY5U2dMREFZdFZTMVRKSWJIdU41ZDJ1VmdzazZ5M0h6?=
 =?utf-8?B?OVByV2E2M2JkK3FpbWpEbk5jZXE1VWE5TVBkT0dETEpiMGxxNmtZSkJuaWhY?=
 =?utf-8?B?MVpEY0tMajRQd0pDU3pFaUFXVjdVVVFNY0ZrR2EvMUs1NGpPREE4UlQ0a201?=
 =?utf-8?B?OXcvbDJhTzBMTFhVREhJMDlRQ2ZtYldSbE5KcG83Ni80S3lTRi9zRHZRZGRW?=
 =?utf-8?B?RUFaWTJBMC82QWNoZEc4bk1mYzcwaWJEdlBjRmhmRGh4cUtJdlpMQ3FwZ3RJ?=
 =?utf-8?B?OTU3bFpYRGpYVzhNd3ZvY0I1eVByeGVEcVl1Q1ZWSkc3Q09aenR5UUlqOEdm?=
 =?utf-8?B?Z3dNQk9taWdycXhVOHp3QU5rcjVjOG1uZWFjR0NHdGFUUnZxaFY4YUxtYXIv?=
 =?utf-8?B?WUk3RmoyWFA2alNsK25ucjlrMW03L1dkRXQ4QzI3QkdRbUM0eGVkYU94V3RK?=
 =?utf-8?B?UVptdlZJY1QwQndxanp1VG9iK1hFUmF2SVhETnJ5TEZGWTU5STBndVN6cVQ1?=
 =?utf-8?B?V3Jybmlsd3NZQ3RVY1BOamlRV3hsU3ZscEtKcXg2VGFuM08ybGNJR2ZjQVJ4?=
 =?utf-8?B?aWJjMHBUb3BuMnhCcGVvL3F4SkVscXdhVEVud1NNZDluZWR4dnpmdlhIQnM2?=
 =?utf-8?B?NnU5amhEOURuSWlNdTA3VC90RzJNS255eFhDc3AyelZMMXVpcFpCWUxUQjBw?=
 =?utf-8?B?MmFwN0ZGQytuLy9YV1NDQUdNV2NQdXZjVEhiN09nN2ljYjhiT3BqVXJKQ3Zz?=
 =?utf-8?B?NlZUSlVzZStXRUs0Znk2WHlRak9Gb3paSU1CeGtIOWlveno4djhvOElkTTls?=
 =?utf-8?B?Y1Mvd2hFaDF4TUlFeDJ0T214ck5BdUFuNkk4SGpvK2V1R2t6ZlpzUytYR1RB?=
 =?utf-8?B?NWljYVhQY3ZFR3pCV0pocHBIbWlxRGp5aWFBSE9uRHJtejgvRWJreEZMNTlu?=
 =?utf-8?B?dXp3UHJyZ2pINmhrdEcrY1VPbWVnSmpyaEdCbm5GL1NQZ2p0WjM2VEJIVlVq?=
 =?utf-8?B?dGlRRXAyWmlDV04zMGlOLzRYeGs4RXk3TTA2aXZIczFRTUxLK3dQS1BZZ0s1?=
 =?utf-8?B?WS80YTJuakU0d2puSFZUSlRVVnI4YlE4OEpIcDRyZnFhQnZ3MmI3Q3VCMEFp?=
 =?utf-8?B?ZFB2cmlOK0JxQ3NKZUROVnR5RERqMVdCTm9lWlYrdWpNZlkycXZQUGFyMnlX?=
 =?utf-8?B?TG96WWdSMmFnenFaL2NMQ0o2cDQxNm5qbXVhT0xORzVOWUZDY1pPMkhLTFJa?=
 =?utf-8?B?MzFGNHJHTWFEQy9HT1V4WVdUR0tWTE9qVFVNNms2bEoyR28zNFZJY1ErRHhL?=
 =?utf-8?B?QWVNZGtZVG80dmVvVVhzeUlvTGp1UkR1aHBoSVNVUHk2eDl4VTZGVG5yVmEy?=
 =?utf-8?B?c1M1YjFwWWVocWxreDVJeTRsK0xiSiswck50QzR3QzVtWXkyZDhZTk85Ym9o?=
 =?utf-8?B?alAwbjcvRmZDd3ZZVU5TUURLajIybTZMWkRXdFdERTVzRjBmN3RaRllWR21G?=
 =?utf-8?B?MDVYdXIyQk5mTW1JSWRvTk1mK0ZJd1U3NldhbFlnc3BlOVQ5L3NSUm5aaDha?=
 =?utf-8?B?MFVyeGRWWVhuNDZKM2dEdVJsMjZxVnNKaVc0c0pNcGlQQjZ6alMyZkR5OUJ2?=
 =?utf-8?B?dzFJcVZqVG9pOWtkaUJBM0xaM0pBT0dzamhSWURndElLUTNnRXFLUT09?=
X-Exchange-RoutingPolicyChecked: BE0H98YV7Nd899KxE5fkZWIofR1Qobagdyj5BMZ6KLA5FSbtjVdkbaHdUzjA2Uxrka4hQs7r0f36C1Hktg4zWgiQE58n9/UhAtt5+NG+ARmI4+h0sSLOCJvBLPtHGlc/wxYlLWuMXugD9EPJrReL3Z/m8fG5VtnsCBDt8wGE0e6hZwK/maqBG2v71gwWrCJuRUJdn64pLNUje2t+FLqHT/MfX6j5dwpwiH7Z6Eu9d1j04Ve4HdoNKZTgjy1WOms5cbprEz3N9ff1Zmvi4+KjwzvdpRnpMmAHlGe6xW897h5cUTpmxkuUU0ByWsXGKKIQAHrlL075mo2zIDLAPZY7QQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e31b780f-cadd-4bbf-739b-08de9c31106b
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 03:26:10.0931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsZxkFQ3EpUlw5aOdj9Ej2/Zw1TR3obu7PGAuGj/jvMMfnZTeWHcgdFdFkmuW/GdFdFUSJecFdhn+m2p9SQzzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6314
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


On 4/17/2026 5:51 AM, Alex Hung wrote:
> Remove unused w and h parameters from test_plane() in
> amd_plane. These parameters were never referenced inside
> the function body; only dw and dh are used for the cutout
> and primary plane sizing. Update all call sites accordingly.
>
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/amdgpu/amd_plane.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
> index e63d4dc2f..9a08f8e29 100644
> --- a/tests/amdgpu/amd_plane.c
> +++ b/tests/amdgpu/amd_plane.c
> @@ -378,7 +378,7 @@ static void test_multi_overlay(data_t *data, int display_count, int w, int h, st
>    * NOTE: The reason for using White+White is to speed up the crc (reuse the ref crc for all cases vs taking
>    * a ref crc per flip)
>    */
> -static void test_plane(data_t *data, int n, int x, int y, double w, double h, double dw, double dh, int pw, int ph, struct fbc *fbc){
> +static void test_plane(data_t *data, int n, int x, int y, double dw, double dh, int pw, int ph, struct fbc *fbc){
>   
>   	igt_crc_t test_crc;
>   	igt_display_t *display = &data->display;
> @@ -455,7 +455,7 @@ static void test_panning_1_display(data_t *data, int display_count, int w, int h
>   				if (pw <= w && ph <= h)
>   					break;
>   
> -				test_plane(data, n, x, y, w, h, w, h, pw, ph, fb);
> +				test_plane(data, n, x, y, w, h, pw, ph, fb);
>   
>   			}
>   		}
> @@ -494,11 +494,11 @@ static void test_scaling_planes(data_t *data, int display_count, int w, int h, s
>   			/* No need to scale an overlay that is bigger than the display */
>   			if (pw <= w*scale[i] && ph <= h*scale[i])
>   				break;
> -			test_plane(data, n, 0, 0, w, h, w*scale[i], h*scale[i], pw, ph, fb);
> +			test_plane(data, n, 0, 0, w*scale[i], h*scale[i], pw, ph, fb);
>   		}
>   
>   		/* Test Fullscreen scale*/
> -		test_plane(data, n, 0, 0, w, h, pw, ph, pw, ph, fb);
> +		test_plane(data, n, 0, 0, pw, ph, pw, ph, fb);
>   	}
>   
>   	return;
> @@ -532,9 +532,9 @@ static void test_panning_2_display(data_t *data, int w, int h, struct fbc *fbc)
>   	for (int j = 0; j < ARRAY_SIZE(y); j++){
>   		for (int i = 0; i < it; i++){
>   			if (toggle)
> -				test_plane(data, 0, pw-w, y[j], w, h, w, h, pw, ph, fbc);
> +				test_plane(data, 0, pw-w, y[j], w, h, pw, ph, fbc);
>   			else
> -				test_plane(data, 1, 0, y[j], w, h, w, h, pw2, ph2, fbc);
> +				test_plane(data, 1, 0, y[j], w, h, pw2, ph2, fbc);
>   
>   			toggle = !toggle;
>   		}
