Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60969F4BB77
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 19:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38C010E131;
	Tue, 24 Feb 2026 19:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOIM3w4W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB3310E131
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771959612; x=1803495612;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jY3/7LmKeO8pTzrA3S5190k3hFF5/J3o5k9GrURDw8w=;
 b=SOIM3w4Wrw6PHB76HcLg/dxelHSzMG3xGuHBUVjm8fsf3coyrxWLpXvn
 HxJR3P4GNPTVryL+QBFP2+fJLJKAMg/P2/vACgrAt8lpVa8wX919SxEFw
 9UUZvClra8n6VcaxuCCGW/CWyShJ1fHAx4mC4nzCgKyf8EVnn0yse/59q
 lC35j+zq6kUCrmwG967yvAgY9Kg3WEO8VkaUr5A7Hxlmn2FKs3gAAVHmQ
 oL1WVaghIqi+GQx06Ap/SBoutVehsgd7JWgNo/hgrE533V0y3uSmY1tJq
 odAbGALTkDmvYOm/Q5LosqCFm908sMKaCF5OuOenqFKOQ3PuEU3WSHULq Q==;
X-CSE-ConnectionGUID: Sx48HvPIQDyp8aMzjVN89Q==
X-CSE-MsgGUID: gHvB+Yo6S56aPFgtM9rJmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73055459"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="73055459"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 11:00:11 -0800
X-CSE-ConnectionGUID: A+DSy9fmQX6pGlfmSIsmhQ==
X-CSE-MsgGUID: FORxhDu2S6KNOQ8XAk8RtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="220495280"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 11:00:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 11:00:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 11:00:10 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 11:00:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ho7LcyLOqrY8eIkvexbb/BPzcNwlYFLCkQ3o7Wm/CbdvkoO61VupF3NFI7L98fhHHwnDoV3lBnJPpAXmc7xYIJw5SRJFgt28OLhHLXdAQDqzxiKng3qGiFGnpjpQQBM/MDysknzSkLNc3yaqPxMBI+oDiC6mb3L45Qg2+oZOGvvzFKeVIoeUojSWALmczv11zPBxseBx4j7mXvFJFHq1xx7W7zwqoDAn99rAaMO7Km6lLc1NMsLOT0aDmZYXk/vYWVKt7PWReAaJk+8pUZTa6Y1yBDzSBmc7eCKC7mzvuCj6tQZ75x4POwBUvrP4/+anLy8BhMLWj/esnBGt/NggsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hy7r7CkUTYajICBnfzGXhoLBdvu2jAbDFZsajGSxMAo=;
 b=bcC4W0GdF292qwgM20Kboa7Vf4XvAIFOfd/ZQM5G4vvHNdYLHlAL3eyS6eCNjcAK0mOas49OPqaerIxRt9BNbAz1elm5zlFEu1DlLslsc885ja3XSlqc5m3Xi6aylTgEOchA00eB1ihaBZlFN3vVfuldqsraCdW1jOBQeCU18by0qm+JoTK6ezHSpAlTUJdNv6bcNrxxSIJ+caN9ECnXLelInM2J/31WFrvJFtfFAvQhIrLahhaXh7XsRCxtZlE6gSQHziTzGNveYX1Rp/s38Kh4bvCPghCsQnHegKJAPjoxfKXJ7ZSFIXos1EwrPgeSj6J4kR95qjuAfuCZtljm7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SJ1PR11MB6227.namprd11.prod.outlook.com (2603:10b6:a03:45a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 19:00:07 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 19:00:07 +0000
Message-ID: <d606728e-436f-4f94-8992-1c39155199f9@intel.com>
Date: Tue, 24 Feb 2026 11:00:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t] lib/intel_pat: use kernel debugfs as
 authoritative PAT source for Xe
