Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E55BCA601E
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 17:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1979610EAAB;
	Fri,  9 Oct 2026 17:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UM5NtlUx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD28510EAAB
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 17:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791568339; x=1823104339;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/VYQafx7gJUO+fHAaOHyZ9pr5hqamVsEBAvt5PNcX+g=;
 b=UM5NtlUxOuhZzsi4WMtNZkfF+bx43PHO9xxBZyFJzd1xdhPZFQzes1Uq
 CHa7T3TrQWMr0GM91YMssAEd5b2bdU8avSMxNMVXltQyI7qoZ6lmNUdwx
 4L7yJTn8BK3+cNV/pCZg36kpq5o28Rf4hXjMagVYVhylupO4nJ4OBqxHc
 9tCFRhd+lY+PLh1RcqWIQKyJPn1EmZGywjgMGaHoJELHRqmWYMJ2ANhV3
 Onv19h+qNToX2PS5JtfDQEQDoG6MTCtHBOyrroM9Tc+IGgRA6WlTtGOk/
 w0s48dZj2UNpI4WawtfVIgQlRFYNLL3ys2ydQPq5wJ3p5lwZZ6CoKmov6 g==;
X-CSE-ConnectionGUID: Z5Fn1Xn6QlC8OSWz2VA6jw==
X-CSE-MsgGUID: Sb4xAFvkSJSufDOoJ9T+UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="380184"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="380184"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 10:52:18 -0700
X-CSE-ConnectionGUID: +qIiTlARTXisNrDuyH5bFQ==
X-CSE-MsgGUID: NvbAXLLLTKykGgfvuxDIwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="556712"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 10:52:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 10:52:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 10:52:17 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 10:52:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lU178Jn7KFSummBvW0VotQvpTxQb8qFfhATiZHFFwN5KhCwzQ/nuHkzdQ3/xOIPJxmRpnW7h+3DiBe3utJvM4G+b0dAGYg17jIkOmQ8XufEN30GpOa/DBDxN4GNsP9gu9W+K+Lxjg3I5c2Xr+ZtG2hvTLwG6GIq4dom3Q7RwTXxb/CEpnKleLfjFP0h7KUaADrpv8y878NRy9d//IR290POZ0kShLHo2YI7oWcKi+ds2byttZ2YGUj0praWCfF11S3W7oULu99YrgBt5bLT16Z24sxFK98yU6zN2bWmZxZQ11jh5La1bNWaUJnTfDcexULdCzxaCdKX/XQ9MJJuwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMAj3qMb+HjagefgPjEYO2E2Pxb4rqeEPOWOcFh9kKc=;
 b=n94InMtw5YyuBtnzHBjnn2tkuL1mEsLY7Rzxa55+V3UuMXPQdBuZ9Q53NzHNKbDLXFpMI/Njua+4EX9amuz0/6Cs34CHcrS4ph3xiu8DskOM9Y1pUbRSi9hZcm/rxBRIbzUJFBr4nd0UzspMMTgl/AXilZw9uZAn0oIIWV8gAStipZswL/mBorpBFkdXKRix9o4quwaYX2+gY3Tf85QLKi6OwOJTcOX+yPy/ToRLI4zYx80SWYex6Dy1rHWaKQNoMwoO2nWZIieWbBngvchGq/0USvsh5YQvcQik20ZGM/CSb4m9/py09eNiWMpUNaFhCaq2Erywp9eLSgMZkaslbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 by MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 17:50:13 +0000
