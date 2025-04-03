Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934F8C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 08:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEB310E10F;
	Thu,  3 Apr 2025 08:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eHeTAAfI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC5D10E1A8
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 08:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743668054; x=1775204054;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=H6ud7JGg6Xv/exytSwK0yRzT3JgWfkjqs7E7BImpZRs=;
 b=eHeTAAfIJlk4LZ1uhzdlLvtBLIKbxy9TAytD6mv020+qhW3GRbATBAiw
 ZHXrhgOLsqvn1a16k1IU7hZoCHy4Chr4SqcBo3If87GFbS/ZpkR0pzzal
 uXDjx1Uygcml0jB1cIjZRSULoq4E6IxXiRHheTYAVcHFQ1yQsA7I9LhhK
 ACAX/V0axM7Nr9b/enME4EEplVGz87GNKcdKNhFVBk9OhI+WmARLUXG53
 D/rIdsLRJI0XbuhwvWRetGGSlrkQJnVtBRe+QC4qaXWDDDaXKFz2wQZ53
 tnYuXSzz/UzY+V3mq6CVJWmvVp+eq6lyNJUFUg8geoKERY5epVZkh2PPM Q==;
X-CSE-ConnectionGUID: nFv4VF76Qo+AdvAdLzKFaw==
X-CSE-MsgGUID: zJHPE9h2R3mADECx+V+Suw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="67530101"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="67530101"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 01:14:12 -0700
X-CSE-ConnectionGUID: FROmNCcqTJ66C5PB8KPfiQ==
X-CSE-MsgGUID: 9nznoarMRAamOwHuoU7KTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126930162"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 01:14:11 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 3 Apr 2025 01:14:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 3 Apr 2025 01:14:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 01:14:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9rA5uwcnVAAIoZ4DqsbSNRLSI9QpqAJS/SkPyroGSFxaNeYPMNVqeoDfiU0FRjycMdDcQtwOdmOD8fVi9814PTZDxIVhuWi281vxhHsgx5oWTUl3ewnfqIgvbBsY0vovx7AxlzycvqOqCpztcl6D0sBV8xU4JS5BqKNLrG9h97h5B1jxd6vP+a+IL7zSGI0JdyhBYryiWyCbKy3N5jFo2FWxcAXQ1W3wAe++khD8R+FSb+QXEMSHCrZTgH2EFD1iH6tEnz5zhm4MkM1VgbRJqbq8WtxZRJNMe3TtRjdFHURSwrl25zfkHJtU9lKn0gPvLWK2BQd5AjMeQYEW7YP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMxa1BbvyfCazwJRCKUKfEiSYy3lu8tWhKQPXfY0k0k=;
 b=XX2EE5ILGvvV95YrLqKkb5nRhLOPEq+D73k3h2VSQEDW36T9U2t205cjTO7ffz/azhiFbeQfFbQ4vLArZS/GIq4LNRRzxT+j1Q6gH1lXPD1sxAz89feIcFmCDPf0erT/q49yq6EUWiOAEJ6TTRmu3OEFc6aISDluGmJ4b7Y2Ca/8f+C0DTOnc0GmvBD98dDreshZNHw7K7aoX3CDb6JI8Xgj9mCkZf/W+6Plg2cCcWxkR+NJBOPozbQefsGhwBndeGc5i98reiR3AMQVfDVUs7Y8iyrwR8eP+6OrMliGtYQvXhjeHLjtZfzsHFtPX5H/ROLt+cRZYLEU3FB2DdgvBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB5770.namprd11.prod.outlook.com (2603:10b6:a03:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 08:14:04 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 08:14:03 +0000
Date: Thu, 3 Apr 2025 10:13:55 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t v4 3/3] tests/intel/xe_fault_injection: Do not
 assert for probe_guc_fail_* functions.
