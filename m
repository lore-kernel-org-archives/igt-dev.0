Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76CECCD194
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 15:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEFB10E82A;
	Wed, 15 Oct 2025 15:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4W+Qw2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AA010E82A
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760542098; x=1792078098;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ec0CDjLBb3M82Vs/lXKI+ILdGmCTvVQwr79F9rOK8aA=;
 b=X4W+Qw2ODaaKW+6TjHfYxA9EYz0ElftHPJ14FOXpMakWVXOKHrpQWfYu
 Ab2+gkQHvnmRFDG1tn5Luk9ymF0ZqgMtkQz5Vd/fQ3y4SKE6o5ageuUek
 A38/MtZhuFm2fkw6W2n975FvnEjQzpqLDLQR2H5iDcpYOjvzkG9SkjSI0
 j/h9rDlL3bItqoQHG/zxLcQUTM9Qhb7vX4pOA5Ge2Pe2PAmLDvInwJ5BU
 orlw+VcvSRoRjBseExO12p8KH38dtCZXg2s025rrDsJEboSnNJRySAWiM
 ZP961vgli0lhXrUpX3dVPFe3s8BOkKk0ZSXRHK9j1UnWii3c28bWZR57u A==;
X-CSE-ConnectionGUID: pVAoEcyhScSaNgTo3FDL1w==
X-CSE-MsgGUID: CJMiEzRISXeSr/t4zV6nCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="74168695"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="74168695"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 08:28:14 -0700
X-CSE-ConnectionGUID: 0fpmv84rQmCb039Qq8C2/A==
X-CSE-MsgGUID: dh6SwO/+T06OqrPeLqp3nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182602089"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 08:28:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 08:28:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 08:28:12 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.17)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 08:28:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nhr9f11Ysyd4FxN2Qlui2pHC6fUgbqSMgr2zJ6QCUmK74OXWXXXcxfppX9Tjs/X5bq8NSe6DQdjQIfEJlj+fn83OZ67mPeoYr+6ad0H4nxLx3hUJESS6hCgmTl1IYQooTHGwSY2LW5O7XUdW5if/ShNTLjtFHreZ5SdQmr5S//NKRCp/kv75HNXPlJmeIlPmIe0w3jzcupRYKgU2wee/xjcPD7gZotMExK00lE/d9qzcu/hXUTJKGDJjPKEsJpATcmIu+IJvZ27TDCr/gznld3dRdp0E7wZjaY1Rc2Aa7voTbMsAvSugh8anDccYiLKRzaVYNSF8XAsELBLlFjv64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYhwDol1+KU1+Ifmb1TSEU+HfZK4a4VLML57nVanAHA=;
 b=rbmXRo/VBmV1EPqAJaQGp31bWZrk7Ut6HnuwiXq7Hdb8iNtkyTVxpGxaPIRPFu8ptASvFdspmrqWgQpMZSh5W57MqSV5Lc8XnO9sbx5NIIcrhHSWjjdx/VUIUZblFYHBbynI1hwLInvBEy+lkGZYvOeLmVPNTwh0AFR8SiQBOFM/xfVg1kS9VDz85kRvRZaDZShrgf9crkp1IcVfN9L1Y38C0iWugjMx9hKznrdqSZFWkgxrIIg98Yop5BZTIVQxyQBP65zoOrVdd/7SU5lXKWt6aPiLQjo03evaEnzlQt1ZGsiLV5YGmq+dQs6I1m/JAxEuto4yy8gIkg2FgAdm6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA4PR11MB9324.namprd11.prod.outlook.com (2603:10b6:208:569::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 15:27:58 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 15:27:58 +0000
Message-ID: <91d7cb05-f2fa-41e2-910a-b002826f84a7@intel.com>
Date: Wed, 15 Oct 2025 11:27:55 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Ffault=5Finjection=3A_Set_guc=5Fwait=5Fucode_pf_only_=28rev2?=
 =?UTF-8?Q?=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20251014173155.800954-1-zhanjun.dong@intel.com>
 <176052312945.15142.5201677078154685560@97596180aaec>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <176052312945.15142.5201677078154685560@97596180aaec>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:303:85::28) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA4PR11MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b68659-f69b-4cb2-c401-08de0bff6b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkFKTlM1Ukh6WjdOSzI0ZmlIYzRLc3BuNUlnM2VWcmFpbFlNSWxsTDl5TnR3?=
 =?utf-8?B?c3IzNFNiM0drd0VUUU8zNnNpT2pzbmVDTkdGc0dBTG9vQVN0ZnUxa3FFdVp3?=
 =?utf-8?B?NDl4c2o4Q0I3WnFjWXZxZFRkN2hHbTgwMXIyNWZSVHN2SUlhVVdFV1NjWCtK?=
 =?utf-8?B?YUJGQVNMZHNrM3lwWWJ5aEo1MEJjaDV2Kzc3aFgwOW1xMkZjdE9hNE5PejQ4?=
 =?utf-8?B?YXZpOVZ3bXU5YkZxWDZMTjJsNUI3MnZUNjhPSVN6Y1IzTTNlT2lGbkJkSEtZ?=
 =?utf-8?B?YldpL2toazdHM045c3RiTUYvOWdmSUFxazZnM2dvdVJ2dmVqWElYR2FKMC9q?=
 =?utf-8?B?ZUluS3drcU5NSXVaNDltUzdmZWFJeE9CTTRBTmd2RVFBdmhLck9haHZUWnRX?=
 =?utf-8?B?WCtJaFY5V0k1RzJWeGR4Zlh3WDNWazU1ck9aOHg3a3BoKzZoZkdQc3VOdUEr?=
 =?utf-8?B?TEFrWi9tUXMwak42ZFpVMmxLVFI2eGlMT2VvUG40dC80QUd4SElhaWhBV0FH?=
 =?utf-8?B?Qld0MVR3TXhSQVhMd2pWQ3h3Vm5DbzBtSGdrMmxuaDdSUzdSODdKd1NsV2J1?=
 =?utf-8?B?eTUxNDNzZytpT05OVWJuUFRxejVYbWpQZkZEUXFDT3M0eW5mTmg0MUdSUWIw?=
 =?utf-8?B?cEZPWnhaYitUWUVwcUk2YnU2dHc4TmZKK2xWQ3lkL1ZMaER0dklQMHVtT0NO?=
 =?utf-8?B?MXNIVEc3LzhzNjhvcnNPZUswVHVHUzRXdUNtMGU2VytnRmhQaWEvT04xY3ZV?=
 =?utf-8?B?RVMwaERxamQ5K3ltUS9za0drM2djeHNmU1oyTEx6eU1hc1JSRHNjU3psTXhY?=
 =?utf-8?B?Rjh5SkgyZTl5emsyYkMwV0RSQ2Nnd1J6WU8rb1FlbmFodnU5eCtqVTJiazRr?=
 =?utf-8?B?aGdHT3A4NnNPQ011WWxHWHBpLzJoMDBPRTZsVFVUSkdkaVBwN2J3aFRFbGRi?=
 =?utf-8?B?VHhQWmttamVLOTkvZlN6aTVLb0NaSFI3b1hMQUFUM2VMY083ck41UTdGWVZx?=
 =?utf-8?B?VkdqUmVvbmhjSDN6OGtyQlZYK1VVQjFSSCtTV25sRlpjZFB1dGNSR0VzZzVj?=
 =?utf-8?B?RUdqaHlGU2NXOWhWaFNMNU5xdWNPRzdFTUE2ZVNtKzBabURsc2Fpd3VtMDJN?=
 =?utf-8?B?WCtQenZLaGUyVjFzRDRsQTdJKzJiWVRJbEk3NmcwcitEay9hMDRTQSthK1VL?=
 =?utf-8?B?UVA3OHdLNHlzTkowUmlwTDAyZ1FjY2VkL0MvY05TZlhnMjZiSjhMRWhMWXds?=
 =?utf-8?B?SHAwbzBWd05jUDJxWHorak81QVYxcXhLRUY1VENuNGczbTlrMzh0M25COUJs?=
 =?utf-8?B?ZWNPVy9JKzBOYTVobk9nWmwwa2QxKzRpWXMvNVROSTBTZjlmVDYyOWNhcER5?=
 =?utf-8?B?RWwvbnprblVaNGFVL3N6MElEY0l0bGhBZmxER2tlcTdzNjhyeHJkTWhsbC9P?=
 =?utf-8?B?ZEgra2szMWZZYUlOb1A3Nk52MXRVZGE4MEFCNG5SU2hmMFFHNGZhYVZwSWtw?=
 =?utf-8?B?SkRwcGNkeEU2Q0NISFppL1FVUXFuU0lqN3pSR2RUOXMxb0lnR1hyL1ZkNGFV?=
 =?utf-8?B?K24rR2JTcUVlbUtYWms1WklCM1FuYm1aVVV3OXRUN1FTYW9NQzdOeGJCaXBS?=
 =?utf-8?B?cDNIVE5vR01mNHFXWEprQ3FnR3BUUVJobE1wNGJia2VvWXovbGJac3N2bmY5?=
 =?utf-8?B?b2FFSzFLQWVaNmpHaWl6NmRkUnVGZGZ0LzArYUpEWkVtRGc3ZVVxeHl6eWdu?=
 =?utf-8?B?QS9wWEN6am5CVHc3U0tPb1hpQWJtck9LaGtFb2dpc0RwZWE1VGpPKzc3YWNX?=
 =?utf-8?B?QStpWFluYU4yQ3Z4RHJQb0VZZE1qdUpFWFJUM3o1eTRpeHdhazFPeEhwdFhH?=
 =?utf-8?B?R1JocE51MmZsa0MxTy9VRVdScE1wRFl0bXMvZi9oVUxLZFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlJyVHR4WkJsSnJWNHE5cEJDaUdCdkxaQzNRL2dYWkw2UjhxcFA0VzIzOHRi?=
 =?utf-8?B?cTZQbnloVEp6ejQwV0YxYWhZY0FyVHVtazhEQ2FPY3JUSGJmQTZISmhIbHBY?=
 =?utf-8?B?Rk9qamluZm5Oem4zekpMUExhNDFacVlMZUhOZUo2emFnZ1JuVWRkUWE5NHpV?=
 =?utf-8?B?Q1p4U05aaUplYWZINzJYNU1RMk9IVndIalg4S29WSUk3SE55dzZxeXZaUmEr?=
 =?utf-8?B?VmJpL3VWSi9BUk15U1NnUDAxR2J6VEh3Nm5wSnhIazlPVERPcjRiOFUrcHBG?=
 =?utf-8?B?UXNWMklOczBSK3BMNGt3YnFtT05wbTE5bFhNNGxYWUFvbnZyVTJCb1VoSmdT?=
 =?utf-8?B?SDdvVEJCbmdyT3pBM3J2ODlkeHFxSVpvYlp2dHdjZDB0eFhYbDIwMEtYbFFo?=
 =?utf-8?B?bW1wV3BXa1RObk5DWU15M3VzYWx5ajlWOXJINlNXOHVBbG5jL0ZCN1dSRWIw?=
 =?utf-8?B?NGNIZjlkRDhyU3p4djBISkxsNHl3TllRbmRoTkJwZTR0ZmJ1ZTJzWmN3NUZt?=
 =?utf-8?B?MWxGVG1yWFU3Q1dvV01Wd1ZXQ0hzL3lJYkloVWNWUGZVZkdnTm9KRzYxa3d4?=
 =?utf-8?B?ZGN6RTZ0cWJjWXVHWnQrUW12aTFwRmo4cUsvM0Iyb3NFT1lqM1R1eWdaMk9s?=
 =?utf-8?B?QnBZeUx3K0hoTzg0Vk1zVkdhY0trNEJOTDE0M2NxU2wvcFhYMVB2S2FmaVZk?=
 =?utf-8?B?N2dPMS8xWDJLM3dtc2FqTWZMTzJ0Qm8vcGNCWTE1bjBXekxSUHdKK1hGQTEw?=
 =?utf-8?B?dnd1eTdLTmZyOGJ5K1RXSDBXQmMvNTlNTnBCQzkzZkNVREljdGpkbm1sc2Zm?=
 =?utf-8?B?NjF6U1NMVVpSMXRMSVN6OXFqQldDYlU3U0o1dzNMYUhZV2NyL2FNRFpyWmN0?=
 =?utf-8?B?VEYvL0pzT3B4c3JRZ2VnY3Vnd2MxaWZGOWZVa2FHZ0FTaEdoZXlZVXl3aUlk?=
 =?utf-8?B?VDNTRjFNS1hGbkYyYVJIeFpiRnUrV1o5U3lsUU9LWnZxVWRJazF5SEpwbG1p?=
 =?utf-8?B?eE02RnE4VnlrVzJ6aUVkQVVHRWIzZTZTdlN4MU1YU2FTWTA1SHZJUWdJUU9K?=
 =?utf-8?B?MkJhZllRaWJYZEFTaFNHSGR5RERQTHlyLzR2QW5JRXpPbXhueTA4aVZHY3FN?=
 =?utf-8?B?Sk9qVUVaQ1hZdk5PVXdUbEk0V2hqQW1lSmlGN2ZOblpiMktlckVDRUtnWmQ4?=
 =?utf-8?B?Vlg5ZlZLZW9zQTZhbUphalBRa1Z4L1VrOC9NN2gzbnRlMk1wSjFQdXRJRVVr?=
 =?utf-8?B?T1VoQnRaa09Lc3FPb3k0QVFkdkxpRXJVMjRVVVErRjM2NmpkMVRMbkZYZ1c5?=
 =?utf-8?B?NXI4Y2FuN2t3MytkdkpJUFNFMlVYb0JkaEt1NVlaSm5taVVaQk9md0ozTGpF?=
 =?utf-8?B?WEZKbCtaNVAwdU00MFpBRVU4ODZsSHpXdHJNcU5LYzdXb0pudTRjaTlVQnhy?=
 =?utf-8?B?czJTaXd1MkRtaFFud2xSMjVTcG11YlpTS2FqUTFzakRXRjhCTWYvWVZrWXBz?=
 =?utf-8?B?SGFOMS9jOTE2cWtIN1RDVHhjV2dveHZ5Y25PUVgxZWgvYmJkWmZqcGRkTkZv?=
 =?utf-8?B?UVZUN0RjSUVWWWpIMUNNRG5oTHVLU1h3NzQ5eUVTTVQ0QlR0UkZUZ2lZQ2Qy?=
 =?utf-8?B?L1Vsci82N2pKeEZDTEwwSGxWMjYzSW9BSWZSdkZ1N2g1b0hiVlI3MVovQjdO?=
 =?utf-8?B?MlYrRFFaRWcyQmwxWE8rZXZ3Y1VqUFhvUGhBeWNLT1R1VzZPRHFYS2hrMXVk?=
 =?utf-8?B?aGxYQmVWTndEMTNKUkRuc28yTjNKUCtKVm51bFluQ0FhYW55RFZrbzlvNng4?=
 =?utf-8?B?M0praG5HWjZiUlA2VVJTdWJRL1gxdC9BdHJXUDl1QVlPT1hmbHowUVR2emox?=
 =?utf-8?B?b1k4Mmc4ampldWFnb2M5VHo3Tmp3N1B1MTNET3ZmcTFDVUVPRXc4ZGtSYUhT?=
 =?utf-8?B?ZGFuTy93dkxKbmd5a1RMVHpicW1iN3B1K1ZCMHNISTJTN1U0OGpINFR2M3Vw?=
 =?utf-8?B?ZmVtZFBaR3lxQ3loQWMxVE9EdVJqeWhTMXd1aXVmVHJ2VmN0OTlDMCsrRlh4?=
 =?utf-8?B?ZEptOXlMSVJDMkpGQ0hRd2Rzc05mWkpXWXNXc0E1aHc1ai9ZdzdMLzA2S0dN?=
 =?utf-8?B?R3MxV2lqK2ZISmxWeG00S0FGOGh4SmEwN0NIZGZ2TGZKTFZ1bktqWEVoUm9a?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b68659-f69b-4cb2-c401-08de0bff6b89
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 15:27:58.4326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZ0d74At37+sxd05nvAYJJ+JFPs9lVar6kpgOP4Eh+luGD5nu1iC5oRRapKqCxBKOaSi+8LIh9tJtyyiEOArEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9324
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



