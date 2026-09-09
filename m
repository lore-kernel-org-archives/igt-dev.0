Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA6AC79FB7
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 16:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94FF10E1E4;
	Wed,  9 Sep 2026 16:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CjrsJn/Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29F310F22E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970931; x=1820506931;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XwRBJay145XY0Mobzd8ns4hodw88uR0doci6ALyVJtI=;
 b=CjrsJn/QSTKXSsqSt3Bpse4fILSb+RbwRCmid21+EHR1I+YDGkD2GAw0
 szuwTz/pP3upHbmPwczQ24fvD+1GEkJYMr9CVYRca/udZ09lsVfQIPyFE
 uQ7lKLbFjSb5Uzylo2J0NG+D2sJwR8Ns23U9hz66qNjIvA5jFSX7h+vcE
 YQSjVVT5h6EeofEGxrxtB2VR5a3G+eYGSwS6en0bM8tPZaE9zPezzxr0O
 kN6gg2CTmrP7iaqGmJ0+XgtxdNAwY63a05dYDBzmffIXo/0mpRKmWVP0M
 5bmxKkf6l9rqzmKwi36nZk6jBHr2ykYhH8EZQa4fsBJFvxXADTljSyhmM w==;
X-CSE-ConnectionGUID: /jJ0j38ZQUCw17oXD9JZ9Q==
X-CSE-MsgGUID: ry7QkXZRS1WuFfFGdAeG7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100000155"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100000155"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:22:11 -0700
X-CSE-ConnectionGUID: Elhejs10TAKhgJZ3agXYSg==
X-CSE-MsgGUID: +UmN/3ddR72vZR1klE4+9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="268783209"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:22:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 09:22:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 09:22:11 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 09:22:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIEYbzSxCQl6XCx1TjOjG1WDPceD6ST8sPucqUDZxmcUGchZoOBT18vzAnkhe8OMoqvwGvFIzPqvO5oT8KRVjq7MB2nOHL9G1PTenfxozrpa+Hho2gWZrm4bV3FFpxpIxPye1cy3xzk0xwjBJdIPZtlbaUGcxpD2F1K0j4mnYHdlvGXZuctvqHg9b5vZv3WsbR7l9q/QXsCPPclQXZJuYno1V6C789k27MTsUwLApGWMj2IkVzIPX5O5C+5Sr8vrtfpqdoIyCgXG2z/uvImbCLeeI0ThsRZY7sbxe4UCrpQ//a5NoSlv/JfRyB9iyYuXy1ySXftDieZLWG/OEO3Njg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XICku63yL4k7jVe+mx9vJt2CZ8BiDQIaFYJdl3S9WS8=;
 b=uY+tsEf9eQqfzcaqyLjYH6IHTgCNBR+R/IWvTAJXYjBycH+wmfaPBnMukEwkw+lIhAFtRvd6bRhQdx6uHHbSe15u5ydK6CVuWYPcHqloYfjcaYbQiZwvdQqoCDC5t7wI52G3Snflf2VXOKp1U033h7AyI9RnWNOwDcaDGyVFIejzAAm35MlMNXvd7Ohszgoo2s+2Sx0iindS/zxgWpipzbZrxsY4Suk57ZbKwmjZANaHKn9ApTGZurFbHg4bChIDOZooIDyt48RkK6IFdJDBb/7hfR9YwtfK/OCg0j59wJSB/eeCJlzTgE5vsBNeiiZ+ooTTHkvRMqVX5MPsa8IqsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 16:22:08 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 16:22:08 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v6 2/3] lib/igt_kms: Add helper to return vblank
 timestamp and sequence
Thread-Topic: [PATCH i-g-t v6 2/3] lib/igt_kms: Add helper to return vblank
 timestamp and sequence
Thread-Index: AQHdPvEkxYXsX5ght0G0pApe99Y+CbbGcHkw
Date: Wed, 9 Sep 2026 16:22:08 +0000
Message-ID: <IA1PR11MB63484E2FF30AE26F41DD6631B2B02@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260907174836.3159214-1-ramanaidu.naladala@intel.com>
 <20260907174836.3159214-3-ramanaidu.naladala@intel.com>
