Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B7CC44529
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 06:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876EB10E1F7;
	Tue, 21 Jul 2026 06:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAhhiItW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1811810E1F7
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 05:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784613582; x=1816149582;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U/3v6n6X4P6qAYoRTuJ0BZVQ6piME8jgOi0Y3l+T04M=;
 b=GAhhiItW6wCJ/WNhnzwDgzsEYAP4w5PDfmCRDSLlD/baqcjO5ch3TAgY
 Rjk6vXV6llmlkBS7LDkpzN7swMHkGSxwqGgwrQFKhelnET4NceGRZduCm
 jR01hhlow1kXtpWSLaJzpMHJP9X2h5/rEbfIldXQc86eU42qgHCWW8YCg
 DLrsu6Icppy/fdRG9EKBD/Rb5ue73jIu7oLKKQr9l9WwWcwFw/dehR3UB
 TwQhunoHhLDZZRx7zHXrFkhLo35KGlpwqTp3tgOFTF2S4fESkBjkQk5nJ
 OrpkBAHHm1MQ/UhmE3Uh6or9jRbsRunPgiqtaemrHdWUepHTSmPnPp/Wy g==;
X-CSE-ConnectionGUID: R2O3xhPNTjuFOOelh53/Vw==
X-CSE-MsgGUID: 94faQzcNSXCAg3yUOhiMLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85058176"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="85058176"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 22:59:41 -0700
X-CSE-ConnectionGUID: r+ICfMHGQ+6avMRSYq6fuQ==
X-CSE-MsgGUID: xDR9ZNdDQp6KpPCE3q5uvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="251335658"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 22:59:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 22:59:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 22:59:40 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 22:59:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtdALd1crqi+mMZ8n0r6iCr1WKIVtCCM/I6tn8+SwaCgow76yzLXykfknfEMulRzLjKxVDP+gx0cJEm5K8kEEUtT1KRXnJWKLMzxQLz9Hnyb7eAkwN77kpmcSwN+KcLqynQDDFy/qZKCj2LXizlkzM0vQ3WAtNPiGlHqW3hfCbKu7/k8NGGqsyv8jF6kg7LB29VDr7x8XQGWvHMk7E4vCMuuZTuTiggPS8ThMBQS37FCgiNVmllmdkI6ZWd5saAC5negyClOB8WO+2PeB5ao8xTbwr1WsEZ6iftAXU4QxNKn1ij3FKst2/1Bw+nxch2mvvezlldj1DtfrYvhI21JDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbxrmKGvUYT6JTiO3ZXpoIpUi44OnlQ0B6CMsTv5XHc=;
 b=zP9d2eQtNcWzA4pUd8E6X8IKV8dWvSPtflqXkPoiFPjvXbDuO9zEOzMrAbqfe9v/biGVX5Fvu10Rm1IWJMNMgAysNrVGwfMBD2qPIQIjVxXhO8ND1rEBWtY+iAovC45k//3jvBusUk9SgZVO1VLMNIUHsJmYCeDN8RpURoKoxY3+uMBFOAytWlQlEGGsvqDHUBuiYEGR6JgayAZq1zKCmvp3e6i33Sn0e+BGliVNttlb/2G335FK6Szb976e5l3TIoHI5DZtNKpQf83waGrIbHqESOrQx5iLCjopLzqC4rq+kDg3o7jJ4pqwYFNMjjJEtXAFMtZTqp2j636cDYxQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by DM4PR11MB6144.namprd11.prod.outlook.com (2603:10b6:8:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 05:59:38 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Tue, 21 Jul 2026
 05:59:38 +0000
Date: Tue, 21 Jul 2026 05:59:28 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 21/31] tools/intel_gpu_time: link with minimal
 sub-libraries
