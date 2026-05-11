Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D043CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 14:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85A410E788;
	Mon, 11 May 2026 14:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUnHEFFW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6592710E2D8
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 14:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778508886; x=1810044886;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=ufuc4Iv8nCGoJnAydkAhBitGZ6RzGF2xgesJpR6PpMs=;
 b=iUnHEFFWc3px4rawDGoFRtCt4VQ3tMQ2gEKxAMCvjtfDczbtVAwLW/CP
 EED8QPHH6nNLlSXFJS11xZuHNB0iGSPnPV5zWdmHecy0zO9M6tnYkDl9M
 nnGA3h4/KIbPcYabpNj728ci6Ca3PKWC6qphCCOoEcnZ/A0fHaS721199
 Qc9Kb6kG9xqiJCa6SFVmEMpXSuW9iU3FxqWZja1u0MtnlxdC6BmMUGhHK
 q1e/JwH6vCu8SLZi9LzyvkSoABaTekJnwFZ+RrHeAWJP8wTTaCYhjEEUT
 9dIxlCelmuJ1wDnkNh2Pheg22/NrNXafSQ4u1TG1vZvcly5xrAhjqTqCL w==;
X-CSE-ConnectionGUID: vLE5NSNjRNa1HTf+r5hpcw==
X-CSE-MsgGUID: xr7St+r1SEO0XwNLECxUmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79499852"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208,217";a="79499852"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 07:14:46 -0700
X-CSE-ConnectionGUID: lS3DjTfIS3myLaXYDP+dFg==
X-CSE-MsgGUID: fkR8YCneQyGolB7EOLn2ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
 d="scan'208,217";a="233144881"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 07:14:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 07:14:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 07:14:45 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 07:14:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcO/UvpZEkAo1AiN6tGks5b5K90+UHbe1EPGXCkLLmgEY+4N88AEQRDJ7wLmEPT6FvPBmlFvinngU9JP2TR/woloHqEeqJExvoeqndeJQYbl5rllXvNBblUe2NyxfHsY9yjjVA13YURUJ1W12eF3d0D9XO4FgZGH+H+SfqSnuQa/lYSJRJFdcOsstYYR7sufL3V4j5BBtaNhvxYiXZ3iPUM149EO1wo7XVoEZq7Sr9fFPmrcbqE6LkwCUYLTcUZsjbgrSX7Sj9lHBWBw/8iJ4cAvGSRd+zWDrHfNYoSk7L9LlJfqNyp16HnKIv4/VBxtLwwve05lLZZyx0q1ZPToXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ll1Gv8HmpayryDnD02NcPdXzl9+3K0xdl43W6RGU++k=;
 b=oLGyAjem0rE7uIyawYXO7xVd/QkR1LD1k5CL1xT8xfgJjt1DFjc0OsL7icKWGrxb0IgGQ4XDbgtVrdKHwKrzdIR5TrQv16tscS00dsFTyPeuLoXNIGhcI9WeZoRty4ftxqb32uvg0NEF45IPhq+lGbMDdmTessQOmelevoqV0U/lKDw0CB1m/4/WQDYh5JX8AarfvwG/0fv+RH9fkM1ro8G/PESLP2aCYD4aX0JaLFIOQo4qwlx8k4I7XDWnM1VEtSPXCTpxo6HNY5wofZw9ww0LZKPhbeqs7R+SqpBYIyD0g1K8kCegNzxxCaDkTH3S3eWHIoM0rUH9WwuN0QCB1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by IA3PR11MB8966.namprd11.prod.outlook.com (2603:10b6:208:572::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 14:14:36 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 14:14:36 +0000
Content-Type: multipart/alternative;
 boundary="------------U9VC4dxkQ2ZO0Xu2LlRpo2jt"
Message-ID: <1571e8c4-35a2-421f-aba0-159234c51bec@intel.com>
Date: Mon, 11 May 2026 19:44:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_plane: Restructure
 planar-pixel-format-settings test and make it Intel only
To: <igt-dev@lists.freedesktop.org>
References: <20260424171123.3963793-1-juhapekka.heikkila@gmail.com>
 <20260424171123.3963793-2-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260424171123.3963793-2-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MAXPR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::26) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|IA3PR11MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 72227974-5bc3-4c8d-4c8b-08deaf67a115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|3023799003|8096899003|18002099003|11063799003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: /5M9NX0iA2DLr7242n6JZmQvyXqfh23lXOkTR90GBO8TosZODMeQRU24A3z3Im4Sk1Tj/8VnA9csxuq/NUPu3nsB+cFGDmXZPDxwroAU5DNoHVggnaHVDk6ngLS62CCJ6Lm6B/ppSkK0MT/eLZXMLQ65kLMO8M8pWvzijvOiSEYU+v4CLZlwagCPH2+CNCP+W7HGO3y/LAkiEtpFcORfaSfRd1BqdTinkQQB/ZIEJIxD2UrGMfAux8HosCLgY5SWw/TBlOlIrIMAqFjWyjRkQOlX06bCDPd5lwD6k2tQJJYSEaR8Eu8LmdaZckZcCu1GQH9Nrj3DS6ae8zAf2GJwLjObwxAK9juWtNyFvc/KxEgifF6F5zq5B8I7zZLoQF1VgcQnQALYDVP6CThqjwi7DUb+q9pIjjk/7mbfg3ny+j7Kq7BaM4J5p89kLCZWll+P2bBDN+wWv4KtbD5kG5UCh60WJiguNTKzFjI9Q2NTQOtHqk1/rTOCNMU0WElu9pH4IKV9JgJb9wleNJ0nxAplW4w1P/Q+F4WOQovMTJHKoNMlj2atVn6IxjTb5G0OhLa6E4hsgYQUtvO0JHYOWJLNMrYComVPu9NeMTkWoYw65+B4C5GuhltA8irJyF0vaf3dci7Ti3hMOdNujAth3GM8lscuinhiLf3At/1xiwLn2+IB21PVjZSLwm7YiDKZ1U5l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(3023799003)(8096899003)(18002099003)(11063799003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjNEbXJkSXp3SFJqMzhIZGViZ1hGSjJMUVBTTEJENUt2MGVCSnZFQjZ4djRL?=
 =?utf-8?B?WXFjMXgyaWdBemRvM29HbmxWblpCUUVKLzhMUnNMUWk4cGdCMWY1c2N3d0VD?=
 =?utf-8?B?WUtvZzVvZVNwQVoxTVlreGdRQnZyTHhNWWpDRzlpSmV3VHRVSU9mS3o4d1Iv?=
 =?utf-8?B?amZCWHRMMHc0MGp6bzl0Rm8xN0wvQVdHc3MxdVpjRXdkckxHLzN1QlpEMmZm?=
 =?utf-8?B?ZC9YSGVRdEZqNXNvNEVjS0wxQStDRkpyOE9OdlBUS1dQSjRTU1NrOE9sODJj?=
 =?utf-8?B?ZlZVSWgxc21HbWE1SUhPMnhiaEQ4M0FIRDFiTFIxL3NwU2V5b213bkhzVDdT?=
 =?utf-8?B?eXp6ZDQ2VDVldjF0ZVFFdCtWRGVjUmN5Q2QvY3RRSDVNM0hNV3JNQlVPUEFC?=
 =?utf-8?B?L29za1hmMW9jUDB6YlFjckUydFVaYjhiNmF0VUJ2dWV1MzNBWlpDSlhBNWVV?=
 =?utf-8?B?M0puS3FmZUlrU3E4bHM4eHdUbmNUUnhic0JuWG9RaGk5alVZbHdwakR0T1Fk?=
 =?utf-8?B?NDhnYmxIT2pMQStzd0o5RDRJR1J1Umc5amU5cFBVbzJVNFVKZFVLQnc0VDdx?=
 =?utf-8?B?dlltNk9heVQwdVhyREFYSDUrYy8vR3Yrejl5Sm5wMTQ5VFJlUFR3ZG5OclhK?=
 =?utf-8?B?VE5LdG9zSkp5M01zRHJnRU9meVFzaU1xSFZ5cUY2ZnBBdWt5R2dBZzVxbEM1?=
 =?utf-8?B?b3dhQWFJeHlraWRMczhNNWQ4UDNoempSRnlwaDdmTHV0MktiNS9TN0xVNUVy?=
 =?utf-8?B?d1JNd3JjQ08wczF0dkZBZEliVmttTEFqZ3BPMUUzZ3NUMVFnSkZuR2piRU1G?=
 =?utf-8?B?WjlKWHZiYmlCR0JySVZaWGtBNXpzUC9HRFdkL0k4S3haWnBEbWFkTThBNmcz?=
 =?utf-8?B?emZiRWFZRGJxQnNzbTQzYmhrN3Fmb1lSU0I4SHdGUk9mdkRiN1BoYUxyR3hm?=
 =?utf-8?B?dmwreG0zd1lrTTc5cTRDMFZkZ2JOdmgvNnNJNTZVQkhIcEVISlB5aTgvazNC?=
 =?utf-8?B?RlozUkVsR2w4RTdSYUxudnRUbUVObzFtV0ZzOXVnamZiV0ptNHNxM2VRUUgw?=
 =?utf-8?B?bEZCdVJqMDNpSTNMbC91eCtrMExVSDhySjlqeFZJSFhERzRYL3JpTjlQMnEy?=
 =?utf-8?B?bmhkcDdvNWxxSXN3Z3A1Q05BU1VmT0FLbDJKN3ZoTHpKckl2MG1jQ0dLT1Y0?=
 =?utf-8?B?UUdzMkZaM3ZEcW9udFdMUnZxZUdabTRpSTU2cURiVWJWU3F0eFpmclhzNFh2?=
 =?utf-8?B?NnAvbFVpekM2OHcyZ2VZUXpBM3VPUnBWS01XS0E0bTh4M0dEU2JoNjFNc0pI?=
 =?utf-8?B?OFV1VFZ6YlFBRVhHdWVwT2gyeVdZUkYrUDJnZHcxaVJPaUtnOGxsVmxvNUVT?=
 =?utf-8?B?ZnRFYmNiTjRLSHN5bVRYN2tTTEFCRkYrUzVJaVlQUDFzNVV2d3VRU0lKQjNB?=
 =?utf-8?B?ejZlNmJGYmdxMjBGQUZPMFVPRldDVGp0MjBJL0lXN2JGY1dDL2RySDEzSCtL?=
 =?utf-8?B?YzRCbzV3OC9xNzQrVmNJOXNIaDVWOVBYUXlRN1RKYk9KVkxDaUlod2VUSnRy?=
 =?utf-8?B?Smc4TFlZNHZ0bm8rSS9yT1NTZGhDSWZTR3ZpcksrWnhzOHZ4QndqNm5mV3Ar?=
 =?utf-8?B?VkNzLzdINDYrL2Z6Q054RkNCYWEvRzlhWlhSUVJOakxGT2hjb2hWVHlpMmxZ?=
 =?utf-8?B?YkcrbDJ5VlFGa3Z3TGI4anJ5aUdUaDRyNU4xS0VySXk1ejkxck1BNS9mOXJN?=
 =?utf-8?B?STQrT0hkYUljV01LTFBzSUxTQXlNKzRNUEpmSU1KY0tSczJpajR5Z2tJaTla?=
 =?utf-8?B?WFNLT2RsRVlEaUt3cXZWYWcxNFlSMlljeCsrcUtKZEhFUTNoYlFvR0FWcFZl?=
 =?utf-8?B?R2U2RjdpLytzeU1HcjNwOXRwZ1ZObXdaRzFiNk9qMTFpQjEvZzM3dFBpUUdF?=
 =?utf-8?B?K3Zpak45VW8vZk1wQnp5WHZSTEdFZ0hhdU81T3pyQnlhd3JqSjJGSmI0UjVO?=
 =?utf-8?B?Q1Y3Qys1S3FVTnBWV2lCVVBEdDhVMWxBRU9xcjAzdjRINEYxTWE5T2w4aUxp?=
 =?utf-8?B?b2NiNmZHODJodFNxbVZQc0RTMWordjhsbUhPT0R6d0ZMT3V6ZXVvb3RDQmc5?=
 =?utf-8?B?dGVVbXhNazBuYmdDdXdicXF6R2kxYW5HUDRHcVFlSjNFOGtYc3dOeHRvQWVq?=
 =?utf-8?B?ZDRsRlVPMUNTeVVHRjBOWERrOU9CUDAwTG1CWTRXamNMWGhjeFRBTCs0NnA3?=
 =?utf-8?B?NnZwUFJ6YjcwZjNkbFpCaUlTa1VKL3YzdnVrTTRXQ05teTBCREJRSkpvcUsz?=
 =?utf-8?B?U3VxcTNWNkh2VmxJN3NJMlZ1MGh2OXdNOWNlWDVGMGRtbFd3MXVWWTdHSkpw?=
 =?utf-8?Q?IzO28UFD56uyHCv0=3D?=
X-Exchange-RoutingPolicyChecked: NdIreqB9C7iLc3YwhY2JPjIElZ38UXR8CmOg8lxloK7GszOp4wOEmsIwTlNAj8hm6bsTTcknygE6KRAAk9lRz+udTOv/RWbQSumHqJ1pmZHiKrh4tm9fYaT6hNOlQgsP+NXqumTIRUcuMoK89Ssj6qNzPavzXZ3VI95KzotDmH7Y1XTVacPhCAxCtmKc6ZJV57iXw27epjRIbLzfmD3GwfvL+kxT3S6hPKFdMF+MJy8f8aPijNb8QDN6KymZT2PITYkJVwHln3WUTXWSJKVjNWQUoRQHZTjji+QJC+o24rswLI+UszP3swoGr62XOoms5lWjJXLGONUeUvmiGDyiNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72227974-5bc3-4c8d-4c8b-08deaf67a115
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:14:36.0637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdyZePh+AqK5KRwwXnnkNLiy/3i1i5gS9WDNo1RXHoKMTvRzdudzSdhp0LdRjc+SxZbQ1M0ZklhDrWOtOGUjBGLxibxBE4u7UfT1UG4dH+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8966
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

--------------U9VC4dxkQ2ZO0Xu2LlRpo2jt
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi JP,

On 4/24/2026 10:41 PM, Juha-Pekka Heikkila wrote:
> Separate different planar pixel format tests onto their own dynamic subtests
> to make it easier for debugging. All tests here are only testing Intel
> hw related restrictions hence it make zero sense to run this on vkms or
> other drivers. I added back the original limitation to make these Intel only.
observe the commit message styling issue
WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line.
>
> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
> ---
>   tests/kms_plane.c | 322 ++++++++++++++++++++++++++--------------------
>   1 file changed, 186 insertions(+), 136 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 7962c733a..6c08f1de8 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -41,8 +41,25 @@
>   #include "xe/xe_query.h"
>   
>   /**
> - * SUBTEST: planar-pixel-format-settings
> - * Description: verify planar settings for pixel format are handled correctly
> + * SUBTEST: planar-pixel-format-settings@nv12-odd-width
> + * Description: Verify odd-width (257px) NV12 framebuffer is rejected by the
> + *              kernel on Intel hardware (display ver < 20 expects -EINVAL).
> + * Driver requirement: i915, xe
> + *
> + * SUBTEST: planar-pixel-format-settings@nv12-odd-height
> + * Description: Verify odd-height (257px) NV12 framebuffer is rejected by the
> + *              kernel on Intel hardware (display ver < 20 or >= 35 expects -EINVAL).
> + * Driver requirement: i915, xe
> + *
> + * SUBTEST: planar-pixel-format-settings@nv12-odd-horizontal-pan
> + * Description: Verify odd horizontal pan on NV12 framebuffer is rejected by
> + *              the kernel on Intel hardware (display ver< 35 expects -EINVAL). + * Driver requirement: i915, xe + * + * 
> SUBTEST: planar-pixel-format-settings@p016-odd-vertical-pan + * 
> Description: Verify odd vertical pan on P016 framebuffer and check CRC 
> + * matches a reference XRGB8888 blue fill on Intel hardware. + * 
> Driver requirement: i915, xe * * SUBTEST: plane-position-%s * 
> Description: Verify plane position using two planes to create a 
> %arg[1] @@ -1354,165 +1371,197 @@ test_pixel_formats(data_t *data, 
> igt_crtc_t *crtc) igt_remove_fb(data->drm_fd, &primary_fb);
>   }
>   
> -static void test_planar_settings(data_t *data)
> +static igt_plane_t *
> +planar_test_setup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>   {
> -	igt_display_t *display = &data->display;
> -	igt_crtc_t *crtc;
> -	igt_output_t *output;
> -	igt_fb_t fb, fb_ref;
> -	igt_plane_t *primary;
> -	igt_crc_t crc, crc_ref;
> -	int devid;
> -	int display_ver = -1;
> +	igt_display_reset(&data->display);
> +	igt_output_set_crtc(output, crtc);
> +	igt_display_commit_atomic(&data->display,
> +				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	return igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +}
> +
> +static void
> +test_nv12_odd_width(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> +		    int display_ver)
> +{
> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
> +	igt_fb_t fb;
> +	int expected_rval = display_ver >= 20 ? 0 : -EINVAL;
>   	int rval;
> -	bool is_vkms = false;
>   
> -	/*
> -	 * If here is added non-intel tests below require will need to be
> -	 * changed to if(..)
> -	 */
> -	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
> -	if (is_intel_device(data->drm_fd)) {
> -		igt_require_intel(data->drm_fd);
> -		devid = intel_get_drm_devid(data->drm_fd);
> -		igt_require(intel_display_ver(devid) >= 9);
> -		display_ver = intel_display_ver(devid);
> -		igt_require(display_ver >= 9);
> -	} else if (is_vkms_device(data->drm_fd)) {
> -		is_vkms = true;
> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> +				      DRM_FORMAT_MOD_LINEAR)) {
> +		igt_debug("Odd width NV12 test skipped - format/mod not supported\n");
> +		return;
>   	}
>   
> -	crtc = igt_first_crtc_with_single_output(display, &output);
> +	igt_create_fb(data->drm_fd, 257, 256,
> +		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	rval = igt_display_try_commit_atomic(&data->display,
> +					     DRM_MODE_ATOMIC_ALLOW_MODESET |
> +					     DRM_MODE_ATOMIC_TEST_ONLY,
> +					     NULL);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_assert_f(rval == expected_rval,
> +		     "Odd width NV12 framebuffer: got %d, expected %d\n",
> +		     rval, expected_rval);
> +}
>   
> -	igt_output_set_crtc(output, crtc);
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +static void
> +test_nv12_odd_height(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> +		     int display_ver)
> +{
> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
> +	igt_fb_t fb;
> +	int expected_rval = (display_ver >= 20 && display_ver < 35) ? 0 : -EINVAL;
> +	int rval;
>   
> -	igt_display_commit_atomic(&data->display,
> -				  DRM_MODE_ATOMIC_ALLOW_MODESET,
> -				  NULL);
> -	/* test against intel_plane_check_src_coordinates() in i915 */
> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> -				     DRM_FORMAT_MOD_LINEAR)) {
> -		int expected_rval = -EINVAL;
> -
> -		if (display_ver >= 20 || is_vkms)
> -			expected_rval = 0;
> -
> -		igt_create_fb(data->drm_fd, 257, 256,
> -			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> -		igt_plane_set_fb(primary, &fb);
> -		rval = igt_display_try_commit_atomic(&data->display,
> -						     DRM_MODE_ATOMIC_ALLOW_MODESET |
> -						     DRM_MODE_ATOMIC_TEST_ONLY,
> -						     NULL);
> -		igt_remove_fb(data->drm_fd, &fb);
> -		igt_assert_f(rval == expected_rval, "Odd width NV12 framebuffer\n");
> -	} else {
> -		igt_debug("Odd width NV12 framebuffer test skipped\n");
> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> +				      DRM_FORMAT_MOD_LINEAR)) {
> +		igt_debug("Odd height NV12 test skipped - format/mod not supported\n");
> +		return;
> +	}
> +
> +	igt_create_fb(data->drm_fd, 256, 257,
> +		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	rval = igt_display_try_commit_atomic(&data->display,
> +					     DRM_MODE_ATOMIC_ALLOW_MODESET |
> +					     DRM_MODE_ATOMIC_TEST_ONLY,
> +					     NULL);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_assert_f(rval == expected_rval,
> +		     "Odd height NV12 framebuffer: got %d, expected %d\n",
> +		     rval, expected_rval);
> +}
> +
> +static void
> +test_nv12_odd_horizontal_pan(data_t *data, igt_crtc_t *crtc,
> +			     igt_output_t *output, int display_ver)
> +{
> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
> +	igt_fb_t fb;
> +	int expected_rval = display_ver >= 35 ? 0 : -EINVAL;
> +	int rval;
> +
> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> +				      DRM_FORMAT_MOD_LINEAR)) {
> +		igt_debug("Odd h-pan NV12 test skipped - format/mod not supported\n");
> +		return;
>   	}
>   
> -	/* test against intel_plane_check_src_coordinates() in i915 */
> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> -				     DRM_FORMAT_MOD_LINEAR)) {
> -		int expected_rval = -EINVAL;
> +	igt_create_fb(data->drm_fd, 810, 590,
> +		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	igt_plane_set_size(primary, 810, 590);
> +	igt_plane_set_position(primary, -501, 200);
> +	rval = igt_display_try_commit_atomic(&data->display,
> +					     DRM_MODE_ATOMIC_ALLOW_MODESET |
> +					     DRM_MODE_ATOMIC_TEST_ONLY,
> +					     NULL);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_assert_f(rval == expected_rval,
> +		     "Odd horizontal pan NV12 framebuffer: got %d, expected %d\n",
> +		     rval, expected_rval);
> +}
Observed some peace of code is repeated multiple times. Move the 
duplicates into single function.
>   
> -		if ((display_ver >= 20 && display_ver < 35) || is_vkms)
> -			expected_rval = 0;
> +static void
> +test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
> +			   igt_output_t *output, int display_ver)
> +{
> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
> +	igt_fb_t fb, fb_ref;
> +	igt_crc_t crc, crc_ref;
> +	int expected_rval = (display_ver >= 20 && display_ver < 35) ? 0 : -EINVAL;
> +	int rval;
>   
> -		igt_create_fb(data->drm_fd, 256, 257,
> -			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> -		igt_plane_set_fb(primary, &fb);
> -		rval = igt_display_try_commit_atomic(&data->display,
> -						     DRM_MODE_ATOMIC_ALLOW_MODESET |
> -						     DRM_MODE_ATOMIC_TEST_ONLY,
> -						     NULL);
> -		igt_remove_fb(data->drm_fd, &fb);
> -		igt_assert_f(rval == expected_rval, "Odd height NV12 framebuffer\n");
> -	} else {
> -		igt_debug("Odd height NV12 framebuffer test skipped\n");
> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
> +				      DRM_FORMAT_MOD_LINEAR)) {
> +		igt_debug("Odd v-pan P016 test skipped - format/mod not supported\n");
> +		return;
>   	}
>   
> -	/* test against intel_plane_check_src_coordinates() in i915 */
> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> -				     DRM_FORMAT_MOD_LINEAR)) {
> -		int expected_rval = -EINVAL;
> +	igt_create_color_fb(data->drm_fd, 256, 260,
> +			    DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 0.0, 1.0, &fb);
>   
> -		if (display_ver >= 35 || is_vkms)
> -			expected_rval = 0;
> +	igt_plane_set_fb(primary, &fb);
> +	igt_plane_set_position(primary, 1, 1);
> +	igt_plane_set_size(primary, 256, 256);
> +	igt_fb_set_position(&fb, primary, 0, 3);
> +	igt_fb_set_size(&fb, primary, 256, 256);
> +
> +	rval = igt_display_try_commit_atomic(&data->display,
> +					     DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					     NULL);
> +	if (rval == 0) {
> +		set_legacy_lut(data, crtc, LUT_MASK);
> +		igt_wait_for_vblank_count(crtc, 1);
> +
> +		data->pipe_crc = igt_crtc_crc_new(crtc,
> +						  IGT_PIPE_CRC_SOURCE_AUTO);
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
> +
> +		/* reference: plain blue XRGB8888 of the same visible size */
> +		igt_create_color_fb(data->drm_fd, 256, 256,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +				    0.0, 0.0, 1.0, &fb_ref);
> +		igt_plane_set_fb(primary, &fb_ref);
> +		rval = igt_display_try_commit_atomic(&data->display,
> +						     DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						     NULL);
>   
> -		igt_create_fb(data->drm_fd, 810, 590,
> -			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> -		igt_plane_set_fb(primary, &fb);
> -		igt_plane_set_size(primary, 810, 590);
> -		igt_plane_set_position(primary, -501, 200);
> -		rval = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET |
> -						     DRM_MODE_ATOMIC_TEST_ONLY, NULL);
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
> +		set_legacy_lut(data, crtc, 0xffff);
Required igt_wait_for_vblank_count(crtc, 1) to restore the LUT and 
instead of magic number create a macro.
> +		igt_pipe_crc_free(data->pipe_crc);
> +		data->pipe_crc = NULL;
>   
> -		igt_remove_fb(data->drm_fd, &fb);
> -		igt_assert_f(rval == expected_rval, "Odd horizontal pan NV12 framebuffer\n");
> +		igt_plane_set_fb(primary, NULL);
> +		igt_remove_fb(data->drm_fd, &fb_ref);
> +		igt_assert_crc_equal(&crc_ref, &crc);
>   	} else {
> -		igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
> +		igt_plane_set_fb(primary, NULL);
>   	}
>   
> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
> -					    DRM_FORMAT_MOD_LINEAR)) {
> -		int expected_rval = -EINVAL;
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_assert_f(rval == expected_rval,
> +		     "Odd vertical pan P016 framebuffer: got %d, expected %d\n",
> +		     rval, expected_rval);
> +}
>   
> -		if ((display_ver >= 20 && display_ver < 35) || is_vkms)
> -			expected_rval = 0;
> +static void test_planar_settings(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_crtc_t *crtc;
> +	igt_output_t *output;
> +	int display_ver;
>   
> -		igt_create_color_fb(data->drm_fd, 256, 260,
> -			      DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
> -			      0.0, 0.0, 1.0,
> -			      &fb);
> +	igt_require(display->is_atomic);
>   
> -		igt_plane_set_fb(primary, &fb);
> -		igt_plane_set_position(primary, 1, 1);
> -		igt_plane_set_size(primary, 256, 256);
> +	/* All sub-tests below are Intel-specific. */
> +	igt_require_intel(data->drm_fd);
> +	display_ver = intel_display_ver(intel_get_drm_devid(data->drm_fd));
> +	igt_require(display_ver >= 9);
>   
> -		/* set odd v pan and check with crc fb didn't break */
> -		igt_fb_set_position(&fb, primary, 0, 3);
> -		igt_fb_set_size(&fb, primary, 256, 256);
> -		rval = igt_display_try_commit_atomic(&data->display,
> -						     DRM_MODE_ATOMIC_ALLOW_MODESET,
> -						     NULL);
> -		if (rval == 0) {
> -			set_legacy_lut(data,
> -				       crtc,
> -				       LUT_MASK);
> -			igt_wait_for_vblank_count(crtc,
> -						  1);
> -			data->pipe_crc = igt_crtc_crc_new(crtc,
> -							  IGT_PIPE_CRC_SOURCE_AUTO);
> -			igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
> -
> -			igt_create_color_fb(data->drm_fd, 256, 256,
> -				DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -				0.0, 0.0, 1.0,
> -				&fb_ref);
> -
> -			igt_plane_set_fb(primary, &fb_ref);
> -			rval = igt_display_try_commit_atomic(&data->display,
> -						     DRM_MODE_ATOMIC_ALLOW_MODESET,
> -						     NULL);
> +	crtc = igt_first_crtc_with_single_output(display, &output);
> +	igt_require_f(crtc, "No suitable output/crtc pair found\n");
>   
> -			igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
> -			set_legacy_lut(data,
> -				       crtc,
> -				       0xffff);
> +	igt_dynamic("nv12-odd-width")
> +		test_nv12_odd_width(data, crtc, output, display_ver);
>   
> -			igt_pipe_crc_free(data->pipe_crc);
> -			data->pipe_crc = NULL;
> +	igt_dynamic("nv12-odd-height")
> +		test_nv12_odd_height(data, crtc, output, display_ver);
>   
> -			igt_remove_fb(data->drm_fd, &fb_ref);
> -			igt_assert_crc_equal(&crc_ref, &crc);
> -		}
> +	igt_dynamic("nv12-odd-horizontal-pan")
> +		test_nv12_odd_horizontal_pan(data, crtc, output, display_ver);
>   
> -		igt_remove_fb(data->drm_fd, &fb);
> -		igt_assert_f(rval == expected_rval, "Odd vertical pan P016 framebuffer\n");
> -	} else {
> -		igt_debug("Odd vertical pan P016 framebuffer test skipped\n");
> -	}
> +	igt_dynamic("p016-odd-vertical-pan")
> +		test_p016_odd_vertical_pan(data, crtc, output, display_ver);
>   }
>   
>   static bool is_pipe_limit_reached(int count)
> @@ -1621,8 +1670,9 @@ run_tests_for_pipe_plane(data_t *data)
>   		run_test(data, dynamic_test_handler);
>   	}
>   
> -	igt_describe("verify planar settings for pixel format are accepted or rejected correctly");
> -	igt_subtest_f("planar-pixel-format-settings")
> +	igt_describe("verify planar pixel format settings are accepted or rejected correctly"
> +		     " on Intel hardware");
> +	igt_subtest_with_dynamic_f("planar-pixel-format-settings")
>   		test_planar_settings(data);
>   }
>   
--------------U9VC4dxkQ2ZO0Xu2LlRpo2jt
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi JP,</p>
    <div class="moz-cite-prefix">On 4/24/2026 10:41 PM, Juha-Pekka
      Heikkila wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260424171123.3963793-2-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">Separate different planar pixel format tests onto their own dynamic subtests
