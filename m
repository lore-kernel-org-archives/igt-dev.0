Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA86EFF8868
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 09:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C5110EA74;
	Tue, 28 Apr 2026 09:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2xP5Lbt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933ED10EA74
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777367085; x=1808903085;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zafKE/zgm2GP4I4uDKS4urj19C22PLlOl55yqeSqFh4=;
 b=I2xP5LbtPiAU/1yMB4iB4LzOOzI4qLtF2byvmayeyZ/FYVdHjMr4kvDu
 S5MW8WeEa86xhKHt7XpfF6OXVAZl/w9jM4QyDgySBUTc78XDzhj3uftR3
 eDg5yzsJDbflRXj0wJ4DmHUDz38SIK3ROkJ6DGDrIpVkl8kCSleKzmdTt
 LSj15Dj2kIzSdk4dN6dAn/ZpgP3xeHBBzOGgJWJwTkCDknHduJC87ekF3
 xD4jAh2vat/Cwqip0cIxRdfWPeOuWVzhmNLVkOK8ikC+QUK4U8OdUE943
 hEZe5Ii5FYbkG/VIwu22RThbnBJN4Z2m0tobxnsaawtq5emSY/gVbEUvY Q==;
X-CSE-ConnectionGUID: z9ZFCuDdREaf4hTnFCenzg==
X-CSE-MsgGUID: O01bUlJlRWuD9K4/zZlIHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="95684567"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="95684567"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 02:04:45 -0700
X-CSE-ConnectionGUID: c2CcUDuYQxSJe2kMOxdNJw==
X-CSE-MsgGUID: GmYLwCtcRkCphFqk2IBIPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="234178112"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 02:04:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 02:04:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 02:04:43 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.45)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 02:04:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Op8AObZdR1qzPMc+5qAUWA3kqyFYcu7QZ61oeQ8iH2oiKN29OrR0dqlvwZ5x/CI0kc1BGeQ7tJ8YsJPYaZLfrP3pVDlkumHZhTfZm8L+ZRvfWy6dU8RS52NID39zU5DnH+nr5kLzQtRkGZidWFPi61y0JnUPSfc96YDECoOsxL8bPMumUdA1CyYG+Bu7tgPbCUqvYSkfe1l8H9ueL9KYzOOmRVmbiT5ArkzolfwwkOEjz0HKTb00QoK0bPUyspXQIs2EG+8GskBSkij5gmaBrQWhm6m0pHFZGg1T/mFoameXrkdBfJ2EVpiqmAUDBJTwU9/thNbzQYgZ3ynL8jLYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDpYaSvshuaSzzXZM4BEA6vggKub+OQHSj189Tqlj7A=;
 b=Ordmm1zJSL/JjQRbeVfeqg2H/rn/BtfC7tIosPxl+88z63Y7x1X/RgFAYECjGFZzE7fe3bHtc7DmyDjYYK+cEHMmQ9BqU67rK22Wfr57VykN8AlngrOa6fzCjXE3db3m8IoDZZQFmCxL5dksLlcrQzh4mUrOJZMy2v/otBl4LXeKbcpjkFPmZX/Dx6QWG+6SHm8JMQt5+TNOXfANUMkIMZlRT11GBonLP+6hcH4aJkQqxglMju382SLtVntkvx/9929wM9IYBglZ5s/H/QARJ1t7eoRo0D0tlCeHxEEFDXr61bt2k2/T+ms2yza5b6sYUPYwLvCsLIJcUMVgw9CcVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 28 Apr
 2026 09:04:39 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 09:04:37 +0000
