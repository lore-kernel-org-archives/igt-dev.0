Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75635FCC9B8
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 04:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF63F10E646;
	Tue, 10 Mar 2026 04:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQz66qRe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C316B10E646
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 04:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773117793; x=1804653793;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ihb4tdfFVgRaVg61h504YU/gFgJ99QImege5KDqfwfg=;
 b=JQz66qRebcC1fMxPg60+QfO7/ltnH9vlKV8JtVaOxafIjZiAhCqif0OH
 Mn5I184Py29KfnFo+MHoDd8xxIjblEmcpQFQI7t/MAKKv018BhoahNGNv
 xVjV9o5qWoRSqWQxrUeiDc04tX+GhUlFU5Ab432oun4tpKMN8+jEf4rT6
 mBzwt+rn+8QWW/MKLk7Wo43hjoLZ3Ai9JMjRm04vU7YuMTNoX2Ewvj5hz
 IOVZkLbCdAfYrBgS3b8egVFoMqg+K8wm7EQhnJ3OaO06Jtr140pcKmx+t
 Oi3NUr5q1RJN7bF0P0LtsCQCetpea+GfoBH8HXx1MoHYTPin+hvo5qh8Q A==;
X-CSE-ConnectionGUID: +cMKlMIMROSYFw20NFK3+w==
X-CSE-MsgGUID: iYTQRRKMQPSucNtsnW2NdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74269928"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="74269928"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 21:43:12 -0700
X-CSE-ConnectionGUID: ffglYncFRym/CVARfNVZLA==
X-CSE-MsgGUID: IrZ3AI3bRRODeA+pMLv6Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="224420972"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 21:43:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 21:43:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 21:43:11 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 21:43:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TY0PKaoMYg3Lbb+4XLhipNMatVVynTrtg1YESxFNrhd9lHoqJJmQ58HjaNVDSYQAhZryLYaUOLCVApg+uZ6QNtsE58yLmwuafSvrOa/pKH3M6J0PWM08Hw5sHFuCJHQMZHia0bmPOLDztUBfH9KK1ksEdZDxXCVzc/MyTUV55hGurnOFUJVJDFIsYDIPbuMFtSVgIvKQ+EUl/Er2+9KMt135SGEEku05/uGRf7Obp55LXkL6/7PNPhlGLfvZwIbFzoDi5+/yqxTQhPprSrB1+aof3spCZi/1B6BZ6QnyQZNUSftINA0VVOwZgqa3g1tRdBO0RMh/L8CjSJpmwa8RDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CElKqaWpElCJTIY7vcBCpxHZpPs5nGNzNn/TmtFYEXk=;
 b=Z2FLA4hHYA8dLHBf6Vf1bf08BD6PRtGampzElqjs30dzmoux39VR13w0JrO8MHrPRDEDMmiUxw+nCTWzACWy5Udnq/9KEYZ0dBejZkQ1rTbS59UKkskl/Y+mlCIXieRi2huRv/wkNBx1Pd1fFI48KxjpigTjLDaqPlcUeBzAEPpbyUrdcz1KHR0c4aTuwhXfSVZcL+znDznei2kG75Tndt8CSOZ7mGWWa8wp3TQiQDmSxfG7kY9LomIjEAU301kVYtNCB463LrnVBbApNQZkK1Mg8T8Vef9gM8AtxJszSatxJ4F4ZT5M4+wv1bKWJ55bjpjHod3ldyD18O6/oq9Lig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA1PR11MB8788.namprd11.prod.outlook.com (2603:10b6:208:597::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 04:43:08 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 04:43:08 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brzezinka, Sebastian" <sebastian.brzezinka@intel.com>
Subject: RE: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
Thread-Topic: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
Thread-Index: AQHcrIMflbF2cmceQkidx9BMuUIVjrWl8Z2wgAAJgQCAATrVEA==
Date: Tue, 10 Mar 2026 04:43:08 +0000
Message-ID: <DM4PR11MB631239D62A96477BD1FCF6A39046A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260305093025.3107101-1-mohammed.bilal@intel.com>
 <20260305093025.3107101-3-mohammed.bilal@intel.com>
 <DM4PR11MB6312FBDCA175D13650AD0EFC9079A@DM4PR11MB6312.namprd11.prod.outlook.com>
 <MN0PR11MB60341CACB076517AC25B5E548179A@MN0PR11MB6034.namprd11.prod.outlook.com>
In-Reply-To: <MN0PR11MB60341CACB076517AC25B5E548179A@MN0PR11MB6034.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA1PR11MB8788:EE_
x-ms-office365-filtering-correlation-id: 46be2480-5429-4f71-d28a-08de7e5f8732
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: txcP3dhEa9NpSpo9ge5C1lWv/dam2kpdECzr6eobc4JeXEaXreoQF8PWERVentLxcCMjSNO7ymkLFooaiKIFyfug8EkgpVUYXIdhdmbOEQ0jk6MxJdk05DEkv4wXCCydPFgwEee4jpYCs6CvNe5EoXyilrLHiEziMj65VlNg9J2gzibqEfM86PmGRQ3hIS6DvAb6TZKstYwntTmmS9c4slVx4eO/y4llKPaxQE2JBBK87Ac2Ho//Tkh375bUUtI7jsiXMeCJYiEbiA4Vwidr+LcTcZuHY7Y+1orCLXSrae5AaHJekRlnX91rfgyQTwF35MVzc0zhQy0dcgy/niNLbzSnjJ9Jf/uwoo8j9FzZF6gRUolVXzL3xTNsfvcy1hMO2KUMX5JwFsidpRQ1sCMcN7IWiJUo3i6WvIOAIUpBHxxwHAiuU04SvDEwERBPboezOIf2J3X1NU6VCHgUZlAhLHcTOH4GlseDeJmGvn64j4eX6vItGHsuOlQc10GgpLohXSLx2+tY5vb+LgJxMU0LwLTUQmb8WtQl3KScsbmFYYUnfOupML0ns5KjTNiB0xOV/RjBYpoWzK4Gm/xgIb3XqnN6LTH9BkQrq5eKX9aZuKZWD/xcrHSMEqUp+F7UoNZwsq3P6QaumrKWgPJ/AWQruz+myDGyv5bk7UkwCxtLT6MLcB2SKf0hSdgqTiDBK2bR8H5AuLijJ0BUAO5nikJWhUswUl2FB2hHHh9Yn6tJeEiJklM041geSGeJOog8ZAs9gj8uLuXCBkRPFnZxfNQbB+IYxQRDSA9iVqzHd1WgRRk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OgYmePmE6MC42f3OH7waLHogibPf28td3AVsfh+jYAfnzaOVB2ellv9uklXj?=
 =?us-ascii?Q?SxEQSowh8UDzG4c4YC8VRPAqs5RpBPw8EkFExKfisBQSVFwUzwXwh84r136x?=
 =?us-ascii?Q?WEPpgjpuSrNh7Zo7CktTneeP8vBf94D5NRmXcQrZKozQfkYH0Aupfh6TG63T?=
 =?us-ascii?Q?+c/F9iFovumquAJg7TkmkczRFfr795U+fJ4A5x0X6HFosVKmIA4XOR7Ihbss?=
 =?us-ascii?Q?a6sxH6J/8usioGhrHwF6/oWvGXe6vupDEHjsfxFKjGs5aNXGQCJm7Mof5tE8?=
 =?us-ascii?Q?NUX7UOCdWKnSgymxWhLr1df8zFsNoVr6IeqGsvbM5NItLATBM9Ex/0SApQoS?=
 =?us-ascii?Q?UJrT6vgPzRRL0/+lKKjm1fNBqoidM4sQd96DIIYvz03r2kVPdYUHm1NaD/bz?=
 =?us-ascii?Q?YYNOLgeJ2+3Tunvs8qVSj0ViHiplc0ot+fTMMjyHySUMxpgPWvxrFrs+Rqwy?=
 =?us-ascii?Q?Z1bpcFxGpkRxZmCuukZk4DLd7Q0I+prjb5qD5LuB0D+bBjGK7YsMisIlcFVV?=
 =?us-ascii?Q?3Koyog32gHzQ8m9dUNDxb8rH+M1tyGbUsfGGhLgqU7lp+TnX/P3K9GePWBlr?=
 =?us-ascii?Q?MfXdqXb/TlI64wjGigxOHY2nxUs4yy3zc9b/m5Bcjwos6WrXJoKQoxg5v8nG?=
 =?us-ascii?Q?BygLb6jRaUGsR6jpHd1vchfLtl682vJjtK6/HWpUl9AmNf33V/TkzxsiNVbJ?=
 =?us-ascii?Q?TEdPomNnkHwceG1UH985RSGcYqVHKE1QwaSn0tNkUt8w2l9X9lF9H/br9+uK?=
 =?us-ascii?Q?m6ephipkPqK425+cpcj4+ycPFrqqn662zunnYAdbOdZ7PiRqUPbMK5SInj+Q?=
 =?us-ascii?Q?LjLIDPLByMo4fesHFeyJ1RFRlnflIoGtigypv/Az4B6tbJb8IKdfXvil89E2?=
 =?us-ascii?Q?PFpPGOJARLwyf6nEUnEeqtXiQhqPVH7866sOTnvtmrXQqiP+P/GaIaj9exMD?=
 =?us-ascii?Q?G5/VshiQ1hw8+pbFEzy/g3s0sLiha7R6nmm+Agy4UYsgRHj9mhDelbm/bpuY?=
 =?us-ascii?Q?4RPgtyp1zFvnwXtSxc/XWjuf5QYiOInw2jjx+DsXAHdkZEFuG0gAPIUbQhJe?=
 =?us-ascii?Q?1jfNsR11ezw1HT1zKu1T0e29hawDisPwoCQdPNB4u/QNhWEsViuYTZv/zJB6?=
 =?us-ascii?Q?b66v5OPu9UU8qSKgf9PkTN3CLkong3e7UK6AlaOAo7elQ/MzuJn4TdusaQY/?=
 =?us-ascii?Q?oUqs/WhKqu8dqBylsb4ZaLAHLuZH219JFWs8mZnhDxJx6LMPf5A+Jau3Px+8?=
 =?us-ascii?Q?YADOVZ56IGdxo1DY74eXSe0LacQTKg9MM1b42KhfsC4ZqD61ozXU5XTLVBCS?=
 =?us-ascii?Q?pcxIaIk6tz0zhXAdLmYfEAj+FjZJvaD8AmL4W7deAhHfvUVJeaQGEQ8roP/4?=
 =?us-ascii?Q?zHGe51Dd1QO/4exx6+3OyrhNlGKp7kGWaFKdjf2fa91YbCAeKuleGkYsS+3q?=
 =?us-ascii?Q?R1H6Yfig7JBbWf6euZdxSRYx/ppCWW4WQA+pgwoR2tzEDtkzx0/fQwCywF/q?=
 =?us-ascii?Q?lltjT4VttyQPXqq4S1VwK2Nwmb817cG+i34R18T09LTHR5sGGBoKj4yIxtlL?=
 =?us-ascii?Q?RPIMvU1PQFYECqEgK95lOsC9mzqRNbqImj7VEIsjmBpqSRH5CS0WDue4+ROM?=
 =?us-ascii?Q?EwQuuHiF2nt0jqMVdmwqEpojl0NfFKht9LdncitDiBfBuHsnFYcxXGzlcfpM?=
 =?us-ascii?Q?qKmQwPNIA2IVY6TLcVF0hZgyit2GFwczRj3DkHcL/7++wvLR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Y2J5LmLcwhFeudcKfy18iN4yDKUMxonyeppYwFtYPzAx78Z+0Y1ZjEHCDDPqUlJzSQQiHF3Y/dXh3L9nPwCudhWqUbWSyHmJI4RQ9hQURXsHVuoAB8SnaTKkD9cn4Z8H8i0ywnJ5Z5WQ4p8RH3JxUVLM4HME7DP+uDDOfenYIb391zdQj11pl3uV14GnzMl4R7oK0GpeZcGPbhgD8x0qL3QlbB+uuOrMla5YTRH5D8NQBdkcq0O9CkHn0tj0walwBM1F4spxFffE8IbqWH7ACrb4clstxsToOqew062xWoN5TB5yWJQDm/QaGPI+L9rHngRDjR0uWSTgkuPoJzua8w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46be2480-5429-4f71-d28a-08de7e5f8732
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 04:43:08.8109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AP2FZ5a/aGr6zZx/Vt4m6eboqKRiQA4KgIgFQFzKrEhoUUDElzNowiUdmjEUQsFekumQD+1WEOHyoxZepaoyPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8788
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
> From: Bilal, Mohammed <mohammed.bilal@intel.com>
> Sent: Monday, March 9, 2026 3:20 PM
> To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Brzezinka, Sebastian <sebastian.brzezinka@intel.com>
> Subject: RE: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
> assertion failure
>=20
> Hi Jeevan ,
>=20
> > -----Original Message-----
> > From: B, Jeevan <jeevan.b@intel.com>
> > Sent: 09 March 2026 14:53
> > To: Bilal, Mohammed <mohammed.bilal@intel.com>; igt-
> > dev@lists.freedesktop.org
> > Cc: Brzezinka, Sebastian <sebastian.brzezinka@intel.com>
> > Subject: RE: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks
> > on assertion failure
> >
> > > -----Original Message-----
> > > From: Bilal, Mohammed <mohammed.bilal@intel.com>
> > > Sent: Thursday, March 5, 2026 3:00 PM
> > > To: igt-dev@lists.freedesktop.org
> > > Cc: B, Jeevan <jeevan.b@intel.com>; Brzezinka, Sebastian
> > > <sebastian.brzezinka@intel.com>; Bilal, Mohammed
> > > <mohammed.bilal@intel.com>
> > > Subject: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
> > > assertion failure
> > >
> > > Fatal assertions can bypass cleanup paths, causing resources to
> > > remain unreleased when failures occur during audio tests.
> > >
> > > Replace fatal assertions with non-fatal checks and route failures
> > > through a common cleanup path to ensure proper cleanup.
> > >
> > > Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> > > ---
> > >  tests/chamelium/kms_chamelium_audio.c | 42
> > > ++++++++++++++++++-------
> > > --
> > >  1 file changed, 28 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/tests/chamelium/kms_chamelium_audio.c
> > > b/tests/chamelium/kms_chamelium_audio.c
> > > index 2967e3c50..201be0ba2 100644
> > > --- a/tests/chamelium/kms_chamelium_audio.c
> > > +++ b/tests/chamelium/kms_chamelium_audio.c
> > > @@ -389,11 +389,11 @@ static int
> > > audio_output_frequencies_callback(void
> > > *data, void *buffer,  static bool test_audio_frequencies(struct
> > > audio_state
> > > *state)  {
> > >  	int freq, step;
> > > -	int32_t *recv, *buf;
> > > -	double *channel;
> > > +	int32_t *recv =3D NULL, *buf =3D NULL;
> > > +	double *channel =3D NULL;
> > >  	size_t i, j, streak;
> > > -	size_t recv_len, buf_len, buf_cap, channel_len;
> > > -	bool success;
> > > +	size_t recv_len =3D 0, buf_len, buf_cap, channel_len;
> > > +	bool success =3D false;
> > >  	int capture_chan;
> > >
> > >  	state->signal =3D audio_signal_init(state->playback.channels,
> > > @@ -426,9 +426,12 @@ static bool test_audio_frequencies(struct
> > > audio_state *state)
> > >
> > >  	audio_state_start(state, "frequencies");
> > >
> > > -	igt_assert_f(state->capture.rate =3D=3D state->playback.rate,
> > > -		     "Capture rate (%dHz) doesn't match playback rate
> > > (%dHz)\n",
> > > -		     state->capture.rate, state->playback.rate);
> > > +	if (state->capture.rate !=3D state->playback.rate) {
> > > +		igt_critical("Capture rate (%dHz) doesn't match playback "
> > > +			     "rate (%dHz)\n",
> > > +			     state->capture.rate, state->playback.rate);
> > > +		goto out;
> >
> > After goto, the stream will be stopped and the test will continue. The
> > test should fail after cleanup.
> > We can add a flag and assert after cleanup based on the status.
> >
> > Thanks
> > Jeevan B
>=20
> Thanks for the review .
> If you look at the code flow, the failure is already handled through the =
existing
> success variable igt_assert(success);

I think this assertion is triggered only after all cases are verified. If t=
he first case fails, there is no need to continue testing the remaining com=
binations. The test should assert as soon as the first failure is detected.
>=20
> >
> > > +	}
> > >
> > >  	/* Needs to be a multiple of 128, because that's the number of
> > > samples
> > >  	 * we get per channel each time we receive an audio page from the
> > > @@
> > > -447,10 +450,6 @@ static bool test_audio_frequencies(struct
> > > audio_state *state)
> > >  	buf =3D malloc(sizeof(int32_t) * buf_cap);
> > >  	buf_len =3D 0;
> > >
> > > -	recv =3D NULL;
> > > -	recv_len =3D 0;
> > > -
> > > -	success =3D false;
> > >  	streak =3D 0;
> > >  	while (!success && state->msec < AUDIO_TIMEOUT) {
> > >  		audio_state_receive(state, &recv, &recv_len); @@ -460,13
> > > +459,21 @@ static bool test_audio_frequencies(struct audio_state
> > > +*state)
> > >
> > >  		if (buf_len < buf_cap)
> > >  			continue;
> > > -		igt_assert(buf_len =3D=3D buf_cap);

The original assertion ensured buf_len =3D=3D buf_cap. With the new change,=
 you only check for buf_len > buf_cap. Therefore, when buf_len =3D=3D buf_c=
ap, the code will continue executing normally.

> > > +		if (buf_len > buf_cap) {
> > > +			igt_critical("Buffer overflow: %zu > %zu\n",
> > > +				     buf_len, buf_cap);
> > > +			goto out;
> > > +		}
> > >
> > >  		igt_debug("Detecting audio signal, t=3D%d msec\n", state-
> > > >msec);
> > >
> > >  		for (j =3D 0; j < state->playback.channels; j++) {
> > >  			capture_chan =3D state->channel_mapping[j];
> > > -			igt_assert(capture_chan >=3D 0);
> > > +			if (capture_chan < 0) {
> > > +				igt_critical("Invalid channel mapping for "
> > > +					     "channel %zu\n", j);
> > > +				goto out;
> > > +			}
> > >  			igt_debug("Processing channel %zu (captured as "
> > >  				  "channel %d)\n",
> > >  				  j, capture_chan);
> > > @@ -489,6 +496,7 @@ static bool test_audio_frequencies(struct
> > > audio_state
> > > *state)
> > >  		success =3D streak =3D=3D MIN_STREAK * state->playback.channels;
> > >  	}
> > >
> > > +out:
> > >  	audio_state_stop(state, success);
> > >
> > >  	free(recv);
> > > @@ -587,6 +595,7 @@ static bool test_audio_flatline(struct
> > > audio_state
> > > *state)
> > >  	recv =3D NULL;
> > >  	recv_len =3D 0;
> > >  	amp_success =3D false;
> > > +	align_success =3D false;
> > >  	streak =3D 0;
> > >  	while (!amp_success && state->msec < AUDIO_TIMEOUT) {
> > >  		audio_state_receive(state, &recv, &recv_len); @@ -595,7
> > > +604,11 @@ static bool test_audio_flatline(struct audio_state
> > > +*state)
> > >
> > >  		for (i =3D 0; i < state->playback.channels; i++) {
> > >  			capture_chan =3D state->channel_mapping[i];
> > > -			igt_assert(capture_chan >=3D 0);
> > > +			if (capture_chan < 0) {
> > > +				igt_critical("Invalid channel mapping for "
> > > +					     "channel %zu\n", i);
> > > +				goto out;
> > > +			}
> > >  			igt_debug("Processing channel %zu (captured as "
> > >  				  "channel %d)\n",
> > >  				  i, capture_chan);
> > > @@ -661,6 +674,7 @@ static bool test_audio_flatline(struct
> > > audio_state
> > > *state)
> > >  		}
> > >  	}
> > >
> > > +out:
> > >  	success =3D amp_success && align_success;
> > >  	audio_state_stop(state, success);
> > >
> > > --
> > > 2.48.1

