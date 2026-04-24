Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF20FB44CA
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 08:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5081D10F3D4;
	Fri, 24 Apr 2026 08:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2ju/Qr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBD010F3D4
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 08:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777018673; x=1808554673;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A02UPEg0b8CrJfuyFrHQvcFYXEjnC5hN0k3W4q0MVwk=;
 b=E2ju/Qr7h683/vUSwhyQQQzjZ6ey1gBYVDBPtF1P68GDpaGxhnnGhjgA
 4YnFD2eeB3FBSzlQ61FE+2vj8GCHFvQ2HuIR9Czr8zQq6o01j3uaPAOJ8
 xeueuguxBbAp/WjNiD+Q4lagpbp0A9IL74wrSirgqOdRuu3DFKJs7fpDP
 DW9MezJ65E5Y1t1Q0XdY6fCnuxGs6ikm4bxqFhBUxJILVuQZKVunnO5nw
 dOC2JqGLPGk4FUGl1oTDstKu9YrTrb6eE0z5BeoUK/wMToo4GkAWgVHmY
 0PlITpEBbPCt8Ax9haWRAx2ClANz9CG9BuiF/0fXMt/LRNTTb8qYsmu6m A==;
X-CSE-ConnectionGUID: ySmu75d7Rjml9Ip9rJA7RA==
X-CSE-MsgGUID: BjpmRZKhTxmFwCp2BRlVgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77882195"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="77882195"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 01:17:46 -0700
X-CSE-ConnectionGUID: 0kwns9BGQWmrQtMbBIoZ7w==
X-CSE-MsgGUID: pPiO2dqYSQuMNOyGr3NEgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="229697273"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 01:17:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 01:17:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 24 Apr 2026 01:17:44 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 01:17:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxK9Pmfkt6Ks7ZKT67moQwXjCsMxOmbFK5oVJ9SxBIRaktUd+Dd9dpw6ixrzmMKqv42fqWuCrcg60BzdOCUIk2akl7nCGPoB6ZYIOcb/dOjB29guiE87llTfPzYkpOO+rb0p/CYX6C9KmzeyHImKWbn3OtiOsE9TmehjGa9OuU7Afu1XTRFhEbSzueya14ESf66IyWS/nvM2xKn6ECTsRw1U/dFMumU7EzIfkXHJITQ1qlp9ZBkrdp+xFh/VY7bJ/R2NTClpk6UDF6MJze9yic8w5+FLgYpGeF0O0xoUSom5YClEZNNHe2a0VGbI6y+ntGNrxmqGLL7lZUC8pPpK/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgSlT3zGBmi97AXRmyVJ37FICblCGonTIkMRtBZ1jow=;
 b=OnU0DuZL+SjpWaOz+3F7kAr21SpawtoFlQZolYiKaMGMCSfoNfxeJkEDSF+XIwt/lNs55xzze7v6CWPaniXVjTdymFMusRKnr8S5fixC+XsXhmjOLypgXwkf+dAdUS7+EP3DwAbxSZvZosvIQJZr0FV45xKwns0wqKXIQgT2VExba+ua6SzYmXeG4Q4yGp8jqpcOwSXF4IkhBpTDGsdqC0CK7I0uq2NjWBBA18fq0rT9j4cY0+xTWkbyHO/lm83rF2a1uK+1USS1MHpe0W0QQzM00ZvSSNr75uUGVBbbub0/XnfejnpFj1a+WwpUwQqBmD78QrBvR09D5ZBlDLybGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SA1PR11MB6941.namprd11.prod.outlook.com (2603:10b6:806:2bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 08:17:34 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%5]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 08:17:34 +0000
