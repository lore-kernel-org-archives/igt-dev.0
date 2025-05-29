Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F68FC54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 17:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A3510E02E;
	Thu, 29 May 2025 17:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZKR2iMY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74D010E02E
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 17:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748540288; x=1780076288;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UX7QEJ5iCA9B2Mm26qJhPzPUX3Fpmyw28K6dVHISJdw=;
 b=kZKR2iMYgRMQcLyVODm/QSha/t1bJpQufN1JBU0zhYW7ynnqh+UKaFGD
 GfZ4OhTNTncfz8Q3ngEYUfuHnijmeenOwQGug5e9f79zn32m09MqsHhbz
 dTnVIuliTPXZ5isL+SyZ2a4Pj2+nCb8P/G+xdLW2ebJ6hD1QrQBkWLX+/
 WR7ckAfRS4QuXx/yDtuVGkRUoVo/iRyUxYkboI6nphfHWJ2wlH1lV3lkr
 M61Wu7Gs47EZ0HKZMWC5fpU56Phhfg3g4Fx7ksC78w3NRP7OgHYuP38iW
 VXr1hu+8tedZxUquwi0VOkx+P9BN+GHLrQy3bm76G6Eida29qW03RPKMP g==;
X-CSE-ConnectionGUID: xoRuAKrITguZ+SpFEpIN1g==
X-CSE-MsgGUID: FFBRF5U/TYat525yBWZyxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50503773"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50503773"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:38:08 -0700
X-CSE-ConnectionGUID: CTDStJehQQe47HOdWacqeQ==
X-CSE-MsgGUID: wso19N5bSEOiPSkQovBxsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="148488671"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:38:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 10:38:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 10:38:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.40)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 10:38:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEjAUuD7gMbuMxezloxvS2aq/e0GKnAbC/JPw51GNVVCLi9sDArLbeQHZ1h+pWnv29evwgeBHh93K1KBrzgEYc/l5igCKUpZShWVFU8Y9J8U4ONYe0ePWt+/yUowyYDC5K7ZWKfnhpE7w1j1n/+K5MLXRo70OixifZ6GbUwcolcxVCm8lPiSQn1nmStsVSFfHZfo9W+WREg/Er9GrvNuvH0IqIBF2d1fK9q8wZ2Mb1ESMr+YX3IJjOPOxBWg+1xA1H+YdeHkKcSJv6pWhF3MwgEeqEEmUUliXLcLIpsu1OKJWjZEfIKr8JXRoqJF/klBMtjRelHzrPzFbmLR/QWDaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGbOqk5Wr7UnpB+DrBqQNftq6fIACnB1Nn9iKFZLWLQ=;
 b=wgLGYND0ZzBYZ8bsx6k2z5+v27mLP/AKe4vkEcPkfouq/srXXfLZvzz7SAyoImXPiE/IlZzIU+JYxZpgFepWAhxxaMnerJRezgoX8fajaqmJVbK0WfErUCT8CvpgaPjK2+alfGplZJMkPoV0If16/e9UFmoJwKzo2vXTv9WoE/a2k+eLml1mISHhV7waEBBRknaOzTzQGnfIoZIHRw/9W+guJVlOXq9xIfIgZiPVieaBtheO7m00aS2Btc9QJ8R9Hn7cPKzzcjK1ZU4gbUYNYitguE1gmWWyKpM5hqF4MupNa9wi29Y1RuTH2yytv4JXGvxN3FyKnFBFDBLBBeJ8lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 17:38:03 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 17:38:03 +0000
Date: Thu, 29 May 2025 10:38:01 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v2 1/4] tests/intel/xe_pmu: Validate engine
 activity on gt reset and suspend
Message-ID: <aDibeRsG5OZkCVem@unerlige-desk.amr.corp.intel.com>
References: <20250529065359.915117-1-riana.tauro@intel.com>
 <20250529065359.915117-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250529065359.915117-2-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR13CA0041.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM6PR11MB4721:EE_
