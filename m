Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6479ACFA757
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 09:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B1310E11B;
	Fri, 21 Nov 2025 09:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BlM6r3vV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA4010E11B
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763716885; x=1795252885;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I7j/WF4hzZISTvql3IpotPN/PMUz0R8Tj5DbWrdz5PA=;
 b=BlM6r3vVtu8QdAOY8y1UcV/e7JcJCFzDBYYXYgxuBbLTgwjPfZE2/ZIt
 aqgf3Q7ucudtcZq6kOJLOWLyodnAo66Q3CzKm485zRvEHpoq2NTsdrImh
 f4qglMQYsASfbElvtI8X9gnQbQ7ZeZOtTfjeQxvV9XxWUDvVu24EL1VuY
 DU+FYmCBZKi7zQug/8Uj/xtnzh8iuo7P/FeK+hovDqC4qm9793PnWqJ4C
 7MLvtePlk/WZ8f0cZ7l+7nD5quRyz+RUn//pUnpJw/hldRIB7hTnkTaRC
 5gEnU9ZDVS60lo8+PxtANJn1okBph6P9us7MKZfPMzHasXDKjxNZZEUW9 g==;
X-CSE-ConnectionGUID: GpFfmB+cSMeNZ5tvD2NwkA==
X-CSE-MsgGUID: m78w7gCCSHulR+LWQ+1X6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="88456913"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="88456913"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 01:21:21 -0800
X-CSE-ConnectionGUID: Ca41OJ7AQRGz32JUu/Wz+A==
X-CSE-MsgGUID: 3ONsb9+CR/ulSWfqaoSgSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="196595851"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 01:21:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 01:21:20 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 01:21:20 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 01:21:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQhGps7Zeosej1Sfikg+M77eAVb4QqfXp13wQvApq4IWoFlB31t4JDQPmQywQV5rK06bIR/z/oNq5JLTr2E6kLDIJKFUjyqghGVacNOdGWXfjJpJQDWBPeJE1Y/28FshNhWW0j8SohAVFMmsWuY8PDI1ZgPu/q6oMfWwWvCToQlokz4Z8emcodEaFPxV4ueZRemvzi020Zqp4opqBmx/KCJKBlK2E1xMDOMl/On2p+XURlWwd2wZ4w4DLmnhu/cJvffv+3IZ1LBNZU7aAX51Qz8O4Rxk1qMLQRju5o64+h51Gw1dO9P2Hia8VDgboPjm9q6ggfXD+S6AYcDGlcrGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckNCQjTHQiC6tl8YqO7gEJlrP2I/7Re+GQgknd+OUOc=;
 b=P/c00zxpmmX3/5aAz/plTvVT8PDZfzwIi9IZdLkDBJg3tWTrfe3tupHhLSC1Nc17LPmUGAxCIG8DlkziflYCIjRmVbY+UzL72jGJY3Rtbl5GrycA+XPE0l7MEC2tbKaTeGnn4WpS63sFxfnPW0izmsQTCoaitIzL1Rt7EiT9UEJx26WUtQ3rwmVqTx8wfPu3d+zw1sJqA8RRzz1qW+TH7cLVeF2tAx+tO6mhLc01HzIXFCxEfCOxNBx56Q13cQhytcshqSYrii39ZAmVzRSVBq3UiCJDI+fLYho4xHWpGdFCniBTHy109/wZrCDgVS84DMAiejXnS8fwil47o58aRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM4PR11MB6239.namprd11.prod.outlook.com
 (2603:10b6:8:a7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 09:21:18 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 09:21:17 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 08/12] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v3 08/12] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHcWqlypZpUiH2bu063pfVRxjI1H7T82q4w
Date: Fri, 21 Nov 2025 09:21:17 +0000
Message-ID: <DM3PPF208195D8DDD6420270C397404C660E3D5A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
 <20251121055839.3116906-9-sowmiya.s@intel.com>
