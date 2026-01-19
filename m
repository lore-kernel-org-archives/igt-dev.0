Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B07D4A5EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 06:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B2C10E261;
	Mon, 19 Jan 2026 06:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOCleEyd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A3610E261
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 06:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768802913; x=1800338913;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eCKV3g7t9A7CCsWeaL5HosWuMUw/sJ7PzbyPxjlMS3I=;
 b=IOCleEydSlzOGyH2NKpm97U2tG97DSB9QtGw7pnlKUxvOmlsQk+utR2n
 Hq52XOVFi9LtLIjydpiPwWMqmFvyOg56N9M9879oDBJIjggMrsxewg6Hw
 +uy8TqjEgEnQxL3irvICHV5XXGQ0YfEXKJSy+LHz9cCMGmgifuuawMHah
 ZAih2fai1ss7FROO038GM4koWiPnDtFtAdBImS3C6O9E0Yxq9OvsI1/w2
 rUY9oKtyragxs4xSk8HxrDEIXg9Q2xzbhIIm9yjfQDt7aSsCXk0gdqaMP
 byenc24yKludmX4wEzlH2GCh0lWKdqVRJS9p+FvsXn++X7FML/7SEktej A==;
X-CSE-ConnectionGUID: LhWeNKepTqmpB3Sxinv+Fw==
X-CSE-MsgGUID: JCyHE78WTdaAgPTFsjpJfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69905162"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="69905162"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 22:08:33 -0800
X-CSE-ConnectionGUID: wxpoZiPPSvioYMfFIL6Yiw==
X-CSE-MsgGUID: Cnw7YjeATE69PFCB72k7Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="228715028"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 22:08:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 22:08:30 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 22:08:30 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 22:08:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NANdn7WLIBs2ymcgbI0a8yzQpdUBJWQMtcKiRPG11IIAWEgd1XXNmkwaT5wIR2gEOXeK0/QQIyFh8+x+B01mfqAc0jZW0M9YhNAece49yNuHG/+BHzflbpoJLzeyGRggE3zx5kY3CmZoBCZq0nJ3XiITj6lxZZqbqLqJ2ili0swA36vRJqJg/QKG09x9Em/dvQ5Q1k0U5l/JaPLd428qJ50MMjHGAGU1ERSLyWVzqNs1juExo3Exh3RQk0Ijy5v5uEOvNBU1G14l+Aw4/Xm3XvZsVhZbFZUq9gIVI48Lg0CgusxoVabRu3p83o87JP5hIQhwgubzPPCk3wANZHyjkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouE0fWpFPHqXTCBSodMNNeSbrPMS1EXib3VaWpO9gzc=;
 b=TtNivUXd/sKlyzZBbOpC27Qzx0CHeQzFS6kHg7QHtWBO0T1r/Yw/zl0PTSreoZyCTTEp34+/KUOsKkqN4Xa2W6JFqyLFr6cFnIwaXbzbXAGKvUMhDdyW1bS0s5A7+nq/xI2ywHd5MoI/vatjSIClUCp4m5ZA+LaSLxlmtO/HUbY4tsUX6rJNibI/H0GeofbZJpTV4V4wmKt+hkesWtVQA5Xa3Q+Pswru+ONq13UOOkg6qNnAN35fRFE+j1MjFdxHgHqkGNM+F0Ldr/F+e3TuMgQVE0xa15mdzYQr1dnOuKalvTV2XyD2brh006J/mlq2ZE7h4Ec85D2YQF1OG54aaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA1PR11MB6468.namprd11.prod.outlook.com (2603:10b6:208:3a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 06:08:28 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 06:08:27 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_universal_plane: Add vblank wait for
 cursor fb leak
Thread-Topic: [PATCH i-g-t v2] tests/kms_universal_plane: Add vblank wait for
 cursor fb leak
Thread-Index: AQHciQmjeuqtol0qGEmDEI9cHBL0xbVZAbgw
Date: Mon, 19 Jan 2026 06:08:27 +0000
Message-ID: <DM4PR11MB6312D0A058F384745C2FC2DA9088A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260116060932.523060-1-suraj.kandpal@intel.com>
 <20260119060524.590227-1-suraj.kandpal@intel.com>
In-Reply-To: <20260119060524.590227-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA1PR11MB6468:EE_
x-ms-office365-filtering-correlation-id: 809b8642-bf0b-4dae-c4a9-08de572129c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?CQywUIG5Ph5Jw3yQXJfcir48kFX+SwzxMw6kNL1WOyBekuNkWqR7qc1vMd4U?=
 =?us-ascii?Q?kpEdQ86DMPBx9KVgDWoJ6KQyPBkhpY/p6m7Pj+WaJkKnEXfLjvUBHitiuGVs?=
 =?us-ascii?Q?F7uybvAWCD9BTYIfsivw6yY/jT5qMyB/3Xi+QojJcNss+KFFq63qB/QT9M2D?=
 =?us-ascii?Q?Ow6yamn0k+48fgkCvWMGPGaNjb931og5/HNh6uIvan8vRrv3okS00qhQl2D4?=
 =?us-ascii?Q?UHpmK443WOHPp1+i62VcqUSnIXK3TzbFDMUfl3i6b5HyNkzh46+9rEHsXBTY?=
 =?us-ascii?Q?TWyRl0ssRur9IQAuppknj9J5FTTqb88JQUFL/MR9VRttOlDOueLiqoy0nzPb?=
 =?us-ascii?Q?F55lOnv6g8nbQOoVYctlJIDtN5rMc9Hnr/HeCicy+Kd661deuAOK1fO4zOqx?=
 =?us-ascii?Q?HyTDOasXFUAjnMBpcOxMh1K1iPqpJ+zB6HU88/w+xEtbvKO8jeHHEM3tPK2Y?=
 =?us-ascii?Q?B46Jah+xyIjZf5/ZqGmNlcR2TMCqcXMqHYZmuKPON5dx+X/vBIN49eONl1qf?=
 =?us-ascii?Q?MBqjSqo1bh48ymUqD7iice+jKajAKp9Yqb/UBY/7EbBLouNpTp9jK04z7HsO?=
 =?us-ascii?Q?CIXi0w1x81Xjn2VPDHBL2V/O34puGH5NgZ5UYtO/jy5dV/e8lpXxNJytjdr1?=
 =?us-ascii?Q?u1pE+cXxSdWr8HQ/ImGGHrUiV8iQ7PgyHw7BwJFYzy9j45Y/+poAkIpiRgwv?=
 =?us-ascii?Q?CCLuo+av7QZ+nt754cV1dwXHYFj8tyS5DyvRItPr4wj0XqFeMFLlq0+CB0i8?=
 =?us-ascii?Q?4k/Ck27XIuKVzTCtxvYr/BjFWtzpvtLY0xt+gACzBPTRIrdu0QtN+VNEC2gn?=
 =?us-ascii?Q?uJNFTcAfLnC8sAoWv9TaWiQVRCy9Xip2RXEQhW0URZIb1vv3+mZQ7XuZa29R?=
 =?us-ascii?Q?2IwpiDkLcK5TvUDuqpFtlQPDkXxO18ALEvAFDokjTprJ+VmPpFj4bocVEcyA?=
 =?us-ascii?Q?Mhm4uKk5eV2MNzGTDdcZNFAw7THRPY/7bmb34kK/iWxNU1oMGene68sOlRZz?=
 =?us-ascii?Q?43K6emfAVvCwOvuRSB/+NifGBzgUvcLuRrDwdIAiRN/uFK+qw3kw/2JLAYMX?=
 =?us-ascii?Q?5QkG73v29OMsBihCI7dHWEEINX94fkyR6tDaaPQNmuU6lqKa2SscPaCgW1Hz?=
 =?us-ascii?Q?+FZ22CauI2zJ5Jd7TeSWRD41auILZ8GBGT9vLdT9YvIlA2XzykTMKEiCPfPT?=
 =?us-ascii?Q?BV7z1m7Y4mTi8nqMhM4p7uyFSYzxPw/tPwcOj9ikauBMP4fGhyGn/Y7HbTZe?=
 =?us-ascii?Q?wDzEzYnR18d4nRDonnvGnDyxQDjbFZ8R+Fxoo455v0fYvlmcElUbuLESPYJL?=
 =?us-ascii?Q?jkllYa3+jvS4OGUm1Obe6dQYYPr6Es2MMprfjOqx4Trh3utrZHOF35VnSuvq?=
 =?us-ascii?Q?LLNb8RgYWZ3la8HA1jixZpjSgsHoSQtvO3CeDHCKXcaZynAEY1Gd4xpBluT1?=
 =?us-ascii?Q?P+lW502+a242amxTWl8vy20PBSTAbpbDoDwOL+kOM/QsPEA0JczroUtW+BFd?=
 =?us-ascii?Q?9ibTFr8grLZNUGcCPeUhHsxRHS5btn0o2rR3ptgcVSolM7BmEFL4IMFMar++?=
 =?us-ascii?Q?qmF4tkpJxnxjO38AptzUVla20HHz/y8KZSAcip9A4MThg3S9jP4eU2GmAV5C?=
 =?us-ascii?Q?F3jKh8TAURaGryxQQwhlyP4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fvuO6f3eJYObi/bnjKRzv1BWThUTMEMp6N4f7+GZIk4Lob2ozt5XFDTmbW+n?=
 =?us-ascii?Q?Ee+wmt8qMVuT1upJ68MhY68DS6suP+C565OqqsqKifSxXHuNXvpGhl3x1Aat?=
 =?us-ascii?Q?XxMi2XzolIj4pgixCYBNYQ6KL0b8Z1krCq7mqnvH1+Ix8wwCRFLTiyjn/wXn?=
 =?us-ascii?Q?lxYlg3T2mE+BpHmDdKtJ2gO20yumPBWfxBNKPxNbVt1XNYR+kNF6yEOzg0dK?=
 =?us-ascii?Q?V7YbZOMDKmV2MUgQ8ztkHbhEamY+2WuRZ3QI+ilyXsA/cYpPA++DiIjtkD3F?=
 =?us-ascii?Q?yowFR/InHJ7dkNJAu6v2g99Z/PLC/BgyMwcok8lSsDpODk8XV6LSb1WIEOiL?=
 =?us-ascii?Q?8vr7J68mE43v3MKO3Urpw1GeWWaKTO6/L3J8sQmnLDYJwPQORBU0yyFEpnCU?=
 =?us-ascii?Q?uNVKELYTgDLyqn1jP18eXbdsm1mouoSj2wsjNyGdddkFlj3OHBFjOa4kttgp?=
 =?us-ascii?Q?VAlosueT02/GBIFR2/xadyrht8MhLWmEdZ/7S4K+/gFat0np95CAIqH9tox2?=
 =?us-ascii?Q?E453HGaIDd0Rl2jBm0HP5o4AcexWeNwFIPH6mLpbMsPGhQy4ZLigCIZSL5df?=
 =?us-ascii?Q?Tqit0e12UhoEkVx5+be/ofi82qp+N/58h6m8Inbkspcv3yaEBUNl4QkptMEu?=
 =?us-ascii?Q?3KPd6TobjIq4XSkgjtVjCzW+evsGqZYhvSz5zzKLYMYbHVDI++QuqcQGHYk4?=
 =?us-ascii?Q?KMmN9fg9zJwDD3Biy5QuDr1mqhjNTMr7O/yRiSdhvLDr7yKb03cXiKgLJ0RO?=
 =?us-ascii?Q?POhF+eTDfPZAwb0O9teem+l15ElqsmS0RtmrQblYV/w5vvteQoLVByb3Ue8p?=
 =?us-ascii?Q?2LtgItfmGzihZth4WxBrzKeL8/ZtY3+T7Yj1CpyFHPEfQdY2uZzfvezFPX9O?=
 =?us-ascii?Q?u6e22XxPENtBXsLAvAEryPNo6AYK/YhzhGhpnXwDglJccf7TwTJDCPgyTLc9?=
 =?us-ascii?Q?28g1V3BS4GGk45+4QEn40O7NLjdx29L5BVBsbWuSrk6tzUsBMQExZYyRMWK/?=
 =?us-ascii?Q?XoGpyHJw9cQHyH7x9QD3f5lUmExLixaN0zT6waIcoFFJxA7J16+6o05OgG9G?=
 =?us-ascii?Q?86JpPheN7PnWfJmBe61Ee/MrBrReP2ZYUZf+w5vaXJqVh+cj5kFkgaYIa+D3?=
 =?us-ascii?Q?xoM2tLbGs15La33NCAa7S9DapViR1gG3xWbNTaMYyp3t36dx/z//loTIvFRe?=
 =?us-ascii?Q?V910rnWeZKs2Fror1k/xpITATHqh8G6i8vdfgC2zaq7oZmdULI2eDDIz2peX?=
 =?us-ascii?Q?YQo1k4ZuiuPKcvZ1TEH5gMRiFI0agIx8QUl5mcjxggo/hJbgz4Qg+TmpaDYV?=
 =?us-ascii?Q?xtWTovSCTOFhT5bkilmd/RObEf1A3gJrAPZVCeqfniPZrBnmMBlEV12MZ3yw?=
 =?us-ascii?Q?dCsC99U6fJF0gLGxWCNhDcvXKBTVn6kwmRnMmYHKIIM8zsf5hsf0PYaha0ib?=
 =?us-ascii?Q?cMxdgaX9KWsAP65FYnYvRmAfwAEHwwpKfNbBNXPOHGPT1aP/Cd6IhiSfz6rM?=
 =?us-ascii?Q?tkzrJ10uKwyAiXOJcQGMsPEctKsolmMQh3SkI/Lr0fRCPf4ZTUaJ5SI4teg9?=
 =?us-ascii?Q?Sfsvd+mQGEs3aceKe/V48O4R1KvKc6ZFYB/tvCYw81MZRK0wgD7rAOeEj35K?=
 =?us-ascii?Q?lo1hk+jXOf9qeZ8qtMxOfQ0nlSansTZuRuRnh8UQjQenJycdT1lBXjsqJAD1?=
 =?us-ascii?Q?uPAE82A2IkMtuO+K+XryN5qLP+N3as5dNavF5cYLsTN/48fi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809b8642-bf0b-4dae-c4a9-08de572129c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 06:08:27.8801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vs66lSE2KnH4pr2X0MH2wwz+VK2/SgVfBeVdAyYZAbaScJ9G2KvRZ8anppVsNqkc2PgywPOvJO19mvj1jtkMnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6468
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, January 19, 2026 11:35 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_universal_plane: Add vblank wait for =
cursor
> fb leak
>=20
> Add the vblank wait even for i915 as the legacy path uses the vblank work=
er to
> unpin cursor fbs.
>=20
> v2
> - Add closes tag [Jeevan]
>=20
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  tests/kms_universal_plane.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c in=
dex
> aa5927cdf..9ac6d01b7 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -703,16 +703,17 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe,
> igt_output_t *output)
>  			    COMMIT_ATOMIC : COMMIT_LEGACY);
>  	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
>=20
> -	/* Since unpinning of cursor fb occurs during vblank in xe, we need
> +	/*
> +	 * Since unpinning of cursor fb occurs during vblank in xe, i915
> +	 * specially in case of legacy commit we need
>  	 * to wait atleast 1 vblank for driver to remove cursor fb. We need
>  	 * 1 additional vblank because vblank event is scheduled before
>  	 * unpinning. Therefore add 2 vblank wait to ensure that all
>  	 * cursor-related framebuffers can be removed before counting the
>  	 * framebuffer.
>  	 */
> -	if (is_xe_device(data->drm_fd))
> -		igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display,
> pipe),
> -					  2);
> +	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe),
> +				  2);
>=20
>  	/* We should be back to the same framebuffer count as when we started
> */
>  	count2 =3D intel_gem_fb_count(data);
> --
> 2.34.1

