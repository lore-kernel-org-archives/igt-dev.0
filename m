Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1BDD78788
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 16:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF87510E9CC;
	Thu, 21 Nov 2024 16:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hb89smFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CBE10E9CC
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732205898; x=1763741898;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VjB3tA/qZbOK+j+ceH4P6UP/2fKZVk1hjGs7tBgOKd0=;
 b=Hb89smFDJMOI0tBFeA0vU5X2ruln6gY7zumpwW/DPOnuXhAnZReeSWEL
 unP4T75MxIqLM1/ocf0ujWjXeUN7jpOuPTbp3Oa4B2g7vZettQRgz0xqa
 y+/kvnUfzkKZyaOKMDfLp/oKLpteGPtNrrWlqa+k4cK8mLZiIRiJxBAL8
 AL83IiswnAxfB8aNtw1gNzUCE0JniXZ0gb0JAx02ja1UNC8AiwG9GG6iC
 UZf6vmWloKccLso9CeECSrk6QwkZE3RDDUYbJFZwhxWKr5f5e/9eIoQUj
 BtdzPqKfPxsl+csj5cKy/Uk/i04a+wFLQIBMctVyQhnwTCJngui3TEHCk w==;
X-CSE-ConnectionGUID: hNv3HRynQMu+jZznbs6djw==
X-CSE-MsgGUID: voteS4NATImuU4Z9tSXhAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32184282"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32184282"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 08:17:23 -0800
X-CSE-ConnectionGUID: 05Nm4eWBS7uMcJ3ijiB4dA==
X-CSE-MsgGUID: 7kRyjZ/dQMqbzW1ka/+M1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="94742477"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 08:17:22 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 08:17:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 08:17:20 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 08:17:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhNLP1v/SoBDEVYWETtm+p1fGGZtGhyTjPLWiyeSr8qJsCFjwiedVd6ol7n3Zw9IBxcMrnAbPGPnRsTuUCRvmEPenCUkLPsKyrEGJnVOX06U4ZIj6iNTj83ohxxywm+E0l4qRa9scwIhzaJPovXeeECTHGYv1n1CNOkuxnuexBx1gxWJAnaGN7bhOktEwH6wubTjhA1UWbF5KxNtfRKEHwiMr9kj5rSIrN09hibestxiBgkwRl8faQG8XtxIChlTrtkTzl7MXed3JXkYZtfI7twRfXLDJjC/kWi3uvvpJJM7AoAfVux73l1DT+8XoAXnikL3VRdyUL0471a4pmDzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45nDcHswACnJYHyFQEHLpJ9/nSS+3Oe8bH4Ywb0073U=;
 b=X+rT7fVh8/CTzS6pmikxGWcw8OxvXPOQNq9MqVizaifjptJx7NaPfZiSfVciGsYrbEL1nX+qkQydIPiDt4qITq8ldx1HMItRMrJWXiL1vbsKsautEFWGC+ZywsnBJLRSzUqYwOvPMCd09lnWL1FIR9BOSDxQYIgGkRC7dG8sc5tSvGgPkSAD6DbC2odR6mtuX69ma2m/lux0lv81WtlamkftWg9fcSUSD3GLVB9TW4YbcRV/nUzVcxN7efYp3Of9dQinX3bwb644R7WphoDAJvKJVfJpi7YwxXHL8rD30ecs0zhOXQmX8FRBlBmu8oozCKjxJpJjmxtToz8he1j/HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 16:17:08 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%3]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 16:17:08 +0000
Message-ID: <d008dc44-b2ff-4e8e-b1e4-49ad731615ae@intel.com>
Date: Thu, 21 Nov 2024 17:17:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/4] tests/intel/xe_eudebug_online: Add
 read/write pagefault online tests
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <christoph.manszewski@intel.com>, <jonathan.cavitt@intel.com>,
 <mika.kuoppala@intel.com>, <dominik.grzegorzek@intel.com>
