Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B73CCA6C9D
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 08:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4CB10E4E0;
	Tue, 27 Jan 2026 08:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDb0OKcU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451BC10E4DB
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 08:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769502701; x=1801038701;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tg5BrTNifsjwSZcYVhN6eC1FUxfTJCk01F/dtXK2WUo=;
 b=fDb0OKcULzgTpiCLpmc+tywY1Cwlfyts4q+S5pkMh2bH39QRXccHZEuU
 sNlq+8rmE6KovXkT9NIIdsapGygMJbDgU7QaLkF2wBcIx9vIyRFHmsNBX
 dXa5zq/wGbmkHDoutm4gfNs5gXNSRd+G+s88E6yXA6MhuFTXd2KKa0ixP
 SmC9CSSi24CElTsNJ5XCx5PwcNcdmq6hfOMl6vzO6REzuIOixofEQEWH8
 bYcnDZ/MXJvZtGnfzJr8dfmacxELwgij+g/MDE4u+Wdcj/XOp2cgBDzJY
 jvCw86zkHqenR+8RuxVZYCsEgbby7YUGZFvHIzsjvjWdQbE6CSwnev2Rn Q==;
X-CSE-ConnectionGUID: tBphgtmBROOgmqOM5MG9eg==
X-CSE-MsgGUID: rtv5LXumQ0eSIFJId7X6Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74554377"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="74554377"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 00:31:37 -0800
X-CSE-ConnectionGUID: kPa3jELnSw2eMMFenyr3fg==
X-CSE-MsgGUID: cX3kuEDcRTyPYDCF5Ri/DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="208349177"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 00:31:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 00:31:36 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 00:31:36 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 00:31:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3mct3GMq8Npi6sFrcwH2uZ580AD//yB9WJyY3oWO6mDT51+0Nw94mSPws0hW5otIMUaS5xnXg+61cxcRIsSveY47jP+RB5aTnnerh/thCL73bMtFc2E2+EJmaDQ1qQkp3nugm2UDr7pGKsb5L+7V713XLZK1vVT2vZ6GT4iifJwZ6E24CKMX80oIQZ8Q9QereCprrReDZxMlBPjvHghAyoUt6FtnP7RsaPCi+ViGatwwpEEszzuBwq1SEQ3HssuPX0qB0yPo1sVpvbE9Ovkw6EkWF67JSf1/1U5A1N3DjQ6f8BL1XdFCKGr5Ewfh+IMtlpGB9bwO8hnxryyIeUGqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylYepHKrMz8JILQ2+e8Bs2QN2OV8xCAGN/L4fjTzBmw=;
 b=LiJlLRoS6hc9c+wAvh73ICzUq8PmtTDbkcrhanfTtGqrHhhix5LIatRxHcAp3fyZYhtYQY5qAYbr8pP/i6FJR672Pf8ACgyPIcSkR4TZkilj1c1T7Ah6z1T1SA9FnkgC+kXInG2pg5TBcXmPM55mBEQFs94765ualr6CqolDvwhV1B0UFZsU+aNBf99rSlVyHH8RiuoIZOQtLt88xNyzUkQ1aRX7dQUAiY8mb1+KOE03uHwoXo0G7AEz1ZbTzW74BEHuQ2IjO6gj70vDx6f7DEidzZRXLj9CMPKw3aidvy5rQrEjh5Cjz23RdidWIa+fC3pp+Vf0rRWwrS61yCxdxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH3PR11MB7772.namprd11.prod.outlook.com
 (2603:10b6:610:120::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 08:31:34 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 08:31:34 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v7 8/9] tests/kms_writeback: Refactor
 writeback-check-output subtest
Thread-Topic: [PATCH i-g-t v7 8/9] tests/kms_writeback: Refactor
 writeback-check-output subtest
Thread-Index: AQHcj0MqARj+fD+rKkO4g7XQjfsX+bVlsAfA
Date: Tue, 27 Jan 2026 08:31:33 +0000
Message-ID: <DM3PPF208195D8DEDFBCE5497B9A50A9C87E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
 <20260127043233.254107-9-sowmiya.s@intel.com>
