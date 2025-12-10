Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E5BD3C525
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 03:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9F910E241;
	Wed, 10 Dec 2025 03:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYE+/230";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A0710E241
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 03:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765336691; x=1796872691;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pAs476an+OpaoIGJJnfm8y5eV9AOI2lfbIu6V37qhH8=;
 b=FYE+/230dgTFT+NEy+UJyBq74aGNgbmOLT3UWdvx9/TWNtzMTbkP8jUG
 NL7p/meWpYFjkTy0h2c5Aa8vBiyfOlUrc0d9QE1DO84cqraEZ84DoyQIO
 4N3wVWETYHWRjL/XijXO3unHiRxsjegaqu6nh43izEMMHZc+NXXqCsNYe
 w5hcHgrgacpLQmuIyC75difae7cgFPuE5B5BtdIY3OVokbOMCfLuGSpDj
 B0hYDTR8xDUrWAE8wVtWrqaug9hrgO1qOYJM1Y0WiResXT2t7GeGIrFrc
 0WE0//opznz/Dd2XgVYIv4z/EtmHztAtV1BHmcEAD498vFUEk0cUvcjL5 g==;
X-CSE-ConnectionGUID: ubRnlT5dQgODd10t2PidUg==
X-CSE-MsgGUID: r/vV5VecRX+E+84HJnMn3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66480940"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="66480940"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:18:11 -0800
X-CSE-ConnectionGUID: ScBLdwkQRdGJEC6Pt4VTAw==
X-CSE-MsgGUID: LTWLEduXSgmLYEBOWpGxkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="200821978"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:18:11 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 19:18:10 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 19:18:10 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 19:18:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Em/93Gi35zxg1OvfsuwwMpll/E6i15TQCh+cGGDX7oIfcduTm2Noi1IGpI7qWMljTP4FaTsoszcUeo3C7tVRix9q4LveKFLKcgmzE1pdam0ymG7YD1s5kDNUNTwBq7MTNtm+7YqdoVOeO/RwuMFcBidlxGf5+egeNDjjhM/vHu2pal+3KFMifiZ9464KJrYtxli6GwT/QGc3YYr54wxrsfeoJAjl0j6aVGVZ5Hq9lvBbIB1dgAcO6lR/ikckVoaWDgLwEQbIBfEJFYdH9MVifPOhfNDFY0ntmGynGlouUiKORLRxxP4ApZlJyf+6MSaYI5dNsmxqkkUXijkC94n/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEPA0Fh0M88FwOMzcufOzaKSfUr+w4wMjokDBI/RELA=;
 b=X//fN1CER0Wh2NOHAo5saxycAg+HtHip46+x+GSeTuvJLjPmg30I5KjCJCG+T9fHqxJumf9Hm+Z8okQ1wDIeV5nPu1a2kJrgOZhQ5b5XZl1MgrK5VsCtoCx0S5Ut5R1B6vjaBe037rcxXt4K+zJhm5hBnC+aZVBIzAfIfXXeAp3CP09nibWovIyrqtXq522oYrAIuzgjrPkQnmmyn+13Cc0ICLx3BVMfXqT/8kWPEyIip52bPavC+u/BvsRuoeQKnpFPnJTSbeW50qI1qFNzMHzP/UCtfeQaDMbZzleUNiawjAKKH8yPakB4NNBPGHKtHP5yNnSM3dVxrZ7JnbmuCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 03:18:08 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 03:18:07 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v3 0/2] Fix chamelium port allocation during
 igt_fixture
Thread-Topic: [PATCH i-g-t v3 0/2] Fix chamelium port allocation during
 igt_fixture
