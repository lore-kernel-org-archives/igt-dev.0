Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0B3C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 11:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2529D10E91C;
	Thu,  1 Aug 2024 11:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVwP55RG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1449E10E91C
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 11:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722511720; x=1754047720;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UiAtTw1S/cV4/M8EgMqoircZA7hOtSPcbU/FuPIjMmc=;
 b=AVwP55RGHi6DoMftFDdSpqbeMM/bEJJeIYg5Jx6T/JgbsjHdwa+lRP99
 OJo/SfW1XOxfnDh2L3f973YVKb69CZeECEBI0qY81OKnZF32CDOZsPybp
 Ll4/2C3dNr2DQ4lo83+Ww/Cqlt3DJuXXXVA4p0eyKwWIaJtBuSv40na1q
 EH4Aybr2s9K9aW+iN0r/BxoO14HO7zLV8dDi4j0hBHghcarYEyGwtkhh5
 5koUELAfYvrbWjrJ8+GH5f6h2960st3UlOFgEbzerzohOZHZrPeYNlAZ2
 yjMam1TtsD2WBlSRZ+jjc5OAzxpKUv8yDOB/3B6egFGmbHrAeWDjcqPPx A==;
X-CSE-ConnectionGUID: 5LDGQgvgRVW6Yqv+ueuMBQ==
X-CSE-MsgGUID: ACAGwS1DQ+K3c8paigFYiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24249995"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="24249995"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 04:28:40 -0700
X-CSE-ConnectionGUID: uUNDxhuZQW6CX6xEnmhKNw==
X-CSE-MsgGUID: TNX5XSTYQxut54FFsuFAag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="92534667"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 04:28:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 04:28:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 04:28:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 04:28:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMaqg6QyeeKCO8vMmtaxHXGRRFPM13GrMIfXTEN7xav3g0BaZoLL839H3+V7Ypi09bF9u5vKzF1c5YRIGwGy0PJETxgYKqCXivXtQcrhU0l0sr5GIo2aXhQwwkBNLMhp2dMKyeHPTF+aIHP/XFa6VMKaprsHY/cQJNa/syEIEEJGShTTsv8q6BzQ7ayOFXXl6i18o53LUz1Yzh5y+N+J0EhcvxnWFCDt/iSlf1Qe9yZ8s0eiAjLFVwWY6IXLchd+UXPFyrPn09v+TVuPy1uMhmJysIZlz9MTXztU5Vv/3EUd0XuoZV9wOuO+wfnwYv+kKmnT4qk41lqB2qKsNYMPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8k2em53OtfU25jjPMyEYamGfgyqhxuG4xU19JYhqZPU=;
 b=maxcKPiI0V+6CNTenZUHCNh82F/OL3JfA6OcvOEbDKt54gGGjRlnLxBSxIhvVtZiqE5QZ03+uTmpwu8V8/lMIkClImVJLy0Sftexj3fFvZGqFxHXOMCVTk3rNadN7zDkE46ex3p2Wq9N8tJIv9SxYHW/njXhn6berug9hEpWBQ6A2/q8RD3xZ+KJ502gF7goWbY05QKuT6vgtrJ3ZVAjyVAbVJU5FfyEtjLdukjcoexjAVkbASk0XfM5OJZikFLPleqoUNDiZwcbF1OCzbYXlLxBUZJbv3r/dnT2JKxW3MnZFI8beCzFNIF6G4KwVYE5oN45mR5G1GZMTnGt+cTTDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 11:28:35 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 11:28:35 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 08/66] lib/xe_eudebug: Add support for vm_bind
 events
Thread-Topic: [PATCH i-g-t v2 08/66] lib/xe_eudebug: Add support for vm_bind
 events
