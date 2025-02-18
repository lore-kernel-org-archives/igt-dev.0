Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F8AC021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 23:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6AB10E156;
	Tue, 18 Feb 2025 23:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BTtfxfdL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D13A10E156
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 23:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739919986; x=1771455986;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/S3+LsiRVdzGVHHp9FOzd+QQbx552lK3gKGp4qHoNRY=;
 b=BTtfxfdLGLri9htlCWaAeRYVG5vMzJCq9aiwenBQV0Eg5vwLe+CeRYl0
 sXrkUkgk+mCns0o1R2FpGzfJAecnXVTUfEQfUodecm5SUvJ+GHGAllSHH
 kx9+KtJmYQhwN1gguvnRgWbACAZgv9j2WEpnue9kB18TS5lNIdcSoFsMU
 nI0v3wblki5KzNC+EXDrC6ysf69tb0XTp9/4weB5DV2J53MqdRh+ogu9x
 1gc7zReEgdm6Xb2e0NNvzKykd2kR15GAZNsumDLEVTU2/6JTcKo1xwgvi
 Q9SkTqNfMnNsw5Uo36diai1Wo95AySS2eWhMA05o+9m9LiIQW17eeGfEj w==;
X-CSE-ConnectionGUID: Cgegp/VRTiqfbo2dY/qRNw==
X-CSE-MsgGUID: bMEP/WSzQ8+6zO3WnHlT2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="52045364"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="52045364"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 15:06:26 -0800
X-CSE-ConnectionGUID: ejXNOJreRZuYRiu31zvVpQ==
X-CSE-MsgGUID: 0z4vqXIEQFuuvNohmWm3wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114394581"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 15:06:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 15:06:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 15:06:24 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 15:06:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xjvw0mTiKNYjVagTqNp23LC2N8v7+pno6J8Wp7pI1NhpDtlhxfA07D2FjIBWYRlEchdnEy5R6KxC28kqB8OtuvbIhWt8dPro3zLcyu3RjBQKQ5OVUnwriQvMj/9tRM8cCwfmoQkkXSh+GWM20q7XCLUvo1qISe56B6HOy2iZz1HD8fjkA5nBexemNW6Usx2t2eXsHwNb2j/A7oWTb5YagKPQXgcEwjPfmdHr3/3GkaZRcBacA4RCB2eh86SDggOOZrAUQ1jKsVatV0nPWBiMKSnNOQAVHi/Em0b8BhlvO6joT7xTDrFOSbWdLw+tHEuKCtL20+Kw0mzNjhllG02NOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLHICqxa9URGq1E3Sf7YAqM/cM4cEE/kkKQ+HFMs9aI=;
 b=YEbvhp/kVS3xcJDArKZMYHD/0yNl3gd9hufNbZbyC1vu/o4ikyUKR2p8CYnx//rr8JWQT0gSrjIj64PNIhLt7bDPp90Of84a6XnUd08VnZPrOczIH2XiXnFQdzSpxOi6iqHMny5xMH9ucwEG8Uo3YYNpUeB/pgHTF0Tei4DKinFU50Yk2Z3RO3S7tygrCPYSQdOfT8cCedSO4MLTQ2SxJ/Mit4UHANsd0bV6oHGignKT/lqIC5ZcBWQDyurUHsq5ouS6vls5h7h/Y1bbmWqZsoSv719Fh5rUJcGWmcB13RsvBGlSJylRcoLzDyKqoVfm8ymXYypVMudwFuB5TcPpWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SJ1PR11MB6298.namprd11.prod.outlook.com (2603:10b6:a03:457::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 23:06:19 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 23:06:19 +0000
Date: Tue, 18 Feb 2025 15:06:16 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_eu_stall: Add tests for EU
 stall sampling
