Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D15C02181
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 15:38:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDA710E049;
	Mon, 20 Jan 2025 15:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceI13QDZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FBB10E037
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 15:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737387506; x=1768923506;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hR81fzu9UUJJYYyjBscYfoUA6Ty7XBOPesEt9YW/I8o=;
 b=ceI13QDZhZ4GuAHyKXmvbrrqv4tqj9swXh9p1JR6hIANn2XR8bLj4iUj
 OoNoHOGJISOWUm/VTTpGLEF2UXFVirT0Ca/tCV2q6m89z/9giQOCrC+kC
 srUG7UWy2j98n4awWgrIG+mpcPdFWp3rxfrnikY8hS5C6PdkSC4X48ipI
 87n3hhFkKZ0n1m2SU4KfynuCYI5HGaIvLTvSsrbKaG0SyFdaiqyrNpjrZ
 ZuIn3GZdutrR4x3vyR0uIsCQPVkoVLLWrl1lsX0kqiDMuI6sS72hSSAZX
 PmHTFSJAO7U8OWqzxWQkrXch6hoUo+23C3kFtpFAEyYrk4pXNM1hXzrnC w==;
X-CSE-ConnectionGUID: CjqxiHz8Q3q7yISUbrCxJg==
X-CSE-MsgGUID: BaTVw+yVS6CkNZ1Hdq3vvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="49183360"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="49183360"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 07:38:25 -0800
X-CSE-ConnectionGUID: DP4OSHOxQvSGzTO9tCv1lQ==
X-CSE-MsgGUID: fDwkENAMR4GkSHgxHkvVpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="137441286"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jan 2025 07:38:24 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 07:38:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 07:38:23 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 07:38:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxVzUjdXXhJfPwufA4ftRId7yXniHZwZpPQnxIqSz/4cPvD2ApPuZS/P2ibGTVep+8LyNsQsubfsEY8xZCaIR0DiVcet4aR8qDGHiBV3fKnwvMP+5M06oMeAkV4BF+KL0IN75gotHKAXQ0zL1ZNqlZdsLmM2+AheO4AqsCGYdTLzkOb51mAS9u2ABxmWXeEcCbKVkf0Nz/bof9j/YM/TZvGTrgagUmwOpJannZL9tYVXaaMRH8kv+kRBZolE2KVjdXBWkd8AOKuy61QeIxvPauy1uuZ9XpeHqq0Zfsxym4lrdaSa3kRKOuklMp/DLmpDIakDjzQtYnFigWDCL9zh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpCVcB8uQWY5Iz/GQFSiy1gKUs3NO0fn2abhPaTPgU4=;
 b=vdj40bSV/wDouMyI7SA23M8U2Oh+dNqGQywWbF8mc9t5lNof7XgOK4s/tmz/IZGiKyjGWRaT6NfZ56kCEfxv4EL/M9rdJbK1GdRSJPEDUjBNf6QC3MuDV1gmyzusErEAobmQtWt2hrgxr1EhuAG4NYvBAz7/YPVudL2lF+d97/fqBQG/e9ECou2xu/TSMQ+yxBr75ScB24E2bH8bDDg6hCprv1rDdtqtTLujYBmEKbntNfmORx+5YlbQjt+GFpRl2MJk8n/xtOv3pDPVwibjNJx9B5XOw3Pc5BOvTEuYLkQM6RbvrbfmbexEdLVKGVxMGe81oqOmhdHevBPOIFkOUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA0PR11MB7883.namprd11.prod.outlook.com (2603:10b6:208:3de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 15:37:53 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 15:37:53 +0000
Date: Mon, 20 Jan 2025 16:37:47 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?Q?Micha=C5=82?= Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/xe_fault_injection: Inject
 errors during xe_guc_ct_send_recv
Message-ID: <Z45tyy6VX2jyUu2o@fdugast-desk>
References: <20250120122835.10511-1-satyanarayana.k.v.p@intel.com>
 <20250120122835.10511-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250120122835.10511-3-satyanarayana.k.v.p@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: ZR0P278CA0015.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::25) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA0PR11MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: 200821e4-4dab-44c7-27e1-08dd396867a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVhqU29kU3NrQjRCTlZXSEM0aE4yN25FUllEZlM4bis0Uis3d3dBcWczYXFr?=
 =?utf-8?B?WDJyN25HMEZBVlNwdVV5SFRydnBVSFFvTzQ0eEp1azcxeVNqWWs2YjRYWnNl?=
 =?utf-8?B?UEU1WEpRaW1BUG00NjZXbFRlazVXd0JUajJjQStjY0lNa1FaelZpNVdqV1Z2?=
 =?utf-8?B?QXF5VTlXRTFJamw4THoxQkpOSkcwMGo3WFF3NmtjaThVdWRFUUxCQml4cDc4?=
 =?utf-8?B?dmRIUTUrRVNKeHc3a3NZN252bFZIVXVlbHNIVXNYaktrZUNWY3BvVXFKS1c1?=
 =?utf-8?B?TS9KWWE1Wk5WbndmakpKcU5ROEZWQ2xtOUlNVkcrMWIxQ1ArQkdHUFY0UkhK?=
 =?utf-8?B?S3NuY01TNm8yendBVXFyNTUrZVB0TFQzT2xjcUg1MGdCWXNPWlI4M3JVZDNY?=
 =?utf-8?B?SStBQ3QyZS9OZW9JbHZzeFVMNFZOazhLbDlFRXNrbW9pUU5Qdmt1MXBUbFdQ?=
 =?utf-8?B?R2pNWGxNMUExMWJmYVc5ODVCZ2d2S0ZHYnpYVFZ6Mml2L1NRSXFtTlBYMWFQ?=
 =?utf-8?B?K2E3ejllT3JCSko3aTZTWmEvTmVvWTR5OThtdGp2Q01OTVdLME9CM2lRR2ps?=
 =?utf-8?B?dzdLTlNhRE50b1kxUkhVQS93MmFLQ1JlMGgxODh3NkplQ0p0SnFZelZmQUc5?=
 =?utf-8?B?TlZ4ckJMUXdGZHpxV0FRVGozczJDdHlMQzQycFc0L2h2WUtnVlBWYUYzQ25v?=
 =?utf-8?B?cjluRWk2empNVENRYXRpU0FOb3VETjBDSTVTbU56SnhMdE1uMTdUdFBMOG5J?=
 =?utf-8?B?V2pmbEZWY01kZUxDL1pKeCtkYjgyN0NrSlFQWUZiTnhBMUJqQWJkeWFINkJ6?=
 =?utf-8?B?VnB5SWVjYVYweTNIakRSRmlTeHlrZHhTUG1QWTJqc0lFNjEzSmc2OW1UYkxO?=
 =?utf-8?B?SHpzd0dNd2ZsZyt3aDV5M2NqeU5PTWlMakZEUC9nM055QWp6bXRFZGtoOGcv?=
 =?utf-8?B?VXJlN1JERUFtQ1c0R0dJMHRLYXlsSnQrekI5S09LaitZNlYvT1o0WHFrejQy?=
 =?utf-8?B?amVnNVMwTVoxZzA3TnVkaWZiZDNlbmpJUG1vZ2xKenZ2UklWY0lQMko0Z0Qv?=
 =?utf-8?B?dGFPUm1IeisvYVhQS0tqd2JqQzM5TC9hZERHckF4aWhJZnFzVzhSQW9LaERv?=
 =?utf-8?B?eFVwcE9OY0dOaHA1aFM1eDNrbXNNQkVkVlVZZWZaSWhtcjFJRytKamx5cXE0?=
 =?utf-8?B?eGVkTm1seHgrSENFcVJvZTJ2Mnp2V2hwb1JOd3BuVHE1S2x0VmdIcG51SmlX?=
 =?utf-8?B?dmxyblowSWQ3N01yYms0dDdiZE05QmIrSVFKYksvN0p1NmRsV0NKdDZualVv?=
 =?utf-8?B?VnFvNVN4UzhlL2hvMW5EWXkvWmtGcjFMWHU1ZlIxeXFMVHA3QlphWWpjTnVq?=
 =?utf-8?B?VlRLK0VvZ2Y3MXNOOTEyRkh6Mzk2dEcyYTNhbHRtdWpwZE4xR3U0WnZoaVFl?=
 =?utf-8?B?R2JLam8yV05uQTh6M3h3VE0wY1E3OGVCMmhwVWxKVys4cGpxY1FNMjVvNGNF?=
 =?utf-8?B?Y1hBdW5HUndOSlZjb2JNU3p3VzlkbFBrT2kybVN4UTQ5M1AyUW4ycWFsTytt?=
 =?utf-8?B?Vi9zSDhQUk1IYzlsbW1QdENPTG5WVGRKNWE3QVlnVjZHNW9SaU8rcVFKVTdO?=
 =?utf-8?B?TlZqVGxka0s3RTJPcmR3alAyaW5nc3BYajNBS0JSTndnc1RONFJTcVBaNHVX?=
 =?utf-8?B?aE9KZzFLY05TQ2pCeHVqQkQza0xtRTBjQWdkWGtIUitpVEE1aE8yWU8rcWIz?=
 =?utf-8?B?dVNDeEY1YnFXeWE1WVd4WVQ1b3VpOXlaRzlXVWdPMWphNUgvVlptQmEzbTVO?=
 =?utf-8?B?SitZZkFqbW5pWjlaTVRBRVZPN3JseVRvSTVLR25DUjdvcDh1ZmJDOFhnUVRW?=
 =?utf-8?Q?X8nCP0Ug6rJ69?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU9EMElQTW83Z2VJOEJZSVNZSGdMU1kxZWN3Z1BiUTk0T3VLaGpDbW1CWDI4?=
 =?utf-8?B?WUVsVm1SY3N3SHZTMHFRV2VZOHF1YXJweWhMcldIZjRMZVBwckRkOThTTEl3?=
 =?utf-8?B?TFpGV3E2RW5FckdES2JER0VZbXB1SXdnaHFxV3ltY1pjZ2FWTzdySUR5NjFW?=
 =?utf-8?B?UWhJRExYR0MrMHUwM09qS3BPZEVDMWp4NDUyY0d0VXloNzRGbXU4Sjg0ZVV1?=
 =?utf-8?B?TEJKeXZoNkZTbE1IVitTZ3FJd05weTFuaXluUzRYRjlaV2hQU2thL2JzdTRD?=
 =?utf-8?B?WkF0SmZxZHpmMDl2aEZUUktHRWtvanF4bmEvZk5wc0tRUFJVWVRZWi9KM0NE?=
 =?utf-8?B?TGZIVGtISitLK0ZEanY4emlUMVUyQVorOFozSExzN3IvRlB5NzkvVkZjVm1B?=
 =?utf-8?B?V29qWER3SFJNY3lPUUpkSDVrTVVOSFF0SWxDcWFMRUwxcFBHL2Q5QjYybmQ3?=
 =?utf-8?B?YWR1WXBmemhiY3QxYUxnaVVVaTJWTm0yUnU3cms5WUs0RnlQTXh2TUc0Tkwr?=
 =?utf-8?B?a2gyaUcrU1JBdHJSY1hVenFvRXVia3lTVUlZa0R1dEF3S3UreGxxaTY2R2Ro?=
 =?utf-8?B?U3k2T2M1U3RhQkNoRWwxK25sQXZ6VW5tSkNuSW5lZVo2Q3VwZXFWOU9kV1Fk?=
 =?utf-8?B?eWhOeW1QNndOVWpocTFCZmREdERKUTd3Ujh0WXRIWGJTKzMyM2tDNTdCc25B?=
 =?utf-8?B?WlRodWJpcXZ0UTZ1cVQrYlowRVlkMUR1cVNDbkh2QXNObUl1NU9WdEdnMm1R?=
 =?utf-8?B?SEh4Z3lvOHorcSsyZGdvOWYyZy9mVytvZ1JSc2poNDZETVJPSCsrYXZUb2hL?=
 =?utf-8?B?UFd6TG0rQnN2ek9tNVMxbklEVXowbWFqVk5LL2xkNUtQVUtjMVl3UUg0ZmpW?=
 =?utf-8?B?VEZFL1kyQmV2Q3BPRlZLbmNYOG1KVHQva2hpWmFrWXgyMEJKcWJsV3paNGpv?=
 =?utf-8?B?bjVZWVpoQThHWkM0Q1FHbEZJS2FzY2duMCs0YmVMNUhidm9ESEY3Z2U2WjRj?=
 =?utf-8?B?Q1Y5K2c1UTJydXRKQ0FXRmtrLzVBczdaU241aVVZNUU0RXBxRExBWnlnWXRE?=
 =?utf-8?B?R2NoMURmTFFPd2ZBU0M4YTlpUksxa3JtcXpMSDQ1QmxzUFVkWnhvMFZnWWVV?=
 =?utf-8?B?QVNOSklwaEY0MXlPeDBLc20rY2k0Q0pLWjkrVlJrWGpwVGpKallzK3RwQ0lw?=
 =?utf-8?B?RlZHWWRvZUlGWFNmUDNOZzNZRHA1RGpEQzZLbDlzTDd4TTVuVkJhMThEbDB2?=
 =?utf-8?B?QkhLVWpUbjd5VnBkdFZJb1BKSUc2ZzdNcEVHZ1cyRENUcU84V01RVFd5ZjNJ?=
 =?utf-8?B?aU02RVZseDNXZTJUdlpRSzNUMHgyN1dZZkoxZW5CZWV1eVVkbkRRSllYMDRC?=
 =?utf-8?B?eUJkSHdSSEdwQjhSeFhUN2I3aDJGd0l4NzNvOUVhd3JmdTBIY3JjUUxhRkNP?=
 =?utf-8?B?Y0hncTFKZmtNejFXTG9iV0wySC9KOGpsaFFOUlNOa25QUTlkakVvUXBNRFR1?=
 =?utf-8?B?a0FZc09rR0VVSUZ0cldpUGhWM2tiRzJiNW8wazZaQkV2Q3QvdC9lOG01bTBZ?=
 =?utf-8?B?MFo4cWE1cGpXSWlveFdMbXBKc09ic0NEZzFOMC9qZ1IwaTJEaGtpR290RXUv?=
 =?utf-8?B?aWNxSG45RjZIMTQ1Ym14MEZ6MllOOGJvVkh6YllJemVVMFcrbUhvNG9KbmM0?=
 =?utf-8?B?V3NtNkF0VHBsc3lhalpSbWhvVXRCM3A2cDJWM1pReEJoTUZoN1VoS08zN2Q2?=
 =?utf-8?B?eCsyQ2xGdk8vTEd1a2ZoTXVVT01TZ3dLU1g0RDFqbGlPRm1NQWlVL3hsd1Fa?=
 =?utf-8?B?UUhSVTlHQ2NwZ0FxMk1NUVVlUmJoYnBQc3RkWXJmeFpNa0NqQmI0cWhwVHJO?=
 =?utf-8?B?eXAzMlpJUjBWcEdONU5FR1JleVBNREhTOHRyN29vcm1YQUJ1Y1M2d2ZLb3Ar?=
 =?utf-8?B?ams3YUkveHBYRXY1TXRFOGhZZHJ4WXRlTklScDhienkxdGp3cUx6KzhlSk1Q?=
 =?utf-8?B?MHhOSFgvWHVzUUFjU2dHQXBhMElaWURGZGlHNDBodmRzaDNGQzlySzZJUnFj?=
 =?utf-8?B?TWV4KzMrS3FNVFVjeUpCR1lJU0p0UU01QmtneGNmWi9RdHlhaDEyRnRlaG1N?=
 =?utf-8?B?Y1FPb3dJVkhyc3E0bTZMVHd0TDI2NE1HanFIczVXR0kvY2JCc3VrcEpWcDFu?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 200821e4-4dab-44c7-27e1-08dd396867a2
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 15:37:53.5527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zT0jwW+XF9rcNm8FfYXnTOfBSD8eXWu39pC9Gi18A+RxUbF71wlc6LRbM2do8plGd+eMZxFikzagyK+1kwT/PWR3t28c8hV+OCY3bj9nrxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7883
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

