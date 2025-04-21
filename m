Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6298C369AB
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 07:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5E110E033;
	Mon, 21 Apr 2025 07:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7lP1eIT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1A410E033
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Apr 2025 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745220756; x=1776756756;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kwx9Vd0vD4r4jaq4s8M9sTvMP/e2REbXpbsHsrRUcpI=;
 b=E7lP1eITzAtdn9ELWQBjUeSK+CfIPzA4k+v2cxXdqQeuB4nj8vABMU2/
 GOHekw8ohsBhK6YJxWD+WIy3i95aGslxk67FQDjOXZj0END+Wbo5VGupi
 mOdAtiDRSYN7fLUh5B1LGpkICZpRS6DUL6MFf67vqdaJIs/UdWuvyD4vV
 UWpHgJdOQP8bBhwfgxiQba/MfhHilnqtwd0qb7QDSG8ZWPzmCuYI6Kli6
 NCnUS7TIEyzGqitbXPjRcnQOEm+qO7m7C150G0Q823dvBwSEcrKTgCCCa
 Jg9Zjb1+23jUgOWP6eAgt10eWWGkNGeR6hCz7q260DoM5aynj4dg3Otup A==;
X-CSE-ConnectionGUID: fGJQD9wJSTe9tEoCXJ74Iw==
X-CSE-MsgGUID: uTTTA308QfaLDxWk3UK0wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46880374"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="46880374"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 00:32:36 -0700
X-CSE-ConnectionGUID: fFB5g9IyS7+xqwlSfenFrQ==
X-CSE-MsgGUID: EAPvq8ojRAm1A+yV0mHTdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="131666293"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 00:32:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 00:32:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 00:32:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 00:32:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zW5UohOcWB00++6NSN3DfopKknGPskyWobBsK2ET3c2/Ru4eYRmYe8VLQ2YLjSOQbPYGTy4OwEinymk7YIF4AUBJ7X7xGSS1uBc9OTYlT8KNTNvlBnntT8BcGWGA9JhUc5xx2gmlZGzgcT52o7L9QJ/v4wYySplQArmUTbB632bDKfLyg+CdB644UEklbi3vXolooWW+hgzsrzdwDkAvTnzamisGyRIHAOo5sGG1x6xihc/RzschldQ3XMNxhDRFDJpCLVlrlGhjyOcdAjUbFbEj3gX9sPQO8bSixJ0jmKVKB23lWs9goaUB2+Hx1zNNikXPhW40ZMF8R38KbyoUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASm0l84p8c/pI4wMC3zNsWQjH+308dzH2nCTuuMYSSQ=;
 b=rTr/SPa2Qxtfv+ib0UsV68JZaVWH1Hj4fDvxEqM1zOQ6qe+w9bSBvA9TzDOBznauJ01NopWg9OPtaRi3JW/0AkRx8VZ/8Fbn4d+Wte2v98HQe1PS7RvlNyDspEujCDrjAfpsFVpTqvUiFmnM+XHGWMu1ISFDkYDgUN1UUj6IbrXX6pR5bmwkg/nmYAEmLeThkGU6Ppsdtab2O1pLwYGpf41Fp2/V9OQKTeMD+7i8SX7O1nBPyMZ+4yNmF7ucxgfnBTOwRYSlasKdxT4cw/zzHtwFw6+eoKOjczKBBe9HJVCbHrstkk4O3MeLjIvbJUidzDZoJrAsFv+C/kK7Vy367Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA1PR11MB8245.namprd11.prod.outlook.com (2603:10b6:208:448::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 07:32:31 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%7]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 07:32:31 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v6 1/3] tests/intel/xe_fault_injection: Make
 setup_injection_fault() programmable.
Thread-Topic: [PATCH i-g-t v6 1/3] tests/intel/xe_fault_injection: Make
 setup_injection_fault() programmable.
