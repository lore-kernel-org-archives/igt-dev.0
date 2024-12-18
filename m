Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D666E77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 22:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6EB10E24C;
	Wed, 18 Dec 2024 22:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBzcFbrB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407DB10E24C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 22:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734559570; x=1766095570;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sgN8HUoTyj+jgkF6wr6ydY8W+stO/Vor/jBoUm+Wxrs=;
 b=bBzcFbrBN65DTcwH6kbl96lWyuivXbFvk5k4LtAFGR9nspPDwAfg+8kS
 P3oAJHubaC3ZiURvpoUNSvhlg5n9AjM3YuQh8zAhAAuWOhUNf9WbTnF7f
 14mkqzG+JaLYwyIRZkkMg+fqfhN9U7pomNqax3xqg66qv0LrflLGshTZz
 /T517N6XHBHjBL2ELEs0mHkJ28FWskifAxmBK5NZj+Ytbnyp3zzaXoqsE
 wCr+/5tcVBtG63C81096kTsGa5SY0VWY0DTBCxKuSLy/sdgDm5HKPCh90
 L0bDH3GqTeqac32mp4xve+gao2M5316jF1+KmiXsgnJTgfoQO/AYuGVRj A==;
X-CSE-ConnectionGUID: bqqy0yoKSJ6AQwf7rr7HDg==
X-CSE-MsgGUID: IjBmMhuuRDyR8axf+OSeeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="60438620"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="60438620"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 14:06:08 -0800
X-CSE-ConnectionGUID: eynsRnrSS4m6WzF6anNJCg==
X-CSE-MsgGUID: dDnzUeRHQvqCZppQZCi/ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121253035"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 14:06:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 14:06:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 14:06:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 14:06:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkRHP7zhizRk0q4IA6Rd2Y/MJK4XjBlvQsa9NIc1BxsJMX2QxCRveO8lTv7Pca/tLhJqCjwqhJRyp6PRZR7tsLAY9h0kiHFZ8mTMV0CEo0KN5kORduyk6kfPKSnWL+HtMdlJiuyjhuddj+rspgz6tuCA5pgfZ4Vm/uDZTeOKFVO55y/WPCud80aZN7/Xdag0tMKIppw2ZlXF/s16Z2Ta38MIsfdVPUfd5aXj34VeBgXuLEY+ktdCTi3SzLnOYpNLYTl8BUck02bM/0Nvpej2VPelE5Av/0jFuaGj2gDJPyFLLq0F2mRFkT0dJZf1QUCSn0OScszI9YmqclQA8B9lSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MNJ26xCFqhvtMQ9Zti7OBXSG6DrH9T3/+1C0lYPHnQ=;
 b=p6ht3YGQnTKNp042GCOrthllrGYFe730YOOxPFv5/6dL1zCq/VxwXTsI2Shn+t9ON31TQwCr8kMloflot47WjcjhTQQpPVBlv+XgRY8D5fTxAfyPqyW2YA7vYJ5ZDoNbJ7S08+3/YAP3BYkehTNztpEd9e7ZhBt+uxiLHGou9CtLyEVlxraQZ6PGzYZsGt1BJ1LXWI7QvcBHKrDoYPrsGHn48ThGdU64ad/FlyCtz3rTkE3hmDXHQpR6pwnFnqy57Yh/xmhxEUu5z3kf8x+k1VEoTGNDP+WWWWB+IguSQbCAjudSfXC5mDwqtmd4E6IPHSzVyutlSQn7g+uxyg/2Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6267.namprd11.prod.outlook.com (2603:10b6:208:3e5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 22:05:55 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 22:05:55 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v5 7/7] tests/intel/kms_frontbuffer_tracking: fix
 x-tiled tests for case when there is no x-tile
Thread-Topic: [PATCH i-g-t v5 7/7] tests/intel/kms_frontbuffer_tracking: fix
 x-tiled tests for case when there is no x-tile
Thread-Index: AQHbUZUBvz9h7jNiN0uPZdI2FUuW0rLsjJWw
Date: Wed, 18 Dec 2024 22:05:55 +0000
Message-ID: <CH0PR11MB5444899E6819B1730A0929FBE5052@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
 <20241218213654.2734573-8-clinton.a.taylor@intel.com>
