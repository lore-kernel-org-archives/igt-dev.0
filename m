Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8615DD68BCB
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 16:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3654F8826D;
	Fri, 15 Nov 2024 16:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTl8H2jq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CA410E89F
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 16:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731687842; x=1763223842;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cBasaZHoOEDCZGUlUyUV39CCIxh1i/dctoKurlAAIks=;
 b=ZTl8H2jqy1ctpEYRUwOb7FyOdnrSKVnb2kc1FEaBZUyl8TzU7eZam1lu
 wJEuVghu8GzQjVk+DVytyQxL9dVnLyJ4Qe3jomkZTB75/5FOzacBE415G
 aEjTmJ1pJ9s5knf8tIS4n1BbNiKKzuQO9FiVxi2EBvtwZB+G8k+iyTK+x
 BeJ0a0UyJft6Tev7pv1HJ+/R720jYKvwUQOu9ES7vkL/jQs2ML5LpqkCR
 A/r2/IOxynKvzqlc5iAvggdJ+Hxp0NrbSToWC6hLIKcJ+IRlOvL+DdwsZ
 qcs6hbQHUW+Pi5FKRb98lPeSr+KzfzjeHw30E2s0Q3fGE9tOIcegTVcNp Q==;
X-CSE-ConnectionGUID: xZGMnU2URGm7j9rEHgot4A==
X-CSE-MsgGUID: ybnkjbT1TR2cvqj8frCkxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="19311200"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="19311200"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 08:24:02 -0800
X-CSE-ConnectionGUID: MiDjD1xNSguxeAQOH8HWzg==
X-CSE-MsgGUID: 9JsmVihYSUe1IpCbtm/o+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="93677937"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 08:24:02 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 08:24:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 08:24:00 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 08:24:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqBfXQd2sK81lGtatX2OSKfvMHZRFoWRDeYBNbjUUGGyvHhW8tYHDDS4f+3M13epGGMUMxGVIBChAbb4smbm6O9sTA3KAJYdmu+NFdmbnCm3kvf57Hg9UQyHjz31NyJxxscFM+HqdUtzyqtYSDAAcTvHWb8htdYjTzZWvvMRtxAvUEddM91kXdzJkapO3NUaZZVCLXMib27cSw7le1uiIBB05qHx7nGnaRXg1TkkAlZXo8jdtMYxwJpsEe0VNWoDgHcVxgTlG8tNIYdwSEc7/o+1cbc4PR6oRLHGfjpZImJkbJxSX/iaT1/YUhnGOtTWEF2MI0NDOqQ0xPcvu8TN5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH3UbFrndFv11JkcbI0dQHP6Kq6hXn1QDTnzYQzCj40=;
 b=FRuzAo5/blJL6AW1fK2bmpxJmHeeQxIhOrOGo3/FZogMWcmcLAW7bdocUP5jv9GUHlTqbuueApo1sr8DUExcNkaiPjs+N91PQYh9E8Gzl6E6b0GMLvILWbFQvjf4Q09Bxune4PSewycYx0Gr9TNst8Fe8V3J4yXkHjYqIuOOew1vGxBw0UqJ4seWyA7gA01PVewuEyvM1m/zbGg7dFRdSspYEFl4XRQa5QHweZy0kW5Akpe4Rj/7OAO/3QrG3y+eXbboeuiRArSXns4ovXBxvWCXPZvY9DhXX88SrK059mStvk+RKEVpng0rQEepf7l+9VoWC/iRB9aHX5UjoCJboA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7213.namprd11.prod.outlook.com (2603:10b6:8:132::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Fri, 15 Nov
 2024 16:23:53 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 16:23:53 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 1/3] lib/igt_sysfs: Add igt_sysfs_get_next_engine
Thread-Topic: [PATCH v5 1/3] lib/igt_sysfs: Add igt_sysfs_get_next_engine
Thread-Index: AQHbMWfRB4xjfqivV0OEd3VFCi4V8rK4dNYAgAASDSA=
Date: Fri, 15 Nov 2024 16:23:53 +0000
Message-ID: <CH0PR11MB5444F132BE8F3B8C48D5C22BE5242@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241107225254.302010-1-jonathan.cavitt@intel.com>
 <20241107225254.302010-2-jonathan.cavitt@intel.com>
 <20241115143658.xtmjago5s3f7az2r@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241115143658.xtmjago5s3f7az2r@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7213:EE_
