Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D82D2D8FA
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 11:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D6710E537;
	Tue, 27 Jan 2026 11:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSuCkX82";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00AA10E537
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 11:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769511842; x=1801047842;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gAyNfji1kloWOsgbFrPvsfM5ef0Fs0UzClMHYjCBWeU=;
 b=iSuCkX82jL1S/7m+ghVmS8UskKGS/hXa/A4zVntwyQW+lZAC9xbUEf/0
 s/FYEU1ul1bV3aJ1ks3NMAsqO1IXAeKyX9kXxHX7Z6echNSFGwNh2krDs
 20TYI5yCzX5t3akRNJ4g1lVCJv2e1frIDCnBxAHGMlpL0eu/fp7xS9FIS
 av4ZPbGfAmuk6GS2X5j9cfM4zNjy3d19XNpq3FpP2g22rZOVpVrt1E8q0
 sDbT0isDmGmrZBH+x6G/BCHANO73tcPBE13GatWFasLRqMN8Ekkul4MNG
 RdRbtnGR3Mb8CV/kg/XN6SKxGrpkxjI02oiPy5nXxAIVqcNz4SEb68E49 A==;
X-CSE-ConnectionGUID: 1JjLchFTTrOmzBASVzsUtQ==
X-CSE-MsgGUID: jw95drYiS6GGUH8YVZWokg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96168785"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="96168785"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:04:01 -0800
X-CSE-ConnectionGUID: vGtm/SLuR4CPq4P1MJjNwg==
X-CSE-MsgGUID: 6AaVZp1ySDyqo6pXn6ybdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207740715"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:04:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 03:04:00 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 03:04:00 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 03:04:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpdT9KemRxSYqBN7gAIL/AUKDiZeso0cOQGKd+bQ1J7XIuLbD+re7AQtAfegGFuugHFB8+lanGtOw0qq6tbI31xJeDnANRb/rBbRRNpH1FlRgRXCW7Y+J0pqsSLNx0/xiyiawdj+A9RktuC7ZrHQzG84umw3MTB0pfzFlKphLwsUWHolPN5ZZl/lmbuTxWilNeglx6zlZN/BJ4GJ3r6VaD8wwGaKX+Epqf7UFKxS0lwOJYmEBiTfEWOYzP3KD28cHKp4/77uaf+TECdQfGLItkWG/YWE0a1O6mgmfuEJVGi43XwVWYITsZ570NyeITEBGObjqHYf5up7aCuZZkyo3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hEnPrlWeNuiX/OAu6hcVGjpzFYTVo7u0Phblv+oTvU=;
 b=M++Vzuv+uhKa2y2Nxsib6punnPgsgdFeYJqF/U/q0wpD3+THetC4PDOnx9TjuEkbmCrBp2/Brg8yobBhpnQmxwJG09ytsXK3aPbxWTOSFHBdNSnGLIMC1yzXXjkoTFFmFQxtYfdFvY2/ferti56erzpW3JBHFaQW8EHp+1rlGU7CtpNQXYF6zQk+jsyBC4BkgCbS3E8CuFePLCuQN+1glbi9GrR9RBq+woxq/paVYMl88IR6ZF9m7dOm5nqEbJMId5f8M+8nXBzx6uKkRU7QL0eBOGLty/kx5N3GylpV4z+csbZZqkQI+6ReDSJb4/77JbkSboHXyFIufhsVbmaUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MN0PR11MB6230.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 11:03:52 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 11:03:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v9 08/11] tools/intel_hdcp: Interactive keypress
 thread for menu
Thread-Topic: [PATCH i-g-t v9 08/11] tools/intel_hdcp: Interactive keypress
 thread for menu
Thread-Index: AQHcj3HsOdLX/+1K/UCrB0FplJJN9bVl2jzQ
Date: Tue, 27 Jan 2026 11:03:52 +0000
Message-ID: <DM3PPF208195D8D820146F95A2402FCCE42E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260127094257.572736-1-santhosh.reddy.guddati@intel.com>
 <20260127094257.572736-9-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260127094257.572736-9-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MN0PR11MB6230:EE_
