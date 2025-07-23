Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347E4C83F25
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 06:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D386310E74E;
	Wed, 23 Jul 2025 06:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KviKkRla";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F2510E112
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 06:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753251909; x=1784787909;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zDCmhU6xmD3tNB2Or4SUJWxm457EV7Lg45sN277Ri90=;
 b=KviKkRlaw8YY2N+/ViBFbVLfg+uJ1uv6gm/8GeB29xr79m//mlqYWvYl
 rCBkd/03kBCLmm3yvVdemLUtjz4qI+lURwj9bZgNMVcEOM9Yu/4bjt7Mg
 vpxAVpXEAuu0DZQtQiMYtEMzLh/RN3mUJejqyka+OqibQN7EX0d8NM8qE
 sgUB6jWfSmlwU0IaCiGTl7uPBptFCGFRVvW8tazjpOUgCf+WEIr6M2nry
 RWPjHROhqtxtX/Zglyhp0Yq5upV5mxWCRWZTbGdLeCqNAmZJ3WolXPD2h
 Rz/1pYD+OEoQIahLQh25MVzqQY3ToHr/oNH1gMUij7uk1N/trsd3xXxpt Q==;
X-CSE-ConnectionGUID: X0orqUrLTIOwJgZA/reiWA==
X-CSE-MsgGUID: 7sHpQ0INQViW2rc10Hg/cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55476766"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55476766"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 23:25:08 -0700
X-CSE-ConnectionGUID: GWpCEMX2SWqX8jDy/sX3xA==
X-CSE-MsgGUID: nG1klQPvTsix5uCWl4XHHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159911796"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 23:25:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 23:25:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 23:25:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 23:25:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RE41aOjRERFblbFRIt2ZDFOSXsblT+flyoNjQ/NLzaJvRyQMII4JKL6IeZ1EuGSb5urNC4uacb71aABjp2NJQJXJ1OrhbbYJZZrMZnjR1nT+E5IhMMGZPjUuwQNAl8AXRsjV/sHcLwjqXpOzk52rbHJEiojWS4W5whjTPXKZmu1v+lJf7QkdPL+3URzxEbwJtlsur4YuXbqnFSx2o7sT7YKY32NFDCM0ha+eWNjy/Bem7F5n7H6Ain+xGC0Ar0JBC68MhBud4wmpjYk0tdDVRdPeabwZuA/u6a5VlqkddvbQSZl6dne+xDwil3DAyY0GBbtZ90KTJpRFtoR0YR4mnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lONw7axtqUsZfm+CSrQzUsg2dp4vaUctk4NYZO36bBY=;
 b=Idh/eTHkJi9jeZ1NW5nYSgMF1yz3V0JLSedSsPwwvNTjBp2mnqvOxiczRjv9guuX/SvInYv5yXhhZCzql0CXKI3wxc0MUlWNWYUWy+QSkAsxurX6lxxaucDkuXR/sAFgkKu3S4xuaArj7K8eX1986Ho3avlPRpk2C8b3tCU3CR14/nUBqVfLzjVKD8WNwHjcaRsTKcNXQz3DyLGDKO/akAwcKU48L8inL05HIEGcrDhjA0HJ4RNTNyzYUC1bialFwTjLx8bdcudr54C48/KOPrNpoaRMfkU/4RktNuDtwWl0KyDhdGdzf/CH4HQ5sbwg4mm2OeUUw7IYW6cSch49UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA0PR11MB8353.namprd11.prod.outlook.com (2603:10b6:208:489::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 06:25:03 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8922.028; Wed, 23 Jul 2025
 06:25:03 +0000
Message-ID: <b9565e1a-037f-4559-981d-d2c1fa42dec5@intel.com>
Date: Wed, 23 Jul 2025 11:54:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] intel-ci: Block VKMS for xe runs
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Swati Sharma <swati2.sharma@intel.com>
References: <20250722123920.78238-1-kamil.konieczny@linux.intel.com>
 <20250722123920.78238-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250722123920.78238-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA0PR11MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: c78b82d1-06bc-4416-aee1-08ddc9b1a8a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|42112799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDZsOU11YnMwUXUxOXJZS05TbXpTTlNzNVN1WHBybXZPRnFManl3T1Y5WlI5?=
 =?utf-8?B?dXM5clFNMnRWeWVjVDNISDV1djBNaDNiTkMwblR0enB0ZGhlZjAwMlR1Zi80?=
 =?utf-8?B?QjMraXhFQzdaeW9oL2lCTDJWcVQvTjlOL2hpWDJZRFYyK2xPQmNSVXMrNVRt?=
 =?utf-8?B?alBOM2pLVXVnRllLSDVCUlJnem5JZUVpL2p1T0UxbnI1STF0bzJEazdCT0JB?=
 =?utf-8?B?Qk1nSHpmM1U2blowKzZqYTlBbmJnT1pPU2V1UVBTS2ZLVk9OWm1FR2V6clJy?=
 =?utf-8?B?My80bWVuQTJZamd3TnhLUTduRGV3b3p1cUhTQ1lUUXprZkZaeDh2bmdIT1Iz?=
 =?utf-8?B?S0d1ZmZwRWxlZWtONnA5czFadnlBanpWUk01bUFkNHlNWFJoNUhha0pDbjJr?=
 =?utf-8?B?NlBpYUp5WUhuZmpqSDhDbzJCQlR5NU1TT0V2MGd1SUNOakRVT0NOQnRTMUs2?=
 =?utf-8?B?UE1Panc4ak5tSHFBa3F6blZ4RHlUbVRMSFdjK2NNeGlFb0VteC9GSjFuN0Z4?=
 =?utf-8?B?bU90MVlnU0pSL0IrR09LMUpyZWRiUnRoV1F5RXd5VE1nRkRWN0FJMDRnUTFu?=
 =?utf-8?B?K1JFdTRPWkNnU1FIcWhuM2gxR09KdHNTTTBXaXRnZjUwajREZ0R3ZXpKeFNk?=
 =?utf-8?B?OW1OaGkwQ2VPa0ZzTUI4ZlYyOXpSZlptM1Mydy8zNEN1eUdvaWIvVzM5UE8w?=
 =?utf-8?B?N2dhRk5Lb2U2SGNTNmhLM0FZb1Y5SWxXZ0IwYmxEelpLdEZSZ1doL3JJUGdG?=
 =?utf-8?B?UGtuOEROd1Y5SjNuelphbDJmaVpyTUZPT1NzWUJwRzhFV3JOdmlhQ3lKNUMv?=
 =?utf-8?B?dHBZOHZBRTl3NzVQYWMzbnVtYzFuVnVDalJiTXplZVZHTmpTcE45bTRrMWl5?=
 =?utf-8?B?SGlJM1Rzb280UzE1RDk2dmNxeFJxM2VicWtYaUdKSmorMnJlMFJNWXp4N1Uw?=
 =?utf-8?B?QnRUVTBqYVQ4REl4bEg1TXFMK3NMc3FNZXhEZER3MHV2SU9SeTV2UVM1bUdT?=
 =?utf-8?B?L21BdGdiT0tkYVNjQ3hyWXdkalU5bHV0U2pWOEpXVUxmZ2dwZG11WHczV0RG?=
 =?utf-8?B?YUxoSVFNRjdyZGRpNVFHQ2t0dVVmMFBkb01FMlNWckUzUXoxemhjdjRvL2J2?=
 =?utf-8?B?ZldjTFN1MWlQK1o2TUJwMENkeTF6NGd1L0JXbE9tOEVrM2ZyZlVabUhuNUgx?=
 =?utf-8?B?UjJ4SVRxejBKWi9mUDdEck1UM0QxcVF0UnB1TFRJNnF4dDhtNWN4U2tIaUxl?=
 =?utf-8?B?eWlOK2lHN0F6NjcrWlNndldyMTJOL2pBMUdhM2g4RXkya2FPay9qV3hMdXIz?=
 =?utf-8?B?cEZpMlZscmFBK0FUTTI1dTN2OTQrbnZIVEkwZ0VMMzRrSG13RFUwYTJTRU83?=
 =?utf-8?B?bTNZcG5sRWovZ1dJajVNNTl0cS8zdVlnTmV3dkZXREt0ejJNK25YMWlHejBk?=
 =?utf-8?B?TnQ3RDFSbk5sQ05KckZZZ0NwRnAvMFJkc1RNMy84bFBpRHUyU0pSMVVqZEF6?=
 =?utf-8?B?b3RHQmlwbWowbEtTYVJzTlB6Y2E4NVZVMUMzcFlmVnFGQ1RuUEFNVzFJZ1Fy?=
 =?utf-8?B?dm04SmI4ZXJERWpjaEUweUpFbVMvSXZXZkVmaXhrL3FUV205OGh1QVZyZldB?=
 =?utf-8?B?cGo0TlBvQnN2YVdzdWxMemluUTJXdmMvTG1EYlpEMzAxVk1uSlRNdU00bmNC?=
 =?utf-8?B?Q0hYMEttSmViZ05IRklJd0Fqc0l0TGxGY0ZSOHQrQUo1a1p4blJpci9FOHlR?=
 =?utf-8?B?RUVjcTYyWUdxSXFtZ0ExVVFKWmU2ZS9uVWVuUlNCZ2xybTdGQ1o2bktiTFVs?=
 =?utf-8?B?L29BaXVtQmYwZHZPSSsyTjU4MkpPQ2FKOE9QUGtjQ0dwZmFUYTZBZ0tRTzhM?=
 =?utf-8?B?ZEQ3d2hEajNvYUdsemU0MkJ1NlhYTEdaNEtmb1FySXQvV1hkcHJvNXFvWXpz?=
 =?utf-8?Q?qiY5x85OrsY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KytUUXhZTmVYWmdpSFNUL1h4RTRrVDVhNEJSSCtBL3dER0VjOU5SOVVybVhP?=
 =?utf-8?B?MHBLUEhBbEhKSFBpajZpQU11cG1kSHlGQzUrdXFlSGExd2hxYkViSDVyWSs4?=
 =?utf-8?B?MzhzYXRsOXBTWGVXQ25wOFgvaG00MDROY0YxVzZaQk9WY0FIYlRSbHEva2k3?=
 =?utf-8?B?T2l4Y1hKa0RHYzFtRGIyUk9UaXNnMVRxenltRm1DRVVzeXM4RUN3YmxyajRN?=
 =?utf-8?B?M2hRbG4rYXZWWHplRVBkcS80VGtlZ1BVQVMwSGRBVHFsdXhOQ1k1Y2J4Ujdt?=
 =?utf-8?B?eXpwalU5SmV6M3k4T2MzeVJsQ3kxVndFTU41TUJ0bTBzTGpHR2JGWjc0Vnd4?=
 =?utf-8?B?QzlBRTVXcmxheWl2WW42Q3IzNmgzK2g1MEVONzhMMkdmcTlFc1hiMVpYUFdT?=
 =?utf-8?B?R3pDV2xRanhvMWZvVHJObTFrdGNiVy9ZTXdiNG1UL0xkV1ErYlV2RlhHeGgy?=
 =?utf-8?B?eHZqSjVnZmV1NVZ5VHpSTG4xM3hpaHFxUmRxNFNPN2RyRTVpcHdFZCtlOFNB?=
 =?utf-8?B?ZkJKbFEyRVFkRjRFeTVUMEJxVjBETE14Wlg0YjFYNTFhTjlxa3Iyckwyd2RU?=
 =?utf-8?B?Ni9MZnpCUEcxSGs2RTJLK0o5blNDTktZbWl6SlFhVzZFcGc4Vm1Zc0t0WDlv?=
 =?utf-8?B?WDNDRGZyYTJid1Ura0NPMFB1a2tITGZQeU1NcVdNUUUwYVdyZ1o4clBoRjc2?=
 =?utf-8?B?Y1dEQ1JOR3FiLzNNWnNlSWlkT3FnbU9FSUprNXJ6WHkrSzU1ZW9nVGRRa1dE?=
 =?utf-8?B?ZHF1cWR4eWtlQ1RveUNuZXY2bEhwd3pFZ3kxVGRkbExZM21jUGVVb0N4S0pm?=
 =?utf-8?B?bHJuOUNGRHB3cDRsbE9ZNHcrTDRDaFozMjY5UXBtckRPSFNIb1FNL0pXNnlI?=
 =?utf-8?B?V1VraHFkMDBoQ0ZKYUlVWnFzYWVGUU9PRWEwZEJUWUxBM1I2TXBtdkE5cFlo?=
 =?utf-8?B?aU80bk9KSjFwNXJDZDZxL3lmOXVBZ3d0YVI3N2V0Si82MFVVRDJTNmR0bDdW?=
 =?utf-8?B?ZG0ybEU0NE9nRlFEY2t3MXFPNG5LZG5BSStPdHluWUxwSDY0eU5rNGM4WFZO?=
 =?utf-8?B?Zi9BUnE2SE1ZMTV1c0pQbWpRZVR4V0dhZkRodWd1VW1MUm9vbEpCenVIYUlx?=
 =?utf-8?B?UDNybDFvKzNuMzZRZmpyV1c0VjJWdi9US1JkaDlacFRwMlVPRzRzT2ZRUklJ?=
 =?utf-8?B?N01MbUZzSWJKemFCamZWejB4OGZXQzdiS3hLUllBZWFmWjZER1F0aUdrTHBK?=
 =?utf-8?B?Ukh6bUl1Y3RnbERHUGp5NE5iWG5QWHdqTWxXNndkWVFWUUFlZFA4SzIwd2pV?=
 =?utf-8?B?bTg5V3pGbDRORlZ6ekdTRmplTkIvV3FvenR1TEprWHRhWXMzOVdNMHZKNFlx?=
 =?utf-8?B?SHR6dUE1eTFFSmM3dXFqaEE2YmdXeDFEWi9iM254SVVud25qNFF5VmkyK2tm?=
 =?utf-8?B?Q044UmErMjZmeVVMNFVvRHBISEFRVzFDOUg3d1BJRStGN0V3MlVmeGR6TnU5?=
 =?utf-8?B?NGJDblFLaWRPMG1PaHYwY1lHZjJwMk5iQWNRWnpVVzNOQVI0U1VGbytObGFh?=
 =?utf-8?B?b0M2WEtlM1JyZStVWVlPZU9QakxPU1o4M3c2SmIxTlhsYmFRdHVMUUplZ1lh?=
 =?utf-8?B?UjZQcklrM2daM3dwN05XQTc5YXZ5R2pyR2NFWnUwR20yL1EwMGNGU2p1cEI2?=
 =?utf-8?B?c3Y3OEhITHRkZkxRMkZNZEVkVWFabEgyOFpPczlncm14bVVhN0ZXbFNBbDV4?=
 =?utf-8?B?MVZ0a3dKL0t2S0lsdjcvT2o1WTVGTGp1eTFxbHV0bCtiL3JOakFBOERRMnIz?=
 =?utf-8?B?MWY4M1QzZDlpcjJoZVNVamo1MUVTUzFQY0sySkYweHpMYzlmdk9ua04rTXhY?=
 =?utf-8?B?eHB0OUdRZXd5UkJzeU9qcVNhMVc5KzZMd1RFaXBWWUlNMlp1ZTgwc1ZRRUtP?=
 =?utf-8?B?Q0d3Y2J0MGhEKzA2VjlxWFpGcHZHWkwvSTB3WjJpUGVUYXFMM3pFdXJnODVY?=
 =?utf-8?B?cFRIUXRlOTYrYlphRFYyTzh3anhkM1lkaHZ6SnNyT1l0Zk9yeDlFcDhOc1c0?=
 =?utf-8?B?YkRxYzhEaFdVcy9Wa0FyR0tZQVZqU2VLSktKK0xYcDVYL2ltU2pKcXVkQ3Ju?=
 =?utf-8?Q?8+Smez705WMpik6scmGLWfLTT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c78b82d1-06bc-4416-aee1-08ddc9b1a8a8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:25:03.7272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AIvyJNrECxxBb+TQwW/3wENW8Up+14DOqPjsF/OFLYpUFioEcPQ6yOyO/I6hHJCX+s4rFfS7HuSTnjwth1U37A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8353
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

Hi Kamil,

On 7/22/2025 6:09 PM, Kamil Konieczny wrote:
> These are non-Intel tests so block them from running.
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index a21c8a3d3..2176764cf 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -11,6 +11,7 @@ igt@v3d.*
>   igt@vc4.*
>   igt@vgem_.*
>   igt@.*virtgpu.*
> +igt@vkms.*
>   igt@vmwgfx.*
>   ##################################################################
>   # Exclude all i915 tests
