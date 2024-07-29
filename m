Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C11C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 06:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A092F10E30F;
	Mon, 29 Jul 2024 06:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HUN3Vuew";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE8610E30A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 06:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722235314; x=1753771314;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XDg9oAIsaRJOU2yifunfeayiohBOCdxn+Kzii0fZsn8=;
 b=HUN3Vuewz+id/n5YAgWFznjeQjmciOJ3D8a2sJ6Oph1A2Dw5biVxTrRJ
 uM+cAeUKBbt4hoPpepRWq+Moese3BXihdGpQ6GmawDUE0+x8VILaXgEIS
 2TVj8l1iGkR/cr64L7i8ttZNVV9ysCT+ah2L63K1cvc9+LpI2+/WdI9U/
 JzP471MA9aYzZkg9Sy7S7kpwZWHn9++4bMQVCxv7MVS589Y3rmTpPwnnw
 1okrFPO2N6bnEcvs+ujcWHhZ1RiS2EGPXFbkPo1O6CyGCv0YAQtp/vDlY
 +85c64UQVlSKphy7vS8eyIY/XKPilVlw1VxX1OAljA2n3CA9rDlgyecfy A==;
X-CSE-ConnectionGUID: Dg0VowynQFaUcvztGb4XPg==
X-CSE-MsgGUID: grw7AJmTQteB5NaZeQpoTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="37436232"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="37436232"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2024 23:41:53 -0700
X-CSE-ConnectionGUID: FOEJFbW4R2OXf25F+Zllmw==
X-CSE-MsgGUID: SogD4XmKQe6VIoAXumX47g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="77122850"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jul 2024 23:41:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 28 Jul 2024 23:41:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 28 Jul 2024 23:41:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 28 Jul 2024 23:41:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1FbubZPpIQwR+ilJRbLhXXLz4wn1cixxtbxWTVnvNiC0gWCijjsXkSK38lgWOHTESxQurnB/T45oPj0LFpCyRe2wdllyeWaHN4mmidNEbUFQDLeHr2f/I2NcDzlN+EiizuYi+d1S+EJ1n2gxrm15u6PIi5fsPHqdpcfqRMj8pctwkW/e5HphidP/pE/vEr3Uqhq4KPd2zFPnnhfGgSQrfDmJD3kSDeqgqF+f3TzjbJnwTFIkJSo14JLeQsLhqsCF1X1vl2ctwJ1VI7sw/y0x+A52FtRP8QZNVreAIs69lWTWYNcn5jlah0DE70e+RzIP7aF5e1wcftKOv1UgzPGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+82+dgIyllQLGpzvNEJZvlGPRH45NPtlZtRXRhfidd8=;
 b=T8I9QWIhy32cYZM8RniPybTVaI98yZrGrGbRUiU29L8StIBuDyFlnJS6I8c/cWhgvx/awj0w/OIP9nqN0d/NgRmbrht9068PSZSwNeDnMZsWSVS59/hRxTmcSU61Xyb/1vx9bkq3+g+8aDZk9hFUfh+L5H2ZFbVUEteIGuWu8tH0lTHf2Cd7/RIBool2PIysklBpC+ZocwnYtzs8x9+YnnfaNEe/1Ef8izlL3cGIaP4thmHH//LuEagv/qeoXBt3alQ3zsbkCfQct1OSZxpZRymK4ktN1FA9dq8ORSlO1ugXnh736JxuJ2RqxPZllD1BbSm1Sdoe8uZtefs5IGsFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by PH0PR11MB7588.namprd11.prod.outlook.com (2603:10b6:510:28b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34; Mon, 29 Jul
 2024 06:41:45 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%7]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 06:41:45 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v3] tests/intel/xe_exec_compute_mode: Add userptr free /
 munmap sections
Thread-Topic: [PATCH v3] tests/intel/xe_exec_compute_mode: Add userptr free /
 munmap sections
