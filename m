Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C20C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 22:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC1410E00A;
	Mon, 14 Apr 2025 22:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aiv5R30X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BFC10E00A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 22:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744670188; x=1776206188;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aETtpfJcQoqszrpMBIRo4F3YsDYScMKbowozzEel9bE=;
 b=Aiv5R30X7i3xyDAGvCfAyMKqTVe1572Vuc8G8ApKfZlahkymAV+WLPgc
 A6Ni3Yf5JdQOedY/UnLyHKAiwfJQI7Df+YfsDKdtwBX/REf6ASLm1b609
 KUSh5GSLsEj+WuDsDKWSnZu4a8ecvPqtYpsDPpTVek+snhQ92bwtcOfzO
 L6EANewhJb0PxPvLzHOhrigv46GyM7WmSVBKae5hzAWtnh2CKDpDtY4xw
 MYN5vwteVou5kRTFgMFY3zRZNlUxHCn9ylbW9bcoQB1zm1iGv7BUEY/cz
 +VMbvG3l7y1sNaxSGBI47WxCOl7rPpvzNulVhngxeL2Df6R+UMVy+Nfh5 w==;
X-CSE-ConnectionGUID: uqjuFm+tRkyDXVQ8oCWoKw==
X-CSE-MsgGUID: GjvYsEL8SYqvkTJYMhD4mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56817002"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="56817002"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 15:36:26 -0700
X-CSE-ConnectionGUID: 69qAEnjYQoqhXV0/4ISH+g==
X-CSE-MsgGUID: jn4KpiCDTNOBVI/CqC/xAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135110090"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 15:36:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 15:36:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 15:36:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 15:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZCznLG83G/FCS6G8ObVxldcztz3Q7/0YgWFud9mco0NPOokr/DQZiIZDelP5GHQnpoY97aQmc4HqN1AQsBb59jUaP4r14go6j8QbUXjnAD6nCffQwCTAKgTNUcVLgoimNFWz1BHi3XSXYBVokCyadfMoog7pVWE0VWLxVgWV4ONK5DD3wjuB4m8j46W7jGvLJgkz6jOASTkf8e1S8OyaL0f7V7Q7hc9jtlv0BQzoIsoOEGE/Sw0uAKNaI4hVpfbG8MJyEREvZ70SBinBvsmPSiHlyfAQ69t2wEpI/km9N/CmuviH2SJVJjiNnM+mD4ITkkoSlshHkgoFLbxi7YqEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfAmbjcUrd41fYrFHUbW0dB4Z/wNzshPjSD0BWZMvDg=;
 b=j7YtQPWGQr+VFWIACc2yUSNsrhHVR4BEHCco7xD2rCxfnP+n8ZNwVjSqLWRyczjcHunhm0IPCrjrhRGBsUcnsgoj7D+K1SAGLSizJ+I74QtHcGrlQY3gockxzYqyGHiLKy5gnk9zF7kAq4J16JOEAqDY1wjLg1ws33y5f4zCz4XzC0DzNG/srCLyTIJD5V+6JLiRgCRH26w85ztR3TDwFp6/dF3LSXJFkCZPsKzTu22Q2PidiT9ud40FrTsJPOPq0NRSXqgmGqV/DyvpfLQaB5hBWv/gC1zUD4EnEG6MZqp4Kf+dvqhJBW263t/39ZDPCWl8eec+VKlSMkW82QTjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB6662.namprd11.prod.outlook.com (2603:10b6:806:256::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 22:36:08 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 22:36:08 +0000
Date: Mon, 14 Apr 2025 15:36:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 4/6] tests/intel/xe_oa: Only sanity check timer PEC
 reports
