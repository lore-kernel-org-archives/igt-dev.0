Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8D4D41D74
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 08:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC82110E1B2;
	Mon, 15 Dec 2025 08:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XW8jMGV+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0682110E1B2
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 08:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765788790; x=1797324790;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mcpkdpRTJjteu14fgQa22erFF0B/rNQe9npJSU9JPnQ=;
 b=XW8jMGV+i72FmVvUJWtfui/A3mTuJqH9w3UzL80/hr7va65VV5fsvC42
 VUxuMxJm+injV8v0O3rIO6BhB1WNwuVik4wrTvSxwWMv+hcfK5f9bKyBG
 YpBBBC5UP/a6CYocH16jJefYRKZRZZwzwBJzrk/7bTDXbeEoKZjgG1ub4
 d0h+fVOCpkWFtOQ3Ieb/Gz95knz3ca7H+dcuUjBbNdGIp6NYif3Q2NtuP
 VMGwFvRvPaOYaED6OpFvRVBNsnHcj99ASsoBUh1DTnr1GBD2HGsaUJd7c
 PZ/Vnhab+ZNFNyuxDiS6rLQ3nsMqHtwozhOx4Z0FvUsayDwb2hc6fjWtz A==;
X-CSE-ConnectionGUID: sCV1YbYBSUKJ/mZJvFBMgg==
X-CSE-MsgGUID: uwSarL3xRKadHrV4gMMD5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="93160203"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="93160203"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 00:53:10 -0800
X-CSE-ConnectionGUID: 1Jioxrt4TuyTPRilPm/LyA==
X-CSE-MsgGUID: lFz6w/SDS4mJRzr3Dg2PNw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 00:53:09 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 00:53:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 00:53:09 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 00:53:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEu7TQMOLwMxAknWkCfkVTAuDHsvZVbSw9ZvyuPfzwlNG+1/AJJ5rgf7PIscxGq97/L9LK7WVBy3Wu0TugdHGDFK9jRdV0j/dtpNMvHbiBm5xL75y1PmTAUL/s87XzvCfl4/T/BXc8tfuZ538PlTxswVxJB0Paaz4G9EthLQ30Qkkgyf9YV/fJivXjfmvzwDvdwmqAEPxvlZ7ZgsvQLx4cjZq2FDGKE9/RLMbVIfq5jA+vZ3kathA+cnv0fp14Te48Gk5974iahexUrTnXNJmeWUgYDUqUuLzLL2v1b02hI0LHin9xfMREiG4ruRBL0FuglKCvTXB6MBPeSFD7SS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1z6okv0pppu0u1wsa94F4eqCPScXfov0oWHiC/Le/M=;
 b=xc2FaWxuY92fAC2P9KSjDv8RxEMAbuWAtjNrxyYgRrPYZrW7RwjMlssHxlqLLQBWQjBuMsewJWpT7MOh2cGwYtQzG4zDTuXeB/SeDNLXbJYhLmiIJctEex65KyHoB1V5GSG0XfNcpfBqsrlPHNLU+KPIRzkvJyKt5hyRFxxF0OoQQCQ0LWW29CuY9juVHHFpRlv3RlrPLjH2+79UF8eJarj2k6X1HRliDhYTmJGuN35zOKuYxXyfUwzCjLb2T/shemQABAcTwUBuh1CIdre1pLY5YopICIYsu9vgq8sKfp1pLMYP8dtzsgvhShzDN4cZASX6Y/dmNIUFc1eAEheyHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM3PPF195D11F0C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 08:53:07 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 08:53:07 +0000
Message-ID: <11c5efff-8fd7-4fe1-85c4-dc8122ccd565@intel.com>
Date: Mon, 15 Dec 2025 14:22:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/kms_joiner: Add function for
 pretest checks
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
References: <20251212055717.2870018-1-karthik.b.s@intel.com>
 <20251212055717.2870018-3-karthik.b.s@intel.com>
 <DM4PR11MB63128682A13F5ECAEC3F4D1890AEA@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <DM4PR11MB63128682A13F5ECAEC3F4D1890AEA@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0078.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM3PPF195D11F0C:EE_