In-Reply-To: <20260127043233.254107-9-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH3PR11MB7772:EE_
x-ms-office365-filtering-correlation-id: 0e25c519-93cb-4f14-ba83-08de5d7e7abf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TvINxvGVk1w+dHV8FCGlCepSVMzTPvYJR1NqxE772NkUOAvYDGnTCqHmkL+M?=
 =?us-ascii?Q?wXoqGUmHN4G7gYTelZXEU37ellc12yjjM5nb9V6V4musLCYbt5dPfMNJPPqD?=
 =?us-ascii?Q?nRW4Yb9yoMdth/OkTDua3fvZhmp+EHS7qMuKezz5dKG9FWTc7QBaEyWiabTF?=
 =?us-ascii?Q?VmXcBL3+gwPD5YR0ABfh8a6XlPXITvNZsU+Xj6mfdovxPOSsdUiZvI98k0YZ?=
 =?us-ascii?Q?8UC+3SoUiSp/6HkVpqgOi4nmC/AfNyQQ1/YYnmvio9EJDWi9YZv3i/S4aRJK?=
 =?us-ascii?Q?xzPom7GvQEKEN3iTrOjAQdqicQFu4I6CgCVaPA2tlgsHrFxAHbO9yhdZgKrv?=
 =?us-ascii?Q?+h9NoYRb+v3vHGRQvvJfEyoDUfmqQ3fQBFKe4B48Pq9teekOt6lBpaM1fHIq?=
 =?us-ascii?Q?bVA6xysRa93nnDzNNw1EKfwuRxwbg03OSJboRRIu7CeA7MnzAWnztmV8dmeR?=
 =?us-ascii?Q?uH0aajafKSKqO4MtDKMNDVzdoURn3ec3fnKGW731D0KtgdVHhnutgiGJ/L3X?=
 =?us-ascii?Q?jTI8S0PKy6nfJLb5ZjNzpsTukg2SfhAefMTTy6TIXYE6uN0VeGggryaM1Lgd?=
 =?us-ascii?Q?eWnow1y8LVwlymu66BvQu4Fm02jHPJYCJkTzypLC/yTzCa/4/3godCxQYVuy?=
 =?us-ascii?Q?CGRlN+tQm79ZboI9a+DFtxcofI9CNdVg69eOflYfhqn3j22BPWTaXy3Np7g6?=
 =?us-ascii?Q?nHPMlIy1PLaN9hntAZsFMKgtJfi0tTxqazCgaw3UHNnVmnBkp4UhYYnUs1jQ?=
 =?us-ascii?Q?rGBpgvhcokwAb6Co8dY5gwPNhXZIl0Axegwg7dxm6ubKWew9yRAm7F+SyD/P?=
 =?us-ascii?Q?OFrAyjo1Bk8jxwqsj/94OQmAACTAz8ur4mlyabmzUr812gtkU2ukayRbxl7v?=
 =?us-ascii?Q?/GEEOocIwlamIfScDU1NrceQFejdVeTYaU/5oLuZNJw7zSkM3Z0mmh5OvmqJ?=
 =?us-ascii?Q?v2Vozs3a7MlsiI5FpLlaH94RDQtw1ajevDPhRUaXI+WL8eLkdl9PhdvWF6AX?=
 =?us-ascii?Q?ibawcmZghb5hbesM8mgiAu53+myd8Z5SGBYIigO47aktSmeivlfPxlQ4vYDW?=
 =?us-ascii?Q?eO5iCMXNx/62LbhEBjxK0kUYrpgz3kpP1GtdLFrn0qlkoVrQ0FmwSFtNDhWP?=
 =?us-ascii?Q?yGDEpGB8xzZb5IFrnAkbnScuk+2J7gxH4dl3ON7T9rtgFCfbNAdpZ/i+tYlT?=
 =?us-ascii?Q?E6bx769nHFgTIHdLTdTM+gY34L5a4l2zAD/QEfZnNehoJooSHvlrSRgRHI2t?=
 =?us-ascii?Q?zzjyV3oTbAWywENBsMulsRE/r5UI4y2dudOSKK59hqqDsq9t81J4TJLIsHFy?=
 =?us-ascii?Q?SGGizn9hyqLfiQQGsmDwHsp+qqyHjt3wyQzTtNTYXeslwKyhXw1vt72pWcvj?=
 =?us-ascii?Q?CKn3jiRh9hKvLBB2pbQWnGQSkd1molamyzdJS1j3xFGLJ0m3p1F/0YotZtCy?=
 =?us-ascii?Q?NuA8hsU5Yh4wwJGPXOMpF8hykjosWjbUGSG1MneRRig9VlzP8eTHoQtx8NZs?=
 =?us-ascii?Q?+hRnb2gpgCYJ2IJNpkKYu17V3/UfaXuSdD19JyK6dMsnGU9BzRYDiF/AeFHV?=
 =?us-ascii?Q?BZ10T7XVjDn7tSIKv4QJO1Ir12BfnIOaIcxh1ZZTPH1vxoEYJqiw2KYVBhO+?=
 =?us-ascii?Q?MfoQVQGxPXlRYmOAhI6u2d0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W0pyTY/ux+zROCaW98w3D+rjSJ78/xvdWBUR7wrmCblFagqf2A/2PO6YHosn?=
 =?us-ascii?Q?5NU7FnjeS2pT1ojiDw7N8roSguAYizhLvopRg0rn0xGBDHKQdeA1Q7JBvzy/?=
 =?us-ascii?Q?ShLNMWkSh4OwW8DcLrpFHqzLWSqSCKvV1SthXf9WtEi+cASdPPwCsZfAKi+c?=
 =?us-ascii?Q?0iJkb2RtWRhA9tK+C4PTJCc2m6RdO16IcoG/90DAH5kLWJRkcG7Kg54jFZ1u?=
 =?us-ascii?Q?GR9wZitlgXFRodSEEMi9rQJWWDGJ571dut0GI6L1TCvwYHB3zM2ZCdZCLJqH?=
 =?us-ascii?Q?xIPkKXG9ZPqifqm4h/7M8gmDOE5fglIr1zlC00xezhf5ezskryYsGV2VX3nJ?=
 =?us-ascii?Q?iX1fDW2TRfm0XkGbldcfl/cmdARhTLVB1ikO43pS5QecZ2jftX8QhflnpmiX?=
 =?us-ascii?Q?EGgOcpO10cHUb22nzbgHDfDI6qCnXLZM1c+XoGTscSdObzJR2ZICQurE2AuG?=
 =?us-ascii?Q?hyCPS53LjPf5rUiLka1zP1I32GFa4++RhhuulSoqWMz5smYRtjGKhT/1RdxP?=
 =?us-ascii?Q?B+QL50UGmUX4drINNOtwFPA7SvRX3WktPm5XrYo3wfDbiVQEYrVKZUoimuT0?=
 =?us-ascii?Q?9K/x2P+flUY+eOiunYSJyDcIzJ4gUny5jcw56MroURHcnp6oAZtJhk5QYKI2?=
 =?us-ascii?Q?6R/iI3fOdzOBz0wA/VT/Cf9ugCOijzdSyUTMXkeTHgmEpLAhsgqbfmcIEEZY?=
 =?us-ascii?Q?NPYeqtjmRmI7tewe8k/1P9yWow/rZdkpbHkjw1PdNagn7BSxjpLoWLczAais?=
 =?us-ascii?Q?iQsEUBY09Fr2SQgQyLxyj6AH5JICf6uRPTF5egcQSc4XRfX9trlwNd3urfQn?=
 =?us-ascii?Q?1/L4Brm70vy3ROVlDJrpcJE0AkRnd3GJf4YOMXGwGl+F1PgE4f7scY1V6wY3?=
 =?us-ascii?Q?NE1kN995oEiAtTjP1DKCjnSbc5OL6IdUTCSY3VIin22VEfk1FU+1PCnEy2gJ?=
 =?us-ascii?Q?HCJ8Ol7f2juDjvAfMDADBn6zztWodH1B832R4kCutVnm56EYLCpQ5TzSdxHh?=
 =?us-ascii?Q?OSnXjm5IJwd6+0A32T9iF2pEVVuul1dj0b0VfKvzq5IbhSoeXpXkkxBxYobB?=
 =?us-ascii?Q?IulMt7fQp71iGzB7PN8uPJjuXcaBetEehj1WADB55r8AsIRhbabcziD5TWET?=
 =?us-ascii?Q?xG6Ox4a4xgC/dzzsqhnYpSr2LAHxEkEjSHpAmN6trX0FrEOv+Ycuxt4yrsL0?=
 =?us-ascii?Q?GdwxNVodqrzIhEu7Gio7/HS/zkHqTfQ6HnVoY+XZtVNRLPiKI9PRRONmRgsq?=
 =?us-ascii?Q?tbzXHm5pEHRYVkhWGLZtefr0CtNH01JQaqHkpukKiqdbnPMq+Ph9j4dY7L0P?=
 =?us-ascii?Q?xqaqEh+PnVMo24B5le29uCO6x8RCDgzhajs5YV0gIfh4UrQvR5mrmJ91/mKG?=
 =?us-ascii?Q?ZnfLPIq/nGf6LtrXK8gUnRfEzQorbx2q/gZCoa9N78Det3cezKS9kVyohfiz?=
 =?us-ascii?Q?KjczpioVMOmk/1LA9vI06szFpauAR/7598V9uViRd23KZs2jtJAGRKFlVQiq?=
 =?us-ascii?Q?fY/UcFpjSqujY4H1SpDwVMX+17N/QNEBlICwgdanZ+kB+b3rrxpdQLYTvuyC?=
 =?us-ascii?Q?+WZUWNNA3Z87mpXNPibcRIw2BrM/iJ59N/KTL02vO2JtsIeWtxtEApRpbcQE?=
 =?us-ascii?Q?3j96Mr9SIzhbms25lCzMZ1Fij9yCtmYcQMMIKMiP5JwWmZllH2qDa6+sHbGL?=
 =?us-ascii?Q?FcWIDhmMsvdHBqxzRPI3dUmFFOBQrPYFh+xJFP+Pl8dSiKPoDTTi8nZH+GWa?=
 =?us-ascii?Q?q3evqZHs6g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e25c519-93cb-4f14-ba83-08de5d7e7abf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 08:31:33.9595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kloRb/IBj8xNyfCLdZaXY21CYwIgS/JrHYKZGrtI8PhWO3KoaRcQwC+P9aqJuVw8WnDzuHJkA4JpLiYqQamNdQ==
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