X-MS-Office365-Filtering-Correlation-Id: c15bd064-c269-4469-3c38-08dd9ed79038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkhyR3JPYjVpclcrV25QVWV5M1NNTDUyOW90SlRGbThWMklKRkwwZDJHTjlp?=
 =?utf-8?B?bUtveUp4TzJHTnl4SDBvQ01FQmxLUW1DYlZMcGh0dllJOE8vaEt0RXFoNWtY?=
 =?utf-8?B?cWY5b0wrdjh2Nms1akw0SUxrYmt3UDRLU2poNUhaNk9BZTlJNmxXVEJtYWNi?=
 =?utf-8?B?WkxQMysydlBIdi91WXFKM092Wjg5cEtpRysyOStXbFF6WWVhL1MxQWxvSHNs?=
 =?utf-8?B?MmlYK3Znc2U0TDRsZ0s5TEJhYk9PWXFYV2hoRXVhWHVnckhUeXpGb2NkeVFZ?=
 =?utf-8?B?anBuU3JjNGgycm1yRkovRXVPNUlXTWFvM1R5VTIzelBEN09jQlFNNlhWQ1lp?=
 =?utf-8?B?WHl3b293bGg5ZWR3amMwM1lUODVOSUhDNHY4ZEVpdlozTEpLdmQzQjdTcGtr?=
 =?utf-8?B?QXE1aGl4ei83R3gzOVR4Umw1VnJCRWZrTzNoMTM5bUc0cStQbWpDcldVUFFO?=
 =?utf-8?B?L2NnZXFBdDN2UHRQUmFoQjNqOHRwM1p1OFNwUHc0NGllOGViV1lwanoraDNw?=
 =?utf-8?B?NktIeXVVTk9NNXNHakVUaUp3SnNtWW1GNHNjVHFtajRhWDNrYk5pazRKUVg4?=
 =?utf-8?B?RVErTk1ibTBkTmp0MkV0M0FxLzBSTVJ6UEdwWkU5UEIrWVkzSWZCU28vdFdT?=
 =?utf-8?B?ZGIvRzY3NFJqOWU3N3BUUEZDTGl4Mk9Dem5mUGdQc1Z5ZGtxdExodzh3Q3Bj?=
 =?utf-8?B?d2hHekhoWmxBd3JiUk81ZjZ3bFRSTm93M0M3a0VJVXd0TzBFTWZDdW5UN3pW?=
 =?utf-8?B?dmdoUytGRlVuT2taYzZsS3RwWlFzMXJONys5NEtiWlB5V3ZTcHdreTdmWjho?=
 =?utf-8?B?QXYrSFI2ZTJhUFFzKzEzeVh3cXV4VkZvdC9IQk5EZE1ONG1uU0hJdkRQc2F0?=
 =?utf-8?B?QjBIcUM3ZUhwK2VDckdjQkJiSEVFTXJqbzRXemFJNEtSblFiOTNEeHRFVkJ4?=
 =?utf-8?B?L0k2Kzg1SEtuK2VKR2Qvb0N6dk1LN3J6K0NYNnVwN0RUb3c5Q1NnQ0hGdnRs?=
 =?utf-8?B?dFA4MTA2VXFBT2ozempndFVTeUtjc1NLM3RLK2tTS0pwaGJ2bmRuMFFoVUdG?=
 =?utf-8?B?TlNNd25oTVNHNVZ0OVJiMjZmZno2a29YRUtRdmFFY1NEdWZmejNPNXU0bjJB?=
 =?utf-8?B?YVpDby9NRXY2SmNJa3dRQVl0SDVaVlVham5xRXMyTlRsYW54V3BYWCt0dVVs?=
 =?utf-8?B?MEFCbWp6MVQxM05XQmNTSTZsNlRXd2Zzd0FoV2wyNnBtRUMwN2JUOFFkc0xj?=
 =?utf-8?B?L3FUZ0V1YWlnQ2VUMktGOE9KbWFVRkpvN0VKSGFDNnRVQWNTM3MrZklxYkJM?=
 =?utf-8?B?RnVIcWFLa1NOdzZ4RE01QzJYbHdiWXNuY2FBdWVTRVBqNUJCV3BkMDcyRG1i?=
 =?utf-8?B?aFppcFNDWHQ2MzJwTzJBZE5WbXhyMTR3ektMWVVVRk1lQ2wvSjcxYjV2bE03?=
 =?utf-8?B?bDl0WkMxdnhBTk5SbUNDck1Idkc1emtlZ3A1S3RaZ1NTbHF2cjAyNGZ3M2FL?=
 =?utf-8?B?MkpBdmFmN3ZrUENoWktKSmhQTmNqVG94d0gvUEY5ODRSWWMvUkFQNk5TVi9H?=
 =?utf-8?B?KzJGTnQ2cFo3cnR4dkNYUzRkazJLY1o4WmpkZUVHYXd5c2RCaXNZZXdxSERH?=
 =?utf-8?B?QUovV3FOR1hpOVlwY21ablVIc0dzK1FTU1krTnBuaFB5VUEvU0NmWlNsSm41?=
 =?utf-8?B?aGNDYWQ2ckxqSHN3RmhHT2dSMzE1N2h4Mm95aWMzNjZNZlFlM3pQN3BwVmsx?=
 =?utf-8?B?NEpabnN1dW9nRTFTUnVVaFIwbTcyTzdlb3ZtVXJJOFBLOTBUOFU1ZEQvdXI2?=
 =?utf-8?B?a2VWVjRzWDgwajFrNFRIV1NKOVpkYVlWL3RuUkFtSE1hbEZZenAwRVJhbGtL?=
 =?utf-8?B?Q2lRU2RhZlRCN29LUXV2QW4yV1NuaFA0STB0aVUvN0p1Z1djbVBUMVpjY0Yr?=
 =?utf-8?Q?w0/CUZIzAYA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUw4YmRpZVpoc0t4NERQaWN6WVBhRWVSNnBqenZJd29pMm5GNHlUSHVDdkdv?=
 =?utf-8?B?T1F4bWFtT2w3RzdicURsQzQyUU42L1dkMTM5ZFZ1cHhnT09KMGZCY3hpNWxM?=
 =?utf-8?B?NkdYcmtQem11blFQQU5HMFdWWDhhVERiN0IrSUZtM21XWUlPbXZLNlFHOTFq?=
 =?utf-8?B?ZjRtcXVpOFhGSCt6SFovb0RUb2NnZjBPR2hVTm9QS3ZURlorZEFZc0dJZFl4?=
 =?utf-8?B?ZEYraTErWG5zcjZKS3V0WnZLOUJ4cnN6SWxoamtBOEEwL21RaEMrSlowRVM2?=
 =?utf-8?B?ZGJtY0syOXVjZXZ1WHdESENOMkYwTE82NmlLZkw2Qk1rcmN1YXIwczNUVmdp?=
 =?utf-8?B?ZUg3VERJc05jaTlFNStPemZvcGhNekFodWRGamtFMHJFUjlpVUwrVytEYkd6?=
 =?utf-8?B?NmdtTjBZRXdGdVlQcFhxRnE0ckEzQkRjYldJa3BnK3ltV2hYdnRwYXo3b0Zj?=
 =?utf-8?B?dGtwMWtoUERBRjF2UzViWWZBSE00RnlCbFZqdjVSQ1pDOG9yMWs3c2R0Tmpw?=
 =?utf-8?B?Y0VoM3A0WkJuTzd0U0IrQ2JiczkxczBsMzY5ZnBRQ1QxZUxBUENKL3RYS280?=
 =?utf-8?B?STNUVVRGdEZCZFJHZ0t2cHhTVnpNek4wSHpvQ0ZFeHhrNjZEMENOT2lmT2Vz?=
 =?utf-8?B?NXRpdTFnYkVxcjA4ZUJ4TkxjV3VrQ0Ntb25UU2JCOTZGSzhiT2dham9YZzA5?=
 =?utf-8?B?TWlCalc1b2REWi9RZFZCOFNhT0tSRlFIYXhQTGV2bTRVeFhDcHVFcHFmWUFQ?=
 =?utf-8?B?UG8wR3JTZVBnUitBNWxEMGZwUHdHU21jeWpCS3lodkc5QXM1bWVUYlh3RGpQ?=
 =?utf-8?B?TE1tT0FQODlIVTdWZDBSRjRoM3ZRNmxITUw2OXgyaDNuaWVjWEgrMGp4QVhZ?=
 =?utf-8?B?U24za1kySVNrWTc1RFh2d214amtXSjdmWkpSYTRCZmxtM1dxNHhLRElvRitj?=
 =?utf-8?B?OUpSV0NuRmJMbUdmRk5VL1k0Nk5YYUh1UU1TK3VWZmJ0aW5zbEpoME1iVnJv?=
 =?utf-8?B?d09GVE5RanhLb090Y0dHZWoxaURnYmE3bWV2VWhRc3VMaDRabzVVR3VqeTlk?=
 =?utf-8?B?L3NDZzFNUTkxZHU3d3NGQ1krdDZIckJjRE81OWh5UDgwQU9XWXpaNHpsOUNa?=
 =?utf-8?B?TXhUU0J0WEY5b2pGdHYybzNIMmg2NVUrYjRHSHVocXFpV05DUndLNUJVV1Uz?=
 =?utf-8?B?aXhZL2F6MzVBRlQyWmMvcU9NNjYyUTl6aWZweU8yMUZTT2Z6TXlrRjBhbkdn?=
 =?utf-8?B?bHp0Y29lU04yUmtLU0tDQ21aUHdzVHZ5Y0pZbkFYNWdYSjlVK3FyV2VEbTc5?=
 =?utf-8?B?U2ZkTUpkeGY0L1Q2WDRVa0ViTTVJbnB5STZpbllUU1VTWmFnMldiN0tiUjBE?=
 =?utf-8?B?M3E1UlVndzBGekthMk96ZzJyVWRWSSt2ZWtrRXVtS2dlRDE0N3pzcnZRbTNp?=
 =?utf-8?B?REhJUDBocDRJV0FITEEyVElLaExpVHdxOCtxRmhuVGRJNFpyMmc4VGJKTnpq?=
 =?utf-8?B?OGZDZmhLdTRVVEZMaDVOR3RiNUJmRWl4VG5hUFYrWEEzRUtac1FLeVdsM1BO?=
 =?utf-8?B?cG50VDZvZXRoWWpuT0tDQ3d6SFAxU2lndkpQbTdvZGd6RkJDUVlPc0ovWDNW?=
 =?utf-8?B?QmlCbEFaTDNZcVlYdTZvRU1rcG9HVHBlT05iaVN3R001RWRVbmZHRzJVQmRj?=
 =?utf-8?B?WHdOSjVsam5sR3RkbGdaak0vOXJEUGJoemNZeWhEWUNLV09yT1FzRGx2VGY5?=
 =?utf-8?B?T2R5M0FPQ3pTU0JSWitvbmVXYXhTbVRsVVhUWWZoeVlWZSsyV0E0UitvKzlk?=
 =?utf-8?B?OUF6WmxIbCtkZUJBQ1ZpSWRtc1RpWGxBNHl5Ukc4aG1wSDFhR2Y4bXBUblhX?=
 =?utf-8?B?YzBMZnl1VGtsYUNlc0lLY0FCTEQ5T1pkczdheEJ1Ukh0SXhrZGw5bk9veTgv?=
 =?utf-8?B?RHY1a2pDdnBUbTRLejJ6Y3RocnZSQzNyU0RqQjFrdngvZWlYOUlSbDd5SG9a?=
 =?utf-8?B?TzVqcnVISkpKZ3lVcE1WdTJrRUgwQjNpNlhxaWdLbzlKQkJHSUFyUCtwNFln?=
 =?utf-8?B?OW9hMU9FYks1UFVOTDdSV0p3Q1Y2ekpXblY5L0kzL0pBKy82U3hhb1lzNlZs?=
 =?utf-8?B?SFJ5R1l0UmphSFVLaWFQZlVyWDRKWm1PSUowa3MyU0FjcHJGUDgwcVZVN3ZP?=
 =?utf-8?Q?tclcnPGyg36IPpCSETt6xdk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c15bd064-c269-4469-3c38-08dd9ed79038
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 17:38:03.2569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqU4Wmga2L0p9pM0oTMh6DqaF7AdF0mJKp9CyV3I8uA8ixR61kLgXgIi+B4Zwff0aTDl/S7PQ12l3bfHWTMfwASiP1JHL1tJVcnuBn5FRKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
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

