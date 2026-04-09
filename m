Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A629E98FB3
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 06:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0951610E11D;
	Thu,  9 Apr 2026 06:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="he5KL2ND";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC7D10E11D
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 06:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775714796; x=1807250796;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zP8jzNQOkxomVxifJruQoneOAx0WfbIlN98LWwlHt8Y=;
 b=he5KL2NDenVKHKld1hzlzOQGzVArYC4CRiLfC0WdRAsbOo70U+M0Axei
 rsBs383ng8i21cqBiSqDbN9XHXFVJBJDUDrYYR90hapynFlD+a/8ceE9g
 7fRzy6yKTraVtzCQpmLPcKAP3JiXUow7lj74YO+pQCckc11RHSrqncuex
 Jf5yzIPnEpp2FpuAxiFaEqZnfVtQAvWRza5v53yh3HTTMtbXEWEtvp7A7
 12GzWNy4UYX9os+MvsYEm8/4zdGPNFTVFlfUSFEZHbNu4yzFdqFeFgTZk
 i250HWtKpQtCdh9p/Sj9hz0fcXtEdSfi2w/V0Kae6i0VUQKGJFWoZbTH6 A==;
X-CSE-ConnectionGUID: kpF9e2zrTkKoaSxBL/9nDw==
X-CSE-MsgGUID: YWFTrwJ+Q/S3Qr723ehj0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88098826"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="88098826"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 23:06:36 -0700
X-CSE-ConnectionGUID: WI5J9Q9ETX64j4qeq9SgjQ==
X-CSE-MsgGUID: 1bJwbVbAQQiyromgiN577A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="228918662"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 23:06:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 23:06:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 23:06:35 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 23:06:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haPy+DWe/VVEjy4YAASGzoANm0OaBB3T2KtiivTm457xm8/7IBr7RYAEuWR45bQ+RV/NMSJWt7SeBzdwl7XFMhrI0aEWBZEIR+MA4Hdho5iWbZjTeGq64hLaKCbsifdfu+TwRA0GwuFrkRs9ttfa2nVrcYemSgQUv/7h2sbldUBWV0OKFdOyRXs8Mi1/u2G0DvPN4OmSBrFrO+xeHxjKmDmvI+E5kMR3Z5a/s37+IeC37keUPjEg3CpSPaLv9kF1WgYOwuw+DRvK+v0/lyQ8huldH9U6JjDs53e1MhCr5FFD3vVxcR9cD91l1DeLH3+pEpLSCyGypLonO9k5AopbGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0s0zwr3K9m7fI5hrreFHYEP4ekHO0l7JdWrB/mYwOE=;
 b=MCmr3bQKKfGRbfincvxmWPhlvtM9axhA3JLApnNmIoBvkamh/u8W/V0xArL6Tqzkfl5cAt1Z353auNjX6b6/S0i7dgeBHhGydpSKNmOMQhslFxM7Wk9EeKJqcRG/a/TzKXEiWZJjiNNRtxymOziNNEJixpWnDm7/cwYvFaUjuckRzDVSHS6bbuqVPz2hXmxuHiQATFCOk0FFGb+jFIQMjBBs+2SAivZIF4liDjRS3JXpWKAXE/7JmWQ4RKvckmeQRheZg+O07qAy0BMorzvG1L/Rh2BgXHr5QqtDSx5M7b+K/IcQTC/dKGvDTZVebw8sulQ7+fj+Uhul+j6Ny7hymA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Thu, 9 Apr 2026 06:06:32 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 06:06:32 +0000
