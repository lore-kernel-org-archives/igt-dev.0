Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE50AC021B2
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 23:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804BA10E1DA;
	Thu, 20 Feb 2025 23:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzFy5DHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFB910E1DA
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 23:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740094169; x=1771630169;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/inqvpYbXRu0JqdciS/Ll1CZUVT++3w7hL3I+zMf+n4=;
 b=TzFy5DHKRDKr+Jua2T0lY70JMxB0xxFQbcd8otNA7byBzznrvFkp2zoC
 fN1l2Y2mdv0y4Tsq36cDZy4CrexfUpDhVobYVlNwbfMQLRaTlxmmlMYjJ
 kJylLT62FB7v+8JZEI9DBRn5Sks3O+rVSCSnYjjtoFkWoBT219JZ4T6o3
 /2CdyVE6Bsb+GCJ5HLruMdwbWn0q8zkUubFqECVXCI4e5jqjbLLQvFF9F
 HYqkng3yaja/VbqR2crFpOkyij6TX7drWA43Snr/zO1EKlk7qtSqYGM+a
 5mKh/nCSI6vY7hZNY8N74On0SyYfBz2gD0HeMRCxU4cLXemZ/pqGdI4tx A==;
X-CSE-ConnectionGUID: GG2gMuJfQXuxhSrWNuFKkQ==
X-CSE-MsgGUID: RWEcpfCOTIKYZp6cMqEh+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44682416"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="44682416"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 15:29:29 -0800
X-CSE-ConnectionGUID: wx4llEX8Qh2+rC0tBeGplQ==
X-CSE-MsgGUID: kiECAVWtQuKgkO6I+kuVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120435971"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 15:29:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 15:29:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 15:29:27 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 15:29:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJdcIwmQL8++Sp41AfzkMNA5QgmoPMF1DTZ6rKKk8Da1wYv5/8tOAi/Z9Hfec6OQmrvBg9HtiXRya4axrbyFEiqoKL6rASMMCd5P20nlAcRkVa7ELf/Y9XmqvmOOAYRaZ029KVs2Y5bHSs+SCAwSkAIxfPXpHRAprgN5Jj5NCKOiBuT+vRDwVRqBu1NpfyAcClsLE/1YYCxg3o7/KcxwExwZzM6LUrNvakczo0tbxamohAMlM+gfeO6GCbAXmU1qb77oawaY7hxBXKRuJbKqRey7XJZ7KUivL+DWTTCO/LZMKkS9VxNm9/118Puzt5cD58kSNbHLahQMccUXaYzKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y826ScBOtRdbVegtncNN3cCpRNNZag2/s9YyODcs+O4=;
 b=y9qUdDmxlnpgEkbLHU/2zCPRduta071t3eviY+eitx6yMlfKnyW+eKsT77PDxMIX74XrtM5ZMlJ7pvsbw7y7uwRjLQyOR4tecAPnX46mliLLskn3Xrv/9ACLsu9+EMhbNYaiZMNdBrO4Z4KWBCXjT7GosMzQ4jw0sdZBHtA6E5iIGWnAkcP8xcdvgRgxZoRzxUTqQbVDT2ChC4jBTF0GhHLiO6PyrZJADGNT+zH88GaTYQQmYSsJ9kYv3vaMu8oRCW2IWoi9IrduHsxt88Qy2WX58U4BLF+QqwRIb214nHwUPBFt0vaMYTkLOVW1MTjE02fL/HaI9cjxHEPuK1BmyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 by PH0PR11MB5208.namprd11.prod.outlook.com (2603:10b6:510:3b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 23:29:19 +0000
Received: from MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf]) by MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf%5]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 23:29:19 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [i-g-t v3 2/4] lib/xe/xe_util: Introduce helper functions
Thread-Topic: [i-g-t v3 2/4] lib/xe/xe_util: Introduce helper functions
Thread-Index: AQHbg2c/B/FsUI/E80KBz4dzg37PbbNQzR4w
Date: Thu, 20 Feb 2025 23:29:18 +0000
Message-ID: <MN2PR11MB4728C8396B47E6C6A3F2765B92C42@MN2PR11MB4728.namprd11.prod.outlook.com>
References: <20250218235755.360264-1-oak.zeng@intel.com>
 <20250218235755.360264-3-oak.zeng@intel.com>
 <20250220071513.m2ciqo4a36wdjhdy@zkempczy-mobl2>