Message-ID: <pshenaq7zfed3ldq5lyq5fuzdexabxmrv6eua2n66p3kw7ozwm@zf2abuwp44ru>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <84f0f604c7d0a6ff2b3775329d9150acdacd6165.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <84f0f604c7d0a6ff2b3775329d9150acdacd6165.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0016.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::18) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|DM4PR11MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df9b674-44bf-4462-d94a-08dee6ed3f96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|4143699003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gS81dJDbVCSxdyWqegKQxgITbAejmBdBi6w3hoyIUuNgDn67cbpBRZ93r5IID9zvi65F6i6doFbbooUm4umu9lQTQoDAlmbDSJi7/jYipGC2LorNxTSGFlVpA1HRnwrJNtqgwZAyT5vOGZmECTu3Uy1a3UEnTSgxa/z4WMDO86fn9LJHIGYc8q3rhtplE9AmO7zwz96vw8NeZgPIjGH7uB86H5n8k5HGb6YPvL1oIb//piM/rOMWmpv+839Ju2A2rPqC+xS/Qb+EeD7/8cEP5sMe3tWmLBFJEB7RF+Z/QYwDv3SI6OTheJ9JBS/IDGsBr7vCrXfJM7goySFW7Byqi6BWwSPYN4Y9ev28p2c4LJ1u2lFGK+4k/Xpd2gzWOsZk5YSbfaFAcrE2mxc3JbOi+io9EQw1V7ZsgMoSa+rH/VMZi+fBPqW/v2jOS6qk+iW0J6wVMbNMUzUxOuDCJH9D/kBegp4Svhb2zYbHPW8Vtcja7iE2qIirUhbgxjfU1GMJFQciWKSVERjLgcqJA98PEb5/l7GwsuU6A5hMRQyggs87hdfbwuzfIROsgBukF04qbyqsTKyTFACoZyWjbzTAmHnL85a/pHLEs8/qBhOPfHOGqUP8PFqoJ+LOoISBp0Ty/Y6QngrWRT5k5k2cZcrlQLKivo7AejWMX0GtlVdJFBY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTlhdEtRbVZJT2oxak9UcEc0WFc3SVFWQ2RCYUZCdWFPNFY5R0VIZTArUjVY?=
 =?utf-8?B?dmRrbzliYnNRSDdoem1PaUY0NUhld09FYllJOUlFUjRnMG9KbGZGb29uZGVJ?=
 =?utf-8?B?djBybzVYaXJESFUyUkRYSTBVOGpOcjd1aDZMMkZXMWRETzRNYmtvU1VBOWdG?=
 =?utf-8?B?MjNOaXpIbU0xQXBFTzdaOVlpMzFjYTNFTk5BdHFCK3lxUVJhaGNaM0xwSVVD?=
 =?utf-8?B?QTBOL1RJWm1TeTlaOVBySmNYbWhTcjg3YWdwejFpNDNHMGtmNVRuZktSdllL?=
 =?utf-8?B?MVZGUVBVNlJGbjIxekhZRTNtVm4xSTRkR1ZISWRaWnN0VFBzSHcvZVBjenVP?=
 =?utf-8?B?WEx5Ky94YXZ6NWt4SVREMXlub3hNUHB6NmVFWnpxZmRlSHd0ZW5YK0JVL3NI?=
 =?utf-8?B?T1pNRkYxZjhma2FLMjhjdWY1Y3ZabnAxblZrTFQzQllZaTc3SEpHSHRlNG81?=
 =?utf-8?B?dmo4cnFRc0ZNSUZqSkhUaFhybGFnRlBEVERLajl4K2FqcjRCZ1JKWlM4U0Fs?=
 =?utf-8?B?NTk2cm1Ea0hVZkpkOVJIQ3FlODZJcWFPdlZ0ZmlidFBQWnVpRE15Q3VqVkx4?=
 =?utf-8?B?WDhnS3RoM1lodjBXSUFORnVEV0RZblp1aDlnem03eFNFb2k3QkRNNEtJd1Zt?=
 =?utf-8?B?dHhmSHc2MjU0S1hhdjRZZVVJOEhaQ1hzeHI0MWhNNEFQZEErbHBPZXNLYkhx?=
 =?utf-8?B?bm9YZkJma1NPaDhUZ0l3SnRpdmhCTStOcVo3YXRUY0k1NDJZMHJBVFplbEg3?=
 =?utf-8?B?d2RTTmdzUmMyWTZYZDQzbDI3OHB0RFZ0bXNwS3lqdGJ1a0dhM2dCeXlKbWpl?=
 =?utf-8?B?T3I4UmJPTm5BaGlESWVNZ3JLSkJza3QyaXdXMzRMaHplcXpzM1F3V2FsaEpR?=
 =?utf-8?B?d0NveHkyK0JwWU1VSGRZeHpzR2VoMHNOTWF5bCtyYXdrWnVWdG1jUFRDM2ZI?=
 =?utf-8?B?SDljblo4NE5BQkJiT3lWcENNcGM4dWZDcnlnZHFNVTNuc0hIdzRHdThKN1Vw?=
 =?utf-8?B?UUs5WDArM3poYzJkQzRXZXlkVWgwK29rRGtjdlY2eXowN2o4Vng5MHNmUit5?=
 =?utf-8?B?NDV4aGk5Z09jSjRIWklrQStkbVBrS0lqZmVzM3dqZFR4SmhYdzBrZDEyOVlX?=
 =?utf-8?B?Skp1RDQrY2d4OEMzSkRpeHExTUtqclF6QmhITjRvL2RkT2tRMk1ickVKV0lG?=
 =?utf-8?B?elpVS3NnVDhuMEtPY2U1SlFrTWhncDhGNEdSTEoxc3hkUm14WWFCR3dGYm1T?=
 =?utf-8?B?Q2FBYUs5NEg4bFNSOHdSWUlGNUR5WnNuY3dJNGp6YmNLbUJuZ29mSjEyT3Y0?=
 =?utf-8?B?VGdNbGUxZDdpQXg4anhjaTNHMzRoc3lQaXBXVUpXWEo4cjhuTmpqaW5sRWhC?=
 =?utf-8?B?a2hvZWdpclB4elpIMHh1N0ZhSU5Sa0w3aThhWUQ0VkRoQXNQaDJqSHZ0SHdF?=
 =?utf-8?B?VTIrYnRjMysxdWx5eC9jamU3alZwZTQyNG1LT1poZWdVQlN5NzA0K2luTkZm?=
 =?utf-8?B?ckUvT2dEb3BwNnhheVBBQUFodk10d0Z0N1BGN3UxNHJKblJqRmMxbGhoTlRj?=
 =?utf-8?B?R0lYbS8xTWhlSTVFRWxkRHRhNjJsSlp1Y0dlK09uZGhxQ0w5UXVjT1FYVXls?=
 =?utf-8?B?aTBvdmt5UFUzTTY2MUoyS0gyYmZ6elZ6aXM4dTdnRklDc0xyWnUxYk9xeVRY?=
 =?utf-8?B?UkV6Z1I1Q1JrOGRqa1o0MFFkT1Yrcm8vNDV6M1N4a21pU1p3ajVZdHJGT3JZ?=
 =?utf-8?B?c0NqTjJUWTVDT1RwcjhXMmZsc05ua1cycm1BMi9wMUJBTlVDVUJMV3hTeVhN?=
 =?utf-8?B?L1dxQ1dWN29hRnNBbW1jOWlOTGthcmFGYlNlNHBQUjRnZHBBaGJ1R2o3OWhs?=
 =?utf-8?B?S3luUlkrN3MvVWpxS2xsZEUvT2JJdmRWSE9uSWtiS1crQkpNc0pVSy81R0oz?=
 =?utf-8?B?elBsODJNSHZoUVh2eWNmeC9SMzZhblJJZTRDSWh5UGl0MUFremRnbnRrUDIy?=
 =?utf-8?B?SGdHV1h4UVp2T05kZ1JXbE4rdVV5U0VSM2czZUlEdmZmMkdkbXNoKzNxeEdE?=
 =?utf-8?B?aGlBZnlubk9DRGxmU3FtWVIxOG1KYjlTdG9HbE9STnlFSUlGdEVpa010NUw2?=
 =?utf-8?B?RXRMTlJJRXpYQ3d6R05rc05obFNqZ2ZDMlhtM0U3UjIyWUcyMFR1RnR3Y3R2?=
 =?utf-8?B?VFg1K3RLWTFEamcxQTdGaEExdXZQZUVjSDU5eTNKSzFibHlkZzZJb2dRTlQ4?=
 =?utf-8?B?M1RuQzZuZHd3d09OOTZFcm14c1pvSS9RSE95dE80Q291QmJQTXN2cm1CTjlx?=
 =?utf-8?B?ODlXbXJKbXlyMG1OSEgxaHJiOVJxbkdob1ZFK1RmazRGcVFjMXZjUTFTVDh3?=
 =?utf-8?Q?sY087YIPwMdzmQXI=3D?=
