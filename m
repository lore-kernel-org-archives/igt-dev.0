Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607C2C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E4710F935;
	Fri,  3 Jul 2026 21:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQK3ON71";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AED10F935
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112899; x=1814648899;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rhmtuNesBJjYZIscoUvNCSnylio8wlq8SSjKwG8C+b0=;
 b=GQK3ON71MXTmvIu9HUeK1tgEPf2Owfnd2gi5cYDgmT6DR4BWz2j532I+
 7ZNciFNbWq4h1fRY+OPU2UTSfVJC2YC2UUbhXYoFuj+1tCxWoS3WAscOd
 3OiJIAwmdPIfBVCUXiHTvKU1RioPjcbi/xlQHknGUiCap4LB+12Q1F2n9
 KWIUH88jvrivpi4gJHfZyo+Q+23Q7FeSU2ckI1f1oJZAd6PGRIqCUUI+o
 LdXezqQ90cB60ob2AkJ0DJ71wE+mI9LWpTJ6Achdnf/rkjVcRMTbdnKpB
 iBWH5+UVffVdlkamTxwlzFbBoH6e1dkYgi9lsx+P8XJiyj4nqcX+96Cee g==;
X-CSE-ConnectionGUID: Kjv+8sghQYyPIDcgBbYYLQ==
X-CSE-MsgGUID: lqU/xJQJSnGdMNo2jjKeCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83894417"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83894417"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:08:19 -0700
X-CSE-ConnectionGUID: lZnZQ4hSQW6CxZ92xJR1AA==
X-CSE-MsgGUID: hUKcTdEbRBqkZD3sfzK2dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="252128024"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:08:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:08:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:08:18 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:08:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xo1L2PvNZzWwQUescGOLFgS+3NwdPJTFRWKm4uEtcpSZJOjDzKLr7tWLbvDPDZhgJOtTtqieJOXwP7vys7SOoJNOQaCowUEyaqy7+DRfvnoBuuG94GbFsyGqwYe9G10KZKwcScjWm7Jx7zAOAxfVnuBour3cuNTwna1eQnB2LWREqCU1Wh2sc3fA+e16qFAuXgwCIGwG8XNaqr6GxZwZUuZvSfvkjnlQPUVXO0Y8/TIgGkuKrLInz/quZ5u/2o1NB1ORbzpt0hgYbr4pZuhm2UNhiGcK4NLxz5sSZ2FniUC9Hd1Pj5utV5Q9ygpAyImViEfktJAavgYfbvydTc2NYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygN+laY5da4juUFRHOs4P9kCoxs3rSS6LmYXrSdVUjo=;
 b=XvavWxtwHmP6RLDkyji3rhXmeDrCBN7jBCl6KnQ16WFUYnds+jBYlStNqNW4AmhbrXurhwV7EpoktseX1g1QOeQQh5Zqb4T6833RsVucUAohLoXOtrnkihCYM9g/0gq/X5MgJBo6SxiSfugp+nGnXKaLFJTP1tZrNENmXu6D0D2qg+d89iflt7rHwVvfNAoVjem2LW1L27jdBgyPUHxnfpcL0QrYfQXqWLyjIaLpvPqcLAzu82P8wQojopE2LsnsWQDxL8b46Jc+LiOxCo35CdrbiR+vLnRshBVfbE1DfX5rNV8jd+tlVRVV+qFxMd9Xzu4CJiPcmC/nygV/ts1YlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:08:11 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:08:11 +0000
Date: Fri, 3 Jul 2026 23:08:05 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 24/31] tools/intel_guc_logger: link with minimal
 sub-libraries
