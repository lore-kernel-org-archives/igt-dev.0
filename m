Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC4AC25B4F
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 18:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A654A10EB2D;
	Wed,  8 May 2024 18:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OA6Tj6iW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449C510E0BA
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 18:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715194173; x=1746730173;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1sr6WfzoM1causdzU5rjaqU5hVsmapYPV5YB8mFpBlQ=;
 b=OA6Tj6iWFPbyFUQd7aEh1pf4N5FSWAf+h0Ol5FvSGmOojgDwUmdJElSA
 1kkIMBqQDFkSrwDncw7FiTyFCMswTv/NwSPsxJ6e1XQbMnx6k9UxUPsni
 hiTzIJWiagihPg0kcPB259umJUCkKE4ENB7cwm4C6bPSAl+sEaIRt2ui+
 qw6LgNjpAlvknV3Vx+PaJrUpP4trmwjLihlZgTjDGV/pQ7rvO7A+FQikJ
 D4kSiOYzNtP2Mnhj2DHwyw1AjgjGmah6F6ALN3PJ8/LLNfBWHOIJv+xc1
 RMTJyTTO6CcIomPkkbMFNie63tj7c5krPwl/X+E6j/URB9ODYIhyUnLHo A==;
X-CSE-ConnectionGUID: aNHoznz7STCcM6IuOJwXnQ==
X-CSE-MsgGUID: KW8S1tVvR3mzEQagS3HNbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="21749140"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="21749140"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 11:49:33 -0700
X-CSE-ConnectionGUID: uPRm7xH9SEWqWwChDDDN2A==
X-CSE-MsgGUID: QqPYCzsvS7a9EtGtHhSJLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29067071"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 11:49:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 11:49:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 11:49:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 11:49:32 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 11:49:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkkllz/1mDsLF0NVmNvz4GdTPQiHBnMVLqIfUk+JMKOxOykZ2TwlYr26uoydRt6vJBA4ecl51WooDbHnTElpz5xP7x/7otLNBrlxW4iUjgQto3kvmsh/Xj/oT4nVN4J37EUSi1qKrXQNAyEKH9EoiiNbYpxMUqSCnlaCsID9NwPUd691Laaostq++z6ZvaupRMlXG2/KOL9ZS/z6GGz8sV1zj5Ri9lSxOXVVDm16gXkWfCMk5L/crLxeJeOlysneEA6uQaxhGJ2m2C7QIOMASujdUwjcPAGs5guSes9maqg/tm0KRfnvo5ZVGR4QI6b2NlUwHyhKCKlFQ9SxA+11nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbp1u7i3JPe7vXtvxmyqJzkY8GJjIDaEVF3jeIW4t/c=;
 b=b13VUr1pZg4wyMS+LPj8/M2qdE+kGoZ48wG9xENBAmIZEo+yRZfQ77q5aXxs0vQRxlxt6nQdcM9lncxiGTDAWYSU8u5ZtSRi8IellMWbg3zhUTv2CSS0EbcNWXPUWbPheumKhsT4jvizWrT7ERHuMyk3lCG1Er/+vssF62iIhWrhBPC7lOlJMnN0id4IqM/HewsDdXjysiaMo/r/GaEW8IuRu1owaX+JECrknxjS91xLo7AU6ME8Qvensz3K875Gf4oCtTQ9CpQhEtstfem5GdNtaFYdmcJOKCmfwEnGqUsa5LQ1EHfqHd0XcAfcHmwHh2IQvv3t/o/2a/1y78vq4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 18:49:28 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 18:49:25 +0000
