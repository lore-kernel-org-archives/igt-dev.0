Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D87CCA470
	for <igt-dev@archiver.kernel.org>; Mon,  6 Oct 2025 03:53:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1D610E044;
	Mon,  6 Oct 2025 03:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="leH6OHDV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3758410E044
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Oct 2025 03:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759722793; x=1791258793;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YTd/SJUpD+M8v4iPxPWhW27R6lRe2wIuGaDla2C7axs=;
 b=leH6OHDVZUBe2WF47zxWFZafJE1ekKaUdVZy7Nk5XGr8FzqzuDR8pVVO
 KPVj/8d6G7Nb4OnW5oOaENO3k3gju8M8AOL2qmTm+msnmlPBuMiHB/Zr6
 sTC8zOLGhE6/NQ+e8HZ1Ao/k8Q5bf30IAkD/tzQrpCtvJuwOI4ZlQilTJ
 RNI+pS01ewxw38eC4OFhTygPAXL9xyYBOVS8pfkag9VJo1jSbwpOgx61I
 I2G4yruRsmRv/D47HNwSDf5kVC73JJEjyAs9JNa98Bf4ZZpLqMahmQ/kC
 YugyiAGrvQV4RBh9AsS9WzSUdXjyBsEkWeDMRhShNkwFrrhyYfrpUeZDx g==;
X-CSE-ConnectionGUID: 77ze24nqQROypWlwBkFRkQ==
X-CSE-MsgGUID: NxgunK0LR1yBppKx9z3oSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61603722"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="61603722"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 20:53:12 -0700
X-CSE-ConnectionGUID: CqPX4D2JTImvSTRM9Z/wNQ==
X-CSE-MsgGUID: K1v32xEMQySyDxpcfljlhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="203517821"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 20:53:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 5 Oct 2025 20:53:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 5 Oct 2025 20:53:11 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 5 Oct 2025 20:53:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kcf9hlzYS+FqGrJKs20ZH8Eoz9JzEXGQmuOkEk0mnJy4Xy9ycDTJETES1pwjl5SODU5VISolsGM0F05ui5Fi1j33/5+pK6vFZM7Expzc8cKbKTW5AIk6aNgyzRprDc5cBM0Uty0AGw3ycpJDBnlcapdlvkmRsK7yIP4D5D2b5uoxpqmPmOHGppAgS4Knfy7FZ5JU0OHlusmgFyZzSeArgSQDV6xsSijPahbex2dWK300pLH/ILvquxJi6P3Ubklbh0gM0WDBAsa89jlgtmE0lt7RzdtrFFqLCGzDMxfxjGtCgPAxAUacRP2Kv9okL5US+uRhxe73oBs/j1wo1XG2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFQXMpQIpZcIee/M3NboiOFnuI5XsQzsudjnr0y++K4=;
 b=xl2gqFCQeGKU5VhCrQODZ4IIPZSCxYo/sg1aT1klBOzLgbOJ/9mdMDQEHDDRCQMyqzFRB4mP//R/7bj4ue8Y04PmsfdGaxoHee8gftEOmFJaS7qTasN8Gkfpw4CEOrhX30KFlILVD8dq3bnG7w0UcE/rNLIr4UvT/mMn4AfrghHoZro/DYRNzjayoCa96NCHmEo3gaUHxyRegrsgh8/fvxfurZOmVJpVxq82i1FrHrKVqHBCN305R6GB4yza2ERHBCwsOFdyWIWehcrfhS0pmeJcCFoWoJIqmWOPcE5zl4l4NisOz+cAD/tGT4RI4+tmii1AphzET7hTAEJzXvVWNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SN7PR11MB7590.namprd11.prod.outlook.com (2603:10b6:806:348::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 03:53:04 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9182.015; Mon, 6 Oct 2025
 03:53:04 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Govindapillai, Vinod"
 <vinod.govindapillai@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/intel/kms_fbcon_fbt: Skip CRC based FBC
 cursor check on simulation
