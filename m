Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD8FCA0EC6
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 11:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8A210E1D7;
	Mon, 18 Aug 2025 11:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iI/xwXas";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D09210E1D7
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 11:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755515546; x=1787051546;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j9Yk6upNhfNFe6EQPLy6713qboNNX0aE5NOBGP2nlsM=;
 b=iI/xwXasq61dFCHj4F4XbPNx5vwYDQzZD8Eju+L6dFM6VxN3RByNj1hZ
 /MTIGHIAZh87zVlX/wBEeyNJx8zZdTeLd5juvBRRzIma7SeLVPQ7MiWpF
 HSoZQJSqsvVLnHKaOPrFj6l2ueiovk4J/ByjUaiNVk8NqNmbT9kCEuJSD
 iQBhO1bXrKiN58wdRQrRCMQ295/l8dIvPmo8pH90tWkK4poL3lPF2qCAx
 mz13v3vgLUj+bbnmLoPR61fyqdggBUIqAuG6qMIGP5hb0LjkQr29jnu/h
 0zQ2ssfXSkj+Cn8Ph5jeTtqCPSvmNFNV7+zIRUPQkA64K3mcfD8vLa9pG Q==;
X-CSE-ConnectionGUID: hfnJWwt4RwqX/H85Tte6DA==
X-CSE-MsgGUID: NUi1npflSBmsM3P9e151oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57663142"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57663142"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 04:12:26 -0700
X-CSE-ConnectionGUID: 6RHfVzmyQ+qGFsVvd4bKcw==
X-CSE-MsgGUID: anXkME+pS6CKXkgPuaGTMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="168360960"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 04:12:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 04:12:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 04:12:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.88)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 04:12:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0TyB/q/ivrYTfddXiDJea7OiR8xFkpO1k6SLlJZx5sLeuRjSwSTwO5TfQ7Z7NheMygNblaNeRAZKYH/hYRP1kO2V1VqYU4uqLvo7iwHx7L1ID89J8oE1GW3wJRzb02XkO3vH6ks8UrCHm7qFF/DkoXnPq3J2bhiDyc1bsT8eFd6OGoxI+YqPIEJ+/mpW02DdqK8E207pKvDWyWmdugYvmKajmGrAcVbhtzMBCw2p4o0BbUGtzAJKKoRCUSq0gzPSceIx3MBYR1GtQphigYUnqRYCitNG4O2E9kr4j4eF3Bpn413S+dqVMHDVyeQXfx3+qwidsB0jV0sYp3yniDAfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9Yk6upNhfNFe6EQPLy6713qboNNX0aE5NOBGP2nlsM=;
 b=gyQth/CDwCBKcoEMtEcG/izI2M9K13Ifry55sqEbO+EyqkYef+Nl8WrQJGuRlg9l+qjwT4c516/0wdpW2H5MbdjqVvDCzq8l2Aw1QYi/fRwZ9PFlUoDbq9zMAu/eBZtgsJvz9MdIrg+/ukvnYa3fSodV3cUX5a+SXNCEt+ZH+iHbtc5QsdKWvH60HCfo6EXbZ7D98vXrXNDwfYCqVSg/XNlPu2lMlTAvh6rFRjNHudbiewKBpKgr+oti+CYurWMQ1Ujt3WMkZSG40VuWtMYE5Vudfwg1DvbYvMnAFmYF3Ko7QXEa+7T0icjVqRkKEIafq6f0wloQLY/zPc3Gm5U6Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com (2603:10b6:a03:2db::18)
 by MW4PR11MB5890.namprd11.prod.outlook.com (2603:10b6:303:188::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 11:12:14 +0000
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8]) by SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8%5]) with mapi id 15.20.9031.021; Mon, 18 Aug 2025
 11:12:14 +0000
From: "Grzelak, Michal" <michal.grzelak@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 1/1] tests/kms_cursor_legacy: don't inhibit pipe
 CRC calculation
Thread-Topic: [PATCH i-g-t v2 1/1] tests/kms_cursor_legacy: don't inhibit pipe
 CRC calculation
