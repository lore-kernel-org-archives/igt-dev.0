Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592C1D11181
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 15:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD6010E069;
	Wed, 26 Nov 2025 15:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAWRmisM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D2210E069
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764172558; x=1795708558;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=18iFaoTzCnNY+mUBZZZD5SrWQKoVs76/rHXQsOgps+c=;
 b=NAWRmisMmC/q5lf7fv31EwchkV4PgCU93W0J4xKc7/gqvzVYHdLCuKij
 o4GwoURIHTP6LpPOwbD8l+aTJ6zZ11J+QjWV2PptFwE833OsLSmJ43u+R
 J8Tef4Fgbvg4F3fZqNFM0Gs3eMQpxyAueND9Mz00WVKJCCMuEVAme3ER/
 lJ39lwtj4zBuHzbfPNDMlwk/92CVZWRc9tsg/rqi8zs75jeFSbtMlUTTQ
 nzspUR+G7klrzOy/ESiZ3br9DTf3w5R0aFXibf19l8BRboZ4VR6rgqFsE
 goX4xQbBTcG+wfWsg1NQEvOaWey5HkXmetvZVPW0boMXRiUtNJ5x/4eIK w==;
X-CSE-ConnectionGUID: TA8E7zv2TpOws4mesMllWQ==
X-CSE-MsgGUID: oNHiwbJTSCCvSlaVPbKZXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66245949"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66245949"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 07:55:58 -0800
X-CSE-ConnectionGUID: R13OcG9bSaOmgMbKBcQXDw==
X-CSE-MsgGUID: mK4ApZflRRCpFSswr8xMhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="197461064"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 07:55:58 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 07:55:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 07:55:56 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 07:55:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rB/YgJJ1fai5UKLyXEhhedUdUr7JwLQ+LhDqbMNMTonHRtkZcjs0+KtAA5gT53mjbnBbH+qiGttufTEndLQXMPdgka1N6lz62wpo5Yrmc591b1mhto0iG2kQnt+47g6AEGjzCI6ADTQoG22opAB5+KFRjmhb9gcyDFIfqm5IFmFwIBJyu9yBXqYZg3kWiJ6fYpk70ikqCTxc2XJDcjwuQ31YBbJzCyiXW0BVbXlRqx3LDRKGztojNQWFQEuKCpqpjuess28uHAX2Jg751yDQptehd3S1MODYDYRi3PYYid+j0CtlPsXzIxth6MhkuuqLT/9cWeTfOkv2a1pmDiNJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZfZzkMYqmGI08cNBo97FE8O+DC5S1MtxAhfhsV1wTg=;
 b=qg26Hpq7QuxTH6lxTUxRcburHzGk8jvpz0khGageoY2wnYuFtQ0i67pTPJowi93mg0uBvnI82PVwq/4dfCLIHLgaLGUWdjJHJsvXuIvh3a8SKOfD7W6/ZPyukMH8fbfQCZU3E7ptW8XHag/9KDUJbG5nvKWwOmEaaJxD+Q9lnHcN+zkr+nOSaqa8rsmjnah5EDNkGG76AwNmG6LSg/i6/HMqi8A2fDOZI6IBAesBSowqimafprXMazyyLmrdsJgFbvT1RyausEbR5GqaTouQgmkQFfsuMvoCI5jLuOUTL7XKjRdgVJ6eXAwXe6io9VBuUaintgtKQZVaBXFH+k2FJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by LV3PR11MB8484.namprd11.prod.outlook.com (2603:10b6:408:1b4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 15:55:54 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 15:55:54 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v1] tests/intel/debugfs: Move VRAM MM checks from root to
 tile-dir validation
