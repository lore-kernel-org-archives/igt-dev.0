Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C841E77179
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 17:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F5D10F167;
	Fri,  6 Dec 2024 17:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6ANuyYL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50F710F152
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 17:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733507174; x=1765043174;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ooYB0PbOvBZrxXb3kJmLUkyGwK8l6ZmznDXNX0VQ8cc=;
 b=S6ANuyYLaUhsnwZQ3GBxK7SUqxM1Kt+DEBbbICmNjC1D3PerVnq0Zv0g
 wUMDinplpmznhth/I8X3Bo8JfnrJ3n9/teKeChzbUDOwfBAZhXl49ZPu1
 aNiX6no+7kRKdMyznkEd5FxwUjmmy5W46WgG2Dy+Ahb09EA6KtNxTDPNn
 OonawegNCtfXBW2RomcS7gnY4Hgt8IXcj8epZmMCQVhZ7s5Bt+FIzcn3d
 XceqwggBcBoyblVTC7uJaj1FMzUER0uPRllwWXqgUYphuKqEy5R5tG3wO
 LVz/kP8hNIG7A9WKZhHz0hjIfiKf8w+9DIowh3HzczHLG30TRLO6BzHzr w==;
X-CSE-ConnectionGUID: VfnO+txoRBC1swQemTZFKQ==
X-CSE-MsgGUID: V7684ORURluvmsMnaUCSPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33992349"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="33992349"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 09:46:13 -0800
X-CSE-ConnectionGUID: ro3JwZdnSMKPXwu4PEl/xg==
X-CSE-MsgGUID: s5eh3wvGTjOwskk1GP9SeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="125373300"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 09:46:13 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 09:46:12 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 09:46:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 09:46:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N29LALQ8d3HBnjGddIRXdgvcjh9uVdYV3gC4iOx6JI28qQasEPGn5e/rEU+CQkb8lWxNAPLt8fa6qZu4814ygwKwTHuN0Xx+hstnJzXA8cwMGYr+CGATlVeCsfmJuIe09OsqHrXi9PYIkdNGKyHKVmIEIq0CqwpRs1S0W9eZoU1mrTnDGx1N/aAPzNfV/gRK/AfStrtyrHh+sLpLBbbRFlUfk34lR0dJ+nSuzEknpRIUhZWg9QP55cViANc/ZuiMByTxk5mtcWnZJXA9mFrLxWnYnJiEghJIX38kKwh0+ZxuhD1QooiIWpQJtivXrc1CNt3jk3D344Qg9l1v/9mqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xIbxPgB9seh3RA/LP6e+qvDOUeWBVcIZvMIQRfKujU=;
 b=ZPWuOpGdB38GIKqOwBbZJOrKNwtEPkv8yZeo8wz6TjkC2dHPrtHyGyyAXLGoTqKDwLLrLQzaHTISnt+t/dxe7QXUn3YOaLuzWfVM8tk3Fn/W4dKYStrQ3U2gO9gIAWaR/QZZnT8hhI/vUhY53FwIxDqTG3dm0y/aws520k7V4KVY7o+MewzkT1ZXux+dPjPjU+AGzCfM5hun/zBuZBJKbLxEO2pGIH2T+bpu4enL0apEYj1L920ECMK2qZ+ghvMnBFgkDObp2A28Yjy9E0aaGOhgZspdHxnHaEszl1w0JLbTraKXbjt8VUyRhV2fG76xlZK4IZdgWHavOCAAS1VUWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA2PR11MB5050.namprd11.prod.outlook.com (2603:10b6:806:fb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 17:46:10 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 17:46:10 +0000
Message-ID: <4ba64dc7-84bf-4478-a7ce-0ff09815e46e@intel.com>
Date: Fri, 6 Dec 2024 12:46:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] tests/intel/xe_exec_capture: Add xe_exec_capture test
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
References: <20241205215735.295314-1-zhanjun.dong@intel.com>
 <20241206165939.2vidczpo67b3sjyf@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20241206165939.2vidczpo67b3sjyf@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:40::40) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA2PR11MB5050:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c409ef-1fe9-4f30-98d3-08dd161dde6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnR2NFNRSEhva1hRMW5rd3BValhwWkFkblFzbnFiQnoyWk1teUNBZWxML0RR?=
 =?utf-8?B?Y0FvTHVlZlk0RXBCcVJNNG5WT3N1ZUQ5aE5URWFlUGMwcXpoVHYxaXFiaE12?=
 =?utf-8?B?Y1ZhZEgzQ0I3RHNhQ3VDUkdzYVNvZ29rOFN6U3VmTEltWTdkZFVhZVNNbmdi?=
 =?utf-8?B?ajBpZHJyU0EvRkJ1YUdrcEkxaGNGaEFPUWRGVHJNQ2NBUFVlbXplWW8wcHZr?=
 =?utf-8?B?ckdzQWxVc1VnS1ljYTVZaUVpRjRhK2poWFhFQ2NKZnFUTG1WNmRtK3V5QVJJ?=
 =?utf-8?B?cFlxYjc5Tzdna3FSdUlZeSsyV2lyNWg0M2NRU1ZtVG1YTEM1SjNOY0F0bEh1?=
 =?utf-8?B?cU42N2h0ZWxoUzdxZFFESW9EcXJucU1peWFaUm8zdzczUk9zditVb0hOK05n?=
 =?utf-8?B?MjAxMzJyMEFxRThFRC9kUWdFTWpaT1JnSjgvelJXSGVPaGRUbGxBdFRYTC9T?=
 =?utf-8?B?NzlHTmpjeVVrS1JzMjc0cGl5TnNiSkR0aTdKMXQ2VERkdUkxWU91ejZrQkcw?=
 =?utf-8?B?dTlIRnpBcnJzSTJYaytXbFM1VGhONmJSclIrUDZ5d3loL0d5S09Kcm9MRVZy?=
 =?utf-8?B?REhVaUhsRUxlb01YTmRyU0Q0MGZndTF1VW0yc3IzK1lsNEtLL21UajV3Nk1o?=
 =?utf-8?B?aGR5K3VkODVKV2p6RGowZ3hYSkpuNmNzMXNDTklYUjgyeDZjTEUwMGlGRzRM?=
 =?utf-8?B?blFnUWIvaG9iYkZmZGp0UENzWkdXZGxocjBCY1RiTVExRWZyUkZvTmNjQ1Jh?=
 =?utf-8?B?V2d6R0JmcERnYXRpUFlmYWNJelVHQVQ1Mmpya2FNQjhiek8rRi9DcXJ1ZENF?=
 =?utf-8?B?V1dOajd2S1NQc0ZXRE84Mzc1UGFBL3FUdHJwM25nN1gvdzZaMzhCTUU2bEJn?=
 =?utf-8?B?MkY5d3NTMS9mVWtseDBPNnJPUHJSWGRpdFBFT3ZoWDZSdk45NllyL2hhRUxQ?=
 =?utf-8?B?ZGZWMVNrSnBzRnIvejk1VDVVb0xCZ2UyKzRDdWlTQXpZYUVqU2tZWEJkb1kv?=
 =?utf-8?B?dkhlLzZHRFRLeEhyWU5ieGhKYklTbnp2TFNpNXRZczJ3bTZQUndlSmVldEFG?=
 =?utf-8?B?eWpaMFNvMG9ZQytXd1BkVU4zRnZvZExXNWE3bjNKVGtOaXhQSWRzTXJlQ05l?=
 =?utf-8?B?VlI5bm9vSmZCSmZOeklsWTJrYmFoNW9QdCtVMEdzWDhhWEhJcHJmK2E5dnVW?=
 =?utf-8?B?VEc3OHFQS25vVGl3OWRnaHlNYVZoVlFUaGtjMWE0NmFFYUFQVUFXblRucVl1?=
 =?utf-8?B?SWpCdG9hVG1UZjlpTGR1bCtKeU9OOGczYlM3U244ZVlGNFdWLzVTNGRhMHg2?=
 =?utf-8?B?bFZObUZ4dENtaG0zdDM5b3JHckJXWVVJckpPMWZFL3EzRHdTK29BdmpiRHFB?=
 =?utf-8?B?RjkrcU43d2RQK3VZUGlnUkFCRVp0dXpsVXlIakxOTmFIa054WDBia2h2L2lu?=
 =?utf-8?B?VHQzSW9IMlJoK3FlNFNKc1RaY1U1a1NUdnYydEZwak84b3BmK3FjSDFRcCtj?=
 =?utf-8?B?OUVqUWNFQWJoWEcwUVo5T09jcjBOU3RjQi9nOFFhdmk5Y0JQQklzYUIxUDZO?=
 =?utf-8?B?K3RQUFRuRTNOLzBuMitlUEoxVFg4SHB1dnVnSVg0bzhLbmcrOWVBYU5MTGRE?=
 =?utf-8?B?d0Fld0t6RGpxZ2k4YUpMN1F6ZCttb3E1S1ZVRmZhcWpLT3BDOXNCUk9MMzVk?=
 =?utf-8?B?RkgzV0xqUWUvNSs1alJNUXl5ZGQxV1lZK0F0ZWRzUjcyWHVNV01XejNEa3lP?=
 =?utf-8?B?UlE2SVFPNmRlSmtjY0I1bTdyWjVnV1J4SVBNWVFiLzFzc3VLeVZXaFdSc0Zj?=
 =?utf-8?B?RXRTZDZBZDhPTXJFSWplUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTEzVTJncmxvbkRsRDM1b25vSlBzanZvcEhsYjBpQ3llK2dzY2ZKZTZFaGpI?=
 =?utf-8?B?OE5NOCtzQXk5YUNrY0lrN3dRVnFtbHFycEV0eldOM2lBbjAveXN5aXM5WHgv?=
 =?utf-8?B?ZUtlbEh0cEdnTWo0RXQ2YXdmQlVjYUdwZHdqL1NobHl6Nm9RWm42cEVKN1VX?=
 =?utf-8?B?NHZFTEV4UGlISmJDSU5zS2w0b3RRV21NcUcyQzcraThWZEljSzdYREpHbXFw?=
 =?utf-8?B?RGxGV0hFQUlOeGwzaWpRMDUvam94TDdsV1F4N09JWU5LV09lTDQ3WTMxUUln?=
 =?utf-8?B?TG1NYUVwWENjQUorcVZQVkNBRFhKWXBZbjFQc25uTjJzbFA5blFwYkJ5dU9F?=
 =?utf-8?B?N010VDlwUElUS2Zhc2NtMllRRDZtRk1CU2lDbHZJSDBIOG82UUxqa0tMUks5?=
 =?utf-8?B?MTd4VklUN1hOT3Z6UzQ3RlVZemZZSXp1d1U5bDZCbHA4WHFhVi9CR0haOGRV?=
 =?utf-8?B?Ymt1aWc1dFBGWUR5UTg5QVB0Q1NuSGlGNWhJekFUTnRUOWVwV25xVklycXhF?=
 =?utf-8?B?dy9IYitHRnV3S2pWV1dSNzJPVnZnTnVGUFJnaFBpdmlzMWNBQkFRN0xrTGFJ?=
 =?utf-8?B?a2M0VWN4ZHJDMGcxK0ZIU2ZpZGx0RVprbXVUMVFESkExTlpIbFdPZ3ZkMGNT?=
 =?utf-8?B?ZTA0aHQ1S0JBNkhjVHF4NmZjUllYVTI2d3JnRVdQaW1BTmtEaDhYZmNXaHJV?=
 =?utf-8?B?TUh3VFc4a2E5bzVSQUNTWVFleXdjZWNBR2N0N3EwejFrUEQ5ZXUyMmtSY1ZP?=
 =?utf-8?B?NDViOEFabWN4YmtlREZuTE12WkpBWDJ6b3ZyMTJwa0NQcTh4QjFQUFB0NGkx?=
 =?utf-8?B?OEhRdFM4OUdKbXJIUitSeUZpT1dWTzZFSTR3cFdjNWJ3WXkrakR3TlVQd1BB?=
 =?utf-8?B?eHdNcGt2RlZSbmNldUx2RG1mR1BBWjFicHJjUDd5OGdLMkVYaExOMnFHVktn?=
 =?utf-8?B?ZXY5Z2Y3R05xa1FOTE56d0ZJOThrUDAxK3JlTTVoWlJ1emtJakZhZkhQZG1z?=
 =?utf-8?B?SmNWbnZRR1BxT2dHMnBvU1JmS3pNTFhTSEFxOGxTc0NZM2I4a2VvNmlFTk80?=
 =?utf-8?B?UmhTcEx1QzZkMy9DdllndWt0TUFjc1ZjMGdjUkJqQUt3OEhOVFhVU1V0VzJX?=
 =?utf-8?B?SER5ZFE3TkVDbVBNYXhPcWVBTlprSm5KZWNKa2RoYjJFcnZ2Ky9NNU5vb0lq?=
 =?utf-8?B?VE16OThETjRVMVVFd2dkSnVHb3g3d0oydlg5bk8rL0Y5RUtQVWo5R1Yvd2hR?=
 =?utf-8?B?aVM2aDhjU3lRRnBTNjRNRnYxQUg2d0JxODAxVStqTzFKd3pqYnZlOVpwcU9x?=
 =?utf-8?B?YmZZMFhyZFJrU3hBUldHMkU0QjdIcjFzV2pGdFNEKzRQYWp3S2RvRDZRWER2?=
 =?utf-8?B?R2lESTZ6eHJiU3dhR2ZqTFA5Y2I5MlBxalA4cDZLYkkvZUpoZWJaWEVsbjUx?=
 =?utf-8?B?MzdtSHlnbzc4UERaa1BRN3Zod1d1bDZKWG1hSk5PSkZlT3ZYQUFyRFJHSk4z?=
 =?utf-8?B?NkRZMDNZNE1HSWxqWWQxWGlabWVXTDIzWnExRS9xdDZmaVpsWW9HVStyMWpI?=
 =?utf-8?B?TlNrb0JkTy82VXYva1BuYm1sUUkxK0k3WGlvNk5TNjlYNVVTZDJETnAzWnpj?=
 =?utf-8?B?U3UzYTNjR2E4TEp2czZRcmpXdm1mOUYxdG5vQ29iQXVpei9jcjFmUTRTbHdR?=
 =?utf-8?B?bFpvTDdqMk1MRGdDUjFIVTJGUGJmOHBFdlJHdWU4a0k0aVIxbkFnWlIxazFi?=
 =?utf-8?B?ck1lbmljSDd0NDMvaUhmd2JsZkFhNjlyWG1CWnhNeEpqeUVVL1hCTWIrVTc4?=
 =?utf-8?B?VFVBRXFvbWF5S3hZTFlVekRoMGNwdnFDM3N3MDBsT0FIT01LKy9yK2NUM0pH?=
 =?utf-8?B?UGdjWVRFYVFGQ1dzVjg1M3pNUzJTY1JQVTNpZkJmeWdzM3JJeWZCQXY0cVRV?=
 =?utf-8?B?WExoTlA0QVVPZEY2MDU3OElOdUJQNUZIVHNnQXJpZStXU0oyMXpZTHZkY21t?=
 =?utf-8?B?cC9oQlNUbDZ0TzJ3cjFKYlVPN2Y2SnlBdHBmQWhSZ3hRUjRFaEhwMm0wWWNu?=
 =?utf-8?B?SnFXdlUwQ2szV2dISlFuK0F4SW8wVldGVVhmZXViSktEMVRDcjU4ZERxOXlD?=
 =?utf-8?Q?r0CzUDaZ6yk2kWElIZjUfyIKk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c409ef-1fe9-4f30-98d3-08dd161dde6a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 17:46:09.9904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vrSyL0ZWY0aZ8FWOknmrRL6Hz8TjHu0jDi9lQF3uzQrRHsLH9ei9vG0sqzE8cfFlwzEl9opg3kenHeKweMiyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5050
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



