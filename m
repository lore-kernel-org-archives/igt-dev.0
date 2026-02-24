Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FE9EA4FD7
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 09:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FBA88F94;
	Tue, 24 Feb 2026 09:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yd7NMO8Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA6C88F94
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771924777; x=1803460777;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=+IhDwII02tk3IxJ7YslRUO95eNrPZvPkjYweJxzemaI=;
 b=Yd7NMO8YdIe8ddhOvovvAkbKtj9d/Urp3yqtcy6gcuGB47EmMrq2rFe1
 q/N9/oNEmp8us6p09Ai0Odkql2LId6/iOL2YSf/opq/9qtJOObd50eaX1
 1G02GGIArs5lB+mu9vQ819eh2wt5Ven67Cvz+CNangEKqnkAsePYJmrFp
 Nl+lzVVFy/sgXcwYXVZSHpKY79TSEEuJkxvaXbn6k1E6hj99a2E5ayLRT
 CLKZwbQy/H764YfraMSPkSSx6KOV9NPKGAF8oTeZ6BmzkSSd7xjydLfAI
 B7NHxhaeTkR8TjiAYuqqln3TBFZwfYK5XpDZ0vn6xAZrk5CYl5I5LFvea g==;
X-CSE-ConnectionGUID: BVbG/qQXQ2+Di84ql8Iswg==
X-CSE-MsgGUID: Dis8RgtXTQW+y/dG+BNv+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76764799"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="76764799"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:19:37 -0800
X-CSE-ConnectionGUID: I6uTfSZ2R9eXhiA9QUcEGQ==
X-CSE-MsgGUID: ynNRe6GZT5SBy2PKsTEHpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220412977"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:19:37 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 01:19:36 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 01:19:36 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 01:19:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9TQ7ZqzsPe2qQrzBb0Pp3cgE2+X+Hn3WHF9uCbcA6wzxi/jeG8bi69UJew+Ce0i6gdzXYl7vLVMOvuE54mzlYaegbBeQ1ReX0/VuTL/3DcY/H853ohbP9eaKbGSBTzDPg2hJ+QFQiUbmTyjUOwxdVOxRHtTPn1DR465I943OQge0NS413cqRPr5iHgdtD2o3IFjx/9Uv0mE9ePUEqm5z1Ib/cfiTK2SvLiKRb7TQJI9gmDNtQc79Drmeh2AVoFM1WlWHoIDNNIzIzjrtcgow7DABhNRi/5Z73EOeLru4+p+EmUiLolfS9efj57wJ0WqSGRuoXlXb6fvYwOVMPZK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1yaQQ1yDzcpsENrg75myWVPeb3duluC929pxd2a/d0=;
 b=O6v89njgZVfpDfM4lXXZ5pONkMgs8ZiR+fi4RUEHAxbFlxm1c25QM4j4+8F6uh4buAacpaNF5s/S9YdEJI+u3NqdsYz1GJCr88Hm6R3Zaca416DUciRZs99UkqmuAlzGobBfz1bapjidpEigSIutAbz5w+aawU9/8/tG1eJEIX1TvjI2OFDVfZ4+E8xfSqxMCGAWOOl3HhiNKHVL5SNgmPHALuEDb6sWAvZEAIiWE6Rf6MCsl522lYqWZ7kdVcLO/5GU6wKzUyW6Gp8Xrb7Wua80avaKdqE34hdyRygq3KKQQn63NOJ0LIZdvr7ziq9UiH0XVx0aVtWZzbS2jRZ0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 by IA4PR11MB9081.namprd11.prod.outlook.com (2603:10b6:208:56e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Tue, 24 Feb
 2026 09:19:28 +0000
Received: from PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::84fe:e701:add1:4de5]) by PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::84fe:e701:add1:4de5%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 09:19:28 +0000
Date: Tue, 24 Feb 2026 09:19:19 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, <igt-dev@lists.freedesktop.org>,
 <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: explicitly reject Xe devices
 and update documentation
