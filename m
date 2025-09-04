Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E68CA1012
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 09:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5111C10E9A3;
	Thu,  4 Sep 2025 09:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRhxRts7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A706E10E9A3
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 09:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756976934; x=1788512934;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+gdr/ml6bv0JTxA9fv4SNkgj/5QPkb9Hw2ajWwqJcQo=;
 b=cRhxRts75kLnHEEe0P8L27clrlQnJunNExM+BZuINOqjm1VWxN+82Cew
 bSqinbsfoM3iPQVLUFQKjzl1ErleVZXxvpJRI9K0/HyCUkWd3pYxt7S47
 /N/2sxR9dutmygSjk/QSkrt0CIap1l/sSVzO5DzsaLK6x5ifW88cjg3NI
 9HPUdg8a9/mWbKXHAga7dQlrjai6PuThCOO6BPvXGLHII6XrT3KhQ2Bdq
 YBG36EU3m462r5w9umCMPxy54NwE3WuPTrp3JWozUd4NZLn+ZnWbB1oA8
 4vvUbeOqELnAswq5P7JX7ke7axL1G02oIxP9o1I+uCnf3fjWuVbd6Mwtv w==;
X-CSE-ConnectionGUID: qXFUsyPLRHWDWdeFJqyfCA==
X-CSE-MsgGUID: OKr1TSPlSSyfm1iYeDIhKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69573327"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="69573327"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 02:08:46 -0700
X-CSE-ConnectionGUID: 8Xy/Oa0uSZanjiKJM0mmYg==
X-CSE-MsgGUID: YIF7MiX4RSK5tE5GQmQ/Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="171384479"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 02:08:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 02:08:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 02:08:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.74)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 02:08:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gc6e/NW16PeUhUbGvKIYMZ17rBwF0sANKT3hCG+eyIJkO5uY85FJx/5o2+CYlrhpYIzaTazd5yp95s8lM4g9lYdP7UTTPnY6cSD0R3m2ITuxsWPpLPJG6+vFhz6J6ePFhSEm5eG3uleZMVGx5l5TkyUKcpgh5uyQU5mTCEvODWXSVagNN79PmoMyL+y9jvN/8btONn6H/lkNjxpYi6/Gv41kHR3EyC4CcgJuiUj7Q+phWKsJJFY5PdkZei+TssB0/QMgwX+N6+w/g79XHHLg7io2KpkbBP8bhDi4ijVYssjr6TCXOOigVTEM7ntcHft50Y3WRXSojVm8C4UJv6EN1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6sYy+jVUHRAv7QBgmi+fzfzDi2hjKRwA2ImBkTTa9c=;
 b=FxNNm40sw/JSebyleiSMQdPSqSde3z4aLXvdetUphY3hhoXW51Pv6s3Z8CqEeumU/fjjcelz4Yfpnv9hs7z3suSMJKhN62oWlfvLisp1L0wsxAJEsS7qT6XbHzN82ZSxK2DH5Y49566P+b2lMZJD1qhf/hEe1PhZ9afpZcSbHi672SmaZiqOE5/7J+731qqPgw1d0AOdyBrD2pVuRPWuQbQqPc0veAxol86jRnU1rM6/Nqam7SxNZWoxygTjYIyc7lHdP4UVJZFKzHZX9JwmN9fimBs25/WFYas6E8U+9Cu9fyq3t4hE1NbP3yyUTxZ4fkNiS85tIrbs1Exy/bgGcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ2PR11MB8513.namprd11.prod.outlook.com (2603:10b6:a03:56e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 09:08:37 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 09:08:37 +0000
Message-ID: <b4293061-3d01-4820-83d3-1b3e22123237@intel.com>
Date: Thu, 4 Sep 2025 14:38:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 i-g-t 4/4] lib/igt_kms: Handle commit failures while
 checking bpc constraints
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20250903050718.1976201-1-chaitanya.kumar.borah@intel.com>
 <20250903050718.1976201-4-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250903050718.1976201-4-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::6) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ2PR11MB8513:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d3628ad-66f9-434e-9957-08ddeb92a1a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emUrVk1FM2dTb1ZuNlZiOUFldWtITWtTdFprMFNNa1pMeHRQMHgrdUs0M2N0?=
 =?utf-8?B?a2s1MGhYQlFHejRSaVNHMXpEaTB5N0lRQUlLbU5MelhMMGlIMm40TVVXZG96?=
 =?utf-8?B?NWdRMzRwWnNaWHJnc2hMOUVPZXRRSVNod3NVWXdpQmxibjJPclMxT2FQK255?=
 =?utf-8?B?TFV3RFBqUHNvUFFzT0hHZk9QbktWRGYvc0t0MVhidVF1V2thUHMzNEJWWHJP?=
 =?utf-8?B?NlFQR0M5eWx6cE91ZldYcmNqN3laOGVJSnUrd3JHSW1xVkdYSUpvcGhOSFVo?=
 =?utf-8?B?Yk9iMUdFWGNFMUVvVzdJM2NsZGZWSkt6WGlqSHJ4SklnRk1QR21PRVJtcnVt?=
 =?utf-8?B?bEVmRkpJMTF1Y3FoWStiQ1g5aExmYU8wQXVleWJuZFVEdWc2Z09pcWhJSmI0?=
 =?utf-8?B?d1ZYTXgzcDhHSEpicnNVaFppMml2SmpsSUROVnZTTjZ0TkpET3phd25kY1k3?=
 =?utf-8?B?RllPR2F2TzRNRkJlREt6aFRBakdFUW9udmVsbjdlbVZpejVvMWkrNEZHbHEz?=
 =?utf-8?B?WS9QeEZ2NUpjMEt0YzRpTzlQeHZuN2owcmFNcXl5Y2VoNS9Ld1Y4R0c3QVIv?=
 =?utf-8?B?TFBucGt1Sms4T243TE1ZbUVNUDhoRzV6MTErbngxV3RLUVF0b3JqV2JKNHFQ?=
 =?utf-8?B?OWljY1NBMlJaeXN6Rm1MWTIzdDdKSnVuR3dlUGRsdkZMWkxJQk03RmJPK0xr?=
 =?utf-8?B?VEI5bjQ0dVg1TFZHNTNSb0I5b1pvZ0NVbmhVZWV6NmJ5ZDdBaWlnTjdiTVZu?=
 =?utf-8?B?Z2cwL2dhMzdwdDU5Mkk2UHdWaU1UUVU5L091a3Z2OHRQNjlMMkVUN003YjNM?=
 =?utf-8?B?b3VsSlhiY085NU1iRUJ4aU9oRk8zZXhOR3lqMEJPaUVBUy81WWpJd0FUUFV6?=
 =?utf-8?B?Qzl4N1lXcEpYc0tQUDd3bkkwWmFiS3lRamI2ZFlZSXRCVnY1QkprcSt3T2JY?=
 =?utf-8?B?VVd1b3dndTBhVmdiNTdCSUNzTTFpS3RPT0dhR0I3ZjFwaXVSd1FyZ1FXWXEy?=
 =?utf-8?B?Vnc5Z1Yyb1pBN3BmNTN4RGxiZ1JkRDAxVWcxQ0xBSWNlTThRcGFrM1NNekhM?=
 =?utf-8?B?UWMveC9STnBhNkhMUHY0KzBWYWEvVVFNcE5LbkdVZWtzd1M4SGdsaDVRTUI4?=
 =?utf-8?B?bnI5QVlmRi8zejM3U3lyM2QvU3B2azlwa1BaWkJ6a1hZenNmd0htdmptbDNU?=
 =?utf-8?B?VEU1a3N0dGRPY2loY1VkZ1JFUmdGMlA1VjR2SnM5RUdvMGxrT1REUDd0KzJJ?=
 =?utf-8?B?TGNsYStCanBLWU9oQTF4QzVHVlpMLzNVYXB5cjBsRjJzdE9IajJNUE9PM1RO?=
 =?utf-8?B?VWRvQ3gwUUtPa2lWWmI4TWJKckNKVytyR1Y2WlA0Y0RySC9tYUdwTnFIZlU4?=
 =?utf-8?B?WFp6TnBQNlBMZ0IyV0lkbGR6ZVBYK25rcnRwQy9xUE5VN09rUjh1K3V0Qkxi?=
 =?utf-8?B?QWJleHhpTFpuem0yNlpJb2FLYVZqaUVFcGhYbnZxWlhMR2JuTTV0UnBlajZK?=
 =?utf-8?B?KzRWa0MwbTByeWs4OXJsNEh6U2o2dmkxWU52ZkV3UnBQazg4ZWdqNEZtc3RX?=
 =?utf-8?B?dEpVWUZqZmtUSHpLclhMNWdnN3R3Ui8wSmhiOWNQWjdmczE4R0UxSHNNWkN2?=
 =?utf-8?B?a215RVRuU2FwblQ2NXlmYjlsOXlOWHljdXRNN0dPQys1Wkl0VzRjTXhDUUgw?=
 =?utf-8?B?RUtvVW4vNmhMaHYraGpqMzVYSjBFb1N6Y2JRSThQWmpYRlloZ1FZYklkQ0ZW?=
 =?utf-8?B?YkZVd0w4OXpneW5tbEVZd20xdnF4M1hYL2pLSmVhSHF3S0NzMUpQV0swaDVU?=
 =?utf-8?B?Ry91TThtYU1KK2VTaE9wUWExRnRPTEhNYXJjM0llTUtoWHpqVUZEeW1ZajN1?=
 =?utf-8?B?Rlk5TXFpbTgrMTNnTDBRM2JZSW9oWHVUakhxVGJiVHloTGxwSnR6MDJ5RjlR?=
 =?utf-8?Q?plC8/qW36WA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEFZNXZpNFZjMXFUSXZ4Z2lFUU5DUEpWeGdPTS9IRlFNSXk0a1Z3NjVOdUk0?=
 =?utf-8?B?ZmVZbDZqcmhDRDZHWTk2MTNNTE9SaFZ4RzJmaDB6M1VxL0tveFRRaFM3eW01?=
 =?utf-8?B?dXBadmhmNWRaYzNwdVEvbGhHRGJ3blU2ZHZoWElERDUrM2dEdmtHMWhRTnEw?=
 =?utf-8?B?bzlXbEk4OFFZTzB6V2Mwcy9Hek1BL3R5MUx5Y3pkNTlXeTYxQU1vb3FRZU1B?=
 =?utf-8?B?YkNlRGtScVR3eWp5MkNDMnQ4RmhRSk5yMW0vYTEwMndISGRsNHlSSVJ3a3ZO?=
 =?utf-8?B?TFFiS2ZhanRMc09XOG9wKzNKSjFsalJjSFY4bjV2cUM2S0dIQ21nTVV5VWxZ?=
 =?utf-8?B?VFBITUNGTnBFOVBObnZBNytTY3lBZWpPVjd6Q2NaS3pvRTEwb2JzbldkZjVH?=
 =?utf-8?B?eXZONVl1YWc4cVJGU2oraDBkK2Rmc25MdUdTcnkwUUpxTG9wS0tuc3BBM3BM?=
 =?utf-8?B?UHBFTmgxYW04Z3hUZG1RTWx5LzYwRGRMdlFUQ3FndWt5WWYwblAybisxYU4z?=
 =?utf-8?B?V283ZzhGQU9VNTk2bTNTN3I1MXd5UllGTDhTR3JtRkZQWFpRS0VKb3Z3bGFW?=
 =?utf-8?B?ZjRWeXhYaXhqci9BajJhYW04YmxPS2dMejhkb1pBL1hDN3ZDR1ZjYTV6cXc0?=
 =?utf-8?B?NWJaR2ZzMUdWbHZpL3dpSW1ZT200dnNoS0c1N1YyaDV2dzBXTUlJQlBxTDBS?=
 =?utf-8?B?MXNlOUNBZElBTnZqeHIySTU3WFBVK0NHTGFJTE9Na08vN240bW1Ja2luNE1L?=
 =?utf-8?B?anNSTmtlczdrYTFGeWtSOGo1c0FZMnpJRnZibTF6TmtwRVQzU0NIajFNZlIy?=
 =?utf-8?B?VGU2S0Nwdlk5WDJVQ1YyOWZ5bUJHc21pc1pwc29Ya3VYS1dzL01MYUdyVWxX?=
 =?utf-8?B?QnpuNFZvblMyOTJsWXVNSCtPekhvZ3ZaZUVUdXhlR3ExL0Q5U1pFSXBneUxX?=
 =?utf-8?B?V3RZOWZnRWhPQnJqbFowYjNLYWVGdm5CZDhnQm5DbTN0RHRoajJET2Q4TG16?=
 =?utf-8?B?c0ticmluNG1hY0pNdFJOZ1diYmNqamU3UGhzdkVmNVNFMHBJNG5acWFvcUcx?=
 =?utf-8?B?RGxQU2h5SDNLY242dVdKcnpFZXpnL3dmTm0xRURLRXhGNE05RE92ZDJtZjBs?=
 =?utf-8?B?cEFRTTJ0Z2MrcGlraUhLMXJ0ZHFWL0JnQitIQlVRUThGZTEzbkpzNXF0dTVj?=
 =?utf-8?B?RU0zM0NDUGJCMlhRZmVlZ3FVQzc2ejhWZXk1dUdhTVBJMHNPNkV2ZktrWFAy?=
 =?utf-8?B?dnYxbVJMaG9XRnQrZU9DYlZNQ2puMTJZb09EMDkyVlRaVFcyNnhEUUpCUW1Q?=
 =?utf-8?B?MWQycmQxemE5VndXa2lWZm1mdDJHZTdMQVhzdlpHaGM5c0tPb2xnQ21KdDVR?=
 =?utf-8?B?anhHTmpwYVZKVzYweSs3Q3R1UjZaM2xac0l2aW9YbitSTGNzZlFXUUhwcURs?=
 =?utf-8?B?MS8ydnVGK0RWMjgxNGZOczQ5UlpoMzBkZzVwTFpURFdYdkNuY09xRnJqR2ll?=
 =?utf-8?B?cCtGNlZnUndyWVRzY2h5MitCa0Zyd2tBRTNIR1BJYnhMT3NqM0Flb0F4VTZp?=
 =?utf-8?B?bjZObng5RCtONWlsblYxQ1F1czVCd1NCb3VqZjlIdHcrSE9DTytFYzFWckRC?=
 =?utf-8?B?UGN6a2JXUFN3RVZSazR5K2Y0b1lYRGYzM28yQ1dCR0RuK0pXQnRuay9CNEx5?=
 =?utf-8?B?Smg0eTdwVlNJYW5UdjUvVDdIN2JQamFoTHFGekxjSTNZU3Y2L3RSVFBoK1Ix?=
 =?utf-8?B?WS9ER3c5SFB5YlYvei9aTjA1N0VYZFQ3RUtDSkVhSmhRQkF4b0RCaStXdlp1?=
 =?utf-8?B?QjdqTU9IbFFmQ2FYdU92TEpnUy85L2lpRm5NZG11aUJxd0lDbHhTN04yOGk1?=
 =?utf-8?B?NkdSdDk1OStDNVRybU9xZ1l3ZWFZcFV6bndCdEt6NU13RnZkTUpxNkJkZjJD?=
 =?utf-8?B?ZUcvSVFZR05Nc3k2V294ZndsNk0wNmxSNFJLQkJXRnhMeTdiWXVJa2xOMklT?=
 =?utf-8?B?bncwL2xSVndnU2hJam8zMHEydFdBbm96dVVPL1BrWm4wcXMyVmQ0dFg1MUxv?=
 =?utf-8?B?NXdaV2tVRS9CYWdEZTFYNk5KVXVQaEpES2VTRjFCMlJNN0NNYWNhZy9ra1Rt?=
 =?utf-8?B?UisxcU1XaVFDdDBuZnRYdFlla2dNaGliTFZFWWx4Q1hCMW56K2daMDFyeGJJ?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3628ad-66f9-434e-9957-08ddeb92a1a2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 09:08:36.9007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THnHqDrQg0ekim+iuuuQQQdINdb22nA9Qzod3xQKYYy+uiC0hK3GMGehiePGEVY+cuI+j2hmSEtp+4HdFr8Kaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8513
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

Hi Chaitanya,

On 03-09-2025 10:37 am, Chaitanya Kumar Borah wrote:
> With [1], the kernel may return -EINVAL if the requested bpc exceeds
> available bandwidth. Update handling to catch commit failures instead of
> exiting, allowing iteration over all modes to find one that supports the
> maximum bpc.
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> [1] https://lore.kernel.org/intel-gfx/20250730055523.2214966-1-chaitanya.kumar.borah@intel.com/
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   lib/igt_kms.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index d240c7ac5..df4a96a17 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6376,7 +6376,9 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   		    !igt_check_bigjoiner_support(display))
>   			continue;
>   
> -		igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +		if (igt_display_try_commit2(display,
> +					    display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY))
> +			continue;
>   
>   		if (!igt_check_output_bpc_equal(display->drm_fd, pipe,
>   						output->name, bpc))

