Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45384C87FCC
	for <igt-dev@archiver.kernel.org>; Thu, 31 Jul 2025 11:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A8810E776;
	Thu, 31 Jul 2025 11:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WAB35vue";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D4210E776
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jul 2025 11:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753960154; x=1785496154;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dbt+StoowjGb85agvVvNgBdL3cweOTfYHnN3riuvIuY=;
 b=WAB35vuejYdGrFtRBE7SMvEareOoGi8FLhbHtsh2o02t1RCXstFLRdFw
 O4VQLIoBBbYUSSDFXemJX70kGDtfn3V8wm8TOeNLSUqW1zGdWusZZCqbm
 tB1VT8oxnOwq74Hz5gtVSzO+/F+04aHXZpWgHZY6OuexuIkzzpv0NDdKQ
 /GwxfMW5CxtqQ703J9SHmou1/sL+EXxJ81b3eFPj08vvcCNfKW6wB4V51
 5SDd1la52rr4V/dJ8Q+cW/vFf34EqP6edLqjsrWxO7kBEKUHDVzUv3o0l
 al6TkXKfgrUPexsMTbVb5WrWKyWDwjHQ2CNZ7kIq6GdqbGduVvY1Fxlak g==;
X-CSE-ConnectionGUID: /vnjLTzkQBmQBrcG06ZQ+A==
X-CSE-MsgGUID: l6l3T60oRmWsZ4dBslTcPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="73738316"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="73738316"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 04:09:14 -0700
X-CSE-ConnectionGUID: iN04Y269Sxmm+4QGJzKUwA==
X-CSE-MsgGUID: nhfX/kc4RJCSd+yej1toqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="162824433"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 04:09:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 04:09:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 04:09:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 04:09:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCB1ltqsDmveBRoECY5Zz7u2QQQAl8rUoYr1g+bvbexxf/8+uXbVPLdiDlTiGcV9X1H/nJy91wrzof4x1j34BoK3Zrw34buvbJppRpYOWsoNw+HheXlhuBRsVbH3Z1vGWinhG9Crjfy0hpJKqEVTVF7JGZ9P2NjVRXE/TE15JA+5fr3TQZQPw1BJ07xWvB3I54QkwunqWd3vWe8uxoVJ33PrF4/EgIFa8PkxOIRf8Xf1xF3PHZ76kz6KfOesvxUehframpKqHyIZ1CjJBIophuW/DwYWctPRYDN+H1tiVPSK6RxEQ8tSjjz3X3CPLXJimxVTiK/WHXcxC/vk2/nvhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKD54C5WOiesAiaAP45NYgDLSqGw+vYxKXV/h9tiYRM=;
 b=w3pYyaGh/pPOTIUC3wVI4ZoKguBinqvaNMer06hB0vmSHn2StgR1TH2fRfG+69V/EMy8QBsjGIHXoH9jizN68aABUrR2YdVlx1lw+pwzfR7/fSjRffedMpUCLFw0ushxUQHZIRAltyHWj8L2FcvQ2LfF5H7tTmrvriHxUDckI4IF7lMNGq4hiCF6UKsc7NsL5v/htLKhSOQRI/R+vIVuSafpe82mqS+MbuFKWz3RiD394J/18BOxeLpJkCTiJJHIRhSBFoh/xRMEuDpHiD4hP58BY5bfTh9Yry77TvdKGPC8T4/dWqnMIADXpkwvx9mK6ctWoIS46iBtF75ZkwgyYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by DM6PR11MB4706.namprd11.prod.outlook.com (2603:10b6:5:2a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Thu, 31 Jul
 2025 11:08:45 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52%6]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 11:08:44 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v1 2/2] tests/kms_vrr: Refactor VRR test to use
 global refresh rate from cmdline
Thread-Topic: [PATCH i-g-t v1 2/2] tests/kms_vrr: Refactor VRR test to use
 global refresh rate from cmdline
Thread-Index: AQHb8FRb8TlS6Hn0p0Omh3LtKrsbK7RMD5eA
Date: Thu, 31 Jul 2025 11:08:44 +0000
Message-ID: <IA1PR11MB6348B9C79F71EC391DBBDF36B227A@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20250708220502.803610-1-ramanaidu.naladala@intel.com>
 <20250708220502.803610-3-ramanaidu.naladala@intel.com>
