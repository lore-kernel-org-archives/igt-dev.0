Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBCAC25B79
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 05:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5790D10E03D;
	Mon, 27 May 2024 05:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEJwJUin";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B262410E03D
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 05:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716786209; x=1748322209;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ws88CBK4TBQcv5bQa6EKVAHFVM2+UEjVJKMbcDKQgyY=;
 b=gEJwJUin5I1k2Rp/xclSvk5Nm1Afb8Fl0Y+66bvI+NhJK6r5B1xywlq7
 WLsqtwqE+ZQonMBE9pEsLg9z70/azk8KdtfsVPmoeQmugDCsvGCjSpJQe
 OZIWrVDz10HG8AMRVMcs6XHm4VtVU5jlpCUoc7WACXNMy2vpYBLN+OwSa
 Nqs4idw0ax1rJJEu5ovCVFyJnYPWAjJvGgKEnvkfg6CZc7ytkakCV3snl
 3s0d/JwErymes3te1S+7qjMt7VuZPnxYyiMuPxQ1gDX5v6FIEHzMw/+Sv
 rjox5II7lNn6MV6TIfa4ZlVRnZCruyJF+ymi+DGgXByl0wKrf+tGazQJH Q==;
X-CSE-ConnectionGUID: OeQ8u0aaTvuy34uSeljvdQ==
X-CSE-MsgGUID: iiXltqu+TcKCRMCdaSDjSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16031553"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="16031553"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 22:03:28 -0700
X-CSE-ConnectionGUID: lmtgQwiASJaxw3jB+muvxw==
X-CSE-MsgGUID: 2zISkEKYSISFDh9XNU0Akg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="34621838"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 May 2024 22:03:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 22:03:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 22:03:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 26 May 2024 22:03:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 26 May 2024 22:03:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Msi6UeDj4kvvaA8L5g02jvNTrJNHNYduRGS8mKOSZMqiGiD7STNeefas0nMNwpQyNwp+pNqFVaYurC5Ep7NBvQHcElqdIwruoXjLkkjp36ddSkYaMKuj7nGlz8U2FQsT5Vb/8uL0cDiYPVy7BLViN+a5FV+5PFMRW89p0bCzb0FP+1jEfS5lI8STOMUPPDzFKfUgeDZXkCtrLkAHtiAi6FypmNddDFxHj/VHPVVFvKmduH4+8C1GyNFFvmiZN/RY7t5K3+rqvNwUSAmVFyYDrymg1r6TkMiKErPMNgGw3+lKbWX4xfNctbmAI97YcQniLZS9c/wo0IBJjHh2oiTe8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRuzz4YywVZ2n7ibK+yJK4NSaeZcr28A+wFHpd69fas=;
 b=KvmeqWMFSSZR4neui7fe+KKZEFPryesax7rj77WnbuxQpogQoeREHkjlOKvuZ6DX9k5RUm2XOhcWaDweVGTbZgUnVbdjq3UvL5hq+Z5MG2BVZM9QMTwl0SLzBCDJO99LSDTsCsC+T9DnCziJkf3xQHAiFL2CvFwBOsOTCkvnCwxsnrj0IGE76Lz2+GqXEQpo4BU6WsnGJqRgZv0fTIrXtXnAJxUGzGSxGu6kybufKI5xUsDhQ9CmZAQIzjgJu0aW73alGbkI1cZF6T/WiFV22J7HqfMDwK5WKtBTeXIGDwYvH8TKLXG/pbkgqx1UkRoeGTIJPKKBXro5F71QTAU6bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DM6PR11MB4723.namprd11.prod.outlook.com (2603:10b6:5:2a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 27 May
 2024 05:03:25 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%6]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 05:03:25 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_dc: Add a new test to validate
 the deep sleep state during extended vblank
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_dc: Add a new test to validate
 the deep sleep state during extended vblank
