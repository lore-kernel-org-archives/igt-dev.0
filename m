Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B17C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jul 2024 04:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8FE10E566;
	Tue, 16 Jul 2024 04:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIFdICvR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A1B10E566
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jul 2024 04:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721103596; x=1752639596;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zW214HMtwgvOxcyLtTYqPCVYVU4Oe1AwE/vWcMyBb1o=;
 b=JIFdICvR+lf9pqyovAx0weFOvnTt6xPxNTNWcS5s52VpRUUGNQgFjUkb
 d6hmVbHXvi4K3lqjtGQ+kQkJWooy/fqTFiY6kmW7C/ebAs5hqVaf1ftoQ
 os4QgOtmTs8U7MjZJR72+HyP3UHLpkkuHLmA+OjWAkEkGtlusTntZk8b2
 oMqclALqJZjX7gLjcQm7664DZLHSsD/FkWGmoKR96RgYMIf4Pro9AbsMp
 mM97Jp8BZw+gmOht/ty61D4p8De+vP6TC1575eZhvLQjJ7bv7Z3LY7Tva
 aPxOtlLxmKSxbSp57gdi0LIXmuk7BpEQyqfRlCKf6lUX+arYwxzjFzp1j Q==;
X-CSE-ConnectionGUID: GhgsupXFSkO57u5jcn8xFA==
X-CSE-MsgGUID: 226uj+F0QNi96XfPE3dWng==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18385657"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18385657"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 21:19:55 -0700
X-CSE-ConnectionGUID: fThZ/N6WTNSdT+cOCCV/CA==
X-CSE-MsgGUID: azjC7IJ2TlSHdBzkiPXMRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="80936084"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 21:19:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 21:19:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 21:19:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 21:19:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOfWa2JS9bAABrPySlG+Fh8mjQfFCK6AYwe2Ze/5IiizmXEa2UWsIucsHcqF3VGkKKaPbM/a7l3NwdN0r4UfPzqCTsT1ECk9I+WVgSYOB6ljv4ZB+QrkmaY34zjQYUGg/lqiveCgwBhOg3WKZJcMDlhv7XxDf+QVMXFr59pEJsl8EmQuO7Kt4x+HYr+pbyMjVrFvNWGCOeKiZnaheHWqMh84wkeWDnk534tbt0WCTHAlSsj5UP5gE0tfK3LiNEGLE89F5cZlY62thwy3ez6nPnhBWkpHJmWhADald2ce2JjGQgRC6iTuKM5c0MZjRZ9hudUPvhujDG3WNYND7AH/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1nLPmreuxHT4aP77Qts92GX4ta8VPsGkY/mL36Vscs=;
 b=OJEquLFX6RmeNlDoPurUypYQ+O+WypuyFK1kCCDtmzlH8BVEQhU0Pu+bG1+7Q9Brv4KeyhedsVoJGtaT8dvvosF+8FPJGIJRpxiXP8QGeOQ0Tpgp3shsMrqDpsBkEZU/QQlc1pvdVdE0FmHNUS+7/6WvVOPWdhbwsua9dbkGtXfpTlUIkqDMydO7aXFRV6kn99/14ZZdpOmDe0cl7HzQ3QS1QKCHs/MEPHkmzOnR1J3jLp0a/ivic+2n/2faF2BQuEA8i+to7FHYeGYWdqOOhp8L6YUgw3DmuTyk3xCmOn7cd7poLu/J5fU61EjbH7Y5TBVFRsB5EMeUz59f44B4GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB8058.namprd11.prod.outlook.com (2603:10b6:510:24d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.21; Tue, 16 Jul
 2024 04:19:46 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 04:19:46 +0000
Message-ID: <26377db6-562b-4db2-8e29-8eac4db4ed67@intel.com>
Date: Tue, 16 Jul 2024 09:49:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/5] tests/kms_plane_scaling: Update the multi plane
 scaling function arguments
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
 <20240715154628.583682-3-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240715154628.583682-3-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::20) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e09068a-4c16-4205-0ab1-08dca54e868f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nll3MlJEM1hUc0FrVDBRYTh6Qit4b0JkS0Vxb2U0TWRkdldzbXNlck9CaVk2?=
 =?utf-8?B?UDNNU3FHYUp3ZXZOOWc1OEEyRGx3MDFSVUVRaXIrM3RpMGhkemRrdUs1bDQ3?=
 =?utf-8?B?VXE3TmxNOElBQTlxK2FRcFBPbmVPSmVVMjJVcCs1NkNqczd2QjdEc2h2T2xl?=
 =?utf-8?B?T3I2WDRYWWNJcittVzZNNitvTytpYlZSZHl2OFgvamJKZHl6dGIvcnBCckNN?=
 =?utf-8?B?ZG10akMxNml5N3BoR3dwbXQ2emM0UXN5N0ZNNVVEaFFRUEhWVCt3d3psUjNY?=
 =?utf-8?B?TXNyRFVicDAwUE1kWVZycDJDZ3MzbkZwYjF1MndWWUpIV0ZEVDE2NXExMElS?=
 =?utf-8?B?b2M1OXA0dHFGaTBMU21NVk16OGFIN2V1US85ZEtWaFZQWGdqb0tZR2orWkNI?=
 =?utf-8?B?T0RMekF5ZUsyUnF1RTBtQmdCdG96dXBIaFBYL0YrT01JdXJqQmt2cUZQa3BG?=
 =?utf-8?B?dStvK3VkNE1tNHFvYjYyTlljQ3RCWkI2K01RekN1L08yVXQ5OUtiRjBISkRy?=
 =?utf-8?B?dXI2dTdPQlNNVTJ2aTcrRjFDR09lNlF6akRtb29QQko2SjFyRk5lR1NvYVNO?=
 =?utf-8?B?OXZOeUZjTmt3UUk1YlF6Y1ZiQmtsc0xyTDNLSzJpV3ZHbVMwaGFORUxlQkVn?=
 =?utf-8?B?NVNCcU4xNjJTRHZIT2xRY2tKR0UwcGhRTHVCTDQ5WU5wVWtoUGZWVGxCUjdD?=
 =?utf-8?B?ZExIYVhyL05LM3duSmxsY1hJODRTaXNRLyt0aGZTTzA1MnNobDJNRERxYWQ0?=
 =?utf-8?B?c1JESTRZS0liVzRxWDBjdXkyVExGK244ajk4RkhrSUVPRmxXTnJnM1E5WkRU?=
 =?utf-8?B?bjAvUW55Q01RL0dpQXpMUDRHVW81RWpCeVBha1g1K0c4N0p4S0ltVHBKdVQ1?=
 =?utf-8?B?RFptYjhHYWFlNDZSY09OT2JjZ0hXRGw4UGlxeFJvcDlTMWN5bFduSXJMcDQv?=
 =?utf-8?B?T284L3RFT2I1djVtSXZkZEloMUxIYmgrRk1JNGRiL1E3ajRnTFNpWjVCY0VU?=
 =?utf-8?B?a3FQaEk3OTVZckFyd3pOVjIvMEN2bFp3WUJadFk2dUY4MjgrSHNxckJzdVpq?=
 =?utf-8?B?MnVHT3F4UlNZaXY2K1VwNlJ4SEh2L3B4U2h3cktFUWcvWWI0am92T09GVVVr?=
 =?utf-8?B?Q1AzR0haTDZqR3hIblRKaTJocWZvS0hjMHJUMEdYMTdCYWJyZVlTNGV4MUF6?=
 =?utf-8?B?WVBWSUFzSUxvdXI1WVk0L2xKd0d3ZkRzRzJhOTlaK0tWUTRQM3JXYjhSbTV0?=
 =?utf-8?B?TzZUd1R5ZTRtME9aeVFRaTBFR1ZQWFhGZ2ZncGxJVlJ3M090dnE5blRaRGRB?=
 =?utf-8?B?Y2xYcExQWElVaXNLUWthM1k3amNxeEI5b0xuTjZ1bDQxQzMyU0FzVFI5RXVV?=
 =?utf-8?B?K0NyemxrK3BFMWwzZHhlWmptOFloc3hHelA3OU5hdDBmOUlzWTVvM1BHd3l3?=
 =?utf-8?B?M0JIOFlOU1kydmxXSXBrS0RqTmRTc0hUMzRJQVdLekdBc21BNGIwL3RMMzNS?=
 =?utf-8?B?L0dyenlTZXRKOEVBMktGMUwyK3JmOVFybWszeW9VakdzaG9mNXEzWHRTLzFI?=
 =?utf-8?B?SXRJSkprcCtDd1FtUk1laG1oWUpPMXM1Q05iYWgvdCtrcTliT3gwcmtKbnAy?=
 =?utf-8?B?V3FVL3VEdC93TExYb3liU3NGVGg3WW9TLzk1TjBaT3hnakZMcWh0WmVwdVo1?=
 =?utf-8?B?dnYxK1VjVEhacjd0Unk3a20xNXg0UDdIWHhWNzFrdlBad0tsZUtYclBmeE5V?=
 =?utf-8?B?U0RIY2svRjhsNHNLQVRMYS96QlNQUkRLNW56ZVNTZDBZekd4YjhqQlQ0a2hu?=
 =?utf-8?B?WkVrWmlCZ20vb3A3TkEwQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3p6SnZwMEZlYkloSUhVWWtmYVM1elRxZzhaZXJZZXM2ZFA5T0VvWm14dTkz?=
 =?utf-8?B?a1N5UndYUkFWbXg4c0tpYzVacTZhRVVHdkYramRzeWtQa1VKVHVaVW96WWQy?=
 =?utf-8?B?cE9SZ1JwVGhGTmxvbE10NjEvVll5WlgveDBMcWN0SXgvSkkveXJOVlJ4NGVW?=
 =?utf-8?B?NWtVWlhhd0gyejlrR1R1eHdPemVlQ01Rd0pkZUpiVXBZL1gvZC9HM2hlWVdi?=
 =?utf-8?B?cnZzTUtOaTdOa3V3Ui9ubjhVUkR6WnpMaHlneVhHcC85Y3dwK3JHRWN4NHVo?=
 =?utf-8?B?cUwxZ25DUFlERzBsb2RqQlM5OGJMN1pkMlExKzhwc09Hcm1IeUY2VlZhQ0dP?=
 =?utf-8?B?M2Z6a29Ib0owc29WdThibUUwZVZ1K3FvK0U5QmEwSDRoeFNkQkI0ZFgxYjZO?=
 =?utf-8?B?Tjc0YkU4aFo5OE1wQkc1c25vYjh1ZXN5MWQraDdVVE5INEJmMFI4ZGJxYUU4?=
 =?utf-8?B?K1lTR0p6aTFoVmFyYStrLzBxVGo0K3QxN1JuYWZmei94VlhvYXdXVEZhS1lj?=
 =?utf-8?B?eEIrd2s0YW1DaFplbjBkQXVrOEFoOG9iVVBLTnR2cG91cVlFbGF5aitwd25u?=
 =?utf-8?B?MnNwRjNOMzhkcHFMSVBsSXo3YXpqWnZiNVM5Zzdna05aNE1PRXpJMFJsa0RN?=
 =?utf-8?B?VWc2bFdHOC8zZzV4a21ZUmtLVnFYWVNjOTBXRzF5VDRjQzcwZVlSWlZFeDkw?=
 =?utf-8?B?TWd2YWZUMXdQZzJHUk5sVmFMWUJrOHdIZWxBSTdzNU4ybVVuekl1bGgzSm84?=
 =?utf-8?B?U3NUZkdEcDJhYXpVd1d6MEFsNk5WWDBQdTQvZXQ1dDZEOWZlNXVvL0Z6cEVz?=
 =?utf-8?B?MFB3Vk9uK2RWZWg0bStxdzZ1d0pQdXpWQnhYRjdObUtMM08zOS9IUEpCaGxK?=
 =?utf-8?B?ZkFTYnZra1cyZFZXL2dpUmdVZlF5VUo0NXZnYytZajF4bDlsWmNDZTZRZWh1?=
 =?utf-8?B?R29yY1E3ZDFQMDIvOElva0U3MmlrUjdDbVV4anR5UnM0MEZyZVp1bHR1S2oz?=
 =?utf-8?B?VmEza0ZmWUdGaVRPUVFKQW9yaDN3OEphNDd2V0pqRzJGWWl6TkdIdmlMbXRy?=
 =?utf-8?B?UGxPd0cyRlZsSlpRZ1NUYWlwdFppcGFqQ25iOUVxcXJON3FzU0ZZOEx3TG1t?=
 =?utf-8?B?VWlQbmdOWXI2eEZ0RmpKNmN2cjY5dllpZm4rbHdpZmF0NDhTRG9GYnlQaTdR?=
 =?utf-8?B?b2Z4d1pYWG1tWGgxSjdrUXRRVGJlaWhGY3BSbWJKNWFQVlJQNjlpZlV3RWNv?=
 =?utf-8?B?clowcUdCVkhlS0o2SGV5bzBuMG5qdGJPeDN3RmM4aUNhYk1oVlVZTTJkVzBv?=
 =?utf-8?B?ZWVKUHU4T1M5UkNsdVg4SktaSUNCcHNQN3FWdEpGSmhaWnl2UU1sUGxHd203?=
 =?utf-8?B?a1RFMWdpOUlMRDJTY0gwQVN1YmtwMk54dE1IWFhLc29oL2w1Mnpaa09jdExN?=
 =?utf-8?B?eXNJd2pBeFJ5cnFZMnBYaHhveWZTUXJOTVFSd3RGc0RIeWxSSUdQTnpabGVw?=
 =?utf-8?B?ZWpUMFN4eEZGSStiY1JWNXZIQkd6cVJLUVpiMXhWOWdxcDl1dTVTckpaNkFT?=
 =?utf-8?B?TmZlTmVJLzk3Ymdya3BBVzYvbWNqNm5BN1QwY0Z4Z1dHVGpiSDArUjFBRm02?=
 =?utf-8?B?TUdGVE9lakdyYjNFVXZzQklJZ0pxU1ZRazRDMnJLZ2hzLzN6ekRWY0FxSlRX?=
 =?utf-8?B?OWV2Z1ZaNmJJVXo2WG8vMUVucVQ5N3hHY3Njb08zSmYzeC81NXN0OE5lcVRW?=
 =?utf-8?B?QmlLYkpZOUJLSFljb2VRNWdZOFl3aThDS1RaRlpCRjJqVG5uT0Nxb3dkTzFR?=
 =?utf-8?B?M24vOUlNUmFwb2NvK3BrT0xzWWVZVEpnSTQwbVpKUHp6VGwyeGcwNmwxeEN6?=
 =?utf-8?B?cW0rbGtReUxBN3dkODdQeGNVZDY3bUU0SzhwVVg2Q3dSaHE5YUtTM21zUzlW?=
 =?utf-8?B?cHpuMUJOWURVMVZNMWNOcCt1aVlaV1RPckRQWEtpdW03WG9vY0JralF6Z0g5?=
 =?utf-8?B?UUVJZmhZV1o4TWhDV2NMVGEva1NORkhnU2NkaHBFaEdDNFpjejV5Zm03S1E2?=
 =?utf-8?B?RVEyamRMY0h4VXBIbUZnK29FYWQ1OFFLZTA4VFlKWTVFSGE4c2pRdnFqWmNH?=
 =?utf-8?B?N0JBejI3U0lleXZycUkzNXdjZStGb3pwSkQxb0w5VDBYaXJIanA4QXZNZnhO?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e09068a-4c16-4205-0ab1-08dca54e868f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 04:19:46.7088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKW94ZdDMMujTkYvlPr4QAaQ1H3ubLAH5RxayY6kORLT5T22xeTBRqSCG8pLT0rjipJcjuFrcfA8O25mx4wSIhEu0LcknSekaY9zshMmZmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8058
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



