Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC75DC83F27
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 10:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8764B10E651;
	Tue, 22 Jul 2025 10:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULxQK7Xc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A363E10E651
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 10:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753180166; x=1784716166;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8WUE4Fi1oEtKeLBWce/Kp8HNhQhZBwLopa29HtpkQ7A=;
 b=ULxQK7XcGJ/ka/5WGJn2EtRiEPNIxYIuhrGQrzgYQituNSnVC+aYCpWB
 gjKfBGdL6WgLjX6lG6zDiTJCDZpQXHNJfcyRCPCuD15O7V3cvlMr6Euo4
 AR72ugFqOVjElXMifyslayHNhnuT1ONCxywMy7ki3wTBq4zd/sEZj+F+D
 C73aWtuH5I/Wz8PHtt5Jqsndv4pkBsXmphkexRSCco7UQaj7Q2qs3WsgG
 eyyS2LYk0qCcOJGcLR3JsVOXaLzrUty707AIGdyZpFloqRwL8FwXNiXEA
 bnqjbVxJ0Y5MUjdc8uiF1pq+MWrEt4jLLFizctScIun8WCLzL9q0+psFe A==;
X-CSE-ConnectionGUID: jI9aBKhuRrm82n2j3Z912g==
X-CSE-MsgGUID: Tpf6EDQsQMWrYmB/1A5s4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="72991924"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="72991924"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 03:29:24 -0700
X-CSE-ConnectionGUID: CDw51k0OQbKWyYZxoPswYw==
X-CSE-MsgGUID: gocyP9HJQD2ZTjHi2FJW5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="158763695"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 03:29:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 03:29:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 03:29:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 03:29:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlyc537NPozfO0VHamOiyzIVokrb6rAvBjI+N8xg2ijin3+mWExWUMNckOQvVkpyykL6atEI8xrhQf4NvoxBqiKQZpEDQEKseDX8I74ZpGkQ7xeih3j0NSX9yYcstulWbWhld9FAknDMcOgacXwKWoR8UhzlS6XujXH+s1xeghes+nK0TvsZmGoWzRphAEuEbi4Metg3z6Niy3DlAhgrjVzbcurCdCY/1Z32MRob4BI6+7HYOs80f4EYK4DH2TL2sG9A1+kA+fVEK7xxsm2ZePzkfwh1zKUStGvkejhEPqOsR+42ULYD8nHSC6L4Dyy2BXyJD312sDIPxHjOst5nOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9l/tUpp37NyQ8TQjEVSuSD0MyX0k2b56EMuVLSmJq8=;
 b=ZMDaPDVAS6GJXL12DFveccrTILBlsG8cUE5kLQKY88/qWSYzG/trUjjaNvtF/OsORMqKUWbWpt3zWINeyiHMYD39oE75BuSw/KUc8OVeLsRI+S88ygC9kRpBtZ7Wy2mYEu4e4l2aOeMk/KCvRBFVvqKlUbl4rbdR44Ne+W57aYOaILz3iJJCU02fIf63eoI7vlRyzJqZ+Ov0STuq1NernaMKgSCs2NBqfXmNz6Q4RM/qzjKM6iPtdg6hxO6uhaeVSSrm5F8qWVyGCCLIKxT8hHZuk/3LoZezol27n3SeAsnujFwIbsGYnOMtHhyx0cIOAb86R+kGNHUphzYAxne+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 SN7PR11MB8262.namprd11.prod.outlook.com (2603:10b6:806:26e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 10:29:21 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 10:29:21 +0000
Message-ID: <9582879c-3f20-4f09-aece-30c80e04f0d3@intel.com>
Date: Tue, 22 Jul 2025 13:29:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] lib/svga/vm_basic_types: fix musl libs
 compilation on Void Linux
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Zack Rusin
 <zack.rusin@broadcom.com>, Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Martin Krastev <martin.krastev@broadcom.com>, zlice <zlice555@gmail.com>
References: <20250721155824.112474-1-kamil.konieczny@linux.intel.com>
 <20250721155824.112474-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20250721155824.112474-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0356.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::14) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|SN7PR11MB8262:EE_