On 2024-12-06 11:59 a.m., Kamil Konieczny wrote:
> Hi Zhanjun,
> On 2024-12-05 at 13:57:35 -0800, Zhanjun Dong wrote:
>> Submit cmds to the GPU that result in a GuC engine reset and check that
>> devcoredump register dump is generated, by the GuC, and includes the
>> full register range.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>>
>> Changes from prior revs:
> 
> Please write changes after '---' so it will not enter git log.
Thanks for advise, will post another rev.

> 
> Btw why testing takes so much time? 50s for one run?
> Maybe you should split it into 'reset-%s' where param
> is engine name? You could use igt_subtest_f() for that.
The test will run reset engine test on each engine, for one engine, it 
takes about 7 seconds. For example, when it runs on ADLP, it take about 
35 seconds. It might be more if DUT has more engines.
The test need to test over all engines, make sure no devcoredump capture 
mixed with other engines, like run test on engine A but got capture for 
engine B, so run on single engine will not able to do this important 
condition check and is not recommended.

For multi-GPU case, as the test will fork a thread for each card, so no 
need to warry about take too long time on multi-GPU case.

> 
> One more nit below.
> 
>>   v7:-  Fix typo and removed unused macros
>>   v6:-  Adjust start_line to start from 0
>>         Use 7 bit engine_cid, start with random number
>>         Add ioerror detect on fgets
>>         Reorgnize the regular expression
>>         Remove unnecessary radom seed init
>>   v5:-  Detect devcoredump matches the testing engine
>>         Engine will run with random cid
>>   v4:-  Support runs on multiple GPU
>>         Load all devcoredump content to buffer
>>         Alloc line buffer dynamic vs static global memory
>>         Changed to igt_assert_f to provide more info if failed
>>   v3:-  Remove call to bash and awk
>>         Add regular express parse
>>         Detect devcoredump through card index
>>         Add devcoredump removal check
>>   v2:-  Fix CI.build error
>>         Add multiple GPU card support
>> ---
>>   tests/intel/xe_exec_capture.c | 474 ++++++++++++++++++++++++++++++++++
>>   tests/meson.build             |   1 +
>>   2 files changed, 475 insertions(+)
>>   create mode 100644 tests/intel/xe_exec_capture.c
>>
>> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
>> new file mode 100644
>> index 000000000..de44137de
>> --- /dev/null
>> +++ b/tests/intel/xe_exec_capture.c
>> @@ -0,0 +1,474 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Basic tests for GuC based register capture
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: CMD submission
>> + * Functionality: Debug
>> + * Test category: functionality test
>> + */
>> +
>> +#include <ctype.h>
>> +#include <fcntl.h>
>> +#include <regex.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +
>> +#include "igt.h"
>> +#include "igt_device.h"
>> +#include "lib/igt_syncobj.h"
>> +#include "lib/intel_reg.h"
>> +#include "linux_scaffold.h"
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +#include "xe/xe_spin.h"
>> +
>> +#define MAX_N_EXECQUEUES		16
>> +
>> +#define BASE_ADDRESS			0x1a0000
>> +#define ADDRESS_SHIFT			39
>> +#define CID_ADDRESS_MASK		0x7F
>> +/* Batch buffer element count, in number of dwords(u32) */
>> +#define BATCH_DW_COUNT			16
>> +
>> +#define MAX_TEMP_LEN			80
>> +#define MAX_SYSFS_PATH_LEN		128
>> +#define MAX_LINES			4096
>> +/* Max line buffer size (includes last '\0') */
>> +#define MAX_LINE_LEN			1024
>> +#define MAIN_BUF_SIZE			(MAX_LINES * MAX_LINE_LEN * sizeof(char))
>> +/*
>> + * Devcoredump might have long line this test don't care.
>> + * This buffer size used when load dump content
>> + */
>> +#define LINE_BUF_SIZE			(64 * 1024)
>> +
>> +#define DUMP_PATH			"/sys/class/drm/card%d/device/devcoredump/data"
>> +#define START_TAG			"**** Job ****"
>> +#define END_TAG				"**** VM state ****"
>> +
>> +/* Optional Space */
>> +#define SPC_O				"[ \t]*"
>> +/* Required Space */
>> +#define SPC				"[ \t]+"
>> +/* Optional Non-Space */
>> +#define NSPC_O				"([^ \t]*)"
>> +/* Required Non-Space */
>> +#define NSPC				"([^ \t]+)"
>> +#define BEG				"^" SPC_O
>> +#define REQ_FIELD			NSPC SPC
>> +#define REQ_FIELD_LAST			NSPC SPC_O
>> +#define OPT_FIELD			NSPC_O SPC_O
>> +#define END				SPC_O "$"
>> +
>> +#define REGEX_NON_SPACE_GROUPS	BEG REQ_FIELD REQ_FIELD_LAST OPT_FIELD OPT_FIELD OPT_FIELD END
>> +#define REGEX_NON_SPACE_GROUPS_COUNT	6
>> +
>> +#define INDEX_KEY			1
>> +#define INDEX_VALUE			2
>> +#define INDEX_ENGINE_PHYSICAL		2
>> +#define INDEX_ENGINE_NAME		1
>> +#define INDEX_ENGINE_INSTANCE		4
>> +
>> +static char *safe_strncpy(char *dst, const char *src, int n)
>> +{
>> +	char *s;
>> +
>> +	igt_assert(n > 0);
>> +	igt_assert(dst && src);
>> +
>> +	s = strncpy(dst, src, n - 1);
>> +	s[n - 1] = '\0';
>> +
>> +	return s;
>> +}
>> +
>> +static const char *xe_engine_class_name(u32 engine_class)
>> +{
>> +	switch (engine_class) {
>> +	case DRM_XE_ENGINE_CLASS_RENDER:
>> +		return "rcs";
>> +	case DRM_XE_ENGINE_CLASS_COPY:
>> +		return "bcs";
>> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
>> +		return "vcs";
>> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
>> +		return "vecs";
>> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
>> +		return "ccs";
>> +	default:
>> +		igt_warn("Engine class 0x%x unknown\n", engine_class);
>> +		return "unknown";
>> +	}
>> +}
>> +
>> +static void
>> +test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int n_exec_queues, int n_execs,
>> +		 unsigned int flags, u64 addr)
>> +{
>> +	u32 vm;
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 2,
>> +		.syncs = to_user_pointer(sync),
>> +	};
>> +	u32 exec_queues[MAX_N_EXECQUEUES];
>> +	u32 syncobjs[MAX_N_EXECQUEUES];
>> +	size_t bo_size;
>> +	u32 bo = 0;
>> +	struct {
>> +		struct xe_spin spin;
>> +		u32 batch[BATCH_DW_COUNT];
>> +		u64 pad;
>> +		u32 data;
>> +	} *data;
>> +	struct xe_spin_opts spin_opts = { .preempt = false };
>> +	int i, b;
>> +
>> +	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>> +
>> +	vm = xe_vm_create(fd, 0, 0);
>> +	bo_size = sizeof(*data) * n_execs;
>> +	bo_size = xe_bb_size(fd, bo_size);
>> +
>> +	bo = xe_bo_create(fd, vm, bo_size,
>> +			  vram_if_possible(fd, eci->gt_id),
>> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	data = xe_bo_map(fd, bo, bo_size);
>> +
>> +	for (i = 0; i < n_exec_queues; i++) {
>> +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>> +		syncobjs[i] = syncobj_create(fd, 0);
>> +	};
>> +
>> +	sync[0].handle = syncobj_create(fd, 0);
>> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>> +
>> +	for (i = 0; i < n_execs; i++) {
>> +		u64 base_addr = addr;
>> +		u64 batch_offset = (char *)&data[i].batch - (char *)data;
>> +		u64 batch_addr = base_addr + batch_offset;
>> +		u64 spin_offset = (char *)&data[i].spin - (char *)data;
>> +		u64 sdi_offset = (char *)&data[i].data - (char *)data;
>> +		u64 sdi_addr = base_addr + sdi_offset;
>> +		u64 exec_addr;
>> +		int e = i % n_exec_queues;
>> +
>> +		if (!i) {
>> +			spin_opts.addr = base_addr + spin_offset;
>> +			xe_spin_init(&data[i].spin, &spin_opts);
>> +			exec_addr = spin_opts.addr;
>> +		} else {
>> +			b = 0;
>> +			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +			data[i].batch[b++] = sdi_addr;
>> +			data[i].batch[b++] = sdi_addr >> 32;
>> +			data[i].batch[b++] = 0xc0ffee;
>> +			data[i].batch[b++] = MI_BATCH_BUFFER_END;
>> +			igt_assert(b <= ARRAY_SIZE(data[i].batch));
>> +
>> +			exec_addr = batch_addr;
>> +		}
>> +
>> +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>> +		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +		sync[1].handle = syncobjs[e];
>> +
>> +		exec.exec_queue_id = exec_queues[e];
>> +		exec.address = exec_addr;
>> +		if (e != i)
>> +			syncobj_reset(fd, &syncobjs[e], 1);
>> +		xe_exec(fd, &exec);
>> +	}
>> +
>> +	for (i = 0; i < n_exec_queues && n_execs; i++)
>> +		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>> +					NULL));
>> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +	syncobj_destroy(fd, sync[0].handle);
>> +	for (i = 0; i < n_exec_queues; i++) {
>> +		syncobj_destroy(fd, syncobjs[i]);
>> +		xe_exec_queue_destroy(fd, exec_queues[i]);
>> +	}
>> +
>> +	munmap(data, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +static char **alloc_lines_buffer(void)
>> +{
>> +	int i;
>> +	char **lines = (char **)malloc(MAX_LINES * sizeof(char *));
>> +	char *main_buf =  (char *)malloc(MAIN_BUF_SIZE);
>> +
>> +	igt_assert_f(lines, "Out of memory.\n");
>> +	igt_assert_f(main_buf, "Out of memory.\n");
>> +
>> +	/* set string array pointers */
>> +	for (i = 0; i < MAX_LINES; i++)
>> +		lines[i] = main_buf + i * MAX_LINE_LEN;
>> +
>> +	return lines;
>> +}
>> +
>> +static char *get_devcoredump_path(int card_id, char *buf)
>> +{
>> +	sprintf(buf, DUMP_PATH, card_id);
>> +	return buf;
>> +}
>> +
>> +static int load_all(FILE *fd, char **lines, char *buf)
>> +{
>> +	int start_line = 0, i = 0;
>> +	bool skip = true;
>> +
>> +	memset(lines[0], 0, MAIN_BUF_SIZE);
>> +	while (!feof(fd) && i < MAX_LINES) {
>> +		/*
>> +		 * Devcoredump might have long lines, load up to
>> +		 * LINE_BUF_SIZE for a single line
>> +		 */
>> +		if (!fgets(buf, LINE_BUF_SIZE, fd))
>> +			if (ferror(fd) != 0) {
>> +				igt_warn("Failed to read devcoredump file, error: %d\n",
>> +					 ferror(fd));
>> +				break;
>> +			}
>> +
>> +		if (skip) {
>> +			start_line++;
>> +			/* Skip all lines before START_TAG */
>> +			if (strncmp(START_TAG, buf, strlen(START_TAG)))
>> +				continue;
>> +			else
>> +				skip = false;
>> +		}
>> +
>> +		/* Only save up to MAX_LINE_LEN to buffer */
>> +		safe_strncpy(lines[i++], buf, MAX_LINE_LEN);
>> +
>> +		/* Stop on END_TAG */
>> +		if (!strncmp(END_TAG, buf, strlen(END_TAG)))
>> +			break;
>> +	}
>> +	return start_line;
>> +}
>> +
>> +static int access_devcoredump(char *path, char **lines, char *line_buf)
>> +{
>> +	int start_line = -1;
>> +	FILE *fd = fopen(path, "r");
>> +
>> +	if (!fd)
>> +		return false;
>> +
>> +	igt_debug("Devcoredump found: %s\n", path);
>> +
>> +	/* Clear memory before load file */
>> +	if (lines)
>> +		start_line = load_all(fd, lines, line_buf);
>> +
>> +	fclose(fd);
>> +	return start_line;
>> +}
>> +
>> +static bool rm_devcoredump(char *path)
>> +{
>> +	int fd = open(path, O_WRONLY);
>> +
>> +	if (fd != -1) {
>> +		igt_debug("Clearing devcoredump.\n");
>> +		write(fd, "0", 1);
>> +		close(fd);
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static char
>> +*get_coredump_item(regex_t *regex, char **lines, const char *tag, int tag_index, int target_index)
>> +{
>> +	int i;
>> +	regmatch_t match[REGEX_NON_SPACE_GROUPS_COUNT];
>> +
>> +	for (i = 0; i < MAX_LINES; i++) {
>> +		char *line = lines[i];
>> +
>> +		/* Skip lines without tag */
>> +		if (!strstr(line, tag))
>> +			continue;
>> +
>> +		if ((regexec(regex, line, REGEX_NON_SPACE_GROUPS_COUNT, match, 0)) == 0) {
>> +			char *key = NULL, *value = NULL;
>> +
>> +			if (match[tag_index].rm_so >= 0) {
>> +				key = &line[match[tag_index].rm_so];
>> +				line[match[tag_index].rm_eo] = '\0';
>> +			}
>> +			if (match[target_index].rm_so >= 0) {
>> +				value = &line[match[target_index].rm_so];
>> +				line[match[target_index].rm_eo] = '\0';
>> +			}
>> +
>> +			if (key && value && strcmp(tag, key) == 0)
>> +				return value;
>> +			/* if key != tag,  keep searching and loop to next line */
>> +		}
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static void
>> +check_item_u64(regex_t *regex, char **lines, const char *tag, u64 addr_lo, u64 addr_hi)
>> +{
>> +	u64 result;
>> +	char *output;
>> +
>> +	igt_assert_f((output = get_coredump_item(regex, lines, tag, INDEX_KEY, INDEX_VALUE)),
>> +		     "Target not found:%s\n", tag);
>> +	result = strtoul(output, NULL, 16);
>> +	igt_debug("Compare %s %s vs [0x%lX-0x%lX]\n", tag, output, addr_lo, addr_hi);
>> +	igt_assert_f((addr_lo <= result) && (result <= addr_hi),
>> +		     "value %lX out of range[0x%lX-0x%lX]\n", result, addr_lo, addr_hi);
>> +}
>> +
>> +static void
>> +check_item_str(regex_t *regex, char **lines, const char *tag, int tag_index, int target_index,
>> +	       const char *target, bool up_to_target_len)
>> +{
>> +	char buf[MAX_TEMP_LEN] = {0};
>> +	char *output;
>> +	int code;
>> +
>> +	igt_assert_f(output = get_coredump_item(regex, lines, tag, tag_index, target_index),
>> +		     "Target not found:%s\n", tag);
>> +
>> +	if (up_to_target_len) {
>> +		igt_assert_f(strlen(target) < MAX_TEMP_LEN, "Target too long.\n");
>> +		safe_strncpy(buf, output, MAX_TEMP_LEN);
>> +		buf[strlen(target)] = 0;
>> +		output = buf;
>> +	}
>> +	code = strncmp(output, target, strlen(target));
>> +	igt_debug("From tag '%s' found %s vs %s\n", tag, output, target);
>> +	igt_assert_f(code == 0, "Expected value:%s, received:%s\n", target, output);
>> +}
>> +
>> +/**
>> + * SUBTEST: reset
>> + * Description: Reset GuC, check devcoredump output values
>> + */
>> +static void test_card(int fd)
>> +{
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	regex_t regex;
>> +	int start_line;
>> +	int engine_cid = rand();
>> +	char **lines;
>> +	char *single_line_buf =  (char *)malloc(LINE_BUF_SIZE);
>> +	char temp[MAX_TEMP_LEN];
>> +	char path[MAX_SYSFS_PATH_LEN];
>> +
>> +	igt_assert_f(single_line_buf, "Out of memory.\n");
>> +
>> +	regcomp(&regex, REGEX_NON_SPACE_GROUPS, REG_EXTENDED | REG_NEWLINE);
>> +	get_devcoredump_path(igt_device_get_card_index(fd), path);
>> +	lines = alloc_lines_buffer();
>> +
>> +	/* clear old devcoredump, if any */
>> +	rm_devcoredump(path);
>> +
>> +	xe_for_each_engine(fd, hwe) {
>> +		/*
>> +		 * To test devcoredump register data, the test batch address is
>> +		 * used to compare with the dump, address bit 40 to 46 act as
>> +		 * context id, which start with an random number, increased 1
>> +		 * per engine. By this way, the address is unique for each
>> +		 * engine, and start with an random number on each run.
>> +		 */
>> +		const u64 addr = BASE_ADDRESS | ((u64)(engine_cid++ % CID_ADDRESS_MASK) <<
>> +						 ADDRESS_SHIFT);
>> +
>> +		igt_debug("Running on engine class: %x instance: %x\n", hwe->engine_class,
>> +			  hwe->engine_instance);
>> +
>> +		test_legacy_mode(fd, hwe, 1, 1, 0, addr);
>> +
>> +		/* assert devcoredump created */
>> +		igt_assert_f((start_line = access_devcoredump(path, lines, single_line_buf)) > 0,
>> +			     "Devcoredump not exist, errno=%d.\n", errno);
>> +
>> +		sprintf(temp, "instance=%d", hwe->engine_instance);
>> +		check_item_str(&regex, lines, "(physical),", INDEX_ENGINE_PHYSICAL,
>> +			       INDEX_ENGINE_INSTANCE, temp, false);
>> +		check_item_str(&regex, lines, "(physical),", INDEX_ENGINE_PHYSICAL,
>> +			       INDEX_ENGINE_NAME, xe_engine_class_name(hwe->engine_class), true);
>> +
>> +		check_item_str(&regex, lines, "Capture_source:", INDEX_KEY, INDEX_VALUE,
>> +			       "GuC", false);
>> +		check_item_u64(&regex, lines, "ACTHD:", addr,
>> +			       addr + BATCH_DW_COUNT * sizeof(u32));
>> +		check_item_u64(&regex, lines, "RING_BBADDR:", addr,
>> +			       addr + BATCH_DW_COUNT * sizeof(u32));
>> +
>> +		/* clear devcoredump */
>> +		rm_devcoredump(path);
>> +		sleep(1);
>> +		/* Assert devcoredump removed */
>> +		igt_assert_f(!access_devcoredump(path, NULL, NULL), "Devcoredump not removed\n");
>> +	}
>> +	/* Free lines buffer */
>> +	free(lines);
>> +	free(single_line_buf);
>> +	regfree(&regex);
>> +}
>> +
>> +igt_main
>> +{
>> +	int xe;
>> +
>> +	igt_fixture
>> +		xe = drm_open_driver(DRIVER_XE);
>> +
>> +	igt_subtest("reset") {
>> +		int gpu_count = drm_prepare_filtered_multigpu(DRIVER_XE);
>> +
>> +		igt_require(xe > 0);
>> +		if (gpu_count >= 2) {
> 
> Print here with igt_info() that you will test many GPUs.

The current output is:
Opened device: /dev/dri/card1
(xe_exec_capture:4171) igt_device_scan-DEBUG: Found 2 GPUs for vendor: intel

and:
(xe_exec_capture:4172) <g:0> drmtest-DEBUG: Opened GPU0 card: /dev/dri/card1
(xe_exec_capture:5118) <g:0> DEBUG: Running on engine class: 0 instance: 0
(xe_exec_capture:5121) <g:1> drmtest-DEBUG: Opened GPU1 card: /dev/dri/card2
(xe_exec_capture:5121) <g:1> DEBUG: Running on engine class: 0 instance: 0

The <g:x> indicate running on different thread

> 
>> +			igt_multi_fork(child, gpu_count) {
>> +				int gpu_fd;
>> +
>> +				gpu_fd = drm_open_filtered_card(child);
>> +				igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=%d\n", child,
>> +					     errno);
>> +				igt_assert(is_xe_device(gpu_fd));
>> +
>> +				test_card(gpu_fd);
>> +				drm_close_driver(gpu_fd);
>> +			}
>> +			igt_waitchildren();
>> +		} else {
> 
> Print here with igt_info() that you will test one GPU.

The current output for one GPU is:
Opened device: /dev/dri/card0
(xe_exec_capture:11810) igt_device_scan-DEBUG: Found 1 GPUs for vendor:
intel
(xe_exec_capture:11810) DEBUG: Running on engine class: 0 instance: 0

How do you think about the above information at debug level?
I can add igt_info output in the future. For now, I would like to merge 
the test, then if any coding changes broke the capture functionality, we 
can get noticed ASAP.

Regards,
Zhanjun Dong

> 
> Regards,
> Kamil
> 
>> +			test_card(xe);
>> +		}
>> +	}
>> +
>> +	igt_fixture
>> +		drm_close_driver(xe);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 2724c7a9a..a6750d523 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -285,6 +285,7 @@ intel_xe_progs = [
>>   	'xe_exec_atomic',
>>   	'xe_exec_balancer',
>>   	'xe_exec_basic',
>> +	'xe_exec_capture',
>>   	'xe_exec_compute_mode',
>>   	'xe_exec_fault_mode',
>>   	'xe_exec_mix_modes',
>> -- 
>> 2.34.1
>>

