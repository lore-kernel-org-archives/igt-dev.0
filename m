Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077BAC61DD6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 05:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DC210E453;
	Wed,  2 Sep 2026 05:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i43Y9TeX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8BE10E45F
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 05:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788327625; x=1819863625;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JlFnx95QrGSMa2jdLnTOm0jPVdGQhpG/e3AFxWjAXqQ=;
 b=i43Y9TeXY6+puA5WHy2B67VSANeM3LUd31SgCbBErFR5NDjOle5czXas
 KgbN4uyj0CwrITMFSP1+JNo3XPW1PEsQPnhQ4UgT9IfVIIioBd3bqS+em
 1LweTCneG3vwEw8+M95jmF40t63VSJSvcpg52s5nGGHjGinpcr+OSEsGt
 gBrYcgitE2eS6VglFxOIOhVpuhRMIkukJjL/oQgaLtGMfkafYRpFQL+bm
 f6w9X9wmFhWpcwWWXFM4G1L3K3rJ0u3SML1VDokv9HfNZyj5D4jryQT8x
 G8kIlbUKZPVJOysiUKeE3f1eIfguI/iN5HGphqDDlk57QO6sY2/UlHsKo A==;
X-CSE-ConnectionGUID: f246vrVxQQCTdj01Ou6I9g==
X-CSE-MsgGUID: d4EGd+87R4e8Q8iaMu9KsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88623709"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88623709"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 22:40:25 -0700
X-CSE-ConnectionGUID: XgmBw0YGTCynEp8uLkx4bg==
X-CSE-MsgGUID: z2iM46rNRcOpQDSsSmcuPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="294134934"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 22:40:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 22:40:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 22:40:23 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 22:40:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwUblUVdQLrs0WsTiPWHbp3pBmbISBTGagK5PU+rXhPlLU0I1oFWTZRIKvWUh/bGfQZqqMQorUeDU4c7DrPauit8lLMrCIs86sK0JBREYojVRlRUM8PjBw8zZ0P6tazWpY2OjcRSsCn0gKlwFRaNYzB0DfmYXtQDpp9lae/1sBJed++qWkS18Oc2NLYjJ+cNVCoTPrXD6EAfO5fOlzB5vQyL/wVkA4d+598lbxgjPmATvp87+HnT8Pw5p9s7LnwxeOeuuMB5WE5whcC95VCfKvPKb1fE41oNaFlPzz2kLbkRgeJJ0JVPUSLBqrsXCdPlOB9jnK8+wH6PjNHbs1JPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqCDfE1pJoFy1i34nz497lNlYGvuCbRaEnOq6MNIHLU=;
 b=FXJXpKuzrtzDPbNFJJfKA8lfKgVrAJh1BxVy0b5vvsoV7CjUc7vfhTnfUQkR+sKfqV2RADF6Hovs9FnOpLCwATI2o7ma77DT+l9vDcXRSrWAG+rxXHAGn5BTUrLl2oLwl3Db6cSYboheT0Ilzw4C8ijxxUucudGPxOqIE+u5r2Ghm3jFKh1d6tsAeyzADH+WHt/Sg/+YPSplq5G565/IJrJMtuadQgi0dspSOyM4sYaaA2E9k8G1EzYmHBY35fsS/dAv2TcQV39F6zxA1StN2zgEK2PmQoijQNfxgoKMEsT38nfD01UQ2kIwvxqtBkBwWYZJ5ZRmdIqFTsMVqMMEfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SJ5PPF263E38237.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 05:40:21 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 05:40:21 +0000
Message-ID: <8b3a4af9-b040-42f9-8a36-3357f8804107@intel.com>
Date: Wed, 2 Sep 2026 11:10:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/kms_colorop: Use local variable for color pipeline
 cap
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Swati Sharma <swati2.sharma@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
References: <20260803080340.2088027-1-chaitanya.kumar.borah@intel.com>
 <20260827153627.cn5ou4ornidks227@kamilkon-DESK.igk.intel.com>
 <a3be5162-3fd0-41ad-bd2b-dbc14a4e2860@intel.com>
 <20260901165532.jsp45zjicwvdeh7d@kamilkon-DESK.igk.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260901165532.jsp45zjicwvdeh7d@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::14) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SJ5PPF263E38237:EE_