Message-ID: <949079fd-cdaf-4c97-96bc-c35473fbc660@intel.com>
Date: Thu, 9 Apr 2026 11:36:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_frontbuffer_tracking: Improve
 skip message
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20260409052614.1036375-1-sowmiya.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260409052614.1036375-1-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::7) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DS7PR11MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: c5deac49-b4fe-4af9-4104-08de95fe25d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Kq6ihT0ozcyYMkVf/dVtGRLz4I+EdUisW1gWGjyyihWgK2JQK6nC+NzuBocZJFxNpdirSiPJAnmBzX/whlxaZ7JieRstzWFxTK96jjRiZ02Uh84bxLy8mSbsWe2Tro9uMnIFQ2tyq7JP8WuG8kJuXQAzEoGBXerqpCzheZBSmAPE/egFBerELwNtOis86IaZ6WQKwWYRdxX81Wa2wrNKO20l2tW1AvrcGAwvvremv3WRtC91yg+jqi2s7dbuOYfR4Ihx220usuy1DfidiiOhL1+cjKhPXXd66Oo9sUd2V7XF8uV2hxt/j+eyOOaDjKuA4MXQnHm96VXLK8rHswwdP6EjYgMDohywPkbeVGTfxGzMtVFCuaSLEeUmi/ksCpGPkYyA573Cm96GU1oOQATtwNxofDjBMCvVjymRZV3lIPGk44tM2aGnF0/KVEPX13mZ4E5rDeqBwMz5wyIQR2Ih7bMeGcN/pGhN5u6mr1RLVz/72zjBI2wh/2BHwoqEJLvZYN/eB3W/L5K3B1hvnA/674Sv7Iy8rl2W241LO+7ONOJtA+Y+Rq1WywwFlngQvQfk0+JlSqvCIe6AHePg450BR8CLnUOLeaMxktxfKUdyRijlRzvNLSWPE9a6EQ6rsUGRW+bhHCuyP/E8IgYT9CRNFbh2bWlYo53TLKNBVCm0aU8TY0g02pt2pLZWOeq8gqD4YFsNa9CU6lYQwhpTEK8OOLRm4LYv5lYlGl6tXyiqK4A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWQ1NkRiVzZyOEQrSnhhdlNQeFJYZ1NnckQza2J5OXdHaEZoMnUyb25uTVZF?=
 =?utf-8?B?ZG5zdXdpUE8yUW1LNXVSbTRkQTVrYm9ZdWNtdXhaWkJyWURpWThGclM5UDdT?=
 =?utf-8?B?bVRTcVJHeTIyaTFVNlAzYVNaVVh0WXoyWjMzQTNIVDZHMDdvVzgyYW9MV0lE?=
 =?utf-8?B?bXNKWmpuWlNVT1FzMHZnUVZFaEJjRTNFTmxGTnhDclpnakZxRmN6ZDVKY3JX?=
 =?utf-8?B?Ym1jTmFQTmUvNEdUNTUyVXcyQ1NVbUlSTEozY2h1clRRQ2Z5am5Sa0owaXhY?=
 =?utf-8?B?NWZxdjJJQUc5SlA4d3Z0cEhrV2h1U1kzRFdhUURRYjZWT2hiZk56dkVQU1JQ?=
 =?utf-8?B?bVhLYUpOYTVySVVHZUJnVEJjOEpCK2dnN1hHVDNxbUExa1E2Ukl1ZHJLUkQ4?=
 =?utf-8?B?ckFQekxlZDRmN2ZpQzhQUysxdEs4WjlUSFlPSnJNdjlWWGRheSsvS0JyM1JZ?=
 =?utf-8?B?ZkVTOGdqdVlaTHpUUzZML0hTRW53MU41am50UG0zTUlaTTZDY015YnJaZDdp?=
 =?utf-8?B?WVltc3NJWmtKK0w4RHVFK1I3dkJldDFIaVdSM3lJTWpqSE9qSjQ0NmMxK3Nu?=
 =?utf-8?B?UFBDZ1BIQW9tYXFlNmRob1JSbUFWQVlsekJnaXorazF6TGFZV2Z6a2FzSXYy?=
 =?utf-8?B?Z2lNd1IySzI2QmNPSlp1YjUwVy9MQkFDb09jQUYraXJ1dU5rQVdmQ3orYm9G?=
 =?utf-8?B?eitCKzJEL2QvaW9JbE1XaW9jdm9RREhNM0xKKzUwSXU5KzFWTlJ5MXlpSzVm?=
 =?utf-8?B?TEZmTFFENUx1UVBkMVl1bVo5Mmw0Vis1bSsxdm5TVERSN1QyVTZmWU9jdWN6?=
 =?utf-8?B?UCtBWjFnczMwUGlvSUJGUkZNSm1nWXliN1pqZVRrbTVIVDVwYXdwQmxIK2xT?=
 =?utf-8?B?MVZQZE5wNm1HRVkwNHpPdGxkMVYzb0szaWpjL1NNbko2M0FDYzRwakRMbWVN?=
 =?utf-8?B?SHo0SFR6MDZTRE5WQXFnbnR0dU5qZ2t1NmthQWo0K1hpNENpS1BHSDZ3WlRv?=
 =?utf-8?B?bmYwZFFhVzQxaUJrMG1PTXpCcENRSXNQVUFndXovd0RvdlF0UW91TlMycGZD?=
 =?utf-8?B?TGxnOXdLMEIwMG1iSzM4Y1BWVThKUFpKWURrODNQTzZKTXAyRGhkckRPU3Zv?=
 =?utf-8?B?bUx1UElYNGlVQlRDNk9SWEdUUjVCUWRXSUdYa3VJYVJvYXZuZG1lRzM2REpo?=
 =?utf-8?B?V3R0Nzdock1HN2wwRVQ2UUtxUXllUlZjWHVHVk9wVFZnUGg4TkNnYWRSMWJs?=
 =?utf-8?B?RmZzSVlXZncxSFVuN3ZRL2VMM1BqN0MzZVF0Q0J3dXBsNGxxNGY0Q1ZIRXVT?=
 =?utf-8?B?aHQwSm5sS3g5bzE3a2NaVjJsNnlEdFZtd3FtaVNmRVp4ZjZmdC9GVG9mcWFt?=
 =?utf-8?B?aVVvQlFJM1NqRWJqOGR5dmdQYWRMZFBrY3V4Q3Z0am4vYUZpQTJ5WDE0dE5w?=
 =?utf-8?B?RHF4RnJQQ3VOUDhDRjI4dzd2ekxFSDdzNC9sVXAvNkRPcDhiczFaNmY2WEJm?=
 =?utf-8?B?RVhVendRcEloSXFSRnNSQVJrcVNKNURZeU1ScEtnMWtLR1ZxV3hvcGFsYkhk?=
 =?utf-8?B?d2hSa3hucHFSLzVqQVlNVm5YMnUwK0pESVptUHNzMTViOFI3bkE3QjdwMGVq?=
 =?utf-8?B?N3g5S2MwMjNudmJvSUNONVI3MllGNnhhS2VGYVNrU0hRNkdlbm5kclcvVVFi?=
 =?utf-8?B?TVF0cUh6TFEwOEp1a01OK2xXNVlKOTl4YmVDUmNKbVoycGRIdWJsUURvVWlo?=
 =?utf-8?B?b091TGpyZ1d4MU1GVHF1cTNCV3o2R0pCYVE2ZlFRK0RLVWVlOEtsQVEzc0xH?=
 =?utf-8?B?Q1Z0NWV6Rmhwa1VlWW10eEJKTFUxMXJIaDNhTWE3SmRtalVTdUN2Y29TWGEw?=
 =?utf-8?B?SmVCY213UE04Wlpmc05kc1VoSkJ5SXRwcWpZTmphT3dZTWVyVUJaTGNjOTVt?=
 =?utf-8?B?cUpjVjNJQUdJejdYcGQ4UHRoVEI2MUU5UkczM2Z6TXBDMDFmU3JRN1FYenZW?=
 =?utf-8?B?NTZib3E2ait0dDJSTGExWlh1S0NZWktWZVF6U3pFS1ZGMnZYUG5BSG1YYitH?=
 =?utf-8?B?bnV6YTFvTkx2d053bC9GL05nNkl3b1hETmV0ZWtNaWhMQTJmQ3B6ZWNzb2FK?=
 =?utf-8?B?YlUxK2oxeFRnVk9QYnRmTzM5ajU4RE0wN2NkcmhXSHhGcWpzc0M1eVIxSmE1?=
 =?utf-8?B?WmtIc2EyUGNxYzdOcFlnV2dsTlEwemJQWXdCa0ZqTGVmOWJPQW9FZXNBQ283?=
 =?utf-8?B?WEVwWnpIdklxbXQ5REFFZDRWN3NwaCtMTzE1R2ZacGxrMWJDdzgzKzdkR2Jx?=
 =?utf-8?B?c293dHhOdFU4d2dJYXVnREJwZXk3bGRjSVdmSEtQUFlMNWlacVRFdy9kaEVX?=
 =?utf-8?Q?59+EaTFoKA8tiygI=3D?=
