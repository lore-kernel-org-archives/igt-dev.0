Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF52DD232F2
	for <igt-dev@archiver.kernel.org>; Fri,  9 Jan 2026 08:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD1710E810;
	Fri,  9 Jan 2026 08:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ek1Fy3+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1331D10E810
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jan 2026 08:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767947864; x=1799483864;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ENO4sJI6diF18rdTolK/hhvxGuv83oFvLmqPPOn7h9s=;
 b=Ek1Fy3+iyDjkOJRAzMbOw0g4dopa4I5CBud8aBY5/nVDcrhSy+niHolS
 l8CS281j4Rh9vll3aFuksMK45ie+PuhuNjhYrl0M/Xd5z7ucsKEQvemaz
 7ZcGEQ79NAU+xNKRNT5IFV9Ff64S6GdqrxIw/cQMqqtCOXnZ32ce1hSOn
 GbWglMZ5T2doe4Snsj6UOIt1mwjfBhI2vALhwtTytDS9lbi3uaatOxvMT
 NaFFzGLmqnjt0H6LvWVRyAnhC+jTgerqlNyp6VRw3PGerUqusF7gU2JZH
 mOsUEuPWH9f9aISm/kMnuDSZYiMGA1VCfePsf2NIOAH5cXWf6OawRTr6A w==;
X-CSE-ConnectionGUID: CG6WEUxPR+em8McY+6RVWw==
X-CSE-MsgGUID: kEFBDJrJSEOpLh4VIL7K7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68525469"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="68525469"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:37:42 -0800
X-CSE-ConnectionGUID: HOb0hszOSEqel9gfKtEiOQ==
X-CSE-MsgGUID: S51EuTTmSX6konodgQhK8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="234127210"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:37:42 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 00:37:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 00:37:42 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 00:37:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAcH9XwV5eKD3euvgAhGml6UBifPkkpFiF5QxOWyhz+3+ZBbSEwITgB2Jsc19bifpQdKXeywbZx1GHPm0PG/DriNX0cubVp9X4jHCVEp3isnMXKjRl3r+a0ajznJOacI/uwydCUZg/jAUF9xthZCmdoOm71A4xXS+Dp/OJlMd8ajUobhKNQGWcheCSKSOYtOeu6kw0XBs3IJZyDIVPmSLknV+wq4EsRiFteVbSbDxz5kavsRPkINkohP79scBbuw9fuBtj9L7Dh1iN+UQArcJ+Ij6SpTfkEaMVHub2rlDCYI6UIFOktW7NB3iQpzArCdT3zq+msetxu4yHirvAiJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0L5L3P8bk2sEq0nI3oWOpj3ZNIEPfOaPbRB5tmyd16M=;
 b=Ha2C4Rw0DybhrCgl8C5x0dpqNBFbONv2HrxqT9suraBPwLdIgp6sJ5hEX4dU+hPqNINf/+Lt/pMMu97AuoU3vb8ldSaVqdn8F8MINBW4ByBJ3sUamc3znfdXvQ8MVtAQHrawO+0UHQfSZtvVAxycSHwK8bpxJlWiiL2gpIwSuNnlU/4XigFiGxeSkrUpyUaDpQET+ByQptHyQJ9MSLcP6FHEsCdCAd1fyOGAKlbGL2fJbWDtsPylQf8JIv77XoqikHjY9HwEeREumstE8DMBkpDk4UHeqXJ8t5+lzvIDLGmzolaNnp0Nrm7X/M0d1TUrL9s2q9jZ2z03C5ZN1EDuaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB7734.namprd11.prod.outlook.com (2603:10b6:8:df::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.4; Fri, 9 Jan 2026 08:37:35 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 08:37:35 +0000
Message-ID: <3ca7a3bc-222c-472f-be52-3f69c9e9fbe2@intel.com>
Date: Fri, 9 Jan 2026 14:07:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v2 1/7] tests/intel/kms_big_fb: NVL supports
 horizontal flip with linear surfaces
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
References: <20260107093535.70116-1-swati2.sharma@intel.com>
 <20260107093535.70116-2-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260107093535.70116-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB7734:EE_
