Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE825D2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 03:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4415410E070;
	Tue, 20 Jan 2026 03:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkd2Iewr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E6110E070
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 03:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768881492; x=1800417492;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JQEFtQ8MkqaaBUsnIE/z01KITRBqGhReaB4SP6bmAQ0=;
 b=dkd2Iewr6qwExle99PGJjWkNL4qRNikAhltwU2sGt7zE4Z8E26nDcC9t
 hEXSyMkXjJxrcrtsu3fxna7cnaAZk4jxEEKN0gK10VY6LME1qeAdfDfDc
 47H5egF/ZvXTl1Rcaack9hp4f94ACjYGo/i7xtq/mXZvIMMR06q0qG5MF
 CMKNYe8hcownVZ3QgW4ErJO9o8Kh/9HPwTmPEbpkipOWktVp0F/bVuyIy
 rit+UiLiip8exRDXp8j+IOagSByCO7Rn6ORyA0tbQrLs6EpfNWPJTBLD9
 7mwdXL9GdBdMH3hlp7EGUYRyi2qZ9K60vBVvcSKuwzCtZam7Yzw/W19S7 Q==;
X-CSE-ConnectionGUID: 4JEHnDjvRM21QbuXG083Fg==
X-CSE-MsgGUID: NrGxRB5ZRu2rWY+HfdnZ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70135816"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="70135816"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:58:12 -0800
X-CSE-ConnectionGUID: ZY69FtxZQ7KTySkrbM77+g==
X-CSE-MsgGUID: EdTfb2N8ROWiAWp1aRWUpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="206264337"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 19:58:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:58:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 19:58:10 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 19:58:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHL7Zd8fS313zxtPg/pbSSIwng6vxW254f9viC7l6uFyoJPDsHRQiNwrzRCmjZdXbpMQIiWOdEmetMlp7Pc67UTqnIDRtR8bhruM19yDSU4ve66EOmUonnZHu1isdiNDz8efyRC0Ndtxy9Sy94OMh5DVGpqsbiPrzyoZWDWOXnzTjxttQC1FQi7nJk5ZZlEREYBONPilmQ6syRcMBs9GG5aNKAkrUjUD87xXrIlks67FoJwxvC43bl8Qri/ZiWpIUq3YYJNayrDciT9hpr0tb9D9fEOCN3OZUIsMlJL4X9puV0BVr/vZuW4yHQzL4BbKbp2Hbr8hd+Lv4a27a2pdag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsyLjr8yqUVQZmUBJCRy7uiEvmX8cIT9nPsTE4IfCWQ=;
 b=DT7uxst8hlOLKhKhZXqlNNKyZbPX3/GiSJW2vJynH50e7qTe65v/uDdSWLK2BXBf99AYr7yiUmrEX0n7JsRnXeblF9pYZfSz86p9rMe0lnFdyxseqvb02NmrSfLCcZ3MCetRRkHgg5viCGBlw4A+zu0YeY5sQUXh8SOdkUjGuQZDa/wBJXy/X/XFtxaXaU7pikzuqLfDMqvo/NG+3027pf3KbflBvmW10XkB8fkWlyh6NUlU+//Z6LLnVvCI3fAqEgt8j1WWCLizaOIjOZhhQqfJ5qaYA6pN21uJ72udC/lD2gyKyxt0Jh92aDZe/lJkTGXoAMOlSRlJAzrqTCs8kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB6348.namprd11.prod.outlook.com
 (2603:10b6:208:3af::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:58:07 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:58:07 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v6 09/10] tools/intel_hdcp: Add interactive control
 with playback
Thread-Topic: [PATCH i-g-t v6 09/10] tools/intel_hdcp: Add interactive control
 with playback
Thread-Index: AQHciUGC/n0Nb6MoQE6X0/9tWc2qA7Vabn8Q
Date: Tue, 20 Jan 2026 03:58:07 +0000
Message-ID: <DM3PPF208195D8DBDA5618CF3386C87E226E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
 <20260119123142.504623-10-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260119123142.504623-10-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB6348:EE_
