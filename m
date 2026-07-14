Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6C9C4450A
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 17:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E8010E08C;
	Tue, 14 Jul 2026 17:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lAFVC7yp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03E110E08C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 17:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784051170; x=1815587170;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BR6HO5KV5qtOSQ79f7yIZLQ8SUuVbd87ZqmP50V4W+g=;
 b=lAFVC7ypkgGv4LEfnNnioYT5L+kY/x6zd1opoozQwHaxt5HkuTwa3evG
 na48p3SiIgskLIUP1m6Gl8HBUS7eTvgPtC8oAsFWhtd2KnAvzBsHek0Ah
 belBSEZBzMbwfeABKvh7UV3DqbDQ5ZE3Nm4KNkQTsANeVWIl7Dp38yZL7
 HQMdOOroFhG/01FmDr+86acM7yjbVWXJLRmYlV2AIN/I0HPp0ByhViURz
 JVGQWb67xGw2nStPLz9DlLcPg7vMgnRi/b0Wp78B8Fkd33bzD+4y0okP8
 1nLe6U0ImgwoPdvpeQTs4P7ZYo2/4ZGcv6bsSG97NhfVOUWACb4DT87BW A==;
X-CSE-ConnectionGUID: leoHpehmQdy2wIWSPEXgZA==
X-CSE-MsgGUID: 59pP65w6Si6hKWk5l4BzUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="72204815"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="72204815"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 10:46:09 -0700
X-CSE-ConnectionGUID: 75+FLJGvTOWU752N+i3XZg==
X-CSE-MsgGUID: FKOXc6+gQWe5/eoUdxZfKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="249564683"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 10:46:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 10:46:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 10:46:08 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.25)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 10:46:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8wHpcSYqCgGnj6aylmTVMo590yFvdYtTwR1jVtrb8ibBU/6D51Qa0TUo3mPEQeKVc952C5IX9AV5KNlyf7WlFgnR8yNh6qMtSpMbLPpNBzlpgSxtqZaVkOQSky9byar7YirJnKGVtUYetYoNc9MSVVKV/l4G3vV/oDKwNNnR779CuWRfCihjabzPjXo84pc86+TW8kNwmIMBR8JSyF0QZK1oI42Y3F1PeDvFJWlM7BZs05oadukuU38leb4ro+p4t7TWdt9n305H5Q2NbFGfERQ+foBHjARHuFn2XlUhdIkNSPk7B6Lo+xNkzfEAf0U09KMksvyaRqMgNoeGHSFcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLipuc4C1uoW00qiXlkpKGj/2eww/W5H9ThMJLrcj+4=;
 b=GMWHlHrj2JIX5MtYMH6Xp0+1MQXaHP1v5EiCr9T/Ggd4rlUoA07qvWtCOEAxX1KWQdxjohgJiOMzhfCa7JS6c7GOjXf8HPQfg6oIcJEWarNzvmSHOnj+Z2KJE2ARS8PJaYMWBsWsvCAq7rTVF1g1Bk7gMA5AtmJbdlBv1X7IXEJPNilOlBA24kP4TJ+xTbEUK9c6loqTG0VGXkpjYdGaOCTq7vckv1NP8fNOdCX0PplNg+PgYm3t1ZyJEe2o+kE9Fc5j+QrjZAzZv8eI/6Gbp7AJ9OfjDPMCIDfiGk94K3Ln2o55ZI+cwn+3Q16RD65/XtAajRxTQ3AdQJvEdc2X8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by MW3PR11MB4604.namprd11.prod.outlook.com (2603:10b6:303:2f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 17:46:06 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 17:46:06 +0000
Message-ID: <fde84a97-4eb8-4d17-baab-596b35ea628f@intel.com>
Date: Tue, 14 Jul 2026 23:15:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/intel/xe_survivability: update ignored dmesg
 regex
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20260709070905.405108-4-sk.anirban@intel.com>
 <20260709070905.405108-5-sk.anirban@intel.com>
 <20260709151204.fzvhu4voxtu3wv7e@kamilkon-DESK.igk.intel.com>
 <e563df48-ab6b-465e-9ca1-c2841976931f@intel.com>
 <20260714111010.ql7aaowfcyaicf35@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260714111010.ql7aaowfcyaicf35@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0298.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::7) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|MW3PR11MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd71a81-9d17-4e7e-1849-08dee1cfc7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|6133799003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: nC0tNhYtwV1hyIUgrIupBXHAkrCZvMGuAEGNN3ZtjCaLQp8Y27OF7mFxs2eZknOrwmE+U63d/7/tlmKYNnvYKFzHvEmwk3Qj2bwjLCh4w1OSgfTI9dE+2gF23IjwCcFCaXHokv+sYkDp34g6pVfWBZ9BMMFlNkgsc97aPM8osKz60t768zyYTYsEXvoct5aJ5oqgdAyBkVf0zFAORsOHT9kD7kFq65y6Kl4mozAXWXmnCOllsJO/njt5dgHCVQbCu2mtgdnrw5y7SdprtgcnoJgl3loTRivK7lmhCH6fogSulZOKAiGE7HSvkDSy0h+jKjvIf57za8RHqy3EcxH9+oCM7L313JvIOJGOZntGskPnaG7Ks9KFeX4iHfC63rBu8Scjnd01q1eg9T+NLpfCqAIeTvgo8wWIhsT6LgssxGE/8DXKfk/4I8RhFTMzDHaqetHLGq2CqfGkHLSoQlb7R0QD9Ekqq+ZkqaVUtWzfLrrKyE0j6KiIolug3UQZ4x6/9FG9TJeJmt3E6zqkqERasidvrEDs/Bkr19WXxD3Dl1YI2StFBxK6dY2WQI5SdVnBODhkJwsNEC13MXNV3jIh2iyMncFwCxZZGmGCSZypRxtzKCROzERLSHsRC+2C/kaw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXJVZDRHdWFnb0o2MTY3RGUxZi9jZ0ZueVZycHd3RGxvUERiNkFhZ29VaUFy?=
 =?utf-8?B?cHVRR2l3cmpsZDd1eUVLNC90STRKcXB4eEpuWU1uWFpGd0pkamx3TmozVElK?=
 =?utf-8?B?NCt6STNLRVdrOTlqb2wwLzA3Uitld0E5K3Z1ZzRtOXFzNlpCVFVyaWhwNTJv?=
 =?utf-8?B?ZVVvamYxMlp2WXpPWXRtSTgrTFQxSjBHZWZHVEJpMm9Vejlwbk1hK1dvZVpO?=
 =?utf-8?B?WnVvOVpydlhFYS9Gb0h3S1RxVFRBa1labUg4QWlYSTdJMzRWVExVSzFIMjRw?=
 =?utf-8?B?bUsrNnVFT2xhRGhFNlV3T1VIclUwL3VqLzY1M0NRZGNqWmFGRU9BdjVQSk4v?=
 =?utf-8?B?VDRUdzZFK2J5QWpsa2hYSW1pbTlBckhEZ0tET2lWL1RoTHpXN2JjVWEzaDkr?=
 =?utf-8?B?K3JPa0FyQWcvbHVkSFZhRWlycXpXYWhkaHFVbExtZjJOdCtHYzhkdXlPZ1NF?=
 =?utf-8?B?TzFqNm13VjJnSFcyRitTV1Q4VmhiU2V4YVdEOU9SQThlT2IxeFBvMlIwUS9D?=
 =?utf-8?B?ZmxVMHNGVFdPNE96aHo0SnJsUHFlZDZkb2crQnBVY2QwMXJVMjY4a3o2TTlD?=
 =?utf-8?B?UHUwTkZoMVN4aWpPbVd0RGczaU9XcWRTSlZlQU56SmpVOUU5NDZRMW5UUVMy?=
 =?utf-8?B?ZkdZMW0xTUxoZE04Z01DU25pTUxZNUp2SUZpZ3Y5NVBoTExzZXAzVU1OVitx?=
 =?utf-8?B?Wlphc3VQVElza0hWTDE0VXRVWXZ1RUlXOUU5WU83b0p6ZHE1RWV4SlVFZ1Aw?=
 =?utf-8?B?MDAzcFJFSEgxejJGS1N2TUlNcC83YWYrdk9ENWFEY05NRjU5MTIrU1ZYREI2?=
 =?utf-8?B?VldTRk5VZk5qTzd4RjJSMWczNG5LeGJmVXAzOEtseWc4ZmtEWFB4RU8rQWd3?=
 =?utf-8?B?RGdDZVlBRWhFcTJTODZ6UFdSMDdZRXo5M08wbmF2ZHJYYTRIQXlMakxJT2ta?=
 =?utf-8?B?ZkN1OEFJQlBxNUNQbHFCNllSTmlnS2hUQUROeG92RFdMYnlIMmprQnYxa09n?=
 =?utf-8?B?SXRRYlVCUzhqNG1EQlhObFd6QmRMYXRBdTJsZkVHSndEMXp6ZllTZ3dlNVZU?=
 =?utf-8?B?a1IvdThTWjNQN0QrMkF3R0RKZlI4MUZ6Rk5FZlc4Lzl2azBVc2N1WDRpQXgy?=
 =?utf-8?B?UExPVWVRSVcyYTdJdDBrVzBiaEJ3bXliZy8zREF4UmJmdU45YmpkWUl2c0g3?=
 =?utf-8?B?OVVNNWRKM0NPbG5BV0tFenpMZndieHJpSTFUVUZzV0M0eGptckovSDlGU2Nn?=
 =?utf-8?B?dENrTVBiSWM4QzZGRzZMK1cyQ2xLV0hXSmNXbTlpMUE4MXRSTnFjMzB2cGVt?=
 =?utf-8?B?SVlBUTFjQTJrME9IN2xWa3NuQmFEK2ViSWFsOTJhQTlRbEFXRFdTd3VGOEVE?=
 =?utf-8?B?cEFHd3A1V2lqU3hJR0hNYSt3eStJcTVQMmVSM0lwYS8wbW4yeHA2WnFCbk0r?=
 =?utf-8?B?a09uZFlPNXR5RUV3NVBaNGNtaHVPczdLZDhjZnRaREpNODlQaWp2TVc4RUVp?=
 =?utf-8?B?TUdPZHA1bzVhZWU0MlVkUk1KQk1ySG9obXR3Sy9XTlJwZ2FPSVFxaGlNZ1Fz?=
 =?utf-8?B?bHhrdTZkUFBLMmZyK250bW9kZ0lyaWxSS3pNcU9nRnhJL0h4VVNLUkM1NmlX?=
 =?utf-8?B?UmRDL0lmT0xYM2dzQjdDMEwzLy8yeVRaTEVrd2ZiYXM2ZHh3L2lvMExtS0Y4?=
 =?utf-8?B?Ukg1QWsweGRxVXk5bU94bVJ1VGcxL291cWJ5VHB0bDVuU1psVUJrSnVSWDZt?=
 =?utf-8?B?ZnNiM0hXdzBPdm9vK2ZtNm9qWS9OYW5wMmVNaFlUblE0Z1ZvTWljbG5SaWJl?=
 =?utf-8?B?Q0xMVEgwaXhMM2ZNOHlwL0t0NE9VVU1TbmQ3ZmFuWURQTzROWFNvamtRNUE1?=
 =?utf-8?B?emlReHgyQW4yS2Q4cnRiL3JlSGI2NHo5dzFNR2hmNVNqZUMrUEljN2ZqOTdU?=
 =?utf-8?B?d3A1YlkrSHkxRkNVd1pvVnVjcE54SGNRY0dxZnBEQVFyMEFwWkpZMmdVWCtw?=
 =?utf-8?B?elhTc0RKY3o3MUVzYTZnSHpicEtqYnBKNzRrN2thQWJpVm81NFBQWkZNckx3?=
 =?utf-8?B?ZlBzeThrcDVFbTQ2SW9hNXExNXB4bkFBS2tmWkhlYzBIZ2R2N1B0dy9ScGhz?=
 =?utf-8?B?V0tzSzR0bTlEMU9JQzNySUwwN3d4ZTJDM2VaUjQ1ektsS3M4L2JQYUhlYW1D?=
 =?utf-8?B?NjhwQ3Y2UE0yM3IyWjAySDJaL2N6aXVqOEs1M0RaRTdVb1I2VWRoMmI0ZWZT?=
 =?utf-8?B?cGdacm1zelBnVnJ3VzRsWGxubm9RS3NScnlhR09USnFZRHJLdTZrdEpxTEli?=
 =?utf-8?B?UXFKT1RWeXQrWnZ0S2l3WVo3M0I3MnBEaHVSdFIwY0Q3UUVxMnpMZz09?=