X-MS-Office365-Filtering-Correlation-Id: a41219d5-8134-4e6c-4435-08ddc90a9ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0k5cUJGRnl5QVpNZFgzWlhiYTBDRDhTTDdkSVJwUFNkWmMvaFBKNWRsVHNs?=
 =?utf-8?B?d3VBMVpNeTE3MmJLSjFjUW01MmhqL3B6N05ST20yaFJhNnc0bVNCQlVOMDNn?=
 =?utf-8?B?RjByVmk5MXRjRVB3eXA4OXNseVFucGR5OCtBYjV2VmhycXB2S0xnaVg1NkFq?=
 =?utf-8?B?WkhCS2Z0MGF6T0RKNlpydk9rUnRMWFZtbXFyODdwZ0QyVllHWVRsQWw2dlBN?=
 =?utf-8?B?dDBKMzQwYWNndzJsSG4yTHZUYWl4cjJ1QVR2bmNtTnBrQ1lGN2JIckk1L2V6?=
 =?utf-8?B?Q0ZzVHpubHBTWU04L1hoaFVTUWpETThEVzBBU09UQWlJYzNjNFo5N3BuQjBJ?=
 =?utf-8?B?NENZZ3VWd0pIbUVSNDdXTGwzS2xPQmtDTDZsMzB1QmphWEJ6aHQ5OWEvZ3dE?=
 =?utf-8?B?eWx3bWFoaW1GbkI4WHhFd2FkVXVhTkhxVDNrTUdyRCtrVzlEZFBXWnRnY1JV?=
 =?utf-8?B?TEMxNEdXOFI5SnZ6Ylp3MGlRY2hqVFhlOW1jd0JNTlRPdDhBa0prdWJxaHJs?=
 =?utf-8?B?UDN3YTJwNGkyZ1FDY1NGQmhEYU8rWGpyM1BIdnJmWUtRVVVpZWZFd1dTT3FZ?=
 =?utf-8?B?Uy83NjJyNFU5YnZRZ3lxak0zclpudVdmR2U3UXI4eHByZ0J4MCtTVlcxb0Rj?=
 =?utf-8?B?TFJpNnVhYi8yVnljYURtT1Q2RmdTTlVLM1JTRzZrYkVML2pHbFFFSEkxZDl6?=
 =?utf-8?B?dHRKNXpzVWJLb0MrUXdBZno4YVV5bkkzTWQ5Z0Z5OE9PaHJ0amJ2TG5VNVkr?=
 =?utf-8?B?WGxCYzdNTXRXNFM4RzUvNExUdE9USEU4ZWtQVERmeU1OQUM3YkVuUS9obmhl?=
 =?utf-8?B?dTU4WjZ1cENaV0xyeno1V2RNZVZROXFaYXFMbU1wLzdRQXZzTHNzWmk5SWJL?=
 =?utf-8?B?VFV2dnpmRjlPcXBIdi9kTHQ2OVI2eTUyV2FKeEdVZGJmb0NYL0hQa29MVUo2?=
 =?utf-8?B?T254bUR2cUptclRvOFpIOXlpYmNSV1NObVFwNmM1c2x2KzRWYUZtOFQzZEdO?=
 =?utf-8?B?OC9iMmRrcEdINlpwMkY3MU9WKzhFazE2dEtoU1d4NTlTNHVPK09udVdhWGM5?=
 =?utf-8?B?cHRCenRWRlM2QXNTN0lXQ2FmZGU2Rll4N21kb3pTQ28rR01JaURmOGN0WWlo?=
 =?utf-8?B?OC9pa0ovelY4MzZqOE5MSG1kcGFaQ1ozbS8zVUp3T0dtY29YRjJnWmVZNTNr?=
 =?utf-8?B?WXBxdkJ6cDB5bUpIbm9qSzJqTFZZUE9jZElMVElVUkhYb0pGeGRidmZLdmRH?=
 =?utf-8?B?cUVaTlJObjJRKzhZNVVpSVF5eFJRMnBoT3NUa3RkeFlPNExuOFYvUk51cjV2?=
 =?utf-8?B?WjZ4SDFEK1BLL0ZTeDR3QlNXdlE4Z1lYWTRsRWJhZ0hWWkhmdkE2dFFueWFX?=
 =?utf-8?B?Zms2UWFCbGhDdkU0Y1c3K3VkekhRZnpLajlyN05VVFM3QXRGdlRlb0pqT3lW?=
 =?utf-8?B?ZGV4VmFlQUNuempJb28xLzZGTFJHWlpLMHJzNUx2UmJ6cFI5U0R4Y3VBS0Uw?=
 =?utf-8?B?bVVQYXdOUDBmdVNxSzBnL3g0QUdzZkI1WFNFdWoyVGp6d3pUY1FyZFBPS24r?=
 =?utf-8?B?em4ydGV3QlhNTFdPeFpmTlRBRisvV3pEME5Kb2tIcVlSbG5BbGY0OWRWSm5m?=
 =?utf-8?B?UXdjZmRCcE0yY21LMCtBTzEvTDNIRTN2UllDNVYvb2NCelFpbTZjWDZtYkc0?=
 =?utf-8?B?S0d1TVJ0YVdhSHhMZ0owSVN5cC85OEJab2Q0YkthUGtJaXlmbFFHVjAvUTlm?=
 =?utf-8?B?Q0xYc2lPSlRQTmFRdE1vUms4Wmh6MC8vSGtFN3gyaXpMKzY4RkhabnVwNm9Y?=
 =?utf-8?Q?Efb4azZP7gcYxydVbKscT9QB1MH+9Zb+9/RXM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUpDeGkrbzhRVFNPVEpDWnlaM3RjU3dOMEJrd1lsUG54c3NDdTlwZFZGb2dH?=
 =?utf-8?B?WXN5Ukl0SStpc1ZxNWJ2VlkyeG85TUp2eUhsRWk1TDNXUWRVa3BkY29BdmdT?=
 =?utf-8?B?cm8rdUlHbzhhR3BNcGZkem1SekVxb1czNUdiOGZKWmJDYXFxM2ZsU3RCTkFS?=
 =?utf-8?B?SVExQm5qUlNkQWFXRTZJSDFLTEFUdHl4R3ZzaFpVYVhUVXN1M0pDYXZYS3ln?=
 =?utf-8?B?SEhTSk1wUnp5MGJJZVJmQVdxa2tTbERQQkdxRldaUXZSNHdRVkpGYkMrZHlP?=
 =?utf-8?B?dmZDWklnYlRpK2ROeVVVY2tsZnlRenNrQVQ5YURFNEJoV1loVmMwSHJKM0Vo?=
 =?utf-8?B?K293cTZ3aXdQZDBPTWRoNW1MRDk1bW9NTnk5WWVHZ0pyM1hYN2FDdGVncXFw?=
 =?utf-8?B?UmY0dUFHQ2NjU0M5QWh4am9ZbVpsZTZjVDFHbUxPRkdoNS9DN09nZDRSNFJn?=
 =?utf-8?B?dlVkc3FUKzdkUDJVcWMrSDkwTC85a285VnhiZ09HQXdFRHVhTGlwMmFQZENn?=
 =?utf-8?B?M1paZWgyNHZnU3ExOTlFdjhRcUdmd0hQZ3Q3ZzRZRStYWVc0eERXb2tNQ2Nu?=
 =?utf-8?B?Rnh4MCs2cGo5eXZKMk1BbVV5cVNxQ0locU4yVXhVMW45MG5XSVhoRHBNRWVJ?=
 =?utf-8?B?UkFER1YwcXFjYmIzb0NIQlFhbnhhckxOQitUcTBhL1l2aFY5cnJsaE1DcHMx?=
 =?utf-8?B?aE1YeTZvM25ZblJHc2pYOXZQaWV6R1A2em50UlFPYzdiSzA5cU9hemprNGF2?=
 =?utf-8?B?d3NuZ29YTlRaMXhwNUwvaG02NDd2bmUxSnZaSzNqL2NSclg0VFFTdGh2T2ts?=
 =?utf-8?B?cDUrR29jdkVUbUc1K3FVWE42bko3SVVDK1NnSkhtdlRkMm0vam11eHpPbnE1?=
 =?utf-8?B?R1FuUk56STltWWRmNFNETWI1amRkNzB6VzI1eXA1V0hGaEhSRW1jaFUwbHBp?=
 =?utf-8?B?MFJvUkUvS1phaXQ0QVI2S0RGaEJwc1d2Rm01b3ZZOXRvQy9qTXQ5MWI0enhp?=
 =?utf-8?B?N1RMVmFHd3ZXV2JjVTBFTDJOTWJNWlBWQjc4WTVTM1ZLTnRFemR6ZlFPV29a?=
 =?utf-8?B?MnVaWEF0YXZLcUx2Y0Mrc2lxaTBsVEx2ZHdXNmhHdmttVHoxWHdseElhRGxV?=
 =?utf-8?B?eFZLRytmdlFic1E3dlZTQllVb0FqcVM5dmUzSlhacXZGaFA2OXhFQVdRaVl6?=
 =?utf-8?B?VWtpVVJmWDVreGZBdDFGdWlwZHVOQXRNR1QxbFFBTHpoN2pVL2NSRXFoeHo2?=
 =?utf-8?B?azdPVUJ3SmRhS1BBOVNuWGlhcklESFpLOStkU1JIMlNIRjkxV0RiWXpNcjk0?=
 =?utf-8?B?RkxjanVad2Rlenp3ZWU4VngwcTBxOTZtOG5JZEx0TUg2Rzc5YnhCQ2E0L2VZ?=
 =?utf-8?B?d3RrWWFGZ28zdFQxK0hsWjFBVzYvYXBWSGE5WWRUQitaM0xFRUdZL3JSMmla?=
 =?utf-8?B?SXVyT2hiOHFKNDBhNmt6aEVDS2R5SG5iNmt3czNKNEhDWU5jWk9lSW54WHh0?=
 =?utf-8?B?eHlVclpEYXM3RWFleHhsdjZ3UzlNcDk5U1FFZWVFZmhyeC84ekt2T0NURUs4?=
 =?utf-8?B?V2czWkM5TWpmZFRCeFUvYStOTGFwYnlLRWh0SVMwSDJDMnp5ZDB3L3pTRGI5?=
 =?utf-8?B?R0M4dmM4Z3ZCS1VLOUh3ZkpKVDZjVFB3Q1dEQUI1SjQ1d21jU2RTVHNza1V5?=
 =?utf-8?B?b2JrVHZVa3ppYnhYSEkwUS8zV1VCdmRVaThBaEtYK3RnRlRmRzdYaXlESnpx?=
 =?utf-8?B?UVFCSWJDbmxlYk04ZUFmSkFHTjY5ajhWcndxVmNtc0JtWHlkT2tFSWhqZldY?=
 =?utf-8?B?UU9kaS9tZitmWHRDbkp5Zjg4cEVzVTVlakNSYmw5VDFQdGF5Z0NaN1Jnc1ZE?=
 =?utf-8?B?L292aS9BdmZETjN6ODNxblpZTGZjN2JXTjczS1hldUpMQU9qSWpDU2RkdC9h?=
 =?utf-8?B?bW8xYy9xL3pUNlFLUGIyZEVMVjFtak5VT0JnSWxjTDV1ZkJkeWNEUGpGZUhR?=
 =?utf-8?B?NlJUMzk5NkZER0JBaVNSbmVoMC93RndaNWkvK1dERzN6c0NqOFRXa3Jlcm5r?=
 =?utf-8?B?WlR2WklIakFyS3pwakZJZFl3S3RBUGZNT2k5Lzh1N05Rd2tyL1RYTHRRZWZN?=
 =?utf-8?B?TXZFRWFqQ0E5NUt4UmVQZ0dPSkt0MXMrekFaaDdYYkpNdkw4Z3hqZXh0YjQx?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a41219d5-8134-4e6c-4435-08ddc90a9ee1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 10:29:21.2071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4W9O08zS3/JEx0IZ1oiL6/SUA3+Io6HBgUCEiyZjxJEKvdiBJ7t4yn7qz5AqQiWOh6zsBk0xpTCRrZgra0dqBcGMm5ZmJTWqUu73kQnMyUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8262
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