x-ms-office365-filtering-correlation-id: e9076465-acac-40a1-d0c1-08de57d81ec3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?p5gzsVcG9DLqyTzfj5XSmpfpBcRzsYCR/0bZSsP1bUCOW83lhZEnkjSk8Q+6?=
 =?us-ascii?Q?zH8O1L9VB3pf3ZCee0/irvxUSsjDUAemGky7XKvRl2DAl7NNQj8ydeN6qF6Z?=
 =?us-ascii?Q?4gO8lEaLFxIpRlrqQUOzBM9/FM4zSkcrKorss2UDNurDIaWdoXLbASJ64iWa?=
 =?us-ascii?Q?ed+i1ulGrY4GY82hVGxNlXODu6onU29oYgjjQmKL10NmIJRsjkIHQ5NLkYQi?=
 =?us-ascii?Q?vxPkk9jxPnsVMx+0drme/y+yQ787V5De2gmhbOUbN5tbQWrmGN+E3cKwBlJy?=
 =?us-ascii?Q?fxnPZ+YthEt79X6QDqMO0VdV5IegviHPAk/WBVf0fdZdBE5kW6JVbFXWPYj5?=
 =?us-ascii?Q?GC8GdQyBdfJ33wWiiybY3lnpJo34jY51lUCAbNqDcrfqEbX9fsnFcT3TRikY?=
 =?us-ascii?Q?7ECfA1VZ4fFrA0ngv6YqwdHCuYJPE5F1YEhHEOoWejMUubMJ+VURboRiS/KQ?=
 =?us-ascii?Q?1tXMPG0rkE5phZo/KhmEGdntBeKkv9qO5NR4DxBQcbOCXOO79cqOsjvmU5/3?=
 =?us-ascii?Q?sl78vECvNpHe64MuyQlH4f+O+mOsa4Xnga52IzE2YyjJzy1wX/VtM9O3yyJq?=
 =?us-ascii?Q?g4Zms/gmAoEYZ1rwu4x2Rr6U2rhx5yMc6RcL8L6Rcg2VGKC9rDjFYNhjbdoP?=
 =?us-ascii?Q?0lZhYOYtGU4UEbWa8hgV9S2xkwR3bF3V6oQlh0ra1hs+QLHta4TlVIkcIJzl?=
 =?us-ascii?Q?6NrDmNURsmn38HGVaPfks3uYotK4aM/yf8XK8hfuMDrflWx5c9awUZk+W29k?=
 =?us-ascii?Q?CHzT6SHoJsZW+CEtSm74tGbR0WmHD7cf4o8ZwwSBwPY2ih8qXjuhgA0EW/ex?=
 =?us-ascii?Q?EMJ4S36EjocHlp6/oZAMKH4lYqnQdkMyfCpmrobm+5coS00YbRLjSuzKMu1V?=
 =?us-ascii?Q?ny2fxXQhTGrNVc6bnO6cCKLYr80tr3QqBEDCJ12RdcLINOsZn16Qf+Ne8B+W?=
 =?us-ascii?Q?gMcYxDeLQMdRgMcltxfosCsyOTs/BR0yYh+O+6DlUgh1SKiMBp0veZJTmlsY?=
 =?us-ascii?Q?UquKFhwjlXP+bQH97L+5KGDuQl+VL9ewwW0ZbhdL+kBLSUm4UhL2EMisFAlx?=
 =?us-ascii?Q?QFqVnx2a0dDv6uLDplTGmDS1Ewdf4WezD6j84qYpjXccHi8GjXbWk6Uqnk4w?=
 =?us-ascii?Q?h1LAllTNkKqgi1NSpUiMsHcK5B6NNbOKLfIkExZvw48t3WQndEXdfrc+/3Yb?=
 =?us-ascii?Q?dhJE/2W8lhvcM+uTqCRkK9DVhCpLO2vO8As2D62Efi5POhNWg8/I1Fqoyzuq?=
 =?us-ascii?Q?L4/3u0/aIFU161zWKbWBWe/om3rx7Kj813BdQg19MaNvRgrlRkfMp6Cl2prG?=
 =?us-ascii?Q?DspBArbtQbI91B5er3ZlFnNB7pTB3cWd3a8c0QFxM7yF9XCFbqZwjP5ZfvIu?=
 =?us-ascii?Q?kSxzKLxominSw0zQoC5b5GSGyVdupI4qlx9hEtXsELeiYNu9bKhdynbdkDGk?=
 =?us-ascii?Q?h4NgTX1alzBWHNYtDDrKmezJy6o9IB6ZxgKCOmaCeHWq/U0fP/ekTbdkZq+9?=
 =?us-ascii?Q?0ycrXjwh9LlBghOe1PrifLgKOd7z6FJKRNJj4i+iR5IP/WvL6cv55IzC+E9o?=
 =?us-ascii?Q?vw4P3Xlaftb1owaoUmSelAjztx0sNOAHZE3fhfNc6Sr8k8n/rjhBtZRMnP4M?=
 =?us-ascii?Q?szDetzAplI0yQ3KMZmVKAOQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Oi7BeEQFPK9N4302PJAIHepn73e7Xo1XRVLVD+OAAeA/M7HnBN5C2fTD9iac?=
 =?us-ascii?Q?OEusWjQcf92NRTUQNG/xknRj4WAwiZFBbDaWNDucoyVm6tqb8I33yBDKx7f7?=
 =?us-ascii?Q?OJ2wSqC6oxW/rv20gcOgKOjf8lOMlsJb2q0BFz8ANpRTm96nskgJOm+u+HN5?=
 =?us-ascii?Q?ecrWk8p3zANBide4zpaPc1sNUXJNgZMfqM0YkoS5DM0f78OlDGavgwklN5/T?=
 =?us-ascii?Q?v0hngSJ8Nb1MeJpAV0y4qy+Hnd9lbkGBIBKnzdQug41mlIojszKqdlO4XOLo?=
 =?us-ascii?Q?ZQtDfpyngmdCXolyBkYbV7a2rX5pUAjqlAVZR3E1fS/oHHfgEHcpe6VPW+i9?=
 =?us-ascii?Q?e1TRKh6uP7yTBriuKWCzAgBhF4hGsLFpmnltBqRfhPcF/vqeKVgaLm1S6YkY?=
 =?us-ascii?Q?Lzkf1AHnFmT6r+i1foeeLYw96fjX6XKo87v8iJlLI8MWxKVg7BmwBrBeUXKB?=
 =?us-ascii?Q?MI+z0Pa1JBtHWQqwWnllTyKm+WeGl1324H0TBVvjKxi6uzIkNuk3MsqRUz35?=
 =?us-ascii?Q?ss/6Rn97YtnhsuyX/qUTsKILBtTRzvMSOg1zIBtFGCcTwXZpkxTAzL7uuwHG?=
 =?us-ascii?Q?4lQ8OSyEELm7GVPrKfeiNfnXcmCrzWJjMVp2Zi28CBg0I43uZZ8aq1TUNnA6?=
 =?us-ascii?Q?n0JDnp1XX1oIMxhnVQpafCxCZ0ZlzRVS/7qJzA21QnumR1zMPPnjQnnk3jmV?=
 =?us-ascii?Q?P8EYeaTwi0wOyYx5JGbTw+gx1MoPLoOY9wRE6WADDIyMufRFhDn22+WqkhSf?=
 =?us-ascii?Q?opWL+yX6fzvSRea65SxGRKY6hjjPDxraPegRnI+DifuXYqnuOfyZBvU0se6f?=
 =?us-ascii?Q?6IeJLMrMZhqRS150b6mWCtuwcFRHTkBG2jBrD6piaCmucEAtOYqNGVUc5KlM?=
 =?us-ascii?Q?/3kgWBp7tQjaHsFJaOwRbA5xPJhHW0Vd9DQnCMDB5pfiE7VxEXHA93dtejVW?=
 =?us-ascii?Q?nviur9pc4W2i2ijtu5rj9AljJUJSRHJxAmATYGqdyW76L7lVSQ8OKkaTPR8W?=
 =?us-ascii?Q?xXaI78EMH4+PfmftVlKVBiLAwHERYgxNYxnVNWcbGOdTm/IhlFWipvgLL/No?=
 =?us-ascii?Q?U77FjGE79i1p5djkiV6XlDOOTqh4rotX0MGc8tqaDKWY+psHEVcxry7CzM/5?=
 =?us-ascii?Q?aqQt/Ov6pLq37enm9sjlp/ynikjcxGMg9MNUy2fN34loqu9+i4Fn/3QbmolG?=
 =?us-ascii?Q?PpCczEl3d0uBHmb7zV45PaJHaG8PmmM2fCUM1TuymN/GKUi85S+xOl92L6KA?=
 =?us-ascii?Q?qrZ3tIVyq7kH2j5xtLD+lY9/99cXGj5rDUG+p3Df2VQI+Xebdg0ZfvUkQXXx?=
 =?us-ascii?Q?eSCtMYvNEZGwOcjpNYCy90780Rx5F8lJTZkbVPF8rB+cn6V65F3WqCKECFo/?=
 =?us-ascii?Q?JLMhHbYIwZ+hbxKxbE2HPO6XuTTziz5md2gJB4nDizcjChLuW51qm6ras11p?=
 =?us-ascii?Q?9+5To/yKn6Jwc0UHZiPqNzJBsA0m6W1IChtzKoC9bE8y8g+4LMxJWi5D9Gf9?=
 =?us-ascii?Q?BTHf000O6nZorx9ytBgnvPzyj/sZDlrCq0NL7jWnxwY4Q9lvEsKcMecXuGx1?=
 =?us-ascii?Q?0KzXaFIu5PUCAnyTzFt2O20GygTiviIEWLW6UVMgu0RC4ZmEcF7ab1DvH3tk?=
 =?us-ascii?Q?te1tdL8lrxVrFx3b0xekMrEFp1rWyu2NwL6qok2phDGKGciMmpD0OqnfVJbc?=
 =?us-ascii?Q?VFDWU+qZJHoStxZ2nmsK31UBnGOMceFucAA4s0ZIXmHcDaPH8MKSrDH2kmv0?=
 =?us-ascii?Q?AAZOmbEINA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9076465-acac-40a1-d0c1-08de57d81ec3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 03:58:07.3299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UavcR/5ULU29vWkriNcTkhQqQL86vLcl1YBxBAzIzifglv0DxtTWkR1od7cb4bjXN8/ZTWbYLn1vJaRVA+Xc9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6348
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

