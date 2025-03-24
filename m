Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD46C36001
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 05:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D765610E10F;
	Mon, 24 Mar 2025 05:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AG5g98uI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A070510E1A4
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 05:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742793885; x=1774329885;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NgASY3hF5iPiYouBhVmd3ZlRtlHMHhvGBV4icsmeWw8=;
 b=AG5g98uImZi9QD4pThPjGJJ9CV1XU+f68rsyxIy6BS/PCIrwCWeGX6vy
 6Wg2X4OhBBqlrEPqJligN7DiWsmKOo7HmRhOWU6ksHI24O6yu3qX/4rqJ
 XQsMOMJ+EHPTuvOei6kN8GbwotJoMmzxKX2Ck91DUzLWq7AcY/yei6+tX
 wX/qphYZ7QKraz7dkeiLr4sSf2pTwDn0kd0PyE2YMRZJfO6q8ldaDRPo8
 xuU8lj0CAe1Oxz97wq5JdeXsmSQFTBKHcXK6OD8eV07ZKF/q4Ww3fPuWk
 XkOhOPxFHOoJAoQu8h2vcHWchUJh3HKFfXijAi6TjN7aSbSgZ8nVvf6R8 A==;
X-CSE-ConnectionGUID: CpYocR6lSdW591i7zJ9omA==
X-CSE-MsgGUID: TYexG+qBTwe7hORKlx02uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="43213221"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="43213221"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2025 22:24:44 -0700
X-CSE-ConnectionGUID: kTjW/EgeQnCumpwunTUdsg==
X-CSE-MsgGUID: 3HSOi/vQRVihHQ6Q3DnWTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="129042636"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2025 22:24:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Sun, 23 Mar 2025 22:24:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 23 Mar 2025 22:24:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Mar 2025 22:24:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErRYOO7HAbKqgyiA1R0xZLf4IMkKtYawEMln3iJmr+JwxGKr/TpIqSPoJHSIi4KgmQur3MJVOkLzUcKYamQGRA6jsLfq5xMwMCHL2827Shx2VSwbNSyWXT8hwvGGYcrkyfKr+zIyNPrZwu5lkJHDKsGPCHhBwNmIXLsSTlfx/vNM0isjU6s4cvtfK6LZPJKlAPl7Q6R/HdEOeBWKpjdKu8y5RjALzwOmc6JAsaGGYTVbrSMj8HC+Sd2Cew2aYblsll/ii7xUdIJfUtSI33dMV3fEEmcSCIZ/XZ1mPzr+HYNGUI6zVhRgiTR2BomHAVbwouoJLewaRN1PTTIeuUyfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMXkzw5EUTNDDYyaTVifG16DXZXz8J2eHLjT/4bfyXU=;
 b=lDZCFwW9ICSkfxBPLPxLhp+/0Zzu45CunvhLLX3ebR3Y+ko6Yp1BnG9qdipNcI0W1xdw8AsGWIosTSos7MeOEAx9W9Y5DiJ2ar7+rARK1dazw3X4mz81bS59oam0283IvFiUip05wzkbGOjEizNgGVj187aEGcFmWMK0NkFHS+PchKC1kGzNjvPYzslsuPSIXAgQpa5Jk4BYcEUVw1BCdmYVNdbgmjaORSvntzJLPXvOLVSyFvKZ6szVR9nlB2MqPbsocUIdT3pcCcDayjVsNb6UyV29X8ohpK29kbgJFbNZOxHHmb/GmamNx3jd1aGhhOpWcVHEntN3xQY3YH2eJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB5947.namprd11.prod.outlook.com (2603:10b6:806:23b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Mon, 24 Mar 2025 05:24:41 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 05:24:41 +0000
Message-ID: <4143dc74-31bf-4e32-9346-ede15aeadb13@intel.com>
Date: Mon, 24 Mar 2025 10:54:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/3] tests/intel/xe_pmu: Add engine activity test
 for all functions
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <satyanarayana.k.v.p@intel.com>
References: <20250321110958.3557106-1-riana.tauro@intel.com>
 <20250321110958.3557106-3-riana.tauro@intel.com>
 <Z93P87YG8/Naifh2@soc-5CG1426VCC.clients.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z93P87YG8/Naifh2@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::33) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB5947:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a43046b-6eba-4acb-3351-08dd6a942d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVVibm9KaDR6dTVBRlJaWEdTcWpiWVBiWHJiaHpvclBuQ2pVcHAwUHRTTEdJ?=
 =?utf-8?B?TUsvQjhZakxjZHR0YjMyQzFya1M2bUpJbS9qNVU2ZWNiQ3NIWDNHUlVRU2RT?=
 =?utf-8?B?YkhRbkUwRENoUEJUQ1pPcmFPK0htUlFpR0RiQklUVkpCVUY2U1lqSTNkVmRR?=
 =?utf-8?B?VmgxZVZOVDhrN1hNTjJOM2Q4ZUpvMERqQ09UQnduSm9PVXRQcnAvcmhyZzht?=
 =?utf-8?B?TndOMnlvWm5IeHNQUmNNZ3RiWk1XR0pyWjR3Uzhud2pEN0JBMmZ1dHBKTjdv?=
 =?utf-8?B?MHNFUkgxNGQvWGdIT24wUWJVV3YxNi9kZHR6N1d5OUg0UElQRFlERWpBS01o?=
 =?utf-8?B?eUFIMEorcW1aWHd4SUZueFlWNW1Tb0VjZXFTakNqa3ZaZk16SVNTMS9tTHBy?=
 =?utf-8?B?VDI1eitGUThYYjFWdGFKTThxVy9FcWN2VWFkeXNSeWpiSUZSVXl2a3JGZG03?=
 =?utf-8?B?SnBmMGNoWENCdXFHbVQ4QS9vUzRSaFZCU3dCN04ybFBOckh4c1dtNWJ2S0tM?=
 =?utf-8?B?bUVaODNJNXdxeDBZdDdtY2Z2eVJYa2dCeklCT3RsbXJOdzh1YkdBNmFPelI0?=
 =?utf-8?B?KzNvOTV4K2c3UlduTTlQOGV6QmtTam5zK0hENDdUT0V6UVh0Sk0wTmxpNDR0?=
 =?utf-8?B?cERsTmZsdXR4MGMvRG5JbXZ0OGNIWGg1QUE0bWQyemMvVGdhc2N6ZVI2TDRU?=
 =?utf-8?B?cExXQkNuNk42cDdueTlxTzlOaGZNcnk4dlZ2UzRBTWwwb0RLNDB5dWI0bk5x?=
 =?utf-8?B?dzlNTU5tb0p0TUNsdTJYWnBkRytMM0VmRGdSQ3g4cFFUY3lMbkVjZGU2c2ha?=
 =?utf-8?B?MWViVEEweERxOExhQWlKK0ZqTFNYTFZjeWpTN3hLeHJ1VGxEcmZnL3hkV1d1?=
 =?utf-8?B?a2hURWhySnlyd2w0aXJoSVJnT1ZwWnVLb24vQXU4WFI1UmNOczZWc2Y0ZGxK?=
 =?utf-8?B?UXEra1p6RVBUTE42cExHU25WRjNmVXlYbzlOcWkwN0I5RC9NRzZXTWZiLzVV?=
 =?utf-8?B?UUxVZ3Evb2F5Rzh0QldxZVp5UlNucHRkNmFSeU81N1gvMnJOdEVVSW1LYmd4?=
 =?utf-8?B?TTBSbXpuc2JVaXI3Y3RraisySXhQdU05blhXOFNRajBkdXVCMGJEdzVCcWR2?=
 =?utf-8?B?dGRibDBNTDlMamphQU1zOUpOTDc0NFpTTHRXTVFpTVdFMWV3QkFLWHRseWtI?=
 =?utf-8?B?R1pJU0tESENpb2dsa1dIUFBFNXJqanhwcEw1bFFMWVhpTVptNGc1QWJoVVQr?=
 =?utf-8?B?SkJSZ3RJUmpCS09OT2xnU0dPUVp3b1F4YVJub3A3dGVxSEFWZFpVVVRQQ3g5?=
 =?utf-8?B?Sms3cHI2TEN4UEpHRTJhaUlnSzVqcGlDajY4NllOT1JCTFBvT1M5K0hhTE1i?=
 =?utf-8?B?aDZlMUpNOGNSQ3Q1OTBYL2xuYVp6MFhMTHU1d2pYVzRqN2dHa0h6aFNROG0z?=
 =?utf-8?B?NW5xNGNhc2dVRHd6VFlrTWdTMU80Rk9sbjB4T3paRTkyL2dZR3h1TUhyYTN3?=
 =?utf-8?B?dXFIWGdjc1l3eFc0c21CRlNTNzNEUGJJSUU4VGM1WTRmUWpJaEY3YllqTnVM?=
 =?utf-8?B?SzNZNUpweFZJOXdmSjQvK3pud1FqUzJLRGpDQVhSWUkzeWJmZXY3cUFZNi9E?=
 =?utf-8?B?OUMrSVpJcVdseUVHU20wdmpLaVBzYXBkTlp4amtqQ3k2Wm15ZEdOdTE5dmVq?=
 =?utf-8?B?K3VEZjZ4WkFCTEtDZW9sU1dFV1IzMGxHVDFRaUJhYjFBaVBzeG5MSElyUXRy?=
 =?utf-8?B?NEd4U3V4Q0x1NCtycUxTNjV0eEJFbm16UmowWkxRQ2ZCYzhzNGhmUUkvVW16?=
 =?utf-8?B?Q1pjTjc4WmthWkk2M0ZzbWhPODJZaFV1YmFpb1RnMmxWMVdoeExFS2lqdk02?=
 =?utf-8?Q?WMcNWxkeO96qK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzNRVlZUQU0vV2NHVXVZaGM4VU1wMUZucDM5Ni91djlqRnRsV0Mzc2F4T0Nl?=
 =?utf-8?B?dStvUVFTaXhUaDg4a3k2aUx1TURRZCtSak9ITUFLYnAxbmNGZnRTUmEyU3pu?=
 =?utf-8?B?TWpocUttL2tVSzJ5ZFZENmZYQ3JRVkdwZWZSMGQ0cTkrUXBIVlVIVGtIMVIy?=
 =?utf-8?B?UnVuUk8yTkVwRWQzVmE3UFBvSUFoMG5lY0RxUVRsTXQ1RGw2bXF3Nnh5ay9j?=
 =?utf-8?B?Qzg3eXBERW1nSmEwS1RwdStlQ0VYd2pSamFTYiszZkoza3N5dzdTSFF6SFN6?=
 =?utf-8?B?aTNBRy80dTU0THBVeGFtRlpCMERmSHVFZzQ1T3ZvZXpLUXNKYzljUmFna1do?=
 =?utf-8?B?MUEzc3NHUFlEaDVlQjZwSC80NTJxSFNTNGUrWU90SnhuUkdkbTU1MHl2bm1h?=
 =?utf-8?B?bWRuNEtqR1ljeXhlMnNSU0NZaXdiQ2tUWlBWa1NCc3pzU3gwcmVsU0M1M0JZ?=
 =?utf-8?B?eVNzMkd1RXQ0NWt1QjlBWHZ1UTlhUWpJTFRjY25VaVJBVi9rUi9VQ2R3NW1J?=
 =?utf-8?B?d2JxOXJRVzF1TDl6b2RsSjZ6TXV1QVczS3Njb2ZtL3BlR2hCd3RzRWZ1NHow?=
 =?utf-8?B?M2UwNE95ZHpyZHBNcEZoVUVaZGMvenRuSHFhUlp0cE5Vb25jd0laOW9xbXRO?=
 =?utf-8?B?ZmRJdkM3WEl0SEdOakhZY3gvQlJsZzlDQlFNTXozZnRFRmRHeUsrbWUzSFQ4?=
 =?utf-8?B?ZzQ5bmR1eTZtbU1Mcm9jRGZLU0UzMzFVRjhSVytTaG5BdVVXMnB3anF5TjBr?=
 =?utf-8?B?LzFsSTdoY3Z1dFF6T1NLSEZ2YnRTSEJyZkpQcGFNaXpLWmJENzROSTZHM0RH?=
 =?utf-8?B?OG1CMUg1YnJvQkdzU1RBWTRsK09Qdy9NdHRuWCt2TmlFdGU3UGpmYWVTVmpw?=
 =?utf-8?B?WUJPd0l4VEZMRW01RUtNMUN2aW9NVHU2VHQzU0FPM3hEaGRwUkx5aDhGNWYr?=
 =?utf-8?B?cUVxR1Zza0VOY0J6ellycGcvVHdVTjdJTU9sVzdwM05kMzZJNTdCd09nMjNh?=
 =?utf-8?B?c3RncjBKbWlWZTRRc2RMTHk0aGhBOGM4UUdrWnNqcHZCaVMrMnQ3d3M5ZlhJ?=
 =?utf-8?B?YkppYXpydHNFaTN5cUtVMFdDU2tlY3RlbXpHZHZXd3Jwa3hTS0xtYUpyWDJZ?=
 =?utf-8?B?UjBFOUVLQUp4SG9KbVJOaE5naXpycXNvczQxZzZUdUZtd0ppS2ZwS1JYblEx?=
 =?utf-8?B?NTlRODRXZmlNNCt2elNJa1RXUVdsaDh3cnNMVkRDZnNMQmNlYTQvVERwVDB4?=
 =?utf-8?B?S2hLTG1CZW0ySmd2dEVuMGU1OG5rVzBwajJDUEFUVVpBOVNmUldXZlBVUXhD?=
 =?utf-8?B?TFVPTHZmZEk5SGJrQlpHYU9rQTlYa0I0NjY0cGtybU5ETUt6ZEhLR2xxb2tl?=
 =?utf-8?B?WVlJTDA5Uno1elhRUGcxWjdkZG84NzdlVnZDaXJsVDNjVDAyOHU2RmRjb2hH?=
 =?utf-8?B?VEFaTWpqVTJLT09ZTkdPbjgzUGYvMUJEN1NOY1JEOUZOVVRVU0lVU2JtU3BF?=
 =?utf-8?B?M1QraVU2SHN0bGdZbWFUZVVXMlBaKzkvLzU1QnNlRERQL3lXaHRkWUYwSzNn?=
 =?utf-8?B?ZFl2SG1Pd3hmUGRiZ2luU1pLQW9CditrblNBY3ZNV1BGWjUwYW5QTWNWQXMr?=
 =?utf-8?B?L3VmVmJMVzN5VTR5OHpzS0JLYm16RHQ1MysrdUg4MnVjdlpRWFhvVEg2eTcv?=
 =?utf-8?B?SEJFaU01S1ozcVhNOFBmUlo5THVMeG9DSXVVME5QZGd3cW90bTZZbEVZUVJG?=
 =?utf-8?B?R0d6d2c2U0I4dGs5MThHWlNTMUNiZTRCelVLa0lHOFlWOTVEMEJPTnNiMUF2?=
 =?utf-8?B?QmtlWElheThkaXJuenB0WlRkSU1xRFhjazdwQjBTaGgxQzJob1o5b09hdWxP?=
 =?utf-8?B?NnlXaVRvNVFzUXZORFFVaXVTeGFOV1RlNzZvVWVadzRxOVpxWHphK3dOSmlY?=
 =?utf-8?B?TnhjWGdIOXVCQ05FSmZIazVYbjhkTVFZV0tKYzJaV0MyOHpRakZ2Uzc3TFFi?=
 =?utf-8?B?MUdRbnJ3dDJ5Y0d4cCtsQTluM3V4cEtLbERMUmNWMDJLcE5KKzJpRnozSnM1?=
 =?utf-8?B?VW95TWlvaCsxeFdiM1JKelFIdXUyVXF6MWYyRjJKSW5EV21qMGxVd0lTM24v?=
 =?utf-8?Q?05F3aJiJ6ZgJ7m9HKz4SupAmy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a43046b-6eba-4acb-3351-08dd6a942d94
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 05:24:41.3027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxyecHGZSSY52JFwK7f1MAd3akh2RVT9cZdOtiADlbbZQVtsribNnftR62ydP1VPPLmTaN86P58Z0OI8oa5AEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5947
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

