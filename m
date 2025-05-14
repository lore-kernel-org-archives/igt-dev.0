Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CC8C3ABC5
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 05:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7601110E0B0;
	Wed, 14 May 2025 05:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXz4Vi/Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A9210E0B0
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 05:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747200110; x=1778736110;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QBTbSFOLJIsQ4OMhPhxmbYWikHjmPopVlN/thWhVHTg=;
 b=FXz4Vi/Q9H++rt+ODpgQ28Ylu2rfJM3LCVO52iLNqyONOWeefi1IEH6X
 OR0QQDGEQAzh8PsiazOZDad+iPXmrbBt83xq1BJyTQn1lmX6g2LRQI5Q6
 Go9YJoYwB63JmtXAFwPlsyIAlCcSu5PHZsS70+69VxPImOOdWfoRvy9y6
 pwBfXIIz/wWyoEXvLLhOhuPrY66Ja1vVWjYnhbHIiTWSpwr+ZDiYl8MCX
 2M4B/gxi/wnaC7aB7F6Qffrk3+T7zsf7Is5QJQQqWwt79BIQTDu3wf8SY
 m3wzQ3yuW3ITwpxBtLKE1Ydc2Q5XthJPdZYgwuKrOhPVqKLSWJ1zgouPq g==;
X-CSE-ConnectionGUID: I+nqqpOVSPelrIqKTznYow==
X-CSE-MsgGUID: yFkrUJkpQ7G1lziRSKFYcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60087249"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="60087249"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 22:21:49 -0700
X-CSE-ConnectionGUID: /G6WrAHGTpiZGoGOTaYifQ==
X-CSE-MsgGUID: oHN7zyV2SE62XXXeELB7qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="169027826"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 22:21:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 22:21:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 22:21:48 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 22:21:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeIJ6GXH1FkaNPq1ZaxJ2/Z6qkblvWPs7H7Pa7od1t83y6xYJkGOyAof2xMeNaZ6O+w0+ZtI68IaPt4ylb8VS/NTE1R5AoZ5Lnb/4Jr79PrS9KZVB5pycOpFg3CUKcieMFIsqqN1bNDeDWV1Uerjl9yMf+WR5fZsGoB3DS7UrvMhFLa0bfFUqkRf2tYz79wkQT1K+jOul/jP1HaDNSINZhmGQU6kIs7aLTp6sjVRstD2PNrREWqRfr3u96nfH6NHuJ15n4yBUjth87v2yKxoQRROAd+LvvTx9EFGIlYvr3sLJfMQvbTXVLPub6de5oTG4vr9Sq0T270Nkjmd7tl5Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tL90oAzuR0AmWfOy2OThLki7a7hvbb+Uv0iXDbuZiq0=;
 b=XrWN1YH7sKBJUFOj++c5c1SgdtUddbw35+IuTBnzUaXqY3VekQH2Ivp8rMvBXBLDviYdkN44Wx1s/D+rHEgMEL8zRyGW6XNbMyfjMk57Own/yYZGyrYw+N8mxNBXBqA4N7kTJhNtC214TlWxuNTDOYFHyhMmhq4KPQ0EmgY3E1rpXa7fPJx1rbD4CQk+7Sn9cYdDSM6mK4Sn8aaXSsImwSTwUG6FEdb7tZleFfJYmJfcjns4Ha+hNWXxWpvGrYM/6cP0T095zi+hFPDk1x3i3CiYgpsDK5Bt35SRDlKtqwFL1qbQdk8wTKahEtZc1EMkcueREA8Eh+ta8WTlrnStIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5754.namprd11.prod.outlook.com (2603:10b6:610:ec::21)
 by DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 05:21:43 +0000
