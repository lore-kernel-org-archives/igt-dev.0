Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37594CCF9FE
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 06:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DDC10E357;
	Mon,  3 Nov 2025 06:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f9neUI44";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B0310E14E
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 06:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762150823; x=1793686823;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vow26SZd/LW76MDrhlVEKchTMpSootV5VI4E3Pomd4o=;
 b=f9neUI44c+PN4KPtPk5skT55WMbiVIKFptTF6qlwtG8HOfUtsqKq7Pjb
 VLy5btZWn/lIpWho7lDQXsZnzIm0ClkDU/amdWYB4pAftBUQMYRqsekTC
 qXzfienXFJwqonxpU2ilx9hVhrvcoEpCDpEIrpjD/2cUKxkjtCK6Pmu8i
 g977ilqcOtd0J0QLpmVJ56LHSa0/i0vCtrDGKvaXIl7NmHwjPmt7JVW+P
 YzHCtLkz+Xv25JlF42tD6dg1nhpqfeFpaZEtLv/B4TD8h6mglFGwIIb8o
 4WygybYwBQO7dgWq7hyM6SzUr3hBidi6vLmeNfKrB5/G0SDVdmY777JfD g==;
X-CSE-ConnectionGUID: eqNSBCFVSZmdyCa2Tj9JRQ==
X-CSE-MsgGUID: IlzmOl+nTBGdD7jFF+fSsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="74898631"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="74898631"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 22:20:22 -0800
X-CSE-ConnectionGUID: HR0ZAlZXSe+FY7dCoZ2L2w==
X-CSE-MsgGUID: wbKnMBnERseYVQgbDOVDkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="186735759"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 22:20:22 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 22:20:21 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 2 Nov 2025 22:20:21 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 22:20:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dO1WZcQQV210sfRLuqHfxlcDk6m7xMxIJ0/9tbkKe45g/+M8zHV2nxTgpbPYGyPkEm/AjcCJVCke9NMKIahu7jApIxuJpzGT9Lk8AkxSm6T7oSWTsrqCYebvB/hqO87J7ksgg9MOXicuVE2Yg/dnohh+ForCYtSxdnVHde6XPDZ9vr1Q2KG9j+1MxFIREqHjz/XAg5JMIbkWl12RUffNYZOOTkE6sKrOXtHHzYuUnDNZDMPoCn8E98IMtd4lRS4FAgVt6O4qLaIQSDDZGjZaivhcFCaKCUm2PZeS3Ki1GhkSgDg9w0aWNFiWbr86F3OZeIQMj1YTiAz08rfUtBYH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+uXa93FzdzzKlcM78ULx0NTwLa64h0XpYH2LsLZ5rg=;
 b=uROb3tbCfCpNhLy2zmPyHzI+brv5+NkH8+XZ8ZiCeBMZU1Lg/NuLua44sfACWRCD8/+qN1uhZ/60BwcV1ekP7NdTUI9E75o8NAmn2b9/gkOuZ7PCiISLEAOWSVAt8WN0rZ1iO979bCa+LF/PDJba2fongNAsz7Zx614/OPlIFmJLd+k3GzRxGohJhR162XXJNDGVTeS31Y2vjB55CxDP36Lvvkbd7Q8zKjd9/nTNpjXMFXHyprA4S1ETj9FKgcZD/qsrTNHUmrGHwc/T5xaKpp0izxzezBKS0OmDxc0UqlkOuNBsyio3KVzWkCcRoatMiI+NVYfgyWRwLZ9J/fmahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Mon, 3 Nov 2025 06:20:20 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 06:20:20 +0000
