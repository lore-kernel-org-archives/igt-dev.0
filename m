Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEC9CD98C6
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 05:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBF110ECC3;
	Thu, 11 Jun 2026 05:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXdTe9KG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC28D10ECC3
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 05:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781156827; x=1812692827;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WBlppAvz+jWu0i04VDmHvE8qxuqi5zntbmQ/3f+o8Gw=;
 b=HXdTe9KGnFAdCBtXTwkpykb89QWVnIL5RvZG7Ac7zgleS24rOhSq9Jzy
 +RCIM65IL1C91kDcQ5U5s3Y8nWxPPzdm4shxCysRcrroIds1tUpdqu0Xs
 MZ79rlFAzAZN2P6XXFxEcM8/jPDF35q+nuLvPw/WerSMACgb60LikmJbH
 sfi239R7MLSnnEaHDWyfxVW7kIqeVT2/k+TX2/0KPonRVLHJDFkgmXK4/
 IC8J25Fdn/S8c4P41ZEJ+/DfOcw3iSgAyNq1ifyrnGeLTyXTFtQRXxEBM
 hNByHSqjBSVxuiSPhlnKX16HHrjKL5kw30RvzAvKwjaiHbRqQYqzJzFC+ A==;
X-CSE-ConnectionGUID: 5N8ihCNXRi2p5ar2Ca0Cbw==
X-CSE-MsgGUID: hGhfvPhXR3iMAr0lfaZRPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92638865"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="92638865"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 22:47:05 -0700
X-CSE-ConnectionGUID: yGCx1QVPS0OcvNtZlrsoGg==
X-CSE-MsgGUID: JtcZIT2HRJK72NeeE3DXdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="240036186"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 22:47:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 22:47:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 22:47:05 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 22:47:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toUgwSJZEKY8hsKdpmXQUBqO9tu4Pr8hU4tnba6gPecszvZYI5+8roAnK9vxtrJWDDWy8hNNy6LWQQ6vOVJIzTFmANcECvJ67z+XN2x0RilZWXKSPzjHjf9NPLTFsURDXzDEq7yZdNQGwyprvC48HXlTNB+5rau8J2RRuyZxLFYC0kDTWBPWrtqYszbKEI4uaP4iUEPbCgj4k+KNRyrIfp3yft4UKa2eyrjzrv9XnCB4QYx5CmeXUcjvJ3frjNgFXpXcCNNMB0mhSipYG0zqdZeKgy3qrUHzb/0RU2L9c55Sd6IzG84Y7QMp4U1NV/yDT3ax3HpC8pPQp69CZOXwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oMRaeqCPXOsbLbcZwm+AJlVGs7l3WMbRltCTG0FsYQ=;
 b=vdrkFFEv+axIQWC1uxvyzJjXFzOspF9wf2ZxFAog4b/5S1TMNvLatSFMe6Sn5Rc0vTyROaTfAAF/3NJP3wfub+d7Nd0KNbCZNDPeBQ+L0iysrXcwLPKXkCKJS1Jb+6PNhHlr3wF0dkqLYODDX31jMJDSir1/D80ZySjnluBJakZP8n1SvyoZnqZzUhu4/FMg/BpaLT6b+vuAwsSpRdhY0rLDHPTQtsPjz8BTNG5UtVFpIko4jxXd2S05VNSH2f0V9SB+ZLm1Mceqgt1UhLQpw07shMfdc39wFFyZkY7+u8WoEhbFfyN5bDWgNp/mNsrfDMZehCWkl57xBm/9mefFAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SJ5PPF20F246184.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::819) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 05:46:57 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 05:46:57 +0000
