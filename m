Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946FBCA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 04:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE5A10E052;
	Fri, 29 Aug 2025 04:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P52ugP+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A23C10E052
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 04:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756442348; x=1787978348;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=teRRHvSSm4c9s+pqNAEQGf+qa6AJ6I3HCQGkUZ/YM+A=;
 b=P52ugP+AvnY3wPcQHfB4EOzPvMaswZiqqymtdFSkTmHHnAvjKZv3Is+2
 6ob1xNFXoFLonJme3L5YPSRPasmAC9FoJEvEjunEeNaXVOOrcmjizogoS
 njmHhgN4zdhMZhghIOTrJ4ydWQ1UUGA95lP2PbOEzgf79oxtNDNTRTCUa
 wM5iR1DDhWk6D4bB0hk46nUN/HWaad4pu3cVzhjLicXuYAVN4PADxbUR+
 q//g2sxe3SSIHrWDKXSWIbztFb+94SiycxSVVMdUqFeQvWZZ4j6U80Xt5
 0UWOeEYKtS4Vk3SbjTpeqpcGAs95vcrT+oVzWaO8Qc9jTCCGaF4KYjcDi g==;
X-CSE-ConnectionGUID: TlLohyzITH2xRGhfWTffNQ==
X-CSE-MsgGUID: 9miG3XRxSc2VGQmvPz5AmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="68999383"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="68999383"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 21:39:07 -0700
X-CSE-ConnectionGUID: 4FNXwLuiTyefknk+zgOl1g==
X-CSE-MsgGUID: nSFkK03NTzu1tXDDSqWsJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175566336"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 21:39:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 21:39:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 21:39:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.74) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 21:39:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nD9x9Xuf9aP5nAAD5iBakyqHK8Wi/1ZTl+73Fkgp+gtMXIbk0oSj/SkpnZNJZOj0aO0uTFpGBBYMK/m2K4HnQrbYeMlG+RrEaVoa6Kw1LKnIuGrbSCjVaLru66ZQdPMNnUKlyR9+qSkB0TinmubRqyqGZyUNWIel3xG+7B2A41MmNvcJZ/KeGB5IH1aG4LJbPkPyvfOHVqSvAcb9qHShayP1G1q+aIClDX1NSFN4TsBbFCTnejbcdCAtlp4pvb+u0Caoc1Nv6wDie5pDrOQ/hhhMvagh/Q7eOWImHZiszrLeM0P0ePzn9D3hKC0A12p6oPL5RfbbzuctK8j4lXZwJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgVPn90CaGQDTEBhVIYHzypRylPdP8aeFuW4t1C658I=;
 b=TqMQVPjz9EzqFWKNO3mtKdCMl1wdHmlbTym05P1R+yZ5FJYE6VJ1F1/+D+aB4A6ybiWMRB1I8hqEXz/YCK7AM7jAtVYEVvNXdZPM+oIAlqOdydR/fZWJSMBa6QkyOx9aUwyFywa/8jGJa1Bb8xDvP5FApUcYjSTmecB1Ctfw3yL81ptImCH+ZVtpqo6L8IXLShtTJn1W1hIEe7ATBnTNz8hFrNa4tgjmEddnV4v+jNEuqiWUyD4bzsAursHc5OHEN6GiC+9nsKjASTjjPxjj8YPB0wNihVj4aEi3pF+nKW8hZn9mVt4kn/mFWFp+CB/xZaxf5/uj8xSjXN3uqHbaQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 04:38:59 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.9073.016; Fri, 29 Aug 2025
 04:38:58 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>
Subject: RE: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
Thread-Topic: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
Thread-Index: AQHcFmVI8W9hpzXIo06KJXjHIpoa7bR4KOUAgAAhRYCAAMT+0A==
Date: Fri, 29 Aug 2025 04:38:58 +0000
Message-ID: <BL1PR11MB5525138A26E45ABC34E9FE14843AA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250826084133.897768-1-nishit.sharma@intel.com>
 <20250826084133.897768-3-nishit.sharma@intel.com>
 <BL1PR11MB5525B2D062096D41912C21F5843BA@BL1PR11MB5525.namprd11.prod.outlook.com>
 <MW4PR11MB715145027D1B8271642E3C48E43BA@MW4PR11MB7151.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB715145027D1B8271642E3C48E43BA@MW4PR11MB7151.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH7PR11MB7593:EE_
