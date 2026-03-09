Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0417EFCD70
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7A010E4BF;
	Mon,  9 Mar 2026 09:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZpOrRnFR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E335E10E4BF
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 09:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773049129; x=1804585129;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CicQjvan0vApGcFA6J6EoQl608DdW4xr/NX228PKwQ4=;
 b=ZpOrRnFRmkTXJNQm4jKL5eTTWNW3/qp4LZ35v7tS9bkP7g9Mo0uUuHuk
 YEXosXHOb66hEo9ryWIal1gkZT4Gv4E1aFwPNY2fxYtH4bPsxTCNXcqeh
 HhGotZpSQy7m78CtU4sLvJ7adAi7bWBxSAlnAcT51bCvUm0Ctv5RRh5z8
 WrdcpgC7dIMVU6WW0M0sgy2UpXJvoOMi5T6iZCxi8mbj6e9YFQN0g0z0V
 hJnlKc7XKbDHoOUiMjnHiFyM89PHbGgIaJQQWMnXTSEIxSwLacMgRaBst
 EzeQRi0l5thk0Rwyw33Rx68Oi8CpgjRPwtO/I57q70EuOwaNzebH40pvT Q==;
X-CSE-ConnectionGUID: WZ9l88KTSx6XgXFGJpTEmA==
X-CSE-MsgGUID: JdtHdXl4RI6jsvmZ437NOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84702018"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="84702018"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:38:49 -0700
X-CSE-ConnectionGUID: z+kW6e4PS2ulFg5Cy9gcRA==
X-CSE-MsgGUID: PyVIE6NXSh6cYEvrBohERg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="219828868"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:38:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:38:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 02:38:48 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:38:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8/gPThagSXC9hL1naSzTqwctVaMYotcxFczw7YTG2uHfgkx4rdsfa72bGhsLtEbcbNhv5Eues3ABV/YPemRpCvl8LRHFh194LQCo7RUesFuNZk1QZlAHarseeTYZxwCi9myjYTSImoHC6Mtpgkw59pnh9fG7Rf2lN0ys/RqCuTPQHRhLMJ8t71VJjCeFZ1AHtbSA2bhope9zhKzqFTdhto7P6GS3nEjpjMi1QlqDaM9dm1U7arRZrzB12oTg6PNI1RhJ/I0dM6a8b/7TI0VcbM6sEgI1EbJXwDIXqR9CEn2Sn20dorIVjhn6+OMuVUijhX57Ne3XH6Qs4v5Q8vmKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnHGXzWj2Vp8hfoC2hPCpT60t1ydWej5khVo6HBDsM8=;
 b=JhXvy9V9optUwMLzUwlmrPLQxJl2fnNEND0pkwC+G0kHk9fCDYr3j0JNENuavkpHIv8MoMOxq5EHIxNLiDwrXFoarilPvq9W53nmCc/YS7RatxMoZyCR2Kn4aRmHeyD7dGSnVKpDDjGEeNp2d8XVkZ4LvbPpu4noxkwSIprH6bVqkuynHrw1Vul9VBeHCMqXXwe+19LiVrlWQfjuKKAoqRCkQbvt/XrK/niGb4mHWhtr7t4kIqN5pc9Aq1Zz/h8i8/NPFiF09XmNVR27asbByi2QV7nEmMWILveedrxBQ3sssL39TDIlrXq4XsqMp/LfMo4wCyunxOGWyNKno+rWmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 09:38:45 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 09:38:45 +0000
