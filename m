Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C391BF55803
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 09:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F80E10E4B0;
	Mon, 20 Apr 2026 09:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6mtHj87";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A145D10E493
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 09:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776678922; x=1808214922;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7/Q8LXtUjd0drZ0006Uql1f3ZcARVWJAakGFi53U1T4=;
 b=Y6mtHj87KdzcqZEcFEmEJbL/vKfpzNWFesW6FPPQWMfGS6vn028gGvnk
 eTkPqXJZfu/YR3fTIFMah686FB9iPnB4Kw76WAOV22VC+erUDGPbAg+b+
 RRkDLCCg0l6qnYi5OjcOu4AOdH6wuETiyTWLLGvRTTosQziTslRw4E4Ud
 uVN/vuXDwUZdZ41oqJGMH+D/FgXWmGmkSFoYDhTXTGqRuWvG7+O3V0jOn
 AGPmnaS/dy3AhuX1srPP/Z7rpZ7VXu8qq8KyPgX2uGEuLhJbzvr+BKljW
 ETFHaUNhR0Rw2WRJfo67NrydAWlhgflwH6tOtaq2XnXzjRQqYbYSdvISx w==;
X-CSE-ConnectionGUID: IGkftbLcSXiQI/BmNw0Lkw==
X-CSE-MsgGUID: gheFuXSoQn+IVrZsmE64VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81198713"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="81198713"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 02:55:22 -0700
X-CSE-ConnectionGUID: hZPr0hg9S1KjVCuuomlomA==
X-CSE-MsgGUID: GqjiLe9BRduigzUiH83o3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="236670715"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 02:55:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 02:55:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 02:55:20 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 02:55:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGBoHpCwocDDGravtHM1epCizN6hqfGlCPMbceiDdsVPEa7IE05lWeWa1puzduQbEWaw8V/3EEByXpkosTMYB1wl/Qibw0ep2fU8qPKM4ZRodqInbUHEiKvNIc3d0R/1xgFxLwgcEX1Gaq2onnib98SY6NR1fRHPvDTn0uXM5wx6tm9EDFi95L0Pj2+H1E4wQUpJHHNJVoygPJ8gYO+F8r0zL6JOITAaxOdAT7KSHuZg4gw4q0Eg02qMLrSYkld8RfggmS1Gvv+gPgfJkN/RIapqIBst37a4Vi40nQtwZMo3BxjHANQZucuPRN7dGUvOIH/pmyjigm7NDJ4niu84rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xcBmSuDXcmexuks9GVC3xQt0CU9lp/wYfNlR8ucK90=;
 b=W7kXBVnYUTUp0ikkArcxNl/f7IXlrEOytmAvtIjxiER08j8QIo0aj6LPIHXJHtkaFC5cydV63UTxVqTjewGvUYa28+3oRcsIGEOD2jR/cdH1T6li+FOGu0aU3dZ4X+fICx7Fh79LwOgIpDFghHcI9Z9eADubdC6vfwigJYzNtXRlisRN3U64BDfWViD4BfuZoQl96ELY9Z5Qd6iIok3yZIdcHl8RNkVDfwCe2IS2FlgMYuu8Ad8THjXwuE8EFvgm6I6LYnywm/zo03E7usTQOaDmHQnRq4QArfhwrBczkR052aS0BMNcfed9Nqt/FqjRMWdNC2reecLwdHCUetWbDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA0PR11MB7282.namprd11.prod.outlook.com (2603:10b6:208:43a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 09:55:13 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 09:55:13 +0000
Message-ID: <ee7327c8-d857-480b-96f1-7b26acbbba22@intel.com>
Date: Mon, 20 Apr 2026 15:25:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_bw: use igt_display_n_crtcs()
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260420080933.2850063-1-jani.nikula@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260420080933.2850063-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA0PR11MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 701b6078-68cf-41d4-53ac-08de9ec2ea4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: KZiEi8RSV1GqZDqzbFa91DQH+gEzltDcoFYOOEBoUMJwfNaoHcYepldxQiTCskKne/IJKWwzoLdoklWdZheccY3znOuKIhBV14+bG/KviAHb7Y2XgCHI6rRyXmpflgZxBSahAMfP0crTg5xNXDMVuiAKzppbHoRvNWqFJypVlxEaMI8ug+Bf9Z1NYUfejefYV6Xg7eCZUk+H46v2KzRJKlzeRU9U18D+bHYrSpRBbRvLmwaGcPqlQhx+6+TL2yzIr0TOWCEyQ/fQZ5oCcD+F5OSWzgnei8mv3cLrIrDBjrZIkNc1yrOITNnD06wICRXpXp9/mi4bN/BpVOgWvF3nao7PP4Vaa8P+rTf+RtUM2OvY27IytsdYpsLFqUldt+mJcrSxPg1o5EM/MG8D2H/7pcmSPOhv6BGvPj9xPodss4VfxnVPa2yQrYP10gYgXldPvyp/81oiH7GO+2dGqlkfyOHZt8HetG5A1mCr40d9fJqVy1HxaLC0Hy9vF6jN0fUnJKZhqlyVi+KOcYhVDfdv3BcrHvnh0gKjxgs7RwOuC1RAfFvyDwGXvGIaMiSwgSHHvozM2DXbmScZQZ2fx8PUmqzwlCmkQ84gaQkwPiW/YY1GRj3+KOdaz7XFwncAAYOVWtXDhQVokKiASuao8g9nmT5PsVW86T7ZuZXXLgcmPvFjt2UsY2L2XGk1vIvT2hMyYP5Chor0mNyOdzmmOZGmBEL81vjHd+gIzFD9f7MesNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXZKdHcrS04vOGsrbzBuT1Z3eWJoUzFoVy9oelczSDhSdzFHNTFQVnBwenc0?=
 =?utf-8?B?TngyZnNOeXYraEhOWnBsZmxBV2UrYXVxSGM5ZisrTmJaREd2QmxWbzFPM1hh?=
 =?utf-8?B?YWs1Wi9wODdEdkNnTlB5MDJHZWJBSUZGQ0d5R2NZYjVIYm80U2U1VkVLUTQv?=
 =?utf-8?B?N1ByZitlQll1bzM5NkZucVdaOThobld0Z0grM0lMc0szdWs5ZG9hMGo5M25k?=
 =?utf-8?B?Z0RZNjZGa0daYU9kSGpsbjZ5bFZ6LzVieFcyb2F6ZVNrOU9QU2xwblJna1Nn?=
 =?utf-8?B?QzlFRVoyZU1CTzVRdmcyN0hGWUE1eElONUlvS2FHN3V6OWxabVhTSi90VlNX?=
 =?utf-8?B?YlhuT3NrNEhvQkFUczN2MnBqbHl6RUF5VXNGRnZQVUlIeGJYa3V3KzZmREFC?=
 =?utf-8?B?ekFOOGY4NVhPN3FtZ1B3dnlkQ0pNTmFnakFvNUxkYlF4Tm5NajgxN2NtcGow?=
 =?utf-8?B?TlFOS0V1NTJpWXJ1akJGa0I0ZTYwdUhaaEZFOG51OFhPUEVlMmNxN01TejR4?=
 =?utf-8?B?RFp2TTh5WmNvNVRpeVVDYVZlZlMzRUQyd3lOSXhPd2hhbkZzQlRUL0N0eGhK?=
 =?utf-8?B?RHVTWlljb0VpaVRkazdIQWFBaWpaMCtMZ2hzckE2ZkswS1hqTDZ0RmFCNjd5?=
 =?utf-8?B?UlY2aDNJNlp3amJUWDM5ejFkWTAwWWFiLzVUR3ZqdURLcG05aGp5Z2pOWUZo?=
 =?utf-8?B?TEk1QzBIU3kvbzR5amFRZkt3VVpTL0hPYlpzQ2hyYjB0L2VUS2xSajl0cVEr?=
 =?utf-8?B?dWNpeHl6ZkswREdJeTgzRi9PNHE4a2NqdkRwZkN3eEk1NGtXSlpyL1UvN1Vz?=
 =?utf-8?B?SFp1VjFGQWU2a2tUVkEyeTFkRjFEUmZIcFhDbUJ3bEorbTVmSm51dkdEcVdj?=
 =?utf-8?B?VWpkcVVsQ2J3dHZhUk1tbnI3eWZDZWlyV3MvUVZ4MDFTV3R6SEZvL2N4S2Y5?=
 =?utf-8?B?WkNLT3JMdDhKMjAzYXVDMHR5Z3VlSlNUOWUvajI4U2VHWWIwQUxkbjY4ZzZB?=
 =?utf-8?B?NTFSZnphNjRwemVLMTNQOFRKR2lIUXRyaUZnWXNlV2dKajFWT3JPVHJKWHh2?=
 =?utf-8?B?TmExK29zaHFlazYxWStrVnJvN3NOSXJIZnhxb2FUbTQ4blhIM0U2eGpYa3V0?=
 =?utf-8?B?VmpQaHArM1h3UWxxOHA0RlNZcTNqdGFiRVFzb0d5aEJCKzlWM3NEbm9sU0NF?=
 =?utf-8?B?cThwMTdrVFdyMGxrOW5yVDFOVndXQ0xYaHBGdGNlTnlGaTQyK2QxSzdiTFYw?=
 =?utf-8?B?UVFiMll5TERIb1Q4dHJJQm1sSitxVUJlVmJHdmJpTnlvRGxOa0YwWXNxTERC?=
 =?utf-8?B?Mlh6MnBLS3h4ekZseFRQTGxRWDdrb1lFZFROUkNQd1pPTXgyaVkzMThRQlBS?=
 =?utf-8?B?STFQbEUrSWlXWVM1eDdpSWd0L1pkUWt2K3N2ajYxRFk3M09IR3BsTlQ2UzYr?=
 =?utf-8?B?S3hiNW9nVlFmYUgzSTBJSERzOFZneWtzalFIRktkOTVsdThack5NTFQwbyt2?=
 =?utf-8?B?RFprVW9TaVgxaWxUU25wWUNReWdtN1FLS3RiZjhxYk8zU2w5S2krdTdnajEx?=
 =?utf-8?B?KzVBVGsrTzNJdzR6RGZqazdacUxJdUdiY1pQNDVtQjRlSVhTVzJVL014a3ZF?=
 =?utf-8?B?V0VKdy9MQXl5b2srV0YyaGgrVEZYYXBWNlhYVzZmTFBSMGpPc2t1c0toRkx5?=
 =?utf-8?B?MzFLa0tnSUlEeTBWZ1UyeEVETTBFTi9ySnFoTG5UNVI5K2VuTlg0d2VUY1Rn?=
 =?utf-8?B?eGhLUHZnMVVUclcvOG1LU3lvOFRLVy94ZUJDY1hTQ2oyRklodC80M1dOSHZh?=
 =?utf-8?B?UXUwRVRraEY2K2sxYTVqZHVMTDVtNTdtUUdsWFN3VEZYdUxVcjJEOC9JM1c0?=
 =?utf-8?B?UWRsVjBreEhzbUNSR1hhNS9zVnZZb3ExRmIyYzVhNmVaRTJHd2VIckFNNmQr?=
 =?utf-8?B?TnZ6N1RTVEJXZVZRaXo3bWE3YzkwdmhtQnZ6QjBqaFVZWFVMWkNMc3pvcHZV?=
 =?utf-8?B?eGNGTzF1bUZUWXdrQTBEekIrYXE1eHd6RWhyYTNCS3BpRnpXUHVUQzFBbGZ2?=
 =?utf-8?B?MUo4RXNUVFNIMHdGMVNkR1BTVjFlaXNBemx4VXRHSSt1ZE5IamgyQzN0em56?=
 =?utf-8?B?TEdTK1VkaVFUNHdGVTZUb3d4byt3YkpSTW1ZUGZmNmxZSmcvNUsvVjgrWDRH?=
 =?utf-8?B?TTZjZXczTHcrYkpVRkhTVjg0K3l6REV3MnA2Sm1xTVRobnVlQTZrRmNwc1Mx?=
 =?utf-8?B?K2NjT1BROFpZT2s0MDd4MUxWWUFEZHU1SU81LzlPQlVpRVkzd25ZNndweXhH?=
 =?utf-8?B?OVpJbS9KTzE1UnkwT3ZtWmFJblczMmZ5aXg5bGtER0JDNW9nVWFxZz09?=
X-Exchange-RoutingPolicyChecked: eCLI0mnIEZkEtgMvBdtLBGSx1DQ1wguvOOOUNjfEtH3tIBg9xe4r51+tJ/K6WdtL7+cCPjXm++TnykXUH2SxRQYzpb8FjanAdq0o/u28wAAcl0aF8N+jH+chX4ox7EttDgB9nrJlYIYv80F12bGOXGtPwde0UkzPVGCgZD/ozBj2vuCG1MnyyElKNglKK4uJJvhpQHhly9uUewqhAcNMIRZKL0CmFXQSswwlGB3RrDA38gUfsBAgNt5ZUMT34wB23QYxgUw50kRvLEBk5CKoQEhk84gRkqHnO0u6eTilGqcU2fvQhdaQNnir48yCbyaPLooauGzcOl+NM9XyTWf3uQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 701b6078-68cf-41d4-53ac-08de9ec2ea4f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 09:55:12.9888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8SrprUjioVaV8ct6furzTlWXuosRYe5m2WuR92TuGI8p2IXNco/QMXJ1h+GARbvKdRfZRVHxTItjB2Dhu3TKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7282
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


On 4/20/2026 1:39 PM, Jani Nikula wrote:
> Now that igt_display_n_crtcs() returns the actual number of CRTCs again,
> use it instead of iterating and counting separately.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_bw.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 4df5c2cee885..00677b4ae765 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -220,16 +220,12 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
>   	igt_output_t *output;
>   	struct igt_fb buffer[IGT_MAX_PIPES];
>   	igt_crc_t zero, captured[IGT_MAX_PIPES];
> -	int i = 0, num_pipes = 0;
> +	int i = 0;
>   	igt_crtc_t *crtc;
>   	int ret;
>   	bool has_supported_mode = false;
>   
> -	/* Cannot use igt_display_n_crtcs() due to fused pipes on i915 where they do
> -	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
> -	for_each_crtc(display, crtc) num_pipes++;
> -
> -	igt_skip_on_f(n_crtcs > num_pipes,
> +	igt_skip_on_f(n_crtcs > igt_display_n_crtcs(display),
>                         "ASIC does not have %d pipes\n", n_crtcs);
>   
>   	test_init(data, physical);
