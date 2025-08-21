Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ED3CA0EEB
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 09:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B9E10E2E5;
	Thu, 21 Aug 2025 09:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Coo6UBt7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C78010E2E5
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Aug 2025 09:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755769710; x=1787305710;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R2d9YwITjIOUSd/9UWy5AFMitYHwMzp4PJbonhFyrN4=;
 b=Coo6UBt7eNpL90qV/efGu8E3kVfqGJYDcklkicvk030zDdszp3gvSRkf
 MJ6UVZO6cr/5nHgGFIH3goUFMEIpU0+kAyxPU49oM/P55Gex+ViOHzlM3
 yk8AO/gOmoz3v74nJQulyLavqH70MJ2zuZoXshpdWzhoIVFwYBIZvlMsi
 wAj3S54B5x5u7jymCskjH2eu1l3jNccsmbuMPbRv+mocgVSkuxsk5vGO2
 28u+mJGokNihEwcTGFuuBoPbV4PZtM/0Kh/cdV4E/oPTit4pCq9ZGUfqE
 IOPxhHwGJij7ZTUmk5xTBTozFou6rb7kNgkU39IKPWtsKYRT3fcLhO6qu A==;
X-CSE-ConnectionGUID: Q0eG+kgXSYyg5HrJVB/ykQ==
X-CSE-MsgGUID: Jsw4D1z0T0yb9p+DbOzRkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57912462"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="57912462"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 02:48:30 -0700
X-CSE-ConnectionGUID: alX5Tqp4Sly2pwKFIEGbvg==
X-CSE-MsgGUID: RfsugUfeTo+NGteotXT5LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="192054572"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 02:48:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 02:48:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 02:48:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 02:48:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kolDXhrHST02EkW8VJleH5AEM5yoeGTlWJ+swDtJqD5yFp846szJAK4FkCWjX64d3F+7r26Z1KqUY5DTY7Cq0zoLnrO3GgPPXdVFGxW+1X8q/zaPiM5Y8NXYhaPcMjlasg11w9N3lYpn6KDrjG+Hu76cU+Tk8Ga5z++K7uAFFbLSlC7mxIw/urA+H88XSDK0Idt/URBu9f8J265bUOtkTDSJD7niYPzCQFTd/QShM6DOAdGLHvFvCwQx3RXjLSp6j3zm9Pgr+3MKf8ObinT+CtnQ7sPmeRtk/ZKsjPqPa2UA59kGWHw3RnLwsACrly0PrK2uoYA3GDXD8um5+LFeYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+JaSufXJOyYYnX8PTmeTHFAYyPkMTNwOGrjEZdyevY=;
 b=ogUrxxSM+omxCaBWykTj0jtx2+wOTvpvSjNh+hKW2PMqYr+3ksJ5x6xizcAbgNQRsrNQu3lHF0g27Mzk8KPnlFvgNyX4WHwaFRMgjExPinrlq8KE7Q35zJ8G3CRYzb8/6yfH0xJGP3r2EVkHWjhpHzoQOQNt+3MyEYYedMoSYSZnq7ZvCWV1oY6tE48nsQEYn7abOmgobfK+eC0wXz+ojxZknnFTdmbTUuwKa92MvBMkT3xiE6xoRiJP3nend6TFGaJr2PfMmMoXhDonoLKomJ4MTs6aLnCcp5ZvPvAcJ4oEeKcVklvsWTHTLCpjN4tj1esg8V3HOxbrwp2cIQ7M0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Thu, 21 Aug
 2025 09:48:26 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 09:48:26 +0000
Message-ID: <2acb6714-e2d5-4543-90a8-fdf8d6ad7f93@intel.com>
Date: Thu, 21 Aug 2025 15:18:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/kms_hdr: Set HDR meta-data while testing
 for panel capability
