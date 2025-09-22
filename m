Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC50CAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 05:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E3D10E3AC;
	Mon, 22 Sep 2025 05:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GqzMM/pK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A964410E3AC
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 05:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758518889; x=1790054889;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5ZBAeRYnGX+KkMTBgLS4AEDu8M4AkFlurzl7f4weVk4=;
 b=GqzMM/pKsZzuJE3Yf0JY+frG5toy+mwj9oRXq75SX9cf8pBX1W8PRSi/
 515g03q4CHJmV1Qm3C4EoH6IBULyv/42i0hXosjuda2x2Sh1TUupAv3wP
 +7xlEb1FQQrqHHIm+G/q6/OtBktC1FIR8z4JlRNxnt/FDJ9oIWESh9ez5
 1/RpnBzdjyZG6k1rvvucfrfpINN40Ir/L0c3leTTA842hgvNIqCUxLiMV
 xDgGl86jrOqn40WK2QJUreTpcBGGo9MMtfg7QMlS1Cs5UKRFDF8vKZjhi
 0dqViObpYZLsvWRJNXAsyGUGUH+xTfDWgZqBgFhsSVU9Ns+/peLzHN6st A==;
X-CSE-ConnectionGUID: Y7+9ewFnRfqMa9ha175J7g==
X-CSE-MsgGUID: 4ikTD7zQQuezvXXbd5FVCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="78378763"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="78378763"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 22:28:08 -0700
X-CSE-ConnectionGUID: qZbI4C71Su2oRhg/HJMtLw==
X-CSE-MsgGUID: +p5Bk44zR/KwA0mcX0yKiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="200101287"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 22:28:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 21 Sep 2025 22:28:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 21 Sep 2025 22:28:07 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 21 Sep 2025 22:28:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPjqEdG6U5iKu1p1U/R24F9D0DgZBYgttxoMronatUe+TRde/HnXZmMlhmWiikIlHJEZARAQvHf38w51QHGNUlVvQQdCvfxj+ZMuR3KrTwGMyrrDS6wUR5Fy+gbHl6TCtqoI5KeRor24QSeWgIZbQPYCVQLdJrhdc1I/B6nymVcCq6f2IGBhSO0iOwqmG24yWG3xH3hxTsxybidXo3CxzNQN9b1SHEv54yydYhCBdlLJe7vsfvmHvsWVtChIxD4JlMu26XH5EuzD3DKbWbsaLSNcxpjBL3xQnHdkOPhQACABV1i17+DVme51JX1zZjG8NKDAkG5+2hlNovbkVLalpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP9RlG75PZ00DYrklBEHIYEST3oamgaRKOG7CtAZ328=;
 b=QWbngzQaHw5a6PsuIggz1uvQgvdiLjbDcYivt3qyNphO19FjJur3oVHyhdNXajnEgjc3DhA27BTWriQNnsCW1F395Q9Eh7uXdhOfSGz2eCYhNRfGNLEw2Uv/8iHCu7AgUmepWlzbhLHO9KVWIEEC95/QnJGIxiPcPArIuf4MIoIbv8x4thMgaLeauUGVTMXh2n+qpJL+VDcM/qW2zuioL5RrH44Zke8tJ1km9loXTxkeLgbjitffyZOOx9IdH77VtBuyj9aXcfuURVYOcLBJBd7RUGCx6C8BBVESwT1dW1aFiX1Y7/GEM0z0q0ulBUylSsgdelXsH68+SuRH5oT7kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 LV2PR11MB6021.namprd11.prod.outlook.com (2603:10b6:408:17e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 05:28:05 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9137.012; Mon, 22 Sep 2025
 05:28:05 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/3] tests/kms_vrr: extend lobf test for supported
 connectors
Thread-Topic: [PATCH i-g-t 2/3] tests/kms_vrr: extend lobf test for supported
 connectors
