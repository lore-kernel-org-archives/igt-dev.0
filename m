Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A20C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 20:58:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F8810F926;
	Fri,  3 Jul 2026 20:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8BU5U3m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A97910F926
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 20:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112258; x=1814648258;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0tcPRy2FBP6dfxy4AIAcctwr+wkGhN4vR5A+yJZEskk=;
 b=N8BU5U3mu2omp2Z1/e/Pql7VINXWYNv0ISUbJoe8QCywLWdzgjAMpHLN
 Jvngj3zA4IUsUXyjWOfbO1KKaqX33rGousVLApUsfLM1J8q3vDDKSwzHB
 dJgX1LfV/IYPmfBfqyQFR7xGIF1kTJk6AXKQCi9QWnsVF5t24ZhMQahe+
 LKLXFc/k9aHLJX0YaAPico8OWC9XuCcQXzFXCsSrlIQHe0P9l0aTRFdog
 /2HCWyda/kuOIL2GFcCSVuCzXBb09BJelgaEMnD/nKyrE7BlQcnrcPYuf
 5BCy08iO4lrMY7OTIp8WJlMMRYQtQ9iDxaESF5DtBPM+bGB9FNC5G3Dag Q==;
X-CSE-ConnectionGUID: jRsicSRjTN6TlinZi3iB0w==
X-CSE-MsgGUID: rt6gCl8pRweEFoVb0UZtag==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83988727"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83988727"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:57:38 -0700
X-CSE-ConnectionGUID: 2t6grydsQ0eYITudX038xQ==
X-CSE-MsgGUID: JkD2wf2XTMaKaVY6aWK4Og==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:57:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:57:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 13:57:37 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:57:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CEUuuiRPoPpVOgEd3QmOp6mFhwJ6iyN8mPLfhv8qIKidzL5bFbALrs83M7SWN0tJGt2CAMGIo8+me4FRioJvC5HsD1ysesMCIT86EygP8/iEDCpKVvD/0bPa9OPuepSuzw67IfCtiwsJaq7zaBbHMvCnlZqNEdIROBPww7WKROxW6zDpxEZfGluBCyn9VDwMXfFRHBggYyEsI4s5h0zfx0sT76IYJZmbrAIukORIOtiJJs+IOg4gb+pbC2kgIp+SPNRPdRxob7Pj7zEGQsg/8xRkTuRUrmaqp9x40LoObuuVRQWk335BlQo1PPsys/gvmVthMEpgV2Ty/rk6gQ/NFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXVYtW7PecaSyc3U9INFhLUrb6GrLwFOm8cB8SBtp6A=;
 b=GssgWUzc1adb/kBuW6X8HMCGTy7bnhkaJJPnOM/dZOjKurBwdSu7v5otgIU+FlmIbAhzEUp+ar3yZQYVkOTU1yZWHh6m3tSZiUByQaYJlRGpgSHkqu/r9jTnGw/DDQzcf1mvfTgFY+lztAzyJQIMkLRE3XX8Al9prSbE3P0KWSeIq9ZssuTnqDC10d8fZnoG3FgKpXkA9XCP2wUD+EdwFRMMK1MdI8zh44oSi4rqRyqAW0ucjfiYq1wYNPIEcXtZKhp5F1EjmcWhwY0IhiF3zi0HX3VjmRthNNRFs+6YvCCWH0afxkLjTW9kTCmVrZ5Ev4MJemyURwMGSJiVDZcGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 20:57:34 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 20:57:34 +0000
Date: Fri, 3 Jul 2026 22:57:28 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 08/31] tools/intel_gpu_top: add explicit
 drm/tools-stub deps
