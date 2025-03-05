Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF63C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 16:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5311C10E7FB;
	Wed,  5 Mar 2025 16:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KIi9B4jR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A000C10E7FB
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741191478; x=1772727478;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CDH50S0C78oJUlR3ZSRC9qheRTyKHCZgxApj64OB6u0=;
 b=KIi9B4jRi2hvI9cXrYp79eaQq1Vs7LaaWIOT7OgGg55FK2yYj429VtJY
 9EP/Ocxgp5CiauZ0NPvT6D8UG61RiKVipSxp3KIsyTwoB1NcuavNZ3n+L
 bugFn2ywc4L6plKsPCVH+QXlT3JVBug8aqfq1Q6UI2QG152h2y4cOOHWV
 ojcNQBa7atKmLdIFaRPoHUlcASRYTnX+vJ8JAodzyVDrp2sUjgU1fgs9x
 fNr3uAscdDhLmr7BZnL9G/fDzadCbw3at9q/tiI7z9B2PB9ge3etdUIQA
 X6ojM5QrotnqFfOHy22+uYHB6zxsNfL7uJL8kMSnZhRRk6C8T5abgsx1T w==;
X-CSE-ConnectionGUID: wHOlOnIgSoOvD44np5Sh6A==
X-CSE-MsgGUID: WExDPTKJRbWJZSFEg5qFTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42408205"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="42408205"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 08:17:54 -0800
X-CSE-ConnectionGUID: 1ruGOTD8S/m1cPlf2a3NlA==
X-CSE-MsgGUID: MhTq/Hv3S2uvPVA11+1mhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="123767393"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 08:17:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 08:17:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 08:17:53 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 08:17:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BuOF6QF2vcdZ/cgTL5N4NaAm2mp0cfTDlG7d+8wTUk7lfvHpzcslD9cFQvTIECW8mkGsuLCgnN2C2Fgh7t9eap2hbkq/23bIMeKdUwBXJLgsdZ83bN5tfXKZNAD8Nwf9rTod6qMOex+jO1EJSFrPFdQmfnYs8byIv3fK6qOT9NxYGad+Wn+LV43jHeR9vV6WAOsksx60xmEpSKLS9liALY+V7Io2WVAiFGROkh/vz99rXwEESB/iULPq2M/Zto/KaGNDMpdCYM78A+9q9r/ktuTNtkdxsS1OD90gSbe1uNLp8Gi2twnsLvopHZor2TJi4s2kOjVBS221eIyCepW2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bODVXZP0wXH4v6KgsRosW88zgsWYYFM73iHbxHOTRIQ=;
 b=Vn2u0/XeR0KyYaDZf9D7j9gZ+UFeI69+9F0dDRpjiQkBBmuqpBFuyD1fo65Z8SGmqan73AiaL7+MvnZ5Lhu2ovHvEYEKhAVu3CKm/JHkzR6snUI2+6ZH50UVDDF5fFh+FyezrAFf9sgNAWpAAmR5SmRjZLsvnROtY26K8/PWmuRUArUHP9897pDR2TAeygxlIE/BZI4crQYwbbhOEvV1omJngSo11lNLFbgbOB3XAjJ36OFUBbcqVAInwk+5mh0DE8HLpIXE/JlCT62x4/ftXuX0H6aRyqe4FO0P9BBr+ktEVbbLudfNy9e+fxCYre4GcR3ypB2EetmEIRPCaYtJAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 16:17:45 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 16:17:45 +0000
Date: Wed, 5 Mar 2025 08:17:44 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 Modify some OA tests for simulation
Message-ID: <Z8h5KLTVwcdNOCDt@orsosgc001>
References: <20250305005716.168646-1-umesh.nerlige.ramappa@intel.com>
 <174114499145.894611.1646138855541068809@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174114499145.894611.1646138855541068809@b555e5b46a47>
