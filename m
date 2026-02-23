Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271AFE98DE9
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 05:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C969710E225;
	Mon, 23 Feb 2026 05:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QhHAlEIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F33D10E225
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 05:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771825804; x=1803361804;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=mOQIe2ngpVG3Is2Swm5g71XvQIKxvpm1KiyJY8Y0Eco=;
 b=QhHAlEIYmlXe/dmB/c58hz9h1oWZEqQIJr53+PIZpUqaUVpJWrVrLsY9
 faoLrouGV5mIpOJSMM2iwicn5AfL6/Yn6VtOQzZyMT+r/dzytCj6W4wOO
 HCw5GKV4DL69tjKTnqLX0Bce9UMQRSHEd7KJVlC7wCUic46qWc7Uw2+/e
 kFypqJX8YTEp4AZWmDwJ0Jcu+uFEihnMPFiAQKcP0WZ84yNmdmiul7kqe
 Z+mnqZoN+Js/mbt4qo6AfVWb2fdEy5ZNsy+R1NCil84s7QX60bm5MINik
 FuiDjAxerd5jh0TNpMj7jmftQBPOH3MBPz9duprOR+703a74ZWXyHzgrf w==;
X-CSE-ConnectionGUID: /Md+p//ORZudSakhbUbLrg==
X-CSE-MsgGUID: h/zAP/9MTseoi6VUYzbCkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="84178880"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208,217";a="84178880"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:50:04 -0800
X-CSE-ConnectionGUID: VlU53XidTCa9KNKEqtppeQ==
X-CSE-MsgGUID: HW+gtoT+T8W9pcntqVDAew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
 d="scan'208,217";a="246052295"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:50:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:50:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 21:50:03 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:50:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbUED7NXbtTrzg48PL6Gz71PwQ1/EI0Ikgv/KX3C0ZuTIid+MLUJlVX3oKhduBb8kdp3+WGl/AKYRZt4orC/4VnxyORUPc0ZXqxv9RZk6nqjuQDcAKvyxi7bGFWdJwTAmtE7VdLv+p3iW2JsShh1v/W6cSLxgQ352Gt/z3xUC/DHG5v+v7CIN1DbbRCwGMcKAD9EtF5N0V62wWR7cKvfhkVSJn+rSXzVf6tVzzhc0CoD8H9QSWbPi7nloUxBhaDD67o9nRJS7eYsioAuamN+azIF/DQPcUkeju4ezPBelAGRHzGO+G/8L5/2UZqsBSEUlCH9zlZIudhDHVPXIDNDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCaemaeaN/khzrKBQFzD5kXMq2T214EekSgospVRuzs=;
 b=e5YvkR8a9TfdKl1ttorxWjjrGQBC4PAl3H97V3penlk7hUWPcH2LxqsH068d2ZBC+lDvU0pAqeuLusF1Cd7Nu7c16fnwIMKBhPWGBZrgzcmo5fd1I1j5O1IYeZTOE4w6ikRpy0mZVoRC2ZlLwMz9Yy/2ngtCtUQB/aOxFgZVcyGjjxdrJy0hRicoXTCVqFh7Qwo9iGlBWoFPy8FLmhymjz+Am+wJTQK0ufvg/ClFIe5/FMWTnLrL/ZwCXATPM/rV+3F3iyI1qrgyH/Gi10c2DAIiNhRlehGZFOQboCdJwxiVlqxKQm/pwen18URWGIJO9ioGD7UJ0+8n4pKE8oiIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 05:50:00 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 05:50:00 +0000
Content-Type: multipart/alternative;
 boundary="------------pjwU6atkf1lmv9NT3xkBPSmQ"
