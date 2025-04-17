Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8218DC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 10:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F7710EA93;
	Thu, 17 Apr 2025 10:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H84dgJL+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BF610EA9A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 10:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744884317; x=1776420317;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2BB23C0bQPl5atpcIvYIebhiE0CIz0YDsqPQSSYoA08=;
 b=H84dgJL+4FlopGzffgtGe/GvLCnclxbvWW+TRzunZjcy1yl+JU2Oe18f
 ZBlBfx1LGX745bPvDUcG+DYYl5Zw1Ncz+Vb35hDCIslSCkV8dQzKop5L+
 IVTpPvVZDpmKc74Vgs6vJbHHfjQTnidDcOzqufeKddLzV9Rm3m/0ameVc
 +V5DQlNx9eoBC0ZyrjhFwykuLQ8dQ/hA1r/Qhvb1b2x88BrtrENMMHqzO
 uyZazTC5WQmIuBvQw8dA1crsRle+fELSD746wtP0LjmRrRYo2KR3ONWNw
 CcXu7bm7bpmnUhJdmDF0a2c+JCAQSyoq1kJdWWeQUfH88y8XD+YFia9NH w==;
X-CSE-ConnectionGUID: sDIb4AfuTCS+HtU/gCd/Ag==
X-CSE-MsgGUID: 9ANwojVEQHyvVxttZw1RVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46596221"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46596221"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 03:05:17 -0700
X-CSE-ConnectionGUID: JheaeN0bQ+uAfS53fdH4Jg==
X-CSE-MsgGUID: /GYppGCHRh2htMUyZQV0ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="130704001"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 03:05:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 03:05:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 03:05:16 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 03:05:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLQR4f4t5cNX9IgmALeSxahCzZ6UOhiQUhN/VZyG+rr3Y7Qh7V0g23GIvCOpSELLFtqZ33mI6zXRlf+PI1ptX+TLZ55/Uru9Z39ievgsxrH5uX9Bi0dZ2EDCnUAz6AhGY98Gl8HcgFbxOyFcR03AcmslvYgsuU/V/U/krzEd36NhCWSDdoBur475lkywNYoXBB6B2ZOoeUMTIhJekOIgw4OKdFAmf36R0sxIy5XklM3kQ2S4wfA4KOZ5TiyWO1WgVWp059h1qXJeq1DOs14wgvNF/H43r9CN1HBkr0r4ddcE59zMWuGjaoVR24CRcfw738JiqAFveV3PWC/YDwD8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPSCITrGkhSbi4svRKJ+L3oIT1melFs3LqI1Dofk3V4=;
 b=wZA0+h1B2uhDQzKIDblp08VX0A9H+VR30jJ7XnPD7QNNEYgGfon5zO/rrDCUn7PTPY5J8v+T9sFpaAtJIc2SyGin0vtqsMbXAfI8BpWRS50qqCtdqV1uDmeG1+5Hx8QM9H356SPJAFTZXQITGZbweGLYyNRsLfcL3uL6hwiX6TqRloZ0nA26gdltD6r2LXVeofrNOdV7aG/6APR0UDGuNehtnOdxmLBvwLGk08NL2+l0w4CREIbdRFYCNz5RaRmuJrVAYWsFlPICb9misxFNUSr4VjGPGwjAo5X7YI2xfdVMp3kDRg1n5AcyTR9LeBf3wr0pCXTgJ/2Ht3xb76D2yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ2PR11MB7547.namprd11.prod.outlook.com (2603:10b6:a03:4cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 10:05:12 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%5]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 10:05:11 +0000
