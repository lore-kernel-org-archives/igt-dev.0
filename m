Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2879CD4851
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 07:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE3A10E054;
	Thu, 14 May 2026 07:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zw8G9a5n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B1410E054
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 07:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778745181; x=1810281181;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kR2XxSyNl5Ac+c7a2L9l0I8oeKrGmHpbEA/oMej5s2Y=;
 b=Zw8G9a5nawFctABU60vc5H6t4emsNIHR+0snFQISq9IVpAeGDf0OTN4e
 FB8NFUUmu0wkNhcyjN7AhkZp4LpM2lVOG+wLlSeWhTlgd0S8bWbcM74Wx
 DFCAT/YK70KVX1Hdh3tuZTYj0mSazfKbSpvvdvlZPMDtK2UYsaAOozjrK
 oR5twSN/8VK9I8IDucaew41vmZuNJ0HFQWHGFw3/b3lpKMTY/X5iRTdJn
 5YnLAoQwcjCUWhf4qRZtoFUZNMsegPC6toIgvSouTl1P8AUgRA0lsosoI
 ezwYPwmLgwd3syh5rmdFr/6VXxBj+8enU57MhGxCjLacVqDpuamcouox7 Q==;
X-CSE-ConnectionGUID: TRLDpipQRae8NwhcvS7C1Q==
X-CSE-MsgGUID: K454fVNiTc2Xd9OlItkvsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79717513"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="79717513"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 00:53:01 -0700
X-CSE-ConnectionGUID: ZPdHDA9vRPCI2pzfsegLGQ==
X-CSE-MsgGUID: Yg2vJyN3ThW+SioR4LVEqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="235256911"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 00:53:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 00:53:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 00:53:00 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 00:52:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VP52EfBq399kSUULbHKDMKwsUGxTtJZYHmdZo0Sq7fairk39yccCwvJJX5JsIcSB/I+1N8AWUXThOSPJOytFWj3acyeN1cFKUOQnwTQq663jwkt9BoKNJnpY+s+gt0oN7aYx8MWE7CdTVSdRB2KbXfWeddkqltYLRfLIGDmiQ+TNS9H816oove6wa+M6FsZF5aUVfft/FvFYG43CxsmSJ84zqtL4Xz4vkWjsbBP4gg2WG97AfEthxvacrJkwolZVJAo8f5TPJ8e6Ia9CzegvCFmey+glI2wWIttrx/YsLvo5ixqHAf5BvwmBLdGyIB931wcCsioyCaddtRJxpksPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xi/fUf0LyAlnG+Fz1d9Lr8fvpvkQou26Bk0FVI71V9c=;
 b=UzuoeF4yJbKsCkD8+Kbksh4Q8DzvjRXcoQ6QdHMxFOhZgxgiZcik3UFAMTQ4mNPywfbdb//GGIFAVpg5lLiio8jX/rwuE7NUxyjc420JO8T7wqZnd+E9dSlhsGpwrD0yRPs8QULLHDVsApmSKr88LWDpKGeK789NQqVfQwg4IXiLXGw1nh4alusT23Hg4ypd64bG3ow7wjHmgdhlnneYjVGbETF7v4bXntrVg2p8RDutGY/OxULtCdRiZFllG3CNry/CcfeigdIlcviX4zt2GOOS3WWh3hFWn3kDX8Tl2ShdINfXs3AOy4th2Ca9XB5zb3SCQoIgbdQpuIoW8kH3FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA3PR11MB9087.namprd11.prod.outlook.com (2603:10b6:208:57f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 07:52:56 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 07:52:56 +0000
