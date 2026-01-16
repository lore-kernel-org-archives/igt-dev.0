Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD43D4A5FD
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 05:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65F410E073;
	Fri, 16 Jan 2026 05:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ag5SdDPm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5321C10E073
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jan 2026 05:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768540864; x=1800076864;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WZ0dXIzr6Lvon7FTgzyQciMTmEeztU0tx6YXQpqMS6U=;
 b=Ag5SdDPmp9wRsXmiq3fO/ft4IrHclL/xX6r73TzXy9BBGpyFUutkHG9Z
 12cZKOx7oAjS/jLj/qPeOaE3ZEncIFabjo+4cue5DDcZnoTOBeHkrtTAw
 TXKw3/+4reOJB3VU23MZsP41ZJEuVJtBgVj54xGuo4878EuDqJwniIvDJ
 q5EevitZm4T+hcZiGQ4zocBpYBhRugbXfWJQImO0yHVATMUhXA4eNwL5b
 MNjqRnvVmlVF72DZSw47+8ddTrUxI47dONlxB5QquR0bPp3OnGiK6AG8P
 5tujiofIOE48BldQuhugiJQ1bcIoIy6xg64Gc8IRbRxRCO/xOT1SZTB9Y Q==;
X-CSE-ConnectionGUID: CyguFNisS++m0reOXL5voQ==
X-CSE-MsgGUID: cntxDJyYR/CvFvEAmEnZ2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81302200"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="81302200"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 21:21:03 -0800
X-CSE-ConnectionGUID: RXTCpkDISZSGQEcnd/IRsg==
X-CSE-MsgGUID: fEGoio3QSlWctUVuEj9POA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="236400421"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 21:21:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 21:21:02 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 21:21:02 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 21:21:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loXuGgzMb8ao6Haf9Xq4gHQetXuQZFjNqetPryakX7DmtGK7zAs3UnyW2iueJ99KZkTJ41fxyErK1MMxI++YkpMeEgT2sw3CRDrohJTyZ4SoLrPEmT1R8pX3GEhfiSMxznwM90n8kgDGTO1GakeKrokcVqXHUCMiIzQZqMiaG8Gg+t0gnsnHWigbZ0K+/e+5yDLJmg34Ic55xxFA5KdPpE4T/TKZ68tcWrUx+hw2IwnY1OiZUWk6sAByT+avpL0RuEJGtWCI7MQZTiBn4T8ltLm/Ffzwd7xc2C6+P8IDz0F7WbbQekIGv5nnQlWnh18/bZ+yVaT/eWTrDTHKwb+UrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHbmhtm4XE8EuR22B3Y9bs0huu2grUhmEsK0bq/2cqE=;
 b=NbiR+UeclhlKd/pzgdJ8RXqyjEfrEzUZCMmuuN2/qs/4BJei+hknS5R5FBIXKYLQNRQ/+zEa01N+Q0PI2UGtl7I6wXf8Lktq5+lkhS/hqn+tpGGolC0xeXlShGLxc9V72h1K8Puwr3JQKw1Cl2W0kCuXy9KQ4W89o9u/N21RVs/iPvkHuupRP7Pfy+xs9/JDMWlDnowqpXnvwg2OBmy/n7G4epv3MSSjgUfLiMCGN+5A1VKLkMUSyS+lhIBCFzi/3h3BrC1zMtiye+1L9GWznZZlr9iP58cdaFNmWixVQDFP1HPHVwhmbnKFgqT1iobAB4NpyzCgnz3SuW8RBPw84A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SJ5PPF0D43D62C4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::80b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 05:21:00 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 05:21:00 +0000
