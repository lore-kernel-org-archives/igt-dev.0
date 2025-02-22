Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F9DC021B3
	for <igt-dev@archiver.kernel.org>; Sat, 22 Feb 2025 01:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B86F10E1A0;
	Sat, 22 Feb 2025 01:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSPXzrMa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74FB10E1A0
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Feb 2025 01:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740186771; x=1771722771;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0jPL2z+SklEyjUoWxlCUMScdEYNvk5taoabwib9e6aI=;
 b=SSPXzrMakEO2LJhnd1LncE9bBChHYIgnqDaDkG4EBnfqa9so/09n1Xqh
 2izIhZLpCJWrRhQ6q19/I40gvs+QI49rA/K5e/ddPHsOd/Rltvo7kADht
 NWRRGMdoIDAIiZmMuwIVd3TfY3mWq6QrhZv3nwz0ORhQz4ul6ASpwFY7M
 8gtXo60DJ3NTzrU7gRArbW1r9tXrDnc8JAEt0QqaJRaw3vavx5VmstK0c
 OgTwPJo4FEtXExWWI4LVTHdCwepjT5wwDuPniPSGRefiUwqH7a28tpz4t
 KMVtgxVVCzG323w9SvNj3GYvQQlcrRyxPhpQF0BBN634Q7qrPpTnGbcCV g==;
X-CSE-ConnectionGUID: 19Hjbm4nTSql81+DJib9WQ==
X-CSE-MsgGUID: Gno0cpGLQv+HN52zNdtyTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41221847"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41221847"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 17:12:50 -0800
X-CSE-ConnectionGUID: wn6PpA3VRTON+cIwUkgzIw==
X-CSE-MsgGUID: iTe07Gr1S560s4TMLx+i7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119637955"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 17:12:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 17:12:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 17:12:45 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 17:12:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwBfiKEiUlhh0o2CQocpnsZ2qGCePtUTN3/DLxO2lzsL9txDsCQPtRA/RVQRJeVUznWgt/ow82Vkv1sQIyhH/j1b9CF1Qgp0DDqtkMLKPFX3pdJ1XItehcVhTbMFuRgcCxP6Gpjpgat2VE8/7Shs34o/f6t1Bhzjd3nfBK1xHeE+WeOS8sM9aqfBqhPFIbGT9Y/Mbw3R3sMMofkkxZysmiFj3FaVTPKh7keucYGGlqiMxwkmwowNBCVC3KDatpZW7MN5xwennicR9eRt4tKUhKsO6P11R8L/3FziyvsdSDH6mjovpRxUSABdeNRnV0fTROLTBpGU/I0N3RTEY9mpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/Bpd+xI9n2+ov7cOt1Owyc79ZaxocdHeTxk7OBNcy8=;
 b=mQCUAreLaNBI0Nk9FVq0EeyGZJgLQc5w0MPuBcNV7tFFblVLlmpP/4A3K8i8ZpfSL1Mgpk4iGjb2VU2M8spjj3opfZasXjE2Ht8Gm8j4+hPvotUY79PoR3t14TQer1dGwUkEJjpvJu9efdE8piC+ItoJXClNxKUb+CsuaBhw5QZkqw/euODaLGAHEDFTdV3DfDP4iJTs58eqASfDSNUYAxOLLbxuVa/hl898VN3YCvyNr2HptGyoR2dHdQTURU+NWtvGcSJUt7kNSmW0g+tKD+sM61RkO3qRt1iQW5hKQHiTlvu8PsKfeDSXYLeUpNNNUPbSRr9PXvob18xXsSQAsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Sat, 22 Feb
 2025 01:12:03 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.015; Sat, 22 Feb 2025
 01:12:02 +0000
