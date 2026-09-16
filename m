Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC51C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 07:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEF810E035;
	Wed, 16 Sep 2026 07:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNK2aCQT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA8A10E035
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 07:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789542919; x=1821078919;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VWf9x6SpQdKJn9uO7nS02BLoo6B7HpSOam7JY5X+m60=;
 b=mNK2aCQT3Vo5suWVuLPvXcrL3O0pORCO9o08gkjMytnw5LzOM2SJd/22
 oegxaelxbLjwHt4VwT0HzrF0KdYD+Gn/LFlLQnrLOK+WAuQWSo6PBGiAm
 y3GHl5OdWXOJkhZ60vmpdOSU4bT2E5c7TH2MSYANu0bDb2rc7xQr/Gl1y
 JPQ21Yh77Tt4v3eGmj5Rt89ZxPZGKvvcH8vpGC0vMqwbbrRztWLqdIYvR
 6BbfjDZ1oDPF4BGQTD7MhYOghe+ne2jkMWeBL4FLeeBg4ac7cfa62andA
 7p0xrkp/fwM1XcV164O+Fsen2vOxYOn628d12W34tugQvuunHVAfFHCW/ Q==;
X-CSE-ConnectionGUID: GfO85ReTQdiuHHUEviFKng==
X-CSE-MsgGUID: Z2xDbEstTmKaR4Ytc/HF5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100577721"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100577721"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 00:15:14 -0700
X-CSE-ConnectionGUID: FDAjk7gQRemShFFW/3W5Zw==
X-CSE-MsgGUID: XXJN2SRzRGGY0O7yKH2mMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277003465"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 00:15:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 00:15:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 00:15:13 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 00:15:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLwbMaFsjT0tJOVv/aBs0DGV1zXC9QqE2WmXHqqmbEGIl/3HDQsaK4IPExUnJnNf4M4IKP8pBtKP6rPHdZbG7OJZJ1P3nWS375o2VGVBr5ExxlbQQuCeB1QX77tiNKIGMXxNKqDxDZxrtoAIi3sChgjF/C/RuxWzQSTwXCGWOzEPf2RmWYtfYgpko2b5pqYPsohbEoTMTQ402RMAz1Y4M6PoTUkYU9oOS2o400k9uqgILk2ADFYjk378dAwday3rQIYkCK7S4+0iRh3S//aMZVJF2lJgY2in/GAonUFV7r+OvhirvoTYpZSMoHuq5IfkEM5eZhK1BG9RlSRzLVN/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woh//bSuc8gONjcRGe45/fDXiBoBmrSIaeyIMOdCBMQ=;
 b=djzujHdg/TMR+84ssW1Ukxj+NUVkLtEp6JL/vNYS1YzEBdvFfDnSuHkQVyXxP+iTG9w+gN9J8OrTw6a2bvx79pTinDwdvz7E0GNkaztmtM2xSU0Y8+KnkZb6eX6MJvG1zdSKLsLW0v/Df8xPNUeMJJDHr31ZZCvoz0uYabNpP5MFlZvOZSyC5mjLrK3j8rd7+TevtTOH486F7YX0pMbTWdI2zhI1Vz1D1aQ5dOhbugVUya2+YwwMiCVdYuMSwgRglbNvfCRSXCtLHba4oNKs2zYJsJ3m+/VyOLUM7QkNevuh0t+3msPfYyRYh9K9C0heUc4xaySgfGxZL5pixi5kyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by MN2PR11MB4709.namprd11.prod.outlook.com
 (2603:10b6:208:267::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 07:15:05 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::9323:8d2:64e0:4c7b]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::9323:8d2:64e0:4c7b%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 07:15:04 +0000
