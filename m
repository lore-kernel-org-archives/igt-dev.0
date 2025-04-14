Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78E3C369A2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 15:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFD510E616;
	Mon, 14 Apr 2025 15:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FczTAvgu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B48A10E615
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 15:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744643885; x=1776179885;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uvehboDRR82rJKKDNRuBVGkPl+qaMbtL5E6DD0A/G9M=;
 b=FczTAvguDulw92ce3lj/vHNRxbTUe3di3S9IfHrH5oOPvkmAjOywqm8Q
 ub3H5kW9YVTH1EwtJA1OLq64CcFoQDoYyguYcUk+tYytV3EBpSaQ/Jlsi
 kK2MXqmh4RjOH90V4u3eMQK1taojXmR3Ld4R6ZIUjeraUyfoDJSz1pQ6E
 yxMkXKru9evQK4KNF/fBj9TMVOO/TRpSmDqQ7uWG8bhb+6nPrtLX/EMyY
 dHUrRi7u5Mih9AJnaLPiOmQi+9ELehQ2FklZCqcMesfCx0usrL0OOZ9Lw
 Lb/JVub/Y2xguADvpCIp2jFbwubxGd5gJmp2X5Ppb+lEIj3HlGwZXO6qG w==;
X-CSE-ConnectionGUID: tMnfzrk4TAaHb1PGZAwPCA==
X-CSE-MsgGUID: 5dn36cCeT8mWUpdkHLpKZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45354377"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="45354377"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 08:18:02 -0700
X-CSE-ConnectionGUID: JUuSyL0IQUKmcSnUmY977g==
X-CSE-MsgGUID: a+43CeLRTkmXQxyBPzepOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134694632"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 08:18:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 08:18:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 08:18:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 08:18:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeqc3XD5L+dHUjc6drcuxkfKn/+Ho6M1ZJOH1buPsgVvVrmfF17zPDPbMKOsXegn0/T6StzrjWUU+h8Jwkvbd8goIqPd7fHS6sRjSmiatYo9T3lsxBkQ48ASaRIU7NKs/L5K3eV9H3EhtUFAXbzcAkiQwR50V60mpyb5oTd8iz5dGYR8AD8O20F+kWHaWOcIOUP/zqWSLMRiMxkYKmvs2t/nQYJExfs+q5/3/+B8z+Lvt/ieMixbrh0XoqhYX3NMZrQ4cFfwSQ/7M5njtIzz0aN/UyJmCD7AJBDLeItUJEJpIoTFS87nQ5xLfZ5iEeP07ps5GzbNL4QZIGtE+tUdpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLSGMA8x3pJP+90OHrjuLa4vzrosIqaPwO4hlA9NHSQ=;
 b=D8c29rK3hiUcd6A3t0qeXGpytTq2zeP4+ZgLBfspccH0hznYgjJgqHo+n5uHICtlQMtjA1+u3rBqIysnq/C7RbT+zp+cf1Vhd5T3GKK8Y6okJxLSviHrCs7S4/xY/Cp2TQd4LVmngwkC/e0E2Fub9QR3VVwnUdSrvBYO7XPxPpEsdHgOIKNuEa18SBH26l935233L2ESUXlho4tlj5YptOVTMLVLYOfFw2FofMnPR5x467Idyz+iVvHEXQUGNcDoiok09EFUk3ERHCljg1I//6gFLmsGKzkkXFFuMxZR5j2Cw3qrSVtmne23LP9KNOISDANkM9BzsvJb4lcSa0AA+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB7068.namprd11.prod.outlook.com (2603:10b6:806:29b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Mon, 14 Apr
 2025 15:17:17 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 15:17:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject
 errors in xe_guc_* calls
Thread-Topic: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject
 errors in xe_guc_* calls
Thread-Index: AQHbrUi5bXq3Riyrs0yzNP+me2HE6bOjOWsAgAAHcACAAAPwMA==
Date: Mon, 14 Apr 2025 15:17:16 +0000
Message-ID: <CH0PR11MB5444CBC9570B5E7821886C00E5B32@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250414143842.14981-1-satyanarayana.k.v.p@intel.com>
 <20250414143842.14981-3-satyanarayana.k.v.p@intel.com>
 <CH0PR11MB54442A3E0DB6AB16D3B4952FE5B32@CH0PR11MB5444.namprd11.prod.outlook.com>
 <LV3PR11MB869518FEEBDC832D2A4544E1F9B32@LV3PR11MB8695.namprd11.prod.outlook.com>
