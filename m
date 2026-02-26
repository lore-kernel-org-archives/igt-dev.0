Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDDAFC5937
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 12:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C16D10E907;
	Thu, 26 Feb 2026 12:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTZ/c6Li";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E2710E907
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 12:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772107764; x=1803643764;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=whs9nJsJXDp4M7aKtrHtT+wUJ014tinGPEmqfXmmHF0=;
 b=dTZ/c6LiAw3xTGViMPagqJzN6MEYfz1Vlz2IewYo+6yRpAybzeFHiFrR
 f4i23ZLcue7kmbbAMGnxmKK4vTetblohCwgAvseK6elO2cKEpm+zIxmdr
 yvGIV9KHodZkCN1sBb7nhp8N1xJlwrlSCRv5Z8HDiyT7deS95sG+A763N
 v4o6+is5cNnmnFL+KFARtMCswGWO9TbVR+QHNN2Nl2mQqNwPyOgN5JvYK
 hRpPs1nqPJm2QzfOyHLMNewm8rG6KV3wtfOhBWPc6ZLF49bDknWBOcEY+
 s4fNsSLKrHH0ALxpeXeaIbDogrx04wCYJbPvIx5mfYwbGSh/V7ThaCiIW A==;
X-CSE-ConnectionGUID: l4QIo0JBT6uOdHtCFqQSJg==
X-CSE-MsgGUID: fxLmD7/+S52Tw/YQl8l2Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="98635869"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="98635869"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:09:24 -0800
X-CSE-ConnectionGUID: 4glL9YCjSOuefL+hU2GwBQ==
X-CSE-MsgGUID: sMF4QhfFSA+IJIrpRwpoGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221163581"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:09:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 04:09:23 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 04:09:23 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 04:09:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3nQkIFCU/RuZuS31qAyc8WcrFy7rfuqkRx2oK4NmvAcvca3OKaVnDfsIS7aXNulI9N+ZT1QQ9bc5HxsuCssBccfWpzSNYdnJ+tP+Zj1JNk9S7MRUU9EegqSdMAhotG9QZuJcQHe4E94/nF04EaX1iM6ud/l0WFLYKva96WLFpBP/dqrG30yjrJ2F98NA5kQivpIOywbQnRV6c+8xNF6ifRaNuqTFiAQMNca+58cjDWnAmfRVkiP6xCF2X+04UVEJfLNIyoKqsM51mU8AezRFcEHorMa3lOjnX5dFbxgYpCFT6XDbxpgEoNBy8h+uyi4215b/pX2ykANL8fNZeVRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sv2jJxKAqZQVL6LGJmQogrHnZZMnhyIYU9m2ygOzzvY=;
 b=WWdrdkH3yuOXM3R/YbqvDelYbGNiX4fePKFFNcF0n4AUtIIdvxCKZ1V/3aoxJ/rNP7hLiGnlC7O1+DBfCzuQcjYsau+82J40UUl16enGMM9S3cyc9P0igKTAZvo/OoY9sIfv+YWjODbP2Nvu+e66EgpCgo2qOWNHCU9OFFME2fsATJqE4HmuMP0+fkbuvWf0ixpzHBokk9osWqutabop58bZSFNS38KbwpWOF6ejyjpKHYr7J4fQiCoPc7DtesG/ItTUjl5H8Fr3LRa/+3ilwkqK2yBvY6le7vfvRp8zWPByo+6JePiSsVc8FcmwrGWUgxKIiuE7UutvswyolO/88Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH0PR11MB5205.namprd11.prod.outlook.com (2603:10b6:510:3d::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.11; Thu, 26 Feb 2026 12:09:21 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 12:09:21 +0000
Message-ID: <c6a64d29-5b5a-4f25-8afd-d7d5a326dcde@intel.com>
Date: Thu, 26 Feb 2026 17:39:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: Add helper to get non-joiner mode
To: <igt-dev@lists.freedesktop.org>
References: <20260223093443.1797078-1-pranay.samala@intel.com>
 <20260223093443.1797078-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260223093443.1797078-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0218.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::13) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH0PR11MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: 3afeea8d-f7d4-4b37-f573-08de752fdf76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: wAWans4D3kTknJkqJpL6ULniBgJGzGxRSxAVyPHKObRYbpZDLr2CLq4AZijy67zzUbtBqBmcRUJ1KvkKnKGCmCQ3VJNn8MQsXXki1XAXtsB0rQ9jHKwSjAhpq9ItUoTQzQN+u+N/jrkAbKWTOK4pdGNrGg6YRe2O5wV0LIa7i0Mgb+CDvFiymTrAU88JDG4EJokYsuNO2j4kF+zSZ9XewHEAAczuMQFe7IQNqCXNx2hczDLqUhrm2h6IvLjPzM1rs0PkxisK9Vxhf5zIJN0H3/YMXimV6MYge6Zwvcua352f9LOxsorAfBXbTW0PJ7OZUzgpQCBi53R9Xe1eAOiBkrFHevhHXg7XKx7Pdl9dWxveeEVgGlhR8sdDMqiE0M2zyODe/lIdYHJWdpItYHrPDIMxJMSPEaew8PHwiZiYFfgm/ewxG/CnLMD4aSME00k5QstLeU8U7DlwbBNs8+iUqnTrOehhRTkId+V7C+1MQ2wn72ienq93WPr8dyRTQ3hacOX2ZwCdC8x0SQYb1pSHdiyINNe6h81+CLCe7aTr9S9J0m93N+OPQmCStx2/W/qT+1OeYr1oXYD+sQrOl4b2/GyoRZwwcT6Y813zC0ZN5aB0I2LAXwGhe8bgSH4hYtctrQfFnHWylw8RYRxapyw/+wuUTJCvl0Khcff1+xn/qhYsLUyqtNxm8bKFYiNg/E+5FplScecFD/hOX2CfmMGu2k4IAfoUynPfe0ATEb8iyno=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wlp4TGpKQUUzWGNBVGJvNWp3VDRkM1lUSVRmTncwNjlFTmtGOGd1dGpxNGVl?=
 =?utf-8?B?MXlld2MyaHhpeFFZYTZWb0E0Sm1UTWJmcEFEZE1wdWQ1a3RkcXNBSGR3eGhG?=
 =?utf-8?B?cmgyMlBNZm1zbWlVSHRHUXVVelg0SVljbThaZHFLaWxkZ3BMVHZYUDlsZ2dj?=
 =?utf-8?B?N0kvdXRRTDk2MGdnbHdoV096cHltbFVHSVNMLy9iSVh3YXc5cDY4aGhSUzQy?=
 =?utf-8?B?TnA2L2JIbWZ3UGNUQytFWDB1cWtaZFN5U3NvbkJDVEhjY1pURjlZVkcrTE4y?=
 =?utf-8?B?Y29TRmgwdnBDaXkxS1dYY01LbC9leW9kMkhsaXZSVVppZEg0SFBuK2E1aTk1?=
 =?utf-8?B?aXlMSitJTG85YlBXMDZucDY3NFByOGJSeng5b3IwT0gwSjJTV3dsakFJSndX?=
 =?utf-8?B?V09VcEZJaFB4SDlvMFc0K1pPRVVtSE5TT0I2d0IzcURLSUJiQzlQajZQN0ts?=
 =?utf-8?B?YkFQQURsLzVCVW9UY1lLL01FWmxuaGZaaVlrdlhsQnkwN1FBdjBPQzFuc2RP?=
 =?utf-8?B?QVB2WlZUR1Bxbk93ejVYSTZmTnFLZnJTQnUwVWdUQURnYnNEV0hKMXNza1lK?=
 =?utf-8?B?L2NDMVpFMzZUOHFLV05Yd28wck1qQm9CeVVXYnBJbzFadEptS0NkSjlLR3Bi?=
 =?utf-8?B?a1drampTNWtCRmJLcjZPVDR5d21XTXhzcGU3WUZkV3BWY0w0UTMxZzZ5enVQ?=
 =?utf-8?B?YlpiejFNZ0dPVkcrS3NkaFoxMEd0bVNPWndRUTVQMDB6Z3N2Y2MxYWpmRDZC?=
 =?utf-8?B?alVvSUFQays2R2lGRTlOTyt5V3RUTVBEM0JKMHFJZEN3cU5NK2MraVIyOEhG?=
 =?utf-8?B?MkNJVmRZa2dMZUR2WUJlblNrcmlLRDdKQ0dFRHI0bUF1cHB0dFo2SnZZR29o?=
 =?utf-8?B?UW1MZVQ2TUxMdXZnTEU4V0xnTUJ1elMzMkx3c29iYzhSY3hYSWRTQ2c5N2ZB?=
 =?utf-8?B?cEl4ZEFrYjhUR0FsRDFOZ3MyVjd3d01oWVJoeUxrb1Z4eEZqZ2JmTUJMbEVy?=
 =?utf-8?B?WnowOWNLRk9JT2VNcFFpVXh5ekVTTkZhREJaR0lRNzRDRmJqa1BzMnJRUXFj?=
 =?utf-8?B?V2RmaWVXV1RzTGs3RWwyUlFRbk0yQldiZktlWHVvR3BEZUM3NHVIdkZuZzVN?=
 =?utf-8?B?c29yVVdwWWljNlg4UXFCWEZFZEo2MnNxL3N5dGxicDZ3Ym9nOVZKKzVoZkRX?=
 =?utf-8?B?VFdlSnBLNVMxRTdtR1o2NW9Id0xEcjd4Zmg1bzNKVDNrTVh1dGhBOVkvL2hi?=
 =?utf-8?B?aEpRTnhVbzZHOHVLWE54YXFaMEk1NFd6RmlJbmFzSjMwcC9IODEwQW15QjVI?=
 =?utf-8?B?OHBBczN6SVNoU1czc3B6azNvanZRYUhISDdoWXdyQ2lhVWRVMVc1aTBYeEdn?=
 =?utf-8?B?Q2dmelhGVkpPaXBlbmVHc041aCsyVzVjajZxTkNLOVF2RWUzcGlYYUs3Y3Rs?=
 =?utf-8?B?em1yTS9ZalhqWGE2d2hqeU5ONkdFeHF4TjIzWHZrZC80dmY5UDZOcXBBamx6?=
 =?utf-8?B?cWFBRjZXRmVSTzhSelo4ekJabDE0MTFzNk04cDF1Sk9aYjVwZmlObG5Ebmtw?=
 =?utf-8?B?VFZSYmZwbmcrb3FhWTRQVTJVTGpJQXFWOVBEUGQ0b0UrbWhWVWxiNXZLZTNN?=
 =?utf-8?B?MFR6VmYyUFBYaC9tRW52eW5QUnB0UFBQY0M2cHVTN1JFdUVMWVVQdk1rd01D?=
 =?utf-8?B?Q2RXSDF3aXl4V1VUVzgvNFJuMU8ySmE5M1lROXJpekthOFBiNm81UFQwNHFB?=
 =?utf-8?B?U0JsR3VIamZSZXg5SWFCazBORGRnN0ZrekJQb2lST29wYjRxNFphUHY0bU9G?=
 =?utf-8?B?V3JJelhQY2F6c3FjWXFYckFtTGExQWdSKzB4dXV5eFJVMlFNcG5GL3lxbGR1?=
 =?utf-8?B?dXlKeFU1R2NXSDZCZEhackZqL1pjTFlaTXNqazBQWVJhNkc4YkYwczFLTjgx?=
 =?utf-8?B?U3AyaGRmVjVoSWJrSWpFM2dtb2VrWXUyTEdJczZUTWo1OXdMUVA4bThtaFRB?=
 =?utf-8?B?NXlXa3JOeC9LTmFBYjVTOVJMNlhhZ3YwYjkzaFF2Q21UbUc4SzRvZDNKTDg0?=
 =?utf-8?B?THJVbkFqMmRrZEQvdk5QNUFKMENrNlBuUkIyRzJwQ3ZnK2tqY0lPemVER2Er?=
 =?utf-8?B?eU5ZKzBEVkRrTTJZRXZYd1NjT0FJTDFrSFF3emlweWw3eENlUm1ORExpZFpI?=
 =?utf-8?B?b1Fzcnp6eTVRek1QSlNzQitLaFhkMGpvOElXME11cVk3M3poQTVvZHFVNGlO?=
 =?utf-8?B?Z25oZGRVa1hLTmNCc2dpOFVQeUVXWVUwL011Rjg2Vm03MWtOeGpIamM2ZktP?=
 =?utf-8?B?TlhncDk2S0pJWXFPQVdYZHlpUmNMMUVnQndkMWJKc1dFbXFqdHRlTHZnaVlE?=
 =?utf-8?Q?510dBePdLnOXbWyKgwEuNSDMAaLholLTfKFwj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afeea8d-f7d4-4b37-f573-08de752fdf76
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 12:09:21.0126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B00QBUOT+14LcupKetEIOhZQ+DKPvwc6rBuO3yY4YLrUyfSBJ7DV1Jl48D6fL6wrqbe9thN8PX0eZOsnGqxa3kt01lz3c9GTN4YNPtaHPYo9lp0VzPTIR/uadDi7vtwR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5205
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

