Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F63BC19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 16:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B28D10E7E5;
	Wed,  5 Mar 2025 16:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IcQ+2QW4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CC310E7E5
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741191458; x=1772727458;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=et/9rhIRdTP4f1iPu+Sx+yRQEfsic/E4+vqnO+0hrlo=;
 b=IcQ+2QW49CI0yLO2d/2Qy2CY3G+nRp5M06ABGj88fNOQg3TZmXlVV8f+
 1Iw5dxhZ/JhclXvUuEWtUoVqw6IIElzHJ1LRlHMFiXsVSUS/XSuqVtouS
 EGzqRB22tFxqRfrAEEqm1P9jvSWsflclIdIgH7AhhkeJSVQSowyKIxQrP
 HAnNnK85/kmaNowOYjFbuWSTkp/V8zo9p73OXanU86wPatLypDMdnSCuS
 rVug/VbN9HmPByHA6LSxAx93TegyLI9OS0Pb7Hi0w/jQzbkY6nTuHKWc2
 gTmQPDwLsOdTKaJ1jQFa7HRoZ7844RMuWQ/pVbKTTfEukm4F83xpaI4Dp A==;
X-CSE-ConnectionGUID: Ki/zI3aZQrS2fUXDcj5KrA==
X-CSE-MsgGUID: 5CpwGv8WSt2AChbRtzsWOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42025535"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="42025535"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 08:17:25 -0800
X-CSE-ConnectionGUID: /PYQObx/THS8zIZWM75s1w==
X-CSE-MsgGUID: p+hAWsdtQDqNX/L5aFJyfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="123831986"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 08:17:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 08:17:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 08:17:23 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 08:17:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hA9MGldwUVXbfOWWrNTDTbuFsnmfC4OlCCWTxJW+BCfD3lJUgD5NodMQiD98YclN8VuCiPMyFNTQdFLze/6fGXsx/EEnrOrx7ajJ+gU+A/gLCoaiJuAr+qS2RI6dpvlDFk0peehlUgRmv01DAJyWrdplBr2KK8bK2R/sOpa5n6RhOYPSGyGJK8juzA/uuIE4yGWH+Zy6Mqnie2Jnz13v/hqUQtySxwevJgXND1PTQFvve9yOmS22iWYpsAszyv678Et47FJyG+HLYJ0ba0Ln1bbfVAHET1X0VIobTvmrVcoIiP1i1uzTs8oODSZF2pB5CfdFpfrqEtdt+UwkiuBoQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdoDeY6dJH04EvZDF9eCJhWgdaeI7Ze1DULj4xleqKo=;
 b=A++uDWwwoS53hWlCNjoOo+L6ianWTEHQOBQtf4QYBjfX9obj1HT7n0N7qTKhakUOrUquOTUJEGB/jgawL/BCa2Avg7YkH3gD69AUkGjdLIJl9SOppL7kf78kW38asgNnopCjup1sTmzaXMI6I/JMLxPZ3BYyLA4AxNWjJ9jXb1Rzmzq+Ipb7QV/1JiVfNlNylznDxURNuiU/tpujZ0LRGUi9lhRMnCNQJ/Hxk1EyxOrh4sAmGJqpIg6ya6muJgJ6Gu1C4yulpXctP+WG52C28sXeV6N+as6k/U12cv3brlR8WiKw6brsEvqWGxor7UAIuKBR+6MLuGPkfUBSm9GXZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB8224.namprd11.prod.outlook.com (2603:10b6:208:44f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 16:16:48 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 16:16:48 +0000
Date: Wed, 5 Mar 2025 08:16:46 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Modify some OA tests for simulation
Message-ID: <Z8h47u4kI3FG4Xvj@orsosgc001>
References: <20250305005716.168646-1-umesh.nerlige.ramappa@intel.com>
 <174114873488.912816.16046234382403950356@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174114873488.912816.16046234382403950356@b555e5b46a47>
X-ClientProxiedBy: MW2PR2101CA0030.namprd21.prod.outlook.com
 (2603:10b6:302:1::43) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: b90ae8d7-5294-47b6-2d3a-08dd5c01211c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTZMUTFHNi8wWkxBS1RLRmZzQXJQVXF3RzQ5VEdJQ3pHUG52TnVRNkttSHJj?=
 =?utf-8?B?RXVPd2hWdVVXdWtFdjc4c1V1U2NnYlE1bjZ2U1ZGVEcvaDQ5MXJUS0Z4UDlJ?=
 =?utf-8?B?MlRrand1NHFVcWw3SzVYWWRXN1M2ZDBYMjROa0NoanpyVVlGcHNpWk1lem5I?=
 =?utf-8?B?YUR4V25SQUI2dmVhekYrbkpqaGxUeWN5dEl3cUlNWHhDSXVkWkJjNlZPTVo3?=
 =?utf-8?B?YVhXckY0U1R0YVFLM2JsUW9uNFUzc1NxMVd3ZndaWW4zb2NRTDh3SlNCOUpp?=
 =?utf-8?B?SEw3ck1URENiVWtnU2hPekE1ZG92OHNiVXAwRTBKTmtNTzJ3eC80N2VzeXFl?=
 =?utf-8?B?QzdpR052eTc4RzNKYy9KcHB2dU9MSkZZZ0xVR3VUb2NwUVZSc3BPb2p3SGVy?=
 =?utf-8?B?YndDcWVBUCs2K2FUTS9lbEhkMDdIalRyQ29CVXY2blIyUlBxSEhkdmdCWVBx?=
 =?utf-8?B?N2RkMDRzRVJlUGJwYWl1TlVtZmZFeHhZOFJxMzJJUzdWSFNXa0pMdUUvUnFN?=
 =?utf-8?B?S1g5ZlQ2bUF2QzYzbmpaZE5vZit4TDdmZW9vcWZ0ZjlNcVBSY2NybXJBS0FW?=
 =?utf-8?B?VGdpMHpkN3hpejVRaU92Rm51MXZkWUYyanVvSzBhcjFwd2RUbHVuMXBhLzRz?=
 =?utf-8?B?VVZ3cUxIMWp0MWJESU0rZXBSSncwYzhHZ3BsaUI1SXBzOWZ6dTMzYmZZY3Rz?=
 =?utf-8?B?NFVmVFkzTXp3c1I1Y0FRMVpsMzBQaDBudWZCRHNva2ZjSSsyMXJrN3BmaGJV?=
 =?utf-8?B?ejhCV1dkOEYxblB6ai8yM1BoZHhaNVgzZmhzRlo5cS82enhrTXdZdGJKVW12?=
 =?utf-8?B?cGZWeDNzb09qMTFVUGIvMUdkTDIrOXI3Sm1mMWliMTRwY0FDeXZjbC9oRHFj?=
 =?utf-8?B?ZTBuYVdxZk1aOGpGTDAya1J5eHFOLzIxb1R2Z1RpRXVwY1BuUUhQSTk4L3ZL?=
 =?utf-8?B?Rks4YlVDNEdBaENqa3RtYUdzMHdaa3ppdmE1Vkw5djJZQ1JGdnEyS3dFcG9i?=
 =?utf-8?B?c3lUVC9IZFJpeWVWQ3hCRUJ4TzltR09MWG1GMlY2TlpFOFpoRU8yWWZ3UzBM?=
 =?utf-8?B?QlZqVEtTZExkTG5nZXN5TjhMQ0M0MFN4di8vQTMzbmpTZlMwcU1sQ1lZRk1K?=
 =?utf-8?B?QVFRc09FamFhZldMNk9VSU1vQVVEeVBtTkZ4VnFtTlU3c0tWUGlERStSdThG?=
 =?utf-8?B?SkRicUhXZ01KRmVrbjBtSW91T0p2aXAyQmpGbHl3cDBzb281YlBJMUN3UEtm?=
 =?utf-8?B?bllJSWJpcEFDK3V5NDZQU1ZqR0dvQWQzL3VCSno5eDlkRDNBaThoMzEvTWwr?=
 =?utf-8?B?SzU1U1V2eC9HeGZqNlQrdzlwYnhsMHdpZjRaMTIwRE13VzRXdFhtNERaTlZp?=
 =?utf-8?B?UDJGR0srdmo0YzgyTE1VSzh1VncyYW9kU3FCY3QxbjBzOFRCQ2pXcGNHbGt3?=
 =?utf-8?B?N0w5aHpobXNUa3BFV3RYWVA4N2VPQ2RjU21JV2VhM2VyU0hmWEJDTCtRcFR1?=
 =?utf-8?B?eVJ2SGNJZ0E5UnVZQnhsQkFXOFBhblA0VUJmR1BSYVhhS1pNN3Rwb3NBcjJF?=
 =?utf-8?B?amJjWmNJSEVDallGRVI3Mm91T0g4N3RZY2pGSkg2U0ZOUUNLUXk2SEprcTRs?=
 =?utf-8?B?bjJwRFVxRGJreUJMSUtCL1BKQ2JjR29GZDFxczYwK09HVFJrOFozcU1JWklB?=
 =?utf-8?B?TFFicENVdVJIMnBjMmVKTnFuTk9rcmJ0RDVXb2h6eC9VdmtjbXNGT2lYWkNx?=
 =?utf-8?B?TVVzS2l3czlFc0g3TGhSVFd1bEJGMFV2SDlyQWpWMFdPSER3SmgyNldIMUNt?=
 =?utf-8?B?OHdXbElxOXdDS0s5OWNuUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDlZTkFMcXM0Z0pCOWp6MlAraXB6WVp4U1huRkk5TnVvV1B5bWt2dWpmK2N4?=
 =?utf-8?B?RXFCWU9VakpQa3V4TnBxYWQraUNpWk1JTXdSZkx4R3FKbXc3c2l2VVN1RnZ0?=
 =?utf-8?B?MFNMVTVwSFVEelJMbVQyWVlGMnlLWTBkcE85OG1TaU5aRWVSb0d1WndsQ24v?=
 =?utf-8?B?YjNSRjRPbmhsZVdqOXFIMFJzdkJ4TWpocUhPTFkrUHJ6STVMV2VHSy95MG5o?=
 =?utf-8?B?NEZxUW1GTkh4Y215TGtuN09sWmRkWis2eW1vbmFTKzFUQ1pEVSs5c05PRmdT?=
 =?utf-8?B?elRMZkFZVG5wK09qNkNMRkJ3aUMycTZKUTBrZlZ5TWhGTU1jVXB4Z0lPNlB2?=
 =?utf-8?B?ZEFaT3lYSzZyVCtCTHMzeDU1dUdCbWpIRTJwSDlhZG13RUNNeWRnWmZIZEln?=
 =?utf-8?B?VTZBQ1pYTFhDV0xnZXJnNFRyN25uazk0b1BjZGkvVmlQaEs1b1k2WnJsWEtj?=
 =?utf-8?B?SE43SUlhWm4wSGU5MGUrKzhLTzNTNk1JMndIUXUrME5IaUhzeUtIZkg3aUg4?=
 =?utf-8?B?M1hmV3A3MVZlaEFoSjVOQTZRK25WeVlVVnJnb3FWNVQ2T1paZUNqVTNtV25P?=
 =?utf-8?B?MTJURTZQalBCRGZpMXVXWm1reTF0YVNwZUtYeGpQdy9ITHJDNGpybXZPdUF2?=
 =?utf-8?B?aDRrMCtNMlBpU2ZRSU1Rc2RLWkhTT1dRQUhObEtLVXZna0E4WDJYbFBsaDNQ?=
 =?utf-8?B?RlB4ZjZyVWlpRUJ2V090b3Iza1pxNk5SSStjd2UyZFF3cFhmdDB6aWN5Tm5n?=
 =?utf-8?B?c1ZIc1RHK0hFM1VQb2xSeEIrVjVjUnBSRSs2cjBYdUFkNEJyc2p4cS9aWmdI?=
 =?utf-8?B?TEF0OWo4M1RCNFM2TTUwMnhHM0xqSENKUFpSc21ab1dHMmYvRUJNbjZScUZV?=
 =?utf-8?B?QllCcldaUDdpTWtYU0svMXhtSm1LcXpiZ0dhbWlQd25ldGVsUjNHN2dlL056?=
 =?utf-8?B?ZGl6Tzl1OFV3ZStFcnJodXFEMEpwbUpqSGw0UGM2OFhMcWUvNjFTdGVtWFVo?=
 =?utf-8?B?cWJhUjJZR3B5NURoUGxBRlpzVFdiZjdLMDVBOWZaV2plYU1SOG0rZGVSaGtx?=
 =?utf-8?B?V3ZuUTQ0dS9OMzRXVzMrTE5uQithOFh2TXdrcTdGSGk4dnlOYzRtV0NIajJk?=
 =?utf-8?B?cVZkNkN2ZzdZNXQzNkJDUk00SElyK2RROWhjNSswK1FORUxsNElGdi81MTlx?=
 =?utf-8?B?TXVRWGkvMHhjdTdJWE9MeGRLSVlCRWp3NkFKOER0RGI0dDMzSHVEWi9hYUdq?=
 =?utf-8?B?dFZqa0FsSExvcVdnN1g0c093dmZHbXgrVGxwcU8yNzV3Z1pHMGFHUjNITkZH?=
 =?utf-8?B?cWY0ZXR2K21WblZkVWxNaGRvR2xtdlpkMVIyMXF2ZFZmdkVVazlaOEQwcE9V?=
 =?utf-8?B?OURzQ3dTbVc1cUxKbWZwOXdkQWN1cE5WTk1KOVU3V3hic1llM1FjcVVoUmZM?=
 =?utf-8?B?dWc0NVdHblRESVFjYjRiUWtSTXNxTzc3czRHc0JBMEVSVGlNWVBSYmZ2SFIw?=
 =?utf-8?B?NkFITm9udUFVMllwT1dzUCs2dW4vYi9vMkNUUGNaTG42aXFaOTdiM2hMSlBa?=
 =?utf-8?B?WWN6OGtnNmlrbVNTN0lzTHJ2YXhzdFJFek5ja3MxQ1g2UCswRkdGT1FPTTRO?=
 =?utf-8?B?ZENxMXJsZHJuNjVwMGUyRmhvcEFvT0pDZHc5YVhyc2MrVFArUVlFWFppd1BK?=
 =?utf-8?B?dnBmWnpFcEFjejlTT0Y5ZkwvOU81S016ZzUzcHBzMGZnQlozcmtTdjVSWTB0?=
 =?utf-8?B?RHFEbWhPaE51LzNDdEUvVk53R0VsU2llTG9mYW9ISjRLK2xQTHE0YWYvYkU4?=
 =?utf-8?B?czZSVzhiaVJweExJVXdVOEdza20rcDM3SitqUVd3UFUxUjU0V0J3dVduaDRZ?=
 =?utf-8?B?ZExzZlBsV25kTW1JTHNsMEdXdHhlOWRkWGJyUG5xZXczUWhaREVOcDJPdzNz?=
 =?utf-8?B?ZlhCZ0dBdDBza25UUFBDU2ZCYWVBRFF0Y1V1dmsrSEpKcnltWW9UMTI4NWxa?=
 =?utf-8?B?ZnFZT1U0Unk4d0JCT3lScTdzSFN3b2ZvM2ZDbndmOC9rdmQxUTVxeXY1VnBK?=
 =?utf-8?B?TFMwTDc5QkJPbUNJWFJqQ0Z6WU9pR3QrQUZ4b1RTMXF2ZjdUSDRBM3VqR0k3?=
 =?utf-8?B?UWpqQU9GR1FYeU9KZlhOVm54eW9KYzR5SkI1Z09lSnlVZ0xsR3FXdjJNTVhq?=
 =?utf-8?Q?B6gwD0px6jfPd7iJTrERSRk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b90ae8d7-5294-47b6-2d3a-08dd5c01211c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 16:16:47.9699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dD6r2dF3xMvTsP8N8b2fPCvpaeIqe/XI6T31N/v9LU77XYuDwrUNcee/cFyd1Bmo4fAvL9bpQVZjVN4oS4VOqWHpiXLwyy6hLNwna1Z2F/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8224
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

On Wed, Mar 05, 2025 at 04:25:34AM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  Modify some OA tests for simulation
>   URL:     [1]https://patchwork.freedesktop.org/series/145805/
>   State:   failure
>   Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12701/index.html
>
>        CI Bug Log - changes from XEIGT_8260_full -> XEIGTPW_12701_full
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with XEIGTPW_12701_full absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12701_full, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (4 -> 4)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   XEIGTPW_12701_full:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@xe_eu_stall@blocking-read:
>
>          * shard-dg2-set2: NOTRUN -> [3]SKIP +1 other test skip

Unrelated to this series

Thanks,
Umesh
>
>Known issues
>
