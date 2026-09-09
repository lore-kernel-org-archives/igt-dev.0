Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F4DC79FAD
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 10:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD9210E169;
	Wed,  9 Sep 2026 10:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzJSy2nP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F83610F0A7
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788949827; x=1820485827;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0BzN2eghIhGLv94DfviJ3jxj10tZVSvWDKEN2GcyWgg=;
 b=gzJSy2nPTO2MOV7pJJod4gLwhRJK3giWGhHEtjljiwUiRqaVTpAz1+fO
 oexH+6e8MrESNQOVxqyzpbYKQ5X256WXS0siF8oqhnC5t6JtZa3Iuic1M
 oYLFV1UAsVeoMZR1caxKIse/hESjO5oFvDgMB3S2Xl+xOHneqZheTgdgz
 YR0Q0Osb92hbOt0U48XqUM8CeOXqNhssCBo22Yvi8HSwraIAxmsQBceAf
 KWMoUqszoNg69VvReNRI49gKT6vOQXHG6nHs+82/jf9PsVjmV3+6r6WEO
 Wh2Pr/bJpiavUs+8VqyuyMejMrA6CVGy7fkH6droTeZO53bamhFedAL0X g==;
X-CSE-ConnectionGUID: tzOka3ZVTvaMRoTyZcIKcQ==
X-CSE-MsgGUID: xcRJnhBwTWi/W8Kf7nCBzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89401662"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89401662"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 03:30:26 -0700
X-CSE-ConnectionGUID: saW+Oi1TSqyToOXe9eBp2w==
X-CSE-MsgGUID: 8rxjtjTsSa+tfy8oHQYJAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="301162145"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 03:30:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 03:30:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 03:30:26 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.13)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 03:30:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSMD2QYeNgL3e61TjzpMNgEWfeIsWVjxDc9B5s8X7vQh/sk53e+lfFl39Mu8O6PqT+ugodb4vSgmeFmFQM9kYTCXiLUqd8rr1SBvIR9MyMOnE/d8MTFutk6XLlW09SY+5hSHYg+n8jWzMfSWjzqYBT7vIf8Uks7aMwuf6A/L8+ZKdYyYod7t/qVGoEC96sUUUpxf0eK0bBFSbsZPXmm2K3aynTzzQ1Yu/W8HHs+TkRKAJ6fNC1sW9mzWtZrKRzTUaFKWIIT5LtCacF+iemLz6gFRm7lID5J3JUhmPltHDTLRjfc6tXAzsG71YJN7qyWU55B8Ja6pA9Dm1ALogSI+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6P50UJxP3E1FGRDuVJCzNJrXxkmGJVH3cQ7NUPDyQ8o=;
 b=IIruHJ+4AUR1pVBZ7ahMBrnDKiZ3puFSMwzc0M/95gLM7G4Z+WnIFgYJOClaNoPzJfOks8O7N/4a65RBJ9iz9+slUiN1YzQ7N0x+Tv4Mgh2DSj/o0VKyYyuXcyba+DCbVcC/Q0SaQUucoguPxiVKJmNfNm8CIUqqr6kQnd/7FB7r40PCeJndFhy9L77jJm0lzH+SbzZGWpmYkA87ljA9KdeuRoAbpG58w2Y2i6nJWnirRaIshJAUzukq5isktROSv1W31D0TxKz6C5fWrRBJcLY5ZmDiwUrh3YEgQqcIxOitOcIh+EhjcW6OU4iSWltBleDzlE9w2Mey2e60kReBHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA1PR11MB9828.namprd11.prod.outlook.com (2603:10b6:806:4d9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 10:30:24 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 10:30:24 +0000
Message-ID: <33d02903-a826-4d66-8847-f2dc4d06ab3d@intel.com>
Date: Wed, 9 Sep 2026 16:00:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v5 7/7]
 tests/chamelium/kms_chamelium_color_pipeline: Fix CRTC naming
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260831192935.463134-1-swati2.sharma@intel.com>
 <20260831192935.463134-8-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260831192935.463134-8-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0101.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::15) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA1PR11MB9828:EE_