Message-ID: <023dcba0-b694-49f2-9fcb-e8c4ac8f3007@intel.com>
Date: Tue, 28 Apr 2026 14:34:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/8] include/linux_scaffold: Add BIT_U{8,16,32}
 macros
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
 <20260427124607.3115567-2-ankit.k.nautiyal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260427124607.3115567-2-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|BN9PR11MB5276:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a3a2eb-c088-4c64-7796-08dea5052c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|42112799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: t7IOJQPSgsu/jlmk0gO4WzYdMTIMCKQd54cZbTljIqHO9C+mSHeG4uFRvcN1SM+FryAJ3nYN0RiDWp9UGX3yBI7js0q9Y2maeI58SUE6/GD/o1aAKSEoRk156ljqke4wR47ga12JBqP7fcjAM9CAffSVK+WTDOR2PdYCArHi40QsQDOV/x6NeT9Lcyomi3AE8Qsjh6hwUFNiyVRWy3pG1ieVbbLAaKD8qUU1OoBeFONec9jxTtQvoE9MQBYvX0zbpFNIKI1B4DJJTaGtiDzWLOxmCtJ587vd4FTLBcLsQQSVFLXhuBC2Pf9POVlcrPvJ/+t6AiD53oJNnjL7ipSvHoWv0JXGzD1SaMKWqXVcSklawIRqVu9bpbm0wvrkoTaXY5gRMgvg2NE+idG2g99ltNfnhW0MyZAWZGuprEnYELl+z8CSpZ39C/xH5RH9D5QXbR+q2rWkx6v86I11sm+DC9URwaHAO2TcmI82g+SsvTczfg+PGl85pqXZ5JCvXnQzhF72d7y9Txa8ThP8hTKK/nBPQQF0mXdWsDAZkzaJYWsRW3e05sg2emImuew9hXaqUBi1mFytQ2bNtgsLHqRzSNxMoVHzR1qcdLb6SCiETo879KcN0XlZvjFEM7ZyDJ1H0C7pzinLcH9MWGn2cctwJYVD7Ak6KjW4TXxDHYnysBzWigOQvd8HBlD+mEZLsxAXCpS6nnibrSOZBdOO0Yh0f0yyf0Od49AZMv52xWPhKGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHBmUVRoWTZuVTVNSU85Wit3QzJYY0FKTGl6clJZTGpnT0o4RWV4QVB5Zkdi?=
 =?utf-8?B?bnJVYVpiOG9KUXpreHZENWdRbmNtUHVHSFpBUmp2SFpsVGVDY29QZUxxYzlj?=
 =?utf-8?B?cFRiR0FyRUM5WVpaZzIxaEx6cXIrQXkyMGR5UVUvOXZzWXJ6TmhGRzZCbEVD?=
 =?utf-8?B?cG5aMVc0djNLNi9XOE5FN0VEVjdPeXpIUXN4YTRqZkpqSnlOYituMHFCbGxV?=
 =?utf-8?B?cythMTZsMThnbHVMR2dBRFUrSGgxeGxhaG1pa3BXV20wcUQ3QUpoaEJzQ1R0?=
 =?utf-8?B?dU5OUGt4bVRZdEx2TGViQW82alYxMGpNMlFiemd5SExRNEFxc2c2Z3Vja1BJ?=
 =?utf-8?B?T0Z3bnQ1VnJJcFVONkpIWWJ5Smk1OHh4QXBPOWRjQVZIUGRnZ09jckhEbzFa?=
 =?utf-8?B?QWFFUzd4UThRTzc5M003S1AySkR6WVdTSWdPdUNRN21rdlhmUjVkcllOWXZB?=
 =?utf-8?B?NnpHYi91RUQ2MXJLZXlRMk9XbUJIWEx0TWZpekFNNVQ4d1BtZWhaVTlBT2hW?=
 =?utf-8?B?dzZzVC9Jam02UDVuSThwSWhFN0NxK295ZUdHaUZWYmVWdVUrZnJKK3d4dWJG?=
 =?utf-8?B?cjVnZFpJTEhQbzlDZzVvdlVXVzdweWZLdGo0cnZDUnphQlN4TVcrZEFUZDVE?=
 =?utf-8?B?dTlhbDV1UW1iSW9WZjZpQ0ZQcHk3bXR0bEd3OVcvTGZ6NGcxUEpONVJHN0JY?=
 =?utf-8?B?S2pWbnpDMUN5c3JRanViaHlwMXVUV2dhTzdSSXBkbXRSNU1GYzRiOFVnRU44?=
 =?utf-8?B?RGU3Yk1hVDAxcVJBbVhEVUJxQnZ6V0RyeUVQLzhmU3MwQzFmanp6NTVpcjlD?=
 =?utf-8?B?dEFNMVZuQnFkT2x4YjByYS9qSkFtWkJDSjNTQWY5eUZnMnBTeU1pSUlqQUE5?=
 =?utf-8?B?dXdNYWsyenhJajFEK09uVUZsNWxNT1o5enREbW9XUEc2RjBNTXZoNXpVN0tU?=
 =?utf-8?B?cXVjNkFQM1VVbEdtYThRK0Nmdm5ETlZvVWlVaTRGbzNGd284WTNwWGt1ZDFW?=
 =?utf-8?B?ZjJPd0dMWFh0bDBaMWMyK29BWHY4VWdtK01SaExaNGs1S0RKRm8xemxKRFBo?=
 =?utf-8?B?L1NqT3M3V1lQcnBabDZrM1NLTmFyRjhqd3BtT0MyMk0rMzBQUjhXbVFSV1cr?=
 =?utf-8?B?YVN5OXhpRU5qSjNUM1hmZ25EeWpzYWZuUEtDY1E1VVkvRGh5QXBDTXNJakJZ?=
 =?utf-8?B?cVZtaDdyQUp0eTlSQUYyaGxLS0EyUm9GaFkwYjIrbjFzVUZMUy9HZ21LQ24w?=
 =?utf-8?B?cVltNXNqekdtWHYyUXRRYU51bkFuVUZuMjUvTTRNZVc3YXVEb24ydmNSQ1Ji?=
 =?utf-8?B?QlZSTGh1YmRGNzdtK2JBTUFURjFYVFkvS2FIMHVDaTc4UERWdENNa1NpeVRp?=
 =?utf-8?B?d1FDRlJaeDdmdnJ3Q3NCUTJuSDJVZkpENEUxeXE1Q1JXaWxTVy82RWVyQVRn?=
 =?utf-8?B?a2NwSVZjaWNncGVJOUxCbFpicDFyTDZ5a21KNGhTZDNFZEU0NjZyR0NkVE1V?=
 =?utf-8?B?cGxvSlhOekYvRkVrbHIxZnJUODJLVXZLVUZ1UzRBOStjSDZYT1J1S0tCMzVV?=
 =?utf-8?B?dkxtVHl2K1F5VUYwenJZcW4rT1FNaTEyYnI2YUMwQjVkd280VkVNWXI4ZTlT?=
 =?utf-8?B?ZGJsaUU3RysvN1Q4Sm9XSHd5M21XTmlvR1U2YUhtNGcvd1kwQmtvaVBXWXM0?=
 =?utf-8?B?ZVdTd3d0d1NEaHBGMW5tRmYrWjNiQnVkaEdvdmlURjVwTTNrL1pqTFJuWWJy?=
 =?utf-8?B?WVVtaGwrNjRrN1NzWitjWFhzdlh3QWRoQVQwWjM2elM0UkNvdVVUdmI0bHdP?=
 =?utf-8?B?ekg4SHZ1NXNDOUcvbGFyaFJZZUxheTdneHd3MHN4UlhQUy95emFKeDlHOVdp?=
 =?utf-8?B?ckJVem9tME10VlpGeGNtZ1pVeUU1SlIrRzZ1RFFOVStzamwydVR0VStuVjhQ?=
 =?utf-8?B?NkZXRGFRdExlN1kzUjZQUnlpbU9DMUFzUmpva01nQWl0YVNLbTk5NnpvQkR3?=
 =?utf-8?B?TGhrSDQ5Yjh6S0FMYXA5UU5DRmI4bGdpVUpqcDJRVVdFYmFhdDI2MG5MNjI5?=
 =?utf-8?B?alNCUU91SWxMN0xMOHJEUmhENFQ5Z0h4WHlEVXlaNElGK1M5SDF0MU52NTdm?=
 =?utf-8?B?dHEvVWxHZDNzelNWT21uT3hvcVUvKzk3R2tjeTlGRjlSOWluc0tuazJad3BF?=
 =?utf-8?B?ek5RT0svMWk1SzhLODBmNEl2MVM3aEcxdWhTWFpXMzJhVUlJWGJiUGd2VUQ0?=
 =?utf-8?B?Q25rWGNmYTRsL2NHSks0SC9MeGdqUUV6QWV2VloyMHpxc2w1TWt5MWVVMzh1?=
 =?utf-8?B?cjFmK1ByZjNMYUZmT0E5WGI1WURJMVZVRysyM0NMVzMvYTBuVzIzUT09?=