Message-ID: <5a4dmgijaiq7zwfdccbc4lv4ouzv65jdwcbfg3ajcsbsm26uwm@pei4bt6w2abg>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <c44efcd7dbdf8a33605a3240922f3c1ccea1c38c.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <c44efcd7dbdf8a33605a3240922f3c1ccea1c38c.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU2PR04CA0061.eurprd04.prod.outlook.com
 (2603:10a6:10:232::6) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH8PR11MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d1f6ad5-20ed-4dfc-f1ea-08ded945b4b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|23010399003|376014|18002099003|22082099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: rVKbqMzM3zR6SCZTe5IJb9rtVkl/5UJbP06l9gzyyEE3r28Af42TLEhMHsWB/QRWp5YV6Q6ImOKZJqOI2x2J8S02/fuXiIAM5wj5XlJUzqsi5vtIBJn2D+aTzXo0u3E2duj1Qae81AIydBzzbELrQ3lFbbWFDrF4gRvoMjSTYaWY1TjTED6nHX5hV2uaWMMOvc3ROCnFZ8SgWhgLHLH+oSuy2ZCDCpYYSRQihpdFtzElvya9z0vxS5p3AEoB/FvjmFT8WdXPao9NKmvvN4tyvrt2zkFg97VMyjxz9IxPa1JwACLw9f0LGU4YVA0Vu6LYhfxs2z+lMOLF6FgM20A7V++pt9MdAgaud0Z49qWHbz6p25o7WPzC6PsPpVaaLE2Vyg6Ek324nQtluKTq3tkv5Ph4i2MKq7Qv8qAeb/syu9DIDaJpHSpmcNScRhKwAE1JT3qQeoZcgcv2rfmtxZekqe46iUrR7Etwo/yOp7f0XFdQmw/FAUArMvbFyvgzxFKIyNho9cYcLhfL0+E6TBXxSGEkW8lOHKx6VunNl9c7y/r+LT/SRZgmPKkTqNEydqlTPZtSBf/pDB4t91HVaGWa0j5SRmA94im5Gdfqxh9izpnLW/6mY6dVT018HW9eLu1m3YZuUn/59KIb7eV0leWvG8LOCQc3EkbudEGxfmgA7DY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkpzeithYzVVOFl4WFVWZUYvNitBTThpcmJOZ0FnZlRQZmhlTElLK0V2RFdZ?=
 =?utf-8?B?MU9Db0pGbk1vZkszRXJYd053am4xOExYZHFsREwwUWJCL1E4djdqZHI5eDE1?=
 =?utf-8?B?bXlIN0srZEMyUFZQSmZiQ2RPTWtYdExYMHRpNHZ1ZVR2Z3VscUl1Ri9EQ2VC?=
 =?utf-8?B?bWlnZ0poblRCcXV0L0xNZ1p0OXJuS0h3Sms5bHdlemlHdFBpaDV2bDNpVkdY?=
 =?utf-8?B?blNHNlo5b0s4VUp0cThpdDBVeXZpZVlFS2t3djFGYkdSVEVoL2xrdytJY083?=
 =?utf-8?B?NHBGaHhpVmNWeTA5YVJ4RFByeUlCSWdQZXp6cVc0bGVCVSsxS2dITWw4Rjg3?=
 =?utf-8?B?bkxYazVzRnRPaDJKRlNFYjQvd2NoWVVqVlhScEd0K0lRT0VIcllOTXNHL0R2?=
 =?utf-8?B?UE1yejhLdXk2WGpLNFZXUDZKbGR0aVI4NnhvaGtMUCs0dmxKYW8zRU1oeTZy?=
 =?utf-8?B?WHFxS2pHVGxuZ1FSYW1zaEtKZlBxenRxNmZCc2p3Y3FBYUJhWVpWWkozTzdm?=
 =?utf-8?B?SjNpcDhreTRaQUhZSVppWTl2YmxqdWdtV3VzaS8rdnNZdkY4bVMwS1ZuaC9O?=
 =?utf-8?B?Qkc1RlZYOTVkZEd0dG03SFp0WDdYZHVWNUpTdTREMGFDRXJra1ZJL1lCeUV5?=
 =?utf-8?B?M3gzKzg2VHU1Y0pHTStxYVprSU8xZFR3Q0srVVo0WkFmNERmb0I3VTVrN1U5?=
 =?utf-8?B?RFA4S3MwMzBDOWVKZ2J0WTVKMVVDdEs5NEpnYWlQc0FKeEdvQXZmWk1LTnJX?=
 =?utf-8?B?ckFYNnhLR3U1UnhTd0VoblRkeVNjV0hJeWhwUnZTMTBDeEpWSTEzRmlmZDNq?=
 =?utf-8?B?cDdMRzlyY2VWYzgvS1RnK2c2VVBDU2NQLzcwdVl5S25mb2tKZURRRVUyVXg0?=
 =?utf-8?B?RXFBMzdzajdBT2FqRldhY1ZrV2F1cUIxOGRhSy9ubFBJK3VCOTZheTFLZVhp?=
 =?utf-8?B?WW1NekhFY0kxdG9BV0xubkR3VXhkVWc1dGxlSTNyLy9aaEdVcnMyTVFvL1Za?=
 =?utf-8?B?emp4RExkU21vZzVDOVZYK29HeHcxdWFnREZQL2NUKy9lVnAxZk00eUZ4eldQ?=
 =?utf-8?B?b1owV0lDYjUyajN4UmR6OTdDR1V4eVh0VmxudmVFVElMblo3RjRnNU1WcUcr?=
 =?utf-8?B?N3JJMUtzUUkyd0pFMjAxemw4di9IU0lQbUpVb0JHOU1JVm1xRU15UnhzQU5k?=
 =?utf-8?B?TW45SC8xTE4yakFoc29wNDdjaG1GQ2IzNFdzdmQvMnRrYXlqUldMaWcwMzQ5?=
 =?utf-8?B?M0Q3b0lkdEpENk1XVnE1ZFVMOXpveHZsQm92SnV6bXVlYTZSN3huK2oxTWQ5?=
 =?utf-8?B?MEZqUjBhWWRsTEpDV08wTVpjZjVIais0TDloUWtTZUwxdysrL3JtQlJFY2hZ?=
 =?utf-8?B?SEp3NUorV1UwWDFZUnl5TFpWUldyQU5uRkRYSVpySEkxbndnMVBwWUNqWTdH?=
 =?utf-8?B?c1hWRzVIUVgzT0JRV3I2OW1wRWtPZ25NTkxMeGlVSDIvWUVnNzQ3amFSLzFX?=
 =?utf-8?B?ckRXQm4xREE5ekd0K0dUVldjS2dEYWpwbWwxdXFQWHlXa1dtTnc5UWFmRDRS?=
 =?utf-8?B?cUEwT1YxdEdpc2tIanJhcEJnNjVwaHRlQWczRHFzUXlxKzR5azRwR2I2SDM1?=
 =?utf-8?B?RWMvYUdCcmVIUlRaU3N1dHM5MG1NSnV2UmNVKzY5OGpwMzVQUTR6QVZWZEhM?=
 =?utf-8?B?VU5xWHowM1FIVlFudzVQU0tqK3RZK0FXd0tLb01tazZUQXFTSGdJeTIvM2hj?=
 =?utf-8?B?TVZDR29jTVUvWlJJK3RKZ2ZiWHhHS2dMS25SV2lNK3VJU3FUQ2ltVWJiSVpj?=
 =?utf-8?B?OGF5eDhxZlZsenhoY0ZqU2wzcXJFMUZuaEZXc3IzUng3K1BxbUVkb0hIWS9w?=
 =?utf-8?B?dnpkcnRnRE1hWHJYNmtZUllyNHB2T1pGTitqR0xhRGkrRTI3Z1FYMEJnbFRW?=
 =?utf-8?B?VW05ZlhoUW1hN2VJcHhLSlFobmhFQlRHck9VRE0zNVVZbFNFRG1SYnBLMUh4?=
 =?utf-8?B?TFJVK0t5WFE5V205RGxFb1FvSWxSN1hyWDEwWnNCU1A1UjVja1NrWE9Qb2Qv?=
 =?utf-8?B?Zk12WmlkYzE4L0hXQWFYSUFnWnE0UC9HMU1SR2wxanVxNjh6K3dyTVhqR3ph?=
 =?utf-8?B?ZG83QVlRbUtFaWJNVzRJdjZrc1QvK1BvTkVuRCtnanVaMCszc2FWTW5sd08w?=
 =?utf-8?B?K0taZVJRZ2UrS2lMd2drNFAvMnhrR2JIeHozMEMwYWZicnIyM21CUmpsUCs5?=
 =?utf-8?B?eG16U2hhUGFFZmdyT3E2SHZXaHNteEF4eDQ0VUJZUS9PUSs1RThuZHhsQ0th?=
 =?utf-8?B?YmtjVlFjZWxBenV3MFZhTm54a1ZrSHNEU29RZm8xVGxsVWJha2M4T2dSb0o4?=
 =?utf-8?Q?7r69tl6axk7ZNO01er5QlGsevGKuViXIh7Z3a/e8Tl4sH?=
