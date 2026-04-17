Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6229F8E4A5
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 05:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D3110E950;
	Fri, 17 Apr 2026 05:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPcIV8Ry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BAE10E950
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 05:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776404475; x=1807940475;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H6Ne3QKDu1tWkMTj7ibI9Jvs0y23zeZPzi2glEOPHp0=;
 b=GPcIV8RyLHjGT794UbViTdZZqk/bdf/dzA+5vYOmDCzCJtPwlHZ+6TxD
 Y18PhMNWkal9sY/4NBSubjgtJ+pNXjbrw0n1pRkqVvTLx07AvLytk4pxw
 qG/Z0jze/stptacDuSz5lXg5qvN0IpS2VFEl3w+W+M80A1v3gMGkb01bH
 tYga1u7FgD+32zSOMOgN/If87ni7JNK0ADbPrZ/i3rZedRTazivVhUkiu
 +E0dV2CxwqcsfDFK+AS3P9LXhk7CVkTqPqk1tAEW9ThBzjgCQy96Jx4zR
 tueDqWUCe/R+h7f50EavcGngVQDImt70Is1YBLJq1Hb2MpEY2nETDB5ND A==;
X-CSE-ConnectionGUID: Ko4b+bVSR3u17bs4CCjf9A==
X-CSE-MsgGUID: BJO+KrTsSr2sVkgz7ZOPDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77285950"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="77285950"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 22:41:14 -0700
X-CSE-ConnectionGUID: O2hGOEOrR5exUOAmcOOHdg==
X-CSE-MsgGUID: jAdhZjeVQRmNz25rfTn0sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="226586425"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 22:41:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 22:41:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 22:41:13 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 22:41:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwbXrRqtUKvPOlAY/rmsz3/PmgImarWyCJ6LyAmE32Gb4EsXyVfhMPx134t9kFoGytbOJ0mtFzW6PMQnowOOa64Fn7UuKuCqbWrd9s8RdLPFshznFxrq/Q3kfCNfLpwjH0LjlrdvSB9aWUg8Yq3mo0BHMuuJF81wfcMKAeVYEgLr3hEYXUaUEXEsSpWo0xbssdQ2IlGWyC7dKsli6psUqloLGkiUeV/c04i6y35uwjMCNPeRUf94e+MDXOCDAGpSGrewEFunPqctHamWyg4OOcb8YnhjPuKCCCnDdfyS1T2T85iLEgMEvgDrhy+fyHy/MhrWsoj9Ap0hLarNW/KSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcGNZrMl8AdcZ9qwvh9f0oW3y7pi2cskxLFvuSn2hM8=;
 b=idut3jbaIT+N8XHyNz9LPqwvxmSzpf3SGOBMaCn3esx0pi+LeghW8HPAe3JkBxTYw2gmh7vSn+8TQULWuAsFIoNaRM7CBTcSRUg85jaDyQd5xpRjnYFW9OAlPqhkQaX8lzNaYCy68b2dSDtnPE9Y4TlHOUvoVZ4/xkBoihS0PsAnxJnLz20DPCI7cgEjU045oJVhZJ5Qxu05X92EsX7AMib1jABsCK+jBY9fehfjhCoJkAbVej7xJAzv64UG1M2Ag5FPTasmO6rLdu04I9mU71I7T6RkiNto5ezETh7PABbC8m3EgKrGNITwurYsMHZMDJDkbzpvljjToxbLrxraCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 17 Apr
 2026 05:41:11 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 05:41:10 +0000
