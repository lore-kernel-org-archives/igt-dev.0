Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75008C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 19:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DE410E179;
	Fri,  3 Jul 2026 19:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSiy9xY3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AE710F8A7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 19:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783106633; x=1814642633;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SX8fZKfkrrJmYfx7GopmzeLZ9B64ZSNI+h8uSnKV3Fk=;
 b=WSiy9xY39+vGZM2sTpOWTKZRbcjbeuNFVMF3i88DzsS0Nyrf16v/QuQF
 4IGwKYVSIg3A9s+ABpTtWPWQZsfPwkm8lHL+8/AJLss/EXvWZ53sRQ7Ea
 GWkvftEjk97Y39p3Q5t2o0z9BWeqX+zoT+JQXYLrvJp7t2IGPdwp/fEiv
 jhRHQLixAIX1T8qPAqJltK5m6TfFdqvr5CVweTdBGRN6zVbGqT65S7Fdb
 5/ZbsWz3JsqcVm3UWaX29hK8U6pa4Up/Nij9ks47KBDkUhozHIw1E3Sk9
 m2hl6lu3/chBEWiZlAwkAWYKGZo8hmvnuWyOK8hJRMsbxqES0dZvUkTzz A==;
X-CSE-ConnectionGUID: LhR5DHa2QPmqPOfM2TCYeg==
X-CSE-MsgGUID: 1jY8fnlSRYqgI06VWrL0ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="84048466"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="84048466"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 12:23:53 -0700
X-CSE-ConnectionGUID: 48V76RUcSwquEnOLnEnESw==
X-CSE-MsgGUID: WBsbaIwTSQayq/+Wat8DMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="246801585"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 12:23:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 12:23:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 12:23:52 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 12:23:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xG5teFmSJUGiOy5XSB5aQEmhA35A9K5Ph3T8vRRjbzGFBCe/yzWDwVAiAt2oTH1znWm2WHFgpsOhQH4zVJDOmPIAj4j7hrc0QYwX7T+bceZwwtY+apjtbYA90dklDHOXWJcq0nH5OFf2RSW3WcLiUzZacFPEwt+lvoc/TKkgsVodAiBgC5AMbGngLVAnE+GvK2ttdUz6yYP1eVWL6AJVrJTiThSFVXWxvxPQnB272zfjtcCeWKMT6O1JCuGDkhNdQHiTI/AuaIhNku/49kbmVvQyflcYJ00TXWSYp+4ZdTjUWsS+sJxcfmBRb4FW6ZRYhLr18bWYmg3Gm8H0OeMymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6hYJ0p5S0clohTUaUUNyfsHNtZCHtAyHsIYVXqsYYY=;
 b=TmAgd6RsZqGfc/kcoED6DcrPN+YbYv/LVlfPh2elzPCmgFy2VrJRmgioSxKORfN1bH6UHG0MWhlIGzOtnUawHT/FJ445L+9so5XF+dsNDaU0iu0O1N+gMuRTJY2oMs3hNL36jcIB7A4T1w0GgqS81B0KV8tqry0Pe/9IxpFAMyO2AafiSsBHb6P5aqe/QggVy6lPKXkflJP/YPvZlvjs52XTEBFfCk+2BChW3d0/T21pS155xP2eMOOdPFrEvFBLFKF2ZKl+cFBEJgIgIWa9Jmehqdi8lYTOoEoBPem/0bi4YGNU/7Njp3364Rwrc5OugsHtN2D1XcKxG6moKk9Pcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 19:23:45 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 19:23:45 +0000
Date: Fri, 3 Jul 2026 21:23:39 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 03/31] tools/igt_stats: link with minimal
 sub-libraries
