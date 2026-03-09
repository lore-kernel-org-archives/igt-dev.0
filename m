Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9859BEFCD73
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426AB10E4C2;
	Mon,  9 Mar 2026 09:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRHInzui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A910F10E4C2
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773049794; x=1804585794;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=07IEt/85jYzu1u34qkuJwkjulKUsvFxg1eLB3RPLgps=;
 b=YRHInzui9w0sIOQnO+RACmkCMWXjsY+pw1ApIObJX8amfcGRyw70YKyE
 Es7alfIk3dei/+F/avC9qYLiwMUDcO9goJOfmMHDzOZzfRZg0JIOkLHrd
 rUrzo5y+gBZ5gQLEESTYvD2SdSs95d0cAELQxRL3yEpDzrP71y34UbNJ+
 DeQzrEMP0A5zUPALftV08iqO9Ke5Y075AHs/yMcarw55g17Ev3/7DUWMc
 rOwnXMoUA1IV/0GGoFaEoZbUwnZ4BJh0knZMOqXaex0oSOfHce7fHYdCf
 nRCQuVQykv66q1tcB3IqmjzHXRRsSoOpNQMXyIdJSLDuSVirR6ZqhowNX A==;
X-CSE-ConnectionGUID: ovQJ8b4XReifAWm26ydcpg==
X-CSE-MsgGUID: rNkF+TFOTwy/v7O4jPtMjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="76670426"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="76670426"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:49:54 -0700
X-CSE-ConnectionGUID: i4I7x67/QyGaOp8BbOVJYA==
X-CSE-MsgGUID: fDuxLWfETNWuDbrQYd/OFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="217316473"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:49:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:49:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 02:49:52 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.40)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:49:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyHQ+MefrXqPSPBFMAjGGRj450ckOY93GI9p/a0pa9cFB42Cmp5sZpYPCocnXc88fwbv+nUNiNCwEKaM6dlJG+g+P7aor3WsS+kwbPkqhHJ+qija0GN9bmmLNl4aqSZqyESRHv1IeRplG8GsPCyhfoYof4GBkQn/rVAsGCOtBgfoK1gXHdtDEshKJbSeHTiBfZOcW8+xFUEI7CoR/17G65kB76BtvtLmjwCLcMaaeRSN/eVy0AYp+mMcoHZ42mHxpn/rkBGw7nIqPwT00Qf27AvSleQ0UddY4Ao5tBpBdp+AqE9GJfQVuVmK/fKZH+PPu/ZB+B52POADI/Z54k192w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ty//yooNM5HukfPRtdOndJnlVKJMlSYK3AbmB/G4erM=;
 b=njNPQ+DJNDko21XctehSRFmUK1l+RLQv5omxWmxkD0DB5+BmvlBpAlQNprBNXYUu2k7sO1VzQx4Ei1ZhHajPjjw13BaL/mQUcCb/ldlf/+d5/TD9ZWowMGbGM4ngKgxdHYMynaiNgupgoTkj2Pdl0KGy4zN7eXqUEIaqNkGOp4gpsjS5KttMbtRoQSqJM22V25fltWvWy3RKEITCOke01SqUBzSNVSiJJlO8ikY/lyuU2dtY4R82A+04ch6zTzV5uxt4HwakAVnWwnbj17W2K43CfMQKxynCoC81l9Hm88ZGfCJDiLuyOM4nZFRlNWcE3a+78LWyoolTpi7/Pg25Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by SJ5PPF8EC896901.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::844) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 09:49:50 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%5]) with mapi id 15.20.9700.006; Mon, 9 Mar 2026
 09:49:50 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brzezinka, Sebastian" <sebastian.brzezinka@intel.com>
