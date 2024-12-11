Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBB9E77180
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 01:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5390810E0A6;
	Wed, 11 Dec 2024 01:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gg/sDvVu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F9F10E0A6
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 01:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733882231; x=1765418231;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gi52W5rbS8anY2Xfs37c74sUntMqgqOplqq0VWcqKks=;
 b=gg/sDvVuXR6r6kbIzofhrFmz9UoQr6BRj4DC8Rk6PARuB4N2P/DJD71P
 HtQsNSXrXItxFgxabcJqkTBGEDzo46qaqM5hVMX4+1HmFT8nCaWnke8jJ
 7J8XQtu2bq9AAybX0f49WUPmG8KAZt5wEbMb8tXcyjLChqYMZ94q57yFF
 p2zkA6+W7TKaxC02Rp51VTBZ3GaTXFDu8tVFjTPIJRWXm4/qPe9mTUCJ1
 1RQqbxGBBZyFItmLdFckUydhab9PwoYp2LgfFf2NNXQWeN6BtSW8NHo1n
 myWUpIvCJqls0Ts8H8kOCmf2NqzF0WzyloUXMiDiHP57f6+7yO6G93Rli w==;
X-CSE-ConnectionGUID: QkGcAnfGSDmteLRmNcZpcA==
X-CSE-MsgGUID: lR46ZJaHReKti/UwJr7Fkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44857149"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44857149"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 17:57:11 -0800
X-CSE-ConnectionGUID: I+hb4xQKTuOustmN5XapfA==
X-CSE-MsgGUID: mKlhFu4MTMKZp/3GIiLG9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133012896"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 17:57:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 17:57:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 17:57:10 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 17:57:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czMGinTpuHzTTwB12fSeilviNPDGYxLrKouSSzz9zCropgU7bUkjrl9BBIY6Yie0MyiB54FMjRRokE2E/9Q7nbDFbFkCH0MSMuFRlIWrNQqbh80eI1YL3ec871UYvhENyc/fUJFY6tHtw0Ihhd8ZTX9nU6E5/NSE4/QO6zeHVqzbGrwyl6XlYZuoC8Hmd1UIhxrohMz9PE5EH7/jAiXRMzej8yrjAOFMdw2VykQriCyurUgXdLxWpZSWd+Q+YeyssWVMbE4zpZ1tDuDQW5c3aGYKDgTDLbPJPv2XZ3nhXHY8mNlDs+nCQhemkJ3rWwIj5TWhbu8SBoXA9jrPdZGSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvxmzW/rxkav8VNVooKIQxMMgkzNQb+EFqlylNhrhw4=;
 b=FL9a85YTV2YB8NWIeSyXUMwwoHB5PiQRdilyEsNlAtnn9O6BHqiaouk61gmpPg5llpse5P4me9uhKdlPONgGcEwhTWhUqWWSPFsquradjhrAKOkW18ZcPuD3cwsG7eIHvtrb8M+BWYj4pqvOCAMN80pXOMhN2S+VhZ6CHACUdmVycdyKJmYVP6rk6evso01vOIFGH02tUxN78Ik1zfUK/Dusa1ZEonIWqwj+/wEg4awTFswVEQ8jx1Xvlht+nxSuVw9ImxbObb4HlFqQk/CmuvtdNQtoOEc9KcJXhmyoDH+3GY1NDDm1pwT29hAf17/XKo/cuzxNFFp4bfCFuZ39tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 11 Dec
 2024 01:56:34 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%4]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 01:56:34 +0000
Message-ID: <c347987a-6424-410d-ab1b-40eaf5cd1393@intel.com>
Date: Wed, 11 Dec 2024 07:26:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms_async_flips: Only check joiner mode on intel
 device
