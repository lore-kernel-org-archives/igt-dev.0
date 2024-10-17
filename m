Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBEBD2125F
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 08:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3E610E1D8;
	Thu, 17 Oct 2024 08:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7ym0idt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0B610E1D8
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 08:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729155195; x=1760691195;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E+ct3+FihJ2P/exnFyMY1JqvPSobd/ii28wKrG+FUiA=;
 b=A7ym0idtHSxy6aFwiPY+rJTSku2v+PUXvxeK3PAmGfowSLu5Av4pHIZm
 ujIS7eyJ45x9H6MCyQcOywMeKId8xDGCMFmwObtfqz3YBy3rNKUTSXooy
 di8EYrtxzIuExBzPtLj5aQO/arKpaoShD6KNRm8zlYutkHK7dO2i5vr1T
 4Ey9HRyXro6enCSQS24SVZF22uKRArEupAl/QjiV4zZxEdJT+ovFAwJdI
 cL/UnoJlRRNs+Ak+2fWPVDRdPYC3nLFEhugpm89/QxSndMsKh0g0I9iWr
 UcU91r3WR1vVBYsbtLgTvjp9ZEaIn+pH4ErFOzBazJznTVnJqR2O7ODZJ Q==;
X-CSE-ConnectionGUID: I+ZDE/V1Q+OlHSTw7GooJA==
X-CSE-MsgGUID: 80xd8pUfRyy1n/ohcIX2Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28514706"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="28514706"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 01:53:15 -0700
X-CSE-ConnectionGUID: YmRdPXdNS7S3vbhl4JStTw==
X-CSE-MsgGUID: uehFrunyRg6Yg/dAl+eybA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="83262337"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 01:53:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 01:53:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 01:53:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 01:53:13 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 01:53:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9oWYnCbP06VIxU+Y5G4gQb19yF2eo9ZhvTXK4zKAR6TKOyitwTJ0W+YeMQ2YbBqr+0qT7x433Ljc+Zi/fE4sArUAetpv1XurH+Qem5r+5FhH2qFK0YyxGTpnbXUr/ms7mp85w4FEnrbkHqUdnr+vUNgY3XEq8p/fJkA8D6qSHXFQcjYiuKevSGyGAy5wwsQPJrKXNfWgDX1raTz/omLIodL8bh1a+seKBly9utUQYTiNSuX9be01JeiXg3H6dqYqKyaNYFTvPv+VEux3fFsq8UT9sJOw7w9V0BvruoloMfxyTLbZowBqNVccHzid6HmoejzunEttfZDX+bdEGhyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySIZ4U3eRZN82ILycpvsv26aNT2cQstwCqevUWFiJ1Y=;
 b=ZCUF2QJ4LqrfN0kHPbvIg+wyL6S5KZZj3zRKY7miqQf43krO/WOhQCYZm3uFu7+RQEFKfrAYndER8+FXs7dqEBZbw1SzoSq/aFRZM2gFTwxa8h47QNOBfRY2Q6d4KRfRW4B1faJ5inGU9CASR8FerE/0Br2JOb/OxzFLCANRip1md6qBBhh1qH/e4lns5aECDa8qIcbI+NVotynuXb9aaLFmmZhjs439E7YHPxk3GE3BKTBJKv+Z3QGJKtPP10UBKvVuA3CmPQoy1ChgOPy78D1SfQwx185w2V+Xd0/WrUORPGMxT5GoHLuqhWKorUczIp/r2khlRRL+dmcsMzStEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by SA1PR11MB6992.namprd11.prod.outlook.com (2603:10b6:806:2b6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Thu, 17 Oct
 2024 08:53:11 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%5]) with mapi id 15.20.8069.019; Thu, 17 Oct 2024
 08:53:10 +0000
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/kms_flip.c: Updating the skip message
Thread-Topic: [PATCH i-g-t 1/2] tests/kms_flip.c: Updating the skip message
Thread-Index: AQHbHyZJkCSd4r3aMUOdXO5MiTqeHLKKo+FQ
Date: Thu, 17 Oct 2024 08:53:10 +0000
Message-ID: <DM6PR11MB47381028FF735E2C01C5B8FE83472@DM6PR11MB4738.namprd11.prod.outlook.com>
References: <20241015171849.1733664-1-pranay.samala@intel.com>
In-Reply-To: <20241015171849.1733664-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4738:EE_|SA1PR11MB6992:EE_
x-ms-office365-filtering-correlation-id: 30200635-81c3-4cc5-7217-08dcee8920c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?MizvdMpCf53YsD+HylagY2WQKP3BzSWRmdkDcRwJoy3vhifmZ0QZzT/wwJaV?=
 =?us-ascii?Q?XxAvcZfygqLVr1jvwlRijmrMssMeNAJ1kuMOcs+ZcCJTo/cWRn1iGaKh6HzV?=
 =?us-ascii?Q?cZwNq5i1aCWYoRrk1MFYIk8e3c0ayeZdu6FvSostuoWcXhYlrJsAuwVkls2Y?=
 =?us-ascii?Q?xFqj/P9eOMoxk3gh5wQg2kng4p4eSccKS9R5rbmJMZE7cunA7/f7S1eZpIty?=
 =?us-ascii?Q?iKwr6ALs2qjieVx5mX1Htnn+LU0lBS+7RUT9iIU2q9PaXH8rB7T1QcXrszw8?=
 =?us-ascii?Q?M/FvWm/Jdppfs7z2ag0WaMLvP8qMMx9iKz9YfrpeuuXu549dLjEXgYX3Mk/B?=
 =?us-ascii?Q?g/AFdjmDB8C1TADpOnXNaFqAw39gMACZbfGXbxlixae87gH3quapu91eyXok?=
 =?us-ascii?Q?JpsdudZxc96h4uIy2CzsKoCkPQ1tZCfSEsxTCtHx2Wm9gHVWEe46qPZIsPTT?=
 =?us-ascii?Q?OArpq067rz7UcGr92KbyHTDrbQWcFcGOJ7yprpXtGB4fHIltDcrEWQBe4oHi?=
 =?us-ascii?Q?yOhHTqcoBwuRHcJQ3rcxs0Y9fgGuT1pCDEp7dV5WJffjSpB9RFUhO5PJlFC6?=
 =?us-ascii?Q?tNKBFjZQ38wdqzhsZ9vfbrQvDyjXmFKDi6qDtwfl8CZwt//MvD36wCFuAdt+?=
 =?us-ascii?Q?IIKldo/LjWHCGVl6dCBE+cS7iIUZ//qdutuXBjxYT6oerkvnZz4JY19OlW4m?=
 =?us-ascii?Q?WxTYeQV9GDmGUbgp/2jWcRdlRKbvomJ8AyCYkcs9CwYPHFh70Vb7WmX2lE0P?=
 =?us-ascii?Q?iBOY2LYGolUy4magMH6448MvGHjREetuIR8/WXtw3ymSEGtmwpv2mwGXqiGc?=
 =?us-ascii?Q?JAzYFu7NOzrhZ+WpWyKYjnnk+zYFkVIAtYjiW18im9CcnL0O4xUNBp0J5x5X?=
 =?us-ascii?Q?bTCt2alAGUgcjsyoDkhlAfcISYryIy0csMZ1dSmNe7lg/NA+FD8vDg3BNIKA?=
 =?us-ascii?Q?eOTFnw4kzGIz2xbS7o6Yf5EUH75a3bfad2TWqyr6sFtSGcBCOvVZ3SJ9g6vD?=
 =?us-ascii?Q?PPc0pYDqgE3FI1/CEFPNoV4BvC5ZQy07T/ERceHJDaPfNhMY8ftdg+0x96gV?=
 =?us-ascii?Q?lSIy7QcRYWIaXreg0Dhq5m6GIyuCUVPXmDql15gbcBRM3tHUIMZXe8J3Xcbm?=
 =?us-ascii?Q?S/XHoPXpyX/7wB7Tq4wQpPnEUFhmCAd7OEJQAdpGcE9v4sSURsrvnPiI8410?=
 =?us-ascii?Q?hKOkO3JFdxZKTiFsdjOl/2xh4jTDqvvfHVTL+nJoA1U/16FWFD11/NxduGcr?=
 =?us-ascii?Q?T7wPF9lFbiwxksHKrnAoj4n3rYLWwqwsmYrGqmeeOcjbt8lRr0TB2fnRh/7j?=
 =?us-ascii?Q?ESw6xTgI2/PVEvGThcuvFy+Ip+QTMTHEck3nJu8TAMjtJ0htczrkfuNuf5o6?=
 =?us-ascii?Q?EorWNlA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v/ePvcGJSijcaLivxB16Jo9pjnfAuag5fwuujn6zrIdOSHsS7DUpZ1airhbn?=
 =?us-ascii?Q?w9CXh4to36J7uI4qbVY1vqcAvb4VxnEencJCVUdMpgAKs3GRdn+1t49Hs2Wh?=
 =?us-ascii?Q?cHNPX2Jersfv7izFK/dJ/qAQi2mxBIOQbQw51LnG/nLYULumJwGm+9Vrg/Qa?=
 =?us-ascii?Q?DK8d6GtcRWObsH21TAp/dqnlAeCqQbn3AgNtfzKTAsdQ7O2WHS3yY/Y/JHEn?=
 =?us-ascii?Q?rqBj8knAg8p7rBy3ScuLH/3kT/4UpimSHORRLlF2gu4jTGT/fH0uQgGqV7Fe?=
 =?us-ascii?Q?6wnqohxo+E0yU8VzBYSxIqEjowVvkSveSdgXuy2F4fMN9e9PEc+mWertG/st?=
 =?us-ascii?Q?+5gNrY10iLkDm/USkMA5U8MoTMnxeYKxjp2gpBzXk3HswMD424GBVWipaYGn?=
 =?us-ascii?Q?xjguGyQzLyk9nfhZt57pLJsFoySdn3CDrzFHLKSKRAayjTTra3v6bTpiSo6y?=
 =?us-ascii?Q?ZgnxZVkpeLwTXtJZSdg8gRuVVe3GTg6A3xJ8O9W3XBvY/8KmZTcxwcM2SF/R?=
 =?us-ascii?Q?yxTYmgzod+6VdpCybQXoZfrHJ9Ucn5F0oLk7grLC9v02nOtpqAySDMojBLaE?=
 =?us-ascii?Q?j7mt0dipu6tcTUCCTLw4IgGQvotohDnIOAHayf7xuwOIvqjaCyDlJGP973n5?=
 =?us-ascii?Q?LOhEAc/CANB1HLD97C+fFFZ0S7n79yRdUAJvQezL5ay5pHZ4Pgisq8E62Y6j?=
 =?us-ascii?Q?NbW2b5CTKcWQdBtu9P8/xEFPL5iDHhdfHBFiaBHxeD9eqYghDVV0VeXnHAQG?=
 =?us-ascii?Q?RjtdOThluTzqTA3K303X2095rXXnJw9cGBUNcxCE6NRsYmmLock29JOSMFRX?=
 =?us-ascii?Q?y3BK6OlTHU+uuV3G1MPz4JVSc7zVbp/9yjEjL/sOg7kR360aUQpDGcble9oa?=
 =?us-ascii?Q?V5rXRR8dOagz/wb8ai6S5ECNftzikrbljUqolKDx+T7qs5EI5uN22oYWnZSp?=
 =?us-ascii?Q?A8jNIuX0oFGxgAZjnDpy7TK+YHrwBPAuEcvrEqTPVhHK3rliIr6s28PQQuQ6?=
 =?us-ascii?Q?kSU8VZmz8j2xYUWcNbbzLAVSCMX3pB7rOIXUdgOZeYlru1Xu4zsSQY3CbRT0?=
 =?us-ascii?Q?aYU8g5dm7bZ0BAKPQ+oGaQKIXY+0xXOrpTDFY0HoxVffXd7bb27y7S7L3JaU?=
 =?us-ascii?Q?5FHknaHe76Qj/KFAEs2cj2WEMhDyw3f0/rkMbvILcRY8nhv3nsOGamRRke/V?=
 =?us-ascii?Q?gbeUVah6hpprcfGoN+Wt/i7p9yPK7010K5aJLuq3HI3ipyMtQ9zeYY5LswQx?=
 =?us-ascii?Q?5SEPXm2Vk0wXBco+nOkpIgv7uCkng5hFPjrwX6NmDDk0wsoCPOI8HVp6IMCq?=
 =?us-ascii?Q?fOa4t5oeO6tIPFyGHtLUS+M30yg6Xag/rAGys68JFsjs+kYCyXXdoMOjvXNv?=
 =?us-ascii?Q?DKCeJklQ4YQ/XuLL0L/dIgf1RN2iiJfZ2Ne9o+OkriRfDmgceTifVdmYRUyH?=
 =?us-ascii?Q?R69BHqisOUUJqbm2iCJVWngYmkljnHYRInt6WNAMbBmVIZPY5WQuKVzSvKyf?=
 =?us-ascii?Q?b0jVazXCNC0Hb7n2MRWXMpvDP+oDkptlhryVnjNwDOg+4Kct4lJVB4djzDyV?=
 =?us-ascii?Q?ppUiz//dXEBi5riQx0GCaytsktAAHtZknbSx73RUINIzr0b98VJqrMgOg22D?=
 =?us-ascii?Q?pw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30200635-81c3-4cc5-7217-08dcee8920c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2024 08:53:10.7243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iW1/AkoiXUHbPhA1Omkrijj/puhCIuQBwiFLtZf70TEE6tg4L1i2uL+NSInk2sLXZdmbRFuxTIJv1NCAqdUk0xYbLOiBHgglnWZqHrfBofc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6992
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

Hi Pranay,

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay S=
amala
Sent: Tuesday, October 15, 2024 10:49 PM
To: igt-dev@lists.freedesktop.org
Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer <sameer.latta=
nnavar@intel.com>; Samala, Pranay <pranay.samala@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_flip.c: Updating the skip message

Debugging would be easier if we had logs available for test failures and sk=
ips. This patch rephrases the skip message for better understanding.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_flip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c index cbabbe74f..88cd41083=
 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1896,7 +1896,7 @@ static void run_pair(int duration, int flags)
=20
 	/* If we have fewer than 2 connected outputs then we won't have any
 	 * configuration at all. So skip in that case. */
-	igt_require_f(modes, "At least two displays required\n");
+	igt_require_f(modes, "At least two displays with same modes are=20
+required\n");

Code changes are LGTM. Make CI green before merge into upstream.
LGTM,
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
=20
 	if (duration) {
 		duration =3D duration * 1000 / modes;
--
2.34.1

