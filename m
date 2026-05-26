Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C596CCD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 20:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725F710E48D;
	Tue, 26 May 2026 20:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUicSqw7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BF910E1EC
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 20:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779827867; x=1811363867;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pBNlCGX5TzGo7UZRcyeKFhhPChhlr+v/V61RpxZvb44=;
 b=AUicSqw7CJ6j22J0E8I1/zvQNFyi9PSxpaJ51XzC/dYokVvfhQocks78
 O49/rQvZCJYYpIaePhJtg4ul5q37PZicaspzgMVGYS9QLelGqq9c4VlPG
 NRaWni2oL+KpRtKp8//IbqKI62bZkDUKYRCQb0RCUiaAR3koIviymoAmd
 l9A4RVbg6W/AcvK9e+ESZXvCvBIx3gZ1mSfk3XzvG7BskJmvBis8LzDQa
 KIpB0hUFsbogK7gptndDoF+TY0HvFMrrp0VjCQw8fRormy96ZVFWluZ3P
 Ptl1QD/9M+ffTxGVpUa1X8ng1pvtw9Ec+Mk6YG/1SrhDkDlZ4egtvA2mh g==;
X-CSE-ConnectionGUID: b61wyuzYT0uKAoXI0/Nu/Q==
X-CSE-MsgGUID: AOkeKYMDSnCGzOOg3eD5TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84543380"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="84543380"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 13:37:46 -0700
X-CSE-ConnectionGUID: D5VRtzi0T7yT0NrOCNTsLg==
X-CSE-MsgGUID: pjpSg4wLRpC1mcBZUvHkfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="241867905"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 13:37:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 13:37:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 13:37:45 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.45)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 13:37:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IP+tsZpuCd4AINAnjEQAVlBzt0lYuov08KQLqA4n4i0k6AcCyk7uI6xqb0KACqqVAuqbONrMlUDixhHCaYsPfRGMboI/vAt0/aQr4YSCsh4/j1LFiQwrUQBk4jjG2lgmhqfNJoYLkv78GR3rlkrMQ+bVDI37SAqAvSM5wYrIJ8Xc0GdPT3Wa0lI9txCte0mrIY8NSihS4WpQg7lsVqVoBGhh5LZP37ARO7sKPNTgFZTAUCUjUhmSTuH/w951fCfptqM90eGetnDgFpuiHiBtgZMjgtYlQD3Lo2HS0R7mYgeMpj4GtN2qP+xbiVr6205e2WPlkCFArE+xGJDdyYFojw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRL1QSCRTE9VA7dyd8vQe0M3sC31Y4noagE4upClGMw=;
 b=Wm/rKl6ogAseNwZG9lqFk85lj1T/wj4vASIECKdv8VVIVzPYe7HX+hheousRlkoKnT7Qvb/DGxQIo/TAc33C02lDIh93AUOQj4X+cF+lXE8mFWUE5I7fHdlZ7GZ+B1Au+47XO+eBFDbBcLKrAEoMotNxKsx+oioganLEKH9Rn/MSjsfApFwh0TB3AYS22QirFM3vpjnm3CbbrYqwo+zI8dtEoymmXivXYAnVXBihmfCem1Tt3jBvlk7uNG4+kTFIz02dnCjujpPa5gJ92QtFd4tpB8ARvm7rjENx2kY3/etNoQoIA1yBicHRoJlY5AuVUk3tmL4oRIVXtrP5rbzsHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by IA3PR11MB8894.namprd11.prod.outlook.com (2603:10b6:208:574::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Tue, 26 May
 2026 20:37:38 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 20:37:37 +0000
Message-ID: <0db525fa-a300-4b8e-adcd-26731bf3252c@intel.com>
Date: Wed, 27 May 2026 02:07:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_color: Add multi-format coverage for
 pipe color tests
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260526054909.688792-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260526054909.688792-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0169.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::13) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|IA3PR11MB8894:EE_
X-MS-Office365-Filtering-Correlation-Id: 83061d33-be4b-4c68-0c5c-08debb669fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|3023799007|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: rhk01Xm4k59AD6pWmXCzNl7ybRoWk0ludiCO3dsZtIecR7K8q/T5suMqJximL4fh7P/FUaj2oZ3ytAnPMYY2ljXgzfUZDiKtejDRD3fApnRuIMKA3ZmW7yFsa6d86N892+T3zDyYJfLAKAi2A2qm5K//RHEBkgGwcpR7TCPGbTJpEZK4s8YrbpF12GOpXJ9znfAg/+E2EF7K12blc/33miBvo3dAsVqmfT63AzsyLm8h/PpVOwNdWQtUEsHD5B5cJIcDW22Y2Q7BRqvrOIXlQKnfTX2MZjy4zVykFVrWNhONtAQnrf8bx3intn8wL4egW1oAu3bj7QdLhVk4ql4vjmq2CrtvyEHb4NnvJIgVJtPo4PWcD2o4Xr9Pyn7POC0heQdiqMjaExpNipN+FX+3Cl0hIQLi7uVrukV0Lgbv4ssYdTPVCNSBJRSLTz0WECAUxxCskRRhPwri9WMuXHuvXzX9caoNRjDovP3wXYddlFQURSH3nzx3MEBG557xO/wEAtLcVl/NkAQtLnGhn+P7kV3VjVs5WdGEURzZzqaYwDN8/X+pDHBLguowPvGkWnPzBlaTCuba9IP2t33qKtnZ8Iz1HJECVIMZYyS2GEnXil5QUw9mAf9DAA6GjvjHSN/yFwz7TXrY5mkcODnKM+PZiJ/5wIX5X63/QwxEHtwIGj128O/KHj5/ldE6PLczE8aT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(3023799007)(5023799004)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTRKTk52NkxUR0d5eis1YUhqWjg0NklYNlNRNE92NHFGaW9Mci9kdTZQVXpp?=
 =?utf-8?B?ODl3TDhFSHJUVG95TTFwUDYvaWt2bll0ZVV2K2NBc3N6OHh2cTVacUpIdDNY?=
 =?utf-8?B?MlhnOUs2REhqRE4xaXJvbTU2ZjJTc214b0ZnOTFnMnpEUkpZRVd4dVhhUng4?=
 =?utf-8?B?M1IraTJqSlFVRHFnTURMYXpzcGtVTkVETVRxQ3ZQWStaNHNrK3M4UmVSZFE5?=
 =?utf-8?B?Z1ZNcE9adDBNazJWUWEvaXlaNlVBUmFaWjhZRHBaN1UrVmltaU1ZVFJVVnFT?=
 =?utf-8?B?YzN3MUlKVkcxNmdINVBGaFB5aUZDOEZjNjJwelVmQkRiRFJTeldrUWJCZzBL?=
 =?utf-8?B?OC96RWV4bEV4QzdXMVZCK1lDeXNaQkRZcUVBcnRVRXR2YXFZdUVWc2x2dTNW?=
 =?utf-8?B?R0hQM3VWR0V4UERyQW1Qb3grNU5pMHl4NnhHeEZDSVlKSnBRbGtlL0pNUjdr?=
 =?utf-8?B?UEJiQnFnZ2FJY2lWamFtUkxDcFJ1WjRGbm1EZUd4UTIvODBnbi9yY3dNZ1No?=
 =?utf-8?B?M0pKaDRWT2FneGRJQWV2UWlTU1k2S1VpKzliRWpYSmcycHo2d3Z6OVpDQ0Jp?=
 =?utf-8?B?aXJQMGQybVBGUk1tVnVNQ0d0UnRvZkNiSzIvd0VDZk1ZU1JGSk1VYlpOa2dN?=
 =?utf-8?B?U1ZtS2R3U2xiUFRIS2ZncnhDQkdQckYzWk9zemNLYlhiL1ppRGVocmh2a2RS?=
 =?utf-8?B?V3FzSFdRNXdRaHBxVTNrNXlzK0pUWjNUN1ZRWTBaZmVaU0hRUjZjOUFkYWVq?=
 =?utf-8?B?YkRwRWhLL2ppN1EvbVJGTUpmMkFtUHpEdHhwa1MwNmJrV0RLQ3B0R2xYb0E4?=
 =?utf-8?B?eGVrZDRGNTRXRFZVUytlNlllb2FyeDBYQU5xQ2x6WUJZZmR3MEJZaVBWdzlF?=
 =?utf-8?B?RTM5ejdKM011ZlMydXNNTndDWU5SRnJqMk9ydHBjazlqNzdhcUVhb0VzQ1dZ?=
 =?utf-8?B?SENvcnlwTFVaN3hmU1Z0Y0cwV2NObW04Rld3Qlg4VG5CUi9OblpYZFMxR2dm?=
 =?utf-8?B?ekRCcWVnd21uRW42WC9UZ1M1RWlubVVMSnIyYmU2c3ZVQkRtRHVZenJISUgr?=
 =?utf-8?B?MTJTeWJ5dVZZdWdZRmliTzFBdnZPK2QrcWJITnE3WXlublNGa1RQTWVDa2M3?=
 =?utf-8?B?dGRyVUhFM1FBQStPN0ZkYnM3RlpyZDI4bUZjRUdkZkwzc0dYdDVNMjhoeUY2?=
 =?utf-8?B?dlM0T3FGR3d2Q2pmSE1pSW9WSVNRSDF5SHhIb0FCRno2TkQ2ZnozNXRzbXQ2?=
 =?utf-8?B?YlpEODBkQkgwR2ZMbUl2cGN1NkZnckd0b25NQnV1cU9LTWxHSXdGU09hRUNM?=
 =?utf-8?B?YldmbVM0ZjBmbTY3cEhKbUZ6WDl2K0Qxc2Y2V3oxT21GWU03QXVQeHplcWVR?=
 =?utf-8?B?Y0xLb0hyV1NscWhyOEFhdGZPei9VY01rbnpvQmFKWklnTUNsSnB5NnhIWHNh?=
 =?utf-8?B?Z2ZUVGR1S0NIS2FWVmVKQ3c3cGpUdncxUnNpandKUXN6R25KSEp6Z08xL3ht?=
 =?utf-8?B?enFpOTM3aTdGZ2pnSUJwU0lwSVpaSXZ6a2xOanNYRzJSUExIV2F5RXhtNWdt?=
 =?utf-8?B?Q1hrU3luamQrU2tFWjhuZWRZZEdIUVZTcTFDTlJNZzg4L1JGSzhyN3BwUGZv?=
 =?utf-8?B?T21XcTY3SjZXeEhFSVF5M1lPZGIxc0w5U3JNYkllZWFRRXVIa2pRdGxJT3Nv?=
 =?utf-8?B?cTRuUTdBNTRDQ3BIVHlobm5LZGIwRldBaWpRRHlrV1hnZXkySHYxQXprbmd5?=
 =?utf-8?B?cFlhd2w2MXdpTU5wZE9Mc2lsUHZiOE9YK1l6bWt6dmZybFYvSklPdXFIY2k4?=
 =?utf-8?B?NWw2YlZNMzh5ZEUzWXJBTDhTeDZTTk0yZTNtZmpDci9CMXdCTGJhdTNvYWdP?=
 =?utf-8?B?QXJDMVQ4NTJNSjVrQ0RuYkxuNXM0YzNkcnZWNG12WE91bXA3cmtYeVYvWTR3?=
 =?utf-8?B?MHRwTG82Q0t0ZmxNdEFqZmZHVTFYUDhpbFcxVTc1YUhhU0dZYmp2dk9pbWFB?=
 =?utf-8?B?cWJxcU5lMG1mVWRpQkliN3pETGNLKzJ0czRRN2RYVTFsYi9BRSswM0JQcXFw?=
 =?utf-8?B?U1pNSjk5RXZpNE5XTFJHLzNWbWVQZkYyVXVUNzNKWE5Db0l1c0pIem1SV1pH?=
 =?utf-8?B?L0lTZGZxczhGbHJPVkFSb0h3aG8vVVFKUmxFTnp2OHh2Zklpci9Ielhsbiti?=
 =?utf-8?B?dWZnNWR4cUNvUzNWV0VXZnI3clRuUEVjaUtoRUNaQ0dqMThrSmlQL3VER0Y2?=
 =?utf-8?B?U0QzVjlBQ3NzS25wcGVkdGMvcHZyMlNGUldqTTd2OWRORnR3dXB4WXU0ZURv?=
 =?utf-8?B?ZGh1b2lTSEhnb0pYSzIrejgvTENzc1RTQ3F3MmxkOXJFNHd3WVB2Zz09?=
