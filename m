Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481A6C5DF82
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 07:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E943510EF28;
	Thu, 20 Aug 2026 07:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeA6wpxU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EFC10EF28
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 07:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787210151; x=1818746151;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hbGFb/tOSeUs8CZzs6iXkFK7wncWtaVF3Of7BWDdjl4=;
 b=QeA6wpxUrejCy9pJQ0cGpH9ngguQDbYZ2o+1P2iHUKc+pSGJVF1zjvh6
 RPafu/NFAb/Cn42/vZxJYr7TV8hha9XIttkEo2M6UPpDsIzv7HjcE+ysS
 IGHhwOIeArDrNaXRM2VrbBEp3/9/IYYS508kZlO37LD9jUemgEod4jmiR
 UbhvUwI2xpk2V/iRh76REirlcXQV7bimnaG34YoojjZztn4Yc63hEGdcd
 RZn6FTy94HxtpI/4zaFurY5Iz89Eh93xythgYVSEyFdW/W6juVaoBJ63E
 PBwixk+j54EggTCk1xHA0AGTynFWC4Aso/xYeo9uLbSZDsJL3od/+fc1i A==;
X-CSE-ConnectionGUID: ckBU/zzpRomNNzzUdGEb+Q==
X-CSE-MsgGUID: J7k38gWYTHy8zT35LqJqcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86854287"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="86854287"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 00:15:51 -0700
X-CSE-ConnectionGUID: d5p/ZwWRRTqXjKUMceFQ6g==
X-CSE-MsgGUID: +2jQQSBOTvSYS7EPTC8PUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="289376463"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 00:15:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 00:15:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 00:15:50 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 00:15:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaynBeS/sNh1SZJa2t9e7acpu5HXIC+B3nIoBR8k6LzHW5UZNKmpRw2gcpZQQ2DpP/yLoRnVKE+GpvMb3Yx8DeDalDGueNMA7Iry6A/3MYKXeu91GeiL3pesdt2L98o2gHcdt2iC5TW4hWc8DC+k9/oiZgO026OOF3rDbV7QCsmOOUCSLE/yO99/xnFASwEFkN1pdAKWYNfIGH0aOkYKs57Sq1+3XJDIlHGrc4fHYxBt9auc8ZlROolXEwwGdYtFz11N1EXOXf178ucJXGANf277PoUA2EkN2Q3+bXxm9/9xwEz7O5v1M6VyFgjcT1q3HuJTEjvp0zD28vVVnEWaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qlmZYBc7rXAVXpKSclBTJGEnVYStZzN+KLJahW5WZc=;
 b=set+5fA8FkrICP743SOedoJHCaC7Gs5Elau5bBFTD806bUmuKRefGDbVSEO0KXvzL8jssq05ZpMxkXZYUNgs61nn3V+xoZVm2hFW+WHvqrdZhKSpXBgTWJnIzOYFeSzJbrbUA6OeEBZXoWcxukN9kmRX51jZ1w+BNZOAuc0zHEBRrj4acxIhYgczsmynz9pVEo7MzHvYRImE6soWwL4mN2wgwK36HQr7CEzievnbqDmts3dI3ZElUj+79LvBJ8DzkjXOEY0rwUfZKfzRbVOhEljUpRm6l2T0Vv0zuNs+QRgBQnnpcldI8FgvPyHKHtdbOHqVyUq1qqqhd5OlSLxAYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by DS6PR11MB178640.namprd11.prod.outlook.com (2603:10b6:8:4c7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:15:42 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 07:15:36 +0000
Date: Thu, 20 Aug 2026 07:15:23 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/gem_exec_params: add
 invalid-offset-multiple-buffers test
Message-ID: <gda37yz65qif5ugay37oko4xj57emhqznqaf2imil5k3z25w7y@hbpp5mhzkqs3>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260819152108.58688-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260819152108.58688-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: TLZP290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::15) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|DS6PR11MB178640:EE_
X-MS-Office365-Filtering-Correlation-Id: ccfc8e75-de62-4436-e02d-08defe8ad4bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JDunhwVCcLz1dlmZN6n9w07Fwmh8tuIe6sg5kqKTV4UHusuhwisZP1f6sTAdAMTVphfBj2RXjP5mxKY0p4SPurwjUWEUgVMWGbGjBqO/ihbU8e9rVXSwXQbcwruxtWNotIzqlJxHIOTQQiyeNgkW0zdhs899TG44AJd1Pw5rVP8EiiMC/FaV3oURi5k7uphej3wvFNporYUVZXqX9WKQ6t0Rd5nTrlhpAqV40OriC9IdYv0xrqOQutOQoOdTcxlgYJtrWOh2MzQ2PqUvvZ+W15DJzHS0gVWYRe7mgja+xgEtb6hUfIf55nPITZSZl0GARtOr4QmKdjJrrzY+XKodcfOoImdJbuMgoMTYjWkZDYBizTNzPprwjjPZeza050PKmjFhyNkMaBgl+3DSkKafAjckK7T3oko7MvriBpnmLvEr3KZm5w3+D2vu9KlHjlvK0Oks8dXOyQllCDyApdYu1Mt8xHw9czXnJ9l4FeZiLC9JFsNxfMPBa+LzrDggpuqGEW0XHqn1wPKcWTFXSGmYkb8uy+4ur3L635eI2wrLKGx5cYjpI/DQJKXT8f+f/qHL1u8/1eywgAcbqeluCw2IdP6mvoCngs+JUuD9Zwf5z9gfR/CnxV/FxGm6To5k6Il/3a9hP/nba98EkAfeLTObNAkNz6geFw5eAMWY43johgU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkVid0QyV1R4ZjNYNm9zNjlEVFpsaDFBYVZMK2grVThSdDhJRjFob1lXYk9k?=
 =?utf-8?B?Q3d1dDlrR3JWNVBWZzM3ZkVOM3h4cEdYMms0QXR0UWVsN1k0ak0rMEZybStJ?=
 =?utf-8?B?VElBVzdUS1VrWkthM0pRa3Zpa3diNm5ieUhNVThVR0I2ZHM3TERGWEVDY0NS?=
 =?utf-8?B?WHA3bm92YTJFRWNqTHJYMks2Sk1Dand2VTI2d1UyRWpSZVE5QU9YcW5wRHc0?=
 =?utf-8?B?YlVrRFF1NGE2cjRHdHdtaTd4Y0NJYTZGcTdvS0hJR0lHRXZBU2t3eHNZZnBO?=
 =?utf-8?B?TlJ4aTVDTFR1bUUwTStuSlpxSFQ3UHdtM3JRVEJmS1VSS2ZhMHBmY2o3WGlx?=
 =?utf-8?B?MVlnemNmbGhuOWc0N1VsYW05SUZhNHdiQmRNOGxjMXpUN1hxZGJzZ1B3ZTds?=
 =?utf-8?B?Y1ZoRDVPWmRNdUt0QkxMUEdYU2ZXV1ZYdVRZazJxT3pWS1E3NnJmMDJQV0gr?=
 =?utf-8?B?L3JqMlliODZiY3h1alVZd2VZbzVrODB5OGV5bTlFZUo1MC9QKzc5OWJVeTRR?=
 =?utf-8?B?OExEbVRnRGx3Q3lnZUl2bFk2enFhcktTTmJkNlZOSlFxQmtKbWgxTVpHWmhp?=
 =?utf-8?B?eEtNSjRLZ0xrNDBhVVlwam5WWWl0UjFTY2U1U0QyUFVLeEV0NjQ3eTJ1WWt2?=
 =?utf-8?B?ZXduVzFwMkEvODVkNHkzcHVrSDI0UGR3Z1dOSExlYjZSeXE3V1ExU3o1YlFQ?=
 =?utf-8?B?UXd4MGlET2F5dlVXbFVjNE5tMk1Pd2lnVFhvcWRreE1SMnF3TjcxVmYwVy93?=
 =?utf-8?B?dHVrTXFVbm9NQVg1NnpwTVE0VWFGUmNGOTZta2xGYTBmbU13L01HcGxPTjdm?=
 =?utf-8?B?TFQyK2hTVUxEZHVOWkQ5aFR6TDV0dVFxbXFsQ3hBYytEbUl4QStkN282SWpY?=
 =?utf-8?B?VTd5ZmkzZHFSM1RSTFpmdzMvdW1lZnVmand2NFpJVlp6bjRnbkMrN2xuOU55?=
 =?utf-8?B?aHVWWERCZGE5MjF3S3NqSkxqVUYxaWtyVFNTT2p1VU5GQjhvdzlVZW52SG9Y?=
 =?utf-8?B?dlIyZUtCNzRia3BDc0hQY0JaaWZDNlNPeGJoeWovUTVmc3lhU2tlN21Sbkp3?=
 =?utf-8?B?YjRXQTRJTzNjTkhOa1dHQTVCQmZCbllaNjIwVi9URUZQSS9aNFV2U1Y1RVFP?=
 =?utf-8?B?UU10YVRmL3VSR0dFVlVuRnN3OXQvR0dXaGVqbGtEcllFaXpsYTU4d3ArK1d5?=
 =?utf-8?B?ZW5UMlllTFpnRGFxN1dYWG5ySGRKL1BsVnpzZjFlVWx5N3RoNXFLSkp3ZjNU?=
 =?utf-8?B?elRsdjg3c1d2cU5JZ2hjV01xOVJobDN2Q0FIZFZLWmVtYVdJUktvWDVmOUE5?=
 =?utf-8?B?Mkc3c3BGeFNCcXR4U05yREp3RDRnMzlmM3FDdDNVdUFUaWxJODZ3eDFQV01K?=
 =?utf-8?B?ZnFPTFFxa25TeHdTNFZySzF1TnNNYXR2aGxwRTdMNHBUSDQvZ3Nhcjl6OUNr?=
 =?utf-8?B?V1YzTUNZcVo0MDZyVGswSkxnMGdqL282RzdDMVR6ZThyNlhMek1BenFiOG1F?=
 =?utf-8?B?U0VGWGpROEpmNGU3Tm5Oa2UzcGF0akhDNHd0WHk3Rm9FcEZ0Q2tEM0gvWkRi?=
 =?utf-8?B?dCtpMEhyeW5XeU5pQ3A3ekNUa2paeVJPOGJSZTJ1OVFwcnM0M1lqZFBnVUlT?=
 =?utf-8?B?TCtReVA3Qk92M1llV0w0UHFtZmJqM3Nvai9kSXROMCtUSG1KQTB3SXIyK2ph?=
 =?utf-8?B?L2U0UlF6TGZMYkdwRjUvVUFDN1N6cU1uSmFrYnc3MTFpNFEveitlNm50LzZL?=
 =?utf-8?B?NE9WaEVBa0MxUG1GNEpiY1pDSFR2NWFvSHEvUE9FaUJKeHBLajFMMzZhODZ0?=
 =?utf-8?B?eTgxdExBaWhhNDhlcUtTQ2xBZStiK2ptV0lxOE4wK3NEZ1FHeksxRkVUdXhE?=
 =?utf-8?B?aEVwSG9FS1p0R2NxMGxHVTNpODVFZk44NXh6U1BVVDF4Tkp0MTlDVjhHY2ds?=
 =?utf-8?B?RHhBZHFndEhWMTNTUU5NSHg1L0FPSWFVK2twQVlyMlllU0FON0FLS1lDOTJz?=
 =?utf-8?B?dVcwQW1pSDhmb0cvZVpQMHNYY05mdGFzYVhlaUEvS0dEbXhtN1BGaFhWZjZu?=
 =?utf-8?B?U2k3bmdaNnh0Ni9CenRwZUg5Yk9kSC83U3BIMEhldjRXeUw0QWM1OVlwMnRu?=
 =?utf-8?B?eGxzbXhOamF1MnRKUVJxZEx4SUZnaGxwc0grZFN3eHk3VlN6c3BvaC84VkJI?=
 =?utf-8?B?RHN3UzRZbldBaUtxVW1udkYycGxNT2UybmpiZWlkRDU4MVJFeVY2K2dLZCtB?=
 =?utf-8?B?RTRYSUpHaUErZ1pmeHVTbXhEOEJTWUloRnVFMzhkRnJIMERYWjRJTjh3Rkgz?=
 =?utf-8?B?Y01jVWFRQkZqSDZHaVMzUkdoUTZlL0JXNkFNeHVJWGJJbXcrbFRuZU1jUGU0?=
 =?utf-8?Q?KGM7SmDxNvmKSTys=3D?=
