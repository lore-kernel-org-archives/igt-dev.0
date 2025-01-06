Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44262E77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 09:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF1810E5E9;
	Mon,  6 Jan 2025 09:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNBK6NmS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E82210E5E9
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 09:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736155716; x=1767691716;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zq/qDZ4Xoua83iEfwprRHYVRz71PvuufB0NGua9TVc0=;
 b=GNBK6NmSm5rNu2Oh7sRet/+ugcMqOK20QYXJrV6lTT3a9OSBQCV8PSeN
 g7HmdqYiKatUGwfm+sdgcsK+VpsJQQZJzDWTGm/dtF6Mb8dx6TUFhQ3tf
 oB7HqNHlqumuUyJ7BCTA3Rjrw2P02DyaHUI/Tf8sMjgU904rZMGfwhBEt
 tePk679gGYs2QKdPjIsSF4rCAoN/kiqvHaqmheYfRnnlHDQk3ygSIc/sg
 O0/1pDQM3MaGvAp6NX+Xhw22gCT9DaLdC4F8kVFqe2vgL+RutnhN+CL+5
 nB41PHHTdT2S/kucgihy0P6X0pPKoGYjLbbs0kAhq+CZE/O/6ACfM6woH Q==;
X-CSE-ConnectionGUID: 0diOWlJPR5SvM3ohEOXVCw==
X-CSE-MsgGUID: c6G06XOsR+ujI+1jRYyhcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="40067748"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="40067748"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 01:28:36 -0800
X-CSE-ConnectionGUID: v2nDSVF+SsSOwUlPlENX1g==
X-CSE-MsgGUID: V0y2Ib6NSYe0alZQf4Kemw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="102470168"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 01:28:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 01:28:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 01:28:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 01:28:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdmSA/i5QIOt1xD4uadIiFHZxy3RLaUTQlKXnT39yNTKdA4ieDU/iKcooYrr9QS5hTTmtF3p12pha6NECN7DuwJS3cOQudMHGlhd6HrmoQ3GhisL8d5JIYdkfBaftSMtsevwTankijkJ3pg+Zms9A5Fy+RsGq/Y9AC6ULneOMA0lvm/zsYkfdT/Q7Zg3XTqb61BK8BiiOdnO5qgYj9BGOJ0UfjzVJ8JyyhcGFAjES30mCQVpyz90r0E9Y+zcspdhsVIOEIC7gyGCGyitlf/f2T+fBaIhESxKLXD9zcU6XP8E6ZoC5jNe+NU9SkBXmrm9+3MuTncEGSdBVDIz4MB+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1EKrtKxKUKQ7H/or8eq2E5vshv5/KZCr4V2yeX+7DI=;
 b=EISYy4CN6yxWvHMKAkMcYSx8pYMRLvnaIUngur/wBJ6ErlrUBO24F9Gk6AMp8v7o0m8R9eeZRWPIeTKP5ILxwMarSaaNkIQWJTToJ5ht7q8QbGoH48qcLniDfhl5/SpQ1bbrz5H32wy4bFOiiU/39/qpWwsz8fShb14tbR3Do+/RJLUoCN8Ch8VKOgUnDdxrclytF4y9tWtk2cDnoSxEHjl2doPLO6S+FCXcgS/BGLxUGJh71D6GOtiGXNRWHif+A/BmB9lEQm760xhKmAEKiaKAAyIPa1oCgzsSuS6UlNxYczwmKwrj5FJ2tUjbquuNWgqePKc/AUVkwNWj4rtQ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB7311.namprd11.prod.outlook.com (2603:10b6:8:11e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.17; Mon, 6 Jan 2025 09:28:22 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 09:28:22 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 1/4] tests/intel/kms_joiner_helper: helper for
 joiner-related functions
Thread-Topic: [PATCH i-g-t 1/4] tests/intel/kms_joiner_helper: helper for
 joiner-related functions
Thread-Index: AQHbW4xNtgBFBDpR0EeH4FWejKt1X7MJe/xw
Date: Mon, 6 Jan 2025 09:28:21 +0000
Message-ID: <DM4PR11MB63127196CB8D1EB071FECDA590102@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241231141518.765212-1-kunal1.joshi@intel.com>
 <20241231141518.765212-2-kunal1.joshi@intel.com>