Subject: RE: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
Thread-Topic: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
Thread-Index: AQHcrIMfz/3MB6bA2EiTRrDZJ7K5FrWl86KAgAAF0IA=
Date: Mon, 9 Mar 2026 09:49:50 +0000
Message-ID: <MN0PR11MB60341CACB076517AC25B5E548179A@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260305093025.3107101-1-mohammed.bilal@intel.com>
 <20260305093025.3107101-3-mohammed.bilal@intel.com>
 <DM4PR11MB6312FBDCA175D13650AD0EFC9079A@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312FBDCA175D13650AD0EFC9079A@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|SJ5PPF8EC896901:EE_
x-ms-office365-filtering-correlation-id: eee8d867-6f0e-430d-01ca-08de7dc1350e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: B0ipIIZfy8mmuafj5QqKTYvPEZh2kRffi0U4kCMRwAIL+bvwMwaWgb/QxvB6clIoNDRENwVz/sqUMsJ/PSLaCnnWn3g2UkYlhFqFBdhHYyHs1Qu/A95sO83F0SOfCqe4eSAz7LbO5/7acqmaWjnSOeG6E1Ag/loiRu3npWzCBTAMzE2uVrzk+lmRuHYLMCkCJq/gEY8/RlTwcHdkszzLqvmiOjZ0phxRc/XM0bu4RV+Wia7cHNFqPD/jL+8k89drdrDrOBut2qWxV3Pmq2BpyDVOuuJAF2jfNSEs3YPmd4loeiTF0KsFYaM0OE0pWFl6fk2yONqdKvn3+Qq/tpU29T4ACSo9E8lcnWM1eSZfR4E9DqoDLY7k6x7ADCvXcmGAn9rReLOtuTdg18s4nrlzJ5mv8ogpzHzWJAfAO+91Wb1WM68uCRYy6rZM/PYOynPMJ2DCAkYkNt/OZV8ZnV9dHWo/elpv4X/xc/u3DhQ2vBVS4S0H4EvGYFm3wdA8ONpFOjmlxg4opeK18WU0WvnRh/5ea3HcN6QMi5a+ukWf2fO/tlbhjksnSjlrWaeWMmCp89JJIwAoPzgkyK3n8lz6mIhMLX2nA0w73RsOa3QbU6KNEiVtUjb8VgwuHHaArcP+PcKnTU/+7zGMCFU+DS6od9SGH1+A9pkLbXMqX1Kp9g2l0K7egAwZLcd3fHj0Ss0o4JvEtLhPlyEN4ZJKACiyrmSoXMeduo1tKiFsgLmF8k4Wxm2Cj/JdsiulXXUwQuw0RMvWShByBcEwE9YAVmLAMfQt5mrlP/GeJlt275Dc8QU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YX5d9gxdnIq3KRD7+h2kGEwi4fWIaFOIvlTIIk+FBfjDrgKL7d07seJa+iLc?=
 =?us-ascii?Q?FwTzBLvYD+9OydkOavl4SLDpnwF6Sh+2A+nqkw7W4sDVMtP3PXTFeWVr/8p9?=
 =?us-ascii?Q?f5t7mSiSHqBUhb9wNz59X832LRFb98bV9S/K5UX+bEAZOUdG81CtsT2xOCnZ?=
 =?us-ascii?Q?GrzBE4sDuPi7kjX27C8072oxUN6w76GR7BocCC6W9qzzG7LmHWqy+UmNXEJ+?=
 =?us-ascii?Q?sGWrquZE+kQEZoPhtOSzXt/7YFK5lI8X3bYr4KDhr573sli2fIdzdgzUcI03?=
 =?us-ascii?Q?/qAmfkMJoSV6X3yE/FJLLhzVeu0JpDU67yczZAtJppoDz5JsYghH0GiTM01M?=
 =?us-ascii?Q?p7BrSKiB4+BeSb/XVvZzFMk3LqdTSElb9y62ri/vzBJhvAPse+zjvArl0mLF?=
 =?us-ascii?Q?zrhDywvsvA36fl2zFUPv9KEM2If/Q+/6O/AKhW6MUldgIb7w+fb+A4fc1WyF?=
 =?us-ascii?Q?tZru+Bc/n8/ySbRGT0VsSBtveM/79soQt25eHWlgfYc8T0/Gu/uvqCxabkxj?=
 =?us-ascii?Q?dncToODTaM6kTpdNO2gII7BBQs+NYAg3CEh6msWHxclLQstabC96sJbOqmVe?=
 =?us-ascii?Q?Br+t0zAm3ahpFLtvLAOA2lMjvZf+oQJGRr4PnMCd5dOuL/e+Z5LDCF5Mga2z?=
 =?us-ascii?Q?hxD9CjFFxbLiTqZ0kabEg3cHAjRU6HjfutCmZ7wJM10dX6HiY5p0MG3ZUHhX?=
 =?us-ascii?Q?XNguuHQ+L+GQRZ5mK8DiwoO9ai1cjADGuN6es5A0ow135zTMC2RImsoTRE3U?=
 =?us-ascii?Q?B48DWRi2wz5JCqLq/DuNz1ny1MQd/u28yHp7FUknT4SNx4k5LKTNhmTYwpxV?=
 =?us-ascii?Q?Q7Oa9gAe6f1YmQ6NVmsaHpARayvBskNNSIc3S04Z+VWAA/9IYq8xNyTsE/Yh?=
 =?us-ascii?Q?W21Nas5wSarxHWnUkc3linTsRcOmZ3paZEfHdyuYSMW1Xh61EGQEMuL3fhzE?=
 =?us-ascii?Q?77Qwre4NKKsNMFDlRCootmgClsz64OEstaJTNlxbVJg3vJzqhspOc3XuY3u3?=
 =?us-ascii?Q?AmvIq5du0UYKPH4ppCo7Qt6nQuYjYF+j5QgFYQTVwZHSqul/9FJ2xZUSjjyu?=
 =?us-ascii?Q?heS81QQKCoco47M0UgVJRlNH5q+25Tx/s66O3Q39RpKUSVb+Je+4H1iihqKw?=
 =?us-ascii?Q?cNP1dBr3V6QnuYs/4PFq1AvQt0fHDcD1nFhi0/i9yAsmwHZ6LdwyZ8fz9Pmd?=
 =?us-ascii?Q?kFAAnLfPhQIILXNcqI8jaG2vn9Nlu1zmjdGHGHOKL8AGbqwzEj3SdB4KHvgB?=
 =?us-ascii?Q?hP1DzU1b3eIEXMWC9/0Ybjz2XETC5pxHN0SAhcpietbCggwlSYqrw9zUb5Li?=
 =?us-ascii?Q?jo0MFVMO+cU0ZjwP4gp7y3Kfr6IEdIeLkUANUQPdfq6zjWj2fLVtlPIm7l8j?=
 =?us-ascii?Q?Q+PcEvrVobxGTtga4kOnPXXUJvjgXBDyropJjL8EMBU5Y4Fn3u+NnEg17CYU?=
 =?us-ascii?Q?RAQbk57gRsJ1kD49FF3XOkjKZ+gNfFBEwaR1pQQ4llTlazlHjbJhSqaNzg8v?=
 =?us-ascii?Q?EGCO1YAqZHvRwG0ogGWJSbXKczjPz38swmvjwvA2fzxUF75y9y7M/XySRxHF?=
 =?us-ascii?Q?Lw9VoKkUPE36/2j9aPaq0gcZZ0G4MlfGGywJwOUZq4nctbQCAfpitUnZoyHk?=
 =?us-ascii?Q?4RyNpKO+Yi++dc9qwhu521S/HLI+9q1hC9WY9I2eN1w+7E1QkC2YBhtCljqv?=
 =?us-ascii?Q?YCYlxHktUmK8cJkp2RhIt94ll273S3bhsHC1Vn5VhmtahIQVJUav1rF0P8eY?=
 =?us-ascii?Q?0lrq+99DAQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q6ST4bF4r4wVZ86Wlkj2L3FDfBepdsGKZigjBBfAnO3PjUassD6v1JBzovr2vA1wkwR5RgW34RUSAlfyuoLOORfJins+4Uvg/R2uGVCgvzKCp0jZm1nlU+uxbjzWdg8SWnvg42Wq2qPUa321CR9cnDON/2Q//msN6AwGr3sHskotJ+yaz+DxRhGgDiKLIzR/Ad57xwNSlm01saCesJS6L4jUuIVZZ+AfI0NIELaybnl5RS1xUuvg+bviblx8rvxG1NKGflgCgga92ptZ8DrukEqmKlzuddVcl3Voniq8lDX6UF9bmYPEbVjFIcZwJyj9zdCcQ1p30qhqmCxHXpouBQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee8d867-6f0e-430d-01ca-08de7dc1350e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 09:49:50.5267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VTw4yHTvucva9eXoPK4CXn03DoRnwwZmvJ8TFfFIvYMQWntfRQ+W8Q9k5R2DWuxkT6wz6OTLTili43tDpf83bQTBJQPkGyhcgPtG6httGM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8EC896901
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

