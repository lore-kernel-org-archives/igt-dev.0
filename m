Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A01C19F4F
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 08:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145711134B2;
	Wed,  8 May 2024 08:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EExLFvSz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845D31134B2
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 08:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715156917; x=1746692917;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LpRnmCrM9WUCszIGY+LGyX0AqUY4pMqpsaGt6y+zBa0=;
 b=EExLFvSz3fLJJPsdnvItZivyIlVnngQoSk9PuOAI45HoK9diLqWbU9qn
 9+yjj4ILtm6FhmJ+mrF5okueOFYR4cW3BMMEZhln3pfP9PdqZUAo3s6HW
 gDr4ZmC2nfua9E1taQuUc9bV3kS/+Miqtnq/AnPhEFJF1huxG+j9XoETK
 6qGZQns/cFDN0kcDI7CtW4sLE/k0mVAu+qYEu09teqMEpMEFzA6c6qE4O
 Xo5zoG5i5FJBL2aiInrwP0D0HcrKar3x6HHr4X9jZn+q+RTbogZPkubYm
 izzeRbd4OtfzHc76sKxpAZaFQoY/bnub1hOyi3fYO3adibqmC/22XV7a0 Q==;
X-CSE-ConnectionGUID: TfDdFQbsTD+5YJ2hDs31dQ==
X-CSE-MsgGUID: AWbSS8pITMSfOjS1DBJLNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="21563928"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="21563928"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 01:28:37 -0700
X-CSE-ConnectionGUID: r3j05UbtSIWOOhXZ416agQ==
X-CSE-MsgGUID: 49dwRsRkTmWb2cp6UfJshQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="28680838"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 01:28:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 01:28:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 01:28:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 01:28:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M63p849MYhQFpKSltD+NU1m/RMwMBfIYeAMSrBRvR7c5erhGfld4sZGoBVjVufZ4O9m1VHry1JVazGPP7vUgKDx6iktrOKQurnEWIlGOyYX8JWumLmsjnjpD2ZA64Zb1djJhU7cC+ImPHODvI39lDktnj5OXM/Fe3slPXPV1tNqaZy/Rj8Uo3a+RKEjrq9wpswoKac76bkzxBgIVttGbJMPJqT0SHPN3LKaenmNdOcGvpcRb5/dEX4o/eD+/4eOPlzG2Nxlm+hq+bbpTfW+Qhfxohe1lgVVeBIJ/O3UHPktS8h6frfbJLuSaDjW+jTTFI9h8CQfgP5HQXpkmw5N5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGdSycvt3mGkWMsKCWHxug7oV5+wLbfBpG/Er1JESUM=;
 b=j4BH6Wth0GZ0xT6gBmWCtPceUDLsuJ2A6kXve7/awIJsa/UgKmjWPCDDFnkpgp8bfv9vRRclBhxa2spMI+pHa8Gl03TV7hYpzKJ4O25AijA7/+prz8yp5hrxdnPmWpYOFPqIx7bF7gQqFwVV/sxb/6rD5E3SWQ/dmBjy0PBpNjRwA5w9uUbnKLb9v40aWC0l7/0Zt8opvKTIOxovRqihibvzKtDWt6fxbZ5RJN0wsmA2Rg1pgkfJc0f+wbDU4uf4YNoYZMM6rCzN2pRXaW6rP+j/p7mg609z9hJj6G+H9gfjX3+zSSwMTvsCL6nE2+dOjfbOD7vw5ifmYBhjJgAh7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH7PR11MB7572.namprd11.prod.outlook.com (2603:10b6:510:27b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Wed, 8 May
 2024 08:28:33 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::e541:95f0:c6fb:a687]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::e541:95f0:c6fb:a687%6]) with mapi id 15.20.7519.031; Wed, 8 May 2024
 08:28:32 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_debugfs: Extend gt test to check pat
 entry
Thread-Topic: [PATCH i-g-t] tests/intel/xe_debugfs: Extend gt test to check
 pat entry
