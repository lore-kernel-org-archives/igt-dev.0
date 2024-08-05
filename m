Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086A6C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 06:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77B710E129;
	Mon,  5 Aug 2024 06:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PyFUhDSJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5031310E128
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 06:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722840521; x=1754376521;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=46ENazOzpyQlFTHW78ZSQvsfbCnnQH75MyxMpcpjE3Y=;
 b=PyFUhDSJq3ywhHtpBkzO56kWXzj18E1AFOuic4nZQ4nDMK9XOqasTRM2
 UVzwY/HKIIlTMBd0NiVvMxOVRfF3g2zr7sY08nAnIedd7DDGz86Tee5Vw
 9OyZ092Wwl8qwctdODxRMK6Eh8FQa73pC2au2g2/2ZzOCXhLi03DHbk7z
 G/7PaeSZXGUT3rFI0S8j36qZysmYQ4O7anOvLIXDEdy8sz1mPXGIAlWg1
 V6YdXqH5xhL8NETbOQZGwin4KHiC7VT3QuVFT4vnYyTiUMbEg2bEJ/O+Z
 FgXGT1eJQS9GktocQvWdXFoyUItE4LqxB0l96l/PaECh4scCx8VFJiczi A==;
X-CSE-ConnectionGUID: aNU0htyxRcG+3q3J+1BGnA==
X-CSE-MsgGUID: Xkh0guJHQHC4BU7AYkkUUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20665099"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="20665099"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 23:48:41 -0700
X-CSE-ConnectionGUID: opgXu3SXTeez2jJkRx6trA==
X-CSE-MsgGUID: sc9/7MqnQyWR5m8wvX8WOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="55995758"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Aug 2024 23:48:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 23:48:40 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 23:48:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 4 Aug 2024 23:48:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 4 Aug 2024 23:48:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJMOzw0IfFGwZ06wRfqlpStJT4BG5/8cgNB4G6LVT9zi/G3PoU3hiMZYm6rnaFKdQSfEccyqoCkHgJHjZiRcXDiERUqNa7ZQkByp+HGnTqHsXC3uL8Sfmxm3O189PzTDVTUFr4kneeddELXCQlkjLELTTVugkC5wxXM2NKtKTVLnhTuDjg3SUyw5aldiZQCR1ZOiTe2pqdubA2zTLunNTDg5Qpvsdq2voBuiIjiNxMkIUmBR7In053azjpuB+BT2pvVptTAqbjbWBNya5x70+ZE+ZjMIKfO3ZuHcuMXwlEHSjzn1p1CRsl8+rjNm0Nmjx4g+8Tda5397ViKHjG2pog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FxHufQ/YtzkNZd0zwSmz754jbB1COhSCRVijlmAs8I=;
 b=KP5A6ODEVAdppThV1A5RpEdKV9MMsVGpzue3IPZJjYyRx9arONlYW1wzskb4l3G4EtpqioRvDU1WVGopOw4bbfGtHW0yqW9toC3RxHKtZ//ccf2Cz6aqz48JI7sUTG+fx9169+fwkBpCPJwK1WQzQvpQ6XCMI+9Cy9Pg+DBsMlxLnnRZfOCvgtiBV6lcjaZny+orSXE/u/G+BfIDkVJyWRF6cWDJtNYDC6RDTDcYIfxLE6z4RYngxENLs6z/y4Q/x2DHVWOQdR3zwH7CXQnUbs0MMY8Ge7/ZekJ+O8IBEkDEVasjusnLHBX7HLWrLnxj/R0nesAuW4RnWor34FLe9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SJ1PR11MB6276.namprd11.prod.outlook.com (2603:10b6:a03:455::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Mon, 5 Aug 2024 06:48:37 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 06:48:36 +0000
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
Subject: RE: [PATCH i-g-t v2 57/66] lib/xe_eudebug: Expose xe_eudebug_connect
Thread-Topic: [PATCH i-g-t v2 57/66] lib/xe_eudebug: Expose xe_eudebug_connect
Thread-Index: AQHa4naQZvn9l7ehfUqrjUaGJ0q21LIYQfTg
Date: Mon, 5 Aug 2024 06:48:36 +0000
Message-ID: <DS0PR11MB726445749DF736F4BF5E63B1D9BE2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-58-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-58-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SJ1PR11MB6276:EE_
x-ms-office365-filtering-correlation-id: dfed9226-090e-46cd-8555-08dcb51aa17d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?K+Pre6vYakWhXMkPrtnfgW6xCB8uPAEOhS31o2aomuBZx4N6XRtGYHiXUz?=
 =?iso-8859-2?Q?SbqiAxvsw+4nSOY4xhJFCxPj4ySWX1l5w+UhKaJ4TbrX/14zgEq/8347yY?=
 =?iso-8859-2?Q?N4EHrU8GzNrz5SN58Ti83w+il/zFUM8NvQIIii27uUpSzFBGlSmZAPDBvE?=
 =?iso-8859-2?Q?M6ii6K8/m/UlsiBhnFG1m2rR1yHz3TMZMJFli96oIl8FeI6Yymhd3olOD8?=
 =?iso-8859-2?Q?vM+QGodxQhNrN12Ss9hQrqymK/BAF1I0hqh9hQXzyCzu64hTUF7hlEKzsL?=
 =?iso-8859-2?Q?xo0lrgd51NtMbVSobyZvf2nWSaybomP+1GJ5UPn7p9jAqYyD9oA5B3Pu8G?=
 =?iso-8859-2?Q?rBuzUzk7gwlUnioNCFCQsb6ije7rN81OB6nmbxORgEpGvV8oqMw3S4hxMD?=
 =?iso-8859-2?Q?+VUFVUBALFCfOoC4wFumNU5OzioN6jQ/mKVjV30hkLjpfI5dXlj1zrCNer?=
 =?iso-8859-2?Q?0sj67eQKhpm7JrUkqBS/XvE9XcwKdYEL4WFrlWL0wI3Q/kLhzMz5j0TpGN?=
 =?iso-8859-2?Q?tLZtskO89uGG85YZIgIBmbuSl4Ff58Ai4kvKQ1oOQCT7HlHYLggEIgTaDe?=
 =?iso-8859-2?Q?DX8/8dgWvAtW5Oit5MwtKJGT/9n8fwK84z+i36YROULMeqRo8cb3xAwIaU?=
 =?iso-8859-2?Q?UYMJ321lkayqD4hP8wvqaIUBJOiwyFpevYl3LOydztMgNO+flzY3rTf98s?=
 =?iso-8859-2?Q?rColLO+CPDq6xY6t2yPsIwSDRzfkAZdMfCLTu/gIEDseKU/46emV52HKV5?=
 =?iso-8859-2?Q?9uKISaNEtrDrptnmttjFVh2O9WfUt7L/AeHvv/NF8mpr1D0UMV4+KP5hUi?=
 =?iso-8859-2?Q?lwRh6TZOWxWO8KjJ6/eu4kY1EiruWqjtAxIiWzmuIIyPrsj09sNGfawVxt?=
 =?iso-8859-2?Q?L8qahjRV6SA7G3ONiTb3VwwVrYXvrFHmGo4y2y/ZRF95CEyqCIx/+HIHnN?=
 =?iso-8859-2?Q?RFLZP9Kjaa7HrRG579rQkE9nggMYUgNpLBQbWUKCxSC5TgFJlr4wb9fFIn?=
 =?iso-8859-2?Q?lWMF0K975lxNBu/q3JhITbiOB/DZ45oSML341UEmGkTxvOc/JaXg/crfGt?=
 =?iso-8859-2?Q?ZLhZOkcbz6/QBJoxfp4GZBck/5MxtDwmITgK9yCwXH7QMsYPnnywYLZemc?=
 =?iso-8859-2?Q?WEwjHhbYxJt7ozaJBSOnUQtLf7H/7bbIKtCea0gjqugDi/t3neP/6VjEUZ?=
 =?iso-8859-2?Q?jhZHcqJ+M+4BC9jzbmt/MMlQJIzGw5yYs9mW8tCvyZByfmKegEJUgOOrmV?=
 =?iso-8859-2?Q?+a0Oq+CEsYx1QX+axgE4HGhnEUFJSVBOEcI6+uDTcxREdLVA3sQjvuc+dt?=
 =?iso-8859-2?Q?fQHVmgR2bqi43kEQspYpXicUBXTbvu/I4L4sFzwEfFOb/QVVcvEUTBZwPf?=
 =?iso-8859-2?Q?ObN8D+7z6Ho5D0h8eu7z296JK8H0ohISAxUlyHmDURi0OZxuDc3J7OSuxo?=
 =?iso-8859-2?Q?M2JLcmHb2GP6LunugHt77JCPuBfNEi7LLOFgBQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?4PzyENz9dZBm6a8wvOEf0nhSZANizKP0Ngv30/6hLxXGeuJsntI37x+zOa?=
 =?iso-8859-2?Q?G8C9o35bxPWBdXg1elKo4SxumLDF16fKU8HI+AoN650GAQLk9HMDUJJ4IS?=
 =?iso-8859-2?Q?sQqwbj15nrF0KuTibtxqW44niSyFIV5rG3E9wxrVnXy9iwZP3JAb8oGES4?=
 =?iso-8859-2?Q?POlv3is4xyAqbPvbpgAqNlTqFZh6Oel00uTrfspkji+YCo0o3vUZ7OErCf?=
 =?iso-8859-2?Q?josFGM1tIoy9uOC89N3NqiVSwDGkARlzTtbpUGnZhPUy9x2TNBJ9f/Pwun?=
 =?iso-8859-2?Q?yShN91fnb0jB8PgXdHPQlNjRcGDri6yvp7m3AaO9yzDsHHJdFzUuw05qd5?=
 =?iso-8859-2?Q?T0m6qXalUckQClJp36g9oWJwzhGphPZE3oiuG/2wATMuB70u3q+fQntG9c?=
 =?iso-8859-2?Q?IxfTm5rHVMl/yT8Ss7UeLAwSv9qmhaTUB5G5NH42HUa1qoFb4X6S05xk3S?=
 =?iso-8859-2?Q?ysMhp6c3Y0LrOdZjp8SRxxYG5jHNsHb6ByPNGzEIvjIAG0dvwLgcBiXLiM?=
 =?iso-8859-2?Q?KREbh1YohP4pjYWWX7NrUsSC3Lx4lfEeQ7/aAm7uUHlMecu2cUXx/nyoGX?=
 =?iso-8859-2?Q?5clv0ksIuZ0SjlsYZVhjQ6oNeF9t3lNvbgOt5VKwssiOAMImYw4AV3REwv?=
 =?iso-8859-2?Q?q/wsr7r4Ssx2hBUqzwbuou6lyBHg0LBZZlNuYxgCHcI95N9x8eCD40yPwp?=
 =?iso-8859-2?Q?ZKBecSgMHcZIzM8nl1q5SZVYObkQCQi6x3Xga4Jg1fbomFDfrgTmzNa81W?=
 =?iso-8859-2?Q?W4hC2zcP6mjqbppz/TVeTDph1PfTCKL4CZLAoqdMsNE3ohKuUo95gkWVhD?=
 =?iso-8859-2?Q?0fzKhj6BSs2SUTdcdvpVyktLr6wUF/BUDNhGA4p+YsL0DEba6N0GNOfUL1?=
 =?iso-8859-2?Q?I6Z9WgRMQgkatL3/2XSoZcfD+WA2ovhy+9hSbjiR03hsXnguafwUoarTgb?=
 =?iso-8859-2?Q?kILmFlqn08RIoAVmCO6tZv8546E8OAdbREfeFimCqLkQ+2bOuk2K7EC7Yz?=
 =?iso-8859-2?Q?bpaZl9WiVVG461dVgREYNgwAVvABeBNMGnabPx3nPVPVraUq/1dTVHAr82?=
 =?iso-8859-2?Q?vH3tlMQsl4zQKIXSOB2D4h3FG5DADxDdtwGMaD7Jv7AJSnY6ZDwyFMsKgV?=
 =?iso-8859-2?Q?30Wg0+xIgZSz081st5IkTBxKotTypNOxbXISeqoWExQLZAmwZ60Hyh4fox?=
 =?iso-8859-2?Q?ieYxI85rZR8+IR7XiqxOckWaPdO+FAB/8R8J8QIZExbJIVIPffzkWxHBcG?=
 =?iso-8859-2?Q?H2Tdik3pRUNwB/fgBWdj7oAFTVcstYfi1HBa+aNLtd9Xbd7srOM+Ij6jgJ?=
 =?iso-8859-2?Q?PWB0xDPlH71Hs7GFTzqNJNOVIqsGJcSHBkCGUVVTI+CZOXTSE1OH2IO58o?=
 =?iso-8859-2?Q?MsuoGYY9erF6MFtnRoUU9JidczG04QMgQ8jIgCSYP0xv/VAvG+IFt3iVfD?=
 =?iso-8859-2?Q?tShlcn4fyzjCTm6weBvHhp+X5Tc89Pu7tzS1zMyrmv32UJu0BDphFQLI6Z?=
 =?iso-8859-2?Q?TdzeZfVItG0WqayAluadtLpr2tvsNIBXMAskaLes1cdJYaNCmDSNI+g1sw?=
 =?iso-8859-2?Q?PQYTE0c3fHYXGIWWQlvqswmcYQdYQlgbbnfT/ZivTBRp1v7St1G8xkJbFA?=
 =?iso-8859-2?Q?Y5RxJTCo4lcCplqK4tqMFFdGQ4Ry3kIHyPNfCc5YZZHH9/pMilGLi5Zw?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfed9226-090e-46cd-8555-08dcb51aa17d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 06:48:36.2876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ro8JFQj4N1n4Ah15JcM85BK1U4Tng7vPAb0Cg5zDHaFOdIw3h10M6FP5UKHrvlYPbtECmtVJaXZTSdN2ZN9ei6W+tY7EsFvEs7TRGKwjh8hT9/FK+qmr+zCHyp9oOhTS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6276
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
> Subject: [PATCH i-g-t v2 57/66] lib/xe_eudebug: Expose xe_eudebug_connect
>=20
> From: Karolina Stolarek <karolina.stolarek@intel.com>
>=20
> Expose xe_eudebug_connect library function to use it directly in tests.
>=20
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 30 ++++++++++++++++++++----------
> lib/xe/xe_eudebug.h |  1 +
>  2 files changed, 21 insertions(+), 10 deletions(-)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c index
> 254a7261a..c9f0c63f1 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -329,16 +329,6 @@ static int __xe_eudebug_connect(int fd, pid_t pid,
> uint32_t flags, uint64_t even
>  	return debugfd;
>  }
>=20
> -static int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags) -{
> -	int ret;
> -	uint64_t events =3D 0; /* events filtering not supported yet! */
> -
> -	ret =3D __xe_eudebug_connect(fd, pid, flags, events);
> -
> -	return ret;
> -}
> -
>  static void event_log_write_to_fd(struct xe_eudebug_event_log *l, int fd=
)  {
>  	igt_assert_eq(write(fd, &l->head, sizeof(l->head)), @@ -816,6
> +806,26 @@ static void event_log_sort(struct xe_eudebug_event_log *l)
>  	xe_eudebug_event_log_destroy(tmp);
>  }
>=20
> +/**
> + * xe_eudebug_connect:
> + * @fd: Xe file descriptor
> + * @pid: client PID
> + * @flags: connection flags
> + *
> + * Opens the xe eu debugger connection to the process described by @pid
> + *
> + * Returns: 0 if the debugger was successfully attached, -errno otherwis=
e.
> + */
> +int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags) {
> +	int ret;
> +	uint64_t events =3D 0; /* events filtering not supported yet! */
> +
> +	ret =3D __xe_eudebug_connect(fd, pid, flags, events);
> +
> +	return ret;
> +}
> +
>  /**
>   * xe_eudebug_event_log_create:
>   * @name: event log identifier
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h index
> a499cc977..4654b462f 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -112,6 +112,7 @@ typedef void (*xe_eudebug_trigger_fn)(struct
> xe_eudebug_debugger *,
>  #define XE_EUDEUBG_FILTER_ALL
> 	GENMASK(DRM_XE_EUDEBUG_EVENT_MAX_EVENT, 0)
>  #define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)	((1UL << _e) & _f)
>=20
> +int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags);
>  const char *xe_eudebug_event_to_str(struct drm_xe_eudebug_event *e,
> char *buf, size_t len);  struct drm_xe_eudebug_event *
> xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t
> seqno);
> --
> 2.34.1

