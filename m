Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2606AC2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 08:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA67610E230;
	Mon, 19 May 2025 08:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZQZKSax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A4E10E230
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 08:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747644937; x=1779180937;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Va/pYqnuidL4Np4GQLvcf6oRTINoEEiiklU32peaHMs=;
 b=hZQZKSax2ldSoRg5HC1TYyrrIIdmorzS5kvxzloGOY/+tVlS495EKEow
 fL+V9GMQos1QEv+jzcJ8+nbmDmkIx0InQJbg6i/Odk9VhmVT6i+AT2K6T
 ukIU12alaGDcSL8qCTp5CvJxsuL5hhtBSVKrQNO/QBFo/QtLV1B7/lX5x
 V8KLyPmPs3mUkA9x5YP2RdCZ4b7fvCezaqJ0f+nIKGXeU7goWQGVjdxNM
 zAJwO2DQMiHZdD3xQAaFuoOcxmruSGT2mHjTRCz169+DMTlLejETYBves
 8M8w2yHAe1yPNrsZG6WMXTphA9Jb3QYIYglNjNBMG5r0R1zwQF6Rg7EOQ A==;
X-CSE-ConnectionGUID: ROEQN+q8Q3C2FHIYn72sPg==
X-CSE-MsgGUID: WLnTnxGiRKeiFkmB0Z0nyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="48787579"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="48787579"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 01:55:36 -0700
X-CSE-ConnectionGUID: NBh1O7b6TuyLZdvltO+7xA==
X-CSE-MsgGUID: NmOanVyKR6mU0hF24JsTnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="170216131"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 01:55:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 01:55:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 01:55:35 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 01:55:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEyRYtVVEDUVUfk4f3CSN1wNDs3zhztWzPsOEzYBzrs/X8cHvwI+bsMlbI2e5i4Hw4htY1MjTZcRZpJZv3diwEtr/Mmvq0VwQyXZ/2kThbxhSh+2A1VB6SRqOTQyM8jDgF4Hl55corMpraDZWT79J+ns8P0mLIdhXAKCyEz7dw7DCfYAUbYwAPfzZxCKaES2BzRXOBb44qswCQpZN0lLeesGmjC7ndicsRGLUEkmto1eaDZ50pbp/6ZhtQdQT2XsKDFg/tllPAUEGiv8Q0g5PJjtCQa3JPUXpQRwxi8Cd3133omjisLMH/Xhu5zFPzXmiIHmrKWJYV8f+fzhqQPaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZTKZJyaIdswoEN3c+awh/sj5MC465tZv0cSWDLp35M=;
 b=r9+OPhUpjYWfYS6htCb/KvB/Li8Af48Qr/Aszaj3Emwr1XYqXDZSKYacf+jp7PW2nkriqHPA0bCUz7b8Pxu9RqQZZSyRq54EzftfbvdhlK1wPXhDY8M4rKgNy3juQjjz8Pk7d47axJFthBuEYoSQRJbLZGOgOaxYVcIh/+6zaPlPZxK8pfF4iw97gy0BnV0i44X9K5tsmXCSNd8ttSbRoOOJL7hSm/R3MFg9S15u/+XZhnMEsb2oA6YkYheQvr5E1fsFV6ji2nvo8LpVQi/GZk9ikmAMErl1OxRH9ruSBG960QqjzmRyiDGlVsi5XHN2Nq5MR3r5jnHUm20vfAE8rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Mon, 19 May
 2025 08:54:51 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 08:54:51 +0000
Date: Mon, 19 May 2025 10:54:47 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 07/15] lib/intel_cmds_info: add blt_memop_mode
 (byte/page)
