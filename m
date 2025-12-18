Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A6FD6ACE6
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 11:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4449410EE80;
	Thu, 18 Dec 2025 11:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grsKCn3S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02FD10EE80
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766057194; x=1797593194;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HpSik5zn5Ahsdy7PXzObBWlNzSgKn99rNW8t0wsAlFs=;
 b=grsKCn3Sj6atjofgzQq2O1YED10+thS+K4Phxaxc0ZKD4JoNEE3eafau
 8l9GgOqd6H5lsNpcHbyYBTluGDb0QQBBoQ7R/52zQ6gy0D6mqa7Pk1XTF
 SxAJ37O9JdTSUseetljoryFWIxlbklMCDEu4zym6ycHivc/1SxDQw9UyA
 FIXESEfXKGPfaXuXA9/ySRu6Euazs7amoH5hBSH261kvZ4tLqJ4WW7IMG
 vtcY0eQwiUnsGjZviUk35Eh6kDm2phcPXAYLY+mdLnkgXUfAiYWQLqKEo
 ArrJeu/ggcNlw4bZvwkuu0IssrG/qrOrTLNosjJTyjrrM1UJ6u6/e9djJ Q==;
X-CSE-ConnectionGUID: QT+0UggXSnOlkZFkMPDuuA==
X-CSE-MsgGUID: woDv0NGHSyyMywkBM50WaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71639328"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="71639328"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:26:33 -0800
X-CSE-ConnectionGUID: m5hVWFovTSG9atrFFyInWA==
X-CSE-MsgGUID: BHFgjBRMSIW90oUz5G9XkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="229620300"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:26:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 03:26:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 03:26:32 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 03:26:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhmoM39E/s5c/RugsYaNo1Zu7orBojjh3Qr/1m1S7y0zTt7t7fDzA7/doioLY7hSIecSixetjPcqSG9kWsAyDfxpvxdD+d4AgcVT0EO9oDsY1RkdO+s7qOTR1UajEzqR9b3v9jI0WrZxp9QS8h7LuvPOGsqLUb+ZTYObUWwYEXF2OCoKPukjZ6d7ab8Udp8knrWE2tkyPjN6cWbi86AQaDKOMFv8wIwLcQ5IlWJ7cdJSgtrt7sc/ggUbv2dGoYcaLFaFh4jzw9u4GF++TnZqhAktoZo425nteFGuC5AtyZ/96TgBeWRLMUU8K6ReFk+Meg7hMQRXE//CNzLtyHdmLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1p7bsOodOpwYxnewesqWgYah5i9r/yT66YM6fQpEhuI=;
 b=kkO+NGqjMNLZ7+4SvVZ73nQV6+cP4QoEs1JVIBR4y3lAcBKa2y4nKHEWS3TkX/5NCuW2KA1p0joCrcsTmb0G13oIgJrN7JDkX/uUsSgcM0cjEqHxk3ypwbuW+8Ddkd6VaYzAJYctCp/iYxruFB6IJEW46ye++qbGHCkIdZt1uaFr+L3t9Mvfm9CZIdUXR7F5JLIhxsROmxNeuV+qYlMWgZONenCPM973aC1qPPKrOAYKurpS5c5wlOrsKScw/7TKq8DIES7uXKbGvgXs0r5fnBGCLssHwF51uPQscxyUQ+rXIe+cikcpDEam9RF5RyGjPGPPvq88Gs4MR23GzDttGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM4PR11MB6405.namprd11.prod.outlook.com (2603:10b6:8:b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 11:26:30 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 11:26:29 +0000
Message-ID: <6e7244ac-51d3-4512-a391-b4025e7754ea@intel.com>
Date: Thu, 18 Dec 2025 16:56:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 7/7] tests/intel/kms_test_config: Add NVL display
 blocklist entry
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251216185215.1281390-1-swati2.sharma@intel.com>
 <20251216185215.1281390-8-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251216185215.1281390-8-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM4PR11MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb4aee5-69dc-48b0-2bbd-08de3e2849fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|42112799006|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXlGd0xyYURqWWFNMVVZM0dkSFRqMld3QkZUb3BkREQ2aTE2L0VMUVZWZXpG?=
 =?utf-8?B?TTdOVWtJdFBsa3d6dUlJZ3ZSZkwzUUU5QndBNHJkWUQ3VFpYMFV2TzFBbThK?=
 =?utf-8?B?NXNTaEM3ZWwvUjdPcFZuNGtsbG54NDUybm5kRmpDNU5OVFE5R3g5Uk8vZjNV?=
 =?utf-8?B?ZUNFcjdXSk5lb0VydlE0cTVJVnc2akVEblVleWlzNElBblFiL1h3QVc3MnJQ?=
 =?utf-8?B?RHVZYUFmckF6cXJjMFdMZkZIZ3lwR2ZDYnM2OFdxOEo1MysrR2dJUTlsdVkx?=
 =?utf-8?B?QlYxd0haTEJsaXh3MFZoWlNabzcxRFcvTVZiWlpFVEQvN2xBQzdGWWM4U05J?=
 =?utf-8?B?dmdHY21XQWYyeko1elArSlJjbWlUaXJsR0Z1aGxSR1VtcEYyZTA1aTZGU0ZE?=
 =?utf-8?B?bkpKZGMzWkJNZVhnTUhhRG5BWC9EMitlWmxaOEsxd1docXlZd3lBS2U3UFEv?=
 =?utf-8?B?MFJBK21oWFZSamRWbEN4aVpyNTlZY2hHNE11Q3pjb2FVNUVjTVNpRkZueEVs?=
 =?utf-8?B?NnR5UmEzQUR2ZEZhNk5FUXNseXdsV3BUcklnYkRud3dhcnUrT1g0bisybXJP?=
 =?utf-8?B?bEdOdEplYVlzNmdmWGtHTGp2VWZkSmRuM216aUJnbUFSS0d2RlE2NW1ra2xM?=
 =?utf-8?B?cVBMNVEwKzB6andLT2VnVDF3N3UzQWQ5Q2xOYmpFL0FNNHVnL0k2Q29NY0ll?=
 =?utf-8?B?NFg1QnZxaXJIV1BncXVHY3hQM0FBMUE3Uk1LY3F3RmJkRU1ubjR2ZUJLM2Y5?=
 =?utf-8?B?UHV5YlFSWGc1K0V1ci9GUXV4SVl6MXZuQW5EYkVYMHE2VmN4N2k4ZHBjdzg3?=
 =?utf-8?B?V0dkZ3VnQ2tITkg4SEdLZ0tvM1pGWmo4aU9uTnNxTjFKWnRyUG52amZtYXR1?=
 =?utf-8?B?bjV6bzZWY2t3QnBWSUV6dmtTRXhSZEJmTGluS0RYaXRjYU8rQVdxaTBEZ1Jp?=
 =?utf-8?B?aFBIeEdKY1MxKzk4RFJwSXRjcnhETzVWWlFVKzJodHM3SHBGREVlaGZNR0ZR?=
 =?utf-8?B?T1pvQUVsT28ra0FUOUVoNXdKSVVON0NYNE1qSnNIVisxMmJORlZDSjk5V1Nw?=
 =?utf-8?B?cmZhNy94blR1TnFQLysyMTBXcXFkWUVwQXJ1eU03TTFxVEs5aHQyWTJlekpV?=
 =?utf-8?B?ZVlPZGRQbVRsbTNhZHBlelBucm5KaEZEZndldU1aOFZuaHRmdHVrMkpQK0p3?=
 =?utf-8?B?Mmo4a2N5U2M0TEJPNC96NmorZXdBelRNMGlkaVVYcDVxYTJhM0lYU09HYmcv?=
 =?utf-8?B?bk8wZTc0LzVNOXFSQzFQbnpDSGxxMWtCdEk1Mi9XRUhHVmdUN0dIZDB0eFZC?=
 =?utf-8?B?Y0paK1lTSHFNY1NYTGdjdURHMCtMdUxnMjRBNkdXb2s3MjdLY2hBQjMwZWZU?=
 =?utf-8?B?a3F3NmlGZmZPTXo3L3NWM1U0dkFSMlJzam8xa0wwLzRIQUJoL1ZoV0gwNjZr?=
 =?utf-8?B?d2w0T3NmVk1DSFVIOEw1Q01XcldPSG1zSkdHY3ZZaExRQmpBQTQ0bW1Nc215?=
 =?utf-8?B?NUQveFpWYTFaLzlSLy9XRWpYTzNmTWcvWFZjSDB0UnczYTkzWVFVcWpacnJK?=
 =?utf-8?B?NUlqQWxoU3ozSXNlbzZoVFZaR05oYmJRaEczUEFJb2ZxMCtBeTc5bm9hdGZt?=
 =?utf-8?B?MEk0WTJpYUtqUURpd3p5KzlPbGR6NkZlbHJYM3RhZElnVFk2ODlObEgxbk42?=
 =?utf-8?B?OHZDQXlmQzJQOEIrakZBUi9KaFVmNllWcGc3VkU0OGdpOXp0aVRUWllpR0dr?=
 =?utf-8?B?R1lSYStmb1RqcDNmcXZKdjErelo1Yjh3Vlc1cnZTZkk1QktRRk1UenAyYlEw?=
 =?utf-8?B?TzVicDZoRWVFQTdNeGFHUHVlRGhLcWd0ZEoxU3hOL1RDZDlMNzQ4dVBock1G?=
 =?utf-8?B?WnErNzBYZ0pQNnBFTkw4Y2Y0eEl5M3czRVRtQ2xJK2pOalcycnM3VVZPcURJ?=
 =?utf-8?Q?w/0/plbKU6IOYAerIrPfRKQFqk4jiRjr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXJ5TTArV2RXZHJpVGRaeXF6bkZZRW9Fa3NFL2M0Sjc2TUZQaU5QVlJ5TEdo?=
 =?utf-8?B?STNTaFZ0WFRmbU5PUCs2clhrZnMzZnZOUEJES2FxNTZuYVZ1SVFrVVl2Z2FY?=
 =?utf-8?B?M3NBc3FsNFNGOGFTV3BBd1daV2RuSDlzcGxVU3NPSjl5c2c2NkZ1ZC9jNFFv?=
 =?utf-8?B?bWl2RVM3MzIxTEthbFljV0lYK3lWWDhscVZyYnZqYUJKMHhCWU1Oc21XVDFv?=
 =?utf-8?B?dE50S1ptZ0E4SkZNTXZoc2VTMFlUajE1YnowNlVzZzRoMmVvbGd5eDFxdUZi?=
 =?utf-8?B?RlE1MGRseVRrTktQc1U1YnZBWEt2YlRrQ2JtUjRGVDRIeHZ5U1dra2U4M3lC?=
 =?utf-8?B?UnRyenZ2VzRYRnJicERvd0w5VTRLUGwvbXZrYjRPc0d1RjZKOWFNb1JJbWNJ?=
 =?utf-8?B?V3pYbFJOdThmaytMaXFMdUh1Q1gwU1htSHVtU2lGY25jNnY1UHY0STdkZ1B0?=
 =?utf-8?B?aWgrR0N1S0hScjZXUFZQbTY5Z0xVMU1acVZDbkFMZEdZQ2xHVy93TERybk56?=
 =?utf-8?B?RGhOUEZUaG50VkdFTFVOZW5zZ3d3bUpZUk9lQzV1MjN2K0V5dXZQRDI0ZzVo?=
 =?utf-8?B?d1Q1c29hK2FyTHBKa2V5WTFZWGhPUW5LaU85WEVDbHJnZG9uc01LcTg4blRn?=
 =?utf-8?B?V2VUNVdyTVdnTGNTYVNVamY5dHZoUmdjeGc2emo1NDRPcnN3Q05vZ3pnSXVr?=
 =?utf-8?B?UVA5MXZtc2NPWVlHOVA5ZVlVcFYza2pSU0tjYWtrR3lnN3pEV256STcwNFRh?=
 =?utf-8?B?dmliY3FJUFgzR3U0dWk3VEQvRG9NU043UWJqQ21JaFNaNFphQXFPU3ZTREdC?=
 =?utf-8?B?Q2l2eTVQemZha0lPbUo0NHFVQVRHYnFTTlRxWU01ZFl5TDByMUJhajV0TGR0?=
 =?utf-8?B?QUtXWnJBMjdiNFM2NmNaeDk1K05qSjMyTFQ5MUxqVng1WXJKWTJVc0J3YW9J?=
 =?utf-8?B?QUMyQTg2UzMyTlJmMkhRTjh5cCtpVm00VWhIdUE3bDFYUDkwZ2VKSW5TWWlY?=
 =?utf-8?B?ckJoWmVDdzhIUnZaZGFyK1Z4RDNaZVU4QytUZzllV2RCR29uL1llNVcxMnhX?=
 =?utf-8?B?ckEyb2kwMmZpeUdXeVBubFRqa2FkZUpXMTc4bGFMTjloVUNFUkRrWmJHNFA2?=
 =?utf-8?B?MWN6K21XVDcyejZURGxXUHUwM244VVkrMkFYYWIxUDFVSTNtRk9sTVpjek9r?=
 =?utf-8?B?T3lGKzEyZ3NJenJqYVYyL0E4ZFlwaitrcVFHMHN4WGZXMTcycU9GOUlpUC9w?=
 =?utf-8?B?Z25obFE3eG00aGorbXU4azUxb1pGQm5mbzhYSngrcmxBZG9QVjQyNndJdXFo?=
 =?utf-8?B?SU1lQ2l4TkE5N0NCa09CQ0lBMkdVRDYwdWpYSTM3d0V6VUJxT2d4RkpQa3FT?=
 =?utf-8?B?RkZKR2lNckM4YThZVEc0enBnbkVMN285dmhmNUVIck9pMGJBQXhuN2VZL0tK?=
 =?utf-8?B?UjNTSy9OYUdyNEJOY2k4MnZhZk9rbXZ4T3JNbDVTWC9qM244NHd5eEZLWGV2?=
 =?utf-8?B?WVNpNjY1YkNvU1dOQWo1OERVZUxHK2FKMGlBODJTZDd6MlpRRlIrMkdrREVY?=
 =?utf-8?B?ZjBvNE1ycVlsY0J6bEd1d0VtdDcvM0ZRdHJJS0FxM1N3OUdjNFJ6di9oWDJM?=
 =?utf-8?B?YTc2Q1h2WXk5ZVZrdVZJRDRFSjY5NTNoUi80UDZNTlBKcWlqZVNvc3RQM201?=
 =?utf-8?B?WExOOFZocm5GcjZ3cFhBa3NiWjZrRTRxTVV5NDhmSmw4cDhMeWJ4NEt5Z0E0?=
 =?utf-8?B?aHprQ3hFTWRHb3FTWE1oY2p4azB3QmZMQ0NyY0hnQW9iMEUwR2ZwNko1c3B1?=
 =?utf-8?B?K0ZKdEJJZ1BUTWM0dnF2WWg1MmNXQ2hWeStDVitzT1Qva0dpaEFvajlXSk1m?=
 =?utf-8?B?WTBFdXRURnJOczZRREdZVENRVmdCaGRHK3RBdnNOSFFkVWU5ME9EbDRxRlJW?=
 =?utf-8?B?cEpzYVNJeXBqaWI0WDF4NEhSdC9PWVVLWmp2ZUdBYkZtcDNDdGhiR1MrT01Y?=
 =?utf-8?B?WkU0aG9sWmZHY1lEOFJJRGF0T0tGZE1wUllSYVU3WVd0T3VZcDlQa0kwa0tQ?=
 =?utf-8?B?K3ZGTlBKdExXT2RlNzVkZ3ZVZG1ENzlOMyszRTllMWdlTXVpMWRTK2FKUnRS?=
 =?utf-8?Q?Y6gU1dYwIEdkyTp/eV2dJAMR0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb4aee5-69dc-48b0-2bbd-08de3e2849fb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:26:29.7889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdKf7cINVyJnlMbhIv3unmAmN/W6f6uHKWDvHZ+i+PQidcJziBiHM8quZOrL90fCpxHuvZOJ2pG9IoLEqEsu8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6405
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


On 12/17/2025 12:22 AM, Swati Sharma wrote:
> Add the NVL-specific display blocklist to kms_test_config.json.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_test_config.json | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 5645de181..44c439e28 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -61,6 +61,7 @@
>   			{ "LNL": "../intel-ci/xe.lnl.display.blocklist.txt" },
>   			{ "BMG": "../intel-ci/xe.bmg.display.blocklist.txt" },
>   			{ "PTL": "../intel-ci/xe.ptl.display.blocklist.txt" },
> +			{ "NVL": "../intel-ci/xe.nvl.display.blocklist.txt" },
>   			{ "LNL, BMG, PTL": "../intel-ci/xe.blocklist.txt" },

Please add NVL here, to use the xe.blocklist as well. With this added, 
patch LGTM,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>   			{ "ADLP, ADLS, DG2, MTL": "../intel-ci/i915.blocklist.txt" }
>   		    ]