x-ms-office365-filtering-correlation-id: d120456a-9fff-43a2-084e-08de5d93c17a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?xRjAG03A5zzycAusvwXvToWnyolOJnq04tUmTvzoNgL1oK/J5AQ8+1H2pnKI?=
 =?us-ascii?Q?T47PO/3EOmqpHoaBb0VEnsfdbXtamZZvuvuzGlWpF6/ZhQbZZPfmLZAMUpFO?=
 =?us-ascii?Q?LGc+iMMDo8hQ9VVOFgN5HoWZP0c20+SeANaRKZwTEFCHC+4sRCvcL6CDo/bu?=
 =?us-ascii?Q?cw1vBJOS85dRN2I1Yh9A1jRd2zfRbr1VXOFuwellp4hUaxg4nbHmNVnSWXSU?=
 =?us-ascii?Q?iEiV1958SdTe/IzZKBf0CtLvhHFKPvsoJJZHgGr/WS0ImfHcRLXGM4kZu8MC?=
 =?us-ascii?Q?me6qFS1hQoz1KgDjAFaX7CU1BDB7bf9WmP0HNqysafRerSxCSPV/qwWbvhNJ?=
 =?us-ascii?Q?zo/oIcfnCOLxZNfHcEcecUw2L/CXLPeHHNIgaLhWCgZJve0kn/C5x+8uTNUz?=
 =?us-ascii?Q?I47GEfcMfXD57Vn9i3shh5Wz9Dc4vUwOE3bJq7oZzF2LO3V4mDRcLbeFxBgO?=
 =?us-ascii?Q?/+YAxRUl/l2gukJjhu8Kq0CKoZDBvEHuuSp1vVt4LQEU/As2wrlyQm+EIF7g?=
 =?us-ascii?Q?ffd3VCVrewNktgF96CxyWzTUzV6PTAy0VjDGee2h69H7IY2TRtPJURuPjg2e?=
 =?us-ascii?Q?P4ZfwSWsn2TCleRfDFwXqtGcI9fATf2HIzpjOcdfKYKvoIuhPDlWbYgFYOmC?=
 =?us-ascii?Q?F8OhGFKzbwaV4Qw+G29BbXLQXgu7ijNRsSs/D1lZd3ZrhmJWBIY4Mket2XPl?=
 =?us-ascii?Q?mS+SGZdWcaaKHtrdiQ9Gso2p1Mar0WbLJaz/8stxmDiBxOZLsjLaHn+6obQm?=
 =?us-ascii?Q?lkdc0iy8GvIwJjO537qGhIXLp4IVwQTYdRIQTRKrbuJ96tXs0TYSWLiju2e+?=
 =?us-ascii?Q?EagWdhjV18NEJ2Qja7GG/2WF9ZCIGmfvZZC+goasV1UtP+D/5bN15YxXRkv5?=
 =?us-ascii?Q?Wm5NzIf2A8ejZcwFiyIH2H2tbT6TqzAA161ptounVyi57Vj4zwBsr4LhFajz?=
 =?us-ascii?Q?oSrigEI7OMIIuVVu7xLVMP4xL80TiAjWEOc55memHgBBhlH8zBd8F4JZCz9f?=
 =?us-ascii?Q?MiYbrfBLGNPoGe/FHECeuNaSzeI+fYli9dvr1xKT9D30h+b+UublTVlPBD9t?=
 =?us-ascii?Q?X3ATSHgqunfz37/QUx7/uCfo08tJCoQy02I7JnySQtOkWDxkUdAqi2+i1A8y?=
 =?us-ascii?Q?19ZrOoE1WHT5E56au6SxRJP7oE+J8fbScC4dO3Ec3HEOMbxFg5PmQWZgQAk5?=
 =?us-ascii?Q?2ULxEXefpAxzbF6oqbAaB9lQuLPan2OI12FfHYAH9za5K/nR/jjxVmnhVq3m?=
 =?us-ascii?Q?nvEUMDwlgIbvSzapYM+4jmltybU6QXTYjW/BnrZV0jp3HZhCUb7jITuZZ3/j?=
 =?us-ascii?Q?AUYIGhNjxYm/XyPK6lOpGxMFY4LKUcA/CfgjH/iwQPz6vTWx4pOB/TlNIo6A?=
 =?us-ascii?Q?K7ud0e/s5cW/9f5I8Jfv6zAiurp4GuNIMn45wU5D1WMobM5DlNGRNG7YKFqS?=
 =?us-ascii?Q?hrku6auKVUyabWWvI67F1RWU1fBhPHDJjyTaZHuISDngBb0reQp8BQe3z+C0?=
 =?us-ascii?Q?lQIab0m5Qdz5JupgprP5xrS0Zb5/Wqe8DcBFn705ibxc/X36CoMa8Kw0ft4u?=
 =?us-ascii?Q?MB7HvYfimHQ4SifIxyqaXXI6pz5hv5db3QeRhFvOay7twYi0WFj79ZYlLzBu?=
 =?us-ascii?Q?Go/v3rWtDKa7cowmEP9MWHE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cm1Fcje17k1pDQxovU/o9YUlgywsDHq/MnTuyE1h2/KsTVQWr3CEUG3rb1Tl?=
 =?us-ascii?Q?OCF0z10EVYUFXXJZ96/NlCLYRZTgVtqwSvJItHnqegAMnbEYMslvaF6aL2Q9?=
 =?us-ascii?Q?2BCX9nqkUAczwP5Iy8gbn/YZraW9ny9Jn2Vu1Gl6tNS3iHdxZ2sMg2KmD88v?=
 =?us-ascii?Q?WId8CNFrRW38lE0pMStT9iSiyPKSDkw6UKX0NTrb951BfwlZuDSBY9ifOJch?=
 =?us-ascii?Q?5jG1v2fgqS7clYqT6zbSO++3srPHhpEP5RRkotiEyW2Mtf0KYyxWolUntr/m?=
 =?us-ascii?Q?tyfZs/xdDG16LyLOT3qvNe8msvcTyuDikJUDvujBAEx3+MrW7YwgqUB0ZJUm?=
 =?us-ascii?Q?14etRl/j+W3ibUUciJBpdTECsi/EmkrPkZ+NoeNi87jZGmWEeRRZsS5gHeZv?=
 =?us-ascii?Q?nqvv8/Kogp/Y+wujNB6ijOt6NHCF1OSOAfgz1iJIM9Msfa5TE8z/Uv+0hKhE?=
 =?us-ascii?Q?d6bMXGOUx8U1ANDNF4h8QfkSI9M2kSTMay95l5/ji9wwOGfiL0kZYUTonZLM?=
 =?us-ascii?Q?FIJyNp1FdbSmXdbWekQMC0G4LrJ105/LGotZzslXkWtrNhAjssp9QEBE3K/W?=
 =?us-ascii?Q?p80vm6oL9S1Ij0aHGGGxRfBxKmHxkUy+8GZOwfwTNdzvFg0j72iBHEMAw0IU?=
 =?us-ascii?Q?bZaC8k5DjYoJb4FD2Us10xgfS+EvkWFm4Em0mfH2bB0NU3axuwZ/DpwneLIZ?=
 =?us-ascii?Q?MmUT6LLcBJh2GhiM+iDle1nmXQn3QyrQaHBFuZHSJX5WjpyF1x4bFmIX6kcS?=
 =?us-ascii?Q?8BJ9gk3YdvAm11ULp2e/IWmJLkPmDI5z5onikTATN5YTP1WwuWALsthPSNBF?=
 =?us-ascii?Q?vm7MYeSGIpYTVChgelheNYbGXBtpa1la2xbQcbB6ohfCm1lltmWiEK7o3gKY?=
 =?us-ascii?Q?ulz6dT54m0PeIgfu4wtCKli5AfLwr0LfQiXUhB3AwoAAxjF3xl2p1I3cviKy?=
 =?us-ascii?Q?CRC4sQ51jXpXa5Ds4zhIa/YmYgnUn6k83dzMAFvET6ukMqx5eCz+VgSqTKJl?=
 =?us-ascii?Q?jMrGa1LILV5juPBya/4sNwOgh+hz1C0OoN0Q8qc8yAWNbrQnkINLBIOYi+rC?=
 =?us-ascii?Q?eGVwSZcexJTyCwLPgZdDS8qk8EQFLi3j38h1aSOnqqjytgxdlnleJgxrRZ8S?=
 =?us-ascii?Q?fBM5xCyigVmSzjrcCu62qblFj6vMrtN267xyevI4C9FvAss67gI9OMcg2duK?=
 =?us-ascii?Q?WH3HqbfYOODh4Vrth0HymHFNV5Gg+Vi2DIU/DG1zbQhkqkZwofxYJoUoGLlU?=
 =?us-ascii?Q?SnOh8aUzVsfhwLkHAWA4BNWsbI05icZloz9qpT22g9A5QScOooZF1J2mjlJo?=
 =?us-ascii?Q?HVaZq/TzCT0EAXxa8YurSKpE5cNf5qITpWbZ+UZ/FD3vja3Dv6mWFTSmm5Bp?=
 =?us-ascii?Q?yJOhsL2Jnjyfw+xmWuEJ7CkML2tkNJrUj9RJyqDvM/tS2i7eSIYuVI17ley0?=
 =?us-ascii?Q?1htHdeHw6AsSXuErorfkWAxKgQ7RuJVHriAPgdGxDpn1/BdTUipFrjIkmQu4?=
 =?us-ascii?Q?zrs4HVxNTF+e9cVzcaSLkLHiCofGaBBSEG8o7HcNWPwmKxvGlkX//jfV97sQ?=
 =?us-ascii?Q?19AXJOtrNRkJQjBbnbIO1cpaev2T9RYSTyploklVS4Rcs4+7jnSbKeFOw6+x?=
 =?us-ascii?Q?OFxdjMeVACPPaB8OW6Z7D2AsjlZFtqcEoXRhN2JfpGasH9+FmmEW2LE+mtvF?=
 =?us-ascii?Q?Mh2pXdxydS3rBZFaed7/A4Ee3abs8XdupTG3j+0GB3nv6w+eeoSHsU9iIRBI?=
 =?us-ascii?Q?04EgwzscmA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d120456a-9fff-43a2-084e-08de5d93c17a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 11:03:52.0430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s2LNSBIf9fUCqcBsXX6jkcHaxJiKwx0/HtqcNBTp7a4K4RJ+uRqJUwM8W/u86xgYkRHgbb6MLXNR2z07POJNZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6230
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