X-MS-Office365-Filtering-Correlation-Id: 462f5747-6751-4e17-bb1b-08de4f5a565a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|42112799006|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnliQXpZY0JCOXJOUld5MmxsSGhlcmFWMUt1ZHFXaFRrWkJYdS9QbERaWmlo?=
 =?utf-8?B?VkVZR3hjNTVzeUp0OFo3czhtS3cwMnVjRllLeVJkSkZsYXIreXhrOGMzc29M?=
 =?utf-8?B?SmtqS3I2WkZ4WUEycWVUMTBvVDR5MzA0UHVzTk1ocDdZTU9TTXZyY0RuUzJB?=
 =?utf-8?B?NDNFRmtmaENveEFhZTZiSW9IWjAxYkV1OW1hWElKM2p1VzFZS3llRTdTVlBj?=
 =?utf-8?B?SGk0RklBcXpGbWRqMWVpQTh4NmNMd2I0Z1hlOHZpdlFWejhhSzJJdHp3ekZB?=
 =?utf-8?B?YVJGNGxqWDV2Y213UmxNU3I0SkZ5bnozbnp5YnhDeTlpVHBuM3dYMElwNlNC?=
 =?utf-8?B?RjRHM0xseFhNazBKY0pmUGorUnZ1ckdIWGRGN3JJMnNwdDdZdHNMbjBWVktO?=
 =?utf-8?B?RVMzblRpRGdCbXNQTDAzeElKeFZ1S2dMcWk2UWk2RTNFVTJsRnNiejlHL3oz?=
 =?utf-8?B?eFdkaTA0RExMcXdlWGtZbDJFb0l1UnFKN1QvTVloOEF0Y0RFcVUrYmpxT3Rm?=
 =?utf-8?B?U3FHUlNwRDBhZG0xUTQ2Mk5ML2ZNczBueCtjVWlLZXdTRmlIbU5jNXBDKzlZ?=
 =?utf-8?B?R09kZkJCRzdyVGZXVzhRdndOYVVnVng4R0U3bERVbFJ3djlxanh0VFZZbThy?=
 =?utf-8?B?WnBOMUlReWVKY1hpeFhMT1JILytER25rc054TEFzSVRYVnRnc0ZOR1FxNCtm?=
 =?utf-8?B?S2FBVlNnei90aUdDM1lKWDRMaWdSMVBnUWJpaEF3S1FEalVkeTVELzMwSzJD?=
 =?utf-8?B?S2srdXJHUnpESFhUc1ByMzNQU0hHYVhvaWsxaFRtWkg3ZGZqRjNTMXNXbm9a?=
 =?utf-8?B?ZVB1RzRUdm9RUUxiZDNjRlNnc0M4Q25iM3orcFJaaTBLRmlzZ0lFZ0lqeGt1?=
 =?utf-8?B?ZTNTKysvbEorRDIrRktmMVZBZ0ljMkpsTDlEMGFoRXoxRXYxcWFmOVhxeWpD?=
 =?utf-8?B?ZWpMdmVNU0VTOVRhSjl2a0dtNmhjZTIyYU1DeUlMRU81eUFDREVFaWFJMTZ2?=
 =?utf-8?B?aGRIQVZGdHA3V0VTeVpvMDA1bTB2M1RteGFuYTdESFlDWWxsLy9lbCt6em9l?=
 =?utf-8?B?dUMwTTBWSVlMYXVYb0JKK041YVNFeStoVFpZKzFnT0NwcjFOZGpjb21VTXlI?=
 =?utf-8?B?VnFZcS9PdGxaczZLOXJvS01oWFhrWUk5bTdpY3lzUThZbkNmR2JaR0FvcENM?=
 =?utf-8?B?b3c3dUMzYjNmKzhDKzl5OXFiUzBUS04rcVRGT2V3NU81SGpJa1VJZkVwcFFZ?=
 =?utf-8?B?TEd0ZThTNTk2SnQwRGswRFVZL1hZQ3pQRzUxRkpLbHdBUUs2ZWFuQ1Y1RDlZ?=
 =?utf-8?B?MUpvNVd6UFByUnBFTE9MN2RmUFQrcklCaUxDT09RMnB1a1dnS1drQU9sM1pr?=
 =?utf-8?B?ci9VRzMxQnlYQzM0emQ3TUJqTXlCLzhCWU5DR1FtWGx4aVZQdm1xMmdLL0JY?=
 =?utf-8?B?cVJPYkRFaGttOVFncTJNN2F6emRMb1NyNDV4MStTTFI1K2hnVEtsRXRNRUNX?=
 =?utf-8?B?R2lmWDFXOEtTZTNjU0dZRFNWWVNraTMvaER1V09HaDNMUkxPVitwZEg2SUFD?=
 =?utf-8?B?MWp6NDlBdmQ4QVhVZ0dNZ3RoNnhPNEJlKzdNZDV1NlN4WE5ZL0pvaVNEQnd5?=
 =?utf-8?B?by9OVG9hM3JZNmVaOC82aWZwajBIMXM2b3NNRnJCME40KzNmcFNQdGh2VDF2?=
 =?utf-8?B?SVpvQjB3b1Y0L0FSZDJnWDhPcHFmSmpuV3dEMHpWUEs1dXdxNldqVDkzRngy?=
 =?utf-8?B?REV1UFhkV3JOQmQ4ekN2eVhKaWc3aVhCVnloUy84M1VZWHQwQkxvVXE5Zmh3?=
 =?utf-8?B?K3NNWExHUU1ia2ZiYmprNWNQcE5FWE4vTU42WjlIZ04yL0szeUFSaWZENW85?=
 =?utf-8?B?RG80cnMzdE1ySDQ0ZUNyZlExVXAyZjBOd3dMYzQzWUx6aVdTcG9rWEdTTXk1?=
 =?utf-8?Q?2TA9txzx7ylx5QUKCCFo81sRLq/uA+/t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(42112799006)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1ovY2ZzMVFtUGlaNDVYM2VjMDd5cEV2QllxbG9zOTVzS3lnVnpVLzkvVlpa?=
 =?utf-8?B?YzBtMVY4clRVcDZKNzBrTUswNGhxTkxOcUJaS1hyZGt6cXkreHJEbHhWY1lm?=
 =?utf-8?B?bHo3eEYwcmh6R0ZGU09oK3k2TS9FcXl3VmI4K3hvV0ZDNVNGbEVQR0JtbzEx?=
 =?utf-8?B?cGZDSGtVZkxmalg4QUJObDZDVVg0dHhiR3ZXT0ZHaTNvM0sxcitUZW5UMzBq?=
 =?utf-8?B?Vm1DcStmZzRzRDlhVlFXeFVrVHErUVZzb1YyNmRHYysyRUxUM3V0aXFJc2lK?=
 =?utf-8?B?clJ4ekJZWW9ET3A4QldtNUFJeFlXcm1kcjlJWEQzelpwZFRMdmVNUGNwRzRT?=
 =?utf-8?B?M0haWGRReGNENG8xclBwZXFZbXp1bXpNZ2V6TW1GZ0Q5NUcvSlkvaHZoTVQx?=
 =?utf-8?B?VDhKajJ3VUlCeldSTUhJMjJwckdDUWVsbnRZT2Q2SWlMaWtGVjBqdUpiV01I?=
 =?utf-8?B?cWVTMWkwMWJxSldPOUdyUmRMaHBicGpWOFM3bFkrK0JNUEZGbzcyYkxVT2V3?=
 =?utf-8?B?b0M3aHVSWE5wWnplLzVhYm53Unp3SFMvNUt4V3RldGpseElyNzVhcEFoM2p6?=
 =?utf-8?B?M2o3aENUSTAwS3AxSWdvZElFVnJEdHNaMWxyVUF3T1pUOWViejA1N1l1OUZ6?=
 =?utf-8?B?dCtWTzNIQVQ0Ly8vdnd5QWl3RjZBUVhJdExDeHNoTHZwczZOZFpvOURiaWpC?=
 =?utf-8?B?L3RPT3NYdm9na3RuUGtoZEd3Q09JcmZGSG5VUGZ5aG5uYzNlTk52bXdmdnBq?=
 =?utf-8?B?Yzg2azNPTUFGNDJrZEoxNHByc3I0ekFRSHVFYVk0aXQ1NGJiNHJYQmkwbGhG?=
 =?utf-8?B?dlBPTVBQeTQvU3JCdDZIbWI4c3VTdXM4c000NUc2cVFiaENBd0NiN09GRW5a?=
 =?utf-8?B?TkxjR1Zock4vNFZ5YlZVTnE3dnV1NzFtenkrT2NKUXUxK2paYnRhZ3ZrS2hK?=
 =?utf-8?B?anVDWHdtd3AvbDd1UHR2Um5BREpETktxMmhpOGVyeE5wOFZVT3FJRjhmb1Qw?=
 =?utf-8?B?bE9qbVZrSHppdnkxOGN6SDBpNUNxSlEwT1NkTEdSZG9HenBmREZjK1lrR3gz?=
 =?utf-8?B?eHJuTjRyaHZQZ0F2MzJTWEgzK0V3a2ZVdmU1aHhtSmtZSWhQWXUzd2RQdVIr?=
 =?utf-8?B?KzZLRmViMnBUamIrckhDdDliak9yYmZpN0pBQjNDTitLckR3UmR6TDREbU51?=
 =?utf-8?B?THNpRUUxS24rNzZKRzJvVXB1ZFRwSTdWdjlicTlKWlFmN3VpOWlhL0dKMmZJ?=
 =?utf-8?B?dklneTZhRitKR1dndFVwd1dXbFpnTHdHT2N3Qi9GalV0eUpCS0FFTUVjWWZN?=
 =?utf-8?B?MlgxM2FDdzdhcnBzTUpiRWVYVFJZU1BlV0ZJNWcxWWRKeGlzemdGMmxONUMv?=
 =?utf-8?B?ZFhVNGYrckZGOU5hd0IvSVMvQ1B1ekIzaDV5NWN4cEs5ZVUzT2o1YXREWHFT?=
 =?utf-8?B?eUllSVI0R081Q2FqcS9xYnAvK01yNUxHWVJidjlVZkU5NXNQTy8wTGpmcEo5?=
 =?utf-8?B?M0xLMjhyLzMrZ0lmNkxlNGh1WjVtVkw0L3ovZCtvVmF5NGtPbFphRWUwOHpZ?=
 =?utf-8?B?YjAydHJma0QyUk4va2xoam9paHZRVEdYN2VESkQ2ZXJyYXQ4ODE0SW1NU1hS?=
 =?utf-8?B?cU5kUTdRMlpEY0tTVHAvdDVudldudENSVjVNQVpkMFdWek9HNDJ4dUZSOWpv?=
 =?utf-8?B?QkF2Q1crOExTQ0ZWWjNQZnMraTAyM0tzU0xPSFM3c09JcHkyc1VkdXBWWWtZ?=
 =?utf-8?B?NktCV1ZrUUYyVG96Q0tWVklmeE14cEkzc0RBb1kxQ0dHb2xLeVBrY2E5Y2Qr?=
 =?utf-8?B?cm5jdU5xTG1RUGQyb0pxUStkc0dldXIwRDNKVTNEM2dxdzBpOU95TUJkU0Ux?=
 =?utf-8?B?UjdSVlpsOFZUTjFqbTlhbjNLa2I2SXlOV1c1ZGVHM1hPUEhGODFaNm0ramk1?=
 =?utf-8?B?VWttL3RYL3RuVWRwa2thMXFHRUc3Vzl0Q3NYeUUxWnI4NGRKQ0djanhCS0Rm?=
 =?utf-8?B?SGVvSWptRFFpd2IzOUkxN3F5VXRBWjZvT0dLNC9Ca2pLQkRlZStvZXREZVZP?=
 =?utf-8?B?a3gyZ3JDeFhTZU5MSk8vdnZTR09HMEE5RUtzZTRWY2M5UW96Wk5TMUg1Uy8z?=
 =?utf-8?B?U0RnV0hrV01vaGs5ZDNOQWFBQ3ZIczIxeTE5S2Y5WG14aExMSC9MQkpSUjhk?=
 =?utf-8?B?ZmRIaFNnMTFON25xLzdTR21CYW5lWEt1WXhlckJuSkw1cmtiRWxTajAyTExP?=
 =?utf-8?B?SCtTM1hzbjNzRERReFVZbUNiajdRSVVGdWsrWURQYnpLR21scmhSS0tuWUR4?=
 =?utf-8?B?dzVPSkJvS3g1RzN6Y01Tbm1rV3ZJVEF0WWw3cjg0OWZvcWhIaHJ0QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 462f5747-6751-4e17-bb1b-08de4f5a565a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 08:37:35.4318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dF36RdQ+ic43wEXUIVNSegK5f7z91YBJWUMnbl/NVhbOKPNz2Q5nRO1Jvl+e2WG6QHWMaAwPhYWN3kvYhLJE+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7734
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


