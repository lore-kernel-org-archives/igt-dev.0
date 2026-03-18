Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D949FCD0C6
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 07:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C3E10E6A4;
	Wed, 18 Mar 2026 07:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OuhPAy+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C91E10E6A4
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 07:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773819314; x=1805355314;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/0FjofGGoUy0vz5lYDBGS8xxX9tCdMNXoHS0YCS5BJE=;
 b=OuhPAy+aapyr0xMX+VBdNW3r+5KqXu3VoW7fsDNlRiijoOFtpJKZveoj
 6AtHoXMfC/iTYQ/3oMn2pvfzDYA2WMe7OEIr48zGJfMOzeniQ2zHZtlqf
 8sd0hj3QoFpSfLAOkW/MCqmqv3QZsrejngo4RDaZ+nCT94Qq+DTQFGL3f
 dV17a7B9qms0Bgz+QRgXqK5/jzIuyVrlw8ddMG2HlDMUGSBJSv5HSTKSD
 2uI+RMMzutXkhtNtHSHtHNxOGlVKffiteK9D/pv57O4IMbLD93AZuvIa7
 bDvYaCvFtShtuIu8LnPM1+iD8uQrYx+iH5lmWWKVIDYY7bW4m+8CQAUr6 w==;
X-CSE-ConnectionGUID: 9ZAUfBtUR0muGhRvP/FyTA==
X-CSE-MsgGUID: t3qRjnxVRraD5/1a/dPzog==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="62431149"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="62431149"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:35:13 -0700
X-CSE-ConnectionGUID: QXC622CvRSK9FdmwJu0NbQ==
X-CSE-MsgGUID: IrmB4p+yTMmgH88/cYRlWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260432213"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:35:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 00:35:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 00:35:12 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 00:35:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwFV8qwDud+/++NcHVAAHFPzvbVk5gxSowxa3ObUYVpAnF1388FobFxk4l9CbwJI8cig/tMrOThX5GFjQ5rgE6COanQlIfA1sD+4ef7wrgVwwcq/iAZl2QU/gHG9GJn16krNgsBGY08WVDWb4p3Uqwg48TiGGs2ysY8mC13uNIkeR16lnstzAcyuk+YyFmHEL+CX0urFToAxDJ2sDxUGEAyINr0in5FDfibVKBbYO9RjvfPK0hqL6vWytLKvgAhzc16KVtFaa+Ou5pnsiihfpnCsqH5dXL5XBvxWhQXL/JE1oWMH+b/FAkevIWiwq2gMDu9HyKlRBV9KXNNphINgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xS/8xcNGp574Z8bMiLgAkhLHnDj/UwnSoaUTGol3C5c=;
 b=coldUbzphQH59oZzAtHSfouAHt0JZz93dyK1FHv62CMBEYTp+CpTGyivTFOs6z+wFFnN9mFmhmfCsXTILiukvUbFYPb5Y3pRF5M1PThA3gZaNce24Kh3Lffaqcw9LQ2DIJBaqd0NrRQNKziaHPswR3h8Ce+PxtucKWLgL1O+qU4ZRcyVJ1XKCwXXKRLi1s/EvbKdgSUdDb0xtSseuUVnQ9hd7ht1qvRgxfcPF9yyL7N9tjeuqERP/F/xnECWC2g6oVwNueCWtvYCXVFe+FmigFXKAzftj5oCZ/mWB5VPPMH9CV7Ofybkc6RzE88hGvWmymkVBrm00pQLTI9KIsJ47A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PHXPR11MB9639.namprd11.prod.outlook.com (2603:10b6:510:3cb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 07:35:03 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9723.014; Wed, 18 Mar 2026
 07:35:02 +0000
Message-ID: <b2afa0a7-95f8-4f28-b95b-9504cff26fad@intel.com>
Date: Wed, 18 Mar 2026 13:04:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] lib/igt_hdr: Extract HDR helpers into igt_hdr library
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <wayne.lin@amd.com>, <Mark.Broadworth@amd.com>
References: <20260317175136.3754576-1-alex.hung@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260317175136.3754576-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::6) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PHXPR11MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: af497465-58ab-42d4-7ae6-08de84c0de0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info: xzdFJam0I1JK9c8KvIuW4BmyTYQhWlJfSZpiYfmuNAsrFn3fa2YnwqHcLIJ4j+D7UbNTpjG6F+4vn6ErmEPq1NgxA7LAkAi6bUySusIJqYADifAPHZb7igCM8XzgjOGBIga69j/DqRfM0Ivpo8sVk1qMjnCPKwT+cE+Dq49YU36MgGrVQWlOnq+Q29cR9e4ikpcW91OLD8uYscIoB3+QpfDzu84opZSPj8/+D172WHu9F9L++6B6LUfGZ1LCfUs5MNEFwV+IsVLA+KIImOIXLyeuRoesWegljYQVNck5pdzIl/oRMag+N/K3F90mZ02wPUNHimBmKYhe3G5N3J/OSkamxcrkCpQU5ibJvFt9V7kgNzkneTjp2IFiCT3wqVaFJkt5XAgHT4X2EfiS2uQV3kZLO/dj1GlVGJlJy12mN8BLnc7oDlcLjPKGMfvxAlB5qRSdPcLO1RH5FQY9q49CUNzrBGU6ipkLPMRRjofE6ezvx16zfoO9kORFf8Pje7Qg3KW1x2CfWx0dlcXFZ5U/mgCfRWzttzltwpyAzPQwBfqvtwTf1tGgAejcVo+82BuY+414hlQx1ukXUxh92C9P8tcRqm0n8vkg95iIvizkxVyu1BCu05w+EqMjqnR2M9nlY3vNrP+OEGbrJ0M8coF8vsDyg1IqNXLXGiM2+GGFcRgMswJeAFs3N1Nuf8HbWy2i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bitHMGpTakJOYmRrVGszZFo0T3JNRUdVaFZIWWV2eTJWVTFTQTJISU05dFA5?=
 =?utf-8?B?YUpvcFIyNTNpUDV2WjRFZ3dDR00yYnVhWFl5VDc0RXVUOXc4b2xpZjJISXds?=
 =?utf-8?B?SkRCK29OM3BSeUg4anhCY1lKUDVFUkFZS2VsMWFjQUZHL3ZPSUZ4TWlTdmlH?=
 =?utf-8?B?NUdvVThWSGE1d1puOE1za25XbkpvZGF4Z0ZUd1FBY2lqbVl6LzN4NlE0ZFJC?=
 =?utf-8?B?MjFZdFUrSW1UZGZpeklWZHpNZHhJaFdJSzg3RDQyZk9XUVRtMzNPdmNhaVdi?=
 =?utf-8?B?UE1od3E0MjVRR011Q2EycjR1L0p2RlAyaWp0RVlVaGhtR2NoNWNvcFpWSGVB?=
 =?utf-8?B?SzI0WFpHNzBOdWVrS1RpbE9yMnJMUytOSmx0YW1udldxNk1QN21QQkdmbERn?=
 =?utf-8?B?NTZPeXRXdDZ1ZXhIWlZ2Z05nOTVIa0lBYUVjNEJBaktlYVdrTGlKUm4wYlNI?=
 =?utf-8?B?UXNzamx5SVlDZzdSa2xQQ0h0YnFwS1ZTSjVBY2tldXMySXFUQkZ4dUdGYm1P?=
 =?utf-8?B?Z211ckd0dEpTelA4eEVpeGFJaFFoYTZ5Y1dEV3kwaENUaFEra2J0NEExbnhq?=
 =?utf-8?B?MXBEQzV3SlczaXFNcDNKaFdZK1d5VlByS2gzUkJLbHNCSTBxK0tteHkvSm50?=
 =?utf-8?B?TWtQbVFDV2tLbnpSNjAyZnhPUzRiYlBrWXFOeTFUVWswQ0dRNmd2c2t4M1RT?=
 =?utf-8?B?OUQ0a0ZwN2FJcUE3Y1BhbkVxb3U1VlZHd1lveXVVdS9qRm9VNjJhSTMwTDJr?=
 =?utf-8?B?TXVHSGxqS3RlS0Z0Ynp5NWFubWQ4SGIwWTdadXd0Z2UwY2ZWbytJYUhZdkh0?=
 =?utf-8?B?NkVPcnZLVUVuZnJNSDV5UDFQZlcrWkVkTGYzOFYvVlU1T2prbG04WFJHVUVr?=
 =?utf-8?B?UE5pQXFLVnJTVHUreGNNQnJHU0hZbklqL0laTlJTMWM1NVVyQUN0NmJUSmpt?=
 =?utf-8?B?dVVmVExRbWNxanQxcHArOGlWNklhR3lrQ3FaN2FEV0JUZzdEVGFhSkZoZVZJ?=
 =?utf-8?B?N3ZsVXU5eEZTUW1oN0F1UGh6RThQTzFZaUF4d1ZaeFErajAwTnprNjdWSWhi?=
 =?utf-8?B?MFZ2TU1aK2hoVGhxWmp3OVg2b2phOTdKaWQrK1Z2STNtZDVYSEF1QzNtWlkz?=
 =?utf-8?B?YzJpZTRpQTN0bnZSMG43ZDhFRHJaMHU1U2RqeFpCVEhHZ0ZTbDM2UVhRUWFT?=
 =?utf-8?B?N0VzYVg3c3cwNmppZ0JTNTFyRVZ1V2RnTlNrVUlVbExicldvbmxoTHY2SmNY?=
 =?utf-8?B?dDFYc0d6K01qSVU1QWhpNEhOOVZkT1dpcldnenJHV0NCZDhBcG00ZzNiNlhT?=
 =?utf-8?B?SmxnNEFLbmxnbzAyNFVCY1lybEs2WkhuNEVLVVdtekk0by9IWnBNSmQvU291?=
 =?utf-8?B?VjRqVVBSbVFEZlcrenNJazgzSGZRblIxSXYwVjhPeHgzcnRHYnFFa2xudnhl?=
 =?utf-8?B?a1hXUW1vcWUvSzRjd0lxM3ZIbDkrZGZySTcwUFJXMXNFY2U1VU1ydUxXTVF1?=
 =?utf-8?B?cVd2dm1aUll3YVMzT0MydWw5TUQ0WE5DRURMb3BwamVqMXBBWmszbW0ra1ow?=
 =?utf-8?B?TnpXUWJGZDErYmZmTDJwNWtJdys0NzB3RDNjb2Nyc1hNbHRyZHJXdTVHcExH?=
 =?utf-8?B?TkdrWnRIRDdHVnVIcXVlQUJDWFo3WU5JclBSME1SZ1JJREI0R0JRUEw4VEZq?=
 =?utf-8?B?Y3VPRmlOM21uMDRObDZSUE1yTnZ5RkVJWVRTL0ljV293bzlaRkkwZGZud3ZL?=
 =?utf-8?B?UGpmS0ZjRkdKYmdWRkNxdmRPVEtONE5ZdnB0WmZaM3UySnUxcFMxdC9kbXFw?=
 =?utf-8?B?bjFqQ01hSzNwYldtQksxVjdXMzNaM0ZVL2xUeHNidjM3NTcrK09ySGJ0UmZx?=
 =?utf-8?B?eXp3K3VCcFBOd3ArOFV0VVd3cWx2a0VtNnBBSzlaNkNPNitYcW5McktNYllU?=
 =?utf-8?B?RjdwWnllcG1OaGc4Q1dDY1hXazBlV1h0MS9jRk1rTStFd2xOclBMM0VNMUZE?=
 =?utf-8?B?bXRzamxZSlV5NlQ3eHFRNHJveGpwVm5QK1IxalIrMkFvdWRyeTZiRWVmOCs2?=
 =?utf-8?B?QXRvZE1JS1Nia1R0dXBrbGlsamlWcGxlYWQzb216STdOODJad3JVbHFZTDYw?=
 =?utf-8?B?dmNIUDI1Y3JBZE8rS283VXF5YkNQejg4UUhJVGNLNHZQZldpUnp1aTd2Z3Nq?=
 =?utf-8?B?S2p4TDdSNkZTTHBzb3pZdmRJU2hqdTVoK0lPZmpBSDNLd2g4WGN4TE1YNVBp?=
 =?utf-8?B?WmRIOUptOGg1NGJ0eGdtNWpDckVwYitNMXdQMlViL3VRUzJUVFpHUlpvZ2lw?=
 =?utf-8?B?QVRsWGhNK1VMYmFWUlpIbXJvckM3dGF6UXlxUmFXOUZKNG5zYkh1QT09?=
