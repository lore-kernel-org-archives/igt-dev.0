Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FDFFC6186
	for <igt-dev@archiver.kernel.org>; Sat, 14 Sep 2024 00:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA8110E10C;
	Sat, 14 Sep 2024 00:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJhV9g62";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9422B10E10C
 for <IGT-Dev@lists.freedesktop.org>; Sat, 14 Sep 2024 00:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726273239; x=1757809239;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bzfqPuRKhS2VHXmHZyXvEPcK7V7ddolYYgoE6ELse5c=;
 b=dJhV9g62SID8OQeQx60xmSuk8XYY+0kgrTFpjYSCIma5sFKztLOnkVZD
 bEDHuFEScKggaBVehdNwWTXq/GS10DctPHOvVQ1INHM6tQWl4fNRmSsW2
 VZgvxJ6zlSaG68B56BnL0tSjTWwJXzCxqgcC3q6qqQUWIPYHmdLux9IdQ
 RORIXBzuDzRKOl2mvkd5gbUcNw/a84y/7QSTe7U72ziHTimMDMoE+S9BQ
 +P7uqa+QfM2Kho++IwnSLwQdKfyPexsYL7yMcOke0npEyB9TDMNPUEjeq
 ydYP5PSKiMsGsu0MLgAdhWqW+WhhGdPrOZChwdzyJmLDOnOqBW0QzhTcg A==;
X-CSE-ConnectionGUID: hBiGHv3USjerhQQv7pT+zg==
X-CSE-MsgGUID: s7IJs65PS3KMKPUcyVosCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25343722"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="25343722"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 17:20:39 -0700
X-CSE-ConnectionGUID: Gu2juNWvTf2G18VNWhfuLQ==
X-CSE-MsgGUID: JegcCwyfRYebVdFwpj9NMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="91522263"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 17:20:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 17:20:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 17:20:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 17:20:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xq1ohshJxBQxSzFTb61ElpDN6itet7mibm7dlIed47bTIrNZJkt8i7NleAn8/gy66NCm+lfWi4Qf2nbZpBItesb/sBdZOq+RhSK7/qlymJic4GIpgAGN17WTWnweCCqXV9M9L9f0q6LBVFfghPKHGrKsc0icABrhELb7mj+f9Tv2u6LX8hhlxqsRhDmZO/czZqE54sF93pP9JhTtISX0+g5GaBkRzpOA9TZwXJwWrPwQ+MzNgym9ZUVg0NKFAePadkSogz9Zp7FaHAAygAHuOM7s6IqPwKKcuRD7atXTWDYWYYH96M8TikzbApUH2drfoXczGWcaCgyIvMzClE0Ifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uF6FqiS+tcq6Wkv1vMMXblUzY4IAfX9ZW9eO1zeeis=;
 b=yibSWNKDFR0PKJtOejPub0ObvgGH6TbSBg41flePMvp8YLA9qXu+h2AErjW0AoeomWVNgN+stdbMzHLNScWZOTG8BIVoEl9kWbqrQhBc7vvtlI5juqopXwPmRlehr6ZErDwVxPgjCI/fpiKJLYS0gtfh84J5PgnDI9ZnQG7X1aDRUaxM2M6Pg6Tx4zZc1a4HNqDRGjqtAOpx8pFEnL+MpIS1SP8OCJuCXSTLUF/vhr0dZ11VcEzcTeVSZuY9ZeUZwXgk2jlOUZJCDWJbhDM7S21rxsIvuOKb4kcQeka4F8ZA9CNr6t2r/Sy1a6tFNoIFY5x+sQYANWHqF+VqDZBLOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH8PR11MB6563.namprd11.prod.outlook.com (2603:10b6:510:1c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Sat, 14 Sep
 2024 00:20:35 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7962.016; Sat, 14 Sep 2024
 00:20:35 +0000
Message-ID: <84c6520c-b634-4be3-89fd-98595b537cb8@intel.com>
Date: Fri, 13 Sep 2024 17:20:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC i-g-t] kunit: Remove hard-coded test list from xe_live_ktest
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <IGT-Dev@lists.freedesktop.org>, Katarzyna Piecielska
 <katarzyna.piecielska@intel.com>
