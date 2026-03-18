Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1A3103E162
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 11:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C5610E77F;
	Wed, 18 Mar 2026 11:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OV4YHFMy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF6110E77F
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 11:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773833546; x=1805369546;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nI37lzNw8VNceKBvTmBy9Nn7yGPk7lPNl8DKOfi8RbU=;
 b=OV4YHFMyMFI19xhle3tsRXfqxvkWl/tOnaD8QUww+LLvqyw0ePVD9zDU
 Lsyuf32BvIhvqnigWQw5CBGfV5r3i6D/AgMD+8xhlCbQk4CHu8ga50X0H
 ynDWWB0V+zXlDT2NRKdHkXp/8liRekU2m50zU+suirnLkyYJ00Ny/UaiB
 WAmfLC4RITxvAF5Y75plb8dH8LbuLNnM0acJuQQOWg2rLuk1oSSHUdX+q
 ccD6Due+eGkCvwWoj7xhQ5TUhZwBXlNcl1MZrSGu99cFow33KydLWT8cg
 5ZWuof93ZtMsl5VXbDQrFmmawTVtGTzR4kXZFl3pK0diUNpNueFHsMeq/ Q==;
X-CSE-ConnectionGUID: 0QfR+xxjRC2qxiYU34yb2A==
X-CSE-MsgGUID: k/lQlq1dQ/a8ACEirijmYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86241367"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="86241367"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 04:32:25 -0700
X-CSE-ConnectionGUID: IY58G3qGRKW2rdhN+Yrjtg==
X-CSE-MsgGUID: PHQDSJvlR6CQR6sN0m0lZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="245621546"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 04:32:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 04:32:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 04:32:24 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 04:32:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=au6lnosxXjc3msvZR99YovfwveDUTWGAKPE9XccT9Q9Bm9Hz4qN7KXhYnTERdUnXxec5vq03PMwEJaCnlNso8AI89wMgCq6ga3RzmPOBJrnbkEhxlLxj/oy7gUikysqkmahc97bUq02x7vreFCimP/DKAkgXKDwrsPR9GiM0VXrWinFiIUpBmSkkJ2YMcK733zGLLzLe71u3COId0ZodbT55NuVBYj3/kc9uBwjriS8HrHJq0NfrCGUH0edaZTMuH1OGI//b78mcjoxDebE4P7jdORy+/qwkNbx4ldgJAQ765jLJZOOv3JQRPP7zfh09JPBixDTtvFSdDZFRyI6Faw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+X7ZF51/L4IGUJVLHksYUuOWt455NlaNzt9IqOkyEE=;
 b=B92LHFvgrjN2QKO/Ypa4C9Hu8JgI5/TjUPEAIAAbDkGaFlwOP/AnBhB4lhIfVgqYAZqJ8vKHex7cYpek459NGf008Qq9U6SXaEpym+VfKeDmVYC/Az+Xb6tB9Irse/tvLNswK66dc7bmq6aMNZrv6BAoHJsZXiTSZYbzFGwc0FnDEQ5shBUFuOASbWlJrxnZluuRgAsZd14wk+oW9ikzv/zK7Ro/QW6U0nk5U3TrrBMKeZonRnosUPZbBPssvdF2FX6UJtzK20myHBp+QQJgYmh14VlNJdbtmfsexJb7GabXG6gJU1ILzDlozWMkS+opRSkNgICgPySppsjTuAhfLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 11:30:59 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9723.014; Wed, 18 Mar 2026
 11:30:59 +0000