Thread-Index: AQHbrd4Iws6AnphLHEqiTOivaoH48LOkyk8AgAj47rA=
Date: Mon, 21 Apr 2025 07:32:31 +0000
Message-ID: <LV3PR11MB86957B57136A91ACE9C5FEBCF9B82@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250415082711.4831-1-satyanarayana.k.v.p@intel.com>
 <20250415082711.4831-2-satyanarayana.k.v.p@intel.com>
 <CH0PR11MB5444F67498BB1E985A3FBB65E5B22@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB5444F67498BB1E985A3FBB65E5B22@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|IA1PR11MB8245:EE_
x-ms-office365-filtering-correlation-id: 2c9622f2-7ba2-4b38-c650-08dd80a6acf9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?eh3FRQLdLEWfKkM4/L+5IwgAUNfPRPejvE7SVyH4+iiMV0236YOiEi6CxT?=
 =?iso-8859-2?Q?ypAz3BbMaZOkmmEpw1o2DOX9vzeU3NpM/s/JUfEd+aHGJWBOH9Dbau3KuQ?=
 =?iso-8859-2?Q?mrjd8jY+5Vp6Bx/SI38JBLJurFC8CSp/qZMCCYRrLM8LiR4RNrQUwl7uZC?=
 =?iso-8859-2?Q?NWjfQ2LSbEbgWWyW370Z3oE1oHpZSagA7p9ANDzt1DegB+acbF0adIu8pv?=
 =?iso-8859-2?Q?V5pt0XI1ielzHCV9vxs/7ZD2qkcQBKWjhl3oEhsoXLItZnwqS4dvrZ76hf?=
 =?iso-8859-2?Q?CIDUNgStcO/I9Gs7inXPzwo+Vm2u/EbEu6g6Tf+eO/wtelXRDtuszafSOb?=
 =?iso-8859-2?Q?ZxwGKD0xkIdl1rSH9Kk/qRss9OQwvYlHJxSV3k5iGHwAHkdJqEaNfbbmeG?=
 =?iso-8859-2?Q?y4w7txk68fYAzLQLCXyQHxwMY7cPauT2FrZ7EuySH1AeIqErkMb3lkYs9m?=
 =?iso-8859-2?Q?YnueH2SQtAK4eyFR6s8dvm2GWv8dA+SQPEVvyqGsNDUr9587R0jKbIY//K?=
 =?iso-8859-2?Q?UxuO/+Wn1qbgGaAmMh/KiO6qXNZnzgCXjinNscmXIrRqBBvnWFVZr4pQH4?=
 =?iso-8859-2?Q?sIZUtnOLtgF7XLRXtghZ3dfF5095pwe3lebhDHV6GQpSLUq9HmTpfEhdyL?=
 =?iso-8859-2?Q?/uWaCyHCWs6rmvJwYQK8e8J+R4hfSQhrZ6sefy55wQvPJBKxflbKnSaRXR?=
 =?iso-8859-2?Q?oO/Mj/TP2fyc5v9YBhQLudc8yk694C882vkzOSTzG17Ay4pFa2I/axEU5X?=
 =?iso-8859-2?Q?usltPOhaPatBdvB+gjDs6uObJt2+e1nHHcYPZdUUWx+eoEeJKlcavDaIaz?=
 =?iso-8859-2?Q?cOpIdxU7xAaFXewNuFTUyUZGAJUH4iXXrtoPa8YDRPhaHty4INwwW2KTVa?=
 =?iso-8859-2?Q?4msUNX/SrnJgsQveELeLzQCdwYZ3/d8EebR1HuxvhsBB7tTe5XhSV9EOn5?=
 =?iso-8859-2?Q?6oSa8PEZQm08tIpCkbHGyo60KgIPRkJBgFSsLurcU0fOzvOFhtK354hJ+O?=
 =?iso-8859-2?Q?yZ6dbLo46Sz0KllwlQ2gL/Duh33ks/vgGZf8VlXrGLlEibO2oXd3mttB+E?=
 =?iso-8859-2?Q?WYCwuJE6l8QXyle2n/cSHcZJoCGn8GQ0JWiiNl+Nv4aioln1hCHVLTCf1H?=
 =?iso-8859-2?Q?KN2C4GvxkwdcJVIOcA15yohmnaSWzlR23nLvWR0mqWbFaKBoi8To2scuCv?=
 =?iso-8859-2?Q?/PTJB2vd1Objuf97UyD6Eckwu+Oa7MvdZS4age+jxcdpqfR0Y2vdxmjFFl?=
 =?iso-8859-2?Q?eGDuQk/AcsznVG+221yvpvV1wFfb3pKfbwb+BteUX/oaLmdT9Rt+YnkFvQ?=
 =?iso-8859-2?Q?nU5lev1kTG/6ac91AsDzKoMbwEXDwNHwS6oLzVcnxE8voRYx9PqAaWTiTE?=
 =?iso-8859-2?Q?8vLR5ICXkx1COKQ5wFjOHM8f3jvSygV2s8U8BKISpZLgl01mOx5wcsyvS+?=
 =?iso-8859-2?Q?q1zhrxBS9UZNB8naq+hD30J0Q7HIK3YyRGbib+eSA3XoDLq5XN9ZKl4MKu?=
 =?iso-8859-2?Q?hJhS1bVWH/WuZ/Qja2qN/LlElogy3RNPJwl7RdGkOFUaJe3paE0V8V8RiW?=
 =?iso-8859-2?Q?uFJ1Kg8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?6LYTNvKDZrrVDxwkERjl8HHbsyD84+hqmk9wpp3SsSibMTILA72gZ6//+l?=
 =?iso-8859-2?Q?8fQMa9CSgA+6+H6xh6VGNEe6F5qRA01GbiII1qrshywR5rojSTeysFPAYd?=
 =?iso-8859-2?Q?j8Yv3HuC7/lXdRyVCEcUBYIDY4v01ELdTOhk9tB358yeyK7k8bJFj6QE4y?=
 =?iso-8859-2?Q?dWgn8fiVrFoGrYPVlKw8mEzvorsDNqpDbkla/ZZsU9BXso3ws500smYdcN?=
 =?iso-8859-2?Q?fQkohapIDvTEBdu2ONjsOMuK6pAG1Uo5RKLqcTLT97oBxAIjcY7nCdJTEe?=
 =?iso-8859-2?Q?TSSRcjfK/Vbbc/xFYXcEC+VMEdIevYKe/k7sjUqNDGpLxJCnmlq9GBGwZp?=
 =?iso-8859-2?Q?exrlag/pb5zxXJZNrVn2wN8j5N4Cl2QoTIL8XfScLY/heF6I8Q3ws2w8xn?=
 =?iso-8859-2?Q?R6DR3HWvxUzxWfMM3iW3SVwcn01J41WNd3E+7NrF3WWLE6UIVwmGWDLWQh?=
 =?iso-8859-2?Q?1JiJ82JuDuz/LuIXyAd2AfPBM5I9d/uyAQxqa0yLeLowhiO5m9vHKP1PNt?=
 =?iso-8859-2?Q?y/2/o90snOYHbw5yu+7RtgSr6IxpG4YjFu0HocWvL0soBwYH2sGZP+k+r3?=
 =?iso-8859-2?Q?DIK3/HHATk2EPmztoo32AnRVeQ1oub/P1BBeZJELn5SM1TnmmQKU77kNg2?=
 =?iso-8859-2?Q?IXxldiOZDM5+EIJXZqN6/Ko7T21iUfnnC80TXXYVrZV+JE+L3Q12tYlu2l?=
 =?iso-8859-2?Q?wbjrMC2zoNHh+3GSpgFg0eEPdKiBYvZ8EGUpVVONSd/z87SpTTvzdiV3xg?=
 =?iso-8859-2?Q?Jnmln+48BeaCnfABZQd7SBI7GXJn24eVOXfZjG/U3eBVDCX3pCoMNC6RQR?=
 =?iso-8859-2?Q?9o4ERg4jJlG1qLorLDUeXDBz/POoJR9m87DbJdnDwzc9Crh6OkDUf50pRU?=
 =?iso-8859-2?Q?VyLCFEsKSOll6WjGA/4/vhGXVs0HZXMZ2h2fDAyuIthCWHvw0FywgzBsz1?=
 =?iso-8859-2?Q?Nmavfi4Iy4udcakJWbK4Mt62X4IunRMXoC1jJ7ggtGEI7rr5GHOiM7vuFj?=
 =?iso-8859-2?Q?H8P2inqvbDLnQ70tKdCr6CzsmsJ9BKXqzs+1A8/y58rcbmXh/0CUrCalZU?=
 =?iso-8859-2?Q?5O1m/i8aMPZopijB5kCXX8NYGKP5HwiwBQ96muE+mQYWTdjEMqAd3jIo/Q?=
 =?iso-8859-2?Q?MfzvwaQRw+h0PEuQUxx31qxLsAoymOfZnDVic3o837KXKWZdRomICsfTGy?=
 =?iso-8859-2?Q?ihzg/buZhetBhPMUm0y23SbQrHbnn81XAocWOtysxoKonhRlJ21e1EEaHY?=
 =?iso-8859-2?Q?xhoCv3f5YdDXq7RpheYs7zY3TFBOX/RMF/4g/BjxWLI/m+K0eL1/ANyYa4?=
 =?iso-8859-2?Q?b4OJ+Ay2XeOLxscLZP47UN0gIkNtkfPOZ3Kn/tXWLSywCg1pcI6dMeETOu?=
 =?iso-8859-2?Q?gvZdqBEqubdMOdvLD4cHYq9YEwpZwuLYfypWaYksJG6cgDvS6yCk+u/KCL?=
 =?iso-8859-2?Q?bIUNCz4nhj5o2nqTDfxAfVb+csUICUqSSmma8KgWCMXOGXYnvDPY3UgtJ4?=
 =?iso-8859-2?Q?83PvoHnPFnTmnjuKP80b+LFSXJvD1wzl9BDDHjzg3uzZC8yDD/NMRk9LZT?=
 =?iso-8859-2?Q?lAWJteT8jyS9iDeRAT6vzlAIlH3W6pXlNa/OwtoS7m1wBYBqL3yW6ERXkD?=
 =?iso-8859-2?Q?zeRXKEmLsS4AcQnMxr4OfaCErMVJ6GHO3lyse1lBr7OWYnCaHXlaR1/Zzj?=
 =?iso-8859-2?Q?nAehb2HgmyAXd+5bGmyL3q0S62zutZIndYdMsODBOFVtuCKqcGDFnoI15m?=
 =?iso-8859-2?Q?5C/g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9622f2-7ba2-4b38-c650-08dd80a6acf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 07:32:31.1287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KehS6hYS3J9CE/wDmg3wzjXu431SbFx847czD5Yd60oIBAd42oVRA2OFTiVLMjEASbCI4ERreZYlG0akCUhcFO6kJWMmuN/fp2xHMGOtP64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8245
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

