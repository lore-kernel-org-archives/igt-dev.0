Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18149C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 07:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C837C10E7C4;
	Wed, 12 Feb 2025 07:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/R+6vGs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F1510E7C4
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 07:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739344570; x=1770880570;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v7DoaPuT8fbfo3lacyZt5skd/XARTvKPWQHP3TfR85k=;
 b=H/R+6vGsX9XVL/P1uryqAdlc+QIL+xbAz1CQbaCixgBkkoALTYaE+IFN
 qWaxGqaiIY0x1X00ihNIHINuV8BVfISpKttwTGSzxo+HV09YZrJ0JwXKs
 hzoF8Rh82jWQ6wXGkYQOVgGhVEGQpX/au/n4pwzy9ciHjWLs3TXcwMhDA
 sqr4GPXsilcwIi3z0z0pR2R48MmCnCMJlh/TscyO/0+vbBSo0M//9E/uV
 gimzLRLOUJZt1P5AYio+FVNqDcIwu2a3Bx1hul+CSDwxAVNv4h4PXTyzV
 QkPFJrxma1vVjOOkFsx7/cqgKyEjXV9cBeh74384MMjoB2SXKDh+6op5p g==;
X-CSE-ConnectionGUID: jLs0kf/MQhK/HZe4gJE3UQ==
X-CSE-MsgGUID: VW2I33vNRPWXJIQ5kvxtiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51417839"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51417839"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 23:16:10 -0800
X-CSE-ConnectionGUID: r/p3R7buR9qJFlBqN0uUhQ==
X-CSE-MsgGUID: SUnqC7iPRvOISQhtdXb/JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117670938"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 23:16:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 23:16:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 23:16:09 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 23:16:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QO6/f6/NaOMyGDHmbDKn4edLfgDsM2gRbGcIxQQwHRIpM1xcXpF8NXNa4jUMkodNe8NG4F+6mgw7fPxFSqub7Hxa7li+U+BFnK4F06iubGOCoWcEqwW8ynu1HKuc4Xz2bsFHGJpC6Uc9v5eU0MCwc39yqeAuxMCZSjkqagbUwV7vCkD8PwY+wm4WthYyyGAIioO67bAoWF+C0n8lA/jHBYwUbpvi97luClGE8ZcpWZ1PC9zXZjY/JWtkl8qvhk5dCrP1wbfcFwIwLd9D6mk9Sy5TdZsasylSUTdbEGYGN2OMAeFS2Lbbk1rmO9YfargC/xosx67zMcqO22AIleP4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83a6jiZdRoBgy8HYuHER2/mkCx0jgZaoIB6JRr62Grg=;
 b=Trn+KJOOm+5m2aMQ+tB+gKdOcZmezwQJv0v16Ne5WPkkw0bMRs2jbn7sG1d2AfQLqiPYiQDyPZu+6zf8QSLQVz7gljnn1GXHCi5l9oQJqZWHQfpSHwqFqG15W0ziyTFE+azLvTvEiEGNrSkIhiDsehvQ8Ghlc3Eaob9I+Y0cr0gXKnV2VHHlmMu2QH6qxCIVukINWIDOde+S6t0Kei9TV5r8G4v8xv3TYj13LtPWWINP3XhNMtj3M4gHU+IUxIk9+fK/gL0JePt8RwFBx1dDHiU6cvbmmgL+pu1Hn9P99Kf6L/+mqJFRP+TPe+1BCZfbuojVUWJwfZO59PD8m/iylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB6008.namprd11.prod.outlook.com (2603:10b6:510:1d0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 07:15:37 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 07:15:37 +0000
Date: Tue, 11 Feb 2025 23:16:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>
Subject: Re: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Test scratch page
 under fault mode
Message-ID: <Z6xK1aKH8Zdi/zGk@lstrano-desk.jf.intel.com>
References: <20250204181742.4055152-1-oak.zeng@intel.com>
 <20250204181742.4055152-2-oak.zeng@intel.com>
 <Z6o1xkp5oErv0daA@lstrano-desk.jf.intel.com>
 <MN2PR11MB4728B4DB54CF823F8ABBB86692FD2@MN2PR11MB4728.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <MN2PR11MB4728B4DB54CF823F8ABBB86692FD2@MN2PR11MB4728.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:40::29) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 22cf4926-586b-4416-f6b5-08dd4b350ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1iQEFjc+6/PaGRHc1V7thQZD3y1tIiFq9wA0wPoQ7ECohAtwCmF4zeaMpFKb?=
 =?us-ascii?Q?LbUHL7OlVpwJ9UdWGMnkXHlxwTwNFXnPDt8DG1HbEUoW8z41zsrbSmeZp+FE?=
 =?us-ascii?Q?Dsp/Rr0u7Z1MTLJvfH2wOwxa7TBa3R7OTy2Tr9i8NhE03Z9wzqultTTTuj85?=
 =?us-ascii?Q?S7hWwlBOzUuFOoxWCUg6HnxyeUs2GMRufpK+CcvPoG3AijDkld1U56x8F7vz?=
 =?us-ascii?Q?b87Etccbnz1rtKfpoyQHyHFwJwKMi7jPO+5iqczr1LhArbyBwdIz+UReZxTy?=
 =?us-ascii?Q?h7GWLZ13clGnRFO0VsFlbPrVWyliuPxfbwWZNt80Th8guUZTWiJunAXXjSic?=
 =?us-ascii?Q?mIElf+JBzANWr/zCb3AibKiSlzMa+zn2V1i5HkHX7KBKFX2Aob99w3pQ7ftH?=
 =?us-ascii?Q?XKvNcLUykMrvYRIMoyN0hteHdHMVKF+s7gWYBMeLjd0PwwDz5IrzemIXTp3A?=
 =?us-ascii?Q?sa0lEkyywtWbO3ogUms+EwIeCevQVEPLxYL8nCvbMLGcbezupotIZrKn/z82?=
 =?us-ascii?Q?poNzyGcHan5PzaITaK5bzCJA6CRSAm4AOs6nny//s4NWD0uy5LcdZZsTO8u3?=
 =?us-ascii?Q?DdfBXd+LXatHnmCJ7vob0oFDj8zzatO2eGLmtShzJ9I8LEYx6av2drM+QeG0?=
 =?us-ascii?Q?tBHfQ0HI499LmF5ecghY34yg1WlwFhU7Whp0WhIlprmyFObxUsormTQqsc/B?=
 =?us-ascii?Q?Ydut21k6F5QKC0xiRt5VGzuRq2YD/zMyh0/pqP2TscGJi59kKjkDlMR4WhMS?=
 =?us-ascii?Q?lRQE1vziti5TOtoxvODJwSYW2dAu1cDnAP4+rWCJWRC8+7deVSZA3Vex/KWS?=
 =?us-ascii?Q?cwYTgwYvGuJNCjMQmQuQHqPW3v27uatH/Ftg2sqQnw0TNpBluLVCxezFBjsH?=
 =?us-ascii?Q?l/CusTjVPnvy5AiDKmAnYfkPlK9cU/a+ZOfdkvAQjiPr1En8iLn2BL6MRSOk?=
 =?us-ascii?Q?l/IDO2GHXq/zg9bHLmryYORF1bliJXhvbkhL+0G6aP5z0yrsid3p5n/4/Tag?=
 =?us-ascii?Q?mkTz6Bx1JUzof5ckk2M+Y97tcavgMf0rva4HdQdF5ogn4V+pg+/BeAEfz1Xb?=
 =?us-ascii?Q?qCGaD7ifXmn8VuLiDM4X3Cw8KmXMCcf8KNAJLzBQQWebEnNPBVviwLuEq/Vb?=
 =?us-ascii?Q?cdBMpv9D9cMUzZ/3cNaDK+AOLMLc7ymh1vvtYxlABmcS08wX/Gg1wzvR+ZkM?=
 =?us-ascii?Q?7l8JJqdwcp9dy8vIrHC9c9KUVGRVQDmhAxzhNirMaJSEGxwlOk52Fvznw8lr?=
 =?us-ascii?Q?+uPgu4htmi97Xl6mXnjwrU/ZfX3W8SXGA41ETvWT2kmCugiS5E8f7iPwAZzl?=
 =?us-ascii?Q?wv9JqSfnD95OAvnz3AL6JGPKy2zU7lZXIZoXFmFNyMW9XOvtASF6wHB6qKZD?=
 =?us-ascii?Q?IPHyhwVsg7atsgzLHwDogylt0HqT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ROkqX9ineCVzssthk2hTYPsAgmT0f7m04gneoAZzB04fv5R22R/6YvT+qw7?=
 =?us-ascii?Q?HFvIRiWyTbQhYOp4Q+9B0mZgO/vEUP2fLRMh0XrHZbLaj3PEg9dEbEHn/CPP?=
 =?us-ascii?Q?4TAKTqLhNHqMDf2oMd6C6huxZVyzJpzdS9FcC/qh2/0apsEdGb0LViuKpMdU?=
 =?us-ascii?Q?MOXooZ8I5cFwKM9vBfKLeqHlVSVJGJ7IlpBMnS5hu/HL5Gg2ot6mLx/uUUA3?=
 =?us-ascii?Q?Krjy7IpT3pVVrywQEERvnY4/nEAFKeL21wai4vw/kSehUh+0J0+1eV5txfrD?=
 =?us-ascii?Q?ElZjGZe02eiBrD3GUxaSn0GutEEuS0qtbjFxTQCbTUUWiNpxiIKMe+CoCqZ8?=
 =?us-ascii?Q?qenG71Ri9EfeAi2RH2AkRXy50CT7Nr3sTamy0h14bgtpoGaSgstsbb5zYi2F?=
 =?us-ascii?Q?4XvtC6UKNNaI1wSuk0ntMyn2/SllzcruB4Km3+Fz/kLcsQ+iMsULykYlNDF+?=
 =?us-ascii?Q?L6dPpZ4rsFSzAJhcVhHJFu7YaeXUDyLOhxStnYjAnMbxthQbp1WctcuN1aNu?=
 =?us-ascii?Q?EwFf4OlYbD8jay2P7nstneKnMsIHpcgDjCigrtjb4c/hk3bMVdixxtuz5XRP?=
 =?us-ascii?Q?XAHDV5AUmERk3ndJaVeSHaKz036/7pzRsekQVK6kK1fUZ1dxkH/Slx1oVveW?=
 =?us-ascii?Q?Xzq5xitKUfsA1B94yBzngo24alxMe8Tk1G0TOR8h1pwjxV6Skz0sLrvyUa7W?=
 =?us-ascii?Q?h83OexYOzakPWupGHa3qu7tD5tgBJ69L+Unl14eDuT5SB9PPA4WkCZuplyKm?=
 =?us-ascii?Q?Dllx2pEDRFxVL+M5JKrEjw0dgnlevOJbX8DS9EKTvar+SMqeK5c6LMC9P4hK?=
 =?us-ascii?Q?lt9ipFwKfcoxMt0391+Dx3DdKD7VFLplw0bkKwcWVCJPrAR3WXsZPhJd+ZWK?=
 =?us-ascii?Q?pAt2g2yDUehi/k3H0Xyl5jBNKzRybJPDmDwfrg4uxlCNPOexXT8W4IakzymA?=
 =?us-ascii?Q?NS0IjVs0JfLylsV25umzh+Dh/n6zJM6eHWz4IpRema1ifzlr4ypCu76lXh98?=
 =?us-ascii?Q?tCLwQbYIUox3x8JSVyqqR8ircps1LT8fvR8Q/hvqXKfh3xVv0Tw/tXHN1ng8?=
 =?us-ascii?Q?bken/rQPYQBIzGCBNxDU3i0BYyboK2s8LbDdA9hXbY0cbJBycF4HrouLMDkp?=
 =?us-ascii?Q?4Fdfl3aNcRJcdAUFeHDNo2JvEUsOfDboq4rOumz+FiXx6DnT9kRqeqoTv/9G?=
 =?us-ascii?Q?1vPzFDbeknk7CLsdy5BojR7hYMKltvC65U4m2r+mSId3HwgzcxFeO+Zhh4a6?=
 =?us-ascii?Q?u+IRfAa96RyvBH6njj1EXUpOdjCBY5BlP4Pb8255ANOSRzuRJ88IQ2wkqtf1?=
 =?us-ascii?Q?T+1BPS7ykbnzbAVsW//CRSXJpbP/NGa+M95U/PERoLfSycWoRapAajUDi+ZH?=
 =?us-ascii?Q?qkfonOtUlO8PRTi7LtrfhdN4vYH/8ss79gUaQXUpG23We0nLAUyZwr5+nqV/?=
 =?us-ascii?Q?DIDTR+Pczfi8ByyPpYle0AsIUs3+ylm/eEGnnpgJYXjIhuhmnSgMJHn48avu?=
 =?us-ascii?Q?1L83Adu7miweuLzUecRHq6N+vnFquU0uIdEUijeT5xTsU6vehQ843DCKy6ll?=
 =?us-ascii?Q?r6BPwYUd3xwHXpAl6FwwkhVyGHnpG55FTWD/s47mKH6OCKxfIlL+gcM3LucZ?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22cf4926-586b-4416-f6b5-08dd4b350ca0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 07:15:37.4820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddF2whutWuQJDzKoZKNBBG6OTgA5QhemCbln2vNAX4W+/hg+xxamXT4ivX6hMbT5yxGsGiOZy5LIkPt5vnGoSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6008
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

