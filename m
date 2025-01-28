Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AB3C0218D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 07:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B891510E23D;
	Tue, 28 Jan 2025 07:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXePr1dh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F7A10E23D
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 07:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738049511; x=1769585511;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wdT9zgB0cIBKk1UrzDhaoWgSW0atC08u+KAHDdZQU3A=;
 b=hXePr1dhu3RRFv8m1VfpmA1vcv86Zzh0WONtpiZ3D+WsvrPeHiiO5lca
 4TSEN+zX/QrpGPiqUWbvfGDgJYudCIdaSaCJqfeY674QJ0XY+EA7sZ5Yw
 pl09TYZmMO6fjXjQbZarbG7o4857Qt8DEh1z0oKmDz/FaWTp56jacFrTH
 KtJjSQI69gkehIctc0cUsSLkzbNwil0fRaUELmtd2FnRJlRn6ROuAvPN4
 RGx/q+SapR8D7c9lJrz3784BecuFUtaHQg/v/C3lz99ROdYuYend+MNGP
 QUWO6wKblr9KWIT0IkJs1JptEszYSgWA0Urs2DEbhnlbwCBIlAJmeiL8Y w==;
X-CSE-ConnectionGUID: sH0eH5ifSpqms7qLUGAc0w==
X-CSE-MsgGUID: juRk8Al2S5e9U7dFiIG4lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="55953078"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="55953078"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 23:31:48 -0800
X-CSE-ConnectionGUID: nTM+T+wvTiy+ZcBvZCrIAg==
X-CSE-MsgGUID: grUB3m3TRtmdja3IZZDZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145869676"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 23:31:47 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 23:31:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 23:31:46 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 23:30:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ke2p6XPEH74QJU5jztVwuQKdD7RDZHDaaRUO8DHMgqh60whNgdKockEh9fjGeHhBkHTmlT//9Q9Fx8LK4EpXgVYrM7cnfRpAGImllB5DNbB/d5mfVVeFqijVrCX2bi/H0NRt4UBcp0ykSQ+Jg+h1ZDaSrvnJHQT8HsRgG6rAKM2Vkj/n7Bw3vdGZBfEimOxWVg2kzZ01r3avOocoy+dnb727T1I4e5pL0MiSeWRjKSqeVQuR26CttXM8oDEeAl5uznGQ9ILhPh6TEDdNzC4mV+qbzXFB6ySI6niSSmffrpiYcuBC0fFpqiDOFr8hsga7ALqjDG1PQO7vQwC0ze7d5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/UtZ0fzwqXFSNrsTeVD43dlBf/rH3/6btrPZASQfrA=;
 b=gasFsPn6LFkANU3SfJGhYzpUTppaVto1aQX4jqjMrs3AjCqrWtXvYXdb+YC6EUlcvijxLqcu6p+O8u3H5bDHhZBLaLD9rLdXeyUj1LLvfVdjXI8OTulZ5dNLOJiM3oJGvcbU+rVjAVYtYMTaHzWS0/dmhNQLFN68AoafTpDzbBj9Sgq5jocLK/qdcfAFF5yAzsB4lSV6vMTdMcp+aWsZwuHo33IYr/aXu/rFOy6kESGZ4Wblr+F5L59NpTlo3fOIvULr8TDlM42Q0MKXSMSemsCsK3hmVlK94U/YKxTxXoUOShNG7Bee0WVsh81iRR3Rg61uD3XSSE69yDQKQVMBvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MN2PR11MB4565.namprd11.prod.outlook.com (2603:10b6:208:26a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 07:30:12 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 07:30:11 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_cursor_legacy: Reduce debug loglevel
 dynamically
Thread-Topic: [PATCH i-g-t] tests/kms_cursor_legacy: Reduce debug loglevel
 dynamically
Thread-Index: AQHbcUS/xGli5sT9D0OL1XgJpmuoGbMryj8w
Date: Tue, 28 Jan 2025 07:30:11 +0000
Message-ID: <CH3PR11MB84340B0D883901C9601101AF8DEF2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250128052825.424586-1-pranay.samala@intel.com>
In-Reply-To: <20250128052825.424586-1-pranay.samala@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MN2PR11MB4565:EE_
x-ms-office365-filtering-correlation-id: ef2029b6-9373-48df-caba-08dd3f6d9989
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?S3M/iX1nh/QH8w3oNFJuED/DXtxlurqU+GnApQJDI2W1W5cIEJb7Btvmsncv?=
 =?us-ascii?Q?UbJL7+ky36KWruOgvxnozbqWQqRX25mNWDexh2VSDR2mn3icBV1NVyiDoe4S?=
 =?us-ascii?Q?xM9tX0PNWIipfyJSX0SNLXpqj8cTqcChlLrnIvJQyLMXF5R/yvIcu/oVJhTZ?=
 =?us-ascii?Q?aoDVUZFcib85F6IUJCeSbsEb/+oYpFggHUSOJY89+IlTU6SWrFidT7aalfCp?=
 =?us-ascii?Q?ZcnwD2W1aoNhUre7lSMmF7xCLHIcMBwskA1YwO8hMzXDaeN5W1PaQ0a2gCTb?=
 =?us-ascii?Q?feu6jka+ZH6Bl1JAb+as6+BSUwA88dAqxZZks9o9HUAXYYWGs5AJhGUQNSYu?=
 =?us-ascii?Q?IXH5OhIchPnsJH0eIsmbXDIqnVrOJ06M4OYgZluP/SLXnysvTl0YT4UrXh0A?=
 =?us-ascii?Q?PDCajef8QVPoSZ5wC+nfXQFDbsAyDHr1o/PVHKLPy7fUleBmlR+uu9gy+/q/?=
 =?us-ascii?Q?upxT6/glXRqJkQ2wNpynG4o2kkOfhikiVQsJj2uOIrUGkJn73VfJLjtWLvhN?=
 =?us-ascii?Q?dJmGcI4ori1stKPWGJC4moGAoCQICq5OdBwbs63n0pSVyyz5WrnMtNVUQcwq?=
 =?us-ascii?Q?+DlK52J583ir+Bxj1+5IrDpMeR1ibYxHZPLbNnsCUbBqKP49C4HHExOTribh?=
 =?us-ascii?Q?3fROmPGOPq6NDe/w6JyXlsCa7OOpVY7CqK02dpPc+sJhX9JmaPLgqcv9gzUi?=
 =?us-ascii?Q?PogVW7vXeFed0jf+uLI0ukpjgmC921LN+26D1W92HJfHMLEVekCGqzGryENB?=
 =?us-ascii?Q?fq4RFEXSXKbUBL1k1/PwjgJno81mnLISz9bufDjjH62Y1azGfmDbKzzI0iX2?=
 =?us-ascii?Q?QnwgBu9YA8LqdtWr2iRs5qYJynejyo2iXxQmIM5rh3WyAyrAeOCYle9mz+Nw?=
 =?us-ascii?Q?7CVu3ftHL97hxWdS85z7/jY9PYu0WIK0H560dENl/zWkWWE72gfO37GpfSld?=
 =?us-ascii?Q?qZ0Pp8eR484beuJCk/88l1UOXUh0gby3dkoiFbCVsxtUOudRQVfRIMM0j2X9?=
 =?us-ascii?Q?Zls2ISJooHnUDVIe7rcA5GRDHmcE6zWQfyTARIRvYp0xJG2bDq2jdeKc69Pq?=
 =?us-ascii?Q?BKCvEpB3tGtl+K3JVozUBRrAHktfcDfj/2XRb9GLJ1UCztWwZFM3z9IqzMOF?=
 =?us-ascii?Q?Lr7McGbF7ZDH2B44of4+uAI7mUwgGEaUyuu7IZfLsUxeXsEQ/vSjptdPtC0g?=
 =?us-ascii?Q?ekndigF07Si+jRXD27TMOnRMB2TphiQAql/m2QhlMh517GSLopwDvz0serHt?=
 =?us-ascii?Q?9ZzgFambR742blJhWljNidLYbs+NqFDqJdgnJ6d80ePpg/gOiS+4BhWofrsP?=
 =?us-ascii?Q?O8BrYZaMumsfXc1LiaG185EX+L6CxFQPk43z9lWLv3TA631zftAtUjQddlpT?=
 =?us-ascii?Q?dUGFivS3/a4oaVp3yPxc/y5+5nRX9tyrH/Ydo5HFRE1QdL0AhWqOcog6A9qB?=
 =?us-ascii?Q?9v9yzOLsHBSM9rojJ/fCn0uSFjj/eB82?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zy5upjieGLK9cuGxx8oezDS74SydmT69bzAoflNp1MOAkeFivR20WGHpc3z4?=
 =?us-ascii?Q?9osB9+2MDHud4Ol6MlGrYGMt5JoQwZV7EcotMtfSPNZa52+4wUfgXNbNLS1T?=
 =?us-ascii?Q?SV50MtTzmYwXERxtyP0W5nq0toiI+0+EVRuRiPi6q0bihEXjdtwlAvngroj/?=
 =?us-ascii?Q?7oYXnwlnGNHDhMKLVnRvYcxLEL20ZVq7B3Dg7CV0LCb4jpUiB3TxawPns62+?=
 =?us-ascii?Q?NgU428/sRcd+tGO3/oCfny1/Jsa6aev9qt25qDvIagluKeUfkgnatiJG+FJu?=
 =?us-ascii?Q?zWpepK72LhQJC4U6EV3OD2Mufl+kn+wsKmO26lHsxmpCnwprqzV69tc4rdlO?=
 =?us-ascii?Q?MYJld2+vSDb4fqsiXmc5bVaCcjYkmdkPd0Z5CxV/nzw/lR6Qoij4MH1AfiKm?=
 =?us-ascii?Q?ZwPJUfZDPSDzwvigAhe/yaqLUMw9bUxgfJAYoK3y7UBLLIzTTIcvwA7BhROR?=
 =?us-ascii?Q?MIfclN/zvgAgfFaSqf5JVJRi+UR6bNnmN6KQZxyXeZ4Ry+cmfg7GNdaofzS7?=
 =?us-ascii?Q?d8VwndNcS4Ptjw/HibxALMvgTCng37VhDG8jenQZnW0hoGddiMpcKS6oCxxw?=
 =?us-ascii?Q?7tsXr/LgSnet8gsRP3S5WB7rRsyc7ziEuG0KB274Gocz7oKpw/bVF6XyHeKO?=
 =?us-ascii?Q?cItQiTrLi7DLysXyrn5UFhbedKigPKBUWmwscR58Mw3TRan7ov/JaJNrlSmj?=
 =?us-ascii?Q?U9zh0/NU6B/uk39Y1jnwqsld4SkWifw5m5GJRdyX+vfrAvbAq6RsVAR23y4k?=
 =?us-ascii?Q?E3qs0kBEQN3BfsDzaKnJlGPGMhmrRrYfrxTvkLeQvqxg1/cEAjntmf2pfKpD?=
 =?us-ascii?Q?+3/X7wxhX1CIXSkVjV/SQef1d/XQn09TjCv0TGUFOGU7bYuKcj+Ny4Z3Hz4o?=
 =?us-ascii?Q?tQJPfIEigMUbNAjaAG2T/OI2Ql5pLLfhKIOvN3vCzXV5Rm37ROgzPZg4zSJF?=
 =?us-ascii?Q?opDHRHxw3wjJ8h2guMqysjRvonIVteNYkaDDFWKPrcw7kAqOEwNZEAs15/DB?=
 =?us-ascii?Q?ZjvVkAmgs6bY4amrUcpNEfUqOw2RNH6IZikaknyF608WCn8vP33H66VuxFIQ?=
 =?us-ascii?Q?ZcyrNRqQ0xPO7QtH/ea+ZrExZd6Qc98M19BoUPEdBtbMq45AWs6k8MtqSZZs?=
 =?us-ascii?Q?uW/hUbKN3RZr4tkJLFPjw832ulChK7aa1F7mWiSLDdkKip71VNyu5zZLMhYQ?=
 =?us-ascii?Q?XGUVlBhJNGKcwOoObfX2zw60E5dVx02tHG5UntgtNNpjSr++wBke9DTWZyO8?=
 =?us-ascii?Q?6pxzLZaIXU7Gdm9pfwDTEvhZzIBdYzwmZBt4+bBuD+NlT7fmcRcJyOLbN1mq?=
 =?us-ascii?Q?bgmwtZeOT/878jCXqWOPkViBgZkKmgZTSv2Vv+aeE0sRA02kdw/9f4JH27WP?=
 =?us-ascii?Q?u1RsFFtsfKJEgBUYFJkjhqloGWKgOkGSBAPXIarH7y18F9ZryAzmuyuBV7qg?=
 =?us-ascii?Q?DxspFbur/Z/e/KujoxxQph9eQ3t7/zLzBZuu50fkJMFcyDBCqcCD6w4QNfyW?=
 =?us-ascii?Q?sgId2KSMkdmtqJjpNpCLZPaaUeMFpCWad/EemjLXdroo41aSocrpr95VfNYl?=
 =?us-ascii?Q?yJ0XukWVHltztO/+C5Acn/sHJMUx/YyJLtrkg2Y09grJxl0Q8s7raWfxjLin?=
 =?us-ascii?Q?cw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2029b6-9373-48df-caba-08dd3f6d9989
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 07:30:11.6327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mruR4GPUNeQ9rCYHN59bb6lypjtq3uKO70nmHQCM0iRgJcCbDMn1UuD9dw6XeV7ADzhGBFTibe6jGtFIg4fCkSw4W+FydHu6w/r8P1OgoS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4565
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

LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
> Samala
> Sent: 28 January 2025 10:58 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t] tests/kms_cursor_legacy: Reduce debug loglevel
> dynamically
>=20
> This test is getting killed due to exceeding disk usage limit on CI envir=
onment
> because its logging to many logs.
>=20
> So dynamically reducing the debug log level to 10.
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/kms_cursor_legacy.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c index
> 1f082df2d..533972cd4 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -40,6 +40,7 @@
>  #include "igt_psr.h"
>  #include "igt_rand.h"
>  #include "igt_stats.h"
> +#include "igt_sysfs.h"
>=20
>  /**
>   * SUBTEST: %s-%s
> @@ -1840,6 +1841,7 @@ igt_main
>  	};
>=20
>  	igt_fixture {
> +		int dir, current_log_level;
>  		display.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
>  		kmstest_set_vt_graphics_mode();
>=20
> @@ -1850,6 +1852,15 @@ igt_main
>  		 * fetch is enabled, so switching PSR1 for this whole test.
>  		 */
>  		intel_psr2_restore =3D
> i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
> +
> +		dir =3D igt_sysfs_drm_module_params_open();
> +		if (dir >=3D 0) {
> +			current_log_level =3D igt_drm_debug_level_get(dir);
> +			close(dir);
> +
> +			if (current_log_level > 10)
> +				igt_drm_debug_level_update(10);
> +		}
>  	}
>=20
>  	igt_describe("Test checks how many cursor updates we can fit
> between vblanks "
> --
> 2.34.1

