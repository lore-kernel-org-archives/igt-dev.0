Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCE5C48286
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 06:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF4F1129C6;
	Tue,  6 Feb 2024 06:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wo9/AhdY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE821129C6
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Feb 2024 06:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707200759; x=1738736759;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nsZOmLivsqRLNziihPA5YqGWsbpbDXUo/rYwOI7n6Do=;
 b=Wo9/AhdYrzTzTRRJbrkAhk2codgsG6lxnzFAn9UjoTFMadN3zQ7fTwiD
 KnNU6vIIm8oLBxE0Um620HYfGs3+iAEnAb2xC36qcIs4AIYfsQKGvKEwv
 re5HnfMlPruCxoRgrOKIHMxwwX62h27+GkE6b61eLX4/0MA3sxZURZL4w
 B6yvajM++iJCb4ESNjrNI8taizaTuB/y6uDXimgx4tWLwdewfLnWExBll
 eK+N26WJCLOLyVKRu5WkzGZdJCzeslCGhWUY4k7JFa1bofz5uI+ArlAl2
 kiRRC8pom/voMHxn/ALkwyAP8EK4KkkzBJyUAWa5BuZ6+GkvKUUMEOA7e A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="820055"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="820055"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 22:25:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="824082548"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="824082548"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2024 22:25:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 22:25:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 22:25:57 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 22:25:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdCrp4lnwc2bcMuggzHiWtt4hqid1OdCKItfaQVqEyBcTpAW1/Qjuz09dTL494A2MVUkf0mZasNm1F243Kw9tY52Wh4+HoKYHEgov7gekZ6wSyBY+yywbwAaGeAslhIkuCLBoL4sDqVGjpFf4eEXC89ivIQkoruBYkXX6DfGtQuNscYzeeQLsGTxwvk9jLMLznXvMVRgMwfPPIsRdpNhSYE6N48Uz56wjJxCICKVkW+coM4rsXi37jh5STlwIs7+3Wk3e8wYYv7rPpwLt7Vn4v1+bhUPNOV54NldqR33ugwd94YxKRReC8L8aIGxq6by7jSbgTRskuu1HnAKhNyQGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u63e1ZEp8fy7vAuoh0Mi9KP5U2sDTnMr8ED5/73A0fw=;
 b=Ukh4pNzph3GdeHRXr0sVlJ6Y0aWXPUvbKpxgYew0aAo+Ds13S+3eKcnHkjgrEDoXsPx67hOEGCWacAsDtoXovBXAA1EQEM6a6hmBb8XOdfZ/Pq/Ir6EuNZS1x/CQOEl1N19qLAwRrrido4pr+Qv0j82/EZ8ecEzIFL8fFGHGkoX/Qv34Dfyh66LSNeh0McwVhSjYiJikMAxjjQFmVraHhx2wCHeOtG+l9vT+WlG/47I8wfDFpFPNp3Wql7gMSfCAN3IVjSSasT9/XqHnSKEbufS60hEPCr7KJmdKmrj8WFK6FZE9AbAQwS3s3IIC5cUPo9bLfN6bz/OEXeiA08kESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by LV3PR11MB8459.namprd11.prod.outlook.com (2603:10b6:408:1b0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 06:25:49 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7249.032; Tue, 6 Feb 2024
 06:25:49 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nerlige
 Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Kalvala, Haridhar"
 <haridhar.kalvala@intel.com>
Subject: RE: [PATCH i-g-t] lib: Add ARL-S PCI ID for perf tests
Thread-Topic: [PATCH i-g-t] lib: Add ARL-S PCI ID for perf tests
Thread-Index: AQHaV/nBf7DHAeWSxUSq/YFQjs+e1LD782OAgADbOvA=
Date: Tue, 6 Feb 2024 06:25:49 +0000
Message-ID: <SJ1PR11MB61293D0470C9F2D9BCD49465B9462@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20240205060139.3643855-1-chaitanya.kumar.borah@intel.com>
 <85a5oec1ek.wl-ashutosh.dixit@intel.com>
In-Reply-To: <85a5oec1ek.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|LV3PR11MB8459:EE_
x-ms-office365-filtering-correlation-id: 9ea61a1d-d423-4024-e71f-08dc26dc75f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zl7iI/2GbSrS1bIfd6ubLRUjLNKBF27IvvmmnaJEBnrxnfT8agCvcQOX39exnV9SC+cdKL6eJHl7/b0tPfQ0+xdoZXFoF8frwVN/u4P2trbmW6AEZ6pJKAxS03F0UAd3skXViIKg9qbbWW8swmjg2U+Z5K4C0ienZCJgNPL0KhN1Rx9HvfCZU2pEpezSfK6G7kH/9LS22v2fvb03IlnWkwtG1pj+VBqypzRMnaon3f+F5I4QT0qYGVGmpt/e6B6gRyjmI4PDyPMokkILk0pXBRUc1+GeOStAqTVUj6cMfalpx6Rj8JCdthrmjiSNko5BMNmRKJCN5h19FgOaw5uEct6bUYZfgeiUSlDN47fEM5JWHfpTsOb7YZlk4/7ScXNdi2F9syCVqQfvY9chsvEF4PcEUyIH5Ai0opO35XDeFrlKqbHwMB53ewibB1/Y7i8RLH8sFOP4/C2X5ZL68oHu7i57y3DG7ibg9QNyBhmBLD1y3WRScqpDI5Qu+sBZ+dqoXKb2RwAEUynxhOiidCyUckqB+IW6IADrZXhrSsJTpq06Ok7Inoaju91LEBZLLKSqwqJNnzpFHHGfWjakpWboEbn+1rAuazoTis7JRMdQQ4E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(107886003)(26005)(86362001)(41300700001)(966005)(5660300002)(478600001)(2906002)(316002)(6636002)(38070700009)(64756008)(54906003)(66476007)(66446008)(76116006)(66946007)(66556008)(6862004)(52536014)(8936002)(8676002)(4326008)(9686003)(71200400001)(7696005)(6506007)(53546011)(33656002)(82960400001)(38100700002)(55016003)(122000001)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4Ay2JeezyySUYrfrCIRf5VGBpMFJmkhbnoig2poa7bwrL9hU6HaJfkW2W/1J?=
 =?us-ascii?Q?NR7MrEIqFGxMEzehgZV1jg1TkemELwaXXnH7ZhO5f/iTfteLHdHYmujrZMoO?=
 =?us-ascii?Q?l5OYV0arP1Nw6fDvBtS9OmuYIN/J4ZaOd0wdJ3imuqoNonRXPv92nRkbpdm/?=
 =?us-ascii?Q?jVS5vCDxmpZf+jXja7rh/chAxz6pE9awPp0wTSXtcj8GJcaDToLEB3Totcy9?=
 =?us-ascii?Q?P22V59NvxgtpjC9SQnoM7dYVqP7+Ja526W0GuyEL3ZkWQBltvrCRyaKsS/WY?=
 =?us-ascii?Q?5KuhNgew8dvpj5Oh8+7OGqScCPemWaT7HfCF7IkuTLHkVw51Cl9A634VBjwE?=
 =?us-ascii?Q?1b5uRhtd9lIRKqSaaZDAu7VS2MH0fmL3iKdCTXQGsCQaGnNTrBHRSlCj8Mww?=
 =?us-ascii?Q?TmTUQw+cd0BXM70dERvcPKeNtteJygYoTcfpEHIhZ8942XQcE7n2VMkcurQH?=
 =?us-ascii?Q?OGhQBUDNrYHy90dpWo5ZqO6yIIBJpClWMFSZx/Sew6ffoX2wxLJKJTRexgZy?=
 =?us-ascii?Q?dLg76/X0hoThcjy3tFm7ubh6A4ncMSQeRHjSaIeBW/xjy1PqGp6kf74EZ7fP?=
 =?us-ascii?Q?WNkjvyPBOrHWZWiu1tNup+6QkL4ebL99BqXsJaqdChaPsNr89TYnLdJCS67S?=
 =?us-ascii?Q?ZxA2ItWVjxybT17BxCLjwPkwK/XUtz2IdXyk9CUFhJX9Y7ur+UNb3XeOa7XI?=
 =?us-ascii?Q?cCeID/NOGnUzwHhHFmcVJT1nnGRHYqwQxuiE4uuYEM9g8D2CN4JpDLIVMHVW?=
 =?us-ascii?Q?PU7htXdxI8Mb0aP7sneS4PUbVbcTI8ALlEpwzEzMfjEBgbyEpPmuwxJvKqkc?=
 =?us-ascii?Q?F621RgPBsl0dSdJdzSxlmkY5j7FbQsrr4VDNhTWWJX0zR573v5NTI8XoUdZY?=
 =?us-ascii?Q?bc39d+uslLrggeb3fMiNeq+8+5G0DtfQtrXYLtBYWhn1l96xBmA7huk07vOl?=
 =?us-ascii?Q?1jzSqeglXFVglb+yFLW1mt+kC8jSCzGeE0uFxkV2JlYskJEIF87OaYfV9AGE?=
 =?us-ascii?Q?dw6iW9c7kS/+lzEjkaZuWydp98bUC7p1oe0iYRh+oiNGyPk5a/hpAJRNQHgC?=
 =?us-ascii?Q?YwVeDolPEC7R7KXb5xSUqLPBbCYtvKltH5xrp7KVML+w3iYBGOa74nX6K3GN?=
 =?us-ascii?Q?RTiDLvm9ktXzb+JpH9j1fV8cVCCfopv3Xyr09piwW6RtLpMmSoFakPkiy/S2?=
 =?us-ascii?Q?0ggwbhqfIFJHb2Q7Pfs6plopGRiPYxFIG8U23MwWJ+OEqtExihoBiZp1zA/H?=
 =?us-ascii?Q?iyzqqLBmwuGZFi9htq4GEkN7xHcV7P7td4ylSyIxQSpnysK0g/l+9zy62acg?=
 =?us-ascii?Q?Tjxx6skXKMnMCuSlFS4/wurPdnDWhLZ4EiRUfN6UKpPgzIG9XCZgk6IuWGT/?=
 =?us-ascii?Q?UHm+E2rnjfTBnSR6KKJojSvE5qa0+o1BoMocoJ+i68r7+eUVP3MqyjGJ8G7a?=
 =?us-ascii?Q?KRrdsnzcyG8oGevwvEQIBsYBjBWNA9qIqg6VXUHkmuQDgFPz4uQWijqPDW3l?=
 =?us-ascii?Q?VMN3oT38tIJdpnmjj/pFhwA/ud11lIOOT32Tl28Go5tG6d5mAWt+Rf9rwO9V?=
 =?us-ascii?Q?GSzzsRNtJ51Kcd1QtEdZlS2iGzcjzj6czrY9i4gfRvWuNKg8x5OQmW/Kvek1?=
 =?us-ascii?Q?pA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea61a1d-d423-4024-e71f-08dc26dc75f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 06:25:49.3290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A++EKYQPSw5PdQV61iqqIQGf/4A3+C2aEIn6zn3l2pADcpnI6Adt2XCQRXScaFwSezxdmCzhhpXkEVAVMgeFLINZjFkW9KNBAmEN35tn5cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8459
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

Hello Ashutosh,

> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Monday, February 5, 2024 10:08 PM
> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Nerlige Ramappa, Umesh
> <umesh.nerlige.ramappa@intel.com>
> Subject: Re: [PATCH i-g-t] lib: Add ARL-S PCI ID for perf tests
>=20
> On Sun, 04 Feb 2024 22:01:39 -0800, Chaitanya Kumar Borah wrote:
> >
>=20
> Hi Chaitanya,
>=20
> > Enable perf tests on ARL-S
> >
> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > ---
> >  lib/i915_pciids_local.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h index
> > a0ca29ee7..0043b0cd9 100644
> > --- a/lib/i915_pciids_local.h
> > +++ b/lib/i915_pciids_local.h
> > @@ -10,7 +10,8 @@
> >  /* MTL perf */
> >  #ifndef INTEL_MTL_M_IDS
> >  #define INTEL_MTL_M_IDS(info) \
> > -	INTEL_VGA_DEVICE(0x7D60, info)
> > +	INTEL_VGA_DEVICE(0x7D60, info), \
> > +	INTEL_VGA_DEVICE(0x7D67, info)
>=20
> 1. Did you check if this fixes the OA tests on ARL? Or this will enable
>    the testing?
>=20

Yes, we verified locally. After the PCI-ID is added the perf tests are exec=
uting successfully.

> 2. Why not include all ARL PCI ID's? Seem to be already there in kernel
>    include/drm/i915_pciids.h. Also:
>=20
>    https://gfxspecs.intel.com/Predator/Home/Index/55420
>=20

I was looking at it from only ARL-S perspective.
+Haridhar is looking into ARL-H.

> 3. How about moving all these MTL/ARL ID's into lib/i915_pciids.h from
>    lib/i915_pciids_local.h?
>=20

The perf test needs differentiations between PCI-IDs that lib/i915_pciids.h=
 does not provide. Therefore we maintain separate macros in lib/i915_pciids=
_local.h.

Please refer to the conversation here.

https://lore.kernel.org/all/7297abc4-309a-4ca8-a606-498b3abd0c2a@intel.com/

Thank you.

Regards

Chaitanya


> Thanks.
> --
> Ashutosh
