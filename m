Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A94ECD6E68
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 04:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A44A112623;
	Thu,  4 Jun 2026 04:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqquajQw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1EA112623
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 04:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780549114; x=1812085114;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1+YKwAbgPeph4AazAN+d7c12Ca61v+4q9SnB/l79gag=;
 b=iqquajQwwW3aPFxVboTR66Zo8q3bsNAqEPKCBkqPY5xzxGKt1txGqw+f
 cgE7OjF6HjMzHZpWL85FutSHjXCBhBcrzyRRBE0KMh33xegwNSzMA1Wgd
 4D+HPaUBlT9pL7KSfe/OH9fmh7VvEazZ0Lq2oUxbe4QwU6fKdw4ixkSuD
 z7wjzaR8kiAM4eShw54vtGVP5SAGgIn4Z6GMSWo8Plwd9dJlCvNc/G7JG
 W0/tGoAt+GDHFRNXLKBPBqC+NlX/v3Ss6HvITaMV1Pvs7FrCAR8hBLsbL
 9lsFPSDQfSzNC5tAFD50GchZ03VSrB49lqKk7q5paQo9pqAIpAoxXdtFe A==;
X-CSE-ConnectionGUID: DI1MHqGFRfO+1NgSmUVacg==
X-CSE-MsgGUID: wmCzNF3WQpq2Pxxqtr2r5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92477880"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="92477880"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 21:58:10 -0700
X-CSE-ConnectionGUID: w2/iPcEVTFK43ZouwCRJQw==
X-CSE-MsgGUID: aaNeklMBTxaOSFnifjRDRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="244517417"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 21:58:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 21:58:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 21:58:09 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 21:58:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBgiRRmX5udUe9wWPdc5zRdYqUkgOp2RM+RWs1GtmMu/JgXRPSBuZCa3NTCF4oO7vuNNjaLJqufy3v/5+/oZ5DV4s/q/dsdpIaZ1dbfEnjjVMYikEXwPXg8ERy/YdqJu1R5SDdGqawqEDwsj+Gh8HbVYQ2iqQkTjM384HWvhpPE3QMEpRvW59hjDbhnwzg5HtWPxRVEXN3f5UKCNkVKtYGMtj5xyoW2GcgRlXjlVfbvX93vTWiqA/wY2iSNVLaPAFOundjHdn9DlKRG6q1uOj6tVj+fvBUnBKg/P16EJvTUU2/4Jq4FypKCQfTlTBtjB4HBSh3b5kh7ElxW2rFBIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6iP3WPwpL12Ii4aWSrWP02b77vWHdaSOi1z9yxPnPM=;
 b=ydYf+sLg84/TJwHx8UXtc1vH1Go0EkaqjT6KMECGRC+TZMICmh+ddvismdwIPMtSsnbjIITpMUrVXsd+okKaTHbz5mRyh7oRaUd1CXqtXRVdfty5k2+/x+B/6ZZoTR9tRcs3gNrQMCt/6PWwwq1ApZOl52VtNV51NWFzaUrB40ZWZvuV6ft/dKsPxP/uPWtcDyaLKbmBWt3K6CTovfK+LXSl1XrDLBNuz6PvyBi54J5gupbdgQ1HrPNOOFvQDI8qlitwJxZuaQ4qMGsu5NBKgAZWOyCP0ynmi9GfSnjAUW5ucxtXDAZRwBb8oC4o0thg83R06ubfcl0v0c1k8dl1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB7515.namprd11.prod.outlook.com (2603:10b6:510:278::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Thu, 4 Jun 2026
 04:57:58 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 04:57:58 +0000
Message-ID: <6609110d-fc3e-440b-a8a3-8cfc0de5a5d1@intel.com>
Date: Thu, 4 Jun 2026 10:27:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v7 1/5] tests/intel/kms_dsc: Store valid DSC outputs
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260530193640.2551688-1-swati2.sharma@intel.com>
 <20260530193640.2551688-2-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260530193640.2551688-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0218.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e884902-ad70-4085-7cd6-08dec1f5d8e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|1800799024|376014|22082099003|18002099003|4143699003|56012099006|11063799006|5023799004|3023799007;
