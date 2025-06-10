Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DCAC5B552
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 15:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A02610E2E6;
	Tue, 10 Jun 2025 15:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhZtf1E6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2BA10E2E6
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 15:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749570522; x=1781106522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DW2RAuqL8fCe7UttsESrsDnWeZfKgIhtAEm4xjtUVQ4=;
 b=MhZtf1E6yPlCD4XW46sJpJ+DLdqRvcXghCP7H2rOqdupezc9viO6TwsM
 tbA5uOAfVrs7nVBrFN7T6zC+mMZS67oxWwBoI+SPM0vILRRsWHSQh1NBk
 vIKpCxO4U5jtuu6pVUA93AhKnh9HiCExVX9PP8B+Q89ub9DtErVw2m3Dm
 hJ2n+H9T3Bmv7ZsiHSGkU29xY2GhKqYU2fjT43t5kXsFZb5Qk1d5xofqF
 ftTPKiNi8TqYdEWvICXTG0I6FDwMi/l4akU6KxvlePZyZdOUhZd4ErKXr
 GbWrwLB1vI+fwWVc1ouGneHd1ramUCxUa08tYJPRn5P0MMfgOuZPvLPWs g==;
X-CSE-ConnectionGUID: uODteqZDQLmee/J/j8RDcw==
X-CSE-MsgGUID: 4JbYT31lSYqyPV8yq90euA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51603529"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="51603529"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 08:48:15 -0700
X-CSE-ConnectionGUID: w5dSGG3DR9mpvxflIaMB+w==
X-CSE-MsgGUID: Dn96a8fYTlebcQe0AeSirw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="146803518"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 08:48:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 08:48:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 08:48:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.68)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 10 Jun 2025 08:48:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3Utx47i6dRf2cMtaloSeNCK7IBHivTazkyyKnag1rwT8QkamqBG8/1xMqdTFIX/CVrxzR5/wsHJR+nkxyBkvG+wD5BerAL7uVaIUABoBClSvQK0/9FWoSZHrqEnVnX/x98YDXp6iemepURd6TGCFzNPbsGkS06WGIILuKxbi209BFMcNkCqkPK3L6jOefDJ7kUzXBxjQrml9Bg5hRtrC9FSovWOd8NzRzhMFDPwd5WTfFSlubPhMpZVH3IuvQPDTbFHQRzQ6qzdmG9Cd7QNIML/HTXV75o2CqfM5uh08smGcqJVHjkSe3RKcUXW6i05b0pSyHDbV1RR0VGlSsKbPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cm5h4EZOkL48qOc3u7EHhKawDOrDkVAg5wZXKECwpKo=;
 b=sSBJ8AE/JlrsHdYpqRbidydwpJP/8lQ/ag5GIrHSLW/qF47SieLkZE/r2H/Jf1d5cmZQdp9bahrBBOkK2iApmJalaySZbuCwv2BYFkEkfGPnRKYwilZjLucAF4PcZzorAOmyBVTjF7Ta0tmQ301orjWTPjEX8G5ENVTEcfkBGsXgn2tbXxksz5zVeBT/5Cb+6OP1+GoLEUtfI8IFh3kHaLldpErerJLgLkeGIxEsKhTmVy4d9794hFuaaPIlbFquCdt61iqLlDimTD+VRvY9X/Hb0Pv+8+CyaNEPYZS/vJQ792VO8QR6jOcBnx/rlX2gzInK4QEMTIgPmQbC109drQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by LV3PR11MB8579.namprd11.prod.outlook.com (2603:10b6:408:1b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 15:47:58 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 15:47:58 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_fault_injection: Suppress Guc CT
 dumps during fault injection
Thread-Topic: [PATCH i-g-t] tests/intel/xe_fault_injection: Suppress Guc CT
 dumps during fault injection
Thread-Index: AQHb2hkkn+E2sX83UE6KFIujKf4GKrP8f55g
Date: Tue, 10 Jun 2025 15:47:58 +0000
Message-ID: <CH0PR11MB544459718691875DC0A52B33E56AA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250610152151.4260-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250610152151.4260-1-satyanarayana.k.v.p@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|LV3PR11MB8579:EE_
x-ms-office365-filtering-correlation-id: 0ea0d120-ebf9-4bc5-8eb9-08dda8362c7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pHzmwzR7vPpsQOpCHITb0Ey0xMrM0HjiXJ2rKFoPA0pQ5RtJMuBeC/QLT0E8?=
 =?us-ascii?Q?JN9fvflvFNFDk0VWpK8+IIr6X78fIE6GdyeVNA0kxsCQMNXg925pHIQIs/Rq?=
 =?us-ascii?Q?eIvZmS1hvxdFD1MsPxFLKGtmnvDOfqHIwUOXP8hz3kaO9XQebkKWLjY2re/X?=
 =?us-ascii?Q?0pafjQbkWLj/kq4bCtfOBzonyGe8chUt0knKNBzNWQHF80DEBk19q/bvqUzZ?=
 =?us-ascii?Q?P9/yVcfxKvPkfRdU1iDwvR5Cqg5Ktbk+qq2PjWPLxxArfEUbeHLH7lB3WovJ?=
 =?us-ascii?Q?PUmZDxi27z8FJd//ZOdVWsa5yr94IZto2pgPqBValpdL9++0LxVg98zRZHdp?=
 =?us-ascii?Q?MANRk2J4Vqz5XOUETC89meXz4Fs879AzvAL8Qb2a3TwhcZBIC6e0oCYxaqYK?=
 =?us-ascii?Q?5cRNyN9eHDDRjYHtvY4E2Q8yig+gTZghstQBoh/i7mXdjK/H+qdNjHNoLeTl?=
 =?us-ascii?Q?kICoa7/9CKGPl1nhLTzcFOwvLg4fzXOZcha6rZCSzNWAzcCYdHrMh6EGHYWP?=
 =?us-ascii?Q?e/EHMUR6f4tRtDlZCLVjbdarVqSHvr9VO6rzKwshBeKhBWeeR8tlPfK/wFW+?=
 =?us-ascii?Q?Ptp3IdKquuC1keEh/V9KRtTaDa8+mNjs6hSrNhFV+CMi89ojkHDUl6mzlxbk?=
 =?us-ascii?Q?OZsKGIU/F0tQXmGVH8oRQ51SknKI336K4wNp3+9BgqiKkxuLai+fhNBsUAn8?=
 =?us-ascii?Q?alQ2ny0S6p++Qiu1clp/65l+vTrBMzsyzm/KxZc63wJ+sww/BhpBGZgVKc9A?=
 =?us-ascii?Q?lkNP3g+uxC2WuPLFId8rZ6+klishAl5fOuQ4H7Bx5+YMde4I1CChRq8FTXZN?=
 =?us-ascii?Q?m8FSWe5LfaEQaNtlultjmSeMuAaCZvl2Z8OqmY3I8FoPpevd6x6HL4Du+x1p?=
 =?us-ascii?Q?xxEo3j74qpI6mX01/3IPFTTJcmaCd2aksc+AddjVaiAT99ZHGGbGcRWQkb1e?=
 =?us-ascii?Q?PaclWVa7TurYnkUxtSYhGkGDXaJGkws6YGxCL+341pUAU+dEMGkqJpnFTOcW?=
 =?us-ascii?Q?Ul6VXcO6fYIO1NfMU4lbOk+l+TaQg6raEzMa/6S8vNS9RSPEDE7Q2OyPjYio?=
 =?us-ascii?Q?KkYtG7HOb7xhJlOLNVSvxB7xdKxCqfhaoRSTchq69p58n2UM6oq4HL3Ntt+Z?=
 =?us-ascii?Q?2HWTrDDlu1zZaq3JLCNNE73NL3rQitPnKCy7HMhWIbqTGtTnTPTwtMDpjiJ5?=
 =?us-ascii?Q?VjnAf01XeZ3Ner21/YOs8ERK054+nDhfhfzyau/d0dxDDBtTVzRZ2eKHVZCB?=
 =?us-ascii?Q?FIAWKRQo8J5lx+VvMI5tYeT7BDVBL1OSwrumLAmtHu8Ovb9MCElrOzTMWXFQ?=
 =?us-ascii?Q?BdiqiDSpcECWe0paXZsXyxTdEhy/c6ZON4gMGfm24buEmNiGYPvfPe988M53?=
 =?us-ascii?Q?Tail6FNQXAyjItrUFCx02ldFtSdi65Gw3ETveGnanb/6iI+5NiPIOZbGahrW?=
 =?us-ascii?Q?l8CJFsSpI5I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XV+ZfnEgU1T8kbIfIMe3eV8LsH/qZtyj63uYAWEya5rIhCOC/6yDzDaUDbmj?=
 =?us-ascii?Q?JCTlEzgmyZUyQHxGGVyx7bODEomG1UtOOmvktXwWPQjQQSPUP7ipycSQ4u+T?=
 =?us-ascii?Q?iO7vYuPtvh0cL2Ah4p/40e8u2ITcoolZGCGw6jmmoMDaanLRL9zmiSn/5pq8?=
 =?us-ascii?Q?8se6dGUDLW3gTV+AJpIKi0hTLD8B44dEr1cvtRVEtN48/MtSj1Gd+/139vWU?=
 =?us-ascii?Q?hMoYN7IyWu68kCQ060YifLhV2E7WmyPEsGDi9/ietsEZq3iB5n00du343gay?=
 =?us-ascii?Q?gKsfA2iGH873F8NQrxqjQe+lnhrcNPftf8UHiJPwWbBaa9y7TgXkFm+VBDUL?=
 =?us-ascii?Q?jmJI47nJVj2Y9h8Df9qW422eEc+VBob62mbJhWihnEJ7nKdV6a3QJZc839tT?=
 =?us-ascii?Q?JbsDcXk1wA/WsNAf+05qqMspRxIkdWLFou8mdSLP78kEUwFlSqsuNYtb2GWC?=
 =?us-ascii?Q?wiW252Ds8tilp9PepnX7s3PEdkKPbeiznmBhFFuSuKsnsX/erJZ48FORhVFK?=
 =?us-ascii?Q?80z0pQbX7BM0LM3rQg2gSTFBxWc47xTl/KXMcTsc++RZB5s81ivbwe4d4EK1?=
 =?us-ascii?Q?XPVpyRfLeom6Sab2KeSCV2OQaqMxhPSQ99Ps81Xn0J0fU/e7JHO+IqeiJsyu?=
 =?us-ascii?Q?10mJap4TF4V6gZ3i3aJHhi6/+y74Jw/+OrgdOsC2Twe0G5OYv5t4IduwyPnf?=
 =?us-ascii?Q?wXLenWAefXSIX2DS/lrXnJnA7ZQh34dIw+MVMgk54DEtBggTSH3JgpmAru0o?=
 =?us-ascii?Q?6GdgjvlC4rQMRINcOGJVqPdIKpRQ7RHzP1/PoamaE7c7a2Oho7e8zSOdBMwE?=
 =?us-ascii?Q?nxeMABBqKEu3M1JCnCUcR9dwUeh4u4w5xFPYKDf5RGVVMUYZYQy+RTWsp40n?=
 =?us-ascii?Q?7iDvrGMkUr6sYSht+A9u6zXyry8JPe/BYF1kuF1nr6z0YEMlRlHou0NEezF8?=
 =?us-ascii?Q?Vb6kEWvOrIJetbTt4ftbuP3jSUgVQSTx4uCDzp6eqt69OFT6ygAQqJf5iXcL?=
 =?us-ascii?Q?yFAxz6Ac3Vttw+KQ0d3E2KGd5TLCWGrKQn9YI3DcDJ6IzkgWP+dOilZWFsFO?=
 =?us-ascii?Q?zKMVDeCxDySdj3CTsjnnIij7jhyYGZQ9n4Yd2VkphX6GeVj+jVf8oFVFZigP?=
 =?us-ascii?Q?CgH0C+W8P7hc8RMitkuUX6O+mUYjcuVxun5AcDXoAHB4ctmjWKjs1Ad4/PJa?=
 =?us-ascii?Q?87nKeyqH/5Ex+qYJXwMaKmbuwgFnEZ6I4BLyO1D3QBxafMTpNMtwCqjd5NBU?=
 =?us-ascii?Q?q3U5oXIbEOrjg3n1EMXA2Xzys3ingI3XYlDB93TtPFv4ieGIFSLt1CSG9uWk?=
 =?us-ascii?Q?F+lZpEXEXvegD7rht5M9YWBm5hV18qdiwkL+AeoCDwEHLY3u+GjOFKlSeb5b?=
 =?us-ascii?Q?K3wxysqxB424TGX2I5B9yzOmnZfSRtIka+GCph8baXtWPEd6hsM/fw6BBNmH?=
 =?us-ascii?Q?E0z1xJhvqpPNeNt38vvR8RYmoYX6Xj787okQxfjl2OhTy4gmay+Touj3XkWu?=
 =?us-ascii?Q?vTzNmCiBSXLDeYsCw7p7bpI16/DvrApvG+4IerFjW1ln5gtwn2+GftD0pYwC?=
 =?us-ascii?Q?9082mT4P5KG8EXQvyX71VAOKRVQnTNUajAS5jf+T?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea0d120-ebf9-4bc5-8eb9-08dda8362c7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 15:47:58.4146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pYgu2I7Bye56ef176XNuX8W9FXriEZOC6LolqIGtgxD+yzEX7qhh0FfwNrKQ0h17Nikmmnzlh5n4szblPE73aCAcIFbnrzmNaUgfCVfFhAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8579
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

-----Original Message-----
From: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>=20
Sent: Tuesday, June 10, 2025 8:22 AM
To: igt-dev@lists.freedesktop.org
Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Harrison, John C =
<john.c.harrison@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; =
Dugast, Francois <francois.dugast@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Suppress Guc CT dump=
s during fault injection
>=20
> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
> functions, the CI test systems are going out of space and crashing. To
> avoid this issue, a new helper function is created and when fault is inje=
cted
> into this xe_should_fail_ct_dead_capture() helper function, ct dead captu=
re is
> avoided which suppresses ct dumps in the log.
>=20
> Inject fault into xe_should_fail_ct_dead_capture() function along with
> xe_guc_ct_send_recv() & xe_guc_mmio_send_recv() to suppress GUC ct dumps.
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
> Same as https://patchwork.freedesktop.org/series/148416/ which was
> reverted due to change from XE was still in review.
>=20
> Test-with: 20250524144613.11970-1-satyanarayana.k.v.p@intel.com
> ---
>  tests/intel/xe_fault_injection.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index 9fe6bfe35..bbc8e71d6 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -123,6 +123,22 @@ static void injection_list_add(const char function_n=
ame[])
>  	close(dir);
>  }
> =20
> +static void injection_list_append(const char function_name[])
> +{
> +	int dir, fd, ret;
> +
> +	dir =3D fail_function_open();
> +	igt_assert_lte(0, dir);
> +
> +	fd =3D openat(dir, "inject", O_WRONLY | O_APPEND);
> +	ret =3D write(fd, function_name, strlen(function_name));

On one hand, we should probably guard against openat failing by implementin=
g
some error catching here, I.E.:

"""
	fd =3D openat(dir, "inject", O_WRONLY | O_APPEND);
	igt_assert_lte(0, fd);
	ret =3D write(fd, function_name, strlen(function_name));
"""

On the other hand, if we fail to open the file with openat and attempt to p=
ass
the broken fd to write, then the write function would end up failing instea=
d,
so we'd end up catching the error later in this function either way.  So, I
suppose it's not strictly necessary to implement a guard here, though I thi=
nk
it would be preferred for stylistic reasons.

> +
> +	close(fd);
> +	close(dir);
> +
> +	igt_assert_lte(0, ret);
> +}
> +
>  static void injection_list_remove(const char function_name[])
>  {
>  	int dir;
> @@ -202,6 +218,15 @@ static void set_retval(const char function_name[], l=
ong long retval)
>  	close(dir);
>  }
> =20
> +static void ignore_fail_dump_in_dmesg(const char function_name[])
> +{
> +	if (!strcmp(function_name, "xe_guc_ct_send_recv") ||
> +	    !strcmp(function_name, "xe_guc_mmio_send_recv")) {

I think this if statement can be shortened.  Try:

"""
	if (!strstr(function_name, "send_recv")) {
		injection_list_append("xe_is_injection_active");
		set_retval("xe_is_injection_active", INJECT_ERRNO);
	}
"""

> +		injection_list_append("xe_is_injection_active");
> +		set_retval("xe_is_injection_active", INJECT_ERRNO);
> +	}
> +}
> +
>  /**
>   * SUBTEST: inject-fault-probe-function-%s
>   * Description: inject an error in the injectable function %arg[1] then
> @@ -236,6 +261,7 @@ inject_fault_probe(int fd, char pci_slot[], const cha=
r function_name[])
> =20
>  	ignore_faults_in_dmesg(function_name);
>  	injection_list_add(function_name);
> +	ignore_fail_dump_in_dmesg(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
> =20
>  	igt_kmod_bind("xe", pci_slot);
> @@ -273,6 +299,8 @@ static void probe_fail_guc(int fd, char pci_slot[], c=
onst char function_name[],
>  	for (int i =3D iter_start; i < iter_end; i++) {
>  		fault_params->space =3D i;
>  		setup_injection_fault(fault_params);
> +		/* Clear the injection list  */
> +		injection_list_clear();