Message-ID: <63f61029-9805-496e-bbff-316ffa754d7f@intel.com>
Date: Thu, 14 May 2026 13:22:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_dsc: Sort modes by clock to pick
 highest bandwidth mode
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260513201224.2421654-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260513201224.2421654-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::13) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA3PR11MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7d8463-d1bd-4721-e834-08deb18dcf5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|3023799003|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Rm62TV69MlrRLr6cltfIVUCUcYk4fYXA+fXgG/sDFSOVYXLdC+B8Uwbhlg951yGnrRb1bujBZtei4dzeTJm39rVb3ACe4T3ptVXdxHvsxsqp+JKl8dr/I13R9CYQ2qa2OzpoJ7jttpySDl2Fqx95BQT4pdVENdzsulA6m5JpwkBoWqQD9DF1vntA5nNs7Y+VHAGWB3F0S+3vFYheiuPeIJALZQUcB8mE5bWMhFGWIH/fGoDPg52pbJ0p493eci7lptOyBDfAOGrwlQX/1HCX7pnfd9ERDR6OOaRFIfYkBdtBtWq9tXWpsOFCIjkXUpVeXXk+BCOP62ee+D8l6Wrf29zKToMVLMU0duRamda7h+n5tejbFOEiMMkHlHjqvcCIbHjEvSnW99dct3I33NDGqU+tMtWc38cJcUP04v5juyv4C8DrMLjMbJnaQeJ7Uy9pL4pvzhYLymshXB2s+NeAwViTYsMrHoKNqB9UgtRMulx+hns3u/wzNaUmKS3+5VM0ua6WBFApxC5jD0ouTMinfROrX8BhNYqPoYXS2+V4iMyY5HlgqEzdzh+hL82b7DCFsWueBqpMQhM5O6O9JJRWHcIHIhqx+m67VtT8P5DQouyhiUN2uFVhbV/qYA2djG8mhJEn2COYzSlOHLmOGPR7LQvUYz5qyP5JbosNNoxU9ulzIpCBbbiDIEbNJIouGFgl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(3023799003)(11063799003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHJqN0NST0s0R01EOWM4cHNKWEwzMmR6QTZoRXNVWkwzTEpTaDNzUzcyMERa?=
 =?utf-8?B?QkF6VXpna1lSTXpNWVhyUi9reDdSbjlSY051TjF2NmRFdnVqeEVzWkRPLzJr?=
 =?utf-8?B?NWtlK0JRd05CaU9adkZUQnVmU1FXOWlCcVVTMDFINE5iZ1NmYWJsVThVQmdm?=
 =?utf-8?B?aTdDYmxjOGMzT2tHbFJOeWcyNmoyRGUySk1pSXhWeU93NXNKb1Rhc0dOSm9H?=
 =?utf-8?B?YXlPSUdCaDhqT0NJRUg2SURuMTJjand0Z2YzenhsUFdHbVQ3enBnakdSUUNo?=
 =?utf-8?B?MlliOTBQUHVGTE5CWnBzSTU2UlllelA0Y3pkT3gzQk9DUENsd1A4RVU4ckFO?=
 =?utf-8?B?Q1NMNGpzYnQ0azhDVTJhMWIwa3l4dU55SngvVjdhQWcza1BIS25yQTBmaDBq?=
 =?utf-8?B?eEhVbnNSNGkzTkUxNzlRbnFNWUJ6aHNvTUpQUktDOTZFdElyeFMwWG9NOFlo?=
 =?utf-8?B?Zm51OWNoTVBhdDVqMVV0aWwwOGd1NlI3UU9IbS81UGpaVVd5V09paTdReUZm?=
 =?utf-8?B?Rk45UEFUV2wrTTdZK2lIWmp1dXdzSHhTNWJxeVExM0p2YWxTVXVhRHc5WmZn?=
 =?utf-8?B?YzdRbGptbklCL1FyT3JjOHdiaXl4bHdPLzNCTE9qK3RwaEJVenBNSmRYcTFj?=
 =?utf-8?B?dzkyQjJFR29Ya0lVUlVHRzd3amgvMExRaVBvOXd4Mm5UVEIzcnhYNG1zYloz?=
 =?utf-8?B?cTllQnhHMXpxM1VYd3NNWC84ditjMzNEbi9ZZzRKK3ZKWXJsOFRnWU91R1JM?=
 =?utf-8?B?UE5DcnN1RXBjcVZtRGlEc1VrU1ZEZmRxclBSZEd0QUQvMkFGVlU2UjUyN2FW?=
 =?utf-8?B?dEJjU3p0NSsvUCt1dDEzU3Z5K3RkZE9QWmRLVkMrRldJKzJPTHJKVDJZQUlC?=
 =?utf-8?B?MGZrY2NIUnl6ZmJEKzl6b3Fpdk9tbzZiQ1FSZm9zZU0rRStaeXBxazJaTFYw?=
 =?utf-8?B?bUxzdXFtL2ljUnF0ZlY3aVZGVzNYS3pOVmJ3ZGtENEo3ZDU3ejBvY1gxQ2FQ?=
 =?utf-8?B?Z1FqMkZTbXRhaC9XaDlPeHR0WkU0bHVYWFNoMEx2elhDUUNHbmVrWjhLQ1BH?=
 =?utf-8?B?VzA3NmNSMExpN3FQTzRhN2EzUXBqQWZvSWIxYjRROEJ3SEZQcVhoZGtmK3Z2?=
 =?utf-8?B?cEtxSlMyWktRRUdxenhEYXl4bmZaY2hUL3RqZFh0dG1ZcVdlUUlLajI0WWZK?=
 =?utf-8?B?T1VwQlBSVlZzUHdvZnhvQTB6YXRMaHdHamxZaU1PbTF6RXRKM1Zia0FkUkVt?=
 =?utf-8?B?Nlpzc0ZscEFsMWE0Y3MzczE3VVFjYWJ4VFF2L1lhcE51S29pZzJtcDh0djl3?=
 =?utf-8?B?cVlGemJaek1iODI5aTl6UGhzSitoSC9LcndCa0ZwS0pJMDRveHplSHhROVpJ?=
 =?utf-8?B?clRZc2RtN0xvclFGMzFiMXp4dUlaZXMxVU4yWHc1MUxOeU1zYVliZTBRVUxG?=
 =?utf-8?B?UUlmaGcxV2dwa3BVbDJFN0lnU0tHQy82a0NIR1lRTVFQN1FQVTEwcmJUZU0y?=
 =?utf-8?B?dmZnRmJVcTNMWEEyUTNoaTM2UXVDK0k5K1lDc0xiMmNHRHlrcjhldEdGNHpo?=
 =?utf-8?B?TGJEWk9YWWZZcW9EanM4WW0vVHBxaHlSS1hrYTAzR2Vhd0pST1hneEIxdnZk?=
 =?utf-8?B?SDZiT0wzV1k3MVZtQkFnS0JES00yaEhXVWE5V0tKaGNIR1dERysxeDF6MVNI?=
 =?utf-8?B?MWJ1VlpFZHhOUXoxby9ibE9lYzhuN09vNGdqWTFoaE53WTZKRStmcktZeG1Y?=
 =?utf-8?B?cndPWkRZL1FjejJQaCtYNmtFNUkvQjVvME1xbm1OVDZqNllXcC9nOGtjTzFv?=
 =?utf-8?B?SGhTdm9MazFsTVVyak05emZlOGVuTGthNWJLL3o3TmtxeEtHOVh4RDBqamxE?=
 =?utf-8?B?dGswL0huRnkrSEM3UW5UTHVzR1hKZjJ6NEhURnRqdGh3VjNJOW4yZ3RWeUVT?=
 =?utf-8?B?bG1Jb3d3ZTAxdW9KQ3luMWw2WlpiYmdPd0xJV3ZNRG5CellGbmlqZVdYK05J?=
 =?utf-8?B?SitPcUwzcVFmOHpjOEh5SkcrUUhIT29GL1htSFVlNzIxVnQ2cUUrYXlEYlE5?=
 =?utf-8?B?dXRxbC81dHFQL0tBbUZiL0NBUjVrVjVRaG5PUkg0djVlR0hrNTVpNUNYMHFX?=
 =?utf-8?B?ZzFrSmdkWWFFbWY1bE94MzV0bTFna3I5WWZ6WlMvYVJ4NnZQVmFKdGE2ZFBO?=
 =?utf-8?B?ZGx5amUxMVBtTWdtaU1BVTI0UlRiRXFpQjlZNkg1QVF1YWxhTTVJcnFoU0lV?=
 =?utf-8?B?NFByb1pPWXJpTjdHY3granhlOTJ5QVBoQ3BFSVJTVW9oZmpjYXJxdVM5aGNs?=
 =?utf-8?B?NExFaThjOHJXMmtyK2s3SmJabi9pN0NleGNiSkFNaGdkWjlRUlZVTDRaUmZa?=
 =?utf-8?Q?Zoo1XPmRukc0B9G4=3D?=
X-Exchange-RoutingPolicyChecked: vGb33kioa/5nhmty29GDBpp/mxsOBY3JLmKSn2wKdtUYT8nSg0oPiU1dMAeJiv0wIbdoDZhftEzhB9EmdZgbipg38EzKjLVc8b6MpR2ZyxOCKv5wy6eyufVU2wdBGRu8/cAc+Ns6Mx3PgzYxbLLUhV+0WVuwWGJyTS1IUr6KaivOKmwkbImDHpOx5bewEHJRkSxAyYIpz18lPoUc25j6DLUAk7gh3mb9CsMZleEeFee3DAN+8hIpDfNEnyU94dy3nTo5aXjXiY/7CrA0X6pLUAcKnC/GuU1i/2LUKz8fSeFiK0wvKafKrTzfXRcyFtC2rzSRbAqw/0GTgatNrs5b9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7d8463-d1bd-4721-e834-08deb18dcf5d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 07:52:56.6738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMZKcDMdYrgVA/lNWMpC5eSJbFXr1gfHZDr6RHElrKdWguTWoYkVuwsXxPKcDLqmUyricD+AVSc0q1fwrm8cy7DlvR+G4kSiVOi6+5ASqgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9087
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


On 5/14/2026 1:42 AM, Swati Sharma wrote:
> Replace igt_output_get_highres_mode() with sort_drm_modes_by_clk_dsc()
> to select the mode with the highest pixel clock. When multiple modes
> share the same resolution but differ in refresh rate, the resolution-based
> sort is ambiguous and may pick the wrong mode. Sorting by clock descending
> ensures the highest bandwidth mode is selected, which is most likely to
> trigger DSC.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   tests/intel/kms_dsc.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 69f335da3..605ad2d5c 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -170,7 +170,12 @@ static void update_display(data_t *data, uint32_t test_type)
>   	igt_skip_on(!igt_plane_has_format_mod(primary, data->plane_format,
>   		    DRM_FORMAT_MOD_LINEAR));
>   
> -	mode = igt_output_get_highres_mode(output);
> +	/* Sort modes by clock descending to pick the highest bandwidth mode,
> +	 * which is most likely to trigger DSC. This handles cases where
> +	 * multiple modes share the same resolution but differ in refresh rate.
> +	 */
> +	igt_sort_connector_modes(output->config.connector, sort_drm_modes_by_clk_dsc);
> +	mode = &output->config.connector->modes[0];
>   
>   	do {
>   		if (data->output_format != DSC_FORMAT_RGB && index > 0)
