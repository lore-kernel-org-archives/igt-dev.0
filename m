Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26BDE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 04:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692F510EE9C;
	Fri, 20 Dec 2024 04:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3EqaRGr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1544910EEB6
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 04:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734670713; x=1766206713;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gejRJlbxhvRhUpJeD2GTTCxU8U5P/Vg+7ammI1Ta6gY=;
 b=D3EqaRGrjC3CNGfhEj0YNt+b/3SzeC6EPhBBL+IEhkMvvhyBbQI6ZTGF
 IwPRyDMACmWyclqP2IFBdRToMjfnxUfGDi2u8pjaI6I1ldLFFI92eMXmE
 tTfjrkPvgou6f0wa2Hc+NotCIG5CZRooWWfkoIPMJKuVL8m29Dmd+sg+5
 LvpWHxPjjwnHZAfFU4KZfMh9+ZKfbSsC9vpLqtjRfKcmRlTFIqeSgx1b/
 EDhUTx00G3NliohvpuQmR4ciiS88/0o37ahM0vzm0R0GfRQUOn3cEYxix
 IhWyIuB4x/DaNPBGnj116vIplzExPxED7s1DrTtjZNDBWj/NhEH9aiTvt A==;
X-CSE-ConnectionGUID: VlWCBiz3Sqeh4vGM1T3DKg==
X-CSE-MsgGUID: B9k3sqWMQtC3zPm9kILTDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="52619422"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="52619422"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 20:58:32 -0800
X-CSE-ConnectionGUID: yeSFDfTfTeKTQ7bvivcLXQ==
X-CSE-MsgGUID: ssMBrm9ARZyBWncE3BFAxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="98243388"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 20:58:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 20:58:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 20:58:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 20:58:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OD32a4/cfaJ/1F1FIiHdUfXhW8gMSThHdtsb/cpDcirn4d1av3I2Gffvtc1iXIyNXkt0jgt4ZHxWU5Of7JhDtMvfq57dmpypXWGdtyQ6mra1DPVb4/QX5rgE0F5AP+DeJ+zoKNzd0JE9TPKHpyHhZOlfm/faYQOUxRaYXzCrfVy5uZeGiLCwJHrd5ZT4jyBH4U2wfme2V0V89iwNUoy2BUknUZjUlTdqRp9vxW1ADQU+ZzyGJItQfCHlKbKR8tD0QUHW9GTGXMiWLqrY0zgDMEohaapZf1koceBu5JkJE844Krwa27a6bbM99W9dhRR4MwzHv6Hah5BwKB6Cv3UQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47wBcHy1EkTVB2skYgsX6wmF4c1YTxeiKpd0XpcCFMQ=;
 b=ut5rwc+cSdWVlibUy49+QjdTZjbHpTuZswTS6YNB+niRVwvDTSG4EzTIVfDa4qrre/tctqa5pPaX65Ciez/ZOGo2hpOifmx6CPAwfLf18iMwWm1oYidXuyciG2iY5r9tJQnRJ0gk29C604W82gS4wHpad7nPAaTUQC8lq2JQ3Nj0TW+wVabX7R+dAcY7Q5TkfG66G9ClYwE42R4dAPKYLdcZmL2Zxtk72Wppd40Uw9heFqhVLJTQU3V92PItTGqR2rv/oqMuwUmy8u5CYnyJ3BUlWOwB1ysKaqGA0xTpi7Ms1QpfjhRuT5+Jd3o1PmV1uHGd0O6/MwyPAgrmz4a6Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 04:58:19 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 04:58:19 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_flip_scaled_crc: Add more logs to
 skips/failure
Thread-Topic: [PATCH i-g-t] tests/intel/kms_flip_scaled_crc: Add more logs to
 skips/failure
