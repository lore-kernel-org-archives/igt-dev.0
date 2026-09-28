Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE16C9833F
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 12:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6F510E874;
	Mon, 28 Sep 2026 12:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjbZ9sYC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0633110E88E
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 12:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790599791; x=1822135791;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=T2bMJ7XKiQ8B8CuWM+6CRThzuwEspfR5Uhd7G7a+sSQ=;
 b=hjbZ9sYCNkM9HI/3VPjkAwC1QPYz++vchtBvjUC+5SX7KnLtx8SZ+Osb
 JTuenaZZs2zi9VQ9lPViAPcT31IQ7UQmnNo0p0gIEO00pb/ij2dgTHr96
 xX9719zsDDeSiPaswED8j1EpWfFIAtzFlhSACd3nru0hV1SixpL75l8RL
 CsXQZHz1f+oF1ylAURJtIXEtnE5JszGU1tRS9SK3GFNY3vaUNAi2XtbeD
 0c5ofeJS7IoeYTNrjzt0+XJ5nOPs6oyoaLUiu8y98Zm2IofNRoK/86pi/
 ABKHjfFgqU7xskYJohv8kHLWyORxeCD6up+vKUxmHxnT3cMrLqrkEfSlg A==;
X-CSE-ConnectionGUID: xm9CUdaDQMeP6Bm1AVxiXA==
X-CSE-MsgGUID: 4FX6xUyHTJ6tMtWqQgw31Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="108786983"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="108786983"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 05:49:50 -0700
X-CSE-ConnectionGUID: VBfqWYbaTJ6nxeWslhYV3A==
X-CSE-MsgGUID: 44igsihqTum422dzM1SZsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="274267248"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 05:49:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 05:49:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 05:49:50 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.42)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 05:49:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iaBctxqAa4/UgqEmtqDNJa76Z6av2vZyhGLMLQ9xvn2Dswo0CPwsGCo//Req3cvPzd2jVDCP6QPqfLZxSb8guRoxspjr2N3AZsF0WBUYck3/8MqI+cj4CmfvYEvtmjVoSO/kDFSyWPxUFuCgqIgwzlty/JIZhIthD0C4lpKoW6R5Bu0UaepaZIBsruYx8LIpPnNvCc/lIu7Rqc8JnDLf/9c62q+/j7wO8wUgeoSQvnZ2JcPaA38BTne6RzKcqeIdlsdb4u2Tu2n4nIKgwXveOA5cRZunfWYnZC34cCaIW+s0ZpwaK1G5GsbNgWOS87y/zaBmX5bC3kV3nol2mk8kKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+wgw22CKtoqrHTOaO5nVeVNYwSQ0kU31uUbGiuQhK4=;
 b=ODXrh/C3p0hGwlTthM+gLngFTNrfdUA6bdfp4QJ3xzQMytqsXiHralkuXPvu9QdxkhBJw9V5rxzGJYtknle1qVkrP/w8x5/MHZubMDxmNGoF8ayWN/4+2+l937QLBDp1fWnQza0Op95QzvgkJyNEaWDzrXD2CaKK3+LEiRRUlIAqBc4RHr4OO2/CfnsLyGp+rn87MRuPOvDU4MOGgWXkLi1Dk8vDfh8tVnBblhU537mwPp3twJzLvxTH8EQwrWSXzjPkuGURZY2YwrTWAcCobYY0I10kfjQnLSLKHgsMoNklxQ3JxNM+gASOPNeMXZNzL//brUKXxt1Hdk3c4tVO/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by PH7PR11MB6882.namprd11.prod.outlook.com (2603:10b6:510:201::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 12:49:48 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0451.014; Mon, 28 Sep 2026
 12:49:40 +0000
