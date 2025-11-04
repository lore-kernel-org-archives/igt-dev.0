Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8967FCCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 14:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFF710E62E;
	Tue,  4 Nov 2025 14:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMDAVHSq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD9510E61F
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762267755; x=1793803755;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=o8JB0wZ4vECg2SiGQDbJVsOk3Ha/ycYE4vbNIxgeveE=;
 b=kMDAVHSqPh5wMcDtIaQhKV3R7Ee2J3YbP8v2FIBjAVHurZJHpPsIX6WU
 s88emU7H6aEnlN1nH+1voYus7VY4+wFrbVU8iPG/dONkSo9ISH+B7R5d/
 aXXqPf+iEG+zwyls6kauNtka05ZM3YQio8ZhzCHWM8R3uYBD9HgiipfID
 jIP1hSMH3iNxY2tdznIht1CGDpvmmGbNmikhN2B3zWSFZorgUbvYD6Ud7
 A3daK77+1pP/CqmIvzJ6Yg13PNZND+IGVfAMLSGmPo5WxZ1AqAGfGljtV
 UoqoEfGuwb/vb/cyuYtAm5MvDQFrK/g+cEZJimdtQKm2JcqJj2mfUNKvK Q==;
X-CSE-ConnectionGUID: mRUjvb7KR8uP58JmxKJs4A==
X-CSE-MsgGUID: 9TCJqqfJSb+i+0Rhru4qCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64247543"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="64247543"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:49:15 -0800
X-CSE-ConnectionGUID: eN5r3xzFQNe2Z2VHRi+e/Q==
X-CSE-MsgGUID: WwuubSazTSC6FgCUrokaAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="192264454"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:49:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 06:49:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 06:49:14 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 06:49:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHN6cjj1Kt2TcsfTcM7IWE9Fjn+dRsY0Sn5eLiqriE1hb998q1WSRaxdyI4Lo6gs4l2uMDXlJi0ewA+NZDJuDC81d9Mf6g3mGH0jzMcL78x8EDW1luk/oq0qoTzoaipvixPgzgXqW6N3dMDmeTm0GP3l9k3fGgfDLpjBhgemXu2ZLdK3vcXUI6Ek7eh09MnKbM2tf74xST20myrGe9F0ebA6n83OKff4+kYO2AlcW9t4FCoO/6eAJLK5wG1CvsY2Q7ui8QrpUMWHQHgCeIpgi0BCawkEOA5mwW3L6FQwmrl4sSNBH6rDf8KJNFFpXaUwTkMCEhpHzaIY57M0nvU2Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYEBhP3lutfNlXFA/V9jFEv/FHeGXoFYzjcSAFZdHCU=;
 b=azDGnwlXs7nN7IKmnq/xBZ19kxXjJKBOKH9lb9rbo/wluH0u3nDs7o1/sHieyFNWDj/yM5cUiUgIDi20j2hcPoHq+uLzf1auAXd7WbhMB5c9C+4GuUTCdA6vvBLSIqZpnr9FxuGaqEBtDingbVfk3m6pb+hEwxiKc6NFX13y/rRIGL+FQInYya4l2J9IERxsaJ6/na8VKk3FU+vGkP+Ctsbsu5ewiFpv7wyJGaX36L9x6NnhzEORYzSyYeHts9/xCDcfLS8VVSBSaAvnD8XUlNy576sNRZ+Dqnd/SRlF7YctPUrOJ/YC5LJRUXcMHjkh+JbboxRoyeW5hoThSwHN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 14:49:07 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 14:49:07 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma,
 Nishit" <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v1 2/7] tests/intel/xe_multi-gpusvm.c: Add SVM
 multi-GPU atomic operations
Thread-Topic: [PATCH i-g-t v1 2/7] tests/intel/xe_multi-gpusvm.c: Add SVM
 multi-GPU atomic operations
Thread-Index: AQHcTZh6tn6GSirLIEigs5Ny1OscILTil38Q
Date: Tue, 4 Nov 2025 14:49:07 +0000
Message-ID: <CH3PR11MB84347950FCC35ED2AAC34BAC8DC4A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251104143631.51831-1-nishit.sharma@intel.com>
 <20251104143631.51831-3-nishit.sharma@intel.com>