On Tue, Feb 11, 2025 at 02:53:13PM -0700, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: February 10, 2025 12:22 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Thomas.Hellstrom@linux.intel.com
> > Subject: Re: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Test scratch
> > page under fault mode
> > 
> > On Tue, Feb 04, 2025 at 01:17:42PM -0500, Oak Zeng wrote:
> > > On certain HW (such as lunarlake and battlemage), driver now
> > allows
> > > scratch page be enabled under fault mode. Test this functionality
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > ---
> > >  tests/intel/xe_exec_fault_mode.c | 128 +++++++++++++++++++--
> > ----------
> > >  1 file changed, 79 insertions(+), 49 deletions(-)
> > >
> > > diff --git a/tests/intel/xe_exec_fault_mode.c
> > b/tests/intel/xe_exec_fault_mode.c
> > > index ae40e099b..935e6c044 100644
> > > --- a/tests/intel/xe_exec_fault_mode.c
> > > +++ b/tests/intel/xe_exec_fault_mode.c
> > > @@ -35,6 +35,7 @@
> > >  #define INVALID_FAULT	(0x1 << 7)
> > >  #define INVALID_VA	(0x1 << 8)
> > >  #define ENABLE_SCRATCH  (0x1 << 9)
> > > +#define ENABLE_FAULT    (0x1 << 10)
> > >
> > >  /**
> > >   * SUBTEST: invalid-va
> > > @@ -45,6 +46,10 @@
> > >   * Description: Access invalid va without pageafault with scratch
> > page enabled.
> > >   * Test category: functionality test
> > >   *
> > > + * SUBTEST: scratch-fault
> > > + * Description: Enable scratch page and page fault at the same time.
> > > + * Test category: functionality test
> > > + *
> > >   * SUBTEST: once-%s
> > >   * Description: Run %arg[1] fault mode test only once
> > >   * Test category: functionality test
> > > @@ -115,6 +120,7 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > >  	  int n_exec_queues, int n_execs, unsigned int flags)
> > >  {
> > >  	uint32_t vm;
> > > +	uint32_t vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
> > >  	uint64_t addr = 0x1a0000;
> > >  	uint64_t sync_addr = 0x101a0000;
> > >  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > > @@ -145,11 +151,11 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > >  	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
> > >
> > >  	if (flags & ENABLE_SCRATCH)
> > > -		vm = xe_vm_create(fd,
> > DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > > -
> > DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> > > -	else
> > > -		vm = xe_vm_create(fd,
> > DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > > -
> > DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> > > +		vm_flags |=
> > DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
> > > +	if (flags & ENABLE_FAULT)
> > > +		vm_flags |=
> > DRM_XE_VM_CREATE_FLAG_FAULT_MODE;
> > 
> > This is always set, right? I wouldn't add this new flag then.
> 
> 
> No, FAULT_MODE is not always set. Before this change, 
> it was always set for !SCRATCH_PAGE cases. Before this
> change scratch page and fault mode are mutually exclusive.
> 
> With this change, we can have scratch under fault mode, so
> I introduced this flag.
> 

Hmm, ok. It probably wasn't the right place to disable page faults in a
test which was intended to test page faults but ok... Let's not break
what is in place.

> 
> > 
> > > +	vm = xe_vm_create(fd, vm_flags, 0);
> > > +
> > >  	bo_size = sizeof(*data) * n_execs;
> > >  	bo_size = xe_bb_size(fd, bo_size);
> > >  	sync_size = sizeof(*exec_sync) * n_execs;
> > > @@ -405,59 +411,76 @@ igt_main
> > >  		const char *name;
> > >  		unsigned int flags;
> > >  	} sections[] = {
> > > -		{ "basic", 0 },
> > > -		{ "userptr", USERPTR },
> > > -		{ "rebind", REBIND },
> > > -		{ "userptr-rebind", USERPTR | REBIND },
> > > -		{ "userptr-invalidate", USERPTR | INVALIDATE },
> > > -		{ "userptr-invalidate-race", USERPTR | INVALIDATE |
> > RACE },
> > > -		{ "bindexecqueue", BIND_EXEC_QUEUE },
> > > -		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE |
> > USERPTR },
> > > -		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE |
> > REBIND },
> > > +		{ "basic", ENABLE_FAULT },
> > > +		{ "userptr", USERPTR | ENABLE_FAULT },
> > > +		{ "rebind", REBIND | ENABLE_FAULT },
> > > +		{ "userptr-rebind", USERPTR | REBIND |
> > ENABLE_FAULT },
> > > +		{ "userptr-invalidate", USERPTR | INVALIDATE |
> > ENABLE_FAULT },
> > > +		{ "userptr-invalidate-race", USERPTR | INVALIDATE |
> > RACE |
> > > +			ENABLE_FAULT },
> > > +		{ "bindexecqueue", BIND_EXEC_QUEUE |
> > ENABLE_FAULT },
> > > +		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE |
> > USERPTR |
> > > +			ENABLE_FAULT },
> > > +		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE |
> > REBIND |
> > > +			ENABLE_FAULT },
> > >  		{ "bindexecqueue-userptr-rebind",
> > BIND_EXEC_QUEUE | USERPTR |
> > > -			REBIND },
> > > -		{ "bindexecqueue-userptr-invalidate",
> > BIND_EXEC_QUEUE | USERPTR |
> > > -			INVALIDATE },
> > > -		{ "bindexecqueue-userptr-invalidate-race",
> > BIND_EXEC_QUEUE | USERPTR |
> > > -			INVALIDATE | RACE },
> > > -		{ "basic-imm", IMMEDIATE },
> > > -		{ "userptr-imm", IMMEDIATE | USERPTR },
> > > -		{ "rebind-imm", IMMEDIATE | REBIND },
> > > -		{ "userptr-rebind-imm", IMMEDIATE | USERPTR |
> > REBIND },
> > > -		{ "userptr-invalidate-imm", IMMEDIATE | USERPTR |
> > INVALIDATE },
> > > +			REBIND | ENABLE_FAULT },
> > > +		{ "bindexecqueue-userptr-invalidate",
> > BIND_EXEC_QUEUE |
> > > +			USERPTR | INVALIDATE | ENABLE_FAULT },
> > > +		{ "bindexecqueue-userptr-invalidate-race",
> > BIND_EXEC_QUEUE |
> > > +			USERPTR | INVALIDATE | RACE |
> > ENABLE_FAULT },
> > > +		{ "basic-imm", IMMEDIATE | ENABLE_FAULT },
> > > +		{ "userptr-imm", IMMEDIATE | USERPTR |
> > ENABLE_FAULT },
> > > +		{ "rebind-imm", IMMEDIATE | REBIND |
> > ENABLE_FAULT },
> > > +		{ "userptr-rebind-imm", IMMEDIATE | USERPTR |
> > REBIND |
> > > +			ENABLE_FAULT },
> > > +		{ "userptr-invalidate-imm", IMMEDIATE | USERPTR |
> > INVALIDATE |
> > > +			ENABLE_FAULT },
> > >  		{ "userptr-invalidate-race-imm", IMMEDIATE |
> > USERPTR |
> > > -			INVALIDATE | RACE },
> > > -		{ "bindexecqueue-imm", IMMEDIATE |
> > BIND_EXEC_QUEUE },
> > > -		{ "bindexecqueue-userptr-imm", IMMEDIATE |
> > BIND_EXEC_QUEUE | USERPTR },
> > > -		{ "bindexecqueue-rebind-imm", IMMEDIATE |
> > BIND_EXEC_QUEUE | REBIND },
> > > -		{ "bindexecqueue-userptr-rebind-imm", IMMEDIATE
> > | BIND_EXEC_QUEUE |
> > > -			USERPTR | REBIND },
> > > +			INVALIDATE | RACE | ENABLE_FAULT },
> > > +		{ "bindexecqueue-imm", IMMEDIATE |
> > BIND_EXEC_QUEUE |
> > > +			ENABLE_FAULT },
> > > +		{ "bindexecqueue-userptr-imm", IMMEDIATE |
> > BIND_EXEC_QUEUE |
> > > +			USERPTR | ENABLE_FAULT },
> > > +		{ "bindexecqueue-rebind-imm", IMMEDIATE |
> > BIND_EXEC_QUEUE |
> > > +			REBIND | ENABLE_FAULT },
> > > +		{ "bindexecqueue-userptr-rebind-imm", IMMEDIATE
> > |
> > > +			BIND_EXEC_QUEUE | USERPTR | REBIND |
> > ENABLE_FAULT },
> > >  		{ "bindexecqueue-userptr-invalidate-imm",
> > IMMEDIATE | BIND_EXEC_QUEUE |
> > > -			USERPTR | INVALIDATE },
> > > +			USERPTR | INVALIDATE | ENABLE_FAULT },
> > >  		{ "bindexecqueue-userptr-invalidate-race-imm",
> > IMMEDIATE |
> > > -			BIND_EXEC_QUEUE | USERPTR | INVALIDATE
> > | RACE },
> > > -
> > > -		{ "basic-prefetch", PREFETCH },
> > > -		{ "userptr-prefetch", PREFETCH | USERPTR },
> > > -		{ "rebind-prefetch", PREFETCH | REBIND },
> > > -		{ "userptr-rebind-prefetch", PREFETCH | USERPTR |
> > REBIND },
> > > -		{ "userptr-invalidate-prefetch", PREFETCH | USERPTR
> > | INVALIDATE },
> > > +			BIND_EXEC_QUEUE | USERPTR | INVALIDATE
> > | RACE |
> > > +			ENABLE_FAULT },
> > > +
> > > +		{ "basic-prefetch", PREFETCH | ENABLE_FAULT },
> > > +		{ "userptr-prefetch", PREFETCH | USERPTR |
> > ENABLE_FAULT },
> > > +		{ "rebind-prefetch", PREFETCH | REBIND |
> > ENABLE_FAULT },
> > > +		{ "userptr-rebind-prefetch", PREFETCH | USERPTR |
> > REBIND |
> > > +			ENABLE_FAULT },
> > > +		{ "userptr-invalidate-prefetch", PREFETCH | USERPTR
> > |
> > > +			INVALIDATE | ENABLE_FAULT },
> > >  		{ "userptr-invalidate-race-prefetch", PREFETCH |
> > USERPTR |
> > > -			INVALIDATE | RACE },
> > > -		{ "bindexecqueue-prefetch", PREFETCH |
> > BIND_EXEC_QUEUE },
> > > -		{ "bindexecqueue-userptr-prefetch", PREFETCH |
> > BIND_EXEC_QUEUE | USERPTR },
> > > -		{ "bindexecqueue-rebind-prefetch", PREFETCH |
> > BIND_EXEC_QUEUE | REBIND },
> > > -		{ "bindexecqueue-userptr-rebind-prefetch",
> > PREFETCH | BIND_EXEC_QUEUE |
> > > -			USERPTR | REBIND },
> > > -		{ "bindexecqueue-userptr-invalidate-prefetch",
> > PREFETCH | BIND_EXEC_QUEUE |
> > > -			USERPTR | INVALIDATE },
> > > +			INVALIDATE | RACE | ENABLE_FAULT },
> > > +		{ "bindexecqueue-prefetch", PREFETCH |
> > BIND_EXEC_QUEUE |
> > > +			ENABLE_FAULT },
> > > +		{ "bindexecqueue-userptr-prefetch", PREFETCH |
> > BIND_EXEC_QUEUE |
> > > +			USERPTR | ENABLE_FAULT },
> > > +		{ "bindexecqueue-rebind-prefetch", PREFETCH |
> > BIND_EXEC_QUEUE |
> > > +			REBIND | ENABLE_FAULT },
> > > +		{ "bindexecqueue-userptr-rebind-prefetch",
> > PREFETCH |
> > > +			BIND_EXEC_QUEUE | USERPTR | REBIND |
> > ENABLE_FAULT },
> > > +		{ "bindexecqueue-userptr-invalidate-prefetch",
> > PREFETCH |
> > > +			BIND_EXEC_QUEUE | USERPTR | INVALIDATE
> > | ENABLE_FAULT },
> > >  		{ "bindexecqueue-userptr-invalidate-race-prefetch",
> > PREFETCH |
> > > -			BIND_EXEC_QUEUE | USERPTR | INVALIDATE
> > | RACE },
> > > -		{ "invalid-fault", INVALID_FAULT },
> > > -		{ "invalid-userptr-fault", INVALID_FAULT | USERPTR },
> > > +			BIND_EXEC_QUEUE | USERPTR | INVALIDATE
> > | RACE |
> > > +			ENABLE_FAULT },
> > > +		{ "invalid-fault", INVALID_FAULT | ENABLE_FAULT },
> > > +		{ "invalid-userptr-fault", INVALID_FAULT | USERPTR |
> > > +			ENABLE_FAULT },
> > >  		{ NULL },
> > >  	};
> > >  	int fd;
> > > +	uint16_t dev_id;
> > >
> > >  	igt_fixture {
> > >  		struct timespec tv = {};
> > > @@ -466,6 +489,7 @@ igt_main
> > >  		int timeout = igt_run_in_simulation() ? 20 : 2;
> > >
> > >  		fd = drm_open_driver(DRIVER_XE);
> > > +		dev_id = intel_get_drm_devid(fd);
> > >  		do {
> > >  			if (ret)
> > >  				usleep(5000);
> > > @@ -508,6 +532,12 @@ igt_main
> > >  		xe_for_each_engine(fd, hwe)
> > >  			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH |
> > INVALID_VA);
> > >
> > > +	igt_subtest("scratch-fault") {
> > > +		igt_skip_on(!IS_LUNARLAKE(dev_id)
> > && !IS_BATTLEMAGE(dev_id));
> > > +		xe_for_each_engine(fd, hwe)
> > > +			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH |
> > ENABLE_FAULT);
> > 
> > This is a good start but we really need this section to roughly do
> > something like this to get good coverage:
> > 
> > - Run a batch with a scratch page access, wait for batch to complete
> > - Bind scratch page access /w immediate cleared
> > - Run a batch with access to newly bound address, wait for batch to
> >   complete, verify access worked
> 
> So bullet 2 and 3 are already in the test.
> 
> I looked how to add bullet 1. Adding it to the existing xe_exec function would
> make the codes very very hard to read and maintain. So I decided to add
> a separate function to test scratch page. This patch will be dropped.
> 

I think this patch has value - the point is single data path with
slight tweaks.

But yes, targeted test (i.e. a new function) for test case I state above
also makes sense.

Matt

> Oak
> 
> > 
> > 'access' here likely is DW write.
> > 
> > Matt
> > 
> > > +	}
> > > +
> > >  	igt_fixture {
> > >  		drm_close_driver(fd);
> > >  	}
> > > --
> > > 2.26.3
> > >
