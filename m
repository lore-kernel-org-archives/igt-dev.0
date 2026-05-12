Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B12CD37AC
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 04:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A4010E23E;
	Tue, 12 May 2026 04:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ct9ydVla";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BBA10E23E
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 04:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778561163; x=1810097163;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UbJHJlAAXk4YsxcGvgGjSrTdcmSTX8ObCMEL3vpjjgo=;
 b=Ct9ydVlaqHx34S4k3dzwbCCZdtjptKdqns0POxwHUb05vtOxt0Vc1wwB
 CnLxezjGgdMLWeO7TXDOSoU+rmtekGZQTWXhzMlaOfBm03ncKJrgp6xHJ
 nctMSz7xe+0zRxjOVeat8I50KToME+6ZuxTk7pmBBE4iB5gdSvZY80GVB
 ne/1ByyYYrJDSP+EqYX0XH/l+Vx61PJ1exgNZFd2UhVSbD4Ojnsfwwg35
 73OYJT8itPDobiqcjTXcr3mPF8CbhdP3bJCG+ZjK+uixUf8PHv7mnb80E
 5QINH0KyShR425OcS3w6gB1Xl0UL0nqpETDW20HUtZT/xwuDdOhCDHc53 Q==;
X-CSE-ConnectionGUID: gXmobfthS2asGX2zrKobQA==
X-CSE-MsgGUID: PbmTluhYQKmrwoLf6NDwsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79409170"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79409170"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 21:46:02 -0700
X-CSE-ConnectionGUID: CIarAK9/RaemBQdUJFchZw==
X-CSE-MsgGUID: dMnrUUa5TVi8YWna+m7lPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="275777097"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 21:46:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 21:46:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 21:46:02 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 21:46:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nedXv6XeYDyYZ6JOl80AJb482t2xbXwZ7uT/5BQpn0bypFG0q6PSfBm3+xHASxCqnxjqKgiG9TdgGZaD9xSCp/MkXSbjwpfUOmz74F8xdCo863EfPuqNje6Ii9DMxcnGN830gnL5KcvpQsp04iG/i7HKom4qZU5eZR59RySw0F3sBRqw1YW/3dGyCOwAEZwTapfj/tO99vRUsXYTXufy8hYjN3DA1H//5WgxXr28Kfmc1Pihox4S2jYF7+k+d+i800GoU3DZ/8DOaE69WRRY45QFapW3gyYsY3/nPdBXY+TC8+GnvUiWYVQw6P1HcCIDFg10kWza+MeD2lb99K7KZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1T4Ip30tTFLVg6Utp7EEFh8NOk79aibj817fwdzKro=;
 b=jM25R23RcxHcCUkuJRoyRcvGG5Yyiq0qRLX0ZgzAC+ihd36CqcSLKtZ8kfhdNCSS9ke/EuQrGemmfD9eLbbYvpzhvwTtJ4bAz87XGqqZAFlLkQ0cEiOPSMjHgMs/xHmqoUqDr/9cnAK9DV8G/rOpYMSkwPyi0Z7uyehCbbcSmhdh2Z0/bE7KGd3ufKhGxBVzjDIDCAXvv7kf9MbhuRAb2fSXgkRpu+gODPX9G9eKEMw/Wsa/iE5Ys8XCU1VbfKpTeZuRjB1HvmkzBwz3LU9KlL0wr4pi0bwBDGupLVcFLR4eTqno1MEXdhxPCxGg52M2rAonytsijzuy5p2q5RY0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DS7PR11MB7740.namprd11.prod.outlook.com (2603:10b6:8:e0::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.23; Tue, 12 May 2026 04:46:00 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 04:46:00 +0000
Message-ID: <2deace3e-c9a0-464d-bd95-7a669f49f9cb@intel.com>
Date: Tue, 12 May 2026 10:15:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_content_protection: Group all MST
 force_hdcp14 tests together
To: Suraj Kandpal <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260511034137.93127-1-suraj.kandpal@intel.com>
 <20260511034137.93127-3-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260511034137.93127-3-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::10) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|DS7PR11MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d210d6-8ce9-43f7-7b74-08deafe15d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|11063799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Z168Xo1Ak4dpLr0a+W1h6OCwa/QgA9PLTldOnUMU5gYiJKnqi5G/nUdzgsz8NHxgyVORTctUemXRKOinyxoI7twFAddlw3Re3EbHDFIBgYPxcC7priDZtUHVRh6RRoClYQuljjgoVdiAgQOxcclT+GUh3ZvU7SkGgdoBqfb9LxwxQYzQ4GImsMIe0IjTjJNjalLIe9V5dIpFZK2JHA9HvPtwwjn6US/2Vusk7zyEPvYLa2FHCN5tleIvI186yBjJ5yOg6mToBtfFsCqiwG850JBiJ1KzkznQQdxjv7o5WFWJmyzJof/Xq/wD2jhFL5itJtfha5iM2cEzRjdN8K92gU43MKq7K4Ip6TDwRxSuLBwNXw++6SdkIqNCmOEj+IWa9GF5cMcDmOdkLiDrM5dVBgQFAY/kaprjfpcFW/71IjHPN7RU5AFw00DQew71zVUIsGRv3Dzq2uuCJ/vZmZI3DR4SpY9jzu6vlVeFhvRPHqxZwm4PoXthGrCXsfCrGJVRisyk7P7eYLp6XGmehpEHEzy9qE+Z+z/iM27XrJq4QRwj9DhCYxJ5BCmVoFE4MkwfdDCteYFyYU3VDNKZNAIruq0lS6G3YQuMejrVxlYKvfCkCrjMrOKLLaT2b4RR4lkYbCCXcxIuG9O9J9+BTX0FnKAl+kmyS3TgpO/iIu3GBEQSvdZvyu439b/yBIDZkxvZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(11063799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG1NbjV4U2tBTDZJMkc3akRtNHVGYUd4SUdiMU1PNkhzQVNEWVFkVmNlYTlD?=
 =?utf-8?B?ajBTVSsyKzY3ZGxPNTQ1a3VsZFgxTmpPMTRtSk11alBNQkl2d084bjFOdVFM?=
 =?utf-8?B?cjg4aXpDK1RGRzN1WkhGbjJVNE9DdzU3VVR4TVowY1gyclM0VUNkM0FHK0Fk?=
 =?utf-8?B?MkJ2WVNYNmEvMTRDb2I3OVBnSHRRUWlHSUtLNEVnTmMvWlAvcy9mbHpSNU4z?=
 =?utf-8?B?RURFSlNuTXQ4VHZidGxsYUV5SXhxUGZpZTQxM3c2VyttUG1YTTlLeWlFSzQz?=
 =?utf-8?B?U29UNlVLYkFjbjc1THFvbm1kZW80UTJ1QlV3UE5WY1BQRTBUYnJuYVlvQmo4?=
 =?utf-8?B?K284V20vT3RlbTdaUGlINExWTmYzL1pZNUthVDl2UXRpa1lZd012N3ZCZENC?=
 =?utf-8?B?VVhjcm9NL05xdUVRdy8zYWMrOWhqSVhTcW5uQ3ZaQzVGanlKV05SbGRGRjVq?=
 =?utf-8?B?WU1aNHp0ZUNaR2tiYTE5TkhhMFNYRC8vdGZCQ2R0ZWg1NTc0YmVXZTIrQVFP?=
 =?utf-8?B?WEtVNG9COWxVUjVBWTdOemhVaHhGejNoT1JRZGVBVFE3ODBkR1JRUGJMdmRO?=
 =?utf-8?B?OVluWnRzazlUczVSZTFOekg3UzBuam9LdE5ucUpMNms1NlVRUUFoLzg3ckZh?=
 =?utf-8?B?RDl3ZDFpbThEQ0NiMmgyNERGOTkxNHJzK0hBdjgzc002MUpCZzZGSmNSWVA1?=
 =?utf-8?B?aE92TnVqM3JYMVlMZExRV1FFY1lWYnJQV0k5c3NCaVF4LzV4TUhrelI0R2dB?=
 =?utf-8?B?SDdodmYzMGlna0pEc0I4UzZDOVFoNzFWQnZiMTRUS052clF2eENzYitUQW5v?=
 =?utf-8?B?VUxxOFZaM2tneWNJZkxub2M3eVBMWnk5T21Hb3JWTVkwWXZ0K09JM3hra3R1?=
 =?utf-8?B?K0s2QlhNd1YvbXZDQ2ZBNmpmemVRRkNCTXhJRGp1ZXFtMExyc1hhRlFFQXIr?=
 =?utf-8?B?MitmUzQ3dk4vS0JIc0lUZ25VVm5DcDlnYkVEZnNSSlgwYzA3Rmp4ZXV0ZzZP?=
 =?utf-8?B?YkkzUFY4Y1pvZXo3YlcwRFRVUUhjQis3M3NaN0xGTU1SbmQxK2lsUjFNdTNI?=
 =?utf-8?B?K0pSZmFQMUdLMjlZQ252N3JVUHk4a0JJV3BaaTVJVks2Ynl1MTg3QzJDVXY5?=
 =?utf-8?B?d1loZlJqZE51Z0gyelNFSU1hSE9KZEtTeUtFMmlKdmlMN1V0eGlrV2ZQNm81?=
 =?utf-8?B?N1Z0UHhxSVJJaWNjOTVUSnc3bjFsM2oyQkNvRUhROHlES2pRazhqelQ2bENS?=
 =?utf-8?B?dFZQQUp0cGQ3cXEzVUI1Nk1JbXJEK1A5dVhtcmxaS2ptWFp5T1JISS9uYk1O?=
 =?utf-8?B?OVFVdDVpUjMxZVRSQnZvbWU1OTZDWU43ejhaQXRkeGZjU2dIN1U4Um9XRnA4?=
 =?utf-8?B?UGFqMjdqSFRDWnJnWTl5aXdYcFY1Qnl3bm1rUW44L3lqbkVld25MSGEzbWRI?=
 =?utf-8?B?TG1oUHBNTDh6Mm9NVFo0cTdJNkJRZDg3RGlaVDh5QzRxWlVBUkFSMUt6MzVv?=
 =?utf-8?B?K1h5MG1hdVJ2b3JEa1N0SnRCSHYrRlZWdmxuM3hVajBmMWwwakd2ZkRyTGEr?=
 =?utf-8?B?alVLWE9tbTdFQlY3RlUwOXRqSFhWcWVZdGg1MldMb092aDA0NVlxeGxQZWg4?=
 =?utf-8?B?RWxpMTc2eUkwSGsycjUzdXhUZm96Z3BXRXZKWjJLalN6OWVHblgzVmswTXJM?=
 =?utf-8?B?TWNkUXhsWk56NThxY0JGeGRHSmhSRnV4SUdzSDdOSHBWWVpaME50cE1HTzF3?=
 =?utf-8?B?MTJ2NzRicEtja09ackVIUnFlNjdFS3NMK1loaW1KUXlZb0NFUW1iMUEzQVc1?=
 =?utf-8?B?WHQ2VEhTZUsxOCt6bTh5c1BueVdBOHhrclJpTi9SWnZNOExlRWtVVnY5cm5H?=
 =?utf-8?B?K0VIRWJtODQyR24wUWZ0VVdSbC85TmJiVEFPc2NCdlZiY242UDFKMWQ1bmp3?=
 =?utf-8?B?N1ZUK1hlTnJDOGliaFhqY1ZzTmlKRVlxZjkxZDZRTGxFdU1uZ2swbHFYNG81?=
 =?utf-8?B?d05SSnJYMTdhQUJaekNDL0hxRVhMbzhlcExNNWVJSS9mWXBwVzVYL2I3alRx?=
 =?utf-8?B?bVY5L2EyL0d4MnlDM1hLNzA2YlJZZXZQcjJkMG5NTU13YndoRGRaNWxFQjcz?=
 =?utf-8?B?RDk0TmI5dVhSd1UrRVpFNFVTdklYSVpKM0dRbkxtdTM2TERJRGRvQnIzVmdp?=
 =?utf-8?B?UUNsb1FyUDk0UHZkbC84YlVaVWJ0cEdhb0NzZVBjTklZOUlZWXAzaSsvbVZ2?=
 =?utf-8?B?ME9sWklYdGRTUWNNN0lhMVNnaFJjUGNOUjdYZlplQmNOckpXQ2s2NzhQbFhz?=
 =?utf-8?B?Q2M4b2V6UEpjNGdGL3NWYUdLVmxsT3dYT2Q5a3BZVW1OdlhwY2lTSjk2OU1W?=
 =?utf-8?Q?7UpvFMiV/B4f09dLRrccMcHLpoB/RnXoDc+Z1?=
X-Exchange-RoutingPolicyChecked: Vh+DEZcFKuQsaushAC9IgBeak4Hd+8lPHe43dCIb56OYTMozbiIKKgn6GwfHsyiuBNytVmoR282xbLnFPI7c8qDqmv2OCQK9xQ2npAewAe/D7QiwH1Z8Z57kg5YtUiIjoIpBzaLHm8DczO23ncNjxUmleqTN8EOgfFEjup4Ex3muwR8XEPp6tlJvFiuPZDYHW97CFxvxEZ2Wny63gLU/94i+Hj0hMxptbYKnkK/4uvoYB9t3hTquWLnpQ1BVk9R7Fe1EdJ37gDPbMAL+hxgS48JZkYYZMlXws/On84iJ/YBnTlz5cb4bU0kBxIG+yOpBeUgjINNOOL+OVTgRRC1ZoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d210d6-8ce9-43f7-7b74-08deafe15d28
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 04:45:59.9659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/MOo0WyfZTW/rUUTJP81nwyi0cMQ7V4aoWD/hNjXXClwn3NnLw9PPuBWWwG1V2yZJTVeIJ2W/dlSmgGMzW9RcnFFQZ3LcX3MBQRW/znAah8pVsxMkY99/Blob3dZJZG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7740
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



On 11-05-2026 09:11, Suraj Kandpal wrote:
> Change ordering of tests so that all force_hdcp14 test are run together,
> that too after all the regular tests have been run.
> Currently we are seeing these tests are putting MST DOCK in a bad state from
> time to time where it can only report HDCP 1.4 after running these
> tests or not reporting any HDCP capability causing test skips.
> The only exception here is the DPMS and suspend resume test which are
> run last since the help MST DOCK to return back to good state.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

LGTM,
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_content_protection.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 3baf225cd..c59441f11 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -1135,28 +1135,16 @@ static const struct {
>   	  .content_type = HDCP_CONTENT_TYPE_0,
>   	  .is_force_hdcp14 = false,
>   	},
> -	{ .desc = "Test Content protection(Type 0) over DP MST with HDCP1.4.",
> -	  .name = "dp-mst-type-0-hdcp14",
> +	{ .desc = "Test Content protection(Type 1) over DP MST.",
> +	  .name = "dp-mst-type-1",
>   	  .cp_tests = 0,
> -	  .content_type = HDCP_CONTENT_TYPE_0,
> -	  .is_force_hdcp14 = true,
> -	},
> -	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
> -	  .name = "dp-mst-lic-type-0",
> -	  .cp_tests = CP_LIC,
> -	  .content_type = HDCP_CONTENT_TYPE_0,
> +	  .content_type = HDCP_CONTENT_TYPE_1,
>   	  .is_force_hdcp14 = false,
>   	},
>   	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
> -	  .name = "dp-mst-lic-type-0-hdcp14",
> +	  .name = "dp-mst-lic-type-0",
>   	  .cp_tests = CP_LIC,
>   	  .content_type = HDCP_CONTENT_TYPE_0,
> -	  .is_force_hdcp14 = true,
> -	},
> -	{ .desc = "Test Content protection(Type 1) over DP MST.",
> -	  .name = "dp-mst-type-1",
> -	  .cp_tests = 0,
> -	  .content_type = HDCP_CONTENT_TYPE_1,
>   	  .is_force_hdcp14 = false,
>   	},
>   	{ .desc = "Test Content protection(Type 1) over DP MST with LIC.",
> @@ -1165,6 +1153,18 @@ static const struct {
>   	  .content_type = HDCP_CONTENT_TYPE_1,
>   	  .is_force_hdcp14 = false,
>   	},
> +	{ .desc = "Test Content protection(Type 0) over DP MST with HDCP1.4.",
> +	  .name = "dp-mst-type-0-hdcp14",
> +	  .cp_tests = 0,
> +	  .content_type = HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 = true,
> +	},
> +	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
> +	  .name = "dp-mst-lic-type-0-hdcp14",
> +	  .cp_tests = CP_LIC,
> +	  .content_type = HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 = true,
> +	},
>   	{ .desc = "Test Content protection(Type 0) over DP MST with suspend resume.",
>   	  .name = "dp-mst-type-0-suspend-resume",
>   	  .cp_tests = SUSPEND_RESUME,

