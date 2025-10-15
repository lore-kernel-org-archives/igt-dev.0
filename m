Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A235CCD18E
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 07:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FA210E269;
	Wed, 15 Oct 2025 07:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvOgp7SJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084D710E269
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 07:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760512831; x=1792048831;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=M2o2SvJgTy0PEos7B/PfDSWKHqcqFUM84Jk4vVMUlaw=;
 b=fvOgp7SJzTGfC02sF82g8gWg2BmCc73ts5R0B/2AclZQy+AfG+t6EVK/
 iYItDPmgo0ao6dcAJre9MShHyoA7MEt5pLT2Kw5BGOPetbneLdkXNtna6
 vv+/6oC2p9cURyVx7zEDpJJsjn0SvPOz7D4Mlde+MsWsMXfY66gdkB5Mg
 WfedP2yUeDpEDBfDLWgfOnl6wRuqcfBvd5GeRBYXOJnTDl2VjcbrOKaKr
 OWt152WA6d7C3bYLEikbtzlX1aIMl2WR+4vghW8yH5v59w0su+Ox3I8nc
 vFs4pbwr6VVpBb7Z/t3WrKY0jvh51cv6+GlZKLB6/0TxInz6Qdu6lpFkP A==;
X-CSE-ConnectionGUID: XbUg/iE5QpGx3EcSVe2hBg==
X-CSE-MsgGUID: Pyb1vqbGQtyL2c/35a6hRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73782005"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="73782005"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:20:30 -0700
X-CSE-ConnectionGUID: eL4bX9eOQjScLdLeOjZ8lg==
X-CSE-MsgGUID: aj8gJPEgSe6ZXCQT5JzCDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="186352205"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:20:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 00:20:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 00:20:30 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 00:20:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KApMG7jk3y5QNGZdDdv8+Dg5iH/Qr7HMa6Sv0KSpeXxKjI5EGSIg71nllZtkbvimtvEKyK/b9DOgyF9In4CKdhx26YmGtZQP/GswgXTdmS+pmnmahHK1RsM0qTwa24R8heKWZ/yGQ23fQso6+xEJsLHRfeP4zlzP3grjcHcAc1wzYzFWZqYNfmTBS5AlI8BqLRz61gqZszsL7wuQQrR0DpY6ayekTaRI5Ij4Rs4gluE+8pJMBIDffG4jVcbZhtfKSy9nETWUL482w68XsVoFn1X+zcLyPlO9XnjHQbphpmgK3sgzvUolVftlzCu4UAafwmpEUvurmFQFNAH/IGgOYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAQt3CTOOKZGhUGjVwFRgC8zJ+976jNq/THBwcJ2rU0=;
 b=tvvmcJ7ArXboAZs1np+9DD2g2zRtGc4AoKGVQ9Loxb3ySgO3Fc5oFyGnk6cP3CRhA5kVNJE08vR/5bboFWY3BzrDeSPQ5lxgL+nJE8pBEtCQOwK+wLEDs3cVhSj7DsnlI9BsY7DoygYIFtNdJ3FnZvaymzXTqFuFBsZkJcqJZxsvPhHfq450Mh3hzaGUcHjAg1rgIf/17gwkOJjBnS+sHcMq1cgtUPorJ4j+ByPGzQ+sIwDub8JVczq3Zy3a5nwLNZJpnNOWT2oQmpYGirOgA2Qyaa9xPuGJUJZlAyIrT8DAjdvBczofVtkTPwFsOfO//LcRoK/EGbIGhdWsBcIuhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 07:20:26 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 07:20:26 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v3 2/2] tests/kms_vrr: Reduce unnecessary logging in
 specific test cases
Thread-Topic: [PATCH i-g-t v3 2/2] tests/kms_vrr: Reduce unnecessary logging
 in specific test cases
Thread-Index: AQHcPZ0cKOhweqdZJEuACOHYQ1qzSbTCzPpw
Date: Wed, 15 Oct 2025 07:20:26 +0000
Message-ID: <DM4PR11MB63123FD6B9AA75A0AC664E2090E8A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251015062922.447336-1-ramanaidu.naladala@intel.com>
 <20251015062922.447336-3-ramanaidu.naladala@intel.com>
