Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF21C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCF910E368;
	Mon, 19 Aug 2024 20:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="io1H+y06";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02FF10E368
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724099462; x=1755635462;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lpve9a+Bg1aG2RBD4D7AJy9xLflszi3o832m0szlwPU=;
 b=io1H+y062sCiyFFJ1Okqw/S6lVkBVN1pPeCJQF+YQPtVhzAwAqptYHlN
 Da+sc3JZ2TZ1HH5Q9ddsEajPe8TonbCOTtY1ksS6WTiMsqGePREM9FNU6
 gRh0lDgPcRTjK9bSmxTJyiKH+Tf8aE24LYxndVW5CgbplK+pzqA5yHdZK
 9XIR8F5USh0iV1bUtqKbN033idrkp5ATDynwNuk4F8rDNgFKHFA7DqWv/
 eWtYatBJvbRpnJGBnA78rhuM+jxyc7Y3uhll0Vodh2IuWWEXCvTNg/EmK
 g6ALYLKn5HRc8qRjSih+n9vEt4PdnypnzsHnnNKzPkwFeZlKWfLfHCHgr g==;
X-CSE-ConnectionGUID: GKulYbq4SyablAxqU/5r/g==
X-CSE-MsgGUID: yK9ubLbqSIWOpR0LoiO3kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="25273368"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="25273368"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 13:31:00 -0700
X-CSE-ConnectionGUID: JI27IId+RQuYPLCkmPZBIw==
X-CSE-MsgGUID: wPsZl3Q0TxS0yjnnacaQvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="60140358"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 13:31:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 13:30:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 13:30:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 13:30:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCegYTy1e31j8qA6lQoqfcO/7uVCh9l9BsSz3UIxxXCXQbV+luF9iVyRt1kCKkGXCn5PV3q496C4aRxSdCP6fIL4bJDcYCZM5pEOvTv68YWaiUfb3RiC86SM6nryx8J1UmjvYjzm4XeuDHeuiV+Wm4zsgIMgMxtNTYAAYGv82PeiqtwD5md6r+8FJg8Bk9wgcD0s1MePj3qyncN16GKBgzfTjrFbaaOvDm3UnZepqMvXuBo3ktst2IkbManaeNlN1cg6/NbGwrqH6RRTpiIMcL2cs3kUGUoxCZiKTWnNi7p7eeSPFaEIis+MVCmkVPFGhTpHUlLgnBCWcSTg33arxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bihuLIgxY0nD7QAiJ/ZuFl3u35/V/ZrCOdNWWQqzQfY=;
 b=EBKUbH3qvGBlmQRNlkcRREAdb99dqVEwoskgU5qn9mwhZFVed5btF5kKA/67ue7XN7SH33QszK7/UyfWo5jP/YTq3IyvvlOXiSIRqBRD35kROiB7WrUxkr2/CQaBKdagkaU/GQiMokweLyVj3l1vMUyE/9v8Nzuuw5jH1t40wKWBkA/7gi0fVrwTi6Op03f+OWcVoXhFqbp7fWJk1GEeDUBMqCmBntHj7TO3+9jUWljJ/Jj2kaJU7UVPv2jCWUPIWppYOuJ5L8HBpJqpB+mKut5Bv0M9Hq9WVzQfrMsPMBD8fNhFKYJ5HkElVz9NW67JUtbmYRZZo2jhrNBvzVWqkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:30:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 20:30:56 +0000
