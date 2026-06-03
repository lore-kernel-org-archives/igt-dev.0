Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDBBCD6E64
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 08:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3477D10FA52;
	Wed,  3 Jun 2026 08:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMDYBe1L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE7A10FA52
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780476160; x=1812012160;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vjM/2wwHxbQPk0UTeN7B97e3RyOe9FUVYsmQXZaDQ7s=;
 b=CMDYBe1Lp7Qyvv65wLDEGRcJZyW29Xu3cS0w+1VSqUcd5yKY4iG2BRMD
 y7Ya0lzAuWpjEpbOiGSePILut4UKxzAgRLUYYwmUu5DeWVMPNbswFJeRG
 B4mF9DSiOzaLdeS+kGh+GUCDX/XyRJRgRTemXe1mTu2snzE9QWbw0zFYp
 gJ8MwSd0D9HlHoNsj0zYuorak1I43ZHIDIw/kVQeZ62ttXgaiBYlH8LOx
 ePbDT/u47oHRkIc+x1Jix/sWNpdeF0Obo7Tb2ySc/QH1yCm/M4ObRsWGW
 Nvlh5lYABAIsJopkDV05JU+Wbobbk5k3ehiP4DwVzLvRYpdkFqSMbqfyu g==;
X-CSE-ConnectionGUID: q1ndCAxuQi6SVYYZkjeKNQ==
X-CSE-MsgGUID: rh3rDfewQ5mdVDLSb66DMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81180443"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="81180443"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 01:42:39 -0700
X-CSE-ConnectionGUID: myyNwDmhQmuryzH05FE8Sw==
X-CSE-MsgGUID: dCoG9u2qRYW/iRXQ/cOsHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="248104976"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 01:42:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 01:42:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 01:42:38 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 01:42:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfHpnpN9jNqzjYfabDTi23btQd8vDmCqezzNF7aI4FRVh/w3GzUP3eQCBwCMqPlXf+SgewGjgUAibw2bI6pVS5PBWlNf9UCo+davArgy9nNWSJF6Qx0uuGE/SqeJKaKWBZ6JfQ2uz7l1z2JZ6qgvTNTJTePRv6tV50m8oRnjGu6BEFA/AfioU2qPPqWobu0/S5n3quzEnFiLgvun5m8+x0OMaQGeOkaFLvEdlY/pNGBQ2m+fDtcFvf9A5M7glWH1w8Qo6GcSB09QJ5CV2pI2JJ+kE77S2WA9ClFR9XgO+nZPMjsyxkP+LzW9bIHYhfMhm8zwMTOEbi4RW+TjST3MeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y42ES8Jpczg8sWUZIjP0gXuB8zuz06lCOoaPP1oAo/E=;
 b=v0ITolz7B5VPixvzZ6HjVjGcW9cSbRQSXwJU5LFBNEPgpA5deHVdMsxDFF1I/uSnICPsidDPWUyRs29M+HlphNFpI2ac2b07/hBBIkOvEDyo8S3g4/G9ngB2Yg7yM36a4w45XvgavIE9JjHXdsTwgo1WAa8DixSfXz4kFXEoXzFcqNUcIshdP92XNALdoFWPhBVrQEwqkZzw6eNPbIIWfd64dcw/qsSUEmB1/3GkPFn+SwNEIvc2fcODNrmTvWB160sGKt6G5EYcjfz07dgNWLmmDrJSPopEhiHkkWdKAX4hGpO1OqzqiAennlcr3J19xkeRNHRYZmUWvvELGsC8xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 08:42:27 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 08:42:27 +0000