X-Exchange-RoutingPolicyChecked: ODbZPJDPoFVtS5X4Dh4dJTmVqHilALSltISDLthkyjXfRWzihfyf20IBuRMC8Z8shzrGQqSMMSD+rI35rjuDZWRL/9sU32rGHPgWy4EKqDIkyV4VrCzfT9LjGMu8UK/nhgBxMLRqKdvDf2Fw9drk2jDUjZLeltKU7Ys6IfJoKeOi4oqAMh6twRf1tevSm6Z6czBakcVDqvlnaMWG2lY7m5Goy81DYNGZzHl4saAiaODQPc8id9IyOU9MtaSNBTb7vBIMCjGrygEN+zm+5OsDhXNRbP8FSiznxcpQFOf+XwW/39cO3QUEzhVSneKSgGPfnem3zuvHBeND6A4+qARvGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: af497465-58ab-42d4-7ae6-08de84c0de0c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 07:35:02.8529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzIr6wS13odmHTf2vo3RLF2Kot/JkXAWeFun72S1doES8QQphSza6pDUdumwynYogKsgpPkRH/O+LscgBbje6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR11MB9639
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

Hi Alex,

We already ahve patch series to extract HDR in separate lib

https://patchwork.freedesktop.org/series/158425/

Series is reviewed. Need to fix CI regression.

