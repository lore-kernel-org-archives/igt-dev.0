Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B2FC5AD49
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 13:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F377210E134;
	Mon, 26 May 2025 13:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OKeIfi3i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CC810E134
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 13:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748264787; x=1779800787;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fgfbBvy0SBXT/aMJigqNHnWfiiTm80ZC/GfcMUQMZ4E=;
 b=OKeIfi3ild3fH0jlHuZCAORL0keOydxoONfKW2UvmxHzSKPimHG9sRQZ
 i74G4Qdt7VBwjQ5+jYU2zsgplwXtK19hysBHQDkxwsa3pA3yS+9rntX7N
 eFoi3VoiOnoo6x2x5cagPF+WPkUbf+bnoT3EGXp7dn8G4JOk4mI1YIKG4
 1A1l+L4hwzbB3tjH7URq1ibp68N8C32rGud7dDEP0EupAeF5F0yLBgkPd
 TMKOutbc7JLi4zGxCSvAhdhbXFEQKK6goWNLe4lVP/c5uEoVsFNt+WrBk
 pxBSoeGNs6FDfxG01frnRyWPqC2+fvS8mx02ednkDyYhO4oGHqTQPTvVk w==;
X-CSE-ConnectionGUID: CMLxjmVnRHmtZGKTMRDbsw==
X-CSE-MsgGUID: eNt0+3NeSqa1f+8fni0osQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="37864963"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="37864963"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 06:06:26 -0700
X-CSE-ConnectionGUID: KwuFUvhsTq2TGUTUGoDGJg==
X-CSE-MsgGUID: 5ggcbkmfRrSW/Pf8FY7/KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147376506"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 06:06:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 06:06:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 06:06:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.54)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 06:06:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=re4KQhTn4PZiilvpjy64tEXfo7kPvLgE2F41APVYZ9mkR5nR5FVxpqWAFkgueRBfmVwO28Svoi9C92T7pknfjgPQJnAm53FuboGmBJZvBL3+EPM5HY1MDkigKyaOYPHuP84NC8IGjWpGiX1sz+nhrwgzsx2vITrwgd8CHP8CUGIARPLuSNFezVp0AN9skk2WyRDZcNOMi7NUVBu24ENSzrrc/l6vTrDKiRseY6LUWqslHmF0LzMqR4nCWjUP2EdjSh6s4toNw34AIOeq79uzfsvv2GJemq32RqmsZypjH1ggHxKHCGN3llcMzBhlAPWJUsuK3TmL7ie7oUbFgJheFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRxeuec4wNiXILmQLbPAVqAyXaxQ4bn9VQzMEw/hbXg=;
 b=l54HGNB/tIPo3kvwrn1KofoQI3uoim3vrisEhZskFVTomFwqLYmH1mPwg0gO+hDgzAIcdeUFPCHM+2Uhc6TFC+7DFYeBqoLA7NX0oNYuFSGwNAPYRPyyCNF5tcfAhwZvIoKVlixUty4WYVIuJbECbV/LNVh2OSAJ4ioJQbIEcTvMugkia9SeMd6LaWOeEDBR29LoQPp6Xuy8ZLpXI5I4sSixdkAIZDoB7T91UC82d0Rzn2tMBQw7SnH7QSTbEQyQWlSD5gfQymDu0RX9poGbfFNwmD2CJfe4FzCvIMMWm3b2AqHAAfJdSFpfNy22s+usGD2b+rQEPrF8EP4IPtYUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8262.namprd11.prod.outlook.com (2603:10b6:806:26e::13)
 by BL1PR11MB5977.namprd11.prod.outlook.com (2603:10b6:208:384::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Mon, 26 May
 2025 13:06:02 +0000
Received: from SN7PR11MB8262.namprd11.prod.outlook.com
 ([fe80::2320:b2a0:cdb1:292e]) by SN7PR11MB8262.namprd11.prod.outlook.com
 ([fe80::2320:b2a0:cdb1:292e%5]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 13:06:02 +0000
Message-ID: <795d88b4-2d5c-4e17-b021-b5d88e3d3a0c@intel.com>
Date: Mon, 26 May 2025 18:35:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/2] tests/i915/pm_rc6_residency: Use sysfs to achieve
 peak frequency
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20250513183726.2118105-1-sk.anirban@intel.com>
 <20250513183726.2118105-2-sk.anirban@intel.com>
 <a2a6c9d7-ba95-4553-9f72-e76491ef1c5c@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <a2a6c9d7-ba95-4553-9f72-e76491ef1c5c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::18) To SN7PR11MB8262.namprd11.prod.outlook.com
 (2603:10b6:806:26e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8262:EE_|BL1PR11MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 0887dd2b-9821-44f2-b36b-08dd9c56107b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2hEMk84NEVOVkZHMXNiS3RNZU9BZDAvV0phM294Z092Q0Q1MjgyQ21pTnQz?=
 =?utf-8?B?cklIak9ickorRVZOdmxCTlJqNFlMRUZGeWo3R084bEZSYVBJRzFZRGJISEVo?=
 =?utf-8?B?YjFyMU1kU2ZPU2hGTnY0OTF5dU9QMzVueG9sMjF6RzRweE03TWIwSVA5aDJn?=
 =?utf-8?B?elNjUWdzOFJ6QlR0WjRmcVpnWEZyVDZTemYyLzI5MDhUYnZYZlFVenFLbk1p?=
 =?utf-8?B?UFlxQUQrYmc0M3VYZ1ZBcFU0QmZDVGN3bTA1V2JVZDF0NUoyUEdpVmZjV3hB?=
 =?utf-8?B?Rk52ZmFQdVBHL2cweEJZOFlhbk5iVUVBUDRZSk50VGl3UERlZ3F6RGNGdGtB?=
 =?utf-8?B?akJlSWd0SVZSNFp1ZFJYNjAvdy96djY2d0VmaThNYUVlWWNURHlQT3JWWU8v?=
 =?utf-8?B?cVR5M1VxK0d5NVpGaHlHRkFpcnNZZ2ZDZzJxdGIzWU1GaDI0QndKM0ZnRXJ5?=
 =?utf-8?B?TUNxNS9rSjlUYmt5SHBsR3FPK21PYU1JclViMWdkQUFwS28ya1o3U0ZnZDFQ?=
 =?utf-8?B?bFAzVkRMR0JFYmtaUkRSWWtqYloxTEZaYWpUTnMvQmxtajhLR0hKYU5ZQ2Q5?=
 =?utf-8?B?ZWl2MWkzR0dwdTR2YkhvTU52WjdEVGp1N1JKQTZwKzBtejdvOUREWFZadWJC?=
 =?utf-8?B?YllxdG9iSDc0a2YvVkE1MlZrYjdhWEVIYjdUYzhhMGp2S0xEdmY3L1dlWG5q?=
 =?utf-8?B?b0U5YnE0MktyQzlNc0NCQ3BTcVdYejI4MEJjZlNLMzltdEhHOEVMdUF3K0Vi?=
 =?utf-8?B?NEp2aHlMd2kyZEVMVnVLcGd1cjVlUWRTbk5yOHczVmFiREEzSjRLcTVBdGFD?=
 =?utf-8?B?YklNSGNsWVozQkF2dkMvKzZRVVRWb0RIdXpKL21mVHlvZklRTThrbDJyWU54?=
 =?utf-8?B?T3RidEpybWFUbTNnRDhEYU90VVFRNC84SG5oYisxdlhwYmM5M3luVDE4ZDFB?=
 =?utf-8?B?bkJ2ME5ycW0xMHhHQ2VGaWJ5S0lSdVM4bHJHbkhqSkNuZk9YTzZxQVlKRVlH?=
 =?utf-8?B?NCtSK01ReEVUWno3QmppeXZ2MjA3c0cvdThEbkRHVTk2c1NwQUtxWU5HNkMw?=
 =?utf-8?B?UGNIYzNVQmVJaXVOL1Urb2tSNGh5L3dELzVqd05SNTE5Q0o0WHQ3enBkRDBI?=
 =?utf-8?B?azBocmMzWEdDUkNOVksrb2FzTk5YYTlWU0hQK1NGYlVhYWhHeUxRWHZEYmZo?=
 =?utf-8?B?dGFGZitXQ1NuM09zaDFoRHk4UlJpZGN6bWxTVXo3Qm53ZEd2SUlsdlAwMWFv?=
 =?utf-8?B?bjNsaXpGK2JUMVJsM0lVWTNGZitWQk92ajlhdXdTVXpsdk5PZENHWU1SSVZQ?=
 =?utf-8?B?OGV3T0RWK3NYcnQwUXhZTVBBN0JVTVZySzVsWGl5TlYySUhaWnRZQktueXRh?=
 =?utf-8?B?SE1JY05Fc2YxYUNHdXlUWVB4a1R0V0Z0V2prU25UeE1kNC9TcUNmSVVrU002?=
 =?utf-8?B?akpGdzhTODVsSFNsck5wNUJHZTFLYW9TWWlzYncraHQrMHorbGJUQ1M2eVNk?=
 =?utf-8?B?a0lZSkU2NnZNZ3pzV3lWNGIwNE44bnZaWE14YzhObWFyaTFlR0E3bnNLSmFh?=
 =?utf-8?B?bnYvZ0xZS25zcEg4NmxMMnoyemxFZktoYWRVTXZKUHcwOFpuUXZBS0h4Vm9l?=
 =?utf-8?B?UXNDd0VFZSs5cyt3V0JZcW05SzlsYkhVWUcwS2lLRCtTcDBjWTU4d2ZhN0lj?=
 =?utf-8?B?aGNhZkFWYmFXSGJCd3BaZ0RxTFVFcTVaTmtXVzdvYWFCcnlRSHlweEJOZFhi?=
 =?utf-8?B?eW5rWnRjNjVXcWNhNm5pOEoxc2lrYVU5N2R0dmJOTGpZTHVFa2t2c1hSUVZw?=
 =?utf-8?B?T2RMbXZuQnFCMjVyUGtoVkZ0bllNdGVkR3gvZnhQMW5HYUdHOHl1UTQxZ0Zs?=
 =?utf-8?B?WHZTZFoxZk5JWnYzVnliVkptTGRsdXZ5VmlMMDVEamkwYXA0b0xkVzZVdERw?=
 =?utf-8?Q?BgYtj7Nc9G4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8262.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDZmbnhrT3ZLRVV4eHdBK1V1UEp1K09QQ2dBV3l1b3B4QzRNbWM1T1FSSU1i?=
 =?utf-8?B?cXgyUGI5WnB0QjAzR2hYNGQwNGxXVVd5NlBhcGQwWGhHTHNSVVJHRzk2eXRO?=
 =?utf-8?B?L1VXZU9FQU5wQzkxUWRObEhldnBVYlpMQXdualVhL3lvL3h3S01aM1BRYk1n?=
 =?utf-8?B?Y21SRGpRclhQOVlRUDJTR0tESndrbUxYK1Q3VE9IaTZReXU5bUczN0hBV1BK?=
 =?utf-8?B?RGNvWXAwVnhBTUllS0YzRys5ZEZrYS9GTHV5dlBBY3N4U05qd3NlQktnN3lV?=
 =?utf-8?B?bDRFWTlUcXVJaUJoRjMzNGdXejVCbnRkREp4cnR6U0tqeGFwbkxWMGZ1akhJ?=
 =?utf-8?B?YXZ4N2dOM20vLzZteVFlY21NVkRqTloyVHYxRzhpZnYxd1VWelpBcmpTbFVV?=
 =?utf-8?B?M1ZoSkN5WkFEZktpQVQzQVFRSHZBTkpMWi90TWIySit6bTBGTGgyYmpud0Yr?=
 =?utf-8?B?TGdyZmViZzI1NWpmcjdab1RJaTB1SG9CN1ZoSmtrK0tWNTFoMG1xOUZRZXlh?=
 =?utf-8?B?OFQrUW5XeTNTQjIvSHpneHNyL2lBV1FpS3NUQ0l1OGFvZGtzOTJ6dnhMMGNr?=
 =?utf-8?B?NU92WTVWcks1VG1iRjRIVlpyZkU1bzRaRDhGdWVVMENRYVAwNWVEZG82ZjA2?=
 =?utf-8?B?ZENUZTZMeUpCbzdlR2g5eExlS09JcndPajg1Y0J0WkduMUYyQ2RCZDQrNjNM?=
 =?utf-8?B?ajFjNnU0QUYwNmFhR1pvd2Fud3pNRG1TUGtuZXdRMHhMbXB1ZHVQK25MWmRq?=
 =?utf-8?B?NWlmL2FEc2Mybk5vTGF1SWVpUVdZVHFzbll5RnRxekp5WDFLdXZyQTlSNkxG?=
 =?utf-8?B?dGEwUml1RWovT2lNdnFqRXViNTB3NWZPTFViS1FtRGFlcmVGWGcwZzE3M1k1?=
 =?utf-8?B?QzRrd2E1eXpqbVNTTUxiVUxBcWwwRDdTSUdlOEI3OGlXT0d6bmxCaktrb3hm?=
 =?utf-8?B?Y3ZtVllxbkVmbTkwdndQOWROazRKaVpNWlJqVDlZSVlqRmdHQm1OWXV0aStR?=
 =?utf-8?B?QUFacDlyZzFJSmxCTUNVaFhLcmlHU3VVdG95M21XTXQ0SjNzRnl3SDE4ZzE5?=
 =?utf-8?B?U3dMUGR0Y2oycmhsSHRObzRjZ2ViTlVhYVhpVEZYeHI1MzNsOHBZOXRHd3Qx?=
 =?utf-8?B?OFowRTh6dG0vOVNJbHZnMVprS1drN3N2QzA0K203WWhyd3MrQVRySWluZWdM?=
 =?utf-8?B?VmtkWUxaZTZLblhmeks1R0Z6Zm04Q2gxZWxxem9zdzBSODVUWE4zb3hpZVVF?=
 =?utf-8?B?RWpvTUxiZ2VuQWlSWG1FbzBZajYvWlpiS1ZvOVdRWDdzOHBmWjVaQWUxMkhD?=
 =?utf-8?B?SDdpV3E5Y2tJT3pYaWljRVMzdFFMc0o2cGc2bVd6cUVUSzVvQzV0VFBZYmYx?=
 =?utf-8?B?dEQ1dm9uUGtONXJVVFI2UTQ3ZlNPcG1GS3gvTzVRTWhWWEtjL04vaEI4SlBz?=
 =?utf-8?B?R1ZJRktNWHkwSWF6N0xmbkk0d3hRbEFCQklNY05yRHRXQk1JVHNSbGpDUTl6?=
 =?utf-8?B?ZHdSK3hueDdoalQyNEJXbHlSOXJzcXRMamtObDViSkoyZGFaWFN3MzBqYWpO?=
 =?utf-8?B?YkhDd2VlbzVRRlFzcEViVXpEL2NQNi9oUXpRQi9FWjFhc1Fab1hrZm5FY2I3?=
 =?utf-8?B?dWowZkJIazhhNW9aOXA3YzdoN1U3TVZpQlpPc0svZXJGaHk2TUxCZ3ZjVTRs?=
 =?utf-8?B?SmVPbUgvZ1lINlRrSWFGZGhhR3RLeG5aQWp1NC9nVVJoa2JnMUxGNm5vbXdJ?=
 =?utf-8?B?RW9oNVliTk1iZGJaY295dDUrMmloTTFkMHhoeGJRK0lHVmFzbDMxbFpEb1c0?=
 =?utf-8?B?WWxCdDgwT09OR1BpRHpDa0pWVHg3cURoVGFEMGlCNmMwREc4OTFkQ01jei9G?=
 =?utf-8?B?UWpEeGNzVXppR1NzUEthVEQxSHlnVDNFY3lGVHdXcS9jRXRjM3lZbHdzcTBz?=
 =?utf-8?B?RVRtWU0vLysyWmxPbVhQNWkzelZZeHQvUzMvcHRteTRFUm5zcnBqdk9IQ0NP?=
 =?utf-8?B?M1hMOVRSS1Yzbk9pN0VMQkg5RWxYUEtHM094bmVBTVlkY0t3L1dqYVIwYVpK?=
 =?utf-8?B?bzlNR1BrYTFKMEF1cWVhZUF5eVVPcllZTGlwOVpQT0tTVWFUS1g3SkYxclF5?=
 =?utf-8?Q?T162MCYag0UD5o1O4esLNrDAS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0887dd2b-9821-44f2-b36b-08dd9c56107b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8262.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 13:06:02.0410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDnNWkfyfksOXdXeoh8/QK522e7I571gWx97MAbkYDMS1LcXJrJvQnKGtcJWMmqvfcL4SDcTQjUkCJ4lH1wQaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5977
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

Hi Riana,

On 22-05-2025 09:04, Riana Tauro wrote:
> Hi Anirban
>
> On 5/14/2025 12:07 AM, sk.anirban@intel.com wrote:
>> From: Sk Anirban <sk.anirban@intel.com>
>>
>> Leverage IGT spinner to trigger frequency scaling and
>> set RPS minimum frequency to RP0 for achieving peak frequency.
>> This method replaces the existing waitboost mechanism used
>> to reach maximum frequency.
>>
>> v2:
>>   - Disable power consumption check for dgfx
>>
>> v3:
>>   - Implement igt exit handler
>>
>> v4:
>>   - Cosmetic changes (Riana)
>>
>> v5:
>>   - Limit the power consumption test to GT0 only
>>
>> v6:
>>   - Fix frequency restoration (Riana)
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/i915_pm_rc6_residency.c | 136 +++++++++++++++++++---------
>>   1 file changed, 91 insertions(+), 45 deletions(-)
>>
>> diff --git a/tests/intel/i915_pm_rc6_residency.c 
>> b/tests/intel/i915_pm_rc6_residency.c
>> index c9128481d..b400460c7 100644
>> --- a/tests/intel/i915_pm_rc6_residency.c
>> +++ b/tests/intel/i915_pm_rc6_residency.c
>> @@ -264,17 +264,6 @@ static bool __pmu_wait_for_rc6(int fd)
>>       return false;
>>   }
>>   -static uint32_t batch_create(int fd)
>> -{
>> -    const uint32_t bbe = MI_BATCH_BUFFER_END;
>> -    uint32_t handle;
>> -
>> -    handle = gem_create(fd, 4096);
>> -    gem_write(fd, handle, 0, &bbe, sizeof(bbe));
>> -
>> -    return handle;
>> -}
>> -
>>   static int open_pmu(int i915, uint64_t config)
>>   {
>>       int fd;
>> @@ -286,45 +275,88 @@ static int open_pmu(int i915, uint64_t config)
>>       return fd;
>>   }
>>   -#define WAITBOOST 0x1
>> +#define FREQUENT_BOOST 0x1
>>   #define ONCE 0x2
>>     static void sighandler(int sig)
>>   {
>>   }
>>   -static void bg_load(int i915, uint32_t ctx_id, uint64_t 
>> engine_flags, unsigned int flags, unsigned long *ctl)
>> +static uint32_t get_freq(int dirfd, uint8_t id)
>> +{
>> +    uint32_t val;
>> +
>> +    igt_assert(igt_sysfs_rps_scanf(dirfd, id, "%u", &val) == 1);
>> +
>> +    return val;
>> +}
>> +
>> +static int set_freq(int dirfd, uint8_t id, uint32_t val)
>> +{
>> +    return igt_sysfs_rps_printf(dirfd, id, "%u", val);
>> +}
>> +
>> +uint32_t stash_min;
>> +int i915 = -1;
>> +
>> +static void restore_freq(int sig)
>> +{
>> +    int dirfd;
>> +    int gt = 0;
>> +
>> +    i915 = drm_open_driver(DRIVER_INTEL);
>
> Why open again. The reason for making it static was re-use
> Is i915 not open when exit handler is run?
The exit handler is getting called after the driver closure so 
re-opening it to the restore frequency.
>
> Rest of the code looks good.
>
> Also respond on the BAT failures as the test is same and are legacy 
> issues
Yeah, testing rev again so that ci team can re-report the BAT failures.
>
> Thanks
> Riana
Thanks,
Anirban
>
>> +    dirfd = igt_sysfs_gt_open(i915, 0);
>> +    igt_sysfs_gt_open(i915, gt);
>> +
>> +    igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min));
>> +
>> +    drm_close_driver(i915);
>> +    close(dirfd);
>> +}
>> +
>> +static void bg_load(const intel_ctx_t *ctx, int dirfd, uint64_t 
>> engine_flags,
>> +            unsigned int flags, unsigned long *ctl, unsigned int gt)
>>   {
>>       const bool has_execlists = intel_gen(intel_get_drm_devid(i915)) 
>> >= 8;
>> -    struct drm_i915_gem_exec_object2 obj = {
>> -        .handle = batch_create(i915),
>> -    };
>> -    struct drm_i915_gem_execbuffer2 execbuf = {
>> -        .buffers_ptr = to_user_pointer(&obj),
>> -        .buffer_count = 1,
>> -        .flags = engine_flags,
>> -        .rsvd1 = ctx_id,
>> -    };
>>       struct sigaction act = {
>>           .sa_handler = sighandler
>>       };
>> +    int64_t timeout = 1;
>> +    uint64_t ahnd;
>> +    int rp0;
>>   +    ahnd = get_reloc_ahnd(i915, ctx->id);
>> +    rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
>>       sigaction(SIGINT, &act, NULL);
>>       do {
>>           uint64_t submit, wait, elapsed;
>>           struct timespec tv = {};
>> +        igt_spin_t *spin;
>>             igt_nsec_elapsed(&tv);
>> -
>> -        gem_execbuf(i915, &execbuf);
>> +        spin = igt_spin_new(i915,
>> +                    .ahnd = ahnd,
>> +                    .ctx = ctx,
>> +                    .engine = engine_flags);
>>           submit = igt_nsec_elapsed(&tv);
>> -        if (flags & WAITBOOST) {
>> -            gem_sync(i915, obj.handle);
>> +        if (flags & FREQUENT_BOOST) {
>> +            /* Set MIN freq to RP0 to achieve the peak freq */
>> +            igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0));
>> +            igt_assert(gem_bo_busy(i915, spin->handle));
>> +            gem_wait(i915, spin->handle, &timeout);
>> +
>> +            /* Restore the MIN freq back to default */
>> +            igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, 
>> stash_min));
>> +            igt_spin_end(spin);
>> +            igt_spin_free(i915, spin);
>> +            gem_quiescent_gpu(i915);
>>               if (flags & ONCE)
>> -                flags &= ~WAITBOOST;
>> +                flags &= ~FREQUENT_BOOST;
>>           } else  {
>> -            while (gem_bo_busy(i915, obj.handle))
>> -                usleep(0);
>> +            igt_assert(gem_bo_busy(i915, spin->handle));
>> +            igt_spin_end(spin);
>> +            igt_spin_free(i915, spin);
>> +            gem_quiescent_gpu(i915);
>>           }
>>           wait = igt_nsec_elapsed(&tv);
>>   @@ -350,6 +382,7 @@ static void bg_load(int i915, uint32_t ctx_id, 
>> uint64_t engine_flags, unsigned i
>>           /* aim for ~1% busy */
>>           usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
>>       } while (!READ_ONCE(*ctl));
>> +    put_ahnd(ahnd);
>>   }
>>     static void kill_children(int sig)
>> @@ -361,9 +394,9 @@ static void kill_children(int sig)
>>       signal(sig, old);
>>   }
>>   -static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, 
>> unsigned int gt)
>> +static void rc6_idle(const intel_ctx_t *ctx, uint64_t flags, 
>> unsigned int gt)
>>   {
>> -    const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
>> +    const int64_t duration_ns = 2 * SLEEP_DURATION * 
>> (int64_t)NSEC_PER_SEC;
>>       const int tolerance = 20; /* Some RC6 is better than none! */
>>       const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
>>       struct {
>> @@ -371,10 +404,11 @@ static void rc6_idle(int i915, uint32_t ctx_id, 
>> uint64_t flags, unsigned int gt)
>>           unsigned int flags;
>>           double power;
>>       } phases[] = {
>> +        { "once", FREQUENT_BOOST | ONCE },
>>           { "normal", 0 },
>> -        { "boost", WAITBOOST },
>> -        { "once", WAITBOOST | ONCE },
>> +        { "boost", FREQUENT_BOOST }
>>       };
>> +    int dirfd = igt_sysfs_gt_open(i915, gt);
>>       struct power_sample sample[2];
>>       unsigned long slept, cycles;
>>       unsigned long *done;
>> @@ -407,12 +441,21 @@ static void rc6_idle(int i915, uint32_t ctx_id, 
>> uint64_t flags, unsigned int gt)
>>         assert_within_epsilon_debug(rc6, ts[1] - ts[0], 5, drpc);
>>   +    if (gt) {
>> +        close(fd);
>> +        close(dirfd);
>> +        igt_power_close(&gpu);
>> +        return;
>> +    }
>> +
>>       done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>>   +    stash_min = get_freq(dirfd, RPS_MIN_FREQ_MHZ);
>> +
>>       for (int p = 0; p < ARRAY_SIZE(phases); p++) {
>>           memset(done, 0, 2 * sizeof(*done));
>>           igt_fork(child, 1) /* Setup up a very light load */
>> -            bg_load(i915, ctx_id, flags, phases[p].flags, done);
>> +            bg_load(ctx, dirfd, flags, phases[p].flags, done, gt);
>>             igt_power_get_energy(&gpu, &sample[0]);
>>           cycles = -READ_ONCE(done[1]);
>> @@ -451,19 +494,20 @@ static void rc6_idle(int i915, uint32_t ctx_id, 
>> uint64_t flags, unsigned int gt)
>>         munmap(done, 4096);
>>       close(fd);
>> +    close(dirfd);
>>         igt_power_close(&gpu);
>>   -    if (phases[1].power - phases[0].power > 10) {
>> -        igt_assert_f(2 * phases[2].power - phases[0].power <= 
>> phases[1].power,
>> +    if (phases[2].power - phases[1].power > 20 && 
>> !gem_has_lmem(i915)) {
>> +        igt_assert_f(2 * phases[0].power - phases[1].power <= 
>> phases[2].power,
>>                    "Exceeded energy expectations for single busy wait 
>> load\n"
>>                    "Used %.1fmW, min %.1fmW, max %.1fmW, expected 
>> less than %.1fmW\n",
>> -                 phases[2].power, phases[0].power, phases[1].power,
>> -                 phases[0].power + (phases[1].power - 
>> phases[0].power) / 2);
>> +                 phases[0].power, phases[1].power, phases[2].power,
>> +                 phases[1].power + (phases[2].power - 
>> phases[1].power) / 2);
>>       }
>>   }
>>   -static void rc6_fence(int i915, unsigned int gt)
>> +static void rc6_fence(unsigned int gt)
>>   {
>>       const int64_t duration_ns = SLEEP_DURATION * 
>> (int64_t)NSEC_PER_SEC;
>>       const int tolerance = 20; /* Some RC6 is better than none! */
>> @@ -557,7 +601,7 @@ static void rc6_fence(int i915, unsigned int gt)
>>       close(fd);
>>   }
>>   -static unsigned int rc6_enabled_mask(int i915, int dirfd)
>> +static unsigned int rc6_enabled_mask(int dirfd)
>>   {
>>       igt_require(has_rc6_residency(dirfd, RC6_RESIDENCY_MS));
>>   @@ -570,7 +614,6 @@ static unsigned int rc6_enabled_mask(int i915, 
>> int dirfd)
>>     igt_main
>>   {
>> -    int i915 = -1;
>>       unsigned int dirfd, gt;
>>       const intel_ctx_t *ctx;
>>   @@ -582,19 +625,22 @@ igt_main
>>       igt_subtest_with_dynamic("rc6-idle") {
>>           const struct intel_execution_engine2 *e;
>>   +        igt_install_exit_handler(restore_freq);
>>           igt_require_gem(i915);
>>           gem_quiescent_gpu(i915);
>> +        intel_allocator_multiprocess_start();
>>             i915_for_each_gt(i915, dirfd, gt) {
>>               ctx = intel_ctx_create_for_gt(i915, gt);
>>               for_each_ctx_engine(i915, ctx, e) {
>>                   if (e->instance == 0) {
>>                       igt_dynamic_f("gt%u-%s", gt, e->name)
>> -                        rc6_idle(i915, ctx->id, e->flags, gt);
>> +                        rc6_idle(ctx, e->flags, gt);
>>                   }
>>               }
>>               intel_ctx_destroy(i915, ctx);
>>           }
>> +        intel_allocator_multiprocess_stop();
>>       }
>>         igt_subtest_with_dynamic("rc6-fence") {
>> @@ -603,7 +649,7 @@ igt_main
>>             i915_for_each_gt(i915, dirfd, gt)
>>               igt_dynamic_f("gt%u", gt)
>> -                rc6_fence(i915, gt);
>> +                rc6_fence(gt);
>>       }
>>         igt_subtest_group {
>> @@ -621,7 +667,7 @@ igt_main
>>                   igt_dynamic_f("gt%u", gt) {
>>                       struct residencies res;
>>   -                    rc6_enabled = rc6_enabled_mask(i915, dirfd);
>> +                    rc6_enabled = rc6_enabled_mask(dirfd);
>>                       igt_require(rc6_enabled & RC6_ENABLED);
>>                         measure_residencies(devid, dirfd, 
>> rc6_enabled, &res);
>> @@ -635,7 +681,7 @@ igt_main
>>                 igt_require(IS_VALLEYVIEW(devid) || 
>> IS_CHERRYVIEW(devid));
>>   -            rc6_enabled = rc6_enabled_mask(i915, sysfs);
>> +            rc6_enabled = rc6_enabled_mask(sysfs);
>>               igt_require(rc6_enabled & RC6_ENABLED);
>>                 measure_residencies(devid, sysfs, rc6_enabled, &res);
>

