Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D693C369D5
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 15:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3A210E037;
	Mon, 28 Apr 2025 15:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ig9YX5kD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8DC10E037;
 Mon, 28 Apr 2025 15:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745853547; x=1777389547;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=piKuvQWAXPS/agVns8Dz+MiqZpRm/aDfBwvj1m22zNI=;
 b=ig9YX5kD7rNAmSeWoxj4+V0FXKV0M/TBxJpW+bxa520AeamJ5/X4icZZ
 HNYyC3tIqC6AwjcrVRdW2Pz1jfwsvA4qy4UGt/BkJEXz0ZMaGH/kkEODr
 Zs9zUQiQQxLwQeeYIfxg5kSfpquS1FJKhFRePxGObuLvz5WDwUWmRunLY
 eaQtKSeRUupj/zly2f+kQkKQ1Pdwq3ZpEUmSnpllPTMbVBhIgyROfWBn6
 W7/qreaSORDSPXMhUIwgC59Wm7Z4IqDIj9NTSbaFyAwHCty8BA/zlNKLJ
 IyL45xZ1dRlRRW2MTkJsBF1pP5Kwen5Kc3ryQ9YEe53yjp23tuvNE/VeF A==;
X-CSE-ConnectionGUID: Ei5dUi7RQACbtA5L2eDGag==
X-CSE-MsgGUID: s2ZGb2M5QfKX0F9zMZTpWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58094787"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208,217";a="58094787"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 08:19:06 -0700
X-CSE-ConnectionGUID: KssxY8m8SPikC7uBhE0EXA==
X-CSE-MsgGUID: cMQ5SXJEQyW86bX0HGltFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
 d="scan'208,217";a="156779018"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 08:19:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 08:19:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 08:19:05 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 08:19:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCANHz3PoKHbwYRbtvAr8sBUIhUXYBI0WnCygGDMsKyczN4YgIgqtmqNjJRDKjljFSjjsKmw5TZHovM8hbDOeciPvd8gdHLtNe+IehCOZfwxgOyfGgOfBERyR68Nr09i9kLlhGKtVuyqRJf9VL3gmwr1imBnUh1xGvGsyXrbrUeElZ8xL9bIgibiPJCAlfPwEtThn7oRWeZuCLf4kiTD6ybaDEbJ+dZrtpJBUH5qedzuUyERQFQQAKpsqSUP2T+AfRCOBmmyZ6z9kPX/Xtr4B1k81krTto7DCR/9xpv5a1/kS/9eMvrzPky4eKcj0NvTBiwXGb/kpJ1dTfvyMnWCsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TRVnid4e+cIFJF7jtSYT88uURMcy5jiCeJqcQfuw4c=;
 b=keAlgHB5DDw+ZgUO9nXy/JNJjTeQqDqyYItLy3UmcEGTcTRQKEHBAbLt7DEVxuygOGSNzuMgCa8SgdOVG1CPL5RGEWhxFV+S4U+tUzoaqnuFFvGm11LWFwFALwsWEQp/hWZknh33Rr0Ymt0Y9i9lf+rmSLPpZglPQibTMXrapl/IPwp/nxgC9Fx3L29vqyJTvdCTrNz1aCoFommR7CPnLMoWestL3uLZWJkCnJIwall1HKkyWYZl8TQ7hX5OB7pyQilz/t8co0fToGvYB5tuzLYCUANxsxe1xZhdogoj4fsIo+ISHBfCB+zcfsEwC4g8bjdIPiIclV8zuvqXh/lMXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 15:19:02 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 15:19:02 +0000
Content-Type: multipart/alternative;
 boundary="------------U9b5AQVPHinfA1qlPwY9tlZi"
Message-ID: <2e2929bf-ac21-4cec-add2-fe8ab5293030@intel.com>
Date: Mon, 28 Apr 2025 20:48:51 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL3hlX3Bt?=
 =?UTF-8?Q?u=3A_Fix_frequency_stashing_issue?=
To: <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20250425180658.2533825-1-sk.anirban@intel.com>
 <174560966881.12518.13969893378054961881@c664b1dc75d1>