to make it easier for debugging. All tests here are only testing Intel
hw related restrictions hence it make zero sense to run this on vkms or
other drivers. I added back the original limitation to make these Intel only.</pre>
    </blockquote>
    observe the commit message styling issue<br>
    WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line.
    <blockquote type="cite" cite="mid:20260424171123.3963793-2-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Juha-Pekka Heikkila <a class="moz-txt-link-rfc2396E" href="mailto:juhapekka.heikkila@gmail.com">&lt;juhapekka.heikkila@gmail.com&gt;</a>
---
 tests/kms_plane.c | 322 ++++++++++++++++++++++++++--------------------
 1 file changed, 186 insertions(+), 136 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 7962c733a..6c08f1de8 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -41,8 +41,25 @@
 #include &quot;xe/xe_query.h&quot;
 
 /**
- * SUBTEST: planar-pixel-format-settings
- * Description: verify planar settings for pixel format are handled correctly
+ * SUBTEST: planar-pixel-format-settings@nv12-odd-width
+ * Description: Verify odd-width (257px) NV12 framebuffer is rejected by the
+ *              kernel on Intel hardware (display ver &lt; 20 expects -EINVAL).
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: planar-pixel-format-settings@nv12-odd-height
+ * Description: Verify odd-height (257px) NV12 framebuffer is rejected by the
+ *              kernel on Intel hardware (display ver &lt; 20 or &gt;= 35 expects -EINVAL).
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: planar-pixel-format-settings@nv12-odd-horizontal-pan
+ * Description: Verify odd horizontal pan on NV12 framebuffer is rejected by
+ *              the kernel on Intel hardware (display ver <a class="moz-txt-link-rfc2396E" href="mailto:35expects-EINVAL).+*Driverrequirement:i915,xe+*+*SUBTEST:planar-pixel-format-settings@p016-odd-vertical-pan+*Description:VerifyoddverticalpanonP016framebufferandcheckCRC+*matchesareferenceXRGB8888bluefillonIntelhardware.+*Driverrequirement:i915,xe**SUBTEST:plane-position-%s*Description:Verifyplanepositionusingtwoplanestocreatea%arg[1]@@-1354,165+1371,197@@test_pixel_formats(data_t*data,igt_crtc_t*crtc)igt_remove_fb(data-">&lt; 35 expects -EINVAL).
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: planar-pixel-format-settings@p016-odd-vertical-pan
+ * Description: Verify odd vertical pan on P016 framebuffer and check CRC
+ *              matches a reference XRGB8888 blue fill on Intel hardware.
+ * Driver requirement: i915, xe
  *
  * SUBTEST: plane-position-%s
  * Description: Verify plane position using two planes to create a %arg[1]
@@ -1354,165 +1371,197 @@ test_pixel_formats(data_t *data, igt_crtc_t *crtc)
 	igt_remove_fb(data-&gt;</a>drm_fd, &amp;primary_fb);
 }
 
-static void test_planar_settings(data_t *data)
+static igt_plane_t *
+planar_test_setup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
-	igt_display_t *display = &amp;data-&gt;display;
-	igt_crtc_t *crtc;
-	igt_output_t *output;
-	igt_fb_t fb, fb_ref;
-	igt_plane_t *primary;
-	igt_crc_t crc, crc_ref;
-	int devid;
-	int display_ver = -1;
+	igt_display_reset(&amp;data-&gt;display);
+	igt_output_set_crtc(output, crtc);
+	igt_display_commit_atomic(&amp;data-&gt;display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	return igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+}
+
+static void
+test_nv12_odd_width(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+		    int display_ver)
+{
+	igt_plane_t *primary = planar_test_setup(data, crtc, output);
+	igt_fb_t fb;
+	int expected_rval = display_ver &gt;= 20 ? 0 : -EINVAL;
 	int rval;
-	bool is_vkms = false;
 
-	/*
-	 * If here is added non-intel tests below require will need to be
-	 * changed to if(..)
-	 */
-	igt_require_f(data-&gt;display.is_atomic, &quot;Atomic mode-set not supported\n&quot;);
-	if (is_intel_device(data-&gt;drm_fd)) {
-		igt_require_intel(data-&gt;drm_fd);
-		devid = intel_get_drm_devid(data-&gt;drm_fd);
-		igt_require(intel_display_ver(devid) &gt;= 9);
-		display_ver = intel_display_ver(devid);
-		igt_require(display_ver &gt;= 9);
-	} else if (is_vkms_device(data-&gt;drm_fd)) {
-		is_vkms = true;
+	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+				      DRM_FORMAT_MOD_LINEAR)) {
+		igt_debug(&quot;Odd width NV12 test skipped - format/mod not supported\n&quot;);
+		return;
 	}
 