Hi
> -----Original Message-----
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Tuesday, April 15, 2025 8:01 PM
> To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Wajdeczko,
> Michal <Michal.Wajdeczko@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Subject: RE: [PATCH i-g-t v6 1/3] tests/intel/xe_fault_injection: Make
> setup_injection_fault() programmable.
>=20
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Satyanarayana K V P
> Sent: Tuesday, April 15, 2025 1:27 AM
> To: igt-dev@lists.freedesktop.org
> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Wajdeczko,
> Michal <Michal.Wajdeczko@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>
> Subject: [PATCH i-g-t v6 1/3] tests/intel/xe_fault_injection: Make
> setup_injection_fault() programmable.
> >
> > The current setup_injection_fault() is always programming fixed fault
> > injection parameters. Update this function to accept fault injection
> > parameters for better injection capabilities.
> >
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Micha=B3 Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  tests/intel/xe_fault_injection.c | 46 +++++++++++++++++++++++++++-----
> >  1 file changed, 40 insertions(+), 6 deletions(-)
> >
> > diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_in=
jection.c
> > index fdd11ffe6..e56cdb304 100644
> > --- a/tests/intel/xe_fault_injection.c
> > +++ b/tests/intel/xe_fault_injection.c
> > @@ -27,6 +27,18 @@
> >  #define BO_ADDR		0x1a0000
> >  #define BO_SIZE		(1024*1024)
> >
> > +struct fault_injection_params {
> > +	/* @probability: Likelihood of failure injection, in percent. */
> > +	uint32_t probability;
> > +	/* @interval: Specifies the interval between failures */
> > +	uint32_t interval;
> > +	/* @times: Specifies how many times failures may happen at most */
> > +	int32_t times;
> > +	/* @space: Specifies how many times fault injection is suppressed
> before
> > +	 * first injection*/
>=20
> The usual format for multi-line comments is:
> """
> 	/*
> 	 * @space: Specifies how many times fault injection is suppressed
> before
> 	 * first injection
> 	 */
> """
> I won't block on fixing this, but I do feel I should bring this up.
> -Jonathan Cavitt
Fixed in the new version.
-Satya.
>=20
> > +	uint32_t space;
> > +};
> > +
> >  static int fail_function_open(void)
> >  {
> >  	int debugfs_fail_function_dir_fd;
> > @@ -122,21 +134,43 @@ static void injection_list_clear(void)
> >  	return injection_list_add("");
> >  }
> >
> > +/*
> > + * Default fault injection parameters which injects fault on first cal=
l to the
> > + * configured fail_function.
> > + */
> > +static const struct fault_injection_params default_fault_params =3D {
> > +	.probability =3D 100,
> > +	.interval =3D 0,
> > +	.times =3D -1,
> > +	.space =3D 0
> > +};
> > +
> >  /*
> >   * See https://docs.kernel.org/fault-injection/fault-
> injection.html#application-examples
> >   */
> > -static void setup_injection_fault(void)
> > +static void setup_injection_fault(const struct fault_injection_params
> *fault_params)
> >  {
> >  	int dir;
> >
> > +	if (!fault_params)
> > +		fault_params =3D &default_fault_params;
> > +
> > +	igt_assert(fault_params->probability >=3D 0);
> > +	igt_assert(fault_params->probability <=3D 100);
> > +
> > +
> >  	dir =3D fail_function_open();
> >  	igt_assert_lte(0, dir);
> >
> > +	igt_debug("probability =3D %d, interval =3D %d, times =3D %d, space =
=3D %u\n",
> > +			fault_params->probability, fault_params->interval,
> > +			fault_params->times, fault_params->space);
> > +
> >  	igt_assert_lte(0, igt_sysfs_printf(dir, "task-filter", "N"));
> > -	igt_sysfs_set_u32(dir, "probability", 100);
> > -	igt_sysfs_set_u32(dir, "interval", 0);
> > -	igt_sysfs_set_s32(dir, "times", -1);
> > -	igt_sysfs_set_u32(dir, "space", 0);
> > +	igt_sysfs_set_u32(dir, "probability", fault_params->probability);
> > +	igt_sysfs_set_u32(dir, "interval", fault_params->interval);
> > +	igt_sysfs_set_s32(dir, "times", fault_params->times);
> > +	igt_sysfs_set_u32(dir, "space", fault_params->space);
> >  	igt_sysfs_set_u32(dir, "verbose", 1);
> >
> >  	close(dir);
> > @@ -442,7 +476,7 @@ igt_main
> >  		devid =3D intel_get_drm_devid(fd);
> >  		sysfs =3D igt_sysfs_open(fd);
> >  		igt_device_get_pci_slot_name(fd, pci_slot);
> > -		setup_injection_fault();
> > +		setup_injection_fault(&default_fault_params);
> >  		igt_install_exit_handler(cleanup_injection_fault);
> >  	}
> >
> > --
> > 2.43.0
> >
> >