References: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
 <20241121122230.451423-5-gwan-gyeong.mun@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241121122230.451423-5-gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0041.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::10) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|IA1PR11MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec04eee-5306-4ac3-96ea-08dd0a47f227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFJ2d1d5RCtPNlhBb1lrdXNqSTR1OEprdjVlQzhlRzh3enk3TVJ3VFJhaTI1?=
 =?utf-8?B?SjJjaEU3TGpraFJ0d3J4K09MVVNEcU1UYTRDeEhEeFpHU0k1UjlSV1pOMzRY?=
 =?utf-8?B?dTVReURCRDB0OVg5RnJGelZvYkJ5SVNNT1ViSW9WdUhrRUt0RXNWS2w0WTdi?=
 =?utf-8?B?dkp6TUZHRTg2b1lqNG9rc0FYRkhPRzZCWHNtSi9HcGE3QlJITFNyV01TMU5q?=
 =?utf-8?B?ZWE4OFduaVpXSlhGR01Fdzh2U0pkUXdWWU03dXBmTXM1TGdlbXBMMlJSd2Zm?=
 =?utf-8?B?QUR1MXpTUXVJWElXYWRORVpYcGtQdE9OMlhqTDVIZG4zYUVOYU5Hem1OR0sv?=
 =?utf-8?B?dnl5b01sa2d5MFJmTWxwWk92cVJBYVBFai9CaUhZcTkxSlFhV25nZS96azJG?=
 =?utf-8?B?OFJucjJ2dDBFYnZHcVR4eTFTclpTZ1JQQjhCWHI4TUp4MlpuZkhUSWxwVjZy?=
 =?utf-8?B?N21xQnFheURGSVNxeXhmd0xhYkFVM3hsVUNucjVVRnBrV3BiVndLa3hscDVZ?=
 =?utf-8?B?Q0dDRlpoeTI3dFM3VktudlkxRHJybWZOd21CN0JkZE5VcTdabEY3Yzg2TGMx?=
 =?utf-8?B?RjVWRHFSL0hzMDJZckwwN3Z2eDdRa1o4aEhseHRXVE5SR3psZk9GYnIyMXRq?=
 =?utf-8?B?NURVTDJxZDRHZ3YvWmNMV1FidU0zbkhXMjVZbjJERjFEKy8yaFRQTlkxcUJO?=
 =?utf-8?B?S1UyY3lzRDA0eG44dlZ0UTJEbU5vTmZELzBpdHNvYk0za2dDTkI4c29sUzFh?=
 =?utf-8?B?MmFrR1hkcitQU21VMHZOdW1IVXdmc05WY3Z4VVJ0ZC81b1FsQkFBNkJialhv?=
 =?utf-8?B?VDBPTzRqNnhqY3VMc2pCS04xVDJXMDdFc2pxUHdkaEdoU0htVXdiVURCRWpj?=
 =?utf-8?B?NTRYa1NPUFJFaXdYa1pRSkRySU56akFEMExFSVhBeWU4cDNKOFkxVjJVM2JD?=
 =?utf-8?B?UWJQNlQ0NmtNdmNxWHVOby9ZS3I3SEYxTStEblhTNTZpUjFVdkNaN1dkakdX?=
 =?utf-8?B?R2pBSDFLUFJjMjEyWlFLSFpjR1M0R3kxcWlhRzdlbjFWZ3VON0duWmdsakd5?=
 =?utf-8?B?Y3BOU2I2bUd0d2VuTm80bTVmeHNBUUhPYzdtdTFxeld4MXB1YVpHUGpRMnJE?=
 =?utf-8?B?WmV5Q0tVSzZGODZINVhZOGxxM25XZ2VzQ09kcCtsL1BWY3ZleXdnSDY3c1FV?=
 =?utf-8?B?R2wrRGFDbTFldnJ4azZzQjFpbUR3T1lKbWJJRGtRU2d3NDVQVXFBU2xHWkEw?=
 =?utf-8?B?SkhPdkNqSnNyZnlVTFdLQ0NhWVJoRGR1bzVMWjI1WVRzTmR5K0VBdlBibExV?=
 =?utf-8?B?V0NXOExjSldDcm5UVHBIb0JvUlFyMmFPbWZPYmpFYWJmN1ArNGxnUnRIYVN2?=
 =?utf-8?B?VjhScWdzbWdvYVBVdFFjZUMvNkNZUEF4ZTFtSDFQMHg2SDd1WUdva3Mvek5i?=
 =?utf-8?B?WFkwZld3VWd6OXFnZysxVGI3clVndGJqU2M4Y1dPREwvaHZ3RlpBeDRpSVNT?=
 =?utf-8?B?VkpvcVhxSUUzUmo0ZHhxQzk0S3R1dCtyZlZocURoa1BDL0k2TjdJUExKVE5m?=
 =?utf-8?B?bG82SFJ6RVRNVDNCZ29xNGE3YnYyajgwSkNXQXBYcE5qTWFOWTFxbFZJekNU?=
 =?utf-8?B?bjNaQ1RvVmMwc2pvdlVHeUpJN252T2dTNzI2N0tQUnNSc1RkZjhnUlYrajhU?=
 =?utf-8?B?cEdwZFo3TDhNd2s2dHFhSld6RGVyQUs1Y3VheVFrUGtNaUxTUkkzRU1pMDFI?=
 =?utf-8?Q?IUJSNdpkLabSr3h+c8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUh6R0E2b1IyRnJWY2ZvUjQreXBieGx5bVNPNmtDM3ZaenJWUjc2MllIYUVx?=
 =?utf-8?B?NVh6VlZrWmgwQzdha05kc0Z1WGVtb0NMU21wSC9Ic08wR3l4cENXd2I1QmdZ?=
 =?utf-8?B?eGFSZ0x6MFBPWnZvZ2wwd2E1TG4vdFROV3NEWXBvTFVVOHFVY2tiMEsvZFpI?=
 =?utf-8?B?VFQ4bFN1WlJzemlJRmVyU04yMmFGbnVmUHNPNDgyMWJLT1l5dHZQU0l2K04w?=
 =?utf-8?B?ZStxcmVDeTIrc0pKN2dRc0pReUlVc0gyR0h1UDdXWDhBMWpSVCtLbXhVM2RG?=
 =?utf-8?B?eU1zdzAxbTBlM1ZOc1RTTTlWWm9rdVY0V1VSZ3NFazgxVjBnK2haaW82bWZL?=
 =?utf-8?B?RjlrdE41bUs4NytMN0NTS0tRazBXQjQySWp1SjRMV2UvTFNUaDV5dnJGT0JN?=
 =?utf-8?B?S0ZGeGgrdXVjTWc4dFJsTTRWYys0VE9kSWRYVGJpUWNlM2FIRDV4c29BT2M0?=
 =?utf-8?B?RTJ0Z0ZNT1JHOXp1OTlSNndOWWRLZGtpN2lyTFhVdFExNkZUREo0VHAydHcz?=
 =?utf-8?B?RFdmUmFlSjNVVHBmKzFRWWhrU3EvaGlOVHIyRU12T1JKcmRhY0d3czdQSkRE?=
 =?utf-8?B?RUxLSW4vL09OdWcyNFhVd0ExelhpbmhkKzdLWk5sN00wcG15amZVSnNCZzZh?=
 =?utf-8?B?VTVpRGVCeTBHaEVJbkJINWYxdEVXR29idWpKVkdsRnl6anBYNVVKaFdxNEtJ?=
 =?utf-8?B?dkI4T09SblI0RUdnVGxpOVdzalprTHZxaFpyak05YlQ1bUxlVWk2TkhuOWEz?=
 =?utf-8?B?N041T0dwVkN0VnZjWC9oR0NnNzZvRlk3dkt5M3BOSkJucTZZQVlXK0lrbVRm?=
 =?utf-8?B?S3F3QXB0UHlBblZ3Qm5BM3I3aUZmSnVjRFJaazJXY1NUY3VFVGl0NmxIdG5J?=
 =?utf-8?B?NVdHazdKSmRqRkhRNnVNbGUzMU9YaUJGeXIwUDkzYmV1NUJSV3M0UHdLTEpo?=
 =?utf-8?B?RGtYU2pYTGxJcWxFQ0YvQ0xWVHJoOExYaWw2VnNPbE1jeVU2UUZGK0x6VTJS?=
 =?utf-8?B?VTlSSjhXODU2K2VjZDFlaHpPanFHRVAweXJaeFhGRytxdHhLQVdONWhaek12?=
 =?utf-8?B?ajZNMTExNFNNM2NIc000VEp6T0IyNWpiZmtGR2d1VXRjcHVMMUxTemhCWnVw?=
 =?utf-8?B?bmNIVzBKd1UyYlB0NWxWbWVvc056N3lxTHZNMnBvRkxMb3RDTUdYZ2Q1U2p1?=
 =?utf-8?B?K0k2VEsvcWNiS1JqZExpWnZYRVZscU1CVDI0MWU2ZTNpSHdDWFVuc1RvaStY?=
 =?utf-8?B?emduUUhYMGNmQkRqSkk2WDgyaWdWUFRUUUIrc2hCOTZybUVlWlVseHZIZ21u?=
 =?utf-8?B?Z3h5dm1QY3JZTmxINXFWTUszNmI5RnF0RzBmWmhUNWJTYWZ4cmFuN3FkcUcr?=
 =?utf-8?B?elZod1RiaW5QczZSQ1RlaVZsZitkektCR1owelVUeXhqYVc2Kzk4S1c2V3hi?=
 =?utf-8?B?cXE4V3kxcE5ScCtlZFU1VFYwdmhUNkNVU0xUL21BeVVaSkJSRnA3Vm1nK251?=
 =?utf-8?B?SnUxS3NRYVFZVjVqcmJRUEk3c2tUYWtoZ2FyK0hWdm1KZGxFNzhRM1I3clZU?=
 =?utf-8?B?YXE5TStienZaRW9jWDlKaXZEN2s3UXorYVJwWDNyTnFQQWxpNk1zRzlwN1FW?=
 =?utf-8?B?K1J5Skd4VnppbUZicE96djdSakN1RUNxSTBucytPeHBsNnU5b2JMemQzM24w?=
 =?utf-8?B?WGxBYjF3cUczcUlqZzVZcklhRXhjTnA1QThiSzYwVzR6eHZaQXArWDY1RlhQ?=
 =?utf-8?B?RVJxV29PeUlObWRqNkZrTjg2cldCaFdHcDk1WE1uN0RwS2prOFNNSWVzb2VQ?=
 =?utf-8?B?WUw1bWZDUGxzcURWQjA1LzYxWkZZNU9wc1E3NHVpMmY0ak1TcHJhVnhMU1JP?=
 =?utf-8?B?MmV3MmwvK2NhajkzN3NnUFNMV3BSODcxcHhlUTdPMGVoV3VmcHUzUjFyb2h4?=
 =?utf-8?B?VEZ4S2hDUTNBbWVJSzJqS1V6aEVORm8rb24vK0Yyd2huVTRZZTBDZldKeFli?=
 =?utf-8?B?QThLTzFFYk44SUtsSWJtM3JXSFhQMGhyWGprT0czMGlZQk9ITjQ5dUVDd3Vi?=
 =?utf-8?B?eTliamlqeDRINTA1SHpkeFJIR256R2lrYk5hQWVvNnFLMWphdWoxNExrVlNi?=
 =?utf-8?B?RVB4WElWSVZZUFo2U3FqQ2hxa0xDUzNtT3RENmFPUDdwelc4a3JZSHRjODRv?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec04eee-5306-4ac3-96ea-08dd0a47f227
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 16:17:08.0566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5SxV7n+UTKXYux3TG3hLkPxUpMZ7yxWp4vOPsvU2Xn3LSm91omqLRpR60D7XKeFB7jBiIs29i9irujZ0A9GsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
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