X-MS-Office365-Filtering-Correlation-Id: a24d6cdf-b301-448c-febd-08de3bb75d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|42112799006|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3o5b21nOHZHZlM2YXFTbmNhV0RuOUg4cGxMTE5BeTU3ZFpGcVVSUVpRaWYw?=
 =?utf-8?B?Tk5oNGlKR211eWZnQlN6TGpQcWRtbXBOMEJ2SUxMb1JSM2F3L0Exdnc0b0Vm?=
 =?utf-8?B?T2d6TW5Nd1FLMmRNa1ByRHR0WnVhWFd2RGtWN0NacStPVGJ4OTJ1QkJRUUky?=
 =?utf-8?B?enZPVXh3bGIwUTZXVjZwdzdLcTg1dFI1N3h4cGxLb1VBRWNFTCtvOHVjNm1B?=
 =?utf-8?B?WXJ4M1M5SEFYTjBpdENKQjh6VENpT0YySDVscXIyMnZCQ2lXdVJyam5rNFI4?=
 =?utf-8?B?dEJ5MnZVRVFyU3Y0Z0g1VUhxSnl4K2l2eS9vTEllY0tQblRTTnJsL3ZqTmhT?=
 =?utf-8?B?WGhsWmVKd21ERzRQM2d4dUZTcE1aNU5uaG5rZnY0WEFsZ2N0bzE1dEl5RWZv?=
 =?utf-8?B?bTBSdWJ5Tkc1ZzJGY2hIU2lCeXM5Nnc0RVh5cmw5WmY0Nno4UjJSUW84RFQy?=
 =?utf-8?B?V2FmdlRhQ256ZklrV2xoR1VjMDlHMlZMd1h1OTJoMDdrQTJjenI0Rjc2aW1W?=
 =?utf-8?B?RFp3ZHFxb1RqYmN1Qytjcy9IbHFTdFFkbmE4S1hYN01rRzBibzFyVGJBWnZW?=
 =?utf-8?B?bWtyRkZ5OTcwU1RvVEhQNnMxZ29uVHhGREhHR3JnY291c1hoMmNmSHJKWVlS?=
 =?utf-8?B?TXlSU0lhemNLU0w4T0NVSGdTUUl3aVJVQnlEcVd4OHRobEZRcUhJbmh2WEl6?=
 =?utf-8?B?OEF3Q0hSL1ZYclk5WmlVVzIzcTl4MHRUaFVaTXNSOFNmYjJpY0FHUEZGSmhQ?=
 =?utf-8?B?SzZUMkppOENvcmhTUGNUcUx6c3Zpd0Q0VmQybjFLVDFDeDhISHVldFEyVyt6?=
 =?utf-8?B?dW1OQXdSN0FhZXZha2QyUWUxWDNLeS9zTk15dFdtVDVseWxRa1N0cVdpNnVw?=
 =?utf-8?B?MFpqdWxGdmR6VGV1bmFLcmdPeW9JK2ZhcmdnRTRPTUk3VWJBVWFuUTBZc0lW?=
 =?utf-8?B?dmJxRnAwSWdGYXFRYllDaDE4aGw1L1hsT2JKTjA3c0dnTHppU09UUExFYUtm?=
 =?utf-8?B?NUhkK3ROczFaR2g4VEtIQVhQekJwOW9Bak0yd1VQZklBbDlUSzRwcC9QenQr?=
 =?utf-8?B?M1BqQ0NpWWQzazUwNFoyNEY0K0c5VmlnM3NuOEE1TFBxQnh3d1FFYW0vbUh5?=
 =?utf-8?B?T0UyZnNTTEU4NFRHSkd4bC9McVNkNFNPbFlXZTlqWW1KTkU5eGZOOHhucEpL?=
 =?utf-8?B?ZFc5cDRlM2RnNXV3NURQdTlpTWZHWWJiZzNwQ2tVTUR3dHoyWnVieS9TNkRJ?=
 =?utf-8?B?RUY1OVhHeWRONVpzd1ZRam00RkZscmFKZE52ZWhxZUpuUWt2Y0xPNGw1N1E5?=
 =?utf-8?B?cnBlVmNYZVV4dGhmc1ZKaUdtWG9zKzA5V0R5aDR5Y3YvUHdZYk4xdGkrU0JH?=
 =?utf-8?B?UGp6aXJZSXYzMDdGTEVpdEY0UjNQVVRtUS90dGVHN3lwY0o2YXM2b1Z1Vy9B?=
 =?utf-8?B?TkJiOWFLYUZJRmJocG1idUNEWDFJOUpxWTRFeVhwK283S2t6TkFZNnhtOUxp?=
 =?utf-8?B?a1NvdWpSbXlaa1FGbk0xS09wSW45cnBORCtDd3FBSFNEWTI0aWdUM1BWSXZE?=
 =?utf-8?B?cTRYOVB5Wll5elRjSGQyaDlkODhxdEhweHdtRE9wc1VHTmZZMUVjbUZ3RlhH?=
 =?utf-8?B?ZFJ4cUNKYzBSbExPZTBKdHBnYnB4aVd2eW1IRjRFd1BQZ1JoYUNibGlKUEps?=
 =?utf-8?B?RGp4dFRqdlJvbU5mN295Nm15c1dlcUpBUjJUVTIxdW41a1ozU045cmlFNStL?=
 =?utf-8?B?bmMwYi9jL05YbkEvSDR3TERvNFRYSHhGVEJ0WG45eUFVd2pDdzEwWCszbUdE?=
 =?utf-8?B?OU5LNURCdFloYjhjamozOWIzUFovRms5Vzh1WFVtdXk5K1lqU3EvTnY3TzhP?=
 =?utf-8?B?SkFZTTJkWWlmTVA1V2xDNzg0R01CUzhnTmlacC90VnZvTm4wVEFPTTcrY1Bq?=
 =?utf-8?Q?66MCob3eXk0oUnTYRQ7Ljgym7kR3uawS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enB3aGhyRFFEeUpqZG1qRm9MMmJrcGUzeStQSXYvdE91QmROdmNRbDNpb1pG?=
 =?utf-8?B?WkhuRmtlNC83N0tZbzVaL3hOOUJUSlMxbXg1eDdqRWVHbkFmejYyNU9Qbkp5?=
 =?utf-8?B?K3ExcXZxQmdMeGJWL1BockNGK2lyTU9rWXNZRE13bVkyS3hiUWJsdU1lbytW?=
 =?utf-8?B?ZW5hSDMydFNNM2h3MDNpRkhnRkd2NVN3cmZBWVZRekRJMlpLUVA4ZDN6YlFV?=
 =?utf-8?B?RlZCZEhjeHVlL0t4dHpaaHcrYUhHTFBwS3JrdUZXVUJCQUdXNG44SVNuK0VO?=
 =?utf-8?B?Vk9GSWFRem52cmZhMkpub2R3eVJTRzFnaXZqb1dYVXAzQXo0V0ZZeHk5aGRx?=
 =?utf-8?B?V0lZQ2xFZ3dxUENENGpQQ3cyc2RyWEZ0eUk0YUI0dkNHMlJNYW1lL2FjUmVB?=
 =?utf-8?B?eXowekZ5V21Hc2RYNzhPQm5CcW9GbWJiNWd3ZUFYSGFMTlVQNndxNWtURlRG?=
 =?utf-8?B?TFFKUk5UVERLNWZWUnRGL2E3ZUQ1bThXaXBKcmcvSXFmcjY2L0FkdWMxMzhh?=
 =?utf-8?B?dW9yQXlSVEF4QkZrUkI2OVRVVTRaWnZIQzg0OVJRR2FISWw4dGRDOVk3UWhy?=
 =?utf-8?B?emRvenBJVGRaaWdTUEQ3Tm5uaVNxbnBpV3JrTzNNSEdPa0pmZloyeUVJYmdl?=
 =?utf-8?B?bGlnTGNhOEtSMU9TNXV3VVQrS0xIVk54YjBSdEExemRUWGg0OGtVUVNlRmlU?=
 =?utf-8?B?SzVtMXRBZW1tMmE0OWVaRGhDOE1NdFRrK1pLeE5ZR201WTBwRldzTDJQSEVh?=
 =?utf-8?B?Z3hsQjQycjg1WkhRK3JndVZiSDNLM0o0TEdubDRQSXpnV0cxcncvbEZxV3NI?=
 =?utf-8?B?RUhZSENGdDYrL1Z6bnZsa0ZrWTZHRC9VRFNWcEF1N2w4N0t6L013MkRjVG53?=
 =?utf-8?B?QTJIRzExallhdVRQRmlCYUZRZmY5WFlFRzNFYXQ0VGFIeERGZUlsck1aVVc0?=
 =?utf-8?B?OUNIdVpVb2lIVm9GUUkvV0Y2N1ZGUVQ2RVEybHlCckY5TTVETnF1d3lRZUFU?=
 =?utf-8?B?UkFEcFJQYjlQTlk2ZldFRkZuckRWNVlNUHl0ak4zQVBCcHBVY1RVNndvNXpw?=
 =?utf-8?B?WXlrbzBUUng2YUFJd0k0a21UVGF2aEtPR1FwZDBISk94bS82QXB2WUdqbGll?=
 =?utf-8?B?SFNJdUt3Z3JqeW9qYXJWYWRKVTZHQ3gvbUVIQmFDbmxXWFF0Y0JzMzBobi9B?=
 =?utf-8?B?Yk5EdXU3eVFlUHRITGVadE1pODRJSmM3VEp6M25CQ3h4TFVvNTBSK1VUdXFp?=
 =?utf-8?B?cHZKQ01YeldhdTRkbS8xelhWL2liUm1PaFoveVNWTEZXQk05QzZoK3RDWjUw?=
 =?utf-8?B?bmdnTHhzTDJyYmVjdFJqR0dsVjRlQzlsVkdlTmVsMjIrVE03MHkxSXAvRDMx?=
 =?utf-8?B?OVkzOGF4WEJkUEsvTDVCcmxrMXNnZ1BaUmlkY25WM3NaU2hWR0IrbXhTMXJQ?=
 =?utf-8?B?M1JXU3c2RHlHQ3JRbWJSd2doZUs0VmVCU0dGUHJFOHRDWU1INlVDUEc5YkV0?=
 =?utf-8?B?TGVXM0krYUpqeDZrQUJERm96Ym1GSDhTWTNJa1pYaTMycTZEKzF2SVZqZk01?=
 =?utf-8?B?ekJMNlRPQzdTVE5OdlhnYk5YaGJ4YVVzZHpqVlBIVTBDQnpNSEhUb2hMdHQ1?=
 =?utf-8?B?QmliQW96aExvK0h2Z3MrK2pqekt4amNqVXVqU2Q4b2ZPK2tJT05nT2NrVllR?=
 =?utf-8?B?TUk1SXVKeWRpSHpVSmxoWDU2am1uUUQ5cTJ1Y3piQXd4bHRQOE1UNDZIVFpU?=
 =?utf-8?B?TTVSVzlscEFkUzRSZS8yQ0pTVXNFZ3pTU1RUOGNPekxmdHU3Z3E2Q1ZlaG9Q?=
 =?utf-8?B?NXdPbE40em1NZGdaa3JqS00yS2RXMEpqV1VqS085YkRNUnA5NVJsTkgyN0Ir?=
 =?utf-8?B?N0kyM05jKzVuWXVvZndteUdqVk8yemYvakdUUkpRNlJTZ3U4ZlFkWUtIVmsz?=
 =?utf-8?B?eE1DdW5yYTNza3VXRXVaK1gvT1FjNGJpUk4yOVVNUXNXdTlaU2RwcDFyM1NU?=
 =?utf-8?B?SzRHNWRsYzc1d2VwUGVkdXVFS3BDa3JpSkhqRVppdmVUOUF5SUhIZlhpWkJB?=
 =?utf-8?B?MWVmaFdFd0RHNWh2ZnladDNubVdDU1R6YmN6RFZ3c2t2TlZFMnF3cnpLK3p6?=
 =?utf-8?Q?RvTr7VmnYzvDiPdXby1tZ47I/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a24d6cdf-b301-448c-febd-08de3bb75d96
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 08:53:07.2600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6CzbC8QdNUs70TbfCcXdk0eZ3T21BkPXpY2J6v0jqH0SJEYpW+AWy2woGzx30mBlVRDBhICPbIQmEgx61kTZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF195D11F0C
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