Message-ID: <0987d249-5874-4a70-aed4-35e559fc377b@intel.com>
Date: Fri, 17 Apr 2026 11:11:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tools/intel_vbt_decode: dump eDP joiner enable
 field
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>
References: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
 <20260417041031.2187889-3-ankit.k.nautiyal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260417041031.2187889-3-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0141.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: b79f5501-887c-4c29-8f85-08de9c43ee03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: t3oC/a/uPeU2Yo9lt4y/vB6jj5oqSID0OQqUP/f3kFLt4VxlrqEVuxsPZGVNsDjegkthHqY5Gt/WkRxBDjOsGZTJ9VTeeoyaeqAQSvWJbj2lN+RdO9tvJhTLGmazs/pV9vy2SirPtiIOojbkNmhWNNhDmCDWvmgY2OwzxRncbX1hJasQ8TQgWn3W9I93gtkYBITmcNFRAuqpVyd2+NxnNQ0biJ7HN1PHQ03B7Xt7vqeIu9tAUk2LQEkNWhcMinWU6b5uVyNp8Qa4KmeA9NY+aqKiZvY1XL9HscEQB1PyLvFrjfdMd96lcskTchePJdegXW+SOsxm5/aDSnx7wux5RNJTjqNAAGpTl4qLqArBTx+O0QLpBYXYACz3rlVsvSsA8otcdSS8tBd05YCd3wPkUbLwZ55ZCk3jRyscH0e30xD1xpfsKb7QFRbh13uOokfEKTCWODlY4f8C3gDv6CkWFwgfItVo9Lw/G+apYb/VHjKmIgE1Taef48nqIeWzibPKUkCYcoAUpTFc0EkpecuxpHInBrqm81KuqBeGpX6B+qQS/y5bYCtfo6HBSXoGinKAWPXyV9NpY47YEyDFpS6yi48AYA2iBsrqj0SJY4s1tDqqENXWP8V4Gd36VMIcUKgWQUJVSHx6/Xz6pGnClj6V5dTlJ2OcxCG75Q5u5gx1XuYIxxy84uK4iLt2owdq4zkf0i4QaZBCGz853abp2Gu9JRzFp2ZSZtRMryDBL/A4XQw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak5uRXp3QmllUUNLa054K2NzNXd6VHpFajZzMlJ0aWVuL2puQmNZNEJWRGkr?=
 =?utf-8?B?OHZtSGtDREhra3FuRUhFYzdXakFhZldUVEtqL2phaUFoZjBWaEcvb3V1czJC?=
 =?utf-8?B?L2FvZS9TSzNYYVBySHdUS3RseGViZVF6SkZ1VC82NDhTZTY4QS94YnFabmpu?=
 =?utf-8?B?c3ZlM1VqUjhmSFp5a1h4Q0ZNWWlPOGkyUXIyektJY0xlTWUyRHBtVG9pR2kw?=
 =?utf-8?B?c25XYklEZXNmRU9lWTRmbUg3QUNHVXRGWWoydyttTG5kbW9RVjI4eGtMTGE2?=
 =?utf-8?B?czBMaW91QWFtOVlMN1B0N3ptWTZZTGVTZEYxTEZKRDh6bXRncGpvZkpyRytj?=
 =?utf-8?B?Ky9ZR1cvWE9OcENUVVlkTVpHS0NZZi9mTGl6cDFYcXZTR1BEeko5ZkkxUnBL?=
 =?utf-8?B?OXUwVmJKYm1sSlhnM2xhTzdoV1MrZHlYRWVudE1mQVM0YkhBWU1MMkRqaWJI?=
 =?utf-8?B?VzluYkdSTGJrMTlSNHdVMEUvT2ZJeFR4K3VGcGhJKzhJejlpNHVZWVBzMlFs?=
 =?utf-8?B?WlAxYUxUeFZ1ZjVxN3pZd0x3SkxvQ2JsNjBTVHpwczZvWWd0ZnVDQTNsRktY?=
 =?utf-8?B?TWR5UkRMeHJTWmQ4RFdUQWVUZitBOVQybllCMjV2RE94WktQMHcvZ3UzMEJv?=
 =?utf-8?B?ZDczT3VGN1Z1d1BXWURxWURBTXRWTytLNGtxRGo3dE04YzBKNVp2RHI1QnJB?=
 =?utf-8?B?NDhqc2FwbU9QRDVRdDF0a2U1UDZYUXdReFJhWFRMSUxtYkgyTXdEbkRhQVBO?=
 =?utf-8?B?Y045MXJURGpNVlFHbE1PU1QyUFAxYXNSSW1PUm91NjNVZmZiVm51cUlYbVVM?=
 =?utf-8?B?MlVxNDBqTm1JUldxQjlac3pkZ3Y2cVB3akNucTNWN0N5SHg1VWdtcjBkSFdW?=
 =?utf-8?B?bmhpTWdFQzRqc2ExY0kwd0txeURlamVkMEFTV040OVZKVG1YTDBuNHlJNGpS?=
 =?utf-8?B?TjNLcXBQbTVBWHgwYndJelZpS3hGUENLRnJBWUtSZ0EyVXRDaHpZWWIyOEVY?=
 =?utf-8?B?RGpQa0g3UHdBVG5Wa0Z1RjZTd0hvSTJ6dXpHY09tZjNRSmF0dTRSN3kxTXo2?=
 =?utf-8?B?TjZ1NVd1d25KS0MwOW1DTnJBcG1rblNEQWUxaEprVElReVJqMUVVaUdKZFJk?=
 =?utf-8?B?dzlBUUlPRWNOKzV6SFVQOGY0eVdDNWc4R0U4R2YwMU5la3FaaVp0b2MwOGdB?=
 =?utf-8?B?V1kvamNUS1NPVVplOGVBTE0xVGhwL2xESzNYQWp6VldNOUYzTjloVmV6Zkg0?=
 =?utf-8?B?a09qbmcyVnh3WXM0cGU4b1pZcE4zOVlSRlk3d3MrdnlrcGFaKzAyTXE4a3Vu?=
 =?utf-8?B?NkNiQjNDWHNGN2hkMTFxcmZyOWJtMHJoZ1VGWlBUMHlpTXdiVU5EMFo3QUdV?=
 =?utf-8?B?aW5vcy9PTENCOGdQRGV0V1JKVG5VZkY4dXAvaml6TUhhZm9jYWozeHE5cERy?=
 =?utf-8?B?RU4yOVgvRVFMTzliV3Q5RGMyWmY4eEpNSWNGM3dYKzB4QlJ3dWIwUU1zbzF6?=
 =?utf-8?B?TlZYS1Z1OHFjcW1Wb2ZEMTN1NTJwenVLY2dadlVMaGR6K0FLZEwzd1NNNTRl?=
 =?utf-8?B?M0NUOGZtS1ZPSVhNQ1JOY29xWkJRdm5hc1Mwd0dSUDFsaHhuZE1qNTdoQXBJ?=
 =?utf-8?B?RUxRemdVQlJvZU4xK3E0Wk5hZFVPN2kxdFZtQlRrU2Foc0YxWEgyQ29lS0hU?=
 =?utf-8?B?MEd4VTNTMXNwdXBsY3hhaVIrTFZxLy92eGczaEpIakFjbDRaR2ViVTNTRlVI?=
 =?utf-8?B?djAvdExoeXc0Wm1odXNzUUp4UGsxOEZZWXpFWnE5WlFqODZ2Z1ErYTQ5SkY2?=
 =?utf-8?B?WVJmWUFUOVkrb2tGcmNXVk1oMlFFTy9iMUMrOXRteEFaWVYrdE82ZmQvdUUy?=
 =?utf-8?B?end4cjMyMUx5T3YyZ2h6WXh4RXZ2NXltT1RkZmRiMEw0dmhTMmoxVkdNZ0pD?=
 =?utf-8?B?OVBPbG1vYXBvTUhOWjRZVGxGeUxFSlo5a2RoOVBRYUZHWGMyeHRXT1FGU1A2?=
 =?utf-8?B?SlZOYVEzRUd6Vm1kN1lvRDU3QzNCWlBzb1lXbk5FSmRrL21NTThnL3VZNThl?=
 =?utf-8?B?MUJRQUVhSHc4aXdvbEF6WnZqamZ2dUFEM1prZWxUU0Jxa1I4aXJkZDZjcTVi?=
 =?utf-8?B?Nk9vU3R4ZXRJWUc0aDAzOXFPd1lPdVVaeEtVY3FCV2JmM0ZjYXlVWGt6bDVp?=
 =?utf-8?B?cStqRXprQ0dCdy8vUHpQVTNFOUVidnBOTlhTdUpqUnNIYnJteUgrMVd3NGwx?=
 =?utf-8?B?NitEeUhDZFI1VnA3Qk0xVVh1clArRGR3eS8zMGN5bHFjK1ltd3JrQ3hmdzVY?=
 =?utf-8?B?TWlEbUlTclQ0YTZXRmRYUm5HYWQyUWM2SWltbkh6M3pMcjB5SWdwQT09?=