Message-ID: <aCrx15NxTyC9WVJN@fdugast-desk>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <20250513185811.897232-8-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513185811.897232-8-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0004.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c2d96a-40ce-43b7-2971-08dd96b2d10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0x5SjZNNmhsTVZZRzBLa1F0aFlCRncxUWdWS2IwcmxqcWdMYTRsUW0vRVRl?=
 =?utf-8?B?WnpXbFphZFRZTnhKUlZFVlpxWEJTa0ZsKytwNHlwaDEyK3RqTnRYUXhEOXRj?=
 =?utf-8?B?T21tZDhZbTlZclpwY1BFQ0NxN24vb0c2OXJHbHBKdnZ0QTJTVDZRWlRqS2tI?=
 =?utf-8?B?T0lrYTZPZmxlUmpUeEtMaEsxdlRrOVoxQVhaZ0JyREx6ZnZEZVYwZmx2M1R0?=
 =?utf-8?B?WUZObm9pTFdhQUZEbFVTckZhQ3hCS2FHWkVPYzJyQ0hPdy81VVR2TEZxemNa?=
 =?utf-8?B?enYzQ1Z4VEUwMGRvTWZUeEVtSnFndEUySVROMGJaZlkwdWFtTXVPWDZQSkQ0?=
 =?utf-8?B?bGFUYUhuSmp6azVxK3FVdnZCSnBNWlhQOHNRWVpyQW5qRUI5MVJ1R1ZjZ3Rp?=
 =?utf-8?B?bEJhZUNoNkpLTHV0ZHlHVnB1Qy9aRmNyNk5CZzZXMUdlZUlnaDBqYXlUbU9z?=
 =?utf-8?B?a2ZIdTdvYWZjVmxxRXlOUkJPcGpENGIvWTZsREtwSkFLaVlFRHJDemNKUlVS?=
 =?utf-8?B?SjFhaUtDY3VTRUdOeXg5eFlMOVdvTzRnWDN4ZXBWQVpNaTZIM0ZlelZ1VitT?=
 =?utf-8?B?SEJrcTBwc0duUHJ3a0xabzJVQnR3OGMyejIvaEhSaWpFK1ZPek9FMUQ5bExX?=
 =?utf-8?B?NnBRL0tIaVZaSG5wL09FVTFWOStUdVYyOS8vZStpZklFRmFGbDBWc3B1MzBt?=
 =?utf-8?B?Ym10UFlqNko0L0JONlp2aWtBOUFGaDVubXZHK1k4Y3NCS2F6bnBuVFcwZ1VP?=
 =?utf-8?B?MnE3ckZBeU95M2dBSkRyb2xiVEU3eW9YWUs1R3FWSzQ2K29iTUVSdmtKNHZ4?=
 =?utf-8?B?YXplVktLVjcwRXlHU3M0TDh5U0k3TTk4OG5KQTFOQ1pWeDIyM3dvVFFoT3k0?=
 =?utf-8?B?ekNiMWNPU2lncGYxMEQvejJMeUROY1JHQlA3ZDBneGJyeTAvblMybmY5Vi9O?=
 =?utf-8?B?MG9KMmJReVVENUhXaUVZL3NDVEJXYTd5NnVacjEzcDlmb3pMNFNhZGdhVjFq?=
 =?utf-8?B?YjBlaU1EblRmT28xSW13eWRhQXpScExQMnRQNGltWDVVRHg2dVkvZkFjcjBq?=
 =?utf-8?B?R0xzL2tQdWNjQzBvNnVLQjFjZDlRb3VvZXRxZno5QkJ0SEZVb2FoL2N2cFJw?=
 =?utf-8?B?SVpaVEMrVjJmaCtra25pL1llUWdkVUhVUmJaWmY3TDdsL2FuMnoxd3l1M05C?=
 =?utf-8?B?WjJ1QTNXTDNZNWQ3enA5T3lsN1gxVThxWEowSkZ3d1prcFRvZzhGUHdmYXhD?=
 =?utf-8?B?am9sMGsxM2lZQmx6S0h5TURhYmlhTWNuOFpEREswODRCOWRQMWZRWVNadlJ1?=
 =?utf-8?B?ZzlycnVOUXpMR1Q0ODlGcC9PQUliK1krcE55cGsxWnZLYU1WVkpkVGtjYlkr?=
 =?utf-8?B?WWtaNisxN2Z6SExDanZnQm9Qd0ZXeFJBR2RVa3BGYnFOY0dQSzVnRmNhYUtB?=
 =?utf-8?B?WVZLSWg1Tmw4cGZJY0tnRDc0U21uZDYzcHJPNzNvSGZaODM0ZGhKaUYwQzNy?=
 =?utf-8?B?RCt0MnM2Zi96RkUvcmQ5b0piNlBteWU3dkg1TlNtRnF1SFIwV3RneUN0aXFx?=
 =?utf-8?B?YzdLVk1wbjlCSGErMVpoeVFZV1I5UUZNQkdWQkVwY3pIT0FpN2F3ZzVnNi8v?=
 =?utf-8?B?bHdmTi9tTGRKdkJCMEt0UjBKWm9KeWlRbTdVYlhLVThkRXpOMmI4WjFoMW1o?=
 =?utf-8?B?aVRKZ2dJNm1hd0tWeWZyQ3Z2SjJLSUFwOWdUMGVoUDk1TjEreGF3OWYxd1VE?=
 =?utf-8?B?S2ZaN3NIZWZBTHJFa3lTOXNZazA3dFF2c2ZhYWFKTFliMGYrY1hLOFhaY0FJ?=
 =?utf-8?B?emxYVHZmbmhwYnB0VmZUdWR0ZnJrYzViaU9ZTU1Ob3NSSnpCZHlvZllUQm14?=
 =?utf-8?B?eXRuMWZjR3Z4N0E4QlY0RUxKWFZsazQ0UkpjUGlUL2V3WGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjBiRklNYlUvd1hTamtHWjgxdjN4YW5hWUE4UlJtNlFveTBxQVQ5ZG92ZFN0?=
 =?utf-8?B?aWRYL3ltVzV2VlhvTTN0ZExZZmk4czRiZDBOcHZRYWRsUFhWcHk4Mk9wK05s?=
 =?utf-8?B?UG9HRlViZXkrdjRQbVJ0cWZ3RHhDcExmRnVCYVdlNWZPNkltcGpZTUJCZzZn?=
 =?utf-8?B?Vmd5SmJmT29kQnBlbW1yQUFlNEZPSEpUdThoZ0Q2Y3M5Mk1uSEIzSm1SR1VY?=
 =?utf-8?B?RjJUanRZOE8wMDVrU3A3N1lJZ2tvaWZCQlRsZWhDTWNoYmJTWW81eHNTT0Fv?=
 =?utf-8?B?WWdUc09JUVdROVNWOS9MOHRkVm42bE5xTHRiR2thR3VhZVlObVk3WjZ0QnlL?=
 =?utf-8?B?Qk5UVE1venpZQmVOSzA2MUludmI5ZGhjRzd5bE1RcXNINzJFQzExWDJUODQr?=
 =?utf-8?B?TXNseXJ5bUNYL013dnE4RWJlbmZ6MUMwN2xJVXVzdXlINFRkbXc3R1lkaWhT?=
 =?utf-8?B?QWRWWXlMSzNsenRFbGlCQTUzN09JUGJIdTJ4dXZraXc5L2pFTDQ3ZzNRQmd6?=
 =?utf-8?B?WHZ6R0NGdXhhS2t2TFk1VEFUY3grMlRYQTlVMGYxZ3kwc2NJbkkxQStRM05h?=
 =?utf-8?B?aGxUcTV0V08vM0hFbjd4RzdGelhLY0pMM29TTEFHb21jNnlkNVl3YXJLVExs?=
 =?utf-8?B?Vk5uWkNFMDdvOS9lK0VHdklRTnd2U3VRaE1jbWt4QVp2RUJJR0FtVzFMK3dZ?=
 =?utf-8?B?c3J4RDQ4d1RjbkFTR2M5VjFxNXA0L2haekxQY3VHSy9UK08rRWZINGdpNGlS?=
 =?utf-8?B?ZFFDZExHbk5YU29JNnkvZzBmbEYwZlRIbUVCdlErWUI4elQ0eVBLaXdSOVc3?=
 =?utf-8?B?emJKWHZOSENwLzBFR24wUlVJc0R2WnNPUVcvVjRVK3J4clppNkNXQ21hMkZV?=
 =?utf-8?B?RmgrYk9uWVJrV05EUno2ME1lUVVUV0lKcHZLWml3QllGNGJaek9WS0VneFJT?=
 =?utf-8?B?Z0g0dy9HTWlyQ1hIdnlBSFhOSEdRcEtONmJSWHIvMmRlUWNZRHBZKzJNeXVu?=
 =?utf-8?B?cTV1UWVJL3lpTWF3QjhvWUEreWIzMTAxWmtUUVhYR21xOHdvLzdGRitnVmFM?=
 =?utf-8?B?ay9RTE40K3N3NGFsMjhMamhsVWVqNG5RTlVmTUFITXFDaC9SOFd5WHRTSkgr?=
 =?utf-8?B?a0k5NWRDMGpVblB6aVRXYUl6VTZlS3cxZjV5cVRKRU9QRExOWTJyZTB4NWwr?=
 =?utf-8?B?MkNvT25uMU1FRSsxVTl2ZHZZeWsvQ0Q0VHovMmdZUC91di9FRitVayttWjM0?=
 =?utf-8?B?dHFscXV2YjVodE1vNTEvOWhBSUdTMkg0Qlc3cVVQbVdOVjdhT2FYNlhTVnZj?=
 =?utf-8?B?ek9lemFFOTdqRFVqbmdVTlArL3pYanVJSDdVUXFSYk1BTUZQYmVWUXVVQnhF?=
 =?utf-8?B?N0hKTGg4V2tqQXVlNlkyVVZHcDBuaDFTaW1zdS9hRWpJbU5FZjF6VFBGb0NJ?=
 =?utf-8?B?Qk95TXRnWi9BcUI2WnpvdnlGcE1yMHRzQlN3NE9WcnpmWDZIRWFmbkE5OFcz?=
 =?utf-8?B?ZjN5b2dQSFVKa1U4Sy9OOGsxQTE1bkpzZlFmMUVjam8rZ2czd3g2RldFTUtK?=
 =?utf-8?B?ODE2NENqUUtkT0ZjK1BQS0RTM3RwK3UrUUlvQ1lzYkhnSzZuOElvZWlCNHU3?=
 =?utf-8?B?ME9vREhkS0VqRUVwTnZMZkVVcVArNGpOaWVvVDV6VGwwUFkzQlRMYVMzVU1p?=
 =?utf-8?B?RE5waFRnOUdwOGJBT0RpalBTV1JaNGNaNFFRN3EzVGE4b1Z1ZURhVXFmOHhD?=
 =?utf-8?B?ZjZKQnRHVDcxRmlmbTlCblBrd1VsUEF3emVqeFBuY0xRTEl0LzYrc1IvMzRj?=
 =?utf-8?B?Y0g1clZIRFB4em5MREVUMHVsY0dGdHNJemRFUkt1eXZCam05dFlTR040QW1S?=
 =?utf-8?B?REZEc3B1NUpOcjYyTlRTSjZkVmRhMGVqMnVCQUswMTJKMHorRHI0MVBnb2JL?=
 =?utf-8?B?Z3JBbDdvNiswc3ArcTRnUC9mR2hiV00xTHFkR212T1VOcW1ZRWtVMkQ5dlV1?=
 =?utf-8?B?bHduWVgvWXFuUHAxc0lQcVMvdnJYOGVtdG5aNURncE9takRkcHJwU1V3NEln?=
 =?utf-8?B?ZUV2K3VucTVBSVd5ck9mekZITW9UengzL2N6YkI0dDlKb2pqWDFhVktJbktV?=
 =?utf-8?B?eGxsMzVoOWMzUDFlYmgwRFJqT1Q4aEpreWlXZTIwQVVXb241YklqajBZcFNw?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c2d96a-40ce-43b7-2971-08dd96b2d10f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 08:54:51.3354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZebwRyl3Tfw1jFafDP4VqUYjKSGZZnOfSU3nTFx0qK/Jl0Lvn6MXqFED2+QWZHnmbEfyqVzmHfdrS0bAITiVWCyHu+SQTHGlrQeKJLnPPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5862
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

