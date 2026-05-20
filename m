Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBADCD4F3D
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 21:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA7A10E0C6;
	Wed, 20 May 2026 21:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCucglHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271B010E24A
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 21:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779311272; x=1810847272;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+4mJygKSDU3etL9O/OY365nELON1FH5uu8SPg3Mnf4k=;
 b=DCucglHKXj94ZIJ44VSFhAjuMqee943hbku+XgdO2J56Cf/Xq/rGxnYa
 l6v0yESEFfXSYa1FXmaFfpRDwpdFwxOqIb4hAtovdu3K/Gh1oZwU+RVjb
 Jn+iyl9MPCmtXrsSB3dCzmUXNj26YJGBtQSpCGgHxGkXbIMF3d1f7bRga
 H+JUCZsIfj2zp4VVnBAtLLj0DY2pB6SwkIk0O/n1WG52Gva23cazSnlhf
 k8Y8tFJNi017flS8BFvVbJhCq9BikCLcHe9PAcNFt8UCxpT+8XC3YtvGt
 Su8Dtwd5ebQkiEMypBVAJAr4Sf1hJreMiECDEk17wVXl/xt7hPwOsQ8WN A==;
X-CSE-ConnectionGUID: MvCC0O/QQrOjoltAWiGQFQ==
X-CSE-MsgGUID: WNSlXtTyTqGS8HK8UQx90g==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79954821"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="79954821"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 14:07:51 -0700
X-CSE-ConnectionGUID: Pef7nmlRThu9eedOCvwXrA==
X-CSE-MsgGUID: 8clr06aPS8O/81euQ5VxrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="245297932"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 14:07:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 14:07:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 14:07:50 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 14:07:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ku04BLcybcIThOZrJvfl/4jTCF4Cq5LYy70WfwrOX0qA+umqz1WgdgF64mLUwsKgA2qW/35Q5i1BbCbwxCiJZzBF3TVqNi1iiKBjEA14+4RQXnmcZtFU8yBQP/Lyn0n6kgB3w7tkDJFZnVk6wChSu0ZFILYF2NWKwhK/zCQhk83HmxaVwGcMPrE5Nqpy7h8HLCrrjhDoJQr3zFHExezhGDnOf0HbMBK8hfi0SXLSaWJQAx+a2rH/K8kf+5jO4jrro/e0uUpjXE2XdIRGLgGV1gByGm/U3goTT3+HbQg1aMcKdCRHZoGrZx/uUHKiO/XskFjusHYMIU7IyyDMzrpItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/HvbIDuGB+yzhvzr5DqTtTMgVVAOVtPBHHU/xXr/wg=;
 b=mZDKm20uI0BxQJUlnINtUpJTjAGIZvNsCc3OVfT8bcpXrXx0a+Iya5PigTytjkvRYAgjyMx4IN591O7COHW2TXceZFpBnonwrlEIQ1YWkJ6IcWVX3sBAqEmcWIkiWDrAJPKS1Z7IPDl15h5NETjRuDQsqGHBDwAkT361w9q0TTcJG+lW/vWLDkoRHBsByxRf7mAYXdtxJBiwJpNsWLBzw3NNDXv9wVz2jRcKByFAHW87k9oJaPyWh66RVCPGsVTq4kpKazOBClTnDJhHPBLwgmmxGVy6bjVtPxNL0FXKI+7OnIHen53WyHjsBpNxq33IJp7T197VInnlVArPtcI2nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by PH0PR11MB5094.namprd11.prod.outlook.com (2603:10b6:510:3f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 21:07:47 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 21:07:46 +0000
Message-ID: <a01a54c7-674c-4c5a-84d9-966d51e5cc3f@intel.com>
Date: Thu, 21 May 2026 02:37:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2][V5] tests/kms_hdr: Fix HDR metadata probe in test_hdr
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <Mark.Broadworth@amd.com>, <vitaly.prosyak@amd.com>,
 <kamil.konieczny@linux.intel.com>, <jani.nikula@intel.com>
