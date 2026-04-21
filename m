Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AF9F8FA92
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 15:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7502310ECF9;
	Tue, 21 Apr 2026 15:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PCszFTAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CEC10ECEC
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 15:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776784171; x=1808320171;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iI9amnqLDc0rFhyAsGDY/eYL5D3/ScHI385/qdVRiP8=;
 b=PCszFTAvnIBiB68R5Vi2XmJP9iZQgY3oQ02/fcqjB3hHb4VCi/Hfy+Q6
 2qH1cLRDQLosdjfog8JmvUUs7ohTvSUEi84yVr4Swv5ozUU8jdtxmZHxo
 mw9kbs2z30CiI2iX+ecJEvTF9OkUMjyVZMX/iPnBE6f+EQe1qx3FQhMYC
 R12W3v1Sq0miBb3qXc3JlFTrsLwvQN0Ws5wTMsN52UMvRKPPjkS1FGWPF
 +5XE0+54ZjvffmPSrf/iZt9eqvuiQn7RzOMkNIN9FEfVH6LoljW7qu4vG
 hZYoICKOOX36PpgM9WosJ/Gjve8xV4XX0b8fIJAqAO6UCcbvhQPEpjiDx w==;
X-CSE-ConnectionGUID: tirjVvR6Q6GzMpJ9w937NQ==
X-CSE-MsgGUID: VpHG7MuLTB2hVKvP7/eMVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="103179740"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="103179740"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 08:09:31 -0700
X-CSE-ConnectionGUID: f/li5OOCR4uCmZxVxoncFg==
X-CSE-MsgGUID: GSq4n0nmSUyjD+X0Cs/AdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="270142714"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 08:09:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 08:09:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 08:09:30 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 08:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPV8edrRnU6xeIYT04Tk7R+yalKNGQ2ikztJMr5H+aq/0qVRQDlrYbdzsqCopBU4oA8ga4i9eZOrQeBPEs1CScFvzXZ0kU+tUJdGGG4T3YB3XVegkHWkecjE1b4lfvrCqmwpdKC98kO2xSf6jvmLxlQQlG1cf0tYCZotH7rsmMDtXA+1DKLtMIw+2PslW5fpLK0M5h2wKI5vqhYmzi/sokDOrm1CNOFMKUtvwHREgkUzTLQiP5efLySAY3V3iOQqHCaCyldt6tg2kbbzs0ZKqbtXd/7JaVLRmLes0RzPjEAFap8k+0mzETtSmAgkiTMjBmY7EAhCq9RFARguSUf/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSBe5+q9rqev25jotO7rBEyszquW35vI6eNvQ3zBakM=;
 b=RDfkK2jz0M/gGLwNq7rYSEl4WrJ4fL5rAHbtBWrg8tcB391BX7R6rr2wrsoA+G+UlICLDzHJAYvhIjzsCy8L5WflHpt2jsJon7uXfjKrA2II2tJvEd1gNMW8YV6F4vjLQtG9e88ai6q3nbD3epot3as5kBbxMxvPfMh+JVn+0zYlb2PaYnwqJ3KrbIuVUtfAOOryZncCrvJG8MS549QwCiyKV6TDp7WeQn9ShRA4vP5CWk1SOqecZOCFEYmkYef1M93dS43WaNp593J17scyTnyTwSKH4NOBL/5onuLJu6DD5Zoi4ldwTlV3NAhAZSlHj90VfluA1oPC1hX89A6pNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SJ2PR11MB7519.namprd11.prod.outlook.com (2603:10b6:a03:4c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 15:09:24 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%4]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 15:09:24 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Wang, X"
 <x.wang@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: RE: [PATCH 0/4] tests/xe: Add xe_page_reclaim test suite
Thread-Topic: [PATCH 0/4] tests/xe: Add xe_page_reclaim test suite
Thread-Index: AQHcxfUj5Ba2BHj0SUCau01QKxA1XbXoxTKAgADvbBA=
Date: Tue, 21 Apr 2026 15:09:24 +0000
Message-ID: <SA1PR11MB8839DE8AA8E773BBB8D845E0AA2C2@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260406184226.1294486-6-brian3.nguyen@intel.com>
 <87qzo9t9yg.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87qzo9t9yg.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SJ2PR11MB7519:EE_