Message-ID: <Z7USaPGu6WH-EqkN@intel.com>
References: <cover.1735637542.git.harish.chegondi@intel.com>
 <254d672d442bef8d6a628b8bff10a7b1d75f2ad6.1735637542.git.harish.chegondi@intel.com>
 <85o6zie9xd.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85o6zie9xd.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR21CA0022.namprd21.prod.outlook.com
 (2603:10b6:a03:114::32) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SJ1PR11MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6b864d-24dc-4d5a-85f8-08dd5070da6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YW9oT3cvWjhPMnE4aWtqNjdOMzNORTRmM01xQ2dNSi84ZTQvdmhocXhSd2dL?=
 =?utf-8?B?VFBTdkJmN0JGR1lncDJmN0NMSnYxL01uVWtiT1NvL3c3ZndoNFdua2I3OUFn?=
 =?utf-8?B?Zm5lN29TYUVVU0srclZmZTZGVnB2aFYyelZOMVNUa3l2UUtlTnJnZ0psT0RX?=
 =?utf-8?B?b1B5VEdMLzIyaE4xb3k4NGFvN0FQWW9hZ3l4aDlyQVd3SjRwQ3ViS0c0bisv?=
 =?utf-8?B?QkdKOG8xd3dHamE0WDhaLzl0dDd3Vkw4cjJxRGVBeWtLMVBuU3hmcldSYmhN?=
 =?utf-8?B?cE52SGdhYTlsaTZsZVBLNGVWL0lmTktrVklQaGx0RUQ0WTJaNkdSV1RKOHVQ?=
 =?utf-8?B?dnVhcTRJczk3YXFBbWtiMXpQbkF1THNFaGo4Y3NlVEFscHpDYzBFT1ptM0Q2?=
 =?utf-8?B?akxOaEFkTTFxUHlqNEh0TndyRUlQRDdWMWVmQUFlUTBFT0tNRWc0MWpDU3dx?=
 =?utf-8?B?dkVGVUFWZU1nL3dEbzNvMUlUYVN0bW82bmtkdDljTVdUcVlHdWNHOUdxa0p0?=
 =?utf-8?B?N0xHaDVsdVZkeWlWNlZBRDZvbzJnczJNVmJLd2JOK21zdmpia1BUN2tuSS9h?=
 =?utf-8?B?bkwyNVhvd1BMVHhMVmpDN24zTG9TZElkcFB3UnRHeG5iRVFoWll6ZUpZd1Rl?=
 =?utf-8?B?ZndsM0dSTGUzRld2M293YUVUWDVkZ3plMGY5bHJjeWZTMlhuclBaaHF3Wkky?=
 =?utf-8?B?NWhXY29RK08xd2N1dnAwUnhXeFBTTzluZDkzd296aWs5MGlkbmZMb1ExVGdy?=
 =?utf-8?B?REljMitNVFVMNTlMQUlrTnc4UG1BTDcxM1ZHdmV1aTdnb2I5aUFHUTFFWHRs?=
 =?utf-8?B?K1hyQ1BrWFAwQXdpSEhlUXA3TU8vYnIvc2JaT2orYXJkK2pBZ1NMTFhFUmhm?=
 =?utf-8?B?VkdmYWQrbk40Q0k1OVpnbTF3S1ptelVndlNOdU9QbFNHd3FnUk5RdnJvNDFC?=
 =?utf-8?B?YnllcHZ0WURPR012OC8wc3J4M3pkQno4ZDVLZGpjc3pIWnNvSWhqK0JNU3N5?=
 =?utf-8?B?dHgzZzdHMXFpQXJTUFRuNTBlekhhUjZCUE1mTkFEUHpMUUtscFJKTEd5V05R?=
 =?utf-8?B?MjFwQ0JsTlJkeUhkU3hrdFlrV25rNWh6VTdGQkllSlY3OTN0Q2lzZC8ya25w?=
 =?utf-8?B?SmVVSm5iQ2hlRzBRMldqamIwK1dkc01LQ25vNmhjQkh6TGx2YnZxVW1rZjU5?=
 =?utf-8?B?TzRONG5iWFBvazNQVFJ1TXhxSUZGNVRldDRPRGVEZHRXL3E5c0lOMXJnajhQ?=
 =?utf-8?B?UHdIczVaYUo3MkowZVBUbTk2ZnZ5bmUxYWpLR2Jyamhsd3BxZVQxQS8yV0Zt?=
 =?utf-8?B?VEZ1U2UzUytoaHdvWk04NWhzakhOSStTVzVWb3kzcWFta1c3YjdVbnFWY1hT?=
 =?utf-8?B?L1RDR0JTMWFjNmxWQXVwb0ptTy92SXVuS3BydERqcWxjdzQ1c1FtbjJNd1hR?=
 =?utf-8?B?UXNzTHlpSzd2MDVvcDBSSEkvTWJPNlNFQkk4NVF1bjlMNkRzZnBzTnhsWWdV?=
 =?utf-8?B?VkpCNzdMa0NnOWxuczJVNEx6VWVvZFp4RzZGQ0RUOWVDWFJGbUNndndkbU5N?=
 =?utf-8?B?Qko3eUNnY0M5ckU3K2FsZEJkckRGVDZVb29adjBCWWl1ZndyVVlSNkFYK3Ny?=
 =?utf-8?B?SWtuTG9mTjNQUHVOM01MM0lKYXFJOVJZOWVKRExzWFZXUWljSHlxLzVLQkc3?=
 =?utf-8?B?OTJoZ2FQdlJOeEp0LzlobnNuL0ZCOVpZOWJSeWdiVFFBMll2cy9WREJJK1dE?=
 =?utf-8?B?b2gwRy9NYzZ2bkUyUmxwTlBBa2hwK2FnTjhTdCs2czBXaVF5aVMvVzZWd0Y1?=
 =?utf-8?B?STg1dDlKYjV3M2pPU1dXQzFzNmFncG1vcGRsdGp0azNGT2x5aTlPYkoyR1hw?=
 =?utf-8?Q?GkQ20d5e+g7DI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3RFUHIrZXlYVkFlNC9oTk5Pd011OFVyT2o4V2p0QUJZZjdYc2kyQjFJWHQz?=
 =?utf-8?B?bnJXWkgzTVFKYkcrbG1uVGZkWWJKUUloNFVCeU1BUEVOVCt2d3I5dmhIM0xL?=
 =?utf-8?B?cWdzdDBuOHhHbWhlR0VOOHRkSlpxWERvbTVwdzZrTW5LRE85d01ybkhEUHRQ?=
 =?utf-8?B?WmdHeFh0cDdPRFdSMGp0cXBYKzhUQUJITTV5NWRTQTNXcHRLS1dzaVNyc1Z4?=
 =?utf-8?B?V01YdWRRSFU1eVhEdnNpSHhhOTJDeEJ6eHJGN2NadDBSTWVlLzAyU05vcGhr?=
 =?utf-8?B?SzBjd01RU2FJcnFZdFR1bUQ3K0xEY0NEK2pUejY4Y2ViOEVCMnljeXdlajhI?=
 =?utf-8?B?SkNtQWY5U09IdmVLZzdySVRFQ3VnalBPMktkMUdnZkN1T2UxV1F0L1JoeHNZ?=
 =?utf-8?B?SnVSVXRNWHBIZHpFWU8vTngwRnNXS1ZqWm92eEY0QTd0RDlqZXlycUVhWVNX?=
 =?utf-8?B?UjNqaGwxUmtVQU5KMGZxTkp2NS96NVVta0x3QXRCcklEYVRsNndONExzVG1a?=
 =?utf-8?B?Y1Z0eDViSFVWSzRVeWYwRGYwTmhNL0dlQkJXVTRGVFBOYkE2djRQTUVhbWhn?=
 =?utf-8?B?V3VsU092RFlIRWhjQkYzTjlBQmNISjg4a1lUaHZIK0lacnNrUFEzY2t0Z3E5?=
 =?utf-8?B?Q2FDd2Y3d3h2Z25xNU1yZFZMa085SHFxOVdLc2xVM2UrZTRweEdqUVNlVXox?=
 =?utf-8?B?VEt1d0FBNTh4N3l2Z2cvelFLdDdHRVM1SVJnWDZQdmE3REo2R0NVZmJJMVEw?=
 =?utf-8?B?NWpidTNMdG4wR25wcFJvckxCVnFYVUQxK3dvMUR0eXVnMTlYSDZaQWVibDdI?=
 =?utf-8?B?b09ROCt4ZDFwYWFlN3R5K3ZxUm5iblNVMFQyQWZaMjViYU5CMjlPK3ZQT1Mx?=
 =?utf-8?B?cnNaeHBTQit1ZTRJSGRLYy9oZnlJSVE0TTBnQTM2VWpmeDhNVkJqZzdLa25Y?=
 =?utf-8?B?QXlOY1NjWG9Zd0NOckVJZU5oMEJNaFBHVmhEU1lON0wxdW1Uc01HS3IybEhi?=
 =?utf-8?B?cFRQYWwyalNFNTliTTdZekQ1N0RKejg0TSthLzFjcHkzSjh5MEZoNk0veS96?=
 =?utf-8?B?U21oR21hQW42SVdsZUZpcHlXaUhXZzI5cUFyZXQyMXdnbmtKQkFhcnFET0wx?=
 =?utf-8?B?K0N2V0J2WVZiWWlzYnJ3eEU2VmJUT0xHVnM3TmJBZWNOdUN2cCt6eTB0U05r?=
 =?utf-8?B?ZzNBbW5nMWJPaXgyMGNJb3R4UFJSYUpLeEY5SEl2UitLWW1uVnZlZVJRb004?=
 =?utf-8?B?ZThNZUxUUmV0dzZFbkNLdlNPdTZQVFRBOFRMb1lxSXlpSkdoaFgxbkxadklJ?=
 =?utf-8?B?SXpkSGNvRkhnR2ZBbkNQbk9ySUlXbUdldTVPeSt5Qm41QVFvTWxYNDRud2xk?=
 =?utf-8?B?QklBTis0bzk2RHJ4YVdDZlNNWklDSHhrc2JvMlVJckFJck9PRTh6cEdMNGFj?=
 =?utf-8?B?RG16b2dmUmNlNkdjeS9GWTRtSGtTb3daUWY1alFpc0E0RUVDV1YyYmdudHJV?=
 =?utf-8?B?N1NCVEpDV005cGJuS1ZnYjFXdGpYQUpNZFh5TVBJRzVlWHdLVW1jVUNnVEsz?=
 =?utf-8?B?M2pwejU4clhhS2djeGRVcXVtMnZiWGM1djRiTS8rQzAzVXFkdGZZelQ5MDE0?=
 =?utf-8?B?NDJWcHZKNTB1eHRHOVVYV1NjcXRRbWdYOWRkOVpVKzVCcnhnMkxNTExZM1dr?=
 =?utf-8?B?TTNSaHNHUlBxeWhHUlZMUkt0MWJUMG10bnZybDB4V01nSi9sOWNoZ3NZWHVM?=
 =?utf-8?B?MjJFaGRCSCswUEdvdnZRRkpoeXB2OXRPcUpLQ09ScjdTRlIxSGROaTE3azdh?=
 =?utf-8?B?bWtRUk02ZkFsQkpLZUNud0lRUE81cm1sQXp3Rm1oUnRNbnJDOHFqS1E4SUkw?=
 =?utf-8?B?bStLRE0zTktzMlVhSnRTRzIxVytXYTdzaThwcFFCTFJZWTFZN1JRak5wWlhw?=
 =?utf-8?B?NWpTWU5rMmtyUUQ4UnJYT1dkaEZTelV1Q1hJQ1FHVDE2Q3R2bkFnUG0xbDZr?=
 =?utf-8?B?WXY2UU1YaUJYMmVNT3lNS05xMjhBTnJLamozRWZSWnQ5NGJDMzMvOWMraEtC?=
 =?utf-8?B?dFpMVXRoQzc3K2JQdDFUclBub0Z6REVHVWxCREp2U1Z2WWExZC9zcUIyYVhL?=
 =?utf-8?B?V2R4Z3Z5QWozK2tqRU9XQmZDdnhmbHFOekowOUEyUFg2WmJNZGRlZGVtbFll?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6b864d-24dc-4d5a-85f8-08dd5070da6b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 23:06:19.0338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AsJ17N6iLNEJPVTn4Heq3XC8r5x9eD6rTSWXk6FyzBZxqwlNMrD4uuKFafV2JZh3Bc1X0+zCdsF11X+Qdk3UTQKhx0G4SFRp1HOMN+rcqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6298
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

