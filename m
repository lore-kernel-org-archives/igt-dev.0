Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68878C282D0
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 09:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BD910E54B;
	Tue,  4 Mar 2025 09:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecBGegMs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCA610E54B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 09:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741081292; x=1772617292;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TSP545yb4lXwnCra06DE8THexwnJDMA4VJanQHPG9tA=;
 b=ecBGegMskRyemqaotByqA1+VzMLR67B1y/vNncxNQV1wfbgZ+Vqp1Alc
 An2X60c1VNsU9PPxsDK1cjNIfhXTMOAYd9btGRgk60hetnoMm5PfXoW4c
 ljIa2BSLkkjS9gVuEAd33HNQJDej5q0gt6030PPP+LTYOZpUs55cavI4V
 NUkI0wQTwlqiK3GcwIotWs8qEjI04T6pscUILL0yu8pWGcYEYMHn/aJzn
 8exatYnAdUr0R5xEjGkvEKZI7FnYd5HR35mtkbb5ilfDFScnIR54QTSzb
 oUb92XAfcA94lqfHGp/mM9Q3LfPTbByEgaKeEeSkxxKLCCh5ZqsEp/Vrt w==;
X-CSE-ConnectionGUID: iJQpO7zaQL6RBLdiKZO5+g==
X-CSE-MsgGUID: uK6o43poQ22P1QvMtyM2sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42017556"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="42017556"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 01:41:32 -0800
X-CSE-ConnectionGUID: PZ5K5nDhSoiSPYw0OAzqIg==
X-CSE-MsgGUID: HuC0UXqLRYaSEurTW2AXfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="118049807"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2025 01:41:31 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Mar 2025 01:41:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 4 Mar 2025 01:41:30 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 01:41:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLhJVhu2G9Vz7UNaySjXt8dN3CO0SB5pU9tIwqUpoUJb+682fUYJAOynNCu1e0xbB1u8KO0e5WXXBy0IPxBtaMUUZ3q8F2GlV3URX1WCuVsHoWI63Rqn2tcZxAv6Am+XOi7wI3OvQFogb+6QOmnzv6wwfIiGRW2DqVuWhkRLdogiKFr+KipiSgO8XOpo2Tf/dF4Bem3SilNSEqFwFFykkROoysoN75GiBsrd40iO8dXl9uusfbfn8pQYDKBQHNPR0xFS/EaQ6jrklakXM5E77GnuOZfnLP/y7Yt28i52uuO9i3s+2/z924+lvUJokiQZxW+8HvcI5nmanWzuhgaEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ATMplMo1O1siSpQxCrG/mZyE/4+x9MQNe2w0wRhWzk=;
 b=PmNQTE7gB2hkTS9ILDXQt1kgZA6Spb7sYmlLyfSBdqyJGNCQ0Qw8gCNpiTj7v7YerOZeZX80oIwX6Kock/jLR/8/BGCaQ2OtGIV1obRIFZM/kgZNthjlLaIohom65n/u6xDSX0G6+dlw0Hk6CSDea6uiJmQBBlQNja+KKkEhCRCZm44chFl89Ee3A3wLKSZXOli4TlUVPueIGrhPUhiCnowUMQ8kZR/wjWJGUPProIXlVooxWerZ53C+xuSxNOc+yv8Q5M18GmRwlqNKD0amjw0oMSFQm+sFA9K6Qs2tAP2g1aXZjLd7eLP3x7zVLv7cHxisR8ecJv4f2O7n1xU09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SA1PR11MB6662.namprd11.prod.outlook.com (2603:10b6:806:256::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 09:41:28 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%3]) with mapi id 15.20.8489.030; Tue, 4 Mar 2025
 09:41:27 +0000
