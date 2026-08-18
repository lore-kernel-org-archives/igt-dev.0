Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BB7C5DF74
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 14:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2357910EBB3;
	Tue, 18 Aug 2026 14:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5SsimNZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201C810E2FF
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 14:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787062523; x=1818598523;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5YUwSLMxB64spiQLzG2UHtwuZoCyuunQt1xoFJnBhBE=;
 b=L5SsimNZSvHmmF69GMP7Bmc8VxqFdLSu3bjiqJxzfmv1CFuATP2mgJ+/
 u0969/uU4vr3a8GDBcaEGBi50p8LVUt1jBd4k+okxmo91oiufVNHPwCI7
 nBCX8GsJQZjhY2kq/ziS69o0MeJHj+V3XR5hoqdgtrInh1oOfHdp4Jfnu
 eDbHZ8WWQKx+wHQS6EejUwdZ748PeMDbAd9ndvjKLpNYkDKEjTmDmIUBf
 0hyZVae8FVTMAryn5HNqGpXIxYR+90X27cLECI+t/UEN8NYAsfsADZPNS
 mvmDbGE5d8FVemQowEYO5I8UR5sSnoM/1fgZXOofimcem2KXUk4PtvmQG A==;
X-CSE-ConnectionGUID: zxTT+L5fRyCNNUigCXOdmw==
X-CSE-MsgGUID: +rkpOvbRStWnPJRrYrc37Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="97892476"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="97892476"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:15:22 -0700
X-CSE-ConnectionGUID: vLKnu8rfTIqEnmoUtNxevg==
X-CSE-MsgGUID: w2Azt80pSV6sMrfm2owehw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="263912073"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:15:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 07:15:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 07:15:22 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 07:15:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm4aue+ckMOyP3vPRH4HS9l7lvPig8kjw38g/of9eJebN1Sg+HvLtKdPsCxC8JbTNB36UtZMPihTLjFS6nnqGtP9AvKZuYg2YcziVihpUqf49jVmvGYxrB4wIZg0+42ivmD9bjBWOblZZY4ve4urSx2SCfjS7Uorqik+d0E5uZ53TKdWZDfxk80G6LyGtaIhXM49djU4RcjZh5O/BXrtJDrWzDpmNrnPoJlBr14sEqT2umVG/OQYhVok6cCZKonpQuAJPF4a1gtlcgWaDHqK6reY//o5O+/5Uom0jLTnVKX+lE3QVVnPkZBlXr8i+++Oo9N/Zq6exfhpPgWef4YDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDDjPSjOwhjNhLACCCxIA9UA0UQsOnVs9mCm3tbiaNA=;
 b=C5zQc/2precO0IWjcXuABiC1dspGlM1/a3JjTtKLudYWjkJ7HQxVrSlRSRSau2ct50GEUITLotb+vg+xM/f0R3m+ml+mNzxVwiUsPSs5cqN6utPPEOLT4gIEoBMX6M5XBORmv9j6djMzwss9mxAGZIBTYurUKngplE0g0jvxfSaxBh6OvIlwla3o0E8JbOfWBFG6EcbtnZdLD9GcXLg7+N1D0FA1ocfDo9DAwv80RoXysunHyuyrM+gTIibHoaty2q7qYPv87Y+fDelk28sEM6ADpb34QcDNrPycSAhe+Ezfhd4J9Pi2lq+XMRQ+yr/xAWvtquBOwYEL10GoxbXRTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by LVUPR11MB9857.namprd11.prod.outlook.com (2603:10b6:408:38b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 14:15:19 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 14:15:19 +0000
Message-ID: <0e0ffb9f-21ac-4936-aaa4-9bea92c2dbf8@intel.com>
Date: Tue, 18 Aug 2026 16:15:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/6] lib/xe/xe_sriov_admin: Lower priority before
 clearing timeslicing
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
 <19f3ef4174e856a83b6915dc19e09da4bab90a5a.1787056235.git.marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <19f3ef4174e856a83b6915dc19e09da4bab90a5a.1787056235.git.marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::17) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|LVUPR11MB9857:EE_