Message-ID: <380b2bb1-6dbd-486f-afe1-54c77366a5e8@intel.com>
Date: Thu, 11 Jun 2026 11:16:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 2/2] tests/kms_color: Add multi-format coverage
 for pipe color tests
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>
References: <20260605064103.855630-1-pranay.samala@intel.com>
 <20260605064103.855630-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260605064103.855630-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::6) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SJ5PPF20F246184:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f877de-7903-43d7-0f23-08dec77cd96f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: tAoq3VKiTH2fWInCib3DAnk596hUDNBhO5CmtRsXquPW3/POo6KQW1Go9V/3grwaKZ+q9s5dRaX7XbnvC62QVX3GkqJ34nJzJyZELgtGUc1JTDGoXpDceRzjGsBK629CM3RFTGoa6eh1DnwmZDX0lzPoRgJCFT8NCesK2nIpC9Ny/PCgCxtsw2AhcprMbsUK0VOpmYLNcsL839FFUZBAsaRXBlFEMF1MvfXJdrVqQ0RgjsWFOSZLhlNlNIiTVlUlgvO5s2R8f04AOvDsnT1Y55zup0R+f03FvUMFJieudlPi6u1O5zF49HzJnWvqlXPW+q5Ixjhl6EfNHKmfINojL+RayV8tJwNs9e2tvoOTZ+JENS/kMedqYa9sDtSku70wIegj3911q3B9EhI0X1Nu2vzvXNC4FfkZd97+0HeBrGmL5wHcBdU3b9MHQAJVX4GVF/i/0dufhNx9k6kADDk+t1aO98HyjTbju/dlJuPbacNDfzLu8OAupoq29+bVFIu2j1V7SeKMpxw+QXDCLp6Zu5IuR+wHVeSXeHjZ+7dxcvH9tNCYOLfm0NbgKglz/RKKGhUTWtkuf3i09bRG8rPVPJtbygqMzmNtG36yaURVlAJHH3RqE0nBhrBC91wmdurAP/iY6zzVlJHwRlLKvNtKUIeQHIyNCign0Xka2fgYQ7Qghl55NEOXLRx6wGdGq227
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjE1Q1FUaW9GN2l6TnRJL0FRcUMwK2h4bGN5YXZ1OHZFZ0krbFdnenhQVGRs?=
 =?utf-8?B?bHlybDJyM2JyU21kc2h0YU10UzcyVkkrMDFFdmF3L2NjQTFFTzR3Nk5BTllK?=
 =?utf-8?B?ZG9hU09OUFF6OTEvMWZvV0VzV1oybXZhdTVLaWhya1p1S21TU2l2SjJFV2Nv?=
 =?utf-8?B?UjdlRitQeDcvbzlaNy84MVNRWXZxUS9XVXA4WGdjb1VtUExQNmdQWjU4dUlM?=
 =?utf-8?B?Z3Rrc1VrdjZyb1JDaXdnRGl3ZDhiSkhaNG04emY0NSthc3Myd3lZeUJkR2Vv?=
 =?utf-8?B?aUZrUFZ2VGh0QTlzSUwwaFdPZWJBckxpSWJMRU9LYVEyQ1k5WkR1UGdiLzFv?=
 =?utf-8?B?ZU1wNHRZN21jV2k4Qk9IbUVKd2E2Z2FXQmhTNS9mSHNhempKYmVNcnZHUmww?=
 =?utf-8?B?bjZPY3FzU0JYN0lFYXp2NGlMSnZPbm1sODVXcEYrb0taTStwYkZkTko2MXpu?=
 =?utf-8?B?OEtzTS9rd0lmTGp6Qk1xQmJweVAvZC82a2FYNTV2YzZzQ3kybDRnYzZmRGtB?=
 =?utf-8?B?VVNUNW1ZM2F1L0xtRFlBaXg4UTJVVm5uYllhY3hzYzM3ajlhWkJwRzFVR254?=
 =?utf-8?B?ZUpCMzU2M1FJUzNDd29xNWpLTWk4UE1ZNkk4QUkwTWExR2lkYUJpMGpjbUxk?=
 =?utf-8?B?TFYzZEJTdEppNUlDd1hUWkQzcHBza010RVRONkFOWUFvcEY2UHFqZzVsMU9v?=
 =?utf-8?B?cUs3V2s0dkh4R3FkeG11amd0QjJtTDVtUmgzMG9CMUVTdWlWZkVsWEZMVlNm?=
 =?utf-8?B?RTkrZEhHSmUvZGw2bkdHSXdXRXV6UGgyVWNGVVh5MXdXOWNmRFgzMHg4eG11?=
 =?utf-8?B?dExIdzl4UHJkU1VkUGdWSk51SkpMWElKcXk2U1RjazlxSEx3R3B0NVFQejJh?=
 =?utf-8?B?eDBLVXdrL0h6ajdQeDExNEJ3ZG42UnBlTDJaS1NyaXVZa1AxemJEWVhYTVJZ?=
 =?utf-8?B?UDVpZFVSZ0VTZFBkcnFPdmlmUHJ4VklzWFN2TkNMR3l6UysyWnU2VmNPK3E5?=
 =?utf-8?B?alp6SnBiSXkwUnE3MGJCT3liRjNDM0VoSWNmb29Ienlkenc1c1BHTU5aNFF3?=
 =?utf-8?B?RWxNVlFZdCtKRm84Mmt0VmpRUEhoelZCV1gzMDBqa0NOOUhMYzBoT1BVVDh6?=
 =?utf-8?B?ZTRqZVIxc25mdm1MK3F4Ly93QWtXbTVlM1U4cTdDZlc5RVUwbGUra1Q3QWhO?=
 =?utf-8?B?c3o1bzVsaUF4OTBjWGJLMmhHL2tTMlRISlo5QStLVVloQWZoemY5bGZDUWQ4?=
 =?utf-8?B?Y0pobDhlbnRiRW9PSlNKNCtRZUEyQ3Jsc20rbnAyS3NuRGxtU3pIcHBJNWJC?=
 =?utf-8?B?MjNoeVlpeHYvdncwdGxkWGpSempHWHVLZzFpMzRIOHJVVld0d1VpR3dIOXFT?=
 =?utf-8?B?cW5JWjZoZW9sTThob05tQTBFSXN4MnVyTHhmOVZ2OHNyTEhFQjE5YXdhRytB?=
 =?utf-8?B?L0hPVlZoMlJEYTdrRDFCUXJiYnNyZnJSVy9NcEY2QTNSZ0drM1cxM3liOVkr?=
 =?utf-8?B?cUNPZ1pZOFJrd0xtdHpQREk5Ri82WTMvbDhWZDNJM0xuZUxzUitPbWw4VzR6?=
 =?utf-8?B?bFNJMDJYdGN3cDRlMjE3SHowait0V0gzbmxVODhDTUw5cG1TSUEwNFR6TVlw?=
 =?utf-8?B?bGRJU05YV2w4ZjZ3T1MvR00vRlJEbXJQK0U5NEpPRVYxaUZUY0FnN0d0aHYx?=
 =?utf-8?B?SlRObUJxL2lKZTcrOGNwd0N1aisyS0ZTT2liZEFueWYySjNaeWFOV1JUYnNZ?=
 =?utf-8?B?WHl3VWI0amU2SDBObWdRVmg1ZUhtRXBFNzF2VngrWGNXcFo5UmRSK3QzMVhG?=
 =?utf-8?B?RHJ1b2Y4UVJjd1ErVFFYbXJvUDRIeTIzUmZ1Z2NrWHdhL1MvVm8xdEZIUlVx?=
 =?utf-8?B?alFpejdQZUdpMHFBT3h2aEdyeGdMa0ZjNytFNEpaYTU4UFBlZ05XSE5kaDV5?=
 =?utf-8?B?eUxQQ09ULzhlVEE2elNVL2E5ZVEvVVozYXNJSTdCczNLNHc0WXZkRUkzOVhh?=
 =?utf-8?B?TW5OZ0RrRkRaN3ljYUJEL1FmNnU0cnFrMGQ3K2YwNkQ1a012aitNeUUySDF2?=
 =?utf-8?B?QmxKMnRSSk5OeUlQZGswUWRHSExNc2RDU0FRdTRuSlBqWHVJY2F1NWRvVHNp?=
 =?utf-8?B?OVhOaWpTNy9zSDlIVTAvNG9EOHhDY1pocktYVklpZzV2RmsydXRFQTZLY09Z?=
 =?utf-8?B?YTJOQW9jZGJzaTZkdER4ZjlqS0VzRWI5ZjZmaUk0TmRGZnJVejJnN3N3WnUv?=
 =?utf-8?B?WDdiQVp1MVdHM3NGSUdWZCtEUE94dHg2N2Nwa2VSaDlJa2trVlRHYklweEVt?=
 =?utf-8?B?UXJ4RG9XVWsrYm10UURhK1ZhdzBPZ1VxekZnVU1xLzhDMEV1czdiUT09?=
