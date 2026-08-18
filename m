Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B308C5DF80
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 09:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2767410EA65;
	Tue, 18 Aug 2026 09:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kogN8j/B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE81C10E3EA
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 09:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787043989; x=1818579989;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zsp9C85bsJHKIFAy9oLbm6v9RJmMsS67PmebOKRHyjg=;
 b=kogN8j/BO/+PRSG7fquFA8BWrdFryPHuMGs4ZzF6MRUja+WcNUj8PT5L
 TC5gzZtRXm2cBC8WYwzncjHLgtCqlktcxRV4Mf34h6j2Tq/xeaC7acDnw
 NZ/UHdg75bY9N8qYPmmrABCbrNpxWnwv/6BzuUUWbWPrd0PgoEXddo3Xo
 88j9WLZOldRzve5K5A0LbjodL8meX0rgMdp0fjcP+sYfFK6dH7Ih8vne0
 tzVbFK1cX3ouZc2UUdkYcbWrqGgwbEmbqzy139hnPTiPIp/awarFTIqmi
 2Rne4+HU3OrJnMvx9/NicsIyYGZHUMpoYhAyghrvzPEKgTWRb3uo3bnpR w==;
X-CSE-ConnectionGUID: zQ3bILq6S8Kp2IFV09yJbg==
X-CSE-MsgGUID: vnjCNj8iRSKfOfllqL1J+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98894972"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98894972"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 02:06:28 -0700
X-CSE-ConnectionGUID: oez+AL42SaOKypfyc078iw==
X-CSE-MsgGUID: nTl+WqOMR7+feXz2v46UQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="258962133"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 02:06:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 02:06:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 02:06:28 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 02:06:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jzwe+mv9icPOcA+NsyunZOelxY9nSEtVSqEVlu5HFfraPA6gsvTGwBGHsPscdZbv8OSpFCFGmjOtvIbhaDGOyU8yCkXAbWeH35r/4LMFgQ1OJ0E448lAx719N8tAars/Hki/B2isF5hwOEpDQnPzEjj4ah6QluwpPvL2/H5sFTv47Kuqu8DMrQOPMyc4kV5ZoLmBUDUI9EB+cLf5yvfSt6vsKO3HtRLmXtzSTGwadyn2VxDw9JqIAHp9mF1IWRzfhIsLeulgjfZ/qRmUBwQEodV+dzIT+k36taHQ6wLRapSL3sxioDP5RtpzVdboErCusbgXO3OrlAMcP1HZopMnQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOjMqzoBV3LgrfcwXEnBCnIUev7vBRlbYz5VHE0lcMY=;
 b=whUh42PNbRYp2mM1i66tm9Q4ckAb+1dPxmBbUs/7LcIDCoQdYjrM2zLj0N14Ns3wIzXIed6FfUpVOiyXwBjcrygnNERDcx10GrXTswbE6/qXAs+8Oh/77lCm6abCGvBXlKbrUpFf/UIIxMWUwT3YkGsSmU5XQpk+9YR1mjd1SEnI8Z5YM6Hp7FYJhaACoZv3iQKkN7A0KdAPn/DOSNScawJNJCLUZM9Q3fpLI6c5tENcQlCtMTJ5tZbEYveG7nlp0prdcDvL8Sp2sswXiJES8ZLJkX/mkZfuQPQvI10THVvEWBwEq7Wwi2rWBL9flOoDMmavrgNBZqglu8OjKrGqng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by SJ0PR11MB5166.namprd11.prod.outlook.com (2603:10b6:a03:2d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 09:06:25 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 09:06:25 +0000
Message-ID: <915b727f-52f0-4a46-a467-4f7e6919c2e1@intel.com>
Date: Tue, 18 Aug 2026 14:36:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 08/16] tests/kms_psr: limit #outputs tested
 during suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <nemesa.garg@intel.com>, <karthik.b.s@intel.com>
