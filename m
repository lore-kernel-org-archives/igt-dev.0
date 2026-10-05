Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D85BCA5FCE
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 07:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7DD10EA04;
	Mon,  5 Oct 2026 07:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2wIXU41";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A6A10EA04
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 07:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791186855; x=1822722855;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OfWx3IkIh8yR/j3G/yQ7FfEey75F6Lrv8kgQ2AYyEMI=;
 b=R2wIXU41WxSI2OHRc6nwpt7KWTWw00tWN9/Bi/AG3lPC+fLuMHe0IBaV
 sG+1TOpHavZuxkaKv+P1OO2CI3UMW9CglUDSkUgW+1ENHca3YygQMBOVW
 qfycgc6WkhCODCQRwYjMi4EPpaXtT4G7YtinjF2qMd1eA6a/CYkdPNjtD
 Ypk8kzJ160PCf1Xom+CCdOjoQaF7qCf8Pc8XXnJdrtytfNFdPog/jpQ3n
 wSkN9KtMKt2O1jnnYrGlC1OqzQFrpYoOP+md9aKLs5pYT+x2YK54Lz9/c
 0QRhKX361msB3xwyeSD0ClrK+2iQgVkNmwoyLoxacdm9SVdmGew9TKexH A==;
X-CSE-ConnectionGUID: 8vcYI6KQQlKPXjnuzv2X6g==
X-CSE-MsgGUID: KnSEdgCsTLK4GVtHv9tKvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90618376"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="90618376"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 00:54:15 -0700
X-CSE-ConnectionGUID: OkQgiQm9QpScL9BAwSY5Ow==
X-CSE-MsgGUID: KU/FCqGrQVKI0oKzeX1o5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="284832219"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 00:54:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 00:54:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 00:54:14 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 00:54:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8NaIF8plMOUARY0dpmqrjFOAbtpg3e/Vv7MNcLAWIfvsGZskUz6I13gI1Ct16Bf0ysQ0yLDDoUGt2WXSG3TBCYqFcWzrHvR0+dADNCvBLIoro4MlLKED124USPgvXj4iO+6thBiEHH5XHqkFexss6TNBumBWVYKS0CeigiV7ZIesDb+OP2gUCiGu0QoW6TxSWGlViYz/A03G10pyXEBklVlwFcpzyCiwnOpQ/XRFxG4GC/IQKKz395WvXu2KLIpww6F/DYdv2qWZJxpyq91IAkKJqpm+I67Czh29cqgvd9HbMuI7aULsTONwF40y0OKsLGM0M6T9AOrUotl5YqvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcOaTWl6fn74S+1VD+OtaQTZv764muUnahAbINZbbzQ=;
 b=xePXI6gTYuQJSIfvZ7x3hiBUV9HZy7Pph9KmAEg4RAdn5P6owqoeuGVOzPukVbQvSZmbdLrw/e8ia9lVk/WGXFGC6rDH2eHDmAGlCHiABM3GCL6bbruD616dL1zVFecNhNISYK5k0y5WCrVSsRu5vnxzOFmgG1QMqvAaMJsgnSdFCH0lcnSMH55O+7PcVumqwcnUQXj+JrkY+gL5YKKEesbTFgcKpv0GdJ1TsclbHaYMF2Apw2X8P6Gs1LaYUtEIcwDWJy0Ax6o1XRKTHEDZGGvyQhaIFwMLMG6cQ/4GN1AowETYMA92fzjUp9+Plh2jiKTe3e4lIfhPvAILhKKHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20)
 by SJ0PR11MB5104.namprd11.prod.outlook.com (2603:10b6:a03:2db::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 07:54:11 +0000
Received: from SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::25cd:c6ae:55e1:e6c0]) by SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::25cd:c6ae:55e1:e6c0%5]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 07:54:11 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe_exec_queue_property: Destroy vm
 and exec queue on test exit
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_exec_queue_property: Destroy vm
 and exec queue on test exit
Thread-Index: AQHdTB6XsmDeRRQvmkGqoFQuyMRy/LbupQTw
Date: Mon, 5 Oct 2026 07:54:11 +0000
Message-ID: <SA1PR11MB8428FBB10FA84D65B9E341218D962@SA1PR11MB8428.namprd11.prod.outlook.com>
References: <20260924120438.1485077-1-dnyaneshwar.bhadane@intel.com>
 <20260924120438.1485077-3-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20260924120438.1485077-3-dnyaneshwar.bhadane@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8428:EE_|SJ0PR11MB5104:EE_
