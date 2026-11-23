Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7ED606A327
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 06:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aFBIMOjU;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=FrUQYRWc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4CA10E13B;
	Mon, 23 Nov 2026 06:23:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AE910E13B
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 06:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795414920; x=1826950920;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wVFRpI1phA+xZNxtEOv4hqTNXK61M5eUFQ7OF6fA1zI=;
 b=aFBIMOjUMqbMzhX3x3VxIDKOsvE5qcEPKms6573HTpBfT3dHrzk7vYCY
 c6U/5+fupcmUL6FM67hR4xe7lHjAapgi9sfg7tAITUgb4g7PPh1QXnCJa
 uP7SayrkhSxFmMYGkn/Tfz8mb5t+r9z7OC5WALh+9q/C6IJCT761ZLuzS
 M7GLh3GNHL3xd64ecAKlhP9i20MOgCAzb9UAYLuTAOHokLQ4itoc9M2sM
 ct52Ywzob8Ty2le3gTfFzQ/0Qsdk/eQ7jBbAnv2WDKWpqO7Xhbvn5+CGZ
 uk3RsFA/XwyVNX8sf9cnTYxrFlt+fPOIIIKZs8IdzRxTBzgyDBPc7qCX6 Q==;
X-CSE-ConnectionGUID: 8NbirIdbQCmHueOJxYPDlA==
X-CSE-MsgGUID: RqYyM+ZpQ4eozaXfZnXZpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4058620"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4058620"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 22:21:59 -0800
X-CSE-ConnectionGUID: n+yYe4R3SkmQ27XQT/8QYA==
X-CSE-MsgGUID: Q8KfJUbrQf2mFGChkkD7CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11555605"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 22:21:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 22:21:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Sun, 22 Nov 2026 22:21:58 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 22:21:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TA1Mbvd53TJG+JhB8V4Iw8aqhPHFoZwtcvXMYr/HC2cK0yflWcEuTdzbDLliy7CBvj9aWJa8in2CBnPsAg8wuqQRnTukgeTRpPdmkSwz9biWGzQHRSiKZbg5x1ulPTDfh3F3R0Hzp30IjShhc7jPxT7tXUQA6j/SStbZwQxkjg9nRYlYIUcuWfHdLskGmW1qfisesmFYs5vQuvnmunm5xBqdVb3Ime89CGdVguTBKF/+Fq6Ix/GoqP+h35GtGerATitYRXNmdbyh7X5b0T+VF82LbNWWcfgk8CS5IE3B0lZ/il2f3ToUehWzF+TMH7CqBCQsouhGjI4UXxWn4PL5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D48hgWjweEjIYwReum72vsgmfePuLx97zEMoRcuLc28=;
 b=fyh5WM165wllATMWrciIQZ/VOei4v/U5LDgf93/EIcRXwR6GdFA4OfS15ZFM7SiW3vJrKGOU8f1got/ZEh/Li1ZpisFo0Mq8JuLoNUxY/VisgAUCEvpdBPJVOmIEtIoMa7QcvDMc+AV1NjOKSkqIk4byUIEnog71VAmxuKpr41vbFc/uMYlxGW0Th1xUucOkUqu2zVUbhq7TvFNiIyzx1U45t75K1xifg0KbNk4IpxoCamzm2DICapfHyJw+7xMd94SC+rq/Krjsxt+NuAesm5NWodRCMSrC6L1VLUaXLqQQdOSI+9ZgV6DmurpbA5HiBSRBpdgrfz/ltUkwhkKyTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D48hgWjweEjIYwReum72vsgmfePuLx97zEMoRcuLc28=;
 b=FrUQYRWcMv/FKImyvOFjCpmpZBQSCktAcHTQqRULdhGzBGlprFP7SNQuJAJE7+7YosXm/lns+ZIIwKXO+JN3/kVo5DRooozvzuW/pklaGhaBO5dx6PKddIRZsJN8pQSH04lKZsZBYp4JRhceSe1z37ggeBT1GIynWQTB+gYSAPY=
