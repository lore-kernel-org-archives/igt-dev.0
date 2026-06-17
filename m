Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460ECCD98E2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 09:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD9B10E990;
	Wed, 17 Jun 2026 09:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kztyX//S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BC610E990
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 09:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781688054; x=1813224054;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vycXfFmytgS6XvfoELdjlLEaPVnBI0yd/x4qgwTDAZ4=;
 b=kztyX//SEFOzRigOLw82QIWcRYImeeqHxre3CG6hJFp/4BkfpXmDm0xp
 5I8uwH+qI2ul+yXjwCq0KfdX7hSiiTRy/1SpgoFSqt9JcxaqmUEbGGsIy
 yi9z1HoK8Lg5RTcNXbdHi/MWDxzBpTHLEowVYD5Uv4/stFH/e929jxFvs
 hwvpsW48dpw/W1wHMpzf4yfBTznudKKQcWg3tI2RCEonYXArkolzrB8c3
 87JKGfzBBlmXQxtvbtn1e0U7W8KFirpn531dL+PEXWPTOlcuRE6Ju/pRH
 zf2PVtkTb7Yjm0owx8ae1iFlHdLNoeU/3bqkcDwKmlOmfmSgkLCslzipE g==;
X-CSE-ConnectionGUID: VmKoxHePTceakDarHfT6IQ==
X-CSE-MsgGUID: 26i82GvlQIOZTztKMAjU0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82484171"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82484171"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 02:20:53 -0700
X-CSE-ConnectionGUID: RwUlRz94R7+dHOaZw2YNAg==
X-CSE-MsgGUID: Mgkf25DTSfe11At8J1SEdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="245111174"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 02:20:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 02:20:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 02:20:52 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 02:20:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tw8aRFYhvHAgjfvBA5DAJcqR749DTH9L/SXV4eF1svt1ignC1Ct6j80cdBAqHula4227uH4d/JXQMTSWuGfuz5z0wJ1f+NxUWFwFuVW7BNQg5IisTJefSAPmxGsjDPh5jtQGI0GIy7tyS2qyGgTMM3ntzBndGtxe/B/9gVD91fhOhiinZfxMXgV2J/CVVCtT4zv0e9j73Eo183imCJWwUspqsn4aROupwxDlC4Iei2pfYfG2J2yjJ48DiOgexFfya1XMRLW4evl/Q/LNIHrVOwNjBfEEmsW+FNthv/jcwUdwYDD7SI1bMC003GlZG3TnwUMdEgHG2sNUu7vAfnOpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWS69f0+J1qnRwCqNA6g4PtSPIKubZpAOKFPCtECUjY=;
 b=cE8jT4TDxc32/2AXss3FzTt0bKxb1Ju+3P3OufDEWMUpDQAOev2ZxuTPQ+mU8oDJVeirq4vvOIT6kH5uCA26OmMlbohCoqmTv7JoZ/04sQ0vLcrUemuMYD3UpINWdojAOIFZkbV5OtyXd4F2OkVOSEuXksgYwbqVHzJ42YMdaZduxDZBuIc+dRSEILsGfEvIj2cazo6ITzK5yGrEH5XuRPd8tE+oIxxaFaW2xMc3tNJRUPOTf9F2ZIhM9KXJ4gBkHr0n3/Xt6zCtW1Mwpsiv1J2OoudQvijG1Es1YDQjnNLXF3r+YEeu8CeGSW+RCJWJpLS9ctD2mUHZCsNbI5kaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS4PPF11A2D5672.namprd11.prod.outlook.com (2603:10b6:f:fc02::b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 09:20:49 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 09:20:49 +0000
Message-ID: <7f0a7e03-bc7e-47a3-be7e-6e486b3b0e01@intel.com>
Date: Wed, 17 Jun 2026 14:50:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/kms_bw: use igt_display_n_crtcs()
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260616090610.2106378-1-jani.nikula@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260616090610.2106378-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0189.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS4PPF11A2D5672:EE_
X-MS-Office365-Filtering-Correlation-Id: d76dce97-504b-4597-5970-08decc51b7f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|42112799006|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: yJMmzxoO6XkqBdNvoxo2nZoRqg0+UH4YM9eUF+CL51ox5CXg5pFUBOhoTrPQQc/j+yuJU8+pw9AEPZyelnzqhanTqKIijiVSHDVIp16qe07x4Y4eHanw+gS0++R8S7g8Q+9c+uzyySaPDbubQP6vx5L8iKoJ8Y863tGHjdWlJFKOCiR8ft6/3dNeC1ppkha01DqkrCRbqihpV7JJnqF/ngMjvPYIyeLvF8ELp4eEnhPrXC6pWBbTZ1HwjMi6rDAD06NTGmpIMQkFKB+mX4Ue94vPUbuARYawTZ1e72W1s/4co8FD4gWLuB1aTWj8DeQ97CRLSRrr0pSo80ZrqHVP8SkDQAAgEtJwZn1OScBNAraJbH72dhFFrRvYwRRpwD9KFnzafwcNqohgiqiEC36VsANGimHJzdUi99RZ/2Ci43mv3NCB1zYGg0fN6Jnm27DxKPqt8rqfGHPJj7vwST2HkZsZDpwoSIfvlEp5/EApr7B+s3ZLAFlpIfGQoq5R2DbHjUTf8BKLFcz3BSPlmpN2BDluppgkCOUAzxd2sGdFUKz68X7o8w/IWmaTbGxhcdScE0L0G2avmWwWZvyTnaNbHetiuKhqLf/Zz8Vml8apRGl49NBX6dGifCgP4cfjZvDFb8AkWFxgfFzp0r6o3OzrVmMr4/1ZNogngaPoKbPMRKRXRVE7s0PCeWK0SLTgCDcd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(42112799006)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1hiUW5ncWl0SU90R25jRXE3UWNhSWU2Q2FxY0NsVGFCTm1ldVAyTEdNZjlr?=
 =?utf-8?B?SU9RSEhwcXBVVmNwV3NUQzIxNCtuOTAwd2Zwem96ZTQzVjBsYzFEb05PRkVu?=
 =?utf-8?B?S0VCR2lQQU02b0J2cEhCTlRRcGZyVkpGS3JvWTRwc3N2Uy9meVNRQVA5a0JO?=
 =?utf-8?B?eTNCN3FCOXpXbC9pRC9tWG4zNk1qOXlwWW5RNUdRV1ZVWHBQNVdsdUZ6LzBI?=
 =?utf-8?B?OVVDS0U2cGVQNm5FN2ZKWE1oa2JEUUhWNkFqbnVtRzJxM21BQ1dBdVR3d29h?=
 =?utf-8?B?bGtCRnROeHZMeFpIOVRhT0d6Ums3d1JEbGNva0VyUUNVRFgxWFdza1QwNDIr?=
 =?utf-8?B?UUQ1cU5XcTNCRDg5aFJyTTNwZ1pDUG5yd2NmdWhFOTlqaWhJMnk4UTBWZ2di?=
 =?utf-8?B?bmc5TEtoSVFtY1AyL2dEbEdMVUpWOWZXVFVETHVNN3NTVTJOZlU1UFlLT3RE?=
 =?utf-8?B?TzVyZmdIZ2c1TlE0YnNQTE50U1VpdnZwTFlLMFJsVjIzdEk4ay9LME5ESWtr?=
 =?utf-8?B?OVcyQW5ybW1vMzU5ZjBkSFluYTRJbFZHODlHcklzdUlIQ08xdHNsUVpmVXlO?=
 =?utf-8?B?ejZRTExBSFhlSXhOVG83dFFVdW4xUldxeTVPSVFPeUVBYVJSeWtoVzJiNHh3?=
 =?utf-8?B?Z2pibkxFc1pxdzA2S1ErazZreUJyeHUzaWhpdWxQTG10RXpHaWhFeDc5c0ta?=
 =?utf-8?B?L2JQUHlHZjRzZ0ZpRUxJaXVURUFkKzVxV1RKenZON3lzeFIyaGVpQlUvbjgr?=
 =?utf-8?B?Z1pqRFRZWEg4eFZQSFA4Mmx4dXJrSUo3Sm5qeFdDYzdOcXo5WldGU0FROFRP?=
 =?utf-8?B?emEyWlNvWVVJWEE2eDBDeXRLaEcvN2pSS1p4N2RNVWZXTHRqYXJQRC8wQzJ5?=
 =?utf-8?B?SUo1WmE5UEsxOHV3Q3hmSXF2M1NNeXNTLzJxRWI4OXhVUlJ5Wms5UGtKQ0FG?=
 =?utf-8?B?RGI5aS9NVWlBMXg4Z0YycklnTVlMNEl4SWhwVXRZMkpvVjBYandrb3BKbVVr?=
 =?utf-8?B?OFJCSWY0am5UWmYxNGltMm5za01JcjkwTXE1YStLTnpzZlN1ZUtPbDlLbTB3?=
 =?utf-8?B?WHBaNUNOOEVHdGFiUXA0aGI2KzJucnd5Umx2UzFvY0kvMWUyZldiU3QrdTlh?=
 =?utf-8?B?RzR4ZXJ1YlZVNG43UHhtRjZiODE2bW0vSENWQnJPWjFIdDFkVitaL2hwb08r?=
 =?utf-8?B?SXFtQzd5ZXRERGxza3pYb0NXa2JScW13RGVKcXJUR2NlTEw1Z2gxTitvajZY?=
 =?utf-8?B?czYvQlNKZnU1cVhzSW5VM1h1UjUzK1BpTFZjTTF4NTM0aVZndGxHK29JMmVu?=
 =?utf-8?B?cmM5V2JjTmFyMDg5ZjhINmtRS1d2SUYxc0xlVTMvQlZVT2NIUjZmbEdHdnNw?=
 =?utf-8?B?U3pPellJL0JhcjhSTW1aV2NnVk9ZcDdhcDIyMXZCZmY2QmJ0bmtsTmIrbitq?=
 =?utf-8?B?dnVXNTVsZ0h1UjBuTEYrcERERENoWTZOUmRNQ3pidEtwamZ5dWhJRGt1bXUz?=
 =?utf-8?B?R2tLNlJBMEt5a3VnRFR4dDlIV09aSmpBMjJlVEdndmJvQ1d1OWNMclhBczh2?=
 =?utf-8?B?M05DUVdPZ1JHUGY4UjExakJ6Z2pHSmxybHBuZ2pUZ2paRU1xbEpUNTJYQS95?=
 =?utf-8?B?b2ZWcEJOREpwWHFtUTFOY1hsSm0xeHY1UjZ0Qk1TdUhNQk1xaHZBVHA1OTh2?=
 =?utf-8?B?M1NxcFNIUjlmSzJ4RCsxbGE4QXR4TzBaaERzS2xXTFc5K3BxNTUvZWZvdHpu?=
 =?utf-8?B?K1FDRmMzUDVlN0pNNHZpV3JGV1lmWkZNMTJ3QzhJQlMyOTUwSXM5SitWR1Bo?=
 =?utf-8?B?TWNXdnJ1WXNVNU13VFFJdjJPTGpDWlN1SGxPODNTZVB5b1UySXpuQVZWb0o0?=
 =?utf-8?B?RDVZWWlpUWRNekh2a2dTRGVLVDhJcEltWUEyTytMMU8zZXhhSkEyczh1NCtl?=
 =?utf-8?B?ekJ6OHFDN3VndUpHZlNsMWdJVU04R20wZmU5NTZpNmNGdTZPcFI1Q3dja1lp?=
 =?utf-8?B?YTdoSUFRZTAyVWNYUm9RK0xPY0ViOUs3NlhOMzFiWm9ha2p6bmxBRXMyK2dv?=
 =?utf-8?B?SkJicXdFYVViZU04SFliZlFvZjFLVkVTQjlzeDNQelVUdmtsMnNseDNKWllN?=
 =?utf-8?B?cTRVakxzdCt0UWdIVWxlNUlEbHZ3ZkV2aFFwUDJFMEFGZW1BK2RIREFnOGNo?=
 =?utf-8?B?bjJiNzNxa1RDK1dFOUhBT1VDNzBtQ0NEMmI1Q0xUM1dZVWFrdHJ4UW5OZ2pD?=
 =?utf-8?B?akJ4K1RzVHpYNktUNE5jSkpva3BKd1VYbGxFU1VwVXRpMXF0MEU0RWNiTktZ?=
 =?utf-8?B?UXNXRFlsR29FMW5PNlFQTHVBbHI1VGxrY1pSS3RDeVFTbFFIb0lzUT09?=
X-Exchange-RoutingPolicyChecked: X9rn94SCdqi4dKQFb+wi7aGfMskT+Hc8jncaqNjmttqZ+JZG2+M1h3yODQO/V2+koGNBeGVJMUV2VWpKXMtQ9sNWoEI4LjfHsaaUT8sqOjxUzRqHDBvUPcJuYywBxFO7EYULtTMdEqFC3H7+LExcguMWCFIBZguvZoIWPkU4mizzLQewtu5AvVDmNI2SFzApBrzgOwIa/XpfdG2DzIyUvC70Uw5uqTnYjBwjpF/9SJVbEZC6a1gHCNt5pCT9nnLWSON1IEvgvzU2oW9Jjkyl/pqEyq/SDzTQiIWHSRBWHVokElSVLYmKH4suWN6zf6JioJNl+8oFqqCpl9gh9Aiicw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d76dce97-504b-4597-5970-08decc51b7f3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 09:20:49.3953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJoqfuKhfFTJtLUPJYMayPp7eaf7cT41X6WbODJ/dp/N4MRWzBMHqe+lc11BoZKHX3FDxmk0Sf7ExAAQ5dWncg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF11A2D5672
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


On 6/16/2026 2:36 PM, Jani Nikula wrote:
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
> index 42b7a0123575..ea7cf7bacde8 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -240,15 +240,11 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
>   	drmModeModeInfo fb_mode;
>   	struct igt_fb buffer[IGT_MAX_PIPES];
>   	igt_crc_t zero, captured[IGT_MAX_PIPES];
> -	int i = 0, num_pipes = 0;
> +	int i = 0;
>   	igt_crtc_t *crtc;
>   	int ret;
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
