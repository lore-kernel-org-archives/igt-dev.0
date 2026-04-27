Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4D2FF8850
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 05:08:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22A010E199;
	Mon, 27 Apr 2026 05:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C81wSfMY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D1B10E199
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 05:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777266507; x=1808802507;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x6saDTtmjDy6I/nAYWhAT9n3NQ62hMwFonYdCL6xCUc=;
 b=C81wSfMYw4FF9EwmDMXwtnoJuZm+PPVrwFtjJ3QaHf2uaxyiSfXxrOFa
 r042koZGaLeq+4JSOhU3dyjMjx0bhbLIVfYNQAY/E2FnWrawjM03Fn8J6
 FQwDTsuPr6PezdTKbnfJRbYCsoSloQZaVPwXrBV8KrUwHW4rR3OBhXtrm
 YKzg5VMxXJZq6I/At8Eti86SN2fND73kOqLYwTZF5UuM9YAFXQ+qkXl9I
 eQv0JnP3nfGWTydwRv4jLVdNS30Te+2omkIgDm5+I3Ahve5yY9tU1yicw
 4HHO6B1dztP1MC9sXQ0z2fFMjaZ+Z0Apt5uqhGbw/ouniUB1cfAOSgWtJ A==;
X-CSE-ConnectionGUID: ZKImh4HRQDGO4TSY+pGm5w==
X-CSE-MsgGUID: w2CBSizCQGetEMtULsl5Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="88460058"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="88460058"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:08:26 -0700
X-CSE-ConnectionGUID: fe3VCg4lQ6WN9x0J5FTNhw==
X-CSE-MsgGUID: mpNQRXz+S3mT1sRI/Qa56g==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:08:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:08:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 26 Apr 2026 22:08:25 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:08:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSzPxk3qBMgkz7y6LH7ZzmAt/TLPM+bQEJLe1LpNzJHj/XsoEmM3LDV6MvFa3ldYOLwUM+xabR8DwofGwrshOLaIF76a2Qq/WSD5we1rJ7e99YvsfCEDQQQYOOqAanRUnTshJidzIsnyfDMt5er939Lg3UhNNd2jnuD+a5thMpOKz0KdXulE1eyVSpu6Zstal2P3rvkOLHXmsYlp35fp1HdTrP2PncQj8J9NdCBpwXkp+XewavSygjUiJ0T4vivu9Yv70RzaAUtQKJq5txJYAhdcjtXTUfz55aI7bkwWvj0HUGjf6XTQcml42s3SKDWMyhH1w6lqu2MttwMINbkWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/Y6CI52kynZTtVU7f1rBJ2yrXYUoci/yvFNSDtgsXw=;
 b=W2YxU8zSJY94WZW0j5zGs3k49DR7Bv7ws4FoLUAaW0YGsmAbenTHsSCpAu3Th5GnIgDivfOv6YMHcBKwX4+eTLnrvXtyEQI45+MhqMr4L2PM9ij6SvvrRHhThRifLtVg6loG+ThNFb9bZbhkONJw5/+Kxb1HOyOxrbtfsSjKg7AFK5QhlXYXpWaHfR3jCOJ7kWzOSm2HvPt/lhDac762zIXA/Kds33CnrNnaEpxoqtLVwFaST7OU2HHK0FAhrSLx74OUCQ+J0cWiIDexxE0OePcuXGug6RreB5vqZq5KkS5Uqzadv4czyfBeZZzOX5Y7Vx1RavnKmSFSDZKt4Fwp7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by CH3PR11MB7793.namprd11.prod.outlook.com (2603:10b6:610:129::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Mon, 27 Apr
 2026 05:08:17 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::70ce:b376:4721:9b85]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::70ce:b376:4721:9b85%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 05:08:17 +0000