In-Reply-To: <20251121055839.3116906-9-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM4PR11MB6239:EE_
x-ms-office365-filtering-correlation-id: 38ae9fb8-f5ab-43fb-da6f-08de28df53a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?p4xzQJAAvFlg1plAxxQ5urXaI4UNUbszKxEksk4zKJe0358vOOIX0SRsuKHX?=
 =?us-ascii?Q?zRbkW2FIdqqlRFx2p9VLaqA9DIGfE5bFHrohOZfdBd5/7FOsTfYEmP+tcE7k?=
 =?us-ascii?Q?yeRPubrfdGPTa01Ufa3K5l36GGPwu7wOqQv4c2yaGI1EDoTAsbllcAoftwn3?=
 =?us-ascii?Q?+26WUq5PVeHHQVf+Jmx0MLz9FdT84+wW4SVejJbom7XMf1oLV3BUKuhh5h5V?=
 =?us-ascii?Q?nQbkXhxYFxcraNddk7PL2Q4W5SD/+ZIpDi1FPC6sr53roMrm0/jAhE2XKU/M?=
 =?us-ascii?Q?mPUVkZCLCjcuWLYyRIEtVLGp8lZz9hRoIQe5xTPkXBT/RlObCdcyLs25pUDA?=
 =?us-ascii?Q?5DRVQUjrBPWGGgKjokNYs70vuAhmx3esLuHADu/xCQcjEyFUMKEIUUfgPcxv?=
 =?us-ascii?Q?OCzv2qtrxI/u3xz3KDETkZ+IKBwljeg+JX2tBLwNXv+SKtE0g5AsK3wUjLlE?=
 =?us-ascii?Q?VkS8ezQoNfBsAsJIyN8uHwh6UkvcxZ2OmytwkOLZoKDs9qqUbcvhF+juCh4J?=
 =?us-ascii?Q?Js4qgFRm/52bNasOBcflcxM5szu1Oql5QxchyVQKnckrtGeD1/QReXfWRLsc?=
 =?us-ascii?Q?bPmTKb9dgWxmDSzYELGfJBKMWwVPiE+MsCl78fy1U91uID2LgONIpmQ6oyZD?=
 =?us-ascii?Q?Mz6DWk5dDaIWRKQfbExq+GHyeLoUN+9efUfbPo4vonH1fe9bXQdFSDd4kqNn?=
 =?us-ascii?Q?uqYubOEzFOBaKGNa+kpw3MPybsAf/I+uH07YSSgvoM5LK9savAJHIYbaEa30?=
 =?us-ascii?Q?c5rUe8jiDeHsEr6CSSJrO7dA2utlCwafKfl3alLpJFSAtHK1RY8geFyGu7b/?=
 =?us-ascii?Q?tbDy3F640sPXwKlgaVsZ6EjT9OHqzUkrjI5WuxBf4s3igrYV5InidoZAHm3B?=
 =?us-ascii?Q?htqhBkTfwhn8iJOdnNkyUkw992jn3QfX+Zp9q/V0w0s9PKJ5SSGv8bdlX9J+?=
 =?us-ascii?Q?Ly+0nRUlWjwuxugc/sBkCoyTjtoDrwqr1lWmRzavPzTj6worYgzGVatxeGuC?=
 =?us-ascii?Q?XnUqIUOL+otwKZgwhpQZPIsq12l4VviROy36XQBcUkPIPAQFEUufj5LRuL3u?=
 =?us-ascii?Q?ZTT+ccj/UKSLWDZBGtGY90REAyhOCrknR+RrhLeLkGH9D6tHmRiBVE22a33p?=
 =?us-ascii?Q?wI02BJvmqabS7gT0NBwgRGkEvCTSyeh/0TRspjm/2p/wQSe2NGeysA0NZy3W?=
 =?us-ascii?Q?VeiJ+mP+mU3Vq/5axlRxv8U44LL/WVlbhUZ9B/vIOGt8pc03qmzPY20jC39/?=
 =?us-ascii?Q?RZe6SvJwt0nTMB1DnBLDPd0do9c2iV9UsEs3LaxDY9HoAArssT1jNREcfHAu?=
 =?us-ascii?Q?qRkUziuCCysj3DMheUkcetqg+TU3VAWf5ZwFwq3GGNZv9cwSF5wVYfNxzPbS?=
 =?us-ascii?Q?XUYbhlMaN2FzXtXxADlt0UIVFMEDjA0T8QgBgOGiGy8V6d/OEuEzzTAbX9HH?=
 =?us-ascii?Q?o3tdLeDwqJWcaL03Ad2KOeq7ZSjdaq1g/ZIBieT3LTjKvwh9AfyjvPpueJg0?=
 =?us-ascii?Q?6oKHN07JpMyRY8gcQv9aHS/ACjcUeLYC9l39?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jUrhPXMH7ws+dnKaIyDfRKiA+9pLKguRLJAtda1/ycI9VrX1P37TbEFca0D8?=
 =?us-ascii?Q?eIdacmpPEFIDzxa4CFaG/kC1SzV6lUuuCvNXuigagBVKQRtfdAq9slv3AJn7?=
 =?us-ascii?Q?8mxFBPP3MdKr8/A0xgLsDoIFhFsaPF7umH7zL54B4gIS+T5dNy1IZcU6UO06?=
 =?us-ascii?Q?5aqQRpeDsbtFP/NZ8XIH2XnxBswqRgWWNZ0KiOXO1Skeu5g9z81O9XSpN+mK?=
 =?us-ascii?Q?Aho/bSGHbEFj4Nz5w6b2iaBrccR66DknW3Mawh0ysXdaoGiEO4UaE2ahSlGw?=
 =?us-ascii?Q?5cpLMjx7MCOapXQSiS3UTLMdQ37K4FjtHs64vIupyncBPHr0G4evihxN0FIm?=
 =?us-ascii?Q?E8d9t5JDg7Y1TWtdBdn9iRwH/zm/vTYYJdlRCGN0KrbgGJocqSusGqeBx89+?=
 =?us-ascii?Q?V2xQpS2fic0H0zWmkug+VNmfnjIUfn2/ByRtum4uz9I1lf1LFyBDG5ldW38u?=
 =?us-ascii?Q?z32LmcAfpZFtIz5SbAjZUP50fzBvlkuOFXsvGiNY5sAcqOcKYavcUaTDflK9?=
 =?us-ascii?Q?xb5daTGFwRGD/UW09BOh2g/gvCiNB5NeFvrN+IVxxSP+AxRBbAuCrCijOh0V?=
 =?us-ascii?Q?YFFBrkpCtxT7fv5URG90ntgoibekzXuE6jXUpZgix+ugX2FBCXAfu//4PjL+?=
 =?us-ascii?Q?hOIP120PL84UvBbofwSskwB+LIUa9ain3y9dUm1jjODed7dkLNjfIaCUm6pn?=
 =?us-ascii?Q?4WTtMivZn+zOSt7CXBctaTWUK57olbAmN7+peLTrBVVElJjGHWU8rBPjX3Vk?=
 =?us-ascii?Q?tdRXUaoqzYXIhZc6AFGZ+XEWYvgZKXEPU2Y0M/0MMSiEoehaFVl1QtLY5rnH?=
 =?us-ascii?Q?S0tr1bUM5EwBebgZhlsZotbGrsXevLIll/i559KmlYF+NhGeqPcEHAFQd/VD?=
 =?us-ascii?Q?iRey77mCB2B/RWBqskhQqQoelS3OL96u7IV+8XaRO4ziE3MOpukoXwRn4x/a?=
 =?us-ascii?Q?ghLk+2ti7gWPXd4bLRFxeZaikQ+kRn9ox74DDV16IeKcX9YKoXTwv3Q+Hc+V?=
 =?us-ascii?Q?0Er8soLDOFpQOqPLWkIh4saatssoeW1DBt+IhtbzZgKzLiFQDa0LXrXID0km?=
 =?us-ascii?Q?eKFFN734kXpWGG/eOGOM0FJ1Cf2OLocguQtMvEjzwa2VctD9orsxKPaWvzoy?=
 =?us-ascii?Q?NQ2hxCffmx93SwehnY0s21St6FaXZOQzbHURGushKiOb7upc5vbuUsQAlzse?=
 =?us-ascii?Q?fOoF0KwIxFpjSx+CzvlYPOIx+ICQWDUu9RXSKT6xmtT6viAfrAXNQkDd0ltP?=
 =?us-ascii?Q?63aXBbxv4il8/BeE2TcZfNLmPHFkPAOVL7vXpT0Vkbmf/cXlKjTn6mXjyX3O?=
 =?us-ascii?Q?GqEHOuC5QTV6YYcEDuoSHSyPNpjAJyz0X/wGVXqU79fLvdUZqxpb4KwVCmaE?=
 =?us-ascii?Q?DAVOpi6H9jWuI79F5jnguRv4AsHIBCUNvpFizPlzWw237wQ9x/vaL38O0vYd?=
 =?us-ascii?Q?fYjsU8dxMGNZu4n+N879sKGeZkNkmELmE36SH1hDxVh7fRIU/hLqA4INZHo9?=
 =?us-ascii?Q?TZnsP9p3NT2733Lo84frjDQlaW2Z98tomuuy/Jvwdyb2z4IM9DC5Go2HOB+e?=
 =?us-ascii?Q?H5/63aOrekJtJpg5fvUgQW01ytO3TWNuVDECXEBP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ae9fb8-f5ab-43fb-da6f-08de28df53a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 09:21:17.8806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oN9auKsEvOmtPh2YjwS50WEorSHtqgthKgzAf+vCo7BTvrE1L7FdhbeOgJDcaxpd7qhxb3ywRTICY31PMwrmpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6239
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

