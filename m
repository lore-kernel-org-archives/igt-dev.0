Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0E5FF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 06:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD0110E054;
	Mon,  4 May 2026 06:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S1fO6CcD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D66210E3AF
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 06:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777877479; x=1809413479;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/7fJIvlkHePESGCON2s51jAW6f8r0cyyPf3qba9MMYA=;
 b=S1fO6CcD+PnBc3EGacyFd+dnvNg1GTFmYrZWLgTzDOXZbgK++AvNM9Ij
 3/TUFhMsEtmjZzdgEjgBqwdZqmuRnLc4WyHNwMhJflpNu8aBtuQZ1d1eV
 LfDobE1fNadMwdZrK58cxDIWdSSPhRgx++1DlkArhp5QU+pAugQhjQL49
 Bn4q3xkRzEa3+qNuWrwV1c+cVp6/HSKkkU2uKF4u/KRIEvQqLnrCxC34T
 7CWnWzxdX+dzNTiYQmaqEi77yIMjCvR2Nx3sTj95KpvnHDOycv0lbdtal
 gnQ4GltSjnXOarui0OfasAwhnB1K66wcR91aRh4+7UsLvtpEWJlETfTPR A==;
X-CSE-ConnectionGUID: kyTdtqWbQsiJik9mI+zoqg==
X-CSE-MsgGUID: /VanjY0KRQmACHlF4KAZbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78722001"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="78722001"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 23:51:19 -0700
X-CSE-ConnectionGUID: Ht4Axmx/QbqxzT4AZugrvw==
X-CSE-MsgGUID: cr0s1f1mToiAvTVmjESmqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="230837048"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 23:51:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 3 May 2026 23:51:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 3 May 2026 23:51:17 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.33)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 3 May 2026 23:51:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6YMbv3ru2dZjXeUO6B105WIScWFNi3cq32F0/PJmyVM6NmhMKifuG6zFjmt3k9WoPujDvghrwknjugIb6JD1Vm8OuqXFQbbbggKh1OLTO2DNNucvCT/BLdYQTiFEML4ncv2AYIhLb/9iA03m0y7aMmZo7nLVeaZ5Rdfxix5oNsu7rvYlbHmhgCZkOv9uq8Vy88KzszsBtoPCr7JKNXySEkTzXl8BvjVYCzjn406FooHajvL2mBrAMkMipB5Midupxu7MDXILVKS2jahZ+nZu7zPKKz9HlSh69t6i6o0Q5g6Em1SidNRi4nUEu3LIcQLsLbRnvRnY0Ur3+Xv3ZRCXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEMKI47beXpqf2YrtYcbaNfOZ8S7fLtSxkaCHH107lI=;
 b=WjkTUbNXZtLi320H0EkOAmculzdNz+0KXw22Dww+oIZgcIVO7S5aW1+TaPocUT0wC7eRIfI2/GQta6H8RttfQQb3MjlGOfboKPr69sb9aRxncsdBwGbljF4JHtEiQMPXn/pFI4bg8KbKxN9yHyDnNDLMfSA4tTfoS33NnGSo7emq7HmiZkkrRRE1yTuWeHT8dxE4l4898TPqL8+abAxZlJ+FUeuydKzKmKdkuY0ULhphG2X38fCVIOw1jcRrwsjr8dswkKTBF08y/+4vCeXVnYWxtuPrNhVY6mVk8gNQyz5SPWCecPqaywIPg3kd/WgxK129Jq+1FfFxdgAg1VvnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by SA2PR11MB4889.namprd11.prod.outlook.com (2603:10b6:806:110::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 06:51:14 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 06:51:14 +0000
Message-ID: <6a180c58-b3a4-45e3-a327-f2ae4da8c471@intel.com>
Date: Mon, 4 May 2026 12:21:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 3/6] tests/intel/kms_pm_dc: Enable DC3CO test for
 PSR2/PR modes
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <dibin.moolakadan.subrahmanian@intel.com>,
 <ramanaidu.naladala@intel.com>, <jani.nikula@intel.com>
References: <20260423173403.123706-1-jeevan.b@intel.com>
 <20260423173403.123706-4-jeevan.b@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260423173403.123706-4-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::32) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|SA2PR11MB4889:EE_