To: <george.zhang@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, <alex.hung@amd.com>
References: <20241210223903.954518-1-george.zhang@amd.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241210223903.954518-1-george.zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::24) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|MW4PR11MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b235a97-e5a2-442d-70bd-08dd19870a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VitmVFVxNnVjcDlETFk4c1gvaVdnRVR1UVdpaE00b2JDNXp6VWZvMVdjRnhu?=
 =?utf-8?B?SVNCRFFwWnZLU016TVlkM1NxQlJxUXcxQk1FbklLRzlZdFBHdkg5cklzUkZT?=
 =?utf-8?B?enBlTzVoVFFQcnIzV29tZkpXajJGTUVnek8yREMvU2dtdEtsSDJqTXVsd2dN?=
 =?utf-8?B?b3VPdEUvMk5aWDd6WS9GRzF3dnZoZUhaK09EN3hwMlZwZXE4andBRytGODg2?=
 =?utf-8?B?bkQvTWxjK3BTcmJtcWFmUEJFYmQ4bEFRNWxGMHRRSTE2SkswYmlOVys0NE9H?=
 =?utf-8?B?UHZnZlpoV1VJbGtMdnVOWUJmbDBDb3AzOXY2WlVTVU51TG4yZWZTR3BCZFJl?=
 =?utf-8?B?REQ1Z2EvdlBKWXE4UnJOaU9wS2wyK25UUVFoMFJEeWZFeWh5ZkQ1clZ5VUJG?=
 =?utf-8?B?WWdHZDk4SDBaQ1AwZlFrSUplS1hmRTVabVJSeU9qT2FUNHZRRW1nRC81MFF2?=
 =?utf-8?B?dXZrUzE0YUtMZDV4UEF5TExJdTVzY1FUa3FiRXpSenRkSUxOU2F3eVFVbEpK?=
 =?utf-8?B?MThpZEJxKzZTblFKWXFzRHB6K2lmVEdXdVMrRDBzVjI3RDVBcDFaK2NmUVdy?=
 =?utf-8?B?aENoRHd6alo5ZE5Ub0Q3TEpzeThqVUlwNFdaMXh0aGdyR2tNVTVac3lVYW85?=
 =?utf-8?B?elRiZUNhQ1hqNE5LRllPRHVTZ3N0M2NNbHFmblVNTUM0TksxSzlDTWRZaVhk?=
 =?utf-8?B?M05SemIvMjkrbXBTaDdMd3J6YzZyS0w1NUx5dmVXeWM3REtnYUxWaTlOd0Nq?=
 =?utf-8?B?RFJMYThLd2tnYk9iS3g5WkFTZ0VSM0ZuV1J2cWc3cU5LdTRjSXZJY1BiRytC?=
 =?utf-8?B?aUY2TTNGaTQ0c2xsZ1lQaU9iQmpWSVlDR0FOUDlRS0tyeGNDL0hLbW81M2Rj?=
 =?utf-8?B?cTdlaDh3cFRySHRyN0F3dzNzWlRqTE5OcXFyYldocVVnTWpzOEtNQ0pxVVA2?=
 =?utf-8?B?OW9vL1pReU9PSlRZSktvSE1WRHQ4OGhJejFMaVVLRHVNMWM1R2R0M1N1Yndj?=
 =?utf-8?B?YTc4WkJUUG93eUpmenBWU3B3MTVpTVZXelpWbWpqVG1kQnlZWENHbXlFQ1do?=
 =?utf-8?B?dFZOWDUxcWo4eHJGeUh1WHl6azNDcS9TdkJOUGRWakg5S0ZONUdHYjdjbFkv?=
 =?utf-8?B?aE1OVXdOZTJXZ0V0c1B2RHVaSWc0TFBqbG53eUxtR0ZRbVhpYk9hVGZUWTBw?=
 =?utf-8?B?VTk3eWpYVU5LODdUWWI4Nkppb1V3R09vdHBDeVl6dEpvY0lrMndRRDBXMGxW?=
 =?utf-8?B?bGtRY3NPSmVJbmxVQ2JHdlFiazB4UEE2SVg3YmhQcFlHWThrRE1OTkg1ZHFm?=
 =?utf-8?B?c09vd3c2NWNIcXNUTm4xeVQxSUhYN01JL1V2NWxLZ2R5aHFnd0ZhZjdINjJB?=
 =?utf-8?B?RnFtWmkvYytYZk1xTmpTV0Z4VFBJZTcrTW56bU8xM2JJR0xac3ZFRG9aOVQ3?=
 =?utf-8?B?TTA4MmYrSWdjanZ0VWUzNitXT2xJMHZJejRBM2ZESnoxUlZwOW5nQlFQMS9Z?=
 =?utf-8?B?VUFrUkVWWXBNbHZmaGl1YnRPckdMUFNVQmZNQ3NFb25tOTRFUUxETkI0aU0z?=
 =?utf-8?B?Y21RL1cza2U3VDdMRGJuSGkxUVBQVk8zcXk0MzNwOEN2NUtwYktTSlBsc0Nh?=
 =?utf-8?B?RVBZMXVtN0tkSTd1UW00MGRwbWJWM1J6Z0JOMlBrclQvSXBndHlsbXJSYWtH?=
 =?utf-8?B?L2VPREZJbVQ5M0c5T2dGcWkrQlkxL0JCL3YvdVdkbVRFeFZKQnpkcjc4QTl4?=
 =?utf-8?B?WkQyOExiMXNGSHlJVVlUY3ZxTSsraUUzQ1hkMHF6WTFnVUxyRXdTWFpvTnVO?=
 =?utf-8?B?ZXoxOWlRU0w5WmJDTERRUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWZuTXNZSitiMy9wYTdYUE1sb2lJYkZ1Q1JTVk5XMzcrRWZFUHdCVU45ejVS?=
 =?utf-8?B?SXY0M09QaFFmanJuV1VmUld1TDM5ZnI4eWd2dEVoNmx1Wi8yVkR5elE1VDZm?=
 =?utf-8?B?YzJvTG5FTER5TUVRK21JY2lvcDZva2ZrbERxRVpoeTdYSGdic29rNWR1Y2tH?=
 =?utf-8?B?RlUreEZvaE1qUDBhNGxSdjRTeWZLdnlXdGRBVjM4RC9EU1VqWVQ4VG13Vk52?=
 =?utf-8?B?S1FMeW9sOGRnaUR4S0RSbGtiVUd3VG9xdElQWEs3cjZzRU9XLzN1eVBmeG51?=
 =?utf-8?B?MVQzV05OUXJuaWQ5ZHpYYzN6YTRjTFg1Rmo1U1lqUXpBQXVnSEhEUklpSUtn?=
 =?utf-8?B?SVpLRVpIUFREWGxPQWpHZVJmM2YraGdLd2Q0QzJUSGM2cjFsbm96NlFuVGxB?=
 =?utf-8?B?ZE1hbGQyN0FxV0I0QVpCeDdWZ0F3UTN2eWJmTUs4WEtFUTdIZDhtN2RHT3Zt?=
 =?utf-8?B?MHAwWkV2eTVxcCs2cytBSW0wRldxZVNwTndKSThiYW1SSTc3blM3eHFaa0NJ?=
 =?utf-8?B?eGd1UUZUdkpoOVloYWJRRVJpQWVIS3lWSFJTaUJ0amU3aUhmK1hxb2xvYi9u?=
 =?utf-8?B?bU4ySXU4dW1xMTlkOVd2VGVDQXVQSzdkekluNWVlT1lNR2h6Z3o4cVREZFVB?=
 =?utf-8?B?cDgxRmRUZ2dHbU50ZVlPZU9qSUVwRUNzRVRic09xOUdkSUNTZGVUOGZuV2cv?=
 =?utf-8?B?bkxUVmp1RnVodk4rVVgzUWRSblJNTVpweldxc2kwV2ZNNWhPL2dUbDZlcmRM?=
 =?utf-8?B?cFRDYXBzUmhlTGxZdDEvd2pydS8vRUx5Tk5mUHpUOGVGc0NhWkVuU3ZMRTdJ?=
 =?utf-8?B?Y0xlWHh5UzJWSmhLR2V3NFF6ckEvblhGYkkwQXBnR0QyV05hTVBZanJLcVpU?=
 =?utf-8?B?b3BPSk1XWXFPREVjM25FVy9iUURxZzJXZXJFWXZTRWNEaEdoZnR3OTNURDl6?=
 =?utf-8?B?QTBsK3JCdUNDeklSS285NTBTMUxvTzVqTUN6SDBrc2JETDczZkQ3OC9mbDNv?=
 =?utf-8?B?K0h2aEIyeUYwVzVaa3NPS3d3RGVzdm9VcUhrazlXaXI4bDNUeEZZMG42N0xV?=
 =?utf-8?B?eTR1eTB4SGZraDFzRXF4bmlSa254bGEvMDdqdnA0RmlsUVhwdENJQW5jbzYr?=
 =?utf-8?B?Qys2K1ZFcWtIZ1RxZGQxUTl1Qkw1ZUFGQ1Vtb1NwWjdlNkhWRXZKbGhjVWk2?=
 =?utf-8?B?aWZ2NGZUV1czN2ZDeXpwLzc4R3Y1TTduRDVhRTJSbXQ1b1dIM0lXdGpQTVBB?=
 =?utf-8?B?OFhoK1RaamhFbUdPMWowaWhzdUs2VndOdklCMmdWbDRLZXBCcnFwUytYVWdh?=
 =?utf-8?B?MU03NW9yM2Eyck14TWY2SG1vSFMwL0tWYlpjalJnU1BnL211b2lpcGRDaksw?=
 =?utf-8?B?QitIbjJXVFp4Nk54V0lMem5ZVCttR3JEZ2h1MGJYQlMzdTJObTFzQ3NRMGp3?=
 =?utf-8?B?aU1VNlJKdmxvQkN3TUxRODRqQ0NEVUFsWmhMRFVOSzhEMEh1SW1sR2ptdnhU?=
 =?utf-8?B?WHMwNWlTRHdocFdCWExRYXRoZm9VY3Aza3RicDRHbVZIV3Y1VDdZUFJSNC8w?=
 =?utf-8?B?bGkrN0s5ZnkwMmxZUG5zTTU3cWJRUzVzK1l2ZXU5cUVzcTByMWVZcDVFTEJY?=
 =?utf-8?B?aEJRVDJ2R0RQZlFSWTVxWG9oeEhOK25Na240VzlPTi93V0poSThPcmVrVGRu?=
 =?utf-8?B?MHVWM0psSlhBOXlsU3hXMW90aC9GcFZMdkNmZzNzZVg3VWxGZDd1U2RhbFJS?=
 =?utf-8?B?ZGlNazY3N3BDR3UrRmd2cUVPdW5KeHcvQjZkUC9Zc3VFT1dzRzgwd1NJMXdD?=
 =?utf-8?B?b0laN2dJcHgyajNZMVlpdXAvcVFRdEVkaVhCT2t6VUx6TFdYVTlDemFrczNX?=
 =?utf-8?B?UTVxa0xpdHBMbWZzT0ErYmZwbkpic2VVYWZ2YXBjeDhHVThuaG92NTNocG9n?=
 =?utf-8?B?eEEySFh4aDFqM0Q0NGFwRll1dGFWanhKWVJiVjVCc2dBSzZ6SnNJeURrdUwx?=
 =?utf-8?B?V290VFBvY2lSempGVDNTTlBENlB6R1pyamsrVkpmanJnblhxSjBTb0pVYW9U?=
 =?utf-8?B?ajU4dy9OdERSbHV3a0xyUFBlUVJyYVhHdTdpamZ0UTRRNGtWUDNGM2wzVnFG?=
 =?utf-8?B?TVR4UGF5eE1Fb0FmT1QxeG52bTJjblRWTG1nVXdyRzZNNE5VSGJxN0RDeEU3?=
 =?utf-8?Q?t7aSjw/FH0JbGhDZs7zU28c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b235a97-e5a2-442d-70bd-08dd19870a25
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 01:56:34.1644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tD1SdKS5dXqbrMdkCVMqimj82Ud7T8Ga2HbDHPvSwWsPX+gA4j17SyVjPog07DmFitrTNw1QNlkxiigenVjkII6rt9fTHCMZAfMlH9YxKVUNAl9PcW5bwqLH8FrJrv9t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5823
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

Hi George Zhang,

Changes LGTM.

On 11-12-2024 04:09, george.zhang@amd.com wrote:
> From: George Zhang <george.zhang@amd.com>
> 
> The joiner mode check causes the kms_async_flip tests to fail on
> non-intel devices. Added a guard to only check the joiner mode if
> running on intel device.
> 
> v2: Moved guard to within is_joiner_mode function
> 
> Signed-off-by: George Zhang <george.zhang@amd.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   lib/igt_kms.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 43ca2d4c2..3d061abc5 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6467,6 +6467,9 @@ bool is_joiner_mode(int drm_fd, igt_output_t *output)
>   	int max_dotclock;
>   	drmModeModeInfo mode;
>   
> +        if (!is_intel_device(drm_fd))
> +                return false;
> +
>   	max_dotclock = igt_get_max_dotclock(drm_fd);
>   	is_joiner = bigjoiner_mode_found(drm_fd,
>   					 output->config.connector,

