Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F381C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 21:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DE0112EF9;
	Wed, 24 Apr 2024 21:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GskLHNqa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DB6112EF9
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 21:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713995796; x=1745531796;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YZIPsOOuRUbiAPMgQYHsymW+GLYC/izrylqNaWy6Vdc=;
 b=GskLHNqaEZOVwnwVGyoV353wjyqlfGSeelmbC9p7phmA7vt4QsvJJHRf
 xpSGBvKk0GY8+74Ktn0fLVSYEMbXD3At9iqHF2+fJ1yLhYm1n5kJdYHqK
 6ujs2TLE5NvRQ/lQ3YIzlEX/5jzh2tPlm0Jvp/w+CAiXnIvuOJ8knJ4OL
 8XOBAmSkVuf1IxdjKd71utU7qqMq8VKYf95J1tYgR8lo2RE6vHohbLTaQ
 pJexxG/NpeO6req55yK9UxTAMDGccDMDsbVOBJQqXVd4+cHFzT8+L0Gny
 FxKOcr/PQLijNwOjx8VLMZbFoG6ZyXFYYu3Z3q0ngH5D2XDgvnvUrnyzY A==;
X-CSE-ConnectionGUID: InGFpw9dTpKTRnNtfSqG5g==
X-CSE-MsgGUID: IB11IXnnTj6M2ksKoy+ScA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="27170485"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="27170485"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 14:56:35 -0700
X-CSE-ConnectionGUID: PZebymx0Qu+i1S5nYdDksQ==
X-CSE-MsgGUID: oCHNgwkLSceko8DtdOCV0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="24800887"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 14:56:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 14:56:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 14:56:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 14:56:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YG6hpfj3B33q+0M07FId1qE6Dxkt97L4Zrb4PUpLlcUhWNzPAeUmsMtlcz5h+b2EjTztbmeX/PXZ31PZa6cuVppgZ/6mjPPpNbXIvJb6aqn3txyb+ZnD6FwTyCdxswIcXdFsNnaP5Nupb2XzoGr3RfJee2vioopfXn0d2YsMEqoyh5EePNARRTsYTDNDWGMtv1cTetisQtn5gefLwWqAa/TEP4YyR+kEwrM6p+fkxDLDvhBbliVBOsyzEA+tTcYz2hb5AFIU+ABLGMR987NNkvpbaC+EIky3/0C+jHzCp8i8RejmSSqOW0TXvCIy3UUecudK45UMEpJ+gINAP5ggtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzF+/jeICjlZ9hyET24xf1po+AN9uLqA/jtUH4K0m44=;
 b=HE24mg8nKWDNTa2OoStqQQjmzFUcGpvRu9eXTq+IvaQ+Ao398LSCHIv5l0VHLXyB3F/Zq9Sipk1ZyDhz5p239xTziMnU4z1P6QYhOQ2vNnL/wy3eWelZJ5CZs37OXMDiBIWWE1E1hyTEveCef9o8QLkkqU+6M4ixERl6Q+4IxkhXZeaj/yT4PROHBAc8Y3br0swFGCU0sh6stVluHcd2FSuzvhvgYywwSB9Nb9odDP+YOW/7xGq+kmMsTLqPhL7tac8v2DKl/kvWSub+T8+fELH3mFxy6XJPTf+v8l+jtwsmvnunZ8pKjIRhxme8kwoEM15XyGwKXhg2FVrBavO88Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6371.namprd11.prod.outlook.com (2603:10b6:208:3ad::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23; Wed, 24 Apr
 2024 21:56:32 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 21:56:32 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t, v2] tests/intel/xe_vm: Always have at least 2 pages
 bound in mmap hammer sections
Thread-Topic: [PATCH i-g-t, v2] tests/intel/xe_vm: Always have at least 2
 pages bound in mmap hammer sections