Date: Wed, 3 Jun 2026 08:42:17 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: Re: [PATCH v6 2/2] tools/igt_power: initialize xe_device cache
Message-ID: <ijujmjdq4jsgmmhzx6hoiusfqvm5hmvuhj77mn4a6ne4dq2l5b@bmhebag7p3su>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1780397630.git.sebastian.brzezinka@intel.com>
 <bd84c34f6e2a65c01c934f6165bdba51e67351a4.1780397630.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <bd84c34f6e2a65c01c934f6165bdba51e67351a4.1780397630.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TLZP290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::10) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|CY8PR11MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: c83e223f-683a-423c-0138-08dec14c0aa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|11063799006|4143699003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: SQ1gWqPmh+ft12MAXE+DFSOQEPI99xRB6unEBYuzJWv7Fg3tRLecL5h19jdYoKE7xsYFSjr83pj5r2lpdz2Bnp1yd/+XepieAYKuqffR7iQqoydlwIYE8mopX1Pi7T7ziOt4V3S573M6F1jJlcGfqrqFfAT0wu96RJmFrkNFcdm5yYhBVtjstY3zvNTyUJFCulxmMunt7ho7KSfi8YA2y8WiYZNztH1SGtF7vFGeFrgvrvr9o1Lj8254JvphkD1wIe1PvYT9MVtqSuvrm5wd9RnTeH6JERTZyTBgAr4gsEC7HFivXfKmv7STMsyJXpDDYwOSIvSDVA878mXko8H1J27AzDJvZhOAXroDF3IswhGWMP5u/vnBqIzK+E8hudVVfS/V//UdJNi/SjmKaxxKhjyubVPmmmEfoWyH8V4XsliHlFyGP7gEQWLxAGrZV5Q86+xzVWZxCeE89cYPLVCOLfe4DkyYEzZ67Sla5fE+GYO7xspwVKocW9bvMdgZCNBfmMYpaLZaWXH+69lxZhkTm6D+lXrHmuC31RaDfYIpQgxsNjMi2iu2DQ9B7DDO5oUogvuoymKujHBCktkFos1pihcTzUCWNU/+OUSUZyLK6Ouswv4AH+jXi6Y9NW4AuzKuywZGqo3UlG8/DXQMFkRNiUJzn36JvNTeI+jOkDfWOg2RR4aeY6D5IUu8JFzuTZH9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(11063799006)(4143699003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXlDSWhsMFJBK1o5VnVieis1M1RDZEd2UTAxRytqRUZvT0xCOVlyK21uK3Ba?=
 =?utf-8?B?UjloQ0orS1lHeGxkeUljQWFQREZoV1JsbHE3Szd1MDhUeVZuWEVJc0dDWmRw?=
 =?utf-8?B?SVFFb1c4ZnBLNG03QkMzZTRoUzk5Mk4rcDBNZU9xYXdNV2VNcVREMW5zdHNp?=
 =?utf-8?B?L2F4czkvbkZNZm1uclhHOEU1NXp3dEhFUE5xZEIvdmIydkl5cGhCY1hrRGFJ?=
 =?utf-8?B?Nm83SlNIYkViQVh0UFlkdDVqN01pRlBqQVM1YVhkLzBKak1CV3Q0NzIzK3RB?=
 =?utf-8?B?REdSVTVRYldKV2NuT3A0enVRM2NtaFJDSHVkVnI1cVg2MnpET1BnTnUybm0x?=
 =?utf-8?B?QjVlUGFmbzNCSVZxUkJqWW5pRGZWcWZwd0c1ejV0VEsyOTBINUJpZSt1Q3Q4?=
 =?utf-8?B?NVpMeUZHVHVxR3NRc2krMmFVcTBJM0xNTkc0enJKaUhITDNHZFROUjhFUXBo?=
 =?utf-8?B?ZFR3YmNwYlZNM0RnN2IzL25lMXkvNGdXOExSNVdjVzg4aU5PMVBDYnoyRmtm?=
 =?utf-8?B?R0Fhak9kMFhUTkgvWDZ1MTFMRlNpSmpHNHZoWmNibzNrVU9hWDZ0RFZ1ZG1I?=
 =?utf-8?B?VjgreURzUmM1RW13bjFzLy9hcHR6UFp4VkxZRzBXRC9aUkdMcVhnVkpmQzdU?=
 =?utf-8?B?eGU5OUVZd2EvSVl5WGF2Q3hTS0Y5NzZsU1RZa3FxWitBZFZBQ0R6dGxYa2F4?=
 =?utf-8?B?LzhVQnF5UFE3NWNtNmxKZy9KVUs3YjhLZFRIak1lbE14dVFvK2NXc0F3ZWlB?=
 =?utf-8?B?MTRBYndnZVpqN2pkMElFSzc3Zk5UUTEwTzFHVytUNkRTSXJscVhBRjFKWmRC?=
 =?utf-8?B?b1NyRktqeDhKSWFud3o3ZHIvZEZpd1ZxUFF5V1p5S2NabWt5blpmNWZldXo5?=
 =?utf-8?B?QXhEYmhCdlIvalJQdXFLOXlMd1R5ejlHYitoOGlnQ1hqV3MxOTZiVVpVYjhE?=
 =?utf-8?B?L29HeFVXQkcwby81My9iSzJjZld3Y3R1K2o0eUVhZFU3eVlmSDRsbVVnWk9v?=
 =?utf-8?B?V1BCRDdjRXVKRHQzaHJlT1hqQkd1VVNlN3ZSbWRQK2xQejk0Nkg0US9oZS9n?=
 =?utf-8?B?dW03NEoxSDN5N2dtWmVpU0RwNTM5ZkxHeDFXeW83QkhVMkxnOFZEbTc3L2lW?=
 =?utf-8?B?RDVERnNCc2Q1K0VsWVlDNGMyMWluczZuUFF6bDI0UGp5YW5Pa1RUak5yTHY3?=
 =?utf-8?B?UmRDL1Nsc3llWXFydHhNSW9sQnJkWWZVbWRPQWJFeHcrSWt4Q25xK29KQU9W?=
 =?utf-8?B?djdtTlAwVE9WWHYwWHZZQ1hhVjNzNmZWMTV0Vk45M2ZkK0l2RGg2bmRPdjQy?=
 =?utf-8?B?WE42RGtwbUJid2dURVRBR0Q2VmlCdFFsNFpuN1U4MXZxa28xZ0FnTWRXekNi?=
 =?utf-8?B?UWJUY1AzVFdESmZhRnhwb2dmTGxLUXdkcW84b1dNc0QvU3ZXbHdickxTN0FZ?=
 =?utf-8?B?SlJiYmZZSTlQYytmeVh5YUJtMVBMalJkYTlWdkhoYWtRc0JjVGhTY05CSXho?=
 =?utf-8?B?eFhhYTJZWnZWMU5EUEROMFg3WHAzakNWT1h5eGVlbHQ3QUhtKytva205bzQ2?=
 =?utf-8?B?eHV1MFdmMWFzS2xvb0VhczdGV2trbTNUdHQ2dTBxRnlnMytWR05SOUdocFkv?=
 =?utf-8?B?bWQzYmpvcy9ZR25FS0FQbW1BZ0tBaTBGazM2UFN5R3BlOGJtZUkxWUVMZldu?=
 =?utf-8?B?QUl2czFRQTJZYlpHNlljQ1hnN1Zma08xMWMybk9CTVY2Y3diYlZYVzZ6UVph?=
 =?utf-8?B?NFJVQ1hGSUNVSGY0ZUV2NEQzMG9CcENxZ2hiS3dQQUlZRzh0ZGpubWdSR2Ur?=
 =?utf-8?B?NjNLWUpzZ1djMVA2alBtRzlyem5DQTJiVGtHbXp6NnVST0UwZ01tS0N4YnQ4?=
 =?utf-8?B?WGoxb0M1S2ZOcFdwWmNZSzk3Y3ZhWk1tNmZ0ZENGRllUbEcrRitmM1FtNVMw?=
 =?utf-8?B?N0VKelAwbEY0TDVPby9xWUFtRXhBd1d1SXF3bkwzb3ZEWC9CVG9RUDM2bXY4?=
 =?utf-8?B?L2dYSjdDdVFEa0R5MkZxaTluOFpGWUR1djcwSkRoZUNoNzdZMzM4RzBpb01I?=
 =?utf-8?B?RzJYbGV0OWlpeEU3Ujc0U3E4ZUVKMGtvcU5QMEkvOVJTc0tiMSsvU2t2ZXc5?=
 =?utf-8?B?WkFISUlMVEYveWZzZisyWHFnREk1eHRoRTdyQmhRNTF5elQrSXZQaHlLL3Yr?=
 =?utf-8?B?QW94N3FQbytIL1BiQ25LaUY2ZEd2ME1sL1lSMzZrTys3NUx3S05kWUR1d3l2?=
 =?utf-8?B?MkNOZWlDZlRFY0tTTG50V0ltWU9vTWJUaG5vbDZuQkhzSGozQ0laMS9CSHU1?=
 =?utf-8?B?S256bVdqN0RjUTZmMWh0QjZMT1BOMm94dFY1RXRmM1lQb09sL2toUWtTdElz?=
 =?utf-8?Q?Gk6wRxitEZVVzZ/Q=3D?=
