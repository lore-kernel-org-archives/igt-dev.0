Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B0ACCD1BF
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 06:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5797910E129;
	Wed, 29 Oct 2025 06:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EoUZU/yI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF4710E129
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 06:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761720248; x=1793256248;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KezN8hlraDvEMLKqicj3NdKP2f3Rb/C78sbxAxlouMo=;
 b=EoUZU/yIeMm3AhtEG392p7vLVvtMkGNpCQoPqE2NlrT8ubjnJmVBZwBa
 ngYL/XfjQd82fYFWeH4aZcLI/UrrTZl/XlSVs2MQSZ9IfJ8leKXS123OG
 TX9KWaNdTOeCFdEZIJyqXnBiynRSUf/eHR0RXh2d761Aad9Jhqm8Jmzbf
 MdVaHC0EcOSaYAXZSB3bKuyiCsuMxDi3am653iX6y4vqTqck8kS1SGqef
 m3qKlDoxpqIrwOFIrahr+RtUg4dUyiEqVi3nC5uoqWkqr7+ecrP1hy+u6
 cwRBNi+MglLervYsMkBmMZ04/Pmdj0iLiMy2M/rAeC/5E214G2SPfXm7h Q==;
X-CSE-ConnectionGUID: irdWeJ+0T/a+RoZfnqN3WQ==
X-CSE-MsgGUID: lyyu5C47QPGP6IZm2AJqTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81461672"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="81461672"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 23:44:08 -0700
X-CSE-ConnectionGUID: bqIHjic5SNSKNVTA0kFBBw==
X-CSE-MsgGUID: tDaorIR/QymA9M0pgesoEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185204998"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 23:44:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 23:44:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 23:44:07 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 23:44:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TL8Ck+Q5/TmvFKRA8s+pq96+p6koxnvtiYZmlSHaowGSr9T9d1niOl7nGS0sSQDs+LMdANaLeGh+2IWFxniLWK0dahLrkNcCkIT/BF7Yra16rmxv54f9sithvWjH0vf9zzsUnEfqFAq3VMVzt2ekDKqb7sU+5gf+AsfG/zBcSS1qMwSb7ohIl0LHnhHpysohD9GqTu//nhz/lhLQrAPjFoUfgpE9IZz+6D6koy0Svpo/zr9pP9I8qU8oEtW1CBz7NUI+VhEmhY9kgiD751u6tbBfNl+3zuV8cqo70ggxRFQkFBQtIxjiZnfSvs/FLPUUyEuFhP2l4Rz1Ym4GAri6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mReK8Aq6nP0XDHWH0U2kj3wGlWqPrm7SK0noY6eO3Qk=;
 b=DblIhkjEIMqMydcoBrOObjHweJKIbx7Ab+L5KaXVvaLY6jV3Qo61nWAhHxoSmSlcRoCfqTEL2Tzx/CaQlb+yOjrhuAxElXZKP7cMZ6p8vvWON1yRLCQ8VUDxg40fUDrf4rbVW4b/s4P3f3Mua9I6itY+xZZlgAQ/hO3OzpZNmFz1a7UY8G0AtfLEODIOOFgzAR5LX2DekKWPMY1qEpeEP7kVfyx8wm2lSa3ZfVnMPoq2vQlN6PB6K3h6GDEmjp0QAP3XHxObTOv0GlotfitIWrVd7lcJ20ZCL9uVRuQl1RPdfH/a/1Fal3zTLTUgIdt0I6/ekzy/98Q/lpLLs/fmKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 06:44:04 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 06:44:04 +0000
