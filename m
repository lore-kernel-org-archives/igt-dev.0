Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C634C77B7F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 12:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C248D10E115;
	Mon, 23 Jun 2025 12:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQ9eTQ7i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D7410E115
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 12:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750683250; x=1782219250;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N8Q9QaASg02gcGA3SyBhvI+ogzfKEsf85vsLnENo2FE=;
 b=YQ9eTQ7i2oUYfQ5xPZEfUQ1+mT8YFL3e6Zns7WC7bzS2Q4YwcxZxachM
 zjjLJ2Q9/7PKkgcHGNAuk1JPZ+ogM/jyAOLCQqedF/YENpJD8mo47kvgD
 gtZQUlUHv8Hu2IujT6bNYS/zgk5Z9AzrpxokCsbO0AginmMRWdHhJ6KI0
 AerfvIx/7eNmpaJUP+IYh4Q1L/EB1EK7cM9Xu0uk/xAdK4vPhDdeLTC0N
 h+pZeStsVx64HxD0dFvilkIlwbBDaS3s+TkFsI7f+L0P6IzrE7bemBPod
 6Ab6KlQHannNwvLFyH7A2GrBBdogYu7rhZkgS3cVIZKlx4N8rybhlcsKy Q==;
X-CSE-ConnectionGUID: DliWUlliTme8xrs3YhZiZQ==
X-CSE-MsgGUID: 4ro3yDeDSzuN0z0qWvbO2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="75422550"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="75422550"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 05:54:09 -0700
X-CSE-ConnectionGUID: bqKAonLoSSusw4B7FjFvDA==
X-CSE-MsgGUID: 8Oj0L0LKTBmeHFkS9i25Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="152269914"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 05:54:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 05:54:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 05:54:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.85)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 05:54:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGRwYwK3nFHLltDOTdxuYh2OvKyndQTlyTqBKn8vR1iGv8G7x6KO8Vlbko9fgxg939vbp0DmFNHR+LMyYw3zsfQ47QWjLrL+eoNZBKVCasqQOjJZQjNX8ddQOcHbthHFU5xUBQiXjQhut8StK4APKnPAEgrzXmlL46uAB4WZ39UUPT/afdhTLYT73C9vOS0pR6VV95TvWDmTi4rW2Rt7DFvcFSP154Y0uf5aHmtvGskbrEdHcRkbky55kkhAdnQbrZiIE42SQSpP98m4vlqu1pOv5Q0AEzwWwuG1WNJ0Tdq/A9Z1bH8UCAhXg9qRobX9/lV1HQm5xrqXOREPy1bbPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U4v+1sQVIENP+K4adEwbJCp2X3Lw1snVfGucGv1TSQ=;
 b=hKiY7JNZzUly6mNmeYNJW0RZoeS04M4sI/r15ASrliP6ARDNnI/ibpjbHvoC1jIdEnsTZyYi+JnCD61G4CSYbymaCGkXwWr9w3toblqunpm4qTOnKn/5Io4EMzbE/sudjAOzPM6m7kFZw52iw4VKEZZnvOSM2dpXgRb4kyWMNDZLi50eUEy+9Li/pUV8aFyF6LoQOfFVLHqPfOeMLCGDU79r9tsZKrjori+9ell9fd1zVgn2aQOIe5961jT1PiHjKbS4IJjRKc9/5qD375Z+kTBLVlypp9hpRGCF//evr2HECwrbnAk53lyKmHiXi9NRoDhOgVYo67Uuva/ysdynpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 12:53:47 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 12:53:47 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Bhadane, Dnyaneshwar"
 <dnyaneshwar.bhadane@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Atwood, Matthew S" <matthew.s.atwood@intel.com>