Hi Jeevan ,

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: 09 March 2026 14:53
> To: Bilal, Mohammed <mohammed.bilal@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Brzezinka, Sebastian <sebastian.brzezinka@intel.com>
> Subject: RE: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
> assertion failure
>=20
> > -----Original Message-----
> > From: Bilal, Mohammed <mohammed.bilal@intel.com>
> > Sent: Thursday, March 5, 2026 3:00 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: B, Jeevan <jeevan.b@intel.com>; Brzezinka, Sebastian
> > <sebastian.brzezinka@intel.com>; Bilal, Mohammed
> > <mohammed.bilal@intel.com>
> > Subject: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
> > assertion failure
> >
> > Fatal assertions can bypass cleanup paths, causing resources to remain
> > unreleased when failures occur during audio tests.
> >
> > Replace fatal assertions with non-fatal checks and route failures
> > through a common cleanup path to ensure proper cleanup.
> >
> > Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> > ---
> >  tests/chamelium/kms_chamelium_audio.c | 42 ++++++++++++++++++-------
> > --
> >  1 file changed, 28 insertions(+), 14 deletions(-)
> >
> > diff --git a/tests/chamelium/kms_chamelium_audio.c
> > b/tests/chamelium/kms_chamelium_audio.c
> > index 2967e3c50..201be0ba2 100644
> > --- a/tests/chamelium/kms_chamelium_audio.c
> > +++ b/tests/chamelium/kms_chamelium_audio.c
> > @@ -389,11 +389,11 @@ static int
> > audio_output_frequencies_callback(void
> > *data, void *buffer,  static bool test_audio_frequencies(struct
> > audio_state
> > *state)  {
> >  	int freq, step;
> > -	int32_t *recv, *buf;
> > -	double *channel;
> > +	int32_t *recv =3D NULL, *buf =3D NULL;
> > +	double *channel =3D NULL;
> >  	size_t i, j, streak;
> > -	size_t recv_len, buf_len, buf_cap, channel_len;
> > -	bool success;
> > +	size_t recv_len =3D 0, buf_len, buf_cap, channel_len;
> > +	bool success =3D false;
> >  	int capture_chan;
> >
> >  	state->signal =3D audio_signal_init(state->playback.channels,
> > @@ -426,9 +426,12 @@ static bool test_audio_frequencies(struct
> > audio_state *state)
> >
> >  	audio_state_start(state, "frequencies");
> >
> > -	igt_assert_f(state->capture.rate =3D=3D state->playback.rate,
> > -		     "Capture rate (%dHz) doesn't match playback rate
> > (%dHz)\n",
> > -		     state->capture.rate, state->playback.rate);
> > +	if (state->capture.rate !=3D state->playback.rate) {
> > +		igt_critical("Capture rate (%dHz) doesn't match playback "
> > +			     "rate (%dHz)\n",
> > +			     state->capture.rate, state->playback.rate);
> > +		goto out;
>=20
> After goto, the stream will be stopped and the test will continue. The te=
st should
> fail after cleanup.
> We can add a flag and assert after cleanup based on the status.
>=20
> Thanks
> Jeevan B

Thanks for the review .=20
If you look at the code flow, the failure is already handled through the ex=
isting=20
success variable igt_assert(success); =20

>=20
> > +	}
> >
> >  	/* Needs to be a multiple of 128, because that's the number of
> > samples
> >  	 * we get per channel each time we receive an audio page from the @@
> > -447,10 +450,6 @@ static bool test_audio_frequencies(struct
> > audio_state *state)
> >  	buf =3D malloc(sizeof(int32_t) * buf_cap);
> >  	buf_len =3D 0;
> >
> > -	recv =3D NULL;
> > -	recv_len =3D 0;
> > -
> > -	success =3D false;
> >  	streak =3D 0;
> >  	while (!success && state->msec < AUDIO_TIMEOUT) {
> >  		audio_state_receive(state, &recv, &recv_len); @@ -460,13
> > +459,21 @@ static bool test_audio_frequencies(struct audio_state
> > +*state)
> >
> >  		if (buf_len < buf_cap)
> >  			continue;
> > -		igt_assert(buf_len =3D=3D buf_cap);
> > +		if (buf_len > buf_cap) {
> > +			igt_critical("Buffer overflow: %zu > %zu\n",
> > +				     buf_len, buf_cap);
> > +			goto out;
> > +		}
> >
> >  		igt_debug("Detecting audio signal, t=3D%d msec\n", state-
> > >msec);
> >
> >  		for (j =3D 0; j < state->playback.channels; j++) {
> >  			capture_chan =3D state->channel_mapping[j];
> > -			igt_assert(capture_chan >=3D 0);
> > +			if (capture_chan < 0) {
> > +				igt_critical("Invalid channel mapping for "
> > +					     "channel %zu\n", j);
> > +				goto out;
> > +			}
> >  			igt_debug("Processing channel %zu (captured as "
> >  				  "channel %d)\n",
> >  				  j, capture_chan);
> > @@ -489,6 +496,7 @@ static bool test_audio_frequencies(struct
> > audio_state
> > *state)
> >  		success =3D streak =3D=3D MIN_STREAK * state->playback.channels;
> >  	}
> >
> > +out:
> >  	audio_state_stop(state, success);
> >
> >  	free(recv);
> > @@ -587,6 +595,7 @@ static bool test_audio_flatline(struct audio_state
> > *state)
> >  	recv =3D NULL;
> >  	recv_len =3D 0;
> >  	amp_success =3D false;
> > +	align_success =3D false;
> >  	streak =3D 0;
> >  	while (!amp_success && state->msec < AUDIO_TIMEOUT) {
> >  		audio_state_receive(state, &recv, &recv_len); @@ -595,7
> > +604,11 @@ static bool test_audio_flatline(struct audio_state *state)
> >
> >  		for (i =3D 0; i < state->playback.channels; i++) {
> >  			capture_chan =3D state->channel_mapping[i];
> > -			igt_assert(capture_chan >=3D 0);
> > +			if (capture_chan < 0) {
> > +				igt_critical("Invalid channel mapping for "
> > +					     "channel %zu\n", i);
> > +				goto out;
> > +			}
> >  			igt_debug("Processing channel %zu (captured as "
> >  				  "channel %d)\n",
> >  				  i, capture_chan);
> > @@ -661,6 +674,7 @@ static bool test_audio_flatline(struct audio_state
> > *state)
> >  		}
> >  	}
> >
> > +out:
> >  	success =3D amp_success && align_success;
> >  	audio_state_stop(state, success);
> >
> > --
> > 2.48.1