> Subject: [PATCH i-g-t v9 08/11] tools/intel_hdcp: Interactive keypress th=
read for
> menu
>=20
> Handle user input asynchronously with keypress_thread ,enable interactive
> HDCP via user options.
> Update print_menu to display available actions.
> Introduce validate_input(), get_valid_hdcp_connectors(), select_connector=
()
> and handle_connector_selection() to parse user input.
>=20
> v2: Handle invalid user input like choosing an invalid connector or non H=
DCP
> supported output
>=20
> v3:
> Use menu lines to print.
> Avoid reverifying the user input connector id to be valid or not for HDCP=
,
> Instead display only HDCP supported connectors to the user and verify the
> option provided by user (Suraj)
>=20
> v4:
> Retain print_usage in this patch to keep the tool functional.(Suraj)
>=20

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 202
> +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 202 insertions(+)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index c12a1b6d6..53e=
da713d
> 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -5,6 +5,7 @@
>=20
>  #include <fcntl.h>
>  #include <stdio.h>
> +#include <ctype.h>
>=20
>  #include "igt.h"
>=20
> @@ -29,6 +30,11 @@ typedef struct data {
>  	igt_output_t *output;
>  	enum pipe pipe;
>  	enum hdcp_type hdcp_type;
> +	int user_cmd;
> +	bool running;
> +	pthread_mutex_t lock;
> +	pthread_t video_tid;
> +	int selected_connector;
>  } data_t;
>=20
>  static igt_output_t *get_hdcp_output(data_t *data, uint32_t connector_id=
,
> bool *is_valid) @@ -57,6 +63,16 @@ static igt_output_t
> *get_hdcp_output(data_t *data, uint32_t connector_id, bool *
>  	return output;
>  }
>=20
> +static const char * const menu_lines[] =3D {
> +	"=3D=3D=3D HDCP Tool =3D=3D=3D",
> +	"1. Get HDCP Information",
> +	"2. Enable HDCP1.4",
> +	"3. Enable HDCP2.2 Type 0",
> +	"4. Enable HDCP2.2 Type 1",
> +	"5. Disable HDCP",
> +	"q. Quit"
> +};
> +
>  static void set_hdcp_prop(data_t *data, int property, int type, int
> connector_id)  {
>  	igt_output_t *output;
> @@ -221,6 +237,192 @@ static void print_usage(void)
>  	fprintf(stderr, "-h,	--help		Display this help message\n");
>  }
>=20
> +static void print_menu(void)
> +{
> +	printf("\n");
> +	for (size_t i =3D 0; i < ARRAY_SIZE(menu_lines); i++)
> +		printf("%s\n", menu_lines[i]);
> +	printf("\n");
> +}
> +
> +static bool validate_input(const char *input, char *choice) {
> +	const char *p =3D input;
> +	const char *rest;
> +
> +	/* Trim leading whitespace */
> +	while (*p && isspace((unsigned char)*p))
> +		p++;
> +
> +	/* Empty input */
> +	if (*p =3D=3D '\0')
> +		return false;
> +
> +	*choice =3D *p;
> +	rest =3D p + 1;
> +
> +	/* Ensure rest is only whitespace/newline */
> +	while (*rest) {
> +		if (!isspace((unsigned char)*rest) && *rest !=3D '\0') {
> +			fprintf(stderr, "Invalid input format\n");
> +			return false;
> +		}
> +		rest++;
> +	}
> +
> +	return true;
> +}
> +
> +static int get_valid_hdcp_connectors(data_t *data, int
> +*valid_connectors) {
> +	drmModeRes *res;
> +	int valid_count =3D 0;
> +
> +	res =3D drmModeGetResources(data->fd);
> +	if (!res)
> +		return 0;
> +
> +	for (int i =3D 0; i < res->count_connectors; i++) {
> +		drmModeConnector *connector;
> +		char *output_name;
> +		const char *hdcp_support;
> +
> +		connector =3D drmModeGetConnectorCurrent(data->fd, res-
> >connectors[i]);
> +		if (!connector)
> +			continue;
> +
> +		if (connector->connection =3D=3D DRM_MODE_CONNECTED &&
> +		    connector->encoder_id !=3D 0) {
> +			asprintf(&output_name, "%s-%d",
> +				 kmstest_connector_type_str(connector-
> >connector_type),
> +				 connector->connector_type_id);
> +			hdcp_support =3D get_hdcp_version(data->fd,
> output_name);
> +			free(output_name);
> +
> +			if (hdcp_support && strcmp(hdcp_support, "No HDCP
> support") !=3D 0)
> +				valid_connectors[valid_count++] =3D connector-
> >connector_id;
> +		}
> +		drmModeFreeConnector(connector);
> +	}
> +	drmModeFreeResources(res);
> +
> +	return valid_count;
> +}
> +
> +static bool select_connector(data_t *data, int *valid_connectors, int
> +valid_count) {
> +	char input[256];
> +	int cid;
> +	const char *q;
> +
> +	printf("\nValid HDCP-capable connector IDs: ");
> +	for (int i =3D 0; i < valid_count; i++) {
> +		printf("%d", valid_connectors[i]);
> +		if (i < valid_count - 1)
> +			printf(", ");
> +	}
> +	printf("\n");
> +
> +	while (data->running) {
> +		printf("Enter connector id (blank to cancel): ");
> +		fflush(stdout);
> +
> +		if (!fgets(input, sizeof(input), stdin)) {
> +			fprintf(stderr, "No input; aborting action\n");
> +			return false;
> +		}
> +
> +		/* Check for blank line (cancel) */
> +		q =3D input;
> +		while (*q && isspace((unsigned char)*q))
> +			q++;
> +
> +		if (*q =3D=3D '\0' || *q =3D=3D '\n') {
> +			fprintf(stderr, "Cancelled connector selection\n");
> +			return false;
> +		}
> +
> +		if (sscanf(input, "%d", &cid) !=3D 1) {
> +			fprintf(stderr, "Invalid number; try again\n");
> +			continue;
> +		}
> +
> +		/* Verify connector is in valid list */
> +		for (int i =3D 0; i < valid_count; i++) {
> +			if (valid_connectors[i] =3D=3D cid) {
> +				data->selected_connector =3D cid;
> +				printf("Using connector: %d\n", data-
> >selected_connector);
> +				return true;
> +			}
> +		}
> +
> +		fprintf(stderr, "Connector %d is not a valid HDCP-capable
> connector\n", cid);
> +	}
> +
> +	return false;
> +}
> +
> +static bool handle_connector_selection(data_t *data, int cmd) {
> +	int valid_connectors[32];
> +	int valid_count;
> +
> +	/* Commands 2-5 need connector selection if not already set */
> +	if (cmd < 2 || cmd > 5 || data->selected_connector !=3D -1)
> +		return true;
> +
> +	valid_count =3D get_valid_hdcp_connectors(data, valid_connectors);
> +
> +	if (valid_count =3D=3D 0) {
> +		fprintf(stderr, "No HDCP-capable connectors available\n");
> +		return false;
> +	}
> +
> +	return select_connector(data, valid_connectors, valid_count); }
> +
> +static void *keypress_thread(void *arg) {
> +	data_t *data =3D (data_t *)arg;
> +	char input[256], choice;
> +
> +	print_menu();
> +
> +	while (data->running) {
> +		printf("Enter input 1-5 or q: ");
> +		fflush(stdout);
> +
> +		if (!fgets(input, sizeof(input), stdin)) {
> +			printf("\nExiting...\n");
> +			break;
> +		}
> +
> +		if (!validate_input(input, &choice))
> +			continue;
> +
> +		pthread_mutex_lock(&data->lock);
> +
> +		if (choice =3D=3D 'q' || choice =3D=3D 'Q') {
> +			data->running =3D false;
> +			pthread_mutex_unlock(&data->lock);
> +			continue;
> +		}
> +
> +		if (choice >=3D '1' && choice <=3D '5') {
> +			data->user_cmd =3D choice - '0';
> +
> +			if (!handle_connector_selection(data, data-
> >user_cmd))
> +				data->user_cmd =3D 0;
> +		} else {
> +			fprintf(stderr, "Invalid choice: %c\n", choice);
> +		}
> +
> +		pthread_mutex_unlock(&data->lock);
> +	}
> +
> +	return NULL;
> +}
> +
>  static void test_init(data_t *data)
>  {
>  	drmModeModeInfo *mode;
> --
> 2.34.1