Received: from SA1PR11MB5803.namprd11.prod.outlook.com
 ([fe80::ddb:eca0:d411:c638]) by SA1PR11MB5803.namprd11.prod.outlook.com
 ([fe80::ddb:eca0:d411:c638%5]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 17:50:13 +0000
Message-ID: <c258a472-5d98-4edb-873a-b37c82e2bcdf@intel.com>
Date: Fri, 9 Oct 2026 23:20:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel: Add helper to dump GT debug state on C6 wait
 failures
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260921175206.1707165-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260921175206.1707165-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::19) To SA1PR11MB5803.namprd11.prod.outlook.com
 (2603:10b6:806:23e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5803:EE_|MW3PR11MB4620:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a64e29-af40-408c-1f97-08df262dc4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|11063799006|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MGJvt1r6M9+c9KE5OQ9OGZ9+hSiXvmZLoREFp/m6JKTWskB6+3FqWpIcYQix7WLqgAbINTlNXhoIgVNjiDng5tnZFXAcVXjSDfbm/TxkyLYEjI5awBx+4jUAdqBn7uqOaPS7ioOFJhI56ByacwlPbeczJ9sau/ddSYeO86K/UMJHeP2+TMPJIA4v7R6eq6nnM+wtdUpj3M5FGbX3RWCgfOJsQu/8zjAj9zj/Ekitw05cane/CFMZhnUbZhH58aV5RrnJCslOYznxS20W/q5c60eb+CFkY9MGa6KVOFf3l0vuRltxjyBj8uqFT6+zjI8Cazli3wd80BtauMgKDkjiFjkhI58jRU2ePx3qO20l+YSSis3ntKsoYG3TzhEJXRARwtfTkLprS8KIweDgxJfE0PjjpQlOYXAPRBc45MBitj1lKUNop+eSdVkeeVitqDsmosCnVIvuatSdLRNNvwz3Pu8Gt/bPo1sqWCKrmucxqwfeVW/mu87A0LBGDtzUu9wEcw9/8pG/hKI1jFV6hoiluuxntIF3lRlYs79ldYD10DclGqNSUbVHY/B2PsyFwnonhvKyvQAvob2Zm9I1H2T6s1xpMK6K73kILSDJXSk+pYS5L2OwmIi6WsUqr5MWZfRItngEg/SSd3bbS9wsRRUvHSI5wCqD5AhKfSRtGvbVtBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5803.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHRvTmJMek1MN2FKQmc0d3JVQmc4VWhCczVQb1d0WFVaMUZIVklKaEk5OGFk?=
 =?utf-8?B?WnMvSERMeGd0U3lyalB4eiswUlFlaDVJa0YwUnI4OTlwQm1CUEVaWGxQTXVQ?=
 =?utf-8?B?RDVmdnJpMDkzVitBMmN5WUphR3VzN2pGdisxZUo0U0xiUFNiT2tzNzE0dEVP?=
 =?utf-8?B?ejhZREY1NXE4OWtmZ2xwYS9yRHo4Mjl1Y2FyZ0dReFA3SFFRSXFMN3h5cU9S?=
 =?utf-8?B?SDRHVEFac2V2Z1U0NWdHQ1J0QVV3UnhaaGg0VEVWUUZoQXEzOVE3Wm1DakNy?=
 =?utf-8?B?dVBiNlF2TTFJV3prc0JRd0hnOTZIS2w1akNxbG1tanAwTnZyZk1STmFhbnB0?=
 =?utf-8?B?blBTVnhaY01BYzRRSEdNMGR4NVdrd24yU25jUTdYSHExS1ltR0dXa29wZGlR?=
 =?utf-8?B?UExXWXcrc3dta0dxcnA3emVEZlBFQ3dUd1VwN0xQYnZZSkNGY20wSXdPLzc2?=
 =?utf-8?B?bENCT1hTRkwrL2xuSXg1QUZsOXR1eDJCRktuNUZVRmxhbE12TFBvczlDNkJh?=
 =?utf-8?B?N0ZoeHhzd2hrbURRU3Era3MwWlJDQ2FaMGJxVkVLUVdiblMwREk5VkUrV3dt?=
 =?utf-8?B?Vk00S1Q0KzZmL2hSQjJCMzZWSWtaN2tEKzZQc2M5d2FEMkdmN0VKVFUzOWYr?=
 =?utf-8?B?cDBaSkZ3VVFQL3RSMjVzbTdybXZ6QnNzdzdneldpUWVsRWNOMnpMaVREekdG?=
 =?utf-8?B?TS9JL3dMS2gwY0ZKL2xuNzNCM1p2ZUlqdUpHL1NiL2k1bUE1aUd0cG9uVDI4?=
 =?utf-8?B?cU9VdVNTT2FXbmt4MTVSSURseExQSUlxZGJCc29OZmdjQmZWYjRsNDNYdmlD?=
 =?utf-8?B?eFczOFFTQldtSVYyTy9Tbmc2SlRQWWJyNG4yQkxhNkl4S1h4VTVOWURsbGhB?=
 =?utf-8?B?N0E2WW9xWTZXbG9HRUxBby9lSnhPSkVxNHJBYTlMbUtXcUVZSHhHcHVqWWRl?=
 =?utf-8?B?MTlycENKek9yRWkzWDNFT1VKbmJTdUtYbDlOOVoyaEN0WUlYNFhNbVZoeFB4?=
 =?utf-8?B?c0NOZEt1VnBBZU5ibkxZT2o1ekZKWlJuei8xaFRXam1XZFRHNlFpb0RXSkxn?=
 =?utf-8?B?VEVJZDhMbVlaQ0xSVVFGQit1cVhyZ0prVjJSc0svT3l0eXg1dTY5dWNKWGJa?=
 =?utf-8?B?NWpVcmZtR3FSOWJ2Y3NEdS83QzE5UjhsekVaZURhTG50SEplelgrZXc4WWt0?=
 =?utf-8?B?NWdZMG1rcnBVVFBQTGpXWHp0a3Y1QWR0R2IybU9mUXlKRzdPSDV3eUlBbjVh?=
 =?utf-8?B?d0pOYysxKzVVR0VkMTFXUThDaTdyQjgzbkJPYTJDWGxjK3hlR3Y2WElld2NL?=
 =?utf-8?B?RmpEZFZORis5aGlRd2h5bkc3Y1MyTnZFei9EUEgzSVJSYkxZZk1tenQxZ3NG?=
 =?utf-8?B?RjU1VWdiVHZHVXhEejRkZ1h1N3F3NUtRWXQxL055ZG95b2pReG4zVjRRZDdJ?=
 =?utf-8?B?Wk5RTGdNZHpSSlpFTGxHeU1XNHZCbUNFNHhZOU4rUzcrZHFYOUd2STBvQTho?=
 =?utf-8?B?SzBzNDYvclpsMlUzMktEdHo5WCtqNDExMHI1N2lZYytBbDRCV0lYMllhMGdn?=
 =?utf-8?B?T1A5bExkR3lYbzdDeEladDcyK05iVm5QOWt1WkRGaFFjYlpxU2dpczQxZno3?=
 =?utf-8?B?ZVdKdDdQVjdicGJHekgwZncrZEJuRjRGckZmVWlZdDBQZTdzeHBndk84cklU?=
 =?utf-8?B?d0VYMGsrUDZWdzhzVmw1MlA3QVJOclg3ZHhNWWkwZkxGd2VhWXV6QURTdWJS?=
 =?utf-8?B?Ri93RlFnZDRVRUNmQkMwRlZhSVBGQVlEMndUb1lxVVFjWDNOdTRWZHlpN1Iv?=
 =?utf-8?B?ZGhGQUhmMTFLb2RwekxMQ3p2aGcwanYrakV0YStEVUdBRHM0bVd1eGovcVBo?=
 =?utf-8?B?cFpIdm9kVTZhSE5KUDB4RzB3OE1kNXpUTnQ0cVFTaGRPNnFmRWxob1JQOGxu?=
 =?utf-8?B?cCtBV1ZCTnprQjhoS2FFNENrdTd5bDFSMjRPbXk5TEZxZk41enVZNzBIN3Nz?=
 =?utf-8?B?L0hLSHIvUndVd3p2VlRaUGc0S0dkajYva2htd0N4aEMvUUNhVnM3dm5CRThL?=
 =?utf-8?B?dEdMZURPNnByQ1VYVGFSSlNBZjRpYkRqNnBLelUwYVlQUVkxZ0pPalNlUDNW?=
 =?utf-8?B?SkZzdXhqajQ1Ty9IbXZzeE56bzROcVBtbi9RVTBEelpOTnllb3VFU1NaeEVR?=
 =?utf-8?B?VDN2QlR2ZjJ5MEFoaEoybDkrbDI5ei84TWxkbjF4cERXL3kwU2pnY2xqMFRJ?=
 =?utf-8?B?NFluZXNPSTR3NkVIL3Rsekt2dEJFNDlCY2wvcUtZdkNURnpFYlpiZFp4NEhJ?=
 =?utf-8?B?aFVwbHcrZ21RbTNzOGFFdVk4aDFUREVwWWQ0TDZINnVQOUoxUlRtaE5IcXhh?=
 =?utf-8?Q?efH+pHo+8dIOpTZQ=3D?=
X-Exchange-RoutingPolicyChecked: rmN+Sdpw26mc2R41SOS/2iY943cpMTlTQX4uSOEovVZG6efP6yqXMDfkxFlNKaVzgF0Gu4oQrjj1dlO6LNM4rZlN1EiW3D8NqT/sZl5rvFhl2ALFobNYFNZOOimI2y4h2CyJX3k5C2yCjbLzPXlB7zjZySRJY513mtu2f0Gk9HyYzAxV84dlxtK5IEpe8KCUelO/EV2cu8MmCyPKT0bC5TVac38GqGDTuonhMxeNSp6zjuMFyQG0vLMCJSYplfBHph+pIveoAcai1Gw28TMQV7RXekuNKx07VS6c/XsVWURnxtj5jGAxtQrBnnTwLTpvOEme+W5P1kYBvqlU7iB6wQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a64e29-af40-408c-1f97-08df262dc4e5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5803.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 17:50:13.0503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsEaP12MliqVu/QfF0zNNR0tqBqq8jpsXB6FW+Pvk18yF+aQWr9RhxLE+8ieLjKt6xsUg5d7cn+WENdoXVDZuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4620
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

Hi Anirban,

On 21-09-2026 23:22, Sk Anirban wrote:
> GT C6 assertions currently only print GT state on failure, giving
> no insight into what kept the GT busy.
> Add a helper that prints both hw_engines and powergate_info whenever
> a GT C6 check fails or is skipped.
>
> Assisted-by: Copilot:Claude-Sonnet-5
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   lib/xe/xe_gt.c                | 33 +++++++++++++++++++++++++++++++++
>   lib/xe/xe_gt.h                |  1 +
>   tests/intel/xe_gt_freq.c      | 21 ++++++++++++++-------
>   tests/intel/xe_pm_residency.c | 13 +++++++++----
>   tests/intel/xe_pmu.c          |  4 +++-
>   5 files changed, 60 insertions(+), 12 deletions(-)
>
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index 3d8b4f68a..aa61e1ddc 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -8,6 +8,7 @@
>   #include <sys/stat.h>
>   
>   #include "igt_core.h"
> +#include "igt_debugfs.h"
>   #include "igt_sysfs.h"
>   #include "lib/intel_chipset.h"
>   #include "xe_gt.h"
> @@ -229,6 +230,38 @@ bool xe_gt_is_in_c6(int fd, int gt)
>   	return false;
>   }
>   
> +/**
> + * xe_gt_dump_c6_debug_info:
> + * @fd: pointer to xe drm fd
> + * @gt: gt number
> + *
> + * Dumps the hw_engines and powergate_info debugfs entries for @gt via
> + * igt_info, so they are printed unconditionally on both FAIL and SKIP paths.
> + * Always returns false, so it can be OR'd into an igt_wait() condition to
nit: "OR'd into an igt_wait() condition" is misleading — it could be 
OR'd with the igt_wait() result
> + * dump state only when the wait fails.
> + */
> +bool xe_gt_dump_c6_debug_info(int fd, int gt)

