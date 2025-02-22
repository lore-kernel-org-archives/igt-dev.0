Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FE5C021B6
	for <igt-dev@archiver.kernel.org>; Sat, 22 Feb 2025 00:29:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65B410EB40;
	Sat, 22 Feb 2025 00:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZS6jbXGU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBC410EB40
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Feb 2025 00:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740184150; x=1771720150;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fbSaXAuaoJRGEEhvTfu/4g6F0zmdu+Y8cyrdE5NBny0=;
 b=ZS6jbXGUjA1k9A+SYAY9JoYdLwbRek9+EzeaVDUs3Yzoi3QkxfXPuWNU
 PCTJ5EWfU/n/c0StclYQBahqYb8hn+tN1Rz/oGOtCtZSh4f96CISEBJvr
 aKpltzqWlZHcQ34lmMP7bH/MW1MSDR+Anmci24le33mXh6RbvK2MC18qx
 2aWmdhEW8tSF/+qADg8OIAuzzwJt/+ygaTdH8qjrl6pOCdi1seF8OZkyG
 bzviOvw0fWP4x4184ww/CeHDXAmWkQ1Fwosz1AYrKpYmP+AbKPcGtbFjd
 Z5t5NDhDbAaawN5tzZSDPYJlJwSuahyLnkXrRV6GDwXUO4sI7fceNg/hV Q==;
X-CSE-ConnectionGUID: 7apTEEmDSVSkol0PWJM2DA==
X-CSE-MsgGUID: rKy1hBifTCe2IwaNHD0dXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="43845873"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="43845873"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:29:08 -0800
X-CSE-ConnectionGUID: BKd+xPlhSZ2bwF50W/NFkQ==
X-CSE-MsgGUID: Jt7gn7CpRPCA0gz+knRc6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152709272"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:29:08 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 16:29:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 16:29:07 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 16:29:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvlhU2jefewxEQ0mXNm93QkjKreWXq9aCKgggbTTUPdZGrsKk05Z0TadX4IQQcpjHw05uJMhk4ucGR5lyGIED/UEmjyBcww9XoeHUi2E2HzIpdpodgm0n/G/HpcOEC3Ma5hzr6MPsR8qcNSmp9mg5htjB/LFBd/zKLLNB3sM1Or2/B+JClgep1Ww0/9iCCdKt/r9sImiqKjk+UEhRV61c8KtCanHVoeeVrRUqV6AvvYE0z3+TGuWnG5q0ELdOQGeSg6ZYygkZOT7DAdSC1HZR+dL/JXX9okiefz49cmwhtBbSfNdor4dzyTgYdW68V4zoYQEyOoMeIlHVm1XBu7+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7Qdh1EsiSl9Gh3dSAOG6ZEGXSThU2JC3S2QfjrwckE=;
 b=jS0ljXyJ4gmuYXkt21jhc8a5i+oUSf5/Ldk1yXO1MWuOnlCRJkRaPU9LkYbARmB+qHd2DVXaKtyuvJ+O8KaGu3fxR6fUJ+Amqb2EauoBbUTBDM/DK6oRlIVpkpM3coLwmeyTX6o54gxNX/cA7Jvr3YeWyVdOdgiPe4zx2kHkLWvHGhvfd8fvlviQzFHp0XsJ5qnDpOkAPVC085KPJQF0deD/sombrfk+0bFU/Z6Hdoa0+Tv/JK28bT1VGwq1N1RwHuw3s0N/h6rSbiKNhrGYu4i1klvTbGHkLC2hFl9jpqugLDd0GzYZVyMqVGYrWPSW+cCAcwdU4K/FXUCZzq05JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM6PR11MB4627.namprd11.prod.outlook.com (2603:10b6:5:2a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Sat, 22 Feb
 2025 00:29:05 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.015; Sat, 22 Feb 2025
 00:29:05 +0000
Date: Fri, 21 Feb 2025 16:29:03 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t CI run 03/14] tests/intel/xe_oa: Rename
 oa_exp_1_millisec to oa_exponent_default
