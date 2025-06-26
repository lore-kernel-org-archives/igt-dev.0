Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEADAC7EE30
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 16:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8203F10E2D9;
	Thu, 26 Jun 2025 16:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNmTDNl6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72B410E2D9
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 16:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750956247; x=1782492247;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LKOxpj0uuKiLPwIXfiX3rZNHMKEFEbBTENE/sHcPRvo=;
 b=mNmTDNl6lRekfb4KOGljcXIbc+7HJJruVhAf+fc2bXl1u9LkTFryJHbs
 DUXvSrFGLMqbBPBKXcI0pzAPEc8+A1LBvh1ww8JHOWmMeYuOKWBhhb2V+
 mO9CaY1g6trgYZeYxkyj+iSKkQA2GzCT+QQUySN1fRKKwgMBfgzZmqj3a
 2wKqVEPPchSxS/hGAfprlyJJCKvlDuS4SCMSHdTQXg1wrisov2JL+7ige
 Do9lGdcoMRmgSptFgZ57AzWwRlFTItVKiZXeoHMghfiR6CwLlwXa+5v8L
 Z2cQtQMWFbKp4UoP9o18MIV2Ff+0WuB3FRvs5uwkQKR5vD4SydoQ6lsMi g==;
X-CSE-ConnectionGUID: 4bKMfxD8RHCXchQtVe68cg==
X-CSE-MsgGUID: aekWGn/EQAePmJ+tCFzXlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64321934"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="64321934"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 09:44:06 -0700
X-CSE-ConnectionGUID: LrSqqInnStKFf/Ulhv4nHA==
X-CSE-MsgGUID: KYzxhWiIQea+eilqZpTUng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="151980301"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 09:44:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 09:44:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 09:44:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 09:44:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8L4icuNQbVzrYZSZzlCGwz1RctaxpXCOnZyX7271ZGt9JJChcTltaJmAXxgvBRdRKcL0h4QWMSMZOx9MA7v7UzH1eBMncWXBYJ1fkMatRupaw3jWBB7P+xODvU+YJCUfX4C1VODnUkk9LZTFCcrBLcoVMW5ZRi3cf/p00xcD71w+V8EczwMklFm4aFDwDTG3+mEBxV+dwwSSp5PLMooqZo3jzDwbqLP6pJB2LummPR9G/CHraKnSqmQbDFJLxpdMKxfvAtgrI9h6qCxmW5f5H3RHtvgEfrYUitcgEBr/LM+5ij5BfqUNdFhbMOdMJr6jt/wlEjTs1Xtk+eP1vkv9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hYjVV9zxVPBniSV9pHXuuotfkYNGgQKKsCC68ybwPs=;
 b=u9N70Eax/e90dKUVhn9v7nQnUUmG+ufBy/WNSb95KF8lOHourIDlhfCpcg17gAPWoXanDULHkqfLls2L3rddt6DFV7hmTltdacWky7k+YmWPYLhPGCUF/fXqlHVf4Ymr4nD3/+Seu6J55B/Rrc1wr8VR9o3rE7Tbe0hHi/BeWLR0SFVtFt24A7/WhsWEdfqV864FVswcyhxjrJuTRAf1tC+0M5sIg74ejVEGrOj1rw+25+TeROnHhuIKnmvVTk3RWDln099iDXzHEjG3l1w23x6OUlS2g33cxfD8eKZ11l/+E7Pk1gpzeG/hW7SINA27Ci3aDsl/wAfBAVO/rm806Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 16:44:03 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 16:44:03 +0000
Message-ID: <411d62dd-bd09-48db-9eca-c9b077e2bc92@intel.com>
Date: Thu, 26 Jun 2025 22:13:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v2] tests/intel/xe_pm: Enhance vram-d3cold-threshold test
 to verify VRAM self-refresh