X-MS-Office365-Filtering-Correlation-Id: 51fc0d5b-7b26-4e5b-4860-08defd332185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: F8lkVsydyVXcuAT9IW6x4aPsLRXu7jq//IcUiexjXPQmMNSP7++gaWHTGwkdNR1iZGS8T4hKN948q7KMg2ejO6hvLBptLoXKPHjnV1xDplwB0B5208wTiYbUFuKw0kVTEyMHzks9JTcS8u5ymY3sgx3hBmm4wJiC4Z2Mska3tE2nplhvdzTFqs9XnTNUY1RWNcKPr29YIqMBh2xsQ9pNHbYFbepeObFQnj/3ZC9JyyVx/XpBvaY2h6chrD96H2xyUSS+ZrZlYSiWwLXmKT6yR0QjZYHlXqVpfA3XoShKU6F2JwT7bP7YrBnJ4gLjSHMKpHPFf3aX3UnblaoOr5gDLkREQYLpLlQjrmXkZPPRNvGUwSgoTVWol8t3uA3UXvyNtn9zXgWOVs4XaKHI3CSdduo5HNtY4czJYzV+1PyUDhmwdyawVm0x3lzAyV37zkWrO5giMfLb+Q1yIbAqxfRoohMeDG3wQxB87W/nyvqrgYHhu5jq26b+PBpczH7ZuES/3c96kKlqE3BvLr2KMBiQ5DP7Sq5opZtRG74DRKKWH3S+FCZtH5EzxnKKLEFGAhbkGyrFLm7xP3U+kuy2g0db9u9qDzG9fbJ3IRKms75FLqS94HbHnLNWL1zOm3F+hewH8FMMF7S8tIq3XFITJAGwdG8EOjBGFOEAV7tBP1v+7AM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y051T3dqbU9JeWs1SDJKMGNuL1Bqc1RoTUV0R3ZPUE4vTnJIcjBaT25LWlM3?=
 =?utf-8?B?eHhKZHZ1SldPSUtUdnlhSzhJY1FYVWVnRmhCRFVqTlgxMEZMT1plOVpVWklz?=
 =?utf-8?B?bHUwMzMyaW1WVHlUSi9ReWp1MU5WeVNqUDRHVTNwaWRQR2JTb0lwWHh6NzEv?=
 =?utf-8?B?QktycU1rcjV6WEV2QnIvL0h6eVRaaW5aNjI0cFJlRS91VS9ZMDJKVStGTXow?=
 =?utf-8?B?Rk9JRmd6ZjkxV0MyZzNUczI0Q0pOeGhHbTNhd3BGK1JNcVNVaGptOGRTSUhY?=
 =?utf-8?B?UzFCOFl2VFJBU0d2dHdFRUdYdTRNUkZKTTh6c0pMbWZ6WGxPdUFIcE1IejU5?=
 =?utf-8?B?ZGUvWGVUNWh3bFlUMTFlOFVuWXJqOWNWT2I0TEtRTGpHS1MyWGJhbVRmWHRR?=
 =?utf-8?B?L1NObDZtdHJtb3lzd1VMVDI0VENoR3dNUlVFSEhnc0hockpHVGQ5K2tBaDl3?=
 =?utf-8?B?SUpwMWlrOGxSRElKK3hjMUIwaEFiY0pocGIybklZeGFPZ3pZcnFSU2I0RWc2?=
 =?utf-8?B?Z0ZEbmYzOUpBZWN3MWpZQlVneVpCQXlpUGF6ODlYTWtUODN3Q2pMb202WXdK?=
 =?utf-8?B?THRUMWs1a0trVWJEMi9XbVRIdFZrQjRDUFZoT3lkeGJqdnJ0UlVPN1BjeFMx?=
 =?utf-8?B?MEp2WksrZW1MRDFNVFJoNFZBU1NDYlVzRHhITlp2MjdxdWZFb2o2QTB3cUh2?=
 =?utf-8?B?L0VnSnUvWUZncGV6WkNuWm10L2RCVmcweXRxdWp6VEhvcytJTkZFeTJCaVA5?=
 =?utf-8?B?Y0UzWTZaR3MrN2lMOXB6TUlvNDg5VTFTa3ZvcCszWWo1Nk5IcDZEY0YyQWpB?=
 =?utf-8?B?V2p2UURnSUFpQk00YUpkR1E1c2d4M3k4dEs0cnRnM3ZuSTFHMlcwbDJqVkJU?=
 =?utf-8?B?TWJZeFBIYVRib2dZN3BlOU9KY1k3TEhkR1V5ZU5nYzhaenlKUEg3L0pBc0sr?=
 =?utf-8?B?YUZqU0pNQTl3NFQyRGtOMktrckN1UkUvWUV1dU1kWXFIUGxVVnpVSUUwclFS?=
 =?utf-8?B?WG51ZnNkN1RpQjArNVdtYjNxNTg5U05oUURPaUFWVDVjWTZha1ZMWUdYVGYz?=
 =?utf-8?B?SDFhSStBYnRWaFVsb2YyMlZzcHE0RWxQUklSRkgxNkNqUm1uSnBtLzBTZkp1?=
 =?utf-8?B?OE0zNUlkemlSWE1Qc3RodGcyN2VCM1pZSHI1YWhJSWxCRzR1TEFmUEN0bG0v?=
 =?utf-8?B?VjhnNCtCbmJNdFJTM3BNOTVtUWJvU3ptQUFqVkFsRjl2TlpVNlZSVGg0OFBC?=
 =?utf-8?B?MjNYeG5OdmhOT2dlRlRCYlRtOUNDL09Ma2dCUWRUUy9YRVRmQU5CQUJ2R1c5?=
 =?utf-8?B?RE14QWpBTFk5YUJidURKM2d1MFZNaHdWeHpBK0VOTm5sVytCRVFNcUZRUW16?=
 =?utf-8?B?Y0xsSUUzcXUwMDFVOStQUDJCWDMxeEFJajVBMGlOMFhQNisydWxsODhRVEtS?=
 =?utf-8?B?R1FsSklLSXdsY3JTWE9oVE9vVVo2c1ZYNHRPMHVrQWpzNzhDVSszZzFkb3VM?=
 =?utf-8?B?MVN1SVZoTzNCQVg0SFFKWm8wN3IxNVFiVGcwTkVsZWsyUk1MQU5hUXowZ2My?=
 =?utf-8?B?QUdNRjcwUjc3VUNUVzNBYVR1NGNSMFdIeUhISDR5RmtRaGdaMk1nTnRsRWRJ?=
 =?utf-8?B?emVKNDc5TnBUWFNwa0x5U2xkc01JbW0wNGc1d1hnODlYd0w1NGxnOUdUaDV2?=
 =?utf-8?B?TFJIamxsOUVJNDducENGSXgzcEZXdklMWWdzWFR6ZlhWcVBXSzBDb3V6T2pI?=
 =?utf-8?B?Ky9kMGtuekxMeVJBYVdCTkNKcmZtNC9ySGZ1NW9IR1dkS0xMaXhUQSs0OHhk?=
 =?utf-8?B?ODQyMkNWUENTcmI5T3JVOFpCZ3pMOWovWEdMTW5IdVpZbHFVd2RUUUhUZVhF?=
 =?utf-8?B?NGFUSEltenExcFQyMVJRek5lMlpRZit1VllQbzdIa3hTMEtUUGZyMHJ2SEdE?=
 =?utf-8?B?UXIwUmZLOWQxQkpOaFdoLzMxQzF0MnRYSFRuK3U0R2d2TXNnRTNlNU5ReUhS?=
 =?utf-8?B?Q3Y4Rjc3em8xbWxPQXlYOUJXN2JNZzkxRENqMVo5OTZpRnMwbnRjNUdmTXhG?=
 =?utf-8?B?UFZkeEQrWDV5ME0vZkdZRUdZVnR6N2FLR1NGSUhMY3ZvM0h5VHR5SGpTN3du?=
 =?utf-8?B?VGQzMXQ0SXBwSlRBVTNBUEh5N2lZVTB1TC9xa3JuYlNnQjJ3NVVsa0FHcWVQ?=
 =?utf-8?B?VkZWMDlqTFFyWmtBaEpVU1dYTzZNS1NWMmJIQ01wWFF4Z21vV0ZSclUrN21W?=
 =?utf-8?B?ZUNqY0wyeStyQWt2M01aNWx5eW9uYklUcW1ZWDluTHNtNVdYcHFFMTVCam1T?=
 =?utf-8?B?VlU0WEZQL2tycFdpNjRXbVRndmhuSk9DQk1TQTZQK2xkckRwdXRUQT09?=
