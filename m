Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFB4D31A0E
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6280110E147;
	Wed, 14 Jan 2026 06:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3GICke5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5812010E147
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768372182; x=1799908182;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P7JiQZwyGSYFd5qhR6cMoP/P4mfcxPrUqJeJZmjlQhg=;
 b=M3GICke5ZVuz8XgUHSpi93cUgqVHxKaQw5t8d15R1kGPP4TND0a6HEZ5
 ogMZNl+AKwlVg1HVqCPT7KXIuLQPHO8YKhm9pFpDAGEgd+DdvvcJL9CBJ
 s7s0d86aisdOjo9bE/4ZhhOaeBdHNTYhIOzRABgdlJZtUfuS9dNwmih1I
 vFh3gq2tEBpWz2kUmr6VWPvH2AyCEDW6fobVKPP1rwpEDD3++0iZG3Mpb
 +z/QdvVq2mPZcm3ddiln329TTl9hx03UWA41VefqeHa7fMbZ7otGTh0zJ
 T+N2ZBha8J9KiBAbnHxv8/F8ZfttMw+NkaF16H6oQuWsZmDUXNWsAKZSe g==;
X-CSE-ConnectionGUID: puCjyKeAThKX1G48Hl/qZw==
X-CSE-MsgGUID: dz8khsMdQYyO4S43VTAP9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69585424"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69585424"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:29:42 -0800
X-CSE-ConnectionGUID: BMb0TEBxSyikLWjejFeltQ==
X-CSE-MsgGUID: 9A4bWgYnS9aLThgGYk+k2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="235311353"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:29:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 22:29:41 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 22:29:41 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 22:29:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4E7I7BNdhtl9cKfec9TpA9hul9qDaTW1/Y6qm/09aQNtWt8JueIQUbW4J6TM7AXyMnLRyO2kIPUs0iUdUscviYY4n943gHOED2tWTNYZkUqBAUdlKgY38R7XMSKYWUy4Elg3YgkXCXoB+zLyDPBx+ZoTMA+21XDecN+MR/5fTcDB86vrpXBEBZEqoDFlEa5F+cbIXaXjzC6dgY6MIU2kWdn27Rdu22qny93jvS6rOA7OmZbn/q8R9xBCwh3T635nn+HCUlGMm9lJvOFQQSc/7GrCkZXDGsaMslABQVGGwRYefl27UHvQMp+KKIoMjWl2FfKy+iII80QZeYZvGsoxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGfFSDmBw2/kZ8JhufCHK8oFYpNnwYSLgGgDkIrsq3o=;
 b=PNRCTh4IO3KUEWvgLQFJJyq+ToGpAVKWbm2jstdEJzkJWNPHUmHI2gLlD2L6u7Z8kaU2hr7l8d1Ad+oQGrjxWz1azzA1deN1IG8emMcrrGIG7a1/NrEuhD6PhamluSHKltjga7vyNbZANmx8OAIsBU/UJKsxNWnG5mlr/lRmgIJTkG1W8+dwd/xBrlpm8RMulHEMp5scuo+x79gbb4LPWSlwaYU+wjeNzd0hBPLlprfkG1OkIAzCY/M8E0TfzPgfEF+sydbIdSKhy8a5Dxe+RuSAaUQaF3WPClJlmbYaNBihNIGibVmhwgjTV/9p4CIK0d0lXUrRPOM/gnkPwnK/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA1PR11MB6321.namprd11.prod.outlook.com (2603:10b6:208:38b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 06:29:33 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 06:29:33 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 3/7] tests/intel/xe_evict: Add priority for multi
 queue
Thread-Topic: [PATCH i-g-t 3/7] tests/intel/xe_evict: Add priority for multi
 queue
Thread-Index: AQHccN92Ww+325fSJ0C7lg7GdlrLGbU8h/qAgBTUZmA=
Date: Wed, 14 Jan 2026 06:29:33 +0000
Message-ID: <CH3PR11MB84349ED3AE5D2E1CB16473348D8FA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-4-priyanka.dandamudi@intel.com>
 <aVW-hdFmYXEYFzy3@nvishwa1-desk>
