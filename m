Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCB3C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 12:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE5510E93F;
	Thu,  1 Aug 2024 12:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BqaVNfvb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AC210E93F
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722515537; x=1754051537;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pG9i0sjKIekCZzC8/BYWJJoeGHmAetwYYE8Syv+Jwuk=;
 b=BqaVNfvbRBqUcbzezuFfNAXx8K8sgFRBnaUvDyQe5ikPTg5t6vGrXxS/
 oZN/CSNQBA8iTUS7pedQ0dDr7uKOEDClehZbEDggBN5QuY0FpKsshbhdt
 LdyuHhZKT1DFKNJAUimPZcTAwX4BPXHarSB8zCqBriBawGZstczLT8C55
 UuroXDFN1QdsOCMKlwQK8yXke+IAAIOuXsnuQU4z64ieXBeYBGM/Xc1lk
 4Lbq2lBEI3mqB3T98b+PUFl400MV4c5tNP+FF02qN6IjiW/+lqSMsA4yR
 3fXctUwLHJ1LHjGzTLDzk1dhlAux21rcFx34A7v2wvNDlCX+74ujWS2eI A==;
X-CSE-ConnectionGUID: hX0YM/6KSoy7qafbTsIOUA==
X-CSE-MsgGUID: ddmHhx1kTguIR9JnyKE6Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37929556"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="37929556"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:32:04 -0700
X-CSE-ConnectionGUID: AuDfFY49T/y/YPDYS3nwvw==
X-CSE-MsgGUID: EKcWqwo4TKG3oJsBGb/JMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55802898"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 05:32:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:32:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 05:32:03 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 05:32:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjiJGASLU9YjcD+ub7765uQqTJ7MsmR/7mHb5NH/ac2neMSn+WQgSx0mqaKbYRHoSMtrUFC5rIDiEg/T7uFuSTX5IsHt9fCZ2fUr+is2Gqq+Colj3sAQedcaFIN5A0rYfAaGE0rTRMUmq5SpndLpfb7GNfafJDI4WwX3+lzmUx+j0eimQntKG9IA70QXuh3bg+3lt9Ju9DVFMDm0sBs+XKw+rOXxcNctV5RHRw6EuaIiR+2h8/D5qIagNLjVqx3DGRFcx6ONT73zlFlxPBpQNfbB0LREwOhiCwvnWnmvA5ZOTSL000gVnFFX1+egYQc1iVehYoLbIKu0ZxTDLTwyRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTQkTnPW+UuMjOBw9fj7Etg5l6t4cgzQhFmkXu+sLXY=;
 b=wh7hbLbtHzS3CirRo69DSkottybqrrExB7NAaS4ozTsBMsUHHGB+NSrrfH5jJaivISKp63sevZwilKqmf0ur5UdfGLYh3PICIaYmDfUtuwfhiSqchUVqaoZWU4PKRGwVqVUrvFGVg0xychxhFMtiNc5HhtFzujg8M50AujeIJbdt7RrVd/o2CNerRSh5M1kzAASgIOD2ZBxC3tZktecymP48ldEa8pz26589a411D1TKB1bQGscPEcwD5UFP2kBDe5kPTeidoCtDTQ6078Q1AlhWvrTMOOvQbBAosNn8A9hZ2w0wM/MtLZpleuVbGKjFEuFTIK+8i/URi1WdYpe4iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SN7PR11MB7115.namprd11.prod.outlook.com (2603:10b6:806:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 12:31:59 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 12:31:59 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 23/66] lib/xe_eudebug: Allow debugger to wait for
 client
Thread-Topic: [PATCH i-g-t v2 23/66] lib/xe_eudebug: Allow debugger to wait
 for client