Message-ID: <eorwgqzub5opzwt3bj6chkhkezj37bfrkbmcxghijvni6jqubu@g7ykosalktpa>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <2188c3f515232a2ac50505937485e89ba4ff88cd.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <2188c3f515232a2ac50505937485e89ba4ff88cd.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DB9PR02CA0011.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::16) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ca6056-1d65-4d7e-9852-08ded9473077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|3023799007|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: a5LqV8oYYhTQSzaMVuROSR9Jp99rWHmHkt7wtHAe0kYCt8o3CuEXBy+in8IViRAUe9DcgKF63+TMbi/SvFdomNQW7Nq5BXRphuSt87oz/41gBAqBJkXMo0xSgsqDergU7lBMjxkJyvwa1mEZGkNDAk2UoXERmCPCIJF38g06VBnc2hcvNrEm3rrBGzzMKK+b6i/OC+kz1FIDpvwxhZ0IeDHkhVsVVlIb+fN/f8e85LA5coc3plCdseULcr6JwnuEw0NeVfckJLwS2dakkGlQUs8Q6Xn+VNMOEHv8tH/PpKob6d6eqGjjo4QLw/cTXiVtU30pFRTIVzapxhRb4X8b71l8WOE5jEb4OYXJXTEBzOXbXSnpMfoFwooEdEYzI+tPr4jL9tT8BcyAB0jDirXryziJltPaTpr9nW5MD0AdWV9nZF/VsBQGGOWfl83KCBLO3AobfHc2wEelP6bj4YbOrfXXJyg4IFPgJXGU2vUV4agECWg5Ci9CdsyKs/P7ESJCkZmaht1dUfpfLoKyShvnFq7e6A2OTs8yyUHdJdU0YsMn4VMJw38O2IdQuFu5QB/701Ic2Wh7jnkQhmUpAFzRjMQcPAkJvcvXPG2SSa06laPOAMe3U/P4wzbjCY5rlOS9uaMVksFDWowYs+eDFAp/qWB4k5A2GDay68SnZlqaNm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(3023799007)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXJja2VZdXVLbEprVnpBUE9hemRqTjZ6RDAvZUUxVEdSWVcwS1dJL3pkNUQv?=
 =?utf-8?B?dS8zOUhBeUgwT1MyNjZxMk5TY2hvc2tXSisxa09QellHS0xSZ2pmTzJDZHgw?=
 =?utf-8?B?MWRpbHdqOFc0RTVTV1pXeVJ3ZHAvTXp1SzcrNTJDVDdnRFl5WTNXNFFwR2gr?=
 =?utf-8?B?Z3hwUmxqM3FjTDhkUk1xaUJMOHppdWRRNHFYQndJUXkvWkxuQTNhdWxwQkVF?=
 =?utf-8?B?RU5BYzhyT0ZMZzd3eHVMUVBtVDlIOHoreElrYVBpQW4xNFhXQUFLdWpZMzBO?=
 =?utf-8?B?OXgxV1lkdkNEMnAvcUcyQVNKRU1mZ3E4VzU0dnBWV1pVU2o0UjMvdjNTUGRW?=
 =?utf-8?B?WSszTnNiSnZWT1NEM2VRMnVIajR5WGtCQVI1cThoVCtqY3JqaFdUdTVJdHBY?=
 =?utf-8?B?MVB4UEZVMVNPekNBNUVNRk1CRU1WN2R4UXJOZ0dCS0ZkM3ExVmlXTHB5UTZx?=
 =?utf-8?B?Y1NObCtrRzNLT0J0cXhzMUhTcURDWUs0cTNCSkJWbENZOHNGZTk0VzBwUlhy?=
 =?utf-8?B?dkF4dEhxeTlBWjdjdWhVMk1GYVVCcVI4MGRMZFhja3ZJbTlrYWR6QTVrMWs5?=
 =?utf-8?B?VHdWMFVVUlBBYWRLdW1CSEhVTkR0VVBUSUZ1ZXNWc3JjRzMzdU9HcXNWYVE3?=
 =?utf-8?B?Z2ZCOSswZFBuelhzT3JGTEV0SU9iKzRzUUcwOCtxMk5VLzdVOXRhNitxYy90?=
 =?utf-8?B?ODFSL1lQbVIwUFZ1NnNqNnNpRC9zS28zOVp2QXRremFjMlRyQkV4UWJsSFZD?=
 =?utf-8?B?UUlCUDVrTjZLdllWRzh0eDFGemdYOHczZlVQSjNEcFprV21Pdzh2VUk2VUth?=
 =?utf-8?B?VHo4VFVMNzhIeGtnNjZrbnFZWGZqTkVqajJYVWdaQW5ma3ppYkNFMHNSNDZj?=
 =?utf-8?B?TmxTK3dyYmluNnIwOUh5OVhvbjVKcEdtOFFLbkl4TzMrOHVxdUVMVXBpQnZL?=
 =?utf-8?B?dEd2TlhVczBNVkIwcXMrMVBER1NueTVrMHpRS2ZwaVl2dXdINW9DYUFwa0Fy?=
 =?utf-8?B?cXprODZ3REhKbnpBQTNHa3BNQUZOQlpGazIxaGhPYTZiTmdLcHJiVlBkem9h?=
 =?utf-8?B?ZllOQjBKVkhTelE0SWc1bEFNWW5EUFFmYzVKbllVN0ZEL1JPaFVaZTM3eGRa?=
 =?utf-8?B?VEFlVkk1VVlOZmFoRXh4MG1RN1dEMzZ1UUVzbUVhVmV0a1lMOEpOMnMxVldo?=
 =?utf-8?B?RXNrZXNFMGhMSTZCMlI1Q3E5cHZLbXhneGorL2s4R0hrYTNnczNVV3FIVTVG?=
 =?utf-8?B?YzY0MkxPR09RbUgyRmxzampMaWFvYmhKSG5TTGxiQ21qQ2dZZkpQWVZWLzdl?=
 =?utf-8?B?V2hVeGlTMU5BZTFEL3FKZGl1RUFvRE95WnJ0SHZ0QUN4bnU4Z1RaU1pMa2Z5?=
 =?utf-8?B?ODZZc2NudVNNR2xFWnFuZFFIazgrNjlEZU5ubDdZcGFScWFZV1VMOENNdlBG?=
 =?utf-8?B?WHZvZHhBRjRkNEtYUkFyMXkvaDlCbzBYbXc2dHN2dGdhQ1hDYmpZWWpmcTlh?=
 =?utf-8?B?c3NXU0pwcHdxRzB2cjZkY3ZINDZoMEN3SWNkMUxPdG90VGEzcGEya3lyVGhC?=
 =?utf-8?B?ck00TGt5Zkg3T2Vsd0kzVDFGM0M1SXR1K3FwS3FNTEw3UWhzMkF2V0k4VDUr?=
 =?utf-8?B?V0pKSmw0YVhjdUI2NkVtby95ZEZVcU1yMDkxbnVheXJ4SkFtempya3RmMXd4?=
 =?utf-8?B?RTlhZHJmcS9vUW1iQVF4R21YbEh2M0dmNXB4QUVJTGY5Z1JHVmRETDBCUnln?=
 =?utf-8?B?TXlxZVgwSmlIK0R6dEtKWHAyUzZaOXZJOFp2QzF2Yi8xKzU5ODV3SWNPWWhS?=
 =?utf-8?B?WGhVUjBLYmV3L0ZqSzRvd2lKMkp4UGlzckdGQlZmSnBZclVZb2UrY3ppUzNu?=
 =?utf-8?B?cXNuSk8weXM5V0t2Z3VtNDFJSlZhc0kzV2hWVlNhMlZYSE1UN1JUM3BTZDd6?=
 =?utf-8?B?UzRYTFVMQ1ZYQWdyaGV5SzNsM0NJUUNOaXdHTHM0NHR6Wnp2eXBLVjZVcnlw?=
 =?utf-8?B?V0NLODFQWHJ4STFqSU5yME95aWxuLzVFTWRoM1Rnck5nU1hOQ29YMFdxK2o1?=
 =?utf-8?B?OWhISjNoQnRmQ3pPZGNidlFUUTUyMWJ2MDZKazg1ZDF5c2tRbVdqSVQwVEQr?=
 =?utf-8?B?eksvSmlra29ZR2JqWlowZ0loUURnSG83Y3pmMjAySDRBU3Y4eUlrQm1nWnVF?=
 =?utf-8?B?MExvSEVXZzRiUmM1RXVlUzZrS3RwaFNpbHRHWEt6WDdWaHhvakVnL3hETEdV?=
 =?utf-8?B?NTVVQW5ySjdnNENWNldUeUp6QkFkZ1hMOCs5aW1tenZ1amMxL21FYk5Xd2Z1?=
 =?utf-8?B?K1RTWVczTzRMOEU0MHZDTGdnNWdzeHplclNyemxEUmJrWHNmYVNsaW9KbmJ6?=
 =?utf-8?Q?yPw3w4kuHbwnaM6I0wTnBI4DNxQLoeuq+684R3RBKuPjD?=