Hi Umesh

On 3/22/2025 2:15 AM, Umesh Nerlige Ramappa wrote:
> On Fri, Mar 21, 2025 at 04:39:57PM +0530, Riana Tauro wrote:
>> Provision and enable 2 VFs with execution quantum and scheduling policy
>> set. Add a test that runs workload on all functions simultaneously and
>> validates that all engines are equally and fully loaded for the
>> entire execution quantum of the function
>>
>> v2: add a different function for function config
>>    add function details to log
>>    move pmu_fd to struct
>>    enable and provision VF's (Umesh)
>>
>> v3: split patches
>>    move exec_quantum to variables
>>    skip test if vfs are already provisioned
>>    fix assert (Umesh)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> tests/intel/xe_pmu.c | 129 +++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 129 insertions(+)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index f0959abe2..9a1f9b39e 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -14,11 +14,13 @@
>>
>> #include "igt.h"
>> #include "igt_perf.h"
>> +#include "igt_sriov_device.h"
>> #include "igt_sysfs.h"
>>
>> #include "xe/xe_gt.h"
>> #include "xe/xe_ioctl.h"
>> #include "xe/xe_spin.h"
>> +#include "xe/xe_sriov_provisioning.h"
>>
>> #define SLEEP_DURATION 2 /* in seconds */
>> /* flag masks */
>> @@ -124,6 +126,12 @@ static uint64_t get_event_config(unsigned int gt, 
>> struct drm_xe_engine_class_ins
>>     return pmu_config;
>> }
>>
>> +static uint64_t get_event_config_fn(unsigned int gt, int function,
>> +                    struct drm_xe_engine_class_instance *eci, const 
>> char *event)
>> +{
>> +    return get_event_config(gt, eci, event) | 
>> add_format_config("function", function);
>> +}
>> +
>> /**
>>  * SUBTEST: engine-activity-idle
>>  * Description: Test to validate engine activity shows no load when idle
>> @@ -187,6 +195,73 @@ static void engine_activity(int fd, struct 
>> drm_xe_engine_class_instance *eci, un
>>         igt_assert(!engine_active_ticks);
>> }
>>
>> +/**
>> + * SUBTEST: all-fn-engine-activity-load
>> + * Description: Test to validate engine activity by running load on 
>> all functions simultaneously
>> + */
>> +static void engine_activity_all_fn(int fd, struct 
>> drm_xe_engine_class_instance *eci, int num_fns)
>> +{
>> +    uint64_t config, engine_active_ticks, engine_total_ticks;
>> +    uint64_t after[2 * num_fns], before[2 * num_fns];
>> +    struct pmu_function {
>> +        struct xe_cork *cork;
>> +        uint32_t vm;
>> +        uint64_t pmu_fd[2];
>> +        int fd;
>> +    } fn[num_fns];
>> +    int i;
>> +
>> +    fn[0].pmu_fd[0] = -1;
>> +    for (i = 0; i < num_fns; i++) {
> 
> nit:
> In the for loops,
> struct pmu_function *f = &fn[i];
> and then you can use f-> below instead of fn[i].
will add this>
>> +        config = get_event_config_fn(eci->gt_id, i, eci, "engine- 
>> active-ticks");
>> +        fn[i].pmu_fd[0] = open_group(fd, config, fn[0].pmu_fd[0]);
>> +
>> +        config = get_event_config_fn(eci->gt_id, i, eci, "engine- 
>> total-ticks");
>> +        fn[i].pmu_fd[1] = open_group(fd, config, fn[0].pmu_fd[0]);
>> +
>> +        if (i > 0)
>> +            fn[i].fd = igt_sriov_open_vf_drm_device(fd, i);
>> +        else
>> +            fn[i].fd = fd;
>> +
>> +        igt_assert_fd(fn[i].fd);
>> +
>> +        fn[i].vm = xe_vm_create(fn[i].fd, 0, 0);
>> +        fn[i].cork = xe_cork_create_opts(fn[i].fd, eci, fn[i].vm, 1, 1);
>> +        xe_cork_sync_start(fn[i].fd, fn[i].cork);
>> +    }
>> +
>> +    pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, before);
>> +    usleep(SLEEP_DURATION * USEC_PER_SEC);
>> +    pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, after);
>> +
>> +    for (i = 0; i < num_fns; i++) {
>> +        int idx = i * 2;
>> +
>> +        xe_cork_sync_end(fn[i].fd, fn[i].cork);
>> +        engine_active_ticks = after[idx] - before[idx];
>> +        engine_total_ticks = after[idx + 1] - before[idx + 1];
>> +
>> +        igt_debug("[%d] Engine active ticks: after %ld, before %ld 
>> delta %ld\n", i,
>> +              after[idx], before[idx], engine_active_ticks);
>> +        igt_debug("[%d] Engine total ticks: after %ld, before %ld 
>> delta %ld\n", i,
>> +              after[idx + 1], before[idx + 1], engine_total_ticks);
>> +
>> +        if (fn[i].cork)
>> +            xe_cork_destroy(fn[i].fd, fn[i].cork);
>> +
>> +        xe_vm_destroy(fn[i].fd, fn[i].vm);
>> +
>> +        close(fn[i].pmu_fd[0]);
>> +        close(fn[i].pmu_fd[1]);
>> +
>> +        if (i > 0)
>> +            close(fn[i].fd);
>> +
>> +        assert_within_epsilon(engine_active_ticks, 
>> engine_total_ticks, tolerance);
>> +    }
>> +}
>> +
>> /**
>>  * SUBTEST: gt-c6-idle
>>  * Description: Basic residency test to validate idle residency
>> @@ -225,6 +300,33 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
>>     close(pmu_fd);
>> }
>>
>> +static unsigned int enable_and_provision_vfs(int fd)
>> +{
>> +    unsigned int gt, num_vfs;
>> +    int pf_exec_quantum = 64, vf_exec_quantum = 32, vf;
>> +
>> +    /* Enable VF's */
>> +    igt_sriov_disable_driver_autoprobe(fd);
>> +    igt_sriov_enable_vfs(fd, 2);
>> +    num_vfs = igt_sriov_get_enabled_vfs(fd);
>> +    igt_require(num_vfs == 2);
>> +
>> +    /* Set 32ms for VF execution quantum and 64ms for PF execution 
>> quantum */
>> +    xe_for_each_gt(fd, gt) {
>> +        xe_sriov_set_sched_if_idle(fd, gt, 0);
> 
> Looking at patch 3, for the new test, the sched if idle is set to true 
> after binding the VFs. That's a slightly different use case compared to 
> the sched_if_idle = false case where vfs are bound later.
> 
Even if sched if idle is set after vfs are bound, test is working as 
expected. And the test which runs simulatenously on all engines doesn't 
require the sched-if-idle case as there is no difference wrt to 
scheduling policy

So added it only for one and set it after provisioning

> I was imagining that the provisioning would be separate for the 2 tests
> that depend on sched_if_idle. Each test (with different provisioning 
> params)
> may need to provision the VFs separately.
> 
> More details in the next comment.
> 
>> +        for (int fn = 0; fn <= num_vfs; fn++)
>> +            xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? 
>> vf_exec_quantum :
>> +                             pf_exec_quantum);
>> +    }
>> +
>> +    /* probe VFs */
>> +    igt_sriov_enable_driver_autoprobe(fd);
>> +    for (vf = 1; vf <= num_vfs; vf++)
>> +        igt_sriov_bind_vf_drm_driver(fd, vf);
>> +
>> +    return num_vfs;
>> +}
>> +
>> igt_main
>> {
>>     int fd, gt;
>> @@ -254,6 +356,33 @@ igt_main
>>     test_each_engine("engine-activity-load", fd, eci)
>>         engine_activity(fd, eci, TEST_LOAD);
>>
>> +    igt_subtest_group {
>> +        bool autoprobe;
>> +        unsigned int num_fns;
>> +
>> +        igt_fixture {
>> +            igt_require(igt_sriov_is_pf(fd));
>> +            igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
>> +            autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
>> +            num_fns = enable_and_provision_vfs(fd) + 1;
> 
> 0) Move the igt_require lines and autoprobe line to
> enable_and_provision_vfs(). Maybe autoprobe can be global.
> 
Will add this> 1) the enable_and_provision_vfs can take params - 
num_vfs, pf_quanta,
> vf_quanta and sched_if_idle.
> 
> 2) Since we just want to modify the sched_if_idle param, we could have 2
> subtest groups.The subtest fixture runs for every non-sriov test from the file in CI.
So even if i run the native subtest, all the provisioning and disabling 
VF's will run on sriov supported machines.

