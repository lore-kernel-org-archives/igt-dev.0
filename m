Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4853CD5BCB
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 11:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5697110E6D8;
	Thu, 13 Nov 2025 11:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YM0NCEoD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6462810E6D8
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763034539; x=1794570539;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Kcd+OoCmv5nPXyWMPZa3LQ7zdH08ILbAeyvlD7qromQ=;
 b=YM0NCEoD03ROHYZZiY6BEK3P7Ke2wiI4NDinpdDjIBkybbEAt+9zBabX
 +60meynj3EpdUZ1KJZLXFtRo+4dXSjPQ2wnJOXEMT0WqCM+YpsTBSb+GN
 p2CVXSftIRyenqBcIiDR1LlGYLwYtHCiaIcfXyrs1p1+ZEFXeTutMtstl
 IbIIBKiuWqeHiFLVmGEv9PbnhzjXj7AyMJLDeH+yPth4SaXJlgpEX+152
 aUU1zzC46UoXl5zNp4Z5skv/h3xCer5xQSPEFIiX4eKoSrqKw6BjCTuMt
 UIyPmypvhpRs2nNQqMYXo9HIGPtbRLDUbNEbPZigsNP2LBZn41MnIsfE/ g==;
X-CSE-ConnectionGUID: mURlgLtURtOovdpRRewwdA==
X-CSE-MsgGUID: yxDtceo0TAaGqAYba/I81g==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64819486"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64819486"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:48:59 -0800
X-CSE-ConnectionGUID: kluNmeQGQxqiuzpMnb8yjw==
X-CSE-MsgGUID: nmWU0LGDRZ63y1LnOSTJiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="193733053"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:48:59 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:48:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 03:48:59 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:48:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMvHsl0GPSUtk4H876R1MEl96k+DiCmiGIK/GDSGUYLSOcpYj8JrRsFPEVGZQwMrBSruhbNkaP9xKdLOkwkswmF/pJucrpBhDiY+cPX1zeESZ4dgywt5yAg3ulQrdpp5Oi+5V9yxofo5wNqJffm7gLqfUo3u9HNKdLF4L/cgQEKwQyff2gArppxO5aLrFT5joNlVGA1oS9w5zqXhNAd7a75Hm7MVxZNSCZFYrVeJdEmSEzRyqVsS3vR3KyId0ZgE63wrU7NYZ6p45PhXzi/nYZxHr91//DXp/fItZXNi76MUqP7W7mOFat4vtF7LMkTcHJ/DaQroZBC47GkKuS6lzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpOZqYZls4rlD7V7kgwLdEjsofFB57zfenwg0OPrKh8=;
 b=lBWVNoWqe753JJ8OWIegcrLeLG6dGnP+zMvaUynuuNK1nZLq9OXi/hqMqQagbtML2n9SkP+fwy45YYpohwNOH/QZU96VzqLc8jn3pjkh+uXlhie2LOLzbchE3RINudaov+Gl+zQktKsBjVAV0g+SkAnoyRodzPv/zPSbazcGHeC9kADYkYQn4XftxjM+HUj5DOVFV+33/N29oQSeuaLl0IfLQqBDTSOzQOKAKv70qmjS3oVDJ/VJU1NVGj3HHOQ/FTFODuag7KjcXppm5AYYXBKFgoRZHYNbDEQYWwUIxZWl+e1EM1BwpN2SBm5hf7BvuJR2sBqVzXHXJYgdyHs9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 11:48:40 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 11:48:40 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 0/5] Redesign of the xe_debugfs test