Message-ID: <eeae72bb-dcbf-43c4-bcc6-a34a3ca0d6ad@intel.com>
Date: Wed, 18 Mar 2026 17:00:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] intel-ci: Add VGA chamelium exclusion to Xe
 blocklist
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <kamil.konieczny@intel.com>
References: <20260316075611.3333142-1-mohammed.bilal@intel.com>
 <20260316075611.3333142-4-mohammed.bilal@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260316075611.3333142-4-mohammed.bilal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::12) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 948380b0-e352-46ef-e8e8-08de84e1d3b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: iYCCmPxckLVX3639xGjDER6Y0joTYuOgMwmGjBfvGs4DyZgc8DUh+zogUu0jc2atGImhlN0XUKmOGlsFFC6TY8iZ4qqOJmlO6g25izq8Xp7sZe/4mTJEDgnKkU0X92g1Dt9R5St1hWvIpU43YFWbSWaU8IXmTEJMqU3tk2qkjzT8wH8WbyIMBfO2CqQHSFJ5mAbCCvmgmpOKuE2Qd8iIuK7U/qvtsplwXJHcNz2/fTJHsZ8VkC/7MKJwpKJekckA9XkvuBDfSz2+XmqkjAUZyZXFZqivIiC+6Ld/lGtV3G8U7dX9dPz8gElIuq4GnQkaNAqe3tOD4Egkm+hBj8GOWB89RP8bjm3z66FfHb2U91YVYz2fG73L5/XbYABfxg0g/Nsqz0zxePpS/baZZBUB3Wm/+N7OY0E8mJPRKyeH8y8Yyg/ujEZAq3W1ZLgUThrFD5I7cZwa5wS+q3R+yjrm3wrrfjMPKe8F0JJ9Jrs8eXzXvjkYOSbsc3za3sXua+c9ucVim3CgfOnp3N/qsMFUhzk6xMyvILdNWm7aSG1/hyUhyEZ9+5gPTXmhwdjZAplfLIKIZJ//YJ7Fnm00t+Wp7jWubd5RW3sez50cw1sqd5pQACVROQoJUvcPXc+Gfbtd80a1cGqwSxQqCSjt2GufUBJWmp/MlMhgORBOiMU72N9aCrIpCxMMBelH4LTQNa1EPTxfYH/LcybsiCVHvKWgxK/MFvbKe83wTQDIhNXqQzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFkraVlJb05OUGFmOW1Fd2I5RnREaWM4aUZDYjRQMHBLZFBkcTQxTGhDNmE5?=
 =?utf-8?B?bEF4MzJObzZoMTFCbWxOeXY0eEdDcGVGa2dobC91SnhNaHRFb2NIM0U2ZWFR?=
 =?utf-8?B?MTM2dXJreTJSMXZ6Mm81L1N6YjBrRkNYSGFwZUt6RkxJNk5mcklJcFlrdDFq?=
 =?utf-8?B?b29ORnkrSXNCSXRtdHFwTmMzUzlJVFBja1g2VVVscW56dU9BWGhQR1ZQYjhB?=
 =?utf-8?B?ZDZQczFxWWhOM1VyWHF0NENNdkF0TnYxMEhMSXRNOWZzeDR4WHNYOTF0cXBZ?=
 =?utf-8?B?SDI5cWYrYUszamJRU0VwUllEM3FKbVlIYWVPaEg3bFNJcU91YlBkb3BpOVcx?=
 =?utf-8?B?UUsvNnZBOUM0ajllajhTZ2Yvbm1NRnpNNHpZVFh3ZlRXYk9PVmY5OFRuTkRz?=
 =?utf-8?B?cmhkRGt0UHNUTVIySGNQQk80dldmdkk1UDIwRzJ0SVlNdVFocENENW5Obm94?=
 =?utf-8?B?VTQxVngvU2xtdFFBbGhTNUF2aTdKYUJnRitsbk8xeURnZllZTnpKYkkwYnFG?=
 =?utf-8?B?TmRzMUZtMkpwT0xkN2R5MXlaeHpHTlVibEorUnR2TjNGeUhkQU9Jck11Uklo?=
 =?utf-8?B?enN3WWZyUUdwNXk0YkFxNmUvT2FSRUZSK1NOYzZ0amdkRm0vMEp6UHF2UUJW?=
 =?utf-8?B?Sk9CeWR3ZjhobEpRbkVqZ0QreU8rWEZFd0k0WG5mMXNoUmU2aHNGTkVkbk4z?=
 =?utf-8?B?UTNBREI5ZzlYbFFSSWlzSU1tOGZZMzJuRUJFRFBWSUR6OGNrVWZZcVBMSmVK?=
 =?utf-8?B?VWNGRXZuSjg2cHpMdThnaU5jNnJ3RnpPaVRpSnBNaVp4NGJqUzFxV0R4WTBt?=
 =?utf-8?B?c1ZKYTF4NEdqSi9TWlhKNG80ZmR1cWp5VFhKNER0aWNoelcyK1NLWlhYQVF4?=
 =?utf-8?B?dmhpRDhvbXhXZWJZUFp6b1NqdDd6SlpJWVdSWVkyM0o2a2phZGx1Yi9EQ3J3?=
 =?utf-8?B?S0NuRzVtN3JxNjhRZmV6MGVpNlozUTl4d0s4WnE3a1llZVR0N2xPTXV6Wmpk?=
 =?utf-8?B?SmlscHBlV0ljTWd2S2FKNlpwMDRwbTU4UXBxTS9ic2ZEc0RMdjgwcFVCeiti?=
 =?utf-8?B?RE9DRzVaV0p4aFJSbXRHV25oMmNpMHBpbkJtNlNyNFBoc245VnpmWmhqVHRG?=
 =?utf-8?B?R0lDVXF2bUcrSHZCWlh1d0dDVzRnRDJiRUhQN1hLR0dEbytlUyt6NEZoTlBr?=
 =?utf-8?B?dGxsalVlSHJqcFlERE9JQ25uNGpkZTBuU1VUQVhucC9qaGZVMk1PbVlFRitD?=
 =?utf-8?B?aEFpdmlHNGlGS2Frb0JNRjJURC9hNGl6Q0lqaGx6UWFYU3dXUDkwWHpwSTJ1?=
 =?utf-8?B?eFV4QUxlUUdSK2tXT2d3NEdUWWpCNDNPTWw3MmJCNVlob1F2ckQ1Nk1qTnBk?=
 =?utf-8?B?WWRTUWk1MTkzM1hRakhXa3pjNDc3UFBCTU9FQ3VZYkUwNVNLZUZQVVcxaCtn?=
 =?utf-8?B?SDRvaCt0eUFvc2N0akFoeGV5bkhyV0dOcTIyTkRsb2JLL3FWZHZkb3RtTG5y?=
 =?utf-8?B?QXBHSktDRFFTTmJMM2c0RWlwYXh1RjVleVY1QVRKczVHcUN5ZjEvUE1RMGNi?=
 =?utf-8?B?UWpWQjBad1R3OGRjaWpGTkhpc2MwbWQ1YzZLdjVBMm0wQU9hb2w1ZUdHWnJa?=
 =?utf-8?B?ZVdtcmN3VitkNFpZL1Ara01WVWdDNVZxRlhVS0IrS0FkaVlscnFyY2JaUXIx?=
 =?utf-8?B?WXdYM2M1cTRFYndBb1BhT2l1Mi9kbkFIaDVjdWgwQ3hNOFFDVHJnMldiLzhB?=
 =?utf-8?B?VjF2SkVwZnc2RFJ4OHdFZ2xVMkJvMWhVdS9BbXk0eGtFTmpnbnQ3OTJGWTkx?=
 =?utf-8?B?M004ZGxkcERiVU04RXZJYStJZHo3Zzlva1RJdk95dk1CWUdlcU9IK0tKTmJq?=
 =?utf-8?B?Qi9lSEVJNWlFYVRoQ2lIOEZwOG1FeEs4RmxpNWRzamkzSmRWdVFXT2tIanhZ?=
 =?utf-8?B?d3VyTndranFkdlpaNCtyYThpM0tzczhMVXpkMHlzc3ZQSGY0M1hxTjMzcjJl?=
 =?utf-8?B?WjRmTE1Qai9ac1FmRk9sZ085WnVLdVVLV1hFUjRBMnBNUld1TTR3N2loZ0xw?=
 =?utf-8?B?RHE1MFlvbjdFdEFrTzFtUDdpYVdydGJWMFM5R1NqRWtMcmNTZUdhdTFHdkNs?=
 =?utf-8?B?T1BCM3M4V1RvVUdiS0JCSExNcDFEcnlZZStCNVNvbUdYZEhWSnBrbWlTY3RC?=
 =?utf-8?B?TXgyVTJpWGhCekdaNXJNODR1Q0liaU9HUGNzZHU0anplOTF6cGVjTml2d2ZN?=
 =?utf-8?B?V0tBaTRSdFBDTlYvMVhpekJpZkY2QngyK1JUTlozd2VyN3cvblo4STc4ZVFT?=
 =?utf-8?B?aTRGd0hzRTVqbG5lTTFZNDMzY3Zjd0RoNnRWcHJaejQvUVFOWkVPQT09?=
