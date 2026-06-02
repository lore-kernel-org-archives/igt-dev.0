Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FD7CD6E57
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 09:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D4D10EDD4;
	Tue,  2 Jun 2026 09:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqLQdtR7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7CF10EDD0
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 09:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780391801; x=1811927801;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B4y3GFraXvNakzzv9QveqaycvIp13kCYeqoYwRqvcnM=;
 b=KqLQdtR7F3bN+fWi5MG+HrrEoTCZyrpCcwsvcD1hhqtrJiSQwhQVsJY8
 yMqXhLItkAKiXCS60WIaUS7f64AIOYZmLUgf3eF4l0SC+Qli5z3tOdJLc
 3AxI6MdO5CSKLkNK1JEVvBl6fu1e7CSCIalqKhQvGn/SFx4VrCDC/0Xtu
 ZOpiCuVr7XfC9pSQzRTevWuZIe3J3Kak9wY4k72zb1h0drdhT25ER6DI/
 QiXLJZT7b1kniKS7A1S8Pk5X9kt3E6JoCGXtblCqaGCr8bE7oLF0xes5R
 tmx8c3uBhFxw/GjV7Ekn6UzIXrV+/U9xncytx1wdagLiYYX6yaLAXXTyT A==;
X-CSE-ConnectionGUID: bCql7++mTzaTMenhtw+bnA==
X-CSE-MsgGUID: FghWFe2qQKe75NmW1Ud6UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="84795881"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="84795881"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 02:16:41 -0700
X-CSE-ConnectionGUID: AzzvkFoOREajvDcbID5M/g==
X-CSE-MsgGUID: vN+hbcC8SGiyoIoqccLlng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="267717682"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 02:16:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 02:16:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 02:16:40 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 02:16:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6AVWUa4cOkPiZiW+8U5xg8try19mlcImvgdcANq1ZD4IzWmHu09AbfOsNDpoKteD8KlwHRujScWv/tNJ5TPR4U0ww3qv9mAdPVc/YOZ72zRVNeAR1IGHENv+A44cS0UzgwdIAlI8o60zDY6w0YM59RjmhnPJCuUYoYlpPA4/LF+ES8A5nz+aPNKmf8Kk9wRuit0521+FtdLRPAVS2dOq605FhlHdvtBSA0inTBZNe7aX7ngkGUFbJAU6cQdBIgR/kYJWWdxivOPCKO00Nv9YMK45FjU2kdTPmCTklEVxnmJDyAYf785eK4rhDk1/cy0RrdtsZCbGjLiBsR4cdXjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhVnlhBQ9mkIaWF9YgnbYHQ9fhlm8NDEx9U+y4KsIMU=;
 b=x6YV19wVYDoo5U4Ro1HXAVpySjjEM6saOjkExWk/p92xApwSBu5FpzSluMKtfjiIbat5cRcf4+hSvfnGQCRcNjIymzNd8zvV4tKj2gir/ZhWp+0sferM434/ZA3B74hfgfT5SxIo4OfgBtX3SERioR4WDZPYb0Ei7V+MXJvfOeWtbV/WWu4XZGnX64o1OpAJqAFxzjw9qsXuXtrG1X3HVdVS7OXMqHSyqk0kelyo57ylYTbKRuelWncDGNB0B+8D156O+4vRjuvu75zNjKq7gu8VWdZm68LmyAk8xgtUNGaLP1g5NgynNCZc4eY8xyqgwjMDJybdLKzjput/qE0FgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH3PPF957B3B2A8.namprd11.prod.outlook.com (2603:10b6:518:1::d39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 09:15:36 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 09:15:36 +0000
Message-ID: <900c010e-acef-46b3-b9f5-cd5fe9805280@intel.com>
Date: Tue, 2 Jun 2026 14:45:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_bw: fix connected output count when
 connectors exceed pipe count
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ramanaidu.naladala@intel.com>
References: <20260602052407.3326517-1-sowmiya.s@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260602052407.3326517-1-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH3PPF957B3B2A8:EE_
X-MS-Office365-Filtering-Correlation-Id: 737f54d7-b24e-4d82-b1d9-08dec0878163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|42112799006|3023799007|56012099006|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3ZkzDaZvifh3ZT7vLQ6anxhFgyrYMSmRWtBdGdFJOCWSMpvi2jGdIfVr4ZH+NqgNrChoAAOFB1KVMJaYrTfU3Pvzc0rOZYzdyFFUigva4jZIl6/alPbaL7aRneGjyucJ34fMIrsXE3MwZDKupXJgWHc0WuwtGKzkEbqv2w6CVvCdwTDMmey1S9tcuXsJmKQuC0hPdCDUfBP0CKNy7GoTB41HDgdh5xCRkEtWxdIoTQKuglmvBtOC3z3lw3iBXt1nOK6+0Q+KJ0Ty2iLaft8RUdjEjlA0C21mCu+or8vCbIKLLfuOkrK2SBkgIp83298Bt4+JlyW5fJNELvEP3g/goyryT9728Fk9btFPSosDkQuoX8ZXhMDbxezNJQSZJb+eL2lBJ96p9Yk/Z5j6U4LY/s29V4Z959cG+iJy7jgd8EWxXfH7DQpbkqkVwi8cpGr2d0D1YK2wpraEPiev5g6RIQ7/h+2eb2BXglG6V8bqA0vcfhMhCTKLsrRLsIMqSPrUCrG2asfhKkteQ4Uas8Tc3JVQWTW6cphB7WxpnCFOgiQNyvlAqpcGvSkmn/ay48iDzBGW9NAOIY7eBrL55dm2UL6u5I4vYExNoYcSETw8yBwFMgjscDSbP/QsgBx/6U6ZrvBDEWd3T8pgMOow/w4uF1yDqQzBfrhmnjUsKPGZf4bLuJ9NaakrUgZNgmQBiQX5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(3023799007)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2orNDFlM0ZPK1lpbFlXVjZKczREM0E4TGNBa2RZN3hVemNXUEVudit5NnhG?=
 =?utf-8?B?L28vdW0rTktWVU9FaWFTN1JvM3BQWm91cjkrUGxkazF1UHZlSjNHZ2dHMjZ1?=
 =?utf-8?B?dGJJNG5MSmZMbStuUEhhV1pDNjFUQVZCNjQyOTdXb1kyalVRVnhTSGhRSXNG?=
 =?utf-8?B?V2VzSVFJWGRycHlyV3dncWY2blNMRjhKVitScGwwbXluMHN6bVE3aVk5cXNK?=
 =?utf-8?B?RmhDdDVQcjVnWFE0Si93THljVXpiTXlSbDk2Y3VJWDV2RmNUWjBQeTk1c1Mz?=
 =?utf-8?B?c0MydmNMZ0JYdWt4alhMQnl5akNpU24wRUhJUktuUWw2V0hBVHFvQUdPQWZC?=
 =?utf-8?B?ekdtVGVIalBDTzluTTB3anVMczg3OU90ajJiQUNkV2M5OEJ2TVU2dnlTeHYw?=
 =?utf-8?B?NnFvQjhaOUQ1S0I1UmpvYllFNkN0c3RrditMdk9jS2FEZkJJS0FiU1h2L0x0?=
 =?utf-8?B?ano3c05PYXdYTmRrSm1RRXM4NXNLZFhOU2VjSnNCSzk3Kzl3Z3prRnh4dGdL?=
 =?utf-8?B?cFVjMXRvY0UwKzA4eW80UytDSjBNVlpUZWRRYnVpb0xJdkFHemhuTTQwZXFJ?=
 =?utf-8?B?QmdEczdFSk9CN3FsZTdXTStuZ0VaNTltU1hRcGl5U1c5SmZuaS8wdXQraG10?=
 =?utf-8?B?R2lDU1RJZndkaC82dm9XNTFWRms3dE01VDZEQ0N5UFhZdEM1VGRYc3pLQXRk?=
 =?utf-8?B?bktnaEkwWWl1T3k5ZVV4NCtQazBjOXA2S2FRUmY3SklKL2hyVlEzOTQzNHNu?=
 =?utf-8?B?Y2lNbjE5QXk2d1BZV2V3NzFOdTMzZndUUDFWL05PODFYbjFDTnd2cGJBQitr?=
 =?utf-8?B?RU9EU0NacnRqSWJBSXdRa1QvSStyaUFPc1lhS2xablJGS1pMN1p1SFl0bUxR?=
 =?utf-8?B?TzhLUmQ5ckVBMUNNSlN3NlRoSEdNeERrT0RDY2FpTHBHUXBxaS9Nd0dOb0pk?=
 =?utf-8?B?dW8va09heHJ3cm02UHFrWmVVdllWZ2F1SnRCSG4vaGtRWVovYUZPMGx1S2gy?=
 =?utf-8?B?Mm9ucWVIbmRZSXJYaTNlSmZWa2w0Ukhad2EzNTF6MVZqMlJPYzFjei9aTS9B?=
 =?utf-8?B?MHJMdlpTU2tYUUZ2aDZiTzRBeXg5OTZvYUJON0prSGZyQkw5NzZHTllUanhC?=
 =?utf-8?B?Qm1XbWwwcU1ZT2VrQlNqSGI3RStqcm9WTk0zN2IrTlNVYmJ5SXhaZnkxN3Nt?=
 =?utf-8?B?QlNTUmpQNnp2clEvTE9nOTBzdmRCbkxVRW9tVkpoOWRjekcrbWlucGhWOXhw?=
 =?utf-8?B?Y094UUk1MGN2bkpHdzNiVnJTa3FrWFR3b2VFQ2RGMFZCdGJGWWkrTUpyWTc0?=
 =?utf-8?B?bWp6UWxqTlI2OFF0Y2xhbGltbVQzVlBudE5LVGc4REJYSDlXQVBzT2U2OEJt?=
 =?utf-8?B?Y2ZXK3VReDZXYUNGSFlZVyt5a0FlVm5nZy95SGNwd28zUFAwb25KcWY3dm1z?=
 =?utf-8?B?M0svUXd5LzdVb2toNDh4VU9Edi9QYVJJamh3SURQSy9GalJmS0NSeFJNL1Q3?=
 =?utf-8?B?T3NiWTVBekRNK1I3eEZoYSt4Q01LNWNMcHRaa3FvTGcyL0hIbkpiZWJXWGF6?=
 =?utf-8?B?NTY5MmhuZHhKRG44TXVkUHI5MDNKZnNqdy9MM2tia0FIWEtOQldDa1YzbzFt?=
 =?utf-8?B?MnI1emZBZk4wRmg3dWVheC9Qa25iSGtPRC9vdG1PU1JuVmZLQUx6U2pZS3p1?=
 =?utf-8?B?R2FNN2crYmErL3FKTmp1d3F6WGNvenA1THYrUlJDVUhqTCtzRUd0SFhLZjA3?=
 =?utf-8?B?VGUyTzB2SFFxM2RndndXU1BwazJxb0YwYWF5VjlTZllkTXJVdFhZTUluY0J4?=
 =?utf-8?B?L09tUlFVNU5VQ2hYdTBXWlNRd0NXUnpCL21nc2xKbDFjd1N3TUxrZ3owcGdu?=
 =?utf-8?B?cEJlTmgzb3V2RFR1RWJLSGtyK3lJUjc0WU1nRDd4SExGb3phMSt6VHY5OG9Z?=
 =?utf-8?B?bU40cTJLKzFkeDFJbDdDUUZiQlcra2lEdVlUc085ejJwajVyL1AvaUdTSlRk?=
 =?utf-8?B?V0RybVFEUEZ6ZEtISWZqTlEySzE0emlBS0FrSllZK2lKTmZPTjg3c0puYktU?=
 =?utf-8?B?eHZmdzFWN0J2dGIxVFZLRFJsSHRPMEp3YUYwTTBsNE1GK3lsZ2ZjRFhUL2Rt?=
 =?utf-8?B?UmlIWVpJSEo4YVpUb01vU2JpZ3hyNDJoRnFVWmtIWGI1WVpmOWNaZ2MxWGZa?=
 =?utf-8?B?L1RsT2pXbDM3WFhjelFuS3NpS2tmSWh3NzJTZUtaR1VoRFYxNk5sUWZ6Q3I2?=
 =?utf-8?B?QlE0RXVybUN5MzBCZEFoMlR1N1RHVFQyWnhBMEc1bEpNRzZlMHliYlI0VkJ3?=
 =?utf-8?B?bElDZ1pSUTRiUG9JcjRsZ0prUHNjMVUxODRpRHMzNTRqZExHMHNyZz09?=
X-Exchange-RoutingPolicyChecked: pc7p3KsT3d21CKAjrLU9srx7fMEQaf9itaCfwXDIn85RdAXuz5ridprspkD9hdnIYe4n6nZJ8i5LYFFjJCJxAUE7CglBL6mVuPzLFGSkOYTJyuG0ogywjb/2RzSrRyeSRm7pvkNKvH0SLil1gKxBaw4BiIW+emL9Aax4fzz3eAYF0/JLEKvpnbzrI4R8VhwPAOk8XlRplGcXjT7VFGbTiWxQWpEHGnoD4VSjyyUZVryoxNFiK+w1ZT/rRthcL/VLBr7gXmLC4+dQjN+eGmi5+Bgkzvru/FonDxzHzoRoRlr/gPO5A7qswP5/T5EFRLHim0vczsSS9NqK1L34Dvjxbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 737f54d7-b24e-4d82-b1d9-08dec0878163
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 09:15:36.1393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvR8T+N73QZ3m/1BDaMO3g/pDBa8wgnqI5Yu8lqPpZ8SS7KjQw+MxyBmWnxj3tOJ1bK10FXuF0/U0ItML5LUIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF957B3B2A8
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

Hi Sowmiya,

Nit: On subject line, fix -> Fix

On 6/2/2026 10:54 AM, Sowmiya S wrote:
> Decouple connected output counting from the pipe-capped loop in
> test_init(). The original single loop capped at max_pipes never
> iterates connectors at index >= max_pipes. On platforms where
> connectors outnumber pipes (e.g. eDP, DP-1, DP-2, DP-3, HDMI = 5
> connectors, 4 pipes), this causes connected_outputs to be
> undercounted, making connected-linear-tiling subtests skip even
> when enough displays are physically connected.
>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>   tests/kms_bw.c | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index f695b25d8..8067186b0 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -132,6 +132,22 @@ static void test_init(data_t *data, bool physical)
>   			igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
>   	}
>   
> +	/*
> +	 * Scan ALL connectors to count connected outputs. Do not cap at
> +	 * max_pipes: the number of connectors can exceed the number of pipes
> +	 * and capping would silently drop connectors at indices >= max_pipes.
> +	 */
> +	for (i = 0; i < display->n_outputs; i++) {
> +		output = &display->outputs[i];
> +		if (!igt_output_is_connected(output))
> +			continue;
> +		data->connected_output[data->connected_outputs++] = output;
There is a possibility now of out-of-bounds in connected_outputs as the 
size currently is restricted at IGT_MAX_PIPES. Please update this.
> +	}
> +
> +	/*
> +	 * Populate pipe-indexed data (output[], mode[], w[], h[]) capped at
> +	 * max_pipes, since these arrays are indexed by crtc/pipe number.
> +	 */

This comment is redundant IMHO. With these updates,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>   	for (i = 0; i < display->n_outputs && i < max_pipes; i++) {
>   		if (!data->crtc[i] && !physical)
>   			continue;
> @@ -139,10 +155,8 @@ static void test_init(data_t *data, bool physical)
>   		output = &display->outputs[i];
>   		data->output[i] = output;
>   
> -		/* Only allow physically connected displays for the tests. */
>   		if (!igt_output_is_connected(output))
>   			continue;
> -		data->connected_output[data->connected_outputs++] = output;
>   
>   		igt_assert(kmstest_get_connector_default_mode(
>   			data->fd, output->config.connector, &data->mode[i]));
> @@ -151,7 +165,6 @@ static void test_init(data_t *data, bool physical)
>   		data->h[i] = data->mode[i].vdisplay;
>   	}
>   
> -
>   	igt_require(data->output[0]);
>   	igt_display_reset(display);
>   }
