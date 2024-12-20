Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C076E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 05:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E778010EEBC;
	Fri, 20 Dec 2024 05:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ci78M0sv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD14D10EEBC
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 05:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734673106; x=1766209106;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LEwgnimdnXZaqbSj5gOeJaz/SKp8cf8PSYOaiu9SsfQ=;
 b=ci78M0sv9S/ojn/YXqHYiRXd9YU1sH7IVqz46lRLqJ5wpDMh2fLtJUJ6
 JYDCS45tI7wG6vuhinjKFvphGA+auDismvuskfoXMViJz+PwZgYyP/ALS
 Go/+Efb6Uj2EmrXFK1NBWn+x30jTAwfbF4u0jK66TVLJdfJdkuT632DM2
 nq+Okha4JRP0qk6K+RW8ae2S5fzL7SI8lm2RhQ5VWskrWHmz7LSdT6QYd
 fRVC+owMkJJJeRzNB5Ym7vIGCZbN1NyJZPFcsmgt8bH8weNaEVIbJYw1G
 UnPVVShn8wvhoKJF1mDBiheZ6m7K/lr4f3xtbEJ+bKkfbdfAKxp5o3rtA w==;
X-CSE-ConnectionGUID: VVyRXKL+QSKCNJyGaxaCzg==
X-CSE-MsgGUID: 1QJ2elrqRT2OY2k6vYll6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="22809156"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="22809156"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 21:38:26 -0800
X-CSE-ConnectionGUID: BSUqbcQPQ/G+MCblsD02rQ==
X-CSE-MsgGUID: Kl55+mL7TM2I8GSIMG/MFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="103293046"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 21:38:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 21:38:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 21:38:25 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 21:38:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyY+5KvkBvwKODhDk1eJYxo4o216sAu0taYzLL8Q1X2HrMHRpKjuUU/vGlQoqwdSKnxFubKqQsFPyyJI1fWwG5bs6QcELSk/aPUModMyPpcIQEuUEMtkgalB+PpAeSu8kWgNPJ8Dr0/mbLFI7EIRFSj10ro2xcArCg4T/g8pNIm63yuS2xeC0RS9Vcxb8Q4O7Gnq4rg3GHF6B2ald50x1JbXwug1F0gErtpvBCUUn419gFQSf7ukViysVvDoiPMRBSmgZOKFhJjMdLWLnAQ94V3LBAcNkGXlMSLh2b43ecOcFk8kz6MyAyJTVuzM+hkY0ns7Y1DV9lu9/ag2dz78vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2505TKVbEdqVgPFgBheaDAmTBrVbyiTxyQCMMivMGA=;
 b=VNOL7fLDFSRf1CYy2/weGLjpoSRc8GfuWPIw6TRszVVZNs9tEHswwNuJ+/dOfPviT7B0yj/o+FUKwhI9ibTs5KleX7sES8pbJM/69FxKTA9LaX1B4rzq1bmgzgNOkVfHy8CpeO2o7t8NtNZeWY5Nm32ciyORFhq/9lXr7JpXXdBot5N+SpH24CHdgGt1bII9K5T8etenlF1WFY02po565Q6ngB/tUQ+E3/ZVl+0v915DZ15qeOi9hzL43tx7SAf2msgIk0XjR/w86xhpBEOuprn/5VvRcVe5eArZ+08FCqyTnTFwxLL5cuClubGXTC9rSFV3B7zWWX9NlvsyMgSaxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH7PR11MB8552.namprd11.prod.outlook.com (2603:10b6:510:2fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Fri, 20 Dec
 2024 05:38:23 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 05:38:23 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_lease: Add vblank count to avoind
 resource busy
Thread-Topic: [PATCH i-g-t] tests/kms_lease: Add vblank count to avoind
 resource busy
Thread-Index: AQHbUjVGH9uLyqZFJ0urWRr5GqGyb7LunBgg
Date: Fri, 20 Dec 2024 05:38:22 +0000
Message-ID: <PH7PR11MB6053286E1F73D8A0AA8CDDE5E7072@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20241219163938.475114-1-mohammed.thasleem@intel.com>
In-Reply-To: <20241219163938.475114-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH7PR11MB8552:EE_
x-ms-office365-filtering-correlation-id: b2017a7d-dd55-4ac7-bb98-08dd20b884b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?eiuP8boxSIjEcIYP9wMFvC30WMDXeC/gmQk2SFDUzdekWh3vitnVGNX26Dod?=
 =?us-ascii?Q?lnFayljcMloudO98AlAQ2gck2p1JHFO2nJkqPFIW1KZmRlLBzpF3dT0XQR2O?=
 =?us-ascii?Q?v3cf2DnuUdE1LhRIAaDepkllWj+YCULKuEOtHToZ/mtQngUdntJhi4GYxsfS?=
 =?us-ascii?Q?nfbpcOUvNS3dBUMqyGwQ17iR7HXhb82L9TPdlFevLV30vy20e2He+639u86C?=
 =?us-ascii?Q?sSr0A0WVnfLbsvncZ4ldHUPdjs/J45gFRkz3eG8FU2nVlbgZDRKqzF5uuMnE?=
 =?us-ascii?Q?HQeOBkXZhaK6P0rM5geHN9a2oMJ6oIyoM7wjoanx6TfdDVwdNMKZAQPOa9Tl?=
 =?us-ascii?Q?LwJFUZU1rJllauYhX8VIJni6WdycA0uqcChTt6U20Tyd/wUxGeRjO87VEggj?=
 =?us-ascii?Q?Yy0aB/nvma5HxOInLoRYRaobOCta3ea+iP7pEAAMoTvrL+B4Oo5nr09wDd3d?=
 =?us-ascii?Q?y6pekfOCDjsSu9l+J7kf/jozLyYD08+aOvJ0ZMH0SATlRIx6ZNAsgEBraOfQ?=
 =?us-ascii?Q?JMcIapjdaIgTjKmsY7ek3nJiQOXvB4aJARqrErAueChghEJeDoy2fpoUtzIo?=
 =?us-ascii?Q?JIgCj1tnxSKXoojdCEdLMtaqmWMk6Z68xm+/v4wMVgx6ppGbkEHtVqVLBQV4?=
 =?us-ascii?Q?Dr0aN5752IEowtPtAWJBPfqEP9BuY3suNxAGfHVq9Xf3IGbzrp3/OGQ99Jrx?=
 =?us-ascii?Q?pLe9dY/+xt5U/jfampPXGplnEIFCa64rBr04rvUSOW7pZyUqpmlaMqfd6aAc?=
 =?us-ascii?Q?fWkYcjHfAj1ugyU58yIl7zV0TTRtRAHihddDdZL1uZxxuzThpRItqT519ZR9?=
 =?us-ascii?Q?lnWsm26jnQ+GBc1CYjPQ22TIj1n+L2zlG4ph95JdtzNqS+PchnjCmbUbth9z?=
 =?us-ascii?Q?IO9t5GOFb9VciFaWXszMDvufMSnYP8lAqZk5mjBR33XzWmM7TSvnI9LJC4AR?=
 =?us-ascii?Q?Uxvf+VZw9KBWQztIRZ33/SLEpkb32s0/IzgVj4Lc2mtpXuoaUTc65d1wSs6s?=
 =?us-ascii?Q?st/sCTKQaDhx6GrNhWXNg6o00pAmpo88UpWddHB6XLE9vUGm+J9fkbmkSyHa?=
 =?us-ascii?Q?pYFUknXdElXNOmSacHWDBKHRlWqFDEnBrLb3UrTcCrnFbVzzIypwcFM3fy1C?=
 =?us-ascii?Q?wRfyqjCI96onYCs9zHGSoEE8ayTHeYFmLT+7y1G4oPkson2oeO6zqFginty7?=
 =?us-ascii?Q?vqUb7Z8wdu62HsGLmN5HgowOWnJ7m5xo8syUoPcfh1otBLr48pTFK648G6Rz?=
 =?us-ascii?Q?s5i6XK4mxi0j1uT3NygV5CItT0MZN39/pWReK8MiZ7wKMJzsIvopsQE4Se9N?=
 =?us-ascii?Q?NcsWgazzniu+o/OvWq+tfOc9A0oZ6sglES7y1eVOFDGZvAL/HNBJ81IGB4Al?=
 =?us-ascii?Q?9LZ9NsQuZ81AmdP88aDXzbyjgYq6p/xBMyPJLIODDF6dukErZjqex+QpHyfU?=
 =?us-ascii?Q?DhjRCXRS8YFmk6/2Q8r2eUyb4tX0uiSN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x22trKvCDaI9JS/GSjzjEFm9HuRZ2NbbD/oxI626+BIhwDJpSOpyf8xM7uB8?=
 =?us-ascii?Q?S726RqxmequAilhPGbPp+/O7BaeR8jORkkfqi17yFUl+wieGCHV8Ae2zb9cy?=
 =?us-ascii?Q?U6qt6ZryzQ2qsK6TU8k0AF5sva3XoL8ZnlhYJ/5jIPbOW7gs+okvT60Vuk7t?=
 =?us-ascii?Q?Bj+flGkeMpDhf4+TNRhOnM6O8GnHKORPz6GJbrb5befuOvIGF/wGWnjwLQis?=
 =?us-ascii?Q?LHdtzTXtCnehxseV14UiR+mom97X7AuxD/4w8UyPBSNCsAvl6L/KSRHjM+DA?=
 =?us-ascii?Q?eJRye6BdEnjGbK5AU1htyUIpfHc6dz0+KnmPWgxKmivRt9YlYvGrdPzks5MW?=
 =?us-ascii?Q?sZX/s57zMr6XHABukWHFVJrP0MaXXmzdaEgI49nWpaCjRdT1MIAQzOWawYsn?=
 =?us-ascii?Q?UQieL/w0MMVeDILDduW6a/hBVL+4B9hvAVfItspdnJg7qm500PZ2xuIaPtfb?=
 =?us-ascii?Q?MfpsRYs3vAu+ifBHmUoi2icekjn0hDOlM4ckL4U1xID++Kx9o/5OdkxEC4RS?=
 =?us-ascii?Q?ohJcVFfRDi759XACSxiDkM2jKawSNCV0kT/4EbFa2dMBYPvY7cpp6huJDhzI?=
 =?us-ascii?Q?aT/ZtLv4ngRpT/dXJQYlqyw5lNrfYk3QdIucx83wy4c5JzDTFLAnJ4QNjAUD?=
 =?us-ascii?Q?SNaxFGLH/F3J2B2oBT5HAbN7SNLiHPhvE2m9h7k5DzAeAV8+NKEOBw7a9o4g?=
 =?us-ascii?Q?CtaPOsx8gz67LW9lptf7CQcTxXDsQZuMORFKRRqf6A+WMUpNoz6aIPz3CBJW?=
 =?us-ascii?Q?wREXzbQWT36m4fZ88HLBwA7fZOjBu57N0ZE1uzuA63PBNFufHBwRO4fa6aSd?=
 =?us-ascii?Q?y69YeN6zvEpYLZAl2qxcW+BDSsSu6mNcttU3Zxd4gIDoDsYU33Sp+5Irg90e?=
 =?us-ascii?Q?3xdxszhssovPWZWxCCGiaCfn7H5QZlvel1z/eqRL9c4Xjga7R3JnsOMDc2lh?=
 =?us-ascii?Q?sjxkRbD0WssVi8eS8GdFO8Vijuse+7wAP06BQUZ7EMk0ITgn3yTBPBHXnqCR?=
 =?us-ascii?Q?3YnamrJY5VoV9bzAGSUUFP32FLVDYviicNayNjzX/SzqEIONdsSo2cZFvPoY?=
 =?us-ascii?Q?hKgTJ0lZNRzDPabvY/x18m/KZG9RuDKW7PuWv926abam4nmuikQmn0I14o9X?=
 =?us-ascii?Q?AWOhR2o4xtNFD5ghpC/Ldy6u2rPOxO/timuQzer936P5Ob5cCPMKyLtI7RL1?=
 =?us-ascii?Q?0/ScNZSZL+wodTNS2LIGA6TZPaHCHFQYFLhk+xf9OswVzR6VZgzAyRqg9daa?=
 =?us-ascii?Q?O1cDE5ag7XfqBGB2v5wJAM46WY0RxAXMnU864tpgECQ/MOl89tlW878xii9U?=
 =?us-ascii?Q?gtKrQgp3amZ/e+58wCjlIO0KyFSETssiDaoCEf0QP53N1zRONVTQsX5lxFlQ?=
 =?us-ascii?Q?Zo4LMuHguX0wISTFrbdYPqwZdBDNhbZVR4V9gawTeenCdDz1tFZu0K+avnj/?=
 =?us-ascii?Q?pl2fDKnI9Ey3twwM2923Ryz96TIpmOCyEHL8RUrA+jmdZJOPpe3NCM/MAXEJ?=
 =?us-ascii?Q?wMJgIT6joD+HpnA05IEWQCjeTZacclQuYBOxSAKXG1xNYIY39iRW2e2qy5US?=
 =?us-ascii?Q?2Aqmc0bkASbF3gsR8FvlJXi3voUlBggwB51ydHt4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2017a7d-dd55-4ac7-bb98-08dd20b884b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 05:38:22.8728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /5M3BPmd/a/+h4uVkd4Rk3jr/cbi1j18RaM3rCZZgH4uxY31Dwk33aEtcO8NLjoIgeN2ANgJlm22iPZ+pXRTNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8552
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

Hi Thasleem,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Mohammed Thasleem
> Sent: Thursday, December 19, 2024 10:10 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t] tests/kms_lease: Add vblank count to avoind resour=
ce
> busy
>=20
> Add vblank count to avoind resource busy so that page flip to be happen
Avoid, Typo error.
> without any sync issue while setting a mode on leased output.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/kms_lease.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c index 0f3a68fed..0fbf5=
b0ba
> 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -378,8 +378,8 @@ static void page_flip_implicit_plane(data_t *data)
>=20
>  	display =3D &data->master.display;
>=20
> -	igt_wait_for_vblank(data->master.fd,
> -			display->pipes[pipe].crtc_offset);
> +	igt_wait_for_vblank_count(data->master.fd,
> +				  display->pipes[pipe].crtc_offset, 2);

Why are we hardcoding as 2? And in which context(time/frame) you are using =
this 2?=20
Will these changes work on 4 pipes also?

Regards,
Pranay Samala
>=20
>  	do_or_die(drmModePageFlip(data->lease.fd, data->crtc_id,
>  			      data->master.primary_fb.fb_id,
> --
> 2.25.1

