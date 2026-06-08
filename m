Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE5ECD8C92
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 13:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45B110F3EB;
	Mon,  8 Jun 2026 13:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2HJiW92";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53C110F3EB
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780926108; x=1812462108;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rRj8/KMmhStmjugKA7kItNpbu4Nw5QMqibw2GZuXdRI=;
 b=M2HJiW92VGAH508DnARyA8nMSzq8Bt7DdbWOdsEMw7wlaUzbmdL2GRfS
 PN3zmwFx7Ef7xkIxnunf5KGsgJiYbqh69V0/sRjdQplR4CFq2FRQmLUvd
 8qND9nb9OZHTdJgqMGH08nZLVvCL7gd+9SwUh0MFeF3XYE1YHyimEcyWA
 KIyCPGHm4/WEtJW8fe7XOV1ikZWIaelDwTi1xkW9VnDlz+j+iVQkOfvtM
 olxOInk7RgKpOe4kqN7bqTvwYpNhpyJRTzB6+fusUZnaUQ4tw4GMJBRA7
 fzLbd1wYXSnAr0ZAm3pTJl5M2EpXsYdqRiQOpAwf9iAEv+nnpmCwhk+ya A==;
X-CSE-ConnectionGUID: QIuBhCcESKOFn2ev54vJmA==
X-CSE-MsgGUID: rudnON+eSzGFVCvQbdYCVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80792580"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80792580"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 06:41:47 -0700
X-CSE-ConnectionGUID: DORqUV36SeGUYWz8Za4HVg==
X-CSE-MsgGUID: 3Oy+K9mESOWsd/e2ppE2SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="245609213"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 06:41:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 06:41:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 06:41:47 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 06:41:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwukQWmAtm9BkdvOW2cBsxV9ZN/UK3f09Qfq3ORbDfIUoeHUBfDmlZIHIcB7xhDJU2Mhsc1s0FleppEb7orZZBMgR5USZRpurKIqVEivhiLSjao1lwieRbzqUhxOU1xRtB6ULYY7r/JZ2tjTvTIAW/r20rcm5f6nyJhnFJZJiMuC9dPHvHB0xvoKMaCBw6nCWfe83wZBDHp/ltHuxuX97u+SD2T98BcIqrUqwLU4BvHCpg4z3adVwRNYZEJAPA3gwk0fdgFUquHczGvOWjfGrNnVcAPx/yo5lOYEy1ahB9ddWMYkyvepmhwjp8D2aAnIQvyiiTZVv5pdc6GMoiNAHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umy+fzXlu6hoBHQOLniuLsw8zyNfRjToV3t7t1FSX4A=;
 b=deNTNMqymtPo2sxJ3JlnUuro0GPuWs0elDPZiPgNvZye6E+MQvFOXUY31C8ZOVUy039DRsiy3TLupGOHnkZDPrP5YPaQ8S7edu70Yprtq0NMU7HOdXimFCH4a/X2uogK7nzh1EuyUcSYxYL9VQ39u8olSk6MPCWvD01JEXGJ6B7OS0+Ft3qvxHwlOnGArea8h3HDbb8R+z2iKo5Td/JQO7ttAOt4Gd023klb8SvaTtLJ2dfINne+uWFaSapdRO6lJnib0XlK3MLIzYofxKu0BRbaUYLPGBVLjU6jbAM84eS/+R2S/duo1lJGNfbEHTFeVIGot+IJpZWqyUo5Z4lzsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by CY8PR11MB7082.namprd11.prod.outlook.com (2603:10b6:930:52::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 13:41:44 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0092.006; Mon, 8 Jun 2026
 13:41:44 +0000
Message-ID: <0002a9dc-7469-41c2-932a-c0f855902513@intel.com>
Date: Mon, 8 Jun 2026 15:41:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/6] lib/igt_device_sriov: Add generic SR-IOV exit
 cleanup helper
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260602141609.3941750-1-marcin.bernatowicz@linux.intel.com>
 <20260602141609.3941750-2-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260602141609.3941750-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0098.eurprd09.prod.outlook.com
 (2603:10a6:803:78::21) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|CY8PR11MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 862daf33-18e4-48f1-bac9-08dec563ad9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|6133799003|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: SOJskAoZNW3y9zR4vHfOKtwjkbTrAIlhhOL/oLpyeU1uI6jcP9/h1Qb6+7kX2vm2hXW6dtw/wFiHikcbOhF390ESW+z+IH+Ke6t13F48XFhrlZoQKNBMG15WIk6S6WTAxh830mh2wQrW8Hmod1jdWDQ9zMSNv+wHIBzaaK+4XCLVR0T2l9Eh9Uf/WA+6Vv1W8SDJdaYo7jg6Bc6TbgqshVuPRnBtwxUJ2kMv0TNN8ng9bIXk4Q+lqLLJKgDljmwfWN4ckQ4nt08T0KGHKvkUrjNyfDuuouU8VEs6Ics/G/Q1i6xFA5bEkPRPBbLD0YlXweKLSIE8JZMV6HRC9D0hJ1xN28p5rElaB1Mm4uYYXE+sjqa9komtH/eXBYkP2DiZyr8fJUBiD7j5FhxhSMVRLQl53ARruIQwRBhOiDEDbp8esfVV9GKYChxUkD8XEapzZhVGjUI+w8Nw0aE5dgMzOfpibOgbnopDLrUv8eQrLME1GiYxPRBRCwKInd1tDIk3rNQCNA7gJc8swH281i7VdNRjawU7zOxWyx1XMeLqeAetUA/ztv3AA3AwunkyPYNfRWb+tWSMOvP7DFvmjMRIarBVpgRn3hscRSVy6HsqAb/lTr8SulPFzh/01ht9zebhuxYL5KWEFKCMNxYYUWVI7aweXeO72lw+R52/96YhQNfoqu6oNxyKRDl01BGMiO9b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(4143699003)(5023799004)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGtxanZMSGNDaTYvWFd6Z1JsQUh2Sm9ENERFbHNtSnlqN01DTmNaVHlKbFR2?=
 =?utf-8?B?YUk3b2FHMndsYzRtNCt0TzhJbWFqZUM2ckExZEZ6ZWZIbUJEUFJSUXo2anpB?=
 =?utf-8?B?MUdFc0RabnpaMDdodXVya0tHeTFFZzNWakxsTlpYREZMQ0Fhd3RyK1pRSlB5?=
 =?utf-8?B?ckY5S3F5NW9MT24yZ25zSE1uTzUvdXhPVnZVSkI5U0xqQ2RwbWJZbjA2Unlm?=
 =?utf-8?B?a08rbko5SU43aWo2SkRmWUVWYmJJMzhXdldqdlg1TkxnamtwNy81aDByQ2Vh?=
 =?utf-8?B?b2REbGYxRjRpRWt2MzVVd1V4WmNOc0xnTktHVmEwQmo5N2RmM0lQbjR3VFlE?=
 =?utf-8?B?WVcrUVRacnZTeDByTzZuYWhEWjhzMGhxR0VVWHJIVC9HRm9vd0ZPak9aaXBC?=
 =?utf-8?B?Z1VDNmhUOHJuV2Q2bmk2citSNDdjT2pRdWQzVzI4US9qZDBIK21Kc2dsZW1Z?=
 =?utf-8?B?dElYU1A1NlhPYzJIQTJGaDBYM0ZkajI2MmpKSG9yazdHMC9OUHNiR0RzZi80?=
 =?utf-8?B?UURVZzBpazFhZ2U1WFFrSWMvWlQxZkkrYWcvb0FXWGowYXpwWDFqOTdpV0xV?=
 =?utf-8?B?QnNXeEhtMWhJV29Qdkk3djg0N3N1S3JnN1MzODErOUljRGVJREs1UUxVdVR4?=
 =?utf-8?B?ZEV5VlRqSjBSZlA2MURUR0dHUXdQcUkrUjJrcHNpdTZHWHFPNzk3VlAycFpG?=
 =?utf-8?B?VTdQU1dYVFBrTDFjTUg3aThhZEl1cm1WdkN0QlBienBWQk55V1FKK1Y5bnhP?=
 =?utf-8?B?NmluZXVQTk9Rb2gzRTB2OFJMTjdkTTVqcWFCUEpLSFVrUi9aanJqbTdGUWRR?=
 =?utf-8?B?eGJMVTY0RjBraG5NODQ5RXErblNkSVJLa01DV21YTkM4bktLaVlrM0JHamNj?=
 =?utf-8?B?bGJ6bzgxN3p2M2E1aVA1c3lIaksrYWpNOW5GVnhMcTEwZEg3L3YrMW9IYlor?=
 =?utf-8?B?ZGsvL1dTQlBNTzRjbDVRUHl4UUVJaTh4OXFkRVBuUVVIRlRZbDh5OVREMzJy?=
 =?utf-8?B?YlY5aTJNWlBpWFBnVkFteDdXd1pPK3U2ODJDbDI0WUM5eW5yRmk1UzdETXFr?=
 =?utf-8?B?MjBtbGZENzRCeTBydGdlMCsrNS9RS3J0RktjRU9HU2E3NnM2cU00NXNDWHhS?=
 =?utf-8?B?cXEyME1LekxPakdnY0Y0WEJ5UlhEY2JINWVuSnYvRFUrY095cFVuRHRLSDNW?=
 =?utf-8?B?THVvcmVNQmR4dVZzMStwUFFJOTJMQzNKTldZYmhIMm4rSGJvay94eUw2RnpY?=
 =?utf-8?B?RnRtT3pLTVRHd0dLQWE4WGxUWXcwQkNNbE9BREtrU2wzS2paRGJ1OUR6bVpU?=
 =?utf-8?B?L0g2ZHRaR1pPcTJjYnFOVjZBYm4yR1Y1V2VLNjBleFBOOTRSR0I2cVhhaWhz?=
 =?utf-8?B?OSswdVVqR1c0Zm0vUk9OdEhicWJyUGpPU215YmNNMU9xMU9GOHFJU2x3Mnh2?=
 =?utf-8?B?anp0QTdDbDRKQVV1cDJ5S2VMRUpSYmpNK1JEREtZcEF1R2Q4Z0p0bWFkeExB?=
 =?utf-8?B?KzhneHNyZXVseTVRd3NuOFRDMSt3d1pzNWRYampFRmpWK21LTU1NcFRSYjF5?=
 =?utf-8?B?dmFlcVZjRCtBOGp4dUtvbS9EU3IvSGVUdjJHVS92aXZpK3JOTm5tZlArSXhF?=
 =?utf-8?B?SzVGa2kvMEJBTnJ5ZXNJM2FibEtnN3EyNE85WWh4SFI3YTFneElVZlRIeito?=
 =?utf-8?B?cGpXUmlOTUZQK3lkZHRzNU9DTUZ6b3F2MjV4d0t0cVJ0R0JFVzNmWm92Rjcx?=
 =?utf-8?B?d2YzWFNGeHk2MVRFb0JrcjI3RmNRdlgwRDN6eFl5Q1h4Rk5wMDNJVDlzOXJp?=
 =?utf-8?B?ME5TTTlKYzliSzRmcHFtQm80QWpUUmtodVpqc0VXMDJxSDRETnBLUWtrSGpV?=
 =?utf-8?B?SHVlcnQ5N0UzOEV0TEFKVWt1L1QzNi9vcldOcGUrQ3lTVmJMYTRTZzNZSDJl?=
 =?utf-8?B?WkxWTTRLUFRtdWcrWVlWSEQ1RWIzdjMvbCtCVlJVb3RpakV4NGdCQWM1UWVw?=
 =?utf-8?B?SU1tK05TYk9lNFcyblBYZ2lWdU5YSUxlZS9JalVxTlpoQ0FPS2t3dFB6NjVS?=
 =?utf-8?B?YUFZNVYzSWI5bktBb2RkVm9hRVpHUUVodjZMY0t6OTBxWkxXQkJPcXVGV3JP?=
 =?utf-8?B?YUJ4VWJtNG8xdGJkMENSWUxGdjA5RmdHd2E1dEJWVnFsMmx0VzZYQlJmMnZT?=
 =?utf-8?B?cHBsQk0xUUNaQm8rbkRmRlJ2YjRQSHZVQTZDNTRzOFYzTWNxcDJRTVRkemZL?=
 =?utf-8?B?Rmt2TnJGUGtzL0xFTWdKK2svcVlpMWJqWTJldmt5Q01kV3YzK3AzZE5RZ08y?=
 =?utf-8?B?WUp5SlVObnBBdlZtemdhM3QyZzFVSDZXdTBxYnF0VG1tbEpRWWxBQT09?=
