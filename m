Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8609BC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 20:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CF610F924;
	Fri,  3 Jul 2026 20:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ph3esLOo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EF710F924
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 20:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112129; x=1814648129;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XwJOaJ7jqP0WfNyq2G02G98CUhll3DNYGSILlu5wYLA=;
 b=Ph3esLOogF6khQyy9IG3VxDLf26h5H10xlYnqphsFgHzvoCF88WM2BYZ
 hilqBCOTmdPHhfbJqWwrYY3MaKleEpLSX8ddIWErDtukOo6bVoD7Jp6Xc
 xCZUXr/z6+jfHKRWufMCo6x3yLOyRNYi0wrREBlQDp9xPMqMqJHKsC6nw
 Jh+cKfgfDnmAyXAXrx7T0nFKSAmnlwMD/6xHhIBX4aVhdSnhyFLpJs622
 Ebl597boF4CPtjRZaW274c76gGIpAlOywoLR8qFOrrCoORrLXKyAZ3Md6
 t9eDEDfIaAMZwB0fgQ5er/brjFGlR+O7kjteRhIVw+fqJLko1/hIqIjs0 Q==;
X-CSE-ConnectionGUID: cjEDrNWoQPCNgjyNgXRX1Q==
X-CSE-MsgGUID: H80FFHr9RkWTOxRhexaQ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83893924"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83893924"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:55:28 -0700
X-CSE-ConnectionGUID: nk+oG28iSTmmtsF1WodqgA==
X-CSE-MsgGUID: rZg3DXm1R0mSKdVsjO/wpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="252125249"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:55:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:55:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 13:55:27 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:55:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KB8O1yFh/mAM1yDX5O/FZ1GKwvVPRJhlF/HNZ47uDDgtQVHqkTj0LGo/Z0E9CyCXUtHtD074VsflT3JbwJxAnKpAR5RxrJjIHP67Vj+VZGaMwKVDmdACx1M//2hJrsTTA56Q4f1kIu6r+nb5ZgjQqnEj5Lv2SMFbe9hjU1XAJ7RxG8xUE78FRCG3vXOe12BZ8E6zC3E+jv/A4gxzDnLLh6PHYVmQBg6XxKkwrmRkwYiB8vemPRMEGGhhy1YsWOWLLeN92PyEhtnHBa8fAXvONZ94dYkr6o4WLldDn9L2HHxhaHVu0UBNnNsbAclrEpPYIUfHx2MfNB1g5xqwXEKlxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWezOpy+Ya5lpAwSRNo/0jBzuAGS6+OIA9Gsbwt2yQk=;
 b=rv5Hw4Hyab1pfhhRg1s5LUiGLV5kh6E7IoAKofyyMUKXkrxR5WIaRXRAJOGPCwli9bUNnoocNceLwGYewWlH3YwsJwXgGCw9HdF5lTFAX1S6XZVAxsbqAvE39U3DBS1QVQP2FDEOXC0kM4DEbrgwG+0O1gc1htN7eRsrPlbACXtaUa59qkjfC0Nh/KyHfW1xzl+T+/mHnhBAhNBvcUKpOdcTM+KsaA9XHHYDpLrBY6UfAhFnX1uvfM7BpbtL+9wBWZynMKXBAv//pzq2bCyn8hFylI/IGevsYDwWcLCzlclOHH5MDCrzxpsUrE97brPcN0FKRCLQkbUCwRzXTvO1Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 20:55:24 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 20:55:24 +0000
