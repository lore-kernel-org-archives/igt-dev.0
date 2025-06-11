Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697E2C71136
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 16:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146A110E6D7;
	Wed, 11 Jun 2025 16:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9XobvR2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119D310E6D7
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 16:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749659915; x=1781195915;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cPsTc7Y+GK/ffx6wkH4f9WGBMMbZYuJF2azAc+Baj8E=;
 b=m9XobvR2dORsrYh5+Y8TpVyt+f924ctUAAyMJiyNfHdaCzIMs+IIvsr2
 hr2GtVXWB9S6d4DJIsnAI1PLP3frSV+WJU8tcyGMtqxY8qZ/3z3Qxr1St
 dha5anE9kPXlbc2UriJw21AsyzerQDA3ELIU8LJ8imulqAgf5zmv4+awm
 iZ9Qc6HlYQ4seVuRbRkN/WN4HDFHhLLFHxokw5n3kKg2KdzcRnqw9db9y
 DOMiR9wWlBnqzfcx78GDrB+SyEqckFlYjdzt7RFXydoiMuoPPM0m3c/Do
 z3P14bTNTvZuIvYU2QahQ9EPfiksOZ0On6hMCfl8ntCBhsRxTg1SAwWv8 Q==;
X-CSE-ConnectionGUID: QupnmIMcTzWUoryljvOsuA==
X-CSE-MsgGUID: O1DVaIuxRx6gNIcGAtk5ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63219942"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="63219942"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 09:38:33 -0700
X-CSE-ConnectionGUID: fEFT7YYhSvCK6dMXwIwR/w==
X-CSE-MsgGUID: xfKG44ADTl6SRyBr0YrXpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="148158689"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 09:38:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 09:38:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 09:38:32 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.73)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 09:38:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MALbZdtftPVdgEYEyhDvrWh5GWUzytwlnjyo0/OI0xNxAOtQDiCSBpq5Xz2ONUBPlOIV8ROoMSXt7NJMK0qkxsAorBF5CKDWM8lC2o2jNnE1/OfH1l8SbumY2hanc3ylhxG82CkpgQIzufpIAhEuEsY/i7mwegoxzF1Eyb5nO9QMSIbaoHwI56UkvaiCI598MwdyfY6dHclcLT6vHX9NjidgMVfwrseEzhkmdtJzbTLvS69+UJhJBFCc2uegk4/+1o0csSQzha1z/kVr8/WhHB+00Smbl+GsDdz6Na9R4uDxacHtZ3ENbnmNVwVVgO62uhTkpPuGB4wwpwLftiCVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JePUY+WzVySoqR6jnVcvEno7IWDTeK3GpWVOpah9rKI=;
 b=lD4WV55hWKYEnDpkHhh1Tc6XOekTn2X6JG75NLTdCSJ6n1UTAgKbE9mO9+Vy9ZUnv3x1klvhipgrvMltHBUrOSDIY7Gdn1pvQMy8hQabynd01f4WUFwKowSrGXvUgnZ1V8PDciLajSBoJiJluGpdCLpskl/Orv0QhiaVwm1TnkvkbxUOfsmBvFqkq5T3pBc3jMFYJWkCrPhii1irHga4+MkJcoHpINO4LgSNDclJjLQmH7rRndQUcMbXC0NNqWJ1RzXugqdkP6vRJWOHy+liEVhxURNiBvtaSTHIYKTr+Utyn7gWcoggRakkApiXFrrtK2tiVUZiQ7JvUZBJ2lrnsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by IA4PR11MB9418.namprd11.prod.outlook.com (2603:10b6:208:56f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 11 Jun
 2025 16:38:25 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%4]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 16:38:25 +0000
Date: Wed, 11 Jun 2025 09:38:23 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_eu_stall: Close any open EU
 stall fd before opening a new one