X-Exchange-RoutingPolicyChecked: Wn/rvA183UeiTi6OhqYGUzDgm5EX+JW92ZMipENQ700OUrICZ3AJ59Af2L7uGD20NaeyI5/kGqnrgAI6NZ12SYxVPOJn71Az2JyLDv7R19EL4qlSQg4sF7SKRabBPVVH0xbYHin+yrxX4KqLzVG+x4j5kWbw9Duggmx3T9brLPeEwdNY5RdZHSynLsJNV2/QEDfiS+8pN40bGNUwd4IVlkO7e6d317Uq6+qxIkK8Ssbg/2IWe2/lOUde3tsbA9NT00WYw4TpDbivPyveJVh3DtJZuOXpfkSybFl4A4IBLsSoH3SXjAmRSVE84COJ/LB9JUIBfAXQQQoq0DS2OHHLdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 83061d33-be4b-4c68-0c5c-08debb669fd8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 20:37:37.9323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GEZilkFXBHLS2stXdxXA7os4DfNNEfR9xT6GH3rTM/3kiL/jdZ3wpfTXVzCkUOV8elt2C4ADeNrx9OXmwlqsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8894
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

Hi Pranay

On 26-05-2026 11:19 am, Pranay Samala wrote:
> Extend kms_color tests to run across multiple pixel formats at dynamic
> subtest level instead of being limited to single format for gamma/degamma
> and CTM tests.
>
> For platforms where only a single format is relevant (e.g. 10-bit
> paths), limit the iteration accordingly to avoid redundant testing.
>
> This improves coverage for format-dependent pipe color pipeline
> behavior.
>
> v2:
> - Add DRM_FORMAT_P010 format
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_color.c | 225 +++++++++++++++++++++++++++++-----------------
>   1 file changed, 144 insertions(+), 81 deletions(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 565edb2dc..b0adcd221 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -78,6 +78,16 @@
>   
>   IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
>   
> +static const struct {
> +	const char *name;
> +	uint32_t format;
> +} formats[] = {
> +	{ "RGB", DRM_FORMAT_XRGB8888 },
> +	{ "YUYV", DRM_FORMAT_YUYV },
> +	{ "NV12", DRM_FORMAT_NV12 },
> +	{ "P010", DRM_FORMAT_P010 },
> +};
> +
>   static bool test_pipe_degamma(data_t *data,
>   			      igt_plane_t *primary)
>   {
> @@ -104,20 +114,28 @@ static bool test_pipe_degamma(data_t *data,
>   	igt_output_override_mode(output, mode);
>   
>   	/* Create a framebuffer at the size of the output. */
> -	fb_id = igt_create_fb(data->drm_fd,
> -			      mode->hdisplay,
> -			      mode->vdisplay,
> -			      data->drm_format,
> -			      DRM_FORMAT_MOD_LINEAR,
> -			      &fb);
> +	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
> +					   mode->hdisplay,
> +					   mode->vdisplay,
> +					   data->drm_format,
> +					   DRM_FORMAT_MOD_LINEAR,
> +					   IGT_COLOR_YCBCR_BT709,
> +					   IGT_COLOR_YCBCR_FULL_RANGE,

Nothing is mentioned "why" are we doing this change in commit. Please 
update commit.

> +					   &fb,
> +					   0,
> +					   0);
>   	igt_assert(fb_id);
>   
> -	fb_modeset_id = igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      data->drm_format,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb_modeset);
> +	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
> +						   mode->hdisplay,
> +						   mode->vdisplay,
> +						   data->drm_format,
> +						   DRM_FORMAT_MOD_LINEAR,
> +						   IGT_COLOR_YCBCR_BT709,
> +						   IGT_COLOR_YCBCR_FULL_RANGE,
> +						   &fb_modeset,
> +						   0,
> +						   0);
>   	igt_assert(fb_modeset_id);
>   
>   	igt_plane_set_fb(primary, &fb_modeset);
> @@ -191,20 +209,28 @@ static bool test_pipe_gamma(data_t *data,
>   	igt_output_override_mode(output, mode);
>   
>   	/* Create a framebuffer at the size of the output. */
> -	fb_id = igt_create_fb(data->drm_fd,
> -			      mode->hdisplay,
> -			      mode->vdisplay,
> -			      data->drm_format,
> -			      DRM_FORMAT_MOD_LINEAR,
> -			      &fb);
> +	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
> +					   mode->hdisplay,
> +					   mode->vdisplay,
> +					   data->drm_format,
> +					   DRM_FORMAT_MOD_LINEAR,
> +					   IGT_COLOR_YCBCR_BT709,
> +					   IGT_COLOR_YCBCR_FULL_RANGE,
> +					   &fb,
> +					   0,
> +					   0);
>   	igt_assert(fb_id);
>   
> -	fb_modeset_id = igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      data->drm_format,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb_modeset);
> +	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
> +						   mode->hdisplay,
> +						   mode->vdisplay,
> +						   data->drm_format,
> +						   DRM_FORMAT_MOD_LINEAR,
> +						   IGT_COLOR_YCBCR_BT709,
> +						   IGT_COLOR_YCBCR_FULL_RANGE,
> +						   &fb_modeset,
> +						   0,
> +						   0);
>   	igt_assert(fb_modeset_id);
>   
>   	igt_plane_set_fb(primary, &fb_modeset);
> @@ -285,20 +311,28 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   	igt_output_override_mode(output, mode);
>   
>   	/* Create a framebuffer at the size of the output. */
> -	fb_id = igt_create_fb(data->drm_fd,
> -			      mode->hdisplay,
> -			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> -			      DRM_FORMAT_MOD_LINEAR,
> -			      &fb);
> +	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
> +					   mode->hdisplay,
> +					   mode->vdisplay,
> +					   DRM_FORMAT_XRGB8888,
> +					   DRM_FORMAT_MOD_LINEAR,
> +					   IGT_COLOR_YCBCR_BT709,
> +					   IGT_COLOR_YCBCR_FULL_RANGE,
> +					   &fb,
> +					   0,
> +					   0);
>   	igt_assert(fb_id);
>   
> -	fb_modeset_id = igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb_modeset);
> +	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
> +						   mode->hdisplay,
> +						   mode->vdisplay,
> +						   DRM_FORMAT_XRGB8888,
> +						   DRM_FORMAT_MOD_LINEAR,
> +						   IGT_COLOR_YCBCR_BT709,
> +						   IGT_COLOR_YCBCR_FULL_RANGE,
> +						   &fb_modeset,
> +						   0,
> +						   0);
>   	igt_assert(fb_modeset_id);
>   
>   	igt_plane_set_fb(primary, &fb_modeset);
> @@ -520,20 +554,28 @@ static bool test_pipe_ctm(data_t *data,
>   	igt_output_override_mode(output, mode);
>   
>   	/* Create a framebuffer at the size of the output. */
> -	fb_id = igt_create_fb(data->drm_fd,
> -			      mode->hdisplay,
> -			      mode->vdisplay,
> -			      data->drm_format,
> -			      DRM_FORMAT_MOD_LINEAR,
> -			      &fb);
> +	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
> +					   mode->hdisplay,
> +					   mode->vdisplay,
> +					   data->drm_format,
> +					   DRM_FORMAT_MOD_LINEAR,
> +					   IGT_COLOR_YCBCR_BT709,
> +					   IGT_COLOR_YCBCR_FULL_RANGE,
> +					   &fb,
> +					   0,
> +					   0);
>   	igt_assert(fb_id);
>   
> -	fb_modeset_id = igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      data->drm_format,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb_modeset);
> +	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
> +						   mode->hdisplay,
> +						   mode->vdisplay,
> +						   data->drm_format,
> +						   DRM_FORMAT_MOD_LINEAR,
> +						   IGT_COLOR_YCBCR_BT709,
> +						   IGT_COLOR_YCBCR_FULL_RANGE,
> +						   &fb_modeset,
> +						   0,
> +						   0);
>   	igt_assert(fb_modeset_id);
>   	igt_plane_set_fb(primary, &fb_modeset);
>   
> @@ -759,12 +801,23 @@ run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>   	 * for CRC checks with framebuffer references.
>   	 */
>   	data->color_depth = 8;
> -	data->drm_format = DRM_FORMAT_XRGB8888;
>   	data->mode = igt_output_get_mode(data->output);
>   
>   	igt_require(crtc_output_combo_valid(data, crtc));
>   
> -	igt_assert(test_t(data, data->primary));
> +	for (int i = 0; i < ARRAY_SIZE(formats); i++) {
> +		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
> +			      igt_output_name(data->output),
> +			      formats[i].name) {
> +			if (!igt_plane_has_format_mod(data->primary, formats[i].format,
> +						      DRM_FORMAT_MOD_LINEAR))
> +				continue;
> +			igt_info("Running on " IGT_FORMAT_FMT " format\n",
> +				 IGT_FORMAT_ARGS(formats[i].format));
> +			data->drm_format = formats[i].format;
> +			igt_assert(test_t(data, data->primary));
> +		}
> +	}
>   
>   	test_cleanup(data);
>   }
> @@ -784,10 +837,10 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>   		       const double *ctm,
>   		       int iter)
>   {
> -	bool success = false;
> +	bool success;
>   	bool depth_10bit = false;
>   	double delta;
> -	int i;
> +	int i, n_formats;
>   
>   	test_setup(data, crtc);
>   
> @@ -801,7 +854,6 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>   	 */
>   	data->color_depth = depth_10bit ? 10 : 8;
>   	delta = 1.0 / (1 << data->color_depth);
> -	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
>   	data->mode = igt_output_get_mode(data->output);
>   
>   	igt_require(crtc_output_combo_valid(data, crtc));
> @@ -815,24 +867,39 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>   	 * get clamped or rounded values and we also need to account
>   	 * for odd number of items in the LUTs.
>   	 */
> -	for (i = 0; i < iter; i++) {
> -		color_t expected_colors[3] = {
> -			fb_colors[0],
> -			fb_colors[1],
> -			fb_colors[2],
> -		};
> -
> -		transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
> -		transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
> -		transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
> -
> -		if (test_pipe_ctm(data, data->primary, fb_colors,
> -				  expected_colors, ctm)) {
> -			success = true;
> -			break;
> +	n_formats = depth_10bit ? 1 : ARRAY_SIZE(formats);
> +
> +	for (int fi = 0; fi < n_formats; fi++) {
> +		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
> +			      igt_output_name(data->output),
> +			      depth_10bit ? "XRGB2101010" : formats[fi].name) {
> +			success = false;
> +			data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 :
> +							formats[fi].format;
> +
> +			if (!igt_plane_has_format_mod(data->primary, data->drm_format,
> +						      DRM_FORMAT_MOD_LINEAR))
> +				continue;
> +			for (i = 0; i < iter; i++) {
> +				color_t expected_colors[3] = {
> +					fb_colors[0],
> +					fb_colors[1],
> +					fb_colors[2],
> +				};
> +
> +				transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
> +				transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
> +				transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
> +
> +				if (test_pipe_ctm(data, data->primary, fb_colors,
> +						  expected_colors, ctm)) {
> +					success = true;
> +					break;
> +				}
> +			}
> +			igt_assert(success);
>   		}
>   	}
> -	igt_assert(success);
>   
>   	test_cleanup(data);
>   }
> @@ -1126,11 +1193,9 @@ run_tests_for_pipe(data_t *data)
>   		igt_describe_f("%s", gamma_degamma_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
>   			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
> -				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> -					      igt_output_name(data->output))
> -					run_gamma_degamma_tests_for_crtc(data,
> -									 crtc,
> -									 gamma_degamma_tests[i].test_t);
> +				run_gamma_degamma_tests_for_crtc(data,
> +								 crtc,
> +								 gamma_degamma_tests[i].test_t);
>   			}
>   		}
>   	}
> @@ -1139,13 +1204,11 @@ run_tests_for_pipe(data_t *data)
>   		igt_describe_f("%s", ctm_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
>   			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
> -				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> -					      igt_output_name(data->output))
> -					run_ctm_tests_for_crtc(data,
> -							       crtc,
> -							       ctm_tests[i].fb_colors,
> -							       ctm_tests[i].ctm,
> -							       ctm_tests[i].iter);
> +				run_ctm_tests_for_crtc(data,
> +						       crtc,
> +						       ctm_tests[i].fb_colors,
> +						       ctm_tests[i].ctm,
> +						       ctm_tests[i].iter);
>   				if (igt_run_in_simulation())
>   					break;
>   			}
