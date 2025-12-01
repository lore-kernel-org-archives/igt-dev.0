Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC78ED116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 12:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76ABF10E3CA;
	Mon,  1 Dec 2025 12:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlC9Gqo8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAAC10E3CA
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 12:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764592874; x=1796128874;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NNkybZv5jEo0PzKE1cWYSjAgAMxjxzYld6CZ4NeV9gc=;
 b=HlC9Gqo8+6GSaSZ65EF+9q8D/yfIeQkIGVDI5v5/dQaHAPbQfphPtrTY
 f+9AUSWqOTc6stz4PcSdwuNZEBco7mKvcOEsLZqKLY+wbD5cSpUwpRpqJ
 VSf2yOi7iMkJoy84YvLTsBihZJ4UiSXa1t7+LVlNCdM7eGc4oJUQRHP80
 iOZ/RmZe3/k/ATDJ67VnHI3BKKyXQtInUKdRTz5DEs7OFAP03gyKceUC3
 FQwT0zDc9CzKQlphbAlrtKeBv+yIr/bcwcud7cNaFrd8lDlXRRmTO7Xmh
 kRm1fH1bDSacxXLIFv72CX2WYJEVUmP76Np1LMMNNYwHyCpIP94uvEiKZ Q==;
X-CSE-ConnectionGUID: K4FHtOspR/Kxit1cheO8SA==
X-CSE-MsgGUID: 4Hw1gYQ8SVyP9+zlehZySQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77998739"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="77998739"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 04:41:13 -0800
X-CSE-ConnectionGUID: jqZw3rRXQqmtcQXbSkUdbA==
X-CSE-MsgGUID: FknDZYM3Qm2/ewv/G/Sz5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="199181771"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 04:41:13 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 04:41:12 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 04:41:12 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 04:41:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUzZJS7CPR7Nwt7cD2KRu2Rn2kSkD8wmYOFj7DDOEhA8tQvjLYsJJYb+X4IEN3ge/Rus2tTKqywMJ2AhHybc5y5WSKsd0GOsJTh5AyVmf7s74bA3N6bDgjK66gctuwwF0ElLg3F4cBOl9/IsyQjfJ8wz6aef+vFpVexRK/A8hhj6szlZLK5g25oOpfHN9onjmG5ZHs5LXn2L3PutYShgrt5tnTMdYY+ci6xwvGLUTZDWLl9hv5PftJjx2ADW1uc34E7vPMu1I0C5pnl8+FVAv6N/AhnbUVCvK3zUC7PVMb8cFcSxjvyMMCCqx0003oXcY9RHkii6oxbjsaOcFg2E/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gtkANhxSbbZNVFTdxf8c0KpcCftrnNOZCd3zjXDxTM=;
 b=wphOzWA28APCmoBaF6MuZBdRz6rL0ociT1leNrhrc5Yie/zzs/r7nzOn6ggVQXMC1xy6rvHgyFQpcXWVbCeiHeRCJn+eihuLCD0bIpK4GkqpUu2E8r/PlXW8CMPR0dN2htIii9WlSL5vD3Gk1/AozU7bZtIvMbZBd05ElwkZHjZQjMmjdMaPe9AbVUUBFnVBETACMUE1laT96pRvplg1rV0gQDeydyElBydoPJvECMi2JJENEiMmZIMWUGyCF4v8us1qxi82QkV77QtHDwDDuPrpnHifcW9o3FJ47BiR5xNG4K0WpmBFrTtf4tHOWo9Rcv1y5FMCwIbOjpAdkbVqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by DM3PPF8F79256C7.namprd11.prod.outlook.com (2603:10b6:f:fc00::f37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:41:10 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:41:10 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 05/12] tests/kms_writeback: Refactor format
 handling in commit_and_dump_fb
Thread-Topic: [PATCH i-g-t v3 05/12] tests/kms_writeback: Refactor format
 handling in commit_and_dump_fb