Message-ID: <e8c2fc66-97e8-4e93-be6c-1ef15c348f49@intel.com>
Date: Fri, 24 Apr 2026 13:47:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/oa: Wa_14026633728
To: <igt-dev@lists.freedesktop.org>
CC: <ashutosh.dixit@intel.com>
References: <20260424081354.3033523-1-shekhar.chauhan@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20260424081354.3033523-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0156.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::12) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SA1PR11MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 9002433f-8518-4ffb-f8e1-08dea1d9f013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: XCy225ygn/ApPKI0a3KgE7SxIObvykOLQp34+BgLD8z16Xo3t1PodK61sMmJm0X84Mwr4e7tc19gWtgxnc/lBjPqLL7lVLQCEzkVYcGo8BYnzMOPUxO436y0K9sMH+pdAWYXaR0crrrqlxpSYWH99S/7aJVDxknhQq5CUuJPvXYXCAq+LhuVX0jtxT9QMWs+pkAJSC1Jy844n1FZmHdi1edKsdiWa7jVOp52PZlThf9Lt/vLGVuFQq3xF/OXFVD0EtmCo/UpVDAabp6YsNQb7NRRCmx6HUnE9xovS69w+hZhwmM0GKC0QTCOSDTEjHwUvvfzwcrnKk6T8oiMJC5Mk2WE4WGhYYXde1k1xChL3RD8PFd4rQsYlDxu6GaldgR/HJc1CUpiuPwOJASBjVsZrUyzFLoHqkPxVtNJIE4GtRmfegi6Y4S8HpMN7aaPD744v31wTzMHchdKyy//KpMEZ53ul/7g1DrriV+mvK6g0gd70DeUQB5LHvEKLBelCc2EJWUx0RReTORl+uZ+BScdbBoJKvcDo7JpF5KmMDn+YuYlHMunG8PI+U4VxWGzr3+qyd1Ufzar6UovndgCEUdzkh6JammTzRrUcN3MFEQr21XLzw2P0VTr1EHi7x7K/lvdpMSFKaoMTBpg+/VeC9YFmmzYSXvwUQD0/npccd5m+YCGcysH89DZ0NOiyRIU/8e0sPwobRWKWieqwxB1+3GZL7ZeM0AewoypX6lNqBrvHxk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3pHWkVsUTZBNDdMVENxOGsyWHBTMmJROEdDeTNJR3J4NUxJc1k4RDdKNkFD?=
 =?utf-8?B?Ny8vdXBGMlJoRkUxVGhVbiswT3dYTjNEU1B0d0cwTHorYTFEaWlPbUE0SWJ2?=
 =?utf-8?B?amlmK0pHM0RYd1dPSzlESzJwN1VFY0VtaEpCeEFBQ294eEY5VGJBK3RueTJW?=
 =?utf-8?B?ejVmRWZGbU5kUmFhWE5la1lRb3NLeFIyUEVtdnRKMit4ZTJyQkNzYnV5NnhF?=
 =?utf-8?B?dndTbHR6K3Y2NEh1dXhrR0hDK3pjeWFzUEpZMjRnUGJQTDZKT2sySDFqeWFI?=
 =?utf-8?B?K29seXlYUHoramxaK2tCc0ZFTWQyREtPek80c2djNGFDbWVldWxlSi9LV2RT?=
 =?utf-8?B?alVPaTRlRnNRZUgrYjlWWDYydnBXMlB6WCtxV1lHMVBUOEpxZm1RcXlGMFNa?=
 =?utf-8?B?cUF2SjJFV1RPK3hMMUNOWnRKMFlYWXhUMFhMb21rSFZSNzM5dWhzUlplQm01?=
 =?utf-8?B?SHF2VFFtcVJZK3ZKV29ySG4vR0t1VytsVDVWRFR3M2dUOEZ5R3d6MWx4MjhL?=
 =?utf-8?B?OUdiQmRlQU9kWmJWb2pHdTVJSjc2MVp5Nys1QnNOK01ZcXF2OVFnZDQwM29u?=
 =?utf-8?B?V1gxdVBGdEhYREVXS1p5R2RkeWZYQkNteSt6OXJWRnJNNVRQK2VTRmFabVFS?=
 =?utf-8?B?OE92by9LYXFHWEhTUy9TT1hqc3I5Ym9oVURkNE1aNnBEZ1hZaUExTDE3cFJs?=
 =?utf-8?B?Y0RWVEgySmhMdVhScHpPYlNUc2hJSWZwVlF0RUtrQzRSTTQ5ZklrZEJ4Y0Nx?=
 =?utf-8?B?RG4yV21xWEdjcWxablRkK1kxaGRuY1BPdE5ySjU3U2c2T0xSeE1LcmZYcEQ2?=
 =?utf-8?B?ZTVudHNmTXNDQlJuUEFKZ0JlM29IN29tbWpTWGo2eU13Ty9qMENFWEloaG9h?=
 =?utf-8?B?b1BhLzRZa1BkRjFkK3lXSEo5S0dzUERyQ0d2TVNzY0UydEMvNjVPcDUyMzgr?=
 =?utf-8?B?c3FVY0dJZ0RhektvTWt1ZEpMU1l4RTl3ZFNwa1FrTHNydlFpTy9EOFFSb1F4?=
 =?utf-8?B?Ky8weGlMYmo1cU9ZN2R5SnVRWmJhNGhBdGg5QmpjZjc0cXRTbEEwK1ozbFpJ?=
 =?utf-8?B?a2pkOWlDcXkvYk0xOVVPQWlXWWtESjRORkE1TEUxSG5ZaUdzVWtvakkwblAw?=
 =?utf-8?B?VFI2dXBrZkJYQ05RbU0ybHBCWWoyRVZ0UGljSFU2bzNPNm1DdWR6Rk9LOUFR?=
 =?utf-8?B?bmg3UDBkbnV0anlQV0p4dHFSVEY5L2RmYmlDTklQZlBJNjh1UHc2aTJEQlZB?=
 =?utf-8?B?b3c2V3h0Rkg1SDZTQnF3RXNyYU02RGd2OWk4SWM3eFRJRVBtekhNWkJwVkZv?=
 =?utf-8?B?bW1zd3RFeUZLUFM0OStUcVAyZWVVaE1JZ3ZFNk1XVU0vbU90bEtYdTZ0RUM2?=
 =?utf-8?B?Wm0rUDNlUXhmMUpBNDBSTEpwOEYrMEE4Mm4vdE1tNjVpdkw3RC9OTldTYlBK?=
 =?utf-8?B?Q011cTN2V1ZISGdQVnkwYUVRbXB0K3I4RVhzN0FHNWhML2FVUU03eitSbUlv?=
 =?utf-8?B?a05RSGFJNjhOT1BvdXk2UzRRT0RTNHI2eURCZXRCSlhVLzBHbk9yWEczMXQ1?=
 =?utf-8?B?dERYNm0yOEpmNFA3d0xVYkRnMjF0L3owclAzU3hXY2VkOFhCeFpiQlR1bTBw?=
 =?utf-8?B?K3ZQU2g2ODExcjVXcndHb3lnb0lENldmOWUrTUxrN0Q3RGtKdC80WWcvZHhW?=
 =?utf-8?B?aEhLYjQ1QWdKa3o2OE1Qcjc2TVl3UHphanl5Q2dHREQwOVJUa2ltYUM1Z21Z?=
 =?utf-8?B?K3M1dHdFV0tRQk13dGtQdXdMczdnODdublZPWEZ1dlFUemNIMEFxdHo0Nm1X?=
 =?utf-8?B?b0NwTEM1eWVmTThVbkdnUWhlM05pMk8xTVRTT2ViTTRjaWo3cTdzbm1UR0hs?=
 =?utf-8?B?RzlCWDNLSTRxOVBpMm9aUU50clUyeHAxdFprTHJSanRocWp0NmcyMEV2d3NL?=
 =?utf-8?B?VWZKR0tPZDBER3o5VlE5ZHVCUzlGemN0YkZjb3NXK3JWYWtCVzJKRk1pNFc0?=
 =?utf-8?B?cGpya2Fod0ZuYVNLeHh6NS9PZmk3NXlNWC9VMVkxK05DOGJoT2NqL1ZxOWVT?=
 =?utf-8?B?Q0tOY1AwbEFPZ01GQU12dEFic25sM09qdjdVLytlajJZOWVHL0NZUXhOekIy?=
 =?utf-8?B?RnF4MHJzVzJlOHZTVVlaREErU2JuVHg5NXFJMldRYzVjWXJvaWs3OElEeHFu?=
 =?utf-8?B?cVNoT1FqaGZXQnNpYkpBOGpOaFY0V0xIejFUd29LTzZJSWxaWkQxV2RlYVlL?=
 =?utf-8?B?YUtXQUVIV0lreGpBdjNrRDl4dzQvS3V2dEhPZGlSTFF5T005QTViVnU4ME5F?=
 =?utf-8?B?NVpFM0tKTVhDWVpHa21yaDVQSzd2Sm5tblc3RDF2Uk55THZDQVVUWTJNQmxo?=
 =?utf-8?Q?llzeZFKSBZpM5BsI=3D?=