References: <20260807224746.3554064-1-michal.grzelak@intel.com>
 <20260807224746.3554064-9-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260807224746.3554064-9-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0056.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::11) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|SJ0PR11MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: ae88d04a-a75d-477f-c442-08defd07fb30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|3023799007|5023799004|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: ubLAzZcJCbLoStuKlwkrfpXLEDwJQRKytQmCGkgESNdcGKY+qBcewPZcFOP6FqTAa7uWkULg6Ac1qIsjol2rzGf3/YEcaY4a2T7xH7EM5+UVHIjLT//QwGYCHTSjlaUwJmVdEJ6z9/IdHqxxvIBfdXkMKH8vUWwh92WbiVcmXHzpfLgOo4UfIKvXEi13zTOiS0uO9QpFQ5H0FcNYozRPXO+U37DORKYRO8w7eNVarflkUvvlPXJEQwtmqoIXgc91rY+j/7QyJKrevZqHORyuYi26Uhe/JXI6xgISyvJe0mW5JCW77KgxEpzjQaSY1LP6yyxFrNRE44areetkU12iW57hyfHzL8oMLXUy3/Dyc0T8Z7eJXM/aR2TSedtLGI+fEow3aIsA+sIBQw/SYpBj2HJRxESR0oMZI4/dYV5EC4o5TdDx7X7rJgd5peVQcpx14UfKhK4YDUSQfPBtbxrFwoHh35/8eeVC9wqvF7UJlmFGQSWWFzXAp0VK8mKH/JVYthd8wqJRxvCzoeerZWTv1AK1FZHX9Ia2PzFhBHMO4JN824F4jqokxH58vvWroLAjghxNyvTbVy+M8F0IuRxXfD5z6oyQya/+T+2z3uNGWkbceawX4mK2ZWleR1BFG+1zyCXUTA0Ut9Zuxe5sshxMqMW/I8TeaW6TUUW74POIodo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(5023799004)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHFJQ3hxWGVLeGd3SFh3emxQNmFHeTFsU1MySGhEUXJTcUg2Yzh2ZnBrOEpQ?=
 =?utf-8?B?Y2ZVSStXQk9rYmttZm16ZThua3FnNzFROUxkQU9aVDk2OHc3U25HYlovclhh?=
 =?utf-8?B?dk9HcVZvWlR6enhwVnVPaU9FZ081b2t0SmZtVWdpRlhJd0VDZDNkSXRJSlh5?=
 =?utf-8?B?KzFzbk5qMzlPenltRnA0SnlncThERUtCcXlKRUtMbDFOUElNcG1FMWN4d29h?=
 =?utf-8?B?U2ZoZFVwOVR4ZitFdCswdWh0Zm9VVWJ4MWlCMENrajhUOWlFT0hWWjVqL2Jl?=
 =?utf-8?B?bXRVU3RhdWV1UXF0YjY3T0JjVDRVSUNlMkt0ZXQwK3VzN25oQU5ZdTM5MXNI?=
 =?utf-8?B?NjFrMkZaTDJSWm11bTMwZnB0WndMclRDZlR1ay9mNU10T3BvamZaMU5PdFh3?=
 =?utf-8?B?SlA3NWlDZXlETG1Cc3JFMDdZeGxHaFhNUFZHTFo2d09EQm1CeHEwYnhCS1cw?=
 =?utf-8?B?U2piSTN3c3ZkWDA1eG5ndVN4ME14S1dXY09Md2JNMFBPdDNpazUxS1FkMFVz?=
 =?utf-8?B?VS9sSWpNL3pIOXluaHNFK2V0K0phVTJUTjNGZ2M1dU80R0VTbUFUNjJnQTZE?=
 =?utf-8?B?VHpaVnBFVU9YQ2VVcForUGZVaFdDT1hWVDBoQTNORkk1YzM5bXBhaml1cDVN?=
 =?utf-8?B?MU1SaTAwT1pwYXJYTlcyWTN4WnFET1p1cXp5V05oQW1MZjBrbWJhejZ3TVpx?=
 =?utf-8?B?RTB0aUl5VEh0K3lFWkZDeDRhRjFGWmZFdGRheHlNODZKREthclF5d1dHUHVw?=
 =?utf-8?B?Nmw2Q2NoWjlNQ0VhZFpFUmtMVnlrOEdRTndvNjJ0TEw5bWRXTGZQczdjQ2NU?=
 =?utf-8?B?RkcycklHUGZYYmYyRThmaUlCTUhqZi9RLzliTkdhVkhITUhvYnhTa0tCblNu?=
 =?utf-8?B?Q2FxVzlZTndLOENoMDR5dSs0OUUrVm9kZ1VMamRmcVJQa2RkK0g0NHZSbHo0?=
 =?utf-8?B?UmdoWU9kcmVQb0k1NnR5SVhreWpBS2VCZjJINTF6SW5iOWZnTU1pRHNJemZM?=
 =?utf-8?B?TE9NdGJZam5ZRWp3QzgwS1gvVHdhUXIvYmNLMlVBeTV1bDl2VU5vSFlXK3pK?=
 =?utf-8?B?TytYNm1ESWtvK3UzNERKN25YUmwvSlZsVFUweGtmbUJDQ0NoeWRYTWdNMHhJ?=
 =?utf-8?B?K2djTnpKZERkMGt3YTNtOHUraG1Vc1JzL2FYaVZ3OEF1NXBmbXBMTFdPR25Q?=
 =?utf-8?B?enFQcGtobDJFVkpabXp6OFJ1VitBVTNOR1N6QmZmOVhteHZWSFdXbHNkZGdk?=
 =?utf-8?B?UnpqcmEwWTl4YjdML3VVUVVDdjBZNDNYRzJCOXdqQ3JvTlV0RXkrbERiUlho?=
 =?utf-8?B?SDRxWkpCdGJyUEFhYjlPSk5DR3FUY29TcUlkekMzZFVWeml3SkRlWWl0UUVz?=
 =?utf-8?B?bWlXZ2RJb3hiT0RtQ2xzTVJCZXI2UTdBckprNDVLQ3Y3TWJQUk5Xb0FqS3lt?=
 =?utf-8?B?dVBDR3NacWJGNVFtajdKcXUzUmE4dmVjM3hzWWpJWisvQlNLMjJoWktzczFx?=
 =?utf-8?B?Qm1uWlpnRzZZV2V5eVNiczkxZFdtMjlNR2s3NTRSbmI5bkY4c3pIZDFxSlhS?=
 =?utf-8?B?T3dLb2lIM2pNRUM1TXJFSDR2MFB2bjZOenVRQ0wreVBKRWJGTHhkWXkzTnMr?=
 =?utf-8?B?VlFIaWdNeit5cWkwMUVKdWpFYkhFREpBdTFZQ09IbFdhaW5YYnhZVGNpdGxJ?=
 =?utf-8?B?TFZaTHVxcFIzQ2dQdzFPcUYzOFdhVGxsUUp2ZUloS1Z6VnNMbXp2ZVF5bmMx?=
 =?utf-8?B?Nkg2V3ZaM3hqMUxSWFVDdklyQ2lpU3doWUhFSDIyWWxmcTg3RHlhT2x3WjBt?=
 =?utf-8?B?bzVkaS9vR1NMb08rS3hqRDRTZVlnK3pKbU1RU2NtakdxSWU3ZHVQL2xLVUhY?=
 =?utf-8?B?ZHFDOG1TSmg0VXB2RitrN1NzSmJPOWUzZTJFRDNUZmt5cmlZcUxCQmRCTnBl?=
 =?utf-8?B?VExOSFAwdC9lV1FtbHZaSEJnd3hsYmVPeTQ3bHpNbmdjOHRya0lsaURrdHBF?=
 =?utf-8?B?NXlPK29pU2dndER6TXdSS1BuR3hramFpa2VaRnlmSTRCNzNwNDdySFFPcEl3?=
 =?utf-8?B?Z2pnNzRJYUlncjFrVWVWZ0gwQzY4Vmo0YkxEMzNLcTRtU016VmZGRUpvMnM0?=
 =?utf-8?B?VS9iRWhGWXVaNUg0V3pJazJrRXp2dUphQ2FtdHJlYUR0VVdFQXJhOUlpc0N3?=
 =?utf-8?B?RVYrbGhWY1Yvc3liZmxqR3o0Z3phclExckR1REtyUGIwN1IwakhpRXNqV2Na?=
 =?utf-8?B?cXVLY0dMRnpra2M2eVQrTS8yaEx5NFoxTU92Y3UwTjZHZTBWNGtlQ1NyQ3Q4?=
 =?utf-8?B?M21MU0pyd2k4ekZacWx0ekluTVdEM0RjZzBEZTBtUXpDcHJKZ05HSjlBYkVj?=
 =?utf-8?Q?qDfQCzIbDXEzxeRA=3D?=
