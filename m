Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BF9C7113E
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 05:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C685110E188;
	Thu, 12 Jun 2025 05:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWoe9i4j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7048A10E188
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 05:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749706336; x=1781242336;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vqk1+uCzBx7kpSkMaoQ7hRtUn73V8rmDD6kuYa8KwAI=;
 b=JWoe9i4jf+wYUgR5PshAIgekShpYXyWgJktBSFMAtjpjnCUyxWQ8vnFK
 W9zCslj7JsC8eKaEW0Tbjan4VD8B23YzZNgdYUjRN27IxUqfejf+zdvrB
 09lXtc3gF7E2xW2shUss7St8cngW/d3KEd/hAy/RK/EuyivkpGxWHHW33
 ZnbMQ1RiLXC7d0Nr48AKw55xPZgdkeqSzs0KODVH1w7UMMH5zLu1hA/In
 lrxcEW9zVU68MraLi1U4cjdy32B17LY8OLt7+p+BQovtZj66JFGpFKtk8
 9z9O5mjS9yiXaQcNlxV43hlpSn+wJsJRbfKoeKjw4eZLWDtGZ7vzlVC1z A==;
X-CSE-ConnectionGUID: dhQqFU1FRmqPjccM5Of9Yg==
X-CSE-MsgGUID: 7najo2QoQb+aJG1aRZiGNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55539380"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="55539380"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:32:15 -0700
X-CSE-ConnectionGUID: nAZcodhQR+aveV6UTXJfvA==
X-CSE-MsgGUID: biHRCptpQj6UviUloBv+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="170582937"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:32:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:32:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 22:32:13 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:32:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGANgXkw4j8G60ibf2WHs3rd/O+2hobcdKOE2RQHYe2dyz2wduDnyp7gg29E62rJWD1YBiMHuBGPlT6qfq+g9zCGeA0hM6wnubkdi+M2NXvUUIkj+HU5MRHFmqq47F906xgISnixk3QZ1aEJjegfaz0gP8bxEXtL+4D97IHy3bwCRfLLqHvjdMecpVP1ojPeZz9sCeepb1cge9bgQE6Hd+bUK5wb54AM25xThou5EKyEmYpirpUy0iJdj/2xQbxKiW37jpXU1hSAXrkgiXkqi0n6gr6sxHi3TklPcwJZzfpibGbRE6gtuwe4O9azuTPk9rOv8OXsRDVZH19cQARCbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agLZuR0t2fw3HzVLASR3iLkesd6C9SnWdi1bZBiI8hc=;
 b=felGd7J81fSrC7cpqw+0n/gnl3wg7HkGt/mvAOiAl2zir+eLE69Em1+124C1YXLeR1SYNXZJnXQ8NWkLgXYyufsZhQ7dvmUAtyUCNfTD0MgT/uYEuEGH77X1GMRP8V6QmhydEc7DsxhG8QkSl41kftxHtwfRgYNXjptBQfAuRvywApwJeAehSs2g1rZKGnTclD5kKbcnPxJusmU3hz8fggq4/Nyp8su0QON1w7pw0KwRSDgocxWMIx/mgre6fiuygJGUGM8ecIaRYOKUnpj5wcxTywy7llkeUYMPZxnA7J2tJwTsHgWzff5vqrUdTkI6d04kNRBl9e6BuV8S9IaDpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.20; Thu, 12 Jun
 2025 05:32:11 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 05:32:11 +0000
