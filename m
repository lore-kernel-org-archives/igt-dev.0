Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA40EC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 13:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5884210E18C;
	Fri, 26 Apr 2024 13:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gylvTIGU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5827710E18C
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714137590; x=1745673590;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EufvINcty/IdRVIYCqLv8NDrqKrR/Ou+OHjF+NskpbQ=;
 b=gylvTIGUCz/TrQhnmOegXhCZxC8ICYUnyDXNXwExBlZPq394odccxKF0
 yXrvrQ/TAs5QGibw2fF0f2urJU9IN2cOM6YN42pKORQ4swGwr5soT3Hv7
 Eus55MoRESJIJBbQyT0Y+lYNkmziIrC/fNgaTdc/c2dcvdFBfMZeqdXG8
 DWAabkqvWGSageDtD34047D0cxUH0opLVDeSH4OaPvKOEnA/zSz34wpF1
 Ep4eSBPSDpsB6AYwE5r/n/bNhRpUKeYUV1IV/WOzUq+LiPR9Sc9IWTZ2E
 prDp/rk1P/NmBsGKvGqdgP4fT6F0uzcE+HTFAlkEbrSVWBaaquoJFx7Qy g==;
X-CSE-ConnectionGUID: LAhKIah4Syq/sBe8onoEeg==
X-CSE-MsgGUID: NcTovq+xTIC+Q1KypLAJzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9732255"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9732255"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:19:49 -0700
X-CSE-ConnectionGUID: mMo+XD/6QjOE09pdK8SnWw==
X-CSE-MsgGUID: KdKvjAxGRve8O+slCytyaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="29869085"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 06:19:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 06:19:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 06:19:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 06:19:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c88ryxjxJnbAtVSIOG0Uk2ayBrbLFgwAQtQU79HxlUS9FuGrj0DoPR+heyNoJ6AkIqYY5LDYjMBDR/PzF7XZwlIV+vfgHa9uWdhzdHOpEsdbyzq7fT5pkWyL+84Y5burNh20vlunkrgPzl4yiWQ32sBNxQIGK6XTZ9f1NBsyJLvJqzWuxQOrREeZydru0VdCxQVUpzOvDxaumzG4ELHqXA/uGUvx+HNAOhQNKL5qNm4ELenH7E7o1u1T17UQs3exkcxXVSLLtyW7P1RCp1mucY6qfBmSxxnNCRmCXF49ECUP1t9eVNDF0gx5ijc8fnfnRDenJqr1f3qMaVFmZZ98hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfOqvtP+vlf4+sGyl2R0FNFlU3lxssq0Z5e+kLJCGwE=;
 b=ftKzV05Fw92Bn/CsUub5TS9RW5fo/yFdMWvPb/nnptpye38XbXITqnCQIWQbgBCZi6lAcIZMRN/e6rTBn1rxuuipy5A56vU4f9o0cKrnlB25XIudfDR64snOAuJwfo0eZ1hInuxDI3ON2PAPDRERWkzmDuUq0qWWDjGKRNqogNAxjBNgKWovRcaE/4VnBQitQAEgPby9j/uGoGOnaZTW+hbFGJ6vXzZ6D7gzbe51z0/9mnRI6zduzOFpYyC3t14RXM4jzkc2R37sKd+bOhcmPw8ykFryvHAH0by1F1ugrEXzb9/IpJt+5FdnPMff/2Nl3i0tDBgiQiHYZj+d44qVgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Fri, 26 Apr
 2024 13:19:45 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%6]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 13:19:44 +0000
