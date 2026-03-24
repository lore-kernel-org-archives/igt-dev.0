Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F97F54AC0
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 14:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF40310E53F;
	Tue, 24 Mar 2026 14:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cF5R1Okg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B48310E53F
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 14:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774361879; x=1805897879;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KlUETcVm6zKqPork7Ie4RmCU8NoDG82Q6qkm6M53O78=;
 b=cF5R1OkgfO9mWuCpAKZD0/18qSXmx1ue98ifqQVLarZ4LnM3OrPRNwAq
 ufqtEZiklV7Tebsq2Icuwakvj9AlMMrhLLTxWnDG7pE7hLyh1/et2M5NW
 EP/6skykbMqFGOIIxymrBxc5KvraF/CjsJhgt+ReXsaLo+oEPTY7wjeVM
 RYeWzV3TvD/jbmJThCa2JySkznavMjFkKtU5HHaUHPyN0FWtUMRkr7Qgt
 GVZrTjRGmr7QaNSm54kcp9H+TTlJffiOqy0kAAeY+bzwHG0X7rF3S2TH3
 NzP2H3Ip24YhVV3f5gniqvC3WJvLd5Cck+h3xfuZnVwOA8I1ilfRBHojr w==;
X-CSE-ConnectionGUID: f49gJO7sSNSMdLskJ8CQYw==
X-CSE-MsgGUID: UEtDIGGVSraEROzYeOdi7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100824338"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="100824338"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:17:59 -0700
X-CSE-ConnectionGUID: WTkoIVeWSw6eoHlCUOuE1A==
X-CSE-MsgGUID: ROluMpn1T4uxreseVtSmDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="229114475"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:17:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 07:17:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 07:17:58 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 07:17:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/UjgZtripQ3+P5CklOMjdUNrldjAoummUlfHRQd64i3xv+DeWzBnqFodO386SAGlqZEAr1MiTkDxqEH3AKblnUwIdiCow8f8Sv9Gj4mx7jhUlkubbMNTFopqrPMjLUeGCyFmqQC8jZs3vHiK+l1G5379MS3U4UnLvH3sylTA+QSaABCrf8C19/wqZlvnRMxZeuoltgRx5uQR3ke+9zAhnSyVYIkBko+BuH0rixcRIFQDNNC+DFOf7g9z4p6pCAchj/hSj5rUuEeNfab3Hzf1jZycpPn9yZQUu7FH58CsiDsEJBGNICslaPcElTUAnoCQOvC2w+gbdTb2dquWSZvNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNJ2ExJsLP3vt6XqnxwVzhKcu6Ak9GvsjARYpKzS2js=;
 b=NuoM+z3ZZcFT+SJ+CPBIjRi4gLL8LEO+4b3Kc6FTVuGUUG4FDygazkjmoG8KtpPflYE6aPdWPn6AcP6yCown/sRUI1JVgB/2tuXGcVUljD588DKb6M1jKMfcWzKmUXnmFTSjtrElbtP9YpcCmJ2y1ugXTCRnFn9ossv9Lt1p641/WiZrnuQeDqzt++qe+ey3qiDzZqo3U7tVbZ6wxZPpT84NKppRb3ud1DJOXowPlCvVWy+rYvjEfVMobRyFgW4DgvjVbmDb8QcVDGr7OI7uLG967w1qnE5qiPcd0qGFuG/aTda0SiWAb/epS5layeQt74FtjaMoiCPVtncL1lDhcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 14:17:54 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%6]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 14:17:54 +0000
Message-ID: <37cf5ef3-6247-4c2a-bb24-25b640a929bf@intel.com>
Date: Tue, 24 Mar 2026 15:17:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/intel/xe_sriov_vfio: Add open-basic
 subtest
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20260318161447.961840-1-marcin.bernatowicz@linux.intel.com>
 <20260318161447.961840-4-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260318161447.961840-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0229.eurprd08.prod.outlook.com
 (2603:10a6:802:15::38) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|PH7PR11MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 36942711-c412-46bf-90a6-08de89b023bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|7053199007|18002099003;
