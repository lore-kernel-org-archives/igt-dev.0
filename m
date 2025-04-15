Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1242C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 14:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AB710E7A8;
	Tue, 15 Apr 2025 14:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYq6RKy+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C08A10E7A4
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 14:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744727486; x=1776263486;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UW85kdYxjxrdq81PhTr/scmLLnip3eAbC6LPYpV01w0=;
 b=PYq6RKy+v271riFw+2MeCfZW0DAoK9/hPxZP3urzD5FitMZBVVO5+xkI
 A7hxp6fWWP84RNWtoYCFJd/P7AL4lcmTKZdhqzxxVQPzZkKgxIJ+y1GLe
 oRS+gs/84pl4CeHxEQbrhegv7sZu2Blo+d1bEbruF67VnEBQemcS/atgg
 0XJ+AzUcMMIbcO2m82ko7N3M05LIySTN0022DY0wd5uk7uu3d2iG56Ai3
 FFQVyrdIYQkgKKS/2dl2f0KdoboyMNFq65ByIdK7kQNLgYKCTtYSaYrOh
 yDTf2aHUX0cfAIb5HlWIHHeLuyi/Ru1kQzaeHLlZJRgnI8qQrROxiOtMz g==;
X-CSE-ConnectionGUID: An9Po1vFR2WLsdVyBM+X/g==
X-CSE-MsgGUID: 99TD2lNOQ9C32Mnwnrmbgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50065140"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="50065140"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 07:31:26 -0700
X-CSE-ConnectionGUID: t9IAKoBhSveRlTveiqUfgg==
X-CSE-MsgGUID: 4k30UrrbQlq5Nht5P2RQaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="167309261"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 07:31:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 07:31:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 07:31:25 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 07:31:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KD27Sg9gW5HTZCff/zXDOO5ZrST5EffSlmOPOYmXY9bP3GQSgPWCBU5pNKDZFe/vHOEMr+Fg+D/UpOh/jE2CgJ3uT3ZtboAC0DqYwd/zKloDGqnKFCWiAkomBXpuFscDVf7vhFXLmOnE9m/vuE2gu9zhUCKh9Yk7/tVky22SB4ZwySixDYWj+Vow9F4GUisaxJeshAEDcYKUy0MylQhqKvZ0pvACxv2ea/y7jg3us2TOSSpYyTjKtYjY8orWYQsfxf0MCrICrNBLqamJxJ2Vd8NBaCCyuj/2f2wuTn/I95+fFboChFEJOd4hO6LhzIptK+r8xvLs+y4Lrlz8CCqkag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyPw5ur2i0GFppp5uoBCz0QsBW4Uc0+kyyKNWhkx56I=;
 b=X3for7MTimV98iykzyoB4oAKXf75DlALZZpWy2/HR9Ite7ILWGPgB3RZPRu+H7atjf8iwwP0YWtwENFr+uiOk72S1byGXKCetpffPvUTGAJj0WK93ELbv11sS/5grsvmLb2OVCFToMqULmlazTnEXpykOfJ+Vfog6SB7AV6lDcpKvOYnakKm3Xuk6KjcO5zWOSwF7gEytuBy/yDbZcWm0ZBvHiAbwY2V/PmGrl/scjWdphbJ85xUw+5iTNoXGRO2PQ7Pqni1JJuwlezdbnbhOBr5zOmWthMBUD1tIfMbjdkK/fwATCqhx1aG9BRpb/LcvES9O/sgY5gyv3hOngJ90A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB7199.namprd11.prod.outlook.com (2603:10b6:208:418::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Tue, 15 Apr
 2025 14:31:17 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 14:31:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v6 2/3] tests/intel/xe_fault_injection: Inject
 errors in xe_guc_* calls
Thread-Topic: [PATCH i-g-t v6 2/3] tests/intel/xe_fault_injection: Inject
 errors in xe_guc_* calls
Thread-Index: AQHbrd4KkaBMjK2ZtUmBobaYxuMo+7OkyMMA
Date: Tue, 15 Apr 2025 14:31:17 +0000
Message-ID: <CH0PR11MB544423335D68F9A916A5E995E5B22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250415082711.4831-1-satyanarayana.k.v.p@intel.com>
 <20250415082711.4831-3-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250415082711.4831-3-satyanarayana.k.v.p@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB7199:EE_
