Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F23C624CF
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 09:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A981210E3C6;
	Tue,  1 Sep 2026 09:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kl9kt8p6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA3310E3C6
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 09:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788256023; x=1819792023;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=AFkKyeQUZdn1w2QRDid9MCaj5j5FZSkibm4uJd7bFRQ=;
 b=kl9kt8p6yUcINAZnaDuyN41foYO+ijCrdootsn4l/4oCN1QxZjVlM/Gb
 UGLMjF6hkpZuAQ7XIsYkFcSFbopEq2iNdgcBOaJL5DW+IMcEDkhw/I97a
 o3jFLZefKTOVCjVjz9B3uf9PLZdMtyGUpQrtLlF204K9/PkmBeblMkWsW
 0JtdToHVyd4bQCCOSBkn1s7K1v/DIHsF0YXirpIS1CDwfGA9jH/4zSOyl
 MWwmOyZuzDPj2K6aq4UyDZ9CUDsIQX3QkEDF7wxCa9UPJpAuZvxhmw9Mh
 PGOyZaIrtdLlHpX5p6qcIeEwJjjUwdlTng4Q2VXk2rqPxr3Nuq8WklCfZ Q==;
X-CSE-ConnectionGUID: MnmLLLDdR9+w2hfwaeag5w==
X-CSE-MsgGUID: E5yXUTMySg+398XVousx5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88689738"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208,217";a="88689738"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 02:47:02 -0700
X-CSE-ConnectionGUID: dX/+JecNTU6Ox16knTmYxw==
X-CSE-MsgGUID: Y7wgxoeuQ4Cm9tjZFEclJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
 d="scan'208,217";a="264764407"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 02:47:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 02:47:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 02:47:01 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.64)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 02:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdYIBRfiaasOuNVzf6QHb9TjFzt/2mCLj5q1OFBOVm97BDbl+SUO2CkQ2xJ09sLxbwc3bdbiXEKrgN6VFnZWP5pCbIzboOwwR1NJ2LguQfwPQ84sCRTr83cwBxBBkzakEFuietMhlnCae1wCEgkHac+ADNSVEOCeiCB0eIdwppnc1rSS7JttJFk8Ib0OyfD4FgRYruk/85ypk9KJRZtsHjrbCrUh3c2BRwXbmaLzLC5IwJC1kKf3SL2iFNxfqQy4efn5PSFImKsxPPMhHa0Z5oTFGW5QYsopBJJTaHVR/Dp4y1WWWGotD+afI7E2n9GR1/aEnI45y+VeHMsFPhu5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOYeJKsOOgSku/5y/3VojGxTiEIK9isoX7H6cVjEUTg=;
 b=bBFqe4/e/ApPdFlswO7a+CYwSEwtBkXKp+o1hNAScSwLwIdnFc3yMXtPISp51gdFop6At81WNDAuSazlHt0GVKbwPS6tl0VH1AudL0ProqCA1kJhH3xCdovLNiTU3hy6CdI4XJe+uq6/paraU4VjzmxE5WQRaR72e1JuOTH1e8626U5vqZDxY7gEjo9ZWD1Ef5RHGvE/hAEjQ6aJgrjT2AQoXsJq4n4MPUlm0mldYxXRQmOLV4RebsNrmgDNpsAIOjjaJPhw4TUD7Z8Antku73qsskhzOSKunAkl5HKtirGDtWS62MxeQqxm0+RrzEuArbFXlYbVtBoGaJ65c5zrzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 SJ5PPF2F7FC4EE6.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::81d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 09:46:59 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 09:46:59 +0000
Content-Type: multipart/alternative;
 boundary="------------HSOdS0cFgTNhlB634fDXQc7w"
Message-ID: <04b519a8-ba04-4941-a465-ab11c025d85e@intel.com>
Date: Tue, 1 Sep 2026 15:16:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com>
 <adcde2e9-fc1d-4ecd-9cd5-5d10d870d397@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <adcde2e9-fc1d-4ecd-9cd5-5d10d870d397@intel.com>