X-Microsoft-Antispam-Message-Info: bS33kJ0oGiWxvoVOrz6Kl2gXmGY6+WW5RqXnZMX7iBoWEQcXR/mz8rsOIgetxFYm7ngdJiJycc60j6sQdX41aTIA2YyQl6SWzfbXlsLoPuwTcyHLCTkdnT8QNG5r9hlj0XSSzn53d42/abt69MUROjiMqpOEA2ge4E8Rgr4rNM7AvJiz7USKY7blo/VSCY9nG2YXo9mabf3ja6WM/g6ejswWQ/C7BLwXyj+rCesnTMBfEimjC1oFroY2yRgSx9HavJn0oxFoCR14oE5W/2Mwn9ADXaTiHq3hHrATPNPZCDY/eLSAffreKIcppUlJiB8X4Nz3E/KWfChzD1rP2ACKIjXoKBg9gjrBmW3vfEYQVo9HPppatmZLXj6iSWxMfXfp4jYAyzoXcxUPCY2dDDh4DsjjwG38bskftKJk8D3LCEpeMXe9Qz33adcEC28v6Xyj5ShiIAVU31NpENneJXrHmbqAczBeuIjKMHrn9mYdYEuPJxVI3CRm12XBHTWQOjA1UEZZ3otKXcH7uq0agkpoJGY3TeST/6YG6ALdV6kdMMLRFC94vULcjnse26f5CMwOnqcMFFC9UZKNZwYeGzrhjfsLiNWkj6n4ZGRumB6IofzlgC/1EBiWM7SaXIkFWVvTDzUwOqwMjmdaJfqhjRR3Jc9gzeyT1kUcThPuUQ5xSBX1gpl2hLrSNlsqyA7wVvkY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(5023799004)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUQvZUIwRUJkM1JqVXVZNXpqaVE5TW0vWVVFbEd6V1kzNTE4MnJlK2kvWjkv?=
 =?utf-8?B?VUhGbjRjNlY2NVZFRWVzWXg5bWRIdUNQSGJtMTVqUExyb1RRUVBwNU10RzQ4?=
 =?utf-8?B?eUFkYmJ3cy90K3VMV1VrT0lNazVBV3MyY2JRTENZRUlWeXhXN0FYRFBVOE02?=
 =?utf-8?B?d0hoN1ZTRzFHdHVIekdIckt0dnpzS0VUTk1QbDNMV3J5SWpFQ2ZORDE0eXRQ?=
 =?utf-8?B?eGx4VHJQQ3pWMVZVQTM1ckNwSks0emNTR1NlVWtMSTY4RVZWZ1ZPYlM1a3Vw?=
 =?utf-8?B?TUNmUVhrUDNVMFFKR1p3a1BZd3RJVkJUaGhGL1ZBMUZ6TnJDaFptRGtOcWZK?=
 =?utf-8?B?a25LaFJIZFhmbStoMHFJVnlUZEpRRWlzZ3lzQk50RGhPVFJIZ1JhVFBid3dt?=
 =?utf-8?B?UDR5aEE3eHlieTM4WWhySlIxbXc4OTRROUJNczlqTHM2TkJXSWdaWXBYR1JY?=
 =?utf-8?B?Qjk2MXpEbUd4RmdramUvRHBpeTQ3QkhiYkFqTVRtcFNzcnhZRkhvVmVMRnps?=
 =?utf-8?B?c29EalBhVlRSWCtTbTV5Vy9Fckw1Rk5OK3Zsa1F1cWI5UHdZNmdRTFc2bHdC?=
 =?utf-8?B?RXU4UUdNMnJ3bnFDQzdwRWxkZUVrTzVHVzh6UDBvendwYXpBTVBBTmNUYjJV?=
 =?utf-8?B?UXdzVWNQZG1Hb2ozY05pQzdMZzdqNEtUUm5UUXdtVWdHbDF4bmtZdjE3TDhN?=
 =?utf-8?B?clJyTlNwaGpIWXpMcU1DTEZRWDh4WmQ4dEdCV3huV3dHb3RtZ1MzZUdsTWpN?=
 =?utf-8?B?bTlnTWkrdXNKYWFvTXlTM01MSzZyZE4weG9oN1RPY3hRMXBaelJ4SytweFQz?=
 =?utf-8?B?aldUL1MxVkcyVU9JME1OeGZhamt0SGpOTlIxUzM4aU9UUlYrMFVBaWVObkRE?=
 =?utf-8?B?OHVrelpxeUp0QWlqbWZoZmg3SzhDN1pSaC8wNTJyMG94WnB0SldFWUNEblY0?=
 =?utf-8?B?dm5QcVRtcmxBaUtvS21ZcTkwa3ZBcjJDdmxJWjluYVdwbW1ES1cxem5pOTJr?=
 =?utf-8?B?VVd6Wm41eDh0WHdTaGx0WVdId2N0RmwwZGx1TnFuMzBnVlpYSUZicWsvTHk1?=
 =?utf-8?B?Q0FCSFF5MWtkVElsZUtlVm9HbmdVRDZiVmxLMXMyZExycCsvd2grTzNSMGZ3?=
 =?utf-8?B?Mi93VkdKNDlqNXJkK0VmMVZzQlZLM2NRR1UwWGE1OVR1eFFkZGw2aEErajVi?=
 =?utf-8?B?b0p3SktUZmMxVmx5TEo4NXFsYzZEakpFUVl2bDNmTlYrdnBUQ3NmcWw4ZmZY?=
 =?utf-8?B?VEttbGw3c2hkUmpicndVOHBjMFZkZ0xydkNqTVV1cjJVSzVDWU5HcHRJMUxM?=
 =?utf-8?B?eGU3M1JNL05WS3I0RUlzQW9kVVhnczJBdlZnWk04ZTlZSndYSFUrQkhJQW1Z?=
 =?utf-8?B?dkxHTndvc3ZhQ1lKMXpPT2x5Wm9vL2tGcks2NlNxMHRLSzc4STZ5QU9mcFZw?=
 =?utf-8?B?MDRMTGhqaktYYVhUSCtUT2h6ajluTGk1RXM1RERINURnaVkzRlliRDVnWnZw?=
 =?utf-8?B?S2R2L3ptbXhVc3FYMHRVa2tvSCtVcERlQlZoSXdsdXNUdVN0dW80djFNTDR3?=
 =?utf-8?B?MHJhZXNud2NlOFlETUgvMzVyL2lLR2pVZHE5Mm50a1VpWlE1b0N0UE1ka2Qz?=
 =?utf-8?B?d0c5dlZKOUFZWHg3VHJpV2lsbW5kQ3BBM1VvRDMySzREOHdXa1BOYXNNNUho?=
 =?utf-8?B?VDA1Y1JrRTNUYlhxZGRlMXBUV2NwaThORkUxb2NJYzJsMzZnLzhWYzA4dWkr?=
 =?utf-8?B?eWxrK2lvZFhibFJKZC9MdVowdzZadlZzcThOZ3ZxQ0cyWUdnL1NybXQ4emZX?=
 =?utf-8?B?OVBNZUZxaVUyNkoyVFBrczZ5WG5TVUJLRWcwbnlncU5WQTJqa2RJVGtxeHhI?=
 =?utf-8?B?Wlh3UDVWZG1SZFMvQzh0dUxKeEE3dEFRSldqcVpMa2I5Vjk0eTJVNXhZa2FV?=
 =?utf-8?B?SVB3cFVlS0hpQ0dEdFNiQktMci8xMVlmdGRBUHM3a1RkZ3FSSjdSOFJYYzZo?=
 =?utf-8?B?U2JHSENHMytWMzU1VkYxZGh1ektaSmV0amVTUDdsbC9hUUVMUXd0Yk9yTWNT?=
 =?utf-8?B?NWZXM3pnYTVXeExYTlZsTEV2b0k4cEl4UU42cE94NnQyZk1oM2pqVHlOU1Ri?=
 =?utf-8?B?b2t2UWs2a3ljR3VCWXYwdWI3eWtPMnpVZnZHMTFQV0lud2xoNjlkRkI2VmFW?=
 =?utf-8?B?Y1Y5VEIvaFJHV3I5ZzA3MnlkZGZON05XSFRtU2tidXQzdVF3cUc5am0rL2RS?=
 =?utf-8?B?Q2g4RGF3S2tRc2ZxWCs2SzUyYXM4ekhrbjNPclpDSE0rUjB4SXc5NzU4M0Na?=
 =?utf-8?B?MCs1ekdRa3NLV01jRjFSS0RRNjFreXBzclh5eVJBUjBEVG4zbEtpQT09?=
X-Exchange-RoutingPolicyChecked: lZF/1e7upMvuQI5YoTvpIRA1jkYoNfnQmN1sqhq4IM0U8zVr5MTDTL7Zd1A9wdO7m/kuDh/q6zH1opDwNv4UXdQRpy+aL1Zd2R08I7f8QhO1e1ZdmDlDocmGrXVPOmy4X8W09MEwF2MAQpbjYteSZDA8syP/6Lh88JSGsHMInsiYjcT1TEMFJa9h2RC1r2ROMIVyfCuXUdguk4oJ9D6D5PDSkWeimYsgDn8OUT0xBCOT7/1DpOaoHbLY5Kh5WOkot8ykBShaaZ3hO2vsSfcv4xNAkt5er/udNGmU9BKB2/c/NU4DtymyBlX1lznSzQG4MnaBMob5pWXsdNrfALKhHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e884902-ad70-4085-7cd6-08dec1f5d8e7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 04:57:58.5760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UXxV3sxesxrMmz4MgnahXNTS7W58YkqANpzRikGiRKSdNQYCogqFQLwRATpyD7ItJq8Eyzcm8PS/WVhU/k1Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7515
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

Hi Swati,

On 5/31/2026 1:06 AM, Swati Sharma wrote:
> Instead of repeatedly checking debugfs to determine if a panel
> supports DSC, perform the check once and store valid outputs (those
> that support DSC and meet the required constraints) in an array.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_dsc.c | 71 ++++++++++++++++++++++++-------------------
>   1 file changed, 39 insertions(+), 32 deletions(-)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 4c41c6a3b..093a16151 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -71,12 +71,14 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   
>   typedef struct {
>   	int drm_fd;
> +	int count;
>   	uint32_t devid;
>   	igt_display_t display;
>   	struct igt_fb fb_test_pattern;
>   	enum dsc_output_format output_format;
>   	unsigned int plane_format;
>   	igt_output_t *output;
> +	igt_output_t *valid_output[IGT_MAX_PIPES];
>   	int input_bpc;
>   	int disp_ver;
>   	igt_crtc_t *crtc;
> @@ -254,7 +256,6 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		     enum dsc_output_format output_format)
>   {
>   	igt_display_t *display = &data->display;
> -	igt_output_t *output;
>   	igt_crtc_t *crtc;
>   	char name[3][LEN] = {
>   				{0},
> @@ -262,47 +263,44 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   				{0},
>   			    };
>   
> +	igt_require_f(data->count > 0, "No valid output found, either sink doesn't support dsc or min 8bpc\n");
>   	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>   
> -	for_each_crtc_with_valid_output(display, crtc, output) {
> -		data->output_format = output_format;
> -		data->plane_format = plane_format;
> -		data->input_bpc = bpc;
> -		data->output = output;
> -		data->crtc = crtc;
> -
> -		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
> -		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
> -			continue;
> +	for_each_crtc(display, crtc) {
> +		for (int i = 0; i < data->count; i++) {
> +			data->output_format = output_format;
> +			data->plane_format = plane_format;
> +			data->input_bpc = bpc;
> +			data->output = data->valid_output[i];
> +			data->crtc = crtc;
>   
> -		if (igt_get_output_max_bpc(output) < MIN_DSC_BPC) {
> -			igt_info("Output %s doesn't support min %d-bpc\n", igt_output_name(data->output), MIN_DSC_BPC);
> -			continue;
> -		}
> +			if (!check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
> +				continue;
>   
> -		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
> -		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
> +			if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
> +			    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
>   						     data->output, data->output_format)))
> -			continue;
> +				continue;
>   
> -		if ((test_type & TEST_DSC_FRACTIONAL_BPP) &&
> -		    (!is_dsc_fractional_bpp_supported(data->disp_ver,
> +			if ((test_type & TEST_DSC_FRACTIONAL_BPP) &&
> +			    (!is_dsc_fractional_bpp_supported(data->disp_ver,
>   						      data->drm_fd, data->output)))
> -			continue;
> +				continue;
>   
> -		if (test_type & TEST_DSC_OUTPUT_FORMAT)
> -			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
> -		if (test_type & TEST_DSC_FORMAT)
> -			snprintf(&name[1][0], LEN, "-%s", igt_format_str(data->plane_format));
> -		if (test_type & TEST_DSC_BPC)
> -			snprintf(&name[2][0], LEN, "-%dbpc", data->input_bpc);
> +			if (test_type & TEST_DSC_OUTPUT_FORMAT)
> +				snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
> +			if (test_type & TEST_DSC_FORMAT)
> +				snprintf(&name[1][0], LEN, "-%s", igt_format_str(data->plane_format));
> +			if (test_type & TEST_DSC_BPC)
> +				snprintf(&name[2][0], LEN, "-%dbpc", data->input_bpc);
>   
> -		igt_dynamic_f("pipe-%s-%s%s%s%s",  igt_crtc_name(data->crtc), data->output->name,
> -			      &name[0][0], &name[1][0], &name[2][0])
> -			update_display(data, test_type);
> +			igt_dynamic_f("pipe-%s-%s%s%s%s", igt_crtc_name(data->crtc), data->output->name,
> +				      &name[0][0], &name[1][0], &name[2][0])
> +				update_display(data, test_type);
>   
> -		if (data->limited)
> -			break;
> +			if (data->limited)
> +				break;
> +		}
>   	}
>   }
>   
> @@ -328,15 +326,24 @@ data_t data = {};
>   
>   int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   {
> +	igt_output_t *output;
> +
>   	igt_fixture() {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		data.devid = intel_get_drm_devid(data.drm_fd);
>   		data.disp_ver = intel_display_ver(data.devid);
> +		data.count = 0;
>   		kmstest_set_vt_graphics_mode();
>   		igt_install_exit_handler(kms_dsc_exit_handler);
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
>   		igt_require(is_dsc_supported_by_source(data.drm_fd));
> +
> +		for_each_connected_output(&data.display, output) {
> +			if (is_dsc_supported_by_sink(data.drm_fd, output) &&
> +			    igt_get_output_max_bpc(output) >= MIN_DSC_BPC)
> +				data.valid_output[data.count++] = output;
> +		}
>   	}
>   
>   	igt_describe("Tests basic display stream compression functionality if supported "