Message-ID: <037191f5-999c-4fa9-b64b-4eab87bea452@intel.com>
Date: Thu, 17 Apr 2025 15:35:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] tests/kms_vrr: Bucketize refresh rate tolerance
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ramanaidu.naladala@intel.com>
References: <20250417091514.1794527-1-mitulkumar.ajitkumar.golani@intel.com>
 <20250417091514.1794527-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250417091514.1794527-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::35) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SJ2PR11MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: 56007bf7-6cb2-4824-b297-08dd7d97574c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T05yRlBrUGdOaXIzNWs2NnFwZW04Z3RiUnp0N25lMy9Nb3NibFRyd1BhM2Jq?=
 =?utf-8?B?Wks5L1F1VFl4SWpWU1NzMmZjQ2tlWGk1Mnc3MGZhajRpYjhuSUlGMzBhekx1?=
 =?utf-8?B?eFo2ZUU2MVBUVmw5Sy9LRU93bUp2azk0Mld5d2JzVTB0a1pUb1M3MGVrT3Nn?=
 =?utf-8?B?OVFKdEZTNzcwNXhKcHIvMnNpc3pkZXErcXJhTDgrNFUyb3cxTElKVGNBSlZ0?=
 =?utf-8?B?MW1vNTRlaVNlZDlZOG82bkZJZm5VcEIva04wZk1HN0hFRlFobm0vZHdDbkE0?=
 =?utf-8?B?bEhDc2ZrSHdsNnl4TzhCdWIvQ3NCbENtVHpvR0FQYlFQazVYSGdqenl3aklP?=
 =?utf-8?B?YXJhSlpKeE5vNGtQeS9Jc2FvYTVKRHNQYnJRREZyNmdyeVZRSEx4NUxGdUJT?=
 =?utf-8?B?OEU5Smp2cVB5cUdiQmdTVnZ1aE5Oc1o3SW4rS2d1bXpyNTZkT212c2hZd3pM?=
 =?utf-8?B?cXJEM2ttZkRPMDlnSmtUb1IxSEZqa3hHT1BLMVBTU29PTkRJMEFSdkFVNWQx?=
 =?utf-8?B?U2FlWmRFWERVcDFZSEtEbENlWEYvbHNrbjBYcXNHa0pETjVTM3NHZWJyc1Jh?=
 =?utf-8?B?T0NxbVdjODFvQnBYcDhWMXNUbUdKY25zaGJ2ZHNtNkxVNi8yUGlsNE9BczVh?=
 =?utf-8?B?aGc4OGxONGw0UGVnanB6QUxYN0RyR1p0TXNkMzRoQTY2Si9lNkVhbTAzQmI3?=
 =?utf-8?B?Sks3b0NmYlQwUHRzSzRmaHFCV0FDZWR6N1FkdU51SjhRRVV4SllzVk9oMkNk?=
 =?utf-8?B?Q2wzVW9odXEza3NJRERNeDd0MVBVcWRVa01vYk5melVmQ09Ga094ZkhCSjBs?=
 =?utf-8?B?R29ESnZxZzFicFk1cTBaMU5NbHF1TGwxZ1FOZlpQNjRyOXZwQ0F5ZUs0Slkw?=
 =?utf-8?B?NXE0OTRrNkluVW83dXh2VGVDREp4WjZvN0xSNXF3VDc3NVV6S0NqY1FHc2dD?=
 =?utf-8?B?eDloKzNFRXVESHc1NlpjRnpVNzhhM2E5Y0dsQUUyLzhrR0tCK3BhNnE4LzFW?=
 =?utf-8?B?OWdra0dWcTdPTUdNd1AzeDA3Yi9zTXVxbDJLWHVUajZuYk5tdVFkT1FPTTRJ?=
 =?utf-8?B?UE1HYjlhT3FQL3U0Y3lac0xRS3gxRjAzQWt1ek15cFNYZ3pVaDdVRVhMNDZJ?=
 =?utf-8?B?SVAweVlJYkdtcjFlNjJreUZnenZlQUFXY1A0ajVEMVNrSlprU2pFK1U2Qzgw?=
 =?utf-8?B?TDhvd1BBckIzUFZqVUlOQ3BHWCtqTEdGbkJLakl0NTRxSVVrc2ttbDdiTHJC?=
 =?utf-8?B?cnQyUitDSE1OODAvdU1Sd0tReThWRndEQkVBL0Y1VFJXM1dUMVZQcExTZ0kv?=
 =?utf-8?B?Rm1Bc01OSkYzZlhGY3ZheUtXdUZzNXFkcFFxTVhrK1dSeWdWbUxtN05ZZkJL?=
 =?utf-8?B?TCtsMDF2clBmRW5vT3B4VUNYdDBzOG9uK2F3L1lmM1k3QkQrZHNYeVNUblVw?=
 =?utf-8?B?aHJsMnE4MUN2b3dPeFNPSWVGdHZzcyt0WXNvaGppT2JnVjR6UVNjdkJ6TGJ4?=
 =?utf-8?B?Q3NKbDAzZ0E2UGNpaWhLQU1WNlYzZ2h1aUpLeEJkMUo3TW40U3FxWlBhc3I1?=
 =?utf-8?B?cTBIdk5qc2IvQTNZemJPUDBXY0RFUTl0dTRwd3ppQjZPVWpDMjFuL0w1NUg2?=
 =?utf-8?B?U04ybURLWldrM3IvbitFSlZGbXR2YjljNkFYTFhSNzk3b0hVbVU2NUl2b25p?=
 =?utf-8?B?NjJncy9hVklLV1o1VVZjalhhUjJiL01tTnpLMng1K3ZDWW5TMjNZVVdMVkJw?=
 =?utf-8?B?dGZoSmx3MkM3SURHOG9hREM1cVRpd21WMEVmTFR4MjljeFRvTGt0M1ZNUmhl?=
 =?utf-8?B?R1F1cCtmVmpoZmhCM1BMbHdKamtwekJlNmxha2ZITHFubHZDbS9iRDdHejFH?=
 =?utf-8?B?RC9uNlVpaXN5K2szMUdwamk2bVJyYWpNV0ZjQzRxRU5zWWVaLzdWNjAzc2J0?=
 =?utf-8?Q?vRCT9Jb2fHo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZUZ2RndmhUclJxcUJ1ZkxVaUFoY1pxU1FwRUE5NWRLRjFFVVVQT1lPdCt1?=
 =?utf-8?B?aHlOZzh1WmFJZnRtUWx3dzJXMUhlcGEwZzhpblp4bUdXU04zQW1zaGduWDNi?=
 =?utf-8?B?dW5lMU5jZSt1WHF0Um9qOC9MTm5nekoxK2dQbmlFcVRma3FtUG9qN3dZdnlF?=
 =?utf-8?B?Q2pZT1JXaXBtRHM3eVJrMHlybjJxcEtwb2FyQzhMQ2c5UFZoWTI1SnNUQ0k3?=
 =?utf-8?B?bEdHSExyazJEOTJjRG9GaTk3S2pVS0tuNHN0UjNxdVIvdEVDcktkUmprbThU?=
 =?utf-8?B?ai8vTTNEMGFoV2FaK2k5b0N1RlIwd1ArbCtEODBiS2h2YTQ0RzlEUDRXNWhh?=
 =?utf-8?B?aE5zU1hyekZOMUZIK0VUTXlzQ25ENUhXWnU4bGFwZ3N4ME1YTHYrNUR2TWRV?=
 =?utf-8?B?U05NU2RlSDBmeFZhVmFzNWkyN2o5TzBKYnNKV2VpUXBCaGpTOFIrOFA2Q1hk?=
 =?utf-8?B?VUxXMjZsV0FELzJsWEtPZENLSFkzREM4bTRHZzdjSGpYMmtkY1JTTWZ0ZHJK?=
 =?utf-8?B?RnlFWTJYOTZzOXlmK0d6VTY0QlNSbU5RMHVTQ2FyZFlXZ0NpTS83UC9WeUxs?=
 =?utf-8?B?WUI0TVJJNVBMOGQ0TElQdklWRHZmQ2tEZVhwT1h3eC91SEdWY0kzWm9MdFRq?=
 =?utf-8?B?QVhKRU9IM1prU3dtQjI3VzkveHVDV1F0S25hZEhCNGltU1Z1RkU5WExRMTd0?=
 =?utf-8?B?Vit1bEJCNHBYSURpaW9CYnE4ZFZjRnhQSVEweWlmUnlnU2txU3dKVXZXL2lm?=
 =?utf-8?B?eThpakVnZnZPc1gyY0lFN2o2N3hPK1NZWUFtUGx3QitTOHpROUlZZHl5L3E1?=
 =?utf-8?B?cVVJK3dZL2FudmFMc0ZTOVBONDR1SWVEc1VCMmNtbS92eGx2OEROazJlRVZT?=
 =?utf-8?B?eWEyQ29pTDJXaGNma1BSaVkrS091blBibEp3UFhKc3p3WmRhRDBQYzBLVlhn?=
 =?utf-8?B?dnM0YXNBcWRudzlyK3VJcHFLRmtxb0cwdDJoaHJpQXh0WnZDYmhhanRDd2M2?=
 =?utf-8?B?U05JSW5nTm1VUlFCQjB5bmZnOVZ6aFQ3THFFRTdrd1BWcDFhY1QvL1Axc3kv?=
 =?utf-8?B?ZjhLNVFVTzJ3a2dnL2pYcWNWOXZXSXJFb1lSWmtMdVliOEM3YUFGLzY0T0JZ?=
 =?utf-8?B?SXAxempjZ3Y4cnVCSXJZQ2VqNFUyZHo5YVhuVG5ZS1E5SVVJMFBwaFhYUHlR?=
 =?utf-8?B?aWFNOVhacVRIWklPL1NlbTZCaG1wM09Za043OWd6M09SSWFyN3QwbG43RG5V?=
 =?utf-8?B?Ly84TjdBMytCM21kbTJKU2x6Y2Z2TjR1Z3hjWXRuQUpsbU9qanExcXdoYTVr?=
 =?utf-8?B?RkJNUTF4QjM0cmdqMmU5ZjgvL09VN1k5aHJoOCtGTkYyNyszQkRKSU16aFJG?=
 =?utf-8?B?ckpoVXhTOFRBREsvS3RqUzdvRVE1SEczNUIrcHI3aE9GQTR1ekxWRit3YmNp?=
 =?utf-8?B?VnZ0RVhlTk1kczgranhDa1dCakNnRTBKK2RqUnVpVWtJUWE0TUpJRThYaHIz?=
 =?utf-8?B?M0JsZkFUV3QwYjk5WXBGYzMvZU1xVFV2UXFrZVRiR21Sck9Da2tmNkEwNElq?=
 =?utf-8?B?eUoyNS8rQWhxU3lYTzJoV3lPN2tQeVlpMXVxNWZWOTNubWF5Z2pZeitDQVdP?=
 =?utf-8?B?YzJCb0p2eis4RFZYWFpHQkZqWC9RZ0NUUGU3NlVoaVNPcFhPOG9Pd3lsVTRV?=
 =?utf-8?B?TW1SajltclMrYlpRWkR3U2xKQlNDb3VwVEMzL0RWcjFpWnpySVp4U3MwbkJV?=
 =?utf-8?B?dW5UT0F2YUJlS1NXYU03cWVEZVJZNVliekM3ZGJ2RENXQkxvOUt3S3FrMCtN?=
 =?utf-8?B?ZUpzNlI5MDdIOXpTVWdubm1QQkROL2FxWGpTRGwvT0tyMkIwSy9QZ21vdmlu?=
 =?utf-8?B?eERiTzY2MDdUTVlmTWFtU0RIakJIUnVkMGhmOUdta3YvQkRlUDhxWmx1OHB1?=
 =?utf-8?B?bHZNRU1sTys1aERqdU9jNkRiajI0TW5EYzBwTDF2bkFERFJhYXRpdXRWSzJI?=
 =?utf-8?B?NzBZdTZqU2VZRHlIZzdhakZDZ2g4L0w3bVU0VXVnUFoxb2pXcklTS0FlbkhF?=
 =?utf-8?B?Mm5DTjI4MVBqZ0tkbzk5NjZqVHlJeU8yUk5iVmdwNS9yM0tSTlpFN1lucm9V?=
 =?utf-8?B?LzhBU1RranNCYWt5TDNNNmt3NkNFd1dHdzBNUWxvSmJJRS9KSkV5T0s5WUNT?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56007bf7-6cb2-4824-b297-08dd7d97574c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 10:05:11.8088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jT62RkplkcOqolZMkpsSkMKd4B6RK83jcYJh9d/17cnrzvqIv9rmW+iyDBaWp8daI83778c5FRfkjnx3u6CmVewYq/4J74zF12aEpcRwwv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7547
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