X-Exchange-RoutingPolicyChecked: rnAfXGR0cYyoqWj//1S2Ieer/GOTwxHnEgd01JYvK06oUvg2ALX0iv4KoSaqpTkq1aOc5CeNZEVu46nrjFlqs4z8oZW9+yXR1LTn6kKmUMbQt7/kQKWXBfJwkdcv1RHeCjIsXXayeHdugEi50zIhi3ozUqdKs0ytdJ56k3UNeYuFIqEHr9Zm3GBpK8LSWaFhRcyZRE30r7YWMpXPix7mtIl2pKXCUjv0wnyoKb4mpX6xfFxY46JWPVQPcRrvpGMU1RnCgxUvoOstjScjYEKmm3k2itsNM2ekESILbx7yIGpKfG0R2yiWSFh/J9aZlQJRQHaLztGGek2nEGQ74XXMRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df9b674-44bf-4462-d94a-08dee6ed3f96
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 05:59:38.3911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00j9HYudQx7cg8iZH4w0XkGUGv2poNzMvppOlaD0j17H0l4EMl8bk3DfbVnSji00JKRMaNza7OioCkYE4yBSBa42hoaJ6K15Jm6l+F6XffM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6144
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

Hi Sebastian,

On 2026-07-15 at 14:15:31 +0200, Sebastian Brzezinka wrote:
> intel_gpu_time only needs the register/MMIO helper subset, not the full
> libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5   (ldd | wc -l)
It just dawned on me today that these stats might not be worth
putting in the commit message body. From the perspective of
someone reading your patch in the future, from git log, I think
this data is not significant. Would you mind putting these in
the comment secion after "---" if you'd prepare another version
of this patch series?
I already gave you r-bs on many patches in this series and will
continue to do so, as I think it would be unfair at this point
to revoke them.

> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 0978f8f11..2e8ceea36 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -21,7 +21,6 @@ tools_progs = [
>  	'intel_display_poller',
>  	'intel_forcewaked',
>  	'intel_framebuffer_dump',
> -	'intel_gpu_time',
>  	'intel_guc_logger',
>  	'intel_hdcp',
>  	'intel_infoframes',
> @@ -100,6 +99,11 @@ executable('intel_lid', 'intel_lid.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_gpu_time', 'intel_gpu_time.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