> Subject: [PATCH i-g-t v6 09/10] tools/intel_hdcp: Add interactive control=
 with
> playback
>=20
> Replace static handling with an interactive loop for HDCP control.
> Add video playback thread, dynamic menu updates.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 173 ++++++++++++++++++++++++++++++++++++++++---
> --
>  1 file changed, 157 insertions(+), 16 deletions(-)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> fdaa7d931..9366fd5f9 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -36,6 +36,7 @@ typedef struct data {
>  	pthread_t video_tid;
>  	int selected_connector;
>  	bool video_running;
> +	time_t video_start_time;
>  } data_t;
>=20
>  static const char * const menu_lines[] =3D { @@ -48,6 +49,58 @@ static c=
onst
> char * const menu_lines[] =3D {
>  	"q. Quit"
>  };
>=20
> +static void draw_menu_text(cairo_t *cr, data_t *data) {
> +	cairo_text_extents_t ext;
> +	double x_center, total_height, y_start, y;
> +	int num_lines =3D ARRAY_SIZE(menu_lines);
> +
> +	cairo_select_font_face(cr, "Helvetica",
> CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_BOLD);
> +	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> +
> +	x_center =3D data->width / 2.0;
> +	total_height =3D 0;
> +	for (int i =3D 0; i < num_lines; i++) {
> +		cairo_set_font_size(cr, 52);
> +		cairo_text_extents(cr, menu_lines[i], &ext);
> +		total_height +=3D ext.height;
> +	}
> +
> +	y_start =3D (data->height - total_height) / 2.0;
> +	y =3D y_start;
> +	for (int i =3D 0; i < num_lines; i++) {
> +		cairo_set_font_size(cr, 52);
> +		cairo_text_extents(cr, menu_lines[i], &ext);
> +		cairo_move_to(cr, x_center - ext.width / 2, y);
> +		cairo_show_text(cr, menu_lines[i]);
> +		y +=3D ext.height + 10;
> +	}
> +}
> +
> +static void draw_menu(data_t *data, const char *status) {
> +	cairo_t *cr =3D igt_get_cairo_ctx(data->fd, &data->fb);
> +
> +	/* Background color and text color based on HDCP status */
> +	if (strcmp(status, "INIT") =3D=3D 0) {
> +		cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
> +		cairo_paint(cr);
> +		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> +	} else if (strcmp(status, "Enabled") =3D=3D 0) {
> +		cairo_set_source_rgb(cr, 0.0, 1.0, 0.0);
> +		cairo_paint(cr);
> +		cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
> +	} else {
> +		cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);
> +		cairo_paint(cr);
> +		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> +	}
> +
> +	draw_menu_text(cr, data);
> +
> +	cairo_destroy(cr);
> +}
> +
>  static void set_hdcp_prop(data_t *data, int property, int type, int
> connector_id)  {
>  	drmModeConnector *drm_connector =3D
> drmModeGetConnectorCurrent(data->fd, connector_id); @@ -471,18 +524,34

Not something for this patch but maybe you can have another patch where you=
 make all remaining drm_connector to connector
For consistency

> @@ static void *video_player_thread(void *arg)
>  		cairo_set_source_rgb(cr, bg_r, bg_g, bg_b);
>  		cairo_paint(cr);
>=20
> +		/* Draw menu */


Not needed here the function tells us what it is doing

> +		draw_menu_text(cr, data);
> +
> +		/* Draw timer at bottom-right corner */
> +		current_time =3D time(NULL);
> +		elapsed =3D current_time - data->video_start_time;
> +		minutes =3D elapsed / 60;
> +		seconds =3D elapsed % 60;
> +		snprintf(timer_str, sizeof(timer_str), "%02d:%02d", minutes,
> +seconds);
> +
>  		cairo_select_font_face(cr, "Helvetica",
> CAIRO_FONT_SLANT_NORMAL,
>  				       CAIRO_FONT_WEIGHT_BOLD);
> +		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
>  		font_size =3D data->height / 12.0;
> -		cairo_set_font_size(cr, font_size);
> +		cairo_set_font_size(cr, font_size / 2.0);
> +		cairo_text_extents(cr, timer_str, &ext);
> +		cairo_move_to(cr, data->width - ext.width - 20, data->height -
> 20);
> +		cairo_show_text(cr, timer_str);
>=20
> +		/* Draw HDCP status above timer */
> +		cairo_set_font_size(cr, font_size);
>  		cairo_text_extents(cr, hdcp_str, &ext);
> -		x =3D (data->width - ext.width) / 2.0 - ext.x_bearing;
> -		y =3D (data->height - ext.height) / 2.0 - ext.y_bearing;
> +		x =3D data->width - ext.width - 20;
> +		y =3D data->height - ext.height - 60;
>=20
> -		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> -		cairo_move_to(cr, x, y + ext.height);
> +		cairo_move_to(cr, x, y);
>  		cairo_show_text(cr, hdcp_str);
> +
>  		cairo_destroy(cr);
>=20
>  		primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY); @@ -521,6 +590,16 @@ static void
> stop_video_player(data_t *data)
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);  }
>=20
> +static void enable_hdcp_type(data_t *data, enum hdcp_type type) {
> +		set_hdcp_prop(data, CP_DESIRED, type, data-
> >selected_connector);
> +		pthread_mutex_lock(&data->lock);
> +		data->hdcp_type =3D type;
> +		data->video_start_time =3D time(NULL);
> +		pthread_mutex_unlock(&data->lock);
> +		start_video_player(data);
> +}
> +
>  static void test_init(data_t *data)
>  {
>  	drmModeModeInfo *mode;
> @@ -550,38 +629,100 @@ static void test_init(data_t *data)
>=20
>  		break;
>  	}
> +
> +	pthread_mutex_init(&data->lock, NULL);
> +	data->user_cmd =3D 0;
> +	data->hdcp_type =3D 0;
> +	data->running =3D true;
> +	data->video_running =3D false;
> +
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);  }
>=20
>  static void cleanup(data_t *data)
>  {
> +	stop_video_player(data);
>  	igt_remove_fb(data->fd, &data->fb);
>  	igt_display_fini(&data->display);
>  	close(data->fd);
> +	pthread_mutex_destroy(&data->lock);
>  }
>=20
>  int main(int argc, char **argv)
>  {
>  	data_t data;
> -	int option;
> -	static const char optstr[] =3D "hi";
> -	struct option long_opts[] =3D {
> -		{"help",	no_argument,	NULL, 'h'},
> -		{"info",	no_argument,	NULL, 'i'},
> -		{NULL,		0,		NULL,  0 }
> -	};
> +	pthread_t tid;
> +	const char *status =3D NULL;
> +	igt_plane_t *primary;
>=20
> +	data.selected_connector =3D -1;
>  	test_init(&data);
>=20
> -	while ((option =3D getopt_long(argc, argv, optstr, long_opts, NULL)) !=
=3D -1)
> {
> -		switch (option) {
> -		case 'i':
> +	draw_menu(&data, "INIT");
> +	primary =3D igt_output_get_plane_type(data.output,
> DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, &data.fb);
> +	igt_display_commit2(&data.display, COMMIT_ATOMIC);
> +
> +	pthread_create(&tid, NULL, keypress_thread, &data);
> +
> +	while (data.running) {
> +		int cmd;
> +
> +		pthread_mutex_lock(&data.lock);
> +		cmd =3D data.user_cmd;
> +		data.user_cmd =3D 0;
> +		pthread_mutex_unlock(&data.lock);
> +
> +		if (cmd =3D=3D 0) {
> +			usleep(100 * 1000);
> +			continue;
> +		}
> +
> +		switch (cmd) {
> +		case 1:
> +			/* Get HDCP Status */

Not needed=20

>  			get_hdcp_info(&data);
>  			break;
> -		case 'h':
> +		case 2:
> +			/* Enable HDCP 1.4 */

Not needed

> +			enable_hdcp_type(&data, HDCP_TYPE_1_4);
> +			break;
> +		case 3:
> +			/* Enable HDCP2.2 Type 0 */

Not needed

> +			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_0);
> +			break;
> +		case 4:
> +			/* Enable HDCP2.2 Type 1 */

Not needed

> +			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_1);
> +			break;
> +		case 5:
> +			/* Disable HDCP */

Not needed

> +			stop_video_player(&data);
> +			set_hdcp_prop(&data, CP_UNDESIRED,
> HDCP_TYPE_2_2_TYPE_1,
> +				      data.selected_connector);
> +			data.hdcp_type =3D HDCP_TYPE_NONE;
> +			break;
>  		default:
>  			break;
>  		}
> +
> +		/* Update menu display */

Not needed

Regards,
Suraj Kandpal

> +		if (cmd =3D=3D 1) {
> +			draw_menu(&data, "INIT");
> +		} else {
> +			status =3D get_hdcp_status(&data,
> data.selected_connector);
> +			draw_menu(&data, status);
> +		}
> +
> +		primary =3D igt_output_get_plane_type(data.output,
> DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary, &data.fb);
> +		igt_display_commit2(&data.display, COMMIT_ATOMIC);
> +
> +		usleep(200 * 1000);
>  	}
> +
> +	pthread_cancel(tid);
> +	pthread_join(tid, NULL);
>  	cleanup(&data);
> +	return 0;
>  }
> --
> 2.34.1