X-MS-Office365-Filtering-Correlation-Id: a3231e66-bb38-4db7-87f1-08df0e5d5bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: NPujMl1T/5IIcPzXd62qShFn/WMbiF5CvUJ6bkKoFdy6KuNtcwAVfRl66K4nB+RVLJtyJy75RzHsw3M4b2f0qaecDIt+OvLeWK8JQ/ntDq4Vg9kLCqSRXDd4I8ojW0+Nb8oq0RN25QngptZ1cspRXHeupiwM61tSNAT2Qr9beee61P6dfCScC3NYGb3mx0yFPyt8OAugk2IqCOMG6d7wkKMQHScSdhYKFHyg10EeXShd7LUSO4PB3tQ7WqDtvjOOqfHaHxBOE0oMijKktlmhy2dH6SO/kRLAg0I84PoBYq3BoCahZRuqot6/HpbnbsVxk4vcXfl59t55UFz9dveAVfJ7w/xrWueWsM4SVMOiGkeN3uBdnGa4WhlgBm9IKQPBP1NEBf2Cpt/VflWlgT1KC/WNfI2XE0NOfNdrK+GMQMkyB5rRlhgjaLW/ht8IIXt56VU/vZUMK3PbWRRiOgujeE0UqexXkxfgIw/PQ5gPePiOjX9iys7O6LWJkiyNN6crDKpmTxktwG1QaFUJxbaM1YvJhf6eAzaTCcBh4G7k5k6RfVARUYGOQkM48wwCJMlNl5UlIRoPJLGMqOeAPb2+fgN9UkUJEWP4fPjOMOZOv7XdxNW8lBu0uX8MF9hUAyqLBHgOw+KSnhQgunUy8NA5Ms4CaX+4UtggyDEIT3IJAzg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE1iY0toOVdZU1NQMUJKVERJL2IwcVZTM3lMNXRETzJvY1h4b2xMdWpSVWg1?=
 =?utf-8?B?M3poODloTWMzbHMzMi9tOVU5cGhrK2NOSGFkTnpQVzBhV3NGOTNZWmZPTjFT?=
 =?utf-8?B?dDVjaDlSY2FIQXRTQUNLMWNqT242RDBBYlFnb0NxeSt4T2M5SHNwcjdvWFpS?=
 =?utf-8?B?NDZtMXNUT1pyUUcrcDErdzBMTkFtdmQ1TVNpSXB1S3dVeE9PMnJjTnN2TEk0?=
 =?utf-8?B?WXJqREdVSXJJdElyT2ZvVmNPc0tkTEVDZXh2b2JsYzBUN3pkYTBid0tXT0kx?=
 =?utf-8?B?REcvY1RJSXh1Z016R1hLd2JVQ1F0R1hkMkYvbTU5WDNhZWRycGNMZDBod09P?=
 =?utf-8?B?MkFySTUvVkxkcHB2cG9ydnEzeWhBRE91V0RqcURuSWV0WFFDZElzYlRraGw4?=
 =?utf-8?B?OHdPUkxXbVNTd0Z0djZ2cVM4UlExKzdHc21tNXdnZDgvVXh6UTY0UmFMT0lx?=
 =?utf-8?B?cXdJRWhheGdsOGV2aU1QRnFJYmlvS0tkeFRUYmxCYnFtQXh2N1FNQTJKb0NM?=
 =?utf-8?B?SUlDZzVFVFRrVXlFSlF3cmNFQ1d4Sk01U3VMR0FuUTRRWTczRzJzT1lvMVd2?=
 =?utf-8?B?cTQvTk5JWjlsZlU0M0JMUkZjYSsrb05WY3ViWVNVSWlqTHByLzltb2tpRSty?=
 =?utf-8?B?eWJ0TVB1cTRxZ1FxSmk3R2wraGEzZjFxdGpQMi8vd1F5UWZTbExoTjNvbDVp?=
 =?utf-8?B?L2RNZGV6cExVOWhDTkwyZ1JDbVlFdm00RDdKNndQTUZrL3BGdmhhTGxCK0tz?=
 =?utf-8?B?dkJjdXBGc3hXaDc3Y1k4NEVaUmU2UXNqaDJuS1UvcWxFT2dCZVdrOFdLdzZM?=
 =?utf-8?B?UnMrUE9RUUdMUThQY1VFTlNUclB4MXdsZGpWQU1jSE83TDBLTmFQRU9ZOG5y?=
 =?utf-8?B?V3d3OHVXWTlhQmVlQmt3K3hNTHAwalpkWXZTazM3UVhsS2hMK0w1V1lUcmly?=
 =?utf-8?B?c21EWGp6aE5xblhXTHNEejV2dkhiRnZDUi83K0d1L3Q3V0s1L3FVd3k1dnRZ?=
 =?utf-8?B?RnpQMGVUbVVkY2hCWnVaUmVXcndPcUFETzhTRUUrK1BpWkIwNWRqdThHT1h1?=
 =?utf-8?B?ZStacS94aW0rRW00eTJUU3lKSXZKeitnQXdiRzF4V3JhZ2ZncTd6UUVEY2t6?=
 =?utf-8?B?a3BrRzVtaHdaaGNoaEVVNSs4ZzdlYzhGYm9sckVSMlU2SGFPeUxTQ3RBeE9w?=
 =?utf-8?B?cVhCOTJCWERvNkpTekRkTXNhYlZuQnVOTlZOY25UODJ1THlKR1hkSjRKY3BC?=
 =?utf-8?B?QUh2OFJ0LzZNNmFnTFUrWndPYVpuaVpRK0lUaVorcm5EYjJMQmFZUFJCZ0lv?=
 =?utf-8?B?TjJOQTIvVFVUdnB4UXhhY3BuZlBlQW5UQTFnVjVndGdTVmw4RWYvNGN4V01V?=
 =?utf-8?B?a1pNM2RmOTVXTnlzQThKK056cXdrakFJOVdiaUNtOXJkWVRkM1B1R0lvSlhr?=
 =?utf-8?B?TFFRcGNHbVR1Z2RzN1c3YXMyZVppNFN6Z3RORUh6YnYvQmtOTFBvK0h0MTRH?=
 =?utf-8?B?NmE2OTBLdzdxeFQvZnd4Wm03amdLS1ZmblovR2R6K0NuUHdtUEV5WFJmMHdN?=
 =?utf-8?B?NEVhSmhERjFuTHRRemw3WHR4Y3ZsdnZvTFFNWFJJVWhLTlE2cWpKL2YvT2ZD?=
 =?utf-8?B?OEJhN1k5MUtEMXpYaWhTWGNMdXNmdTBrakZSbDl0VWZpUTZ1bldwR1hQSTZJ?=
 =?utf-8?B?Q0dsYjF5MWVEdXV2NjVxNGJvWmFmaUV0bDQ4dGNrKzJpbFh3cWFKRHZyVlFT?=
 =?utf-8?B?VUM4anc5dmJQeEV2Q0RFc2JlSEQ5aXhnQXVFZ2cwRURmTXAxVHBxdVhuYWhU?=
 =?utf-8?B?N1NUb2RWQWtOdjY5cks3VStUaklGaGRMRjB4Y2JPZDFZZTlFTWwzUm5hampG?=
 =?utf-8?B?dUs4bWtVUG9SVDBlU2ZTTnJTTnBDYnhOdHlTYi9lZU5JdUlCYWtiL0szYzla?=
 =?utf-8?B?MnBvZTdrNU9oa28vM2ZGUjBpcTV5S3N5NHFqWkVpbCtWSm8xM0ZoRW5TTzZp?=
 =?utf-8?B?VXlSUW1Va2F6eTJxR294bUIvcWFpeDVVNHVMYW9uNlp2M01tU0UzN0VwSGJw?=
 =?utf-8?B?RU1iV25RUUViUXczWDNSNHRDTEZkNlJzLy9sNzBRWWlCMEdIVTN2UlZaTkpW?=
 =?utf-8?B?RnR2cVN4RUtoSnBOazF4aXM0SlFGNmdhOTBzR3Y2VmJRSVhQQmNkd1pqaWEv?=
 =?utf-8?B?V09tMldRSWZVSzc4MmJjNmYwQ1dvZkVQOHR3MWxnbEc3UG9EblIxdy9JeVNu?=
 =?utf-8?B?Nm1rWjFkN1lnREFVSi9RdGJsbHJqTGhLNnpLa09hcUNjSlQwWkpHSlVqVmNv?=
 =?utf-8?B?U3hnVnY2blcxRnMyK2VPQTBOMldUekYyL2hGekZKQmQzNXdTMnEwdjhPdkFC?=
 =?utf-8?Q?hz48d8eMU5GzKAE0=3D?=