Thread-Index: AQHbUo92mUR0mbvHVUOhp5Gd4VFCQbLukcNg
Date: Fri, 20 Dec 2024 04:58:19 +0000
Message-ID: <DM4PR11MB63129FD1CD1FAA4DD713A4FA90072@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241220033042.2394330-1-pranay.samala@intel.com>
In-Reply-To: <20241220033042.2394330-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: swati2.sharma@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA1PR11MB7062:EE_
x-ms-office365-filtering-correlation-id: 7590970c-a754-40fd-8ef0-08dd20b2ec05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?HiORob4QuWyppl1RBtRnlvJ/7MgHq/A3ucID9BMCKlnmP6o3jdN/oNwGX0nP?=
 =?us-ascii?Q?Aemk/y9TDq8jwloM4iIM9w3A5Ar9fezBG0PuZ0IzXV4KnyoOqHAhrUBowyqm?=
 =?us-ascii?Q?eMg5rHaf++akin2Rc5gqdI0ndokJk0p2h/FYJUY8Kli/vSmI7E0vqPJJpw+z?=
 =?us-ascii?Q?9cn2+pnK/8rO6fBF5KG+EfFw+OMM3tICy18KGRUeGgod6Kw+ShQnBRFcbWKq?=
 =?us-ascii?Q?KzGAzLjuKwILznYrZ27kt/NthhMM+Va5WjiMr2anJwHiz0hKKL/2HDTwdNDb?=
 =?us-ascii?Q?ZuQ6duCf7ZpTJL9OHh7NyhJ/xIhEVcpMi71tab/4x3p+702i8Xol1lHvOVfZ?=
 =?us-ascii?Q?+uHh2nqnugvxw3dGvla/IPR37bYE0ZgS+D8yv2GJ2nUqSglqoerfYunrSbNl?=
 =?us-ascii?Q?dSzaOQIfXB3ReZjDM5TX28FYoSsctMDHMF/mpXrUINvCfIkzCfEXWqlF+KvG?=
 =?us-ascii?Q?MXpGjLymENcFcTrGk0Fy3sVXxhokZu+47rFf6DOEBrlfchshIbRsYl9yim9o?=
 =?us-ascii?Q?aqfzwyk3B90/nen7//v/Xc2Xy+bzg4Hfzg1z1C1sE8ZtXADN24Wd2tCWjMWD?=
 =?us-ascii?Q?HdIxe3n+CwD2Q0DhV4X5fq2qof4wbCZNYndvwIAGY6vwC0iKG+OfjMSpAiu6?=
 =?us-ascii?Q?Eda/KRwgLgzDVvLHBIH+Wa0vhPiSW2vLbMIuCMgFcJ4kPWyHELlgHVAzrRpe?=
 =?us-ascii?Q?Zbna2R4pKF9mdDveM7XHROGtR1wwxEshKq8WghKM9AlAOuJNb0InxVEE4HkW?=
 =?us-ascii?Q?d8JxNacMVAyEtSH9Ez9ZWWvl2awgI351CioORESK3EZ7QZpf/HZvxoC2rzL2?=
 =?us-ascii?Q?2jssncKQ9aDPqKCuLzwY49eI5BhrjAZ/o2tTUhGM7kmpdfvnjcVxx9xs8+/P?=
 =?us-ascii?Q?I+ZRDM+50DI+TcYUBkXOYLo1FfUUNLOaJS0Nro/W8VKCgixhF7umAw0MOo5z?=
 =?us-ascii?Q?1cpn8QV/aCsLqv7D/VP+axSSQ2u7340Ydz7603hM7twKBO130uX3sfdwyNqr?=
 =?us-ascii?Q?okU+WBNYNpzm52BLuvy3/oIb+zRntjKMTR8JxlNVNjxCLkf2LVx8DgRZoYnL?=
 =?us-ascii?Q?JGrycX9EA5FahCIExq4NnU7icH+sugFjQQY52tnaDGx4nxCBtyr2itmeh47B?=
 =?us-ascii?Q?KSi3p6OurjGm8GcDlHZe/rYKMgxUlAZTeDFxJykhGVVAPYs3bXDEWyuI3SnY?=
 =?us-ascii?Q?hYdkGE8MM1Ifsg/WO+ZXHQpdErEa6lnlRcsk/8QD3I+uel+q5QuyMUAVyC4D?=
 =?us-ascii?Q?tSz6KGx9SPCWgE1rsv3a6LsmB8z2Ubhiy0jgOlKocD4br0/fNaRyP3LAyIIO?=
 =?us-ascii?Q?5Oh5N8UPoTUvP98uXzMgjndSG0B6phY/ThiLvVxZWXQth9WMCVUojiBoyNbI?=
 =?us-ascii?Q?yXZ7tk0MvAo5NJweDbP+clvX4qAmh0g9d4J/dmVjU21mvLz/eOPE/LebHARA?=
 =?us-ascii?Q?9qCqtCGs4Y6GRV5PJv64whaKotLkmdeR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jaJxtBSV1BN/qa8xV7pcEdyumn5y1UH49RQT+b5IN5M9vOEVa2ai9PihWmos?=
 =?us-ascii?Q?0LPFhlIPBNtmxxDvQe1KxXdDlhRvtPHUImReiygASYcQvIdHFIswrbDEFy7j?=
 =?us-ascii?Q?Vkazr+6y9f8gce4pZdPe5c72ZrDd4tKdkSdm9wM27jSU0E37dddoxyfm9O4W?=
 =?us-ascii?Q?/nJbedqvab13T4nN4tNDvFUAjxzeL5MmFahgKiFNOnUK7aPLM7sWiRd5+alN?=
 =?us-ascii?Q?DLtRVC7bcmye1r0pkmsajLYtmTeYcPo466jBQ3sUsS900PgbFFiacNE/aLCV?=
 =?us-ascii?Q?1MaX6sr6KripqzYk2OYXFjnUlyWJglehOpgS2KjLt54T0NBngzakPzmQft47?=
 =?us-ascii?Q?2im63dcIgqX9/wz1lEVkkxPIhkH4zhi+W4KyDeNlZqNEZ0atA571j47pbukH?=
 =?us-ascii?Q?/Uk0H9BEYnKRKAcNYcmaqbG8ZfiDenrHTif2aWuo2HW/due8reCE5pK4hPeN?=
 =?us-ascii?Q?x5dOBzKUdE07KaDRdfX02cWfwGnneQGJu+TK+p9qHcmABmHxljDbpfYGmHR2?=
 =?us-ascii?Q?OBwDi3WbjRFSY3j6t7627LvzHKkfH+IDYz84VSO/zwq2UReqLL/fNJfdOemi?=
 =?us-ascii?Q?1jWz/burCxVyyoARHobBwkPwk0CQ2rfOUl8xj79U2A+uOVyQ4Ne46WXkc/eI?=
 =?us-ascii?Q?8ncCsOjgyNeNzo+gnUmArsf0h5pKtJ8Vb/8hNT9Ac/X24taICeINj7FK08tp?=
 =?us-ascii?Q?DfaE0z97+LOVQ9JdqIUIntQHokX03K6xCXRhbL36R6R2LSQF5wasPbXrk0QF?=
 =?us-ascii?Q?u8JYF4FQoDmnELBkNiyneZKLy6tU1t5n96p9VqqqWS3jP6UVzB6Qc7FNArk/?=
 =?us-ascii?Q?0oSFXX2tckM65WvmistpyEHeL2pBiyrfuCE6BRmqzxnbOIZWExy4sgV/aBeU?=
 =?us-ascii?Q?TBAWEzzrWI9UhkhhA7ZRgHlQ+11Mz3k6wZZhsdDqXaTPGHIjPBaZLpHqY3n1?=
 =?us-ascii?Q?FAoD61qRCFWir3OgbVnzZ26LF8k8B/FDWicjA8TJ/6OhmUbwq13iSvjALdlV?=
 =?us-ascii?Q?LM016iZDlvdQFZe7gvTphX09/htPjoMz3mnZvterXKI8TgKIbfLs3FKHdoUs?=
 =?us-ascii?Q?FOmjbhyV/JGZpoOcLFZkNWm3Y+gMA4dMPh907lkghuqkXqK0UYA7MGASu0Xr?=
 =?us-ascii?Q?MdF6khB532Sg+g2Q+D/nXVlpJzvwBY/9ehMCgewS/mUNKCGydZXZJFeu0Wvn?=
 =?us-ascii?Q?bKkEWFu5tyUhp2NzkTnozcjnNuRjsbTRQyCuPp0iq50C/VAH1br2PMjWzt39?=
 =?us-ascii?Q?U6h3OJ9M1rL8XsjB4iFbK90UlAdX0qFJ1OCGk4J9VKVmbZ+fwgiVojvmRS/n?=
 =?us-ascii?Q?Nlu2fP/jVUD3vM+LIpZQdQWCx6hwrphL4AsWJaWhpO3XnRzPYq2p/OlE8h5l?=
 =?us-ascii?Q?CDA271TH+EMwHdZcMcqorsLv1J3+drVXFl2k/BmigqkOUYZwI+Dai31yxeYw?=
 =?us-ascii?Q?84XqwDUENrRL07fEbPGSrQByM9qPSg6POGfBPTg7wafDa0GHrFrlhFwQgwzx?=
 =?us-ascii?Q?xPEZE4gcb67WmlZKvadMixIQTm/FWSl5geH5FFxMh+qk27xb3OTT0TKCeRwt?=
 =?us-ascii?Q?eEND8kWycYjhALXbnSw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7590970c-a754-40fd-8ef0-08dd20b2ec05
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 04:58:19.1896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8lfl+wmhWrEjofyoGYoHPwJl9TftMveyibAmdi1YNXJPVAYfg4VPQkJN+eHE01UAhtEnwo29AzdMqc2UQ3AeMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
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
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Friday, December 20, 2024 9:01 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>;
> Lattannavar, Sameer <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_flip_scaled_crc: Add more logs to
> skips/failure
>=20
> Having some logs for test failures and skips would make debugging much
> easier.
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_flip_scaled_crc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_flip_scaled_crc.c
> b/tests/intel/kms_flip_scaled_crc.c
> index 7dc07bc83..7c66ce398 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -633,7 +633,7 @@ static void test_flip_to_scaled(data_t *data, uint32_=
t
> index,
>  		igt_plane_set_prop_enum(primary,
> IGT_PLANE_SCALING_FILTER,
>  					kmstest_scaling_filter_str(flags));
>  	} else {
> -		igt_debug("Plane scaling filter prop not supported on gen <
> 11, running with default\n");
> +		igt_info("Plane scaling filter prop not supported on gen < 11,
> +running with default\n");


Is this check really failing the test so that changing the log from warn to=
 info helps or is this just a note for users to know ??=20
@Sharma, Swati2 please comment your thoughts on this.=20
From me this change really doesn't add and value. Its ok to have I think. =
=20
>  	}
>=20
>  	igt_skip_on_f(!igt_plane_has_format_mod(primary, data-
> >small_fb.drm_format, data->small_fb.modifier) ||
> --
> 2.34.1

