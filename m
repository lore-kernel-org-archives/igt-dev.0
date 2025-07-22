Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B83BC83F25
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 07:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E5E10E623;
	Tue, 22 Jul 2025 07:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7yPkhdU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1CF10E623
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 07:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753171094; x=1784707094;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V8JL7Q9HEjobhWLV0lhmJAbmv6Xr5hTajRZjIjFn+A0=;
 b=i7yPkhdU4t2nr6s3BZHBpcyaPTyHRMYbO+nw98y1VgN9JlGlZ/KYNEG/
 Vl8JJ5shwjiXeVGlOONxdrdCl6iEEtYBu8lsYAtIG1v7ITZPtEQXLyzKm
 cFIPuNRoqo7Ew1EDjLMnLJnrYOncbyOQX/YOn5Q5dWqUzzf+MzkPc4wzx
 Z6q0Af0XWoXY+inCkKSKIqxiRzBN/dpLO0u+mP5dtGINhEUGgkaTnf/2t
 ZZcrg6Me6LUhhVl78T1PltEAgOCNxm6UnXVMQAqOr2fG4G5f4s20yy5SY
 r5BAZKk/RD7o7OV1sGc/JHB7b491Ip2gUwW4R9Ky2wNNevIXvFNje2S1f Q==;
X-CSE-ConnectionGUID: VtUmm+TZRceMv2XkdXzd6g==
X-CSE-MsgGUID: NJFMqSsHTsqaVgZ3Y1RiJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55351052"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55351052"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 00:58:13 -0700
X-CSE-ConnectionGUID: g+Bq/CR/QICmd44OtGhS2g==
X-CSE-MsgGUID: QDtKxQsxRoawcRBT/VRsEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="159468208"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 00:58:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 00:58:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 00:58:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 00:58:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0843X2237CCfNcK46DEOkPH1nn/QV5WBWmK+9aQfnjDo7D/Gmn96Af0mXNkHEh7hASPI1AP1qi7z0sYLUnMY+Zuu8mM08++QpseXxIhoY8H1jzcJtgoYH2wqnMysUP1Bk1Nz9UKPcubqTh6H62szqofWECNpjBUSfhdtvG0YxJ1umgKU3i/fsOn3nrTRzplh8xqJ8+1/wJSkgzX/bErINSLfydToL9RKc2GLPCBsdzGmr07bhiQmJz7lcicifcBI/NSqELOq5UBQ9zBqOotKdAEc2IXIfMZ2rrRpYX6e5Sk3ddhAAs90qzXmvR2QWT+OsyGMgHVGf+zYvF8O0bT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njDc/02i3T/SpqUoCa2fSRprM334YkiLuVihFfDEKz8=;
 b=lnQH8q8mCz0dcHaIbC8OXZ89vwJ+E8RfKn9rJL8M/bZwEnqVn4g410QvTUd6njloZ849akOhGgi4JQx0KcFdo0hGoea9ZQ+kH0V9fJYb4tZ/knyMMCK0SB0g5YgyviRQIE8npmaqRUyQHQUGUdOSQIu0Cu0Y6Lyd4J3UR2vvoF16aEl7KEQeKASE2zeTtZ8hlVJ5Q2IpobCFBLIwrlX35du4GE2bAcjFuoKsUvd1bbptQ8ovT71XPPuINbOnANwoSJdiw9rW6dBRlxmH99IB1ct54dslsMHHJUpX3AGQ/wdh5w3oNjFA2vtCWF3ycZIF9c3uOS4t3q3qsygskZPo2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH7PR11MB7002.namprd11.prod.outlook.com (2603:10b6:510:209::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Tue, 22 Jul
 2025 07:57:37 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 07:57:31 +0000
Message-ID: <2a53d3ff-eeb0-4dac-b8e8-1c88a230275a@intel.com>
Date: Tue, 22 Jul 2025 09:57:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_*: Apply NEEDS_VISIBLE_VRAM in
 remaining affected tests
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
References: <20250721092716.11880-1-lukasz.laguna@intel.com>
 <CH3PR11MB8434E5666757E4563097B86B8D5CA@CH3PR11MB8434.namprd11.prod.outlook.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <CH3PR11MB8434E5666757E4563097B86B8D5CA@CH3PR11MB8434.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0043.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::28) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH7PR11MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c58bde-cd27-44c5-ab6a-08ddc8f56952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0xLTmg1b1dFV2JCTEVHR0xwbll4TU9wa2E5Mkp1N2V0aFBINkZ2K1plRVZ1?=
 =?utf-8?B?b3daRllGYzU3QitqUDFCRTRzK0cwTFdVN04zRjVsWkVtUkRucVU2RUJpNmFP?=
 =?utf-8?B?WWFyeUpEN2JoelBzT2RSWXRpLzlpYnZOZE1BRVV2UDFFSE9iQWtyWjMrQ0V0?=
 =?utf-8?B?NFY1NHNWU3dseHBTQVRuYWxmVGcrdnlXbk1sMHFMV28rMEloeHhzZk14OUtH?=
 =?utf-8?B?MmtJWU0rcHd5a1VxWkduM3MySzdiWXpvWU9FUk5TSXFHb3ZlR3hEdHhtYlcx?=
 =?utf-8?B?TklCSWhTWkpwYnBZK2VqdmZOUm83Nmwvc1hpSGtvL1ZkaXQ2Y0gyZ2NLN0Nw?=
 =?utf-8?B?QnlxRDZIOUtmb3NXUFJpa2ZMeUNqRG5pZFNOdHRKbmxZcnlHcm9JQlFNVUpR?=
 =?utf-8?B?anVaUEV0MTg1cWVNTXY4OXUwa2Jzc1FQbUhVZWs1ZjdUdThMODZpczA1K2lY?=
 =?utf-8?B?QkxCZkxhVFVRVDhFZm9RQnFYd0pna2hjWkRUUHhoRTczTjJrcHRpNVltdnEr?=
 =?utf-8?B?Y1p5RHJ6UlYrd0hyWFBDN1VjckV0eHRDZXFPblFBRFpscm5WcHBxOUhwWG00?=
 =?utf-8?B?ZnowVnF5SDZnR2FEYS9WZS9PdkRRQysxL3lHZVRSUll5ZmF4d2NLWDh2amJu?=
 =?utf-8?B?ckZYUXVvaVdCTUt3TDJWSVk1NDJHdnFqS1QwbDVwTGhBWkRxY2kzai9uTjha?=
 =?utf-8?B?VTVFZVdkRXpWOUp5ZlNXY3Z0NndUNU1IbVN6d05HSEpHUGY4Ujg5eGJJWDVy?=
 =?utf-8?B?ZGpuMWR3UXNmR2ZuTkNtcldTVnpEL2FjMGMwRTR4ZXJLZU1Sa0wzK3BTS1dx?=
 =?utf-8?B?cXJTSFFWUjBwOU5maHZDQlFhakZJZzNRMG1PVnRrNERXL09ONFdrcE5zRi85?=
 =?utf-8?B?QVJiNzQ4OTBqbHgrWDVhY2RjbXdNV0RDbzVvN3ZKTGVnei9zMmFmckx4UXFI?=
 =?utf-8?B?SE9MMWxscThTeFh6am1rOWsyRmhWczJubGVvZ3VYQWNsUEQzRTNVbXVRRHlT?=
 =?utf-8?B?TVhSdy9XQlc0YVVKYVBGNTcyUVQ4blloc0xvSE13TCttN0kvVkFFZmlWZFQr?=
 =?utf-8?B?cXR3aXdMRHp2dVptbTZXRkExZlQrU3NDamtkekpWUDBINHhZL1F4MnJtajN1?=
 =?utf-8?B?RExkKzlhSW9LVnNHSkFWVWZOY1Q4MC85WTNCVmpyWUFpN3Z2Y3ZhUEd4aVFv?=
 =?utf-8?B?dEFPMVloM3lzTXhsSjdwWVpsTzdETUx3VG1MbC9sam1WQVdZZHpHS0ZTQ0Mx?=
 =?utf-8?B?ckhYQS9SR1J3WWM5Z0kwRTNsVDVjbmFnQ2hxZTJWRGQvOTJjb3hIMDNrbkpq?=
 =?utf-8?B?YVZBWFNPazNxL09KTlR2ZDQ2VXJIeVZFdXlVMTVCSUVPcGpUbVN5Z3psRmJn?=
 =?utf-8?B?R3RJTGg5QklVT2MrbExkaXA1SStIb3J1NE1BZmNZM0IydHBtVm50T01sUGFy?=
 =?utf-8?B?SXVZTlk0YVlYOEdVd2ZXcjJiTW1hcDhxSGFQc0xKOFNQRVJ3OE5WQkJRcllB?=
 =?utf-8?B?WWhlMjRGZ0pISjJ6a0FuMWVMWTFWMWR1bjAydGRZdHdockhvVHl3bHd3S2lp?=
 =?utf-8?B?c1RBNFFKbEwwV3pLN1BGSysxbm1CSmRwQm1UODBtM3AwTUV4N2ZlYkdoa25J?=
 =?utf-8?B?cWFkUWtIRzBxcS9yOUxDdnI5ZUNyZDM4SzlmOFF1ZDV1NjNOTllvcnZyYWVo?=
 =?utf-8?B?S3hhZTllanhGZTFneWh3eFB0N0k0UmtkMFBqNzdPSGdCM2N1TDNNUVlTMVEw?=
 =?utf-8?B?MU1VZTMxd0hyNXdWN1VzVEI1T1Vhdmxmb1NnRStwQXl0YUFPUXEvaDNWOWxk?=
 =?utf-8?B?NjdLR1pSZGVlL08rdUYvNk5RenpMVzE5MzRWWVBST2w1UDl5ZjZyZkV6NGM0?=
 =?utf-8?B?T3c5VDhidFBTS3dkVlIyQ1RSSFhFalFyeUI0QW5vLzdETENnUkZDcUhCb25C?=
 =?utf-8?Q?1Ntf8jhS0KU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEhjdFZXS1pmbDcrem81VTFtcW9IT1NubmpGYjBOTjlXOVl4NzRyeTgvZjM2?=
 =?utf-8?B?cFNNd0lmUGdIVi81RUtnL1FVVUVPMmVyWVNoeVY2QldOeng3a0xmbFhxbU91?=
 =?utf-8?B?VTVjWVh4RUQyVHRlbHhlS04vd2lCRGliZ3J4SXdnN2tFSXRCblZpQ1dxTkxR?=
 =?utf-8?B?ajhOOE1pKzhXK1Q4RVdtelNyNUl1Tkt2eldsUFJmcGNwUUNYR3F6MjdNSXlp?=
 =?utf-8?B?T2xnY2tKOXVRZVRMcm1CTm8vL2d1Z2ZNY0xyaHN6NUdxTlFWUkF1cjF4NTNQ?=
 =?utf-8?B?c1grOUh6WnNaVnpJUzNwQjdiMUNvMkUySlN6ajZSKytzcEtLUG9VVENVaHMy?=
 =?utf-8?B?MEliZ2VLZTJ0YmhRd1FBbnRwOEZ5eTJXT3lObHNyTDRONWUxR2RqZUora2RK?=
 =?utf-8?B?R3RkTWJwQ1hWUWhDMDY2OFRDaU85bmNBOEZ5VlpQYkpxNnRoNER0YjNCOVlh?=
 =?utf-8?B?N21ScDREL2NiYmIyNkxHZ2xvaUlNN0plQlBTWUo5ek9uN2NKOCtIbXY3eGgy?=
 =?utf-8?B?anladkFQcXVNNThEcUxLZGFGK0hjNHJKWkMzVkd1RDRYWDl2Vm9aeE5qVUhn?=
 =?utf-8?B?OHcxaFdnNmVoanRCbFMwd083ZHJrMmw0TTdTMlhzQ1pQTFVOSTl2ZVBNUnVt?=
 =?utf-8?B?R0NWSXd5WWxwRFBnSXFOVG1aVjRKeEFlOGRSSDFoZnlpaGQ4aDV0TDQxZTVR?=
 =?utf-8?B?TTl0cTFKbG1Xb3gvQjhRNXZVMlFXcHM4M2FIMDhSdjN3ekl2VHZ5RUJzZDRQ?=
 =?utf-8?B?MzVmQWE2ZjMzS1FhTzFYVW1naXljZEc2Z3dJWXNyNUUwUENieFF2NDZBZDRs?=
 =?utf-8?B?WG16MG1jUXg1NnNqdUpGM1FmZHdBSmlob0xyK2xnZjRycytmczVUdGFhNEZp?=
 =?utf-8?B?MitxMmozVW9RVTZqQ2xwRzNDV3YxMkFONjJGOW9nbWg4eTlZbkJDc004WGxT?=
 =?utf-8?B?Ny9OUUxZSnNGdDdrbUhxYUx5WmdDU0xYVzdWb2hCREVxSjM0ckRFak5ESk9U?=
 =?utf-8?B?MUw1Y2l5M2FvNkw4eTB1bkNHOVU2QWdobWNCN0pURWhidldUSXFJSlJxK1NZ?=
 =?utf-8?B?Y3VtMlN2NlZzZDZvVnRzZVQ5YmNzWEFaWGlGbzNzZW4yRERya1B3OTUxNEYr?=
 =?utf-8?B?RDB2YkRYdndqTExISms5YUJlQm02TFpCSGVzSzRLaDRVK3BRSzFJOUlpVFFn?=
 =?utf-8?B?ZUMyZDFLdm9Iei9EMmJ6QkRkNHphWVVwdTZTeGtzbzRyY2VvOTdQQmUvcGl0?=
 =?utf-8?B?RTE4WDJpalhRL0g2U2pwQ0N2S3ZRRVRhZU9ZNVM0Zk1qREpucTFvMkltSHhs?=
 =?utf-8?B?RG4rWTh3Z3hrVVoydU9LWTVzTVlVelJSdjlVYUpZaWdKRFNjOS9adm5rVCts?=
 =?utf-8?B?SHJNTlF5TlErdERIQ3YyOVVuY255ejZoUHNZS0JVbm1iTWpEMFJMV1ZQS2E2?=
 =?utf-8?B?SjgySTBQN05uZ2ZiZ2wrTUJqTUNpNVl4LzJZQmFUcUg5THNEbmRSTDgvbXk0?=
 =?utf-8?B?ZzJPdStRV1NnejdlQVN3NGM4K3FLRG9qQnIxVThWQ0tFN01GUkUrKzgyaHBs?=
 =?utf-8?B?UEFhVzBlemVScklwWTVhNHRXTWVEU09BakFwb2U5eTJPb3FZbDhLN0dzTjZB?=
 =?utf-8?B?U3RuRGNZY2FqWEhxejNNWkZqZXhUL3dDUmR3Y045SXVQYmRVRkdOZTVvWTdI?=
 =?utf-8?B?RytwbmdEaFBQRUorQ2VMcmxDVVFyTkc4aFc4K2xoKzZFKzhITkI2dGNyUlNj?=
 =?utf-8?B?bktTU3VDbjBtQWxDQW9LNmQ2Ym41L282TFVrSkFweDFUTWhFd2ZTeFVtcWtp?=
 =?utf-8?B?VVJsRmR2cnFUOUs4ZG9BTzdrV1R0ejYxRHExN0hjV2toTFViS0JlRzJzaldG?=
 =?utf-8?B?L1kxeGVsaHpReU1Zdml2bmZONGJ4T0tEd2VGZ0gwbG9sVEJSYU43U1l6bFBT?=
 =?utf-8?B?TUgzYVVnOTIyTUEyY1A0WVRXcTZMSmZTU0Q3Sit6bEs0RUdNVFdRM1JkYXFF?=
 =?utf-8?B?M1VtTDZTa1krenNXVG1MMkxjbVBxSTloYzIwRFEzMSs4VjA4Ly9oYjNvTktB?=
 =?utf-8?B?OHBmUXA3c0twc091emNYcDJmdGoyKy9Zb3ppOFRiQytjMWlnQUVzWGF3eXBl?=
 =?utf-8?B?RWZtWGhUeHZUM0tmV2tBSElKREpLZWVpWXVROUJDalJzYWRMbUJTaE9xK2h4?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c58bde-cd27-44c5-ab6a-08ddc8f56952
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 07:57:31.8424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nB1R9KwjO0+siXjg8301imsYsKnihYfd9U3fv/opmKC0bzNhdoEV05QiD/WC8bY96o4qbxOPAChmzWS1PoA+Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7002
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