On Tue, May 13, 2025 at 08:58:02PM +0200, Zbigniew Kempczyński wrote:
> Add 'mode' field for further extending in tests.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_blt.c             | 3 +++
>  lib/intel_blt.h             | 2 ++
>  lib/intel_cmds_info.h       | 5 +++++
>  tests/intel/xe_copy_basic.c | 2 +-
>  4 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 4c90d157c9..6bfaf09a2b 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1802,18 +1802,21 @@ int blt_fast_copy(int fd,
>   * blt_mem_copy_init:
>   * @fd: drm fd
>   * @mem: structure for initialization
> + * @mode: copy mode - byte or page (256B)
>   * @copy_type: linear or matrix
>   *
>   * Function is zeroing @mem and sets fd and driver fields (INTEL_DRIVER_I915 or
>   * INTEL_DRIVER_XE).
>   */
>  void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
> +		       enum blt_memop_mode mode,
>  		       enum blt_memop_type copy_type)
>  {
>  	memset(mem, 0, sizeof(*mem));
>  
>  	mem->fd = fd;
>  	mem->driver = get_intel_driver(fd);
> +	mem->mode = mode;
>  	mem->copy_type = copy_type;
>  }
>  
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 9efa799881..f2509ab175 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -130,6 +130,7 @@ struct blt_copy_data {
>  struct blt_mem_copy_data {
>  	int fd;
>  	enum intel_driver driver;
> +	enum blt_memop_mode mode;
>  	enum blt_memop_type copy_type;
>  	struct blt_mem_object src;
>  	struct blt_mem_object dst;
> @@ -274,6 +275,7 @@ int blt_fast_copy(int fd,
>  		  const struct blt_copy_data *blt);
>  
>  void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
> +		       enum blt_memop_mode mode,
>  		       enum blt_memop_type copy_type);
>  
>  void blt_mem_set_init(int fd, struct blt_mem_set_data *mem,
> diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
> index 66f63d7e72..bcaad6053a 100644
> --- a/lib/intel_cmds_info.h
> +++ b/lib/intel_cmds_info.h
> @@ -24,6 +24,11 @@ enum blt_memop_type {
>  	TYPE_MATRIX,
>  };
>  
> +enum blt_memop_mode {
> +	MODE_BYTE,
> +	MODE_PAGE,
> +};
> +

The name gives some hint but it would be helpful to document what it is
intended for, especially given that it is not used until patch 9/15 in
the series.

>  enum blt_cmd_type {
>  	SRC_COPY,
>  	MEM_SET,
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index 5681d4d6ab..f252d29fd4 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -56,7 +56,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  
>  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>  
> -	blt_mem_copy_init(fd, &mem, TYPE_LINEAR);
> +	blt_mem_copy_init(fd, &mem, MODE_BYTE, TYPE_LINEAR);
>  	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
>  			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
>  	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
> -- 
> 2.43.0
> 
