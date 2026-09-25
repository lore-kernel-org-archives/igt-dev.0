Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE74C98321
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 12:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF6610E5CA;
	Fri, 25 Sep 2026 12:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CA4qPkc5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF0510E5CA
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 12:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790339069; x=1821875069;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=grHizFq3cRGVucSMozuPqIByM/z9CMbE7B62iK9JZ4Q=;
 b=CA4qPkc5YI30W9SZ3JBW3Vi3/dDLrpxXIHAUR197e9STlpKF4fo/LGdN
 sLphJ1wlnVR7R7Gbabs8nxzwnXg3BMBLBJFLtV+04tLatuTFssjIIYVXh
 mJaIgwMMtQ377BweYucvDLmSUeiYgVFeb+39I1M6TSrmFkap9hQkWIe2J
 dIL7/zvIqyMpwkNHqR8gErs7FZ+Of+0/o7tY6SSZpzhECUX1so1w3S1hc
 a/fBY5zwXr+klMac55pxkXqVlUs0Qa6JOA2cIcLWYTP3evELiMUSDz4JI
 t12wQ968Ep+/W9VHiAOxBv2EkOemlc5AoAzO2bk0YRxkx2f+WXUuUGsk8 A==;
X-CSE-ConnectionGUID: Gb5wB7TvS6SHfzGKKn1o3g==
X-CSE-MsgGUID: FpphOz3WS6qssfAzPJU2KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90162541"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90162541"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 05:24:28 -0700
X-CSE-ConnectionGUID: x2oNspRSSzKDgj8m7v7A7w==
X-CSE-MsgGUID: 8E2S/i3tRR+XyUahZXMVkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="303827658"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 05:24:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 05:24:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 05:24:27 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 05:24:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAA0YX8QJJ9YLi0ktzXNfw3m15VZk6OMMrzxO8n0okxe21Ht0nvpz/+s0my1dTPT3qWuIP9BBIvL/bliGzsWuhqhKtNCVcH6vWdZsAI/rrTSdd3X7VF5Zi7WBa34QAaFyaFNc6l8aiYBX99GAENg+t07HYNpMtjIvgtJUkfEDxkpufZVCYjSjUMLi+Z60ncBysR0V5OR8sOlvEyEC9esaFlmhpm6D/J2at79gj/thVCYasK0BXL55D0wu1MSXqhI70zKQYaKA625QdfxoNT8pBhCdswoITcNJ8oS58UzoWGNe9Xv1QRx0ml94lyPyabeB3pDnTJn71Q9+Z+Oy+TCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaF+wewhpLWcn1x0qF+zsk7djrVoTnRc6hGzNOuzzGc=;
 b=TRqttCmJ336G/cDmSoCGk1OHLYx5Z+RgV/E8T3rkf6D6HHaj4X1T7zV2D7swDKN/CLUIhZKSM8I932R5k7Izaqy5b2Ak9A+rdrvs7ZiCPR2mQe7xmL3Y9G9Xwv97lnBp+ZyUofvMdxWu2qFhhyMDU+sitSP7tuuATb5hCeyRncVkSk/JdlHCUwjYuu+UJT7NyyP/C38ibkiQ/ALvbtMX4RkQUQMmJgAoqiT6C7s0a/qjPV0eNQCWv06OaYuAv5EcxR+lbpRpCvOrNGGv+sEPYYls0q/bXEyrzN9AeK/TDtldn4GGhGzVxABECCWBzfhIkKfi4IYTAbuTmN/f1QM0nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SJ1PR11MB6179.namprd11.prod.outlook.com (2603:10b6:a03:45a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Fri, 25 Sep
 2026 12:24:25 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 12:24:25 +0000
Message-ID: <21199785-0140-4433-add2-5df33d7eca55@intel.com>
Date: Fri, 25 Sep 2026 17:54:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms_atomic: skip missing CRTC props in state
 snapshot
To: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 <igt-dev@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Alex.Hung@amd.com>
References: <20260923152113.1513938-1-aurabindo.pillai@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260923152113.1513938-1-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SJ1PR11MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: 60fc55c7-5655-4df7-3211-08df1affef7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: iWEjExwUC8xy5WQOS02i+eiHiOQ1xzjAtM1Fczk+BR9eROFsQI/a4V9Uweur32sseV0Fo4XM2j3gPgys78PWYSagUE7HAm3bza2PczOubMTCYtiROrBiy7x2Xiqq9N9EDDBqk82SZCWwi1godyQmhiUP4xHf0L+kk91oArVgfa4AirA5tMQvLZB+r8wCwttWyya48942Wv/Eh1kudd1OdMWZybzSVZfllIrUm9YhO+sgbrHCz6Po0xIJo4TqeeezdNABI7bKF9TomSEAAHf8SGJgxr9pGGS0U4cihuGJLSHG/dFq6wT8aJMnGCzCVvti2tPoL/YRF3U2efxuyF6ulJSAPoCQVqOiMGfHmKQ9otI5TbsiykNbaveTrqkucqgxP1wA5/JaWo0CAsCTNPFYngd7+R4XTYwSS5A3iFzQ9ew4GmopkDJBkkYnlg6QOeT7qmkdqZ3OCoa7EoOoUBTOUI+TNQ24E6gkoNIUk23+kmIap1KnIn+/C4xHlVCKRcWgD/eCJoicp+p5lIZ1IrxMrkKYy+GFknqsGTPns5AELwKwBVZXnIc96EkUhKuz2t4O6NZYwPm20JXCxTpaEBQW3vpzU20b2gmkvY+ttgRQcdV+upv32Jv/vl/YibYIrPCvBcr0toGQ/WkD8JrcDQc5OUTCn3RDotOpv1werRmrhto=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mkp6ME1CZlRJc3FDUkpSYllmN2JWNDlmUjVIVmNta3U1Qk5ZMEtLMHNENXAw?=
 =?utf-8?B?TlRiQ1BLMHZpRlRlZEI5NlRPM3BPYjZDdFNFTE00eVY4NExyUERtaGJQRVQw?=
 =?utf-8?B?T2lvc1k1N2Zvd1dBY25GdzgxMnA1K0ZsWWowdXJqaHNQTjdlYis1RTE4Q0lR?=
 =?utf-8?B?c3JvdnlVcGtKNkg0OVYxRnord0JDK2NPVG9sWTBuVVlVSFBXMUtBNDFnalVG?=
 =?utf-8?B?dHA3RVZtaE91cXptR25KcS9HOGRJV1FiMWJJWjN0NDE4WlFRaGVRQ25HaStt?=
 =?utf-8?B?QTBKZ0o4R1BHYkxSN3NGdWQ5RW5US3BidkxqMnU5Wit0aXRGNlJONFdpd20w?=
 =?utf-8?B?NlVheVRmUVh3UE1zdU0zN2w4OFhYVENKLzBLRVRoU0E1VnA0T2lNNXRZM2tW?=
 =?utf-8?B?cGEzSFhCVlU3d2ZzSExkRTN0QitCaDFqd1BWTnZqTGVzeFhUdVk5MGRHNkh2?=
 =?utf-8?B?T2RxSzEybE8wbmc2THZTeWxPdzA1VUFMS2c3a0xnTEZHQ1NJVUEyUlZna1pX?=
 =?utf-8?B?VUV6djltWSt3NUhGTmFKUGY4Z21XcllFYVdJc2M1dE1QQ1ZVUVY2M3NoWkd1?=
 =?utf-8?B?d0FDeW8yVU1uMVdpV0FwcUordWZwVkZFSHFMSDBobmFhQ05SZkpvdTR3alB3?=
 =?utf-8?B?NHNldUd2T1ZqZE5tMDkwVE5vNGgxM1ZkbWdubTNwNzM5NTZrOFZpVTlTVXht?=
 =?utf-8?B?L2NQaCt0cUlBL2Z2Vk5DY0ZPQVNSWGJzL25YODVHelZFMk9RSFZnL3F5UTZi?=
 =?utf-8?B?NGl2S25GQ2dFTzc1eGt5eDNUa2FhY2hDcFV6QlErOTJaZW1PZExJb1ltajRR?=
 =?utf-8?B?ODZPcmZncFlkMUZRblNTeGo5MHgwMWxDNHdpYjUwaC95Q01Cbmxvc1ozUEZR?=
 =?utf-8?B?RjN1a2RXYUI4THFPL25HQlJzSTNqd3UxeDB0aHUzVEZTRVJaamdKU1VydnNQ?=
 =?utf-8?B?ZHFvS3cyY3FWZXpTc1pZUnlaRmxUclNlbWVSZkpKNW9sU2NyaWNEdE82OWYz?=
 =?utf-8?B?ZVZRcGp5MkUzTi90ckgzd2N2c05naWg0YXpBR28rbnN3NDE1TnFQSGlTUzIv?=
 =?utf-8?B?QWUzWWFFS2xHb3dsdnlsYWpwcEdGVTBKNzBpTFBYcmxWamdLeFRnUWR2UWxU?=
 =?utf-8?B?Uy9Ydno4cTRpRWNhaGxMOThteUNVMmFkRHZERmp3MjJ3d3RaNXJzU3VIY2dj?=
 =?utf-8?B?R2psVkQ0NWMyQWhHek4wU2g1dE1NdCtDYXU3eWFHK3NrYStsOXpkSW95Y2hW?=
 =?utf-8?B?dGlDaklUNy9uSUI3aXBvakljc3BVb0QvQXJiQ0lLc045dXJXalliYWl4dUJl?=
 =?utf-8?B?YlFScXBjQ1BvTjVMVzFqRC9wTWRvV1NiZHRVUWtIOUhqdTVSUWRXcDlJblp1?=
 =?utf-8?B?Y1VTTS9LK05Qb1ZTT1ZLazg5amJjRnJoWDhMTzVyWms1bjlMRXV2Zm1ZdFJp?=
 =?utf-8?B?WXJuSjVTVzBTNTlxM1poVkhBSmMrNExNK0oxVXVmU1VuV3BJczNQTHdPSy9X?=
 =?utf-8?B?TVAvTXVrWE9iZld5WEp6MTRHZjNlUHIwWWpLWkpNRkptQWc4alZyY1FRTlEr?=
 =?utf-8?B?TkZwTSt4MHZQWDZuZml1cFBBOGk1VFIzWjRCdlc1RFI4K051aVQ2Q2pHanJF?=
 =?utf-8?B?TjA3TUE2OWY3YWpqZC9zZlZDcE1kYXdFWlI4aGVoTzlkVTVmaDkrd0YxTHR1?=
 =?utf-8?B?OWhTN2FNNGFBc1lldUQvL0p1WGlyWE03TEs0ZGJrZjVGWVZ5YW4zdkRzOWNz?=
 =?utf-8?B?V1Z5S3A5OWZyL3RyYVZQZmZEQlh0YW5TQzd3RzZPQUJObUIvUkJpYnBaNVFl?=
 =?utf-8?B?SkpVbkZzME9Kd0hCUmJPZ0FjUklEWFlmSnFYa1kxVUo0QVBWWjNuMmVyRjdE?=
 =?utf-8?B?VUhiL2l4S0hqczVZajd6ZUlKelJwTG5qaXR4UE8zY3Iyc1JZZnA2M3pUZGVD?=
 =?utf-8?B?TDJsYVorelpMYVhPTG1vS1c2ZXJWckM3MG51RVg2RWNQbHYrbjZCYm1WK05N?=
 =?utf-8?B?RElQcHpPV0UwalBXS3BLdzRiOXA1bytvcjF5SnJTSy9jTEN1SFd1elcwZVph?=
 =?utf-8?B?MEZUN1IvQWZOOS8xU1Ivclc1Z0xtMzZBYXA2WWVKbEJSc2RFYXBiM1ZQUDFE?=
 =?utf-8?B?RkJOSkpGME1OL01Wd0FCR0RDMnlYckE3aXVud1FtTmZxN3ZvYWNsM2RocUh0?=
 =?utf-8?B?RTlxK0Z0azczMmpGY1pBbHRWK2lFNjBEMCtUYlVLU1FNNFBvK1hHLzBsMDdM?=
 =?utf-8?B?Y2Qvb0UvV0xhc1daUEoyWXdMbFpmS0s0MzIwS3dMZUt3RWVkU0k1bDJBWkwv?=
 =?utf-8?B?OXh0M08zc1RlMjNZK0JSa2ZiUkZHY2gvbVIyb1F2VnBtVHB6dEc2UT09?=
X-Exchange-RoutingPolicyChecked: BK/ZYf/DMXDWyB3aUZWXDwOvSJ+5XHID6ezteB8NFkKENHNP7gyj+EDZJ4q00xt5WpmTetjoPFoa7UvgFSAcH5DXnRyUDt30ggwHo9IVvkTxdOu9GCmPVo62yCEi8HJByqIP2Pjhwf/ANHUG2U+ZXuWVQ75sUUShMsSIxcjTeTxZByNNFtM3SWBsjNcaDOnwxGUtLcJkIVCjx5o8MO+39zQmGqGuQEEGblC2hp7lbvcus8uVwk4igX1+wBrDBfuFLWVGrMxTicAxRYo1AGFzdRWGJCdNh1VpeSGor60jOpgIHF9t0r7f+rWAxTRPyjS1QdqMLwjgc3+lMhIceykBcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fc55c7-5655-4df7-3211-08df1affef7b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 12:24:24.8236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 569dhwyDid3Kf5V6H4aMhKAFZcA917DZI8wqX7ouqVZd5a5De0qzfa8K6qtNoDEOaFEHbvjzI69m/h9QEVcEyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6179
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

Hi

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 23-09-2026 08:51 pm, Aurabindo Pillai wrote:
> crtc_get_current_state() always calls igt_crtc_get_prop() for
> BACKGROUND_COLOR after 10fc80949. Drivers that do not advertise that
> property (amdgpu) fail igt_crtc_has_prop during atomic_setup, so the
> entire kms_atomic suite dies on the first connected CRTC.
>
> Only snapshot properties the CRTC actually has; igt_crtc_reset() already
> guards the BACKGROUND_COLOR default the same way.
>
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>   tests/kms_atomic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 09b7915af..20bb80182 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -230,7 +230,7 @@ static void crtc_get_current_state(igt_crtc_t *crtc, uint64_t *values)
>   	int i;
>   
>   	for (i = 0; i < IGT_NUM_CRTC_PROPS; i++) {
> -		if (crtc_filter(i)) {
> +		if (crtc_filter(i) || !igt_crtc_has_prop(crtc, i)) {
>   			values[i] = 0;
>   			continue;
>   		}
