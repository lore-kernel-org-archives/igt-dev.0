Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C09DC77B7F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 12:56:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE82510E3AE;
	Mon, 23 Jun 2025 12:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="efdNvRs+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D374410E3A2
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 12:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750683391; x=1782219391;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oCEteZAH1ssvdWcFn6F2lEo+qbNYO9EOBTMUYg3SnFY=;
 b=efdNvRs+2Mux4hdYDROIhGl0Qbj8QRgXYczqKcCoOlF7kEsuRIBV12FV
 K3EG1CKpeWyqWIbwAE3LWN58C0AljzoapUC8FLxwFkT97F4T5UY2cN7Z2
 0b41BaooPI9OeFjbsABIonuacPfi/t7c1h5m9QNp652HL3FM3FiMEHshb
 dglVQ/Uvvu0qpT2wkgLe6NjRu0Ul2znZGG/QVdvNTY7Bl8IxuaCMVRFJq
 Z+tcUys7bJsZomsGYqyJQuvEuwoZqGdKpQqEtbz4plYTOpS1iELTGRodT
 yycWfDaQa6ARQlram6k3sV2oTtWkqdyqHNlCHu4yQ3xrWlCdOqWuNS1vr A==;
X-CSE-ConnectionGUID: usqE2SpJSai0AbDtQOHKgA==
X-CSE-MsgGUID: 4POmbZgkQHG47Kp+aS6LYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="40498875"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="40498875"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 05:56:30 -0700
X-CSE-ConnectionGUID: XIMq31SmTtSFCVHvlPyZgQ==
X-CSE-MsgGUID: AIWaa1i3TNWJtQXWpqyWsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="182642637"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 05:56:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 05:56:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 05:56:30 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.60)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 05:56:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAaVHbJ7B7P1YLkq+x6bCqN3tMzApvuX07uOyTmlpU0L+cezBEArvhm8nQdrHArj0/H/nmyj1IPPjZ78fhLm1A3s3qm4JCgzKC9YbFcQ5fQvC3shdVtMV8JExTvIr5V4qQjtV9RYCAAfnpOKuNUj5BIbRMHD+uti3z+cN1cxt8PbMCa4yLkEB/zsgXIeQxRnZznHTYdOPRPKvr73e7+B8ljw6/NGirJSKF1XW0FH0yK6TMQ2GLhbUHmQbFSndf8BgS4kRJUT7Lbuv/Ma1neSFDFw2JGQxDXb5N7BEg2+NsYpW01oJEd9VK38s0nSscxJ6CRtYw0XK14GY9VT7rOwiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMRZTYuzzlnN1jWuYB1+gyA0aih0yvGim/Ex1ootDKs=;
 b=CWt4LL1dk/an/Dyp78k8s+mIdsudx5mRlfisffgt/EIrUsxnQe528fAFbCoiX1/2en4OaFs+h3GyL8BpABMLUMCIDhQXDaz6PucbkRJ3K8iEUC7ekzuGb9vR92BOw5cPWyoJKkxKZ+WhR4swQr205JMKD7tAAqop9HDgy2mkwKBYmc1++eSPoBbjWHu2fnRha2Gv/OCRHsOx61F4sRzk9eWnhWVochs9NjsDE068QpEQivbsrdpwFfuPa6IU5xIFqtp4E65VIoSZMSA/jeL/IWzrlxfzcffyHg9OFsGZQ4HkvSROi3fdHxNcenyd3QwxhT1v8czwMTOl+qu8qDlO8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 by DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 12:56:00 +0000
Received: from BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4]) by BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 12:55:59 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "B, Jeevan" <jeevan.b@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_cursor_crc: optimise cursor crc on
 simulation
Thread-Topic: [PATCH i-g-t] tests/kms_cursor_crc: optimise cursor crc on
 simulation