-	crtc = igt_first_crtc_with_single_output(display, &amp;output);
+	igt_create_fb(data-&gt;drm_fd, 257, 256,
+		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &amp;fb);
+	igt_plane_set_fb(primary, &amp;fb);
+	rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
+					     DRM_MODE_ATOMIC_ALLOW_MODESET |
+					     DRM_MODE_ATOMIC_TEST_ONLY,
+					     NULL);
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data-&gt;drm_fd, &amp;fb);
+	igt_assert_f(rval == expected_rval,
+		     &quot;Odd width NV12 framebuffer: got %d, expected %d\n&quot;,
+		     rval, expected_rval);
+}
 
-	igt_output_set_crtc(output, crtc);
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+static void
+test_nv12_odd_height(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+		     int display_ver)
+{
+	igt_plane_t *primary = planar_test_setup(data, crtc, output);
+	igt_fb_t fb;
+	int expected_rval = (display_ver &gt;= 20 &amp;&amp; display_ver &lt; 35) ? 0 : -EINVAL;
+	int rval;
 
-	igt_display_commit_atomic(&amp;data-&gt;display,
-				  DRM_MODE_ATOMIC_ALLOW_MODESET,
-				  NULL);
-	/* test against intel_plane_check_src_coordinates() in i915 */
-	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
-				     DRM_FORMAT_MOD_LINEAR)) {
-		int expected_rval = -EINVAL;
-
-		if (display_ver &gt;= 20 || is_vkms)
-			expected_rval = 0;
-
-		igt_create_fb(data-&gt;drm_fd, 257, 256,
-			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &amp;fb);
-		igt_plane_set_fb(primary, &amp;fb);
-		rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET |
-						     DRM_MODE_ATOMIC_TEST_ONLY,
-						     NULL);
-		igt_remove_fb(data-&gt;drm_fd, &amp;fb);
-		igt_assert_f(rval == expected_rval, &quot;Odd width NV12 framebuffer\n&quot;);
-	} else {
-		igt_debug(&quot;Odd width NV12 framebuffer test skipped\n&quot;);
+	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+				      DRM_FORMAT_MOD_LINEAR)) {
+		igt_debug(&quot;Odd height NV12 test skipped - format/mod not supported\n&quot;);
+		return;
+	}
+
+	igt_create_fb(data-&gt;drm_fd, 256, 257,
+		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &amp;fb);
+	igt_plane_set_fb(primary, &amp;fb);
+	rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
+					     DRM_MODE_ATOMIC_ALLOW_MODESET |
+					     DRM_MODE_ATOMIC_TEST_ONLY,
+					     NULL);
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data-&gt;drm_fd, &amp;fb);
+	igt_assert_f(rval == expected_rval,
+		     &quot;Odd height NV12 framebuffer: got %d, expected %d\n&quot;,
+		     rval, expected_rval);
+}
+
+static void
+test_nv12_odd_horizontal_pan(data_t *data, igt_crtc_t *crtc,
+			     igt_output_t *output, int display_ver)
+{
+	igt_plane_t *primary = planar_test_setup(data, crtc, output);
+	igt_fb_t fb;
+	int expected_rval = display_ver &gt;= 35 ? 0 : -EINVAL;
+	int rval;
+
+	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+				      DRM_FORMAT_MOD_LINEAR)) {
+		igt_debug(&quot;Odd h-pan NV12 test skipped - format/mod not supported\n&quot;);
+		return;
 	}
 
