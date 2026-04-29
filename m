Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBCDFF8867
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 04:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EFD10E3B9;
	Wed, 29 Apr 2026 04:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaGLqAXv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D199310E3B9
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 04:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777436291; x=1808972291;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uQWaVpnblJoKspBTUJBSk/ZtNakgUKwJ4HsWuSsnGw8=;
 b=AaGLqAXvKLPNP+9cLuBG5pPWt1v5El0JATfyKdthylKAKp+pYfpDK0QX
 v5Lw2FHCifHcm5FjshVwjZkgk5c38OGIapkZENjP4dK21zA3DAzL/n6Qy
 o8UmRxsSg3o3A/oH8rUM01q1xwDiYHypwcZoHfGNGMyIUz058BAX37+zC
 mcClX2K0Z5ZeCgr0Yq5zpUwxNmMFowOLhIHLBhVmV5fyLcr8xs/vgCciP
 HqhEOK1/U6BqxxIpHrkmRS5knqB4bN6tGaPQGG0eEuxIXBgn8Lg9I6OWu
 SX9TRWUmB7Xj0JjS46lKMoZiMvqdkS7xhng/BOZMCkNAs0dDzt5nsUf7q w==;
X-CSE-ConnectionGUID: XWkzQLjaTtWtC/sjHw3igQ==
X-CSE-MsgGUID: wJ2RnlK/R/6cNyN3ztWCdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95775414"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="95775414"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 21:18:10 -0700
X-CSE-ConnectionGUID: MgvKIJykRxS7Gr8D7RfvvA==
X-CSE-MsgGUID: 2tCmNc//QHSHr8432pxxPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="231007306"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 21:18:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 21:18:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 21:18:09 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 21:18:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTzdYqzGbBWoKlWbD1JsmiBJH8z+TDs0Vci4G0sNefEw7rksCqaGxirTde7/HKKVKypFo+RnSxOLMevxdV9HIlRF1ao+pQ7S1hv4O1+eOwY6yD0CVWnJjQlHvJ1guqbqCoWb+rM6yg6nFeHCf+8lMz++HmqLxWG7LtTeTitAwXVzSa8HrkPe/RfCzKaaxeFme2QLXkYvT8AyOdfKygf8otj9LPgANUP5u2kSTCkwwb7XVH2xAoJzs5lXdmuiNvGRq9UJhBhmu2cXb0w8wPFdSpFDgTecJkwbP5oFu7x2Hp5t+bD+rzI6o4S96GS3ZSwgHaekYm9pj7KasU980c1Lwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vymmQ4Wbcu5Y7HLkOWVkqCVGq/RIuXg4qCrfDmHWIEE=;
 b=ENCb9XBMvbpUwdrpe+17qi0wXVibvf7ap1z0bF3DZXbZK5MlGuu1yDe3rtCr+9rqO0b+luBKYtxxXsnXZw7PmsOHniHO9baIklSrGYyLaZoqqNBLd172foXSB76be+oeQnf4Q7poTlvXvgcAJ25sHGB4d9tYH5mdAyuByMSAJjuo3aFZzqjuFd8eLuI2pVVJaB+Y0/+3LWuX6X6wAdTg0Tpvg3nE4hE0NWrh5Ny8T1plv48Aql++AYnsJspTstG5lJb0XOpvZ/UjKRP3k8owIjAP2WCNfqGS0939GcF796ll2VOJyhixj+55JZzHuK/AkQIxcYLiyMqqFDxVFVmvEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 04:18:00 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::70ce:b376:4721:9b85]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::70ce:b376:4721:9b85%6]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 04:18:00 +0000