x-ms-office365-filtering-correlation-id: 23bf2b55-cbb1-475b-d644-08dd7c2a2ef0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?GVZW0x+fa58vPTKyNjKBkv2dzuexuKeHb3j1l4+KEi4PfpIV8gk3dz2kCB?=
 =?iso-8859-2?Q?EC4EiWIK22Njbg3cn7A8QJaQYE1umwXA1FxYPzrDocDCei1xB/15Age/Q3?=
 =?iso-8859-2?Q?oeTpW51N8cGJJFo+4+Gh5/tGX3Vct/lAlkF3YTRTzOs0JjClbJICLLG9gw?=
 =?iso-8859-2?Q?tr0Ci9Y8ie4k6pPwUGtol6T357ZMQ0igFrzE8kolaMgeTq0nw9PCzZ+BXI?=
 =?iso-8859-2?Q?YWqWp8zVfu1+rmESQgO0JXIL3PgyrKUbYejCK2R6DwLqA77FWE0J0u3M5f?=
 =?iso-8859-2?Q?PrRCBlBgDMry7+eXQtxz4joXN7/h7/XUPLqvV9af4g2z7AyH88ocFoN+LD?=
 =?iso-8859-2?Q?XPcIiTTPTIvcjPxAuByMWBfJw4JWGnBPGdmG30sKukYw0qzBPa8SbT2xef?=
 =?iso-8859-2?Q?BLJLg7/9Gp0+gEXG29Najmm1Uy7jqrXeei/Hg1C4PgYOwm2y33lDcDGws+?=
 =?iso-8859-2?Q?nHYsJD7phlIbvQmjZf7jKBIfb4/mefKtUCzJCgyVOKEXoarvTVo5zWmsMc?=
 =?iso-8859-2?Q?ZkLx0Y/eEmMWKZPMt26jXGnNKSOmiIt3ZjiPMmYnHd4ooFlyoPvJsRQRrv?=
 =?iso-8859-2?Q?Svc0vZ2xsaIJrXzwuhSK9cWderftTiOAReLqxadTSlTnqIROYQirJOreQG?=
 =?iso-8859-2?Q?m3KVEWoyQ+zaWShaNhlmSf4TIgg2YQ6W6sTsLEQZTgH6/r1+qbE+bz26FF?=
 =?iso-8859-2?Q?6OElFeVb5QRjiARlzBFrndoYH+JldfW5IBUHswzgyWnLd2gWkgTz3DMARt?=
 =?iso-8859-2?Q?GDqaCbpAAlciD33m8nce/BPXilksqQJcIEgDL0XANQRbhYEjbJTUX/swDH?=
 =?iso-8859-2?Q?24mtgefKczgO0pJ9MIfmszR7hQeUrFc/QmAwEpgPHAH0/NKLY7X6/GQYxo?=
 =?iso-8859-2?Q?NDJxGUZ6CVgy59I1NWBB6L5Trz4+pxlVqg5GicKUB3TPQVBqVRH+Z0z1ZB?=
 =?iso-8859-2?Q?d8IDSvES+HF0yAihlW2MsBf8YVy8WG4vQZX/paN+P7PePXxLEBTAw/19NW?=
 =?iso-8859-2?Q?EmXuwnTCEnbN9UhpBvyhcHoeJNigk2wvoZYPdscmY7mmaB/CxiWfcee8xY?=
 =?iso-8859-2?Q?sSVo9EGil8OYt6YS3ITK7ppSjU5qqaV4AmNWyzkB6hI3WMIdOam8/gySOR?=
 =?iso-8859-2?Q?tJAQZRyk61Gc2+GFP3jFuVwNMNeMwOLVcZZFdqarJlu1INV8//wf5Khddc?=
 =?iso-8859-2?Q?lfYrMm4KBHGQXTvJKoGrcyBscovI6sj+6WD6l3Ly38Eke17f2klaePXXLg?=
 =?iso-8859-2?Q?uAI9siBzSu/oVXoTsbsVNqpUqoOYSkLVbaofxjKnRkLvE81VfhDKRvy139?=
 =?iso-8859-2?Q?iwXYVFRkJ3O2kT0CAbUk/fXhIESJVe1mj+TvdkGs3BOyAGbgsW+y0mTpvY?=
 =?iso-8859-2?Q?4V/ADlX4mWKx/ucir++ORgrhtEG3qEdcMbRxpg6hflAtR+sP0xzhsnNSy+?=
 =?iso-8859-2?Q?ocaZUudwIVKuZ+ir4QNj3azTwX5iD9iBAFL9d/Qcl2/UIK1gZI6yUedDT5?=
 =?iso-8859-2?Q?IJ9aSxqNgsVzyjyWB4arcb/gP7Or1nR7GW8GSgjp7c9Wm3q5y7YDtx4xCg?=
 =?iso-8859-2?Q?1VRpVJM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?2KMDFja27FpmSTsdU/nZrXXT+GUTPJOssyoXe0QRv2FqxXRjhNL3yEPiLv?=
 =?iso-8859-2?Q?jsQ/qUAxF+3GCxVEMhuVwk4jT9j2XezKlgOBmw2//AJkafPErCpputTfYG?=
 =?iso-8859-2?Q?kYB5Nh4wvUXDAMzdEVJ0YrY8lPxV5VQZTz2i4kDXU55+tkL1D3e5iXjXhd?=
 =?iso-8859-2?Q?HBxqVXDJ7NeN0PPFJZefQZlSEJpRmvWMm37+uV5qRlCZvtytC/zJFLZZZ3?=
 =?iso-8859-2?Q?OAdKCpFVo6WcyZ/5gX2GGlQMdUkZYd42bLU159rtDv6tTc9kwUlDlreey+?=
 =?iso-8859-2?Q?03U3i6xbUwSvMVCsy473RpHvoD+lTrFx5khwsiHZIbsuMEB1gTD/kLbCCK?=
 =?iso-8859-2?Q?sJACml7V4TSvpnedFJkSldmaBLuVBzLjFlQvpQRVThxTL1PT5wNbQVw0zZ?=
 =?iso-8859-2?Q?uPT2F228g6ggQyEZ3NxrCPdhIgjAtlgmZoGH2nMPtVcuumpyWMbVsRnfkr?=
 =?iso-8859-2?Q?AmfYKH8HA3lqMNcJtXIakHoCqGzqDRgGWD7NFILSQKSgfOPt/pBNXa3jay?=
 =?iso-8859-2?Q?c9mFs1VXnUByYCj9vVM6VjXnmflHGlYk04IuV55EnLsTPn1bQ0KRRSCxuM?=
 =?iso-8859-2?Q?1cgGOSY+/E0oMJNCrXPdQXP+xLNVlkqXE7O2e6KBvN4uGmI/ksJ4VOWwOL?=
 =?iso-8859-2?Q?AHFpaIkkOZpAIgds+tIBXi/+WNNrLXDgD2bikT4K/+vtq3jaxPWwklYcS8?=
 =?iso-8859-2?Q?5oEffFBQaLjYZ1uBzqW8c1RS+cDk3+MY2omj3me+YaH968qiVMx7gr4AuR?=
 =?iso-8859-2?Q?ZU3dF/0UUWcIqqT+816PEcFDOiRfz0FTeT8YLexfTAfc7uuEnd55dwvd+G?=
 =?iso-8859-2?Q?l9CoGzGDrMohV1BcEhlLIuQrcNbTQO3OGkusyz9HgmbDzjtXBpxXKUIMSc?=
 =?iso-8859-2?Q?eRg9JIrUX5zb8vktMcbd1smKoxMMvXLaFzUEgyhRFulwkCL0pwXeGvoVQX?=
 =?iso-8859-2?Q?AgpYTkyrt92MqwTFEWx+GVL0zU9WDPjzCAHtwtUiQkswA5UgNx9s6Foz3S?=
 =?iso-8859-2?Q?gg+2BQvgcKNk1V9yf47g15/tPezgf3tAxEvZm7hKymT7PYrLpKFjBna49/?=
 =?iso-8859-2?Q?kwQ+0TMbEYQ0E5uKRB4Qa2raH6CswN5VTugcRSaKcyL9+vk4i68U6P+n23?=
 =?iso-8859-2?Q?97/tg003y+bXI6fp9OnSzovPLD2NbzMu4PmrG/VV6hmHyL73VTh2UuGE35?=
 =?iso-8859-2?Q?OTrjP02T3reP06MzhKRm2sbJlUf68KzqZFo4nZcmIQGiVsDsbu4EYYBPxO?=
 =?iso-8859-2?Q?9Wz6rIYOvnY33h8z8/7e5OUzFAES9PDjr+Hi8+eh++1jSFi1stg+YuiBM3?=
 =?iso-8859-2?Q?qjrZQZr/woHeJuvXx4yxfyCEMQG4bTxFcc5PDuzpnYszmk1Q2HFuxiMaSJ?=
 =?iso-8859-2?Q?EXaNmKMLE7ECojYNhYlGHJoQzQBLXA68W/2j816bx35wJiEIQmDTON6Yij?=
 =?iso-8859-2?Q?913JDRR47e9kGM+yiHgfrHZTbIJY5Mwqg4+kIhZbVICu3p33ocPNWYQi2g?=
 =?iso-8859-2?Q?uduQ5usJFNpPRzXNps7uGQ+ULfz8Ou35ekfnp20uI2XqbO/44VYq9UreEY?=
 =?iso-8859-2?Q?7lep9oOBthvMmvZ4I1yV+C+Wb0fsezHkC/z/XBKvLKEfmzJUj5Wiy945eo?=
 =?iso-8859-2?Q?bkNxWIIOVhpA5WJUNzeXSiq27ACpUF8CAe?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bf2b55-cbb1-475b-d644-08dd7c2a2ef0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 14:31:17.4216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TzeGtoViKyMt3eC2ypq3L0Cx0iQxhsn5OvpDDPIhwQYcGwYp8zPdcAhfiMATFdyFgRYAtNJmd377EybHxLqF/sDbsPUfG0+TTz+RqOTTXlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7199
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
Sent: Tuesday, April 15, 2025 1:27 AM
To: igt-dev@lists.freedesktop.org
Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Wajdeczko, Michal=
 <Michal.Wajdeczko@intel.com>; Dugast, Francois <francois.dugast@intel.com>=
