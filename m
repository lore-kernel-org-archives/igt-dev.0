Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3D8CD5BB4
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 05:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3A010E203;
	Tue, 26 May 2026 05:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5K8huIA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DE610E203
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 05:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779773205; x=1811309205;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=SccG6po1dqRvLstc55mRaPnMuJ93IvXKncOFv1d1ZsM=;
 b=V5K8huIAUikEd1J2VdckPvSXSa6gYUq/qWgXIXA/En9ArID0k20penn5
 kM5rkJ0E+0ctNuDI7WKLLOCknWAbDXG0w1F/M3wGE1auOqmOTIbAAXXDV
 s6XcllJF9OVUH1QRh00WBsNeTCCg5w8NIscQ62WyxT2NorzIvgAyC1AVQ
 AUlzEf5sc7Z400pFQEDnTNaeQylssgEfBQrF/XN2Pbok0fKwerS5HBr9M
 N8R3GH34CgXUz9rEnN86r6r9khgrR+kbKpGBWGZPESlUJEEpq6CIP820F
 t3GWm3YNSNwbIiTnoWnmLroELyqoBVfPWe/Wgg2oY7BRl+fdxN5kyEcN/ A==;
X-CSE-ConnectionGUID: gJ38FnTRQx2xt+4rikMn4A==
X-CSE-MsgGUID: i136t/lERUulOfzrO3STxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91969438"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208,217";a="91969438"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 22:26:44 -0700
X-CSE-ConnectionGUID: xZhsxN/jQ/a3bZFiurE63g==
X-CSE-MsgGUID: uZ8pmE1cS9+5Ynfi8Uv7bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
 d="scan'208,217";a="265662743"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 22:26:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 22:26:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 22:26:44 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 22:26:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rb92VrrfwektoZdRGhxg1SdQQxEFmcEXt9PFJvmAi0X8asvLNRS4WC7KC7Z80t3mpkxmScc535F8dCipE8Y4vy//1+45KpV4KKFAO7bxbMPlMtJJW9FVKWr3P1sQrplwK4c+tpzH4SNg6Q646XrZNJDIP7IZoouaYCkvoLLy96VEvaFfFbszyr5IcA7atlvVOUJE1RCkJbFUBJbsQelruItPJ4BXo+tslMlyfVEHMwOXWs+JpKluJ8dmlvh97WJBtmhCe4i0gaG+wmIiUIolCssF97jMuVVQalhYuScpw2QpjPSiL9ogrnAulWa53gcDhK+vzVwSDoxI+rNT5l9taw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCdBcrxjQnziFOUWXiBY5MyTSkXaQdjufXN/R6K0vko=;
 b=hXMWIMnHWtkrDiYgarI/DsXFozrAHN+imu2qoT9nDVlhIhnyzmRt58nSOiJcDcFYXw1uX97ptxUeOHt5DKeDOO8F+ew8gKnFFnC00wZpM49wxKYqYuoAtRNilQKkFiOnmoBCwXwCuX9hRLH8bfNrpQJ1k/mjJb9M+VJMr8tZ0rFN0zKPuNOqIQUVtWkYMuSwckVPU/Fe4+cHeMXjpXhnXNEVAlMd8ZRm3vcfeuqLe+WD6iA3BpQYdgs+oEzPvKkHAvvCdzOMif9HA31RzfKXEnPTq1zMHk3ZD23oHbns0JMxNA0yv8B6kfABYBTUfX0bFF9iLeP0SNXuEGx/N+QN6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 05:26:41 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.21.0048.013; Tue, 26 May 2026
 05:26:41 +0000
Content-Type: multipart/alternative;
 boundary="------------xRlBuV7oknIukXjeUdlTzX3s"
