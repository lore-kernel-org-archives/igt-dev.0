Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9846ACD98DE
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 04:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1419110EBCF;
	Thu, 18 Jun 2026 04:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZgtkoot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E92210EBCF
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 04:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781758411; x=1813294411;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mEybx81Td/vuPOVwQQn08etReXpefdqJRFbGYE8exLw=;
 b=BZgtkootHAb5cejYSncg8qKamZkUlLEmijEv2YO03fWh5Grt0UiNAItO
 kcIbHfpS9Bd2TBpisL3S0EyujfEunzUP/4pewTlJNNjKNKv8M/S6LIu5r
 cUVStZZVpPKFWtCTegzSubQUAKOngRQUGUZQTH8aipnRTDDxgqS8kxmjC
 tChgDwPRqAN6Khbd/JNT4GNYIC4/Ap1kwAHJ/zTzlusbE1k93X3PY8UiH
 BxYFzqvW4dy/evU1Pcgak3qaXCG9UNNAMur0bd3ujcN2eD/cPV59MZT6U
 ZSRNvTDUSj0+WYZUx3TMHFxznxEPtGQAHXksNdQgrYa855x7N/Nl2kGhq Q==;
X-CSE-ConnectionGUID: rVR4yAC/TVukAa7FQ+BpTA==
X-CSE-MsgGUID: 4WZ+MDJ6RXyED1kl5otN1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82675967"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="82675967"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 21:53:30 -0700
X-CSE-ConnectionGUID: ywGxteglQ8CibdHGHMF74Q==
X-CSE-MsgGUID: c3Ar95seSsuqp0uPrkOnvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="247368337"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 21:53:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 21:53:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 21:53:29 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 21:53:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsXS9yPZaY5jr1NLBUlcGSqPuzlY5cLVyzO2brVB8SKoS+nB2UfPCUtsDT6LvDFAPec48Rdi/s6qWAZDFCcpuiyk+FgMPjHZxnXYMV5Y0kTHY3oOxysJ3GcNpYn1s0D2lK5uwiKdNv+Ee5EWi5xiE8YArxvVRKe8sYI8RQAYMsPx9Dr7BT1dLsfngMhvx+DdOx0zAUP0I9HH4ikb1rAgLyQFGthwxUNWl9ucPRdxIBfl3EulkCx0siHE8QXaTybaEcgAIJUr1BYsJmXKkaGsY2pxyRJZaCkCq1aQ2et7G+O5h+3wNld+1+AfbkCJCIVyvtRd+X2mtyJXwvT1fnngJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcmmvnleXUAWtld8/k9rbZ8lgN5r8Ms8ZutOk2ekVBA=;
 b=T9K2HznQLh6fuMcqPsSW82205nfGaRyn5QPyGbl4tyd/cW7Gs54N6SbSGjkshPK38+h7KqZSUb0ilTzdvrCoeDFudh++PIEbB1EX851xDwKIGoLtVdWGFeNTmmMcghIrSbo3YZqx4z5IVAUuk0seA6kRp6WEUCxEECRh3iLukMqlFUpvgIFPRWeG+v4d80XC1Ibh4tCR6lseqMlT163TmXnLZs3DUWHm8N3puV8fpwbqJez9SoO2ZZ1XAPeNVJmpODLG0ACj55EUIwpwvrgslMoqCyNOJYjHcLgolYgh0qWtWHrRCmdIMCbFZrtAM6nPFVC9gj1HqlcOvCqAXpCCKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA1PR11MB6420.namprd11.prod.outlook.com (2603:10b6:208:3a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 04:53:21 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 04:53:21 +0000
Message-ID: <c108dd3f-d01a-415c-aecb-6890ad31cda5@intel.com>
Date: Thu, 18 Jun 2026 10:23:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 1/2] Revert "tests/kms_hdr: Move capability
 checks inside dynamic subtests"
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <sameer.lattannavar@intel.com>
References: <20260611064213.1300403-1-pranay.samala@intel.com>
 <20260611064213.1300403-2-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260611064213.1300403-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::29) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA1PR11MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: 982c8a32-fa43-4860-c459-08deccf58516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|42112799006|23010399003|22082099003|18002099003|3023799007|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: qCWlmgtFhBE239e6eFS0yOHfX2v89Uw3qs1wmlaNsXN+fAuqetIUbXzQy0m/0SFqYndSJTNZu9NVh6/RGrEZZMSS+JMbiTd4mjt0+JHQWaJ33C/jCuADB9BiK8LZNGkOPXkrtMmM1OqpfbAtZ6EV6SoXJr7SYx6O3y1/0HURNydf8/4I+LweY6koS6kVhaTe2kIQWk2Euxcf9rUU12F3jZuKqHj0qRZkEgbG0ck2LjtpP9X2/5WXWxIFkguDLspb+HNBB6gbCtC34lNcw2gJ4fwezN1LZLHVwTf0qXHlHDY8GfNHwb3KZDCAU+cq4shoFCC9aGZXSuGksowFrNDAbhKKgWL/l1wWOwmplvNtXU4gm3zn7k4j/y3HoftDikJc6NB9u+Jc47DMoRdIpv09oXyJAlLR+WfqY+YVR83z+nhr3FnA1I/TZbnhoXvUYBHKe7O2cCa8StVpDCVQpdj3rDR7wJzUhXD+OsCOAkP/0td8fowpNal2mVb26jNR6pvuZY2im1jlJhd/ohXYrV4wbzEBMo+3fuT54itnDMOi052ORBK1dpwcGmO8v6uJuO6rvN+Igk6A/hU/6F9mTOFSuSJtlClAYqmRV9mrorb96ZBT2O5eS2DLT3SOZwzDY7aRV4Vfzviym3u+XpsE7JnFgSiOGTFUG4ZyGVl4WpVzMsHiXYhx2wiVcwsHa7EuXzQP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(23010399003)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUM2bSs3MnJmaWIvbmJ4MFZ3eE92b2Z3dTJVNkxjWm1NQlh6N1NJSGZKTnls?=
 =?utf-8?B?T0pnbXNVSDBBQ0ZBWjh6TjhGVjk5aTJ3QnpVY2tTSHFkdUJNNFBpa081Z3BD?=
 =?utf-8?B?WmZtNlA0VDdxV2NNZEw2Tm5mVVNhWEFYQ25pUFV2RHR4dngyK2JlZXFSa25W?=
 =?utf-8?B?ek91UDF0N291RVUwL2NPeHdHWUl3Rm8xVlk5cjR3Qi85cER3MDdiZWlZNXMr?=
 =?utf-8?B?YW45M3hRSEZZT0pwMEVoM0FZM3g1QU5JanhqMnBrVjcrc2ZoOGVYVDhZMW5j?=
 =?utf-8?B?WS9rSy94NG5qUE1GRTl3WDBtRG5KNGIxTlBId1p2K2x2Zmc5MWxOdW5zTWdi?=
 =?utf-8?B?cm92NXRBWDdDTDhIOTZ2YklTMjlrKzhuL3pIckxpbld2VDdXaEZoY045a0Qy?=
 =?utf-8?B?dGJJVjZTYytweUV3Smo3djBDcUNBQmVGUW1kR1VZUmdmdi9yalN0OGJER1h0?=
 =?utf-8?B?c0pzcjhnOFhjbVB6WWRFWlVmeXRNV0pNdThnQ1l0TmlwMUpNMG15c2hEdVdz?=
 =?utf-8?B?SEdZM3gxcGdGb0kzMWxibnp2UFRmdkdkOEJkU1RMVlZXdEg0N2I2ci9Jc2Vt?=
 =?utf-8?B?QW9qMXkrVDM1Qy9ydWlyUmtzNEtlM2tVNjVsSmdMRGZmc3kyQ29SRUVuR0Rs?=
 =?utf-8?B?T1IwQytYcWdGVmNudjVRcGY3SU5aM3l6WVE4UFRVY0JCZ3htQ3lnQUxyRWU3?=
 =?utf-8?B?azVRbTZUc0NaUEFabWVkRXlCSElFVGpyS2JoOHBWd25HVnV4THR2SEVoQkVp?=
 =?utf-8?B?SzJWdTZya1JDbUZTckNkNXI5eXJ1MU1SUVN6ZiszUEV5bWhlS3I4eC84NXVk?=
 =?utf-8?B?d1dFdDlNTDl1QlhmaDVuZlc1dTRmT3V6S2FQN29mTmFDZ0xJRWtRUW5KQWoz?=
 =?utf-8?B?OUc2RU1QQ2Y2SkxYNno2aHR3Z0dyRjFxOXQ2Vjc3S3lQVkdibWt4MVI5dUNj?=
 =?utf-8?B?VW1wRHpjQm9MSFpYSEJOSEFHK0RFQWMyRWY5STZybmZralBpUVZydC81UFdH?=
 =?utf-8?B?OVEvSkdNTVpNSm5YRnFoaE5hRnFMd0I0ZWRaQm95ZWdQcEE0NytVRnhMbzBZ?=
 =?utf-8?B?ckpmYWZvcUppTGVUU0lRNVV1RnFtOCthR1A1cjVpUTN5VVZMRnpCSmk0WHN2?=
 =?utf-8?B?Y1oyWk1sWE9nVlB2R1RRdHQxVWhXSkllY3FCUThLTDIxem4vZ2MrekZjTmYx?=
 =?utf-8?B?a2xFV0pXRmY0dzhJUFZSYnk3aVBVUGdFZWRmUTA0WVVDRjBYU2lMNmV5S09x?=
 =?utf-8?B?TllFVVRGZFI1UVZ0UHJtQnIrTXRjNG5mTjhJa1QzcGVsWHREZmUzS2pMd3Fq?=
 =?utf-8?B?VzNlV1JjejAvMWVSWldxV3hLZTJvSkJiZkVXeWlrOGtJOEp3SW5TZ3ZleWZq?=
 =?utf-8?B?NVUwV0swZmZEZmM1djhtY3BWTnJNWW9QMEZ1ZGwwZk9SM3FaTzBZWkZkMGNr?=
 =?utf-8?B?NUdmTVFQUVZiMjB2ODhYMUp0WnRuVGF6blNvczNnakQrUm5jMTRjeFcvRFZw?=
 =?utf-8?B?Tm5IVUNIeGpWU21oVE4wK0plaTdtWnBneXpTalBIeFROQ0FSMGptN0NnVkhS?=
 =?utf-8?B?Vjc1ZzNGNDdXaktnWnloQUdtOTBuZXhrb3dhc1dTR1ZDNGQyQ2tSbVdYcHJq?=
 =?utf-8?B?SjNkM1Z5OU92amlWYjdWOFR5MXZvYmpWNWZWdnppQ3pzTW1GRVU0ZW03amQ5?=
 =?utf-8?B?Q09pSmdrekhJeHRZcUVJTHRQMkc5MTdUcTFuRmJwMDBpSk5nUzFCQWc5T1dX?=
 =?utf-8?B?L3VaaldWVnh1TTNDVUZGMW5mTDhXekFIcDBJVGxzOHRwVjJCMWdnb1hTSnNW?=
 =?utf-8?B?UHdEaTZMeVQ4T2VxK014QVlNQXJkQ0loQ1RhN0JKalpxMllMbi8ydjZxOVZ5?=
 =?utf-8?B?WWtMWS9lSU9zbUF4azhUZEJMQjdBZGJVM2pHRmFKVHc1Q2lCelY1d3VJa3NT?=
 =?utf-8?B?cFRxeFo4Y0YwMEd5V09uTzNZa2FmbWN0SVYyOWQ1QmxybGh5Sis2R3BxL25V?=
 =?utf-8?B?QjZhVzUzV25vTGxrZnNQNUZlaTUyNEkreCtHRHJsakVJNXdCcHdBd0p4N1pN?=
 =?utf-8?B?UGloM3JYRzhHOG40UGIrZldsOG53bkNXeEFnWGcxOGIwT2dHQVlzaFFkNlJW?=
 =?utf-8?B?QUdNZFpoUzBUTkxSWnNmdzBwSnBRQ2RoOUhoUW9oV1ZPRVBLazhubzgxS3Rs?=
 =?utf-8?B?OUNRU1ZHUHFJTkZvUXJLR29mNjk4OSt4TVFnb3c5MXFyNTlGcGM4eXF0YlFh?=
 =?utf-8?B?WHpVYjJxT2EydU9WMHNiekRFb3JRa3lya0pXdFQwZ1ppSXdFeklTZ21Ca2Fm?=
 =?utf-8?B?enJmbGtSVXdVcDd4L093ZzJ2Y0RTbERaTHE5NklSVlpnMDZrcW9Tdz09?=
