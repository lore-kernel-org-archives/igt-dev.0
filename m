Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443D0CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 05:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F082110E064;
	Mon, 17 Nov 2025 05:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jk28UV/8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C3210E064
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 05:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763358173; x=1794894173;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mgXh+0IS12BQYAF/uH8/EfkO2sq/4RnsUConq64rUHI=;
 b=jk28UV/8pfLK0+b8esEIxifdNCSHLidb6/xUrt4HhTXPq4SEm7sLMFTH
 OcsOL9tstLkRKn9XVuD0WXzF5hD9AOFPhFJdrh5jfI14A7xkieb69Rywx
 V7DHIOpHve5Xjiu5bgC+WARe1/mW4lGrGiXpwNZ2bo80Uggwbqrp4p1wr
 iGw0xfp9apR4WOFSJ04yq9Ah4CxeA6ARiqVlecMpWdYxNyTqR0ciNZSa4
 hu3vwnq+uYtRi49JdBAxZc+M5BwvwQcYXIvsyWRKUBzahS8mHNAl+FL71
 js86AaqoHfdlUgx1/bXNtGc2pMrR7AcnU11uCHsbc0tIn8vDoKiyoyLJa w==;
X-CSE-ConnectionGUID: SmrGx4ZcQLyqPJLBHEDRig==
X-CSE-MsgGUID: L7IcnwGKTVe9ZieNp50U3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="67956888"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="67956888"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 21:42:52 -0800
X-CSE-ConnectionGUID: gOkycdsJTQ2i0p+EJqiNPw==
X-CSE-MsgGUID: 9QSJrh0GRYKIra9Qf23WgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="194465954"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 21:42:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 21:42:51 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 16 Nov 2025 21:42:51 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 21:42:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZ9SxkbVWDVeJnFnioYP6XwPR0L7u18bDv50uVXBXajSRgSjsSJoKXVKajv/Rvxa21b62UnIoHpheV7mnfKzsQTkx0T8H5VMzIhOrSXlaMDFhkoyDTH7m+5eUzC+wNn20qeq287/K587S6ev3Q3NKsf/felnKtXcPg3P/Ot2rLScxDqrtuv1nOLGArvfI9InmoucmDplHg91o2uFkwXJZIOkA8omEQLA7Gi5HZZbj3UXWDc/Oj/tC2h6t3kTWNcSYjV39IFLHGP++v5ekixM7iK/YMUb89wIU6zydpAW7JhCIZM61IRILW08OJ43AoMZWH82lTzgb0HYFNsIcw3qvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OA+C2XUMrQuf4CA0VISl+1D8ew9+XtP1bWZ8G+1xfuE=;
 b=RWqxhyGZ3nDpEeeLwIOg7ygvWbi0tg9kfEAi5yRyUP3YG6iNii7ZM7ZTe42VRoFQ62hq6eFhf+I3+RwAHjXSRoJ0CQ4AsVaBdWxv7fzgSI63XfIAaa35/Eh5dDOTLcpabnVWd0cSMVEI+0qH0YFnNbvtzHB0uVaUQxY8/M1JkFLc0XuFsxBHXMmlEK3eD5aimXp6WMRxxrZE9AiwWCCEF0tGQSSDdBlNTmm2fwzRoC3JWn6qkqSVKy/0+74cUbYIHO2kMmxLg7SSkI5M/RfFWwGKnRy1We9J6ieOB9iVG4F4OWcEUxvuUSmVp7uT5pLJZFt1AdcUoC9qla36obfrCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 05:42:49 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%3]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 05:42:49 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Poosa, Karthik" <karthik.poosa@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH v1 2/2] tests/intel/kms_pm_vrsr: Add test to validate VRSR
 with runtime suspend
Thread-Topic: [PATCH v1 2/2] tests/intel/kms_pm_vrsr: Add test to validate
 VRSR with runtime suspend
Thread-Index: AQHcUzWKUuO2f1OMP0CEaQ7i9dwI+7T2WXVQgAAJTFA=
Date: Mon, 17 Nov 2025 05:42:48 +0000
Message-ID: <PH7PR11MB6053CA09670D57E38A31C830E7C9A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20251111180004.11865-1-mohammed.thasleem@intel.com>
 <20251111180004.11865-3-mohammed.thasleem@intel.com>
 <PH7PR11MB6053FCBAAB36A05EB43CD987E7C9A@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6053FCBAAB36A05EB43CD987E7C9A@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA1PR11MB7109:EE_