In-Reply-To: <LV3PR11MB869518FEEBDC832D2A4544E1F9B32@LV3PR11MB8695.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB7068:EE_
x-ms-office365-filtering-correlation-id: 13238e5f-8bf2-4262-3bf7-08dd7b677161
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?cOjehZDyEhIGOg4ZMWEsT6BUycRMnCVjQtJSMW9zl3ok/0lFv3fOsHTOGg?=
 =?iso-8859-2?Q?Z1AHKhFu0LAfMUiT1GCVfEKfCm7AvPI2zi9d7hx4hP50c2lJcF0nQpIs8P?=
 =?iso-8859-2?Q?8TLz/qIkVXW8ricFzEWTx63JKwiZ6rlrTbIed/qEF/rJ90RjvrWnMTC+Wp?=
 =?iso-8859-2?Q?1ebzPkr3K4EA74KLVwdEMnTCZJTA8wYkyioOpl2X+Un3GEPTuCHbDvBGgW?=
 =?iso-8859-2?Q?QMhSyHedGSA7+3IVlP2d5QkixicvZ8Vl5m8bN5IW/snwAjnAUKbZzh6fSf?=
 =?iso-8859-2?Q?eppoycDG2yNMGqEdQqVPU47OPORrsVahCeSEvzc5ufUnI1iQGvTaVIQttl?=
 =?iso-8859-2?Q?xjqSVr1bGihA7w1N4a8H1baxi7QZI4GMqvWMndFJG2KpFkUn2vhj9oDgXi?=
 =?iso-8859-2?Q?4JvLjWOl/i7N679do4CM4YLa4jRL3dIBWgH/y9XLYyegeHSCZqE+CWKV4k?=
 =?iso-8859-2?Q?nXf9icd/QtYyy1wBJ3FR022s4pkwcjMjAE79Fc75cbVj2oZHWFc7NK2FhY?=
 =?iso-8859-2?Q?d83o0JI0RbDqsP32gPUOGubO16rneqZ0E+gyXiCFKrHio9ZvG3WCzs393F?=
 =?iso-8859-2?Q?Q2J1HN+6hRNpUbp7dlgDN1D7YZxtXvVmHNCj/LvfXpEKzG/iiJxoWexnI0?=
 =?iso-8859-2?Q?WdnjVoATHK394TYftuRu41P2uP3LgLmvtHgJtEnUqdy6TClqvMD3/lhynX?=
 =?iso-8859-2?Q?wBfoIrPdEBH8ixLcqb/+C4krlkQ8Y7dK7t5Ovi4m/auKOZgsVGvzn3E9aS?=
 =?iso-8859-2?Q?jdwtpL6cU8uV4PfrvRQA4vhBOoApQa6GuNGKxWPOE3/W3G66IFe1v6PO1J?=
 =?iso-8859-2?Q?uCL6IA1bvBohfOMzswUbG/dzfDYV31m3cGLfLyh6kd3XiUtWkkyELdZk7K?=
 =?iso-8859-2?Q?OlfdHFeNSwj0+baaYVbjIKnHmaM3fLfWa3tMufxA7bEzWcflQ1h0vrien1?=
 =?iso-8859-2?Q?OCl42xMsJ1YqDnFK3My20/csQ99nmmWaXfvSjdx0Iq15mX4pVgYJ6YCa/y?=
 =?iso-8859-2?Q?A/9giHPPuqAq/cQFLjdqfB5TUdQTFwKkUGoLQdttCd8xvQT7AglGkdzdWw?=
 =?iso-8859-2?Q?0IuoXi6f5JQayOYIG2LvaKJ7w/LaNDsReX790amDyf2xKp/yjnJlITS8Gb?=
 =?iso-8859-2?Q?DJvQGT73mwBpRmbf/XCCSQXBo6i6zsK8B6RBH+6X/3GqVEbSWrwmmcO2Z1?=
 =?iso-8859-2?Q?wsEAimrotmNcr1tiGPC7I6v8mmyp190XQ4tKdFDAhrA52yiYpT/AAChAMF?=
 =?iso-8859-2?Q?jxSeFdQHzRpPEhoxoo2Aeoi2AA80twEznMBxcWOR+VjaeulqVWQ32y70RU?=
 =?iso-8859-2?Q?ApgyJBS8lc2Ec2a6FNO4yePtPk7c1yf3ezVMNf/G0pnPIZAf9PrKaC8zo+?=
 =?iso-8859-2?Q?clNV+zbu5VcImmfag/XmmMdbN3MRFmAzrffOMBFCpNBTUJnYanC17KPT1o?=
 =?iso-8859-2?Q?uLXaM6YwxkOoo/ZSUQTgRBH4wa+8qExwu/9w6IczlyLb9njWL9EKmlgIvs?=
 =?iso-8859-2?Q?b2qSRQrnx1q3pGGqRpLaO0a1cMMCZ8HjIuAo5w6A4d5lr3HeMPR8HYlD2Q?=
 =?iso-8859-2?Q?rGFnEnk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?PGyqST4diaNHHY5tydwXl1zl1adjeBAKHh8ZDoGcejABgd18zcnydNYo1K?=
 =?iso-8859-2?Q?4FjNUpKM1ClUs70G6Z6qa2pgfyb79dwzFyM9O4IKk7cPdBUS9wRyK6F3kz?=
 =?iso-8859-2?Q?+fvmdt1HO+h7nRIcINfgprgZoaEqzs1CrUImrovov5VwEQyExloZsqRiZw?=
 =?iso-8859-2?Q?PkMMrDXy+dRS7Pd5ybvgcdQDF9uoJXT3TIgPC7wOAA0wbmNJ3KcQ6bvzd0?=
 =?iso-8859-2?Q?UpXDtRZWzOL6KSX3bC5ZwgyLMIzQf/NnxG4qSCQs1pce0UkZQP/W6LxQIE?=
 =?iso-8859-2?Q?QaGnMJgwZbYBrOdss5AUbHk+4Q9o5JxtAesgsaS87HQHZeKgWh/56E1J8M?=
 =?iso-8859-2?Q?iWbX9q/L0WNFO+3fJ7KRKoP5OqJOE4M3zwTmNJdRaX58KchyQhd3t7iIp5?=
 =?iso-8859-2?Q?NQIWxliFB/42rYLeCzA2NoBDRdx4PJR1w2VD+NK2Wtvy4lQuX6Zix/jGva?=
 =?iso-8859-2?Q?WcLLaDIAheWR9BHRt6dbSt5bB+Raxo4u8RVqklDBpPhu7eT+W6HKd+kjuR?=
 =?iso-8859-2?Q?j5kUnTymy36+oi/7VNLH66XSYErAw7NWDrBO3HGNCuhhNHvXMkk5BMMWJQ?=
 =?iso-8859-2?Q?W6HYnA29QU2d3YxyZVBYUEzeHT9BFSLvNEHF9++INSVkJkUKHhFlNR3uaA?=
 =?iso-8859-2?Q?EQLRQxPullOKp6LzzGMUyJWh8M+Zcbjpxb2qGHIVEb8Ed1Okc1MMbgGcr/?=
 =?iso-8859-2?Q?5QVtqVCkdmbvqCA0625T4VTCOrJ5LeUNfJbHYAN+I7dMHJpw9DD1QBy01U?=
 =?iso-8859-2?Q?R509G/hN8OuusOd1NdhOoNwBw3+OQT+y0XxdQyQO+iqKJsf83f51Ed5qdC?=
 =?iso-8859-2?Q?k5o081Je4EuPr5M1Ptnp621B8qb3MKAcye8GhhbKs0ChjkfJgz4EfpG2r8?=
 =?iso-8859-2?Q?PQmWi7A7DK//ir8nX65ITn+z0Vmqg1lMF9pW0lz+mFGADeodYDyo0DK34E?=
 =?iso-8859-2?Q?AR3xK7ysDlJhEcu4KHVKQMCkuPkVephvzlcHiDNYL9Aw8C8m6HkD0mqCQv?=
 =?iso-8859-2?Q?F6dNpoQPAB5CuRJHvcqCVCtEX0wPsM9DQb6N2+zd7p4HVhPWtC2SiHhKjc?=
 =?iso-8859-2?Q?GLocYbS3p1Ay4a2VQc/Sl855yrHkf2yAd9xUe50sRXEg58+AbOD43//58P?=
 =?iso-8859-2?Q?4Mq1hyepPNlk7JWcf1K0vKGAOE87Q95FZomOHjTspKdmCs3SdlLQ7MoAr4?=
 =?iso-8859-2?Q?zuriHtC+ki/bFhr7Ql7aWdi687ysrjDPAvcnVynvBo61csVk6EFVFYmkr4?=
 =?iso-8859-2?Q?k+J15EjsuFHt31oOwMMZDEige2Umwq/qHMnFR9I64LreYIwqWfxFEwA1Sc?=
 =?iso-8859-2?Q?cLvB2lYJ2SgelElGt1CI5U46OZo8BmWgtvmXk42ZQAzDnqbSVHZeFMWmfd?=
 =?iso-8859-2?Q?DxCMeF/ohBkFwRnJavPoPVswGOlthCgPHCaYsXopQYzoVmKsE/0NvcgLLI?=
 =?iso-8859-2?Q?Hp+pq52MYeXFAyP4QxjeRinGBaWuWTuLnqNAfax/TigOz+KnIipT5MrRON?=
 =?iso-8859-2?Q?mwY5VSvomSS4NUfvtJ8x54RUGaXPK9Mlu5O41kT4ZemG+z3QpSVtSJJnym?=
 =?iso-8859-2?Q?LRwYxk4ZhtO7O0CeooZ3PrylK5nWtzWTFh7R4Zj/FdEwoD396WybFQdpzz?=
 =?iso-8859-2?Q?9HOhyNbxz36+63CH3vYj5lpF3ERsHKfU1/?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13238e5f-8bf2-4262-3bf7-08dd7b677161
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 15:17:17.0224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RWKBTngvUailoUB0TVkLYJo9mL1RXP1qEAgpqLByHv+ftwjFuhCqRJeyeQwIF+L0uRrJS7ZgeqhRpN/xxSZzGMl9N4kMK6cKMZpZDlJcS3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7068
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
From: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>=20
Sent: Monday, April 14, 2025 7:59 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; igt-dev@lists.freedesktop=
.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Dugast, Francois <franc=
ois.dugast@intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>; De Marchi,=
 Lucas <lucas.demarchi@intel.com>; K V P, Satyanarayana <satyanarayana.k.v.=