Message-ID: <b062d08d-8405-4b14-9c64-7379c21da21b@intel.com>
Date: Mon, 3 Nov 2025 11:50:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v9,1/3] tests/intel/xe_survivability: Add new
 xe_survivability test for i2c adapter
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20251031093452.3842245-5-sk.anirban@intel.com>
 <20251031093452.3842245-6-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251031093452.3842245-6-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0213.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: 92905c9a-3077-42ff-e1d5-08de1aa1101a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXRYdXF1emJXMmFyTkoxZjlTMDBVNWFqamJxM0ZXQ2g4cVQxeUdQQnNjNjlo?=
 =?utf-8?B?cy9mU2hFOXZmMnZiRThjZFhmdVJLNWNBU2hqWnczOFNOSmtFOHQ4QUZzbEll?=
 =?utf-8?B?QkJ2QXRHWUg1R1c2KzVvUHRnaCtBVXNoQzFpQ0Qvd2xtYzIyY3VvT0NXeGlW?=
 =?utf-8?B?ci9zTXZoeGZzdmxUQXpvTkRuUmZyWGJ5M01wTjBjWVV2dHlQSm5aRkhmbHQx?=
 =?utf-8?B?LzZHRXM3dGlEc2pkTHU2NzJCNnBDS2kwbkNnRGJvek9uTWVpZDQ5NmtVQWxV?=
 =?utf-8?B?anZOTHZya21xSlN3alA3YlAwUTl4dkZEMnBtU3pyQ1Q4Sll4QUMwK21HbnBt?=
 =?utf-8?B?UElCbTdUcnpkaGloME9mcXJlbXNrSjJvS3kvYWVlcWFOUEFhVS96ZGgySG83?=
 =?utf-8?B?TWY5U2lzNkNuWUoyY0hQa3ZXS004bDRIbGE2bVNaTDJ4Q0g5bThwMUhCa1R4?=
 =?utf-8?B?dGNONXoxMmswNHhTTkxmcDFYYUVsbVIvVWlsS3pDSTVWYkIvYlR4SDg5S0NR?=
 =?utf-8?B?THUxdGs3a1FqdzJGSlorb0hnMVQyS2hYVkY1eEVJc2JnU0MzSGNaR0NDWHlL?=
 =?utf-8?B?dXRveW8rRkN5WGlZbXFHSkRkdWZtNVhsOWtCVXJQdW90RUJXWWRFc2RJLzNi?=
 =?utf-8?B?aU5ZcVNLblF5eW9XS2NxcWRxeTJIZ2FtcWpQek1iN3VVNFkxQmhHbGVwL1FK?=
 =?utf-8?B?NWh5TUxFZWxlZjlKRk5lTGw5bjB0dUJ2emQzWWNxNmJjaDlockRVckx5US9w?=
 =?utf-8?B?WnQyZnR3Y0cyL1FVcVdaajhuQkJ1OW9JNmxWVnIwdFFlbjRDMitkZWJXa3dI?=
 =?utf-8?B?eEk2MUtzc0FncWw4Y3BYRzhqOW5pUXJ4L2d2ZUNObjc2UCtpc21HZmZDMnRo?=
 =?utf-8?B?SHhNRXIzZDNSSzFtbTl0NVpxbjRFYXcxZVVSRjBrWE43Q2xiTTZvMGJBTFVm?=
 =?utf-8?B?NVJVWmJkcUNQeTlBUWE4TS9MN2lFYnpTWlNEbktxU1NxbmNyTmRWRTdMeGxN?=
 =?utf-8?B?MlRLamFPQ3djcU9ONHRETTM1LzZYdzVqaUVoVkVDRkFzbUJYLzA2OVhhSytk?=
 =?utf-8?B?SWNoNkZtamJhSzMySjFDRWNrU05mclhDUGpjQ1orOHYrL1hZZWhFZTdWb1B6?=
 =?utf-8?B?Q21WKzNMdnVWR3IvZ1YzNitxcUo4R2VCcWNnVFErNmZnRERYcVJqTHJGRURJ?=
 =?utf-8?B?QmZGYi9rWGpWcm01eGdhcUI0Tnh1UytPRkV2dWxJWk1pdnRTdzJYM3RLTUwr?=
 =?utf-8?B?MHYycDlJcERwZzlTMkVPc1ptK3lQYXhiNjJzMlNOL0JuUEpWVDhpTG5OUVlu?=
 =?utf-8?B?R1ZPZFozeG5DRU5YVXJBMXhpaWhuaXVjRGIrYmVyd3FzQnFSRkx5TnlWR1ZK?=
 =?utf-8?B?K2lkcXhhdHhiM2Q1Nk9zMHFpeXlsNHN3RmlRVmJwSGdUNGtrdWJ1QjFqQmZW?=
 =?utf-8?B?ZGFVZmN0cUg0NmNydUNCQUdaNmV6dnl2dUREdUMrM1VkSS9UYWdOMThCZ0t5?=
 =?utf-8?B?ZmcwSlI0NzhCUEhrTnNrdjhSNWpXT2JkeXRIMU9HdVREWlN6enBqeGVRMWpG?=
 =?utf-8?B?ZFRCTEZDS0tBanZUYThCSzdBZG5uUHE5dXRpLzFnL1NpUnhyeFRuRVBIbG9w?=
 =?utf-8?B?SHVJMVNETDdUTXlISjhvWFdFQ2VtWTBLa0kxQmZKMTRlcUpMY0pBQkxTOWU3?=
 =?utf-8?B?c0VmamtRQmZKejB3TVVCcDJGS2hXQnVIMHcvOXh3Z3A2UFVUNzlrQ2NLOUtN?=
 =?utf-8?B?N0pSUjVOTzBHMmQ5MGxlUCtFOEx2MWs0SVdaejduRlRUaGFldmZ3WCtTbzJx?=
 =?utf-8?B?K2JzVXdsakpPeG4xWnpjMmg1MmlXcndzUE1KUVBPYzMvSWtZQVZJWEFhRmtI?=
 =?utf-8?B?Q0JLREZRWUUzUlU1a0FCZmVkTmcwQW04Z0NycFFIRE5GdUhrV0xSRHc3dTRH?=
 =?utf-8?Q?VbKc/tVBmxC4qRh20qNVzEmmxH32QpS8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDlVTmljRXh3QnE1L3hrZmxUZkQ4SFk3WnZhY3FRVWszRU1LOUkrejJYV2NS?=
 =?utf-8?B?L1VocHJTTzRRSld2dFVXQXd5d1F4Z1ZDMFdoMmU5U213V1EraGZhc3FuLzVo?=
 =?utf-8?B?aTBnMXZiOVNJMUFWYmg3bkI5VUdSN3JGcS81NDBCbDhYWHFHRWJrYUJrbEwv?=
 =?utf-8?B?SWZnUFNCeGNBeW5SSGpwRnVCR25YaURzMHBwd3pxM2Q5OE10QUZDa0J1THl5?=
 =?utf-8?B?RGtUci9wc3FsVUdmeGxtTTlpbkRnQk9RclZzTzNFak51dmJ5dWtndUIrZnJS?=
 =?utf-8?B?M2ZlQnRtWHFVeVNQMS8yTEJnOGVaU24wTjZ0Ulk1SEwxNm12WWZHZlZ1eE00?=
 =?utf-8?B?YUVkWWg3eUlvTzE1MW9pZWFGY3FBOGNUYWFRQ21YVmNqVERYV3ZLRDNobEV3?=
 =?utf-8?B?Mk1TbE1GNVJ4dWQ4Ry95cmRMaWFsZ2w1dm5BRnF6bEY4MFJoM3B6TkJHeExO?=
 =?utf-8?B?NS9nc0RIeW93M1F6TVpRbVhtRXVuNm9Zamt6cG5FSGZPeDdjdDRjNzJEZ0NH?=
 =?utf-8?B?TUR5TEMrTG95SFFVL0Fyc256RkxhQkxRSytPdEVCQW95Y084b1k0Sm41bDJy?=
 =?utf-8?B?NmxCdldXaW14VGdTY3JMSjhzSXh5Z3hFcVdkNE1MOUZYZ0tGRUtKN2QxSmR1?=
 =?utf-8?B?b0V5OWN4dVg2aDBkQUZJbndlQlRBc0dtZkNIQjRibFJCUDVHVmZIdDdmQ1My?=
 =?utf-8?B?c3lYZjcxYTZ2THJGVWEvbHJYUnBBc1ZML2lIY2E4MjV5VXJEUWxTQ2dEUnNa?=
 =?utf-8?B?YzYvWkYyajVpc0llR3loUG1iT0FoZ1Jta0FPVis5UGw0bkhhMlROdkhZemlu?=
 =?utf-8?B?QzBkRXZvMk9EVXFWMkthSUhTd3VodldCaDlpYU04dmkzZG4vMG5Ldkc2ZUFU?=
 =?utf-8?B?bjRDNXE1a2psQnNTamtiMzFveGhMRGpxT2hlUFRrallDeU9CSmNSTXJFS3pz?=
 =?utf-8?B?N3Z1U1hnSHp3SHpsNUxzQkNvRXF1Q0lHbnZHRXV0UTdsbTBOL25zK0M2VEVE?=
 =?utf-8?B?d2psT2hXV3o4dWFlRmFRYm0vaHdlaFh4eXBRN2ZRMEx2bHAyMU5lVFA1VTVY?=
 =?utf-8?B?aE1rTFZzRVZMYm0rQ0t5bGRkdlF2QmtFVlo4SDREclJPdHQyb0MxRkJsakhY?=
 =?utf-8?B?QzVVbEozd251VWlOeHorV3ZkT3NucGRrRDM3a3BRbkF1NkIvcURUTGt6ZFo4?=
 =?utf-8?B?Z0s4U2xKNEJES3d2SHBDNTZmbmlzbFRFMW85bnZTbUg0aDhSbWFOeVJOZzF1?=
 =?utf-8?B?R2gxYzFqdVp0aVlJUjBFeUkyMUYveUp4YkJYL2hES1YzS0lFOGtXR1JrMlVk?=
 =?utf-8?B?VVhIWTBCalVXUmpYM1g4OEIvVVlCMFZnTjd2eDAxejYxNHAxcnBrRTZmOXNi?=
 =?utf-8?B?RHhRclo0OGZNWFgrQVBGem40SURmbmNrWlZvcHdNRFFRTjNNV08yK2lVQTJI?=
 =?utf-8?B?c1d5OVlIZjgvY3g4QVZsaTcydUw3V1NiNURHUm1CTlJpelpGaEZ6d3A3RHRR?=
 =?utf-8?B?N3VUN1JRV0JNMFB3cFQ3ZzR3d3NzTHZWcW1jcEZULzVpVDh5WlpxUDF3MEk4?=
 =?utf-8?B?QlBBTDZUbmJvS2szV01LZ1hBL2QxTXZMY3djZ21qdE5xWEdHU3lYN2hYYTg4?=
 =?utf-8?B?Z0RjclZPSDIxbTk4L2FTNSsrWWFIQ0tJRVNpcGhhcVhabDUzUzk1Wkx1TnM4?=
 =?utf-8?B?YmREcmw2QjVsRjdpOFVja2RQaFpBVkNNRU14MTNzSEZkQ1Nhc05DNWNCNGky?=
 =?utf-8?B?N1hSVUovbnM5UitqWW15VzFLWjYwamttdnBudDZKSlpBbWxMbjY0UGQwV0ln?=
 =?utf-8?B?VVFrd0ZVYnIxNHpMajRXNThiZWtBT2Z3Q0E5eW1ScjNmNHpQYjNZbUpEU0R3?=
 =?utf-8?B?eDdkVTE0bFFEM0UxV0dqYmpBbXFkZ0k2RldHbTdaRTdGUFVqc0ZscWNScXNV?=
 =?utf-8?B?YmFMYU5jTzRwSmVudjliWExSR2txcGRRQnQxZ0RMRmQveld4L3Fxelc5ZCtD?=
 =?utf-8?B?VnRNOHZCQlhabjJROHNQM2FaK0ZESTJYVzEvQVJoN283bkIvMHBJbU1SU2xq?=
 =?utf-8?B?WG45Rlphb0hOL25ROHcxVWZUcFlUbXQrSkNJNHY2cFFlOHM3YlczOGFvaWZP?=
 =?utf-8?Q?5x6OCMA5qT0ta0DXLpqsaQ8bE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92905c9a-3077-42ff-e1d5-08de1aa1101a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 06:20:19.9257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvmqUEqYO8W6AaWC2nKOP8z0bnwuPqN71c18mqAPw/ataEOZ68MOl7VvluYHpoVF8WuALtARUtmbs1a5s5S/6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
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

