Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78FDC36010
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 03:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9631210E1C3;
	Wed,  2 Apr 2025 03:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYzmkxWt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502E810E1C3
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 03:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743564383; x=1775100383;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=alKdO82u5ikANFmPbNVV+iBW9hZZn7KJQWNqzvsf4qQ=;
 b=iYzmkxWtwSHEOl6QH1lzXOyjQMWNjz16ca3JXcPQk09yPe0xBAcxOwsx
 O4W1ZSnM6NCdwS1939TnY//iy8yoxpMRb/5NXbQNrJ2Xz3lCk8Pvm0AKs
 Pq9nvy7tFpit1OZLoUtCsdG2kf9J2rBGgizWk+5176m8SkmdxHqHq9z8i
 r5PfOiyjy1+uR2B4q9Nvyt/ZDTXEBJWB7ZdKbSG1ypFhSr2cXRIKHz8LL
 jlQwBmfKiAfiYDAcgDIaNAJCxOxfmBr1aCgcf6h0iB7igqyx9n6N4aR2h
 nwzrmeW+vo/35G1lZjDXa93KEaRt0IhnAqTUyYf/M5p1vKBhiV3wJqk1b A==;
X-CSE-ConnectionGUID: b7EuctGTTJGTru0KXZjkcw==
X-CSE-MsgGUID: 3vMW8RPlR3OOyPBroQGJqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="62445551"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="62445551"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 20:26:18 -0700
X-CSE-ConnectionGUID: 5jYZ2Wm7Sv+Morb0Y6kopg==
X-CSE-MsgGUID: elI8QTolT/awxoUBn+sl3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="126332546"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 20:26:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 20:26:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 20:26:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 20:26:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUyYcN0OVMy2wIbbw6HJFP8rKJ0WNpyaIHa7C1reF7xFqNdfBQpolDg21lpesUePwvpNPypLJT9pNmYRzCJc099c3NuEpd+jM24b2djIGpRjiE0M01HN7s4weit2GPAiOcKoiCfN+LjNpOjl8Vpz3XrWTTJooPwWf8VtG3aEydwGk1jlYbVoWyJK6kRhkmERBMqwr0K00kziJiJzTVX0wHcFUBDQf/5wB6Oi81OYoMUOxvf1mGlqmdg67hxrfTFYHN9l4lWP6swzlPaJd2HqBIaxEBU5APN/vpJ3kdm53ANCZnPAxpmAZcTIhTjgIdCVfx1m4450aF/FkXLLdUmX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73HMpZ3FiYxl8ca6j5r6WIZqNXdk6KiJFnn/HaZlmu0=;
 b=Qa9qRpSo/JYzKD/P6pM9AccD2WGXNiRrCZ2vqFeAdQ+XV6QuVQR3ZO4Vh7H58g6k4d1B87/q8DYWA0XtA2W7SrtY4IfcaFeTZdJXTzR2Qmtn+P7ISCNPFSQxQ4EGYbEsWfPupxhDb1tDC9L9IgqxtMZK+J9GimRSGjOU3MWIyCGuoaQffE28kDhZ6SnsvIhRgJxRCtSfnB3bsgf0MhEBYOdk13vB88gFFltGqsDCTaLagdfTzu2qFd4X/s31qytzIpC7M1EAskzldAZF2JOwhYY8xcgME0Mz+CMCSa9+XFg+v7acDjotASUFd5fON/pBKfSgO8P37g9kZwlfcYJt9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by SJ2PR11MB8497.namprd11.prod.outlook.com (2603:10b6:a03:57b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 03:26:10 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%4]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 03:26:09 +0000