p@intel.com>
Subject: RE: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject er=
rors in xe_guc_* calls
>=20
> Hi
> > -----Original Message-----
> > From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > Sent: Monday, April 14, 2025 8:19 PM
> > To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-
> > dev@lists.freedesktop.org
> > Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Wajdeczko,
> > Michal <Michal.Wajdeczko@intel.com>; Dugast, Francois
> > <francois.dugast@intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>; =
De
> > Marchi, Lucas <lucas.demarchi@intel.com>; Cavitt, Jonathan
> > <jonathan.cavitt@intel.com>
> > Subject: RE: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Injec=
t errors in
> > xe_guc_* calls
> >=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Satyanarayana K V P
> > Sent: Monday, April 14, 2025 7:39 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Wajdeczko,
> > Michal <Michal.Wajdeczko@intel.com>; Dugast, Francois
> > <francois.dugast@intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>; =
De
> > Marchi, Lucas <lucas.demarchi@intel.com>
> > Subject: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject er=
rors in
> > xe_guc_* calls
> > >
> > > Use the kernel fault injection infrastructure to test error handling
> > > of xe during driver probe when executing xe_guc_ct_send_recv() /
> > > xe_guc_mmio_send_recv() so that more code paths are tested, such as
> > > error handling and unwinding.
> > >
> > > All xe_init() kind of functions are called just once during driver pr=
obe,
> > > so it is sufficient to fail first/all calls to them. Driver communica=
tes
> > > with the GuC multiple times, and the real failure can happen at diffe=
rent
> > > call, hence the need to inject failure in GuC communication functions=
,
> > > like guc_mmio_send() or guc_ct_send(), but it can't be just first cal=
l or
> > > all calls, but we need to be able to select specific iteration to fai=
l.
> > >
> > > To address this problem, an optional input argument is introduced. If=
 the
