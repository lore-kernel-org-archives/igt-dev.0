Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E53C5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 14:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFA910E2FF;
	Tue, 18 Aug 2026 14:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZNWifof";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB96410E00B
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 14:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787062491; x=1818598491;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=96kVcwsYdBHKkM3QgwR5nH7SyPiofRh5xZjvJaF47bM=;
 b=SZNWifofN1FCBC50kThpnpbFRyD9XLV5ADvGnrI51ZciOtdYAguX3pOm
 kohj09xMnj1RVcUlbkClXauxQY7TmqioSkmJ8nvioKGjkAuwgnpXIgysV
 9UMYiUb7+rq5l++QXo9qYytlQhk5Gt/6WDCzwPFNGKwTSpbGd1F5cUGgF
 3yaKR9T0qDan0q4v9sBIRzXCWwWiwFTc2k+F1ueH0heANjqw/uPqHMUHB
 vKVQWumMiogtJ+KH757DgGTKf6wIyXxJumBvfIMk044xtcdvOfmu+l39Q
 1bOs+Hn7rFqRZ99MExXDra4Y7loqJog4+oFDbENrpI7ylKZCTOlJwoW2v Q==;
X-CSE-ConnectionGUID: GwdMSG+sR3a3+bIlaPlIww==
X-CSE-MsgGUID: SVg+PlXTRDuEsmFgK6SjIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="99076339"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="99076339"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:14:50 -0700
X-CSE-ConnectionGUID: mjL6l6tnRhqsQVm/hb8+LQ==
X-CSE-MsgGUID: /aWD0ku9QWu9j4nHDeXo5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="288747722"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:14:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 07:14:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 07:14:49 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 07:14:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emZqwMpWQqE+0DkdADmNd+8svi5eJuQKDMLxy74EaTXTeO9nz4alXMPtK2cR6PARcNKFPDOlbHFrPxa6uQitH9i3gsB4Kcr2Ab6tJ/uC7aygc2iLrmV7N9h00qhENEiYUHuTQFHMkxC0NRWk2FNVU8CPqUgwsXigBebRchz+9yJueSx6tnkvb94O6qw8LeUa7PLOg4tPiZFn/sUup90hOhwekOFkmciV8JzyHvlt6IIKAMLdbGMaJWcj9PMyXEtBOuLf7H+zhYUKjTd8WlNpa1na8Pn66bqw7N8f6c3HZLXGyg8cxJJNA2KsDD9eWTxJkc+5Hyi88R9DQLpHsF7HXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCWWvWFVwQaqa1jH738O+Bskwxq2Vo+vojAVeV2rvWg=;
 b=IrYHgb0b4m5fGd4qcB+fqffiSVrYAuOXOKswesYaZVibTrQh+9Zb+bQ3FV4FONF0/ep26UFFIyJNuGWQopm5xM8prW/MUMHrUxVobxbBV3to0iwhoO3r2HkDI7VtaKKVdDMA+PA9PNbMIckyFsf7DZ+XpFPFakFWrsjrVXPHzGk0pvGJgwV6MLLd1eVbPBwzXoHQm0nxWm9x/c2jHrDTCMiG2Zt7X6U0hMpXSAfkHvKozFTXHYW686o6poN0frX+bsb+gSifO7AeUrnqcyhShl8Wf4sRK1C0spotXsVTknUQxjvR4Jb/TK5m2s3JBvuQ2VL0MvSqrypogrS3i36Wqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by LVUPR11MB9857.namprd11.prod.outlook.com (2603:10b6:408:38b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 14:14:47 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 14:14:47 +0000
Message-ID: <27c3e2de-4dbd-41a0-bff2-8b05409a6a6e@intel.com>
Date: Tue, 18 Aug 2026 16:14:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/6] lib/xe/xe_sriov_admin: Rename restore defaults
 helpers
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
 <b9f49ee15df2d3633b4bccaf72ce2df0a4b66fad.1787056235.git.marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <b9f49ee15df2d3633b4bccaf72ce2df0a4b66fad.1787056235.git.marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0263.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::36) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|LVUPR11MB9857:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c12501-2c65-4480-1ac0-08defd330f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: fJpYQ6hdI0GBRgnQ+1iKFXxfGdWSGYafjgOGMDG0UfoQuidgUHvEb3Msz5q8Pc29/8aqYutRywVXNvy/v1kiC6HDwQiLOtulu6UEk2Sj2v/SihRxs67r+GlUxSRP7+U2Pf13NTEnL2kXw0rRUfP8MbRAiKSiHSBH72O4fAkg0LVbLPoowq61N/FiAFEG6ylc96kEHZOtXEpCYEqlZzu633YwIB4ujyzbU8otrujHSwb/FXEyib6ejZL30p/K+MPPS9UAgzgjV+f5U5+m2/UWqG4IW5GsJ1yd8kDiJtEzeUf/1lnDm+kisQHz6LeN2sHMoSsPRuLAzSJxc5COpqXpJDHueNLU58q3FLL6dlyuUhp+z5GHLNMvq2hLqXyALpBNRTXHx0ohrTHs9fYO1AsWhSxCANE7bgGjmdFSppg+ToZR5tAaAqS+R7apZvAsBRY7ACBBBtL8+TdG3ZfAnKA1OFvqfLGCxReTxNrcPrnC95SWWPEF+jllpmHaktNsr1zhXoCUUoEEjgBIDngV/gXn5CbBZ3t6Ip6LCCV26dbnYKs10qE//viTxh/mWBvLTLtU6LPFTFwvF1dfeIHQqGJatVgCAulBrPwRxDMpu9s/EDwSSjL7H38akWL++ZVQP7GsQ7jfRtT7h2N6m/YXmTWW5Kwvdg3elckVDHHpy4ZbolA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFRjUzJHM0F0ZWVjTkdCTTR2R0VYS2JyK0U2THo4enlwMWx4c0wrSFBXcDd0?=
 =?utf-8?B?d1RXd3RXVXdLbkE0ZnJwaFhQOC9zalBHZWdlLzNNSEVTdjVqb0pjcFRNOWQx?=
 =?utf-8?B?bUF3bGVMRzlUTFFST1NGRXdxbVdMTGlyb2FycUdQb2t1RFJVNUV0UStkeTZF?=
 =?utf-8?B?WU1ONkVvWkFlK0FDRE1TbnllbFNETU9TQkJHODJheU5nUDBrRGJIVXJSOG93?=
 =?utf-8?B?eldHNWZlSVRpRzI1VlVyZFlyN0I5aG1WWWRUMzBESkNVL01YT2pLTEZsaUhK?=
 =?utf-8?B?a0FUN251T3hFbmpGdzl2WDU5dHlpTGpETTMxVW5nWmNVamtqd2hHbncvT0cx?=
 =?utf-8?B?ZVgyTjFWWXY4ZjBvUWZjbkN6RlVMYnQ3akJaZUM4MWdSWVFpSHlVZ01JeVZI?=
 =?utf-8?B?UEtQaW44OG02bzRoMko4ZWNzN3hlblJPdm1xbGI4cjdRQm9waHBLK0hFNUhD?=
 =?utf-8?B?cTEyUXEyREp4QTlLNzFNUTJib3BlNDdsaVVxUDQ0KzFKTGNKd1k1eGc4RzJL?=
 =?utf-8?B?VnhIS0Y4REN2RUhXQWI3UlMrMW0rSlJ5WHhFOTlBelZueEhxZk1COW9tSmJU?=
 =?utf-8?B?R1RqMWFRMVNsNnJNdUo4WVd0aFJrZ3M0KzJMeWxKbVQrZnAzS1ZLcEZ0VjRJ?=
 =?utf-8?B?SEZnbm44aktuYjBSQTVFL3dLL1lQL3M3NkNqVzFjUFNFK3pjc29WMEJPeGxC?=
 =?utf-8?B?dlI3aDE4QnpnZmFuUHBySEQvNWNwYXlXQnVtbitFeUFFU09icnhUL28vcUpE?=
 =?utf-8?B?V1drUVNPcXpZYklkQ2o1ODU4TkNvY3lDKzM4cXBIOVM4alBzTmZnbEwrSzcx?=
 =?utf-8?B?ZmQ2WnJZQitmUXluc1J6aW1zMVRGL1ZvSk5WQWt1V2Y4bjJFQm80U2xLcmxj?=
 =?utf-8?B?bEVjaFhiY2l6NWdTT2VJOS9paUpqdkJXZFM5ZDNzNmRNSzhrUFRDaXhVLzlk?=
 =?utf-8?B?U0JGWnEwTGZIUEsxZG1peHFtMXJVUXBENWg4am1EQytPalJLK1M5aXpCSUV6?=
 =?utf-8?B?ZndqalBMZno1NXlXQXRSa0ZQaXVNQnppQ0tlMnp0c1JOTG9XYnJRcUZhNUVD?=
 =?utf-8?B?TUdsUkxURXVESUVnUVpyTTlvbUFTRGZCRTlqNTNVaWhtSGRpY2F2OTNiN3dW?=
 =?utf-8?B?aTU3Y3hseURqa2VMVW9OamVLcU1vOHIwRXI2UTRxWkJ1TjcyVWlQQ0sxL2JJ?=
 =?utf-8?B?OUc4L1dOUWhBczRJcjI3UWNpOFhzYlhCVURyUUkySjc2MEhMSWtGaWRlaEtQ?=
 =?utf-8?B?QWRsdS9CYWNDbGQzQzdwcGJkdndNblZQQ1ozaU9UeHk1VDNrd0VRVWhLUzY3?=
 =?utf-8?B?OGdCTWtzNzQ2MTBqOXp3VDBYTGdpbk4xc213NnNvdU1uZzNCZnl6cTdvOGRJ?=
 =?utf-8?B?U0haaGNmL1NCZUVST3JLb0lvWEpNczJQbVFNTHA3UGx5Um5iWXhWbEtURjNt?=
 =?utf-8?B?SjI2NG45MHR0aHZUSmpoV0syMEYxMkZ5ZHdpVWRQbjJHL2k1VXJQZW1vQzVV?=
 =?utf-8?B?dk1DYk1RMDc2V0FJQ1ZDTEtqaHZWRmRFbnJsaFE4Yk1ncStFK1Y1NXNnd3NH?=
 =?utf-8?B?NnE0UmgwZ2R0ZVhMWU8xY2U5aTNYWFFuTDZWY3IxbWoyQTYyRjBSZjFXQjVm?=
 =?utf-8?B?ZzJVNjF0OE5OaHRqbDRZazBuelAyaGw1RnZuaW0yQUx1a2FQRmU0b2dNbXFp?=
 =?utf-8?B?N1ZmUTFvNi83UGVCQ21QWXNyYithUWxNbmFTT1FWenBMSlNhZTc5NDdxTmVm?=
 =?utf-8?B?Q3JBZmRjRkkrZ0VRdFVHVnVLRlUxWjk0RnNzVHNvVlh5NWxyNVA5TDduZFJV?=
 =?utf-8?B?aWFMUE9SNS9tQjJ6ZVNtd094M081VHBHOEdid29lSEVseWhhbUViUEg2dWlN?=
 =?utf-8?B?OFlPbzV2eFBsQ2ZHR3FkR3R3VlBoemFldjJhV0UrTHZweXppRjczSER1K2R2?=
 =?utf-8?B?NlZQNVdOcGhObUd1enRRZEgrUjZ6STBJTitKL3BuQXdrNys3K2tNWWx5amVm?=
 =?utf-8?B?MVJFWkdwTjBPUEMyRk9YWUR0QnYzeHM3dHJyWXZWOEpVYUFMdU5RWXQ0Vzh2?=
 =?utf-8?B?U2tLUDlrc2FaR3QwVGpLc0xEcWE4ajhQLzdhQ1hxdEYxT1RON1JXMFpVSFV0?=
 =?utf-8?B?aWFFUHJ6azBRd2pWNytYeFpJTnh3bzlJeGdaZHE0Ykw4TU9vU1VYdHpGRlRl?=
 =?utf-8?B?STZsMWVyMTlPZGRsZGxIZXR3OFBPa1MzbklsbTVPU0xlU2dNRjdKMlJUdlR6?=
 =?utf-8?B?S2Zob1ZnZkdRVmo3TWtOVEgxSGl3OEFZN1RMcDY0R1IweE96cVVadTgramd1?=
 =?utf-8?B?Ykw5aEpRL1N0S2o0MytDOS9pWmxxTW1CbWdpaGFZUzB4b3B5WEd4UT09?=