> Subject: [PATCH i-g-t v3 08/12] tests/kms_writeback: Refactor writeback-f=
b-id
> subtest
>=20
> Removed individual tests for each format for the test writeback-fb-id and

*Remove

> introduced dynamic subtest generation based on the formats supported.

*Introduce

> framebuffer creation was now part of the subtest level based on format.

*Framebuffer

> This logic was previously part of the fixture
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 47 ++++++++++++++++---------------------------
>  1 file changed, 17 insertions(+), 30 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> f724cd33f..530915ea1 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -51,9 +51,6 @@
>   * SUBTEST: writeback-check-output
>   * Description: Check writeback output with CRC validation
>   *
> - * SUBTEST: writeback-fb-id-XRGB2101010
> - * Description: Validate WRITEBACK_FB_ID with valid and invalid options
> - *
>   * SUBTEST: writeback-fb-id
>   * Description: Validate WRITEBACK_FB_ID with valid and invalid options
>   *
> @@ -717,37 +714,27 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  	}
>=20
>  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> options");
> -	igt_subtest("writeback-fb-id") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> -	}
> +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> +			uint32_t test_format =3D fourcc[i];
>=20
> -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid and
> invalid options");
> -	igt_subtest("writeback-fb-id-XRGB2101010") {
> -		igt_fb_t output_fb;
> +			if (is_intel_device(display.drm_fd))
> +				if (!strstr(igt_format_str(test_format), "BGR"))
> +					continue;
> +			igt_dynamic_f("writeback-fb-id-%s",
> igt_format_str(test_format)) {
> +				igt_fb_t output_fb;
>=20
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> +				igt_skip_on(data.dump_check ||
> data.list_modes);
> +				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> +					      "DRM_FORMAT_%s is not
> supported\n",
> +					      igt_format_str(test_format));
>=20
> -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> +				create_fbs(&display, &input_fb, &output_fb,
> test_format, &mode);
> +				writeback_fb_id(output, &input_fb,
> &output_fb);
>=20
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +			}
> +		}
>  	}
>=20
>  	igt_describe("Check writeback output with CRC validation");
> --
> 2.43.0