Thread-Index: AQHcWqlvoHPKbxuot0aoq8GZFTYnq7T81IgAgA/NAkA=
Date: Mon, 1 Dec 2025 12:41:10 +0000
Message-ID: <PH7PR11MB679606A4F7F2203C0CEC8581E5DBA@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
 <20251121055839.3116906-6-sowmiya.s@intel.com>
 <DM3PPF208195D8DBE8B81BA00A20F4B1C97E3D5A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DBE8B81BA00A20F4B1C97E3D5A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|DM3PPF8F79256C7:EE_
x-ms-office365-filtering-correlation-id: c80bda65-47e4-4e40-bef6-08de30d6e7c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1fVukf/Y81VuI7f2BZHVZcaafv8w9ZIIvUSNvihoJ6KKwBHeajj17Kjb1y8a?=
 =?us-ascii?Q?gGBdTgo03TvesVOuF9AkREqiDX4CTjD5wYP/TuJ5qlwR8MukXSAxVoI53/24?=
 =?us-ascii?Q?t1xDJx+8u6aNAT/xBUi1ZtGQ8wU3M1K9dvNbhgTp6hhniq5i8cToJf5Zu42D?=
 =?us-ascii?Q?cDFMTSNJZr2gSg0NBjKbycXJEqBeH+ZUWqVopL1O2BLgLplOSzfjKn7PGZ0x?=
 =?us-ascii?Q?fTBvBisjlQ252JFPOilhHz9BM8JqnZxcPAL9noKKPjoZCihdPOF8aDjuj4JM?=
 =?us-ascii?Q?dVKu++BU3RXdHB+tgnppqbMZHogfPZCfZ2FtIrapeBK57AQKyz/YrjuEwMbC?=
 =?us-ascii?Q?49VMwBMD1CMJMR7LkbchNXnyBee618zV/yxPvX8bShYs87UjmpzyjPXaVe2B?=
 =?us-ascii?Q?SrdPcVk7AJY5OIyY2Inis+WeIgxqXCgFU4xA6kh7L0KghNbsOx3MV/4dSJqd?=
 =?us-ascii?Q?4HdmYYORUpUtGVIdRPrs9N1fnOq1Gu1b2sy1TUr9DUgeev0osteZo1udGYLJ?=
 =?us-ascii?Q?w73/FZ72TCZGhd/T0mx2z58mUmnqPhRZbAKjOvTz5qA4dF/zXrcvv/WVlNGl?=
 =?us-ascii?Q?daUeia/TvKfPPIeweY32XiDSlfx0IUprSOaBX1jmh6hvTfFSDrSmkygWJWNV?=
 =?us-ascii?Q?DxBhvOryaAAcj2N/vqfOFOSVZEukW0Ae0uL23sFUc8Orq0yo8sW1KhzbGdww?=
 =?us-ascii?Q?EHxZa0uwV9GQkQycp90Rv4zZ0IUVV6HIJfir8KmakxyTBHsWciY4XcwGTkKk?=
 =?us-ascii?Q?BxrraHqny+MNYDctvmbOI0Z99WnILHnNZa3COUFs3Vf5joR0ftbX6tfOTrxr?=
 =?us-ascii?Q?E5IU6ioiCusyeWbuNLN20ENUKhYl0g7w3msZIRrw3enUwwdQh/O+Mrle7tB1?=
 =?us-ascii?Q?paUZmMgRXFBUtIVgEkjhKDFBq04p2UCFJbkTgOoiH9CVhn2dwkqVmYQHsfFe?=
 =?us-ascii?Q?ZPaO/4aLRCwu5ae4Ph6BfB3h3azREEv0V+z8p09EhuHlF8iWQrX3vxXoIbIc?=
 =?us-ascii?Q?LTKkbG2xjV9N+i5kmE3SflYUpTjO4knro1Xzgt8rLddFMjw4zHRHhWbU5J2d?=
 =?us-ascii?Q?SzkWSoc79U5SB67n+PArspmcI/ubgGHXE73bShgytrsL3FUd35Oeh6xd8o/7?=
 =?us-ascii?Q?+gX3q9X64su3KrLZV4qConfCpsf/iVy+V9bIBhUam2QVp34yOL7edYz+dwCM?=
 =?us-ascii?Q?WNqYPX9jbDlgOkOij4eO5t8raaxnGvZxTzI0P6ZcDCPlb2jRf6eMGcU3ITuz?=
 =?us-ascii?Q?d7XRxqV7JS9CfvyswyDNGZp+9eC/RiTH/1W4A3gXLtKjnZyXLIKWXJ84uj0x?=
 =?us-ascii?Q?RWsDs5iKe17XLzOpkvbsFHwNTV7KzgCNGfdufdeVUlqnAICvXsSd3hQfr55Y?=
 =?us-ascii?Q?icZgLIk5Kf6AUV+Uuul4aSuiamZY4P507HiEulW20SEAe/yXDAKt3X2WcmCk?=
 =?us-ascii?Q?p4Fuq+8AHRO5dtODJP+XV6e1sJ8TAkzBd6sEDL3JK2OTLY3PBcf080vkoS3+?=
 =?us-ascii?Q?+VVJ843/prW7yfPKNoaDolTzvSFmVGj0K4gW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qiW08rrqUVTEAYdH4DlXKsVgvt1Bk+ds+LNN37JLHVYBvw5588wUa4IuYHTe?=
 =?us-ascii?Q?+DV8b/n6BAL5OZBAd8YVUa6H5Giz1/gQ3mwK+IqJ9y406xhqxahf9UA5mWyW?=
 =?us-ascii?Q?yJ15FN8+H/ml5rSSgyhe2gVMq5sVMr7z0TxFHxaV3eyGM6wFNwPpgcvn375D?=
 =?us-ascii?Q?jY0X2PM0SYLyenuqhFjfybwkK09KLbxciGUL7eLRIYnJVpD84+0cHny/8iqd?=
 =?us-ascii?Q?NLFRSYR0ibrGGisdCCBGqZ0dDhPaeR6LOlqk9O7K3euusv10AXWgAmEApI7Y?=
 =?us-ascii?Q?5fhWWaECFzo4765nTfrMAjJU58IMBBYr3UQz0sSeGv4t4pv9CzoOtA7060Dx?=
 =?us-ascii?Q?2kmYje0irf2kThJYy5EHqjE4+nsV8tfRUEE5aLCP/EvZnuv/UdOxzEupcbm7?=
 =?us-ascii?Q?G9CTC9LyVOICFkDcXlINCcEW6GB047FT88Pmi9TClWqwzUZ2pK5dOXsqAWzc?=
 =?us-ascii?Q?aZs09jLlw/sa/3yCrNThvMqMkebXFqr4NrSURRiXr+l24w0YJDHMO+1wMEDS?=
 =?us-ascii?Q?IRsopuFoVVfMgwq4UctOXOgEPwiMJKqAlSac87dYSa/ucBGYK9tuVCTkDx84?=
 =?us-ascii?Q?ExyLlBHs8+i6JVfQFeOB1N0dqeliNqe60I0VBWh/ddqx2bnJ67LOPZEsLCZs?=
 =?us-ascii?Q?+laZNpieUbOVYUmXKHAakYCQ24Zs0otbTlxJUnKEWRjSAnPj7suvUDwXGsDJ?=
 =?us-ascii?Q?G7C42I1tfXE7OPXf0ri2aimvX/FJFiIm9v62OSX/Oi9iLOXuh6Cd4iMRMPI1?=
 =?us-ascii?Q?LSURF4B8UkozEWa8HS5bX7wLQvCpdwfaDfJeiEStjczSaoEnknTXrzUuQLiP?=
 =?us-ascii?Q?zTxF+0UAM7gW0GXJjzMOLgTZ9QYMckWPz2yWZXAJ/PT2yQ9iBQeU7Gk0tKld?=
 =?us-ascii?Q?4a7+2c6a7LpUepTlH+VLb3kOa8H8Uy8tMaSKQAyPiWEoZ3gzlhZuMmc84Oh4?=
 =?us-ascii?Q?hFgvbgmxX8liTnxZmEhwJvsKuqRt9DU849sffPvf+IJ2BjqTpBdb+ylRanBA?=
 =?us-ascii?Q?TJqwZJG4IDUmNp11IEpwkWdC6dmy3Oqw28CHKB6+uzvzNyYoD6pHp+AmpZlW?=
 =?us-ascii?Q?qX7UnLT6jhPm5O1aTbDfsH8mLdrU37vqwjcwhj7O+tgE9v0D0ROpk0oyFeHl?=
 =?us-ascii?Q?vBZ+Tul0tKR8CEqPBXWkIxEwobyOid1O/wNjqCXklPNCCSvRWX0YLQRcE39F?=
 =?us-ascii?Q?iiQBhpb5mUIEKgKAbOaZtieWPo0y+uHZCc4QIdyt07zvwCZqXRl9F1vAgMuw?=
 =?us-ascii?Q?SKOAxkIhN7G9yo86SRbGACmXElbun9qcPAJ8sKfG+ySwbxUarKFMc1i1klIE?=
 =?us-ascii?Q?ZopQIxdI7K3PmPJXieR2wBzoTbEmXDqCqs6t8O/q8Pszsym/q++aQR2p7114?=
 =?us-ascii?Q?+3hb/r+KWUXxmZRaGQjFgK2/yMV0c4whE5r/uH5IzMj5SZru/vwy+RWU2ozS?=
 =?us-ascii?Q?G2P16QCWDG3Cuo37h6LeFt7OK2MoRyE3FJG+ik27YuvyhOu3fCCFGmSwMR/P?=
 =?us-ascii?Q?uW+FGmLwxtNbZzqdHuQ6tmsF3cVvCfeu+zqCL1PBEc1iQo5J2OQ2QulteD3H?=
 =?us-ascii?Q?Cx87dQI8rColoPUwLh2vF1tQJhnzPWhEMB9Fb28NknCpYDav3tRbApkg0mIj?=
 =?us-ascii?Q?/LFAvfQxcSHo62RPBt/4dVO731rRqqF2mmIU3HSc+vf6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80bda65-47e4-4e40-bef6-08de30d6e7c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 12:41:10.2151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nrTCbZm7ocBroj7VMWSen9qf+lh/jFAkHiFiKu4f+yssVAibhdrUA8IaYKi23OVEUXuNZv+mdOuSr7gkyW5miA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF8F79256C7
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