Received: from CH0PR11MB5754.namprd11.prod.outlook.com
 ([fe80::1701:75e9:8a93:efbe]) by CH0PR11MB5754.namprd11.prod.outlook.com
 ([fe80::1701:75e9:8a93:efbe%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 05:21:43 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the
 prefetch ranges
Thread-Topic: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the
 prefetch ranges
Thread-Index: AQHbxCmA7TKXxlJe6UK5kV9kVt3bC7PRKO6AgABuPNA=
Date: Wed, 14 May 2025 05:21:43 +0000
Message-ID: <CH0PR11MB5754AB7FDBEFA9178DBF4B12D091A@CH0PR11MB5754.namprd11.prod.outlook.com>
References: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
 <20250513170711.14518-4-sai.gowtham.ch@intel.com>
 <CH0PR11MB544416917F8F42EA25923B61E596A@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB544416917F8F42EA25923B61E596A@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5754:EE_|DM6PR11MB4705:EE_
x-ms-office365-filtering-correlation-id: 59ff7183-2aa7-4acc-cd28-08dd92a736ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?7Qwidm8tSLfWLJZkGLEF5xocaAxrYzInIPyq4yzxpQtE8JBs1kM9QDtJMhn5?=
 =?us-ascii?Q?oqHIKSKwr1HDLKXPMhuSjCH0dSN6Op4zeEfWPjC67DHCKe0i58YqkxJ6AbYH?=
 =?us-ascii?Q?Sf17ykMnPtkGmNjUAff+5WzOOnYb17K/H+L9AmgeiqFiFOxM6/9Taub9fQ+u?=
 =?us-ascii?Q?tuKwydd/uRoAVIkg43Co62imxhphW1O17PQI6+lqu7LV5rNdUOjF0Dmf7cm4?=
 =?us-ascii?Q?0gOgGJQKZJ8hvc4MJhfjfJVqcJZFeq1dHkC3zObUTeMWy4DU0dVT9Q9S4n9F?=
 =?us-ascii?Q?U1zq/CZgdn9SxnJKxWsreeAPlZPGVRROtQgB1gUQFBpyadAbmJAgDwOApwzr?=
 =?us-ascii?Q?l4KakAjL9afewkXhJGPcK/VSHjkl3lQ73Xm5M3niKqS33h07sOGC0WpkrkBc?=
 =?us-ascii?Q?fbqBaTvAmP3t72rWptbDHFMlfBZ17LfvwYxsPzsrJ7ufKHovzXk5dED7Yosw?=
 =?us-ascii?Q?RY6D6o66tfAt2wGLXfiAkka8SYGxnHzZpyyQ1b4AU9+fQR3z0vWaVS9CnxOZ?=
 =?us-ascii?Q?eugDY4za2PNq3prtNux+MRxODDOY1duSbBJjl4PiKvQCuBaVMl9fmVWWZP1Y?=
 =?us-ascii?Q?J8WJ1pblS5qHjtWktsJe1L11CnKNU46siw+OPp63JTQaUKoB28aVjkreLMlx?=
 =?us-ascii?Q?zvefhc1qZCmfCXoJ5zgOghNbxs516M5CgpwL5SVBNNzhwyJwtvriQh+TX7AC?=
 =?us-ascii?Q?Z65kyngB589r1YAfLzvEBVODO8jJzUww9pY3Hh9atJwBK/bJRp/OqvrDGksG?=
 =?us-ascii?Q?LLI0tX0gaChlGAoUts5Xg1RmfaKDxDDN/RlNDx3LgymBDHkzvgfgoLmo7K/H?=
 =?us-ascii?Q?+f1Rv/ahwQSdEDtj04pdNd9QTaPDM/QPZTgKfVRM37eQ6fjfgFqRk/heLDTd?=
 =?us-ascii?Q?7e/uIL2TBhfrLoIREt7DsToqdIJ7Gg4M+yXZrm163Vj9FG/YF/2pCbunxGP4?=
 =?us-ascii?Q?AWqWm0dk+VAxEMvXDpejpZYKRmLrMiGT1QIVp8BEF3/2oiJV2BZyLK/JGjKI?=
 =?us-ascii?Q?fWucrS4QU90oMIRyE9oTWnNTwDG+9uDvNt9KrYbKkkdih6jjv5eQFw0ZdjCG?=
 =?us-ascii?Q?/HWwtBRYxvna/drwcTx7vzeU50JECegvonz+izy7x7HShj3DIUqAGrzrD7WF?=
 =?us-ascii?Q?idBbKm1Lwp+KtwYTsFUf0897veUW5ZDuHGUS7/H2BZonZys8smxXuqZUZLtr?=
 =?us-ascii?Q?ujnRMc8DNGrxvdsyERpGHmJW4WAbRcFZeiE5fmb4QMmGlQLLT0JuNFSWqGQj?=
 =?us-ascii?Q?hJ0dZ7NY+1k74e27QP7DWZxUNK1NsbGFdTWurQKuysaFRDjxYpbsddPqHQ4T?=
 =?us-ascii?Q?1teSs65Hi3tzYX2/08Hx27v82AY7XRRYiYyxzbxHnwYJkQb3pOZpaEAs2mHU?=
 =?us-ascii?Q?/fSykQr+l9cGvBIjIoR5K5Tk+HsB6WcOZTDL0F3t5wCTsIOtWFT9z9uz/Xc2?=
 =?us-ascii?Q?75QFIjW9AdIPlmABH/qFT+sqqXSYTRkcLHczRRrZR+7+QNPiGuTJaTc2XHB1?=
 =?us-ascii?Q?s8YWF+81zECA48E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5754.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4hWmGOlyPeerpfd54vqhOT4yH7zV4qIRZJ1hQnBGOjW1pn9DMrWlq47zFGiF?=
 =?us-ascii?Q?hzRRuRo9axXd+LMEygsC93AFfa1uyegUyD9DSYVXtz7K6rnscOWgvlpoAzen?=
 =?us-ascii?Q?EVvN9M26MJKuL1cRuAeLIfSrakzCtTyO/WyImy0rco56aq0IYMEr6l4wZcas?=
 =?us-ascii?Q?ZM8uuMLHXO6nynVNqbHaDUc7unQ94hXUIfhCygoXXAKDFHOs3CS4QdnuvG3N?=
 =?us-ascii?Q?CObcBvhCqXfzZcJWIqYjbmgufkOEHby0l3BIDn+7SnbJvnV0tKN81Juqbg02?=
 =?us-ascii?Q?Eq07rXoLjNDNFOrho4y+DqSxGYqFHrGeMnEbADi6/5JfTXMW8fWZ3Aho/ZR8?=
 =?us-ascii?Q?wn5samGOr67cLRQw4FQyuhPZI4hMcTXy8tMWtAUY/0dtsrfMg2AmiN/iUSS3?=
 =?us-ascii?Q?ZFCTh6YkSbg456YmWht9Ap/nO4IZsSmEmp7xZoHu+RUb6lL4EGx6/aI4h55t?=
 =?us-ascii?Q?X+mTp4J5thICflBggBifFTGV3GGm6JmXTskC9kwJMa7+13yZKqCRWiPZ7o5G?=
 =?us-ascii?Q?2k5EOKyzIVkeSVthLrl9U2X0k6Ih+W7DjEWUx4tP8PlQp7yJcsFRTDyzFGuW?=
 =?us-ascii?Q?rYaYTP7ZJ7HN7048Q0yom9NjsuZYKBaeeMDfl8haajTUUITSQtQDRxZtcXyH?=
 =?us-ascii?Q?5LlzlajzaROfKLu1dZWI8Z61O5gVWO/N+tifRgMtyOSm1HPqyowUVM2S2WEP?=
 =?us-ascii?Q?lSDLMAWQfim2fs9gOjeoHhnUXjFKbatGaiIZ9mqRkk8UNQk2pJ1wUTFpIVAL?=
 =?us-ascii?Q?kkUuTHKn++AeGPpfyD/1dw9QUAOF8IR3NDHcYUpOulhWfPAUBY/VtlfpLV8C?=
 =?us-ascii?Q?r98WxA98EBKSuemoefXfSXH00kmPee3M0445LhRGDKN90oy5xz439U0TQpeN?=
 =?us-ascii?Q?OfNh5TJMOfMEgM603MUKNYcJVED1KAY6p3Jo9jzWUgsfRNLwVr7x2c/X9Oq3?=
 =?us-ascii?Q?GRwxkUeZA4NFMGwKXFK9xhWEdx37MVpWK0iAr/ROlH7wvDZ4w52Kd54eHHt+?=
 =?us-ascii?Q?JG4FBY3zV5b35IhMqVwEdroo9Od3e1SwLhMW7SxDv1fv5kAHsYVfq9VJpW5R?=
 =?us-ascii?Q?F8l7uB/W0nIbJkiEcL7SmmiS4yVVnlb7Hq3NSU5GiV1+JIYNw0zi2S+McdgN?=
 =?us-ascii?Q?u4/FP6Kjrm5EPWzyrjP+PXGhdlgICW7VA7gVUXZvAN49doqDBAFc8ss4OI0V?=
 =?us-ascii?Q?HQtDMdyx2l5zb6iEfJ0YuKBSJ6kFo0bEeN9AXkep2IDvZL/wZDdHTNTiFPOW?=
 =?us-ascii?Q?fWuRY7DURcA0PeaK65ikAg+8RXt5nDMX/LA15cH/cSJGY4og0vfYpwMVWZNs?=
 =?us-ascii?Q?5xGp5cmVVDaZ1urAD9ziBNcUafi0IQzHN3fVSrUcDkGOtH0eG/zIno9gnxAj?=
 =?us-ascii?Q?jt/oEA25MBNtTQPe4vWPe3ivAXdoQ/Mo+5xnH/LitlvQhQaGeoOwSDS/ClJW?=
 =?us-ascii?Q?UdVXSgfF1Ac7eMFCqTpcNwYlaJVSnGOzmJq0eTJYk2CxPoPXjqZGqxsK5rDD?=
 =?us-ascii?Q?v3H7cqH5wwXKOLK6YwdYAp9C9A/1kr2q04ShQlHuU2Luj7cLAmviVF6n6veM?=
 =?us-ascii?Q?YjmF4ZRYE7nMGZ6WN7kp9qf84y7WP33l1CpvQwtP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5754.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ff7183-2aa7-4acc-cd28-08dd92a736ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 05:21:43.4938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dAT20VuIXNlhJLSZzHPLj4SMykaH+5JOPzsf8pJHP1YviWxVI3Lv+4kxSmmqGHrkqjazGGuGGwMDtFAwXO7XDrDhirZDB0Gf86Hjl81qRdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
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



>-----Original Message-----
>From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
>Sent: Wednesday, May 14, 2025 4:15 AM
>To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; igt-dev@lists.freedesktop.=
org;
>Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Ghimiray, Himal Prasad
><himal.prasad.ghimiray@intel.com>; Brost, Matthew <matthew.brost@intel.com=
>
>Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>
>Subject: RE: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the
>prefetch ranges
>
>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>sai.gowtham.ch@intel.com
>Sent: Tuesday, May 13, 2025 10:07 AM
>To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham <sai.gowtham.ch@intel.c=
om>;
>Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthew
><matthew.brost@intel.com>
>Subject: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the pref=
etch
>ranges
>>
>> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>
>> Test rebinds the prefetch ranges to check the ideal behaviour of
>> prefetch mechanisim,
>
>s/mechanism/mechanism
>
>> expecting address ranges in the corresponding mem regions has to be
>> created again and use those address ranges to submit workloads.
>>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> ---
>>  tests/intel/xe_exec_system_allocator.c | 47
>> +++++++++++++++++++++++---
>>  1 file changed, 42 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_system_allocator.c
>> b/tests/intel/xe_exec_system_allocator.c
>> index c3f0e61f3..94907847c 100644
>> --- a/tests/intel/xe_exec_system_allocator.c
>> +++ b/tests/intel/xe_exec_system_allocator.c
>> @@ -484,6 +484,24 @@ static void test_basic(int fd, struct
>drm_xe_engine_class_instance *eci,
>>   * Description: Prefetch of mutliple ranges within arg[1] size and chec=
k if
>multiple ranges are created
>>   * Test category: functionality test
>>   *
>> + * SUBTEST: bind-vram-%s
>> + * Description: Validate prefetch-smem of size arg[1] by rebinding them=
 with
>prefetch-vram to
>> + * 		check the behaviour, ideal behaviour is to migrate ranges
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: bind-smem-%s
>> + * Description: Validate prefetch-smem of size arg[1] by rebinding them=
 with
>prefetch-vram
>> + * 		check the behaviour, ideal behaviour is to migrate ranges
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: multi-range-bind-vram-%s
>> + * Description: Validate multiple ranges of size arg[1] by binding
>> + them with multiple ranges at vram
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: multi-range-bind-smem-%s
>> + * Description: Validate multiple ranges of size arg[1] by binding
>> + them with multiple ranges at smem
>> + * Test category: functionality test
>> + *
>>   * arg[1]:
>>   *
>>   * @SZ_4K: SZ_4K
>> @@ -492,7 +510,7 @@ static void test_basic(int fd, struct
>drm_xe_engine_class_instance *eci,
>>   */
>>  #define MAX_BATCH_DWORDS 16
>>  static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
>> -		     size_t bo_size, unsigned int flags, int num_dwords)
>> +		     size_t bo_size, unsigned int flags, int num_dwords, bool bind)
>
>Rather than adding bind as a boolean flag here, maybe we should add a new =
flag
>that performs the same job?  Since we're borrowing the many_alloc flags se=
ction
>anyways, it could maybe be:
>
>"""
>#define VRAM		(0x1 << 5)
>#define BIND		(0x1 << 6)
>"""
>
>Then, below, instead of checking for the boolean value, we check if "flag =
& BIND".
>
>Combine this with the advice I gave for the previous patch, and your mode =
array
>would looks something like:
>
>"""
>	const struct mode {
>		const char *name;
>		unsigned int flags;
>		size_t size;
>	} mode[] =3D {
>		{"smem-SZ_4K", 0, SZ_4K},
>		{"smem-SZ_64K", 0, SZ_64K},
>		{"smem-SZ_2M", 0, SZ_2M},
>		{"vram-SZ_4K", VRAM, SZ_4K},
>		{"vram-SZ_64K", VRAM, SZ_64K},
>		{"vram-SZ_2M", VRAM, SZ_2M},
>		{"bind-smem-SZ_4K", BIND, SZ_4K},
>		{"bind-smem-SZ_64K", BIND, SZ_64K},
>		{"bind-smem-SZ_2M", BIND, SZ_2M},
>		{"bind-vram-SZ_4K", VRAM | BIND, SZ_4K},
>		{"bind-vram-SZ_64K", VRAM | BIND, SZ_64K},
>		{"bind-vram-SZ_2M", VRAM | BIND, SZ_2M},
>		{ NULL },
>	};
>"""
>The nice thing about this approach is that it doesn't necessitate changing=
 the
>below list of subtests in the "for each mode" loop, as long as you don't m=
ind
>changing the name of the bind subtests from "bind-.*" to "prefetch-bind-.*=
".
>-Jonathan Cavitt
>
Thanks for your review comments, Sure will adapt this test to use Bind as a=
 flag.=20
"prefetch-bind-*" sounds much better.=20

Thanks,
Gowtham
>>  {
>>  	struct batch_data *data;
>>  	uint64_t target_addr;
>> @@ -542,6 +560,13 @@ static void prefetch(int fd, struct
>drm_xe_engine_class_instance *eci,
>>  	sync[0].addr =3D to_user_pointer(exec_ufence);
>>  	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRA=
M ?
>1 : 0);
>>  	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0,
>NSEC_PER_SEC);
>> +	if (bind) {
>> +		exec_ufence[0] =3D 0;
>> +		sync[0].addr =3D to_user_pointer(exec_ufence);
>> +		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags &
>VRAM ? 0 : 1);
>> +		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0,
>NSEC_PER_SEC);
>> +		exec_ufence[0] =3D 0;
>> +	}
>>  	exec.exec_queue_id =3D exec_queues;
>>
>>  	for (int i =3D 0; i < num_dwords; i++) { @@ -2045,16 +2070,28 @@
>> igt_main
>>
>>  	for (m =3D mode; m->name; m++) {
>>		  igt_subtest_f("prefetch-smem-%s", m->name)
>> -		        prefetch(fd, &engine->instance, m->size, 0, 1);
>> +		        prefetch(fd, &engine->instance, m->size, 0, 1, 0);
>>
>>		  igt_subtest_f("prefetch-vram-%s", m->name)
>> -		        prefetch(fd, &engine->instance, m->size, VRAM, 1);
>> +		        prefetch(fd, &engine->instance, m->size, VRAM, 1, 0);
>>
>>		  igt_subtest_f("multi-range-smem-%s", m->name)
>> -		        prefetch(fd, &engine->instance, m->size, 0, 10);
>> +		        prefetch(fd, &engine->instance, m->size, 0, 10, 0);
>>
>>		  igt_subtest_f("multi-range-vram-%s", m->name)
>> -		        prefetch(fd, &engine->instance, m->size, VRAM, 10);
>> +		        prefetch(fd, &engine->instance, m->size, VRAM, 10, 0);
>> +
>> +		igt_subtest_f("bind-vram-%s", m->name)
>> +			prefetch(fd, &engine->instance, m->size, 0, 1, 1);
>> +
>> +		igt_subtest_f("bind-smem-%s", m->name)
>> +			prefetch(fd, &engine->instance, m->size, VRAM, 1, 1);
>> +
>> +		igt_subtest_f("multi-range-bind-vram-%s", m->name)
>> +			prefetch(fd, &engine->instance, m->size, 0, 10, 1);
>> +
>> +		igt_subtest_f("multi-range-bind-smem-%s", m->name)
>> +			prefetch(fd, &engine->instance, m->size, VRAM, 10, 1);
>>          }
>>
>>  	igt_fixture {
>> --
>> 2.34.1
>>
>>