X-Exchange-RoutingPolicyChecked: n7lKDWb/R4CjBlqibDOUClpMzdIajaA59h8j+ci19ISH3pze3lcp/Y/vdRleazr4TblATZUHFrZa2Py4Vfr8m0Iv9fux8cR3oHu1Vzd3YkE4Y56f/Q7yqqgaWgDdJVhMVNIJqIta7Ea+95zow/DWB4Hr/9gOh5knB9ipyCyrHjmp1K0GErJ8gg4dm20VsZs2sF9ypujsZVwFBD21Ion1r0jlVbV5ZbmJJC9Z4/qAx1y6DxkFAVXNcDMeFo9gVup+FN7d9awixa3iIsjKPKwyvxEbbyjAKwAnjtjisjbPQJYG0orguT4SxZhmV6Jq6lh/Mo2tynPeZjNNg4HsSTCLrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd71a81-9d17-4e7e-1849-08dee1cfc7d6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 17:46:06.4009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPR5nkbJQmnW4ZiP0Bb5KPPk7Z6DK5OtHaN/KOpn2UfAgr5gqftymottQPc8mK8vUNKIwgMfpFAzF768KUcUBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4604
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

Hi

On 14-07-2026 04:40 pm, Kamil Konieczny wrote:
> Hi Anirban,,
> On 2026-07-13 at 22:59:04 +0530, Anirban, Sk wrote:
>> Hi,
>>
>> On 09-07-2026 08:42 pm, Kamil Konieczny wrote:
>>> Hi Sk,
>>> On 2026-07-09 at 12:39:07 +0530, Sk Anirban wrote:
>>>> The kernel now reports -ENOTRECOVERABLE when the device is wedged.
>>>> As runtime-survivability deliberately wedges the device, update
>>>> dmesg regex so igt_runner does not treat the expected error logs
>>>> as failures.
>>>>
>>>> kernel implementation:
>>>> https://patchwork.freedesktop.org/series/168780/
>>>>
>>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>>> ---
>>>>    tests/intel/xe_survivability.c | 7 ++++---
>>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
>>>> index 74488bbea..cc54b37ad 100644
>>>> --- a/tests/intel/xe_survivability.c
>>>> +++ b/tests/intel/xe_survivability.c
>>>> @@ -43,12 +43,13 @@ static char bus_addr[NAME_MAX];
>>>>    static void ignore_wedged_in_dmesg(void)
>>>>    {
>>>>    	/* this is needed for igt_runner so it will ignore it */
>>>> -	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ECANCELED"
>>> Please keep old value for some time (a year?).
>> As kernel changes are merged, we may no longer receive the same error code
>> (ECANCELED) in wedge scenarios.
>> Additionally, if there are any gaps in the kernel patches that still result
>> in ECANCELED being returned, we won't be able to detect that issue using IGT
>> if we keep the old error codes here.
> Hmm, up to you but it could make testing for older kernels hard,
> e.g. those which will not backport kernel changes yet. So up to
> you, both this on one below is acceptable.
Got your point, I will fix that in next rev.
>
>>>> +	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ENOTRECOVERABLE"
>>>>    				    "|CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
>>>> -				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
>>>> +				    "|GT[0-9A-Fa-f]*: reset failed .-ENOTRECOVERABLE"
>>> Same here, keep both.
>>>
>>>>    				    "|GT[0-9A-Fa-f]*: Failed to submit"
>>>>    				    "|Modules linked in:"
>>>> -				    "|__pfx___drm_");
>>>> +				    "|__pfx___drm_"
>>>> +				    "|-ENOTRECOVERABLE");
>>> Do not add such, it could made to ignore errors in unrelated context.
>> ENOTRECOVERABLE is intended to be returned only for wedged-state scenarios
>> by the kernel. I think the test should ignore any failures that return this
>> error code.
> The problem is that this regex is applied to kernel error and
> you do not know if it will be dropped from other contexts,
> outside of your test. So it is better to make sure it was from
> xe driver. As it is now it is too generic.
>
> Regards,
> Kamil

Sure, in that case, I will also add a few error messages that were 
observed recently for the second revision.

Thanks,
Anirban

>
>> Thanks
>> Anirban
>>
>>> Regards,
>>> Kamil
>>>
>>>>    }
>>>>    static bool check_survivability_mode_sysfs(void)
>>>> -- 
>>>> 2.43.0
>>>>
