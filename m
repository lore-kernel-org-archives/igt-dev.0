Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D53CD4F5E
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 11:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED2710F2E8;
	Thu, 21 May 2026 11:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9r4Y6Ph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F070810F2E8
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779361835; x=1810897835;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bD4Ue20mMJZpd0m0ictT8fR99rbqaL7dH6x5/M+95q8=;
 b=n9r4Y6PhEpCfsIPvVRwT8TBMkpblNgV+7RC896rBtxWeTMMFO/g1KTCC
 h5JDvUA9mNuoj4k7BYz3iKnNeY3fPj8CTum7ltYGHyNuC31hPAC135nEF
 z+IBR4MiJ+YP18bceqq8+zZ9v4MFmfLsRTlHx3x+2qixOWdSD81+buOCf
 yuxLC6oI/i9vYGVbTYqHG1/laP6fFhWM6F/0HHjCcam5BvQvZbJK0SUGN
 v0Z94fE+LNr3FMouk6gi12cC8co+bqy35UKaBNNLP1vIYnXdTLInMPbUA
 p/IisVdJLOlk2u4uyp4Hf2Eru8UmWOYEZiPO9kPzjAErU6F4dgzpCVhbr g==;
X-CSE-ConnectionGUID: PUVIPDOeQpWoCD8z9rtXxg==
X-CSE-MsgGUID: eFgYzwxTT8yUe+xvkvSL1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80332701"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80332701"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:10:34 -0700
X-CSE-ConnectionGUID: /NwclSzDT+yb6a+1joynZg==
X-CSE-MsgGUID: gGxZx3oCSAC6kdMfmjhk/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="236080429"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:10:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 04:10:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 04:10:31 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 04:10:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BT/z7gNVnUO08gIkpaeWekWrTbLL6UQtKuHGQKdLfiks5RgS2aTZl8W6yjltWWnBIyOqEtj3vDgS3AscUo4GQ8ItdVhLKU3tjRnT7r44bfiYlDeAvAlW94xE99MOQjDGLUK0tYxrZIPWdhjMgDucrq7Q9UlnW0XbWV0apffHyL9bnggBBt8y3chbG5rp3vZKHhU0TQIusLvZoIPyEo0g5PT/8YrKF9q2txCTZCc2vVsg3+VZdDYGiC8Rrkd1dV59ZEIIl2/atKx7p4pzyeHmvCHsoiS9x7urnSfl2jC9zXpWhm8o+B77BUt4Sc0xkGHwCKlvefOTv2Dc2TIzJ+GBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeQaC78K40P0HoikFH7PvDfiftU4AgmOXwGaCEkJHK8=;
 b=SWuP00MwRpBA00QSXJW0ilA9ENaAV9/two35Wm3bGD6Imye95dWVA/OdEbx+SeuD0ADX6cTWGixBSENG3GFeeBh3O4cX1IEfamPbqL2JC4ssffsUStuwA2kxuHmjCflylNTN7sD0B6DpyrHbaDAk+tG4+ZKGFfgOOvxzcDTwTnwHOCanQ+bzTOxAlY8cEA97sCKCorLIcLZfEbpmkA91jhZx6c2xjsZIeZ07YEfWy0sWqdt/bCMam4I41FjYg066HHwJ6tBMemQSG/oGyONFymvGzxwLESfBH0P8vu0lJG5twfhh/TGehtd9ZmPcywKLr0rHupTLpe414Xmee0QyKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5564.namprd11.prod.outlook.com (2603:10b6:610:d7::18)
 by SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 11:10:29 +0000
Received: from CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb]) by CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb%7]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 11:10:28 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>, "Musial, Ewelina"
 <ewelina.musial@intel.com>, "Zuchowiecki, Grzegorz"
 <grzegorz.zuchowiecki@intel.com>, "Drab, Pawel" <pawel.drab@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Add D3cold testlist to meson.build