Message-ID: <a9e32ffa-0a1c-4742-bb4b-5127e2e662db@intel.com>
Date: Tue, 26 May 2026 10:56:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/9] lib/xe: add xe_exec_queue_create_class_gt
To: <igt-dev@lists.freedesktop.org>
References: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
 <20260525163850.3493602-4-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260525163850.3493602-4-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MA5P287CA0270.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::8) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|SJ2PR11MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8ab251-03d5-442e-48be-08debae75e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|22082099003|56012099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: GHvCnxhXOS3/raUW7KS+ouKQ49C2pN1/aLWtDSUZgYn1H9W5PYafn93U59lP/gmZm/I5dviSGcC1QTrsZyuBeLKz9cNPBd/UuxF+Q0phEc4+h53v6k5kgQAL/KnLVXvdUM7mX/01PZmwkgREbabeGa+QxM2EnM4iqIDE3TlJveR6ZzbjJYoI/FcsGGz+S0q6GzZIp/yy0mIyZLMJ5WXaxNlUCpOm9Bun2vjhdTaFOfGt9SsWoUU+PwRjmBYztZjYG5aIErW7PFPPgAaeeKiGMSkRKnUVTwj+pqKhr8yVENUNzWbqoLz69s+A+e7VUjsDmwohNgqa8sNcC46vTFMYBk8MflRkUtMS6IJNEdAM3TX0m3Bg6dbmryuwTYUFpHgs6iKD3Te5hwSDpkwTM/FOaQJjEZJ0kBu7lUag1Yfk7npHF53rCdq2xpUaK65+MCIlpe8olTZH2W4A3hPKHnW4fHmZypdluqHZCcgiwq/LLGf8gteUCFVW38DF2UnQmFMpdwmWvv3V4Sjkp8T1EXaqBwn7kMGQNKCTjkAaBTZn4Z3XvCXbiKq2QW60l2XJ5E1tyAVA78fWFSVRBiVV6Fpc/as24PjX5ev4wZuHJ+oBEyhsHykqNA1kDJQGMxN0n85frYrE9SNUjmGAyYMtDmVTLSE61r6AqzW/ii4Ct5PBBoo8o3VZIYlAZeM3Qe1WrqmR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(22082099003)(56012099003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkJFRTFQTndRUGRlMUlubHNmc3lJbzVKNzVwZy9UTlNVb3VlM3hXaEQ5TU1C?=
 =?utf-8?B?b2gxa1QvMzNPbzRzalIxdkxIM0tybEtoSEpjSXVCMzlmVlM3dHRRQnVFZFRz?=
 =?utf-8?B?NWcvZWtQancvTDFnd1VNQ28rVmJFYUprN25ydzlPaXdHVmY4WUNYcGxEK0xj?=
 =?utf-8?B?ejFhUzFLSXNNWW9VYWJCZDNqTUYyYlNURmQwbys2UXI2WFJKc2hLRVA0SDUr?=
 =?utf-8?B?UzFTZkdEMmV1MDl6WGpDbUx3NlJlVTlCeTN5czcrVWdTalptUHc0R1YrQ01a?=
 =?utf-8?B?SjBjNTRuNHl3RCtoUmxJZXZRbmo4S2hYOC9BeHZicFlzQTRvUlFxV1FVV2JJ?=
 =?utf-8?B?MzdlK0VWV2gzck95UkI5bkNNZFQ5NWl3N2tmQ09hN25zcFVRVHNPVDVPUHN0?=
 =?utf-8?B?a1Y3bUFrU0NkSmx2R2ZiVDZ1WnlYMWIzUVl3YXk5b2FkOSs3a2JOK3BvTG9N?=
 =?utf-8?B?N1NjTTFjenJkNzdHTWRUVVE5bnJsdUdMNTUvTWxiRys0ck5CcnRPTjd1U3oy?=
 =?utf-8?B?eCtmZjN4dllyYkZNZ3I4Y3IrYWU2ZW1HT21XaUtGaCsvMXQ3K1JrTlhDckth?=
 =?utf-8?B?RGw4T2ROb1lVR1pla2pxbUpnTnh0c3E5TUFLVUkzdTMvK2NQRzNwQU16dEpE?=
 =?utf-8?B?WWNyQ2tEWHNHeGhYbEVoYTI0NmJoRzJsbDVYaUlBNVZ3MTVsMjhreW5HZzdR?=
 =?utf-8?B?aHJOMWphRks5UkdTdnlMUTFNbXozVTV1TXpzVUtFaVdVZmNtQm1DdGFvdmxT?=
 =?utf-8?B?d0xoSGxBbElDM1RmL3lNQjFRNGRlL1JZdCtWM1N6NWEzaHlGa0dTdjhMbFla?=
 =?utf-8?B?NnFKbmRXL1lIdjdoNnVYbkM2RnJSR3JkT0s0TU0xemZuVzQ3dTFFRU9LQWk5?=
 =?utf-8?B?dW14cHIvZGhab2tUT3JiY3N1Nm5xK3VJMXEvRUhwMm04SFkzK1pMNHNHU0F3?=
 =?utf-8?B?N1BmRnh2VE1CQkhocFp5Nlgxd3FwaEpEdFJmK21vNnpGMUp2RVZnbzg1TWpD?=
 =?utf-8?B?bkJhemVZSTNabmhzRllDbXdXU0VWYXdXSjRXdXNNUkdMejg0UG41OXFiUVAz?=
 =?utf-8?B?MGVXamlEdjI2THpoa2FmUjAxQjdoTGovVGtvWHU3MjZCMlBrMHZOa0tpYlNT?=
 =?utf-8?B?a0RBTEhRUVdUOGdCMGJnd3NaSGVNSWlVZ3FkcFdYQ0N0cHJFbEJuT0xCa2kv?=
 =?utf-8?B?bUxiMmRabUhHaG5pcitZRWxEemd5YmpsaXF3MXVWc3JpTGNhbi8zcHE3ZlZs?=
 =?utf-8?B?aHZzaThlSUhQU1ZKZlgwMUUwQXZlSDRPZjdDZ2JkVDB4TXhDWDZCNzFCVjM2?=
 =?utf-8?B?WllZa0tnRjZpRGxZbVZTV0lnVjJZQ1Ixem5ZSDh4Z25OQzArVHNKZ05MdnpK?=
 =?utf-8?B?eWJkT29Oajc1S1VTaGs1Slh3Qjh5cEJkSE5HOHVlU3lsUk0rNkU5ZDk0TmIv?=
 =?utf-8?B?TjRPWEZTUmdRQWNVVlp4am9hL0UrS0g2VHdhQU5raERGTjQ5V1l1MmhEZ200?=
 =?utf-8?B?UjI4d25lQWJuZW5WZWZ6TURQN1BrcUNTcExXTTZFcFFJblJkaDhjbkY1SFkv?=
 =?utf-8?B?UXJBL0xtZUZ4MTR0Vi9BSVhZUWFyRytrbllUN1Q4SkIzTHczN2FYRXMvRVV0?=
 =?utf-8?B?MjZKU2NrdDM3Qnhkc0hwemtLK21RTVh6VEp0V3RjdW9WV2lKSG5zbDgwK3R6?=
 =?utf-8?B?VTRDTFlrM3I1b05NRGpTd2xDSzVBWTZQcGVmMm1BbjErcTJYbnpySHlpM052?=
 =?utf-8?B?SmpERHNYdEJDVXJtaFBRV0Y0N0RoRmR4M2NvQkY2aXU3OXM1SzByYzAxOWFZ?=
 =?utf-8?B?SEF3Z09TSzRRb1JuNjR3eGpoT1RLb3BRcmlMckN4ZTZjNThDa2U0eFF4MGNQ?=
 =?utf-8?B?c2tyQmZsaEIxWHd2aC9wWGg3UTVWNXFNMGFoN2JINlZGYzk5NjBacVQxRHF2?=
 =?utf-8?B?Q2RsWXpWYVFET25wZkgza2hGbUtDeUZtR1dyLzhRZ2ZYNmwrNVh1N3JIbWhB?=
 =?utf-8?B?YjlyVk1uaHNzcU9TV2p4T00ycTJXbUJyL0ZsNUJ0R294Vzk0Rk9Rdmx5OWtF?=
 =?utf-8?B?ZVNTQmZPcGVyek10VkF1SVN4cUxFclNQS1I0by9yQ2M1eitCVzM2cDcxNU5Z?=
 =?utf-8?B?NUdrUHUrbTdRUm1FRzNpYWIyb2ZYdkprUWJSblRMc2V0bndiSXJTMk5SaG56?=
 =?utf-8?B?OVhMVDRZRmJSYnM3TXkwbEo2aUY1cjByZTNvL1N1V2hXL2tPalRHaHN5ZEIx?=
 =?utf-8?B?bGg2MWx6K1ZnSDA3Z0JGMUF0a0RGWUE0N1FmS3dwOC9uWWR0dWhva3JOUGts?=
 =?utf-8?B?YVVzRTZFNE9PUGRsUDc4NlMrYTdjcEs4QWF6ZkVWb0ZiRlFkMjdBemFXbVFQ?=
 =?utf-8?Q?PzVjTzA8kuYvy5IU=3D?=
X-Exchange-RoutingPolicyChecked: nc6xsRbBLxCb54/AnOLXObGmese+RadXB4Au5bj/L8ZtUCwnYK5IyO5io/NaadPhRVLL2IORxBe2NUSHFKQ635fLvEYOhq1n2gNrlLATwmY73x20UKbCgwX42/HyMXXQ1aeWuMm4aZ1rccS1jVZBAKkCMYna+GcDm3a3xgtF/2CO8mQ7mOXIwrJ6inSjIy2TatDiOvg2J/gMHx0mUdil5yfVrv72yvtlDJGauHAOWWlN8aET5v7D/snZExSjxT73RzOsNS/RLQXIhE8msyqza1gZb5A0TYuxzt+0yD5YDAPKF+B8UTrKvLuLOg8c+RwAlm9oGaCzxxGvK20kD6Nykg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8ab251-03d5-442e-48be-08debae75e07
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 05:26:41.3503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzXE5CovTuJrenwmKvXW8/JUa9JGS3E6+OZtXkMJBaJZH6KLnbVpHXtwOoAe83eGmPS3aJI9A9BT0ZZipMdY49Q9FHtxi0dt1uuBOSh3d2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7715
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

--------------xRlBuV7oknIukXjeUdlTzX3s
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi JP,

On 5/25/2026 10:08 PM, Juha-Pekka Heikkila wrote:
> add function to create exec queue with class and gt id
>
> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
> ---
>   lib/xe/xe_ioctl.c | 20 ++++++++++++++++++++
>   lib/xe/xe_ioctl.h |  2 ++
>   2 files changed, 22 insertions(+)
>
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index e13195e16..c8ed99182 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -508,6 +508,26 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
>   	return create.exec_queue_id;
>   }
>   
> +uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
> +				       uint16_t gt_id)
> +{
> +	struct drm_xe_engine_class_instance instance = {
> +		.engine_class = class,
> +		.engine_instance = 0,
> +		.gt_id = gt_id,
> +	};
> +	struct drm_xe_exec_queue_create create = {
> +		.vm_id = vm,
> +		.width = 1,
> +		.num_placements = 1,
> +		.instances = to_user_pointer(&instance),
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
> +
> +	return create.exec_queue_id;
> +}
> +
>   int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
>   				 uint64_t value)
>   {
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 768f77246..bf40fb6bd 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -84,6 +84,8 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
>   			  uint64_t ext);
>   uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext);
>   uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
> +uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
> +				       uint16_t gt_id);
>   int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
>   				 uint64_t value);
>   void xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