X-Exchange-RoutingPolicyChecked: HgGtSalhoW98+pKvkKO759b7wLkTLrs3w9zaxM7MKVFoV7WuyY3Dsvw4IZ5X0tpUAKDT+tyOilep5CFqKN7obn1H+XM0obZYkVF0A131fuovU56EfQ17PhcgeR0n5iUrtnlpjxhQ4qAUm+8kqmEuv0i7/IO0Vf+uNTlu+4veGS26qHE+gn8kbnWRajs9fDvp13QTVPo279oNs0VObsaNKhRf8t5bhoAewCj2IZXCuleFjoYKRO2F3LUFJH3IaTLzRD7vy/p0U2DuqAJ6ZZwpbXDh2sLEJriAbje9KJ6Xs7yJLuKg1cb2eDMiwSVR7F+kP3iu82vvFEomFubDCF1+hg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae88d04a-a75d-477f-c442-08defd07fb30
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 09:06:25.5141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuOP2tOQVA6joZZ7RVuiXrk6jUTH/Umrp85sVsg2Dosl0T3Q3LWUlkBKflH2GiHbgakbHiW/+G+/7Kt/HPA+Dbj/7ww5dLMhyBJvKu3NP+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5166
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


On 08-08-2026 04:17 am, Michał Grzelak wrote:
> We are iterating through each output while testing suspend. This results
> in extended execution time. In turn this leads to hitting CI enforced
> timeout.
>
> By default limit number of tested outputs to 2. Test each connected
> output when passing command-line parameter.
>
> v1->v2
> - s/OUTPUT_LIMIT/SUSPEND_OUTPUT_LIMIT/ (Mohammed)
> - fix typos (Mohammed)
> - fix off-by-one error (Mohammed)
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>   tests/intel/kms_psr.c | 29 ++++++++++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index 7b02dd2072..41ce436ee5 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -275,6 +275,9 @@
>    * @plane-move:         Move plane position
>    */
>   
> +#define SUSPEND_OUTPUT_LIMIT 2
> +
> +
-->Remove extra line
>   enum operations {
>   	PAGE_FLIP,
>   	MMAP_GTT,
> @@ -318,6 +321,7 @@ typedef struct {
>   	drmModeModeInfo *mode;
>   	igt_output_t *output;
>   	bool fbc_flag;
> +	bool all_outputs;
>   } data_t;
>   
>   static void create_cursor_fb(data_t *data)
> @@ -767,9 +771,27 @@ static void dpms_off_on(data_t *data)
>   				   DRM_MODE_DPMS_ON);
>   }
>   
> +static int opt_handler(int opt, int opt_index, void *opt_data)
> +{
> +	data_t *data = opt_data;
> +
> +	switch (opt) {
-->Seems indentation missing, check once..
> +		case 'o':
> +			data->all_outputs = true;
> +			break;
> +		default:
> +			return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
>   data_t data = {};
>   
> -int igt_main()
> +const char *help_str =
> +	" -o \tRun on all connectors. By default suspend subtests will run on 2 connectors\n";
-->IMO, two spaces  before "-o"-->"  -o", updated as below:
"  -o \tRun on all connectors. (By default suspend subtests will run on 
2 connectors)\n";
> +
> +int igt_main_args("o", NULL, help_str, opt_handler, &data)
>   {
>   	int z, y;
>   	enum operations op;
> @@ -945,10 +967,15 @@ int igt_main()
>   				     "performed with suspend resume cycles");
>   			igt_subtest_with_dynamic_f("%s%ssuspend", append_fbc_subtest[y],
>   						   append_subtest_name[z]) {
> +				int output_count = 0;
> +
>   				for_each_connected_output(&data.display, output) {
>   					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
>   							      data.op_psr_mode, output))
>   						continue;
> +					if (!data.all_outputs && output_count >= SUSPEND_OUTPUT_LIMIT)
> +						continue;
> +					output_count++;
>   					igt_display_reset(&data.display);
>   					data.output = output;
>   					igt_dynamic_f("%s", data.output->name) {