Thread-Index: AQHa4nZAoKuxYq1iYkm6mztJb7FmVLISRang
Date: Thu, 1 Aug 2024 11:28:35 +0000
Message-ID: <DS0PR11MB72640F7A50F226FA66BC923FD9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-9-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-9-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SJ1PR11MB6129:EE_
x-ms-office365-filtering-correlation-id: 5dedd602-3613-4078-f24d-08dcb21d14ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?swAPXo+jSwbvMvfVvKKgRpCMFKYaOqrfX/vW80oyJLh3WTFvwsfADYVht/nB?=
 =?us-ascii?Q?A9iQvQ4WwXAH+7MdQA95pRhn0Lt3U08hGYKfTemRpeYyb6jTvDbuT+JW3idF?=
 =?us-ascii?Q?CdC40kt/M4WotD0084ffrrLlDD3Xg+8rM/mZ63z6ZbUlZbfK5VoUeCKb4X0X?=
 =?us-ascii?Q?6qdfchSml9Zp922zdyeUO6m7TpJ5/X9rYCE8+jfQmEekwKrFPAtRQlMBXsgV?=
 =?us-ascii?Q?Tg7/PrJcq17tAnnngdnUmme8naMJzEOKHoBS0ETM5jrP07HfM74/c6vNEZ5X?=
 =?us-ascii?Q?d3gKoQbkpo3YyuI7KTqQh7f15/YrilFxJeNyM5IQhCgAWanlx16PC8r6i8mF?=
 =?us-ascii?Q?nYunVeylhBjBtfAnfCfO2xV/V671HMq4qhkvAA28PycW7XObJC4zcgQckEu8?=
 =?us-ascii?Q?IbhjF7Iz3CwdRj4cyw7jSy96ATSnViSfVeqd0m+ZfOs4EuBXgcPgj9xksQmI?=
 =?us-ascii?Q?Kjk4v6nBseggjTzjlErhc5IMEOETpPCfafpnTfs2huh4woqwo8P21MpMExoK?=
 =?us-ascii?Q?GXiVcipyKBcR5QzivF7Av+/bK9g3DK11LtAp+iBq+0uZ7kC2RdyeKIfWcES1?=
 =?us-ascii?Q?sEuv9BQaz8vPY/IBM0MDKaHQ+Bd+BXKtKDhE4X7T520w1miFLu1efAH+XFwQ?=
 =?us-ascii?Q?gy9aQJj725HkiGkCwyx21yyiAct0WHQ839IrWe8yiICMmJ1o0uBKdi70Bxbq?=
 =?us-ascii?Q?EUttKPj8zTLx0ElTFSAuO98/i0++K5cSHqv+VAM/QPw5K/G+QV6AVmg3CwAd?=
 =?us-ascii?Q?KtmNVnaapmzvajOgTQrkIpEjYs8e9Dqn7FdpviIQCwj/m0IKgscaQBMOkdnr?=
 =?us-ascii?Q?PTG6+VmaV+qo9ELU2yvgI9pRtlJ4STf1VxZCEKMIihiqYtoYAPKQgpz9iDj3?=
 =?us-ascii?Q?k1pc6uJGSXa91iRaOvnbR0wYvlvNTsj/96Kdimh0ZKw+9y3qLlmZ87LMsvvC?=
 =?us-ascii?Q?TAKlgia1KSownZfWRUL0n0xGNwdQhFMz8/L1e4LwMy/4sx+H42GKSAPBbJ+4?=
 =?us-ascii?Q?6QZoB9CSl51fZgUmNoXLvD55TGHUq/y9CM28TRRlJqXvhBPaZSskDbOstIMa?=
 =?us-ascii?Q?UiyvJZf5/OcQ7jZ7CNb9UratxzIeg51cq5DuwmD6j5Qj0XLOS0gD+Lo+CIrD?=
 =?us-ascii?Q?FsEGkc+cutxyHfRiqKeBqgVBLej9/E3jgqFbJzAAJHoURyJbDEQIoEyqOMw3?=
 =?us-ascii?Q?4NH4WMYEIpEG8juoHUpX/V+ACWQa9P/i1FeVmsSlstSScL/B8QsMbvBdpqmk?=
 =?us-ascii?Q?FZvuQI2FKsXlo5hC3t92JCc+dNKyjmxMyUcHWwZNCPaHSWmfNmtT/slUNks2?=
 =?us-ascii?Q?pUlZnkI1gkBM1hkDhxOEgpK8BenRLNbuOArZ5rporSehWGaIBFr7F981klGx?=
 =?us-ascii?Q?1ioewN0nrkDxh1U9L7VqsKu3kqDWYsCfhYjlntjqqQ1bJXfnug=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8fU1v+yjZF1ELWXNSIAUbWeuTklkZTrPuDcMgnv+7Dbmeo6lvluw1WYI8PVG?=
 =?us-ascii?Q?GN97ID962onfAeU88zb+KLRxt/EHrEdi2k0hi4UtLcCvEP1ijNIfnLXkfDx3?=
 =?us-ascii?Q?2RLA5yI2Dpn6pUBtaSUvplwpQwEvxWUrcvM8L8Fo9GvU9UzzIrX+cK2q7AyV?=
 =?us-ascii?Q?BJmzhejpxa8Nbpi43BuoIyNcWn61HomU2ZtyCnc2ZTXPLYF4/i/01WhIKnsO?=
 =?us-ascii?Q?kF5yfgkIv8TzUrZq1USAdtB22RTGTKv9C55j3cuMxmAGStTcm4vmBCw2ufdw?=
 =?us-ascii?Q?DBR+skZ9i2FgzRgWrXZ3ewFYDF2u4PAB2UErteRZD3EwEFI11IRGHdlYBbnC?=
 =?us-ascii?Q?qJpfsyxWa85mhRYPMoRMNamxJqg8WkpnS/MesWKuBV4qRX6a/2ESu1ZilAow?=
 =?us-ascii?Q?eDKakyoB5DikUbNth2TgWFXCxvxY4ioLQ+F32rXmx1RMx+60JRjna0ZaY2Ff?=
 =?us-ascii?Q?IkgrkG6euzEJPB68BrU08iMiQhJQsOUA+4E7bHjahtcm577UEfxfh+mI1d5a?=
 =?us-ascii?Q?HW3N/9ZPNXzWyVoCMxLpK1rQFeCkPwqRhFJj7FMJkR/8CSQ03PGQzFqhbogI?=
 =?us-ascii?Q?9Yp2W/K09exXFgXIFxdMb4tBx5J3rKM2LlO1QfCED2b7NHSMPLE+USTuNz5G?=
 =?us-ascii?Q?a/CtDLhz0zpbK4e8GsQrfDQcD+vL0A6vsBSIJmYYk2nQ3QeX/n1OHCc3RCiV?=
 =?us-ascii?Q?1wbMivqsjv+Th7DvB/8RhVqheR4eCn+zbyNOvSuOLisuZoO+b/QdKDpLD8UG?=
 =?us-ascii?Q?HB28mTS+ik7RfPhkYxDtIJxiRv7TzQmd8rRklTAOvEpJH711yGFd3N6vKZWC?=
 =?us-ascii?Q?j6rV9PLP/uQSEHBgUjvggybzQQEVhrAJx7GKwRpKFKgeGjnubw8sJwdvc15i?=
 =?us-ascii?Q?kinzptRb0JLFeQWY3MfivJV9lpQ//eUzePnJgGUXH5udZnu0tJPjXP6pOnwW?=
 =?us-ascii?Q?4dXC3D+DjEn0Eo1mlwTYw8gP6ESgz7KAjvZDhYXQrbSVRNp9ktdqV5KIuuC9?=
 =?us-ascii?Q?bs2EKGHXWYr3cnI9OMzST5nIpzeotHby7Qm/GpzaNWmt0gUetjcTZjLekNr5?=
 =?us-ascii?Q?ZmhOy073lV1SASi9hzEdLfjFoXgD8FgqnzPiTf906J1eZ+OY49f5axOg+mrY?=
 =?us-ascii?Q?6TFiQiJwvDOczM2EfALnQTwfiFbCjWBSMh1SDkuXIqRNqivXCMuNMjXoQNrd?=
 =?us-ascii?Q?WrxqtQOxQ4BorKvZk9+GR/9woVT3ETaLkbBS9Rgpw4+Cy6PZ2+yk5XMLOpi7?=
 =?us-ascii?Q?T9b9rt7Hcq06EQ/jDi2RdUs0hrkefzr/iYpw4aepBe9xD0vyw+hbRP1oo8Gz?=
 =?us-ascii?Q?/N9ktCdsLwXfzrbg2tTMZGc+Q5VPByuUUTG6HLAtxlHRpK8ErU3aaU/GaU5x?=
 =?us-ascii?Q?kuftSaMkEYmRBMOxI3oFg7EdEnbnlJ95CFQdiHrqbzzQy/fxZuoFAhIaFdfw?=
 =?us-ascii?Q?pHwBK6ak1gDRANUrAvwC6UpR4dV1lq4gASky0h1bBTJPfmDccYlYN57nW8wZ?=
 =?us-ascii?Q?DWOCp73YSNIaY4JxgZbICfD6b5JZuQiNQR+7gwFIODFSHrTtr8HXTwhff4Qk?=
 =?us-ascii?Q?Nu0pMsS55T64pUrZrF8MC8NXPA3wZPlxUrRFSjbqjxKCnxdrSQIwduqz/eGA?=
 =?us-ascii?Q?xQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dedd602-3613-4078-f24d-08dcb21d14ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 11:28:35.4111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6VxVYqK+eS0GFj5bjaiI9An0CYkjqOScjG4UDU4cW1I/P2DQkMXJk/FLvOBPraxELn2Y7Np1RyOtPskFveBNLo2ZqOV3CDtuZxGjCpQRFUkr/1uLS0kvES/0b8lkm3ah
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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

