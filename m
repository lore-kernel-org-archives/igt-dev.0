Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB9DC25B78
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 04:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9D910FF38;
	Tue, 28 May 2024 04:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtKUUw/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAE810FF38
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 04:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716871230; x=1748407230;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vvTQt/JIVNAIW+OnwTo81kIH1xJBSqYB2bDI3BURiEQ=;
 b=MtKUUw/dSUrVqnnvjTNstfAw4BTOK1edJ2qb1P+pmdSKT9Cnk1phA7Qc
 9621REjrCqJ3zKC8L+03xwagjHivRn7+NXW9pmvrkjhioYDfdY1VneNVR
 pZs8O6kQRkcRRZABi7kMIL1iCPl+PbUL5Tye+HOblufnmpsD/1LWc1PJJ
 Ow85PxkQHSb4d6dK2eoXYHH5Ni8Qc8hKTFXLN9O1MmtpgbdBHtgq89mR9
 mWNA7XefIGYU1h+vL6L/vecWSPMxVwmjNuV4zTaYHeSxESejkE3wza7w3
 IXdA9tj4k5Fqcw7u40OzC10cQJNOhEnmcebPWpc5Ddl00MkQnFGKEN9g/ g==;
X-CSE-ConnectionGUID: YHA7aKHtRFKcuFjKnDI9tA==
X-CSE-MsgGUID: swZJmKkHQLOhil6M9ccYUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13020657"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="13020657"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 21:40:28 -0700
X-CSE-ConnectionGUID: lk8Gwj21SU6zt1PzrKCpOQ==
X-CSE-MsgGUID: w1Jgn0kOTw6/DrbTaIVIfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="39334021"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 May 2024 21:40:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 21:40:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 27 May 2024 21:40:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 May 2024 21:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7Es8mMc1tmhYW8bE49yO6/T3kl8mt1ZQuc9cj9TDqqIB73Q9ZVJBmlG2XIi0th1+EYTmoy/9UW4KgFZ3nF3GTx1tFtp0lfw6WtAdXte0da9frf1GXRhGXWt/EAKfZzQeCeTWI4z0osL6uGxgIz8Yv9vEPEV/dqjnbQrfAkoFgnwpzI/tZROJr9WMwVE9/6UdcOJ6o7K2Y0yzlUQI3qvrPKHRZtH30oY1YJyBbEChOiHWVX6J/Ao9C0/HTq0oZbASIX+7KPHJ1HLZXCH7KtssYGhqrZw02eTYRBH+rWaML7V5pzXhlBnlME0wHYwRH+GaQV7ytDM9wSmSntpKUZNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NimZQSBsDPuBclr1NhSr1nen7fhW5jTQasUaw3IkWdg=;
 b=ihkxAgtM2rGu+eFqAxMFqtmi633ESqu4oEPt+gnzmGK5bIqlvOzQNqRlL9graxnTerzD8ngg8VX5xU11lxojmueki+nhrVFPmNZrgcClV1Q7D7Df5S86zS8CyTZ5B50CjS7ysDi/5eRrgy1GjNRg2Aipau0kNDzj/X2cVlqO3WPvBvW5tYei3pPG+AipQGtMrmb7PspVnEdUMwslYnKcYQivv65KtP+/eMSWQsZzPhy+FV4g3Z84xTCFTDUCzYCZFjEt7tLJLvENG4x9xg7/A0xYhJDNoSUg5vH9EVdi1P9fMDkyPClzZNYlwJD3xD91uoM0U0Xcbs+MavVsZ8A1jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ0PR11MB6813.namprd11.prod.outlook.com (2603:10b6:a03:47f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.27; Tue, 28 May 2024 04:40:25 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%5]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 04:40:25 +0000