X-Exchange-RoutingPolicyChecked: HY7hy7nCoVmFFIuXnNo2vNafAYrnhVfGwagXgn3j26sj2oqu5tNxyEhAxtKqNisQn40tTUefEq5SvDDyOSuFcU8wt7iyLZd/2OLTta4DYDvl2FyYNAjennTMrPnX24ThtQmSCIw7rbs4z3tmghfUMhMacHPe3WheeArzFryc9ylEDghgVv5w1JHE5txegxRcCOO6MYhgWIFC/LBErGyrbpGRWkRv+CNapsd7DgjoaRFLtthl/rBE2uI4RD03ws1DSjvjBEKuzWfpCDypvv3tvv1a15dsEiKYfEx40kfa5H2Jkr6IWxu/vrYBb1gu7YrlelUQ51Jvw2QzHfWBG1LUbQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9002433f-8518-4ffb-f8e1-08dea1d9f013
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 08:17:34.4508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTE2Pi3ZFvlxUzJaqjSlMKKF3/Smv3UFhbNVvq2KoOsx6KEDxpU8YysOwCOAZB+BrhUPMFoANsWP+m9pF0sfN85R2qkkmJWmF4/3iYZDryo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6941
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


On 4/24/2026 13:43, Shekhar Chauhan wrote:
> For MERT_OA in CRI, the OA_Buffer is in device memory. The minimum
> exponent needed for it is 8. Bump it up.
>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>   tests/intel/xe_oa.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 988c46df6..7bd9d17c4 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -2645,6 +2645,12 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>   {
>   	/* ~20 micro second period */
>   	int oa_exponent = max_oa_exponent_for_period_lte(20000);

While testing on BMG, if we use 26670us, we get the oa_exponent as 8. 
Either we can hardcode something like 27000 (for a round figure) or 
carry on with my approach down below, since OA_MERT is on CRI, so why to 
increase the timeout for other platforms, was my thought.

Now that you have the exact 'us' count for the oa_exponent, I'll let you 
decide which way to move forward.

-shekhar

> +
> +	/* Wa_14026633728: MERTOA buffer on CRI is in device memory,
> +	 * minimum exponent to avoid overflow is 8 */
> +	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT && IS_CRESCENTISLAND(devid))
> +		oa_exponent = max(oa_exponent, 8);
> +
>   	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>   	uint64_t fmt = test_set->perf_oa_format;
>   	size_t report_size = get_oa_format(fmt).size;

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