Message-ID: <Z7kaTzeoYe0NEw0P@orsosgc001>
References: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
 <20250218202812.1679653-4-umesh.nerlige.ramappa@intel.com>
 <85frk6omgx.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85frk6omgx.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:303:2b::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM6PR11MB4627:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7d5e46-6ca3-4106-3167-08dd52d7e9e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXlqMGlDUWpXclVQK1YvNUdKWmFNQjNMYVNWaFJDWVo3VmFXQkZMKy9CSFNh?=
 =?utf-8?B?enpyd2lzbTRFR3ZuT0hRRnp1YTVCK1JRcDg1a1VLQUE5T0IyeWVZeWhvVmNU?=
 =?utf-8?B?cGVHc1h5K2o1c1Y4ZmhFaTlmdW5mNU9US3lhQXNFWjJzNjdEWm5Oc3lSY1ky?=
 =?utf-8?B?Z3huNDRzdXFQUndwZUJHVUYzN2pteXBTdjRTemExa1VUblVxcC81NVFwWHFY?=
 =?utf-8?B?YTdOd29ibFY3dVgxMkdjclJUbXlEWEtOY0thZGFZR0p0WkhsYzVCWnd0cC9r?=
 =?utf-8?B?ZWFOLzczR0FvSG5veGhVa0d5TlAvVGw3dkhSa3pXaSsvMjBoWlQwK0dyZk5D?=
 =?utf-8?B?djFCa2FEMXVDaVdrczU1Q2VCODQwQ0pEYnE4eW1WNzZET0IzamFBejFMMHgz?=
 =?utf-8?B?RUI2cUcwR1R3YWxXUEozcm4rQTdtLzVmTld2Q2VUOGRwekhzTTd5cTduaGVN?=
 =?utf-8?B?Um1yMG04MkRteGdhSGJuN3ZINitGNkhGbWEzY3REOU1vbVFEdkRCZGljbXlD?=
 =?utf-8?B?VUlZQnkwSE92S3ExaU1PR0NoZkwxYndMSWNYRGdqVlhUL0FDaXVFN2N6K051?=
 =?utf-8?B?cVU5eXBJbk4zbG40RFA1Qi9WV1BLZFNCc2h6N1JxSjBtWmJIS0xuY09VTUVN?=
 =?utf-8?B?L3BVeHVLSGdWVjJmTndqaFU4dnc5aHVMdXZUVVoyQmlnbXhHdjc4SkVEUVFk?=
 =?utf-8?B?UngvSTlOc2RoblA4eFNLZ0hFQitRVHA1OGFBdFJqc2dXOVBJallWWktrbEZG?=
 =?utf-8?B?VTZxYlI1eFZWdkJQT3pOVTBZNmxYcXR6Z0RUYmdsdlYydENEbStqWDU5OW9i?=
 =?utf-8?B?ckR2SDR5L1FtaDNwMUxFVEdia1RtTUpKeG5XampNYjVwU2ZtV3JjWVZlOXli?=
 =?utf-8?B?aDdzL0NUT2tCaEZQeHRtTkxFUnRXMmVyR2d1dFduYnFkc3JWeHBFVGRvMjNs?=
 =?utf-8?B?azUrMnM3ZHk0NXJxdmZuOUkwU013N1F0TGE5UjRheWV4RGR6ZVFLK2VrUHhm?=
 =?utf-8?B?czNPelJNU3BaZGZOTmVrcGdFaytZaEV6WXRKNHNUSzJkREgrbjZQTVhON1ZV?=
 =?utf-8?B?Z2VuZUthajk2eG9taUN0YjdVL3BVVGRHZzhaRFFsZ2RuNFZZNEJ2bm1sSjdO?=
 =?utf-8?B?Zy9EMEZFOXEwdUFKNGdOa0g1SHAvRDYxS29CYnpGaFg3cVNyWFh3cUgzSHly?=
 =?utf-8?B?Q2d5dHVKZmdPcHBFNVhPTTJUY3hlWXRXbDJqaGxYQTQ5UGpxYytyVE9EQm1i?=
 =?utf-8?B?cnBldWlsbmVDYkZaeDUwOHR4THQ4WlRvS0owcUdXSjFTZks2SGhBcVI5VU9q?=
 =?utf-8?B?Ty9QV0F3SFF0QnlSWGVqRDgzcXozU3dhaDFMSDNFSnhzVjVXWHdiZDhGLytt?=
 =?utf-8?B?Z1VUU1NMUUpkeEc1WUhSM1pta2tuQlhrTEVTZnUxZnJ5QlRmU3g5V1VmVUti?=
 =?utf-8?B?QXJYN043Nk56Tjk0TTdBV3BNNXFaOHU4L1EvZG4wUlg1TE0yazJDeFlLczhy?=
 =?utf-8?B?MG05UVhqVk5FeVNncFF1MlN0MmFRVkdBdXhLamFUVmQrR1d0a25ZakxNSjlN?=
 =?utf-8?B?TWo3V1hDQVNtbE5OUEFNSk1uMFN6ZG0wb3FSdGpXOTdsejVvT2tYdjFpSnVO?=
 =?utf-8?B?T1hPOWlVbkxZeFgzUzlTbUJsbVBuSzUxKytYZWFnaXYvRGhrRW05M2RtQWN4?=
 =?utf-8?B?QnNzRTJkdUNOcDIrR29DSlRTT3ZyWmxZRmRuaFdaWWZJMmZUU2prZTJNQ3Ra?=
 =?utf-8?B?akNGTHJlQlRoNlNUODIvQkxDeUZOWEJNZDZQbSttQmxVV0I3NGpvTlhrNWlJ?=
 =?utf-8?B?am03YTUwSlU0NFEyWWhiWTMyQ2l5RThmTzVVU3Z3djYxNVpYUzJvQlhuSk1Y?=
 =?utf-8?Q?ipTQ3IzMicFwv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RExMV0ptRGF0aGN4Q2dEenIwZ2FVRlh2K0xQd0poOFFlOWdiREd0bmh5dVVa?=
 =?utf-8?B?R25EVytIZ2x4WnRaWHphdzFPSGMxSDMxdG1ZbUxaSWwyTnZ4c0dSd2lqSTJ2?=
 =?utf-8?B?RUdxbDVBTzJjdTR4aURud0VwYkJsakVaMGRiT05VeDRjSy9SQUJVeE5IVlg2?=
 =?utf-8?B?TW83cEJWdzRCZ3NPbWhUZ1Jpd0R0bXlHTldYWGgrcTh4bUR5TXp1eUVkUFRQ?=
 =?utf-8?B?bnpabXRtZkQyYmFiVDdqL1VsZzdkaU9IbnRabnphb1o0R3owektPdEVISFhV?=
 =?utf-8?B?TEJGOHJBaTd1WWFXM3dRMXBNRi9tZWpqT2dTM2ZKL2JLZ3RuR0FEZGRnTTd6?=
 =?utf-8?B?WmE0MzBpSTdHdWx2Mkdjci8wa0RBT21GSmxsbjJ3SUZtOWMrQnVFTVRBdXNk?=
 =?utf-8?B?aHZaWU1mV09YdC9sM1NBQXFKN0VMY2hvMll0Q0tBV0EraEdHc3dPeVNYeWJi?=
 =?utf-8?B?ZmNYQjRkL1NkSDlQeU96dlY4UGsyVDRZOGlLZE43a0paV2ZQK2E1ZWR1R2l5?=
 =?utf-8?B?RnhzQ0sxVzI0aGNGWDExWXVEaDhrYmVvcmdKdDZiWU8rVXkwTVNYVVVCQ0pu?=
 =?utf-8?B?MU11Z2F2QmozeTlVSjJyeno4SUJPYVcxam9LMTRxbVJlbDZoMENucXoyUDRI?=
 =?utf-8?B?VkFOa2RVdllFMUdKQkc3RFlSZWtnWXNHME15bnBlL0d5dFBHcElFWE8xWTMr?=
 =?utf-8?B?UXVsNFY4UE12NU5aN0ZxeWJsWE1aeDdYUHc0SUZDN1JydW9MNm1TSXQvanBw?=
 =?utf-8?B?SnNxK0FoNXhNRGJ4WDNMWURQbkpvUjhtZmwyMURDdU96UnlTVitibkNFVG92?=
 =?utf-8?B?dkNhZnZnRGNwTm5xME91dlRqYUpkMmRzM1ArTldUOWZtaXkvc2hZUkJMQ2xh?=
 =?utf-8?B?ZnpFZlQvb1V2bDZ1QThMNlpNRUNQZTQ0ak96V3Y5ZTV1ODZzamhtNUh0UjFp?=
 =?utf-8?B?Nm5xcXFKbTFNek9JUGR1QUk3eHBENDZIbWlidlJCaXo3MGVDTGNqS2poZ1d6?=
 =?utf-8?B?OGFnNDBpbHRpRktKbGNPcHJXWW5WV0hyTnB2Z0sxN2xmRStIck9tbkduVWN6?=
 =?utf-8?B?TUsxVGFNZGFCWDNmM2RUNjcwTG5wc0Q4U0tSSktFQjlGT2pOTXdOQ0ZvQ1VO?=
 =?utf-8?B?NTl1eU44bkhOVEoyVitCS3l3dVZnNXlBZVVHRXZMQTRmaW1kUTJHditBZS9k?=
 =?utf-8?B?V3RFb2o3eG4vcFR2dXBuWnVlRkJKeTkxTjhTQy84TExJaTd4dkxjV3M3bmpG?=
 =?utf-8?B?MmQ5K29zdG4zcEtRN1d3M0RXU1pIcGlUQWR5NWFmY0hVTVB0TGNZV21wMU9N?=
 =?utf-8?B?V0hVYVU0cVJzUGlsUjd0VnJrTVFuN0NRSGw3bVlLTUdSV09VZGtaMVBlcG1Z?=
 =?utf-8?B?eGpFcGRyczVpcmcxSHVYMnRvL3o4b25kVEJQVWFnK3hZSEpFYU9nWEhrQkJW?=
 =?utf-8?B?QlZlMnVMNytaenZMZ1BHY1hVbUZOSTJUMHp0L2hJeDgzVmRxU2ZEdUs3eDNr?=
 =?utf-8?B?N1BVUlV3a2pRbGJYOGNka2x4SkVPSEcwS1BQY3dUWkxvTzdEUGZpaTFIZ2NO?=
 =?utf-8?B?T3JXWldtSlp1NUREbzNMK0xZNGNOL1crL0JZR1ZCaGlWVDY4SStOdXpTM2Nz?=
 =?utf-8?B?WHNlZnhjWWRhUDhteVpnSXlQWnhJeDZHVkkvQXRwUngrdDBsSVR3TFNwUERk?=
 =?utf-8?B?TElDSVBybzhjTDN3NEdDNTc5KzFibUI0TEkyT0dVdHliMGxXSE91dmFOY1dM?=
 =?utf-8?B?TXJnUys0Z0EzOUdEa2NJOGZKR2srQjlQOHh3UGwzVHFBY1JDV0IyRHV1eWZq?=
 =?utf-8?B?TWpVa20rUWxpY2l6cXJrRE9kWllEeERpMkpYOUZQUlVwb1VhTStmcmw2dzVD?=
 =?utf-8?B?NHlveUp2WWZ6Ri9aamRhOFNSK0hnQkpvVFU5YXZWQUFwZTZhUnRWZGI3Qm1w?=
 =?utf-8?B?TkZYakdjSjBBQjZLOFoyM2ZPM3BudDJmZlU0SFltODhObG04NVZSbzE1RkQy?=
 =?utf-8?B?MVNtOWhQV2hMbFA2YmVQYTIrcFhnYVJiVW40WEJwV096d2FYVzZtVlBoc0or?=
 =?utf-8?B?VmdzeVU5RXV1RTJSb0dsUkNrdXllaFJkZGJqSnhzZnpoSnh0REZTSmU1NVRz?=
 =?utf-8?B?WW5MQ2hXSEtIOXVoRzRPRy92MHBGQmlPTEpoamY1KzlpTGI1aVp4bmZBdTQ1?=
 =?utf-8?Q?Le1F+RuYTEYuff+itkecoTU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7d5e46-6ca3-4106-3167-08dd52d7e9e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2025 00:29:05.2948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9/5WxwGaoFDFV2Q9+wUeYSqiBMXfsFT7zXxov69d0OQbbGtt0W5rC4kV8jjv0e4yRZqNd8Ki9RHldHXmCIXop6MjXaKkH45azmSoNjeAsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4627
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