-	/* test against intel_plane_check_src_coordinates() in i915 */
-	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
-				     DRM_FORMAT_MOD_LINEAR)) {
-		int expected_rval = -EINVAL;
+	igt_create_fb(data-&gt;drm_fd, 810, 590,
+		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &amp;fb);
+	igt_plane_set_fb(primary, &amp;fb);
+	igt_plane_set_size(primary, 810, 590);
+	igt_plane_set_position(primary, -501, 200);
+	rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
+					     DRM_MODE_ATOMIC_ALLOW_MODESET |
+					     DRM_MODE_ATOMIC_TEST_ONLY,
+					     NULL);
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data-&gt;drm_fd, &amp;fb);
+	igt_assert_f(rval == expected_rval,
+		     &quot;Odd horizontal pan NV12 framebuffer: got %d, expected %d\n&quot;,
+		     rval, expected_rval);
+}</pre>
    </blockquote>
    Observed some peace of code is repeated multiple times. Move the
    duplicates into single function.
    <blockquote type="cite" cite="mid:20260424171123.3963793-2-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">
 
-		if ((display_ver &gt;= 20 &amp;&amp; display_ver &lt; 35) || is_vkms)
-			expected_rval = 0;
+static void
+test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
+			   igt_output_t *output, int display_ver)
+{
+	igt_plane_t *primary = planar_test_setup(data, crtc, output);
+	igt_fb_t fb, fb_ref;
+	igt_crc_t crc, crc_ref;
+	int expected_rval = (display_ver &gt;= 20 &amp;&amp; display_ver &lt; 35) ? 0 : -EINVAL;
+	int rval;
 
-		igt_create_fb(data-&gt;drm_fd, 256, 257,
-			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &amp;fb);
-		igt_plane_set_fb(primary, &amp;fb);
-		rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET |
-						     DRM_MODE_ATOMIC_TEST_ONLY,
-						     NULL);
-		igt_remove_fb(data-&gt;drm_fd, &amp;fb);
-		igt_assert_f(rval == expected_rval, &quot;Odd height NV12 framebuffer\n&quot;);
-	} else {
-		igt_debug(&quot;Odd height NV12 framebuffer test skipped\n&quot;);
+	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
+				      DRM_FORMAT_MOD_LINEAR)) {
+		igt_debug(&quot;Odd v-pan P016 test skipped - format/mod not supported\n&quot;);
+		return;
 	}
 