Message-ID: <Z-5DODJTZjV6b2vr@fdugast-desk>
References: <20250328111532.16620-1-satyanarayana.k.v.p@intel.com>
 <20250328111532.16620-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328111532.16620-4-satyanarayana.k.v.p@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA2P291CA0026.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::22) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5883ba-8d5f-46ad-489f-08dd72877f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzErMm0rdVBPS0xFdXFVL3RHNHhnZDg4alZVL1VHUzVPQU9BMlJsajFQSTZN?=
 =?utf-8?B?eE5xNkx4cTFNQjd2Z0dvUWFtandMcHAxWjdZYStkQUZGdWEyMittY0FsL2x5?=
 =?utf-8?B?cUdKVkgwYndiM0FEcEhzYjlkaFlZZFJNV042TlZSc0ZINEtscDM0emZDVFIz?=
 =?utf-8?B?cjhHUEFtSXNGOXJ6R05vU3NxTEphZjdBRklLa29sUFJ4NTRQdytPbmdyMjV3?=
 =?utf-8?B?Qk5hRmIzUVB1MWVXRHRsaTB2T2RTWXFkL3hmK3FzS09QUHBPV1FLR2x5ZkU3?=
 =?utf-8?B?V1A0aEVQdlRCVDU1eWtMN3czNkdESFBiOXp5eGpqRjF0SjN2TjZSd1E0aGUx?=
 =?utf-8?B?YVg2bEF6Z0dsT0VqWHFUR1RXREJQa1Y4a3NrSjdIZXlkVCtNNE5EYzJsUURY?=
 =?utf-8?B?QkFldTdva1Fhdk9hTWtXeFk0bC9LSytJU0dVZHRvbm1UK1ZzM3FCNkppTS9j?=
 =?utf-8?B?TnVsSGVBVEY1c01NeEpWc3gzUXZLMnRtVHg4YnEvMnpsajlDSjV1QWk2THEr?=
 =?utf-8?B?ckJEN01oRkk4WEV5dytSRDhNWER4RzdkUjBBZEZ5SWNhZldRYVVjcGdSaS8x?=
 =?utf-8?B?S0FpY1ZPNTI3TTZ5dHdyMTUvMStueTVJTStTUTlwelZvdlhoNS91ZmNkWHNj?=
 =?utf-8?B?MFViVnZoUk5kZCs1c1hMbFhoVzNkYzBaNXRXejM5WEVhZEhwTWtsazRkTGN4?=
 =?utf-8?B?SDZKbFdUUlNNditadzZ3WVBseTZGTE96bVB3THZmUFhyeTJyMmI1akdUWjJv?=
 =?utf-8?B?SG9CZDc4NHpTMXhCN1VKT2ZXZlp2bFZYcjJhZ1VEZ014ak51RnVDcTRsSlY1?=
 =?utf-8?B?dkNBUUxDNFVKZFNrbU5STjlpemQ5bXdPUG1NZURGSEkzVk9kSzIwY3RoN2FT?=
 =?utf-8?B?TUxSM2hOM2R3WW1sN0lkUVNiUHByZGRFaGxERW9PQW5RNHBIMURnbnRjYlZZ?=
 =?utf-8?B?OHNZWEhueEUvOEdSRWhUTU1xZGxrUnJ3ZWxPRG8wV0lPVUppUk5oa3MzcFpt?=
 =?utf-8?B?QlZ0QUtRUFFrQlZHUW4zTGNrd1ZRUW5EZUZhU2sveE5NZ3FLcThhc0FCT2JD?=
 =?utf-8?B?Zm9qQ2VEUkt5TnZpcGd2TDJyeVNZR0N5bkVNSkx0Z3h1MWNaSURwNG5pcFFw?=
 =?utf-8?B?d0Q4SzFTRnQrV3lIY3hjK1R4WEFoRC9UTm4zbHFoc0srSzltNWlhMFZvV3lw?=
 =?utf-8?B?UExheVZLRGFIeTNvYzE2NStUcU9TY3B2bDBFd2tPZXh5bm04Rk0rVVhkaGgv?=
 =?utf-8?B?a2VtKzNpVkhRMysrYndsbkpmWE1SN3poYis4V05pbjVKVVhFdUVNeDNWa1Qw?=
 =?utf-8?B?TGhBUDJ5ZWJLZ2doSFdtL1NGbFdtaWdueTRjakV2eDMrbUJXRnBGNC9DUVB3?=
 =?utf-8?B?WVBKaVgzU2tOelZLczFkY2ZqZTJXZEJLZWJYM25TYWt3WEJudkk2cnBhNFpp?=
 =?utf-8?B?YktYcjR1bVNQQW1LQm5nSHJrdERpeUpRNXlRSnVON24wR1dqRllJVmVrVHpj?=
 =?utf-8?B?QndqRmM5M3hYNURveXF4TzJMQ2JPaHJ4bjlROTVYOFB0b0tFZjdtUkZPcmFS?=
 =?utf-8?B?S0Q4MjUvaDVCYnJVOGRXRFo4MjZ4bUlwVTZXU3ZNUHI3azlyMEkwRlo5Y3lq?=
 =?utf-8?B?dXk0dnUvZVl4Vm9KajhRSzFTR0dKd1MrUURWV29CYllBeC9DaWtzS3pqdlk0?=
 =?utf-8?B?OVhyZGxhczN5b09vajV2Y3hSVmNFWWVGaHM4a0RHS3RGMjJPbVVMS2hVVFJu?=
 =?utf-8?B?UFQ5MnZOVHVnTkdFdGxqejkvUzM1UVBBL3A4Zm1ka21yV3dwM093Z0Y0ZHVJ?=
 =?utf-8?B?S1dWUU5ncmYvelVXd3M2aVpkdE1zelkvaXg1TmU4WEFUV3pYaHJaU0QyVGVD?=
 =?utf-8?Q?YJjIWNfyU89py?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXYrR3ozUXFlQmJZcHpERlFBY1VMNWhjVEs0dG01cUNJQTFmVXB3NU85RHlK?=
 =?utf-8?B?TWM2d2o5ejgyaVFOTkZqNCtNYXJIYnFaR2RYODQzcHBVZjdUUFNXclliSVF0?=
 =?utf-8?B?cXQxdTNmb0ppNUs5eXhwT2VhZXd5WlJ2cEVlMHJCNUpjWGpvajY1QXRReC83?=
 =?utf-8?B?OW40aWJCcHJSdTZRck9tdEUzLzA0MExWMUZjSU5LTVJVMXVjL2tyZ0xEeDFN?=
 =?utf-8?B?MEEvdDI4MFhNZEYvQzRlZjZ0Q3hGR0RDNVk3RSs0NEVtRTFlWEZuc00yOHBO?=
 =?utf-8?B?YzEyb1JQUUc0MzVhN3c4Vi9wUElieXhaN3NMMzZXVGtVUlJtZWdEQjh5RHpW?=
 =?utf-8?B?SG9vOFVacmFjdGFWRlhScllyNnZHd2ZWTVR5cGdsdDREMXlIRGxKeStCSGV4?=
 =?utf-8?B?dUVwK29jT1VaNzd5TFl2RWw3a1lydU0vZGtmZFdWbWJPSWxicjBvYlNVT3B1?=
 =?utf-8?B?aHgvMDVaOFpyVGx1TEhQOFNPSFVoZGdDREN5cTAyY1dEN2JYci9EQTcrSGZ4?=
 =?utf-8?B?M2hEMWYvOXpaVmNhUkRqODhTd0xuMjJQNUdrc2pMNExxSHpoNWM0U2k0QmhY?=
 =?utf-8?B?aithaFlucnllL0daVVRrK3BrL1RHWTdOc3JvdE5seDFtYVRYNGlsZFdzbm9D?=
 =?utf-8?B?dm8zZnFwVWFEZ01ZUUV5bkg0eU1yazNKVXdPYlVvcWFlaFJsZ0owM3htMThX?=
 =?utf-8?B?aG1IR1FONnliTHphb0VDb3V2MVFXajhPWXJmeTl1N0lmMDhLa3hVL1M5aFRw?=
 =?utf-8?B?QTgyd1ptcGdocFozUjJJMjBHMm5HY00vWXIxOFQrOG1pRDB6bFFKQk1tM0pG?=
 =?utf-8?B?Nkd4TzdYelFoR0N4Y0NQVStnY2dONkNIWkQyWVVQNHhpRG5yNzVyT2N3TUZs?=
 =?utf-8?B?VXh4YVZ6K1pHKzErOGpaZjhPNmhMSis1MDB2VldCa241T1BzMExnenYzS1Z0?=
 =?utf-8?B?YjdPSmNxN3NuR2EveXVUL3FwZ0dQZVE0L0d5R09YYUI1S2pGVk0wS2F4eVZk?=
 =?utf-8?B?a0VOVVk3VDZVeDZkZXJpM1JIOFFSeFUzRHlLTk9NNzlNTy9QbWNyTmdCZ2s0?=
 =?utf-8?B?cnoxTFk4dGk2b3krUC9Ib1VEeXgrUE02ckF4UVF3cFVrVEhUZEo2NnZvQmc5?=
 =?utf-8?B?UFpHaUtBWXQ0ejdKYkhXTURJU2JaL0dIOVJHMW5QbkIwQjdmNW9ZZ0tmWHE5?=
 =?utf-8?B?OW9JVTJxOUxQbXBSek4ydnY1R3Jjam1WWUdINXJHVDd0Z0FCMlRWVERDV0J6?=
 =?utf-8?B?Vk9sZVVOV0QyYW50bnl5bzEybDBmdms3MVpOb0pra2REekh1UkVWQ2pXaVVW?=
 =?utf-8?B?Ujd6K2c5NU1pbEpBSDlmSHFZTmc5Z0V5azBkL1ptRHVQaTZIaEZLa0t0L3B6?=
 =?utf-8?B?M25qQU9vc0ZBS3BKY0hGT24zdHZtU2RzREd6TWRCTlV3KzUrSFhsSDZnVmdv?=
 =?utf-8?B?YVFERHIvTDRLUE9tWkxpMDJMYjZGUGtaYmgvUmI4dlFsam5vWEg3RG5vU25l?=
 =?utf-8?B?bno1TmlNL3NsdzRPWTZ2UytUeENnNzlyVTNkWVJEbGxFaXZ2NmZJSjcxRkw1?=
 =?utf-8?B?cjNNaXpmM3paMUxzV1NreXpGdTY0dUVaVUgvZHVsZUtlMVBmd0UzWld2T05O?=
 =?utf-8?B?Z1c5SXp6ZTBVT3dPaFpVOEtTYmRvdFQ2TmtJVnZBL3Z6cXhONi8rTTcxWUxu?=
 =?utf-8?B?QWtJV1lMdjZ3QWs2QjlBeXh2cW1nMTBjTm1RRXVaZUNQcllKaVlUNGxIQmNQ?=
 =?utf-8?B?a2FkbFAyRXNyaDFyMm13Y3pFT0NXNEk3aVVzVzRheWdoK1VlT00wQy9jZDVy?=
 =?utf-8?B?RlJKSjZlYTJ0YlhDMVhQRlptVGhjU0FjbE1iT0V5ZDIvTTBMbFRtM2RxOVJj?=
 =?utf-8?B?ZUtpZ3cvWjNxNDZpa3Nlc2kxbWVPeGt4RVpPTWJPRmRTbVdxdDZpLy9UL1lW?=
 =?utf-8?B?djRYdzFtcVB5Vm1ldUFpZTVVYjVmUG1UY05UeGF6bDErOWkzZkJ0QkVYOXh3?=
 =?utf-8?B?VEYvOS96dnRPWnZrc2ZrYjJOYVNxVm9xVjcxWFE4UVU3eTZheFExT29WaXB6?=
 =?utf-8?B?aTkrM1NLZ3J6YmZUN2JrK20zN0llc25vQjlPU3FyNUlzbkZPRVkvTW1uOUdE?=
 =?utf-8?B?UEs4ZEkwWGVLeHNia0pVQ1hhKzRVbXRCNE9Pc28yU0pIbG9WR3RmMjR2bWZv?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5883ba-8d5f-46ad-489f-08dd72877f2c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 08:14:03.7448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opPieBYKtVgiIKhUNRPjZDID+gLPJ/BrsgpGzFSob5XLrfAjHtkm4nr99w1lS6D0lchZmfFb4dFKaSq8OvVTMdEKk+44O99MM+00V8pDRXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5770
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