On Thu, May 29, 2025 at 12:23:56PM +0530, Riana Tauro wrote:
>Add tests to validate engine activity before and after gt resets
>and suspend
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 21 +++++++++++++++++++++
> 1 file changed, 21 insertions(+)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 02f23bd7d..15b4b82d8 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -40,6 +40,12 @@
>  * Description: Test to validate engine activity by running workload on all engines
>  *		simultaneously and trailing idle
>  *
>+ * SUBTEST: engine-activity-gt-reset
>+ * Description: Test to validate engine activity on all engines before and after gt reset
>+ *
>+ * SUBTEST: engine-activity-suspend
>+ * Description: Test to validate engine activity on all engines before and after s2idle
>+ *
>  * SUBTEST: engine-activity-most-load
>  * Description: Test to validate engine activity by running workload on all engines except one
>  *
>@@ -812,6 +818,21 @@ igt_main
> 	igt_subtest("engine-activity-all-load-idle")
> 		engine_activity_load_all(fd, num_engines, TEST_LOAD | TEST_TRAILING_IDLE);
>
>+	igt_describe("Validate engine activity before and after gt reset");
>+	igt_subtest("engine-activity-gt-reset") {
>+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
>+		xe_for_each_gt(fd, gt)
>+			xe_force_gt_reset_sync(fd, gt);
>+		engine_activity_load_all(fd, num_engines, TEST_LOAD);

This is also probably one of the tests that we want to run, but for gt 
reset and effect on PMU, I would just do the reset withing the single
engine activity test in the same manner as it was in i915.

>+	}
>+
>+	igt_describe("Validate engine activity before and after s2idle");
>+	igt_subtest("engine-activity-suspend") {
>+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
>+		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
>+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
>+	}
>+
> 	igt_subtest_group {
> 		unsigned int num_fns;
>
>-- 
>2.47.1
>