In-Reply-To: <20250708220502.803610-3-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|DM6PR11MB4706:EE_
x-ms-office365-filtering-correlation-id: 0f19a184-1977-4386-95b2-08ddd0229daf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?8RAxU4AkTpEAPeuXLh6Yrx18KVhD1a3H7vJV//uWZxrUc+H3V4+SpRQA1+/3?=
 =?us-ascii?Q?RjnuJc2NMEUntoEw/EsV07qv+E+nsm7jPi5DFkHXDYBEKYqfOue24BfWs0Xs?=
 =?us-ascii?Q?R+n/616Tt1zJchfqxjJKYyr1Q1ZNZJqmw4xMFJ5nIYDsadCP8VCbYqkAjQw4?=
 =?us-ascii?Q?YxfGjwcr+yXn7UDn41RnTYVp9/ZLkoaf/rppNDGiHA0omj2RGXfzzDgZ342h?=
 =?us-ascii?Q?oNyGr8nW0jMXr2ITkhFH86bwMbv2txM6wwm4phVtVpN/RyEaHSU7duwHfcpQ?=
 =?us-ascii?Q?kc3xzznjm0Y1fqD/BUFrR8lYP+JcrGZ1uoeCFYLQlHrbgGXGAnAsx1cYuz1s?=
 =?us-ascii?Q?XFe97EMXp6kXn/AbJeX4VA/U+JpDlujYER3EEQqQ1iHq13LtVdLSOgfBZj8G?=
 =?us-ascii?Q?/z8nb7WQkJk2Pq5+sUXobDQpJDgCGtlG8uronJM7QvczIYX1pWbhHf74hd+A?=
 =?us-ascii?Q?khH2AvrhLjbX+Hx6fdwiro7x2H45+VZqDiVlWd6JUPC3R+eSCUFWjl/2MtIV?=
 =?us-ascii?Q?kVHUoagNcBvHQizz/gEeZtDtI8w2VMEJ2gThLNVPraTR9xj6/fXufJPl2G9o?=
 =?us-ascii?Q?cnNOf4YvOOT6nfx32NVwJV+sZFaWHlq6uqPVNKgfB591BnrxfFTe9NmaOqVF?=
 =?us-ascii?Q?fnxsfXSahB2lIbREexDvzYNHv6cRg6xCfGxv6xwdMu3PJlznWeHhbJfl6uiQ?=
 =?us-ascii?Q?JKKbDtaYP73qc5vUighjZawdpzO7zeLM7VAygZ4yJMVg/9j8W6AEiwG3sLEF?=
 =?us-ascii?Q?/tFQ35ASF9gxx00fFFWqHcTmoesvQplruV1dJ/fdhNcvi0IlTXx9xj+TPQj3?=
 =?us-ascii?Q?W5LgGlHxn1DRl0BU9wbU3Q5K2rN6Up6DbCsosX5QI0pqwb8BlxsPVJPl2qul?=
 =?us-ascii?Q?ctltr7Pw/IQgsz+XPxj9h7Yb5KXJAEPzN0DCulOpaIpqMk+RP7JeBELFBsyb?=
 =?us-ascii?Q?3+Vy1HNV1xFPklaxaQBf2xe/JeyrSKuM28/w2vJhi8+1rQ108OgxLtFcGGJb?=
 =?us-ascii?Q?t9V0IgzlnJfgvq8g1KyCLMt9V9DebJCYTr2p2hfx/cgMPFlzjTRzQ0NR6O0D?=
 =?us-ascii?Q?3xOYWbgNXr+KZtkVCCXoA0dTAuEAjv6sfcael1R4vffcXIzJidz2wieZD38s?=
 =?us-ascii?Q?gbAS0KHK1EbzZ9ZDMLsCsAF8e1u8looUe8BqV8G9zj/OIoXmFyLFe+soWu9X?=
 =?us-ascii?Q?YLdHuKbmN3TKgJkRhwKw5fAhSyead/HI3+vpt/mkWlDiKzkYJnaKoaCJaY4f?=
 =?us-ascii?Q?toBV9yhwxnEe9e3mimRBOZM3+oL/xb8BIxEdFCOIO0xB/RAwiWEkGCTTF/cl?=
 =?us-ascii?Q?JSermiqAsblDAggAo6Fo0qSgEHPtwqeIB5fesgb9/Qbszmpa0XSB4XD96ej2?=
 =?us-ascii?Q?/X0pWc3OE+VGPXALrJrXXjSWfRs/AJQnS6jrBHYrMGhrfz9rDnqzU9LKWrZ0?=
 =?us-ascii?Q?v84qKlCwbhbeniequ9TFhzSJo4CAPhKg/OcELlSpr4G2QvKbAdxOQw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iIt4eNZo5gr8YiklZC4QkNUzxZxUQozFPcDvVIg/DZwMaDt6NMwG3k51WwWb?=
 =?us-ascii?Q?tG1UPGdLCPjtt6FkzG7DAN8X59EUFjoUA7rs2LPKOnrnDOy2ca9044rSPoKq?=
 =?us-ascii?Q?N9wf7vV4U+vuZHiJorJEDR1cMkKLHtKDUjMTo3zRaTeJtTsaFiYIi7DAQ9j0?=
 =?us-ascii?Q?gmf8izOmyFwqPOd8kaJ6lvVvOfUftUY3KFdxcDR6AHt/ZzNPHu/5ofQNJZTI?=
 =?us-ascii?Q?C0mOY86X8QxJ6PnXKFg9QPHWNMSNKzYzlOBgaY3wUBpMzaJjnx565PD4odtE?=
 =?us-ascii?Q?b+x/it97LgBoQP5eCICiIQTfKMoD+cyMAWVPERCoPUx32KoUmRbIFjZUo78Y?=
 =?us-ascii?Q?DD4hFrAQX55FyDefwg0qW+1tWeDLyn1L9xaInQIteEXcEeUjaDx6aEDuKzd5?=
 =?us-ascii?Q?v7A9pi616jROwwltttrbtj9j7TmtVlcxYh5KtCA2cviNsaiXg8fjQwbxK/kJ?=
 =?us-ascii?Q?Wrl/nO9pmFdtlAI0897iMU3ynl2iHGfmdRmpcajmQEwa8+OROUBZkyF0AoP/?=
 =?us-ascii?Q?RQcBHeXYYWrgvdj5Bxt0fK6gQw6sMJOOwSrCBoE2WqXVMJ4p1VDmAaUpo9va?=
 =?us-ascii?Q?o11jtIhjjeKBuuYPbwq4qO+KrhUYMcExYQMCPMfsRqqYYLuYW5QKMjfoLAwp?=
 =?us-ascii?Q?Ii+CoE4pezl3kstK/HfdiJemsdWNKYJ1MBDuw+oIxRwyS2l/QfiWS4Q9/ZxZ?=
 =?us-ascii?Q?MkXqIM6XumFp+Kuz85Pq2RhiF6EbLYDMYqQ7ALu2/+NMXC9BJ4fTU349EcN8?=
 =?us-ascii?Q?d4/UVKnmtx7Knji7PsYDG9IchH7ZqybsTYRm18FBjxJros2APm8EC8AEGf1g?=
 =?us-ascii?Q?aMOikVb/gFL47LyuZBNwM8TsIo88uTVuZfYWIPQuTJp8D259liU1WmWM5YQL?=
 =?us-ascii?Q?hQqj73XOZnt5VYiN70HAgHRytHm0QhHjwK+m7lESZpMt/ddDiVlmz3n+8ETW?=
 =?us-ascii?Q?MOatw5VQ89eK81ICjIpVXTTK8J/r0ZrICPzBbpfdBpsu9S33KI+C9picgTuL?=
 =?us-ascii?Q?/ejO9DPxSvmY5rq/gjPDRxGEGAsyKpIjIe5Vi7x3eYoB7uPI93RksV8u+sLa?=
 =?us-ascii?Q?LPsaEJKXvZGy2cy1NRpTmaXhaTN8NupmTsJMubfpUR0+JX/4g/lLOlWy0lsG?=
 =?us-ascii?Q?DgFrGsFaPj889jHFmRhvLDY8AhGGk0RBeLWL2+mTloO98W2fmHgPdtcfOrpP?=
 =?us-ascii?Q?3lwoyvSZPrAaGZghVhG3v+rTqLSMf4u9WV2kgqyIzut7hWpGnLvt6mzVdZcV?=
 =?us-ascii?Q?zEg+4BvjewMZTkbc61gIP7v/QU1vGcEwcNmVaOjmeSriKilcUUBhuVM9jzQB?=
 =?us-ascii?Q?y6X/EiGYpP7GvCYpUaRIKLk061LoY2OxTyOTKtSFwCevkoNfJESlDMbupReM?=
 =?us-ascii?Q?pPuW9L7Wy3ZkMpYFDH+rgVAWe46Ep8kbOUnhwFil7AZAaaOJXqfsEq55yf1m?=
 =?us-ascii?Q?iIwqVNQ/Nb/nyC9J9BAYGiUbGPgVR+/uIR2qZi5VhQy6YGCL+cdJS6VD2sgx?=
 =?us-ascii?Q?ehS8IovnphMeMQYiKU0AZ6GlkLboPbjGgAQZcf+VPMDx91IXZ76tDBH0uMAs?=
 =?us-ascii?Q?0ZyP69I2dy49vxW0F8nPUzVw/KxLvVBA0u4+XRyDo69bREoelLGeyBVKBgMF?=
 =?us-ascii?Q?uyqtHLZW/75FtqtHcP41R4M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f19a184-1977-4386-95b2-08ddd0229daf
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 11:08:44.9272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G3tYpjvH8EZoN4/Uqk89QJoo1a7HU6nr3SbInIPjOwT2XWlAkpJIpLhRSbUlHqTqu5ZPlcNMNmfKnjMT2XTDucH311XRUyIukkhyyxNwlCI0znRq1oW7mePaSlwOUiMM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4706
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: 09 July 2025 03:35
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Golani, Mitulkumar
> Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1 2/2] tests/kms_vrr: Refactor VRR test to use glo=
bal
> refresh rate from cmdline
>=20
> Applies the refresh rate provided via the `-r` command-line option consis=
tently
> to each display configuration during VRR testing.
> This change improves test consistency and allows users to control refresh=
 rate
