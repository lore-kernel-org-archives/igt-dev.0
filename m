Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487E5C43458
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 05:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8B010E296;
	Thu, 16 Jul 2026 05:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBiwX12P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357E510E296
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 05:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784180806; x=1815716806;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ou7nOO+oiujPafaY6WDPUo8jyZhUghKdifwNzyqf5ac=;
 b=GBiwX12PhBeqyBzjyzjUI5kEP5yUgEidu3iU0RivMZEHsDLwfMMeFQ+m
 0U5TPxd1VH6vSdTTIyEeGFeq842jFF+KIR6T30SUGDCCDJTObAz97D3lI
 SzcMGXfmwLcTjvqR5WxpX/efKQxwayBfPeo6dXRR6xj+WHdy5eZ0xmuAy
 ATjtncI0oqDT2bqdK5+44HSp0DOgca43QIb2vLL05VQNlE4aBMy0rVCE/
 vo9Gat0eQINjxCnL2sT/eVmzzY9z/17iQXnWBGY7CmXTuuHU+ggRHuPne
 50vJzQUYNMOuaQ8v6fVvpOka/YAaflGYlKlfY6jQR3toLMT5o2z4jpGJT g==;
X-CSE-ConnectionGUID: W1HQvXBASAq84o2Mfpg3VQ==
X-CSE-MsgGUID: 9+fG0KfsQuihDHS3e9T8kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84858220"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="84858220"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:46:46 -0700
X-CSE-ConnectionGUID: 3g42oC0bQRaovkUhoo7IRA==
X-CSE-MsgGUID: NF4XEW9USSm3DL8QlWPIOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="254637722"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:46:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 22:46:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 22:46:45 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 22:46:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAjiz44cxZj7x816ff/NvDHrTH/l853A4xjtoWCLhLF+6FExeLZJqwlpFvSMH5k+ROCP0v/qGaBTLz9TNkSkWJ934iC9tck8dcxvfzR1ZcjK32CYMSK0cKWNDB54TKO1Ik2mi26/Z79iQGEG2MApEqbGwiPYWA447b4i8Sk7vKLPago18OuwSjUGluAeI9RMS7nwo+ErASjf+tNqEh1icvmnDG4xB58BAVjACq36poomj07xCFRud/ks8wrNhmuG5F0zkqqyfCQutMNjCExCfRUYbHx6e6MOeD69bLYABSBSsV1SZamqyphCUIiPVwaVQ4J/TKxRdqggGF3vJHiTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RPI9/ekejf1+x5vxA2cXMMpULIcRxTFz+f+2FB0Z4I=;
 b=vU4LJ5Eu1ECaj0vEbVKpxfPxfnEnnpQhWZCJPeRKw5EWndcXDZMCwSNpFwy6onVTgvbFq8jlJQi6VWKAyvNl3ZXffgraP/lWxNVhelfTHmeXWW+5Vhhjzzer9fYG8iC6w+M9NGcDnKvCBwi83ofHA71JUate4oKh7P0f2Exfq4wUflDwPWwqOwdvriGMEMkzJyrKPNabpd7U6Cd8pWQuI5BuT4vJrgXqGUGKwniwsoSGRdRdGQ8D2HoH8WRKSPFhAsFHWJy9AYbAamCP35W9VSyqOglViMwjX9kVuZ8ZY0FJutPfWXAGwgDir8vAVH/pe3W758YjGq4M6y4CShnyzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by BL3PR11MB6434.namprd11.prod.outlook.com (2603:10b6:208:3ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 05:46:38 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 05:46:38 +0000
Message-ID: <08d26309-e0d3-42b7-be02-ad863bcd760a@intel.com>
Date: Thu, 16 Jul 2026 11:16:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 02/16] lib/igt_kms: s/pipe/crtc/
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Mohammed Thasleem <mohammed.thasleem@intel.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
 <20260713085515.463575-3-michal.grzelak@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260713085515.463575-3-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0296.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|BL3PR11MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: f97a1ba3-4e6d-4ef8-861a-08dee2fd9a4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|42112799006|376014|56012099006|5023799004|4143699003|11063799006|3023799007|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: L9sImkQbze918H5X0gmYlWFFY6k5tlA0070wGq+DW1xNiLdAVuVOr9Inps3N2pLQ6x6rIA7eFHna/WpTs8i08FvFDb5MZkD+Hwe0TTqi1lofoobKxX0LZUyjQPSCKAAXXOjGz0UPVEDeliC6Ev+uTmO1byjNKqbEVr0UkSfK5k89FkeOkFJ/lxtEegbY9slke7s4c5FOdhL3aPACfWlROgsCA5dxeKO9rtP8yrter0CHcXghuPq7BLVrih7z7Fm70UAYzu5ySxsgVjWl6mKMOE4hMUAH/V9aVNOHrvw7U40JpDnsaLFGEBo0gu06U5AJ+ymtAUReG00//CxufOUJ07QNeB5yaHIyzquRcV9c6W0O9Sqrhz/mssVRaMiobmhH4DQd3fcqVUpNrT5F0MHpt4e4nV7Eo7q+DnbOpbZ9OxPJB22EHRq4mGQht1e3W6zg4Kfz7eS3DbYqyKMaOCCtGsVX25m1vVtkUOYQik2iyiQ0i8lM7/8cqJ/jGhnQp9U9ivjOZZecaeWV38gLyLk3OMNddv/giA0KboCKDpjPUXOt88zlTCLY5uFCsDGL6k+JNHLyN+ty6bAMKAfc06iY2i4x+8R4xg7hU1W9r6YO+uVxEvcCpMgKVEk5Vq9k8fEAZPWMNPVDEaLg/EfAIS9TLe7SL+DHs0M5ANRttWN1AAo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(42112799006)(376014)(56012099006)(5023799004)(4143699003)(11063799006)(3023799007)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWF6NzVLQUNjYVJRTjN0Y1RVcko3UUxWM0tPMGZpV2UzdW5qZmJxRDEvRjJK?=
 =?utf-8?B?cjZ3aThzL05KbitVWjd1MllEbVNwdDR3VS9Hc1J4RXNVUGpwZVBybzFCcTFR?=
 =?utf-8?B?aGw4d3Nnbjk0N1MvRmNjZXlnL2RoUXZkZHc2T3RMcEoya00yc0tFVjU0V1Z4?=
 =?utf-8?B?ZW4rMStucGFnZ3NOM01BVU1ocW9HcFFHVkhHZkIzaERhMVNMd1J6eXh2K2U5?=
 =?utf-8?B?Z0EzR1Q5SFBmeEZybXlBWHQ3Ym9sL2ZLY2V0NStNTzErK1ZOckY0WUhQUkE3?=
 =?utf-8?B?c1Nvd2x1dnhwRDIyeDBJUk1VYUtVNmxIRHltTmMzOVRaWjJ5R1RrL2gvK0pk?=
 =?utf-8?B?TkF5OUppbGVoRXRzdXdFdjdlLzNMVDlhZUVKTUh3TGJtZ3dYL1Mzd25wcmhp?=
 =?utf-8?B?T09QSzFRRUdTamNVblk4VnBvMTQrTkpDQ0lKd0xMSTk0NmkySkxYV1lDYkZE?=
 =?utf-8?B?THdSOVEvTGZiazh0bm14ZE84YUZVMlhhTnlQS2huT0hwMEo4SVFYd0NNMElU?=
 =?utf-8?B?MzBjZktTSUhwWHlDTCs1RkF5by8xS1I0ckxSWTdnVHY5M3lvckMwZGxCbWFW?=
 =?utf-8?B?V1FoTkhRa0Q0ZWJIcEZVVFQrSEt2RWpwK3JVRDNrbW5zaWM3MVhBVndyM3hV?=
 =?utf-8?B?dVhxZ2pQb3ZaOVE1UnZHVEVyWjdUZzBRRDIxMnNYWkErQlVlY3JEc3lnUy9q?=
 =?utf-8?B?ODBiY2pFTlUyMlFNNmlrNkhUT0s1bng4cmFpR3UwZTh0K3pSY0trVk5Rb1Az?=
 =?utf-8?B?dFlJMVczVTJDV05hQ3Yya21CMlg0SXZhWVdXRU1LdUpwRkVOSEo2S2cyU3hk?=
 =?utf-8?B?MnJUNlU0MFRLRExxWlIrVUsvTHpGSU4vQlY5dGZ4SVFZU044MTdSelYzbGU0?=
 =?utf-8?B?SHJVMFV3b2NyQjNacVdwa1U2RzR2OXFqcHUrRDIxdW1LcG0zREZNU1JJSnhW?=
 =?utf-8?B?eWhVNUNOdm5vT2ozcTJIK2NBZUpaTFNDazJCcXNWcEx0NURFVit4VjR2ak9X?=
 =?utf-8?B?SXhzVDBJMHhTeTQ3Y0ZmZWxVOWhEN1Y5RzlleGJzK0JMSVVqU2Vkb0VyTkhN?=
 =?utf-8?B?RXBkdVNSek1SVkt6TWxuUGpUUUYrNnM1WUQ3SXdlMVMwbmJwenplKytRRTlR?=
 =?utf-8?B?ZktQYXozVER1dmVaQ3ZRVnRJYXBzczdFaC96ajYxNmc0VEZiR2VDcFBrZW5q?=
 =?utf-8?B?bEZSYlRSVUFpQXJWWWo4c3A4SHEzamdoV2Z6VGljYlRPLzhaVGtsY0lYcUNt?=
 =?utf-8?B?QzlUT3JVTWQ4TVFNTjVzQzZzY3FSMHZXL1BlWUZCWTFwQW5MQnE1TGN6bEtL?=
 =?utf-8?B?UW8xWldITWdxZ3ZOSE1BMUVJMlRtSUpJTGRMK1BWYVNxdE1Xb0pyOEZnVnFu?=
 =?utf-8?B?d0JMOEtpdllZUk5od3dPQ2Y0aEc0aXZXVTcxdVhJM0lJeFpIcS83Nk1TTGdx?=
 =?utf-8?B?cFNWd2MvMVdHK2F2MmJJSCtrU2IxL0ZNQk1LNXpXMzlrUUJkVEgzajRMMlRL?=
 =?utf-8?B?Ni9SUWkxcHRGUXZMckI0Qkw4SXRvQ1lpZVJjejNvYnVBRGFnbDVwcjRueG8x?=
 =?utf-8?B?SHpGOG9JT2lQQmRJZ2NlNGViTDVRVkxVVU04UDhtZmFnaXNlUUNHOTNpYjRs?=
 =?utf-8?B?TUdManBrQ2Zqc0V0OWZMMHoyclQzSHdyZmxYdmovanZZeXBsWEltYnFyV21i?=
 =?utf-8?B?VGU4R3FDZ0MrNjNsWkJIZnFpWU9FRTQ3SUJYdStpYjJ4M0tMMGZOTGJEcUkv?=
 =?utf-8?B?and3U0doUGUvVkRpazFZdCszWXBoSFVURkUvMlhreC9GRVNMa0tmTzRXVC8r?=
 =?utf-8?B?bXh5bVlpYlpVUWNGMFM4VVNSVDdJQVMwM1p5U2sxeE9pbi9sMk4xd2lPc1VQ?=
 =?utf-8?B?UXE5SklSWWxOTk93d1NnQ0RqVnRoOEQ1d3FqbElRdmFvcW95aytRQXFyVytV?=
 =?utf-8?B?MUJvMzE1bnArK3lJSUJaeUJCSkJBVlFuaXhuUGJrN1QvWngvWS9PR2ZoTTBn?=
 =?utf-8?B?Rm15bDgxMkg5V0ZvVkVjdmtPMzNRZ05oT1FPWWJnMW5OUFU3SGV4WVBjRWxT?=
 =?utf-8?B?NE50ZGRhTFBxMXhicjh6WGs5MDJzRndlN0hWMStiOTVGYlFNSVFXVDFFaGZF?=
 =?utf-8?B?Vng2Q0swK3h0OElmWU5VVk9MdnI1SmxVUG1yb0ZXdVM3U0lmNC80QmQwdjVY?=
 =?utf-8?B?TWVMQWt6ZUFpanNFVFQxWS90U0pTRlpvNG1zUXN3Qk5BVng1dVBxRUhienQ0?=
 =?utf-8?B?ZERCcFgyNGRFeFVONi9DeXEvL1AreElORk5vZUlmYml4YW04QUZnNDRaSHRm?=
 =?utf-8?B?cnBtaW9XRmppVFN5WFlFWUM1K244c2FRNFRGVzRCVTlTUE53UE9hZz09?=