Message-ID: <6bbcd9df-e9d6-43ea-8043-f44d1273c523@intel.com>
Date: Wed, 29 Apr 2026 09:47:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_hdr: Move capability checks inside
 dynamic subtests
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>
References: <20260427144904.3695397-1-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260427144904.3695397-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::9) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|MW3PR11MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f187190-4634-4cf8-085d-08dea5a64c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: eoiR46/cyHqiQ/rn6pOS5cwQnKAyrch+LLUP4AU8kApzglpE+OBuWbgRqGc6XmtYpLmiOVGjf1yD0alFUW/zyR/HnhUWiRhOYHn3PFvGG84lfRgE/wLpgAvbj5EP5V9HCaOTXVbntBR8KQUObx3aS56V9IV+01HnzGZ0RvpbfODqm7YriCJyPX/3qA0Uzg5oeN7ZlJu3X9OuGUhgpjbPzOs1fcKUxJmZhM+/K9YlWg5g7g+Hi4cULSvim/YAO9NznbtwWv2i7QQCufdcLLmnmU3amiljcP/iYulHDZHcIMWePL2/USB1ni2VP5uezOTxXm5yiP7ZVXDO4FE1UNtM6LkkHO0NvyVA2P46gxXFa1GJZv8XayPerfkYjk2KguzMVNdBmkHkcpbkexiuuSaBVwgRZxjIgpq1WjK6FYoQdssylKn839qkSqlWw2UVL8NkPwxO59mmfydvQjvhOvs08vTJ5qytbx1h3EAbVcryrLfh3OPru3liwQiqAKJzWoUCyCJujxuY5bxyvmXTosoH9fbpynFOFfK1TPSIhW1mPBCuMJWPg8HH4Y76OJ3MbdRizsElQRHxUkYMxlEs/ZVnV/MYwO/tKtEobYsibw4TO5a26hm1+ySqGd/VjBXpJqfltGR72t9EuMkSnhZzVFqJjAwfiikpP2mE5kvd9RTjGXzJxxd3WI4iZgGQ0/NXgKnP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGhjUXBlK3FMM09CRGdpWlExVTd3bkxnZkE3MFZEclg3aDBhS0pRY3JyRW5P?=
 =?utf-8?B?YmduUDZveWtmeE0wN1FKM1FHYU5ua3pEdFRNekJpOElZMGJ5TTFSMzJqcGhv?=
 =?utf-8?B?bVhHOXlLbFlhSGtIeGxwQ0tFdUM3SkJDSGE5SHErYXJxMzVsZnhKKzJYMXcz?=
 =?utf-8?B?MTR2Nzd0VTcwRFdMVWhHdE5IU0hQNVBsVWhhYjNrNkRTdDBLYmhJQWNqUkhP?=
 =?utf-8?B?RU01eU5SY2VvMVZPeXlUZndhNUloU21PWUgxN2pXeE12ZXEyR2FvQ3IvSGha?=
 =?utf-8?B?YVlMeHN0VWwrdWhsY2d5S3NWc3g3NDBOTmdmdTZ4Nk9nTGVia3YvcHFRbFVR?=
 =?utf-8?B?YVNyRXVENWRPV2V0eCs3VXFWK0k3aVNHQ01rZGNpQ09xeS9TYXpZN1Y0cTBt?=
 =?utf-8?B?NXpNZzNmWXJmT0o5TnNzNWtpU2NERFBLUTR3MGxHakdGbU5uV1hRVXFqNzFK?=
 =?utf-8?B?dHlacTJ2WVNaZ3dGaEZKZkppb2NjcythNU50aVcvenZuSEJMTW41cjZZek1W?=
 =?utf-8?B?UURLU2dlT3hWSER0MVlMMGErdVU3V2tsOE5qbVJ0bWJacjhYS05iVTJGdmFI?=
 =?utf-8?B?RTJwL3AwcGE1UlI5Zy90WTVKTlRkeUtTK1ZNd1d5OXpIVlJ2TFZ1UmFEZHpl?=
 =?utf-8?B?QXQvaHg2TWloaWNIcmRZeE9ZUkFxUDBYSXN0OWlNeC91THZCTjczRGc5c2Z4?=
 =?utf-8?B?S2hEOUlkV2FadEZxNlpWYXFqSWhVUEtwZWZSSmJqYUVaVFVaUGE4RngwWUwz?=
 =?utf-8?B?UVNTVjU1aUlBQVc4bC9ncFIwTityL1k0eWNXeVVjMVRhMU5jUVU0YWhnTkMx?=
 =?utf-8?B?dmg1SkpqN1R4aDZNWjJzeHhUNUNJeDRZK3FYd21ZbjVMamt5UWU5S0hIajlp?=
 =?utf-8?B?U0wvMG9KOHp4YnZSMno1SG1ldnErYlhpMkM3MXpkTEErTGpPMVJnaTdCQ0cv?=
 =?utf-8?B?S1JlZndKb2ErRzdGVXZSZHhHa2tVcHpCeTFHTEJsaTlxRXZyK2NreStMeWRt?=
 =?utf-8?B?c2ZTUSt4ZmUxSXVpSFc0R04ydm1lbEZ2VWZ1cUhwbkMrUWpuZ1BPc1BLVkJ5?=
 =?utf-8?B?TE9wSTV6R0Z6eGZrLzVSOHd3ZTIxNHk3a24rRzUrVkFYT0ozcUp2Q3hTK1ND?=
 =?utf-8?B?OVJEamgvc0pzUVN5dmN2V0ttL3c4NjBmRUpoMUVxQVIwSHpGcjVCOFY4Tzla?=
 =?utf-8?B?bWh0b2RxYmN2K1Q0a2s1TVkreFNkU2ZxRDRqdnJJTHhLREFNMGFVbU5KOUhC?=
 =?utf-8?B?TU51Z0ZUUVFCRVpWd2FjZzZkRDIxRE9vZHJJSFd5MERtLzhYS3hQRU0yNVEv?=
 =?utf-8?B?eG10ZUpGcHFPRzcvMUNvTmVuOUJmNDhuQ0JTUEoxa25qQTRpeERjWTUwTjJV?=
 =?utf-8?B?b1JqUVV1R2dTbS9FMk9maEhPNTFTYUZGbmdSMlJHM0RLMENBWVNBRW1HdDIx?=
 =?utf-8?B?QlVsVGptOUloL2tldGxqUU8xb0VRdWpESzluYlNRbFlCRUI5Zm5UN3BZaTFs?=
 =?utf-8?B?UWtZZmRXUjBqcW9BUVRjRnhtVmE0VFU5MmVkcERNa3Rad1h6T1FDeDhFVXdJ?=
 =?utf-8?B?cWs1eVpWcWtiMjhhNXV0OG5ESVRXbFRueDdtanhqM252YldxNzJONEM3MkxX?=
 =?utf-8?B?cURDb2JYNkxRblpuMWZCOWhqRXJZdVB0VTV3WVdWUGZSM3c2ODg0QUFTeUdH?=
 =?utf-8?B?TlpDOEFSQmF2WitGa0p2Rk5aOGV0RG1VdVcyaUNmM29nQkhkaEZkUlVrZ2R4?=
 =?utf-8?B?R0hwdXlNNi9STWFyV3E0VzdQc0hxYVFVRWxNaFZWcE84VnJld0kwV0VUUnVG?=
 =?utf-8?B?Tm5BUkhENG1FRGJqNjdIL2dLUDJrMUZJbC9hb3lISTY5UDllMmE4UmxvMXZH?=
 =?utf-8?B?QTJzcUZXNVk2ZVNjWE5wYXZNUXhxckNEcUFOM3hWR1Q0dEF2akJNVm1SNW8r?=
 =?utf-8?B?c2dlNEk3NENmWFlWNmNRSnVaWWFyQ3dZNWthWWZGLzRaQ1A4OHVhNVNkeVp0?=
 =?utf-8?B?cTJzZWRGSFUxTWhpKzNJbnJpblJmYTg1bS9qUHUybGRSYXlrTWo3V0hXRS9j?=
 =?utf-8?B?OWw4WmVZQWdJNlFEUFpFUGhJODkzbnZQMzU2N2dPZ0RzUjZzeFJaQWJNT0tu?=
 =?utf-8?B?ZzNDTkxWYWFZWEFCQW85T3lpRmVzaHZySEFPODRQUnFuRS9maEZtc0Npd1FU?=
 =?utf-8?B?bzN6amRScW9ldys5cUFyYkNqMHpzZEpHS01rcFducld2MFk3K0NpQXhoU2xM?=
 =?utf-8?B?NTRhRFpNc2hYL1I0K2dZNDNidnIvSHBEVnptdHdvR0s5Z0Y4V20xeVpQWkx3?=
 =?utf-8?B?WEU0YzRLb0JtQnNqL0QzZWtIQTIrNko5ZGh5RVlHTStXM2dLS3JMdz09?=