Date: Thu, 13 Nov 2025 12:46:10 +0100
Message-ID: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0016.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 216bc566-7e13-4d4e-aaf8-08de22aa96a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWpRbmQ2R3BzVG1jblNKNmRnMXhVOTAwbE1IN3QxUkdrUG5VWElJaVRjTTNi?=
 =?utf-8?B?UFpJeVcram5SbWRmTnJLSmhPN2JiV1ZMclpod0ZHQ2tHdzI2Nnk4R1kxRnJE?=
 =?utf-8?B?amFkeW1QU2lvNkIrU3FtYnNJYldBM08wditaQWZ6OVdXdHJiSFRLZmd3YVI1?=
 =?utf-8?B?Y3J5dXBEVm5zbTJ1a3puMzFTWjBOeDd4N0RUQ25VOUNMNnhvU1BmaDZEUlYx?=
 =?utf-8?B?UGh3dllubnMyUi9MRnc0eUMwSHRtSlJFRFVoWHNZc0lrRVRrcThWc1FINThY?=
 =?utf-8?B?cjM1bFI2eGs0U3VlaElidjdTTFovc1BtNlhrNVp1UzA0MHdrSXlDNFhGYVVI?=
 =?utf-8?B?UEQ1TW12cDFUbTdlVEt4ZWw0QXlieXdTRXpmcmZSMFdqVDAxNnFrRzhKNG9I?=
 =?utf-8?B?QjMrdlNwOWNIbGdLeXJuRmJ3SE05SWwvdzdmS0J1Q2hGU0dvemo2Z3lGMmJs?=
 =?utf-8?B?YUN1MnNDL3kzWDJHeTZHMDdERnR6N2VOekpSOVhSTmN2NlhjdlhwN2dUb0Rj?=
 =?utf-8?B?UElnWlF2YXBkdUFuMERqWHJRVGs1ZkpWa0VEb3NQUzlRYVFuaHVQMXBvZnB1?=
 =?utf-8?B?MkNJRXFFSG1HL1poZWpvV3hPbGVuamNIaEJrREZaVndTN2p5TlljKzgwbll4?=
 =?utf-8?B?d1Bpcm9UMmtLSUR6V25yYXgxVTlITkorOEJyUnNqV0E1WlNmMXlJemx3Vzlz?=
 =?utf-8?B?YWNWbWVWcUkvc3M4MGx3cFk2TFViSzhFMnEra3JtKzVaaVBFbm1ZZmRUNTV6?=
 =?utf-8?B?VlViSTBNd0pNbzNCV3hHM2dsa0tNQnlZS1N4QzY0RzFzQ0xtQ1BJZ1QyTmlj?=
 =?utf-8?B?YkFKZGJJdEx4d3BLU2hnV3dZMTFVZmdkbDFOVWorZVVRWGlCcm5zMlRLZkRE?=
 =?utf-8?B?YjJ4QzcreWZQV3MrdUx3MTdqa2h2T3RTRnJnckhMYVpFTkJoUVdZclRWS3cz?=
 =?utf-8?B?bGROaVNpZFcvL2hhbzRDNDJjM0dsc1lyejVvaGlEYndZeDRmU2wzTzFoVkVZ?=
 =?utf-8?B?N0hrcjI0Vmc3RnpCNjc5cFJ5RXZBREFFSlFPV2tBeDZpNHZXY2dvbkN4d05C?=
 =?utf-8?B?ZGxVSnJZdWhyZWVvS1lIVkhuNWdIYkQ2Q3BJYW5vdk9uZlNiaVN2SWRKWnJV?=
 =?utf-8?B?K2pjUS8vT2hLdFVXeER3QWlIWTNDQVBpM3FoYkowQnlBNU5Nb3hiWUh3OFM0?=
 =?utf-8?B?MWtIM2hLQkxKNFMvK0cwamllM1VPd25IVms0bkx4UWxHdzdKak5YTlBaQ2dX?=
 =?utf-8?B?UU1FQmJ6aUtZSnkxS3JHUWo4N1cvYStTNHcwcjBDUUszUnd2a05WUnRsdXgv?=
 =?utf-8?B?bVFhaDI2VlYvWWZmNEhZbXFGelBMYkhPRUptakZKb0ZrUGRPMGFpMmdIVWdq?=
 =?utf-8?B?QXBEUkVpWVZLWkcwZ2pZazIxY2hBVml6RHlFby9JbTUzbVRtUGNDeHRUWXNk?=
 =?utf-8?B?d1UrRmtSVkVJZjYyTHg2Qnp1UzBhQ2UvR0h5cWRhSFk2ZGZsMklkQjlDay85?=
 =?utf-8?B?a1RCcWtod0MzRXM3clppcmZDYVNDUlJwNXcwRm1wczdBRlYybklaaHE1R1BL?=
 =?utf-8?B?Q0xYYnRDNGc1ZGpmam12MGF1bHB5akllUi9QaTEzMjZodGdBaXE4MW83bEYv?=
 =?utf-8?B?U2pMWWMvTnIrc0MvbmlXS004RkkxcmFYY1Fub3VNV2Ftd0I3U0cyUGNJVVNx?=
 =?utf-8?B?SEhqZExrYVNVV0M5RTZwaGZ6aUdCbHJ6OXVaaHNmK2JGbDBKaG9EUFVaTklz?=
 =?utf-8?B?L2NmcmVGTU5xK0tQVDRPVlNxVDdHSVZBS2h5WUV1Nm52WC9HNjFZQnBLNm5L?=
 =?utf-8?B?cmdpOStNYndqVVZCZklBaHQxVUlRNWhKL2grVFQvbGFRVDFxN3VJWjFkaDZP?=
 =?utf-8?B?WWNOSlRuYURBQ2pQeHMzYjI1V21lZUtFYi9FdURucTNualE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVljeXNkZkVvRlV5Y3p1QVM3NGRBS1BERWFMMFFJc2pmSTlnV20yandIbUZ6?=
 =?utf-8?B?dFFsa3RPUVhRdzlvcUlFV2R5UTBjUmtibytQc05Lb1FKSHlBSnJFcWxRU3RD?=
 =?utf-8?B?R3dMS214T0VGd3Jqdm04YS9xREtLVTYvb1ZFa2pxK1d3KzJoRFVTSmVhZktw?=
 =?utf-8?B?b21XbXRJckYyUSs3cUxweGVMTGlLdEVlSy9IM3lPQTBCM1VON2E2S3JXRCtj?=
 =?utf-8?B?WTM1bGgwblVvTjN6TnJkMVhsczUyR0pZTSt2YWMwZWY1SlpJS2U2dUlZWGVR?=
 =?utf-8?B?eGRvVHh4UUhJUkhSWGhIWFBTc1ZSM1NEbHFKaENjVVptYVZ3QzNiYUFPS21h?=
 =?utf-8?B?V0x3QnN0SkszVW5vdFp3aXRORlVxNlJsR09BUm9rMmxZanRpRnV2a0x2QzMr?=
 =?utf-8?B?V2cxR1l0dE1vOXIvclYxN3RFcnU1N2pvbk5rZmRlRFhSSmpNZlNOVWVYYWZS?=
 =?utf-8?B?bEtwS1N1QUJTbGFNbDAxM3hSeU1RYTRmUlVDTjJMNWM4TmtrdjRFWnMyL0dq?=
 =?utf-8?B?VmpvNW9BWFJiK0N2K1dYVjNNKzAvYlRsUUxWNmRIeXkvSEtNRkF0bmRIQkVP?=
 =?utf-8?B?emtJdzdPK2NSbVgvbFBwY3o2bndpT2orUUdGeUZpaHl6bm1TYzMvMkxOMUVh?=
 =?utf-8?B?RkV1NzVZMkJ1U2ZPTmNkekVTZnk5UXRCZXRjQ3BiRmVNNVJzVGZ4SG5lTXFx?=
 =?utf-8?B?cGZSWVM2R2xvcU40NGtaWC8vRnVNRnVHTnUxeDlqMFNXcy8vQ3Y3TS8vaVdJ?=
 =?utf-8?B?dkJvSU5SK1g1WHMxNVZSMWxwZGZ0YWxtWElZTDhUVE9zTTVqNklYYW9wMHRE?=
 =?utf-8?B?aGY3dnYycmZPTkZSWCtsZDUzSXNQTzFRREJFRzhsZWR1ekMxRWliNXR1d0FZ?=
 =?utf-8?B?WHhrSGhNeGJRMUZDaGdZUElnbU4zSnBiUlVTNFlQTk95Q3JWUWVmY3hGN1J5?=
 =?utf-8?B?Z2ZtSDJkQnBPT2N6dTc0aEdQY2hOaWlDV09udTRmWlBzcmFLZzBNTGZpOUpm?=
 =?utf-8?B?SnA5VWQyaFJ2NTZRWG9COWk2eVBaUWc5MXlHanlyMjFPVnpZaUlJM2hhaEc4?=
 =?utf-8?B?d1FJdHBhTkdJMTFoeTg0WElKaU1BTktzQS9vV0dURDVEek9zVXFsUkx0TWlZ?=
 =?utf-8?B?QUlFRnl4dFJicGg2Q25YSHN2Mk9GTXByTlErQ0x2dm02eGFXYmUyNWFETVhi?=
 =?utf-8?B?SFBqa3dpYmhveHJtcTV3blVicitzMVc3UTNLYVZ5SnpIbm1naFhrY29HQVcx?=
 =?utf-8?B?cDR5a2pSMGxLUjZJWjJOTzlPZXVHUGdyZ3lEbHRBRGxadG1PcGRNWHZMakh0?=
 =?utf-8?B?T3JldUwvdHhzelB4Y0NKZUlNU1NtUlFuSnJPNnlaWUlrQkwrWnZVcnJsU2NQ?=
 =?utf-8?B?ZnRKOFZUTjFsOHIvVXhCYUhocUF5WnVVTGlHbU9SNGJHYnpoeXE4VzB0dXdo?=
 =?utf-8?B?Rm96U0d2MWViWFZmazRERUVwWjJRUVRLSXhpOFY3aGQ1UGo2TXZTeVFOa0Iw?=
 =?utf-8?B?cDVhcHlPS09rMm1qb25pZ3J0WFlLUUwrZzJRQ0M4aWIxc05xb3ZaWkNIQ0Zk?=
 =?utf-8?B?RzZwUmxHcHZBcm9GVXBabDlWZVlxOWRlVmhBZWI2VHVnaFJVWGZ5S2hEUDVH?=
 =?utf-8?B?VzI1a0JXaHU5OE1UNzdiQTFUVlNGa05uWGJBaFVURnlYZ1ljQ1A2TEdjWUlG?=
 =?utf-8?B?YytEOXJjYW5zMm5PdUhrV1NWdy9LdEFBSVFnUi9xbkJOdUhpdjkrdGZQb1cw?=
 =?utf-8?B?QW1KWVFsZ3hReE5xdkdHZVE4VVBmSDlYQmFIYUxvN3F2OW9MY1RqNUxXK1hL?=
 =?utf-8?B?VytQd1NWTW4xYVRtYXZCZmNwTUptMmNaNUViMmNnY0xuV1RzbnhNNno5ZG9l?=
 =?utf-8?B?dGYwUDRuYngvRHVSTkhUaTQrNnZxam51dkRabTZxeFVFOGFFZUNSZmM3R1VP?=
 =?utf-8?B?MG1wZzFXbnNzVkV3R3R4MitzT3NabU9XaWxZQnY3Z0Njak9sUkorN0lyVE1j?=
 =?utf-8?B?amdKb3dXQmt5dFJFbUNLdEYxMHBmQjVxT0F4VEplSDJKK3d2RU5uQmJpS0pH?=
 =?utf-8?B?OW00KzJBZ1UzRklBZ3lFeFN1MUhmYjd4MEhmQXJGK0FoSFNiVkEvNmo3bTNn?=
 =?utf-8?B?ZEdQUHBuakQzQ09TL1BkZnRJVUJOdENNdFVlTkUycUxwT3pWYW9Vb085Rmxw?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 216bc566-7e13-4d4e-aaf8-08de22aa96a1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 11:48:40.1672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTSJAhI9CK/jGJZyA04ZSovvacRg+8BuSvESOHm/+gO8Pc+GZzsWxczjD07Hj6tTeotgzEAybVi79QeDFGRuIk3V8C9dmFNlvKgRHYPGSyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

