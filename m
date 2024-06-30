Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FB2C27C4F
	for <igt-dev@archiver.kernel.org>; Sun, 30 Jun 2024 06:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A30410E155;
	Sun, 30 Jun 2024 06:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8lV4Kfn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66EE10E155
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Jun 2024 06:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719730574; x=1751266574;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cbLWlbj7wYyA6i1MXAZ+bb+4KlU8ThMXmnf++uC+lKo=;
 b=J8lV4KfnhzTCm83J7KaVYSCQjwrCWThkhfgzoAb0TyLWHF/orelxz8pW
 Azj6shJCJH8Dy0PZEA/cOH0ChYDG+wwaIkI41t04T/XidTLFYMsOvM102
 hQYaFvcCX/9yDhfbaaKVNk90bMW8lF87rVn3OvUAelMmNBmfu0W1GFWNK
 4TqpeAxXXXBxznDVRJQvZcfWS24GY/LCBCl3t9+nhMOOuf9PA3yQPhqKN
 r8YApkVYMzlNjPioF+XdD2okWjXWBzPX+2TcvOyFGfORzoIKY1oVAEgxk
 iZBHkvFBgHz+5EqiDAesxD4GGzVr6qD24O52nnCLtBsmlDSGXmgO0TgsG Q==;
X-CSE-ConnectionGUID: Fo7SWDSAQSa6E1Sj2f0u2Q==
X-CSE-MsgGUID: f1X2zc5uTrC/XLzkOC+ZpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11118"; a="16537884"
X-IronPort-AV: E=Sophos;i="6.09,173,1716274800"; d="scan'208";a="16537884"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2024 23:56:13 -0700
X-CSE-ConnectionGUID: +WMgS1ILTSiga4XGJhXGGg==
X-CSE-MsgGUID: V1/xHgXBQRa83t4mPqfryQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,173,1716274800"; d="scan'208";a="45279254"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jun 2024 23:56:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 29 Jun 2024 23:56:12 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 29 Jun 2024 23:56:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 29 Jun 2024 23:56:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 29 Jun 2024 23:56:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/jksFfVonkaco4RELYo9pF4SqVOImBCzEIBbDR8YXuAMtXO3v23AGHaxhIsy2nMT2vOM7x4xNshcVV3q55QBdV1rQUyFthUiAcIg4660+2Fh4w/sY0scLE2C49Gr2vdXafIgYmjDoCnsSjtVGXGUU9iHI+RN7rV9rUDYvt8QhZcCZfbJFH4Rn0q2kbVWU7FGac701ZwtOU1i/LJF6exRZZvOCAKNng75sQ1ojzM0BIkWIpMnG8pbf6X8wfqjONJbL3ga5bQi4Zj8UXPw3quT5tcBhUCtREY2bVQQPNlAGY8tmvXy5XPpizD7mwYBfUwfkS/fT/BAaHeZJLQK/MOBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1zVL0jGOrRaaka10/xeF2gjMra3v6LkxEzXH/PU43g=;
 b=aRu324g8Cno1slxyuFijBXXXCYaq3TGzIys+0BZiCEi0n7a0QT2VZZnbVuOukNa6IZ6E8mQJXTe2AkX0PtwtTSMA+byiDGaGbfASLO6laYoEp4ykKKGQldxMJZvGLagnBh78gi5yOi66m1vnM89rzaq02xON8dH+ypZGQcNOb7tbjrEyQtATFd7LfbhbExQ/HFwlGF712IvXf0g5pL3/Y3kzPJXPPUW7k0fl8F6J+Cf//P5/+NO5TNw7Jr4d6W0393y+zFaqnmcEZjFU9IlzEvMHTovzFu4b4ZUtOn8GOJ1hkuLb2/GJ1vytbiSl6jeBo7i3hpTpuUgUA9XHVZT2DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Sun, 30 Jun
 2024 06:56:03 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%3]) with mapi id 15.20.7719.028; Sun, 30 Jun 2024
 06:56:02 +0000
