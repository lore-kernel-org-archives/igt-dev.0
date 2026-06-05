Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9CCCD6E5D
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 11:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C299A10E625;
	Fri,  5 Jun 2026 11:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elJkrH1i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E3110E625
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780657495; x=1812193495;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HGuzJMhMwwf9KaD6LFOQ6Jw+p9fTs2eywCEpx1Fp6JI=;
 b=elJkrH1irZxDUHMCUkCEpFtF1Kad2jixKVmhljn0HRKCdKs9UfLilcHF
 CPRsoGsxzLP2Ndc1/2h45aQnnFU9rmIhMnA4p+ZBnRddCQLlhucNETOmi
 haW/W+h3hZdgYiO8JHehpAVJpr6GHGokIwEvGXKz4kIL4uf/u35yKG2k9
 KgW6e+U1mmArkUTa/jgWuVW8xYx59PdzvbFiERmga03/xWbG/9w2+tzSp
 qK8qcBjUUW9jh4QTKw1jh/eqh/fZUvNYMNVPG+0NfHMivltWbLiLDCGTH
 Dp0jznKeIyY1R2imHVRI+8YkWrgz9lidpaKG/IsYW4IjZijgZHMa1QZVQ g==;
X-CSE-ConnectionGUID: R8IY6Ob0SoGi7TgJnSIwTg==
X-CSE-MsgGUID: GCY+kdq0R5OhqbrvuIN4Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92598891"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="92598891"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:04:54 -0700
X-CSE-ConnectionGUID: GeAXe5xKQcGdSXau8z3J8g==
X-CSE-MsgGUID: n779SbEBRb+0qB6rAfyZRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="282898999"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:04:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 04:04:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 04:04:43 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 04:03:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRBxgMc30Gvd59nxAXE78laTGW4kVuqymTIU5Nh4FGYAVx9sMvpJs7vv8z1Q4ei4LBEeZW9IkTMT6cf2wayctowqgFhAFBuef2d5xGqBt+c4+OfUvv92Kk+rqxL0/t1P9+01xhFLZD4/pZxyuUS04yByBy8ni5X8TaqX9amnrvaDouqESu2/hOx+l3erS7uz2Yl8IRoJixVxAT40siXClrPMSGYOmw7XSu9hPwl74PFQIQ9zpjL1POocB3tnsgbT+nNz9+9Ehgu/JAWx7hQZe3Nz6TUg2l/5fbVaM75toIOIx8s45yGs+GmoimgMxh8lhzgcdYpyWQJQC19iPzC6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZA2E8MM8O7V+RPshK3m7NS0xFB3HCt/GPeY4AFXvYNs=;
 b=mLq4Gln/PxQq78yq2t+UBDfnFksEXqndn2JYRX1D64s+3Jy6hJK9DJ+DWnDPXBi0sECvbBZ+1ErJexrtrYcWOozu5GlrcH26mEXHleXRaD2+k59rGGX5RLDIdoASdxDOFdBi472AHh+fLR1zm5qn+zkBKIM1dET34mOwYbEShZyL8wqXL5E/CNrhvR44tn2ncUuGHzutBYDpuyNTBEmrzV+g+PTg4ugtOoSnbVvRFtjJ0ITFsgSPwWa9QPlg2iUxggPXuAAlCF0+SUVwidBRu4vetC8zImQ7BJPji8d15FP7N2CeTot0J1TyLAJxWZ+iBHxHfeptNSUNwZiqvZeArQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by DS7PR11MB7929.namprd11.prod.outlook.com (2603:10b6:8:e5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.8; Fri, 5 Jun 2026 11:03:45 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 11:03:45 +0000
Message-ID: <26deeae4-ee56-4579-9425-f31e1714910b@intel.com>
Date: Fri, 5 Jun 2026 16:33:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Revert "lib/intel_wa: Assert on error instead of
 returning -1"
To: <igt-dev@lists.freedesktop.org>
References: <20260527170827.1963198-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20260527170827.1963198-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::23) To IA1PR11MB6266.namprd11.prod.outlook.com
 (2603:10b6:208:3e6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6266:EE_|DS7PR11MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: d587fb5d-4528-4a21-0f2c-08dec2f21c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: JTtVYIusr/8zR8ijX8kCcsrAuySK2O4XmVxBN9G4AQGhOBcAxkTZkNxKohsVeG0mWjW4t9R3Ps+DURIO2pwmAfr/6ufne/2hFaFjq6uY0ke5/R4/m+nE7L85KhwKD2G+nklA8nI+P2QKT3hikTayAm89dh1mvqDpxm1tpqNjFScQu/zETrnN6n6S/cu+B0lCfoR34CMGxfcYyY9swfTRSWb7tBN4o0SfXLWqQ9MRrsihrTUZsXPTtrpsjtHV1iGz3LFee+wqU+UiixZAQRWtrqC/bRPh59zBntHkgU9AbvUfM8jNOgKIzl7oit71lcrD5ubDivbPxd9gi755kmy92LTmcjCWZpiZyKmv5GjhcCNjmMjGBrLHo4iZ5jHSeB59gT72kAQzHN/hx4GhCE5Xpyb9FZBJNbW1i3TW9Q3VP5J04sCVpUcle1e4PWDHBXkS6nXU4Ig9pVfOudmCVyAZxdknhScQKxtkDDrmPXw9Be9DTcSAftKxowmPaBcw2ih751R0aCfWGUKC25GSKqsB7Xd5boeiT0Ttc9v1wFb278nOCouij5Ie2dg/2SZHshr+uu+aTJaok8/NvVVUm0JPmOew2VJ8G7TcUtph1EVytGDnK6Rbx6r/SXYV4fJFF4OiqH9amPT+hV2G0sWM4FKfs9uQ9vKuje8h2iz1FfZC+drnnkw2/nRWXVd9GYCrjN+T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVNNYVpwTStHcDg3eUc3bkNtTTZwL2lBcEpSaURFK0NKVEdWUmtTTmhIMDdE?=
 =?utf-8?B?dmgwL3RwRmRXbDYrT3NsTXpQUFh2bjJHVW92WnRqMWJKZE9ucHFFeUxFS29O?=
 =?utf-8?B?dFhOVkNxV3NvTDJDQk1ucnFxZ1htY01MQWlSZW9idjN2dmU0RlExN08yb1dF?=
 =?utf-8?B?WWFzNi9qdklqWkVvVG9xL2p0MEdINVdONkxxcnB0MjRzbHRVcy9xL3NKSnRL?=
 =?utf-8?B?THdjcnIyTWprakpJZms4amxCTHN5TU41aU13U1pQT2swa3dUeGw3Q3JGa3Ay?=
 =?utf-8?B?LzNjLzRGSUZYU20zcjYwUUJRL0tjdys1bkdaandDc0d5elZHQ09PK0VSQ1RP?=
 =?utf-8?B?azl4WENDd05uNmgrVWVBbDVEY083Wms1SjQrdGYzUEhlRjJtZU80cGozQnB6?=
 =?utf-8?B?bUFEQ1NRRU12V2ZpS0tXTWN1VEFpSTZaUzlBVHRKUHhlS0NMVzhOZldRYUxN?=
 =?utf-8?B?cFVNeTRuQlFUeVpKNk9GWXQyK1RWTy9aWVkvOGFsRHp4RVBQRVV6WTE4YURh?=
 =?utf-8?B?Z3JScVp4Z0gvS3dpcG51cHZ4QlRHUXFEcXNDQTFST2dIeUEyMWtKSFdKVUdD?=
 =?utf-8?B?czYxbU0zOHZweEcvcDJqRFpCMjBFbmh0OUxWY0RzQjVZbWQyeWtvSnJ1UDVG?=
 =?utf-8?B?QXRtYk5yNG04UEdkdEdGQ0hickhENm5yOG9NQklsb1BEQm1SVkNzZWFaY0ZY?=
 =?utf-8?B?ZXJtWkhwWVh2ODhaTWFFZWMxQiszOUJMTTkzRlJTNWNQZDhyTm54MmlmWDJi?=
 =?utf-8?B?TFdwblB6SDQ1cUJrYzNKWWFyUk5HQzhxbU81VXc4bXlWSTlIcWFJOGZmc05n?=
 =?utf-8?B?THR4TWt0RmxVdTF4bGQxb2RVUjBWM2M1elFCOWRBa3JpV1lINGVaNnkrdGcw?=
 =?utf-8?B?b3dPSkpZaVpKT0dSVEUzU2Z0dU1qVVVUWFo3N1paLzJtTmxJT1BVdHNoVzBX?=
 =?utf-8?B?aEt6OFhpUUxzUy9NN2ZocFc1TjJKa2RtKzEyM2tmRXFPTnpiVGd4c2VnalVl?=
 =?utf-8?B?N08xM0NHeWEvdXlBckNmc2I1SmpBdXVhZDN1V1RpeHRZTUw1ZDVIbFI3bE5C?=
 =?utf-8?B?ZGFTL0crV3MrOWhKU1FCbm9SZWlXanhGRFdOeWdZckdOb0tvWktiZFpKS2Zz?=
 =?utf-8?B?aTJuWW54WVg0bFI3NXZjTGNwemRZN3Z5KzkweStvdGR5OHF2cEhBTlVKN29K?=
 =?utf-8?B?eDU5VE82QWRGL3N0RTZxZnUxVDgza1FPVFpYdnh1SWd1NDdlaTlMeEhmSGwx?=
 =?utf-8?B?M0NPSWRTKytQbFBNQi92ZDBzWHR0eUllS1M0TUNabWtXbDJER2x4S0M4K1BD?=
 =?utf-8?B?NGhDUGxXekNoQjFHWko5cUNoVEJLdG9sOEZrRmNpL3cyQWJKUUdWVE5QcFpN?=
 =?utf-8?B?ek81L2IxVWNnV2RYVnpScFpVdFNyaXFNT1BmeHY3WTNRYkJZcjhINi9KYWxt?=
 =?utf-8?B?eG5sUjBZaDMyb0oyaFVtTVFjczFKa2VXMml6ZVVQNUpYaTBTeEorZkJ5bnFs?=
 =?utf-8?B?TkxiYVpqcGJSa04vMjF5aEJNaU9CMGVUZE1wMVlTU2JRemovZTRTVTMxb0s2?=
 =?utf-8?B?dTlTT1BnUzlqSXZ2STZKc3dLMHA1aG5pdE16MGhhVWlDNEQ5dFZTSEF4M2g2?=
 =?utf-8?B?bTdKYkhjM0VZMmJkdGoyYktVeFJMaDM2MkMwRjFUQ1VpZHdFbGVzQ3RNMjRB?=
 =?utf-8?B?OFpKVUtrd2JTVUdHeXRUQjZ0NVRsWVEzSTlWK2NTdXZQdCtSRHBpVU1tKzhO?=
 =?utf-8?B?R3A1bWdDVGk4V2tXQmZHengyNTJNOVpCblRFS3lqZ0ZLTFNNSGJhMmI5OHpQ?=
 =?utf-8?B?dWZqbTRKMXB5TjVxM3FCZE5EV3VMdklMcStXVUw1SFNQbjZVOVloMS9iaHlO?=
 =?utf-8?B?ZE1Rc0NjV1Ara1pkYmRPOUZJVEhPSzdFbmRRUDFmTER1aDBzM1J5V0szYjZP?=
 =?utf-8?B?Q1dQaUxXVFhKNmFuaDd1K2tsS1F5UXE1RWtpWTdRR0J5WDI3S3VhVHQ1M0Zs?=
 =?utf-8?B?b3ppOUN5UmM4cFY4VkcyU09MNXhKNWZkU21aTDQwVjVCQUM0S3ErSi9FdlFZ?=
 =?utf-8?B?YnRBRVBnb0E4QTNEUDZWWDZKdVozVnUxLzFqcmRvaXltWHBOOTRQTWs2S0Zn?=
 =?utf-8?B?bWtVQW51ajRHSTB3RGJyRFZsRmlGT05IK1hPUmxlQXptNDRKN2twTm9UTUVL?=
 =?utf-8?B?cmJuZzZBWk5pRTVucVJtNkFQRFhxZlBFQjNzR0dNRDNCUWFDT1lDaVU4VjJY?=
 =?utf-8?B?cGxHR1VWT2VrTm1sZUN3MzV0Y1VNdTlJVVZQNWgxdXF0Y0dSRWszeDZkTXho?=
 =?utf-8?B?aXJXNnoyY2NBMkVLa1o2MlZiZC81U0tDRERXeFQvMCtaZzJzSU01QkFtZnNa?=
 =?utf-8?Q?4jxldYTrxKxtgD+U=3D?=
X-Exchange-RoutingPolicyChecked: Pd2mCFW7Bs0SJTfGF8WwyMDJFrX0MjbT7pOCR/M5gnIyNmnSwTQ+tbYMRbdfSUNaWPyGgdhF+hbMh4jLJUorbB0FKxhTRNnKbQ2C3tWS+DswSUXFK/amGfRP1lYO28JPsw2m0fZ7veRa0XyjpRg+Z9r0osKdD3W6uyvjMayh1vEBJOJRHMXrXT2tjz58+Xr6JuaMCtRcl0ZSnhlQoroKGmEWTBunaM0p4/n6tMNeEsZM9Lcs6T8+swVmqoh+0UazeEFOBdpAkKtxzKcpRvklOmq21Odjdh8KsrL3/zktQJcGel92ERWlZXqqveh1uOHh5xAFmklNs7wufE1+aMZ0OA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d587fb5d-4528-4a21-0f2c-08dec2f21c6e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 11:03:45.1687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqpdUiQNpl0Wwm8sjzsKhnubbR0/mN/WtT39o6HN8DrJVtEN9jZ354bc0lLGSsClvEWfm/HpIy1L6T0LbGKrGRBHwLYo3K4+9eOU+3lxMBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7929
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



On 27-May-26 10:38 PM, Ashutosh Dixit wrote:
> This reverts commit b360115af75ac702b4f776aa3db0ac8a2a620657.
> 
> There are cases (e.g. igt@core_setmaster@master-drop-set-user) which drop
> root before accessing debugfs, where we don't want to assert.
> 
> Also fix the igt_has_intel_wa() call in tests/intel/xe_oa.c.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   lib/intel_wa.c      | 19 ++++++++++---------
>   lib/intel_wa.h      |  2 +-
>   tests/intel/xe_oa.c |  2 +-
>   3 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/intel_wa.c b/lib/intel_wa.c
> index a16ea62a4c..727dd6c988 100644
> --- a/lib/intel_wa.c
> +++ b/lib/intel_wa.c
> @@ -7,18 +7,18 @@
>   #include <stdint.h>
>   #include <stdio.h>
>   
> -#include "igt_core.h"
>   #include "igt_debugfs.h"
>   #include "igt_sysfs.h"
>   #include "intel_wa.h"
>   #include "xe/xe_query.h"
>   
> -static bool debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> +static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>   			       const char *debugfs_name, const char *wa)
>   {
>   	char *debugfs_dump;
>   
> -	igt_assert(igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY));
> +	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
> +		return -1;
Hello,