X-ClientProxiedBy: MW4PR04CA0142.namprd04.prod.outlook.com
 (2603:10b6:303:84::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CO1PR11MB4818:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4ab5ab-31ed-4429-0605-08dd5c014394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0lYOGc0OVIxNThHRndjVHQ0bHlKQ1hMaEg3NmN5NTk1NWgyQTVXL3ZCY05K?=
 =?utf-8?B?cUpOMzZXeVZCM2hjMzJOaGFZZmZTcjZYQ3Nha1cyY29xL2c4NWpYNzFDT1A5?=
 =?utf-8?B?M0lRM3FMcGpDd1FPUzI4cEl0Mzg1TjZicjg5UWpIeUMzcVJUQ0ZoZkRHSDhj?=
 =?utf-8?B?eHFmSlY0RzdKYU9NMmxzaWY4eXBneDJTeldaalVINi9xNTA2Z2w5bjJCNFFo?=
 =?utf-8?B?WWhtS1kyWkVhUk9mN1Zhd0VJMEJLWlJoR2RUZjFwdTNvME0xVzZXNVU2Ulha?=
 =?utf-8?B?a1k3R1VpOW43dmlpOGZwVFVRcnd2QzAvSFRGUVhhbXcrRDhVdjhvbzUzRVls?=
 =?utf-8?B?YktUWG9rTXBkYytuTzdVbko5THFSZlRLZ1JLQlY2T1BsaXFycDhERXd0a2E4?=
 =?utf-8?B?cUIzZzdBTG1jdFpSTmlpYjBNcmZUL1hYSlFWeXlnN0ZpYTVtSVVpeEI4K0pr?=
 =?utf-8?B?NjNuODVXVEJ6OE5qeEI3aTNQV3pBY2lFeDF2OGY4dWw0MC92MU5xb2FpZEJz?=
 =?utf-8?B?cWYvSy92YTByNWNVVUxnL2JGbHNTSnBMeEd4Z25DT2FmdjV4YlpwbUNSY0VN?=
 =?utf-8?B?dU14QmxFNkRZdXRDVzA3cUhsZjRsSHZTS1BFeEpmQ29sUEYyZlZHSmhsZ0tG?=
 =?utf-8?B?TGhEbDBKaUNZTU9qNzRxQlhmMEMwOHI5RC9pdm4vYmU2cGN6MlpTVFVhMXRj?=
 =?utf-8?B?L3prWGpXdzZUaHg4dGQrM0IxTVljUjdJUTIyaHNnZTYxR2M3a0wvNUFaNGU3?=
 =?utf-8?B?QjIyc09RTisrU0JOR3FQSHpvUVhNZ0hiUDBLejFwUEZaSmZnMFdOckUrbW5N?=
 =?utf-8?B?U0ZDTXhtTWNRcExIS2lJMEU1OXRwZTRzT3p0ajlSSXFlb2hLcFlDM0N1VFBH?=
 =?utf-8?B?bWoySnFFUllNdUlsa1NldFZBTHJGTUJNcCtsa0dwQUw0ZVF2L3lQN2psMHI3?=
 =?utf-8?B?NXo5Tk1wdG9hZVZxSWR6eUpTQ3A2TW4vRk5QT29veFUzSjhxOTZScGxZTm9X?=
 =?utf-8?B?bGZOYUpzemhha0ZocUUrTWg0d2xqSkU1RVQ2Q3NWNjBNd0g4VzZrZFNsWHFR?=
 =?utf-8?B?S1NvbmhqcWRkdS9pcEJZdGVoUlo4SUVreHBzQUNablJ2ZkdpU0hibG1JY0VB?=
 =?utf-8?B?dnRrTzg1c1RKRkRRM2JhUkk2ZmdqYkxURlBMdjBudjZCMlVyeE0rU0laZkpP?=
 =?utf-8?B?MjR2cU5ZbVEyQzNtQWVjcGM0RytqUXNBWnpMemg1T0FDMUpQRWJDQ2FadHJP?=
 =?utf-8?B?bzNjNEFWdktUdytSaENYNTVHa2FmUjY2QU5HZUUyeld2K0dRU1kzUVc2M2xB?=
 =?utf-8?B?dmVoTHJsVE0rQmlpaC9FaVJGUXZDNVNmZ1Q2MThHbmhkMUU3WWFFRzZEdHVL?=
 =?utf-8?B?bkJLWWJnOC82UkNyRjhkY1RKS3FpczhYa0E5YlA1d1NHZnZuQ09wb2dNZTZD?=
 =?utf-8?B?djNPY05ic0dQbWY1a2lXcHc4UjMzSzVLdkdQMkUwK2h2WUxyK0taMWY0cWZp?=
 =?utf-8?B?a3l2QWZBS2EvWitGcHkyY0ZwYUlFaXEwTStmMEgxVnBtRkl4djJDQjl3VnE3?=
 =?utf-8?B?a291UFhBQks2ZWFoR3BGbzhacTkzcnRiNFo2WlRnK3ZaZVlBOVBUSHhpcG0w?=
 =?utf-8?B?UTlpOVVoQ1RVZ3RORGFuYzNQOFJmWGFZOXpoTnlYZytzck1Ob0FRSVV1RVdP?=
 =?utf-8?B?TGEzT0FxWWZWWjlwZ3lIMzBaUDJ1V0FRTnZhU25TSlhTK0JHeStYZFl0VzJG?=
 =?utf-8?B?My9sbi8xTjVBaHZmQytGSkVQQTkrTjY1QTRNWVp1OUxQUEM5WkdZa0U4THo2?=
 =?utf-8?B?UjZBVk5EOFBYNlFvSG9jUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajVkUTJreGZOckc0VWdLYW9XZnhjR3ZiZDhaTUhLWjZSQnlHTm40U1ZQWTFJ?=
 =?utf-8?B?cXM0RzFPY0J5T202SWhtNTZybGJKK2tmNTVEWllsakcwY3lKSU1KK3RscThv?=
 =?utf-8?B?YTh3bkNMb1Z0VG9BN3hhaU0rRzVvZk5Da01jOUpDTU9qd2ZnUVJxaVNoNHZz?=
 =?utf-8?B?Uk9KOGtwdW0zUmJZS093VXBicmgvenI4WDZpWTFKUi9yWjQrM0RwYytnemZG?=
 =?utf-8?B?WlNOQXdkTXVNMnFickJiQlc5TkREV25BbG1SNFFSdzV1MXZPa2VhMXFtdk0y?=
 =?utf-8?B?c1Mrb3hwZW9KclpUUGpHS25SVWtpeEVORTh2bW8zQUhva0UydXdtMHp2Mkd3?=
 =?utf-8?B?ZVc0ejVCanpDMEtYcXJXTHI0d25qN011Q1U3cFhqc29CMFdZOUpJbUQxdThR?=
 =?utf-8?B?bTdvVjZtZ0JBL21zMCsxV3FKVzJ1MEpqUUNJcEJTTzJTbU9zdExoS24zZGpT?=
 =?utf-8?B?NE9EcTA4Yys4b1hQb3R4RUE0R1lMVnhyUkJvTnlTU3gxM3VpeXQ4WTBhQlBV?=
 =?utf-8?B?VWphd3hNbTNBNHBKMEE4QjUwU3FTbEdrWjN5ZE5IYWxVRGRDN2ZZTHFpWmRN?=
 =?utf-8?B?a1k2UTRnbEVMczNqZFBzdDVTK3RENGRBRUxBdG54eUFrMFVOOGpKeERWVjF0?=
 =?utf-8?B?WThzb2RRa0dzRmgwVkNubnBjeGU1T0JBUC9QOFA2UUlnMHVEb2h1NnNVYk80?=
 =?utf-8?B?ZDBvRktQaUNpL3JGT05WN3pRdjlpeE9pbVVFRDRlWWFXNkFhVXIwVldkdFdD?=
 =?utf-8?B?bUlkakpKN3NLMS8wYjVtZEY1SG10YXlBUDYvWWN2OGJVUjdzWFZLU0Z6d1hk?=
 =?utf-8?B?ZFhQNlRRcXBTSlFzOGVRRTFFUEVKWXlzVkNVcFRyQzkwQWIrSGlqL3dVaFcv?=
 =?utf-8?B?cWpEMEYvUmFOazhPZHNZQldTUGRYTS9CNEJycDhrdE00MHE3aXZoTUN1N1pn?=
 =?utf-8?B?dkZKSTVyWVlkWUJqTm1FblNkZExLN2YxbmJlclNHMUp5c2JrYmNvQTVrVVJu?=
 =?utf-8?B?T2FtUU13bEJoUjJSS3orbmhOYW1ySHFDOU5CMGJ6bEhpdDI0OUxlZEp1d1Q4?=
 =?utf-8?B?TmhFRUxEQkZqMGZ1OHBoSlJ3WDVsVFFzRG11UGs1TGhjb0U2U2hsdFhGMUUv?=
 =?utf-8?B?djR6MEYxTGZhZ1NPc2EvT3Y5c1BodkRPSGJBSXF0UlJWKzNTMWpnV3NCdkxE?=
 =?utf-8?B?Z2o5NHN1cE1tRnVDbkZFcE9udHNQUThQQ3J5YkhiNWxvR1VLalg2emVHcFFa?=
 =?utf-8?B?bTR3VHdnYTl6UHFJRTJ4enJTb2Fuc3NQWEoveFBtZTgvV2Nrc1JkUHJyNDI0?=
 =?utf-8?B?K29OT3BicXFIY1pwaDVqZTJ2aFB2a0FGcmN2WDRnblhGMzI3Z2ozRlB2WDd0?=
 =?utf-8?B?eFB0SmI4ZTVNbmR6dWFpWFUvZWs0RnpnMkZIRnRNZGR6ZTRidkd0RHorOGxS?=
 =?utf-8?B?WE1NbG1JNmNpQmkwQVNycVJNcG9aMU1CaUpYMlU2RTZEMnV4YWZ1UEQ2eDlI?=
 =?utf-8?B?SDVWNkY3Rm0vbVlBNm9xbWF1OWhSRVJZM2pNLzRKeFo5UllybnJ5bTBQbUZT?=
 =?utf-8?B?WE1pNGIxOFFMdEloZHdITytjWVRaMHFLbWRvMnhmWHRVRXZDdXl4eGZpRU1u?=
 =?utf-8?B?djV0WFFTZEVqdkFlc3ZlOGFQeDZ0dDZ2emJ6ZlJscDB0N2JoRm55Q3lveGxn?=
 =?utf-8?B?V1VVOGFaK1JTQTUyN210TkJQWHRZTktITTlUVmU1c2xnQU5OdlNRblpDN3dK?=
 =?utf-8?B?QjMxaVRsZklocktIZVZIcFN0T05SajNBQ2MvUm5CM0RIU1pxcTNPUmtYYTN2?=
 =?utf-8?B?ck44M2JYdkFxNVVHNEhWWG1LQmZUdGxCNFMvdmNES1E2QjVFZWI5RmJOejBX?=
 =?utf-8?B?aG43OHAzck9UOUxEbC9sbTdPTWhvTGprU0xFK2Rzc04rdWJpdm16N0s5Wjk4?=
 =?utf-8?B?ZVNvZ3p6NmxrSjJXQldaWUxBd1hkd1RaMStMckhyemEraE9Ya3lIUytPZFk1?=
 =?utf-8?B?RlNFdmpCcm1DWlZUdTQxVDRQTDViUlpHcHowM0NQQnRCZ3pNbVJ5UjZLelJE?=
 =?utf-8?B?Wm9VQVFOSENyL01RUmNjYkF5L2taaEowQ1JDdHptajB2TjFNNVduWGRqaWh5?=
 =?utf-8?B?cVd6UUh3SmRzbXZnNVZ0RlV5RWQ3a210eTNYMVVVUHRCZW53cktDOUo1WXlT?=
 =?utf-8?Q?JCtqJtTFbChmSCe17qSge/U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4ab5ab-31ed-4429-0605-08dd5c014394
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 16:17:45.6426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UXZP60lmjEVUdABc88Q7VXblQyR5kAVrOEca35iSmeGtxQ0gXildFG5DIxcXyeWnHDahH6qCIMUTMplJo3WoLZ/NCB9q5Y4ka1diGmfNg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
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

On Wed, Mar 05, 2025 at 03:23:11AM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  Modify some OA tests for simulation
>   URL:     [1]https://patchwork.freedesktop.org/series/145805/
>   State:   failure
>   Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12701/index.html
>
>         CI Bug Log - changes from XEIGT_8260_BAT -> XEIGTPW_12701_BAT
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with XEIGTPW_12701_BAT absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12701_BAT, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (8 -> 8)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   XEIGTPW_12701_BAT:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@xe_intel_bb@intel-bb-blit-x:
>
>          * bat-adlp-vf: [3]PASS -> [4]ABORT

Unrelated to this series

Thanks,
Umesh

>
>Build changes
>
>     * IGT: IGT_8260 -> IGTPW_12701
>
>   IGTPW_12701: 12701
>   IGT_8260: 8260
>   xe-2754-ff2d693d88726e29a1d87291105135c31c21fa26:
>   ff2d693d88726e29a1d87291105135c31c21fa26
>
>References
>
>   Visible links
>   1. https://patchwork.freedesktop.org/series/145805/
>   2. https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12701/index.html
>   3. https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8260/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html
>   4. https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12701/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html
