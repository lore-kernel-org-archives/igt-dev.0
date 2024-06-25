Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E98C3064D
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 14:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA03B10E655;
	Tue, 25 Jun 2024 14:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I32O1mFF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA70010E655
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 14:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719324535; x=1750860535;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XTxyo1f+h17jHHwK/0fuMaUdFsM44/H3jiQbykWzGI4=;
 b=I32O1mFF+lW9dz4403Ok3hQf93js921ZYkQGxzRJMIKX6cm1VjsGcnro
 caBF5oIIXkixhsYWBWVRUO6M2vSP/s9fmiJb6i1YpAuWTXLGOLHwF7ptw
 ytbIvlgIgyVXsbedNZcw8RgXzyaBlZ5J+K8KogM407erdMQGcf+xAAa0g
 UIl448/EJ+xBSyfctpfitJvCdxKPeYdSzAIHjaBzAFr1ItPyug0Ol5bJh
 NL69r2je/8FoXA+YxjQrM1BF0eORnJlsc/vBCC6ZFUQt4qsDK0jfSpCmN
 DY/NQvY7OvlEmAeF4+rVxTKEeoyqLjQ0d0/Z5/zgsoEva1QHoedEEfi0U g==;
X-CSE-ConnectionGUID: IuxddZVbSO+njz422kYGcw==
X-CSE-MsgGUID: du70mXNFSoaIvDuYUKuDtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16571927"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16571927"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 07:08:55 -0700
X-CSE-ConnectionGUID: rQvHpwEYQ+SF+s91NJpu/g==
X-CSE-MsgGUID: TphQ6exMQBKhjGZB0qHGJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48104608"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 07:08:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 07:08:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 07:08:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 07:08:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWN6T/Hf2JL2iEJaayG6/wB1tcQhkrn+T8BOSO8fG4PTOljoPzqPobHXEGxE2OdX/F/UqTJXwlYbtqZRe8W5HN8MlmtvY9Yn7kf4DYzKseayjwTB8FGXOYzviRvIbT5JDq41iVSiUEf3ZAyYQXrD6mHYxHkdphF9PGTlwcVK6SymLsBnqBqi8xUO4Vk+8vC37nPOHGA6d92Mg17VceglNQClIxbI3TudET97MiDBkHV5MQHcOjGk72xzfQgd2tskr9LmhnueFc4ssauIYRYllDu9tAP3q0dLLlNEl9siyPrdzp7ETmFQxPobvqCCkruTzXywo261tt6wTkprF8/IIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBmxQQEr3nIQfwdkn+pfDWrffsNdM180CWlGhoMtqes=;
 b=djAbgd3ctLyL7HfpJflYEkDwMNiCRt20Lc4sZFrYiI4w/kri3/n+Hq1+Zrh4zS8wMWkkH8OIuv5TZd4e93PbJ9wU2K0BUZoskQNzJbhFFm2ib2Hcql4XYZCCPkf6Rzi1S3YRq4+HAnoHEJKy3DvovZ1UO/W0D8wsfwn4rUAQalygjxiIXvtyFI1KvwS+8Rpy6bg0dxjMy1nkYDRjSjFicl7q/gLYfsUQbdIbU2jPKyRGdyOSzszfSTggEKOtgM5zAODe0YuXDdX4pFHBZ5JYus3HZQk+ypgKBX1F1XRjcIgM4YZPiohx0W4DM2/4GjphgnVz0IG2bP7yRlNqh0bt4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.31; Tue, 25 Jun 2024 14:08:51 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 14:08:50 +0000
Message-ID: <8950a599-a4d7-44e5-89ab-65ae4ca97be3@intel.com>
Date: Tue, 25 Jun 2024 19:38:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/chamelium/kms_chamelium_color: prefer
 HDMI port for color tests to avoid DP FSM failures
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>,
 Mark Yacoub <markyacoub@chromium.org>
