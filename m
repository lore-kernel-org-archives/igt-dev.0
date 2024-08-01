Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68032C52D54
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 12:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD1610E951;
	Thu,  1 Aug 2024 12:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AN+N+UCF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3434B10E951
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 12:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722516201; x=1754052201;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rl+1gqfbcqnRwqRVl1hamsbeR9Js6dgksZXc7DxIJBc=;
 b=AN+N+UCFEL5je4q6ofs2YuSo4Uob87gDx6M1Ltq7Cm11AlMi1UhOAeUQ
 ssNuxKcivNyAIhNInAnH62aQprCzM4W4J2yHftFS1n0/AwQr5t0iVK9fW
 lxRbzAyVVQsGJweGcF+w+K6Vv//sD/3EAaEvnub2bjLs7naJbn++pIwql
 G5cRS3y/CcPLXmcpWFvQOvAfm9+pbMXgIsfwXhL6NbKpgboA+z+tpyblK
 KsVbWH8btMPdIxRxPP3hEEgNOG2EI+upRq4sirXcFoSKtXVIJf1HzMvEh
 TPahIk0x5Cu3g8j3rMkKUxE6WdKyc1ETJqPs8bLtmfAf3CBiwEHrl48sC g==;
X-CSE-ConnectionGUID: PjF0t6o1SamcVGMiCLXErw==
X-CSE-MsgGUID: OtJ5PW5bSB2yzxSvUiyolQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20049974"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20049974"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:43:21 -0700
X-CSE-ConnectionGUID: jiGNM/UASz2xuGDrG+hMtQ==
X-CSE-MsgGUID: CIE83s5JSIi27+oUqXCFfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="92553390"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 05:43:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:43:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 05:43:20 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 05:43:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ls4mGkRbxtjc/lZr2DRgnkoY6xkxGnURHxW6o/65ysbAOssFWcJllIB6d3PkXieS8hLly9wj+uK52O/HRxLcCEKTqk4HgjNiGgCzw3GJIbGC9lvcMSN+ARhv4I9PYcdnJY7ojNvUS1/5Gvjnm+MNIL43YbP7w5nI+JB0o/Pz6MQEJ6wCA1kei0v32OcZkWRWT9PbJu9wsEaHiZKGncdz/GzUIJRQP4G3KbA2QLl6xVZ8TpMUIIg+HbK6LkewzOF5Zya3vR1hvIXiP0wYxzAlYxMB4ctOhDWLpX37DPZsbQbwNSeQbTZX+sX+wrzdS1YQKZXzA/yyLBqc6t1frNxY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Lewqq8Y/AbnuqyM9tI73XVzDBEC53gqHJlphPtwZ7c=;
 b=qOGeR0LjmjajjNfNsh9ogu+bDC6rql+oB9DHzYRb8a/CB1laEwCnJvz0NpIzcr/HJlmf6HK7Q8/QIHMbtLeIy4NJQNLl0EjKSljJ50q4RHH0bIBFvAwOh7S/glBEtECtdkMDdqMpxczW2msJxN4I285KDigNyZP376+0ckJNwoXdP19T5Ezpk+oohfIB+uwp2V9TUdYsOrmPeeYEBW8q8+ca4SyhthhuuBtFp1k3df88+WNk4TXfSEImV1lzIty5VF6faIMPY9TjVqHF4OSHk5Lg+wS8W7mXiqst9d5fnSFoYsT/BTZimDuHJZ/xCoFPbpd+GjJ3+E1Oxcq0/qf3hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 12:43:16 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 12:43:16 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 27/66] lib/xe_eudebug: Add mutex for log events
 write
Thread-Topic: [PATCH i-g-t v2 27/66] lib/xe_eudebug: Add mutex for log events
 write