As part of the work on patch [1], it became necessary to update the
xe_debugfs test to account for the new debugfs structure. However,
while reviewing the test, I concluded that a broader redesign would make
the test easier to maintain, extend, and adapt to future debugfs changes.

As part of this redesign, I propose replacing the old subtests with a new,
clearer layout. Instead of the previous subtests:
xe-base — validate debugfs root directory and check the contents of the info file
xe-forcewake — check the forcewake node
the new subtests would be:
root-dir — validate the debugfs root directory
tile-dir — validate the debugfs directory for each tile
info-read — validate the contents of the info file

The new subtests rely on a table-driven approach: all expected debugfs
nodes are defined in an array. This allows both conditional tests
(e.g., testing vram_mm only when VRAM is available) and dynamically
generated nodes (e.g., gt%u based on gt_mask, or tile%u based on
tile_mask).

[1]: https://patchwork.freedesktop.org/series/157089/

Piotr Piórkowski (5):
  lib/igt_dir: Allow scanning only the current directory
  lib/debugfs: Add debugfs helpers to open tile directory
  tests/intel/debugfs: Rewrite tests to use array-based required debugfs
    file lists
  tests/intel/debugfs: Add tile-dir subtest for per-tile debugfs
    validation
  tests/intel/debugfs: Move VRAM MM checks from root to tile-dir
    validation

 lib/igt_debugfs.c        |  32 +++
 lib/igt_debugfs.h        |   1 +
 lib/igt_dir.c            |   1 -
 tests/intel/xe_debugfs.c | 419 +++++++++++++++++++++++++++++----------
 4 files changed, 351 insertions(+), 102 deletions(-)

-- 
2.34.1