-	/* test against intel_plane_check_src_coordinates() in i915 */
-	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
-				     DRM_FORMAT_MOD_LINEAR)) {
-		int expected_rval = -EINVAL;
+	igt_create_color_fb(data-&gt;drm_fd, 256, 260,
+			    DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
+			    0.0, 0.0, 1.0, &amp;fb);
 
-		if (display_ver &gt;= 35 || is_vkms)
-			expected_rval = 0;
+	igt_plane_set_fb(primary, &amp;fb);
+	igt_plane_set_position(primary, 1, 1);
+	igt_plane_set_size(primary, 256, 256);
+	igt_fb_set_position(&amp;fb, primary, 0, 3);
+	igt_fb_set_size(&amp;fb, primary, 256, 256);
+
+	rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
+					     DRM_MODE_ATOMIC_ALLOW_MODESET,
+					     NULL);
+	if (rval == 0) {
+		set_legacy_lut(data, crtc, LUT_MASK);
+		igt_wait_for_vblank_count(crtc, 1);
+
+		data-&gt;pipe_crc = igt_crtc_crc_new(crtc,
+						  IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc);
+
+		/* reference: plain blue XRGB8888 of the same visible size */
+		igt_create_color_fb(data-&gt;drm_fd, 256, 256,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    0.0, 0.0, 1.0, &amp;fb_ref);
+		igt_plane_set_fb(primary, &amp;fb_ref);
+		rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
+						     DRM_MODE_ATOMIC_ALLOW_MODESET,
+						     NULL);
 
