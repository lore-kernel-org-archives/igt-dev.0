Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA8CC61DB9
	for <igt-dev@archiver.kernel.org>; Sun, 30 Aug 2026 19:51:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9967892C1;
	Sun, 30 Aug 2026 19:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="id/etDbn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD09610E213
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Aug 2026 19:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788119439; x=1819655439;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sahVqU3HjEBbTZqkkTxS8bEQo9cv/iCaC94OfN6RlRw=;
 b=id/etDbnFoNk52YOzng0TnXBoF9qyVNAeyLbCMWeQAvUvYGLFC1MJwis
 MjI9uzZSajhfAMB+Uz+ngZcAiZfgMWZoaAc0ucDKuMCMhQCmkDqGH48Sz
 Pkl6+aTpfOyVDdTQ6MrTDNEAGuWwqEttGyWOeKftZN7xL7MNibdZcMQWz
 yUxhaeua8av+KNSM2UjCX2hVvY1MYRlPBjthUFnGRKv8Wa+IFtP9Ki+TS
 0oszAi4rJBelK9E+cQAa/TW0BkDdSab1+gemrfP4jd/WH2bwo4M220Hge
 7Ngt4vtBTlkI45FTkSm1ZRGqglqLGIrOFCzj4Zy+WyQPA3/QD7FExK8i2 g==;
X-CSE-ConnectionGUID: ahuCokdZRGW7wcdIWusMNw==
X-CSE-MsgGUID: /h7uIKrBQ2KYZKGW7WA1eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99883604"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="99883604"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 12:50:39 -0700
X-CSE-ConnectionGUID: SFNk04vhTh+frSOl/33Biw==
X-CSE-MsgGUID: +cu+fGmPS7qS12UXwRKiHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="265378985"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 12:50:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 12:50:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 12:50:38 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 12:50:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uooSl6/HbkYObiXTysHXhalTTYRur/YjwQcqAWQ9D8ywc1kRR9lR546jHI8qkL8l8Z4c1bz6s++jMllLKRBu4a+aWcyuNjVLo6OnqUNnEs7NDalHwMUD3U5x+ahQNYZCedAAFDnWPPsivIa6Rr0QbBtURrrwLehD5HPp185ItwLF8AjfeRhp9tRntQ8VP5JnfT0pDuWS9cEAgznpZYo07tH96A2hY6gqte+ioSAHfTYwwIgLHoUDpUPU/NlN0p4UMiGIaZbv4WkmVOW5H3jlsLlAmSjERWwfJk3W0Eygyvrc8omzCReWkS2XzycMfLUxQZg9l6eIkUm8GFND+Q702g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rbasx/Jvmd6ClyXR0uPna+wcaCjxwfNs14m0fkvpYWI=;
 b=Ku6/QOUzXLu/T8YHuALBaKtfySDaQdssvOffewuosqxtd70oswPi3vrcLOXb7oIXLxNWB2oFwNZNkmNxuHbohw+zxWSR7UGdgxmoJj8NguGmr9tTz58YiAEbqtlqkjz6bBxtZH/oy17DwVkDOSbC5vr0vmbh4zTZaPpI7ukI29bo2nt9fdRvObnGQIhSs8iCSLKQwtVyejaSs1QFu5Qg+yM8Gll3N/DQo1DBKis2sDbp7SEghP3kUYQGtLJR94reFw70XnUIgWFSK2RWWvkL679tGWLS8e5tMd2ipjF2JlJzTEozEfaA6MchrM5cWv8YCs0o+O1R+kHPg0gQRYuwWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by CY5PR11MB6319.namprd11.prod.outlook.com (2603:10b6:930:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 19:50:30 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%5]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 19:50:30 +0000