X-MS-Office365-Filtering-Correlation-Id: d66cc1a3-0474-4259-209b-08dea9a988ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: dLce1VChpGeoLJvOYmYDAsBLYn2AVR9w/ysiNiXsHtOa1COcqBq9OUvcuPPV40ofPNwVh9iYQgOz+2ZJJE8slXaUMfXp5OWprR8O/38wUZ9VZ9qEQoWDj4wlWPSD5oE0LprVwq8Y3ph8LaSKnJ6xoS15wfsSXNTJWfk5rKsEYGDwGdfGUoczSsYYpCaCuOd3kX0pJjQPTFV7WPOzdoA9Qrh4aIn9zJ5+mXZDY/fU59/AxD/FnoBVmY9AO4O6oPnQKgtfIyhbYX72/uLvrwJkXileb/9HJ81J5SROOise4hSZC6RXLckBRAwqD1AELk/Gag+OY+wq8LBhTTCYYuZTBqF91OonwMbZmeJDlWnIXGSJo3z2o5KHGRW0KgEbN8Fisd3Dhw+tOKmc9w/RJnR7CEUzn8AZbrSQOl8i2lPxbby8l1GgNrf573QavdaAqx315z/BHU+R0lCTyzCtPql6Bu6k0cU6e7NowRIFqzko92hrNPbttRYErFh6xiqBDTnxGW/ne7LUH/H/gv167iwkZZFIKfcJq/SdS3hWZdv5M2o3E3L9lywRomCrvhTCB73pWkyyOHWqRQPPoVLw5JgdyqSbeEMmqAbzUSLMbtCZh3z4RmblFuJziHP77+OcKIHeFMdaQ1xBMu+7u56WN4Bj/tPbjHVkmOABq/5UR+HUitZ0kL/cKB3lf8DR0T0cMgJx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmtLcHNkZUxnditCZzh5WDZNUGRMNS9aSUZOVEpNZTUwSEp6TWRqMHI4NGpp?=
 =?utf-8?B?cGg5VjRlUVFrczM5V0JvVlZ6UG9wbHQxM2xyOU94c2dJR3lqcmJnYzl2Q3VQ?=
 =?utf-8?B?bEwzTkl6d25HVSt1NXFIdyttUTAyUWt4dUw3ZTN5S0U1dDRSTFA0VTVDcEUr?=
 =?utf-8?B?dmU0Q253Q0lDSFk2alhIREV5QmJRdStrMDhOOVBDZFFXcmdDdWtxY244RkJQ?=
 =?utf-8?B?T0NsMU9XUStRL09KVktMc1RlcW1YWmM3VjBRNGl3T2EvNVdWSmQxU1E0ZDlV?=
 =?utf-8?B?ZTVyOG04NTBFamlUVUplcnRvR0UybFBRY1BJVHFSYUdxTVJKa2ZZckVmU3k4?=
 =?utf-8?B?LzVZWjd2S01oaG1JSEpwV2I5bmd3MmNXc0llZTBVYTZCcmFBV250VEY2VEJm?=
 =?utf-8?B?R0ZtNTQxc0xFTStoOWlDWFRpeXFQdXkxWFBLUjdpajRvQ2NZcU1DZlpuS3Fn?=
 =?utf-8?B?cm1acXVtOUp2L3gyc0dyV0VtMjZuZGM4TlpwR1kxY2xRdTJQZ2grdlVIMnNw?=
 =?utf-8?B?TXBBV082a2VSQ01qUEJyVjdESkhBNjg4UHhjTjFJNkJIb1ZiRnlCR3hzSEFu?=
 =?utf-8?B?T1djSjRBMGNxYXZnYTFmTndFV3NvTUt4QU9IVFEzamdqK3BtU1I5bTRNWXlj?=
 =?utf-8?B?R1NDeWpKZ3ZlNmtySFYwV1dzRU9LTlhibHcyb1Z4V25yZTNiYnFRS1ljNzVL?=
 =?utf-8?B?K2tsZTM2elhhT1N1Y0hhdlNwSDN2RVNONzRFNUs2cFhCYWJPMzUwL1JvaStK?=
 =?utf-8?B?ZHJ4d0tnTTdvYXNyRTJuT05EM3lrTi9jczlVQjFONTF4K01WUmM0c1g2SDUx?=
 =?utf-8?B?VmxNZENqNnFoR09LREtBR2V2U290MUxEamxIRG4wTGRYU1pJVTBYamYzbXNY?=
 =?utf-8?B?YzY0UFhsN01aVFN2QlJVRkY3QWVuR0QwVGdyVkR4NnM4ZG02VXJBTXJGYW1r?=
 =?utf-8?B?NlQzYXpuZC95RVJpSnM5azFBVHBiSHdHbFF3OVh1UHlXcE94VWVHREIwM2dC?=
 =?utf-8?B?d3VqUjJXdHFxZm5kNFZVUDlrb05DSk1KZVBvd05TT0MzUkFleWVmbDdsRlVO?=
 =?utf-8?B?UGlpbFM0ZUVwS29xcXR6bnM3d3MzZ3NsWUVUaUl5RS9EQkxZaGRJRy96bWpl?=
 =?utf-8?B?NUUzdm9NUW5KTk8vem10c3cxZFdSL3FZaWgvRVl5dUdKS2JoV2F0L2wwYzlV?=
 =?utf-8?B?cktkYjB0V3d3NmR6bS92YVAzOTk1YXorTEJaN0JLbThjVHg3cHQ2ZVRxbW04?=
 =?utf-8?B?S1RyY0VDY1gydmU3R3JqOU1KSGc3eUw0VzZjamRoM2RLQTFrdWEzdlA4c0VO?=
 =?utf-8?B?WmZHc3ZxZGtZN3ozVFE3Mkc2WXhpOWcvK2I4TTdLRG8vYUpwWGlmT0hnemdo?=
 =?utf-8?B?bmdWM2JVS0FYVHI1MmpGN2FqK1pPdHZVeXFGUHRIYzArNG9JVzRrRXMzU3pv?=
 =?utf-8?B?QUdvOTNDcHhDOXFveW5kU1ZhSnhnUjZDaU04ZXA2bjlQZWdiS2VZSS9Zc0lp?=
 =?utf-8?B?L0t3MXpGaUsvTjFWWkJkaFB2UmlEeCtoNXA4WmxzcjRjQjUrK0pwc3BCNWZ4?=
 =?utf-8?B?UnUrS3c5b2RuYjNZakZzdy9JZVo2TjUyMi9CaHZvMlA2aFBucUQvbDFPbTVX?=
 =?utf-8?B?NnJnSWg2NXZyT3ZuQ0E3SjIrcTFWN1ZaOTBzbjhoQW45eExPT0FXL0l2Vjlu?=
 =?utf-8?B?S1NEbHMzK1BtdFUrMStqeFZkSEdqRGNoMGh1STY3Um51U2g4VkJOWnpuQ2ZW?=
 =?utf-8?B?UXNLdWRPRlN0WnJGaG16RUJid1A0L0hFaGtlUGJBVkkxTFkwb2I2V3pXTzRQ?=
 =?utf-8?B?aitKUXJLS2pJM1UybHdlclkvOGpjc3EwcE1iVTdhcWdoM3FvcEZwSnNSL0kz?=
 =?utf-8?B?OHBvdUNjaW1TamFHT1FRczMwaHcwZkM4M3NLZ1F6ZFNwaU5FbkVjZWxxV0RD?=
 =?utf-8?B?eE43b1ZsczYzdTNidElZdHZ3NEtYSEZSR0pkS2IvNU9HTVJCMFhaMGt3Qmt5?=
 =?utf-8?B?WlJGNlllbVd3SGRLZ1hpRUpSRnFtcCtuVVBlYXlEVk40SEd2UncrUVIycVVj?=
 =?utf-8?B?OGpKNUU1TnNWMHZRR0JhUm5TbzNxRkdqWWZETG1YNHh0Qk9qL1Q2REloYnEv?=
 =?utf-8?B?ZHFabWRjOTdOTFFpcmppZHh1UTdPRHFzbW80MmVQNEZCaVJzd0tpcTl0dUZK?=
 =?utf-8?B?TCsyQUhhMHNTVU5hWVJoQ2hDNTVCdklES0JpZVIybmRxRFRqT0puUlIrdWNE?=
 =?utf-8?B?T1oyK2wremM0My9TTlloNHlrc3pacTliQnhGVWJ1c0lYQlJpVDlUZlNoRzVW?=
 =?utf-8?B?M0w3UWZxWTMyVmNFcE40bW1lL3A1VGtnbnpVVE04QU5vNmRBQ2w3a2hKVlBi?=
 =?utf-8?Q?lxhRwmSWbormR9MQ=3D?=