X-Exchange-RoutingPolicyChecked: Hv4q/piw02uSLtnECwvA4ggpib8QZsz/uwxQGkLMIRTrlaY9/bgxgGbHV7PGhD/liwrRp0MrawfRfoN4o5gRmpOFTzisly5zNzd++43tBXbVGl+VeCncbI8lwwVeTjqg+j3YuaNuh/MNpTWZh82US28wdIZWrdAcD0Oru5FAxFYUdgaEBM2TGgBXjC1Fd1xn1JhazdY6sZk9Dj7hQJXGvG83NYUoxDSfGBBa/GjRu1XDz4zwLeNVgz904Ip/fZpaHbwj+9eCxpDgZ5/q+6vSvUYX8Gt5u3Hso1/xG/NHZzncLhL0WqNNBvDSQe35/Y5KZtOkLkRGQ8eJNZobOXzknQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c12501-2c65-4480-1ac0-08defd330f0f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:14:47.3121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyx76bW3c7CmDydApmNHPsHzXMUMSa3ThU73f7u/yhPq0TsTjU9c3eek19L1AZ166F/GKTFkZNieNyIr239k0A==
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
> The restore helpers only reset execution quantum, preemption timeout and
> scheduling priority. Resource provisioning is restored separately by
> xe_sriov_disable_vfs_restore_auto_provisioning(), so the plain "defaults"
> naming promises more than the helpers deliver.
>
> Rename them to say scheduling defaults. No functional changes.
>
> Assisted-by: Copilot:Claude-Opus-5
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   lib/xe/xe_sriov_admin.c           | 26 +++++++++++++-------------
>   lib/xe/xe_sriov_admin.h           | 12 ++++++------
>   tests/intel/xe_pmu.c              |  4 ++--
>   tests/intel/xe_sriov_admin.c      |  4 ++--
>   tests/intel/xe_sriov_scheduling.c |  2 +-
>   5 files changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/lib/xe/xe_sriov_admin.c b/lib/xe/xe_sriov_admin.c
> index 0e7ffb52d..b03e77b08 100644
> --- a/lib/xe/xe_sriov_admin.c
> +++ b/lib/xe/xe_sriov_admin.c
> @@ -541,7 +541,7 @@ void xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num)
>   }
>   
>   /**
> - * __xe_sriov_admin_restore_defaults - Restore scheduling defaults for a VF
> + * __xe_sriov_admin_restore_sched_defaults - Restore scheduling defaults for a VF
>    * @pf_fd:  PF device file descriptor.
>    * @vf_num: VF index (0 for PF, >0 for VFs).
>    *
> @@ -549,7 +549,7 @@ void xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num)
>    *
>    * Returns: 0 on success or negative errno on error.
>    */
> -int __xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num)
> +int __xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num)
>   {
>   	int ret_eq, ret_pt, ret_prio;
>   	int ret = 0;
> @@ -574,24 +574,24 @@ int __xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num)
>   }
>   
>   /**
> - * xe_sriov_admin_restore_defaults - Assert wrapper restoring VF defaults
> + * xe_sriov_admin_restore_sched_defaults - Assert wrapper restoring VF defaults
>    * @pf_fd:  PF device file descriptor.
>    * @vf_num: VF index (0 for PF, >0 for VFs).
>    */
> -void xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num)
> +void xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num)
>   {
> -	igt_assert_eq(0, __xe_sriov_admin_restore_defaults(pf_fd, vf_num));
> +	igt_assert_eq(0, __xe_sriov_admin_restore_sched_defaults(pf_fd, vf_num));
>   }
>   
>   /**
> - * __xe_sriov_admin_bulk_restore_defaults - Restore scheduling defaults for PF and all VFs
> + * __xe_sriov_admin_bulk_restore_sched_defaults - Restore scheduling defaults for PF and all VFs
>    * @pf_fd: PF device file descriptor.
>    *
>    * Resets PF and all VFs to driver default scheduling parameters.
>    *
>    * Returns: 0 on success or negative errno on error.
>    */
> -int __xe_sriov_admin_bulk_restore_defaults(int pf_fd)
> +int __xe_sriov_admin_bulk_restore_sched_defaults(int pf_fd)
>   {
>   	int ret_eq, ret_pt, ret_prio;
>   	int ret = 0;
> @@ -616,16 +616,16 @@ int __xe_sriov_admin_bulk_restore_defaults(int pf_fd)
>   }
>   
>   /**
> - * xe_sriov_admin_bulk_restore_defaults - Assert wrapper for restoring defaults on PF and all VFs
> + * xe_sriov_admin_bulk_restore_sched_defaults - Assert wrapper restoring defaults on PF and all VFs
>    * @pf_fd: PF device file descriptor.
>    */
> -void xe_sriov_admin_bulk_restore_defaults(int pf_fd)
> +void xe_sriov_admin_bulk_restore_sched_defaults(int pf_fd)
>   {
> -	igt_assert_eq(0, __xe_sriov_admin_bulk_restore_defaults(pf_fd));
> +	igt_assert_eq(0, __xe_sriov_admin_bulk_restore_sched_defaults(pf_fd));
>   }
>   
>   /**
> - * xe_sriov_admin_exit_cleanup_restore_defaults - Best-effort SR-IOV defaults restore callback
> + * xe_sriov_admin_exit_cleanup_restore_sched_defaults - Best-effort SR-IOV defaults restore callback
>    * @pf_fd: PF device file descriptor
>    * @sig: Exit signal number, or 0 on normal exit
>    * @user_data: Unused
> @@ -634,7 +634,7 @@ void xe_sriov_admin_bulk_restore_defaults(int pf_fd)
>    * XE SR-IOV scheduling defaults. Restores PF and VF scheduling attributes to
>    * driver defaults. Failures are ignored so the callback remains best-effort.
>    */
> -void xe_sriov_admin_exit_cleanup_restore_defaults(int pf_fd, int sig, void *user_data)
> +void xe_sriov_admin_exit_cleanup_restore_sched_defaults(int pf_fd, int sig, void *user_data)
>   {
>   	(void)sig;
>   	(void)user_data;
> @@ -642,5 +642,5 @@ void xe_sriov_admin_exit_cleanup_restore_defaults(int pf_fd, int sig, void *user
>   	if (!xe_sriov_admin_is_present(pf_fd))
>   		return;
>   
> -	(void)__xe_sriov_admin_bulk_restore_defaults(pf_fd);
> +	(void)__xe_sriov_admin_bulk_restore_sched_defaults(pf_fd);
>   }
> diff --git a/lib/xe/xe_sriov_admin.h b/lib/xe/xe_sriov_admin.h
> index 3db13c2ac..4eb9c83a6 100644
> --- a/lib/xe/xe_sriov_admin.h
> +++ b/lib/xe/xe_sriov_admin.h
> @@ -52,11 +52,11 @@ void xe_sriov_admin_bulk_set_sched_priority(int pf_fd,
>   int  __xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num);
>   void  xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num);
>   
> -int  __xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num);
> -void  xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num);
> -int  __xe_sriov_admin_bulk_restore_defaults(int pf_fd);
> -void  xe_sriov_admin_bulk_restore_defaults(int pf_fd);
> -void xe_sriov_admin_exit_cleanup_restore_defaults(int pf_fd, int sig,
> -						  void *user_data);
> +int  __xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num);
> +void  xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num);
> +int  __xe_sriov_admin_bulk_restore_sched_defaults(int pf_fd);
> +void  xe_sriov_admin_bulk_restore_sched_defaults(int pf_fd);
> +void xe_sriov_admin_exit_cleanup_restore_sched_defaults(int pf_fd, int sig,
> +							void *user_data);
>   
>   #endif /* __XE_SRIOV_ADMIN_H__ */
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index f4c03faa2..2d1bc1f61 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -991,7 +991,7 @@ static unsigned int enable_and_provision_vfs(int fd)
>   	igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
>   	xe_sriov_require_default_scheduling_attributes(fd);
>   	igt_sriov_install_exit_handler(fd,
> -				       xe_sriov_admin_exit_cleanup_restore_defaults,
> +				       xe_sriov_admin_exit_cleanup_restore_sched_defaults,
>   				       NULL);
>   	autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
>   
> @@ -1023,7 +1023,7 @@ static void unprovision_and_disable_vfs(int fd)
>   {
>   	int ret;
>   
> -	ret = __xe_sriov_admin_bulk_restore_defaults(fd);
> +	ret = __xe_sriov_admin_bulk_restore_sched_defaults(fd);
>   	xe_sriov_disable_vfs_restore_auto_provisioning(fd);
>   	/* abort to avoid execution of next tests with enabled VFs */
>   	igt_abort_on_f(igt_sriov_get_enabled_vfs(fd) > 0,
> diff --git a/tests/intel/xe_sriov_admin.c b/tests/intel/xe_sriov_admin.c
> index 8b400a01f..904c2ed7f 100644
> --- a/tests/intel/xe_sriov_admin.c
> +++ b/tests/intel/xe_sriov_admin.c
> @@ -347,7 +347,7 @@ int igt_main()
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>   		igt_require(xe_sriov_admin_is_present(pf_fd));
>   		igt_sriov_install_exit_handler(pf_fd,
> -					       xe_sriov_admin_exit_cleanup_restore_defaults,
> +					       xe_sriov_admin_exit_cleanup_restore_sched_defaults,
>   					       NULL);
>   		total_vfs = igt_sriov_get_total_vfs(pf_fd);
>   	}
> @@ -426,7 +426,7 @@ int igt_main()
>   	igt_fixture() {
>   		int ret;
>   
> -		ret = __xe_sriov_admin_bulk_restore_defaults(pf_fd);
> +		ret = __xe_sriov_admin_bulk_restore_sched_defaults(pf_fd);
>   		igt_sriov_disable_vfs(pf_fd);
>   		/* abort to avoid execution of next tests with enabled VFs */
>   		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index a2240e473..5e4001219 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -1470,7 +1470,7 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>   		igt_require(xe_sriov_admin_is_present(pf_fd));
>   		igt_sriov_install_exit_handler(pf_fd,
> -					       xe_sriov_admin_exit_cleanup_restore_defaults,
> +					       xe_sriov_admin_exit_cleanup_restore_sched_defaults,
>   					       NULL);
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>   		xe_sriov_require_default_scheduling_attributes(pf_fd);
