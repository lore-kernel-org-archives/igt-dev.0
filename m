Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71738CD8CAA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 14:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62FF10E545;
	Tue,  9 Jun 2026 14:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igy6ialk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7937E10E545
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 14:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781017147; x=1812553147;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0GctoybM0qKIjybYhuK6FRNjo8s4OzgD6kWbSWuL+Og=;
 b=igy6ialkcYGJK0HKGLPxgq1J7BwKLsiM5CJOg7VW8sv29+Z+oxDD62AL
 Q3AVXKSVgZizMD93XW2Tmoymts9qEET0Pl8sAhJVc22WeIIAoOwPCosqO
 tMUi17sgu23nkk9Cwuy8BY6t9mMnPZl8XSLh/dFEplFOQG44o9XpIZZ/v
 HEgKRUsB95sm2CPuhV6NkzdgigdKbtPKXwJr8tREUxHm2gtUizOgMd5Lj
 Xlkc7mGHI9rVfm/7BfMM0FWO5YibPH4TjyIvqugeQMJD4REfteqECEiUx
 GxqPq6paKwpsYMq5T4hqs3l2A+kqO0aHJOcCWs9sLMyZKb4bvavK+fM6h g==;
X-CSE-ConnectionGUID: sZPimWh7SxCXJXl+4T5cSw==
X-CSE-MsgGUID: I8lCW/euT6a8NE/HEBSKEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="93165622"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="93165622"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:59:07 -0700
X-CSE-ConnectionGUID: 2YTRcQpbQLas9LtQXXxbIg==
X-CSE-MsgGUID: pZ0BxAqkRPOFpnxJV7zp4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="250962556"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:59:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:59:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 07:59:06 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:59:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9mqKzbMTRVYiYw0sB26ZWfk3Z/NdmShE3ULdEoQL0rCcY/5e/AH02n/AgkcAwji8QtCA1hh02eGNn591MDaPRPQk81w4e04AVk6FKPI69wDHB6sTA04zkII09fh4ZDFGwrzPSpICzXyWC7iI38+qpAyxXyFt2PjV5Izam1gsMiEjGUJQu9UZMW5TiI9jjzot9+tgwTKftQ2XbrZ64T/SxQpmjyAne2fdW071MKI6DUm9mE7bxxJds1OFUN7AhtjxpxaCoBtkTq8B5yuhGR2VH4WucfdpRyDSlGjca/pVQKiXXajHCBqneywjVnEj3u3eY+4wPByxpZZdynL5FjY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08Ra5+QTqmNAhVBVQN0DwJsQ+Fs4ucQEF3Nof9Uq56s=;
 b=AkigEcZGt+CWO7ouJeyr8IR+ulcKBuHKefcb7/Wcg/Uyusg3jBFM4Lc06mc2aWpZbhxPooVmWdWJGWLNYVO2xavbSmINMCOxyk5rO/cwT/clWKC+RzKWoWzaVFFjvMJ8lAiEiIIWlDg6nCSRpHN/YrGaoC1HFdBVnZivEr3cq5dvg/xIHqPOIHT0Nqxgy0SEzVDpq45BOGKyE8AFd0C3f1ozz5enUwKXHnkA0neV6tcg75Nj+3NJJKsQ2V5hZf0qgTeGA9yKUAXFXfjg/Tn3awq8Y7LF/WiP2Cuyjia2RgnRlvJau+mVT0oB9B/s938mgVZtpQMIN35XCp1nsLVYug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by DS7PR11MB6037.namprd11.prod.outlook.com (2603:10b6:8:74::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 14:59:02 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 14:59:02 +0000
Message-ID: <d0096ea2-83b1-4cb3-99cc-e236b39faca0@intel.com>
Date: Tue, 9 Jun 2026 16:58:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 8/8] tests/intel/xe_sriov_scheduling: Add default
 fair scheduling test
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
 <20260527205644.2801165-9-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260527205644.2801165-9-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0084.eurprd04.prod.outlook.com
 (2603:10a6:803:64::19) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|DS7PR11MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: 191cae4a-8470-4aa3-127d-08dec637a47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|6133799003|3023799007|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 21kkL2KXgl8X1U4uTR9jIv0LM+RQLbynigbAVnihA4IeMcPRZ8d9D9URlRAJObkNpvpDZ7kk0ZErZRDjntUgGk57QHc7Lx0xAad+Gh5U6VsQyT85SmaPb5xE2biLg+XcyYArHedMRqgYnRhkxABh0utTi5MkFFVWmnluKmQwYRS1pSDvqwvV467yO5bTdzsWkDPcEs2UypHXwgh7DeifBXQ9Xl/7+uK7iJoR8sQa6C/nQe4pRYOs/GZvsGXPU5qJHSJ+XpslpLHpCX9iVdWwOyzpcIx7MYflUj21V7gGDaF2ITLwgqdqfCgDVhBuvyrf9In07H36aanGKHk8dhFACxChkb8vbH6JH0UX3COauvMrPWGBt09TUF6Dkni3tygj9oYgnGBefD0k9cEHlNlpQuQB55Bw+EaaN56lFaig9TSr6CtdwAKqtFRxGS756UrwuIL5QQMkKxkHFbeMZZK5WJhVjeK1Rm7USuzBRcGlqfXbUBCJnR2s2Wicir9qH81MMhtkuuPtL+ZyueZQ9UkD+GH2uGzoO6DGf5sZjdstovLLSJX/FK+qA4TsQteCxo0YPYEAHLmdO3h7zXK6bOMVjM7GMCiFXWl/pIWKTW0njJPBLFoUeu0tFOd06SjfL6s+AHSRKwCgiThTgdihOk2oF3B+A9H4N/SKnk7/NL0jtqJJFp1SdkxPu1zvLQ7lIqif
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVZzMHI5TlJaN1NDT1VZZnpIb0R2NzlzcCt3TFpsRnRFVm1yczErTUlLS3Uv?=
 =?utf-8?B?UzZvaUs0SHFsbTVVei95YityNDFNeE8vOGEvMFZlS2tPZE96bVU1dVNKdVJm?=
 =?utf-8?B?YUo0dVRrcVZLbEU5eStEcElqUm14VmFxT2RET3hGN2dMSXVnTWpuTUxqcEFT?=
 =?utf-8?B?YjZLZ3NkN1F4RDdCbXROM0JPbWpIZHh5RTdFY0N5UVYyeUNTTHJ6NGhiMHJs?=
 =?utf-8?B?ci9yT0h6TGJnb2MvL05MeC9DRjJhVUhudG1JeFlkNVFDZ3hTZ2hUMVNHaHBw?=
 =?utf-8?B?bDJPY3ZyUTZ5NTg0WllDQkVYcjVxbzRnc3dLcWI0cXRyQUJxdGIzL08zSE5D?=
 =?utf-8?B?MmVuaUZ3amZtaDkybGFXQk03Q21PTGRkSlpwTnhVZkZRWFhRaGg5aXM0YytX?=
 =?utf-8?B?SXVRTE5LRFllWjdrVXBoVWVEMVRsMWdCN2hDMzVYejIyV1EwNTRlMDlxMVRL?=
 =?utf-8?B?QldzeTVMSTR4eHpzUnJCNXRoL0tJSDRTQ2xpZU9oVzcwSEdOdE10bmc4UFBJ?=
 =?utf-8?B?ckZzYjdvWS9DNFNNQVI1aXJqbU1leVpCekY0MlV4cEUvcWJ5eHBLYk56bVVr?=
 =?utf-8?B?Sk10NWFhL0luSEYxN2tYYmhwdWZYdGhQRlBhOGx1UWlXeitqczJBS1I5NjNy?=
 =?utf-8?B?Y0ZFdDVXcnJONHA2K2dEaVV1cDVQUHRxdGx2bGx5d3ZrZmNtaTVGNUYyMGdZ?=
 =?utf-8?B?Q0gxTTMwVkoyei9kQXdpYnNhM2VSazhYTDgvQ1BnMVNLU2NLWTIzY2tiQlJS?=
 =?utf-8?B?QWhLMURySDgrTm1yWndqV2JvaU5YaXlyaWRySFF0T3JBemlWRU5pRFJIWVUz?=
 =?utf-8?B?SVZSSzZjSGIydGgrN3pYd0pRMlBOdXEvYmNXQWU0NlQzRDhjTjM3K0ROS1gr?=
 =?utf-8?B?Ny9Dc2JVMjN1ZDE5OTVRR1NEL0RqeDBtUU5CSjRPcjdObU01OWN5V0p4aU5w?=
 =?utf-8?B?NTJqTHFyaVYzd2sxeVFaSkwxTkJOeVIrdmhyNGM5bUdEUTNTa1FMZE84ZzNn?=
 =?utf-8?B?UUF1NnhrSndpamdoL1Jaa0U1TC80RDB3cElLbTE1Z0ZQaTA0S29GeGVpWXcx?=
 =?utf-8?B?UE8wK3lQMHhlcnZVWnh6dExwWnUwREMwT3hvN0Yvc012aldhTGdpUWNLQ0N0?=
 =?utf-8?B?bXNsLy9SaW5GeFNvMmVKeXQvN3J5dDdSVThiZzJOcU04c0QxZGtnanJQQVZX?=
 =?utf-8?B?NStCaWZWUlRZazR4ZVI5ZHZmWjVRalNiUUxZSW1GSkJnbVJ4OFBkWnEzYU0z?=
 =?utf-8?B?R1Z0VGhTM0djKzVOQkdhZ01RZmJydnRJOXd6UzM4bUQyNlVvMVJtMFJWUnZH?=
 =?utf-8?B?cTFnTXorYzNESHowbWJVSE04VnhwZW9TM21CYi96WGUyL3ZBMnczNTcranZH?=
 =?utf-8?B?ZStPWWZnSW5nUno0UXhsUkI1Q013cTdYUUVrUExwUkhDTkF5Nyt3ZGFFanBa?=
 =?utf-8?B?RFFsTXphbk0yVUs1SGpja1BLR0VtVk8zR09DMkJ4cFlNYlVtZ3ZGL2h6ZEt3?=
 =?utf-8?B?aHJlZEM2aDRuUXZhMS8rdVQyS3JZYUZkUXczZEFXdDRkY2N6NndJMytjQ2VC?=
 =?utf-8?B?c3Z0MFdjNU5vSUZiZmJleEVjdHBXMTdsdXRXTy82N3ZuM0M5WldHMVZqRmhS?=
 =?utf-8?B?RTdOSmE3dHhPRmQvamFsN2lmbnhYZ2Y1SStWUnBnODhXZGRqakJXYURmZmd1?=
 =?utf-8?B?T1FaVElRekl0VFpWY0xiUGY5SUN1bE1xQTNLOGw5dnY0SS81QURPaVdBOEJQ?=
 =?utf-8?B?NEZBWXhJTS9qNkpEL00yV0dTZDVJS3UyYzJUN1VvdFM0WE56c0FWRVkwTkVz?=
 =?utf-8?B?N01mOE5wK1BWWjBYSnQxMnZQeDR0TVJoNGRBTXhVTXdObWt6MkpPYjNuZ3I4?=
 =?utf-8?B?Rmt4NnBDMW94d1FodlRmR3phRi90bG9FVkszMFVVbjk3NmFLV3AveW8xaGU5?=
 =?utf-8?B?cU5JWERTbE5LdWw2d0ZUZTN1a0laNFhGOGw0R3hKUmpnaEwyS0RSdHRUVDZG?=
 =?utf-8?B?VGlBMWMvdG5WWHFTUWJCMWRxZ1ZhMjNvbSs2QzJsMmREV2FDMEVLZWlDeWZZ?=
 =?utf-8?B?UGVJL0R4VTRuOFJyYTlEVGNLVFBnb1VSVXJ3YkJjRndBbER0V3JsdHB1RnQ4?=
 =?utf-8?B?Y1RDbTVobUhLNXlBOGpIWG1Vd0RMTUR4RnVVRFNXeGRObU9KZzBBc24wa09X?=
 =?utf-8?B?Y29nU3NKM1dEU2I0cm90YWNvMlN0QTlGb0xUMDFJNWZBOEpvUTM3SndUY29v?=
 =?utf-8?B?THFvUHV2RFNxNTE5d0x2dnFmb25RNXdzTEhFOEVKdVoxMi9PaTlhbEVMMDJH?=
 =?utf-8?B?SDh3bmovY2lyaFVseVlWVDVlR3BzWTg2OXNpejZiWlE0WTlUZ0Jmdz09?=
