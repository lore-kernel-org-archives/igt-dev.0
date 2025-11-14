Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F0FCE8D76
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 19:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2571310EAF5;
	Fri, 14 Nov 2025 19:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZI3L/1S0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAB710EAF5
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 19:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763150270; x=1794686270;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3yFT6VD6V4X4Bw35+tHSJvW+wu2+Z8+29k2+N3fsdpg=;
 b=ZI3L/1S0PtWrDmJJMXG2QfR6fLKmCj5F4INEJreYZSVy9UmTpIT4Eryb
 44ghQluVPjiGKRRBnzT6e3RWR0UcIhUogjc9as62JKoz0SnII1eIH9nnh
 egNeZHM/KmvAFrWwp3TOgHz3BK5WC9vMwy2qcPOqweMLIuNMPmn9GMhSs
 wFgxeOxmz+XGQi56N8rFJeIKFwXGRoEo2ZzLvMyVN5F0+qbs+0eLWyIzJ
 8402nCV/LAO7eWVKysrF69iHbyIeTxxcQbc/SyGtU9chPcUH5DnAl/A3+
 Htk/tr0RBDHLSdGIOc1MK3Z8RdJBtyp5CQColcjQD9R8tHgTVP2VhdHch Q==;
X-CSE-ConnectionGUID: nYeWFHUqTBaTGxgs09qWiA==
X-CSE-MsgGUID: PjLpI9gdQSOjYVQEGpj8ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65283860"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="65283860"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:57:49 -0800
X-CSE-ConnectionGUID: 0F8BbvQtQCGuMAmlH9xXxQ==
X-CSE-MsgGUID: MEnMAFxsQgqT+9yHBjkmpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="220500399"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:57:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 11:57:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 11:57:48 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 11:57:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gW4ZXZGyEzv7f1wNIx1YRc7fRf1cPZfXmGBsULO4QmZrvZyhatWMUo/Yi1U1iQoItM5wNdbfiFPeZHc8nYbFXXbOoiUysrKMAB0/RYnse4rJknuGPCx9ZxDWeqGsnprSVzwq+4oaqo/vKjxRq1O7WURGCfauoHayfbe2MMqAn+dUBaJMjxHZTv3bMcarAmD8WuBqvH0sCI7ZuNqvduez/zeJONewla2bQByv3LJKvpy3S5/Rfe+gjye61kllxaSjCLMuogJLYUBgPqIZkRNBWhnMXQcngtXE5FwblOL5FzvmptJAyBlp3eZ9O8HiwQF8AF7iwEiI/NkDpmrLtMsskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CBpzmL9/Zyo3zhn/mEMhDsDMDbp8E1dXsOJ2uwGsco=;
 b=qjLvMcRdNKJT8CpIAdQXo5ro8uIy2oFcFPCuXO+vPv7T8NYUPoSTheGDtOBiTWq4uttG4IrQ31+VjWXmL7bG+VxUiZ8ugijUBcq43VQApilFpe4zVLTdWw49ZmwmeVD2uJgVLwhQFZubOYotZKxJgNlQZ2uq5xSK11+PwIzsVT9dX4+kVleLZ0nsYj8rhQBdRlZJYUkXXDQp39v3KmeHaUdWEFoJwaiLofoXtFeQDjDXbkfw1E6jfOIQslMayd/TwhUhjTjJNCG5vW1oxi/uh/VphAehZNfwbhU0+iGlXtCbsaHw1xfWp+NCPjCgRJd1YimHxh7clHwvRKey+n/vEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB9180.namprd11.prod.outlook.com (2603:10b6:208:56e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 19:57:46 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:57:46 +0000
Message-ID: <a0dd45e6-1f01-485a-859f-959fbecb7363@intel.com>
Date: Fri, 14 Nov 2025 20:57:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_sriov_scheduling: Prefer SR-IOV
 admin sysfs accessors
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <lukasz.laguna@intel.com>
References: <20251114190757.2295174-1-marcin.bernatowicz@linux.intel.com>
 <20251114190757.2295174-6-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251114190757.2295174-6-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0223.eurprd08.prod.outlook.com
 (2603:10a6:802:15::32) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d9f951-fda6-47e6-28f4-08de23b814fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZndOb2l1em1JWDl3NW9xV29FamsvTUtTaEJOWkNvaHlBWHlHQ2JyUlRPbW5q?=
 =?utf-8?B?MlNWUnlNMlFwMUVMSDlqV0NjR1AwUXBXVVlueEpWSU9UM0Nqcm5qTnNRYW1u?=
 =?utf-8?B?aXhmYThDUE85ODQySTFKS3hYVzFWNUNwT29aVW1SQ05JN3N6OVNiSzNuRGVq?=
 =?utf-8?B?U1ByL0w1RjBkaGo5VVBWTFZ1WXZjM3BLVFYxZzZNUnBsemxWT24vNWZ4bXZH?=
 =?utf-8?B?OVhWek16MUZqOW1Qa1RHUFN2LzRKMEd1WTNyM1RlZUczWnJ1WnBudFZxNzR6?=
 =?utf-8?B?eG96d2g4NnRnN0ZLNGRGNmpXRUh6Q3FCRkllYWpZTWpwM2JscWErZWJWTSsv?=
 =?utf-8?B?Q0VVcEdKYUZURlBnbENmRGxHai9QdXNUOWFZZHp0bVRCZUdRa1ZKMEdiQ0ZG?=
 =?utf-8?B?WTNyanFkVTBaUzdEYTFsbWdNbWhjNUlEbVdFWFN2eGpLT0V2RmJRT1VuMHYr?=
 =?utf-8?B?OWtMOXAvbnNWUUMzZVVwa25oRkRYUGk0Y3M2VDZiK2hIVnFFeWlUVm5TS1RK?=
 =?utf-8?B?b0JkVmtQN1hEOHBXMlp2eXMzYW9vZS9UdEtSOCtqV2FYaXhrdFpCbVBnczQv?=
 =?utf-8?B?bmtPUFhxTUNRcnJPVDFaT24yQUhxSmNaV3QyZ1ZQbTc0QUlZRG0vWVhvNEtP?=
 =?utf-8?B?cEJNYjlUUlJNOGlKYytTdzJDU0YxbHM3L0gzbUdrRURSMHFPTmtzUjQvN0pm?=
 =?utf-8?B?dFJQekdsZEEweXgycHU4UlEyek9QYXhFNStEc2RCNFFWWXFSbURLbUZDLzlY?=
 =?utf-8?B?a0FTUTNOK1FDK2Y5NVNhWGR3QkdrUWRKQlhhY0VTakFtMDZ3ak5DQ0Z6QlRr?=
 =?utf-8?B?QjBSRjN2aTRKcXJwbXdIam5hR0tJL3lsTXdsU1B2eThjcGoyeTFqQ0VHOUxH?=
 =?utf-8?B?TFc1bGRDbTQyV3JMNHJrTUc5Q3VucDVPQnlqYUZLdjdENU81VUpDTGxXNUpL?=
 =?utf-8?B?dUxzckFMZFE1N2tnT0c1alNOaldMWjF0OFYxMlZ0N1QwYzlNdjhQUzMzRHY3?=
 =?utf-8?B?a0N4ZjV1KzZyNktBZitvdnJxT1Rld1JLZDd5SkZPNnZnUjUyU1ZOVS9ZcG0x?=
 =?utf-8?B?MkFMdnh1U0wrbEhFaHUrWWw3OXg5cGNLYThsa01MRkM2VVEzdHorbnI2c3pW?=
 =?utf-8?B?RGNNWW4yVkxCdThqOGNtb2IwV3ViUkdoZHNDWHg2ZFdnTFp4c1JPREdHNTFv?=
 =?utf-8?B?WnNDOVFmZkZpR3hGMXhNSzZ1OVpNcGNWdkZCQU1wNmwxU05GZndqank3WUds?=
 =?utf-8?B?RGg0OVdJOHBTZ1k3WldLNS9oZTJUc2dqK0lGQUNhZGdETTRDcGNlenFuanlh?=
 =?utf-8?B?eTN2T2l4Q0U4NWd3L05rQXBDNlBBejZyL3RsTjZTQUE0VGFLMGZGdW1WSEFm?=
 =?utf-8?B?NnR6NFdTT1VkMGQvNXFkbkJxRGdFUkRlcjMyVm1MNktEZUlzVWIrN25MWU5G?=
 =?utf-8?B?NGhJRVdXNGtXMEZrbGx0WG1OQWdLSjVpV3JPQWxJUkxZcEpGWDJzTXIxQUhP?=
 =?utf-8?B?V2NHbzhLZFAyWUdoaWJHS2lJcjZzRXY5RjR6QXJLSEd2K3lxVnBWcmRvcUtO?=
 =?utf-8?B?OFN1QThFVzBFWi9vSHZDbmlSczlQazYvVGpJcnlvcGp0RzVqRDR6dG5rMjVx?=
 =?utf-8?B?czA3WnY0Ni9wU0N1QUZKaTBpRzFKU0FTK0lDRWpIdkoxbXduNlRjNjFEVDFJ?=
 =?utf-8?B?cmllb3JDRU1zV05INTg0Q0l0RUlxeFp1ZElGblM3ekFTWk5QUmI5Tm9hNEt3?=
 =?utf-8?B?S2x5R0JzUVRWckVIcUVDRUdHc3BiL1dERlRiTUVxSmlDbmJIU1pFUmlRVWxq?=
 =?utf-8?B?WXVRUElCSHdFRWxqRXVHQzQzSXMzRjhPY2haV2QwaXRNaEhCS0ZiNVdwUVZu?=
 =?utf-8?B?aHlobkQ0OFp6MXpZZlBKTngzSHVtRGVSRmZWRHVFNXozNTBJR3c4QzNGNnl4?=
 =?utf-8?Q?+9MMv74I2UPlhkty927AXTheKk5qz55e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUtRbFFQUzJaYW5GU01kaHVEUERKWkdWWmVSOHdvVnlwcW5jSVZPd3VPKzky?=
 =?utf-8?B?TnNmcGYvaXI0R3pYUURvVnhyclhWcHdYU2wrb3MvYVhSUDNDY0dYeXVIUWs1?=
 =?utf-8?B?WG5WRUFVc1JISkU4Ny9NTWNVcEtxZVBjeWNUbnFFQytnSFQ2Vml5Z04zYzNX?=
 =?utf-8?B?TjgrenhxRFVQOFJLQ0VJNDJvMXBlNGtTVVEwVGtPKzNoRnN1MVIrc2pSUW9U?=
 =?utf-8?B?d3ljZkc1cFFuOEpnUjVGUjFzRXIzdU43TFhRVzdJOW9aLzgzZ1gwM0FCRG1i?=
 =?utf-8?B?QjU4Z1l0ckRyQ0FtVTR3NVFDUDQ4SUE5azYzbWRYeUU4eVpaMzJrN09lUnVF?=
 =?utf-8?B?U09wR3UvbnpZZE41VFFmaG95d0xrVDc5N09QOVVPS1hOQTIwNkdrazdtdjlP?=
 =?utf-8?B?THNzLzAxbHJwM21hT08yQk0zUVU2ZU1vVEFPQzVzWGpaY1h1UlpKd1h6czZj?=
 =?utf-8?B?bFJQRHkwdGJOYXZwekJIQzg2aUFGV3NYRUFSZkh4bm1adEQrTUFZeS8wNjM4?=
 =?utf-8?B?WUdnbW9WTXhtdDZyOGpVVk5WVnVFcEJ6dUdiNXZpU1g0eXp6ZFlNZEdHUVZ5?=
 =?utf-8?B?aVBnTjNOMGF1M20zNldyUEFXY3hPcFJQZCs4SWg0bE5yTHNNN1BLSFJmUW9E?=
 =?utf-8?B?TnBpNnlGZXlNVkRaa003VEhseVVrTzFaa25XbG1EM0lORUx6eTZnV0V4Ukg5?=
 =?utf-8?B?SGFHUStwSFgzb0tuOFR3WkkrbWpRYTRONkJXRktYdmgxemk1anV5S1ZKRmFM?=
 =?utf-8?B?bUF1MjFGUW0wWXp0SUNPbVNyL0FBVHlzYTZWVWZsV1ZjWFNNakYrOE5YeWJw?=
 =?utf-8?B?RTNWb1RPQ3U2cG5CL0xXZFlhbjZLSUdiMUtIaTNHV0dCdHEzRXRBY05tNkNa?=
 =?utf-8?B?UVFzT2xQM1AvdmRzOFppcmV6cjdyV3Z6d0hOQW9hZUNCejJvSS96aXhHQ2Zs?=
 =?utf-8?B?ZFNtcXdKL3lIRy85QXpnK3JJRUl2N1F0SkpIK1BMeTVuWWdyTEJmY2syVS9M?=
 =?utf-8?B?cWt1NEEvZ0VjT3l3VlRuVnBrNCtQa0FmVlZzbkVDVmZxSHIvYzV1YlNMOEY2?=
 =?utf-8?B?SnBvQnNsamZ6d1pjeXk3alFvTGRzV0l5dW9mR0hWVk40NFlURnBLUFVZWlBS?=
 =?utf-8?B?RHFrSFdXQ25vK3Vidm5HdWo1Z0UzZlVVYnlUREEzQTIxaG1qVGx6YU9RSUpY?=
 =?utf-8?B?YmlsZlBPQmRBbjR5bisyVGV6TUJldU1GampRUFl6OFo0L1lBYkJSMzdIOUZQ?=
 =?utf-8?B?TnlOaXdIdmtIcjJVeDV6Z1I3aVJZMTBUeXFsRFpBSDJBNHROLzZwV1czT1pv?=
 =?utf-8?B?eW8rVlZHMUFsd1ZJT3pkVVVQaStpMGthWXhCdUdHRHNQNWNLT3p4VXROUkZJ?=
 =?utf-8?B?d2crWjZJSTNNVEdVWm5VOTduVmhEZ1c1TE02MjB2TXZVQjU4c0VOa3pTSHBK?=
 =?utf-8?B?TUJMZmF2VGtqbW1CNlF2UWhOVWVuSFRod242TDJXVFFrZXNURmJKV2JhOEZC?=
 =?utf-8?B?SmpFVlBXbHZLRmwyc3BwLzJSai8xU2tLT1k4d2VvMWRIRUcyOGtqUzZTcXIw?=
 =?utf-8?B?K1haV2xnTFpBTkR0S3BuUGtNVVlIeWhreGV1bDVBQjJTOWRmblNYN2pZMVBB?=
 =?utf-8?B?WGdOdHk5MmJXVmptYUNYdXdaMUNtQmw1bWRoWTgzMkZKZTVsQ0pMRXJ2bDlw?=
 =?utf-8?B?elhTd2YxU2NYVzVTdnRacUhGQVlXak1KTzJpeGdXeWcxYWN4K3ZrOEkzMXlU?=
 =?utf-8?B?dGhDOWliajNNWGk1NGMrbHVET2o5S2wzSHhYaTlxT3hIRFl4VWk2OCtScE5n?=
 =?utf-8?B?OVA1d25MWU9CU1B6Q0tRUWpxdWlhVEJXdmNINHk5SE1CSi9sUDFKVWVjSktl?=
 =?utf-8?B?dnlaa0JRRGtUVFFQUkV4N0twY2hSYzNIWFA2eHhTK2N3QlV5ZmhUdFRZbFRq?=
 =?utf-8?B?MnNGWUJuUXBXUFIzNzJQVVAzamQ2Q2dLa0ZEelVQRHJVVGRwNEllZldhanNI?=
 =?utf-8?B?bW1jeWZtMTBnMTVpY2ExL2Q5bzdGZmprdnVPWkt3bnpIbFZyTzRBL1JVOVZs?=
 =?utf-8?B?N0QrUDVUN0NoclpwMTNtSHpqKy9XUUJYalhBZmFOUUswRDB5ZzVGckF5K0xr?=
 =?utf-8?B?aUVDL0cyNEpKKytQNTl4ODNpVnF0czkxczJmUFZYL1liOERnTTRIaVpHNXdo?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d9f951-fda6-47e6-28f4-08de23b814fa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:57:46.8131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1GQm3SWWNlosR3tD1AZPQhTzRAGD99RgomB+KejZlPG8ZlHhY5ipvbXq6QhS6ji4kbMUMs7KnHXWoIaTtkFiJXgtdP102vZ/Ns8B5WIRnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9180
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



On 11/14/2025 8:07 PM, Marcin Bernatowicz wrote:
> Use SR-IOV admin bulk setters for scheduling parameters when present,
> falling back to debugfs attributes.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  tests/intel/xe_sriov_scheduling.c | 55 ++++++++++++++++++++-----------
>  1 file changed, 36 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 3a0c0d438..1e5e19334 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -9,6 +9,7 @@
>  #include "xe_drm.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_spin.h"
> +#include "xe/xe_sriov_admin.h"
>  #include "xe/xe_sriov_provisioning.h"
>  
>  /**
> @@ -374,27 +375,43 @@ struct vf_sched_params {
>  static int __set_vfs_scheduling_params(int pf_fd, int num_vfs,
>  				       const struct vf_sched_params *p)
>  {
> -	unsigned int gt;
> -	int vf, ret;
> -
> -	xe_for_each_gt(pf_fd, gt) {
> -		for (vf = 0; vf <= num_vfs; ++vf) {
> -			ret = __xe_sriov_set_exec_quantum_ms(pf_fd, vf, gt,
> -							     p->exec_quantum_ms);
> -			if (igt_warn_on_f(ret,
> -					  "Failed to set exec_quantum_ms=%u (VF%d GT%u): %d\n",
> -					  p->exec_quantum_ms, vf, gt, ret))
> -				return ret;
> -
> -			ret = __xe_sriov_set_preempt_timeout_us(pf_fd, vf, gt,
> -								p->preempt_timeout_us);
> -			if (igt_warn_on_f(ret,
> -					  "Failed to set preempt_timeout_us=%u (VF%d GT%u): %d\n",
> -					  p->preempt_timeout_us, vf, gt, ret))
> -				return ret;
> +	int ret = 0;
> +
> +	if (xe_sriov_admin_is_present(pf_fd)) {

is there any expectation / requirement to run latest IGT suite on 
kernel older than 6.19 ? otherwise this will be always true


> +		ret = __xe_sriov_bulk_set_exec_quantum_ms(pf_fd, p->exec_quantum_ms);
> +		if (igt_warn_on_f(ret,
> +				  "Failed to bulk set exec quantum=%u: %d\n",
> +				  p->exec_quantum_ms, ret))
> +			return ret;
> +
> +		ret = __xe_sriov_bulk_set_preempt_timeout_us(pf_fd, p->preempt_timeout_us);
> +		if (igt_warn_on_f(ret,
> +				  "Failed to bulk set preempt timeout=%u: %d\n",
> +				  p->preempt_timeout_us, ret))
> +			return ret;
> +	} else {
> +		unsigned int gt;
> +
> +		xe_for_each_gt(pf_fd, gt) {
> +			for (int vf = 0; vf <= num_vfs; ++vf) {
> +				ret = __xe_sriov_set_exec_quantum_ms(pf_fd, vf, gt,
> +								     p->exec_quantum_ms);
> +				if (igt_warn_on_f(ret,
> +						  "Failed to set exec quantum=%u (VF%d GT%u): %d\n",
> +						  p->exec_quantum_ms, vf, gt, ret))
> +					return ret;
> +
> +				ret = __xe_sriov_set_preempt_timeout_us(pf_fd, vf, gt,
> +									p->preempt_timeout_us);
> +				if (igt_warn_on_f(ret,
> +						  "Failed to set preempt timeout=%u (VF%d GT%u): %d\n",
> +						  p->preempt_timeout_us, vf, gt, ret))
> +					return ret;
> +			}
>  		}
>  	}
> -	return 0;
> +
> +	return ret;
>  }
>  
>  static void set_vfs_scheduling_params(int pf_fd, int num_vfs,