x-ms-office365-filtering-correlation-id: d914a3d1-98a0-4701-d84a-08dde6b5f87e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zGrrs1ay6x72SS5gAkkjAe0GJIdpNUDUX6KBalqlHotXytBiyayflw4z/xFP?=
 =?us-ascii?Q?0BkGos+p3oCr4AZXEVImcqgS8SltuBnjj4Ys8z898zDXGy2TN3Co4yQ7eI78?=
 =?us-ascii?Q?eUMFAhEM8OaHDgxdaqZLrHdC9AslrIOFKVulmwm8Hs1OSlkkAy9ExOGNgASH?=
 =?us-ascii?Q?N5koeQLbU87mz57V3uyMfa4t5hFGAasyFabYHg0RW755pKZmJ0qrASVR20J5?=
 =?us-ascii?Q?1/LksD/sbxrbNMLOjYNt2OSCxYvnHD/xE2elZcB/wbPbQ1pkYIHbPvVC/yev?=
 =?us-ascii?Q?BPVyj3GonbB3oKRCmiluFa7KLQLGkMzT1he0UZYZCHVQca9lIPAUbrolEkzH?=
 =?us-ascii?Q?LMqTVdSYPQknOJpMc2HsB+UIee2j2ASFAnVhyhGJdzFtdKdenGqF5QyWGaZC?=
 =?us-ascii?Q?OBTmEU7AZqxvcTQAsj6osJD/Zf4p/BVmaRgnDkVDuecG+nKyxRwBLgvvWigZ?=
 =?us-ascii?Q?QdArIP4PRX32iVXRffkpQIxxh23aF56eaT11xzhr7nGF5ljGzUQWgwAR2Hlt?=
 =?us-ascii?Q?6I8xZNsx98Hba1iETiFar95BgZCPKfBN4pO6OKGflrdyvOqNNUXi53enP5u1?=
 =?us-ascii?Q?4fEQVG7miIPjwprntv1yNWMgHsBcFXs6eZy6II+QXYO/4HbwzHSLtIMWB+9b?=
 =?us-ascii?Q?qtMDCNc+xUQ0f1lkQGFAyImf1F3xRnokdZNfPjYl0cZdoD/BpLulaXMsPegc?=
 =?us-ascii?Q?hn6+v02oY6mUYYrR7W6ZrnqFm5zDhJ8SFP3oje0S5tKPwwbbvUEuNF8dy9Ee?=
 =?us-ascii?Q?iCa0m8LSMQQcTK7ONRMTRzjYe6Qp2bUyRGeJ0ubYGAyJy9fO+cYgBqpUUlGN?=
 =?us-ascii?Q?rDenya3D0ZfInYQevZbCTfcvVeHvhlgksn6+rkbrPXJ+DRe/xllyH7lUAJ06?=
 =?us-ascii?Q?5bP4CrWUBb/0jOrPaXLBrdVatBKHpkWGi68TS7xzXkvQA3A5DBRAB5OQfO71?=
 =?us-ascii?Q?lV+WvORQY3+fSoWhOO044FOvQ0Wc40aZ3jADVP79pDcxs8+2bN91oKT8Mydd?=
 =?us-ascii?Q?3eSc1VxbPb3KbbgJUJIDHH7mLfzXGFvjA+FSKq4M0oxVcH7PqiqLgfdklVwP?=
 =?us-ascii?Q?qsqvhAVjCke6FZro1L5B5TE7qeSgc2s7HIk9I6kDIGB/0mDr5Omls6abqy/s?=
 =?us-ascii?Q?ehqA9wmAOrXaK37PAqN+43dfaLSDKOmvX/gKRo0vwrbpzRyYFrjZto4HJ99r?=
 =?us-ascii?Q?dDTO/ZcmOVp+w9jpS7PEO/V9szO0ZeZtHCM+O7VSaSz/w9KKoeVpECN4Zbfw?=
 =?us-ascii?Q?mPfnc8QZ4RV+7KrEv5Pjnaxt4PUM7O+y9Xf43W4XY24QZK4XAmoEt1EDUgI5?=
 =?us-ascii?Q?Ci+hQMK3TxsDZD1wArbCHDRNQ93fZvYWFnlw5QPLKLNflzJJ96fY0yRtq8d3?=
 =?us-ascii?Q?AsL7Ky87+PbbR7hHXY+PhS2oCN79/zDLbE23sOz0Lyf5RAYyFpF7VnE4NeYT?=
 =?us-ascii?Q?m8g7ImQDhKONH8rttAR1drqIAXPQ0KbqjCVj9ABbsXEa808t3j5KoiktFgB4?=
 =?us-ascii?Q?uXKU5AwdPjWCylY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0M9nqUmydvAFlDWQE2DaT9RmbAYEQEqXLdJ9KZ28/Mo0tpctilXzxkNqz3hP?=
 =?us-ascii?Q?ydUr63DNwfA01t/mFjK1D3MRL48DvpA/h7VcxH84U7h+ph+9eTKLwL17QK6S?=
 =?us-ascii?Q?zLum5lsaNgl/Nz/UEL3zU/cN4C3MXjPb5FXZvXGhc2/n/HoA0U6SObYau8lO?=
 =?us-ascii?Q?kodvUPVbv5mND2c3eh2d/3te5bm4YwdbTVz/BYHWNVVAkocbGdzE5je5bOt+?=
 =?us-ascii?Q?LNwpkdGpSK4W5igy5XCwqo/9mdfOlQH8Qb7fYfO8ZJZAnZvGqsKpiDf3VAnL?=
 =?us-ascii?Q?CGQJRGDEqv1WLur+rzb5zpOC/AEnN89smdB1gkgo6dWlodRlDuJ0/f9jX33D?=
 =?us-ascii?Q?yNlnCuovjCBKt/rx0ookcgpBuBGT7lY1Q/RRCyqjA+dkcCWAioDuW8tIOLTs?=
 =?us-ascii?Q?NCw3dQowSZq1TCLsPIL3YwHX18puzPPr6HzH/i+MNEK+Jn71H2pTOOW8zXQ9?=
 =?us-ascii?Q?wng2fcDe+TwaOs8L+0xvvGIHgWfazzcJjuTS54BbPkSuQ3+rR59g4Ju44ajz?=
 =?us-ascii?Q?8slJMSv+lTLYK4mzrXdqeWwKjjfrDUqy1At27qWKx8mUTlJdZn+vHWITPEOP?=
 =?us-ascii?Q?b3U1/cIozT/z1n5zhxNPF2n9+yJ86QE7fZBgWuVb63kY46AgAE3QMPmc8jma?=
 =?us-ascii?Q?cE1xIBbKewoag5rNzSNNnDUZSvcPYrnuSkZby+M/uATCkJv+Ga+WbmZKaDbR?=
 =?us-ascii?Q?kA2scg6czkfPNSu+cwdKFIHhmrMNkkYNylqhp0NNtGXee+xOK0tCE6XpOySL?=
 =?us-ascii?Q?YN/WlZw3/il8cI/O2pBNEhyfyJmzIF6RWTzN7hQ6L/a5IddnMF/60D84RrtO?=
 =?us-ascii?Q?RtvltuRA3vDg1QTD10nNu/HKD8ka6Pt0RxJlbqw7mO9qIel0ONc9nrMGOU6j?=
 =?us-ascii?Q?cSS/Ywpfi+7+LK/oKC391UDkuF9uQvBvkHloYl4URdlgmCPiUmvysNY+oT9h?=
 =?us-ascii?Q?goh5SvOih6TY13P0yu8ymlsNH287MlboFtW57a6ttrUBdTWls3cf+gmD/Md+?=
 =?us-ascii?Q?sdZ6vWAM21XYp3e1y4tq9Dinnmtnrk9JQkrneheA/qzSx+WBZvmIwfUMgzNK?=
 =?us-ascii?Q?s3bcaQH8ntyIIKHHhaiDaV+69IX0xwqYCm4ySFAYyKIYWYwWDHDUz+xixSMH?=
 =?us-ascii?Q?Uw7vjRKgg9vG5S10B0HIngo0RzBUZxn+UEu+ZaDRsKGRFly0SHehxO6yAGKb?=
 =?us-ascii?Q?8nlGRvkP9NJoRIUHJB0ujPenhZCAOYbPSpPYxf8VC1pvirckO+edD0LKu67F?=
 =?us-ascii?Q?MunKp9Su5s8pjlGjp3jxtW2BEG7Bd2cYWIyt4hzYjJdZg0TAwXLllvoG1k89?=
 =?us-ascii?Q?cZDGzqU1N+XiGsBPN1vpqEvXO2y2aKCkBJvBVfOMO+UUwvYgTRJoCOy3a3eb?=
 =?us-ascii?Q?9uv/930zF87gG2TbL1ekDYjJFb+Tms7pVnc25ISntNwsgzp7B0fYKMA8c7PX?=
 =?us-ascii?Q?++A+fOFJp7KrH30//x4wruy0MdVkwRaLWJTG6y2zbE17q4uKsdiqamR+Vbrq?=
 =?us-ascii?Q?HvwDTjhSUZzTmNwfm0JEY4mvoNN8lV5nQfTIAcUIVr+QOpKnWi5OZOJaf+vb?=
 =?us-ascii?Q?ihKeifkuyC/FOSD4otb9iYVWphRMfVqZqDELPfKl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d914a3d1-98a0-4701-d84a-08dde6b5f87e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 04:38:58.8974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QQLkd55r/thXuPQLFG3kkWGNqV17Ozb9BCivSP/IjhBS9EKhiRxvUW9Dy7pbPdLuqpn+GwIok2L0ad4rWoPqgQ6ZWuyfRY6rRDGPsZOZOj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7593
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Thursday, August 28, 2025 10:18 PM
> To: Gurram, Pravalika <pravalika.gurram@intel.com>; igt-
> dev@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Cc: Siddiqui, Ayaz A <ayaz.siddiqui@intel.com>
> Subject: RE: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
>=20
>=20
>=20
> -----Original Message-----
> From: Gurram, Pravalika <pravalika.gurram@intel.com>
> Sent: Thursday, August 28, 2025 8:23 PM
> To: Sharma, Nishit <nishit.sharma@intel.com>; igt-dev@lists.freedesktop.o=
rg;
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Cc: Siddiqui, Ayaz A <ayaz.siddiqui@intel.com>
> Subject: RE: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
>=20
>=20
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > nishit.sharma@intel.com
> > Sent: Tuesday, August 26, 2025 2:12 PM
> > To: igt-dev@lists.freedesktop.org; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> > <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> > Subject: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
> >
> Use ] lib/xe:  Add xe_vm_madvise ioctl
>=20
> > From: Nishit Sharma <nishit.sharma@intel.com>
> >
> > Added xe_vm_madvise() which issues madvise ioctl DRM_IOCTL_XE_MADVISE
> > for VM region advising the driver about expected usage or memory
> > policy for specified address range. MADVISE ioctl requires pointer to
> > drm_xe_madvise structure as one of the inputs. Depending upon type of
> > madvise operation like Atomic, Preferred LOC or PAT required members
> > of drm_xe_madvise structure are initialized and passed in MADVISE
> > ioctl.
> >
> > Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> > ---
> >  lib/xe/xe_ioctl.c | 56
> > +++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/xe/xe_ioctl.h |  5 ++++-
> >  2 files changed, 60 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index
> > 1e95af409..43bad8452
> > 100644
> > --- a/lib/xe/xe_ioctl.c
> > +++ b/lib/xe/xe_ioctl.c
> > @@ -585,3 +585,59 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr,
> > uint64_t value,
> >  	igt_assert_eq(__xe_wait_ufence(fd, addr, value, exec_queue,
> > &timeout), 0);
> >  	return timeout;
> >  }
> > +
> > +int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range=
,
> > +		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t
> > policy) {
> > +	struct drm_xe_madvise madvise =3D {};
> > +
> > +	madvise.extensions =3D ext;
> > +	madvise.vm_id =3D vm;
> > +	madvise.start =3D addr;
> > +	madvise.range =3D range;
> > +
> > +	if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
> > +		madvise.type =3D DRM_XE_MEM_RANGE_ATTR_ATOMIC;
> > +		madvise.atomic.val =3D op_val;
> > +	} else if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
> > +		madvise.type =3D
> > DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC;
> > +		madvise.preferred_mem_loc.devmem_fd =3D op_val;
> > +		madvise.preferred_mem_loc.migration_policy =3D policy;
> > +		igt_debug("madvise.preferred_mem_loc.devmem_fd =3D
> > %d\n",
> > +			  madvise.preferred_mem_loc.devmem_fd);
> > +	} else if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT) {
> > +		madvise.type =3D DRM_XE_MEM_RANGE_ATTR_PAT;
> > +		madvise.pat_index.val =3D op_val;
> > +	} else {
> > +		igt_warn("Unknown attribute\n");
> > +		return -EINVAL;
> > +	}
> > +
> Uses a switch for clarity and extensibility
> Initialize the struct with designated initializers. "Please refer ___xe_v=
m_bind"
> __xe_vm_bind initializes struct drm_xe_vm_bind and struct drm_xe_vm_bind
> doesn't deal with different type of attributes
> The struct drm_xe_madvise have different type of attributes like preferre=
d loc,
> atomic hence have different members. So structure
> Member initialization is different in this case