Hi Jeevan,

On 12/12/2025 2:46 PM, B, Jeevan wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthik B S
>> Sent: Friday, December 12, 2025 11:27 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: kamil.konieczny@linux.intel.com; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>; B S, Karthik <karthik.b.s@intel.com>
>> Subject: [PATCH i-g-t v3 2/2] tests/intel/kms_joiner: Add function for pretest
>> checks
>>
>> Move igt_require checks in individual subtests to a function which is called from
>> all subtests to avoid code duplication.
>>
>> v2: Use enum for various joiner modes (Santhosh)
>>
>> v3: Split the function for big and ultra joiner (Kamil)
>>      Use igt_require_f (Kamil)
>>      Minor Styling cleanups
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel/kms_joiner.c | 98 +++++++++++++++++++++-------------------
>>   1 file changed, 52 insertions(+), 46 deletions(-)
>>
>> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c index
>> f8e684b47..ed82f4789 100644
>> --- a/tests/intel/kms_joiner.c
>> +++ b/tests/intel/kms_joiner.c
>> @@ -101,10 +101,16 @@ typedef struct {
>>   	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
>>   	enum pipe pipe_seq[IGT_MAX_PIPES];
>>   	igt_display_t display;
>> +	bool ultra_joiner_supported;
>>   } data_t;
>>
>>   static int max_dotclock;
>>
>> +enum force_mode {
>> +	FORCE_ENABLE = 0,
>> +	FORCE_DISABLE
>> +};
>> +
> I think these supporting function should be added in joiner helper file.