Date: Fri, 3 Jul 2026 22:55:15 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v2 00/31] tools: remove unnecessary shared library
Message-ID: <szepo6g5enossqmt2b7piszdj4xjgfwqyyu7h3mxgrdkbssvrw@ryu72tf2idtt>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <cover.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0191.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::20) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH8PR11MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 898a6bb5-cf14-4a49-ecc7-08ded9456732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|23010399003|376014|18002099003|22082099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: QvyyJPQGVfItchJyeR31WLAfDEJKy+6DI/owRpLinpuwVz8ta/Nqlq3g44GORU3gLuP+BCJ1qgBqfQhaUGRJkQQ0yG7lQDDBFuoyXIkA2xdr4L4O/DIGDsa0lAtSrKSbtwFzEyJ2cU05zDGfmJPLQOqx91V+yPzhMnbgbNUN9bxlqUd3gte0Yd1XRCSdckxzB0LjNTfLve1bU6AowFI/6mriEwEL/aR5UsaZFXWh16LDwUNQQEHEvxyArDmP5f3K8OsjhcSvDAn1WxLmH4xeVSmFCl914VvCL4T36AWvZqAnAsN708z2SQwakFDubOaxWgaYPAHoJaxd/swURWY0SorwrZNLkIR3ECNnGLmhZufd8y56nugZ5Ll3H/M9C5PIFEjAWZWQYX8VbD5482PfTFekdigZkiz4RcYd8ityIdeb6Lp1wdivKLSAuLY41oMrkXy6BKchijT/iukMgoPnRuSZiUY1dRqutlmigXtzwuAGOVl6MFZUaKckgXoGYIQNf/oZDLAcClcFL8sTHTGljXSq7jzl5N+KyCYu7a4Zw/+3la/mm299mMfcgierFrx+C758b14zUee5Gu2GJqR412hwTl15i1lN6SZK4+zVxOBg9YzdGCJEZxPS5h8NOM+L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWZ0NytLV01wTktqdXBVbWtHbUxUOWxsQ0JIME0rMVk1Ukg1SUU5TzZ0cjZt?=
 =?utf-8?B?U21FRnk1U0FxLzBYekNKamhBeDFCYUpUYTQxT1VENFRDMjRicDNKcHpvTmZQ?=
 =?utf-8?B?RkhTVUlIZXczVFBUV3IxWFBUcGpKOExyZVlHZkYyRHBIUnVPVk5LWGx4NEJt?=
 =?utf-8?B?Q2FSMGYvclBmeGdzUThTR3I2OWdwaWo2MmxhODFrQ1o2RVVBNVJGZWFhaFAz?=
 =?utf-8?B?VFhXWnpvdTZWeUk5b3FjYTRIdnNocGl5cXNHNUJXWi81RFdmM0R3emNKSzlT?=
 =?utf-8?B?dzBhSTlPcUtYczFhSUpzMDZ2aDh3RS9aR294RHlLcWpXZk1qYVhBWmtzK2dX?=
 =?utf-8?B?OWpmYTFQRHRQb08xV3NtaEh0ajZSN2tIcFhzNnhKNEpJc1dkUFhCc0dBaHhN?=
 =?utf-8?B?UExpNkZLcXdWcUhHaUNnSE1TMVhSZmtPeU9hM1loUXVGcmxuZHFWZ0ZPbFdz?=
 =?utf-8?B?ZWVhVnE5bFdMYTZCTnZEREpwSTlGeVFnd0RJeXhEdjMxYmVWSGUyQ1haQitl?=
 =?utf-8?B?MWIveVdiWE5HajY4YWdJNmo0ejRwRXZIdzdPMndtd0lkL0N0UmZKQzdJb0RY?=
 =?utf-8?B?T2hSTUV1dXp0SHMyUnVkSStEOTQrdXpxaHUxR0ZWUUJBcFdGdVQydGYrRk1U?=
 =?utf-8?B?YmlXTm5GNk50WGJRcXZVRXFWc0xJK1FYVW56M2czYUQ4NmJBanZuVmgrU2hV?=
 =?utf-8?B?dWpaZTNoNUs0bUdHVjltUlFQMWdFOUtQSjVXK1IycmhpclhLSXFXK2tNQ041?=
 =?utf-8?B?UFVVZ0dYWS9SUzIwQXU3MFl4aWVGVkRmWm9sV1U3UmMzczBNSkRQMmxTVURX?=
 =?utf-8?B?TjVnRHIyOTBPTWswME9KRGxzWThLRGUvcndOODZvNm9zR24xUVhNK1NwNEx6?=
 =?utf-8?B?VUQybHkwMkVwTE12UzVoeEt5SWZGaWxIVTZ0VHoyYS9vV2NlYVRYYkYwdzlS?=
 =?utf-8?B?K01GV3M5V29icnBtNjFPTU9pOWF5UGFWbTc4dW1RRG1qQ1JwSmZibmp1ckdY?=
 =?utf-8?B?Rkxxb0NUWG5sL0d3T09oTTF0Q21mQkdzMXliQk5pM1VxNTh5MDV5MXl6dTVa?=
 =?utf-8?B?cTlEVFVkb2JPeWZmdjE4N2J2NjVnNVdiN0ZhWDVtWG1jMFphSGZYM1ZhNStL?=
 =?utf-8?B?MkMxNm1GSjdJdzdaWFM2VzFkSEcvY2NkdGpUWUNZUlNEY2o4Q2x4eHJOanhh?=
 =?utf-8?B?andobWd2cHV0RGVRTHZicnpGcDRETzRFeS82dTZ6cWF4YzV4S3JJaW5DNmdP?=
 =?utf-8?B?Z1RFbTVYTXRYeXJFY0x3N2RQVjlGcHIrV0xDQ1pMUTRwWXRRdUZSSkE0Tis5?=
 =?utf-8?B?bCtvbHJvL1RRYy9SKzZVMUZXejZIcmJwSFoxdFhrK2lodk9SOStTTGVYbFVv?=
 =?utf-8?B?RHo0MTlVNnhudkdqenNQWXk4aXhXcUxMRklpazFlWU8rZzcrYWtTcGhzUk1J?=
 =?utf-8?B?WlFoT21EQjdHRnlaUWUxQ2RrUzZWYWJzSUg5dEtYeW92ZHJIZHdLM1NyNjVK?=
 =?utf-8?B?aTBESEJQNmk0cVRWbnNlSXdienVlRVk2d3FpbUdpb1hpTGtGam80OU1RQVRI?=
 =?utf-8?B?QXdwYkgyRnQ4TXlUWTVZYmVrOW9BaFV4ZUR1bG45YkN3NkV1NjVxV1NUd0Vw?=
 =?utf-8?B?YnZlVEgrZVUwbHNab1R0cm1MMS83TFlhWkxOb2p2N2FlKy9FTGxGMHA4Sm8r?=
 =?utf-8?B?dXN5c05wZEJnRFArRy9xeTdIdEVkK1UxSTlQaFp4Zzd5SnhvNG85YWtJWkox?=
 =?utf-8?B?QXNvdnhJUFhFbEQ3MGpMZWk2SjFrWEs2MnVHMzhLZU5lNnk0Y0IxTjZpK0Mr?=
 =?utf-8?B?blRHaVBIR2xYMHZCaEdhak9TNDNqUXdrZ05xSi9mK09DaVhibUhCZHhoMVpm?=
 =?utf-8?B?WmVJMm9jQ2lTTDVGZ2FWR0txelUwR21mU3BEQ1p3WWlXMm1EdkQ2WGRNVCtN?=
 =?utf-8?B?bEtUTzVhMVNBWHIzazhnTk9WTm5YaEhtK25QN01jMjZzVUYyMkp4SkN3TC9B?=
 =?utf-8?B?NG5QdGxhSXJFd0ZxVHQ0c2ZoOXkzRm9acGMzWmIvTm1pOER1c2JPTXVjK2p0?=
 =?utf-8?B?TnE0Z1ZGSk85ZmJwQkg4Q3BxaHdjUDhyTlFidVRQTjR2TVZoTVVvQ0JCUk9Y?=
 =?utf-8?B?cThWamQ2UGRzbWVWd0lrNU9NM054eU1HQ1VISG85SDFUamNSRDZsakRLTURD?=
 =?utf-8?B?VnUwSkw0eGJrRitHYVlYbXRRSmErZVFkdEo4cjJvU1pCMmR3OTZMQ0pVaHFw?=
 =?utf-8?B?MndsajBZRjJBWjVBcUFES3VqT0FRVm0vb3V3YmMveThwVDhjTE9KcEJPVEJI?=
 =?utf-8?B?cHg0dHRSN0pqNmt2MEEwN2VPbnBnZE16QXoyTkFPMEhKMDE1Rm1vS0k3QlEx?=
 =?utf-8?Q?tUIIWg54IjiADRkim4/rRiCBBCkYkbUd26xIoJK5noYld?=