Message-ID: <6x6jy2t3o7jyeban6qtx6yc3pf7xok6wei4lopovwx4pk7jtdn@xagtngzfc5pi>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <2579fb0205052b87592c7f57cf50501595979eb9.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <2579fb0205052b87592c7f57cf50501595979eb9.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0272.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::12) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH0PR11MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c3cc66-dc07-4ecb-1a88-08ded93899c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|23010399003|1800799024|366016|11063799006|4143699003|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: URxgnvMwvu8zLIWUlZIrta/mkCQi5xdGjEA+/DBXnQCycJSdzPyeCGmgtdwd1e1NKapoMCl4sIrjnCb4bCK4hWqLk1ckB/ywrHRPVPBbGJzJ6WHW0ZuUOw0nbYfltZestcAoi+FTsxWmGpcyk/r+w5Zdk3njoR/TT2GNjQq4O3qFo+Om8rlzAP8dd8b/EebwiWAP4Qx6zH4Ir6ds/JJLsHGstJ5JVIDenQlf4VvMp82liOp9Px87Wn4YvC5HVq/d074GGEN+G4H5DE0r5yXc1OxLPugzgFv50X5y47XXu5N0MMyfy68grw1bZdsmGRP2wHKwEv9p01ab5+nPjBos/r+dq9Rxt/pbwvTXieMM5c6TFFAqkKJBqqWluhDvu5dVoO/mriKBlnpTHOHUbazf8BoMANXeIZaXfF3c1WZhjqJlqosy15xYtCGBeBVdeu6fBNR6YRjL5KdPMh12GgCqm//lht/j4f5ge+882xhnuehhx0BOC+iOQC1pI34nHr7vwsm2/qB1AwPRq1o+4pKhhxxzK8vZNGPXERfJPBm1F53uSnfU2vYd0joaSnul1Rnzk3PzlOUpjPSU5Fb4EECl+ceRkeJHVvCFmr5c/gaWXP9OeX5pvjhEhKG9Gly19m7sXxR6Iv0LOWnMSpyCFPQ6da0Fg5QLOQMwKKzut+/GRbM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(23010399003)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmVkNDNTQmhFa1Mrdk95L2txT0krZHdNdDRVZTFSNDNyVFFyUStsaGJRSTlt?=
 =?utf-8?B?SVJmbElOSlk3MEN4WmZMOUoyaXpFeXZjM1BXcmJPaWNta3hvZEc3VHFLSUMv?=
 =?utf-8?B?U0JjQ1VWSktZQitPd0M2WjdEdEZsYXIrcjJsSDZETUpPK240c25oR1JvdVdw?=
 =?utf-8?B?UmFhRjFtV0hpcHkzV28yQUVBNnY2OWJOMkl1QjI0RmhaTHdJUGVUa1F4UEtW?=
 =?utf-8?B?Yk85eGpFWkhtckc5djRDRkRidWttb1ZvVzU4aU94VUVOVFIzL1g0WGx5UXpJ?=
 =?utf-8?B?Yi9aajJiUndVbmdXaDdTQUY1NUl6bXk1Z3RucFJ4ZGJwaFdadjV3NTBlT01h?=
 =?utf-8?B?cG9UcnAwbHpaWDh0TG9rcndudFg2KytTNzJnRGpzOG9ScHVsc25SaUlqQ1hy?=
 =?utf-8?B?WGRnWUNSeURhNXlGeVhqTHRNRm9pOXZRYXBzY1p1cHlNaUk5TjBwMFg0UWk3?=
 =?utf-8?B?RXQwWXlDczIvemZXcXNxSzhDcUxmandCT1R1L0o4SzZ2L2hrWUR5cnBHMWVn?=
 =?utf-8?B?ZlpuRzlrUHdHRGFXSWorL1JaOXZLQ2pJNVQweWQ3SGFQTU85UUQ1aU44cG8x?=
 =?utf-8?B?bXI0VXBwUGVWb1ltUWVpTjFJUjI2K0hJczR6aWxPK2xZdWZzaGcvZEJocEJI?=
 =?utf-8?B?a0N0elVXZXNlS0hybm5BN0NOTklzZjMwREJpWHJ6TURPOG9XUmZENFozKzYv?=
 =?utf-8?B?QVRzekRZOTNGbVZBN2x5emZmSWNiWTMzR0RwM1Q3MHJKdENCWU5EZjk3bysz?=
 =?utf-8?B?TVhqWmc4Z3FyVlM1Z3I5cUhUT3FmenE0ZEpiUXpjWGpYUFhFOEM3d1dWWG5X?=
 =?utf-8?B?NFdZUDV4N3NpUmgxSkxVbjF5NSttTll1MVJGMC9FMHppK3VQWEJGSzRQSkVn?=
 =?utf-8?B?OTl3S3hNbFgweURpeTVOTE1zSk5paE9JSXBxd0ZoQ2VST1ZZd0RzLzE0ZkQx?=
 =?utf-8?B?dWV5aE5pLzVtTC9NeTBUa0ptbGNSK3Jva2p0OWl2Uy9Mbi9PaUMrWWUwZUZ3?=
 =?utf-8?B?cUVQNXl5MlNBZzNZcEpjbGRuSGM1ZjlHM2wrcXk5aTJSUXh0U2lWT0RzTzIw?=
 =?utf-8?B?My9yUTdOa0pnbEFQc2NadDYyU3RHS2Z4anZLN2RpNUN3dUo2NjhtT2MwK1cv?=
 =?utf-8?B?VmhVMWFHT05XOURoU0pyeWlsMjhGcWd6SUhlbUExbXhGeC8wUDN6K3VTaVBq?=
 =?utf-8?B?QnNCZ3JDalRZM0Y5bVN2aWpDSHRzNWZpMkkyOWdSSzJheC9rNVgvanQ3cUpi?=
 =?utf-8?B?V29jQUhmWFphUy9saVc3S0hMdFNJaGt4RlpUdGg4WUNvdmV3UTR0M2o0clBz?=
 =?utf-8?B?aXd4Si9RY0hUa29xVzkyRFlJSVRwMjF4bmxpYkFjRzJoWDFvMmFnMjFQVHZL?=
 =?utf-8?B?NjZDaWhkaExrYzBSUXFEZDFyc0UxeGY4dk1KREdWTGRCV2RJM056b1lDamps?=
 =?utf-8?B?VExsbVZHVXBENWhBaTZIZFpWN0pjYTVjVXA5dk9jSWNGdVBjVzJaeThHUjMx?=
 =?utf-8?B?RWk1Zm9HUVljVXNwMWxwblN0WjQvTjMrbUs2RWMvbjJCZnJKamJxdjV3WWRs?=
 =?utf-8?B?MFJJc1B3dTFQa2wwbjJxTUNFUmpDajFFckQvbGMvLzQzUStsTlE2VFhrSlJS?=
 =?utf-8?B?Q2VKNVRLOFhnOVpsVmJuVytZV1ZNRGVNVjZLZUZBSmJxWEFybkZEQTFmclNL?=
 =?utf-8?B?cHJIQmlwTE9tck9hV0FiR0paWGdnNVZXYnRDalBrZ0xrWVd5R3orMUxjVVFN?=
 =?utf-8?B?VFBuTm1PNmN5NWxMb2ZJT2dveDduMzVNMjIyZi85WVhVa1JBcVgzVlE3bldN?=
 =?utf-8?B?RGRjYUxCRzZzY1pqSkZOa2hmUlRJK2RWV3VMcE1QR0wra2pQcllyN3ptOWtC?=
 =?utf-8?B?L09BY0hQTHhkUENVc1VTOWJVUkliR0Y5SzdQdklyZDE0Um40V3J5bFpZUHBT?=
 =?utf-8?B?QXZ4Ti82Y3RhTWlMbmx1bnpJVm5nR2g1WWhaL01LczZnMU9SMEQzWnpNb0JZ?=
 =?utf-8?B?aGhjNTMzK1FIdUVXanViNEJrcnQ5SmUrdmlwa2xjSFdadHVWdHRkY0NhUkxH?=
 =?utf-8?B?VTJvMWZXcjA4ZUJNQWppU2JFcFpyd1llcnRiRVRzVE1UY1dQMno5emxMTVF0?=
 =?utf-8?B?NUZhODJSUHJSNy8zdkFsSE9obmlvTExnSldjaTlzaVZibzFodnNKVUZJbHdX?=
 =?utf-8?B?cFFPcEY0NmNqOVVhTmRXcXg2YVdycE5EN3lDeGduN3doK3ZiSnJ2bzJKdU0r?=
 =?utf-8?B?YUlrZDZ4eTE1c3JTc2hIVXNPREVMaXQrakUvOHBaNFZXRWh3T0k0UG9zNzVk?=
 =?utf-8?B?aitmUitmYnhkd21zQ0NFYzBSYkM1NHlpRm0yREtuTnJtK3RnNGt2dlVOdmVi?=
 =?utf-8?Q?qgAVmAptjboz1Emz8XG52oRYEH2qT9rM0jimeJDOOnQM+?=