Looks good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 7/21/25 6:58 PM, Kamil Konieczny wrote:
> Fix gcc compilation on Void Linux with musl C libs, where
> PAGE_SIZE is already defined.
> 
> v2: added more devs to Cc, updated subject (Kamil)
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
> Cc: Martin Krastev <martin.krastev@broadcom.com>
> Reported-by: zlice <zlice555@gmail.com>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/179
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   lib/svga/vm_basic_types.h | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/svga/vm_basic_types.h b/lib/svga/vm_basic_types.h
> index 8fec5b665..ea10a683c 100644
> --- a/lib/svga/vm_basic_types.h
> +++ b/lib/svga/vm_basic_types.h
> @@ -27,7 +27,15 @@
>   #define VM_BASIC_TYPES_H
>   
>   #define PAGE_SHIFT 12
> -#define PAGE_SIZE (1 << PAGE_SHIFT)
> +
> +#ifndef PAGE_SIZE
> +# define PAGE_SIZE (1 << PAGE_SHIFT)
> +#else
> +# if PAGE_SIZE != 4096
> +#  error "Unexpected PAGE_SIZE"
> +# endif
> +#endif
> +
>   #define PAGE_MASK (~(PAGE_SIZE - 1))
>   #define PAGE_ALIGN(addr) (((addr) + PAGE_SIZE - 1) & PAGE_MASK)
>   