Content-Language: en-US
CC: <kamil.konieczny@intel.com>, <ravi.kishore.koppuravuri@intel.com>
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <174560966881.12518.13969893378054961881@c664b1dc75d1>
X-ClientProxiedBy: MAXPR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::18) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|PH8PR11MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7917b3-9229-4dd0-9e0b-08dd86680160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWdPRjI3N1FvSmpYMjNzdUtJQ040dFZ5UDFGTjRSTWN4NjlCU204bHI4T0dG?=
 =?utf-8?B?eUZnUlZ6SUhJYkhQVFNsYXM1Y3BwVXl1QUVlOFpxZDVWc2lHSmpDV1JPd25n?=
 =?utf-8?B?WlJqUDBWN1lmSmsyTEViZXVKUVp3ay8wcm93NkRoQ0Q0dUMrNEsvcnFEVXVE?=
 =?utf-8?B?RmN3K1o0UFc0UTVka0QzbVhuTm5zK1gwODlMZDZJUjlWcDF6dkY4Q3ppQWRh?=
 =?utf-8?B?NitPUjcvS2FBR2RiZHdGa1d4NEplcVhlMjdCU0w3OStETDNzUjFDaUJsWUxM?=
 =?utf-8?B?SVBEYU03RVV6MmZTUFhacGtLVGlhL0QxSTNoNENyZFowdFIrSk9Hc1JGM1Bm?=
 =?utf-8?B?WG1vOHdyN2orcnpZVWdlOTJRQzMxZEp4aXRyS0Z2RzdJWmxJNlJqTFZwMmZI?=
 =?utf-8?B?VERGVnNYMGh0dFIrT0lqSnAxOUljMnBoenRraDNhUnB1MnQyY3AzOEVyVkZS?=
 =?utf-8?B?YjIzQkl5djdrNHJZS0h1RDZUUlNtRHhRVXk0VVZPclI5NEtDNjVkelV5NnJk?=
 =?utf-8?B?Q2VSTThnaE4wNFJ6Mk5ibFNEWVhubHRTeFdlcERJVHZXNG1SK0taL1BhSldY?=
 =?utf-8?B?d0Fib0Z6Qk9CNGtHdXBFNXZzdVdBTDJzdjJBeTc2SjA2bG03ZlZxWmNQNDlG?=
 =?utf-8?B?cFBHRnFXME8wZVVNbUJiZHpWb3BEaVp3RjVsQnlvUnZKb28yTVJlMWxnU1Y0?=
 =?utf-8?B?WUVkdGJpN3B1bGtRUlplVysyaVpiWVdNMDlZUWNkUE9WZlc5Y3ZMUHpWVUVn?=
 =?utf-8?B?Y21rQU53SDFMRVhnWWQ0T1ZzelBsWGp4SGVwakhTWDRTM0RzRldCZzJBaU8w?=
 =?utf-8?B?T25mZ3U4K3pHZnpMb1dVZFVwajNGZGN1QTU5bDJtd0MvdXlyRnNGdXViQURm?=
 =?utf-8?B?YmwxYVpYVWNxTlVQc0ZkRW1PMzFkM0hVeCsrWHpFTnVxZDY3ME55a05CMGRG?=
 =?utf-8?B?cWlhZ0VYU3RUVDVsVVRjQkswK2NJRVFWMTRpMUkreWVzOXZyZUs0UjJHcVVy?=
 =?utf-8?B?YW9tLzROVEFpTG95RkdBZHZoOE1wdVdVWjdGWDRGa2dXSzVQYVZkR2RtQkd4?=
 =?utf-8?B?RTFva2NaWCttKzVuNkY1dmRDaTVNb0oxN0NGOVVRbnJtcjBoK2h3Q1Q1Mllq?=
 =?utf-8?B?bkw3RGsvVEhEVnU3dVZ1Ym9jSkxmd1VNZVZLb0NzZjV6emtzd3FDekcvbkZn?=
 =?utf-8?B?N0M1c09vR3JsRWxQZEprZThBME5JTzBLTzlYeGhvd0dSWkVvbVhQdCtMU0U0?=
 =?utf-8?B?Vnhlc0hrRy9mL2pHVXNXUTdqTDZrRDRlVVVBa2IwaDJjS3FJRXdNUGUrWlhy?=
 =?utf-8?B?dEM1cTBrMTVKZ0NXbEROZDZJTmsrZUNxcHFSTldBUk4wK2tlZ2JTdmNCeHlS?=
 =?utf-8?B?SGNKdElCcXNBVkNqeE11S1pQdGJjalE0dWU3eExlQ2FteFlvZEVkLytabHBk?=
 =?utf-8?B?eWFTSVd1STBMMEpwV2FGOG5LVzlBZ3cyZS83U3FiWkZlRk9ZVVo4VUtLOW1v?=
 =?utf-8?B?cVJvOVp4M3hvbTdhSW45UWJXcm9yTnJncUVicEphSTZFdkM5SDFBa3IxMFpK?=
 =?utf-8?B?QkFsY1JFMGlNUTZDRXk4MW1DZnJEVWxycGpFdTllZkZsbTJVQXA5RGd6Z2NO?=
 =?utf-8?B?OE1WaHVWT2pXanpLbHVXZHBuQ01SMG9WVGcrcUhZT0dHM1dGSVozTy9udk9C?=
 =?utf-8?B?bHJsS0dSN2x3eVFqMTQ3a0hGRDhQdlFhNkhZY1ljQ2Q3L2hDRzdRZjUwS0ph?=
 =?utf-8?B?MTlEOWVrd3c5YmJzaWUxRldLdTlBV0MrcDVvU3FCQnhoMitOeFFrWDdYM09p?=
 =?utf-8?Q?ryWAUfs9+cecqnlCTgKYcDq1x2sjntkekhZGA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHpVZ0Zack9jNWl2MDhJN0xHZEVSWU1abU5DSk4yL3JhSmI2OVY1YzQvOER4?=
 =?utf-8?B?a0M0V0hwNS81T0I4SUlMUitoeE9MakVWNWcyNGVzMm9YN0cxTFlBYmhRNDM2?=
 =?utf-8?B?YWw5UXR3SkRRQ1pCUGNxU2RRQmkyNnFrdmlnZWM5MWZXTjRiTDZydllXNlN3?=
 =?utf-8?B?NHQyc3NvczJjN29EYnVibVdhdEN4WGFSWXo1ZkN1VDQ3bUdXRlN5WHd2eFBV?=
 =?utf-8?B?b3VIbzNVV1ZzVXhwVnNIMXdMaEN4bFNmZDBtQ0NobXk2V1VET2pNUThIYkla?=
 =?utf-8?B?V25kdXh2YVE1RDF5dG9Dcjhjdm90UUdmdWhsWkJmRlZsclF6NXdyNE9Kdnhh?=
 =?utf-8?B?UmlKMzd0b2lzUUQrTkxzdjdvTkRReHFkdEw5UHJvaGpNenFqZ0lLQU10ODZR?=
 =?utf-8?B?b2oxSzBrYnlYZDlTRXhXNmpLa2RaZmZUalNIeXhBOUdRbDRsTnBGTnFsMFBM?=
 =?utf-8?B?Z0RKZWRLNTNYOU82MFNWV2sveXFHRTRhV0VwVmZHNUZhRnQyYWR6cUdDNFJ6?=
 =?utf-8?B?cEhFOGVmcUM2MTVYYy8wYXQzTFRKd2ZUVUF6MW1CdHhibk9HVDkraGg2V0g1?=
 =?utf-8?B?TFduOU1aUnRySERXbWVrc1BhRzVBbi8rckRVeGtwWTM2Z09qMG5NdUZqRkUx?=
 =?utf-8?B?TXRHY1krcFJ0ZW10aStLK0dUeVgxSytDbFB2R3dEVXNzaURqN1k2WGtVY0t3?=
 =?utf-8?B?d2dSS1A1WDNRdXZBQ0IyQXhmQjVIdlZaS1pNSU1zY3dzSGhjbEpxTlpFMzZB?=
 =?utf-8?B?TU5La2NhcFVvemg5NnBNZE51WllHWjR5TWdYaStKSVJmOFZsUnpScUNqVFlq?=
 =?utf-8?B?dWVvajFWSXdrM1JnaXZLY015MHdSclNYN0VTVk1scUNrOU9TQUt2b3J4dVkv?=
 =?utf-8?B?OUd6bVJUVnJHSE5GMkpsaXMvdnNqa0xDTHhBTno0Q2drTGxaU3JQQUh4VnZl?=
 =?utf-8?B?U1FUQy83Y3o1UkZ6VzJEb2x2bWdkNENTWTR0TG5TNFRHUzRMUXBvVUdMR2t6?=
 =?utf-8?B?UmFCdG4rZ0VQU1l3eldOWWxFNmVlQ1FGei9jNVdFc1JqbVY3ZVZHNmtmOFpF?=
 =?utf-8?B?Zms0ckVEOWNnc0R1M2JwUG9udjlxTlhtNG9ycDVQbFRXVy9uc0dldW43YUQ2?=
 =?utf-8?B?SFcrU3JKZXFVR1ZWRWdOS2s5RmFLMEtkRkN0MENPOFlDeWxpVzVkemp3aU1J?=
 =?utf-8?B?T3U0dUtCb2ZFdEN4aE9jSU9SbUZXOW41SHJnVUFaS1lTZTVUanpYUjhNSlc0?=
 =?utf-8?B?WlZyWXA4dFBvcTdsTnp4MTZ6K0tCbWtmZU9jaUx4aDdFN25ZRlN4aDBuRE9O?=
 =?utf-8?B?clorU08zdHMwdW9CTVVwNzJUQUJjcnRHaW1BazlCLzZYU2FQaEovRkFoL25z?=
 =?utf-8?B?T3JTRUplN1N6TlFqNVozN0NweW1LK0RzTVA5WllhZXAwb0xtUnRtb2xqYldG?=
 =?utf-8?B?bkdnWlpheVprYkdIbUZwbWMreUMwYXEvYTF5YTBYc3J3SHNzR2M0YXNFdFRh?=
 =?utf-8?B?dFdVa0ZFNmk4U2tEYTFMdnhyVnJBZk55NDlScHoyWkVldTFsOWpHc0haOU1O?=
 =?utf-8?B?cnZZcVExMDBvWVpsWCtYMXFvcVJrbUxJR3Bma0dHMXJvckhxTCsxQUI3d3Ri?=
 =?utf-8?B?MHhlZ0FSVzNtUk1mbnJoTXV3MytaU1MyQ1B4dTAwb0ZWNlNTWC9CU21saVVF?=
 =?utf-8?B?M0pyVDZVc09zT2d2eHRkTFJGKzZlYlJjYURyMUNlSFN3THl3MTc5a1dEM3hJ?=
 =?utf-8?B?STY2WkFRL2lMT1piQlh0VEJlNmZiaWZNSVg0aGVEVHhhRk5JeW9kT1o1aUtH?=
 =?utf-8?B?VWd0azNMcnpzSUN0RitSdG5CWFA3K0NnVjBCYzNMa3hzZVZWZ0ZYV0NFZXow?=
 =?utf-8?B?UzVPblhXY2R6eXJvQ0JDeVpBVnFmOHNJemwyMkdJbkw1UkhTMG9VWm8yTHIz?=
 =?utf-8?B?Qjl1dExRT25wVk5ycUdTZEFuQk5zZnE5ODlSY2hxQ2NFaHRkSjlKVmtsMlVv?=
 =?utf-8?B?VEJoUnROU1FFZ2E2TVVnRlZLSjZ4ZHBhMktuWmJhVWdYaDcxSExNb0p3UDV2?=
 =?utf-8?B?S2tua3NhNmhhcEVzaVl2Z0FEbmNMdWg1bDczeHMvWWV1V01KVGMxUTByR0Y0?=
 =?utf-8?B?TVZyVDV3eGh4OHZ6TTZnMEZ3VGVQM1JLQS9TaDZNU21EcEt6NDQ4U3RtZzRx?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7917b3-9229-4dd0-9e0b-08dd86680160
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 15:19:02.4991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+in0T1LH0uVs/pXDAdhLUyFUL5jy8q4RBMacblbMKoALTDCVmL82IYf5DTBqy84Vk1wd3+FQOrFo7CS6SkBFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
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