On 7/15/2024 9:16 PM, Naladala Ramanaidu wrote:
> Update the helper test_planes_scaling_combo to use a scaling_factor
> for plane1 and plane2 instead of explicit width and height parameters.
> This change simplifies the function interfaces and allows for testing
> scenarios, where we need to recalculate the width and height based on
> the display mode. Adjusted all function calls to match new argument
> order.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

In couple of functions, arguments need to align with the open parenthesis.

With the above styling issue fixed, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> ---
>   tests/kms_plane_scaling.c | 43 +++++++++++++++++++++++----------------
>   1 file changed, 26 insertions(+), 17 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index f5efd13ef..0048e6e51 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -853,17 +853,23 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
>   }
>   
>   static void
> -__test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
> -			    enum pipe pipe, igt_output_t *output,
> -			    igt_plane_t *p1, igt_plane_t *p2,
> -			    struct igt_fb *fb1, struct igt_fb *fb2,
> -			    enum scaler_combo_test_type test_type)
> +__test_planes_scaling_combo(data_t *d, double sf_plane1,
> +		double sf_plane2,
> +		enum pipe pipe, igt_output_t *output,
> +		igt_plane_t *p1, igt_plane_t *p2,
> +		struct igt_fb *fb1, struct igt_fb *fb2,
> +		enum scaler_combo_test_type test_type)
>   {
>   	igt_display_t *display = &d->display;
>   	drmModeModeInfo *mode;
>   	int ret;
> +	int w1, h1, w2, h2;
>   
>   	mode = igt_output_get_mode(output);
> +	w1 = get_width(mode, sf_plane1);
> +	h1 = get_height(mode, sf_plane1);
> +	w2 = get_width(mode, sf_plane2);
> +	h2 = get_height(mode, sf_plane2);
>   
>   	igt_plane_set_fb(p1, fb1);
>   	igt_plane_set_fb(p2, fb2);
> @@ -908,18 +914,24 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
>   }
>   
>   static void
> -test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
> -			  enum pipe pipe, igt_output_t *output,
> -			  enum scaler_combo_test_type test_type)
> +test_planes_scaling_combo(data_t *d, double sf_plane1,
> +		double sf_plane2,
> +		enum pipe pipe, igt_output_t *output,
> +		enum scaler_combo_test_type test_type)
>   {
>   	igt_display_t *display = &d->display;
>   	drmModeModeInfo *mode;
>   	int n_planes;
> +	int w1, h1, w2, h2;
>   
>   	cleanup_crtc(d);
>   
>   	igt_output_set_pipe(output, pipe);
>   	mode = igt_output_get_mode(output);
> +	w1 = get_width(mode, sf_plane1);
> +	h1 = get_height(mode, sf_plane1);
> +	w2 = get_width(mode, sf_plane2);
> +	h2 = get_height(mode, sf_plane2);
>   
>   	n_planes = display->pipes[pipe].n_planes;
>   	igt_require(n_planes >= 2);
> @@ -956,10 +968,10 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>   		if (p1->type == DRM_PLANE_TYPE_CURSOR || p2->type == DRM_PLANE_TYPE_CURSOR)
>   				continue;
>   
> -		__test_planes_scaling_combo(d, w1, h1, w2, h2,
> -					    pipe, output, p1, p2,
> -					    &d->fb[1], &d->fb[2],
> -					    test_type);
> +		__test_planes_scaling_combo(d, sf_plane1, sf_plane2,
> +				pipe, output, p1, p2,
> +				&d->fb[1], &d->fb[2],
> +				test_type);
>   	}
>   
>   	cleanup_fbs(d);
> @@ -1450,13 +1462,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -						drmModeModeInfo *mode = igt_output_get_mode(output);
>   
>   						test_planes_scaling_combo(&data,
> -							get_width(mode, scaler_with_2_planes_tests[index].sf_plane1),
> -							get_height(mode, scaler_with_2_planes_tests[index].sf_plane1),
> -							get_width(mode, scaler_with_2_planes_tests[index].sf_plane2),
> -							get_height(mode, scaler_with_2_planes_tests[index].sf_plane2),
> +							scaler_with_2_planes_tests[index].sf_plane1,
> +							scaler_with_2_planes_tests[index].sf_plane2,
>   							pipe, output, scaler_with_2_planes_tests[index].test_type);
>   					}
>   					break;