> -----Original Message-----
> From: S, Sowmiya <sowmiya.s@intel.com>
> Sent: Tuesday, January 27, 2026 10:03 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v7 8/9] tests/kms_writeback: Refactor writeback-che=
ck-
> output subtest
>=20
> Remove individual tests for each format for the test writeback-check-outp=
ut
> and introduce dynamic subtest generation based on the formats
> supported.Framebuffer creation was now part of the subtest level based on
> the format and removed from fixture.
>=20
> v4: -create testcase for BGR8888 format only for intel
>     platforms.(Suraj)
> v5: -update the documentation for dynamic subtest
>     -update version info (Suraj)
> v6: -Remove in_fb inside subtest and reuse input_fb from
>      fixture (Suraj)
> v7: -Join nested-if conditions (Suraj)
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>

LGTM
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tests/kms_writeback.c | 57 +++++++++++++++++++------------------------
>  1 file changed, 25 insertions(+), 32 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 8d5bf5294..ec8d974d0 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -45,11 +45,10 @@
>  #include "sw_sync.h"
>=20
>  /**
> - * SUBTEST: writeback-check-output-XRGB2101010
> - * Description: Check XRGB2101010 writeback output with CRC validation
> - *
>   * SUBTEST: writeback-check-output
> - * Description: Check writeback output with CRC validation
> + * Description: Check writeback output with CRC validation.This test
> + *             dynamically generates subtests for each supported pixel
> + *             format (e.g., XBGR8888) and configuration.
>   *
>   * SUBTEST: writeback-fb-id
>   * Description: Validate WRITEBACK_FB_ID with valid and invalid options =
@@
> -716,37 +715,31 @@ int igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  	}
>=20
>  	igt_describe("Check writeback output with CRC validation");
> -	igt_subtest("writeback-check-output") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      igt_fb_mod_to_tiling(0),
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_check_output(output, plane, &input_fb,
> &output_fb, DRM_FORMAT_XRGB8888);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> -	}
> -
> -	igt_describe("Check XRGB2101010 writeback output with CRC
> validation");
> -	igt_subtest("writeback-check-output-XRGB2101010") {
> -		igt_fb_t output_fb;
> +	igt_subtest_with_dynamic("writeback-check-output") {
> +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> +			uint32_t test_format =3D fourcc[i];
>=20
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      igt_fb_mod_to_tiling(0),
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> +			if (is_intel_device(display.drm_fd))
> +				if (!strstr(igt_format_str(test_format),
> "BGR8888"))
> +					continue;
> +			igt_dynamic_f("writeback-check-output-%s",
> igt_format_str(test_format)) {
> +				igt_fb_t output_fb;
> +				int bpc =3D
> igt_drm_format_get_bpc(test_format);
>=20
> -		writeback_check_output(output, plane, &input_fb_10bit,
> &output_fb, DRM_FORMAT_XRGB2101010);
> +				fb_id =3D igt_create_fb(display.drm_fd,
> mode.hdisplay, mode.vdisplay,
> +
> get_default_fb_format(&display, bpc),
> +						      igt_fb_mod_to_tiling(0),
> +						      &output_fb);
>=20
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +				igt_skip_on(data.dump_check ||
> data.list_modes);
> +				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> +					      "DRM_FORMAT_%s is not
> supported\n",
> +					      igt_format_str(test_format));
> +				writeback_check_output(output, plane, (bpc
> =3D=3D 8) ? &input_fb :
> +						&input_fb_10bit, &output_fb,
> test_format);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +			}
> +		}
>  	}
>=20
>  	igt_fixture() {
> --
> 2.43.0