To: <himanshu.girotra@intel.com>, <matthew.d.roper@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260224170737.12151-1-himanshu.girotra@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260224170737.12151-1-himanshu.girotra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SJ1PR11MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 066c5a95-e7da-4362-3500-08de73d6ed2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHIvZG5DanN6cW9yZTkwRGJBV0ZWTStTSHNUMGxyZ3N5b3JUYzl6RGFkYTVW?=
 =?utf-8?B?M1pFbUlPYVllMDNBL2xxNnFzVW1vdlFEYlJ4aEFKYmhaVXZkNENRRWIxMVZL?=
 =?utf-8?B?N1dMNWZJUXRMdHpqdERxejg4MnZPanhHYVlPbDQrdFFBdGRpWGZ2aTRCaGlL?=
 =?utf-8?B?SVlKWmMrNE02YUN5MENlV1N1YWZGYU1hUFY4SXRHMEk4enlYWGlsNjA5alh3?=
 =?utf-8?B?VGJ5cDZEczUxNmRVZnN2UktEZEdVYTl0aUVocllZVHhHcWpleko1cmFWTFRH?=
 =?utf-8?B?TjdVd05zR01YRU1TeUNMejVIR0pWQmZZc2ZPM0lVUTl1b1AyT3NwZmd1MXdI?=
 =?utf-8?B?VjhjZ1JKdm1QaWFlM0NHdUJQaTN5R1RSRVRNMWxiWHUxanhzbVBOMG1aRHV2?=
 =?utf-8?B?V0QzRGFpcXo4UzRYNCttTGh4VkJLdjZwUXNCcEcvZVhHZkg2Rzk0U2s5SmJG?=
 =?utf-8?B?S0lDL1RVcVRxdjlGTzVSRmdNODZFSVIzZTRRTllYZFUrcUJUQ09Bb29BQ1hk?=
 =?utf-8?B?K25NOWJ0M1JLVGFIMVNubmF1WlN1NXR3WHVrNVB2Q2pucTUxa2pYNWhiNXZq?=
 =?utf-8?B?TXlibDlEY3dPQ1BHK1FRSmRjRUFINHQzSS9YM0lVQXo5eVhHd09pbEtjbktT?=
 =?utf-8?B?SGFLeGovUEFpRFNnRWRyMlVYWGV2QzRidjZlY3d6dDZHQ2M4RFdsa3F6RXBQ?=
 =?utf-8?B?MjZNbXF2TllDZ0R3ZG5pYXVJOXM2OHBmYmZQUllSVEJ5TlFnY2RBemoxd1Vx?=
 =?utf-8?B?QmpvYnFHNG1jM0R4T3VpZDVhUGIrTHhvNEEzZmlTRWZucmw1WVVMenF0SDRW?=
 =?utf-8?B?SmJMWHk4QVJORUR0WjhlNGcxWkg5MlRLRFl6ZTBiT3lSeG1DcDVZU2RZd2gr?=
 =?utf-8?B?NlBWeS9jeFoxUU9Fb01zbjlxSUFxN3NxL0N4Y3RUSy93bURLTk1xK3RhSUFE?=
 =?utf-8?B?eW0xYWswR1ZybFNlL1dDK2RsUm9GbEd1M1YwSkx6bkZ3K1hCa21RYWh2US8z?=
 =?utf-8?B?ME9HdHRIOWlGOEpub2NFdisyQTZnQlNUZkI0TklEUGxFaEp5dFhLMjNYaER5?=
 =?utf-8?B?dXVkMGtsZXprVkZsUnlUTG10dW5vOXBGdS90VlNPU1Z0MHZhMm1laTNzQjFQ?=
 =?utf-8?B?M0lMcmZocDA1K0E4UUo1Qk1RZTVsZWsxUXlLeWw4aGcwS041SzduV2h5OXQz?=
 =?utf-8?B?K09iSWM2YU1jWGFHSUdCenMyRTAvQXVSUWdXN1RhVndnc2FjaWh3SXVUOSt0?=
 =?utf-8?B?czZXK0Q4bkd3RzB3aWFYdXNFNU81VlJqU216eEFkL0JLRkFqUmRvaGZPNjZv?=
 =?utf-8?B?NzR6QXVZUHNtYmw3ME1ucFVnYVdycXROOUUvTWsrVXYwYjI2aDFIWDExcjNI?=
 =?utf-8?B?WnBoOWs0UktNclNyYWl0b3c4VGEvRDlzM2d3c2RjTGs4OXZhMFJmSGovRmVP?=
 =?utf-8?B?TGhRL0NlbjlDK2orZzlxMm1CUlVxRDJja1h5WEViVi9GMVNPaElwM2VyK1Iv?=
 =?utf-8?B?a0wrOFdDOUYvQWZFejBqNmJtZmRiRVZOSTlXQXRoWXBCUk9ER0ZkZXNxbGZ4?=
 =?utf-8?B?b2pSTThFa1oyTnJMWVNIQTNrcWRLN3cva1czZmlvRmVHem00VGJkL2lmT0hY?=
 =?utf-8?B?eWxyQzdrSjI2c1dXZkpoMElQNnZwUzE2end4UUJtVVlrVGJsUEx3blBGN3ZY?=
 =?utf-8?B?SGw4ZTJ4YnRtWUdhbG1jVTRnNmNvOUt6bUZkSkpJYTVmZE9QSW13ZnN4RW1a?=
 =?utf-8?B?NHRUaDF4WjlKK2VUaXpteGNZVVFQTzdRTnZIaDQzN1RZOE1NdmFUbWhKMWtv?=
 =?utf-8?B?REhOV2hCd3lzakNZZU13MHBzR0RtR3k0dXBwejk5c3YrejdORUZmeGdsaXo2?=
 =?utf-8?B?MzFFZmpHdEFxdTZORTNHeUpzdVk4UFlyUlFwL2J6NVJtRFFFMnBlT3duRGFj?=
 =?utf-8?B?bWl2VmZISHdzQ1dwWGxhckJNWTZ5cmtkZ1M0WjNKSlRmYVc5MUt0Q25Xb1ZG?=
 =?utf-8?B?QUphanZtNWY4Qlk5eUYxdzNGUkRVdVpYTDRyMXlEMmNXZVRqZzVwa2ZGOTRh?=
 =?utf-8?Q?eweowK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2xlWVcvUFJTQUJIZ2VuMm05MlVOUXV1Z1MyK0k5emVVNjU1NEdZMlBMV0lH?=
 =?utf-8?B?YUpHSDFUalVWMnNjTG9YM1ZzaHpqOHFMMStPcUczbDI2a3hQTEo2ZTRBeUhy?=
 =?utf-8?B?MjQ4ekh5TXk5aDJZQWxST1lKaHRSeTVGdXBGSW1iaVdjREhPUjBSbzFSZTNX?=
 =?utf-8?B?S1ArMDF5bzljRzNmN2xzU2Q5OUIwc1FzbXNoVlFkMTJuWWsxNUdBYURadkRD?=
 =?utf-8?B?SWRDUytFM2dzSy9pc3hNM2RiZEFxc3htbXlEZnRwQmZoOW42cWhERkFBc25K?=
 =?utf-8?B?dGN4VFM5Y21KMThIL21SQ2pOVGFrQVdnQUZHemtHYUozQjlrZWdrclhXN3Zo?=
 =?utf-8?B?RTZiSHFOSjBjZ0I2OFk3VlU2NWdoSkswYm9jcVp3eUxiOHlBSkw3cDg5OTNO?=
 =?utf-8?B?aEdUNnJyZmJmKzljeFk2ekJya3VWKzlLLytmb0hYODhKaE9ZODdvclE5K1FW?=
 =?utf-8?B?QzRXK2xtZnlwUmY5M3Y4L0tmR1Y1R0ZOSzBtUmVZdzNJWXpiZW9PVlBVWkp2?=
 =?utf-8?B?Y1NTZ1hkRWlXbVBWVTEwY0lBM1pPeWkrcHBkUWNOSFY0Wm9paEhDVndJOEIv?=
 =?utf-8?B?RFBHaklyMmlkbWdFNG5CMFRwWnJkTU94VXo0bXk0MXBER1JKUmFzU0NtaVZ2?=
 =?utf-8?B?NFVwOEJTRStsMzB2dXNoZ1dMVHB0WWdNUmNwVWNzY1M0aEZFOWoyVGtvdVVK?=
 =?utf-8?B?ZTIrOEZpSjRtWVErY0xnaFVhQnNCb0N6S29DMGxuOEVjTC9DSFVvQUdxN3RO?=
 =?utf-8?B?aDJQelREcXVMZEtSWTRvVGxKeFkvZmlSR2JJNlcrUjN2ZlhHcnlkTUc0MWxr?=
 =?utf-8?B?L3VlUlNNblRZNWFqMjF4QkI5Ykhrc0dac2kzWGpuYU0wbjdGeDRaVmpNTUN1?=
 =?utf-8?B?dkhCaTRkNzRScWF2a2lMWnRMTzdaN1h1SkZiVzB0eG9lMlo0UXMreVp0ZmFq?=
 =?utf-8?B?S1Bpc21HYURQSWNMd1JoR2F2Sk01SWJoOWZ3RlZ0MUZ1MzdKMFp1K0dnZ2tR?=
 =?utf-8?B?aEhrdmZSMkx4a3RqV2ZxaWRneVhvTVRnUG5pMDBEYVNxUkRqOWlCYUsxeEJO?=
 =?utf-8?B?WUdnOWE1MTN6eEVxelYwSWpoTlVHTnQ2VGdUQ21oQ0t6Tktsd3lKSW56dTdZ?=
 =?utf-8?B?MFlHVDRiK1NOMjRZL0hYNkxJZk9jQWdtYjFiSk9qeHBUOWhzT21VUVR5L0dy?=
 =?utf-8?B?NW9VS3pockpoV1hUSUVkT0ZQU0cvVWN0OGNGVGVQaS9abTRUL29QbkxKczVk?=
 =?utf-8?B?SlpQVUVWTkdFUWpLb2hWQVQzQ1E2NzdvQnFoam9CZFJmK2dCS2lzcThpR3NI?=
 =?utf-8?B?VHpLcGNoNXJVWTVIRjR6U2JPUWNGc3c5TDU4ZnJyeXpUaDQ4cHZoSDFydHZ2?=
 =?utf-8?B?bVNUSkJuT3k1aFVBYzhzQ295dUtua1Q4NVpUamYvU1RJU1NmSzVSNlo0UDY2?=
 =?utf-8?B?Nk9EeTF6SFdlNlFSQUxqOTFhYXhaWmcyeXhtTENpUWd2TTBNc1dPUEZsU3JO?=
 =?utf-8?B?K2dMcDJRWVZEV294RUNTV05qcTlwbkdTZUc3dmx0NTRvck5zMjc0WmpEbkdi?=
 =?utf-8?B?emxuS1Bhb3Q5RUlMZFc3cFc2YXdCRVFrSjZhVmV0ZlBjcTJKb0NvSXZDREM1?=
 =?utf-8?B?V2s1b0FPekZzVTdtbkowTlZ5Y3psQ3ZCdVZDaDk0bW9lRit2ZU8xSGZZd1BY?=
 =?utf-8?B?dXBlS2JDdlJNdDZRdFBIRUpWVFl6VDUrUG4vQmdmcVVnZVVlY3lZOXhxLzJQ?=
 =?utf-8?B?bzFzK2JCbVFsTmtHTDc3TEtpRjlwZHBrSUtDVFE5VzZKMkNnS3RNM2tJK0dM?=
 =?utf-8?B?aUJyUU9FazVHM3FabkZadDByR0djRDlmbU9oSDNkRTdldDZ4WFN0cFdBVjFr?=
 =?utf-8?B?clBGcHJyN2Uvc1ZwNXRpZ3hvYTZtd2pvMmNCWXhYc1lpNGZCdExJUUxGcGRG?=
 =?utf-8?B?L0l1WGdJKzBnMUxIbWZqblRWK25LVU40UXVxOHFmZlBWengvd1FjYW9XUjV1?=
 =?utf-8?B?QXJCSkl4Nk5wdTdtTkl4SGxoVTZaU1pRUVlTdUZzNDl5V0h4N1NGZFc0MEpP?=
 =?utf-8?B?bGZObEtHZHBoN2I1RnV6b3k5Z2NyaktOaGpFL3lGNytxRWtJLzVwWnNJaTNn?=
 =?utf-8?B?WlcvNFVmVFVhMlJ3cGNXd1c1bXNEOExET1ZsSWU0MDhCc0R6NjJ1bHNDM2tr?=
 =?utf-8?B?WDFFQTl0WkhRYzJVVzNOc3RRNW5Pa09samhtMUZCcUt0U0dNaVJEb1BESTJ4?=
 =?utf-8?B?eURreUgzYzVrd1FGOFI2VklkcTJqNko1REJVT2RTRENuTUY4eE1WVHg3ajV4?=
 =?utf-8?Q?abgdTo6uzhlyTWUQS1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 066c5a95-e7da-4362-3500-08de73d6ed2c
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 19:00:07.4770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9dc493cGTaTTzL+Y1W4gflO4wfQWsfzJWBc+fic+WyF9iuuH1TIKc9FB8UgcQIWtj+c0SqKoF2hrRxxWHKOLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6227
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


