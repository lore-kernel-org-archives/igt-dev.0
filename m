Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EA4C83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 08:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BFC10E1F8;
	Fri,  4 Jul 2025 08:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dw9zAcYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB10E10E1F8
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 08:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751617465; x=1783153465;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oXqdgLZ7ciZcaCciqUSFUkebnOdemg5WaN27R3hWuQs=;
 b=dw9zAcYtu7A0b1b6t9+ffIEVRyoySdCmqVPeAZtnH5cFJNC1uaL0f6rw
 JhKRk13lloluAp23O1V9wtr6cmwjB+M4iJ0RyE09QZaaUo4KBtX5bIkiW
 OnTjXx9D6IwZvdiwFz6jJz78ceA994kLXlGoB/A/AEaZul5l44p1Ulxb6
 NmpBKOhyqMkH8TvlQRVVesGA+xZ+LlelF1d9rVvMihpb2+OPEQzrUJpnN
 ji3x6bVmhQerkLgxXxRaiqKLp5io6aCcSoYS68Nfy9YODcK3Uyhmd7dTr
 /PuQL+6WcT0Lcfqlfqfr+L1Gu+7EAsmwQZNtNZ3tHiZg9ocVPR089oCbf w==;
X-CSE-ConnectionGUID: DZmWrj3YRiWRudr8z2i45g==
X-CSE-MsgGUID: NwPTf+4qQrG+ZsiA0C1Q/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54048121"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="54048121"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:24:25 -0700
X-CSE-ConnectionGUID: uUpS2OXBR6SO9gJdc5upXQ==
X-CSE-MsgGUID: U8o0KsFfRmCme31VYEgEfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="185542199"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:24:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 01:24:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 01:24:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 01:24:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gf30TmeJ3oNMNPwvIfIsZKT1tQS5Uz8e90W1KdNFrIAkJ++ZiOLUTmri+sjLm7fjeeN9QGq6/6m5qzV+I5ELzNM1zUphGh5iibNafWkXNJV35vPsJRdvQ+xLWSHlL+kzUAVE9yZyEfOmuYVMLbeMU002JxQu5mRCsA703HGz/zx2UEjmDODZwZJdExK51pBkdo7fPMJcniU2UNoobKxnnDt2+ahP/Uv8cLULgtnm54GwOrHPf3hOaeatFmrgf5l4KZK98RzbIHX/JUVU1+hEv/W0Q08sTSX186H9Kn5w/X/SLL5ihNty+sTy4LtgFZH1DS424+TDtC4dQFeTkBKkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uP7UL30UkMwBK1LLerEhi+Axa2BC3PcP6UW8Br7zyEk=;
 b=isyTZ5fGbF/h2eWmadqe23xpliALt544Ois4vamVftBUx2yPW1gyOkbB+qdwObSd/V8vE4oHdNNghmPvprUamJcvT/oL89HGemMNJNb/pBxGjOLGZ8s9xGoN4idXOMAsG2mlmCmxFD7AXL6qDa3IvjynzdClODNm1tbT32t3H/PSVyUX3+CI+uGOSvtRSH8BsFheoRyHxao4XYSaxMJBy+xMT0vz7VqCXYUAQA69UQULYjSTtFcb9EtZ1l0jKuHe+7HGaiq0prupIMclDH0AXyzGNgUyqnfCKY1hcIaxgzEWdBTMUFMqwTMrzq/CxeOUXC955ZtP8buWBln1MT3Ybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SN7PR11MB7604.namprd11.prod.outlook.com (2603:10b6:806:343::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Fri, 4 Jul
 2025 08:24:22 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8880.021; Fri, 4 Jul 2025
 08:24:22 +0000
Date: Fri, 4 Jul 2025 10:24:16 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/intel_compute: reuse bo checking code
Message-ID: <aGePsCuPncEOTOIa@fdugast-desk>
References: <20250704081131.895088-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704081131.895088-2-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2P251CA0015.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SN7PR11MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c1ef8ce-2f38-4bfe-7601-08ddbad42dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1ZidXdnRVBqSTRXcUVFUVVmYzAwQTN3clpOdFR6L0ZrSlJLajROSlNHUlUr?=
 =?utf-8?B?UlVQbHNJc2JGVG0yaEU1TXlaRTdlNUlSdm5tYVMxOEZEWDYzaWdDNG1XZEhq?=
 =?utf-8?B?TlBDeHBKU01xWTdBdFQ5eXZCekxORS9mcXlTMUI5MjZXaCtraEw3b0xyaFhx?=
 =?utf-8?B?cmR0MzNOcUg3Y2dDUFIxL3YzZEc5OXBpa2Vlc2FyaTNDR2xQRXNpQTIzcXov?=
 =?utf-8?B?USs3aGNUcDE4RXM1ei9PaUdDcTVmTWh2VlhLMzE5T3FSTDUzckdhczExcmU1?=
 =?utf-8?B?K0RRVnQvOGNic0JXb2N2Y0JKeDlqenRLaGxBN0ZmVTB4UkUreGhTT1ZiMC81?=
 =?utf-8?B?bWluaUdpSjh2My9SNmp5cWVpbDFHYmVNVmhPQ3FjT2RmSFdDRUlsbzM5cFZX?=
 =?utf-8?B?LzlPS0FHdzBSK2JIVmEzTEljWWJsQ1hoYW9ReTdRWXRUNlR3TjRJWFd2cUxN?=
 =?utf-8?B?dnkwN1JtSGNNS0FjelN4dGdNVVlVNTR5MGJLQTJ2NFZMT1hHN0dEeXZIK3cv?=
 =?utf-8?B?VDJkRTdEN2V1N1MwUmdKcnU4SHBPRTNsWDg3c2dCQU04ejhwTEdZLzFLeU9U?=
 =?utf-8?B?Y3lBY2tkNTVEYlV4eVJjU0FJSWlpdk1zQ0dPeERFKzZHaWlNNm5NZGZMekNo?=
 =?utf-8?B?elRWMzJ1TVo5cDE0WTBnTmk4L0N1TGUrYURSSE1RS001R2hLYUs3U3Z2R0Fa?=
 =?utf-8?B?cktUb0p1aHlac2QxTDlwZFN1bXIyUmp2WUJycXZQd2JxWGlsUG9HWURldENZ?=
 =?utf-8?B?cnYwbldjS0FKT1RDMnQzUDFXRStqVFJudS9NY2RhN1NSTjN6RkZHSTRvSEpo?=
 =?utf-8?B?b0hsM28vMXJMbjNlZHhEcGtKUXJxajhwM1NKVldJNE05aCs1a0RqYTEvdmxD?=
 =?utf-8?B?Z0toODVZL1d5cU5mOWloT1cwL2ovcEIrYlhtNm92UVdkUVRhK2kvNStHY0tT?=
 =?utf-8?B?UFZtZDNEMitiWlB5aGovYlRsMWF3eFBoUHNLZzJQdFRpcmoyT1JiYkN0V2JY?=
 =?utf-8?B?V3VVSmhFcXVsYU1QNnRZa0lnUFJWeVhxSlkyNDVjcjY4OHFuN3lvODA5bXRz?=
 =?utf-8?B?RWpsNnVHb0JLdld2VzRpKzVqMXhHNy91RVYzZTJiVlV6SWZlQjN4KzJ4cVNL?=
 =?utf-8?B?TVJGeUl4V0JsQUJWVk5yeUFyL1Rkc1VHcDhzRTlvS3RqSXZYc1lXem41VGdZ?=
 =?utf-8?B?L2dYNGVHLyszUVZWSzBIRDc0QnFyT0FlZ1IwaHI4dktacVMvMGgwanFwM3J5?=
 =?utf-8?B?UUY5UGEzNGR1Nzh1WFhLd2k2NTVLS0ptaWIxMkFrSDcvYVNnbnNOVmdpaXl5?=
 =?utf-8?B?Y3pjTndFcExsU0VYajkvZWFTWVFRL2tCR2hCUEUyTk1RaWIwYXNJZUxCMWZl?=
 =?utf-8?B?aFdHcWU2ODR5bTNVaEYvaHpoK2s5MitmV2dqQUl3TzhjT3NLeTNZYi9seXRX?=
 =?utf-8?B?R0plMkxOWHZodEF0UXlQbUhVUllNL2ZkZ2RiL0JzeFR5SnhqbEhJVU5venFq?=
 =?utf-8?B?WSthaFdIM1MzUXFkSWJRTHJzZGFSaW52clZ1Zk1zM3dTTVdFbzZRdEYvQ0o4?=
 =?utf-8?B?K2hucmtwYnF4Y2pwRnB4bHFVT3ZuSjQwbXU5YXlnaDBxaGIxOTFDUUlMbC9Z?=
 =?utf-8?B?WHI2R3BLN0t6bkgyelE3NHV1NXpBdTJtMUZDOVFUK2kyeGNuaUNWV0U0SmFl?=
 =?utf-8?B?WHJ1alNrT0R5RDBqbks3ZEVtcGcySXlCVnZrMGwrdGhtSE42QnFHSGxkbzA4?=
 =?utf-8?B?RWt6Wm9lNW9tUzNZdkd5cXQxUDg1dXVkSXBUb1M5VFozQmpPNkdWRkpsWGhG?=
 =?utf-8?B?R20vYjM4QUpWQk5pOGdTNzl3eThRRU9iOFRXNGNQellYTnVLSk1zV2xGcUhv?=
 =?utf-8?B?U0RPeFJ4NnJ1SUtsL2xXdWN2SEZKRC83TC92NFhPUzNhY2lpZmEvdGF1d1dP?=
 =?utf-8?Q?KSJSKdXsNmo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2hHT0tlRnZTYUgvVThvTEFJRGhWQ3BFYVY1U0UxM0Fxb2I1SDhpUEZkS0dj?=
 =?utf-8?B?Wm83eWJlK0xnSmtPK0pyQlVKaG54ZnNKa3lxbWo5R2tTN082cDc3VlhHNDhF?=
 =?utf-8?B?TVhwSzhKb3g4Z1ZnOVEwcHkvbmVpYnBab0loaDM3TkFOdDNVbFBvUENZNndh?=
 =?utf-8?B?STJTNFJXRHhmVFVHNE5OcWVOY3NkQWQvYUdiRGtXMnpFUm9pbmFRNXFIYWox?=
 =?utf-8?B?NFRNdFVGNHlLRVVxU1I1QlBEZ3ZNckNDK3hRLzZlcXpDNFBURzk4aVArOFRZ?=
 =?utf-8?B?L3Q3YXFFaUlJaU4xUTZhMmJFS2hrS01CZXVwT3F2WG5tYW1GTElKZmlTeHJY?=
 =?utf-8?B?Z3UrV3AwcVdoNXZEQmpnc2QvUmRNeTFRSFM3Y1RBSnJpWm1VWmZRclVOZHRU?=
 =?utf-8?B?eUhoTW15T1hWa1BJZVN0ZThRR3dka2Q1UEZ1N1FhSjFzMDJzZloxcmhvTFVr?=
 =?utf-8?B?dnhrMHR6Y2phb1lid1I4ajVRZ1N4NnBaQjZkejJpQmlWRU9NeURacHRuTGdy?=
 =?utf-8?B?czZVUk1qNjdiMXNzUXZzZHNtZ2tBWlpJNHA2by9wWWxZNE1FYzA0YUlGSksr?=
 =?utf-8?B?NjhxWlp5RVhEZ3NXRXpSTXhIN3o1NmRmOXhIendKeTRIQXROODZwY2pOd1FG?=
 =?utf-8?B?RUloeTJSLzNSUXR6Q2hrUGlMRnQ0NkNxRE1RWnlCMlNxdUVvL0ExOS9iUTNT?=
 =?utf-8?B?dm5QT2EwZ3MzNm8reFZ6WUtkc21MU0E2UlZSb2kzZ1g0YVloT2lKb2psQ0sz?=
 =?utf-8?B?bFg2OHg1c0RaWTBNb3Y5OEgyTlFWbStvQ3VuWHZpcUVuKzE2NU5oUVRKNTJP?=
 =?utf-8?B?U0JlOEc3bUlneEc5WFdhaThYN3NvK01Jc1gvaDc3bjVUREVSVXRVN1lScE9R?=
 =?utf-8?B?SDl4S3g4YmN6cm9ZUjJLRStqYTZCdXpkZlZJZVdlNFFhVHQwTlZTU0tCMGFG?=
 =?utf-8?B?clhRTS9DTFVlMXRjYmwvOGEyL0JvYmpmRHZUTXR5VEZ3ZzBERGZlbUlDaFVk?=
 =?utf-8?B?NmVNamNIS3NtOW1oSmZDdXFyUkY5aXFJZ29yODNKUlF3c0tBbktvakY2T2F2?=
 =?utf-8?B?V0UxUmd0aGl4ampKakoxb3EyVXJjdDBYRU9uTkdNTHlTcXViNWhJUHRxQ2I4?=
 =?utf-8?B?QjVtdXpxc0UrMEdoS3J5YXJscFZ2UWl1T1JodDVrYnhMSGxqbzdFeVJLQ0Zl?=
 =?utf-8?B?azN3OHdPVkpXREppaVZCYTZxRUpzenlVVjVHTDRhTGhJRWUwOWVXQlFxK3Zj?=
 =?utf-8?B?ZWJlQWF0eXBGUHc1dGI2ZHA4a0c2dEtPd0FuTFhjcGY4RmI4cG9LT3N2UEtu?=
 =?utf-8?B?ekxxS0NnaGFBbnExQWJqVkY3VjVJQ2s4bVAxWVh1M3R1MmtZQ09CZ2Y5SDgv?=
 =?utf-8?B?ZGQzaGZQRDYvTCtMLzhtNFc2Tm5ubG9qSXZBYlRpWUlOckdab2pZeFRmR1F4?=
 =?utf-8?B?Q0cxSDlKL3R6ekdSUjdXeGRpVy9OMk4vMGVMcUNyYjhQRHJYODlYaDhHVDk2?=
 =?utf-8?B?RUZIRThHL29Pdlo1THcvbTRkbUNWVnBCTEd4QUgzNWJ2L013bW1LdkJZRkZk?=
 =?utf-8?B?b0hWRitzYzRuS2N1bEp6NmlMeVY4RDRDWFNrUHJIZ1B6ZTdEd1lYL0xQN2Zy?=
 =?utf-8?B?MFBDeWEyK1AzTDJ3YjBnaFA1SWY3N0hQQXJFOWo2UlY3ZTI0RGlsZmRrdFNR?=
 =?utf-8?B?dFI2STJya0FFZnNWVkltZVhXckYyeGxPMWFoZ3BWbmExNExacEtPV1RMd3Bp?=
 =?utf-8?B?MGdrZmd5YUNEMkNwbFhTYzk1UVRjOFJBZVMrNWtSNjdjTVlyK0dVd01nQ1dl?=
 =?utf-8?B?cnFORnlIbjg5ZXRScVBHRjBsaWNENVpNaFMzeFZnWkd0c0lkYU96UjlXcmRZ?=
 =?utf-8?B?eUd1R2RadndLOXNicVJXM2FxVWpuL1pLZ21wTldtalRGd1RsNVZkeXlNV0tk?=
 =?utf-8?B?dUpaQjQ0YWR4OGNOTm03eWUrZjVneFRha2swaVg5VUthRDlSMkprZjg1ZkN6?=
 =?utf-8?B?dW1rWkxTZ0RneG5mcE1qeG1Zc2E2RDNaV3J2NWJuVkZuSCtjYkZNV0RYRFNl?=
 =?utf-8?B?a2E0ZzU5eTc1a2t5TkpKY21jdnZzWTAzeTlBRDQ3bkg2OHhsVkRPN2hsRmhn?=
 =?utf-8?B?NWR3T2h3M0ZMSTZEaGNIVHZHdGY5SlVEZzcyK0k5TlU4aWdnc0E4RCtDU09F?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1ef8ce-2f38-4bfe-7601-08ddbad42dd8
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 08:24:22.2473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqiVEu/8zM4vxQTpzMnDaoPvEwlWXZEQexzV9xXTznrivr92OYtVP25/TJdPiUOrhxKXe6tN6rpATOpkmZRmP2gssDWQLtbTdEpmZ+qJgh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7604
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

On Fri, Jul 04, 2025 at 10:11:32AM +0200, Zbigniew Kempczyński wrote:
> Use previously added bo checker helper to reduce code size.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Thanks for cleaning this up:

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_compute.c | 65 +++++++--------------------------------------
>  1 file changed, 10 insertions(+), 55 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 6126bdb3f7..147dd29163 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -882,17 +882,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
> -	for (int i = 0; i < execenv.array_size; i++) {
> -		float input = input_data[i];
> -		float output = output_data[i];
> -		float expected_output = input * input;
> -
> -		if (output != expected_output)
> -			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> -				  i, input, output, expected_output);
> -		if (!user || (user && !user->skip_results_check))
> -			igt_assert_eq_double(output, expected_output);
> -	}
> +	if (!user || (user && !user->skip_results_check))
> +		bo_check_square(input_data, output_data, execenv.array_size);
>  
>  	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
> @@ -1170,17 +1161,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
> -	for (int i = 0; i < execenv.array_size; i++) {
> -		float input = input_data[i];
> -		float output = output_data[i];
> -		float expected_output = input * input;
> -
> -		if (output != expected_output)
> -			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> -				  i, input, output, expected_output);
> -		if (!user || (user && !user->skip_results_check))
> -			igt_assert_eq_double(output, expected_output);
> -	}
> +	if (!user || (user && !user->skip_results_check))
> +		bo_check_square(input_data, output_data, execenv.array_size);
>  
>  	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
> @@ -1388,17 +1370,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
> -	for (int i = 0; i < execenv.array_size; i++) {
> -		float input = input_data[i];
> -		float output = output_data[i];
> -		float expected_output = input * input;
> -
> -		if (output != expected_output)
> -			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> -				  i, input, output, expected_output);
> -		if (!user || (user && !user->skip_results_check))
> -			igt_assert_eq_double(output, expected_output);
> -	}
> +	if (!user || (user && !user->skip_results_check))
> +		bo_check_square(input_data, output_data, execenv.array_size);
>  
>  	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
> @@ -1789,17 +1762,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
> -	for (int i = 0; i < execenv.array_size; i++) {
> -		float input = input_data[i];
> -		float output = output_data[i];
> -		float expected_output = input * input;
> -
> -		if (output != expected_output)
> -			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> -				  i, input, output, expected_output);
> -		if (!user || (user && !user->skip_results_check))
> -			igt_assert_eq_double(output, expected_output);
> -	}
> +	if (!user || (user && !user->skip_results_check))
> +		bo_check_square(input_data, output_data, execenv.array_size);
>  
>  	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
> @@ -1887,17 +1851,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
> -	for (int i = 0; i < execenv.array_size; i++) {
> -		float input = input_data[i];
> -		float output = output_data[i];
> -		float expected_output = input * input;
> -
> -		if (output != expected_output)
> -			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> -				  i, input, output, expected_output);
> -		if (!user || (user && !user->skip_results_check))
> -			igt_assert_eq_double(output, expected_output);
> -	}
> +	if (!user || (user && !user->skip_results_check))
> +		bo_check_square(input_data, output_data, execenv.array_size);
>  
>  	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
> -- 
> 2.43.0
> 