References: <20240823182418.1771456-1-John.C.Harrison@Intel.com>
 <1941664.taCxCBeP46@jkrzyszt-mobl2.ger.corp.intel.com>
 <abec4930-3ad9-4a90-97be-20a21a3e841c@intel.com>
 <1942260.taCxCBeP46@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <1942260.taCxCBeP46@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:303:8c::32) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH8PR11MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: ad72b9b0-677b-4eb9-f0a6-08dcd4530d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UStoMGxkWjVsVEthTVM0Y0tpSHJSVlBidXFJM3AwdzZNKzRZYVJ3RktWQ3Rs?=
 =?utf-8?B?a0JyRGtjUGdEaWp1dW1KQndRc2VDNENLRVd6SmsrOC9GQk9JRDFZamFOaFZa?=
 =?utf-8?B?ZE0zaG9xNlRIa0ZRQXJBdlp5NHB4VXN1cjFsSUdaQTZIMmQ3N2tteG40RktR?=
 =?utf-8?B?THEyTVRvb1paMG1aa05BUWZnSHlUMGJBWEp2K1NjbmJpK3dYY1lGOVlwOUV2?=
 =?utf-8?B?aDFkNTBiN0lCeUdhSDV0bkpZeGVCdStkUU1DeTVjczRXZURpcXAyMHFXeWIr?=
 =?utf-8?B?bjh4Q3Vkc3pOVGovTjFmd0V4K0dCMHdHWlMrengvaWxoTEpvZ3pNdk9zVytW?=
 =?utf-8?B?cWV0aW01elVwQW5pSUN6TVNhYTlrbkdEMklOTk5BaW9XVkN3dmVjVVZZbjhm?=
 =?utf-8?B?cENtTW1wdFlQZ3VnZ1JQdmkrLzJQemNCZnZYRFowZnZ2T0tJUlpaa1daNFc4?=
 =?utf-8?B?S3ppY1RiZUZCMVZoMGNNb0trQ1dDT3c5Qk1ZOXNBdmZ0bFViRGN2anhWNFZj?=
 =?utf-8?B?K0o4bXZxalZMbWJYNlh4OTE1UzBLcGwrdGRMWFNzaERaQmx4Q01Lb2FGdGl5?=
 =?utf-8?B?WEMrb2Nsd1o1dVlPVHdCWUQxd3NhMnNpOHVZY2NiSlBtQjdmSm5ucGFEVXB0?=
 =?utf-8?B?Tmcrb2Yza284U3lpUXA5U0dLeFgrSTU4dDJxemtMd3plbVAwMnk0ZGNkNS9j?=
 =?utf-8?B?TzhVUndvbGNmREY1clNUWGlVZG4zMWYrWlR1Qk4yd092OHA5N3lqc29sdWp0?=
 =?utf-8?B?V3N1Z0hITmZxY1N5dWN4NDdNbWpHbmwxSkt5ZW9WRnl0QXRqZ3BHcDVPdzhO?=
 =?utf-8?B?Q0pST2wwVmhXa2c5V2diRTJkcFBYTlVwaTR1ZVBSWitHd1J2UUVpR2lRU2Z1?=
 =?utf-8?B?Qm5kaGVodDMzbGtvWWtFOE8zTDk1UFdYalp5UTNibk1MVVBDUzN6US8waTd3?=
 =?utf-8?B?YldoTnBzb1BQTzJIMUNRQmZWVmtmUTY1aHlWYzhDSEthdHcyaFpvRGdyZi9L?=
 =?utf-8?B?SHhUMENuT0hoTGNXYmErL3p4VVpCNnJkSFlROUc5OTRpWmxVNjBNckFEMU96?=
 =?utf-8?B?d0tieEVYU1RPQWJWLyt0RVE5amZISzZVMkdRbk9tUmVlREtaNmVvU1dsSkJ0?=
 =?utf-8?B?MkQrUFUrZGZ3QXRlQ2Q5UllPWGhESnFOc1RxOGJoelc0Y0g2V2pTUTcyTVp5?=
 =?utf-8?B?RnJ0QS9BUENNZjdkVFJVZ253RFU4akZ4ejNETXErZ3JRZEg4YTJzSDN3Q1Yx?=
 =?utf-8?B?SzdGUXVmRWpwRDZnT1ByL0xhTlNFaFNHYTdXQ2MrSU1aUmxpWWE1aVQ2NnFP?=
 =?utf-8?B?VW95NE1XNG9MNmpzcW5CZUNvRFYvZ3ZKa3d6S3FVVld0SjZKSVUvajF4K1NK?=
 =?utf-8?B?QlVPaGJCMmJyUzlwSVJpSStjVHVuVGZLS00xWXlqUUM4WisxLzBkZ2dUVkJV?=
 =?utf-8?B?U2dPcGFuNFczMnpDOGU5VVR5cm93UXEzeVBMbFFsS3ZSK0ZkZEhuM24zSVdH?=
 =?utf-8?B?aVRoeTcyeWV1OVZjSXBNd2JHcml2SlNwS2wyRjMzQktJVjc3dWhSOEc5OFpy?=
 =?utf-8?B?WGJTL1o0aU85VE4zWjg4dy9JMjlKNFRHcEhZdllyN0srK3BDTnM0R3p6NTM4?=
 =?utf-8?B?d1F2dlpQaDNlRTRJRjRhVDczREplRlMxZytsTmJWY0o3SUhtMXJ0MENsRFk4?=
 =?utf-8?B?RDhnQnMvdGlIR0JMRU9henNOL2p1Tnh1bmdSTm5kWlJCS1IrajhaZmRWTWps?=
 =?utf-8?B?UlVBVVRtM0YrUnJlVUpGK1BuVTJoUGRBUmkwTHFlZmV5NEtoTVZsY2d3Uy9l?=
 =?utf-8?B?bEVTTlFudlZYd0c1MmxHZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q05PeXR5R3lYMFRheWxGdTZOS3piRFlHdmlEeFQ3NlQ3blA5cnlNK0VaR3dP?=
 =?utf-8?B?aVVVWTg0M1U2aHNVYzQ0dDk1d09ZM1ltMTJRSFhGK0pLZzdMY29sRzk2ZnR1?=
 =?utf-8?B?ekxBS09mWWJNN2swbHJ3cnV4SzZhSzZKaFM4VTd0bjJydy9NSVlqcHlsS1Z3?=
 =?utf-8?B?TFFEcEFoUlZ0N3dwTlRQTnNlSlM0WVJWOEZjd0VGWnhCbW9nV1QyRjZGYVBy?=
 =?utf-8?B?NDV3MlUydHJ1cXJ3UDQwSU1xN3ZGd1pDbzBscUJtT1BZNitOOHNpeXJ5Q29K?=
 =?utf-8?B?UkpXZHF0bjlYTHB3WVlpQ2Z5K0VPZUg3U1F2Tkw3NldzeW84MFVEVUU3b0F3?=
 =?utf-8?B?QWNFRDNjZU1LOE9PS28zRjN1VWdjRzVKT3NJeFROOFkrdzVBQ2ZCSDJSVlZC?=
 =?utf-8?B?MnpRVHRFYnUweFVnbHpURVI2dFF3bEhjWlJJRC9mS2E1aUJZMmdNcDB0WFJE?=
 =?utf-8?B?cXdEN0hmSmgzUXdFMWFoMTJSOTlFOGRxOTJnRDJRTkRwcFJjQWxBS1R3QUQz?=
 =?utf-8?B?SmNmdlpkaTh6RTJDU3hhNFBlY2tIWmJHMWJ2bVRKZTRjaGpmTXFxL3FydU9G?=
 =?utf-8?B?ZHlaQmFNbnl4SmVrTzI4M2NJUnplZ1VGNUo5SnByMzhxdE5aT3dGNkxLd29h?=
 =?utf-8?B?M1VJenFWZTIwWURwQnF4N0loUExZOENOYWRpOGwvcWNkY1hSM0paRzNpNlov?=
 =?utf-8?B?TVF5SEs5TGpmZ0IzcWdzRzdKNWdYTXZlSEtNRFh5NHlDQmIrYjlNQW0xUVpF?=
 =?utf-8?B?WFI3Q2dTSCt1UUFobE4rckpvTklpMVhaeHR5NlVQTkFDNEkzK08xVFYwU3dR?=
 =?utf-8?B?SjNsZEpjNHdQTnBiT2ZyUmpOdmUvczhjN0ljL0FEQkc5RkRMWWErck1xQ096?=
 =?utf-8?B?SzZuQjEwaUxzWE1yNUhQVXpVZDl6K0pmeUF2S1ByN29FTjZ5U1pvVWhVVzdl?=
 =?utf-8?B?QjFpdlA3TE9EOWlUSmI5RGJWMzZhdXRzRGNpemFkaDNpUExsUXZQVjBzWGxS?=
 =?utf-8?B?cXh2bWpVZTdEU0EwTVB4a1RMRnZXQzJvMnM3YjJzSkFadFQ3L1pQV3UxSHBG?=
 =?utf-8?B?WGtqRzBMejNNZGpIeWRQb2ZHcG9neGNOdGRGSjY2cGtnbFZqN29tenBTdjZL?=
 =?utf-8?B?c2RRNGxnL3R0RzRONno4emhSMWtjTE5pb2NPdUp0USsrMG56NDZudHB0Znky?=
 =?utf-8?B?QjFRa2MyTHMyRUt5VjUrcFpQSWRWbDFJN0F6bTN3ZUNya3ptREE5UUFzbkUr?=
 =?utf-8?B?blJ1Z1daQ25kQmh0dHRPdFJaTEtYaE53SlN0Qng3M2Z1eGlnTWVmRTdPM3F3?=
 =?utf-8?B?V0d5Ry95MFpGaWMxNzRBeEtNZWEwMmpNcDVmQURXVXZOUjF4WGltZHFRUUh6?=
 =?utf-8?B?cmxKcE94UkZ5TlRDZ2tEb3pXTnJ0dWw3a0xaeFNFNGFyUXdoV0pnVHhRdzNR?=
 =?utf-8?B?NXE0MVdKR1hCeCtuSStNWXoxQ1psY01lek1ZTmFRZHh1NEJJUmhTckNnNU5T?=
 =?utf-8?B?UTNIaHdXeVhNbEZqdkkrbnlPVXJsUFhmaWRtRExrSDhoWHJwN2NzeVE2ZkMw?=
 =?utf-8?B?bTZyRDQvZUhETUZra2M1TXZsb20wbWQzNFlKaE9XWTFnam8zSE1rbTN0bXNo?=
 =?utf-8?B?Z3BJU1FXT1Rpdm1Sb1BPNjZITjY5KzBwc2NFdmdmTWN1c0RZQXdSZVE2SUF6?=
 =?utf-8?B?SGFXYnpyY1NqMUNKaG0zRTB1V2tsRXB6d0Z3WjJMZHhMbXFvNjdrdkprdU9y?=
 =?utf-8?B?TW44cWtBUWxoc3drV0duUlFCZkdTTlN4VHhOQmpmd3JscTFzMDc5dEdSNXFr?=
 =?utf-8?B?dUR0VnJQendDSUhZSGVWQitwWkV4RWVJOXYyeHJVZmVZV1NSY2lFYWczYmpw?=
 =?utf-8?B?c0thTzZQcHR0dTFNOXJVT3pYejZZalVuZzFJWFRJTmNaNmxsenZaZ3NaMzN0?=
 =?utf-8?B?b3NjdnZNb09zS3llWEExbVMrbm96WjhHSlBTY0xOMUFCcHNUWm82K2lJKzFX?=
 =?utf-8?B?d2FvY0FQMkM0T09IUWltbTRmSWU5cksyVS9xY3I5d1F4NjZvb1phRVptMTN1?=
 =?utf-8?B?WUpYUzN0ZnpQKzlkcWUrUEkrMmc5SHJRa3JqZ0RSR0ViTFdGS3JNODdkeklE?=
 =?utf-8?B?K2NGK2hveDBSZjhvSUVjT21UNzNPQVBGMCtPb1hDRzFMT0pHTEVNNEpxcnJw?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad72b9b0-677b-4eb9-f0a6-08dcd4530d2f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 00:20:35.0056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CivdTcGpxledV6ET49km1h3kJ36zGxxnKNYcMzEyCu0BpArZsUQtlIQwfNG0itNkfD43+9Qmjk0RS3jfrToNdoroAKgcEheAK+zmQR0uG18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6563
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