Content-Language: en-GB
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250623101940.157923-2-sk.anirban@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250623101940.157923-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SN7PR11MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a019f0-6522-49ce-c744-08ddb4d0a875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkRaUFNtY2RoTUJwclJXcFFlTTl0WXdFdHluZlVpTXBPaU55QjZyYlJNYytl?=
 =?utf-8?B?dE1CM2lXMG5rQmViOFUzSmVrQi9nbVluVjVINlIvRHRjMEZyYUZDa3M0bEFG?=
 =?utf-8?B?ZTdaZWliR093cWp6WlA5WXFBVGdoZG9uclY0cHczeVRiOWIwMG9PT3dKRXlM?=
 =?utf-8?B?ZUV2MnkyMHRiTVE4aWNWL0t4SlNQKzQ5akx4R3F2S3llVXV6WGJkS0pwRHJQ?=
 =?utf-8?B?RndBUDVoUTgxOXVRMHc5MHl4M21qNGpRa3U5OFlycXRZR3hTdkk2REpKYjZH?=
 =?utf-8?B?c2MzNDU0RHl2RHg4Y1hNOWlEcGo0TVgvMGdQeFRlMzRISEs3WEZLeXlLOEZE?=
 =?utf-8?B?R00vYW14TXRRalJhY0VrWHlyNDJPRnJrVFdCNk9uc29YN3prQUExR0Jydmdh?=
 =?utf-8?B?SU5QMXAwT09OQzVmcGh6TThzWjVZSVRYaEdFeGczemlLMisyT3BQcUxXWGFO?=
 =?utf-8?B?QVNCSS91c2ZzNm5HZUVkVVVDSFVoeVp3SXdFU1RzOFJybktvS01BRUhlUTNx?=
 =?utf-8?B?emhYS1JnaGdZMmg5ZGk4dkpxRHBEOVpPWDgyZWd5N0g1UzNUUXFoY1p6dzN2?=
 =?utf-8?B?YTRkMHRJV0JkV1hWeEZiQ1liTkNMWUdoSkFUVFUzS0ZpUnRXWit3U0Z3dllz?=
 =?utf-8?B?bHl6dytSVFRqQWIzcWltZnFMMjBLdDRSRUZ2QXU4UlgzL1M3ODJQeTZrSWEw?=
 =?utf-8?B?REJzUG1IcFNzUitYbVBGWlZtaU1RbXN4cUdpL1gvUkJNdnRHYm55UGVJdTZN?=
 =?utf-8?B?MUdDeDk1a0xxSWE2ZDhYRXREYUN6TDc1dmtCdXMrZDBRb1BBZ2F0S0o2Ukoy?=
 =?utf-8?B?ek9hNjFlVkpvM3hzdTFaUTVxei9JQjFNblNyVW4vMXNtQTFZV0k0dWdyNWpO?=
 =?utf-8?B?RjBOenIxNFhDMjltN0c2empRZHRtaTRvaGQyampJV0VZMmQ1eFFKMVNxTGxt?=
 =?utf-8?B?cTY5OFM5OFFhVUZpSmFOZjFzKzVHbmVuOFg4SndlUmw4LzBSRHJpNXNjWk9n?=
 =?utf-8?B?ZVpSUTEwcVV0NnpQcm9IUkxvVEJlbGIrZ1lFdldxV1V1TXF2TnZhSFRxZHNo?=
 =?utf-8?B?NGpXcStuTjZRMmpXRTNXczZsMW9qak9iMDEvT1lNanN3OGxUbFp0TVcyTVRr?=
 =?utf-8?B?T3dqNUZnanRsVk1uQ3BGb294Sk5PYW1pSERDSFBXdkRTMmZnZUoxTkMrSEY0?=
 =?utf-8?B?Nk1LcmFrM3hXb1R3VkM4OXRWblJKclVFOGZ5U01EeXBNTGtzTThoWityengr?=
 =?utf-8?B?djZFZnNDeFJ5dFJ3b0xYRGJEamV1b05EWjF0RVJGRU1CL3FtWjVIVjBnd2Ju?=
 =?utf-8?B?Mm5xVjlRNjB3SGFVaXkwTmpSK0ZRRXF4NUYwWm9IMHRETVpNemJOeTBaTjVX?=
 =?utf-8?B?azlXMmJYUTdXSjZTbWNtdGlYVzVCc0YxaDNXNFVGWFVvWXM2RXk0emg2UVFk?=
 =?utf-8?B?M3FmNzVRVXQ4eXE1VmJEQWJZTkpJb2htNG1LQnZCT1g5dVRWSmVGaVNlaEdh?=
 =?utf-8?B?cis4MDUvREtYS1BvMGh5U0pFZDBrVFBubjBRRWdrVXovUTVtTVAyMnBWQk5k?=
 =?utf-8?B?Z2RjVUFMTkdaOElpL2NIOENYaU5CeitBeWRTSkhmT0V3ck5xL2h3MmQ5U1Nm?=
 =?utf-8?B?SHVKZzUxY0dNQ2drZkRvbVhJanFISTZIWndzSVJnN25STWxueTBZcCs3dmx5?=
 =?utf-8?B?bmU1NGpQSXA3R21UM3JWSWEwMkFFWE56ZzJtR1FxcVg5clQ0L0tjR2tVeVVC?=
 =?utf-8?B?R0hVQjhENlhqc2tsZ2lXcjJkanM2TW5YNWJZenFTWlJCTk94d1A4Vnc1c2s4?=
 =?utf-8?B?R3ZvZWlkTUNQYUJtc3FEUTkzWlpnM0NUMDdaWURidm5icnVvdkN5ZEZySjNm?=
 =?utf-8?B?Y3B5RTgzYlpmUm9JcjRIRXFuSjRUSjhGWDkzZFdYckF2SU9LOXkxZkVqQko2?=
 =?utf-8?Q?Mi5zqicbKBo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlJKQnZGbzZ6VDFDb3FKUGlMRkxEV2pDKzJFZ3QwaXJhelp2MjlZWDBLZitZ?=
 =?utf-8?B?RTRJYm02dFhxc3NYRVFqY2dzeHVpbWF6Z0hQT2VuV1FTWjUrSlZHNnZtNUFl?=
 =?utf-8?B?aFVHb0JGVHVQMC9Tb0dMOUZkN2VBbnlGVXMyZFJKbEJaY09rd3JPNGllOFZ5?=
 =?utf-8?B?S1d6eUZib2xPVXkrUW04OUJucTA0eFVobmZoVmoyeGZBNVZRMUord1RSbXpX?=
 =?utf-8?B?NHUyZnJiU0RVeWlFb0FsM3YrMEs1TTNtejlkSngrdWNFbGtsWDIvMDFRZHFo?=
 =?utf-8?B?TXpRbm9mcWJlYWUyVGdsTDZzN01xTnM0MFRVQWkxTFZrQWxERGJmSW5YQXFr?=
 =?utf-8?B?R1BnNEt5YmZkZkNQRFdLNmVmdWs1L2syby9aeUlvZjVJTFVvd2RONVRUV1N2?=
 =?utf-8?B?UUZxeGl4N2hmRnNIWHhuNWo3YzhsOVFJMm5yakJ4ZUw1ZFhHVmxrZnhpcHNp?=
 =?utf-8?B?YncwWlA5RWxpZ0t5Y2dtNDVha3FNcFV6emUvYVp0SHFmSGhCMEIyQjgyb1pH?=
 =?utf-8?B?Tmg5aDlCYi9vVkYxdTFkUlJHb2pZSlozNmlGOWhYc1l1VHlHNWpvcklybU8v?=
 =?utf-8?B?WkM0b2hoSVVnNjUwQ25BMXhMS1VXUHRNcXVNV0ZZVTlhTnhzV3RZNnphVkcy?=
 =?utf-8?B?NCtndGJ2T1hmMjFWZWRwMWtLY2RucFZ5bXovNG5wVHJVaTVsYzJCYlNMNFNH?=
 =?utf-8?B?ZEx5QlhVNm5pSkh1bGxNbTZVdjEvOHpuNUE1ZVNjSWcwa25GQnNNVTFQdGNU?=
 =?utf-8?B?Tk5EN21CZHhsQjJLSjUrVlBKMFlGNENMa0N1Rk1ZdUg4YjUzN0dIMXFSekZs?=
 =?utf-8?B?UmIzUkc1SEJmZlFEKzZOWnlUWnF5bU1yRDBoMHBlN3p2QXJVdnZhemNGMkhp?=
 =?utf-8?B?d05VL1FNZFkweVVPeWdsbHJDQTl4NnpiSllDYk16ek1USDBDVUlLVjRtV2FN?=
 =?utf-8?B?T1MybE53K2cvTldjOTNOejJMUU0vRllxU1BVUk1aMCtyNjE0V1EyQ3lQZlVt?=
 =?utf-8?B?aHljenBYY2F5Zk1DMDMwWGpONG9wODVtVzIxNjRxaFppQldSQm9YQWZMSWNI?=
 =?utf-8?B?WS9XUzZyL3Q5anhLWVArZnd1VFF2MEdzVEozdk9xVUZZMXhzdFlybTNuamd5?=
 =?utf-8?B?ekZPNnhDcWE1elRKMUdaUEpoNjA1MkdwZ0xPaUNMaVZ1bnJibHhXdlM5SkxC?=
 =?utf-8?B?VE0zZm5GOVB2eExQaElZYjhZMEl4SG01R0NWNm5YUGFOWTNCcEh0ZzBrWDFk?=
 =?utf-8?B?alRvbkFyeVlnQ29aYitRWTJuaVVVVE9Ka3dGZzBPVE0wbkVNYitLUVEyQ2dP?=
 =?utf-8?B?U3BYckQxTTkweVZaK0RYK0JZOVRPREh5RU10VzlZRVV4am0yZ3kyWUhsUUlv?=
 =?utf-8?B?ZitHNFMwdHZUcVZBNU50SzRsUmtsM0pUZGJ6d2c3a05JVVo2WXZYTFYxcjUy?=
 =?utf-8?B?em5SaHhMYUwrUmpXd1pnQVQvTTRvR002ZVlpTERaL1pWMzNxZmVRd2FOcWJI?=
 =?utf-8?B?R1FwUGU2T3hmdEVwajllRkpGL2ZZNzV5aG9vTmVGbUszQ0VlUlVJMW04U1Bk?=
 =?utf-8?B?UkhDTFRHNFBnVDFWWkhhVXQ2TDkwM2xSaEpXZ29sMjY1cFpneWFrWkQ4clFG?=
 =?utf-8?B?T24rV29MNml6eENodXo2ZEVTcys3SVkxUEhpYWt4UE9hakxxcjZUcUdobUZh?=
 =?utf-8?B?MmlxbGJYMUJCVXNLbzV6dXpEN1IwWk5PbHA5WU5venVvRXo5dmlRZWx3K0pS?=
 =?utf-8?B?a3hwSU9nZWE5Q2Z5b0hUM2hiUEQ0Y3MrcktuYnRoUjVsUjhrL3p6ZUNnYVpi?=
 =?utf-8?B?Vlk0aUREa3k3aVZLSnRFWEVLbDRXc2E4UWN3WXpaRGg4Q3RjQ0RyTjdGZnNz?=
 =?utf-8?B?R2dKSkNzanYvaUx1TWJlVXhld2hjd1FtTWh1dXFhREtxVHdJTk1Lb1FLQURz?=
 =?utf-8?B?MkJaUEtQbFA0cmtORHZ4bEd2emduUG9MZG95S2dZbEJHVlI4SzM0WFJlS2ox?=
 =?utf-8?B?OE1ZbVIrMkQ4TVVmWm05NlFSZEZVby96N2ZybWhSSWJRbEVMaUJTNkdPSVBo?=
 =?utf-8?B?d3BQQXpxR2hvUkhIV1doZjN1QTdnT2xzVU1VaDE1QW5GZzErNUJmWStqYzJW?=
 =?utf-8?B?cjdMaWlRYmd3WUt0aFNhVGNUWFU2OERnM2szTTc3Mk03UnNkMStBU2RTa05w?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a019f0-6522-49ce-c744-08ddb4d0a875
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 16:44:03.2787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXSe/t9UkUA9Am7/Xy5rfcUsw86DQXRjk2h8N48VpqjryD5YOsWrsX7LUA+cgeaR7TME9RQO5QcvzoBubnKWCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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