On 4/17/2025 2:45 PM, Mitul Golani wrote:
> Reduce false failures while preserving timing accuracy. Introduce
> a small tolerance buffer based on refresh rate which accounts for
> HW/SW latency without compromising validation on HRR panel.
> Although an imperical number but already IGT is living with that.

s/imperical/emperical


> This also ensures that asked refresh rate is not too off and always
> catch the real HW/software issues.
>
> --v2:
> Refresh rate criteria changes.
>
> --v3:
> Comment changes (Uma).
>
> --v4:
> Use pre-table for refresh rate checks (Ankit).
> Commit message changes (Ankit).
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   tests/kms_vrr.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 79 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index c4bb30f6a..c9059c897 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -124,6 +124,24 @@ typedef struct vtest_ns {
>   	uint64_t max;
>   } vtest_ns_t;
>   
> +typedef struct {
> +	int min_rate;	/* Min refresh rate in Hz */
> +	int max_rate;	/* Max refresh rate in Hz */
> +	int tolerance;	/* Tolerance in Hz */
> +} tolerance_config;
> +
> +/*
> + * Tolerance values are determined based on predefined ranges
> + * ≤ 120 Hz: ±1
> + * 121-240 Hz: ±10
> + * > 240 Hz: ±20

Just a suggestion: use <= instead of ≤ and +/- instead of ±.

Some machines might not have encoding for to show these characters.

> + */
> +tolerance_config tolerance_table[] = {
> +	{0, 120, 1},
> +	{121, 240, 10},
> +	{241, INT_MAX, 20}
> +};
> +
>   typedef struct data {
>   	igt_display_t display;
>   	int drm_fd;
> @@ -410,6 +428,57 @@ do_flip(data_t *data, igt_fb_t *fb)
>   	igt_reset_timeout();
>   }
>   
> +static void
> +calculate_tolerance(uint64_t *threshold_hi, uint64_t *threshold_lo, uint64_t rates_ns)
> +{
> +	uint32_t refresh_rate = NSECS_PER_SEC / rates_ns;
> +
> +	if (refresh_rate < 0)
> +		return;
> +
> +	/*
> +	 * Current IGT implementation follows this sequence:
> +	 * 1. Perform a page flip (`do_flip`).
> +	 * 2. Wait for the flip completion event.
> +	 * 3. Compare the timestamp of the flip completion event with the previous frame’s
> +	 *    completion timestamp.
> +	 * 4. Adjust CPU cycle burning based on the relative frame time.
> +	 * 5. Tolerance Check: Determine if the flip completion time falls within
> +	 *    the acceptable range.
> +	 *
> +	 * We set a tolerance value as the acceptable range of time within which a
> +	 * flip completion event should occur. If a flip completes too early or too
> +	 * late, it is marked as out of tolerance.
> +	 * As a result, additional CPU cycles are burned to match the `target_ns`.
> +	 * Even if the next frame is on time, the total frame time now includes:
> +	 * Burned CPU cycle time (from the previous frame) + Flip completion event time.
> +	 * This leads to miscalculation, causing **false out-of-range detections**.
> +	 * The impact is more significant on High Refresh Rate (HRR) panels, where:
> +	 * The allowed tolerance window is smaller and more correction time is required.
> +	 * i.e. for 210hz (4.762ms), allowed range is 209hz(4.784ms) to 211hz(4.739ms).
> +	 * This comes just 23 microsecond tolerance, which is much lesser
> +	 * for accounting HW/SW latency, CPU burn cycle latency and correction logic
> +	 * applied in igt for validation.
> +	 *
> +	 * To address this implement a Bucketing Strategy:
> +	 * Provide a small tolerance buffer to allow IGT tests to account for correction.
> +	 * Based on range of asked refresh rate. This prevents excessive failures due to minor
> +	 * timing adjustments.
> +	 */
> +

Can remove the extra line here.


> +	for(int i = 0; i < ARRAY_SIZE(tolerance_table); i++) {
> +		if (refresh_rate >= tolerance_table[i].min_rate &&
> +				refresh_rate <= tolerance_table[i].max_rate) {
> +			*threshold_hi =
> +				NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + tolerance_table[i].tolerance);
> +			*threshold_lo =
> +				NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - tolerance_table[i].tolerance);
> +
> +			return;
> +		}
> +	}
> +}
> +
>   /*
>    * Flips at the given rate and measures against the expected value.
>    * Returns the pass rate as a percentage from 0 - 100.
> @@ -439,9 +508,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
>   		else
>   			exp_rate_ns = vtest_ns.max;
>   
> -		/* Allow ~1 Hz deviation for different reasons causing delay. */
> -		threshold_hi[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) + 1);
> -		threshold_lo[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) - 1);
> +		calculate_tolerance(&threshold_hi[i], &threshold_lo[i], exp_rate_ns);
>   
>   		igt_info("Requested rate[%d]: %"PRIu64" ns, Expected rate between: %"PRIu64" ns to %"PRIu64" ns\n",
>   				i, rates_ns[i], threshold_hi[i], threshold_lo[i]);
> @@ -497,6 +564,15 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
>   		wait_ns -= diff_ns;
>   		target_ns = event_ns + wait_ns;
>   
> +		/*
> +		 * FIXME: This logic makes next immediate frame time calculation
> +		 * in inconsistent state, even if next flip comes on correct time,
> +		 * it will be marked as fail due to time difference from previous

Nit pick: May be you can break this long sentence into smaller

With above minor changes:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> +		 * flip. Needs to reset at every cycle for correct measurement.
> +		 * Once this is corrected, igt can ask for more stricter pass
> +		 * criteria.
> +		 */
> +
>   		while (get_time_ns() < target_ns - 10);
>   	}
>   
