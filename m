Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E71AEC1102
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 16:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D182710E167;
	Mon, 23 Feb 2026 16:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k98cnD8P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB1410E167
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 16:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771862815; x=1803398815;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dRYxuH8X+RkPeCjlbQs6Fo6kCW6vF/QqE0nVdt/rE0c=;
 b=k98cnD8PF5+b6qR410twqelfhdJC6p8TpPqjF8pYrjFmNc5khyYhYR/n
 PS6N2lugXaFFFX46bgtxjx3pn7DpLUkICNBK5quurQoBZM3Tqv9Yq83O0
 a2lRRmO1AXnkIFsZekLrvEPe7pnxtKYpCJ6dRvjNalDJpwuuk52y4xIxq
 OV+RC2QFn8bCCC1mOWD2Orh9V/lu7IC0LPdiuvVC5VBKmHIl05wHZJ4IR
 UkaTNoYKNUTQJZwBGQ/KLO+B06JpX6Hf2U53h/ZwCz4H9jXvnN19PBopF
 mnEPtT4SZuNNI/zmci8kBFAL79o3TgJH/JBKOG7XfF+Mpf+Gf2jYmlBif A==;
X-CSE-ConnectionGUID: Fz17MgkLQNyljqIk6bZe3A==
X-CSE-MsgGUID: GuIIoStNSDyMKJlBxjd95Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76692142"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="76692142"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 08:06:43 -0800
X-CSE-ConnectionGUID: KosaPvvrRVCZzGIkaPJYeA==
X-CSE-MsgGUID: R+rhHivcR46UkH2kAt56NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="246197636"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 08:06:43 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 08:06:42 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 08:06:42 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 08:06:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUanedR09n31w//SC0xpf7/+2atB1MHuRLnIJ6/PDf1hSSHnDWOhH+QbtjFIxfnzKjfTc8k9wFpTAnrS1msGt/YQLaTSSgcqQJm2yYN1gkKyjgOk9X98fGObp4DiGF8g6oRVU+Z5SyLpPLQx1t9sncA/g86tnBmIqrue1JmmRlHZ/Y4eOynmazE/MuHh+HwuoMrYnDqPWYKYRKyGlJJETLMfJpPEhHNkJo+gXskVCSNpw3KXU80hfWcPNv9n7TLulzQfmQfSjM5tyMknCDKrAWUCcgEzURRfjgcfquNbV1l8wAFFeS3t522uXTjGdZQsxK2/55M5wwyhZmeBpCw1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Yp9tY0+NA+0ZTuS7faygnTTTvrmv9MHJ8D86/+u+Dw=;
 b=nkQ8cV4w7BWEXe0atJrXI3Iuom6VtpsLpfRmTo5SOUZlywsI27ZvUeO+gdH1qpXEUdN7DcCyxGDwG2ALy4YjVk0Mov4OS2XflonL95dLg9+vE8P6B38i/L+mbSYuvPAuYztGGvHPn917MggW3lCSvlSz5fEkfXTU5TmP0jV7OKfczwoJHkGW8oy69bSTXgiOCwDQ701R9oXU3OUUvskfTDz5yDBaztM2+CuMFqnZzjtxWrEC4s7loWEh28k/wvJPipqCyXUXYICMywfzTXpsn/rYknxbzkS3qyGC/IsevUmbluEQE3ytBzk72GC7YUpjI8D8VxdAPr0gvINixcROEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by CO1PR11MB4834.namprd11.prod.outlook.com (2603:10b6:303:90::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 16:06:39 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 16:06:39 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Brzezinka, Sebastian"
 <sebastian.brzezinka@intel.com>
Subject: RE: [PATCH v1 2/2] tests/kms_vrr: Add connector type filtering for
 LOBF
Thread-Topic: [PATCH v1 2/2] tests/kms_vrr: Add connector type filtering for
 LOBF
Thread-Index: AQHcoK33RXRYmCbOvkuQ30u1tfD807WII6KAgAhWp4A=
Date: Mon, 23 Feb 2026 16:06:39 +0000
Message-ID: <MN0PR11MB603426712A5682BB0D52821C8177A@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260218080511.2534901-1-mohammed.bilal@intel.com>
 <20260218080511.2534901-3-mohammed.bilal@intel.com>
 <DM4PR11MB631221B056C8C98B3A06A014906AA@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB631221B056C8C98B3A06A014906AA@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|CO1PR11MB4834:EE_
x-ms-office365-filtering-correlation-id: 664d0208-ed8a-45b6-e1de-08de72f58749
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?R85RIv0oiq9ReKQ6NqFNBeqLi7ukMCqmVwfc19uhxVQkBhnCVlWJLl9GyyNh?=
 =?us-ascii?Q?ynL8AmwyHd7aXi71w7NYXiteLM5dxD7kknszy2wJMj0qPbxUrBI+eX7Crwk0?=
 =?us-ascii?Q?C3Fk352JHTNIHyMOg4SDpsFo1vn6j1ncmIbTxy3EzPKz8iGv9Dtn2O0U7TKS?=
 =?us-ascii?Q?XGXmYvrtVMx7clWD4Dz418QzBZ2RfGJLHUgaWIGUcMVKy/lzHUXR+MFE601d?=
 =?us-ascii?Q?JgoAOFdqBwoU36+2v8XgL9m25qa09eWAZ1ijgVEjD0Mj+E2kzJDKiW0uS3N5?=
 =?us-ascii?Q?sBl0qyxvrbnSw0j/E/rG0bm5E0vKAI7oBh8inAE6LN41UKtP3RnCNM4JDuRq?=
 =?us-ascii?Q?SZwIaiqzIFWVQErzS34k43JryYhJs2rLCcrcm91miuhhTUCMenmuVdEkKNwN?=
 =?us-ascii?Q?AVUrQ7PeQA4mUdRLcQBJfkHMJU+lc3hWKBVvglnh1Oa0X3mxS0PRu4v4tpSR?=
 =?us-ascii?Q?NIdVdNfuJo1OO23NqZ9uHk7GHGQd3R5DSa5Vn+FsbtVjjFfgCuovzaZsNDLB?=
 =?us-ascii?Q?NR5Fhtt++Ti+ulFx043KTejroTNljsBD0kZwqBnKObLq+PnSgT7oo6MEImVF?=
 =?us-ascii?Q?n1MhUt9BeXvpb4l35AmLyJ02WHzZsfd4edTrBe3s7uEFeXgd6MjXC0e6rv+c?=
 =?us-ascii?Q?c4B/QFtsujzjo168ZXjJpI+x8RfeIu7C2pW42XLPOVXUjfcXfQK4tV+YbK/T?=
 =?us-ascii?Q?wRd6pvDHcl9k6rFctUrXAjzpd5xgBWVNnCyMy5Spm+g+xwqPeWZJwFcaWL4q?=
 =?us-ascii?Q?tRsIWdqOCil+/Ep5qzfynIA0xlRXFsffBurYM/DWWur4ThS9/0Eh1/YdGOL8?=
 =?us-ascii?Q?EqsQiaYkudrcgSPaZhRcfzHNbdFC4wVSTHocB4lEG6J0+7u3FZz8A5nwnV88?=
 =?us-ascii?Q?I/z2AaF3n8xdr3Fji3Y+WZsgAgDdZ808BgB+HBKh8onJlE5hwtt5tezk85rv?=
 =?us-ascii?Q?kX80MY7aBJsBLyW8hPX8wp7N8FkFlzHvAtQ947g2f/kNs0i9Uyi/HaDY9yNw?=
 =?us-ascii?Q?kINvq9OhhzQVbI8QRyPAOmqA4W0dq47ZY1tEVDsw1VYS28ShEt46zPMMThdy?=
 =?us-ascii?Q?h3xWLBTMAywdvwxMqP2bR7zZdn/Yy5AArK8JA0yjFuzyhFMyP3WsTYSQhSy7?=
 =?us-ascii?Q?3ZPCoc3S5YuWKR9dJsNvEJ8JlXRpsGHi/ul5+7ZTR3wCxyX/ikQRyfWHBH5t?=
 =?us-ascii?Q?izphX3Edwqr28H6OHIOLnCLxkui08mW26o6CApne20XGrdljxsGWHc/eu8/S?=
 =?us-ascii?Q?drT+o+NmvagNLmDu8z8wgmW431TTSsqW5CNhkHDoS66com470E+5X0++1zNK?=
 =?us-ascii?Q?pCZH7+6PYkLh9CoJ5tmu34EYfZxoRUR5uhCTiDTmLqYgDDQypRnCglSE5tGx?=
 =?us-ascii?Q?cXjChTOt/igF7IG3X+jEu/Zw1ISPeRcgYPlOZuq7hoQAmMqpnf+DXBxniH5P?=
 =?us-ascii?Q?p9PVDms73lX+kLdaxjFK/sk5sXUspBEo7ehdOv2gqkOc+Xgv08uBSHJXEFbN?=
 =?us-ascii?Q?pVSIDQW1vbj4uPXmE5ZW5c8bFj+n7bGhzb0Iya3gVWpjILL5exA4n5ByN6pE?=
 =?us-ascii?Q?Ak09UGKUZzA0AdCPYUqJDviJGiwN1koZ/b0z9HJWOdDnVVe1j5kouv2IFVar?=
 =?us-ascii?Q?nHEQXPwifGb9XX+vJIvfBIU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ts2eIbL+fGzrnoS6U7Fqfd3pzFlixzHAI1KCsdVcSVZxnmjHXZkqXjDtFX2X?=
 =?us-ascii?Q?rBNv4nCQW0G9RdgVJlTUT1S6Bz1HKICQg3OYXPG9tAdMmuo1LmdVCK/NVBzT?=
 =?us-ascii?Q?+0MMNDXOcqmWk6uQ+hUN/lv7eZpfFgQgc87nhzCKCGWIB+IpXfTbooEtOwHI?=
 =?us-ascii?Q?MLr2nr6iOCo3aQlc/mMweTzzU7Vzqs+Y5aywgr8442e7yHGVNRuw6Fl7ajaC?=
 =?us-ascii?Q?Ydv/I5j+MQiPiY+tFU/xi+pcBTiGGATiAZx6Nh+uWBnXZuJvZQycl1Gf2mY0?=
 =?us-ascii?Q?WugbgCJW9XDFWUZPhjvOL3oob6Pe1jxCwdA/SAy6aZH8fLKUpI5N274k8uB+?=
 =?us-ascii?Q?X3xu4KgbVZRRL68AxM6Cj0E7xQVxn9x6zElV4WPMb0oAmUfACsTtvO+a9xW1?=
 =?us-ascii?Q?MOH2SVv5OgQKmWGfKoeZJnw7f7/5I6BRD3hD8zOzSeH53wrdZET9Q9zn2x1p?=
 =?us-ascii?Q?EqjQhwfCubAyItXMnODts3aaTSiqpKLuqxraegj0/GflpmC+By/nR7UlgQJF?=
 =?us-ascii?Q?j6vdreIurDPOo9Q9SvqHHMSrNKXOsuBBssZ7fjR01g18VUMWobZvLj0kQDwh?=
 =?us-ascii?Q?KVUpglb4AR0GtgRh0CbOlw7jLyetlyH4tsfatwIPoyhFUf5X3YBY/Bt5Ol9d?=
 =?us-ascii?Q?bmfwJ4u7B8eL/EnZGUdvVGIcMieTU9OKxsTVlyTdcMNKnt4TIPBEzT/aKapT?=
 =?us-ascii?Q?MD2Auh6Ec1Iu8Gmm5QidpcVYWHFLqQPaoL3Hoi7MH0CQuW9NeJhKkVmwVMcl?=
 =?us-ascii?Q?27oGansMM9yjAWExcvTzCDAXSzQGh4qoh5crJ8J5wOoumrIt9/qEdz8vdVfj?=
 =?us-ascii?Q?3Fji1FogkM9tmtxQUFuD9S/Kgeo3AQfhbrUQbEIu8XUV6+e1MmHR7GijFQ0z?=
 =?us-ascii?Q?HqRoVwgY9hz9ctOEIvKWPsnlaOiwFXmNof+Vgb3iBVEAKAZaeo+CR1NkmA5p?=
 =?us-ascii?Q?7s23PZ0kp3uHxlWZPfGKUtf9HakyhmoEV5f43nyuWcISJrs0KZtut958/WfI?=
 =?us-ascii?Q?nwkWWdhxrZVCFvd1z1y/bP7eg2kE8bd5CvDglueL1irt8CVlt+J2UVlodvsW?=
 =?us-ascii?Q?pNplg3kjEFtCu0/95xpxpgvIExn4bIaz9oPYdXW/Oa3cXYjtAVQmi2Nw0fz4?=
 =?us-ascii?Q?67TDX2EgqAeva9LhnWvR4mYjkXo8Xk9Sg2a+FotMAc43SuYbLTQqy3ruTyd4?=
 =?us-ascii?Q?dV44Tsbzi+Q+A1JgQGTFR6cYOd1AzdlJWmOwZ5Dh6TU7yB7f4SdRavc0w7jD?=
 =?us-ascii?Q?czor1r8RyncySrD7YHG0bNZe4UYI+Cw3301C7O/umeLASHGXswzlkvMyB91j?=
 =?us-ascii?Q?LcSnT3UQgXlLFxuzwF1IJ+LUiHkI36EbXhPA4yiY7t8VrSCKhre6qd7xamyL?=
 =?us-ascii?Q?/ZpuRp1PlaaPJoIs0elmt6P+FFqCcYG/GEJ70HJA71NHQHPYbcDy3fW3VvTD?=
 =?us-ascii?Q?3Dd+fBi/3mVB4zQ3AYZLw4arGvsl6+TccK1ctDrjevFmwiwZOAfSBwSUKNyR?=
 =?us-ascii?Q?4DgtK5MZVMq5RFHHkrfrw3fIIRUjRuF2TNcV/ccL7TTENTMH7r8u5sTrvQqz?=
 =?us-ascii?Q?f7RbC63jvDVjQsia+qwC8+vHbzHbWcZBQr4hjeRFTHcNsCg/i/QG5qNck/de?=
 =?us-ascii?Q?hK6R0FvcFOE2BjuOMdFy79bW/v97x0vay8BKQwh17vn8vGcvhmZoPZlJzB+0?=
 =?us-ascii?Q?nod97vj31RIh4rX1Y56OIL5O1iflUJIdAEot5SA2aQgN1eRiY8nmI8tMLyUe?=
 =?us-ascii?Q?W/xebSrSfo7mfW2hbtf6u/X2oCmdZX1+uKZyfHleOFVUPvMJw5xiZDVVLITf?=
x-ms-exchange-antispam-messagedata-1: ogDa782jvcWLqw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664d0208-ed8a-45b6-e1de-08de72f58749
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 16:06:39.4978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mirq8CBa2c+XgH5AMeVR8OeGny028bTBK10gaP4332x6i7nKy1DO6TlXi8b4i5Nw70x1G5Ai2+bR8J3VQGU8PQCAZYi0HfUBCNtrHGvgDzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4834
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
> Sent: 18 February 2026 14:12
> To: Bilal, Mohammed <mohammed.bilal@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Brzezinka, Sebastian
> <sebastian.brzezinka@intel.com>
> Subject: RE: [PATCH v1 2/2] tests/kms_vrr: Add connector type filtering f=
or LOBF
>=20
> > -----Original Message-----
> > From: Bilal, Mohammed <mohammed.bilal@intel.com>
> > Sent: Wednesday, February 18, 2026 1:35 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1
> > <kunal1.joshi@intel.com>; Lattannavar, Sameer
> > <sameer.lattannavar@intel.com>; Brzezinka, Sebastian
> > <sebastian.brzezinka@intel.com>; Bilal, Mohammed
> > <mohammed.bilal@intel.com>
> > Subject: [PATCH v1 2/2] tests/kms_vrr: Add connector type filtering
> > for LOBF
> >
> > LOBF is supported only on eDP connectors for display ver < 35.
> > From display ver >=3D 35 onwards, both eDP and DP connectors are
> > supported. Add connector type checks in output_constraint() to skip
> > unsupported connector types based on the display version.
> >
> > Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> > ---
>=20
> igt_has_lobf_debugfs check already validates kernel support, so this chan=
ge adds
> an additional layer of connector type validation.
> Is this really needed ??
>=20

Yes, I agree with you. The additional check is not required. I will remove =
it in the next series.

Thanks ,
Mohammed Bilal=20

> Thanks
> Jeevan B
>=20
> >  tests/kms_vrr.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index
> > e46e98727..cc43ce587
> > 100644
> > --- a/tests/kms_vrr.c
> > +++ b/tests/kms_vrr.c
> > @@ -1007,6 +1007,30 @@ static bool output_constraint(data_t *data,
> > igt_output_t *output, uint32_t flags
> >  	}
> >
> >  	if (flags & TEST_LINK_OFF) {
> > +		unsigned int display_ver =3D
> > +			intel_display_ver(intel_get_drm_devid(data->drm_fd));
> > +		uint32_t connector_type =3D
> > +			output->config.connector->connector_type;
> > +
> > +		/*
> > +		 * LOBF is supported only on eDP for display ver < 35.
> > +		 * From display ver >=3D 35 onwards, both eDP and DP are
> > supported.
> > +		 */
> > +		if (display_ver < 35 &&
> > +		    connector_type !=3D DRM_MODE_CONNECTOR_eDP) {
> > +			igt_info("%s: LOBF requires eDP on display ver %u.\n",
> > +				 igt_output_name(output), display_ver);
> > +			return false;
> > +		}
> > +
> > +		if (display_ver >=3D 35 &&
> > +		    connector_type !=3D DRM_MODE_CONNECTOR_eDP &&
> > +		    connector_type !=3D DRM_MODE_CONNECTOR_DisplayPort) {
> > +			igt_info("%s: LOBF requires eDP or DP connector.\n",
> > +				 igt_output_name(output));
> > +			return false;
> > +		}
> > +
> >  		if (!igt_has_lobf_debugfs(data->drm_fd, output)) {
> >  			igt_info("i915_edp_lobf_status not present for %s\n",
> >  				 igt_output_name(output));
> > --
> > 2.48.1