X-Exchange-RoutingPolicyChecked: okMi7S9y3fzPJNxmEBK3dXoR5BwO6g9Xad7q81tRT45q8oPWxXgJnkhgFF/6dLAgFrcyHkkcw4S7ZN/ZIsJuK6/0oA7B+XKJNo1tk1656OEyqcPrIu9h2PpBXup3rNy9c7znuuhic8JA32swraN/WerJ07KGCrrdyFzURLKXquBNntJHYr2GDtmtDnMyykogLnKnRL3xDD0qmQUjkhRfza+1+0RBe/NOB2CX2yTebjXENjbjoO8EjEZ48CejxCopRcFIfDpzp1cPJamEqZ4ZqPYD0IDd5nRfXCorLoo1Xrs8dzrE7q2ARDXjR+Gm1CbCf8z2Ni2GWt9xoC3YlObI/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: c5deac49-b4fe-4af9-4104-08de95fe25d9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 06:06:32.4703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eByMzavyX8T+4eKZG5xm+4x/z2c1N8OK4pfwvi2gjeBIp+H62KKFzp7pjAiFOQuj2L9vnEz9qGi5aGtNcfqhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5990
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

Hi Sowmiya,

On 09-04-2026 10:56 am, Sowmiya S wrote:
> Improve skip message when igt can't find two
> outputs.

Commit message is lit bit vague.

Otherwise patch LGTM.

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index c16f63199..8b73e8505 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2548,7 +2548,7 @@ static void check_test_requirements(const struct test_mode *t)
>   {
>   	if (t->pipes == PIPE_DUAL)
>   		igt_require_f(scnd_mode_params.output,
> -			    "Can't test dual pipes with the current outputs\n");
> +			      "no valid secondary output available for dual-pipe tests\n");
>   
>   	if (t->feature & FEATURE_FBC)
>   		igt_require_f(fbc.can_test,