Message-ID: <aEmw_1qC1mD0HJVA@intel.com>
References: <b5b8323fe6840bff949b8607480d57104b908a1f.1748994982.git.harish.chegondi@intel.com>
 <874iwvukr9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <874iwvukr9.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0089.namprd04.prod.outlook.com
 (2603:10b6:303:6b::34) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|IA4PR11MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: aa3409cf-a292-4b69-f74d-08dda90662e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2tyV2FwLytvbXAzSVZpbmhsWk5scmI4SjB2UkZvRjZlZjRxTzlRWWJJVDVt?=
 =?utf-8?B?bEZ2V1VlandIM0hhSmlIaTlTWnZHMDVnZ2MrRFUrVkRDM1hBUHJMR20zZmIr?=
 =?utf-8?B?MHBzZkxldUlCcFNWVU5hYjdDRWRUdDE1VUFSTmhzemhxOHF3ZUFPR00vc0Vh?=
 =?utf-8?B?b1kxWlpFQ1FNOHdLU2VXWko5aDY2bm1YdlZBeTFDZ0hITGFBVFhodVlyTWZI?=
 =?utf-8?B?YzVqVlVuQk8wRXA1M2JZYmtwdWdOUXdUZCtQeERiMWxTdGNMa1lWTi9RRVly?=
 =?utf-8?B?cDdUcWNsa1FJaTF3WWRCQ0h2YTFsZktEQ3JHTkg0ajU4SzRxZW9rdmJ4eitJ?=
 =?utf-8?B?eFk0azZoMDlYZFZLTHF0NzNSc1F3MTIyYzJ1bndySGpwcU8yMzZvbTdQZ3VR?=
 =?utf-8?B?ZUNsOEhpdkp5dlo3TGZPeDdFOUJ3bnByekVYN0J3TTNmN2pxaWJQZXU5RnB1?=
 =?utf-8?B?WUZ3SVBiZmdSQUNFQ3RiNk5IaHlHZndRUEx0cGh2WUhacW0vUEZxVTVyUWIx?=
 =?utf-8?B?SmFKcGZ3eGxXNzcvQW1qbjRLSE8vWTFMQnJEU2pqOHBETENKbWU2NTlHMFBY?=
 =?utf-8?B?S3NNZXZ1YVJFQXlSVVIwaDgrM2lBL3pPR2hoa0lJU0FBKyswWnlYSE1kYTBP?=
 =?utf-8?B?d091V0hQQmJKVjl2UnhDZVdERitQUkI5ZVdUZ0owMFh3ZWtHcGw2NnZ1K202?=
 =?utf-8?B?MXNidjZZazI3K2tNOHhqN2YvVnY5OHR1TmVDamkxTUcrRXFGNThZZjVIRmFG?=
 =?utf-8?B?S0FlSGxiM3h1Q0wyOHh2eksza29FUy9wOFk2ajltdjEyU3drUmx5K20yOU1t?=
 =?utf-8?B?czF4c3ZmS2hzS2t1Smk4WHdnYmxPNXdSaTF3SnZsd2cxREZ6RWZFNVhFQys0?=
 =?utf-8?B?bVUyamtnc0JsSi90YTdzVHd3S0FGWTlLSFE0Rml4L2VLWjRTaXRMR3JweE5k?=
 =?utf-8?B?czQzM3V3VmZidkxxMzBreGczSXBsNG03OENBNGtQWXcyNVdWQUdzZFpjbkFa?=
 =?utf-8?B?dUZ5Z2xpN1AzWmMxRlRXSzBKVlEvSis2MXZBV0FiQVVGbGhYN3IxdENseTZx?=
 =?utf-8?B?bGdPQ2VZajBobDZMc0xpamRxemV2Zm9VQXpVVUhOaDBIa1pVQlFrd1UxOVFO?=
 =?utf-8?B?SldKT2NVcnAyc1ZZNllKdSs4RGtPUDYvcld3NFNNNHNhMjZVMWtaYS9MWTlE?=
 =?utf-8?B?VmVhRC9Wa2xYZEtoYXl4Mm8yWW9WNm5RYm9lZDM3dVJnejZaN0FVTTBCL2dT?=
 =?utf-8?B?aU1PMEk1RERkY2RhRmdncXdBY1gwbWhWdkJyRm9tUUViTFRHcjlPN0JQN3NT?=
 =?utf-8?B?bFRkR0lzeEIvVktxSDYxM2pIb0pBalk2MXEva0ZJd1dFd0FPTkVqdHN0akNa?=
 =?utf-8?B?OFVQQlhDcFN6UWlpclhrZENKVjhROGFrdjRWOEFDaEIvYmR0a2tZNGxzWi8r?=
 =?utf-8?B?dDV4Sk4wam5BODBORnR4bDNXTWxNWVVmVjNQMlNhODY0VG1QNmVTaFI5Vmdx?=
 =?utf-8?B?VjRmL0IyeFZ6RHhXNkJINEpheVBuZjZTU05IVVBONnBNcUtUL0svcjAzaWVO?=
 =?utf-8?B?bGtQaWMvc2VvTHVSLy9Jb3hmcXN2Q1kyMjQyd096UlFMZHRIRGNiK1lhOUVU?=
 =?utf-8?B?RWhnS1NIaDAyQ1RFYmJJMWJMZzFMaGZuMWpQVVc5VUZNVkZ4dWNqcnJzaVN5?=
 =?utf-8?B?NFVXcGZpczJLNXUxL0ZvV3o3bVB2eENPUGZrdExOUnV5bEUvWmFVelZRcVVx?=
 =?utf-8?B?cjRLL1dZM3k4MWlHL2w0SWRib05SVFVoNlJtQkNPN0tLeUhKU1lrZ0pvK3FQ?=
 =?utf-8?B?NjVJTkdSVFVvZGU2ZHRObU9OS3RjTEdVTHF1V2pkckNRakQrT1I0ejFvS3lC?=
 =?utf-8?B?dUQ1OXpzOUN1YU1BZ0s4VmdzRGFsTFYxMVlOY25qUHpWN3grL0lYUU51aStM?=
 =?utf-8?Q?ZqOWflUyb3o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGlmM0RHSXpPSDFack1OU2oyTUR5Vk5NRnJMbTJDSk1QK2hFODlzN2FtOWFq?=
 =?utf-8?B?WGI2Y2IzVTRtWTRVRE9mTVhtd2xyVHpSUkFycGhic21ES1lCalhoQVowUW94?=
 =?utf-8?B?Z0xvVk5sQzhhZTl1bk5oYVZiV3c3NEsxRmFNaVFVVDYrMkV3U1ZReVlCMURs?=
 =?utf-8?B?cGt5VnQzc1FnakZSVzY4R2NPOHhOTXZRNHR6a0xEN2FxMTQ3OExtR25UVjdZ?=
 =?utf-8?B?YmJlRW9UOEFWb1NwcStnL29lL0pzWGs4L0wzNnd3c0dvbk16aEt2TlorcTla?=
 =?utf-8?B?Z1JUTkpSYXZ2QmdIelg4Wi85aXB5RElXTUducmlMTkIrcjIxemhQUm9qWHRw?=
 =?utf-8?B?MnMrUnA1SEVZUS8xSTdHbk16MkxqZFJrQ29IZHdEOTlsWSs2NWdJeisraHBB?=
 =?utf-8?B?L2hMQVVJMnJZWVRpUnBpbFpCRGliTEIwaXNFdWFNYk9SekY4MThHWDUwUjdL?=
 =?utf-8?B?MVR6MFI4MS9zVGNuUktFdzNtRGg4VHgvQ0FJWDJ2Y21Tb09EUHhmTmNyNkJG?=
 =?utf-8?B?UWxLNkZuV2owa2tUWTNiUW90TFhXRkdVVjQxblNuRHJ4N2VNS0FicnlqK01D?=
 =?utf-8?B?MzJOYW01Zit4K05JNU1RTGQwazJ6ZkpmbXY3OGNLTjU2MlFIVlRKRExNWEQx?=
 =?utf-8?B?WnJHOTFhSU5aNnMwaktyY040UXU5UTVFVCtUUUo2WjFjcHdtYmFOSXhCc0ZG?=
 =?utf-8?B?bnB1dmxmRzZsbzRPRTFEV2lpRkJhRnVFK1JFKzkyaWdHNjV5QXB0bndPbHRC?=
 =?utf-8?B?V283bm1LUVZjV1BFaWpFSTJtNFc1Z0N3andSd01SdTRkUTJkQmNWa01jaW83?=
 =?utf-8?B?VFpBVUgrQk9pbnFaeFo3K1I3UkRhbHM3RGp4cmpRa3BVaTV5aDZwUWtzSFc4?=
 =?utf-8?B?TitxeTJoMk5Ud3Vucm45QnJtNXVwbFNDQS9WWjBEM2hmWHVNNmk1YW1yemU5?=
 =?utf-8?B?RjQwTGpwblJyaG9rM3JyRjBJUUdjQmFRN3lweVNpVVlLaXNDeWRlQjFBU3dU?=
 =?utf-8?B?ZDkrZWNENGJEekFHa2s4L0NSTm56Z1o1Sk1mQTBpY0F3R0NicVFxajJiK2pZ?=
 =?utf-8?B?MVdYVEZrck0rSldLWFN2NjlsS2NkRFRjb2VoRDVNd1RzcHlEN2Rjc2t3VUp3?=
 =?utf-8?B?L3dqTzRNdE9nV1lPOVYxL0QwbERlSWx3VUlpNUM4NU91Ly9qY2dwcTNidFox?=
 =?utf-8?B?TUUzbldNaUJ6Zml5YXdyeXkvY3dMUjZNOTlZc3NuYzllajFPVHArRzRKdTg5?=
 =?utf-8?B?TGVIL3cwSmordE5GaGp1NjhBUGlHSkJ6VUVLKzU3L09BZDVjSjBJNEtWMnBD?=
 =?utf-8?B?THlHa1JZcFB5bUxRQjg3SHNlU1dyVXhvdmFPQU9GcGgwek5EVFBCcDJBc1lm?=
 =?utf-8?B?TGNHcGdublJCdWxkcmNrSml4czNieldJRm4wTWFJVWpWdmNaT2NUbGxJTlE2?=
 =?utf-8?B?d2JQTEJYZHVDYTQwdkZhWlM0NzJ0ZnZjVm15a0FRMlBGdTY4d2hlMlREbTVC?=
 =?utf-8?B?aDVXb0FDbUJpV1ZxYXZYT05sMUNvbjJXd2h3Yll0TVc1TjIyc0hFQWFVc3ZB?=
 =?utf-8?B?YXRxRG5wWklnaEhwZTN4YkFQTDJheU42R3ZUVTNxTUxYVXZlTzBLd01EOXVt?=
 =?utf-8?B?d1hsNDVLSjV1YmZSdWdkd2FnMDRXd0VqczhwaFhuUG1aeEY1Ump4NGowdkQ4?=
 =?utf-8?B?Qzdpa0lBQ2Z4Mnk5clV6UEt4bEhnejJKdUJLb0ZiTEwvbHZDTm5vSnFQSmZo?=
 =?utf-8?B?USt4UmovNjlKbGlLWkVqaGk4NWpYTVlSRDV3ck9pODVtcVljdjFwRjE3eTJl?=
 =?utf-8?B?cktReDFGaEl1aWxiZjdaR3Q4QXBidWdWSS9uNmtVNjA2NG0zU1JTS0pxbWpH?=
 =?utf-8?B?SzhvWDMvYUVwY2h5YmFyOHN6OEpCQ3dxeTREaDk2M3VEYWhJR01KeGt1d1FV?=
 =?utf-8?B?WkgzSmVKeW9zZGZLWWJQcGFGT0h1bkU4ZTlLS1B3YS90L0NWZmJYR0Q0RzMw?=
 =?utf-8?B?THBkQjNHTnNCZ1krRWpFNFZMYlJoeWFyTCtkd3ZpdjRjS3Fxb3BlOHBaVGY3?=
 =?utf-8?B?ZVZmOFNBL2pTaUo4RWtFRFBNYmhxQ1E2di95OVNmcTR6TXgvcmM3Zkl1Um9W?=
 =?utf-8?B?ZWxtUXBjSWE3MDdMbVRHQ1NYZ1JFYlBVZncwdjBWaUdocGQxTm53RUxGS0dH?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3409cf-a292-4b69-f74d-08dda90662e1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 16:38:25.1383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSPF7I+GE3DjX+jWkaOZMtI4l9tbQKVapJartuE6G0l7kWkaA1uCA+1wE4eJTeY293i1rgzii1kGeL601tl0L824hLK/6gUFhPHYM364K7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9418
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

