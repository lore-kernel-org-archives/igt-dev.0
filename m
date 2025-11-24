Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF99CFA466
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 08:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B17510E1E4;
	Mon, 24 Nov 2025 08:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ED2H43XZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716F210E1E4
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 08:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763972318; x=1795508318;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dk8ucnK2hnuBnWTl9i/xdTX2Y6/omeDgM9E1yBcy2vU=;
 b=ED2H43XZLxJtyMOF4NtVkwMUblWuUUcKLXzGdsfynWU9fGgr8F9BM1Ap
 kwzXhP1ovNVYzBV0Mx2afFYTs0H6p3Nj45hdbD2oXz3TtmJ3Kn4cGRr+Q
 UnRgY+TDNZlFgmBKtXMKx6cjmGR6SkRsjieDSRmjMw1BDeScD810swKEn
 hysdwtr5AyzpGeVfvDtKOat8ozU02EcfQldNe7esJz9aO8xRJMpy4Vb/r
 15OxkO6kfnf/G2KLCKY6XyPbaaZD3Fm5BHy/flam1XK6xR3T1HxJlyPdV
 w154riT4G9iLuJIzAAi8tyLBJPRkJKPnrtc1Pp+/gu7P3TmL6qAbkSkr9 g==;
X-CSE-ConnectionGUID: TAowcQDoTbiVX1wMUEj0wQ==
X-CSE-MsgGUID: dSGycR6GTJeWUGEU62fNsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77074472"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="77074472"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 00:18:37 -0800
X-CSE-ConnectionGUID: rZuj0TvZT42vME5OcBK/Jw==
X-CSE-MsgGUID: WGoyAPWZRcqEFT8RYOJQdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="192059895"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 00:18:36 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 00:18:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 00:18:36 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 00:18:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPkkgxFDtJCfDz7s3X9XiWKh2U+rzl17NEB083dCmuMtQxICciou4PvBn2DlN3MZhvtE69X+8u/jJCaVuBimpUqQ9uf0ksf2nOzOx290aVufe4njPwVLOB0ApOoTZGzFHDVPXpieTGvSUDSeuJZsC+82g1PD8th8B5B3UZpsr+2IAcjojjOVgW55LXlEPljxN/3eZFHBKA0Nhsmx9wy2NQErFWDzeRqPcXjI0Fz6RxH60bMhvoicYkF6bc0bOhh5rRHroFUhRlLvXTQw4HelKTMEdYcdZwnGRwrX/KUbMXflM17J22GXl2xM6oLI+sQjoOTU516vZskyM+a4UkvNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1r3CTo/GUZE12YdV1TWYDDeSh2SGvn+DCXdHrZIrxXw=;
 b=aKr0dBEvRDzwvHUHyxDkxd0AOUvHwyxOLc7LTZZGZSDYnjtrTUMf4cBhfl3zQHV1U6MjFVOJDPFULCw7a5LfXrJUeVzquIjxFgxmiRFi71RcJodPuoX0nqrnyQMd1M/z4DFhYRsoCXiFs7O96QyJah29i9xfHjLhIMpnRguf2vDYZ75FHkTP1pTbgCGz/ODI3BOu7eHWh8hA/q8Dlw96KeKa9e7HcxPjlwm1xvyhFGEo3BVltRuvhfEHNqCwf8vr/TSYWdRpR+3v/GeGQGSbjvTjwhiJd6ljqeC/3XEHoMFiXHqNSK8aFHSK1U+QODtxOx4lTes36+67T/AEb5G9WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 by IA3PR11MB8895.namprd11.prod.outlook.com (2603:10b6:208:579::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 08:18:33 +0000
Received: from SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48]) by SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48%7]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 08:18:33 +0000
From: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH v2 06/19] tests/intel/xe_exec_multi_queue: Add close-fd
 tests
Thread-Topic: [PATCH v2 06/19] tests/intel/xe_exec_multi_queue: Add close-fd
 tests