Content-Language: en-GB
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20250811075850.28146-1-chaitanya.kumar.borah@intel.com>
 <20250811075850.28146-2-chaitanya.kumar.borah@intel.com>
 <bf5410b3-cc19-4a16-8f59-def4e4c4a7f9@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <bf5410b3-cc19-4a16-8f59-def4e4c4a7f9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b194723-c53e-457d-10e8-08dde097dff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWltaDAzaUdjclpKZGU1WWljOWEyb2g5Y2U0MWVvV2R6YnZXZXhaZGZZWk1Q?=
 =?utf-8?B?UUNkTGdXazFiT0tFVDRuUHdxRVFBditNSEdjbVk3U0JBZmRvSWwxOW1VMUNQ?=
 =?utf-8?B?RzRQTDhIUXYyNmU5NGZKamVib3pYalZDOG5vditsOHk5VmZRcVBvVkdnWDlX?=
 =?utf-8?B?UzdKUjZSY1NjdVNPT2JTS2lFNkthdGtSc1ZhemtGUnJMUFVtRG1YaTBWd01y?=
 =?utf-8?B?am8yb0JIKy95QWw3eDlQTXc5Z2t5MHRLMyt6eEIzczJHeEVSMGNvR3J5cUNC?=
 =?utf-8?B?MnVmcGpOMlpKMUlSRFNoQklMcEJLL3FXUDVNSmJOUERlclJ0enhLeW1XbnBw?=
 =?utf-8?B?bHZITExGaW1rQzVxK2hWN2x0RTNMTzBKQnp6OWp4ZnRLZTRwY3dIT2pkaGgy?=
 =?utf-8?B?ZE5yODNpVEtGMXMrcnBnekxhNU9wcmMyY1A0Wk5xUEFuSVBRQXhQVHlnVEN2?=
 =?utf-8?B?UDBjeWRyV2R3UWZpZENLb1M3ZC9qRGtqaGx1cWpFV2FJV1BoYWMxWlVhL1VL?=
 =?utf-8?B?NmdrTGNXQklyTTY1dEJKQk84RXlVKzJJZHdRRlVCWCtYaC91SzV5bDV4Q2kv?=
 =?utf-8?B?WUQxcUhxSk9wUHMwc0JZa3VFM1daSCtNeUdkYlpxcDZ3SjJmZzMrd1BGbFZI?=
 =?utf-8?B?TnZzckV2SnZPWWNzWVlJczNMeUdFWk5LNnl6SnJPVU5tWnZ1NzhDZGlsZTNw?=
 =?utf-8?B?ZHJLekROUG5aZFhYdHY1Q0t4K0RpNFJBckR0a08vWE0zc3lHRjg2WGRBM3or?=
 =?utf-8?B?Z1p1eXF6OXNXWVFNWkdoT2lWZklBYWtTc3c0SHkrMi93VkZwNWJVNmNjaitQ?=
 =?utf-8?B?c1ZFNDlZNXVWSUM2alI1cElxejBkZi9ieG1MSVVPbEthTHhLak85QS9samlX?=
 =?utf-8?B?NHNyNE9JTUo0Rkdzblc4YllsM1NLbkZXSDNDV2FvSXM0cURRSmdBSVc2ZTBi?=
 =?utf-8?B?VWlVRys1NEJ6UkpmSkdwbitZVWFlc20zVVhuUGd0N3E2K0k3RldkOTk2V09j?=
 =?utf-8?B?UjQySWxzNWZEa0hNb3FydXBJSHNscXEyQkIzUU16ZW9rTEVYY1JtcWNjSXFq?=
 =?utf-8?B?cHI5SUNLM3E2VUVXQm8zQ3RobnNXU0pxNE81ckUxNjlYL2JVTXVaaWdzRlRE?=
 =?utf-8?B?VGZJamc4NTRGUDY5UG5UNTFUc1dMUlQ3UGFBbmtENVgyRnFlTThLRm9BWldN?=
 =?utf-8?B?azhBZWFkUGlYZjR0WnhueVRJOElrak01UnFzUXdzZFNiLzk2TkpLbmRRNFA0?=
 =?utf-8?B?cVhqeVFjU2ZOcnhCcVdOT2pBME90c1FVbEZ5aFlweGlpdGFsK0FRVUpDMHM1?=
 =?utf-8?B?QnVLZkw3Sk95by9ZSjB1TEpkalFJZ28xRGVyckJMTm9reDNUZzBvSEMvRnND?=
 =?utf-8?B?eXc4SmliMmJNQUlOOTVlWXU4RHJHbmxlWlJnVHJJaFh2QXNXSzVtR3RESVRJ?=
 =?utf-8?B?VVlQM25lWlVzcnVlZkhjYU5SNGRQVU03OFQ0YWNEWUllL2UxNE1nalZtSlZ1?=
 =?utf-8?B?UnZsZ1AwbEZjVng4RDVMcEpTajJLTmgwK0gvY0RnWXVBdmlEMUlZcy9lUVJt?=
 =?utf-8?B?c0EyUE9BUlNWd3JNMWFSMjdnZUtZcWl4dFJraHprMU5FdjFGdFoyTGtidmxM?=
 =?utf-8?B?K3pHTzl5a3ZEVkxWM3F1RWJTU0NtS0dhVTVIQ1BISzNnZ0pPZyt4RFdXTkVY?=
 =?utf-8?B?aWN4NzU4WHFKZ3lBUC9LbWRGUld1OVFDT3ArUkFSUWZlQzg5TDJjU3l1Mk11?=
 =?utf-8?B?bmZmalMxTTR6VVFRWDlKMkJzTnlkenRjTUhIQnNvTyt6b1dueDkvUWJHOVN0?=
 =?utf-8?B?UGRBM0lsSk9XZnpjd3N4cGNtcUFaT2Q0MENXMkxwOUl3eU85c2p6NlFIb1Fw?=
 =?utf-8?B?SllHZGdpK0UzT3Mzd29IWWpVYTYzaTJUcHE3NmQwU3ZKRGZWSGNzcVJJVEhG?=
 =?utf-8?Q?aem1TChwzps=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aElURUtaemZKY3FBREt3MHg4b0IwL3VkUHRIa0ZuZE16bDJDQmlWR0NBampS?=
 =?utf-8?B?Q0g5YlJEVWVNb3pPcVZ1ajdITmExallvNU8wc2hHZDZkL0FjbWJDN0V2bEFm?=
 =?utf-8?B?NW9zRzBjdjhBYzAwd1dhbzZFdUpERWMxZmpKRHowODJZVDFFMHNVMzRsS1Nw?=
 =?utf-8?B?OTRDQ2czQjQrVTRGSTlhUys2UTdkK2JyQTBzb1NvRnF1eHVycWxEMy9DMnly?=
 =?utf-8?B?MmdqY3FZN042bnNZV3dBUWVSQytGckRuTDlNekx2dHV5RHIrNElubzhMMFRw?=
 =?utf-8?B?YWJBQTgwcjVTUWtHeHNDRWcxMDltYUk2MENFamNxa0hGd1JNcnFrZjBvcGZ5?=
 =?utf-8?B?WXkyKy93Q21HVGs1N3RKRkZ0QnZuc25wbEtnNlVYVmo0ZWZXb0MxS3VYNGFr?=
 =?utf-8?B?QVpLZjlvOG9KN0RnM1BMdXp4VE55YjNGSTNwWWJMbWJwMUtuQmpJSEhNTDNM?=
 =?utf-8?B?MVZ4Vm54N0RsaU9OQy8xU0tBZy9iS2xFSXhBM3BhZmJjWjBvMUZCbDFGR3hZ?=
 =?utf-8?B?d3I0dHJFSnlLQnZwK0U5QUMyVDV0QTZEbXZtNkZoaEd3TWNhTUxIQll2T2py?=
 =?utf-8?B?bHFHMGNqakVxOXByZmJDNnd5RGREdFhpeUZCT01VRms0S0xLNmhCeDNKVnhN?=
 =?utf-8?B?UHRpZ1I4SjRFR245R1EzNTg3d1J6THBiSXphYmtobWREWUg2QllacHVRMjY3?=
 =?utf-8?B?VklLMDFqdno5QzJBSmpEMlFycnJSZjlaNGRMcENRS2RCTkMxQXpKWHJoODh2?=
 =?utf-8?B?VzdQdHdic0UvNjM0aUZycEFFdUNiUnprN1FZY2JVNm9MSGhKSWN4Uy9OUXpU?=
 =?utf-8?B?ZWs4Zkp6SFlRSHFFOWJLTlVQUXBlTi9iZ2ZFaWxQU0pWUTlHZFhZeUE0VWUr?=
 =?utf-8?B?RmYyM3NCVVZBaUJ0M3FXaGxweDhZSys1dzZ5NER2WnRZQjNNcHYvQTA1aW5n?=
 =?utf-8?B?V0JJUHZNTHN4UGE4bno5SGRqL0NBRHl2WXJ2SkNwRjhZL3VnQVNiTmUxeW9y?=
 =?utf-8?B?cWUwUVJmSitHYlJHMHJvaHNHOWkrOVB6aDUvM3pPbGxyRGJzaSttZC9UK1pI?=
 =?utf-8?B?QzQrclNORVhWM0hUSm9PUnl6NkwzWkpDMm9iY0FGQjV4OFoyWnlmWGpyb3R3?=
 =?utf-8?B?VWk4ZjIxVWhGc0NqbzFjT0t4SmJkemJHL0pPTkNKZ3RoS1VsbmFLVzNpalFM?=
 =?utf-8?B?eEUvZlR1NzgrQUU0citMTWt5a3EydTBOMDFKNXJTUG45dTBsa3V5Z2FiUktU?=
 =?utf-8?B?WHY0bXNoVitrZG4vS0o5VmU1cVNoekRGQ2RYUXFZRXpnOTN5MzFYRitYZ3Nj?=
 =?utf-8?B?SFpIcEMyemVOM25vc244ajRvWWtGY3h5SDVoR1pnMjF5YUh0dkZWd1lpMkVO?=
 =?utf-8?B?eUVVQ2RoeWxoUEpOeFJhZWJOK0xGM3VBNWtacHUzeWRsdXdHVW0xZmxJQURH?=
 =?utf-8?B?UUV6R0VPUDdJaklhVUxDL2JWRWs4cCtraHFmdVZOYmtuOUlUcDkyUGlRUzhz?=
 =?utf-8?B?RjZ3UW5pMS9XWjlXZnNKYURpc2FIUisxZXRMUGVBZGRkNnpOSEljc3N5TTNR?=
 =?utf-8?B?Q29Lc2dSQm1GZEdCTGxGN0cxazNpREFWOS9maXBBYWZjNjU0K0NzdkVscDFu?=
 =?utf-8?B?UDBlVG96Vkk0Z1VpeFNsNWR0OWJnUVJPdFFoRTRwUkNWRHZxQjErZGRLT3lL?=
 =?utf-8?B?elY4cnA4NVhLY3pPYWsyYVhpZjFuZDV3dWxWNGZjS08yZlgwVHd4L3NJMVgr?=
 =?utf-8?B?ZFg0S3pUeU1FRWZJN2tsTkZHWFpLRU5MTFE2WDIyTVJtRzAzaVBPSlVaUWQ5?=
 =?utf-8?B?YUFXMXgrVnd4L1AyWGtZdCtURU9MVG5GdDJUWkVkL2JSQVpIUlpJTzRxVCsy?=
 =?utf-8?B?Y1c2SHNCVGQrUGV6Y0lVWWlodkFRRFkxbzFuSUNuUTl0a0NpVUR1M2NvQXdi?=
 =?utf-8?B?Lzc4dEtzSDFCWE16QzIyeEVGU2l0SytmNGR3NDVyZnR6cWsyNktmSFBMTW1Y?=
 =?utf-8?B?ZXNHZTQzcy9GckNvL1lYMFBZUUxiSkQ0ZENkM1dKSnlZdW5PMVFpL1UzNW9t?=
 =?utf-8?B?bjV2L1BzS1JiOGVRMXFkSEJKZU1VQy85ckJtVlVWQzNTenZWZDI4N2dpMlhp?=
 =?utf-8?B?Q3FsQzErYkJTei9GTXNaVHNIek4rdGJJenNjYXdack44eU5SVzVCUzVGY1Q4?=
 =?utf-8?Q?9H0TlxiNOqmy6skxnL194mw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b194723-c53e-457d-10e8-08dde097dff7
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 09:48:26.1700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ertlsEQm3VrJ90+F/TDA/omQWdwj7GSLaD289sMoooueaDYgccKN5vYWU9RruyTQtrImq1BhCDtf2wADyVTw0IZ5w/gxDZjrXVDS9+Zi9a8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
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