In-Reply-To: <20251104143631.51831-3-nishit.sharma@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CH3PR11MB8707:EE_
x-ms-office365-filtering-correlation-id: a2bbce6c-e7a4-43ad-bd63-08de1bb14e8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?tkDm4iVfUDjbQ3vLIIGYz+zLY+ky1ngQ7iqWgGXo5x1CFKu36LX+GGuoqpPM?=
 =?us-ascii?Q?WVpoFCXkZpXWHbqWjpTiGcJ3AMh4lzLPWEM71/IKySWm9pY//NBYkhdE8OZ8?=
 =?us-ascii?Q?PDJD4GxeGM76We6jYbEiPz5pYUV1sxogFmhbjlSX6zriXMod/p721Yt58L/q?=
 =?us-ascii?Q?4KJyreAoWp8oiPewTm3n0vddjHEOziHgHLveZ/cpSGAF0yvDZOoXag0ZlVEN?=
 =?us-ascii?Q?1Y4GdBa8OK3n+X7YFmLOgLRAIdouzIzwiYh2ZLnwyx5snqBp7dK3cMUm1enb?=
 =?us-ascii?Q?uxG4eRx/RaaIGKIHxJoEbZrplEcdB+ROyDN7d5WpK+k1fdlRyc3k5pk4HCPs?=
 =?us-ascii?Q?xryeboIrcuYajh4nt/gHhMWXM1AOgLjzzS+NOjyDoiiAmxb+5WXSkJlW/Mpm?=
 =?us-ascii?Q?Rv2NfYkCoqFMfSQ8saKnYC8wIncENcfpAcw7+Vyl1xEKqPwNwtEjxFnE9+Q5?=
 =?us-ascii?Q?eYkUV3Z5N3gXE3JWmh5AO1XVKvVe4Kqmvujl6vsx8ye6yj1tEq1PJ5uJDy9/?=
 =?us-ascii?Q?jyzCMNjdRbB7ZQogYEDUyPqoTxof81hBEjjiZWyyGdZxyGRC/wB4kaEylLTY?=
 =?us-ascii?Q?0HC57M+CqcK7Wy3V0cn+TjxNPdCJBJSUfD1G/rLduEwulTFsNdDIAj4oflrp?=
 =?us-ascii?Q?qogmG5LWeAH2uMQvEndaQB1gtf/ci89TiTimoWxeFJIZYhpaST5uyJFmTZkC?=
 =?us-ascii?Q?dCFDJOCgg3dDgcSZ99IB5acNZtrMu7iEacZPC17xhCbMMWUQrM+ixWABqncZ?=
 =?us-ascii?Q?FweBorUv9CuRmGRIduuVjkIav5xp1tx95vmogjyNaoY+f4BecXvcgjg6fvxC?=
 =?us-ascii?Q?N709b9FHFxpdLjpknWTSTKeyLtMQGnsPvODCUweESWyfS71sTltUKvr7nUJz?=
 =?us-ascii?Q?cIcztwmk8ef0/VR5BEVHzBatpMRW0qRci5fV9+SzJSYrLeD/FwtNNNdYCBB/?=
 =?us-ascii?Q?MGT6ZKLKemGr6Nca1HCY+h+oMJBX7clxawyrnSzfUgMGVQwiBFEjmbdY3ZEa?=
 =?us-ascii?Q?OI7x3NN7KQf8ONnWm0vPveWW6ef1HfUxZBKrhvda7W5UQWgk4QOSlpixd09w?=
 =?us-ascii?Q?cWE0uEOFBwJm9jq5XzlQeW8Ib14scUh+ldIIN0r8dDVzLlA8kn00Ksh6j8Et?=
 =?us-ascii?Q?xtYKPC/6LqI+rTtOwkjtto5FXY+1SGzhxBCvRHRe8SikoIb1IkbxIgJ8cxRc?=
 =?us-ascii?Q?E+6lETUaU5MY2UNO8NQwcQ8Lv1HtLeuv44ktD7nH65IYBszqw8TgFIoeGvH0?=
 =?us-ascii?Q?vX7rb6HFLIcEHLi1s5cmNalKVudXDtks0AsWOWvyiKC+bWmfmwaPizRhn7aP?=
 =?us-ascii?Q?9QMtNlQlH9p8MH/6qfVvXulhAG+6QcfAZPW/9e08hV8oz7e5Cdh7tvfJWduZ?=
 =?us-ascii?Q?47wXE+FqVql0+wJzfdxg9ohBk7tzp/+T4cSm33wozSL9/l+PGU/NOJfSIlOS?=
 =?us-ascii?Q?8AI6ILNAHnOwBAG/3GSFznBtpYSKARKTL612pNvCtwQSraErbKAfzxeOL8bv?=
 =?us-ascii?Q?vSr+FyulVkiEzW/hX1mZmLvJeqVFBP9PRJjw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UvnWDdec1R26sbHzy9D+/9o+LVdPTVXbZLl4SfQNTbgkwAo9sb/QBAM1twgT?=
 =?us-ascii?Q?JMw4gtMCdiHAaNqi/UAB7XCiSqr/hJrDYDZeRa9jjBRKYP30xzQBDWeYRVY9?=
 =?us-ascii?Q?2frUzrLGykEfr8+tNQiJiq8pfITuAC90N9cQZa66jE3f8DC7530mxeqU8rR+?=
 =?us-ascii?Q?Jojx4rjOHRVQWuegRPw1aNLqS8wJWwjj4PnsPmFXpbzSxscWYSwrXjhTWchY?=
 =?us-ascii?Q?fa9PFlx6Gxz6HfGTsxKH+QgW/DEILuRFdk5MPBthMsfNLXTdqjJUEe22uOBS?=
 =?us-ascii?Q?wDuaXaJh6+AththqLpa9Vt8qZTM9SZGzV9Vioq4SZ/FLTK9HAbwz83ESAtCy?=
 =?us-ascii?Q?W954AxdvII3ozfuOb9yB0Fu+brJ5sDao8qpeu0GncUpegOC18MFO6y8pgeaj?=
 =?us-ascii?Q?dGL1IqXGgbMHQKweaYjWHK3C60xS7BRJx0FRqHsbUNI5NAtNmkXxazbG8uM7?=
 =?us-ascii?Q?W8MuCa3mRi32B4Ai66r2VEHRfoNqZG7sxOsON4B3W5oLPpYIfvBzz2tE6Sts?=
 =?us-ascii?Q?hOHz6BY1QLD2gHJS7LpPO6M/xUXoWZ1XTLVb8JhPzEvE1cLxSXQA34E4io8w?=
 =?us-ascii?Q?2dmCh1u4qTkgGjDX+fOrlzNtAYiwayuqtpERg/Z/IBtmnrubqR2nuPMbMZvt?=
 =?us-ascii?Q?6eWMS5BXlJXZ94ywBbVooO6YONEXdx68I2GcvBN2iRQNp41N1kSa2vzZGrzj?=
 =?us-ascii?Q?kZlRex6qdJxmaSH6j18fbGV4egxVquL7jl6Xj+EoEkRe1T8OYOBgIV49CChP?=
 =?us-ascii?Q?O4ME66pdowUTK2pbmPD0MRu3caB8syBQlx+pvKEizoWIkYvavFZ4rknQx7GF?=
 =?us-ascii?Q?QnH3PEz2b9fmf3hnZIfzjxAOKH1iIA6mLkgRcEqLQ3qCikJTzNHFSa7YrEf2?=
 =?us-ascii?Q?0sguL1CTBqfqeG0myT3G5PdGqhWhpXVTIPKemH83KiUJW7Gb8IvP858n5+31?=
 =?us-ascii?Q?b9dRUYfae3gCeOb+j1WUetxMQ7DxDuNMnogQkfG+6Jb1ZB/CUTAyXmcCn3ta?=
 =?us-ascii?Q?a0UjehtjhytZDRNxVO3OT+ppbM7dZPAL9kghfzKCCx6c39L/Dv0hpmut7wAL?=
 =?us-ascii?Q?9DB3CDisKoo97jVIU25wHX2z+BjnZMOdGw+yWrFc0BAiUW298PlggTw6I/oP?=
 =?us-ascii?Q?kAgt80ztGisibtZsZnJSOqZYY1WMng40ZmN0ngjCiwTSJTDCT1AmUby1p9tH?=
 =?us-ascii?Q?JtGnxs6zm5CgjeDJJtI+asmr1T81OLDnKP4nRcAjPu98pwZt19pwWe2iG9OZ?=
 =?us-ascii?Q?NDn9Mb7ygz1CZjvaHzsM9n25l7veMwFslfV3eTKXyaj+9LDreybZaM9HueH/?=
 =?us-ascii?Q?2yh9dcMwdRhbM92ZaYifa581OexioJji93a2lS/64VsNBKp9lJCuWgPTMvsN?=
 =?us-ascii?Q?02W2tJjoBLjTdncN5DSlvRWTrz2zGf3rdgmnclAZnvsPDC1kdJWFDROFiY0S?=
 =?us-ascii?Q?WTCZcfbb/JK/mCteMyRKdUJtoy8ROpfgbEr2DfKvmPb1BadsAPjG6dN2/ul5?=
 =?us-ascii?Q?8TatGQOYIk6NXRYIXMKxRJXayY29uPmP3P4R8ocpSy8MIoMH2msgwsCrLhi5?=
 =?us-ascii?Q?vbbZzEHxpsJeyJNfcF0kYQvoA7kAcGMGAPaPEwaGiUgs+roaq3ijj395STlY?=
 =?us-ascii?Q?WQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bbce6c-e7a4-43ad-bd63-08de1bb14e8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 14:49:07.4058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uA9x1rlB6F0CsEZUWbE38htB6aALYOpCsYkLpPgqvZzi0pstgnNVpOV9jDlALwvdq5ItTA/yUQHIxmdK0SWVaMWZoU7rGivFKO96m7VUyG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> nishit.sharma@intel.com
