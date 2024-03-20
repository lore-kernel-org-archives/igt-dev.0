Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816D8C54E68
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 02:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F71B10F9E1;
	Wed, 20 Mar 2024 02:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIAJbLUZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E85E10F9E1
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 02:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710902084; x=1742438084;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jZiqmmLI3QxWopysAwJly8tNrleq2q9liS+Ahtinxrc=;
 b=HIAJbLUZ8NL+KV7Q8Ru8P0RJxc2QA1VKn2cQ+fNX9ii3G5DQh6ayvFHr
 uPO1IhBtTIrAmZVAa4F3dQGdLLoriKx3XMCriXMRoSNIEx0EGXG2exJde
 tilW3cDHyOURyxCEJiJMS2osAnuoR+lxLpl5hDvrtSzMVzf30qNnd/E4I
 VXccI3rp2NINFKik5tGtvv1LOgt+Ml3yIrk+Jm1U4N0KGBomXXAsVCmGc
 ZNTE/icFJ1Q2cHu/O8wMEBpcS3aYPym1ML48MZcDXPNoMkdHMp/xnOVuN
 bVSakQhYsaiU4yKlC1S8mEu/WVJyDWyqRhlQOKAnOmnn26ScwyKPtW1Rt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="16451807"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="16451807"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 19:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="45097863"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 19:34:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 19:34:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 19:34:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 19:34:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Csbo8q5SCMpbPVXgA1cuyDsz7Ip1qhsNs/p67a49tAjroHc67crgQtU+SvJilM7grzUQDKN8QB5h72VSykDr3AFgD3GG4A+9NMbEacsbujVtIK6R68OZ0ydTGploBUCgapcr9PK3K0IrXZt/r1OaQk6xfYlliMJm0PRaO8+JxV8lr04eLjd7UayRl+7zKE3OmUhrATwJVw1Dlv3Z+l0r0k1pVYMuDUVgBmNKFkeqEKPYLy/4HViGrpfG6f+NR93TlGlhGby12Vpkl9SisVoPotnBB28jiuHXeLEDbsqnJ7WWd4BMRfdy/F/jCzdzT9yi3ZJ/m3Mvnq6LI60++Yh4ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2X4Yhz0Gi5csSWCWydjHgFTh8UpdsjtPifIIuq8JMl8=;
 b=SWFKderT7SsAFEllMLxJH37SLe87n8jqGjxb2TxAeZ3aDCq79Prh61nu0OOuh+P0KSEiFq+CE6eEAa0MhAi6kM8jF3AZu9Gyf4CrWhd8bRvhOkY5benliUtQ25C60FNwH08kAQM2j5Dyl5QOo1a88LTeJLx78EcyTAs8KMsXrNgTC/xDWg2F8CRHgKKStX/wBUXwi54+AXLmM4VTmmR/bbOPVvY7quFxX1s31j37JnM53nrctRzw/nBVRPI4pJh4PYTG6B9TmWfEXtkOWU/4c7oygKldDQW0l+Y8ZQzE8TPFVbjZqGu4ldzku7CLSE3adOwn1CKhouo9JJrbL0AtOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DM4PR11MB8091.namprd11.prod.outlook.com (2603:10b6:8:182::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 02:34:41 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::2d99:e524:71bf:8b67]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::2d99:e524:71bf:8b67%5]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 02:34:41 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wilson, Chris P" <chris.p.wilson@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>
Subject: RE: [PATCH i-g-t v4 02/25] tests/intel: Introduce Memory management
 subcategory
Thread-Topic: [PATCH i-g-t v4 02/25] tests/intel: Introduce Memory management
 subcategory
Thread-Index: AQHadhziAfctXGMWyUapJSqA4wiM0bE4MycQgAa7p4CAAQMlEA==
Date: Wed, 20 Mar 2024 02:34:41 +0000
Message-ID: <CH3PR11MB8434E5C9F6F794252A3B13188D332@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-3-katarzyna.piecielska@intel.com>
 <CH3PR11MB84347B67CC8A7AE42E1837D08D282@CH3PR11MB8434.namprd11.prod.outlook.com>
 <IA1PR11MB60971F2D3E05FDB5980226A4862C2@IA1PR11MB6097.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB60971F2D3E05FDB5980226A4862C2@IA1PR11MB6097.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DM4PR11MB8091:EE_