Message-ID: <991ee40d-ae69-44e5-a8b4-6d4a12453a2c@intel.com>
Date: Wed, 16 Sep 2026 09:14:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] gitlab-ci: Fix computing sum for debian image
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Ryszard Knop <ryszard.knop@intel.com>
References: <20260915125123.228545-1-kamil.konieczny@linux.intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260915125123.228545-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0026.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::31) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: d899a8d1-4772-4daf-d1cb-08df13c23ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|10067099003|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: MF3ysA/6dHJNV0memJmFxXWQHpHvJ3lpCiCQnQx7YZY8YVdSl62u8s7PahVYiTEwL+Nse7vGn016ZUfSuAhuud7AWQyo74H42D1aJWlgBQMHzkj9cG/ZPQtnm22BSSw5YSbkDZg+u+5dthz0H89UE+GX6tINgiPT6zau3Z1rOBdIQe9+WIS5OHB7mrHmF1f9r+DYscQdoGBupeQV1cEW2gKUTQ84Db8IJJ6aaZBu7C2EXTF91iOOaXkiVRZx09acjFb9m3RbrBggBXfsm04u0s4L/Qg2PgEwpvjri9zn0bPu2SZYmb3XCnGIVAYvOu8IhDQ2PDxHIe8quD3YH0zjRchPRUsKcr7sxmyTMmWQQPxeSpuy+Hw0rZi2fvrPbHWXPlYzBE3U1GG+g9mGk8jbN6eosLJxAKVDtSQ7BuyPesDBMQsAv1XgyEYNgJnhXzkr/kBdYw+iBBLlT8dZ2v5lIJN+pZRDHSgdzSkWb73NtByaid/RSmxQVfNUf3HbaXXJ2PbQx78JTJjQWak+NU1IMx2lqQDfUl/dIqYcaUScxsyu3GyJfRU846pBvmYRd5DJ0jE5frTDpSvKacVcOznrQ3BNVo++OoBlUeulMlyh2ZYnd7K0n3dicYjK3uDSEEPD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVYxQWE1RnIwcWozZ015YTBibXRTU2tjRHQ1NkN0cDAwaEoyN0hYSmx5QUhv?=
 =?utf-8?B?ZzArL0ZwVnJpTjNjL3drckcwWUlyaVRCZ2k2YjZzZ2N4ZGNJc0lueENLUVVy?=
 =?utf-8?B?K2IveGdvaXM3dUpDMWp2OGlRaUhzd3lsMDRielA3Y3haczFrcDdHdThJeDJT?=
 =?utf-8?B?UGEzUE5GUktNenhGbUw2aURYRkx4emxoZVRXRlJnZ1NWbTZqUXZ0V1dMV3kv?=
 =?utf-8?B?N0Uweld6T0Roc042dFpJa3B4T0w3cHlmV0xlS29NaHNVV0NvVVZBQXJ3bW4w?=
 =?utf-8?B?RjQvbkZTdUtuOWgva2w2UUR3cG1zdHFKQVFNSi9aditaY3NvYzJDb3FQeHZt?=
 =?utf-8?B?SnJ0VGdWdm5tYVR5enZEQ2lRVk1SZU0yMkh3bHJSVHhxS1gxUGRwV3IwOElM?=
 =?utf-8?B?dmdPZFlOZHArZFE0M2w2OG5EVHc4bDgvdktGd0ZDN0VQNjF6bTNMK1RIVURF?=
 =?utf-8?B?UHRJWXlFSGNDeXVBd3NvOUtqQzd1eEwwRFhjMlFobXcyYXJrOGFBTzhYdGpV?=
 =?utf-8?B?U1FWa0pKai9COEk5Y01sU1MxdGs3TlVMREhuaHptRnkvNlpqakZDbnhnUnRW?=
 =?utf-8?B?QWpwUXJlZ2t1VzlNdTlHZzJ0YmpvNmtoR0Yrbzg1QVQwMEF0elcyaFBvZXFW?=
 =?utf-8?B?RXdsZFQ4MklwWFJ5YUZrSG0yQ3pPeVVMVnFyQ3JqK2xzQlgrbi92bEhtRVoz?=
 =?utf-8?B?RkRDVW9VVDExMVY0WFRBbm1TOU5PWXNidzhUT09OUXJqWlh2ZGJwUThpUzJt?=
 =?utf-8?B?THZTVUkyU0NkZFZRNDJMWE5sZXFEcnZsYStGMDdnK0orRGFUcm9oaVFETTBa?=
 =?utf-8?B?Q2xsdzByMGdTWCtCTWNaaUF6SFdtSzFXMWptcmtvTldyNWxubTdsWTdKbVlK?=
 =?utf-8?B?UXJaRUFTVmtDZ2JFTGtUSndqdlBJajJiR1pUY0MzbVFUdlNrSlhFWTVDZ0RS?=
 =?utf-8?B?MkVnUldya3kwS2VmVnIxZnFLYnlRYTRGRERkYVpMMHJzQUZKSXV0WSs3eVFG?=
 =?utf-8?B?Y3lhNGd6NjJpSStLU3NtZE0waldvVlEzZDN4VC9nbnREK3lrMXdpS3B2VGUr?=
 =?utf-8?B?ZlFCY3pDS2c4TmZaaUhiRHJnTHhhYVRSeHlRMWdPeEpxbURWdTFjdHlaUW1R?=
 =?utf-8?B?MVVMMVFrMVA0S2VkNGF0cW1IcldodURzTXNzdmFlcGl5VHpJMUUreXViR1I3?=
 =?utf-8?B?aWtyM01nYStRUjZ1K1J5SzhsNU5pQUNmaDkwVmZSVm83OW9sT0t4aTJlNDNu?=
 =?utf-8?B?YUhxdG1XRStPa1pzczZwWkhneWduMGNBOGdDRGF1NUhId21hTzFPSzUwVmQ3?=
 =?utf-8?B?TG55bEtxV0lKOFNOOHl1YWNmeVQ3K25HVkZoVnlZcWFwTlpvSU00bWZKQ2FK?=
 =?utf-8?B?cGIwTHJxd1NDdTNiQ3lWSFBoMG5saDhQTEtSZ1l6WVFPaTNWMW1lUzNJMUpV?=
 =?utf-8?B?cGVRVTdxa3NJbUJRbG51Q0h4TkVSYVVmNDVrV1N5NW4wT2huL1hsY3BIRi9x?=
 =?utf-8?B?SEZsN0huVnNmUWpFU0hBbDZmMnpXMjJCOGZxNFl3T2FEKytLbW81SGs5TFpo?=
 =?utf-8?B?QS8rdUpVaHFyZmJVSzA3a1hPQlAvcWVuODVsMkVvQVVTVmQ1aGpDSGw0bmM1?=
 =?utf-8?B?dTh3VFJZT3NwUExyMEZ4MG9HemljNC9DeHVvMGdEbWoxT3dCeHg3eVhhK0ZG?=
 =?utf-8?B?elpXdXB2dkp2RlFHbzdTaVNaRmw0TUNuNkxsaGhJVkY0ek9RSzZOTFVXREkr?=
 =?utf-8?B?SHdmTXVHL0NyUGl3NHg0RUtLczBZY0V5STN3QmpPVTZ6N1VXbEhKUmM4ck5y?=
 =?utf-8?B?b2hjR2xVWEZ4d2NVQityRDFydzMxclkzYUgySkRUdmtXUnpUN2gycE9iK0hk?=
 =?utf-8?B?SEFIc0VqV28zaXp4aXBCRDBkMzVVUCs0YUpqUk0rZGNuN0tCOXAwSm40eW91?=
 =?utf-8?B?L1IwSUlteUpvTWZaTG1MYVFhaG0wckIzZHBjS0lMYjhZNWxMbVBDbkNxY1k4?=
 =?utf-8?B?ZFBYZ3lvWXlZeGIxSFNHdlBZQXQzNVpNdDVGZ0VXRUhpc0d3cHp3bHNkQnBw?=
 =?utf-8?B?a0tBWkd3UU5EY29zU1FwbGgwS1p6QlRRNTZQazd1M1lXQUZSeWx5QWc3VkZV?=
 =?utf-8?B?dFN4K3A2T2Y0MTFROFU5TlJEdk5qK2NPNzFmVFFvTThiZ0VoNi95TDFrWnlF?=
 =?utf-8?B?YjJhR0Z1d2wzTjJzQ2N6NlhvTjBjWUFDaHlHOEdaZmxlQVNMSEN4eitleHhl?=
 =?utf-8?B?WFhjZCtmRUhWVlRUWTBiZ250VUFCemJtUDJjNUV4eFVMV2k5aDZVbjNMb2w4?=
 =?utf-8?B?bElMMGNPb0pHMWJRNk5xZWNOVGhXcVV1bFNybk84NWVrTUprcytmdz09?=