On Wed, Jun 04, 2025 at 04:53:14PM -0700, Dixit, Ashutosh wrote:
> On Tue, 03 Jun 2025 16:57:34 -0700, Harish Chegondi wrote:
> >
> > asserts in a sub-test can prevent closing an EU stall fd and the next
> > subtest may fail with EBUSY if it tries to open another EU stall fd
> > as there can only be one EU stall stream open at a time. Any open fds
> > are automatically closed at the end of a test (last sub-test).
> >
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> 
> So -EBUSY errors are gone with this patch, correct? So this is:
Yes, -EBUSY errors will be gone with this patch.
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
Thank You
Harish.
> > ---
> >  tests/intel/xe_eu_stall.c | 34 ++++++++++++++++++++++++++--------
> >  1 file changed, 26 insertions(+), 8 deletions(-)
> >
> > diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> > index 411c30871..1499ec4b4 100644
> > --- a/tests/intel/xe_eu_stall.c
> > +++ b/tests/intel/xe_eu_stall.c
> > @@ -69,6 +69,7 @@ static uint8_t p_gt_id;
> >  static uint32_t p_rate;
> >  static uint32_t p_user = DEFAULT_USER_BUF_SIZE;
> >  static uint32_t p_num_reports = DEFAULT_NUM_REPORTS;
> > +static int stream_fd = -1;
> >
> >  static volatile bool child_is_running = true;
> >
> > @@ -302,6 +303,25 @@ static void set_fd_flags(int fd, int flags)
> >	igt_assert_eq(0, fcntl(fd, F_SETFL, old | flags));
> >  }
> >
> > +static void eu_stall_close(int fd)
> > +{
> > +	close(fd);
> > +	stream_fd = -1;
> > +}
> > +
> > +static int eu_stall_open(int drm_fd, struct xe_eu_stall_open_prop *props)
> > +{
> > +	int ret;
> > +
> > +	if (stream_fd >= 0)
> > +		eu_stall_close(stream_fd);
> > +
> > +	ret = xe_eu_stall_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, props);
> > +	igt_require_fd(ret);
> > +
> > +	return ret;
> > +}
> > +
> >  /*
> >   * Verify that tests with invalid arguments fail.
> >   */
> > @@ -353,7 +373,7 @@ static inline void disable_paranoid(void)
> >   */
> >  static void test_non_privileged_access(int drm_fd)
> >  {
> > -	int paranoid, stream_fd;
> > +	int paranoid;
> >
> >	paranoid = read_u64_file(OBSERVATION_PARANOID);
> >
> > @@ -395,9 +415,8 @@ static void test_non_privileged_access(int drm_fd)
> >
> >		igt_drop_root();
> >
> > -		stream_fd = xe_eu_stall_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props);
> > -		igt_require_fd(stream_fd);
> > -		close(stream_fd);
> > +		stream_fd = eu_stall_open(drm_fd, &props);
> > +		eu_stall_close(stream_fd);
> >	}
> >
> >	igt_waitchildren();
> > @@ -472,7 +491,7 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int ite
> >	uint32_t num_samples, num_drops;
> >	struct igt_helper_process work_load = {};
> >	struct sigaction sa = { 0 };
> > -	int ret, flags, stream_fd;
> > +	int ret, flags;
> >	uint64_t total_size;
> >	uint8_t *buf;
> >
> > @@ -518,8 +537,7 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int ite
> >		properties[3] = query_eu_stall_data->sampling_rates[0];
> >	igt_info("Sampling Rate: %lu\n", properties[3]);
> >
> > -	stream_fd = xe_eu_stall_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props);
> > -	igt_require_fd(stream_fd);
> > +	stream_fd = eu_stall_open(drm_fd, &props);
> >
> >	if (!blocking_read)
> >		flags = O_CLOEXEC | O_NONBLOCK;
> > @@ -592,7 +610,7 @@ enable:
> >	if (--iter)
> >		goto enable;
> >
> > -	close(stream_fd);
> > +	eu_stall_close(stream_fd);
> >	free(buf);
> >  }
> >
> > --
> > 2.48.1
> >
