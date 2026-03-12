Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DC1FED2FF
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 10:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2525610E1C5;
	Thu, 12 Mar 2026 10:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BW6cCKv5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8069610E1C5
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 10:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773312515; x=1804848515;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=TIV8RpULh55vf6xXjFhoNzcCGHPbhPVbx3RWw3cyPkU=;
 b=BW6cCKv57KxhMu/4AH5MpEOoLd83RCRwq37lAkkZ8t024bCGQVd+VOh6
 y63HhzliGfvB9ONiKnWa3aLllMn0OAoXA4IEBBmpawjaaoa9BMabG5Oo+
 29mayV/SghaQimgkEmZjaPsExvazAb+LrlIuQedQiyDc/jg+fDum09NOd
 dPMvYd2Z/oyX467aUAc5Zrqqf1LbwU0fAyPIbnxytJDvjmJ/E4Jh8EvUp
 Kd6zADpRwmsmhgiycB+NF6iO7Wc/jBJxNl2PB8dpQhINpvOslJ+/fRzF+
 OOglKY6o3sxaDozQ9tfghfNW9uIIqQet/VKv9mwe9zuPv4wxIJPMTr2v8 g==;
X-CSE-ConnectionGUID: 9GZP6g0gT3G7i1W6oReL+A==
X-CSE-MsgGUID: i4GEraSNSBiOPR7fMYFC0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74312723"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74312723"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 03:48:35 -0700
X-CSE-ConnectionGUID: rQusLgogSeGwZNyV2Nc8nA==
X-CSE-MsgGUID: X33XvcHXT6mPxZiHvRBXkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="219886267"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 03:48:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 03:48:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 03:48:33 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 03:48:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbpfCAeuHapU5KU8VqE99AWWAbDCazPu6zyW4kMI+Hjxyj+P9i70gYx4ctqvT9kMruqSkcPP6LqRcBN/WEJdlt/0MwEVXg+2mUFiBSWU+D3Rfmd4NK+NBUzVvyjxbLs66uZM5wIWuuf6JJKejyLgPS92BFtO/PeSnNSKYB5XBEO2TKiMoAA5Dv2i81spHPo/PguQ4ZhEfsklD7HHzsSCrnEsYXF6Sswe1zxlBN1DuKB1TRzEaf32X0RHKn0tmBg3Z5ZYUM5OCEngaebDzHkz8FQTLv5F99kY1c7iEyKcQNd1qe5oxXonhsuNFlMqMaLcUtQRdwbdBsISrK8vhE9hvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBxyvESvfXm7oyS+A16e60YN53T3g6ClbmtP8wG4b+M=;
 b=Ti2/6QjBMpD/SMaIEXL3Dy2J9aga4YvTa7Bh/ZCg+c938ElnXkNC3hjzQ6SHIHiR30CeT0RglcqiFWlSLO/ufR96qcvJVGquV27fDKBZvJWuqDixIh3thxjjPstrPHpyBcwCsj0oBPcpgYYqDhErEUw9FhnUznmdNh0AZWRhrAiMsYIektD2nVGTpvaN24PohL3cYhoROkJA3iAQspjHqf2svV9alfxiNV3FLuqqdzXEUmJS3f7gGr12wjr3DOD+qExKKoSfR3y9G+I6WrRWK17B4+6FvxBJXajDjLuveQ93vIwd6zaRhi+/7rSieag+Vmb4VT3a2sNzb14Y+keW9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS0PR11MB7383.namprd11.prod.outlook.com (2603:10b6:8:133::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 10:48:25 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 10:48:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Mar 2026 11:48:27 +0100
Message-ID: <DH0QTJJKUZUR.2H3D2ETWWH39Q@intel.com>
CC: <jeevan.b@intel.com>, <kunal1.joshi@intel.com>,
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v3 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260310091956.3171295-1-mohammed.bilal@intel.com>
 <20260310091956.3171295-3-mohammed.bilal@intel.com>
In-Reply-To: <20260310091956.3171295-3-mohammed.bilal@intel.com>
X-ClientProxiedBy: WA0P291CA0012.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::7)
 To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS0PR11MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b5de40-f35a-4c8a-2000-08de8024e31f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 3AoGlJKY5POeHEkvpyBJb3UcBIcGkzXjnUM9aC/M4K2ytP55oWJ3pCIKV1lw/2XyevOv5FCeqzd0cKVD6WJW+lyT5YYJL3j5sKd+JzIyb2NfjIXhNNe7GI+tHKQFcftzzph7W1IjZvCfGI+1CiwtONbLs9GHQB/W4DBCpZ3KDutzuRaka/7EsHGw/w7LPHBlPxARE9OpyzuzX6oPYQIaIT/NAWE1W0ksryE27MJ45fKWYI5S8aYoTpCOg4/3j4Yowr04csQBbRsvRl43JXQacjuQbYxdYYNZhORjqLPKRvdADka3rJ9h82xYNJsJOkTAFAuGchoHwD7Up37Bp03dF9dFeZiQzxMxNBUyIHeSP3LlTsqmZ5I19848xq3OKpup/lJ57wXQYP9TP6c7YToiTWC/8fUOGHq+mxSMzKdPCF5eQ2DIgEJZF7Wm4KVbSHzWj491CBK/bc6ZzsvNBqOBo3MtQckQBEv5dTYQWhbcRrzRbM+yrtRZp4/+HNMBS6o/0BWq1nRGWJhUQwj4thfesbe9eIwMKE3FfhyCnu0zcSF1btRWSy0odYBTeG25DSnbX8XOJ6ynIcHZ3HhnxungXjzj0g5EbMdFBaBreDAHoTvs4h+0y6pd9cumrCb213+g4dThyUMWJ2I1W0jCVYnfNOrBmwZftVIlKjbPV5GvdgzfRK4TNfspuvBlWhG1t5aFsW8cL0PfGhucrZ7lmJFH/62fkInSs+opaLrVCWWZfeE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHM1c1hrTy9KYnZiRzRFSzlOV0lKaHd0ai9RUzl2bDhxK09oWkZwMzdRR1RU?=
 =?utf-8?B?U28rbGZnUWRxL0hhWktsZ3FMdnRzc2ZsSFJBSCtheTd3bUNOSVArOHMvd0Q3?=
 =?utf-8?B?eVJiMnhBNVlZenJsM21PRWUyNThFMUNmNHU2djE2Rko2WVl0d2RodVdNZyta?=
 =?utf-8?B?UVc0TzhLRmg5VzUyM3RhZ1BWd2FFOVdvQ1V3dEd3ZjA5aTZONEJ1RERGeGlT?=
 =?utf-8?B?SFZOaFpxak5NTTg0SytlNm5nZkMrVSszVEczRDBaczFyVDFRb3JHN2lGNktL?=
 =?utf-8?B?TWJzZS9ZUHduWWtyRWMrNVdGVmhQRmNKcTZqNjZadlErRzUrN3hRanVrZnl6?=
 =?utf-8?B?TjBrb0lFbndXSFhIc2dxbWhoUkhGWlJtbGFxMWpLU0RzcTNzb21qMTlYRmVV?=
 =?utf-8?B?QzJHK3FEZFV1NHpod0V5Y2JGK1VGdk5SaGFuNy85OHBOZjNkZnFiVUp4akM3?=
 =?utf-8?B?WnJWdlF1ZTVUMitqNEdnN1FSeG9GYS8vYXhEcVg3Nmd3c256cnp0cTAzZk4v?=
 =?utf-8?B?QUtKeUE3MkZheTh1c3RNNHJOS1Vla0lGTVZzNjBqVVMzVkVXR2FORGFqQVh5?=
 =?utf-8?B?ZEp0NEVCdVU0ZTRNcHgxWEZoL0g0Q3l5aUVHUW5rQ1JRUHFsTXYzNDVwRTIy?=
 =?utf-8?B?U1ZwR0hzT0daRWh6cDZ1MmFyZEpPQmc3c1NmMXMxTzExanc4NE1mVHZDUGIz?=
 =?utf-8?B?WFRqNTkxWVBmZldscnM0WHlvYXNmS1U0RGdNYUNQTTh5N2hlRjRjc2UyeURB?=
 =?utf-8?B?dkMxVlowUEJzUG5kRnFjTFhPdGRzRkEzMUlaM1BpM29JNUxpRUhlclVtS2dq?=
 =?utf-8?B?cEFPdWVQeDBmZ2NNQzJtR0RRZlNSRVUzeHpPYTRkSnB5Z3ZZVlA1Y3UraXVu?=
 =?utf-8?B?WFp1Y0ZjUGVvNlpGUlZsN1ZNZDd0dU5Ucnc1MkdxdjhRcUp2WllDaWpXS0Va?=
 =?utf-8?B?VVNETjNxYms3M2M1bWxCaXBwRGEyN3hYRnFUdkZoN3ZyVnZ4OEdHM2s4MC8v?=
 =?utf-8?B?SndFOXE4SGhpMytSYkg2Ty9BWlZNeFVWQmxob1RjcjJSV3E2Tk9qNGkrU2Er?=
 =?utf-8?B?Q1djQktGWGFtdjlFM0xhclhRQXJ3c2lwam84NU1TOERCS1RXa2xnOGN0OFh0?=
 =?utf-8?B?UmdaTmgyNjBKbnhVMU1TcDJNQTJETW8wMDBVUC9QeVc4bUNMVTExVndQd0hY?=
 =?utf-8?B?Y1k3ZXFkS0UzVGRiUUtnKzVkSmMzUUc0NjcwSXhPWUJzR2hTQU9vVkhHaGI1?=
 =?utf-8?B?bDRkcFpyZ1ZheldvcGN0MXMvTm5ZSHBVbFpJZE5MemZxdmo5cDEwT3J2Y1Rs?=
 =?utf-8?B?ekJtck5CS0h5V1NhUlFSenJHTXh3YmJDa0ExNU5aMFJDNXdDaitQdGo2VzFP?=
 =?utf-8?B?OVltdThmMUs1UVI2N1gwVCt5dk04d1FkZmFpWFFyeHIzdWtSR0dhbm9NNVY4?=
 =?utf-8?B?L3U3bHE0dzk4SzhwQ3NEbXRaaWxlWlJpei9xcXhidGxNbGpaZTM3MzhYSERD?=
 =?utf-8?B?Y2JjL1k1c29id3pVd1NzNDQ2ZGluSmNBbjFoczB6TncvUldwOGxLS0dGWlhx?=
 =?utf-8?B?QXE0Nkc4QlVlU1pQYUFuQjZsSEJ1VjNuaDloTGVhTU80MkN6eHF6eEV4MXFr?=
 =?utf-8?B?L1B4U09ITHJiemVHNlkxcjRTV1B1a3lpQW5GOTBkTmF0UXBJa2lubWo5T20y?=
 =?utf-8?B?OG5mL3NBRGdmRm9aR01RZ3BTb0hGSHVpZEpucFdKcjdPc1hwUHMyenR1Sjlp?=
 =?utf-8?B?K256YW9MUGY1NGZCQ2w3VkViTEhJbjhSZHFPZ0pVM0tuei9mREV4K2Z6djdo?=
 =?utf-8?B?V3dMS0pmOVBadFcydzYydnpCQXFOTVp5K3RZYThSQ08weGw4d0NpckhZM3pN?=
 =?utf-8?B?TVJWYnZXdU9ySmlBMDdOcGdEVWllQzZXbnVvQjI3ZlkxYndScktCTkJpSUpn?=
 =?utf-8?B?eXJiQVhUY1FyRE14YmtadHNBZ2w4NnRudWE4UzFDL1kzSFZOcW1XdXZCSm5m?=
 =?utf-8?B?YWQ2Ymg3M1RYQkRYK3pPeXBTUlN0Z3d6c28vSEc0WDUwUFhPVHI3ZE9vKzlX?=
 =?utf-8?B?RWxyOVZCa1VvZHJQUXZLN0d1SmtDS2JRVU4zWVNqTXd1Y0ljczhYb2JMVGw2?=
 =?utf-8?B?RFZ1OWhJY1F6YXI0RDlqdVlid0VTQ0syd3lkSEpWWGsxRC9icTV3aW9FZmhq?=
 =?utf-8?B?cUdhOTg2Q3lqZnFBZ2o1RXd0OTJUTWVRanRzRU4yYnVVSHdBeHZ6YlFFdHJW?=
 =?utf-8?B?V2N0K09WOGFTdXlWOUNieUNsb0NYWUFGQnhZZm1DS1Z2aHNEVEltWVYvVlFN?=
 =?utf-8?B?N1d2dU5xc2lxd2RCdmdORGh4M2UrSnRBb2FabzJjOTJsY3BQSmRYNHlZWXRM?=
 =?utf-8?Q?6yhRCF/g5uoybX4w=3D?=
