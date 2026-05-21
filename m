Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA620CD5BA4
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 11:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C75710E19D;
	Thu, 21 May 2026 11:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fhyz+1IC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF0010E19D
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 11:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779363175; x=1810899175;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sc5MTxEX8vc9ywN1LU/05ebA1PrI++VRTpBk2DzkXkc=;
 b=Fhyz+1ICr5jA214phBY4ZciKXpXn3/vDusmr3Jkx1R+sU+5ufJUfSsG7
 v/1z5lOsOFzszYd6McrwL55uu7LQ6oFDLeBS5GAzDSwUwQyzcJf4sQnwH
 CdzrzrvF9lBimqp4ygpawN6MyIlAasn1b9TCHbc9MMCf61bH7fSLidg5g
 HKBcWwlTok5tqON8Jk+u4kj6UgVO109XVJmP30Rs3jQ1RMRhEU0L5ZOJd
 DCkbIuaD2Go7/L+VYQmG7iKN0eCqpoxdHyi+Nu/BxXOxj5+TT/MCouhHA
 OBLSEJYlrFP3Jd7Fg+nMvVvj2U0+hFvuLQa52LMPBX5rlu6CuXuvQXDQk w==;
X-CSE-ConnectionGUID: HF4UCiEeTV6RW72DHrdsiA==
X-CSE-MsgGUID: CjF83DSmRPWv4d5zmuO2DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79305963"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="79305963"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:32:55 -0700
X-CSE-ConnectionGUID: EaDdb4wDSgemMMiXskCI/Q==
X-CSE-MsgGUID: 0rj4k7lMQu653EnD0Km9yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="234164126"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:32:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 04:32:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 04:32:54 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 04:32:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7ph6HarfDdldlUhzMnmsxu3PC8vJr4RCH2XrbXSj+uXSKeMTO6baTEX2BVRoSFXv7/nheuaxrDyg31MMeCkxfdi9aHglYH+2DyjgJwlENZ2aJEvT7QgfwXaqoW+Duw5YHeKHMNTkJ9Etpamd6ZNVfS/JT9/GqquzsAKZPBRUtwIFSZg9UN3P/5EKugwFOK5yBtG3m4l/9DzNfryhezzTqaTevjrzWhzRVKLUxgmP1IxlHdh71P1XrXr4fc6moNW9RmClWxJsO8nM+/LwbLAT2ewvUhVWQUTUGIlIr6pdS7wUtUkfvmvIPgYfPark8lvqea1HFrFnM3paoY6Zo1+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n809vvLqRPuBuEO0SONNz3r7M4f2f4tNwT5WV1TbUBk=;
 b=ldU4nJEBbwadrK/8diFb+c9qOaPiA/lnhpMEQWHO5QVtVMg7VX62GNvdawjmCnrZHhVFUGMY2FZyeNQ95fWzDPqQkw3DBrbtOPDzambZE+E+lNI6wgShaIQPQ8yG/9oisund3yff4LDCdMjbi38JtVefG/5xRKWyjEYAqGs7PJ+FGgizTSjMkhNebM1eqOYedPbZgEX6uibZNVccv5vNLGY0gf+Rv9OpYSxe9mWGvnSkiRt6345KQcLxsPJeqpMS4XqilEH92vCEXgKKcGPquJSQtzzSfzk49bWoSl/u28XFPor8a6oeJM7iMUEafQ9sKWi5OIOYrSSfxsVXzc05MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ5PPF33E90C8BE.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 21 May
 2026 11:32:50 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 11:32:50 +0000
Message-ID: <bf7792e4-dd53-4fbe-b86e-62662fae0378@intel.com>
Date: Thu, 21 May 2026 17:02:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_colorop_helper: clear
 assigned_color_pipeline on bypass
Content-Language: en-GB
To: <igt-dev@lists.freedesktop.org>
CC: Swati Sharma <swati2.sharma@intel.com>, Alex Hung <alex.hung@amd.com>,
 Melissa Wen <mwen@igalia.com>