Thread-Index: AQHalpJEv2bk+2p1aEaOi1MOZ5byvA==
Date: Wed, 24 Apr 2024 21:56:32 +0000
Message-ID: <CH0PR11MB54449BB50CE7F774B3A9395CE5102@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <f64507be1d789da9c6a22ece15e88d0f7d4a147c.1713994566.git.jagmeet.randhawa@intel.com>
In-Reply-To: <f64507be1d789da9c6a22ece15e88d0f7d4a147c.1713994566.git.jagmeet.randhawa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6371:EE_
x-ms-office365-filtering-correlation-id: 67f6bb2a-6c9b-4a3f-f3fc-08dc64a96746
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?3BAEgVt2TUCwXan70CezdQvm4XLWZeYs0dx+taj+HPT4Hn61wo4eaSzLGxx/?=
 =?us-ascii?Q?UPs5NdixjxjY2SNoetlJsLwvqVn6ah/vi4isq0t1wGaMUG0eWSdb2YmePX2i?=
 =?us-ascii?Q?tRd1n7JbzvrQFzbP2hMxFB2/6S2mzG5K6Q7ylS4aU1KQ6yhDStRzTgPNUTIW?=
 =?us-ascii?Q?jXWb/F6LInDJzx6McNgio8JEbHyzXbs7tvhTLNA59TSIFhcgPKn2VKsRs4Bn?=
 =?us-ascii?Q?12DFcjY0r6HmeGkzDTd0sgxFqEnmXgNk4/9fxhYGLd62W2GaDdISK5e5V8BW?=
 =?us-ascii?Q?aRBul0smqwtl1Tso4nxqLGvCW9DRjNoT27lR/lm5P6TB4i0hVSGfNQXzHmqt?=
 =?us-ascii?Q?hdqOUSkdmn0HnAgdzf8t3gmEba45llgRQmTXizCFdKJnEmTvDin4ZZ3ByAbC?=
 =?us-ascii?Q?+kR/4D3LZH1r0pzDSQGUFrOYUInPwbrUgSwLVLh85uc99lbbyGlo530h5nxm?=
 =?us-ascii?Q?Hf1wq2ckGCClFG8T7pKKqAusOH1mP26BeOKaj4XTszbLvWHlnVaSJdDHQ9mx?=
 =?us-ascii?Q?5R0lltz1D3unyjqHcr9bmV9+IQKZLyvVKj3pbqKeD4OW/wv2i7Gv76zm8QPU?=
 =?us-ascii?Q?d3o40QovPf1OBdKSnrh7OqaoS3IoAPvWcvbdC0mRAlnhhR6vjRdb7SfaBpdF?=
 =?us-ascii?Q?JLWoe71IvYRDy83/3p1o65ldMQ08lYywx4LukH2xQLgl9qpVTjVD/gX3hnaN?=
 =?us-ascii?Q?kYQhadfbh88jehbWfqFuv4KIZmpcI6eykOGVju416xo8yK+S74qUeXJEieJ4?=
 =?us-ascii?Q?WMWVOHssAAckLi76dvBXfDu7kioumlniY0e6bLdIMDYpq7kwIICeuo8Q6CF/?=
 =?us-ascii?Q?2Q6qsHSrEU83CAiQHqtlEgfGeoeXzp13aNLWS+wadc2RwNzIEMLs5smbf0VX?=
 =?us-ascii?Q?kHKhAzuRtNMUgT6rCPbDKEhc1m8GfPdLFcpD6y6z9WGgWMVhUjw46zmOppwM?=
 =?us-ascii?Q?N5kv/7U7IaA3jjaL0qRqjuCJXFXIU/aSZTeggQ8VoD5WAyoIKQZUCgIEA+bI?=
 =?us-ascii?Q?b4NQUOd1PsSp/ZewDJGoP24l2F7JLH79m4E4rPzTXO533yi62lRhJbvwXQ6O?=
 =?us-ascii?Q?dJr8m6Gv59oseICytTNIfzyqHKv2GUWqZAoXyfnvGrWEcO7uBxHG4naW01Ik?=
 =?us-ascii?Q?mX+3CnOAIBNXlgVhHYw8Ot4ODK8axwL2hKM9EkwWWeCdQriLwKQt1QxwnYPN?=
 =?us-ascii?Q?ddNn28aBxlQkNlg/J5kjFNaK7aGMkBxNIJVudf5Syp1rPBvl9s5vCR4WRrDl?=
 =?us-ascii?Q?8n+8NmUP/3B5foTE2RgWJ/zpdVZzi0KxMtU0/2QcrL64hY8DXc68N4U0eLS6?=
 =?us-ascii?Q?RDlDukxWQEb/x5lsReq8tyVI/vM6vwf3JvNuARi+O1g1RQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pjKaXTl6Pq+0Eosb2hOE3QLeM3Pq7+YjdZzwdxCqRbDI5CzbXR6yhPcrZ5rg?=
 =?us-ascii?Q?7uteJ9mByROkjkvNheq/YDfm9Au3fIdUFfy7CJrvfqc3Pg1YCpgpZIQZZ4lW?=
 =?us-ascii?Q?YjGVEOPEMjHhT0KesNozmXJOEYXUxUnXmQ+QDXUGUkB7km6cCnRHoLhLzePC?=
 =?us-ascii?Q?+/uOwD6NGLTKwNWQJbsnonUdhJgKSupOFxwJrp1+Jd3DdAaJ/lG8437vuRtO?=
 =?us-ascii?Q?Hffc/mtUGG+2nDp5Uw3ML6B0Ek0xmcdOKTdpVT8wUazACnEK9GqLfnp7pXoy?=
 =?us-ascii?Q?7ihPMEguU6iYf1rXSPqELbIG7wzwwj9DMv9eYDBHQzj915AG+n46N/ximFx1?=
 =?us-ascii?Q?aMe4Y/3UVBVssMHjuZqH8oHzK03Rf7WnqnpB0eI7TQINEQtHYZv8c3Z58EhM?=
 =?us-ascii?Q?a02N8AWkM7ir2n34uFgwnfXqBgSvLQg6rpnva05zuLCE4W+bhd0TshFkIclR?=
 =?us-ascii?Q?M6rbOdzwZVZkC7hdlijnOP3WnvuxXqPTV0kOe8+/1IBUl4EfarxutM4txEeF?=
 =?us-ascii?Q?cm09NLXFIyro8ftJkHvaBMrc2c51v5Z53RQGAxYXhM+ffVzxAiI7UiISj7R2?=
 =?us-ascii?Q?JPVPOFdKoaQ+dx9zrl1Q2sA6EGLKldPyExBo+xXOlqAu/5hkmtdfqg7RR38x?=
 =?us-ascii?Q?KG2uq1laPRZnNpLGRSuUKlLSAoP1aLpfFSTeL4S980UEsUGCyIZmkcwEzvD9?=
 =?us-ascii?Q?QkZP/BFUY3TD5eQ9yhd757bEDbOVKxR2u6WL6MOH5ZG5eG5KxeECDoNVbFLi?=
 =?us-ascii?Q?Y9YXPfZzlvi41eBo1vkfEKAHNVqVKahxkxafDNLDUWeUOIOmdh4VTRRouXWx?=
 =?us-ascii?Q?sCNbSlrADbT09J4rTn3vKsvAEsNPyDWH0t/JMsxt8A6WLIhGku2Khc3gI6mG?=
 =?us-ascii?Q?d2B7J2ypcAZ6jB2qHzX56EuFC5BNkac5Iwi5tzuNQYuicMtASYswYKAWbucz?=
 =?us-ascii?Q?m6un2IM3H2I/ws8fJ4Rt90hgi9Ss36C74HKdMRNmawVYu6dbW7pdydI0hi98?=
 =?us-ascii?Q?LGswVFVHeaMFZlkL7Lur+gbEwdmTLznDylMw73vyV7wEwVPEENrOl4N1UHqJ?=
 =?us-ascii?Q?gPfCq6kyZKHp12rB0Taz9Hfh01zZ5H0DMOu1SUK2ESCbVPkxglXahzR8Cj8K?=
 =?us-ascii?Q?CYSBTpq5ThEitNzG8xGcGgsm7tyDOTQzq0OvMVKSOZjPQ+UBmCw3BdgrZjni?=
 =?us-ascii?Q?73JRrfauyXyKciwPR1cpo3EwCgNHCA9Sf6j6F0CKb/Q786osvRsYGDSUe1F1?=
 =?us-ascii?Q?GBv4XmnKCdOFTfi67u1rlHp1+BM+klttMwHCjpotLbKvIy5TG/5auhFkQO6e?=
 =?us-ascii?Q?b2O1D6YotxGKHl+1moC1y3pWldof+YrHs9/Y7DiBpKT6QyOCEj9hFn+E9aF1?=
 =?us-ascii?Q?t2G1brJLNpvEwmbIBCZV2oDFwWpbhqFoYxYCF5fN8zilfMudpDy7+zjp1W4H?=
 =?us-ascii?Q?dAPtP5d6RjNvWVbB0IsE0cknoPzX0sJ8NXA5K7Ndzcflo2TIjmb4THfQL72L?=
 =?us-ascii?Q?slTQH9/qFb0uxY/bUvn3OGHN+sD2dto0Y4J8eXNvBFUaGmB5SbpSW23AYRND?=
 =?us-ascii?Q?UEK3hgBseQc0quVITIYVdMR7xvnFiQaAMstu+U4X?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f6bb2a-6c9b-4a3f-f3fc-08dc64a96746
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 21:56:32.4512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TomVPnPXpSsJXt+ZO7CkWo4ZOWpHRsr6f6sOaIE92kAWHrJsX5F4V2DQPGv0IK5FSj7UpCMOc9zQuh0STEUp7nql0wBsHMWjMKKwB/JC0sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6371
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
From: Randhawa, Jagmeet <jagmeet.randhawa@intel.com>=20
Sent: Wednesday, April 24, 2024 2:42 PM
Cc: igt-dev@lists.freedesktop.org; Cavitt, Jonathan <jonathan.cavitt@intel.=
com>; Brost, Matthew <matthew.brost@intel.com>; Randhawa, Jagmeet <jagmeet.=
randhawa@intel.com>
Subject: [PATCH i-g-t, v2] tests/intel/xe_vm: Always have at least 2 pages =
bound in mmap hammer sections
>=20
> Fixes: ee0a9c8e30f6 ("tests/intel/xe_vm: Always
> have at least 2 pages bound in munmap hammer sections")

This goes above the Cc: Jonathan Cavitt line.  I.E.:

Fixes: ee0a9c8e30f6 ("tests/intel/xe_vm: Always have at least 2 pages bound=
 in munmap hammer sections")
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

Also, and I don't know if this matters, but the newline added automatically=
 by vim should probably be removed.

>=20
> This patch extends the recent improvements made
> to the munmap hammer sections by applying a similar
> fix to the mmap hammer sections.
>=20
> If the prefetch buffer is 2k or larger the munmap hammer sections will
> prefetch the next page, if the page is unbound a fault will occur.
> Account for larger prefetchs by always having at least 2 pages bound for
> the hammer thread.

I'm not certain copying the commit message verbatim here is preferred.  If =
you want
to denote that the two patches are related, the Fixes tag should do that, b=
ut to be more
direct, you could say something like...

"""
Extend ee0a9c8e30f6 ("tests/intel/xe_vm: Always have at least 2 pages
bound in munmap hammer sections") to apply a similar fix to the mmap
hammer sections.
"""

Just something to consider.  I won't block on it.

>=20
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  tests/intel/xe_vm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index de2b1a813..9872df832 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c

The original patch (tests/intel/xe_vm: Always have at least 2 pages bound i=
n munmap hammer sections)
also had the following change applied:

"""
@@ -1263,6 +1263,11 @@ test_munmap_style_unbind(int fd, struct drm_xe_engin=
e_class_instance *eci,
 	int exit =3D 0;
 	int n_page_per_2mb =3D 0x200000 / xe_get_default_alignment(fd);
=20
+	/* Ensure prefetch will not fetch an unmapped page */
+	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE)
+		igt_assert(unbind_n_page_offset * 0x1000 >
+			   xe_cs_prefetch_size(fd));
+
 	if (flags & MAP_FLAG_LARGE_PAGE) {
 		bo_n_pages *=3D n_page_per_2mb;
 		unbind_n_pages *=3D n_page_per_2mb;
"""

I think something similar needs to be added to test_mmap_style_bind (for co=
nsistency, if nothing else):

"""
@@ -1568,6 +1568,11 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_cl=
ass_instance *eci,
        int exit =3D 0;
        int n_page_per_2mb =3D 0x200000 / xe_get_default_alignment(fd);

+       /* Ensure prefetch will not fetch an unmapped page */
+       if (flags & MAP_FLAG_HAMMER_FIRST_PAGE)
+               igt_assert(unbind_n_page_offset * 0x1000 >
+                          xe_cs_prefetch_size(fd));
+
        if (flags & MAP_FLAG_LARGE_PAGE) {
                bo_n_pages *=3D n_page_per_2mb;
                unbind_n_pages *=3D n_page_per_2mb;
"""

> @@ -1913,12 +1913,12 @@ igt_main
>  		{ "one-partial", 4, 1, 1, 2, 0 },
>  		{ "either-side-partial", 4, 2, 1, 2, 0 },
>  		{ "either-side-full", 4, 4, 1, 2, 0 },
> -		{ "either-side-partial-hammer", 4, 2, 1, 2,
> +		{ "either-side-partial-hammer", 6, 2, 2, 2,
>  			MAP_FLAG_HAMMER_FIRST_PAGE },
> -		{ "either-side-partial-split-page-hammer", 4, 2, 1, 2,
> +		{ "either-side-partial-split-page-hammer", 6, 2, 2, 2,
>  			MAP_FLAG_HAMMER_FIRST_PAGE |
>  			MAP_FLAG_LARGE_PAGE },
> -		{ "either-side-partial-large-page-hammer", 4, 2, 1, 2,
> +		{ "either-side-partial-large-page-hammer", 6, 2, 2, 2,
>  			MAP_FLAG_HAMMER_FIRST_PAGE |
>  			MAP_FLAG_LARGE_PAGE |
>  			MAP_FLAG_LARGE_PAGE_NO_SPLIT },
> @@ -1926,7 +1926,7 @@ igt_main
>  		{ "front", 4, 2, 1, 3, 0 },
>  		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
>  		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
> -		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
> +		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 2, 4 * 8 - 4,
>  			MAP_FLAG_HAMMER_FIRST_PAGE },
>  		{ "userptr-all", 4, 2, 0, 4, MAP_FLAG_USERPTR },
>  		{ "userptr-one-partial", 4, 1, 1, 2, MAP_FLAG_USERPTR },
> --=20
> 2.25.1
>=20

Move the Fixes tag, and add the missing change to test_mmap_style_bind, and=
 this is
Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