In-Reply-To: <20250220071513.m2ciqo4a36wdjhdy@zkempczy-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4728:EE_|PH0PR11MB5208:EE_
x-ms-office365-filtering-correlation-id: 4565ff85-67ba-45ae-0cac-08dd520665f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?WMAxzPBwin+4I9YdIvo5dcgwrvSaeGocDlIS9GHfrqVTekJsCoPli/Kc2HNo?=
 =?us-ascii?Q?zAUu1K0MxVOjojmwZgOHsDM9zxU6LhnQ4vn+OR/7lT8D4viHqrUwJ0cYmDoW?=
 =?us-ascii?Q?Qef/7tTgs3GriTqoMukY4DmA1NX9jA9u7DD1WdAeZsvCFQsHfcsUlE/Fjak9?=
 =?us-ascii?Q?l1mEOcRK80D9IiQoODKRx3zrd9liINY5BtfSshrqraj2gr+gRyWBvvDrU6f2?=
 =?us-ascii?Q?vz/M+2UpmGi8yL2JJslwhyZPrT7j3o+P1wpeuiO/923LqrlK0YsFk92pjWuk?=
 =?us-ascii?Q?+wzvnHrXyH6ckREQR4XIlEyBWrq6IiU61bKSinyX6KeTbYsvWWM0lMcJ5nuG?=
 =?us-ascii?Q?3URKUxrymIpK8IR52tz2N7OM71epWJ6C4LfWM27DMqA5LQBqnDyOoMapIW0s?=
 =?us-ascii?Q?AIUQIju84SYvwcw5QO7RYS5rHt8OCd145M9P2NRw5ICpfJ2mLwvZw8214pn2?=
 =?us-ascii?Q?vx9mDIlJgj4nrqAdmQ2haBEtXh44nXW/wEJdtiYIC8V1qeMJoUpuEumBMNUw?=
 =?us-ascii?Q?+A8ft/OzEVJHnyWedG2V/rBkadWdcXYCWPpriUmAgFlruPChgoHw72YbL3BI?=
 =?us-ascii?Q?aVIH5UGq+L3KLhPGcvenHkBIMQAuYcbmqq0M2FXinK8OT7525G/Z1Dq0ok7Z?=
 =?us-ascii?Q?As3AfHtMTqeIJ+YPu6PAxtSZqJdn06YZEbTdQYF9WUiANQGskooXDOTXyguN?=
 =?us-ascii?Q?Q2pnpriubtZYhf1pYzRz7kFuL5bJ0e1UryrbBMRmRij2tHdMFvO2ZHvjJ8jV?=
 =?us-ascii?Q?zJyeldWzG0ndH/ggZ1K1JleTcoERKGzMPOQsnjXGv0TkiHQS8gdv6IGl8+ua?=
 =?us-ascii?Q?1iHbKQSW50YzOb7FDZKkibXg5iQwvwn5My9E61r56RS7wf8ovhbUHkXyPEXI?=
 =?us-ascii?Q?web+u8Sir1fJuN85yq8rZEj/4aXAV+WkofTMCTUS3NdHuhX2cfwtrCA4Rm2n?=
 =?us-ascii?Q?URa2UminUfn2Pvh+CvdoPFXpMXIoPAFgvaA783LUt9USBbcm+QKazwtMxRII?=
 =?us-ascii?Q?DKK9jxVSIPjZHJJ7VGw2vGgzr7ZcKXiq7qnlqJOxoPpU3vljjR1H0F3Ajfkn?=
 =?us-ascii?Q?+xzVv6/3KMFlKbQo1ADMN083IRiWDPw2H9WcSjndqUpTWvjcFpuBlH3uZRhR?=
 =?us-ascii?Q?DW40cKuB4NcjgLV1B/JMgyKl0N2xSG7ij/vJf5fBMuNsxG3JNaBJBUAnt2rf?=
 =?us-ascii?Q?6UFiGfp0m6PaF9zdoUVpmAXX7gSAAxJHg2ezRG+93l+7JCCZ+/YYj6hykceI?=
 =?us-ascii?Q?inGcG8gx/hNVZvJ+fyh95mnZo2AH9t8N22PF8wevHn6vRWdtuhfD3ytA2Hhl?=
 =?us-ascii?Q?Wcta7knkSOXWTaIQ8vDujpl7Cq/yAb6ogIdm5PrqdaOsORDVQCAZ4vVFG3mY?=
 =?us-ascii?Q?xZd6ov84XJUypqECauGiH19dBVlJF92kHLRQ/6Nbd+aQXZVjawl0X0ycOpGe?=
 =?us-ascii?Q?18vrTKaZl3tuUeb7U5/fcnQgawQhJuR6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hu1dmYns60TYwBq1W2m9QYhqaBvblidkXq+6ZddpBz3ATIWjLqPwXPJcCxk3?=
 =?us-ascii?Q?4skY3tPtOfBSbX/1vA4b6ThH29TwTMvu5nLs8ZzdtuNHRoHrE8/MqmXHBzhX?=
 =?us-ascii?Q?U1kJQrEDFfMORvI7+n9rh/GHKm2+D5x16hIIZe2+n1Ps1CygrZEzzrNi+Rt2?=
 =?us-ascii?Q?Cre8GuohVh4QjXfWcn8aKT4//43Q/sv2Hk6/cg7ftJRkECMcTTFOCUuD2Kop?=
 =?us-ascii?Q?+n6lTVp4VaKk41QMmNgXDFIpX5MQ0fnM1yMRZ97nWRioypY7rBRp2ke1HyN5?=
 =?us-ascii?Q?OV7EqvLlTtePXoyaBlqO+CJ/ldBEB4XWcW6LuDm27o/HgGDQF8FG+42EvgxD?=
 =?us-ascii?Q?kPgcwX0QFi9en9/8kQSyqpFBlHoxtoJ1lfsN3ZHkLZDFmG+76WDj7RSCbmFv?=
 =?us-ascii?Q?fRPzWvzAAL3eUihfnPaG6Xil8D/RMQVq2A+2D3p9zk6t17GE8gL0hSStsc5O?=
 =?us-ascii?Q?acE4Dnqja51IZO9gkPvOKmUISdeEt24dK0o7yk10wC1VwIG7dD8HulLVluGz?=
 =?us-ascii?Q?Ar1tp0Ct5LWPXbr6NEH5X2PJJacCkkyp3i0ZwGTZLh8uvpTcpGFPzNg4rrpm?=
 =?us-ascii?Q?wVP9a/EKqWXKTpHrDjrqI9WpFhCBm+ZPZCb/GOAk8SPPL9nOxF1mpz3paVZ7?=
 =?us-ascii?Q?2gQB691b4ZkEOVUiZIZTYiXLyH7ogACWRkwUEMsHx1uc3CZQqdr24BFbVkyr?=
 =?us-ascii?Q?y48i7/J4YHGOpHwe0U9/6CXKW7z1X5pB6OwqGFizyqK9WfJlC1Y0cXbGMfp2?=
 =?us-ascii?Q?Ws2b4sm8MwLKPRQb+v9ZFdo1ImCCuQTgDxB7eeigFDusvE9VC00DlEukIdPd?=
 =?us-ascii?Q?aA6+JYRy0aMk634Kz9ATpNxfTCatPMHmsMcMDPDZ+u272cFPSa5K6V934OHX?=
 =?us-ascii?Q?NUMqO65Nqi0zjH3ovb59Qn334gDC/CoPjXK9noUFj4E8RcVqMZnrXH9EBPin?=
 =?us-ascii?Q?Q7k6qIGzunm01FsGpN4pPVQ9FqJ5MxaZ4reXJZkLL/ystgunqB1KrNCZD93d?=
 =?us-ascii?Q?8FEtUQwUtZC4e91BM0Mjfvu5b7wEO8+y/+ks3aLWqtyzjPkVSQBksglFTprK?=
 =?us-ascii?Q?OT9TCBNVIAvpwA4oMBFTUOaEOpp+Yoi8/NonNmK9SKpQixLh6O950kaPC8ok?=
 =?us-ascii?Q?lSm9hbbPotpkRkCTWE1Ls/Il4M5UD3ZF5mPaqg34yDsMgXwh9h3LxuiGdoM3?=
 =?us-ascii?Q?Fnp5hZ73vxPoYyZAyZp/n+X1ptPz9aPBKS6l03BAkLswOMenSyZgGRWfZvJF?=
 =?us-ascii?Q?otJK+MhFNYcyvQF+bKuN6emYnk5beGviozU3xCKJ0UXV9o0hwmbEjQL9BuYe?=
 =?us-ascii?Q?IwjMPw0XZTxQhUDVOzWVKZBhbMIMhcTl9j7rTDBWfMeMOqA+M2W3lFb0U17r?=
 =?us-ascii?Q?Nmc3gWMH0ijgezA3IFCWBfkU9rSz++Cq4sBWD77w+4Nubxa9ZKSN7rP9pCHJ?=
 =?us-ascii?Q?YgTW3hM3ysj7EKITDc3OwMJoeF/wgPeBtrL4sZc+zJ1ElNoPGGe+Pk31zdSB?=
 =?us-ascii?Q?N/j0DyqIGtAT9rVg6fjzwoet0byrLKKVGLudgBxxgEB/iDWtJNlWAe7Wl5e3?=
 =?us-ascii?Q?0lpL712f4V/Ia0NN9MI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4565ff85-67ba-45ae-0cac-08dd520665f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 23:29:19.0122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uWrawz8B8ATtaAMeN3vmR2SvcTCaYlqbFiS2y1A2sxgvDjEFCMfA4orTxidq/fKHE8FfocXhGmQZb6ko0Gax5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5208
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
> From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> Sent: February 20, 2025 2:15 AM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Thomas.Hellstrom@linux.intel.com;
> Brost, Matthew <matthew.brost@intel.com>; Konieczny, Kamil
> <kamil.konieczny@intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; Heikkila, Juha-pekka <juha-
> pekka.heikkila@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [i-g-t v3 2/4] lib/xe/xe_util: Introduce helper functions
>=20
> On Tue, Feb 18, 2025 at 06:57:53PM -0500, Oak Zeng wrote:
> > From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> >
> > Introduce helper functions for buffer creation, binding,
> > destruction and command submission etc. With those helpers,
> > writing a xe igt test will be much easier, which will be
> > showed in a coming example.
> >
> > v2: use to_user_pointer to cast a pointer (Kamil)
> >     s/insert_store/xe_insert_store (Kamil)
> >     s/cmdbuf_fill_func_t/xe_cmdbuf_fill_func_t (Kamil)
> > v3: refactor command buffer fill interface (Zbigniew)
> >
> > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  lib/xe/xe_util.c | 239
> +++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/xe/xe_util.h |  47 ++++++++++
> >  2 files changed, 286 insertions(+)
> >
> > diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> > index 06b378ce0..891316ecd 100644
> > --- a/lib/xe/xe_util.c
> > +++ b/lib/xe/xe_util.c
> > @@ -13,6 +13,245 @@
> >  #include "xe/xe_query.h"
> >  #include "xe/xe_util.h"
> >
> > +/**
> > + * xe_cmdbuf_exec_ufence_gpuva:
> > + * @cmdbuf Pointer to the xe_cmdbuf structure representing the
> command buffer.
> > + *
> > + * Returns the GPU virtual address of the execution user fence
> located at the
> > + * end of the command buffer.
> > + */
> > +static uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_cmdbuf
> *cmdbuf)
> > +{
> > +	/* the last 8 bytes of the cmd buffer is used as ufence */
> > +	return cmdbuf->buf.gpu_addr + cmdbuf->buf.size -
> UFENCE_LENGTH;
>=20
> I think instead of hardcoding 8 as length of the fence you should use
> sizeof() of timeline_value from drm_xe_sync.
>=20
> > +}
> > +
> > +/**
> > + * xe_cmdbuf_exec_ufence_cpuva:
> > + * @cmdbuf Pointer to the xe_cmdbuf structure representing the
> command buffer.
> > + *
> > + * Returns the CPU virtual address of the execution user fence
> located at the
> > + * end of the command buffer.
> > + */
> > +static void *xe_cmdbuf_exec_ufence_cpuva(struct xe_cmdbuf
> *cmdbuf)
> > +{
> > +	/* the last 8 bytes of the cmd buffer is used as ufence */
> > +	return (char *)cmdbuf->buf.cpu_addr + cmdbuf->buf.size -
> UFENCE_LENGTH;
> > +}
> > +
> > +
> > +/**
> > + * __xe_submit_cmd:
> > + * @cmdbuf Pointer to the command buffer structure
> > + *
> > + * Submits a command buffer to the GPU, waits for its completion,
> and verifies
> > + * the user fence value
> > + *
> > + * Return: The result of waiting for the user fence value
> > + */
> > +int64_t __xe_submit_cmd(struct xe_cmdbuf *cmdbuf)
> > +{
> > +	int64_t timeout =3D NSEC_PER_SEC;
> > +	int ret;
> > +
>=20
> You should assert if cmdbuf is null.
>=20
> > +	struct drm_xe_sync sync[1] =3D {
> > +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> > +			.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> > +			.timeline_value =3D USER_FENCE_VALUE,
> > +			.addr =3D
> xe_cmdbuf_exec_ufence_gpuva(cmdbuf),},
> > +	};
> > +	struct drm_xe_exec exec =3D {
> > +		.num_batch_buffer =3D 1,
> > +		.num_syncs =3D 1,
> > +		.syncs =3D to_user_pointer(sync),
> > +		.exec_queue_id =3D cmdbuf->exec_queue,
> > +		.address =3D cmdbuf->buf.gpu_addr,
> > +	};
> > +
> > +	xe_exec(cmdbuf->buf.fd, &exec);
>=20
> This might assert, shouldn't it be sth like:
>=20
> ret =3D __xe_exec(...);
> if (ret)
> 	return ret;
>=20
> xe_submit_cmd() is asserting, so it might assert from both
> reasons - unsuccessful exec or unsuccessful wait.
>=20
> My personal preference is to not assert in underscore functions
> giving caller chance to handle errors. Only exception is to
> checking input parameters.
>=20
> > +	ret =3D __xe_wait_ufence(cmdbuf->buf.fd,
> > +			       (uint64_t
> *)xe_cmdbuf_exec_ufence_cpuva(cmdbuf),
> > +			       USER_FENCE_VALUE, cmdbuf-
> >exec_queue, &timeout);
> > +	/* Reset the fence so the exec ufence can be reused */
> > +	memset((char *)xe_cmdbuf_exec_ufence_cpuva(cmdbuf), 0,
> UFENCE_LENGTH);
>=20
> Cosmetic, please add line before return.
>=20
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_submit_cmd:
> > + * @cmdbuf Pointer to the command buffer structure
> > + *
> > + * Wrapper function to submit a command buffer and assert its
> successful
> > + * execution.
> > + */
> > +void xe_submit_cmd(struct xe_cmdbuf *cmdbuf)
> > +{
> > +	int64_t ret;
> > +
>=20
> Assert if cmdbuf is not null.
>=20
> > +	ret =3D __xe_submit_cmd(cmdbuf);
> > +	igt_assert_eq(ret, 0);
> > +}
> > +
> > +/**
> > + *xe_create_buffer:
> > + * @buffer Pointer to the xe_buf structure containing buffer
> details.
> > + *
> > + * Creates a buffer, maps it to both CPU and GPU address spaces,
> and binds it
> > + * to a virtual memory (VM) space.
> > + */
> > +void xe_create_buffer(struct xe_buf *buffer)
> > +{
> > +	struct drm_xe_sync sync[1] =3D {
> > +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> > +		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> > +		  .timeline_value =3D USER_FENCE_VALUE },
> > +	};
> > +
>=20
> Ditto.
>=20
> This function should check if all necessary fields are set in buffer
> structure before proceed - fd, vm, size, placement.
> Calling this function on not properly initialized buffer likely will
> lead to segfault.