X-Exchange-RoutingPolicyChecked: SOe9P3l8dgS4y8bD2sP4X0U9afRuGbynGdi3N1ik4GDO/ecAne/f4ZNIl64G9LtH6REBFd9TtHVBBhiDuOuw8E0eMcGKc5VxOZhrr66ZQu3wnIX7Snv2qclq5/4xN+CaoGBuW+Gt/FG7G4HPm40Z1tzr2wCWBp3NP1Hqg9K64gzv0tHUNDmrZqRP9qjJt4Uh708zumw+u7rYPJoWQF8zIt2RlaoBkkFyECO8rr6pf99o6lg9Uz7Fwv3YSLEq7wXcYaxO95kOgj9OcJOEsqxoWNZUu3MhnO9NOUyesIey8owS8fMpQks3XkHTOoIMlme0ug/RZFXFs5gVeqKvHBr6Gg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d899a8d1-4772-4daf-d1cb-08df13c23ad8
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 07:15:04.4362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlEol4AzO6Bv2Xx9+gt4Mio5jmKqqqMkuYv4upKpBd2E8GVa6iuY05IAxdT9uZdWadh64it7vz9dLs9gXlF6Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
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

W dniu 15.09.2026 o 14:51, Kamil Konieczny pisze:
> Debian container has a dependency on minimal image, so it should
> also contribute to sum calculations.  It could make building fail
> when minimal image contain new building requirement, so fix it
> and calculate sum from both dockerfiles, base and minimal.
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/201
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   .gitlab-ci/pull-or-rebuild.sh | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci/pull-or-rebuild.sh b/.gitlab-ci/pull-or-rebuild.sh
> index aa1bddcde..fd68ef1a9 100755
> --- a/.gitlab-ci/pull-or-rebuild.sh
> +++ b/.gitlab-ci/pull-or-rebuild.sh
> @@ -28,7 +28,12 @@ REF=${4:-${CI_COMMIT_REF_NAME:-latest}}
>   
>   REF=$(echo $REF | tr / - )
>   IMAGENAME=$CI_REGISTRY/$CI_PROJECT_PATH/$NAME
> -DOCKERFILE_CHECKSUM=$(sha1sum $DOCKERFILE | cut -d ' ' -f1)
> +if [ -f ${DOCKERFILE}-minimal ]; then
> +	DOCKERFILE_MINIMAL=${DOCKERFILE}-minimal
> +else
> +	DOCKERFILE_MINIMAL=
> +fi
> +DOCKERFILE_CHECKSUM=$(cat ${DOCKERFILE} ${DOCKERFILE_MINIMAL} | sha1sum - | cut -d ' ' -f1)

As I understand minimal image is optional? - lack of it does not mean 
there is error. If yes then it looks OK.


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   
>   REFNAME=$IMAGENAME:$REF
>   DOCKERNAME=$IMAGENAME:dockerfile-$DOCKERFILE_CHECKSUM

