Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8D2CD4851
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 06:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61B310E051;
	Fri, 15 May 2026 06:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="er8Ighq5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDB810E051
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 06:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778825213; x=1810361213;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UkR4FCnFC2tdNcfVRiUcFyJHbyuHOAfF8417xN+yKJ4=;
 b=er8Ighq52c/2s1LLeTDbRPel2qZxOj7e/SF8VHdF8xoMXO8BbqCAHsz0
 JhlYTCWzoNsOp/R1kTb8NvNjjNbJELr0SwmSirP9jNZlEJ8qfARsbW5Z2
 iieNuA72dVoYqFlerM13nlzA+SCjUflJGg0MtwZAOi0kR/9y+7+m3U7Qw
 eFBtO51qJmU3Y6NqCOpoP1y9s4DSZxxUXFIb3Baorbw03SZa/2p7CROKL
 wpqsAkRYwJCs6f3hAdEUfo4/NvF81zWKOwE+BHLDjEp2FhSqUP7X6VEvW
 Kznn+hnsJbXvYV0YFv1q7k0HdDckolYnlTcSi9k/9r9J01+9K8nvZmj2T g==;
X-CSE-ConnectionGUID: h66h76cSRsucov3UcI513Q==
X-CSE-MsgGUID: 6qYvAdCdQIuMfvlPqXPeeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79807167"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="79807167"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 23:06:52 -0700
X-CSE-ConnectionGUID: U6f3hyu4QZSOa0fTkEjdzw==
X-CSE-MsgGUID: PLJnh8t8TAOqIF8EE9MWvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="234347670"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 23:06:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 23:06:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 23:06:51 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 23:06:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0f8c2nxyqq6NrqO5lSsvsLwJlF9oqjiC0bDe1bhzvj4gl4Gr72harzDq8qdBNm5FMeOOufKyW/7zKC3axLUOqimrdNjnYAxodnWsxOI4EsieiEqzf2wx3kgTFKLW3udd7L98H0Xu9e1apjJWoGmUnFEdgiC/i4JMdDo53nrd52fHQiuyb8yHvEokY7n2DhrLhc0MbtZaNEIQb6+odWFQGJ9XLvKbIhht1LFsfuxvCKEkZFNUqfiwm5UqIb78RZ5zluFUgno8nYvN9emUwf3SN5A77DdmjSG5rJGJrb6o13OZ7Wn4h+EwRtMkSSut7VBlAuRseZRdpvJHnid4ia2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yTWN9NIXt/R6aSsccfZxuRb5o4BEPmVJsOccE6iTfw=;
 b=XszAEwHmtLdl8ni1+XJAJhthYoAQRqUE85gTSHUOoLwK8yGiOPt8fvziCDxccj/DkmxtxV07MT52TM170t6WpTkK49mHG5lgH7eNsvGuXQ+LeLNOcpizTEO99Mr5e9mE0NnsQuSwvSw7piIp9P72pccmKIRUBgdsxBLeJ6u+o/vuMQ8IONCfIsEtw+Yo3RZyUtk2Mmfux1utzz9vsp/xblwy1ow3OW3AXpkdC+KMvoI4O6NChwqXmha7IURfqsHPBjCq+wW5MvHQxTk74X4CwaS3so219y0rsxBLv6f3+UW//+n8R5MtbkDDW3lpdQA5DnX7saRBRrNvTMhnyoQUOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB6757.namprd11.prod.outlook.com (2603:10b6:806:25c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Fri, 15 May
 2026 06:06:41 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 06:06:41 +0000
Message-ID: <eb17875f-71fe-4d5c-bb57-4aeec26cf6a2@intel.com>
Date: Fri, 15 May 2026 11:36:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v6 1/4] tests/intel/kms_joiner_helper: Add
 igt_get_joined_pipes_name()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260430190947.2347314-1-swati2.sharma@intel.com>
 <20260430190947.2347314-2-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260430190947.2347314-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB6757:EE_