Thread-Index: AQHa3rnWxzfbeZ9RoEKY72r7/jwRkLINRzFA
Date: Mon, 29 Jul 2024 06:41:45 +0000
Message-ID: <MW3PR11MB47483E5D0035DDE073922133AEB72@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240725174123.1931566-1-matthew.brost@intel.com>
In-Reply-To: <20240725174123.1931566-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|PH0PR11MB7588:EE_
x-ms-office365-filtering-correlation-id: 4db6c94b-64f9-4c50-b35e-08dcaf9983d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?4WjOFbFni2qPL+2B4B0r8b8uNs4X16lznjwdH7hdbjTsXo/4jNUuF1ya5nml?=
 =?us-ascii?Q?RAFQ6l96+SaFsBS2331FbPtfG4OZ4yS2tXCEfUDKr1oqCTg7CsyfYnN1BNLE?=
 =?us-ascii?Q?IfSyg7nzsHCI/7pyNxs50930GNppH1QzQVUzcWSv98vmOSLlGL6BvQruaTi/?=
 =?us-ascii?Q?kIh5WOyRTmRzSkERMfb2o3AU+FQGbDuyt4t7gE823zG3hC3XvjnXdLHQp2EC?=
 =?us-ascii?Q?mx5+nhpnlCqo1iZ9t2fEuUTjl2g/Y1lP9UgtYeFDdoYm8btT7ttbAuri3hAD?=
 =?us-ascii?Q?lrXvQTdNTSZH0GTeZ3vpudg5Wez6mzWnlesn+PoAPjvpWv49/Snafs93INyV?=
 =?us-ascii?Q?nu/lIgVTn5RG+v+lHLya6sxutWIxqCBexeE+dDBLW4SKypUgSCHlpx+4C+cC?=
 =?us-ascii?Q?fhSM4RA87rFIsgByWj/gB1+BNxhVPvD2tcJenCjvweAuoA+PII3fSAxgAOrb?=
 =?us-ascii?Q?5vBGD1ISpqNxJgn3vFCTAboRKq9DlYWg5TEV6W5r8sde4kjmH8MASt5uxzx3?=
 =?us-ascii?Q?jEm6yC9HyDo6PgGGFhFNaG9jRzufwrafnHLs1APX1CwSnUnPc5KejkpcuIdq?=
 =?us-ascii?Q?7fgtjkVV5kDhMJ2kfjKObC1z4kA1ipCHUn9SpIwBe2LAVTiwke8kBj8QiOt5?=
 =?us-ascii?Q?s9+KjYiNvvu/XzsscKw/7v3bYRZ3DicNFIrkObUv99zAMSU3FhCrpFX8wOdF?=
 =?us-ascii?Q?ttRg3MWwQLTwqUscaMIwLgWsbUhzF6hVJBxDUzrvTPyQi3pSfyT3M1e8Eq2T?=
 =?us-ascii?Q?5WeUqbp2edm9+zMYTAhooIs6LECcxhqX1N1/r3VTdEH5p2A+iSkQJH4QSTfX?=
 =?us-ascii?Q?46nYlfuhGJOrnn+TEmDYLNID5NRrVu6xju0oE1r1cGCFLbEOjDIBM0zklfsN?=
 =?us-ascii?Q?R7ucqlQE/paC5jaQhDG+y7JCUrvHPC09jVfEZ47lJcl3z2oOjjXbWeVw0Anv?=
 =?us-ascii?Q?lPva50EsEYQjzRZZSKGia43058RbBpOVmduyq6PAJtNokPEYk4l3x1atb9Zp?=
 =?us-ascii?Q?yQy59a7b5Lk8EWkz/41LECcqJWnjDm3OjhVdinn9xvBUyUmxWz1V00R5d4vX?=
 =?us-ascii?Q?rd12LyJ2kDhtJUKHLStzOuoc7jMrlHdYz/x35X4LvrjJHSCSyMjDmv79nk7w?=
 =?us-ascii?Q?D65Im+f5m8raZmSlP12zvOoiQvSNiWacVrFyLRZqt8wR+sN5Ve0YCphW7Otf?=
 =?us-ascii?Q?Kf8fmHMPotovh7r+Q723o5r7JWv6g/gPbj4UkdI3Oo1bAEYxCy/Rmjm+pZ/U?=
 =?us-ascii?Q?VPF6fYqLth4G/FA+1ds8Kz+lE/cTYXFEA3IoLeHhkQtUyCBzbmngbpG1jbNr?=
 =?us-ascii?Q?SXssVhApc5CGeHc84ItN4LLwspbvFL/0tIlirSDx51WOxVvq3DrPuH2v4fWQ?=
 =?us-ascii?Q?ruDnpFljqVR7RTFtEuugF+68x9At0ARZAqChno3obCjas7VJ6A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LbZ5Mw0tYRwQdfHtPdbOuypZPnjKle63hkn2blWZUBQuixKH//KE5N4rUp7A?=
 =?us-ascii?Q?Xn6OXc5GLg4he1Mo4AkWT0OarfedtpGonc3zVcETbvKLYkVRdGB34vlpZehq?=
 =?us-ascii?Q?lM4CoVtwqRIi0f16zCHqPTcrNlrG4kSHN4rtqDy33KEsoy55VA6dtvQSF4uN?=
 =?us-ascii?Q?N5jXzGAOmFKBaLGNuaU/r48QqL5WhVCBa6shFyOk9+YQ9gS2mOFNHOva58Yf?=
 =?us-ascii?Q?Rf8oTwel0ovgx69N/Wb7dpQzbv8E7k4h8WM1/yRkBTheq4Hfc+fgF+AhC5q0?=
 =?us-ascii?Q?65jkwJFXLy48OeOetegvJ8DW5a4/gTRB8l7u+4mUPBLWP4ZOhTIjdhR1FerC?=
 =?us-ascii?Q?8Yc5pH+GBSg8+MlAu6+IYhbe8xkpzfLYp/Ea46as/UkD2YJcwabOdOvcgX4S?=
 =?us-ascii?Q?T91kFpmeIZnMnauxC4YjGUobFGGB+9IqLMEV3s3kiBdt6cRh3JMV5qgB7q45?=
 =?us-ascii?Q?g9LL5IyGSArEMBUd2pavEiK6QkfAUwX7lb3j3tLb9FJzx8uI4XioaHNOK9/P?=
 =?us-ascii?Q?HciIw77/PP5+uP+3BTCoTXOUpKn6aEDxCNxZhTGr8g/QP/XGBrvBhSF7+2Lo?=
 =?us-ascii?Q?AvBkJgms2/ay8BIbapw3N1UtJlGcW2kzcEIdaaZDTbKBd46RXkc2nfJC9wJ+?=
 =?us-ascii?Q?kB5+8Z1xyrKyRdxPbwhwjJk7PUm0bA4PFid2SHx0BL5vRHuXlnvNfVrpDpG/?=
 =?us-ascii?Q?xRmzs2qkC/ipNmLBWwdh3VuXzrQk/1MJjnfY0+y/9ijtYoYyc8oMn14ObSrj?=
 =?us-ascii?Q?y6rZ5yJg9u2UJSCjJVLd9N4L50NfuAAXrToebLlhV84zwld0vVaDWVevLuGm?=
 =?us-ascii?Q?hb1gxrDWbiB5opoa8NbmiWVVLR0r7QUn6zE8mpPr4sP390kuoEMcmRWC/V5o?=
 =?us-ascii?Q?l5rO6LoynXc2Uonx4tOocGM+TueeIS3gq/BZOUdcd0NiEhGISFdjpuKh84YX?=
 =?us-ascii?Q?WOXbmg4hwiD1nyDiQCE5/8AxKHPO05Q76VH8El5WnM3WH6YaxmX1UThZd3TS?=
 =?us-ascii?Q?EBmt+IK5AKQzFETli8AS1b7d2bZ+WdCNmLRm7UUHfL8ONpXAr/2GQgNwXGpV?=
 =?us-ascii?Q?QoUqVwAAgh0gTYv2fNdzmI8Zjbf2tq99Rh9bB8fgGY4yh0Hdv7GHPnyrqQti?=
 =?us-ascii?Q?PY4Ucb+RPutOPk8SPGT2rLBji0Lk6aBVy94/tC+zOaIZqcH7B79G7qAqDNR7?=
 =?us-ascii?Q?w+YhDC6Sch4NejRAjr+1qkXQmgp0CfSeyFVaYCeJLTsNMTj2TBOwOZ3PZGMV?=
 =?us-ascii?Q?aO2+x0nBsc3VyG2KYo2+N2HXOTlou9dcF1lISMkjRekdpYDm+Z10BfGBsTPg?=
 =?us-ascii?Q?pm+c8uD2qsENFFTRhrsHXrhAdUygBNAHz6MG6KSLCc4spXmn39LqtGPDBXQJ?=
 =?us-ascii?Q?NpgkQB85NxTvG8snRGxZIDFk5GCvzf6BFwe+gXdSd8p+YYzb2x/GPyBNQ+cm?=
 =?us-ascii?Q?uhpcTiX2aExA/W3C8l4EhUhOtxTRHxwWXBpttLxjRjnIlJGADriBslzoPfby?=
 =?us-ascii?Q?sbYXF5kQKPriIsKzbLGhjdAVU+HdSzV4hlOwgeyvftKDx/ki5x1HphIyIO/a?=
 =?us-ascii?Q?AXAS7Hz50Sp3+4HBsGRVqT6De8CnwpJFE0X3CJuNq3JDJpeHowP8TkvVEK5H?=
 =?us-ascii?Q?Qg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db6c94b-64f9-4c50-b35e-08dcaf9983d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 06:41:45.5753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cnk6FR1QYKYM8PR2FW4YMr9gqANQ62OI+pcYL2/FwqlT1ActGGUu+BIMkZ0EOTcwReqfnkXe8EmhVbjU/GBSTYsQq0Su7sQVW69gt0DqxGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7588
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
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, July 25, 2024 11:11 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Subject: [PATCH v3] tests/intel/xe_exec_compute_mode: Add userptr free /
> munmap sections
>=20
> Add userptr free / munmap sections which does the aforementioned while th=
e
> userptr still has a mapping. The userptr will be invalidated triggering a=
 rebind
