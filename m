Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D93CEED609
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 14:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2554610E0F0;
	Thu, 12 Sep 2024 14:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXUysQLI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E312B10E0F0
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 14:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726149603; x=1757685603;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zO0h/jr8NSeSSahp2pI3UrOQwVNribkM54nlWJlDD+w=;
 b=MXUysQLI+ZBPRj5hx4EarpPvsq/gZDhIiz/EHm3f4UwFlUggeZ+LzJhP
 l+/FdtGp0wUdDlewj4XJzU/6SGl2JqT5z9XjZSbR0qEWJfflbKAVFUeIj
 +Qme9HmnyCA3ANEDaHt+lvrpZTAnGuJJm1qKyTy10lUTUgejPZwNNdloT
 jZaFsPOQeVC+Bwpr92q5UtS5rcHkSy/x6W26RJawn+HeOj7sgKb8NFO7E
 y9hhNwGcrSHZ1uEym9R4VxQZWxD0SjvhpyONJWaUYD9lduK0TnLyJem55
 qqHsuNxC18rjx90iq10aqAjWaRs79IBoj+rybL3/cq8dBldZbUUazCY/f Q==;
X-CSE-ConnectionGUID: tyVerT47QKeyTBnEnjnY2A==
X-CSE-MsgGUID: i71z9UK1QtSvtO2AcO7O6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24876451"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24876451"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 07:00:03 -0700
X-CSE-ConnectionGUID: Px9lgJ5PRsSTXh8sl285rA==
X-CSE-MsgGUID: vvB6nwF2S9Ci6BM5VF/f2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="105164248"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 07:00:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 07:00:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 07:00:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 07:00:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2D6f78iG295UzbNW05lscXtsHqcRcEYqYW2BcbOUSgcTnybC3P6NFspRRvxOn58SfXA5U4QMPsUEhOa4IVbSvPOwmT47dNN+MQcBvqO2D7n6dOadZnWy/FxL+k1nJ6wxpbr3UY3cOodk3wPtRY2gq//s2teoXU4hANauB/KVbdYTcPMCxyIe1gV5yc0n39czJhwSmA21GefiBHcCb8DqooAQMGGJOfPLP+3YBAJs2VFcZDE4UJUXn5REicsiz9J8m00jh5pSUUOlNdSiEqFM5VicxCUQ0/B85MPuXyV3HWa/3+jwoKPObiB/iQ3GtsFm1K3v6f7LDEUf1kAKpnzZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17pHS88l65WllJ5TOECjbBq0W6q+myI35zL/MJ9Gs38=;
 b=PXx25CeTMdXUcDNMwrbPI6+DsfNcHv1X0qCG0fTojjhLA38bNuffzljwY2PhW9jTD19fJOv46otjWG7iYFQrhDPhWLe+Y650bNvoZ4koBEZS3HFuq1ajoDKn0Th4XtIWWmEM1Aeb4djbwU1yZhqCTJuuUMBUOeFpk9hhh6r4kEi5ajyRpMTO9UNtv/+uGKfI4yN+7nGPI2/wZaxWsMaqVxzNapr3epA5tabTLbBca+53k7I1MTICJXk29bgabT7MLK69dsW+uQ0Ty4oE6Y8eNTGLcQJMBKi+gDmT8KojmXe39iV63rbdNdlNgvYJcQPjtli5Y6EAG5Mb5bFmD0qpoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by MN2PR11MB4630.namprd11.prod.outlook.com (2603:10b6:208:24e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Thu, 12 Sep
 2024 13:59:59 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%5]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 13:59:59 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t 3/4] test/kms_content_protection: Move color change
 code
Thread-Topic: [PATCH i-g-t 3/4] test/kms_content_protection: Move color change
 code
Thread-Index: AQHbBRjaXvgJhArNM0azGgN9+DtZrbJULYgw
Date: Thu, 12 Sep 2024 13:59:59 +0000
Message-ID: <PH0PR11MB48064C776130BD9CFD58B116E4642@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20240912133421.718496-1-suraj.kandpal@intel.com>
 <20240912133421.718496-4-suraj.kandpal@intel.com>