Message-ID: <5cmg4xwhguxgg3lp7jmburkyhiqu5gtxhxcv2mam43zzffr5u2@y2xfzt54avtx>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <9482ee5a326acdcc88b626112728e6cbcb6e0386.1771854831.git.sebastian.brzezinka@intel.com>
 <20260223173956.vud2rzwlbtoodyu2@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260223173956.vud2rzwlbtoodyu2@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: WA1P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::25) To PH0PR11MB5064.namprd11.prod.outlook.com
 (2603:10b6:510:3b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5064:EE_|IA4PR11MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c80c83d-f97b-4ab9-a5d2-08de7385cf92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tis4TXNtV2o4ZktvdVhXb0c0NEJJVjM2alJRNTYxTnVuMlFObXJrQ0lhVWRJ?=
 =?utf-8?B?L2N6YzhsV2dxaWpxMzg0Q2pndEF0UXBlanNnWURianpjZUM1KzN6SzRuVW9m?=
 =?utf-8?B?SVFnRTBHeHBaWTdhbkZ6TzFURWxwbXZwZUl2ZXpxWWRtWDFoaXNHbVFKMG8z?=
 =?utf-8?B?N2htenZVUVl3bU1jbDR6U25hSVhMbGxqTTJyMEZGZGgvampnYmlONndzMEY2?=
 =?utf-8?B?bXZ2Zk5VNjJ3ditxZWJCQkNOem9xRXNpTE5Pa3E1TDdxa2VxUTA4Ty9KYTFt?=
 =?utf-8?B?cFNVcWFhb2RiWjhZRFlvNC92bjRUaHB0bmwyYjhockJyRE8rQk1JdkR5dzY2?=
 =?utf-8?B?ZmQxZG5CRXhuNXNjdWtNdE56eFpXdTlYUFhFcWVpTjcwNXdNbUVNc3ZHNDhO?=
 =?utf-8?B?SjkvVVVacWN2cVZiRFZvbW1OaTdXVGs5d1gzZk9ReXJEWDVERXEvdjdVdTlD?=
 =?utf-8?B?eGdNSHVJZ3dhSFkveTNOYVNxL254MmQ2Yi9SOWVmak5SVTBpSE50Z3ZVbW5k?=
 =?utf-8?B?RmJkaWZTVDgyN1BFQnRwZ20yY1FpZnN5dzl1UkNXbmp3YmkrUmZ4MFVjQU5j?=
 =?utf-8?B?cGx5SXB4S1dPUjR3Qkx1Z0JHenc3dHhqYTZnWWVPbW56aFc3VkgzazRlQ0FO?=
 =?utf-8?B?cTdTUFpMT1RGQlVnQW04MThJNHZkR1dVeW1mQnNNcys5MEhRaCtNV3YySWdn?=
 =?utf-8?B?VkFFOVFnRFA1TjViajVreGpISkEwOHNEV2RBYUlZdllLWnZnTk14ZGlJTS9K?=
 =?utf-8?B?eDBlNVQ1QzZOZlBHa0lJTlk4Y3lJVXEwdW95WkRtZW5NUnFPdXVuOGppelQz?=
 =?utf-8?B?NEo4VGpFd3pOYWVscEhweXhsNmlQM0NMYnhnMDR1RERvM2N5MXB0Y2VybHEy?=
 =?utf-8?B?bk02SjQwMFR0NzhIOHhRNG1qMVlMYURKUFJCNms2ZEhYTEtleVJrdXVzZmFh?=
 =?utf-8?B?WnpNd3ltL2I4R0NqcTQ4U1paeFNqU2VMVWpadGZ5c1Mydmk0SG14WEdHc1JE?=
 =?utf-8?B?TTArbGRZUHVDSTZuM20wVldNR3RkSzgwMUtFYWpza2dOS04xOGpuVkV5ZHd5?=
 =?utf-8?B?NjV0UWZCamlzaVREZDUya3RUL05pNTZ1VjFHcUtGYW12SzNHVkpUaXhHQXd5?=
 =?utf-8?B?VDR2cENyYzdQZlFZMUdaMlhMekdlWVlRQUtKYUowTVhCVGFSRjBTeDNkSi9N?=
 =?utf-8?B?QUZqOWd1U3NQSU9waHRoNTRFUlBVbmR1K0xhUW5laGxnSTNmSWZxRXROck8z?=
 =?utf-8?B?UUxweEZseVJ5ODNZVzgzWlhFY2NicTgwU0RsZlZ1K0ozNVBsc3d6TkNnYlBu?=
 =?utf-8?B?KzZNLzRJdGNndnpyYm5JSmpoNnlPM200RnQxbjBrckh0TjF5NExEei9UMkhJ?=
 =?utf-8?B?QXJBbHl3LzIzSU1WNXFVSDdHYkx0SkhnV1Y5R0NSaEZwWVRxZDMwQXMwY0NB?=
 =?utf-8?B?cTlsLy9Ta1FybGFnc2o3ZzlwTkZMSVY2eDVDZVYydXloK3dnaUpXTGNvNUhT?=
 =?utf-8?B?bDg3Smt2SzBaYldHRnNjR0cwMXM4Ym52TW5xUCtjRy9zdjlHZ3hILzA2dHJh?=
 =?utf-8?B?WklOY0U5T3hIQVNRRmdGcVNHazFtSk8yVzU2ZW9SNE52S2FUakY3bmF1REg4?=
 =?utf-8?B?WENtVG1WYjZKdXRSVDBBTFhkTHVOczA0UjhGT2pGZjZoODFjTW43L014NGJY?=
 =?utf-8?B?WXFNWGJWcG9uMC9ROE9zY1VoZFgvR0ZmYm5SaVE2aE1tQ1h4bk11RTZSblJU?=
 =?utf-8?B?cjVIdy9qNGducjlUOFNYMjhaL3RWWmJhUnRUR1paU1Y3aEYzSjgyNGdGQ2Fx?=
 =?utf-8?B?ODN5MWtwNEN2amcxSlFrYnlVbUlrZVhXb1djZHhYSFAxc1RMNXBCTW8yYTAw?=
 =?utf-8?B?d1Y0Z044Z0ZkdGd0ZWJiV2w3K2o0bGdodnRoMWtsbkY2VkxoZ0REcTNQRkd6?=
 =?utf-8?B?cndta2hKa082YzdFVHo0WmJsc01rdS9GczdpOGtOdytpOXpKVzMwRVZOQkZK?=
 =?utf-8?B?TzBDWGRSbEptbHo0eEJ6L253V0hteXFRVFF2RkwzMnlIZnRuaSswZ3E0Wklm?=
 =?utf-8?B?Znl3Slg0U0F6cWQ3RDg5QU1WOUVxcTRISmdJTDkxeXZvaTNyTnU3eVhUb3dj?=
 =?utf-8?Q?ljBA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5064.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkV1elc5RlhNZHdxNmx5N0IrRGtMN3d6d0V1bE1pL2loUDFucFVtM053cWlJ?=
 =?utf-8?B?NWtCbmNIa1kwaWF6dytQQjFyRzBiSUNMRllIcUhZdkd5dTRwdGN2akVUQm0z?=
 =?utf-8?B?TkhiVVdrU0xTUldOWkZzaUIwbUd0OE5iWkkvc2c2MjZBQWVMQWlqQjA0MSs4?=
 =?utf-8?B?d2tUZ1l4SWZyWUdKZnM2aUdKNnhoWXJ6RWRDZmhPNStocnZqVWtodklQbUR6?=
 =?utf-8?B?eDhLWXUwbEpNaFN5RE9nQ3V4V2RYTTVsSGdmSGxJZ2wrdjFoR3V3dzFCTkY5?=
 =?utf-8?B?NGVueU1oTXFpa0Z0V0ZTdmZUanFNYWZhdkxENHozSzdLcXR0a09zaXU3N2Z1?=
 =?utf-8?B?SVJRaVFHVGdybjhZdk1qRTIrUys5Zk9YcHgxaTZ5ZDV5KzVhQ25XeEhLYmd0?=
 =?utf-8?B?WUdUeDhxeEV6dGtwOUcrRkVGa0liVDVMUnA5ZWsxcDRSa0lMeTFDK3hLc20r?=
 =?utf-8?B?K2MrOG05aUE4WVEwUDVCUFJwVjFRNFZGOXJDWFIzL3VWVCszYXdvb2ZqQkNm?=
 =?utf-8?B?M1YyRU81blZ4NjYyUENUTXEwd3dZM2QwelNmV0hyQlRnMHRmVmRFUitpQ090?=
 =?utf-8?B?aFB4SU1SMHNROVB0NGdPdnNxdk9JRjBGajNRcHdCYXZuWWUvbTI2dmRMSHRD?=
 =?utf-8?B?RDE3Qjh6d0FjNEVZWFIvbzhhV20yaHFuS2gxdHo2Z3Q0d1ZoVU44UExsbit0?=
 =?utf-8?B?VEZZditCU1NrbGFtNlViOXBtcEhxdEU0UDdOME8xSmFTMk9NSkhRNEpnOHdP?=
 =?utf-8?B?bkE0Y083aW52NmtzSFZMSEllSW1hWGRpRGhzUm43a0NwTERyNmNYNGlRNGtz?=
 =?utf-8?B?c1MzdHA1bU5FbjRxUE41ci9mMkRtZUpyUlZITkhTODRBVVFINlBXckdSQ1h6?=
 =?utf-8?B?Qk1JZXorZ00xM3FRWGFQTUR4SGVBTU03cytmeUhZVUR1RHFCREQwMktVT1l6?=
 =?utf-8?B?TmpZNGU4SUtMeXlrY241cW1Rd1RrSkVlK1AyMjFlWjFwYWJZaU9TTXdPWG5z?=
 =?utf-8?B?aTJ0QUhZTTJWY0NQZnlXS0l5Qkt2K1ZON3RLeDU5UGNua2lDaUVrTDdTYzVB?=
 =?utf-8?B?MGxoRDZ0SFJMajRyd2pCNFJraEdRbmV2VWlnM1A3d3VKRXhTcVJ1b3phN3Fv?=
 =?utf-8?B?eHFlTjZtYjd2NzZCWHZ5SGh1VFdFQ0E0aGxXczkxREJHYkdaT1pEMGIxWkkw?=
 =?utf-8?B?UFROUFBiNmRCa0NCampBL290ZXMrUUE5OEJ5Z1dkbkhWbFp0RFg2RlUwaUNq?=
 =?utf-8?B?SnJNUUxJanJRY1l1TlU3Qy95VGdINTM0MWx5QmpCN1E1QTcwZzdPR1krWU5L?=
 =?utf-8?B?ZG1VRENHMDBSbkI3cUMrL3ZvU3hUalB6M2kvRXR4alpvTWpKdGUrTnRqL0ZL?=
 =?utf-8?B?ZVlIUHdta05iWFFSMkhOWXVIb2pvREpYci9nVHVaa25HOEtnNFZXT3ZMcmFz?=
 =?utf-8?B?NVlBT1cvbG54QWEydWl0Y3RwSldqS1BIaUZNS0pnUDQzZFZaaXU1R3dhTVg2?=
 =?utf-8?B?c3J5QmhuU2NuVWtmOUd5VHI1ams1MzVCWnR0b3E5K0h1UCt3UGFMZDNUUnd2?=
 =?utf-8?B?Y1RSWHllaVFQT1d0K3kyeUU3dHhFbG90MUwyY3hwcDFoeWlzaDNreDFSNDh4?=
 =?utf-8?B?dGhReVdqQjZ6anBjRFdyK3hIYW5yTURoOVkyT1VvVWpiYlpNcVByN1JKTGR0?=
 =?utf-8?B?UjdBTlM4VzJXaTY2V2NxWW5OK084Y3FjUURTc3ZJY2Z3NTV6YXNZMFkyTm1F?=
 =?utf-8?B?WXROK1NNNVRjYU5RRWppSkhGTjFtNDFESzM0SVBTU21pUU41WGloOG9QbUxw?=
 =?utf-8?B?blJkVXBweVVwS1lpODRvWUlhZXhQclFOUzQ0ZjFXM2E3M0RpbXN4R1lGdHYy?=
 =?utf-8?B?VS8rcnF4Mno4cXk5MFJ2MjlIMHhpc1RLemZ3dmNiS3ZITkp5RkI5YS9KSU05?=
 =?utf-8?B?MjJoREk0S2dtVUxQS2YyN0w4cEt2bmV4SmxVSGMvNCtHRHJqZVlpNDdEWHp2?=
 =?utf-8?B?SEQyVjE3bUFvTjJYRnl0NDFPZVFPMld6Qy9XejVUMzh2d2dSYUI1Z2FFOXRi?=
 =?utf-8?B?dTdoMElZR3ViZDJncUloQnhnRE5NMHpKM3FrSmlQSExoQ01vTUxMZ0ppYnZ6?=
 =?utf-8?B?dlVvM1ZSTUMvcEt4V3FQNlhJUmhSenpmSXNDNXZNMEhIbE1EOWlOWVc2VHlG?=
 =?utf-8?B?TW1SUk5veWpSZFBpU2VHZG9tOTY3aitmbXQvdkREWkxpKytRc1VLcW9FTmMy?=
 =?utf-8?B?N29EWFNCYU0rTklwWjc1ZEJFNllZYXBySGl1d2dIcEUwWGhqMEtjVlhCb3Vx?=
 =?utf-8?B?aDZ6VGgrcFVJNDhaTG5QMFYvN2JpUkI0Q1N3NldNR1JDMUZQN2J4alhPYlhI?=
 =?utf-8?Q?yhagNenfvvYa6n/E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c80c83d-f97b-4ab9-a5d2-08de7385cf92
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:19:28.5030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iITo7pSt2zS65IjCY5QPnJ1A0owjmD7+N+aTEaIAMT92isxej+2XnO2+OE3lQZ9qOolDbIccB5YNGaIK/gS4CDLnKzDW8OkmB60WsNHyaPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9081
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

Hi,

On 2026-02-23 at 18:39:56 +0100, Kamil Konieczny wrote:
> Hi Sebastian,
> On 2026-02-23 at 14:55:06 +0100, Sebastian Brzezinka wrote:
> > Add checks to detect Xe driver devices and report that they are not
> > supported by intel_gpu_top, directing users to the gputop tool instead.
> > The man page is updated accordingly, and the tool now prints clear error
> > messages when Xe hardware is detected.
> > 
> > Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> > ---
> >  man/intel_gpu_top.rst |  2 ++
> >  tools/intel_gpu_top.c | 23 +++++++++++++++++++++--
> >  2 files changed, 23 insertions(+), 2 deletions(-)
> > 
> > diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
> > index 20204fdcf..5d29710e9 100644
> > --- a/man/intel_gpu_top.rst
> > +++ b/man/intel_gpu_top.rst
> > @@ -102,6 +102,8 @@ JSON output will be correctly terminated when the tool cleanly exits, otherwise
> >  LIMITATIONS
> >  ===========
> >  
> > +* Xe driver devices are not supported. For Xe devices, please use the **gputop** tool instead.
> 
> imho could be shorter, no repeating for 'Xe':
> 
>  * Xe driver devices are not supported, please use the **gputop** tool instead.
> 
> > +
> >  * Not all metrics are supported on all platforms. Where a metric is unsupported it's value will be replaced by a dashed line.
> >  
> >  * Non-root access to perf counters is controlled by the *perf_event_paranoid* sysctl.
> > diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> > index ee38829e1..b94604232 100644
> > --- a/tools/intel_gpu_top.c
> > +++ b/tools/intel_gpu_top.c
> > @@ -2734,8 +2734,20 @@ int main(int argc, char **argv)
> >  		ret = igt_device_find_first_i915_discrete_card(&card);
> >  		if (!ret)
> >  			ret = igt_device_find_integrated_card(&card);
> > -		if (!ret)
> > -			fprintf(stderr, "No device filter specified and no discrete/integrated i915 devices found\n");
> > +		if (!ret) {
> > +			struct igt_device_card xe_card;
> > +			bool has_xe = igt_device_find_first_xe_discrete_card(&xe_card);
> 
> Please drop this bool var, instead print old info first:
> 			fprintf(stderr, "No device filter specified and no discrete/integrated i915 devices found\n");
> 
> and then check for Xe:
> 			if (igt_device_find_first_xe_discrete_card(&xe_card))
> 				fprintf(stderr, "Detected Xe device, use gputop tool instead.\n");
> 
> Overall looks good, thank you for taking care of this issue,
> 
> Regards,
> Kamil
+1 to Kamil's suggestions here.

> 
> > +
> > +			if (!has_xe)
> > +				has_xe = igt_device_find_xe_integrated_card(&xe_card);
> > +
> > +			if (has_xe) {
> > +				fprintf(stderr, "No i915 devices found. Detected Xe device which is not supported by intel_gpu_top.\n");
> > +				fprintf(stderr, "Please use 'gputop' tool for Xe devices instead.\n");
> > +			} else {
> > +				fprintf(stderr, "No device filter specified and no discrete/integrated i915 devices found\n");
> > +			}
> > +		}
> >  	}
> >  
> >  	if (!ret) {
> > @@ -2743,6 +2755,13 @@ int main(int argc, char **argv)
> >  		goto exit;
> >  	}
> >  
> > +	if (!strcmp(card.driver, "xe")) {
> > +		fprintf(stderr, "Xe devices are not supported by intel_gpu_top.\n");
> > +		fprintf(stderr, "Please use 'gputop' tool for Xe devices instead.\n");
> > +		ret = EXIT_FAILURE;
> > +		goto exit;
> > +	}
> > +
> >  	if (card.pci_slot_name[0] && !is_igpu_pci(card.pci_slot_name))
> >  		pmu_device = tr_pmu_name(&card);
> >  	else
> > -- 
> > 2.52.0
> > 

-- 
Best Regards,
Krzysztof
