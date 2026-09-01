Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35850C61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 08:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88F410E3D4;
	Tue,  1 Sep 2026 08:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/JFK+Ru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1913610E3D4
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 08:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788252226; x=1819788226;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oAuI5KlLjPXsbFSbmDvmBubRI/ML51igJwUZeWaPRmI=;
 b=D/JFK+Ru5Lyqil4P7126dt4lbMVoIv3fArrqSSE9tVZxSHtKs+QXHVKy
 5gAL77eeKc4+vyRkbacBvClIgpwpvDb/bO7MH9vEJhT8SYX039Af2R6Ma
 q7A7QlZ7DgfWFC88yQh01D2LEHY/hHrtE1p5QwjyysuwwKnTuBxEp1Giq
 baXRadU6CQN77EmsLqsjPDUbyPtusRsEFc9c4roZageiwUcGL2n9vqUD/
 WS+sKjOSyrX7LfQwcWXtFZSUevAr46THuP6WZnbMQ8OQneEScQ2WaOI+c
 uyoagSOc1WanABj0itNYWWT2PUAj6In8hTVUzKymKsR/JP5teldGy261j Q==;
X-CSE-ConnectionGUID: 4qJoppUJSaWWE/4mYyvSVw==
X-CSE-MsgGUID: ++YEKnFJRwKfTUchshTQGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="100183618"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="100183618"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:43:42 -0700
X-CSE-ConnectionGUID: vqGW98KwSp2nEvkSTiWowg==
X-CSE-MsgGUID: F9jIc52fQA2kYU4TPqEG1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="273216093"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:43:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 01:43:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 01:43:41 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 01:43:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhv2fSXV0hdW02J2vw2j/Ly62crpB/D9hqKNmRHPgXWoUMZbj60ag7ySsPa7CUwVwvZpbybNmB9zNI9wZmVgMNytieG2BE6TJXUsa5Ugoj5QLAEU03XO9DhxnbvgTrPVe1Rql7EQx+Q2W6doHx5j2L3MmBgVY9/arRpQjg3JUPYVGhi2sTwN+MUvLYODIHXt0wPGOLSIgHDeLw7Ujxwdza9bULnHOUDQBSFjmy4fWf7Aa6r/Nl89iPHjvyHFVPnHKFzHU7lTr3ipd/z4op19BU/uV/lBpmCRBxprHeCxL7+oSZ3lyxD5R7c7+BQNcTsT9g7f2dVpGdqxQ3JpcThUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqcFnqbfMKvIVtOXshAuYON4DS5iqoQMplHF0Du0xEo=;
 b=kSNVaQNcHLBlFj491W35hkuEr3SV03EpaixL2eibfmIm2GBMkbeb8FQBXVXGUBhszKE7cHRWdfelETbVZ18bM9qFrm9xuFLnFhARjswexdee7J8hrPzZTdPdV9cof3uWaZH07isyTovhN22pKRNqe8PgQamYtz6wfKquq4iLhcJ/AF048OJM3mMTRIEYLNu6VV56mqtl4aJVmkOKWShWdBomYhUTqQt9MzJ0zt5iASiiUAfatuaqBAisbEhjqtxMJVfe397evZfpuszjHcDZguCBGjcGgNhTiAjeHe6pTlVFxJ6Z2XT33BjQAoQnCEQiLmzPlQL9dOBtq2jwCnF5BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SJ1PR11MB6250.namprd11.prod.outlook.com (2603:10b6:a03:459::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 08:43:36 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 08:43:35 +0000
Message-ID: <96bd463b-6a25-4b3d-9eb3-80cdeccdf349@intel.com>
Date: Tue, 1 Sep 2026 14:13:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools: rename HDMI compliance utility
To: vitaly prosyak <vprosyak@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, "Prosyak, Vitaly"
 <Vitaly.Prosyak@amd.com>, Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "chaitanya.kumar.borah@intel.com" <chaitanya.kumar.borah@intel.com>,
 "Broadworth, Mark" <Mark.Broadworth@amd.com>, "Hung, Alex"
 <Alex.Hung@amd.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
References: <20260827185355.378279-1-swati2.sharma@intel.com>
 <20260828095854.7apqo5c7hy3n7oet@kamilkon-DESK.igk.intel.com>
 <7f78ff21-e4bf-417c-bf9d-c605b13a4beb@amd.com>
 <7fa2630a-424d-4156-b18d-0b4b3e50df23@amd.com>
 <CHXPR12MB9992204E4BC30CC3411A15975FE5AC2@CHXPR12MB999220.namprd12.prod.outlook.com>
 <33ec7288-0774-4449-8bd5-4215ca982ebb@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <33ec7288-0774-4449-8bd5-4215ca982ebb@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::8) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SJ1PR11MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: e48e8bb8-d299-4bea-371a-08df08051c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|3023799007|4143699003|6133799003|10067099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info: j8pKmLtFZxKmzhRLsRHZOAzK0i2AXHKWcjjRyRT1m1UQG3mGizPlbCLqEbDT164vc5J0jyh5YxKW2oVQi32wSkliAAhuc7owkVe41AQisjamiLs1cEh1Xkk4gsq6rCaEJuA4+Mw/OWZ8DjV09AUzAvOTSJ7BxGrK8miHUxa54gpZE2xXix9AM81aZpCREkF2E9foPr+2BfcoYoiM4tQSNdCojUMLTX/Jg4il7VkjR3+teCusTbQxz+X/3YuC4CHxQLqBKjDt1t01viJ8j1BLP6z4/X18g5Mva4mkpiTLfRzYpQUdjOgxu39ZnLAiNvMGrAayHPXLswCe9Dy+BK7DNe3TyYuLBK18vCU5eb6dzPS8JGnjCFRyYoyAjZdYQJt4K01equdiYyBqyG99RQzBYaJZOcFhArjHhmVoxZ47Li+odzUjTTUYiE5Y7eesm7IxbP1PCyLfV5GLKS+Bi2jhafcVzce+60JKiEXzcepvhBNpoolCVTDHi9x5N+tvbdmWDP7GIL6/oEALU/y06HmBneViZFTWRHoxp7ujFDILjc+XlXWcIoHUDnJZ3zPFb3Eeq5DjDFd/tgc2Y9K71oerNcOCn1dMagW6Mcj/qt+hDI5XrlfWXRLyaDRwCkORDNoMX5YeVF7PUcVmTyK3W6/1RDhtH4/jkc5dj3+JGe6o4K0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(4143699003)(6133799003)(10067099003)(11063799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZERqbGh2SWtSSXY3WUQ0T1BNeEcwa2xJWXNsSlMxQ3E5Z1lkSVZFYVV1dldS?=
 =?utf-8?B?czNYSzJyZlhPY0M1NVdnTzhmNnNodlhMSHdPVmVBZHlLSGhiSzJZbUR2ZzlM?=
 =?utf-8?B?QllLWStFT0hQRkFGenN0KzdVc2xFMUpRR2Q1Vm5FZkRkeGxPYnUzVWowb3BE?=
 =?utf-8?B?dkpPVkhnZFR1NmF6dURpVlZrdGM2cHcxSDNScDZkK0VzL294ZzU1OE5MSmpQ?=
 =?utf-8?B?SHZFYjJCUFdmSmRqQTd0SHVpc2lJSHpMT2dxSlcvRUdFTDRVL1hkUEdzOXc0?=
 =?utf-8?B?TTRvT2RFRElyZFhrb2wzWmMyYlNnLzNwMWIwOVBmekdDY2t2MEQzL28wUXBB?=
 =?utf-8?B?WEI5WnJqeDAzV1RxSUh3ZUdteXM0MDM2WTRHc0ZZbDdRQkgzTUtQaUE0NkNI?=
 =?utf-8?B?b3ZiNlA2S0JoK0VjL1NQZ0E2V2twZ0pYYkdKR0Q4NUU5Y2FMTERvejZvSFhh?=
 =?utf-8?B?OGcwdlhETG9OaHJTcU9NWmR1K0pKeThMYlBVdU5VT3pyT1F5NXoxVm9yandx?=
 =?utf-8?B?a0x5cWU0cUttaDJzYzJQTDJQQjF0aVhXSnFkZDNvUXA3TUdmMmdCK0xyc1pW?=
 =?utf-8?B?UVYzdklmVmNLR0N2NmNzMlJXbFJyL3dBdlQzUGVwT05ESUNyRC93N1RsdlZF?=
 =?utf-8?B?MXVPZ0tQWE0wRS8xMEx4UTFaZENhQWtVa0ZnUHU5OXJwWlpTWnAwQXBDUzRq?=
 =?utf-8?B?Y3B6cXZNTStLNUx1TlEvZ3VaeWNhaG9rUHlTQ3FMYy94aW5ndnh0MktTaXBD?=
 =?utf-8?B?VjVCajFnbUVzNjlHVFlhQXg2VlpkN21VdlhGVzR2L2w5Zmk2blZmUnVkcFU3?=
 =?utf-8?B?WWRZcDg3SFNYTkpzc1BYV2R2ZGp2QkhqTEM3MTFRSUhqeDR0OWVEWnl2cVRD?=
 =?utf-8?B?ckRRcVVKeTk1V0huMmZLNFlMT1BLQldxUStRSnFjc2o0bXc5bCtTeXUyR2RR?=
 =?utf-8?B?L0wvVFREQUE0OUtFc2dIaC81Z0h4TFlKVmpJcTk5MjFkQXVhUDROZWd6TEdX?=
 =?utf-8?B?ZjZoTk1JamZ1VVBrVmNvcFY5b2oxdGpSTHN2VFNpSkxzWDY2YTdmSHpIbzNx?=
 =?utf-8?B?ODBac0dCR3puZVNjTDRNQnFWaSs0S1RpUzJ1c21JQll4R1FDL0h4MFhsdUtz?=
 =?utf-8?B?U0NQN3JsTlRodGQ4TXBhT1JaQVBYYWpvSDFMQTAzdkZ5MjAyN285WU5Qc1cx?=
 =?utf-8?B?NlV5VWp1WnFGNG84d1ZQOFEvcTJiM0g1cnVIRjBxNkFoSHZzczdtTXhDRzBE?=
 =?utf-8?B?TG15TWJIMmVsRm9WN3pIb0JoNFVuTkhzcWVUSm5lZmhCTTMvM3FSRzNnT01N?=
 =?utf-8?B?emhEV2dZdG1qZ0k5RHUxTFpvQktXVUdIU0dzc2t0MEN2amdGSk9kNUJXZjRO?=
 =?utf-8?B?dlFrV0dISlhTVk14SVU4UCtIMVVaYndTYTNGRjgwTUZOd3FjeU0yK0NzL0Zm?=
 =?utf-8?B?UGZZUW5uYnNTYS9tbGRoSENuTkNDYWdxWmo5eDJxMDJlR3NjajllZTlmYU02?=
 =?utf-8?B?SG0vZDRiRWQzbGhPdWlaOHF2VmZkcm5NaFNMSXpKSUVVVk5TRWdDZU9MeHNB?=
 =?utf-8?B?TldWMUFUbWRGV3lMSmZaL2hiV01xTis5N2FBakpUTU5XcERIVlMvWjNpY2xm?=
 =?utf-8?B?bUJ6ZkZmRDlBRjUxZjhha1BZZmIrNlhmeCtFOVp2TElzaE04NU4vU0g1Y0xD?=
 =?utf-8?B?aERCZjk0akg2Sm1ueERNNTU5ZnVvaUhOOVAxcHJQb1dmRDZiWEF4YmZlSUdG?=
 =?utf-8?B?Q1NKRDhBakI5UXRoSGszRWRtWk5lWGFMUVBYbG1HeUkzMU1nMHV1SDJuWDVI?=
 =?utf-8?B?VDZYckZENmVpRFhIU2NBdnVFZWtaU3pBcEh1eUdGWk4zSWM0dUtlMmtCQjVJ?=
 =?utf-8?B?SEx6dzJKS2ZtekhTKytHUVIraDhyN2k1UEdNc2dDazluWjBlMjhUcFBiV29Z?=
 =?utf-8?B?OXhFOGkyNWppa29zUzJkVG9hd016OWFqTHZ2dnhCbTVsaTVVbm56SGpkOStm?=
 =?utf-8?B?alhjZ2JyV01jWUxub3ZlVThJaHFWSXN1K2E2OHFTckpqemlQSFBwTWVjaXY3?=
 =?utf-8?B?UTRMUzd4bHFOb0dYNXNodHVNZDdqYUEyZnN3ODdpUm1jSnVRSzB1Y3ZianE1?=
 =?utf-8?B?cHhkbGh0U09pL1o2ekdkRlpWNHFlTW55TWtpSFpsRDUxdzNsQUtPS3h3cVo3?=
 =?utf-8?B?S09xMjZvSElSKysySnIvaWtoUG50US9SWElZTWZzdEMwSy9jcUY0U2w1YUE4?=
 =?utf-8?B?elczR2U4TVpsYTc3d0pCR0Mza1pjKzhKMkxJNHQyZEsxN3h4anJJNStvbDRG?=
 =?utf-8?B?UGlsT1NjZzJjSldmcXdiK1Y3NUdlRlExTjhCS09KK3VGR3FZdk5IQT09?=
X-Exchange-RoutingPolicyChecked: 1FwCE3/5iB47Y5Wnj1DZpkjg7nzFCzAe6f0dPWlk7MobJC2qRjZlx49aubsOPu+NZYNmjsGxD+BgtPC/69yb4WUzBFpjq+UAezWa92hsvzL6enZTuVcZ9NYG0WAsWLRj6WH+IabpSZKL2nuV/g9rXekQWKS8eQr15MyxcS7CZohdG/mihd5C+9ojp1zsOBSkdvF6966rsE06HZzpr88KCTqc+53DZ1SV38QEx1RhTnO6y4Yk/gGBQP9naBx/SYzQxmVA6g58gZsP8X9nIpv/NumLXcZJkncFNQXgO0dVbo3Z3b26T3mty3HCpy75mVqbZGiasqk8//+m8WVlTWewGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e48e8bb8-d299-4bea-371a-08df08051c04
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 08:43:35.1296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UZ2okesGYZH5YusTDcnlDxhASF8Y5JIGYlVXeR80Q3D/UQEZfc6+gZexS9Tv6IawoYFpPNdC9gytEWH07Zppg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6250
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

Hi Vital

Can you please rb if everything looks good at your end?

On 28-08-2026 08:26 pm, vitaly prosyak wrote:
> On 2026-08-28 10:53, Zuo, Jerry wrote:
>> AMD General
>>
>>> -----Original Message-----
>>> From: Wentland, Harry <Harry.Wentland@amd.com>
>>> Sent: Friday, August 28, 2026 09:35
>>> To: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Kamil Konieczny
>>> <kamil.konieczny@linux.intel.com>; Swati Sharma
>>> <swati2.sharma@intel.com>; igt-dev@lists.freedesktop.org;
>>> chaitanya.kumar.borah@intel.com; Zuo, Jerry <Jerry.Zuo@amd.com>;
>>> Broadworth, Mark <Mark.Broadworth@amd.com>; Prosyak, Vitaly
>>> <Vitaly.Prosyak@amd.com>; Hung, Alex <Alex.Hung@amd.com>
>>> Subject: Re: [PATCH i-g-t] tools: rename HDMI compliance utility
>>>
>>>
>>>
>>> On 2026-08-28 07:04, vitaly prosyak wrote:
>>>> Added Alex
>>>>
>>>> Hi Kamil
>>>>
>>>> On 2026-08-28 05:58, Kamil Konieczny wrote:
>>>>> Hi Swati,
>>>>> On 2026-08-28 at 00:23:55 +0530, Swati Sharma wrote:
>>>>>> Rename the AMD-specific HDMI compliance utility to a generic
>>>>>> igt_hdmi_compliance binary and update the build rule.
>>>>>>
>>>>>> Keep the existing AMD debugfs flow for pixel-format forcing. Skip
>>>>>> that operation on Intel devices until a driver-supported interface
>>>>>> for selecting the pixel encoding is available.
>>>>>>
>>>>>> Assisted-by: GitHub Copilot:Claude Opus 4.6
>>>>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>>>>> I will forward this to few AMD GPU dev to make sure it will work for
>>>>> them, +cc Fangzhi Zuo <Jerry.Zuo@amd.com> Harry Wentland
>>>>> <harry.wentland@amd.com> Mark Broadworth
>>> <Mark.Broadworth@amd.com>
>>>>> Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>>>
>>>>> Vitaly, can you forward this to your devs and/or CI team and help us
>>>>> here, please.
>>>>>
>>>> Added push for testing to our internal CI :
>>>>
>>>> https://gerrit.core.linux.amd.com/c/upstream/gitlab.freedesktop.org/dr
>>>> m/igt-gpu-tools/+/1951
>>>>
>>>> Hi Harry and Alex,
>>>> I hope you are both having a good week.
>>>> I am not entirely sure if the DAL CI is executing the new remote gerrit
>>> correctly. When you have a moment, could you please help me look into this?
>>>> Thank you so much for your time
>>> Not sure, but I think things in `tools` would require a manual run anyways.
>>>
>>> Jerry, can you have a look and review this change?
>>>
>>> Harry
>> We ran amd_hdmi_compliance from CLI. The only change is to replace with new name igt_hdmi_compliance with the same parameters (-e -y -b -t).
>>
>> Should be good.
>>
>> Regards,
>> Jerry
> Thanks a lot Jerry and Harry for fast responses!
>
> Vitaly
>
>>>> Vitaly
>>>>> Regards,
>>>>> Kamil
>>>>>
>>>>>> ---
>>>>>>   tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} | 9 ++++++---
>>>>>>   tools/meson.build                                      | 2 +-
>>>>>>   2 files changed, 7 insertions(+), 4 deletions(-)  rename
>>>>>> tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} (99%)
>>>>>>
>>>>>> diff --git a/tools/amd_hdmi_compliance.c
>>>>>> b/tools/igt_hdmi_compliance.c similarity index 99% rename from
>>>>>> tools/amd_hdmi_compliance.c rename to tools/igt_hdmi_compliance.c
>>>>>> index 2af4c0bab..ece0abd1d 100644
>>>>>> --- a/tools/amd_hdmi_compliance.c
>>>>>> +++ b/tools/igt_hdmi_compliance.c
>>>>>> @@ -833,12 +833,15 @@ static void force_pixel_format(data_t *data,
>>>>>> int pixel_format, int conn_id)
>>>>>>
>>>>>>    test_init(data, conn_id);
>>>>>>
>>>>>> - fd = igt_debugfs_connector_dir(data->fd, data->output->name,
>>> O_RDONLY);
>>>>>> - igt_assert(fd >= 0);
>>>>>> -
>>>>>>    igt_info("Setting %d on connector id %d\n",
>>>>>>                    pixel_format, data->output->config.connector-
>>>> connector_id);
>>>>>> + igt_skip_on_f(is_intel_device(data->fd),
>>>>>> +                       "pixel-format forcing is not supported on Intel
>>>>>> +devices\n");
>>>>>> +
>>>>>> + fd = igt_debugfs_connector_dir(data->fd, data->output->name,
>>> O_RDONLY);
>>>>>> + igt_assert(fd >= 0);
>>>>>> +
>>>>>>    switch (pixel_format) {
>>>>>>    case 1:
>>>>>>            entry_name = "force_rgb_output";
>>>>>> diff --git a/tools/meson.build b/tools/meson.build index
>>>>>> fbc6c0a00..68c31da92 100644
>>>>>> --- a/tools/meson.build
>>>>>> +++ b/tools/meson.build
>>>>>> @@ -183,7 +183,7 @@ executable('intel_gpu_top', 'intel_gpu_top.c',
>>>>>>       dependencies :
>>> [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
>>>>>>                       lib_igt_drm_stub, lib_igt_tools_stub, math])
>>>>>>
>>>>>> -executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
>>>>>> +executable('igt_hdmi_compliance', 'igt_hdmi_compliance.c',
>>>>>>       dependencies : [tool_deps],
>>>>>>       install_rpath : bindir_rpathdir,
>>>>>>       install : true)
>>>>>> --
>>>>>> 2.25.1
>>>>>>