On 2/24/2026 09:07, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>
> IGT should treat the kernel as authoritative for PAT configuration
> rather than replicating platform-specific logic and workaround
> adjustments in hardcoded tables, which is error-prone as PAT layouts
> vary across platforms.
>
> For Xe devices, query pat_sw_config from debugfs instead of using
> hardcoded PAT indices. Remove the Xe-only hardcoded entries and
> retain the i915 fallback for older platforms.
>
> Drop the now-redundant max_index assert in pat_sanity().
>
> v2: Drop redundant index asserts; instead validate actual PAT register contents for correct cache types (Matt Roper)
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>   lib/intel_pat.c      | 37 ++++++++++----------
>   tests/intel/xe_pat.c | 81 ++++++++++++++++++++++++++++++++++++++++----
>   2 files changed, 94 insertions(+), 24 deletions(-)
>
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 9815efc18..8660a2515 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -96,24 +96,27 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
>   
>   static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>   {
> -	uint16_t dev_id = intel_get_drm_devid(fd);
> +	uint16_t dev_id;
> +
> +	/*
> +	 * For Xe driver, query the kernel's PAT software configuration
> +	 * via debugfs. The kernel is the authoritative source for PAT
> +	 * indices, accounting for platform-specific workarounds
> +	 * (e.g. Wa_16023588340) at runtime.
> +	 */
> +	if (is_xe_device(fd)) {
> +		int32_t parsed = xe_get_pat_sw_config(fd, pat);
> +
> +		igt_assert_f(parsed > 0,
> +			     "Failed to get PAT sw_config from debugfs (parsed=%d)\n",
> +			     parsed);
> +		return;
> +	}
>   
> -	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
> -		pat->uc = 3;
> -		pat->wb = 2;
> -		pat->max_index = 31;
> -	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> -		   intel_get_device_info(dev_id)->graphics_ver == 20) {
> -		pat->uc = 3;
> -		pat->wt = 15; /* Compressed + WB-transient */
> -		pat->wb = 2;
> -		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
> -		pat->max_index = 31;
> -
> -		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
> -		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
> -			pat->max_index -= 4;
> -	} else if (IS_METEORLAKE(dev_id)) {
> +	/* i915 fallback: hardcoded PAT indices */
Actually, from the very beginning when I modified the intel_pat library,
I wanted to remove this IGT code
(https://patchwork.freedesktop.org/series/157481/#rev2).
However, there was a problem: in the IGT test, the xe_oa test would drop
root privileges before starting the test. You can see the specific issue
in the CI.FULL fail case of your first version
(https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14590/shard-bmg-2/igt@xe_oa@mmio-triggered-reports@oag-0.html).
I previously tried caching the read pat table to prevent it from being 
read again after
dropping the root. However, while caching at the library level is 
advisable, cached
data can become problematic, especially when running on different GPUs. 
Therefore,
I didn't modify this part. Instead, I validated this data in pat_santiy 
to prevent errors
caused by not updating it in the IGT in a timely manner.

Xin


> +	dev_id = intel_get_drm_devid(fd);
> +
> +	if (IS_METEORLAKE(dev_id)) {
>   		pat->uc = 2;
>   		pat->wt = 1;
>   		pat->wb = 3;
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 21547c84e..6ad6adab7 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -103,6 +103,57 @@ static void userptr_coh_none(int fd)
>   #define COH_MODE_1WAY		2
>   #define COH_MODE_2WAY		3
>   
> +/* Pre-Xe2 PAT bit fields (from kernel xe_pat.c) */
> +#define XELP_MEM_TYPE_MASK	GENMASK(1, 0)
> +
> +static bool pat_entry_is_uc(unsigned int gfx_ver, uint32_t pat)
> +{
> +	if (gfx_ver >= IP_VER(20, 0))
> +		return REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
> +		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
> +
> +	if (gfx_ver >= IP_VER(12, 70))
> +		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
> +
> +	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 0;
> +}
> +
> +static bool pat_entry_is_wb(unsigned int gfx_ver, uint32_t pat)
> +{
> +	if (gfx_ver >= IP_VER(20, 0)) {
> +		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
> +
> +		return l3 == L3_CACHE_POLICY_WB || l3 == L3_CACHE_POLICY_XD;
> +	}
> +
> +	if (gfx_ver >= IP_VER(12, 70))
> +		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WB;
> +
> +	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 3;
> +}
> +
> +static bool pat_entry_is_wt(unsigned int gfx_ver, uint32_t pat)
> +{
> +	if (gfx_ver >= IP_VER(20, 0))
> +		return REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_XD &&
> +		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT;
> +
> +	if (gfx_ver >= IP_VER(12, 70))
> +		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT;
> +
> +	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 2;
> +}
> +
> +static bool pat_entry_is_uc_comp(unsigned int gfx_ver, uint32_t pat)
> +{
> +	if (gfx_ver >= IP_VER(20, 0))
> +		return !!(pat & XE2_COMP_EN) &&
> +		       REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
> +		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
> +
> +	return false;
> +}
> +
>   static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
>   {
>   	int32_t parsed = xe_get_pat_sw_config(fd, pat_sw_config);
> @@ -120,13 +171,14 @@ static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
>   static void pat_sanity(int fd)
>   {
>   	uint16_t dev_id = intel_get_drm_devid(fd);
> +	unsigned int gfx_ver = intel_graphics_ver(dev_id);
>   	struct intel_pat_cache pat_sw_config = {};
>   	int32_t parsed;
>   	bool has_uc_comp = false, has_wt = false;
>   
>   	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
>   
> -	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
> +	if (gfx_ver >= IP_VER(20, 0)) {
>   		for (int i = 0; i < parsed; i++) {
>   			uint32_t pat = pat_sw_config.entries[i].pat;
>   			if (pat_sw_config.entries[i].rsvd)
> @@ -144,13 +196,28 @@ static void pat_sanity(int fd)
>   	} else {
>   		has_wt = true;
>   	}
> -	igt_assert_eq(pat_sw_config.max_index, intel_get_max_pat_index(fd));
> -	igt_assert_eq(pat_sw_config.uc, intel_get_pat_idx_uc(fd));
> -	igt_assert_eq(pat_sw_config.wb, intel_get_pat_idx_wb(fd));
> +
> +	/*
> +	 * Validate that the selected PAT indices actually have the expected
> +	 * cache types rather than comparing against hardcoded values.
> +	 */
> +	igt_assert_f(pat_entry_is_uc(gfx_ver, pat_sw_config.entries[pat_sw_config.uc].pat),
> +		     "UC index %d does not point to an uncached entry (pat=0x%x)\n",
> +		     pat_sw_config.uc, pat_sw_config.entries[pat_sw_config.uc].pat);
> +	igt_assert_f(pat_entry_is_wb(gfx_ver, pat_sw_config.entries[pat_sw_config.wb].pat),
> +		     "WB index %d does not point to a WB/XA/XD entry (pat=0x%x)\n",
> +		     pat_sw_config.wb, pat_sw_config.entries[pat_sw_config.wb].pat);
>   	if (has_wt)
> -		igt_assert_eq(pat_sw_config.wt, intel_get_pat_idx_wt(fd));
> -	if (has_uc_comp)
> -		igt_assert_eq(pat_sw_config.uc_comp, intel_get_pat_idx_uc_comp(fd));
> +		igt_assert_f(pat_entry_is_wt(gfx_ver, pat_sw_config.entries[pat_sw_config.wt].pat),
> +			     "WT index %d does not point to a WT entry (pat=0x%x)\n",
> +			     pat_sw_config.wt, pat_sw_config.entries[pat_sw_config.wt].pat);
> +	if (has_uc_comp) {
> +		uint32_t uc_comp_pat = pat_sw_config.entries[pat_sw_config.uc_comp].pat;
> +
> +		igt_assert_f(pat_entry_is_uc_comp(gfx_ver, uc_comp_pat),
> +			     "UC_COMP index %d does not point to a compressed UC entry (pat=0x%x)\n",
> +			     pat_sw_config.uc_comp, uc_comp_pat);
> +	}
>   }
>   
>   /**
