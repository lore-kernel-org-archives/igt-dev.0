Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9425F36BAA
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 05:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DE910E0F1;
	Fri, 10 Apr 2026 05:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvAdd7uy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE5C10E0F1
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 05:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775799650; x=1807335650;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+49PUq0gAO81S/YYTUVXP/9kX+cwvnyBS+YjbqywLWY=;
 b=gvAdd7uy7HtNQrTsNYAiJHcoTtZoIgvjmj2prHs/xH0Fx+mpu8e7Bx86
 hc/jKj2wd1p86FkPm/2iUCO9IQdOGA1YdtlOycltyctu8qKxBVxtqawKX
 PFY6QFbCVcFo0vm8puZXCU6Q67pi0cK0b+qXKcL9FRmFX51A7nD7PoSZv
 gcXCKaPacude9tQ4RAWftlcZK5MK+bgpV/wHxcNBq4RxdWifz2n8o8zBr
 GhNsfIC+1UqOqZuLcmsGm41pM22KWA5+PPafnzwRk9VlDxx/s1OrcvOOR
 GWYnqfHAiPSKnxxxV1T/iswUQc96v5xszofHO18CV98xvA4EJqreN4V9p A==;
X-CSE-ConnectionGUID: /X51c6mdTbOMnkyLdPytnw==
X-CSE-MsgGUID: //ORRq6bSZm1P8zfkNWJEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="79401505"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="79401505"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 22:40:49 -0700
X-CSE-ConnectionGUID: PWogUT9pSheiVY8BIzVsKg==
X-CSE-MsgGUID: bC/tVx7ITC602e7y1xHjCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="229272952"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 22:40:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 22:40:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 22:40:48 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 22:40:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3Vqs+nAcihgfglECEDG6PA0N6yTBOwC2LSKfL3xSgldbNkU7xNWD9bMkHgCn5AHjlqY+dhx76fdR8LU7nmFFFqmiH87AKPGVYBpidizSGSXYa3Kn/JJzkKaP/v3zxdfS8u43iXjLlO4L4lZLUM39UDtHYPzHIDNxmx8U/ADJ2srqOUI11BPHnj304X9wZmFJJgGnwuD6ViC6Rg3BQspvWCQ4z2FFmepmfqVnxrnoabL6lasJG9oPV5z7dHFWhtA0Xvj+GJVr6D4WmGaskwO2hR/iLhG6ikKqbqXsIUrYNtJnTo6bCLalZUHwLBL/Xbu6xYNkjlg+aZWo81NmaQRzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmhCfpVl+diFwLgSey3S9twBz6/uI+V9W8jc6aFymjU=;
 b=lIyuoq9seV28FjbxD6VxoP1YRKYjJpaeqV/l1ksuEUvC/uokIlMOn7nt1NlxbiYs29VMjfCQP1J4hw9VMItu0pfQBNnKfHIvWMNw3MW2NX3eAlogAz2Dlr2JrodBxSlaN+sBmf5/P3lBW8eugwDVgqW1RMADWdX3jSrHFMeFFUKpU2prLYoMjkingbx9TwGZ8wC43FLsrFYLEM8rN+zTzbpYlKwBOvsMHx103vd7KGFovJ2a7Wj4C/iy45wkF4P7ivKlMRmLu65AUVGMMrfL5T4OIfCBMILAq2olO4Rd7zc0bTaJx7zWT97lOlG/T1/BqeP8hVL1aCX/4K14MiXiBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SA1PR11MB7110.namprd11.prod.outlook.com (2603:10b6:806:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 05:40:46 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 05:40:46 +0000
Message-ID: <4d0e9678-1d51-4d20-9122-448b7a5f957c@intel.com>
Date: Fri, 10 Apr 2026 11:10:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] tests/intel/kms_sharpness_filter: sanitize
 subtest init
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
 <20260331190412.1907571-2-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260331190412.1907571-2-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::18) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SA1PR11MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 40bf56f0-880c-40fe-cb1b-08de96c3b6a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 2OC581xaGaYWtrLscK77lcX3rJtLWu7OAqMkVrKkvYA44THyGMYoK3IlEcyRrBgYawYA5omEoDHhJ0e4fAoJZLF6I2Evu4Oarh4hb/iqPBj41VQh857quTHpfrNWmb1lHak38H4Ne/6kb6MjjrIr2Ot40HZ2wzgw9246nGIacSBhVWvElbFzOFPeq7ctdpFP/ugcCRpsHynjm+iNsy2Ry9Q2dkeF9ElPD9uv9teZ2kPHuDgFFuQsxPXj2vDuWaHnYSyCRPSiMPKxcQGNy21WU8B8KqAHcACEvE/x+vXL2+RNZcPNbfFIgEVZq+L4/EPEV8T57r5SZMBLasc1f0pJRJb/PbDNhxwOIHEDKM9KdLc5kLnx7eb1X7ZBq3nLVxRmV6k98uTEh+Xjzb4rluDGNEmBcBuMW1NncFUgXQoOe/Y4OGX0hViua5xBhDiVROq7pnIKU5eD3spK+3XBXiYtQjktsL412k4lm0tBwpDiKV1iZHjhWDXbo4cA+2CLwsZdQ4nC0eSatd0aD+1a5Z4IiV5ZQO+GYH1C2hHHZ7ZXJDB9nd/FwiQHgKRKPkIltcDYJLxlVpzE5bimt4SXbL+ki1/+HMiJlGob4+TUc5aDl5vLO5EeD3gVo3WeKX0Vz8hv9wTCbUJCJoGNnx/mNdU55ywldwsc4GxammQvHy2U/hUFlI+Kn6N//2I2hO1UYj+/bNA6xxnWuUw8vJ1gaFpMUmfIvitp5hfj3xy7r/cGLBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDFDL1VIajdYNzRQTHRTSzZnQlhwL2NFUnlQdlc2aTdjUXhNVkJhZGdrNURN?=
 =?utf-8?B?L3JPRWEycGNDU2dHUkY1K05TR0ZjUUhrYjhjc01LQ09odmptUDBJOHdXN3dH?=
 =?utf-8?B?MU9OeUNHZzliYzJ5OXp1SG0rK0ZtK0x6cmVlTzNoc1p5bWh3cGQvaGF2d3ho?=
 =?utf-8?B?aGIwU29yQ0xxci84S3B6ZGpKSnFuSURjVmRyRGczb0pCM1ZHcU1PeXN0NThX?=
 =?utf-8?B?eDhyOGEvQXhwWUw1Z3JkN1dXQTFURWRBRy9KVnR2ZVl1Y3c1WGh0dENBakoy?=
 =?utf-8?B?K0Zld0VYclFjeDhzQmhFOGpzL1RveCtJNEV4TDU3MVBCMG5NZU53dVpDRXdN?=
 =?utf-8?B?V1ZCRlNqV0FEYkg1QWIzQUxsRlJiY1RxYlkxcnZqa29uS2tQNFdEMThDL0VI?=
 =?utf-8?B?TTJ1bG5VV2NBK255Snh6eklZU05DSlNYbjNjakI5S1VFL21NeFVSRno4Yko1?=
 =?utf-8?B?YlFkaTR4dFAwRUdXZk4rTG9ERDUwM2FBWUFjdTVhd01oT2lNbktSSHdjTUhF?=
 =?utf-8?B?TzNic3drWi8xd2ZaVllHNGhUMFVNcEkyOHNBZy9DaFBBaVBGU3NEOFdJSmFp?=
 =?utf-8?B?ZnU3UFgrbEp5aGozOVRDRlpJUTJzZGF6Skk2NmFKYnJpd2FCUG1PQkNxVWQ3?=
 =?utf-8?B?TElmR0RvLzJrT1BlQWZvcWlDSmwwUFc1YysreDJ5UVJIbmQ3MXQwVm9kTWcr?=
 =?utf-8?B?TW92YS9Pb0czNUs2WHd3Z3pPVHluSGk5MEtLWEgrMXVWNC9yNE9WWTRUN2pR?=
 =?utf-8?B?aGlTT3BqWWROT3A5Zkt3WFBSTldVR2w3cVA3aU1xdmloN2ovbWtjTTYzWDNT?=
 =?utf-8?B?bko1YXN0Sk9aNHVTZTJJMUhRYWdGTEV1bDB5d1pFMmZrTHYwb1BVRmNVcmNL?=
 =?utf-8?B?ZTExWWhHQktRbUVFNTI5WER4bEZHRlIzWE40cS9scC9HMUIyNFBoWTNaM3dJ?=
 =?utf-8?B?Mk11ZkV3dTA1Z3FFYmEzcFVtU0NmemlmcHRJSlhiU1R5eWhBbThLU1UvU00v?=
 =?utf-8?B?QnZTOXlFNHY5RzhJZVlhL3dzWkRxZTdEZGNwZ1JUTnBKb3l3OVFwaml2dW1y?=
 =?utf-8?B?c3VLOGdZZnlEd0NHZDYyVnBqbVIxWllEaFdwV1JZMVdQZTU3SVhqL1o5a3pT?=
 =?utf-8?B?WVJKejVNYUZ3TFd5cmppMStJU2tBeHFIS0VYOTdPa3Vpcks2RnhLeHpPeDlq?=
 =?utf-8?B?eDBGRjQ0bU5yMW42WWhRcGlwQ21kcjdyOUlMd1ZMZE1rYVptNFZzOG1NNitw?=
 =?utf-8?B?VFh6d2NRNlEwWTNNME4wVlA0ajhZaisvRTI0bWtNdnJYemoyM0R1bHdCZVRE?=
 =?utf-8?B?eDBwNitLNVNvQ2xKU1YzeUVudkcvWE13ZmVLRmhaTkJEV3RFaXhDMDVYSVFX?=
 =?utf-8?B?aFRId1djME9kRzBIbnM4Mks1NVVhZG5qRXJzWml5aFZtdDBOQ3lldEg0azhv?=
 =?utf-8?B?SnZnSWc4ZENqRWgvV2dFZ0daOTE3N0dodzM3TXpMM0ZDUDg5WmVwNWNkTTNu?=
 =?utf-8?B?djhEeDJzUXgzZG9XSnJOQ0MydnQ2REw4MXhGOFZWR1pKSzlJUGl5MDJwaDNt?=
 =?utf-8?B?UkV4a0R5ejlxeEtrT1pwY2U0SFhiSWxGYVVQNnZKUjJ1b2VXTU1YWEdkYjJo?=
 =?utf-8?B?dXlrY2dERVhyNjN2KzdFQmhKS0ZGUlBwK04xY0NXNVNPSFAvRXExRHJ5c0Yr?=
 =?utf-8?B?cGJjNCszcW51SDgvMXh5bFQ1aS9OUndVck04eGdhRG12bWlVVW96aEc5OWhl?=
 =?utf-8?B?SEI5ZW9lQ21GWGNlMWpkbHpYZGJiSktvVjlmZ2wvVmxEbzUremVPSnpZT2xj?=
 =?utf-8?B?cndSbDVjU3hqVldzUmpNd29tS29LYUEzYmtOVWV6UEljU1VsUWM3NkNNMnRJ?=
 =?utf-8?B?ejBGQnRMd1pCM0xYVVR1WVFkWXpTU05pbXIwZGptb3NPd2piUE1UWnZOWU1C?=
 =?utf-8?B?c1JCOTlWTUl1ZnZsSFA4WC9BclhJZlMyNG4rNitkdldiM0trWWxsek5HN1g2?=
 =?utf-8?B?VDV5elpSLzRtNFNBZkNpSFZ1eE5hazJRSkJPSXVTME0rb2oyY3ZneVRTTkFV?=
 =?utf-8?B?a25xV1hDQkE3TEg1OW5CTGpWVU1jM1BSZ2hIRzhQQVlmUlFmN3grRTVLU1hh?=
 =?utf-8?B?S3BlTmgvNzlYOENqWmxSK3ZOTzRpVjJyYStSeGdjSVl5QXhaSy9yQkNPd0h3?=
 =?utf-8?B?VkxDR3d4bGJEejEvWUQrSHZpdURvSVFzVUNoaUZWTDV6QlRKUG9uNFA4cWpL?=
 =?utf-8?B?Y251MnpYUGtKdnJFTVE5eUpwUkZqZWQzdGNMYk43QmdDS3VzT29wSThCMjdo?=
 =?utf-8?B?bktER0RRMDRraXlCZnRzb0pGdEs3L2Vpek9qMzFUeHpNUEpLa2tQZz09?=