Message-ID: <8d5025f5-669c-4c54-bf7d-7057bdaff332@intel.com>
Date: Mon, 27 Apr 2026 10:37:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/8] include/linux_scaffold: Add BIT_U{8,16,32}
 macros
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
 <20260422034335.2326098-2-ankit.k.nautiyal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260422034335.2326098-2-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0064.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|CH3PR11MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: b5db16f1-f37d-4d76-9b6c-08dea41af6ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|42112799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: gjjGfqzxaQ9IGkj3G8SjLoGhrFpeV0VC15Q853PJ2SVnV85jm8/7BzwGOoTyqmmy23NBnwcgJxOiwshvlMki9JbSZs0JOSuOXfpwAJcjju3q+ua81ejPjUcSj46Dfh66ZT+OvZfLdYum3SVW5fO05x1/9HpTPneSeDfD99UKIC9MIyLtlCDzqcKTbWtiJftThwzoOWDdGq7qj22Q7qPgpyAls+d+064B4ZGhsXxPs0vKRZf97lhJKMNFhgu7WKWPFr66neGZ3ons3hJ6991253Oo10ITnPNZjgIegxdN+EoWAhL7+W747QuEwE1ZeroNdmlPKr9A/mUA5K6fkZez5k73gtVZEtuHj2hbuxDyz4S8Ll3iC01oaKoDjyP/N8SJ1+CAAsllWE9pVlWxFo4XM8w801gskfko7UdTD3gUGXsgMXzroijIruFGmTntuhfFzA81rQY0oyBHecJxJ3om+nU/b1c8UJnT9Dme9rGaAJp1xSI5ix2fh32WH+5hQToaIMy0NmY0hiyeQw93InzAi4tsTpfOq+7X6q7YtNTjXvQ4ANexsdFt5m7zS3AEbpyI0w/J2wYYEPVk8mGDOF88ZNh+alcL3o7ijMgUvIwByXZKUqdaro/Eeejp2gJz6FL4z+W5Qxjblp/VpLlb94DduClCbiJz8JPTCz/jXsW6Y6Hqbli7+gN45FyKXMWtI6qZgQtoHoa+yDPTt61ZBdzmux7zqroHRKo+HM3XGLsuzfA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkhmcXBFUjc3Y1VTMVg1cnhodXVrVDZFNmRwdEFKRTc3SmxHeGNKQmhqT01B?=
 =?utf-8?B?VUlyR1cyMVlZY3l0TUlUY1J5Zy9kSkJkejE3MVVEaFZqVnFVVk1ZRkdzNXdF?=
 =?utf-8?B?d0c3RTg3d1RSU0U0Mk1kQlZGeUNHR1ZHWFBWdVVRYjhoTWV0cWVnbnR4T1Vm?=
 =?utf-8?B?ZEZDWXJvcVo0Ylp1eGZvRUNwWUpVenRJbG45dlMyaTc3WmF4SVN3ZTA1bERy?=
 =?utf-8?B?c0VQYUEwU2lFd3ZNK2V5WnFlNEdMTTlQTkhlMGVBUDd6MzNpUGNERjlkcjRX?=
 =?utf-8?B?cFVXR2VIU0Z2aGthejBkN0lqZVlUUzRVdUVSR3UyR3lEeGhIMitTNEVVNzNF?=
 =?utf-8?B?V0NROUtpK2VKcjJYL3B2dUFia2krUyt6S2JwQ21zQ2p5WWxwV2xvZUo0V0VP?=
 =?utf-8?B?eWU2Sis0MUhFQk40R290MHYrc200TzBIb2ROWnJLYVVPc3JCVTVrdHI1TUpE?=
 =?utf-8?B?dVMzNjdPTGFnWTZlVGlMM1hiYnpEM1YrWSszWEh3YkE5b0J2OURjUkpMaklr?=
 =?utf-8?B?MWNqdXdEemlHeW04SVhFTUdzQjJ6WnJGa2VVWmRWNUVuWktIQnoyWCs4WmZ2?=
 =?utf-8?B?NXY5WHlUTjdYVmtBVUZ4alFzZEZ0cXNRNkdKR0JuNTJ6b3F5Y2hOWi9mL0c0?=
 =?utf-8?B?TGJPR3ZtY2kwV01JZlg3K3Zpb0dDNktiTjhOZjV4MjkrMjN3V09RWmtna2U0?=
 =?utf-8?B?c0FzU1VzZkdGdjZOb2xWUi9pL2ZhQ2U1Y2Y0dVpOTGh1cmRkNHpmdlFua29t?=
 =?utf-8?B?WkFKM1h4dlBNVUpvbzRQNlBKbHZwb0VTMlR1bkdNNUtjWkRrNVhLWGtNWmtk?=
 =?utf-8?B?aFFjTGswNWh6YndXSE5JQmU1M1lJdnNrZUp4Rk1ZUHJ3UDNwNTNGaVhWSWIz?=
 =?utf-8?B?S0RXN2ZXZzRyK0JCMEs4NXJGZGdzMG14dnByQitvbFNudDJWK0tCVU1nbkZz?=
 =?utf-8?B?RWwva245VkRUd2c4YlNaYnNScmMrbDRKQU5BbU9LVEw5a0dSbTNmZCswQU9k?=
 =?utf-8?B?aXF4RmphS3RJT0p0aXNQOWZPNGkzUVZuUFJjVG9JS3YwcWR4QmxDWTkrSW5n?=
 =?utf-8?B?VlJ6cm9WbjltUi9haW5mdHpBS1A4N0NtaWhDSFpNMHNKeGUrMHJqY0JrYm0y?=
 =?utf-8?B?N0FpUnNLSDZTVElNWnFHTjhad3hGVHFVTVJIMmJpNmhQRVVXYTF5aElSSDMw?=
 =?utf-8?B?ZDVzanFORGlSK29TV1VjR0dSdkN1a3NuMithYVpncnRCUkdMcGMvWkJRN05H?=
 =?utf-8?B?VEJKRy9sQUlENGZVVWNWSVlBS0JMRGRHYWNyaGkwbmpkUzRzc2hBYmhobEU2?=
 =?utf-8?B?N1U3QnVaY2wrcncvY1l2ZjA2dDNjUEZ6NjJxek9xRHR2S3dXUDY3SE84aFZT?=
 =?utf-8?B?K0ZyNWorakltbHV0WlVUaWJoNzUvaXNJMjBhTzBuVGtQUWtROVpBRnJxMlVY?=
 =?utf-8?B?VXYvVzJ0c0haWmlNZnIwWjloR3NhSE0ySmdOT1FWenJubEtmWERmeXAycjhR?=
 =?utf-8?B?eWM4NzdhQ2ZEMTJtdWhEclFMa1o0RW5oSTF2MHBPeFR3VVJUWUdsM0pjZUEr?=
 =?utf-8?B?RlRYWjVoV2FURzBxckxVSDRseWp5Ykp2QnppNTlPcTBQeGxReU9qTVpIQjNo?=
 =?utf-8?B?KzBkR1ljV2NVSGJxWHpPdkZGMmx4YVNWU09DbjNZRm5NVkxOVkJISmtKd1BS?=
 =?utf-8?B?QmpuOEZZTjhUOUJTTUFNMHV5Um5nSGJranpmM0JOd0o0Z3FrMC8rSTZoc2N6?=
 =?utf-8?B?YkkxRUp6OW51TkszZHNmTnAzdXFpRTBBVXNDMVRrYlB1MHZ1VnBNcVJoVTQv?=
 =?utf-8?B?cjNoVk5SMld2ekpNcERsVHc4OVdveDN6UTV6a1FnZnQ5YjBNcTRkK1B5cEFv?=
 =?utf-8?B?RDVsR2JZRmR1d1dnOG1IK0ZhWjcvNzEvL0h0cFN0YUlEdVoyTTZ5QTF1aStM?=
 =?utf-8?B?NTNsVWxuT1J2WHhaWmVyOVpabVBMTlZZV1ZYUWkvaXU4cWpFZHNPaDQxZlNp?=
 =?utf-8?B?ZENEaERTb2NNYjVKVHNmVzc4R0lERVpLVEdoRks0eTVROFluTjQ1QmJFOFYv?=
 =?utf-8?B?ZHpxSVBNR3ZUdEpJeE9qR0JGeGg1VE84N0JQTHpYdEIvdEZ6RGkrWkw5ZkFR?=
 =?utf-8?B?YzhkVGxNRE92VHYrcUR6NEVwa2I5aEpEVHhCRTA2T0hVZjRJMkNBRXZTWDdK?=
 =?utf-8?B?QUJ5dGVTWENQMllBaUlrUlpJb2VhSDYybGp2azQ5K2hPRE5zM29TMmVxUGow?=
 =?utf-8?B?RFFQQzFVV0xFOXIySXhtSDVpbUU0Smo2NXdLRkcwNmVlcU94VVQvYktpcitO?=
 =?utf-8?B?WlFGc015N0ViUm0vd0pjZi95bVN5K2w3WnUzZjdUaUhGaFhLOGpOUT09?=