X-Exchange-RoutingPolicyChecked: WPtjKqRuWiS2RKyrfdozL4JOKgonTAxc3NXChf2itGDlIcXNgsrP4VyUQRUmvZGDKFL3w5nBa5krzNOitzqvVEvi8AYy88VJsFRArReZySimFkYbvJ8rZbpOVesptOTcIptkG+9hjieeqSuKTnyZeDKNO9y8gYDosm6fhfrPJMvuu6+l14226cqo0umK7qvPK6CYBY9VixcFNHrjnVmcUfH/TraZ4gRHdJItLDHIFDVhi9Ss6/fhJGz6W0wTUVDWzd2AqJhVcZ0olXZIxZPreb1KIlINx2UtTjffJrpMsq7glee6/ZkqvCQXogGaeN+4Gn9J3ui9P9AdvPYZktq9FA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a3a2eb-c088-4c64-7796-08dea5052c6b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 09:04:37.6492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQ7aNdrqh9esWLSDevDdtUATxlWqc/OVfC1GE0z2tir9bumXZgLhEAqC7wwQydDuWLIJ+def/hxtS2JXty0Ybg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5276
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


On 4/27/2026 6:16 PM, Ankit Nautiyal wrote:
> Add macros to accommodate the kernel macros BIT_U8, BIT_U16, BIT_U32
> in the header file `intel_vbt_defs.h` copied from the kernel.
>
> v2: Add BIT_U64 for completeness. (Karthik)
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   include/linux_scaffold.h | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
> index 281aa5e730ed..0c970c86079a 100644
> --- a/include/linux_scaffold.h
> +++ b/include/linux_scaffold.h
> @@ -57,4 +57,9 @@ static inline s64 sign_extend64(u64 value, int index)
>   #define FIELD_GET(mask, reg) \
>   	(typeof(mask))(((reg) & (mask)) >> __bf_shf(mask))
>   
> +#define BIT_U8(n) ((u8)(1U << (n)))
> +#define BIT_U16(n) ((u16)(1U << (n)))
> +#define BIT_U32(n) ((u32)(1U << (n)))
> +#define BIT_U64(n) ((u64)(1ULL << (n)))
> +
>   #endif /* _INTEL_GPU_COMMANDS_SCAFFOLD_H_ */