x-ms-office365-filtering-correlation-id: f8ead1e9-4bdc-4477-31f6-08de259c246e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?y68/HGfcTjAgarJ2IRzqU7g8kxdGmSOlrbbl9F6KhhSTcws6+Xsx+MOdVWpw?=
 =?us-ascii?Q?5DbInq6C9p53F3Q+BQqUSZ5lII1TXbh875Kp5GEQCerEOea08bLjjIVz/TUd?=
 =?us-ascii?Q?nhfjmaIyJN+c43XV5m5ITCku6hY5hUL5OpTdY2NE8zc2OwLJwf4LwuSucUSM?=
 =?us-ascii?Q?CaXbF1eTDLoUlnQoe0rPWCVzp/dbKmt+ruacJUYXHn3MaEzQjW4cHLazSaSQ?=
 =?us-ascii?Q?g//6qOs6MJi0KOJ2yc5pJjh6kE/00OCuqXPF7ADf7i6KyXuH5c033EMRHvxp?=
 =?us-ascii?Q?0XyYvCnK1nQmbVx7+PuRmwB/9iMxBbNYg7m5oGKFUZrXB53ezy+bbigY9UGq?=
 =?us-ascii?Q?V0OIlb6GdrdSwhcD3GrkjqzrvSJVqRNUSuTVztDAwJcoj958veXY23gLY1q5?=
 =?us-ascii?Q?KtO6mYNjSPkKonI8fQZP52t5DSNMT2yEhv9rk3+T0lMNotPoroGZku66p/z4?=
 =?us-ascii?Q?hU2sX6KK5GftuQGmfrE+u2MR5IMomf+UxhQpNOQK02z9uqo1NwGsRpjENzdd?=
 =?us-ascii?Q?4E4faDu3fOhfH/iBrf4wWULTIOzjPvbFh9Ffsn6S3RgcSletF/+VHmEU61su?=
 =?us-ascii?Q?YKt8UJFq06HSYuBbnfSumc4x2uAmH99kf66L6MxgAZYYJjaNKWdgovB4SGDc?=
 =?us-ascii?Q?t6VvWN2HA9eXtAzz7zZ5XZD4SaNCXhr+vLwVG2T7qJvMJNaZFO8H0A7Ri4FL?=
 =?us-ascii?Q?uOSIPdwIySHgnm1IJOtZ5RchgjhxCwkkEDas7Unux2ClroPLNJ4mfs3+FxhB?=
 =?us-ascii?Q?J+chYmCP08za9b+XlzKgJ6fXgwUx0SNrLj2EiSKkwypiHT6NyrEveXTxvTJw?=
 =?us-ascii?Q?a4pAJyIsBNt0u1YAPQB8iwpQoVumCaWoMvHlanReBnYgryExXmvxrYwoTG7Z?=
 =?us-ascii?Q?06TpP8AxmHKrj+vUgtFgnBtPsTCcNaQZ8j1Bwkp0I55bpngK9sbWz1gU+YP+?=
 =?us-ascii?Q?XnIM6bTxMeZYybfGNk6wrnOZKPLY9EIF7J1mwGe+GALF5Od+m23iaY1kMUUR?=
 =?us-ascii?Q?uq8ELGbrChlJ5QTrjpNUsZUAZDZ9xv2SXCmNddfxrhOVOGQWeansZplRu8+R?=
 =?us-ascii?Q?JU/knpFsTahlDwZ1gOiLfB8z7lJolyaHYf9rGocskTvY0q8g1sTrKLGwx3FT?=
 =?us-ascii?Q?EKQQWdpzI5SQmbJbvminIc615FB4Cr9b+ekeJS+KpnSGgCVgjT0R8QsDfy7f?=
 =?us-ascii?Q?yPTgmJvm2ggl26mISpoix4SD80GjrW9b1MrUjbwak6pPGAmN+89ylwzkZujq?=
 =?us-ascii?Q?22WKv6OFnNwhSof3TopISa4kQMQvHBkKkANpxFoCmF6rLiKlZIOO0YWudUY3?=
 =?us-ascii?Q?jvc4G7VvfU6xrFr6tTT1TGiVcbMCRtR09INqKXbzIQGSbBgBSbvTpMkOIx98?=
 =?us-ascii?Q?J2yeBmOkQtgqhsXbD5v/keOr2tXK7ZRmPCumKynFnaqCcWiKBO7/KJV2wIl6?=
 =?us-ascii?Q?15mG4OK2HlE38qQf4wTNLXSS63R0DfOwkxD2A452Vk0BiiaHSNLVkoWpLcY2?=
 =?us-ascii?Q?YA0PkOnP85I5UePLB2eJIurt8LE/8OAkZSWl?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Aef7nL7gSSl7yPXtrPaANNUM7MbCxYG8VN0nyLRMyppmColfA5HswxAQzps3?=
 =?us-ascii?Q?blnjoTSJckEID/fAgbI6EpumenHRDf9Hg4PMvtaKQvJTchaob7v7EKUf6eDt?=
 =?us-ascii?Q?jvr5Ix1eRUdgHDu9St8QpRdhpJph839mj2yGNtmioQbSsZuL/ZHmG3ruHtkC?=
 =?us-ascii?Q?puOlw8bSsm4oukByB421Y1eJp1CratOeLR1Pj9i7OD32jaCJ/v1RLQkycpfO?=
 =?us-ascii?Q?b85lJQv3QvG8UPhaoe5Qx2V1tMqeH+Q280tZwSKCL7yfA2dPwgwilEkO67tb?=
 =?us-ascii?Q?0TYQ+4EDLwl0f7kw8VKqcvuns85Gw+CKb2t53B5HRi86jXJ9pJ7+25Z9HkyF?=
 =?us-ascii?Q?IpnfnK9CH/97xbU29uvjziwgiMPWHX5kr+bh5RxGL4DC1WhBUWpqdRuZemzu?=
 =?us-ascii?Q?pYF14O/xSS74VqZKbu4UiQFnydKaKl+G+3e6WbyVLOXEO1kvnSFgi6wr7bah?=
 =?us-ascii?Q?VK6zmGIGwo4nU9eWYSizChDxJy1K21QUpGJM2l31xBJtuLuLMM/v7XxvgT94?=
 =?us-ascii?Q?/rcFzWvN8hrYSFDQ8Ccw3z44Psr7kyORXBuWJhgCtKswLw3xUkfSIhkwdcda?=
 =?us-ascii?Q?fUEiz1hk76BWX+KGXRwCuMF7xPBZTUKfjdZVzsmWkWCDRJvzKolsonTRPpJf?=
 =?us-ascii?Q?44IkxFM2MraFfW4cSfhQ1Aci8hjT1t96fCAB4ytC5/Lr3vAoXk2Rk/lchM/1?=
 =?us-ascii?Q?YdhauRl4AtuLdc4LGdXK8KOQ2L1Ej+jkra65+q4J3FZMwCuSmZcptkUDi7hh?=
 =?us-ascii?Q?eNQr7qud+sMIsjgPo9ZWpY1wacif7JlOUOL4GaGkFLOXi1TRc7vaIPaWwQ/U?=
 =?us-ascii?Q?r4l3nb31sNipB2vlEN6jKGmdA7+CLupjEE59anknKe32dH6AftOC6okGVjI9?=
 =?us-ascii?Q?hGd/AZZkUtuLhBj5bgDxlmlk7iBQ9/WGVjvUidKd3qA2cUT8JZeIGh9HRXI/?=
 =?us-ascii?Q?bXc3+DHZX+WdxWHwcz10MXbHgY+rT+V4DDGF3ShSmi29PP/k0gAm+xkdygOE?=
 =?us-ascii?Q?Uk6nu9f3bdsaPyJJorNlgKcfWyKCeTpubIhB07PtAUYl2NTMeCMio6Cbwh+g?=
 =?us-ascii?Q?4HP4/c3q51ynBPPAOAzRkA8/YtXPHsxOF6u3+LoRjSIRSUB0NLcAPJ6IrHLg?=
 =?us-ascii?Q?n6VAk9GXSxL7MlMBNAp1bmcQevbru0h5JOW7A5z6dqEl2iXCF+SMQisXz+Eh?=
 =?us-ascii?Q?GyzWA5xa0bOgiGE8hNL1KrSOx6L2clFCCXTqbwhEkHtNQUFODH2K6/8TWZme?=
 =?us-ascii?Q?lT3ugsAnnhqVKI95i7NZBcC5rPQbojL3p8qt2/c5p5JMDjP4sfMmu0G5uGgI?=
 =?us-ascii?Q?o4PjnTc/tiMNKNXAoPTsk8J6rL44q1IM6McjsBWndj3FUCBVABlhQmMKArur?=
 =?us-ascii?Q?cGq1Iu8QBblMYqxFBNmylhrjsYuMHy02yTx27MRu2isRvTPD00FAlT1Ize+S?=
 =?us-ascii?Q?wrwP3zhXsmeF+f3+rmwg8ROHeVYHWnBKJB9fMMxCKuEpodMsHumGkdXdRIcD?=
 =?us-ascii?Q?xxqdNmK68ZM2NOg9LiDhUFbM86+5hwSwlrPoec0SrIgaEqjEUZTpF1vlylOX?=
 =?us-ascii?Q?sgpPMPDxfMmZdR8OMl53Q+HEg+580iV/eLqqP+h+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ead1e9-4bdc-4477-31f6-08de259c246e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 05:42:48.8788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rYWuj6FhP3bnOlYIuv5ptW1B7wb8EHMvijqSOSsNcvMIPOWokT4NuIDT1NsJoqhEinqhA2cVqcQWRK5N+4RsmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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