Message-ID: <863a7231-efb1-4944-a601-268bfdbceb61@intel.com>
Date: Mon, 31 Aug 2026 01:20:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 16/17] tests/kms_ccs: limit #crtcs tested during
 suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <nemesa.garg@intel.com>, <karthik.b.s@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
 <20260821124834.1974029-17-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260821124834.1974029-17-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0302.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::19) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|CY5PR11MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b295a15-78cd-4ac2-1850-08df06cff21d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|10067099003|4143699003|5023799004|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2F+rLqdku4WrnanpL2mj9kDb7eTG+6QQwQHpiA9UwyTWY1bXRJHdPx82JLIFdKEFV6YBnf5mgMsLQWlNR2/1xj1zB1r0t354E8DlF6G5LAgP6p+tTks5hWzaPYmK9hWQaPm/2jVXHODi85tG22uFA1s40p32nRm7t9GJGXq3/12fJtWeP7HOjIoxeIIadWpXxJaeTB397g0afDTEYYbu8TOU9MqrhTSw4FehHPK8NG0eK1s6rj+QHqW/2//llrfjFAayYP+fC8DoBx9VAZFYSrWsKIxAlg4CfYBr7qhPwCE4Q0Ol76GYdvOeSJC7JdQUMk2/UPzffuCU/AlCYPn6OMRfejnoPuZ3KnKRKJhcLSo/MtxYU2tWJnD/U7u4h899Q+rz4LVjINODesfhZCw/7vpBOo0ZXGF+wuItw0WwP1kPQAn17pGrWavAKuzu54190flXYpcRkg4pbPr2VxlfBdkGbls/gHmQe7dfMmuc42l3z+/aAZNkN+sYZvSLGB4v7haB8ZwUjFnvEpgJ+HoLrAB2i1Fz5pCcPZZ/gjI+euvTBKZfxsN7wRdi403ckxAd678aiET75U2MWKXvwHO/ysntj+Df60alujEoQ3qkVuYlqfDD5hB5SPBHa9DmmcgHboIpcwaeWtAT/+sryp87JwdnO0yWkv1NMofqX/IKY7k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(4143699003)(5023799004)(11063799006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWZpU3pZR1ZxTFJpenlMa3U5cU9EUkNjV0VmZjkwRXFjWlRSblpYYWRUYVRx?=
 =?utf-8?B?ZnBUVTVxcTlpOE01TnA2bnVoa2w5UzQyUnZudzVGeGpicFNpU0ZoaVMxMlAv?=
 =?utf-8?B?eEhyckNaQTVMWDg4SFVUdktyZTZIbUpTOGFjL3hwYTNQWmZtVkdHaFlISzNa?=
 =?utf-8?B?QVJZZjN5ekF6RGJZL1BZQjNybDZWa1owV0VMOE1UeHl3VGR0eXlicFZ5bmgr?=
 =?utf-8?B?T2lOSkp3Mm1TOUdGcUR4bi9UQ21ITVlYaW1OQjlzZ1BrencxMHNKRHJHT0VS?=
 =?utf-8?B?eUJ1ODJPY0dNTlVpYWk0K01lQ1d2dkY0eFF3QzZ1bzlNYTc0RjBOMTR0akk3?=
 =?utf-8?B?NzlKdHJKTUdwa3ZtL0dCNlBOZU8wcGNmZ25XUFlqRjlyOG9RbmZEYk9raThj?=
 =?utf-8?B?M1Nqa0FmeWw2NGhKdWxPd3FWZjluS0crL3ltbDNpOTUwNWlPWmV2OFZMRUJM?=
 =?utf-8?B?K1h1OGpTUHBRS3lIMTh2U2R0TVl2UXoyYnd4cDQwc3FOZnI1MVd0Y1VpU0dJ?=
 =?utf-8?B?d3ZJSE5nMFpidGpodmZPQk0xVTVaUUxKYXM3SVd2WjJGWUJGOUhCRlJqR1Fw?=
 =?utf-8?B?SW1IM1FhZFpRNnpzRUVsZGpWS1JnWFkrZkJQVDdDWDNDMEFBdFlZeFZFNmhD?=
 =?utf-8?B?THNhUmZWREVSNjAwb25aZlFweTRSZERsS3B6TTVVTzluZkhhc0xab1ZVS0J5?=
 =?utf-8?B?TFZUcFlxVjQvK2Y1TzJ4YlUwZUIwSlhBR3ZXSEJESVNkcU5oMXJTcFNlbG00?=
 =?utf-8?B?dVQzeWV6MENCZDM0VXZyU09YZGxXOENGN0U4OGNCRE1COUg2eTFWN2daZzN0?=
 =?utf-8?B?aDZVeHlCcCtKT2FTVm5jVHJrajZUeUlNOVplYWFvVmNXc2gvZWl1dWJNcXpv?=
 =?utf-8?B?Qmd6bmRMdXNuandraVRyYmpqSVpxcWtyUWJ0WUZ5SWoyS2k5Y21KZDBFSVl1?=
 =?utf-8?B?K1FHb1gxVnB0M1BhdVd1azJQRGdqaHloYmZ0L3E3U1BDR3dxdThLZS9ISU9U?=
 =?utf-8?B?Wjc5bTBsZUxFelIza1dkN3NkQzJZM2cva3Z0aFk0N3d1QXZidTVCdDNFL1Uv?=
 =?utf-8?B?ZEl6NUFQRFR1aHQ2QTdYblpScUlzMFBEc3p3RWZYV2RPQlg3QmI5KzNJbEpn?=
 =?utf-8?B?YnYrS056eW9BNFpQdjNHL1ptWFZ2bkovNzRzMldMNy9xM0FmZUlEbHlOMmh2?=
 =?utf-8?B?RFgxNFFYcW9zU2Z3WlhJWURZT2Q0RjBLWUtmVzAzcEs5cHpiWXdoNmUwcHBS?=
 =?utf-8?B?RU5BTS9tbGxKUzVjdVphMzJUSnlBdHFvU1lLS2lYK3BvSWRlc2RiNkdHb1B2?=
 =?utf-8?B?cDVpVStEYUpEZTZLOXVIY1pnZ1NMNzEwNkZoMDNramZUSDdwMmFLM3M4QWwz?=
 =?utf-8?B?U1drNjE1ZGFYWHFkNmxKOHZQWWJnREo5aDROakV3UjZFa0Q3VGFFc1pKbmx2?=
 =?utf-8?B?aExBRWppQ0M3VWRvd0FUOXVaN1V5eWNwQkc1WW4wWE5XR0Z2WVFmNnh1N0FB?=
 =?utf-8?B?MG1sSmFjdkZUb3JXNUJVRXcyaVl1aEdMa0JMek93MTcvSGRQckltdlJjRE5B?=
 =?utf-8?B?V1BiWmFmK0ZpalVRcmh2VitlZ01za0JaQmdhQlFUL2owdTk4cW9uRTA1NW9Z?=
 =?utf-8?B?ZUdVYnZ1N3hDWm5Mazl2V3hyVXVQbTY2YWpVUVhsRDF4SExnQlFrQ1BuV2dD?=
 =?utf-8?B?S1dLdS9JejJMTlRBbDliVDlaejFPRjl2Wm11Rkdlc0VvbTlQUGowam1ObEVI?=
 =?utf-8?B?VWJjVWovMmUrdVJXbm9OL2ROTjAzcDRDWUtDWlZ4bXZlaFQ5dVlSYzJsbytw?=
 =?utf-8?B?bnNveUFsanZqV3Q4WXlWWnlycGZiTXE0T2NuV2EzakVEZTFBVlg3VXJiWnBE?=
 =?utf-8?B?T3JKZjlNeE9FS2tjOEZRSlJMYUpMV0RCT2NIMGhzS2M5OStJcFJFa2RtaEtE?=
 =?utf-8?B?ZzVISU4yL25VRksxd1MxYXJtb0pHNTlBQ1FrdUlBLzJaaHM4RUZJVmhHUlNT?=
 =?utf-8?B?MXZ3UVVUYW9oQlcwdXdxcmkwYnkwd1BNaVNZQ25Mc0w4aFpCY29scUdNMWFq?=
 =?utf-8?B?NXZDTnhRS0p2Wk9LUmFsTnRvOGdSU2FBTFJsN2lvMDFWbVUwajZ0NytQNHdu?=
 =?utf-8?B?Q0p0L2x4NUxjU3F2ZWNYN1htTDdCMCtVZHNUbXh3aG9XQzlNam4rMEVnMVRQ?=
 =?utf-8?B?K1h3ZklnRDI3S0RYaytNY0xmL2xtSjEvdndLZ3FFVzFRYm16YitSOU5HUnl6?=
 =?utf-8?B?dkRSRE44alhSOGlzZFFmZk9oY2t5eGlvd0w3UkR4MVB2OWhZNkJKbU8rYWVG?=
 =?utf-8?B?b1U5Qi9JcUlmbmVweHNmZUk5YnRjRzJuWXhtd1g5eW5NQUh3czZiL1gvaGZC?=
 =?utf-8?Q?0y7GCjxIm+YsstJo=3D?=