Message-ID: <3f3936d0-8673-430e-8eda-debd327cc36c@intel.com>
Date: Mon, 28 Sep 2026 14:49:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,3/4] tests/sriov_pci_config: Add optional capability checks
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260921143707.2117970-4-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260921143707.2117970-4-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIYP296CA0011.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::16) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|PH7PR11MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: c42860b2-9e83-40d0-bff1-08df1d5ef667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: a3L6AEuHW+1obu5zXeKD1qkAkmGvTiIlrbQyNkC7LEUi/8C5P5oQ6d3ticeaeC9tZ4iVxWvhSwA7sbyRODf4kTA09mQgbX8J/uLfHFjXqY8+cvTyI5B9PHeXqszJV2vTMPcS2GBnygZr2Dqx+1Dai/nbo360/LoGjDJjoGeXVjc2VpUyH3n9mJpSeuUUggPn9DZromIAcOgUsnDUoVgKOx2ua6GtIhoUn/YbK2kz5RWddOyTcmcQjZ9NR7Ex9QIPbIefJQYlg638friiD8nLtxiW2xNpafdekNF3Ewk7A4KNVT2LV3Sg5Qx2SD64jo8NkCUQ1wQkC5UEZxi55ubhjlW6HJtaZk/eNasOIpRjaqvYsrUKPmzYE7FXfugI6xYeO6b0Rt2GtvlX3L+gz6vPa5JxpVx68p0PjiXLSK+FKEEBTTLkP5iTZ+A18oOIXnhwHjGLgRWjXO5ZaZ5Zr7kb33lSSh5ZZgLj7XYgqyPc46TQUw2CFU8ABg36t2bZiJvPmRoci8dSQNyS0bmDQCX2jKSVVUOyyDvSD3X0wgjTUz+6TYA2vs5LOTlJ28dmU6cj+Eb3/8nMR6pPxE8dFBI5qfgRz4DXyEmUesAtQNYJvZwbt/wXOH1PmznijbglDGEyH4kweR+tJA3uIHZvXThrAmgA+yZLmhIiHLzffEeTdR4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHo1Z3B6Qks5NkV1a0h4bU1VcmxORDhxNHJuQWNuNDlpU3lmSUJQY0Q1VmRN?=
 =?utf-8?B?M09WdzNHc3RjcUNiV2FBc0FnVW1kME5SZ0hMM3RyKzVveXF3WS9GTWc1dzU4?=
 =?utf-8?B?U2hZZUJ3bkh1enZEdHJqV1c1a1RLMHVTVXVtN1dxMkFrcExyMVNXcklUVFRD?=
 =?utf-8?B?U3BHMG4rYVRrZXlLVkhvSTEvTzZZblJuRFplV3lBcTYyMktUTzB3aWNOWGpU?=
 =?utf-8?B?dDFtYjE5bE83TXFFRThDYkxobXRuMDBzOTYvMlhzdXJ0NG1Ma1luaHlEcmtF?=
 =?utf-8?B?NjFFRjN3b0xMRlpQU3lWRnQzdTZOdTVjUWhUcVJiUEVLWlByeHNFVmswc1or?=
 =?utf-8?B?a2RsSmZrUXdFVEQ1Nm5pcEN4OUExZjc5aTgvbDJsTzFJUEw3ZjB2KzNHeGJm?=
 =?utf-8?B?cDVRbXcwZVFUeGczVmQremJDbzhtQ0ZDb0U1b2hmY0NsTXlUV2Q4YXZUK3hD?=
 =?utf-8?B?UklLckxmSmtYS0pkWXR1aHR3Q0kwWDVNdjhuSERwTjQxMElSWTdtUVJJNmpI?=
 =?utf-8?B?RmYvL1hZaGVXQlRpNlFBdjhNLzZidjBGL0tJSXlRZldSWUxRK3BudmU2QU9K?=
 =?utf-8?B?eHpKOWlZNXBCWVdIL0ZnK0hmRm02NlZzT2RBNjVKVC80MWd1M1Q2Wm9WQzJS?=
 =?utf-8?B?Z29BYzMweVNaUU1BUmJhS01XbUNYNXZPWlBuZE1Ya25aRGRsV2Rma0ZCdEd6?=
 =?utf-8?B?WndnMmVIN0txdW5HYjJHc1pOVzA5WkI2RzdLMUlMUHYrZU14RHQ2cmZaWVJH?=
 =?utf-8?B?eGd6cWlPQ0lsWDlxWEZuODNCd1BSOUpRQitYQ05md0VidndjbGtockNraDhZ?=
 =?utf-8?B?cEFHTGpUMkhCRVVWcTdMWmNoUC8vcFlLRWVpb1NUcDJDYTlOWE5xSXNVbnkv?=
 =?utf-8?B?UWd6dEhMZnpKaHdRQjZsZXF5TjBHVGJTc2FuTjRNOUp0YzU3NGM4SUNoSmpZ?=
 =?utf-8?B?eG9LZCt1N2N3SE9GWWtVeXQ3RmVwM0p5Rnh5RU9VVXM5VDlBdFJETmRkWncr?=
 =?utf-8?B?b3c2MTJ6T3BraDB6QzN6WlpLd0FRMFNGU1J5MGk4ZE0zdXlqKzRBQ2hPWGFX?=
 =?utf-8?B?ZzJaSlVOWTJFdXM1Zk9PUkpoYTVpRnFFbjUvNjdrakZwY1pSQlVSRmxYZTVn?=
 =?utf-8?B?ODNHZERodWwxSFhoa0dUVEhKZXZSWkFrYkxsV0FyVFV1S3BzYnB5eHBPOUg1?=
 =?utf-8?B?TXdmUC93Uys3ZkxSK0RLeUVjQm5ZRWt2eDhwby9ZOXRTdWUwcGkwZ1BJcnpv?=
 =?utf-8?B?SGZVS0xRK25lbmRlV29MUFp5Q0s1bGIwVTlaWFVJcGdnV2oza2FxaEFnNldS?=
 =?utf-8?B?UHY3RmpRalhyZWFGV3k1VVhLUGIzRitmVCtaSlhqRlNwaEhGK1J0dlZZMjd1?=
 =?utf-8?B?NHp3YVE1OEMzV2xKaWhLbFpUamhHdDdkdEJVSUJOenlZRFU2dG81QVB6QjBS?=
 =?utf-8?B?dlhNS2Y1V21SK203MkdDdzZMYi9vcmJiUEFWNDJhWHkxVXluYUNNT08rbFlT?=
 =?utf-8?B?ZDNVUVpRR0FqNmtjSEgvMlp2OVlmR3ZXUmhWWTlndU9VdDJqa3psYUhjSkhp?=
 =?utf-8?B?VGUxZTZXeUM1SHI3T3lJN1dwSDM2Mm56VTZDR2JNUHVHQUdhamh5Vk01WDk2?=
 =?utf-8?B?UlR6Q2pZUXp2czVYRFlkNGZNbEtlS2xqSjhQTFBjOElRSndzRzA3cDFyaVJZ?=
 =?utf-8?B?eW1GZThUaTh1Skl5Um9EYzJ0a052OG5CV0YzY0svUmxtTGhEbE9yVTZyZVJ4?=
 =?utf-8?B?QnpmUVhObXdiTlpLdmQzbGdCdTUvM0xFcWQ5ckg3Ky9nZnQ2Z2t6UEk3UEhx?=
 =?utf-8?B?eUlxcWNIbEljV0RGL1FzcWFLalpCT1plQTBpcGRBem1tMUZ4bkgxcXhsK2xD?=
 =?utf-8?B?WHJheTBhTTF5MUxsYTBOeEN4cVFyRGhvS202QlJkcmcydVl6aUZFc2ZWVHJR?=
 =?utf-8?B?Mk5EZ0NlN2FDeWFXOHFKNjc1b3RYQXQ1bHlFOWk5Y0YyYWcrQmRiSktZOTkv?=
 =?utf-8?B?YnNmNkdLL3dPeGl5Y2I0TElGYk14SmlMRGUvNCt5WndQeGFPRlJtZE9xTUVK?=
 =?utf-8?B?SWpGeFNKbWdUeXFPSElVTVBOVmxTZnhzSi9iRXdsTmcrWVhpejhtdkdjQTdT?=
 =?utf-8?B?VC9qanNNZFZlQkRsWlRrN0tOTGRrcDdyMmVYaWN3Q2liRjlHVDZIMnBQNUdz?=
 =?utf-8?B?UGlQN1pGOXVpSE0vQnVnVGlvVmpxU1FEaE5NSUgwQlJJYllOUFE4Q0UwYUV1?=
 =?utf-8?B?VXZyNXF5WHV3NnFTV1FHaDk4QWFyVDg0Q3c1UlFoUmlvTEEyaHNZakpxWEFI?=
 =?utf-8?B?NlFHK1Y5REZaK3JJU1VSTW96Nlh4MDZRV0l4TUw3ekh1QUtNNVNGQT09?=