Will check what difference will it be if we set sched-if-idle after 
enabling.

Thanks
Riana>
>> +        }
>> +
>> +        igt_describe("Validate engine activity on all functions");
>> +        test_each_engine("all-fn-engine-activity-load", fd, eci)
>> +            engine_activity_all_fn(fd, eci, num_fns);
>> +
>> +        igt_fixture {
>> +            igt_sriov_disable_vfs(fd);
>> +            /* abort to avoid execution of next tests with enabled 
>> VFs */
>> +            igt_abort_on_f(igt_sriov_get_enabled_vfs(fd) > 0,
>> +                       "Failed to disable VF(s)");
>> +            autoprobe ? igt_sriov_enable_driver_autoprobe(fd) :
>> +                    igt_sriov_disable_driver_autoprobe(fd);
>> +            igt_abort_on_f(autoprobe != 
>> igt_sriov_is_driver_autoprobe_enabled(fd),
>> +                       "Failed to restore sriov_drivers_autoprobe 
>> value\n");
> 
> everything in this fixture could just be part of a helper, for example - 
> disable_provisioned_vfs()
> I imagine things would look like this:
> 
> igt_subtest_group { /* sched_if_idle = 0 */
>      unsigned int num_fns;
> 
>      igt_fixture num_fns = enable_and_provision_vfs(... sched_if_idle = 0);
> 
>      igt_describe("Validate engine activity on all functions");
>      test_each_engine("all-fn-engine-activity-load", fd, eci)
>          engine_activity_all_fn(fd, eci, num_fns);
> 
>      igt_describe("Validate per-function engine activity");
>      test_each_engine("fn-engine-activity-load", fd, eci)
>          for (int fn = 0; fn < num_fns; fn++)
>              engine_activity_fn(fd, eci, fn);
> 
>      igt_fixture disable_provisioned_vfs(...);
> }
> 
> igt_subtest_group { /* sched_if_idle = 1 */
>      unsigned int num_fns;
> 
>      igt_fixture num_fns = enable_and_provision_vfs(... sched_if_idle = 1);
> 
>      igt_describe("Validate per-function engine activity when sched-if- 
> idle is set");
>      test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
>          for (int fn = 0; fn < num_fns; fn++)
>              engine_activity_fn(fd, eci, fn);
> 
>      igt_fixture disable_provisioned_vfs(...);
> }
> 
> Optionally, you could have the all-fn-engine-activity-load-sched-if-idle 
> in the
> second group as well.
> 
> Thanks,
> Umesh
> 
>> +        }
>> +    }
>> +
>>     igt_fixture {
>>         close(fd);
>>     }
>> -- 
>> 2.47.1
>>

