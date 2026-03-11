Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CE4104BEA7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 10:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D2110E0BA;
	Wed, 11 Mar 2026 10:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzASZbpF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5002F10E0BA
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 10:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773223272; x=1804759272;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pQz7Oursg1iroyJD3MNJav2OvfXERFhnI7HL2uUqJd8=;
 b=JzASZbpFUp6jlgBctRD4O1wWvk6AZbvRDc0ugYthpZW8jq3+rp1BorTg
 rkBZXp21y1uam82p2CJXJOsMdbmzZ5ArNSkefwQU0I7Y+I2Ki/xutkX7r
 MHA7ClMb7FuIZcsSownLNToeZM3co8aa1mYdxcVzvAxpUqMBkPhyuyP3m
 cN0M9iTcRYHfnIJ5c9j2DIaGR34Qpc4q0H6RmKO6gyac/k/pB5ilZIz+X
 ec/qKTslcv2aIocZtkstvKRQJLPo44YnBEXqSSaMHtkuRxwWAzWrV5FHM
 bB2cbVhFmBB39HwkCd5CThXzjfEFBmGUO/YSxsrfJDQ90Abejpll8DTWt w==;
X-CSE-ConnectionGUID: w5aYa7cuRbSauLI4lq4S3Q==
X-CSE-MsgGUID: 0MMBJhALRXy3c3jCzs4OAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="76895663"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="76895663"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 03:01:11 -0700
X-CSE-ConnectionGUID: u1A4PItNTWGMsVsoo47dbA==
X-CSE-MsgGUID: Aqx7uqcARyuFaPgedtfk6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224882461"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 03:01:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 03:00:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 03:00:50 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 03:00:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vW8HqbFpt8t7fX/f40G6kuz6sw5ph6UTGyUFKD2X+Ub9ZQxfqRqGFejXlZvxyJncvStLV7voYlOq34KMolwTLq9syog9GD0RomOOtM84srWc2kbQqBbV4F1C1CEe5H/mSWLSkHpWyuWFk+pNsVSJQmjsauPHOFvZSATtb0A/GBosyYr5I0c/a9SwpaxVaNJ1nnbgK007X+RtNnve3F7ZCo7wN74KYvU400QRdSl+09PLd+d7UYQxZRH+lPPsTk0gZZx4CGYWEoXkXV3GgQrCint5LrN6CxZBGU5n0wgFOcsgnwjKx3etGwjKRGnb1KgtxglgO/2vDw9AIvr/sp+jtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1H0MmVlOjEOIJZp4jkxvvzw4xIDruiPLHX6Sa0uRgjQ=;
 b=ShiqFOBZ5C4bhyBm2lZH/O7HS3bwvVTuv4XEUAThpTzKblVG2NQpuR0few7z9e4MlgJp1Np68q62JR2aNAwp3GWneKQqI9xSE7F2N5PSAk9odkn0yIIithTbu223aOil+xMUeLjwR/CqSAyZpNmslWtI4vnZVTxf8LO5A2Qhpvyj3nXzvOLtNtf7kvAEoMytkKuC9vXuW0G1vSYgWDR96a40qla+GcR05Z6xxQLQsVCXW1PM0XNgE1p7uCsDkDyCGXqVxw2rsGK8RnWQ8Iz4HqZWWqxaKbauiy9rJzA0Y8FldnUfHKrxnNMmyYClKjXu1eBtOY+qFhdp2/4W2xGX/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 10:00:47 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 10:00:46 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] tests/kms_plane_scaling: Skip unsupported
 scaling scenarios
Thread-Topic: [PATCH i-g-t v1 1/2] tests/kms_plane_scaling: Skip unsupported
 scaling scenarios
Thread-Index: AQHcsSpgWWUXMu1WWkm4KBB9i5PXYbWo9SaQ
Date: Wed, 11 Mar 2026 10:00:46 +0000
Message-ID: <DM4PR11MB63125C52659EF3A226DFA8B69047A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260311074036.219075-1-ramanaidu.naladala@intel.com>
 <20260311074036.219075-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20260311074036.219075-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA1PR11MB7014:EE_
