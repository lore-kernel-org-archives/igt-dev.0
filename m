Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6E6D2D10F
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 14:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035CA10E193;
	Tue, 13 Jan 2026 14:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPylSZro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBCA10E193
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768314847; x=1799850847;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Oej2uCwFGEIQcVeRAxbToGHr4EFBEzs0VkxXNeW+7E8=;
 b=nPylSZro1yU4z0CAW2si8gS4TlZt4Ym51Wp3DZ1M9uN9q+nMBOfieLzK
 I35njf8qLYRGTxA27WmAhlN0xmaYlQl2BMX3ktp9YChoHHSWq4leacwS6
 QIH1nc4dUoDi9BOxRz5a+47nz6OqsUZMXjFdho2eZBtBYyjwCs1pBLdjd
 9SZFwg8tiO00S7tB0wyNfisb8MDNWL2tZtpritRPdS215RYlh0l6yLL6P
 Lz3Mx91ndBzItwDWsAqxz8GV7uACcPk1umSTbwrhiuzlRHhMgM+TaRu81
 YFw2KSxP1dD23FgEtmj6Lx49957ls/hJR+nqrcFeyTMrJetdKDv2SDqEl A==;
X-CSE-ConnectionGUID: vpWmjJwhTaykocFsW0fZzw==
X-CSE-MsgGUID: ErbrKURES+KW9n5E3AT/iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69331336"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69331336"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:34:07 -0800
X-CSE-ConnectionGUID: VRC/PtrqS4S+4uP5Y0i6hA==
X-CSE-MsgGUID: C1lrBmywReiN1vEU71DwhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="227591263"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:34:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 06:34:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 06:34:06 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 06:34:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mmqt9kZ/yZKEO6FQ0YhAPIugNSG9YfJrGfsb2MQ94XGcGYaONQRwOyfX8VNSJCwswHcJSBI02SYlQbFd+31F+fTfgN7y8qIS4Wlw8hqclCRi9u21vJzdzpLa+uGSZ0puhRYaK0FknzqOXZnPu+ufYkFTaK/BYUVU/Wxd0fNaG/PI6JMqThgp6EMqkPrKqrdxxv55dxQpKoEEfKlx/lPVU4NnwjHYToz0s3pPv34+psiea6pKZJcpqZZVVbFPpwm57xoJ8fAE3Hs5Kf9rbgIUPOESy1RHixikvnbBlljhiJGx5TffO+QqtT43WUzXJ54eTatptTj6qQCwoLw2jc0+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUx3PZ7gSaRQVTOAUU5ZLdRegR75aphJhrsHhf6mDIg=;
 b=anc4WsoZBdavEoFHAfCJpZWIZI7AT5U/gQvGjBK2VWusWK4KgRuyGvboQl7qTKTIAePX+Jt3WHalqDkc5nelpgWijNrQ/UIM5VRx4G/q/S3xGSfuIueJuqOA6Xi1MQ+PsdVUSopk2EnttXfbyR2Hvpvru3xWEj6dB1DPX/umowzlo72BbgfU6BsRpUaMjboo8IBU2O6emrE+7CT7GxgpA1N5dmndQO7FbIFFDuUj5dyrTjaPC0FTHyR7nhR7hEIHUxURZFWpRSd4MeWqJleyrkHBQRry4SyXibAf4/d/CIMllyjSNXohnCJOMMMBBNn34u7d0bUcVTw70ZKaLoNDkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by IA3PR11MB8893.namprd11.prod.outlook.com (2603:10b6:208:577::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 14:34:02 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:34:02 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH v1 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resume
 validation test
Thread-Topic: [PATCH v1 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS
 suspend/resume validation test
Thread-Index: AQHchJD16JmnLprWqkyMYufK0pRqhLVQJi9w
Date: Tue, 13 Jan 2026 14:34:02 +0000
Message-ID: <PH7PR11MB6053721799CAAE295BEF9936E78EA@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260113132639.13411-1-mohammed.thasleem@intel.com>
 <20260113132639.13411-2-mohammed.thasleem@intel.com>
In-Reply-To: <20260113132639.13411-2-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|IA3PR11MB8893:EE_
x-ms-office365-filtering-correlation-id: dcc03f60-8867-4ee3-d9fc-08de52b0cbef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nWpwmWHRcIX7RhjQlNvEJsWpSb7/Kndh4V8IFouo+IbFJ8gSrUEeksy81Gi7?=
 =?us-ascii?Q?dwaVhzJYQe4H3J3uf8eQ4LaAKemgcI+qyDvuS5RL5MSukMJdC9BZ6c6VBeAt?=
 =?us-ascii?Q?ZvYpZZ953DGJulyBkqkUxO5Im5I0ElfvKT+h/EHFeSo3VFLShGPhk8Xvd3Do?=
 =?us-ascii?Q?n2MNSsGmB6TI9FUEmFnUrj7/AgslYl6BDgUku8PdDoxUkJrHMhenx84VsTIn?=
 =?us-ascii?Q?UGj4p01bcR7EanlVhGvIM0F9YphD/lzvrcJb1EkcblCa6u/PU6JOfHNiz+3u?=
 =?us-ascii?Q?3S8LMlfsSJJHARRBNwQ/jsJ6W5C19/Q8dFxSuVFNBFis6OswrYhjYLkLRgHH?=
 =?us-ascii?Q?bEI77g4bZomcGVrH4f5/NtDm8Gt616FhpLo2FXcn9ONv+WFRMaiWZ4tDlxxA?=
 =?us-ascii?Q?Lo8bQhiAasVxBxUUi9oDKGthA6CJ0GGcezi74wo2rjz8OS0aHTwslxgnUl5H?=
 =?us-ascii?Q?713AiZfaazPzmGfxYw3tarxCctd9Dem2QySaE7/abIg5V/WAymasMUKmeX4V?=
 =?us-ascii?Q?Z0vnada37papoRjlphsdf2CizMf1FBkKnJH+M3esH2UmcxX5afm+futg56rC?=
 =?us-ascii?Q?LGFUDo5B2qvFSRDD42v9X4TrA74A6NispuIACBwgTzCbMfNhyl4YgeQtg820?=
 =?us-ascii?Q?/Ki3FIA0V8D236EP3B6RTFqOTfXd4YM2SL8pZr2AWt45Lr2V+XZuw7NJLn3h?=
 =?us-ascii?Q?lb7Madb9FTeqlLwRmvVqSjZOgDvZDrs7UQFDL9T8BNDVyTGWQkQA4eG/C8yy?=
 =?us-ascii?Q?k7Ne7jB6pesxEJr8OlimSyGBwYwIkk74t2R3cujwW2yjSPXQ1150QG2el/yj?=
 =?us-ascii?Q?niT2NgH/eO6fUaHOvCM2NPTOk1EmSNj1UeOlObVCelH8nqNcog10wBFwP2JT?=
 =?us-ascii?Q?zso+VZrEufsU7mZzcxQ687I2KP8vSA5ki/LPudxNeXVaiux40SKLxJ02yuii?=
 =?us-ascii?Q?V+cBAEGK/0ldkZzrF+rqr1DJjYraL0JqiCGiG/iMxWFnYoJ7/pLftcMSCJTm?=
 =?us-ascii?Q?ItYvAdekDJ0bc5aDV2I3zrI7k4/xEUVlTemffQ5ox5tT3HnAqws3qh5bT/bd?=
 =?us-ascii?Q?g70AX4w3b4OIRK0PTt5XX+GNZcsC9knQMABtvs6Z28tRa1Y75i0OpbrYisFR?=
 =?us-ascii?Q?W+z6AX2zDgYeyrgQ1Jeunv/lLQtyUC4OI6t5R1c90DCj4shwWOj3YaBSogMR?=
 =?us-ascii?Q?sI+u4QPL6UZUuXZ0jxrTam+jydkH88/XmDJobdJBXwU7c8Uxcp+p/1v7/iKo?=
 =?us-ascii?Q?6vIlbm5kWfv7lHh4cVC8YA5o0/8CKAQGsJcmFzH1jnIV6IksXTiObmMUYJYe?=
 =?us-ascii?Q?xaYY+QT21MUZSAbmWAJY0BR4VmJ61NnX2qDL/2HTNlfLAylo+cTJSw2GB70b?=
 =?us-ascii?Q?+kOrHdcCWuBM1V7UG8hCVw4dFOHSgsAa/C2EppIeSsQ2TfAwPZP/OQAOn5sX?=
 =?us-ascii?Q?A7B2zYMxJ6aPhEt//Xfn0dRL1a5M4nEzIwxRZVDOzwRihUQT8NLXyEF5nXI6?=
 =?us-ascii?Q?jsQejXOzvip8XkF3gCdoagUicmgIPtCXT+BC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V4FhrXMNpvHWr7Rin1a3HzOUW6ZIy8JGGxnAGjZwjsf4xt3xgt+dtjSdeink?=
 =?us-ascii?Q?kFxgow0lR+DxyKQSxJzS2Js1wT65XvpGqUpT9yRAhXMVIRQuhPhFkuoy8lOD?=
 =?us-ascii?Q?TA89HqLHOK2w4tg0+Sm4pEn2oqrmwfxwyPtpQkZKjrtbRUUhEj12YA9eGxnk?=
 =?us-ascii?Q?/Ej41bQAfSGM/bZIl3fcOoBol2v0sJgXmvuCS4R2mVQzhK5pXyz2DzfCjcVU?=
 =?us-ascii?Q?xFxqm0MDKwpgT4RtY7WUMrXiO3bMNlXWv5QjjJMgGggRF1JdwnzzOMetbwgT?=
 =?us-ascii?Q?G4BUzrFif/8a+BE2ChM6RW+StabDMncWd/Z3q6FyancJL1yb687j0evphTux?=
 =?us-ascii?Q?YCp4ngCcEIsbej+f6PTHEQei9oq5S9L3FxPbJo9C/8OGyUP7Pg1kmD1N9vuk?=
 =?us-ascii?Q?JLJs3vHQTPPgQPCzE3UAw2r1GM2xR2Q/wzSfQAL/OQXNRPK4Rr9H8Fkd31Qi?=
 =?us-ascii?Q?ow9mUiaUOp9LnHATNK0f5XS+NKKz4PpAp+5gZmVK6ymHDcJZztfm2hEiN8eH?=
 =?us-ascii?Q?TmtrhpYyIpL7t37NIkZsJphyS1LevrEeBOMd7oz2tw8X53QpZcwrQzjVLnDW?=
 =?us-ascii?Q?wRqTLUsroWMY054HO+GsMaRvLdP4Zd6K2fPy8xz1rS6yCy9ec0puy8gDKd7g?=
 =?us-ascii?Q?9WD1BLuL+ERRD/ovXrIC3fQsTxs20LsMRIHic0WJvKkrAtT0Pct4oYAgqNLy?=
 =?us-ascii?Q?NUgNX8IFbNnJ4P+EM95bP/cFO5RRZJrAWjv1uI+cCb7TPP4shm3cE4PymULS?=
 =?us-ascii?Q?rVq53Qtb6fVHmbZFMMtfck9OD6GzE2zvR/ojBX3Y6vSJCOhYk4yFJkU1FiMz?=
 =?us-ascii?Q?K8TuVFv1p05iI4Ab9fNKhUXrQ+uqu/9akiUrPFT0Rv4wiFoNv/Tu+n1fgIsd?=
 =?us-ascii?Q?wzrS7Ddmv+vyL1vag0RhNBkEEWTjU2M4YC6qW4+/XQ+KCHFCn+/w76hA+o9e?=
 =?us-ascii?Q?xbzefsHO2L6gaZf/+YhcoaoFmxPJ9zLIIO4tEqFMwkah8qIlLeL+9Wy13qzl?=
 =?us-ascii?Q?+tA0Z+IVQ334Z9IEet0MqHXktexZCsFr8wWTQgyT6a5UOLVMaVhgOQyXtrPF?=
 =?us-ascii?Q?VxDytERuCdnTB8FiKygLGvfSLzYYd9p61RyVxZerl11hDYZQEiJ2N93rKN3A?=
 =?us-ascii?Q?ybadv0Z6wr1IxmK1fxpEmGDN3gd6IMT/PtMBXgrghJ4wq/weCikpIGtiXsuL?=
 =?us-ascii?Q?/Wqr2S9DdEHxgUc1rsMRXIbc2e/8pBf9CdMWi5op544qinbckSthbcDFx0Eq?=
 =?us-ascii?Q?+KfqUNGNP4TJSYVzukRBpVykNAfgcTvOhZWFFrmv0yyBulVPNK4b2gOd6N3M?=
 =?us-ascii?Q?ezQZsaXWedBCfW1ZOZfcf5dwsAgTeWnJ62jcFLejKEv3x8tgvKw4n0U+AIgK?=
 =?us-ascii?Q?DPkKbxXpHu+Cwz1zSqIADonaZJRsniNDWWAjmuFLpZs61banrqkncV0GAbMF?=
 =?us-ascii?Q?C40YWM7GlGUqaAGMLYwhkH0UgsYzDI+EAAPTeOoqLEv0kgeZqnxSsDWtyrWk?=
 =?us-ascii?Q?jAX3ygKQzZDLKFmuqcsg6X0Z67xqcQ/kWWlydltQ9VPiiqPb2Vcw9iWThF6+?=
 =?us-ascii?Q?ClLuTABXfgsWTNM6SxY2ZQN6y8cMFk+SGdKfew3NSJCrszhF5V0GlCoVSkpJ?=
 =?us-ascii?Q?IvI7l+i2ER7nY3tKNnOSvgasN1NfpmoL1c27AqAKVqxmDL0XLpah/eP8S8t/?=
 =?us-ascii?Q?z5xeWWiiBQYzv9WtiVwUKC1fCJLD+hw5rnCbPNCsSFjRIY1chWshm4MP1r94?=
 =?us-ascii?Q?KqZ00S+3EQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc03f60-8867-4ee3-d9fc-08de52b0cbef
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 14:34:02.1756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zd2X929+2F3L9/VBiu8VJi9HFVdwve/iDb34tTbm37Zf8E3yZORVIoX6nvuQ9B72cj6OhyU4vM6uC+8gcf6MMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8893
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

Hi Thasleem,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Mohammed Thasleem
> Sent: Tuesday, January 13, 2026 6:57 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH v1 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS
> suspend/resume validation test
>=20
> Validate DC5 state entry before and after suspend/resume cycle using DPMS=
.
> Ensures DC5 functionality is preserved across system suspend/resume
> operations.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 5e59ba6e0..ba00fd96a 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -77,6 +77,9 @@
>   *
>   * SUBTEST: dc5-retention-flops
>   * Description: This test validates display engine entry to DC5 state wh=
ile PSR
> is active on Pipe B
> + *
> + * SUBTEST: dc5-dpms-suspend-resume
> + * Description: This test validate DC5 state entry before and after
> + suspend/resume cycle using DPMS
>   */
>=20
>  /* DC State Flags */
> @@ -721,6 +724,14 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");  }
>=20
> +static void test_dc5_dpms_suspend_resume(data_t *data, int dc_flag) {
> +	test_dc_state_dpms(data, dc_flag);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
> +	test_dc_state_dpms(data, dc_flag);
Here you are calling test_dc_state_dpms() before and after suspend/resume.
If DC5 state is not entered at least once before suspending, the first call=
 will fail.
In that case suspend/resume portion is never exercised.

Can you confirm whether this is intentional?

> +
> +}
> +
>  static void kms_poll_state_restore(int sig)  {
>  	int sysfs_fd;
> @@ -841,6 +852,12 @@ int igt_main()
>  		test_dc9_dpms(&data);
>  	}
>=20
> +	igt_describe("This test validates display engine entry to DC5 state "
> +		      "entry before and after suspend/resume cycle using
Rephrase the description to remove repeated "entry" word.

Regards,
Pranay

> DPMS");
> +	igt_subtest("dc5-dpms-suspend-resume")
> +		test_dc5_dpms_suspend_resume(&data, CHECK_DC5);
> +
> +
>  	igt_fixture() {
>  		free(data.debugfs_dump);
>  		close(data.debugfs_fd);
> --
> 2.25.1