Thread-Index: AQHar+wQQ1OBIKJjvk6A1vy0Qt7yNrGqhTnQ
Date: Mon, 27 May 2024 05:03:25 +0000
Message-ID: <SN7PR11MB6750DBFDD724731BCC887A83E3F02@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240527041908.513920-1-jeevan.b@intel.com>
In-Reply-To: <20240527041908.513920-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DM6PR11MB4723:EE_
x-ms-office365-filtering-correlation-id: e79848e7-cd75-4250-0cf1-08dc7e0a573c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?rrurkrlvwtTSn5ZLROPcq5qRKJ6Eflzw5+OZyEO2eOakb04zk4b+XXLyH9sI?=
 =?us-ascii?Q?wNCTJoEPGlfKugeL/hmp2FXsgplUo00glkO/y9z17vmOPNvn1zIMR5RqLwd6?=
 =?us-ascii?Q?sCeXQ7O17GlnohiE4euHmDDTZbjADrPt79beaIB7W0WmeCTLKJ6YIA8w8E+H?=
 =?us-ascii?Q?jo1RHfJ6zLX6nA1wPxX/MGjSBglHFYHlTIwbKWYXxgPEpUYq+UxIPTk5Rrt4?=
 =?us-ascii?Q?/qaNn9cN0xv6UTkmzVcpYUJ85ndkMlJsPIX2cUCEPjmnrhtHWkwi4W4HRfrP?=
 =?us-ascii?Q?GCZ0wa8BP89M9/9lSrnlZesgCb5kBE/OpB5F/BvjV3LcS28kOBJuYycsuiRY?=
 =?us-ascii?Q?02ozmMbQVwehQX2QgsW1uN0vpfluz4QoP18Eumu2Cd54yTZZ8TM5TEd1MUhj?=
 =?us-ascii?Q?OrHkb924E21nmRzfd8tF+lWIX/QeppeI8D5LbIK1ApsON6gKIMlpMy2L7LQ0?=
 =?us-ascii?Q?uyBMBCa4yN23VDIE4iGG8N0k1rqUr45NB3kTYOyU9OLLDm6rV+qbCcGcYtrC?=
 =?us-ascii?Q?zyNxqK/zpYKqmfJ1bI6plVSU9nmk3HJo0Z6qfuE+15A2z6/BXhpbRIKuaand?=
 =?us-ascii?Q?/JjsR79u9SLJXJ49zQRCV0HbJh2yPQMukx3BdZJZmU3syWqzI+SpkAkOcyk+?=
 =?us-ascii?Q?tnJ3a+mTP/u9Oz5bc/9FjIAAtSjK6a/s0PVY4kFUeAig3e/l4LQXN/uIzpwz?=
 =?us-ascii?Q?wS6KzwILPx8cq6G4j1MErVEx354VzrqSP2UOK7VQUNtabusGVwB/GQ68JKny?=
 =?us-ascii?Q?I651+2yP8Ml9DuW2TtL6chZQhNM35tJDLoyb9ozTDvsDu47Ur4LlRRwrzQzP?=
 =?us-ascii?Q?8ZzuiD75TjrPtGaWfzTQu6bp37rfTZTK6aRfXC312s6oRZ7YP1STV25VA8Im?=
 =?us-ascii?Q?JLPuaEyAnxsX970SF7qHBjvLZgv1yGXKUqd5VsRQC38ttH8+71qv7mKI6Y47?=
 =?us-ascii?Q?qfvNVemYlMU4q64jlrOy6hahwbrkyNEcyrSvgIqQ/or+Bd8q4l4M4eTne1k3?=
 =?us-ascii?Q?MAaVbNGGyKv3FTWS0vWPt4ZyKf2uQebQlQCtcokk9eI7nGT2P5Ft1OpGoYZb?=
 =?us-ascii?Q?GORYHwxGNlJPJGBA1v6a1Z2lVsBSX0ZiBonTOFo/rD4OiR+7o0U8nlbL1MjQ?=
 =?us-ascii?Q?6NcFPuPmDm3EAx2F4tXYdiFpoPn53H1cSNQDz8wBK+FJJ5eayjMTyoMCK+KY?=
 =?us-ascii?Q?Clgk004bUoCX4UV9+qWtY/nc3ynntFlqp6DJWrBjFuVSMSgsyS8o65dDUReJ?=
 =?us-ascii?Q?yRBtIsSqhFPkN5OnT2sR77VmIohspflUk1J4WNeCo2Ig62qEX0VMDO/0Skvb?=
 =?us-ascii?Q?sfUzbSLb+ElYBa1IZ0w+iZCy613inhArPND9wwU43o1XuQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DRpDCqMW5ggR4GJW6hetsYSnop069CF/ZiWxAECpyC3vhNmCz9qEvk8TfUph?=
 =?us-ascii?Q?ZgRtQTbNqk/MvUGFwiMlBQXmA0UWk1fPa7ipdGWkn3fv8xR62oTj4h1/Y1sh?=
 =?us-ascii?Q?IefgJUUit7TeXIaDbwjKaFta9/CFEbeRrLgoHhvrcDOXZAKepJOnxgFaCX7+?=
 =?us-ascii?Q?bury8uql4M6MkY/eYmjp4kS0SojBthjDeAPar7fxQ9UedTWnBiDgH0rIj5Yv?=
 =?us-ascii?Q?1Nb/5itG06E6gp4WL0XfOggSkXlbCnfxU1wVu6gRT9isR53mJPFxdkz0Fr+q?=
 =?us-ascii?Q?wyixU5sKyqYEHiGBQNRoYWLwbKrkwH9wmpdMMs7bnIJ37bf9qI9VXQPROsyY?=
 =?us-ascii?Q?aKFUw0xKKZQvbGeXsrtVYqpqk1CGe0E3GhcfbfQmWyqDfYKx/SvYjZ+cMwM4?=
 =?us-ascii?Q?CCur1lIectVvMwfCYKDz8zvWdd8z5yBbaBLUTMOMWwrDlTxWojn5SnYy2u/U?=
 =?us-ascii?Q?vG+H/miWVDOmboS4dBAQ5Atcn6j97HBjY69LclVU+8ynA788nmjKJXH9gSG6?=
 =?us-ascii?Q?l9/3ZK4c7htcGUxJDGxVDsgD4w7uFC/o7UmR95rQNLEKN7kWeWQTu9QrOa0K?=
 =?us-ascii?Q?wcirIP+4XdyB/PSFym2wIOlXN3uQyiNBVgdxGrVPI87pCZcwKFHZxqdL3MIR?=
 =?us-ascii?Q?8LLiMLWjMUfpBf8oX0HNSlm/8U6JGEN6AwkN2ZQlynycPEXAvMQ8yBt8KNYg?=
 =?us-ascii?Q?IpjX5HMsKraAJHifdot9o8xVbPt2BaDK6CJbgjwnafBHgRtjYBdVQmZsew1g?=
 =?us-ascii?Q?LY1UuHf2Q+EhfEEVGDxWxt0q9w/3znkDDf8FCwHELIf6dJAB3d4j7lkmQki6?=
 =?us-ascii?Q?00HD29JHgyPIBL8nu0ASfR0d24TfD96byvV6EfQAA40p3Au5EdeqzkHgnalC?=
 =?us-ascii?Q?M25dzw5lCyqM3HPT7+d6FulFogH7B8yAdT88ebVyazdv9cXbRZwG3KES/Gmf?=
 =?us-ascii?Q?z8VfuxXvlohL32imox1JugV2mR+nrNIJaYvGuB9XcA85q86Vff2QSS76gglM?=
 =?us-ascii?Q?O0yr26u1NneDnZgTbTY/cMduRyjQpozeG9Y2hScAY8G1yrLY3EtRPG9wNapf?=
 =?us-ascii?Q?ahlBQ87cPju/cQ/o1SiiH9yx2NndW1GFrWr3+ZCD4cV0vRQaRjNyytekb7tc?=
 =?us-ascii?Q?Ji7surJa1tLbu7ArMiqFlQOIFnwHJL0KFtZ6v3WuVIVXzaIMyLjndqhDZJkG?=
 =?us-ascii?Q?ZUYRyRmoGUMuf6Y8yYT6+2B3+mAbYJDHfOJQqH5WOfs2BnrHwBRga5jCl7yB?=
 =?us-ascii?Q?HuorMX23bnubsN6p9OldvgveoOwu6SuqKVrjoQmhdXhSS3t/JWeyxnUqz6o8?=
 =?us-ascii?Q?KWqpecUtQLarUyFf6o3UmEniwOYJeSyEs+i5+P7EKuo7iQ9skrnhPkLTIu3V?=
 =?us-ascii?Q?NO4Pj9A1hFVZUnzGJKQFTRsWZp6H31eNs2T8IQrLd8oSjrfWw3chgOjx64lP?=
 =?us-ascii?Q?9n1re8tyr4qVplnVphP6wT19aJdifFLrOE6aCM/HheP92aJ04sAVdEtuA7ux?=
 =?us-ascii?Q?VK2vadKfM7GbQyewzaGPG5+fOt5js2BOzo4+PA/WoB/7+MrPsBiQcL76Jtis?=
 =?us-ascii?Q?IDZAaUt3YWrRwggS4u+Ju3NhnQhTGO4YKoZFzaMe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79848e7-cd75-4250-0cf1-08dc7e0a573c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2024 05:03:25.7822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: csnUSnJYCZqCPOv8yyNWbk/eJ/sE/9KP5wamgxO7Xw+3vvkAGRGHtmZ3Hg1vS7PnnuGXwvjKgjjIYh7qq2HPrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4723
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

> Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Add a new test to validate =
the
> deep sleep state during extended vblank
>=20
> Add a new test to validate deep sleep states during extended vblank scena=
rios,
> where two frames are committed simultaneously for a give time with reduce=
d

Typo here *given

> refresh rate.
> v2: dealy of one frame added to simulate extended vblank.
>     remove vrr related debug checks.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 49
> +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 7766d34d7..9f89e537d 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -584,6 +584,46 @@ static unsigned int read_pkgc_counter(int
> debugfs_root_fd)
>  	return get_dc_counter(str);
>  }
>=20
> +static void test_deep_pkgc_state(data_t *data) {
> +	unsigned int pre_val =3D 0, cur_val =3D 0;
> +	time_t start =3D time(NULL), duration =3D 2, delay;
> +	enum pipe pipe;
> +	bool pkgc_flag;
> +	igt_display_t *display =3D &data->display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		igt_output_set_pipe(output, pipe);
> +		data->output =3D output;
> +		data->mode =3D igt_output_get_mode(output);
> +		setup_videoplayback(data);
> +		igt_require(igt_output_has_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE));
> +		igt_require(igt_output_get_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE));

Why are there two igt_require checking the same thing here?

> +
> +		primary =3D igt_output_get_plane_type(data->output,
> +
> DRM_PLANE_TYPE_PRIMARY);
> +		pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
> +		delay =3D 1 * ((1000 * 1000) / data->mode->vrefresh);