Message-ID: <a90682a7-379a-4ae9-8d66-27529710af6d@intel.com>
Date: Thu, 15 Jan 2026 21:20:58 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Fexec=5Fmulti=5Fqueue=3A_enable_preempt_flag_for_Q0_=28rev3?=
 =?UTF-8?Q?=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20260114065048.833061-1-x.wang@intel.com>
 <176844066745.155664.12033771717589704779@a3b018990fe9>
 <35909f2f-13b1-4363-b501-c8e19b5c3cc0@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <35909f2f-13b1-4363-b501-c8e19b5c3cc0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SJ5PPF0D43D62C4:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e126e28-1a6b-41ea-5f59-08de54bf0906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|42112799006|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wko5VVpzcGVzdUR1Z0RtaE9YMks0NW96TEZyTmhjQXRiN25Ib2czOTc1VFFF?=
 =?utf-8?B?dXpYZE0wQzhYNmxPWGg4SDN1U1QzVkFKcXFjRWRBaU90OENLd0JMY1g4TnBQ?=
 =?utf-8?B?ZERuS3dNcDFhZkZtODMrVUN5WGJ1OGM4eGo1bUFxSzdERTRvYlI4Y3JHQlR6?=
 =?utf-8?B?a1ozQ0xwYWFsSWxHaWxsWWRPTTBJTnA1Q3B6WVFyVTh5VnMydjRwK2Fhd21U?=
 =?utf-8?B?VkRHeWRDeDhqbkxtcm1MckxyVG00ZkwzLzBVc1ZuYkwwVVpLZysvVEhoSStF?=
 =?utf-8?B?MDd0cWhkRDB1KzJzUU9rQ0JtS05nQXJXY1p2YlRYRXJ5NmdQdUdHRjVjdVRL?=
 =?utf-8?B?Si9VVURBZzlyOEc5ZURua2FSLzhhbDU0azRxYmdCMTd1YzlIUWo4eWxtME1B?=
 =?utf-8?B?cVRSN1l0Y1Vxd3AvOW5IUVpmWENqbS9jYkJ5ejFpK2ZiL1BBaDlFeC9mdktN?=
 =?utf-8?B?WDNFcGhGZkJBWXJqOGszR011NTZBck96eXF4d0hESUFDRTd6L05kOXRFSGd4?=
 =?utf-8?B?VW9IZkJ3cmpxVUJDNEYvcmJOZG5HWG5MNDVjR21sSGM4UE5reThYQTdOUW5h?=
 =?utf-8?B?czRsVVNaQjdLZmM1U3hlUDd1WFlLMkVDbTNQZW51WnBMenduK09BdmxZNE1J?=
 =?utf-8?B?bEhmREEyck53cWxDQmJTRWxpL0ZxTU8vWGpSanhxSkZsT0Q5UlAwQ1BJM1lH?=
 =?utf-8?B?T3ozbHBwdjJTWW5TOStSb1Y1dS9PNEVwOFpMUzUrRVBTaGY4Nm1uQWp0MXNZ?=
 =?utf-8?B?VjJxVVJteXpJcVFaMFZsMDVLNzJHaWZEL2Frb0RtalllTFEzNnZHT2tMSHV1?=
 =?utf-8?B?U0hBV2R6VGRZRTh2Q01rN1NwdllsVTVsYXIvd3JaVldsOTJMdjkyWjdPQWhM?=
 =?utf-8?B?YXVYUXZJRlhjeUpyd1g0VmJpZnZjYVVZejdvSUdTSDlMMElrdnFSTE1wc014?=
 =?utf-8?B?ZFU0K2RiaWJabE9laG1pUzczdE1CVWZKNjcweE50d1JrOHljcmJDelNBcGFq?=
 =?utf-8?B?UnFPL1AyNmQxazRDRzNNN2JTUENRdzhEclBFcjA1a2lYTFh0SlF2ZCtUQXRX?=
 =?utf-8?B?TlByQ0dQdVlCZEZRbW04ZEVWaXNtTE04RlltZU1GOHFPdGhTVjlmdGFUNXRv?=
 =?utf-8?B?elRtNFplK240YVRWdnVDdUFpRHpxcDNFd3pnS3o1d1d6WFBiSnN2SlliN3F5?=
 =?utf-8?B?OC91NG9yRDVUWFBmRHA3bWQwVW5RMDd5UzlXc0x3UXZ4WmoyMzdLbUp3bUc5?=
 =?utf-8?B?Vk1pT1pOWnd6R25XaTJoQmVnMnhULytnT2dzRTBsRmQyNVdxVGhlN0xvLy85?=
 =?utf-8?B?UzZ4RkwxSkZ4dCtWL3NFd0RqbDFIRXE2aFRmSVU1MnZET1Znb0FnVHNjRTRQ?=
 =?utf-8?B?eHpTcVhRZVdtdjZONkZDbTVlS1BRQWVQRXhJMENjMWxVdTBxRWExRTdZQnZ1?=
 =?utf-8?B?Zkd0QmxUSy9FdlFnaWVmZzdnZFQwaVg5RFFoOTVXbnJCVXRjQVc3T241a1Nl?=
 =?utf-8?B?L0J0bHFuVGxDODlDMGtHbEFnVGtlbmY0VG1WZlVhcmNRMU9uVlZMQUdMcUk4?=
 =?utf-8?B?dUxwQVRCNzJSWTdVZlVIeVZhM3V3WDhqTDQ0Z000amlFcEFTaTBmMWJjQ0hH?=
 =?utf-8?B?NXpYVFFydG5YM2NlUU1qZk9UbW9xeXIrbTFrbDN4elptNHBlOGZWa2tPV0Ev?=
 =?utf-8?B?cDFZeUJ6OHdTZERzcU9wREh5NUYvYkNLOEdwMXUvczBYWm80NXZPeDJucFNU?=
 =?utf-8?B?SFk3aXZOa3VHNm9ES1JxVU9zTFUwd3dXam52SFpTNmdKUEJ1czVwd05RL2ZK?=
 =?utf-8?B?OUpWb056TlNObnNpY01iTG1pVUNxMkp5elUwbGg5b0lFWkFrUVpzZVQ1T0RE?=
 =?utf-8?B?THF2b2tuSTh3NUJmMHUzMThHM05WTnpOQkRaTnFqbnd5ZHZVUVJUa3NyZUp6?=
 =?utf-8?B?OStJQUZDM0FLRzJ5blZZaHpoYmRDWnFrQUFBeCs2T01NUkJsc2NHTk9BZVF5?=
 =?utf-8?B?THZVTnAwc0FNbit1MWEvUmNqU0ZpY25vTUVmeFJFeG15Rk5hM2ExMnBlZGJi?=
 =?utf-8?Q?ZhqehY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(42112799006)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1R5V2VZczFqR1dueW43WUhMUnZZd2dVbmgrNG1NUUFpaVJNam9rY2ttRnZo?=
 =?utf-8?B?cm1BVEdPQk1RYkhYV2MyWjFEaEo1Z21EdDBxMVYzUFBGRFhpcjNoc3FxaXRx?=
 =?utf-8?B?ZzRFbGp6U1hneWwwUW40bkMvU1QwSWZhalVQZHY5alhERHA3M0xiQWZ1dzRI?=
 =?utf-8?B?UkRYN0g5UHNOWFZSSnIySXRZTXYyWElISmlKenIzaEh2MWdsTHhvZ3lQblZn?=
 =?utf-8?B?dzM0RzNMR2RtN1Vpc0l5RTkrOVB6TXllWU1rOUdtbjYrNG1wRnFzQnRVR3Fw?=
 =?utf-8?B?eENkam81NTgzbmRFNC9wcEtSUyt6WnJNK3prRUExR2RSM1RUMU5ZVW1NMFdr?=
 =?utf-8?B?UVFIY2FQRlpCSlNZVDY2R2hPNUFtdHRVeUVpR3ZkVEZuZjJEbVZBbzB2RC9o?=
 =?utf-8?B?d2hhaGRXVFNzV1Z4VENDMzNjbjBFVnBCMEVFY2pOa1lCY2IrSjV6MTlxVTRs?=
 =?utf-8?B?M3FPM2hMNHV5SWJaVGVJeG9XalpQSkhMOXFRODZZVnN1UEt0Ny94enZjaXRM?=
 =?utf-8?B?RmZNV1JuSm5SMkhjYWZ6cUk3MHZwZW5yVEM2Y2RXcmtuc29IdFFFT3QwNDhM?=
 =?utf-8?B?TGY0NHZRcDE5Q1E5YU0xdkxlb0FSN3AvUjluNnJjRmc2eTBiUU1tamFQNzlZ?=
 =?utf-8?B?N1BMZVpEYmZ1UFhPVnc2Z0Via0pSam9ORTJkRVlaWGpVbkhMOGhReC9QK0xk?=
 =?utf-8?B?VG8xRFJIWFRGNkFZWElDa2JiZHlmelJBMzRGbytMdGhscUM4TjdPRkxjOVJJ?=
 =?utf-8?B?NVo2cFpkRkZKK2pDVjBuRXNlVVJ6VkNoREt2ekFSSjB4bzJHWXlTbUcrOEUw?=
 =?utf-8?B?U3MyTlFxb3kzQXpZOEhISDVUOGxuUlA5YkZNb0hUV0RvcG02eXBGQmc3aXFP?=
 =?utf-8?B?N2loK1Z4V2JrUHBGSEFZcCsva0NPUlhtVGN3MGVyOE5SbFNMTHVEUGFmQnI2?=
 =?utf-8?B?bnJpa3dxc2pmS0JyeGlQVjBwVVVtcGdjc2xQSjBvcDQ4M3lOV0tMS3ZWVDhI?=
 =?utf-8?B?QmhwRE4rcENIejBoNkhqUTZZWUJBYnhVRFQ0UlloOGk3ZVB1bHNCWEtPYUpZ?=
 =?utf-8?B?Ti9SVTQwTlQ3NG9iR1JnY3pGWTVVR3l0Mk5ONHdSbnZ6bmw3cXZLWFhxaHpP?=
 =?utf-8?B?U0xVR1M3L2ZhTTNQWmUwNlJqQ0ZHSWt4bHAvM0xCVEFkelV5elBENUF6b01E?=
 =?utf-8?B?VmIvQjdvbVN4YXhJc0U3ZzRTdk5TK2tpbnd6ZUhBZmM4OTMyaHZDWkJRL2lG?=
 =?utf-8?B?S3BTMENsRXZ1emRibXgvR2RQeW8yN3krYnI4SlBFT3p0MFk5eGlKcEpkSXk5?=
 =?utf-8?B?WXh6MkVzb01zcUpZcUg3N2NqblBDNXo4cDNBcVVuYlFsM0Q4OUkxakVrUlNI?=
 =?utf-8?B?RlhHQkNYRmluYnZoQkdpMWprSWRpclFyd2RuakRISFRieTFpVDc2UWg1VUds?=
 =?utf-8?B?UUd5RG9jT1phZ3hPd1g5SWpRWGJ4MW90UWRWTzU3TVQveFIrdHltNzFqU1Jt?=
 =?utf-8?B?ZXpvMFY0YXZ1SERYOHF6eGxhVis4Tzh1akxBMWdnNkFsQVBtcFBWY2hlN0My?=
 =?utf-8?B?a3h0YUxtOWdWRGMwMUlNNDdNNXlYSHNtalNrdG5OT1lRRjJDRWNUcDFldDlO?=
 =?utf-8?B?SjFxY2Z1LzM2NjI5SFVFTkRoQ00xNmp2eXhTMVgwalN5R3BmTmtVaVMzQ1NS?=
 =?utf-8?B?NzdEVVdsN0pwam1RNDQzVThvbEJUVkIwVTNHbGlaZ0s4VElCOEk4ZkpONkJ5?=
 =?utf-8?B?bkZoUjZCd0xvSmMrK3JuQnZXK2hHaDZ6dkdUYzlsZld2MXVNNkVNMWJXcXlq?=
 =?utf-8?B?WjNzWmNXZzN4S1VKQmxvL2o1UTdoclFwd3JoSXhMMWxTWjBzUTRWaGtFbG9k?=
 =?utf-8?B?RDJFVldESlVuZnVEam1Oekp3Ty81MVNVeGRFVDdoaURlY0U1L3Y2ZGtSdjR5?=
 =?utf-8?B?NmN3cHErNExScTJUcWNQbThOUUVMTVhFclZYTmNrRzl6aUxTbDMvdXdta29q?=
 =?utf-8?B?YkhKaHVWdk10WDUvL1ZHeG1qTVVXeGtYQitjcStSbStYa3oyMjJKRFg5U2tr?=
 =?utf-8?B?ajdDSDRNTlo0bGJYVnRrblg5OVRuM05kemEySWgyZThRODM5Q1N0Nk1Iejdv?=
 =?utf-8?B?K1M4WjFGZTlJV3F2RGZiUHhZYzg0M0cvVWQ2dHM3VGhlNU1Ibzd4MDNYb2ZW?=
 =?utf-8?B?SXZTMTM4N0JqRWhZR3ZvZ01idW5QcGJtZGRwS1hXZmNLblowaUQ1Ukw2VUFt?=
 =?utf-8?B?NDZNbUtrMkFHWkM4UWtubGpFS0FHR1pUeHVqbGUwS01DanpkcVdGbUM2amlq?=
 =?utf-8?B?SmFTTG5oRExVLzF4cys1MEVmWWVtWWxqbnRHRVE2NXoxQ2dPaVg1QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e126e28-1a6b-41ea-5f59-08de54bf0906
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 05:21:00.1788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 808eyP3J5bJRYzHMIPndGxMcCaf+8vPhS/Gp9UQPH4Y/RDbKkO+AhsYEuorDoCmGsCwuaP3KufmifqmTq+4hPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0D43D62C4
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