In-Reply-To: <20240912133421.718496-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|MN2PR11MB4630:EE_
x-ms-office365-filtering-correlation-id: 762a1dad-ba36-4ab7-e03c-08dcd33330c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?GnALCE7USSunpPpg+EVSWmnF0lGdEzXkFBFS1y9G53hIw3wT3uztGnrgmM1a?=
 =?us-ascii?Q?ihs6I4AAzZKx46hVvwhOCU+rKwF9IvRA3uy1i7qcK9gk2NQrIvHrv71rVpfQ?=
 =?us-ascii?Q?6Dg8/d2MChVghcbj7EfsQPXdJsU074BbbqKGXM3XVB+ghpKfI5959nMejan2?=
 =?us-ascii?Q?sgKzTBQfu0Kvb5rQekPvIRSye9M6itybvci3svApuOzuIlkGyaxjF5wPxqmk?=
 =?us-ascii?Q?ByyxhghxBzawHnCaXT5s36bY3iE2pbv57Ac/GFpDw2NYJTJIOSaRUxV51P6q?=
 =?us-ascii?Q?vYDh66/YDXIVacuRFjH4h/z/ABbLT8v4/PjzD8EMO5E3NWMc2oX1W5jmCXfE?=
 =?us-ascii?Q?aXG4IWxoK8ln60gVxbR06Ib+qj9rbJVuFxRme7Wv7f9xUOGxqOI4eMJFHBXr?=
 =?us-ascii?Q?J8wwh5iup0C2Mvclj+K+LN7fLyNe1x/FTH5rJgERQXXr4YsvRT3RWascKzWg?=
 =?us-ascii?Q?xc5yZgi/JjBmjP6yEVYz/pXTkmeWeHsZFm9jsqxRv4p+t1N2snFEUPmxj01u?=
 =?us-ascii?Q?JUlvG4hEkk5T6mR/XziB3TLk+HXYeiRKrAqxvW+IP4yPhG15+WjlQkGpinhp?=
 =?us-ascii?Q?8dk4g4epJ6GMsI57em22xM1u3AGrb9gaGjTNo3QBkGRk8ySi6DBRYGGERVZM?=
 =?us-ascii?Q?gp5oh9euZWqnfYE00QFt1IsiUU3Uo74gCCQFnX1wTB+ruENCrWmkmhxOl8Oa?=
 =?us-ascii?Q?Zr35sv1f3HvTI+vFTPhZZxGb5uC7xIx4KWed9RXnnkMFzzrOexehbTRuo4Dk?=
 =?us-ascii?Q?lr/tY5lgKctF0yBcze3MvQJiGpzYTX9tSGrPivVTJ1hp4sSTC4nrxOWhcdc0?=
 =?us-ascii?Q?ihwlNZ1AH+dY1H1QmUGIRX9OZNKbgWm1hhtc+1mdKdKXFW74JEHi34uvFP10?=
 =?us-ascii?Q?UeqdEEXOJTfu3n4mB6o94uFL2toWsN+ZOOO49R6fI6MoG3ziY2fwpkPxWYIV?=
 =?us-ascii?Q?iImS6nMEoXx5KSlcA6VVlITGUCtuG1x3cfffVFjH5JenVWfGgPYg8axrkFFK?=
 =?us-ascii?Q?FXFm6tSVvKW/oJsZluG1awtZfhb/5lZ0500P26QRKgqG97MREtlnonSCXbu6?=
 =?us-ascii?Q?I49DCSQsFwR6TngzsYrmLOMoy55YejYaxfdVkvNZgRFyKY0mJZDKNaDBGmDA?=
 =?us-ascii?Q?8hxPMFPuQfvQRn2LxGxR7oHYE6bHOPdaWTtotNvS4283zwhypQ3veo3NvErp?=
 =?us-ascii?Q?JGkAJr8Z9Fi6jAWgyZ1HceNmzMI5ZXYzbi462Qf5hppHcPmtjXM4bsbbdo11?=
 =?us-ascii?Q?FLe/+WI6AQictWVaiYB79NFJl4DWYo583tDNkUaTuYBigI2T8bGhQqS2N5Gh?=
 =?us-ascii?Q?7JoGPVjy9KS/f29N3MplrouTuLc5zeHc8ZcMmtgEu/PWZrNnrMRgW5UQmFPe?=
 =?us-ascii?Q?6zlhgrJhOE4F8HBfY4mE7w7Epv8pkG3Ba9oahRftKadxx/G+3w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y1gWQx58Qk+pyx06ntXRRZdgazrkhdbxzEc3/bmhkKGPC0+WYApiaHYchgi0?=
 =?us-ascii?Q?FDxClLOKsACP7Hv9pzC22iFq0rUhtQ13xLRsQtlQ2uydaGjluVitLFMmRpy9?=
 =?us-ascii?Q?3lFjKjTVbtDErw2lqPZjVoFiKCFXENKNMQEbtn6bc9ZuKsY4TLkOYm39hddT?=
 =?us-ascii?Q?BxJP+ZzqScR5Y/OlCPMHrS6Ec5HNgHya7PYmqpGEJGI6lmjKypRnvMxx5Fo0?=
 =?us-ascii?Q?6h/jOYlHZy+CNPmabbToBODwiPEsim2GSfslJ3sgnQM0oCDpbt4aaxvS7bdJ?=
 =?us-ascii?Q?hQ7H/+LkfX75Oi6TP/BCm3XwffAXvZEsezv1Uxs0E2LL5p1ofIjhmkzQIPvi?=
 =?us-ascii?Q?N1FyPnZlaOlBuyRIzIshOjpFlRhoWAkaLn0zHwq7Op27NAB6OHHvI8c+Htx6?=
 =?us-ascii?Q?LaT9YZojmw1oLTik1V2I2Fld5+3mw5yT1XuMVkdI4hI6NI62ERgCKojtnhaw?=
 =?us-ascii?Q?TqbCZp9jMx3tC+LVIoxA7EYdDtJIRtYKyQgeXI4OO1MKAW2kOw+z2NzVLhBS?=
 =?us-ascii?Q?4uoVHle/YsRIzZLeaSZaP0oy7L/KbNKBl85R6pC/zJNYqicoE5/0cB206+5R?=
 =?us-ascii?Q?208Y78M+QyayV4+VLmUdzGgxiCahHoKSaM8WlqUAKPt7yd0G5lhG9Kj4JQ+c?=
 =?us-ascii?Q?cR7ULFW0IurcpI6MRv2okBPZyhFKI+1I2pE2eGbQugpwvEd86V9WSpA84dTi?=
 =?us-ascii?Q?4blh4KNhV5oY37d+Zi+QfFB4dlZO0EBVJqCzsBOfj5rpKrZeLQGuvH9TYEPb?=
 =?us-ascii?Q?QNZ5nmW/6TkxRbICq2ZBKUWkzDCMaxoCaG1pt51MDDQH926BLE6Pr88B6Z21?=
 =?us-ascii?Q?JDyY5h7u0ah4uvhJnfXEQEJ0Y8DdCFNsDGGOd147qVTrZLc1fK07R8DLvVkb?=
 =?us-ascii?Q?X5X/+5BFvIjZn4zAmucbKEeltrA1903YSOH/ihb+3oWGb18KvFoHxxU2GjNe?=
 =?us-ascii?Q?e7GABXAB1n6wCV7x+36n1sx1QG4+z5ap8mRVMyDz+Bbaw5CjtrJoRsZphFJo?=
 =?us-ascii?Q?xPSQ3Jemel4cxeIEqa+flG6viLaumW0okipQ8UTNiY8eR2WET/kfa2KEXb2H?=
 =?us-ascii?Q?GQCpdxmH9me7MVj8v/IgZnPunZRxdNRr5bl8GnNitpeKqiJfmeXwqmW1WJ/D?=
 =?us-ascii?Q?VtZA3v/7UaNMCtujMiS7Xl+eads1pwUiKWKWWZPOSoHsyJMRsU+ukyuWO9cK?=
 =?us-ascii?Q?9kezUxekWjWyOBfHvZPgCpvpIBhWyEwqkK5hj9vHxWD/Wpcxjwua2IbT4ZIY?=
 =?us-ascii?Q?VZjv0L+g0x2yEuOJNDP8oEwhBa4vTwGMeJEIAdMPiDJ2Q56SBweWbX+VPdf9?=
 =?us-ascii?Q?k1VYK4Rw3x68Q26lrMTfchap+PaY+IpedCJv6wXQDJnPx1h5SCt45JaqJZo0?=
 =?us-ascii?Q?OrbdaNGhxIgGrPI4cboMMtLI4u6Wcso2xNC/OTXj7kYRPpm9fj4Gq93jUyzE?=
 =?us-ascii?Q?2f5QK8vDCgCgn2dKivqoio+80rLPBEpz/541QXd3nQWgt7rEjsGv97Pxymx+?=
 =?us-ascii?Q?s7Gqk+zLjFRDWpHqAI1+6Ipo/z29M+in+sodx9VB1n5k3fPCCV++2kXZsrRF?=
 =?us-ascii?Q?8vqbmwFeeVsHLTGZezPVkeUB1gERjIDebh2ORXEICvYFeth9HgBE2hhezM9L?=
 =?us-ascii?Q?bw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762a1dad-ba36-4ab7-e03c-08dcd33330c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 13:59:59.4269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gzX45BuHjSrHqtfRaeSXm/qjXLq1USANQK4cXI83Ev4/3+Kzttukp0sdrlQc9rYKW437QQF344dncsZEeMU7NLhz3QNs14ZMgoBgHyoQuGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4630
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
From: Kandpal, Suraj <suraj.kandpal@intel.com>=20
Sent: Thursday, September 12, 2024 7:04 PM
To: igt-dev@lists.freedesktop.org
Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; B S, Karthik <karthik=
.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>; Kandpal, Suraj <suraj.kand=
pal@intel.com>
Subject: [PATCH i-g-t 3/4] test/kms_content_protection: Move color change c=
ode