x-ms-office365-filtering-correlation-id: 269c3076-2ffa-46b3-9bc3-08dc48864bc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yPg8RjhHOqoVpbWVAX9vvVnFnrHMiG2ESQvUEfgu2Rzgrl+orQ4tKmjFW6hEsKPdbfhqa5XBXAiijosJxlNHlQROxGUuYPzX+p/4mZLNDedr0Q8B46VuksP1LQ/O/Ai0YTVms3tkClxEeDfIeLhovfz+y2Bvi3uEIQUi4Jks51Bq8XteMgCsyaOyIUIe6khDBx6awHU7vddJJDJYA4VBs6QurOeZeIU+wVIk1t6qDAeOn0pq9TwYLOPX11PKp6Ruo1h5LW9IJALfzjOPeHg+iesWMw3WqKajzo8y2BG4WZCyreBHbxtyzH8382pKMyVParlA5LWZyHBymUtsv2wW9wzLgsmR343Q6YSEScVkT7aEYxWVDNM2lHdFrhKWbOnGUI6dI6BWcqtLrsBSdn99JEimkCNs+0rwlYBAAG0K2ztvcCVHB6Y4PuisN29VOWoSEp4LXNT/jS+ERTWBvjTqSx8o15PaVAnazbzYVeIAuhziwYZOcNDpvpGQp753T2ud3X/YIp4BZEBOS/u/zYO+qLh7tAdskM43ftrecDy5KpQj2ReTwvlANI4Lm7mo4CaXij1es3J/up49xGBIUKvkBEeT/uST0EHdCOVDsaGNQXLytZviEivOApb0OuvU1/Pf3VU5aWpiMkKHoaOBukgmcA8Ni7oqAOjyySzh4q91piZVs5qNAomlOWbZuSUQIx3db0fNxL14CCYRDJC8vq9o/ATUGp4bvUzOUMkf5EAxpYM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/EgU66oPS1RH+K950yGy/iNE0KdSXXK0VEeAkaivXMVF93YDHZkkVAjGAO2C?=
 =?us-ascii?Q?AgDSAZdpfHnOEhDNBpCmvkxiK9D5ykoEmxVl5bFMJHgtg9GlnoXGf59L9F8e?=
 =?us-ascii?Q?m8uJo+X4YVExSaltlwx69Y4A7bJJ90Q9vhTxt+P5u3dn3bzyloK0n3wfWFE7?=
 =?us-ascii?Q?j6qgAS157OoGl71rd7tGV6tGJ2iFhNmwBqgpGPxpNZ4A0vsH2IgrhmwpN0po?=
 =?us-ascii?Q?7JigSQZzj30e2g4XUYcX4TgWPXg/m2xlabbiF/fhhWjRnD6B97+1hYI0Yqui?=
 =?us-ascii?Q?OSpFQVXi7Ml2cOmTxmQeyRjA29Fxeqx+SmhAoPAKmldbK0Uj4qseaEw9vFBa?=
 =?us-ascii?Q?4PsuIunoWmP/v69AJ8c9eE1CRcjhUl7ffHd+C8LHn01EZNJXzxEPuRVqVTEd?=
 =?us-ascii?Q?R7JlohMap0pOkaCo81/VOlED+nirZ8ktXZRsxhU6F9tglZTxDHejvxpdDy0y?=
 =?us-ascii?Q?8VN/wcZeMHeZIQumrPY+TEnoZ8aQxeb+cf7/hyhuMrn3blenl2ioSPFIkml8?=
 =?us-ascii?Q?8FMlEhj4tTxqK+MBXtm1HmPCiA2nrw66YQ10xbpcSch++d8HcunAOBe1kKxo?=
 =?us-ascii?Q?QnEIKZaRp8NYepW0/8IpFdnojmKUGzqZgKX4urk8fr2ge/jC1WwuYUBLA1b0?=
 =?us-ascii?Q?uBSuESRQJejq1JDgokU9+rWyRbWdH4FLUo5N0a+cH4FHUr/SlOZIzuoK26hw?=
 =?us-ascii?Q?PoTIYukVJ/ybOqrPyAWTVA1A+FhcC39S+u+XiSZxoLxLsPBzCJQA02cenICn?=
 =?us-ascii?Q?uTazEa1+rSxNNaJ95VuyRRnnR9KIW6asLa6gKjZ9EAZCnmVzVul/tfr1M8lJ?=
 =?us-ascii?Q?sR8ICKOpagTdxuc5k630HdD5z7CeeYkqIVR9Z7gcBdXb3NsdZpgI3vywTYIo?=
 =?us-ascii?Q?qayRz9JQzpHdRxDKGpY/jvBT3JEiL4ZyIZTKqMsVb8nGfoDAwVfA4dCKm3uK?=
 =?us-ascii?Q?N9gPdsPOOiyYBq/tp8U5oN3LqI/va9BAXCp/r771lrwx7NY8j1Q9gc3fpiWo?=
 =?us-ascii?Q?LFxRx/g61hjDKQtnQxETu5XAao1b3edUqKYqIiKRNy7kK0uqivU9d3ZkPXDw?=
 =?us-ascii?Q?jEZ0gAJ0XnPK1KrfTDoUPyEktxdAAB+DfMiRgvQ3Ue6QdZ7gvGFxKhuKm94l?=
 =?us-ascii?Q?Px81q1dRfJv0BDzXIKHJ6hzmvQLR6Q2F8qJi/V0LGUu6bu2gFLFzHFPpYIyq?=
 =?us-ascii?Q?MteCB0Ci5thI5GZRU0knhQfJ17g/mPrrXAA6WN9Okn3NWzxZj2sKoT0ZQ03G?=
 =?us-ascii?Q?FHKUSbKcoHWPGAUnlE2Oy7QcWojsEHL3PLwy29mcbqZB25/MyobEW3mCHPRz?=
 =?us-ascii?Q?6jnVyeQjKIMp4Eqndq4UudNggbSGFCt2Z6+nnpQJfRq0OuUJiU0UDP6PqxMi?=
 =?us-ascii?Q?Yvkrv1OIyPqE3ODrjQWykzYLcNT0JIFBmTIuR5KACFFy2E6GkRXGycrvNgD4?=
 =?us-ascii?Q?AIFYy1B4H+BlonoyU1jnjCQwlx5bodTBxgYcLf292rXPimlHDgdmOWW7MDZF?=
 =?us-ascii?Q?zFNN7R6dCKlmRIeX3YUFVIN3vvnofBjHh3P2mdA4wwviy0P6l0F5+bk8tdfQ?=
 =?us-ascii?Q?/dPZasmc8oB4KewzTTTUfeH1WWG78J8Ugodn1aggpuyKGPD37YnRWy3xk7Ka?=
 =?us-ascii?Q?nA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 269c3076-2ffa-46b3-9bc3-08dc48864bc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 02:34:41.3435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 82T61jSvXMET5CH/xQnBCtHuc87Nf3N+9LXohJNN5Xp94o9ECnl3GTlMqA5+M7NeBjGptf5YaFjLrOrUkgu3/kw/u40JmxRHwPROOMykU9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8091
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