X-Exchange-RoutingPolicyChecked: KXEOk19e31ej9Bob8R5H9b7P5CxJhIbzOkhIo3IdePGZ0sexWUw5p7TRHXnommFRIwq8GFzb6Gtx7ZMR+6HEXwkP0wf9l5qOISkgAfbFLQTLBL5cx4WG0iyxn7YCpxuiX7UvlGkucB3bs5a74x/SnMRhew8Or19LiDoOpF9fSiLzg/1WskmbIB3otqGlmAXmRIIQi6gjCFz+w20KJVvFpU08Lq1VBB14ePzXZ4IfKuNZJ8O65ewsLnA00xMVJjejT/WPOUtK/3OBFeLoMItV49GsbW7+ikjMyicDPrF25fjV7z4BySem0rEs23KySaFg2z7fgAIlyFyyoRKMOPlkwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40bf56f0-880c-40fe-cb1b-08de96c3b6a6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 05:40:46.3687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIzzLdbDskVwMV7RNOj3G47QHqSJNdNozfqRY8FdE/w8ONgN80kQxezp5fvFWwkiRm/RM9EQeqUF3kk6i7xUTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7110
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

Hi JP

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 01-04-2026 12:34 am, Juha-Pekka Heikkila wrote:
> reset flags to defaults in one place as well as table test names.
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 204 ++++++++++++-----------------
>   1 file changed, 87 insertions(+), 117 deletions(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index c9fc191fd..029b735bd 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -424,6 +424,56 @@ static bool has_sharpness_filter(igt_crtc_t *crtc)
>   	return igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH);
>   }
>   
> +static const char * const test_type_names[] = {
> +	[TEST_FILTER_BASIC]                     = "basic",
> +	[TEST_FILTER_MODIFIERS]                 = NULL,
> +	[TEST_FILTER_ROTATION]                  = NULL,
> +	[TEST_FILTER_FORMATS]                   = NULL,
> +	[TEST_FILTER_STRENGTH]                  = NULL,
> +	[TEST_FILTER_TOGGLE]                    = "toggle",
> +	[TEST_FILTER_TAP]                       = NULL,
> +	[TEST_FILTER_DPMS]                      = "dpms",
> +	[TEST_FILTER_SUSPEND]                   = "suspend",
> +	[TEST_FILTER_UPSCALE]                   = "upscale",
> +	[TEST_FILTER_DOWNSCALE]                 = "downscale",
> +	[TEST_INVALID_FILTER_WITH_SCALER]       = "invalid-filter-with-scaler",
> +	[TEST_INVALID_FILTER_WITH_PLANE]        = "invalid-filter-with-plane",
> +	[TEST_INVALID_PLANE_WITH_FILTER]        = "invalid-plane-with-filter",
> +	[TEST_INVALID_FILTER_WITH_SCALING_MODE] = NULL,
> +};
> +
> +static void build_test_suffix(data_t *data, enum test_type type,
> +			       char *name, size_t len)
> +{
> +	if (test_type_names[type]) {
> +		snprintf(name, len, "-%s", test_type_names[type]);
> +		return;
> +	}
> +
> +	/* suffix depends on the current test parameters */
> +	switch (type) {
> +	case TEST_FILTER_MODIFIERS:
> +		snprintf(name, len, "-%s", data->modifier_name);
> +		break;
> +	case TEST_FILTER_ROTATION:
> +		snprintf(name, len, "-%srot",
> +			 igt_plane_rotation_name(data->rotation));
> +		break;
> +	case TEST_FILTER_FORMATS:
> +		snprintf(name, len, "-%s", igt_format_str(data->format));
> +		break;
> +	case TEST_FILTER_STRENGTH:
> +		snprintf(name, len, "-strength-%d", data->filter_strength);
> +		break;
> +	case TEST_INVALID_FILTER_WITH_SCALING_MODE:
> +		snprintf(name, len, "-invalid-filter-with-scaling-mode-%s",
> +			 kmstest_scaling_mode_str(data->scaling_mode));
> +		break;
> +	default:
> +		igt_assert_f(false, "Unhandled test type %d\n", type);
> +	}
> +}
> +
>   static void
>   run_sharpness_filter_test(data_t *data, enum test_type type)
>   {
> @@ -447,7 +497,8 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   			 * Until then, run on non-joiner mode in joiner configuration.
>   			 */
>   			if (is_joiner_mode(data->drm_fd, data->output)) {
> -				data->mode = igt_get_non_joiner_mode(data->drm_fd, data->output);
> +				data->mode = igt_get_non_joiner_mode(data->drm_fd,
> +								     data->output);
>   				if (!data->mode) {
>   					igt_info("No non-joiner mode found on output %s\n",
>   						 igt_output_name(data->output));
> @@ -477,9 +528,6 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   
>   			if (type == TEST_FILTER_TAP) {
>   				drmModeModeInfo *modes[3] = { NULL, NULL, NULL };
> -				int num_taps = ARRAY_SIZE(filter_tap_list);
> -
> -				igt_assert(num_taps == 3);
>   
>   				get_modes_for_filter_taps(output, modes);
>   				for (int i = 0; i < 3; i++) {
> @@ -487,11 +535,16 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   					if (!modes[i])
>   						continue;
>   					data->mode = modes[i];
> -				        igt_info("Mode %dx%d@%d on output %s\n", data->mode->hdisplay, data->mode->vdisplay,
> -						  data->mode->vrefresh, igt_output_name(data->output));
> -					igt_output_override_mode(data->output, data->mode);
> +					igt_info("Mode %dx%d@%d on output %s\n",
> +						 data->mode->hdisplay,
> +						 data->mode->vdisplay,
> +						 data->mode->vrefresh,
> +						 igt_output_name(data->output));
> +					igt_output_override_mode(data->output,
> +								 data->mode);
>   
> -					snprintf(name, sizeof(name), "-tap-%d", data->filter_tap);
> +					snprintf(name, sizeof(name), "-tap-%d",
> +						 data->filter_tap);
>   					igt_dynamic_f("pipe-%s-%s%s",
>   						       igt_crtc_name(data->crtc),
>   						       data->output->name, name)
> @@ -500,59 +553,13 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   
>   				if (data->limited)
>   					break;
> -
>   				continue;
>   			}
>   
> -			switch (type) {
> -			case TEST_FILTER_BASIC:
> -				snprintf(name, sizeof(name), "-basic");
> -				break;
> -			case TEST_FILTER_MODIFIERS:
> -				snprintf(name, sizeof(name), "-%s", data->modifier_name);
> -				break;
> -			case TEST_FILTER_ROTATION:
> -				snprintf(name, sizeof(name), "-%srot", igt_plane_rotation_name(data->rotation));
> -				break;
> -			case TEST_FILTER_FORMATS:
> -				snprintf(name, sizeof(name), "-%s", igt_format_str(data->format));
> -				break;
> -			case TEST_FILTER_STRENGTH:
> -				snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
> -				break;
> -			case TEST_FILTER_TOGGLE:
> -				snprintf(name, sizeof(name), "-toggle");
> -				break;
> -			case TEST_FILTER_DPMS:
> -				snprintf(name, sizeof(name), "-dpms");
> -				break;
> -			case TEST_FILTER_SUSPEND:
> -				snprintf(name, sizeof(name), "-suspend");
> -				break;
> -			case TEST_FILTER_UPSCALE:
> -				snprintf(name, sizeof(name), "-upscale");
> -				break;
> -			case TEST_FILTER_DOWNSCALE:
> -				snprintf(name, sizeof(name), "-downscale");
> -				break;
> -			case TEST_INVALID_FILTER_WITH_SCALER:
> -				snprintf(name, sizeof(name), "-invalid-filter-with-scaler");
> -				break;
> -			case TEST_INVALID_FILTER_WITH_PLANE:
> -				snprintf(name, sizeof(name), "-invalid-filter-with-plane");
> -				break;
> -			case TEST_INVALID_PLANE_WITH_FILTER:
> -				snprintf(name, sizeof(name), "-invalid-plane-with-filter");
> -				break;
> -			case TEST_INVALID_FILTER_WITH_SCALING_MODE:
> -				snprintf(name, sizeof(name), "-invalid-filter-with-scaling-mode-%s", kmstest_scaling_mode_str(data->scaling_mode));
> -				break;
> -			default:
> -				igt_assert(0);
> -			}
> +			build_test_suffix(data, type, name, sizeof(name));
>   
>   			igt_dynamic_f("pipe-%s-%s%s",
> -				        igt_crtc_name(data->crtc),
> +				      igt_crtc_name(data->crtc),
>   				      data->output->name, name)
>   				test_sharpness_filter(data, type);
>   
> @@ -562,6 +569,15 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   	}
>   }
>   
> +static void set_data_defaults(data_t *data)
> +{
> +	data->modifier        = DRM_FORMAT_MOD_LINEAR;
> +	data->modifier_name   = modifiers[0].name;
> +	data->rotation        = IGT_ROTATION_0;
> +	data->format          = DRM_FORMAT_XRGB8888;
> +	data->filter_strength = MID_FILTER_STRENGTH;
> +}
> +
>   static int opt_handler(int opt, int opt_index, void *_data)
>   {
>   	data_t *data = _data;
> @@ -596,20 +612,14 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   
>   	igt_describe("Verify basic content adaptive sharpness filter.");
>   	igt_subtest_with_dynamic("filter-basic") {
> -		data.modifier = DRM_FORMAT_MOD_LINEAR;
> -		data.rotation = IGT_ROTATION_0;
> -		data.format = DRM_FORMAT_XRGB8888;
> -		data.filter_strength = MID_FILTER_STRENGTH;
> -
> +		set_data_defaults(&data);
>   		run_sharpness_filter_test(&data, TEST_FILTER_BASIC);
>   	}
>   
>   	igt_describe("Verify that varying strength(0-255), affects "
>   		     "the degree of sharpeness applied.");
>   	igt_subtest_with_dynamic("filter-strength") {
> -		data.modifier = DRM_FORMAT_MOD_LINEAR;
> -		data.rotation = IGT_ROTATION_0;
> -		data.format = DRM_FORMAT_XRGB8888;
> +		set_data_defaults(&data);
>   
>   		for (int i = 0; i < ARRAY_SIZE(filter_strength_list); i++) {
>   			data.filter_strength = filter_strength_list[i];
> @@ -621,9 +631,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   	igt_describe("Verify content adaptive sharpness filter with "
>   		     "varying modifiers.");
>   	igt_subtest_with_dynamic("filter-modifiers") {
> -		data.rotation = IGT_ROTATION_0;
> -		data.format = DRM_FORMAT_XRGB8888;
> -		data.filter_strength = MID_FILTER_STRENGTH;
> +		set_data_defaults(&data);
>   
>   		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
>   			data.modifier = modifiers[i].modifier;
> @@ -636,9 +644,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   	igt_describe("Verify content adaptive sharpness filter with "
>   		     "varying rotations.");
>   	igt_subtest_with_dynamic("filter-rotations") {
> -		data.modifier = DRM_FORMAT_MOD_LINEAR;
> -		data.format = DRM_FORMAT_XRGB8888;
> -		data.filter_strength = MID_FILTER_STRENGTH;
> +		set_data_defaults(&data);
>   
>   		for (int i = 0; i < ARRAY_SIZE(rotations); i++) {
>   			data.rotation = rotations[i];
> @@ -650,9 +656,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   	igt_describe("Verify content adaptive sharpness filter with "
>   		     "varying formats.");
>   	igt_subtest_with_dynamic("filter-formats") {
> -		data.modifier = DRM_FORMAT_MOD_LINEAR;
> -		data.rotation = IGT_ROTATION_0;
> -		data.filter_strength = MID_FILTER_STRENGTH;
> +		set_data_defaults(&data);
>   
>   		for (int i = 0; i < ARRAY_SIZE(formats); i++) {
>   			data.format = formats[i];
> @@ -664,10 +668,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   	igt_describe("Verify toggling between enabling and disabling "
>   		     "content adaptive sharpness filter.");
>   	igt_subtest_with_dynamic("filter-toggle") {
> -		data.modifier = DRM_FORMAT_MOD_LINEAR;
> -		data.rotation = IGT_ROTATION_0;
> -		data.format = DRM_FORMAT_XRGB8888;
> -
> +		set_data_defaults(&data);
>   		data.filter_strength = MAX_FILTER_STRENGTH;
>   		run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
>   	}
> @@ -675,55 +676,35 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   	igt_describe("Verify that following a resolution change, "
>   		     "distict taps are selected.");
>   	igt_subtest_with_dynamic("filter-tap") {
> -		data.modifier = DRM_FORMAT_MOD_LINEAR;
> -		data.rotation = IGT_ROTATION_0;
> -		data.format = DRM_FORMAT_XRGB8888;
> -		data.filter_strength = MID_FILTER_STRENGTH;
> -
> +		set_data_defaults(&data);
>   		run_sharpness_filter_test(&data, TEST_FILTER_TAP);
>   	}
>   
>   	igt_describe("Verify content adaptive sharpness filter "
>   		     "with DPMS.");
>   	igt_subtest_with_dynamic("filter-dpms") {
> -		data.modifier = DRM_FORMAT_MOD_LINEAR;
> -		data.rotation = IGT_ROTATION_0;
> -		data.format = DRM_FORMAT_XRGB8888;
> -		data.filter_strength = MID_FILTER_STRENGTH;
> -
> +		set_data_defaults(&data);
>   		run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
>   	}
>   
>   	igt_describe("Verify content adaptive sharpness filter "
>   		     "with suspend.");
>   	igt_subtest_with_dynamic("filter-suspend") {
> -		data.modifier = DRM_FORMAT_MOD_LINEAR;
> -		data.rotation = IGT_ROTATION_0;
> -		data.format = DRM_FORMAT_XRGB8888;
> -		data.filter_strength = MID_FILTER_STRENGTH;
> -
> +		set_data_defaults(&data);
>   		run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
>   	}
>   
>   	igt_describe("Verify content adaptive sharpness filter "
>   		     "with 1 plane scaler enabled.");
>   	igt_subtest_with_dynamic("filter-scaler-upscale") {
> -		data.modifier = DRM_FORMAT_MOD_LINEAR;
> -		data.rotation = IGT_ROTATION_0;
> -		data.format = DRM_FORMAT_XRGB8888;
> -		data.filter_strength = MID_FILTER_STRENGTH;
> -
> +		set_data_defaults(&data);
>   		run_sharpness_filter_test(&data, TEST_FILTER_UPSCALE);
>   	}
>   
>   	igt_describe("Verify content adaptive sharpness filter "
>   		     "with 1 plane scaler enabled.");
>   	igt_subtest_with_dynamic("filter-scaler-downscale") {
> -		data.modifier = DRM_FORMAT_MOD_LINEAR;
> -		data.rotation = IGT_ROTATION_0;
> -		data.format = DRM_FORMAT_XRGB8888;
> -		data.filter_strength = MID_FILTER_STRENGTH;
> -
> +		set_data_defaults(&data);
>   		run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
>   	}
>   
> @@ -731,11 +712,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		     "when 2 plane scalers have already been enabled and "
>   		     "attempt is made to enable sharpness filter.");
>   	igt_subtest_with_dynamic("invalid-filter-with-scaler") {
> -		data.modifier = DRM_FORMAT_MOD_LINEAR;
> -		data.rotation = IGT_ROTATION_0;
> -		data.format = DRM_FORMAT_XRGB8888;
> -		data.filter_strength = MID_FILTER_STRENGTH;
> -
> +		set_data_defaults(&data);
>   		run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALER);
>   	}
>   
> @@ -743,10 +720,8 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		     "when 2 NV12 planes have already been enabled and attempt is "
>   		     "made to enable the sharpness filter.");
>   	igt_subtest_with_dynamic("invalid-filter-with-plane") {
> -		data.modifier = DRM_FORMAT_MOD_LINEAR;
> -		data.rotation = IGT_ROTATION_0;
> +		set_data_defaults(&data);
>   		data.format = DRM_FORMAT_NV12;
> -		data.filter_strength = MID_FILTER_STRENGTH;
>   
>   		run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_PLANE);
>   	}
> @@ -755,10 +730,8 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		     "when 1 NV12 plane and sharpness filter have already been enabled "
>   		     "and attempt is made to enable the second NV12 plane.");
>   	igt_subtest_with_dynamic("invalid-plane-with-filter") {
> -		data.modifier = DRM_FORMAT_MOD_LINEAR;
> -		data.rotation = IGT_ROTATION_0;
> +		set_data_defaults(&data);
>   		data.format = DRM_FORMAT_NV12;
> -		data.filter_strength = MID_FILTER_STRENGTH;
>   
>   		run_sharpness_filter_test(&data, TEST_INVALID_PLANE_WITH_FILTER);
>   	}
> @@ -767,10 +740,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		     "when scaling mode is already enabled and attempt is made "
>   		     "to enable sharpness filter.");
>   	igt_subtest_with_dynamic("invalid-filter-with-scaling-mode") {
> -		data.modifier = DRM_FORMAT_MOD_LINEAR;
> -		data.rotation = IGT_ROTATION_0;
> -		data.format = DRM_FORMAT_XRGB8888;
> -		data.filter_strength = MID_FILTER_STRENGTH;
> +		set_data_defaults(&data);
>   
>   		for (int k = 0; k < ARRAY_SIZE(scaling_modes); k++) {
>   			data.scaling_mode = scaling_modes[k];