On 8/29/2024 02:57, Janusz Krzysztofik wrote:
> Hi John,
>
> On Wednesday, 28 August 2024 20:04:06 GMT+2 John Harrison wrote:
>> On 8/26/2024 06:07, Janusz Krzysztofik wrote:
>>> Hi John, Kamil,
>>>
>>> On Monday, 26 August 2024 13:46:45 GMT+2 Kamil Konieczny wrote:
>>>> Hi John.C.Harrison,
>>>> On 2024-08-23 at 11:24:18 -0700, John.C.Harrison@Intel.com wrote:
>>>>> From: johnharr <johnharr@invalid-email.com>
>>>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>> Again invalid e-mail here.
>>>>
>>>>> The list of supported kunit tests is currently hard coded.
>>> That pattern originates from i915_selftest, where there are 3 stable subtests,
>>> "mock", "live" and "perf", each of them executing a (possibly long) list of
>>> dynamic sub-subtests actually provided by the module for each category.  Also,
>>> IIRC there was a separate module for each Xe test suite before, each mapped to
>>> a separate IGT test, later merged into one module with multiple suites and one
>>> test with multiple corresponding subtests.
>> Not sure if you are just explaining the history of the test or making a
>> suggestion as to how it should evolve next?
> Both, I think.  Maybe not the history, but origin of ideas standing behind the
> implementation, and how tests are expected to use it (and maybe evolve if now
> doing that in a different way).
>
>>>>> Which means
>>>>> that adding a new test to the kernel also requires patches to IGT as
>>>>> well.
>>>>>
>>>>> The list of available kunit tests is already exported by the kernel.
>>>>> So there is no need to bake a list into the IGT source code. So, add
>>>>> support for querying the test list dynamically.
>>>>>
>>>>> NB: Currently, the test list can only be queried by root but the IGT
>>>>> build system queries all tests at compile time. In theory this should
>>>>> not be a problem. However, the kunit helper code is all written to run
>>>>> inside a test and not inside the prep code, which means that when it
>>>>> fails to open the root only interfaces, it calls 'skip'. And skip is
>>>>> not allowed outside of running a test. Hence the build fails with:
>>>>>     skipping is allowed only in fixtures, subtests or igt_simple_main
>>>> Looks like we should fix it, move out skips from kunit libs.
>>> I suggest you consider a different approach: for a module, call igt_kunit()
>>> only once, with NULL suite argument.  As a result, you'll get results from one
>>> IGT subtest called "<module_name>" with a bunch of IGT dynamic sub-subtests
>>> called "<test_suite>-<test_case>", one for each test case provided by the
>>> module.
>> I'm not following. This is what my patch does, isn't it?
> No, your patch introduces a runtime determined list of subtests -- something
> not existent in IGT.
>
> An IGT test may consist of one or more statically defined subtests with pre-
> defined names.  The term dynamic subtest is usually used in two meanings.  It
> may mean a subtest of type igt_subtest_with_dynamic, still with a pre-defined
> name, but with a runtime determined list of sub-subtests, sometimes called
> dynamic sub-subtests, but often also called just dynamic subtests.  Names of
> dynamic sub-subtests are determined at runtime.
>
> My approach tries to address your need for a maintenance-free kunit IGT test
> source file in a different way.  I'm following the IGT standard of statically
> defined list of subtests with pre-defined names: one subtest of type
> igt_subtest_with_dynamic, named after the kunit test module name which you
> have to enter into the test code anyway, and providing all test cases from
> all test suites contained in that module reported as dynamic sub-subtests
> named <test_suite>-<test_case>.
Can you please prototype how to do this?  I can read your words but I 
don't really get your meaning and I have no clue how to implement what 
you are saying.

John.