Comments below.

Thanks,
Dominik Karol

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:44 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 08/66] lib/xe_eudebug: Add support for vm_bind
> events
>=20
> Add support for logging and filtering vm_bind events.
>=20
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 488
> +++++++++++++++++++++++++++++++++++++++++---
>  lib/xe/xe_eudebug.h |  45 +++-
>  2 files changed, 507 insertions(+), 26 deletions(-)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c index
> 8a57aaae3..2d1a7092c 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -11,6 +11,7 @@
>  #include <sys/wait.h>
>=20
>  #include "igt.h"
> +#include "intel_pat.h"
>  #include "xe_eudebug.h"
>  #include "xe_ioctl.h"
>=20
> @@ -29,6 +30,12 @@ struct match_dto {
>  	struct drm_xe_eudebug_event *target;
>  	struct igt_list_head *seqno_list;
>  	uint64_t client_handle;
> +	uint32_t filter;
> +
> +	/* store latest 'EVENT_VM_BIND' seqno */
> +	uint64_t *bind_seqno;
> +	/* latest vm_bind_op seqno matching bind_seqno */
> +	uint64_t *bind_op_seqno;
>  };
>=20
>  #define CLIENT_PID  1
> @@ -56,6 +63,12 @@ static const char *type_to_str(unsigned int type)
>  		return "exec_queue";
>  	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION:
>  		return "attention";
> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND:
> +		return "vm_bind";
> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP:
> +		return "vm_bind_op";
> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE:
> +		return "vm_bind_ufence";
>  	}
>=20
>  	return "UNKNOWN";
> @@ -70,15 +83,20 @@ static const char *event_type_to_str(struct
> drm_xe_eudebug_event *e, char *buf)
>=20
>  static const char *flags_to_str(unsigned int flags)  {
> -	if (flags & DRM_XE_EUDEBUG_EVENT_CREATE)
> -		return "create";
> -
> +	if (flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
> +		if (flags & DRM_XE_EUDEBUG_EVENT_NEED_ACK)
> +			return "create|ack";
> +		else
> +			return "create";
> +	}
>  	if (flags & DRM_XE_EUDEBUG_EVENT_DESTROY)
>  		return "destroy";
>=20
>  	if (flags & DRM_XE_EUDEBUG_EVENT_STATE_CHANGE)
>  		return "state-change";
>=20
> +	igt_assert(!(flags & DRM_XE_EUDEBUG_EVENT_NEED_ACK));
> +
>  	return "flags unknown";
>  }
>=20
> @@ -116,6 +134,26 @@ static const char *event_members_to_str(struct
> drm_xe_eudebug_event *e, char *b)
>  			ea->lrc_handle, ea->bitmask_size);
>  		break;
>  	}
> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
> +		struct drm_xe_eudebug_event_vm_bind *evmb =3D (void *)e;
> +
> +		sprintf(b, "client_handle=3D%llu, vm_handle=3D%llu, flags=3D0x%x,
> num_binds=3D%u",
> +			evmb->client_handle, evmb->vm_handle, evmb-
> >flags, evmb->num_binds);
> +		break;
> +	}
> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
> +		struct drm_xe_eudebug_event_vm_bind_op *op =3D (void *)e;
> +
> +		sprintf(b, "vm_bind_ref_seqno=3D%lld, addr=3D%016llx,
> range=3D%llu num_extensions=3D%llu",
> +			op->vm_bind_ref_seqno, op->addr, op->range, op-
> >num_extensions);
> +		break;
> +	}
> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE: {
> +		struct drm_xe_eudebug_event_vm_bind_ufence *f =3D (void
> *)e;
> +
> +		sprintf(b, "vm_bind_ref_seqno=3D%lld", f-
> >vm_bind_ref_seqno);
> +		break;
> +	}
>  	default:
>  		strcpy(b, "<...>");
>  	}
> @@ -362,6 +400,23 @@ static int match_fields(struct
> drm_xe_eudebug_event *a, void *data)
>  			ret =3D 1;
>  		break;
>  	}
> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
> +		struct drm_xe_eudebug_event_vm_bind *ea =3D (void *)a;
> +		struct drm_xe_eudebug_event_vm_bind *eb =3D (void *)b;
> +
> +		if (ea->num_binds =3D=3D eb->num_binds)
> +			ret =3D 1;
> +		break;
> +	}
> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
> +		struct drm_xe_eudebug_event_vm_bind_op *ea =3D (void *)a;
> +		struct drm_xe_eudebug_event_vm_bind_op *eb =3D (void *)b;
> +
> +		if (ea->addr =3D=3D eb->addr && ea->range =3D=3D eb->range &&
> +		    ea->num_extensions =3D=3D eb->num_extensions)
> +			ret =3D 1;
> +		break;
> +	}
>  	default:
>  		ret =3D 1;
>  		break;
> @@ -372,7 +427,13 @@ static int match_fields(struct
> drm_xe_eudebug_event *a, void *data)
>=20
>  static int match_client_handle(struct drm_xe_eudebug_event *e, void *dat=
a)
> {
> -	uint64_t h =3D *(uint64_t *)data;
> +	struct match_dto *md =3D (void *)data;
> +	uint64_t *bind_seqno =3D md->bind_seqno;
> +	uint64_t *bind_op_seqno =3D md->bind_op_seqno;
> +	uint64_t h =3D md->client_handle;
> +
> +	if (XE_EUDEBUG_EVENT_IS_FILTERED(e->type, md->filter))
> +		return 0;
>=20
>  	switch (e->type) {
>  	case DRM_XE_EUDEBUG_EVENT_OPEN: {
> @@ -396,6 +457,32 @@ static int match_client_handle(struct
> drm_xe_eudebug_event *e, void *data)
>  			return 1;
>  		break;
>  	}
> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
> +		struct drm_xe_eudebug_event_vm_bind *evmb =3D (struct
> +drm_xe_eudebug_event_vm_bind *)e;
> +
> +		if (evmb->client_handle =3D=3D h) {
> +			*bind_seqno =3D evmb->base.seqno;
> +			return 1;
> +		}
> +		break;
> +	}
> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
> +		struct drm_xe_eudebug_event_vm_bind_op *eo =3D (struct
> +drm_xe_eudebug_event_vm_bind_op *)e;
> +
> +		if (eo->vm_bind_ref_seqno =3D=3D *bind_seqno) {
> +			*bind_op_seqno =3D eo->base.seqno;
> +			return 1;
> +		}
> +		break;
> +	}
> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE: {
> +		struct drm_xe_eudebug_event_vm_bind_ufence *ef  =3D (struct
> +drm_xe_eudebug_event_vm_bind_ufence *)e;
> +
> +		if (ef->vm_bind_ref_seqno =3D=3D *bind_seqno)
> +			return 1;
> +
> +		break;
> +	}
>  	default:
>  		break;
>  	}
> @@ -410,6 +497,7 @@ static int match_opposite_resource(struct
> drm_xe_eudebug_event *e, void *data)
>  	int ret;
>=20
>  	d->flags ^=3D DRM_XE_EUDEBUG_EVENT_CREATE |
> DRM_XE_EUDEBUG_EVENT_DESTROY;
> +	d->flags &=3D ~(DRM_XE_EUDEBUG_EVENT_NEED_ACK);
>  	ret =3D match_type_and_flags(e, data);
>  	d->flags ^=3D DRM_XE_EUDEBUG_EVENT_CREATE |
> DRM_XE_EUDEBUG_EVENT_DESTROY;
>=20
> @@ -441,6 +529,24 @@ static int match_opposite_resource(struct
> drm_xe_eudebug_event *e, void *data)
>  			return 1;
>  		break;
>  	}
> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
> +		struct drm_xe_eudebug_event_vm_bind *evmb =3D (void *)e;
> +		struct drm_xe_eudebug_event_vm_bind *filter =3D (struct
> +drm_xe_eudebug_event_vm_bind *)data;
> +
> +		if (evmb->vm_handle =3D=3D filter->vm_handle &&
> +		    evmb->num_binds =3D=3D filter->num_binds)
> +			return 1;
> +		break;
> +	}
> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
> +		struct drm_xe_eudebug_event_vm_bind_op *avmb =3D (void
> *)e;
> +		struct drm_xe_eudebug_event_vm_bind_op *filter =3D (struct
> +drm_xe_eudebug_event_vm_bind_op *)data;
> +
> +		if (avmb->addr =3D=3D filter->addr &&
> +		    avmb->range =3D=3D filter->range)
> +			return 1;
> +		break;
> +	}
>  	default:
>  		break;
>  	}
> @@ -454,7 +560,7 @@ static int match_full(struct drm_xe_eudebug_event
> *e, void *data)
>  	struct match_dto *md =3D (void *)data;
>  	int ret =3D 0;
>=20
> -	ret =3D match_client_handle(e, &md->client_handle);
> +	ret =3D match_client_handle(e, md);
>  	if (!ret)
>  		return 0;
>=20
> @@ -472,51 +578,67 @@ static int match_full(struct
> drm_xe_eudebug_event *e, void *data)
>=20
>  static struct drm_xe_eudebug_event *
>  event_type_match(struct xe_eudebug_event_log *l,
> -		 struct drm_xe_eudebug_event *filter,
> +		 struct drm_xe_eudebug_event *target,
>  		 struct drm_xe_eudebug_event *current)  {
> -	return event_cmp(l, current, match_type_and_flags, filter);
> +	return event_cmp(l, current, match_type_and_flags, target);
>  }
>=20
>  static struct drm_xe_eudebug_event *
>  client_match(struct xe_eudebug_event_log *l,
>  	     uint64_t client_handle,
> -	     struct drm_xe_eudebug_event *current)
> +	     struct drm_xe_eudebug_event *current,
> +	     uint32_t filter,
> +	     uint64_t *bind_seqno,
> +	     uint64_t *bind_op_seqno)
>  {
> -	return event_cmp(l, current, match_client_handle, &client_handle);
> +	struct match_dto md =3D {
> +		.client_handle =3D client_handle,
> +		.filter =3D filter,
> +		.bind_seqno =3D bind_seqno,
> +		.bind_op_seqno =3D bind_op_seqno,
> +	};
> +
> +	return event_cmp(l, current, match_client_handle, &md);
>  }
>=20
>  static struct drm_xe_eudebug_event *
>  opposite_event_match(struct xe_eudebug_event_log *l,
> -		    struct drm_xe_eudebug_event *filter,
> +		    struct drm_xe_eudebug_event *target,
>  		    struct drm_xe_eudebug_event *current)  {
> -	return event_cmp(l, current, match_opposite_resource, filter);
> +	return event_cmp(l, current, match_opposite_resource, target);
>  }
>=20
>  static struct drm_xe_eudebug_event *
>  event_match(struct xe_eudebug_event_log *l,
>  	    struct drm_xe_eudebug_event *target,
>  	    uint64_t client_handle,
> -	    struct igt_list_head *seqno_list)
> +	    struct igt_list_head *seqno_list,
> +	    uint64_t *bind_seqno,
> +	    uint64_t *bind_op_seqno)
>  {
>  	struct match_dto md =3D {
>  		.target =3D target,
>  		.client_handle =3D client_handle,
>  		.seqno_list =3D seqno_list,
> +		.bind_seqno =3D bind_seqno,
> +		.bind_op_seqno =3D bind_op_seqno,
>  	};
>=20
>  	return event_cmp(l, NULL, match_full, &md);  }
>=20
>  static void compare_client(struct xe_eudebug_event_log *c, struct
> drm_xe_eudebug_event *_ce,
> -			   struct xe_eudebug_event_log *d, struct
> drm_xe_eudebug_event *_de)
> +			   struct xe_eudebug_event_log *d, struct
> drm_xe_eudebug_event *_de,
> +			   uint32_t filter)
>  {
>  	struct drm_xe_eudebug_event_client *ce =3D (void *)_ce;
>  	struct drm_xe_eudebug_event_client *de =3D (void *)_de;
> -	struct drm_xe_eudebug_event *hc, *hd;
> +	uint64_t cbs =3D 0, dbs =3D 0, cbso =3D 0, dbso =3D 0;
>=20
>  	struct igt_list_head matched_seqno_list;
> +	struct drm_xe_eudebug_event *hc, *hd;
>  	struct seqno_list_entry *entry, *tmp;
>=20
>  	igt_assert(ce);
> @@ -529,11 +651,11 @@ static void compare_client(struct
> xe_eudebug_event_log *c, struct drm_xe_eudebug
>  	IGT_INIT_LIST_HEAD(&matched_seqno_list);
>=20
>  	do {
> -		hc =3D client_match(c, ce->client_handle, hc);
> +		hc =3D client_match(c, ce->client_handle, hc, filter, &cbs, &cbso);
>  		if (!hc)
>  			break;
>=20
> -		hd =3D event_match(d, hc, de->client_handle,
> &matched_seqno_list);
> +		hd =3D event_match(d, hc, de->client_handle,
> &matched_seqno_list, &dbs,
> +&dbso);
>=20
>  		igt_assert_f(hd, "%s (%llu): no matching event type %u found
> for client %llu\n",
>  			     c->name,
> @@ -720,11 +842,15 @@ xe_eudebug_event_log_print(struct
> xe_eudebug_event_log *l, bool debug)
>   * xe_eudebug_event_log_compare:
>   * @a: event log pointer
>   * @b: event log pointer
> + * @filter: mask that represents events to be skipped during
> + comparison, useful
> + * for events like 'VM_BIND' since they can be asymmetric. Note that
> + * 'DRM_XE_EUDEUBG_EVENT_OPEN' will always be matched.

Typo: DRM_XE_EUDEBUG_EVENT_OPEN

>   *
>   * Compares and asserts event logs @a, @b if the event
>   * sequence matches.
>   */
> -void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *a,
> struct xe_eudebug_event_log *b)
> +void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *a,
> struct xe_eudebug_event_log *b,
> +				  uint32_t filter)
>  {
>  	struct drm_xe_eudebug_event *ae =3D NULL;
>  	struct drm_xe_eudebug_event *be =3D NULL; @@ -734,8 +860,8 @@
> void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *a, struct
> xe_eude
>  		    ae->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
>  			be =3D event_type_match(b, ae, be);
>=20
> -			compare_client(a, ae, b, be);
> -			compare_client(b, be, a, ae);
> +			compare_client(a, ae, b, be, filter);
> +			compare_client(b, be, a, ae, filter);
>  		}
>  	}
>  }
> @@ -743,11 +869,13 @@ void xe_eudebug_event_log_compare(struct
> xe_eudebug_event_log *a, struct xe_eude
>  /**
>   * xe_eudebug_event_log_match_opposite:
>   * @l: event log pointer
> + * @filter: mask that represents events to be skipped during
> + comparison, useful
> + * for events like 'VM_BIND' since they can be asymmetric
>   *
>   * Matches and asserts content of all opposite events (create vs destroy=
).
>   */
>  void
> -xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l)
> +xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l,
> +uint32_t filter)
>  {
>  	struct drm_xe_eudebug_event *ce =3D NULL;
>  	struct drm_xe_eudebug_event *de =3D NULL; @@ -757,6 +885,14 @@
> xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l)
>  			uint8_t offset =3D sizeof(struct
> drm_xe_eudebug_event);
>  			int opposite_matching;
>=20
> +			if (XE_EUDEBUG_EVENT_IS_FILTERED(ce->type, filter))
> +				continue;
> +
> +			/* No opposite matching for binds */
> +			if (ce->type >=3D DRM_XE_EUDEBUG_EVENT_VM_BIND
> &&
> +			    ce->type <=3D
> DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
> +				continue;
> +
>  			de =3D opposite_event_match(l, ce, ce);
>=20
>  			igt_assert_f(de, "no opposite event of type %u
> found\n", ce->type); @@ -1267,15 +1403,17 @@ void
> xe_eudebug_session_run(struct xe_eudebug_session *s)
>   * @s: pointer to xe_eudebug_session structure
>   * @match_opposite: indicates whether check should match all
>   * create and destroy events.
> + * @filter: mask that represents events to be skipped during
> + comparison, useful
> + * for events like 'VM_BIND' since they can be asymmetric
>   *
>   * Validate debugger's log against the log created by the client.
>   */
> -void xe_eudebug_session_check(struct xe_eudebug_session *s, bool
> match_opposite)
> +void xe_eudebug_session_check(struct xe_eudebug_session *s, bool
> +match_opposite, uint32_t filter)
>  {
> -	xe_eudebug_event_log_compare(s->c->log, s->d->log);
> +	xe_eudebug_event_log_compare(s->c->log, s->d->log, filter);
>=20
>  	if (match_opposite)
> -		xe_eudebug_event_log_match_opposite(s->d->log);
> +		xe_eudebug_event_log_match_opposite(s->d->log, filter);
>  }
>=20
>  /**
> @@ -1467,3 +1605,307 @@ void
> xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
>=20
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY,
> &destroy), 0);  }
> +
> +/**
> + * xe_eudebug_client_vm_bind_event:
> + * @c: pointer to xe_eudebug_client structure
> + * @event_flags: base event flags
> + * @fd: xe client
> + * @vm: vm handle
> + * @bind_flags: bind flags of vm_bind_event
> + * @num_binds: number of bind (operations) for event
> + * @ref_seqno: base vm bind reference seqno
> + * Logs vm bind event in client's event log.
> + */
> +void xe_eudebug_client_vm_bind_event(struct xe_eudebug_client *c,
> +				     uint32_t event_flags, int fd,
> +				     uint32_t vm, uint32_t bind_flags,
> +				     uint32_t num_binds, u64 *ref_seqno) {
> +	struct drm_xe_eudebug_event_vm_bind evmb;
> +
> +	base_event(c, to_base(evmb),
> DRM_XE_EUDEBUG_EVENT_VM_BIND,
> +		   event_flags, sizeof(evmb));
> +	evmb.client_handle =3D fd;
> +	evmb.vm_handle =3D vm;
> +	evmb.flags =3D bind_flags;
> +	evmb.num_binds =3D num_binds;
> +
> +	*ref_seqno =3D evmb.base.seqno;
> +
> +	xe_eudebug_event_log_write(c->log, (void *)&evmb); }
> +
> +/**
> + * xe_eudebug_client_vm_bind_op_event:
> + * @c: pointer to xe_eudebug_client structure
> + * @event_flags: base event flags
> + * @bind_ref_seqno: base vm bind reference seqno
> + * @op_ref_seqno: output, the vm_bind_op event seqno
> + * @addr: ppgtt address
> + * @size: size of the binding
> + * @num_extensions: number of vm bind op extensions
> + *
> + * Logs vm bind op event in client's event log.
> + */
> +void xe_eudebug_client_vm_bind_op_event(struct xe_eudebug_client *c,
> uint32_t event_flags,
> +					uint64_t bind_ref_seqno, uint64_t
> *op_ref_seqno,
> +					uint64_t addr, uint64_t range,
> +					uint64_t num_extensions)
> +{
> +	struct drm_xe_eudebug_event_vm_bind_op op;
> +
> +	base_event(c, to_base(op),
> DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
> +		   event_flags, sizeof(op));
> +	op.vm_bind_ref_seqno =3D bind_ref_seqno;
> +	op.addr =3D addr;
> +	op.range =3D range;
> +	op.num_extensions =3D num_extensions;
> +
> +	*op_ref_seqno =3D op.base.seqno;
> +
> +	xe_eudebug_event_log_write(c->log, (void *)&op); }
> +
> +/**
> + * xe_eudebug_client_vm_bind_op_metadata_event:
> + * @c: pointer to xe_eudebug_client structure
> + * @event_flags: base event flags
> + * @op_ref_seqno: base vm bind op reference seqno
> + * @metadata_handle: metadata handle
> + * @metadata_cookie: metadata cookie
> + *
> + * Logs vm bind op metadata event in client's event log.
> + */
> +void xe_eudebug_client_vm_bind_op_metadata_event(struct
> xe_eudebug_client *c,
> +						 uint32_t event_flags,
> uint64_t op_ref_seqno,
> +						 uint64_t metadata_handle,
> uint64_t metadata_cookie) {
> +	struct drm_xe_eudebug_event_vm_bind_op_metadata op;
> +
> +	base_event(c, to_base(op),
> DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA,
> +		   event_flags, sizeof(op));
> +	op.vm_bind_op_ref_seqno =3D op_ref_seqno;
> +	op.metadata_handle =3D metadata_handle;
> +	op.metadata_cookie =3D metadata_cookie;
> +
> +	xe_eudebug_event_log_write(c->log, (void *)&op); }
> +
> +/**
> + * xe_eudebug_client_vm_bind_ufence_event:
> + * @c: pointer to xe_eudebug_client structure
> + * @event_flags: base event flags
> + * @ref_seqno: base vm bind event seqno
> + *
> + * Logs vm bind ufence event in client's event log.
> + */
> +void xe_eudebug_client_vm_bind_ufence_event(struct xe_eudebug_client
> *c, uint32_t event_flags,
> +					    uint64_t ref_seqno)
> +{
> +	struct drm_xe_eudebug_event_vm_bind_ufence f;
> +
> +	base_event(c, to_base(f),
> DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
> +		   event_flags, sizeof(f));
> +	f.vm_bind_ref_seqno =3D ref_seqno;
> +
> +	xe_eudebug_event_log_write(c->log, (void *)&f); }
> +
> +static bool has_user_fence(const struct drm_xe_sync *sync, uint32_t
> +num_syncs) {
> +	while (num_syncs--)
> +		if (sync[num_syncs].type =3D=3D
> DRM_XE_SYNC_TYPE_USER_FENCE)
> +			return true;
> +
> +	return false;
> +}
> +
> +#define for_each_metadata(__m, __ext)
> 	\
> +	for ((__m) =3D from_user_pointer(__ext);				\
> +	     (__m);							\
> +	     (__m) =3D from_user_pointer((__m)->base.next_extension))	\
> +		if ((__m)->base.name =3D=3D
> XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG)
> +
> +static int  __xe_eudebug_client_vm_bind(struct xe_eudebug_client *c,
> +					int fd, uint32_t vm, uint32_t
> exec_queue,
> +					uint32_t bo, uint64_t offset,
> +					uint64_t addr, uint64_t size,
> +					uint32_t op, uint32_t flags,
> +					struct drm_xe_sync *sync,
> +					uint32_t num_syncs,
> +					uint32_t prefetch_region,
> +					uint8_t pat_index, uint64_t op_ext) {
> +	struct drm_xe_vm_bind_op_ext_attach_debug *metadata;
> +	const bool ufence =3D has_user_fence(sync, num_syncs);
> +	const uint32_t bind_flags =3D ufence ?
> +		DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE : 0;
> +	uint64_t seqno =3D 0, op_seqno =3D 0, num_metadata =3D 0;
> +	uint32_t bind_base_flags =3D 0;
> +	int ret;
> +
> +	for_each_metadata(metadata, op_ext)
> +		num_metadata++;
> +
> +	switch (op) {
> +	case DRM_XE_VM_BIND_OP_MAP:
> +		bind_base_flags =3D DRM_XE_EUDEBUG_EVENT_CREATE;
> +		break;
> +	case DRM_XE_VM_BIND_OP_UNMAP:
> +		bind_base_flags =3D DRM_XE_EUDEBUG_EVENT_DESTROY;
> +		igt_assert_eq(num_metadata, 0);
> +		igt_assert_eq(ufence, false);
> +		break;
> +	default:
> +		/* XXX unmap all? */
> +		igt_assert(op);
> +		break;
> +	}
> +
> +	ret =3D ___xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
> +			    op, flags, sync, num_syncs, prefetch_region,
> +			    pat_index, 0, op_ext);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (!bind_base_flags)
> +		return -EINVAL;
> +
> +	xe_eudebug_client_vm_bind_event(c,
> DRM_XE_EUDEBUG_EVENT_STATE_CHANGE,
> +					fd, vm, bind_flags, 1, &seqno);
> +	xe_eudebug_client_vm_bind_op_event(c, bind_base_flags,
> +					   seqno, &op_seqno, addr, size,
> +					   num_metadata);
> +
> +	for_each_metadata(metadata, op_ext)
> +		xe_eudebug_client_vm_bind_op_metadata_event(c,
> +
> DRM_XE_EUDEBUG_EVENT_CREATE,
> +							    op_seqno,
> +							    metadata-
> >metadata_id,
> +							    metadata->cookie);
> +	if (ufence)
> +		xe_eudebug_client_vm_bind_ufence_event(c,
> DRM_XE_EUDEBUG_EVENT_CREATE |
> +
> DRM_XE_EUDEBUG_EVENT_NEED_ACK,
> +						       seqno);
> +	return ret;
> +}
> +
> +static void _xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int =
fd,
> +				       uint32_t vm, uint32_t bo,
> +				       uint64_t offset, uint64_t addr, uint64_t
> size,
> +				       uint32_t op,
> +				       uint32_t flags,
> +				       struct drm_xe_sync *sync,
> +				       uint32_t num_syncs,
> +				       uint64_t op_ext)
> +{
> +	const uint32_t exec_queue_id =3D 0;
> +	const uint32_t prefetch_region =3D 0;
> +
> +	igt_assert_eq(__xe_eudebug_client_vm_bind(c, fd, vm,
> exec_queue_id, bo, offset,
> +						  addr, size, op, flags,
> +						  sync, num_syncs,
> prefetch_region,
> +						  DEFAULT_PAT_INDEX,
> op_ext),
> +		      0);
> +}
> +
> +/**
> + * xe_eudebug_client_vm_bind_flags
> + * @c: pointer to xe_eudebug_client structure
> + * @fd: xe client
> + * @vm: vm handle
> + * @bo: buffer object handle
> + * @offset: offset within buffer object
> + * @addr: ppgtt address
> + * @size: size of the binding
> + * @flags: vm_bind flags
> + * @sync: sync objects
> + * @num_syncs: number of sync objects
> + * @op_ext: BIND_OP extensions
> + *
> + * Calls xe vm_bind ioctl and logs the corresponding event in client's e=
vent log.
> + */
> +void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, int fd=
,
> uint32_t vm,
> +				     uint32_t bo, uint64_t offset,
> +				     uint64_t addr, uint64_t size, uint32_t flags,
> +				     struct drm_xe_sync *sync, uint32_t
> num_syncs,
> +				     uint64_t op_ext)
> +{
> +	_xe_eudebug_client_vm_bind(c, fd, vm, bo, offset, addr, size,
> +				   DRM_XE_VM_BIND_OP_MAP, flags,
> +				   sync, num_syncs, op_ext);
> +}
> +
> +/**
> + * xe_eudebug_client_vm_bind
> + * @c: pointer to xe_eudebug_client structure
> + * @fd: xe client
> + * @vm: vm handle
> + * @bo: buffer object handle
> + * @offset: offset within buffer object
> + * @addr: ppgtt address
> + * @size: size of the binding
> + *
> + * Calls xe vm_bind ioctl and logs the corresponding event in client's e=
vent log.
> + */
> +void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd,
> uint32_t vm,
> +			       uint32_t bo, uint64_t offset,
> +			       uint64_t addr, uint64_t size) {
> +	const uint32_t flags =3D 0;
> +	struct drm_xe_sync *sync =3D NULL;
> +	const uint32_t num_syncs =3D 0;
> +	const uint64_t op_ext =3D 0;
> +
> +	xe_eudebug_client_vm_bind_flags(c, fd, vm, bo, offset, addr, size,
> +					flags,
> +					sync, num_syncs, op_ext);
> +}
> +
> +/**
> + * xe_eudebug_client_vm_unbind_flags
> + * @c: pointer to xe_eudebug_client structure
> + * @fd: xe client
> + * @vm: vm handle
> + * @offset: offset
> + * @addr: ppgtt address
> + * @size: size of the binding
> + * @flags: vm_bind flags
> + * @sync: sync objects
> + * @num_syncs: number of sync objects
> + *
> + * Calls xe vm_unbind ioctl and logs the corresponding event in client's=
 event
> log.
> + */
> +void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c, int
> fd,
> +				       uint32_t vm, uint64_t offset,
> +				       uint64_t addr, uint64_t size, uint32_t
> flags,
> +				       struct drm_xe_sync *sync, uint32_t
> num_syncs) {
> +	_xe_eudebug_client_vm_bind(c, fd, vm, 0, offset, addr, size,
> +				   DRM_XE_VM_BIND_OP_UNMAP, flags,
> +				   sync, num_syncs, 0);
> +}
> +
> +/**
> + * xe_eudebug_client_vm_unbind
> + * @c: pointer to xe_eudebug_client structure
> + * @fd: xe client
> + * @vm: vm handle
> + * @offset: offset
> + * @addr: ppgtt address
> + * @size: size of the binding
> + *
> + * Calls xe vm_unbind ioctl and logs the corresponding event in client's=
 event
> log.
> + */
> +void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, int fd,
> uint32_t vm,
> +				 uint64_t offset, uint64_t addr, uint64_t size)
> {
> +	const uint32_t flags =3D 0;
> +	struct drm_xe_sync *sync =3D NULL;
> +	const uint32_t num_syncs =3D 0;
> +
> +	xe_eudebug_client_vm_unbind_flags(c, fd, vm, offset, addr, size,
> +					  flags, sync, num_syncs);
> +}
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h index
> 8dc153d27..1592704ab 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -99,6 +99,18 @@ typedef void (*xe_eudebug_trigger_fn)(struct
> xe_eudebug_debugger *,
>   */
>  #define XE_EUDEBUG_DEFAULT_TIMEOUT_MS		25000ULL
>=20
> +#define XE_EUDEBUG_FILTER_EVENT_NONE
> 	BIT(DRM_XE_EUDEBUG_EVENT_NONE)
> +#define XE_EUDEBUG_FILTER_EVENT_READ
> 	BIT(DRM_XE_EUDEBUG_EVENT_READ)
> +#define XE_EUDEBUG_FILTER_EVENT_OPEN
> 	BIT(DRM_XE_EUDEBUG_EVENT_OPEN)
> +#define XE_EUDEBUG_FILTER_EVENT_VM
> 	BIT(DRM_XE_EUDEBUG_EVENT_VM)
> +#define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE
> 	BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
> +#define XE_EUDEBUG_FILTER_EVENT_EU_ATTENTION
> 	BIT(DRM_XE_EUDEBUG_EVENT_EU_ATTENTION)
> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND
> 	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND)
> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP
> 	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE
> BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
> +#define XE_EUDEUBG_FILTER_ALL