Suggestion: It might be worth handling the -1 return value 
(igt_has_intel_wa() -> xe_for_each_gt()) as well, to avoid accidentally 
breaking out of the GT iteration loop early. although there will be 
always workaround file per gt.


Dnyaneshwar>
>   	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
>   	if (debugfs_dump) {
> @@ -27,10 +27,10 @@ static bool debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>   		free(debugfs_dump);
>   
>   		if (has_wa)
> -			return true;
> +			return 1;
>   	}
>   
> -	return false;
> +	return 0;
>   }
>   
>   /**
> @@ -38,17 +38,18 @@ static bool debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>    * @drm_fd:	A drm file descriptor
>    * @check_wa:	Workaround to be checked
>    *
> - * Returns:	true if WA present, false otherwise
> + * Returns:	0 if no WA, 1 if WA present, -1 on error
>    */
> -bool igt_has_intel_wa(int drm_fd, const char *check_wa)
> +int igt_has_intel_wa(int drm_fd, const char *check_wa)
>   {
> -	bool ret = false;
> +	int ret = 0;
>   	int debugfs_fd;
>   	unsigned int xe;
>   	char name[256];
>   
>   	debugfs_fd = igt_debugfs_dir(drm_fd);
> -	igt_assert(debugfs_fd >= 0);
> +	if (debugfs_fd == -1)
> +		return -1;
>   
>   	xe_for_each_gt(drm_fd, xe) {
>   		sprintf(name, "gt%d/workarounds", xe);
> diff --git a/lib/intel_wa.h b/lib/intel_wa.h
> index 34cafecc41..765a5948ef 100644
> --- a/lib/intel_wa.h
> +++ b/lib/intel_wa.h
> @@ -6,6 +6,6 @@
>   #ifndef __INTEL_WA_H__
>   #define __INTEL_WA_H__
>   
> -bool igt_has_intel_wa(int drm_fd, const char *check_wa);
> +int igt_has_intel_wa(int drm_fd, const char *check_wa);
>   
>   #endif /* __INTEL_WA_H__ */
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 56d818d860..e59fe953b0 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -2678,7 +2678,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>   	 * can result in buffer overflows.
>   	 */
>   	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
> -		igt_has_intel_wa(drm_fd, "14026633728")) {
> +		igt_has_intel_wa(drm_fd, "14026633728") > 0) {
>   		oa_exponent = max(oa_exponent, 8);
>   		properties[9] = oa_exponent;
>   	}

