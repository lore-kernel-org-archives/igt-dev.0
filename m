Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9F2C02198
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 15:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A0F10E8A2;
	Thu,  6 Feb 2025 15:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Da57RHp5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5978210E89C
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 15:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738855300; x=1770391300;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DWY0a7hk4YthZTRKuBE9aXz1qxBEWERC101L7WA78ZM=;
 b=Da57RHp52ur+ZZz0Cf49s/C4kSeSzS8LEFTxQfd40nW7hF6EOruIHOV5
 nwyj6gVC08YOHd2i7Fhp19PlKfgCL58918Xgz1nMyl/ZOlhtKt8SYHTwy
 T4N4UyA9uU5sm2BZnD6Nh7Zqgtv1+w4T4T5rCshwAwCdN2capwIa4Fmq1
 kvHg2vRdgMf8T5s30GBkRko8voNbMP2HYnNczhdz4Q0GhBhd93vtt/6Gl
 6aq7tzKzGzhqo+OGTYruEXShZP6Gq5qg52GdGqq7JTHMla5XkbP9iXwDW
 yW3SXCdSB0WQ5Ct+ALq3uAUmDLuZqQmCfb0GulVtGqcvjPFoRYXj06Kop g==;
X-CSE-ConnectionGUID: bx2aph2ZTqme03pzTukeIg==
X-CSE-MsgGUID: dav6uHL5TneiWWhUBCXRcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42297762"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="42297762"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 07:21:39 -0800
X-CSE-ConnectionGUID: hr0aJPXxR9CQdH7cpFVq4Q==
X-CSE-MsgGUID: W3bFj8wlTHmVwNxdhF57Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111086274"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 07:21:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 07:21:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 07:21:38 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 07:21:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hadv5FoRbP4DpADtTogQskaRocuBzMj14jiPE33b/aJSJqD8nP5Z+9Pa/K13geqIt180Q0jj+x7XXgNFjF152LdvwM30DnVsVvyp+LEMztxKefYPlKebS41U6IPi7LlTcfgYw3h4aknpH5rn4my+S+V4BjJigQ43HKUZY0Jk/aXsEymj3jwkyK/ABEW9AZ5RfkktYfdhxjzeTZnfxmsa5563WfS5LUHyaiT6kAfUpyqAb4b95Divuv/uAwHm2+Y4oMv9CvAHjtdVkfgMmuhRTypQPnHhniGDXU0iR7wAz/6mX04uQFNdK+0VjSiyO7gOg4+gjwM+VFvYpF2njsM33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2b2Md/dUqt4kMEQzSbjCHej/lGilGe/ryOdLmLE6quI=;
 b=hjRuZwLbmxmQgTjYG+AExx1Zw09UyuJASIfD9yZsnzN5tDSurYblJ6uG/VIs5XpfkTdt6RIP6yfnhmnoBf86BjmYhk1U+aPjhXQvMQ1uSGuMuC3ISakxqnY32rxY/OXfGhc4X9u67cudMiXUMdX4nqWKWDGd1SMjZy1f4XTmQANN9lZbRNiOEzjVNXswDALTVpE+uHxcZ5ZbiFnUFv3JVXLYfLtQ3HJYfJr0GN1IFUK8gotg+224zLhnDUQP+QeXNz+BvoFt3zNjXKvAGCC0+E2xUy/on6CXWDMOqN7Gdyh2VAY3d8HkQpNpdPa+iTwV66wtwrdMdIJCHWKMN1mjxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB8354.namprd11.prod.outlook.com (2603:10b6:208:48c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 15:21:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 15:21:20 +0000
Date: Thu, 6 Feb 2025 09:21:18 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Stop unloading drm
Message-ID: <s2eydupg4g2w4bnms62qbh34bg2co6655urj75bukdkpbjgu3d@h27xjn635asj>
References: <20250205030948.1965423-1-lucas.demarchi@intel.com>
 <c1781020-7632-43ad-a3b5-1d2d71aaac32@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <c1781020-7632-43ad-a3b5-1d2d71aaac32@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:303:8d::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d3fdf8-7286-48da-9763-08dd46c1e8ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?quHt04HFUGFQ1QDW98NtDRw9w9LiNLq67BIFDtVuDk4LG9YO+iAd8RvAZPgt?=
 =?us-ascii?Q?yDxAH/uAhQJOiuW09BpYzp2oKx4blJr+JnK5fvYWF55T14xPy/7mt3y3R8gh?=
 =?us-ascii?Q?nAXFWa1waJ8GpFpu3XIKReTOc+qzPwbkz8pPog1wK/nAE5oBQ46esWPf966v?=
 =?us-ascii?Q?V4gaSKtRt4idtU6pY0YvwfKxLsFoYAW/N8GT3VppDqEZmYtRpuEQSWMld6iQ?=
 =?us-ascii?Q?odq/YQcmvLRpaytHPy2LDvZgoo/nNOdamQgM+l2uCB9MFsCjQPAjVfzEGX0E?=
 =?us-ascii?Q?nzyiMNVeV41482uC/3ooRP1+5iQKVkuSkqk8lIhF1kOO/FaO5s0iD9dy52IZ?=
 =?us-ascii?Q?YN7BRDCPYpkRBwn2aA/eKlw8BgLYU1sgO21ULefkC6T1DWxNq/Q4QIaMdu3t?=
 =?us-ascii?Q?K56xIlIKCe8TL2DlkRdAj9rHDquhoHlLyMxOEWrJ5Lf15hzQprbVM3bBngEm?=
 =?us-ascii?Q?BBmOD3F0aYIxicqq0jHNzSH9pqn/3eHsl0mS5VjkIEM2ark8IESOlKtSTMDH?=
 =?us-ascii?Q?hrFyj3Y1cUAP38d3JZXJ2SyPbPBNKwDWq+AugKmvtPJRo3k5b9+ckigirrEn?=
 =?us-ascii?Q?Rr99dB9mPUlKmoQYVaNitHPQeM6PIo+ciwonpc/DxTIbv3cOqeJi7vbFw+pj?=
 =?us-ascii?Q?WVcgUkknFgvOrpuJsp2kxML9N7wVrnoYXF/kAOBEwnfwJ3yXv0KOO0TAHQZb?=
 =?us-ascii?Q?OcI723EjYTepjPLy1ppcAK1J8fKmqxVf5IH+CN3PcCMZ1/36GjOX/j5bW+wy?=
 =?us-ascii?Q?D+PvOBIu1FkbhL5CvJfhIknxFnmG+ulVVaR4FaBUy541cdfMKrV1B6NLIir6?=
 =?us-ascii?Q?0FhjROslrK/0J0d/4uc9P3Ohks8o2mRnUzMCNH/hmw2rvCmtxPrwQoCVqR8m?=
 =?us-ascii?Q?Kk7H+FKHVacK5rIJbaHaaINc20XrBvHPk6a4RlSoLwjCWYS+Oi0wTTtiEwJx?=
 =?us-ascii?Q?TlR4yEh5USiDVWojdJqUoXM/4id539rcyV8J4PJ98Bz4OktqigfBXAg/Bi/l?=
 =?us-ascii?Q?HeMUZYdZCZ5oi6k+FVNo2gzc2tnevlgDZixhsIj5K0nj6suBAsc7huYkDF7T?=
 =?us-ascii?Q?ejsBWrrV2r8NgmHn269uSvBqwF64Ji55gS/E+C9t9Nxhtr+q1OpmrtAbYZHd?=
 =?us-ascii?Q?oq4zujdtp6uRKL4G+5CTBQhNHLojruenhbttw8WhgkzhCoD+Fq80HglG9McC?=
 =?us-ascii?Q?oc48nlZoeqBOpWpGF4OgMHlkRVh0M9eZE+sv6RGEvb6uHadnmn0yhbBEvDBn?=
 =?us-ascii?Q?WGFALWpuiH9sMvvekOln8d3lSRKHcfhn3Qb6WxDDkTFBfmn7+SqwSYjhVQaL?=
 =?us-ascii?Q?JMb85p5ViMSksrFyyb6TZfxGtvLhoZ43Fb/1g93EHLYwhQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RE0/n6+E1m/2OeVzfeiTVqZVKGyMaS4k/ntK+GVZRjDMRRVd4y/n/m2kKBxr?=
 =?us-ascii?Q?i9VpuJ2RrpbWumffPJNdbpr0McImZnSOGQP8DoRr5ut/eqZzTp35K3igTniU?=
 =?us-ascii?Q?gevzxYLChVLXfSIQ5CponIgJPb/MgPWqHorjomm1dtSN8mLclIk85MrOJugW?=
 =?us-ascii?Q?2E/+JQ6uYU4/mVLwnjsbTRetHKDRArQEUE/bbDOR4uv0xSG5uVaFwdQgQT+L?=
 =?us-ascii?Q?MS0i40zoj+MFwpdvJCKLo7cxzzwLU60ahGGgoaFGp/X3N5MTq6kN/AcpikZd?=
 =?us-ascii?Q?WgqnICy3VGJyvYYmLO8M+KU9KHKxXy2073XHBu9LZVC4AN1TiTsDJY+5YcZ7?=
 =?us-ascii?Q?skKODoO3t1bKr0JqkEKpRxYlu5sRQleVqvUvr1mv+BDvxSJWT8MN0drN6iwh?=
 =?us-ascii?Q?10KHvHB/HA+/jZy6zmDqNSF0eL2Zgi2JdkJ7UUQj6II9HtyLE90/3AfLj/Ex?=
 =?us-ascii?Q?vPxeTA/Wa8hljQ7r1X0m/sKtJBM0teNu2NN7Ddem7VVfmYW3ZnlmkIfZU2c7?=
 =?us-ascii?Q?bFf+y+AAz7IKdK0aTAfSwCAqyVEZs6iesqZfANCi8NTj3dOueCsQwsb1P+nh?=
 =?us-ascii?Q?SdYzy3UwCXadKWvIjVfOO1/POMb2G9e3ptpnDvyWFgjZQ5elfRE7UdAmiH3H?=
 =?us-ascii?Q?5O51DZKPAZyHH20LcSh+gNQENNBZsE4pIjjKjWGFi1Ml1pRKFuQSIyRt3ZQ8?=
 =?us-ascii?Q?yz95AbMqScF5XoUCIdeaHnq57X0tOQE7KC0+mMuSL7jZ7G8YR3zzUNpDpaDj?=
 =?us-ascii?Q?x4HPA2o9HWeMfQpc+T9Qg9soTJ4KCoAooHfrRUQajgI7XeKTIQOjtJGicpXV?=
 =?us-ascii?Q?6tnbUohW3Vxyxx0hmeqoIhzrFChlRCvQX3JBaZ8Uic1but4H/n2x2Lyw5RKn?=
 =?us-ascii?Q?R16Jb9wCPRgYULJ8Z6wrHb4eC1mtpYDiTkqS1ADksXeiQZifmPhpq+pVBwx6?=
 =?us-ascii?Q?KpQ+jCydUg9+2gb8K6UmW7XpmMwO3VQ3G2PHZ4xtfbsIItXkzOtVKBikRRsz?=
 =?us-ascii?Q?l4PAOzVnUYohWPJ5o5HpGlDbvbXt7O0BOmRY9MTtryGGhhyXA9Q+bnhCMzv3?=
 =?us-ascii?Q?ufkvpSKfzU/jHkl5QRFYfrKzajcJzfZn+9abSYnsX+xzrxW8B8dxHzlX+iuy?=
 =?us-ascii?Q?KHbPpzADkztna8fJcuIFgbF7kUA+NuWK2Hz1mnlPSDHvB1fJ9a9VsyvDDPpR?=
 =?us-ascii?Q?ji+MmzH0tsdHfb9TLnd39SQ3gUn9aIkG0IcS9UAxeawNudP784BiVt6gGynQ?=
 =?us-ascii?Q?Ne22yUI89YzP/WdiLtsJtIwKG/QVF8azfq3rCW/blY5o3zzX0bGs+EY1eiJa?=
 =?us-ascii?Q?yVRKWi1mPmMTUaHOhSnV3wv+54ZkKfv5yksz37nzVObJZk56nxgPKujjJlwe?=
 =?us-ascii?Q?yDj71VnHxt8nbxO/GkA7Js6K9Iy4gybcHAXtJorGZLnLwMgVJR69ipD85UUc?=
 =?us-ascii?Q?Z7I+QOUezchfLfIaVgktg1chCLq4jzBcEPMiKA7nNe2ddBGLlA1QP03XTfeG?=
 =?us-ascii?Q?A92iZCqLc7CYN52zfErmzAumao8VO6ihWvxVI6dGYp8H3U8XJVx3gjnwFwC7?=
 =?us-ascii?Q?xcvdWKASH9PuyjjU/AwJetAL0StXlK3TZkknbn8X5TIEJ4UlFShvCGA+oTfg?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d3fdf8-7286-48da-9763-08dd46c1e8ee
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:21:20.8605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggoeMHJ38BhzxhiO5jWbqOyh7LORD/JXIa6jLqDYuO8cL2VJFlvvXTZWqKK3GyOVTeiRtOyAI1NZ2drMlaU8dIKW6WHtA4w5v6md7ATyR3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8354
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

On Thu, Feb 06, 2025 at 04:04:13PM +0100, Peter Senna Tschudin wrote:
>Hi Lucas,
>
>My nits are not blockers to your patch being merged.
>
>On 05.02.2025 04:07, Lucas De Marchi wrote:
>> When testing i915, if there's another driver present, unloading i915 may
>> cause the other driver to unload and let developers chasing ghosts when
>> they think it was caused by i915.
>>
>> Hopefully fix the ATSM testing where AST driver is also bound to a
>> a device.
>
>Maybe a sentence about intel-gtt?
>
>>
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13292
>Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>
>> After this change, running i915_module_load@reload doesn't cause ast to
>> be unloaded, but I couldn't check it really fixes the issue since I
>> couldn't reproduce it.
>>
>>  lib/igt_kmod.c | 7 -------
>>  1 file changed, 7 deletions(-)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index d154701c6..524c1a632 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -690,7 +690,6 @@ int igt_kmod_unbind(const char *mod_name)
>>   * igt_intel_driver_unload:
>>   *
>>   * Unloads an Intel driver and its dependencies.
>Maybe change this to reflect what it is doing as the dependencies
>bit may no longer apply.

dependencies still apply since it calls __igt_intel_driver_unload().
But "Intel driver" doesn't: this function is only for i915, not xe.

I will wait for the CI re-run and reword this before
applying/re-sending.

thanks
Lucas De Marchi

>
>> - *
>>   */
>>  int
>>  igt_intel_driver_unload(const char *driver)
>> @@ -709,12 +708,6 @@ igt_intel_driver_unload(const char *driver)
>>  	}
>>  	free(who);
>>
>> -	if (igt_kmod_is_loaded("intel-gtt"))
>> -		igt_kmod_unload("intel-gtt");
>> -
>> -	igt_kmod_unload("drm_kms_helper");
>> -	igt_kmod_unload("drm");
>> -
>>  	if (igt_kmod_is_loaded(driver)) {
>>  		igt_warn("%s.ko still loaded!\n", driver);
>>  		return -EBUSY;
>