Thread-Index: AQHcWpsFdrv/aM+6UUCKI3acsW0A5rUBgCNQ
Date: Mon, 24 Nov 2025 08:18:32 +0000
Message-ID: <SN7PR11MB74894F31194DD78B0C48668B85D0A@SN7PR11MB7489.namprd11.prod.outlook.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-27-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-27-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7489:EE_|IA3PR11MB8895:EE_
x-ms-office365-filtering-correlation-id: 8df2bc98-af5a-4dca-22a8-08de2b320ec9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YyeOVbROfBwJwKH1aZ3GpifkjNjoZ+TfiHMPdTrNyGnDHl1QSx1VNcjcfZmv?=
 =?us-ascii?Q?sPDjo4/Dbkdn1UXbUkykhtS0Q3HfI+POsg/1RwiHFHVajAFJ58h/crbK62+f?=
 =?us-ascii?Q?7VhJQE7vnOVaUFB+fQGq8MIsSLDiyzAJtLBIgUiDnQMAJZwyQl1BKACCe8/A?=
 =?us-ascii?Q?2lJV/ZQoE9NghSMNuTuOIQkzVefU3gRfJvCop6JO+Dg38wAHGxfMBODZrl6R?=
 =?us-ascii?Q?IUp6BFBQvZTUfp7nPoz+xogDJH8PKekOtS3K89/Xl+wf1lzncyZXpAIVXjzx?=
 =?us-ascii?Q?N9y+HAb8NnF2Oplah3d2NEtz5pius33vgkZpj208VZlbobhkSMeOSoOlwzAf?=
 =?us-ascii?Q?njYshGlLGaeeM6JeJwMZJHCJZckW6ZoSiTllDnTP+BG61JKe3VX27KIuV1RT?=
 =?us-ascii?Q?KU0gU6A0oJ5OrrWRrMZkSMiytgcq1b9fHrQfjWEY4N49iPjCxiD8jUx1rEhF?=
 =?us-ascii?Q?HknEfu5hrxtWd38JkYqBdE2HQakfYyYSkmmz31ehfJF+oc7aoIZFtUipN/TL?=
 =?us-ascii?Q?N5A0YBMvko7DIEMUyLizGK4+28b9hpcMnR83NCZxKOmtihWvIuj2U5xVLTwq?=
 =?us-ascii?Q?s4ww8WqO3BHifPepQe5IX2eKB6EXDTOI31O6Dzajn1P77KEBETxmZn3WnOvK?=
 =?us-ascii?Q?r8RlXSFT1jEYvQ3ce0wdabgETwcs2nLn200QrpOkDI4yEgxWBEJkQzFzlVWQ?=
 =?us-ascii?Q?Vkb05GfNVcy62uphg96pA5pPGpO7bnk1KRhHPAa6HZBbByC+vzKdQ4eqWMgK?=
 =?us-ascii?Q?4Igf2zS/1ZFHyzULC7GzMbxla/NfGzLisPFMo0hGmjT12XDFfAmWwb3vja4R?=
 =?us-ascii?Q?67or/9U/OzbODkHKxP9MVupB8Q+S9qD1omqkFrgM846PMaX6xRWEWo4CG+yI?=
 =?us-ascii?Q?Yku6vGpi91l1T8lU/N2+u+D1wAYBkYVukiWV/l1d6MsULkm5GFuHpU73i0i+?=
 =?us-ascii?Q?ncN44rHiZmgUUpVMEEwFxqznBQeY/A1Gk7FOpiuZtqiAfiMZuIw6i9C2x3Je?=
 =?us-ascii?Q?dGnG9mDwOEM+r+aojwp9pQevODYDBwUlpJEIKcTVb6ZFdjhuyJs0ZoF142oW?=
 =?us-ascii?Q?nR4F3h8GXUL1hjC4nDUn1osR4IQ+XjtqyXbvSxO+XPBLbM0hGZDruTrrejIj?=
 =?us-ascii?Q?nR/M0coNESaumfh9XsW6ir+gmPcA/zJF5hudvwzHa8tAQQqxdyBSyyTHF7kM?=
 =?us-ascii?Q?4JjfmPxjOoXEB+TF4K+1mw9bnwL8hZSIwNkniumzk8SvHLPD7SjxurPx1/5T?=
 =?us-ascii?Q?lzrKvGWBJ47PO6oxSzs9jR1SZG7w+vE6xlDdvvSYVOp9Ob2y1A4TaL85Z29Y?=
 =?us-ascii?Q?9/2Ivz6w5KNZMdJ6vKSo1HY2jkdq3G8Om+CQY51D/2F1zi6jMK+L8vbOiCfN?=
 =?us-ascii?Q?EivYfJkULzHi7d5brbErF1MLMhvwzmdHxrPAAMC6avchlvH26MjHsFQkjPLF?=
 =?us-ascii?Q?2BjIN0mZ/Hff5JeQQHPeLVI6yDXeVcoEI+ZR7UeQjFv0GzTUCgjSotm4axmG?=
 =?us-ascii?Q?B/rkcWJ71IAL4BTFb2CsheTZsFIQFog2ijo6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7489.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rwUwt5WBnumOPDwBYlTfx1mzmHkmQg6YQIqshb+4QXjexDwPbn/b0vmnzuaI?=
 =?us-ascii?Q?VeDUJU5iNkLAX4Ftmh4LI/0x0UX4/8a+dTrjTxN3CITdtQ63qIC7RK555mSq?=
 =?us-ascii?Q?B2phMk1u6h8b0tG6Px8nJjT3xYjt6HaD1AhFjviyIYTRLLtEridLoc00gRIT?=
 =?us-ascii?Q?KRV9Lm4+6RD7tErZUrp7DEjV4oYC4SFzWNICOD4VPdEKxbbDgv7TLfW8Vxok?=
 =?us-ascii?Q?U4k7kLcfz1V0bM4KKmbYcvQbt2f82LNhowapL4Uo6Rdom8xvDMCxg1JjKTym?=
 =?us-ascii?Q?buO2XW/fdxLc9YceB5T49t6ZvOwvFOvvxGxdIL2eWJB6LxA/e2CbWpBUT2ks?=
 =?us-ascii?Q?FX9yhfzhrkMvlLQ+xUMHc7rJHLeogmbDxSreAxYuy0+Q+EJ+cjReBXt1TjhP?=
 =?us-ascii?Q?xVhXc+txx+IiqFKRzbKK1Ps9rFM6PjVy/nNYawRnnLuLiaGUAXjwEzCR+Uqb?=
 =?us-ascii?Q?fz+rJKSol4/5FDl7NQCaMVM3dUNT+xziqAOjSjE95EHwMPqPLMbXMQf/Cetq?=
 =?us-ascii?Q?sVQh49QWmS74P2CCSSQlpWE0ZpkWAzron11Zr46RkScOaFVG6IFrqB0lErh9?=
 =?us-ascii?Q?ORlzclMZN6xyh9kuAmW6BfLI46ZsZ3OMSsdbaRW2inBqKer5DF0Y0BFmZ3wU?=
 =?us-ascii?Q?O7pExOTiruqSyat+JRaZYEMrpo9fVmLxUGdGoVwJECpuDcMAZFRxGhdOFM8c?=
 =?us-ascii?Q?6rp1Zfcnck0BXC6L7JIA6SIWzQ7BREyUxsMe8QiDHHBV3iomf0VBLeJTIGUs?=
 =?us-ascii?Q?O1Htyvas9D6w5Vzr+fWQxj6sAhY7JiQ/ueyiwbP92Y2KCXrIU2DR9Sj9RSJk?=
 =?us-ascii?Q?2mk9vSh0crdeTpKlNLNFevIUUD83JdYPdd9V2N7LfSltEpXGS9Dp6Rrn3F4r?=
 =?us-ascii?Q?/GX1xnd4blO0AFeMtzyvMht9cPzGhMsUXb5Q8a/9UD4jAPjoOxjcqQ+XNgbG?=
 =?us-ascii?Q?DovF5uVQsqi62IyHfWgQW25HRhvugKATzumGJePlMgpUI5HQGg39yW7f3R0r?=
 =?us-ascii?Q?c2RBtuRo/xUcpJYDFiO5NNAXVTxFKD5OsWChjVFxOp0lddb74KP8tTiHrKYX?=
 =?us-ascii?Q?cNkGwtqYiXQXn0HO1gAzYGsFgwMgF8i9DdCduVtvFrJ2+rzMgRN+uFfPZ2Qy?=
 =?us-ascii?Q?S0VthVETlP+8McO85e+RekAAOudBcL5QfLFiVxydSjt2YXocnsHpyix5aKmj?=
 =?us-ascii?Q?vEe4N1NFu9pfoT3E5eCcHREKVS05mdRCsvj+RM4vk8r/mE5SM+0grfHxGL3a?=
 =?us-ascii?Q?W3kH3uBhpiLBD238I7Lu7ubEu/v+GHQ2NwDDRaz7p4XCvWgdl+/AfloWqcYs?=
 =?us-ascii?Q?jvZJ/tHBiH0UpmqzFOCzXlIKDjlD17N5wJuXDyA0mD3pSFRidUQpdSh2uBFp?=
 =?us-ascii?Q?Vx4s0eWrZSOjKYaVCxFhJjLevpGRBlE9EQfoWLdvTJV0Up0JjNRRkVCTkwnc?=
 =?us-ascii?Q?vKEXrWrYVu9ad1BumI5atdfzp5J7Qm7iMrkpkCK+1Ht9seFOnQ6JOmvew5ws?=
 =?us-ascii?Q?82BXSTSVXeL+et/nup+/aWMV+driF4JaY9IzHaJTbw8WtT0dUWDOaxTFeJ8S?=
 =?us-ascii?Q?Sx4JUvSTnEvg7Cbg4Z6MS7lrBZ3bOaIWcnfxjbb0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7489.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df2bc98-af5a-4dca-22a8-08de2b320ec9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 08:18:32.9011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AYk0KGr02X3slexJQ0P+ps7cfJafwHqxk6XJOgHQkebLZVla7lVoMUTaV1KKGpalvUEfCr/c91dlDGKhd09ZGtbJkWfGfa9USkv9/LDsZus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8895
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Niranjana Vishwanathapura
> Sent: 21 November 2025 09:27
> To: igt-dev@lists.freedesktop.org
> Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>; kamil.konieczny@linux.intel.com
> Subject: [PATCH v2 06/19] tests/intel/xe_exec_multi_queue: Add close-fd t=
ests
>=20
> Validate closing the file handle without destroying exec queues.
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
Looks good to me
Reviewed-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