x-ms-office365-filtering-correlation-id: 1d13d753-2653-430a-2113-08dd0591e53b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?0b04ThgA6Hsoon3wsEKRUi0vnXMa0ipJCOa4ZZmppli3MsifZ7UUcWatDZg1?=
 =?us-ascii?Q?X799LWwoaYwaqdtUlHSHdjPzOpJnOASlEnZb/EIT7EM3Rka59CgcrzNIWvtd?=
 =?us-ascii?Q?kU+JYuUhYCqw4rVCxYk1nrP2mNP2rBPS+ZR7TQkieg2IV/XGTQc/1GihLolG?=
 =?us-ascii?Q?IUCbNCSf74jKgzZP6Peq+HB9sZOLcknDWBZA3dzO447hA5tSRTHAYA0ZfV48?=
 =?us-ascii?Q?euDBD82jhKXiy4rD4iCQkOkmxqWYWz7eSeMNXcFzDN93OHcFu6WqIEeFv4dr?=
 =?us-ascii?Q?emsEQQtd+/4jqBIK4k5f4tSxYeY2X0bncqfpOdxD4CppzXPc63Lk3Y3LtrtZ?=
 =?us-ascii?Q?RX9gQMKnoz6R7ac2qJWkxdRl2ba7tNWAuyD9la6OmDdNtZkLxIREVszKjMAq?=
 =?us-ascii?Q?3ZV/sga2XU6kvsPwlE/0CuMXvM9hO8jNrwOgB8RdNSLDZdiXmxDxpgT9rjqS?=
 =?us-ascii?Q?4KdhK8AS7cfb8Nxe1SQTX5JoumNXBUXRgCFdR2OSnl3/5BcrBUrR92D4Y9lv?=
 =?us-ascii?Q?wwcjnAEAomwrJqYv1OFcTFQYkBH1ej15Kij13EYikKtBQW1z+Pnb6QoafwyF?=
 =?us-ascii?Q?8WIwoSMO9Xx68kVNKXJxOAYD6VEE14l+FUi7LcnROaIgkTRM+ylDuuCaQlYa?=
 =?us-ascii?Q?lABB0gOI02pPkozh87E0HDVrJiR1608w5vPam7DlSR8g+AK1r0x7pbrbwIuA?=
 =?us-ascii?Q?3zqF8QIpQyhZ455w/SS41S8Y0rZQyEjDr7CwalEF+BP+EY10JQjRo4ZOW3+3?=
 =?us-ascii?Q?/VNkbc4xN4Kzqo0IVm9NakNiNpeRD+esW4AHM/WcN0oDGCyGAG5F7auK//HL?=
 =?us-ascii?Q?En8C8GEv+6RV1bX8jYaLLtn0y+HBKhEXlCQBXKWeYRmLaUMJzsixe5te6y1A?=
 =?us-ascii?Q?xC1fMpoS4fTIIsIqe0ckqI+hs4smeHCwrOIfgw7FrUpyGMPdEjcLqJHDpYG9?=
 =?us-ascii?Q?O7oYTqfSbSOM+g3q6biGPgd32XZQMDA/cuCtlhRUvhP+Jo+ANvsea3RHTBvY?=
 =?us-ascii?Q?71jtExgZ3t3oyPeISLhn9PrBCw27NhtPHkN6DUsCQSD1Wy12kP7R2Q39GiXP?=
 =?us-ascii?Q?7adHkjlqgEL0uEzZPAaQlcCstIS6R7PelAObFXVWCdeSllG8szP3lQrs5bcT?=
 =?us-ascii?Q?LdrxuRRo0PG58Ev8sGK58N+hJ15vZU+TIIp/Yhu6xioB75pxchpC4NVOTns3?=
 =?us-ascii?Q?Fpsz7ztxtO7f2oqS+USe9ZwvMaUPUE7GahtyRkJBUiigJZJ0NH2xee7getIx?=
 =?us-ascii?Q?JK+6MhPdQSdUCUHqwneT6mz1zqDkn6eN8WW1OYW2uvGGWLqZ8pIyKtnzlrAC?=
 =?us-ascii?Q?XzX5JbFGf+ErRu3KFvzXMfSJG1FRvqJTP/E9f3AuCQW+P2uvTTNFUGPzCoEL?=
 =?us-ascii?Q?+3eRllE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sn1FGVCG8Rsgeh1vkjnJtHcMEsx3lSJcS5og9cCyf5eo/5B+40b8u9N5e6SC?=
 =?us-ascii?Q?VHPCfThbQ3/kD+WrU9F4g5bddezFVF6qHtUcPhBAuDMiYiaWDCfx06Zg6Tlv?=
 =?us-ascii?Q?GAwHMZICGiMUEzMFWmCaXUg992tjUuStwu5dfrhbVbbmxH8CsgRHteygFdgz?=
 =?us-ascii?Q?jcSvFkm+p0LuJM0qFLmt+rnb5oDRJB1ojKVT1v7OB1jVgyA7A1UFGe6Y27fZ?=
 =?us-ascii?Q?DUvaDK3AqYSE0xNIlYDO47Ob0SaZxIC6p/s8oExfAFyCSVbLd0qyrqEvp3Mf?=
 =?us-ascii?Q?GWgpsJfRJTcvsuX2i43ldIg5gpAtUEQguM9aNHDS6qAyb67db3Y5xO4bNXda?=
 =?us-ascii?Q?C84rXqhOyIOdfbkoDV7XR4Lh18O4dc/X2FYjDWGi7IRVRuonLyC2orrIkc33?=
 =?us-ascii?Q?XzyldWJuhSPqYsbVj22vZ00mGtVCPJme7nraWEQJ4Q+4P39K936fyTqIvgfZ?=
 =?us-ascii?Q?Ke/z8uiPgNQmqpNq0EyXKSyCgDwYOvT/3+FopuQqJFOempLke3UbZML8gMoj?=
 =?us-ascii?Q?rrl3R/POjuXn8N8BucHc3m8pLXHdTWHWw+YBO9V/qIvQy48tR5HdTtACwyAF?=
 =?us-ascii?Q?am0RBn0yhg8CY0HsKpHU0ibPKpWYxDWRjMEjZgwl7pU0OeUoVTc3qxDj69eY?=
 =?us-ascii?Q?IyNW+0wL6oc+ldMutqWLkg+6iE/3EO3TV50Y8J39aBA0fgs/K8btTBGlM8vb?=
 =?us-ascii?Q?DJWTfnt7c+FBGilj9zcwU2GVFLnuKodksGBJ5QEdoE1ERDVaijOiqvlvTkKA?=
 =?us-ascii?Q?L6QW5ZuHWVx+PDQqj4A5srnaPkSdG1sXdTEN+CAt6skM46Ctfefvmsf+CRtj?=
 =?us-ascii?Q?Ds0s7hOD5iNdr3CQ06W/kxJVRsq3TZnIZcXgTwxX2FT19FPXxW1HxBddFFVd?=
 =?us-ascii?Q?6RsfouvDEM2H3XlPjdyEHngPSRgSZvxqpGdbJ0GRBzwMnYgLDg+2/SMDJ7wy?=
 =?us-ascii?Q?S0LP5ZAZEcaKZRNkvJWZ5If/KVKgPmx3Kwm/6jE7ghtisyAQNTD8ZWZBu4rj?=
 =?us-ascii?Q?iigS8MkuGuj4q8kLtCP1l2Y6d58RgCYvXUQR7+qOrfDQaCm5K/f+twCcMiaM?=
 =?us-ascii?Q?mjmA1Dj/QIszmEYP0vevphb7kMH7UU82IItjYDf56W5KKEQARdLGQl8Wuagv?=
 =?us-ascii?Q?hULjFZA71UzCy/V/KMTVd9cTfCBpu6Jf/vsWxqwhL46CSr3Lc7ZJGaeQFl4N?=
 =?us-ascii?Q?481c1A0j04K6JxbJLbGiAgeydvu95HdDgXcnVdaStJNGEEoSki1vcdsCMGWz?=
 =?us-ascii?Q?10TPb/xmK9M0O2dF83G455cwVJ68VSTaugK4Q7TDThpaHLtFwGvtlFe15daV?=
 =?us-ascii?Q?Hyr6S3LdHu/QhQZSpgqQKnUWUiyy8MujKxaPg5xRAhpnhEtuiMz2xfx8xwXe?=
 =?us-ascii?Q?v3kyHSyIviM4sZu8PdwPcBLDXby33eqy8EuyaS2ln8r9/BC9ntrUU86muD/f?=
 =?us-ascii?Q?gDwbhyvi961e7bATRjGyMxFUc2+yc1/UxvCx8rv4jPmp9thU0M2OlqLSVm6B?=
 =?us-ascii?Q?eUvmHo3KIhrxHaQPfwuiHzc7IGL2cRdTFw9duevoSMGOJkQyv2tyIPnuntzs?=
 =?us-ascii?Q?DYg6/ifOr9axmH2WgZ8XKmT0ukDwfpyBHMEcP0xw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d13d753-2653-430a-2113-08dd0591e53b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2024 16:23:53.0448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NNKEzw3Yl0Rruxr6m4SXsLEsp19zmj25CXIwktmMWwlETlpwLgrtYCA1laLRNpkbEwhSKn6mUDnWLLpitwaaC7QIhbFwHTT2lYn3rWaM0Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7213
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
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>=20
Sent: Friday, November 15, 2024 6:37 AM
To: igt-dev@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurabhg=
.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Belgaumkar, Vinay <vinay=
.belgaumkar@intel.com>
Subject: Re: [PATCH v5 1/3] lib/igt_sysfs: Add igt_sysfs_get_next_engine
>=20
> Hi Jonathan,
> On 2024-11-07 at 22:52:52 +0000, Jonathan Cavitt wrote:
> > Create a new helper function, igt_sysfs_get_next_engine, that iterates
> > over sysfs/engines and stores the next engine for the user.  The
> > function returns true if the next engine in the list is available, and
> > false otherwise.  The function will be used in the test suite in a late=
r
> > patch.
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  lib/igt_sysfs.c | 36 ++++++++++++++++++++++++++++++++++++
> >  lib/igt_sysfs.h |  1 +
> >  2 files changed, 37 insertions(+)
> >=20
> > diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> > index 26a3aa31fb..3d0dada969 100644
> > --- a/lib/igt_sysfs.c
> > +++ b/lib/igt_sysfs.c
> > @@ -1236,6 +1236,42 @@ static uint16_t xe_get_engine_class(char *name)
> >  	return class;
> >  }
> > =20
> > +/**
> > + * igt_sysfs_get_next_engine:
> > + * @engines: fd of the directory engine
> > + * @prior: previous engine from the sysfs/engines list
> > + *
> > + * Iterates over sysfs/engines and stores the next engine in prior.
> > + * Returns true if there are more engines to iterate over, and false o=
therwise.
> > + */
> > +bool igt_sysfs_get_next_engine(int engines, int *prior)
> > +{
> > +	struct dirent *de;
> > +	DIR *dir;
> > +
> > +	if (!prior)
>=20
> This looks buggy, did you mean:
> 	if (!*prior)

Right.  Initially, I was planning on passing NULL here, so !prior would've
been correct, but that's not how that works.

>=20
> Btw I do not get how it should work, who will close dir?

According to igt_sysfs_engines, nobody closes it.

> You could either devise for example iterator:
> igt_sysfs_get_first_engine/_next_engine
>=20
> or for example igt_sysfs_get_egines_names --> return list of engines
> names (as seen by 'ls engines') and then iterate over returned list?
>=20
> List could be na igt_list or something simpler like concatenation of stri=
ngs
> or N * strings\0 + '\0' zero string as end guard?

Given what this will be used for, maybe I can just return an array of engin=
es opened via openat?=20
I can probably make that work.

I'd probably also want some form of helper to close the list and free the a=
rray pointer.  Give me
a moment: I'll have that done in an hour or so.
-Jonathan Cavitt

>=20
> > +		lseek(engines, 0, SEEK_SET);
> > +	else
> > +		close(*prior);
> > +
> > +	dir =3D fdopendir(engines);
>=20
> This will open dir at every function call.
>=20
> Regards,
> Kamil
>=20
> > +	if (!dir) {
> > +		close(engines);
> > +		return false;
> > +	}
> > +
> > +	while ((de =3D readdir(dir))) {
> > +		if (*de->d_name =3D=3D '.')
> > +			continue;
> > +
> > +		*prior =3D openat(engines, de->d_name, O_RDONLY);
> > +		if (*prior >=3D 0)
> > +			return true;
> > +	}
> > +	return false;
> > +}
> > +
> > +
> >  /**
> >   * igt_sysfs_engines:
> >   * @xe: fd of the device
> > diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> > index 852b95053f..bff5ed68e6 100644
> > --- a/lib/igt_sysfs.h
> > +++ b/lib/igt_sysfs.h
> > @@ -163,6 +163,7 @@ typedef struct igt_sysfs_rw_attr {
> > =20
> >  void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
> > =20
> > +bool igt_sysfs_get_next_engine(int engines, int *prior);
> >  void igt_sysfs_engines(int xe, int engines, int gt, bool all, const ch=
ar **property,
> >  		       void (*test)(int, int, const char **, uint16_t, int));
> > =20
> > --=20
> > 2.43.0
> >=20
>=20