X-Exchange-RoutingPolicyChecked: GS2rlThpB702jrgfT1SM0bCVl3KmrHYmQoUVsu2zY1j+1wgGLVhCTLdJm79bc2mRx1P2VXuQLvnYm1FwKKC6vclsN5ARpzw0WW7+P1hcsfkvZ+Es2jzfCfaX8bajbp3nLNhHdKUsD4lVXD4hwvDtETKUoYfBu5+T0BGrN0fYI2EOB3nJZpO1eZIF8RfQAW9j/LjliybyVhwDZC8FVhuGSbtbYCZWhnmQtMEfP5GprdnpsdnheD7J5zhKTouGRmbQRPI6JpoWs1Tsy5Y4jKsG04K+yjfxyBKZlNo26xugFjnWqFro7gTXKQWwOrTo907003OTdSN1GNniAMcx5AGjZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d66cc1a3-0474-4259-209b-08dea9a988ab
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 06:51:14.6370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvMmsS+mesfJE8tyeY3znpUdc0GQMHDtU6A4wLhbPox+8pCvM2IJ7uavOOCBCl05p1vNXyYpSOsd8tPEmyn1FiS2eWz/5eeIl7tTKqZUQbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4889
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


On 23-04-2026 11:04 pm, Jeevan B wrote:
> Enable DC3CO with PSR2/PR mode on TGL and for platforms with
> display version greater than 35.
>
> v2: Fix debug, remove trailing dash and merge mode and char to
>      single strcut array.
> v3: Minor cosmetic changes.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
LGTM:
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