X-Exchange-RoutingPolicyChecked: hA/4ka83UfCcGaAq6Ohg5Jf1SpAsxmQbsFPQ0IiHdz1onViPvkb5lBZu+RGhMTTsfJgjLT251KeTM51L52p8ApbQ32pnAI0TGIs7TGhGnnp5C1dkCFtdhAzgLeac8x2LVW0z6/QyfbwfajfiokzyT0eVNC981ykeLhjibORxfqWEsp9KK/WMtHNv2sYLpvq8zRjzw54qPBfGPEqLXeZ75CSuiYnBN+t86jKTGqxLLFwPXYoAshXic0Rq2NHMGb7gJjT417VEouxLF36/gDamWdUD92PiOHQQ1aNaZEwCII2vTD5lZL69C3Tced8Iv/j4YP0lLCSaqFerqyCtyROYIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f187190-4634-4cf8-085d-08dea5a64c4c
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 04:18:00.0732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRDAS50saU1Qka9tmeYkECrJ1bJSuruUFSR+RlUHbPwGhC7nuw/W5vAisuQ19z5FuG94nnnTA/1Za5MCQhrgwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
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

Hi Pranay,

On 4/27/2026 8:19 PM, Pranay Samala wrote:
> Earlier, output capability checks were done in the outer loops
Mention here "outside the dynamic subtest scope", as that was the reason 
the skip affecting other subtests.
> using continue/break. This caused a problem where if an earlier
> output (e.g., eDP) passed but a later output (e.g., DP) failed
> a check (such as reading bpc), the entire subtest would be skipped,
> discarding the earlier valid result and reporting a false skip/failure.
>
> Fix this by moving all output capability checks inside dynamic
> block. Each pipe-output-format combination is now an independent
> dynamic subtest that passes or skips on its own merit, without
> affecting other combinations.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4879
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_hdr.c | 211 ++++++++++++++++++++++--------------------------
>   1 file changed, 96 insertions(+), 115 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index b215b0e6c..20838469b 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -325,48 +325,41 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> -		if (!has_max_bpc(output)) {
> -			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> -				 igt_output_name(output));
> -			continue;
> -		}
> -
> -		if (igt_get_output_max_bpc(output) < 10) {
> -			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> -			continue;
> -		}
> -
>   		for_each_crtc(display, crtc) {
> -			igt_output_set_crtc(output,
> -					    crtc);
> -			if (!intel_pipe_output_combo_valid(display)) {
> -				igt_output_set_crtc(output, NULL);
> -				continue;
> -			}
> -
>   			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
> -				prepare_test(data, output,
> -					     crtc);
> -
> -				if (is_intel_device(data->fd) &&
> -				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> -					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> -						  igt_output_name(output));
> -
> -					test_fini(data);
> -					break;
> -				}
> -
> -				data->mode = igt_output_get_mode(output);
> -				data->w = data->mode->hdisplay;
> -				data->h = data->mode->vdisplay;
> -
>   				igt_dynamic_f("pipe-%s-%s-%s",
>   					      igt_crtc_name(crtc), output->name,
> -					      igt_format_str(hdr_test_formats[i]))
> -					      test_bpc_switch_on_output(data,
> -								       crtc,
> -								       output, hdr_test_formats[i], flags);
> +					      igt_format_str(hdr_test_formats[i])) {
> +					igt_require_f(has_max_bpc(output),
> +						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> +						      igt_output_name(output));
> +
> +					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> +						      "%s: Doesn't support 10 bpc.\n",
> +						      igt_output_name(output));
> +
> +					prepare_test(data, output, crtc);
> +
> +					igt_require_f(intel_pipe_output_combo_valid(display),
> +						      "pipe-%s-%s: combo invalid.\n",
> +						      igt_crtc_name(crtc), output->name);
This needs to loop again if it fails rather than completely skipping 
here if the first combo turns out to be invalid.
> +
> +					if (is_intel_device(data->fd))
> +						igt_require_f(igt_max_bpc_constraint(display,
> +										     crtc,
> +										     output,
> +										     10),
> +							      "%s: No suitable mode found to "
> +							      "use 10 bpc.\n",
> +							      igt_output_name(output));
> +
> +					data->mode = igt_output_get_mode(output);
> +					data->w = data->mode->hdisplay;
> +					data->h = data->mode->vdisplay;
> +
> +					test_bpc_switch_on_output(data, crtc, output,
> +								  hdr_test_formats[i], flags);
> +				}