Date: Wed, 26 Nov 2025 16:55:45 +0100
Message-ID: <20251126155545.51113-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0027.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::27) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|LV3PR11MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5acbd4-35b5-432e-34eb-08de2d0447f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2pRcUtISTJZNVorK0JzWmRiSzhjWUkyMnNHbnJ0TXRQbTNlTDYzbFM1SmE5?=
 =?utf-8?B?dTRFb0MzM0U3ZjVOeGdlaFdXbi83Q2o2Y0FxUEMwVUU0aTFDbnBXb0RYY1or?=
 =?utf-8?B?U09VZllpSjBmQ1FiTGlSS0VhS3dyS00yODczV1Z3aE9OQ0JSUkc0K2RjYXZ4?=
 =?utf-8?B?VWZDdFZoNmRmR3BlcXRXQWpSbGpGSjQ4dE8vemhPelUxc2NCOWttblQvcnpv?=
 =?utf-8?B?WFZjVklPZVdlc2hyMkEvek1DL2RCZmZ6NzVCM2g0bFUwQnc2UDlMaFdtWFpX?=
 =?utf-8?B?Vi9kSmFJczFZdDRxVUx1Q21hdkJSTFVrczBiSGRodC9sMXNuOVhDSXFSbnc2?=
 =?utf-8?B?amlmbWFLdTFxbzcwSUx6VTlyOVVSVTRjeXhpM3A0c09SbFYra1hHYlpaaHdr?=
 =?utf-8?B?Y2N0bm9qdm9INzVTWXUyQ2tiRzhYZndObG53UEVXYklFazNpK2UxMWJ4WDd2?=
 =?utf-8?B?ZXdrd2kxeng3QTNHK0JRTmxNUjZZckU2MTVLeUZhYjZ3NUlXaUpxVm1UeTNH?=
 =?utf-8?B?S1c1RE9aYTgvbmFLUHVwU2VTanJqTnA2ZTdieFEyRSs1Yk9WSTdMVFVSVE40?=
 =?utf-8?B?TlRwWXFZalVURWUvWDBuTnk5VmN2em1VbVNRbEk0Y3J4RWxGV0dvNnVuRVNi?=
 =?utf-8?B?VFlMeXhQMFR6enIyMWl5a1dNc2tUUmwxb2tMWitqdVBKbkh0TGgva1Y0VGN1?=
 =?utf-8?B?Q2JWa3c2aFpBV0Z2Nk1IU0ZnZDBqTklkSmJ5azV4QzU0cUNpeW1NMTExMFJy?=
 =?utf-8?B?NkswbjhDK09SWFBibno3V3FPM1BnWUlKOHR1RjlBQi9HTHErOTB2THlaNzVh?=
 =?utf-8?B?dGFQTU5kdVhLN1RUTWZQRHduaFE2R3UvTWlqNy9jN1Ryamo3Q0JTQ3N6Z2FM?=
 =?utf-8?B?ZVh2UTVDemZqK1VhMFVqZ3pNbStaMXNTSC9ObktTTGswelMxekNKU0lTQ1R6?=
 =?utf-8?B?VFczcHdLUGoyb2hXOWY2TnMxM3A3Q3k0VGdueW1KdlpaWmNFa2RqRGx0RTR6?=
 =?utf-8?B?Sjd3UWlKeEQvalMwaTBJdC9POVo1d0Q0VytiNkhNbzFaM2UrNC9QQU1iL1V3?=
 =?utf-8?B?Yk1kZTNFMndaS05TaXhiMVBCUWI0aGRYUWRpOXdNUVZIbDYybzlwR20yS3JD?=
 =?utf-8?B?YUFZdjZXWDExMFd5NmdsZTBmUmh6QnN2c3lZRGhGaUl6QlZBeHNDSmpDRkRt?=
 =?utf-8?B?VEdYZzkyUFBYNXJMMkFUUUM0c1RXb0VPTk9JZkh0S1VFdzdZK3pwd1NGWXc5?=
 =?utf-8?B?dmxrTHo5emlOOXEzc2lKdmFNOVc2bGR6N0QydzI3MEFDY3BUZXUzaU9VcXFT?=
 =?utf-8?B?cHgrUHB0NTRvUXNxQkhpYzZOMFlQbVhPTzAzZGVNZTV6dDhseWpCeGxjdElz?=
 =?utf-8?B?VS8rZXNUWVlZaVpmSGtNRXdIckdYdkJkMU9lcUQ5bm1BaDV1SzVCdlJhcGFU?=
 =?utf-8?B?T2ZHWWxxaG1HWkEzc3U1WXBjTkF4OTk3eURaSlpvR2VlS1NndjdsL1A1TmdO?=
 =?utf-8?B?L2d2OVhsZ2RZb3Y0cThpSXNJOGhlR3Q4bCtNYTcySDlwZ0oveHVTVFYyRmVQ?=
 =?utf-8?B?dVE0Q3oxb0pWd1ZId3hLOS9qU1VMQUEzT3BFN2VIRUwrT1JTdXE0V0hRbVEv?=
 =?utf-8?B?NlVmVElhcUM1ckUrc2MxVjNWOFNFRVFqQnhqUmRoRWRmN2hFYnhWUXZoaXpN?=
 =?utf-8?B?UHVEa2RXMDdjOWpjS3BNaktORm50cS9qNkZpK3ZiRFJwbGR1c1NCZUNpdDF5?=
 =?utf-8?B?ampIS1NMZno2bFh5dDdqTXZDSnpQY1RNU1JyMXFsa2tPMWJQMDFmWXhkbzdR?=
 =?utf-8?B?OUprZEIySkRDYkdKT2ZHRFcyYWcyR0ZuNTRlb3hLeWdDTWN3UlVBOFF1Q0hx?=
 =?utf-8?B?ekpPR25qdDQwUVdCWWY3S2hIaTdnYjNRWUhZR2hxNFJjS3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amp2VHgyOG1FcWs0dndhUWh5K0pCN1R3NXYrVnRiY3c1OGJQcmJBSGJlY0hK?=
 =?utf-8?B?aDN2elMzaXU1RXpqSGtoK1YwbkNkVW1veWl5MVAzS1JjVlVzY3VSUTUvUXQz?=
 =?utf-8?B?T0Z0QkRiWVdxczdTdi91SjJ4WGdQZEhwTHd2TGxnNkUzV2F4ckFXbXdvUGtE?=
 =?utf-8?B?dTVxMWZGaUV0SHQvVGttZFhaYjMvMkQvOGZNUVhiNmRLYUl3SFdhU01pTE5T?=
 =?utf-8?B?blc5M3FaQk5MZkc1elBORi9lTU9kZnpiRzRyK0ppOEFpY2xiMHhTdzVuNXlt?=
 =?utf-8?B?MDJ4OHl2aFV3WURkZGNYU1JoM3hhWkhBeFRVM0lYVm1XZWNpd3had2RzblFm?=
 =?utf-8?B?Qk1VQnBib3NxS0R2ZUxISm9IN1B0N0RpWVpTYWFDbXdQQitoWE04cHhVbkhx?=
 =?utf-8?B?Z294Rnh4RThnSHk0Z1JCTEdJdlIvZCttNDAraUhyMjdnQllBaUdPdlFzcjYy?=
 =?utf-8?B?UE5yUVN0VlEwRmZ0MUlTNWUxejcvVU1ZR25zL1h0dDhCaUpHVWd0bFFQY1Vj?=
 =?utf-8?B?cytNSVFSdDd6SUtDWFFwRDlDU0Z2NFgvaDVNTlhmV2lQemhrWEg1L2FaWDY4?=
 =?utf-8?B?UXNDQ3JOVEdPaUI5UHB0RDdJQ3Ewdm02ZktrNjNORlRmZHZtWjVwTFROZGZo?=
 =?utf-8?B?cDJRbDFwZDFGc0dUYndWNU9EMXRyRTBkL0s3OWVkVUdlenNoSEEyU2JaMkh4?=
 =?utf-8?B?L3JSYjVabzVPVVdmZXNHUkpscWk1d29QRjU0WTlhWFBNR3lhS1dtUlgva2hW?=
 =?utf-8?B?UzhLemRTQVU1bWkrWVRzWjZoaVVaMTREYktSR3MxZ1J3M3JhWnFYN1hZc3RB?=
 =?utf-8?B?dVk4amFqYVdiQ0tHaEg0Tkw0S2tyWmoyczMvWENFNWxKNXZXTlVSV1NpdFZT?=
 =?utf-8?B?WmNRZmMrdTVabzRqTnJCbnAzamI5aW5WVW1od3BPaE9jTzNYL3NQTlBjYVM3?=
 =?utf-8?B?MktHQUtlUmZ1UUFNMnZuSDY2Y0RZN1NUMUt3Y1U5cWM4ajNlcHhHR2REVWJp?=
 =?utf-8?B?emp3YlJqd08vL1V1YzloNFVHSW1rSmNiS0xyYWVmUHZaUHNjUTNFaVBLSmhy?=
 =?utf-8?B?ZXhpVFErcHZqbkVTVGFXb05tSSsralptVTlURjlEQTI1RTZ2aDgvMUlTMUNX?=
 =?utf-8?B?TTRYLzBzd2lWbjRJSzhPYUR1bmQ5dkgrV2pCV3c0SDNLRGtrejBKT2Q3TXVr?=
 =?utf-8?B?ZlRLbjVwMndiZFBSM1ovVmlZNmRWVnNuclR2K21LUGR2dHB0REd2VnJGSVEz?=
 =?utf-8?B?dmJnb0tLRFZFVXRUTllhbWNjQ1NGZVVyUFd3ZmJ2UDFCV3REdGFsUW1ucGJx?=
 =?utf-8?B?SXR0cWZhZnZMVnhaNVZXYU15ZitWQU1EcnhWNXlZTU50dnphU05SYW8wNVFi?=
 =?utf-8?B?MWFCdDBYTGJTbFI1bHFkSFFpWmRWSTVpM0JYTmQ4UW5ZN2lyQjd3aWhzeTR0?=
 =?utf-8?B?NGx0alcyYXFGcW1KakZmZ2EybGtEamo1S2pncG81WjJjUStSZkd3YzgxWGtK?=
 =?utf-8?B?dC85Q0dEYTZRMDhjY1lDSkVUQkhnUnF1bm15TlBxbmx3bFpaSmxOYVZtSjNO?=
 =?utf-8?B?QmwxZkpBK0doRWMxbUNNQzRPS2I1NWdaakhWeVdjRlVmWnFKTlFLZ2Frc2dP?=
 =?utf-8?B?Ymdrd2kxSVlzajd4MTVoV1hpclk3RHVmWXJMakVtY2pFQWc2MFFCbU1nTldJ?=
 =?utf-8?B?NVFlMkNkSWpFb3pHYy9YK0hkNEV1WHByRHpCRnQ5UUtBTkxsOERRMDZVcWxx?=
 =?utf-8?B?a1hhT2p3WnVGeWxpaTY0VmFCR29KNnc3dzhjUmRwR1RQZjRkYWszKzRkemxI?=
 =?utf-8?B?WW5xZkVqT0tuQ0lPdm9TeWlJRmZSVGFxSXI5eENHM0J4d1lGVWd1Zm1xbEF4?=
 =?utf-8?B?bHoxMk0ySTZwVmtZM1BSNldXbUsvQjExamVSbWpjRTZ6Qm5FenU2YlJjajNZ?=
 =?utf-8?B?WmhoTUZjYys5TGx3SURFdjF0UTVONU1BTC8vTWJKMkU1WEpMK202UTVxdERj?=
 =?utf-8?B?cElJdVRkUkVaM1JwdXdlaWw4MWFRaFJ6Vk1XT2VvajBmQ29VVlREd0Z4dGRQ?=
 =?utf-8?B?MzcxVFNZOE5qV2dGUjY4NS9lMGFObHF6Nk1UazJ0dXNtWlBaNFFZd3R5UExv?=
 =?utf-8?B?SzYyU3JaY1JJOEw3Rjhydk1iWlJ6eE02SG15L09wMEdXUi9OZ1JIbW1ISDA3?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5acbd4-35b5-432e-34eb-08de2d0447f7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 15:55:54.4578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIamOnwiQycT3bGmBVCbWSW0u8h1T1GSKSEaoNGPinQ2iSEUHIkyNn3h6PDyn7WhmuOiyqKr6EV2ir+Y1jKdM/KkBkhIo7SMce5yvf8legU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8484
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's adjust VRAM MM debugfs validation to match the changes from [1],
which move the debugfs entry from the root level into the per-tile
directory.

[1]: https://patchwork.freedesktop.org/series/157089/

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 705b80ab80..b85acb1dc1 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -245,7 +245,6 @@ static void test_root_dir(struct xe_device *xe_dev)
 		{ "info", O_RDONLY },
 		{ "name", O_RDONLY },
 		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
-		{ "vram%u_mm", O_RDONLY, has_vram, tile_iter_mask }, /* vram0_mm, vram1_mm, ... */
 	};
 	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
 	int missing_count;
@@ -275,6 +274,7 @@ static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
 	const struct check_entry expected_files[] = {
 		{ "ggtt", O_RDONLY },
 		{ "sa_info", O_RDONLY },
+		{ "vram_mm", O_RDONLY, has_vram },
 	};
 	int debugfs_fd = igt_debugfs_tile_dir(xe_dev->fd, tile);
 	int missing_count;
-- 
2.34.1