--------------U9b5AQVPHinfA1qlPwY9tlZi
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26-04-2025 01:04, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/xe_pmu: Fix frequency stashing issue
> *URL:* 	https://patchwork.freedesktop.org/series/148275/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/index.html
>
>
>   CI Bug Log - changes from XEIGT_8339_BAT -> XEIGTPW_13045_BAT
>
>
>     Summary
>
> *SUCCESS*
>
> No regressions found.
>
>
>     Participating hosts (8 -> 8)
>
> No changes in participating hosts
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_13045_BAT that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#623
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_psr@psr-cursor-plane-move:
>
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2
>         other tests skip
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>) +1
>         other test skip
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
>
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +32
>         other tests skip
>  *
>
>     igt@xe_huc_copy@huc_copy:
>
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>  *
>
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>  *
>
>     igt@xe_pat@pat-index-xe2:
>
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#2838
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838> /
>         Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>  *
>
>     igt@xe_pat@pat-index-xelpg:
>
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>  *
>
>     igt@xe_sriov_flr@flr-vf1-clear:
>
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html>
>         (Intel XE#3342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342>)
>
>
>         Possible fixes
>
>   * igt@xe_module_load@load:
>       o bat-dg2-oem2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/bat-dg2-oem2/igt@xe_module_load@load.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_module_load@load.html>
>
>
>     Build changes
>
>   * IGT: IGT_8339 -> IGTPW_13045
>
> IGTPW_13045: 13045
> IGT_8339: 8339
> xe-2999-6e67a7af43567bb9f23fe156fde7efa3d214fd20: 
> 6e67a7af43567bb9f23fe156fde7efa3d214fd20
>
these failures are not related to my changes.

Thanks,
Anirban
--------------U9b5AQVPHinfA1qlPwY9tlZi
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi,<br>
    <br>
    <div class="moz-cite-prefix">On 26-04-2025 01:04, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:174560966881.12518.13969893378054961881@c664b1dc75d1">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/xe_pmu: Fix frequency stashing issue</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/148275/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/148275/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8339_BAT -&gt;
        XEIGTPW_13045_BAT</h1>
      <h2>Summary</h2>
      <p><strong>SUCCESS</strong></p>
      <p>No regressions found.</p>
      <h2>Participating hosts (8 -&gt; 8)</h2>
      <p>No changes in participating hosts</p>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_13045_BAT that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623" moz-do-not-send="true">Intel XE#623</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-plane-move:</p>
          <ul>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
          <ul>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send="true">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849" moz-do-not-send="true">Intel XE#2849</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
          <ul>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +32 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_huc_copy@huc_copy:</p>
          <ul>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255" moz-do-not-send="true">Intel XE#255</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
          <ul>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-send="true">Intel XE#2229</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xe2:</p>
          <ul>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977" moz-do-not-send="true">Intel XE#977</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838" moz-do-not-send="true">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelpg:</p>
          <ul>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vf1-clear:</p>
          <ul>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342" moz-do-not-send="true">Intel XE#3342</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>igt@xe_module_load@load:
          <ul>
            <li>bat-dg2-oem2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8339/bat-dg2-oem2/igt@xe_module_load@load.html" moz-do-not-send="true">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13045/bat-dg2-oem2/igt@xe_module_load@load.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8339 -&gt; IGTPW_13045</li>
      </ul>
      <p>IGTPW_13045: 13045<br>
        IGT_8339: 8339<br>
        xe-2999-6e67a7af43567bb9f23fe156fde7efa3d214fd20:
        6e67a7af43567bb9f23fe156fde7efa3d214fd20</p>
    </blockquote>
    these failures are not related to my changes.<br>
    <br>
    Thanks,<br>
    Anirban
  </body>
</html>

--------------U9b5AQVPHinfA1qlPwY9tlZi--
