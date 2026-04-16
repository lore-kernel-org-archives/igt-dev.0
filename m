Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917D9F8A140
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 08:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349AE10E1A9;
	Thu, 16 Apr 2026 08:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBhxgnNH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B547110E1A9
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776328138; x=1807864138;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v0D6oqGYFka8b98AML6Fp6gxkstjquegDI57I+hQ43k=;
 b=PBhxgnNHbnLXSgAbBvyIlRnrXolBIixYDAlYt8AL23ATtMePhPSyKmkx
 7oerBc3UtognE+2ptRLWJY1Uvn86Qogx6PpN6ho2v1feecXp7BN3mSY0a
 /ANUEx8y/lNRqh3iWInLwmLAhrRFgcsplBWHVFeNG/+IgI+Et/D+B++WL
 VY2uTMwLHKQ4kw7gyOmNzvxbYEObn0r/kRx/h7ShwNrZOIOSKBc3mfW+G
 uPwzk/HOn0rSOUO8FhFo41fpt+lECfyWd6H0eByDKQrYV1xdgzAmWum1U
 kPic3+W5KxQbKgkMtHRIvNwYAwlNjMOc8YpXKx+a7wP6t388BNp/Y19Uk A==;
X-CSE-ConnectionGUID: Qdr9vib+RvqG0jyhA0gObg==
X-CSE-MsgGUID: OT4dAkz8Rfu1K5OvioHEiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="87940761"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="87940761"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 01:28:57 -0700
X-CSE-ConnectionGUID: R91M94JFQxGp+NpCJT2MXg==
X-CSE-MsgGUID: 1y7mCes+RdStafSYq0VbIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="253914883"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 01:28:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 01:28:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 01:28:56 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 01:28:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bA6NvSu7osB3rkSCRvC3fX7pGVtWMj62/bDHi6fD/9mGGdQZuqLpV/ei9ZwTPmwtThkjUDmLIscubGYRQII3RtdwLbcvh0pPF2VyMsjJ7CVOQ63RRjWoQjUM/HycNmIoMoSdVrT0rp2WQwjSbbVqR/RTl6OCUfUWdEvP53Qzc9lZ6T8PiiiqSK+E8aHnYk7Gc+1jH+u90an8oXrrS6Ddk4KZNWdL6WpCh8fOPODpzLF/dG7mUdZHDzXAP0jmVjO0JtUtgWR0nFHob+neKA7eFyswVirOrHgBN2N6xS5iEbKaau7cNizbIvqutjE+Zi/B+yPsRKpd1tCjyxajKhTNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNDh4qnckrwhqzGIAH76NXW8KUV5g6VJKJmwDgiHfTI=;
 b=LpVDptZmg3/44M8BfMgKYPhFvc35MdM3lVLJfoO0hoCyAPgPovNxAFauAxa7slqyriW1LcMXKWR5gb6pj84FV2sUU6/T0rb04PRqcnnixbQ4zCFZRr7N7tJnyOS3VxP/X/WerOE6ibf6FZ+AhXg+foVqJrvj0yLIx68iWEjwv0WQOXlK7AwbhFBmoDI4g3fdWAdQ5+ptNszunW1CIcdkaJVUbCTY/yC32SbEwYfL772BjfkXqZNnpwv8+i7BiRNI1uDjxs42A7EgxSzIwwm40414oil2XUPg9SE4YxkHrf21nTuMlP6RsfcB58iSaoOd3S+MVyZ50UqwUYTP/UaYyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by DS0PR11MB8081.namprd11.prod.outlook.com (2603:10b6:8:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 08:28:53 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 08:28:53 +0000
Message-ID: <7763bb8e-d5de-4149-b2ef-699fdde7cf47@intel.com>
Date: Thu, 16 Apr 2026 13:58:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/4] tests/kms_vrr: Avoid unnecessary PSR disable
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <pranay.samala@intel.com>
References: <20260416035333.69004-1-jeevan.b@intel.com>
 <20260416035333.69004-3-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260416035333.69004-3-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0209.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::6) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|DS0PR11MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: afa39244-619b-4c42-8aa1-08de9b923135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: ZY4BMnHp8L13ZKI60Yy0u/4FGMrup3B300wohzDuAN7o3AvyE4wQRiXfd93Isaw47lEYfTNUs7/R+VEuL+LNtNs4qQRppljYnW/8H4DkeHYn40zTXM/hftzyjB0Le80bVOFby/T3Jd2qexg22L13iCjlRIpP9xrFWFQYmDES/YJelUqnHeo9D41NoOhqfAN6aabIEa/+JBJhJfl3oIkGSy9KPp1nH7ZgrKqhxtkH5iZ6c0IR9NfH8z3fNJfB6gda/wYbwSg5GuO97XqmJGkC5qRhwmvOZgCEhXwL+tx34LFysUSSgHK6hHvjFW5jEhnC/BNO7Lm2vrvAdskBGw/0cCiyWE/vfLsA5ZD0+xL9+IPwcxUgSpWIZnKkWpZm4nbrlIdFeE+dqS6aHMti/kpleh5MnEuWGaWaKI2qUTR5jBLlhr7LRuL6KsMUVu3YGQrovoRSBgfdaaV0aIQD47OoIeOIkx7Xt3Ey49qKlbYgK0gBLBJ5a0bSllaNx3Zlee3eU9YDkIC7TjboQBAu4cTT4+bjaYkt83vzc4t3O0xSdHy4YADbRQd7Yp2UmLhVXsglLF44JYIm4gmpo3dBVs7tWzN281GokzvNkt4jVTOzzSymB0SkGbnFNzHQ6QVSkznX2YqJx0hWvnZehsu3f8QwjfuuVuGH3Asp7/eZuNYgsAjuWqGKwR6qO7sCR1Jy9KpwNv8eq8q5t1fH9pfL8od+2zAyShM8/KPdmwSK1OcCM6g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yi9pSWI4UWNwMFRoTG1uYW9oamo5KzhETmxoQjh3ZWtEMUtnZ3pTSE02c3VY?=
 =?utf-8?B?NHRKQTFOOHlKcWlVWERDY2hDdVY0YUxnaEZEV3IyRDRKUysrL2ZRUS80K3hU?=
 =?utf-8?B?dmh3UU9NUkpvL1R1NmJ2N29MNnVObjhRZ0VuTDBPcCs4UHlkSHpaQng5ejBk?=
 =?utf-8?B?QTFtcXBXN0YrU3FZVmIvMlNNVUs5UDNrNVN3QmYxRlowVVJKeWpPRVR6U1BZ?=
 =?utf-8?B?dXJGVXp4LzBoaDQvTktNOGVHS3RsSkJwMWhwbU5pTTB2cXdENVdNaU5ETXZR?=
 =?utf-8?B?MEY4ZC9WQXM5Q3dVK0lCb2lVTG5SVjRSbW1valdIZnFVR0VPZDF5UTdzS3Nl?=
 =?utf-8?B?di9aNmVTeURMYWllUFR5b0JqMFNndmwrNVFIWUFmL2RDeGpwVDZmV0tZc0FN?=
 =?utf-8?B?ODFkT05OYWp3MEV4QS9uU1NrVEp2UzdXdHlTSlB4WlI4MFl5S1hBNmVnRXN6?=
 =?utf-8?B?YlFJODFGRVhVS2pHNHF0VnVVaWpJM216ajUwVjZEeFN0OFoyMDdHSkxaL2s0?=
 =?utf-8?B?aXFVaThFR0dtV3I1T2c1RFRvMFB3N0d5OFhiLzBUdVVSYys3UjB4UDVJNDB5?=
 =?utf-8?B?SmNFU2hFZmZMVDdIbEk2TUg0eGVhbE5ZNi9ubDJrL0dmMHlJMkhLamNzUTFi?=
 =?utf-8?B?VkFZNXB5TGhVcHN5Unc1K3ZwS3YwWjRzWVUxWk82cERSNWY3ZTBtblIwY3Jh?=
 =?utf-8?B?NlFXUGIwL2pEQUpETjRKb1FPcE9RbnNZbER6Y3UvVExOd0k5TFI1eWp5WTB3?=
 =?utf-8?B?NEZTWHpsdWdmekhqLytuZVZ2Y0x1UG9pY05SNURlalYvRVpEVVpkSUZRbFhU?=
 =?utf-8?B?UFJNdlpZMk0zb25TbUF2WVFTS0VhRWhIbTJuL0dWNlJJSHhoNjJRMzh2YkxP?=
 =?utf-8?B?VHZCditzSklYYWVuNmlLNGZGOTRuS0NDUGtMaGFVSXh1alUyV00xSHBrVWVO?=
 =?utf-8?B?Yk1RYzliUEJnTkp1c2NmaGpETEZqSktmN2Z6UVhwTWd3OFlqcDB2SDNIaXBO?=
 =?utf-8?B?RXBIbjBwYm01Yml6ajZSUTErZEhyL0hzOWFUeUhBWGQ2R0VIYWJjTk9zNjB0?=
 =?utf-8?B?Z3QxYTRPaC9wT3hYWHhGZUppS3hsSHJHUkJBS1U2SWc0eGRZT2lWQ2VXY3Ni?=
 =?utf-8?B?bFE2L2xEbnJ3MWlDRFBqcFROUzBhSmNtY1BPR0JlUkhocCthZ1VxQlp6WnBS?=
 =?utf-8?B?YmNZNm9JUksvWTN4QlNrbDJBZmVYV1N6MzF6Rk95Z3BqUk9HTmtWU3RNTzFW?=
 =?utf-8?B?dEdRKzRMUFJPS3VUTE9hQXd1akxDR1hiREppU3VZdXpJZkp0a1B6c2pyT1RE?=
 =?utf-8?B?d1VEdkpnWVA1WXA5dVlyb2g0blJEUzQ3T0xKUXdVdG9VdHk5QWhIVnMreDVW?=
 =?utf-8?B?M3E3aDNVa2tlbThOZ2lpSlkwcGpJUE1oSEFUNDc2M3VNeVRzenp4R09PczNu?=
 =?utf-8?B?YTVPMmMyeW52d1FqMkx5cWRabklFQk5vdFhvV0FYWkhqVlFXOTJzcFZFOG92?=
 =?utf-8?B?Ulk0eUg2SjFrNkl6cTMyOERCVG5UTHRmTjNpQ0g3d1RLWEJFd1NCZ05PN0Z0?=
 =?utf-8?B?Zm45aEFMNU02RHJTT0JlRkgvNk5MS2trdkxpYzVSVGhJZS84Tk1nNHN3a1BL?=
 =?utf-8?B?UmhFc0RRaytweXdxR2xWYWhodjBWN2g1YlJNZVUvMWtRWVRLOUVTN3N6dFJZ?=
 =?utf-8?B?bkd1Y1JqM2hJdlpHSVNscFYzOUlBVmNXclpHZHBRK2dYYjhvNnYrUlVSRGt5?=
 =?utf-8?B?eGlwQS9kcHY3ZnF3Z0NjcHNNQzYzcGV5YWI1MjBJWU9xdTU2K2xtdTNkNkNW?=
 =?utf-8?B?ZThFQ1pIZmN5cUZKeHZJMmdqS21ReTlDQVZzU0pReDQxOXZUclM2bmJaMkpT?=
 =?utf-8?B?NWZxOThHbGRlaTROYnRHTHBsSG1WdWNJbGtBU1MzZWNQMkRUMFNVcy81cjd4?=
 =?utf-8?B?Mnp3TU8xcFNNYTFCbS81NXIwNVlUVlROR0NNZjc0RWEwcW9kWDFremhzc0hY?=
 =?utf-8?B?dEdmaFRpYjZxVmw5dkJmVDhyK2RZSzdYL2t0QVUyUTM5eXUvcENGc0kxazJo?=
 =?utf-8?B?R3NQOFZYM25IZlJURWlmQVhJKzY0ak9zR2oxcnpWYXlqSXlaVlZHd01HSzU0?=
 =?utf-8?B?SkpCcUlSR3hkcDZxZUFNUXRvaG5zem5jUEpUUGRYZVBHUm5Yc25IMWliOHZN?=
 =?utf-8?B?akdFMzRsMm5Jd28rQXd0ZHNXZTFpSXg4K0dKTnZFdEJiVHF1VW1FUTlqT2Nl?=
 =?utf-8?B?UVZIVmxpNTBYdW9pVjAxakszdjRGYWFSNGh6ZVQzYnZzaXJFQXJNVzUraE1W?=
 =?utf-8?B?Y2t4dG10WjFmdGNoZ1NjbTVYYTFMUFZuWXpYYnFHNGx2dXp5a0R0TTMxeUlF?=
 =?utf-8?Q?jSjOHUXQxEFtH7FE=3D?=
X-Exchange-RoutingPolicyChecked: kih4bp+FQpmW4bTOVuh/2loFn3wiDeoNlRJgGI0/9ccsYb6zj57ENt3Qa3SqZgVYimoNpIomK5II8jBNdpBjcupG8RxzHlwTPLYs9zDIaEuwo/Sz1qeZIXZQMJnoHvKX5abKvxnvKFILAjb6wl8m3Dg9jhKwoVAfjNCoF/T7wZIp9MVhL5fwKRirr1AjQgK7+hh57AvG58Kr+MIFK9G5lRnASGQHPGCDi3ZHN4ST8/3CSK+ONYAr4gLi8sxuAm5MVqB58wRg1GOiO7ZLyJxqQ3jc+APtq/IJrcKSoPG8O1vAxT9YEhLmK7JY0Vgd6wKnTTQaTp4dV/j1B1Np1UWRgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: afa39244-619b-4c42-8aa1-08de9b923135
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 08:28:52.9978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcjBDE1WBLcZuKU4IA77mCDj8jT2Me5xtn4OSvSNVd81fpYnDGJyCcOs+qDs2cpM7pCqJTodXbR8OFmUs0aRWKj7xrLF2DpvqXFBPwjaSDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8081
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

Hi Jeevan,

On 4/16/2026 9:23 AM, Jeevan B wrote:
> Use output instead of NULL in PSR helpers so PSR is disabled only
> when supported by the sink, avoiding unnecessary global checks and
> ensuring correct behavior on multi-eDP setups.

Update the rev info

with above changes looks good to me.

>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_vrr.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index ec0692b2f..30bda3244 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -912,9 +912,10 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>   			igt_skip("%s: Aux-less ALPM not enabled, LOBF not supported.\n",
>   				 igt_output_name(output));
>   
> -		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
> -		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
> -			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> +		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, output) ||
> +		    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2, output) ||
> +		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, output))
> +			psr_disable(data->drm_fd, data->debugfs_fd, output);
>   	}
>   
>   	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