Thread-Topic: [PATCH i-g-t] intel-ci: Add D3cold testlist to meson.build
Thread-Index: AQHc6RE02BV2c8SavEesFIOixe1Cy7YYUk5A
Date: Thu, 21 May 2026 11:10:28 +0000
Message-ID: <CH0PR11MB556431C582E486F3088F8765980E2@CH0PR11MB5564.namprd11.prod.outlook.com>
References: <20260521110957.794644-1-karthik.poosa@intel.com>
In-Reply-To: <20260521110957.794644-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5564:EE_|SJ0PR11MB6621:EE_
x-ms-office365-filtering-correlation-id: 0bc0741a-11c9-4346-07a3-08deb7299116
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|18002099003|11063799006|56012099003|22082099003;
x-microsoft-antispam-message-info: BMFtNHxAAY/Pqj3JqQpxcpCDeAhpv2R0ZYa+uuJ1Tu/aPBxhmglXZiaEFPuVd51p5lcflVqxoFTaWALNe4k8lMlaxvMioaLrsnunakHtviRp3i3Y/273JpTaPjnNshGNeIGKpI5Fi7xLqCYyev0ZCtNpcngBArsIju8YIcEeCw3oV56vTDlTCMAvfYFcOhS21z0H+Vn62YG2kCDDLqm6PoM2vBifU+0beokyMrDpxY9PlOT7pOh2mYR+08EHUghKh/XPhuakAggUMKXYxkXD74fBysutpL1mN2USxnGcJ08nSHluDAAfb3j8bXoMnyBgDlc78H5+1r+80l7rf/60IoWv34ILjVaE8LLEBXLvTFTAqXFbcqFQuaCKl8JQcezQn9troJ/WISxHnCr9I1DXdBl29AwhOyz+bPOe42F+5l9uw9tWVi7kN0s/Ly4GGR+8weAlTzFlS6yKe+MwWN8F8A4IMK5csumKzE9NxVkd3IdKEkLSA/K6IStzx0cekDyAY4eWW72DDtou7I5kS5e9ivnqTPAYqFAz7cnJfP62OUrfUZ14UuCFYtiWAEPR5wTXHPYUp0ttjmmMWDLLnm19HPuUlBaJ+w/O3ezQALEuLZmGTfLpKF3/5sQy1BXcZhotG42ay2mHe2ePxpvZImCuQy7g7uJJ2/u2SJMv8e8EZxD/6RUzrBRjIXDjuwccJaqLrca/Wq7K4dj5TuEOEqhFd9on1hDlUAoiXtyR+KPEGqHEHEdoV4db2u3VUl6NC8uF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5564.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(11063799006)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gE02+tyozXxHU2/fuQqeVZV7ndilnHf22PAexZe2bulJBx25CdnMYoNX6y+z?=
 =?us-ascii?Q?jYqgJqHgMApqyODpdFdERWT0xTrWMA55Q/z4VwbjekUBvO+afQkLVhIofwg9?=
 =?us-ascii?Q?SboMGjcIvABgxBVAhC/kPG9/URyuXnidVsuP9iXRZdsumlSeqwql7GcOPLYe?=
 =?us-ascii?Q?GcBAP/PAKLowByYyWSgHhVJiOhikvmP8yrta8YwiHCKUTJ43CPmzuAIZNAva?=
 =?us-ascii?Q?AbjZu7J02o4YLCBLgasQMUlIbsDxdlGxiTA/GU9Jhy/amsiPHb4VmoXoN4RI?=
 =?us-ascii?Q?pPGziGYs6v7F6gmh9lAaFW4iV4WfCsbmrGLVAx0VYzoUbVZWnLmJYwPmPcq5?=
 =?us-ascii?Q?9lH8BBs9NBDv/e1FH4UaCV5Lyug5IvV4qoybaZnRi5J+UEWPJWtMa+ffVTgF?=
 =?us-ascii?Q?q/9+5mTlEhMnlHN4WeO4UmU3phhWRgqy2zs0vWVrrQM++D1ATGrMdqgFjH4F?=
 =?us-ascii?Q?gtQn9cQ23eQCIPidLSAkg2zQy2uL6jMVOK+tikF+grHOVwdu2il/C/8jJDBK?=
 =?us-ascii?Q?g86OfdgqbbMXO3dTMrtQtj29Wf+V6fSDAciu/1I5jv0jE0YjkOaCF1M54N/M?=
 =?us-ascii?Q?TIpzrmJjgFtJ48iHXMb5TJ/8xITGKaZSeml3xI5AnvYgK3NR9uKWL1nevFmx?=
 =?us-ascii?Q?E2F7q3r8myft0xMcoZfD8u2cljTNB/quWwvQnnRD8ARxV+XYmGe/Mj9CR/dg?=
 =?us-ascii?Q?t9LkAXDhqkoQSPapHFzdwwiBJm0b46iNONU0tOcC1CG+AvZzbbaMxuoGoljl?=
 =?us-ascii?Q?tYZlf43kXIOS+2Y2CJrf7PDck3+/ZMvm6JnJm+cXz5gJBDVvbl2qp2SgGbd4?=
 =?us-ascii?Q?a16mfGj+jfWdOvJT0fBINGLuFncN2mqQXX0E0+QIDFYeQ34XY8WmYDS1Jx2+?=
 =?us-ascii?Q?0/Ykc1f7+KTep0HWrAUAQUm6wnR9ODC+0WXDaR3cgW8Njmsf0O+7K2EAhqoD?=
 =?us-ascii?Q?Oajdnw4lI4UA3avOAeGyyW5Paq0ACGd7sgPinyakOmPjSsx/TokwtxVH2SKn?=
 =?us-ascii?Q?hfCWTAt/CHRlQbifrcwNVPr7cqhNF2+9nAbWKQeY2RhZkg0I7HEgAVuiB8iI?=
 =?us-ascii?Q?OEE4XlrQraXq+WGg5KKy9REpW9Yc5rm/krlngesC1h/ngJApC3vwP/Oe3vSJ?=
 =?us-ascii?Q?Bx1Jb5/KUdyfPPirygpIHKnRl6n7V0tTN/2flI8T5huxxhKw78J6Q7WeJx53?=
 =?us-ascii?Q?a8rE+/FRXJGreEaIYK+BxPnHjmcSWe6Pgyosyd9v+alrOEu3NLqMe02GFQmh?=
 =?us-ascii?Q?1h/2joDV+PQcB1BHi8N0y7GC44UIxQveuu7HuPYlGPqNUFvvKFzx0FOwfaBB?=
 =?us-ascii?Q?HcOELbL+7gSwLWucoBNiRClgwbQCDT2Zbs2utxEgrsJVVxIr0MSGIUgGGYmL?=
 =?us-ascii?Q?7UZYxax9PZCBoZjbLykP2fmwY68XLN+i3S+G9ATo5IFbtoTCofH4oeIaEw+a?=
 =?us-ascii?Q?ziL/sl3o2+z20sA6u1r9L/QYb2vCQunG/Q3FaOlQzmWZ7cBKeTwAHX8kkAC3?=
 =?us-ascii?Q?7lvVE+Mt5v9WFi+0S9qVaaNu5zo0r4c8CAWbZuxfoNfZ+651y1gPrcJ1ySaE?=
 =?us-ascii?Q?p2Psa22M23jmMC2rPcA1XkrB0lub0DhYOzVgv0ci+7vpOqsmfnfsR+si0ui1?=
 =?us-ascii?Q?rvolHceW2Xp1qC3na+sEbqHrrix24GQhMF0Z8/Iz/5AsdwkOOeQQtyq0rswX?=
 =?us-ascii?Q?huytcLw7sifp320eG6OdiAbW5LCvLjaxLAjh9MEfjAl4+NzyTZK4OwCZwGad?=
 =?us-ascii?Q?klq1W1YD5w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Chl1vhRbRLXeaBEAI/i4zb4BgBduMGRX5v1qJdOplINTfF/Tps4q4+vluotlaurhY+DBmeZ6YatNQhyFFaaOzSV+HGG6H1OruIqMHudQNzI9wKr9A72eT8JK1L/HtjZHqrqJXHGgIT66Gne3f3Jaqat+R0m2k9SbzZYUX7DubQA25I+d1IVeLxYdQHpN9kkAu9EYulF0e3wI2TV9rnefMmw5yFK6FHzH3e2Uyr01483Gj6dwPkxpk07CSe/+Z2Lm9GUieC+BVqHEueOCOhAuXhCP1tfHwSDJXFanaqX2I1QrqSdZGdVK0p+5s3sECtgyv2ZsP1ntb3xUndpJQjQHrw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc0741a-11c9-4346-07a3-08deb7299116
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 11:10:28.8365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wbB6Xk7dCIWAQMh6UDzOxh7lX+HTForOE0PX3TslPNiJKlPddAkuLCBxKTPCCwRhizPUqYw9deWkCsCiECq3zodE2ROapNmkZX009y20mNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6621
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
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: 21 May 2026 16:40
> To: igt-dev@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Gandi,
> Ramadevi <ramadevi.gandi@intel.com>; Musial, Ewelina
> <ewelina.musial@intel.com>; Zuchowiecki, Grzegorz
> <grzegorz.zuchowiecki@intel.com>; Girotra, Himanshu
> <himanshu.girotra@intel.com>; Drab, Pawel <pawel.drab@intel.com>;
> kamil.konieczny@linux.intel.com; Poosa, Karthik <karthik.poosa@intel.com>
> Subject: [PATCH i-g-t] intel-ci: Add D3cold testlist to meson.build
>=20
> Add D3cold testlist to meson.build to ensure its inclusion in IGT package=
. This was
> inadvertently omitted in the earlier patch that introduced the D3cold tes=
t list.
>=20
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 7ee1fa04f502 ("intel-ci: Add a testlist for D3cold tests")

Reviewed-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel-ci/meson.build | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build inde=
x
> 2b3266bbd..91a29b734 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -25,6 +25,7 @@ intelci_files =3D [
>    'xe.multigpu.blocklist.txt',
>    'xe.nvl.core.blocklist.txt',
>    'xe.nvl.display.blocklist.txt',
> +  'xe.pm.d3cold.testlist',
>    'xe.ptl.core.blocklist.txt',
>    'xe.ptl.display.blocklist.txt',
>    'xe.sriov-vf.blocklist.txt',
> --
> 2.25.1