References: <20260521092620.3637270-1-chaitanya.kumar.borah@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260521092620.3637270-1-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::8) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SJ5PPF33E90C8BE:EE_
X-MS-Office365-Filtering-Correlation-Id: b29360ac-27e8-4a6a-5ea1-08deb72cb0c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Xme7LVj4X3QUKCe2Bu0QR1Zmg3AgFODmcGxMSFsT/7P3ub46iguVnOaxEBX64Tw77pwee9TfIrb8vlJNFl99a5kkLACrDnJWQcTAziAC+dXymO5WE8rAT2AxybRCH1ZX2F87mI9Vi8e4LVtrbhXNqagKp0Eo1Z6NMh5aTdmAlMY0rCvDaQin9OWwJPAZ4tisHM6ezS8WIO6oysQdJMN1GsF4UBmOEVTnz89HjWG+ijgy7YLkGnZxSVVDArCCebBzJrMZ0HWLiPdTIY65tQEPvMKYn5QKMT9g1n4oBNk06CN62iw80S7o3evrHKkEgDmzrYYrvCaj4g4nj4wCGbJ/wIc49XFc2pARXTYaos5fTfXMnjX0nAgf8O2YDfaBFLup4qGgxyP9MEhZz3Gp36pFjwJmvqR1H2JVSdhEn329VXG6+Uj2YU9TmXQ/yJlcaKUVGRm2HkNvGKKQiFv5yYwsK9jaTs3EPByfl9/xUk7VA0fVM8bd9FMLWC12ikrKUkOfOC/wgSXdtr650t9yn02VljDhQ2US1Ex7uzZpN986hxxDi1A/nmp1PjXTRXUbP94Z8i8cDFCvPWCpDSwGJ556gKBx2iFNVRLdUTpJOiv8JqAXqdToNWBXvAysf/upr6oHcuv0pbMGfJOQsYZ929NBNtbctb0Xn7BKJM6CmLxZiJW1fOKOtpsyYsM+dFbQ6GEN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDdhbHoyUkRSSFJydUdLdVNaVjJtTXozV0k2UDVzaE9FWEIwMFBJOE51dElZ?=
 =?utf-8?B?T1hPVC9FK2JDQ2llT09qSXRHSXFOang0MXpTbHZ3UldKcGVsNkZiU2k1UDB2?=
 =?utf-8?B?ZHJYUTNNdnBkU3Rpek1RcTZnUFBvVURPNDRyNUprYTdzMkFUQ1BTRHdtWXBs?=
 =?utf-8?B?OTFVSHljNzJwdjZmZ045d2xwR1FBQklXSUhSME0vWkdQYVBFRkFlcU5wNXNV?=
 =?utf-8?B?Q0JFUnlJWlhyMG8rMm1IQVJJY1ZUdnpoanhsR0hzbHhVWWJHRGFPNXd6YjIy?=
 =?utf-8?B?VGwrYzhnd0c3aHNPNHdXZGcwWlpKOFpPVnQ3WVZDcVE1dVM4Vm1uRURmN1pI?=
 =?utf-8?B?SGJGQVcrVHFRM1ZOc0I4b3JrRWs0SS9PbUdMZ3VwRlpTYVY0UXhCOVpKNWUv?=
 =?utf-8?B?cDRZcTZmb2V3TjVMNzVITUVwN1VkZ1cwa2pRaGI5THRjV3VvWElYOTJ0dlQ0?=
 =?utf-8?B?OG0xM0o4Qy91ZTZxZDNxdWJmVjBsbjZrem5QQ0plQzZtazdWMklIZXlOc3Z1?=
 =?utf-8?B?YncxY0Y3QXpVMlFYTE5xNjExNVVWWk1xVDRieWVmMDhNOFUwQW1kRDFuYmJM?=
 =?utf-8?B?ZGdjeUdhMWZjMlN5K09YNThOL013NGZSL1FTS0dHWWgvTkdNK3lpUTgvSVpj?=
 =?utf-8?B?TjkxaElyQlhDUFFRV3pGWlEwZHVEdXN1NXpSVHAwMlpHMzBaQndObVBqWW10?=
 =?utf-8?B?T0FST1FlcFpFaW05SmZ6a3RsNDdBbWNBVkpLTk1JRkpDU0NDQllMTEFvcDRi?=
 =?utf-8?B?MEZCSGlFZzJ2WjYzVkVxdzQ2UEVsZmw0cXRWazJIckppd0VxUjBWRkdFbWpI?=
 =?utf-8?B?VlpGN3BONzE3US9HODNiNjdmZlJET1pzV1ZiZ2xKQ3U2V1JrRGgvZlYzUVhV?=
 =?utf-8?B?NW5oVnVUc0ZkNHZsOWhYcU9xSFV0cHo5bUVCdEFwLzNzZGRTMyt2KzlWbjlM?=
 =?utf-8?B?L0JsK2ZwM3U2ZE9qalFuWTczWUhQbkpoSHMvNHM0U2I1Sit4NEdCU0F0T0xl?=
 =?utf-8?B?Ym9lOXF1SGw4UzFCRVlMTkx6UUk0K2s2aWNvUzlFcG90OVh5YU5ack53V2hP?=
 =?utf-8?B?VnZkRjV3QkZka1ZBTkgxdFhOZDJaVndudzNobjh0eS8yK25BemxrcU95UEYz?=
 =?utf-8?B?R2J2bitpZFpMRXk1cklPck4zdVNrOEszZmM0QWNKaGR3QVJScStKK09zM2tw?=
 =?utf-8?B?RUpGUlVKMEkxUnM2ZHVDTVVmQWpCTk5zS1ptMWFoMHUxWVI5SFFBeXdISWJC?=
 =?utf-8?B?TnVGNnRTWEtIT3pLSFpvcHN3VkRFeGJHZWxjUjlPNXFIT0NiMG5ld0doZnpx?=
 =?utf-8?B?WGVuUmNuM1BiV01RME45Z2hYdUZUREYwQUZ2YTBHd211eDVoSDcvTjRocHJQ?=
 =?utf-8?B?YWRZdEJuWWlmK3R1K3JpWTYyQTQ4ZVFPZThwKzdvMDlpY0dIdnQ5TFVUUWY4?=
 =?utf-8?B?THlYM1BvVEl2dlVNOExIdnoyNldSZGVNNW9CODhGa3VXRElsZXozeWFCNmtU?=
 =?utf-8?B?eDkrbnJIMVRZNWlxUXJLN0VBSjk2bE0vL3g4Yml5TjVYZnRNeFRYeURFZkE3?=
 =?utf-8?B?ekR4cUJJbTRIcTQwOUVyZExCekk5aXFGM0ovckNieHVhMnZhSmNucy9EL0xH?=
 =?utf-8?B?eTdXaCtoTXNtY04zSjdLZGxLOG1XbFQxbnFZbmgvNEw3YStLTTZGcE1wTXlh?=
 =?utf-8?B?U29rOWtMd09XUGpwSzl3K1Fzd1hRbkxGYVhYSmlmblI1VkJqYm1HNlJ6dlMz?=
 =?utf-8?B?TDZKOS9xZHN1dmpGcTFTVCs4RlBjbElGR3gvbzdJbmR5WmltUjAxSTBkYXNB?=
 =?utf-8?B?VzFyeHhlZ2YwSytRS0xrN0krODhqREd5R1RzcmRkalNjd0xtUEU5eWJSM1pX?=
 =?utf-8?B?VzRMeUpQSyt0bFFEdjQ1eVk1UTBuRDFLWEhyeUcwWVFSV0pISlVFUGRxMkhX?=
 =?utf-8?B?VXZEeXI4WGNOVTM3L3QrQnJaQjZwU3FyN0hWN1VVdkR2T2NJT2dvSUY0UUU4?=
 =?utf-8?B?YTFuZ3JnSmlqVHRwR0lmSFRoZmM4YUFQMkNLZHdRK283WjMxems4dUR5Q25E?=
 =?utf-8?B?SEcxSEhLSVYxUDhoK2xURmtEcFplRDJLZG5nWmRNSjBwdDdoY2NNWmVnUzNt?=
 =?utf-8?B?dHVMeVZMUFB5RHhMekdyNUE2NTFxbWFwQVFxQWx5eG41eUlmL05FTkN5b3dm?=
 =?utf-8?B?NTJGWEc4akprTlNjenE1cTQ5NWJIdkZTcnRpcXpSR216c1R3UDkzTXBva01B?=
 =?utf-8?B?L0RGUlRTRkgvNFJ4Q3dHUXhIRnlVUnJwTnJLOVd5ekhpeEJKL1R2OVZhT2hX?=
 =?utf-8?B?SnpyUVpxMHFHRklBRGhaZUdxeklnaEZWNmYySmVLdVBiVHZRUE5vNTVpSmJY?=
 =?utf-8?Q?PQtO4gJTAB7pQeQE=3D?=