x-ms-office365-filtering-correlation-id: ca3dff1d-8e77-4f1c-229e-08de9fb7f960
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: sdY23kua667v6PYBrkkzTBvBuAUGNcKh26waRB/3SrFNF+fvDQy3IooIxBBxZPwQ6TD2fK6fM9JpffUVqWB9w+FjtW2Fblte4PmfIqGz7eIRo/zyT51y9WbO91DbRQgU9LQ4IpD38bEvHqdMFQoZnKGHRW0Tv5PWMbwQS/nFQ3pUOYAOk9tIBpmZfl5v0Pm71mhrezfyXHZ/7z3dGDcbLt399R7PezWRsA0istRO1vjb/kiY8+1lnUuilsbsJfqPn1K/Ds/2PX5WSMlDvD2GiFT8WTz8+OpRU1BdjNmyclQS1fty2GZcFXicnLr+SFn6Oj0mDLy/xE9v/gr0zjQkL/hegyU9bb0HnDVMJYW2IrLor2z3Abi2sKOGPNj1kY/2eKwMe1YEmaX2Cf14FbhrKRM15GBIRrNmudw8bvhzPFKjPo6i/G0uYagMyAY8r5YEvSh/hyGAuarrZuNjKYOeHIbqIPRkiprM2qcXfvmjgrGzlfzAc+roLilcv+4Ce5F/cK6GrSfrfa5kF5WX/kUNOwMhFKT7IN2AN0zKt/U4A9PoGmqTYht6KGs6snmKHOTvp/AK1XQ7nY9+CZBQpli9B7XHmPdftegt51f5n82yNfPiNzbfVsXvk8vPpQvVhiECeRdB0NSxV1NzBWB4vUfX0b47RMYZh3xQf+CbsS6wQdesqEfWqqaWQm0kUwg7Ea/la6eN0PPTc3Q4WRkai0su32eI2zyc/KV16kNNlCxABZK5oAti5ftKiuWKmmZYxQwdVF6wopAPSu0TpqKOnkGA6dRVp5IFxdqQE1YWJP+Hm+0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s1SBqi67fCmflUfpvNPdXHtv3SvutJXxkBTuTLXHSl74AMZnGFd3rJJ5JRPi?=
 =?us-ascii?Q?BSCvh0oGfR0kcXNx1DToV+qfDmcPKvWGR7VdgUoCNqpyPxiV+kLEdFwhsa94?=
 =?us-ascii?Q?Y7UVK9LkGBJfhlyUn3dCrhw0fWAQhQZOYxsMQiuqcrOdHj9cj6QbMamVkO0Z?=
 =?us-ascii?Q?0W0yyuFR/671A3NfK/DRYPfIS2KVxK+fZCtza8aXoUl9iIYTAE1G3p9Ep8YV?=
 =?us-ascii?Q?q2+0QAOeq8KCR86qLDd57xsecFKssCiPFyjAf2XIqbWYUSfJ6EVxQ0MOINGK?=
 =?us-ascii?Q?KGBS8jPhDQZT3iyJqWbtwxVhJbU6SN8W31udOKaZCHUdDO+iEhH1X6+agSQm?=
 =?us-ascii?Q?n82n22wDgAv40jWfbc5uUPROhsyCj2pA3rg5QvY2ZKinZbmQgUh3GHAfTFvl?=
 =?us-ascii?Q?hQj72c0QdgIUzUZr3JZkZBQlNV4hFGzJ8pU3+mDjI1zOjmonFyYrMbGReKyc?=
 =?us-ascii?Q?dZZGXsTpSC0QjnpDFtqFqJXiY+u2Ve8xzm5RkmjEQCOi5EUCV38Lx6SaVml7?=
 =?us-ascii?Q?LYC4nEGn+kSmKomrG5xXarBsT+DF5AOh4FE1lRyg/ol7FsApkGdgb5IDfFE5?=
 =?us-ascii?Q?XtmAph+UEnLJp8WgBEhjLohd2q7bYDoiQC9LdRW0pKYYuLwTlPC8USo7JtY1?=
 =?us-ascii?Q?AxO7z4qsnM4puClWdqMaDvyGlJv0g8Cyk8AGkg5FHlR/pFv4CpqhGGUElYrA?=
 =?us-ascii?Q?qSLCsX7W3c9G2hc3BcL37/ltEtlhTMHRXQQhcEXdJmNKMxvybQsGkj00xEZo?=
 =?us-ascii?Q?C1kzDyxlhuCB54SaDydf31tk1+u2S87UFipdDx1BCrfAp/eInzUxCj5HDioD?=
 =?us-ascii?Q?YVkIo0nki1Ly2aUKyqfL1UayGjAPC5e9NqXzuPeOnMpZYxsGocqgKMjTGjfL?=
 =?us-ascii?Q?E1kNfw8hIMArE2TgE/gdYLIc9MDanZU/vq6Sz+b+c5aRQWmeIAZHi1KMcTHE?=
 =?us-ascii?Q?ByxP9dt92McjVditOTMckE45h4vaSWj2QAV4i2KlG/x/1cUh5QbfvcxJEX7f?=
 =?us-ascii?Q?nSRHHQnAIXWAZ9kPwXzkCA4qqHKbXGo57mjVbfX8Y3stIYbzoG0x0SPvY3uL?=
 =?us-ascii?Q?V15GOX3lXdXYLd3gl9OBo+TkV1Kq9DxVGZaovNRJYts1OWrVqbh+XsJlNMGZ?=
 =?us-ascii?Q?dRsk2I8Obaby7mhyXl9TJoZ4fKSbxPzi8+Fj+gcq1b+XCmoQgKjLXBCDN4n5?=
 =?us-ascii?Q?q/sR1ZqqFweE7aRu5sUpBVvQRBSZEnmu0vMw5GCT70Uvc6jDQZ0hUMeH8QHX?=
 =?us-ascii?Q?8livuk5Vd6rKT5QdSuAOLuD7hmN1hnPf+0dZexKwFH41KBSC3862jrf84Dyr?=
 =?us-ascii?Q?xOtZ+ZICKyJ1GPxfTNLRL2v23Uu9l/uLHQZ8wDi6rSy2hOrhzMMhC/niZVnP?=
 =?us-ascii?Q?KMF/J/8OunAKIObtYTbTDwQoNscb9cvyelsmidfcUVwATZHeEjTmcNt71mwV?=
 =?us-ascii?Q?HSKrPOxnVorPZmxE1z9b5XFmdGLvzqSSMMEEAsG3/DXPGyDB83Ml77W+ueK0?=
 =?us-ascii?Q?9HvRO4CD8l074ao0YUnBk6ceOUx3OPCE/jZFSeAWvYZ3/Gyoa1Q4C99BTnu+?=
 =?us-ascii?Q?sdhB5tJuAO2VhlKnYWp0qc5QbuoEaPCdgIc4DTZE9g8rr/YIxBv50xiSjQqf?=
 =?us-ascii?Q?KQhJ9++IRGo+thQn0IAKsakca6LnKbtKN2lZZ8Lm4G5QyF3ElW5KPZz/D6fE?=
 =?us-ascii?Q?lOL89N1/XCMBcCDtheX1zbFPkrjOr7GhjnKuzCfiKCfPyPXN9DalkLmpRH6p?=
 =?us-ascii?Q?Y+NX/icoJpP7+txj6IB61V+DezCzprOYoV0CU7lpa+ITbfzoLsI80rOZMy0f?=