Message-ID: <d256aedf-2e67-41be-a440-a6e39ad5d18b@intel.com>
Date: Mon, 9 Mar 2026 15:08:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,2/6] lib/igt_connector_helper: Add generic connector
 helpers
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260225212859.876713-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20260225212859.876713-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0109.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::14) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SJ0PR11MB5039:EE_
X-MS-Office365-Filtering-Correlation-Id: 9baadd59-b104-48ab-42a2-08de7dbfa8a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: KhfAkQCX1udlS8OY79ozm1dIfhx9zQwAeUWRcNDl1KDB05fpOIXtK+I7QK2V6nNyWFAi2T4klSxixcK3Yt+zypH9UCmE1dk1flGBx6X7+E/++f9tlhApEzRj3lMzk07rAtF7McfvBjLBCnuxuAMSl+wp/gI+AcP1JkPNBqYNOmdoUuFT8qMRUapCejgLH3aVh6uPnbfWmhJ2MTrJKK6qAXpvgdPvy6Wx4RZ0T2cbXd0YAEq6jBJ9uzpo5+LUHvG1vksVj1M/oWGI2y98qlzVnk0zx9XTmTGNvAcqE5NPK/yPNfyq+6SPMG3rXfphxWRZSFd4PGI019JqdxBg5XaooDa/5F6iZ3+b2nl2+bi6JIN2hHhYHEPseZW+zzhkOj1+umlx7dhyrztMDShVqbwQKMlHBjgkITUSxWUx2jOvklkqCKIe8lmRn9MyzM40qGgrkp215Nko9tN5hxTNspDKgBxBZPmvDrkRwbIYKot9iT/VrtBNumVP57cV+gXjNXgbzlc1rPRW+ZPbCQgryZA9H8m2I42ZXkICcClGGn9pavxR9lSthFcuo+HHrIFvGp3OGhBMgkti21ywGWGPCaf6ITCo7Enyp+AnFReRV54SLpvXYAtCq4NDvPOp+VjDi8VxGYL7QgMvOOcWW80+Fv27isDjOh8cRglVfW1UD0KfuRj+Pxecyvj3SC6MFWoZz8hLNSd6GY06Y/8NE10QmRKnBS7q59vkutSeNeulrd4M4U4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmJZNW1HRENDWit3YWlRRnRneUtvUmRzUld1YjAyUkhFalVrTHNaZ0tXVkRr?=
 =?utf-8?B?aTZSS280MDhYUFR5S3E5RmxKZFBrejBvV0VHRFJuL2Z2dmZ5T1hlcUVUeElQ?=
 =?utf-8?B?dXQvUCtpVDRXb25NN2lYeTNqQ2JNeE5PUWduRWZEWkxudjhQZW51aXZ6cUJI?=
 =?utf-8?B?cVZUZUZGYXQ1SnUxdGpnUEhrWWVzb2JhK1FzQXQ4ZVFpWEFac1NIY1JiaTdq?=
 =?utf-8?B?U3dFdW5EMEZVbk9iWkF5V0xNRjRCSERPelNOSEp0THNuQXVINkZzMk5JRXd0?=
 =?utf-8?B?d0o0dFlucmErNkt3S3VXYkRBeWppbmIrL21yRVZlcXFyUGJHbnNhZVdHNmVO?=
 =?utf-8?B?MGNLSDhIRWZ5enRtUlpDMUhSaENxdWZLUUdnbitwK0NSdjJtVHFweHZVTm0w?=
 =?utf-8?B?dERXRzk4ZndyblBDZXR5SXFDeFBSNjRMWnN3R0xrZ1lRMGp6ZkpLSVRGYW16?=
 =?utf-8?B?L0pLdWN2cE12dTZhM1BvelFsZzRnbmxwNkVwUnFIdXpHckZXU1hkMUFOUHhE?=
 =?utf-8?B?THIzNXRBYmNOQ0VCbEZ4TjJLc1lXNDdYeVpmK1hKdnhKZGtEcHVjWTdsUTNY?=
 =?utf-8?B?dXFVTkMvNU54SG5VRTlTWStzemJjK2NkOXBMQk1wajFNUjBaMlFvSk9xd3M3?=
 =?utf-8?B?WmpNejVwR1QzbFBqRHZBQmI2dUEwYjM3Y2t0Ky9SWXlBOFlkcEprbWtPcDJ3?=
 =?utf-8?B?TVIrc1FWTzdKSTJOcElyV2hwRUlnYmxaajZxdzI4bFFiWVAyMmQ1MUZYd0E5?=
 =?utf-8?B?OU4zN0VvR3JjamdXMWRwelFvQVd0RXN4bUVWSVNpd3dXRE45VDQ1UjQwR1Qz?=
 =?utf-8?B?VXJGK1VMbFJSenNhSUFiTlZsN1NwKzV4Szd4cHcwR0JJcU5iYnBWL0w1dDVU?=
 =?utf-8?B?ZnY3cXpTOG5CMTNJM2dJQU5lWi9sZzl4NFBsSU52aDRIMmszVDloRk9EcG02?=
 =?utf-8?B?aTJrQ2dZMndNZGpBOGtNV2RHM1VLeFcyZHBtZ0d4ZTFwa2JsdFJQTTRkRWUy?=
 =?utf-8?B?T2JCT3EvSWNZeG1MbTZoN0pod0J6RXRVU2dJamdxUDZlVzBWNTdhMEZWUHAy?=
 =?utf-8?B?OUJDOHprbEh3RW44ajBhaWVIcDBzRzI3N1pTTGRmcTZkbkpXd2I5VkI1Y25B?=
 =?utf-8?B?cVJrRGJ6L3dSV204ZEMwR1N0ekFLNnllTGd1RUVDNS8zd2VGU3R1elJDZGZz?=
 =?utf-8?B?N2JzQmF6OTh6QmhudXFyQTluQlZlNEp2R09OQjlaVmtEV09qbmJZNDFRQUI1?=
 =?utf-8?B?M1BOMU95ZzRHNG1XZS8wRFlsNXhQY2t3ckVvYS8xMjZvSVNORkdXSVRTVnpn?=
 =?utf-8?B?UFNERTBwM3pnQTJObXVtRUVNdWZzUWNJcjdqM2tpWUd4RkJNWEFpWmlrNUtL?=
 =?utf-8?B?WVJ3enE1V1JnYlI2VWN1eU4rcEJ1ZjBuRTVkM1dwaWFONXlFSExoZGxlanpq?=
 =?utf-8?B?b2tIMm9RVTdBd1pNZEMvN1dhUkNyYnRiRzN5eGJqb1NEbWNpajFFWGdJQWN3?=
 =?utf-8?B?NXRpYjVvOW5BTnFDQnM2WjhkL2FzN01SNFc3ZGVuQjR4U09CNlZVRUg3L2I5?=
 =?utf-8?B?S3ZDWXptZjVFN2pHQXlBOGdGS3dIRUJtODBnMUtqeWxiSnRzaWJLdDlwSUs5?=
 =?utf-8?B?cE80WmhPMUJIM3R5UkFiRXQ0MnFlSW5WL0daZHVlZnhrUFVXY3Fxc0R3SVkw?=
 =?utf-8?B?QlJuQ3JEWW1uVXl4R0dMejhxbytpRHpteTBLbEtybnBlQzV2ejdBamE5ZlVF?=
 =?utf-8?B?eUthdzQvQ0JEdnBlNGk3anZvOUJhd2l4N0RyanZkZ1puR05lamJCYTFBWTlL?=
 =?utf-8?B?MS8wdWIrL21sOEVOZGNCcFU2ZHpLK29Cd294andIWG5DOW9VUC9uamRVczNR?=
 =?utf-8?B?WmJGczJVRElhYWUraDAwOC9jNERjb3RqN2hMWW9QbHAxRnBtMTFMdU1JNE1z?=
 =?utf-8?B?RkM4UVlTWldjNjNvRkpPekdERkpQT0lHM1BCcHpLSnEyNHozZnROTzFMdFFB?=
 =?utf-8?B?MWJkdENNL3dMWWNFSDltZkkxNjJ1cFpTSUJCNjNCRzkrRjZUWGR6MkpoRlE2?=
 =?utf-8?B?czViN0kvVUpxVGV6UjJEaXZseHFISnBLQ0I1ZGtlRGppZXVNalZjTld6eVFR?=
 =?utf-8?B?MThUSERHMFQ1RkUxRHN3U0VxdXJHSlVJbEZNNE5OaTNBRWRTMC9malltT1JM?=
 =?utf-8?B?Y1pEaG1tdTBZTmQvbWg0SEVyVmlKazgyWjVZN1l1OXArYVJ5WUtGNEl4a1Zl?=
 =?utf-8?B?Mm9HT0VleXRIU3hKREwxR0hsVzdNcnJockl5V2VhN20zWStmb2ZCdUdxcDdN?=
 =?utf-8?B?eDV2VDhEUml2akdPN2k3b1M5c3FWRE92OCtzanhEcmswZmI2aWpHQT09?=