Can you please add your patches on top of this?

On 17-03-2026 11:21 pm, Alex Hung wrote:
> Move HDR utility functions from kms_hdr test into a reusable library
> module. This includes metadata filling, EDID parsing, and conversion
> functions.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   lib/igt_hdr.c   | 220 ++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_hdr.h   |  58 +++++++++++++
>   lib/meson.build |   1 +
>   tests/kms_hdr.c | 179 ++-------------------------------------
>   4 files changed, 287 insertions(+), 171 deletions(-)
>   create mode 100644 lib/igt_hdr.c
>   create mode 100644 lib/igt_hdr.h
>
> diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
> new file mode 100644
> index 000000000..6368ae78b
> --- /dev/null
> +++ b/lib/igt_hdr.c
> @@ -0,0 +1,220 @@
> +/*
> + * Copyright © 2026 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#include <string.h>
> +#include <drm.h>
> +#include <drm_mode.h>
> +
> +#include "igt.h"
> +#include "igt_hdr.h"
> +#include "igt_edid.h"
> +
> +/**
> + * SECTION:igt_hdr
> + * @short_description: HDR (High Dynamic Range) helper library
> + * @title: HDR
> + * @include: igt_hdr.h
> + *
> + * This library provides helper functions for working with HDR metadata
> + * and HDR display capabilities.
> + */
> +
> +/**
> + * igt_hdr_calc_hdr_float:
> + * @val: The value to convert
> + *
> + * Converts a double to 861-G spec FP format
> + *
> + * Returns: The value converted to HDR floating point format
> + */
> +uint16_t igt_hdr_calc_hdr_float(double val)
> +{
> +	return (uint16_t)(val * 50000.0);
> +}
> +
> +/**
> + * igt_hdr_fill_output_metadata_st2084:
> + * @meta: Pointer to hdr_output_metadata structure to fill
> + *
> + * Fills HDR output metadata structure with test values for ST2084 (PQ) EOTF.
> + * Uses Rec. 2020 color primaries and typical HDR mastering display characteristics.
> + *
> + * Note: there isn't really a standard for what the metadata is supposed
> + * to do on the display side of things. The display is free to ignore it
> + * and clip the output, use it to help tonemap to the content range,
> + * or do anything they want, really.
> + */
> +void igt_hdr_fill_output_metadata_st2084(struct hdr_output_metadata *meta)
> +{
> +	memset(meta, 0, sizeof(*meta));
> +
> +	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> +	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
> +
> +	/* Rec. 2020 */
> +	meta->hdmi_metadata_type1.display_primaries[0].x =
> +		igt_hdr_calc_hdr_float(0.708); /* Red */
> +	meta->hdmi_metadata_type1.display_primaries[0].y =
> +		igt_hdr_calc_hdr_float(0.292);
> +	meta->hdmi_metadata_type1.display_primaries[1].x =
> +		igt_hdr_calc_hdr_float(0.170); /* Green */
> +	meta->hdmi_metadata_type1.display_primaries[1].y =
> +		igt_hdr_calc_hdr_float(0.797);
> +	meta->hdmi_metadata_type1.display_primaries[2].x =
> +		igt_hdr_calc_hdr_float(0.131); /* Blue */
> +	meta->hdmi_metadata_type1.display_primaries[2].y =
> +		igt_hdr_calc_hdr_float(0.046);
> +	meta->hdmi_metadata_type1.white_point.x = igt_hdr_calc_hdr_float(0.3127);
> +	meta->hdmi_metadata_type1.white_point.y = igt_hdr_calc_hdr_float(0.3290);
> +
> +	meta->hdmi_metadata_type1.max_display_mastering_luminance =
> +		1000; /* 1000 nits */
> +	meta->hdmi_metadata_type1.min_display_mastering_luminance =
> +		500;				   /* 0.05 nits */
> +	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
> +	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
> +}
> +
> +/**
> + * igt_hdr_fill_output_metadata_sdr:
> + * @meta: Pointer to hdr_output_metadata structure to fill
> + *
> + * Fills HDR output metadata structure with test values targeting SDR.
> + */
> +void igt_hdr_fill_output_metadata_sdr(struct hdr_output_metadata *meta)
> +{
> +	memset(meta, 0, sizeof(*meta));
> +
> +	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> +	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
> +
> +	/* Rec. 709 */
> +	meta->hdmi_metadata_type1.display_primaries[0].x =
> +		igt_hdr_calc_hdr_float(0.640); /* Red */
> +	meta->hdmi_metadata_type1.display_primaries[0].y =
> +		igt_hdr_calc_hdr_float(0.330);
> +	meta->hdmi_metadata_type1.display_primaries[1].x =
> +		igt_hdr_calc_hdr_float(0.300); /* Green */
> +	meta->hdmi_metadata_type1.display_primaries[1].y =
> +		igt_hdr_calc_hdr_float(0.600);
> +	meta->hdmi_metadata_type1.display_primaries[2].x =
> +		igt_hdr_calc_hdr_float(0.150); /* Blue */
> +	meta->hdmi_metadata_type1.display_primaries[2].y =
> +		igt_hdr_calc_hdr_float(0.006);
> +	meta->hdmi_metadata_type1.white_point.x = igt_hdr_calc_hdr_float(0.3127);
> +	meta->hdmi_metadata_type1.white_point.y = igt_hdr_calc_hdr_float(0.3290);
> +
> +	meta->hdmi_metadata_type1.max_display_mastering_luminance = 0;
> +	meta->hdmi_metadata_type1.min_display_mastering_luminance = 0;
> +	meta->hdmi_metadata_type1.max_fall = 0;
> +	meta->hdmi_metadata_type1.max_cll = 0;
> +}
> +
> +/**
> + * igt_hdr_cta_block_has_hdr:
> + * @edid_ext: Pointer to CTA extension block data
> + *
> + * Checks if a CTA extension block indicates HDR support.
> + *
> + * Byte 1: 0x07 indicates Extended Tag
> + * Byte 2: 0x06 indicates HDMI Static Metadata Block
> + * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
> + *         where ET_0: Traditional Gamma - SDR Luminance Range
> + *               ET_1: Traditional Gamma - HDR Luminance Range
> + *               ET_2: SMPTE ST 2084
> + *               ET_3: Hybrid Log-Gamma (HLG)
> + *               ET_4 to ET_5: Reserved for future use
> + *
> + * Returns: true if the block indicates HDR support, false otherwise
> + */
> +bool igt_hdr_cta_block_has_hdr(const char *edid_ext)
> +{
> +	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
> +	     (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
> +	    ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
> +	     (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
> +			return true;
> +
> +	return false;
> +}
> +
> +/**
> + * igt_hdr_is_panel_hdr:
> + * @drm_fd: DRM file descriptor
> + * @connector_id: KMS connector ID
> + *
> + * Checks if a panel/display supports HDR by parsing its EDID.
> + * Looks for HDR Static Metadata Block in CTA extension.
> + *
> + * Returns: true if the panel supports HDR, false otherwise
> + */
> +bool igt_hdr_is_panel_hdr(int drm_fd, uint32_t connector_id)
> +{
> +	bool ok;
> +	int i, j, offset;
> +	uint64_t edid_blob_id;
> +	drmModePropertyBlobRes *edid_blob;
> +	const struct edid_ext *edid_ext;
> +	const struct edid *edid;
> +	const struct edid_cea *edid_cea;
> +	const char *cea_data;
> +	bool ret = false;
> +
> +	ok = kmstest_get_property(drm_fd, connector_id,
> +			DRM_MODE_OBJECT_CONNECTOR, "EDID",
> +			NULL, &edid_blob_id, NULL);
> +
> +	if (!ok || !edid_blob_id)
> +		return ret;
> +
> +	edid_blob = drmModeGetPropertyBlob(drm_fd, edid_blob_id);
> +	igt_assert(edid_blob);
> +
> +	edid = (const struct edid *) edid_blob->data;
> +	igt_assert(edid);
> +
> +	drmModeFreePropertyBlob(edid_blob);
> +
> +	for (i = 0; i < edid->extensions_len; i++) {
> +		edid_ext = &edid->extensions[i];
> +		edid_cea = &edid_ext->data.cea;
> +
> +		/* HDR not defined in CTA Extension Version < 3. */
> +		if ((edid_ext->tag != EDID_EXT_CEA) ||
> +		    (edid_cea->revision != CTA_EXTENSION_VERSION))
> +				continue;
> +		else {
> +			offset = edid_cea->dtd_start;
> +			cea_data = edid_cea->data;
> +
> +			for (j = 0; j < offset; j += (cea_data[j] & 0x1f) + 1) {
> +				ret = igt_hdr_cta_block_has_hdr(cea_data + j);
> +
> +				if (ret)
> +					break;
> +			}
> +		}
> +	}
> +
> +	return ret;
> +}
> diff --git a/lib/igt_hdr.h b/lib/igt_hdr.h
> new file mode 100644
> index 000000000..a6faef443
> --- /dev/null
> +++ b/lib/igt_hdr.h
> @@ -0,0 +1,58 @@
> +/*
> + * Copyright © 2026 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#ifndef IGT_HDR_H
> +#define IGT_HDR_H
> +
> +#include "config.h"
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <linux/types.h>
> +
> +struct hdr_output_metadata;
> +struct igt_fb;
> +
> +/* HDR EDID parsing. */
> +#define CTA_EXTENSION_VERSION		0x03
> +#define HDR_STATIC_METADATA_BLOCK       0x06
> +#define USE_EXTENDED_TAG		0x07
> +
> +/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
> +enum hdmi_metadata_type {
> +	HDMI_STATIC_METADATA_TYPE1 = 0,
> +};
> +
> +enum hdmi_eotf {
> +	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
> +	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
> +	HDMI_EOTF_SMPTE_ST2084,
> +};
> +
> +uint16_t igt_hdr_calc_hdr_float(double val);
> +void igt_hdr_fill_output_metadata_st2084(struct hdr_output_metadata *meta);
> +void igt_hdr_fill_output_metadata_sdr(struct hdr_output_metadata *meta);
> +bool igt_hdr_cta_block_has_hdr(const char *edid_ext);
> +bool igt_hdr_is_panel_hdr(int drm_fd, uint32_t connector_id);
> +
> +#endif /* IGT_HDR_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index cd03e8f63..71ca60e66 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -114,6 +114,7 @@ lib_sources = [
>   	'igt_psr.c',
>   	'igt_amd.c',
>   	'igt_edid.c',
> +	'igt_hdr.c',
>   	'igt_eld.c',
>   	'igt_infoframe.c',
>   	'igt_color.c',
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index f30902b72..382fcd823 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -33,6 +33,7 @@
>   #include <termios.h>
>   #include <unistd.h>
>   #include "igt_edid.h"
> +#include "igt_hdr.h"
>   
>   /**
>    * SUBTEST: bpc-switch
> @@ -70,24 +71,8 @@
>   
>   IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
>   
> -/* HDR EDID parsing. */
> -#define CTA_EXTENSION_VERSION		0x03
> -#define HDR_STATIC_METADATA_BLOCK       0x06
> -#define USE_EXTENDED_TAG		0x07
> -
>   #define BACKLIGHT_PATH "/sys/class/backlight"
>   
> -/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
> -enum hdmi_metadata_type {
> -	HDMI_STATIC_METADATA_TYPE1 = 0,
> -};
> -
> -enum hdmi_eotf {
> -	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
> -	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
> -	HDMI_EOTF_SMPTE_ST2084,
> -};
> -
>   /* Test flags. */
>   enum {
>   	TEST_NONE = 1 << 0,
> @@ -148,50 +133,6 @@ static void draw_hdr_pattern(igt_fb_t *fb)
>   	igt_paint_test_pattern_color_fb(fb->fd, fb, 1.0, 1.0, 1.0);
>   }
>   
> -/* Converts a double to 861-G spec FP format. */
> -static uint16_t calc_hdr_float(double val)
> -{
> -	return (uint16_t)(val * 50000.0);
> -}
> -
> -/* Fills some test values for ST2084 HDR output metadata.
> - *
> - * Note: there isn't really a standard for what the metadata is supposed
> - * to do on the display side of things. The display is free to ignore it
> - * and clip the output, use it to help tonemap to the content range,
> - * or do anything they want, really.
> - */
> -static void fill_hdr_output_metadata_st2084(struct hdr_output_metadata *meta)
> -{
> -	memset(meta, 0, sizeof(*meta));
> -
> -	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> -	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
> -
> -	/* Rec. 2020 */
> -	meta->hdmi_metadata_type1.display_primaries[0].x =
> -		calc_hdr_float(0.708); /* Red */
> -	meta->hdmi_metadata_type1.display_primaries[0].y =
> -		calc_hdr_float(0.292);
> -	meta->hdmi_metadata_type1.display_primaries[1].x =
> -		calc_hdr_float(0.170); /* Green */
> -	meta->hdmi_metadata_type1.display_primaries[1].y =
> -		calc_hdr_float(0.797);
> -	meta->hdmi_metadata_type1.display_primaries[2].x =
> -		calc_hdr_float(0.131); /* Blue */
> -	meta->hdmi_metadata_type1.display_primaries[2].y =
> -		calc_hdr_float(0.046);
> -	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
> -	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
> -
> -	meta->hdmi_metadata_type1.max_display_mastering_luminance =
> -		1000; /* 1000 nits */
> -	meta->hdmi_metadata_type1.min_display_mastering_luminance =
> -		500;				   /* 0.05 nits */
> -	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
> -	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
> -}
> -
>   /* Sets the HDR output metadata prop. */
>   static void set_hdr_output_metadata(data_t *data,
>   				    struct hdr_output_metadata const *meta)
> @@ -365,80 +306,6 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   	}
>   }
>   
> -static bool cta_block(const char *edid_ext)
> -{
> -	/*
> -	 * Byte 1: 0x07 indicates Extended Tag
> -	 * Byte 2: 0x06 indicates HDMI Static Metadata Block
> -	 * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
> -	 *	       where ET_0: Traditional Gamma - SDR Luminance Range
> -	 *	             ET_1: Traditional Gamma - HDR Luminance Range
> -	 *	             ET_2: SMPTE ST 2084
> -	 *	             ET_3: Hybrid Log-Gamma (HLG)
> -	 *	             ET_4 to ET_5: Reserved for future use
> -	 */
> -
> -	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
> -	      (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
> -	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
> -	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
> -			return true;
> -
> -	return false;
> -}
> -
> -/* Returns true if panel supports HDR. */
> -static bool is_panel_hdr(data_t *data, igt_output_t *output)
> -{
> -	bool ok;
> -	int i, j, offset;
> -	uint64_t edid_blob_id;
> -	drmModePropertyBlobRes *edid_blob;
> -	const struct edid_ext *edid_ext;
> -	const struct edid *edid;
> -	const struct edid_cea *edid_cea;
> -	const char *cea_data;
> -	bool ret = false;
> -
> -	ok = kmstest_get_property(data->fd, output->id,
> -			DRM_MODE_OBJECT_CONNECTOR, "EDID",
> -			NULL, &edid_blob_id, NULL);
> -
> -	if (!ok || !edid_blob_id)
> -		return ret;
> -
> -	edid_blob = drmModeGetPropertyBlob(data->fd, edid_blob_id);
> -	igt_assert(edid_blob);
> -
> -	edid = (const struct edid *) edid_blob->data;
> -	igt_assert(edid);
> -
> -	drmModeFreePropertyBlob(edid_blob);
> -
> -	for (i = 0; i < edid->extensions_len; i++) {
> -		edid_ext = &edid->extensions[i];
> -		edid_cea = &edid_ext->data.cea;
> -
> -		/* HDR not defined in CTA Extension Version < 3. */
> -		if ((edid_ext->tag != EDID_EXT_CEA) ||
> -		    (edid_cea->revision != CTA_EXTENSION_VERSION))
> -				continue;
> -		else {
> -			offset = edid_cea->dtd_start;
> -			cea_data = edid_cea->data;
> -
> -			for (j = 0; j < offset; j += (cea_data[j] & 0x1f) + 1) {
> -				ret = cta_block(cea_data + j);
> -
> -				if (ret)
> -					break;
> -			}
> -		}
> -	}
> -
> -	return ret;
> -}
> -
>   /* Sets the HDR output metadata prop with invalid size. */
>   static int set_invalid_hdr_output_metadata(data_t *data,
>   					   struct hdr_output_metadata const *meta,
> @@ -490,7 +357,7 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
>   
>   	draw_hdr_pattern(&afb);
>   
> -	fill_hdr_output_metadata_st2084(&hdr);
> +	igt_hdr_fill_output_metadata_st2084(&hdr);
>   
>   	/* Start with no metadata. */
>   	igt_plane_set_fb(data->primary, &afb);
> @@ -559,36 +426,6 @@ cleanup:
>   	igt_remove_fb(data->fd, &afb);
>   }
>   
> -/* Fills some test values for HDR metadata targeting SDR. */
> -static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
> -{
> -	memset(meta, 0, sizeof(*meta));
> -
> -	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> -	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
> -
> -	/* Rec. 709 */
> -	meta->hdmi_metadata_type1.display_primaries[0].x =
> -		calc_hdr_float(0.640); /* Red */
> -	meta->hdmi_metadata_type1.display_primaries[0].y =
> -		calc_hdr_float(0.330);
> -	meta->hdmi_metadata_type1.display_primaries[1].x =
> -		calc_hdr_float(0.300); /* Green */
> -	meta->hdmi_metadata_type1.display_primaries[1].y =
> -		calc_hdr_float(0.600);
> -	meta->hdmi_metadata_type1.display_primaries[2].x =
> -		calc_hdr_float(0.150); /* Blue */
> -	meta->hdmi_metadata_type1.display_primaries[2].y =
> -		calc_hdr_float(0.006);
> -	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
> -	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
> -
> -	meta->hdmi_metadata_type1.max_display_mastering_luminance = 0;
> -	meta->hdmi_metadata_type1.min_display_mastering_luminance = 0;
> -	meta->hdmi_metadata_type1.max_fall = 0;
> -	meta->hdmi_metadata_type1.max_cll = 0;
> -}
> -
>   static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>   			     igt_output_t *output, uint32_t flags)
>   {
> @@ -625,7 +462,7 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>   	}
>   
>   	/* Enter HDR, a modeset is allowed here. */
> -	fill_hdr_output_metadata_st2084(&hdr);
> +	igt_hdr_fill_output_metadata_st2084(&hdr);
>   	set_hdr_output_metadata(data, &hdr);
>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> @@ -654,7 +491,7 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>   	/* Enter SDR via metadata, no modeset allowed for
>   	 * amd driver, whereas a modeset is required for
>   	 * intel driver. */
> -	fill_hdr_output_metadata_sdr(&hdr);
> +	igt_hdr_fill_output_metadata_sdr(&hdr);
>   	set_hdr_output_metadata(data, &hdr);
>   	if (is_amdgpu_device(data->fd))
>   		igt_display_commit_atomic(display, 0, NULL);
> @@ -687,7 +524,7 @@ static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
>   	struct hdr_output_metadata hdr;
>   	size_t metadata_size = sizeof(hdr);
>   
> -	fill_hdr_output_metadata_st2084(&hdr);
> +	igt_hdr_fill_output_metadata_st2084(&hdr);
>   
>   	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, 1), -EINVAL);
>   	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
> @@ -725,13 +562,13 @@ static void test_hdr(data_t *data, uint32_t flags)
>   		}
>   
>   		/* For negative test, panel should be non-hdr. */
> -		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output)) {
> +		if ((flags & TEST_INVALID_HDR) && igt_hdr_is_panel_hdr(data->fd, output->id)) {
>   			igt_info("%s: Can't run negative test on HDR panel.\n",
>   				 igt_output_name(output));
>   			continue;
>   		}
>   
> -		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output)) {
> +		if ((flags & ~TEST_INVALID_HDR) && !igt_hdr_is_panel_hdr(data->fd, output->id)) {
>   			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
>   				 igt_output_name(output));
>   			continue;
> @@ -760,7 +597,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>   				     crtc);
>   
>   			/* Signal HDR requirement via metadata */
> -			fill_hdr_output_metadata_st2084(&hdr);
> +			igt_hdr_fill_output_metadata_st2084(&hdr);
>   			set_hdr_output_metadata(data, &hdr);
>   			if (igt_display_try_commit2(display, display->is_atomic ?
>   						    COMMIT_ATOMIC : COMMIT_LEGACY)) {