On 23-06-2025 15:49, Sk Anirban wrote:
> Update the vram-d3cold-threshold test to include validatation of VRAM
> self-refresh (VRSR) functionality, by including checks for VRSR capability
> and ModS residency. The test now differentiates between D3Cold and D3Hot
> states based on VRAM self-refresh capability.
>
> v2: Cosmetic changes (Karthik)

v2 changes are not fully cosmetic !

- There is 2 buffers size reduction from 4K to 256, 8 Bytes.

>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_pm.c | 49 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 48 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 7e9324eec..103baf574 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -144,6 +144,27 @@ static void vram_d3cold_threshold_restore(int sig)
>   	close(fd);
>   }
>   
> +static uint64_t read_mods(device_t device)
> +{
> +	uint64_t mods_value;
> +	char buf[256];
> +	int dir, ret;
> +	char *mods_ptr;
> +
> +	dir = igt_debugfs_dir(device.fd_xe);
> +	igt_assert(dir >= 0);
> +	ret = igt_debugfs_simple_read(dir, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not present.\n");
> +
> +	close(dir);
> +
> +	mods_ptr = strstr(buf, "Package ModS: ");
> +	if (mods_ptr)
> +		sscanf(mods_ptr, "Package ModS: %"PRIu64"\n", &mods_value);
> +
> +	return mods_value;
> +}
> +
>   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>   {
>   	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
> @@ -561,10 +582,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>   	};
>   	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold;
>   	uint32_t bo, placement;
> +	int vrsr_capability = 0;
> +	uint64_t mods_value = 0;
> +	char buf[8];
> +	int dir, ret;
>   	bool active;
>   	void *map;
>   	int i;
>   
> +	dir = igt_debugfs_dir(device.fd_xe);
> +	igt_assert(dir >= 0);
> +
> +	ret = igt_debugfs_simple_read(dir, "vrsr_capable",
> +				      buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Debugfs vrsr_capable is not present.\n");
> +	close(dir);
> +
> +	if (strstr(buf, "true"))
> +		vrsr_capability = 1;
> +
>   	igt_require(xe_has_vram(device.fd_xe));
>   
>   	placement = vram_memory(device.fd_xe, 0);
> @@ -595,10 +631,21 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>   	munmap(map, SIZE);
>   	set_vram_d3cold_threshold(sysfs_fd, threshold);
>   
> +	if (vrsr_capability)
> +		mods_value = read_mods(device);
> +
>   	/* Setup D3Cold but card should be in D3hot */
>   	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
>   	sleep(1);
> -	igt_assert(in_d3(device, IGT_ACPI_D3Hot));
> +	if (vrsr_capability) {
> +		igt_assert(in_d3(device, IGT_ACPI_D3Cold));
> +		mods_value = read_mods(device) - mods_value;
> +		igt_assert_f(mods_value > 0,
> +			     "Mods residency is inaccurate: %"PRIu64"\n", mods_value);

1. Asssert print can be, "GPU couldn't enter ModS !"

2. mods_value need not be printed, as it will fail only when mods_value 
is 0.

> +	} else {
> +		igt_assert(in_d3(device, IGT_ACPI_D3Hot));
> +	}
> +
>   	igt_assert(igt_pm_get_acpi_real_d_state(device.pci_root) == IGT_ACPI_D0);
>   	gem_close(device.fd_xe, bo);
>   
