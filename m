Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD78FAD41F
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 06:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E4810EF74;
	Thu, 23 Apr 2026 06:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GF4vg20F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E117910EF74
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 06:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776926569; x=1808462569;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WQSbFiz/svBs/a0C8BH0/t8mBdlExZKaklUJNhDEAk4=;
 b=GF4vg20Fc1XjUTfjK1HFhxDoBZqvvE3+Noc1zaLE+egya0F7+bAYWPc7
 R7aMz8hzibiQdWiT/LO7oR6B729AzOEmB7kvU4rBuL566rAkGDd5BxOGD
 NMdTb2oWWDigWV4TX4s/gGyPlD/wApADKv1BCc9bHJrwMwUWAAGuqu6Oe
 JtNpa+eJ1fWlHmtx0dKn+lIfTGcWVOOaFGjWFEjzWryjew1pDPLuSuNAx
 zW1fRk8hJu/8v1ghuPFf4ardQGIUWvHNZuA14O3dmNmn/EDtq7NALM8SJ
 YqcaEl151YB10dbUnIOyu38RXMni+FMKzUnexgCjFux0xDcHUW1utoScN w==;
X-CSE-ConnectionGUID: JRtdJqW8S0uJkVT1DPlm/A==
X-CSE-MsgGUID: 8Ef+c0lUT2W6VmTUPvQLfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77870961"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="77870961"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 23:42:48 -0700
X-CSE-ConnectionGUID: W0Ke618VSEWf1ijk+A6uuQ==
X-CSE-MsgGUID: QNY4I/39Rg2lFeH3sdWVgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="228222855"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 23:42:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 23:42:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 23:42:47 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 23:42:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieYjfdzOaGkMKPrsNz47Z2BHCvN94sdZjQPBkp2+SBU2jHgWAt9AO9zjVTUtGkoGz8w7UqvUfoa5iZoo9KkLn31nxSQuEEjQjg9XFJPcQNvr6B4pSr+rq8PUoxllbNnRQ+JAlNKRU5Xt+cUGvA992/V5JXPTbExHxY63tChjGhDYyWUy3wdhf237+D5GlKWzFIvrgzu4n5rFWD1SSlTkEgUAO6reKPAdQ65LAVv+D8oAfcJxUYw1YpIcnPGihFSubPH/btdjSjwx7UXh+/4mQoa/XAFDRDiun0fMTmZnVVwvhIJhrRiCX+Om0hYf/MiVlMQfjA6te2zQIEYv+EwPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dV/gFNAO+fR09wt7GotJKuMCcG96a5i94yqSz/SeEM=;
 b=Y7yP+7k9w2Jyj4IGXx+/ilCArio6TRNZd/7eoBqrtafUvcYk95qow0RsJsPt0kh+n9JnSeaoq307Wkc1XRxN0Zw7JxLB6ZDleQZKDzf6SFqbEt3v+NRkZefUw72iNq0taQG2QrUpNyGqChb31h2k4QuLB6J/eLKsaDXqWQo6f4AW5k4D5L+tdqlF3rP8FOFIfwQjr+Ix+h2cooHO+/hJIibsTGNcrJHE+I+6aCPeHs1axQP4gUzpUR4wKBZnVezWSkuFLE3nkDv/4BlVufSZPzL1lq9LBV8vnrUbXihNQXFTX2t85szfDs6Smn7F0wsHocvy4HTFpTUeTMfw1OnBiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by PH8PR11MB6731.namprd11.prod.outlook.com (2603:10b6:510:1c7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 06:42:44 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9818.017; Thu, 23 Apr 2026
 06:42:44 +0000
Message-ID: <631a5657-fde0-4062-ac60-2e3ae6795510@intel.com>
Date: Thu, 23 Apr 2026 12:12:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 4/4] tests/intel/kms_sharpness_filter: Find mode
 with lowest bw requirement for test
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260420110553.478287-1-juhapekka.heikkila@gmail.com>
 <20260420110553.478287-5-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260420110553.478287-5-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::15) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|PH8PR11MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fee1640-d439-48cd-604a-08dea10385de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: fXgoYGOWv+mjo24cywm2toE3hzIzGaeevuESnYtyap8Kvs6DRzst+KJ4yN8zRzdFK0tAtqmhf42Xt7pv1W8px9FPujPtdIbpNc0hlvEDSwMQlF/MzPmUsiXjkNY8y8oNpreXyrk5jP9GqZJ9QfZ8w2AO2HjZkFSkK1CezrFiEhOFEDoVNEhIxv09G3LLqzlQbvD9T4tSYbxAJnqYTalShSwZZzE0E8tLnNhYuOtuFkJ4RTlHcbQ98RpP/kWrkhs56SD3Xk1snfA9Q09Ybzkds1Xbi756Ls4jnrg39QbaCSbjsuvj0jxMJCxzTCwFz1tRCM5+5LRihQEFhAin1uKSxoHzcTVYog1OCeOJMTAwWIatpkVI0POBZPeYyDPVo/jOJsaHWQ7XIsaIpwXB3s/NcN4OJl82BOQKcU9hGnjQoxTGm3joT2aNOHZfly0CUPq59zcVD0TDWCzgbbgeTjfqyPDhX/RhWD4siYFVa8IJKH4Jt6FMLFc/Rq2rkxAV0hpLvM1jrLzMNyrjJA4biAl3yb8jG09TexmsiDnzXVbc9QJTGSN/26CaBbC0qae/t0CZ6wECVcjaKCB7WgX3Z54hM7JvfD7vzc0zULvxyXPlo5lnetT1+PBZ26PGW/+2rYZLrkg8eVWI5khcopjaowexjOWH4bacnBTtiEtRj7NhpYo41GVSLGVsXNmA8W5u6MpriVA6sdSifuA9Y909VjDVmawxdcjVbvR1FOYJ1TCtTuE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTA2N1RFVk1SVEZwUDdsTUNFaXp5Smx1WTBYV0xGa3kybHMzOXpSKzMzcUVu?=
 =?utf-8?B?dGF3cEVTdXM4ZEtzaVJFNndYak9ybEVpQUpMZC9vdmVtYnVPcDc1QlR1NWVP?=
 =?utf-8?B?NEx4bHZHL3RTUHZXTlpZNTM5Kzdjcm15ZVdMaThUQmpkK2d6aVBLenkzc1Q2?=
 =?utf-8?B?TnlXRC8rQlFPWWpDeGJIU3B6NStERnUxd3NNZHg4MjEyZlU4eDZOQUFvUkpx?=
 =?utf-8?B?dDRXb1V1Y3lBWGlBTzBkbWFLWE9DQWc3ZisvYmFCZGUrVWRSY1hHbzFkL1FE?=
 =?utf-8?B?QlN5RkVWblBIWWJEdjJBNG5XbVJ5SzBYbzEvbHBiOGEwMzBxV3VxbW5hRWJl?=
 =?utf-8?B?VmtCZkQ3QVhCMHBnY25CY1FkNmN4MXRPYTNxb3dtSE91TkNiNjExZGN4aVlk?=
 =?utf-8?B?M3RPbkdNTEFCVWE3WWpRN2FXcWNneVRsYytHdHloOGM2UDVTaHRKNnA1R0Zl?=
 =?utf-8?B?ODhScDBRazBlVUFVcktENkQ0bG1vY3htR0pXTmlJTjI2V1lKUy9sNU0vU2RW?=
 =?utf-8?B?eHVUbHZDN2k3d2pQUEE0MkYrVnN5WDJvTnJObXBZemxqWjkwbnBySXZmdk13?=
 =?utf-8?B?TlJnV2FlQVZ4S09ZMlUreVByazRlenFJV0VXRi9naEZGSnB1Wk9uUEZiYkNs?=
 =?utf-8?B?SjFpNi80NHZZTExmZFFyRCs0TFdrNVRKZExzajJvZlc5elA5TVIydytxclJi?=
 =?utf-8?B?VHoyQVdCWTVwRC9McUdRWlV3Q0Z4eHhLQ3RBaVdVV0RNTFpwOEdlRUtZNTRi?=
 =?utf-8?B?Q0VPbERTUWFwNU80TzdobndycUVqY1gwa2lVMDZuSVcxWDh1SmlKKzVFaFpJ?=
 =?utf-8?B?S0F2WTNYTnF3S0ZnWll2bnlUeXpOSDJ5b1VoZmEvWGczMEY0WXVyNWxOYjlB?=
 =?utf-8?B?QVF3TGdHbldWUlZ4YWtaQ2ZjOUtFdU1xUUk4clBzNDk0T2o3cG9mdVY2SSt3?=
 =?utf-8?B?OWtYaDFOK3lpdjBvMDduZXBZWVVKek55cFhla1dhckNQYkJnNXJsY1ZqdndE?=
 =?utf-8?B?WE4zTEN3cTZJeFRiRGNPVG1mM09SOFhpdUtjWmYxVkVxRVMyK2E0cjdKSGRR?=
 =?utf-8?B?MWdlNk52UFNJVWZoVjdhdlBrcG5JakRQcGVCeHdwZnk2VHBLOVR5NUVXWEVW?=
 =?utf-8?B?Q242V1MrMWhuNnB2QzRGa2FDRE52U3JieWtUYjhxTlk2WFEvWUc4V3RvT1Qw?=
 =?utf-8?B?bXF4YnJWWDRCM3luWVluTkpObDlQWkxQVDZPcUZRSlNpL1FkN3VmZG8rZ0FB?=
 =?utf-8?B?OEVoQm9XcXovamdLSzFCSlUxd1NhQ0dDUS9JYTNkT2NoL2lOd2ZZaFhTYXdI?=
 =?utf-8?B?YzczYUdLZVpxWStXd3QvUWdEK0VjK20zQUlMSDlkTzBPa2J4aDdTcDdvWFlQ?=
 =?utf-8?B?c3JCMXhkUTVGZDBHakV5YSt0UnNXVStnNjVtdkFFcENndCsxL25LcEhpMVZ5?=
 =?utf-8?B?dXFrT1BzNzcrenAxbGFwZDVJd3VsVHl6OG5xTTBWRGxjR0NhcnV2WVpnK1Rl?=
 =?utf-8?B?Q0RDL3M1KzVDWUJielJnWlVXREpLTVVQUnFqZ0dHRElFZzA1YVJFdFI1RFhZ?=
 =?utf-8?B?NXJMbTRKakE0MWdrY2JObGVwdE5ta1lIcCtkeGwwTXZKOGhWMHhmV3Z3YXNU?=
 =?utf-8?B?QWhQWFFTejVOUUluQzROVU5ackd4d3ExanRWZG5VbFFpNjg2ZEduQ3h2UmJz?=
 =?utf-8?B?N2dPVnBkdi9PSDRqaGhxOW5uUlo5d0paL0YwTkdGSmhaOXBPdk9tMndlL0tY?=
 =?utf-8?B?YTI2dFdIWHBPTTRWbUV0N09MbWxOVisxYjBxb3BCc1ZXbmVyYkt1amJLRW5q?=
 =?utf-8?B?dHpFTm5QUzd3QUludW5xZENDZDFwZnZuNjB3bThLZWxycEl2TWdIdE1UalEv?=
 =?utf-8?B?N2svMDNrRlNaRVV4c2JtN1djRTI0QVdMQ2pHLzk3M0lBbXdUM0l6M3pUR0sr?=
 =?utf-8?B?YzhyNDV5cXhaMGpUc0R3ejlMTmF4alFSdVlKQWowVjBGcHEyZzQrZVdOU0VB?=
 =?utf-8?B?dUF5TUl6ZDViUWFJMGhkUVVaMmJGZnhkNWdRUGlGaENCaUtWOENzOXNJaDRP?=
 =?utf-8?B?L1dOM09ncWpoRUdJTS9RZGJzdDZiRU5kNkFSbVZWd3B6a2pZS0YvOUJGbWt6?=
 =?utf-8?B?RFBhTXN6WFZ1MmRrQTlST01GYTlNa0FtZURBRURmZDJLRk5KOVV6TXlOL3o5?=
 =?utf-8?B?eHR4eW1Gc1dPcSsrdWh6eTh4Z2hXRHZiN1kwNVl5MEdXK2kxcWlsdzQ2OGRG?=
 =?utf-8?B?cXpVc21URnRxem1LK3c5UkQ2WVhqdUJ6cGU2bGFLanFrSFdnNUlzVU5vTmxx?=
 =?utf-8?B?QTVQYWdyVXlFeVVjaGM0WHorQlZqMzMyTFFIaFhkNnFXcHlsdVdOUT09?=