Thread-Index: AQHcaSASmzfH06iXlUmIaN2miqXAkLUaNJAg
Date: Wed, 10 Dec 2025 03:18:07 +0000
Message-ID: <DM4PR11MB63121390B5D4552A8BFAFF4E90A0A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251209152359.907648-1-mohammed.bilal@intel.com>
In-Reply-To: <20251209152359.907648-1-mohammed.bilal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA1PR11MB8318:EE_
x-ms-office365-filtering-correlation-id: 04d7b268-81a2-4286-bf9b-08de379abd94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+kx2WINMLyly6aqXS86voWljHdfRvJNlKIL+LctTfg6W3iqSG084krHH8kG/?=
 =?us-ascii?Q?+zRCVTs7OYlKEesyWSJJ4/rNGSD7Yq4gqSy0EAa4MgdjNPDfU/hEu3v4wnC8?=
 =?us-ascii?Q?I+pRPY0IwQZkH3eZEfnEk4OB54esLWIXw5maYh/HO9HZzR2NwQoEP75wtWX0?=
 =?us-ascii?Q?zFyoZZ340v/HQrdumQsPxaHcyAEiDOFp6JMgNVNujPQErZ4gNUwHVLmcmljb?=
 =?us-ascii?Q?oCOM6R7BrPMKrTzpbz9CvURtYsN3CanCJSOQK4M3Gat0oBUnbOuVzvTPGJVb?=
 =?us-ascii?Q?PaYuJdpy+3ikZnIof0jK8WJHjTAkx1P0D0jvTPQ5Fiq+QheGPl9y81ncqT5/?=
 =?us-ascii?Q?6pODdDwXtUhTzWVg5GqtTeX+nqC/MXOVSzs1Wn5M5RPXlQIreiq/VihfYWUR?=
 =?us-ascii?Q?ZGwdHX/6v617NwXQwwQlg5k8G92plwCmHJHbqsZEG8RRE/K6Bddof9+g2ihU?=
 =?us-ascii?Q?dl/hGQ2AoQoW8MeEHqNWV9DTfWRTCnLaOGZXZ8FplcHVAkDBKSme/hgb8aBY?=
 =?us-ascii?Q?+70v2Z747o6hcKz2DNzmzj/Ss0sy4jVjUKadg4vu7KyZDZ1ZSlR8R1f/r8mz?=
 =?us-ascii?Q?8/dO1l23F9xKs+iKslbiom8vUTV3cUGKvreFbbaEaxilbe3aJI2lAEQvwK4k?=
 =?us-ascii?Q?IcymTsGr8sBYVV7+S+OsOtztw4NmYNH8IOvQ+KVaw9R7zVRwRiuZmkC6GliZ?=
 =?us-ascii?Q?OFl1t14WpsaQf7T+BpI1m6OOMFOlGVaNxECz1XKw/91PxjkCQ2p3ii3t1gF1?=
 =?us-ascii?Q?Z8lDqva2cmkCRFPHBG9nUPnMOzKWDYU0Y4tn3Q/hf0EMgh8UMq0YBqbiri6z?=
 =?us-ascii?Q?wd7o0EpHXcYyrK4+bPFGQJAqVOidvCS+4COWPJbD16X8FgEsxv94TqlYogNH?=
 =?us-ascii?Q?brLtWuuwFmloCylsL74bzWO6fJC02LDLcfJW+O1LkO4N5DHdMc4vAC3xrdM5?=
 =?us-ascii?Q?FQr/XTh+J86kSQWIotuv4lIAmau5kkSfXhiw8W4WeO+mmpGFGIt2wWHR0Jwj?=
 =?us-ascii?Q?COjK9FEYHX31jUmAwBlqSf+4dg3NLzRpy5oDb98r0wmPQuHpk+tDIzMyFhwt?=
 =?us-ascii?Q?ShNcs0y/5QbYiDseI0rMLnjeYlQXyVKX8xl1+BOC/qBTZ+ddHEvnDSk9Bqiz?=
 =?us-ascii?Q?gFdV30YprXLf/09jeKWHGiknKpFN+0ZKiYc/GoimrSODzxf4D2+l9p7rN+9B?=
 =?us-ascii?Q?L547w+k9hSNb09XwW5S6VuVxnc9aaUOzNiMBHRB7Zk+YVvVRKclZ4Oy4IoSt?=
 =?us-ascii?Q?ODSVUamKtnb6mReAM+adF3B0Il1DoHNI1sAM+YzZF1HRq5y/d39F8pgnrSqw?=
 =?us-ascii?Q?EfVHI9YHyZL4B13aMu4XdXDTYbsRDPo+Px7KZByxaWY2dAhuEfGhwFSlXWqi?=
 =?us-ascii?Q?v5MK7Kc924vWjiCw4b88PCO9re2saW4WATS+5xsgHR2ALqhs1/RpLXn32SEV?=
 =?us-ascii?Q?YKAKA6/ZAH/+q+fOqkVku5HULb/qhYH72D5guoPjtlroD+17Z4MvqqeAD72G?=
 =?us-ascii?Q?88rrqYFb7CUPIPTj5DlbjNbmJUj0uhezjiIK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SJtSDGO6i3art+Nzyvfe1TS6v77G8oywSGJ+bbnqpc2f1Dx4DLZoRgBY2Rih?=
 =?us-ascii?Q?qrzZ+qE98PRbRBuI1kvex+YLHpKwdCLtE4oFe3hJqH1T50xTOjfoObRJ0P8P?=
 =?us-ascii?Q?1ZsbzZATt2BF8TF6HTKN5EH7r6zpY06uslMouwKaA7Uq3W3Oz88HSF4VH4R0?=
 =?us-ascii?Q?jWNUgCf0ZtVxwiz637yvHovLoUGalJbwdjcxo7to3Ik8K+jFyzrkwjE+aFDY?=
 =?us-ascii?Q?rnpE4L2h6664CzxDDS71TevwxCfp2STDztjHlEGfGvfiFR8JIEiEjrA3nzqO?=
 =?us-ascii?Q?4yPUXQARhayndU4R8zEmYt9AqizrhOir/1WDSuRZf3BUbZpuWrzs8bMu/o9A?=
 =?us-ascii?Q?Tky/8nV0c15Am/QrISFVLf7LSh22954zQWgwjLnzcVAEqfqge1OTQiJMsMoK?=
 =?us-ascii?Q?/SbSOIQGpXEa9buKCS+uFWkItrkstvq6H69/n/ikpGoCiJYxvmB2qeD7PYyu?=
 =?us-ascii?Q?IkAIp6Zj4R8A4rwW60YMcMuXx6V12zUeO88W0zTQ3c+OfiM8b8Lw5p0XXR39?=
 =?us-ascii?Q?BIO9pIpZxb1n/mRukmcGmW+KxPkaQc0sLDE/UCpON3dTx44e5gxJy5F9rwVZ?=
 =?us-ascii?Q?o/6N7cIyOdyPjhfvvMTFXM4KMGkBe3/iw3FzhNM4BAD4sw+F/u9LQpMlaoNp?=
 =?us-ascii?Q?USSafQMYql9ngMlpmSk0GHVurqaKnNJKJu8cmnh4NSXLaDwhvg7ljH1wuh/G?=
 =?us-ascii?Q?Kz5X8h6m6mCKzrTm/Xye1a4FK265+tMQwNCzN728Zhj8PrePqWTxRh/qImvp?=
 =?us-ascii?Q?awKT/tctbZ/QDUQrbZ2fAOHXl1pHpapzADp/PdvqbtX2sw27aGK1Qa9joB4W?=
 =?us-ascii?Q?O+0SXVkIJU5lpdUSIPK1h1mU3A/IbEYNfB0Y8TARqE5wNZs/Q9RMB3Nrx7aS?=
 =?us-ascii?Q?OqfM1CZSN51N/OVFn5+bYBTNnXDUwaTCGDmRc5JRfUxuamMB5PyhzncSc5Yi?=
 =?us-ascii?Q?TTQ68Cmy5cpgIALV/xmBPblT7TXtA8GymGiLW1fg14nelYDtFe8qmTe2oewr?=
 =?us-ascii?Q?GZ9yI8Cfn61ZedTuYlBxQNOmHCMLsP5fX2FjiQlAtE3fuqK2RLqsbGmdq+XG?=
 =?us-ascii?Q?gXxQ2sQg0QPI7wMw5qKCAYfns28+E3Jwl/EAnkPgoujXMZ3M2n2x/wu9VExI?=
 =?us-ascii?Q?6DXmyRQ8ksraOHuJeolHksJMRt4uMx+4DSeZSTIFhtoKwpMv8Z7JytVM+HZ3?=
 =?us-ascii?Q?RXThopnVfFsfHggOCdVr1NbgtjJDfrApyfUTaPQG+obgA337m3N2UhiQyjlT?=
 =?us-ascii?Q?wU0goloN/1Y+UW/M3FNcRIzp3gJVfW9hh0h6MFHriv1rz+x20jsSZfDKlBEy?=
 =?us-ascii?Q?RTRiNtTO5E+/2SmxjBoaQ+CDntNnlWHtrFCwFsoVkMgqtqVM3v8ysIH9bczn?=
 =?us-ascii?Q?8HqOUsBEXs/PVRzWbruw04zuGvhj/4h+0Fne9DrSDddOerapVNdEO08hTDq2?=
 =?us-ascii?Q?c67ox/FVdRl48xCITHu5nQRXpDWyTH+5Bv+qMK1neiWiXMQP8qPmkkOZOz4o?=
 =?us-ascii?Q?Oha1urG8OrnnEF+/7lNkJ1PCSzUQdktLrIq8Q8wKrha/H0u7coO5pA7eEqlI?=
 =?us-ascii?Q?pEttQ6fFtXBO/Tb6+0M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d7b268-81a2-4286-bf9b-08de379abd94
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 03:18:07.8147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YQYd/Psk9tWtT/6r6xw1gZCESXX7OTaDUQgZ/UROWXwOmp5UNOo7MAuV0TpTnTDhuYtCijyHV2NwxxjbCLv+vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
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
> From: Bilal, Mohammed <mohammed.bilal@intel.com>
> Sent: Tuesday, December 9, 2025 8:54 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com=
>;
> Lattannavar, Sameer <sameer.lattannavar@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Bilal, Mohammed <mohammed.bilal@intel.com>
> Subject: [PATCH i-g-t v3 0/2] Fix chamelium port allocation during igt_fi=
xture
>=20
> The current fixture implementation executes even for unrelated subtests,
> causing false failures when expected inputs were not present.
> Refactor the DP/HDMI/VGA hotplug tests to use a common connector lookup
> pattern so that each test skips cleanly.
>
What is change in v2:=20
Also document these specifically for each patch.
=20
> v3:
> - Introduce a unified connector test macro (Sebastien)
> - Remove unused variable (Sebastien)
> - Drop per-connector fixture usage (Sebastien)
> - Refactor DP/HDMI/VGA hotplug tests (Sebastien)
>=20
> Mohammed Bilal (2):
>   lib/igt_chamelium: add get_port() helper and CONNECTOR_TEST macro
>   tests/chamelium/kms_chamelium_hpd: use helper function for connector
>     lookup in DP/HDMI/VGA tests
>=20
>  lib/igt_chamelium.c                 |  10 ++
>  lib/igt_chamelium.h                 |  18 +++
>  tests/chamelium/kms_chamelium_hpd.c | 240 +++++++++++-----------------
>  3 files changed, 125 insertions(+), 143 deletions(-)
>=20
> --
> 2.48.1