Typo: XE_EUDEBUG_FILTER_ALL

> 	GENMASK(DRM_XE_EUDEBUG_EVENT_MAX_EVENT, 0)
> +#define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)	((1UL << _e) & _f)
> +
>  const char *xe_eudebug_event_to_str(struct drm_xe_eudebug_event *e,
> char *buf, size_t len);  struct drm_xe_eudebug_event *
> xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t
> seqno); @@ -106,9 +118,10 @@ struct xe_eudebug_event_log *
> xe_eudebug_event_log_create(const char *name, unsigned int max_size);
> void xe_eudebug_event_log_destroy(struct xe_eudebug_event_log *l);  void
> xe_eudebug_event_log_print(struct xe_eudebug_event_log *l, bool debug); -
> void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *c, struct
> xe_eudebug_event_log *d);
> +void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *c,
> struct xe_eudebug_event_log *d,
> +				  uint32_t filter);
>  void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct
> drm_xe_eudebug_event *e); -void
> xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l);
> +void xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log
> +*l, uint32_t filter);
>=20
>  struct xe_eudebug_debugger *
>  xe_eudebug_debugger_create(int xe, uint64_t flags, void *data); @@ -142,=
6
> +155,32 @@ uint32_t xe_eudebug_client_exec_queue_create(struct
> xe_eudebug_client *c, int fd
>  					     struct drm_xe_exec_queue_create
> *create);  void xe_eudebug_client_exec_queue_destroy(struct
> xe_eudebug_client *c, int fd,
>  					  struct drm_xe_exec_queue_create
> *create);
> +void xe_eudebug_client_vm_bind_event(struct xe_eudebug_client *c,
> uint32_t event_flags, int fd,
> +				     uint32_t vm, uint32_t bind_flags,
> +				     uint32_t num_ops, uint64_t *ref_seqno);
> void
> +xe_eudebug_client_vm_bind_op_event(struct xe_eudebug_client *c,
> uint32_t event_flags,
> +					uint64_t ref_seqno, uint64_t
> *op_ref_seqno,
> +					uint64_t addr, uint64_t range,
> +					uint64_t num_extensions);
> +void xe_eudebug_client_vm_bind_op_metadata_event(struct
> xe_eudebug_client *c,
> +						 uint32_t event_flags,
> uint64_t op_ref_seqno,
> +						 uint64_t metadata_handle,
> uint64_t metadata_cookie); void
> +xe_eudebug_client_vm_bind_ufence_event(struct xe_eudebug_client *c,
> uint32_t event_flags,
> +					    uint64_t ref_seqno);
> +void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, int fd=
,
> uint32_t vm,
> +				     uint32_t bo, uint64_t offset,
> +				     uint64_t addr, uint64_t size, uint32_t flags,
> +				     struct drm_xe_sync *sync, uint32_t
> num_syncs,
> +				     uint64_t op_ext);
> +void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd,
> uint32_t vm,
> +			       uint32_t bo, uint64_t offset,
> +			       uint64_t addr, uint64_t size); void
> +xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c, int fd,
> +				       uint32_t vm, uint64_t offset,
> +				       uint64_t addr, uint64_t size, uint32_t
> flags,
> +				       struct drm_xe_sync *sync, uint32_t
> num_syncs); void
> +xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, int fd, uint32_=
t
> vm,
> +				 uint64_t offset, uint64_t addr, uint64_t size);
>=20
>  struct xe_eudebug_session *xe_eudebug_session_create(int fd,
>=20
> xe_eudebug_client_work_fn work, @@ -149,4 +188,4 @@ struct
> xe_eudebug_session *xe_eudebug_session_create(int fd,
>  						     void *test_private);
>  void xe_eudebug_session_destroy(struct xe_eudebug_session *s);  void
> xe_eudebug_session_run(struct xe_eudebug_session *s); -void
> xe_eudebug_session_check(struct xe_eudebug_session *s, bool
> match_opposite);
> +void xe_eudebug_session_check(struct xe_eudebug_session *s, bool
> +match_opposite, uint32_t filter);
> --
> 2.34.1