-		igt_create_fb(data-&gt;drm_fd, 810, 590,
-			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &amp;fb);
-		igt_plane_set_fb(primary, &amp;fb);
-		igt_plane_set_size(primary, 810, 590);
-		igt_plane_set_position(primary, -501, 200);
-		rval = igt_display_try_commit_atomic(&amp;data-&gt;display, DRM_MODE_ATOMIC_ALLOW_MODESET |
-						     DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+		igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc_ref);
+		set_legacy_lut(data, crtc, 0xffff);</pre>
    </blockquote>
    Required&nbsp;&nbsp;<span style="white-space: pre-wrap">igt_wait_for_vblank_count(crtc, 1)</span>&nbsp;to
    restore the LUT and instead of magic number create a macro.&nbsp;&nbsp;
    <blockquote type="cite" cite="mid:20260424171123.3963793-2-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">
+		igt_pipe_crc_free(data-&gt;pipe_crc);
+		data-&gt;pipe_crc = NULL;
 
-		igt_remove_fb(data-&gt;drm_fd, &amp;fb);
-		igt_assert_f(rval == expected_rval, &quot;Odd horizontal pan NV12 framebuffer\n&quot;);
+		igt_plane_set_fb(primary, NULL);
+		igt_remove_fb(data-&gt;drm_fd, &amp;fb_ref);
+		igt_assert_crc_equal(&amp;crc_ref, &amp;crc);
 	} else {
-		igt_debug(&quot;Odd horizontal pan NV12 framebuffer test skipped\n&quot;);
+		igt_plane_set_fb(primary, NULL);
 	}
 
