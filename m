Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81228606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 04:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lr/zYVnz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B22710E2FA;
	Wed,  4 Nov 2026 04:59:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093E510E2FA
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 04:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793768294; x=1825304294;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qs6DqvayMlXP2gvVgrGDFrhh3VerEtQa1wXrK5M0nDY=;
 b=lr/zYVnzoo/cLUs+hUrrqZzmIRXk5FNE3qS/HNc3+a0aksUnnIb8aVQj
 7fvZDwud5VS1Wi05XEnDbk5qd7Mz6UWqxu9/jSe1cMYvJe55nQeSfNNjE
 z5nGzWUIOySjpF5QkpZXxMfGOouZyxKmMSRF80NgmCr5gRQ6v9y5dm1QC
 Ff4KpUnJI9aMNiRdTWMYeMjlyGStkKU/AJq05N38ngPdtL1Ik/hOWqvtR
 /MBLE1kr1zL0ofBmcG71CwxDXREkseL0dKjXM2a9pztJQdXDi1ORbRsCa
 IIdNXh8t0h1kdek3SYT9dF0QvjOZ9kyuQBtOfls9qvFM2T5Im57W6S2KC g==;
X-CSE-ConnectionGUID: FmNyv05AR5yCBOTW0gGI3Q==
X-CSE-MsgGUID: Gi6+hS1zTfu7s/BR7Nb1rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2386253"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2386253"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 20:58:14 -0800
X-CSE-ConnectionGUID: uuzaJX1RQ1G0XkIMrokSXg==
X-CSE-MsgGUID: JJ4r8AqFTp2vJNM9gylYUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6758444"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 20:58:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 20:58:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 20:58:13 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 20:58:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdetROHkGotml+l4ICHX+V0vIG71XPf7qpCsXclHa12ngb74UjeqgmJTQegdLLCLi3na+lNcxAQCKbgAGWxBU+aII+rWxnd6IKDMSMeXRHmiKcPZK3gLo4VRhKGE59BuPAU4r3lvE+8pADRbliNhJCwQbQ4TCCoPLSxfGhVYl053e2okbAku8pz9hP35majZeUza+vtrPN9BYn91qhLAvDknsXZWKFtbvlEx7DPYdLJ0/vBN89c33D4PAZpqBkrsjfUHaJ1GbIiQRrv2lE4++ky5ea5K+1AyI18BfWbv/17KUU9nDeNetGV7U8rbb95iBocNcmU3JSGHh3HPlI39UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KdFkC6dMH0Igi9bs9fncplWBdZZMQ9r9KRdQpLokZU=;
 b=iowwPtoYsmEyVnTn2ur1nmj9lBAnYOkTZFvvwct32/xcptftdVmeMIpF6VoV+xpz1H4rfZ3o9ij/ut0dMoGCTcY2X8gZDZZ/FGAPpDpFiAB6W8nmxGVBOEabn6eOzUxFsiVTb5AZ/UOx0HYlKH1Aozz+KG20cqpu7sPGHvFaQW+gFiJhHtx1ttOuz9KlXdrSi8ptKz+JCfLbhYITOg7GFNI0WBlZ3FSJg5qMAx4+iznLDoEZ+Dc4PRwRxa7ctA6SviN9PuZZYesuqyuZmY5XzpF/9OINSsecc67FzBIxVhnq3FknyD8iCc/5NGBLNEjVRchCR5/41lL5cZDusSkolw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3293.namprd11.prod.outlook.com (2603:10b6:805:be::11)
 by DS6PR11MB361022.namprd11.prod.outlook.com (2603:10b6:8:465::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 04:58:11 +0000
Received: from SN6PR11MB3293.namprd11.prod.outlook.com
 ([fe80::6eaf:49d7:7bb1:2793]) by SN6PR11MB3293.namprd11.prod.outlook.com
 ([fe80::6eaf:49d7:7bb1:2793%4]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 04:58:11 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "S, Sowmiya"
 <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_force_connector_basic: Add skip reason
 for missing VGA/HDMI connector
Thread-Topic: [PATCH i-g-t v2] tests/kms_force_connector_basic: Add skip
 reason for missing VGA/HDMI connector
Thread-Index: AQHdbA/M/s26tXu/VU6Zi7H7chQCJrcdWdqA
Date: Wed, 4 Nov 2026 04:58:11 +0000
Message-ID: <SN6PR11MB3293ECF1BB7048AB6201A93B90682@SN6PR11MB3293.namprd11.prod.outlook.com>
References: <20261104035001.1225023-1-sowmiya.s@intel.com>
In-Reply-To: <20261104035001.1225023-1-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB3293:EE_|DS6PR11MB361022:EE_
x-ms-office365-filtering-correlation-id: 18a2e06d-acc3-4960-512d-08df3a3039be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|38070700021|261009223027099003|261021123027099003|11063799006|261022105027099003|56012099006|261028144727099003|261021121427099003|261026140227099003|261102123227099003|10067099003|3023799007|18002099003|22082099003;
x-microsoft-antispam-message-info: bM8YNSOgaE5eIM9P13P4tacj40SvjVKxleUDaNaNebs1V2UWnJSOiayd8dNWSnwyaiNOoOc7HaNNpQOUpV7bX2GeV9jBivllkIfF/YtFFSMKjmGerdZ2W1OJ2ShtTLU+7jYM8fkJ0qpdRKQyNS6OW/RIT8J2c9dDUcKWKPkuxsgbzrshJijMMLqHdgG/9BbDsfD+XeLrF90xkxNYEnoJH32vAFblKNUXWPuOrFfS6peLRKOW05OdEHyuFLUJVP4W22/DCH3Dghw9ACMXxdy48CNI+waCmBKvyUGW5I1jOUQ1vN8tpcbcQYPB7TFgv3orInDJuywFxNliwhZR0iwrHT6PLNwqnZqRarOUazd0syYN4U3916gVv8BaXrsolmDoJzxOs+ENfnmuScEf0X4uguizIjUL8G9lO75kUsbGWJjLa0ExjzP/6FSeMwTXqYn5N1/UV0RL2peV3bOoAo0bl+QN6l4T7UtBpRGvcu4idw5320P2ZYKZmScydDzs4QNz4vuIyeze5qQZqYLKDE3N33mBQcO4SRsKorM280xZVuL0okDj3JmjsW7Y+PtVt70ksxxXlknjGrAPFUk7BB7b3LerRBZi7vun74zAKmEJWcMHdkpodO9ZmsjFFayoNEGIdn5wO0dS5ARGF5jZG4XO+t6vzJUJLgmBFHCgzeuKjiwq8p80pHp7ZOXIxe4QrOj2r3E0PNHRKPuav5z2SS6CwIJ/+jKT8SDPIdPaI3ARpl0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(261009223027099003)(261021123027099003)(11063799006)(261022105027099003)(56012099006)(261028144727099003)(261021121427099003)(261026140227099003)(261102123227099003)(10067099003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?20f47FE2Bg9PZDIiEORTGKp1zl4+pJGWM56Ka+b9eyY3N1TZkYcILxlpKSvJ?=
 =?us-ascii?Q?SPNYkkxkKF75EWjrQPRjZBTw81qOhlF+IIy97/xv686HYI6m+MtyYIQ/W5ar?=
 =?us-ascii?Q?Rlmw3Y4UFFZgjdR3tSGqP2BVdHHev6ziglWbXJwrpsG8zo3O8rOf/wa241Y/?=
 =?us-ascii?Q?jNFqKy+tqE6GV7uJPLQo0KNeXFN1OPU8llbQ5cqDE1K7v9T/3YZKfe+gqXua?=
 =?us-ascii?Q?Yxp+3g9Ht2cq5NfBPP6kqyEznVCnvG6lyNszJyEVtcYjW7l8sAn8ecZ4vkm7?=
 =?us-ascii?Q?G8l/X2areLdZMic95pCRdN1xl/L9Z7pYNFROlPr/yjj/iJ9Fw7Y8KAgT2/0c?=
 =?us-ascii?Q?Xr3HHmi7VM9DnGUQbY7QKjSZmkFgtH/aU3Zf9r+f0MJD/hySRkfwlShRbsg0?=
 =?us-ascii?Q?bTLGQx3BAz+Zn4GcLQZWmUD8hhKPXcByq3uysuHgC6SvMEOGM0j+HeMYCysY?=
 =?us-ascii?Q?WMABd5srJ0uEfZjieSywqRJ0lozdxmkAl16vyd1uYuogqn5BvG5JYXPHXumI?=
 =?us-ascii?Q?yzlAFh4+Wq+YOpj8l+y04gmsU+omwmFY6AUAEWCd9JKBshNxtDIBDeKcB8HZ?=
 =?us-ascii?Q?ePNOPi8Dj4IHFD8CVLyCOUKOBOukGgrwNM6tfnvCcxvIeV+kIyc4te6cjhoP?=
 =?us-ascii?Q?k4FVZBodfiNhHVBrv4Jxrcu7H7biO877QtyjJtVhvdvu+UTNvGrHgZNv109I?=
 =?us-ascii?Q?VC2X1xesHnDObLsY49Sq4GXGeX2JlvKEqYmsKP1c7X0i9AlzwLfqU5shnzRj?=
 =?us-ascii?Q?0kbzXlOdGFGuAXd+4Cor5RvJHT4DoscA1/VTdWM2SKHs5dI094SfbpiaNGtE?=
 =?us-ascii?Q?0u5FlgIAWFruHxLTTl1GUwGheXC3Iq1GC43PKsSATpK1hd5JY/IXO+/6QZlr?=
 =?us-ascii?Q?3MMQMjJAMHcCB/V11k6CClhLSnfVJQA+fnYYyy1TISafItcSn8amELIVSEBV?=
 =?us-ascii?Q?IWKiss3uSnd4vthgK6wz8QCrx/ZTC3345WCU2OZWhTZISFggXWiZi/0AkxpC?=
 =?us-ascii?Q?SQsHEV5ATuNMcv/SFTKgIlXReIHCU+JfhAx4T8CS2RTokpZgV6PcqHylSI17?=
 =?us-ascii?Q?qwKB9ntVmdVF1D0RPW+LV0U7N7mvz0iGtPyHb/TT3O3qXgjfFSDG430QrLdR?=
 =?us-ascii?Q?ojvbkl059LD0lJsdg5xDv6cwxhgKkTjNQ4Yx19710v5iZYFvu5zTXbVhQNgt?=
 =?us-ascii?Q?GlwsL1tNWdc3SyGeD88nJK0vXHbIw44OKyugqXSTp7T6j9yrb86hS2sjbfNR?=
 =?us-ascii?Q?lnJHvzVo+q/UUfR7Bv0QGaUl/jCs8UnavnbUfmPG0Mz5AhnCneSVfzbMl/+W?=
 =?us-ascii?Q?kPB1wAEEoRIRVuCHIWLoxgCEmoXRMqGHHjFvdP8n086VGgHSKuOEdnfXkEgN?=
 =?us-ascii?Q?FIAo6sNQrMXy84yzhHoxPaB0+Tb/2s453iJPOz+kCmER/xYXmk7Ty/5lm4df?=
 =?us-ascii?Q?A7yNrZJTUYu2YWvV952zur3MUTM8kPHm5B5TEijs+WNB8o1zDU1gX2ayMQAI?=
 =?us-ascii?Q?kOYscxYRZ7SbjMSaxRm5Ot9A1PVoPyHtvdc98vmHPi8HoN0fDPtRxIpGpNWj?=
 =?us-ascii?Q?as8hn4EgWH6ibct1TYmDv2iKDy7FmnW0qMD1OrvkFYDbFAdsqdF3Bdnv0To3?=
 =?us-ascii?Q?UGGMXeLbrZUNy2+SyeW0B4nJPHWRuZBtgpHDShba1QC3M6nz/wN6k4bYH57a?=
 =?us-ascii?Q?F4I2UBbyXW46mXN79m9ERePrAim9YVSDoQTUlJZWEvOwKmZc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KeYEqzuSu+1FS2KHTOPLJB6hOl4dTH1Pkpy3XHuY65pRkX8Ul3t3TudMmEtS05TMce9Thdy0eotYnU7XZg+MOKCA8ZxIuTUdswLxm769uwqW258XZGozN9rErS8TX+VA+CPqAg7G3A/ygR1es8Plm4UJqRv7tXH+14BhLjMpcYy7ociO7OrdiDAoF1kgZkryH/jLK6FKeO3H6kVImqhK1ksWBGhK7iyzOfCTirW/wSXFEVoNCwuqi5Shi4diQRNPm5pamEU9O1qXEoEXKhJ8TmaZroLDs5wyS6xmvn69ph5QIu+bQpMcYEjvTMgJGjhVOiG6vqAA5/fP/5b0sxt7Zw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a2e06d-acc3-4960-512d-08df3a3039be
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 04:58:11.0691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tyu7BEiIX6Z+2kpoWMmO7sbs49Uh5AFuSyx3aNWWd/lk5sExjFfvxs4zWjybb2L2CwzC9bmsPbYg03Z5XTysdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB361022
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

Patch LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sowmiy=
a
> S
> Sent: Wednesday, November 4, 2026 9:20 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; S, Sowmiya
> <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_force_connector_basic: Add skip reaso=
n
> for missing VGA/HDMI connector
>=20
> igt_require(connector_id) only printed the bare variable name on skip, gi=
ving
> no indication of why the test was skipped. Use igt_require_f() to state t=
hat no
> VGA or HDMI connector was found for better test diagnostics.
>=20
> v2: Improved message (Kamil)
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_force_connector_basic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_force_connector_basic.c
> b/tests/kms_force_connector_basic.c
> index c4252ea02..dac507da9 100644
> --- a/tests/kms_force_connector_basic.c
> +++ b/tests/kms_force_connector_basic.c
> @@ -392,7 +392,7 @@ int igt_main_args("", long_opts, help_str,
> opt_handler, NULL)
>  			drmModeFreeConnector(connector);
>  		}
>=20
> -		igt_require(connector_id);
> +		igt_require_f(connector_id, "no VGA nor HDMI connector
> found\n");
>=20
>  end:
>  		/* Reacquire status after clearing any previous overrides. */
> --
> 2.43.0