> ---
>  tests/intel/xe_exec_multi_queue.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_multi_queue.c
> b/tests/intel/xe_exec_multi_queue.c
> index 3bbcf7975..df60835d6 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -27,6 +27,7 @@
>=20
>  #define USERPTR			(0x1 << 0)
>  #define PRIORITY		(0x1 << 1)
> +#define CLOSE_FD		(0x1 << 2)
>=20
>  #define MAX_INSTANCE 9
>=20
> @@ -233,6 +234,9 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_place
>  	} *data;
>  	int i, b;
>=20
> +	if (flags & CLOSE_FD)
> +		fd =3D drm_open_driver(DRIVER_XE);
> +
>  	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
>  	vm =3D xe_vm_create(fd, 0, 0);
>  	bo_size =3D xe_bb_size(fd, sizeof(*data) * n_execs); @@ -321,7 +325,8
> @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int
> num_place
>=20
>  	for (i =3D 0; i < n_exec_queues; i++) {
>  		syncobj_destroy(fd, syncobjs[i]);
> -		xe_exec_queue_destroy(fd, exec_queues[i]);
> +		if (!(flags & CLOSE_FD))
> +			xe_exec_queue_destroy(fd, exec_queues[i]);
>  	}
>=20
>  	if (bo) {
> @@ -332,7 +337,11 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_place
>  	}
>=20
>  	syncobj_destroy(fd, bind_syncobj);
> -	xe_vm_destroy(fd, vm);
> +
> +	if (!(flags & CLOSE_FD))
> +		xe_vm_destroy(fd, vm);
> +	else
> +		drm_close_driver(fd);
>  }
>=20
>  /**
> @@ -365,6 +374,7 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_place
>   * @basic:					basic
>   * @userptr:					userptr
>   * @priority:					priority
> + * @close-fd:					close fd without destroying
> exec queues
>   */
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci, int
> num_placement, @@ -383,6 +393,7 @@ igt_main
>  		{ "basic", 0 },
>  		{ "userptr", USERPTR },
>  		{ "priority", PRIORITY },
> +		{ "close-fd", CLOSE_FD },
>  		{ NULL },
>  	};
>  	int fd, gt, class;
> --
> 2.43.0