X-Exchange-RoutingPolicyChecked: IhC/q2dwjxzUkT5wnmz2XtAAm4SBBB7He/wMTGTwqZQr9wp36XU3BTK/ma27QV4ydjrJ1IOxP92xknhtkMUtyubPpUoSi7pSA9vRYIZZpDLHrJjVcvMWX6B54ND8tqZxYaxl485Q1g8QQBCIEJYUzQ+N0IZy4KNnyWVOPSQX6/zaPokucYvNH9SnKreeTDpklgc+Aqb7KZQ+YJp6qLJzjNFKveDLQ8C3dG9LqzBSdsKgKbK8/xuMSd4Z2gDriIGZJi1zeu7nr3XrsdqdkqTfIQvu9yNpD395Uv2ERiMUcqQigqnNS5sh8impnwIvMWiv89NzekXGMLlEaqD4zqwY9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fee1640-d439-48cd-604a-08dea10385de
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 06:42:43.9796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BL9aaqcZu4iQal6lVT4nm/6qKvXNc0tiNRX+Y1PTbktCNOFcbDMQac5WBi0RhfmhD/1ReH+ixZkcNnMuvnLa0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6731
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

Hi JP

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 20-04-2026 04:35 pm, Juha-Pekka Heikkila wrote:
> choose mode from connector with lowest bandwidth requirement
> for tests to try to fit tests into bandwidth limitations
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 33 +++++++++++++++++++++++++++++-
>   1 file changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index 98eb671d1..ff2efb154 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -609,6 +609,22 @@ static void build_test_suffix(data_t *data, enum test_type type,
>   	}
>   }
>   
> +static drmModeModeInfo *find_lowest_mode(igt_output_t *output)
> +{
> +	drmModeModeInfo *low = NULL, *mode;
> +
> +	for_each_connector_mode(output, mode) {
> +		int pixels = mode->hdisplay * mode->vdisplay;
> +		int low_pixels = low ? low->hdisplay * low->vdisplay : INT_MAX;
> +
> +		if (pixels < low_pixels ||
> +		    (pixels == low_pixels && mode->vrefresh < low->vrefresh))
> +			low = mode;
> +	}
> +
> +	return low;
> +}
> +
>   static void
>   run_sharpness_filter_test(data_t *data, enum test_type type)
>   {
> @@ -647,7 +663,22 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   					 data->mode->vdisplay,
>   					 data->mode->vrefresh);
>   			} else {
> -				data->mode = igt_output_get_mode(data->output);
> +				if (is_invalid_test(type)) {
> +					data->mode = igt_output_get_mode(data->output);
> +				} else {
> +					data->mode = find_lowest_mode(data->output);
> +					if (!data->mode) {
> +						igt_info("No mode found on output %s\n",
> +							 igt_output_name(data->output));
> +						continue;
> +					}
> +
> +					igt_info("Executing on lowest mode %dx%d@%d@%s\n",
> +						 data->mode->hdisplay,
> +						 data->mode->vdisplay,
> +						 data->mode->vrefresh,
> +						 data->output->name);
> +				}
>   			}
>   
>   			if (!has_sharpness_filter(data->crtc)) {