Message-ID: <afa7bed9-5b84-482e-9c3f-56f726717c8b@intel.com>
Date: Tue, 28 May 2024 10:10:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_dc: Add a new test to validate
 the deep sleep state during extended vblank
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <suraj.kandpal@intel.com>
References: <20240527173948.535894-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240527173948.535894-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::11) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ0PR11MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 84896f15-630c-49f4-b494-08dc7ed04ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmtYVk5FVHU2ekZxZ21Ba25QTXUyNHB5QmpFNkpJQlNCRzdrazBQVy9JczVP?=
 =?utf-8?B?dnN2UFhHVTBJS1ZjbEZuNng0dFdtbnFyWFdrTXdVc1V1UGZtRVdCNHgvMGlU?=
 =?utf-8?B?aFRmWFhHWEQwdlpjSU1GTGk1OS9ZTGV5NnN4QjVUTU5RR0ZkUTdnSTF6akRV?=
 =?utf-8?B?Nm5wMWRCalFpaTR6dlpsRy92ZmxTeGdpOHJEVDdPd0svMlpWVkRjdnNIRDN6?=
 =?utf-8?B?SGdHRTl3L1l0VTlBSGsvQXpOMG9TeVJyb29qWkJjRFZoZFBNSmE2MVA4R1g2?=
 =?utf-8?B?RGMzYUtFeVpyditoM1JsdSs0OWNQamUvUnZsa09WOG9ETjQ3SDNNclhiaHNk?=
 =?utf-8?B?RHZVNjJGYU5WL2VNMnRLQ2M1TzdOQUtTYXFuK3hRSE9LNllhVWlmbmozUXJZ?=
 =?utf-8?B?Q1l5OXBOV3MwV1JMb2lXenp3M1RNRENpNjBYUEFzOTFRVDU3aDlBT3k5MmNs?=
 =?utf-8?B?V2xhdUU1Tm5zNkl2eGptQk5pK3htV2pRTEEwTEpMUmtzcG90d2Rrc20rK0F1?=
 =?utf-8?B?ejJXWVViaDllVVhrNzI4blF5cEU5Y3c1Q0F4SXpXQjhCZkRHOUhxVEpHTURE?=
 =?utf-8?B?dzJHMTZWWDJFeXJTMFNhanduZ3ZHRHA1dlNMa2lvSGJUUEc5c0ZtUk1vWFUw?=
 =?utf-8?B?VmMwU0J6OC9NMUFiR0ZpUGNPNzdHSXRKeUk1anVGRlBFTUFmY05JUEFCaGov?=
 =?utf-8?B?UzVaVkE2a0ZuZCtCNGppOFpqaWVmRGg2a3UvdTV3V29BV0o2MENpcUVvU2FS?=
 =?utf-8?B?c09zL3h6NjlRaXdxUW1oVGNNVWtSRm1DOWgwRWx0amRMdFI4ckc3d1NQMzhE?=
 =?utf-8?B?L003VERwYVF6RExvYURlT203bzFUMTNiQTQxSnR5bTN4RkV2NHVrdWlib0dG?=
 =?utf-8?B?NGo5Q2wzQnNiTXhvUXNyQ0xyVEduVUdJSlgza2N2aWZxV0V5am1sRkF3QzhC?=
 =?utf-8?B?aFhBQVVXVlRWQm9mWE91dE9hOFZYZ2FPcUNUYTVuRHVSU1ZWU053S2hsV2Ri?=
 =?utf-8?B?VCtsbDd2TVlKaTdlbzRCVW9EOGsvcjh5TFNwbzhuNFZSMFVDMTZ2SmZXbWpC?=
 =?utf-8?B?OE1XaDQ3d2haeHFuc01VblFaNXl5ZHB5V3JDdlF0WXVIbVRhRGNMaVNVeEZs?=
 =?utf-8?B?RGJiZXVkbnRYd3lJOXE0ck5LZFl3dmQ0c29iTllPd0x0MTVyYXEwNGdnRzlj?=
 =?utf-8?B?WGxxQ0dmcVJwTHFvazFHYUs3L0NwWTlqdGVjVVRYTFFtaWlhN2IzOXpXZXJH?=
 =?utf-8?B?VkQ0NkxMOXo2NVhyaVFKWXJhbWJoMTF1TkhZSUVSd2hXdW96REhCS04vWFho?=
 =?utf-8?B?VXQ5U1BoSk8yVFRrdkVRMUNEa2VMOUdlNEsvc0FSM0lrSTl0YU5NTVdiU0h5?=
 =?utf-8?B?Y0o5SkJlQVlwalBLdFhwWU5UMVlUeWRTeFhLQ3ZDM21lcXUzdVVmNTZJN2l3?=
 =?utf-8?B?UGREVEZ0UkM2VXc1VktsSFM4TWZQajlqSTdpQWQ3ZWNLQUgrTGlVTWs1a3Nn?=
 =?utf-8?B?eEx3by9tNW5Hb1czTExrZzZQYnF5ZExjZ0pHVEg3K3JTTXpzYTcyNy82RG0r?=
 =?utf-8?B?UjBDZDRzanNRcHVYSnQ0cTFUSWdTOWVMdTZrckU2NUVIV1RZK0tRYXhQQmdz?=
 =?utf-8?B?T0RSbDhJMlJKMzR5SDFtS25oWVdKR053d285bXZEQVBrUDJNdUN0QlVuWDlB?=
 =?utf-8?B?QTVBVUFkZEtKWkl3UVdVdFBYckV6K3FZY0RUcFBWd3ErQWQ0c2wzUUtRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0cxd2U4R0dycXFIYnRRUXloOG0waWtLUGgreGRuZHAwT3UvN3orNXVHR1Nk?=
 =?utf-8?B?M3gwVXYxMVdkaWp6T0JubEMzaHAybUhJOVdYQXprdENWcVlKTDFiTC9VSnkv?=
 =?utf-8?B?dEYvdFFnSzZJeWpxSEFucUprNHdxcWorSHZoWGxBcGFrT2ZlV0ZkMGFxSWVI?=
 =?utf-8?B?YURLQU1qSitreS9GdHl4c2R5a0ZJeUdFZCtsUmtDM09LZnlOY2N3VjZPazNU?=
 =?utf-8?B?YTl1S3Zuc0NjdTcvUGxPTDJGRGs5ZzFhVGE5a2NaRVgxSHhnRnh1QlFNQWxM?=
 =?utf-8?B?NmRvcUZnYUR4TDZ2R090WFJkNCtTYVhZdkVEcXVhNGl4OENCRVFiWCsvYzVv?=
 =?utf-8?B?eVEwdVJEQUR6c3k5bXAzUXc4OUQzLzZVODZUR1JGNjcraDRiL1pzN25vNS9E?=
 =?utf-8?B?dWV3VlpZTnN0VXBlZWNQOFR0eW13WGV3U3g4T3RMSTRrcVJRamlKclBacy80?=
 =?utf-8?B?UTRnSmdnM0JmRnRMcEFpNmFuVmwzMVAxVUh1VnhTOGRSSU5GbnhDcm55MjNr?=
 =?utf-8?B?RFRHdUpZMjhJdURoYTlxanpyNmE2VGNBNWxHQ1RsZ1dJbUlXTXNNQmhmWWZv?=
 =?utf-8?B?VmM3Z1poSVBSRUF4RUlYM2FDS3JZK1E2NExtNzBpcUFuOERiUGhVSjNxakNl?=
 =?utf-8?B?eTAzQXAwUnBJbm4vMlhqYXRwOGUxdHY5VWtqV2ZXQzdmMEFCVGY5MFk4Wlk5?=
 =?utf-8?B?NjlXcTU1NFBuMnhxQXhLTjR1QjVTTThlQ1NUMU9iMiswUjZtQlAyZzcvUkRz?=
 =?utf-8?B?WWhMV0loSTFDSnBudU5NVjArVFRFWDZBd0Y4bkdBN2o2YmkxTGJ1VmRNeWJv?=
 =?utf-8?B?am8rTzYrYWpGUUZDdjNWMVJpa3crMi96UXY5MVhhcGlCK2ZtU3BaY3BZMXpu?=
 =?utf-8?B?S1g2VnlFZ1YrREN5ekZ2SnZtVHVkdzBYcDJsUlo3Q001bnpuQUI1ejNRZkla?=
 =?utf-8?B?T2l1NndlU2RVUDhXRTIwczR3OGFjcWIzSlA0RkU4R0NKOGVtaWdPSUxJYjNY?=
 =?utf-8?B?bDlSWDNGOFZ1bjZmS1FNQXNpTUJPWEFCaE5lSTdQRjdOS1hTcndjVFE2ejlU?=
 =?utf-8?B?MEtQdFhyY2tvTGxDWkFrY3hjOGV0UTg2T1ljN1VnOUM5ZE9WaEpvVnBtUlNI?=
 =?utf-8?B?RnBHM2w5UjZLMlpReVJSZVhjTGQzSFdITjBzVnJwWG1xZWdteXhiTHRZVHBO?=
 =?utf-8?B?bXdkVHkzMXdXVGhMWEt0VkdCQ2ZjV2I2QVVsRUprL1FDOE1OQXQyVXE2YUhK?=
 =?utf-8?B?QnhsK1NzMDBCUE1PVUp2VDFmbTdnS1ZxUHJLLzljTHhxRFJkSU5MUG9zbVZn?=
 =?utf-8?B?R3hTSVo3N2orNTI1S2IrdmZ2NmYwS0JmdEhCMm5ydW9vVnNXMWsxM1dYUlVP?=
 =?utf-8?B?SWx5VHBvMlVhekVrSERsdTA0QzFqYW1nUXRhaGp2WVRMZEx0UTl2NnF4QXZj?=
 =?utf-8?B?VmJteTlIMXZLdVhEeGozUHBYNXJNUC8wT1NkNzNXUW91WkVjeFJYbVZHdUR5?=
 =?utf-8?B?bUQ5dWpRa2VCd2x5dUVzaVB0MGJDOUdhcEk4alNJckVvc1VIVGY0bzZmUm52?=
 =?utf-8?B?MHg1Q0drVm5rd1BidEZ5U0tCQjB1VVIwWCs3TVhDc2hReDFVRWZVMmFDa1Rt?=
 =?utf-8?B?cFdURXM1bXZVRE53enNiMzRMTnRUemZJWVZYWkxueEhYdE5HSWZuWDZaOHFq?=
 =?utf-8?B?UHhXcEZOQm9NTnRicGIzaGdoTk5mdUxWdU1sU0p6UnFqVGVYT01WalM3TWxR?=
 =?utf-8?B?bUUyZS9jU28wQ2Fkd01NYWJ1SkJHVnVQMWFpZkgzVHNuRkR5QnFWU1d4VUx0?=
 =?utf-8?B?T3VXSXhmT001MkNxcHdzQnlkUUJESnZvOFB5WjhaMWJhZFFjaXkyNmlyR1J5?=
 =?utf-8?B?eWRGY1ZUTnl1MVZKNUZSbFQ5QTQ4czQ2K3VEVkd5emQwcWVHUUVPODhVZ0lG?=
 =?utf-8?B?VHhuK28rY0tWMUJpM2tlbWltYTRXTmVuS29zdzJnaWRkaWRPY21ON2loL0Vx?=
 =?utf-8?B?TXNpZmlnRndYY2RmSjhIaEFKMmtKZnFhb1Z6eXYzUlpNWUhoblR6QUZRaWhU?=
 =?utf-8?B?V1cvNmRrMExNcFJqSDJMdE9YdmtmMHBPbXNEZ2wzQ3ZWZTQzU2RZYnhzWVRr?=
 =?utf-8?B?cHU5bnNaZ3cwWUlOM0FzcHBVeUdmTm5Kem5JU3BZYnZVanU3NUhvL2xrZFFE?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84896f15-630c-49f4-b494-08dc7ed04ad8
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 04:40:25.4825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pV6OTI00+14vT1XwSsv7NTbsgAdjAfXiAt6cehKB7xBbW4/Xy6IlEV4Yhasq1UaaxoXB4/dSZd3sshmJxDmQ64Fj32398PfQmgAJyoVY2V8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6813
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