X-Exchange-RoutingPolicyChecked: uPVVp8/D2CmKi3+q8Eeygb4AfjXgz/yoj2dckdfZ4qmQbQs37Ka91nlNzeVshFqDTDeKyBm9tnvCsJLZTkWFUL6RgU0kG2scKpqFah38oRiq8gExmGv+cUfcf9tFldYfx5fvYzjHHcRybUPCkuJVvI0lCp6cRpuP21yVMXgytrq3gGWNYg7GKcQ055dZ9xU7d7tzz8Qkyv8zCrET46azCLdXiEhH7iCGZj4P8Nd21h72OURoY0EIebH8p75cWwVrhe+a5tw1VlFO2ONf/n6SUOuOm72bkNyK8EBulctRNDXHlOv2NBiNHGLoQpWTiN+YgkzbRWXE/RUT0Dx3k9Owkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c42860b2-9e83-40d0-bff1-08df1d5ef667
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:49:40.8899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDPJP33JieWexZzqffmHiW32sL1BybA4kMsrwE1JAAQqZvniJqrfDPNv3S+njMAXPfNgj3zrFiKdUzvXfEitnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6882
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


On 9/21/2026 16:37, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add subtests for the optional Power Management, Advanced Error
> Reporting, and Address Translation Service capabilities.
> Skip an optional-capability subtest when the capability is not exposed
> by the VF.
> Validate the VF ROZ fields required by the SR-IOV specification,
> including Power Management Data Select/Data, AER status/mask/severity
> fields, and ATS Queue Depth/STU.
>
> v2:
> - Reuse the VF configuration captured by the common fixture.
> - Use PCI register definitions available from linux/pci_regs.h.
> - Simplify optional-capability skips and runtime descriptions.
> - Remove redundant informational messages.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Assisted-by: GPT-5.6 Luna

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/sriov_pci_config.c | 110 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 110 insertions(+)
>
> diff --git a/tests/sriov_pci_config.c b/tests/sriov_pci_config.c
> index 9f410ef23a..a3d7e86b58 100644
> --- a/tests/sriov_pci_config.c
> +++ b/tests/sriov_pci_config.c
> @@ -43,6 +43,21 @@
>    * Description: Validate that the Current De-emphasis Level field in Link
>    * Status 2 is RsvdZ and therefore reads as zero for PCIe Capability Version 2
>    * and later.
> + *
> + * SUBTEST: vf-power-management-capability
> + * Description: Validate that Data Select in Power Management Control and
> + * Power Management Data are ROZ and therefore read as zero when the optional
> + * Power Management capability is present.
> + *
> + * SUBTEST: vf-advanced-error-reporting
> + * Description: Validate that the specified ROZ bits in AER Uncorrectable
> + * Error Status, Mask, and Severity, and Correctable Error Status read as zero
> + * when the optional AER capability is present.
> + *
> + * SUBTEST: vf-ats-capability
> + * Description: Validate that ATS Queue Depth and the Smallest Translation Unit
> + * (STU) are ROZ and therefore read as zero when the optional ATS capability
> + * is present.
>    */
>   
>   IGT_TEST_DESCRIPTION("Validate PCI configuration fields required for SR-IOV, "
> @@ -161,6 +176,85 @@ static void check_vf_pcie_capabilities_2(const uint8_t *config)
>   		     lnksta2);
>   }
>   
> +static int get_optional_cap(const uint8_t *config, uint8_t cap_id, const char *name)
> +{
> +	int cap = igt_pci_config_raw_find_cap_offset(config, cap_id);
> +
> +	igt_assert_f(cap >= 0, "Invalid VF PCI capability list (%d)\n", cap);
> +	if (!cap)
> +		igt_skip("%s\n", name);
> +
> +	return cap;
> +}
> +
> +static int get_optional_ext_cap(const uint8_t *config, uint16_t cap_id, const char *name)
> +{
> +	int cap = igt_pci_config_raw_find_ext_cap_offset(config, cap_id);
> +
> +	igt_assert_f(cap >= 0, "Invalid VF extended capability list (%d)\n", cap);
> +	if (!cap)
> +		igt_skip("%s\n", name);
> +
> +	return cap;
> +}
> +
> +static void check_vf_power_management_capability(const uint8_t *config)
> +{
> +	int pm_cap = get_optional_cap(config, PCI_CAP_ID_PM,
> +				     "Power Management capability is not present");
> +	uint16_t pm_ctrl = igt_pci_config_raw_read_u16(config, pm_cap + PCI_PM_CTRL);
> +	uint8_t pm_data = config[pm_cap + PCI_PM_DATA_REGISTER];
> +
> +	igt_assert_f(!(pm_ctrl & PCI_PM_CTRL_DATA_SEL_MASK),
> +		     "Power Management Control: Data Select must be zero (0x%04x)\n", pm_ctrl);
> +	igt_assert_f(!pm_data, "Power Management Data: expected 0x00, got 0x%02x\n", pm_data);
> +}
> +
> +static void check_vf_advanced_error_reporting(const uint8_t *config)
> +{
> +	const uint32_t uncor_roz = PCI_ERR_UNC_DLP | PCI_ERR_UNC_SURPDN |
> +				   PCI_ERR_UNC_FCP | PCI_ERR_UNC_RX_OVER |
> +				   PCI_ERR_UNC_MALF_TLP | PCI_ERR_UNC_ECRC;
> +	const uint32_t cor_roz = PCI_ERR_COR_RCVR | PCI_ERR_COR_BAD_TLP |
> +					 PCI_ERR_COR_REP_ROLL | PCI_ERR_COR_REP_TIMER;
> +	int aer_cap = get_optional_ext_cap(config, PCI_EXT_CAP_ID_ERR,
> +					   "Advanced Error Reporting capability is not present");
> +	uint32_t uncor_status = igt_pci_config_raw_read_u32(config,
> +							     aer_cap + PCI_ERR_UNCOR_STATUS);
> +	uint32_t uncor_mask = igt_pci_config_raw_read_u32(config,
> +							   aer_cap + PCI_ERR_UNCOR_MASK);
> +	uint32_t uncor_severity = igt_pci_config_raw_read_u32(config,
> +							       aer_cap + PCI_ERR_UNCOR_SEVER);
> +	uint32_t cor_status = igt_pci_config_raw_read_u32(config,
> +							   aer_cap + PCI_ERR_COR_STATUS);
> +
> +	igt_assert_f(!(uncor_status & uncor_roz),
> +		     "AER Uncorrectable Error Status: VF ROZ bits are set (0x%08x)\n",
> +		     uncor_status);
> +	igt_assert_f(!(uncor_mask & uncor_roz),
> +		     "AER Uncorrectable Error Mask: VF ROZ bits are set (0x%08x)\n",
> +		     uncor_mask);
> +	igt_assert_f(!(uncor_severity & uncor_roz),
> +		     "AER Uncorrectable Error Severity: VF ROZ bits are set (0x%08x)\n",
> +		     uncor_severity);
> +	igt_assert_f(!(cor_status & cor_roz),
> +		     "AER Correctable Error Status: VF ROZ bits are set (0x%08x)\n",
> +		     cor_status);
> +}
> +
> +static void check_vf_ats_capability(const uint8_t *config)
> +{
> +	int ats_cap = get_optional_ext_cap(config, PCI_EXT_CAP_ID_ATS,
> +					   "ATS capability is not present");
> +	uint16_t ats_capability = igt_pci_config_raw_read_u16(config, ats_cap + PCI_ATS_CAP);
> +	uint16_t ats_control = igt_pci_config_raw_read_u16(config, ats_cap + PCI_ATS_CTRL);
> +
> +	igt_assert_f(!PCI_ATS_CAP_QDEP(ats_capability),
> +		     "ATS Capability: Queue Depth must be zero (0x%04x)\n", ats_capability);
> +	igt_assert_f(!PCI_ATS_CTRL_STU(ats_control),
> +		     "ATS Control: STU must be zero (0x%04x)\n", ats_control);
> +}
> +
>   int igt_main()
>   {
>   	igt_fixture() {
> @@ -195,6 +289,22 @@ int igt_main()
>   	igt_subtest("vf-pcie-capabilities-2") {
>   		check_vf_pcie_capabilities_2(vf_config);
>   	}
> +
> +	igt_describe("Validate the optional VF Power Management capability");
> +	igt_subtest("vf-power-management-capability") {
> +		check_vf_power_management_capability(vf_config);
> +	}
> +
> +	igt_describe("Validate the optional VF AER capability");
> +	igt_subtest("vf-advanced-error-reporting") {
> +		check_vf_advanced_error_reporting(vf_config);
> +	}
> +
> +	igt_describe("Validate the optional VF ATS capability");
> +	igt_subtest("vf-ats-capability") {
> +		check_vf_ats_capability(vf_config);
> +	}
> +
>   	igt_fixture() {
>   		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
>   		igt_sriov_disable_vfs(pf_fd);