On 7/22/2025 06:03, Dandamudi, Priyanka wrote:
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lukasz
>> Laguna
>> Sent: 21 July 2025 02:57 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Konieczny, Kamil <kamil.konieczny@intel.com>; Laguna, Lukasz
>> <lukasz.laguna@intel.com>
>> Subject: [PATCH i-g-t] tests/intel/xe_*: Apply NEEDS_VISIBLE_VRAM in
>> remaining affected tests
>>
>> Extend the fix from commit b9a5a4d03955 ("tests/intel/xe_*: Use
>> NEEDS_VISIBLE_VRAM flag where it's missing") to additional tests that were
>> missed earlier.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   tests/intel/xe_drm_fdinfo.c            |  3 ++-
>>   tests/intel/xe_exec_compute_mode.c     |  6 ++++--
>>   tests/intel/xe_spin_batch.c            | 12 ++++++++----
>>   tests/intel/xe_sysfs_preempt_timeout.c |  6 ++++--
>>   tests/intel/xe_waitfence.c             |  3 ++-
>>   5 files changed, 20 insertions(+), 10 deletions(-)
>>
>> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c index
>> 17f66f1de..264380d99 100644
>> --- a/tests/intel/xe_drm_fdinfo.c
>> +++ b/tests/intel/xe_drm_fdinfo.c
>> @@ -158,7 +158,8 @@ static void mem_active(int fd, struct drm_xe_engine
>> *engine)
>>   		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
>>   		pre_size = info.region_mem[memregion->instance + 1].active;
>>
>> -		bo = xe_bo_create(fd, vm, bo_size, region, 0);
>> +		bo = xe_bo_create(fd, vm, bo_size, region,
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>   		data = xe_bo_map(fd, bo, bo_size);
>>
>>   		for (i = 0; i < N_EXEC_QUEUES; i++) { diff --git
>> a/tests/intel/xe_exec_compute_mode.c
>> b/tests/intel/xe_exec_compute_mode.c
>> index f321e1d76..b904dc76b 100644
>> --- a/tests/intel/xe_exec_compute_mode.c
>> +++ b/tests/intel/xe_exec_compute_mode.c
>> @@ -367,7 +367,8 @@ static void non_block(int fd, int expect)
>>   	bo_size = xe_bb_size(fd, bo_size);
>>
>>   	engine = xe_engine(fd, 1);
>> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
>>> instance.gt_id), 0);
>> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
>>> instance.gt_id),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>
>>   	data = xe_bo_map(fd, bo, bo_size);
>>   	memset(data, 0, bo_size);
>> @@ -464,7 +465,8 @@ static void lr_mode_workload(int fd)
>>   	engine = xe_find_engine_by_class(fd,
>> DRM_XE_ENGINE_CLASS_COPY);
>>   	igt_assert(engine);
>>
>> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
>>> instance.gt_id), 0);
>> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
>>> instance.gt_id),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>   	spin = xe_bo_map(fd, bo, bo_size);
>>
>>   	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
>> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c index
>> 48a888e35..ee2d0ec3f 100644
>> --- a/tests/intel/xe_spin_batch.c
>> +++ b/tests/intel/xe_spin_batch.c
>> @@ -276,7 +276,8 @@ static void xe_spin_fixed_duration(int fd, int gt, int
>> class, int flags)
>>   	exec_queue = xe_exec_queue_create(fd, vm, hwe, ext);
>>   	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>>   	bo_size = xe_bb_size(fd, sizeof(*spin));
>> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
>> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>   	spin = xe_bo_map(fd, bo, bo_size);
>>   	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
>>
>> 	ALLOC_STRATEGY_LOW_TO_HIGH);
>> @@ -347,8 +348,10 @@ static void xe_spin_mem_copy_region(int fd, struct
>> drm_xe_engine_class_instance
>>   					 ALLOC_STRATEGY_LOW_TO_HIGH,
>> 0);
>>
>>   	/* Create source and destination objects used for the copy */
>> -	src_handle = xe_bo_create(fd, 0, copy_size, region, 0);
>> -	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
>> +	src_handle = xe_bo_create(fd, 0, copy_size, region,
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	dst_handle = xe_bo_create(fd, 0, copy_size, region,
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>   	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width,
>> width, height, region,
>>   			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
>> COMPRESSION_DISABLED);
>>   	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width,
>> width, height, region, @@ -361,7 +364,8 @@ static void
>> xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance
>>   						   mem_copy.dst->size, 0,
>> mem_copy.dst->pat_index);
>>
>>   	/* Create spinner */
>> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
>> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>   	spin = xe_bo_map(fd, bo, bo_size);
>>   	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
>>
>> 	ALLOC_STRATEGY_LOW_TO_HIGH);
>> diff --git a/tests/intel/xe_sysfs_preempt_timeout.c
>> b/tests/intel/xe_sysfs_preempt_timeout.c
>> index 139f68d22..ff58c4d49 100644
>> --- a/tests/intel/xe_sysfs_preempt_timeout.c
>> +++ b/tests/intel/xe_sysfs_preempt_timeout.c
>> @@ -86,7 +86,8 @@ static uint64_t __test_timeout(int fd, int engine,
>> unsigned int timeout, uint16_
>>   	exec_queues[1] = xe_exec_queue_create(fd, vm[1], hwe,
>> to_user_pointer(&ext));
>>   	ahnd[0] = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>>   	bo_size = xe_bb_size(fd, sizeof(*spin));
>> -	bo[0] = xe_bo_create(fd, vm[0], bo_size, vram_if_possible(fd, 0), 0);
>> +	bo[0] = xe_bo_create(fd, vm[0], bo_size, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>   	spin[0] = xe_bo_map(fd, bo[0], bo_size);
>>   	xe_vm_bind_async(fd, vm[0], 0, bo[0], 0, addr1, bo_size, &sync, 1);
>>   	xe_spin_init_opts(spin[0], .addr = addr1, @@ -98,7 +99,8 @@ static
>> uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
>>
>>   	igt_nsec_elapsed(&ts);
>>   	ahnd[1] = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>> -	bo[1] = xe_bo_create(fd, vm[1], bo_size, vram_if_possible(fd, 0), 0);
>> +	bo[1] = xe_bo_create(fd, vm[1], bo_size, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>   	spin[1] = xe_bo_map(fd, bo[1], bo_size);
>>   	xe_vm_bind_sync(fd, vm[1], bo[1], 0, addr2, bo_size);
>>   	xe_spin_init_opts(spin[1], .addr = addr2); diff --git
>> a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c index
>> 48076ddeb..5fcd4fc74 100644
>> --- a/tests/intel/xe_waitfence.c
>> +++ b/tests/intel/xe_waitfence.c
>> @@ -238,7 +238,8 @@ exec_queue_reset_wait(int fd)
>>   	};
>>
>>   	bb_size = xe_bb_size(fd, 0x40000);
>> -	bo = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, 0), 0);
>> +	bo = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>   	data = xe_bo_map(fd, bo, bb_size);
>>
>>   	batch_offset = (char *)&data[0].batch - (char *)data;
>> --
> LGTM
> Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Thanks for review.

- Lukasz

>> 2.40.0