On Mon, Feb 03, 2025 at 06:11:10PM -0800, Dixit, Ashutosh wrote:
> On Tue, 31 Dec 2024 01:46:29 -0800, Harish Chegondi wrote:
> >
> 
Hi Ashutosh,
> Hi Harish,
> 
> > diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> > index 56163eb91..d4aff5d01 100644
> > --- a/include/drm-uapi/xe_drm.h
> > +++ b/include/drm-uapi/xe_drm.h
> > @@ -700,6 +700,7 @@ struct drm_xe_device_query {
> >  #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> >  #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
> >  #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
> > +#define DRM_XE_DEVICE_QUERY_EU_STALL		9
> >	/** @query: The type of data to query */
> >	__u32 query;
> >
> > @@ -1397,6 +1398,8 @@ struct drm_xe_wait_user_fence {
> >  enum drm_xe_observation_type {
> >	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
> >	DRM_XE_OBSERVATION_TYPE_OA,
> > +	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
> > +	DRM_XE_OBSERVATION_TYPE_EU_STALL,
> >  };
> >
> >  /**
> > @@ -1713,6 +1716,77 @@ struct drm_xe_oa_stream_info {
> >	__u64 reserved[3];
> >  };
> >
> > +/**
> > + * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
> > + *
> > + * These properties are passed to the driver at open as a chain of
> > + * @drm_xe_ext_set_property structures with @property set to these
> > + * properties' enums and @value set to the corresponding values of these
> > + * properties. @drm_xe_user_extension base.name should be set to
> > + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> > + *
> > + * With the file descriptor obtained from open, user space must enable
> > + * the EU stall stream fd with @DRM_XE_OBSERVATION_IOCTL_ENABLE before
> > + * calling read(). EIO errno from read() indicates HW dropped data
> > + * due to full buffer.
> > + */
> > +enum drm_xe_eu_stall_property_id {
> > +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_GT_ID: @gt_id of the GT on which
> > +	 * EU stall data will be captured.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_GT_ID = 1,
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate in
> > +	 * GPU cycles from @sampling_rates in struct @drm_xe_query_eu_stall
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS: Minimum number of
> > +	 * EU stall data reports to be present in the kernel buffer
> > +	 * before unblocking poll or read that is blocked.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS,
> > +};
> > +
> > +/**
> > + * struct drm_xe_query_eu_stall - Information about EU stall sampling.
> > + *
> > + * If a query is made with a struct @drm_xe_device_query where .query
> > + * is equal to @DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
> > + * struct @drm_xe_query_eu_stall in .data.
> > + */
> > +struct drm_xe_query_eu_stall {
> > +	/** @extensions: Pointer to the first extension struct, if any */
> > +	__u64 extensions;
> > +
> > +	/** @capabilities: EU stall capabilities bit-mask */
> > +	__u64 capabilities;
> > +#define DRM_XE_EU_STALL_CAPS_BASE		(1 << 0)
> > +
> > +	/** @record_size: size of each EU stall data record */
> > +	__u64 record_size;
> > +
> > +	/** @per_xecore_buf_size: Per XeCore buffer size */
> > +	__u64 per_xecore_buf_size;
> > +
> > +	/** @num_sampling_rates: Number of sampling rates supported */
> > +	__u64 num_sampling_rates;
> > +
> > +	/** @reserved: Reserved */
> > +	__u64 reserved[5];
> > +
> > +	/**
> > +	 * @sampling_rates: Flexible array of sampling rates
> > +	 * sorted in the fastest to slowest order.
> > +	 * Sampling rates are specified in GPU clock cycles.
> > +	 */
> > +	__u64 sampling_rates[];
> > +};
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> 
> For the final merge, uapi changes will be merged by syncing kernel and IGT
> uapi headers. So maybe separate out into a separate patch so we can R-b the
> real EU stall test patch.
I have split the xe_drm.h header changes into a separate patch in the
latest patch series.
> 
> > diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> > new file mode 100644
> > index 000000000..754d2c379
> > --- /dev/null
> > +++ b/tests/intel/xe_eu_stall.c
> > @@ -0,0 +1,579 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> > + */
> > +
> > +/**
> > + * TEST: Basic tests for EU stall sampling functionality
> > + * Category: Core
> > + * Functionality: EU stall sampling
> > + * Mega feature: Performance interface
> > + * Test category: xe
> > + * Sub-category: Performance
> > + * Run type: FULL
> > + *
> > + * SUBTEST: non-blocking-read
> > + * Description: Verify non-blocking read of EU stall data during a workload run
> > + *
> > + * SUBTEST: blocking-read
> > + * Description: Verify blocking read of EU stall data during a workload run
> > + *
> > + * SUBTEST: unprivileged-access
> > + * Description: Verify unprivileged open of a EU stall data stream fd
> > + */
> > +
> > +#include <poll.h>
> > +#include <fcntl.h>
> > +#include <sys/wait.h>
> > +#include <sys/ioctl.h>
> > +
> > +#include "igt.h"
> > +#include "igt_core.h"
> > +#include "xe_drm.h"
> > +#include "xe/xe_oa.h"
> > +#include "xe/xe_ioctl.h"
> > +
> > +#define OBSERVATION_PARANOID	"/proc/sys/dev/xe/observation_paranoid"
> > +
> > +#define NUM_ITERS_GPGPU_FILL	100
> > +#define DEFAULT_GT_ID		0
> > +#define DEFAULT_NUM_REPORTS	1
> > +#define DEFAULT_SAMPLE_RATE	(251 * 4)
> > +#define DEFAULT_USER_BUF_SIZE	(64 * 512 * 1024)
> > +
> > +#define WIDTH		64
> > +#define HEIGHT		64
> > +#define COLOR_88	0x88
> > +#define COLOR_4C	0x4c
> > +
> > +static char *p_args[8];
> > +static uint8_t p_gt_id = DEFAULT_GT_ID;
> > +static uint32_t p_rate = DEFAULT_SAMPLE_RATE;
> > +static uint32_t p_user = DEFAULT_USER_BUF_SIZE;
> > +static uint32_t p_num_reports = DEFAULT_NUM_REPORTS;
> > +
> > +static volatile bool child_is_running = true;
> > +
> > +/**
> > + * struct xe_eu_stall_data_pvc - EU stall data format for PVC
> > + *
> > + * Bits		Field
> > + * 0  to 28	IP (addr)
> > + * 29 to 36	active count
> > + * 37 to 44	other count
> > + * 45 to 52	control count
> > + * 53 to 60	pipestall count
> > + * 61 to 68	send count
> > + * 69 to 76	dist_acc count
> > + * 77 to 84	sbid count
> > + * 85 to 92	sync count
> > + * 93 to 100	inst_fetch count
> > + */
> > +struct xe_eu_stall_data_pvc {
> > +	__u64 ip_addr:29;
> > +	__u64 active_count:8;
> > +	__u64 other_count:8;
> > +	__u64 control_count:8;
> > +	__u64 pipestall_count:8;
> > +	__u64 send_count:8;
> > +	__u64 dist_acc_count:8;
> > +	__u64 sbid_count:8;
> > +	__u64 sync_count:8;
> > +	__u64 inst_fetch_count:8;
> > +	__u64 unused_bits:27;
> > +	__u64 unused[6];
> > +} __attribute__((packed));
> > +
> > +/**
> > + * struct xe_eu_stall_data_xe2 - EU stall data format for LNL, BMG
> > + *
> > + * Bits		Field
> > + * 0  to 28	IP (addr)
> > + * 29 to 36	Tdr count
> > + * 37 to 44	other count
> > + * 45 to 52	control count
> > + * 53 to 60	pipestall count
> > + * 61 to 68	send count
> > + * 69 to 76	dist_acc count
> > + * 77 to 84	sbid count
> > + * 85 to 92	sync count
> > + * 93 to 100	inst_fetch count
> > + * 101 to 108	Active count
> > + * 109 to 111	Exid
> > + * 112		EndFlag (is always 1)
> > + */
> > +struct xe_eu_stall_data_xe2 {
> > +	__u64 ip_addr:29;
> > +	__u64 tdr_count:8;
> > +	__u64 other_count:8;
> > +	__u64 control_count:8;
> > +	__u64 pipestall_count:8;
> > +	__u64 send_count:8;
> > +	__u64 dist_acc_count:8;
> > +	__u64 sbid_count:8;
> > +	__u64 sync_count:8;
> > +	__u64 inst_fetch_count:8;
> > +	__u64 active_count:8;
> > +	__u64 ex_id:3;
> > +	__u64 end_flag:1;
> > +	__u64 unused_bits:15;
> > +	__u64 unused[6];
> > +} __attribute__((packed));
> > +
> > +union xe_eu_stall_data {
> > +	struct xe_eu_stall_data_pvc pvc;
> > +	struct xe_eu_stall_data_xe2 xe2;
> > +};
> > +
> > +typedef struct {
> > +	int drm_fd;
> > +	uint32_t devid;
> > +	struct buf_ops *bops;
> > +} data_t;
> > +
> > +static struct intel_buf *
> > +create_buf(data_t *data, int width, int height, uint8_t color, uint64_t region)
> > +{
> > +	struct intel_buf *buf;
> > +	uint8_t *ptr;
> > +	int i;
> > +
> > +	buf = calloc(1, sizeof(*buf));
> > +	igt_assert(buf);
> > +
> > +	buf = intel_buf_create(data->bops, width/4, height, 32, 0,
> > +			       I915_TILING_NONE, 0);
> > +
> > +	ptr = xe_bo_map(data->drm_fd, buf->handle, buf->surface[0].size);
> 
> For the size maybe buf->bo_size is sufficient. See 7812065f4aeb. So replace
> everywhere. If you think this is ok, ok to leave as is too.
> 
> > +
> > +	for (i = 0; i < buf->surface[0].size; i++)
> > +		ptr[i] = color;
> > +
> > +	munmap(ptr, buf->surface[0].size);
> 
> > +
> > +	return buf;
> > +}
> > +
> > +static void buf_check(uint8_t *ptr, int width, int x, int y, uint8_t color)
> > +{
> > +	uint8_t val;
> > +
> > +	val = ptr[y * width + x];
> > +	igt_assert_f(val == color,
> > +		     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
> > +		     color, val, x, y);
> > +}
> > +
> > +static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region,
> > +		       uint32_t surf_width, uint32_t surf_height,
> > +		       uint32_t x, uint32_t y,
> > +		       uint32_t width, uint32_t height)
> > +{
> > +	struct intel_buf *buf;
> > +	uint8_t *ptr;
> > +	int i, j;
> > +
> > +	buf = create_buf(data, surf_width, surf_height, COLOR_88, region);
> > +	ptr = xe_bo_map(data->drm_fd, buf->handle, buf->surface[0].size);
> > +
> > +	for (i = 0; i < surf_width; i++)
> > +		for (j = 0; j < surf_height; j++)
> > +			buf_check(ptr, surf_width, i, j, COLOR_88);
> > +
> > +	fill(data->drm_fd, buf, x, y, width, height, COLOR_4C);
> > +
> > +	for (i = 0; i < surf_width; i++)
> > +		for (j = 0; j < surf_height; j++)
> > +			if (i >= x && i < width + x &&
> > +			    j >= y && j < height + y)
> > +				buf_check(ptr, surf_width, i, j, COLOR_4C);
> > +			else
> > +				buf_check(ptr, surf_height, i, j, COLOR_88);
> > +
> > +	munmap(ptr, buf->surface[0].size);
> > +}
> > +
> > +static int run_gpgpu_fill(int drm_fd, uint32_t devid)
> > +{
> > +	data_t data = {drm_fd, devid, NULL};
> > +	igt_fillfunc_t fill_fn = NULL;
> > +	unsigned i;
> > +
> > +	data.bops = buf_ops_create(drm_fd);
> > +	fill_fn = igt_get_gpgpu_fillfunc(devid);
> > +
> > +	for (i = 0; i < NUM_ITERS_GPGPU_FILL; i++)
> > +		gpgpu_fill(&data, fill_fn, 0, WIDTH, HEIGHT, 16, 16, WIDTH / 2, HEIGHT / 2);
> 
> How long does this test run for? Instead of NUM_ITERS_GPGPU_FILL determine
> the time for the test, another idea is pre-select a time, say 5 seconds,
> and kill the child running the workload after 5 seconds. This way you have
> a more deterministic time. But let's first see how long we're running this
> for. Execution time is of concern in CI.
How much execution time is acceptable for CI? GPGPU fill is a very small
workload. If I don't iterate it, sometimes, it doesn't generate any EU
stall data. In the future I can add a user input to pass the duration of
workload execution so it runs for that duration only.
> 
> > +
> > +	buf_ops_destroy(data.bops);
> > +
> > +	return EXIT_SUCCESS;
> > +}
> > +
> > +static uint64_t
> > +read_u64_file(const char *path)
> > +{
> > +	FILE *f;
> > +	uint64_t val;
> > +
> > +	f = fopen(path, "r");
> > +	igt_assert(f);
> > +
> > +	igt_assert_eq(fscanf(f, "%"PRIu64, &val), 1);
> > +
> > +	fclose(f);
> > +
> > +	return val;
> > +}
> > +
> > +static void
> > +write_u64_file(const char *path, uint64_t val)
> > +{
> > +	FILE *f;
> > +
> > +	f = fopen(path, "w");
> > +	igt_assert(f);
> > +
> > +	igt_assert(fprintf(f, "%"PRIu64, val) > 0);
> > +
> > +	fclose(f);
> > +}
> > +
> > +static void set_fd_flags(int fd, int flags)
> > +{
> > +	int old = fcntl(fd, F_GETFL, 0);
> > +
> > +	igt_assert_lte(0, old);
> > +	igt_assert_eq(0, fcntl(fd, F_SETFL, old | flags));
> > +}
> > +
> > +static inline void enable_paranoid(void)
> > +{
> > +	write_u64_file(OBSERVATION_PARANOID, 1);
> > +}
> > +
> > +static inline void disable_paranoid(void)
> > +{
> > +	write_u64_file(OBSERVATION_PARANOID, 0);
> > +}
> > +
> > +/*
> > + * Test to verify that only a privileged process can open
> > + * a EU stall data stream file descriptor.
> > + */
> > +static void
> > +test_non_privileged_access(int drm_fd)
> > +{
> > +	int paranoid, stream_fd;
> > +
> > +	paranoid = read_u64_file(OBSERVATION_PARANOID);
> > +
> > +	igt_fork(child, 1) {
> > +		uint64_t properties[] = {
> > +			DRM_XE_EU_STALL_PROP_GT_ID, p_gt_id,
> > +			DRM_XE_EU_STALL_PROP_SAMPLE_RATE, p_rate,
> > +			DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS, p_num_reports,
> > +		};
> > +
> > +		struct intel_xe_oa_open_prop props = {
> > +			.num_properties = sizeof(properties) / 16,
> > +			.properties_ptr = to_user_pointer(properties),
> > +		};
> > +
> > +		if (!paranoid)
> > +			enable_paranoid();
> > +
> > +		igt_drop_root();
> > +
> > +		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_TYPE_EU_STALL,
> > +					DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props, EACCES);
> > +	}
> > +
> > +	igt_waitchildren();
> > +
> > +	igt_fork(child, 1) {
> > +		uint64_t properties[] = {
> > +			DRM_XE_EU_STALL_PROP_GT_ID, p_gt_id,
> > +			DRM_XE_EU_STALL_PROP_SAMPLE_RATE, p_rate,
> > +			DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS, p_num_reports,
> > +		};
> > +
> > +		struct intel_xe_oa_open_prop props = {
> > +			.num_properties = sizeof(properties) / 16,
> > +			.properties_ptr = to_user_pointer(properties),
> > +		};
> > +
> > +		disable_paranoid();
> > +
> > +		igt_drop_root();
> > +
> > +		stream_fd = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_TYPE_EU_STALL,
> > +						DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props);
> > +		igt_require_fd(stream_fd);
> > +		close(stream_fd);
> > +	}
> > +
> > +	igt_waitchildren();
> > +
> > +	/* restore paranoid state */
> > +	if (paranoid)
> > +		enable_paranoid();
> > +}
> > +
> > +static int wait_child(struct igt_helper_process *child_proc)
> > +{
> > +	int status;
> > +
> > +	status = igt_wait_helper(child_proc);
> > +	if (WIFEXITED(status))
> > +		return WEXITSTATUS(status);
> > +	if (WIFSIGNALED(status))
> > +		return (128 + WTERMSIG(status));
> > +	return 0;
> > +}
> > +
> > +static void sighandler(int sig)
> > +{
> > +	child_is_running = false;
> > +}
> > +
> > +static void parse_eu_stall_data(uint32_t devid, uint8_t *buf, size_t size)
> > +{
> > +	int i;
> > +	uint8_t *sample_addr;
> > +	union xe_eu_stall_data stall_data;
> > +
> > +	for (i = 0; i < size / sizeof(stall_data); i++) {
> > +		sample_addr = buf + (i * sizeof(stall_data));
> > +		memcpy(&stall_data, sample_addr, sizeof(stall_data));
> > +		if (IS_PONTEVECCHIO(devid)) {
> > +			igt_info("ip: 0x%08x ", stall_data.pvc.ip_addr);
> > +			igt_info("active: %u ", stall_data.pvc.active_count);
> > +			igt_info("other: %u ", stall_data.pvc.other_count);
> > +			igt_info("control: %u ", stall_data.pvc.control_count);
> > +			igt_info("pipestall: %u ", stall_data.pvc.pipestall_count);
> > +			igt_info("send: %u ", stall_data.pvc.send_count);
> > +			igt_info("dist_acc: %u ", stall_data.pvc.dist_acc_count);
> > +			igt_info("sbid: %u ", stall_data.pvc.sbid_count);
> > +			igt_info("sync: %u ", stall_data.pvc.sync_count);
> > +			igt_info("inst_fetch: %u\n", stall_data.pvc.inst_fetch_count);
> > +		} else {
> > +			igt_info("ip: 0x%08x ", stall_data.xe2.ip_addr);
> > +			igt_info("tdr: %u ", stall_data.xe2.tdr_count);
> > +			igt_info("other: %u ", stall_data.xe2.other_count);
> > +			igt_info("control: %u ", stall_data.xe2.control_count);
> > +			igt_info("pipestall: %u ", stall_data.xe2.pipestall_count);
> > +			igt_info("send: %u ", stall_data.xe2.send_count);
> > +			igt_info("dist_acc: %u ", stall_data.xe2.dist_acc_count);
> > +			igt_info("sbid: %u ", stall_data.xe2.sbid_count);
> > +			igt_info("sync: %u ", stall_data.xe2.sync_count);
> > +			igt_info("inst_fetch: %u ", stall_data.xe2.inst_fetch_count);
> > +			igt_info("active: %u ", stall_data.xe2.active_count);
> > +			igt_info("ex_id: %u ", stall_data.xe2.ex_id);
> > +			igt_info("end_flag: %u\n", stall_data.xe2.end_flag);
> > +		}
> 
> As Kamil commented, this is excessive output. If you really need to see
> this in the CI logs for debugging (unlikely), we can keep igt_info. Else
> change to igt_debug.
I tried igt_debug, but the problem with igt_debug is it spits out
several debug messages related to workload execution which get mixed up
with the EU stall data. Kamil suggested to write the EU stall data to an
optional output file passed as input by the user. So, I changed the test
to write the data to the optional file passed as input by the user. If
the user doesn't pass a file, the data doesn't get written out.
> 
> Think about changing other igt_info's to igt_debug's too, based on the
> above criteria. With igt_debug, you can just run the IGT with a --debug and
> you will get all the output.
The other igt_info s aren't many lines. If I make them igt_debug, they
get mixed up in a lot of debug messages.
> 
> > +	}
> > +}
> > +
> > +/*
> > + * Test enables EU stall counters, runs a given workload on a child process
> > + * while the parent process reads the stall counters data, disables EU stall
> > + * counters once the workload completes execution.
> > + */
> > +static void
> > +test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
> > +{
> > +	uint32_t num_samples = 0, num_drops = 0;
> > +	struct igt_helper_process work_load = { };
> 
> Space between braces is not needed.
Removed.
> 
> > +	struct sigaction sa = { 0 };
> > +	int ret, flags, stream_fd;
> > +	uint64_t total_size = 0;
> > +	uint8_t *buf;
> > +
> > +	uint64_t properties[] = {
> > +		DRM_XE_EU_STALL_PROP_GT_ID, p_gt_id,
> > +		DRM_XE_EU_STALL_PROP_SAMPLE_RATE, p_rate,
> > +		DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS, p_num_reports,
> > +	};
> > +
> > +	struct intel_xe_oa_open_prop props = {
> > +		.num_properties = sizeof(properties) / 16,
> 
> Use 'ARRAY_SIZE(properties) / 2' so it's clear, everywhere.
Changed.
> 
> > +		.properties_ptr = to_user_pointer(properties),
> > +	};
> > +
> > +	struct drm_xe_query_eu_stall *eu_stall_data;
> 
> Maybe name this query_ something to make it clearer, xe_eu_stall_data is
> different.
Changed.
> 
> > +	struct drm_xe_device_query query = {
> > +		.extensions = 0,
> > +		.query = DRM_XE_DEVICE_QUERY_EU_STALL,
> > +		.size = 0,
> > +		.data = 0,
> > +	};
> > +
> > +	igt_info("User buffer size: %u\n", p_user);
> > +	if (p_args[0])
> > +		igt_info("Workload: %s\n", p_args[0]);
> > +	else
> > +		igt_info("Workload: GPGPU fill\n");
> > +
> > +	buf = malloc(p_user);
> > +	igt_assert(buf);
> > +
> > +	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> > +	igt_assert_neq(query.size, 0);
> > +
> > +	eu_stall_data = malloc(query.size);
> > +	igt_assert(eu_stall_data);
> > +
> > +	query.data = to_user_pointer(eu_stall_data);
> > +	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> > +
> > +	igt_assert(eu_stall_data->num_sampling_rates > 0);
> > +	/* Set sampling rate to the fastest available one */
> > +	properties[3] = eu_stall_data->sampling_rates[0];
> > +	igt_info("Sampling Rate: %u\n", (unsigned)eu_stall_data->sampling_rates[0]);
> > +
> > +	stream_fd = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_TYPE_EU_STALL,
> > +					DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props);
> > +	igt_require_fd(stream_fd);
> > +
> > +	if (!blocking_read)
> > +		flags = O_CLOEXEC | O_NONBLOCK;
> > +	else
> > +		flags = O_CLOEXEC;
> > +
> > +	set_fd_flags(stream_fd, flags);
> > +
> > +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
> > +
> > +	sa.sa_handler = sighandler;
> > +	if (sigaction(SIGCHLD, &sa, NULL) == -1) {
> > +		igt_critical("Failed to register SIGCHLD signal handler \n");
> > +		igt_fail(IGT_EXIT_FAILURE);
> > +	}
> > +
> > +	child_is_running = true;
> > +	/* Child process runs the workload */
> > +	igt_fork_helper(&work_load) {
> > +		setpgid(0, 0);
> > +		if (p_args[0]) {
> > +			execv(p_args[0], p_args);
> > +			_exit(EXIT_FAILURE);
> > +		} else {
> > +			_exit(run_gpgpu_fill(drm_fd, devid));
> > +		}
> > +	}
> > +	/* Parent process reads the EU stall counters data */
> > +	do {
> > +		if (!blocking_read) {
> > +			struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
> > +			ret = poll(&pollfd, 1, 0);
> > +			if (ret <= 0)
> > +				continue;
> > +			igt_assert_eq(ret, 1);
> > +			igt_assert(pollfd.revents & POLLIN);
> > +		}
> > +		ret = read(stream_fd, buf, p_user);
> > +		if (ret > 0) {
> > +			total_size += ret;
> > +			parse_eu_stall_data(devid, buf, ret);
> > +			num_samples += ret / eu_stall_data->record_size;
> > +		} else if ((ret < 0) && (errno != EAGAIN)) {
> > +			if (errno == EINTR)
> > +				continue;
> > +			if (errno == EIO) {
> > +				num_drops++;
> > +				continue;
> > +			}
> > +			igt_critical("read() - ret: %d, errno: %d \n", ret, errno);
> > +			kill(-work_load.pid, SIGTERM);
> > +			break;
> > +		}
> > +	} while(child_is_running);
> > +
> > +	igt_info("Total size read: %lu\n", total_size);
> > +	igt_info("Number of samples: %u\n", num_samples);
> > +	igt_info("Number of drops reported: %u\n", num_drops);
> > +
> > +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
> > +
> > +	close(stream_fd);
> > +	free(buf);
> > +
> > +	ret = wait_child(&work_load);
> > +	igt_assert_f(ret == 0, "waitpid() - ret: %d, errno: %d \n", ret, errno);
> > +	igt_assert_f(num_samples, "No EU stalls detected during the workload \n");
> > +}
> > +
> > +static int opt_handler(int opt, int opt_index, void *data)
> > +{
> > +	switch (opt) {
> > +	case 'e':
> > +		p_num_reports = strtoul(optarg, NULL, 0);
> > +		break;
> > +	case 'g':
> > +		p_gt_id = strtoul(optarg, NULL, 0);
> > +		break;
> > +	case 'r':
> > +		p_rate = strtoul(optarg, NULL, 0);
> > +		break;
> > +	case 'u':
> > +		p_user = strtoul(optarg, NULL, 0);
> > +		break;
> > +	case 'w':
> > +		p_args[0] = optarg;
> > +		p_args[1] = NULL;
> > +		break;
> > +	default:
> > +		return IGT_OPT_HANDLER_ERROR;
> > +	}
> > +
> > +	return IGT_OPT_HANDLER_SUCCESS;
> > +}
> > +
> > +const char *help_str =  "  --rate | -r\t\tSampling rate in GPU cycles\n"
> > +			"  --user_buf_sz | -u\t\tUser buffer size\n"
> > +			"  --gt_id | -g\t\tGT ID for the GT to sample EU stalls\n"
> > +			"  --event_count | -e\t\tPoll event report count\n"
> > +			"  --workload | -w\t\tWorkload to run\n";
> > +
> > +static struct option long_options[] = {
> > +	{"rate", 0, 0, 'r'},
> > +	{"user_buf_sz", 0, 0, 'u'},
> > +	{"gt_id", 0, 0, 'g'},
> > +	{"event_count", 0, 0, 'e'},
> > +	{"workload", 0, 0, 'w'},
> > +	{ NULL, 0, 0, 0 }
> > +};
> > +
> > +igt_main_args("e:g:r:u:w:", long_options, help_str, opt_handler, NULL)
> 
> How about order these options same as in the array above, so it's easier to read.
Changed the order.
> 
> > +{
> > +	int drm_fd;
> > +	uint32_t devid;
> > +	bool blocking_read = true;
> > +
> > +	igt_fixture {
> > +		drm_fd = drm_open_driver(DRIVER_XE);
> > +		igt_require_fd(drm_fd);
> > +		devid = intel_get_drm_devid(drm_fd);
> > +		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
> > +		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
> > +	}
> > +
> > +	igt_describe("Verify non-blocking read of EU stall data during a workload run");
> > +	igt_subtest("non-blocking-read") {
> > +		test_eustall(drm_fd, devid, !blocking_read);
> > +	}
> > +
> > +	igt_describe("Verify blocking read of EU stall data during a workload run");
> > +	igt_subtest("blocking-read") {
> > +		test_eustall(drm_fd, devid, blocking_read);
> > +	}
> > +
> > +	igt_describe("Verify that unprivileged open of a EU stall data fd fails");
> > +	igt_subtest("unprivileged-access")
> > +		test_non_privileged_access(drm_fd);
> > +
> > +	igt_fixture {
> > +		drm_close_driver(drm_fd);
> > +	}
> > +}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 89bba6454..b60f0f1ec 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -281,6 +281,7 @@ intel_xe_progs = [
> >	'xe_dma_buf_sync',
> >	'xe_debugfs',
> >	'xe_drm_fdinfo',
> > +	'xe_eu_stall',
> >	'xe_evict',
> >	'xe_evict_ccs',
> >	'xe_exec_atomic',
> > @@ -387,6 +388,7 @@ extra_dependencies = {
> >	'perf': [ lib_igt_i915_perf ],
> >	'perf_pmu':  [ lib_igt_perf ],
> >	'sw_sync': [ libatomic ],
> > +	'xe_eu_stall': [ lib_igt_xe_oa ],
> >	'xe_oa': [ lib_igt_xe_oa ],
> >  }
> >
> > --
> > 2.47.1
> >
> 
> Thanks.
> --
> Ashutosh

Thank You
Harish.