X-Exchange-RoutingPolicyChecked: EqcHQG3ZzBhlt4u4oUojbW8IiscSpSqKl7pUKux72A0v4txU9Vwumom0NVFX+qMUCZYew1XBbh6dgxMaCNrKak3NoI3mQUBQeNrd2WbDoOHeiFFQgAf2ENdCA4caA1QjSU9YhB18R5oB4sZajKVOnPlVr3VVwCmVfqk37eSNGpJwpqW1YL3xf9XfJvsqzD2DtxKqHqxbbCWxvrC18gRg+SA/1jpcq5BYIykvDfxTI2B1Fa5LyiGHNIcX4wG2UCRfqExyWc/MY20woR8pU8SwkVGu1JaHonQRUY0fEE6/WGjT2L9lL3tdIdlmYZtm85i0YXqwoc5uI974HWQSJxJilg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fc0d5b-7b26-4e5b-4860-08defd332185
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:15:18.7479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9gzaFC+0p1+gAGvIA50UI1EdJj3YfxQD0wrnSYnTJpLkpWRC6nRVkIut1ha+AgWNDoJ4ZlgNpmkrl6u2LkN7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9857
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


On 8/18/2026 14:39, Marcin Bernatowicz wrote:
> Zero execution quantum and zero preemption timeout both mean infinity.
> A function left at a scheduling priority above LOW with infinite
> timeslicing may never be switched away from by GuC, which is a risky
> state that can be left via PAUSE/FLR.
>
> The restore helpers cleared execution quantum and preemption timeout
> first and only then dropped priority to LOW, transiting through exactly
> that state whenever a test had raised priority. This is reachable from
> xe_pmu, which restores defaults while VFs are still enabled, and from
> xe_sriov_admin_exit_cleanup_restore_sched_defaults() on abort or signal.
>
> Lower priority first, then clear execution quantum and preemption timeout.
>
> Assisted-by: Copilot:Claude-Opus-5
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   lib/xe/xe_sriov_admin.c | 32 ++++++++++++++++++++------------
>   1 file changed, 20 insertions(+), 12 deletions(-)
>
> diff --git a/lib/xe/xe_sriov_admin.c b/lib/xe/xe_sriov_admin.c
> index b03e77b08..0433ddcfc 100644
> --- a/lib/xe/xe_sriov_admin.c
> +++ b/lib/xe/xe_sriov_admin.c
> @@ -547,6 +547,11 @@ void xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num)
>    *
>    * Resets execution quantum, preemption timeout, and priority to driver defaults.
>    *
> + * Zero execution quantum and zero preemption timeout both mean infinity, so
> + * priority is lowered first. A function left at a priority above LOW with
> + * infinite timeslicing may never be switched away from by GuC, and can only be
> + * recovered by PAUSE/FLR.
> + *
>    * Returns: 0 on success or negative errno on error.
>    */
>   int __xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num)
> @@ -554,6 +559,12 @@ int __xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num)
>   	int ret_eq, ret_pt, ret_prio;
>   	int ret = 0;
>   
> +	ret_prio = __xe_sriov_admin_set_sched_priority(pf_fd, vf_num,
> +						       XE_SRIOV_SCHED_PRIORITY_LOW);
> +	igt_warn_on(ret_prio);
> +	if (!ret)
> +		ret = ret_prio;
> +
>   	ret_eq = __xe_sriov_admin_set_exec_quantum_ms(pf_fd, vf_num, 0);
>   	igt_warn_on(ret_eq);
>   	if (!ret)
> @@ -564,12 +575,6 @@ int __xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num)
>   	if (!ret)
>   		ret = ret_pt;
>   
> -	ret_prio = __xe_sriov_admin_set_sched_priority(pf_fd, vf_num,
> -						       XE_SRIOV_SCHED_PRIORITY_LOW);
> -	igt_warn_on(ret_prio);
> -	if (!ret)
> -		ret = ret_prio;
> -
>   	return ret;
>   }
>   
> @@ -589,6 +594,9 @@ void xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num)
>    *
>    * Resets PF and all VFs to driver default scheduling parameters.
>    *
> + * Priority is lowered before clearing timeslicing, see
> + * __xe_sriov_admin_restore_sched_defaults().
> + *
>    * Returns: 0 on success or negative errno on error.
>    */
>   int __xe_sriov_admin_bulk_restore_sched_defaults(int pf_fd)
> @@ -596,6 +604,12 @@ int __xe_sriov_admin_bulk_restore_sched_defaults(int pf_fd)
>   	int ret_eq, ret_pt, ret_prio;
>   	int ret = 0;
>   
> +	ret_prio = __xe_sriov_admin_bulk_set_sched_priority(pf_fd,
> +							    XE_SRIOV_SCHED_PRIORITY_LOW);
> +	igt_warn_on(ret_prio);
> +	if (!ret)
> +		ret = ret_prio;
> +
>   	ret_eq = __xe_sriov_admin_bulk_set_exec_quantum_ms(pf_fd, 0);
>   	igt_warn_on(ret_eq);
>   	if (!ret)
> @@ -606,12 +620,6 @@ int __xe_sriov_admin_bulk_restore_sched_defaults(int pf_fd)
>   	if (!ret)
>   		ret = ret_pt;
>   
> -	ret_prio = __xe_sriov_admin_bulk_set_sched_priority(pf_fd,
> -							    XE_SRIOV_SCHED_PRIORITY_LOW);
> -	igt_warn_on(ret_prio);
> -	if (!ret)
> -		ret = ret_prio;
> -
>   	return ret;
>   }
>   