Move before screen color change to in the mst_cp_enable_retry to make sure =
we display the correct color after every retry and to make sure one of the =
monitors does not go to sleep in between get_property waits.

--v2
-Fix commit subject [Thasleem]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
LGTM:
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_content_protection.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.=
c index c3771fad8..f17d9f2e8 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -667,7 +667,7 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_ou=
tput[], int valid_outputs
 			      int retries, int content_type)  {
 	igt_display_t *display =3D &data.display;
-	int retry_orig =3D retries, count;
+	int retry_orig =3D retries, count, i;
 	bool ret;
=20
 	do {
@@ -693,8 +693,14 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_o=
utput[], int valid_outputs
 						  KERNEL_AUTH_TIME_ADDITIONAL_MSEC);
=20
 		retries -=3D 1;
+
 		if (!ret || retries)
 			igt_debug("Retry %d/3\n", 3 - retries);
+
+		for (i =3D 0; i < valid_outputs; i++)
+			prepare_modeset_on_mst_output(hdcp_mst_output[i], ret);
+
+		igt_display_commit2(display, COMMIT_ATOMIC);
 	} while (retries && !ret);
=20
 	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n"); @@ =
-760,13 +766,6 @@ test_content_protection_mst(int content_type)
=20
 	ret =3D test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2, =
content_type);
=20
-	if (ret) {
-		for (i =3D 0; i < valid_outputs; i++)
-			prepare_modeset_on_mst_output(hdcp_mst_output[i], true);
-
-		igt_display_commit2(display, COMMIT_ATOMIC);
-	}
-
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
=20
--
2.43.2