Thread-Index: AQHa4nZkOPMrdxv39EyScgoc2P7U3bISW8Qw
Date: Thu, 1 Aug 2024 12:43:16 +0000
Message-ID: <DS0PR11MB7264D8A9F495415BCE1837BDD9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-28-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-28-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SN7PR11MB6679:EE_
x-ms-office365-filtering-correlation-id: c09c19ff-f450-4ba4-adcd-08dcb22783f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?bfWZZTIZVnKQCC+Ra5vrD1ZKUsoLuuacZeWCTZuXY4kFKcNmY93ENpGGRw?=
 =?iso-8859-2?Q?HimmoFMzoq/KUwhCMikdgc9zWQo2vBfS+cb/QOhPyQ4+Stndt1ufHvrglb?=
 =?iso-8859-2?Q?0wdrYXErVi86vkWgnmxKu127w90IDcnUxmbWHmz7LjGgYXOxaSqgNa0j0H?=
 =?iso-8859-2?Q?RDQ0/qRm1rlCKRC+c7WxMwHqWET8ElobljfxIxDHlyjT3gB6+M6T+1xx5Y?=
 =?iso-8859-2?Q?tb2KDIlYrC0H4Y1FDscI55sT6p/Pj1CN/ow6e35R43o2ArFE2YWl1l1RRi?=
 =?iso-8859-2?Q?dAm9fwlou6APBce8V6LCTpZtsf7W1xrNDwqbHc1rSEPGvbMkIf9VKZgXre?=
 =?iso-8859-2?Q?GZ54E/t+QeddhAYp5YrnawP8sog96zsNawlG3B2G0P+xXwJp9jILjBaQo1?=
 =?iso-8859-2?Q?EPEUU93d7AEI/tnRGUcQ55JS0ou7Jk53fPrdjIdfzES3QaE1bvy4OfUcLJ?=
 =?iso-8859-2?Q?ShuG7lWs/bvOjb12+AxxsBeXuB1YYGpyraLODUA6n7XZCwWBZuqKTUyi+u?=
 =?iso-8859-2?Q?UETt6rbZcNXiSXMtFNJCuq0VBUGvOOj0NMZ+xUf0zaaOMHDT+MO4tH6XB1?=
 =?iso-8859-2?Q?4VAlM4izThm+mXY9f7huQx4kKITJnyr1TCTQMlonUsPjgG7LizROOicQLV?=
 =?iso-8859-2?Q?UjnBePudIwILx/QtSzSY6wWPcXk61T6KAkrX5nyYiDUIMa0/N2LeimvHU2?=
 =?iso-8859-2?Q?G6uX0i1WQWFlr7rcteR3GMy2lA0otFG0IipM5KE956J4xQxfk35SsrohNU?=
 =?iso-8859-2?Q?Ow1uw+uyHALshQDaWMX3pAsj3U3It/QXx2nkWA5hCi/EU44jfNFjtasCGw?=
 =?iso-8859-2?Q?upHUuo2OXzo9+vw76vc/bbninSFewEn1UeKFiatsn9pFpUBgtb89k1Xo/p?=
 =?iso-8859-2?Q?0Dw0vZV3XPS4yqiLxHW0i4FcIa+icaoATLHE+oUdMCWyAOGx52BQw/+fDq?=
 =?iso-8859-2?Q?PtT+cZjoWVz+zC+m2/qRL3vE457a3OblN45zu/ezK2U9fTq68/SAEzl9zV?=
 =?iso-8859-2?Q?Lygam1yH5K4MCMq3ra81V41QXR5OYpvvGPv7FEiKjkTVhMfbIlAkqJhSDb?=
 =?iso-8859-2?Q?dNVdpdw1XGRAFlaK8YtbwS0IhiYZXPQIwITzYRn0xM14NR2bH2rYOs9d2I?=
 =?iso-8859-2?Q?6gxrovIG9Ux8bwQmqBICSa4fZfdpIoHh5RnZTtnh5sOcc0pJNXFt8Ob7sb?=
 =?iso-8859-2?Q?sp8Mc4J57jdnSb7FTcq6GbvMU8+U66PTXkL0C15GuRpkuYnRUIKfLaIG5H?=
 =?iso-8859-2?Q?gbQ4Oed945l82e3QIWCEncAPxw7lzR++ru9StRWUiP3myllwyBrl9OmXQo?=
 =?iso-8859-2?Q?5dGauB1k/ReX26i6JXbfdYVLJ+mdytCBYNudDQQXg4BuwQVyNk2+G3O7Xb?=
 =?iso-8859-2?Q?Egq+74z9TBmQd91qiJ5JaYdANI3FFewlzhu9OTFtA8m4BUPD34/91VxxgW?=
 =?iso-8859-2?Q?96x2gkVxtpS15M8fNXkYn9+zmOiBdgJ18losJw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?e8JhFHVnuox8LhOiMT8UfIG+fsBKf0Ur/TQXWNUpFFD0legSyVoCBF8yoQ?=
 =?iso-8859-2?Q?9pQxMauNQhrKXETahoNDjF9rUIFFJql+lUeF8jZqlBaZQpvGB96J/JU5V5?=
 =?iso-8859-2?Q?nmJ2VTE0j+ryH8Lvvueu5XeWcvZyBeQF7e2Ey4YYdvvwgEPyu/QKsQPdfD?=
 =?iso-8859-2?Q?UUa026mKRJV63+AxNOv98G2hkj3NDvKYRvmP/FJhcC1uNfRUOTnVACWugR?=
 =?iso-8859-2?Q?B7f+lpjbbj5wBJ6p1437hDBwkUvjISJKnj9CCOeotp6ReNOA4HshCU7ifC?=
 =?iso-8859-2?Q?1y7VFBJVUbOHhLtqNOEJORPSVXKUmvzAjJayHIDETOxIUq+WLo6FLbXe4X?=
 =?iso-8859-2?Q?4vDGsth0VmUvueUXpnmMUkZED3PwCDTZ6LdlnzjVSSSQ9BQR+ZFf+8R6vP?=
 =?iso-8859-2?Q?03m542e+/G+IwUs2Zfs6q9fSdDtD4C+jbGY6YYFXltAEw2xwJXlhwhe3XC?=
 =?iso-8859-2?Q?1VVHDJM1pGTwvftwV3qNzNIn6x2cXvAvK5sNcBoqMMzYT0uVc4AnILWs4Y?=
 =?iso-8859-2?Q?II7tM3gBgMKySHZguIlu9wlPMpj9c+4WsaLZV4JFIHciabE8Zf73oGa2rE?=
 =?iso-8859-2?Q?KWYk1X6uTz0k58wWWgwtX8q726cv+QtD6n/AvNJ7sed/pGv5/6z2u10EqQ?=
 =?iso-8859-2?Q?pdKgo5+A0CxNQh/s0llHsF/k5gmDm9riq2IoBpBCtUGaOQmNFqSaiskFaE?=
 =?iso-8859-2?Q?LBA6e9fCS01JUGHc2ey/ty8dUsTFA2UmJO+R/Fi7Hmnd0yNskTGOscXi45?=
 =?iso-8859-2?Q?5wwEqodM1msZXCiwBy97rJvjcHrC2MedFmb5fdQBgB376jEHc0IW4RTikT?=
 =?iso-8859-2?Q?sezVfwyNb6UzZnHMoPDTO8V1sgTsn6IBNvDeUSt+QvQz0OQzeNPirBVmUh?=
 =?iso-8859-2?Q?p2OTqvEslKjHo8gc6HxpChZUVi/Uv/1RrmGGo9t3CL7BJD8hGZEWpCWnxP?=
 =?iso-8859-2?Q?rPM+qlDglrwHR2t5N94qFUKPFr/umKfprs7MzXnZb7P88OlFpJJgOxpJd7?=
 =?iso-8859-2?Q?Y9j9SQdMwQISC0kEgTCxo+RpCXuUTkiGbSWF/8DO50Tq8qRPTcrJm/Phfb?=
 =?iso-8859-2?Q?0rlXXBXuUD6egn438wDuosGLATHWZJAZDtF7gWmI4lbNXCUcxEcmVGceGA?=
 =?iso-8859-2?Q?Yos1GDQ05QpNZYJ4veYj3UoChuk11837+kSxfXAiAjMHBr5B03U29llaEo?=
 =?iso-8859-2?Q?vsQlYS8932sqLwMWN1TuqZn27m6mJZG/muTPBzf1CXF8RFWGnj/eeWis1q?=
 =?iso-8859-2?Q?oOY9xAOZ33dOJ2P1qezGE/7iuXsrIc3XYM5Eu5P5eyu/cNbkUImn/BtI0E?=
 =?iso-8859-2?Q?GOcyBHQ5JxSYDdrVM0sDv8AB5g9kKt//r1ZEwWnDLfUvVDjLkx1KAWrsTy?=
 =?iso-8859-2?Q?kFRxziFQJXgACyaKM/tdUPQuVlm5Zv7FAoG1nZHKva7J44Wjh3tpguNUOB?=
 =?iso-8859-2?Q?9o0FCQjAlclW/1L8ZdzdWGhF6g1PBakxwaVMuts/Iyb8ybnN2xDYHeChtt?=
 =?iso-8859-2?Q?LiPJ+RinCP129/IOHdatBViQ/XNgMZYbpCPXarlIlT9AIYwr4Uu5/jVyhR?=
 =?iso-8859-2?Q?2+zNCMHd5rQ9BR4P6EsR/K6vJrIXLnvjNwHP1XURzlqhL0EOUsG4G+zcVD?=
 =?iso-8859-2?Q?FD/mygtPCMur3GEq5cxpJqj0KT9w1f8ASAlvtu+jG9dBGTJAYN7juL7Xbf?=
 =?iso-8859-2?Q?0mWdf3ZXe86fe7S0HKA=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09c19ff-f450-4ba4-adcd-08dcb22783f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 12:43:16.6783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lG9Nea4yUbg9f0IzNN18aJW8vxsqjh+54G8BTgR3JAt9nA/KWp/t7dJDHJjcsTZ9NADWm0sMeY9yGEiu1U20jK3e/KsL1j9aZvpCKDN+BGMMkUN1schQ4qIaoMutzkqo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 27/66] lib/xe_eudebug: Add mutex for log events