In-Reply-To: <aVW-hdFmYXEYFzy3@nvishwa1-desk>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA1PR11MB6321:EE_
x-ms-office365-filtering-correlation-id: 5f67bb2b-c31d-43cd-46bf-08de53364814
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PthPxE5XwGAV009V0bbCyGXIky6VNX25q3BEoKSyP5xHXwXT6Z7Z/NyvvUb4?=
 =?us-ascii?Q?EpCLU6z9lsBvUTaqnF5R/+XFUHv9B0UflBGayUGJcmrh39uEnwNLR2thSYH6?=
 =?us-ascii?Q?+WBr3DgtDR4Vy4Po++ro78eVCzGgOHAIKnevaOPHH/DV6YOU0MYHk3LfMgoY?=
 =?us-ascii?Q?0wnWjspRlQyB4bQepWfRvOL6OkNYAhVWMdHV6ee3c8GdKBuZfs4dQjbdF3qU?=
 =?us-ascii?Q?8vTgtPVc/J8hqXwugLCYI2EbA/oWITNC/Kq5DmKs+pDmuoNbZrLRkv04+Ly/?=
 =?us-ascii?Q?v/bj+JSkE7B4ICyD9FC8Qhmxixnsa9x6DpPyr/RgPwJkczppC1e88kKSx3zQ?=
 =?us-ascii?Q?CO3RmEXJqA/AMiOMSEEhsRsh8fQrhC108ZupsKPNXL/MO80g9C1837spdv2K?=
 =?us-ascii?Q?031SN6mLyjQZpLLlNLP/hIrE7LEBWOGkX6iDvjotAnWwShJ8YvqFi02ZRodd?=
 =?us-ascii?Q?Mr5F6vgydSHPwZnZzEo1GvierUB3weEEDV2VXQ2aVNZumaGXBJpQDI6rRdSW?=
 =?us-ascii?Q?cRlJqVPtZDy8KSa7eZKGYjUqrz8lzHkImsKT5mpt6oHFC9gE2PWJZddxYxFe?=
 =?us-ascii?Q?8LOyr6bhM7pnCi/PGO/a6rfsTL+zOZ3IyuBHXn75XTlLoUvsFzMVDuLPtK8V?=
 =?us-ascii?Q?Lh/f77sqb7Rldpt2nXTtukEHgrP3a7MdtI1KjKXQ8gAIB3vTI5FjJz3ZIRPn?=
 =?us-ascii?Q?JFdro3Up+kg51Cq8QqYTw/Zl2f6Em8O1m8gfN8sXN+FqXONlNULXrrsw6YKp?=
 =?us-ascii?Q?ZbSYxUMlX0WIrq5OKc2sdZGw2TeiOWV18bBVRTzX5mAw5ZcPgwDhjajK8QRX?=
 =?us-ascii?Q?dvrfYCpO1vI566hWoifZvAqxtgTAoO58CKjKUd0HIQeMSCV0UQ2htBz6cYM/?=
 =?us-ascii?Q?sVozSHYY3RMfm6OLrzE9RFVh9poV0Z8/5UJf90xmsJfGWe2Wk4MOFKlSNRLc?=
 =?us-ascii?Q?K6vST6UtlJdLMZ2bJlry8Rsat1n03N8aebvWAdTwqsYinGTevSUrKU9+E9mI?=
 =?us-ascii?Q?xV+VNTJCoDePUqQ6TmK8VUcaBpuUdHVxWAw7hi+wgVIOnTDT+T8TS2llEh+7?=
 =?us-ascii?Q?uoZo0FOHriPnjHG9+ro/5aDwXsnkZylQyXSJQZu3d1lGMcvsWJwQnRe49YMY?=
 =?us-ascii?Q?OzBv0sJ/V5/i2yj6D9z6iQrgQFQZ7A2hE1ChHpVEZZFqm4GyxZBcLg7YSitA?=
 =?us-ascii?Q?k80DPAW+xHqOxN9gd7wPKHC739Cja225Gx6ubcfqSMyrpp+RN9JrXdzRZMda?=
 =?us-ascii?Q?BEshVOaK5IQqmI49P4/TrLIK+9lk3YHiO4McNkQBlSnHRsw2ZNaZjGqzbHOO?=
 =?us-ascii?Q?KPXT8/JVjJGWO+uwmSo409RxA0CxKx7n9CWbKE+Yn7EAh6T3t2HdBG3At6QV?=
 =?us-ascii?Q?coRiZLi3Ca0T2592/l2wcWQrdlpc+0cdjhkHEZjDG4ehlbmKUsSkhBFUxLUJ?=
 =?us-ascii?Q?9SWJu0FSXlnr8zN7nzZ0vzluymqjEkhnsiBpcxJm3AfxVNoGEjqRg9CQOY6g?=
 =?us-ascii?Q?K0J6m1wYU7Imi5CtYhXi1X4zsE4Id+uhlupe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PBzvniyzcUSCx5JklH23LvxCVPV19Wowk38M+W/9m8b4yP/TP52Igq7BZX/E?=
 =?us-ascii?Q?pN2KZbkU5xCzoJeD5Kq676UEAsuZHkfq2l3Nlqpq0fodApH8eaerlctfrXqZ?=
 =?us-ascii?Q?7FlbC2QDDrWyOTU7eDbRzhMw2N/gHPRzEU9yvLwPJnX0ahMybCfzdkuxbcX7?=
 =?us-ascii?Q?q+b0VxJRvAiGSg1LEmzl1UbluaoxRir5xmzGJ1pNgErpOOThCuT/GMuy09Dm?=
 =?us-ascii?Q?P0M4klLBS2DFPcrKKGYopVAWZhmFvk3o8Bhdf2PqycfWv5AzBnouXbeTCPP6?=
 =?us-ascii?Q?PfiR0AkmPQmZBz0tJA0QGFSJA2tjJphtJwQtDIZ9Md5QEaGf1zWahdgGn/g/?=
 =?us-ascii?Q?HA/mIzYoYkb2TAv1VIcjnu3ApIA+86SJChFFU5jk0Mno7oY1Eg5AMvqrxmca?=
 =?us-ascii?Q?BZ2+j7w6RkOM4M6gakNauwJ9wZggs0JeKsh8N/TE7GzNzXaDU5PogCoJhx3n?=
 =?us-ascii?Q?V9q74uj2AlWyBap9x3+VsKpz1Saern50mrXhfW7GS3VjXtzm8ngl3wDmqE/a?=
 =?us-ascii?Q?rWH0RLzo0uPsEs+ShvHDQLM50y44IpsPUqEILTgZIbsy5j1hkXCd53CuBMuu?=
 =?us-ascii?Q?2Dot8+ZrzJNR8W0lYJh5TTIvVDWLJ8PuIjf6JdTkrtPsD/TyeGhqJDYw4C17?=
 =?us-ascii?Q?4P9EZ4B8hnGf+aWOBR8MpAy9u0RJE9Byra2U+JApxM+WA1SvcQL6ZgRYxpqE?=
 =?us-ascii?Q?toF3ggRwpEKR3spAiYiouXgr0gn7DsWjxeE1La1CWOZf5/eeJSVhd+Yqp32F?=
 =?us-ascii?Q?ZRUB01AeEgwsXQUsvPO/4uLEmZrxyayJfr2Lv9HSzxPK/zLqVC2l3lXOyFUO?=
 =?us-ascii?Q?ddYbMWIdC9IoaliXwz0bD3hKX6v06hb4/T9vYz0oTM8qbp/21OIPIZGP4V1i?=
 =?us-ascii?Q?kNFI1ZIqwKNNJ2B6iOCYJXjk9nqLNs/fuW9aowcD2afZfa5GeCKKuTOPb6CF?=
 =?us-ascii?Q?wt2grAkq9477sxPAYQPOi3x89Rw88RCcyn82x5CxUZ89zFC+SnWfGW5EKUKC?=
 =?us-ascii?Q?rvcIyEdcEIfIzkjhju09tL0PZcAiqI1qAH5xcv1ipIaK9ACZdst35SZ16yyx?=
 =?us-ascii?Q?VB9MrG+/P5u82gl6bdoIJRJcMwxTQh5WllVMXC2VTjzmqm+Jwog8zgcupKQB?=
 =?us-ascii?Q?KeRIYL3Sb05n/h/oQ+nwONubiR1MrJhecj7GbYR5VQzcafX2T19Ri4oiOmkG?=
 =?us-ascii?Q?KKxtTI4+C8NnKx6thlvvXkwm7YTsuFE+OCWVrinLjYYsVvO0SlmnV4LmzKFA?=
 =?us-ascii?Q?K6WKe8Lsph4HLJyoz/OgNY1DFw2CHqrE8N1pYGM5FST9ckbq8fuFI4x2sPxw?=
 =?us-ascii?Q?WqItgljjPxdUYYbfbdyPEt6N8YCaSJ37dexv/Vpa64PYEzTHswS894DnvSHT?=
 =?us-ascii?Q?yvvDG8lYdiB4oD1VtyXim7yH1xnJrhj67V0nPcTkoU0QdaHYh8ng7XQcy86w?=
 =?us-ascii?Q?BWI4nJG5LU5pY0UqTny83fGK/0LETbO1IyhW2XD6mnLkJVBYHCS8JRNC2Ind?=
 =?us-ascii?Q?mniUpQEde29kc6yywVyr8KKW8ObopBIHyjDMfSVT5AQBeP44hB5qggRivZCy?=
 =?us-ascii?Q?mtOYpYGT9YwAyF+r2TeDtX7gjlXibpXGoQ3jnpKKp/cC6XZ6Wdxt2CXOZviX?=
 =?us-ascii?Q?wCMLaNB+b14rPV0jOaI7H2dpiVUDXaNWtUSt5OnUgsbD6MW9Uq8iPo2uX8DL?=
 =?us-ascii?Q?cgOYMjMRk2LmsWZYV3yrFgyoveGj59U0WJMBMy36S6STyoQEm0Lc0WEoer6Q?=
 =?us-ascii?Q?KNVbseiig5fMULGE3hUZhtdyaByVEmM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f67bb2b-c31d-43cd-46bf-08de53364814
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 06:29:33.5170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Or4sqJ+B1/b88W7TPaEdj6Ga0DhpO7uOaxJsv0FD9aJWNlWis0rFZTkwEUR/D/k5CkrPNPIUkufzupPuiDYUWoHFplyVFLnyuXrbtx8fI3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6321
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



> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: 01 January 2026 05:54 AM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t 3/7] tests/intel/xe_evict: Add priority for mul=
ti
> queue
>=20
> On Fri, Dec 19, 2025 at 05:31:50PM +0530, priyanka.dandamudi@intel.com
> wrote:
> >From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >
> >Add 2 tests small-multiqueue-priority and small-multiqueue-priority-cm
> >which sets priority for multi queue.
> >
> >Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >---
> > tests/intel/xe_evict.c | 24 ++++++++++++++++++++++++
> > 1 file changed, 24 insertions(+)
> >
> >diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c index
> >a62230ec6..35192aad0 100644
> >--- a/tests/intel/xe_evict.c
> >+++ b/tests/intel/xe_evict.c
> >@@ -21,6 +21,7 @@
> > #include "xe/xe_query.h"
> > #include <string.h>
> >
> >+#define XE_EXEC_QUEUE_PRIORITY_NORMAL   1
> > #define MAX_N_EXEC_QUEUES	16
> > #define MULTI_VM			(0x1 << 0)
> > #define THREADED			(0x1 << 1)
> >@@ -30,6 +31,7 @@
> > #define EXTERNAL_OBJ		(0x1 << 5)
> > #define BIND_EXEC_QUEUE		(0x1 << 6)
> > #define MULTI_QUEUE		(0x1 << 7)
> >+#define PRIORITY		(0x1 << 8)
> >
> > static void
> > test_evict(int fd, struct drm_xe_engine_class_instance *eci, @@ -89,6
> >+91,15 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
> > 			};
> > 			uint64_t ext =3D to_user_pointer(&multiq);
> >
> >+			if (flags & PRIORITY) {
> >+				struct drm_xe_ext_set_property mq_priority
> =3D {
> >+					.base.next_extension =3D 0,
> >+					.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> >+					.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> >+				};
> >+				multiq.base.next_extension =3D
> to_user_pointer(&mq_priority);
> >+				mq_priority.value =3D
> XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
> >+			}
> > 			multiq.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
> > 			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1,
> eci,
> > 							     ext,
> &exec_queues[i]), 0); @@ -279,6 +290,15 @@
> >test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
> > 			};
> > 			uint64_t ext =3D to_user_pointer(&multiq);
> >
> >+			if (flags & PRIORITY) {
> >+				struct drm_xe_ext_set_property mq_priority
> =3D {
> >+					.base.next_extension =3D 0,
> >+					.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> >+					.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> >+				};
> >+				multiq.base.next_extension =3D
> to_user_pointer(&mq_priority);
> >+				mq_priority.value =3D
> XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
> >+			}
>=20
> Not sure if we really need this test. Not sure why would priority effect =
the
> eviction. The non-multi-queue subtests here do not have a priority varian=
t.
> I am fine keeping it though as a interesting test scenario.
>=20
> Niranjana
I am keeping this test case.
>=20
> > 			multiq.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
> > 			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1,
> eci,
> > 							     ext,
> &exec_queues[i]), 0); @@ -540,6 +560,7 @@ static
> >unsigned int working_set(uint64_t vram_size, uint64_t system_size,
> >  *
> >  * @small:			small
> >  * @small-multiqueue:		small multi queue
> >+ * @small-multiqueue-priority:	small multi queue priority
> >  * @small-external:		small external
> >  * @small-multi-vm:		small multi VM
> >  * @beng-small:			small bind exec_queue
> >@@ -571,6 +592,7 @@ static unsigned int working_set(uint64_t vram_size,
> >uint64_t system_size,
> >  *
> >  * @small-cm:			small compute machine
> >  * @small-multiqueue-cm:	small multi queue compute machine
> >+ * @small-multiqueue-priority-cm:	small multi queue priority compute
> machine
> >  * @small-external-cm:		small external compute machine
> >  * @small-multi-vm-cm:		small multi VM compute machine
> >  * @beng-small-cm:		small bind exec_queue compute machine
> >@@ -714,6 +736,7 @@ int igt_main()
> > 	} sections[] =3D {
> > 		{ "small", 16, 448, 1, 128, 0 },
> > 		{ "small-multiqueue", 16, 448, 1, 128, MULTI_QUEUE },
> >+		{ "small-multiqueue-priority", 16, 448, 1, 128, MULTI_QUEUE
> |
> >+PRIORITY},
> > 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
> > 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
> > 		{ "large", 4, 16, 1, 4, 0 },
> >@@ -740,6 +763,7 @@ int igt_main()
> > 	} sections_cm[] =3D {
> > 		{ "small-cm", 16, 448, 1, 128, 0 },
> > 		{ "small-multiqueue-cm", 16, 448, 1, 128, MULTI_QUEUE },
> >+		{ "small-multiqueue-priority-cm", 16, 448, 1, 128,
> MULTI_QUEUE |
> >+PRIORITY},
> > 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
> > 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
> > 		{ "large-cm", 4, 16, 1, 4, 0 },
> >--
> >2.43.0
> >
