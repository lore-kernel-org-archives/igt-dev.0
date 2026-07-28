Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785C3C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 07:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F09910E3E9;
	Tue, 28 Jul 2026 07:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9Goa9r8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52CA10E3E9
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 07:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785222190; x=1816758190;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3pdCOfHKN79o5FpWZUpG89OvpJLXBcTXgV4oug6qaH4=;
 b=e9Goa9r8pqtRgIyz/DhEMD8Y0BcN5fZ1r0mrphNKdc3DKdd4F+o7qhpd
 T4lmSh9cZqVDjsBld2Rn0iyKNotFV+dg8eeCydJ7/PFIQk9c+58nkn7w9
 MACnYKDsk79zFISsbiC/RWh/aNRRGwjr7uJ2wpcCJXTmTvu4r3baGsczd
 714f3oT5+MQMt0HRvqYZZza4is/XK2BKNcBnmo42ZVfAOmUAVpIFE0Fy9
 t/8EDZwVeoNMFOBWGyF9lpKRknASY5uNcWWSfvRQkgMpEH/PdGm/cPOcj
 IEFS00lYPZ5SoNgjvp7GOncBHWzuh+0whEhONb4fuvHjuBFZtldMRaXd/ w==;
X-CSE-ConnectionGUID: 9iI6TE/vTA6IfT318DxGpQ==
X-CSE-MsgGUID: 0vBeFRdYT/KRBW5PlJUW8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85811381"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="85811381"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 00:03:10 -0700
X-CSE-ConnectionGUID: J45l4BRCQkGf8sj2dThl2Q==
X-CSE-MsgGUID: fE7FHd8STOuzbavxfZtL/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="260275342"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 00:03:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 00:03:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 00:03:08 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 00:02:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFhYJaOutEykQzIUe0gAAEG9aYWmRsf8iAAHE0Zq1xEZqajMARDRGF7ctYjjunncDkIledjmHMYSZ0AtK85rcS3yRu3h1fGNIsu+VwNgEKWvDH2RnX/oLrZBTLiIabvZtmXFqmVb9MGY0MUZ2KDSUCwccOUPLEVTjvRTJwrxWsVxLKjmB7ooqlu4UYz3Ax7Ws81zDmQd4YLYUDyKGjLD0kcIa+WYqa6tbxTxGZj+VXo/NR0hoAIUDcsgIezDXhk1Cybm0gMC2gFpz/tuW0f5ys3PZHD7djKtO1CPsg1yLFpBnRc+x5H/JfH431mgsNWG6DOUc8ludNMHPc3wBhX28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22EwvN6HcLQT1u1q/jMVp4/QKrFrS/IEeTLvEzxqa/8=;
 b=V6q3B5ZbpDdLDghJIcWFEveP+Y2vdls7xSB0pXCTgMyXGojut0xhtGNqp51C6OpTZbR+0jLBVoLqY5kSb1hByyEMwMMTvt/vFyD9A6uAGnHoJWzo5/D7Ex5c67kHWjV2snokhi0es5Ba64P1E3B30U7LCuNH4dSUtTPpHaocGJn5A9KGpyvB+lFM/NkOvSrZFBkmBpVT/jLHsuzSTw6vYE/SHz9joWCMHnXNyI9bVrfUjW2sCiGH98wBZJGqeUa9DsvZfo+5Ao9PCn+h1btKHgRPxFztLMg5tZWwU+Eguo159yw16PM9B/bn1N40JfhHosaAz2RpC2PVnRCFgTSvkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by LVUPR11MB9857.namprd11.prod.outlook.com (2603:10b6:408:38b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:02:31 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 07:02:31 +0000
Message-ID: <0546473c-b3a0-4d6b-9ab2-244ddbd3c8f1@intel.com>
Date: Tue, 28 Jul 2026 12:32:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 07/16] tests/kms_pipe_crc_basic: limit #crtcs
 tested during suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
 <20260713085515.463575-8-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260713085515.463575-8-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0249.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::15) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|LVUPR11MB9857:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d13927-5fd9-48bd-718b-08deec7631a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|4143699003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 6mjah0fEwTSQB3yFwAK9hAtXgKgE+p8rv4vYwt83eIihZJH8QdJoTypWqw4EpfqRItje6MdUjW2mgcOBxHpLtb9Naes8k7DeSMNw797gGKMOIWtuabfpyjuYkvMSUgRP2ArjRvUIv6/aTarsT3qzlbOiLPZ80XxHsbJhaKDgIvlwSBhUORQ/hWT5r/2+wUIcRWIhNM95M3DaWbhP7Aablf1hWiSasnnFMrFWjpOjled/QY/AhFJJ5WygNc+/aEr6Eldrn9jQPLVBlcV0zQjpqa8pxvl9FqS9awATParMmCl86XlHc4hCP+aOzAPhelmOiSNW8ZB/13VR1e8TN1InRotgR2/H3ewOatm6DsIcgryo5oc2YItEMv9lz7TouxK95HAuiXDC9quLGOHoe+2zijDZtMEcSd3aDCyCDP/GML+eJoyrnT2LzbgXPmTrTFtzl9eKXIDKo8UGXhLdf0qyeoTOXiXNhlq+OmpSXDdLAjDz/+ozDULKxKWtWsFN4dscyOiSCAjWKfPvWFbyvAx3wxvam5AXKacyATL3dXJoKm3hZuEYKi9aP/QpZGPyKxcXOw9Q4/FrdTjKEA9jemqe29lGhLWy38XqAg6or69Ubp6fcqXr24kSuDXapxtgRqZ7KwGOMt0+T2ChbqfXDb5DgoM6Vtlryn9THPcIfWarBIY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDk0OWZGM3lhcDZjSXh3VlVNVWlMSDJyWlFpU3NsU1ZkdUluYlduQ0JOM3o4?=
 =?utf-8?B?NEFZYmxJL2tqbGI2MjNiakxpVzdHZ1FrTWkyZ1B3aU42RWtZSmNEeE4vcWNJ?=
 =?utf-8?B?MThrVjdyUmk1QjdoVEhmN3VoTWhiRVRTTGJWZUtyT1NtWEFXT3Q4VWVQRHp6?=
 =?utf-8?B?eXlMdUJ2eGc0TTdWUmVoeE1oUWdiemllaThFeHQwMEJkcUwrcE1VZjV1R3Vz?=
 =?utf-8?B?bEYzbEJIRVpKaHdaWnJOY3RMRjdFVi9nWWdNYStLcDkwajQ5YjRqeUc3bk5R?=
 =?utf-8?B?eklEQjN0N0tXdFdJYTdNWlZBeVlDeHJzM3RIV1BvdFRnOGxHYmRlMTlrelRT?=
 =?utf-8?B?dG9rYTMrRXNRWkZrbmZMRlBQTTVYR1Y3U0FZYWlEenNIOFV1QldleUR2S3FB?=
 =?utf-8?B?RlFIa0Mrd3FTaWFRb0RXWEthb2R6OTg1Y21kZG5raWlqSTJ0WEFudm4waVRC?=
 =?utf-8?B?Y3FHUWsyQzcwRTN6MHZVaWhqRGxyQmtDTWY1bGYzQzljTnVWMEdHVXdZUzRp?=
 =?utf-8?B?cjFicTBUUDhXQTJsRXE4T3ZPVnBDYjR6RDdCaUJLVCtMSTZKNjRjVTRWWE9D?=
 =?utf-8?B?d2dJaGk4aVRYd0xuWlphZy9VSXpvaGFnZlJ4M3ZhaFlPMzVnS284R2d6Q3V2?=
 =?utf-8?B?RURKYXQwNzhtLytrR2JETXY3d2ZBa1pveHNweHNzSktyRjc0ZzBuKzN1NDFy?=
 =?utf-8?B?T3B2Nkw2OWwxbkxoejBiZ05TUHVSM2RmM0VUMmgrVlJtVWx3K21DNnJtcFBm?=
 =?utf-8?B?RlFKSFpPYjREU21JcEY4OGJsMWRORjNsQkY3b2oreHhVZ1JPYnd3WEtPVVpQ?=
 =?utf-8?B?VW5YMko4bkZ5ZFpLaWFaaWM0cWxKYi93Zk0wQ0VXUlEvazV2SWZWMkdIOW9O?=
 =?utf-8?B?dUVFQ3VqVVo4OVoxdno0UlpxRWo1dW1mSEpPL1BTT0NxcHYrclVzNEZKRjJr?=
 =?utf-8?B?V3U2czJHRk1zbFRrcjVibE9YU1pRY281OUZIUEs1R0pJREdUMjNsUmZDa2JG?=
 =?utf-8?B?N3JtbmZGOWdYNzRUT3pUMUZETDBMQU5WV2xvV3BVeHRWZDk1ZEpLYjUvN3lQ?=
 =?utf-8?B?M1hhbndFY1ByY0RMQUFPdnl1M0V3NVFWR0hOYVVzck04Z0laN01FUEsrcnlJ?=
 =?utf-8?B?WC9JMWg3Um50TVBqV0dwU0pleHZXS2NxOENXSDlnZDR3U3NBNUt3UWJpTVhC?=
 =?utf-8?B?aWNIK25QYzcwRU5XSTVSbjYrZmxjR0Zmb1JWMnc2T3JjdVY3RmlVTnE3K1dL?=
 =?utf-8?B?cWVHOGJLRkw3SmJPMUF4Sk0yN1lURFdBTjY4L25UODlxeUxtZjN3djdRYjBI?=
 =?utf-8?B?TXVjWXR4VWJvR3YyTDFyWWZTenY2ZnlJR3NPeFJIZ01QL3RuY3lCM09yMk1w?=
 =?utf-8?B?azg3UWFqUXZsUnNNOWQwamVNQkNqdlA5cGlocSt5THljN0RoZlZhWUkrSzhM?=
 =?utf-8?B?S3AxcUhaSHRUMGp6UDVHdUJ1NVY2cUpVeFlIekdVNnJZVXRGVzJZN3h3N2dW?=
 =?utf-8?B?QlZCVzRodTYvRkJJVlFYMkxoaU0zSDdRbzlGc2RSWVh6UGdRMnZINTBrOTdv?=
 =?utf-8?B?L1RGQVFDc29ZQVpsdllKVTdUdVpaeGd1YUpubHRMeHpyaXpxMzVVU2dpNldP?=
 =?utf-8?B?Ylk1c1RLUnJsOVpXQ1V0bCtWMjZ3WkdJMjdIQVVQRnNBK3RyeXozdDdyN2Rz?=
 =?utf-8?B?dTFKTTkxTjdLZmhZNzRwYkR0UXVYSU5vTVhVU3hWUStIYzlYeFZ3cnFMRnp4?=
 =?utf-8?B?TThyeWp4UktxMVphSHhQNG9nZWpScmdoMXd2cE1DUDk3dll0M3gxMi9uNmlv?=
 =?utf-8?B?d1ZJeUNOcFVEL0J5S1A4UVJLQ2ozSC9BYzd4b01FN0ZubHhFUGRrenVUSHVo?=
 =?utf-8?B?bHRsVzEvTHdsUEJuZUFSL2QyM2JselR5bGpsZWMyVi9FbXZjUWJ3S0RpcmJu?=
 =?utf-8?B?c1lZSEU3VCtlT0VtVGE5RWJ3clVLdnVON0lDSVEvTlhVSVJIS21KVzNMRFA1?=
 =?utf-8?B?ZkxNek9TekVyM05yK1NGSHJRMkxSTWtWcDBPWFVHV3NXWThieDVKYmhKRFI3?=
 =?utf-8?B?LzhkOHJVQ2hVd2kyTFlJaU9hYzhoZXpIUkRKdzIwQXBvcDlaK1VTSVAzWGxB?=
 =?utf-8?B?TWNTRWVEMTMrdUN2NzloVEFFNXRseCtXTUUrSDI2bXpqVUYva1Yyd2JWWDRz?=
 =?utf-8?B?SGs4ZWZYYkRuNEFiOTBiU2ZwTm4rTGRLRFJHZjI2N3p5eHliRXdOMDRQdm9x?=
 =?utf-8?B?enI3TlBYVktMbHd3VE5ScmdieTQyYVFidUpLTnN6NUI5bEkwTmFqZTJ4b3pU?=
 =?utf-8?B?eWxmSTBHM2hSaExzZjdNclRsdnJCMnZhdEI2alM1MUNyTyt4bldsWXpicSs0?=
 =?utf-8?Q?9MyNzt1Hvy9hx3U0=3D?=