Message-ID: <06fe6361-5034-4f32-8e8b-480edcf8a790@intel.com>
Date: Wed, 2 Apr 2025 08:56:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip subtest
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20250324161319.2691351-1-santhosh.reddy.guddati@intel.com>
 <14e58368-11d1-4e47-9a8e-0d5d4d865cb1@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <14e58368-11d1-4e47-9a8e-0d5d4d865cb1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::10) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|SJ2PR11MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: e75a9e4d-3105-4b69-3560-08dd71961cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTB5SXVxSFN2OFJRcWZKZ3k4a3l6MW9IYldxZzNrOTMrN2oya1BMbzV6SzlD?=
 =?utf-8?B?RVl2NkxLd2VFbThoYnhPVHBqaythVDZxdUxCV084eDY5a2sxa2k0bVhtS3hU?=
 =?utf-8?B?WjhWdjlDNzVhTE5td0wvMFVMTnc2UGVBc3dwaVlqak1hSDcvYjZhU3R3Qkhw?=
 =?utf-8?B?UU1ubE8zcmtrZGh0M3NVcURuMFdtWURsc2g1Sy9vOVMwemQ2bSsvcG15SXl3?=
 =?utf-8?B?SUgySWl6VHNuWWhXeVh0UVg3THJXR0J2aThKZGRzak04TlRhdmc1OEt5T2NQ?=
 =?utf-8?B?OTZUOEtmaWRKYk1UeUozZjMraGQ1L1JDMzNNR3lGaEU4ZC9RNXdjdENwcC9K?=
 =?utf-8?B?M0lRdE1SYnJ3b1hLUW5hWEhoNldtUUpDMmhTN3ZQYit6ZXVaekV6RWxTTVMx?=
 =?utf-8?B?NEdLZnB1OHlRTk0wbm5ZRDNmZVVRWFlGaHBnNDBVNXh6ZjVhK0NVV1Z1eU03?=
 =?utf-8?B?b2xYY1RzS211aTUwRDdyYVVhaDNQcWE1OUs5bXBreFcrcVZnbFZ3YXkyNTZB?=
 =?utf-8?B?c3JKemc5K3Y4MHRaRDRIWm01R2tCZVd2U01GTG1VZGoxeHhzQ0Z2VTVQVlln?=
 =?utf-8?B?a0pTU3NqSFBJYm9WVXNJeGU2Tk0yb1E3RW1LNnJqaEpPdHUzenJpV3V1eUox?=
 =?utf-8?B?azZoZWlLTWJvaEpYN3dXSGFnVjVmekRyNUpqMUdEUVl2QkUydWRCaHowR2hz?=
 =?utf-8?B?aUdiaXYwZVo0R1hZa1g1WG1ocU5TSWhaQVlDQU14ekY2b2hFU0tkbnhxdUpl?=
 =?utf-8?B?TG9BS0dFWmgwUEtINjZQRGdyaW40NGl4YXFJRmdua2tsZ1U0Z3NmUFBKT2hS?=
 =?utf-8?B?ME9uaUFtNnlrQitpZTJnOUVKbXEwY2s3aDdGSGdSQ2l0d3FRekVaSW5ldVQ4?=
 =?utf-8?B?a2diWFgyVHo3ZXcvdVhKUTFBMWpTQ0R1NGNlWFM5UysrSm56UDZRdmpGZlRY?=
 =?utf-8?B?ZVhuR2lrM1VnSlBpdXJtb0lZQmVBb1oxbHFoTHlEWHNYb2FwenhvOG9LZno3?=
 =?utf-8?B?cS9uSDhrM1k4SU00bTVCdncwS05ZU3hoajJ5VzlPQmtQQ3hoRnhrcjJFUkJs?=
 =?utf-8?B?S1NpRmR6M0ttOWIwcHNZUnVXRHNWN0I2RURXL0k0em9SRTJwdVNZb0FjK1JG?=
 =?utf-8?B?d0RqeEpzbmJXT1ltTVFUM1VRUFB0VVUzTU5oOTJHb3FGVGRMelFHUzN5RXVj?=
 =?utf-8?B?NUxmYTZNcUdKOFIzVmRjbEczck13SEZqWkMycnBuRloxVWlKSk5CT0lpWlJV?=
 =?utf-8?B?T2dLcEJOcWs1d2pKdEZiWW56ZTZHWTdGK2pBNDdOSnUzcEZxUzFlTkJ5dmYz?=
 =?utf-8?B?THhEVHdPNDJxN0ZqS0cydHpHajFVMk15Y1BFd2d1S3hLWlBYWmtKN25Eemg1?=
 =?utf-8?B?L0Foa1YvT3liMDFZYWhNTjRUV2N3N3Z2NlBiQlhNUmhNcStwRjUzRUN3VENy?=
 =?utf-8?B?NjFHbDY2U1c1VDA4UVpSQk5ZT05IUWlMekR0UVZyNUwzU3pPdTZaWGYrbHZQ?=
 =?utf-8?B?SnBCbmVYeTh3MnJYLzU4NEFNZXdiU2p5UlI0Z2hlOGt0cm1PenZndlUzeTh5?=
 =?utf-8?B?NTlmOExzbkNhOUtnR3hFTTBVd055RDVRM29mYitqSGFDUHVDSG1xZkFpcERD?=
 =?utf-8?B?MWVBK0wrNTA3Q2Q2RGszWk4rRlNsdS85ZmxBbmNCanlvNUZUTUJkZXNia0dq?=
 =?utf-8?B?UWRyNjBZNmNUTUVKOS9EU1dYSlVjUW1EMTdsNEVuNDVPTDg5aDhDMUJJdGdK?=
 =?utf-8?B?Vi8xY3Z4cmFqcXBISDVpS2JsUWdCVW9Jd2pjSVNrVy91Q0M4eXZRbnR1RGJZ?=
 =?utf-8?B?dnpDUnVZelFCNU1CZ05nODJlTStON3B2bUkxN01DdDh3NUVQSUptUUkwNzVh?=
 =?utf-8?Q?wvzk/OIddT1TK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjhtWStub3JjSDZwM2ZxdHY1OXRvdUxvbWsyQStRSGdweUJ0WmtIN3JQSm1D?=
 =?utf-8?B?R3M0TlBEV2MwNVl1bGhYczBoRDFQTTc1ZWxPWnhTNXpBQnF5TlZuZkRPOGlG?=
 =?utf-8?B?MUxsamJYcGhzYkU3SWgyaWNZbVUvWCtuWi9NKzdyL0hTVThRVEh5M3pNTEtu?=
 =?utf-8?B?VFpOTWdVL1RFMVMrS2VLVWVoYU9Gd1dDbWJaRFkxdVQvUnFFZWg1YStvZ0dT?=
 =?utf-8?B?QjFHdmF4V1VGWk8vaGZzUHVlazRNMDE5VVgrbHErcytJeXh5RDFZeE1DcVpK?=
 =?utf-8?B?Vy9yYmk0cjd4VmowTmxwWlhZMndYcDY0RkZoRU1BQURoaGs2RHgrWFJCb2tl?=
 =?utf-8?B?cFVvUW9OZWVmdVR3b0RHMkh3ZS9jemtEVTVrVWNYM3E4c01jY3pjUjFYZStl?=
 =?utf-8?B?VitaWnhPVHBuZmhuZnVFSHc5bGpTYTV3ZldPbkpxcXZEVmJNeEVER0tlSEtL?=
 =?utf-8?B?RFUvSGJSUkIwYmlVUHFJb2NLdTU0TDlLc05qK01tZ2tYSGdYVTZQVnB6bFBm?=
 =?utf-8?B?WWJ4R3JrSVptTmQyZDBjQVNja3JpYnZnMzUveDdQUFdYVTV5dmQyTTkwQzVh?=
 =?utf-8?B?dE9HaUI1aE1XMVgxVVZBR29Za3dicUZoN0RpSGJtTkpST0VId0tmTi9xVkhS?=
 =?utf-8?B?dmVGRHF5SkJVQ2h6Q3NWWnNjeHJBdGtnNWJsNmZ1M1M4OXJJY2lMN0gvNGNT?=
 =?utf-8?B?dGZDSEJrWWMrN0VEUGNwd3A5MWpVc1cxTkZkNW83dzJOTFJ2UHh3dXBXK3dC?=
 =?utf-8?B?bHhvck5jZVg1V2JoYkl4RGNpR3hibFdnQ3dFK0RxMHo5UFVPQ1ZVaVh3aDNZ?=
 =?utf-8?B?WnI2SUpZUGlDVGpxUG5ORXQyR0x2OHd0QmpJRjN5cWhyWm9DTlVmYWt3NlNz?=
 =?utf-8?B?OUM1MUVxazJvNGJuY05xdFJhQmIzYXE1Tk9NUWs4bWExUGNrVUZUTld4OGVn?=
 =?utf-8?B?S0dka2xVVFZkc3NJcU9yMGxyaVVadndmamQybVArR0QzR2VzdUp4cDFMczcv?=
 =?utf-8?B?NHJFWmtzMHVHdWduL2EzTkJlSXo4bERxTDhnSWZKM3BsWUxGbzBldnFPS0RR?=
 =?utf-8?B?bEtlT1BxV3EwRVYyL2NUZHlvbUdtTlFteGZzMUlOU1VTeVBNcDdJdENRZVZN?=
 =?utf-8?B?RjFaWFFRbWRtQ2JCSkpLb2xsMjVLdVhkZVROVTFnc1BWeGJJZkpSS2hKVTlp?=
 =?utf-8?B?QVN1VXVaT0VabTl2eVhTaTRaRUczSU1TWG04anF6bmY1WHlxUlBpc2xDTnI2?=
 =?utf-8?B?RVFXMktrVGNlWnplYWJIdFZrMXNjSFNwaWxYa0pkMk1aWHd0bkhZaklQYTdq?=
 =?utf-8?B?d1hUVGE2ek1nbjQxdXpDTmlTdWhQTFhqcUxvcks0Q1hUQWVrelhJTlVCMysw?=
 =?utf-8?B?NHZmR3dyTEcwOGU0c3dnOEJ2SU14VmwyemVLYUtQd0twM2F2YmZIZkM1djkz?=
 =?utf-8?B?M2owZ29JbTZKRjNJYVMvbDNsREtrNlNyR0lRemRrenlkZWo0ZDdpRXJyUkhC?=
 =?utf-8?B?RkpIMkVkQWFyVmNuRzRTNjlEbEU5c0VPRjJZUVFJNW9BMjhJclhDVzhNLzJI?=
 =?utf-8?B?ck54U2RSNWRvZ0NHS1pUdnpKcnJQU2lSUTA1UmNQc25nbXAxbm1KdFg3dFBF?=
 =?utf-8?B?Sk9QRUdGR01yZ3l5eWpsa1BzQVFETXhYelBjb002WEovZVRubHRFZnA3Qlkr?=
 =?utf-8?B?d1NpTEZjQnkwWkU5bXBiZEhlaHBYcnZHY1libzlPaFlQcEFyRGU3dkhBQUVy?=
 =?utf-8?B?MGJrbXpSWGxBcHJIYno2YzEvckM2OU5uWkF6VjJIZkRXblZaSXlpOEE1RWlG?=
 =?utf-8?B?dDVGSjNrR2VVWnNUb3p2Z2RRMGtpYUJBY1Z2RGttM3V0akFOWHJCelVXYzRa?=
 =?utf-8?B?Y1M5Z2RXb1M0TXF4TWNmM1gyUFRrT1FVZm8wSm9jVVA1eVZRbTNiTTdTVkUr?=
 =?utf-8?B?OEpwbElNRzM2dzkvUHFHZFltcVVDd1VRQk5tOXRqR0VoeUx6Mlptbmo5WStq?=
 =?utf-8?B?UWwvUVVwcFA2NE0rM05UeGhyRFNpcGVvUitTSU9RNHlvbnhwc3lmUmZtTU1w?=
 =?utf-8?B?dFRucUlMQ3lOTkdEa2FJcDZ0ZStqNUJobmNPUTMrcVpycGVwejNKMkxuTTI4?=
 =?utf-8?B?Y2s1QXFSNEtxMHFXdy8rZDIydEtrT2RNYklSK2FtOU9OWXJSemhBOHhJY042?=
 =?utf-8?Q?laqANfiRo8jk7V1C4HG+G78=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e75a9e4d-3105-4b69-3560-08dd71961cbf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 03:26:09.9192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +f3L+0H+YBVqaShwF+vz9ci8mndJti9G4DXdlwyNx3738b+Xrq+N/AykqcVotOulpr5e4LmGO+cNnju0YEHtzquSIecyeevmgXCU5V6d97Azce8atg5KJ1UueyLSS9Z5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8497
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

