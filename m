Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD4EFCC9BC
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 04:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB14310E648;
	Tue, 10 Mar 2026 04:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6QMmFcL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E416510E648
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 04:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773118435; x=1804654435;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hdK/k/hOBCox3Fab0Wp9M8xha+tQrS6f7VujvQITMoM=;
 b=K6QMmFcLyrw0CjINOt+F87PMaKTnfM2CzG1gtMATCfkYrYPxaCi+xRxH
 RP4OLtnVn/VnFXrXb7oPx0Qj4HXZWFdKpd0vt3Pq8iYyP3+/9/iNS8jO6
 t5yOXETh9IRoW7Tc5MIY6yXHMMEBSeBFd3NMYUg5ZEAZIQjwFj5MokXDK
 k+M1AWCypAREp6mrQBW9FrjNWvP2G5wfWrx59HYriD0sjN9/CBCFz6wo7
 /AtTsUBbeXertplo8YWBrcz4j8T3l/kyo1XNetIy6TOxLbDzV+m4UEV6M
 8FXkEdYC2OmAny+nNAEf3U44I40NFsPCoNq39Iv33dLd5m4cIHM3PYb4p g==;
X-CSE-ConnectionGUID: vLoqIBAJQUuArpUJGCgpWg==
X-CSE-MsgGUID: PW9q5GXnQeWjpu6wT3MQig==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73354220"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="73354220"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 21:53:54 -0700
X-CSE-ConnectionGUID: 5xW28jQ0Tligxjd274jPfA==
X-CSE-MsgGUID: 2h8b7I+MS92UPFDRPFnfcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="216405396"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 21:53:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 21:53:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 21:53:53 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 21:53:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=daaijN/vamvw+GKW2N3Bi1pm7CqwY7g98qmk12QDB3NtunBgVL5IsY/tl4f5RapkfrvpHbYMEE7ww+TefhZVKONBGZyAnMLFMpOgy4QD0NOSpSDJwSjYYwNSpAR59f9DteGfQR+1vUFUUXpiF9WTQNZnrkHGq/1x6lik5eu8GKOHDjgqhcI/8H9lodZ66lFBGJ0FjSj7OSzW55S6Bne/WC35es1lmjR3JRKVj6gcmNNziiGw9tjPbexbJjp1NNAhXcdfbkjyTdLjoBVRkzyMbSssf4df2BFes74pN9vQgY5g1XeQOkt2rmg3MoWy6MbZ69HVPK7Kaw20EBi/gJmCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1oX3Kq0uIMymSPTnaZkLBV64XtiIKuMsvWnnXPk61I=;
 b=nLLMQO6WbXXyv2XNpMmNxDvZ9sr4UW1d8WKK/6PFpXKZstXeX/kp628rswv7vIms/pGsFQ9JlumK2pI+83s7sxAJYaFX6ADsaJG2w0wz0jr/QTLWOBvIl5fLiNewWmSVQR5sP188Aa3+jmt9yPMrgwE0/1pL35V7NF0ix2PSdBYKKC5YqibIhJgFTN4xZGgzp/3KBxlhvG6q2hp6LhneiHVJmB3vqvr4EFGNWr87VCkw4IdpXANKsjPwmf4hccVr/WFi/Usom/Euc/OCerLyZk29n+Vu6uVXrxzaGjBJvvZFw2uu4AoPPT7MhRLISJchh4GeZ5Rgue2hhms2frEU7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MN2PR11MB4597.namprd11.prod.outlook.com
 (2603:10b6:208:268::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 04:53:50 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::21ae:7048:11eb:3faa]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::21ae:7048:11eb:3faa%6]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 04:53:50 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST
 suspend-resume test
Thread-Topic: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST
 suspend-resume test
