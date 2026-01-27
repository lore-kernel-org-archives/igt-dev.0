Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47F7CA6CA9
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 08:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CC110E4DB;
	Tue, 27 Jan 2026 08:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLJfgigM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9663B10E4DB
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769502628; x=1801038628;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F4ReE1NJ4LMERj0qotHE47yJhhV3MnXvjz1hcucX+eE=;
 b=CLJfgigM+dgyZw5UKxb4T0LQkVT748gak6Bfodi7KRAS0qsnJmo5lAWt
 zgZsaekgJJoJCF/8hMxEjO88NX4Rs92Vz9RoZtUVAb3Y+y07Hh1uoKBUU
 O3+F1n4w6EgcjVYU+mr/Iy3IyU/bLQOKDKw/0L2ObF0onIvW/7EB6YSlp
 My3NF9Ly1+k/XJa21ruzrlIQhNE3Yy+IbPX63eUMEMOxHrBQ2Pha762k4
 bAvCWMmIjdUikZcaiW+SGssptoZcQqBnBqusc0A8/hodsbPG2RhuSddHt
 ci2K40ydX+jk8IR+yFuOHtTlfI/tngyiCmWD57rIYKLYN8gehkV1Hcgnu g==;
X-CSE-ConnectionGUID: 2FGUL3HrRjCvYJZV8MlvKQ==
X-CSE-MsgGUID: +yWY0fb+SleunUBrKMK9vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70780505"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70780505"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 00:30:28 -0800
X-CSE-ConnectionGUID: iKgZ4gMkTFWzlmnywi8q7w==
X-CSE-MsgGUID: czAhZUuyRYKRfgBbCp6Liw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="230867315"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 00:30:28 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 00:30:27 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 00:30:27 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.34)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 00:30:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqZvDmQDvVIVX18RtOSlTfpBtKviMGp3xexTHaVnRjmznPchTH0J3zMXLJsMU61Imxnae9phDCcuK4IonQuFt09xAAJMUm9QOKHc+cAMiZ+GUNMHEguSIovujlykUgKVd9k1fCIyqXM0aeVuWl5J/uF81vNG/I5ZFUCusO+0PVyZ8kZ+hbXuGo1uDGclsp/VWQLAqBuRsZpap8AASLE6RwTWOrzRLpGTbaRDv0+e4EApXEyN8yvKm9RPNLdh+K/1XutMAgEFMMVUvfkHShhS3/m8cscyoVi6Mk1xxBg7JIEtvuinH+cGJ8S+SFtLZsvLRq3G1U9DzTxpe16agfHv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dme7zg7UvQ0hZKw95dTRHdUisYDMMzohXBZ/GG9CkGs=;
 b=sL10M5XhKQFpUIshvZl7PoTCADlQJzOhG/tXZeelHy7uRN9XjIiEiV4q+jvqJidIgdaGfD4lkWCC4gYxZGxa4dDz3bTM/CyrZS+f1px/DQ7bIEdZNT4yQbaLifYJATlAzhvsUmCZLlJ+wAcAwylrQJv15q2tKEDIzdnXbqDd1qfoo+NpuPiWxLAUsUBvlGvODZjp80GadETvke/+tx/LGxHNadbROOd6XxZQMTUoGUuMd7hGikGtmlb3xp2M4L+biR6B6/Ks2yMWOcfeUoBtyU/UqLKmVlSyqVETdpu/qgpi2CT2WGzrJL+Gf+Fxdlt7CHauw9hxviGjLocAUG3Idw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH3PR11MB7772.namprd11.prod.outlook.com
 (2603:10b6:610:120::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 08:30:17 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 08:30:17 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
 invalid_fb parameter
Thread-Topic: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
 invalid_fb parameter
Thread-Index: AQHcj0MzLVgbULUVXkufqsvSmucSv7Vlri3QgAABYlA=
Date: Tue, 27 Jan 2026 08:30:16 +0000
Message-ID: <DM3PPF208195D8D791E83C84958C85F3423E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
 <20260127043233.254107-8-sowmiya.s@intel.com>
 <DM3PPF208195D8D473384C8865D18E79369E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D473384C8865D18E79369E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH3PR11MB7772:EE_
x-ms-office365-filtering-correlation-id: 7d210583-ae41-49c0-980d-08de5d7e4cde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?vUmbTMRmyPdC9UPCxMfrZbfyvUFhd90pw4mQc46h4vHAC3yJ7tAR1ZCVX5t+?=
 =?us-ascii?Q?8CVfNQ3H8b0T+8PNVtfAI6YXE/nchTf/Jvtvd7wdoTDtwPd3bquhsVl5FLL/?=
 =?us-ascii?Q?JwDlr5Tr5io9xRBEu5t7aKG1B6/bV2Wjj9wOUes91LuZqGsYgPiGcfH+Mi06?=
 =?us-ascii?Q?U7IvU4R/TON+IZm5HDIxEEU0yWl1Zte6PXUgIm9xaDCMd1KtMliFIW5vKGP8?=
 =?us-ascii?Q?JW1NJ4n3MVXOaVN3HjZjSeJ3y/sq2LSSk/NPr8rsyJLsguv3dFoJalEqZ5dG?=
 =?us-ascii?Q?uECZS7OFfyPfYJix4DyD3THhorp1GsuqX3mxRjHxmJiMjx6UTRc8GiWcWjTQ?=
 =?us-ascii?Q?crmZyTKzyZqMfH4aI0uFUFUCngTI/Zx09/+RuaTVH0aVVP1nSHAJHPI4yRML?=
 =?us-ascii?Q?73TrxFJvrABM1ILIRVLVifA8tY3swwrBqnqk5L0l/9BRQBHQLrRdH2P/fqVV?=
 =?us-ascii?Q?jxamVatUv9EqworjxjXvbMdWR/yzQmtViSHgnAmyPaoYDft17JopD5Z5KmwS?=
 =?us-ascii?Q?btgaKkSgqVn304F75NkXcYlwpOkjc5mNWIP2ggeadQ0N841BgmBhoSiT1xbc?=
 =?us-ascii?Q?6GM7tzG/9FVQWiqomN55EZQDki6fkOpGZ0tJH0ElIqj0Mb/6H0/wlnj7p//F?=
 =?us-ascii?Q?0n+tABPyr34W48SnWaV2WQWkXrowP2lZuXGCx7uYF9YMNIR8+Qmd/7ts3dEY?=
 =?us-ascii?Q?F8f74Q2h4lFZdnSQfuTF6fIenWQKDYqq9sCI3Y4QgllXQ5Fcxv5MQDLzGoth?=
 =?us-ascii?Q?M9rRuMBS49sjCtmc63m43hvGvq2cbj8SzGiN5o47axHNP8IQe2DGc+aB4/xV?=
 =?us-ascii?Q?419eNrnrRIhippQHJeihArSQrHowceQMkWwsBjNzI1QuBfgJF3Z8OtbY4sMm?=
 =?us-ascii?Q?OEj7mMqXvhy6qJGMu9PGufTAyfqFU7mI5K/D/BZi9KiC6UR1YyNVnJHFRWaq?=
 =?us-ascii?Q?D6o/s41VjNR8iOymlgVhg1O5qsqqKjl+zp2J65Z1lESlT5m9jkClWBQ27SvN?=
 =?us-ascii?Q?HhfN7YYTgt/1bhY+OqRYZ1gH7en7irgRNxIez1GpY59mzw8MytyVb5DeYoFV?=
 =?us-ascii?Q?gcd92Dog4tqexkOt5BRlUsLJgRU8AuAFHC0LnXaO9JQz99JNB6oiX7NXD+7W?=
 =?us-ascii?Q?DI2QaKUdttGQvTlQvOP9MKGm7qH+fR/+1N2pi7vhh7+wTgGXxCOv1YBEkxfx?=
 =?us-ascii?Q?9MMhWJG2L/t9LLoYDV9Sgcf35lxQ0cO/xcOckTSTcJY5PpmPN/yKj3zukn49?=
 =?us-ascii?Q?N/z5kzh47AZOF9jhq1Pt/0V9MRlab7Ht6MKe7i8j5BbLpIav8+dJfzM2e2Ah?=
 =?us-ascii?Q?kEMqVzGuBjKNPpJjl18DnJj77Fu4ZMqgGfRN1V24dKWWiZAbp821C9bfNT2l?=
 =?us-ascii?Q?rvZin85rzQcT9ivI+euD8gQCE6J7t56ldcbXf+Ouj8GHgXVBzPIVklMLzjPw?=
 =?us-ascii?Q?LyTCFHKjw3VHRBVhS9Zn/QrDI4LK0gD975NHhRlyXKrHVgUfyz4qefcqOThc?=
 =?us-ascii?Q?dWHsBKobmHwDG74qN6W15EgoyLLTZxoS2phvky/wYVs7d7tYonk/n6pX9N5J?=
 =?us-ascii?Q?Mov8T4CynlpESHdajp9rXmtq+ZKOdU0OSxZGDc8/7xPGetw3JUFO2Fu2EVFD?=
 =?us-ascii?Q?wQi4V8sLO8FoQKnlOevcwAE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x0hGWrvAGyncM7qWoi23kF3OLZoLxN6UlU+wM889wqi8m0dUI+2w9c9/oo68?=
 =?us-ascii?Q?fQqv/XlHE/TVSkrxbEANjBclKIyhU93UzjDVXilG2+Tcv0bf1HpLlacwXE7i?=
 =?us-ascii?Q?x2NaXywaHn4+a0YHH/R/TX46lVggquqgc0Bb83xtMlOLjsQdLwnJlNtYZ//1?=
 =?us-ascii?Q?0iOnqrnj78Y4OaKwNEdRZ1sjuBS5cngk/sHehiVWNP231V7xCKTfGiyjCpOJ?=
 =?us-ascii?Q?YJIJM55VGxEuuksULZH5xmG2tjFAVVlMEe/ADEZI7fPyuSy7TGzlBttAQ9mI?=
 =?us-ascii?Q?Kisno3br2PRL5mT/1/afu8oRB9Gn1MbeIvY+tdSBc1i5a95dkx6z6kP2ENu4?=
 =?us-ascii?Q?LpgVsEEsWR3sRzW3tWw61w3jHQlp3uQ3O9QMKySmRmO5RPltHfOe9VnJf8c/?=
 =?us-ascii?Q?SyAIW35o379aY3eAHxyYyx1KODgiQzyeNjKD2DLMOF+aO7+KqFdK5R/4YN+r?=
 =?us-ascii?Q?Ve6DLW4IoO7qskDTicDZDSPz7SbFsXoEEMP9SqjrhWmAMOBBaNMCJt5NwdPo?=
 =?us-ascii?Q?kwuAcLYBWFpOzen/R3+/yaEgy6u5X84aRUCCb4Ot045LlCgqbSRCtGlpPsgb?=
 =?us-ascii?Q?+sFotQOzDUYRxGoP42+nQlTuSnfEComkGaBBna9ibYf6X9n/wyfqE/w9RahJ?=
 =?us-ascii?Q?OOpFJHUklF7bOKccStljsIhDq+9BuNH7cyQomtk60E/6AAGU2seKFr0bCilZ?=
 =?us-ascii?Q?y5WgWEzvsykZkOf3mXUCLbJyR0BR/6fEUvP2FTVETTCuYN4KTIKuk6UXEX/U?=
 =?us-ascii?Q?m5iloMrFZ6VjetaOkiX3YAfNnqzc3oyxw/5NGiJwkv+GV0m7sum2DFCe5Oin?=
 =?us-ascii?Q?AX0qVjP7TVFIsKtAWKUjdF0N6gJeUDJ2Euquj/Hz3tgXLJWmzQQI/cjeb3VW?=
 =?us-ascii?Q?ki38Qg76B3YaVSBZ1JCjLlzx0u3Z3NdBcuDcIzTeBv1zqSM/4K0dFxb8FI5p?=
 =?us-ascii?Q?bEc3pdDQqjsbXZZ0oyEgKKFtWICOT5QKxR7unOxKyb4BKQ1sBnTEKKj35M67?=
 =?us-ascii?Q?a6mzQdg5lUuIFhM4DId8lYWoVTULKiS1RShAvyyL+KOo322OdupJCMhEL7wS?=
 =?us-ascii?Q?ani2bYBtZ8J/S9KkPzhnQArPY+Q/qdKrdmvEuLzVNIvX3z/jJQu9Aht1VdM4?=
 =?us-ascii?Q?SXcQgjD8/1AVo+RNYXXAaOMrxhBU82RiIdu9NfS3rDrjOk/h2Ty/negf73g9?=
 =?us-ascii?Q?ipyovIGe0ToCEAsF1Q5uFCJ1G/RqKy5Yj93s/KpHqPUXWaFdE9PIySSkO7Pi?=
 =?us-ascii?Q?mL+tKjVu3dGHAWFwaWYUsm3/YoQu1jD98krasX0/mIHNYB/zKDE7DRuFlE3r?=
 =?us-ascii?Q?o8LEKRC05xt/ONPwiwEKvIi07sck7q/4fcbR1W4FArNJBWdEoirKr6rn9IVj?=
 =?us-ascii?Q?sFSnwrbMLBZgw5kRtGTOtvZKDymh9yAUGT4hRzdGJwCtptMR3YoHEi2kzzKI?=
 =?us-ascii?Q?EJiFqIEBHj9R+hMIauYoeLsBpPYQcH4gYNV7lGajPhDcM7NHcyb9BvIR07TC?=
 =?us-ascii?Q?PY9iHEYuK55t87HcWEpr+gQ2EX6gJPoKcLZd9qZoPwEZAFX2i/z8AJdZ3nDY?=
 =?us-ascii?Q?knuGUnTWaVYP0mLeHc3W6E8GO87+QiQ8A7MY2b8b/yEGbiP/YuQYbVR9OyOk?=
 =?us-ascii?Q?BZkrpOoBU1Mox3rR8zGC/dRcnzG3jpm16OsVlBlEblpYszJXRmxfsuSHgJZj?=
 =?us-ascii?Q?sylEPh/v0K0RuPMpJmk8WliDnhW26xGcYy3rxxOt3xjYXw5vV0MsDVpbfuZX?=
 =?us-ascii?Q?KflpLVcFLA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d210583-ae41-49c0-980d-08de5d7e4cde
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 08:30:16.9715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6ZL0Imdla/oTFuKI9n3edaHAgKZer/XzqGjYL6CYZ47qCRnxRtkLUOnzQkCXn11HM5CTsyqiBP+ixx6UHOCyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7772
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

> Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
> invalid_fb parameter
>=20
> > Subject: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
> > invalid_fb parameter
> >
> > Remove the invalid_fb/output_fb parameter since it is not used
> > anywhere in the test. Reuse the fixture's input_fb for both 8-bit and
> > 10-bit formats to simplify the setup.
> >
> > v7: Remove invalid_fb in a separate patch as per review (Suraj)
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  tests/kms_writeback.c | 12 ++----------
> >  1 file changed, 2 insertions(+), 10 deletions(-)
> >
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > 58118b8da..8d5bf5294 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -297,7 +297,7 @@ static void test_invalid_parameters(igt_output_t
> > *output, igt_fb_t *valid_fb, ig
> >  	}
> >  }
> >
> > -static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb,
> > igt_fb_t
> > *invalid_fb)
> > +static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb)
> >  {
> >
> >  	int ret;
> > @@ -706,19 +706,11 @@ int igt_main_args("b:c:f:dl", long_options,
> > help_str, opt_handler, NULL)
> >  			    (!strstr(igt_format_str(test_format), "BGR")))
> >  				continue;
> >  			igt_dynamic_f("writeback-fb-id-%s",
> > igt_format_str(test_format)) {
> > -				igt_fb_t output_fb;
> > -
> > -				fb_id =3D igt_create_fb(display.drm_fd,
> > mode.hdisplay, mode.vdisplay,
> > -
> > get_default_fb_format(&display, bpc),
> > -						      igt_fb_mod_to_tiling(0),
> > -						      &output_fb);
> > -
>=20
> Why delete these lines this patch is simply supposed to remove the param
> invalid_fb since no one uses this All these deletions go in the next patc=
h

Actually not the next patch but the previous patch and this patch need to m=
ove before the 6th patch

Regards,
Suraj Kandpal=20

>=20
> Regards,
> Suraj Kandpal
>=20
> >  				igt_skip_on(data.dump_check ||
> > data.list_modes);
> >  				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> >  					      "DRM_FORMAT_%s is not
> > supported\n",
> >  					      igt_format_str(test_format));
> > -				writeback_fb_id(output, &input_fb,
> > &output_fb);
> > -				igt_remove_fb(display.drm_fd, &output_fb);
> > +				writeback_fb_id(output, (bpc =3D=3D 8) ?
> > &input_fb : &input_fb_10bit);
> >  			}
> >  		}
> >  	}
> > --
> > 2.43.0