X-Exchange-RoutingPolicyChecked: kaTs/BZGh8Ewb/q6rJhmned+BkjfbCRyBvcVeav3DaX57Rw7KKFxNlWM6fgh49IDNIRoESoP0mdw1HFT6fRF7e2AHBkGMyHjiNmp2wSTHgV78Vg3/ufe7YSCyPnPmaV16fVNBDrx4o5FVyKLop4adGvBscsdrKKvx5+/pDNL8MVnIZhymYWSxNwpec88yeJvqWY+lgHE8wpOlTfnpEEFG+swy5Tj79cQx9+uWZGIX3Vgpq9HiJwC4JjhQTQejmcTvpwPXQWkyav38XHomI0wkYzZGA5PBYomD8AcBwOIMoG/rBStSBGQWekJlgIhSDc2pPE2ryR8AUY7KY/FXnhqnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a3231e66-bb38-4db7-87f1-08df0e5d5bd8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:30:24.8363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZl0h43wcNReNyDCLZt5+aWXhQvUJ+xX8QYjNmDkIbhLIqGuPfA6F0qZ0GsMh3jQscBl3d/cKCmUGgIyX6muJbK7T+UFIYa/S360BPwksXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9828
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



On 9/1/2026 12:59 AM, Swati Sharma wrote:
> Use igt_crtc_name() instead of kmstest_pipe_name(crtc->pipe).
> 
> Assisted-by: GitHub Copilot
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> ---
>   tests/chamelium/kms_chamelium_color_pipeline.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
> index c69783450..99d3c9719 100644
> --- a/tests/chamelium/kms_chamelium_color_pipeline.c
> +++ b/tests/chamelium/kms_chamelium_color_pipeline.c
> @@ -224,7 +224,7 @@ test_plane_colorops(data_t *data, igt_crtc_t *crtc,
>   		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
>   			continue;
>   
> -		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
> +		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
>   			_test_plane_colorops(data, plane, fb_colors,
>   					     exp_colors, colorops,
>   					     data->ports[port_idx],