On 8/12/2025 2:41 PM, Sharma, Swati2 wrote:
> Hi Chaitanya,
> 
> On 11-08-2025 01:28 pm, Chaitanya Kumar Borah wrote:
>> Checking if the panel supports a max_bpc of 10 is not enough to tell
>> if the panel supports HDR. Set HDR metadata on the connector before
>> going through the modes. Reset after done.
> Can you please add closes tag gitlab# for the bug which is getting fixed 
> (if exists) ?
> Also, please elaborate "why" existing checks not enough?

Unfortunately, there is no gitlab issue or public reference for this.

I will extend the commit message.

>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   tests/kms_hdr.c | 114 ++++++++++++++++++++++++++----------------------
>>   1 file changed, 61 insertions(+), 53 deletions(-)
>>
>> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>> index 33b6c42a6..76e103ac4 100644
>> --- a/tests/kms_hdr.c
>> +++ b/tests/kms_hdr.c
>> @@ -153,6 +153,59 @@ static void draw_hdr_pattern(igt_fb_t *fb)
>>       igt_put_cairo_ctx(cr);
>>   }
>> +/* Converts a double to 861-G spec FP format. */
>> +static uint16_t calc_hdr_float(double val)
>> +{
>> +    return (uint16_t)(val * 50000.0);
>> +}
>> +
>> +/* Fills some test values for ST2048 HDR output metadata.
>> + *
>> + * Note: there isn't really a standard for what the metadata is supposed
>> + * to do on the display side of things. The display is free to ignore it
>> + * and clip the output, use it to help tonemap to the content range,
>> + * or do anything they want, really.
>> + */
>> +static void fill_hdr_output_metadata_st2048(struct 
>> hdr_output_metadata *meta)
>> +{
>> +    memset(meta, 0, sizeof(*meta));
>> +
>> +    meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
>> +    meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
>> +
>> +    /* Rec. 2020 */
>> +    meta->hdmi_metadata_type1.display_primaries[0].x =
>> +        calc_hdr_float(0.708); /* Red */
>> +    meta->hdmi_metadata_type1.display_primaries[0].y =
>> +        calc_hdr_float(0.292);
>> +    meta->hdmi_metadata_type1.display_primaries[1].x =
>> +        calc_hdr_float(0.170); /* Green */
>> +    meta->hdmi_metadata_type1.display_primaries[1].y =
>> +        calc_hdr_float(0.797);
>> +    meta->hdmi_metadata_type1.display_primaries[2].x =
>> +        calc_hdr_float(0.131); /* Blue */
>> +    meta->hdmi_metadata_type1.display_primaries[2].y =
>> +        calc_hdr_float(0.046);
>> +    meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
>> +    meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
>> +
>> +    meta->hdmi_metadata_type1.max_display_mastering_luminance =
>> +        1000; /* 1000 nits */
>> +    meta->hdmi_metadata_type1.min_display_mastering_luminance =
>> +        500;                   /* 0.05 nits */
>> +    meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
>> +    meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
>> +}
>> +
>> +/* Sets the HDR output metadata prop. */
>> +static void set_hdr_output_metadata(data_t *data,
>> +                    struct hdr_output_metadata const *meta)
>> +{
>> +    igt_output_replace_prop_blob(data->output,
>> +                     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>> +                     meta ? sizeof(*meta) : 0);
>> +}
>> +
>>   /* Prepare test data. */
>>   static void prepare_test(data_t *data, igt_output_t *output, enum 
>> pipe pipe)
>>   {
>> @@ -380,15 +433,6 @@ static bool is_panel_hdr(data_t *data, 
>> igt_output_t *output)
>>       return ret;
>>   }
>> -/* Sets the HDR output metadata prop. */
>> -static void set_hdr_output_metadata(data_t *data,
>> -                    struct hdr_output_metadata const *meta)
>> -{
>> -    igt_output_replace_prop_blob(data->output,
>> -                     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>> -                     meta ? sizeof(*meta) : 0);
>> -}
>> -
>>   /* Sets the HDR output metadata prop with invalid size. */
>>   static int set_invalid_hdr_output_metadata(data_t *data,
>>                          struct hdr_output_metadata const *meta,
>> @@ -401,50 +445,6 @@ static int set_invalid_hdr_output_metadata(data_t 
>> *data,
>>       return igt_display_try_commit_atomic(&data->display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>   }
>> -/* Converts a double to 861-G spec FP format. */
>> -static uint16_t calc_hdr_float(double val)
>> -{
>> -    return (uint16_t)(val * 50000.0);
>> -}
>> -
>> -/* Fills some test values for ST2048 HDR output metadata.
>> - *
>> - * Note: there isn't really a standard for what the metadata is supposed
>> - * to do on the display side of things. The display is free to ignore it
>> - * and clip the output, use it to help tonemap to the content range,
>> - * or do anything they want, really.
>> - */
>> -static void fill_hdr_output_metadata_st2048(struct 
>> hdr_output_metadata *meta)
>> -{
>> -    memset(meta, 0, sizeof(*meta));
>> -
>> -    meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
>> -    meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
>> -
>> -    /* Rec. 2020 */
>> -    meta->hdmi_metadata_type1.display_primaries[0].x =
>> -        calc_hdr_float(0.708); /* Red */
>> -    meta->hdmi_metadata_type1.display_primaries[0].y =
>> -        calc_hdr_float(0.292);
>> -    meta->hdmi_metadata_type1.display_primaries[1].x =
>> -        calc_hdr_float(0.170); /* Green */
>> -    meta->hdmi_metadata_type1.display_primaries[1].y =
>> -        calc_hdr_float(0.797);
>> -    meta->hdmi_metadata_type1.display_primaries[2].x =
>> -        calc_hdr_float(0.131); /* Blue */
>> -    meta->hdmi_metadata_type1.display_primaries[2].y =
>> -        calc_hdr_float(0.046);
>> -    meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
>> -    meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
>> -
>> -    meta->hdmi_metadata_type1.max_display_mastering_luminance =
>> -        1000; /* 1000 nits */
>> -    meta->hdmi_metadata_type1.min_display_mastering_luminance =
>> -        500;                   /* 0.05 nits */
>> -    meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
>> -    meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
>> -}
>> -
>>   static void adjust_brightness(data_t *data, uint32_t flags)
>>   {
>>       igt_backlight_context_t context;
>> @@ -652,6 +652,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>>   {
>>       igt_display_t *display = &data->display;
>>       igt_output_t *output;
>> +    struct hdr_output_metadata hdr;
>>       igt_display_reset(display);
>> @@ -701,6 +702,9 @@ static void test_hdr(data_t *data, uint32_t flags)
>>               prepare_test(data, output, pipe);
> Please add comment here, "why" this is required.

Will do

>> +            fill_hdr_output_metadata_st2048(&hdr);
>> +            set_hdr_output_metadata(data, &hdr);
> Don't we need a commit here?

There is a commit inside igt_max_bpc_constraint but I agree we should 
add one here to maintain symmetry and avoid future bugs.

==
Chaitanya

>> +
>>               if (is_intel_device(data->fd) &&
>>                   !igt_max_bpc_constraint(display, pipe, output, 10)) {
>>                   igt_info("%s: No suitable mode found to use 10 bpc.\n",
>> @@ -710,6 +714,10 @@ static void test_hdr(data_t *data, uint32_t flags)
>>                   break;
>>               }
>> +            set_hdr_output_metadata(data, NULL);
>> +            igt_display_commit2(display, display->is_atomic ?
>> +                        COMMIT_ATOMIC : COMMIT_LEGACY);
>> +
>>               data->mode = igt_output_get_mode(output);
>>               data->w = data->mode->hdisplay;
>>               data->h = data->mode->vdisplay;
> 