In-Reply-To: <20241218213654.2734573-8-clinton.a.taylor@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6267:EE_
x-ms-office365-filtering-correlation-id: 339460c0-91d1-4a6b-b482-08dd1fb02532
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6ihqW7KyY45IojZqUQHvXekRQpv0sNA7Hq6tW97mqFoD0ftHOgveuBaVYDBC?=
 =?us-ascii?Q?jPBwTDvF9g8P2T4IjGTjxFOnMJ43c2bHWCoHwzlR1rYo1+MKS67G/ATL51WF?=
 =?us-ascii?Q?Ss2wPHJ3K0Fj5KLl8oCEaTtuWFlMdFQbORvJ+/cDOTh+Q48meqJYqwqziMWu?=
 =?us-ascii?Q?W7babPabTnWl3sipXtnD8U911FRewvaGNIhJG6NJ8vertXfMbYiA12HyolN7?=
 =?us-ascii?Q?oAUo6jZ5t3OQqUrGV0JdNpFPeFR2R6ZY9uvYSNI03JMFtex7mM7leKNQA8eV?=
 =?us-ascii?Q?AkGj5bgOaFOfrDf1SfyPOnNhCooFzBMLpi4HySnt86V3JzDwszhSjY74hUCM?=
 =?us-ascii?Q?yTqlmuQTCKaLRrk0U7h+SselH4WSkrxXc4ywyKVeIYAf9mkIiYD4PX/cX/Jv?=
 =?us-ascii?Q?0AyziEksamzmXsRrnA+4r/YzgLlx8ceqKy2qcCvAXIKP7DQEAV0quBkeAd3z?=
 =?us-ascii?Q?aPhTeb1tR3uOw2liC//lZV3bXbuwsDK+Q926qUUsBZdStoBvDRd1Xf6m2qb9?=
 =?us-ascii?Q?8zKoLjkwlMI96i07ZkXVZxDEY7tM4OQ13nJ/0HUGV6MDeyFbrsmAEwibcFld?=
 =?us-ascii?Q?CczL6PO+D5DaXOrKeCuvg/ZmJui1d94he8Tvb0ZpvU8nVvhqVQwJMjkIUJhd?=
 =?us-ascii?Q?gCK+JjoJMwFXRYJXEji17V80ZcHRpty1tp/EsHLFEh7coEKk0skAvGzk6LUN?=
 =?us-ascii?Q?81fwlz6H5D6eyidmvarLMl5U9gtmYrfLfSJhL0RibZTYFQybUM7iRQdu5b/B?=
 =?us-ascii?Q?oXEyG+w39QDkvWPvnG3eNkM6VVqtaJFtMWqkRZE+bW9ct6LyXHhZfClKGpKu?=
 =?us-ascii?Q?bX4LiOt5Ad2kuWF2CfKgVlPicLUdGhVWJg/oDYaMl6OhbnfWtbnEcT/VphM6?=
 =?us-ascii?Q?RkohtGDFkBo7GZ/Q3gHTyIB5kqcqsEVhQx3bVva4UBN2OUN4VG6vx8kmiATm?=
 =?us-ascii?Q?CjxFPthtQD8CxLbtCnC0iddFJT88ZRyMsWt6trTSopmgPmy3TziJICL072zS?=
 =?us-ascii?Q?gG7LYy59bYF6SyavclTF5SWicwCmCRwQ1hx+5cQvo3d4YDbOGl1NFa03onXi?=
 =?us-ascii?Q?0sPuCsDegeu2egRCcoU3PVW/PH9hoTteu+JXpHo8U4VaodW/YXMLzsn5cMT9?=
 =?us-ascii?Q?PfKxyfmjS+s5ExNqK/k2gHjKnS6zL0nUOggkAoPg9cL/tlRKo+xTYQN/wOSF?=
 =?us-ascii?Q?XrGaPj8VEDgBXCd31jcsYbPuYxJhO6Sj+m68LAODpLWU/UOXCNr+ymmFdpJj?=
 =?us-ascii?Q?ainYlY57o6+UnUv9iPj2xClMe2kNYdWt//Rfc2/RWRrfS8hBtw1iUb5pjYxi?=
 =?us-ascii?Q?uE2QTME8MB6tB1FI37P8jiQ5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hJiGW0w3+nr80Yya8SWeO8v+FC0ul7nvzUgyVfcHD+Jl1dZdTDDMrDiZHhDD?=
 =?us-ascii?Q?UWgvssU3GlO9G474iWOGxBk9zMFpGjPUubgsOEYGop+j/apQnmsTsEnm9PkJ?=
 =?us-ascii?Q?BSEbx4kKrgFqYCmK1RH00+TAg8d/dNF/9uFzAb0xslbyDqwzDYcMpn4oxpK9?=
 =?us-ascii?Q?8J7wir3EDH6lGeJnPrxPMqdpOmJprLjuvzHAgnvWxruzG7Jx5D89Vkzrm6be?=
 =?us-ascii?Q?SkwaATZbgb56LS0Z9vQPBhfmvF8rSFNaGvjTH39QsQg97ysMPHos2dSffCaT?=
 =?us-ascii?Q?YNbOKbXpMqVF8I9qfXTHg87Llo9SriRMqvq8V29LjQMSi2HQvbYm/zBgs1dc?=
 =?us-ascii?Q?EzDPO/vKytlGD/qvO6wq95BHWFioP0UTQZpKSuvSUGGiLYi1CO/WCdnEmQb8?=
 =?us-ascii?Q?oiav/ry3/SiXAAbHUofRb7NTG7Vf2DxxOnl452k8nUD50WkWljT8G/Fx+pZ0?=
 =?us-ascii?Q?mm2GzOPbk+2b7wmgRdhWQHL9byGlxlM2piQgTQKhYkYSY5A9hrbWJzAmeblF?=
 =?us-ascii?Q?jQgTcJ0lg7O78sTvaY3t5jISPgkqjOLhhE0D/y75jrIiRiLtULFG/ypX9+Fq?=
 =?us-ascii?Q?GAEWDz8jeAIFVbxh8Hmzx1PBDv3BYBFjGDr7605H1hyhO7cV/ch8bWA6no4O?=
 =?us-ascii?Q?+fuYv6Ty5n5I2T/dDqdTky4oYlCTVqqthsdYGec1a61D8GMrxAgXCZY4zVdM?=
 =?us-ascii?Q?cNMcw1JOa90J4UnMmDgVUWkpGIIceZ0YWDw56kG/hWqMxslK2Ui+C9vkRi8R?=
 =?us-ascii?Q?V0AklTmGCOn1yIPCdI8mmbwqiClzc86UTSOPJ+qEF0eITrdVTKLPGI0zCwgA?=
 =?us-ascii?Q?SH0RLJJ0q8CS1GteUkXPMFEUYw/Cragh1JhbF3MKD/cffl2/6zZPcu87awIu?=
 =?us-ascii?Q?UDvOzbZMf90IOXQEeRi5iBd1QANT828kB0wLVZ0utWyf61onuikimkyl2NmY?=
 =?us-ascii?Q?DMvmKCoDknAZtlHoEjBl55KUyY2FDw4c6bdBPNZjk0yLmgXTU5yi2pMuH6sk?=
 =?us-ascii?Q?eX1Y5d3Ud+W23Kfv2n4c3lXjJqobi93sUMNhXcKuaLg+NfflwV4h9sGp4Hop?=
 =?us-ascii?Q?g9RkC9FjUc3twhK2dvTSouIQzn6Et8cFtrNHrAOScb4uKpzvDo8qqoD4BhzB?=
 =?us-ascii?Q?l3nYJwlTk01CLnItelqHd2Krc41MzS6zFk5LzL9ggbiBDlhr3UV9u3sPX425?=
 =?us-ascii?Q?7d5iZf2TrXmrlbkBRrh5O/iYu3pkxGCqpp/36Q6CpWvlHfVkCTVddV5f33Kc?=
 =?us-ascii?Q?0LwK8TzQZkmlogT7JEuTLvs2sniQYcLk+g9Ov7odTQ0rD9NQcgPDcTmpPs9j?=
 =?us-ascii?Q?NCPHdqtmYNE7ifpLKqvrAfBbbmriHn1lUuAUcWlGtvjMBKcL4EY6F7hqy9DY?=
 =?us-ascii?Q?Eabv6Bnluu+aAE6iUI3hPbqciHpuZL5t1ovS00hLKxdwG6xwYVsJAnra4G0N?=
 =?us-ascii?Q?Ho/UUm1/Yhu7YfG3SdRkEyfI53odpI8uwrU5ggcSQX8sYlxmL4ACz+QvMcvv?=
 =?us-ascii?Q?JscUo75UczKfLRwO+Frx3Zv89yuTeEcKhhY/ciswaBAtV/YOgTy2zGKntpel?=
 =?us-ascii?Q?p7VJjKgvNMtdV0vsUnkXjYyn/FKpLk5iUnTVODKFDceCrszIkkv4dWvzhfTs?=
 =?us-ascii?Q?yA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339460c0-91d1-4a6b-b482-08dd1fb02532
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 22:05:55.4997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WPsc9uYf9Xtv2CKJ3bD6OlbTAVZpYuaFxZp3dm0zI5JGR6ipm0pXU8gSLmxjL1kyLBz/JSCZrECQ+wvg4sXAeP62LJLaPO6Yya9OxTlIrSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6267
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Clint Ta=
ylor
Sent: Wednesday, December 18, 2024 1:37 PM
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 7/7] tests/intel/kms_frontbuffer_tracking: fix x-t=
iled tests for case when there is no x-tile
>=20
> From: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
>=20
> x-tile is not supported from xe3 onwards. Handle this conclusively
> in all the kms_frontbuffer_tracking subtest options.
>=20
> v2: Optimize display_ver checks (Sai Teja)
>=20
> Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>