I will check fd, size and placement.

I didn't find a good way to check vm. I assume vm=3D=3D0 is legal.
I will leave vm check for now.

>=20
> > +	buffer->bind_queue =3D xe_bind_exec_queue_create(buffer-
> >fd,
> > +						       buffer->vm, 0);
> > +	buffer->bind_ufence =3D
> aligned_alloc(xe_get_default_alignment(buffer->fd),
> > +					    PAGE_ALIGN_UFENCE);
> > +	sync->addr =3D to_user_pointer(buffer->bind_ufence);
> > +
> > +
>=20
> Unnecessary double newline.
>=20
> > +	/* create and bind the buffer->bo */
> > +	buffer->bo =3D xe_bo_create(buffer->fd, 0, buffer->size,
> > +				  buffer->placement, buffer->flag);
> > +	buffer->cpu_addr =3D xe_bo_map(buffer->fd, buffer->bo,
> buffer->size);
> > +	xe_vm_bind_async(buffer->fd, buffer->vm, buffer-
> >bind_queue,
> > +			 buffer->bo, 0, buffer->gpu_addr,
> > +			 buffer->size, sync, 1);
> > +
> > +	xe_wait_ufence(buffer->fd, buffer->bind_ufence,
> > +		       USER_FENCE_VALUE, buffer->bind_queue,
> NSEC_PER_SEC);
> > +	memset(buffer->bind_ufence, 0, PAGE_ALIGN_UFENCE);
> > +}
> > +
> > +/**
> > + * xe_destroy_buffer:
> > + * @buffer Pointer to the xe_buf structure containing buffer
> details
> > + *
> > + * Destroys a buffer created by xe_create_buffer and releases
> associated
> > + * resources.
> > + */
> > +void xe_destroy_buffer(struct xe_buf *buffer)
> > +{
> > +	struct drm_xe_sync sync[1] =3D {
> > +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> > +		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> > +		  .timeline_value =3D USER_FENCE_VALUE },
> > +	};
>=20
> Assert if buffer is null
>=20
> > +	sync->addr =3D to_user_pointer(buffer->bind_ufence);
> > +
> > +	xe_vm_unbind_async(buffer->fd, buffer->vm, buffer-
> >bind_queue,
> > +			   0, buffer->gpu_addr, buffer->size, sync, 1);
> > +	xe_wait_ufence(buffer->fd, buffer->bind_ufence,
> > +		       USER_FENCE_VALUE, buffer->bind_queue,
> NSEC_PER_SEC);
> > +	memset(buffer->bind_ufence, 0, PAGE_ALIGN_UFENCE);
> > +
> > +	munmap(buffer->cpu_addr, buffer->size);
> > +	gem_close(buffer->fd, buffer->bo);
> > +
> > +	free(buffer->bind_ufence);
> > +	xe_exec_queue_destroy(buffer->fd, buffer->bind_queue);
> > +}
> > +
> > +/**
> > + * xe_cmdbuf_insert_store:
> > + * @cmdbuf: command buffer where commands will be inserted.
> > + * @dst_va Destination virtual address to store the value.
> > + * @val Value to be stored.
> > + *
> > + * Inserts a MI_STORE_DWORD_IMM_GEN4 command into a
> command  buffer, which stores
> > + * an immediate value to a given destination virtual address.
> > + */
> > +void xe_cmdbuf_insert_store(struct xe_cmdbuf *cmdbuf,
> > +			    uint64_t dst_va, uint32_t val)
> > +{
> > +	uint32_t *batch =3D cmdbuf->buf.cpu_addr;
> > +
> > +	igt_assert(!cmdbuf->closed);
>=20
> You may check if cmdbuf->write_index + length of store-dword (4
> dwords).
> As xe_bb_size() adds additional page you won't overwrite memory,
> just
> assert due to lack of space for BBE.

I think the last line of this function serves this purpose.
I will move the assert up.
=20
>=20
> > +
> > +	batch[cmdbuf->write_index++] =3D
> MI_STORE_DWORD_IMM_GEN4;
> > +	batch[cmdbuf->write_index++] =3D dst_va;
> > +	batch[cmdbuf->write_index++] =3D dst_va >> 32;
> > +	batch[cmdbuf->write_index++] =3D val;
> > +
> > +	/* Leaves at least one dword for MI_BATCH_BUFFER_END */
> > +	igt_assert(cmdbuf->write_index <=3D cmdbuf-
> >cmd_size/sizeof(uint32_t) - 2);
> > +}
> > +
> > +/**
> > + * xe_create_cmdbuf:
> > + * @cmdbuf Pointer to the xe_cmdbuf structure representing the
> command buffer.
> > + * @eci Pointer to the engine class instance for execution.
> > + *
> > + * Creates a command buffer, fills it with commands using the
> provided fill
> > + * function, and sets up the execution queue for submission.
> > + */
> > +void xe_create_cmdbuf(struct xe_cmdbuf *cmdbuf,
> > +		       struct drm_xe_engine_class_instance *eci)
> > +{
> > +	struct xe_buf *buf =3D &cmdbuf->buf;
> > +	/*
> > +	 * make some room for a exec_ufence, which will be used to
> sync the
> > +	 * submission of this command....
> > +	 */
> > +	buf->size =3D xe_bb_size(buf->fd,
> > +			       cmdbuf->cmd_size +
> PAGE_ALIGN_UFENCE);
> > +	xe_create_buffer(buf);
> > +	cmdbuf->exec_queue =3D xe_exec_queue_create(buf->fd,
> buf->vm, eci, 0);
> > +	cmdbuf->write_index =3D 0;
> > +	cmdbuf->closed =3D false;
> > +}
> > +
> > +/**
> > + * xe_fill_cmdbuf:
> > + * @cmdbuf Pointer to the xe_cmdbuf structure representing the
> command buffer.
> > + * @fill_func Pointer to the function that fills the command buffer.
> > + * @dst_gpu_va Destination GPU virtual address to store the value.
> > + * @val Value to be stored.
> > + *
> > + * Fills the command buffer with commands using the provided fill
> function.
> > + */
> > +void xe_fill_cmdbuf(struct xe_cmdbuf *cmdbuf,
> > +			xe_cmdbuf_fill_func_t fill_func,
> > +			uint64_t dst_gpu_va, uint32_t val)
> > +{
> > +	igt_assert(!cmdbuf->closed);
> > +	fill_func(cmdbuf, dst_gpu_va, val);
>=20
> I don't like this function and I vote for it's removal. You should
> just operate directly on cmdbuf (it already have everything you need).
> xe_cmdbuf_fill_func_t is not generic (limited to gpu_va/val) so what's
> for defining it?
>=20
> So instead:
>=20
> 	xe_create_cmdbuf(&cmdbuf, eci);
> 	xe_fill_cmdbuf(&cmdbuf, xe_cmdbuf_insert_store,
> 		       dst_buf.gpu_addr, 0xc0ffee);
> 	xe_close_cmdbuf(&cmdbuf);
> 	xe_submit_cmd(&cmdbuf);
>=20
> I would imagine:
>=20
> 	xe_create_cmdbuf(&cmdbuf, eci);
> 	xe_cmdbuf_insert_store(&cmdbuf, dst_buf.gpu_addr,
> 0xc0ffee);
> 	xe_cmdbuf_insert_bbe(&cmdbuf, ...)
> 	xe_submit_cmd(&cmdbuf);
>=20
> Any additional commands might be added by generic calls:
>=20
> 	xe_cmdbuf_insert_dw(&cmdbuf, 0xc0de);
> 	xe_cmdbuf_insert_dw(&cmdbuf, 0xc0de2);
>=20
> You may even drop xe_cmdbuf_insert_bbe() by:
>=20
> 	xe_cmdbuf_insert_dw(&cmdbuf, MI_BATCH_BUFFER_END);
>=20

It is a fair argument. I will do the interface you laid out above.
>=20
> > +}
> > +
> > +/**
> > + * xe_close_cmdbuf:
> > + * @cmdbuf command buffer to be closed.
> > + *
> > + * After this function is called, no more commands can be added to
> the
> > + * command buffer.
> > + */
> > +void xe_close_cmdbuf(struct xe_cmdbuf *cmdbuf)
> > +{
> > +	uint32_t *batch =3D cmdbuf->buf.cpu_addr;
> > +
> > +	igt_assert(!cmdbuf->closed);
> > +	batch[cmdbuf->write_index++] =3D MI_BATCH_BUFFER_END;
> > +	cmdbuf->closed =3D true;
>=20
> Please drop this function. You don't need to keep any logic
> regarding if buffer has bbe or not.

Will do.

Oak
>=20
> --
> Zbigniew
>=20
> > +	igt_assert(cmdbuf->write_index <=3D cmdbuf-
> >cmd_size/sizeof(uint32_t) - 1);
> > +}
> > +
> > +/**
> > + * xe_destroy_cmdbuf:
> > + * @cmdbuf Pointer to the xe_buf structure representing the
> command buffer.
> > + *
> > + * Destroys a command buffer created by xe_create_cmdbuf and
> releases
> > + * associated resources.
> > + */
> > +void xe_destroy_cmdbuf(struct xe_cmdbuf *cmdbuf)
> > +{
> > +	xe_exec_queue_destroy(cmdbuf->buf.fd, cmdbuf-
> >exec_queue);
> > +	xe_destroy_buffer(&cmdbuf->buf);
> > +}
> > +
> >  static bool __region_belongs_to_regions_type(struct
> drm_xe_mem_region *region,
> >  					     uint32_t
> *mem_regions_type,
> >  					     int num_regions)
> > diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> > index 06ebd3c2a..26321f957 100644
> > --- a/lib/xe/xe_util.h
> > +++ b/lib/xe/xe_util.h
> > @@ -14,6 +14,53 @@
> >
> >  #include "xe_query.h"
> >
> > +#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
> > +#define PAGE_ALIGN_UFENCE	4096
> > +#define UFENCE_LENGTH		8
> > +
> > +struct xe_buf {
> > +	void *cpu_addr;
> > +	uint64_t gpu_addr;
> > +	/*the user fence used to vm bind this buffer*/
> > +	uint64_t *bind_ufence;
> > +	uint64_t size;
> > +	uint32_t flag;
> > +	uint32_t vm;
> > +	uint32_t bo;
> > +	uint32_t placement;
> > +	uint32_t bind_queue;
> > +	int fd;
> > +	bool is_userptr;
> > +};
> > +
> > +struct xe_cmdbuf {
> > +	struct xe_buf buf;
> > +	/* command size in bytes, not including exec_ufence */
> > +	uint64_t cmd_size;
> > +	uint32_t exec_queue;
> > +	/* Dword index to writ to command buffer */
> > +	uint32_t write_index;
> > +	bool closed;
> > +};
> > +
> > +typedef void (*xe_cmdbuf_fill_func_t) (struct xe_cmdbuf
> *cmdbuf,
> > +				       uint64_t dst_gpu_va, uint32_t val);
> > +
> > +void xe_create_buffer(struct xe_buf *buffer);
> > +void xe_destroy_buffer(struct xe_buf *buffer);
> > +
> > +void xe_create_cmdbuf(struct xe_cmdbuf *cmdbuf,
> > +		      struct drm_xe_engine_class_instance *eci);
> > +void xe_fill_cmdbuf(struct xe_cmdbuf *cmdbuf,
> > +			xe_cmdbuf_fill_func_t fill_func,
> > +			uint64_t dst_gpu_va, uint32_t val);
> > +void xe_close_cmdbuf(struct xe_cmdbuf *cmdbuf);
> > +void xe_cmdbuf_insert_store(struct xe_cmdbuf *cmdbuf,
> uint64_t dst_va,
> > +			    uint32_t val);
> > +void xe_submit_cmd(struct xe_cmdbuf *cmdbuf);
> > +int64_t __xe_submit_cmd(struct xe_cmdbuf *cmdbuf);
> > +void xe_destroy_cmdbuf(struct xe_cmdbuf *cmdbuf);
> > +
> >  #define XE_IS_SYSMEM_MEMORY_REGION(fd, region) \
> >  	(xe_region_class(fd, region) =3D=3D
> DRM_XE_MEM_REGION_CLASS_SYSMEM)
> >  #define XE_IS_VRAM_MEMORY_REGION(fd, region) \
> > --
> > 2.26.3
> >