Date: Tue, 4 Mar 2025 09:41:20 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v3 i-g-t] runner: Parse results harder
Message-ID: <w7oziq7mhwv7r6bpfcox2rb7icbwyqmphdjpf7guf5t7qj7mpy@oplkrucp2skl>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250303171029.70318-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250303171029.70318-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: DUZPR01CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::11) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SA1PR11MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e9cd6f-05c6-4a2b-1329-08dd5b00bc86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnpVckV2WDJYMVZQL0cxUUZyeWhlT2hZN3U5TUxVd2RQZ0RBaUN1L3Zhb3VT?=
 =?utf-8?B?bEx2NkFmNGhobmhqRjA1eTZ0aHhUZy90WmFtYUNzVGxuek9YaE8wREc5b0lP?=
 =?utf-8?B?aUp5L0lUNnNMOVZ1cDI4dXYzQkJ0eWpzMERWZ1pySm5WYk9PdysrMDNmcEdE?=
 =?utf-8?B?WTVyZU5paEpWaTdvbGlkTXdFdDExMC9PUVZrNDlXekhsRDVkcjhFMEpNVDhH?=
 =?utf-8?B?NHNnQmE3dVlDZDA2T0NHeldLckplRWtDSmNtc1RyNUZTSE1vQTVkRENMS1Rw?=
 =?utf-8?B?ZXVSWE5CWm5QRDJLZmwrT2luNm4yTVJxUG1uaWVJWENTS2xpd2kxdlF4eEZ6?=
 =?utf-8?B?d1EvMTRGNDd5RGJpZjRpRmtXenRvZUhYZmliN2crUFM1alVoOWpCQzFFTWxG?=
 =?utf-8?B?OEEzclVzcWVKVnhKN3FleHlDZ2lTbFJacldJK1FWT2NVSmxibmZVMHI1MEpo?=
 =?utf-8?B?L2k5RkFZVFg2dWoxU28xWW5PWFB4WHVua2xPUm82STFvMW5MaFZQT1p2d0ts?=
 =?utf-8?B?NVBKZXl6WFlzdVF6Y3Y4MThLb1JVdEdRYUt6Y0JKTVVhc3VNUTgzUkpORGRQ?=
 =?utf-8?B?bWpYYnZmRVh1aDgzT3UxTHR2b1RlcWNDRGFYclZDK3dGYnNCTWhQY3VZcElR?=
 =?utf-8?B?QlNWbnErQS9OVHdibjJIcUlPcmZ0d0RldTBFQ3V4RERKVFlqZkhmUUlYVWht?=
 =?utf-8?B?Ny9WZVo1WHc0Sm5DdWVFRHJMQURIbDFXVE9EbVhRbUc2cGdyUUdIOHAwcnBM?=
 =?utf-8?B?UG9ZaktqaWJyaDViZVZQcUl5cmZna0pIalk5aEUwTHlKbHVqNjFhc29UWWEr?=
 =?utf-8?B?eGxWMjQwYVBvbUk0eGszYlJyMzVlWlRUb0ZDSVA4cmRhS24rMVRkSTR3aHRl?=
 =?utf-8?B?Q2N3Zm9sbUJBeFliTmlKMnExb3dxYmJjNVpsWXJaaFVURlk0NXN1YTJKZjdj?=
 =?utf-8?B?eldlMnB5Vi9aMExIQWkvcG92U2FKUVlLMklWTXhSa0RlZ2MrTldDWmYyODlm?=
 =?utf-8?B?TlpxbVIxK2Z4dVpNQ05VV0htOEpOQXVEREJKM3EwTkV3ajhZWXhKUklXczZT?=
 =?utf-8?B?OHNjNnNYYXZ6b2tTRmFlRHBGMUxnK0ZsZkdNaG8va2ZKNm1rT05EU1Q0SHBm?=
 =?utf-8?B?UWVVTXlvUnRsUUo3UjNMZDZXaEVZTnNSb2hLVUVkU2NxUE9zcVUxNityL01t?=
 =?utf-8?B?SDhFSjZ5Q000L0YzZjNJWGRrWFlwY2dPRWZ1QkYrWVllVXY2VUFzdEs2bXl3?=
 =?utf-8?B?Nm5KOHYzTllHalZ1dWIwWDUyMUc2RGhFZVZkRlI5cG1EZEtFVzk3Y25lazVP?=
 =?utf-8?B?U3NmSmJPZGc4MG4vQmNCc3BoRUdKeWNVUjlJbkpOTE0xUGtnbGt3ajNrRGlE?=
 =?utf-8?B?Y0ttU2VVVXFrRlYzMUsxWUo3SDBVQ1VmMHpySkU1R0JhbjlzOVZ4M1A0OEpG?=
 =?utf-8?B?Q1pDbVBZbWVVL3d3TDlaTUpFT3pkTkp4aTN2aWg0SkIwTWM2ZFUzRjR3ZEtp?=
 =?utf-8?B?VmhZcEtGV2dRclJRZ0d6SGlvV0EzMFE5aG9zTExyUzNRdHRQbEUyU1VubFQ5?=
 =?utf-8?B?dkVRM0R0OVc5VUZCbUpJUlpiRm1vK0h5UEwvRzl1RTRDVjFFak9LNlh1aXN3?=
 =?utf-8?B?aitXQVo3MzN5M2VHZUlFaXZ3VFRDZmRDTDhib1lzNXVxNG9ySER4dS9SRDNy?=
 =?utf-8?B?RHd0N1M0aTE2V2w5UW5FM3IwU1A4cTNGc2FrQmprd21xZUk2dnEzQm10OFdN?=
 =?utf-8?B?dkwveVdYSUd6cS9LZUFQUDBGM3BuaVlXWnBranhGMUk4eGpjQnBYUlIxcldN?=
 =?utf-8?B?czk4MExiQzMzQWVnazdETjBVU0lxdmxjbVNock90ODdORGdvNG1sNTdrNGQ1?=
 =?utf-8?Q?7y6BcJ0mjhLW2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3g4QkNRQllTWlQ1Zk40RmRoUGdEQ3NVdnRnR0dwTkgxbFNrN1ZCeCthYm0v?=
 =?utf-8?B?ZEdzc2NxdDNwWU13WlRJaG5TaWVQNURkRVJIcUxkWURMakpBcnZZWlFSTFBV?=
 =?utf-8?B?dzRIYnJiWTZmSXlveVpwYVpBMStFVDRxSlcxcCt5SnFUcFVwUmhwWXVWWVVI?=
 =?utf-8?B?dTJPcHI5bnIxUklwSjQ5Z2dWQ2I2cXN0V3lLRlhUTlRIbTM2bDZoVFVpRzRm?=
 =?utf-8?B?TXdJaU83R1FYbnpBMEtReUJuaVVzTnRFcVl1TGhEWmVTeGNkQXdaS0hjcmNV?=
 =?utf-8?B?SXZCc0FGaXVMcU1OcXU3ZzcwR2pJdDM3Q09HV2RnRGxqYVBQWTl6d0IxWENt?=
 =?utf-8?B?SVlXR0FBVUYxOVZhdmE0dVR0andmQS9VNmtWUDJVQ1VKRmRUN3hDUGE5R2pX?=
 =?utf-8?B?V0ZmdStoNnEzcCthTlk2bWk1MmJKN25tUlA0QXlORUtwWDh6Smpmb0NNeGZW?=
 =?utf-8?B?ektTekswc29xa092ajQ5bXo5MHJxTFJTUGRGQ1dSNFZXU01VM2lReXdzNW1z?=
 =?utf-8?B?R0lac3ZITmU4Y0lhanhxY3NVMld2ZlcwM3BXUnlrQzlVQ1dORzA3SEFlNnZP?=
 =?utf-8?B?YTRQWjg3SWNWSHZadnVXWko0RmF2N1dIam1aQ0dUU1ZEWkxDZVJ6ZjFhYzg2?=
 =?utf-8?B?aXoxU3Zwc2VwaXNhYnNZRVlGYVNmK3ZLY0FGSGFCOXZzUCtVKzdURU42OGxu?=
 =?utf-8?B?Ti9kYVh1L1J2OGRCK3h5ZDFNQ3V1Qmg3UElDWGtPVzR3aXp4ZWNrWkNyWjNh?=
 =?utf-8?B?L1lnQ1RIRGNEZjl1cDZXRTZySHNWYVJ2MlF2a1h1MmxiYWRlSy9tSXVYWmlx?=
 =?utf-8?B?Qm1wbUNzRFpOMU5SWlhIRk10Z3IzQ2hVbXBYYzJpbTRJTWJ1bitaT2NJaElv?=
 =?utf-8?B?UlpuVDc5U1lxVEsvN2ZXV2JwcGZmQjJKZ245NTJ1YTlxWHlLTXZIcWdJcVNh?=
 =?utf-8?B?SEVrTVk5WG9RR1JSS0RLMVNqU2RKSE9sQWtZQXBkWGdYOFE3TTJsU211b0hq?=
 =?utf-8?B?UGNyU01TT0l5WHZxa2I3VGhzTzNBdnRMRFYvVlJsRUl4N3BMSlU4WVhYOUpG?=
 =?utf-8?B?TE5tZVBMQU0zdmVSTFR5VGkycnFvcmhuK040Z2tSc2lMRFZoMXVrZSthZ0tl?=
 =?utf-8?B?SWYzNVRLQVVDR0RDbVcrUS9Xa0tZRmJTYUdPQStUVkVyUDZ0eWZZZ240am1M?=
 =?utf-8?B?eVBZR0VIek16bUx3NFFWaFZxcFQ2MFJkT21UQVpQcVBrWHB4RlNDdkJpOXJJ?=
 =?utf-8?B?L2wrT2hxdk90aXVoK2tqQWUvN2JZWjZHa0Y5TGx1L3ByQkhEZ2M2ZTNISDJi?=
 =?utf-8?B?VE11YktRV2VmMVJIRWpaT29JTVlMampaMHduck1DbUJFenFqREZNR2x0R2tN?=
 =?utf-8?B?Q1gyam1lMEJJaGdJZHdLMHpJLzBKVU5UYStERU1MdW9RRWJNMThVVS9LSUd3?=
 =?utf-8?B?UUNweHA0YkRsNEZCeVVvUVI0aXB2MDRZemx3WTFnQ0xJZHdBSzY3N3Rlc1Fp?=
 =?utf-8?B?Sm12Mk1wWVdBd2tGVFlHbi9CdGREd29PNjB5S3F3NnhPSWgwV0tMWHZYaGhu?=
 =?utf-8?B?Q3lCU3BNd3R5MFBqdFk4Y3ZMWmZlVWJ3QURFTmhmU1VEUkw0Ykh3N0NrQU45?=
 =?utf-8?B?b1ljS2lSZ3JvbjJsRHZieEtHYVFDaExwT1l0bThIcjJScEV4ZUtlbVF6N0NQ?=
 =?utf-8?B?emt2S0dDSjlqV3E4RXp3NXljTXlvVVkvbWxFY3psZkpIaVRsZG1sbmwwM3dT?=
 =?utf-8?B?SFJSdGVaajNLNG5tQzVJeVJ6WStRajJWRDlidWlSKytncGlIeTlGS0xVNW9C?=
 =?utf-8?B?K3YzWktRYWN3VWVGYU05QzdpakRac2lXbTJGdEE3SDlPbHdMejN0Q0ppM2tu?=
 =?utf-8?B?VHpDZ2pKdTdhcWFqZ2psUzB6WTFJb1hFdzFibGtPc3N6VDBMVkd3L21iUnNy?=
 =?utf-8?B?Wm92WEtTMDhUWnRwVWc1Y1orT0NDV0tOczdhMFMzOW4vUG5BdjdsdEQxRytl?=
 =?utf-8?B?TXhtRWZiMkY2aDZFS2NBMHZOSHVMakNqK3pkSmNRZURING56dzlKREEwNllQ?=
 =?utf-8?B?K0d6eDVUMmtmTGZZckpnbTdpdmtwY3pFMGtiK1UyL0Fia3FkL09iVVMvalFE?=
 =?utf-8?B?djZzT2owNWJmRkpvSy9IZVVVQ0lCdW5mTGVQQmpBWUR5Rk42TEowNFBta2R1?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e9cd6f-05c6-4a2b-1329-08dd5b00bc86
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 09:41:27.8817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpEB/lQzkTXkQCLMovXfuKzTtr2cl8oFJeFdT1s9500uBjFrbk4OgY17y9yLsZT7DGNkWR+B20hU6+V9nUWHvTJhBxSnVQDAQsYueD3ozg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6662
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

Hi Kamil,

>   Sometimes an error happens in kernel or in test that leaves
> output files in corrupted or incorrect state. While runner or
> resume will just move on to executing next test, when generating
> results it could end up with no results.json
> 
>   Try processing outputs a little more persistently and use any
> output file left there, even if only dmesg.txt. Also, when no
> useful output files were present, instead of breaking out add
> notrun.
> 
>   Inform about processing results for each test so a problem
> could be spotted more easily.
> 
> v2: removed ')' from 'notrun\n)' (Kamil)
>  using bool var, added more prints about errors (Ryszard)
> v3: reused open_for_reading, removed bool var (Krzysztof)
>  closing only positive fds[] in close_outputs(), checking
>  file sizes also if all opens succeeded (Kamil)

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof
