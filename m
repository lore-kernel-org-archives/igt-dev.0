Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD995EA3F18
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 09:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2980510E041;
	Wed, 11 Feb 2026 09:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HmuGHzN3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2896310E041
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 09:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770800446; x=1802336446;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QjJ7qLPOtaHp3v6/fFuYygDHeaVZrvty03muufqQlyM=;
 b=HmuGHzN3Zpil1FJsPPhBP+LteuQ5rL/0J5e24NMwJypRvMdkQHLg0uJ+
 PzsaA/Vxz7jUMcumVszbmDjzAAz3379PMVfhwfLAsD/sNKa2TyHbv6SeX
 9/VXUtNLenYCNAlzz4GNcapsd4UlkQrP+Y2I7yUUWNtRPHhqGk03VLz5t
 mE45xaLaXRLrI/8NW7s6QJvokQuFarBxg6loO6YVsByauC9xracighMBO
 qzlbd0cRqelbg1PYXEoQua7E+15Ec3mFJ85fikJKwDDzZ/lxdIMCZE44t
 pGwsAtUu6CussOMAAx4YCC4Adv0jmx1GgXGIFv4nACEa5p4nrY9Vl7Q/a w==;
X-CSE-ConnectionGUID: NGFTaTnZSzuv6yKK/xxNsA==
X-CSE-MsgGUID: mGvsk9AzQfmDbkFTRA5u7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72017014"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="72017014"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:00:41 -0800
X-CSE-ConnectionGUID: JTUh/wyWQhqMXu4kNpMmiA==
X-CSE-MsgGUID: /KzpV0gRToWjbUypzlH+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212221033"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:00:41 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 01:00:40 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 01:00:40 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 01:00:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWEEcvc1ZaTVh89ETNTCMNingf9wpd9Zj1cCTR9LGYB1Ylx5Z0Maip9fmwPs2HxczRDCSGQyAE3hSq+Hf/MKU1V/WkjsO++dx1waaDJLwdrjs5zXaVd5KsDvAZUm5Fhnw9maEng9GmOCc9s6APCWCw7XSAwSUVwvbRmyQBbMx4ufC5NbCZ6Esc8Utr90KqJA6yWUCDK9jkyk3OxUDsZDP0PKHFLUkOFKfN9Hf9AuGNSvzR8P09oahba/gZYeRwg3ujEoBO2g48qdPzoE36KN5d9nGTgXNlN7sDssF7CTbt4n83SkmUypyPXNTkRu28U7Qy2oF33zt+4GcRAut/V8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ut6pTLoMtpSiuuvFqtc9bByXcEa5EZHU3bSFMh7uJTw=;
 b=KzEyGJ4xyiBkaUi36TzQOvm5h9i/w4e9oOg67vrg7Pxye5pVdWdehWH2F4kPrzNlgIUjnhJZQIzVDQyowApZUp0kohnTR4QNd8wupu4dn2YDf6tqUxsKu/MVB3gXtuslvkvMn1FGzEJN73SA1jcpXNW56qXkkpSSox+ZmXg93el9GcGzF8csnZRWgmQszlGOWAo7bwukIIdOpLXvgkxtiExbxird2gVPSXpj553lmnT2i+9bLeNE23TlsTYNvqn6U8+xnOJDCxR7sChYSfLQYIRWX0tRIvYldCW0ZwQnmGCCqqoBmMh7+G8xUZSKU1A5pV1T5rGHVkiHx+UQNeqvSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by LV2PR11MB6045.namprd11.prod.outlook.com (2603:10b6:408:17b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 09:00:31 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 09:00:31 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add helpers
 to enable and reset hugepages for test execution
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add helpers
 to enable and reset hugepages for test execution
Thread-Index: AQHcmnjf6NP9H55SzkusMbJ1Zi9QaLV9NJiA
Date: Wed, 11 Feb 2026 09:00:30 +0000
Message-ID: <BL1PR11MB552599DE20CF85BAAF90BCA88463A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260210103436.739323-1-nishit.sharma@intel.com>
In-Reply-To: <20260210103436.739323-1-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|LV2PR11MB6045:EE_
x-ms-office365-filtering-correlation-id: ff66bb0f-2844-46d0-2c47-08de694c0257
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?z9CvcY0C5nu666bi//eAG4c9OPUQW/IhOK5eeSxR1zVDMX2xwdMDvvZ7u73y?=
 =?us-ascii?Q?Gkc9IBairTwlQueNFcH3XdEkiLNUANb26G5YzJlNAHGXcpasPqyI6eQRXIjy?=
 =?us-ascii?Q?3GDXqDJlXsv5JbbT8dOJjSJ6qAKaNkoVIxpVi6FJBxyP2KL1Hyvwy3aj33Zc?=
 =?us-ascii?Q?vuFwYlvxz9A/9Aawt1Zh8Adi6s3D355CqVwTcxyk15NsaHpabu2Dt2BGN5oA?=
 =?us-ascii?Q?zFe1exfk9eEbPLYp3hXxzBSzWHj1+36U6z/Xbn+mn8czUGW5HH1Q3UQztU3P?=
 =?us-ascii?Q?l2t+MxORnFOZSbzyHUVwALMjyy++rxMomytoR6JqsyT1no02k0g43MjmQzeo?=
 =?us-ascii?Q?z0eu0OESJTpT4lC2MLKiwGv9/q7vJnLtk9poMv76vEm8Rf7g3kohIhSmuzlt?=
 =?us-ascii?Q?/5xVRwVEcCxBY7L64prf1QiRHtClQEZoCgwCfk1Cuce2gtfrH/0AjJrG2zo6?=
 =?us-ascii?Q?znX+mj0aNfUevOskUPFzTcjcsvMUikZkiVvXgQR+nAc/Pjb1agbLcIp1fLdZ?=
 =?us-ascii?Q?RrgsPTUo5Mk/w9vDigfAXg7Cpm/t6kgxABo8hS7e3Iz0NxdvgoaqcpOz5mgX?=
 =?us-ascii?Q?TjwRQ4F7n0LPnzy1WTc1HjdcBFQPr4+w+qm5NrstcNO8hWDVc3lpm25Ilpcm?=
 =?us-ascii?Q?RoU2puLBeOpuvIfv3fPKKF1Av082TvUF6khueQ1qnxOaTYw/ZZeeVhM7oRnH?=
 =?us-ascii?Q?NGLa8dITN1z+1Ci6Omk8Tbh8S6FK92pnZuzxd6U2JIqUrRu6WcEQBo25zQB4?=
 =?us-ascii?Q?teRPueh1q/JyFhwFUrBupzFZ2yNj+Z2bJqsJR64jhxXFo3kQDCxKMq+Hbs6s?=
 =?us-ascii?Q?0K6VYqFAIcy+oMokVPKhjF/dQnCNxkQi9I3huvngHhU2J3NYpo89RW9rdw7m?=
 =?us-ascii?Q?KuWqrXx5Cul4GzpG0mKC4Dk8ILEQWJT988Yft6+D73uCGZoDdgvtwRsEUs6u?=
 =?us-ascii?Q?FmKCtPxsxLDwYiLJa+8wRtCD6k4/fp7nWCBwfbnwTI1Ru4HcNWObTCcb//AI?=
 =?us-ascii?Q?JGLyUOPmjpFzFUvvUNyPEurX3ItqmYTTElU5UrkGXwqf1yjjJ1u4YcafrFnZ?=
 =?us-ascii?Q?oAeTFy3+gtQwD/1rb6A9Fm5zb0f6ZYvz6iwOJQdfR903Y7n2Mr+pOR9cX6vn?=
 =?us-ascii?Q?g6RHBW2l4YC/e5gGZWX74Ss4CkJtR0xx0aiZgIDpZLiLr2BP+yd3TlArywhd?=
 =?us-ascii?Q?xxJSodGoUj4G2YEZ9HRzq8jWStJjKvRY2vcJKZT8JQHGHKHb8AglYq3w564U?=
 =?us-ascii?Q?ApC+glCxZAU/GVHfSddE9SRVa3LBWyxTUJzAiemXYui9CIAWYD2X7kkOkRAM?=
 =?us-ascii?Q?bTy1lAj9iVtBj6kg2jAlk+lHGy3B7c6jiexd5jiJxolMZxXSAzOm8dX9w4RX?=
 =?us-ascii?Q?uWcBDHPPamGY88drFHqU0dyIdOw+D+xU7F8yKYwmOIysKzMqRAJbZoBAaNbU?=
 =?us-ascii?Q?2dlgzuqI4WvItvFpOkNdK++ZchtBlUEwWMvdhJqkGdHWJYxBMI3wq+MmNaJP?=
 =?us-ascii?Q?OAGr7VSdiTQork8RO8p7iLsr2SA+HdPBtdsGPIZ8tYcsnem51G0fmsegJAOy?=
 =?us-ascii?Q?28XVy7jj93+EiGpDo0mRBQl9vFIGbRvQqnI0vDwFT6hwIuFyVONfEZvkpEFk?=
 =?us-ascii?Q?7UHwZxfRkpeRgWCJ9iVp+TE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IpwKcx+fkG/WM8i3QmuxquqzTRRlF73CNl2NR0CXx5PFp3DVf90GdKQHGzo1?=
 =?us-ascii?Q?AGBEb5c9mw+KtNiP2KkrTucPMMuD3vX1S6HH3NARTzqqIcELUyXy5kuJ11rT?=
 =?us-ascii?Q?AkiPPHgI0QbJqbdk/b91+BgvUjy8d67w6Xl/6mZdGx9r14SWIXNCNQW5iGU8?=
 =?us-ascii?Q?Ac4fQawzezatoYNpskWkO/Z2VRdUFIPG6uOtY3fy0v7j07yBN13kzRYQVqcI?=
 =?us-ascii?Q?/8b4mWt+ggBrQPr1C7GAd+F7W6qdanVR4iN+Zio2tA4AWK6ZhZolTd8YQC95?=
 =?us-ascii?Q?GsSLAenm/HowG6c897ZQbLJJkure1bDMBmP3E4Pwa+rzJ0jC757GX/G8KPGK?=
 =?us-ascii?Q?JEjSjNFSJhNjIfkv36+hlGpJTxvow1TUgmch0LLsb+RcHDXkO8MQ3FdjhPaa?=
 =?us-ascii?Q?qHOSkIDyqvafFoVQLCwHjwv5uBFCSPNb0hTBH47dtc+065FStJFOEaBeyoY5?=
 =?us-ascii?Q?0HUNV1TmdmMTtgLWl4bVIHj5eHjISXr7ir0tzfnJ2EEmSZpCMM/F7fwrT8xT?=
 =?us-ascii?Q?kjwdBF4RAK+kHCj33sQB4Z5HnDAZrt3d07++dX9n3onlL4ry1jHxG2BH91Xg?=
 =?us-ascii?Q?ULfvDRV8zgUcvnxqeQZ244fwfuJjZ3jink16n+/aM+3zAhzDMjPPrfI36yVW?=
 =?us-ascii?Q?+xIEnjUFs2nDbjhycWikYkxlBK9esnfQSXCId9GZK4+OL44fPR01PKjnllHi?=
 =?us-ascii?Q?4hdX8CT/mAMnRhhUAyeyvSlSR+e9jvAXG10xV20rKL52nJbYGBd0lL+viqiV?=
 =?us-ascii?Q?bmwnqkxriPzoLeBiIGejbSVLX+R70BKArL2veMD/1J77Rerp9DdOXxVbHNzj?=
 =?us-ascii?Q?2fqrA4akAbTXVPTIymQyRsstlgXXlaPkod+/K1B2wJiHeT4HTltmNmv3ws0l?=
 =?us-ascii?Q?mwOadjRs1ejSdEhoJrRq7H5x1yMpTfseQi4TEMcy+/1RQUnjEgg7ydBYsDYd?=
 =?us-ascii?Q?szm4fsObvSzSeDgncGH1QEvCaSzqJaJUKW65qlTHXD3bmAg9kjS1O3UY5SRY?=
 =?us-ascii?Q?b6UNW/Cn4YBm/KrnjCF+yeljS8JpkcNBfe7xWkRQ5Pj0lIg2g9cQ+WzgtCNf?=
 =?us-ascii?Q?f6AlB7nar7VPGmLTBKoiimQ2H8+88yOMA7xMvDoJ/SnLDQ22TQWOYMKkgBEV?=
 =?us-ascii?Q?wsOq3VbIWnVl+hCGR8vYq+bHah2FKJWehmnl7Kla/QCvIPBranRpJhh0gOpU?=
 =?us-ascii?Q?xRcFpjGjD3xNlsjtcsaLtPVmTWvK8+fTnNc7hgTB64o3p1IDOqwn2JXNtQU2?=
 =?us-ascii?Q?vifNCWaZ5DRoZqS9WvVW1SjPd6czNdgWLszajZqB7cCeAGlKuQ/3h7l5BzAM?=
 =?us-ascii?Q?WlovZzcRJ3wfyyG6VsI8tp7RMVFUSQfdFmltvyIo5x8Ia7pwzSTQxadF/ncj?=
 =?us-ascii?Q?C+2MchhQlqa+vnuq5dcJy1OWI3F+x+F3z/VB1Av15X7NH+PgAvypC5QNZQe8?=
 =?us-ascii?Q?UIX5GHzTkpJaEtQbVvxwZiJJ+1FNJkzVkRJBFVZ8ya7JKt7wQ4NEEl2MXanK?=
 =?us-ascii?Q?8iyRoBhRgVDFLFUlwXkbpWSlgh+gNmX8wKcse4hNqpYTbeVXUeiFBDLoUxTO?=
 =?us-ascii?Q?nn2TDDBDjJqblIK1HqdqWJx4kmlTMuEbWDs9fKKhw2U0zA9n1XoZJYIU/MZn?=
 =?us-ascii?Q?1GGxcZR3sLqxCUMr1AX58BxwJN4yfgpYDWMPEB9O5njtKZiFoTWIDVsGrg6S?=
 =?us-ascii?Q?aFaOUvmOQ+hOJXgPn/tk3vhxOE3/l/xMeSbUSSJ+UEuSKiYVK7DhRNMa+TB3?=
 =?us-ascii?Q?aVV/1y6N8Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff66bb0f-2844-46d0-2c47-08de694c0257
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 09:00:31.0249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqZLG96r0k1AF6sgWWjmoVzSVZOLhWT9669d4hlJPSx/ncO+YiJBi0E94tVcKvkAS9gIDSyGepYTwqAppscyEckvMCsLCkhWumbNmv+4BUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6045
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
> Sent: Tuesday, 10 February, 2026 04:05 PM
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit <nishit.sharma@intel.co=
m>;
> Gurram, Pravalika <pravalika.gurram@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add helpers =
to
> enable and reset hugepages for test execution
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Introduce helper functions to programmatically control the number of
> hugepages via /proc/sys/vm/nr_hugepages. This allows tests that require
> hugepage-backed memory to be executed reliably instead of being skipped
> due to insufficient hugepages. The helpers ensure hugepages are enabled
> before relevant subtests and reset after improving test coverage and
> robustness.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 43 ++++++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c
> b/tests/intel/xe_exec_system_allocator.c
> index fc987ac7f..fa0c49b70 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -55,6 +55,28 @@ struct batch_data {
>  })
>  #define READ_VALUE(data__)	((data__)->expected_data)
>=20
> +bool is_hugepg_enable =3D false;
> +
> +static void set_nr_hugepages(int n)
> +{
> +	char cmd[64];
> +
> +	snprintf(cmd, sizeof(cmd), "echo %d > /proc/sys/vm/nr_hugepages",
> n);
> +	igt_assert(system(cmd) =3D=3D 0);
> +}
> +
> +static void reset_nr_hugepages(void)
> +{
> +	set_nr_hugepages(0);
> +	is_hugepg_enable =3D false;
> +}
> +
> +static void enable_hugepage(void)
> +{
> +	set_nr_hugepages(128);
> +	is_hugepg_enable =3D true;
any reason why hardcode value and 128 only  is set?
> +}
> +
>  static void __write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t
> wdata,
>  			int *idx)
>  {
> @@ -1444,8 +1466,10 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  	if (flags & EVERY_OTHER_CHECK && odd(n_execs))
>  		return;
>=20
> -	if (flags & HUGE_PAGE)
> +	if (flags & HUGE_PAGE) {
> +		enable_hugepage();
>  		igt_require_hugepages();
> +	}
>=20
>  	if (flags & EVERY_OTHER_CHECK)
>  		igt_assert(flags & MREMAP);
> @@ -1984,6 +2008,9 @@ cleanup:
>  	}
>  	if (free_vm)
>  		xe_vm_destroy(fd, vm);
> +
> +	if (is_hugepg_enable)
> +		reset_nr_hugepages();
>  }
>=20
>  struct thread_data {
> @@ -2036,8 +2063,10 @@ threads(int fd, int n_exec_queues, int n_execs,
> size_t bo_size,
>  	if ((FILE_BACKED | FORK_READ) & flags)
>  		return;
>=20
> -	if (flags & HUGE_PAGE)
> +	if (flags & HUGE_PAGE) {
> +		enable_hugepage();
>  		igt_require_hugepages();
> +	}
>=20
>  	xe_for_each_engine(fd, hwe)
>  		++n_engines;
> @@ -2115,6 +2144,9 @@ threads(int fd, int n_exec_queues, int n_execs,
> size_t bo_size,
>  			free(alloc);
>  	}
>  	free(threads_data);
> +
> +	if (is_hugepg_enable)
> +		reset_nr_hugepages();
>  }
>=20
>  static void process(struct drm_xe_engine_class_instance *hwe, int
> n_exec_queues, @@ -2150,8 +2182,10 @@ processes(int fd, int
> n_exec_queues, int n_execs, size_t bo_size,
>  	if (flags & FORK_READ)
>  		return;
>=20
> -	if (flags & HUGE_PAGE)
> +	if (flags & HUGE_PAGE) {
> +		enable_hugepage();
>  		igt_require_hugepages();
> +	}
>=20
>  	map_fd =3D open(sync_file, O_RDWR | O_CREAT, 0x666);
>  	posix_fallocate(map_fd, 0, sizeof(*pdata)); @@ -2171,6 +2205,9 @@
> processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>=20
>  	close(map_fd);
>  	munmap(pdata, sizeof(*pdata));
> +
> +	if (is_hugepg_enable)
> +		reset_nr_hugepages();
>  }
>=20
>  /* compute flags */
> --
> 2.34.1