Message-ID: <fc8c4abf-ecb7-45a1-ac5c-d43c57b39f0d@intel.com>
Date: Sun, 30 Jun 2024 12:25:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t V2] lib/igt_kms: Format cleanup in DRM mode printing
To: <igt-dev@lists.freedesktop.org>
References: <20240625035856.230338-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240625035856.230338-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|PH0PR11MB4774:EE_
X-MS-Office365-Filtering-Correlation-Id: 1777f084-cd60-4b94-add1-08dc98d1b48b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cElSR2plWlVRQzFtd3RJcDhTOXlpWVVVbUMzVGluU1NTOFBxOFlmZ2dBR05i?=
 =?utf-8?B?aTFSOGhlenF5cmtlVUgyaU52bG10WEY3akVNVlk2REFUYkJBZkhkcnNWYnhy?=
 =?utf-8?B?cm85UERTTjl1UWFra2JmRnpIZkZzVjc5TEF4cUIrQWNoUm0zMUszcW1Jck1X?=
 =?utf-8?B?aWhmaVRRYVZacFRkMzBjY1cxcWFVNUFZMXA5dHZKU2haN3NiUFJQSkJ2WDEx?=
 =?utf-8?B?bzhCMCs3L2phTkJxdUpKQnR4aXkzNGNkTlBSaGJlRzQ1Z2JPU3diOTRpMFNw?=
 =?utf-8?B?cm1WcHlCSlRYNjNIQTNXazlmdTRnc3lxRlgxTW8yQ3BCQzVuN2UvVW91eUJN?=
 =?utf-8?B?aWxscmNpWGxtSUhvVWNoODQzSnpEYkE5UEZBbm02VWV2V3BNdzBKME5KUXNr?=
 =?utf-8?B?RzRCc1pUVUFpblZoVDNOODI5MUwycGorSm9jVmRxNXJiZVdxUVlnNGdQbnhL?=
 =?utf-8?B?T2MwaVp1RmNKTW5hWlhPbGdFdlNSUDBDWDhaV251SFZXNzh0UW9tQS9wcFp1?=
 =?utf-8?B?WU5HUGJ3VTBIdExiYTR2YzZRdHZTRjUzUEYybWlMVXZJWk1TUTNaR2JZekd0?=
 =?utf-8?B?OFRlV0VXS1BYVkFadGZzajhyM0F0L3I4TVNMK0FpYnRCVko2alA5UnpLWkZs?=
 =?utf-8?B?L3l1OGpWVmw1UUdOeXRaS2x3WWpNWWx6NXE1dUFwbkJPRjM3R2twbEF2dmd1?=
 =?utf-8?B?dWswdm5GOU94dVRHcXdnWG1vQkJyMmxlZzB4TTRyVll6aHVDdXRnS2s5K3Bs?=
 =?utf-8?B?Q09ZQlJlaWtGajEwTE9idjRLbjBTbkV4SHlsS0lOZnBFc2EySzlBcUkvTFVE?=
 =?utf-8?B?dFNQeFUzcUNpYzZIUHFSamExMndWNllIM2tsZHNwbXRUdTVJRnE1cS9WSXJO?=
 =?utf-8?B?d1VkM3NTZEREeHFMN3RKMHBuM20zOU9mMm5vNjRKWWRSc0dmS3VuVFIzZFEz?=
 =?utf-8?B?TWJQMUxHYUxNU2FxS2FwaFRvNzJVNi9LWC9BNkFqZ3YybFBSVEJaNUtZZkJm?=
 =?utf-8?B?Q1FaOVh2STYyL1kyWjZTSGxyRUdmM05vUjNYa0ExOEVvUmFHVXlxMzAwcDRt?=
 =?utf-8?B?ZkRQc2RvTCtSNnBJRWwrVklQSEVHWlF5Zkx3MlhxOWFSNGxFQ05WeWcrKzZB?=
 =?utf-8?B?dTgrVkNnek1MM2tob3lrb0JWazB3OTBuZzJCRlFod3BtQWo0VVdsQTRlTk81?=
 =?utf-8?B?S0w4Z1lwLzc5RVE4Ylh6dEdPbWhFd3NFYzRpSHNLQVM2OFRwZlR5dUlid1U1?=
 =?utf-8?B?clZNRFZadzN6OGhISFkyK2V0dW5xaHBHU1NsWmxMU1JzM2lKd2srbVlBWjI5?=
 =?utf-8?B?RXp1WExHUkRFdEpTbE9Ddm5iOHJRSDZYRUNYOEx5Y1pFVy9mNU5WaFNyMmdI?=
 =?utf-8?B?dDBvd3pKQUp6T2IvRVhmdTFCclpmYlNlVHFydTlwdjBXUG5nVTdUZVhCM2lE?=
 =?utf-8?B?Y0tObkRjejhndW5NTDY0WG4rOTM2RUl2MmNNYURoMWZodU4zWkpNVXJCcy91?=
 =?utf-8?B?cnNGWU9mT1dlbHRpQWlDc1BTc0lxRzRmb04zN1ZDd2p3L3dFSE9NaWNUaENv?=
 =?utf-8?B?UDJCblk4ZThLUEk3aC9yWlZYRmY5aVVNOGpwcWpmQnZDbk1BMGhKNDU1NEtJ?=
 =?utf-8?B?czB0Y3RVUUgvaVNqd2trMU4xYllwcDYyc1lyaGtaRENaY0x3TUdCUUF4NnFk?=
 =?utf-8?B?dHBXM0FWeUNTblhYWTc0WXBoRWlwQXFaUXFyM1lIanQvZGxiNGVTUXNQclh4?=
 =?utf-8?B?ZG9UdUFVQ05Hd3c3YllDdzdIR3ZOVVNlNkZLTjd2eEdVdVNMTjZXL3M5czR0?=
 =?utf-8?B?NVhaSXpFVFovWXNWNE84dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2ovVm5hK0xEUUc2b3FCYy9YcStndVMxNmFJT3hXU04wd05sUXVGZ0phZ0or?=
 =?utf-8?B?dlYxdGo4SVcyNWFVNW5HanR5ZGlsNDVoK29wN25LZUdRNUlRdjc1OXlUelNS?=
 =?utf-8?B?V3ZqUEZjK3dyaUF2YUVvMkdlRldDSzFFc3d2cVFWcEQwdVJDOVFMUDV2MDMx?=
 =?utf-8?B?dzJVZTZqb283UWdDWnlEYmxVZUZkS0UvZkg1VXJWOUhyUUhTNUEwRWc3Q0VX?=
 =?utf-8?B?V09LT001YWhCWXk0dnJBTHE5c2Y0V05DY3gweW8reU4ycjZxQmdaN2Z2UWlY?=
 =?utf-8?B?OThWMndHaks4TWdyd3pyRjdBU2VBd3plT2IzWC9peUU2QTZRQmJvdVJRUCty?=
 =?utf-8?B?QXVyMHJnNnBLNGJ3VlNBcEhQclZFVWQvS0tFNHJmdDcyMXZRbWZtaFhPV1Rj?=
 =?utf-8?B?aFBFd3NEUkIxcjZOQUhxSFdSbUh3SXRwdWM3ZFljSjZrUC84dUpoNHgxZG1s?=
 =?utf-8?B?Y3Q4TVRvNVN2MXZtdnB4UmtLSmZ3WTZmN0FyaUQ2Z2ZibmNzR20zTzg5eDc2?=
 =?utf-8?B?MU1UWGY2bStZT0V0M1phU3VXNjZNSWJQUVhRL1c5dDZsM0pXSkJtajNFKytM?=
 =?utf-8?B?YVRjTjBmVXY4WklHeHRJcWtJam9KTFdYL29PWDhDd3RMZ0QwZElqRUd1YmE0?=
 =?utf-8?B?K1k2eXgxbENBN21xbnFZM0RGTG5ibS9jZkNGaS96UVd4RkV1dW9HOURPQkZD?=
 =?utf-8?B?UStYUEV5LzJQZXNVRWQ3YzNkdnpQQ1lDeDY1SGNPWTNieUgxbTY1bkVBeUhk?=
 =?utf-8?B?bGx3aTh2dzMyL0Z1QkdGa1FITjdCOW5NTjJVM0g3L08vUzhxTUZZVUdZN3dH?=
 =?utf-8?B?cHlWQ28wZ0gvWHc0UVNCRUZYZGN0dGpBcTJvNTE0QURPUWV1TFVDa0lwMUFw?=
 =?utf-8?B?QTdYWXVkRUg3NDdOYng1U1pwUTk3eVRVeVdRd0JmQzVuOU1oSERQdWwwTnFP?=
 =?utf-8?B?TnZKNEZZcU1qL2tML0VqRDVoSStxYit0b0FKN291RjYzMVlZMGxuQVEyNHVk?=
 =?utf-8?B?cEhnOXd4alVEWmxzaWlUQ045WS9HSGhZSGdiZlRueGNPUmpXNzgzKytJdzYv?=
 =?utf-8?B?U0ZROGtqSThLZHpZdjkzYkFCOE1qcWxwbVVoUzdBRGJIN3pOUHF4dXoyOHNH?=
 =?utf-8?B?YUFSZmRRZklNZzB2TVgxZTMzZWg0ZUtvVTBRdUcrQUUzUTZabEx3ekVNNmFE?=
 =?utf-8?B?OGpQS3pZWk9FUUpUTHlDNU5UTnpkclVBdVRwN1Rud1IzQ25IK21kSTV2S1pt?=
 =?utf-8?B?aS9uTjRmUER4YlU4Q3lCcHpoVDcvaEMySWo1NGoydll1UW1KZ3hhU1QrL2lK?=
 =?utf-8?B?cXBsN0FGZkVoVU9DZDREUVhXeHBreVNXejZWZkM5dGl6UDVZWWxNaUk1SmJ1?=
 =?utf-8?B?VUhWRE42QVhtN2VKa3F6ZFZGSHlBcDVCUmRPcGw4S2NhSWNneXJ2RURXKzhi?=
 =?utf-8?B?WTkzamdnMFdvMmhNaVNBOGllTjBIZWpsOW0rS2hlNlhSME4yRkRSOTdvWHZw?=
 =?utf-8?B?TURHUmZHVWd4RUFUdFREOHhKZUlSbVlMTlR3MWk5Q3RlUmUxY0VMOXoxbVE3?=
 =?utf-8?B?bm1kZ1U0RVlsN3hJaFlnT3lnK2dkS295KzNXYlNramx5ZlZCNGF3bUYrU3lE?=
 =?utf-8?B?TlhOL0xxZXRYakxTMUQ1TzNqdDJHeFNkcW1teklZelhETWt6OGoyOUxwY0lJ?=
 =?utf-8?B?Sm5WemVadG03bTZlMEdCTFRpVzBoc09LbitOckp5bHJHb1I4N1VEdkVYNnFt?=
 =?utf-8?B?aVhjQlpyM3FNOWQ3VVpHS1ZqMVBMSzBva0N5MDhhby9iVm1GaWs1dlJWdlBL?=
 =?utf-8?B?eFVOMU54SjNoVVlKaWVQdTN6cWdlUDAzejZzaGt1VjVjTXBLVFpUMzYzTlhS?=
 =?utf-8?B?Umt4Y1NuTDdrZUo4MXlBa0UzMlpwSm5kMnUyTkN3VDl6eEUvWlM1MG9hZXEw?=
 =?utf-8?B?NldpOVB2dTByTk9aek42UzJHQ0xsV1pia1JpaGdyZ1E3RWFTb01vZkl2bTRJ?=
 =?utf-8?B?a1N1TC9IMzJaeFVNbDhVOStnd1pKanJLZmFjbkYwb21XRm5oK2dUU2RmbGNa?=
 =?utf-8?B?aW4vMU9rc2MyemcrRVNpV0lPbU5JMGNtV2JqVHBFNmNaMlRESVN4NEtxRElE?=
 =?utf-8?B?Zm0rL1UvRE1kckptdGh3dDRuNnovSUlHQWdNdXNZZ2JaeUw2bDhmNUJwQVM1?=
 =?utf-8?Q?9u9phNF9Uiv7h/+vSZ7SHSo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1777f084-cd60-4b94-add1-08dc98d1b48b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 06:56:02.8332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlf6kEHR6xu9gaGfB8j73sRRLxzkxRcUlG7LyTHLURTEIUJJ3sjrVYTSKIpylId9GqiS77EdEqtUT8a625fWv0yldPfYXM0R2/ydQX3P/mAaX8gtyNiCFs0SvAbSkPnx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4774
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