X-Exchange-RoutingPolicyChecked: jy2lnuYYtRIHFQCtkWxWvzyZTTHd++0f5djf5NyA/aJOz377YLmH9HDtFhcBZ0xyfu42CIGJ5+KvcnvKFDmRQJWwGeLyd8lNV62h/izgKsyuyL1X4+vCwdpLdYIUjioavoXW9FSJ5Y3Shh5g/LpQhEL/7ZYBqTMlHYubpNMjOGFQ397i2hg3JHswHRd0efzxC43qJL4yOCuuQgbS/KpxPr7QND1nX8ETaviCo/wHbgRpzo37qecFIfEVEy31WUi+mDzH6Y6d4CXV31Qpd4T67i1JoHSpFOX0MY6MZeZPJw20DAFWYKBou9+rrTRBbAx6niKFqlJhenawkOLuGwmqgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9baadd59-b104-48ab-42a2-08de7dbfa8a0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 09:38:45.7880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqov9xt/WovdKKJEh7SbBabyg4aLt9sdr9E5NL8lI4r2jZyS7590Ntiv9NXemnAv0U8p2vD9pReoit2gBX4ynw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5039
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

On 26-02-2026 02:58, Kunal Joshi wrote:
> Add a lightweight helper library for DRM connector operations used
> by USB4 switch and other dock/undock tests:
>
>   - igt_connector_get_connected(): enumerate connected connectors
>   - igt_connector_get_info(): query name, EDID serial, and MST path
>   - igt_connector_find_by_path(): PATH-based connector lookup (MST)
>   - igt_connector_find_by_name(): name-based connector lookup
>   - igt_connector_reprobe_all(): force reprobe all connectors by
>     iterating each connector to trigger DRM core re-detection
>
> These helpers abstract common DRM connector patterns that are needed
> by multiple test suites for display enumeration and verification.
The contents of these are already present in lib/igt__kms.c