X-MS-Office365-Filtering-Correlation-Id: 288e5456-f669-46e7-32c3-08deb2482223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|42112799006|366016|18002099003|22082099003|56012099003|11063799003|4143699003|3023799003;
X-Microsoft-Antispam-Message-Info: qGV8oy/rWBqV99Wvb3cJTbrQ9EaSWVtMPsfuLps/KWCrLHXOggnCQ0nlRPTc1RVi1N3CLV++Bem1M8qMEqeAccM90YibWlRyX+a/fBur9LMOb3wqQwTgZVvpiU3lsQLXMmujE6bVy9PYOeYo/IzWrP6eVJPuZSOu/jbElv2AN/DJu31Fc7y3ZyUZYLL6vw0VTnzBwLNJ2Fl7+nKH/cGpz5p+PRuve2WMGLdUBmd3K1ExNBrNXu1Tz3XxE5gGENQBjNk6J/EYGItd/vlDrf1FPp5KqfSKeDxofKXwAnJRaR1Qvd8dxrk+obZfR/yS7pDs836qx5l/Jn1hU/3ymr9n2bRurfjj1RwhZq5gXI801gpKouKc5RopCWdcXnb1VUey0m5VdsLfI/wxl6+V1iqFKYKC+T993Kw7Fi1GC/gEw8n0QShskoK7/f1ph/OJediPCYH5EbqReumOn4pTTIjb01QM3E3OnVka2spxiWW3TlSN/YLrRaO+oPRaIGT9v5pUYSaT+jx7gRKNf9mHVAeG8GzuLCEKA+kmdOGd9oJGhfodS4NF4BzRS3vmEBcp/ls6qurxMT6/W0TSNMAKv3qm8E6ng1CIA8BjWuSpKHwKrGW8DU5vAV2NiBBl3m1b2hzwohk2MMj7T37YMkMHucXvt328p/WDg/iQhbeD5/AMUyxKpkMFxCLdz/R2PL1WDE/l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(18002099003)(22082099003)(56012099003)(11063799003)(4143699003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWJpa2JjdDY0OGZWaW9nT3RNNGpsbjREODVsTDhwS2EwNW84RGhuSW1uakpI?=
 =?utf-8?B?MFpjN3FteDBUSFlSekpvMFFpZndPNWdnNEwzV3hOOXE2VlJITE5xYzAvcnVC?=
 =?utf-8?B?YUk3ZUxLd2lPcEwxNzhrTkRRdE02TEQ3M1pCYnlIMkxiMVBMV2FLVmJEMHFY?=
 =?utf-8?B?WnpWREhJbVEyVERnS3VoTGFLZ2oxMWRDZVEyN01vdjdjUUtzSmdvKzhpazIz?=
 =?utf-8?B?MEFjYkl0cDRJNXc5SkVONm0vcERzbDZGazgvNzFXWURnNGtKY0Q1b25ENDNW?=
 =?utf-8?B?VU9GeVd5R0hWQldHeGpmZXA2MnloYVhoanBqMUV2d1NCK2swZWFrd1FOS1Iy?=
 =?utf-8?B?K0hGTEF0OSsrSWhQUjFzRHphZEg3WHNkQVV0VDc3N2lUdjlaT0NDdG9PMmdm?=
 =?utf-8?B?dHpjRHQ5OUFodDlYak15WnNtbGh6Z0tOcFJjZ1BTNE8wRk9DdittSTA2aG84?=
 =?utf-8?B?NFVQZ1c3ajlDdDUybUdnV2IvWGx2WUFuVFZ2eWJxZUgxbEZJak05SzNKRzU1?=
 =?utf-8?B?TWJaSjhtZE5IZU83OStyN2g0WG5YTHl5cUNxZmpKTW1sK3NKWHdVdEt3Rktl?=
 =?utf-8?B?NW9NbTNDZENacjluQjdFK3FQVzFVWE9rd2VHUktiUDY4N3ZEWUhVK1QvMmNi?=
 =?utf-8?B?UmUrc0JmK2toQmNQaStacTdXYW5nbmVTa3JWa2tTa1dLUzJmdDN1MFA3K3Jz?=
 =?utf-8?B?ZnBvVGl3bTEwWTVnNDZEYmo2cldkd0hJSGVQcTU2MHRTRW03ckJFQnhBb2VI?=
 =?utf-8?B?ZjREaUNqdzlnUDBPZ21MRWU5ajBxOU0rRXlob0NVZVhkVE4wNWYwV0U2UmJK?=
 =?utf-8?B?K0FPSWRpZDlVZ0lXYkY5ZGo5T3N1SUtEMUI1UE92ZHJJamVJYmw2MkpjK0F4?=
 =?utf-8?B?VjM3VERtb0o3bUptSHI1b28wenRjVHhxWElUNGNldVNvOHQwSnNLUUFVY2Jz?=
 =?utf-8?B?em4wcEFlK1VZRzRtOVk5Zm9rck5TbExDd1grVlpkbWFydGZNUW5RZDBGTzVT?=
 =?utf-8?B?SHlZaU5BcG9FMFlGMEVuL093Q3dpNmMwVXZYSnM1RWFBczV4MzFFWG1IQnd3?=
 =?utf-8?B?WVNSU3d6ZVRMZzdmOWhCd2oxK2R3QXBMMjB4WGNNQzhVK2VIdHBkQjE1SnRZ?=
 =?utf-8?B?cnVjVVAzdDRsZDhIN3U5czZYajB3OE42OWNteVJXYm1JUVBjZTBSaVNwZDFN?=
 =?utf-8?B?ZUIwRVNaYkRWMnJMVDByRkxmQmpYZFcvRmtpOWo5NnBnZ2graXl1ZWhveWlB?=
 =?utf-8?B?WFY5THZ3c0tTMlNhVDkwL2dmNmpNMGxjMmZUb2t4VUNUbW5ZckhBOGR6WW96?=
 =?utf-8?B?NjJFU3VVRVhwS1lld0xBN1puUWlHejNmOEFSdzd4Wlk5WnpxeHRMSzBwOEFQ?=
 =?utf-8?B?QnVqL3Nlc1NEbnFkWjBveFh6TzdFYXFhQmxMaHlrdklaMXRoak9QQ1F1THVZ?=
 =?utf-8?B?Q2NKZmkwQVFBSFR4QXMzaVBjRHhCRk4xUXRoYTM0S25ONUVGcFU2V2l0T1l4?=
 =?utf-8?B?bHlwNnIyRWhrMWZHNUlhaVVlNEttTHJiUUlSQm9lSXNtZ3E4OHVJay9RQm52?=
 =?utf-8?B?bVV0cS9jdnJJbzdwQW84dkxmZ1FXb2xkWVZwNnhxcU0wRGp1dm4rL0E3czBK?=
 =?utf-8?B?UmFXc0M2UGVNRHlKWTFpMUpubEtBdnVjYWVPMi9hLzFsY3V5ZHhSZjJyMWd6?=
 =?utf-8?B?aFFZZ3FVUkpvZ0dHL3ZmRTdzcFV0azRZNHovNzVaOXVFbGtacGltanJrQzg0?=
 =?utf-8?B?a1owSks2QnlaSjVsU0N5VTR1YUp6TC9aWFYySTJoOUt6ZHZmK2dqUDBTdkY1?=
 =?utf-8?B?QlNmUnFDbHExSjJ6S2o0TGtqSlFjazIwMnA2NGJWaW0ydFA1RjVzTUNQa3hP?=
 =?utf-8?B?c0oxZ3JUWk1yZzljb2FpVkUvSDNOZHBQbDlKaTVieFJjcEtORnQ5UUVvdzNF?=
 =?utf-8?B?TzRCSEpDS2JlRmtHT1dHbmQrUTBHeHkrcmc1WktsRUpXbXdtWEt5ODZBeFpr?=
 =?utf-8?B?WkFmK3NJNlRHQlRHOFBRaEdTd3M1MW1jOFJoQTVuQ2crajJESktFcUJsMU1T?=
 =?utf-8?B?R3ozcGd6TC9PSURrdFBvTEVOQmpBdERQVUZWNnVHL2sybVhXYjdiMnFWYkZW?=
 =?utf-8?B?bHZ1dkxidUZ3dzZRb3h0cVJaT2JLZmJxeTY0emc1ekRpbmJha0lZOU1RanVv?=
 =?utf-8?B?YkFQVDg1M1c3NGlOa2k5UXJsYnpxbXp2Mm1SYzBEKzhiVVVhZWVVaTVRQS9D?=
 =?utf-8?B?TUpJOWVldTBSNC8xN3YySXBxWEp5MGpOYkNEWFVWeWhKcnJ4ZW10Zm5JZTM3?=
 =?utf-8?B?OGhpbTdxVVM4S2xoMGZuNlJUcDVrNEVEcjFrNXNTbVdNanF6ZEwrQT09?=
X-Exchange-RoutingPolicyChecked: UzcItoyGMYPPacxLQDLU+ZP+YnEp/siQwOKyx2ThytMYfy2xrXUFEcqoWUd5fwy1mMLDwHFbHzuhOSyfqnbpKqTLoFuyF0TpuOe9oIkOOhKJW7cbP0jMolyKHHyrpQmtweHIZCr71tgM2w7uJ3ZOFptqv8LlkLFLnJa4BvSqfVm0XOFvpuCxiC9YVNPxNaBCpvX4oQ1UxnTrr5F4w4+4Leab/fs2U9u+ncEPSHSq49sHWX8U/BAe9P4xaNZvtj9eCa3svGLKDpalS025aCgZix0E0RB37E403DLX9IioJXuYxvilrUBsVXjIBIVFWumHIZYbuxZ4JEwoBFXXedrqHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 288e5456-f669-46e7-32c3-08deb2482223
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 06:06:41.6768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xuls0eE/iTFU2uoOgBAfXiaue7doCeI9f6YDYOgqbzVCLcmE1HlK5CwBEKWcPFNKAgfB0gBiwe2fDUiimWZMnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6757
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


On 5/1/2026 12:39 AM, Swati Sharma wrote:
> Add function to transform the enum into a string.
>
> v2: -Improved func() doc (Jeevan)
> v3: -Return names without '-' dash prefix (Santhosh)
> v4: -Move from lib/igt_kms to tests/intel/kms_joiner_helper (Jani)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_joiner_helper.c | 22 ++++++++++++++++++++++
>   tests/intel/kms_joiner_helper.h |  1 +
>   2 files changed, 23 insertions(+)
>
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
> index e24d7ce94..0aa409ac2 100644
> --- a/tests/intel/kms_joiner_helper.c
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -183,3 +183,25 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>   	}
>   	return true;
>   }
> +
> +/**
> + * igt_get_joined_pipes_name:
> + * @val: joined_pipes enum value
> + *
> + * Returns: A readable string for the given joined_pipes enum value.
> + */
> +const char *igt_get_joined_pipes_name(enum joined_pipes val)
> +{
> +	switch (val) {
> +	case JOINED_PIPES_DEFAULT:
> +		return "";
> +	case JOINED_PIPES_NONE:
> +		return "none";
> +	case JOINED_PIPES_BIG_JOINER:
> +		return "bigjoiner";
> +	case JOINED_PIPES_ULTRA_JOINER:
> +		return "ultrajoiner";
> +	default:
> +		igt_assert(false);
> +	}
> +}
> diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
> index 6d21e7eb0..1ea871a3b 100644
> --- a/tests/intel/kms_joiner_helper.h
> +++ b/tests/intel/kms_joiner_helper.h
> @@ -17,6 +17,7 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>   				  uint32_t *used_pipes_mask,
>   				  uint32_t master_pipes_mask,
>   				  uint32_t valid_pipes_mask);
> +const char *igt_get_joined_pipes_name(enum joined_pipes val);
>   
>   enum force_joiner_mode {
>   	FORCE_JOINER_ENABLE = 0,