X-MS-Exchange-AntiSpam-MessageData-1: GWCvqXcQnEs4/63ZWEB11HoHHFIxdpxHEEU=
X-Exchange-RoutingPolicyChecked: g+EjtuERkn+lz2BlO+YNwSVHuB2mFFGaVedH/DO53bu/4k7DnMmX87dwQSWB/gxo56HofGZXgh4OqIxg5DrdWrrqwQdqWUDIwU2+eQJJfQr7r5AX7bs9+Z5d+hbTkFTei57W72Q5TPlN/mH578OrfltxnNBp4DfUtFAdS/3zPt+eZJ6BrDnOB54W3V8hJ/nIMhYH+8ExP+I7v+Bve155iQN9YEuJPfkJenk4mwxXujjdp4k461oVxAJrm/bH2USGcs4C2XDUH+HTQfqhTE0MBARu9zHo8/M0uNoXHn2iAGpBjyt/qzm2pbACzJIRyz/JxTlejgy9QPEsju0mcFuX7A==
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c3cc66-dc07-4ecb-1a88-08ded93899c2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 19:23:45.5521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvAMYRENgecVCMHqPBQzcLTKdokzcvXRsLE9RYwURD72qg5jGeWgkqKeXouALIfU06DEWYDroDB2BrhZP58du1Fhs72m0oD+6foxfTZt2Ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5160
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

On 2026-07-03 at 16:28:37 GMT, Sebastian Brzezinka wrote:
> igt_stats only needs the statistics helpers and a small assert stub.
> Link it against lib_igt_stats and lib_igt_tools_stub instead of the
> full libigt.so stack.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   4  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 8185ba160..286a718c8 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -14,7 +14,6 @@ endforeach
>  tools_progs = [
>  	'igt_facts',
>  	'igt_power',
> -	'igt_stats',
>  	'intel_audio_dump',
>  	'intel_backlight',
>  	'intel_bios_dumper',
> @@ -58,6 +57,11 @@ foreach prog : tools_progs
>  		   install : true)
>  endforeach
>  
> +executable('igt_stats', 'igt_stats.c',
> +	   dependencies : [lib_igt_stats, lib_igt_tools_stub, math],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