Thread-Index: AQHconnkKTaEbfrRekqgkA8Xp0IxIrWcZDGggArntWCAAAH8MA==
Date: Tue, 10 Mar 2026 04:53:50 +0000
Message-ID: <DM3PPF208195D8DE08AA859115AC364DB7AE346A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260220152239.276034-1-kunal1.joshi@intel.com>
 <20260220152239.276034-4-kunal1.joshi@intel.com>
 <IA3PR11MB89376E3F2DABB48968A51817E37FA@IA3PR11MB8937.namprd11.prod.outlook.com>
 <DM3PPF208195D8DEC913CD6D3D55AB6CA39E346A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DEC913CD6D3D55AB6CA39E346A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MN2PR11MB4597:EE_
x-ms-office365-filtering-correlation-id: 3cba310f-cf1a-4223-515a-08de7e6105da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: uR9KUnW1vnQnLqEjweW2VaGVG3ixeJZyXQVP70vrFgVcovIhDDVENQP2alMzRgfCUzhUw52auvW1hl8q+DsrQEHNpUljrtIZJfWv6/JDpZm9p1SyvBbMvfbsI49nHY6vxIPIApone93B+LNc0/d1qzMhwuFuCOuWGgWbY7ZGmWQbfKr14skneMifa066sB7Pc1ho3+TVHT3l5rWQr6gytQewWqrquVj+MC6s+uwgjy2LxEUTHXyyVAY9x4l796oCtnELuL4KKaJEE+fgYULO06IdKxtpGZiIzAwkRghV8NXSIHJ37EDnYwiQ0sYm4ay9vitOljVvThuSVUJOKeANH48RS29UHXjb6y+VOqRwKM1blOAwrOweOINxa/w+1eqV26yAfT6dxStavi6px+z5I+UVy5x7I16SdW0+dMAiHCerMbKHBU0by1nJ30t8iLzoFKC03nBgMaGdRgDMD0XUKhKRsAvXtWsrWqcXqcI/7vhRKy20tXlguG8ONjkKhgiwT++dVagVz3wI7Pij7EbZgcDv2XMtM/4BhsJNJH7fJo3i4k7NxjvLyrIaSBh6CS3OwjuYjwMrZy8FL1SMbusk5b3ih38L2noEH2tRqEStTYgbUoXsE9gEcLCvlTfwXfyVn8E/xHF7ezP2efYk4wXLYWrXO8BPC1TePg4F8BEFh0bS5rFI96FQ6XCtcjUlAlrUoYUhU3LFwcSOPo7rkJojzWujl+mOsi8RZu6j1SFzskzseCMJkuJDV7ZCVCoMwZcAKA+nlAwlOPZgCZ7Ia9EJRsTeDoxzoGgSBzMc0RBrhZY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F3WjXEGGrhty1ajtBmoxjpmQqjvTuVO7fi3zXKG4v26UA93LgaSU221iNhp9?=
 =?us-ascii?Q?TXd+02nTolaVRw2MY09bqLZg1rvBvgpI7vjrE6qE/q+w4dnAp9PZaJy7Raw0?=
 =?us-ascii?Q?1EJiILY8RdAXanbyRh99Mmss3XsjzkuiSk6oYYAiDQbpR0XtfGe1LFGtn5L4?=
 =?us-ascii?Q?cj18ZW91SvYWak2JsjJZlIgAx5I7ECwzLVjXt9L+PtCrTe8vftb/ZKzNhKtj?=
 =?us-ascii?Q?akyeg0f7S8n2eTBbMwUMXgjhUq11Ls7tILF0vavX9RWANEc0YCT2Y7KTKaRZ?=
 =?us-ascii?Q?XSLaOkMslFy6VhwHZAIrHLgDHn6HKUJwl/y09Jhf6CfhbHywjeUtTlw90FOo?=
 =?us-ascii?Q?wc+YmFL8UnPxwp6aya2ZeR5cbzykjht+V6nQyTEmhG6/BB8OTWzHl6aNldGg?=
 =?us-ascii?Q?a12u+48n65Lyoq5aTpe70/IwRSfvz0qGITad5OO/lew6YJGoU2VLBCsldbC6?=
 =?us-ascii?Q?lw/DOmqTsWPUUFbQVcbwaX+MRsSHT8BON8fEwGp4wIk44dPlS+iCbELkTefj?=
 =?us-ascii?Q?Njs8fqV51dY62dIInFCznZfLo9qOwp68skjjpFStHbcaNbNKWQbyiSViAdCh?=
 =?us-ascii?Q?btct0l5h5YCB0u8twTEP6H8+33dIDiBPfZGqrQ+y05vTt9FLIobWUx1e5u3u?=
 =?us-ascii?Q?TI7H0M4DbhdhBHN5wafEwZUBL22qo/WebKz438uc81gIT7EwJR+uGWthQZTq?=
 =?us-ascii?Q?vfT2ioj6RYBQBBaLHI7fbA2n0eRYRmlhjcRk0bkIMr9xrGcysB29G+TGNeab?=
 =?us-ascii?Q?CNoGr4ZeDL1tidn4Eb2xyHjT4LZHQiOCUfQEJjQC/oAOmSg6LHzr+SAN1evs?=
 =?us-ascii?Q?HjkIDkcw0i/WR6Q7PqypalQw2dTTuBcOojxUporTPyjzgKOHsrWJavzPnyKq?=
 =?us-ascii?Q?6eefQDPDf12usGUivKlfcJ7h0ln/imIwzDnTAoBo7DC6EHBL65cdLQKbHHoM?=
 =?us-ascii?Q?rxX00zDVBui5FZh3QYNRxEN23fgHoRzbpE0kVJC3SoNYF4gFg39DKoA2gY67?=
 =?us-ascii?Q?uQfqv5qdtB2e/5yJkCiMNezbw3Cs+vEGH7+Gaih1+vaDm1xykI0IwC6QV2V5?=
 =?us-ascii?Q?q+bK/UJC/vDNlAtWUUQ5mroa2Ehu4suaH1wZx1sN6zZ7VfAxRA3YsOFj+xhA?=
 =?us-ascii?Q?muZKxNHNmeLmWqGW5u1299vRCVmhLfgTbwKJcTyYqT0pcSI3CGrbP0ZrKzKe?=
 =?us-ascii?Q?kIJNaMBCJ4ni59uU9Lh5cJUdCbfQ8x2zdf+6kB3I/K9GCcyeL1n6m+EVcWr6?=
 =?us-ascii?Q?tzNr17jyYK8jHyesjNR9cHGEJHxxPsJ+w2naUSSX1dPmS9/pTEAuovH6VQtx?=
 =?us-ascii?Q?m3zSR8Fo1jNH6jRh6X+sbEg59pPE7hfVokNQ6aLjV90hr0CFqHCHeWw3Y99j?=
 =?us-ascii?Q?scS7SGxnnsTSsxLx5eH8VYNqZasSfY8VWQ7/ApkREO782hE/pcBsDR32VQIP?=
 =?us-ascii?Q?4UtUIZb2Jcj++u/36i3Q+VA9sfJpUHFtoOpJrz/kQDY+SGwPJRx8cO1PIUqG?=
 =?us-ascii?Q?sLWbzvfaUIgZWg4YCB0coUoW+r6nbKcnNd63TrnrIoelk6Pg9FWXZ100X5HI?=
 =?us-ascii?Q?PnFHlC0dAUwy0Lm6SOKuaklv0np0awGGdArApWuyA+XlV65djhzVygnvz7rr?=
 =?us-ascii?Q?PSrMIxlfa72BCope95i8Ad8oPXVwCa+a35fUZBQ2BXYuQgyoHOsPi8uobgCu?=
 =?us-ascii?Q?mDDZH0pW4xI2BM6YthSPX2+OZPAk71iTVjSmcAeKddG1RYj1M5CADQIumkfE?=
 =?us-ascii?Q?xWBS4q+XSQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BpZpyk7dAXpiUyPP7GifAH0Syv7Bw30czLHXrgeswEQpKrcugewBOsEZyw5yTx1ZRlBF/e/9ukgcULRJ28rdxIfaBiUrORbEU2RBkwhdnb1rtJheSyf9wrqkTfqkicL1/VJAVF9PoZGDf/UuCjHDkooyymZD8o73McqftHr6M1L+9/4JgD5246B6rD6JF1UDB3uBdnJtWWWQ9Ru8kqdpbJ9nN3rSDS4vFiaUyBk9q5tWS7qOP1tinDiUkpqtGQf1+ftzfIcPUaa7984JhBqX+qOgqSTKR8rk576kkqCLHgL6R2QSiXIndPCkoODtmi4IU9lsvgSdwI4Fn4PL78X3Jg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cba310f-cf1a-4223-515a-08de7e6105da
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 04:53:50.8011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AOOMa24mBZIaRLzzIhmPa/PWAgK+voren46PNkjt0/GkCKAOGb3G95noHejUPRvqVkqoXrGkslQgGTowhkD8Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4597
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
> From: Kandpal, Suraj
> Sent: Tuesday, March 10, 2026 10:19 AM
> To: 'Kunal Joshi' <kunal1.joshi@intel.com>; 'igt-dev@lists.freedesktop.or=
g'
> <igt-dev@lists.freedesktop.org>
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: RE: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST suspend-
> resume test
>=20
> > Subject: RE: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST
> > suspend- resume test
> >
> > > Subject: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST
> > > suspend- resume test
> > >
> > > Add a new subtest mst-suspend-read-crc that verifies MST outputs
> > > preserve display content (via CRC comparison) across S3 suspend/resum=
e.
> > >
> > > The test enumerates all connected DP MST topologies, and for each
> > > root connector exercises all non-empty subsets of the discovered MST
> outputs.
> > > For each subset it:
> > >  - Assigns pipes and selects non-joiner modes
> > >  - Fits modes within bandwidth constraints
> > >  - Creates green FBs, commits, and collects pre-suspend CRCs
> > >  - Suspends to memory and resumes
> > >  - Collects post-suspend CRCs and asserts they match
> > >
> > > v2:
> > > - Add error handling for igt_pipe_crc_new (Thasleem)
> > > - Improve log format with index for clarity (Thasleem)
> > > - Order declarations in decreasing line length (Thasleem)
> > > - Add print message when no MST found (Thasleem)
> > > - Add bounds check for idx in subset loop (Thasleem)
> > > - Use igt_crtc_crc_new() instead of igt_pipe_crc_new() (Ville)
> > >
> > > v3:
> > > - framebuffers missing in commit (Bilal)
> > >
> > > v4:
> > > - Drop cleanup framework
> > >
> > > Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> > > ---
> > >  tests/kms_pipe_crc_basic.c | 314
> > > +++++++++++++++++++++++++++++++++++++
> > >  tests/meson.build          |   3 +
> > >  2 files changed, 317 insertions(+)
> > >
> > > diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> > > index f7b6ec293..59a44e92e 100644
> > > --- a/tests/kms_pipe_crc_basic.c
> > > +++ b/tests/kms_pipe_crc_basic.c
> > > @@ -32,7 +32,10 @@
> > >
> > >  #include "igt.h"
> > >  #include "igt_sysfs.h"
> > > +#include "intel/kms_mst_helper.h"
> > > +#include "intel/kms_joiner_helper.h"
> >
> > Usually you would want this declared under the below standard
> > libraries
> >
> > >  #include <errno.h>
> > > +#include <limits.h>
> > >  #include <stdbool.h>
> > >  #include <stdio.h>
> > >  #include <string.h>
> > > @@ -77,6 +80,11 @@
> > >   *              CRTC does not cause issues.
> > >   */
> > >
> > > +/**
> > > + * SUBTEST: mst-suspend-read-crc
> > > + * Description: MST suspend test for pipe CRC reads.
> > > + */
> > > +
> > >  static bool extended;
> > >  static enum pipe active_pipes[IGT_MAX_PIPES];  static uint32_t
> > > last_pipe; @@ -96,6 +104,306 @@ static struct {
> > >  	{ .r =3D 0.0, .g =3D 1.0, .b =3D 1.0 },
> > >  };
> > >
> > > +#define MAX_MST_OUTPUT 3
> > > +
> > > +static void collect_single_crc(igt_crtc_t *crtc, igt_crc_t *crc) {
> > > +	igt_pipe_crc_t *pipe_crc;
> > > +
> > > +	pipe_crc =3D igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
> > > +	igt_assert(pipe_crc);
> > > +	igt_pipe_crc_collect_crc(pipe_crc, crc);
> > > +	igt_pipe_crc_free(pipe_crc);
> > > +}
> > > +
> > > +static void collect_crc_for_active_outputs(igt_output_t **outputs,
> > > +					   int num_outputs,
> > > +					   igt_crc_t *crcs,
> > > +					   bool post_suspend)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < num_outputs; i++) {
> > > +		igt_output_t *output =3D outputs[i];
> > > +		igt_crtc_t *crtc =3D igt_output_get_driving_crtc(output);
> > > +
> > > +		if (post_suspend)
> > > +			igt_require_f(crtc,
> > > +				      "POST-SUSPEND: no driving CRTC for %s
> > > (topology changed?)\n",
> > > +				      output->name);
> > > +		else
> > > +			igt_assert_f(crtc,
> > > +				     "PRE-SUSPEND: no driving CRTC for %s
> > > (bad pipe assignment?)\n",
> > > +				     output->name);
> > > +
> > > +		collect_single_crc(crtc, &crcs[i]);
> > > +	}
> > > +}
> > > +
> > > +static void wait_for_vblanks(igt_output_t **outputs, int num_outputs=
,
> > > +			     bool post_suspend)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < num_outputs; i++) {
> > > +		igt_crtc_t *crtc =3D igt_output_get_driving_crtc(outputs[i]);
> > > +
> > > +		if (post_suspend)
> > > +			igt_require_f(crtc,
> > > +				      "POST-SUSPEND: no driving CRTC for %s
> > > during vblank wait (topology changed?)\n",
> > > +				      outputs[i]->name);
> > > +		else
> > > +			igt_assert_f(crtc,
> > > +				     "PRE-SUSPEND: no driving CRTC for %s
> > > during vblank wait (bad pipe assignment?)\n",
> > > +				     outputs[i]->name);
> > > +
> > > +		igt_wait_for_vblank(crtc);
> > > +	}
> > > +}
> > > +
> > > +static void log_crc_for_outputs(igt_output_t **outputs, int num_outp=
uts,
> > > +				igt_crc_t *crcs, const char *stage) {
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < num_outputs; i++) {
> > > +		igt_output_t *o =3D outputs[i];
> > > +		drmModeModeInfo *m =3D igt_output_get_mode(o);
> > > +		char *s =3D igt_crc_to_string(&crcs[i]);
> > > +		igt_crtc_t *crtc =3D igt_output_get_driving_crtc(o);
> > > +
> > > +		igt_info("[%d] %s: output %s -> crtc %s, CRC %s, mode
> > > %dx%d@%d\n",
> > > +			 i, stage, o->name,
> > > +			 igt_crtc_name(crtc),
> > > +			 s,
> > > +			 m ? m->hdisplay : -1,
> > > +			 m ? m->vdisplay : -1,
> > > +			 m ? m->vrefresh : 0);
> > > +		free(s);
> > > +	}
> > > +}
> > > +
> > > +/*
> > > + * Select non-joiner modes for all outputs to ensure CRC collection =
works.
> > > + * Joiner configurations consume multiple pipes and are not yet
> > > +validated
> > > here.
> > > + * Must be called before igt_fit_modes_in_bw() so that bandwidth
> > > +fitting uses
> > > + * the correct (non-joiner) modes.
> > > + */
> >
> > Lets remove documentation here this is a static function More over the
> > code should be self explanatory.
> >
> > > +static void select_non_joiner_modes(int drm_fd, igt_output_t **outpu=
ts,
> > > +				    int num_outputs)
> > > +{
> > > +	int max_dotclock =3D igt_get_max_dotclock(drm_fd);
> > > +	int i;
> > > +
> > > +	if (max_dotclock <=3D 0)
> > > +		max_dotclock =3D INT_MAX;
> > > +
> > > +	for (i =3D 0; i < num_outputs; i++) {
> > > +		igt_output_t *output =3D outputs[i];
> > > +		drmModeModeInfo non_joiner_mode;
> > > +
> > > +		igt_require_f(max_non_joiner_mode_found(drm_fd,
> > > +							output-
> > > >config.connector,
> > > +							max_dotclock,
> > > +							&non_joiner_mode),
> > > +			      "No non-joiner mode found for %s\n",
> > > +			      output->name);
> > > +		igt_output_override_mode(output, &non_joiner_mode);
> > > +	}
> > > +}
> > > +
> > > +static void create_fbs_for_outputs(int drm_fd, igt_output_t **output=
s,
> > > +				   int num_outputs, struct igt_fb *fbs) {
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < num_outputs; i++) {
> > > +		igt_output_t *output =3D outputs[i];
> > > +		drmModeModeInfo *mode =3D igt_output_get_mode(output);
> > > +		igt_plane_t *primary;
> > > +
> > > +		igt_require_f(mode, "No mode available for output %s\n",
> > > +output->name);
> > > +
> > > +		primary =3D igt_output_get_plane_type(output,
> > > DRM_PLANE_TYPE_PRIMARY);
> > > +
> > > +		igt_create_color_fb(drm_fd,
> > > +				    mode->hdisplay, mode->vdisplay,
> > > +				    DRM_FORMAT_XRGB8888,
> > > +				    DRM_FORMAT_MOD_LINEAR,
> > > +				    0.0, 1.0, 0.0,  /* Green color */
>=20
> No need to add comment mentioning green color
>=20
> > > +				    &fbs[i]);
> > > +		igt_plane_set_fb(primary, &fbs[i]);
> > > +	}
> > > +}
> > > +
> > > +static void run_mst_subset_and_verify(igt_display_t *display,
> > > +				      igt_output_t **active_outputs,
> > > +				      int num_active,
> > > +				      int n_crtcs,
> > > +				      uint32_t master_pipes_mask,
> > > +				      uint32_t valid_pipes_mask) {
> > > +	igt_crc_t pre_crcs[MAX_MST_OUTPUT];
> > > +	igt_crc_t post_crcs[MAX_MST_OUTPUT];
> > > +	struct igt_fb fbs[MAX_MST_OUTPUT];
> > > +	uint32_t used_pipes_mask =3D 0;
> > > +	enum igt_suspend_test stest =3D SUSPEND_TEST_NONE;
> > > +	int drm_fd =3D display->drm_fd;
> > > +	int a;
> > > +
> > > +	igt_require_f(num_active <=3D n_crtcs,
> > > +		      "Not enough crtcs for MST subset\n");
> > > +
> > > +	igt_require(igt_assign_pipes_for_outputs(drm_fd,
> > > +						 active_outputs,
> > > +						 num_active,
> > > +						 n_crtcs,
> > > +						 &used_pipes_mask,
> > > +						 master_pipes_mask,
> > > +						 valid_pipes_mask));
> > > +
> > > +	select_non_joiner_modes(drm_fd, active_outputs, num_active);
> > > +
> > > +	igt_require_f(igt_fit_modes_in_bw(display),
> > > +		      "Unable to fit modes in bw\n");
> > > +
> > > +	create_fbs_for_outputs(drm_fd, active_outputs, num_active, fbs);
> > > +
> > > +	igt_display_commit2(display, COMMIT_ATOMIC);
> > > +
> > > +	/* rtcwake cmd is not supported on MTK devices */
> > > +	if (is_mtk_device(drm_fd))
> > > +		stest =3D SUSPEND_TEST_DEVICES;
> > > +
> > > +	igt_info("MST subset: %d outputs, n_crtcs=3D%d\n",
> > > +		 num_active, n_crtcs);
> > > +
> > > +	wait_for_vblanks(active_outputs, num_active, false);
> > > +	wait_for_vblanks(active_outputs, num_active, false);
>=20
> Why the need of two vblanks when each wait for vblank here iterates over =
All
> MST connectors and waits for each one to send a vblank.
>=20
> > > +
> > > +	collect_crc_for_active_outputs(active_outputs,
> > > +				       num_active,
> > > +				       pre_crcs, false);
> > > +
> > > +	log_crc_for_outputs(active_outputs, num_active, pre_crcs,
> > > +"PRE-SUSPEND");
> > > +
> > > +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, stest);
> > > +
> > > +	wait_for_vblanks(active_outputs, num_active, true);
> > > +	wait_for_vblanks(active_outputs, num_active, true);
>=20
> Same here .
>=20
> > > +
> > > +	collect_crc_for_active_outputs(active_outputs,
> > > +				       num_active,
> > > +				       post_crcs, true);
> > > +
> > > +	log_crc_for_outputs(active_outputs, num_active, post_crcs,
> > > +"POST-SUSPEND");
> > > +
> > > +	for (a =3D 0; a < num_active; a++)
> > > +		igt_assert_crc_equal(&pre_crcs[a], &post_crcs[a]);
> > > +
> > > +	/* Detach FBs from planes and remove them to leave a clean state */
> > > +	for (a =3D 0; a < num_active; a++) {
> > > +		igt_plane_t *primary =3D
> > > +			igt_output_get_plane_type(active_outputs[a],
> > > +
> > > DRM_PLANE_TYPE_PRIMARY);
> > > +		igt_plane_set_fb(primary, NULL);
> > > +		igt_remove_fb(drm_fd, &fbs[a]);
> > > +	}
> > > +}
> > > +
> > > +static void mst_suspend_read_crc(igt_display_t *display) {
> > > +	int n_crtcs =3D igt_display_n_crtcs(display);
> > > +	igt_output_t *active_outputs[MAX_MST_OUTPUT];
> > > +	/*
> > > +	 * igt_find_all_mst_output_in_topology() internally caps
> > > +	 * discovery at IGT_MAX_PIPES entries, so this is the
> > > +	 * correct upper bound for the buffer.
> > > +	 */
> >
> > Never seen a comment over a variable declaration. Makes me wonder if
> > this comment Belongs elsewhere ?
> > Also can we group all structs together then int then ... while
> > declaring seems more cleaner that way
> >
> > This is just what I see at the first pass of this patch I  am still
> > going through the logic would appreciate it If you could hold off on
> > another revision till I get the time to verify the logic
> >
> > Regards,
> > Suraj Kandpal
> >
> > > +	igt_output_t *mst_outputs[IGT_MAX_PIPES];
> > > +	/* Fixed upper bound for tracking traversed root connectors. */
> > > +	int traversed_roots[IGT_MAX_PIPES] =3D { 0 };
> > > +	int drm_fd =3D display->drm_fd;
> > > +	uint32_t valid_pipes_mask =3D 0;
> > > +	int num_mst, i, num_active;
> > > +	uint32_t master_pipes_mask;
> > > +	igt_output_t *output;
> > > +	igt_crtc_t *crtc;
> > > +	int num_roots =3D 0;
> > > +
> > > +	for_each_crtc(display, crtc)
> > > +		valid_pipes_mask |=3D BIT(crtc->pipe);
> > > +
> > > +	igt_set_all_master_pipes_for_platform(display,
> > > &master_pipes_mask);
> > > +
> > > +	for_each_connected_output(display, output) {
> > > +		int root_id;
> > > +		bool root_seen =3D false;
> > > +
> > > +		root_id =3D igt_get_dp_mst_connector_id(output);
> > > +		if (root_id < 0) {
> > > +			igt_info("Skipping non-mst output %s\n", output-
> > > >name);
> > > +			continue;
> > > +		}
> > > +
> > > +		for (i =3D 0; i < num_roots; i++)
> > > +			if (traversed_roots[i] =3D=3D root_id)
> > > +				root_seen =3D true;
> > > +
> > > +		if (root_seen)
> > > +			continue;
> > > +
> > > +		num_mst =3D 0;
> > > +		igt_require(igt_find_all_mst_output_in_topology(drm_fd,
> > > display,
> > > +							output, mst_outputs,
> > > +							&num_mst) =3D=3D 0);
> > > +		igt_assert_f(num_mst <=3D IGT_MAX_PIPES,
> > > +			     "MST topology discovery overflow: num_mst=3D%d >
> > > IGT_MAX_PIPES=3D%d\n",
> > > +			     num_mst, IGT_MAX_PIPES);
> > > +		if (num_mst =3D=3D 0) {
> > > +			igt_info("No MST outputs found in topology for output
> > > %s\n",
> > > +				 output->name);
> > > +			igt_skip("No MST outputs found in topology\n");
> > > +		}
> > > +
> > > +		if (num_roots < IGT_MAX_PIPES)
> > > +			traversed_roots[num_roots++] =3D root_id;
> > > +
> > > +		if (num_mst > MAX_MST_OUTPUT)
> > > +			num_mst =3D MAX_MST_OUTPUT;
> > > +
> > > +		igt_dynamic_f("mst-root-%d", root_id) {
> > > +			int mask;
> > > +
> > > +			for (mask =3D 1; mask < (1 << num_mst); mask++) {
> > > +				int bit, idx =3D 0;
> > > +
> > > +				/* build subset for this bitmask */
> > > +				for (bit =3D 0; bit < num_mst; bit++) {
> > > +					if (!(mask & (1 << bit)))
> > > +						continue;
> > > +
> > > +					if (idx >=3D MAX_MST_OUTPUT)
> > > +						break;
> > > +
> > > +					active_outputs[idx++] =3D
> > > mst_outputs[bit];
> > > +				}
> > > +
> > > +				num_active =3D idx;
> > > +				if (!num_active)
> > > +					continue;
> > > +
> > > +				igt_display_reset(display);
> > > +
> > > +				run_mst_subset_and_verify(display,
> > > active_outputs,
> > > +							  num_active,
> > > n_crtcs,
> > > +							  master_pipes_mask,
> > > +							  valid_pipes_mask);
> > > +			}
> > > +		}

Should we not be doing a igt_display_reset before jump to the next output s=
o that we come back to our base configuration first.
Also I was thinking would it be much simpler to have a loop filling all the=
 root id first and then another dynamic _f test running over all collected =
info
Instead of having that nested with for each connected output

Regards,
Suraj Kandpal

> > > +	}
> > > +}
> > > +
> > >  static bool simulation_constraint(igt_crtc_t *crtc)  {
> > >  	if (igt_run_in_simulation() && !extended && @@ -525,6 +833,12 @@
> > int
> > > igt_main_args("e", NULL, help_str, opt_handler, NULL)
> > >  		}
> > >  	}
> > >
> > > +	igt_describe("MST suspend test for pipe CRC reads.");
> > > +	igt_subtest_with_dynamic("mst-suspend-read-crc") {
> > > +		igt_require(igt_display_has_mst_output(&data.display));
> > > +		mst_suspend_read_crc(&data.display);
> > > +	}
> > > +
> > >  	igt_fixture() {
> > >  		igt_display_fini(&data.display);
> > >  		drm_close_driver(data.drm_fd);
> > > diff --git a/tests/meson.build b/tests/meson.build index
> > > 7f356de9b..06c0d8e98 100644
> > > --- a/tests/meson.build
> > > +++ b/tests/meson.build
> > > @@ -399,6 +399,9 @@ extra_sources =3D {
> > >             join_paths ('intel', 'kms_joiner_helper.c') ],
> > >  	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> > >  	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
> > > +	'kms_pipe_crc_basic': [
> > > +		join_paths ('intel', 'kms_mst_helper.c'),
> > > +		join_paths ('intel', 'kms_joiner_helper.c') ],
> > >  	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],  }
> > >
> > > --
> > > 2.43.0