Aside from some nits and a newline that should be removed:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  tests/intel/kms_frontbuffer_tracking.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_fro=
ntbuffer_tracking.c
> index e41ee0a80..ba564fafa 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1031,7 +1031,7 @@ struct test_mode {
>  		TILING_Y,
>  		TILING_4,
>  		TILING_COUNT,
> -		TILING_DEFAULT =3D TILING_X,
> +		TILING_AUTOSELECT,
>  	} tiling;
> =20
>  	enum igt_draw_method method;
> @@ -1154,7 +1154,7 @@ struct {
>  	.only_pipes =3D PIPE_COUNT,
>  	.shared_fb_x_offset =3D 248,
>  	.shared_fb_y_offset =3D 500,
> -	.tiling =3D TILING_DEFAULT,
> +	.tiling =3D TILING_AUTOSELECT,
>  };
> =20
>  struct modeset_params {
> @@ -2181,6 +2181,7 @@ static void setup_modeset(void)
>  	offscreen_fb.fb =3D NULL;
>  	offscreen_fb.w =3D 1024;
>  	offscreen_fb.h =3D 1024;
> +

Nit:
This is definitely a correct place for a newline to go, but I'm not sure if=
 this is
the correct patch series to be making this kind of additional change.
On the other hand, I guess there isn't really a better place to be making t=
his
change, so it's probably fine.

>  	create_fbs(FORMAT_DEFAULT, opt.tiling);
>  }
> =20
> @@ -2302,7 +2303,6 @@ static void setup_drrs(void)
> =20
>  static void setup_environment(void)
>  {
> -	setup_drm();
>  	setup_modeset();
> =20
>  	setup_fbc();
> @@ -3146,6 +3146,7 @@ static bool tiling_is_valid(int feature_flags, enum=
 tiling_type tiling)
>  	case TILING_LINEAR:
>  		return intel_gen(drm.devid) >=3D 9;
>  	case TILING_X:
> +		return (intel_get_device_info(drm.devid)->display_ver > 29) ? false : =
true;
>  	case TILING_Y:
>  		return true;
>  	case TILING_4:
> @@ -4226,9 +4227,18 @@ igt_main_args("", long_options, help_str, opt_hand=
ler, NULL)
>  	igt_output_t *output;
> =20
>  	igt_fixture {
> -		setup_environment();
> +		setup_drm();
>  		drm.devid =3D intel_get_drm_devid(drm.fd);
>  		drm.display_ver =3D intel_display_ver(drm.devid);
> +
> +		/* TILING_X is not supported from Xe3 onwards. If the tiling
> +		 * is not set explicitly using the commandline parameter,
> +		 * handle the default tiling based on the platform.
> +		 */
> +		if (opt.tiling =3D=3D TILING_AUTOSELECT)
> +			opt.tiling =3D drm.display_ver >=3D 30 ? TILING_4 : TILING_X;
> +
> +		setup_environment();
>  	}
> =20
>  	for (t.feature =3D 0; t.feature < FEATURE_COUNT; t.feature++) {
> @@ -4537,6 +4547,7 @@ igt_main_args("", long_options, help_str, opt_handl=
er, NULL)
>  					if (t.tiling =3D=3D TILING_4)
>  						igt_require(intel_get_device_info(drm.devid)->has_4tile);
> =20
> +

This newline needs to be removed before pushing.

>  					if (tiling_is_valid(t.feature, t.tiling))
>  						draw_subtest(&t);
>  					else
> @@ -4569,6 +4580,7 @@ igt_main_args("", long_options, help_str, opt_handl=
er, NULL)
>  	t.flip =3D FLIP_PAGEFLIP;
>  	t.method =3D IGT_DRAW_BLT;
>  	t.tiling =3D opt.tiling;
> +

Nit:
Same as first Nit.
-Jonathan Cavitt

>  	igt_subtest("basic") {
>  		if (!is_xe_device(drm.fd))
>  			igt_require_gem(drm.fd);
> --=20
> 2.25.1
>=20
>=20