X-Exchange-RoutingPolicyChecked: JqxKx1EbGEiArpU4kxmfbF1rC3qaWrzldLaQm08mxQI+IPk8tGas5x/TXnmah8SLzo9ssUZnvL1dNr4s6m9fGzLSd7z3ltIwNObYd+mdA4jbHVF9JevGdAF0fmkcGslU4oMUpqHHO/RRImpMRtzTNctJuqtUGPN+of0W2aIXXulSymJtZqNLJ3CROMN2f7fIldGg29WYUtaLZxV4TUgsSI0A4Fk1jdRyq8b4LgD+1nyib53GajqgXHhMWIUsMCLNC3UCg++Swd4CW0KB5Oe3CxIaabMz1XSuIRHwhKiY+tGduU7AnRec2X+0CfXIy1TRXCEjZDW9a0HP1DRgMS/5gA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c83e223f-683a-423c-0138-08dec14c0aa3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 08:42:27.4290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zp8SiJohSw9unEwRM1Y7n4oBY2v3U8Sc2pgeLWjF7KfRoSxwC6ZjZByg4OCom26A28rWP5JWGOPYLJZe3ktamOs5igRLJKGZO72GBRPL8OE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7746
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

On 2026-06-02 at 13:50:58 +0200, Sebastian Brzezinka wrote:
> Opening a DRM device with plain open() does not initialize the Xe device
> cache. When igt_power_open() calls is_intel_dgfx() -> xe_has_vram(),
> it reaches find_in_cache() which asserts the cache entry exists, causing
> a crash on Xe devices with: xe_query-CRITICAL: Failed assertion: xe_dev
> 
> Switch both open/close call sites to drm_open_driver_path() and
> __drm_close_driver() so that Xe cache setup and teardown are paired with
> the fd lifecycle, keeping igt_power free of Xe-specific handling.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