x-ms-office365-filtering-correlation-id: 47dc1a92-5261-4e81-38f2-08de7f551113
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: ShL0b/FMjBFsn3mtXqYBshIlHT/6N2clp4N/xUfMMgSyjy96S41+XT3zFmpvZuXy1a41lVBGf5rZq7/rLoRQZkbAppGdf19auSVYKZXye82JtGZKpUBJVWLaVM+O5ShyrBR/D0dVmiNUMZYlNRkZ/pqGDt7LXAuvvvKfWmEae3AbZSHZKHZYdMoDGmyyOdWazkz29k0MKb6DSpuB1Kj+RW9UDS87W6SoXvw2EDerwlYb+9SsT0hBGVXemNV21zl4CTa0/dREb4prkn3kQx+sy124zW0PHuHIEnn32oZ2IUn2qLccNI0rqtRrbvGMkig2F51vXnBv62UE6+qiMDVbxwYnDoMtGk3Htw/5kyPBeeiW/MfoCo3vTSG3M5vZ0nVHDm7Rx5HMdnWIBqM/fIOC0ftOvs4eRVb3PIJklooaBfNSzNcPs47Fgwu9n8fvs3qla1XmoeITRolln+mPCrUwOJANgD3S6j4LUEblQ6GxGnVUBVDc1efhZuD+zb0Lzqzx52yCrn1QuXUBjRFTvWSSwNZzLXtfA3/UpYiYYRfv5X66P9AVzWj5un/x59zEmcAjUfoQOReRiNvH1bcCDuYkNEttPDkat1sqx6doHhrrzVMWlWqkymZwfhlMBGKDh7uYx5swRRnyqi/+IRxVTs8Go0ggRKBfVrVm5Ft8hsJohEzMdPK4zlyGOjMCOl8j1NguijyTfnarlyP7nQ1dFEk3Q28ncA65bi3u1lw2RIbx6j+ZaZ6bINHuCxL6eIRJc4JuXRA/IjYZKa/apC0WqfnSJJYMsDlWi9SBHh9HvSjvAj8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2G6FKgMIcETh59ykwMDS4JmQzxM4hJF33H8IkWEzxJJ6pZsvg+WR0gjey08s?=
 =?us-ascii?Q?sCUeeGdP7CwW4HTfPdT6DYLB1t/k3O+AS/qS5J68YRdjKkxTccqTMhzT93GQ?=
 =?us-ascii?Q?AJYckJleWMOsrwttLsZw0fhqyO5MR9dPIoGcYuNtd9KkrkEb/IaKlsgtT7H9?=
 =?us-ascii?Q?Ur1eIfdrfpMDUcGR5JqnN4t2achKnN+Q8WsHzymm9ZqSd+vReeXWX5RYoe2l?=
 =?us-ascii?Q?LZGWozRjeFN58+LQr/6r4voSvao0+GEh21ylAy4UdvSPFF64Z504X6uwtjvq?=
 =?us-ascii?Q?rn7GytjZD1lEx7iKQpeO52+MQh3HJZQAlIooEvTKcfcR0ZgyYutxkGxziP0W?=
 =?us-ascii?Q?h4b1kQRxmp8TbKWc4NiURx+M7QMrN/5e17TFOkVnFZ7AawaouWpuinbWbDuS?=
 =?us-ascii?Q?t4pkHUpmQ9R7Z55gUvHkQhETszWHwvzY4hxrUO4LkbgsDEdaFOM1NzNPIc6P?=
 =?us-ascii?Q?FZjTJYGiwBJr/weAqCMLHHb4EnF6zP22LMCKqrjFTcIqpZBeL/Pc7K5hZhTq?=
 =?us-ascii?Q?CcfnpasBe6dqN6YNNJ3aadeMikE8G2rDsG1YXIch8tyyWpEY/Rj2W02yXeNU?=
 =?us-ascii?Q?ZYOx9TCQ+hIJ8Y6NaaImElW9k4VOqGsGMoiTjmCWGZPSwJB2Vyup4tpKrWlC?=
 =?us-ascii?Q?f4kAOLLE/49FrHdSBsegO6xQZzfOflJrzNxEx6ln67/8UTZ8XpCLe/cQb3ug?=
 =?us-ascii?Q?VTuJx61Gqow0PoYRG3QRZybnE9ICoCEEiByWP2sVJNTpzHdfD/gVd5mtI75G?=
 =?us-ascii?Q?BwdLCol4Hf2G/5o7GJF3Hanq2rNI5YQBpZ6b7xeyrqZAfsmsIonoQVwwoKv6?=
 =?us-ascii?Q?6QOw5Zev6bN5In3VRB+bW5guXbjFlSLuhxIdH6Zr/8nZ7piJ/AJ9heGI0aP3?=
 =?us-ascii?Q?bAgY6netETkkTLLCLqMy1yFrEMts4ji8kTXAeqXTG5zC2A6ZdqnQYYUbZIpe?=
 =?us-ascii?Q?FjEJRWpdjfG7syCZnkUn7r4hhTyv0lWyBcQgFPwsRGRetQ1aIN4luhBmfOR1?=
 =?us-ascii?Q?7U/5NwuwAJnJAS0ziJU6p+108rQIzF+5rQFOczT9Aw4B4bujA0BHvKNrI9MO?=
 =?us-ascii?Q?LYof+WqUokoSUmIC+P55UBGmQADnzW+Hvp8yEXRG0L8qH/ZXeoD46N92sThl?=
 =?us-ascii?Q?qFcsEGocRYeC6bRIri1jqdaycDeavgyDSKAzfhbxI7WCO3YAog71sW5dTEan?=
 =?us-ascii?Q?bPwN8VXjJ2yW7P4cQDXYvBQXcBfuBFAXUhsgvHTEM7+ECTCgMEsmhEtzjdzp?=
 =?us-ascii?Q?3CvhVmMmL1jjw1UBZaTBStFyb1p3BgFp8KKRsPuH3xEKy9znc1R8cdj/oJE8?=
 =?us-ascii?Q?n0QHkw1/uu5JjMYD7wMbxOolEd2EMOarvpWX6KVAS9vdpOG4wcfg/dxehx6/?=
 =?us-ascii?Q?B7AcppTRlC/xZaUdj/t0Ceswx7Bb51w1eylUUlaSncxZTHDrXtMyhGDw4gw6?=
 =?us-ascii?Q?J0sBGR4YdPkeOu88ZiTg7aFoBs8SLi/jFoFBvLSPlt6caW1WMqAq+NgIf1e7?=
 =?us-ascii?Q?pmzfR4wOyBpqAPWhytcyKS9yvRjP+PmsdCmo3IdrLkd9hpfpPrq+WjMW5ZIA?=
 =?us-ascii?Q?WMrxMbCMjI9Py47+i2ofC/05FtVHTZS7F12r7c58IgiCcKSeF8USxecw4ndG?=
 =?us-ascii?Q?sYOr0VA4NX80oi1E+dCaEJeYNO0VMmIbcwgQuSXcx7lIqAto4uUZPRHBgn/F?=
 =?us-ascii?Q?i4whz4XyLgXWZ3fPc5wZikjOD++pQm7H6w28B41TknuVAzMF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ueaKuDjSM4OszYAOsK3YUDwSET0ebv1YRE7gHMcggRmqmADtL2LFXRqfuprGTAxnJ1pqNikn9q7y5U4DqZ5ZFaG+J6l24U2kdcldxYPab9+j1KVJdvV3NDP0jJT0yhLGdb5OsxoM4YKKtA1x5TrkHEi0kDYH4JPXd39ajLSGcPkESWUsvMlFmgrbdyMS7Gedadc3w+KtSqx0Os15NZY7/1mrOZpO4P9rDVhXq8IMsIYpVoKBWN/jeOqK7hGRKCBtBjA4qcammRdXzXNSSPKXEvwpcOcVdLtZ/3Ij7KEWuEoUaLz8haCuW/ekvN4ELGHhUPPTB22zGZ/qUew61hp2YA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47dc1a92-5261-4e81-38f2-08de7f551113
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 10:00:46.8043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AwHB8nPp8xcrIYux1IGlBEvtxdwSz5NZvzOo/bT/fH+/iEML8hvHAqQo4HnwcUQrtNavAiZKLHCcoBzjpl/gdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7014
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nalada=
la
> Ramanaidu
> Sent: Wednesday, March 11, 2026 1:10 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1 1/2] tests/kms_plane_scaling: Skip unsupported s=
caling
> scenarios
>=20
> Skip unsupported downscale tests on Intel platforms, aligning test covera=
ge with
> hardware limitations and reducing CI noise.
>=20
> Bspec: 50441
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_plane_scaling.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c index
> ab619fb2b..60390fae8 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -533,6 +533,24 @@ const struct {
>  	},
>  };
>=20
> +static bool is_intel_downscale_supported(data_t *data, const char * cons=
t
> name,
> +					 const enum scaler_combo_test_type
> test_type) {
> +	if ((intel_display_ver(data->devid) >=3D 14) &&
> +	    (test_type =3D=3D TEST_PLANES_DOWNSCALE))
> +		return false;
> +
> +	if ((intel_display_ver(data->devid) >=3D 14) &&
> +	    (test_type =3D=3D TEST_PLANES_UPSCALE_DOWNSCALE) &&
> +	    strstr(name, "planes-upscale"))
> +		return false;
> +
> +	if (strstr(name, "downscale-factor-0-25"))
> +		return false;
> +
> +	return true;
> +}
> +
>  static int get_width(drmModeModeInfo *mode, double scaling_factor)  {
>  	if (scaling_factor =3D=3D 0.0)
> @@ -1373,6 +1391,11 @@ int igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  		for (int index =3D 0; index <
> ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
>=20
> 	igt_describe(scaler_with_pixel_format_tests[index].describe);
>=20
> 	igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name)
> {
> +				if (is_intel_device(data.drm_fd) &&
> +				    !is_intel_downscale_supported(&data,
> +
> 	scaler_with_pixel_format_tests[index].name,
> +							0))
> +					continue;
>  				for_each_crtc(&data.display, crtc) {
>  					igt_dynamic_f("pipe-%s",
> igt_crtc_name(crtc)) {
>=20
> 	for_each_valid_output_on_crtc(&data.display,
> @@ -1404,6 +1427,11 @@ int igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  		for (int index =3D 0; index <
> ARRAY_SIZE(scaler_with_rotation_tests); index++) {
>=20
> 	igt_describe(scaler_with_rotation_tests[index].describe);
>=20
I think we should avoid using continue here and instead use igt_skip_on() o=
r igt_require().=20
Since this is inside a dynamic subtest, the block should not be entered if =
the feature is not supported.=20
We should skip the test and proceed with the next case without listing an u=
nsupported test.

Thanks=20
Jeevan B=20
> 	igt_subtest_with_dynamic(scaler_with_rotation_tests[index].name) {
> +				if (is_intel_device(data.drm_fd) &&
> +				    !is_intel_downscale_supported(&data,
> +
> 	scaler_with_rotation_tests[index].name,
> +							0))
> +					continue;
>  				for_each_crtc(&data.display, crtc) {
>  					igt_dynamic_f("pipe-%s",
> igt_crtc_name(crtc)) {
>=20
> 	for_each_valid_output_on_crtc(&data.display,
> @@ -1435,6 +1463,11 @@ int igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  		for (int index =3D 0; index <
> ARRAY_SIZE(scaler_with_modifiers_tests); index++) {
>=20
> 	igt_describe(scaler_with_modifiers_tests[index].describe);
>=20
> 	igt_subtest_with_dynamic(scaler_with_modifiers_tests[index].name) {
> +				if (is_intel_device(data.drm_fd) &&
> +				    !is_intel_downscale_supported(&data,
> +
> 	scaler_with_modifiers_tests[index].name,
> +							0))
> +					continue;
>  				for_each_crtc(&data.display, crtc) {
>  					igt_dynamic_f("pipe-%s",
> igt_crtc_name(crtc)) {
>=20
> 	for_each_valid_output_on_crtc(&data.display,
> @@ -1548,6 +1581,11 @@ int igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  		for (int index =3D 0; index <
> ARRAY_SIZE(scaler_with_2_planes_tests); index++) {
>=20
> 	igt_describe(scaler_with_2_planes_tests[index].describe);
>=20
> 	igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
> +				if (is_intel_device(data.drm_fd) &&
> +				    !is_intel_downscale_supported(&data,
> +
> 	scaler_with_2_planes_tests[index].name,
> +
> 	scaler_with_2_planes_tests[index].test_type))
> +					continue;
>  				for_each_crtc(&data.display, crtc) {
>  					igt_dynamic_f("pipe-%s",
> igt_crtc_name(crtc)) {
>=20
> 	for_each_valid_output_on_crtc(&data.display,
> --
> 2.43.0