Please add 'test_fini' some place after the test is done(outside the 
dynamic subtest scope), so that in case of dynamic test failure display 
reset is handled gracefully.

>   			}
>   
>   			/* One pipe is enough */
> @@ -725,88 +718,76 @@ static void test_hdr(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> -		/* To test HDR, 10 bpc is required, so we need to
> -		 * set MAX_BPC property to 10bpc prior to setting
> -		 * HDR metadata property. Therefore, checking.
> -		 */
> -		if (!has_max_bpc(output) || !has_hdr(output)) {
> -			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> -				 igt_output_name(output));
> -			continue;
> -		}
> -
> -		/* For negative test, panel should be non-hdr. */
> -		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output)) {
> -			igt_info("%s: Can't run negative test on HDR panel.\n",
> -				 igt_output_name(output));
> -			continue;
> -		}
> -
> -		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output)) {
> -			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
> -				 igt_output_name(output));
> -			continue;
> -		}
> -
> -		if (igt_get_output_max_bpc(output) < 10) {
> -			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> -			continue;
> -		}
> -
> -		if ((flags & TEST_BRIGHTNESS) && !output_is_internal_panel(output)) {
> -			igt_info("%s: Can't run brightness test on non-internal panel.\n",
> -				 igt_output_name(output));
> -			continue;
> -		}
> -
>   		for_each_crtc(display, crtc) {
> -			igt_output_set_crtc(output,
> -					    crtc);
> -			if (!intel_pipe_output_combo_valid(display)) {
> -				igt_output_set_crtc(output, NULL);
> -				continue;
> -			}
> -
>   			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
> -				prepare_test(data, output,
> -					     crtc);
> -
> -				/* Signal HDR requirement via metadata */
> -				fill_hdr_output_metadata_st2084(&hdr);
> -				set_hdr_output_metadata(data, &hdr);
> -				if (igt_display_try_commit2(display, display->is_atomic ?
> -							    COMMIT_ATOMIC : COMMIT_LEGACY)) {
> -					igt_info("%s: Couldn't set HDR metadata\n",
> -						  igt_output_name(output));
> -					test_fini(data);
> -					break;
> -				}
> -
> -				if (is_intel_device(data->fd) &&
> -				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> -					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> -						  igt_output_name(output));
> -
> -					test_fini(data);
> -					break;
> -				}
> -
> -				if (igt_is_dsc_enabled(data->fd, output->name))
> -					flags |= TEST_NEEDS_DSC;
> -				else
> -					flags &= ~TEST_NEEDS_DSC;
> -
> -				set_hdr_output_metadata(data, NULL);
> -				igt_display_commit2(display, display->is_atomic ?
> -						    COMMIT_ATOMIC : COMMIT_LEGACY);
> -
> -				data->mode = igt_output_get_mode(output);
> -				data->w = data->mode->hdisplay;
> -				data->h = data->mode->vdisplay;
> -
>   				igt_dynamic_f("pipe-%s-%s-%s",
>   					       igt_crtc_name(crtc), output->name,
>   					       igt_format_str(hdr_test_formats[i])) {
> +					igt_require_f(has_max_bpc(output) && has_hdr(output),
> +						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC "
> +						      "or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> +						      igt_output_name(output));
> +
> +					if (flags & TEST_INVALID_HDR)
> +						igt_require_f(!is_panel_hdr(data, output),
> +							      "%s: Can't run negative test on "
> +							      "HDR panel.\n",
> +							      igt_output_name(output));
> +
> +					if (!(flags & TEST_INVALID_HDR))
> +						igt_require_f(is_panel_hdr(data, output),
> +							      "%s: Can't run HDR tests on "
> +							      "non-HDR panel.\n",
> +							      igt_output_name(output));
> +
> +					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> +						      "%s: Doesn't support 10 bpc.\n",
> +						      igt_output_name(output));
> +
> +					if (flags & TEST_BRIGHTNESS)
> +						igt_require_f(output_is_internal_panel(output),
> +							      "%s: Can't run brightness test on "
> +							      "non-internal panel.\n",
> +							      igt_output_name(output));
> +
> +					prepare_test(data, output, crtc);
> +
> +					igt_require_f(intel_pipe_output_combo_valid(display),
> +						      "pipe-%s-%s: combo invalid.\n",
> +						      igt_crtc_name(crtc), output->name);

Same as above here.

Regards,
Karthik.B.S
> +
> +					/* Signal HDR requirement via metadata */
> +					fill_hdr_output_metadata_st2084(&hdr);
> +					set_hdr_output_metadata(data, &hdr);
> +					igt_require_f(!igt_display_try_commit2(display,
> +									       display->is_atomic ?
> +									       COMMIT_ATOMIC :
> +									       COMMIT_LEGACY),
> +						      "%s: Couldn't set HDR metadata\n",
> +						      igt_output_name(output));
> +
> +					if (is_intel_device(data->fd))
> +						igt_require_f(igt_max_bpc_constraint(display,
> +										     crtc,
> +										     output,
> +										     10),
> +							      "%s: No suitable mode found to "
> +							      "use 10 bpc.\n",
> +							      igt_output_name(output));
> +
> +					if (igt_is_dsc_enabled(data->fd, output->name))
> +						flags |= TEST_NEEDS_DSC;
> +					else
> +						flags &= ~TEST_NEEDS_DSC;
> +
> +					set_hdr_output_metadata(data, NULL);
> +					igt_display_commit2(display, display->is_atomic ?
> +							    COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +					data->mode = igt_output_get_mode(output);
> +					data->w = data->mode->hdisplay;
> +					data->h = data->mode->vdisplay;
> +
>   					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
>   						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>   						test_static_toggle(data,
