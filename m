Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37D7D26D94
	for <igt-dev@archiver.kernel.org>; Fri,  9 Jan 2026 19:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745AB10E36E;
	Fri,  9 Jan 2026 19:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCyNVw2I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D2010E36E
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jan 2026 19:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767988165; x=1799524165;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qWVABlH3pn4DNXxAM7s5ratY010KYAHT6Q0Ef04oTE4=;
 b=dCyNVw2Idgz5X+ptoecR7XfEM8Vm94t03u8YZKPLGWMYmGedNbOr9D/Z
 4puKC7CYRM+CTTjRceJrLfBywv00IhxYIHbRIGURHi3osIJj+asLvNhmd
 dGI8HSZZoEQ0ZDDwOliEYpo+JCQnDpE1e2JQM5WbJCD/2bYXPk3rAYoI9
 LQIldLduIeLE0DOGqVNASneuhNI8eJRwnVqvJBHhpli38tLDHv7OZfSAR
 swqp23koW/p1UEgfLiZr+K05+5Ma5NHhrKQ8LqgST6CIvuvXiC0ZP8+BU
 93I6E1AdXKV8OYahQutoy41WbBp4NKLiqNOhR4gDvILplQ7ZoDnje6tnm g==;
X-CSE-ConnectionGUID: sdleASpxRFaHdbLlkKU/wQ==
X-CSE-MsgGUID: de7BHcwlTcKX4gv3vRnSTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68573878"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="68573878"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 11:49:24 -0800
X-CSE-ConnectionGUID: pC2qnrfnTBOj1nbbkVEREg==
X-CSE-MsgGUID: 0oxIrQX9Tsuz8D4LkF/TKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203559623"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 11:49:24 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 11:49:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 11:49:23 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 11:49:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLP2gkVpc87eY9GpUcWm56aVia0gbQzAMxK4UKA/Adgsp3/RuV2c7I16/RjL51cEHjABcmoim9McLdKurPuYb/WLokWvEUd+vWBbLapF+tEmKgNn806g7hwQcJCpgXrxQi37C1sNeyANUD770lqNa3TGUNrPDVC9+NqSd1QtRX1X9PnvhhV5RbkPF5/TUyAZvJXuBIUSObUv6UEy71HqDW4W0jNb0AAIh36MFpJ6tJcoyH862ni7wTGjODWnW7UKd1AjOqyLyCHQJA5GTHvYkBnWmYKFaOuwg9PBUEJeAjnqmp4YpIGR5ZGrquMmIoWO/F+U86jF1H2pGGcIynSiwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovBJYYPifNv0AQLIwb7htZpkLMVydTEIqdQbMJU2UUM=;
 b=IqN5I9uWbWmt7P0TEUedSoRFZL9r9ErZnekp1+W17a91eSgDWRuTBnX3IOUgaO3LHPwcMpfOG1dKuj7f6QmJmf1M30acUdOe7LQdl1FVODGOvVEIA1cTaFf2WwfNtaj2+Nlxu8h0at6mErSR09qwSVrQtYHreqPVVrU7bWyx4R9/P0aGVwXJEEkz4S7zO4mfNpWWrtT6sIffxAi8KIIZtGD9vLphdfcx9zxHrN/amhS0h9qjBWCBmULiNSEUE/Ri3ogQhh+/T76pESS31ArC0QIsNA2cPdy27hPjCT1altk5i5a4wxk/sLgJDSMqcuEsMl6viiKWdNb109V36yTkXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7098.namprd11.prod.outlook.com (2603:10b6:510:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 19:49:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 19:49:19 +0000
Date: Fri, 9 Jan 2026 14:49:16 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <marcin.bernatowicz@linux.intel.com>,
 <satyanarayana.k.v.p@intel.com>, <jakub1.kolakowski@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_wedged: Skip subtests using
 wedged_mode=2 in SR-IOV cases
Message-ID: <aWFbvH9adujEppZV@intel.com>
References: <20260109154834.24523-1-lukasz.laguna@intel.com>
 <aWEp_0V17tT7PRte@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWEp_0V17tT7PRte@intel.com>
X-ClientProxiedBy: SJ0PR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:332::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d176679-73ae-4745-8e0b-08de4fb82ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1Et1ZJ4oDFgXljOe1mZbdJQuXABxrVYcuC171wK+ezOedjPQNDV2N7sGOmzc?=
 =?us-ascii?Q?J0HdymxO6Q6ivqjSHJ6sUKr66opoMEFfGgC972HJwcYKYUOuSkqjYoViT8BG?=
 =?us-ascii?Q?FpzUTvN9AabV8huk89f9mB24a0YkrSpOPvb1axrYsV2wl5rztIRgeXxCuO7D?=
 =?us-ascii?Q?baztHR2o4njkKGIDMrzGV6tRHc4Y3Riz6pampiglsXVjGDQQH5QsFxY8nMv1?=
 =?us-ascii?Q?oaiA03lidCH8ZGBLXcFEtF7L0ohg9iKa4/xhopjZrIBlIKerOTJm/U3AnyRo?=
 =?us-ascii?Q?/7+ih+811dNpUVXlF4RgQFIMt+XrUXoRJ6jFQoS1NDRNoFjY/fEaDmI/pM5l?=
 =?us-ascii?Q?QdlH0VKEvlQB721TXSi5Tgt47xMSdcaczp25qYVPqt5GjpO88+bkIwolLAjs?=
 =?us-ascii?Q?8DhIsN6coIBl24PQ2NwrBBbu0RsdpYwMXKvsPmAgeXs6v8Ro7nq/q/XAbQek?=
 =?us-ascii?Q?UkFgTBw/P877NZrwh/CzVm5G3WeJEJCTciKCCB2ms3rIaNiCjM8hbeqtOcTx?=
 =?us-ascii?Q?fJiMx0Y381qV616aq2mh6E0oAQe3Kumq6oZeQsrAsbNv7hWtIgpJAS30lUjY?=
 =?us-ascii?Q?037uMgz4egRtSgw8qxHs8aHNhnXHrzpBPfWPIClqHbNNj8/XQy6QdNvvqU9h?=
 =?us-ascii?Q?CTH31nxeAPunv67xjiTbwKMHX+Nv2z5bOmpwpRWU/PenumB1jB7/T53L0nSO?=
 =?us-ascii?Q?rkoHEEGR2dMccopbxD3iRlc772XNfJGoA2nuMNjDJOYdIaXJXw2NVRxsGqla?=
 =?us-ascii?Q?8kTSvxuWrfajxqHYhXsmmGElcJBt2nG2ZoD0u2gZAvBOJbAHSiqjvjJqPIka?=
 =?us-ascii?Q?S05iuBM+gMYeKn8GzTkZ0oPXiCnXRm90bKsaQis4GOs3t+DxiJt+MJGmwHcO?=
 =?us-ascii?Q?3U83ar6j1Z0PfoeN0q5ii8bSpzmlmtEcosKGql0RQqtwCph3iRdm431TWGEl?=
 =?us-ascii?Q?S/3zxt31r/NuLH3ei0PpbK6lfHXIAKDxu0ga+37lqfj9DcNgsjTLv6aCpKJz?=
 =?us-ascii?Q?btpzP9FtoEtoCx7UxkVk6B9tYqltuvUqrIAuMxfrLDfjRXzFdIHjZUXoFDLd?=
 =?us-ascii?Q?62fKpbnHNFQJsZN1glTdQ/HuI0DWdSIcXocBecdyz3ArYhOuhS9QLiBrO9/X?=
 =?us-ascii?Q?KM7pW877S6L2jCrYUjG3I7iApBaEjCCY3pBwk4jveea40T7BYGx6pMSciq/l?=
 =?us-ascii?Q?VAQ95CIGS7xfNmU0dFYjVdwdmlMSPuev5Cy6b+da+HDoe5HkwEehyL/hjsjj?=
 =?us-ascii?Q?ntJecKje4sgCAH0dz6r3cvLO4QNQD3G9fjCGB4nRC1NkMa5Yxy41ms91gY6J?=
 =?us-ascii?Q?/GSzblnx1uGpG+uqiRens2MSMtjfd1hI48p/8otYMrkHYvoVucu1479xJTWe?=
 =?us-ascii?Q?e6wKY4CrKPmuMVfaXnk7uhh/si4FUZSvYI3reCeeQTi+ELcOqYPdRwSNfPUu?=
 =?us-ascii?Q?BsaLURBeF0mTBMjQefAcPL1DmCUZKB8wHqpf5efJMsCJA1EeLL72Hg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gWH2zGLz5BtcBJy3rr5JFcAfH5YMczWnCCRNC7OI6OYphupvuxHEv6lFhCuY?=
 =?us-ascii?Q?OqvRJGDYheU0/ZCR0CsrBWG+VaI7VepQoqcnCpRrRTqhxSqqOHhEdVV5J5eD?=
 =?us-ascii?Q?mZG6CYbn02bJVZcXPLCi+++//zyv3mB41CgJw8O3egE4RnjPTTL+y5+XoFYI?=
 =?us-ascii?Q?sml7CyuSjZULRqg06Wro7TPn8xAiY8pgxB8q4wyRQIvHMF9xK6ORx4fRExvW?=
 =?us-ascii?Q?pUiaVQ8HTm4QjnM9j5A/Zk3LEj9nM3tKGNorL/h/Mgm9T5DoawIbyE1/2zAz?=
 =?us-ascii?Q?esPIrrstUZP9WEy2SkQkyI2HGuVQKWTuabB5kOZ2I5nhIsuHUVoN/RNUM2M+?=
 =?us-ascii?Q?+MDyWpuGC1WAbc4KbZdq6vdnGgj7XhtqKKSLrT4heLiMW+KqddxlnNdIaK3F?=
 =?us-ascii?Q?VsuaEJi3O0tFlvFWvRxV0RQgyd0sJLX7fP7FyevugieDuImGagrL/MyQlIR/?=
 =?us-ascii?Q?i8oPJIn6LPnt9U7YWv5uP5i4y/WXz0K6xLBhU9InPs3WTTgVspKlelfTJe/V?=
 =?us-ascii?Q?2SwhEvveHE97RWKHmPiAI+nkTjwgFNfLq+3lDOCcwgs1uqmVkMDdaHPuhEke?=
 =?us-ascii?Q?m2HBDYnE0XaF0wBfSvImCBve8vrq+3vQ6AKk4+YQR5ifkShFfBKgmdeTIC0f?=
 =?us-ascii?Q?DM8Xf2filOF7jIoRTutUxLp52ERTwKvEAP/lwBeFJZF2VArV7IDuF5DlNDyq?=
 =?us-ascii?Q?vvZlZtyha50VfpIzSVFmKJLcZ2VuRhw4GFbxmzIseZdymmSoI4uQIlzI+blN?=
 =?us-ascii?Q?93QIQcaC8qW5MGngMH4zdlYP3/26e1d2VUXKecVnmrb+KrmMbqigiGrnUbkB?=
 =?us-ascii?Q?3Vhrg6nCKyGEzx3FOqzzK2a7059qQhObcAYn9hPXXbS4qY7hRO/PX94s4HCi?=
 =?us-ascii?Q?KspJA1BOICgHYa8jJArRxsgyEoC01+xpI4jwLKAiGcK9V2H8CIRJPzQUjy4q?=
 =?us-ascii?Q?eZagd3ql2b4zLxC8alye3jc8bwYyAdAwIrDAVvCsDkCLPdEPnp6ZNNMoo/6O?=
 =?us-ascii?Q?cQJqm7xYqBkF+k8yXGBqVaQ2eRBCTNRnG83zzkQ9H5NsN/6iW25bOwPk4RGO?=
 =?us-ascii?Q?BgF3fTuMqWl7NcikTIrGQWr7mufuVdpwTpemOAan4aeo9nRJN2H5X3s9IUKk?=
 =?us-ascii?Q?Akyf59idNasXypLTkg4ytSm1ICKhvZ/gn53dLOGslMTAZT58odmNmziarkAR?=
 =?us-ascii?Q?8t0fTHAGU1Oe1PYLK+7Q1u0Z9IfetL7e/Gq1m8pxQ+7wZqZrGUclOL0g8BQC?=
 =?us-ascii?Q?ED0N1+ysfNEsC8BT7vxlkkn+ZWhxmwrqcwdIxRQj6Su2QYtHR9y2r8Z2CcAP?=
 =?us-ascii?Q?bgCryR6pj72VNqN7tU4XPX8RUVs2OBqhlAo7ELi2gRwlwg9bqxSNgCgiyYSq?=
 =?us-ascii?Q?BpFpBRXhnE0zWb86d8R/SvgaIZe2hiCWXIJbJQa1RaXJBXBxjrQgG5CWnsqV?=
 =?us-ascii?Q?Z7mnrJkcWb2zKZq+s47lyS0yQcOgfSEwHCWarlX0uwQstoyIXiu72jUhwnr4?=
 =?us-ascii?Q?DPOCQNcpkqJiHBXK280aHpAgq3yJXrpms7rd5eO0DdB9yQ+e4HFwPyryioK6?=
 =?us-ascii?Q?pneoCs3vCobdJCbMLVIZe4L5OBtnAq01o5oWgFpVVmLOiLNm2eAP/tKsSPe3?=
 =?us-ascii?Q?HOSDoVRWHoUWFYtOPh9zVMF0fR6REcBX5qWuySAIvisOyoBCuZ7TEbuz1E5d?=
 =?us-ascii?Q?wG2x4uVJFM2Efeo8KbBy0tRJNStFCsfVhfQqkovGgKdYnZv8fgahQz/TGnrE?=
 =?us-ascii?Q?C01qd/1Ftw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d176679-73ae-4745-8e0b-08de4fb82ded
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 19:49:19.8492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZ1t0BaCOLqi4YFTqoQ0XwSohIuLhMKv2rmIJnfyK0Z1BWmmj9wVhLKY9NFVFY8DpvXYmDww0W+xcKXh+vfFXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7098
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

On Fri, Jan 09, 2026 at 11:17:03AM -0500, Rodrigo Vivi wrote:
> On Fri, Jan 09, 2026 at 04:48:34PM +0100, Lukasz Laguna wrote:
> > In upon-any-hang-no-reset (2) wedged mode, engine resets need to be
> > disabled, which requires changing the GuC reset policy.
> > 
> > VFs are not permitted to modify this policy, so the driver now rejects
> > attempts to set wedged_mode=2 on a VF.
> > 
> > On the PF, modifying the reset policy is allowed, but the change is
> > global and affects all VFs. To prevent unintended cross-VF impact, the
> > driver permits wedged_mode=2 on the PF only when the driver is built
> > with the debug config. Otherwise, the operation fails with -EPERM.
> > 
> > Update the affected subtests to skip in such cases to avoid false
> > failures.
> > 
> > Link: https://lore.kernel.org/all/20260107174741.29163-4-lukasz.laguna@intel.com/
> > Link: https://lore.kernel.org/all/20260107174741.29163-5-lukasz.laguna@intel.com/
> > Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed

> 
> > ---
> >  tests/intel/xe_wedged.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> > index bcd78b49d7..e1ac629ca7 100644
> > --- a/tests/intel/xe_wedged.c
> > +++ b/tests/intel/xe_wedged.c
> > @@ -18,6 +18,7 @@
> >  #include "igt.h"
> >  #include "igt_device.h"
> >  #include "igt_kmod.h"
> > +#include "igt_sriov_device.h"
> >  #include "igt_syncobj.h"
> >  #include "igt_sysfs.h"
> >  
> > @@ -247,11 +248,16 @@ int igt_main()
> >  		int err;
> >  
> >  		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
> > +		igt_require(!intel_is_vf_device(fd));
> > +
> > +		igt_debugfs_write(fd, "wedged_mode", "2");
> > +		igt_skip_on_f(igt_sriov_is_pf(fd) && errno == EPERM,
> > +			      "On PF, upon-any-hang-no-reset (2) wedged mode is restricted to debug builds only\n");
> > +
> >  		ignore_wedged_in_dmesg();
> >  
> >  		hang_sync.handle = syncobj_create(fd, 0);
> >  
> > -		igt_debugfs_write(fd, "wedged_mode", "2");
> >  		simple_hang(fd, &hang_sync);
> >  
> >  		/*
> > @@ -282,8 +288,12 @@ int igt_main()
> >  
> >  	igt_subtest_f("wedged-mode-toggle") {
> >  		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
> > +		igt_require(!intel_is_vf_device(fd));
> >  
> >  		igt_debugfs_write(fd, "wedged_mode", "2");
> > +		igt_skip_on_f(igt_sriov_is_pf(fd) && errno == EPERM,
> > +			      "On PF, upon-any-hang-no-reset (2) wedged mode is restricted to debug builds only\n");
> > +
> >  		igt_assert_eq(simple_ioctl(fd), 0);
> >  		igt_debugfs_write(fd, "wedged_mode", "1");
> >  		ignore_wedged_in_dmesg();
> > -- 
> > 2.40.0
> > 
