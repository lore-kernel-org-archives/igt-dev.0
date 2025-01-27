Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FC4C0218F
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 07:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE1910E1D9;
	Mon, 27 Jan 2025 07:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4L5UY+J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9501C10E1D9
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 07:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737964012; x=1769500012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0aPAki5Nsf7txW5pQ4kbgogDz10nec467rs+iazoBzA=;
 b=Q4L5UY+JYG7nUG73ZRpp1LFJ8cAfmHXc/THeyR+td1x0PZGn8Abmma/J
 Ww9E8U+5rFTZEnqgl6WEx+LYv+J6V4Gx4iZB6COUmtxGTIH1l8SGzFLBC
 VvQ5N6EJhvdl/mcR/Y1X4sNWSqhupiyikwpcMM+kT7KPNLmyBEJTkaV+E
 uNkIvK3DbqApmYLCAwk5kQE98qFFka3YLKHkQq8q07ryttFG+Enal2KT5
 I1/VAOi0O6lTTbhZdHfgAKTHDjTAAWb8Qo2EpKFYEbxgb8lJEJ+7bVSJj
 vOUegS5HxCC7WUnFSv4YAWPIMXDINc8hLXybDsjpLqaVqg/vcre2cTOyu w==;
X-CSE-ConnectionGUID: dyCEgfxgRBOGzQGXp/ZI5A==
X-CSE-MsgGUID: EpU3ifa7SEKAAZQe5/TAlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="37669020"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="37669020"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 23:46:52 -0800
X-CSE-ConnectionGUID: th2ObFf1TPG4LIGOaHxTfw==
X-CSE-MsgGUID: LSfgs28xTu6118ci8lQVZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113504305"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2025 23:46:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 26 Jan 2025 23:46:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 26 Jan 2025 23:46:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 26 Jan 2025 23:46:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqxXS/0ijEXtMeitG83HzRLNPBD+64vTPU6GKAmjtxOPmOfmKRxXkj2lShMPg2vFHgNOFUXLdsj5OD3a8h6OmsAOhGiZ1csDqk4wS0csgrcO2MUJBZidq6MVx0FG1PBlIpDlQJ10vU5MVom7Zl8bz2QYZRDFJlKdABWeNWkB2dxbTjPQKOH/bCwAY+Ksy4TzUxcq1yvUYLUSv8zxz7mx7LHCnjiBj45wfCWmfuzupsOLq8gSEHWZhLuV8wlJHmu2G4BEmQyH3n/+17qY/lVpLKqNTcAiWKoNwu79DXG5CUXnRqiU1jdLZmbYS6lYUkz1Nn8z/jnXf/OzErGJv+fETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBkUl6yV/Tqa4TMB67Fw/cMTLSJTmO7egcNq3R8VnwU=;
 b=Ein8R6QHLrPQnDS8VBL76wGOaUrLEXQETdm/7Y8MmF+RxXbkU3DSPc4CxOYt5o9QLMSFnNj55n2lRauBqsDPHt75naOH1m1WauITLvqc89kSA+eNO+8G+YC9hBa9fekVUyD/3ML9xNelBReqeJFCnGqxYr6H542zetXZiqYfvgEGeKYJY/FEiaXry81xiH3ka0svboQcMyXDsE8tU3XiXyZ37c94N8aIRAMINeOGHhou+qmF/DGA+AzlVgLyQ+6AOehOWWyFB+brlRgXUX5pNKznfxa7dXtnr6SLABLi2WosDY5mT323RYQ1lPHHc82KWoAkXoqybRUPGqs2pYZcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by MN2PR11MB4744.namprd11.prod.outlook.com (2603:10b6:208:263::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 07:46:09 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%4]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 07:46:09 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "marcin.bernatowicz@linux.intel.com" <marcin.bernatowicz@linux.intel.com>, 
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "adam.miszczak@linux.intel.com" <adam.miszczak@linux.intel.com>, "Kolakowski, 
 Jakub1" <jakub1.kolakowski@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v1 2/4] lib/xe/xe_sriov_provisioning: Add helper to
 get VF's provisioned quota