In-Reply-To: <20260907174836.3159214-3-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|DM4PR11MB5309:EE_
x-ms-office365-filtering-correlation-id: 96cbcd0d-afed-484d-079e-08df0e8e7e9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|38070700021|10067099003|11063799006|5023799004|4143699003|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: aF2WuBx8rh38fyiQG1JVnwY/DE8hDkcciCrwQhSEHfK4tCcd2KBBD9yWAxUGUaah5wne4qq2IblTeA2j+Q/ByGukpmJvq/MKyVo3G4CPcVYAqw55HYgHxkj0DfON2e34unOSYjVY2ydRrPFnPLAbeKVngmAY6weic2U+2bs51k2jCNIYs4mFkSRGFp6Nx426DkXYBjLcAJ1VjXRXrzrSKGW8MVZkBd8y3SJVdVtGzCDzQh/5OJ1Q3Glvbq18Pc0GweXMKHkTzQtQ2m72/zSC7qAKhP2ANPTlFUcRPj8M18UQM4XV0EGuyh0Rk6S6VUOexOTIS0zPc+XV9Dah3Sz1o88KKHFmew/xH9DYFICV/zPG6ADYklTg1jD0gGAIWJQ/upEZZbXgpsvgi5ohfKtmysqVz3W9iRiS4CBcxyve9fvcYupafQG6zS4ERZTJFt6GhjT+iqnsGyMvHmEFI9ZTWbdswxeRINF3g7i3XwvYQLALZGVSkuvQf4kh2M58nsaRvZwKSU5LSFBwiwY2GM0a/9ffNAC2UhoafNQf51vf9fUC+Ni2Y7MYGroZJ/S0JX5LQ91Il71jQfAepmKjS1CZM6E+gD92tfjWOzwFVyPdumjY9XJn9KWNe/VJxMD83vFQwsODtKeTYlah8Ewg6nB4zxg/fuWDScBISmr7xJ2qZhrYm7/sfxf8ETTqvmNrlW2DUNDAKFD2gTyXP3u71WXhoKXuSw9LxZynbtETWaTAEOY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5ST7QqFyrOAjpAHPfry7BS4228qK2KS0oU8MKfNiK+1g2mgAXzScFVBBwjNR?=
 =?us-ascii?Q?L9N4JriIj67r0Z4JSAO/3NtrZzhUrfKaGuIdxsn9p5xQR4jMlPVxKqQJNy9k?=
 =?us-ascii?Q?MJ9/CDV9p/OmW+DbMKZzR6kEzDeR7Wi49RZ0nyqEwLPQjTZlDq75DJHGqQwp?=
 =?us-ascii?Q?cRt1URRKWI66nQP29LA5SHkTQn5DjkfSdKo57Ly4mPed6YMbj8yxMab4drcx?=
 =?us-ascii?Q?wWEXvA+pNiPwyokdIr/xheOBkcaCcz88mjjBNdvo+DbetNhpjVN2ixEOtjTS?=
 =?us-ascii?Q?qVA0pxZJ/Mjp58a5AtUfmHcn8qpfJBVSgUZ4Z/wIBvYeADcdjJhIzmf8VRUh?=
 =?us-ascii?Q?2Hp6w1QmBE7ZfEOhcBD6xQ6pxJzq1n2ESxQopiezgpCFzyFDWPDkWNXzAXQF?=
 =?us-ascii?Q?NlYgTkmAq9j5tpECkgwLjIPo38IMDwmjNd5bqiKOzm+HT4EvILYc7oIyzAZv?=
 =?us-ascii?Q?KpROpDdV27myi221CnPg61QLn1L+08QLvlbL0yTqJao5NllROIrcvetCQpxH?=
 =?us-ascii?Q?4629uryTOE9KsoeCl+bky50x0KiMP5fsll/XH7owx/+lAvmsPsMo3J3XBUM9?=
 =?us-ascii?Q?yrFYvxHs1l53vrtlmoaFcrxQlpIg4eo8ffk/mvFJxomAwCB0lFjaJZ68zpxg?=
 =?us-ascii?Q?CpH6fCXzKBEGnusf3ENTO2icuxNj2RHakJVUOuNvlC74Y5McUXoKT1ih7CoE?=
 =?us-ascii?Q?7s2BuX7R6qIBFdpn3ZksdYRJ0laLV62DajSZgK7ngFhtvfPxEuMBFTxXf/1I?=
 =?us-ascii?Q?nkH7IcnRKWxnwRSQrj87vFgaoIDGcUyQrz6Mr2BhnwLBBGx4I1hiV8mhhjKi?=
 =?us-ascii?Q?WPpzbsOwl7v5HYZhSo5lDZIoBW4VZ79oI7/U5WSxd9bPHBd2XksnFuMaVr+2?=
 =?us-ascii?Q?q7ok93YwSE0C4XpWRZi/+MA/D6Obul5MP5gtIKQz/v+kujmIJW2+SEmHITAS?=
 =?us-ascii?Q?3QCufeu/YoPW+X/ZG2d17yCZt3XTNlJL2Hp7S+lJ6SOUXV/qRrfWrVNVBFIe?=
 =?us-ascii?Q?qg2mScyl4b/XXxpX5lkhed2cdMpza+jCGedTzM4uBoLEi6W8RYUqCaJ6aUoo?=
 =?us-ascii?Q?prIeeM2L6/BGVwH2ow2WaCwcHGEGnGz2GdWMB8eCmV55MxDWI1s27hexBn6m?=
 =?us-ascii?Q?k8wIYglHS213F87PnJUzNyWN+/S8g3qCkkGzkQC0cDwi+raAJ59AY/CFOU5k?=
 =?us-ascii?Q?maIdtelzGgHUvmPwuvsZ19btk1PhIg3ZxxlD+ePGLMFdtTBgi0UDqI08qU33?=
 =?us-ascii?Q?kwZNf6KkLeDjzOcIF96vqKAo5BKH17BuOEES6bDJ/0zdqrd23jGX/rh6CKpq?=
 =?us-ascii?Q?eziP2DEAtBc12kBM1T97QjdV7EmQDsflTLbsc7a2RPN1FZbT82JK2WLAop9n?=
 =?us-ascii?Q?hEiDCSDT9ZFX07IDJMB/VsLWMVSCmdrC6M4xCJp5W/rSNQKVVCSUtAVRibZS?=
 =?us-ascii?Q?/zeVySR9rgXRSHVInAShgNPK2VHQ1ZpNoQtuXRRP4+cLTnEQq1r+lbybIsZK?=
 =?us-ascii?Q?feZVTYRP11ffwMdYApMd/7kykai6BnntFh8VHWhZUT4XUHdcIZ0NF2qGrUju?=
 =?us-ascii?Q?jFwyR6cclmeu5Q6Y7gtLhvpVyro3eks2R8JNiKLYZ+6/o5SZt4VpLNB22/SW?=
 =?us-ascii?Q?VSU48yVGJ4cmvvBTXZacl+M8RiEAuUoWTGq/ACmyLd9IkJYbwUHmnECW5luX?=
 =?us-ascii?Q?GV+5NPdZi5x/7ZbpDIDpTEAVfeuYiN2BzQuNWjSqidkmg/X2cEQ5zZCILIG9?=
 =?us-ascii?Q?4yA1o/Pcg5hQNro2kBb4WLbnIBCKuiMVpCkTQFF+WxwrqJUJtMxF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: yr0HWXpiEd9aQTlI6h1hje6jInvq3jOzt/oiMqNkfPrEyQP8tvk/JwYYW/PNmXlGoRNpugFxo7qvxX3wrqymRJu5o9qlC3qBCpaG8mP9ndRpZ++wpU3b42v1gr+IAknBv4XgbAGVqDLM0LOmMZNGp3/eFEbZ51WIdJGKCSpO+VulSMx8Dw49+KUwQlSDYQIfSHdUjucAsDPg+uhcGJID/C2aQUr9zwxV3ru9nD+aiF9FAMgjL4Xt6WxHB6Ar/yA57IqiFnV+pptGSXEGgYvo2F6KajtD5sHuRUOqgJxbAQ4cL5muUDCV+CdL0y7oK1p3PVf8iu9uU6eVJvGWJY3eqg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cbcd0d-afed-484d-079e-08df0e8e7e9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 16:22:08.1618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GsBSAVqdR0hX/18r4kfxoREL11gd0OYmJKwebSgR1sFCDqSUFoKxQUvev4NYymDO1CjLaVO0IQK+o3zNbySXNAr3S/MfL73yBBIQ03lEsxDtRznmaw75fjeBtzJyGgOn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5309
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: 07 September 2026 23:19
> To: igt-dev@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v6 2/3] lib/igt_kms: Add helper to return vblank
> timestamp and sequence
>=20
> Add a utility that waits for the next vertical blanking interval on a spe=
cified
> CRTC and returns the timestamp and sequence number reported by the
> kernel for that event.
>=20
> Several tests need access not only to vblank synchronization but also to =
the
> exact timing information associated with the completed vblank.
> Having a common helper avoids repeating the same wait and timestamp
> extraction.
>=20
> v1: Address below review comments:
>     - Extend __igt_vblank_wait() to return timestamp and
>       sequence. (Jani)
>     - Adjust vblank helper prototype ordering. (Chaitanya)
>=20
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  lib/igt_kms.c | 37 +++++++++++++++++++++++++++++++++----
>  lib/igt_kms.h |  1 +
>  2 files changed, 34 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 2d78e3bee..6784210f9 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5850,10 +5850,12 @@ void igt_output_set_writeback_fb(igt_output_t
> *output, struct igt_fb *fb)
>  					  (ptrdiff_t)&output-
> >writeback_out_fence_fd);
>  }
>=20
> -static int __igt_vblank_wait(int drm_fd, int crtc_index, int count)
> +static int __igt_vblank_wait(int drm_fd, int crtc_index, int count,
> +			     uint64_t *ts_ns, unsigned int *seq)
>  {
>  	drmVBlank wait_vbl;
>  	uint32_t pipe_id_flag;
> +	int ret;
>=20
>  	memset(&wait_vbl, 0, sizeof(wait_vbl));
>  	pipe_id_flag =3D kmstest_get_vbl_flag(crtc_index); @@ -5861,7
> +5863,17 @@ static int __igt_vblank_wait(int drm_fd, int crtc_index, int =
count)
>  	wait_vbl.request.type =3D DRM_VBLANK_RELATIVE | pipe_id_flag;
>  	wait_vbl.request.sequence =3D count;
>=20
> -	return drmWaitVBlank(drm_fd, &wait_vbl);
> +	ret =3D drmWaitVBlank(drm_fd, &wait_vbl);
> +	if (ret)
> +		return ret;
> +
> +	if (ts_ns)
> +		*ts_ns =3D wait_vbl.reply.tval_sec * NSEC_PER_SEC +
> +			 wait_vbl.reply.tval_usec * NSEC_PER_USEC;
> +	if (seq)
> +		*seq =3D wait_vbl.reply.sequence;
> +
> +	return 0;
>  }
>=20
>  /**
> @@ -5874,7 +5886,23 @@ static int __igt_vblank_wait(int drm_fd, int
> crtc_index, int count)
>   */
>  void igt_wait_for_vblank_count(igt_crtc_t *crtc, int count)  {
> -	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index,
> count) =3D=3D 0);
> +	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index,
> +				     count, NULL, NULL) =3D=3D 0);
> +}
> +
> +/**
> + * igt_wait_for_vblank_ts_seq:
> + * @crtc: the CRTC
> + * @ts_ns: returns the vblank timestamp in nanoseconds, may be NULL
> + * @seq: returns the vblank sequence number, may be NULL
> + *
> + * Waits for the next vertical blank interval on @crtc and hands back
> +the
> + * timestamp and the sequence number reported by the kernel for that
> event.
> + */
> +void igt_wait_for_vblank_ts_seq(igt_crtc_t *crtc, uint64_t *ts_ns,
> +unsigned int *seq) {
> +	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index,
> +				     1, ts_ns, seq) =3D=3D 0);
>  }
>=20
>  /**
> @@ -5888,7 +5916,8 @@ void igt_wait_for_vblank_count(igt_crtc_t *crtc, in=
t
> count)
>   */
>  void igt_wait_for_vblank(igt_crtc_t *crtc)  {
> -	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index,
> 1) =3D=3D 0);
> +	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index,
> +				     1, NULL, NULL) =3D=3D 0);
>  }
>=20
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 27f8877a9..c5fc44f5b 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -654,6 +654,7 @@ const char *igt_plane_rotation_name(igt_rotation_t
> rotation);
>=20
>  void igt_wait_for_vblank(igt_crtc_t *crtc);  void
> igt_wait_for_vblank_count(igt_crtc_t *crtc, int count);
> +void igt_wait_for_vblank_ts_seq(igt_crtc_t *crtc, uint64_t *ts_ns,
> +unsigned int *seq);

Changes LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>
>=20
>  /**
>   * igt_output_is_connected:
> --
> 2.43.0