> > > argument is not set, an error will be injected in every possible func=
tion
> > > call starting from first up to the max number of iteration defined by
> > > INJECT_ITERATIONS, currently hardcoded as 100. If the input argument =
is
> > > set, an error can be injected at specific function call.
> > >
> > > Error can be injected using:
> > > igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
> > > igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv
> > >
> > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > Cc: Micha=B3 Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  tests/intel/xe_fault_injection.c | 75
> > +++++++++++++++++++++++++++++++-
> > >  1 file changed, 74 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_=
injection.c
> > > index 44c42e83a..adcab2e4d 100644
> > > --- a/tests/intel/xe_fault_injection.c
> > > +++ b/tests/intel/xe_fault_injection.c
> > > @@ -26,7 +26,9 @@
> > >  #define INJECT_ERRNO	-ENOMEM
> > >  #define BO_ADDR		0x1a0000
> > >  #define BO_SIZE		(1024*1024)
> > > +#define INJECT_ITERATIONS	100
> > >
> > > +int32_t inject_iters_raw;
> > >  struct fault_injection_params {
> > >  	/* @probability: Likelihood of failure injection, in percent. */
> > >  	uint32_t probability;
> > > @@ -233,6 +235,38 @@ inject_fault_probe(int fd, char pci_slot[], cons=
t
> > char function_name[])
> > >  	injection_list_remove(function_name);
> > >  }
> > >
> > > +/**
> > > + * SUBTEST: probe-fail-guc-%s
> > > + * Description: inject an error in the injectable function %arg[1] t=
hen
> > reprobe driver
> > > + * Functionality: fault
> > > + *
> > > + * arg[1]:
> > > + * @xe_guc_mmio_send_recv:     Inject an error when calling
> > xe_guc_mmio_send_recv
> > > + * @xe_guc_ct_send_recv:       Inject an error when calling
> > xe_guc_ct_send_recv
> > > + */
> > > +static void probe_fail_guc(int fd, char pci_slot[], const char
> > function_name[],
> > > +               struct fault_injection_params *fault_params)
> > > +{
> > > +	int iter_start =3D 0, iter_end =3D 0, iter =3D 0;
> > > +
> > > +	igt_assert(fault_params);
> > > +
> > > +	/* inject_iters_raw will have zero if unset / set to <=3D0 or malfo=
rmed.
> > > +	   When set to > 0 it will have iteration number and will run singl=
e n-th
> > > +	   iteration only.
> > > +	*/
> > > +	iter =3D inject_iters_raw;
> > > +	iter_start =3D iter ? : 0;
> > > +	iter_end =3D iter ? iter + 1 : INJECT_ITERATIONS;
> > > +	igt_debug("Injecting error for %d - %d iterations\n", iter_start,
> > iter_end);
> > > +	for (int i =3D iter_start; i < iter_end; i++) {
> > > +		fault_params->space =3D i;
> >=20
> > Is "space" the correct parameter to set here?  From a cursory glance, I=
'd expect
> > you'd want to set the "interval" parameter instead.
> >=20
> From the Linux kernel documentation,=20
> Interval --> specifies the interval between failures
> Space --> specifies an initial resource "budget", decremented by "size" o=
n each call to should_fail(,size). Failure injection is suppressed until "s=
pace" reaches zero.
> We want to inject error at specific call and not with an interval. So, ch=
osen space here.

Okay.  With that full explanation, the use of space here makes more sense. =
 However, I think the full explanation should
be added to the fault_injection_params struct in patch 1:
"""
	/*=20
	 * @space: Specifies an initial resource "budget", decremented by "size" o=
n each call
	 * to should_fail(,size).  Failure injection is suppressed until "space" r=
eaches zero.
	 */
	uint32_t space;
"""

Or perhaps just:
"""
	/* @space: Specifies how many times fault injection is suppressed before f=
irst injection */
	uint32_t space;
"""

> > > +		setup_injection_fault(fault_params);
> > > +		inject_fault_probe(fd, pci_slot, function_name);
> > > +		igt_kmod_unbind("xe", pci_slot);
> > > +	}
> > > +}
> > > +
> > >  /**
> > >   * SUBTEST: exec-queue-create-fail-%s
> > >   * Description: inject an error in function %arg[1] used in exec que=
ue create
> > IOCTL to make it fail
> > > @@ -407,10 +441,36 @@ oa_add_config_fail(int fd, int sysfs, int devid=
,
> > const char function_name[])
> > >  	igt_assert_eq(intel_xe_perf_ioctl(fd,
> > DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
> > >  }
> > >
> > > -igt_main
> > > +static int opt_handler(int opt, int opt_index, void *data)
> > > +{
> > > +	int in_param;
> > > +	switch (opt) {
> > > +	case 'I':
> > > +		/* Update to 0 if not exported / -ve value */
> > > +		in_param =3D atoi(optarg);
> >=20
> > I'm assuming that the below igt_main_args is a wrapper that calls getop=
t,
> > because otherwise
> > I don't think optarg will be set here.
> The opt_handler() is called as part of igt_main_args().