Thread-Topic: [PATCH i-g-t v1 2/4] lib/xe/xe_sriov_provisioning: Add helper to
 get VF's provisioned quota
Thread-Index: AQHbbjeBdeaFwodZs0y6py46vxQprbMqQnWA
Date: Mon, 27 Jan 2025 07:46:09 +0000
Message-ID: <LV3PR11MB869562530D2B98FFD63D8072F9EC2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250124081039.31201-1-lukasz.laguna@intel.com>
 <20250124081039.31201-3-lukasz.laguna@intel.com>
In-Reply-To: <20250124081039.31201-3-lukasz.laguna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|MN2PR11MB4744:EE_
x-ms-office365-filtering-correlation-id: 7f059ed1-064c-47e5-3259-08dd3ea6a9eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qyulq59kGuQHzC4QDiD5K993XCAsPH17vYyxCbzDeKC9eoH++3RrPCxs7e9n?=
 =?us-ascii?Q?NTvy7Mf8Rz/tLD9UIx4edbceS6p3yfj8yDeSWLuLiYYdbE/TzR0a8eskVttR?=
 =?us-ascii?Q?stRVSi4i3vYFL63feR60qdCSwzoYzoMLx/29wKedp/5Cfq5EK/P86w7AhLcU?=
 =?us-ascii?Q?j2oWMqDB7YJ6K/yjYeuBWtXVUq8VgciYQ85gy8eTorzWNqzUSG9KJLLbJXs1?=
 =?us-ascii?Q?qiCzIw6RahGCbH31zxGpSeuEK8ZnSLyFTn9sOxqy7QNQ5EmbCbdHq0BiIoBi?=
 =?us-ascii?Q?SnuL5Wp3A2QnHivM8Wf4U1N68EMGs5CkIqE32kI/P3ZxsRymz6QBYB0J0SU5?=
 =?us-ascii?Q?pYHgS9baS2OcPdzlVGtgqilsg5GIieNyMCbRRsZmsoYU5xw5JHMrYKnqwJgv?=
 =?us-ascii?Q?mltlbUvqo087i58qDX6/pfm1ziV/2uEHvciNIAsBzWpIrbI5CjBtKUBw9/Df?=
 =?us-ascii?Q?Ahhwzm3wMFJndsJpugnLdfE3PYR/HaVfifG6GyycD1pWAtgI7CuzQHOjYiFn?=
 =?us-ascii?Q?lY+CkAe0aORcKhfEwTIK2bqrQa7MajRsfnZa3bREXMaF/RGOp8AP1JipOve8?=
 =?us-ascii?Q?sD4VULYRT49kv6SxiVx+tQ8uApkX4NZ0WDD3tXCba+3BVxmzK/ONOxIaPYh5?=
 =?us-ascii?Q?xzZNICn+e1qbZMdMlv5UzlztRja4e181I0hRVkc7TkrH+xsVg8dcCV2wC33Z?=
 =?us-ascii?Q?OQqXTrs9prC6qPLpHo2QSWWSEHz/Dfw89eoi+glRM3XtBFBncuo26P7/9iLx?=
 =?us-ascii?Q?IKLF7gXrLl3rVUniUwC6qkbYlQ+dIa89eIXiTmNLzsfoRi4TB1Mn+az8RodW?=
 =?us-ascii?Q?xf0NUUKvCeP963IOZXvsO6q+ZWYlx7sEFY9KOt+kp0dkZl+CDZaqCI0sAc4i?=
 =?us-ascii?Q?3PqEx02LksoOLsh37M6VzVAzi+B4po7lbwv9R3woisBT4udXDZ+8K5Jy+bZf?=
 =?us-ascii?Q?sgpAVIWjk4Tt7JHBRxDDJR+lkaBnOs4yU58PazbSNRWQ69uPAGyWG38o4dlz?=
 =?us-ascii?Q?jgA1Cwe0e44B5keINXEw1YB/5WiI8aW6UV8V4mVbF+FxmNG3mR1FUl4RMgCM?=
 =?us-ascii?Q?vcQSVnJfkSkflfswsFvLcH9a5WLirOPrRzTsoA7QvTuvyMpRKOPNu87vl6jj?=
 =?us-ascii?Q?inS8/2iRBnZMQXXCU+xdBaH1hYihJsl58v3mpkwgaa4o1tDtn2WIAaeDWyzQ?=
 =?us-ascii?Q?gKaUE5lrd6/nJs+1R1aOnrQoB9MBRt3872LJKnB9CLk8TsVFXbQKvny/yxTu?=
 =?us-ascii?Q?fQ7RKUDqcpH+seO42iRSWTDODlxzyUe+V9if4N90jQikTEe3xNpzonKsB8ZD?=
 =?us-ascii?Q?C4I71gWwA3BJYaq5Pr0jwEjUsQWZFhHM5YixE/YxYd/ArAIdoLd3/4gJCi9L?=
 =?us-ascii?Q?lW5WHWGcfV9dXaBKDS+9UKghejJ3HaeVPIXPcZs9we30k//MMCW+tbKUCyAb?=
 =?us-ascii?Q?OVnPzgjyEv2Fvp35BkaiX6bKjpoSvv/q?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a4Mlv2x/yHceRV6GRlP5aLhtNeEubV3Sxlk+PKL6wjuKpcx+5/xVdwaMi1Nv?=
 =?us-ascii?Q?kEK/ZCqAkJcC3oJuggnDCqkIiRQ9aDAPuU14NtsO1f/7YBGaGuMvK/jDpyP8?=
 =?us-ascii?Q?xw1BNxKaB5dcRAArdubbJFTRHdJWyUe/Tkx7sTXi3noqKGRFOvk7IB2wECCg?=
 =?us-ascii?Q?yaBLqz2Ocp34lg0GO2T6in1Dj4t96jOgBDI9IIxKxV9j/kPLuYBIDdEdgxgR?=
 =?us-ascii?Q?jlryrt38uSy9q7OG8n5nKtXC1449Ah4ySvmHp6l9pXePL98MIa75yX39SRtR?=
 =?us-ascii?Q?a1daGyZ7w4lJLJO57xGcSACR+zKMbGmKoG6lkR2EhqX0dpg/hihD6hfIZ1OB?=
 =?us-ascii?Q?AYyA+jlWZ9s8x6M8yGYQy5VO8fLuImqW6xXLqh0H7wyrmmyvGn8OnqaKwgC9?=
 =?us-ascii?Q?Z5XDZUGr+I6Wo5BdKOXy42EwSa88T3p6BjaXViGk5y8zldlp2qBGkiX2FMR1?=
 =?us-ascii?Q?tHAAW554JNe5LS4m8ibSDVr4imXAZPdkGFJ47wK3sq/xl617OdXzHNmdMHIX?=
 =?us-ascii?Q?tPARfsY7NDVznm1xr7rscDtMRMUl2/4Yl4mz7XEfZAkHAAxQYSNy01+JTm8Y?=
 =?us-ascii?Q?kVxcIawA3h7UoivNfzgNfaA05rMbFDa2sr7o2VJH0jMSeuItn1MFlb+dsWu+?=
 =?us-ascii?Q?Pl8ciEBlfvV2eHB5KdgsF3bwKNQBhu9OhXAjWnjWMDpCEVnD7ox5hg+WSTc3?=
 =?us-ascii?Q?U1Hjy+nSNEmM0GquXUrGrPMRmFdcD3fB0i8dyPUuWzkLwLa2NL+7nqmJUaCj?=
 =?us-ascii?Q?t63bxwG4JkL5P5hzA+HAk08e6D0soTV8f16D/Gk4kjVFYwU9ZB2hEcT5jPrp?=
 =?us-ascii?Q?ZK767Vc3gFFYqPqq37hcpwrgIlKkD9Kwo280iKbGnLcKY8Pv7bQsJCKd8WJP?=
 =?us-ascii?Q?M4DUqBrDC7m1TGnAjleo8Wr0IYDljtWZ8lwtRcq71l7WC31+prI6KH6GxrrK?=
 =?us-ascii?Q?f2fC2670p2fr6g7ldVUNVY/of5d0LgW6JYN9qVRb7p1D9kXYfwEmqkXlTSAe?=
 =?us-ascii?Q?s8FI7wQxCVNgNA1elw4XKxAiK9Oty8Ntr0Y1tD/YqeG0VkOWYBocmKpUgCUv?=
 =?us-ascii?Q?VgzcmE9yUPlLJWgz9sx4QtsmIFXGuQ4MAbBh/sfP6ROckQ0+5Rgvp+uSkQGl?=
 =?us-ascii?Q?8t+NFwnBJL/RSrSw/PgXq2P+yW/BhvgiWhRrDEOQAwulkLcl01DX+jWcxZiC?=
 =?us-ascii?Q?py9GpUbph7AtBHk+4g/K183/LJuJGarYkLIazYG2L+d/UUEIVbtaXYqSNyfH?=
 =?us-ascii?Q?mX99cASBaB+qnK70leK6cB93keTcQ/5ExgXjYKZmoYwsjyH2zdnMrZJOsPgH?=
 =?us-ascii?Q?tuCR3SpbnTVV5qeNBswp6vcnQtDSryjJkhlOng4D8L1FxffprXgzQXQToS5F?=
 =?us-ascii?Q?C9rGSVG/pRbti73zwX7q0mGOO6Dh3bb8yWvQtgRrRHGtjTxLYYDQoswoQHSo?=
 =?us-ascii?Q?8XcDZ+7bUJ2Ldpybts/I6024cflmx5HH43ev1djUgDoGcQdhkn8HQbSqgU8b?=
 =?us-ascii?Q?OqltU/XlWFgEq5aVQSaQ8g0pkU3ImXtU0YmDpkaEFdo29DPM6/jUcstm614r?=
 =?us-ascii?Q?2Jb6/I5n6w6o/mFxZQm5FeGorH6Mk2GcCgK/l67q2dvScM+g8uJ6YySTsFoa?=
 =?us-ascii?Q?+A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f059ed1-064c-47e5-3259-08dd3ea6a9eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 07:46:09.2277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gyx3jNxDiLx7ejqeLK85XupB7l1pkzaIQizuMx1Jn9bF1+T5yXxg0zbzmaawOiZ33/+a6VOBovlSm4g5qxiFiGw6Xkx/1SPfou3uV5zY8UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4744
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