W dniu 21.11.2024 o 13:22, Gwan-gyeong Mun pisze:
> Add read and write pagefault tests to xe_eudebug_online that checks if a
> pagefault event is submitted by the KMD debugger when a pagefault occurs.
>
> Test that read (load instruction) and write(store instruction) attempt to
> load or store access to unallocated memory, causing a pagefault.
> Examine the address causing the page fault and the number of eu threads
> causing the pagefault.
>
> v2: Refactor of output attention bits on pagefault event handling (Andrzej)
>      remove / update redudant code (Andrzej, Christoph)
>      use igt_container_of() macro (Christoph)
>
> Co-developed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   tests/intel/xe_eudebug_online.c | 178 +++++++++++++++++++++++++++++++-
>   1 file changed, 173 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 0ef0d8093..a70d18ee4 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -36,6 +36,8 @@
>   #define BB_IN_VRAM			(1 << 11)
>   #define TARGET_IN_SRAM			(1 << 12)
>   #define TARGET_IN_VRAM			(1 << 13)
> +#define SHADER_PAGEFAULT_READ		(1 << 14)
> +#define SHADER_PAGEFAULT_WRITE		(1 << 15)
>   #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
>   #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
>   #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
> @@ -45,6 +47,7 @@
>   #define TRIGGER_RESUME_DSS		(1 << 30)
>   #define TRIGGER_RESUME_ONE		(1 << 31)
>   
> +#define SHADER_PAGEFAULT	(SHADER_PAGEFAULT_READ | SHADER_PAGEFAULT_WRITE)
>   #define BB_REGION_BITMASK	(BB_IN_SRAM | BB_IN_VRAM)
>   #define TARGET_REGION_BITMASK	(TARGET_IN_SRAM | TARGET_IN_VRAM)
>   
> @@ -61,6 +64,8 @@
>   #define CACHING_VALUE(n)	(CACHING_INIT_VALUE + (n))
>   
>   #define SHADER_CANARY 0x01010101
> +#define BAD_CANARY 0xf1f1f1f
> +#define BAD_OFFSET (0x12345678ull << 12)
>   
>   #define WALKER_X_DIM		4
>   #define WALKER_ALIGNMENT	16
> @@ -120,7 +125,7 @@ static struct intel_buf *create_uc_buf(int fd, int width, int height, uint64_t r
>   
>   static int get_number_of_threads(uint64_t flags)
>   {
> -	if (flags & SHADER_MIN_THREADS)
> +	if (flags & (SHADER_MIN_THREADS | SHADER_PAGEFAULT))
>   		return 16;
>   
>   	if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
> @@ -179,6 +184,16 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
>   			gpgpu_shader__common_target_write_u32(shader, s_dim.y + i, CACHING_VALUE(i));
>   		gpgpu_shader__nop(shader);
>   		gpgpu_shader__breakpoint(shader);
> +	} else if (flags & SHADER_PAGEFAULT) {
> +		if (flags & SHADER_PAGEFAULT_READ)
> +			gpgpu_shader__read_a64_dword(shader, BAD_OFFSET);
> +		else
> +			gpgpu_shader__write_a64_dword(shader, BAD_OFFSET, BAD_CANARY);
> +
> +		gpgpu_shader__label(shader, 0);
> +		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
> +		gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
> +		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>   	}
>   
>   	gpgpu_shader__eot(shader);
> @@ -217,6 +232,16 @@ static int count_set_bits(void *ptr, size_t size)
>   	return count;
>   }
>   
> +static int eu_attentions_xor_count(const uint32_t *a, const uint32_t *b, uint32_t size)
> +{
> +	int count = 0;
> +
> +	for (int i = 0; i < size / 4 ; i++)
> +		count += igt_hweight(a[i] ^ b[i]);
> +
> +	return count;
> +}
> +
>   static int count_canaries_eq(uint32_t *ptr, struct dim_t w_dim, uint32_t value)
>   {
>   	int count = 0;
> @@ -636,7 +661,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
>   		}
>   	}
>   
> -	if (d->flags & SHADER_LOOP) {
> +	if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
>   		uint32_t threads = get_number_of_threads(d->flags);
>   		uint32_t val = STEERING_END_LOOP;
>   
> @@ -746,6 +771,44 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>   			data->single_step_bitmask[i] &= ~att->bitmask[i];
>   }
>   
> +static void eu_attention_resume_pagefault_trigger(struct xe_eudebug_debugger *d,
> +						  struct drm_xe_eudebug_event *e)
> +{
> +	struct drm_xe_eudebug_event_eu_attention *att = igt_container_of(e, att, base);
> +	struct online_debug_data *data = d->ptr;
> +	uint32_t bitmask_size = att->bitmask_size;
> +	uint8_t *bitmask;
> +
> +	if (data->last_eu_control_seqno > att->base.seqno)
> +		return;
> +
> +	bitmask = calloc(1, att->bitmask_size);
> +	igt_assert(bitmask);
> +
> +	eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
> +		       att->lrc_handle, bitmask, &bitmask_size);
> +	igt_assert(bitmask_size == att->bitmask_size);
> +
> +	pthread_mutex_lock(&data->mutex);
> +
> +	if (d->flags & SHADER_PAGEFAULT) {
> +		uint32_t threads = get_number_of_threads(d->flags);
> +		uint32_t val = STEERING_END_LOOP;
> +
> +		igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
> +				     data->target_offset + steering_offset(threads)),
> +			      sizeof(uint32_t));
> +		fsync(data->vm_fd);
> +	}
> +	pthread_mutex_unlock(&data->mutex);
> +
> +	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
> +						    att->exec_queue_handle, att->lrc_handle,
> +						    bitmask, att->bitmask_size);
> +
> +	free(bitmask);
> +}
> +
>   static void open_trigger(struct xe_eudebug_debugger *d,
>   			 struct drm_xe_eudebug_event *e)
>   {
> @@ -1015,7 +1078,7 @@ static void run_online_client(struct xe_eudebug_client *c)
>   	struct intel_bb *ibb;
>   	struct intel_buf *buf;
>   	uint32_t *ptr;
> -	int fd;
> +	int fd, vm_flags;
>   
>   	metadata[0] = calloc(2, sizeof(*metadata));
>   	metadata[1] = calloc(2, sizeof(*metadata));
> @@ -1025,7 +1088,7 @@ static void run_online_client(struct xe_eudebug_client *c)
>   	fd = xe_eudebug_client_open_driver(c);
>   
>   	/* Additional memory for steering control */
> -	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP)
> +	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c->flags & SHADER_PAGEFAULT)
>   		s_dim.y++;
>   	/* Additional memory for caching check */
>   	if ((c->flags & SHADER_CACHING_SRAM) || (c->flags & SHADER_CACHING_VRAM))
> @@ -1045,7 +1108,11 @@ static void run_online_client(struct xe_eudebug_client *c)
>   							   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
>   							   2 * sizeof(*metadata), metadata[1]);
>   
> -	create.vm_id = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
> +	vm_flags |= c->flags & SHADER_PAGEFAULT ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
> +
> +	create.vm_id = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
> +
>   	xe_eudebug_client_exec_queue_create(c, fd, &create);
>   
>   	ibb = xe_bb_create_on_offset(fd, create.exec_queue_id, create.vm_id, bb_offset, bb_size,
> @@ -1245,11 +1312,13 @@ match_attention_with_exec_queue(struct xe_eudebug_event_log *log,
>   static void online_session_check(struct xe_eudebug_session *s, int flags)
>   {
>   	struct drm_xe_eudebug_event_eu_attention *ea = NULL;
> +	struct drm_xe_eudebug_event_pagefault *pf = NULL;
>   	struct drm_xe_eudebug_event *event = NULL;
>   	struct online_debug_data *data = s->client->ptr;
>   	bool expect_exception = flags & DISABLE_DEBUG_MODE ? false : true;
>   	int sum = 0;
>   	int bitmask_size;
> +	int pagefault_threads = 0;
>   
>   	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
>   					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
> @@ -1265,6 +1334,17 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
>   			igt_assert_eq(ea->bitmask_size, bitmask_size);
>   			sum += count_set_bits(ea->bitmask, bitmask_size);
>   			igt_assert(match_attention_with_exec_queue(s->debugger->log, ea));
> +		} else if (event->type == DRM_XE_EUDEBUG_EVENT_PAGEFAULT) {
> +			uint32_t after_offset = bitmask_size / sizeof(uint32_t);
> +			uint32_t resolved_offset = bitmask_size / sizeof(uint32_t) * 2;
> +			uint32_t *ptr = NULL;
> +
> +			pf = igt_container_of(event, pf, base);
> +			ptr = (uint32_t *) pf->bitmask;
> +			igt_assert_eq(pf->bitmask_size, bitmask_size * 3);
> +			pagefault_threads += eu_attentions_xor_count(ptr + after_offset,
> +								     ptr + resolved_offset,
> +								     bitmask_size);
>   		}
>   	}
>   
> @@ -1279,6 +1359,9 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
>   		igt_assert(sum > 0);
>   	else
>   		igt_assert(sum == 0);
> +
> +	if (flags & SHADER_PAGEFAULT)
> +		igt_assert(pagefault_threads > 0);
>   }
>   
>   static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
> @@ -1302,6 +1385,43 @@ static void ufence_ack_set_bp_trigger(struct xe_eudebug_debugger *d,
>   	}
>   }
>   
> +static void pagefault_trigger(struct xe_eudebug_debugger *d,
> +			      struct drm_xe_eudebug_event *e)
> +{
> +	struct drm_xe_eudebug_event_pagefault *pf = igt_container_of(e, pf, base);
> +	uint32_t attn_size = pf->bitmask_size / 3;
> +	int attn_size_as_u32 = attn_size / sizeof(uint32_t);
> +	uint32_t *ptr = (uint32_t *) pf->bitmask;
> +	uint32_t *ptrs[3] = {ptr, ptr + attn_size_as_u32, ptr + 2 * attn_size_as_u32};
> +	const char * const name[3] = {"before", "after", "resolved"};
> +	int threads[3], pagefault_threads, idx;
> +
> +	for (idx = 0; idx < 3; idx++)
> +		threads[idx] = count_set_bits(ptrs[idx], attn_size);
> +
> +	pagefault_threads = eu_attentions_xor_count(ptrs[1], ptrs[2], attn_size);
> +
> +	igt_debug("EVENT[%llu] pagefault; threads[before=%d, after=%d, "
> +		  "resolved=%d, pagefault=%d] "
> +		  "client[%llu], exec_queue[%llu], lrc[%llu], bitmask_size[%d], "
> +		  "pagefault_address[0x%llx]\n",
> +		  pf->base.seqno, threads[0], threads[1], threads[2],
> +		  pagefault_threads, pf->client_handle, pf->exec_queue_handle,
> +		  pf->lrc_handle, pf->bitmask_size,
> +		  pf->pagefault_address);
> +
> +	for (idx = 0; idx < 3; idx++) {
> +		igt_debug("=== Attentions %s ===\n", name[idx]);
> +
> +		for (uint32_t i = 0; i < attn_size_as_u32; i += 2)
> +			igt_debug("bitmask[%d] = 0x%08x%08x\n", i / 2,
> +				  ptrs[idx][i], ptrs[idx][i + 1]);
> +	}
> +
> +	igt_assert(pagefault_threads > 0);
> +	igt_assert_eq_u64(pf->pagefault_address, BAD_OFFSET);
> +}
> +
>   /**
>    * SUBTEST: basic-breakpoint
>    * Description:
> @@ -1383,6 +1503,49 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
>   	online_debug_data_destroy(data);
>   }
>   
> +/**
> + * SUBTEST: pagefault-read
> + * Description:
> + *     Check whether KMD sends pagefault event for workload in debug mode that
> + *     triggers a read pagefault.
> + *
> + * SUBTEST: pagefault-write
> + * Description:
> + *     Check whether KMD sends pagefault event for workload in debug mode that
> + *     triggers a write pagefault.
> + */
> +static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *hwe,
> +				  int flags)
> +{
> +	struct xe_eudebug_session *s;
> +	struct online_debug_data *data;
> +
> +	data = online_debug_data_create(hwe);
> +	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
> +
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
> +					open_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
> +					exec_queue_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +					eu_attention_debug_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +					eu_attention_resume_pagefault_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
> +					create_metadata_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
> +					ufence_ack_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
> +					pagefault_trigger);
> +
> +	xe_eudebug_session_run(s);
> +	online_session_check(s, s->flags);
> +
> +	xe_eudebug_session_destroy(s);
> +	online_debug_data_destroy(data);
> +}
> +
>   /**
>    * SUBTEST: preempt-breakpoint
>    * Description:
> @@ -2344,6 +2507,11 @@ igt_main
>   	igt_subtest("breakpoint-many-sessions-tiles")
>   		test_many_sessions_on_tiles(fd, true);
>   
> +	test_gt_render_or_compute("pagefault-read", fd, hwe)
> +		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ);
> +	test_gt_render_or_compute("pagefault-write", fd, hwe)
> +		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
> +
>   	igt_fixture {
>   		xe_eudebug_enable(fd, was_enabled);
>   