> behavior across all connected outputs.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index a24f413de..b789a0a4f
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -156,6 +156,8 @@ typedef struct data {
>  	bool static_image;
>  } data_t;
>=20
> +uint32_t opt_rr;
> +
>  typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
>=20
>  /* Converts a timespec structure to nanoseconds. */ @@ -1090,6 +1092,8 @=
@
> run_vrr_test(data_t *data, test_t test, uint32_t flags)
>  	for_each_connected_output(&data->display, output) {
>  		enum pipe pipe;
>=20
> +		data->vtest_ns.rate_ns =3D
> igt_kms_frame_time_from_vrefresh(opt_rr);

Are you expecting refresh rate will change from user given rate ?=20

Earlier implementation also looks ok, any purpose of change to update data-=
>vtest_ns.rate_ns at this point ?
> +
>  		if (!config_constraint(data, output, flags))
>  			continue;

If you fail at config constrain for this test then capturing refresh rate h=
ere has no use.

>=20
> @@ -1111,6 +1115,7 @@ run_vrr_test(data_t *data, test_t test, uint32_t fl=
ags)
>  				test(data, pipe, output, flags);
>=20
>  		}
> +		data->vtest_ns.rate_ns =3D 0;
>  		igt_output_set_pipe(output, PIPE_NONE);
>  		igt_output_override_mode(output, NULL);
>  	}
> @@ -1125,7 +1130,7 @@ static int opt_handler(int opt, int opt_index, void
> *_data)
>  		data->duration_ns =3D atoi(optarg) * NSECS_PER_SEC;
>  		break;
>  	case 'r':
> -		data->vtest_ns.rate_ns =3D
> igt_kms_frame_time_from_vrefresh(atoi(optarg));
> +		opt_rr =3D atoi(optarg);
>  		break;
>  	case 's':
>  		data->static_image =3D true;
> --
> 2.43.0