X-Exchange-RoutingPolicyChecked: juTv4KhHnITWeJ2V7EB+5gAYmd4FdKndfmZ7eopT7cn2FFLpYpdXFwMsJma+zITmuZpOQCWsYRoyRtSE3fw7Tpbkbrcxj1jGy8lZjagDUb6ip2ytYxdWn3chMlOHf5idDeMyHYEPfhlXsOFrZRxwgOIdUgjnolOeQP8L1D2lK7KRxejF0MD8Vpn3uy+GAoU1atM0xrYP3IT3tMHxSrtfMv/3qDXxhQ2CVswQXT1xF4un7RcrmINiaOBIlF2l+SSAiJATfhwlO3Nk+BcaHbL3TN342Zsb3MK70hJCxGJeOQX7VBWtUHV3ux5spXGTv5jE26nkFlBYdu6/myx7VTcFRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b5db16f1-f37d-4d76-9b6c-08dea41af6ea
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 05:08:16.3963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1da7oJf7ehq3ngt2Orykd7GTSg1Aghq2fEjzvsaJ7/mzLR1iLRHNeDBHiZe+EhnAXKLWeDCcqFEkbvoRActmxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7793
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

On 4/22/2026 9:13 AM, Ankit Nautiyal wrote:
> Add macros to accommodate the kernel macros BIT_U8, BIT_U16, BIT_U32
> in the header file `intel_vbt_defs.h` copied from the kernel.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   include/linux_scaffold.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
> index 281aa5e730ed..a3acaa16117c 100644
> --- a/include/linux_scaffold.h
> +++ b/include/linux_scaffold.h
> @@ -57,4 +57,8 @@ static inline s64 sign_extend64(u64 value, int index)
>   #define FIELD_GET(mask, reg) \
>   	(typeof(mask))(((reg) & (mask)) >> __bf_shf(mask))
>   
> +#define BIT_U8(n) ((u8)(1U << (n)))
> +#define BIT_U16(n) ((u16)(1U << (n)))
> +#define BIT_U32(n) ((u32)(1U << (n)))

Should the BIT_U64 also be added to maintain consistency with the kernel 
definitions here?

Thanks and Regards,
Karthik.B.S
> +
>   #endif /* _INTEL_GPU_COMMANDS_SCAFFOLD_H_ */