X-Exchange-RoutingPolicyChecked: nDCqPtQFi/StUdoEiCQKz0SQT8f1bAU8nP/hBp3nShyiiQrRCj+c9klEdnPXFGJlSFjlSefP+L6Hoo//P5hx7xw5J663kQVNLSlPwywHT+VGun9UpV6AqZQ/I0iMsDG97g4iyd4RD4WUWyUGjRCCcfjp1X/Db8FwjMp/8SuQvam+MJdL/H7/PPH+OTDhZL2NnyMT1Ae1bxnjT5nH6MuChPKpSkSUJivsmJJFLDnsG4lZUA9x78kQ/IDK5vYCos/rIDk6/jTbCa6wDvGGuxw9e7iM7KyLPKv6xZwoHKGRJPNjPV8My1pjws7jxG8CkbxO6CWqzWYbSa+NrWF/OSZcBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b295a15-78cd-4ac2-1850-08df06cff21d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 19:50:30.0890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aewTeaoTZ6fTdYgstPyyYnq8NMuywuOwiFLgTpsw5dE5C8knoubcE/0AdDcTMnO68MMEef2xgUwqbSq7UphqWXz3RRKL3DJFzkoRksVzg64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6319
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


On 21-08-2026 06:18 pm, Michał Grzelak wrote:
> Limit execution of suspend tests to first and last active CRTC unless
> using `extended` flag. This reduces default execution time of the test.
> In turn this can lower chances of hitting CI timeout.
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>   tests/intel/kms_ccs.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 11bc30769c..3aeb1a57df 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -191,6 +191,7 @@ typedef struct {
>   	int fb_list_length;
>   	bool do_hibernate;
>   	bool all_outputs;
> +	bool all_crtcs;
>   	struct {
>   		struct igt_fb fb;
>   		int width, height;
> @@ -1157,6 +1158,9 @@ static void test_output(data_t *data, const int testnum)
>   			}
>   
>   			for_each_connected_output(&data->display, data->output) {
> +				int first = data->display.crtcs[0].crtc_index;
> +				int last = data->display.crtcs[data->display.n_crtcs-1].crtc_index;
-->IMO: they don’t depend on output so checking them inside make same 
values on each iteration...
> +
>   				if (!data->all_outputs && (data->flags & TEST_SUSPEND) &&
>   				    output_count >= OUTPUT_LIMIT)
>   					continue;
> @@ -1175,6 +1179,10 @@ static void test_output(data_t *data, const int testnum)
>   					if (!intel_pipe_output_combo_valid(&data->display))
>   						continue;
>   
> +					if (!data->all_crtcs && (data->flags & TEST_SUSPEND) &&
> +					    crtc->crtc_index != first && crtc->crtc_index != last)
> +						continue;
> +
>   					igt_dynamic_f("pipe-%s-%s",
>   								    igt_crtc_name(crtc),
>   								    data->output->name) {
> @@ -1234,6 +1242,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
>   	case 'n':
>   		data->all_outputs = true;
>   		break;
> +	case 'e':
> +		data->all_crtcs = true;
> +		break;
>   	default:
>   		return IGT_OPT_HANDLER_ERROR;
>   	}
> @@ -1248,9 +1259,10 @@ static const char *help_str =
>   "  -s <seed>\tSeed for random number generator\n"
>   "  -r\t\tOn suspend test do full hibernate with reboot\n"
>   "  -n\t\tRun on all connectors. (By default suspend subtests will run on 2 connectors)\n"
> +"  -e\t\tRun on all CRTCs. (By default subtests will run on two CRTCs)\n"
> -->Check this runs on 2 crts or 3 crtcs?
>   ;
>   
> -int igt_main_args("csrn:", NULL, help_str, opt_handler, &data)
> +int igt_main_args("csrne:", NULL, help_str, opt_handler, &data)
>   {
>   	igt_fixture() {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