X-MS-Office365-Filtering-Correlation-Id: 560abfb9-7861-40ed-446b-08df08b4addb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: v3d9s4bWWPkwHLbqW71ESPKbb5DVzCmt1zcHCDF2mxOgfkIW4RTkdWPd26g2VyGATD6ZNIbqLuT6cWy3NLS/7dLXZQ0sS3kBdJHLQbvoZ6eZmNm3qRXbGpCSi1dA/UB0kEvSZZPQ9i5QQ1jBBb6IvQyodMd9NE90bNDs+vQ5AzRxDJYL/Zc0UwPnCFotsByiltaEPGVqY4/WaKk4I9KsIO2TZzGjygHxnNLxI507ItWhzE5g9jsZAZ5S9WYS5e3f9Z3gfo0BAtecIH52+bcq3jaVc6kUCHeHBuVh1U7jQTw26QM6/AYMEyinn4Qqm9ujZGPXi2nseMtOHGWloz9DRGKZnCJwfHe8HyxbsAkKiHxQ02dx/DiaervxWAV/JohHNe3GPnm+nmn71bOiRMwHiMAP5au9HQfFVAUnt1OTa3q6+Dt+ZdOPBamYTeNHMB04HLVZF4Xj37szvx+f5g4J4NKo5RmyW7+YQeeuKZMQRrGm2QSS5U731UzmZgkM3Lzf5JNFp/j8keCfMyQxOB14pHvJ/6NagxcdhfzXDT8FC1MGYY2vOmpybeW9wNTldBwIRJVEqkbF/bPFwDWMHCxO0gatAX3ZnuMtWrTK6P11s1fAs7AOWdn86q3davChMTMknpZ5dRz1yRnhPoTaNorYgApFcw0oRSow7Qb51f7mi9E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVk2YzI1SEJRTTRUbVA3Y2NtVTZ4YmZhR3pwWnNuMi9UM2ZoSGQ0WnlSTjI3?=
 =?utf-8?B?a3kybzhCTzlEOEZGWVZJVVVzY3JQUFkrTTZGRVdOTWpjdGljdi9NOFcwRU1O?=
 =?utf-8?B?bXFoaFg2c0ZRZ0NPWm1ZM2F3UjhiK3ZvY1JlZmxSUFRZZEdsc0Z4N2pOVyty?=
 =?utf-8?B?Q05SWjJITDR5ek55VURrYXBiYWdDRXBLUmIvNU05MXBHRGRiM05rbkxCS0J0?=
 =?utf-8?B?bW1OclhnZXhJQkNXMWlWY2JmcCtLNzF0dndtV3BnVmhwME5JZ3NwZS9obVUw?=
 =?utf-8?B?TFRYMTZCeXNmNUFhQ09QVEZEeDhZUGxES1VIdEZyZ1dFaWxkM0Q5WmZEcThR?=
 =?utf-8?B?aWlkUFpydkd6aUxjRnVQZ3VXL2NobHlNWmZwRHhyaStrSGhhcjNEQmhNVm9m?=
 =?utf-8?B?MFNpdEpheDAzMitDS3NsZG1PaGNiS1YwL0NORjRObmFvK1ZkN0tZaEJrc0Nw?=
 =?utf-8?B?cEd1YTc1K0cyT05oZDE0ZnRXMVJaT1pRUFYyQTRsa0lORnorZlVyWkdEUVli?=
 =?utf-8?B?eGl4VXNSTm0xNFJaQXYrYzV5WTRlcHdSOEUrQVpndGtpUXVzejU0NEd1dG1W?=
 =?utf-8?B?SVd2UGMxMzdRci9jc3Rpd3lEdTlLL29uMFZuQ0U1bVlTaG1xTm5YZzNiK0Jx?=
 =?utf-8?B?YTdIUXU5cTJlZGpMR0ErQW9KZEJxVGFRV0wxOWlyNUE4N2NhNURFMS9mdjFz?=
 =?utf-8?B?ZGRQakZLamFYdXlmeVRHN0lLaUpPTlN4WmhnQWhiMVRSdGxxREtOUlhlaUls?=
 =?utf-8?B?VjF6NDd4TFlsUTVva2RiMDZieFUzeGhzUmhhSHFKZVdvdEpUQVZuQWxUTTNR?=
 =?utf-8?B?cEo1UjBQNjQwYlNtNzZPU2JEajhpdTcwa1hrankzQ2dqVUtNd3ZEelhndkFr?=
 =?utf-8?B?c3lpbStPR1RXM2M4dlNaaDR4MFVzNnpEKzJRRG1saTd6VXZxcEIweCtaeUN5?=
 =?utf-8?B?RG4rZ253bkhZNmRrLzI0bXowU2JNN3Zudjhuai85dHhuQlZEdktTMU5JQ3ly?=
 =?utf-8?B?bm5GYUg3S2tEQU5QSEd1UUZWK0dUUUFjL2N5OUZzd1JWNmo2SGpQdDdJb3NL?=
 =?utf-8?B?Ti9CSUs5WVhzRGxneWs5a1FnUDR6bVBzMHV6QUxMZ0xsMXQvS2txeFgxeTFo?=
 =?utf-8?B?dVR4UTdBWFJqRGphVW12TmRBREdjQkR1RnlkTXJmcFNzRnFjVUEvaDNMU0Qx?=
 =?utf-8?B?NXI4cUdNRmk3bU13WElzcnIvNktQT3REb1NSZHJtbUxoUGIzVGUzNWpucXZ5?=
 =?utf-8?B?eHMrV29MUDUraDVjWURJSU1pNnRqbDd3OVNsRUJyR2pRNHh3dzdpTHNSNlh4?=
 =?utf-8?B?RnNKODc3TGdpeU9VQVJCTGMvb0ZrZUUzbnJ6RjJqZmlFTTc0dUhmcVZxZDJ3?=
 =?utf-8?B?K2xIVlFUa2JKV1I3RjlncW43RGJPSkplZGFWTXJaUVpvcXZFRmxGVmZlNjlt?=
 =?utf-8?B?WXRYS09NbUZ3L2wyOEtJYmxQRWFnWWdwSG5zYjdNWHRUcjRTSHpMZkhzYUlN?=
 =?utf-8?B?SjVmYUpRZHBoRDRaUU9qN3Y0K1pOVHk5VDBPUGdoSlBJQ0ptMFlvVUZabXM5?=
 =?utf-8?B?RlFyV0Z2L0dZNUpCVkgvMjdOUHFrUGhjSmhvcTJBK1JUQm8xYXA5YWxMV0tp?=
 =?utf-8?B?R0lvSGF4M0RybUtyTFlYb1dBVXkvVHNMR29GQlBndzNEeTJKVEl0YnFkSGtw?=
 =?utf-8?B?cXJTUW9lUm1JbWJwVGROZHNTd0RIeDVzTUVycWFwcEJVNVhjMzVWekoyTjN5?=
 =?utf-8?B?TWovRDVQbTVlc1lqLzRIS2JXQVpQODUxa2pqSnp4TzRjUDFQR1RqcVlPajNL?=
 =?utf-8?B?dzkyalVESGhzSnpkMWtPNE9wNXBCQkU5L3VmeHdXZ0JnMWw1djFUWUtDN3Fv?=
 =?utf-8?B?RjdMYUlkampkbkJqMytyVE9YY0xub2gwV2dmbFdHNTZXV2NhLzFKdTRJcVc2?=
 =?utf-8?B?Q25FK2YxdkV2WVpOcEZEVzdqR3F1UzZwQTdEeFFXNk5kRVdhWldLcjg3SWlV?=
 =?utf-8?B?amRGTXVwOU5PaS9VejBIeHVsNGprMGlJNmlGQm0xY1BIcXhzTVZKM0svYjYy?=
 =?utf-8?B?RXhBeUhyanFZWDhiOEtGWGgxSEJFRjdBZklkdjhnc252djdBeWhaNEFUQTZY?=
 =?utf-8?B?cnVyUjVISklyRit0azdZckMwNmNyakNJWEJpelg1Q0h0VTVQbko1d0x1TXhn?=
 =?utf-8?B?d3pNYzV4OS9ub2p1Z05tbVhrOEVQaFNNOVhFMkh0VFA0S1M1RXNUZmdVYkF4?=
 =?utf-8?B?dnloOEx1S3N1NjZRcVBYWWtIZjZ1ajhiRTVHRHg0S21rR1kzZnBPVjlLWDlj?=
 =?utf-8?B?bmtlWG9pNi8xaFlpR011VjI2eHh0Y0gwakhoaGtXWVhlaXBpcFdaZ3ZwenhL?=
 =?utf-8?Q?xafBTGpEBC7h3CNc=3D?=