; Laguna, Lukasz <lukasz.laguna@intel.com>; De Marchi, Lucas <lucas.demarch=
i@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t v6 2/3] tests/intel/xe_fault_injection: Inject errors=
 in xe_guc_* calls
>=20
> Use the kernel fault injection infrastructure to test error handling
> of xe during driver probe when executing xe_guc_ct_send_recv() /
> xe_guc_mmio_send_recv() so that more code paths are tested, such as
> error handling and unwinding.
>=20
> All xe_init() kind of functions are called just once during driver probe,
> so it is sufficient to fail first/all calls to them. Driver communicates
> with the GuC multiple times, and the real failure can happen at different
> call, hence the need to inject failure in GuC communication functions,
> like guc_mmio_send() or guc_ct_send(), but it can't be just first call or
> all calls, but we need to be able to select specific iteration to fail.
>=20
> To address this problem, an optional input argument is introduced. If the
> argument is not set, an error will be injected in every possible function
> call starting from first up to the max number of iteration defined by
> INJECT_ITERATIONS, currently hardcoded as 100. If the input argument is
> set, an error can be injected at specific function call.
>=20
> Error can be injected using:
> igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
> igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

This patch looks good to me, though I now have a note on the first
patch in this series.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
> Cc: Micha=B3 Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Cavitt Jonathan <jonathan.cavitt@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 74 +++++++++++++++++++++++++++++++-
>  1 file changed, 73 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index e56cdb304..252209308 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -26,7 +26,9 @@
>  #define INJECT_ERRNO	-ENOMEM
>  #define BO_ADDR		0x1a0000
>  #define BO_SIZE		(1024*1024)
> +#define INJECT_ITERATIONS	100
> =20
> +int32_t inject_iters_raw;
>  struct fault_injection_params {
>  	/* @probability: Likelihood of failure injection, in percent. */
>  	uint32_t probability;
> @@ -234,6 +236,38 @@ inject_fault_probe(int fd, char pci_slot[], const ch=
ar function_name[])
>  	injection_list_remove(function_name);
>  }
> =20
> +/**
> + * SUBTEST: probe-fail-guc-%s
> + * Description: inject an error in the injectable function %arg[1] then =
reprobe driver
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_guc_mmio_send_recv:     Inject an error when calling xe_guc_mmio_=
send_recv
> + * @xe_guc_ct_send_recv:       Inject an error when calling xe_guc_ct_se=
nd_recv
> + */
> +static void probe_fail_guc(int fd, char pci_slot[], const char function_=
name[],
> +               struct fault_injection_params *fault_params)
> +{
> +	int iter_start =3D 0, iter_end =3D 0, iter =3D 0;
> +
> +	igt_assert(fault_params);
> +
> +	/* inject_iters_raw will have zero if unset / set to <=3D0 or malformed=
.
> +	   When set to > 0 it will have iteration number and will run single n-=
th
> +	   iteration only.
> +	*/
> +	iter =3D inject_iters_raw;
> +	iter_start =3D iter ? : 0;
> +	iter_end =3D iter ? iter + 1 : INJECT_ITERATIONS;
> +	igt_debug("Injecting error for %d - %d iterations\n", iter_start, iter_=
end);
> +	for (int i =3D iter_start; i < iter_end; i++) {
> +		fault_params->space =3D i;
> +		setup_injection_fault(fault_params);
> +		inject_fault_probe(fd, pci_slot, function_name);
> +		igt_kmod_unbind("xe", pci_slot);
> +	}
> +}
> +
>  /**
>   * SUBTEST: exec-queue-create-fail-%s
>   * Description: inject an error in function %arg[1] used in exec queue c=
reate IOCTL to make it fail
> @@ -408,10 +442,35 @@ oa_add_config_fail(int fd, int sysfs, int devid, co=
nst char function_name[])
>  	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONF=
IG, &config_id), 0);
>  }
> =20
> -igt_main
> +static int opt_handler(int opt, int opt_index, void *data)
> +{
> +	int in_param;
> +	switch (opt) {
> +	case 'I':
> +		/* Update to 0 if not exported / -ve value */
> +		in_param =3D atoi(optarg);
> +		if (!in_param || in_param <=3D 0 || in_param > INJECT_ITERATIONS)
> +			inject_iters_raw =3D 0;
> +		else
> +			inject_iters_raw =3D in_param;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =3D
> +	"  -I\tIf set, an error will be injected at specific function call.\n\
> +	If not set, an error will be injected in every possible function call\
> +	starting from first up to 100.";
> +
> +igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>  {
>  	int fd, sysfs;
>  	struct drm_xe_engine_class_instance *hwe;
> +	struct fault_injection_params fault_params;
>  	static uint32_t devid;
>  	char pci_slot[NAME_MAX];
>  	const struct section {
> @@ -470,6 +529,12 @@ igt_main
>  		{ }
>  	};
> =20
> +	const struct section guc_fail_functions[] =3D {
> +		{ "xe_guc_mmio_send_recv" },
> +		{ "xe_guc_ct_send_recv" },
> +		{ }
> +	};
> +
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
>  		fd =3D drm_open_driver(DRIVER_XE);
> @@ -512,6 +577,13 @@ igt_main
>  		igt_subtest_f("inject-fault-probe-function-%s", s->name)
>  			inject_fault_probe(fd, pci_slot, s->name);
> =20
> +	for (const struct section *s =3D guc_fail_functions; s->name; s++)
> +		igt_subtest_f("probe-fail-guc-%s", s->name) {
> +			memcpy(&fault_params, &default_fault_params,
> +					sizeof(struct fault_injection_params));
> +			probe_fail_guc(fd, pci_slot, s->name, &fault_params);
> +		}
> +
>  	igt_fixture {
>  		close(sysfs);
>  		drm_close_driver(fd);
> --=20
> 2.43.0
>=20
>=20
