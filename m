Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EFEC9833E
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 08:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0D710E900;
	Mon, 28 Sep 2026 08:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLozT1ll";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DA910E8FB
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 08:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790585445; x=1822121445;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YL9gv6nbaLXZ9GBjBMWe2Q0VnXJl/DzAvqQ6U2cEVxk=;
 b=lLozT1llubPc1AmMhu5d/rW5Xti0zPAaHMF/+BOwNvINndluoXDnxfhh
 VQV8Y67kBBOeGcAw0O34GH0U4vAEUOUQ0NS7jOzTYXp2Bn1THpYJQj+sD
 vbMwz5EEkAl4Hy/PGWgB49z2yUVWMr7t0ODqH4col6TPl0FVfkLjRVAyq
 yfcUpUlRnwJMB+1ysQCOanXUGBLhlsrZhLKb94gfxhPYa5dMlQhplffs8
 iLCqlMT1tyyAM/2qbQlgDxXV3z6BhcpBwdQefF1JYhlx3N+RRp3xt4yaZ
 Pk3UztDFcFZBSC4J/H75qr8DfXk6JjWks1ZCK2mxcwtV3Knz6SNUdU8TE g==;
X-CSE-ConnectionGUID: VH2Fad+HRcGJx03Vtyk5kw==
X-CSE-MsgGUID: aBQSKzyMS8G3H2EcR7+sRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="91141202"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="91141202"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:50:45 -0700
X-CSE-ConnectionGUID: itseyGdWQZyDapoU9oDkTw==
X-CSE-MsgGUID: ZF8+KdCbQIGGpnKXOCenfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="275034739"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:50:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 01:50:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 01:50:44 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 01:50:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZiOWMPxT90+SVtrltYf8ykuRvgXQWXmppjInQInA8GUNOoZ4TdTsWdiKnd9WWzFVZ2HUnkv8wvObw+z84fEEX5ZEj8fzkXNKrOv7+q5l6AT6S4/WW6A75jyaoQjrbj4VxLj0vGxS451tYaBAYEZyrw5Guk1rVKqkwUmtu0fTT52MVfVaiy6XD/PGfTv8YFKCi4CEOxN+gqrNQ7jUyG8BFZVDM2znsZl9+0/00+qc8cir2fDsVh+IDQLAgX1043iztdtXsgaQppE8sZiPC1MJ5HN7/5b/ICq81RsX1aXIcf9K/0il6dHM4xB0c+on7ph+uT1KY2h7JYY95Ep2hywOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnOOSenx8LE0ChiwjsW2sCP+7CRfRe0i3Tt1ioDP0lY=;
 b=oakczv4wXhkX0oHTlCITmcOaGNsGxpqGxuY1a7cw0/m8CA2At0RyLV8hjak4oHCuD4oRL0nLlAdw3m1o9Jbdur/FUTN5V1WX4nbTOLY3Em6axTZau9fBduCayvSMKHB8MFPkE9cjRmL6XB0CjeZBCla66BAnUM3legzEjIMfALZJDPq19/VhMArCxnA3QEhMuv9h2vC1ypkOT8uJR2eyMvdyoXPHOVawaxxpzpspZ65iAbe9qarfOV7K21YBO241+xUKjH0N+fIUSb2KKI+qRBeARiOBNQXo5n5bkwgWyJB9kFdj9+qY2XRVfzoNjfj5jA11STjDE2WMeM9BCKYCkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH7PR11MB8058.namprd11.prod.outlook.com (2603:10b6:510:24d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 08:50:42 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 08:50:42 +0000
Date: Mon, 28 Sep 2026 08:50:33 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 2/8] tools/gputop/xe_gputop: fix CLAMP() usage
Message-ID: <3334k2xcpaxan5d6et2bjczjay4g5oy7ooqnhhnn6xzykpal7h@heixj2vzygoy>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <e1fca483c0201eaaa8172e9dafb092307e550dfe.1790331690.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <e1fca483c0201eaaa8172e9dafb092307e550dfe.1790331690.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH7PR11MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: e7157cb5-4ccd-47ca-d5bf-08df1d3d9439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|22082099003|10067099003|56012099006|6133799003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: /as0MpDGNOxwfeAjhgYysc7mOgBAXD++pIWMnl7gEWaMVPmqARzi2pNFb48eDExN505LREx7Ar/UslbxwjffWAVrmyFAFzeLmGmUHdfjj4bvnrlzkbKbyHR/IuWrM/UaeAkvIOQHlGgKBnD+afd1j1blPwBdZpL1tXXQmtN0XmyDEDKw5iIpCr4fehNFpe/d3blfeqYtvXs09WnI9Ajkg96NeeVGvcVhdLXIpOQ5J77nl/SsFW2//E6h08ko5w7NpL01YLwBt0Y615yH35FRjTfPvxXpGo9Dco/+07FUMUV5e9PwDBZV9ICvpPLO/jJZOKmT7py0fRXdLi56EfgDtezPIw8NpGQYfhQJUPlcO6nx04CuisvDR+sie3oVyS6IrvpSsdg1A5Pn/WWyQR9OuvV/hvZuN9MGWzh4WZbqtFKJzNsZLM8CXkRZp0hmCLaJxy3JTGjGkIr2Q/OcZUL5cmvjPfgEa6hvgR44nroOMIjlc02PmnUrjsXRLTB3+JEkqsQ28+ZnrYX+fQLZGMREM68ypxWzSZ9RkTMGXCZpxfwA2E3LaTsuYqvgi2vQu0YbLdjLwloHO5M11YvDQ4qQfsembhIspjA7OCoTbFWVV9Y+LmPhJ0gj3Bybl1QyWkKW51op9doRKO0Qkd8h3bNDbCXlrLvaVA62WwqYAdHv7Gs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(10067099003)(56012099006)(6133799003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTJRTU90MksrdmorTkFnb2lsSVNiLzdWaVliVjZLdS9VSTJ0cHowVTBDVnFv?=
 =?utf-8?B?ZUZ1SWJYOVJPbTY5dmN4TGlNR1pMbDM1SDQ3MnlhRmtuN2hVRE4wTG55UlBt?=
 =?utf-8?B?UGlicDlrVWFlV01rSTAweHBLTGRIZEFPTEFSemNwS1hYQktyVWUrcWFVanIv?=
 =?utf-8?B?UU5YL25IcGU0eHYwN3ZueGhKaG4yLzR6V24xVVlndGNXaHllVGFwMmtGOXU2?=
 =?utf-8?B?UGtUNlNWTDJHbmpHb3VYMWhRc2JacWpyOWhLQ1pWdjNiMDJ5QzJQWTlrMjR1?=
 =?utf-8?B?ODEyV3ZMaGdmb01jK01TV054bzZCa0lFMGFoU01lQXpCM0Z0d254UXpFWEN6?=
 =?utf-8?B?Z053TXc2ZURRNmVqZGc1eDBnaGRTSWVwTlZ3ajZBNkhGZjkwU0RqdG5hWGYz?=
 =?utf-8?B?d0NVTU0yYndua0NNeVprcXYyei9tNmVoSUM0V3ZsSGFrYnFCd3hkNTUwVEt3?=
 =?utf-8?B?Y2ZZQlhHVUU0OVEwdFh1M3dYSmk2bTU4NHlSQUltZ2ZOYmx0OHJVTXJ2ZmhW?=
 =?utf-8?B?VndlWXVOVFNQRW5yYXhUYmhtS3FEalhSNlptVU1PeFFSRS9qM0hJeHhlem1p?=
 =?utf-8?B?U0dGRm5tY0dhS1FmcmlmVGR0ZTdlUjN1ckNBYTN2ekNPWXVvSm41eFozMmtw?=
 =?utf-8?B?ZFZhZE1meUJLTHBoSDYxdTVMVy9MWENuL0dtR2hpN0VnOXp6QUVhUUdnU1p5?=
 =?utf-8?B?L081Zk02dDdqTE5OQURMRXZpY2ZUMEpzdXh4MWNrQzZSUUc0VnVRcTZpVGVl?=
 =?utf-8?B?QW5yUCt1SGNyQTBNUmt2UzJGam5pVEprZ2txenB2OU9USmthRlc0a3RhYUNI?=
 =?utf-8?B?dW5yMzZvMjBtNTk1QkRBNTEyUloyWUlqZHNTNlBCbS84S1AxT0cwYzhCWGNE?=
 =?utf-8?B?SldXaFYyWEs1d2tYN2ROUFFlYVY1T3Y2dFBkTThyb3ZJVnFqWEdlVEc4V3U5?=
 =?utf-8?B?MkQ5OEJ5eHg0SXQ4bWRvSXdGQ3ZBSjZ3QW12YU1nbWNnditDclhEVnhPR0ll?=
 =?utf-8?B?ZEV1eFN2dkh5MkNXTlZialdtRWFvbFJmdkZYS1p6Y2t4M3paQ0JtNXU5UURj?=
 =?utf-8?B?MjZUOXZyazhaSGIxYTl5RlJJRS8xMk01WWU0WHZxaUd3bU01Yk0vQzhPazJq?=
 =?utf-8?B?dlhEaFMvZXA1MERLSStXaVlGL1hTbG5OMzZRemRJR0h2ZzVKamU1a2N4WVBs?=
 =?utf-8?B?UzlCSS9sRERVMFg2bEU5WUt6SEdKeU1NdmxobnZMdGJMZXJJTEwyV0NTdHlQ?=
 =?utf-8?B?UkxPVXdJM1ZlZWVMVnI1WnZpL3R5bjJ5V0hIWWE1YlVnN1NpVTdhSDdXWXlt?=
 =?utf-8?B?VHkxdU5zUXo3UFVTbldLYWRYVzdkRXJSS0o5TFh5b2VnZTNxN2tkM09hR1pG?=
 =?utf-8?B?Y09mcEY4cVY1UnN6REVtWHRPM2xzYmVuZldWYnowOExXdXlTc2ZQWHh2MnFG?=
 =?utf-8?B?QWdJVE1yK1gyejdPaFpPaysrcitlcnMyL3BTd05ESklsSXNoZ2xRUTRZUHlJ?=
 =?utf-8?B?NWwyRVpyelZpNGlaZVFpTno0MjVlbkNqQUZCT2lyVTV3Q0o3ZHRmVG9qQnBy?=
 =?utf-8?B?SzR0Ym1TMU1NN2tObjEwUzYxVWNwcG5BaTFXTy9MeEE2NjEvcEk2WGJTOE9V?=
 =?utf-8?B?K1hmMnNUQkRpZUZPVUs2VVNuVjdMWHlGWkhtMHVjUkJvbU9sVjZKU3duS0hI?=
 =?utf-8?B?QWtqZElNN2t1eHUrQXJwNXdRMk9MUGFZL0lyNGU5QjNDWGl6MnBYMU5qcWta?=
 =?utf-8?B?M2lpYXRpNUdIRVRmNUtuei9wcDdjZ0taNnBNSzhBa3FXZTVFb0F4U3Q1QkFP?=
 =?utf-8?B?cHF0OFZWSmsramNLSTJmdXpKVUZyQVcwWUQ0TWJoaUFYZzhMUkl4VWJFNlJO?=
 =?utf-8?B?VkU2c1FvQ2M5NWo5NVplQTRZdDkwMXE2Ump5TXczenc2Y1pjM2VIWE9IdUtv?=
 =?utf-8?B?OWtuaFY5QVpEcG1mMmkrZWFucnFaTTNJVTBtd3dNalltZERmNzd1WUc5WGpa?=
 =?utf-8?B?WU1YTUFHWW00ZWJqaXNkdnNwTFZYZkxqcGZvTUU4dzdnTHZQYzIwVGQ5U3Uv?=
 =?utf-8?B?cVI1Rm9SSXVlOVQzMnVaQUwrWXlVekd2a2tOZ0VGSFF2a3E0Vm1hVTFRYkY0?=
 =?utf-8?B?VTlUNmRnR2tCSnVpa1FybzZIQmpkUTZNRjFjVktldDFNUWt5UjJUcUc3bVJV?=
 =?utf-8?B?UGt6RnYzMXJCN3AyRVNKWTdyMnY2Rkpueko3T2hFTERPcnY3STN2YTZBcDhB?=
 =?utf-8?B?aW1tS1pOWkNuT0ZuZUliSThRNTJ5aVFkL2xIc3RFek1tQXVKR1RpeU41a1R6?=
 =?utf-8?B?T3hxc1FtZDhpU0VzM3NjNEJhWnNsdVJJUzBPQmI3bndSbG9iUVl1T1NkWm5j?=
 =?utf-8?Q?rlt2fyYAfCm+bcHY=3D?=