Please, don't merge this patch, need some more debugging for the issue.

On 1/15/2026 10:46, Wang, X wrote:
>
> Hi igt-dev,
>
> On 1/14/2026 17:31, Patchwork wrote:
>> Project List - Patchwork *Patch Details*
>> *Series:*     tests/intel/xe_exec_multi_queue: enable preempt flag 
>> for Q0 (rev3)
>> *URL:*     https://patchwork.freedesktop.org/series/160070/
>> *State:*     failure
>> *Details:* 
>> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14345/index.html
>>
>>
>>   CI Bug Log - changes from XEIGT_8701_FULL -> XEIGTPW_14345_FULL
>>
>>
>>     Summary
>>
>> *FAILURE*
>>
>> Serious unknown changes coming with XEIGTPW_14345_FULL absolutely 
>> need to be
>> verified manually.
>>
>> If you think the reported changes have nothing to do with the changes
>> introduced in XEIGTPW_14345_FULL, please notify your bug team 
>> (I915-ci-infra@lists.freedesktop.org) to allow them
>> to document this new failure mode, which will reduce false positives 
>> in CI.
>>
>>
>>     Participating hosts (2 -> 2)
>>
>> No changes in participating hosts
>>
>>
>>     Possible new issues
>>
>> Here are the unknown changes that may have been introduced in 
>> XEIGTPW_14345_FULL:
>>
>>
>>       IGT changes
>>
>>
>>         Possible regressions
>>
>>  *
>>
>>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>>
>>       o shard-bmg: NOTRUN -> INCOMPLETE
>> <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14345/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>>         +1 other test incomplete
>>  *
>>
>>     igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1:
>>
>>       o shard-lnl: PASS
>> <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8701/shard-lnl-4/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html>
>>         -> DMESG-WARN
>> <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14345/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html>
>>         +3 other tests dmesg-warn
>>  *
>>
>>     igt@xe_pm@s2idle-mocs:
>>
>>       o shard-lnl: NOTRUN -> ABORT
>> <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14345/shard-lnl-1/igt@xe_pm@s2idle-mocs.html>
>>
> Unrelated.
>
>
> Regards,
>
> Xin
>>
>>
>>     Known issues
>>
>> Here are the changes found in XEIGTPW_14345_FULL that come from known 
>> issues:
>>
>> ...cut...
>