On Fri, Feb 21, 2025 at 04:24:30PM -0800, Dixit, Ashutosh wrote:
>On Tue, 18 Feb 2025 12:28:01 -0800, Umesh Nerlige Ramappa wrote:
>>
>> Rename the global exponent to default so it can be used in different
>> modes.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 34 +++++++++++++++++-----------------
>>  1 file changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 9c74315df..e7d6ac5af 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -299,7 +299,7 @@ static uint32_t devid;
>>  static struct drm_xe_engine_class_instance default_hwe;
>>
>>  static struct intel_xe_perf *intel_xe_perf;
>> -static uint64_t oa_exp_1_millisec;
>> +static uint64_t oa_exponent_default;
>>  static size_t default_oa_buffer_size;
>>  static struct intel_mmio_data mmio_data;
>>  static igt_render_copyfunc_t render_copy;
>> @@ -514,7 +514,7 @@ static size_t get_default_oa_buffer_size(int fd)
>>		/* OA unit configuration */
>>		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>>		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>> -		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
>> +		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
>
>My suggestion here would be to (a) either rename this to
>oa_exponent_default_1ms, or alternatively, (b) to rename the period
>argument of max_oa_exponent_for_period_lte() to period_ns. So it's clear
>from the code, without having to guess, what the value of the default
>exponent is.

So, the idea is to set this default to a smaller value like 1000 ns for 
simulation, so that it gets applied to all the tests, hence not using 
any specific values in the name. Thoughts?

Thanks,
Umesh

>
>>	};
>>	struct intel_xe_oa_open_prop param = {
>>		.num_properties = ARRAY_SIZE(properties) / 2,
>> @@ -1089,7 +1089,7 @@ init_sys_info(void)
>>
>>	intel_xe_perf_load_perf_configs(intel_xe_perf, drm_fd);
>>
>> -	oa_exp_1_millisec = max_oa_exponent_for_period_lte(1000000);
>> +	oa_exponent_default = max_oa_exponent_for_period_lte(1000000);