On 23-02-2026 15:04, Pranay Samala wrote:
> Add igt_get_non_joiner_mode() helper function to find a suitable
> display mode from an output that does not require Big Joiner or
> Ultra Joiner support. This is useful for tests that want to avoid
> joiner modes and use a single pipe configuration.
> 
> The function returns a pointer to the mode if found, or NULL if
> all modes require joiner support.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   lib/igt_kms.c | 31 +++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 32 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5c4879604..107db512d 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6997,6 +6997,37 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	return found;
>   }
>   
> +/**
> + * igt_get_non_joiner_mode:
> + * @drm_fd: drm file descriptor
> + * @output: pointer to the output structure
> + *
> + * Finds the display mode from the output that does not require
> + * Big Joiner or Ultra Joiner.
> + *
> + * Returns: Pointer to non-joiner mode, or NULL if not found.
> + */
> +drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output)
> +{
> +	drmModeConnector *connector;
> +	int max_dotclock;
> +
> +	connector = output->config.connector;
> +	max_dotclock = igt_get_max_dotclock(drm_fd);
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *current_mode = &connector->modes[i];
> +
> +		/* Check if mode requires joiner */
> +		if (!igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock) &&
> +		    !igt_ultrajoiner_possible(drm_fd, current_mode, max_dotclock)) {
> +			return current_mode;
> +		}
Consider moving this to a function mode_nees_joiner() or something,
Otherwise LGTM.
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> +	}
> +
> +	return NULL;
> +}
> +
>   /**
>    * is_joiner_mode:
>    * @drm_fd: drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index dedc3f880..9a95e8e0a 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1285,6 +1285,7 @@ bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe);
>   bool igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int max_dotclock);
>   bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
> +drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output);
>   bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
>   bool is_joiner_mode(int drm_fd, igt_output_t *output);
>   bool igt_check_force_joiner_status(int drmfd, char *connector_name);