Message-ID: <16bac6cb-fb58-4ea9-97f7-d6118fada4a1@intel.com>
Date: Fri, 26 Apr 2024 15:19:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 09/10] lib/intel_blt: Add render tilings and
 compression support helper
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
 <20240426090117.78060-10-zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240426090117.78060-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0200.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::25) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|SJ0PR11MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: ac383812-156c-4794-8ae0-08dc65f389d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkpkRE1iSHJtOVpnREthZ0kzWC9wSjdsQnRadkpGTmtTbEVYczRhazBEZkt5?=
 =?utf-8?B?c2FlRVJVZ3BLSlFDSHloazhyM2NZclBMUlBEZWdjcCtTVXBENldpOWxnU3VG?=
 =?utf-8?B?ZDRvL3pQc3JoTUJtTFVLQlJRZmNtM0t2aWI4Nm5xZVpUS0o2RFl6V1hJT2I2?=
 =?utf-8?B?THMyRXhxYVlQOTVXMDdScXB6bzBGTFVVbTREdWFueUhhNklzbXlOUzZ2LzJW?=
 =?utf-8?B?Z2hNWW5PRzlJV3luUXR3RkxESkRKdzBsd2VZNTcyVWE0cExESXpPSFd0Rk5W?=
 =?utf-8?B?a2w5K3Y0dWdWSkNyanV1czQyeFVPVG41bzg1NjY0SU1ocWVMcW5Ud3NZVGNV?=
 =?utf-8?B?ZUdqVExGL2ptc01DQjNNR1B3eHhVLzFFSmRTek5oelhKTm96MlBHRVNKY2do?=
 =?utf-8?B?STM5VGtQSktqY3kvZEFpZjFpTG1MRWpkUVQ2U3RGUzlUUDJjQ0dvZS9VQ3JL?=
 =?utf-8?B?elB2VzdwakJTRkNaNzhJaU5ubjZzTTRXNTNCclI2dVNUMmdRK3dLc0wyQ0FR?=
 =?utf-8?B?dXAyMnVuWXFkaHZuRDlTQlNxOWJzUDNiOHM2dGMvZHliYTdRbDZFWDhIdUhx?=
 =?utf-8?B?ajJObE16ZUxwSkhOSmdmMzFuYnlJZFY0a2RvS2wrUjR5K2dDckUyb3BKMzBD?=
 =?utf-8?B?M2k5YTNrQmR3SlRPMVhlOEhwZWhHQk9vQmlISG9jWHA0OFdzOVlQaDNJVEU0?=
 =?utf-8?B?UHJ2elVqNTg3UDNLb0lrZkdtRTc4NU5JL2NtQlRvVlRqK1NRL0JFdUNQTlZD?=
 =?utf-8?B?SDFUNTBwZk02aVpxUWFvR3JYRzI5ZmFKVFhIS3lrcGtBMTdvaU43bzZDZXpH?=
 =?utf-8?B?b3YvZHc4UFZVRnQxSzAxbE1Kd3RrTjJsUnAycjF5c0ZWYWNUWDZ5WlY0d1pQ?=
 =?utf-8?B?Ni9NcWRsN0pmVW9JMENpclVGaXUxd3RsRTU3bjY3ZVNiejJqclpVTE5XcGhk?=
 =?utf-8?B?TzEwSGl2QWVlT1ZuZW54V2Fjb2ZUWWU2Q2I4SXpVaGFrOVN1ZTFaWnNkUWZL?=
 =?utf-8?B?SFdsZEEvZGJrV2l3TnBPMmgzNmNuQlFLTFpHY25wdjdJV29Sc0VDV1kxRUpy?=
 =?utf-8?B?dFBDbktPK1c1ZDB0VGpvTnJYTkRJZVREbkJPRnlkSDEvV3FvVFB0Y1FmU2d5?=
 =?utf-8?B?ak14czh4MHQzKzRrVlVPZ3JubW8wTWpHeksyWllBcjZWQ0lIdkVvQWVQSEl1?=
 =?utf-8?B?eWFzOWVlTE15Q2hnb29YUXBvRXJUYXUwOXdaOHNvSTJyRjFRdW03disxYzVi?=
 =?utf-8?B?dzMwamNxaXpON2NIaERneVlVd2dnUGNCbVNxbDBnSFYxeDR1b3ZBeC9XZVQ1?=
 =?utf-8?B?U3gyYzFBZ3F1SjQ5SW1USTdQcXhsZ25iQ2xRb2paMnRwaWdta3c0ajB4SGhO?=
 =?utf-8?B?RXRPOG1ENVdoSDdrL0FSY0I4MGZBUlJPcS9JQjJHMnk5R0l4eU9hTlpvYVFa?=
 =?utf-8?B?T01LT0dVU2VxY0hQWjFMN1NyRU5HcjVPdkRTdmhkazdNdUtNcTJvbkFVTmtv?=
 =?utf-8?B?NmhxVkpuaWp6T0ZocnUxdjUxZU9lcE1TMG1mQzQ2akExNGw0YU1zWFpyTW1m?=
 =?utf-8?B?bkJFUHh6MEZ3bkNNU0VNaWE2eDYwaUUzMHJDTEp2QnZCRUpndXMvMXhrZnJ1?=
 =?utf-8?B?SlpmT3l6N2MyUTIreDk5dGR2V1FzNGNFekc1ZlZFRzh6MlozcFEzTUk5bmxF?=
 =?utf-8?B?S1hHVXdqbzdYVUdBZTY3SG04UW5LMjg1UEMxKytNWDlhRmp6VThpWkhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHlpY3IwWmljUkpWS1l2eWpZc1RaN3VkckVEcllZSWFlR1lLK3UzSUNlYTBP?=
 =?utf-8?B?ZXJkVFcwSmpwL3ZxbStWQW5JM3JoQkw5Z0VyQTY3enVzYk1IOFd4UU0xbXJM?=
 =?utf-8?B?aXVSN2Z2SHpPRkxxNHM0LytON2t5UGxJcWFkWlltLy9JbXNtWDVoZXJYVEli?=
 =?utf-8?B?U0N3dno3Skpra3ZlZGE4UWtGUzJIcTMwbVNIdGZFMHdxdlp2NFBZbmp0MHlI?=
 =?utf-8?B?NHJiSHI4MnB2NTduTkpNMFFHcnlwaUd6Q2Ivejd5YVMzT09PR2Y4cTlzcDU1?=
 =?utf-8?B?Nm5xZGNZRzBFdDd4RHV0Slcrc0NOWWJLZFJubUUyZHJkL1pzbVNuTVdJTE9Z?=
 =?utf-8?B?QzUvK1hqaC8yNTVjaG9Lb0JVQkNrS3lLRDd0NzlsNVc3Z3JwVEYwTktBS0E4?=
 =?utf-8?B?NFhrRWh6bnhDS0kwK0FvNFd6cnI3YlBXUUU4N1c5UTZLOUZLU0xHNk82ZEJp?=
 =?utf-8?B?UjBrT25CTlFxUnM4Z0xlSktZUU9zNFV2YUlDZmFtVGtYaUw5K3VxSDZadkxR?=
 =?utf-8?B?UEFRb3AwaFpzd0FNUElPY1AveGlIVXgxUkJyTVBncW5TVGhtODhTS1M3Mkg0?=
 =?utf-8?B?UENrMHBwSFA5TmhBb1JlYyttQWFMVW5DVkxCOTVwSjRwNitUSGFHSmFrdWNV?=
 =?utf-8?B?USsrOEtXclJ3WG9oS2lsY2tuSlFVcVV5WU9aSmd6WUk5K3VqUm9Wc1ZQN1Yz?=
 =?utf-8?B?ZjJ6Q3czWWxVNnlGNFdzR3QyeWFQSDFNRGp4anBua0Q1c3MydTJ1a3Zqb01h?=
 =?utf-8?B?Yk5aSGpYKzV5RDhJS04rdFR2R3BDemdwUGxmamtPakVabGhuSkkvTEI2a1R5?=
 =?utf-8?B?a2RwUFhqUmwxNXZjN29TMG9QOWI5cDBHZkswczZPTVhKZC8xVHJZSE9uVXVm?=
 =?utf-8?B?Z0g5aFdUV0ZyeEkxUnB3azlRNjkyVzVTMVhUS1BRYzRyVVltS09HQ3RhVGd4?=
 =?utf-8?B?U1Z2M1dSZjA5TXY4anlpc3d1eFRySXFid2V1ZSsweDBxaW10Vld6YnExR1ND?=
 =?utf-8?B?U0VvbCsxeGh6eWRPNnhyKzZBUVJHaGhRTE5RUzRDOWJaSjh3aG5IWE5IN0Iw?=
 =?utf-8?B?OTd5bm83bms3eEhMSUhnSnZHUDR0L3ZUaGhvUjhmSHRWVEhkRWQ5dllyb0hW?=
 =?utf-8?B?SVZ1M0hBNUUvbEdveTZyVFN2cVZyT2Z2QjhteU9mdkM1NmdtY2JzQ05iQkJi?=
 =?utf-8?B?ek9xa285MVpsMmRyQm1JWUtiUTByaTJIb2Y2aGtOVlF1WHRjay9uMlNYU3Bw?=
 =?utf-8?B?VjZ5MENYRm9DVmFtTjRUM05IUWJoQ1dwYUtnVzM4Yjc1ZkFRYnhKaG1QRHZi?=
 =?utf-8?B?cmJOVXdsTTFHTGlxQUVLdW96dGdSUUZOS2tlQVVuK0x2TmZvbUEyQW1kdzBN?=
 =?utf-8?B?VDI5L3ZuK3VBZFcyb1JnSWRVUk5QelFpd3llbHFSeEY4QktvV05yQis3akp4?=
 =?utf-8?B?ak5Za0E3dEYvOFJyY1NoSGtnRzQyaHFTanZOM0JuL09rNFlJbU81YUFvelh5?=
 =?utf-8?B?blJGQ0ZjcGI0TTZqU21FSmNodEt0UUc2aXY4TTE0TGFITHh1Zmh3czNqQ2lV?=
 =?utf-8?B?YTNtcFRrd3FHanVqWmtuNHZoOERmL21NM0xJUTgrNlU0aE01RmZ3N3Z1U3Mw?=
 =?utf-8?B?dVJ0VnNERWxia3ZyV0NKOTdvdkVmejNSYkU0dlEwSUxndzl5cFhpclE3M0s3?=
 =?utf-8?B?dHVxcXFYemRXRUllRjNTRlA0QXJ2UDgyQVV4YnFTRWU5MzduSEowaDNNRXRD?=
 =?utf-8?B?SjZUekRKaUxsTjNpM2psZEo2R04rdFNMZGo3YzdrbXFyTlYwMThMU0NSZTlW?=
 =?utf-8?B?WitpMTFHUnZCSm12SXhKaGVhTHpjMWxaYVFad2p2WE9mVVB3bWJVVFpFZFJZ?=
 =?utf-8?B?VUlJWXdmcXFmMkxxUFVHaE4raFV6dWdNNytNVG5wMkhQdTZhQUk2MDRCS2pC?=
 =?utf-8?B?NVB5ZmVNdk9JZjhSdGJUVVVhUHJVVFJjUkljbEhsZG94Y3d2VTZnWU1vTkRv?=
 =?utf-8?B?SWdSdGJVZ2V3WE5vdnVFRHV1NlhTZE5YSHB1S1p1M3M0MVR0SFVnQVpGM0ZS?=
 =?utf-8?B?ZitCU2JtMWZzdU10NnR1bHdhUnBndzU1QnV1amJnMkw4dkJsaVduQXYzc3lF?=
 =?utf-8?B?TWFmRGlxWlZqLzc5YzNmd1FrRlFmOFNHS1NHNmJDai9kUFZtcXBZZ3FSY3pM?=
 =?utf-8?B?amNDN1VpL2UyQUFRR0NxZ1lLMGxLSjdSZ0V2RVZyTWo1KzNvU2R2dGN3ODZr?=
 =?utf-8?B?NEx6bDFIWHZxdXF0U1V2Zk8rN2p3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac383812-156c-4794-8ae0-08dc65f389d2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 13:19:44.5007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrCQ62zwGEkNBeBu7K1tklxMqZ+3JMpn7Lh3TzIPmTu6ASUv8Uqq7LHgKdiVZ/PqYo1a2F4/IdMgaVEbg0+XYGSWKg4v0+T8HI9TIsM4G+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
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