X-Exchange-RoutingPolicyChecked: o3h2U5EfpFPqZ5chOPjqCAh/G1+MLMytVJhMKoxRJxkYMpuWjytxIkVR+bZWOryOtDGl4MHfOjJJH7hIHlJzlU4DTSZxJJRyDHS0KWzubhFvRy9cg3AzlFuAvY9wVXcaTgUDP15Ui8ElAUwaQQc0gAzJ3I6hwfivpvDbeSxSRBMtS8el0UP+jHbEcpFtuGw9JDz+G0cjXQCmusskPdp3+otMjRHaRVx1aSZlUz2A/PxOhHc1z0rDioo28meRIDPmK2GMewomB4GpHzUVgrU/fvn6ja27XceyILEebdWjyG+QCAs8vbbj7u38i/bScfwBnZpDdU/Yder6Rgx/edjjRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b5de40-f35a-4c8a-2000-08de8024e31f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 10:48:25.2151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTsBwd3Dnlil72sW1fSYGeD9b9fnLm+EyEAgcIFjwBv7txMOirzYOwc+CRaLay2tvqIBoD0k4KAt3mSnJSkWa0bLqyXTJWFeGK5+J8o4GQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7383
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

Hi Mohammad,

On Tue Mar 10, 2026 at 10:19 AM CET, Mohammed Bilal wrote:
> Fatal assertions can bypass cleanup paths, causing resources to remain
> unreleased when failures occur during audio tests.
>
> Replace fatal assertions with non-fatal checks and route failures
> through a common cleanup path to ensure proper cleanup.
>
> v2:
> -Refactor check condition (Sebastien)
>
> v3:
> -Update assert logic (Jeevan)
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/chamelium/kms_chamelium_audio.c | 51 ++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 16 deletions(-)
>
> diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_=
chamelium_audio.c
> index 2967e3c50..252a36274 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -389,11 +389,11 @@ static int audio_output_frequencies_callback(void *=
data, void *buffer,
>  static bool test_audio_frequencies(struct audio_state *state)
>  {
>  	int freq, step;
> -	int32_t *recv, *buf;
> -	double *channel;
> +	int32_t *recv =3D NULL, *buf =3D NULL;
> +	double *channel =3D NULL;
>  	size_t i, j, streak;
> -	size_t recv_len, buf_len, buf_cap, channel_len;
> -	bool success;
> +	size_t recv_len =3D 0, buf_len, buf_cap, channel_len;
> +	bool success =3D false;
>  	int capture_chan;
> =20
>  	state->signal =3D audio_signal_init(state->playback.channels,
> @@ -426,9 +426,12 @@ static bool test_audio_frequencies(struct audio_stat=
e *state)
> =20
>  	audio_state_start(state, "frequencies");
> =20
> -	igt_assert_f(state->capture.rate =3D=3D state->playback.rate,
> -		     "Capture rate (%dHz) doesn't match playback rate (%dHz)\n",
> -		     state->capture.rate, state->playback.rate);
> +	if (state->capture.rate !=3D state->playback.rate) {
> +		igt_critical("Capture rate (%dHz) doesn't match playback "
> +			     "rate (%dHz)\n",
> +			     state->capture.rate, state->playback.rate);
> +		goto out;
> +	}
> =20
>  	/* Needs to be a multiple of 128, because that's the number of samples
>  	 * we get per channel each time we receive an audio page from the
> @@ -447,10 +450,6 @@ static bool test_audio_frequencies(struct audio_stat=
e *state)
>  	buf =3D malloc(sizeof(int32_t) * buf_cap);
>  	buf_len =3D 0;
> =20
> -	recv =3D NULL;
> -	recv_len =3D 0;
> -
> -	success =3D false;
>  	streak =3D 0;
>  	while (!success && state->msec < AUDIO_TIMEOUT) {
>  		audio_state_receive(state, &recv, &recv_len);
> @@ -460,13 +459,21 @@ static bool test_audio_frequencies(struct audio_sta=
te *state)
> =20
>  		if (buf_len < buf_cap)
>  			continue;
> -		igt_assert(buf_len =3D=3D buf_cap);
> +		if (buf_len > buf_cap) {
> +			igt_critical("Buffer overflow: %zu > %zu\n",
> +				     buf_len, buf_cap);
> +			goto out;
> +		}
> =20
>  		igt_debug("Detecting audio signal, t=3D%d msec\n", state->msec);
> =20
>  		for (j =3D 0; j < state->playback.channels; j++) {
>  			capture_chan =3D state->channel_mapping[j];
> -			igt_assert(capture_chan >=3D 0);
> +			if (capture_chan < 0) {
> +				igt_critical("Invalid channel mapping for "
> +					     "channel %zu\n", j);
> +				goto out;
> +			}
>  			igt_debug("Processing channel %zu (captured as "
>  				  "channel %d)\n",
>  				  j, capture_chan);
> @@ -489,6 +496,7 @@ static bool test_audio_frequencies(struct audio_state=
 *state)
>  		success =3D streak =3D=3D MIN_STREAK * state->playback.channels;
>  	}
> =20
> +out:
>  	audio_state_stop(state, success);
> =20
>  	free(recv);
> @@ -587,6 +595,7 @@ static bool test_audio_flatline(struct audio_state *s=
tate)
>  	recv =3D NULL;
>  	recv_len =3D 0;
>  	amp_success =3D false;
> +	align_success =3D false;
>  	streak =3D 0;
>  	while (!amp_success && state->msec < AUDIO_TIMEOUT) {
>  		audio_state_receive(state, &recv, &recv_len);
> @@ -595,7 +604,11 @@ static bool test_audio_flatline(struct audio_state *=
state)
> =20
>  		for (i =3D 0; i < state->playback.channels; i++) {
>  			capture_chan =3D state->channel_mapping[i];
> -			igt_assert(capture_chan >=3D 0);
> +			if (capture_chan < 0) {
> +				igt_critical("Invalid channel mapping for "
> +					     "channel %zu\n", i);
> +				goto out;
> +			}
>  			igt_debug("Processing channel %zu (captured as "
>  				  "channel %d)\n",
>  				  i, capture_chan);
> @@ -661,6 +674,7 @@ static bool test_audio_flatline(struct audio_state *s=
tate)
>  		}
>  	}
> =20
> +out:
>  	success =3D amp_success && align_success;
>  	audio_state_stop(state, success);
> =20
> @@ -776,13 +790,18 @@ static void test_display_audio(chamelium_data_t *da=
ta,
>  			audio_state_fini(&state);
> =20
>  			alsa_close_output(alsa);
> +
> +			/* Fail early if any test fails */
> +			igt_assert_f(success,
> +				     "Audio test failed for format %s, "
> +				     "sampling rate %d Hz and %d channels\n",
> +				     snd_pcm_format_name(format),
> +				     sampling_rate, channels);
Patch looks much better now, but this part seems outside the scope of the
commit message.  Failing fast here is fine, but you don=E2=80=99t mention i=
t
anywhere in the message, and it still bypasses some cleanup. It
would be better to send this change separately.

>  		}
>  	}
> =20
>  	/* Make sure we tested at least one frequency and format. */
>  	igt_assert(run);
> -	/* Make sure all runs were successful. */
> -	igt_assert(success);
> =20
>  	igt_remove_fb(data->drm_fd, &fb);
> =20




--=20
Best regards,
Sebastian