X-MS-Exchange-AntiSpam-MessageData-1: Igzm7fJiy/9w8T/jJYLMvLMiGbQ8VdNqF1U=
X-Exchange-RoutingPolicyChecked: ak4zM0W6Ip7SGOvJmc6Ha2VsD4dFyNkDzzV4qSAwji0D7GjPzzfnfioguYjCNyOKTH+QAnCAubGzbhBeP2InqwMMjCuwP1t6iS4bAAbPZW+76ZNUYntwwIc9b+aZ90kGOqNYe8+M9fbjvDVBdqxws+uWrIIi7ZwUMRSBB/45pcR9c8M5ST7a4dplSpOZsyFoP7WF6Xw8xRBCiQ+lQww7Zv8hEphVXl+BsYgI8UoXQO2VO3nUGzQL9gGkw7Dt2Z6b6fVAHN1zg96emWNxuGPQcIqmKGqY9poU01tlrVnbXrcRflEBqd7zFQlGTbO6O3jTpDh9dpyTDzkfVPxpuRS8GQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 898a6bb5-cf14-4a49-ecc7-08ded9456732
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 20:55:24.3041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKTxaaFbIKOcha54EpmKyVjejftYxZFg/Bp49lNzKSp5G0udeXZOCdI25VzO7/XFiOU8cyqffi1/XfsjkiTp6C8ZdnWtXG4Uaqm676C9mM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8107
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