x-ms-exchange-antispam-messagedata-1: 43PE5rtRlp2nNw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wdasuly8PmDdjd+XimFXGZXOLmJO4xG+zzfAoJ/QlrKnpKV/vCSn48TTVzNXW3/pPEkz+NYKq2skQSRPc+zMnzejAYPXoGPmMi0QMZ4dPKDmGNCvqDMo1t0vqY4QI4PxwGSyPRZuCQgThRGlm7+QEbNViaDnT5EjH3nni33/fEbjcgtScu2EGuNxJyiMXJrp5EGH/MlAgfe2+ddD1Nfm3V3l0hgSMXZDwpfqne+HUWkFJqrc91SQwIw1ElAhHLQxOn/PGcUgEEFfTTgOCClXRz46BTUs+kIUxZdGM361NiwQYRzeV6dgCDZgA8fRO8VPb+0aoQzjtAo9kzbam8J+vQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3dff1d-8e77-4f1c-229e-08de9fb7f960
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 15:09:24.4689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lvWlIlG2i1diup7JM2VdXcvUzQxvevURzKy91kzePQxplTE6g9tcqjToUnr1UsdTQcxlBjkq6HlR/Xq92DunlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
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
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Monday, April 20, 2026 5:48 PM
> To: Nguyen, Brian3 <brian3.nguyen@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Wang, X <x.wang@intel.com>; Vishwanath=
apura, Niranjana <niranjana.vishwanathapura@intel.com>
> Subject: Re: [PATCH 0/4] tests/xe: Add xe_page_reclaim test suite
>=20
> On Mon, 06 Apr 2026 11:42:27 -0700, Brian Nguyen wrote:
> >
> > Page Reclamation is a Xe3p feature that optimizes TLB invalidations
> > by targeting only the specific physical pages being unmapped, rather th=
an
> > issuing a full PPC flush. With Page Reclamation, the driver maintains a
> > Page Reclaim List (PRL), on the backing pages of a VMA range, which is
> > passed into the hardware, limiting the flush to only the affected pages=
.
> >
> > PRL supports up to 512 entries and beyond that results in a fallback to
> > full TLB invalidation, and invalidating the PRL. The page reclamation t=
est
> > cases validate different combinations of the possible VMA ranges.
> >
> > The primary source of validation of these cases is derived from the
> > gt_stats in debugfs to confirm the proper PRL generation.
> >
> > Brian Nguyen (4):
> >   tests/xe: Add page reclaim test
> >   tests/xe: Add random page reclaim subtest
> >   tests/xe: Add transient display PRL skip
> >   tests/xe: Add large VMA range tests for better coverage
>=20
> I have fixed it up this time, but in the future please title the commits
> with a prefix such as 'tests/intel/xe_page_reclaim: ' or
> 'tests/xe_page_reclaim: ', as done for the other commits. The series is
> merged now. Thanks.
>=20

Got it, will do in future. Thanks for the merge!

>=20
> >
> >  tests/intel/xe_page_reclaim.c | 826 ++++++++++++++++++++++++++++++++++
> >  tests/meson.build             |   1 +
> >  2 files changed, 827 insertions(+)
> >  create mode 100644 tests/intel/xe_page_reclaim.c
> >
> > --
> > 2.43.0
> >