X-ClientProxiedBy: MA5PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::16) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|SJ5PPF2F7FC4EE6:EE_
X-MS-Office365-Filtering-Correlation-Id: 9163422d-1895-4e7b-8d97-08df080df7a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|4143699003|6133799003|11063799006|22082099003|18002099003|8096899003|56012099006;
X-Microsoft-Antispam-Message-Info: Jgh0rhZO00H18/HcDPAwCaibOy8r+HGGam+vl4vRNGj5erlWFvVvOrex+uWs6WcPfon7Ggqe0Gt2iI8bd8aU/6ri7Zujsvxqkvo9CF7LHQQfXWd4a5uX3tuoTkqq3P6crldpgTTzImtTxop9/m5+sykNFwU9JwdpWUk+WW4udM2IJSYac5m1ReUvJ2jCN1JgkiwPTg2Vgkx+kUlBuiMyUlzdRUMushcakjlr+T0UvJWtR9PJpXh6qHvoWShso7EIpRjs0QotsbcKMuPa9Xl02QPtY6KmcEPo8/i5hvYtTOTPRASB/nBgmurGVq7H/a2PHwfv2N3bxobfeR7P6wBiwqsMDT412Rmbs2ObTNtqQnuJkERAOu2IHQFWQ815KokYRyVV6qMiDSxKCRDKIZIaiRxOHxDXLaMawZ0IEFA7dltEKW8RP2O4uGKB5IwS1bAU73SeTZFncAT6qyNCMEi2Jacerhf3aYLJpFL4msJRqercN/JTSDOnj2YAv6hxUpa1n4ltxgf/CNO4FSLOKkJepidM5DCxjXMhg4aFBCa7ISsLSnwdFFfVTYEo3lLME+iuW7R0sVH1xVmEIItvTfRJk1dOgGicL/bsmwDzTRWtpwyNRYucoZt59ubR2x+1uOugP1VKps0Rfs3hS7TmvVOGsYpHotfcRleRkA/KLToi4m4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(6133799003)(11063799006)(22082099003)(18002099003)(8096899003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3Y2MVdtZzR3eGtBd1lKUG1Kb0lXaEdFeVF2RWxPRFhQczNwUjJhT3ExaUt3?=
 =?utf-8?B?eUtuVlhRY0RtanNZNkJyTi9EYlpwR0Q2L1U4KzIrbTk3Z0dGR0htWHhoVVhs?=
 =?utf-8?B?R2FFM1gzMkpXVEJ2QXUrNmY2dEY5NEFPSno4WnZWUm1CY3cwYkFxY2c4MWxP?=
 =?utf-8?B?QXVsVVR2STBVWHdwaWIwV29sRVNOR2EybjdLajcyRkFpV3RyV2FYSzVGSWhG?=
 =?utf-8?B?aE95TzlmZTJXSFk1WEZSYXQ5VU5yeTNGNHlnOTJHM1BOYmtValdEMVN0NDdo?=
 =?utf-8?B?NDZiU0NmY3RvYXRYNWVmM2hDdWczUWpPdWtIOWRsWmwwQkpkYnhjclp0MWxC?=
 =?utf-8?B?a0VxZG0rOTNSWjFPQU9WSFI5T2YvOS9Zcks3UW5HVmMybTczWTllRHZSNnl5?=
 =?utf-8?B?eGNibGxkOFVjcjdQak9kbVhUeUcyTmdCTjJvNDQyS29KVTJGUjAvMU0vQmJl?=
 =?utf-8?B?OHREMWVpNlFKVTcxUkIzelVyR2ZiQzFPL25iNDJSTkppc25ZWVhIK2xreVp2?=
 =?utf-8?B?bVl1ODZrVUJUMDJpMlFZK1Z6aytXSmFvQkxTb1FuakhZY2lXL0RzaUNoZEYz?=
 =?utf-8?B?KzVhZXlLSlBEL3BCeGVQM0l5ZDRUNkdtSzhKQ3JpWjhkY0RrWkNDWitMZ3Y3?=
 =?utf-8?B?OFNzOENkbXozSTZkT3ZqOGRWMlBWOW5UOFg3eFUwblN6YnQrZ28zbk9Mb0lp?=
 =?utf-8?B?RUxOWUZSUURwaDgzY2w0UEVpQ3c2S1FHMm9vbXRYUHJMUXlJeUpjak1ZdWRa?=
 =?utf-8?B?bkE2T2ZmSEJ6aG5CUE9CV04xNFlZcXZLUWtzd28zRHhodklVNnY4RVVHZ2Ns?=
 =?utf-8?B?RXdWMEpHT1pXQlgrc3NadjRCQ3lOVHpBZTlTSzBIWExNaHJsUktYTWJINzNH?=
 =?utf-8?B?QWEzWklTVXI2MDhwc1hjTzEwY2N5b3JnRm8xaCsrQWJnQjNOSDRpUEVQVU9h?=
 =?utf-8?B?SmNaWTcrSFU0WmdXczFZUGdGRjJEeHorUkl2eURJNE5jWFRIQXlQa2MyZHNu?=
 =?utf-8?B?TjFMTTZSSDluMU9UU21kY1p6L1E1bTZiY2NNSlpJK1IzTTRiYXBXeE01WXhk?=
 =?utf-8?B?M0dTcVEwQnQxQjhiaGo0YmhqOXJ5bk5TTk5uT01UUDc5a0hqTGU4aW5wS0Vo?=
 =?utf-8?B?d01LTlVSdStsaGxqQnFoWE8ydUVmei9xb2xVN0NGWnVaM2haQUJiNzZrVWsx?=
 =?utf-8?B?OHl0bXNzVEkzMkVRMDFVYmN3RnpObGNsc3ZIcnE4WkM0ajRVcE5LeE5Kd1JG?=
 =?utf-8?B?aXZNNTN5dHdWNnlIYjhxSnNGQkdMQUZOck1qY29VOHhMNUtTa2hpcVVHalQr?=
 =?utf-8?B?TmU2NlFiUVk3Wm9WcVp2bWRVdXhxZjhEd1kvcDYyaFh6STJac2UrRW9LNlZw?=
 =?utf-8?B?NXZaL0lRRVVtRlFpL2xJNjgzQ1Z4OHZHamlmbmpFUURJWVBNWlpyZHFVYjkr?=
 =?utf-8?B?MW5ybDJ2emN5S2NVS1RBV2Q0dElpL1ZlRi9ZRERiMit6UDR2YnpBWE9heits?=
 =?utf-8?B?dTNtQ3V2MUo0bGhTWUQ3aDhMZWZ0UlE4MnNEbllERVI1UUFuSnBjSXlUd3pn?=
 =?utf-8?B?SFlqcXIwNXNjK1hrZHdtUm5HQ0drVFMySit5MEFEMFdjclpUNm05UjJMaXlo?=
 =?utf-8?B?Z0c0Rno4ZVI1WEtaQXZmbmswQld1NXZGeEFtWEJXc1pmODY2MXZvWVdGb3dK?=
 =?utf-8?B?ekcxYlFtaDlabksrT3lsc0dJejcwMWpOdS9HUkJoQlA3ZG5BSjJvWDhIN2V4?=
 =?utf-8?B?YjRES2dlazVoaDBpVTFBTGJiK1pLbE1sTTJsSk5GcW9jWW9OYndXcy81NEFt?=
 =?utf-8?B?QTN6WnZkWFZLNVRWd2RXTXBKTkZJd3hGdzc4dlFYbVpqUlFtbk5OOGwwd0VD?=
 =?utf-8?B?bTc4UVNvYnpVUitqQVp5QzBhTjd1MmpyRkZtTmRGVml0aFY2Zll2cVBJSGxk?=
 =?utf-8?B?eWVMN3E0bExIQzR1QTc3cHl0MVo4d2hadVdIYkhPVm1XdEk1QkNXK1IxQVJ6?=
 =?utf-8?B?eVZJV3NmTmNjWERHSkc1eFArb2kxL2hCNDF6L3RIR1JyaXNiMHgyRFA4eXZJ?=
 =?utf-8?B?cUY1WFdvQmhCUENVdDc3MnVIVWNQTVA1R0hMTEphWkpoY2hoREtGMCsyaTYv?=
 =?utf-8?B?MlU0cXp3WVJIT014TUEvRURvM3cxOElpd2szVytXV2lJNzFQY28vblR4WXY2?=
 =?utf-8?B?b01xMlE2ZXVPdjRBQlIydUZCWGlmc1Rzc1VKdXFkcCsvNFhKTTBRd1RUdTBj?=
 =?utf-8?B?SzB4VFpsL0E0Wm5GSG05YkZRREdnU1M5clJSV0pjeWNOQzlyMU9QYW9ZVjZM?=
 =?utf-8?B?bXVTWGIvV2RNNnVXQ0wrbXl1ajB1RG93ODdMeVRuRzQxQXdxcnc0K0cvNi9z?=
 =?utf-8?Q?zmhjddLjc57XsLfln8kk97LgET1v/r3/FbOzi?=
X-Exchange-RoutingPolicyChecked: p3HmWfdLsndTTd88qfJJmVIAScYJiF1GbdBXya4szgphHVx2QURT0hNBQrWgz2IrYeVHn/9/SVIXcUf7/fpA7O9EGdKlTgV5u6kd7MtDZ3U0Z+jlD9AhKgViuF5ZNPX/Pjy8pOShVW+FgJZYE8yaYf9iXtiQ32QadaG8wVqblapsOE/9wzgX2rwQMv5ptYnnKUA6BUjV33G+XGPG9uW/szHm7ic2bCsJVGS6uWiYLSbfs0V1DWbk/QjSc2V7DhPmMlFBSyE2kqymIIO6xuRJC6yP40YhV9frmBtPbDtWA1KKcqGqQC3AEuzTiTcMKglTybpP+Wtlhq5U3bQg5gpJVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9163422d-1895-4e7b-8d97-08df080df7a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 09:46:59.5216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfIsQmpEmnRPBZ92sBpJzEA0SJVTg7DrweX9MlT0iw11A5d5mP1DmtkQCQ9Hbf3hH6Ey0rILRL4mlzZk+/GN31UvkQdeeJVyb7mwoXcqtOCWtsE5ZF37t3WqFen/qh1m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2F7FC4EE6
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

--------------HSOdS0cFgTNhlB634fDXQc7w
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 31-08-2026 13:32, Purkait, Soham wrote:
>
> Hi Ravi,
>
> On 24-08-2026 22:11, Ravi Kishore Koppuravuri wrote:
>> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
>> injection to verify the Xe driver error handling and recovery flows with
>> the help of DRM Netlink API suite
>>
>> Signed-off-by: Ravi Kishore Koppuravuri<ravi.kishore.koppuravuri@intel.com>
>> ---
>>   tests/intel/xe_err_injection.c | 321 +++++++++++++++++++++++++++++++++
>>   tests/intel/xe_err_injection.h |  18 ++
>>   tests/meson.build              |   1 +
>>   3 files changed, 340 insertions(+)
>>   create mode 100644 tests/intel/xe_err_injection.c
>>   create mode 100644 tests/intel/xe_err_injection.h
>>
>> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
>> new file mode 100644
>> index 000000000..ded5f558f
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.c
>> @@ -0,0 +1,321 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: MMIO based Error Injection
>> + * Category: RAS
>> + * Mega feature: Telemetry
>> + * Sub-category: Driver
>> + * Test category: Error Injection
>> + */
>> +
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <time.h>
>> +#include <fcntl.h>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "lib/igt_drm_netlink.h"
>> +#include "lib/intel_reg.h"
>> +#include "lib/intel_compute.h"
>> +
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_mmio.h"
>> +#include "xe/xe_query.h"
>> +#include "xe_err_injection.h"
>> +
>> +enum {
>> +	RECOVERY_SUCCESS = 1,
>> +	RECOVERY_FAILED,
>> +	RECOVERY_TIMEOUT,
>> +};
>> +
>> +static void run_xe_compute_on_all_engines(int fd, bool state)
>> +{
>> +	struct drm_xe_engine_class_instance *hwe;
>> +
>> +	if (state == POST_ARMING_INJECTION_WL)
>> +		igt_info("Running compute-square on all engines post injection\n");
>> +	else if (state == POST_RECOVERY_WL)
>> +		igt_info("Running compute-square on all engines post recovery\n");
>> +
>> +	xe_for_each_engine(fd, hwe) {
>> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>> +			continue;
>> +
>> +		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
>> +								    EXECENV_PREF_SYSTEM),
>> +								    "GPU does not support "
>> +								    "compute on engine\n");
>> +	}
>> +}
>> +
>> +static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
>> +{
>> +	xe_mmio_write32(mmio, reg, value);
>> +}
>> +
>> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
>> +			   uint32_t bit_mask, bool set)
>> +{
>> +	uint32_t regval;
>> +
>> +	regval = xe_mmio_read32(mmio, reg_addr);
>> +	if (set)
>> +		regval |= bit_mask;
>> +	else
>> +		regval &= ~bit_mask;
>> +
>> +	xe_mmio_write32(mmio, reg_addr, regval);
>> +}
>> +
>> +static int acquire_forcewake(int fd)
>> +{
>> +	int fw_handle;
>> +
>> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>> +	igt_assert_lte(0, fw_handle);
>> +	return fw_handle;
>> +}
>> +
>> +static void release_forcewake(int fw_handle)
>> +{
>> +	if (fw_handle >= 0)
>> +		close(fw_handle);
>> +}
>> +
>> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
>> +{
>> +	struct app_context ctx;
>> +	int ret;
>> +	uint32_t error_value = UINT32_MAX;
>> +
>> +	ret = igt_init_nl_socket(&ctx);
>> +	if (ret < 0) {
>> +		igt_warn("Failed to initialize netlink socket for error command (ret=%d)\n", ret);
>> +		return error_value;
>> +	}
>> +
>> +	ctx.node_id = node_id;
>> +	ctx.error_id = error_id;
>> +
>> +	ret = igt_get_error_counter(&ctx);
>> +	if (ret < 0) {
>> +		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
>> +	} else {
>> +		error_value = ctx.error_value;
>> +		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
>> +			 ctx.node_id, ctx.error_id, ctx.error_value);
>> +	}
>> +
>> +	igt_cleanup_nl_socket(&ctx);
>> +
>> +	return error_value;
>> +}
>> +
>> +static int check_dmesg_for_recovery(const char *marker, int elapsed_secs)
> Could it it be kept only "check_dmesg" instead of 
> "check_dmesg_for_recovery" to make it more generic ?
Sure. will include in the next revision. Thanks
>> +{
>> +	char *buff = NULL;
>> +	size_t buff_size = 0;
>> +	ssize_t line_len;
>> +	FILE *fp;
>> +	const char *success = "AER: device recovery successful";
>> +	const char *failed = "AER: device recovery failed";
>
> Instead of defining these strings here keep it in a global const array 
> against the enums as the indices to make it scalable.
>
Sure. will include in the next revision. Thanks
>
> Thanks,
> Soham
>
>> +	bool marker_seen = false;
>> +
>> +	fp = popen("dmesg", "r");
>> +	if (!fp) {
>> +		igt_warn("Unable to open dmesg to check recovery status\n");
>> +		return -1;
>> +	}
>> +
>> +	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
>> +		(void)line_len;
>> +		if (!marker_seen) {
>> +			if (strstr(buff, marker))
>> +				marker_seen = true;
>> +			continue;
>> +		}
>> +
>> +		if (strstr(buff, success)) {
>> +			igt_info("Found \"%s\" in dmesg after %d secs\n", success, elapsed_secs);
>> +			free(buff);
>> +			pclose(fp);
>> +			return RECOVERY_SUCCESS;
>> +		}
>> +		if (strstr(buff, failed)) {
>> +			igt_info("Found \"%s\" in dmesg after %d secs\n", failed, elapsed_secs);
>> +			free(buff);
>> +			pclose(fp);
>> +			return RECOVERY_FAILED;
>> +		}
>> +	}
>> +
>> +	free(buff);
>> +	pclose(fp);
>> +	return RECOVERY_TIMEOUT;
>> +}
>> +
>> +static int check_err_recovery(void)
>> +{
>> +	time_t start_time = time(NULL);
>> +	time_t timeout = 5 * 60;
>> +	int time_interval = 30;
>> +	time_t elapsed_time;
>> +	int status;
>> +	char marker[128];
>> +
>> +	snprintf(marker, sizeof(marker),
>> +		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
>> +		 getpid(), (long long)start_time);
>> +	igt_kmsg(KMSG_INFO "%s\n", marker);
>> +
>> +	while (1) {
>> +		elapsed_time = time(NULL) - start_time;
>> +		status = check_dmesg_for_recovery(marker, elapsed_time);
>> +		if (status < 0) {
>> +			igt_warn("Failed to query dmesg for recovery status\n");
>> +			return RECOVERY_FAILED;
>> +		}
>> +		if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
>> +			return status;
>> +
>> +		if (elapsed_time >= timeout) {
>> +			igt_warn("Timed out while waiting for error recovery\n");
>> +			return RECOVERY_TIMEOUT;
>> +		}
>> +
>> +		sleep(time_interval);
>> +	}
>> +}
>> +
>> +static void print_aer_recovery_status(void)
>> +{
>> +	int recovery_ret;
>> +
>> +	recovery_ret = check_err_recovery();
>> +	igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
>> +		     "AER error recovery timed out\n");
>> +	igt_assert_f(recovery_ret != RECOVERY_FAILED,
>> +		     "AER device recovery failed\n");
>> +	if (recovery_ret == RECOVERY_SUCCESS)
>> +		igt_info("AER device recovery successful\n");
>> +}
>> +
>> +static void log_status(bool val, const char *err_name)
>> +{
>> +	if (val)
>> +		igt_info("Injection: %s Success\n", err_name);
>> +	else
>> +		igt_info("Injection: %s Failed\n", err_name);
>> +}
>> +
>> +static bool gt_uc_wkr_parity_recovered;
>> +
>> +/**
>> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
>> + * Description: GT Uncorrectable Unicast Walker Command parity error injection
>> + * Functionality: error injection
>> + */
>> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>> +{
>> +	int fw_handle;
>> +	uint32_t error_counter_before_inj;
>> +	uint32_t error_counter_after_inj;
>> +	/** TODO
>> +	 *  Fetching node_id and error_id dynamically is pending to implement.
>> +	 *  For now, using
>> +	 *  node_id=1 (uncorrectable_errors) and
>> +	 *  error_id=1 (core_compute)
>> +	 */
>> +	uint32_t node_id = 1;
>> +	uint32_t error_id = 1;
>> +
>> +	fw_handle = acquire_forcewake(fd);
>> +
>> +	error_counter_before_inj = get_counter(node_id, error_id);
>> +
>> +	/* Arm the injection sequence. */
>> +	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
>> +	modify_reg_bit(mmio,
>> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
>> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
>> +		       true);
>> +	modify_reg_bit(mmio,
>> +		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
>> +		       MC_PKT_CTRL_MGSR_3D_VALUE,
>> +		       true);
>> +	igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity error\n");
>> +
>> +	run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
>> +
>> +	release_forcewake(fw_handle);
>> +	print_aer_recovery_status();
>> +	error_counter_after_inj = get_counter(node_id, error_id);
>> +
>> +	igt_assert_f(error_counter_before_inj != UINT32_MAX &&
>> +		     error_counter_after_inj != UINT32_MAX,
>> +		     "Failed to fetch valid error counters: before=%u after=%u\n",
>> +		     error_counter_before_inj, error_counter_after_inj);
>> +
>> +	igt_info("error counter: before injection=%u after injection=%u\n",
>> +		 error_counter_before_inj, error_counter_after_inj);
>> +
>> +	igt_assert_f(error_counter_after_inj > error_counter_before_inj,
>> +		     "GT Uncorrectable Unicast Walker Cmd parity error injection "
>> +		     "failed: before injection=%u after injection=%u\n",
>> +		     error_counter_before_inj, error_counter_after_inj);
>> +	igt_info("GT Uncorrectable Unicast Walker Cmd parity error injection successful\n");
>> +	gt_uc_wkr_parity_recovered = true;
>> +}
>> +
>> +static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
>> +{
>> +	igt_info("Starting Error Injection test: %s\n", injection);
>> +	if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err") == 0)
>> +		wkr_cmd_parity_err_injection(mmio, fd);
>> +	else if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
>> +		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
>> +	else
>> +		igt_info("Invalid Error Injection specified\n");
>> +}
>> +
>> +/**
>> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
>> + * Description: Run a post-recovery Xe workload after parity error injection.
>> + * Functionality: workload validation
>> + */
>> +
>> +int igt_main()
>> +{
>> +	int fd;
>> +	struct xe_mmio mmio;
>> +
>> +	igt_fixture() {
>> +		fd = drm_open_driver(DRIVER_XE);
>> +		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
>> +		xe_mmio_access_init(fd, &mmio);
>> +		igt_require(xe_mmio_is_initialized(&mmio));
>> +	}
>> +
>> +	igt_describe("Inject GT uncorrectable unicast worker command parity error.");
>> +	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err")
>> +		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err", &mmio, fd);
>> +
>> +	igt_describe("Run post-recovery workload after GT parity error injection test.");
>> +	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
>> +		igt_require_f(gt_uc_wkr_parity_recovered,
>> +			      "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
>> +		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
>> +	}
>> +
>> +	igt_fixture() {
>> +		xe_mmio_access_fini(&mmio);
>> +		drm_close_driver(fd);
>> +	}
>> +}
>> diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
>> new file mode 100644
>> index 000000000..d7efc2fd2
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef XE_ERR_INJECTION_H
>> +#define XE_ERR_INJECTION_H
>> +
>> +/* GT Uncorrectable unicast worker command parity error injection */
>> +#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
>> +#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
>> +
>> +#define POST_RECOVERY_WL 1
>> +#define POST_ARMING_INJECTION_WL 0
>> +
>> +#endif /* XE_ERR_INJECTION_H */
>> diff --git a/tests/meson.build b/tests/meson.build
>> index a62f447df..0f090dcee 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -292,6 +292,7 @@ intel_xe_progs = [
>>   	'xe_debugfs',
>>   	'xe_dma_buf_sync',
>>   	'xe_drm_fdinfo',
>> +	'xe_err_injection',
>>   	'xe_eu_stall',
>>   	'xe_evict',
>>   	'xe_evict_ccs',
--------------HSOdS0cFgTNhlB634fDXQc7w
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 31-08-2026 13:32, Purkait, Soham
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:adcde2e9-fc1d-4ecd-9cd5-5d10d870d397@intel.com">
      
      <p>Hi Ravi,</p>
      <div class="moz-cite-prefix">On 24-08-2026 22:11, Ravi Kishore
        Koppuravuri wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com">
        <pre wrap="" class="moz-quote-pre">MMIO based GT Uncorrectable Unicast GAM Walker command parity error
injection to verify the Xe driver error handling and recovery flows with
the help of DRM Netlink API suite

Signed-off-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com" moz-do-not-send="true">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a>
---
 tests/intel/xe_err_injection.c | 321 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  18 ++
 tests/meson.build              |   1 +
 3 files changed, 340 insertions(+)
 create mode 100644 tests/intel/xe_err_injection.c
 create mode 100644 tests/intel/xe_err_injection.h

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
new file mode 100644
index 000000000..ded5f558f
--- /dev/null
+++ b/tests/intel/xe_err_injection.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: MMIO based Error Injection
+ * Category: RAS
+ * Mega feature: Telemetry
+ * Sub-category: Driver
+ * Test category: Error Injection
+ */
+
+#include &lt;stdio.h&gt;
+#include &lt;stdlib.h&gt;
+#include &lt;string.h&gt;
+#include &lt;time.h&gt;
+#include &lt;fcntl.h&gt;
+#include &lt;unistd.h&gt;
+
+#include &quot;igt.h&quot;
+#include &quot;lib/igt_drm_netlink.h&quot;
+#include &quot;lib/intel_reg.h&quot;
+#include &quot;lib/intel_compute.h&quot;
+
+#include &quot;xe_drm.h&quot;
+#include &quot;xe/xe_ioctl.h&quot;
+#include &quot;xe/xe_mmio.h&quot;
+#include &quot;xe/xe_query.h&quot;
+#include &quot;xe_err_injection.h&quot;
+
+enum {
+	RECOVERY_SUCCESS = 1,
+	RECOVERY_FAILED,
+	RECOVERY_TIMEOUT,
+};
+
+static void run_xe_compute_on_all_engines(int fd, bool state)
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	if (state == POST_ARMING_INJECTION_WL)
+		igt_info(&quot;Running compute-square on all engines post injection\n&quot;);
+	else if (state == POST_RECOVERY_WL)
+		igt_info(&quot;Running compute-square on all engines post recovery\n&quot;);
+
+	xe_for_each_engine(fd, hwe) {
+		if (hwe-&gt;engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+			continue;
+
+		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
+								    EXECENV_PREF_SYSTEM),
+								    &quot;GPU does not support &quot;
+								    &quot;compute on engine\n&quot;);
+	}
+}
+
+static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
+{
+	xe_mmio_write32(mmio, reg, value);
+}
+
+static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
+			   uint32_t bit_mask, bool set)
+{
+	uint32_t regval;
+
+	regval = xe_mmio_read32(mmio, reg_addr);
+	if (set)
+		regval |= bit_mask;
+	else
+		regval &amp;= ~bit_mask;
+
+	xe_mmio_write32(mmio, reg_addr, regval);
+}
+
+static int acquire_forcewake(int fd)
+{
+	int fw_handle;
+
+	fw_handle = igt_debugfs_open(fd, &quot;forcewake_all&quot;, O_RDONLY);
+	igt_assert_lte(0, fw_handle);
+	return fw_handle;
+}
+
+static void release_forcewake(int fw_handle)
+{
+	if (fw_handle &gt;= 0)
+		close(fw_handle);
+}
+
+static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
+{
+	struct app_context ctx;
+	int ret;
+	uint32_t error_value = UINT32_MAX;
+
+	ret = igt_init_nl_socket(&amp;ctx);
+	if (ret &lt; 0) {
+		igt_warn(&quot;Failed to initialize netlink socket for error command (ret=%d)\n&quot;, ret);
+		return error_value;
+	}
+
+	ctx.node_id = node_id;
+	ctx.error_id = error_id;
+
+	ret = igt_get_error_counter(&amp;ctx);
+	if (ret &lt; 0) {
+		igt_warn(&quot;get_error_counter failed from error command path (ret=%d)\n&quot;, ret);
+	} else {
+		error_value = ctx.error_value;
+		igt_info(&quot;get_error_counter: node_id=%u error_id=%u value=%u\n&quot;,
+			 ctx.node_id, ctx.error_id, ctx.error_value);
+	}
+
+	igt_cleanup_nl_socket(&amp;ctx);
+
+	return error_value;
+}
+
+static int check_dmesg_for_recovery(const char *marker, int elapsed_secs)</pre>
      </blockquote>
      Could it it be kept only&nbsp;<span style="white-space: pre-wrap">&quot;check_dmesg&quot; </span>instead
      of &quot;<span style="white-space: pre-wrap">check_dmesg_for_recovery&quot; to make it more generic ?</span></blockquote>
    Sure. will include in the next revision. Thanks
    <blockquote type="cite" cite="mid:adcde2e9-fc1d-4ecd-9cd5-5d10d870d397@intel.com">
      <blockquote type="cite" cite="mid:20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com">
        <pre wrap="" class="moz-quote-pre">+{
+	char *buff = NULL;
+	size_t buff_size = 0;
+	ssize_t line_len;
+	FILE *fp;
+	const char *success = &quot;AER: device recovery successful&quot;;
+	const char *failed = &quot;AER: device recovery failed&quot;;</pre>
      </blockquote>
      <p>Instead of defining these strings here keep it in a global
        const array against the enums as the indices to make it
        scalable.</p>
    </blockquote>
    Sure. will include in the next revision. Thanks
    <blockquote type="cite" cite="mid:adcde2e9-fc1d-4ecd-9cd5-5d10d870d397@intel.com">
      <p>Thanks,<br>
        Soham</p>
      <blockquote type="cite" cite="mid:20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com">
        <pre wrap="" class="moz-quote-pre">+	bool marker_seen = false;
+
+	fp = popen(&quot;dmesg&quot;, &quot;r&quot;);
+	if (!fp) {
+		igt_warn(&quot;Unable to open dmesg to check recovery status\n&quot;);
+		return -1;
+	}
+
+	while ((line_len = getline(&amp;buff, &amp;buff_size, fp)) != -1) {
+		(void)line_len;
+		if (!marker_seen) {
+			if (strstr(buff, marker))
+				marker_seen = true;
+			continue;
+		}
+
+		if (strstr(buff, success)) {
+			igt_info(&quot;Found \&quot;%s\&quot; in dmesg after %d secs\n&quot;, success, elapsed_secs);
+			free(buff);
+			pclose(fp);
+			return RECOVERY_SUCCESS;
+		}
+		if (strstr(buff, failed)) {
+			igt_info(&quot;Found \&quot;%s\&quot; in dmesg after %d secs\n&quot;, failed, elapsed_secs);
+			free(buff);
+			pclose(fp);
+			return RECOVERY_FAILED;
+		}
+	}
+
+	free(buff);
+	pclose(fp);
+	return RECOVERY_TIMEOUT;
+}
+
+static int check_err_recovery(void)
+{
+	time_t start_time = time(NULL);
+	time_t timeout = 5 * 60;
+	int time_interval = 30;
+	time_t elapsed_time;
+	int status;
+	char marker[128];
+
+	snprintf(marker, sizeof(marker),
+		 &quot;IGT xe_err_injection recovery marker pid=%d start=%lld&quot;,
+		 getpid(), (long long)start_time);
+	igt_kmsg(KMSG_INFO &quot;%s\n&quot;, marker);
+
+	while (1) {
+		elapsed_time = time(NULL) - start_time;
+		status = check_dmesg_for_recovery(marker, elapsed_time);
+		if (status &lt; 0) {
+			igt_warn(&quot;Failed to query dmesg for recovery status\n&quot;);
+			return RECOVERY_FAILED;
+		}
+		if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
+			return status;
+
+		if (elapsed_time &gt;= timeout) {
+			igt_warn(&quot;Timed out while waiting for error recovery\n&quot;);
+			return RECOVERY_TIMEOUT;
+		}
+
+		sleep(time_interval);
+	}
+}
+
+static void print_aer_recovery_status(void)
+{
+	int recovery_ret;
+
+	recovery_ret = check_err_recovery();
+	igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
+		     &quot;AER error recovery timed out\n&quot;);
+	igt_assert_f(recovery_ret != RECOVERY_FAILED,
+		     &quot;AER device recovery failed\n&quot;);
+	if (recovery_ret == RECOVERY_SUCCESS)
+		igt_info(&quot;AER device recovery successful\n&quot;);
+}
+
+static void log_status(bool val, const char *err_name)
+{
+	if (val)
+		igt_info(&quot;Injection: %s Success\n&quot;, err_name);
+	else
+		igt_info(&quot;Injection: %s Failed\n&quot;, err_name);
+}
+
+static bool gt_uc_wkr_parity_recovered;
+
+/**
+ * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
+ * Description: GT Uncorrectable Unicast Walker Command parity error injection
+ * Functionality: error injection
+ */
+static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	uint32_t error_counter_before_inj;
+	uint32_t error_counter_after_inj;
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=1 (uncorrectable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	uint32_t node_id = 1;
+	uint32_t error_id = 1;
+
+	fw_handle = acquire_forcewake(fd);
+
+	error_counter_before_inj = get_counter(node_id, error_id);
+
+	/* Arm the injection sequence. */
+	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
+	modify_reg_bit(mmio,
+		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
+		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
+		       true);
+	modify_reg_bit(mmio,
+		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
+		       MC_PKT_CTRL_MGSR_3D_VALUE,
+		       true);
+	igt_info(&quot;Injected GT Uncorrectable Unicast Walker Cmd parity error\n&quot;);
+
+	run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
+
+	release_forcewake(fw_handle);
+	print_aer_recovery_status();
+	error_counter_after_inj = get_counter(node_id, error_id);
+
+	igt_assert_f(error_counter_before_inj != UINT32_MAX &amp;&amp;
+		     error_counter_after_inj != UINT32_MAX,
+		     &quot;Failed to fetch valid error counters: before=%u after=%u\n&quot;,
+		     error_counter_before_inj, error_counter_after_inj);
+
+	igt_info(&quot;error counter: before injection=%u after injection=%u\n&quot;,
+		 error_counter_before_inj, error_counter_after_inj);
+
+	igt_assert_f(error_counter_after_inj &gt; error_counter_before_inj,
+		     &quot;GT Uncorrectable Unicast Walker Cmd parity error injection &quot;
+		     &quot;failed: before injection=%u after injection=%u\n&quot;,
+		     error_counter_before_inj, error_counter_after_inj);
+	igt_info(&quot;GT Uncorrectable Unicast Walker Cmd parity error injection successful\n&quot;);
+	gt_uc_wkr_parity_recovered = true;
+}
+
+static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
+{
+	igt_info(&quot;Starting Error Injection test: %s\n&quot;, injection);
+	if (strcmp(injection, &quot;test_GT-UC-unicast-wkr-cmd-parity-err&quot;) == 0)
+		wkr_cmd_parity_err_injection(mmio, fd);
+	else if (strcmp(injection, &quot;test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl&quot;) == 0)
+		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
+	else
+		igt_info(&quot;Invalid Error Injection specified\n&quot;);
+}
+
+/**
+ * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
+ * Description: Run a post-recovery Xe workload after parity error injection.
+ * Functionality: workload validation
+ */
+
+int igt_main()
+{
+	int fd;
+	struct xe_mmio mmio;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_debugfs_exists(fd, &quot;forcewake_all&quot;, O_RDONLY));
+		xe_mmio_access_init(fd, &amp;mmio);
+		igt_require(xe_mmio_is_initialized(&amp;mmio));
+	}
+
+	igt_describe(&quot;Inject GT uncorrectable unicast worker command parity error.&quot;);
+	igt_subtest(&quot;test_GT-UC-unicast-wkr-cmd-parity-err&quot;)
+		inject_error(&quot;test_GT-UC-unicast-wkr-cmd-parity-err&quot;, &amp;mmio, fd);
+
+	igt_describe(&quot;Run post-recovery workload after GT parity error injection test.&quot;);
+	igt_subtest(&quot;test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl&quot;) {
+		igt_require_f(gt_uc_wkr_parity_recovered,
+			      &quot;Run GT-UC-unicast-wkr-cmd-parity-err first\n&quot;);
+		inject_error(&quot;test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl&quot;, &amp;mmio, fd);
+	}
+
+	igt_fixture() {
+		xe_mmio_access_fini(&amp;mmio);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
new file mode 100644
index 000000000..d7efc2fd2
--- /dev/null
+++ b/tests/intel/xe_err_injection.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef XE_ERR_INJECTION_H
+#define XE_ERR_INJECTION_H
+
+/* GT Uncorrectable unicast worker command parity error injection */
+#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
+#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
+#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
+#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
+
+#define POST_RECOVERY_WL 1
+#define POST_ARMING_INJECTION_WL 0
+
+#endif /* XE_ERR_INJECTION_H */
diff --git a/tests/meson.build b/tests/meson.build
index a62f447df..0f090dcee 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -292,6 +292,7 @@ intel_xe_progs = [
 	'xe_debugfs',
 	'xe_dma_buf_sync',
 	'xe_drm_fdinfo',
+	'xe_err_injection',
 	'xe_eu_stall',
 	'xe_evict',
 	'xe_evict_ccs',
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------HSOdS0cFgTNhlB634fDXQc7w--