Message-ID: <Z_2N1r1ZlZzgbhac@unerlige-desk.amr.corp.intel.com>
References: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
 <20250408181210.1052760-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250408181210.1052760-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:303:8f::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: 44dacacb-ffae-4b19-ef41-08dd7ba4bff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEpwWGtnclVURDNNRlhLOVJQLzJRVXhvYzhsdE8wOUtUaTdqTGl4RlFJb3dZ?=
 =?utf-8?B?aFFxQklaVlZBRzl0MGg0MEo4RzdvOXFzZm93empSWDVMMC9aaEVReU5NN1R4?=
 =?utf-8?B?K0VsN0Izb2gzL2NGcXJBSytxRGpLMW1SMTJDTUFDZENGQnV0ZnF4eUpRRVRy?=
 =?utf-8?B?WnAycUk1dkI3YkxnQ0svZjdOMDZZcjllM3NJcTVNUzlhSDRGRTlON1g4WVFn?=
 =?utf-8?B?VXFwYWxjKzdHSit6NFNNZThQWXUxWEFXdURpTlRXNUZpdldaVmZKTE1YSHBP?=
 =?utf-8?B?REQ5ZXAyMHRLeG96Uy9BYTVOdGJCeDlKcTE2VnYveTdaMFU1Znhqb1FqYTc5?=
 =?utf-8?B?YnJmaDl2dzhndGlDeU4vTFk3MkpNd3BFZUFxNmFuUmRGdXIraXVKSVA3bDRV?=
 =?utf-8?B?UkFGVVdOaGhkYTBoQ1lHd1hQdVRWUzRTNE40QWxuc3dadkw2RXh3NGJIdjJn?=
 =?utf-8?B?Q1EvYkZnMWRFRVA5V0tYNG5MQVJsZEFsRkk3NXIyVFdQK0tzaWE0ZmFGeVI1?=
 =?utf-8?B?TnZ2bTZDcDBiU0dmd3RQOC9BVHozZUswalRqeXBTMURabkwvTTR2OXNtRmY3?=
 =?utf-8?B?eDRjMkZzN2daWEFFV3dvaGRCeGcxTnZheW16cGo3TkllaGtXUWhNOWNaSTht?=
 =?utf-8?B?RXNYc1VRMWFkcFB1MytmYTM0OHoxQkkrZ09tbWR0bXN1RGxLQ0tZSFF1Wkl5?=
 =?utf-8?B?b2NZdG5MaFRkbWxKUDFHa1JNVmJkN0kwSnArSlVrczFqcDBBWDh1K1Qza0tG?=
 =?utf-8?B?SGY1MnRqZTJCT0Y0YXdJL2Radkp1VzVSSndrNExENmZBR2RoZmQ2UDNyWXRK?=
 =?utf-8?B?TlQ4S3BocXlGUG9mdnBxeXZZSHVYdEQ4NCsyZGlQbzFDS0Q5a2U2ZnhYa1ow?=
 =?utf-8?B?bGx1K2wxd0gyc1o1dlZTVzFLSDBMY1VBa25TVkFwT3pLUkdMYzhzdmR0UkJn?=
 =?utf-8?B?TzJTVXN5T1BpNHJrV1k2Z0t4WVNPMkJyZk5TL2t0SitJeHMxb3VKZTBFU1px?=
 =?utf-8?B?bXBubVh1ZGtMYU4rRi9icFIxeUhIV1RSMWdmUFREa1ZRRVlRTFJUL2ltSWQ2?=
 =?utf-8?B?RENSemhaTjdubVNURW4yZkN4aWUvUk1kdzFkK204QXRLMngrRVU2T2tWTmRu?=
 =?utf-8?B?N00xUVF6T1JQNitKRVlQb2ZheTdjL2JVd3dMNWZSS3ZUM3JYSDBQUzFaVzdq?=
 =?utf-8?B?MkRVbXJSY3QycXdVeE5pUWkvbFpPVEN3bC9zVk5zY0hIL05INHI5TUYwRmpX?=
 =?utf-8?B?TGRta2QvaUptT2t2TnZ5Nnp2TmlEM1FHMGtLcXg0Z2FLa1A2VU41NlZwWi8x?=
 =?utf-8?B?YlY2enFpbFFld1ZqK0E1elBXalY0RDFqNFZtYmN5SWgrMlh2RkR6b1N5VGw4?=
 =?utf-8?B?STZ4dm1MTnJzQ3ViYTRwVWo4WWF0dzFKMDI5UU9IUCtyTno0a24va0FjZ3VR?=
 =?utf-8?B?Q09CMUFZUklWWDM4U0ZadGc3WVZQWnc1V3VNR3JDN3BCZWd6ZFdPdW80dXp2?=
 =?utf-8?B?OGYvMkhoRjFOTG92bUJzQ2pLM2hHLzBFN3ZpQVg5WTVRMWFiWlk3SEZmUC9R?=
 =?utf-8?B?dGdmbFF5QXFPSk9ROXA2bmh4RFBNZU82RTcwUEs5eXVTZHVoMHJOSFhKVkpM?=
 =?utf-8?B?SHh1ZWRwOFkvYnJjT0E1a1R6d01zcm5ocDVzWFhZWktHSUtIN3JRcHZmRzJ4?=
 =?utf-8?B?WWs0Vmw3MWNxVHR0NnlIdzhjMXB6Ykg2K3RZZktNb0crRFpTM2lPeFM0YytD?=
 =?utf-8?B?UjlaekNndWtaS3RwRVVtU1luNUQ3amZ2S2ZQa3RjL2cxbmRvMlplWmpCK1Fh?=
 =?utf-8?B?VTZrdEZKV0JGMDFtc2hpRkw4Ny9LL2RvS0h3Z0RIKzVOWHZXbVk1T0dnM1NH?=
 =?utf-8?B?ZmN4cUtqYnBneFNKYVJCRTV0NDFwY3pxU2RoSFJiZWRjT2twSEM0UDgvUG9J?=
 =?utf-8?Q?wVHznN+ekUs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1hMT29OcENZcXRZR1dsZEtIOGt6emdXbEFRKytqMDF0elpkV1VkTzZ6Wlph?=
 =?utf-8?B?MzJLMjlwdFZpMDl0S251WUltMk9wQ2ZEM3lHdGd3VUdqYldvRzZBUlBVUUp4?=
 =?utf-8?B?UnhRNzBJMGU1UzFlZ1laKzduOFU1VzFVbTVPWHhYelNnU3ZnMUdXZ1lLUnZE?=
 =?utf-8?B?ZEdxaWFXaGY1TzRCc1J3NGx0ZXlaWmd5bmcwSVp3cVNpQkpDUlN3cmlvUWhS?=
 =?utf-8?B?MG9zZHBIcWdTcitiaTRRTVJHS1VoZ1BYOG9YTE9Pb1JIcGdZYjZlZEpnL1hT?=
 =?utf-8?B?YlZ3RCtsZFpBeU9SWG91Rlg0elhSTTdBaGk1QkZDcjZxWUZhNE1xSk8wVEVV?=
 =?utf-8?B?ZEg5SFA1eVU1a1o4NGtGUmVjQ2pJc2I5UzIvQS9BOTkrUDBHQy9hTmZ6Z3VL?=
 =?utf-8?B?Wm9XdVBtWlViTDMxNjQ0MlBhY1h4YlkyTnorRURzNzBKN3AxS0xlZ05FK1dj?=
 =?utf-8?B?SzRhWnJkMVhyWFI1OHlQRm80OTZzZCt6VnkvY3l5Sm9NRnNXNEFwZEZROVV3?=
 =?utf-8?B?Q0U3c080UXpJUmUyeEdHVGtub1RROVBrR085bTdUWXovZ3BVaEUwNUFURW5n?=
 =?utf-8?B?TEV5cURQU25sa0ZQbkR0elhXUGFJdFNFay92emQ0eCtOVUlxNGV4WDA3Uy9D?=
 =?utf-8?B?YVQxRFI0T1ZmbWgraVlMZEJjNTVhVzFUK04zaW5mM3EyMGhMcEFpcUxPOHVN?=
 =?utf-8?B?Z2lIWU9TdnRDOXFoc3U3RUJNQUJ4VnRnQlV2U3dqWkxCNTl4L3NqdUQwTlNZ?=
 =?utf-8?B?S3g1OG5obUpSMWNPTzN3QVV4ZXVnTzdUWjNYNGZLTFVKcXpHblhhZ3d4WTVF?=
 =?utf-8?B?VmdLdmkxTit0KzRwaWNsU3pLbFBHQ0dOdDRhMW1BeldlZWxBd3ViaVJFWS9L?=
 =?utf-8?B?OVU1UGpucFFkL3d5NEx3YkdUZU1GK1M2MlNhd0lDRVlpVG1rVDM0K2dIVGtF?=
 =?utf-8?B?TVNJZnNXV3prcUk0MmM4cmxxeGhpNXRwWWRURUVIZCt5eUtZNnNvUzIvNUx2?=
 =?utf-8?B?NndjanBxbTNuaGJxNDJ2TDlkc2F2V01vSmFVQWdFaFB6cktuTVdrWWc5M1JX?=
 =?utf-8?B?RFdZQU4zbDd5eTJzM3pCQjUzOHIvck92WnlHeDBFUk40Z0Q4NS9HYlE5aWxE?=
 =?utf-8?B?aVkxV0VRajRmSFQ5cjNPZU5WSUZmbm53V3ZEVjBnbHp6aGZ1VUdKOUZaSkRO?=
 =?utf-8?B?cm5nckUxd1Jma1h4YURVNk96NjJIaDUybjNlRFVTbU10djdMdm1XMmJ1UTVw?=
 =?utf-8?B?bFZlWVQzQ1BrWml6YXlGUEd3aWNhcG5IYi9zTlpuZmRpY0hVaDE5eUFRL1o1?=
 =?utf-8?B?Y05KYUNHMUlNLzBUMDVabjhxb1ZFMWlFQmI0UVk4a2RDbmhuYWplUHJSYzEy?=
 =?utf-8?B?ZGEzUEtJa2FScTlKdEJ5Vk9HV0s0bElJdWZweEJzUk51T1phb050anltdFJ5?=
 =?utf-8?B?Uml3UFZpUEJxU0EwVCtrOHQrV01Pemk4YldlVENhUUZmb0pkd0JSOSs1Q250?=
 =?utf-8?B?MTQzbmFoZ0xvc2V6NGtLOWRVdGVITXluRGsrcDM4TlBLUWlLOEpsVjVTcGhq?=
 =?utf-8?B?bzBIME1oU1RJZzIyQnM0dVQ1WHhCSjEwZ2J1cXJRY2Npd3B4U0JpRlJhdFlB?=
 =?utf-8?B?LzUrRzkxUnoyMWdPaGNFcTJuRTRyNUJ2REdhZzFJK2JTaVp4QXErQ2dsYlI5?=
 =?utf-8?B?amVSWjhzV3FDUHRQaEozZGUwV0hwazVWZUFLWnpFMGkrUHJ3N1JiRUtsM3Vq?=
 =?utf-8?B?d1A1V3FRQ0tjVkJQdlp0b3l4U3VxLzdWc2FyblpIMXk3My9hRThGWWxaTCtx?=
 =?utf-8?B?SGJ3YkhiRDA3cW5QOVh4b2d3TTFTTyt6WE5FTmFMdVdCMStyNHd0aDM5UHh6?=
 =?utf-8?B?eXJTdVBRdWNjSWxqVHl3UjFhS2s4TXRsK3lIUzhmeHIxci8razBOVG9hSWsy?=
 =?utf-8?B?Z3ZTalk1aDBKY2VyUFI0UnVtaUd4bFZJRHlnMzRHSnBwS0VuMXdxMUxsLzQ4?=
 =?utf-8?B?a0t1U044ckdZNGlvNCtLai95dGRsalFiRko5L05NNUtuSktwMk1Lcng1MnZY?=
 =?utf-8?B?b3RUaENBUjZYU0JWNW1wWm1CcUJ0TU5OR1FoZEYrNTVaU2xVRTNHaThJcTFm?=
 =?utf-8?B?WjRIVWUrM004RkxCcXhoWlV6OHRWazVRNVZtTmNFRTRQSUhhaFpkNDlrWDVj?=
 =?utf-8?Q?+FBAuzo0hOLIHCNs+wL6Qys=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44dacacb-ffae-4b19-ef41-08dd7ba4bff2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 22:36:08.3634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEd+EmfmL6dl3eX6LOozbyLJ/pV0KiVbXjwDWU7jZdLWWUe3wjW0ccfjiKoN8WV28JXky7FG8J2AWf9esigcazbTlaSaJfNXNfbP4sb0+tY=
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