On 2025-10-15 6:12 a.m., Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel/xe_fault_injection: Set guc_wait_ucode pf only (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/155298/ <https:// 
> patchwork.freedesktop.org/series/155298/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/ 
> index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_8583_FULL -> XEIGTPW_13899_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_13899_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_13899_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 3)
> 
> Missing (1): shard-adlp
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_13899_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_flip@flip-vs-dpms-on-nop:
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-7/igt@kms_flip@flip-vs-dpms-on-nop.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_13899/shard-bmg-5/igt@kms_flip@flip-vs-dpms-on-nop.html>
>         +1 other test dmesg-warn
> 
The dmesg warn:
<3> [293.578573] xe 0000:03:00.0: [drm] *ERROR* Late bind component not 
bound
is not related to this patch.
> 
>         Warnings
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-
>         primscrn-spr-indfb-onoff.html> (Intel XE#5390 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-
>         onoff.html>
> 
The warns:
<4> [771.044219] xe 0000:03:00.0: [drm] Tile0: GT0: Check job timeout: 
seqno=4294967169, lrc_seqno=4294967169, guc_id=2, not started
...
<4> [796.644237] WARNING: CPU: 11 PID: 204 at 
drivers/gpu/drm/xe/xe_guc_submit.c:1379 
guc_exec_queue_timedout_job+0x400/0x1f20 [xe]

...

is not related to this patch.

Regards,
Zhanjun Dong

> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_13899_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-1/igt@kms_big_fb@4-tiled-8bpp-
>         rotate-90.html> (Intel XE#1407 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1407>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-
>         stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#3658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658>)
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-464/
>         igt@kms_big_fb@linear-32bpp-rotate-270.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1
>         other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-0:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-1/igt@kms_big_fb@y-tiled-8bpp-
>         rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-
>         rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-466/igt@kms_big_fb@yf-tiled-
>         max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel
>         XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1124>) +3 other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-1920x1080p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-434/igt@kms_bw@linear-
>         tiling-2-displays-1920x1080p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-
>         tiled-gen12-mc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-464/igt@kms_ccs@ccs-on-
>         another-bo-4-tiled-mtl-rc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-432/igt@kms_ccs@crc-primary-
>         basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +41
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-463/igt@kms_ccs@crc-sprite-
>         planes-basic-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2 other
>         tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-434/igt@kms_cdclk@mode-
>         transition@pipe-d-dp-4.html> (Intel XE#4417 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4417>) +3 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-5/igt@kms_chamelium_hpd@common-
>         hpd-after-suspend.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-3/igt@kms_chamelium_hpd@dp-hpd-
>         enable-disable-mode.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-435/
>         igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html> (Intel
>         XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_content_protection@atomic@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-5/
>         igt@kms_content_protection@atomic@pipe-a-dp-2.html> (Intel
>         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-433/
>         igt@kms_content_protection@uevent.html> (Intel XE#1188 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) +1 other test
>         fail
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-5/
>         igt@kms_content_protection@uevent.html> (Intel XE#3278 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3278>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-128x42:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-4/igt@kms_cursor_crc@cursor-
>         onscreen-128x42.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-32x10:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-463/
>         igt@kms_cursor_crc@cursor-random-32x10.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +9
>         other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x170:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-435/
>         igt@kms_cursor_crc@cursor-random-512x170.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-2/igt@kms_cursor_crc@cursor-
>         random-512x170.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-
>         atomic-transitions-varying-size.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-bmg-6/
>         igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-
>         varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-5/igt@kms_cursor_legacy@cursorb-
>         vs-flipa-atomic.html> (Intel XE#309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>   *
> 
>     igt@kms_display_modes@extended-mode-basic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-1/igt@kms_display_modes@extended-mode-
>         basic.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_13899/shard-bmg-6/igt@kms_display_modes@extended-mode-
>         basic.html> (Intel XE#4302 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4302>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         bmg-6/igt@kms_flip@2x-flip-vs-dpms.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +4
>         other tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-3/igt@kms_flip@2x-flip-vs-dpms-
>         on-nop-interruptible.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-2/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>         upscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1401> / Intel XE#1745 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>     upscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-2/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>         upscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-8/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-
>         downscaling.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293> / Intel
>         XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2380>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-8/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-
>         downscaling@pipe-a-valid-mode.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +1 other test
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-7/
>         igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html>
>         (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@fbc-suspend.html> (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) +2
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-5/
>         igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#1469
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-
>         onoff.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2311>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-
>         mmap-wc.html> (Intel XE#2313 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2313>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-
>         move.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-7/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#656 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/656>) +5 other tests skip
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-dg2-463/igt@kms_hdr@invalid-hdr.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         dg2-434/igt@kms_hdr@invalid-hdr.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_hdr@static-toggle-suspend:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/
>         shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html> (Intel
>         XE#1503 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1503>) +1 other test skip
>   *
> 
>     igt@kms_joiner@basic-ultra-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-1/igt@kms_joiner@basic-ultra-
>         joiner.html> (Intel XE#2927 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2927>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-434/igt@kms_joiner@basic-
>         ultra-joiner.html> (Intel XE#2927 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-2/igt@kms_joiner@basic-ultra-
>         joiner.html> (Intel XE#2927 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2927>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         lnl-1/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#718 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-
>         plane-move-continuous-exceed-sf.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-
>         plane-move-continuous-exceed-sf.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2893 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-464/igt@kms_psr2_sf@fbc-
>         psr2-plane-move-sf-dmg-area.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +2 other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-plane-
>         move-sf-dmg-area.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2893 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2893> / Intel XE#4608 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4608>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-plane-
>         move-sf-dmg-area@pipe-b-edp-1.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#4608 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4608>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-psr-cursor-plane-onoff:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-4/igt@kms_psr@fbc-psr-cursor-
>         plane-onoff.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2234 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2234> / Intel XE#2850 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2850>)
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-plane-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-432/igt@kms_psr@fbc-psr2-
>         cursor-plane-onoff.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) +1 other test skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-
>         plane-onoff.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +1 other test
>         skip
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-
>         plane-onoff@edp-1.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#4609 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609>)
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-
>         flip-overlay.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-2/
>         igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406> / Intel XE#4692 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4692>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-433/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-1/igt@kms_rotation_crc@primary-y-
>         tiled-reflect-x-180.html> (Intel XE#2330 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2330>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-8/igt@kms_universal_plane@cursor-fb-
>         leak.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_13899/shard-bmg-6/igt@kms_universal_plane@cursor-fb-
>         leak.html> (Intel XE#3876 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3876>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-6/igt@kms_universal_plane@cursor-
>         fb-leak@pipe-a-hdmi-a-3.html> (Intel XE#3876 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3876>)
>   *
> 
>     igt@xe_compute@ccs-mode-basic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-7/igt@xe_compute@ccs-mode-
>         basic.html> (Intel XE#1447 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1447>)
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-8/igt@xe_copy_basic@mem-set-
>         linear-0xfffe.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-bmg-6/igt@xe_copy_basic@mem-set-
>         linear-0xfffe.html> (Intel XE#3876 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3876>)
>   *
> 
>     igt@xe_create@multigpu-create-massive-size:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-4/igt@xe_create@multigpu-create-
>         massive-size.html> (Intel XE#2504 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2504>)
>   *
> 
>     igt@xe_eu_stall@invalid-sampling-rate:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-464/igt@xe_eu_stall@invalid-
>         sampling-rate.html> (Intel XE#5626 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5626>)
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-
>         ufence-delay-ack.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +3 other
>         tests skip
>   *
> 
>     igt@xe_eudebug@discovery-race-vmbind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-8/igt@xe_eudebug@discovery-race-
>         vmbind.html> (Intel XE#4837 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4837>) +1 other test skip
>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-4/igt@xe_evict@evict-beng-mixed-
>         threads-large-multi-vm.html> (Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1 other test skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-rebind:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-3/igt@xe_exec_basic@multigpu-
>         once-rebind.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-5/igt@xe_exec_basic@multigpu-
>         once-rebind.html> (Intel XE#2322 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2322>)
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-435/
>         igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +7 other tests skip
>   *
> 
>     igt@xe_exec_reset@cm-gt-reset:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-5/igt@xe_exec_reset@cm-gt-reset.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         bmg-6/igt@xe_exec_reset@cm-gt-reset.html> (Intel XE#6325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6325>)
>   *
> 
>     igt@xe_exec_sip_eudebug@breakpoint-writesip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-433/
>         igt@xe_exec_sip_eudebug@breakpoint-writesip.html> (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +6
>         other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@once-mmap-free-huge:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-bmg-6/
>         igt@xe_exec_system_allocator@once-mmap-free-huge.html> (Intel
>         XE#4943 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4943>) +3 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-1/
>         igt@xe_exec_system_allocator@process-many-mmap-huge-
>         nomemset.html> (Intel XE#4943 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4943>) +5 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-
>     remap-eocheck:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-434/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-
>         remap-eocheck.html> (Intel XE#4915 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4915>) +89 other
>         tests skip
>   *
> 
>     igt@xe_exec_system_allocator@twice-large-new-race:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-
>         new-race.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_13899/shard-bmg-6/igt@xe_exec_system_allocator@twice-
>         large-new-race.html> (Intel XE#4937 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4937> / Intel
>         XE#5625 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5625>) +1 other test fail
>   *
> 
>     igt@xe_oa@invalid-oa-metric-set-id:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-436/igt@xe_oa@invalid-oa-
>         metric-set-id.html> (Intel XE#3573 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +2 other
>         tests skip
>   *
> 
>     igt@xe_pat@pat-index-xe2:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-434/igt@xe_pat@pat-index-
>         xe2.html> (Intel XE#977 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/977>)
>   *
> 
>     igt@xe_pm@s4-basic-exec:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-4/igt@xe_pm@s4-basic-exec.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         bmg-1/igt@xe_pm@s4-basic-exec.html> (Intel XE#6339 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6339>)
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-dg2-435/igt@xe_pm@s4-basic-exec.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         dg2-463/igt@xe_pm@s4-basic-exec.html> (Intel XE#6339 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6339>)
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-lnl-7/igt@xe_pm@s4-basic-exec.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         lnl-2/igt@xe_pm@s4-basic-exec.html> (Intel XE#6339 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6339>)
>   *
> 
>     igt@xe_pm@vram-d3cold-threshold:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-7/igt@xe_pm@vram-d3cold-
>         threshold.html> (Intel XE#579 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/579>)
>   *
> 
>     igt@xe_pmu@all-fn-engine-activity-load:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-464/igt@xe_pmu@all-fn-
>         engine-activity-load.html> (Intel XE#4650 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4650>)
>   *
> 
>     igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-
>         exec-post-rpm.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-extension:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-dg2-463/igt@xe_query@multigpu-
>         query-invalid-extension.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_13899/shard-lnl-2/igt@xe_query@multigpu-query-
>         invalid-extension.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>   *
> 
>     igt@xe_sriov_auto_provisioning@selfconfig-basic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-
>         basic.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_13899/shard-bmg-8/
>         igt@xe_sriov_auto_provisioning@selfconfig-basic.html> (Intel
>         XE#5937 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5937>) +1 other test fail
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_hotunplug@hotreplug-lateclose:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8583/shard-dg2-436/igt@core_hotunplug@hotreplug-
>         lateclose.html> (Intel XE#4842 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4842>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_13899/shard-dg2-432/
>         igt@core_hotunplug@hotreplug-lateclose.html>
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear-
>     atomic@pipe-c-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-
>         flip-events-linear-atomic@pipe-c-edp-1.html> (Intel XE#6054
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/
>         shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-
>         events-linear-atomic@pipe-c-edp-1.html> +3 other tests pass
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-
>     edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-
>         flip-events-linear@pipe-c-edp-1.html> (Intel XE#5993 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5993>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-
>         linear@pipe-c-edp-1.html> +3 other tests pass
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-
>         displays-3840x2160p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2894>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_13899/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-
>         displays-3840x2160p.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8583/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113> / Intel XE#4345 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4345> / Intel XE#6168 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6168>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8583/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113> / Intel XE#6168 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6168>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_13899/shard-dg2-466/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html>
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-
>         toggle.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2291>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-bmg-2/
>         igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html> +1 other
>         test pass
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html> (Intel
>         XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2316>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_13899/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html>
>         +5 other tests pass
>   *
> 
>     igt@kms_hdr@invalid-metadata-sizes:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html>
>         (Intel XE#1503 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1503>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_13899/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes.html>
>   *
> 
>     igt@xe_exec_reset@cancel-preempt:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8583/shard-dg2-434/igt@xe_exec_reset@cancel-
>         preempt.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_13899/shard-dg2-463/igt@xe_exec_reset@cancel-preempt.html>
>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8583/shard-dg2-436/igt@xe_fault_injection@probe-
>         fail-guc-xe_guc_mmio_send_recv.html> (Intel XE#5893 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5893>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         dg2-435/igt@xe_fault_injection@probe-fail-guc-
>         xe_guc_mmio_send_recv.html>
>   *
> 
>     igt@xe_pm@s4-basic:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-lnl-8/igt@xe_pm@s4-basic.html> (Intel XE#6339
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6339>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/
>         shard-lnl-2/igt@xe_pm@s4-basic.html> +1 other test pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-6/igt@kms_content_protection@atomic.html>
>         (Intel XE#2341 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2341>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_13899/shard-bmg-5/
>         igt@kms_content_protection@atomic.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-7/igt@kms_content_protection@atomic-
>         dpms.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1178>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_13899/shard-bmg-6/
>         igt@kms_content_protection@atomic-dpms.html> (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8583/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-
>         varying-size.html> (Intel XE#5354 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5354>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html>
>         (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-
>         primscrn-shrfb-msflip-blt.html> (Intel XE#2311 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-
>         msflip-blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-indfb-plflip-blt.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5390>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-cur-indfb-draw-render.html> (Intel XE#5390 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-
>         draw-render.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +4 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-
>         primscrn-indfb-plflip-blt.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-
>         plflip-blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-
>         primscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-
>         draw-mmap-wc.html> (Intel XE#2313 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +9 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-
>         primscrn-spr-indfb-onoff.html> (Intel XE#2313 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13899/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +7 other tests skip
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3544>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_13899/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3374> / Intel XE#3544 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3544>)
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-y:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8583/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html>
>         (Intel XE#4596 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4596>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_13899/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-
>         y.html> (Intel XE#5021 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5021>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_8583 -> IGTPW_13899
> 
> IGTPW_13899: 13899
> IGT_8583: 8583
> xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb: 
> c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb
> 