In-Reply-To: <20241231141518.765212-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB7311:EE_
x-ms-office365-filtering-correlation-id: a2bd589e-b4f5-4743-92d4-08dd2e34768c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|7055299003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kE0zNqSZMhExTndteK5Bju7A80mXyBQViImzSssCQugkt9Zkv0iIn60WfhV+?=
 =?us-ascii?Q?zF5LRvRTeTy6GKTVcGnF5XmEuCG/vz/69rG19m69O0aQJ8p4bkwl9PtzghHD?=
 =?us-ascii?Q?Tr7HHqz1uHXYVyEfsQlbfjSrmJKXy6eyzibu2I9ok/2ftvVj1Pv81yDS4+XO?=
 =?us-ascii?Q?rMwnFJbcGEQWdmdfqCSWLJT7IaaWQTOIOIQyqhUfeNuhYhsjfsZg269WwXlu?=
 =?us-ascii?Q?P3sMuugLi96Zux1PtjtW9x8kEa2XytuFHdXnAxjXMS4numkbpMB/k+54bU1R?=
 =?us-ascii?Q?9chdF4T2/IUctn1Ximqa/hlYI5xhXjSbIecnhQL5BlovpyhP8sZR0yLMyA8g?=
 =?us-ascii?Q?UomyK934SlYqF9PYcK8la402VD/e6xpoMiDAI6TBiASAdGGxyaDv+ac8lofg?=
 =?us-ascii?Q?n5bGT91aUuZIPdSwro6adauddXzrrXuvrbv7bNtoZ6AvCoM7zFArKBDX4Qu9?=
 =?us-ascii?Q?GNZJPJPc1CysfnO4Bfdla0z3mrvFTG2N5PWW9d6PHeOYyt0eqh5HQCG8NXY6?=
 =?us-ascii?Q?c0dOWXcf74Xj3EWs0wFQnXZ4VQVkCzzOMtx8lFnSnHsl6HJ75hM+198mfPLx?=
 =?us-ascii?Q?Bs1d01UbC2OtQm4IMBAbz+Kdv+xRocMvei3GC58S8jKHlDEvWMdq2myGyhXq?=
 =?us-ascii?Q?5CoMqjcAMBraU4QzNRRjRlzteSnd2kwSRZ7w4Xu9sG12q73Z53D2N/Nxh/g4?=
 =?us-ascii?Q?zQWy6g5mzSxKL6MlMGUnW6JUPZrmXB6+FDvLraoIqRvBUH5nS/f1wxEjv5O5?=
 =?us-ascii?Q?WUzVfd+GCeZkSptOxSSpzTXOX3twak5PyDyVw7N/myUmT+F/jJCY2wFOVsbg?=
 =?us-ascii?Q?cteObu+UWFRQ5/ykk5hP3I5e3P7SeRK4+17dBh8or1uIRh0U17Qnu/BNna0M?=
 =?us-ascii?Q?gregJpXtThkexfh402oInbgk9qaRXhpLESgVUDjOtfzAUw9OtKQvQf5T9m5F?=
 =?us-ascii?Q?usLpIr3vkQBVLkJ57UQkoa+fQ2CN2/+tgBQRMRRmzQpCPuZbyAaeozqpdU8C?=
 =?us-ascii?Q?OvZIKEkiU684SPBQ/gO3KTRpmtBbdGb3IS6E0Z2Meu+1KaEGZQDP4VhINFjt?=
 =?us-ascii?Q?6x7xFou4Mn2e4zBppMqdTBCIUYQkSpJUrjQF7BEl15iC60EFPiJxbf+EN8tf?=
 =?us-ascii?Q?Ee2crEQ7rDEDV/Bovhddw75JzW/mSeFv0Wy5wxNllF2ELiBEabv0V4/UovQ6?=
 =?us-ascii?Q?1a4rprUAmjT3+gLdsfdWoPHZqqW7JSFq3s336S3Vuwjy5jrgg1nYfV9cLO1I?=
 =?us-ascii?Q?ZM+fPRHBvU1aIK8HuQWftpI+tZ+T2eLeLWcLFxBrtchXFaAeWvPoSd4hqGDr?=
 =?us-ascii?Q?0gIK8iexodMwQHhm16Upc5si73lDNxnlj59ZPcRK4XYV488DBx2jX4C6zd6t?=
 =?us-ascii?Q?KjGBb3EcyIn/anapCp0Na1MI3S6JjkXZdFFUp6MK0RqRapF+EsFPt4JOqh3+?=
 =?us-ascii?Q?KEaklopqOiumxv5pDBHSPdHPhaMIUYJYvjahpf60HCm1WOI+NSdaog=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(7055299003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xsB9UqbLR9YiPjmcQU87w5VOf3pKnP/WPqToFlYeupj6I+pFmdn7bCi4d/Na?=
 =?us-ascii?Q?r5P8zzcJKI5hu/6xs2PUgDWAB2HwJ7oZ/Btr8aiRuXXlbYb1ncZHGHqjBIAA?=
 =?us-ascii?Q?TeAUpLK5h3ct+Xvrrbq7mxxqJDYODRPLXeQdzrGOJ2w0QykaccS7yg6IPtTz?=
 =?us-ascii?Q?2aaqKJAJ2Qb2NK6WL33WwXtL7LSlcyokIfImvo/9XAfD66001gKIbLJcYm4Z?=
 =?us-ascii?Q?4BJ/38QnVNCV9+cd3ogNkXI6wMxyC2u6ytBtZjLvHyOVDeW+zz+X+Ruzwpbg?=
 =?us-ascii?Q?nbyPRmEOoOp4+SzZu5dtB8CH6PwIE7+fyJRykYVrQ1Vh9Wk+oltSIBzxYL9g?=
 =?us-ascii?Q?meaOytKV35cf8CV6YlnqggSgD/fHJlkrmEOcEf1ciVmJFVpvwQZnquTaq75D?=
 =?us-ascii?Q?vVjoVfaeRNKp/FVxI1RNYjrL77SNgPLSelNpk8UTO+1gh+iKQAMY+JmuFBXx?=
 =?us-ascii?Q?v6KCOcUtRymd2skggwO3IjrP/Az5eFPxToJ22bBJd+mFG4wR9EbYQzk1oInO?=
 =?us-ascii?Q?hJ+uwXviy8S3+9x4U4ylaFskwCB4KvNiIvLauSA2+CHkHUIiSNjksBl+LZCY?=
 =?us-ascii?Q?H8mDGnu6+cEfu5MQR3D+a/Jh7GxY2ZZWLod0MSth+n+GJfu+QI35t9SHnSLi?=
 =?us-ascii?Q?TCB62IuwK+zFdrmEfflcg4yUgrSML8xG87HAJ0zOXBPvnjlC4U4L2I6JEcv8?=
 =?us-ascii?Q?KCZ9GB6pUBN5lctkAzhSqu79c19HjT0Sr6gik+j+lTjtiVpI8kIfbXpSkItw?=
 =?us-ascii?Q?dxZT0OLZnAg5K742kh6j7TZWkdBxexEF+7ICg+GJ+jmPXpCRbPpIonzapXOZ?=
 =?us-ascii?Q?NjsiC0fKvCtLaHLBJz9VnFcr20+cVdtXLPsP/sH7xtbjJYxLVTfVEFMfAtEP?=
 =?us-ascii?Q?kXV9ATmwY7eK6urGm02c38o3K54OohyEU4YN7dl6BWyHR+b2BBXLQVi/rvQm?=
 =?us-ascii?Q?Z8LX/X04vPbZW8cF/+T4fLi4epcQr47ShZPm6hhoFoD3ljX8iUPeZ1nfDTjl?=
 =?us-ascii?Q?M4Wt09rGdnzpC6HesTAxu77PwUt5kmva60F+HXydgkgRNw3Fj2FUUmd1eFAm?=
 =?us-ascii?Q?//r0PzQB1+Dn9YngvPlWvRT1wkKDhpKPMwtrIijhq9Q2qr1WlSffhpIa4Efx?=
 =?us-ascii?Q?YgK+gn/KWAxEReTvVMCk3EH43SfHvZ02pPLhhKrTdGN5p8cLwr8W8Sizo8po?=
 =?us-ascii?Q?pWFbfrEN++QElRusgXkTY6UuJC7Jl5R1HbJG4mtNL2j/zUWJEAH6xdaQ5uvi?=
 =?us-ascii?Q?qsRaJlC4XW7AbR1+bx4saP96s6XSbe98IaXchx3Mh/qGIj6eVSlwLtSzHC2Z?=
 =?us-ascii?Q?necZrZZogBETqL9IbCXnqHCzniCIZoRn1/0/wToK9scg+agZ8kVnUx/fn8y9?=
 =?us-ascii?Q?TOgUQ0sHCISz2lHfIJczQgGbcGH6C3jzImVOsvCt3UN18zPrgmaCmYCbSxCm?=
 =?us-ascii?Q?nTBTvvCNu2niDWsyurWmcKquCEqI389LP5L8IQ2LVMBUeC7PhKbrlE71UGc7?=
 =?us-ascii?Q?gNylSws/pULAgNnA8gO0As2+863bWDrBUVM5MBCNeuMlu0Lvfx2+bfA4KYSp?=
 =?us-ascii?Q?UHFZ0rZqI9NF4S5kjL0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bd589e-b4f5-4743-92d4-08dd2e34768c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 09:28:21.8481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q6a0s3h+1CHBnFOEjKqnCPu5JY6gadk7D7YW9U7Su5rZ1Cqyhp+4A0If3k8vs38qoiRJ78v1Omyuaazwet2cNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7311
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Tuesday, December 31, 2024 7:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 1/4] tests/intel/kms_joiner_helper: helper for join=
er-
> related functions
>=20
> This patch introduces a new kms_joiner_helper.c and kms_joiner_helper.h t=
o
> handle Big Joiner and Ultra Joiner logic in a centralized manner. It prov=
ides
> utility functions to set and manage master pipes, as well as to assign
> consecutive pipes for multi-pipe configurations. By moving these operatio=
ns
> into helper files, we improve code clarity and enable reuse across multip=
le
> tests requiring joiner capabilities.
>=20
> The patch also updates kms_joiner.c to use
> igt_set_all_master_pipes_for_platform()
> instead of the local set_all_master_pipes_for_platform() function. This u=
nifies
> the approach to pipe assignments for joiner scenarios. Finally, it update=
s
> meson.build to include kms_joiner_helper.c.
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM.=20
Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_joiner.c        |  15 +--
>  tests/intel/kms_joiner_helper.c | 179
> ++++++++++++++++++++++++++++++++  tests/intel/kms_joiner_helper.h |
> 15 +++
>  tests/meson.build               |   1 +
>  4 files changed, 197 insertions(+), 13 deletions(-)  create mode 100644
> tests/intel/kms_joiner_helper.c  create mode 100644
> tests/intel/kms_joiner_helper.h
>=20
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c index
> 418ff26a6..0151dd182 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -37,6 +37,7 @@
>  #include "igt.h"
>  #include "xe/xe_query.h"
>  #include "kms_dsc_helper.c"
> +#include "kms_joiner_helper.h"
>=20
>  /**
>   * SUBTEST: invalid-modeset-big-joiner
> @@ -97,18 +98,6 @@ typedef struct {
>=20
>  static int max_dotclock;
>=20
> -static void set_all_master_pipes_for_platform(data_t *data) -{
> -	enum pipe pipe;
> -
> -	for (pipe =3D PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
> -		if (data->display.pipes[pipe].enabled && data-
> >display.pipes[pipe + 1].enabled) {
> -			data->master_pipes |=3D BIT(pipe);
> -			igt_info("Found master pipe %s\n",
> kmstest_pipe_name(pipe));
> -		}
> -	}
> -}
> -
>  static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *da=
ta)
> {
>  	bool status;
> @@ -430,7 +419,7 @@ igt_main
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL |
> DRIVER_XE);
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
> -		set_all_master_pipes_for_platform(&data);
> +		igt_set_all_master_pipes_for_platform(&data.display,
> +&data.master_pipes);
>  		igt_require(data.display.is_atomic);
>  		max_dotclock =3D igt_get_max_dotclock(data.drm_fd);
>=20
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_hel=
per.c
> new file mode 100644 index 000000000..af89be777
> --- /dev/null
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -0,0 +1,179 @@
> +#include "kms_joiner_helper.h"
> +#include "igt.h"
> +#include "igt_kms.h"
> +#include "intel_chipset.h"
> +
> +/*
> + * Detect if the output needs 1, 2, or 4 pipes (non-joiner, big joiner, =
ultra).
> + * This re-uses your existing logic from:
> + * bigjoiner_mode_found(), ultrajoiner_mode_found(),
> + * is_intel_device(), igt_get_max_dotclock(), etc.
> + */
> +static int get_required_pipes(int drm_fd, igt_output_t *output) {
> +	bool is_big =3D false, is_ultra =3D false;
> +	int max_dotclock;
> +	drmModeModeInfo mode;
> +
> +	if (!is_intel_device(drm_fd))
> +		return -1;
> +
> +	max_dotclock =3D igt_get_max_dotclock(drm_fd);
> +
> +	is_ultra =3D ultrajoiner_mode_found(drm_fd,
> +			output->config.connector,
> +			max_dotclock,
> +			&mode);
> +	is_big =3D bigjoiner_mode_found(drm_fd,
> +			output->config.connector,
> +			max_dotclock,
> +			&mode);
> +
> +	if (is_ultra)
> +		return 4;
> +	if (is_big)
> +		return 2;
> +
> +	return 1;
> +}
> +
> +/*
> + * Internal helper to find a block of consecutive free pipes
> + * in available_pipes_mask. If count > 1, the first pipe must also
> + * be in master_pipes_mask.
> + *
> + * Returns the starting pipe index or -1 if not found.
> + */
> +static int find_consecutive_pipes(int n_pipes,
> +				  uint32_t available_pipes_mask,
> +				  uint32_t master_pipes_mask,
> +				  int count)
> +{
> +	int i =3D 0, pipe_idx =3D 0;
> +	bool can_use;
> +
> +	for (int start =3D 0; start < n_pipes; start++) {
> +		if (((start + count) - 1) >=3D n_pipes)
> +			break;
> +
> +		if ((count > 1) && (!(BIT(start) & master_pipes_mask)))
> +			continue;
> +
> +		can_use =3D true;
> +		for (i =3D 0; i < count; i++) {
> +			pipe_idx =3D start + i;
> +			if (!(BIT(pipe_idx) & available_pipes_mask)) {
> +				can_use =3D false;
> +				break;
> +			}
> +		}
> +		if (can_use)
> +			return start;
> +	}
> +	return -1;
> +}
> +
> +static enum pipe get_next_master_pipe(uint32_t pipe_mask) {
> +	int i;
> +
> +	if (!pipe_mask)
> +		return PIPE_NONE;
> +
> +	i =3D ffs(pipe_mask) - 1;
> +
> +	if (i < 0)
> +		return PIPE_NONE;
> +
> +	return i;
> +}
> +
> +/**
> + * igt_set_all_master_pipes_for_platform:
> + * @master_pipes: Pointer to the variable to store the master pipes bitm=
ask.
> + * @display: The display structure containing pipe information.
> + *
> + * This function sets the master pipes for the platform by checking if
> +consecutive
> + * pipes are enabled. If both pipe and the next pipe are enabled, the
> +pipe is
> + * considered a master pipe.
> + */
> +void igt_set_all_master_pipes_for_platform(igt_display_t *display,
> +uint32_t *master_pipes) {
> +	enum pipe pipe;
> +
> +	*master_pipes =3D 0;
> +	for (pipe =3D PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
> +		if (display->pipes[pipe].enabled && display->pipes[pipe +
> 1].enabled) {
> +			*master_pipes |=3D BIT(pipe);
> +			igt_info("Found master pipe %s\n",
> kmstest_pipe_name(pipe));
> +		}
> +	}
> +}
> +
> +/*
> + * @drm_fd: DRM file descriptor
> + * @outputs: array of pointers to igt_output_t
> + * @num_outputs: how many outputs in the array
> + * @n_pipes: total number of pipes available
> + * @used_pipes_mask: pointer to a bitmask (in/out) of already-used
> +pipes
> + * @master_pipes_mask: bitmask of valid "master" pipes
> + * @valid_pipes_mask: bitmask of valid (non-fused) pipes
> + *
> + * Assign pipes to outputs based on the number of required pipes.
> + * This function will assign 1, 2, or 4 consecutive pipes to each output=
.
> + * It will also mark the used pipes in the bitmask.
> + *
> + * Returns: true if all outputs can be assigned successfully; false othe=
rwise.
> + */
> +bool igt_assign_pipes_for_outputs(int drm_fd,
> +				  igt_output_t **outputs,
> +				  int num_outputs,
> +				  int n_pipes,
> +				  uint32_t *used_pipes_mask,
> +				  uint32_t master_pipes_mask,
> +				  uint32_t valid_pipes_mask)
> +{
> +	int i =3D 0, idx  =3D 0, needed =3D 0, start =3D 0;
> +	uint32_t available_pipes_mask =3D 0;
> +	enum pipe mp =3D PIPE_NONE;
> +	igt_output_t *out;
> +
> +	for (idx =3D 0; idx < num_outputs; idx++) {
> +		out =3D outputs[idx];
> +		needed =3D get_required_pipes(drm_fd, out);
> +		if (needed < 0)
> +			return false;
> +
> +		available_pipes_mask =3D (~(*used_pipes_mask)) &
> valid_pipes_mask;
> +		start =3D find_consecutive_pipes(n_pipes,
> available_pipes_mask,
> +				master_pipes_mask, needed);
> +
> +		if (start < 0) {
> +			igt_debug("Cannot allocate %d consecutive pipes for
> output %s\n",
> +					needed, out->name);
> +			return false;
> +		}
> +
> +		igt_info("Assigning %d pipes [start=3D%s..%s] to output %s\n",
> +				needed, kmstest_pipe_name(start),
> +				kmstest_pipe_name(start + needed - 1), out-
> >name);
> +
> +		if (needed > 1) {
> +			mp =3D get_next_master_pipe(BIT(start));
> +
> +			if (mp =3D=3D PIPE_NONE) {
> +				igt_debug("Failed to confirm master pipe for
> %s\n",
> +						out->name);
> +				return false;
> +			}
> +			igt_output_set_pipe(out, start);
> +			igt_debug("Using pipe %s as master.\n",
> +					kmstest_pipe_name(start));
> +		} else
> +			igt_output_set_pipe(out, start);
> +
> +		for (i =3D 0; i < needed; i++)
> +			*used_pipes_mask |=3D BIT(start + i);
> +	}
> +	return true;
> +}
> diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_hel=
per.h
> new file mode 100644 index 000000000..95e71a229
> --- /dev/null
> +++ b/tests/intel/kms_joiner_helper.h
> @@ -0,0 +1,15 @@
> +#ifndef KMS_JOINER_HELPER_H
> +#define KMS_JOINER_HELPER_H
> +
> +#include "igt_kms.h"
> +
> +void igt_set_all_master_pipes_for_platform(igt_display_t *display,
> +					   uint32_t *master_pipes);
> +bool igt_assign_pipes_for_outputs(int drm_fd,
> +				  igt_output_t **outputs,
> +				  int num_outputs,
> +				  int n_pipes,
> +				  uint32_t *used_pipes_mask,
> +				  uint32_t master_pipes_mask,
> +				  uint32_t valid_pipes_mask);
> +#endif
> diff --git a/tests/meson.build b/tests/meson.build index
> 89bba6454..4bc68d659 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -366,6 +366,7 @@ extra_sources =3D {
>  	'kms_chamelium_frames': [ join_paths ('chamelium',
> 'kms_chamelium_helper.c') ],
>  	'kms_chamelium_hpd': [ join_paths ('chamelium',
> 'kms_chamelium_helper.c') ],
>  	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_joiner': [join_paths ('intel', 'kms_joiner_helper.c')],
>  	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],  }
>=20
> --
> 2.25.1