X-Microsoft-Antispam-Message-Info: vnXzJzZQLFHPeYDKjeji2OnzI2VJL084Xwgs7p1XArncRhoerltRZfxgtKU3MZrFKEw/K4N8NbRcUzJjOWrVanpp3NEeaKTjuDZz4r6DmuoO5CXbYJK9wWTvATNVXj9uW/VDR7u3XRUl+JLUqTIPXKvPrN56gy9Tmi22yF+ya7Gi28RWU9lKLi5MXjfZ/d+wAR0fRCnE1MQG4ZVsK9DeZAyxzFZUNfp97hkBd2tIc2OjeYbAiSaDgMGFn5eubOHxZ6E0ZeXRMp1u0Je4yx/sXMNZAknggpkv3jrHLwx5EraV0tYOG+6FERNltP38mK5TbLuMxbRNUkh2SwEV3hQiPAFS83HogNnrMQdm5YCJGu6et77fwtKl/5/PElYIMjAEpRDbdF5BE/8GWnGmrOYvd7wVicFYfWPgm6Zde5mLD2xq4HkLwkpQC7vGd98bLjWUepODxnM1VuveiXRi0fU8roDqmGW+O0byrgBGGkI15dLHszPLddP6ImYUrxFdZ3keFeFW1Kfi7OAbPzPBGiwX8IYSPSxZD7eDDztN3+USahFLseN+FSFh00Z5FDDwPEFTacY6y6bTzhLuAuExQHbk0Yr22gxC7DOW48bd1+PfcbbUN+OegcmSl1F1FNreZAVgJ20ea9oYpdji6hDwrsAoUhxfKgWTDBjJ1c7LhJILUIlqoJniuWDLZ4p6O1/+/x+dLmlnR3iW5SgF4RqSjnxpniABrGu8H64KS0zcVbhuv1I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(7053199007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWI4VDBGbEYxWFV5VWY5eFNNSjVsRHozektKR3M1V1YrbXlzaG1QNDlnM2JP?=
 =?utf-8?B?b013Umw4TUJwdWRDaXdKenNTMHpGVXluSGVVaUtxQzU1OXhmVy8vSG91UWRE?=
 =?utf-8?B?bW5ROURibm1xZ1A0OUcxWUhlVFdmcXJrZEVYVDlidEhYOWNuZzhFS2lScTlq?=
 =?utf-8?B?aTBEdExWUVN6RUpkRi9oVXA1a0lqR2daUkhuQTJuZUR2Skd4d0JPKy9iQzdn?=
 =?utf-8?B?Y013empuREJqMERsZnA1VE53dGcvUjd1SEMxZG1tamIzVE1nYjVaaHJjZUE5?=
 =?utf-8?B?enhjRHZMY0JKS0RWSjZrajV2cUJ3WjFzb0RIUkwyNlhHMXJKeW9HMFB2MVdR?=
 =?utf-8?B?ZTA5ZXczVnpkUGJHSWNiVWRab2VKaXFlbzFZL3l6aW9FWlo5T0dacHkxRXYx?=
 =?utf-8?B?eXF3cjJ0c3kxVmx4YnA3Mk9qcElDY1NSWm0zL0dpQ2s2QjA4UnZyNXYzeU8r?=
 =?utf-8?B?bXUzQ1BEU3J3eW8wMTdjNVBOYThJZlYzOGRTcnhyWmVLNGJFRnZGZU8zcEll?=
 =?utf-8?B?ZjlRODM2VEZ1elUrUGhHTkVodjkyV0tEcEVOT0tSZTFLU2hFOUpmbEFEVlNF?=
 =?utf-8?B?N1dqbnp0MXFJRG1MT2RIRWhyS2E0OTIxSWhBQmpsbkExWmFSMGhRTUIvMXlh?=
 =?utf-8?B?TmFxNFJ6MW11Y3hucFRRQlFabXlBckRhNzk3eFlsWURyK3RjY3Vwc0ZJcWhX?=
 =?utf-8?B?emFleHcvNUZrTVE3c3QxSEVGNDA4eUVWWGZBS1dUakR6emlpVFRKN0NVSHl3?=
 =?utf-8?B?d3pscytIWWcyVDZlclhTZit3Rmw4anU0S004Vml4WnlVaGpVc05TSzNkcklv?=
 =?utf-8?B?dFU4WS9TNzNWYnNyVnFxUWFJVHJ6djR4bUxnamFmMFRzS1VkQWZxQkRrbkt0?=
 =?utf-8?B?OTl1V3QyNjVwL3N1MStMdksvclJBSFR0UUVmVStpSEx3S2lwbDBpWFc0L2tP?=
 =?utf-8?B?YkJ3U3BuVnBvSTRmcmNnWGkzWU9ISThrRXNkMXRIdkRwcXF0bWFhWitOSXZQ?=
 =?utf-8?B?UUEwVFh6V005UDBSSGRZb2hycHc5ak9Cczl2MXpyUE5CaGhYaWJIMzU1RWI3?=
 =?utf-8?B?K3llK0tqZWxjYlNVa1BTWXJ2M1lKS0tyK2JMaVdUOC9pR0FsRUxEazEzYXVJ?=
 =?utf-8?B?Uk12TWk2NUVjNlV1WFNpUWlNSDVpQjNDSEozdkd3S3dqOFd5NTFRMmN1d1VF?=
 =?utf-8?B?N1pRQW5RanN2Rk5CLzkzSVdZdG1LZ3Q5YUVEK2ZvcHNiRmIxTVBhVUZTYWow?=
 =?utf-8?B?bGx4aHNlNDlhVjVNb0t6aVNXdmRkRHI4NHBJY3c0Tiswb3kra2N3MmRBOHBR?=
 =?utf-8?B?WktkVmVZb0V6UitZMWVZSFdxamd4N2FUVkRZRm01MWo1c1JYamlMVUxYekx1?=
 =?utf-8?B?TENtQlJMblIvVE11UFVkTGoxdGJSUTE4T3hDd1Mrdk5RaUZMOS9aeHphUzly?=
 =?utf-8?B?SC9VM0JjaVJWQnhSdktXZW5uZzVveFN1Y2g4TFRJaCtldXpLMUNTNVRCZlRl?=
 =?utf-8?B?YkNPWDFpQ0JiUzNQS1BxblBYdDBtWEFJRytIa3I2VkV6STdaNWpEc2NsUERm?=
 =?utf-8?B?VlE1Y2FwSXNjWnN5cGVyckMrQkFIS2JFUFZQTmpHVFJ1VmI2ZjBic2tzU3Bh?=
 =?utf-8?B?SlIvL0MraTdURkxyNGpUeHNOOUZTYkVKQ0lUampMUERDcTZJN1lMWmJyaDNZ?=
 =?utf-8?B?cEpMcUt5L3dhb04rUHdONHRvbU9TbXZacEFQTEF3WDlwTi9pNzB2dWRHWEt5?=
 =?utf-8?B?akJXa1Q1S3ZwWkRBZURlbnR4cnBYM2RZb29ISk9mUiszS1pwMmVjWGE1alJ4?=
 =?utf-8?B?TE5PTXJjTUtXeFNXZ1ppUkx0STczTHZSRFR2UU55RTZXZ2tzVU9lWDZlSHU2?=
 =?utf-8?B?eThmMjVJcmlqUTVsRVlsWjh5bnlJaWFFeUdXMXpOOWNkdG4yRzF1R2kzMEhO?=
 =?utf-8?B?dm9WQ2l2OXh4RE1HeWZZaWtmaTZRSjJzYWgrdVJxNDkrYnJiQWpWMmMvRmtT?=
 =?utf-8?B?YjQxL1djLzk2R0NiL2FScGFSL3NoOHIyb1pUVHA5Y1VKN0llMGl6eWM1WDdx?=
 =?utf-8?B?NnNJN2hUcnNVMkh3NmZreFh0ZmtjNEpPK1BCcFMxUVVETWJWUWRXUG5oWkJz?=
 =?utf-8?B?YWh4NmNpcEJOaGY5Q0lrL1VIMyt1bzdCWWFYa0JjUWZlbVpvRGp5N2MwNXY2?=
 =?utf-8?B?aC8vM3AwOHQ2ZzBaWUowanEwdnp4cGVOaEExWVlVVE94ekdUT1pkclhzbG5R?=
 =?utf-8?B?Ymh1SmRvMWNvWllJY3p2L2RUdS9wYWk4M3dWSWhZUWtDUWxSS2UyZUJ6ZmFI?=
 =?utf-8?B?MWFCaGdhY08yakRrVmM1OWxzTWhiQlphWG43ZEpmRzlxQm5CM0xHdz09?=
X-Exchange-RoutingPolicyChecked: pvwB87UCBkE1GVc1UR+r5xqGXjr/hDYeHMLNtj00f7616e1XZGqEVCkSHnhe/LRantaU7mBg4D32GCaFinMmHAJzpTtNinvxDEWqirL1ALD0zIZUuzp+Xdh779bJcW4zILTfG+MU1qcCQvexABusIiDPSrfZFp/r89ktFZ4fT2UsyxeYS+R/vkyd9NCX2DXhunIdZhTrQmHSGLj7Bru4lth6w+5KCGoStVUSB6K0ALvK3hHJ6XR81JLABibpVEbYvHlMW8MJfRjBFtMgTok+5Xhy4BBXhzHGYOHNpNbTbXfrD/54FuWwrpBF2nYjkAcSrChu6TZAgFPc+lTFZnwYwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 36942711-c412-46bf-90a6-08de89b023bd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:17:54.2320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycE2KUYWLkYlBtvFKx1srMOxBM/k2VQ33rG8cOqHKymowKAaAJZeDOsVQsGu2WKj+zMTMQ4TbaSkiFxBLpjZNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
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


On 3/18/2026 17:14, Marcin Bernatowicz wrote:
> The subtest binds a VF to xe-vfio-pci, opens its VFIO group, and
> verifies basic VFIO access with a minimal group status query. This
> provides a simple smoke test for VFIO device setup.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel/xe_sriov_vfio.c | 136 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 136 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
> index a2b2959e2..6a5cc536b 100644
> --- a/tests/intel/xe_sriov_vfio.c
> +++ b/tests/intel/xe_sriov_vfio.c
> @@ -6,6 +6,8 @@
>   #include <ctype.h>
>   #include <dirent.h>
>   #include <fcntl.h>
> +#include <linux/vfio.h>
> +#include <sys/ioctl.h>
>   
>   #include "drmtest.h"
>   #include "igt_core.h"
> @@ -29,6 +31,9 @@
>    *
>    * SUBTEST: bind-unbind-vfs
>    * Description: Enable VFs and bind/unbind each one to xe-vfio-pci via driver_override.
> + *
> + * SUBTEST: open-basic
> + * Description: Bind VF to xe-vfio-pci and perform minimal VFIO group open and status ioctl.
>    */
>   
>   IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
> @@ -199,6 +204,109 @@ static void restore_xe_vfio_module(void)
>   	restore_xe_vfio_on_exit = false;
>   }
>   
> +static bool vf_iommu_group_id_alloc(const char *pci_slot, char **out_group_id)
> +{
> +	char path[PATH_MAX];
> +	char link[PATH_MAX];
> +	ssize_t len;
> +	const char *base;
> +
> +	igt_assert(out_group_id);
> +	*out_group_id = NULL;
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/iommu_group", pci_slot);
> +	len = readlink(path, link, sizeof(link) - 1);
> +	if (len < 0)
> +		return false;
> +
> +	link[len] = '\0';
> +	base = strrchr(link, '/');
> +	if (!base || !base[1])
> +		return false;
> +
> +	*out_group_id = strdup(base + 1);
> +	igt_assert(*out_group_id);
> +
> +	return true;
> +}
> +
> +struct vfio_dev_fds {
> +	int container_fd;
> +	int group_fd;
> +	int device_fd;
> +	char *group_id;
> +};
> +
> +static void vfio_open_group(const char *pci_slot, struct vfio_dev_fds *out,
> +			    struct vfio_group_status *out_group_status)
> +{
> +	char group_path[PATH_MAX];
> +	int ret;
> +
> +	igt_assert(out);
> +	*out = (struct vfio_dev_fds){
> +		.container_fd = -1,
> +		.group_fd = -1,
> +		.device_fd = -1,
> +		.group_id = NULL,
> +	};
> +
> +	if (out_group_status)
> +		*out_group_status = (struct vfio_group_status){
> +					.argsz = sizeof(*out_group_status)
> +				    };
> +
> +	if (!vf_iommu_group_id_alloc(pci_slot, &out->group_id))
> +		igt_skip("No IOMMU group (IOMMU disabled or not exposed)\n");
> +
> +	out->container_fd = open("/dev/vfio/vfio", O_RDWR | O_CLOEXEC);
> +	if (out->container_fd < 0)
> +		igt_skip("/dev/vfio/vfio not available\n");
> +
> +	snprintf(group_path, sizeof(group_path), "/dev/vfio/%s", out->group_id);
> +	out->group_fd = open(group_path, O_RDWR | O_CLOEXEC);
> +	igt_require_f(out->group_fd >= 0, "Failed to open %s (%d)\n", group_path, -errno);
> +
> +	if (out_group_status) {
> +		ret = ioctl(out->group_fd, VFIO_GROUP_GET_STATUS, out_group_status);
> +		igt_require_f(ret == 0, "VFIO_GROUP_GET_STATUS failed (%d)\n", -errno);
> +	}
> +}
> +
> +static void vfio_close_device(struct vfio_dev_fds *fds)
> +{
> +	if (!fds)
> +		return;
> +
> +	if (fds->device_fd >= 0)
> +		close(fds->device_fd);
> +
> +	if (fds->group_fd >= 0 && fds->container_fd >= 0)
> +		ioctl(fds->group_fd, VFIO_GROUP_UNSET_CONTAINER, &fds->container_fd);
> +
> +	if (fds->group_fd >= 0)
> +		close(fds->group_fd);
> +	if (fds->container_fd >= 0)
> +		close(fds->container_fd);
> +
> +	free(fds->group_id);
> +
> +	fds->container_fd = -1;
> +	fds->group_fd = -1;
> +	fds->device_fd = -1;
> +	fds->group_id = NULL;
> +}
> +
> +static void vfio_open_basic(const char *pci_slot)
> +{
> +	struct vfio_dev_fds fds;
> +	struct vfio_group_status group_status;
> +
> +	vfio_open_group(pci_slot, &fds, &group_status);
> +	igt_info("VFIO group %s status flags=0x%x\n", fds.group_id, group_status.flags);
> +	vfio_close_device(&fds);
> +}
> +
>   int igt_main()
>   {
>   	igt_fixture() {
> @@ -250,6 +358,34 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_describe("Bind VF to xe-vfio-pci and do minimal VFIO open and GET_STATUS.");
> +	igt_subtest("open-basic") {
> +		char *slot = NULL;
> +
> +		igt_skip_on_f(igt_kmod_load(XE_VFIO_PCI_MOD, NULL),
> +			      "Failed to load %s\n", XE_VFIO_PCI_MOD);
> +		restore_xe_vfio_on_exit = true;
> +
> +		open_pf();
> +
> +		igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_sriov_enable_vfs(pf_fd, 1);

Maybe vf_num = 1 and then use variable?

> +
> +		igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
> +		igt_sriov_enable_driver_autoprobe(pf_fd);
> +
> +		slot = vf_pci_slot_alloc(1);
> +
> +		vf_unbind_override(1);

The same as in previous patch - is this unbind needed?

> +		vf_bind_override(1, XE_VFIO_PCI_DRV);
> +
> +		vfio_open_basic(slot);
> +
> +		vf_unbind_override(1);
> +		free(slot);
> +		igt_sriov_disable_vfs(pf_fd);
> +	}
> +
>   	igt_fixture() {
>   		cleanup_pf();
>   		restore_xe_vfio_module();
