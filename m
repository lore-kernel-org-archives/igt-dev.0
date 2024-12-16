Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5745E7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 09:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5618310E568;
	Mon, 16 Dec 2024 09:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5HaWTTa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132CE10E55E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 09:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734341328; x=1765877328;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7E07xJELQBZfSuSxkwECtaO9zHsui/Y/oGepEQUn9Yo=;
 b=d5HaWTTaLfe5Q7SIZeyKoAhI40q0g0P4fczgltgJLXz2BjywhEH1K0vy
 8ZUlJgagzGysyVyRmeIO85HuN6G+j7WJPBBIQt4zyZPSByL8O8g8bl1qV
 P3dyp4M7BsH+ICG0TU0vJ/0r4+LIQMm1CH2Z3CmbUbj4USq3/yrUXT4yK
 Sc8usFZ6+ugcXJIVWl3Y/VsVnY2jSbUkARovMFEN9yOeGZv0HQqYwZC9/
 AOBs01u82UevRai34fnIbDwOaq2fspYmEcUpyqRuPP0RFdDbwnUCZNqQM
 l9VbH8nbZd8GzY10pqzzplXVa0e8A8Z85DJ/TCql/84GbIL1JoM9QgHVv g==;
X-CSE-ConnectionGUID: FnwwzN+TQVi8unMP4FzYCQ==
X-CSE-MsgGUID: kvMEpB2nQIe4iLSf5cffkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="45327076"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="45327076"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 01:28:47 -0800
X-CSE-ConnectionGUID: va683zmTSqe1JSM+KNqpJg==
X-CSE-MsgGUID: S7al2STmRy+9/FobIfHy9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97003194"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 01:28:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 01:28:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 01:28:46 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 01:28:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDy5OLWYiYsQen2cgFxIJsb7tq3BmKJ/Nr8AdQ7lmY9P4Dyg9O7Kso78OlWKqFfF47SnP3q2Zn2F+T57o9rTXYf+4C4uv8RwkPBFxZIj7pe4BtMN3mENn1Z+DrLHY9UDsuZq1qyMIHE+R4SipkS4oUPF6XJjAJW+cxclgKW1jx0pHNNxvTN3aqq4ug7Rx1StioelggrIEnILYJkf2NWws2273kagmPIZJmpvLENuAPtJvDxcRnaJIqkAzovNwDqYfmOd4wRT1dHl3JX4rl09ILmtOuWkOItXqP7fi1kM0geGJCpGdMqTZwywtSH+MdFqdzs6pM0GOTMyWvF0uvRVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4ejL04OEeArNSAdobAtLdlypxOnYJl6nzdZvGmo1M4=;
 b=ay5Lt/OJ9diNHcT7oI2qWqNZKsnHwozV0+9cFRRcLwx+cfNudifEgpXxxisbfILTkrfro0k5asBTsWascAzCFO44ieXpBEtQkWF7Ved0bQhDvZEQqssC0tXPHQul8MM7112R6MS7afvvRLPPzQKNqSkH+VCVUJ1zMqjxyj243AwiNHRFTvgh0rbzh6JE0AxrUjfO3wC3aYxI4O8MaNhLyUvanVXKYPWia6TXLgBxwnM4MQmi/9BPIkBO4qTi5N6GwlOw0hRENQEHQZatQ1qutsUcB/4blJchdG8VPWQglFv5TwLq992aPtMIDBeKL4pf+tngJRzIIoCQsd2Lj9Br2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DM4PR11MB8131.namprd11.prod.outlook.com (2603:10b6:8:190::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.21; Mon, 16 Dec 2024 09:28:40 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 09:28:40 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Gurram,
 Pravalika" <pravalika.gurram@intel.com>
Subject: RE: [PATCH v10 2/2] tests/xe_spin_batch: Add spin-timestamp-check
Thread-Topic: [PATCH v10 2/2] tests/xe_spin_batch: Add spin-timestamp-check
Thread-Index: AQHbTVgD80QXv5FLoUiFkxv/b6Ll4rLoniUQ
Date: Mon, 16 Dec 2024 09:28:39 +0000
Message-ID: <DS0PR11MB72642F061E9444477FB8D5DED93B2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20241213120739.650439-1-pravalika.gurram@intel.com>
 <20241213120739.650439-3-pravalika.gurram@intel.com>
In-Reply-To: <20241213120739.650439-3-pravalika.gurram@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DM4PR11MB8131:EE_
x-ms-office365-filtering-correlation-id: 7b683987-b89e-4b01-a959-08dd1db406b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?XMeS8x5TAD1EatVIrj2xTTDWZaE8PZ3fh8OEIuNV8KyZBVDq8KX3EY4vjC?=
 =?iso-8859-2?Q?tSjV+er2WR1WDJgfS2bofpL9A0Bfuo0gRgw/R7Ak3t9elxBXfj8yZkELsa?=
 =?iso-8859-2?Q?y/5GV+t+eYSqExGbVXFkk9UbvaE3rv4MUwQ5NnTsjv5YpytJdolDCHDsb5?=
 =?iso-8859-2?Q?fCV47V76i32vZpdmlgT2SA8pc5x/atBzhVw2s73TqVpX4VtSPpMxdg4Oxt?=
 =?iso-8859-2?Q?6R9Nbk3uni2QyUz55cSfGjJi173fRG5nQMkjciXH2pC5yVKkg4mjgeqJdo?=
 =?iso-8859-2?Q?g2pJCghRtNvYa47wyzVnM/s5HbsL8yj81QNT7RCWao5D1ZBktCKMtRSb2H?=
 =?iso-8859-2?Q?3GeWBHzyUtCNJEesSKvBhrI4weESP20bu65hDQKv3h14dYVjBwHZgcy72a?=
 =?iso-8859-2?Q?/d9y37G9cuKSJZRq+kJOpHxfTky7J83Z6QoLHvXA3F7iYrqNUcOY5AMOTn?=
 =?iso-8859-2?Q?JcSakmZ/VAp0KZkXOJ48sL2J1rdhd+o+mN1baJHSUMlOwnbkVwhySrcFS1?=
 =?iso-8859-2?Q?sqCBiXAF4qIGpsuU+LGqtUuHWf4NMHKyt70aDW+zJ1KYjWAi930n7xCJjp?=
 =?iso-8859-2?Q?htxiZI1thnGaJRLiQq2gCosp/ISlLCEjoN7XF9gWHS7eRGO8X6rHlDbN9z?=
 =?iso-8859-2?Q?C4uloNqh5wiaKYmZCdwlEZvkuJZyv7VXqL3lPO1o5gAjVUp7dbwTNy0ipu?=
 =?iso-8859-2?Q?uBdH7fr2iXK03P1XcHpXb++D7Pm9yvlBVni0dIILeggpYqTwcRZkNT3Ftk?=
 =?iso-8859-2?Q?gymYD9yDqZwY6ifgNIJCtWBLKnEwYh2EWojKmv3l2k76FxqHIERtsoZSVd?=
 =?iso-8859-2?Q?gSydUGHxOHvv+rQxxHLXI0OwF9SXzSzYug7N1Tsm3hS3ANFGrsF8faIkAj?=
 =?iso-8859-2?Q?WzaLsgJEW5o5A4GkFZ11Fiy2VZaoa92MYggBXjee1ktYJniPDMqQdowXoN?=
 =?iso-8859-2?Q?9yIumgVeVK5JhYTZpoHKk20Pt6eRx/Jvcqu7fA35uiHG8aO5wrcWmnGrhW?=
 =?iso-8859-2?Q?OATLkpd1wgecgrcUp6mZioEn3U1WUA3/+/tpK+xRXJrezuTz3FMXUBHc5N?=
 =?iso-8859-2?Q?9c9SfvHc+iOUa2AWnSuouA2IXWBgXfAFz3mXUurH/ctXHUHg8DVS0gSykI?=
 =?iso-8859-2?Q?A6wMHUS20WBhX3JC/bpbiPqGah/aOyU1brJauGH/xBB/XgITzsyOOXCJY9?=
 =?iso-8859-2?Q?4hdmWQoVIt/iZHqK/OdHG3l5Qta2vGbhvVnT4z1Vu+ywZUjOF38EsNIu5d?=
 =?iso-8859-2?Q?7oiTw1sw7jSOO+EZHg5t9HnRH9jXiMDDSI723BCYflr0+4Y3VLlly/mHrT?=
 =?iso-8859-2?Q?stIEVoz5uZp8rRpwPKS6uWagfrTNb7DjuZlOVjp0DVuDTkLoERq4+1p6PX?=
 =?iso-8859-2?Q?qfukyZTkhkVk6ALAjZf3uWlpQu+II/bU0oc1Dbw8oomRIu6Hd3qIAdpQwC?=
 =?iso-8859-2?Q?C7gq6c2ofKOcUXnpZUNihXj90v8mbMoWD8/JlKrhl3u4W09EwSaWBgVcGr?=
 =?iso-8859-2?Q?lTP4axEjnpWZCRb3ZWw041?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?LiAYrzrlOiTINkAJGwDJYt2mdoEGUzY3LJ4EOPqahnk1++mUx613DAv3hW?=
 =?iso-8859-2?Q?+Btjczm9ZfPoZqepbC+B/MnaUhxLSSxVk8annC8j86v4tRYgDZCpxMkGdc?=
 =?iso-8859-2?Q?SyJnjde99FCnDfoxpswcTF9GT+nSAe4CmTd3gAnC1QTl3ddE3XgA/8i7Vs?=
 =?iso-8859-2?Q?9EiIPV8aKdpQgTlrLTaTA8ts7gYag+grVVbO7faP4m6ag7Fh0Cu8IvD8Yw?=
 =?iso-8859-2?Q?LwRm7NJks/CmesbRgHEtTtixcMprXX6PHVK6lWZwhBEhZqNv0L+6TobFaa?=
 =?iso-8859-2?Q?Vxr8641Fne+3TvRzni3Qm9Anyno74xmW8wAihBCqUg/hFFiEemdZZ+bDpe?=
 =?iso-8859-2?Q?3CocjjpemDxJCJsN0UcoJEAqaV6CBbb/XDHzMs2qcGwHdmTROWVRnnJ4c5?=
 =?iso-8859-2?Q?vQjKO5uoPbSldNxyLxmVXgCMwijKR+w3civGZs4XPRJSogTYoaTpSMCXmT?=
 =?iso-8859-2?Q?zqZrTUVJJLOBCqbilnTChhlPK7Sg6NFXJTja7LCwouJN0qFuu9cocSNHeg?=
 =?iso-8859-2?Q?O+ioIsRAJxGJNhKjNgV+TvTGEOjVmLxgLKzj0ahOuWCtrt5AL3FLckkF3z?=
 =?iso-8859-2?Q?OxezrfsbzmYeXjZFs7zU7Mg39GcX9xoPk/eenBQBeXngCNIYjjbRituG3+?=
 =?iso-8859-2?Q?CDda7fxV3VMJDCo3oDw40NYaH1Q7P7Dr7YbilC4vVVlcpzkclVi6WPrkMi?=
 =?iso-8859-2?Q?4zVO5qaAUBU0Fj42honCu+JkAA8d+Uu1KvBsSmPv9broA3X4YQcHkJzAnZ?=
 =?iso-8859-2?Q?LabFefkCedDu3VCXe+1vsTq0XQxCA0oHNAhXqPhaYNR5Bm4Q61WUkrxzRu?=
 =?iso-8859-2?Q?KP6bhVWTvbWDa4G5YX9s8J5riKKwfUVV7vju93V0fUPgpZFXjKfrVuBmwc?=
 =?iso-8859-2?Q?zsdYpE7f6U463ruEdVQ0ryu8deVLfmUOrC6F6fn/YPbf5DOkSST28evsxa?=
 =?iso-8859-2?Q?qBYzx/yI+71p4CTO8msEn27TlWi3Sm4Xu8pHtuSKOqot2Dx1lXLoLtqXrr?=
 =?iso-8859-2?Q?11FBPeaISrDULcaXbNcZljjpcG561lDA61NRVHwXPHqbhp6nuXCB7g1Av8?=
 =?iso-8859-2?Q?6SUCjM2E0rn0HWOsCwvaneGHRxBrh2YCV4TVJ6A8RtVHYp/RW0h4Hs00Fy?=
 =?iso-8859-2?Q?jl6cXpMg5PFpsqkGLz3MmgaAQFqZluCfaawyQyBSs/pgKxoqlrD/yP3qN9?=
 =?iso-8859-2?Q?7TvChWB1s2PUo2+BVgpkjSYIPQB3eM+TGgzeDyv2zk5O+OoTBhceH/DJFL?=
 =?iso-8859-2?Q?Qy0etkOWLICQV6fr7Q8EvmZ3jnVHCdtDszIBpRFWJy87kkAZpQB1aT/CK6?=
 =?iso-8859-2?Q?VBvXJVD15YX3pn3xxGJBJ8+2FTrxJv2aqO9JgPQ2UMmv3fJ+Is7TFjkCaD?=
 =?iso-8859-2?Q?2QTua6uiKkk9WYMRzUy25IMI6BemKsDE5+mYq/zO0vHpis6iJUUjlrL4Cz?=
 =?iso-8859-2?Q?2Bdr87WCPeMJPuNEuf370W1iA0ZzCb4m7ixba64Ntb7PET7/NLHp6d0MC+?=
 =?iso-8859-2?Q?xqv0I61nfOJU3DCYD0dxttre5jQ0DfafWC7iMg4wKaQp5BDHYP8pUUZNxn?=
 =?iso-8859-2?Q?MDIfMVo80DAWPHvUQ7Hfs/XWkuUrglFDVq02UobDQvkvkrYq5UA86Fr1fX?=
 =?iso-8859-2?Q?lBkOyiq1oGD1oBeavh8aXFw+UaHa2kvy7AEyc550EWt1TaNPb1epem7g?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b683987-b89e-4b01-a959-08dd1db406b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 09:28:39.9856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGeBXImPEGhcPDEGQ9CDXdL1BELW9yZ1GG3HIRevAUsJGBV/k8+7sJhGE68Js3r7qJ0MOwJ4sAYbIOFIkpJMKljzfFpVryorVXS6BSMa73Nh/m8LOvyYTFJ3j/QaHmCK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8131
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

Hi,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Praval=
ika
> Gurram
> Sent: Friday, December 13, 2024 1:08 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Gurram,
> Pravalika <pravalika.gurram@intel.com>
> Subject: [PATCH v10 2/2] tests/xe_spin_batch: Add spin-timestamp-check
>=20
> check the ctx_timestamp register post gt reset for each engine.
>=20
> Signed-off-by: Zbigniew Kempczy=F1ski <zbigniew.kempczynski@intel.com>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_spin_batch.c | 119
> ++++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
>=20
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c in=
dex
> 9314e229e..947644190 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -309,6 +309,119 @@ static void xe_spin_fixed_duration(int fd, int gt, =
int
> class, int flags)
>  	put_ahnd(ahnd);
>  }
>=20
> +#define HANG 1
> +static void exec_store(int fd, struct drm_xe_engine_class_instance *eci,
> +		       bool flags)
> +{
> +	uint64_t ahnd, bb_size, bb_addr;
> +	uint32_t vm, exec_queue, bb;
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +	struct drm_xe_sync syncobj =3D {
> +		.type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value =3D USER_FENCE_VALUE,
> +	};
> +
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&syncobj),
> +	};
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +		uint64_t vm_sync;
> +		uint64_t exec_sync;
> +	} *data;
> +	uint64_t batch_offset, batch_addr, sdi_offset, sdi_addr;
> +	int64_t timeout =3D NSEC_PER_SEC;
> +	int i, ret;
> +
> +	ahnd =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
> +	bb_size =3D xe_bb_size(fd, sizeof(*data));
> +	bb =3D xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id),
> 0);
> +	bb_addr =3D intel_allocator_alloc_with_strategy(ahnd, bb, bb_size, 0,
> +
> ALLOC_STRATEGY_LOW_TO_HIGH);
> +	data =3D xe_bo_map(fd, bb, bb_size);
> +	syncobj.addr =3D to_user_pointer(&data->vm_sync);
> +	xe_vm_bind_async(fd, vm, 0, bb, 0, bb_addr, bb_size, &syncobj, 1);
> +	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0,
> NSEC_PER_SEC);
> +
> +	batch_offset =3D (char *)&data->batch - (char *)data;
> +	batch_addr =3D bb_addr + batch_offset;
> +	sdi_offset =3D (char *)&data->data - (char *)data;
> +	sdi_addr =3D bb_addr + sdi_offset;
> +
> +	i =3D 0;
> +
> +	data->batch[i++] =3D MI_STORE_DWORD_IMM_GEN4;
> +	data->batch[i++] =3D sdi_addr;
> +	data->batch[i++] =3D sdi_addr >> 32;
> +	data->batch[i++] =3D 0;
> +	if (!(flags & HANG))
> +		data->batch[i++] =3D MI_BATCH_BUFFER_END;
> +	igt_assert(i <=3D ARRAY_SIZE(data->batch));
> +
> +	syncobj.addr =3D bb_addr + (char *)&data->exec_sync - (char *)data;
> +	exec.exec_queue_id =3D exec_queue;
> +	exec.address =3D batch_addr;
> +	xe_exec(fd, &exec);
> +	ret =3D __xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE, 0,
> &timeout);
> +	igt_assert(flags ? ret < 0 : ret =3D=3D 0);
> +
> +	munmap(data, bb_size);
> +	gem_close(fd, bb);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +
> +	put_ahnd(ahnd);
> +}
> +
> +static void run_spinner(int fd, struct drm_xe_engine_class_instance
> +*eci) {
> +	struct xe_cork *ctx =3D NULL;
> +	uint32_t vm;
> +	uint32_t ts_1, ts_2;
> +	uint64_t ahnd;
> +
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	ahnd =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	ctx =3D xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd =3D ahnd);
> +	xe_cork_sync_start(fd, ctx);
> +
> +	/* Collect and check timestamps before stopping the spinner */
> +	usleep(50000);
> +	ts_1 =3D READ_ONCE(ctx->spin->timestamp);
> +	usleep(50000);
> +	ts_2 =3D READ_ONCE(ctx->spin->timestamp);
> +	igt_assert_neq_u32(ts_1, ts_2);
> +
> +	xe_cork_sync_end(fd, ctx);
> +	xe_cork_destroy(fd, ctx);
> +
> +	xe_vm_destroy(fd, vm);
> +	put_ahnd(ahnd);
> +}
> +
> +/**
> + * SUBTEST: spin-timestamp-check
> + * Description: Intiate gt reset then check the timestamp register for e=
ach

Nit: typo (Intiate -> Initiate).

> engine.
> + * Test category: functionality test
> + */
> +static void xe_spin_timestamp_check(int fd, struct
> +drm_xe_engine_class_instance *eci) {
> +	exec_store(fd, eci, 0); /* sanity check */
> +
> +	exec_store(fd, eci, HANG); /* hang the engine */
> +
> +	run_spinner(fd, eci);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe; @@ -343,6 +456,12 @@
> igt_main
>  			xe_for_each_engine_class(class)
>  				xe_spin_fixed_duration(fd, gt, class,
> SPIN_FIX_DURATION_PREEMPT);
>=20
> +	igt_subtest_with_dynamic("spin-timestamp-check")
> +		xe_for_each_engine(fd, hwe) {
> +			igt_dynamic_f("engine-%s",
> xe_engine_class_string(hwe->engine_class))
> +				xe_spin_timestamp_check(fd, hwe);
> +		}

Nit: redundant braces.

With these fixed,
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
> --
> 2.34.1