In-Reply-To: <20251015062922.447336-3-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA3PR11MB7433:EE_
x-ms-office365-filtering-correlation-id: a696a527-cfb1-4e7a-289f-08de0bbb4fee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pvJMJwspfo/JVpiezuQ7Lliwhvy62C7eBNchRnQWjvGjkr68TQPHbLLs2hNx?=
 =?us-ascii?Q?Tjfsw0syv1I1wOZJ7HWAJ0KN++qYws73/MOoxsb0c5YhThXPGB7A0rxsxOs9?=
 =?us-ascii?Q?1cNiKgzNiCLuxB0xezAy/PfaBS/M1nwyh1d7rQqPZfC3LjIv5vUYzJ/6z3rN?=
 =?us-ascii?Q?YUugp9CzZ+QafQT5Jv4H+SZsOtKsjd01J1+TbpPDUMdW767P/DuJYU9jgREb?=
 =?us-ascii?Q?6jFh149KYJL14t3RILktIXHKorJVkSy+DbzBQuQCTUsQMNOFhLkplOzukVLL?=
 =?us-ascii?Q?uhqzbMZvq2ZnyfIckjKcul9xqwwLpZux7lXlXYxx7Ro2+JzOK9wwEmrDmtCQ?=
 =?us-ascii?Q?Qz6/YGW962T2yWfQkZtZ/V5PrdICGDEhalVasgBL1PmPtX5AiFWS0ttSb04x?=
 =?us-ascii?Q?dehBbLpU3ZTCKD2vyjOunA2WbfCmLreGeuT2FrTNvJ77wKxPEBHmY0ztHnIn?=
 =?us-ascii?Q?JlYz3KiuvHyPe/gGMeCxg2en303zuYaVf2xKMFVOu/yQCLwHYA5EvkSlQYt5?=
 =?us-ascii?Q?hEFoHLYlVLXPlBXT9RH8LMqJkAFlU/C2YI+mqhjW6LNPshTfOkQOli1iiB7u?=
 =?us-ascii?Q?65aeUULgfTAgq/bUjZqzVrM/p705Voyvn6DUfSkZtJoJ5ijBG9Ey4ZdFUJBh?=
 =?us-ascii?Q?dSQiMutrPQmq6x5YRifrrMou4YHMEdFixeUXBMV7B+mAVmDoO9vSTIhGEUyn?=
 =?us-ascii?Q?tx2qtpCMiO32uSLC0eqlGqdsFacZXlhlFyxzOTRBGPLwPZkdzfXmQ8HpIyOV?=
 =?us-ascii?Q?ppz122OGpr2vwFGFrxOxveNXW2gNGdfm1TKLxH+Eva82qHYSeiULz7VHplEV?=
 =?us-ascii?Q?duzyz7vendDtbmRhquRgyim2P7T/CgooBTfeCgAkm5vBNOCpt3DEGk9LD1bT?=
 =?us-ascii?Q?NI3xVbyiSgDvOTzxMOlfzmpsKuqk9B+2t5zvB/UhowPzVR/uR7C4mBjUcYAO?=
 =?us-ascii?Q?X39WTpBdzU2ylLWR2SQHNAE2JxK9Ud6B4XbjBYAScyoa0DDjN3WrnV3W5YbB?=
 =?us-ascii?Q?3uH5+XNxtmXQ7pe7gJlcCEUgGFuczVk0Vj0hmakeTYFZS8nzJfAGujuWWKMi?=
 =?us-ascii?Q?XXeTRFpd4sJmbtvnTdo90QUjFfC8EOQFzAVyCxv/9F0X24rsjNDW/laaYrtW?=
 =?us-ascii?Q?S3DCSxTMRG+JZ4aQBsAVkT/Ni0IXFVPaWZhLaSnbe8MZ9IBNF3AdYt/jImLR?=
 =?us-ascii?Q?mOmXthr9+AysQWWkrJ3pA0phne+4r9Y8P1RIk85ZbLYXMmcb2motAxu219rh?=
 =?us-ascii?Q?8kNvqUSHzrYCeWVYr80fAlIowgny8hFqybg2xobBJhGtIMQgTspq1ro9LkvA?=
 =?us-ascii?Q?cCnb+co1rnxX1fZuOobERqPr6c5pJ2a+0S+Q3hoFv/qsLzg+Hi46YTMb+7j8?=
 =?us-ascii?Q?72z2ypkH3sj2Mze1WCsoFEl2wU6l4a69HSbQDYVBijvW2INLw9C+Vyf6NKXe?=
 =?us-ascii?Q?uaDAOfz8EHqUqfzUCz0gY0Zbd4maeq1VTen4XrxJhcXqyeU2hyI16Ia8YDp+?=
 =?us-ascii?Q?00rwSU06LOT7NTj+WQwyJ9+Z4ZAbxjISBaSH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jY1OePE0QRBFPTBEAgtk94Q9U14/HXiy01U/qMfPWwDBMbheqEMQO6p5sVxf?=
 =?us-ascii?Q?bsBe0AuNB3YsrfYbBhitRBnGRButDKoJi5sCT+mYrCOP5YhdX0JiJsJaTK98?=
 =?us-ascii?Q?5ebPpmYQZH4ybK7Aab+5nJNapwCKYI/zskPIUhV1bW/oQix/fmkxmaFavf14?=
 =?us-ascii?Q?EVX7FK9UTfrpJT+qpKAD0G07ncGzzJQ0cWV9MnHgJB0tA1hz28NYKgD2Dtgt?=
 =?us-ascii?Q?Hnhpk+N2lqBIv3s0b0d3KkaXUIWvP9nWLKiQn4s3gvlApdjsIkOt2exZbm+P?=
 =?us-ascii?Q?Y0oe2laHqWIN4R38CGzf2WTFJDydunwRWQhMTumgAJrkS46WVeazsvm3YpxQ?=
 =?us-ascii?Q?vUp/18DkDXqRhlD2fiSS0EI6R5bbJNqRfxaRItNpn02a5+uhCcKyycCTAoTX?=
 =?us-ascii?Q?zYx9wyPyuoMwH2bSF9OtQgRWHsSZPN9+pBd3DpAUfLnG++whtRdQ7k/ZXE3f?=
 =?us-ascii?Q?VyjS4m1H6sHjuL9WS5gt1Zi0WrxtA88UNzUkwTi+swlVvIm9fzLR3lQqYkJv?=
 =?us-ascii?Q?iq4MOLtQKH8XKP+OmSZw9ow+TtkZ5M5Gg4Zscv8oBvq2UUbeZbxmL3/m9LcV?=
 =?us-ascii?Q?fL9x/N/P649Dc5w/mxbeT7NVrhPQGwpwPGnlhJbCPKaKhA9WWBE2iu0FvTA1?=
 =?us-ascii?Q?BvkSzsjuhDTgek/yF4AB133g6WFb+bpAdzPqu9v0fiFaKYwIOgmH/AusEn9V?=
 =?us-ascii?Q?84s79z7HDo7EpdxfM8jz4rKVXLvKVC9Nd5+LIXj4PzH3Z/lBAc52BOfwDOWZ?=
 =?us-ascii?Q?mOS7hIMApcHiYL70SyIrax10jwJ2z/1ffE98mIDVDCwwUKNRHn211aE9q6Vv?=
 =?us-ascii?Q?SM0ec2382PpRV1LUOXL636dFqgrwPIAkzWl8E63IKGBnnp6Qa3z6DscxVz+P?=
 =?us-ascii?Q?OI29/cpe8frLgF7cHeLD0Ux7eHcyGrGaYUmcTowzr+7x5Z3EvGYoOOqJ0PNf?=
 =?us-ascii?Q?dU7S7CUjZWExgL5B/NLGxBk0o23Si98VAC6ofXJS7gdHNI+EjCB1S7xtFijC?=
 =?us-ascii?Q?3A7Tb6jlmquSoNEnPR0EH3Zau2RMBVB3KQA+U776ozg12BuCRDKQf1fA/bTv?=
 =?us-ascii?Q?CdoUd8I2ctV/+80A37q46D5C6j5A+DHjwzvtZFiG1PTPpWFxx6TJQI/V0PIr?=
 =?us-ascii?Q?spvnyfErzzw0mmwvGe4mxqP9Xnrm9xdzskvoSBmM4jAgqXRa74TEprWA/Gs+?=
 =?us-ascii?Q?/j3GZj4GEMUOtrDi/ggy+LMCDHPxTVkL3alGXplCbAuTgBr749esu+tl1j6C?=
 =?us-ascii?Q?dOV538OVz2/yFg35h0V+w0qobZ4k6cg8ZvBMdbPvGq6V+9cKvzYTmzt5rCEr?=
 =?us-ascii?Q?ETZ0XQkr4jxC8+/8c5PJTymFIV9fLELkQruZ2HmiBFOi2L/7W1hPmhsHSG6w?=
 =?us-ascii?Q?vlwusG06PmUaJF1wNC6TUrv9amE9jJjh+Ga4U5U+5ELM3zuQ2zCxdqv4LkxF?=
 =?us-ascii?Q?RLuqUMhLgtbvQTmMxscp69KV+QKHTaKh1fR/Kt1oOFrgAr84+QCx/9rhVe6Q?=
 =?us-ascii?Q?dQVxFGbjgDIWb6KjzeOpCO3M30Gt8gpHbK4CUgPcQS/7sGfgI+9Hu8MmW557?=
 =?us-ascii?Q?S4E6c2CDh1bsqqcv310=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a696a527-cfb1-4e7a-289f-08de0bbb4fee
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 07:20:26.0644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: htu6Xj2eTJefc1ipRTyCpKsv4H48fXaQrGsK1nv9P3FvY2MC/lC5eQ94o4g4cydRCeL6Zc6zE9UyznxmQhDY7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Wednesday, October 15, 2025 11:59 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v3 2/2] tests/kms_vrr: Reduce unnecessary logging i=
n
> specific test cases
>=20
> Add a way to control log output based on the test scenario. This helps av=
oid
> printing detailed information when it's not needed, making the logs clean=
er
> and easier to read.
>=20
> v2: Add info logs.
> v3: Split the patch.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 1e4d9cdac..0c439bcd9
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -154,6 +154,7 @@ typedef struct data {
>  	vtest_ns_t vtest_ns;
>  	uint64_t duration_ns;
>  	bool static_image;
> +	uint32_t flag;
>  } data_t;
>=20
>  typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t); @@ =
-
> 512,10 +513,11 @@ flip_and_measure(data_t *data, igt_output_t *output,
> enum pipe pipe,
>=20
>  		calculate_tolerance(&threshold_hi[i], &threshold_lo[i],
> exp_rate_ns);
>=20
> -		igt_info("Requested rate[%d]: %" PRIu64 " ns (%.2f Hz),
> Expected rate between: %" PRIu64 " ns (%.2f Hz) to %" PRIu64 " ns (%.2f
> Hz)\n",
> -			 i, rates_ns[i], (float)NSECS_PER_SEC / rates_ns[i],
> threshold_hi[i],
> -			 (float)NSECS_PER_SEC / threshold_hi[i],
> threshold_lo[i],
> -			 (float)NSECS_PER_SEC / threshold_lo[i]);
> +		if (data->flag !=3D TEST_LINK_OFF)
> +			igt_info("Requested rate[%d]: %" PRIu64 " ns (%.2f
> Hz), Expected rate between: %" PRIu64 " ns (%.2f Hz) to %" PRIu64 " ns (%=
.2f
> Hz)\n",
> +				 i, rates_ns[i], (float)NSECS_PER_SEC /
> rates_ns[i],
> +				 threshold_hi[i], (float)NSECS_PER_SEC /
> threshold_hi[i],
> +				 threshold_lo[i], (float)NSECS_PER_SEC /
> threshold_lo[i]);
>  	}
>=20
>  	/* Align with the flip completion event to speed up convergence. */
> @@ -581,14 +583,18 @@ flip_and_measure(data_t *data, igt_output_t
> *output, enum pipe pipe,
>  		while (get_time_ns() < target_ns - 10);
>  	}
>=20
> -	igt_info("Completed %u flips, %u were in threshold for [", total_flip,
> total_pass);
> -	for (int i =3D 0; i < num_rates; ++i) {
> -		igt_info("(%llu Hz) %"PRIu64"ns%s",
> (NSECS_PER_SEC/rates_ns[i]), rates_ns[i],
> -			 i < num_rates - 1 ? "," : "");
> -	}
> -	igt_info("]\n");
> +	if (data->flag !=3D TEST_LINK_OFF) {
> +		igt_info("Completed %u flips, %u were in threshold for [",
> +total_flip, total_pass);
>=20
> -	return total_flip ? ((total_pass * 100) / total_flip) : 0;
> +		for (int i =3D 0; i < num_rates; ++i) {
> +			igt_info("(%llu Hz) %" PRIu64 "ns%s",
> (NSECS_PER_SEC / rates_ns[i]),
> +				 rates_ns[i], i < num_rates - 1 ? "," : "");
> +		}
> +		igt_info("]\n");
> +
> +		return total_flip ? ((total_pass * 100) / total_flip) : 0;
> +	}
> +	return 0;
>  }
>=20
>  static uint32_t
> @@ -875,6 +881,7 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_t
> *output, uint32_t flags)
>=20
>  	rate[0] =3D igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[HIGH_RR_MODE].vrefresh);
>  	prepare_test(data, output, pipe);
> +	data->flag =3D flags;
>=20
>  	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u)
> Hz\n",
>  		 output->name, kmstest_pipe_name(pipe), data->range.min,
> data->range.max); @@ -886,6 +893,9 @@ test_lobf(data_t *data, enum pipe
> pipe, igt_output_t *output, uint32_t flags)
>=20
>  	for (vrefresh =3D data->range.max - step_size;
>  	     vrefresh >=3D data->range.min; vrefresh -=3D step_size) {
> +		igt_info("Testing LOBF with a %u hz flip rate on %u hz panel
> refresh rate\n",
> +			 vrefresh, data-
> >switch_modes[HIGH_RR_MODE].vrefresh);
> +
>  		rate[0] =3D igt_kms_frame_time_from_vrefresh(vrefresh);
>  		flip_and_measure(data, output, pipe, rate, 1,
> NSECS_PER_SEC);
>=20
> --
> 2.43.0