X-Exchange-RoutingPolicyChecked: Z2XfdTZW0yfuqgqmawV6KxfDkah7pKrs2PRdOrL/ADYMI6MCliOzreGJiFzOWyXZKiUq2o+ovH92vYwJGijwpImf91sMeo2GDM7zvrqe5b+t5vJG+lxlFbMQspH0r3Dj26zISrLbmMUtLSu5G8kzZpT6iHP//ZhbhofQc9LMnwFjP7iOoxJw9wwfzYGHS3EP4ugT/cNfWto9vMjI6f9ldW6UVJivsiOXHMOk63qru6Ff9pFvpFpEfWA2u5bo/mWptVCx4YWJOEMfrTvg1/0Uxa3ENn6PRzVgxtUf1aFbmcdAPsCdsyqDMkkyuWmQcgIz6nrEsfF+etC0nVxp2d56cw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d13927-5fd9-48bd-718b-08deec7631a4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:02:31.7596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gsAAHojKVszdkBsn9rd1W83/pS82xLNz6j0MRRA5tDd2sBuwdkc+VGtO2k2kw05EK1jui61do5H8PSz918lxMmuoWexh4YhTvfeG5gxSBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9857
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


On 13-07-2026 02:25 pm, Michał Grzelak wrote:
> Limit execution of suspend tests to first and last active CRTC unless
> using `extended` flag. This helps with reducing default execution time
> of the test which can lower number of hitting CI timeout.
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>   tests/kms_pipe_crc_basic.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 42e1415452..9ea04a0f3b 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -127,6 +127,16 @@ enum {
>   	TEST_HANG = 1 << 3,
>   };
>   
> +static bool suspend_constraint(unsigned flags, igt_crtc_t *crtc)
> +{
> +	if (!extended && (flags & TEST_SUSPEND) &&
> +	    crtc->crtc_index != active_crtcs[0] &&
> +	    crtc->crtc_index != active_crtcs[last_crtc_index])
> +		return true;
> +
> +	return false;
> +}
> +
>   static void test_read_crc(data_t *data, igt_crtc_t *crtc,
>   			  igt_output_t *output, unsigned flags)
>   {
> @@ -428,6 +438,9 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   				if(!crtc_output_combo_valid(&data.display, crtc, output))
>   					continue;
>   
> +				if (suspend_constraint(tests[i].flags, crtc))
> +					continue;
-->NIT:  Move suspend_constraint() before crtc_output_combo_valid()  as 
it's  just arithmetic and no display state needed, can be avoids 
unnecessary reset/validate on discarded combos.
> +
>   				igt_dynamic_f("pipe-%s-%s",
>   					      igt_crtc_name(crtc),
>   					      output->name) {