Hi Anirban

On 10/31/2025 3:04 PM, Sk Anirban wrote:
> Add i2c adapter presence check in survivability mode to ensure
> the Add-In Management Controller (AMC) can receive firmware updates
> when the device is in survivability mode.
> 
> v2: Create new file for test (Riana)
> v3: Update subject, description, nitpick (Kamil)
>      Use drm_close_driver() (Kamil)
> v4: Update test details (Riana)
>      Align with xe_configfs (Riana)
>      Create separate function for sysfs (Riana)
> v5: Remove duplicate close(fd) (Riana)
>      Modify fixture (Riana)
>      Move assert to function (Riana)
> v6: Move VF check (Riana)
> v7: Clear survivability mode (Riana)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_survivability.c | 157 +++++++++++++++++++++++++++++++++
>   tests/meson.build              |   1 +
>   2 files changed, 158 insertions(+)
>   create mode 100644 tests/intel/xe_survivability.c
> 
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> new file mode 100644
> index 000000000..b20192958
> --- /dev/null
> +++ b/tests/intel/xe_survivability.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +
> +#include "igt.h"
> +#include "igt_configfs.h"
> +#include "igt_device.h"
> +#include "igt_fs.h"
> +#include "igt_kmod.h"
> +#include "igt_sriov_device.h"
> +#include "igt_sysfs.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: Comprehensive survivability mode testing
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: Telemetry
> + * Functionality: survivability mode
> + * Description: Validate survivability mode functionality
> + * Test category: Functional tests
> + *
> + * SUBTEST: i2c-functionality
> + * Description: Validate i2c adapter functionality in survivability mode
> + */
> +
> +static char bus_addr[NAME_MAX];
> +
> +static bool check_survivability_mode_sysfs(void)
> +{
> +	char path[PATH_MAX];
> +	int fd;
> +
> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> +	fd = open(path, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> +	close(fd);
> +	return true;
> +}
> +
> +static int find_i2c_adapter(struct pci_device *pci_xe)
> +{
> +	char device_path[PATH_MAX];
> +	struct dirent *dirent;
> +	int i2c_adapter = -1;
> +	DIR *device_dir;
> +	int ret;
> +
> +	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
> +
> +	snprintf(device_path, sizeof(device_path), "/sys/bus/pci/devices/%s/%s.%hu", bus_addr,
> +		 "i2c_designware", (pci_xe->bus << 8) | (pci_xe->dev));
> +	device_dir = opendir(device_path);
> +
> +	if (!device_dir)
> +		return -1;
> +
> +	while ((dirent = readdir(device_dir))) {
> +		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
> +			ret = sscanf(dirent->d_name, "i2c-%d", &i2c_adapter);
> +			igt_assert_f(ret == 1, "Failed to parse i2c adapter number");
> +			closedir(device_dir);
> +			return i2c_adapter;
> +		}
> +	}
> +
> +	closedir(device_dir);
> +	return i2c_adapter;
> +}
> +
> +static void restore(int sig)
> +{
> +	int configfs_fd;
> +
> +	igt_kmod_unbind("xe", bus_addr);
> +
> +	configfs_fd = igt_configfs_open("xe");
> +	if (configfs_fd >= 0)
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +	close(configfs_fd);
> +
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +static void set_survivability_mode(int configfs_device_fd, bool value)
> +{
> +	igt_kmod_unbind("xe", bus_addr);
> +	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +static void test_i2c_functionality(int configfs_device_fd, struct pci_device *pci_xe)
> +{
> +	if (find_i2c_adapter(pci_xe) >= 0) {
> +		/* Enable survivability mode */
> +		set_survivability_mode(configfs_device_fd, true);
> +
> +		/* check presence of survivability mode sysfs */
> +		check_survivability_mode_sysfs();
> +
> +		/* Check i2c adapter after survivability mode */
> +		igt_assert_f(find_i2c_adapter(pci_xe) >= 0,
> +			     "i2c not initialized\n");
> +
> +		set_survivability_mode(configfs_device_fd, false);

Use only this for clear. No need to unbind rebind
igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);

With that

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> +	}
> +}
> +
> +static int create_device_configfs_group(int configfs_fd)
> +{
> +	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> +	int configfs_device_fd;
> +
> +	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
> +	igt_assert(configfs_device_fd);
> +
> +	return configfs_device_fd;
> +}
> +
> +igt_main
> +{
> +	int fd, configfs_fd, configfs_device_fd;
> +	struct pci_device *pci_xe;
> +	bool vf_device;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +		vf_device = intel_is_vf_device(fd);
> +		igt_require_f(!vf_device, "survivability mode not supported in VF\n");
> +		pci_xe = igt_device_get_pci_device(fd);
> +		igt_device_get_pci_slot_name(fd, bus_addr);
> +		configfs_fd = igt_configfs_open("xe");
> +		igt_require(configfs_fd != -1);
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		igt_install_exit_handler(restore);
> +	}
> +
> +	igt_describe("Validate i2c adapter functionality in survivability mode");
> +	igt_subtest("i2c-functionality") {
> +		test_i2c_functionality(configfs_device_fd, pci_xe);
> +		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", bus_addr);
> +		fd = drm_open_driver(DRIVER_XE);
> +	}
> +
> +	igt_fixture {
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +		close(configfs_device_fd);
> +		close(configfs_fd);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 73edd3e71..31487f62e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -329,6 +329,7 @@ intel_xe_progs = [
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
>   	'xe_sriov_scheduling',
> +        'xe_survivability',
>   	'xe_sriov_vram',
>   	'xe_sysfs_defaults',
>   	'xe_sysfs_preempt_timeout',

