Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B64C77B7F
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 09:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9030910E996;
	Fri, 27 Jun 2025 09:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOuEbQhn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7991610E996
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751016359; x=1782552359;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s21f8H+IgAf5cjHCyIIUutkQ1pHIUYv0w6Yo4BhycNc=;
 b=EOuEbQhnx5kSHdUqroiQNmI9xT+xiAsmoi5752lOQgS3BnLg01g8HyNv
 1mhgL6anoahae8ELVJJgAco+TaM+R9vIsmKX+vijJVDqyVFVkcFKDHzFJ
 c6R4dBFr2UUynnmCmOt2TotbOH2+c0lb8rmkCUqCRN11cKkcLaW7N9Sy+
 RIgQkWWuHWciAHJAyOXPM1mS76aIWBf3isIhuzn16Cge1GaHd73btW/IQ
 4l3wmV5CQxyNNoKbCMbQzxNm5iXLjOlMEDxGFOa58HieER/oZXAmum0jg
 KGEfhjyKC0NiE/TpAWDynl2Lv8G1ebfRIUnT9U/DyML0TtROJGdH/e6p2 Q==;
X-CSE-ConnectionGUID: OrMztY1sTU2WJfoi6IqyBw==
X-CSE-MsgGUID: IMMXi0MDS1CgXrYbGo4vDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="78766510"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="78766510"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 02:25:58 -0700
X-CSE-ConnectionGUID: JdySEC9VQD2AUpIKyx1yZg==
X-CSE-MsgGUID: IKgrxdOMQEaAHO5LS+MY5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="158239511"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 02:25:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 02:25:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 02:25:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.60)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 02:25:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlbxeLk8sjQhNnizR03Bn34DGOpTKBnVP0QCw/YPS5AzhwjtUejzskOoHClH7uc4rn9BXEigwUaORgjoJj4wPmX2YeHXjoGPXjWxvKZwibK1gFxj4gJBrK/LQlnWfahNHdbbHnsjLdZpUcMZ7e1YvfSJUZUor7aLk1f7q8C3r9aXcmnZ9qy85F5FZtQz6TMSVPxsQ328kH2pD3oe6YJixz2l5ssuHEcMeP7mSjp6i1Dbz1baKIxVN8njNryXbrPxVk9r+8RoAjOhqTgdxzLvJzGZLLkaKbYJ5ruxeiSoEoW1qCrIUIIULpw6cwIKcBOHebutk/bIRpkP/5tewOPY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zPNkU8s00EcnsccUWQYvQG/wX/2GW+Pg1ikDASeihA=;
 b=Mx7IBN19+SSnhB1edD0uysnkLYX17re8Eu5CeXdPheJkPD1JyVKwrq9jw3r8MlxpBuj6qOO+OV7AANv2BAn16HxzF2W4TAeEJEJYtZK4/LcFSMfKSAVW8DS5+D1y56TSn42O104YYa2NKlhyFWzcLfCGi1ua/OSoR3YJkgMgUnpt8wTu0AKP+826C4W9BE7CciqTIIj+si2dSnlRrsfD2dsrg2uzjc/JZpakBqzCNlOWPQgALRMBfRlTKEc/Uc87oFkTSqJEVUfqMba48/p0rn1HUGMYn6I7+aZhfWohkPCNldR6OcI+ZJ22muEHkBFFcKqrfKGlFanouekkvty+xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ2PR11MB7455.namprd11.prod.outlook.com (2603:10b6:a03:4cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 27 Jun
 2025 09:25:53 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8880.024; Fri, 27 Jun 2025
 09:25:53 +0000
Message-ID: <1e9f1bc2-682f-413d-aff2-6ff4d8413619@intel.com>
Date: Fri, 27 Jun 2025 14:55:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_async_flips: Fix compilation warning
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>, "Chaitanya
 Kumar Borah" <chaitanya.kumar.borah@intel.com>
References: <20250627091128.64951-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250627091128.64951-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ2PR11MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: d637690e-7087-4c29-d1fc-08ddb55c9cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MndHcjhxbllxQzh0eU56a1hSbUFEdXFRRjZGT0hmTENSY25vbnVOaC9Fd0I0?=
 =?utf-8?B?S2RWdTdaUFBMdjJ1RCtrMW1TSVZ2TS9WSWJDQ2pydXJ3bWw0QkZrMzZ2dDly?=
 =?utf-8?B?TTN3UFBGcHRjUUlQZXpLK0JyQW4rckx6WUdxSnUrOUtpZjRoRWVWejVqYzVM?=
 =?utf-8?B?QmR2RSt6WnVHUmRjcDZnU1FNS2ZLMHMrNG1GN2VLVDc3a0NFRmdHcENXZTZa?=
 =?utf-8?B?VFVrSHNkSmhkYng4Y3B2c24vNkx3b2hNZldSWFpwWEtVOWMyZHdoS1RnWmFv?=
 =?utf-8?B?b0VDK1N1OXYzTitxVVkzYW45QWRXM3RpV1RYRi9IaFkyNmRicjk2RTZqQWZW?=
 =?utf-8?B?S0NiUlc5cWtRWTNhZVNhNlp1UXlDTkJDVUpxeFpST1JjMVpIU2Q5QUU3bDZi?=
 =?utf-8?B?d3g3b3Z3Y0ZUVDRyUnEvdWNJQ2pwWnJSNEwwRHRoeHhSRlVqdjBRVEdTdndB?=
 =?utf-8?B?a2ZpUFlRdVRLVDF1bVNnc2Z2NjAzWjk1LytmWjlMVFRYRjRlZENjU0R0cS9q?=
 =?utf-8?B?Zi9tREJDZmV0TlFRZGx6RCtLVGxkWkxab3ZuLzJ1YkxKcWNMU3VyN2xud3ky?=
 =?utf-8?B?d29DdVFtcE84VVkzRjE2MjB4VFV0K0lzdjdTMVhCck11eWlwQjVFbllmNEx4?=
 =?utf-8?B?TjRvTERpUWQ3QnUyRlFsRFhaWTBlVG11eHJabU5wbnk3MnY5NGtveHhKanpC?=
 =?utf-8?B?a0M5bHNkR1FvRkF1Wm1zc3pMd0FVdUlPeU5tcW1xVFhTY2pUS2J0dzZ5bklv?=
 =?utf-8?B?N1FYMDN1SmZkdVpSUWwzU3laTkFQWkpHdllMK2I3NlZGVFpBbkRVQVRnQ3VT?=
 =?utf-8?B?dlRxVERHWit1c0RkM1gybkp6MjBydC9MQTBQWk1pZXowc2lGb3VjTTdQWEJ4?=
 =?utf-8?B?SkFaYWFwcElqR3YySjVIRkdacGpBR283NWFmWDNFV1BuRUIvT0duT2RHM09q?=
 =?utf-8?B?QlZRemNyUVc0eUNaYVlvU05LdER5VFNnTXBnWE9CZmdwdmI1Q0lzZDRLNHcy?=
 =?utf-8?B?VGwvcFNocUhjcTdGUnJLc1J6RldDUEJiUGcyVnJxZGZ1WVRvd0g4aGJ5ZTVV?=
 =?utf-8?B?d2VHRFNWeE8zSktKbjNhdjRVYmVZUExPNjBqZjlQSVRNNXFCM2VidTVzeWlR?=
 =?utf-8?B?ZmU5SzRLV0JIcHJ5aW5VTHV4Tm5VdDZoekh2VllBOElneE1Ybm4zQ0s1eUNy?=
 =?utf-8?B?SURDU0pzc2xGQ3RDR25oRWhST3p6VDFMbEppRUY5S1pEZjFvbWp5cldGaGxZ?=
 =?utf-8?B?SG1GNmVCNkYvUko3R1VFNzR5MjRuQm9Mdy9TRjltRHVad0NyWkZBQUpkc24w?=
 =?utf-8?B?em0vbG1zUjFVQ1JFeUxlRkl3QVAvb0ZhTktId2RQbmVSWDBOY0Q1UEVxNGRy?=
 =?utf-8?B?d0djMTJaNVdnSWxyeko2Vlh2UDdyRTFHM05xQVBDd2tkL3YveEY5VGRlbklh?=
 =?utf-8?B?SjdYN3VCQVBLbzFJWUJpTlFIeFkrNmxWZVJmWWl1ZlBWTUxucXVNWk9nYTZL?=
 =?utf-8?B?eThwZlQ0QjNSRFZNN1JGSjBFTExRb2V4R0Jya1E5NTk4SUc1L1k5TEZ0REg3?=
 =?utf-8?B?VFFJdktiT1ZHWUJ1QmxQNC9RTEhiS1UxSzNGSTl3V1hacm9OSys4b3dZNnBL?=
 =?utf-8?B?Nkx5RE90WDliVjZjQjRQc3dCQS9mVDdhT251Nk9rU3Z5L3Y1alVnalFwRnB2?=
 =?utf-8?B?WTlZWjREbDgxdnVFU3M5UkRma3pER2JZcVRySnllamVhTWUwd1o4L2lwOW8y?=
 =?utf-8?B?TXBYb0l0ZjlXM0hPWXVtay9SelZ4bUc2QWRhMlNCZy9DKzE3NEM2N3VZRFVq?=
 =?utf-8?Q?qRkkazA+dCIItk0TX91SocRWG5SM9ESlSe5O0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2FEc3hSTm1qSjJLUGlYVk9hZ3pIem12TWE0dHJUbU1mTm93RHJCUkM2TUps?=
 =?utf-8?B?dWxOVm5FNlZIN20wWklxRVZIUDk1dmFxZWRGR2FCMlNCTU93NHZsUEI5cWhT?=
 =?utf-8?B?Zk9uYzh2U0tTMjJtaHNRRlF0cUpBN0c5TGplSVFxVGliSHp5bGxPUTlhYlpP?=
 =?utf-8?B?S3U5dmg3dVVCQ3kyZ2V6L2QwRFRjUnVhVVlwL0hUYzhGSW5RczVjOW9STE90?=
 =?utf-8?B?RGZNMEdzOGlyMnZDYkY2WHhZVk11dXZjUTBUM2o3S09nN0E0QkdCZ2R1cUpD?=
 =?utf-8?B?NzhuTHRlV0tCcDVFdGtnbXR5VFp4NC9ibXJLbllIUS9vU3Z6UGo4QXhoaXZt?=
 =?utf-8?B?Wjg0QTdJUzU2SU5WbGluYVRxeTRtelVoQmVvS0RLWFBlaVh3bGRCcFZYN1oy?=
 =?utf-8?B?NEhNd1psSlg3dlFKSFd3MXlOZXBRU3JEMWVoT1MwZ084d09WbHpXcW91RjRB?=
 =?utf-8?B?QXFxL3dRSWgyZ0tPN0tQYlR5TlFJTXZ5NWZWaTFpQnFxNzBBNWRrQklvby81?=
 =?utf-8?B?LzgxYnc5L2IwVlFDcUYyeE1PQVlnS3dHd2dVenRrRmpRZWZMQXRVT1lYcE1E?=
 =?utf-8?B?V2xUaTJVblBubk1QTWNjdEF1TmZsdDd4amlGblYrZzdQcnZoTVZWUGM2WHEx?=
 =?utf-8?B?V0RMM1lFYmkwcVo0bkhMbnFnUUkwT25DbTRjT01nK3lOV0ZMZVFrSi8rcnh6?=
 =?utf-8?B?QllGQllNMGtNYjMyZ3RudWx5QUJhclRNb2dZbEZDaThCRnFVTUtaM3M3aUwr?=
 =?utf-8?B?VDhxSXFkVDJ5OFZBVUozRnd6YVlHN1E4Wml2RytLWkpPeXNFOTNaS0lyRUVt?=
 =?utf-8?B?bnhMWll2NFNjWU5SQ29oTnVnS0x0dGdWL1dPV0p4V3hLS2lweGZ6ZVVCaXBR?=
 =?utf-8?B?SS95dzBXY1pNdkFDcjBpaTJZeDVPN01HbEE5VXIxVm5QVG9kSGZIT2JXaE9J?=
 =?utf-8?B?YXRUaU1jRmxLY2oxR1lXK1FtWVNpdzlMN3ArVEpBQTN1K0NrQXlkNzV2NVlL?=
 =?utf-8?B?ZktHb2E5SndxNzYwMnc5WkNZMlBwbTNab3ZYakpqeG1ndHRaL0JPM2tsVFpa?=
 =?utf-8?B?TGVuelRGWXRDQ2FsbTJweG5QcFlzMnZYUjU5Y3VhWXRCVXlNMWlhazZJT1lw?=
 =?utf-8?B?R0krSDY5SHU1bFJITHJzenhXRk52di8ybDV4TVh2SWZvQ1V3S3JvY01ueEV5?=
 =?utf-8?B?V0lFeUxaM3BxS2JMTGFLNWFFNk9LQVpXdXNoU1YwVzV1dUUyZVV6UUdLZXNB?=
 =?utf-8?B?RWdhQUQvWWUwY3hnZjNDbzdSYzMxaVpYaTQ2WUUvVXBFTjltc1E5b1lhS0dP?=
 =?utf-8?B?eEdwNFN4dk9lc3ZLbzUrbWtiUDlydVlSU0NkV1UvcHc0b01ZNHlTZlcrSkhz?=
 =?utf-8?B?cllDQnVZYlRXc2JROVd2VERBZ3JmVm8vUEFOTUNSWWVOa3pLeDcveW1xZ0k0?=
 =?utf-8?B?UnNZRnRtZml2c1JTdUJ3SVlvR0NhNmxIM3FISjRHRVlnUDlCZnU2TGxyK3gw?=
 =?utf-8?B?Z0hBcC91cTFYKzg2dlZBN0YwSkMwd0VYT1BHZE5vRHpmemxCRDF0N2lUSEpv?=
 =?utf-8?B?Sm1KT0FiM2ZWaFVxNW9PejNMMTlGL2RZNWhTa05ZRW1iSzFWcjJMa3NCVjdC?=
 =?utf-8?B?NFdPUnQ4M1pOUGJPOXpCNEg2Z1hLUTdsRDcybkdSODdJRm1XMWxXVEFuV3A0?=
 =?utf-8?B?OHd2cW1YSVJ0THpGa0hPbVJiR2Q0aStiOVpsQ3poSXJTZGNya3piWFhoUDdW?=
 =?utf-8?B?UTVBY3Z3WVZENGNIWWlERlZGbXU4STVIWkVxQ0tYOEZRVnRTcmcwaDBMY3U5?=
 =?utf-8?B?aU5pMmhXQW1GcGdlNFVpUkIyZUxYL1V1YlhGZmNzT1FqZjZld3h0YWZUL2p0?=
 =?utf-8?B?dTNRMHMvMW85ajFETU1xTld0MU4vSjZISCt0M0g5WGpScVRFY3d5bm90V3Fu?=
 =?utf-8?B?TmQrL2tIQk5LQ0k4WVdOUmpKclVrYVJPUGF5MDdwc1dSV3JPZ2dlaS9uZjNy?=
 =?utf-8?B?Y0o3b1RuWWVWTURDcWVSa05qYTZNbjQwTEsvNjJGRmVTdW8xUUlBZ3JObnZO?=
 =?utf-8?B?SXBxcEdzOWhndVpNVFY4RlBrNXE1WWVFR3NvaUdKdHZyakc3Z013dXlOR3Y3?=
 =?utf-8?Q?JZIx1jJxnVCX+izZ3qa8etoGm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d637690e-7087-4c29-d1fc-08ddb55c9cd0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 09:25:53.4651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WaY0+PR2TtNx4DLTXpKPys4BUXsalMWPA/1dSCZHx4Que1Nk6vKCWexjhNzWvLt/eh0zqlpnoxXolemaCuz0Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7455
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

Hi Kamil,

We've a patch from Santhosh already for this one.

https://patchwork.freedesktop.org/series/150847/

Thanks,
Karthik.B.S
On 6/27/2025 2:41 PM, Kamil Konieczny wrote:
> Fix compiler warning:
>
> Compiling C object tests/kms_async_flips.p/kms_async_flips.c.o
> ../tests/kms_async_flips.c: In function 'skip_async_format_mod':
> ../tests/kms_async_flips.c:874:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
>    874 |         struct format_mod rf = {
>        |         ^~~~~~
>
> Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Fixes: aa4b2e0b81d2 ("tests/kms_async_flips: Add test for all async format modifiers")
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/kms_async_flips.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index dc3a0f92a..97f90733d 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -860,6 +860,8 @@ static bool skip_async_format_mod(data_t *data,
>   			    uint32_t format, uint64_t modifier,
>   			    struct igt_vec *tested_formats)
>   {
> +	struct format_mod rf;
> +
>   	/* igt doesn't know how to sw generate UBWC: */
>   	if (is_msm_device(data->drm_fd) &&
>   	    modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
> @@ -871,10 +873,8 @@ static bool skip_async_format_mod(data_t *data,
>   		return true;
>   
>   	/* test each format "class" only once in non-extended tests */
> -	struct format_mod rf = {
> -		.format = igt_reduce_format(format),
> -		.modifier = modifier,
> -	};
> +	rf.format = igt_reduce_format(format);
> +	rf.modifier = modifier;
>   
>   	if (igt_vec_index(tested_formats, &rf) >= 0)
>   		return true;