Thread-Index: AQHb5Den/rSUxls+oUmpVrmSrmE52bQQsFsg
Date: Mon, 23 Jun 2025 12:55:59 +0000
Message-ID: <BL1PR11MB605070273AF75FB5F2699D9EE779A@BL1PR11MB6050.namprd11.prod.outlook.com>
References: <20250623120643.613082-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250623120643.613082-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB6050:EE_|DM4PR11MB7350:EE_
x-ms-office365-filtering-correlation-id: c4382a63-53ec-4908-fbbc-08ddb2554d4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?O5j0R/GlKjqgNtMBF3p6ffg7jhvYrDyTddUAlQHTukfx9pNzOZucFpy4uFrw?=
 =?us-ascii?Q?owfGcAIauabOklppFgyvyUF3BlccDq54CCf8nGJ0ROgjrtpIIcNPDfpx8Ux1?=
 =?us-ascii?Q?SP1hqhW7Eo0zVGfBy69SJ5y2Vcx7+kI03RNeANW/jIAuQ+4U8K2kYY7md5IE?=
 =?us-ascii?Q?ePAo+L48/hXQp/PoTB2Clc8rqhWpVUIX0T/PA9r0AY1HUvtfYPQaZ9kGBKMV?=
 =?us-ascii?Q?l9uevzYG31PaHAGxdSUKgoEz9PjMesgR5tQsAnKr3+GyQUd7MoEle7uHds5W?=
 =?us-ascii?Q?bUxe0PFZwbdMD7Gw9uCYtJdX3gvSEQ08X4dzPJxlJOBlgi+zFLAYKS65pTCe?=
 =?us-ascii?Q?aAlZu+k5bAQqXX4O9AxBvobWh+yTCcTBieuUigt5eoC1qhQWgRxxgDwYNTUB?=
 =?us-ascii?Q?6Y2Fq76vXKlRQTYblz/POTVnvskkql+LXHCgtGMT9B0TrAaPbcy7mm5upDYm?=
 =?us-ascii?Q?yyCiepzRCf33mLyjO4SeXHrspTyQ3yq07gEBRno6ocn/3KhBsjr/uLwqkRWf?=
 =?us-ascii?Q?rqO+nRkH2+v7Bl6MuxZRI5vbmFiv0Ea7u/0u4Biy7l/jz3OMwkfzNughAXKG?=
 =?us-ascii?Q?0rCJAehFJrzUsXob1QDE2kNqRP/tSnuK7XoZBhjsRPuHUkA8i7gZnWR8o3F8?=
 =?us-ascii?Q?DhEDVkk4OrQJYtCmY/VL6mVuXN/oqKWyjSSts9VND94iI+G30ceqGGVI+V6W?=
 =?us-ascii?Q?d/6uVIISPSTR2rFGjJra20uroz63kR0rUAVeNRQbA7PS1QsA3oleqqFxoKBM?=
 =?us-ascii?Q?hVuI6DnI5fS9RwPYarlElT7UKMUtc4noGUEUnQq/EEs23uEIBF5pcIrszkUg?=
 =?us-ascii?Q?HQsLgVSlsXXlvQRce6669DKQlnyqcIwIzDJ9i+GVmk3HNA9e8yUty4L2hsjA?=
 =?us-ascii?Q?9TI4FS4E+4Z9q4tbMLTOu3xvsmmyIqXdEpJqNFLgN+HYR55z1yG+0R0VsSAm?=
 =?us-ascii?Q?SREn0dYy9g991/nSfS05pcqkuYPeKpzt6WaRWXM2ipdXFJjeRalypU/7YLke?=
 =?us-ascii?Q?Cu+nfDgS8apyjTJ7X771GlSngdYOGPo4QE9KsNYr8sDw3BZdOoNMC54iQG2k?=
 =?us-ascii?Q?iBNPb/sJtGASLntNHsiBR6/wHpS3D3I2+k8qvHdWHqVH4xI5iYSzvo5juMpF?=
 =?us-ascii?Q?f6G5hD9ue08Sh4gEdXwsTu0K4G7yxbMOCN30l8SGboIFdO7qSMWmlzB/Fdso?=
 =?us-ascii?Q?bqKc/TX14yQS8wXBa5AeA82nX/JOYF1I/CZ9Ua+g0up5GuyfQICVlDO4J93H?=
 =?us-ascii?Q?jQ2wMp8v45+TCJP7QUQpSsIqnltKa1MAm+3wW2WT5TYYrPgBN1el4vsN6lCS?=
 =?us-ascii?Q?CJNNWmXpNKIZIzWQFon0H4L/OAGH/HrKpjSsKuEihPUt5utUOwnn/YpOLtO6?=
 =?us-ascii?Q?VXgL0Kx6a1XW57OGuhFgh1y0YE8qEK7DIAanYwAWvAo65FbSG/VRaLGcCzj9?=
 =?us-ascii?Q?3kCS3sfQtUj/FKcVleB5FiL+/JxOvJHEaBYte5d40/33YALIqnlgSKuQ+vB4?=
 =?us-ascii?Q?SzupZtbDwU20BZo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB6050.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kOEMOnVOTnW5alBvXwsY40dMIkJMV1njJrSIRpWmCZbbAqbbnmXzbsEANMo+?=
 =?us-ascii?Q?2/xTLwa0WLnlFVoVDpsX8cyoBFMj47mhpBa/MTkX8jdZ4B+9GEHSt+mQOasy?=
 =?us-ascii?Q?q9gXzOS4e2xikbDtGs4zX3kaNVWwHncXafJZAnIzM283dKkmhLTI1G8S74RY?=
 =?us-ascii?Q?b0DMQO4TvRgp0UF6eLufFw7J3KomXnHeQKNbak0lb6ee2aLY7jvmbrhHYQyK?=
 =?us-ascii?Q?Vz/6vZ/b0nTp26HOQn9xaju86+JCGxn9G22Sv2B6fHMlusIunvQ/G5DgbiwF?=
 =?us-ascii?Q?r6FNkd36z/GJY4IE5VfbYTkqvCju76lnpU65daQGJdHmXqSvIgYgBjzOQ5Vn?=
 =?us-ascii?Q?08Rq9/CcSU39Gs1gNmR9DBXNfDh/NL/Y3I+p3ZP6bBzAueaPWt9rcT5xgQbW?=
 =?us-ascii?Q?QCkGIkwM2wATK7etoRUZ3dLULe9i8oHD3YiQAN7hGY+s9eUfK96ngV6+xvYU?=
 =?us-ascii?Q?/WHMqJN3OEfZLkayFJSLMnMqHb6NX35Vam9IshntyWWT5nc2E/kdjQUEkO4O?=
 =?us-ascii?Q?3tAce+c64FIe9JQDTsNrbEe8nL8Wink0x6p96X1PqEu7EckrZDpnKUi/lFjv?=
 =?us-ascii?Q?l1YgkGDEigw5abF64H+VzbgWUr5WvumkekKYMp6ftFv8Vv08f7rWcimrKSim?=
 =?us-ascii?Q?sYqZVg5Lu33Lmeq/j42r1M40zgu18ZVUJ4IDPvuKsDnvHQtXegje/QSUSP4D?=
 =?us-ascii?Q?2EOSk7/1FL55W5Ld0LAwO384OqOLMJ1pI2FCj/XLjFDHgmaOnsm5i19zZn+P?=
 =?us-ascii?Q?z/BpyRJwizLKyrtdmgv4drM2eH16XT+nktWb1DEFOWq64LSFSU/YHUCo49y1?=
 =?us-ascii?Q?sljSD0RD2E4BvIFG9IKTQhKodgRZa0A+YQVqxLfjbgR4xMeu7WJSYx7sZXXn?=
 =?us-ascii?Q?wlKd1zHxt9Fmek55FWt1qyWbDIZLMTy/REIsPKMeE03dqKWdb9aXwuIYXI9D?=
 =?us-ascii?Q?75PdVmkzI8bg2YvcU9qAjcdTNmyZkCtsZj2BKiXc26wprJbvu4ayETYI6rcB?=
 =?us-ascii?Q?C6hUuuu1JZJdV2zfb7WhS1P/I8c++0wRsyylrRlYei3anZtH8LDnj594d7Jz?=
 =?us-ascii?Q?LXRifBzNXXMtzmDOBKG3v8HomGYsrjpUkJGjM0z3mtiEOasMOzsTEdHwAR3N?=
 =?us-ascii?Q?ab6ZGIcTCFDeNKuXp1Te6GeXUeYspQyalucmmotC/IXgR6AtavHkQ3RDy3SO?=
 =?us-ascii?Q?elZtQbPv+Rk2n3BL4Ww3LT6u+h0OHktPX6BtMNZfIcRmUnkajaDTtzDdOD0s?=
 =?us-ascii?Q?J4j6gnTChkImCr6zI4lfdE+vAUgj6afk+qd//zRQGjqyg+cFqipElRrbnKuO?=
 =?us-ascii?Q?u+v+dAo8fDYEw3AM1ug5JtmrmkqKWfy+CsVgWccez+IcafFc9OuE+zfQNgKC?=
 =?us-ascii?Q?lWot++dfJ5COd+E39J/f3gIa7si0VOB5lI0KT1KQXzgWRYI/hlUD2oVgcMdb?=
 =?us-ascii?Q?sN9eRI8nRc4Ne4k7Do3t56mjVmEFGku2G5c5DAlSZWL/BnacAleGymFvuty+?=
 =?us-ascii?Q?Ub3LYZ2xQRPb+aP7HTbjB2XgwJFFe3jqRKMZIH2VhFMcgyubqtJMD7aLb7vp?=
 =?us-ascii?Q?JF/cniR4KoumyF5fBqm+Xg6/6FftN9HMcgdKbKrm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB6050.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4382a63-53ec-4908-fbbc-08ddb2554d4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 12:55:59.4968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7YGXDlZPBpvwC11PWZaMigJt0bEw1p1PIwkX3SDivGH2g07/y0rvB3w81NthHHsxCVkBygBsV24YFhSAsEtPIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7350
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