Date: Mon, 19 Aug 2024 15:30:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Add single engine tests
Message-ID: <6jrhnxpcz5uqpaxt7ewxl3ccwv3t43gxry3vte3mdvoxdx6ung@7kvbs3qcl5wq>
References: <20240816222140.22577-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240816222140.22577-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 13363ab5-0176-49a2-27ae-08dcc08dd450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?byMqwZx3ypO5d2jsAdYggg1v2TwWjNN7Ex5KIQBBKudoXhdcqa2EjaTDLJKz?=
 =?us-ascii?Q?kQ+9Uo8hxnLP1ilazb7lgU/NOj8PlBN6DhK4v+QQo8FsBLiRVTC2CRxhTeQT?=
 =?us-ascii?Q?FBwfr4oGzhinkklHBL86zQFkvlfxGHfXvWiIZD5UHISFL1ufDkZeAuMbzaSr?=
 =?us-ascii?Q?pZ7/WMF9xoNghmBz7S9K9VjIAARLNBKt3XARAIoX0qLDJ2SUfQ2YTPgcxkhn?=
 =?us-ascii?Q?bRLjvCm6ow8dcpQtAkU7uxTlUjK+Qif/gYn3/EaUM/4xynM4wInD9l3lsgkT?=
 =?us-ascii?Q?vbigELG5DCyr+iPzQQ8prTrTO0ApFwjOU/YVqRwMcIuBz1pQBKBrG7ufecsm?=
 =?us-ascii?Q?y7TGc7giOq4z7B6dJ5Mxhlbvtb/g9+otwHpUScsmBWMUf+A7Mqs5XuoANLLl?=
 =?us-ascii?Q?YtLcZTbMptVvfr6lTa6OCKyr/g+zEffg16OnA5vQ2xWcuuxAF3x0I69QBGn3?=
 =?us-ascii?Q?YKlrp5RuiDunoeL55VC6HKEG78rjEMHn+FEicqr5JxZZ5ohR5d3cuOBls+1v?=
 =?us-ascii?Q?HqHcGpfYNrmedkZlhQfDrKOCQOGFeyEfUbp1aJeGONERPjtId6WQCHatTjTL?=
 =?us-ascii?Q?9sWaBL8+bdDb3I1NWhhzPzm8ErK4ZiNjTvZuUjR7UBiVMbKWvgueSnduZnai?=
 =?us-ascii?Q?MxZx0o2b6Wck4V9OBMxwtJHyiZfYYIXSfLOvad2HJl1IQUeV9litcyAfYydk?=
 =?us-ascii?Q?TJDNbwO9BGrHvpS4ryFC+4GzfgA8nAgXbXqWD/ZnlY0hzQg4vjT21MWnaO9k?=
 =?us-ascii?Q?lyCOn58jbdXVXb8LomFRotBFE7cy445kajB/yd08rhnPeb7MTClSE1rvnPw3?=
 =?us-ascii?Q?0X2x1q7vD9wseuR2GDyLT4AehLBvGhnQdeLmmrV3tHdf4hh+sE2NPYsJ121M?=
 =?us-ascii?Q?+fjf38p5FaQ7fAt6LjR2n3S2mDp47WJ5Z6ZCS+ykxuBhcDr8XWqGlU2VVb8d?=
 =?us-ascii?Q?2GbUSfOPw73lX9PrUD9pMGeGsBhA2eJ+OWEyL9D0F4GNIGiwt0iEysdR4XZe?=
 =?us-ascii?Q?kOstrcnwHTSRL4NRbaBgPqd5hmvRSeFv9K3suzGqdte632IiwwOrAN7g8dwY?=
 =?us-ascii?Q?h8DQBJ0AK8ReIaWrBmANXMGkXuPm9JcKFYI+BA+Pg+TJliUC/ybDv6P+iHKL?=
 =?us-ascii?Q?+2d7HvlFyULGKjN9e20cuB1bbeZvNliwFP1M5U2EqVj7aU9RYjYNQUtwftob?=
 =?us-ascii?Q?K2gz2GfRmyxFps69qWDEydK//PkafNWdftL309knB47BPy9owyQjzYXgN1Jk?=
 =?us-ascii?Q?X5ZK6AqJJ9Pn8Aj0u8vj315RjoZmKGt4M3ytNAZwozJiHYOTD85G35eTU2EW?=
 =?us-ascii?Q?Hx7Er7rLuLZyiyMn8QvNO5l7oCU58pSOEk0AM4dRj86Yxw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lLwS5iryiShRYkR5PEOEEVN2ZQjC9fx7vRwk5OkrVBPtdXBp6Fjj7ohzPFBz?=
 =?us-ascii?Q?NsOuplHVW4tVo/Lf3cTVrdixOwtKboDNkwnjgVdz5u8v0Ii7kVMXqRw3uW0j?=
 =?us-ascii?Q?MbzVCECLGrwiWSfeiLHap+GgokBOyviWIfDZm8GBd8J5a1kjU1Vrwt96EDS9?=
 =?us-ascii?Q?0JfwhO8S4dLA9AwvxuLV7jQwh0X3vmPhsEzkhjYdBE1KqI8Ix04fHke/Uw4U?=
 =?us-ascii?Q?D/fIyyk6bZzzzKIjHYwTabPkXb0CUpCpC87USOImA//n4zBecvlLWT+JcCEN?=
 =?us-ascii?Q?2U1vRgZO14u3S5U9EVdZhGXEnFeKuuIJ/xHkHxO3W+hv25yIY7xvXHxwEcQr?=
 =?us-ascii?Q?RqDLrt+OtbMUj5CEgCoIo2gsLIqZW90HjK80HZp9xBqt3fryJ2MnNijNVpR6?=
 =?us-ascii?Q?ZqoXRmOA2z75VSygZK+gPftnQQaoS0VDsYWdvlsQcMvdLt18mjg0qYO+H5hJ?=
 =?us-ascii?Q?4ibMnQMnj0oPBqgxTFn9IDt7f5r1T8WTi2UE0HfOM7FPmEEa5Pni6rpKXZdB?=
 =?us-ascii?Q?tORkiWV8RDCjjFfo5xICkB3Djy90AZCI4KWH2hBNwtYgEhWNH1zjooOasIiK?=
 =?us-ascii?Q?Ua23+3NofSXbcLfwzyu80kp29Wf9OSNJ8OiaVmaubNllKd75esTP3oM2FRSe?=
 =?us-ascii?Q?qi0rQ9mzd1dy/TU95cS0KG4JAugHZn91gSgWhioaQZPCORhK9EWP9ttdrXzT?=
 =?us-ascii?Q?G0C/7HqwrGuaU1B9nTNNW4OOjYMq6gFfcuapw6zX2NJ7keB+YsTJVskLNEg1?=
 =?us-ascii?Q?8y6bdjATcA0y/6DK/f9kdvpAaZWd50J+7iFJZFkcQwgs9GIrHlFQEo+CVwdZ?=
 =?us-ascii?Q?/LWSErdumjj5Tb25fZfRnHz51DOnUUBfL1k5p1spDKol+CAzWPbIHw/pbaW+?=
 =?us-ascii?Q?FXhm0LIgSMYd8ZbZ6G818LVbfH6C0M3pLsd7OIe7N8JtT3MuIX/S2dhesnS1?=
 =?us-ascii?Q?O0oczSjXmhKOkrzI0f59PJ7MOIXKgQoa2Y+9ZeHqRUkc32Oov9l91lEwQRNZ?=
 =?us-ascii?Q?qZCOlBrjPWTzMBZetvM5U8K8yyV356zNiVYa8qh8XltxPgOPozizvQxNW2RY?=
 =?us-ascii?Q?2XEJ+iXZNHJRvA7O2xdTR76S6/OlMh7w65a//OHSr/GxoKqyBp2kMnU944Hv?=
 =?us-ascii?Q?jBoQnDSZk6DmwT3fPcKfLdp0gYqiM+PI6PLblDl/Z3BmmYkhmxICq2c7IQMZ?=
 =?us-ascii?Q?Cb1mmdWo99mYItk4Ii2ue1ts2aj69oCpu5QF+6TM6Y2A0lCjoIcFMNZLIbYh?=
 =?us-ascii?Q?4yoylHbsRdultycIkXzrkuGmn54fwzG1KYGoawtUiN2RSRekWWOJ+Kvb5d2M?=
 =?us-ascii?Q?MyiP1X52fN3BYT4IgNoY7h7lB31RWzKlL2UnVh5W/wTq6pvp8fTi11hwsmPT?=
 =?us-ascii?Q?dQffxQVq/ZLfLTjdBOgGktCx6fA5cQqjSSjabJfUuaH7BQH9b67zLsS9w5qd?=
 =?us-ascii?Q?4rVjQvpdUlq1nNzZHAkIMBwYksQDBBOF6S6JJSaoUgP7Xh9O6vnVDJc6/wsM?=
 =?us-ascii?Q?C8VdVQkvhHb4zhGY66bA1//AAvK2aB/9RGWJ66DQ5bDtfII9QtR7xkrbm7Nx?=
 =?us-ascii?Q?hVAna/BftuzwpeKsxxVDTmBQrJlP6HWMdoBsx2XdOlwopV2d/s+RAdkyMAsZ?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13363ab5-0176-49a2-27ae-08dcc08dd450
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:30:56.6419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXiyCYuUyknfgkX8nwv9ljciZ86pmXErJKIfE+HgUGXaJCIwlJVsn4+Cznyna+TIHDQbV4lk0oXdb6Xj0mUjt0g8yg8c5iWtgbp8zfKpwV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
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

On Fri, Aug 16, 2024 at 03:15:57PM GMT, Lucas De Marchi wrote:
>From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Add simple tests that submit work to one engine and measure utilization
>per class.
>
>v2:
>- Drop measured_usleep since return value is not used
>- s/parallel engines/parallel submission/ in comment
>- Use NSEC_PER_SEC for batch_duration_ns
>- Percent should not be > 100
>- Check utilization for both clients for isolation case
>v3 (Lucas):
>- Squash some patches to avoid warnings
>- Remove traces of parallel/virtual execution, to be added
>  separately
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
