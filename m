Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181B2C79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 06:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FE310E5AD;
	Thu, 10 Sep 2026 06:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lU4UDDjr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1072810E5AD
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 06:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789023285; x=1820559285;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/I1lQjfFCwVo1I8ra0+WNFiC0++PIOfJ+0HAu6L8EuI=;
 b=lU4UDDjrJpHbsBqQyPfE/ATCLnrJkrzpo9yAwGWh8FEw8Xj5tCG42Nyc
 x1yCT1WE0LeLuDZ3Mln5U6XyLrLcguON43qE5OYz+9O9Kq5BCUvvQM8GH
 /mebOzxWv1AL+oadX5XNJ2divFzrpJCHf0juyYmaxZaCcSFMj2AeaK3F3
 KaPnAGzMforCRw2PJt5kP+WmhjpMZ18D4wNLG2Hac2eiXRqnFD8wz8lRl
 45omnrELkXKYtGk4r0CcUxpXb3Q5yHYCIRgJGMb7kV6NMitLOE0+0oVqg
 pjyhgOq+15o1eVVEkM2hAtFbUD190fMWSQlGCZrg7pRAZN2FgE48Attn9 A==;
X-CSE-ConnectionGUID: 2Ml9TlYGS9O/ZdrYr1RCNw==
X-CSE-MsgGUID: 1t/gblsuQwOp/xCeAtmu+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89396576"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="89396576"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 23:54:45 -0700
X-CSE-ConnectionGUID: bkWvtmEgTUCzYaQnhbtwgg==
X-CSE-MsgGUID: gxy+8dHkQzO7PnCgjzbcsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="271060758"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 23:54:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 23:54:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 23:54:43 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 23:54:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVi1wZRoWCWDLnlRRhqJSKxmpVLa5FMSE3ZXDLvbN5OFqVozRChX5tGBFAO82euWbzu2sSFL3n+2Ab8HEVTSLeAsAb2+CKYrCMTS6RbHO5e11duwQ+qXZHE0KGEcwv1LWeFwwQXdy7HKf0T8VU0orL4UO2ZDSxjHt9w80cFEnJUu8bp3bAI58uPJIVNKfujQH3G2T+XtJgALeFrpiKdTTAtunriZJkYQ9FjiTd9rG68GghxompXyXva21XH/DFd9zxZ5r4UQ0qyhRLBeAZhD1o6WmRnudSiF5mErM1CmT4tS4zYvbMi2N+Sx0tJz3RO5I8aY4aWXtuUfmsBerGjJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUCqtYtKmoXSdSCd2arqr6roLA9DMY9sR6H6HYlWbPM=;
 b=kwRXaR13vxxh/bi926xC4UIsnZ8aKUgz2XAlgM2xSEfvzWQTRE8K4BlokyOAcvfpcfHEbRBLREfQl6ewjsNNcRVIGNMgpNaOzUNgI2p1pteEuPN7/95EJYrG5r1r5TwuqU+Xq8cCfaQoxEBHNIiJdX4n7l4Cb2X2mZm3PEF3lOeSutkz9RTlGe/ouzGDWEMcPkhGkSy6GTMoalKuGmsflwYSIkcxZH58CyqkLCX0deRIrCRFGuuV8rMI+Kyahad/HOYntPGto2HcGstKI0zumyqLMbbSowqUmV06krrwQp449rAlPvyBjyDHf12MuETMqIRvPhECSxaN3cV3TzKuaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7631.namprd11.prod.outlook.com (2603:10b6:8:14e::14)
 by IA4PR11MB9371.namprd11.prod.outlook.com (2603:10b6:208:56a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 06:54:39 +0000
Received: from DS0PR11MB7631.namprd11.prod.outlook.com
 ([fe80::cdd2:4a9a:9dca:5825]) by DS0PR11MB7631.namprd11.prod.outlook.com
 ([fe80::cdd2:4a9a:9dca:5825%7]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 06:54:38 +0000
Message-ID: <a88e9562-bcf6-42df-915a-98b10516dc63@intel.com>
Date: Thu, 10 Sep 2026 12:24:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v2 1/2] tests/intel: Add kms_hdmi_audio_bw test
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260908062541.490631-1-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260908062541.490631-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0039.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::16) To DS0PR11MB7631.namprd11.prod.outlook.com
 (2603:10b6:8:14e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7631:EE_|IA4PR11MB9371:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4c158b-94f0-4e00-a507-08df0f0861cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 06rA8qMBEi2yysBCe7gpaUixSYZZlmvLIo5l6ZGKs/jR3o4KRsqjBwSlc29GbaUC4FoHfVxVkv7oqcBmZdTShCcdlBxcIkKJ1subLYofwyWSRikvrC6HTgbtybyiP5vYjymD2H15SWTuFS47AkVi6P/9YZoQtE9FHlGXEppGN+J77wEegznzGL2AlehBEKw3lfAjiDgc9mcK3JwDxtryzta/XWRdvKnKIb6Q/j/G/ma+cMs7zvhafEIN9Awt/y5XIhRVc2hdAgaaAYP9rTuDNyly6jYcvTOWiELJUd9RktV214w7VZVeODdKWBYEEGsJCwi2uYXOj87Ev0jk58JmBGk363Z5uBvez2Iyz3Ukx4TuxRWxAUAr0Sbw1pfcFkFfUlG//L72fEUtF5/Li6Z60xQ5d6sPctYbEiXKGDyw8yX0w78HM5V03u4EtTX1a4msFIrJbSp+QxLltn4mabXbJ4pMxh7cNoJcYHef8ayXdWCoODhfxpehijOHj8Q5iT2rpYoj3evO9neHUC49KvfXVzcLwwrXV6QOSIbRyI0IeV5ITs/b5JodK0Sdamwr5Aeq09R90C9Rz0EaCqUXTGRNUQjOFRZVOXRqFL79TqGrUooe6fmr3omlCquvQj1O59Uq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7631.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW5XNy8zRkFoeklaT1prejBCVWdRMWRmZFRQN0lqR0o5YXV0MkVvcmFmaWdN?=
 =?utf-8?B?emRGL1IxYnVFN0pkdWhueE0vL1lHTVBadDU0VWc0bS9tc3VkU3FHSzc0Tzhu?=
 =?utf-8?B?MVE0a2pLS0pXWXh1NHBpY05UTDN5V1MvRGUwbWkvSWIxL3NhV0JPMDlLRHdV?=
 =?utf-8?B?cHE0YjM0aW1XYTg2M0RSRlVlYm1BOTVBaGhOMThPM1RWOTNkdVlKWG9jMFI4?=
 =?utf-8?B?NXBRejdBN1BhcjE1N3VuTFZxS2JKWlJIY01BS2RySmQ0VDY0WGxDcU84VXE0?=
 =?utf-8?B?TXVsL043S3JGSkcyQ0k0b2RYbWtETjFTL0JJeUNEMVE5NW5MWmRUU0phZmN5?=
 =?utf-8?B?NzVPNk5vY3BRNzUzdkluZlJJbldybCtxU2RTQitzcWRvb3pDelRkdEUxRm1k?=
 =?utf-8?B?c1lrZ1BkQUZQR25MMUQ1ME5iMjl3OVFBc0p5dURpTlJqNTVheTE1R1krUFlx?=
 =?utf-8?B?R3MwdFZNMEVYUDRPRkw1ZW54NTBEakhXQzBMVHBUWGxEZzJQaHNkdGY3YnBP?=
 =?utf-8?B?RWJLNzFQMmR4MWFWVk5pdzg3M0FxRk1iMmV3QmE2V1BvbDFuVFEyNDNnRm40?=
 =?utf-8?B?QzVhd0lzelp1SEkybzVuNHpsT2RaYStHYWdGZzh4WCtTUnlwaVNGSUhQaU5r?=
 =?utf-8?B?ZlpXVmlJaEloNmlmcHpvbEZYNk1DdlFiUFNOMDVaL0c1V0ZwZlp0R1hiTHhv?=
 =?utf-8?B?VTgyTGZHcGxDVEVwcDJ3dWppMlZyWTJwNnFCNTBSL3dHd21mdTY3citaNEww?=
 =?utf-8?B?ZUFPcnBYWTZ6NFlCZXhYaFNFNHFDdkJvb3ZkYzUzYjh0WHFYbE9pQnl5d0ly?=
 =?utf-8?B?enI3dmdwOWpYU3VHcGYrZi9CT3pQd0YxZlFKS3BTc0RVMk1jWDdGWkFoUUtp?=
 =?utf-8?B?VjFkSHpNNkF1RlFZZDRFUUpNbHZIYnd4alJDMVlhV0JRMUNVbTdOay9rYkEx?=
 =?utf-8?B?enVoRGE0ZTZZcENzY0VIQ3E2ZTdaYUZyaTJMQkZRR2tMQ1NZdFQrcXRHQTdS?=
 =?utf-8?B?YStFQlBMbmxlMkx5UUZEeTh5bG5DaUdaNkRscjM4WVhpN0gzQ2dVbnFodm5H?=
 =?utf-8?B?aUpBSk1ZTXIvVnk3ckZMYWlWZGkvU2VZVDErQkN4dFZPQ2diM25YdU12d2hp?=
 =?utf-8?B?cHZ0TjlDK0RpOFdYc2ExVzJuZUFPMy9UaXplbzJ1aU5zcWJldk4vYTZ4MHho?=
 =?utf-8?B?VmVtdjNkcVRwSnB6dS9xeFFaUWo4Qy92Qjd4a1dMSjkxOG9pUVYwaC9TODMv?=
 =?utf-8?B?blg2ZUk2aE5XMnlEbFE2RUNOS1NTSndOZFhHdW5tL2ZsblppUHdybjloZUpw?=
 =?utf-8?B?SUs5bWpFVnNwNUlaUno3Tm41U3Z6UXJ2QlZkRHFReWdPSXhKaTFNZlNaUWNJ?=
 =?utf-8?B?ekNwSjlmRDN2cXVGNStnSFp6a21iaDBwL3JzUFAwbklzYytKVVd2QzRYK1hv?=
 =?utf-8?B?eDc0dCszdlhHSkYwSloxcVY2bjZ4andSV216dkxZVk4yOHRKTkVqU1F5N0pn?=
 =?utf-8?B?MlkxN1lmVHNEeWEyRm9mTGxESVVLY2l2VTF5c0x3MndScUI4MTRhSjRHWEFS?=
 =?utf-8?B?MnZuNkl5TGYyMTBNWTVVa0NGS3dSK2ZvMTBKc0NrT2NpVkJvYlZ3WGpMUVBv?=
 =?utf-8?B?L1cyaURLelU0MDkvYWs4RjRBMWUybzArL3ByWllXcDVWNS9YL3p3dmJldmxh?=
 =?utf-8?B?Rk1DVVhlaW1jRGEvVnNsa0NZcWs2WmpZTGwxcUduaDc4enF6VGl3TERTYUtB?=
 =?utf-8?B?c1NYU0ZISHFZbEluNU1XSkRCT0ViVTBMMjBFVFhEcGorN3JuZytDa3lOblVs?=
 =?utf-8?B?QTZjc043N25lWG44TGVMOW5oc3dINEwzck5nSkxJYWo1bnBtOXgxTk1jYUZt?=
 =?utf-8?B?NVMrL2NDLzRQU2ZrREMveExuMm9rckJrQm9vaUFmOWpYSEJVTm9RTTNRK0N0?=
 =?utf-8?B?aUJPZXZZalFpSHgrUGEwcGs4ZHBpaHNNcmRJSHlxRm1DT1NXNy9UTXZycllF?=
 =?utf-8?B?T3Y4Q1YxeExwRy95cUxVajRrQUZYMHk3OXgyOHRLSE5PQWtIVmIweWNteEY4?=
 =?utf-8?B?bVNwV2Z3c1dwTzN5WUVVQWo4WVI1T0Q0Y0pueWZpMUZzaGFxQlllYVNtYk8y?=
 =?utf-8?B?S1VYaWVaODVsejBOQzdnZUM3OTRHSmkxTzhzMkhSRXczYklaZHhscktsdlpz?=
 =?utf-8?B?K0xuUkgzU3pHNU1uYW1LclYzc05SVXRzeXR1QS9EWGZxKy90SGdtQVNuUHdU?=
 =?utf-8?B?eUpMdU5lVXZNa3Z5am5yZzM1RG5qcU1XT2FRZDk1ei9sMll6SXBHQVlSSEJL?=
 =?utf-8?B?dTRwNmxORVh0YVV0RFJmL0JGWmNCZ2owNXpYWDhielNjN214TU5xNTNjWm1t?=
 =?utf-8?Q?Fzq+BXbnH2ATd4uVGsAD8v6GTxkq5plNO4Lxl?=
X-Exchange-RoutingPolicyChecked: 5MMYXNViUK2r8/5Pmy8bUc15B+S45b+p35S5GHTX1clPF7NBWBtSebevXB+YAzUdAtMsBnqf53Ywlq57CqS46O2jGXOQ83vHVFwxgvXl9+I4dciIpFJQyvteFRqBlnkKazIFWRlGDFU3vtt7hD8X5Z3uHo7WwWsPgeiScdprdsqi+y4uQTuEveYc3ctWCZ9YOMjFrYRkdVeNFfHv6KUH6KTNlbb/jVjcjybC01OABdM3w6PtfqpjYtePjKKsRdqp7b5PHz0NYovziU92e13gjholUH76kLQkqvI1Ia+5oueZ0XdUT2ie1A3KOUJ8LQXlC5MY13gXwd79/6wKEeRt2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4c158b-94f0-4e00-a507-08df0f0861cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7631.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 06:54:38.7826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6YWqXKYJqUCxXb2ISxrwEJJyGULyGknZeTS5pizyBA2vGZFok/4/4d5wWIwr8giQ86z8XqwtklqvydNFMQxs1rBAqJPhwadWvHNPE5P6/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9371
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



On 9/8/2026 11:55 AM, Swati Sharma wrote:
> Add a new IGT test to validate HDMI TMDS audio bandwidth
> constraints under varying horizontal blanking intervals, bits per
> color component, and audio channel counts.
> 
> The test injects EDIDs declaring all seven CEA PCM sample rates
> from 32 kHz through 192 kHz and observes which rates the driver
> exposes through ELD (EDID-Like Data). It also validates HDMI audio
> state and rate preservation across suspend-to-memory,
> suspend-to-disk, and DPMS display power transitions.
> 
> The bandwidth checks compare the modeled packet requirement with
> the rates exposed in ELD for each configuration. The test covers
> both hblank=160 and hblank=80 modes, 8/10/12 BPC, and 2/8 audio
> channels.
> 
> Subtests:
> - audio-bw-hblank160: Validate audio bandwidth with 160-pixel
>    horizontal blanking.
> - audio-bw-hblank80: Validate audio bandwidth with 80-pixel
>    horizontal blanking.
> - suspend-mem-audio-recovery: Validate recovery after suspend to
>    memory.
> - suspend-disk-audio-recovery: Validate recovery after suspend to
>    disk (hibernate).
> - dpms-audio-recovery: Validate recovery across a DPMS off/on cycle.
> 
> v2:
> - Remove the unused xe query include and rename the HDMI VSDB
>    local to vsdb.
> - Document HDMI VSDB values, the single-SAD ELD assumption, and
>    asynchronous ELD polling.
> - Use accurate 88.2k/176.4k labels and validate both ELD
>    over-pruning and under-pruning.
> - Make speaker allocation explicit for stereo and 8-channel audio.
> - Consolidate suspend recovery paths and align suspend names and
>    documentation with SUSPEND_STATE_MEM and SUSPEND_STATE_DISK.
> - Rename bandwidth subtests around their hblank inputs.
> - Rename the DPMS recovery subtest to match its off/on operation.

LGTM
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Please make sure the followwing is merged before this.


https://lore.kernel.org/igt-dev/20260901113313.627816-1-chaitanya.kumar.borah@intel.com/T/#u


> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> ---
>   tests/intel/kms_hdmi_audio_bw.c | 598 ++++++++++++++++++++++++++++++++
>   tests/meson.build               |   1 +
>   2 files changed, 599 insertions(+)
>   create mode 100644 tests/intel/kms_hdmi_audio_bw.c
> 
> diff --git a/tests/intel/kms_hdmi_audio_bw.c b/tests/intel/kms_hdmi_audio_bw.c
> new file mode 100644
> index 000000000..c6b052744
> --- /dev/null
> +++ b/tests/intel/kms_hdmi_audio_bw.c
> @@ -0,0 +1,598 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms hdmi audio bw
> + * Category: Display
> + * Description: Validate HDMI TMDS audio bandwidth constraints by injecting
> + *              EDIDs with all sample rates declared and observing which rates
> + *              the driver exposes (via ELD) under varying BPC / channel /
> + *              hblank configurations.
> + * Driver requirement: i915, xe
> + * Mega feature: Display Audio
> + */
> +
> +#include "config.h"
> +
> +#include <math.h>
> +#include <string.h>
> +
> +#include "igt.h"
> +#include "igt_edid.h"
> +#include "igt_eld.h"
> +#include "igt_aux.h"
> +
> +/**
> + * SUBTEST: audio-bw-hblank160
> + * Description: Validate HDMI audio bandwidth with 160-pixel horizontal
> + *              blanking across BPC and channel combinations.
> + *
> + * SUBTEST: audio-bw-hblank80
> + * Description: Validate HDMI audio bandwidth with 80-pixel horizontal
> + *              blanking across BPC and channel combinations.
> + *
> + * SUBTEST: suspend-%s-audio-recovery
> + * Description: Validate audio state restoration after %arg[1] with
> + *              constrained hblank=80 and 12bpc.
> + *
> + * arg[1]:
> + *
> + * @mem: Suspend to memory, respecting the system's mem_sleep default
> + * @disk: Suspend to disk (hibernate)
> + *
> + * SUBTEST: dpms-audio-recovery
> + * Description: Validate audio state restoration after a DPMS off/on cycle
> + *              with constrained hblank=80 and 12bpc.
> + */
> +
> +IGT_TEST_DESCRIPTION("Validate HDMI TMDS audio bandwidth constraints. "
> +		      "EDIDs declare all sample rates (32k-192k); the test "
> +		      "observes which rates survive in the ELD under "
> +		      "constrained hblank timings.");
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_crtc_t *crtc;
> +	struct igt_fb fb;
> +} data_t;
> +
> +/* All sample rates declared in the EDID SAD */
> +#define ALL_SAMPLE_RATES (CEA_SAD_SAMPLING_RATE_32KHZ | \
> +			  CEA_SAD_SAMPLING_RATE_44KHZ | \
> +			  CEA_SAD_SAMPLING_RATE_48KHZ | \
> +			  CEA_SAD_SAMPLING_RATE_88KHZ | \
> +			  CEA_SAD_SAMPLING_RATE_96KHZ | \
> +			  CEA_SAD_SAMPLING_RATE_176KHZ | \
> +			  CEA_SAD_SAMPLING_RATE_192KHZ)
> +
> +struct rate_info {
> +	unsigned int flag;
> +	const char *name;
> +	int freq_hz;
> +};
> +
> +static const struct rate_info rate_table[] = {
> +	{ CEA_SAD_SAMPLING_RATE_32KHZ,  "32k",   32000 },
> +	{ CEA_SAD_SAMPLING_RATE_44KHZ,  "44.1k", 44100 },
> +	{ CEA_SAD_SAMPLING_RATE_48KHZ,  "48k",   48000 },
> +	{ CEA_SAD_SAMPLING_RATE_88KHZ,  "88.2k", 88200 },
> +	{ CEA_SAD_SAMPLING_RATE_96KHZ,  "96k",   96000 },
> +	{ CEA_SAD_SAMPLING_RATE_176KHZ, "176.4k", 176400 },
> +	{ CEA_SAD_SAMPLING_RATE_192KHZ, "192k",  192000 },
> +};
> +
> +#define ACR_RATE_MAX		1500
> +#define TOLERANCE_AUDIOCLK_PPM	1000
> +#define TOLERANCE_PIXELCLK	0.005
> +#define HBLANK_OVERHEAD_STD	30
> +#define HBLANK_OVERHEAD_HDCP14	74
> +#define DI_PACKET_SIZE		32
> +
> +static void rates_to_str(unsigned int rates, char *buf, size_t len)
> +{
> +	int pos = 0;
> +
> +	buf[0] = '\0';
> +	for (int i = 0; i < ARRAY_SIZE(rate_table); i++) {
> +		if (!(rates & rate_table[i].flag))
> +			continue;
> +		if (pos > 0)
> +			pos += snprintf(buf + pos, len - pos, ",");
> +		pos += snprintf(buf + pos, len - pos, "%s", rate_table[i].name);
> +	}
> +	if (pos == 0)
> +		snprintf(buf, len, "none");
> +}
> +
> +static const int bpc_values[] = { 8, 10, 12 };
> +static const int channel_values[] = { 2, 8 };
> +
> +/*
> + * 1920x1080@60Hz CVT RB2 — hblank=80 (constrained)
> + * Available Packets/Line = FLOOR(((BPC/8)*80 - 74) / 32)
> + *   8bpc=0, 10bpc=0, 12bpc=1
> + */
> +static const drmModeModeInfo mode_1080p_hblank80 = {
> +	.clock = 133320,
> +	.hdisplay = 1920,
> +	.hsync_start = 1928,
> +	.hsync_end = 1960,
> +	.htotal = 2000,		/* hblank = 80 */
> +	.vdisplay = 1080,
> +	.vsync_start = 1097,
> +	.vsync_end = 1105,
> +	.vtotal = 1111,
> +	.vrefresh = 60,
> +	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	.type = DRM_MODE_TYPE_DRIVER,
> +	.name = "1920x1080",
> +};
> +
> +/*
> + * 1920x1080@60Hz with hblank=160 (relaxed baseline)
> + * Enough hblank for audio at any BPC.
> + */
> +static const drmModeModeInfo mode_1080p_hblank160 = {
> +	.clock = 148500,
> +	.hdisplay = 1920,
> +	.hsync_start = 1968,
> +	.hsync_end = 2000,
> +	.htotal = 2080,		/* hblank = 160 */
> +	.vdisplay = 1080,
> +	.vsync_start = 1097,
> +	.vsync_end = 1105,
> +	.vtotal = 1111,
> +	.vrefresh = 60,
> +	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	.type = DRM_MODE_TYPE_DRIVER,
> +	.name = "1920x1080",
> +};
> +
> +static igt_output_t *find_hdmi_output(igt_display_t *display)
> +{
> +	igt_output_t *output;
> +
> +	for_each_connected_output(display, output) {
> +		drmModeConnector *c = output->config.connector;
> +
> +		if (c->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +		    c->connector_type == DRM_MODE_CONNECTOR_HDMIB)
> +			return output;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int hblank_of(const drmModeModeInfo *mode)
> +{
> +	return mode->htotal - mode->hdisplay;
> +}
> +
> +/*
> + * Driver always reserves HDCP 1.4 rekey overhead (74 clocks) even when
> + * HDCP is not active: 30 (standard) + 44 (HDCP 1.4 rekey quiet period).
> + * FIXME: once driver exposes HDCP state, use 30 for no HDCP, 74 for HDCP 1.4.
> + */
> +static int avail_pkts_per_line(int bpc, int hblank)
> +{
> +	int overhead = HBLANK_OVERHEAD_HDCP14;
> +	int tb_blank = (bpc * hblank + 7) / 8; /* CEIL(hblank * bpc/8) */
> +	int avail = (tb_blank - overhead) / DI_PACKET_SIZE;
> +
> +	return avail > 0 ? avail : 0;
> +}
> +
> +/* Packets required per line for a given audio rate and channel layout */
> +static int required_pkts_per_line(const drmModeModeInfo *mode, int freq_hz,
> +				 int channels)
> +{
> +	double ap = (channels <= 2) ? 0.25 : 1.0;
> +	double f_pixel_max = mode->clock * 1000.0 * (1 + TOLERANCE_PIXELCLK);
> +	double t_line = mode->htotal / f_pixel_max;
> +	double r_ap = ((freq_hz * ap) + (2 * ACR_RATE_MAX)) *
> +		      (1 + TOLERANCE_AUDIOCLK_PPM / 1e6);
> +
> +	double avg_pkts = r_ap * t_line;
> +
> +	return (int)avg_pkts + (avg_pkts > (int)avg_pkts ? 1 : 0);
> +}
> +
> +/*
> + * Build a CEA EDID declaring all 7 sample rates in the SAD.
> + * Deep-color flags in HDMI VSDB match the requested bpc.
> + */
> +static const struct edid *
> +build_edid(int bpc, int audio_channels)
> +{
> +	static unsigned char raw_edid[2 * EDID_BLOCK_SIZE];
> +	struct edid *edid;
> +	struct edid_ext *ext;
> +	struct edid_cea *cea;
> +	struct edid_cea_data_block *block;
> +	struct cea_sad sad;
> +	struct hdmi_vsdb vsdb;
> +	struct cea_speaker_alloc speakers;
> +	size_t offset = 0;
> +
> +	memset(raw_edid, 0, sizeof(raw_edid));
> +	edid = (struct edid *)raw_edid;
> +	memcpy(edid, igt_kms_get_base_edid(), sizeof(struct edid));
> +	edid->extensions_len = 1;
> +
> +	ext = &edid->extensions[0];
> +	cea = &ext->data.cea;
> +
> +	if (audio_channels > 0) {
> +		cea_sad_init_pcm(&sad,
> +				 audio_channels,
> +				 ALL_SAMPLE_RATES,
> +				 CEA_SAD_SAMPLE_SIZE_16 |
> +				 CEA_SAD_SAMPLE_SIZE_24);
> +		block = (struct edid_cea_data_block *)&cea->data[offset];
> +		offset += edid_cea_data_block_set_sad(block, &sad, 1);
> +	}
> +
> +	/* Use source physical address 1.0.0.0, as in the standard HDMI VSDB. */
> +	memset(&vsdb, 0, sizeof(vsdb));
> +	vsdb.src_phy_addr[0] = 0x10;
> +	vsdb.src_phy_addr[1] = 0x00;
> +	/* Advertise ACP/ISRC packet support and the HDMI 1.4 TMDS limit. */
> +	vsdb.flags1 = HDMI_VSDB_SUPPORTS_AI;
> +	vsdb.max_tdms_clock = 340000000 / (5 * 1000000); /* 340 MHz / 5 MHz */
> +
> +	switch (bpc) {
> +	case 12:
> +		vsdb.flags1 |= HDMI_VSDB_DC_36BIT;
> +		/* fall through */
> +	case 10:
> +		vsdb.flags1 |= HDMI_VSDB_DC_30BIT;
> +		/* fall through */
> +	case 8:
> +		break;
> +	}
> +
> +	block = (struct edid_cea_data_block *)&cea->data[offset];
> +	offset += edid_cea_data_block_set_hdmi_vsdb(block, &vsdb,
> +	                                            sizeof(vsdb));
> +
> +	memset(&speakers, 0, sizeof(speakers));
> +	speakers.speakers = CEA_SPEAKER_FRONT_LEFT_RIGHT;
> +	if (audio_channels == 8)
> +		speakers.speakers |= CEA_SPEAKER_FRONT_CENTER |
> +					 CEA_SPEAKER_LFE |
> +					 CEA_SPEAKER_REAR_LEFT_RIGHT |
> +					 CEA_SPEAKER_REAR_LEFT_RIGHT_CENTER;
> +	block = (struct edid_cea_data_block *)&cea->data[offset];
> +	offset += edid_cea_data_block_set_speaker_alloc(block, &speakers);
> +
> +	edid_ext_set_cea(ext, offset, 0,
> +			 EDID_CEA_BASIC_AUDIO | EDID_CEA_UNDERSCAN |
> +			 EDID_CEA_YCBCR444 | EDID_CEA_YCBCR422);
> +	edid_update_checksum(edid);
> +
> +	return edid;
> +}
> +
> +static void force_edid_and_connector(data_t *data, const struct edid *edid)
> +{
> +	kmstest_force_edid(data->drm_fd, data->output->config.connector, edid);
> +	igt_skip_on_f(!kmstest_force_connector(data->drm_fd,
> +					       data->output->config.connector,
> +					       FORCE_CONNECTOR_ON),
> +		      "Could not force HDMI connector on\n");
> +}
> +
> +static void cleanup_connector(data_t *data)
> +{
> +	if (data->output->pending_crtc) {
> +		igt_plane_t *primary;
> +
> +		primary = igt_output_get_plane_type(data->output,
> +						    DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary, NULL);
> +		igt_output_set_crtc(data->output, NULL);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	}
> +
> +	igt_remove_fb(data->drm_fd, &data->fb);
> +
> +	kmstest_force_connector(data->drm_fd,
> +				data->output->config.connector,
> +				FORCE_CONNECTOR_UNSPECIFIED);
> +	kmstest_force_edid(data->drm_fd,
> +			   data->output->config.connector, NULL);
> +}
> +
> +static int try_modeset(data_t *data, const drmModeModeInfo *mode)
> +{
> +	igt_plane_t *primary;
> +	int ret;
> +
> +	igt_display_reset(&data->display);
> +
> +	igt_output_set_crtc(data->output, data->crtc);
> +	igt_output_override_mode(data->output, mode);
> +
> +	primary = igt_output_get_plane_type(data->output,
> +					    DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_create_pattern_fb(data->drm_fd,
> +			      mode->hdisplay, mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			      &data->fb);
> +	igt_plane_set_fb(primary, &data->fb);
> +
> +	ret = igt_display_try_commit_atomic(&data->display,
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					    NULL);
> +	if (ret) {
> +		igt_plane_set_fb(primary, NULL);
> +		igt_output_set_crtc(data->output, NULL);
> +		igt_remove_fb(data->drm_fd, &data->fb);
> +	}
> +
> +	return ret;
> +}
> +
> +static bool audio_is_active(void)
> +{
> +	if (!eld_is_supported())
> +		return false;
> +
> +	return eld_has_igt();
> +}
> +
> +static void wait_for_eld(void)
> +{
> +	/* ELD creation is asynchronous; return as soon as it is available. */
> +	igt_wait(eld_has_igt(), 200, 10);
> +}
> +
> +static unsigned int get_eld_rates(void)
> +{
> +	struct eld_entry eld;
> +
> +	if (!eld_get_igt(&eld))
> +		return 0;
> +
> +	if (eld.sads_len == 0)
> +		return 0;
> +
> +	/* build_edid() currently adds exactly one SAD; use its rates. */
> +	return eld.sads[0].rates;
> +}
> +
> +static void log_eld_rates(unsigned int declared, unsigned int eld_rates)
> +{
> +	char decl_str[128], eld_str[128], pruned_str[128];
> +	unsigned int pruned = declared & ~eld_rates;
> +
> +	rates_to_str(declared, decl_str, sizeof(decl_str));
> +	rates_to_str(eld_rates, eld_str, sizeof(eld_str));
> +	rates_to_str(pruned, pruned_str, sizeof(pruned_str));
> +
> +	igt_info("    SAD declared: %s\n", decl_str);
> +	igt_info("    ELD reports:  %s\n", eld_str);
> +	if (pruned)
> +		igt_info("    Pruned:       %s\n", pruned_str);
> +}
> +
> +static void assert_per_rate(const drmModeModeInfo *mode, int channels,
> +			   int pkts_avail, unsigned int eld_rates)
> +{
> +	for (int i = 0; i < ARRAY_SIZE(rate_table); i++) {
> +		int req = required_pkts_per_line(mode, rate_table[i].freq_hz,
> +						 channels);
> +		bool in_eld = eld_rates & rate_table[i].flag;
> +
> +		igt_assert_f(in_eld == (req <= pkts_avail),
> +				     "%s: req=%d avail=%d ELD=%s, expected=%s\n",
> +				     rate_table[i].name, req, pkts_avail,
> +				     in_eld ? "present" : "missing",
> +				     req <= pkts_avail ? "present" : "missing");
> +	}
> +}
> +
> +static void log_per_rate_analysis(const drmModeModeInfo *mode,
> +				  int bpc, int channels,
> +				  int pkts_avail, unsigned int eld_rates)
> +{
> +	const char *layout = (channels <= 2) ? "L0" : "L1";
> +
> +	igt_info("    %-6s %-3s  pkts: avail=%d\n",
> +		 "Rate", layout, pkts_avail);
> +
> +	for (int i = 0; i < ARRAY_SIZE(rate_table); i++) {
> +		int req = required_pkts_per_line(mode, rate_table[i].freq_hz,
> +						 channels);
> +		const char *expect = (req <= pkts_avail && pkts_avail > 0) ?
> +				     "fit" : "NO";
> +		const char *eld_has = (eld_rates & rate_table[i].flag) ?
> +				     "yes" : "no";
> +
> +		igt_info("      %5s: req=%d fit=%s  (ELD: %s)\n",
> +			 rate_table[i].name, req, expect, eld_has);
> +	}
> +}
> +
> +/* Run the BPC × channels matrix for a given mode/hblank. */
> +static void test_audio_bw_matrix(data_t *data, const drmModeModeInfo *mode)
> +{
> +	int hblank = hblank_of(mode);
> +
> +	igt_info("=== Audio BW matrix: %s hblank=%d ===\n",
> +		 mode->name, hblank);
> +
> +	for (int b = 0; b < ARRAY_SIZE(bpc_values); b++) {
> +		int bpc = bpc_values[b];
> +
> +		for (int c = 0; c < ARRAY_SIZE(channel_values); c++) {
> +			int channels = channel_values[c];
> +			const struct edid *edid;
> +			int pkts, ret;
> +			bool audio;
> +			unsigned int eld_rates;
> +
> +			edid = build_edid(bpc, channels);
> +			force_edid_and_connector(data, edid);
> +
> +			igt_output_set_prop_value(data->output,
> +						  IGT_CONNECTOR_MAX_BPC, bpc);
> +
> +			pkts = avail_pkts_per_line(bpc, hblank);
> +
> +			igt_info("\n  %dbpc %dch hblank=%d avail_pkts=%d\n",
> +				 bpc, channels, hblank, pkts);
> +
> +			ret = try_modeset(data, mode);
> +
> +			if (ret) {
> +				igt_info("    modeset: REJECTED\n");
> +				cleanup_connector(data);
> +				continue;
> +			}
> +
> +			wait_for_eld();
> +
> +			audio = audio_is_active();
> +			eld_rates = audio ? get_eld_rates() : 0;
> +
> +			igt_info("    modeset: OK\n");
> +			igt_info("    audio:   %s\n", audio ? "active" : "inactive");
> +
> +			igt_assert_f(!(pkts == 0 && audio),
> +				     "Audio active with 0 available packets\n");
> +			igt_assert_f(!(pkts > 0 && !audio),
> +				     "Audio inactive with %d available packets\n",
> +				     pkts);
> +
> +			if (audio) {
> +				log_eld_rates(ALL_SAMPLE_RATES, eld_rates);
> +				assert_per_rate(mode, channels, pkts,
> +						eld_rates);
> +			}
> +
> +			log_per_rate_analysis(mode, bpc, channels,
> +					      pkts, eld_rates);
> +
> +			cleanup_connector(data);
> +		}
> +	}
> +
> +	igt_info("\n=== End matrix ===\n");
> +}
> +
> +static void test_audio_bw_supported(data_t *data)
> +{
> +	test_audio_bw_matrix(data, &mode_1080p_hblank160);
> +}
> +
> +static void test_audio_bw_pruned(data_t *data)
> +{
> +	test_audio_bw_matrix(data, &mode_1080p_hblank80);
> +}
> +
> +static void test_audio_recovery(data_t *data, enum igt_suspend_state state,
> +				bool runtime)
> +{
> +	const struct edid *edid;
> +	bool audio_before, audio_after;
> +	unsigned int rates_before, rates_after;
> +	char before_str[128], after_str[128];
> +	int ret;
> +
> +	edid = build_edid(12, 2);
> +	force_edid_and_connector(data, edid);
> +
> +	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 12);
> +
> +	ret = try_modeset(data, &mode_1080p_hblank80);
> +	igt_require(ret == 0);
> +
> +	wait_for_eld();
> +
> +	audio_before = audio_is_active();
> +	rates_before = audio_before ? get_eld_rates() : 0;
> +	rates_to_str(rates_before, before_str, sizeof(before_str));
> +	igt_info("Before %s: audio=%d rates=%s\n",
> +				 runtime ? "DPMS cycle" : "suspend",
> +		 audio_before, before_str);
> +
> +	if (runtime) {
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   data->output->config.connector,
> +					   DRM_MODE_DPMS_OFF);
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   data->output->config.connector,
> +					   DRM_MODE_DPMS_ON);
> +	} else {
> +		igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
> +	}
> +
> +	wait_for_eld();
> +
> +	audio_after = audio_is_active();
> +	rates_after = audio_after ? get_eld_rates() : 0;
> +	rates_to_str(rates_after, after_str, sizeof(after_str));
> +	igt_info("After %s:  audio=%d rates=%s\n",
> +				 runtime ? "DPMS cycle" : "suspend",
> +		 audio_after, after_str);
> +
> +	igt_assert_eq(audio_before, audio_after);
> +	if (audio_before)
> +		igt_assert_eq(rates_before, rates_after);
> +
> +	cleanup_connector(data);
> +}
> +
> +int igt_main()
> +{
> +	data_t data = {};
> +
> +	igt_fixture() {
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> +		igt_require(is_intel_device(data.drm_fd));
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +
> +		data.output = find_hdmi_output(&data.display);
> +		igt_require_f(data.output, "No HDMI connector found\n");
> +
> +		data.crtc = igt_first_crtc(&data.display);
> +		igt_require_f(data.crtc, "No usable CRTC found\n");
> +	}
> +
> +	igt_describe("Validate HDMI audio bandwidth with 160-pixel horizontal "
> +		     "blanking across BPC and channel combinations.");
> +	igt_subtest("audio-bw-hblank160")
> +		test_audio_bw_supported(&data);
> +
> +	igt_describe("Validate HDMI audio bandwidth with 80-pixel horizontal "
> +		     "blanking across BPC and channel combinations.");
> +	igt_subtest("audio-bw-hblank80")
> +		test_audio_bw_pruned(&data);
> +
> +	igt_describe("Validate audio recovery after suspend to memory with "
> +		     "constrained hblank.");
> +	igt_subtest("suspend-mem-audio-recovery")
> +		test_audio_recovery(&data, SUSPEND_STATE_MEM, false);
> +
> +	igt_describe("Validate audio recovery after suspend to disk "
> +		     "(hibernate) with constrained hblank.");
> +	igt_subtest("suspend-disk-audio-recovery")
> +		test_audio_recovery(&data, SUSPEND_STATE_DISK, false);
> +
> +	igt_describe("Validate audio recovery after a DPMS off/on cycle "
> +		     "with constrained hblank.");
> +	igt_subtest("dpms-audio-recovery")
> +		test_audio_recovery(&data, 0, true);
> +
> +	igt_fixture() {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 1ac89bab7..0f2d4c087 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -262,6 +262,7 @@ intel_kms_progs = [
>   	'kms_flip_scaled_crc',
>   	'kms_flip_tiling',
>   	'kms_frontbuffer_tracking',
> +	'kms_hdmi_audio_bw',
>   	'kms_joiner',
>   	'kms_legacy_colorkey',
>   	'kms_mmap_write_crc',