X-Exchange-RoutingPolicyChecked: JobHiBUnizEdh5IuG/XBJcgh/7WIRKGKsq8llrZ0Yi5RI6kJZp5SKqC05PRqSkDXkbmmOT7FlsF2IVa+dLrB78fl8V/C7Dj+gJme/FYNkcgM01zvn48o4LtQrRsw52xfwGPSEAOK4P93gOWTNtLPiORUuePCJ99T0BpwaBZ1ATd1/w2lna1vBDuOKWaL3LmjiIavj/l54o2wXe+4oNNp3O+xB+6ZPJW0LzkV5SmntGH/ZexEHuWsqv/jwiCb9Tnk4eAQB15KsNMp8R8gewcdzaZ3cti34bU2AwPy8dBvVqSijXNsL4KwV9FrjBbLw+0LnOHNvYiZkEocwiTeTygqiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfc8e75-de62-4436-e02d-08defe8ad4bc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:15:36.2901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHaIbYQdT7CaKzpU6joiIxJrLXb1sZ0zL9GofDYQJ26OAiE7GhZAZrDSm8/noHoXXM/K+tBfTPeboP/zEF/kZColsNN+UwcGlcv+uKNtfrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB178640
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

Hi Krzysztof,

On 2026-08-19 at 17:21:09 +0200, Krzysztof Niemiec wrote:
> Add coverage for the case where the batch start offset is invalid with
> multiple BOs submitted, which was buggy in the kernel until 4fe2bd195435
> ("drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffer")
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
> 
> v2:
>  - Reword comments to be more specific (Krzysztof K, Sebastian)
>  - Get rid of the context id parameter (previously set in rsvd2, which
>    should have been rsvd1) - which turns out isn't actually required to
>    trigger the correct error path (Sebastian)
>  - Capitalize sentences (Andi, off-list)
> 
>  tests/intel/gem_exec_params.c | 50 +++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
> index 3ba4c530b..c405190a0 100644
> --- a/tests/intel/gem_exec_params.c
> +++ b/tests/intel/gem_exec_params.c
> @@ -85,6 +85,8 @@
>   *
>   * SUBTEST: invalid-flag
>   *
> + * SUBTEST: invalid-offset-multiple-buffers
> + *
>   * SUBTEST: invalid-ring
>   *
>   * SUBTEST: invalid-ring2
> @@ -404,6 +406,51 @@ static void test_invalid_batch_start(int fd)
>  	gem_close(fd, exec.handle);
>  }
>  
> +/*
> + * This test is checking for a NULL deref in eb_release_vmas()
> + * (see 4fe2bd195435 for kernel fix), which happens when multiple buffers
> + * are submitted to the execbuf ioctl and some of them are invalid.
> + *
> + * The __gem_execbuf() call is always expected to fail with an -EINVAL,
> + * because the bug mentioned above is in the error path, which is
> + * deliberately triggered. Affected systems, however, will not handle it
> + * cleanly and will crash with a NULL deref.
> + */
> +
> +static void test_invalid_offset_multiple_buffers(int fd)
> +{
> +	struct drm_i915_gem_exec_object2 exec[2];
> +	struct drm_i915_gem_execbuffer2 execbuf;
> +	uint32_t size = 0x1000;
Why this particular size?

> +
> +	memset(exec, 0, sizeof(exec));
> +	memset(&execbuf, 0, sizeof(execbuf));
> +
> +	exec[0].handle = batch_create_size(fd, size);
> +	exec[1].handle = batch_create_size(fd, size);
> +
> +	/*
> +	 * To test 4fe2bd195435, we need multiple buffers submitted and
> +	 * eb_add_vma() to fail. eb_add_vma() checks whether
> +	 * batch_start_offset + batch_len is smaller than the vma size, and
> +	 * fails with -EINVAL if it isn't. Submitting two buffers and setting
> +	 * the offset to the size of the first batch will trigger this
> +	 * error path.
> +	 */
> +
> +	execbuf.buffers_ptr = to_user_pointer(exec);
> +	execbuf.buffer_count = 2;
> +	execbuf.batch_start_offset = size;
Would setting any large value as offset trigger the desired
error path? Is using "size" here significant?

> +
> +	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
> +
> +	gem_sync(fd, exec[0].handle);
> +	gem_sync(fd, exec[1].handle);
> +
> +	gem_close(fd, exec[0].handle);
> +	gem_close(fd, exec[1].handle);
> +}
> +
>  static void test_larger_than_life_batch(int fd)
>  {
>  	const struct intel_execution_engine2 *e;
> @@ -705,6 +752,9 @@ int igt_main()
>  	igt_subtest("larger-than-life-batch")
>  		test_larger_than_life_batch(fd);
>  
> +	igt_subtest("invalid-offset-multiple-buffers")
> +		test_invalid_offset_multiple_buffers(fd);
> +
>  #define DIRT(name) \
>  	igt_subtest(#name "-dirt") { \
>  		execbuf.flags = 0; \
> -- 
> 2.55.0
> 

-- 
Best Regards,
Krzysztof