X-MS-Exchange-AntiSpam-MessageData-1: FcHAPNkRorrAdnYWR3HR/9AdvFFsi58usSY=
X-Exchange-RoutingPolicyChecked: RwAKDpVLgceCzRz3MUVio4Ov9fEQOfXHCXqAm339K/dIebm3RKqVGRzoB9lNk7DH8nER3M28FWldxzcTJ3CKvYTzkJ+gZKwBta8TBt79bNQoi1wHbtAzI4rz4Y62a5FfXOgO94wW+5JKvUQhnvva+w7+YZmgvaGjmpI5YcvSxu6cShCCZNPSa2zgnO8Ij4kRklxoWte4LZjs40ZohQmMhBICWgz/MbAj0QMrnyFt8Jx4VsE1Kk2zO3wxZue/xJnSrLTBEgoxbCWJ1o/AmFvPRY6GB8NB6HENHjTKxDhFKT/NflsB+pOfQjdGVyWm8KMkb4TlSJz3buFcYOpNlrYeAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1f6ad5-20ed-4dfc-f1ea-08ded945b4b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 20:57:34.1764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5BGcNk+SsjSg7eoQ37/yUNP7+NDUaTZfLHVk3klUlUNQHYtgclLrzEbWUm/G6ZbZ5tNy1mhQfQ8ZHrhNIp3LhAQOzH7Jr47gECeqxLk0MM=
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

On 2026-07-03 at 16:28:42 GMT, Sebastian Brzezinka wrote:
> Meson does not automatically propagate static library dependencies
> to executables via link_with.  lib_igt_device_scan internally links
> lib_igt_drm_stub and lib_igt_tools_stub but does not reexport them
> through its declare_dependency.  As a result intel_gpu_top must list
> them explicitly, otherwise the linker cannot resolve symbols such as
> is_i915_device and igt_log at final link time.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 4c67dde4f..53aa31056 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -105,7 +105,8 @@ install_subdir('registers', install_dir : datadir)
>  executable('intel_gpu_top', 'intel_gpu_top.c',
>  	   install : true,
>  	   install_rpath : bindir_rpathdir,
> -	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
> +	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
> +	                   lib_igt_drm_stub, lib_igt_tools_stub, math])
>  
>  executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
>  	   dependencies : [tool_deps],
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