X-Exchange-RoutingPolicyChecked: mCAZD+1AEcZXH1V/+W66K86VjoBcP6E06Jk3BSWC81aEe2RdxZ6FFsTTJ89Xn8jFqP678iqLYF3jkArbBvlmYyL0gmgZc8T+K0OVM25/MJjDVgqWv0mIE15NOECeAd62oldlkMGR5Mc5uFCd5aP7m9ro6/jacYfCnkzeHYz3/tQ/IQSfQ2DoARBQo+BJGjqAm0rNBjbmi3InAoy73p1lsWJx5RKkabLvZhQqyim/fJxEo4gzK0a6yyEQ2S588PFK42QrJxwQSCGBHKLTHtuiTgXMx7WvnxngDXiFRCDNaTL3WxfLcNjhaG4P7h4S5xCW3um6r7+694EQPxNBWfIp4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 191cae4a-8470-4aa3-127d-08dec637a47d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:59:02.0899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYhzU+F5FlkVuOtAjERLsBQZ2quWEaHI6elw9VivDinaleJfEj8oogPy8f/l3cY4ykQBq/yHOVl4+h4Hr3XzCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6037
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


On 5/27/2026 22:56, Marcin Bernatowicz wrote:
> Verify PF and enabled VFs keep a fair share with the driver-applied
> default scheduling settings, without overriding scheduling parameters.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel/xe_sriov_scheduling.c | 145 ++++++++++++++++++++++++++++++
>   1 file changed, 145 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 915442380..aa3e5fccc 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -1271,6 +1271,112 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   	subm_set_fini(set);
>   }
>   
> +static struct job_sched_params
> +prepare_default_enabled_job_sched_params(int pf_fd,
> +					 const uint8_t *vf_ids,
> +					 size_t num_functions,
> +					 int job_timeout_ms)
> +{
> +	struct job_sched_params params = { };
> +	uint32_t min_exec_quantum_ms = UINT32_MAX;
> +
> +	params.sched_params = (struct vf_sched_params) {
> +		.exec_quantum_ms = xe_sriov_admin_get_exec_quantum_ms(pf_fd, vf_ids[0]),
> +		.preempt_timeout_us = xe_sriov_admin_get_preempt_timeout_us(pf_fd, vf_ids[0]),
> +		.priority = xe_sriov_admin_get_sched_priority(pf_fd, vf_ids[0], NULL),
> +	};
> +
> +	for (size_t n = 0; n < num_functions; ++n) {
> +		uint32_t exec_quantum_ms =
> +			xe_sriov_admin_get_exec_quantum_ms(pf_fd, vf_ids[n]);
> +
> +		min_exec_quantum_ms = min(min_exec_quantum_ms,
> +					  exec_quantum_ms);
> +	}
> +
> +	params.duration_ms = calculate_job_duration_ms(min_exec_quantum_ms);
> +	params.num_repeats = adjust_num_repeats(params.duration_ms, num_functions);
> +
> +	igt_require_f(params.duration_ms +
> +		      (num_functions - 1) * params.sched_params.exec_quantum_ms <=
> +		      job_timeout_ms,
> +		      "Default scheduling eq=%ums across %zu functions exceeds job timeout=%dms\n",
> +		      params.sched_params.exec_quantum_ms, num_functions, job_timeout_ms);
> +
> +	return params;
> +}
> +
> +static void validate_default_enabled_sched_params(int pf_fd,
> +						  const uint8_t *vf_ids,
> +						  size_t num_functions)
> +{
> +	for (size_t n = 0; n < num_functions; ++n) {
> +		uint32_t exec_quantum_ms =
> +			xe_sriov_admin_get_exec_quantum_ms(pf_fd, vf_ids[n]);
> +		uint32_t preempt_timeout_us =
> +			xe_sriov_admin_get_preempt_timeout_us(pf_fd, vf_ids[n]);
> +		enum xe_sriov_sched_priority priority =
> +			xe_sriov_admin_get_sched_priority(pf_fd, vf_ids[n], NULL);
> +
> +		igt_require_f(exec_quantum_ms > 0,
> +			      "%s exec_quantum_ms stayed at 0 after enabling VFs\n",
> +			      igt_sriov_func_str(vf_ids[n]));
> +		igt_require_f(preempt_timeout_us > 0,
> +			      "%s preempt_timeout_us stayed at 0 after enabling VFs\n",
> +			      igt_sriov_func_str(vf_ids[n]));
> +		igt_warn_on_f(priority != XE_SRIOV_SCHED_PRIORITY_LOW,
> +			      "%s expected LOW sched_priority after enabling VFs, got %s\n",
> +			      igt_sriov_func_str(vf_ids[n]),
> +			      xe_sriov_sched_priority_to_string(priority));
> +	}
> +}
> +
> +static void ensure_enabled_vfs(int pf_fd, int num_vfs)
> +{
> +	unsigned int enabled_vfs = igt_sriov_get_enabled_vfs(pf_fd);
> +
> +	if (enabled_vfs && enabled_vfs != (unsigned int)num_vfs) {
> +		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
> +		enabled_vfs = 0;
> +	}
> +
> +	if (!enabled_vfs) {
> +		xe_sriov_require_default_scheduling_attributes(pf_fd);
> +		igt_sriov_enable_driver_autoprobe(pf_fd);
> +		igt_sriov_enable_vfs(pf_fd, num_vfs);
> +	}
> +}
> +
> +/**
> + * SUBTEST: default-enabled-fair-scheduling
> + * Description:
> + *   Check PF and enabled VFs keep fair scheduling using the driver-applied
> + *   default scheduling settings established when VFs are enabled.
> + */
> +static void default_enabled_fair_scheduling(int pf_fd, int num_vfs,
> +					    const struct subm_opts *opts,
> +					    bool verify_with_perf_counters,
> +					    const struct drm_xe_engine_class_instance *eci)
> +{
> +	uint8_t vf_ids[num_vfs + 1 /*PF*/];
> +	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, eci);
> +	struct job_sched_params job_sched_params;
> +
> +	ensure_enabled_vfs(pf_fd, num_vfs);
> +
> +	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
> +		    &(struct init_vf_ids_opts){ .shuffle = true,
> +						.shuffle_pf = true });
> +	validate_default_enabled_sched_params(pf_fd, vf_ids, ARRAY_SIZE(vf_ids));
> +	job_sched_params = prepare_default_enabled_job_sched_params(pf_fd, vf_ids,
> +								    ARRAY_SIZE(vf_ids),
> +								    job_timeout_ms);
> +
> +	verify_applied_scheduling_behavior(pf_fd, vf_ids, ARRAY_SIZE(vf_ids), opts,
> +					   verify_with_perf_counters, eci,
> +					   &job_sched_params);
> +}
> +
>   static bool skip_visited_gt(bool extended_scope, uint64_t *visited_gts,
>   			    unsigned short gt_id)
>   {
> @@ -1370,6 +1476,45 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   				  has_perf_event(perf_device, "engine-total-ticks");
>   	}
>   
> +	igt_describe("Check PF and VFs keep fair scheduling using driver defaults applied on VF enable");
> +	igt_subtest_with_dynamic("default-enabled-fair-scheduling") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, vf)
> +				xe_for_each_engine(pf_fd, eci) {
> +					ecls = eci->engine_class;
> +					igt_dynamic_f("numvfs-%d-gt%u-%s%u", vf,
> +						      eci->gt_id,
> +						      xe_engine_class_short_string(ecls),
> +						      eci->engine_instance)
> +						default_enabled_fair_scheduling(pf_fd, vf,
> +										&subm_opts,
> +										has_perf_events,
> +										eci);
> +				}
> +
> +		for_random_sriov_vf(pf_fd, vf) {
> +			uint64_t visited_gts = 0;
> +
> +			xe_for_each_engine(pf_fd, eci) {
> +				if (skip_visited_gt(extended_scope, &visited_gts,
> +						    eci->gt_id))
> +					continue;
> +
> +				igt_dynamic_f("numvfs-random-gt%u-%s%u",
> +					      eci->gt_id,
> +					      xe_engine_class_short_string(eci->engine_class),
> +					      eci->engine_instance)
> +					default_enabled_fair_scheduling(pf_fd, vf, &subm_opts,
> +									has_perf_events,
> +									eci);
> +			}
> +		}
> +	}
> +
> +	igt_fixture() {
> +		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
> +	}
> +
>   	for (enum xe_sriov_sched_priority priority = XE_SRIOV_SCHED_PRIORITY_LOW;
>   	     priority <= XE_SRIOV_SCHED_PRIORITY_NORMAL;
>   	     priority++) {
