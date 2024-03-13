Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3284C54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 09:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF20610F1CB;
	Wed, 13 Mar 2024 09:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StNEVL96";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A065E10F1CB
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 09:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710323242; x=1741859242;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c57bfUoyr+2kUkEF5sgIeUXef8DwS57wXxspNK7bYHQ=;
 b=StNEVL96dTpSPGs/dCdnyo3+s0yIQYxJ8BAHM7x4ApnjVAq7ONc3cJ/p
 G6ztn7P0Sce9M/RyIxYUV6Xj1kPAtFhj2Ruebf3ukDlCn7sQccsxD52Sy
 9XxspY0iBvet7teFBOOTtcV8nDpRVaxrwm0EBeAe0UTqmdXqeTzM52pso
 z75HRuDFxqJ1nAkmv+D6aRdcsZUSAJCojXktvYAcww35TjUi5naohGMYe
 YIc6vB3IWEc/Q6FLuMWdWcEpYZJhFQtx3H5ca3Q+VU4yFPaz76XWJ1Rtj
 QC7CMW0VBhnJnhnKaYqiexdpi+H92em/730kqyBzBSu5+AHv6r8H3SitF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4942824"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="4942824"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 02:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="11769909"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 02:47:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 02:47:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 02:47:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 02:47:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDyPJiT6Wm0ThqtP4r8K8uPOISFxddgLYiRmqSBv3GLg5K9GLcwqoF+OoqsV0wAtpb33Xsya/pCYsMIla2opCEo+UHpwY4yH1YGi9DWzYgT0lMyY+NfdJ4mWjh2g2JWdVVIzEM/u/qQvSfHifkEQN3MTUSprP67rzShSHvjAYMzPCGyOIjuOns12LikrZ8dNKtNGOtx7EWIkUtmlWpawO041hKfltEKW3mjS8dFlP4rLzFnfXNwrMxeQsHE7FV67jeYCnyhTtYz00hZml7I+vgoHz8OllHVzUeKqUEd+2dVEl8X7I1Qf7M1DtT2MQXC+4HrkJAKLowd76TezWqyVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4SypOHu/USSFl7DfuIejQWzcGschAwQ/a1P/XJjON8=;
 b=eI1flX+IpY+tbQuc78QygQB3IFE/S2IxY2+pRJ0aHLQdS7B23gZwh6BxHo9rzZtfgWoxt6DakYJy/EnMIBIwcZ5NRWZC/wwRBDbDv5J/jQ6huNxmhhz2Cj3Mv+Pj5wTryf8VZqHr/cRjAv5DBKOjRJH1qC067KBtO5UZAuXSwk7TNEPIELUf+B+Kh58Rc0kfCyDAVgo7v9O20aMpFuTsuvkeeVWr12coaNK9CSYWwSQbP6MoF4+iJYNaCPdCkPiRjTsjo/6sBiIHmtJI8KkCYMyo154ETVPzOygoajETIZJvtGEDFSPijdkS8IIkTgq8Zduq7wrX+jydMw6cC6FNJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6078.namprd11.prod.outlook.com (2603:10b6:8:86::6) by
 MW3PR11MB4603.namprd11.prod.outlook.com (2603:10b6:303:5e::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.20; Wed, 13 Mar 2024 09:47:17 +0000
Received: from DS7PR11MB6078.namprd11.prod.outlook.com
 ([fe80::bc79:eb06:da61:a71c]) by DS7PR11MB6078.namprd11.prod.outlook.com
 ([fe80::bc79:eb06:da61:a71c%6]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 09:47:17 +0000
From: "Nayana, Venkata Ramana" <venkata.ramana.nayana@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_evict: Skip test if smem less than
 lmem
Thread-Topic: [PATCH i-g-t] tests/intel/xe_evict: Skip test if smem less than
 lmem
Thread-Index: AQHadE01cbYtDCcDmky5+sPf94/wA7E1DhSAgABce2A=
Date: Wed, 13 Mar 2024 09:47:17 +0000
Message-ID: <DS7PR11MB6078B65CA9CB5429B73F0A3DA52A2@DS7PR11MB6078.namprd11.prod.outlook.com>
References: <20240312071502.2188325-1-priyanka.dandamudi@intel.com>
 <ZfEldQt9qH1lLuTp@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZfEldQt9qH1lLuTp@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6078:EE_|MW3PR11MB4603:EE_
x-ms-office365-filtering-correlation-id: 63a5f8ab-1916-4422-5426-08dc434291ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O0ZUu6oZiryMR1G+bBBgLUWj+/XRLiKhPzEO5sL4dIKmqGmrieYET45D8I4oMJzfNXieYCsKu7Hp6yCkOA8CJXxK+8si0Ih6MME8xft2nsBul3YfJXVy/RapRblEiLvyGGOSkZLUaD1QezhFLURtxRGpHGHxO6cw25/9z0loRm5ztYjH+qiKOhVIg8/icBfX7f3VHTcSdX7MsI+SEjQ1ze31pOE0EXCwBAQydG8FvyABgr4G8AGOoV+E05PKbbaUP091XKRwGbeqBWkYaKXweS9YaLpwp/Ef3hUlwZqZa16B7MxPnEKD8I1vBfBWRer+HteYPoCZo/eaQANEOWnoWCzCGaP5NY0TkwMiQe4K17ai8s5qN/eK2DM4VYBYCdrI3RBR2CUttl+9XI0zNXETDA9OXhhgsNymi8Pnu2uyvRb1F3glZMLmrNRPbzosHNFukBZuN9PjAjlv6YBt6kziDrxrwC+ev+3bUuhNve2GN/NZKDKs1V8Pn2FVw+DIKcM6ZvSxKLSsa72VbpZgodOoKasf3q1Jof1szgo0voNbBxr9GNEwWtFJPBaPT1jPHgkeI0U6OuxFMZ65UA9yp7O9jLW105nQZgAqtoIa9Uk/twbhneQZFpSuFaMKx8zy4cAgXVnDQV7ul7MIJpfV1mOGBUmvoVJzNqSx5cWiWfCesk+GJ8YfWXXQ+BLCy27i+QT84w8cTQWBZb+69fyU5MK8mZ6Y1hLLaN4ikURH0S7I9xU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6078.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TwImiv9NfrQ7mWmlRnllo0VrQoHvHyMiSaO2gGSZlAQLnFCMXDzgWvODIGiP?=
 =?us-ascii?Q?S5EE/xwOYsP3p+EeWcAsODe7tnBXEUDQhU0YbYCV++a+StvERahpZlLLptit?=
 =?us-ascii?Q?4xpWVarj0O35/ubQt+gSu4nkfXOw/NW/2BJPHB6OkWYIYzRvQ/dXJZB3B/eG?=
 =?us-ascii?Q?4TvJ5Qj6++3+agIsRVR31WS1D0tI4YjjxR5KvAsH95L6+8CX7y6FjLccQbB2?=
 =?us-ascii?Q?xqqhdhaZP9sJfkgjy+obwzrzH6z35YOzcFrK9sVzT7gKPEj0smZq1mPsfCS0?=
 =?us-ascii?Q?Nll7J/Ky15VRLPZ4+w+blclVU12GqJXRFdxAbalBlvI9X4id/MACjbO5qle7?=
 =?us-ascii?Q?5ZiktF5P7sDGxr+2DGCU3GA2zm0p/svJowPdrG49QYG9+mR7XkGIu0EftJO2?=
 =?us-ascii?Q?Mp6/vvhjYOHtC63byAavpTHYO5JSqjBYEC+ib7bvW3oZPms2czWmgMfu9sp3?=
 =?us-ascii?Q?K/scP2wrUByOtPe673B54fhqsXNxcQOWAtl99lvIPx44mH8hJtmKIRJX9RAY?=
 =?us-ascii?Q?zM954CN0szZ1PPCAPdvY/CXM2uqiXdXL3PS1q38H0BGTZ9atFqi1tFLuVuGk?=
 =?us-ascii?Q?ASxnalFx0qZHTSj0sRlvafsM5hqCDe49Up0pVDH1L9F24isAbo/O/BJraEO/?=
 =?us-ascii?Q?TGlblEuwW1M6JWhfsbMG3cY4ELr/zxlLlkfEuaUSPImsHpQN35U7qzH5Pplm?=
 =?us-ascii?Q?Xuudw/rePlmTAdByIQ2PQeaU/9mZW0WHSI9F1uOlwhnKUxmK3zndebBeC4D8?=
 =?us-ascii?Q?Npt65RZV3JaB9iORvHw75fbDkhCqBaDoxnuT+A7easg4kQ32G52uwJwhrtw6?=
 =?us-ascii?Q?i3TWheAZTUeGnAMbtZM56sBeSdTiItUG1ua4i7cWZyMdkm1OrlKDqXN61M/4?=
 =?us-ascii?Q?fp9RanfqqFIl/eRtSyh2fpNSW6IB15bAkccOTOvTZK/4n2iL0JkF2sOafHKm?=
 =?us-ascii?Q?k9CV4HFFv+FitbHjrPgT+eS22C8yTXEmAKPUnh7QLvAoXRQpYxfJPpDDyQbu?=
 =?us-ascii?Q?0vPZ04mqA62NjHroiBO887rSxB3hUIjKu2wEqeA29ljrQVPWIkGr3q0XRL41?=
 =?us-ascii?Q?n6aeVdlT/YKeWCxyP4S/b9AMlbKNQ0R3x5hJDV04p7djCtEllgTPv7zPz50L?=
 =?us-ascii?Q?zgncSpA46b49853fvx/tsS99pyKKVaDoYZdGP8f6Gn5MTzNUKCH1QUDtYr6M?=
 =?us-ascii?Q?TWp8bJvDZT8LrUx+r0/7B6rqJXblZ40o9RmV8ZXaqzcDb22Mlf5bh3HvvRxD?=
 =?us-ascii?Q?jeBVgKNgWCOGJR3zLI9oCP+Xxrcb3QLmdVKZ4Vb1UN1nHXrEwfcdbQ1w7NmB?=
 =?us-ascii?Q?Iru8BCpAdbKjPuxXNe6oJPjrYtL+FlNG1bfG11AMqhhL+NUme8sGqTZXG4D+?=
 =?us-ascii?Q?WQHX6fsxyGT4TByFSj+ACY4DMBS8lYJK4FyOKI7RRS9fggA5MvecMmG90hQ+?=
 =?us-ascii?Q?55bhC7ALU3sYg5v3Xg/NZ/sgTA1UIbHdg5u4ZMl/eyh6+/AtJSN3hSPmZVLY?=
 =?us-ascii?Q?EFzzo2tcY5oYF36xxRpsfrP4kVaNVAkwEXAtFoQNfaNgy6/5hnU7PopNm+/v?=
 =?us-ascii?Q?AQxGp3tHXE6VQCiUeQq9f7HDPziV7qvRlcVLM8i77Nrx1RUYjW0k4Zh4jvbQ?=
 =?us-ascii?Q?dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6078.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a5f8ab-1916-4422-5426-08dc434291ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 09:47:17.0223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: url+8+79DsqvL3MEkR0mKH3aDVUJLQYpzxNEBUFYYRyMdetb0XVeJ0kfUMGB8w61LmwiDGi++4QS74rYUhTe8PG9hCsGjl04ypLJlTn1uxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4603
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, March 13, 2024 9:33 AM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Cc: Nayana, Venkata Ramana <venkata.ramana.nayana@intel.com>; igt-
> dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t] tests/intel/xe_evict: Skip test if smem less t=
han
> lmem
>=20
> On Tue, Mar 12, 2024 at 12:45:02PM +0530, priyanka.dandamudi@intel.com
> wrote:
> > From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >
> > Currently the tests are failing with OOO memory error.
> > Added code to skip the test if the system memory size is less than
> > local memory size.
> >
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
> > Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > ---
> >  tests/intel/xe_evict.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c index
> > 4de82c3bd..2dc3fe542 100644
> > --- a/tests/intel/xe_evict.c
> > +++ b/tests/intel/xe_evict.c
> > @@ -753,6 +753,8 @@ igt_main
> >  		igt_require(xe_has_vram(fd));
> >  		vram_size =3D xe_visible_vram_size(fd, 0);
> >  		igt_assert(vram_size);
>=20
> I'd add a comment here explaining why we are skipping.
>=20
> Test requires SRAM to about as big as VRAM. For example, small-cm creates
> (448 / 2) BOs with a size (1 / 128) of the total VRAM size. For simplicit=
y ensure
> the SRAM size >=3D VRAM before running this test.
>=20
> Matt
Hi Matt,

If expectation is always SRAM >=3D VRAM then in pre-silicon environment tes=
ts will always skip
because on emulation LMEM size is 64GB and SMEM is 8GB, we can't get 64gb s=
ystem memory
machines. Can't we change the design? Means in the test can we limit LMEM t=
o 4GB and do object's
evict if >4gb? My intension instead of skip on presil environments, at leas=
t test eviction flows.

Any suggestions Matt.

Thanks,
Venkat. =20
>=20
> > +		igt_skip_on_f(igt_get_avail_ram_mb() < (vram_size >> 20),
> > +			      "System memory is less than local memory \n");
> >
> >  		xe_for_each_engine(fd, hwe)
> >  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COPY)
> > --
> > 2.25.1
> >