x-ms-office365-filtering-correlation-id: 20f1852e-9361-45c8-4614-08df22b5d7c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|10067099003|3023799007|38070700021|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: VxQHyFuw/8uR48pDD4M+snobFhoU+jYYC2DlmfVionSIvKVKJBofaej7Bcw8Kgdeh8u2Wt2nYqTOWNhAi/xbr2MsHXZ3MsIRjYXto1dBq5JjlfUxnQfvpKN4cfrWcAy6ZEMmU3uPb7LTiDfg9ABv+sHzXGSmFEA/DwQQoJwMdlGKc8Sn+fV7AiGaEdg2RxFdQMT2Xba769znC5VEsvfKhK/8P7MNeme6WyPnKwelXsFUbJUvty9fkKHUOzsJewzCgH+ye+gtiR8u+nkR22s9qPPWQjPXyxTKjznMmPlWkrnbEnhJV/kLQ0V8B1yssEO3iwHOBdG1BsL6xQhkGxuwL2DK4URvh9sfkhkPeJP7HPLb/W+6bZrqNkuY9ma2yvJyx690qa9OsTLp/s1lmqGfDGSxUu6ER3/zmQBFeoOJsumwXukLqYW5swxSogFY03dFKpAt9GDuxkNvpTxdVMpjjps/aZA4+AdU3KPefQktu50sbDYyUR62veMadCDJRNEaBNXonGfpQuKYGJQXSkAhxjCq6Zm6dkS1pK8U1RmJKYrKTrUPaVpOBYMovXMIHOAex/58mr9BmxHC6oLcnvEQr8Eqw45cqTYjfbNZcnSv+A1b2vmoyJs2LGGbfC8CaqZ9h/eNYmTfQwmhBx5PjpPY7H+Gs2cUzmsGHdevAgJZKXCvGyI/7LIergefoMCPUTFaonjqGNsIfpWijrs/Xr84xMBs8zP863uAzbJhcZ3zwMg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8428.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(10067099003)(3023799007)(38070700021)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SpAO0/0Wj6cZmBOH2ShlSTxnawTbZ5GvHqk01NcXPKACpKkqbSeDRzqMe6CR?=
 =?us-ascii?Q?Fvlu5TY2IBMWFDunV9jnJqKyMatJqdx12/o+oURBGNUimZLcbA14MRPG9Y3J?=
 =?us-ascii?Q?0UVytvokiRHgoJ0cNd+Y+ydQzW6l9BtQSez9AQMzaCg6WBQtBVJ2sgwPO4xb?=
 =?us-ascii?Q?jAGv4V9uxRez5DTQ4nrcQDQ3M0ey1BMc+TrLJnpyp06QFcinBrIwIALpzYaM?=
 =?us-ascii?Q?y+2jOD3AugWSVAzkYKM2XLVdmuPz1A4Iykvww82rQ5dvt+k+31z1DFL54zfm?=
 =?us-ascii?Q?vLZd0kVzakg6Yhm28gZUx5PvKD7389bHtt5tPDZfHWjQ1MjiJ2o42W8XRIiT?=
 =?us-ascii?Q?WbEnyu24+RgXzPdpRd814cMdQLAV1oNjc/kThzFWD4jwkI7VafGGQh6mXHYO?=
 =?us-ascii?Q?9nrjOx4DvXzS5uPUkONLVRnskyYvwo0+0CeWHgBln/gHaNQS+b61rZlbM7yv?=
 =?us-ascii?Q?AbxP2P8UiQJM4g1W11jUgHLPioBd5m7gIsFIgVHLDZi0z1K3AOsN4eN/ZvdM?=
 =?us-ascii?Q?vJ1al7p5Z19h2y+vdB9Azn79f+JnHEAXDESUouwB/5z7UPCNEKslju5kzfbF?=
 =?us-ascii?Q?MjwrxmmKF7tJJxtukE+q7qrpDi4vEnsjP1MHKwd2Uhi+fRT1oV7lutnDwGIJ?=
 =?us-ascii?Q?Bv/EGHtR6f6cPbZOC6tpdSQS7za7F2ppxM+mCpBQmOu/O7dSWgNrqaZktSBk?=
 =?us-ascii?Q?G7A9DCVbeSo+STGiG41ezDUSS+DeALMR4Vg6qTALzv71n2sDE7MgR5Mowqtd?=
 =?us-ascii?Q?epNhltlublNitEN/P1iEavH0w1Z5S6Wj7Qo3aNka5GeD7iPo4zc9tOFKdvtR?=
 =?us-ascii?Q?5S3GFdbyQ4dC5v0cu27vUe28c+xUCZN2m38JIsBcVEKIVemNp6Cd/RXYSJ7a?=
 =?us-ascii?Q?7FE992dzo31VszKqHAbnvNoi6VfL8gFC8HU+4xbVJWbs1E3/COF72YPzKE9k?=
 =?us-ascii?Q?6BhH/mldsnieH35bnNC1eJHcOalxfZcXCCC+JITEf4LmelbKEaXpyS0LNwE8?=
 =?us-ascii?Q?hXdjSYT4Q/8udrkz8mZVvSBEpW7EkBV5nuPAJkM9SWU15qRDhcuc4JSeoyY9?=
 =?us-ascii?Q?iI22LTDAR+vYa8feZOkznBe3abbsFjj6hUXdaSup/BAuWavk3c5IDPQbpaLJ?=
 =?us-ascii?Q?sHBeAMTI9/2tOrYaodkIiFHoaPpgeZemdT87eAvzMnNQ8l3fPZTBcxAK97Ks?=
 =?us-ascii?Q?XadwfFGwmwE7mSUVCLUMffSUIsH+7OqOi/0jbW/2ROM1n067joqMWn5Ji4BM?=
 =?us-ascii?Q?mDjLdcw4fhQLDrLVco94QXqRN8qyHMxNDf1jCjM/CmXnB89bxN/H386FZHfd?=
 =?us-ascii?Q?aPwk1tEolWTyXGmpA7dFHs3XhFeyb3ipJ6un2iW5Apm70LxQKObIqKZPPwNO?=
 =?us-ascii?Q?e789cCaRz9APlTZ+B5jM8RvXjQ83/8oLwSuMLRedEw4T+DS8nV2j6M+OIE4e?=
 =?us-ascii?Q?kvcnuUs4kPkthgT0qNSt0AX9NUsFoJaFMiuuQCV38D3q82AWtsQBXyYAG0j8?=
 =?us-ascii?Q?ZZtVvOIqgpzWGwMZ4e+cpmiWRY2z3021RNWM+kszsB5lpf1YhtlH1yDTGiX7?=
 =?us-ascii?Q?RPNX7YIAHm6p8ADnw2mLjQqP7NuxpWfUr0W5q4CR0A6A2ctupVrEcxiL1/Lv?=
 =?us-ascii?Q?sOudVbxZUqOQtDO6w50f1V61P0EoFQyeZSGPNxk3ffI7cZql6SsWw/leBebR?=
 =?us-ascii?Q?6ibLmqUrelwUbbX+0/LHDtRH9Ur0j0EEwUnyVHnTh2uziogakaqT17PrDHZZ?=
 =?us-ascii?Q?yJrBEOzHHA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lqL26fwcFy1zIKDKKA65kJI4eywkVuHbLmaBPIzcl9C3NKGkTL6/fY6Hz5HkgGfK52MqYC270A2cq9c9FNkn/BB5T1uxRQlUu3GZZq8yrlGH/F2j0FWHDq4ESkWq3CVFkxbvCV4KSy6H9vB5pSQtdTSRdNwSkI26PyY/OpJQolS2bo03KQISX9QybzY7u4jHnhAqi9lwzzcXm3uz1njNDaGmA3sUCkQi+Hwv23vNPNllEfe6aKKxQBPymJlaJrxVVvXNoxt/oQGfLkrbxU9s2Tn5bSWDX3yY/buSTC4euoMbmr0J1NUfMacH2nci9AAArr9WtmMSIjOhgadI8k7P2Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f1852e-9361-45c8-4614-08df22b5d7c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 07:54:11.4065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MOEWMMT1z6fHxCTR2KFZBcMDfe2vL8dLjMsRJv0H7HVliwKNt+JJ5GH82KFJFFh5rruwk9qIzT7LBHMpzMW6IAu2iLmrLwtM3ZTVHbOqzkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5104
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
> Dnyaneshwar Bhadane
> Sent: 24 September 2026 17:35
> To: igt-dev@lists.freedesktop.org
> Cc: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_queue_property: Destroy vm=
 and
> exec queue on test exit
>=20
> Destroy exec_queue before the exec_queue id gets overridden.
> Destroy vm and exec_queue at the end of the test that were leaking inside=
 of
> invalid_property().
>=20
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  tests/intel/xe_exec_queue_property.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_queue_property.c
> b/tests/intel/xe_exec_queue_property.c
> index 258dc05e5..3504f19b7 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -188,6 +188,8 @@ static void invalid_property(int xe)
>  	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
>  					     to_user_pointer(&ext),
> &exec_queue_id), 0);
>=20
> +	xe_exec_queue_destroy(xe, exec_queue_id);
> +
>  	/* Invalid property should fail */
>  	ext.property =3D invalid_property;
>  	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance, @@ -
> 197,6 +199,9 @@ static void invalid_property(int xe)
>  	ext.property =3D valid_property;
>  	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
>  					     to_user_pointer(&ext),
> &exec_queue_id), 0);
> +
> +	xe_exec_queue_destroy(xe, exec_queue_id);
> +	xe_vm_destroy(xe, vm);
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  }
>=20
>  int igt_main()
> --
> 2.54.0