> which will fail pinning pages as the userptr is no longer valid. This is =
allowed and
> should not corrupt the VM or future submissions.
>=20
> v2:
>  - s/faill/fail (Janga)
>  - check dummy for mapped failed (Janga)
> v3:
>  - Include local changes
>=20
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 43 +++++++++++++++++++++++++-----
>  1 file changed, 37 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_compute_mode.c
> b/tests/intel/xe_exec_compute_mode.c
> index 389de7ca40..d5c9d12d1a 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -29,9 +29,11 @@
>  #define REBIND				(0x1 << 1)
>  #define INVALIDATE			(0x1 << 2)
>  #define RACE				(0x1 << 3)
> -#define BIND_EXECQUEUE		(0x1 << 4)
> +#define BIND_EXECQUEUE			(0x1 << 4)
>  #define VM_FOR_BO			(0x1 << 5)
> -#define EXEC_QUEUE_EARLY	(0x1 << 6)
> +#define EXEC_QUEUE_EARLY		(0x1 << 6)
> +#define FREE_MAPPPING			(0x1 << 7)
> +#define UNMAP_MAPPPING			(0x1 << 8)
>=20
>  /**
>   * SUBTEST: twice-%s
> @@ -51,6 +53,8 @@
>   * @basic:				basic
>   * @preempt-fence-early:		preempt fence early
>   * @userptr:				userptr
> + * @userptr-free:			userptr free
> + * @userptr-unmap:			userptr unmap
>   * @rebind:				rebind
>   * @userptr-rebind:			userptr rebind
>   * @userptr-invalidate:			userptr invalidate
> @@ -74,6 +78,8 @@
>   * @basic:				basic
>   * @preempt-fence-early:		preempt fence early
>   * @userptr:				userptr
> + * @userptr-free:			userptr free
> + * @userptr-unmap:			userptr unmap
>   * @rebind:				rebind
>   * @userptr-rebind:			userptr rebind
>   * @userptr-invalidate:			userptr invalidate
> @@ -88,7 +94,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> *eci,
>  	  int n_exec_queues, int n_execs, unsigned int flags)  {
>  	uint32_t vm;
> -	uint64_t addr =3D 0x1a0000;
> +	uint64_t addr =3D 0x1a0000, dummy_addr =3D 0x10001a0000;
>  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  	struct drm_xe_sync sync[1] =3D {
>  		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, @@ -114,6
> +120,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	int i, j, b;
>  	int map_fd =3D -1;
>  	int64_t fence_timeout;
> +	void *dummy;
>=20
>  	igt_assert(n_exec_queues <=3D MAX_N_EXECQUEUES);
>=20
> @@ -142,6 +149,17 @@ test_exec(int fd, struct drm_xe_engine_class_instanc=
e
> *eci,
>  					     bo_size);
>  			igt_assert(data);
>  		}
> +		if (flags & UNMAP_MAPPPING) {
> +			dummy =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ |
> +				     PROT_WRITE, MAP_SHARED | MAP_FIXED |
> +				     MAP_ANONYMOUS, -1, 0);
> +			igt_assert(dummy !=3D MAP_FAILED);
> +		}
> +		if (flags & FREE_MAPPPING) {
> +			dummy =3D aligned_alloc(xe_get_default_alignment(fd),
> +					      bo_size);
> +			igt_assert(dummy);
> +		}
>  	} else {
>  		bo =3D xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
>  				  bo_size, vram_if_possible(fd, eci->gt_id), @@
> -157,16 +175,21 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> *eci,
>  				xe_bind_exec_queue_create(fd, vm, 0);
>  		else
>  			bind_exec_queues[i] =3D 0;
> -	};
> +	}
>=20
>  	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> -	if (bo)
> +	if (bo) {
>  		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
>  				 bo_size, sync, 1);
> -	else
> +	} else {
> +		if (flags & (FREE_MAPPPING | UNMAP_MAPPPING))
> +			xe_vm_bind_userptr_async(fd, vm,
> bind_exec_queues[0],
> +						 to_user_pointer(dummy),
> +						 dummy_addr, bo_size, 0, 0);
>  		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
>  					 to_user_pointer(data), addr,
>  					 bo_size, sync, 1);
> +	}
>  #define ONE_SEC	MS_TO_NS(1000)
>  #define HUNDRED_SEC	MS_TO_NS(100000)
>=20
> @@ -197,6 +220,12 @@ test_exec(int fd, struct drm_xe_engine_class_instanc=
e
> *eci,
>  		exec.address =3D batch_addr;
>  		xe_exec(fd, &exec);
>=20
> +		if (flags & FREE_MAPPPING && !i)
> +			free(dummy);
> +
> +		if (flags & UNMAP_MAPPPING && !i)
> +			munmap(dummy, bo_size);
> +
>  		if (flags & REBIND && i + 1 !=3D n_execs) {
>  			xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
>  				       exec_queues[e], fence_timeout); @@ -
> 489,6 +518,8 @@ igt_main
>  		{ "basic", 0 },
>  		{ "preempt-fence-early", VM_FOR_BO | EXEC_QUEUE_EARLY },
>  		{ "userptr", USERPTR },
> +		{ "userptr-free", USERPTR | FREE_MAPPPING },
> +		{ "userptr-unmap", USERPTR | UNMAP_MAPPPING },
>  		{ "rebind", REBIND },
>  		{ "userptr-rebind", USERPTR | REBIND },
>  		{ "userptr-invalidate", USERPTR | INVALIDATE },
> --
> 2.34.1