X-Exchange-RoutingPolicyChecked: XUAGAr7mN6drLky9V2PPs4Lyt/1/kJIMwpsxfGClSJm/SSw+89kPyQAjKShfRJkyJKHtPKbmnUmnw67+dH7Tbogh8VER98zW7BMo+8XHe6fvPeQ4q6VluAuylWreDM0YCIez4PaePM7svKIRouB2JL1vMiTvTidR7NvUIBe1rtoKlA609pwyc/JGixOmL4nalShLaq1H5mV4Mw9XTNi95/4xY+utjQeWeRjL5F10kkY+g9u11cGA4jYq/AldbhvbAPHTeWIQ3OTvRyxtd76jGXff39EaNPSCf6wZtPWgnFY67WAhS+xmjkro1tLjfitgAexBgFW0Udttw2fQzA+Vmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b29360ac-27e8-4a6a-5ea1-08deb72cb0c1
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 11:32:50.7167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kuB3htXqRWcWkf2osDLdvHV+b/eWfgouK8/OLP3VflT9dV32+rnBmpeQJ8j02PdMr0uXsyfvt8OBk3XdN0jnOfbTze0lYisdtCZQu99NME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF33E90C8BE
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

Please ignore the patch. I sent it rather half-baked.

Apologies for the noise.