Hmm... I think it might be better to perform a targeted clear, instead of j=
ust
wiping the list clean after each run.  To do this, maybe we can have
ignore_fail_dump_in_dmesg return some value.  Perhaps:

"""
static bool ignore_fail_dump_in_dmesg(const char function_name[])
{
	return !strstr(function_name, "send_recv");
}
"""

Then, in inject_fault_probe:

"""
static int
inject_fault_probe(int fd, const char pci_slot[], const char function_name[=
])
{
	int err =3D 0;
	bool ignore_fail_dump =3D ignore_fail_dump_in_dmesg(function_name);
	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);

	ignore_dmesg_errors_from_dut(pci_slot);
	injection_list_add(function_name);
	if (ignore_fail_dump) {
		injection_list_append("xe_is_injection_active");
		set_retval("xe_is_injection_active", INJECT_ERRNO);
	}

	set_retval(function_name, INJECT_ERRNO);

	igt_kmod_bind("xe", pci_slot);

	err =3D -errno;
	injection_list_remove(function_name);
	if (ignore_fail_dump)
		injection_list_remove("xe_is_injection_active");

	return err;
}
"""

We could alternatively keep the injection_list_append and set_retval as a p=
art of
ignore_fail_dump_in_dmesg, and just check the return value at the end of th=
e
inject_fault_probe function when performing the injection_list_remove.  Or =
we
can just keep it the way it is currently.  I'll leave that to your discreti=
on.
-Jonathan Cavitt

>  		inject_fault_probe(fd, pci_slot, function_name);
>  		igt_kmod_unbind("xe", pci_slot);
>  	}
> --=20
> 2.43.0
>=20
>=20
