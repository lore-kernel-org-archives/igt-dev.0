Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4113C87FCB
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 08:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783D710E602;
	Tue,  5 Aug 2025 08:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+wuZpN7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F272510E5F8
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Aug 2025 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754381170; x=1785917170;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZbJHdkO/awpWba8J8kRyUv3x2xWpefyER3+DL4E7I54=;
 b=g+wuZpN7k/kSTGz2ZFFKO7TSRLws4azksetXmKgf6+lRd2euuXTCwZLs
 2iGS8TswTvLO9tijQpMf3MB0dbyKZ8mLnzTSTvkVkOw/72q9W6fPtr2bQ
 B4fJsZUoO4hos7yYRwDliKELzXhwQEl0CrjLkJb0TjVK4cV5XkFj9I8bY
 5qzmfDRqhrXUIg8y60AnWkRNLU9RNDaV61v9osym5rqhupkiPw4WwWZPE
 Z0yGQcrFF0pc1uE1wIt+i4HrLAAYe0g5uTirPOGBE4JK1ulEtLjEcy/kQ
 TjTMOkg349QWQ2Ae3HKL/fOc5qIEyhCgouLJT/4UynWQS8IB/v3A60Su3 g==;
X-CSE-ConnectionGUID: /S+qkiD0ShOJbq47cN4Isg==
X-CSE-MsgGUID: 5WKCcvk9TieVu+VJP4TsQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56377445"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56377445"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 01:06:08 -0700
X-CSE-ConnectionGUID: CcXAHnw4QfOT3Pm94h1BsQ==
X-CSE-MsgGUID: cIwZrh0uTcy4WBKUsimfPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="195243889"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 01:06:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 01:06:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 01:06:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 01:06:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7k1I8ZDVqzQW0c04LtaJizqD9VBOBewtc6a1C0lwELD4Bpt3cOD8zigY2J/iiPl6ywVQeYbzXDBe95o7r6OfPcOFxiSMB1FhIuknTngtz/iqag4MhCsiYvn+Iw45L5Usui53huqWt5jJ/pGxZmzGg6sfGb8BDFrNHdjpC0ZSxhAMZextbiDB0TZYKYel7ZCbUosAgOx8hiLKYyGFqz82F7ywQqEd9NB8GBljmRZ7MlAJhIh9yBIGWPYBxbvkiORgF3FDykJ+JqSUjzC0tLXNkTXK24+zsA6iIrYMJFvvj6+/dDkz0eLZYpR+UiH2QmZ6JhiHE/ngTz5Bj01rzSGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6MXk8+61FNpk0oixezoYjNik67+GHkkbVT0n7ztNpY=;
 b=gXBue9BPoVX4V78Nw+EJXIr2zcoEgM2pSlCzjrdJ+ZJxjX9VIesgh4ZfDzpJppyjBjLbgqPFfFqMQ2yna/jfARBy+amqu6SyhedPVt1TDznD1GCOORCcDv+kKEl+2GnGExNeKn3LywM2pdqnxjp6De7sWn20+efzJIqmmgkf82eBxyg6hV00bBOBQ8bG857wrJkTHXw0qdhtw00h7D4dylfnJo8MMiJ/hCf3B1PQ38z9DNQCSST70q9gK0QfO+5RIIA1crf1VOMjPsMkoo4q94umw0OcpHXmK4pQAuI6rKCxXVGkTEOf0tbn5JquCzYkiykUIw77C1TZQRNzwPaZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS7PR11MB6150.namprd11.prod.outlook.com (2603:10b6:8:9d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Tue, 5 Aug
 2025 08:05:36 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 08:05:36 +0000
Message-ID: <0f29dcee-7e56-4c49-9339-131098d2cb30@intel.com>
Date: Tue, 5 Aug 2025 13:35:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_cursor_crc: Rename async cursor crc
 subtests
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <shekhar.chauhan@intel.com>,
 <chaitanya.kumar.borah@intel.com>
References: <20250804045600.945835-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250804045600.945835-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS7PR11MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: a52b02be-bfd8-49e9-cb88-08ddd3f6db9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFh3a1A0N0pYWEVWVWdseUhBQ2FiZFNFcm4xYTh5KzdEMWZvTkRpK0F3ZERX?=
 =?utf-8?B?dVFOcHBPc3BLWGxQOCs1MWpHMWdrcmF3V2JEcmQvV2oyR1FuQXdndCt2ZFBk?=
 =?utf-8?B?Q0lRbkNYM3hndGs2ZjhBelovYU10OXJWbENyenczTWk1Q0E5Umt2U0hJcGs0?=
 =?utf-8?B?bGVtc05IOC9CM3kxNjJTY25vTkg0cVU2K2VNWFV4WDltbk9wTTRVUExqaUIy?=
 =?utf-8?B?ZmdXOFd1NlhyVVVWeHArVkZ1MStBWlRFQXZjTTJGbGUvaG9LS3NtVklJeml5?=
 =?utf-8?B?MU9lVytCOVJZS2RQeEZxSkd3TGdDT0NFaGdrZHdnUDVvWWZMaStlY0hPSzJ5?=
 =?utf-8?B?NFZHazBPbDZvTStjUUszMjc1RjBRa080ZEdnK05xNnFzMU50NmpOSlZQTDlk?=
 =?utf-8?B?VEw0N2tldW9UcC9lcWRyNnVHeGdJS1RTTnBJN1diV2d5SXE3eFZ5N1JJTFo0?=
 =?utf-8?B?N2dPNk81REp3bW14cUxhc0thdEppVTZyQ3dwa28vNGg5YnVYaUFrWDd0WGhu?=
 =?utf-8?B?V1dUNVdWa09kcUZhb1ZnNTJkeEp2ekFYTFA0VEtaa2RKdHVFcitFM3ZZb0lt?=
 =?utf-8?B?WGdESGwwTThvTmxzVEMyMXZmTHIxTDYyUS9udGtBOHVRVzlhaHJ6bXBWckRM?=
 =?utf-8?B?b3E4cVJ4UWcwUE5LVzNBRTc1c0Vmc3l4ODB3NWp2S0d6VDU4bmFyRG1OakRs?=
 =?utf-8?B?eUpMTUtkekVTNStTQ0ZNV1FJeVpzajdkajYvM0ZVb2g3L01RNWlDNzJSSDZj?=
 =?utf-8?B?dXN5MWU5eFl4aGpvQmFmTGdZbmVrQzJDZlJWNlBNcXF3L0YwcXJ0ZUxGb3Zp?=
 =?utf-8?B?c2ZZMTE1Ym04ZXgxSU9Mb0xNOW5JYWVrK2tQcmM4VmgvMXNZV2ZEWWdjVG9n?=
 =?utf-8?B?TjlFRTBIdWppdGROL0lodi9GbzRXVXZ5K3hVTjFvTXJnYU9DeGVQdzJaUkgz?=
 =?utf-8?B?bksyWTVET21VaUNqU3d6c1VYQzdTS05vU0dnK1NTY0MrM3lJTHdhUnF5Y0du?=
 =?utf-8?B?Q25vNFE2eHc1V0FrcVJHbWhFWTM3MU5lZnJOeFNXK3RmOEJCdEMrZ2ZCcjJG?=
 =?utf-8?B?RFV5YytlNjFQQ1UzSjgzY3lTUlgrOVh1MHBicDlZOXV3Z0dHc3J3RjVubk1Y?=
 =?utf-8?B?QVhtTFpxckJoTCsyaERXbGEzY3kzQmFid1MyVm5tZ1VaeUw4OUxhYnNkdEZN?=
 =?utf-8?B?RjU5ZkIrSlJrOGlPOHBWZGJNeXlwem5Ia21NWW80KzJlTnppeUVpZXNZRTh2?=
 =?utf-8?B?VXkwYTQ4ODJWMFhoekhEUVBPZjlCMHJPTFV4N1A0YmhlckNaQWlwb0E3cDRC?=
 =?utf-8?B?WlR4UUhRS0l4dWI3YmlRRWI4ekhrMm9YMklaMVYzcDZhVlJwL3hqM2g4SHFy?=
 =?utf-8?B?T2FmQjNUTmpyL0tiT0cvNTVLWVIxYW1FUjZVVzVvMUMxZzdBdXlmREVWTy8r?=
 =?utf-8?B?MnJUUkVqbGZBRkRUaVFHckJNYlc2ZEpVWDc5a2RtcVF3c084YktwMVpLVllP?=
 =?utf-8?B?NklGNUs3TUM2TUdxSERKRjA4U1NwYTlHVFhTRzJDYnNuOXhSMlNZc1JQNmxP?=
 =?utf-8?B?SFdTMm1OUDNBUWVKelVsL1F0WFBTMDBzSTRlSnRnL0gyZmtubG9tcmRueDFt?=
 =?utf-8?B?bDBaQjlqUnduMzk1Rm9KNnNET1l5b2NzVDg5THpaRU5HRlNJa3JySDN6M1Vm?=
 =?utf-8?B?UjRIZlovbDUzN3BOSERNZlpVY0JlNVBLaWNFc3Y4ZjA4Q293dGFKM2xHOXNI?=
 =?utf-8?B?UW1ZaXhrSTVzdzZ6dlZlZUhBZnV4Q3kzbXRnMHNxeHNtak9jbHA2WDFadkpr?=
 =?utf-8?B?ZjNwS3RHWXUwZHZJTFRCNWRGQkt3b0FiVVNFTXFKaWJTc0hwWkZ0S1N1MUlz?=
 =?utf-8?B?cFFLNXBkSHNHZERHMENHdXZKL1FFQmZpeE1MZlVXTDRyNWlCV2tOK0NVbUY5?=
 =?utf-8?Q?MmZUvkCkq2g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Umx6VGZxZ09nU0VwU1hXOFp5NUg4QzhZcGxyUENlbU9tWjNsRm1qdHYyOURP?=
 =?utf-8?B?WVZQMCtUSHdrbG90S2h6ZCtLRlA1dWlUL1B2VjdnYTBHa3hHc2pCRWVBVE1V?=
 =?utf-8?B?SGROSTczeVA0K2srNE44TUVKY0ljc2dESXg0Nk8xV2N6MzR1QzBLVzR4Tklk?=
 =?utf-8?B?YzFvRHNKZVFRRG5BMEpITGV5QTQ0c2NkRlpBY2RaWlUrOHc1RStOSTFCRjV5?=
 =?utf-8?B?cnBPYUtrSzdCRGsvL01raVNFNndzeUtTNUtDQVNZdWQzY2VPM25UdlY3eGZz?=
 =?utf-8?B?VHZXWU5Zb2JidGxkTGk3TnhmQzcydDR5WjBVa3BEWmRjendkZXhsTjVCSEhp?=
 =?utf-8?B?SVVFdUo5WmpyM29ENy8yb3lrZjd1dlVxclE3K2N0MmErWCtnOHdTbisrU0hK?=
 =?utf-8?B?RjEyaXowRHJ4YVBET1p0VWlEMnIyaWJmanNuaVdpeVNZcUh0dEJ5cG5zSmo0?=
 =?utf-8?B?aXlRcHczWnNWdEdKNUZFSytEZDJ1UzJzME1UR0EzV2J1NGZSSDRwSklwZ2Vm?=
 =?utf-8?B?UDNRcS82L3pNVUU1WVRTcFVTVFVWQjdjT0t0ZkhyWlE0WnZCSDVWazk2eThw?=
 =?utf-8?B?VGpZaXd4RDFpVVJNRE15d29mYmJuaUU5WFVDVTR5Y2ZRQjZtMW5DSkxYSnRw?=
 =?utf-8?B?MTFiQXcvQWR0WFVjRGhGaHRYUGdDZDJIVE14YTlmWWJqdWVIcVUraFBVd25D?=
 =?utf-8?B?RnUrUzBJbTZKNTJwbjlWVEZ5NUFNT1dhd3lvZkhpN3hmU2poWGV3VnB2b3Q3?=
 =?utf-8?B?UmJPV1VJSDBPYThSaWtoTmQ0Tzc5U0FSVXdpNUljeGRPMmJWM0NGUFJTaXIx?=
 =?utf-8?B?MTNGNS91YWIyZEJYSGp5VmlOMFpoWmY4WW1yUHFLTEJVUTNGQXdudU5tQ1Bi?=
 =?utf-8?B?cHdaR1FLM1J1M3RxUVVsYWsrMlRsclFZOUY2c0YxQ2VvNXRHRTFaVTRXV3Vu?=
 =?utf-8?B?VFBZVjY4bTJBODNCZG5qMzlacmc4aExFaFhaZ2VoSmhrbUNRVHU1Um5CUjNP?=
 =?utf-8?B?THd2U3RsYXhSQXVBMFhsS0ppeDk4SENVcForaVphS3JNTXY4dER1ODdVdTlD?=
 =?utf-8?B?NVB3YlhCUkFjajN6Q2dVcmFpSzNRMThZZ09BemM3MVpDWE9NL0s5NnpSUGVz?=
 =?utf-8?B?TkdMQTNFSjZ1RHY0V0JTT25lQnlQbzJFNXZ5NFo2SGY3Q29pdUpUdmI3NnZi?=
 =?utf-8?B?WmhkQnlzWmlpbzF4aUJpdHRYek9NenVjbGxQdEdDVlkxYVM5c0ZDV2d1WU45?=
 =?utf-8?B?UTNGaEJxc2JMbm9DN1BvTmtTbnZvS0hGWVNoZ0M1SjU5bVc1RlNWOGQvVGt5?=
 =?utf-8?B?Zi92NkpqSVZSTFo4cE5yYVFXTXNadkhac2k4eVowZ0hCTG41MHI4N3c3SGxk?=
 =?utf-8?B?QnBwdkJkUzA4bmZMcU5zcEhWM3Vra1p2dU9jeG55OFdybEtNMnNTZG9LN1o2?=
 =?utf-8?B?SGRqZW1GaFAyakl4U1hKb0pmbVlTc1dvVTVpZWJ1Z3JSZTRwMkJaT2U2ZWtW?=
 =?utf-8?B?aHBmbldpQzZtVmc4MitQb2tMUWUvdnZSQk55Um9vdHhWZC9yZXBsUU16UHh2?=
 =?utf-8?B?amJ4bGw0YytRUFZOODRPTGcvQ2JPL0dORG12aUhleWx0R3hyUGJ4N0M1Wkxr?=
 =?utf-8?B?TUovcnorclpGM2VYYnJjQ2lURXFhTlVQdTJxcWQ1NExTTzJkNExvdnNMN21O?=
 =?utf-8?B?c1dsYlNrZGMyL2dwYVc5L1FqU2hTRjFxYThJdDJVSEJoUytJS3lna0F4d0Ru?=
 =?utf-8?B?d29Ba0w4N2oveHZYSFMrVTdISjdJeEp1aGhRcmJ2Y0dlOHdoWEhYSWJYMlpQ?=
 =?utf-8?B?MlVxaXJsNUxtYkdKOEtzOXpaTmNsRFg2V2s3V0ZGRHFLMmptazcrSEdwZ0ZS?=
 =?utf-8?B?dzJrcExBZ2hsVE5sSVJuaVBtZ0h0d3Z0UHBpdTlyUUZkNWlud1RwcnFkQm14?=
 =?utf-8?B?dEdnanp6T3pDWVJNT3pOTTZzQytZMSsxbFZLbDZNZ3MwS0hqUTdNNllxaGRH?=
 =?utf-8?B?TnFrODd2eHlFS0dBOFQ0VG5YNWhUSEE4dFliR2d4T3FFUWVoem56eThYNmZ5?=
 =?utf-8?B?Z2RGenRMNld3WVZ6enlKT2hDQnVxVjdUd3ByL2Mrem5OcjBrUVVGYTllWVlY?=
 =?utf-8?B?K0tIRFRHMHlYcEIrdGFjaVRYQTVrNDl3dlNzQUQ3T1N0LzZvQmhCaXJ0bzF5?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a52b02be-bfd8-49e9-cb88-08ddd3f6db9a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 08:05:35.9494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KefVs0RfEQhvSj4rRgt0goY4GTa7TQ/Jn3b0Mq28h18z3v00OaOBP0W086ztD8+Tzkmtshl0PgH7MoyB/bl9JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6150
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

Hi Santosh,

Patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 04-08-2025 10:26 am, Santhosh Reddy Guddati wrote:
> The original names are misleading as they suggest these tests involve
> async flips, when they actually validate cursor update timing to ensure
> no visual tearing occurs during framebuffer changes and position updates.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_cursor_crc.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 8a465dc6b..239bbd7b7 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -96,12 +96,12 @@
>    */
>   
>   /**
> - * SUBTEST: async-cursor-crc-framebuffer-change
> + * SUBTEST: cursor-tearing-framebuffer-change
>    * Description: Validate cursor IOCTLs tearing via framebuffer changes.
>    */
>   
>   /**
> - * SUBTEST: async-cursor-crc-position-change
> + * SUBTEST: cursor-tearing-position-change
>    * Description: Validate cursor IOCTLs tearing via cursor position change.
>    */
>   
> @@ -1113,8 +1113,8 @@ static void run_tests_on_pipe(data_t *data)
>   				1.f, 0.f, 0.f, &data->timed_fb[1]);
>   	}
>   
> -	igt_describe("Validate CRC with two cursors");
> -	igt_subtest_with_dynamic("async-cursor-crc-framebuffer-change") {
> +	igt_describe("Validate cursor updates don't cause tearing with framebuffer changes");
> +	igt_subtest_with_dynamic("cursor-tearing-framebuffer-change") {
>   		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
>   			if (execution_constraint(pipe))
>   				continue;
> @@ -1132,8 +1132,8 @@ static void run_tests_on_pipe(data_t *data)
>   		}
>   	}
>   
> -	igt_describe("Validate CRC with two cursors and cursor position change");
> -	igt_subtest_with_dynamic("async-cursor-crc-position-change") {
> +	igt_describe("Validate cursor updates don't cause tearing with position changes");
> +	igt_subtest_with_dynamic("cursor-tearing-position-change") {
>   		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
>   			if (execution_constraint(pipe))
>   				continue;