X-Exchange-RoutingPolicyChecked: eERwoOJvtbAFdz9JsoM38bUrB6q2JaBVpVSlXF9j4sD3pAdsqe8Tkg2DgxJrIerEvEMrhk0z916ynJNS0dun10YFvX3bxCMMsGsHE37llb9Gqmj4ow1bH7BE/LjV/Tx22T3CdhECi+F2J9lS0ZR/Q6gH2EEUVIXuj9t8yLEZCQPVnvzmMCZHM3s+qEX/lWDkJVUvltgRonkWieor76Yn8L8ZxWABrilm8WdZi+Ue7i0LC4d3tDq8LmizlG7UPUy7E95wLvR6cAcCBfCzinI1MbihlLXrmsNzzXKqRF3n/a2HCyXyeQj/I2fTTu/FHEssL6f/ORdWNLRmXl8HB6UaVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 862daf33-18e4-48f1-bac9-08dec563ad9b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 13:41:43.9676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtNITy69qX5nixmClf9tGyP9GVE/+6umv5L7eZ7MnuWWhxJm0p8v6j9+5xSm3by3839+Xj8Dk5ZZ6w1nfCXqig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7082
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


On 6/2/2026 16:16, Marcin Bernatowicz wrote:
> Add SR-IOV exit-handler helpers.
>
> The handler provides best-effort cleanup on exit: optional callback,
> VF disable, and optional autoprobe restore.
> Add a helper to clear handler state after normal teardown.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   lib/igt_sriov_device.c | 96 ++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_sriov_device.h |  5 +++
>   2 files changed, 101 insertions(+)
>
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index 8f2cfa50f..1defb5ede 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -546,3 +546,99 @@ bool intel_is_vf_device(int fd)
>   
>   	return (value & 1) != 0;
>   }
> +
> +struct sriov_exit_handler_ctx {
> +	int pf;
> +	bool restore_autoprobe;
> +	bool autoprobe;
> +	igt_sriov_exit_cleanup_fn cleanup_fn;
> +	void *cleanup_data;
> +};
> +
> +static struct sriov_exit_handler_ctx sriov_exit_ctx = {
> +	.pf = -1,
> +};
> +
> +static void sriov_exit_handler_release_fd(void)
> +{
> +	if (sriov_exit_ctx.pf < 0)
> +		return;
> +
> +	__drm_close_driver(sriov_exit_ctx.pf);
> +	sriov_exit_ctx.pf = -1;
> +}
> +
> +static void sriov_exit_handler(int sig)
> +{
> +	if (sriov_exit_ctx.pf < 0)
> +		return;
> +
> +	igt_sriov_disable_vfs(sriov_exit_ctx.pf);
> +
> +	if (sriov_exit_ctx.cleanup_fn)
> +		sriov_exit_ctx.cleanup_fn(sriov_exit_ctx.pf, sig,
> +					  sriov_exit_ctx.cleanup_data);
> +
> +	if (sriov_exit_ctx.restore_autoprobe) {
> +		if (sriov_exit_ctx.autoprobe)
> +			igt_sriov_enable_driver_autoprobe(sriov_exit_ctx.pf);
> +		else
> +			igt_sriov_disable_driver_autoprobe(sriov_exit_ctx.pf);
> +	}
> +}
> +
> +/**
> + * igt_sriov_install_exit_handler - Install best-effort SR-IOV cleanup handler
> + * @pf: PF device file descriptor
> + * @restore_autoprobe: Whether to restore current autoprobe state on cleanup

Do we need this parameter?
I see you set it to false in xe_sriov_admin.c, because in this test we 
don't change the autoprobe, but maybe instead we can always save the 
state and restore it only in case if it changed.


> + * @cleanup_fn: Optional callback invoked after VF disable
> + * @cleanup_data: Opaque callback data
> + *
> + * Registers a process-exit cleanup routine for SR-IOV tests. The handler runs
> + * from normal and signal-triggered exits (when possible), disables VFs,
> + * invokes @cleanup_fn if provided (passing signal number, or 0 on normal
> + * exit), and optionally restores the original autoprobe setting captured at
> + * installation time. Tests that perform full explicit teardown should call
> + * igt_sriov_clear_exit_handler() once that teardown succeeds. An internal
> + * duplicate of @pf is kept so cleanup remains usable even if the caller closes
> + * the original DRM fd before process exit.
> + */
> +void igt_sriov_install_exit_handler(int pf, bool restore_autoprobe,
> +				    igt_sriov_exit_cleanup_fn cleanup_fn,
> +				    void *cleanup_data)
> +{
> +	int pf_dup;
> +
> +	if (!igt_sriov_is_pf(pf))
> +		return;
> +
> +	pf_dup = dup(pf);
> +	igt_assert_f(pf_dup >= 0, "Failed to duplicate PF fd (%s)\n",
> +		     strerror(errno));
> +
> +	sriov_exit_handler_release_fd();
> +
> +	sriov_exit_ctx.pf = pf_dup;
> +	sriov_exit_ctx.restore_autoprobe = restore_autoprobe;
> +	sriov_exit_ctx.autoprobe = restore_autoprobe ?
> +				   igt_sriov_is_driver_autoprobe_enabled(pf_dup) : false;
> +	sriov_exit_ctx.cleanup_fn = cleanup_fn;
> +	sriov_exit_ctx.cleanup_data = cleanup_data;
> +
> +	igt_install_exit_handler(sriov_exit_handler);
> +}
> +
> +/**
> + * igt_sriov_clear_exit_handler - Disable SR-IOV exit cleanup context
> + *
> + * Clears the active SR-IOV cleanup context, used when a test has completed
> + * explicit teardown and no longer needs best-effort cleanup on process exit.
> + */
> +void igt_sriov_clear_exit_handler(void)
> +{
> +	sriov_exit_handler_release_fd();
> +	sriov_exit_ctx.restore_autoprobe = false;
> +	sriov_exit_ctx.autoprobe = false;
> +	sriov_exit_ctx.cleanup_fn = NULL;
> +	sriov_exit_ctx.cleanup_data = NULL;
> +}
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index a417b30d8..619b0f7dd 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -36,6 +36,11 @@ bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
>   bool igt_sriov_device_reset(int pf, unsigned int vf_num);
>   bool intel_is_vf_device(int device);
>   const char *igt_sriov_func_str(unsigned int vf_num);
> +typedef void (*igt_sriov_exit_cleanup_fn)(int pf, int sig, void *user_data);
> +void igt_sriov_install_exit_handler(int pf, bool restore_autoprobe,
> +				    igt_sriov_exit_cleanup_fn cleanup_fn,
> +				    void *cleanup_data);
> +void igt_sriov_clear_exit_handler(void);
>   
>   /**
>    * __is_valid_range - Helper to check VF range is valid