On Tue, Apr 08, 2025 at 11:12:08AM -0700, Ashutosh Dixit wrote:
>Empirical testing revealed that when reports of different types/reasons are
>intermixed, this throws off gpu_ticks and test_event1_cycles_xecore* in PEC
>data, causing test failures. To avoid this, restrict testing to only
>timer/periodic reports.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 13 +++++++++++++
> 1 file changed, 13 insertions(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index eaf97ae0df..cc9702322d 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -1031,6 +1031,19 @@ static void pec_sanity_check_two(const u32 *report0, const u32 *report1,
> 	u64 *pec0 = (u64 *)(report0 + 8);
> 	u64 *pec1 = (u64 *)(report1 + 8);
>
>+	/*
>+	 * Empirical testing revealed that when reports of different types/reasons are
>+	 * intermixed, this throws off gpu_ticks and test_event1_cycles_xecore* in PEC
>+	 * data, causing test failures. To avoid this, restrict testing to only
>+	 * timer/periodic reports.
>+	 */
>+	if (strcmp(read_report_reason(report0), "timer") ||
>+	    strcmp(read_report_reason(report1), "timer")) {
>+		igt_debug("Only checking timer reports: %s->%s\n",
>+		  read_report_reason(report0), read_report_reason(report1));
>+		return;
>+	}
>+
> 	igt_debug("tick delta = %#lx\n", tick_delta);
>
> 	/* Difference in test_event1_cycles_xecore* values should be close to tick_delta */
>-- 
>2.48.1
>