Thread-Topic: [PATCH i-g-t v2] tests/intel/kms_fbcon_fbt: Skip CRC based FBC
 cursor check on simulation
Thread-Index: AQHcNDyCJ6mESqZQtE+7OeFUF7K3NLS0f77w
Date: Mon, 6 Oct 2025 03:53:04 +0000
Message-ID: <DM4PR11MB631273F1D2A1D97DD1701C8890E3A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251003080206.569347-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20251003080206.569347-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SN7PR11MB7590:EE_
x-ms-office365-filtering-correlation-id: 4939f68b-c6f2-40d7-a166-08de048bda99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?S3qv9+amGKx1001lFYVns49J84K02Ze7AJDBbbXzS6Ps2mJuTAAeBd95dEVr?=
 =?us-ascii?Q?7dNivRx9aU78HcJTIdYTSY8d/Y1fE9ziAGDP/LzYl0rzTU4Jo4juEXtAqViZ?=
 =?us-ascii?Q?cC3Dzrand1S2jDEDUezw01oF5+4iM+Lj09veGMn/xvAQbxk1fBp7F4bfs8LG?=
 =?us-ascii?Q?Ig7k7Sys15yNyS1YG5+twPp1tAtNeeFTxNm7PIcMFhYgkA96uv5IBR5yCbGn?=
 =?us-ascii?Q?ddJjAmjv24IA6v6mK2Uf85mjDMrJbfiqI5XutX0SGyLpOTE1kaeUztWMKJYJ?=
 =?us-ascii?Q?ruREQJi4KeezJRM6lQGcGg886QybN66359Go46nzAPoBbo9efwdNOezWEDLI?=
 =?us-ascii?Q?BaFuWH6Hpo6nQmSjVQdJ46R+xyyfHExWmQqQ7sbENDMon/vbnXU1SI5vB/5r?=
 =?us-ascii?Q?T6N5YGkPSvEOygS/7kv6cuK3yaZZunWs+gaZ/75P1E6u15vTOVvf7g99DIIc?=
 =?us-ascii?Q?p33WppdnSKACTMA4MDtgDFJXN7gARuYrZcBXrxb5DiDI5MAhwX62458Xnq4w?=
 =?us-ascii?Q?ACpKw7zMY9LWQI2HVbZTZwGOrYz32zQgoDdSvyNnZBqTJ0I2j40dbnzH97Sn?=
 =?us-ascii?Q?9JS7kIJ2Ys2o/UI9LXGUqPAzS7250BF/naDK+4G0TT752JwQAWNL5ppFhECB?=
 =?us-ascii?Q?rKeHwodzPWwPFGkZMONa+bgn4+0fgA7Y5tQx3Q1rkiueaBb2SuF0UY0793I9?=
 =?us-ascii?Q?4AGfAX8pSjCaQDY/lGmbpJxpmqghmIWWmgypsSHyfEXkq/zPGXarHXWiH417?=
 =?us-ascii?Q?PUlbdWcXXdXlpvKwJXKylLNIrICbJxJ582FbPg4ytE7bnjftJu7VdeVK/x8x?=
 =?us-ascii?Q?BJ2CEmvT/bbWzjiLTXwN3fYdML8eabrqkRX8m3nKegJ4ZfaJt/tm2H3sYmKb?=
 =?us-ascii?Q?fas3dOtQSOrqoUp+4VrzuxPLiyJPtO6WWCOsTx4UZVo1M+Q/xNjXChpRVsp0?=
 =?us-ascii?Q?ZmrVrJZ7xlWOoNUl1BoAKofcm7DTBhNG8h6mxtzrNbIqZ0KKAv4Nevv/hDCr?=
 =?us-ascii?Q?1530bTuEH230Z0hldaYIEpGgT5Zkn/UXHihv/TQeGyh2u0+f2qo4qMsQSiwT?=
 =?us-ascii?Q?piqKsKf75Zbw0++wpvyPfN7BLwSwcNjKNnmXotOWGE789vZbyv6XWpbY6XpM?=
 =?us-ascii?Q?mnDoKJM0grCwizndt7k6cEV29zAoMHMlD0xNEG4HuTbmn5yIvC+F+vAIH+gY?=
 =?us-ascii?Q?NitOO7brhckMyzZlXZLO4S5qRvssv5WBvOYg5ucMNo7K/QzJZ20pTqe9aNRw?=
 =?us-ascii?Q?5Jmv1xUc0FTaZSzTUDLvCu48jyx8C160TDKE2i4GSpnWFww6PVg+oPHU8zYH?=
 =?us-ascii?Q?mE/x05PqOLpyES37LxM1MZcqm2tUcALWUjwIEHqj1wOB1dIAEzY8mSSmXHmy?=
 =?us-ascii?Q?2VJdNtMBq2d2a+BBEPtFmKochLjggVv3gxqH2k1TrB5aezJHX2zBoANpquu4?=
 =?us-ascii?Q?ycJ/9p7kRNtYKLABRWNbyTT6/O+IhZbDWq0lqPhYjOzCrnv99Wi4TdwDginp?=
 =?us-ascii?Q?f6zoBsxhBKRrwXSyTFx7SwOsbBBtvYlfF2nk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SUf6O4+1lPFTqrjtuBeHTBzcHMBPpvh/g0tOJgcQ2eytzy/FYZFuU+h8NV8v?=
 =?us-ascii?Q?J919thZpoTYdO5Ygs+cNMVRmn/kGc3xSKI0/BmkROkS7t+AzrpgB25iq/yeK?=
 =?us-ascii?Q?836DI0anl5/cLedkWUariSbF/q0VGFkHxuYDWo8qxQs9/3GEg+VlXqAygDMY?=
 =?us-ascii?Q?x5O3isec847eZm5GIo+qtMHdJqHMxRHiF81FBrMWsMaPdc9r5s3EjLx8yaYT?=
 =?us-ascii?Q?IlAJh6ZpuLwJ5AcwHVYoaCoILZ8I1ERowHx/I/n6nltmfd8t3XXjlFW6xvrb?=
 =?us-ascii?Q?Qom2f73Qn6eQSU9rhRcKjE5nRbXOjwdXOiygUkbDLcnXXCQEXtxswYDBiX1M?=
 =?us-ascii?Q?ciwTQBkBMS4RyM0akGSraQ/H6KmpJYOs+SH8hX4jTmxyGRdpuLTpNuFQlBGQ?=
 =?us-ascii?Q?3k0yv65HEmtB5tD6qZkygbzNihFbXFVtkANfHRSgx20HFAhdcy4rTf5FENmh?=
 =?us-ascii?Q?js++rHdRxnRHZcvbJsB99HLr3F1HxqC4BLXJwyC7TmuWJFhk3PjPAr32LybQ?=
 =?us-ascii?Q?Hsjntiq6nl/Whj0iiojQzMgOlGTXF7xqMi35w9zVmyBN4V8PRWbiqsslW2Um?=
 =?us-ascii?Q?KeGyOl+khSoHgvPd/W8lEyEfdnkEo1sa6mIDyDTRfOq4qM5+QsW8YvzjuAhG?=
 =?us-ascii?Q?MwMz4nRAjCSuHzZw5WIi46B2I1hlf7rPGt0n7TkQ6bbo/inC181MpTaWCEgW?=
 =?us-ascii?Q?yp33Q4oHt2fQaI9UCkmcUQeFUc6wSkoxq/iouolrxAyPut+mkHgy5h6U4V44?=
 =?us-ascii?Q?l/tZ60u6Gt1GD2026O/H8fu8/MFDy9TwiGb9nqQHdglN83OHy096u3a0oYO/?=
 =?us-ascii?Q?OmPemp79wzGivu5mk7KOIi9uh3AThLQMh9jkDKpoUj03VIuXPpKlS6RlvXYo?=
 =?us-ascii?Q?JswizV5X72UDYd6H9dZ2d0nY8TkOlRp7uBUBxxVB7ofnmfSq3PJ0m83BaI+K?=
 =?us-ascii?Q?RaYIwHbiTwm6mxo9IEmXgnBLkQN/qKPncuGFe+Mh/5uu01R5rCtwNzc9TdUe?=
 =?us-ascii?Q?kAjfpmJ074aVE1Hsb8ji+gkggDvWPfKVzyBkfiZQ6HPhzkXNcgQxnk0CfHL/?=
 =?us-ascii?Q?SoWjgM0HPq/9xoKiykbQwemXfKC3m+Nk3DAxGmvJiN8hS92YC8DGFIlsROoK?=
 =?us-ascii?Q?R9U1zclpCTxeQPWZuRPoAIuDZZqY0XyrBER/2DZn4Qtbbjg7ZEVBudKXOulS?=
 =?us-ascii?Q?mPgawAbGCUNnMu+C/ULLw5iskzcOVT91bYYE6nLz4SClvsNWiexrAJXxnhU6?=
 =?us-ascii?Q?efc1vURqsIhHVwWaQWEsyDiigpzsx0n1y3T/TeLBl0XLcPCIiW5FiPKHb2mX?=
 =?us-ascii?Q?9nlnVlEF5pjZLssuZVVof7Vzxt/m7+8gdyQlcOaAdAqZMqwHp/uN6BuZFAks?=
 =?us-ascii?Q?MQ/1DYx4swNlp20gi+XrsloGm8AES7+ovUIsC03K71UQ4Wmk0keOHPUBcRoo?=
 =?us-ascii?Q?uoxTLCmdCyEzEmJVgSy2Ij0pEstqPCRKtO+U0KuQ9EdyuvfkFeLQ8+uemTRm?=
 =?us-ascii?Q?biXk3ewxLAedZ9vP/OpRORaYCl1jgKD9NNs7x73INLDerbAP/MWSZJMXwuVS?=
 =?us-ascii?Q?xhtrr4d62V8I0LETVc4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4939f68b-c6f2-40d7-a166-08de048bda99
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 03:53:04.7218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2PJymIgc4WhlE29Fmbjyd3Hj+fZ+Wk2R1xppelQFYRPmcGR9rkOUgFe4EOH45kEalR3sQ+gG5UFGwFWEEeyBXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7590
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Friday, October 3, 2025 1:32 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; Govindapillai, Vinod
> <vinod.govindapillai@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v2] tests/intel/kms_fbcon_fbt: Skip CRC based FBC
> cursor check on simulation
Need to change commit message to make it more clear.=20
"Skip CRC check for FBC  cursor check on simulation" Something like this.

With this Patch LGTM. Also please report the failure is not related to your=
 change.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

>=20
> Skip fbc_check_cursor_blinking on simulation as it involves CRC operation=
s
> which may cause hangs or false negatives during test execution.
>=20
> v2: Move the check to fbc_wait_until_update to early return (Jeevan)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/intel/kms_fbcon_fbt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c in=
dex
> f3843cdb0..810bc5114 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -183,6 +183,13 @@ static bool fbc_wait_until_update(struct drm_info
> *drm)
>  	if (intel_gen(intel_get_drm_devid(drm->fd)) >=3D 9) {
>  		if (!fbc_wait_until_enabled(drm->debugfs_fd))
>  			return false;
> +		/*
> +		 * Skip cursor blinking check when running in simulation
> mode.
> +		 * CRC operations are significantly slower in simulation,
> +		 * so CRC checks are avoided to prevent false negatives.
> +		 */
> +		if (igt_run_in_simulation())
> +			return true;
>=20
>  		return fbc_check_cursor_blinking(drm);
>  	} else {
> --
> 2.34.1