Hi Karthik,

On 28-03-2025 09:28, Karthik B S wrote:
> Hi Santhosh,
> 
> On 3/24/2025 9:43 PM, Santhosh Reddy Guddati wrote:
>> Add a new subtest to verify async flips does not cause PSR exit.
>> Enable PSR and execute async flips to verify system remains in
>> PSR mode after async flips.
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_async_flips.c | 38 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index da426f753..cf6b63b3e 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -85,6 +85,9 @@
>>    *
>>    * SUBTEST: async-flip-suspend-resume
>>    * Description: Verify the async flip functionality with suspend and 
>> resume cycle
>> + *
>> + * SUBTEST: psr-async-flip
>> + * Description: Verify that async flips do not cause PSR exit
>>    */
>>   #define CURSOR_POS 128
>> @@ -102,6 +105,7 @@ IGT_TEST_DESCRIPTION("Test asynchronous page 
>> flips.");
>>   typedef struct {
>>       int drm_fd;
>> +    int debugfs_fd;
>>       uint32_t crtc_id;
>>       uint32_t refresh_rate;
>>       struct igt_fb bufs[NUM_FBS];
>> @@ -740,6 +744,33 @@ static void run_test_with_modifiers(data_t *data, 
>> void (*test)(data_t *))
>>       }
>>   }
>> +static bool psr_wait_entry_if_enabled(data_t *data)
>> +{
>> +    igt_skip_on_f(!is_psr_enable_possible(data->drm_fd, PSR_MODE_1),
>> +              "enable_psr modparam doesn't allow PSR mode 1\n");
>> +
>> +    return psr_wait_entry(data->debugfs_fd, PSR_MODE_1, data->output);
>> +}
>> +
>> +static void test_psr_async_flip(data_t *data)
>> +{
>> +    if (!psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, 
>> data->output))
>> +        igt_skip("PSR mode 1 is not supported on this output\n");
>> +
>> +    psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL);
>> +    igt_display_commit(&data->display);
>> +
>> +    /* Confirm PSR entry before starting async flips */
>> +    igt_assert_f(psr_wait_entry_if_enabled(data),
>> +             "PSR is not enabled before async flip test\n");
>> +
>> +    test_async_flip(data);
>> +
>> +    /* Confirm PSR is still active after async flips */
>> +    igt_assert_f(psr_wait_entry_if_enabled(data),
>> +             "PSR is not enabled after async flip test\n");
> 
> We need to be using the 'psr_active_check' here directly instead of 
> waiting for PSR entry as this contradicts the comment above the check.
> 
> This test will mostly fail once we have that check async flips should 
> ideally trigger PSR exit?
> 

I have used psr_active_check and verified that async flips are 
triggering PSR exit, causing the test to fail.

Given this information, I agree that the test will not work as the async 
flips cause PSR to exit. so, I am rejecting this patch.

> Thanks,
> Karthik.B.S
>> +}
>> +
>>   static data_t data;
>>   igt_main
>> @@ -748,6 +779,7 @@ igt_main
>>       igt_fixture {
>>           data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> +        data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
>>           kmstest_set_vt_graphics_mode();
>>           igt_display_require(&data.display, data.drm_fd);
>>           igt_display_require_output(&data.display);
>> @@ -896,6 +928,12 @@ igt_main
>>           run_test(&data, test_async_flip);
>>       }
>> +    igt_describe("Verify that async flips do not cause PSR exit");
>> +    igt_subtest_with_dynamic("psr-async-flip") {
>> +        data.atomic_path = false;
>> +        run_test(&data, test_psr_async_flip);
>> +    }
>> +
>>       igt_fixture {
>>           for (i = 0; i < NUM_FBS; i++)
>>               igt_remove_fb(data.drm_fd, &data.bufs[i]);