X-Exchange-RoutingPolicyChecked: gv/6uvkdR1uJHdr8s56OCp13wA4wLzYCPvQ/Qvw6ya0ZSi02GXM3k8xn/wweny++qE/qbNnYCmSl/rV7/OROZuXNoDo8IodNUeaMUzCpIfyRciMMunvsie0izHJgdJ08kKXnjANJDIpx5l/uu1opFuGKWXg/tei2J3fJssZbWNV1Lv1yPXjkn5SgJLqWYVjJigHfivGDtCkOEZUNOuZ6BR5QTL4t1TRHMhWQ6I1Q+GvFsWipGppJKe022goCM2OkvjXP29mThKJveEPSXA4aHxfmEfIHXWuG/R9P+FHX7ySmRKUnM6Z66QBDSysxANJSD1WEQdn2BtwpB2/58QOa4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 948380b0-e352-46ef-e8e8-08de84e1d3b7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 11:30:59.1786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQXXJgWHJApPH362g0flOS1G2BHVd6ZUcGXio52fEAu2Hif3gdC2uOK2m0rcqumxhJL0UUqzRHx4xxvRGnnFIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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

Hi Bilal,

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 16-03-2026 01:26 pm, Mohammed Bilal wrote:
> Remove VGA-related subtests from the Xe chamelium testlist as Xe
> driver does not support VGA connector types.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index edc5039a9..80a0ee904 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -128,3 +128,7 @@ igt@xe_exec_compute_mode@non-blocking
>   ##################################################################
>   igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
>   ##################################################################
> +# Remove VGA-related subtests from the Xe chamelium testlist as Xe
> +# driver does not support VGA connector types.
> +##################################################################
> +igt@kms_chamelium.*@.*vga.*