On 27-05-2024 11:09 pm, Jeevan B wrote:
> Add a new test to validate deep sleep states during extended vblank
> scenarios, where two frames are committed simultaneously for a given
> time with reduced refresh rate.
> v2: dealy of one frame added to simulate extended vblank.
>      remove vrr related debug checks.
> v3: fix typo and add define. (Suraj)
> v4: fix structure and add skip if no vrr monitor found. (Bhanu)
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 78 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 78 insertions(+)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 7766d34d7..51416c2f0 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -76,6 +76,10 @@
>    *
>    * SUBTEST: dc9-dpms
>    * Description: This test validates display engine entry to DC9 state
> + *
> + * SUBTEST: deep-pkgc
> + * Description: This test validates display engine entry to PKGC10 state for extended vblank
> + * Functionality: pm_dc
>    */
>   
>   /* DC State Flags */
> @@ -89,6 +93,7 @@
>   #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
>   #define KMS_POLL_DISABLE 0
>   #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || AT_LEAST_DISPLAY(devid, 14)))
> +#define MSECS 1000000

Please make this arch/compiler safe

#define MSECS (1000000ul)

>   
>   IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
>   
> @@ -584,6 +589,70 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
>   	return get_dc_counter(str);
>   }
>   
> +static void test_deep_pkgc_state(data_t *data)
> +{
> +	unsigned int pre_val = 0, cur_val = 0;
> +	time_t start = time(NULL), duration = 2, delay;
> +	enum pipe pipe;
> +	bool pkgc_flag = false;
> +	bool vrr_supported = false, flip = true;
> +
> +	igt_display_t *display = &data->display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		// Check VRR capabilities before setting up
> +		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
> +		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
> +			vrr_supported = true;
> +			break;
> +		}
> +	}
> +
> +	// Skip the test if no VRR capable output is found