Hi Santhosh,
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Santho=
sh
> Reddy Guddati
> Sent: Monday, June 23, 2025 5:37 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; B, Jeevan <jeevan.b@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t] tests/kms_cursor_crc: optimise cursor crc on simul=
ation
>=20
> Reduce the number of test crc iterations on simulation to avoid timeouts =
on
> simulation.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_cursor_crc.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c index
> cacd2402c..28c747639 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -490,9 +490,20 @@ static void test_crc_offscreen(data_t *data)  static=
 void
> test_crc_sliding(data_t *data)  {
>  	int i;
> +	int max;
> +	bool run_in_simulation =3D false;
> +
> +	run_in_simulation =3D igt_run_in_simulation();
> +
> +	/* In simulation, we only run a few rounds to keep the test fast */
> +	if (run_in_simulation)
I think you can directly use this function in the if condition.
igt_run_in_simulation() =3D=3D> Returns: True when run in simulation mode, =
false otherwise.
So assigning this function to a variable doesn't add much value.

> +		max =3D 4;
> +	else
> +		max =3D 16;
> +
>  	struct {
>  		igt_crc_t crc[3];
> -	} rounds[16] =3D {};
> +	} rounds[max];
>=20
>  	/* Make sure cursor moves smoothly and pixel-by-pixel, and that there
> are
>  	 * no alignment issues. Horizontal, vertical and diagonal test.
> @@ -521,10 +532,15 @@ static void test_crc_random(data_t *data)  {
>  	igt_crc_t crc[50];
>  	int i, max, x[ARRAY_SIZE(crc)], y[ARRAY_SIZE(crc)];
> +	bool run_in_simulation =3D false;
>=20
>  	max =3D data->flags & (TEST_DPMS | TEST_SUSPEND) ? 2 :
> ARRAY_SIZE(crc);
>=20
>  	/* Random cursor placement */
> +	run_in_simulation =3D igt_run_in_simulation();
> +
> +	if (run_in_simulation)
Same as above

Regards,
Pranay
> +		max =3D 10;
>=20
>  	/* HW test */
>  	cursor_enable(data);
> --
> 2.34.1