On 26.04.2024 11:01, Zbigniew Kempczyński wrote:
> Add function which is similar to already existing blt supports_tiling()
> but returns tiling/compression capabilities of render engine.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> ---
>   lib/intel_blt.c | 29 +++++++++++++++++++++++++++++
>   lib/intel_blt.h |  1 +
>   2 files changed, 30 insertions(+)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 946adc538b..a8433387d2 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -495,6 +495,35 @@ bool blt_uses_extended_block_copy(int fd)
>   	return blt_cmd_has_property(cmds_info, XY_BLOCK_COPY, BLT_CMD_EXTENDED);
>   }
>   
> +/**
> + * render_supports_tiling
> + * @fd: drm fd
> + * @tiling: tiling format
> + * @compression: check tiling which will be compressed
> + *
> + * Check if render provided by @fd device supports @tiling format wrt
> + * @compression
> + *
> + * Returns:
> + * true if it does, false otherwise.
> + */
> +bool render_supports_tiling(int fd, enum blt_tiling_type tiling, bool compression)
> +{
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
> +
> +	igt_assert(cmds_info);
> +
> +	if (!cmds_info->render_tilings) {
> +		igt_warn("Render tilings are not defined\n");
> +		return false;
> +	}
> +
> +	if (!compression)
> +		return cmds_info->render_tilings->supported_tiling & BIT(tiling);
> +
> +	return cmds_info->render_tilings->supported_compressed_tiling & BIT(tiling);
> +}
> +
>   /**
>    * blt_tiling_name:
>    * @tiling: tiling id
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 6daf46aea4..edf75c0887 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -211,6 +211,7 @@ bool blt_xy_src_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
>   bool blt_block_copy_supports_compression(int fd);
>   bool blt_platform_has_flat_ccs_enabled(int fd);
>   bool blt_uses_extended_block_copy(int fd);
> +bool render_supports_tiling(int fd, enum blt_tiling_type tiling, bool compression);
>   
>   const char *blt_tiling_name(enum blt_tiling_type tiling);
>   int blt_tile_to_i915_tile(enum blt_tiling_type tiling);