Can a macro something like DUMP_MODE_FMT be added "%s %d %d %d %d %d %d 
%d %d %d 0x%x 0x%x %d%s%s%s%s%s%s" which would help to update as required.

#define DUMP_MODE_FMT "%s %d %d %d %d %d %d %d %d %d 0x%x 0x%x 
%d%s%s%s%s%s%s"

On 25-06-2024 09:28, Bhanuprakash Modem wrote:
> While printing the DRM mode, align the style with the
> Kernel logs, so that it would be easy to compare & debug.
> 
> Example:
>   Old:- 2880x1800 60 2880 2928 2960 3040 1800 1803 1809 1906 0xa 0x48 347710
>   New:- 2880x1800: 60 347710 2880 2928 2960 3040 1800 1803 1809 1906 0x48 0xa
> 
> V2:
> - Minor cleanup (Jeevan)
> 
> Cc: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   lib/igt_kms.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2e6f44e3c..174bbe6c4 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1144,13 +1144,13 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
>   	const char *stereo = mode_stereo_name(mode);
>   	const char *aspect = mode_picture_aspect_name(mode);
>   
> -	igt_info("  %s %d %d %d %d %d %d %d %d %d 0x%x 0x%x %d%s%s%s%s%s%s\n",
> -		 mode->name, mode->vrefresh,
> +	igt_info("  %s: %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x %s%s%s%s%s%s\n",
> +		 mode->name, mode->vrefresh, mode->clock,
>   		 mode->hdisplay, mode->hsync_start,
>   		 mode->hsync_end, mode->htotal,
>   		 mode->vdisplay, mode->vsync_start,
>   		 mode->vsync_end, mode->vtotal,
> -		 mode->flags, mode->type, mode->clock,
> +		 mode->type, mode->flags,
>   		 stereo ? " (3D:" : "",
>   		 stereo ? stereo : "", stereo ? ")" : "",
>   		 aspect ? " (PAR:" : "",
