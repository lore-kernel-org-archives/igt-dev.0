Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7C9E7716D
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 15:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB70510E0C9;
	Thu,  5 Dec 2024 15:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYRZsPcW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2AE10E0C9
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 15:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733411832; x=1764947832;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VEdMdGNKRofMunMaa7N/5jalaTot5eYKpFH6H9jZsf0=;
 b=FYRZsPcWtplLJJn+J0M9RvwTMuUeJA9hd3l9LP69fVpdSBqL8WQRu+BP
 MjbMBsoHgxyLpXbgakvdPba09fXfzRsSZyHEThusSgGAuvOWD5/znQ3X+
 UMpMphI0UJYJP2KO6T1zZRWe9JVTycvFsmNfLFpw2+ZFxyc7l8ITEI+hO
 etYfPyGa57R/IVzHWRS+L3qxF8l3dP6Zo/Jb2z44db3cEroqcGRqtq4Jl
 +MHzRA57sypNtR3dY8+Ii0dNuYMNviRTrI6glAirHerQ/07iDhTipL8iT
 kjZT8wmZeqlU3xsHZVmpM6fc0ccuLjw7Btv2w7E3gOpsh9lBTJ5pSF+Tv Q==;
X-CSE-ConnectionGUID: C/nKHrzyRPek1FYHUH1rFw==
X-CSE-MsgGUID: oFwDstT2Sh2uUK8iA86Xrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37388679"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="37388679"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:17:12 -0800
X-CSE-ConnectionGUID: S232na1MS02HuC7oTYJ9tQ==
X-CSE-MsgGUID: nQtwL60IQy2ruXEl/Fu2kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="99080194"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 07:17:12 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 07:17:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 07:17:11 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 07:17:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdIgz7izEnniLGFcx0L9VQD0LZcDLRU8Dtei60iPaITR62pnUW5C+6cdnUy/7yslURYjw4RIh9PoJoFCGJbXhxPTc7GsiQVxabmlVNL23hYXoqadwmI30R6lzIvldjZMIk+pzLlWBAx3NrP84reVKxMVpMKgN0O7/pmiHJe29dXom8Pw3g7/yqiwO41b1z9I5cYq7Bjn3Q7uPuuXDh1A79wLBLNtTGMmdnzFEFv54/FO1KV22L62h979//dkrofn6xL8z4GZUS9sqpVAPR70nwYGxrh+rt+kN7ezCH6O5gRNTrMSDiQeeUp/SLBO8Jej9twRu2WicRgwgrAQolHQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFAZs1gIGP3F20NI3fmDqQTbNQtZ4G1Vx/WSfLtKMx4=;
 b=jA6aLWsw5olduRxuo4GnfmTPBFJTMvVGigUG/CJz/VPLzKrT+jzh0g2vW4dCSpYD/B2iNYVwjSG4MPnxMCaIDWuIp2C7fJ5goaxCM5D4wnf47RG7iATVQ5wx6gVYl6YQPlKRRoXCENL/ZDMhB7Zt02FGqMY1zxGLsZ4d8WRG9ztOCEr/iBka3glJHfFE2XoE913EvJx9aDnA35qLS4rfMFRSpXguyv1KyPsdop5CzxZ3FAestQ5IbAjLLSN7K/qOynMMO68UH3N8hcDMTEbichS+T0+4PH/C/795pLD2rTzNHyUUOEMjwjmGwBtkRovdsiTuSDo9FrLgFlfeUhxc5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB8281.namprd11.prod.outlook.com (2603:10b6:806:26b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Thu, 5 Dec
 2024 15:17:07 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 15:17:07 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>
Subject: RE: [PATCH v10 3/4] tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout
Thread-Topic: [PATCH v10 3/4] tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout
Thread-Index: AQHbRps2vFYzut2P0EisQHI0sxePNLLXkXYAgAAuf7A=
Date: Thu, 5 Dec 2024 15:17:07 +0000
Message-ID: <CH0PR11MB5444A776470662813100144EE5302@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241204222347.108788-1-jonathan.cavitt@intel.com>
 <20241204222347.108788-4-jonathan.cavitt@intel.com>
 <SJ1PR11MB62043338AF6E4A908816FA3B81302@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB62043338AF6E4A908816FA3B81302@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB8281:EE_
x-ms-office365-filtering-correlation-id: fca6f6f3-3c88-407d-cc39-08dd153fe1e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4QxqDTfVfNSC+AXyYOCM+pho6gucHegQ2W/IzjCz0gx39yA+kyRNBlR6/HxW?=
 =?us-ascii?Q?IYwd9i5iGm4j7/LTpV1tIG+nSJpZCxeMtTulCQ0Vfy7QCy+/Pm1PdUdWzFzB?=
 =?us-ascii?Q?3zWYH8wm6+0o2QfQTv4+BbYHpzCRpkZL9er+AuAHfK8DT4MnBWXGxY7mZ31i?=
 =?us-ascii?Q?1pw1jmbKJNigKcI1LpL9M9sBG0163QBUDIBj6qoGCk9tWiJJKM9OlnfM7oQa?=
 =?us-ascii?Q?Oaa+YC+Zi0YhlpbYsqyC5nPo7X/5jHlkvcsx2hejB8IRCXNqwotrLea11XGj?=
 =?us-ascii?Q?OWBk/2nOIyMtxewWy/DPvyKP16a92LDz/pDpEpKWzbyzST1Ok0fxt1IN9e3y?=
 =?us-ascii?Q?GYDD5Zj9QkZSpfTqp6kd1f1NHRomwoSNVEtIv/zI+dlCQ7urgIQfEsFVwxG4?=
 =?us-ascii?Q?XKS8uHpsVH2BjTeBMW6vMwcCsUcYIUTejZNBepMjsYPQKC7nI4rg+FOi8NGm?=
 =?us-ascii?Q?kFBvnBZ+Al15fjgTM5+5lSYme3V7mKPHU0MQetiwdL6lkb+pCyUpkQy1D9jY?=
 =?us-ascii?Q?RvVET1JhsGy7zcLxB4F5a443jr4u01arp8n0GzLDMHesmgs8kyXbs5hwUJ51?=
 =?us-ascii?Q?MKoiUmC//2pwVPIGpnbUEBcyX1xMKjVqcW6AhAXOdI3f2vsAyBzhvaP6zUTt?=
 =?us-ascii?Q?jN7h5PTfX2ORK23RHCOn5c18mXDcUpFEsJB1QrjMB4CFaw3DVAB6iHiBXakv?=
 =?us-ascii?Q?SIn+se2ZwWZ2dMQkNUp88y9+S4qjmZ7k9A6ic2gnJpZWmayJrOQZQJLzGC87?=
 =?us-ascii?Q?RcOdt8UUbW1FJre3F4A7CHqa/oqI7rqsOtD9IU0nCmMqcLpAS8pYB5EZTZk2?=
 =?us-ascii?Q?eAfAIGZyHtjuRyOecJkd3mbqd4OXXdmc+q9huNHkEPyTLEJ23GS/KwTLBp6z?=
 =?us-ascii?Q?AAF9Mrc19TPtm9CHTQ5OG32gt1nNSmP4HtQQRW5q9WqOkuVIzx9xfEmNOWvu?=
 =?us-ascii?Q?CZB23641eIbd8KGQP0XhbKuohXcDhM6YpAlXqPvIkZHP0xFyN0RlKhS8DYf6?=
 =?us-ascii?Q?958rMyzVBA87awqDpSScUE8OSNPTot0jXlcuf4bvDzwdSO7ZRAOOBLD23Z4u?=
 =?us-ascii?Q?Mj1UKviPAwCf37ZDTAQ0LXQ2PganpGIXHV4/LZqhIlvS15jHdEhSWVxaR4vQ?=
 =?us-ascii?Q?PAefngccK8nsTC2Xs3a1qJ2B2XKgTopYrWsw7VgGSTnn3o1xILIH5E+0k1Ko?=
 =?us-ascii?Q?89t/YzND06z3fnvbibh5+Se2IkutgWRJRsqRpWWVFoZw6r19sJ4+sp/OLmIz?=
 =?us-ascii?Q?7SFMDVE7K1oc4xTfv+6PL/ucYZbfCOXyxS/MjA9etqhKyv3SFkU24rSjq/Xr?=
 =?us-ascii?Q?k+JU7VBZVceiW0kcmTs2VG9yWbtZhB0dMPEkbk2kDrIPt5Etu+O+i9950pLB?=
 =?us-ascii?Q?CHF9hjo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Oqddb9V28kjQAGdSea6ZNzUcG5wNGikPfm/nmZZhltk4ShCLwB0sWP8Al9bZ?=
 =?us-ascii?Q?2jnlKCZfLn6xGMn9Af/koiHtZK7Ti7WwlkNhYD+bJP+PyI84ZWYmze3qa62G?=
 =?us-ascii?Q?IOSxFFfl27/z2ktu8AhBPspdq39liymcOottvPtZUt7yLqLjCzZU70uJZk/y?=
 =?us-ascii?Q?4yScaANYMDJNGTfZhNpUjtiX+mF1BLbJ4BsgYVmNCvuxyrlJDBiiNy/iJMNu?=
 =?us-ascii?Q?DTwjO9uSNH/b4ByCt/ATWPzn73j/xexysMfmpz0rhSTbJ/nbHzy+yOVlls2D?=
 =?us-ascii?Q?upPWkqpoNAJlHT9DCc8L2L7YS6INyHcIXpCqh+pY6Yz7oT5j27DFndmxfc6T?=
 =?us-ascii?Q?OFDNznplPgx9OEXQrw0ZufPy16KSn3tJOz+CI71lm+5roBN/TBvF0IsJ88mY?=
 =?us-ascii?Q?3rSeQ6z0g7/IopgTC+tzUjk6Sq7OcP9LQlj36hUgrOn0fy+kOAs3RdTRBdZg?=
 =?us-ascii?Q?gpaT8bMzMG403S+88WEyg6SHd4NHQYUis+Rgg0ppUc12eBb1QXow1tc5MfHj?=
 =?us-ascii?Q?O/kdHheJrx/GM35FPv1SeyQTuK0SgLozoTrw4jcbXCqoPYte8Z3QY4tmrpsT?=
 =?us-ascii?Q?WhhtcAKYWrXfMpZVlsaa8zv6E3aLL2PiFaw/WgeDAgnAR0OOL+vo8XkKJ+MO?=
 =?us-ascii?Q?KBxpmeHxNSbVFa76WqVoiOVohooUTOovpn8pS3SMXnpEAymVLYsU89ZEr4IO?=
 =?us-ascii?Q?mxUbUp5SUf/GPfkFzDlHV3npuXhSBlbfE5+Lsn70FQRsWQG2661jfLZ1AKUu?=
 =?us-ascii?Q?gLgEljoR+/fH2OtYLeULJ4P7SIEsm7NdmF9S4uU7hnuJDxutKp8r53UmUsmY?=
 =?us-ascii?Q?P7l5qOYCqrox/qtNxIbHbDOYnQaQ1s2XO/ygkl4/3PgPAwNCghIqlwAYb4Qm?=
 =?us-ascii?Q?BDFWppYioDIv5uAz9B2HH1/Gt1pBHI3P+Zjj6eFroLkYfCTB3tHYD9OFlVjs?=
 =?us-ascii?Q?rE/rZRtgeo9N3nZ4QcOP15QuvPGY+BoxYm7cEmNTfv+hNyR/AuSS0+5y4Xeg?=
 =?us-ascii?Q?Br8DQf+PrbrmjaucvDUfl3zpMDMVKRKOg/SBLvDHXgJ0qQj+FFPNIqH06SPL?=
 =?us-ascii?Q?Z+kr2B2BtFKi56yIXgfSdCmK3TzeDjd5i9YsZsG0inNTO3nuPusuVRb8ndy9?=
 =?us-ascii?Q?kx6xzd8CW2sXHF7fplBF6CprmHMXKFy1I1eWw2a4Y3FtOEGxROqDdVucWzuu?=
 =?us-ascii?Q?VSGM1nNnvR4wZaO9R8du8pQLMnuXK2bnuo+KeubXiTPKjCjNSU/2vU2Rgm7t?=
 =?us-ascii?Q?UqRkfVmaq9G63goweM3UeBB/I19UKjJaXvgKgtgJ7QS4plOshhoiuN+2/w5t?=
 =?us-ascii?Q?U7MIlSf81IZVr/vJ663WmyumOidgQnJYchRMrKi1JDIr7wbS5NwlP7tLwcBA?=
 =?us-ascii?Q?HqI0cE/HbTFv2G+9XRaJNGzfMMItSM9rVhyj+BkgAyj18l+pyzwlMcKC5wuf?=
 =?us-ascii?Q?qliA524J6SI6c1HMKF3uNwx83RFaXunNwf4n3MoA3n7vO075WzAFcOIZ0qg9?=
 =?us-ascii?Q?V6KFmDiZ51jAmwD9tnmyfxsRq3FnLzt1TaFO4UrHFEN0K1xFKTGgi0fuRGTm?=
 =?us-ascii?Q?Chg56FIvb5tSlYgH368j2NDB+5F0zzsyV4VagvRC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca6f6f3-3c88-407d-cc39-08dd153fe1e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 15:17:07.3220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dOGYMDKBb744eHS9AWZiTVCMAYwdoX7KbGjG+19xelfqWT1HswWsj1dcAmlkexgPjryXheqlRVPmJaclCBezpZHjBmVgiqejNvPeHdlET80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8281
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
From: Upadhyay, Tejas <tejas.upadhyay@intel.com>=20
Sent: Thursday, December 5, 2024 4:15 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; igt-dev@lists.freedesktop=
.org; Brost, Matthew <matthew.brost@intel.com>
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; kamil.konieczny@linux.intel.com; Belgaumkar, Vinay <vinay.belgaumkar@i=
ntel.com>
Subject: RE: [PATCH v10 3/4] tests/intel/xe_sysfs_timeslice_duration: Resto=
re preempt timeout
> > -----Original Message-----
> > From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > Sent: Thursday, December 5, 2024 3:54 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg
> > <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>;
> > kamil.konieczny@linux.intel.com; Belgaumkar, Vinay
> > <vinay.belgaumkar@intel.com>; Upadhyay, Tejas
> > <tejas.upadhyay@intel.com>
> > Subject: [PATCH v10 3/4] tests/intel/xe_sysfs_timeslice_duration: Resto=
re
> > preempt timeout
> >=20
> > The subtests of sysfs_timeslice_duration modify the preempt_timeout_us =
and
> > timeslice_duration_us values.  However, while the test does restore the
> > timeslice_duration_us value at the end of execution, it does not do the=
 same
> > for preempt_timeout_us.  Because the value is not properly restored, fu=
ture
> > tests can end up using the unexpected preempt timeout value and thus ha=
ve
> > unexpected behavior.
> >=20
> > Save and restore the preempt_timeout_us value during the test.
> >=20
> > This fix does not apply to xe_sysfs_preempt_timeout because only the
> > preempt_timeout_us is modified during those tests, and the value is cor=
recty
> > restored before the tests end.
> >=20
> > v2: Also restore preempt_timeout_us on test failure (Kamil)
>=20
> Restoring timeouts after test looks ok here, you can add my r-o-b for tha=
t. But if there is value already set via sysfs manually which is not defaul=
t values then we still have chance to hit the issues we are fixing here. I =
have tested this manually what I am talking here.
>=20
> I think restoring or setting up these timeout values to default before ot=
her igt tests like igt@xe_vm@bind-execqueues-independent is very important =
or else low values of these timeout set manually via sysfs (echo value > ti=
meout) might fail the test.
>=20
> Although I am not very sure storing restoring timeout values should be ba=
sed on default values or not. @Brost, Matthew any input here?

Do any other tests change these sysfs parameters?  Because if not, the rest=
ored value and the default value
should be the same when running IGT.

As for the manual case, where user changes may occur before testing, it sho=
uld be in our best interest to
restore any user settings we change during testing.
-Jonathan Cavitt

>=20
> Tejas
> >=20
> > v3: Abort on restore failure (Kamil)
> >=20
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2976
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/intel/xe_sysfs_timeslice_duration.c | 19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/tests/intel/xe_sysfs_timeslice_duration.c
> > b/tests/intel/xe_sysfs_timeslice_duration.c
> > index 899093a9df..752672691f 100644
> > --- a/tests/intel/xe_sysfs_timeslice_duration.c
> > +++ b/tests/intel/xe_sysfs_timeslice_duration.c
> > @@ -115,10 +115,11 @@ static uint64_t __test_timeout(int fd, int engine=
,
> > unsigned int timeout, uint16_  static void test_timeout(int fd, int eng=
ine, const
> > char **property, uint16_t class, int gt)  {
> >  	uint64_t delays[] =3D { 1000, 50000, 100000, 500000 };
> > -	unsigned int saved;
> > +	unsigned int saved, old_pt;
> >  	uint64_t elapsed;
> >  	uint64_t epsilon;
> >=20
> > +	igt_assert(igt_sysfs_scanf(engine, "preempt_timeout_us", "%u",
> > +&old_pt) =3D=3D 1);
> >  	igt_require(igt_sysfs_printf(engine, "preempt_timeout_us", "%u", 1)
> > =3D=3D 1);
> >  	igt_assert(igt_sysfs_scanf(engine, property[0], "%u", &saved) =3D=3D =
1);
> >  	igt_debug("Initial %s:%u\n", property[0], saved); @@ -140,6 +141,9
> > @@ static void test_timeout(int fd, int engine, const char **property, =
uint16_t
> > cla
> >  	}
> >=20
> >  	set_timeslice_duration(engine, saved);
> > +	igt_assert_lte(0, igt_sysfs_printf(engine, "preempt_timeout_us",
> > "%u", old_pt));
> > +	igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &saved);
> > +	igt_assert_eq(saved, old_pt);
> >  }
> >=20
> >  #define	MAX_GTS	8
> > @@ -159,6 +163,7 @@ igt_main
> >  	int gt_count =3D 0;
> >  	int fd =3D -1, sys_fd, gt;
> >  	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
> > +	unsigned int pts[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
> >  	unsigned int tds[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
> >  	int *engine_list[MAX_GTS];
> >=20
> > @@ -184,6 +189,8 @@ igt_main
> >  			while (list[i] !=3D -1) {
> >  				igt_require(igt_sysfs_scanf(list[i],
> > "timeslice_duration_us", "%u",
> >  							    &tds[gt_count][i])
> > =3D=3D 1);
> > +				igt_require(igt_sysfs_scanf(list[i],
> > "preempt_timeout_us", "%u",
> > +							    &pts[gt_count][i])
> > =3D=3D 1);
> >  				i++;
> >  			}
> >=20
> > @@ -215,8 +222,16 @@ igt_main
> >  			while (list[j] !=3D -1) {
> >  				unsigned int store =3D UINT_MAX;
> >=20
> > +				igt_sysfs_printf(list[j], "preempt_timeout_us",
> > +						 "%u", pts[i][j]);
> > +				igt_sysfs_scanf(list[j], "preempt_timeout_us",
> > +						"%u", &store);
> > +				igt_abort_on_f(store !=3D pts[i][j],
> > +					       "preempt_timeout_us not
> > restored!\n");
> > +
> > +				store =3D UINT_MAX;
> >  				igt_sysfs_printf(list[j],
> > "timeslice_duration_us",
> > -						"%u", tds[i][j]);
> > +						 "%u", tds[i][j]);
> >  				igt_sysfs_scanf(list[j],
> > "timeslice_duration_us",
> >  						"%u", &store);
> >  				igt_abort_on_f(store !=3D tds[i][j],
> > --
> > 2.43.0
>=20
>=20