Received: from DM4PR11MB5325.namprd11.prod.outlook.com (2603:10b6:5:390::19)
 by IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 06:21:50 +0000
Received: from DM4PR11MB5325.namprd11.prod.outlook.com
 ([fe80::a1ba:c191:333b:b6a0]) by DM4PR11MB5325.namprd11.prod.outlook.com
 ([fe80::a1ba:c191:333b:b6a0%5]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 06:21:50 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_color_pipeline: Limit simulation to
 first/last planes
Thread-Topic: [PATCH i-g-t] tests/kms_color_pipeline: Limit simulation to
 first/last planes
Thread-Index: AQHdeSQ3sd6h9wux2kSKwMKLIBg/vrc7MtrA
Date: Mon, 23 Nov 2026 06:21:50 +0000
Message-ID: <DM4PR11MB53255DFC4EF1A0671DD694D390452@DM4PR11MB5325.namprd11.prod.outlook.com>
References: <20261120192818.1894936-1-swati2.sharma@intel.com>
In-Reply-To: <20261120192818.1894936-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5325:EE_|IA0PR11MB8397:EE_
x-ms-office365-filtering-correlation-id: 87b6cf97-206a-4b3c-dc4d-08df492a0f20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|3023799007|11063799006|56012099006|261028144727099003|261021123027099003|10067099003|261021121427099003|261026140227099003|261009223027099003|261102123227099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info: RgpAAG7V5lEzMnDrpHHsPjMQbNEXMaO7H5rgYhZh6QYenXwTEEDRuq7G4NEtdpEgQdQoqoYF5/jk5WOM1s4xMBDJTm8fGF8OISsPo035BAFIwyLTY8N74cjnzw7U+2kl9ZCiBuqlAwe37FEbUlWxS9jv5sXgi+IQgEWsFKdBkSbhV64szY+Eoez0cHJXb9nKM+ToB7QzW1MFj9651JmGVpg9Rj85EdP/gsgEESYpYSYVDdb/2oTNq/b32mej+qLz+yIxvMdsWjiGO4hWP4eotSzRWLzYuRrONamcY1XPnUGuwTIp+Z1F+dnW9jmkBaJVZNaRYdrksEPlx+HdU+Uz2didoM3gZu2IwaKnfcXtD3/yo3YfBMZGZFd0vX6lEFlAYQqhAHGM0I6e9T6IYuR76grcB3biRTYt0fF9gCitB3EmSBLoPl4xfwst+zTn2RVoaWRH0QQ07a6uFYBPft2Zhq06AlDewFCEpirFQKg1OZjLi2gVtmfDp1yjJCP3Dyvx0Ha9rOK5NNNZ8qQKB8afDK5og2vF3oLO9dM/ZYsfSD2Ed29HmSwpje+9fyUEdIpFoL08Qvqa5Z7gOu3hPy7hOWGjba4ObBVDmqqYTlItRN7Im+JPoOSywtMAjKVzGXQirkigC2n4WROFXto4BmQR/78fC+ZnZ+xrj9wpejjVNYKK/Y731JIizxpnsn3JQwadRU+Z2LNli/tG/mxgkEqrTCQ2rrR0nJUxvxER1UCcHCk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5325.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(261028144727099003)(261021123027099003)(10067099003)(261021121427099003)(261026140227099003)(261009223027099003)(261102123227099003)(261022105027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VuELxh8UYKP1897SCZ4/zdLKj4qdyXtSZyGb9fuc+gMdbKiZ7W+g+C/k6jKJ?=
 =?us-ascii?Q?tGlROzazVnHL7S3VvWDlGyzQprccjt7p9i13xjQO56hRSnDF+RBJPlrDrWQ4?=
 =?us-ascii?Q?T3pZi6gooQnnL/KMcHu6ZMT4nMpouq75aFlxwqBNNzojA8US6eKL+g6/dwTr?=
 =?us-ascii?Q?MmKVwYXCrP4k7D9YG3mnsNhhXtqw2u0Oky/0GtbjJLjroaTc+NoXqHb3rF3+?=
 =?us-ascii?Q?tJIURtrxihLu9ioqRjy8KQI/rH/YcXAEyChu83Fx1OO844g+mkOT7BCGgwLY?=
 =?us-ascii?Q?m3pBqVqLmipi6VMMzpA34/EjX4OIrIz/acaOqh84nQ2SxINApzPWMFyAtMQV?=
 =?us-ascii?Q?kT3njUYfYhJqfYu5ujy4naLHEiTvx4ALN5+wVUSkUN6wDG9nLKTL/hkWWj2w?=
 =?us-ascii?Q?9L7MS4XrPqTNcX5w1pJ2HaExxTmsTX/U5+ZnytlRMLWMiiEz3KbFHh6Dy7SS?=
 =?us-ascii?Q?YVMBtLm2COwL0p266Njh3sar5dCsxgwyJoYhOwZZANhyDCHliD5ehurhp636?=
 =?us-ascii?Q?BrvDlbesAGASJFR0OKGi4hr8mxPgxG4tBb3ElRu0pK2ao6QQUDgYgVm5TXIS?=
 =?us-ascii?Q?PY0aaSA1dkpW9qMokZ3oP54+p4or5dzZqannT/hulvlEBII2Gz0M+ccydiwY?=
 =?us-ascii?Q?sB8tLxmQVnk9yt0If553hN5B1gAUKQUw22Z3OCh2xJSJahbs6l0OfqgwILxB?=
 =?us-ascii?Q?Ao5audR9nvnPiA0LYDnpvfdLZB/5Q+jv0NOkEt2TjTiOJBkaLF2XEeYtmovu?=
 =?us-ascii?Q?dbShEvosWht5VLlxfdo0FwYmvDoqox7MSWOs8v4JpMKWiz+Ms3bUS7mpO7Jd?=
 =?us-ascii?Q?gNZu2bmjXesN43c6DmGb8NMBO7XqJKRYtxj7+kJlq82VQA1NyPl5FKZbB/3N?=
 =?us-ascii?Q?7ctTux4aBdzJjZPUJ3yOciivpiLy9ZLKizhKEQR5x5jaOEdx5b5A3gjlDNhz?=
 =?us-ascii?Q?PFuQ/2HqTXsryULH+MH7jXcyZHI9Ch4epbkTLaHMmhP34q11XvEMV7EIEoVx?=
 =?us-ascii?Q?MxvtafonpajEnfVEefMWEpnwX7M7QUWdf8rZgzgNq42GuXpfVZqyFzzN/Lgj?=
 =?us-ascii?Q?RBgaIDqHzpZ+118Y0Y78KT8V5GHze34qVtynvElAyUbqURzUBf1j2mTemQjN?=
 =?us-ascii?Q?asO4CrGH9RoZfPlYPyK/l+sOjHm8kNtaXAzfX+NhOuDEJLAtHq8svkA39zdO?=
 =?us-ascii?Q?YyMRSfR9/9n1HA5rLG2Nitz21KbPXU6OraZX0oxXd+e3dM6kwiMdP7SIpC9h?=
 =?us-ascii?Q?Mbv91x8DfhQc+Dv78dgyQ9dIyevaeFEhJnCaZlqNnWS3DMtzxPpvfAT5k1Cx?=
 =?us-ascii?Q?dzm2i6OSzY+CRCDLROCE+TqFlL0v1RjpvUSz5sPQvqtl9THjTXFBJmiNwksO?=
 =?us-ascii?Q?+T+iX8COgT+BisNM6j6gCiuWTDHoYaHMe5jihfar3vEluFRYl9KlX6HmFOdE?=
 =?us-ascii?Q?zqUiIZqJ8cuiIw044wDHAeH8co2eBdP6sWckAAPLilRqxdYEMQJpjtTHnUwZ?=
 =?us-ascii?Q?K+bKs52IpxS9+0PiTed53ntjceNQ6ThzyIjLfJAj4RlR9y1syCryLo0/hmG6?=
 =?us-ascii?Q?JfmsCMu37ptsUFY0QnA4mOeYWxWA9F0wnELgF3RHWsAfRw60qfi4znHPcmAg?=
 =?us-ascii?Q?WvB+SmGh9AC1ay4wB9BVcWbxoJe5j19gScSW3VjITguSJg2IOFO2JbM1RHJ4?=
 =?us-ascii?Q?40tfHSTH9IbAkiuf8ik7vtwrDhMnewlvXzz+9DaBDujy5qHu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2oYdved1kSGH3lgR0wBnVr9pTvSd9j8IDmyJkld4r2Fz2z2ujj3b1zq+ijyhsyJTxdBpVhEtFC84+AaarAqMBUcko+zx8exW9zhR0udrZ/EZeBczMuXV9LHv/deshtDhpjvK1SsQSUCoQCQCpH/LoSqA1V5LFjseVYtlGRAi9kdShZOjwQFVzurMnijLQQnh8rXHhgZQ6QIS5NAfUtMXW5GHdwerjn21Vwnf/8fkFfM5k80HBIyEPEKaMQpJX6Sk+2y3gafvIZZqh3Z4s94wjeUeJvA2TO3HEqmOftaQtKJwci8ePiAwKv0GpMXoREMb9CDdWNVBFV/io2Sg/ALrAw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5325.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b6cf97-206a-4b3c-dc4d-08df492a0f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 06:21:50.0758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6r+yk3tiNzgqyzQ+37m4EVz9+6oLaCB5CFzs+fhfkVAD3rpQtG2mwjAJCfqEcZz/RMBuu/xasYqaOhxS+OZww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Looks good.=20
Nit: the fixed-matrix subtests already limit simulation to the first/last p=
lanes, so please reword the commit message to say this extends that to the =
regular colorop subtests and factors it into a helper.

Reviewed-by: Jeevan B jeevan.b@intel.com

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Saturday, November 21, 2026 12:58 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/kms_color_pipeline: Limit simulation to firs=
t/last
> planes
>=20
> The plane color pipeline subtests iterate over every eligible plane, whic=
h can
> make simulation runs time out. Restrict simulation coverage for both regu=
lar
> and fixed-matrix subtests to the first and last planes supporting color
> pipelines, while retaining full coverage otherwise.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_color_pipeline.c | 75 +++++++++++++++-----------------
>  1 file changed, 35 insertions(+), 40 deletions(-)
>=20
> diff --git a/tests/intel/kms_color_pipeline.c b/tests/intel/kms_color_pip=
eline.c
> index 69d5d8cf2..41a0e244a 100644
> --- a/tests/intel/kms_color_pipeline.c
> +++ b/tests/intel/kms_color_pipeline.c
> @@ -197,17 +197,27 @@ static void _test_plane_colorops(data_t *data,
>  		igt_assert_crc_equal(crc_ref, &crc_pipe);  }
>=20
> -static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
> -				const color_t *fb_colors,
> -				const color_t *exp_colors,
> -				kms_colorop_t *colorops[])
> +static void test_colorops_on_planes(data_t *data, igt_crtc_t *crtc,
> +				    const color_t *fb_colors, igt_crc_t *ref_crc,
> +				    kms_colorop_t *colorops[], uint32_t
> input_format)
>  {
>  	int n_planes =3D crtc->n_planes;
> +	int first_plane =3D -1, last_plane =3D -1;
> +	bool in_simulation =3D igt_run_in_simulation();
>  	igt_output_t *output =3D data->output;
>  	igt_plane_t *plane;
> -	igt_crc_t ref_crc;
>=20
> -	capture_ref_crc(data, output, exp_colors, &ref_crc);
> +	for (int plane_id =3D 0; plane_id < n_planes; plane_id++) {
> +		plane =3D igt_output_get_plane(output, plane_id);
> +
> +		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
> +		if (first_plane < 0)
> +			first_plane =3D plane_id;
> +
> +		last_plane =3D plane_id;
> +	}
>=20
>  	for (int plane_id =3D 0; plane_id < n_planes; plane_id++) {
>  		plane =3D igt_output_get_plane(output, plane_id); @@ -215,13
> +225,28 @@ static void test_plane_colorops(data_t *data, igt_crtc_t *crtc=
,
>  		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
>  			continue;
>=20
> +		if (in_simulation &&
> +		    plane_id !=3D first_plane && plane_id !=3D last_plane)
> +			continue;
> +
>  		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc),
> plane_id)
>  			_test_plane_colorops(data, plane, fb_colors,
> -					     &ref_crc, colorops,
> -					     DRM_FORMAT_XRGB8888);
> +					     ref_crc, colorops, input_format);
>  	}
>  }
>=20
> +static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
> +				const color_t *fb_colors,
> +				const color_t *exp_colors,
> +				kms_colorop_t *colorops[])
> +{
> +	igt_crc_t ref_crc;
> +
> +	capture_ref_crc(data, data->output, exp_colors, &ref_crc);
> +	test_colorops_on_planes(data, crtc, fb_colors, &ref_crc, colorops,
> +				DRM_FORMAT_XRGB8888);
> +}
> +
>  static void
>  run_tests_for_plane(data_t *data)
>  {
> @@ -406,12 +431,8 @@ static void test_plane_fixed_matrix_colorops(data_t
> *data, igt_crtc_t *crtc,
>  					     const color_t *fb_colors,
>  					     kms_colorop_t *colorops[])
>  {
> -	int n_planes =3D crtc->n_planes;
> -	int first_plane =3D -1, last_plane =3D -1;
> -	bool in_simulation =3D igt_run_in_simulation();
>  	igt_output_t *output =3D data->output;
>  	drmModeModeInfo *mode =3D data->mode;
> -	igt_plane_t *plane;
>  	igt_crc_t ref_crc;
>  	struct igt_fb yuv_fb;
>  	enum igt_color_encoding encoding;
> @@ -435,34 +456,8 @@ static void test_plane_fixed_matrix_colorops(data_t
> *data, igt_crtc_t *crtc,
>  	capture_sw_converted_ref_crc(data, output, &yuv_fb, &ref_crc);
>  	igt_remove_fb(data->drm_fd, &yuv_fb);
>=20
> -	/* Get first & last planes supporting color pipeline. */
> -	for (int plane_id =3D 0; plane_id < n_planes; plane_id++) {
> -		plane =3D igt_output_get_plane(output, plane_id);
> -
> -		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> -			continue;
> -
> -		if (first_plane < 0)
> -			first_plane =3D plane_id;
> -
> -		last_plane =3D plane_id;
> -	}
> -
> -	for (int plane_id =3D 0; plane_id < n_planes; plane_id++) {
> -		plane =3D igt_output_get_plane(output, plane_id);
> -
> -		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> -			continue;
> -
> -		if (in_simulation &&
> -		    plane_id !=3D first_plane && plane_id !=3D last_plane)
> -			continue;
> -
> -		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc),
> plane_id)
> -			_test_plane_colorops(data, plane, fb_colors,
> -					     &ref_crc, colorops,
> -					     DRM_FORMAT_YUYV);
> -	}
> +	test_colorops_on_planes(data, crtc, fb_colors, &ref_crc, colorops,
> +				DRM_FORMAT_YUYV);
>  }
>=20
>  /**
> --
> 2.25.1

