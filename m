Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50770E7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 11:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDBD10E8E2;
	Wed, 11 Dec 2024 11:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPC07m2t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E902510E8E2
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 11:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733914810; x=1765450810;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AHfExCpQQC2hQic+GJnkcWg4IsBcjGAI42VfIeW6N4A=;
 b=iPC07m2tffo6A8mgPlsZrpqCuVXk/1fCpbs/vSgUQAsF8SSGbkR0NMjp
 TksezBol88xNQFL7euJvZw3o2hBv9WzsSsUytaqZCyGUhq2tJGbylzxed
 bVBdBU6ESpVa+ip+XQMmRQp/bhSYbWeO8WDxfsSnCbfxAXRU7bxSDmn3M
 32sHNKYhmy0h5lZejU8GYW8V3zDV2lDBvXbI9aSy5lFzr72xZzovddzFQ
 GKT/i4t11mgELDZIs7KZx5pKHNnUg5cDr/sw+jORvc3dGKYpzcAlOhU7o
 nWo+WFPRbbO//58+1YmkaW4soMU5kiiJjOlycT6kMWP5DHNE8cITmPE+Z g==;
X-CSE-ConnectionGUID: anzad+bZSDKdltieyGaamQ==
X-CSE-MsgGUID: WVc2KIWQQFi1IqFpxZFiVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44761000"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44761000"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:00:09 -0800
X-CSE-ConnectionGUID: iVG5q+6lQV2GJKs8V0D20Q==
X-CSE-MsgGUID: Gvfnb+qrRimA/xCRORjaFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="96233646"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 03:00:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 03:00:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 03:00:09 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 03:00:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMWtVh4tEVaTuprIfy16yu6+lWEIF1pogAAQHJlZ62+rcagB97lEEiZDsynn8fuGon5ZuleLy5xpdO9VUD0e6AzzzMQQbdfxaENm84MT9LEKrTEYPbppNweFOZVN9thF1Gl7kutOXHlZuXU+2hThLWDCULIeDA0xem5oGy9ThzdOrk3pTLPLRJzGvsYFZVJ7gtEqyYkcbynU0WyrGrJ3giX5Gw99xYm+ywG1SBW8SD7VX2OQXznzhJ0U2H2YdTVxgCIlf3eeeVBQCnM+RdURrkXaKlZG2wxijd6q+0kft+YMxLFyvWNk1pXOh5rgmMCo2aXfW1wV5SuViki7l8l4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxCeit+s4GFoQoGYqikgvg40iPTBvuQTU5JC7JDqpXI=;
 b=hTadfVjDQSCEajDacaPSPBc08HcsKIvW4JJYXaPcHg4bFzYSOLrhRt1ohad77RP25ZHmD3f4za1thZLCslFCMDG6pNxZzbCF9bVEsI3ncKJOr9GVWLfSBHGB+w9JqWpwsUrIju8ILJ5ivTGQKHkU6DFW/dVdg7N/+W+GPAHAW7ZUoldwx2L5eQ7EkE0oUJToZbMsKHTDEqq8353Oq1UHHZWp/+Wwec4YgeGs3THbfKGugJ7aPNJSBAt1Rn96Il+Pxqvs3GEXZoDf+HBJ/2VaUItxZW8OQi2wFa5zIze0KJ8i7pZEm299e9AK0/kfeRHn9Z7Py+R++Q/7uYepL8xGAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 10:59:26 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 10:59:25 +0000