X-Exchange-RoutingPolicyChecked: vLX9GD/i+4jubNIUnDKSqqHbRZ8H9reFHJa7xlJEdbcaM0JxsV6NTo4pfvXquuDRWXK/1H6ChRDkUM+T0jVVZjKA2/heGhnCvuDL/qSsGBisFJHk7/zRpPXH/llquBD6Yvh7pPDX8v+aHh9tbbrFZh5OGsKp9MuFfPIUIxR50NI8IE/udgBCS/IR9FuTbG08TuiFLuhb6JJcPyMt3weDIUIaENCAQ6jW7KVfpC6wNhVJY/f5GO702fottf5dSxLnax3Bv/tXiKlCelUD2C/21LSJviTqFMeC0/Tk6Iq0AN0gRLCp/CFswVJP839rwOS64fZLiQYhKuuyJQVZP2C6NQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 560abfb9-7861-40ed-446b-08df08b4addb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 05:40:21.5282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Vv5bMxDk1jT5CC5b88gUilFmWxAJU0ZyhaGCSXXUz0wG1XKg0zY2asIvQpb25+DXUBRON1F9o6Joyf6QhMk0fThyYVh/uJn8trVB9EfG4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF263E38237
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



On 9/1/2026 10:25 PM, Kamil Konieczny wrote:
> Hi Borah,,
> On 2026-08-28 at 15:35:29 +0530, Borah, Chaitanya Kumar wrote:
>> Hi Kamil,
>>
>> On 8/27/2026 9:06 PM, Kamil Konieczny wrote:
>>> Hi Chaitanya,
>>> On 2026-08-03 at 13:33:40 +0530, Chaitanya Kumar Borah wrote:
>>>
>>> small nit about subject, please do not use "C code to english",
>>> rather describe what you try to achive, here better:
>>>
>>> [i-g-t] tests/kms_colorop: Get cap color pipeline only once
>>>
>>
>> Noted.
>>
>> Swati, we can perhaps change this while merging if there are no further
>> changes needed.
> 
> There is one change needed so please change subject, fix source,
> add any r-b you got and resend.
> 