References: <20260519150022.3964921-1-alex.hung@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260519150022.3964921-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::12) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|PH0PR11MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: d5146dc5-9395-4e99-1cc2-08deb6b3d76f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799006|22082099003|56012099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: Gr5hxnvKd+k2AmUni0dfsq4ubgl2SkoYqbXtMiDapUuEaY0bW0CWcKpiN4D133364jUxBpibe2sfSmHFVECbpGHDs/cR5t3tTIiAhjju1ULFAJV3zXZQYbaPIQZ57iFEs27+ExBtph3Jbpe4vhoO6fPDHlQ3E6rG7RCH/2zDfcZR0mT454Y6R9JwwEyqtVxBRJephAjAzDIMI05ieGYq7nw6KL0s6NBM2H5ECZrdefRXHQlb9d8FVdHglmcCq7JqW2f25gxvuCIH1G7CHvaxi2e22qpaTXdHKZShuxKuAMwVjWE1FG930an0j0dpmBhOpSqyk9XYASjsGp2FvgM1TrhCEeUmfzaA9zBtI0v3Bw3TtiQKVIKq/XSWrVX8U9YNgBGQOBMNV/NDx+LPbSwkBIAvw8CehweB9059CTrOi1ouo1Z+NzrOTqDAX7bLlJYdn12HxpS6B+m56BxIFZn5lcjTUoxHefyF3f0g1sI1Tas472sBBuZFF8UdI5fvmockDA5FrMvZOfYEQ06BAJZUsuN2pxbqmAGkdG9ituVxN7EosWV2CcR2AmDGEijv5DkjNPqkmfvY4Ufu474QXIQztu3k3wvQW39Rr20d3ow8UxhUO+VLEsF2yd0/BVGUNdxhbeHdZELbZP+Djyxrd7lO1aBGeEjKwwYQ7AESgr5y18GxkuEz63IdqlkH5HKz4Pyx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(22082099003)(56012099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHBDZkJzQ2ZYZGFwbjBDd04zN0VnVjVhb1JaM1BKd3hGbjBBUXErRlB5Rnlw?=
 =?utf-8?B?cStZcWUrUDFXcDZ0WldENjBIemVpbS95aERnS0QwVWZKRjNWS3pRSjhYbFp4?=
 =?utf-8?B?MzZ2WFZzZ29qbmkwWDhSUjI2ZEtRbFJHT3VIR0lnRDA2MUhEcDI4MjVVM3ZG?=
 =?utf-8?B?MTFKMitDTHVLYlF6NnVOWVpwSTQ5WUNUbkJ6S1l2bDEwMktEeE9vT0UvZVhY?=
 =?utf-8?B?TnZaTzJGWStOUGJESDFGaTBNTDM5VDl3MG04dm9xRWxFRmloTW5qQVd1TzRq?=
 =?utf-8?B?aERCeEkyYmFEK1ZsSXFTQTVabGZTdXJ5Y1ZaWnRLVG5JVUtuWHpoeEJQOVB2?=
 =?utf-8?B?bkNCdmFuVzFKZTZuR1I2TjFjOFFyeWVERENuQTNDNjhwOGJMLzJxM3N6NW1p?=
 =?utf-8?B?TVNzSW1tSGVkalRHdCtiZ2ZHVzFNVlN2bHdhSUtpei9oV2lET0Z2VUd0NUxG?=
 =?utf-8?B?NFM0alUvNDhXYUl1ZFRWdk1vZk5qOVhzTVpSYTJ6UW5KT2dSN2N6ZlFOcDJQ?=
 =?utf-8?B?VlBTd09NbWdPaDBQSmtPOStTNzZmMVdORGkyVDZlcERsR2VaNzgyeTRxdW1z?=
 =?utf-8?B?b3RDekFlRWJNbWNJZjZOT2oyNjlhdDV4SEt3TzRZWGluZVp1YUJ3TmIzcXNZ?=
 =?utf-8?B?RzlyektQVkl4cnVDS3VZRzByREdScnBrbitFRzhiNmpsak1BRFYwMW5pVDhN?=
 =?utf-8?B?VlVKdEl3UU15MmVpalVlcWlwSng4RHVyM3RyZUs2cjBNSlE1Y2tZKzdvcndG?=
 =?utf-8?B?NTNrTzJTS0h1UlJzY3A0TmFhVzdqNk5DSUtzaTdycTAyRlhmdERKKytEdklJ?=
 =?utf-8?B?SjBURGpBbTFsUFJJUi9yV0Uxc2RQUm13ZlFMTFFVQXFVSklwMXhWRXR2OHdL?=
 =?utf-8?B?VlUwMndFclY1QjBLQzc4ZVBxc3k0TlozbWVXV2w4QnFqeTBFVDByQ1pmTDV3?=
 =?utf-8?B?YjRtSytqbUhPd29ZWUNHQitWQWxybVBEZ1d6Z1I1NjEya3U3YWJCVU9Eem5s?=
 =?utf-8?B?SXpTUW92WnFRV25PbEljbFliL2x5R1NKcVBtKzlDRVhMMTZJVmVuNGRFNXhM?=
 =?utf-8?B?UFNFQnQ1M0pFcjdOMVdZbGJOZlNUeDVJSkxjZ1k3SFQ1ejJYODZMS3dBK0M1?=
 =?utf-8?B?aTUySTBlQW5IRVIzSzRlMXdCZ3NuSmRZVzlXaDRRRDU5bDczT1RGczAzSHNB?=
 =?utf-8?B?WlNlVXh4cisyWkQvMEtxMGlaN09ncGw2U2ZRTGd5NnZ0a29PVXJzbGxwUmRG?=
 =?utf-8?B?RFZIRkpIQVRaaEpIWVVUR3k2cDd3b1h2ZFNCcEtLbmxRWmp6RUhNdE9FTUpx?=
 =?utf-8?B?dHV3Y2FOSHdvV0E5VXRiaUM2NUR5NjlDQVY0LzJnZVhSaXNIOHZENC91OWNo?=
 =?utf-8?B?d0wyRXBSUG5HclFuSlJoMjkvbE54TVRCSTRPMFF3dEJUZ2VpRnlXdTlHcGZT?=
 =?utf-8?B?WllWRDU0TGdCOE5TS3BZeXA1R3B4ZHRieFRLdjdNNy9qQkIzRTNZOFYraUNQ?=
 =?utf-8?B?VU9sc1pEc0tuNHBRRDlXYWI3bUp4MG9pUzNoRWwvM1lNNkhJZXMzZGkyZ05P?=
 =?utf-8?B?eFFNL2o2RXBKdW43ZUF0cGhVSGUvbFRyY2RJQTFmZ0NwNVhkdURVOEFvOFdG?=
 =?utf-8?B?OTB6dkcyRG1qc2NrMnpVVThBTUd3V1JETEN1QnBvRm5UUWpDOWlDTHgwZStW?=
 =?utf-8?B?eGxQY05pcS9sYlRMcWQrK2lwbERVNENHd01weUJ1WW9pUHRla3QzVHJjNW5a?=
 =?utf-8?B?THdZZGdNV25zQXI0b1NZenYydDZGQUFHZ3k1T0RpL2FyK3BySkd0VWNzWjhw?=
 =?utf-8?B?OW5jNFIvanIvcUYyalB3TGNPRlkvVjlMMmc0ekxGR3ExMFpobnFUQWFGcVNB?=
 =?utf-8?B?NEdaMk4zYXFhRXU1MEJNRXhXSkgvZmk4VnhtcjFUWFoyV1JZRHJXaE1uMFZS?=
 =?utf-8?B?V0lJdVpmVWhlWGxSNk1YQlFJa2ZRMm9FTlNWeGc2anovei8rbXF2eWY0T1Iw?=
 =?utf-8?B?SjNUbm9aeS9rZVU4RHZLNWNrS1FVRkhYQkRsYU5helpPS0xHa2ljOHRCK0x2?=
 =?utf-8?B?WjVLc2RNSThtODE3T2diaDdpWHFuRlkzNGZiTm1CQm1QS01VUnZmREtpZzhh?=
 =?utf-8?B?UnNremRPZmxsRFdNa0I2VFFUQUNzSkZnL2V1NC9IMlhVVEp4TDB4SU44VnRu?=
 =?utf-8?B?aGd1eVZIc2Q3T0xnWHk0QTg4L2F6c2lKcmZoeVlhemdJYzN0c1UvZ2R5R2Ns?=
 =?utf-8?B?bnVpNTNwZjgydzlGYUM0OW9NaUY2UForR2RGNjA5ck9lQVdBclpiZy95V2V4?=
 =?utf-8?B?alpDb3U2UXZTTldUckkvd2N1aXNjaXRSMTRIT3lBWHJPRU85UmNYM3VoUXpv?=
 =?utf-8?Q?+OTuoa03ickn7xX8=3D?=
X-Exchange-RoutingPolicyChecked: MFKeiwQ1NFNNuqPB0PB/nc3gfAzpe3jIXepb7EixrcY46OA/IEQYWbD9d1OrYimHoxLI2+yJqtwUsyq+npsV0dD7E8S8EK6PXOvfCv7qhbBckH+GBP9GHqIv2fZdkMEsh7JASzFGW3Eb2I8FXCkznk7NeHHiVgqrfVJOCKDXdgamVG0G/s6Kr45jBd0s4RGUPhxgUMBIPf9ECT/cZeBm2My0pvn6P3JZFCY35Fox88Yo1McaT9gjImox0itdpw9GVU7A7sy7oUF4/s69EaUQFAV+KmvRpiqpkt3D5WuiPQOrnfFfsjfvjfpa67A9lsLxLkT3TERk/Trfe2BHB5HHAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d5146dc5-9395-4e99-1cc2-08deb6b3d76f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 21:07:46.7518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+YuyE8WYhGZSn9MhMB72rw0K+5QS69InO9EznEWWHnRK7/Geluip8h4u8s9tCXQlQpMDUDLCiUNeaNmv7jLXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5094
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

Hi Alex

On 19-05-2026 08:30 pm, Alex Hung wrote:
> Fix the HDR metadata probe that failed with EINVAL because it
> attempted to commit metadata without a scanout buffer present.
> Create a minimal framebuffer and use DRM_MODE_ATOMIC_TEST_ONLY to
> validate the commit without modifying hardware state. The
> framebuffer is freed immediately after and the display state is
> reset, so the actual subtest starts from the same clean slate as
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> before.
>
> Assisted-by: Copilot:Claude-Opus-4.6
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   tests/kms_hdr.c | 31 ++++++++++++++++++++++---------
>   1 file changed, 22 insertions(+), 9 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index d50f87787..d21f1b3f8 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -571,16 +571,33 @@ static void test_hdr(data_t *data, uint32_t flags)
>   							      "non-internal panel.\n",
>   							      igt_output_name(output));
>
> -					/* Signal HDR requirement via metadata */
> +					/* Signal HDR requirement via metadata.
> +					 * A framebuffer must be present for the driver to accept
> +					 * a metadata commit. Use TEST_ONLY so hardware state is
> +					 * unchanged.
> +					 */
> +					igt_create_fb(data->fd,
> +						      data->w, data->h,
> +						      hdr_test_formats[i],
> +						      DRM_FORMAT_MOD_LINEAR,
> +						      &data->afb);
> +					igt_plane_set_fb(data->primary, &data->afb);
> +					igt_plane_set_size(data->primary, data->w, data->h);
> +					igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>   					igt_hdr_fill_st2084(&hdr);
>   					igt_hdr_set_metadata(data->output, &hdr);
> -					igt_require_f(!igt_display_try_commit2(display,
> -									       display->is_atomic ?
> -									       COMMIT_ATOMIC :
> -									       COMMIT_LEGACY),
> +					igt_require_f(!igt_display_try_commit_atomic(display,
> +										     DRM_MODE_ATOMIC_TEST_ONLY |
> +										     DRM_MODE_ATOMIC_ALLOW_MODESET,
> +										     NULL),
>   						      "%s: Couldn't set HDR metadata\n",
>   						      igt_output_name(output));
>
> +					/* Reset IGT display state; hardware was not changed. */
> +					igt_hdr_set_metadata(data->output, NULL);
> +					igt_plane_set_fb(data->primary, NULL);
> +					igt_remove_fb(data->fd, &data->afb);
> +
>   					igt_require_f(!is_intel_device(data->fd) ||
>   						      igt_max_bpc_constraint(display, crtc, output, 10),
>   						      "%s: No suitable mode found to use 10 bpc.\n",
> @@ -591,10 +608,6 @@ static void test_hdr(data_t *data, uint32_t flags)
>   					else
>   						flags &= ~TEST_NEEDS_DSC;
>
> -					igt_hdr_set_metadata(data->output, NULL);
> -					igt_display_commit2(display, display->is_atomic ?
> -							    COMMIT_ATOMIC : COMMIT_LEGACY);
> -
>   					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
>   						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>   						test_static_toggle(data,
> --
> 2.43.0
>