Subject: RE: [PATCH i-g-t] lib/pciids: Sync pciid's with kernel commit 9b779ff
Thread-Topic: [PATCH i-g-t] lib/pciids: Sync pciid's with kernel commit 9b779ff
Thread-Index: AQHb4/eoEyDCuLpayEGNCVxtXN6AFbQQs5cQ
Date: Mon, 23 Jun 2025 12:53:47 +0000
Message-ID: <SJ1PR11MB62047A1744023B96100D42458179A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250623044646.3764499-1-kunal1.joshi@intel.com>
In-Reply-To: <20250623044646.3764499-1-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA0PR11MB4558:EE_
x-ms-office365-filtering-correlation-id: 3a15fe3a-3ecd-4547-bac2-08ddb254fead
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6RZjoL7jARpKqD9FKRlR721YeR0Zk4g3uCvJIows6OSK1/ZhIvLgQpylj10P?=
 =?us-ascii?Q?T/F5jaA8V9CK0nl2ri768OpQ7s/HS3R5PIa/AHg9WZ9MKkXwkFbc2/Qal/rq?=
 =?us-ascii?Q?7MZDXW0xVvm8DrruZZtYuNwz6zcGpfzGP7tm20V4/kfUe8nOpcpQXUCRzhDQ?=
 =?us-ascii?Q?sDRQI36XxjL4nCWvvgl6dktZaP8s+Fvk9qk2rilfa+BFQmbDTE7B7yrVve5g?=
 =?us-ascii?Q?YV0BwsPEc2eFzx0zSlceJexfdrjqUWyiGQBGljOpOn62f7pw7YbVOzgFBeHM?=
 =?us-ascii?Q?OjSLjodzCZEFHBXpvpQrxBd8dhhDYy+aeL15J8IjNCWdm3eX3L4ruRTOx0ku?=
 =?us-ascii?Q?3o4utX1RI8OKIuMspzPlv3uoT/3jl99qV8Jx8kM57eGoHArL605wytHLaT9z?=
 =?us-ascii?Q?NxrX00w+ZlpWMaRS5r9JHbdo26X8R7uJgTi960XDthr4QUeyMXxiepBAAC4o?=
 =?us-ascii?Q?9JNQgo86Xvz78rp5w2wUXA+9FlfPBRzMkPtKvgkW9CwqQ8jLL+n8VPepfh+r?=
 =?us-ascii?Q?4iA7Ize3Q4XiAMO3ama9nyEPhqJIAyYQBhTPbjRPJM7TQUkEmu9Lnb8OwCxc?=
 =?us-ascii?Q?B04OZKdhTCMfG2dlOJ4boEfUQS2oslsJSPVYPe6zwRpv0qfstbvlbqSAgtIV?=
 =?us-ascii?Q?PcO0aniN5qYgBUtkfXJt1I38fs8OYUpiIwmMtZO1f3mVcZg22wlFPd46tnTt?=
 =?us-ascii?Q?PnEC3qZpltUWaOpiiPOpCPvMYTNISnzQ2UAGbBXmfo27xq7T0fUPyfPN/DE3?=
 =?us-ascii?Q?+i7JHHRX2VWSSzZuE24PORZoqZug3xbDJzV9dCqKNQLu8sDtG3ql+ekkNEWP?=
 =?us-ascii?Q?W02PR75NYLfx0J2lkOxpKQqVK+TrDnK5Jmuimx78k/GQ96h04kmUqH3SG46q?=
 =?us-ascii?Q?x3pv7yMkdbZdZLz94UNbwbp6c6s1WGh+s2F60Zz2f3+9Bg/aIX/NxfZGpHdW?=
 =?us-ascii?Q?fcefyHBL7vEHL/TWSM7DPhbypv6EEBAACJ7xG8kvf5FTs7UnCcMqzIeZeOEV?=
 =?us-ascii?Q?ODQp2aKnMNscIm0easvqXir+MP8sSi2qBu6/Fhxd5aYADtcYF0u/+4q8FvZA?=
 =?us-ascii?Q?wlk7qSfSXN3c0TscIQur9O5ikOVSnGok3QeOB9iyFLWzXIOEmKR5dQZe28NK?=
 =?us-ascii?Q?SBxtUI16PfJKT5VYkOKoim701QRt9gtaHvEwpqym3g2bVYgaYcrb82WV+w6z?=
 =?us-ascii?Q?i/PiJ77L21+pYOEHgJNeKcwv+GZg+7+M8Eye6eHGvSleFTsIOzaAb+P1riRx?=
 =?us-ascii?Q?5dZ7pi8Cq8UhQqDFL54cGVKtGl7Xj40mVfFNrk98QJBGukuSmLiRaG6nBKfJ?=
 =?us-ascii?Q?MGwNrcsB/2YMrvPM/llBCGh6SRGhBL0BfII78aElcJ3oeOzbEkSHWU3jrkBp?=
 =?us-ascii?Q?6Xmszl6zmhzsD7UdPv/nkdNDJFXCRDd/Vw51q9jQllpZR9i1Seg+xzyfFj4B?=
 =?us-ascii?Q?jhqAS7h/zWdq/gmF5vB56XHAUcsOuUN+oabtAmjDKhX9GPlhS5IPUfPuwisl?=
 =?us-ascii?Q?nzOD5JVdVVYpVt8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vQHK1r54m0xFzcjOo3SWfrH5RF+kmP+3pXBaGPlZY8MRm/Q3IIr9vampXBga?=
 =?us-ascii?Q?bZFx2B5N/Upr6TIRVC252eIe06moxBQp8eQcYKKJ+LjYmD/XjidxEgqd0ehX?=
 =?us-ascii?Q?GPxd1/ptFcB9vKyNEdN+0k1seTNp1ZkYU+RTtCfsl8vnVHt1qG1aVxBbw582?=
 =?us-ascii?Q?3finfaarkbT8F8GSha/89INRpQuj1+Xx/C0QWgfLyCIemgwqH9ZIFKlhYIg7?=
 =?us-ascii?Q?JiW0zn4+Ug7H/QjtprCZpbn48mXqEz42NnRH8P3QNE7o1PJ+4UcOMHSnBvp5?=
 =?us-ascii?Q?USUyoW8h5M2P1L3WY65NzQE5C+uhPuSjem2aElL5GSek264FhvfWET/84nfG?=
 =?us-ascii?Q?w2BMNroGCpGLdxVmjnjPGgdFCZSQYbznxGCXil/2a3BSui/U8zA0+ZOE98qL?=
 =?us-ascii?Q?vEDG/vz+12eNgX/NTs6guU7s+9YGm8w2B0bCYXhi5AMpDy4ySXnYnH4zFMOA?=
 =?us-ascii?Q?UcdNxYMEiSiHXHJrSCXFyPvhMS+Fx3PPclybHGi3N7wc40NiOxKprEl09/KA?=
 =?us-ascii?Q?Tf04fCDzQjxXE8rAQlrw4i3gmbBpkEoBKaXg5LAyvR1cF8SWwXlyMMcYGrDu?=
 =?us-ascii?Q?zdbY4uq1jDbWYApCksJeIWYpW7o+8OXJ5tHh/ZskFVDiHCoxRsKTGmZB6JRB?=
 =?us-ascii?Q?pPfV/V4pzIkZlHh9F+JaqqE4JJ8ghdKOUVssSzjp4kPlT69ndvVfHbzUuiO3?=
 =?us-ascii?Q?y7QkDrqRLS7D2bjvKk5OnKMabqlBEi8Ot6SnRkb92wA5GTZQYb5kX54dbQs3?=
 =?us-ascii?Q?l3v5t6mrEvMxN03VwVS1/Hww4GGOz4HJDcVWGVRcqtxKTfh9dpc6Nhbsi3R9?=
 =?us-ascii?Q?+ZD0Qr6zZ5PvB+1XxScBZzKoqAdUQdfo/NCwVZG1x7uaAUGUhwX2sDu4Wlrk?=
 =?us-ascii?Q?0fuBQpFXxjJFgoiliVb2BB4clwCixbU7IFiDeFFBeIv9a/nrhySMjllNgUsY?=
 =?us-ascii?Q?OQdbtMlh/AJl7Lx/1VqYM34tcu24Kuu1dhEpwX5id0x72PUaXYrqQ8+FR/BC?=
 =?us-ascii?Q?94fsV2mZnoxxdunpApELJrMzaVWS7WJpceprTMaTw8GP9bl5OIlOpVJ4B+b1?=
 =?us-ascii?Q?CM5dEjvlJpHMUfcEXojcSSo3o34wHdaxbNv3PRufNACDJ7WbSzVjahVqZ/kc?=
 =?us-ascii?Q?S4cfaQgYCIoBeVpDNMeYVyoOCeQGAuRk8UdJp3UOI4qMGG8U9EWKOJjZzO0D?=
 =?us-ascii?Q?49cOQtspVl9khGVeIaLCoo5kF8fvwS0WNOKSy/Y8jyfjiuqBklvnzbOIwYuK?=
 =?us-ascii?Q?LfwDC6hkFbJP5id9yR3t11qt7oUym/n6QilgiGLpQt+lyO8a6zJTwqIKED5N?=
 =?us-ascii?Q?u8GV032MZqQR2YwslUXOC1zeIjGtCg/5po41Z4t2VQpri4v2mFPQJnnctoww?=
 =?us-ascii?Q?1NxB06j41V0gUndnqlkui3dy2uwR4+cBE9oomyd6ZaB7MpNyO1mHx/vLmMkK?=
 =?us-ascii?Q?eE9OVe+PJVbQdV4LbDqiVj/mxeEFLtLRIms5wfonm4YW7UTVq64YrmTK6xN4?=
 =?us-ascii?Q?6+oWjjWqhniagJ09w8OI9ft3q1bnZZKhDts4595SDhmRFqAmoext4/TuyTkR?=
 =?us-ascii?Q?wyyuPAXN9Jc88M6AaFIbKlNjUmtdLG3zqK8RnL7hGh8/291dTJOCN7JkP7CS?=
 =?us-ascii?Q?MsQvs0KYpdAf0jtTLHQyJz33WQspSQfAgxRLNQ/+OLIi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a15fe3a-3ecd-4547-bac2-08ddb254fead
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 12:53:47.6078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ccf1/tWwLvO1qa8Y8JVhUXQo7agDN62Ad/nI1gtkJkOqWesWGOTkADr5hKTVoaZr3u6nUTjeS+towL/4n1YNA1LTQQ37RjFGg4vRYdXtxaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
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
> From: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Sent: 23 June 2025 10:17
> To: igt-dev@lists.freedesktop.org
> Cc: Chauhan, Shekhar <shekhar.chauhan@intel.com>; Nikula, Jani
> <jani.nikula@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>; Roper,
> Matthew D <matthew.d.roper@intel.com>; Atwood, Matthew S
> <matthew.s.atwood@intel.com>
> Subject: [PATCH i-g-t] lib/pciids: Sync pciid's with kernel commit 9b779f=
f
>=20
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
>=20
> As per updated Bspec, Sync PCI IDs
>=20
> Aligns with kernel commit 9b779ff ("drm/xe/xe2_hpg: Add PCI IDs for
> xe2_hpg")

In sync, you will two patches as below, add them in commit message,
9b779ff0e1d1 drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
49c6dc74b596 drm/xe/ptl: Update the PTL pci id table

With that,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> Link: https://lore.kernel.org/r/20250605190804.1287289-2-
> dnyaneshwar.bhadane@intel.com
> Link: https://lore.kernel.org/r/20250520195749.371748-1-
> matthew.s.atwood@intel.com
> ---
>  lib/pciids.h | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/pciids.h b/lib/pciids.h index d212848d0..129c3172a 10064=
4
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -852,8 +852,11 @@
>  	MACRO__(0xE210, ## __VA_ARGS__), \
>  	MACRO__(0xE211, ## __VA_ARGS__), \
>  	MACRO__(0xE212, ## __VA_ARGS__), \
> -	MACRO__(0xE215, ## __VA_ARGS__), \
> -	MACRO__(0xE216, ## __VA_ARGS__)
> +	MACRO__(0xE216, ## __VA_ARGS__), \
> +	MACRO__(0xE220, ## __VA_ARGS__), \
> +	MACRO__(0xE221, ## __VA_ARGS__), \
> +	MACRO__(0xE222, ## __VA_ARGS__), \
> +	MACRO__(0xE223, ## __VA_ARGS__)
>=20
>  /* PTL */
>  #define INTEL_PTL_IDS(MACRO__, ...) \
> @@ -861,6 +864,10 @@
>  	MACRO__(0xB081, ## __VA_ARGS__), \
>  	MACRO__(0xB082, ## __VA_ARGS__), \
>  	MACRO__(0xB083, ## __VA_ARGS__), \
> +	MACRO__(0xB084, ## __VA_ARGS__), \
> +	MACRO__(0xB085, ## __VA_ARGS__), \
> +	MACRO__(0xB086, ## __VA_ARGS__), \
> +	MACRO__(0xB087, ## __VA_ARGS__), \
>  	MACRO__(0xB08F, ## __VA_ARGS__), \
>  	MACRO__(0xB090, ## __VA_ARGS__), \
>  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> --
> 2.25.1