X-Exchange-RoutingPolicyChecked: 39JgmX8HSyNuaH1aCXvrZdUZSym3ul2GWVCY6qjCjiKeZAdrkS8M0t1tBY0pCTJCVAXTmIOP67+4FRjpf/PyfJAMhPQtwAKGgD90GxO497sZUuKPw3jmu0WFoaevB2ifH/RzPosSgpsgQL1iLFCM8yihLbzZhOBsIn8MvZh0ZPPNufYFVVmThsjM3oB3fnFb18X+6sX9CbEq+epNWTS14mbWyaNlLI87y8YRjOhIbdJQgBQrf1iK5Wl6+4huPiKLgitRZgGminXB/bX/9FxUcgTu0lRKjq9Bx7vYZFQRAQOFFV1N5ktIYbhPDHQG6wUHudiYsyA+UAXMsE1TCQp++w==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7157cb5-4ccd-47ca-d5bf-08df1d3d9439
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:50:42.7632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OWxt5BnVyTuczQQlWye3wWpErIkzKGmYlfwiQJMVwwTt5QX4Rh2ibPIaI8T1R285z/cdYZ7Ar4Y18AWhgY2WB6wO8jTQV0MzuQNiKHLnIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8058
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

On 2026-09-25 at 12:57:42 +0200, Sebastian Brzezinka wrote:
> clamp() is defined in igt_aux.h which is not in the include chain of
> xe_gputop.c. Use the glib CLAMP() macro which is already available via
> utils.h -> glib.h.
> 
> Fixes: 6a181fab8 ("tools/gputop/xe_gputop: Keep engine activity percentage between 0 and 100")
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/gputop/xe_gputop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> index 119545c75..f643fe33e 100644
> --- a/tools/gputop/xe_gputop.c
> +++ b/tools/gputop/xe_gputop.c
> @@ -301,7 +301,7 @@ static double pmu_active_percentage(struct xe_engine *engine)
>  
>  	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
>  
> -	return clamp(percentage, 0., 100.);
> +	return CLAMP(percentage, 0., 100.);
>  }
>  
>  static int
> -- 
> 2.55.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