Thank you for the review. Will update this in next rev.

Regards,
Karthik.B.S
>
> -BR Jeevan B
>>   static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)  {
>>   	bool status;
>> @@ -179,6 +185,32 @@ static void set_joiner_mode(data_t *data, igt_output_t
>> *output, drmModeModeInfo
>>   	igt_remove_fb(data->drm_fd, &fb);
>>   }
>>
>> +static void require_ultra_joiner(data_t *data, enum force_mode mode) {
>> +	igt_require_f(data->ultra_joiner_supported,
>> +		      "Ultra joiner not supported on this platform\n");
>> +	igt_require_f(data->n_pipes >= 4, "Minimum 4 pipes required\n");
>> +
>> +	if (mode == FORCE_ENABLE)
>> +		igt_require_f(data->non_ultra_joiner_output_count > 0,
>> +			      "No non ultra joiner output found\n");
>> +	else
>> +		igt_require_f(data->ultra_joiner_output_count > 0,
>> +			      "No ultra joiner output found\n"); }
>> +
>> +static void require_big_joiner(data_t *data, enum force_mode mode) {
>> +	igt_require_f(data->n_pipes >= 2, "Minimum 2 pipes required\n");
>> +
>> +	if (mode == FORCE_ENABLE)
>> +		igt_require_f(data->non_ultra_joiner_output_count > 0,
>> +			      "No non big joiner output found\n");
>> +	else
>> +		igt_require_f(data->big_joiner_output_count > 0,
>> +			      "No big joiner output found\n"); }
>> +
>>   static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t
>> *output)  {
>>   	drmModeModeInfo bj_mode;
>> @@ -554,7 +586,7 @@ int igt_main()
>>   	data_t data;
>>
>>   	igt_fixture() {
>> -		ultra_joiner_supported = false;
>> +		data.ultra_joiner_supported = false;
>>   		data.big_joiner_output_count = 0;
>>   		data.ultra_joiner_output_count = 0;
>>   		data.non_big_joiner_output_count = 0; @@ -574,7 +606,7 @@
>> int igt_main()
>>   		is_dgfx = is_xe_device(data.drm_fd) ?
>> xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
>>   		display_ver =
>> intel_display_ver(intel_get_drm_devid(data.drm_fd));
>>   		if (is_dgfx && display_ver == 14)
>> -			ultra_joiner_supported = true;
>> +			data.ultra_joiner_supported = true;
>>
>>   		for_each_connected_output(&data.display, output) {
>>   			bool ultrajoiner_found = false, bigjoiner_found = false,
>> force_joiner_supported = false; @@ -630,32 +662,25 @@ int igt_main()
>>
>>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>>   	igt_subtest_with_dynamic("basic-big-joiner") {
>> -			igt_require_f(data.big_joiner_output_count > 0,
>> -				      "No bigjoiner output found\n");
>> -			igt_require_f(data.n_pipes > 1,
>> -				      "Minimum 2 pipes required\n");
>> -			igt_dynamic_f("single-joiner")
>> -				test_single_joiner(&data,
>> data.big_joiner_output_count, false);
>> -			if (data.big_joiner_output_count > 1)
>> -				igt_dynamic_f("multi-joiner")
>> -					test_multi_joiner(&data,
>> data.big_joiner_output_count, false);
>> +		require_big_joiner(&data, FORCE_DISABLE);
>> +		igt_dynamic_f("single-joiner")
>> +			test_single_joiner(&data, data.big_joiner_output_count,
>> false);
>> +		if (data.big_joiner_output_count > 1)
>> +			igt_dynamic_f("multi-joiner")
>> +				test_multi_joiner(&data,
>> data.big_joiner_output_count, false);
>>   	}
>>
>>   	igt_describe("Verify the basic modeset on ultra joiner mode on all
>> pipes");
>>   	igt_subtest_with_dynamic("basic-ultra-joiner") {
>> -			igt_require_f(data.ultra_joiner_output_count > 0,
>> -				      "No ultrajoiner output found\n");
>> -			igt_require_f(data.n_pipes > 3,
>> -				      "Minimum 4 pipes required\n");
>> -			igt_dynamic_f("single-joiner")
>> -				test_ultra_joiner(&data, false, false, false);
>> +		require_big_joiner(&data, FORCE_DISABLE);
>> +		igt_dynamic_f("single-joiner")
>> +			test_ultra_joiner(&data, false, false, false);
>>   	}
>>
>>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>>   		     "when the pipe is active with a big joiner modeset");
>>   	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
>> -		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner
>> output not found\n");
>> -		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are
>> required\n");
>> +		require_big_joiner(&data, FORCE_DISABLE);
>>   		if (data.big_joiner_output_count >= 1)
>>   			igt_dynamic_f("big_joiner_on_last_pipe")
>>   				test_joiner_on_last_pipe(&data, false); @@ -
>> 670,9 +695,7 @@ int igt_main()
>>   	igt_describe("Verify if the modeset on the other pipes are rejected "
>>   		     "when the pipe A is active with a ultra joiner modeset");
>>   	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
>> -		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner
>> output not found\n");
>> -		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are
>> required\n");
>> -
>> +		require_ultra_joiner(&data, FORCE_DISABLE);
>>   		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>>   			test_ultra_joiner(&data, true, false, false);
>>   		if (data.non_ultra_joiner_output_count > 0) { @@ -681,12
>> +704,9 @@ int igt_main()
>>   		}
>>   	}
>>
>> -	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>> +	igt_describe("Verify the basic modeset on force big joiner mode on all
>> +pipes");
>>   	igt_subtest_with_dynamic("basic-force-big-joiner") {
>> -		igt_require_f(data.non_big_joiner_output_count > 0,
>> -			      "No non big joiner output found\n");
>> -		igt_require_f(data.n_pipes > 1,
>> -			      "Minimum 2 pipes required\n");
>> +		require_big_joiner(&data, FORCE_ENABLE);
>>   		igt_dynamic_f("single") {
>>
>> 	enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>>   			test_single_joiner(&data,
>> data.non_big_joiner_output_count, true); @@ -703,10 +723,7 @@ int igt_main()
>>   	}
>>
>>   	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
>> -		igt_require_f(data.non_big_joiner_output_count > 0,
>> -			      "Non big joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 1,
>> -			      "Minimum of 2 pipes are required\n");
>> +		require_big_joiner(&data, FORCE_ENABLE);
>>   		if (data.non_big_joiner_output_count >= 1) {
>>   			igt_dynamic_f("big_joiner_on_last_pipe") {
>>
>> 	enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> @@ -724,14 +741,9 @@ int igt_main()
>>   		}
>>   	}
>>
>> -	igt_describe("Verify the basic modeset on ultra joiner mode on all
>> pipes");
>> +	igt_describe("Verify the basic modeset on force ultra joiner mode on
>> +all pipes");
>>   	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
>> -		igt_require_f(ultra_joiner_supported,
>> -			      "Ultra joiner not supported on this platform\n");
>> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
>> -			      "No non ultra joiner output found\n");
>> -		igt_require_f(data.n_pipes > 3,
>> -			      "Minimum 4 pipes required\n");
>> +		require_ultra_joiner(&data, FORCE_ENABLE);
>>   		igt_dynamic_f("single") {
>>
>> 	enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>>   			test_ultra_joiner(&data, false, false, true); @@ -745,7
>> +757,7 @@ int igt_main()
>>   			      "Ultra joiner not supported on this platform\n");
>>   		igt_require_f(data.ultra_joiner_output_count > 0 ||
>>   			      data.non_ultra_joiner_output_count > 0,
>> -				  "No ultra joiner or force ultra joiner output
>> found\n");
>> +			      "No ultra joiner or force ultra joiner output found\n");
>>   		igt_require_f(data.n_pipes > 3,
>>   			      "Minimum 4 pipes required\n");
>>
>> @@ -754,13 +766,7 @@ int igt_main()
>>   	}
>>
>>   	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
>> -		igt_require_f(ultra_joiner_supported,
>> -			      "Ultra joiner not supported on this platform\n");
>> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
>> -			      "Non ultra joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 3,
>> -			      "Minimum of 3 pipes are required\n");
>> -
>> +		require_ultra_joiner(&data, FORCE_ENABLE);
>>   		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
>>
>> 	enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>>   			test_ultra_joiner(&data, true, false, true);
>> --
>> 2.43.0