Is this function c6‑specific ? Could it be renamed to something more 
generic?

> +{
> +	char *info;
> +	int dir;
> +
> +	dir = igt_debugfs_gt_dir(fd, gt);
> +	if (dir < 0)
> +		return false;
> +
> +	info = igt_sysfs_get(dir, "hw_engines");

Is null check required ?

Thanks,
Soham
> +	igt_info("GT%d hw_engines:\n%s\n", gt, info);
> +	free(info);
> +
> +	info = igt_sysfs_get(dir, "powergate_info");
> +	igt_info("GT%d powergate_info:\n%s\n", gt, info);
> +	free(info);
> +
> +	close(dir);
> +
> +	return false;
> +}
> +
>   /**
>    * xe_gt_fill_engines_by_class:
>    * @fd: pointer to xe drm fd
> diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
> index 93525ea35..3f5d4ee2f 100644
> --- a/lib/xe/xe_gt.h
> +++ b/lib/xe/xe_gt.h
> @@ -21,6 +21,7 @@ void xe_post_hang_ring(int fd, igt_hang_t arg);
>   int xe_gt_stats_get_count(int fd, int gt, const char *stat);
>   
>   bool xe_gt_is_in_c6(int fd, int gt);
> +bool xe_gt_dump_c6_debug_info(int fd, int gt);
>   
>   int xe_gt_fill_engines_by_class(int fd, int gt, int class,
>   				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE]);
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 886537862..775e622d5 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -57,7 +57,8 @@ static void test_throttle_basic_api(int fd, int gt_id)
>   	char *throttle_reasons;
>   	int gt_fd;
>   
> -	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +		     xe_gt_dump_c6_debug_info(fd, gt_id),
>   		     "GT %d should be in C6\n", gt_id);
>   
>   	gt_fd = xe_sysfs_gt_open(fd, gt_id);
> @@ -145,7 +146,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   
>   	if (gt_idle) {
>   		/* Wait for GT to go in C6 as previous xe_gt_get_freq wakes up GT*/
> -		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +			     xe_gt_dump_c6_debug_info(fd, gt_id),
>   			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>   	} else {
> @@ -160,7 +162,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), cur_freq);
>   
>   	if (gt_idle) {
> -		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +			     xe_gt_dump_c6_debug_info(fd, gt_id),
>   			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>   	} else {
> @@ -179,7 +182,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   	igt_assert_eq_u32(xe_gt_get_freq(fd, gt_id, "cur"), rp0);
>   
>   	if (gt_idle) {
> -		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +			     xe_gt_dump_c6_debug_info(fd, gt_id),
>   			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>   	}
> @@ -210,7 +214,8 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
>   	igt_assert(rpn <= cur && cur <= rpmid + FREQ_UNIT_MHZ);
>   
>   	if (gt_idle) {
> -		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +			     xe_gt_dump_c6_debug_info(fd, gt_id),
>   			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>   	} else {
> @@ -412,7 +417,8 @@ int igt_main()
>   
>   	igt_subtest("freq_fixed_idle") {
>   		xe_for_each_gt(fd, gt) {
> -			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
> +			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
> +				      xe_gt_dump_c6_debug_info(fd, gt),
>   				      "GT %d should be in C6\n", gt);
>   			test_freq_fixed(fd, gt, true);
>   		}
> @@ -430,7 +436,8 @@ int igt_main()
>   
>   	igt_subtest("freq_range_idle") {
>   		xe_for_each_gt(fd, gt) {
> -			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
> +			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
> +				      xe_gt_dump_c6_debug_info(fd, gt),
>   				      "GT %d should be in C6\n", gt);
>   			test_freq_range(fd, gt, true);
>   		}
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index e976048a9..65f35569a 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -217,7 +217,9 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
>   	unsigned long elapsed_ms, residency_start, residency_end;
>   	struct timespec ts_start, ts_end;
>   
> -	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
> +	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
> +		     xe_gt_dump_c6_debug_info(fd, gt),
> +		     "GT %d not in C6\n", gt);
>   
>   	if (flag == TEST_S2IDLE) {
>   		clock_gettime(CLOCK_BOOTTIME, &ts_start);
> @@ -326,7 +328,8 @@ static void toggle_gt_c6(int fd, int n)
>   		close(fw_handle);
>   		/* check if all gts are in C6 after forcewake is released */
>   		xe_for_each_gt(fd, gt)
> -			igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
> +			igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
> +				     xe_gt_dump_c6_debug_info(fd, gt),
>   				     "Forcewake released, GT %d should be in C6\n", gt);
>   
>   		if (n == NUM_REPS)
> @@ -392,7 +395,8 @@ static void cpg_gt_toggle(int fd)
>   	int gt;
>   
>   	xe_for_each_gt(fd, gt)
> -		igt_skip_on_f(!igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
> +		igt_skip_on_f(!(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
> +				xe_gt_dump_c6_debug_info(fd, gt)),
>   			      "GT %d is not in C6\n", gt);
>   
>   	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> @@ -581,7 +585,8 @@ int igt_main()
>   	igt_subtest_with_dynamic("gt-c6-on-idle") {
>   		xe_for_each_gt(fd, gt)
>   			igt_dynamic_f("gt%u", gt)
> -				igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
> +				igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
> +					     xe_gt_dump_c6_debug_info(fd, gt),
>   					     "GT %d not in C6\n", gt);
>   	}
>   
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 364e643fe..a123d0d50 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -876,7 +876,9 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
>   
>   	pmu_fd = open_pmu(xe, pmu_config);
>   
> -	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10), "GT %d should be in C6\n", gt);
> +	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10) ||
> +		      xe_gt_dump_c6_debug_info(xe, gt),
> +		      "GT %d should be in C6\n", gt);
>   
>   	/* While idle check full RC6. */
>   	start = read_idle_residency(xe, gt);