-	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
-					    DRM_FORMAT_MOD_LINEAR)) {
-		int expected_rval = -EINVAL;
+	igt_remove_fb(data-&gt;drm_fd, &amp;fb);
+	igt_assert_f(rval == expected_rval,
+		     &quot;Odd vertical pan P016 framebuffer: got %d, expected %d\n&quot;,
+		     rval, expected_rval);
+}
 
-		if ((display_ver &gt;= 20 &amp;&amp; display_ver &lt; 35) || is_vkms)
-			expected_rval = 0;
+static void test_planar_settings(data_t *data)
+{
+	igt_display_t *display = &amp;data-&gt;display;
+	igt_crtc_t *crtc;
+	igt_output_t *output;
+	int display_ver;
 
-		igt_create_color_fb(data-&gt;drm_fd, 256, 260,
-			      DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
-			      0.0, 0.0, 1.0,
-			      &amp;fb);
+	igt_require(display-&gt;is_atomic);
 
-		igt_plane_set_fb(primary, &amp;fb);
-		igt_plane_set_position(primary, 1, 1);
-		igt_plane_set_size(primary, 256, 256);
+	/* All sub-tests below are Intel-specific. */
+	igt_require_intel(data-&gt;drm_fd);
+	display_ver = intel_display_ver(intel_get_drm_devid(data-&gt;drm_fd));
+	igt_require(display_ver &gt;= 9);
 
-		/* set odd v pan and check with crc fb didn't break */
-		igt_fb_set_position(&amp;fb, primary, 0, 3);
-		igt_fb_set_size(&amp;fb, primary, 256, 256);
-		rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET,
-						     NULL);
-		if (rval == 0) {
-			set_legacy_lut(data,
-				       crtc,
-				       LUT_MASK);
-			igt_wait_for_vblank_count(crtc,
-						  1);
-			data-&gt;pipe_crc = igt_crtc_crc_new(crtc,
-							  IGT_PIPE_CRC_SOURCE_AUTO);
-			igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc);
-
-			igt_create_color_fb(data-&gt;drm_fd, 256, 256,
-				DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-				0.0, 0.0, 1.0,
-				&amp;fb_ref);
-
-			igt_plane_set_fb(primary, &amp;fb_ref);
-			rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET,
-						     NULL);
+	crtc = igt_first_crtc_with_single_output(display, &amp;output);
+	igt_require_f(crtc, &quot;No suitable output/crtc pair found\n&quot;);
 