Instead of a new file, can these be exported from lib/igt_kms.c ?


Thanks and Regards,
Arun R Murthy
-------------------

>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_connector_helper.c | 299 +++++++++++++++++++++++++++++++++++++
>   lib/igt_connector_helper.h |  27 ++++
>   lib/meson.build            |   1 +
>   3 files changed, 327 insertions(+)
>   create mode 100644 lib/igt_connector_helper.c
>   create mode 100644 lib/igt_connector_helper.h
>
> diff --git a/lib/igt_connector_helper.c b/lib/igt_connector_helper.c
> new file mode 100644
> index 000000000..6be849b7a
> --- /dev/null
> +++ b/lib/igt_connector_helper.c
> @@ -0,0 +1,299 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * SECTION:igt_connector_helper
> + * @short_description: Generic connector helper functions for DRM/KMS
> + * @title: Connector Helper
> + * @include: igt_connector_helper.h
> + *
> + * Helper functions for DRM connector operations including enumeration,
> + * lookup by name/path, and EDID serial extraction.
> + */
> +
> +#include <string.h>
> +#include <xf86drm.h>
> +#include <xf86drmMode.h>
> +
> +#include "igt_core.h"
> +#include "igt_edid.h"
> +#include "igt_kms.h"
> +#include "igt_connector_helper.h"
> +
> +/**
> + * igt_connector_get_connected:
> + * @drm_fd: DRM file descriptor
> + * @connectors: array to store connector IDs; must be valid if @max_connectors > 0
> + * @max_connectors: maximum number of connectors to store
> + *
> + * Walks all DRM connectors and stores the IDs of those currently connected.
> + * Scanning stops once @max_connectors IDs have been collected; later
> + * connectors are not examined.
> + *
> + * Returns: number of connector IDs written to @connectors, capped by
> + * @max_connectors.
> + */
> +int igt_connector_get_connected(int drm_fd, uint32_t *connectors,
> +				int max_connectors)
> +{
> +	drmModeRes *res;
> +	drmModeConnector *conn;
> +	int count = 0;
> +	int i;
> +
> +	igt_assert(max_connectors >= 0);
> +	if (max_connectors > 0)
> +		igt_assert(connectors);
> +
> +	res = drmModeGetResources(drm_fd);
> +	if (!res)
> +		return 0;
> +
> +	for (i = 0; i < res->count_connectors && count < max_connectors; i++) {
> +		conn = drmModeGetConnector(drm_fd, res->connectors[i]);
> +		if (!conn)
> +			continue;
> +
> +		if (conn->connection == DRM_MODE_CONNECTED)
> +			connectors[count++] = conn->connector_id;
> +
> +		drmModeFreeConnector(conn);
> +	}
> +
> +	drmModeFreeResources(res);
> +	return count;
> +}
> +
> +/**
> + * igt_connector_get_info:
> + * @drm_fd: DRM file descriptor
> + * @connector_id: connector ID
> + * @name: buffer for connector name (mandatory)
> + * @name_size: size of @name; must be > 0
> + * @serial: buffer for EDID-derived serial (mandatory)
> + * @serial_size: size of @serial; must be > 1
> + * @path: buffer for MST PATH property (optional, may be NULL)
> + * @path_size: size of @path buffer
> + *
> + * Fills connector name, MST PATH, and EDID-derived serial for a connector.
> + * @name is always filled when the connector is found. @serial is filled from
> + * the ASCII serial string descriptor (0xFF) if present, else from the 32-bit
> + * header serial number; left empty if no EDID is available. @path is filled
> + * only if requested and the PATH property exists.
> + *
> + * Success means the connector object was found and @name was filled.
> + * @serial and @path are best-effort and may still be empty on success.
> + *
> + * Returns: true if the connector was found, false otherwise.
> + */
> +bool igt_connector_get_info(int drm_fd, uint32_t connector_id,
> +			    char *name, size_t name_size,
> +			    char *serial, size_t serial_size,
> +			    char *path, size_t path_size)
> +{
> +	drmModeConnector *conn;
> +	drmModePropertyBlobPtr edid_blob = NULL;
> +	uint64_t blob_id = 0;
> +	drmModePropertyPtr prop;
> +	const struct edid *edid;
> +	int i;
> +
> +	igt_assert(name && name_size > 0);
> +	igt_assert(serial && serial_size > 1);
> +	igt_assert(!path || path_size > 0);
> +
> +	name[0] = '\0';
> +	serial[0] = '\0';
> +	if (path)
> +		path[0] = '\0';
> +
> +	conn = drmModeGetConnector(drm_fd, connector_id);
> +	if (!conn)
> +		return false;
> +
> +	snprintf(name, name_size, "%s-%d",
> +		 kmstest_connector_type_str(conn->connector_type),
> +		 conn->connector_type_id);
> +
> +	for (i = 0; i < conn->count_props; i++) {
> +		prop = drmModeGetProperty(drm_fd, conn->props[i]);
> +		if (!prop)
> +			continue;
> +
> +		if (strcmp(prop->name, "EDID") == 0)
> +			blob_id = conn->prop_values[i];
> +
> +		drmModeFreeProperty(prop);
> +		if (blob_id)
> +			break;
> +	}
> +
> +	/* Extract MST PATH if requested */
> +	if (path) {
> +		drmModePropertyBlobPtr path_blob;
> +
> +		/* PATH blob payload is a NUL-terminated string */
> +		path_blob = kmstest_get_path_blob(drm_fd, connector_id);
> +		if (path_blob) {
> +			snprintf(path, path_size, "%s",
> +				 (const char *)path_blob->data);
> +			drmModeFreePropertyBlob(path_blob);
> +		}
> +	}
> +
> +	drmModeFreeConnector(conn);
> +
> +	if (blob_id) {
> +		edid_blob = drmModeGetPropertyBlob(drm_fd, blob_id);
> +		if (edid_blob) {
> +			if (edid_blob->length >= sizeof(struct edid)) {
> +				edid = edid_blob->data;
> +				edid_get_any_serial(edid, serial, serial_size);
> +			}
> +			drmModeFreePropertyBlob(edid_blob);
> +		}
> +	}
> +
> +	return true;
> +}
> +
> +/**
> + * igt_connector_find_by_path:
> + * @drm_fd: DRM file descriptor
> + * @path: MST PATH property value to match
> + * @connector_id: output for connector ID (filled on success)
> + *
> + * Finds the currently connected connector whose PATH property matches @path
> + * (exact string comparison).  PATH is the preferred stable identity for MST
> + * connectors; connector IDs may change across hotplug events.
> + *
> + * Returns: true if a matching connected connector was found.
> + */
> +bool igt_connector_find_by_path(int drm_fd, const char *path,
> +				uint32_t *connector_id)
> +{
> +	drmModeRes *res;
> +	drmModeConnector *conn;
> +	drmModePropertyBlobPtr path_blob;
> +	bool found = false;
> +	int i;
> +
> +	if (!path || !connector_id)
> +		return false;
> +
> +	res = drmModeGetResources(drm_fd);
> +	if (!res)
> +		return false;
> +
> +	for (i = 0; i < res->count_connectors && !found; i++) {
> +		conn = drmModeGetConnector(drm_fd, res->connectors[i]);
> +		if (!conn)
> +			continue;
> +
> +		if (conn->connection == DRM_MODE_CONNECTED) {
> +			path_blob = kmstest_get_path_blob(drm_fd,
> +							  conn->connector_id);
> +			if (path_blob) {
> +				if (strcmp(path_blob->data, path) == 0) {
> +					*connector_id = conn->connector_id;
> +					found = true;
> +				}
> +				drmModeFreePropertyBlob(path_blob);
> +			}
> +		}
> +
> +		drmModeFreeConnector(conn);
> +	}
> +
> +	drmModeFreeResources(res);
> +
> +	if (found)
> +		igt_debug("igt_connector: Found connector %u for path '%s'\n",
> +			  *connector_id, path);
> +
> +	return found;
> +}
> +
> +/**
> + * igt_connector_find_by_name:
> + * @drm_fd: DRM file descriptor
> + * @name: connector name to match (e.g., "DP-6")
> + * @connector_id: output for connector ID (filled on success)
> + *
> + * Name-based lookup helper.  Prefer igt_connector_find_by_path() for MST
> + * connectors, since connector names and IDs may change across hotplug events.
> + *
> + * Returns: true if a matching connected connector was found.
> + */
> +bool igt_connector_find_by_name(int drm_fd, const char *name,
> +				uint32_t *connector_id)
> +{
> +	drmModeRes *res;
> +	drmModeConnector *conn;
> +	char conn_name[IGT_CONNECTOR_NAME_MAX];
> +	bool found = false;
> +	int i;
> +
> +	if (!name || !connector_id)
> +		return false;
> +
> +	res = drmModeGetResources(drm_fd);
> +	if (!res)
> +		return false;
> +
> +	for (i = 0; i < res->count_connectors && !found; i++) {
> +		conn = drmModeGetConnector(drm_fd, res->connectors[i]);
> +		if (!conn)
> +			continue;
> +
> +		snprintf(conn_name, sizeof(conn_name), "%s-%d",
> +			 kmstest_connector_type_str(conn->connector_type),
> +			 conn->connector_type_id);
> +
> +		if (strcmp(conn_name, name) == 0 &&
> +		    conn->connection == DRM_MODE_CONNECTED) {
> +			*connector_id = conn->connector_id;
> +			found = true;
> +		}
> +
> +		drmModeFreeConnector(conn);
> +	}
> +
> +	drmModeFreeResources(res);
> +
> +	if (found)
> +		igt_debug("igt_connector: Found connector %u for name '%s'\n",
> +			  *connector_id, name);
> +
> +	return found;
> +}
> +
> +/**
> + * igt_connector_reprobe_all:
> + * @drm_fd: DRM file descriptor
> + *
> + * Issues a GETCONNECTOR ioctl for every connector, requesting fresh state
> + * from the kernel. This is often sufficient to refresh connector status and
> + * MST topology visibility after hotplug events, but does not guarantee a
> + * full hardware reprobe in all driver paths.
> + */
> +void igt_connector_reprobe_all(int drm_fd)
> +{
> +	drmModeRes *res;
> +	drmModeConnector *conn;
> +	int i;
> +
> +	res = drmModeGetResources(drm_fd);
> +	if (!res)
> +		return;
> +
> +	for (i = 0; i < res->count_connectors; i++) {
> +		conn = drmModeGetConnector(drm_fd, res->connectors[i]);
> +		if (conn)
> +			drmModeFreeConnector(conn);
> +	}
> +
> +	drmModeFreeResources(res);
> +}
> diff --git a/lib/igt_connector_helper.h b/lib/igt_connector_helper.h
> new file mode 100644
> index 000000000..fffb2661b
> --- /dev/null
> +++ b/lib/igt_connector_helper.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef IGT_CONNECTOR_HELPER_H
> +#define IGT_CONNECTOR_HELPER_H
> +
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <stdint.h>
> +
> +#define IGT_CONNECTOR_NAME_MAX 32
> +
> +int igt_connector_get_connected(int drm_fd, uint32_t *connectors,
> +				int max_connectors);
> +bool igt_connector_get_info(int drm_fd, uint32_t connector_id,
> +			    char *name, size_t name_size,
> +			    char *serial, size_t serial_size,
> +			    char *path, size_t path_size);
> +bool igt_connector_find_by_path(int drm_fd, const char *path,
> +				uint32_t *connector_id);
> +bool igt_connector_find_by_name(int drm_fd, const char *name,
> +				uint32_t *connector_id);
> +void igt_connector_reprobe_all(int drm_fd);
> +
> +#endif /* IGT_CONNECTOR_HELPER_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index ea721ecf7..074b21fdf 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -113,6 +113,7 @@ lib_sources = [
>   	'igt_vmwgfx.c',
>   	'igt_psr.c',
>   	'igt_amd.c',
> +	'igt_connector_helper.c',
>   	'igt_edid.c',
>   	'igt_eld.c',
>   	'igt_infoframe.c',