X-Exchange-RoutingPolicyChecked: JF3krxFW99LqVmwAtK2My+9OjmhaI0XVMQ4cJR+/mXr0Zo5jQ/tTKea88wRp2aF4xwoIISWo7mgqPzRRlX97DY0J1ORNz4Kjrgc+NBFoGEB9uCX8+2cIFdMJC00/ZqIEHlpJf3vcsl+qV+2zpSTwm0mmI8xca4TTrN2LIt+bDEmi/zTUHtfJg4VXfXHvU9PZceI5e1XB3j16y6mNPihADxx32N2glfQWDqmr5T9ZaPlLDgxL6hAdVelAJ4/acu0ElEx0ewAZfp7JNEHIz4961EUOCRi6GPnEgONCgcIISteHq7X3SZpEovgEQx6wIRK8w4QvUNIpLosQyb0VzzMR6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 982c8a32-fa43-4860-c459-08deccf58516
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 04:53:21.2309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXercEYXKHW+rK6O7WhzAoZvptGEdliinvo+n58KSEwVxdwWaWUi5mmiY220Dz8OPHJ0euDhhstLzkkF8FB3WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6420
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

Hi Pranay,

On 6/11/2026 12:12 PM, Pranay Samala wrote:
> This reverts commit d9667a6fd6468adcdb5542d741ac423339a20556.
>
> The previous change moved output capability checks inside dynamic
> subtests to avoid losing valid results when a later output failed a
> check. However, the real issue is in the helper behavior rather
> than the kms_hdr test flow itself.
>
> Move the checks back outside the dynamic subtests and restore the
> previous behavior. The issue will instead be handled at the
> helper/API level by updating igt_get_output_max_bpc() to return
> status, allowing callers to handle read/parse failures explicitly
> without changing the existing kms_hdr control flow.
>
> v2:
> - Update commit message (Karthik)
>
> v3:
> - Add the missing changes merged recently (Swati)
>
> v5:
> - Ensure remaining formats tested that might succeed (Swati)
> - Update if condition for clarity (Swati)