Thread-Index: AQHa4nZg43ncUeJzgkCJJJ/CwgkzprISWBYA
Date: Thu, 1 Aug 2024 12:31:59 +0000
Message-ID: <DS0PR11MB7264113C390B95A97C970B77D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-24-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-24-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SN7PR11MB7115:EE_
x-ms-office365-filtering-correlation-id: be8e429c-d3f1-4ba6-03b9-08dcb225f078
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?QnzMgHz7ESXDS0qQHtIDsYP3i8oCKTxZBiNWtmyd1AmieRsw6AUaBjXeP9?=
 =?iso-8859-2?Q?UTKeRXaJlEIyjkMOv08eSbp/obe+9Q8LeC469goNAJpKHRnc0iBPut/dUi?=
 =?iso-8859-2?Q?j4VPrhkKgjhLf1xdvfGb9Y+wcbl2xJbzyrtsNTfhKA10AT/VQ59KqIiuxf?=
 =?iso-8859-2?Q?7EoZeSQZ8mAyp+DaufZ4ENOGjKVKjH4qRq8YTcoEtXs5G/6+uVy4jJ8+XT?=
 =?iso-8859-2?Q?1G/YgKXHbqw1SSokpb+2PSZJ7ErbHXMWl0i5nesJNPWibfOvblvtsqUaT0?=
 =?iso-8859-2?Q?lJozSkih5X5hvcUiegoTdHFLZXxSUq8Sh9lPLm0dcqGSoPaV+KptRG8vBR?=
 =?iso-8859-2?Q?lE0hz4PMa8tTGvdqTfbFtQij1YSEQz9KUD7IiPhW6FeGZHFSYyoSujEfh+?=
 =?iso-8859-2?Q?8fUaHx1v4KNVOsXD3Shy7pMUVnDanJ6sDTr0tWW5Lpuu2lL3M0cH2Ko6gx?=
 =?iso-8859-2?Q?Jpk2cpyxw+nwz7+OwFBG5VWtfaK0hvmfMkXu4xLDufR5AmLFxmCpgsIxaX?=
 =?iso-8859-2?Q?O2gsCJphhfp2jShGNB/KBFwe5qhyZ/HOT5jACQdXw7i4CywZWrew7/ixQC?=
 =?iso-8859-2?Q?VntewsVOp67CTtQOMudESbVMUyZiCCN5Sl9r/IgpK1px/ItLFb0+uTXZrH?=
 =?iso-8859-2?Q?lv8H6/oJeSopIW3lIKgU+Hc/sVaxQz8IGeJa4vLdigDj9Ubl7ikB6rn8aZ?=
 =?iso-8859-2?Q?Tswv3oOXPY4CpKuyC2ffG+75/qupXoElfI32epTvxfnnVHWWoKvvW4GWrJ?=
 =?iso-8859-2?Q?vYtHafQp0TzxWAwV4DHUwOUTnsMRF7+O/hklTznigquyteTyi/3x/w02fU?=
 =?iso-8859-2?Q?L3ems3NUNdEokRLP04AKnVzzEupV31IvE4c1BQgHloOWcUN6yO3WxHJizA?=
 =?iso-8859-2?Q?hnoItm8mFVB31v3RBDE8uzg0sLLfiLG4FICcfph9poNPgIGr5SGvL/rVLq?=
 =?iso-8859-2?Q?mUBZFg8bdVC1UmGiC5Q5hc5/ohXZ+MNcOqTAj9jLmNKYwnjwCjg0VBUitI?=
 =?iso-8859-2?Q?b0SwMOqsqXFGJpQSg4futifIXYa/MRFzg/Nl2rUfPdWg2h0wgIicj+BTEM?=
 =?iso-8859-2?Q?AqURXdDJ2H30FoMyBc7QivOD+/z8dktCzYXSJT/50alN4PTihQcABlXZtc?=
 =?iso-8859-2?Q?vwv+yMMK6H3uB/w+HutuyuIc+NC83nJq4QHFrJyekajp2p9O1cydp6Q+MB?=
 =?iso-8859-2?Q?j1qmoaMi5Hq3DGys9OtBCjsuJLP3SHihSeW8Drrli3SpzeL/8gY4BqVPJV?=
 =?iso-8859-2?Q?AKJWzNCSYE//Q5BVIrFr6Cm1ZMcbpxqR0PnGTzgK306Osp1JLtfznShVTn?=
 =?iso-8859-2?Q?Uk3kNe7S4fNG6R+4y5aDM2iKPV/Beulc3Ta/cZUkDVRUnYTox9/PUEZRoJ?=
 =?iso-8859-2?Q?4AvNun8cvUkbpzpclFVvZFdB6IZkmJ87F6xCriROi7EcuAmWweM+HCd9gr?=
 =?iso-8859-2?Q?Tsm6Mps6znjdQfn/s6sGNvNbTVxAwuE1LlBYxw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?JNJ2n53iPuLTqf3PvwNewLw2tQgXXX6LfYzG6aePIsMzMGu5MhzF80htQz?=
 =?iso-8859-2?Q?KzUMfmQC6p18CApP4rMB6gD48dQdStVp4XQzaZelujazZhneDqVImVVz5g?=
 =?iso-8859-2?Q?B/FCkX0zQ2gPyRbShqExy/xr3IgAwRxaHmuUinN7d9GzULPbQG3FjWv9r5?=
 =?iso-8859-2?Q?9tdVBvNDNhASM0CkA3ksPy0+hMyno07C7Xg/Os1J8C8gMfc3iGzyd1ZP3p?=
 =?iso-8859-2?Q?pkwgJJfHS7Ci++s3eCpO8m0gf9r4LU2CM2i77dS3NZ6PdPyuS8JJlcVCgV?=
 =?iso-8859-2?Q?O/IxlwKcMEH0xJsr4FzyCD1+90HLiNsvXWW/s9vlZN9nCOHml2eNMQJ9Ld?=
 =?iso-8859-2?Q?tI2i+n3ACuvhnHxdDwdWAzeJSZDvHmuEcrSGUDzsgjt7nK4EsGTxdn5hXc?=
 =?iso-8859-2?Q?aFsW2kJJeytrC4E7XcnwtJGJBiz2TU0rLHIEtaqNp+A2MrvK5Z7pQ5mH72?=
 =?iso-8859-2?Q?LxKS7d8g5Zu6qfr7gqI0XRtJBRFRgTiyHb4aQNsEQLkh1Lv+EcN3Y8SPKd?=
 =?iso-8859-2?Q?ZcbgwRGmyAIfG4WaW2HjXDfaTzfw5PhZEjsIUt09CTENyX/hFtwUAcY8O4?=
 =?iso-8859-2?Q?BhI1y0+NBWmK75RWICeT0TTTfFbemEREo73L/vzoOosborHfgCukShT4qP?=
 =?iso-8859-2?Q?yBBWqh3M2nwMk5kYyleSKN9X9elVSJ8x7woxF2ZtlbsqikCc3OMN5GuXT7?=
 =?iso-8859-2?Q?ZEeX8wgp6uoQJ2sUl1eiZTfH6tnfYG2kAav8FsTZRMgXt5gm9p+YfGJ+9S?=
 =?iso-8859-2?Q?RjIiCTyXXbU8scapk0LfTg9RXlgKwr0RsX5LSuZImy5RHaEpicnGAGEcyX?=
 =?iso-8859-2?Q?uTzmaMRv6N9xINEac0KVnNpAl6y3cUFzV0/2rze1eKsrkHhnHp6KL1GEpv?=
 =?iso-8859-2?Q?0Tg7kdfa6G78iYWjeum+8FJLKWPSYDQ0F6VwjFctxN3enz6wM0lcPJDqv/?=
 =?iso-8859-2?Q?uPEnjkxRV0XFNwdV6B5Tnkvy+D7ZAjjoknr+bh5hu+DT/XpwO+aRzsTU6E?=
 =?iso-8859-2?Q?Ph0u9xDs+6EFhgLB5x7yas9u9R0lanv7Odm6inumpwFxkv7Lm9lUI3FVtm?=
 =?iso-8859-2?Q?Du4+LLR9pbHV1Rs2tgTqfyqDZRoxnFZGK25j5ls3d3KBG/LjR6mpCgZdjD?=
 =?iso-8859-2?Q?IfS8EQuq+VaNw+sUdIfiA00qnmGbI67o4udMLhekMh0QDKwHtQH0ZfAIML?=
 =?iso-8859-2?Q?5tBFgPKekUzRaT/L3s4aNNM8KrkKrvBGurRNQWrSr4LPm38usn377mRTAE?=
 =?iso-8859-2?Q?fpLPiPT6BdKD0o0qCSTlEdIKiRlsxuxnZiXOU70CpRQFcMvj1uxWfH0zIG?=
 =?iso-8859-2?Q?KzmzaV3tEcLBHI4mS5pE5smiyh5fT3DQrDkkVFtaPYubXP5ZUooKgUr53Y?=
 =?iso-8859-2?Q?5qVUY4hat94ZJoXosZdADNg1v8Yqqj1vE5Lz/kvYiBBdNeKbLRFeTCNRyH?=
 =?iso-8859-2?Q?Ha6dyi8832jzoDPGbf6F4/ouXqja6G2dsl3U8M4gjgbLM760UXfYaZHvSY?=
 =?iso-8859-2?Q?YtWD8gXFTbL/8U1xn33B7uEkWX5mbZwM5AdAXU9tsl+bafj/JSXecT+zG7?=
 =?iso-8859-2?Q?uZ1LPviBYEvn9USZ6+daZEIqamvldiMQzJycsmlZ7vdfk4sin6uBXC2go9?=
 =?iso-8859-2?Q?zEcYYu7OOEv+Ki0o06opFUmsnj+4Pr7BI+Gou1M0My7uY9sqUctIxRedRw?=
 =?iso-8859-2?Q?VsO/BP2E2JS/JCVoGGM=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be8e429c-d3f1-4ba6-03b9-08dcb225f078
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 12:31:59.7676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LsC9VE03h2kvntwdnC3sEvjwBJX+mySCxxUC49lEYh97GNqzXYGF9cxq/20j1RnjFEFEyN4/OkeMZI2U4j0J2jHv79tDz1Ilb8bzEz4Hky5wzzu0vP80Stff5gd1Ia26
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7115
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