I figured this was the case, but wanted to make sure.
-Jonathan Cavitt

> >=20
> > > +		if (!in_param || in_param <=3D 0 || in_param >
> > INJECT_ITERATIONS)
> > > +			inject_iters_raw =3D 0;
> > > +		else
> > > +			inject_iters_raw =3D in_param;
> > > +		break;
> > > +	default:
> > > +		return IGT_OPT_HANDLER_ERROR;
> > > +	}
> > > +
> > > +	return IGT_OPT_HANDLER_SUCCESS;
> > > +}
> > > +
> > > +const char *help_str =3D
> > > +	"  -I\tIf set, an error will be injected at specific function call.=
\n\
> > > +	If not set, an error will be injected in every possible function ca=
ll\
> > > +	starting from first up to 100."
> > > +	;
> >=20
> > NIT:
> > Semicolon after string should be placed in line with the quotation mark=
, not on
> > a newline:
> Some tests are using this approach (eg: xe_create.c). So, followed the sa=
me. Will update in next version.
> > """
> > const char *help_str =3D
> > 	"  -I\tIf set, an error will be injected at specific function call.\n\
> > 	If not set, an error will be injected in every possible function call\
> > 	starting from first up to 100.";
> > """
> > -Jonathan Cavitt
> >=20
> > > +
> > > +igt_main_args("I:", NULL, help_str, opt_handler, NULL)
> > >  {
> > >  	int fd, sysfs;
> > >  	struct drm_xe_engine_class_instance *hwe;
> > > +	struct fault_injection_params fault_params;
> > >  	static uint32_t devid;
> > >  	char pci_slot[NAME_MAX];
> > >  	const struct section {
> > > @@ -469,6 +529,12 @@ igt_main
> > >  		{ }
> > >  	};
> > >
> > > +	const struct section guc_fail_functions[] =3D {
> > > +		{ "xe_guc_mmio_send_recv" },
> > > +		{ "xe_guc_ct_send_recv" },
> > > +		{ }
> > > +	};
> > > +
> > >  	igt_fixture {
> > >  		igt_require(fail_function_injection_enabled());
> > >  		fd =3D drm_open_driver(DRIVER_XE);
> > > @@ -511,6 +577,13 @@ igt_main
> > >  		igt_subtest_f("inject-fault-probe-function-%s", s->name)
> > >  			inject_fault_probe(fd, pci_slot, s->name);
> > >
> > > +	for (const struct section *s =3D guc_fail_functions; s->name; s++)
> > > +		igt_subtest_f("probe-fail-guc-%s", s->name) {
> > > +			memcpy(&fault_params, &default_fault_params,
> > > +					sizeof(struct fault_injection_params));
> > > +			probe_fail_guc(fd, pci_slot, s->name, &fault_params);
> > > +		}
> > > +
> > >  	igt_fixture {
> > >  		close(sysfs);
> > >  		drm_close_driver(fd);
> > > --
> > > 2.43.0
> > >
> > >
>=20