-			igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc_ref);
-			set_legacy_lut(data,
-				       crtc,
-				       0xffff);
+	igt_dynamic(&quot;nv12-odd-width&quot;)
+		test_nv12_odd_width(data, crtc, output, display_ver);
 
-			igt_pipe_crc_free(data-&gt;pipe_crc);
-			data-&gt;pipe_crc = NULL;
+	igt_dynamic(&quot;nv12-odd-height&quot;)
+		test_nv12_odd_height(data, crtc, output, display_ver);
 
-			igt_remove_fb(data-&gt;drm_fd, &amp;fb_ref);
-			igt_assert_crc_equal(&amp;crc_ref, &amp;crc);
-		}
+	igt_dynamic(&quot;nv12-odd-horizontal-pan&quot;)
+		test_nv12_odd_horizontal_pan(data, crtc, output, display_ver);
 
-		igt_remove_fb(data-&gt;drm_fd, &amp;fb);
-		igt_assert_f(rval == expected_rval, &quot;Odd vertical pan P016 framebuffer\n&quot;);
-	} else {
-		igt_debug(&quot;Odd vertical pan P016 framebuffer test skipped\n&quot;);
-	}
+	igt_dynamic(&quot;p016-odd-vertical-pan&quot;)
+		test_p016_odd_vertical_pan(data, crtc, output, display_ver);
 }
 
 static bool is_pipe_limit_reached(int count)
@@ -1621,8 +1670,9 @@ run_tests_for_pipe_plane(data_t *data)
 		run_test(data, dynamic_test_handler);
 	}
 
-	igt_describe(&quot;verify planar settings for pixel format are accepted or rejected correctly&quot;);
-	igt_subtest_f(&quot;planar-pixel-format-settings&quot;)
+	igt_describe(&quot;verify planar pixel format settings are accepted or rejected correctly&quot;
+		     &quot; on Intel hardware&quot;);
+	igt_subtest_with_dynamic_f(&quot;planar-pixel-format-settings&quot;)
 		test_planar_settings(data);
 }
 
</pre>
    </blockquote>
  </body>
</html>

--------------U9VC4dxkQ2ZO0Xu2LlRpo2jt--