LGTM
Reviewed-by: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>

> -----Original Message-----
> From: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>
> Sent: Tuesday, March 19, 2024 4:37 PM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Wilson, Chris P <chris.p.wilson@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Mauro Carvalho Chehab
> <mauro.chehab@linux.intel.com>
> Subject: RE: [PATCH i-g-t v4 02/25] tests/intel: Introduce Memory
> management subcategory
>=20
> >   * TEST: gem set tiling vs gtt
> >   * Description: Check set_tiling vs gtt mmap coherency.
> >   * Feature: gtt
> > + * Sub-category: Memory management
> > + * Category: Desktop client
> > + * Functionality: tiling vs gtt coherency
> >   * Run type: FULL
>=20
> For some tests, there is a Test category and for some it is not present i=
s that
> expected?
> For Example, see above it doesn't have the Test category. Can you please =
look
> into it?
> --Priyanka
> [ Katarzyna] Test category is not a mandatory field for documentation.
> Currently I am not updating that. We can look at this field later.
> Kasia
>=20
> >   *
> >   * SUBTEST:
> > diff --git a/tests/intel/gem_set_tiling_vs_pwrite.c
> > b/tests/intel/gem_set_tiling_vs_pwrite.c
> > index ede0c58b6..a358ddba6 100644
> > --- a/tests/intel/gem_set_tiling_vs_pwrite.c
> > +++ b/tests/intel/gem_set_tiling_vs_pwrite.c
> > @@ -42,6 +42,9 @@
> >   * TEST: gem set tiling vs pwrite
> >   * Description: Check set_tiling vs pwrite coherency.
> >   * Feature: gtt
> > + * Sub-category: Memory management
> > + * Category: Desktop client
> > + * Functionality: tiling vs pwrite coherency
> >   * Run type: FULL
> >   *
> >   * SUBTEST:
> > diff --git a/tests/intel/gem_streaming_writes.c
> > b/tests/intel/gem_streaming_writes.c
> > index fc2d3d89f..dd2f28331 100644
> > --- a/tests/intel/gem_streaming_writes.c
> > +++ b/tests/intel/gem_streaming_writes.c
> > @@ -43,6 +43,9 @@
> >  /**
> >   * TEST: gem streaming writes
> >   * Description: Test of streaming writes into active GPU sources
> > + * Sub-category: Memory management
> > + * Category: Desktop client
> > + * Functionality: barrier
> >   * Run type: FULL
> >   *
> >   * SUBTEST: batch-cpu
> > diff --git a/tests/intel/gem_tiled_blits.c
> > b/tests/intel/gem_tiled_blits.c index
> > 27971a2b9..ec6e88477 100644
> > --- a/tests/intel/gem_tiled_blits.c
> > +++ b/tests/intel/gem_tiled_blits.c
> > @@ -58,6 +58,9 @@
> >   * TEST: gem tiled blits
> >   * Description: Test doing many tiled blits, with a working set
> > larger than the aperture size.
> >   * Feature: gtt, mapping
> > + * Sub-category: Memory management
> > + * Category: Desktop client
> > + * Functionality: tiled blits
> >   * Run type: FULL
> >   *
> >   * SUBTEST: basic
> > diff --git a/tests/intel/gem_tiled_fence_blits.c
> > b/tests/intel/gem_tiled_fence_blits.c
> > index c536c3699..920eeb42d 100644
> > --- a/tests/intel/gem_tiled_fence_blits.c
> > +++ b/tests/intel/gem_tiled_fence_blits.c
> > @@ -51,6 +51,9 @@
> >   *   Tests fence management problems related to tiled blits by perform=
ing
> > many blits on tiled
> >   *   buffer objects with fences enabled and with working set larger th=
an the
> > aperture size.
> >   * Feature: gtt, mapping
> > + * Sub-category: Memory management
> > + * Category: Desktop client
> > + * Functionality: tiled blits
> >   *
> >   * SUBTEST: basic
> >   * Description: Check basic functionality.
> > diff --git a/tests/intel/gem_tiled_partial_pwrite_pread.c
> > b/tests/intel/gem_tiled_partial_pwrite_pread.c
> > index d4f66d51e..c4686739e 100644
> > --- a/tests/intel/gem_tiled_partial_pwrite_pread.c
> > +++ b/tests/intel/gem_tiled_partial_pwrite_pread.c
> > @@ -42,6 +42,9 @@
> >   * TEST: gem tiled partial pwrite pread
> >   * Description: Test pwrite/pread consistency when touching partial
> > cachelines.
> >   * Feature: gtt, mapping
> > + * Sub-category: Memory management
> > + * Category: Desktop client
> > + * Functionality: tiled pread/pwrite
> >   * Run type: FULL
> >   *
> >   * SUBTEST: reads
> > diff --git a/tests/intel/gem_tiled_pread_basic.c
> > b/tests/intel/gem_tiled_pread_basic.c
> > index a2253b51e..13181d86c 100644
> > --- a/tests/intel/gem_tiled_pread_basic.c
> > +++ b/tests/intel/gem_tiled_pread_basic.c
> > @@ -52,6 +52,9 @@
> >   * TEST: gem tiled pread basic
> >   * Description: Test pread behavior on tiled objects with respect to
> > the reported swizzling value.
> >   * Feature: gtt, mapping
> > + * Sub-category: Memory management
> > + * Category: Desktop client
> > + * Functionality: tiled pread/pwrite
> >   * Run type: BAT
> >   *
> >   * SUBTEST:
> > diff --git a/tests/intel/gem_tiled_pread_pwrite.c
> > b/tests/intel/gem_tiled_pread_pwrite.c
> > index 2f0f6f547..f8bc79731 100644
> > --- a/tests/intel/gem_tiled_pread_pwrite.c
> > +++ b/tests/intel/gem_tiled_pread_pwrite.c
> > @@ -62,6 +62,9 @@
> >   * TEST: gem tiled pread pwrite
> >   * Description: Test swizzling by testing pwrite does the inverse of p=
read.
> >   * Feature: gtt, mapping
> > + * Sub-category: Memory management
> > + * Category: Desktop client
> > + * Functionality: tiled pread/pwrite
> >   * Run type: FULL
> >   *
> >   * SUBTEST:
> > diff --git a/tests/intel/gem_tiled_swapping.c
> > b/tests/intel/gem_tiled_swapping.c
> > index 90ce70bdb..13f9fb41f 100644
> > --- a/tests/intel/gem_tiled_swapping.c
> > +++ b/tests/intel/gem_tiled_swapping.c
> > @@ -62,6 +62,9 @@
> >   * TEST: gem tiled swapping
> >   * Description: Exercise swizzle code for swapping.
> >   * Feature: gtt, mapping
> > + * Sub-category: Memory management
> > + * Category: Desktop client
> > + * Functionality: swapping
> >   * Run type: FULL
> >   *
> >   * SUBTEST: non-threaded
> > diff --git a/tests/intel/gem_tiled_wb.c b/tests/intel/gem_tiled_wb.c
> > index 6a8b79ecc..ee17b587d 100644
> > --- a/tests/intel/gem_tiled_wb.c
> > +++ b/tests/intel/gem_tiled_wb.c
> > @@ -51,6 +51,9 @@
> >   *   This is a test of write-combining mmap's behavior on tiled object=
s with
> > respect to the reported
> >   *   swizzling value.
> >   * Feature: caching, gtt
> > + * Sub-category: Memory management
> > + * Category: Desktop client
> > + * Functionality: cache
> >   * Run type: FULL
> >   *
> >   * SUBTEST:
> > diff --git a/tests/intel/gem_tiled_wc.c b/tests/intel/gem_tiled_wc.c
> > index
> > 1994453b3..356b48829 100644
> > --- a/tests/intel/gem_tiled_wc.c
> > +++ b/tests/intel/gem_tiled_wc.c
> > @@ -48,6 +48,9 @@
> >  /**
> >   * TEST: gem tiled wc
> >   * Feature: caching, gtt
> > + * Sub-category: Memory management
> > + * Category: Desktop client
> > + * Functionality: cache
> >   * Run type: FULL
> >   *
> >   * SUBTEST:
> > diff --git a/tests/intel/gem_tiling_max_stride.c
> > b/tests/intel/gem_tiling_max_stride.c
> > index 5943ed93f..93b89b00e 100644
> > --- a/tests/intel/gem_tiling_max_stride.c
> > +++ b/tests/intel/gem_tiling_max_stride.c
> > @@ -43,6 +43,9 @@
> >   * TEST: gem tiling max stride
> >   * Description: Check that max fence stride works.
> >   * Feature: gtt, mapping
> > + * Sub-category: Memory management
> > + * Category: Desktop client
> > + * Functionality: fences
> >   * Run type: FULL
> >   *
> >   * SUBTEST:
> > diff --git a/tests/intel/gem_unfence_active_buffers.c
> > b/tests/intel/gem_unfence_active_buffers.c
> > index d3bc1cee6..aaa841f46 100644
> > --- a/tests/intel/gem_unfence_active_buffers.c
> > +++ b/tests/intel/gem_unfence_active_buffers.c
> > @@ -56,6 +56,9 @@
> >   * TEST: gem unfence active buffers
> >   * Description: Check for use-after-free in the fence stealing code.
> >   * Feature: synchronization
> > + * Sub-category: Memory management
> > + * Category: Desktop client
> > + * Functionality: fences
> >   * Run type: FULL
> >   *
> >   * SUBTEST:
> > diff --git a/tests/intel/i915_fb_tiling.c
> > b/tests/intel/i915_fb_tiling.c index
> > 14c17b030..e1dc54cc5 100644
> > --- a/tests/intel/i915_fb_tiling.c
> > +++ b/tests/intel/i915_fb_tiling.c
> > @@ -27,6 +27,9 @@
> >   * TEST: i915 fb tiling
> >   * Description: Object tiling must be fixed after framebuffer creation=
.
> >   * Feature: mapping
> > + * Sub-category: Memory management
> > + * Category: Desktop client
> > + * Functionality: tiling
> >   * Run type: FULL
> >   *
> >   * SUBTEST:
> > diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c index
> > 90d79864f..79f5922a9 100644
> > --- a/tests/intel/prime_busy.c
> > +++ b/tests/intel/prime_busy.c
> > @@ -33,7 +33,7 @@
> >   * Feature: prime
> >   * Functionality: buffer management
> >   * Run type: FULL
> > - * Sub-category: DRM
> > + * Sub-category: Memory management
> >   * Test category: GEM_Legacy
> >   *
> >   * SUBTEST: after
> > diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c index
> > 25b2939e9..e0735496a 100644
> > --- a/tests/intel/prime_mmap.c
> > +++ b/tests/intel/prime_mmap.c
> > @@ -54,9 +54,9 @@
> >   * TEST: prime mmap
> >   * Category: Infrastructure
> >   * Feature: prime
> > - * Functionality: memory management
> > + * Functionality: prime mmap
> >   * Run type: FULL
> > - * Sub-category: DRM
> > + * Sub-category: Memory management
> >   * Test category: GEM_Legacy
> >   *
> >   * SUBTEST: test_aperture_limit
> > diff --git a/tests/intel/prime_mmap_coherency.c
> > b/tests/intel/prime_mmap_coherency.c
> > index 01eb2002d..61bc5d312 100644
> > --- a/tests/intel/prime_mmap_coherency.c
> > +++ b/tests/intel/prime_mmap_coherency.c
> > @@ -38,9 +38,9 @@
> >   *   Test dma-buf mmap on !llc platforms mostly and provoke coherency
> bugs
> > so we know for sure where
> >   *   we need the sync ioctls.
> >   * Feature: prime
> > - * Functionality: memory management
> > + * Functionality: prime mmap
> >   * Run type: FULL
> > - * Sub-category: DRM
> > + * Sub-category: Memory management
> >   * Test category: GEM_Legacy
> >   *
> >   * SUBTEST: ioctl-errors
> > diff --git a/tests/intel/prime_self_import.c
> > b/tests/intel/prime_self_import.c index 2dbf4e20f..e1dcebfd8 100644
> > --- a/tests/intel/prime_self_import.c
> > +++ b/tests/intel/prime_self_import.c
> > @@ -51,32 +51,27 @@
> >   * Description: Check whether prime import/export works on the same
> > device... but with different fds.
> >   * Feature: prime
> >   * Functionality: buffer management
> > - * Sub-category: DRM
> > + * Sub-category: Memory management
> >   * Test category: GEM_Legacy
> > + * Run type: BAT
> >   *
> >   * SUBTEST: basic-llseek-bad
> >   * Description: Check dmabuf llseek support with invalid values.
> > - * Run type: BAT
> >   *
> >   * SUBTEST: basic-llseek-size
> >   * Description: Check dmabuf llseek support.
> > - * Run type: BAT
> >   *
> >   * SUBTEST: basic-with_fd_dup
> >   * Description: Check prime export with duplicate fd.
> > - * Run type: BAT
> >   *
> >   * SUBTEST: basic-with_one_bo
> >   * Description: Check prime import/export with one buffer object.
> > - * Run type: BAT
> >   *
> >   * SUBTEST: basic-with_one_bo_two_files
> >   * Description: Check prime/flink with one buffer object.
> > - * Run type: BAT
> >   *
> >   * SUBTEST: basic-with_two_bos
> >   * Description: Check prime import/export with two buffer objects.
> > - * Run type: BAT
> >   *
> >   * SUBTEST: export-vs-gem_close-race
> >   * Description: Check race of gem close against prime export.
> > --
> > 2.34.1