X-Exchange-RoutingPolicyChecked: p6u3gz/e4nYHszQHVpuHwRtUT7Hh3pAVV+obJ0FMsukwoH+L0KMsVTvyr/6Tbhjw5ApNZc66X8j7+t6YMxF/ZkONdDLYRQyjirPK2Xa85hnfCe8cYAI9Gkra86+TR8kfC1L6gnSryc/4n2DlNp+ZM2J/x/2JFG/jT84jh6J6Zfm7pQSChuakrpxQZnEyMLJ6y3d6zw7FTZriHHW42K3djUQjXEzHV+YCwYsgP5eIpuftVsB81w99R65C6gyfB9rkNTsdTYcbPbCB3FmiEEQn86fbzoqtMX8BxFfe+Ll4FjFyqbrEMj/XvlaULUdGoxw9nYLM26lGLaRcHrNkEF3BpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b79f5501-887c-4c29-8f85-08de9c43ee03
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 05:41:10.8810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vjy9zYEOiPj2r5Yc8nTTulykGxuqG57KvzwvdiW2lo9wnAATzonxB3GdKhHbbArwFv2BHR1n4L/qCwkSpv1niA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
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

Hi Ankit,

On 4/17/2026 9:40 AM, Ankit Nautiyal wrote:
> Add decoding support for the eDP joiner enable field introduced
> in VBT version 261+.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   tools/intel_vbt_decode.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index d4aada743e42..a96b936d4b8e 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -2483,6 +2483,10 @@ static void dump_edp(struct context *context,
>   		if (context->bdb->version >= 251)
>   			printf("\t\teDP DSC disable: %s\n",
>   			       YESNO(panel_bool(edp->edp_dsc_disable, i)));
> +
> +		if (context->bdb->version >= 261)
> +			printf("\t\teDP Joiner Enable: %s\n",
> +			       YESNO(panel_bool(edp->joiner_enable, i)));

Same as patch 1, please update the variable to pipe_joiner_enable. With 
this updated,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>   	}
>   }
>   