--------------xRlBuV7oknIukXjeUdlTzX3s
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi JP,</p>
    <div class="moz-cite-prefix">On 5/25/2026 10:08 PM, Juha-Pekka
      Heikkila wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260525163850.3493602-4-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">add function to create exec queue with class and gt id

Signed-off-by: Juha-Pekka Heikkila <a class="moz-txt-link-rfc2396E" href="mailto:juhapekka.heikkila@gmail.com">&lt;juhapekka.heikkila@gmail.com&gt;</a>
---
 lib/xe/xe_ioctl.c | 20 ++++++++++++++++++++
 lib/xe/xe_ioctl.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index e13195e16..c8ed99182 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -508,6 +508,26 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
 	return create.exec_queue_id;
 }
 
+uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
+				       uint16_t gt_id)
+{
+	struct drm_xe_engine_class_instance instance = {
+		.engine_class = class,
+		.engine_instance = 0,
+		.gt_id = gt_id,
+	};
+	struct drm_xe_exec_queue_create create = {
+		.vm_id = vm,
+		.width = 1,
+		.num_placements = 1,
+		.instances = to_user_pointer(&amp;instance),
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &amp;create), 0);
+
+	return create.exec_queue_id;
+}
+
 int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
 				 uint64_t value)
 {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 768f77246..bf40fb6bd 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -84,6 +84,8 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 			  uint64_t ext);
 uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext);
 uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
+uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
+				       uint16_t gt_id);
 int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
 				 uint64_t value);
 void xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,</pre>
    </blockquote>
    <p>LGTM,</p>
    <p><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span>
    </p>
    <blockquote type="cite" cite="mid:20260525163850.3493602-4-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------xRlBuV7oknIukXjeUdlTzX3s--