Thread-Index: AQHb+wa/yNJaqj6h60GSkYNdD51g2LRUEm4AgA/MLMA=
Date: Mon, 18 Aug 2025 11:12:13 +0000
Message-ID: <SJ0PR11MB5072D1C4AE47ECE5E2C779E58F31A@SJ0PR11MB5072.namprd11.prod.outlook.com>
References: <20250722124823.912472-1-michal.grzelak@intel.com>
 <20250722124823.912472-2-michal.grzelak@intel.com>
 <a9dd0500-8687-4710-b5f3-802b8c8decfa@intel.com>
In-Reply-To: <a9dd0500-8687-4710-b5f3-802b8c8decfa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5072:EE_|MW4PR11MB5890:EE_
x-ms-office365-filtering-correlation-id: 31ca82ad-4a55-4529-2b78-08ddde4815c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?tI3tDkDKLqjUS8ciun2AcNrcR9NG9AprwaHifu3jWQMsGCbd65xTwg1FoX?=
 =?iso-8859-2?Q?9uOzWuchVoKrZAh0Q+bAHa+6NCiYlvJKJfMpDa0A5J1sgRwA8x8Hqcohcq?=
 =?iso-8859-2?Q?1mix7YfAZLrX20jOR9RDPrdVQEu4FimhZ/DpeWQJI8+fH7mfC9uI5caEq4?=
 =?iso-8859-2?Q?95CgZX1qmAFBGqWWzozafj2Jo5JUhUgvGUjwqrEOELAoQE2+PeWxiyzztZ?=
 =?iso-8859-2?Q?YR/ilDUIMKkuRwMoqHZbHUQF0X/hHiAoU0IKVxMw6B1eonqiLWxjStM6CS?=
 =?iso-8859-2?Q?v/JOSNkjojb5e8/1dAqtsmSxOAYKh8BsKmh2YaSreqHnkKvwml7BFVUz9K?=
 =?iso-8859-2?Q?L2q/qFAuVMl1Qb7mSyDhkny0a3KnAJtQtFdz5u7ldbGJfnKb/3sRsd58v6?=
 =?iso-8859-2?Q?0AmcbGRBM76f+35Ew3trV4vzhvi79W0F1G13XQuLZnRlwJRkgzMPBn9Dqq?=
 =?iso-8859-2?Q?Ob6vbayc53jZH4m3tKrYJOAkjGKpvtruJwQhdB0WO7KSwy/4vJJdpibBJj?=
 =?iso-8859-2?Q?8Lh2X01JPXQ/b/a5UsGI9WD9sa7uLxBCwTJl3guVShOIytEPsUoHMZ+Pvj?=
 =?iso-8859-2?Q?+716/Zb338IYfZrE7BP5VNTkKl065HGHXf2tn0vU/NlrScuI11JQPa6WPM?=
 =?iso-8859-2?Q?S50kof2Oy7EOa6pqG3hmG4wYRECSzw8Dy1WjxSk7e2sPhM/5AmsbBMY4bz?=
 =?iso-8859-2?Q?2I/rpiilLWnWecHPX0mnRRfeARlccSkS0YlncYM51+kj5s2KKu0I6QVnDE?=
 =?iso-8859-2?Q?GqeohpturGy71RInpOZE/tXqgCfGU/94mb7npS+ON4aovQp5y+jYqTjD9w?=
 =?iso-8859-2?Q?0sYphPOmhhDeRTG2eeJiZESf/phRRXN2dln6feMCUBMmY8cppsA8jgilag?=
 =?iso-8859-2?Q?XYBNQDeaAzjBb3a4bd+wY7BYuIrPo/2EFgpofigiOq3zAhRFgZjOE6O+0v?=
 =?iso-8859-2?Q?+AWnTD4Fmj1363kqKYCLLxBH08EP0kzAryBM61nhj/JxXRsZPFqp1fY1W0?=
 =?iso-8859-2?Q?9lohPUcNa75gr+8aULPPbZziUh83EzCIcR6JyGum4arpqrFc6IJQdwa/NH?=
 =?iso-8859-2?Q?Ze/BzrviO8KI0Gf0lDO2Q8SC8pGli42HeQitV9JjvtWeZ6KsTaTCwOKHgi?=
 =?iso-8859-2?Q?YDHk/1fY+Z23YmUzdTS9Lrk0JY75kszDeUzZX8tOQsJXCGYZzLmh9uf70C?=
 =?iso-8859-2?Q?HzCjBfePX53FBrzt5g1XUmQhqWP/zmBecsrX3TWcf0wjbv9wKBqEBVIgaa?=
 =?iso-8859-2?Q?0eedPHY0VTn9YF9UdM1k3SDNB6TGxwa3oANs1rP7NX1e+juZ7DUx4HqXGq?=
 =?iso-8859-2?Q?yrVhcysTnW+3hlD8jWQH3IknAc8AlH4VHywtB9aRFiwBrJq2as3w+SbEOg?=
 =?iso-8859-2?Q?rwQiXInvl3CJ50W7DxjdFN9aFgSJpW4D0CvK3Be4++g2xKMd2+N9A9I0F7?=
 =?iso-8859-2?Q?i3qJk/dV3u4/0zF+vR1MFWNwJSuSLiecbV79Uj+/Li/zIOPbdncpJT2Aof?=
 =?iso-8859-2?Q?9h++BaIJZytAtiO1IGSa5ImBrtcU4koHCmaBP2KezceO4rGCPyU0N6UY4Q?=
 =?iso-8859-2?Q?mBoiXZI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5072.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?qV1P2YcTIHdZUCrN7/oaUZg7Yo7ExyVbaw1Uc5nrqHFBp8BOKzrmTRnDAF?=
 =?iso-8859-2?Q?8URy5roAa3pPndm1KMfkya3Y2XukpUdGC5ClVgFSYxlsndP5vVjp5M2D3X?=
 =?iso-8859-2?Q?PyAsZ2YsMGoLC/a4bHUkeafJg5atYsLbT4gIEUG7a2ZnTj2FB/DA+V09Rw?=
 =?iso-8859-2?Q?Uarfn7jqcWquIMui1TWWUObOfkMVnX9wIinJDA4pM+1zWY0zWd+zAI7tBe?=
 =?iso-8859-2?Q?qgYRZw1xgeRV+dxU2ox4Tnd7TmFM0sFkEAm0DyCXlyG5jABfEKVqWfBwIg?=
 =?iso-8859-2?Q?wrkiQpZBO7iJsNLZZqbrU/NjA0yaAozE2Q1oq/1J8diDsUbyBAiHR0z6Av?=
 =?iso-8859-2?Q?FstT74wRb5jDN2DPoeMqlNrW0Vk3euLCQyZR32cPvu58N4VqWx0Jytx+Fj?=
 =?iso-8859-2?Q?YFFiTgAN5GHzPUBgnQHFFcTaWog8o/TA/5C0Bp84ylSl7AM33IagcoJP2g?=
 =?iso-8859-2?Q?IrRzx6DfgmUQLZ22cQL9/geK65Dh4ZnG/IK7FEMKoSxQOMb1yCijLxc5uv?=
 =?iso-8859-2?Q?PRBHjRiMdZpXXIxVnRqcftlJKthgRiZDu33goF+DTkp4iQddFG+YdWT57k?=
 =?iso-8859-2?Q?dmyCGSgAN2BMgvKvHNHUCJylVAxb7zBtp/Lr63pX3CdnDnmi2IkHH1gtVE?=
 =?iso-8859-2?Q?wMsH4QM6MHtJa0knYmwri2PZ7h9lzEQ9J8OlPNYoKBCpzJZjlrQwCU7lxe?=
 =?iso-8859-2?Q?rokBIHVcl/zjeR7zDg4hpbWaMIsEYkpSS7r2MDmQ03jx5TBKVGRvtksrPr?=
 =?iso-8859-2?Q?nABlnctCP210w8E3rKQ2lQ4EWA+YvFb2oKTWPJpc3uk7OUjHq717KbUbDl?=
 =?iso-8859-2?Q?83/CUNACUEunTHIwGsK55934z1QKj8+AYRfyg4PZi5C524AY4SjaVds5zh?=
 =?iso-8859-2?Q?1E2H8gLp3h1G6vqJizvcMvTPRzT/XiZWizuvYiSe4T4yYv0KhEfNq3i0xI?=
 =?iso-8859-2?Q?5YoHBvaTAF/BcXFq1PlYQBuQMOYYokHEvvQ2MIen/DsQm/d8ggLMvm9xk7?=
 =?iso-8859-2?Q?cUxePFwNZqpkX+egbJZ05+mXnKXI04frHoKrU9J56Wi3QrawZ8ogAhf0pZ?=
 =?iso-8859-2?Q?RIKiP3MltyFEs3obLgm43y20MBCOQyPm/8ze8oe18goMLwMV6DzAMOufdb?=
 =?iso-8859-2?Q?9h7mL8xCePGUJrwAu0dMfrRZ3TuIlKk+0M3TEtst6m3PeJ2cbOPAhBmUhJ?=
 =?iso-8859-2?Q?Nb74Q1kw5BuRfmCmbkOSbaol/hgG5Idtuz6CrrRsCBBR+WSirNZ7NI2fsn?=
 =?iso-8859-2?Q?JM6t9sY41idLoCVrj7nrCdCDM1VvakoFzkjVaHZ7dbTAhoHLCjWPIVWM/t?=
 =?iso-8859-2?Q?fXvfB3FyeYDmiFhjaTPrtbWbPl6PrmilS++c/T1Ve+D5Mmo3biDVRo3fTj?=
 =?iso-8859-2?Q?QNKicWNcGxDCALZ0T5CUPcyJzbVNd5mVJyEtaAh8o21xASWLZzC5MTBns2?=
 =?iso-8859-2?Q?21/xnoLN5GUOa8aXYCyOS0d+BPFK4rGjkIRJxC9p93FcCM9d863JUG9tyN?=
 =?iso-8859-2?Q?AiGEa1heoVgQPWSINMs+xeQKPPHYYEpPclHOTgGZ1In6N+ahSs7LXpTI2Z?=
 =?iso-8859-2?Q?f019Iyhf+gOW1HmGFgl5i3Dryocambk4+z13VVfCWD+y3PMd5lw34DVday?=
 =?iso-8859-2?Q?J+DutqvtwcviXDm2b66jyDrbhmFb7YJiTm?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5072.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ca82ad-4a55-4529-2b78-08ddde4815c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2025 11:12:14.0331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TP4xejnZw4ejBnCAyu1e+ultFfLDSjxXu8BZchdxmVdhmO/5d76IDJCAOxfDJY5iuQd7pxjBvx1cLjYl9WJB8nAfegA0MhKpPeRiOypE9gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5890
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

From: Sharma, Swati2 <swati2.sharma@intel.com>=20
Sent: Tuesday, August 5, 2025 2:27 PM=20
>=20
> On 22-07-2025 06:18 pm, Micha=B3 Grzelak wrote:
> > Running either flip-vs-cursor-busy-crc-(legacy|atomic) subtest from=20
> > kms_cursor_legacy results in entering PSR1 after the test. Even with
> > PSR2 enabled panel, it is impossible to switch to PSR2 via=20
> > i915_edp_psr_debug. Kernel does so because it prevents inhibiting pipe=
=20
> > CRC calculation which is allowed in PSR1 but prohibited in PSR2.
> > Therefore subtests from kms_psr testing PSR2 feature (e.g.=20
> > psr2-no-drrs, psr2-primary-blt etc.) are failing after running any of=20
> > those kms_cursor_legacy subtests.
> >
> > Restore enabling Panel Replay Selective Update by stopping pipe CRC=20
> > calculation after running the subtest and before the clean-up.
> If there is any bug which this patch is fixing, please add Closes tag.

Right, forgot about it. I will resend the patch and include the tag.

>
> Otherwise patch LGTM.
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

Thank you for reviewing the patch.

Best regards,
Micha=B3