On Mon, Jan 20, 2025 at 05:58:35PM +0530, Satyanarayana K V P wrote:
> Use the kernel fault injection infrastructure to test error handling
> of xe at enabling of VFs stage when executing xe_guc_ct_send_recv()
> so that more code paths are tested, such as error handling and unwinding.
> 
> Error can be injected using:
> igt@xe_fault_injection@enable-vfs-fail-xe_guc_ct_send_recv
> 
> v2: Updated guc_fail_* to enable_vfs_*
> Added igt_skip_on(!igt_sriov_is_pf(fd)) to skip test when run without
> enabling sriov.
> 
> v3: Fixed documentation build error
> ERROR: Missing documentation for igt@xe_fault_injection@enable-vfs-fail-xe_guc_ct_send_recv
> ERROR: Unneeded documentation for igt@xe_fault_injection@guc-fail-xe_guc_ct_send_recv
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 63 ++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 3a0e2aa29..81ecc1131 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -19,12 +19,14 @@
>  #include "igt_sysfs.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_pat.h"
> +#include "lib/igt_sriov_device.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
>  #define INJECT_ERRNO	-ENOMEM
>  #define BO_ADDR		0x1a0000
>  #define BO_SIZE		(1024*1024)
> +#define NUM_VFS		1
>  
>  enum injection_list_action {
>  	INJECTION_LIST_ADD,
> @@ -281,6 +283,55 @@ vm_bind_fail(int fd, const char function_name[])
>  	igt_assert_eq(simple_vm_bind(fd, vm), 0);
>  }
>  
> +static int sriov_enable_vfs(int fd, int num_vfs)
> +{
> +	int sysfs;
> +	bool ret;
> +
> +	sysfs = igt_sysfs_open(fd);
> +	igt_assert_fd(sysfs);
> +
> +	ret = __igt_sysfs_set_u32(sysfs, "device/sriov_numvfs", num_vfs);
> +	close(sysfs);
> +
> +	return ret;
> +}
> +
> +/**
> + * SUBTEST: enable-vfs-fail-%s
> + * Description: inject an error in function %arg[1] used when xe interacts with guc to make it fail
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_guc_ct_send_recv:               xe_guc_ct_send_recv
> + */
> +
> +static void
> +enable_vfs_fail(int fd, int num_vfs, const char function_name[])
> +{
> +	bool autoprobe_en = 0;
> +
> +	ignore_faults_in_dmesg(function_name);
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +
> +	autoprobe_en = igt_sriov_is_driver_autoprobe_enabled(fd);
> +
> +	if (autoprobe_en)
> +		igt_sriov_disable_driver_autoprobe(fd);
> +
> +	/* igt_sriov_enable_vfs can't be used here as it is causing abort on any error.
> +	 * Since error in this test is expected, we have written our own static function here.
> +	 */
> +	sriov_enable_vfs(fd, num_vfs);
> +
> +	igt_assert_eq(-errno, INJECT_ERRNO);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +
> +	if (autoprobe_en)
> +		igt_sriov_enable_driver_autoprobe(fd);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -319,6 +370,10 @@ igt_main
>  		{ "xe_vma_ops_alloc" },
>  		{ }
>  	};
> +	const struct section enable_vfs_fail_functions[] = {
> +		{ "xe_guc_ct_send_recv" },
> +		{ }
> +	};
>  
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
> @@ -335,6 +390,14 @@ igt_main
>  		igt_subtest_f("vm-bind-fail-%s", s->name)
>  			vm_bind_fail(fd, s->name);
>  
> +	for (const struct section *s = enable_vfs_fail_functions; s->name; s++)
> +		igt_subtest_f("enable-vfs-fail-%s", s->name) {
> +			/* Skip the test if not running with SRIOV 
> +			 */
> +			igt_skip_on(!igt_sriov_is_pf(fd));
> +			enable_vfs_fail(fd, NUM_VFS, s->name);
> +		}
> +
>  	igt_fixture {
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>  	}
> -- 
> 2.35.3
> 