Please fix the comment style as

/* This is single line comment. */

/*
  * This is multi-line
  * comment.
  */

> +	if (!vrr_supported)
> +		igt_skip("No VRR capable output found, skipping the test.\n");
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {

This loop is redundant, just capture the output in above loop & use it 
here directly. No need to iterate all outputs again.

> +		igt_display_reset(display);
> +		igt_output_set_pipe(output, PIPE_NONE);

This is redundant, as igt_display_reset() is doing the same, please drop it.

> +
> +		if (!igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) ||
> +		   !igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
> +			continue;
> +		}

This check is no more required.

> +
> +		igt_output_set_pipe(output, pipe);
> +
> +		data->output = output;
> +		data->mode = igt_output_get_mode(output);
> +		setup_videoplayback(data);
> +
> +		primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +		pre_val = read_pkgc_counter(data->debugfs_root_fd);
> +		delay = 1 * (MSECS / data->mode->vrefresh);

To make sure to achieve the extended vblank, let's try with some value 
which is less than the vrefresh.

Ex: 1 * (MSECS / (vrefresh - 10))

- Bhanu

> +
> +		igt_plane_set_fb(primary, &data->fb_rgb);
> +		igt_display_commit(&data->display);
> +
> +		while (time(NULL) - start < duration) {
> +			flip = !flip;
> +			igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
> +			igt_display_commit(&data->display);
> +
> +			cur_val = read_pkgc_counter(data->debugfs_root_fd);
> +			if (cur_val > pre_val) {
> +				pkgc_flag = true;
> +				break;
> +			}
> +			usleep(delay);
> +		}
> +	}
> +	cleanup_dc3co_fbs(data);
> +	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
> +}
> +
>   static void test_pkgc_state_dpms(data_t *data)
>   {
>   	unsigned int timeout_sec = 6;
> @@ -687,6 +756,15 @@ igt_main
>   			test_dc_state_psr(&data, CHECK_DC6);
>   	}
>   
> +	igt_describe("This test validates display engine entry to PKGC10 state "
> +		     "during extended vblank");
> +	igt_subtest("deep-pkgc") {
> +		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> +			      "PC8+ residencies not supported\n");
> +		igt_require(intel_display_ver(data.devid) >= 20);
> +		test_deep_pkgc_state(&data);
> +	}
> +
>   	igt_describe("This test validates display engine entry to DC5 state "
>   		     "while all connectors's DPMS property set to OFF");
>   	igt_subtest("dc5-dpms") {