X-Exchange-RoutingPolicyChecked: GIuDkb51hORn8dsyBZ1ilkfgeNXy7lH9JHw6S5tg9+seuccDg5mW6jGi44BeE9Ht0UA66wKc+ad/jjZ0wDuOw3lPFHab1ygtUtPLQyGjyy7C4feU5zwXbw5zOFQSVgpZ8jDzqrJzKBTPj8wp+eETKkXkEQRb86j9o+lmjG+BmanvaRtx34aj4YkQy85fQEy3hfBcNKmAfxeZYh0hn0aj18dZK0JJG5XpRJguEhbIIKipNUcGZ0dzoOTzgSvFPuvZPmVXA6ntFDWxzWOGDReo+nxMRNOC7LPlB+BUmSuMGCeOtF+KiRoYEu+0gAMeZD56N5TKNw/sM/sjE53epMKyyw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f97a1ba3-4e6d-4ef8-861a-08dee2fd9a4b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 05:46:38.0045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWJJiy8PLAywqraSzkd2/INyB6orPLru7USdfsEyUepazdEnpvxvA/XhLBvEJhgdKDV/kf4GuF4qAPsYTXHnyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6434
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


On 7/13/2026 2:25 PM, Michał Grzelak wrote:
> Refer to crtc instead of pipe.
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_kms.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 521a03c01d..c89aa95c84 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -773,7 +773,7 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
>    *
>    * If you only need to test a single output for each pipe, use
>    * for_each_crtc_with_single_output(), if you only need an
> - * output for a single CRTC, use igt_get_single_output_for_pipe().
> + * output for a single CRTC, use igt_get_single_output_for_crtc().
>    */
>   #define for_each_crtc_with_valid_output(display, crtc, output) \
>   	for ((output) = &(display)->outputs[0], (crtc) = &(display)->crtcs[0]; \