Date: Fri, 21 Feb 2025 17:12:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 09/13] tests/intel/xe_oa: Test oa buffer sizes
Message-ID: <Z7kkYPcIIHoYnBXs@orsosgc001>
References: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
 <20250215010628.1639986-10-umesh.nerlige.ramappa@intel.com>
 <85seob14qa.wl-ashutosh.dixit@intel.com>
 <Z7TVJuGk5lgHciFy@orsosgc001>
 <85ikp2omz8.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85ikp2omz8.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW2PR16CA0032.namprd16.prod.outlook.com (2603:10b6:907::45)
 To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: cf6b3c9f-c2e3-445d-21a9-08dd52ddea00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGxvRjlwYjVqZ1VZMzc1OUVOdm56SGhEYTZMVDdtaGxzbC9ua1AwbHFuZWhK?=
 =?utf-8?B?MXB6QjhmQnpkaCt3azhNRHdXV2VhL1JEYytCTmVzUHpYaEFudzdsOEVSbjB2?=
 =?utf-8?B?ODJzcDhjTm5DUkQvbFZsekhxa29RMmlmWFJkd01yb01tMmVMUHRERWN2U0ZO?=
 =?utf-8?B?L2p0UUluTDdyMDRsbTQwUlFWWmdYNmpsTDFYaWNCL2ZVWnNoTmo1OVp1NEwx?=
 =?utf-8?B?RWJZcjBRR2wzOHluVmJ0bjVBZ0cweG9JdHEveGdWWkxvMVVBZTFEN0k1eW1i?=
 =?utf-8?B?ei9xU0lncUFZYVRDNTZRUGhXTG1ndEczOWhlc29mSnpTa2lmQVRzRFJ1djk4?=
 =?utf-8?B?WVpqQUdBdGNwem1lcXlvczVQLzF5cDRGUnlTZkdVZmlsS3JwQUIyRVc0VE91?=
 =?utf-8?B?eE9UVVBEZURQTkEvWkF1QTV1aE1hTE9ZWTZJTU80SW1RUTJPSHlYK1V6SXZF?=
 =?utf-8?B?UEw4YmlVa2M0NkJrRE05SC9Uc1ZuRUpsWFlZQ0ZjVlFhNjIvbjlZdEZxMWNU?=
 =?utf-8?B?dytBUzg5QU9tSitPVitMdi9tbVhsZ0lyc1c0aldFakFTKzlib1U1UHVqelQr?=
 =?utf-8?B?N2hUMy9obVQwUFZSVVdzT3dkc1JndlZKUjdjMUJaMmt1YTdwTFhnQmhURDdE?=
 =?utf-8?B?V0NVSkU5NUxHTlVYQTluUVlVNDFhUldCNUxuSWtHV0pPSXRUSmVpdkVlQnNa?=
 =?utf-8?B?YjlrMUpVZ0RCK2RjdHNsTVUyUjBOeEk3a2ZFeS95MjVUMEs3b0t3c1lSWkov?=
 =?utf-8?B?Y3ZyaDgrQ0U2N3hOMUhPeTExWjFVRTlmYndOaVdwVUhZUFpsOGlTMVh6VS85?=
 =?utf-8?B?ZFBhUkU0dGorc1h4bloySTIyQWY5c0pqaHMrRjhRN2V4d2pjMHJNcnhpVkkz?=
 =?utf-8?B?VzIxRHR3S05EQUFscjRGSC9Gc0p5TkZMQVFDeE1BOW1OUi9WSXZxY2VCV1dM?=
 =?utf-8?B?YUJ1VFRiUFQ2RU1vQmRvV0dWY3VIVCtIQURHZWQ4NktXQitrMU5NczFMVzN3?=
 =?utf-8?B?RGY3TkY2M3d6OVRXYjdWbGx3QytCTEdxM0N4T2t4U1JnamN1MlNoYXduMXNr?=
 =?utf-8?B?UU1WYkRDeUU5RkNRdVg2TzhNWmFHdmVLbHZyMlRsQXpVTmRsdlpIWVNISjVH?=
 =?utf-8?B?VmVpZGF5NDZDRCtFb21GaktnSUVuZDRodEdVZUcvK0szSnBjWEVJdlphZXlL?=
 =?utf-8?B?MlFnbWU2ZGt6RCsvcWFzUGhncURJaEtZZVU4VkJpcloybGZjclI5Y1RjdSt6?=
 =?utf-8?B?RzdvK0RmZS8yNGc1QWtTcDlXMTJRRm5lWWk1VnpNQWN2N3l5eGcxOUFGOVRm?=
 =?utf-8?B?NVdZeWRtN29FK2pWc1RWcjZoN3FKZDdhanJJYS9odThHNStnVEFSd3NkK01s?=
 =?utf-8?B?V3RFbXBRZFhaQ0pIK2FPYmlKS21WVUNnSU5LbkNQWU1vNUtNY2lFblgvT2F5?=
 =?utf-8?B?Mld0djdlRkt5QTdSang1WHhqSkpMMGlPcERnQkVLNG9jMGtGakZjMGtzdkwx?=
 =?utf-8?B?a1FCeG1rVHRRWTgxSE5XcC9abExnekNIWXdQeVRQd01JZ01Ba0RIUlVnVXZ2?=
 =?utf-8?B?NVFtTHN6THRXSGhaT1lQU2ZtQkppSHR5WDJFREUvWlM3dDVwcWQ2amUwRmlh?=
 =?utf-8?B?RldKdEhlOHc3STBSSTFiYU5hWXhyRTVKdUs5aVBTTjJFcnlRbkZVdXRTVEM2?=
 =?utf-8?B?NDFCWnQ5cWJBZVRyU1c2UlZzRnhtVExKcCtnbFc3VWczTXcrVzAvMXc0RlM1?=
 =?utf-8?B?SStzL1NiQ2tBODlvZ2xWeDNoMkUzTGtFOTlhSXhrSmJLVDMwdWllUHZVZG8z?=
 =?utf-8?B?R1dCRU85Tk9lUXdDaDRLQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a01IWVczVGV0ektNK21RSy94WWdZbUJOVTE0VG9VRVZxcGlzWW9wblRNc1gy?=
 =?utf-8?B?OFRFeTVWNFpyRXMwWTl2bGFhamZwL01LVW5IU25JQmJzUkFkNnpkSVFZcUNx?=
 =?utf-8?B?Qk9YQWhJWnBxSDY1RVMrNUhrSEgyb0FxUWt5NEZTTFNMdmNjZGo4OFNLUEZn?=
 =?utf-8?B?OCs4ZVpLMGNxWkpDakRtd1VPSlh6bjNna2JFVUVLVnhKMnFaUEl3cnU3SXMw?=
 =?utf-8?B?MEkxZ3N5NDZ6NGpiTVUrTWFhbTFBcFdJaHFzcC9HbG5oZUVkU3pBdjgrckNP?=
 =?utf-8?B?OHVNWlNkNHpnSDNEZmRjbVdGcHhRcE5iUE1wZ0JUUzJ0VDVMYUlKRUZTZHBx?=
 =?utf-8?B?aGxRT1UxeUt3dnZnd2JLdE9JejQ2c3c2MjNHdnppTDlkRkRuVEo0dklLbUtD?=
 =?utf-8?B?c0FoTjhhMHljakZOOEFqMVdJSDBNV1RabDYzK0djbEJtMGI2MFdMeG14Nm9U?=
 =?utf-8?B?WE9wY3ZBdTVWZzlTMExjQ3hnWW8vSFg3MVNVbS91WktsbWRJamQ4UlJCbGJE?=
 =?utf-8?B?TmE2L21YUFEvMjc2d3lWZFZHL01UOEhCeU1mdC82akNrQlpuYTZNVzhtbmdE?=
 =?utf-8?B?cS9MV3ZrYnZXYlpFVXplVU8zb3BKZmpIMFJOVk1Tc3ZwckQ1ZE4zVklTOE5w?=
 =?utf-8?B?d3NvbmRXcWE3MUZvTW9uREphdDhOZUIvS3RITlF5K1RKeFJ0Z1gweXN3TlpP?=
 =?utf-8?B?Tm05SDRVT1M1YjlSUHBHcEU2ZzlkSVpuNmI2TGUvMkhUNkp4VzZRclFHWkJw?=
 =?utf-8?B?d0ZJR3RwaE9hVFkrUXdaSDJnc2pFZWd3bGZNZHdlWUtrWmJQQ1I3c2RpS3Nx?=
 =?utf-8?B?RFVWNmhITGZXUjVCZ2VNWnQxQk8rOHpPQUZGSnNmelgzTW50bXFGbS9kZitD?=
 =?utf-8?B?ZHVRSnhPOFk3aHFSaTZleVJFQ1ArdlVrK3dyMjYzeVdHWFV5bzZib1laTDlN?=
 =?utf-8?B?Z0c3Y3F1RzREaFlyK296QU0rZVRsUzRtR2ZWT3pHRjZKajJEYjNQL05ESERU?=
 =?utf-8?B?clpYRDVVQlBQb21BU05nL1ZUekVzR1VKQWttRUc2T2g2dEdMczJ6YkVoQ1Fu?=
 =?utf-8?B?bnEvSGZOSEpHQUNJd3BpZy80QjFtS1BTMlJjazZvMXlkbjErUmtFc0RaK1hj?=
 =?utf-8?B?bERNSnVCVWdlOTVZcE01ck5jVjVSS0xoT3J2MHRnejdZVm9ld0c4dGtHS09E?=
 =?utf-8?B?MzdCejlBUDJBTEtzQ2V2anNmcis4a0ZjNzUrZXd0SWtPYk1xZFoxckQzaTdr?=
 =?utf-8?B?QTB5eVJZc290eFdOTFlPcmZ6c2V3QUlrTU85RDNuQmhpSXJCaUkrL3NTVFhn?=
 =?utf-8?B?MmNXeE1HV2J1Zi9EczRVbGlvdVV0a2FBcjZKeVZvUHM2bVd2TWZLb2VOYlJs?=
 =?utf-8?B?SWdwazVlTEFkUjk4OFQrUUxxRm5KSWppTzJsMXNkaFFUUm44WktvenBiaHEx?=
 =?utf-8?B?clVXdnliY3ErWUVvaVZrSzN6a3JQZGhwY0RER280T2J2R0lqSXBwZ0N1V2p1?=
 =?utf-8?B?NWhUVW5TMGM5Q0h5RUZmQm9wdUFoN0lJRkhQSFlDVWtrRmE1R1hHSG9hVUVs?=
 =?utf-8?B?aTA0aHhTQ2x2Vzl5MW5JZFk1Vm1BTDdiOXZ6VnJvUk5CU3ZkdDlkV2N6aFND?=
 =?utf-8?B?Q0hSM1JLbGxRaHB2blZ5MGt0cHdxSmFGbko0NlNZNUVtOEZsNDlWSVdzSE9E?=
 =?utf-8?B?Z1g2dWZWYzRYdWRGc0RvS21zRFRBZDVOMUhiRWZYekxXakhzLzJqd2ZKVjVY?=
 =?utf-8?B?YjdnSUxpQzhOMyt3VGp3SGphdkN6OE53eHp5Yk1jL2MrMGdTRUxlTXRBTEta?=
 =?utf-8?B?TXlYTS9va1lKS2xoamdtNjlLSGRCNTFwMHFxU2FZaUlrVVBRbmxBcS9vQ2xV?=
 =?utf-8?B?NFhuRjdYSEM4d0JhNzhoalJGRnpJdmZJZnhSRzBlVDFFcFRNa0xpUjlFQ1hB?=
 =?utf-8?B?R3hmazZSWGVsbTV4Y05XTkVCc0xka1pVUnE1Q0NZU2VtZldSMXkvOTZmRVBs?=
 =?utf-8?B?TEFocEV0cTZpZmlZTHNGQVBmK0lvMFIvQTREbkVmMDBmMkVLYmNTY29GdlVX?=
 =?utf-8?B?S3l5aHNvV2VpdjNVMU56dklGU1g0aEFTbythNG5JT1l4TFI4TXZPcDhxZi9V?=
 =?utf-8?B?LzhmckNPUmtwSjV0bGcyc1RPeXZmT2h2em9DcWNhR3A2Um03R0U0WVNheVR5?=
 =?utf-8?Q?nBD7SR7pPqqGl+WhCr7tChQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6b3c9f-c2e3-445d-21a9-08dd52ddea00
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2025 01:12:02.4762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fW25UVhZGhlUST0TmoUsdAjNxWG8DeEDnZpJimEk3qtiAkGtCxJ5Qe4wvt2IB/5e1epwntPLlANL88vZwC8VNzQ8X29QIc1NVwRVIy5xlG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
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