> ---
>   tests/intel/kms_pm_dc.c | 50 ++++++++++++++++++++++++++++++++---------
>   1 file changed, 39 insertions(+), 11 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 27fa5dc39..83652e9f8 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -110,6 +110,11 @@ typedef struct {
>   	bool runtime_suspend_disabled;
>   } data_t;
>   
> +struct dc3co_test_mode {
> +	enum psr_mode mode;
> +	const char *name;
> +};
> +
>   static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
>   
>   static void set_output_on_pipe_b(data_t *data)
> @@ -319,18 +324,20 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
>   	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
>   }
>   
> -static void setup_dc3co(data_t *data)
> +static void setup_dc3co(data_t *data, enum psr_mode mode)
>   {
> +	data->op_psr_mode = mode;
>   	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, data->output);
> -	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output),
> -		      "PSR2 is not enabled\n");
> +	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL),
> +		      "%s is not enabled\n",
> +		      mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
>   }
>   
> -static void test_dc3co_vpb_simulation(data_t *data)
> +static void test_dc3co_vpb_simulation(data_t *data, enum psr_mode mode)
>   {
>   	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
>   	setup_output(data);
> -	setup_dc3co(data);
> +	setup_dc3co(data, mode);
>   	setup_videoplayback(data);
>   	check_dc3co_with_videoplayback_like_load(data);
>   	cleanup_dc3co_fbs(data);
> @@ -658,12 +665,33 @@ int igt_main()
>   	}
>   
>   	igt_describe("In this test we make sure that system enters DC3CO "
> -		     "when PSR2 is active and system is in SLEEP state");
> -	igt_subtest("dc3co-vpb-simulation") {
> -		data.op_psr_mode = PSR_MODE_2;
> -		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     data.op_psr_mode, NULL));
> -		test_dc3co_vpb_simulation(&data);
> +			"when PSR2 or PR is active and system is in SLEEP state");
> +	igt_subtest_with_dynamic("dc3co-vpb-simulation") {
> +		static const struct dc3co_test_mode dc3co_modes[] = {
> +			{ PSR_MODE_2, "psr2" },
> +			{ PR_MODE,    "pr"   },
> +		};
> +
> +		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
> +			enum psr_mode mode = dc3co_modes[i].mode;
> +			const char *name = dc3co_modes[i].name;
> +
> +			igt_dynamic_f("%s", name) {
> +				igt_require(psr_sink_support(data.drm_fd,
> +							     data.debugfs_fd,
> +							     mode, NULL));
> +
> +				if (mode == PSR_MODE_2)
> +					igt_require_f(IS_TIGERLAKE(data.devid) ||
> +						      intel_display_ver(data.devid) >= 35,
> +						      "Platform does not support DC3CO with PSR2\n");
> +				else
> +					igt_require_f(intel_display_ver(data.devid) >= 35,
> +						      "Platform does not support DC3CO with Panel Replay\n");
> +
> +				test_dc3co_vpb_simulation(&data, mode);
> +			}
> +		}
>   	}
>   
>   	igt_describe("This test validates display engine entry to DC5 state "