Message-ID: <bf1586d7-6753-488b-8ea6-d5bbb41dfb66@intel.com>
Date: Mon, 23 Feb 2026 11:19:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 3/8] tests/intel/xe_madvise: Add
 dontneed-before-mmap subtest
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-4-arvind.yadav@intel.com>
 <BL1PR11MB5525EA60CF564CF51C1A85E18477A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <BL1PR11MB5525EA60CF564CF51C1A85E18477A@BL1PR11MB5525.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA5P287CA0158.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::6) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|CY5PR11MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e61a1c-ab9e-4719-1a19-08de729f61cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z29EdmRNUXczSzdmOTVNcGlZN2xJcVl0alNRc3FHWVFuL2NxN1QwTUFyTnNp?=
 =?utf-8?B?NlFsUEdJTVl6ZHhsQTVoYVBnenhGSjljTlpSd214aUpDOTVSSHNzK2trK0ZP?=
 =?utf-8?B?TEZRVXluRnVRY2UzMnRHemJHVjhZR2NVaWozZitGNWpsS2o5UWhUTW5xQjFF?=
 =?utf-8?B?S1ZlUEUreVdtMGlQTC9oVXlKVjQxcjBVSVM5V1pyRmZtdXhUYm9XT0V6QjBx?=
 =?utf-8?B?WnByYVNFZGtTdkhtd2hlQ0RtNy9PaFJqUVRCK3o4bDM0TnpKWUdmeVR3MHZR?=
 =?utf-8?B?RkRIaFB0Z3BHZFZYODlCM1UzZit0NHhkaWdFRTVycEZTemZ6QjFSNldVOWZE?=
 =?utf-8?B?WEVqcExHOFF5YmErYjhwNTIvUmg5bkRoYTVGbjRabzNINVNXOHQxdzdleWtB?=
 =?utf-8?B?OWdMY3N5blFKQ1UxSlRUL3o4R0U1SmNSeWRRUW1pM1lKd0dOcUxnZ1NhL2VS?=
 =?utf-8?B?NXBGZDAvdWYxaHBiS3hOUjRiR2VzNjEwcFVuZUt0aDA0NHpYQ1JaeU9UYXZ2?=
 =?utf-8?B?bStQWGFxOHg4NlhKUkQxZ09Mb3BBQkc1d2QwNzhrTUhWZUJHMUJoR0tOaHR3?=
 =?utf-8?B?dmtoUng3cUJFYzh5eGw4aVlLNDZPSGFzeHNDOC9jQXYzVUQ4a2V5cjdkRW5N?=
 =?utf-8?B?WFc2NDlJMGF2Z3ZSMVFHejBONVE2TFZSbUpUSFVycWoraVAyUzRHVm1LVkpM?=
 =?utf-8?B?NHpnNTJ1bW1xLzlnRVJ1RFE5VU4vQVlualg0aHltQ3JROUV6YjlzWlBOR3NP?=
 =?utf-8?B?NTBUU2V2UDhuNmh2MTlpdFU2OEhUZGxPUWZnbkRYTU9SSDJiRGl1OGkwbnhj?=
 =?utf-8?B?QUo3a2ZUcVk2VEU4OUxMdlQ0VVcyK0lhclB0UkhZcFE3d2JwbHJCd1hkUXNk?=
 =?utf-8?B?amlHc2c2bk04S3d4V0ZnemlSdzVoZVEvb25YbEQ5c2NBNE12TDdIQ3diTXE2?=
 =?utf-8?B?WlRDL05RZFdiY0hVWkxMZ3ZGd2d4alNyVFROZXlVak5iYU12N1JmeU5RQ1k2?=
 =?utf-8?B?eFJnNW1tK3dvby9TTm9wOUJDNmMvOCtzMnYrRWllZ1BBazJaNStNWVFXcGxW?=
 =?utf-8?B?NDk5RHZnbU5xL2JUQ1ZhZ0RUVnZnTDBBNlcybjdxY3JRTk9UbmN3VlZ4Um1l?=
 =?utf-8?B?VGNtZ3h3S3JNRGlGUHhndU1OSXdmSDBXYzdhNUJYSmM2dUhKaUVmeVZnMDE0?=
 =?utf-8?B?OEx5SXNNb1JDZnQ5ejNoK1JZazBlQjRhMTNiNVpPNWJuam16U2RweEpqYTRB?=
 =?utf-8?B?WUQ5OEsyaUIwMHRQQ2FXWWpJU2Ntc2p2d0xGVEF2QWpXTFh2TzZmSUVUODZH?=
 =?utf-8?B?czBXamd2MGdRendtQkZ3TE9wNy81ZHM4U29BNDRaSFI0VjI0ckwzR1E0Vjhp?=
 =?utf-8?B?MEoyM3JDakt6MTVRelhBOEp5RzViWDFJSlRtNnRLWXE2SnZJVTJTeTV4ZGxo?=
 =?utf-8?B?b2VvVzJiemViMFltY1VSWGg5MTU4eERVVlFwdStGWjVGOFBISExCNVQzVlZj?=
 =?utf-8?B?SG45a25XZGRCWTJscEcvcW9kaEpvS2U1dFd2VHdGK0MrUnozTmdnRWtXSU4w?=
 =?utf-8?B?SVRZajJuSGU3NldvS3NJaENOMTRucVpqUlZXTzd3SHNBWEx6SXI0OEtpTzhR?=
 =?utf-8?B?Zk1wQ210VGNFWWtjMmE4TkQ2bDRJOXh5aHFkYjVUdjU2WXVRZ2dCSEpoMDJo?=
 =?utf-8?B?RkcxclI0cHZFdDRybGVRUDAyaHlZR1R0NFhvMjBUazRkUHVscWpjdEcwbVE1?=
 =?utf-8?B?ZDRKRG42cWovVGpNaTdrcXFxZmkvMi9DM2lMRXlEbEMyd1djQnlrQXRDazBt?=
 =?utf-8?B?dE1VK3dyY3NHVHNvR1k1LzFsYTJjLzRnaVBJZDJXRlM0d3FxVHE3bjZ6WHI4?=
 =?utf-8?B?Q3FMejI3eGhxLzlDZnpqNzZZbUtKT0I0RTRFVGROMzRINnlVZlZxTWhMSmww?=
 =?utf-8?B?T0xSb1FtNXIybTdvTW9BeTVYUFlNRk94WFJKOWhSVjgvOUk0TWJkYW1uWFEy?=
 =?utf-8?B?RjNqTjEvWWFXemdRWTJBYmZLOHhnL3ZkazJQNERyNG9WeHFOSi9DaUlYSzVa?=
 =?utf-8?B?YmpLQlBSSDd0MUdlWUdOL1MrMzI1TThOc3FKenAvbEw1V05reTZnN1N4aUp4?=
 =?utf-8?Q?ln4g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3d5SjlwSWJxdHE1L3dWZTFGSE1iclBJSnlsK2ZJdllScjJHS2M5NDFIQ29I?=
 =?utf-8?B?VEg5MVFVL0U2QVh3MkdTWU9XbUVqTVVxWG9GY2ZUOWQzaVVnNVo2MG5rVkVP?=
 =?utf-8?B?MzNGZi9NaERqMlpyUXFrb1MyQ3dNUXZBZnBmbEM2cGtOYkU1R1EwenQ2bTEw?=
 =?utf-8?B?QlhJU2ZVS0pFUGhXYm5sZm1QcXBJM2ViTnlLM0MzWEFCTUk0K1FuR3ZTMU1J?=
 =?utf-8?B?TS9TM0ZzZ0hjaVMzZnFIb0toTFg1d1dRbThnM1YrVXY4Z0Jha2ZOWmlCWDYr?=
 =?utf-8?B?VEZ2SjI4SHhocXZHT1JjU1Z3MVdaSUZ4MHFQM1BkWFJTOWtUTmFYTkJJZU8x?=
 =?utf-8?B?anBTYkY3dTBlNzdjYTJiclJsM1pYYzJpOXRVMUVsekkvZFhrc2k3akllZk1J?=
 =?utf-8?B?eHNPY0l4R2Q5dm1jSmF0TjZqYTJ4eDJkSCt4V0IvR3QxenhPR1RLUkFaRzdu?=
 =?utf-8?B?S2FMa3RpNFRvS25WcTNOOWxJUEJuTTg2WjlWa0dRS3ZYVFVaR01iRVFjK1FJ?=
 =?utf-8?B?VTFJdEo1WXFpTGp0dER6amZIOTN5djB2aVBnak5IdlMyNTBxMVVrZHpqN3k0?=
 =?utf-8?B?UDBheTlLa1dyejhSc05DU2NLUUE3bmlQdXNLWmlUaGFlMEpUMDJ2T3pIcDM4?=
 =?utf-8?B?OEh3RFZXSUVmSzUrZHdPdEUrQkU5b1lKUk9qZEJuZ3RFUWhQcDJaTUNYc3du?=
 =?utf-8?B?T0JySVh2Tm9CT1VZRWduZUMyVW9IMUhhckFzeW9KNStmRVc0dE5QL3hRREZG?=
 =?utf-8?B?Z1RwanMxMkZtaUxTUzF4TXRoNnVyenRnMzNpc1REbnEzU25pSjQvYlp6RkZs?=
 =?utf-8?B?alo0cFRQeUdTZHJzOGJYay9tVHFwQW15bC9rVWQwdTQwZjdnZDN6eEY1cXE4?=
 =?utf-8?B?d0NjMDQrYjJUcFBFNnlHZUx4MTF3enVQVUFRMHQvSEkyNW41eG9sa01QVFBu?=
 =?utf-8?B?d2xhWGs4cFBuWDdPT3VSOHYzYnJ0ZEJ3U3Z0U2lOaDR3QVVieDlnWlF5am5V?=
 =?utf-8?B?UGEvSFc3Mm54cGRtWkluQStaVmh5emYxeUpTZXgwaElXQmFGQk84M0x5QVBR?=
 =?utf-8?B?NlFYTm5rWHZoM1ZkVCs4L3J2bG11bit5aDFWR0VHOGJROW1ObDJWdy9MeXJN?=
 =?utf-8?B?SHpQNHRYT3FHaEZSVm5XUHdzWW1BbmMrT0Fra3d2cXJhdEdad3V6UHdzYTZu?=
 =?utf-8?B?L2NmL1NiQlp3QTdQOGFqTURYQnI4V0hCZmtiVW1oZUJ2RWpPS0hxRkdHTDJy?=
 =?utf-8?B?eU1vRkttTXlpTEFUSHA3N1NCQ0svWXowNnZKTVFjd2ZIRERIYjl0dEdPR2Vo?=
 =?utf-8?B?d2RuWm1ib0s5akpxcXRGb09DbVhqRGc4eG5NS3UxQmZHMEJBQUtnZ1UxYTlM?=
 =?utf-8?B?dXpza1VPdG0rR29rWS84cG51MGx2d05leFROOHhxaXFKR2pBMWl2YWtsOWFD?=
 =?utf-8?B?Y1R2eXpreFc1Sno5Sm5xRFRBZ3REZm9Ga0pUdktINEJzQUt3b3NLYUxjbFFJ?=
 =?utf-8?B?YnZLeFU5VzZvWGY1YmY0eW1nbHhva0RSakdEVnY3a0g1NGtzZkhxR1hWdTAw?=
 =?utf-8?B?K0dPR0VmbzMrQmN3UVZOSnFYMnErc0N0bitEd0xOenBra1FkSHdJVTZnWDc5?=
 =?utf-8?B?bTRjaGFpcTcxajc1dWE0ekYxbFNuQmpPWVhsU1lUNnpJZ0ovY2MvUnpxTEtx?=
 =?utf-8?B?WTl2VjRQdmZ3TlpkRWR3MVJBQkhyM2s1OVFId1Bjd3h3WEZHQU9VMW5oNGJn?=
 =?utf-8?B?dlh3RmhrVU8vM1hvUi9LMnhWa0ZRclFtNjBQeTBmMDNseUZkVlFhVWZJYmZw?=
 =?utf-8?B?QllXT3RKaHV5bGt3UTVlNTNJNXpaQy9hSUFFd1FjNDdXN0g5Y3ZoUlkrYXdQ?=
 =?utf-8?B?dmE0b3kwR2JjVDJGMDRXa3Y0SlJuSm00eENyb29tbDk5NTN0UVBpQkRLeTRB?=
 =?utf-8?B?aS9UelJCdENsemFwdFpwT2dvQUlpRjRnU1k0RUpxTUIyTkFFdEREZldzOGJI?=
 =?utf-8?B?UEVTUFhpWlNTVEUyRmxmVGk1SWtyZGtMSVFLOVhuazNJdWxPeGpvcnh5VWNT?=
 =?utf-8?B?OHpYZDBxekkvUG9jU04vdnp5d1RsNTlxTk9RTHNsMFBrT0o1Z0dvR251Umd2?=
 =?utf-8?B?UXF2UUdFeW5NRWdCNjVUcnc0Y1B6K3RXcXl1WXVYUzhyQXBBcVhYUHdpcmFG?=
 =?utf-8?B?TDU5dWhTLysyRkR4c2dZaXF5ZGJOaXpjK0Ywc0V1cDRlbWYrdjRENGt5N1J5?=
 =?utf-8?B?bVJsdklNT0RlVkh0WnVvK3JveGpWa0RQN2JHZjFkTXo5cUUxdFJMRTdRRWI1?=
 =?utf-8?B?T05TdmpsMGQyK0lDMmovMEIremFpNDVkTHRzd1FPNnU3Z0wvVkZBY1pjbzll?=
 =?utf-8?Q?y/uwLBK/ub85Vuq0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e61a1c-ab9e-4719-1a19-08de729f61cc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 05:50:00.2874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHiFts1Ia4e8Q6FPlJzZEDTjQlyD9RnIyEFcMm1aLXKK1JfRT9pmVI/cvWkKZMi/E+ugRWbHIfqZxrAixUP7cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
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