Message-ID: <30247acf-c528-44d2-beb4-b13b16f65332@intel.com>
Date: Wed, 11 Dec 2024 16:29:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/9] tests/kms_sharpness_filter: Add dpms/suspend
 subtests
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241209114623.1843033-1-swati2.sharma@intel.com>
 <20241209114623.1843033-7-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241209114623.1843033-7-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PEPF00000184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::4a) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW4PR11MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff30b12-a769-4a2d-0609-08dd19d2e071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDVMYlJ6ZFFKTWJoamVBUmlnQjcvRnJTaFlXTDE0cW1mMFpDTjJCZFFFOGJv?=
 =?utf-8?B?aHFlU3RFZ3cxS3d4V1lTTmt5d3RWZG52STBMODliUS9aTzBxUTZoQ05yNHhQ?=
 =?utf-8?B?M2EyeExjYTdEWi9xUWdlcktCM0hSUUZsWWhTMVcvdWZzYnA1eXNGTlI0OGJ5?=
 =?utf-8?B?ZDg0WnB0Q2JOSDFmd3hOeEx5R1VpNjdOTmFmOEhUWUtvTWZhVE1TSnJPQnBB?=
 =?utf-8?B?V2dXWHY4S0Rzc05GNUs5enlSQkYzM0JxdFJXdnJuajFTSncxd2dLUHRjTTV4?=
 =?utf-8?B?N0grVUMrb0dVc0QvSkk0UEFMQThUczNyWTltZURucU9DV2RvcE9vR0ZsUldC?=
 =?utf-8?B?c3FramhoMG4xRXV1elZTV2VEREdwQnJwZmJGangyRk04WVRQNCtCaVdjUTFD?=
 =?utf-8?B?NXhqNGcrWkp5TG8yZm1mS3QvOU1tQU0yMDVrVFQrSGRkSDdFOE16L3ZzVE9s?=
 =?utf-8?B?TWE5Ti9LeTNTTmlQV3BuQTZURFRXdHZmQzhtOVdlNVVTT00vY0xOckl1UXlj?=
 =?utf-8?B?eHRtZjExYlNhVXlzL3RYaHhiSzRhSyt6OEFzNEVZWXh2dmFpL3BVeGxhajJt?=
 =?utf-8?B?ZEdZYWRXN3lDaGs2bC9rZnZNM3dhUlk5cjAzVE9EK1pMNFBTdFJjMW1WZHFT?=
 =?utf-8?B?RUo2dzR2eEtqcTRnNlFKUWJEZ0F0czk2eWhscER1RDY2THRhSjZaZmZJYkhO?=
 =?utf-8?B?VSt1RGsxN0RvOXRkcGF4QUNWRHZiUlo0a29abTAwcThGRWV4OERhTXZNeTEw?=
 =?utf-8?B?ZjU4MzF4d0JlZ2FIWnR1QUhOV3BDcEF4U05BTzFFNjRoQXYrQTJDMVZqckxT?=
 =?utf-8?B?Mnh4YlhWdkFiOVhhSHp3MzRXZUREVk5ZcGphZnlMbjUweHk1aUlqU0ErWE1v?=
 =?utf-8?B?ZGs1MER5QUpoNjFjYlJJd1hZS2F6TldmVzkrUGdLVi9NQkhSZmV1b0JaZlV2?=
 =?utf-8?B?bTdlY0hjSkVRSFVNdHpYS1E1ci9OWWp6cUFCelNPa3NSSE5zcmdRdUE5RzNW?=
 =?utf-8?B?TzBCVTdmSUFvNHRqVkY1UzFqV29qaUxsU0NEVjEyeGIvSVNSVnZVQXFFSjlw?=
 =?utf-8?B?QmpzTjNLTDRkRFg5ZWdzWHJaNnUya2VGcXUwQzZGQWtPL29NNDlOMklCb3c4?=
 =?utf-8?B?YVlOQnNWVHI1em9rbnovSk5FOWJEdFVucXJzZkxNTG5CK0dqOGtEQnAvekt2?=
 =?utf-8?B?L3BiYXpkeGpkV29DT2RYdk1SUTY1S1AxV2hjSjdURm5BblJvelBwd3hJdUFl?=
 =?utf-8?B?VEJKQmVEMUdPVnRkbVBZdTlvbXNZeXdWY0ZsYitvN2UyS29jVWwvTUJIaWti?=
 =?utf-8?B?MGlvNkloVkhRMnRtL3poL253MkNWSm1kTURkMkxmQnREYlQxNGxiNFFGRnhF?=
 =?utf-8?B?QTFWeGxqNUNpNlFLRmlTOXpZakc0eWE5b0NjMWFkWWFpWkZ0N2l6VTdoMUQx?=
 =?utf-8?B?VnVPc1ZXTWVZQzJ6UFFzRGdiOUgxQllYOHZpTTh5bWQ5S2RIcmdrdmY5cGxp?=
 =?utf-8?B?ek1IanBlQnFBbldqUFNzaXp6K3ZGaWJ3U3NDNHVRQVpaT0dSN1NMQ1hrSjh0?=
 =?utf-8?B?TXJnN2RyY3JCSVdnYndzU3NpMHI5N0RDM3laZXdaMFU4c2tCYVpLWUZUd2hF?=
 =?utf-8?B?dzJMdGhsUGNlaFVVU2pEMmdGb0FjMEIrVmE5TFVhSUpQaTZhZkphdDdHYzdv?=
 =?utf-8?B?WGtsWEpVbkQ4eUloWUNKN2xlMG5XVWlTcWdwTEtFQnErcFlRUHk1YmhkdWFn?=
 =?utf-8?B?NlNQd3Nkb3BOc0xiQmZnN1hiaHZ4V0p3ckFLVVdaYU5PVHlWbThyS2hyR3h0?=
 =?utf-8?B?SzlnWFVCNkhVT3hGWmVwQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGYzTVV3MGhoQkt2YjFueUgyd0k1WURqc1RxQ2RNUW5qaEFUVWFlK2hGa0pY?=
 =?utf-8?B?SCtXWWwvWldDVXB3cjJ0VG5FZytXNUdVK0ZtVHFSdjVtR0lucG0wYW5IZlpJ?=
 =?utf-8?B?MTNKdkxuYzJPcTNqYk5aRDRWR2U4T1RwUmJHaUZMdzNCN1ZsaUtZK294eDVZ?=
 =?utf-8?B?dG8ydmZGVDJweWE4d0JFNzdXN2lrS1daSEc5R25nRnVJUVNoRklXWWNkMUow?=
 =?utf-8?B?ZW9FOExDQVBIcmx0c3ZoZHR0Y1F3T1I3WVEyZjJEaVRxZzFLK3RtVkZjd0hB?=
 =?utf-8?B?MVBPUFFsM3FYWitVOHFiRkNIVTgyN1Mwd1ZOMUJHZisxZCs4c25SUHpNWC9s?=
 =?utf-8?B?a0YzRkEyYUdkbHFFNG0rUlpIR2U1Ni9FZzYvVURRVnRRTTJBbmJBVDU0dDdq?=
 =?utf-8?B?T3FNTU9MMzBHNUpjbDZ5ckxydWJNb05ucUJuNWc4Wkt6T1VpTXhTZ3grSmhw?=
 =?utf-8?B?YVdBYUIxcTl4amRrQnZwVjBSRlcwVWhWS0k0RHJHMUJDbnptN0V0cGdQTXFK?=
 =?utf-8?B?eVNBcnVTU3pLd1VCbjUya0g0OWd0bXhGSm1LNHJDTkNzWmhqdkNoamdCakt4?=
 =?utf-8?B?RWhlSVB5VFcvS1ZpK2dJRjlmVjA3anFUMjM4Wkd5QWE3U3hBd2ExZ1JRSTZZ?=
 =?utf-8?B?YXJSdDVzeTQzZUN2UXF0b0xHaWgyMVJxeSt0ODRjSjJrd2dTcTBOMklwZGtU?=
 =?utf-8?B?ODU4WHdwL3JYRHdMUnBtNFBsUkE5b0FUMk11ZHlVTlBOMkE4c0VxZ0dDMEpy?=
 =?utf-8?B?SmdPamZveVBrSFh3TXNrS0FxT2szR0ZsdkRycmk3S1JZaWVjTlV3QWxxVXBV?=
 =?utf-8?B?Sy9SUkhHdFRyQUh6aENOYlNYUjgra045b2gxWHgwSGhoTVJBclAyNWZZR1hD?=
 =?utf-8?B?eEVVeGRqT3J4Vkcvc3dmeTBhV1c5Vk5tNEhaUjBNZWdnRGs5MElKdllVTzJ6?=
 =?utf-8?B?R1JCS1ZhMjh6SWw5YlNjeFNHYzJBQ29uRngwa0NwNll1REhyZTZibGxxQnFO?=
 =?utf-8?B?bEJyN0FSVmZoUXRjTlV6TExYRUtldmcvcFpHeWpwMGpYSWI3aElTU0dyNmNY?=
 =?utf-8?B?N25aMk9RZXBqeVZQcjNxV0dZMkxHakpnejYvc3M5dnlJdjVNcG9kWE1QNitE?=
 =?utf-8?B?S1YrcHpDMy9obzdzcC9GVkFTMDE4dmkzcUszeTBFWXkrcUxIaU9BNUdrc05R?=
 =?utf-8?B?dGl4Uzg3T1pQbWtxQWphV05DUHlBT1h1Z1pBSnpNNkdKZlBTT1lDN056YmpR?=
 =?utf-8?B?a0NtTW5DaXlaUWNoWHY5ZklVTnBrMSt2Y3Fmc2FXUzE0VTFjbTN1a1NJM2Mw?=
 =?utf-8?B?aTVTSWttbWlLSkRrYjlQZytCRTQxMElqN2tZbW9PekJlVXlmb2VkbzRXZEtp?=
 =?utf-8?B?dHJGcTc0Ry8xT0dHY2tOMmp3VzVHTm5MUlg3RlRJZUd6WHkyQUZQU3hqRmhD?=
 =?utf-8?B?VFNEZ3lKVXdGbnlDWTloakJOSTJVTmpsZFY5aTF4SlIxYXlNcmZxREJvVENI?=
 =?utf-8?B?THlaQUlDT2xObHNNTjZHYitTN0xvRWowbDMyN0VzV2pDeVk5WDFCdVZsSnRx?=
 =?utf-8?B?cktiZVNtdy9hb1pCK052bVJlZVhRM2ZMNmJCM010WkdudWRESVFjRm1vbHFv?=
 =?utf-8?B?MS9YSk1mNlZzYlRzOVJyMHlJOHRvOEdCWDhSeld5VG1JTk9kMEVjUE45bEVI?=
 =?utf-8?B?dzRoa0I1RUZXcUxXT3QvTGIxU0RQY2tpQmxUcy9jYnY4ZEhHVCtmMTFCazFH?=
 =?utf-8?B?c3l1U1dFWTlzSjJpczFTbnB6WXZ1TUhpbkg2TWJ4em9wU056UkFEdC9qWU51?=
 =?utf-8?B?cFlNK0t5ai9kaVI4aWkzRHV6KzlKWlpta0lRMjVtYkI5MHRVOEdWRnZnTmpI?=
 =?utf-8?B?dlBSMUxKRHpJQzZPQ0p6Z1BxT3JueU1rTzluelBHVUNMKzllZk5uNDFpUEpB?=
 =?utf-8?B?T0Rxc1Bzd1ZaUjFzY0t0czg1TmRadDFXNHNBME03Mi93UFgrZlUwcGQ1a2dF?=
 =?utf-8?B?UkpRQi9uWkdRTHEvdXQrcklrNUhQYkRMWmZabkkxaTVUYUUzYXhJczJ4R2dx?=
 =?utf-8?B?dmxMT05aRHlKNDJIL1ZKZ2x2OGNiNWhGT1NlazJyeVp6UVJQeDNid1dhMjFk?=
 =?utf-8?B?OThOL1QzK1RjNjlSRlB4bjl6Q2d5M1dLTi9yZDN6MHRSektRSEJIT1oyeXU5?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff30b12-a769-4a2d-0609-08dd19d2e071
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 10:59:25.9200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fx1pDkULvi/sdxRihvl6gxyrwIA4Khvgi6fdeUjN70jbfXpD+VSQh46UNrHPLyhsyhDrSQ/amvSNv+QAGT40o3FJzWFrbFHoMoR3kbN280=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6864
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