I thought we can avoid a CI cycle by not re-sending since it is just a 
commit message change, but I can resend.

==
Chaitanya

> Regards,
> Kamil
> 
>>
>> ==
>> Chaitanya
>>
>>> Regards,
>>> Kamil
>>>
>>>> Following the pattern in kms_color_pipeline, set
>>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE once and stash the result in a
>>>> local variable, then propagate it to display->has_plane_color_pipeline
>>>> after the final igt_display_require() (which reinitializes the display
>>>> state). This avoids calling drmSetClientCap() twice.
>>>>
>>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>> Cc: Alex Hung <alex.hung@amd.com>
>>>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>> ---
>>>>    tests/kms_colorop.c | 9 +++++----
>>>>    1 file changed, 5 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>>>> index 16db0b8ad..d573d2ceb 100644
>>>> --- a/tests/kms_colorop.c
>>>> +++ b/tests/kms_colorop.c
>>>> @@ -406,6 +406,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>>>>    	igt_display_t display;
>>>>    	int i, j, ret;
>>>> +	int has_plane_color_pipeline = 0;
>>>>    	igt_fixture() {
>>>>    		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>>>> @@ -417,15 +418,15 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>>>>    		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>>> -		igt_display_require(&display, display.drm_fd);
>>>>    		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>>> -			display.has_plane_color_pipeline = 1;
>>>> +			has_plane_color_pipeline = 1;
>>>> +
>>>> +		igt_display_require(&display, display.drm_fd);
>>>>    		kmstest_set_vt_graphics_mode();
>>>>    		igt_display_require(&display, display.drm_fd);
>>>> -		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>>> -			display.has_plane_color_pipeline = 1;
>>>> +		display.has_plane_color_pipeline = has_plane_color_pipeline;
>>>>    		igt_require(display.is_atomic);
>>>>    	}
>>>> -- 
>>>> 2.50.1
>>>>
>>