On 1/7/2026 3:05 PM, Swati Sharma wrote:
> From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
>
> Starting NVL (display version 35), horizontal flip is supported with
> linear surfaces, thus don't skip that case.
>
> Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_big_fb.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 8a9ed8042..595611c31 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -82,23 +82,24 @@
>    *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
>    *              and %arg[3]-rotation
>    *
> + * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-hflip
> + * Description: Test maximum hardware supported stride length for given combination
> + *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
> + *              and %arg[3]-rotation with H-flip mode
> + *
>    * arg[1]:
>    *
>    * @4-tiled:            TILE-4 modifier
>    * @x-tiled:            TILE-X modifier
>    * @y-tiled:            TILE-Y modifier
>    * @yf-tiled:           TILE-YF modifier
> + * @linear:             LINEAR modifier
>    *
>    * arg[2].values:       32, 64
>    * arg[3].values:       0, 180
>    */
>   
>   /**
> - * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-hflip
> - * Description: Test maximum hardware supported stride length for given combination
> - *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
> - *              and %arg[3]-rotation with H-flip mode
> - *
>    * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-%s
>    * Description: Test maximum hardware supported stride length for given combination
>    *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
> @@ -1106,15 +1107,18 @@ int igt_main()
>   				for (int k = 0; k < ARRAY_SIZE(rotations); k++) {
>   					data.rotation = rotations[k].rotation | fliptab[l].flip;
>   
> -					// this combination will never happen.
> -					if (igt_rotation_90_or_270(data.rotation) ||
> -					    (fliptab[l].flip == IGT_REFLECT_X && modifiers[i].modifier == DRM_FORMAT_MOD_LINEAR))
> +					if (igt_rotation_90_or_270(data.rotation))
>   						continue;
>   
>   					igt_describe("test maximum hardware supported stride length for given bpp and modifiers.");
>   					igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%d%s", modifiers[i].name,
>   						formats[j].bpp, rotations[k].angle, fliptab[l].flipname) {
>   						igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 5);
> +
> +						if(fliptab[l].flip == IGT_REFLECT_X &&
> +						   modifiers[i].modifier == DRM_FORMAT_MOD_LINEAR)
> +							igt_require(intel_display_ver(data.devid) >= 35);
> +
>   						data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
>   
>   						test_scanout(&data);