--------------pjwU6atkf1lmv9NT3xkBPSmQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 2/23/2026 10:39 AM, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: Yadav, Arvind<arvind.yadav@intel.com>
>> Sent: Tuesday, 17 February, 2026 08:04 AM
>> To:igt-dev@lists.freedesktop.org
>> Cc: Brost, Matthew<matthew.brost@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>;thomas.hellstrom@linux.intel.com;
>> Sharma, Nishit<nishit.sharma@intel.com>; Gurram, Pravalika
>> <pravalika.gurram@intel.com>
>> Subject: [PATCH i-g-t v3 3/8] tests/intel/xe_madvise: Add dontneed-before-
>> mmap subtest
>>
>> This test validates kernel behavior when mapping a BO that was already
>> marked as purgeable and purged before mmap. After purging the BO under
>> memory pressure, the test attempts to mmap and access it. The kernel should
>> trigger SIGBUS or SIGSEGV when accessing the purged mapping, confirming
>> that purged memory is properly invalidated.
>>
>> Cc: Nishit Sharma<nishit.sharma@intel.com>
>> Cc: Pravalika Gurram<pravalika.gurram@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav<arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 219
>> +++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build        |   1 +
>>   2 files changed, 220 insertions(+)
>>   create mode 100644 tests/intel/xe_madvise.c
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c new file mode
>> 100644 index 000000000..7dbe70f42
>> --- /dev/null
>> +++ b/tests/intel/xe_madvise.c
>> @@ -0,0 +1,219 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Validate purgeable BO madvise functionality
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: Memory management tests
>> + * Functionality: madvise, purgeable
>> + */
>> +
>> +#include "igt.h"
>> +#include "xe_drm.h"
>> +
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +
>> +/* Purgeable test constants */
>> +#define PURGEABLE_ADDR		0x1a0000
>> +#define PURGEABLE_BO_SIZE	4096
>> +
>> +/**
>> + * trigger_memory_pressure - Fill VRAM + 25% to force purgeable reclaim
>> + * @fd: DRM file descriptor
>> + * @vm: VM handle (unused, kept for API compatibility)
>> + *
>> + * Allocates BOs in a temporary VM until VRAM is overcommitted,
>> + * forcing the kernel to purge DONTNEED-marked BOs.
>> + */
>> +static void trigger_memory_pressure(int fd, uint32_t vm) {
>> +	uint64_t vram_size, overpressure;
>> +	const uint64_t chunk = 8ull << 20; /* 8 MiB */
>> +	int max_objs, n = 0;
>> +	uint32_t *handles;
>> +	uint64_t total;
>> +	void *p;
>> +	uint32_t handle, temp_vm;
>> +
>> +	/* Use a separate VM so pressure BOs don't affect the test VM */
>> +	temp_vm = xe_vm_create(fd, 0, 0);
>> +
>> +	vram_size = xe_visible_vram_size(fd, 0);
>> +	/* Scale overpressure to 25% of VRAM, minimum 64MB */
>> +	overpressure = vram_size / 4;
>> +	if (overpressure < (64 << 20))
>> +		overpressure = 64 << 20;
>> +
>> +	max_objs = (vram_size + overpressure) / chunk + 1;
>> +	handles = malloc(max_objs * sizeof(*handles));
>> +	igt_assert(handles);
>> +
>> +	total = 0;
>> +	while (total < vram_size + overpressure && n < max_objs) {
>> +		handle = xe_bo_create(fd, temp_vm, chunk,
>> +				      vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +		handles[n++] = handle;
>> +		total += chunk;
>> +
>> +		p = xe_bo_map(fd, handle, chunk);
>> +		igt_assert(p != MAP_FAILED);
>> +
>> +		/* Fault in all pages so they actually consume VRAM */
>> +		memset(p, 0xCD, chunk);
>> +		munmap(p, chunk);
>> +	}
>> +
>> +	/* Allow shrinker time to process pressure */
>> +	usleep(100000);
>> +
>> +	for (int i = 0; i < n; i++)
>> +		gem_close(fd, handles[i]);
>> +
>> +	free(handles);
>> +
>> +	xe_vm_destroy(fd, temp_vm);
>> +}
>> +
>> +static jmp_buf jmp;
>> +
>> +__noreturn static void sigtrap(int sig) {
>> +	siglongjmp(jmp, sig);
>> +}
>> +
>> +/**
>> + * purgeable_mark_and_verify_purged - Mark DONTNEED, pressure, check
>> +purged
>> + * @fd: DRM file descriptor
>> + * @vm: VM handle
>> + * @addr: Virtual address of the BO
>> + * @size: Size of the BO
>> + *
>> + * Returns true if the BO was purged under memory pressure.
>> + */
>> +static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm,
>> +uint64_t addr, size_t size) {
>> +	uint32_t retained;
>> +
>> +	/* Mark as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	if (retained != 1)
>> +		return false;
>> +
>> +	/* Trigger memory pressure */
>> +	trigger_memory_pressure(fd, vm);
>> +
>> +	/* Verify purged */
>> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	return retained == 0;
>> +}
>> +
>> +/**
>> + * purgeable_setup_simple_bo - Setup VM and bind a single BO
>> + * @fd: DRM file descriptor
>> + * @vm: Output VM handle
>> + * @bo: Output BO handle
>> + * @addr: Virtual address to bind at
>> + * @size: Size of the BO
>> + * @use_scratch: Whether to use scratch page flag
>> + *
>> + * Helper to create VM, BO, and bind it at the specified address.
>> + */
>> +static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
>> +				      uint64_t addr, size_t size, bool
>> use_scratch) {
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = 1,
>> +	};
>> +	uint64_t sync_val = 0;
>> +
>> +	*vm = xe_vm_create(fd, use_scratch ?
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +	*bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +	sync.addr = to_user_pointer(&sync_val);
>> +	xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &sync, 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC); }
>> +
>> +/**
>> + * SUBTEST: dontneed-before-mmap
>> + * Description: Mark BO as DONTNEED before mmap, verify mmap fails or
>> +SIGBUS on access
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_before_mmap(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t bo, vm;
>> +	uint64_t addr = PURGEABLE_ADDR;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	void *map;
>> +
>> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
>> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
>> +		igt_skip("Unable to induce purge on this platform/config");
No cleanup before igt_skip() or it's handled somewhere. gem_close(fd, 
bo) and xe_vm_destroy(fd, vm);
>> +
>> +	/* mmap the purged BO - access should trigger SIGBUS */
>> +	map = xe_bo_map(fd, bo, bo_size);
Should check igt_assert(map != MAP_FAILED) before using it below.
>> +
>> +	{
>> +		sighandler_t old_sigsegv, old_sigbus;
>> +		char *ptr = (char *)map;
>> +		int sig;
>> +
>> +		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
>> +		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
>> +
>> +		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
>> +		switch (sig) {
>> +		case SIGBUS:
>> +		case SIGSEGV:
>> +			/* Expected - purged BO access failed */
>> +			break;
>> +		case 0:
>> +			*ptr = 0;
>> +			__attribute__ ((fallthrough));

why this __attribute__? Any compiler warning? Can't it be handled like

case 0:

default:

     *ptr = 0;

igt_assert_f(false, "Access to purged mmap should trigger SIGBUS, got 
sig=%d\n", sig);

break;

as you are doing intentional fallout from case 0 to default?

>> +		default:
>> +			igt_assert_f(false,
>> +				     "Access to purged mmap should trigger
>> SIGBUS, got sig=%d\n",
>> +				     sig);
>> +			break;
>> +		}
>> +
>> +		signal(SIGBUS, old_sigbus);
>> +		signal(SIGSEGV, old_sigsegv);
>> +		munmap(map, bo_size);
>> +	}
>> +
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +int igt_main()
>> +{
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	int fd;
>> +
>> +	igt_fixture() {
>> +		fd = drm_open_driver(DRIVER_XE);
>> +		xe_device_get(fd);
>> +	}
>> +
>> +	igt_subtest("dontneed-before-mmap")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_before_mmap(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_fixture() {
>> +		xe_device_put(fd);
>> +		drm_close_driver(fd);
>> +	}
>> +}
> Reviewed-by: Pravalika Gurram<pravalika.gurram@intel.com>
>> diff --git a/tests/meson.build b/tests/meson.build index
>> 0ad728b87..9d41d7de6 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -313,6 +313,7 @@ intel_xe_progs = [
>>   	'xe_huc_copy',
>>   	'xe_intel_bb',
>>   	'xe_live_ktest',
>> +	'xe_madvise',
>>   	'xe_media_fill',
>>   	'xe_mmap',
>>           'xe_module_load',
>> --
>> 2.43.0
--------------pjwU6atkf1lmv9NT3xkBPSmQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/23/2026 10:39 AM, Gurram,
      Pravalika wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:BL1PR11MB5525EA60CF564CF51C1A85E18477A@BL1PR11MB5525.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Yadav, Arvind <a class="moz-txt-link-rfc2396E" href="mailto:arvind.yadav@intel.com">&lt;arvind.yadav@intel.com&gt;</a>
Sent: Tuesday, 17 February, 2026 08:04 AM
To: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
Cc: Brost, Matthew <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>; Ghimiray, Himal Prasad
<a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:thomas.hellstrom@linux.intel.com">thomas.hellstrom@linux.intel.com</a>;
Sharma, Nishit <a class="moz-txt-link-rfc2396E" href="mailto:nishit.sharma@intel.com">&lt;nishit.sharma@intel.com&gt;</a>; Gurram, Pravalika
<a class="moz-txt-link-rfc2396E" href="mailto:pravalika.gurram@intel.com">&lt;pravalika.gurram@intel.com&gt;</a>
Subject: [PATCH i-g-t v3 3/8] tests/intel/xe_madvise: Add dontneed-before-
mmap subtest

This test validates kernel behavior when mapping a BO that was already
marked as purgeable and purged before mmap. After purging the BO under
memory pressure, the test attempts to mmap and access it. The kernel should
trigger SIGBUS or SIGSEGV when accessing the purged mapping, confirming
that purged memory is properly invalidated.

Cc: Nishit Sharma <a class="moz-txt-link-rfc2396E" href="mailto:nishit.sharma@intel.com">&lt;nishit.sharma@intel.com&gt;</a>
Cc: Pravalika Gurram <a class="moz-txt-link-rfc2396E" href="mailto:pravalika.gurram@intel.com">&lt;pravalika.gurram@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Signed-off-by: Arvind Yadav <a class="moz-txt-link-rfc2396E" href="mailto:arvind.yadav@intel.com">&lt;arvind.yadav@intel.com&gt;</a>
---
 tests/intel/xe_madvise.c | 219
+++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 220 insertions(+)
 create mode 100644 tests/intel/xe_madvise.c

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c new file mode
100644 index 000000000..7dbe70f42
--- /dev/null
+++ b/tests/intel/xe_madvise.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: Validate purgeable BO madvise functionality
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: Memory management tests
+ * Functionality: madvise, purgeable
+ */
+
+#include &quot;igt.h&quot;
+#include &quot;xe_drm.h&quot;
+
+#include &quot;xe/xe_ioctl.h&quot;
+#include &quot;xe/xe_query.h&quot;
+
+/* Purgeable test constants */
+#define PURGEABLE_ADDR		0x1a0000
+#define PURGEABLE_BO_SIZE	4096
+
+/**
+ * trigger_memory_pressure - Fill VRAM + 25% to force purgeable reclaim
+ * @fd: DRM file descriptor
+ * @vm: VM handle (unused, kept for API compatibility)
+ *
+ * Allocates BOs in a temporary VM until VRAM is overcommitted,
+ * forcing the kernel to purge DONTNEED-marked BOs.
+ */
+static void trigger_memory_pressure(int fd, uint32_t vm) {
+	uint64_t vram_size, overpressure;
+	const uint64_t chunk = 8ull &lt;&lt; 20; /* 8 MiB */
+	int max_objs, n = 0;
+	uint32_t *handles;
+	uint64_t total;
+	void *p;
+	uint32_t handle, temp_vm;
+
+	/* Use a separate VM so pressure BOs don't affect the test VM */
+	temp_vm = xe_vm_create(fd, 0, 0);
+
+	vram_size = xe_visible_vram_size(fd, 0);
+	/* Scale overpressure to 25% of VRAM, minimum 64MB */
+	overpressure = vram_size / 4;
+	if (overpressure &lt; (64 &lt;&lt; 20))
+		overpressure = 64 &lt;&lt; 20;
+
+	max_objs = (vram_size + overpressure) / chunk + 1;
+	handles = malloc(max_objs * sizeof(*handles));
+	igt_assert(handles);
+
+	total = 0;
+	while (total &lt; vram_size + overpressure &amp;&amp; n &lt; max_objs) {
+		handle = xe_bo_create(fd, temp_vm, chunk,
+				      vram_if_possible(fd, 0),
+
DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		handles[n++] = handle;
+		total += chunk;
+
+		p = xe_bo_map(fd, handle, chunk);
+		igt_assert(p != MAP_FAILED);
+
+		/* Fault in all pages so they actually consume VRAM */
+		memset(p, 0xCD, chunk);
+		munmap(p, chunk);
+	}
+
+	/* Allow shrinker time to process pressure */
+	usleep(100000);
+
+	for (int i = 0; i &lt; n; i++)
+		gem_close(fd, handles[i]);
+
+	free(handles);
+
+	xe_vm_destroy(fd, temp_vm);
+}
+
+static jmp_buf jmp;
+
+__noreturn static void sigtrap(int sig) {
+	siglongjmp(jmp, sig);
+}
+
+/**
+ * purgeable_mark_and_verify_purged - Mark DONTNEED, pressure, check
+purged
+ * @fd: DRM file descriptor
+ * @vm: VM handle
+ * @addr: Virtual address of the BO
+ * @size: Size of the BO
+ *
+ * Returns true if the BO was purged under memory pressure.
+ */
+static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm,
+uint64_t addr, size_t size) {
+	uint32_t retained;
+
+	/* Mark as DONTNEED */
+	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
+
DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	if (retained != 1)
+		return false;
+
+	/* Trigger memory pressure */
+	trigger_memory_pressure(fd, vm);
+
+	/* Verify purged */
+	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
+
DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
+	return retained == 0;
+}
+
+/**
+ * purgeable_setup_simple_bo - Setup VM and bind a single BO
+ * @fd: DRM file descriptor
+ * @vm: Output VM handle
+ * @bo: Output BO handle
+ * @addr: Virtual address to bind at
+ * @size: Size of the BO
+ * @use_scratch: Whether to use scratch page flag
+ *
+ * Helper to create VM, BO, and bind it at the specified address.
+ */
+static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
+				      uint64_t addr, size_t size, bool
use_scratch) {
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = 1,
+	};
+	uint64_t sync_val = 0;
+
+	*vm = xe_vm_create(fd, use_scratch ?
DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
+	*bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0),
+
DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	sync.addr = to_user_pointer(&amp;sync_val);
+	xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &amp;sync, 1);
+	xe_wait_ufence(fd, &amp;sync_val, 1, 0, NSEC_PER_SEC); }
+
+/**
+ * SUBTEST: dontneed-before-mmap
+ * Description: Mark BO as DONTNEED before mmap, verify mmap fails or
+SIGBUS on access
+ * Test category: functionality test
+ */
+static void test_dontneed_before_mmap(int fd, struct
+drm_xe_engine_class_instance *hwe) {
+	uint32_t bo, vm;
+	uint64_t addr = PURGEABLE_ADDR;
+	size_t bo_size = PURGEABLE_BO_SIZE;
+	void *map;
+
+	purgeable_setup_simple_bo(fd, &amp;vm, &amp;bo, addr, bo_size, false);
+	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
+		igt_skip(&quot;Unable to induce purge on this platform/config&quot;);</pre>
      </blockquote>
    </blockquote>
    No cleanup before igt_skip() or it's handled somewhere.
    gem_close(fd, bo) and xe_vm_destroy(fd, vm);
    <blockquote type="cite" cite="mid:BL1PR11MB5525EA60CF564CF51C1A85E18477A@BL1PR11MB5525.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
+
+	/* mmap the purged BO - access should trigger SIGBUS */
+	map = xe_bo_map(fd, bo, bo_size);</pre>
      </blockquote>
    </blockquote>
    Should check igt_assert(map != MAP_FAILED) before using it below.
    <blockquote type="cite" cite="mid:BL1PR11MB5525EA60CF564CF51C1A85E18477A@BL1PR11MB5525.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
+
+	{
+		sighandler_t old_sigsegv, old_sigbus;
+		char *ptr = (char *)map;
+		int sig;
+
+		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
+		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
+
+		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
+		switch (sig) {
+		case SIGBUS:
+		case SIGSEGV:
+			/* Expected - purged BO access failed */
+			break;
+		case 0:
+			*ptr = 0;
+			__attribute__ ((fallthrough));</pre>
      </blockquote>
    </blockquote>
    <p>why this __attribute__? Any compiler warning? Can't it be handled
      like</p>
    <p>case 0:</p>
    <p>default:</p>
    <p>&nbsp; &nbsp; *ptr = 0;</p>
    <p>&nbsp; &nbsp;&nbsp;<span style="white-space: pre-wrap">igt_assert_f(false, </span><span style="white-space: pre-wrap">&quot;Access to purged mmap should trigger </span><span style="white-space: pre-wrap">SIGBUS, got sig=%d\n&quot;, sig);</span></p>
    <p>break;</p>
    <p>as you are doing intentional fallout from case 0 to default?&nbsp;</p>
    <blockquote type="cite" cite="mid:BL1PR11MB5525EA60CF564CF51C1A85E18477A@BL1PR11MB5525.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
+		default:
+			igt_assert_f(false,
+				     &quot;Access to purged mmap should trigger
SIGBUS, got sig=%d\n&quot;,
+				     sig);
+			break;
+		}
+
+		signal(SIGBUS, old_sigbus);
+		signal(SIGSEGV, old_sigsegv);
+		munmap(map, bo_size);
+	}
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+int igt_main()
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+	}
+
+	igt_subtest(&quot;dontneed-before-mmap&quot;)
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_before_mmap(fd, hwe);
+			break;
+		}
+
+	igt_fixture() {
+		xe_device_put(fd);
+		drm_close_driver(fd);
+	}
+}
</pre>
      </blockquote>
    </blockquote>
    <blockquote type="cite" cite="mid:BL1PR11MB5525EA60CF564CF51C1A85E18477A@BL1PR11MB5525.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">Reviewed-by: Pravalika Gurram <a class="moz-txt-link-rfc2396E" href="mailto:pravalika.gurram@intel.com">&lt;pravalika.gurram@intel.com&gt;</a>
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/tests/meson.build b/tests/meson.build index
0ad728b87..9d41d7de6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -313,6 +313,7 @@ intel_xe_progs = [
 	'xe_huc_copy',
 	'xe_intel_bb',
 	'xe_live_ktest',
+	'xe_madvise',
 	'xe_media_fill',
 	'xe_mmap',
         'xe_module_load',
--
2.43.0
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------pjwU6atkf1lmv9NT3xkBPSmQ--