Message-ID: <4131895c-5201-47e2-9054-8d906f431197@intel.com>
Date: Thu, 12 Jun 2025 11:02:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v9, 1/3] tests/intel/pm_rc6_residency: Ensure that SLPC
 is enabled for test rc6-idle
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>
References: <20250605202024.709332-5-sk.anirban@intel.com>
 <20250605202024.709332-6-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250605202024.709332-6-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::25) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: a01403e9-9f77-4d04-525c-08dda9727b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0UrajBIMnA1VHhHSHo3UEEydkVCUkVVTVlrOGp2a3VMOUQ1WmFwK2gzYklH?=
 =?utf-8?B?UG1MaWRqTG45NER1TERvbVh6TXlhUHZhbjJZbXBGRU5ROHVnSlZSeDN1dDYw?=
 =?utf-8?B?SVlSUm0zdzVublRVWHFVRXZ1bUV2YUNIaWtsTEZTcUtKMmVKUG43b25ObFVT?=
 =?utf-8?B?bDRuYVV0VURrMFhqSUw0aVhQczBveHZjdGhkZGRUS1NLZ211eGRYaC9VY3VM?=
 =?utf-8?B?KzRhTmxITCsxTTVOZSsySDdEM2pRK1RPejNDZzlmLzAwU3hVQTJ5SUlGbXFp?=
 =?utf-8?B?a2Y3UmkxanBoMXpXTTYzdVhoWldvRG9GREh2TkpCSWJpVEg0ZVdJRXE5VDJk?=
 =?utf-8?B?S2NUdTV1cUZZSTM4dW9PbFN6a0JWNTVPbEtuc0h2TXlxclQ2eTdjcFVzaFJK?=
 =?utf-8?B?N2NJMUd2Z2VzWDEvZ1BCK0Y5MlNSbWhIZUVvaWVOYk5Wb25ibUVla0UxSkRF?=
 =?utf-8?B?d0lyUTlHcGE5QXgvS21GYldUUGFKVjM3ZDFENS9yUFJZcE1QMkh6UjZtWExW?=
 =?utf-8?B?MkFqTTFoYSt5UGlZK2krb3NYWXRuT2tIYWVxdjNKSjZxKytiWWhlRG9nWVpp?=
 =?utf-8?B?ZzZEdXFYRGtiZUVYMlhLNlorOVVjaGhLN1AzV3BOWUpBMkJVVHUvSTdTVG9n?=
 =?utf-8?B?ZkVEeE5OdGUwSklHcVRXN2dKVEMya0QzUmZscEZFNlBoOEFvdndkNmdUTjh6?=
 =?utf-8?B?QWh2WWxRZlZlZThveFJsMnhxakdZelFuamFtUTZySmVuUnJtNzRLWW1lYTRV?=
 =?utf-8?B?aWhzazZzb3JPMkd1ckhaMm96TFpXcEJoWXFXQlpDQncycTZkOFcrVGJETC9Z?=
 =?utf-8?B?Q3B1cVFIVXdRRDBIZlFvNjQxaTk5cXJPTStSYUN1ODFiYVFMUFprTWhNelJQ?=
 =?utf-8?B?UUJhQlNjN0VRa080SmI0MnY2MzdwTkFsMkk5QjFwNmFwMGp4WWQyZUR3N01S?=
 =?utf-8?B?MHVwbjVKVnpacC80cXpwVFkyeGQ1cE9KK0NtWGNjcVVTaURNdnlkS2Jpb2M5?=
 =?utf-8?B?VzZIRWtuUDdUN1BnZXIxa2Y4VlcwZFU0TFg4Y1ZiSTRqTzhKMEhpeVRQbFVw?=
 =?utf-8?B?WkxwNUF0ZlRka2k3TUF6R3B6dmwra3o3UlVGTlFRVUxoRThNVlJEMXpvRThj?=
 =?utf-8?B?SThIdnBsMk1iNms5YU5ueE50WjZVcG1zVmVUME5iOTk1T0dZUXErOUpCdXJ4?=
 =?utf-8?B?bkJEdWc4MWJCM3UyODV2WEh3Vzc1cjBCbDBsVzkyTlNaV3pzZ2s2VzN6WSts?=
 =?utf-8?B?bDVTMW5sZ2JtME9oUmxxTk00R2o2YklZb3BuS1VEVXRhWXBwUkVhRXFwK2x3?=
 =?utf-8?B?RkdMcmc4MWVrVHVINUJRa3Q1elFkeUFrNzJZT25hd290aWN2NmxUakhPejlK?=
 =?utf-8?B?a1A4eVRmVDI4TW1yQjN5UlNUZXpVZEpUZ2wwSXROSDZ4eTVWVDZ6c2J1b1J1?=
 =?utf-8?B?QSs5amExT0FUQmU4Y21ZdEVaSGV3VndXWUY2aXBueTBmUEhtbjg1NUpJSXFP?=
 =?utf-8?B?Wk5xMFN0aDM2VTB0c2RkMHV0N1o3QWI1Ty9jdktXUTQyL1hGQTZ5RS9kajB6?=
 =?utf-8?B?VkpFYVpZVytwdnMydlJ1TTNsM2VnUkZ6QWNZT1MxKzJ0SUorSXc3MkxGSm5N?=
 =?utf-8?B?QlVtNlhWU0s2SjV6d2tLbUJQSnovRVEyTXNYSUZUWXhHeWVLUG8vbW1pYzZq?=
 =?utf-8?B?T1IvUzlDNmQ3cjNTYmJaeHNrb2RtdjlaNmd1Z0NKOU84YkUwNkdDdnBJVi9m?=
 =?utf-8?B?QXIwTG9RdTByYkVMcjIvUGFGYnE4VEZjN2g5ZDVHcFEwQ1pWa2NjTzZORlJF?=
 =?utf-8?B?cngyVXg0dkg4MWJuNFkwVitpSHlvS2hjWFpUNjlGM0pkV2RxeXBQVWgwR2NH?=
 =?utf-8?B?RFpQeHJXZmo2S3c1VStGQmlHWE5GODkvaDBLczgzWG9JUWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE5xc3JrRGpPVTU1L2UyWm9odHc3aXJWNWg3cTlWZ3lWT3BpNTJZNS9UTnBM?=
 =?utf-8?B?WFd0alM0R2Q2aXRJYmREUFRwTDZib29rQjdvY3JQTzUzQlUzT3lReXJUeXNh?=
 =?utf-8?B?K2tndWdJQWZONnZUUnZSYTJOdWdmbThERGFTTGZaTGFYaGJKY1Juc2RQWUtn?=
 =?utf-8?B?Y1dodFJub05FMWZXdS9ISWduc3FyMERDNHZzSi9pczR5dXB4ZXdZOWhZMHFt?=
 =?utf-8?B?U1RUY3ZzU1l5VXNWQVNWRG1vK3BhY3B6NE5oWUNhTURzZFBKL3ZxWXRyZzdN?=
 =?utf-8?B?OThZZU0vUDNJMDdpRE9FZlpaSXZ1TmRoUkNHNVU0T0tjL2FUMi9reVE5T095?=
 =?utf-8?B?bzNyRnJOZmFZOEw4Q1BHYzhJWHcrRmx0MVdmeDFjMkdVdjJVdkZLTFhKMFJo?=
 =?utf-8?B?ejc1azh1alA0d0Y5TlRQNGp5dkpHWGhTZ0wyZXNOYWkyZTJDN1E0MkhZU3Zm?=
 =?utf-8?B?dTFMR0s3bFJ3S3F4Q1hETk9iSmFvWllvWEc0cmFJOTliQUU1VFRUaTllTjZX?=
 =?utf-8?B?ZEY4ZjY5KzRWRWlwN0xEMFFaT1RIT2xMSUp6ZlhCb1FrOGdxaXNEcUhVd0hI?=
 =?utf-8?B?NTdERlVPRDFKdDdEN0N2M0prQUV1N1RURDlqeUtXR2JlaVo5NzBFbS9IcGE1?=
 =?utf-8?B?UE1JZ0pVeU9BWEFNS1VTaFptNFdMQ1F5cDdlT0ZwR1drTjVVMS9KTTdWTEhV?=
 =?utf-8?B?Q3NlQldxMlFGZ00wVk81T3dyaHZ6VG50blgxN0JnUlVsQjhKVG9Tb1BDb3Bw?=
 =?utf-8?B?cjZWenRleGowZVpJYWJab1dCS1JIK3BHblJSQXl3ZGdBSS9vRXlqU21BUWU3?=
 =?utf-8?B?c2JDRGQ3emgvcmoxdUwrQ1ZPekF5NStMSWoyWnFGSGhRYXBVSXFlTE9Ebklr?=
 =?utf-8?B?d1dydDFFYTlyRW5YZTlacjZHenUxMnlUVkc5VkE1UnU5NzExWlhZNkRSeEFk?=
 =?utf-8?B?emJ6c1VibjNJa0lDK3hobkYrb0U5MS82NitvNFJwL0djTmFaVVZ3YndVN1Fy?=
 =?utf-8?B?elR4QkFyMEJKTGtnY3RoZEFGRThkZnZYTzJFQU9scmVHMjVnUE04Z1V1N05H?=
 =?utf-8?B?dGE2QmhIeTdNZUtiUVlpdm8zYThzYnFTWVpqeWt2cDlUbTBNNHRDS21ueHpZ?=
 =?utf-8?B?SE5HQnZIR05iekpJSFYyRGpWeGhWU3pRck82YzZmcWFWQnI3ZzNqUE03cFJU?=
 =?utf-8?B?K3JlU2k4cUhoczdTc3krSWdMaVBxaHZYbWhsUEt0aERqT0N1dUd2RDFiZmJa?=
 =?utf-8?B?Qjd2bHh0VVdseFJ6blFpYjNMWmZDVFJFZVNLd3ZCaDBjdzJYTEd2TUtJTENW?=
 =?utf-8?B?MTcyeEdDRlkxQTNUNkM0bzJaRkVDeEFhMHBOL2dXaDNCSkZyUzRJcmJ4STQ4?=
 =?utf-8?B?VS92TlR2QURXYWxScUpXOHc3cHByVjM3dVBzRGpwbmQrQTRnK2l4a2hOd2gx?=
 =?utf-8?B?SFY1aXNDNFN3OWZFek1EbklMTm1JT0E4QXBlMzd6SjJMeWVSOTE2Q2UwSE04?=
 =?utf-8?B?L2hsejJ5RnFiTXViSDc4cngrR2phcVdZRXplVEwyQVJ2eWZwTFhFR2V5RGda?=
 =?utf-8?B?cWFXWXdLeU42VGt4U0JlSFVtTDU0eEoyOFpRYlpHMDZFMHJBQlFkeld5bmNS?=
 =?utf-8?B?TUZmMUh0WU8xKytyK0JlZm1nWTNId2MrVGlOY0dGUVk1d1dKSVF3VWxKMzdZ?=
 =?utf-8?B?RnhtWEpXUlRackp6Z1lWUjZRV1dCZ216SlVaS1JoTWkvVmJUQkd2RlAwMEhX?=
 =?utf-8?B?bTQrRnFMajFIZVlYcTE5N0htQytnRWZBWmRlYTNiaHlrYVl5VzZPVm9tdlRS?=
 =?utf-8?B?YXVnSlJJWjFlL1J6Y2JWYzFSS3ZSZmtTdk5MSUwyN0JpRGVTajBkUjVlNVRU?=
 =?utf-8?B?TlgzM3pDbktZRm9PWU9SaDd1dlJYcGdiRTdxcG9TREdCWEI1TWdRMSs1T0R3?=
 =?utf-8?B?K1RRaWpqaEg2dkdoZkZhd0Jqb3IrNmZ5YlNwUEUzQ093NkluWTRtM3F6L1NH?=
 =?utf-8?B?ZkZrY2hjWVFyZGN6MFpmR1JCZFhic0pjNnppVjNia3ZsTVNOc2J5aXFUN1p1?=
 =?utf-8?B?ekhDTDNoeUdQR2xSeFVZcDNLSStnekRiRncxbys2UkNzdkVjWk91aWNYRWhx?=
 =?utf-8?Q?uX4J+ju2/oKczJ1KdAZTKd3Q2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a01403e9-9f77-4d04-525c-08dda9727b10
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 05:32:11.6189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PtRhHdV3IU6WXgS+mThmUwrOGYEz3dTGxrufjyw30DEAx8n0MRkAlYNKWnq+vqhG2Qc+wYxRJIqQoDY0Xe19A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
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

Hi Anirban

On 6/6/2025 1:50 AM, Sk Anirban wrote:
> The test currently utilizes sysfs to adjust the RPS minimum frequency
> to RP0 in order to reach peak frequency. Therefore, skip the test on
> older platforms where SLPC is not enabled.
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/i915_pm_rc6_residency.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index d3fa95423..337f63e34 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -617,6 +617,9 @@ igt_main
>   
>   		igt_require_gem(i915);
>   		gem_quiescent_gpu(i915);
> +		igt_require_f(gem_using_guc_submission(i915) &&
> +			      i915_is_slpc_enabled(i915),
> +			      "This test can only be conducted if SLPC is enabled\n");

you can only have slpc check, guc check is not necessary

Thanks
Riana

>   
>   		s_dirfd = igt_sysfs_gt_open(i915, 0);
>   		stash_min = get_freq(s_dirfd, RPS_MIN_FREQ_MHZ);