Date: Wed, 8 May 2024 11:49:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 11/13] lib/igt_drm_fdinfo: Parse drm-total-cycles
Message-ID: <ZjvJNO5WgXJxT7un@orsosgc001>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-12-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240504064643.25863-12-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:303:16d::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b764490-48b2-4639-f072-08dc6f8f9547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFdxMjJ3MExwTGUzVVVjcG9POXlCRFJFRVhrMkdFazZ1VFVyZWkxODdEeTVC?=
 =?utf-8?B?Tng1Q3U3cGovc0Vkek9aM0pWS00zVjBVMjh4RWNNMFA1RXU1RzFJN1B1d0xh?=
 =?utf-8?B?ajB4WnJiTUtoUWI1L1UxSzNyUGJ0Rm1yd1ZlaTc2bVc4YnZiQVRMNndLdzVm?=
 =?utf-8?B?a3VGamhOR0gwSlZOSUp5T2l0NWNZTmFicDlja1FvSnVBNjVtZGE0YzJSd24v?=
 =?utf-8?B?aVA5MW9pankydXA4VEJ5bk5ndlVTM21Sa3lhSXhvbytHMHNPTUxmMXNveWts?=
 =?utf-8?B?bVNrYmJjQTNhSCtGMXhSbFlIb3o1YVdYUXNkTW1QSFF3SEpINlc5RmF5VFZx?=
 =?utf-8?B?UUtiZmd0RVVOR2ZFdzgxdlNaSTEvTTQyaTVYYXI2MnVtdncyS2d5dUYyenFD?=
 =?utf-8?B?NkpCV2NtbkNVR1RFbzcwR0NVYjdNNEU0clJURWFLVkxsTzNIZnBPaEJKOG9m?=
 =?utf-8?B?UHlJYkJ0NjJ4VSs1Q2lyVFozMzJ5V0JDZkVKRE1hbDg5UDRTekpBQ3Q4S1V2?=
 =?utf-8?B?QVFQU3c2OFhQeTd4U1lHNDRjTWpEeUlNeTVmb0grd2QvMzBvUnN4bVhaYm9u?=
 =?utf-8?B?eVdXUUsyMDBlay9ScExaWDdONUsyZDd5TDBxdzRhc1dmbXFKY2lCUTAvc0lN?=
 =?utf-8?B?RjE3Ync5aFloRTdMZU82ci9CMkdPbW9MYVUxVXVOZXBVV0JqcTg4NmxYaEwz?=
 =?utf-8?B?MnZuZmxpTVFxVGVWVGtEWlk4NDMzc1FOeFlaWWhKazMvRDFGL0d2d1g5OGNq?=
 =?utf-8?B?U25XSnBvT1JOQVlndGtQbmdEY09zL1VrRFdBWVBDb3AreWRvM0pNWHFNZXV2?=
 =?utf-8?B?TGsxbmtPZ2wxTUxmeGVvL05BMW9vblVpcEFjNkNYa0h0bVZ4YnlZTGsyTjJX?=
 =?utf-8?B?NnREWmwrL1Frdnp6SUFCcHp2aUFrV1l0TXQzbVhlQmxPU3loMS80SHVyMXlw?=
 =?utf-8?B?d284cUtLeHd0bGd2ejNpaTA1MFB0YmlPby9FUnU1RG92WFEzajRZUVMrTWhE?=
 =?utf-8?B?M0U4VTR4VGVNWndkQ0k2QTJ2eFk1V0xtME01VlF4VDB6azdVZmpNU1hma09i?=
 =?utf-8?B?QlAzUTA4OGdlQnNvQmhQK3pFTWE2OXJOVXdqazRTSUE2aUNYWXMxRzlKeGxK?=
 =?utf-8?B?MjE2aUpSTzFGQThCQ1RlOTZTLzRBZ0xib2orWDZQOWRFNGhPWDVZVWFDQXNS?=
 =?utf-8?B?RFVOSEFTTFZtS0c0RG1pb0Fwa2lER0lmNXU0L01oRERiYUt4QVpINnhXQnJt?=
 =?utf-8?B?TTBRK0NqcW9DMXhDUmRZcXd2RXhYNTIyZ3FuVDkwS3RseHRZeFVRbGFsUE1Z?=
 =?utf-8?B?Um8ycC9Ga095YUIveTJLa1luVGVQVjVUdEJpQUdYSER1MUxhOWZIY09ZVUpX?=
 =?utf-8?B?YXEvV2FQWVM1RTZTMXJlSDdvelY0QjE2eXJSaTlheTNOT2laYmFtWmcvTEdi?=
 =?utf-8?B?VFhaUUtBUDY4SnBoVHBmNXAxM2JSMm01bWNnTCtCaTZ5U25KUmlXTlgxWTN0?=
 =?utf-8?B?c0h4NldXcitucExXcVpHMWNtOVNYRktkWVVqeDREOGxGL3JMZ09DSDArS1BU?=
 =?utf-8?B?cDFQcmFoYWFiNDNtZ2o2N1k2eFVoVmVBclVFUjBHbW53bXV5ZDRpMXBCSWtB?=
 =?utf-8?B?T1pMclo4Y3BpS3FLcWlMYVpDZWhDdytJMVVXRmo2c3hGcEZuWnFQR29YN2ZS?=
 =?utf-8?B?elFRUnd1bjBZZy9DenlwYzc1ZHB0MlNEaWZRRXNFMWNDbEV1ZHE0SEd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnM0b3d2QjExbFJEUE5sSWxDOE1oUUJIL0haZ0tSNGlLV1U3bkt6ZE45UzEv?=
 =?utf-8?B?VlExZ1hkQ01STkJaZHVFZTY4THlrK0V4NVRQMkFpMHNUWi9pQ3VOeWNLRGRv?=
 =?utf-8?B?UmZqamUvT0ExbkkvWnFERFRNc2w4SW5DTUE1WUpWY3JDSThkcGQwd1l2bjBY?=
 =?utf-8?B?Mnh0TGtvVDV2SWVrTDJWRzM4blZiWWlxRjZZMnQwcVNrVFZLdWZiRVBYRENW?=
 =?utf-8?B?cXkzOVZXcUF0T09LNGdZdmdwR0NzOFg3NUF0MlpJUEdVNXNtTlJQY1VDTkZD?=
 =?utf-8?B?NDA4TTdueklkMiswNEt0WEVFY3V4V2NnY2ZZdTlPMWRlc09zcmx5QjZWaFRQ?=
 =?utf-8?B?VHRNMGpxbEJzZW8zZU42VkxtdlFRRHkza3UvN1AzRmxjcjlXdnRhMnZNQTcz?=
 =?utf-8?B?eW9reS9xUjBMK0NtWHV0Ym1vemVkcDVQREZwWnlhUkpKTFZ2Q1h1R0xINWpv?=
 =?utf-8?B?MFMzaHU2WURRQVJLY1hyZmVXQngvekkwKzUyamJJeTNOdWVyVi9RVldhcUYw?=
 =?utf-8?B?VlM5cCtsSTMrK3U4QkVnZG5kdit6b25Pc2VxSm96TjdYM3BmTjZhVVVKQlAz?=
 =?utf-8?B?SU1yeHhhamFFUlQ3T1o3ZktVb3Q4Rml6d2xBY0JBTHR4NFBkRDI0N2xVQWdh?=
 =?utf-8?B?SGR2RnFtOHlwN0FQU0xRWXllQ3RjNEVpU2wyN2NLcmtwajNhN2JDNjVJNi9n?=
 =?utf-8?B?aUxDQkNKeXpuNHBLS2J6WjFxcHlBTnBibmo0REhOUU41MkQydFE3eEpZcUVR?=
 =?utf-8?B?dGxITW83VmlsUTJiWEJnR2U0KytFQk9GTk4xMEp2eEFGdmVtWHJwUXNxVVdY?=
 =?utf-8?B?NU9BMVQ5Ri9DVlRmbWc5NzdjRnIyZDUvUnVJd0dlbXVQT0JlT21lemhPODVs?=
 =?utf-8?B?UjVqTVBSMzAxWU1RY1ZkZXJFZk5NQmlSeklKSTNVSGtRaWJxbjlIYXVpTjZa?=
 =?utf-8?B?QmFsd1hmbjQyT1FyajlWdlBVNWtPaGNxZXBZakFYS2hIZWtSeERtV0NUQU5E?=
 =?utf-8?B?Zjg5TzE0KzlXSGpQRmNNYU44ZmhuWjNwU2FoTGd3aVMyNHRtTVpCRkpuVEQ5?=
 =?utf-8?B?NHQ3VHBoM1k0RFVEemZZK1ExSHJRMWZuQzZqSDFEWEwrY1BzN0hUTWI2STBS?=
 =?utf-8?B?bFErZmh3bzBGS1ZLM3ZwTVY4eTBwOHVQVWR6YXFZQmtORS9qRmNVSnRoV080?=
 =?utf-8?B?ZTQyVGFSQVdMdHNDK3ZoNzFOR0NXTTJweTFZVE13YmxoMDVwSUcrZEIxUHBS?=
 =?utf-8?B?ZTJGMWtIUlZRYVp3K05CZDVNbXhoMEVZakJRbWJrSncrdFJENS8yeXFEMzBH?=
 =?utf-8?B?cmFiei9MMmM4WjhOaXJkR29tYWM3NmM4WHRER2dFVHExdFdmdVlLT3M2SE5Q?=
 =?utf-8?B?aC8yRHVwZlIrL2lYMWFHVTJvTGwzY0xyTW9wUVJlcGtOSUZ2NDBvUFplY2Ry?=
 =?utf-8?B?RXFiYzhWeUpKd2xCQXdtdEEvR0JpZ3J4YTBqQjVVQjh4OWVMcEhEWFhxekx0?=
 =?utf-8?B?b1BQUEQzQk83MitteGxVSWpVelFSTEtEQ1FmWVl6Ym00R2NvbjZDb281M1hR?=
 =?utf-8?B?TEtYZHZPWWozOGJqaEY4RlNkNW42YTRjWjFveURLUlZoOXJ5Q2hKM0xGY2lM?=
 =?utf-8?B?L1ZTVmhNQWo2MmFLeTBJQVA2MmRhL2lKRCtwb3c3dU5DbzNZUlZsakxXR1dI?=
 =?utf-8?B?M3ZTVmxlRjQzekxNT3RZZStBVzd5TlR3M3E3QVpXeGxwQ2ZEcUJHd3libXI3?=
 =?utf-8?B?anhZQjYweEN6T3Q5NDJkVGdKMTdtUS9kZ0psenB4cENobFpMZEZuSnYydE1o?=
 =?utf-8?B?WWl1ZnhmbkxIZGxGVEVqTXdIMVF2TDVETGdKdElENS9KclFDd1grYnBaZGcz?=
 =?utf-8?B?czdXMElIRlJYTG9WY3ZEU0tQY3BiMmtkWHdoTTZieUtkdkM5T0hTbmtXOWVE?=
 =?utf-8?B?eEhJRkxncnpGQnUycm0zZHQ5Q013NFhLZFF4S3B5RXNoWWNnZElFRVpHNW1U?=
 =?utf-8?B?YUx0Q1p0MEdCQUhwUXRaZkN5MDNSejN5cEdYVUYrTUNYUEFtTVNZZkFXYjVv?=
 =?utf-8?B?TmlCdURKSTZCMS9hbFlxdUlEY0ZuM2pIRTFXelF3SUo4TWNWQ0pTQUcyTWh3?=
 =?utf-8?B?L0p6clFFeWp6OGNNZm1GV01uV2E2ME9xcGxEeUdQN1JYejZFemVuNkdnRVhY?=
 =?utf-8?Q?2UuQDau7Op4loWfKDBtr/Kg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b764490-48b2-4639-f072-08dc6f8f9547
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 18:49:25.6351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/KpB/rnjJ+oIAPi8f/a+hkCDPWYdzOFefyH4GClHYmZqzZyk/SadOiYaFdi3fgxMDFt8agfVypgZ+0+ko9NZf6TJSJJNjOTNRAqRASFfD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
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