X-MS-Exchange-AntiSpam-MessageData-1: pS4pPFymQ/+HcfWaq3TBWfBWylysM8YQ4ik=
X-Exchange-RoutingPolicyChecked: TYQDcuWm7f3KMh7DQMHbdaDrQxeLM9WP9jeVsdxIve2+/di8gJW5pOnv5Q0NzK/2aPsikWuelMS9yPxptXT/CYevzjBktrXgGX2lGsBDfIFYQ3kzld51zYtZb9srOwW776CTnqvSyRTdV9PXWCzDIoebXgDfhtim6wNCrxGSFYw1aaKkuVroQqmIyK7BF/gSIvvhUoauu7t3Hy7OLCvlxDM2au1wru+j1mlTMaD608JZNjo1rl2KKx/s4b6xrdtO3mSTrlcql9ZqZ/h8S6Mnt7OxsNCOzb1sz3w7w8/+MVM74cmGrF+sQaMqcY5fge536VoY1s3qH1XrNs8FTUphiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ca6056-1d65-4d7e-9852-08ded9473077
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:08:11.4027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQoVwkev/MFOWiXeQBhaNuouv8EMMOYMeKWii26/DnXyi9PtVwKFTJ8ND9ZRs5mVHGTvzLI5ufZTeIEnVKK0lpiI9GNSiykI9lJd0tRwkBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On 2026-07-03 at 16:28:58 GMT, Sebastian Brzezinka wrote:
> intel_guc_logger only needs core logging/assert helpers and debugfs
> access, not the full libigt.so stack. Replace the monolithic include
> with the minimal headers and link against lib_igt_tools_stub.
> 
> The tool previously used igt_simple_main_args() for option parsing, which
> is part of libigt.so and cannot be used without it. Replace it with a
> direct getopt_long() loop. As part of this: add a 'help' long option, a
> usage string header, and a default case that calls exit(1) on unrecognised
> options, behaviour that igt_simple_main_args() provided implicitly.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   3  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/intel_guc_logger.c | 21 ++++++++++++++++++---
>  tools/meson.build        |  6 +++++-
>  2 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
> index 629b4e660..3990aef87 100644
> --- a/tools/intel_guc_logger.c
> +++ b/tools/intel_guc_logger.c
> @@ -38,9 +38,12 @@
>  #include <sys/syscall.h>
>  #include <sys/mman.h>
>  #include <assert.h>
> +#include <getopt.h>
>  #include <pthread.h>
>  
> -#include "igt.h"
> +#include "drmtest.h"
> +#include "igt_core.h"
> +#include "igt_debugfs.h"
>  
>  #define MB(x) ((uint64_t)(x) * 1024 * 1024)
>  #ifndef PAGE_SIZE
> @@ -367,6 +370,8 @@ static int parse_options(int opt, int opt_index, void *data)
>  		discard_oldlogs = true;
>  		igt_debug("old/boot-time logs will be discarded\n");
>  		break;
> +	default:
> +		exit(1);
>  	}
>  
>  	return 0;
> @@ -382,10 +387,12 @@ static void process_command_line(int argc, char **argv)
>  		{"polltimeout", required_argument, 0, 'p'},
>  		{"size", required_argument, 0, 's'},
>  		{"discard", no_argument, 0, 'd'},
> +		{"help", no_argument, 0, 'h'},
>  		{ 0, 0, 0, 0 }
>  	};
>  
>  	const char *help =
> +		"Usage: intel_guc_logger [options]\n"
>  		"  -v --verbosity=level   verbosity level of GuC logging (0-3)\n"
>  		"  -o --outputfile=name   name of the output file, including the location, where logs will be stored\n"
>  		"  -b --buffers=num       number of buffers to be maintained on logger side for storing logs\n"
> @@ -394,8 +401,16 @@ static void process_command_line(int argc, char **argv)
>  		"  -s --size=MB           max size of output file in MBs after which logging will be stopped\n"
>  		"  -d --discard           discard the old/boot-time logs before entering into the capture loop\n";
>  
> -	igt_simple_init_parse_opts(&argc, argv, "v:o:b:t:p:s:d", long_options,
> -				   help, parse_options, NULL);
> +	int opt, opt_index = 0;
> +
> +	while ((opt = getopt_long(argc, argv, "v:o:b:t:p:s:dh",
> +				  long_options, &opt_index)) != -1) {
> +		if (opt == 'h') {
> +			printf("%s", help);
> +			exit(0);
> +		}
> +		parse_options(opt, opt_index, NULL);
> +	}
>  }
>  
>  int main(int argc, char **argv)
> diff --git a/tools/meson.build b/tools/meson.build
> index 15bd40dec..32a345e9d 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -19,7 +19,6 @@ tools_progs = [
>  	'intel_display_crc',
>  	'intel_display_poller',
>  	'intel_framebuffer_dump',
> -	'intel_guc_logger',
>  	'intel_hdcp',
>  	'intel_infoframes',
>  	'intel_opregion_decode',
> @@ -112,6 +111,11 @@ executable('intel_forcewaked', 'intel_forcewaked.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_guc_logger', 'intel_guc_logger.c',
> +	   dependencies : [lib_igt_tools_stub, libdrm, pthreads],
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