References: <20240625140605.1420518-1-kunal1.joshi@intel.com>
 <20240625140605.1420518-4-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240625140605.1420518-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eaea87d-b3c9-48af-6b73-08dc952056d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dStVeDgxZlJSdjlRaHNsSnJ1SXREcm1YdCtkUzFpYnZ0Zm54VU1raW5kOFNC?=
 =?utf-8?B?K2l6RjFoK1BKVmxGQ1MvalpzYThhenYvenlISGw5Z08wanZablZhVDFPblQ3?=
 =?utf-8?B?OHpXbUZod3hpYlRiRVpOeGJ1NmNVZnl1Y0tDbUI5SzRwNE1oZlBqYkFsZWoy?=
 =?utf-8?B?UHVWMWIzRlhLOXU1Ukx3QUQxS3plSGMybFpSOERwN0NlUXlOZkZyemhoRGg3?=
 =?utf-8?B?TVZES0RhSGxRK0E0YzNMQVZQRURMaHBXaFBMYU5OWlpncmF0cXlDZkNPcTNZ?=
 =?utf-8?B?RVpaSGZoVUY2YjgwRWhCMXhRZFZnTjcvM09FdTB4djNEdUxsK1pySmFnSTNP?=
 =?utf-8?B?QWtScWF6Tjh2Y0ZUcG5tWXlPeEIxUG14Titmbmp0QnRqMnl2TkovajFBNUZC?=
 =?utf-8?B?WFpjOHlKMU0wK3Q1blZ1bmhYcGJHZmR5czU5R09Vemw3TUhrN00yRGJzQXBO?=
 =?utf-8?B?Y3F4bTRhVU9qTGU3d1F5N09hUmR4OG5aWW52ODJlOXZ1ZGpKQ3JPRWNDQlVs?=
 =?utf-8?B?eFJ3aHZxSFgyOUtoSTk1SE56YjZ6dG1yNEJMby9OSWc0OVVUd0xrY3I1TExn?=
 =?utf-8?B?bER0TlRnL2ROdHdWY1JWeVh3VmRITXAxRjhQRndENll2TDFlckg1WjNVRHJy?=
 =?utf-8?B?cG1kZ1kxUmZhRFZ4aGVudWp5Sit2R1JkWmphTlBoemQyK3pZWlUzNklEeVFm?=
 =?utf-8?B?MVk3VTFSTHdraW1BaU1jNTBweWdtd2Znb0c4c0h6aFhkRnVyZTNvMm9QTldT?=
 =?utf-8?B?OFZic2RBSTFvTzdDVURPeGpmTlN5bGNMWFBxMERSUUFhcE5JSXk4MGRFMWlz?=
 =?utf-8?B?bHh3a0ZMdkdraVZXdmZReVBLKzdHOHV0TUhKVnVMaGJSb2hxeVFTN1llRHNo?=
 =?utf-8?B?UVIyZlpUOGZmWk51OEpvK3hPMkVteDdJWmxnY3NNZUd4T285MHlIY2swMzR3?=
 =?utf-8?B?dWo3S0c0SEFyUGx2SDFQTkFPb3M1QS9QRDB2RjlaSUlLNXJya3RMUEZEWGVN?=
 =?utf-8?B?UnptNFJodzU0MDJOZ2p0RkdRd1NZRXJzZDAwODhWRzBKQktNYlY0N2RWQUZC?=
 =?utf-8?B?K3JvTmJJM01qZTRaTDh3ZE9WUFMwenhmekhwa0Nia1hMY0N2b3hma216dHoy?=
 =?utf-8?B?QXBzSUt1OGJDemsyc1lEQTlxNmRWa1c2a1A2UTJsZG1QTzY3SkdOUGJJeU94?=
 =?utf-8?B?NklsZUNyVzNqamgyZmNEdHltSnh6SDVtcnpuQUMvNVN5UlFpRG9MOVZMT1c3?=
 =?utf-8?B?QW1BOWxHSmJvVDdZdEFyTFptMFY2Z0tKVW1BT0VMNVhsTjlRNFIwWjBxK0FP?=
 =?utf-8?B?M05pS2syWmZSNGNyVTJHYzhUR3JyaEJhaC9ESjhYZWxtVHNZUjI5a2VtbWxu?=
 =?utf-8?B?RzJMSnlKRXdzbEw3WUJQT2NnSlA5dFFSeFlzTkFpNGM2bVJIRW52ZXZnU0Y1?=
 =?utf-8?B?ZisxRVJSY00reHRhZER0cTI5akxoYTBJQ0lVT1liVzJUUVZ5cTlWWU1rYUQr?=
 =?utf-8?B?Vkd2em1zREVtSkw0MEhJZmJiRnJiUzJQUng5RWlRTzkwNWRQRjZXVlBFWE1J?=
 =?utf-8?B?djE5dFVmajVlN056aEVxRHlUaTZubkpmd1d6ODRYakdtbnBWck9OeGJKMHhz?=
 =?utf-8?B?RmVqZG5valViMUM2bndhd2kyaHRyMVBCdEdCN0FXSm1qWFg4VC9iMy80aW5G?=
 =?utf-8?B?Wm8vUFJnVFhKWkdJNlFjRWtVWTNqTVV4amJUNUdXUUkwRGp1clkvQ01hUUli?=
 =?utf-8?Q?LeDeLkjeyonjFZmcpDvqboJRRFxbyoq4KC6F1ZH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkx2V3Fzb0xlYVhRR2RvQlIzNnhGTU9DcW9BcVVtUGlqU2Z1VElKL2lpSFZ3?=
 =?utf-8?B?emdoc3VJa0NKS2ttVkY2czhmLzJwc2hyTEIrR1U5Lzc1cUNuY2xVWkxMVFpU?=
 =?utf-8?B?SGk0bEdFTGVTVkJEdzVCMENCRzJzNDBaTXlhU1hmb3d3WkRhbTlNT25vb2xP?=
 =?utf-8?B?Yk5zOU4vdGkrVU1WTXRBb0xUOUI5d3NYMUhjeEttYitsVjVSOWVhZEdjSHZl?=
 =?utf-8?B?LzFMN01iRUFWR3JBSHMzRlRxM1JwdDcydjJlMmV0bUNuQWlzaVdRMGJRb0kv?=
 =?utf-8?B?MnNNVFJyVSs3RXZYak5YcHZCNWNxcFROZUxBOHlGdU5UenNxa0dXWXdwZFFV?=
 =?utf-8?B?K0dwQ0dHZG16YjZ4TlQ1bjhSQ2d1bktETTNZQVRRQ1VqdkxYSm9LY0NHVitR?=
 =?utf-8?B?dFhlRmxoVHNMUEpVelRUMTJUVWJ5bzBZQm93VERmaklGcEs2QTlDT01pVFNi?=
 =?utf-8?B?dVNVa3NNak5ZSmFXOXBWNWdlUHc3a3h5bWZZRjRzb2Y3c2FpMHRHSkl0b3kr?=
 =?utf-8?B?bmlOVVlYMnY2RHhJOGtuVnZFdzBZSlMycjhVMFVUcWJxVFJFcm84WFJVamJD?=
 =?utf-8?B?eXVRdDJMSkNRZ0wzS0prVGZIU2ErUUs5ZlFLYVlqeU9wU0hMYTcxVGkwN2Nt?=
 =?utf-8?B?OXMwa3FVcmxxVlZBNDlOMjFSZ1V0Q1l6S1RtWUt0MnF2WG16dlAvN3VLMjU1?=
 =?utf-8?B?T1J4MWFKQ3dVWGRFaWNJTDZHVXF4eDJpSzk5WEdsOE5RU2UycEFycStCbGR3?=
 =?utf-8?B?WmpIaXkySmQ0cVpCdGxaMWtSMy9vcE1LRThaUGRDbUF1Q0Q3RUwzR2w0eGI1?=
 =?utf-8?B?Qnc2QUlZbVdBNWVnQVdQMGtqS2xvL0pLQWNvODNZZ3FjWEZob2YxSGU4YTg5?=
 =?utf-8?B?Vko0L3d1U2xTYlpYRG1SQzA4Z1B6RTNDYUdDcVN2bTg4QnNZUzRSMTNHUlVE?=
 =?utf-8?B?Ylh1ajREbWhwS1VoZW9zVGhCRGFUL0hVS1RKZUxudnhQUU9OdzJLaFRLc1BU?=
 =?utf-8?B?QkNTTi9nTGxOZDcxaThmYkx3SVZBM2dodkNMY3hZclBKaEw1bGJFaStOTk1W?=
 =?utf-8?B?dXhvSEdyNkxoYkloNmhaL0NWSHBJU1Q5UjFZY2NwNnRLR2VXQTNNVjBhNmlh?=
 =?utf-8?B?bUxKWWMwRzB1MHh0aGM1UXVTR3RzWWxNdzVoNDZGWmE5MHlZaitrclVtUVFK?=
 =?utf-8?B?eGVMVzM2Wm10WHdtTk5vR2w5NjU4K1duUEZmV2tyN0lzM0VIWk90elpjWDJq?=
 =?utf-8?B?WjRkeGpOUzhCc0dVQlpHeWJUVjZZbzhDVVJhMlNtTFlsOWg1bTZuRGFUQjkx?=
 =?utf-8?B?N2hmYzFqQnZ4RTZ4NXM3cWw2VU9YZGVxOG5XZEF6eGdrV1BBYnpJOFlHM3NI?=
 =?utf-8?B?NTgvQm12MTBHOHlkMTIrcklFak53UWVLWDJZcHcvQnpUR3haVFlXZkJ4bTB4?=
 =?utf-8?B?djQ0Y1BLVDVpb2hTVXJGak5wOUoxZTNqMzB3NzRPRmlUQ3VEei84MC9oUEZz?=
 =?utf-8?B?bGswcXBraFFGajJiR3JjS00wYVMxUE9PRHJGYldrR1A3dFRGQzg2WVFLc1lC?=
 =?utf-8?B?ZVk0QXJSVWhCREtTQjIxQnVFUkluK3JEQ1BLSDdoWlh3dXhESmZmVmE5dXcx?=
 =?utf-8?B?ZVlld1owT3dNcU10QjRFbmNzRjlBNGxpUVpsaXA0RUx2dVVkbnlzV3hOMDk1?=
 =?utf-8?B?Q2FhbVJManNmSmlOZkFCWGFpZjhyQ0pmbGxUVDRaZ2grcE8xOSt2MmpwenBG?=
 =?utf-8?B?aUkrWkd0dVZyV0tvUGI1THZyOThmYS9BUHFlSFdnOWRGRVEzUUZUZXFzV3pQ?=
 =?utf-8?B?L3QvR1RYTDNUNHJKck8xNXo2aUUrMVJTcW05U2kzZG9TSm5LZTdJQUxsK2VX?=
 =?utf-8?B?N2V1bXBjSTA2QjZqQTBxOCtkYUZSOHBUM3doU3RrbE9nRUluS096TFpBazR2?=
 =?utf-8?B?dmM0bms2T1VtYk9OSTlDKzdsLzdtU09mMUYxenR3Q1VDdE9iTU5NaEdSVE5R?=
 =?utf-8?B?RlJoR0JTd3ljQkdYcTFPeUdkMDlRS3p6eUdRYUJ1SitmY1RHK3NpL1U2RDg5?=
 =?utf-8?B?WTg3WXFSbm5UQnV5cHBtdVhDR3BjME1IS1BESTAxNFZrMEpleC91WUYwb05t?=
 =?utf-8?B?bGFITjNGcnQ0RUtqb2JkcGErUzU0NlJ4VER4MGNWa2t5cjhGM1hWbXVnRHNI?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eaea87d-b3c9-48af-6b73-08dc952056d9
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 14:08:50.9257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 523PsDpxhZDAWQG4H0PHEZfLn7jKk2YIMkcvFAhqezU81Cs9FxM6WOwNjVdQmfKoq0PQPRgfbKRHJUaXTjdBhQpSq7S+zPs0nslrs+YA4sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
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


On 25-06-2024 07:36 pm, Kunal Joshi wrote:
> Both DP and HDMI connectors are fine to capture, just we are more
> stable on HDMI and sometimes face DP FSM failures, for color tests
> prefer HDMI if its present, else use DP
> 
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Cc: Mark Yacoub <markyacoub@chromium.org>

LGTM:
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/chamelium/kms_chamelium_color.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
> index 392eaf1f4..5550cec22 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -468,6 +468,19 @@ static int test_setup(data_t *data, enum pipe p)
>   
>   	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>   
> +	/*
> +	 * Prefer to run this test on HDMI connector if its connected, since on DP we
> +	 * sometimes face DP FSM issue
> +	 */
> +        for_each_valid_output_on_pipe(&data->display, p, data->output) {
> +                for (i = 0; i < data->port_count; i++) {
> +                        if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +			    data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
> +			    strcmp(data->output->name, chamelium_port_get_name(data->ports[i])) == 0)
> +                                return i;
> +                }
> +        }
> +
>   	for_each_valid_output_on_pipe(&data->display, p, data->output) {
>   		for (i = 0; i < data->port_count; i++) {
>   			if (strcmp(data->output->name,