Please make this v5 part a separate change and not mixed with the revert.

Regards,
Karthik.B.S
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_hdr.c | 175 +++++++++++++++++++++++++++---------------------
>   1 file changed, 99 insertions(+), 76 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index affd38887..c334c907a 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -255,6 +255,17 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> +		if (!has_max_bpc(output)) {
> +			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (igt_get_output_max_bpc(output) < 10) {
> +			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output,
>   					    crtc);
> @@ -266,29 +277,24 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
>   				prepare_test(data, output, crtc);
>   
> +				if (is_intel_device(data->fd) &&
> +				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> +					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> +						 igt_output_name(output));
> +
> +					test_fini(data);
> +					break;
> +				}
> +
>   				data->mode = igt_output_get_mode(output);
>   				data->w = data->mode->hdisplay;
>   				data->h = data->mode->vdisplay;
>   
>   				igt_dynamic_f("pipe-%s-%s-%s",
>   					      igt_crtc_name(crtc), output->name,
> -					      igt_format_str(hdr_test_formats[i])) {
> -					igt_require_f(has_max_bpc(output),
> -						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> -						      igt_output_name(output));
> -
> -					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> -						      "%s: Doesn't support 10 bpc.\n",
> -						      igt_output_name(output));
> -
> -					igt_require_f(!is_intel_device(data->fd) ||
> -						      igt_max_bpc_constraint(display, crtc, output, 10),
> -						      "%s: No suitable mode found to use 10 bpc.\n",
> -						      igt_output_name(output));
> -
> +					      igt_format_str(hdr_test_formats[i]))
>   					test_bpc_switch_on_output(data, crtc, output,
>   								  hdr_test_formats[i], flags);
> -				}
>   
>   				test_fini(data);
>   			}
> @@ -530,6 +536,40 @@ static void test_hdr(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> +		/* To test HDR, 10 bpc is required, so we need to
> +		 * set MAX_BPC property to 10bpc prior to setting
> +		 * HDR metadata property. Therefore, checking.
> +		 */
> +		if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
> +			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		/* For negative test, panel should be non-hdr. */
> +		if ((flags & TEST_INVALID_HDR) && igt_is_panel_hdr(data->fd, output)) {
> +			igt_info("%s: Can't run negative test on HDR panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (!(flags & TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {
> +			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (igt_get_output_max_bpc(output) < 10) {
> +			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
> +		if ((flags & TEST_BRIGHTNESS) && !output_is_internal_panel(output)) {
> +			igt_info("%s: Can't run brightness test on non-internal panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output, crtc);
>   			if (!intel_pipe_output_combo_valid(display)) {
> @@ -545,73 +585,56 @@ static void test_hdr(data_t *data, uint32_t flags)
>   				data->w = data->mode->hdisplay;
>   				data->h = data->mode->vdisplay;
>   
> -				igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc), output->name,
> -					      igt_format_str(hdr_test_formats[i])) {
> -					igt_require_f(has_max_bpc(output) &&
> -						      igt_output_supports_hdr(output),
> -						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC "
> -						      "or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> -						      igt_output_name(output));
> -
> -					if (flags & TEST_INVALID_HDR)
> -						igt_require_f(!igt_is_panel_hdr(data->fd, output),
> -							      "%s: Can't run negative test on "
> -							      "HDR panel.\n",
> -							      igt_output_name(output));
> -
> -					if (!(flags & TEST_INVALID_HDR))
> -						igt_require_f(igt_is_panel_hdr(data->fd, output),
> -							      "%s: Can't run HDR tests on "
> -							      "non-HDR panel.\n",
> -							      igt_output_name(output));
> -
> -					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> -						      "%s: Doesn't support 10 bpc.\n",
> -						      igt_output_name(output));
> -
> -					if (flags & TEST_BRIGHTNESS)
> -						igt_require_f(output_is_internal_panel(output),
> -							      "%s: Can't run brightness test on "
> -							      "non-internal panel.\n",
> -							      igt_output_name(output));
> -
> -					/* Signal HDR requirement via metadata.
> -					 * A framebuffer must be present for the driver to accept
> -					 * a metadata commit. Use TEST_ONLY so hardware state is
> -					 * unchanged.
> -					 */
> -					igt_create_fb(data->fd,
> -						      data->w, data->h,
> -						      hdr_test_formats[i],
> -						      DRM_FORMAT_MOD_LINEAR,
> -						      &data->afb);
> -					igt_plane_set_fb(data->primary, &data->afb);
> -					igt_plane_set_size(data->primary, data->w, data->h);
> -					igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> -					igt_hdr_fill_st2084(&hdr);
> -					igt_hdr_set_metadata(data->output, &hdr);
> -					igt_require_f(!igt_display_try_commit_atomic(display,
> -										     DRM_MODE_ATOMIC_TEST_ONLY |
> -										     DRM_MODE_ATOMIC_ALLOW_MODESET,
> -										     NULL),
> -						      "%s: Couldn't set HDR metadata\n",
> -						      igt_output_name(output));
> -
> -					/* Reset IGT display state; hardware was not changed. */
> +				/* Signal HDR requirement via metadata.
> +				 * A framebuffer must be present for the driver to accept
> +				 * a metadata commit. Use TEST_ONLY so hardware state is
> +				 * unchanged.
> +				 */
> +				igt_create_fb(data->fd,
> +					      data->w, data->h,
> +					      hdr_test_formats[i],
> +					      DRM_FORMAT_MOD_LINEAR,
> +					      &data->afb);
> +				igt_plane_set_fb(data->primary, &data->afb);
> +				igt_plane_set_size(data->primary, data->w, data->h);
> +				igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> +				igt_hdr_fill_st2084(&hdr);
> +				igt_hdr_set_metadata(data->output, &hdr);
> +				if (igt_display_try_commit_atomic(display,
> +								  DRM_MODE_ATOMIC_TEST_ONLY |
> +								  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +								  NULL)) {
> +					igt_info("%s: Couldn't set HDR metadata\n",
> +						 igt_output_name(output));
>   					igt_hdr_set_metadata(data->output, NULL);
>   					igt_plane_set_fb(data->primary, NULL);
>   					igt_remove_fb(data->fd, &data->afb);
> +					test_fini(data);
> +					continue;
> +				}
> +
> +				/* Reset IGT display state; hardware was not changed. */
> +				igt_hdr_set_metadata(data->output, NULL);
> +				igt_plane_set_fb(data->primary, NULL);
> +				igt_remove_fb(data->fd, &data->afb);
>   
> -					igt_require_f(!is_intel_device(data->fd) ||
> -						      igt_max_bpc_constraint(display, crtc, output, 10),
> -						      "%s: No suitable mode found to use 10 bpc.\n",
> -						      igt_output_name(output));
> +				if (is_intel_device(data->fd) &&
> +				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> +					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> +						 igt_output_name(output));
> +
> +					test_fini(data);
> +					break;
> +				}
>   
> -					if (igt_is_dsc_enabled(data->fd, output->name))
> -						flags |= TEST_NEEDS_DSC;
> -					else
> -						flags &= ~TEST_NEEDS_DSC;
> +				if (igt_is_dsc_enabled(data->fd, output->name))
> +					flags |= TEST_NEEDS_DSC;
> +				else
> +					flags &= ~TEST_NEEDS_DSC;
>   
> +				igt_dynamic_f("pipe-%s-%s-%s",
> +					      igt_crtc_name(crtc), output->name,
> +					      igt_format_str(hdr_test_formats[i])) {
>   					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
>   						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>   						test_static_toggle(data,
