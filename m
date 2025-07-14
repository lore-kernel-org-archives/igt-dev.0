Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE01AC83F1B
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 14:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A0D10E032;
	Mon, 14 Jul 2025 14:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RP7yDv/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA49910E032
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752503871; x=1784039871;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bVd4mN97D8zSGeGDH4+32QztXtDEQpG91iwHgZ7eJDc=;
 b=RP7yDv/rmKC7WbufLgCjtF5WoDfYBKC3Vv2yfW2eEhONa4NUaZgTfpV8
 6iSW1s8oPkJqhl7oIuZohCnw2zjOLgelAIPpUszpgmp42XVpnhxoEvQBn
 4Cn4yYzSTcJyBPBerPbktlf0adCAJuxBhu12Dtdzj5ZQNKmNIgypyu6lP
 3jjgNFtxC7yJw4EU0PmFg1d8T1kYfwBbdWuACNfeLlSjWtulHRzsfjaqK
 ur9rpyP8uFg8fFtl+YQN65OGlfUE4um5Fbri+LCRn6z1spHo6uBlJhYFq
 vdPCAtULtDxAXmZfkTgjplj2IQTlCH/GdUehWF06RGyX8g2qfHC7rxUpX w==;
X-CSE-ConnectionGUID: Ibk7ZMGwRX6fFHhMeDX5jg==
X-CSE-MsgGUID: Nx7UkBiJS0KzPQAYPVbpsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54568290"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="54568290"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 07:37:50 -0700
X-CSE-ConnectionGUID: Q5d1FeKsTsudDGe31RDDuQ==
X-CSE-MsgGUID: BLEcVYJnTpuQ6OHEYP7wCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="160960476"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 07:37:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 07:37:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 07:37:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 07:37:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMHFJ9iekwwDsYA00mIafoO5JuMNnRxu8UY69+tELLrXak1gDySvXxQpCeWDIxwRYp6rfrsEOh3cvaw8wcd2yyHgZoqmervOYcsK6NOXcKvu5St8H1DrngY8zQEJRlXgl8ij81qL26SxCy3/mf1pjStrdHrJcnAT18HLYOlIeEpMnwVoZmYYQdu3qkUQzWnDuNtdtHbir0zufYJKuPQJbhbXgrfaAqYi1ZaVu8zWurZKFrXd58/z0KRbeaohGaRS5lkiHiNLqtqt5JAQmpJe+aAppXY5jDGfDXpSp2d+LwsVjTdnd/KhRKsNLxr7P9h1Xm0LCIzDP3KD9EK9yTU5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9CmPzCLs3EtdJL/meUh/6IxR/0KRqDKdRTK0AssQug=;
 b=ZoNbVzwjV1f29ogqvBbwbnRH13f0HcBHhpunoDXnizFxoo/Z/lk+y2cBU5B2lo7mp4mqHxKyxYiOScqVkjxEux5RmgG2CXPYEvrPRrichNrqpkFdd4SF1zG+QCJag5E3/Z9OFkgdnl6BEzJlkL4O6hYOrFzqfaOcqTympJqz+FnhX0d9dEA/P/2DlR7K0+Gf6wj2pJfl00vUCQT2GUNxW+p9BUgMtqeKV2AQ5EmoGuxaLYoPmY+P3dCt5WM0DVTUHrKpIVs7kQgp46K9USXj7IBfiNXEKBzMDkl8LJptIzZZs5QqfXrZ8qrAKntZtYOPfASev2zwWTDJZWfuloyKTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LV1PR11MB8852.namprd11.prod.outlook.com (2603:10b6:408:2b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Mon, 14 Jul
 2025 14:37:01 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 14:37:00 +0000
Message-ID: <88c4e40c-a94b-4840-881e-ff28bc173d2c@intel.com>
Date: Mon, 14 Jul 2025 20:06:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_kms: Update igt_fit_modes_in_bw to add
 legacy commit check
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>
References: <20250710194643.977386-1-karthik.b.s@intel.com>
 <20151409-d7d7-4517-ad96-8f65d54f749e@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20151409-d7d7-4517-ad96-8f65d54f749e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LV1PR11MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: c5354abb-6e85-4f4a-357e-08ddc2e3e465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGpDeFF4cEtZeWVrWVVXZUZ5eEg5WHYvbDlYVWxlQmlNL1BscVRndTZVRS8z?=
 =?utf-8?B?ZXBCWVErWDNldmJaMkw3djBDdk9SOSs2RG1UQ1RFNFloM0s2WHlSQlB4M3NT?=
 =?utf-8?B?ekovdnVqNE00ZFpxMi9yMmg0Z3JhNkVLOTFrSlE0d01CMkpTOExlK0luNmtD?=
 =?utf-8?B?bkp2aWtqUFN6TVovbjFBWVBDaWVKdkZWVThWRS9VbnBCWVQrekdZcmlYbHJz?=
 =?utf-8?B?Sml4Z0Q3dno3MUtuUS9UbERGaUV5a0RTYVFPbHkvS0xvT1pCWWNqNEoyampK?=
 =?utf-8?B?UHVNMzhHZHVwcTl1MzRWcmxDTEk2RWlpSjNERm93d1FSeUsvVERyMXkyNzdS?=
 =?utf-8?B?V0ZVMU4vTDV2YW1WbS9NNyt6dFBEbGZFYWNrb0t0cDMzbTRRODRuNzc2SERr?=
 =?utf-8?B?bWRLR0h1c09acTJPZDg3ZFluY3FFR1BLV2RxNk5Ia3Y1bncrUDYwSDRIanlO?=
 =?utf-8?B?VGdIQXJab1ZKQW1oczlvVFRtLzVpVW5tUC9vRkFhdDJ4K2FLK3BKSCtWa1Nt?=
 =?utf-8?B?cjBDWWtULzRNUDU1UkQrV0pPNXB5M3lQZnl3SW1XdllrQ1FMbU1lTmlHU1dJ?=
 =?utf-8?B?cjdlcmt3SjNaK2RxamE3aUsvWWo2VnhVUXk5RldSL3piNHhieWtKNVh5UzF3?=
 =?utf-8?B?NldLeCthSXI3bzlESHJEazNQUWVDY0cvdVZWMkh5RWVYb3FFUDdiUldNSk5H?=
 =?utf-8?B?RXZ5cFRzRzljVitsTFFJekl3bFdyaWxhOXBFM3JIQzF5cFRmVUhoVWdnbEJk?=
 =?utf-8?B?S29Kbm1vMDRpUVpvYjg4MXdtaStTTDFsc1Q1c0VXVkNmRFpaY21td091OHp0?=
 =?utf-8?B?dFk5T3ZHODRNN0VjN1IxUnpsL2YyTTIrdWdMSFZwU2RNcktuQ3F4WTV0N3NN?=
 =?utf-8?B?ZW1YajVnYmFqMDE2TnMvRnB2Nm5HOXZvN3FaR0YwZ2tvaC9YZkVCdHA0cmls?=
 =?utf-8?B?RFZhYlNkamRDdFVYWnVLOVlmTnk4ZGZtZ1NETkgyYUNIQlRJdk1IWkhuZDhn?=
 =?utf-8?B?Z0JqRHg4QitvVTJxRGFjcFQrUTBOUWgzMm52bkFYWGg5Vi9tNzBHSU42bGRv?=
 =?utf-8?B?RkRBNStJR05ESVJrSCtITzVjZjQyYlQ3b1Vwc2Y5SUhVcFJnckVvUW8wM2I5?=
 =?utf-8?B?eFhRYTFkTStKRkd0VnFSNHp2SEw4akJNd2QramJnT1dLcEpzMHlNdDRPM253?=
 =?utf-8?B?UVpBZzJCQXpVa1Bmb1BHU25qMDkrSzUvUDczSFFuWmNQbVdMa1lLNkpWbzFa?=
 =?utf-8?B?aExrSmlkT29Da1kwVzhHZzV2anowVlc5QU0rL1ZuSHZ0ZTc2dHdCQjh0MWZh?=
 =?utf-8?B?QmcyaFBRR25pVkNoaTk5RkUyeHpCY3BFQWFuS2hCL0lXeE1laTJKR2Z2amho?=
 =?utf-8?B?QnVxbG5aYStYSmVrKzUwMHpFOXgrdTZadVZzRCtINmY3Z2ZOc1M2VldZTnAx?=
 =?utf-8?B?aStLcXE2aUkyNkdaY1BuUEMvVnlBY2ExWkFwbW5TUE9nNWxpc29CL1hZTmN1?=
 =?utf-8?B?NUZWaENKQVF5TmtTZWIrUmc2b1JteUZxZGdFRXdDVzFJQnJ2Tmd6dTFBeTBv?=
 =?utf-8?B?K3Y2dXprNEJaOE9GcnhuTzB2N0dnY0huc1JadTJFTVZORjFreldsVU42RUVS?=
 =?utf-8?B?Sjk3OFpsUG52M0tobmRrd3YxTDNxTnpJN2o4M3ZyOG9RSVJsVlo2eVRQMDNx?=
 =?utf-8?B?WTd1R1A1bUZsYk01eWVmTEFpMk1iYUVqNkw0dGduMXAzaHhpTUFCamVZRGJk?=
 =?utf-8?B?Uzlnd1BCN2luSmpZTk5PMzFpWUZGaDEzWGcxZFNNMXBIVm5CcjhkMlJFMkZK?=
 =?utf-8?B?dmJ2OFVlOGFQeHB4NU50UzhuTU1ZMFpCa1ZWZmJEdEtROERrdlUyRE5nRHZD?=
 =?utf-8?B?dERMUUpOTTUxNlYvb2F2dzNOclIzUkdpblNNa1k4M1VXUmFoYjZpZEVXZTRG?=
 =?utf-8?Q?TL1hmPYaqEI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cThZbDBlUmt3OVUyUVRzR3NnY0ZWbGNXNExMMXY4ZkNQQWpnaHhkVzBqR25y?=
 =?utf-8?B?MUJ1aGhzS0xrY01ybmIxQWMxck9UOVA2cis0bXY1cTlEM1Z6Vk4wQmFyZzV2?=
 =?utf-8?B?UnhVVUh2MkJqdUdnb2Y0cjlMMXFRVS9iQTY3Tmd4WmgrazcrRFJ3VEZMaFc3?=
 =?utf-8?B?QTdvM2tGODJQQm1rbDZTK0J5aUtGODh0SGVDREZZM3MrTnVQOHlhWVdjV0U4?=
 =?utf-8?B?QnBvZktxSHBBcUNPZE9wVGgyKzF0RmNEekt5RHdvYllJbzU1eTdhQUlXSnJq?=
 =?utf-8?B?M0ZQc3JKSXRtcjcyQWhadWtIdWEzT3ZxdU1WOUh1SXp6VEZIRFBOTEpUS29W?=
 =?utf-8?B?c244QXhMS2V0SkJEL2dLVEtsWllQano5cFl0OXBuc3AwTXJkVWh4VFJ3MzF0?=
 =?utf-8?B?NzIzbmpScXlYOVVvbm41aFE4bkQ3enp4NUMwRTNnb1NsRnhjak5GQjFHK3hq?=
 =?utf-8?B?T2N4QkFqMytYNGRKNWtGMlBSR1BSbnB2MEd4K21UU3NFdk5WRzZpMlZZRm9q?=
 =?utf-8?B?SHZKMWlDZnpwNzFvLzU4MkdqaDFmZHV3ajBsNStsMFU3c1hMSVBHdEcxdTlU?=
 =?utf-8?B?eHluZDdjRW85RFNjL3prMXRGU3FPeHZ3S2VoNER4N3l3NVhQc3NnTEdtYmc2?=
 =?utf-8?B?NHM1allsRkZjdXdHZFBRb2Z6SENQKzRZOE5BcEtueE8vU1Z6WVhMQUNaNHVO?=
 =?utf-8?B?ZHZjMU80MDdObnBVWEJyc2p4ay9BNy80bHBSbmtodW1SWlpTKzc2WFEvcXo3?=
 =?utf-8?B?SjJlMXBaallrYTNZMGROSHFFdHBDb3hZdWVSZjJNcllpYlJuTGE4MzhQcCtu?=
 =?utf-8?B?N0hKV2R5OGZDSmxidkpaSk5sSW56V3NEdzl1bWdiMjMwY3lvdmo3TWZ4M0xa?=
 =?utf-8?B?SnBncVJCZnZUOXZsUXdLbmFqVWxjWExDNDhrUXlOZDdwS2RUUUpWYkVMdDBO?=
 =?utf-8?B?VFQ4bitYb3V5WnZ4MWVGVElITE84b3NQY3ZqbU14MDBEV3lVVVdWL2tPQWxz?=
 =?utf-8?B?WVVuTmhrdmVMcnhQUVBkSU1zRGZHUnRiUHdGN3F3ZDFweFluQ0RmUkZTcEVW?=
 =?utf-8?B?YmRXYTJoMFc1VnMyTWFFeVZlWUc4RkdPaWdVSG95ejQzcXRQSEZObjl0aW5a?=
 =?utf-8?B?b3BnS1NsSVJPNWZ2Y2Y2clJGK1VmQkRJRFRudEhIc1VNMHRZemZKMnZFcmpa?=
 =?utf-8?B?QlRCSWc5RDRQSWpXSWgvN0UrWkhYaTA4YVpvSlduTE5Jcnd2SlZnVTZuMWM3?=
 =?utf-8?B?Ym81ZWxneXBxRVhjbzAwanQ4NUZYTk1HZ0VpU0ptSVE1RFVPamtYQ1lyYnds?=
 =?utf-8?B?RTB1T1BWRGNJdVZuSkhsQ2F1UXE0YmJpNS9GUGYydFY3ZWNHQzJyeWpVMmRh?=
 =?utf-8?B?ZnByVTFJNnp5YTRFVVBYdUtNR1Q1bi9jc3JpTUdxOGVzTldOazNlWjVleGtt?=
 =?utf-8?B?amFCUjBOaG03aGViSzY3bzc0RjNJQmk0dFlrMDIwLzhQSXpiNWZyTmJOYzhR?=
 =?utf-8?B?VG0wSjk0NXhoY3JjOVFLRXdTVExHbHVkeUptK08xcVI0My9mYXR6bmRKaVVK?=
 =?utf-8?B?S3RJM0V2dGhvMmVKUmVBUmd1YXVqTTVneWREZlZQOHIyNUJsSTVjemNTTzNW?=
 =?utf-8?B?Zk01Z0xZSmtQVi84THlGZWRFay9EOFA1L2xLdmFHemwwaHY4bDhuYUJuQTFQ?=
 =?utf-8?B?RVNyczJaRGVpakNnTFY4R1ZQWjJRZ2ZjWlh5TE94bFdBaW52SFMwRFNqQk9B?=
 =?utf-8?B?emFrTGpNb3hRa3NxTE50K1Z0RFhtZWV2TDBaYk1NTkNaRXVhYUs1L2liWHNT?=
 =?utf-8?B?Z3NKOXJhaVhESm1XKzRiN3UyMGg1bnljdWwxaDU2VlY2Uk9Mb2h3WnFydWFm?=
 =?utf-8?B?Nm1oMXAzK3FIUHh3SjhHS2lRYU04NjVNYllyU0ZXbTQyMnVaQ2lwckNmQklW?=
 =?utf-8?B?dUQwc3MxMUFwWGNSSDZ1Ykg4TE85RTVISG1aUXpvcGJqM0lTSktmTGIzK3RO?=
 =?utf-8?B?OXRhODZBY2I1WTBEbHYxcVl1TXhjSFA1TXhDNklGaVNJTFUzdVRnWFVNb2FK?=
 =?utf-8?B?d3RHSHhLNFRxYW82a0JGb3cvd21zUGlORFV2ZXFKb25kRndPSTlMNjRMUTRU?=
 =?utf-8?B?c1N0YmRIaU1XUVE2ejJxKzF2cjI2dC9mb21PZWlqRjQ4ci9OTDhYd3FMWFVL?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5354abb-6e85-4f4a-357e-08ddc2e3e465
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 14:37:00.9290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3Ip1OXbwR+3+wAZknn95Z8pK9a0WXHz/nxgJjedFkLX26PKsApgE423NnE/0he3w8f48mca+PwSAn68spSlGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8852
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

Hi Peter,

On 7/11/2025 1:20 PM, Peter Senna Tschudin wrote:
> Hi Karthik,
>
> On 7/10/2025 9:46 PM, Karthik B S wrote:
>> Currently igt_fit_modes_in_bw is only checking for atomic commit but the
>> igt_override_all_active_output_modes_to_fit_bw function which it is
>> wrapping actually has support for legacy commit as well.
>>
>> To handle this, add support for legacy commit check as well.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   lib/igt_kms.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 84ba1635c..7dee8ab2c 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -5061,9 +5061,13 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
>>   {
>>   	int ret;
>>   
>> -	ret = igt_display_try_commit_atomic(display,
>> -					    DRM_MODE_ATOMIC_TEST_ONLY |
>> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +	if (display->is_atomic)
>> +		ret = igt_display_try_commit_atomic(display,
>> +						    DRM_MODE_ATOMIC_TEST_ONLY |
>> +						    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +	else
>> +		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
>> +
>>   	if (ret != 0) {
>>   		bool found;
>>   
> I guess the function description needs attention. Currently it is "Tries
> atomic TEST_ONLY commit; if it fails, overrides output modes to fit
> bandwidth."
>
> Now that it also tries the COMMIT_LEGACY, what about:
>
> "Attempts to commit the current display configuration. For atomic
> displays, performs an atomic TEST_ONLY commit; for legacy non-atomic
> displays, performs a legacy commit. If the commit fails, attempts to
> override all active output modes to fit within available bandwidth."
Thank you for catching this. Will update this.
>
> Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

Thanks for the rb.

Thanks,
Karthik.B.S