On 2026-07-03 at 16:28:34 GMT, Sebastian Brzezinka wrote:
> This issue was raised by the community back in 2019: 
> https://bugs.freedesktop.org/show_bug.cgi?id=110249
> 
> Standalone tools linked libigt.so as a side effect, pulling in cairo,
> pixman and libX11 even without framebuffer use.
> 
> Following intel_gpu_top's approach, each tool now links only the static
> sub-libraries it needs. Five new ones are introduced:
> 
> lib_igt_tools_stub, lib_igt_drm_stub, lib_igt_halffloat,
> lib_i915_decode, lib_igt_reg_tools.
> 
> igt_load_igtrc() is moved to igt_device_scan.c so lsgpu can use
> lib_igt_device_scan without pulling in libigt.so.
> 
> All 20 tools: 35 shared libs -> 3-8.
> 
> Behavioural differences vs original binaries (no-hardware runs):
> 
> intel_backlight, intel_lid, intel_gpu_time, intel_audio_dump,
> intel_infoframes, intel_panel_fitter, intel_firmware_decode:
> assertion failure format: IGT CRITICAL block -> single-line message;
> exit code: 98 (IGT_EXIT_FAILURE) -> 1.
> 
> intel_gtt, intel_display_poller, intel_watermark:
> same as above; additionally print an extra "Test requirement passed:
> pci_dev" line on stderr (previously suppressed by IGT log layer).
> 
> intel_guc_logger:
> same exit code change (98->1); --help drops IGT framework options
> (--list-subtests, --run-subtest, --device, etc.) which had no effect
> on guc_logger since it opens debugfs directly, not via IGT device
> selection; --version, --debug, --hook also removed.
> Unknown option exit code: 79 (IGT_EXIT_INVALID) -> 1.
> 
> intel_gvtg_test:
> skip message: IGT skip block -> single-line; exit code unchanged (77).
> 

I'm halfway through reading your series, and I can't help but think that
this series is only remedying the real problem of building almost
everything in the lib/ folder as one big shared library. We're putting
literally everything in libigt.so, even though at the source level
everything is split nicely into .c and .h files. Correct me if I'm
understanding the build system wrong but it looks like we're already
even building static libraries for all the little files in lib/, and
linking them into libigt.so at the end.

I guess at this point this is a matter of a tradeoff, because all tests
depend on libigt.so; after splitting its contents into smaller shared
objects it would be almost a herculean task to isolate the correct
dependencies in all the tests. If it was done from the start it would be
very much feasible, because tests and its build files would be written
with that in mind, but you know, benefit of hindsight.

And then if the core libs would have been split more properly, this
series wouldn't be really needed - the tools would just include and link
what they need.

So this series is solving the problem very pragmatically in my opinion,
to my mind it should absolutely go in. However, I think we should assess
whether it's worth leaving at least a "TODO: modularize libigt.so"
somewhere, so it could be addressed at some point in the future.

Thanks
Krzysztof