On 12/9/2024 5:16 PM, Swati Sharma wrote:
> Subtests are added to verify casf with dpms and suspend.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_sharpness_filter.c | 52 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
>
> diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
> index f91c444f7..92c816480 100644
> --- a/tests/kms_sharpness_filter.c
> +++ b/tests/kms_sharpness_filter.c
> @@ -40,6 +40,14 @@
>    *
>    * SUBTEST: filter-tap
>    * Description: Verify that following a resolution change, distinct taps are selected.
> + *
> + * SUBTEST: filter-dpms
> + * Description: Verify content adaptive sharpness filter with DPMS.
> + * Functionality: casf, dpms
> + *
> + * SUBTEST: filter-suspend
> + * Description: Verify content adaptive sharpness filter with suspend.
> + * Functionality: casf, suspend
>   */
>   
>   IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
> @@ -69,6 +77,8 @@ enum test_type {
>   	TEST_FILTER_STRENGTH,
>   	TEST_FILTER_TOGGLE,
>   	TEST_FILTER_TAP,
> +	TEST_FILTER_DPMS,
> +	TEST_FILTER_SUSPEND,
>   };
>   
>   const int filter_strength_list[] = {
> @@ -210,6 +220,7 @@ static int test_filter_toggle(data_t *data)
>   
>   static void test_sharpness_filter(data_t *data,  enum test_type type)
>   {
> +	igt_output_t *output = data->output;
>   	drmModeModeInfo *mode = data->mode;
>   	int height = mode->hdisplay;
>   	int width =  mode->vdisplay;
> @@ -234,6 +245,19 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>   
>   	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>   
> +	if (type == TEST_FILTER_DPMS) {
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   output->config.connector,
> +					   DRM_MODE_DPMS_OFF);
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   output->config.connector,
> +					   DRM_MODE_DPMS_ON);
> +	}
> +
> +	if (type == TEST_FILTER_SUSPEND)
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +					      SUSPEND_TEST_NONE);


I think for suspend/resume and dpms on/off better thing would be to 
compare sharpness before and after the action.

We can perhaps use CRC before going into suspend and match it with CRC 
after suspend.

Regards,

Ankit


> +
>   	if (type == TEST_FILTER_TOGGLE)
>   		ret |= test_filter_toggle(data);
>   
> @@ -324,6 +348,12 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   			case TEST_FILTER_TOGGLE:
>   				snprintf(name, sizeof(name), "-toggle");
>   				break;
> +			case TEST_FILTER_DPMS:
> +				snprintf(name, sizeof(name), "-dpms");
> +				break;
> +			case TEST_FILTER_SUSPEND:
> +				snprintf(name, sizeof(name), "-suspend");
> +				break;
>   			default:
>   				igt_assert(0);
>   			}
> @@ -458,6 +488,28 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		run_sharpness_filter_test(&data, TEST_FILTER_TAP);
>   	}
>   
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with DPMS.");
> +	igt_subtest_with_dynamic("filter-dpms") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with suspend.");
> +	igt_subtest_with_dynamic("filter-suspend") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