On Fri, May 03, 2024 at 11:46:41PM -0700, Lucas De Marchi wrote:
>Parse drm-total-cycles and annotate what are the possible engine
>utilization types that can be used. Currently there are 2 possible ways
>to calculate utilization:
>
>1) via drm-engine, that uses the time and derive the utilization by
>   comparing to the CPU time
>2) via drm-cycles + drm-total-cycles, that uses the GPU time
>
>igt_drm_fdinfo just marks the presence of the keys, letting the caller
>decide which method to use.
>
>It is assumed that if any drm-engine, drm-cycles or drm-total-cycles is
>available, it's available for all engines with non-zero utilization.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>---
> lib/igt_drm_fdinfo.c | 4 ++++
> lib/igt_drm_fdinfo.h | 3 +++
> 2 files changed, 7 insertions(+)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index 9deeadd4e..f45d0440e 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -265,6 +265,10 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
> 			idx = parse_engine(l + keylen, info,
> 					   name_map, map_entries, &val);
> 			UPDATE_ENGINE(idx, cycles, val, DRM_FDINFO_UTILIZATION_CYCLES);
>+		} else if (strstartswith(l, "drm-total-cycles-", &keylen)) {
>+			idx = parse_engine(l + keylen, info,
>+					   name_map, map_entries, &val);
>+			UPDATE_ENGINE(idx, total_cycles, val, DRM_FDINFO_UTILIZATION_TOTAL_CYCLES);
> 		} else if (strstartswith(l, "drm-total-", &keylen)) {
> 			idx = parse_region(l + keylen, info,
> 					   region_map, region_entries, &val);
>diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
>index ea90edd79..35f43305b 100644
>--- a/lib/igt_drm_fdinfo.h
>+++ b/lib/igt_drm_fdinfo.h
>@@ -44,6 +44,7 @@ struct drm_client_meminfo {
> enum drm_fdinfo_utilization {
> 	DRM_FDINFO_UTILIZATION_ENGINE_TIME	= 1U << 0,
> 	DRM_FDINFO_UTILIZATION_CYCLES		= 1U << 1,
>+	DRM_FDINFO_UTILIZATION_TOTAL_CYCLES	= 1U << 2,
> };
>
> struct drm_client_fdinfo {
>@@ -63,6 +64,8 @@ struct drm_client_fdinfo {
> 	uint64_t engine_time[DRM_CLIENT_FDINFO_MAX_ENGINES];
> 	/* drm-cycles-<engine> values */
> 	uint64_t cycles[DRM_CLIENT_FDINFO_MAX_ENGINES];
>+	/* drm-total-cycles-<engine> values */
>+	uint64_t total_cycles[DRM_CLIENT_FDINFO_MAX_ENGINES];
>
> 	unsigned int num_regions;
> 	unsigned int last_region_index;
>-- 
>2.43.0
>