If 1000*1000 is constant why not use a #define would look cleaner=20

> +		while (time(NULL) - start < duration) {
> +			igt_plane_set_fb(primary, &data->fb_rgb);
> +			igt_display_commit(&data->display);
> +			usleep(delay);
> +
> +			igt_plane_set_fb(primary, &data->fb_rgr);
> +			igt_display_commit(&data->display);
> +			cur_val =3D read_pkgc_counter(data->debugfs_root_fd);
> +			if (cur_val > pre_val) {
> +				pkgc_flag =3D true;
> +				continue;
> +			}
> +		}
> +	}
> +	cleanup_dc3co_fbs(data);
> +	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n"); }
> +
>  static void test_pkgc_state_dpms(data_t *data)  {
>  	unsigned int timeout_sec =3D 6;
> @@ -687,6 +727,15 @@ igt_main
>  			test_dc_state_psr(&data, CHECK_DC6);
>  	}
>=20
> +	igt_describe("This test validates display engine entry to DC8 state "
> +		     "while extended vblank");

*during extended vblank

Regards,
Suraj Kandpal
> +	igt_subtest("deep-pkgc") {
> +
> 	igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> +			      "PC8+ residencies not supported\n");
> +		igt_require(intel_display_ver(data.devid) >=3D 20);
> +		test_deep_pkgc_state(&data);
> +	}
> +
>  	igt_describe("This test validates display engine entry to DC5 state "
>  		     "while all connectors's DPMS property set to OFF");
>  	igt_subtest("dc5-dpms") {
> --
> 2.25.1