> From: Laguna, Lukasz <lukasz.laguna@intel.com>
> Sent: Friday, January 24, 2025 1:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: marcin.bernatowicz@linux.intel.com; Laguna, Lukasz
> <lukasz.laguna@intel.com>; K V P, Satyanarayana
> <satyanarayana.k.v.p@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>; adam.miszczak@linux.intel.com; Kolakowski,
> Jakub1 <jakub1.kolakowski@intel.com>
> Subject: [PATCH i-g-t v1 2/4] lib/xe/xe_sriov_provisioning: Add helper to=
 get
> VF's provisioned quota
>=20
> Add helper allowing to get VF's provisioned quota based on provisioned
> ranges exposed in debugfs.
>=20
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>  lib/xe/xe_sriov_provisioning.c | 56
> ++++++++++++++++++++++++++++++++++
>  lib/xe/xe_sriov_provisioning.h |  6 ++++
>  2 files changed, 62 insertions(+)
>=20
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisionin=
g.c
> index 5ba348131..aedf9bd91 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -8,6 +8,7 @@
>=20
>  #include "igt_core.h"
>  #include "igt_debugfs.h"
> +#include "igt_sriov_device.h"
>  #include "intel_chipset.h"
>  #include "linux_scaffold.h"
>  #include "xe/xe_mmio.h"
> @@ -299,6 +300,61 @@ bool xe_sriov_is_shared_res_provisionable(int pf,
> enum xe_sriov_shared_res res,
>  	return true;
>  }
>=20
> +/**
> + * __xe_sriov_pf_get_provisioned_quota - Get VF's provisioned quota.
> + * @pf: PF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @vf_num: VF number (1-based)
> + * @gt_num: GT number
> + * @value: Pointer to store the read value
> + *
> + * Gets VF's provisioning value for the specified shared resource @res,
> + * VF number @vf_num and GT number @gt_num.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_pf_get_provisioned_quota(int pf, enum xe_sriov_shared_res
> res,
> +					unsigned int vf_num, unsigned int
> gt_num,
> +					uint64_t *value)
> +{
> +	struct xe_sriov_provisioned_range *ranges;
> +	int ret;
> +
> +	ret =3D xe_sriov_pf_debugfs_read_check_ranges(pf, res, gt_num,
> &ranges,
> +
> igt_sriov_get_enabled_vfs(pf));
> +	if (igt_debug_on_f(ret, "%s: Failed ranges check on GT%u (%d)\n",
> +			   xe_sriov_debugfs_provisioned_attr_name(res),
> gt_num, ret))
> +		return ret;
> +
> +	*value =3D ranges[vf_num - 1].end - ranges[vf_num - 1].start + 1;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_pf_get_provisioned_quota - Get VF's provisioned quota.
> + * @pf: PF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @vf_num: VF number (1-based)
> + * @gt_num: GT number
> + *
> + * A throwing version of __xe_sriov_pf_get_provisioned_quota().
> + * Instead of returning an error code, it returns the quota value and as=
serts
> + * in case of an error.
> + *
> + * Return: The provisioned quota for the given shared resource.
> + *         Asserts in case of failure.
> + */
> +uint64_t xe_sriov_pf_get_provisioned_quota(int pf, enum
> xe_sriov_shared_res res,
> +					   unsigned int vf_num, unsigned int
> gt_num)
> +{
> +	uint64_t value;
> +
> +	igt_fail_on(__xe_sriov_pf_get_provisioned_quota(pf, res, vf_num,
> gt_num, &value));
> +
> +	return value;
> +}
> +
>  /**
>   * __xe_sriov_vf_get_shared_res_selfconfig - Read VF's configuration dat=
a.
>   * @vf: VF device file descriptor
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisionin=
g.h
> index 1a05c2c59..0381b564c 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -90,6 +90,12 @@ void xe_sriov_pf_set_shared_res_attr(int pf, enum
> xe_sriov_shared_res res,
>  				     unsigned int vf_num, unsigned int gt_num,
>  				     uint64_t value);
>=20
> +int __xe_sriov_pf_get_provisioned_quota(int pf, enum xe_sriov_shared_res
> res,
> +					unsigned int vf_num, unsigned int
> gt_num,
> +					uint64_t *value);
> +uint64_t xe_sriov_pf_get_provisioned_quota(int pf, enum
> xe_sriov_shared_res res,
> +					   unsigned int vf_num, unsigned int
> gt_num);
> +
>  int __xe_sriov_vf_get_shared_res_selfconfig(int vf, enum xe_sriov_shared=
_res
> res,
>  					    unsigned int gt_num, uint64_t
> *value);
>  uint64_t xe_sriov_vf_get_shared_res_selfconfig(int vf, enum
> xe_sriov_shared_res res,
> --
> 2.40.0