On 5/21/2026 2:56 PM, Chaitanya Kumar Borah wrote:
> set_color_pipeline_bypass() didn't clear plane->assigned_color_pipeline,
> so colorop property updates were still sent for an inactive pipeline.
> 
> Allow igt_plane_set_color_pipeline() to take NULL as an argument to disable
> a pipeline, use it in set_color_pipeline_bypass()
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Alex Hung <alex.hung@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   lib/igt_kms.c              | 7 ++++++-
>   tests/kms_colorop_helper.c | 2 +-
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 99fc9fa05..b10059e7a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4405,6 +4405,10 @@ bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
>   	int i;
>   	bool found = false;
>   
> +	/* For Bypass */
> +	if (colorop == NULL)
> +		return true;
> +
>   	for (i = 0; i < plane->num_color_pipelines; i++) {
>   		if (plane->color_pipelines[i] == colorop) {
>   			found = true;
> @@ -4427,7 +4431,8 @@ void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
>   	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
>   
>   	plane->assigned_color_pipeline = colorop;
> -	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
> +	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE,
> +				colorop ? colorop->name : "Bypass");
>   }
>   
>   /**
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index aaee4e567..af46f70a6 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -398,7 +398,7 @@ void set_color_pipeline(igt_display_t *display,
>   
>   void set_color_pipeline_bypass(igt_plane_t *plane)
>   {
> -	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
> +	igt_plane_set_color_pipeline(plane, NULL);
>   }
>   
>   static void reset_colorop(kms_colorop_t *colorop)