On Fri, Feb 21, 2025 at 04:13:31PM -0800, Dixit, Ashutosh wrote:
>On Tue, 18 Feb 2025 10:44:54 -0800, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> On Tue, Feb 18, 2025 at 10:34:53AM -0800, Dixit, Ashutosh wrote:
>> > On Fri, 14 Feb 2025 17:06:24 -0800, Umesh Nerlige Ramappa wrote:
>> >>
>> >> Introduce oa buffer size test separately. Pick a random valid buffer
>> >> size for the test.
>> >>
>> >> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> >> ---
>> >>  tests/intel/xe_oa.c | 30 ++++++++++++++++++++++++++++++
>> >>  1 file changed, 30 insertions(+)
>> >>
>> >> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> >> index 03d223df4..ee87b7338 100644
>> >> --- a/tests/intel/xe_oa.c
>> >> +++ b/tests/intel/xe_oa.c
>> >> @@ -93,6 +93,23 @@ struct accumulator {
>> >>	uint64_t deltas[MAX_RAW_OA_COUNTERS];
>> >>  };
>> >>
>> >> +struct oa_buf_size {
>> >> +	char name[12];
>> >> +	uint32_t size;
>> >> +} buf_sizes[] = {
>> >> +	{ "128K", SZ_128K },
>> >> +	{ "256K", SZ_256K },
>> >> +	{ "512K", SZ_512K },
>> >> +	{ "1M", SZ_1M },
>> >> +	{ "2M", SZ_2M },
>> >> +	{ "4M", SZ_4M },
>> >> +	{ "8M", SZ_8M },
>> >> +	{ "16M", SZ_16M },
>> >> +	{ "32M", SZ_32M },
>> >> +	{ "64M", SZ_64M },
>> >> +	{ "128M", SZ_128M },
>> >
>> > Would you have the running time for these? Hopefully not too huge for the
>> > large buffer sizes, even if we are running just one of them? And what about
>> > slower platforms?
>> >
>> > That was the reason we restricted OA buffer size to just 16 M.
>> >
>> > This is what I measured here:
>> >
>> > https://patchwork.freedesktop.org/patch/627269/?series=142128&rev=1
>> >
>> >	$ sudo ./build/tests/xe_oa --r oa-buffer-size
>> >	IGT-Version: 1.29-g724fd0b79 (x86_64) (Linux: 6.12.0-rc4+ x86_64)
>> >	Using IGT_SRANDOM=1733459091 for randomisation
>> >	Opened device: /dev/dri/card0
>> >	Starting subtest: oa-buffer-size
>> >	Starting dynamic subtest: 8MB
>> >	Dynamic subtest 8MB: SUCCESS (0.403s)
>> >	Starting dynamic subtest: 32MB
>> >	Dynamic subtest 32MB: SUCCESS (1.595s)
>> >	Starting dynamic subtest: 128MB
>> >	Dynamic subtest 128MB: SUCCESS (6.326s)
>> >	Subtest oa-buffer-size: SUCCESS (8.324s)
>>
>> I can run 128MB and see how long it takes. I guess I didn't hit the larger
>> buffers on random runs.  Technically around 30 seconds for 128MB buffer
>> with 20us period and a 256 byte report. If report is 576 bytes, then 13
>> seconds. As long as it falls within the IGT timeout period, we should be
>> good.
>
>To do a quick regression test I frequently just run the OA tests locally
>with:
>
>	sudo ./build/tests/xe_oa
>
>So I don't care how long CI takes to run the tests, but for me I want the
>each test to finish in ~3 seconds tops.
>
>Though in this case, on LNL:
>
>	$ sudo ./build/tests/xe_oa --r buffer-size
>	IGT-Version: 1.30-g71d723c60 (x86_64) (Linux: 6.13.0+ x86_64)
>	Using IGT_SRANDOM=1740181681 for randomisation
>	Opened device: /dev/dri/card0
>	Starting subtest: buffer-size
>	Starting dynamic subtest: ccs-0-128M
>	Dynamic subtest ccs-0-128M: SUCCESS (2.959s)
>	Subtest buffer-size: SUCCESS (2.959s)
>
>This seems to meet the 3 seconds criteria so it's ok.
>
>The big outlier is this one:
>
>	$ sudo ./build/tests/xe_oa --r buffer-fill
>	IGT-Version: 1.30-g71d723c60 (x86_64) (Linux: 6.13.0+ x86_64)
>	Using IGT_SRANDOM=1740182998 for randomisation
>	Opened device: /dev/dri/card0
>	Starting subtest: buffer-fill
>	Starting dynamic subtest: ccs-0
>	Dynamic subtest ccs-0: SUCCESS (24.869s)
>	Subtest buffer-fill: SUCCESS (24.869s)
>
>which is definitely not ok and would need a respin.

ok, it looks like for Xe you have reduced the test times drastically. I 
did not consider that. I was just focusing on making the tests uniform 
in terms of the exponent used.

Maybe I will just use the simulation exponent (1000ns) for the tests 
that need to run fast so their implementation stays the same.

Thanks,
Umesh

>
>Anyway I should have other comments on the patches too, so wait for my
>review comments before posting a new revision.
>
>Thanks.
>--
>Ashutosh
>
>
>>
>> >
>> >> +};
>> >> +
>> >>  /* OA unit types */
>> >>  enum {
>> >>	OAG,
>> >> @@ -305,6 +322,7 @@ static struct intel_mmio_data mmio_data;
>> >>  static igt_render_copyfunc_t render_copy;
>> >>  static uint32_t rc_width, rc_height;
>> >>  static uint32_t buffer_fill_size;
>> >> +static uint32_t num_buf_sizes;
>> >>
>> >>  static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
>> >>  {
>> >> @@ -1094,6 +1112,7 @@ init_sys_info(void)
>> >>	rc_width = 1920;
>> >>	rc_height = 1080;
>> >>	buffer_fill_size = SZ_16M;
>> >> +	num_buf_sizes = ARRAY_SIZE(buf_sizes);
>> >>	oa_exponent_default = max_oa_exponent_for_period_lte(1000000);
>> >>
>> >>	default_oa_buffer_size = get_default_oa_buffer_size(drm_fd);
>> >> @@ -4805,6 +4824,17 @@ igt_main
>> >>		__for_one_hwe_in_oag(hwe)
>> >>			test_buffer_fill(hwe);
>> >>
>> >> +	/**
>> >> +	 * SUBTEST: buffer-size
>> >> +	 * Description: Test various OA buffer sizes
>> >> +	 */
>> >> +	igt_subtest_with_dynamic("buffer-size") {
>> >> +		long k = random() % num_buf_sizes;
>> >> +
>> >> +		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
>> >> +			test_non_zero_reason(hwe, buf_sizes[k].size);
>> >> +	}
>> >> +
>> >>	igt_subtest_with_dynamic("non-zero-reason")
>> >>		__for_one_hwe_in_oag(hwe)
>> >>			test_non_zero_reason(hwe, 0);
>> >> --
>> >> 2.34.1
>> >>