On Fri, Mar 28, 2025 at 04:45:32PM +0530, Satyanarayana K V P wrote:
> In the current implementation, test asserts if the captured error is not same as
> injected error. It is possible that the error received is translated to other
> error which can be returned to application and in some scenarios driver retries
> in case of failure and so, no error might be captured.
> 
> Considering above cases, added flags to control the assertion after injecting
> error. Test does not assert for probe_guc_fail_* functions as driver some times
> retries in case of failure. The main idea of injecting errors for these guc
> functions is to check the robustness of the driver.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

LGTM, we can specify flags per section in the future if needed.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index a49070b4d..a03dd3fbe 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -33,6 +33,11 @@ enum injection_list_action {
>  	INJECTION_LIST_REMOVE,
>  };
>  
> +enum assert_flags {
> +	INJECT_ASSERT_ON_FAIL,
> +	INJECT_NOASSERT_ON_FAIL,
> +};
> +
>  struct fault_injection_params {
>  	/* @probability: Likelihood of failure injection, in percent. */
>  	uint32_t probability;
> @@ -234,7 +239,7 @@ static void set_retval(const char function_name[], long long retval)
>   * @xe_wopcm_init:		xe_wopcm_init
>   */
>  static void
> -inject_fault_probe(int fd, char pci_slot[], const char function_name[])
> +inject_fault_probe(int fd, int flags, char pci_slot[], const char function_name[])
>  {
>  	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
>  		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
> @@ -243,7 +248,8 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  	injection_list_do(INJECTION_LIST_ADD, function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
> -	igt_assert_eq(-errno, INJECT_ERRNO);
> +	if (flags & INJECT_ASSERT_ON_FAIL)
> +		igt_assert_eq(-errno, INJECT_ERRNO);
>  	injection_list_do(INJECTION_LIST_REMOVE, function_name);
>  }
>  
> @@ -270,7 +276,7 @@ static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
>  	for (int i = iter_start; i < iter_end; i++) {
>  		fault_params->space = i;
>  		setup_injection_fault(fault_params);
> -		inject_fault_probe(fd, pci_slot, function_name);
> +		inject_fault_probe(fd, INJECT_NOASSERT_ON_FAIL, pci_slot, function_name);
>  		igt_kmod_unbind("xe", pci_slot);
>  	}
>  }
> @@ -557,7 +563,7 @@ igt_main
>  
>  	for (const struct section *s = probe_fail_functions; s->name; s++)
>  		igt_subtest_f("inject-fault-probe-function-%s", s->name)
> -			inject_fault_probe(fd, pci_slot, s->name);
> +			inject_fault_probe(fd, INJECT_ASSERT_ON_FAIL, pci_slot, s->name);
>  
>     for (const struct section *s = guc_fail_functions; s->name; s++)
>         igt_subtest_f("probe-fail-guc-%s", s->name) {
> -- 
> 2.35.3
> 