> write
>=20
> From: Pawel Sikora <pawel.sikora@intel.com>
>=20
> Make 'xe_eudebug_event_log_write' to be thread-safe.
>=20
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 6 +++++-
>  lib/xe/xe_eudebug.h | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c index
> ed1e382c7..254a7261a 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -836,6 +836,7 @@ struct xe_eudebug_event_log
> *xe_eudebug_event_log_create(const char *name, unsig
>  	igt_assert(l->log);
>  	l->max_size =3D max_size;
>  	strncpy(l->name, name, sizeof(l->name) - 1);
> +	pthread_mutex_init(&l->lock, NULL);
>=20
>  	return l;
>  }
> @@ -848,6 +849,7 @@ struct xe_eudebug_event_log
> *xe_eudebug_event_log_create(const char *name, unsig
>   */
>  void xe_eudebug_event_log_destroy(struct xe_eudebug_event_log *l)  {
> +	pthread_mutex_destroy(&l->lock);
>  	free(l->log);
>  	free(l);
>  }
> @@ -857,7 +859,7 @@ void xe_eudebug_event_log_destroy(struct
> xe_eudebug_event_log *l)
>   * @l: event log pointer
>   * @e: event to be written to event log
>   *
> - * Writes event @e to the event log.
> + * Writes event @e to the event log, thread-safe.
>   */
>  void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct
> drm_xe_eudebug_event *e)  { @@ -868,6 +870,7 @@ void
> xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct
> drm_xe_eu
>  	 */
>  	igt_assert_lt(e->seqno, 10 * 1000 * 1000);
>=20
> +	pthread_mutex_lock(&l->lock);
>  	igt_assert_lt(l->head + e->len, l->max_size);
>  	memcpy(l->log + l->head, e, e->len);
>  	l->head +=3D e->len;
> @@ -876,6 +879,7 @@ void xe_eudebug_event_log_write(struct
> xe_eudebug_event_log *l, struct drm_xe_eu
>  	igt_info("%s: wrote %u bytes to eventlog, free %u bytes\n",
>  		 l->name, e->len, l->max_size - l->head);  #endif
> +	pthread_mutex_unlock(&l->lock);
>  }
>=20
>  /**
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h index
> 81c33417f..a499cc977 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -14,6 +14,7 @@ struct xe_eudebug_event_log {
>  	unsigned int head;
>  	unsigned int max_size;
>  	char name[80];
> +	pthread_mutex_t lock;
>  };
>=20
>  struct xe_eudebug_debugger {
> --
> 2.34.1