Thread-Index: AQHcKHrPdIEYdV2Ob06YPSyofdFIorSesj6w
Date: Mon, 22 Sep 2025 05:28:05 +0000
Message-ID: <DM4PR11MB6312274AE5EA7BB8B249C8E79012A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250918091702.2339227-1-kunal1.joshi@intel.com>
 <20250918091702.2339227-3-kunal1.joshi@intel.com>
In-Reply-To: <20250918091702.2339227-3-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|LV2PR11MB6021:EE_
x-ms-office365-filtering-correlation-id: c830764f-1fae-4acc-06dd-08ddf998ce9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?SY/UVfdmGuwnrJa1ZI9viKgJwdD436KEpDEXmchnDH/zSrBD4uF73mvJ68+s?=
 =?us-ascii?Q?8pGQT3MIcAwscpBemEGqlT0SLHdcEDOXTHqgiDPuadcrbqqhG4n8T99+pNLJ?=
 =?us-ascii?Q?lr4KaOUXi4uB+UlGcOd1eE0+4F1J6ohkpfSVgeDecShOpH8dryUfmQhFdK8g?=
 =?us-ascii?Q?yQNK1H/mH41JTxp9fEtsRaEq7TongiA2gxwnyJZ27r8CgXwHezEncrxN445z?=
 =?us-ascii?Q?vl4Ti3OxdlZr7bDlPYKpaRXcsaB2b21970KgNFpju210CGjieuDGyB68e4FW?=
 =?us-ascii?Q?2wuJolF4fnVSUIWakGufWbfMIx5wAcqnQZiLakR7s5fTo3XVgafVTx5yaVVh?=
 =?us-ascii?Q?i9PSEmgYE1m2IMTNiH8fj+YejVEImm52oEYpOsJxxyAelHeZeufFvtXcwdLm?=
 =?us-ascii?Q?nXwsy9vm47c7AR7sTtmAD9wsEXjazHGZijLiOVir3WfLvX68M9EyzFYbHdK5?=
 =?us-ascii?Q?mFMhKhJc+frShZjIUsy8fFIXg3UJbM4EcN4uNIMELbioZ8pUWM8/denKURcc?=
 =?us-ascii?Q?Ws/QnudIrVFtoM7kFTfJeTlsfhUM8NTeosrXxEkLEPA7TNW6S4BJfJ73qkGl?=
 =?us-ascii?Q?TJK3nsy6ygZwclMd4AaIzHIsEgAcFy+yTVzglQ6qb4EnWm/N35ZvsSuvAsKf?=
 =?us-ascii?Q?3Hid8RemO6+foJKOWCAvsjfIsA0Fv9bEYY0C1fIsD1cIlcMyVUvlraGrPlgS?=
 =?us-ascii?Q?tKRF9Xv6dkU6EkJj+7lHpWiQj1WSdJ/gjpSLjdjhQJ2LxIYvR0piDNfOKHTD?=
 =?us-ascii?Q?PhAJ3siV8FImEiiRztdjK3Ewhnng6nL+m+fRxewdofZf6TxNSK75+cATqWAv?=
 =?us-ascii?Q?5HY1vBl/nJD252NbMQ3inVRgNMsiJx/sOiDsHFKupcowse2mnH2ZmwHE/y/l?=
 =?us-ascii?Q?GRb4wLTVWuHXIg8DK8rHYqKaLwwqPUM8JojcHBNqfxk5l/GCNfVLxCET/9hn?=
 =?us-ascii?Q?fQlkQzGreoAnvLuue47PwRqKZEr8Xe7E+0kCuv6hx3hGZ6KaEUQpXRMS84Js?=
 =?us-ascii?Q?JMu3SH1FWJUtYb4KTAJ6XantVyZxmdKzkLyEkMWRoa+lSXkA1wJyNuj+/gDX?=
 =?us-ascii?Q?bQx1mHAmDW81ERz8MbxPuwZSieOBzXmuo5S12DgvHJRLIwAiCGteDkw9X5jK?=
 =?us-ascii?Q?pye37tb5BNb+YPoDmUmq5j4Jt6EiDXrxgBM6BgxQXGLKBmIu9HLFE3eQA0Oj?=
 =?us-ascii?Q?y6YNkc42J0MHIXv31ug3vO2wz9CkuMSwuOfQkMWy61mH/8/165mg8i0ESzO5?=
 =?us-ascii?Q?1cXbmQ5O26bm1xvxfjZoBkiFbSswmNNiuTJ5wsG7/pauaygfu3TKxowbr8fL?=
 =?us-ascii?Q?N70uC6sXJprAhJ3pWoIDmtZZAwcXyIOHHK4fe1Xfy1biQT42F9yUp9vuUI/V?=
 =?us-ascii?Q?HDWmXRnkJybhFG/5d9Bbfy6YvAB6pMDOccevOoL8dmIyq2nCDhqt6fQXEco4?=
 =?us-ascii?Q?NSDqgjx6XquFF22x6FHAKDV9/dTr4hun5SU2xv4lat/DmOuDwMcG6FJwW642?=
 =?us-ascii?Q?kwavntTB12afMTc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6aVJbTngP2CUg+Vixso40NjaOY8KiRfw+MLjdnHz3KAmYTTPjsfYXStsXwI3?=
 =?us-ascii?Q?Aa+OlzFXm3+Jr9R013e6WuWb5cnFDaGffbP8l2lUUnUCt/JLRhxkM6cny6e2?=
 =?us-ascii?Q?tVk0mnCS2m5pXBjBu8JjxL01TFIf+YVtdjpPz1nFffNCzqOjxu4G5qIq0c1O?=
 =?us-ascii?Q?i5O3PaLJzelt7OoiuSW1Xq4h1ex4Hkmicm8JbUucHUZFZAeI1rFJ2UuCsau7?=
 =?us-ascii?Q?/BVh1SCblNEzH67UiS8QH4Euq9mNC4vP+shXLmR9Y2aN/tCUxP3ePb2C27ZZ?=
 =?us-ascii?Q?EiNQL3iuYS0wLCkjioisPn9FYTtBwpxvknX8KllLBB389VyYikLbTYVv4Uq/?=
 =?us-ascii?Q?S2+/QtwP2yhy7UCifsKRPioXU/ke3exCZWdGzz8oHFOcDcTZty6bzrMMxEIO?=
 =?us-ascii?Q?kyzOhtZukvyhHsQTYzkVbgpKg9ksNXO7yDGGACRfBOhgdI0MoRjVq5m0nUD9?=
 =?us-ascii?Q?dnutbcZuWtFiaphGstP7E0EAQpoD64iCkPv+S8IFDAvkcBRXldXM2YQrvgQR?=
 =?us-ascii?Q?GuJ0xPMHPDrWUOSxabZUEMdlL9D8zSv2+erb3dRISUhtOfSqnweYlTcMkM1H?=
 =?us-ascii?Q?/RZMojW4DQ758LAfNYgrLBA77iYyxIeBWt6mp4S8J1BlxbZMmRISC0axiANN?=
 =?us-ascii?Q?GzdtHxlkNQ19YQR5d+TFKbIE4CTX4TcH+WBwFkGzDRyuXoWzJQilfHceUSMV?=
 =?us-ascii?Q?pYn7KJ1aTipvFoOF+KVOGjRGyM7xp5hyym4zmp7ethjirfHD65CoDV35yXgQ?=
 =?us-ascii?Q?rR3nXRFcC5XjzwseKNSyhXkWdRN2wwkH7cHwh0LoZPxJQP8RB+pjEODh9gDy?=
 =?us-ascii?Q?HP/LsA7nFYGn7xgoaYlOM4QwHmT9YOo+OkUJ3nNob6Tqw9GUgUxDCJu36ca0?=
 =?us-ascii?Q?GFmh749X792chmw5TAtZ327c1ent2o2Bcqrj7xTJ0pm278KtYbgDA3JpsQkw?=
 =?us-ascii?Q?ilwfZRkqfjjgdAZmK6zU/DrxryGR/V7JKpRzGoLFNd2lc8HXjdf59a856LX6?=
 =?us-ascii?Q?xPTfMhgU6HG9VFOSJ+Faz7IQYKKfja4+dN3hNJCUrQgtV4gOnTn27MhoiHNq?=
 =?us-ascii?Q?Wg0fcYc58Qte6hMxN7dObfLvSEpJv9wDzgWasqw3CTpyJPIlaEOndQfUFMNO?=
 =?us-ascii?Q?ptMzzaSnIVzYXk/lsfr9VWNUS24+Ufub7/2K35VS/wjWrLzKU8zU50MZx7QZ?=
 =?us-ascii?Q?fqgTrgEQXHBj87OxarVdVYxVfEgLTIUER5CJDM+9tssBgo1vKNv/OLKtBvS0?=
 =?us-ascii?Q?M1GoMwFe2RYk3gEaBSSfZRwyLI5MKFqYecBal6jcuOGpxurpDPDRbSpEXCzP?=
 =?us-ascii?Q?XezO59OrGoIUbAft4ucaRnlFT0bpldhI0x1r/0Ovv6Sc5rK8Y1bdDtWPVdDe?=
 =?us-ascii?Q?GCqDdaoCjmuq/+RYcMhzDJmAoJOgh2mCnJInZvFp8Br3jxa8Ee7CBcI+Sgp+?=
 =?us-ascii?Q?8A/fm9Rl6T07WHy2tOXa3/S3P9tw73ZH/Ec02J2ODnj7/P1SaLI32/EZ8Wd8?=
 =?us-ascii?Q?B6bIkRrnDHvRswv+MVAa3BotqEfiLoyHSCG2amgdosWt0eUzfG9SzvOCJ4HQ?=
 =?us-ascii?Q?Olos4bn+pLJIm99sCCE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c830764f-1fae-4acc-06dd-08ddf998ce9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 05:28:05.3009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2VM8P55ut55g7W6zsatfMWvm+QAFJWfS6dNR7iXp4gtKuknW4nsixA5Q6BZwPkB+aljI1PL7eBncUewc7dFHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6021
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
> From: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Sent: Thursday, September 18, 2025 2:47 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com=
>
> Subject: [PATCH i-g-t 2/3] tests/kms_vrr: extend lobf test for supported
> connectors
>=20
> Extend lobf test for all connectors that exposes i915_edp_lobf_status deb=
ugfs
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_vrr.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 233143770..820a982d0
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -948,7 +948,7 @@ static bool output_constraint(data_t *data,
> igt_output_t *output, uint32_t flags  {
>  	data->debugfs_fd =3D igt_debugfs_dir(data->drm_fd);
>=20
> -	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS |
> TEST_CMRR | TEST_LINK_OFF)) &&
> +	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS |
> TEST_CMRR)) &&
>  	    output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP) {
>  		igt_info("%s: Connected panel is not eDP.\n",
> igt_output_name(output));
>  		return false;
> @@ -961,6 +961,11 @@ static bool output_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  	}
>=20
>  	if (flags & TEST_LINK_OFF) {
> +		if (igt_has_lobf_debugfs(data->drm_fd, output)) {
> +			igt_info("i915_edp_lobf_status not present for %s\n",
> +				 igt_output_name(output));
> +			return false;
> +		}
New Line needed.=20
>  		if (!psr_sink_support(data->drm_fd,
>  				      data->debugfs_fd, PR_MODE, NULL)) {
>  			igt_info("LOBF not supported\n");
> --
> 2.25.1