Hi Suraj,

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 21 November 2025 14:28
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: RE: [PATCH i-g-t v3 05/12] tests/kms_writeback: Refactor format
> handling in commit_and_dump_fb
>=20
> > Subject: [PATCH i-g-t v3 05/12] tests/kms_writeback: Refactor format
> > handling in commit_and_dump_fb
> >
> > Modified commit_and_dump_fb to select supported formats if provided;
>=20
> Should be a period here .
> Also keep your grammar in imperative mode. It should sound like you givin=
g a
> command to The code so this needs to become "Modify commit_and_dump..."
>=20
> > defaults are applied based on the platform when none are specified.
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  tests/kms_writeback.c | 45
> > ++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 40 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > b6d38ab28..46fada8b8 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -444,7 +444,7 @@ static void do_single_commit(igt_output_t *output,
> > igt_plane_t *plane, igt_fb_t  }
> >
> >  static void commit_and_dump_fb(igt_display_t *display, igt_output_t
> > *output, igt_plane_t *plane,
> > -			        igt_fb_t *input_fb, drmModeModeInfo *mode)
> > +				drmModeModeInfo *mode)
> >  {
> >  	cairo_surface_t *fb_surface_out;
> >  	char filepath_out[PATH_MAX];
> > @@ -452,17 +452,51 @@ static void commit_and_dump_fb(igt_display_t
> > *display, igt_output_t *output, igt
> >  	char *path_name;
> >  	char *file_name;
> >  	unsigned int fb_id;
> > -	igt_fb_t output_fb;
> > +	igt_fb_t input_fb, output_fb;
> > +	uint32_t format;
> >
> >  	path_name =3D getenv("IGT_FRAME_DUMP_PATH");
> >  	file_name =3D getenv("FRAME_PNG_FILE_NAME");
> >
> > +	if (!data.wb_fmt && is_intel_device(display->drm_fd)) {
> > +		format =3D DRM_FORMAT_XBGR8888;
> > +	} else if (!data.wb_fmt && !is_intel_device(display->drm_fd)) {
> > +		format =3D DRM_FORMAT_XRGB8888;
> > +	} else {
> > +		drmModePropertyBlobRes *formats_blob;
> > +
> > +		formats_blob =3D igt_get_writeback_formats_blob(output);
> > +		igt_assert_f(formats_blob, "No writeback pixel formats\n");
> > +		igt_assert(!(formats_blob->length % 4));
> > +		for (int i =3D 0; i < formats_blob->length; i++) {
> > +			format =3D ((uint32_t *)formats_blob->data)[i];
> > +			// Skip zero or unknown formats
> > +			if (format =3D=3D 0 || strcmp(igt_format_str(format),
> > "invalid") =3D=3D 0) {
> > +				format =3D 0;
> > +				continue;
> > +			}
> > +			igt_debug("Supported writeback format: %s\n",
> > igt_format_str(format));
> > +			if (format =3D=3D data.format)
> > +				break;
> > +			format =3D 0;
> > +		}
> > +		drmModeFreePropertyBlob(formats_blob);
> > +	}
> > +	igt_assert_f(format, "Given format not supported\n");
> > +	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay,
> > +			      mode->vdisplay,
> > +			      format,
> > +			      DRM_FORMAT_MOD_LINEAR,
> > +			      &input_fb);
> > +	igt_assert(fb_id >=3D 0);
> > +	igt_plane_set_fb(plane, &input_fb);
> > +
>=20
> This whole block is not needed according to me keep it simple.
> Do not remove the input_fb as a argument to begin with.
> When creating the input fb just create a drm_format variable that gets as=
signed
> The correct DRM_FORMAT if intel device or not and no need to get the
> writeback formats blob here and assert it.
> This function isn't a test of that sort more of a tool to see if we get a=
ny real data
> in system memory.
>=20
> Regards,
> Suraj Kandpal
>=20
> >  	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay, mode-
> > >vdisplay,
> > -			      data.wb_fmt ? data.format :

The command-line argument 'data.wb_fmt' specifies the writeback format. If =
an invalid format is provided, it should be rejected. To validate this, I i=
terated through the available formats in the blob data.

Regards,
Sowmiya

> > DRM_FORMAT_XRGB8888,
> > +			      format,
> >  			      igt_fb_mod_to_tiling(0), &output_fb);
> >  	igt_require(fb_id > 0);
> >
> > -	do_single_commit(output, plane, input_fb, &output_fb);
> > +	do_single_commit(output, plane, &input_fb, &output_fb);
> >
> >  	fb_surface_out =3D igt_get_cairo_surface(display->drm_fd, &output_fb)=
;
> >  	snprintf(filepath_out, PATH_MAX, "%s/%s.png", path_name,
> file_name);
> > @@ -470,6 +504,7 @@ static void commit_and_dump_fb(igt_display_t
> > *display, igt_output_t *output, igt
> >  	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
> >  	cairo_surface_destroy(fb_surface_out);
> >
> > +	igt_remove_fb(display->drm_fd, &input_fb);
> >  	igt_remove_fb(display->drm_fd, &output_fb);  }
> >
> > @@ -599,7 +634,7 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> > opt_handler, NULL)
> >  		if (data.list_modes)
> >  			list_writeback_modes(&display);
> >  		if (data.dump_check)
> > -			commit_and_dump_fb(&display, output, plane,
> > &input_fb, &mode);
> > +			commit_and_dump_fb(&display, output, plane,
> > &mode);
> >  	}
> >  	/*
> >  	 * When dump_check or list_modes flag is high, then the following
> > subtests will be skipped
> > --
> > 2.43.0