> Sent: 04 November 2025 08:06 PM
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit <nishit.sharma@intel.co=
m>
> Subject: [PATCH i-g-t v1 2/7] tests/intel/xe_multi-gpusvm.c: Add SVM mult=
i-
> GPU atomic operations
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> This test performs atomic increment operation on a shared SVM buffer from
> both GPUs and the CPU in a multi-GPU environment. It uses madvise and
> prefetch to control buffer placement and verifies correctness and orderin=
g of
> atomic updates across agents.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_multi_gpusvm.c | 186
> ++++++++++++++++++++++++++++++++++
>  1 file changed, 186 insertions(+)
>=20
> diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.=
c
> index a88b46323..71bf01ba8 100644
> --- a/tests/intel/xe_multi_gpusvm.c
> +++ b/tests/intel/xe_multi_gpusvm.c
> @@ -31,6 +31,11 @@
>   *      region both remotely and locally and copies to it. Reads back to
>   *      system memory and checks the result.
>   *
> + * SUBTEST: atomic-inc-gpu-op
> + * Description:
> + * 	This test does atomic operation in multi-gpu by executing atomic
> + *	operation on GPU1 and then atomic operation on GPU2 using same
> + *	adress
>   */
>=20
>  #define MAX_XE_REGIONS	8
> @@ -40,6 +45,7 @@
>  #define BIND_SYNC_VAL 0x686868
>  #define EXEC_SYNC_VAL 0x676767
>  #define COPY_SIZE SZ_64M
> +#define	ATOMIC_OP_VAL	56
>=20
>  struct xe_svm_gpu_info {
>          bool supports_faults;
> @@ -49,8 +55,45 @@ struct xe_svm_gpu_info {
>  	int fd;
>  };
>=20
> +struct test_exec_data {
> +	uint32_t batch[32];
> +	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +	uint32_t expected_data;
> +	uint64_t batch_addr;
> +};
> +
>  static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
>=20
> +static void
> +atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
> +		  uint32_t *bo, uint64_t *addr)
> +{
> +	uint32_t batch_bo_size =3D BATCH_SIZE(fd);
> +	uint32_t batch_bo;
> +	uint64_t batch_addr;
> +	void *batch;
> +	uint32_t *cmd;
> +	int i =3D 0;
> +
> +	batch_bo =3D xe_bo_create(fd, vm, batch_bo_size, vram_if_possible(fd,
> 0), 0);
> +	batch =3D xe_bo_map(fd, batch_bo, batch_bo_size);
> +	cmd =3D (uint32_t *)batch;
> +
> +	cmd[i++] =3D MI_ATOMIC | MI_ATOMIC_INC;
> +	cmd[i++] =3D src_addr;
> +	cmd[i++] =3D src_addr >> 32;
> +	cmd[i++] =3D MI_BATCH_BUFFER_END;
> +
> +	batch_addr =3D to_user_pointer(batch);
> +	/* Punch a gap in the SVM map where we map the batch_bo */
> +	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr, batch_bo_size,
> 0);
We are not unbinding this anywhere. Can you check this out.
> +	*bo =3D batch_bo;
> +	*addr =3D batch_addr;
> +}
> +
>  static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
>  		       uint64_t dst_addr, uint64_t copy_size,
>  		       uint32_t *bo, uint64_t *addr)
> @@ -222,6 +265,144 @@ gpu_mem_access(struct xe_svm_gpu_info
> *src_gpu,
>  	copy_src_dst(src_gpu, dst_gpu, eci);
>  }
>=20
> +static void
> +atomic_inc_op(struct xe_svm_gpu_info *gpu0,
> +	      struct xe_svm_gpu_info *gpu1,
> +	      struct drm_xe_engine_class_instance *eci,
> +	      bool prefetch_req)
> +{
> +	uint64_t addr;
> +	uint32_t vm[2];
> +	uint32_t exec_queue[2];
> +	uint32_t batch_bo;
> +	struct test_exec_data *data;
> +	uint64_t batch_addr;
> +	struct drm_xe_sync sync =3D {};
> +	volatile uint64_t *sync_addr;
> +	volatile uint32_t *shared_val;
> +
> +	vm[0] =3D xe_vm_create(gpu0->fd,
> DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			     DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	exec_queue[0] =3D xe_exec_queue_create(gpu0->fd, vm[0], eci, 0);
> +	xe_vm_bind_lr_sync(gpu0->fd, vm[0], 0, 0, 0, 1ull <<  gpu0->va_bits,
> +			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
> +
> +	vm[1] =3D xe_vm_create(gpu1->fd,
> DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			     DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	exec_queue[1] =3D xe_exec_queue_create(gpu1->fd, vm[1], eci, 0);
> +	xe_vm_bind_lr_sync(gpu1->fd, vm[1], 0, 0, 0, 1ull <<  gpu1->va_bits,
> +			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
> +
> +	data =3D aligned_alloc(SZ_2M, SZ_4K);
> +	igt_assert(data);
> +	data[0].vm_sync =3D 0;
> +	addr =3D to_user_pointer(data);
> +
> +	shared_val =3D (volatile uint32_t *)addr;
> +	*shared_val =3D ATOMIC_OP_VAL - 1;
> +
> +	atomic_batch_init(gpu0->fd, vm[0], addr, &batch_bo, &batch_addr);
> +
> +	/* Place destination in an optionally remote location to test */
> +	xe_vm_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
> +		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +		      gpu0->fd, 0, gpu0->vram_regions[0]);
> +
> +	sync_addr =3D malloc(sizeof(*sync_addr));
> +	igt_assert(!!sync_addr);
> +	sync.flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync.type =3D DRM_XE_SYNC_TYPE_USER_FENCE;
> +	sync.addr =3D to_user_pointer((uint64_t *)sync_addr);
> +	sync.timeline_value =3D BIND_SYNC_VAL;
> +	*sync_addr =3D 0;
> +
The above is sync code is needed when prefetch_req is true. So, the above i=
nitialisation can be added inside the if condition.
> +	if (prefetch_req) {
> +		xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, addr,
> +				     SZ_4K, &sync, 1,
> +
> DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> +		if (*sync_addr !=3D BIND_SYNC_VAL)
> +			xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr,
> BIND_SYNC_VAL,
> +				       exec_queue[0], NSEC_PER_SEC * 10);
> +	}
> +	free((void *)sync_addr);
Free also can be added inside the if condition.
> +
> +	sync_addr =3D (void *)((char *)batch_addr + SZ_4K);
> +	sync.addr =3D to_user_pointer((uint64_t *)sync_addr);
> +	sync.timeline_value =3D EXEC_SYNC_VAL;
> +	*sync_addr =3D 0;
> +
> +	/* Executing ATOMIC_INC on GPU0. */
> +	xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr, &sync, 1);
> +	if (*sync_addr !=3D EXEC_SYNC_VAL)
> +		xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr,
> EXEC_SYNC_VAL, exec_queue[0],
> +			       NSEC_PER_SEC * 10);
> +
> +	igt_assert_eq(*shared_val, ATOMIC_OP_VAL);
> +
> +	atomic_batch_init(gpu1->fd, vm[1], addr, &batch_bo, &batch_addr);
> +
> +	/* Place destination in an optionally remote location to test */
> +	xe_vm_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
> +		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +		      gpu1->fd, 0, gpu1->vram_regions[0]);
> +
> +	sync_addr =3D malloc(sizeof(*sync_addr));
> +	igt_assert(!!sync_addr);
> +	sync.flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync.type =3D DRM_XE_SYNC_TYPE_USER_FENCE;
> +	sync.addr =3D to_user_pointer((uint64_t *)sync_addr);
> +	sync.timeline_value =3D BIND_SYNC_VAL;
> +	*sync_addr =3D 0;
> +
Similar to above suggestion.
> +	if (prefetch_req) {
> +		xe_vm_prefetch_async(gpu1->fd, vm[1], 0, 0, addr,
> +				     SZ_4K, &sync, 1,
> +
> DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> +		if (*sync_addr !=3D BIND_SYNC_VAL)
> +			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr,
> BIND_SYNC_VAL,
> +				       exec_queue[1], NSEC_PER_SEC * 10);
> +	}
> +	free((void *)sync_addr);
> +
> +	sync_addr =3D (void *)((char *)batch_addr + SZ_4K);
> +	sync.addr =3D to_user_pointer((uint64_t *)sync_addr);
> +	sync.timeline_value =3D EXEC_SYNC_VAL;
> +	*sync_addr =3D 0;
> +
> +	/* Execute ATOMIC_INC on GPU1 */
> +	xe_exec_sync(gpu1->fd, exec_queue[1], batch_addr, &sync, 1);
> +	if (*sync_addr !=3D EXEC_SYNC_VAL)
> +		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr,
> EXEC_SYNC_VAL, exec_queue[1],
> +			       NSEC_PER_SEC * 10);
> +
> +	igt_assert_eq(*shared_val, ATOMIC_OP_VAL + 1);
> +
> +	munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
> +	batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
> +	batch_fini(gpu1->fd, vm[1], batch_bo, batch_addr);
> +	free(data);
> +
> +	xe_vm_unbind_lr_sync(gpu0->fd, vm[0], 0, 0, 1ull << gpu0->va_bits);
> +	xe_exec_queue_destroy(gpu0->fd, exec_queue[0]);
> +	xe_vm_destroy(gpu0->fd, vm[0]);
> +
> +	xe_vm_unbind_lr_sync(gpu1->fd, vm[1], 0, 0, 1ull << gpu1->va_bits);
> +	xe_exec_queue_destroy(gpu1->fd, exec_queue[1]);
> +	xe_vm_destroy(gpu1->fd, vm[1]);
> +}
> +
> +static void
> +gpu_atomic_inc(struct xe_svm_gpu_info *src_gpu,
> +	       struct xe_svm_gpu_info *dst_gpu,
> +	       struct drm_xe_engine_class_instance *eci,
> +	       bool prefetch_req)
> +{
> +	igt_assert(src_gpu);
> +	igt_assert(dst_gpu);
> +
> +	atomic_inc_op(src_gpu, dst_gpu, eci, prefetch_req); }
> +
>  igt_main
>  {
>  	struct xe_svm_gpu_info gpus[MAX_XE_GPUS]; @@ -256,6 +437,11
> @@ igt_main
>  	igt_subtest("cross-gpu-mem-access")
>  		gpu_mem_access(&gpus[0], &gpus[1], &eci);
>=20
> +	igt_subtest("atomic-inc-gpu-op") {
> +		gpu_atomic_inc(&gpus[0], &gpus[1], &eci, 1);
> +		gpu_atomic_inc(&gpus[0], &gpus[1], &eci, 0);
> +	}
> +
>  	igt_fixture {
>  		int cnt;
>=20
> --
> 2.48.1