X-Exchange-RoutingPolicyChecked: f4rNU6lmc0uWkaQUVtS/8c3/xIQV7XcG9vKuiD8hjg+3Zpphv80RagvE63GUbTPLqVjLEteHaiOwitlCcqYmsD8sH9fPygUwCCupQvQpQwyhnvieFRh1okIPpDdQDIU2rElcLCg52YBDzVv81hJbA8EOiYJxTyTH7ENQ3XCmtLAET6kAirhSkHHs5Ns3qFfSidbRzWuKMG0eKOMNxS90An0nx4JiNTc1e/sHyXVrjViRq2P3EvD5hvef4LZyySATFCKCisHtwCeAykwjJMe8NEaUXqKuJFgeMsl/YW+GqQo0U4llwp1sv805Y4ain+ePl5EuD67drqu9BwECRbZ6GA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f877de-7903-43d7-0f23-08dec77cd96f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 05:46:57.2045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pY0cxEgy/bpVasauNRMSw8e1bfB/sMWRc7iKKZFLueNGtsBY7G6iYfzI9buuc1Z+O7CSobbS489nOgX58XYGjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF20F246184
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

Hi Pranay

On 05-06-2026 12:11 pm, Pranay Samala wrote:
> Extend kms_color tests to run across multiple pixel formats at dynamic
> subtest level instead of being limited to single format for gamma/degamma
> and CTM tests.
> For platforms where only a single format is relevant (e.g. 10-bit
> paths), limit the iteration accordingly to avoid redundant testing.
>
> This improves coverage for format-dependent pipe color pipeline
> behavior.
>
> v2:
> - Add DRM_FORMAT_P010 format
>
> v4:
> - Split the patches (Swati)
>
> v5:
> - Consolidate format structure with bpc info (Swati)
> - Move format support check out of dynamic subtest scope (Swati)
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_color.c | 127 ++++++++++++++++++++++++++++++----------------
>   1 file changed, 83 insertions(+), 44 deletions(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index f4b792fdd..8d08820ed 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -78,6 +78,18 @@
>   
>   IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
>   
> +static const struct {
> +	const char *name;
> +	uint32_t format;
> +	int bpc;
> +} formats[] = {
> +	{ "XRGB8888", DRM_FORMAT_XRGB8888, 8 },
> +	{ "YUYV", DRM_FORMAT_YUYV, 8 },
> +	{ "NV12", DRM_FORMAT_NV12, 8 },
> +	{ "XRGB2101010", DRM_FORMAT_XRGB2101010, 10 },
> +	{ "P010", DRM_FORMAT_P010, 10 },
> +};
> +
>   static unsigned int create_color_test_fb(data_t *data, int w, int h,
>   					 uint32_t format, struct igt_fb *fb)
>   {
> @@ -733,12 +745,33 @@ run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>   	 * for CRC checks with framebuffer references.
>   	 */
>   	data->color_depth = 8;

With this,  10-bit formats will be tested but the LUT precision mask in 
coeffs_to_lut() will truncate to 8-bit. The reference CRCs are computed 
assuming 8-bit precision while the framebuffer is 10-bit — the test 
isn't exercising 10-bit behavior meaningfully.

Set data->color_depth = formats[i].bpc inside format loop and validate 
that gamma/degamma tests work at 10-bit precision like how you did in CTM

Also, do we have mtk 10bit restriction in gamma/degamma too?

++ Jason

> -	data->drm_format = DRM_FORMAT_XRGB8888;
>   	data->mode = igt_output_get_mode(data->output);
>   
>   	igt_require(crtc_output_combo_valid(data, crtc));
>   
> -	igt_assert(test_t(data, data->primary));
> +	for (int i = 0; i < ARRAY_SIZE(formats); i++) {
> +		/*
> +		 * legacy gamma path internally uses XRGB8888; avoid misleading
> +		 * dynamic names for non-RGB formats.
> +		 */
> +		if ((test_t == test_pipe_legacy_gamma ||
> +		     test_t == test_pipe_legacy_gamma_reset) &&
> +		    formats[i].format != DRM_FORMAT_XRGB8888)
> +			continue;
> +
> +		if (!igt_plane_has_format_mod(data->primary, formats[i].format,
> +					      DRM_FORMAT_MOD_LINEAR))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
> +			      igt_output_name(data->output),
> +			      formats[i].name) {
> +			igt_info("Running on " IGT_FORMAT_FMT " format\n",
> +				 IGT_FORMAT_ARGS(formats[i].format));
> +			data->drm_format = formats[i].format;
> +			igt_assert(test_t(data, data->primary));
> +		}
> +	}
>   
>   	test_cleanup(data);
>   }
> @@ -758,24 +791,20 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>   		       const double *ctm,
>   		       int iter)
>   {
> -	bool success = false;
> -	bool depth_10bit = false;
> +	bool success;
> +	bool mtk_10bpc_only;

can declaration and assignment be combined here?

mtk_10bpc_only = is_mtk_device()

>   	double delta;
>   	int i;
>   
>   	test_setup(data, crtc);
>   
> -	/* MediaTek can only support bit-ture in 10-bit depth pre color */
> -	if (is_mtk_device(data->drm_fd))
> -		depth_10bit = true;
> +	/* MediaTek can only support CTM in 10-bit depth per color. */
> +	mtk_10bpc_only = is_mtk_device(data->drm_fd);
>   
>   	/*
>   	 * We assume an 8bits or 10bits depth per color for degamma/gamma LUTs
>   	 * for CRC checks with framebuffer references.
>   	 */
> -	data->color_depth = depth_10bit ? 10 : 8;
> -	delta = 1.0 / (1 << data->color_depth);
> -	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
>   	data->mode = igt_output_get_mode(data->output);
>   
>   	igt_require(crtc_output_combo_valid(data, crtc));
> @@ -783,30 +812,44 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>   	if (!iter)
>   		iter = 1;
>   
> -	/*
> -	 * We tests a few values around the expected result because
> -	 * it depends on the hardware we're dealing with, we can either
> -	 * get clamped or rounded values and we also need to account
> -	 * for odd number of items in the LUTs.
> -	 */
We can keep this comment
> -	for (i = 0; i < iter; i++) {
> -		color_t expected_colors[3] = {
> -			fb_colors[0],
> -			fb_colors[1],
> -			fb_colors[2],
> -		};
> -
> -		transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
> -		transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
> -		transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
> -
> -		if (test_pipe_ctm(data, data->primary, fb_colors,
> -				  expected_colors, ctm)) {
> -			success = true;
> -			break;
> +	for (int fi = 0; fi < ARRAY_SIZE(formats); fi++) {
> +		/* MTK runs 10bpc only; non-MTK runs all supported bpc formats. */
This comment is redundant.
> +		if (mtk_10bpc_only && formats[fi].bpc != 10)
> +			continue;
> +
> +		data->color_depth = formats[fi].bpc;
> +		delta = 1.0 / (1 << data->color_depth);
> +
> +		if (!igt_plane_has_format_mod(data->primary, formats[fi].format,
> +					      DRM_FORMAT_MOD_LINEAR))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
> +			      igt_output_name(data->output),
> +			      formats[fi].name) {
> +			success = false;
> +			data->drm_format = formats[fi].format;
> +
> +			for (i = 0; i < iter; i++) {
> +				color_t expected_colors[3] = {
> +					fb_colors[0],
> +					fb_colors[1],
> +					fb_colors[2],
> +				};
> +
> +				transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
> +				transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
> +				transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
> +
> +				if (test_pipe_ctm(data, data->primary, fb_colors,
> +						  expected_colors, ctm)) {
> +					success = true;
> +					break;
> +				}
> +			}
> +			igt_assert(success);
>   		}
>   	}
> -	igt_assert(success);
>   
>   	test_cleanup(data);
>   }
> @@ -1100,11 +1143,9 @@ run_tests_for_pipe(data_t *data)
>   		igt_describe_f("%s", gamma_degamma_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
>   			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
> -				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> -					      igt_output_name(data->output))
> -					run_gamma_degamma_tests_for_crtc(data,
> -									 crtc,
> -									 gamma_degamma_tests[i].test_t);
> +				run_gamma_degamma_tests_for_crtc(data,
> +								 crtc,
> +								 gamma_degamma_tests[i].test_t);
>   			}
>   		}
>   	}
> @@ -1113,13 +1154,11 @@ run_tests_for_pipe(data_t *data)
>   		igt_describe_f("%s", ctm_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
>   			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
> -				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> -					      igt_output_name(data->output))
> -					run_ctm_tests_for_crtc(data,
> -							       crtc,
> -							       ctm_tests[i].fb_colors,
> -							       ctm_tests[i].ctm,
> -							       ctm_tests[i].iter);
> +				run_ctm_tests_for_crtc(data,
> +						       crtc,
> +						       ctm_tests[i].fb_colors,
> +						       ctm_tests[i].ctm,
> +						       ctm_tests[i].iter);
>   				if (igt_run_in_simulation())
>   					break;
>   			}