Thread-Index: AQHaoISqgEhq1y6Cf0+jufwh+6O1rrGNAkOA
Date: Wed, 8 May 2024 08:28:32 +0000
Message-ID: <CH3PR11MB8434420D506586AC68A8404F8DE52@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240507134442.2246647-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20240507134442.2246647-1-janga.rahul.kumar@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH7PR11MB7572:EE_
x-ms-office365-filtering-correlation-id: 22d1af34-8f47-4982-fa94-08dc6f38d89c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?aY4YViO3/GWGu3I54qRHyIFLkvMUIG6WIVWbV9XXx75dsZAtL0qpKVfMUBcZ?=
 =?us-ascii?Q?25A6iftnfXN8CiNnNWEdD4x0vbPzKKBOtWU6yR9SMmMqzoqu3lMpPpGynu76?=
 =?us-ascii?Q?CExka0+qgJi8fo5qPt289fl9VjpFk05ntSIZN8lHFxzF46PPlYZeASh2oGJW?=
 =?us-ascii?Q?ZSRUCl+Aol36uv7c/VzEwS6uJ3w2ZFXX6wIQRz+GiQ2c31AZFZBtZ8opPPtF?=
 =?us-ascii?Q?5VRtxIpl0fgrkxb+D6e+OyPsUt3YRk5fxADWo9bKz5LzYNrkYK2JXq3Ann2f?=
 =?us-ascii?Q?jDAFawwse193Zu4ZsaI8eMh6+1jXHuWHpTsFj4taeUUt84raq8OqKDGrLSHX?=
 =?us-ascii?Q?WqYwVe1Gw4P4uQ3XtwGDCHdQ6qoMgiVLz/2jWU1GrOWP+4H0Wb0w4BdDK6gJ?=
 =?us-ascii?Q?a7HK88OY599zw9PLBun2fLm1VRPtvIQdXmnFjL18ANly1CjIGtFd+gFcRaBM?=
 =?us-ascii?Q?J28W/pa9fBFGK1nXxUH7YanY0zlPZxDpmGx2cgo4rqdH/eLXuqwILzs3HxHa?=
 =?us-ascii?Q?/pgFq8ZeFcAwZuz/kSZ4b1wIBl7ZvUEPOIWY2XDSxRagm+zRe1wWwVmyQsCx?=
 =?us-ascii?Q?tiTaEuACiZiI7Q0DwplwyTxmBHya1+WANvFx+Dn1QPcbw3N08C1u85qkPjwH?=
 =?us-ascii?Q?jiQ6JITX1+I9kzFp9txDpOQdmG9SMdvj6D4Z7L37x7CuuUPGkH5sVK6bjKCp?=
 =?us-ascii?Q?maDCkxztTh9LapW9vPIPf6shM/JSL8ykYBA88dyhJVAdZqfhwQU1TXQtPG8W?=
 =?us-ascii?Q?fjwowWkJnw8IOHTxusH5WU4S/6fKrdqfDi9XTrwdW0KxSCZ0k05wvQXH0K2V?=
 =?us-ascii?Q?8i8ltKuT0H92HfUBwGAm/zUuyN8H9JJs3viaKJpaEP3bDnlte7aDGA+wws/H?=
 =?us-ascii?Q?dWG/CAOm0zrZYHwiSMox/kbfiwDQg7IiLDsXlDN3TsiaZfzmyKFe4a1hoL7E?=
 =?us-ascii?Q?FszgR90ag5+ndM1CiVv2l7V4rwtV1eFL3UwIvef9rNz3cI8vbhjlJD9KFgJS?=
 =?us-ascii?Q?DVBb4i0xD1b0RQgM8J5C66GcXBSOuZ6zt9O2itDgr97bTi5SCFZITherk23F?=
 =?us-ascii?Q?qI6LlpsqSpRzL8ITIuZGshuZWLgxYWx76W16aWRSEQB10Vg6XY/PQ89Vdt2z?=
 =?us-ascii?Q?DhC5OeaAGDe/uksX/gQThv3u8OOLEIn062oEWPCbBr98N4Zdridr5QB/jevo?=
 =?us-ascii?Q?KNfPmH7YOtNMWtkPPqPbDX0P4YQCmQbePKQZ2AdDVVvEgryoUfPUWwjlv9Mu?=
 =?us-ascii?Q?CY4JTCIbmk5KNESzDSYT40ELrpz1jzGLNTpngwxefRLlarTE1puYlHqNzqng?=
 =?us-ascii?Q?5VY4FgCvCrrsXYe/gO1GSYzzbEBVpQOpICn/1i8cw72ewQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hbZ1AWAmPw8kaZzrbKJTduvhWLWKI7MZIfdfiFBngyps3xCHev58lH9dZnu+?=
 =?us-ascii?Q?WYX1XDV9JaCR0xaNRMgTcmOJbx8GN43O83Xw6gYWM3vMnb5dG9mE3re1Efrs?=
 =?us-ascii?Q?Pm/jsqy1HdEQ+HETY6LM10GIKIq1OxyDv9HV+7le1FKCHEyTWdx3aPzYX302?=
 =?us-ascii?Q?rh5d8d5lzvtV9wAfy3ATB8vU7NQy7QppUGXU9NYI9is2TX1Qu5sLaKLNLXts?=
 =?us-ascii?Q?HcnngVwYl0ZOSXl7Fdz5BUMLk76GwDi2TYTLq7A17BcxXt8LGT6dJ2ZfgL0A?=
 =?us-ascii?Q?aev37jrMrI237vnQw3Im4uKOfnOMOZFM5mY0ELYHdi8tLxmPANvQOyg8tOrK?=
 =?us-ascii?Q?6ONq4vhqDYE5Osvz2wJq5d6H83l6A4B5QKQPK4L4XRMPV60use8Mx+DSs/Og?=
 =?us-ascii?Q?/21Qszr/hN2MNsDh05BrshGad4eEAclugMhesvoQcaKfhxY/WRzzfzIJ32Kt?=
 =?us-ascii?Q?0LPC7e7nyvSoiKRiJ1g1cb4FKRaeVROO3vBZGF8gCHm3Fz+ib0Xw3h6iz5wi?=
 =?us-ascii?Q?z5xDGqFRYANzLdT6jKXVLEYiOnY0TwryckIE3ULvoi0Dz0MHDEba1MX0Cne4?=
 =?us-ascii?Q?wAz2xX2L2M0iahneJ67vicFa3ciU4Vay3JyhInmMZ3jKZEc1pwaTpISPMoRE?=
 =?us-ascii?Q?IIOrk3rUuL2kg6nKklds9CNoeca0Zr5BQBzmpBcEIlEqDvzM6jqLRN6Vcddw?=
 =?us-ascii?Q?MqLQM1GLMPCz8uMww3NNmV1QF4EQgfVMIoeV9aQo+eYMFIUlE1kuaKirL7aO?=
 =?us-ascii?Q?Neom57Bzqx45Oi/D9kvL0Ip3L0gyBob9CNv8H/wLlTluomhtoX3p4+jS89rC?=
 =?us-ascii?Q?TdEY3O1GZ/KoAHtQMLTHfaAxzqFNVdQukPnidh2syoNjiRdXFuIEfixC/q11?=
 =?us-ascii?Q?XrFhw1ShgOB6RUWRMGq3Dh+77sBVSwgymZkbkfYXdDnaMs8dfVWLdSi/LA/A?=
 =?us-ascii?Q?JsxGBZZ6TFEGp+tdGmgYXqC7Zk/cac+QQA9oN4ARGc8AdOdjrgz1g1OhrLxB?=
 =?us-ascii?Q?ylth4OsHJweWa/9alXGDWz2HFUylpVGr0R6eUMiKbeYNgxgCQVcxS6A0mtPF?=
 =?us-ascii?Q?SvdJDqvCxuLNDZxgKDss/Sngg0lT7fxXdAohchiR2ubWTs4qlzib06nC4iHQ?=
 =?us-ascii?Q?odQRohvPYTDronRlMvN0kJ5MA9hZ6J/P2DzODLNH9IR+uh7OV4DEicU0A9u2?=
 =?us-ascii?Q?YKk7f3KHjvZJwsdXvSMlEilQzlK4H5JpzHH04E/FEKaMzynP7kOqVJt6Ce9k?=
 =?us-ascii?Q?PNRgvxB51p+VU8NMGbaMmhzp1+LBOQ1n9hYvZPPxmUUhb9DGdnmpFzgRRrfV?=
 =?us-ascii?Q?GjxkQHLYKsOceusOPipLlUQccpxMvJo5g++lvs3chOn/y9Lt3YZsqgPRIf1q?=
 =?us-ascii?Q?GE/L37JnaI2+Aj+kzATqHn3BY1cqKqCmY/OXwY4uOQNlxWnkFcpBkjGkO1h+?=
 =?us-ascii?Q?Yk44t8y4HITpOSjnWtbN/uiNGzYg+EQwnbDjHzECzj19ky7D6ZoD9Oant2/s?=
 =?us-ascii?Q?vUAjY4PLKpX2nYQom2yC+FQXml7x3cWW8B8nZmFG1O51RCZ5TzFMEwufQvwI?=
 =?us-ascii?Q?e1KFE0A9Q5hLzt8PHuRGhBugSe1QJ2E8UwLFR7XH1+cJdR9EwL4PI81BEO+i?=
 =?us-ascii?Q?WcXWZkczNKQR2rsOTa6g6V9OlcpNPfxKhleE/Ya9G62Y/95/9szoepqV+zyl?=
 =?us-ascii?Q?ikg8dA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d1af34-8f47-4982-fa94-08dc6f38d89c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2024 08:28:32.2384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: myQoUZbN1Wdu+cSJcdjz5PuHjGwHLmN8UYqIP+aqF8ueamEZtK/0bXLInXJBeFn/R0wtAtcbvXkFAzhUG/N4f2tCS6Ue/6MwMdb8tDJZ3iY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7572
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> janga.rahul.kumar@intel.com
> Sent: Tuesday, May 7, 2024 7:15 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_debugfs: Extend gt test to check pa=
t entry
>=20
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>=20
> Read and dump pat debugfs entry.
>=20
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c index
> ba12f6ccc..73b11dc74 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -158,6 +158,7 @@ test_gt(int fd, int gt_id)
>  		"topology",
>  		"sa_info",
>  		"hw_engines",
> +		"pat",
>  		"mocs",
>  //		"force_reset"
>  	};
> @@ -184,6 +185,10 @@ test_gt(int fd, int gt_id)
>  	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>  	igt_debugfs_dump(fd, name);
>=20
> +	sprintf(name, "gt%d/pat", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
>  	sprintf(name, "gt%d/mocs", gt_id);
>  	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>  	igt_debugfs_dump(fd, name);
> --
> 2.25.1
LGTM
Reviewed-by: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>