Message-ID: <e33c9373-583c-4a41-9d34-d3095adddd22@intel.com>
Date: Wed, 29 Oct 2025 12:13:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] tests/kms_vrr: Indicate force refresh rate request
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ramanaidu.naladala@intel.com>
References: <20251028084354.2682743-1-mitulkumar.ajitkumar.golani@intel.com>
 <20251028084354.2682743-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20251028084354.2682743-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::7) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 1efc4a6d-211d-467f-9484-08de16b68ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R09YUEJjRC9LMHd0ZGticEd2elZTZ2ZsS3BNT0gxQUVHRW1qdGVYRkRFTVJs?=
 =?utf-8?B?cmpKWElEWFEwOHlSODRtdTZDQWpDTGxXTnhuNkwyU2xCMDk5OHF4ODh5OCtu?=
 =?utf-8?B?aDlJTUY1THVFUktVUWpYcWRFTzJXVXdERnlhTlhlTkxTdVo0NUJoeDkzdnNt?=
 =?utf-8?B?SnpSbmVGdTVicklydFE5TDdGTVVOQlNkcXAxRklyU1NlUUh3MHFvQWtZckJO?=
 =?utf-8?B?Wkd5UFNsUnFkSHlnc0pGRTEzUFNqRDZXWmYvaktHaTFqUGVWWlBxRTN1RVRy?=
 =?utf-8?B?SCtuVVZXUVdaaTBwdDd2ZlFoNTNqdWE3M3RzSndwUFkxSXRGZGVBUkxlWTJB?=
 =?utf-8?B?cGFzVm5vSEVNNVllWEg4UXRHVDJib1Z2Q3grOHhYc2xYVUpBL2pwZlJGZHlq?=
 =?utf-8?B?ZEVzY1hYcC81L2hzd1hONUJ5cnEwVEV6YjNucFBBTlYxZitlRnVadEVTZm1O?=
 =?utf-8?B?d0M5dENCbkhKMmZMcmo4NHhLa1pobE54dmJaQXpTZ3VmOXBUTGFkb3FQektF?=
 =?utf-8?B?VzgveHQ5SW5ZY2lGWlltTTlzOGIyTEZQV3hCb0JsZlQvejJSdDBnYlpYMUpD?=
 =?utf-8?B?UnFkaytkazZSaGFSNnB4MjFSeTZhUmlmYzRreW95Rms0U096cVdEWWpXTVZ2?=
 =?utf-8?B?b0JjejVwaERSVkR3b2VSNGc2bXNNcXFEdEc1b0EwM2poc1VOWDZyT2wzQU9P?=
 =?utf-8?B?eGJHbVVBb2syZ2RJYys5cmg2R3JTTUpZa0pNWEduVUZXN0M2NjNyRW0xcG8w?=
 =?utf-8?B?TmFPOGJRRXFRSHkvMXE1NkU0dG44WmlEOGE1dWtUZllOekpIdWJST1A5a3RW?=
 =?utf-8?B?Ukluc1c5TXA5K0xLQ09DVW1OUWh5ZDBNMmFxalRtdTNlSDJQWTFqV3lMTDBO?=
 =?utf-8?B?Z0ZraUs1dkZEUUhQS2paL3Y0K1pGT0pQUnZCa1JVZmVBSWM2UExuUVBCQSt6?=
 =?utf-8?B?S3R5akQ5UUs3TmlIcytFMGJaWHZRQmRQTnYzTEhad0d5VUNJYUhUZnVuaWdm?=
 =?utf-8?B?OXo3d0RVVWV4U1RSQVB3MnN1SXVaY2dwMWhYazA2NHRUQ0ljeDNuZXRTTGE5?=
 =?utf-8?B?VVJGN3hnTzIvK1pZdVg0enc3WnpBTFhncmI1WXZWTkFVTmtrR3htaEs3ZnQ4?=
 =?utf-8?B?REZyME4xK09wenpQQjAxc084MTUrNW9XUTN5akFRNnBJaUtPeUhlVDFjMk5O?=
 =?utf-8?B?NDRiWVAwc0NtNW11QUUxYmJvK1lRR1dSZlNFczhmYncxUVpmNlNxcUpacUFm?=
 =?utf-8?B?bFBCb0trOEw4cFhVQi90MmhlOVRaOVJocTdqNDU2ajg1MzdvZzhKeW81b1pH?=
 =?utf-8?B?YjFwblc4aitjZnFnK2ZWMjF3eVUvd1ZmSFFoMm9kdFZuais2bndsTDhDU1lR?=
 =?utf-8?B?L21sbHQzTVArSmZ1Sjg5VXlQdjR6NVBNb2o2Y1pIeVpnMDU3YXJWMlZPc1Ro?=
 =?utf-8?B?SFVuUXVBdURNbGlpR2NIcFJoU2Fmd3FSa09Lc3NDYWgxaklGazNqYUZjVnU0?=
 =?utf-8?B?cjlUYzV1MWhYQzNlOXQwYnhDMGhFM2RTemovVVQ4NnVacFl1SFhiTlJ0aGVK?=
 =?utf-8?B?S2FmakFwYTFyOWVYaUpmY201TUJ1andObWpBN1VnMkkvN1lSSUxJM0VYcDRy?=
 =?utf-8?B?cTdKVFdacmoyNlRIaE10bklHS2tHK2lSVHBHVGVUNyt2TlpmU0lESkprLzdt?=
 =?utf-8?B?eDU1Z3BPdXBMRUlnZ1RtRWtKMFhEOGY1TTc2UnJmS0Vrek14YkFpZzZnSFJ2?=
 =?utf-8?B?VkxKRkNlTkRrS016NVp5QmZZb1BEUSs4blVwZXNpcWlYQjYxa283VXNKOE04?=
 =?utf-8?B?Sy9BK0pTQWxwdklXRFdmVG8rd21zdkdZOGRpK0ZrM1BNZ1pnb21pMi9raVhJ?=
 =?utf-8?B?QXUrdjJXb2t0WEFWckhBakZsSk5LUGg3dzVOZXE3YVRPUTBXRk1WQXZ6Nzgw?=
 =?utf-8?Q?MBwXPnE4exAAtxs+EZFIxekZlx4e1Mdf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXlXWTdpTDVsZ0RlTkJFYWI2bUhlNm9jR2VhR1ZMZUV6bk1xc0VWVFhFcVZs?=
 =?utf-8?B?QW91NUxEb0ViZ2M3NWhtdXNqanpPZDFpeE5QWnFaZUtRVTN6MDNXR1Vwa2Q5?=
 =?utf-8?B?M2FoNzlVUXVoYUpJQUJOV2sxQWRGOEdvMm1SeFpnWG1iaEt6cE1Dck93OGlD?=
 =?utf-8?B?LzZHVzhhYWs4ZEIzUkdSSDVMNjdOczFLQkJ0SGFCK29Sdzk5dzRrS3p3QjBt?=
 =?utf-8?B?NVh3SlZqMndyQ1hDd29hS0NrMk5kbGFpYTZYTlh4QkVjMXpxVjI5c3Y3V3pO?=
 =?utf-8?B?bGFUMXJjbUJVK0JsQ3ViNno4RjJsb29VZ21CQWJPLzloZ1FOazk2MVdWakVv?=
 =?utf-8?B?anBqTDd0UWVJQjE2OEtBYnhLZi9NWUpZY3ByTElrT3FKcDZsczU1T2xOUDNi?=
 =?utf-8?B?QVM4STJBVkVYZ2FBRW9GSDZnMit0Njk5d1RVU1ZZUG5OU0lIYWpvQTNRbVJk?=
 =?utf-8?B?RXdKRjdhdUhvdzJHd095bThEa0g4TGU3cjlDOVBMMFU2MTAxVmFwNUdBTnpr?=
 =?utf-8?B?cVNGdmVPK0xQOWZVdjAvMm13S1IwUTBmRGhzSXA4TlJQUGI1R2lyaVkxME52?=
 =?utf-8?B?RnhOaW82b2hDeVZhL0V3enZ0Y01nY1BwTVY4Qy8rOU9PU2NObjdCN1RhWWdS?=
 =?utf-8?B?TVJtRjBSQkRFNCtrUEt2K0dHUEhGZkI3a1Vna242Ny8yNmJUMXdwaWRsWG1Z?=
 =?utf-8?B?MGN5b2lYQWtiNmNGT0taa1ZTRkpxTHIyMUtySjlzcndIVDVoUzUyUTlZaVRR?=
 =?utf-8?B?cGFqN3U0SmxLOEUyZXJCMDdGcXVvTDlUbUkvY2RoaFBsa0RUL2hJQUJzTVdI?=
 =?utf-8?B?L1ZnMjNXRWR4cFh2VlJsVFQxdUcxYVZkdklzWTFUQ2lHRFVDN0lYd2Y3NDZH?=
 =?utf-8?B?N1p2cklSU2U4bnVFR0J4NkpicVBjZFo5ekkra0tEenZJR2J5TmU3VklRVG5X?=
 =?utf-8?B?b1V1SkF1dWk2K29XMGFYaUpXRGlwaTViNkJvRlQ2U3l1clBNT05qMENMNHNR?=
 =?utf-8?B?aGQ4bll3VnlCR0VIQ0pURFErNFNkakZ0Z1JOUmM2MWRzMEU4bU9ad04vRFE4?=
 =?utf-8?B?REYwcGxxUURzT1hzWjNsbEZ1YlcrRmQ4dmxJaVFmMWwxa2cyUDdEQTZPeEhB?=
 =?utf-8?B?R1BJTHJlSDVpVXJWZTAraXlRU1ZjWFpLMm1BNGNndEJveVg2ekowSVJFRWNq?=
 =?utf-8?B?MHRQYTNzN1ZGcEtIVEtaaWtTejBIbEUvVHM0Y2VRSzF5Wnd0WXR2L2tqRkZB?=
 =?utf-8?B?VlpPVG10ZThYNmVaK3BqMmlVL0lsT3gxNWZWUnlTbHB5bkwwcnRYVVRUa1kx?=
 =?utf-8?B?QVdiZ2RrbGd4emVKaCtkcDlmcFVXbCtPQzl2Slk4d0JNK0d0UXdIdXdnamhZ?=
 =?utf-8?B?ZjYvTDlTRG9VdWs5aGRFSkdlK1NQRS85UTh4a2VSYldQeHVrRnExMHRsUzRo?=
 =?utf-8?B?cGxidWlTS0paS2VGRk9GcFBnWkNjV3hLR09Yb0RoOW1XdUQyaHpOMkFCU3VU?=
 =?utf-8?B?T1R6eUhJMTJTMkJpMjZPQUsrcWFCNWZkRGhXY1NNcDRJWDJHaUZvR2FQbjlZ?=
 =?utf-8?B?M29rVUpWWXlJMWdkQ3lPWnczbHVINGpKUjU5U2R6RzZjb1ZkNGxwRG1PV1pO?=
 =?utf-8?B?di9jNTBjcXgyaERzSjZEbC8veUJWZUhETXU4d013aGlkZXVTdldVVHlJbUJP?=
 =?utf-8?B?NFBmckNTWDhxK3FBQ1ZiTDFjbU05b3lGRHBqU3B0YWwwZXp2bjZrQklZYldZ?=
 =?utf-8?B?VmQ2UlJBRFpTdUs3VkhZZ3dScnRlT0RLQUpZUU1nZUFEZzcwU2kzQW90NWJP?=
 =?utf-8?B?ZDAvSVJWcWdBRU1qaW5rRFdtYXhpRFphTTJzR293YytVVFloOGpyTGMrWnZ2?=
 =?utf-8?B?UDgrQmhUVTBBMTNqSjRzaTR6d0ZJQUNoVENibzF0UXdqbnExOWlidlRzc012?=
 =?utf-8?B?L2UyOTVOeGFKYjE2Q0llZWpLR2hRR0NVWTdVY3dNdUpBQitCVXB1QVEzWWRV?=
 =?utf-8?B?b2oyZXBTMU1JOCt3SXgvcWRoTFJvN211VnI5QUJEVk5VUCs5bW4vSkRuSE1w?=
 =?utf-8?B?SjFsdUNYM1lQNzZFZm1RV2ZpZ3o0QWQrcVhCRGYyVnB4WDlWVGpVWUxMQnMv?=
 =?utf-8?B?ODBMNlFMZGI0QmdRcTR5bW9yLy9LZTZGRThxSGhLTU5HU0dKSjFuRVZ0SWE0?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1efc4a6d-211d-467f-9484-08de16b68ccf
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 06:44:03.9819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cHXB6IUhoFg8KL2jBlgH3x+v6f440DtK+hPVkirB703fVcOiN6Ga8VsAgctDktk7uNF+svmdzTXX1pfyG1ePQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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



On 28-10-2025 02:13 pm, Mitul Golani wrote:
> Use data->flag to indicate if user has asked for forced
> refresh rate to try.

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   tests/kms_vrr.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index d677a0a07..73c556a68 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -106,6 +106,7 @@ enum {
>   	TEST_CMRR = 1 << 9,
>   	TEST_LINK_OFF = 1 << 10,
>   	TEST_NEGATIVE = 1 << 11,
> +	TEST_FORCE_RR = 1 << 12,
>   };
>   
>   enum {
> @@ -1109,6 +1110,7 @@ static int opt_handler(int opt, int opt_index, void *_data)
>   		break;
>   	case 'r':
>   		data->vtest_ns.rate_ns = igt_kms_frame_time_from_vrefresh(atoi(optarg));
> +		data->flag |= TEST_FORCE_RR;
>   		break;
>   	case 's':
>   		data->static_image = true;