Please use space on replay to differentiate=20

We can assign the remaining members like below, and type can be maintained =
in switch case.
can you please check if this works=20
---------------------------------------------------------------------------=
-------------
    struct drm_xe_madvise madvise =3D {
        .extensions =3D ext,
        .vm_id =3D vm,
        .start =3D addr,
        .range =3D range,
    };
    switch (type) {
    case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
        madvise.type =3D DRM_XE_MEM_RANGE_ATTR_ATOMIC;
        madvise.atomic.val =3D op_val;
        break;
............. add here rest of the cases -----------
---------------------------------------------------------------------------=
-----------------
Pravalika

> > +	if (igt_ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise))
> > +		return -errno;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_vm_madvise:
> > + * @fd: xe device fd
> > + * @vm: vm_id of the virtual range
> > + * @addr: start of the virtual address range
> > + * @range: size of the virtual address range
> > + * @ext: Pointer to the first extension struct, if any
> > + * @type: type of attribute
> > + * @op_val: fd/atomic value/pat index, depending upon type of
> > +operation
> > + * @policy: Page migration policy
> > + *
> > + * Function initializes different members of struct drm_xe_madvise
> > +and calls
> > + * MADVISE IOCTL .
> > + *
> > + * Returns 0 if success and asserts otherwise.
> > + */
> > +int xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> > +		  uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)
> > {
> > +	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type,
> > op_val, policy), 0);
> > +	return 0;
> > +}
> > diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index
> > 6302d1a7d..a5996cf65
> > 100644
> > --- a/lib/xe/xe_ioctl.h
> > +++ b/lib/xe/xe_ioctl.h
> > @@ -99,5 +99,8 @@ int __xe_wait_ufence(int fd, uint64_t *addr,
> > uint64_t value,
> >  		     uint32_t exec_queue, int64_t *timeout);  int64_t
> > xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> >  		       uint32_t exec_queue, int64_t timeout);
> > -
> > +int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t
> > +range,
> > uint64_t ext,
> > +		    uint32_t type, uint32_t op_val, uint16_t policy);
>=20
> Both functions currently use the same parameters. Are there plans to modi=
fy
> __xe_vm_madvise in the future?
> If not, is there a reason to maintain two separate functions with same
> arguments?
> Idea was to follow calling conventions as other function. E.g
> xe_vm_bind_async() and also ioctl is called from different
> Function for better readability.
>=20
> --Pravalika
> int
> > +xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> > +uint64_t
> > ext,
> > +		  uint32_t type, uint32_t op_val, uint16_t policy);
> >  #endif /* XE_IOCTL_H */
> > --
> > 2.43.0