Hi Thasleem,

Just saw it in test file, not lib.
So, can we move these functions to lib files?

> -----Original Message-----
> From: Samala, Pranay
> Sent: Monday, November 17, 2025 10:44 AM
> To: Mohammed Thasleem <mohammed.thasleem@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Poosa, Karthik <karthik.poosa@intel.com>; B S, Karthik
> <Karthik.B.S@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>
> Subject: RE: [PATCH v1 2/2] tests/intel/kms_pm_vrsr: Add test to validate
> VRSR with runtime suspend
>=20
> Hi Thasleem,
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Mohammed Thasleem
> > Sent: Tuesday, November 11, 2025 11:30 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Poosa, Karthik <karthik.poosa@intel.com>; B S, Karthik
> > <karthik.b.s@intel.com>; Thasleem, Mohammed
> > <mohammed.thasleem@intel.com>
> > Subject: [PATCH v1 2/2] tests/intel/kms_pm_vrsr: Add test to validate
> > VRSR with runtime suspend
> >
> > This test detect primary connected panel and also adds a test for VRAM
> > Self Refresh (VRSR), focusing on display flips and power management
> > efficiency. It handles transitions between power state like runtime
> > suspend. The patch includes validation of VRAM residency and power
> > state transitions, ensuring accurate testing of VRSR functionality.
> >
> > Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> > ---
> >  tests/intel/kms_pm_vrsr.c | 83
> > +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >
> > diff --git a/tests/intel/kms_pm_vrsr.c b/tests/intel/kms_pm_vrsr.c
> > index
> > 5a96eebfa..906563dd6 100644
> > --- a/tests/intel/kms_pm_vrsr.c
> > +++ b/tests/intel/kms_pm_vrsr.c
> > @@ -46,6 +46,9 @@
> >   * SUBTEST: vrsr-system-suspend
> >   * Description: Validated VRSR during system suspend alongside active
> > display flip
> >   *
> > + * SUBTEST: vrsr-runtime-suspend
> > + * Description: Validated VRSR during runtime suspend alongside
> > + active display flip
> > + *
> >   */
> >
> >  IGT_TEST_DESCRIPTION("This test to validate VRAM Self Refresh"); @@
> > -84,6
> > +87,7 @@ typedef struct {
> >
> >  typedef enum {
> >  	SUSPEND_SYSTEM,
> > +	SUSPEND_RUNTIME
> >  } suspend_type;
> >
> >  static void setup_primary(device_t *device) @@ -440,6 +444,63 @@
> > test_exec(device_t device, int n_exec_queues, int n_execs,
> >  	active_threads =3D 0;
> >  }
> >
> > +static void dpms_on_off(device_t device, int mode) {
> Why are you writing the full helper function in the test?
> I feel this is redundant.
>=20
> > +	int i;
> > +
> > +	if (!device.res)
> > +		return;
> > +
> > +	for (i =3D 0; i < device.res->count_connectors; i++) {
> > +		drmModeConnector *connector =3D
> > drmModeGetConnectorCurrent(device.fd_xe,
> > +
> > device.res->connectors[i]);
> > +
> > +		if (!connector)
> > +			continue;
> > +
> > +		if (connector->connection =3D=3D DRM_MODE_CONNECTED)
> > +			kmstest_set_connector_dpms(device.fd_xe,
> > connector, mode);
> > +
> > +		drmModeFreeConnector(connector);
> > +	}
> > +}
> > +
> > +static void cleanup_d3(device_t device) {
> Same as above
>=20
> > +	dpms_on_off(device, DRM_MODE_DPMS_ON); }
> > +
> > +static bool setup_d3(device_t device, enum igt_acpi_d_state state) {
> Same as above
>=20
> Regards,
> Pranay
>=20
> > +	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
> > +		      "PCI power management capability not found\n");
> > +
> > +	dpms_on_off(device, DRM_MODE_DPMS_OFF);
> > +
> > +	/*
> > +	 * The drm calls used for dpms status above will result in IOCTLs
> > +	 * that might wake up the device. Let's ensure the device is back
> > +	 * to a stable suspended state before we can proceed with the
> > +	 * configuration below, since some strange failures were seen
> > +	 * when d3cold_allowed is toggle while runtime is in a transition
> > +	 * state.
> > +	 */
> > +	if
> > (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED))
> > +		return false;
> > +
> > +	switch (state) {
> > +	case IGT_ACPI_D3Cold:
> > +
> > 	igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
> > +		igt_pm_enable_pci_card_runtime_pm(device.pci_root,
> > NULL);
> > +		igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
> > +		return true;
> > +	default:
> > +		igt_debug("Invalid D3 Selection\n");
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >  static uint64_t get_mods_count(char *pkg_data)  {
> >  	char *e;
> > @@ -493,6 +554,11 @@ static void vrsr_suspend_test(device_t *device,
> > int sysfs_fd, suspend_type type)
> >  	case SUSPEND_SYSTEM:
> >  		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE,
> > SUSPEND_TEST_NONE);
> >  		break;
> > +	case SUSPEND_RUNTIME:
> > +		igt_assert(setup_d3(*device, IGT_ACPI_D3Cold));
> > +		sleep(1);
> > +		igt_assert(in_d3(*device, IGT_ACPI_D3Cold));
> > +		break;
> >  	}
> >
> >  	mods_curr_value =3D read_mods(device->debugfs_fd); @@ -502,6
> > +568,9 @@ static void vrsr_suspend_test(device_t *device, int
> > +sysfs_fd,
> > suspend_type type)
> >  	igt_assert_f(mods_curr_value > mods_prev_value,
> >  		     "Mods residency is inaccurate: %" PRIu64 "\n",
> > mods_curr_value);
> >
> > +	if (type =3D=3D SUSPEND_RUNTIME)
> > +		cleanup_d3(*device);
> > +
> >  	cleanup(*device);
> >  }
> >
> > @@ -522,6 +591,8 @@ igt_main
> >  	char buf[256];
> >  	device_t device;
> >  	int sysfs_fd, ret;
> > +	bool has_runtime_pm;
> > +	uint32_t d3cold_allowed;
> >
> >  	igt_fixture {
> >  		memset(&device, 0, sizeof(device)); @@ -542,6 +613,8 @@
> igt_main
> >  		/* Always perform initial once-basic exec checking for health
> */
> >  		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0);
> >
> > +		igt_pm_get_d3cold_allowed(device.pci_slot_name,
> > &d3cold_allowed);
> > +		has_runtime_pm =3D igt_setup_runtime_pm(device.fd_xe);
> >  		sysfs_fd =3D igt_sysfs_open(device.fd_xe);
> >  		device.res =3D drmModeGetResources(device.fd_xe);
> >  		igt_install_exit_handler(kms_poll_state_restore);
> > @@ -551,9 +624,19 @@ igt_main
> >  	igt_subtest("vrsr-system-suspend")
> >  		vrsr_suspend_test(&device, sysfs_fd, SUSPEND_SYSTEM);
> >
> > +	igt_describe("Validated VRSR during runtime suspend alongside
> > active display flip");
> > +	igt_subtest("vrsr-runtime-suspend") {
> > +		igt_require_f(has_runtime_pm, "Runtime PM not
> > available\n");
> > +		vrsr_suspend_test(&device, sysfs_fd, SUSPEND_RUNTIME);
> > +	}
> > +
> >  	igt_fixture {
> >  		close(device.debugfs_fd);
> >  		close(sysfs_fd);
> > +		igt_pm_set_d3cold_allowed(device.pci_slot_name,
> > d3cold_allowed);
> > +
> > +		if (has_runtime_pm)
> > +			igt_restore_runtime_pm();
> >  		drmModeFreeResources(device.res);
> >  		igt_display_fini(&device.display);
> >  		drm_close_driver(device.fd_xe);
> > --
> > 2.25.1