With typo fixed:
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 23/66] lib/xe_eudebug: Allow debugger to wait fo=
r
> client
>=20
> In some tests, we need to pause the debugger at a certain stage as the po=
int at
> which the client performs certain activities, determines the executed cod=
e path
> in the driver.
>=20
> Add a possibility to pause debugger and to signal continuation by the cli=
ent.
>=20
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 37 +++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_eudebug.h |  2 ++
>  2 files changed, 39 insertions(+)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c index
> 36eef25c7..ed1e382c7 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -45,6 +45,7 @@ struct match_dto {
>  #define CLIENT_FINI 3
>  #define CLIENT_STOP 4
>  #define CLIENT_STAGE 5
> +#define DEBUGGER_STAGE 6
>=20
>  #define DEBUGGER_WORKER_INACTIVE  0
>  #define DEBUGGER_WORKER_ACTIVE  1
> @@ -1250,6 +1251,29 @@ void xe_eudebug_debugger_signal_stage(struct
> xe_eudebug_debugger *d, uint64_t st
>  	token_signal(d->p_client, CLIENT_STAGE, stage);  }
>=20
> +/**
> + * xe_eudebug_debugger_wait_stage:
> + * @s: pointer to xe_eudebug_debugger structure
> + * @stage: stage to wait on
> + *
> + * Pauses debugger until the client has signalled the corresponding
> +stage with
> + * xe_eudebug_client_signal_stage. This is only for situatuons where
> +the actual

Typo: situations

> + * event flow is not enough to coordinate between client/debugger and
> +extra sync
> + * mechanism is needed.
> + */
> +void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s,
> +uint64_t stage) {
> +	u64 stage_in;
> +
> +	igt_debug("debugger xe client fd: %d pausing for stage %lu\n",
> +s->d->master_fd, stage);
> +
> +	stage_in =3D wait_from_client(s->c, DEBUGGER_STAGE);
> +	igt_debug("debugger xe client fd: %d stage %lu, expected %lu,
> stage\n", s->d->master_fd,
> +		  stage_in, stage);
> +
> +	igt_assert_eq(stage_in, stage);
> +}
> +
>  /**
>   * xe_eudebug_client_create:
>   * @master_fd: xe client used to open the debugger connection @@ -1397,6
> +1421,19 @@ void xe_eudebug_client_wait_done(struct xe_eudebug_client
> *c)
>  	}
>  }
>=20
> +/**
> + * xe_eudebug_client_signal_stage:
> + * @c: pointer to the client
> + * @stage: stage to signal
> + *
> + * Signals to debugger, waiting in xe_eudebug_debugger_wait_stage(),
> + * releasing it to proceed.
> + */
> +void xe_eudebug_client_signal_stage(struct xe_eudebug_client *c,
> +uint64_t stage) {
> +	token_signal(c->p_out, DEBUGGER_STAGE, stage); }
> +
>  /**
>   * xe_eudebug_client_wait_stage:
>   * @c: pointer to xe_eudebug_client structure diff --git a/lib/xe/xe_eud=
ebug.h
> b/lib/xe/xe_eudebug.h index 1343cb25c..81c33417f 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -135,6 +135,7 @@ void xe_eudebug_debugger_set_data(struct
> xe_eudebug_debugger *c, void *ptr);  void
> xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d, int type,
>  				     xe_eudebug_trigger_fn fn);
>  void xe_eudebug_debugger_signal_stage(struct xe_eudebug_debugger *d,
> uint64_t stage);
> +void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s,
> +uint64_t stage);
>=20
>  struct xe_eudebug_client *
>  xe_eudebug_client_create(int xe, xe_eudebug_client_work_fn work, uint64_=
t
> flags, void *data); @@ -142,6 +143,7 @@ void
> xe_eudebug_client_destroy(struct xe_eudebug_client *c);  void
> xe_eudebug_client_start(struct xe_eudebug_client *c);  void
> xe_eudebug_client_stop(struct xe_eudebug_client *c);  void
> xe_eudebug_client_wait_done(struct xe_eudebug_client *c);
> +void xe_eudebug_client_signal_stage(struct xe_eudebug_client *c,
> +uint64_t stage);
>  void xe_eudebug_client_wait_stage(struct xe_eudebug_client *c, uint64_t
> stage);
>=20
>  uint64_t xe_eudebug_client_get_seqno(struct xe_eudebug_client *c);
> --
> 2.34.1

