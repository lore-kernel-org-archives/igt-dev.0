Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C60FC52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 10:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A2010E2DB;
	Tue, 13 Aug 2024 10:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5H1PODc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E2210E2DB
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 10:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723543970; x=1755079970;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3gp3LOVNPcpGrQ7ARJOj+TuU3pU1sAPR4rc0r6cEH64=;
 b=d5H1PODcbM2HBt1FR0UA54gCc6joo8oPTm+gU8blXmvu0muyv2TNZL58
 rr2K4xSrbEnXc6qmXW0gwkkm81qvTCh8WNTSEXJCz0xbZWVvabb+GooC6
 eSZDpVP0vrNqoh5tQT1zrzKMHOYaEoIxBffkVWCGJCK09PNusCuWMjxqP
 q+sgbNppcywZiJgZBzJSyCQg9xaOz2lg+x3rgaHtDpktPyI5ZPOt/Qo7a
 9UiZksHvNNxht/juYlc8uku/1VITXCON2IaDxOTsJOCnpH/YJnBHzNmHm
 Sze9Jj3oA2cP7Qodazzxx2WNBHfoiEqgzGuFv2yvHJ8AGAF+JExZRaRBu A==;
X-CSE-ConnectionGUID: cVDHPglXQ4eC9K1dTQVudw==
X-CSE-MsgGUID: sYNPBrPlTrKyyu2/UdFHhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21840491"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21840491"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 03:12:50 -0700
X-CSE-ConnectionGUID: qvCK0HKaSo6sia+fXvZgqA==
X-CSE-MsgGUID: HEya9kpCQBC2wJcONN7emQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63578043"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 03:12:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 03:12:49 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 03:12:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 03:12:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 03:12:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIEJbIIKZWyNnXnhLhLs1ZoJZH+M7n8YQjoyX3TOPofPJySsg6oEPJCgVNd0IvqpNccj5f6IWY7hvjA9HSTx2URe9oxnXZnz9PNf7i9MyaBBqteKa3zMXmtFecRAgw00ntRDxOGQUyYI7HcDIzKQmoXIY2XwfZhhM28wt2HnKFRkXAa2tyKkiNBHOY9PxOKyZrpzwZI4Kaj+MubdCstRsfazZQqS1WSV56ZO9gE5ahO3/xc0O9zM/ka75tmFjN5ivDvgYOdf1GwhZlw+mZ6aqbPn5cnd4WsimxmwV/9cFeTPYwS2LggQPAxTOLymux+zOZ2cnuMEnctmJXipggNrGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrJyJObfAAhZC6aD7CbRRL9RMRm8E7PQHRxYlU7xQHU=;
 b=HYyugml8o7ifFFYJlD/mlkllo3uk8sOfU/VxDpF24MARapIbWmFVNUndWhKD45MlxDmUcvRIwZwgCTbNI15rahLEby+V9oTQBCAaGdHVnv3Ku5mhmI5mZQ96KteU7RfimDwU2dhUAbISM2ET3BKo1oFSNa45ORGqRw9Z48e3aRu8Y7hlN5yMAC8VJS66KIAUc4j7/EiN28VTZVn2iPHfINeyJkQkwxNrID6YDqdv2sg6bqNBwuGbZNXndfEfQ2z/4mcEYtROeJv2YvEHuIiSqn4QN6LkuTKy27Kh9IK7b0QglDcy9aQVP/vrtKuYDYREeJYUEqUBtrux24/Fg+oK1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by PH8PR11MB6563.namprd11.prod.outlook.com (2603:10b6:510:1c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Tue, 13 Aug
 2024 10:12:41 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%3]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 10:12:41 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH 2/2] tests/intel: Adopt igt_sysfs_engines dependent tests
 to use query engine class
Thread-Topic: [PATCH 2/2] tests/intel: Adopt igt_sysfs_engines dependent tests
 to use query engine class
Thread-Index: AQHa7O+zw8KCfD3t0UOokMzK/jihfrIk+MOQ
Date: Tue, 13 Aug 2024 10:12:41 +0000
Message-ID: <MW3PR11MB4748B492B605943390F77246AE862@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240812194136.6352-1-sai.gowtham.ch@intel.com>
 <20240812194136.6352-3-sai.gowtham.ch@intel.com>
In-Reply-To: <20240812194136.6352-3-sai.gowtham.ch@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|PH8PR11MB6563:EE_
x-ms-office365-filtering-correlation-id: b6741cdc-524d-4b90-051a-08dcbb807752
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Hb1kLi9MA4IFZXNirpL9Y/IcARtfzeLk9U89/s0vyk257iBpFHuDBaSe0J//?=
 =?us-ascii?Q?Xi8f75gNgjFDzS6AQaayNY9CrkuzvB7KQM7wJxsCFTLqS24Gj7+d9wakZUBw?=
 =?us-ascii?Q?xUHPvF9vkQ2FUV0IKtpvqvyhGG5UPVQrrNQy9E8ilhTirWN0WfB4GjmeH7cw?=
 =?us-ascii?Q?gja7icw0jn5jgQeX8uRlqM5DZ9Ose7XXuESwv6/AwWzAyGkXjr6dHXf3kNi1?=
 =?us-ascii?Q?vt/6qpeajlrXXFn2gf1mJf2v7hkIKPDTGXkYT8wMajTU1eo9U8GaToa3B3xY?=
 =?us-ascii?Q?EMXyySztRgP5cJJFBdsYmF4NjhxBfZQasYlCy0GgQZ1kpM+3HMGqAwIx/f08?=
 =?us-ascii?Q?nVG0yfK2/mQnS5ex1VQMNAciXHlmeiEcPz/4ISH7HmCVQXj8qsjq26Pu7/Hl?=
 =?us-ascii?Q?D4AZWwDkLaPgwijIiuOsmyItRjuwd6L+19VVDWtbYYhfcKQ7NFDxEbt2uSHp?=
 =?us-ascii?Q?rEvfq3vQSlIFtR0XX73ELpbLQF5c0NDdJPpmVp8zPADR2/X3UOwymovIDQNi?=
 =?us-ascii?Q?e5sSa+4jtfPu/3MfkXgy0K4c6Bv5a4fHI6UvZs+jbCq9CwTgQJSlNOHAyEBe?=
 =?us-ascii?Q?OTE+ofxo9w0Yc5kTo6YOp//LWCB8d1DY+KUgXsX1rcwxDm3VhVfwgRWWPUUL?=
 =?us-ascii?Q?qlRLepVXRDqvZmyL8SsvZWqMDpRwX0XEIB7YUja7lohwxtCZO8dynmfekyDk?=
 =?us-ascii?Q?ddIYoLgB7rfEzWT1uMMGeY67v5ETpcFIzkmgPqpUrZX/vs1T7uE/FPrFVpg9?=
 =?us-ascii?Q?yYwU6QTvKN+d3azYuKh0V76m0mYV40R34x17aGdeAUQH5XCpiwNP10iTmjUZ?=
 =?us-ascii?Q?U9fS+bxk5DGvkUwi1bka4C5V5CncOmktPTf+WI7fF1sTJlJqbHp3zLvcS7fX?=
 =?us-ascii?Q?Ik3pV/CNoXOfyxEx1QK+7ztWp6bPadCGcqfXI9TQ4+Lto40jQo0PJwFMqF1G?=
 =?us-ascii?Q?VcdFV1YcoFPM2dRRcJqenN+/cWIvqZ0nGm+W1Lam5KXQwK2LUf7vJdbLfE/w?=
 =?us-ascii?Q?1Zj9a0p/XvnKwwPuLvB1VsPHX1D7VDm+MzMg6gnjJ2aPrtglx0i2IwgPUK5X?=
 =?us-ascii?Q?dWhBmxngh9fufiDbU63Rj3TuyrWt7vEsz6vxZXYSrb5wBeqyxysZP1k8YLLn?=
 =?us-ascii?Q?KBJb9EZAS0XXElCOp746AumleWVgLCHAA71G58sIWxlUS0J+jkTxWcEjACSU?=
 =?us-ascii?Q?6YAPi6M/f9odaqQNpQ30YgdiSgaDO/1rBlwm3uwJVRd74IxJOeYcUT4of/eG?=
 =?us-ascii?Q?Ufh8SvZlFOEPd1NGVCtsk9+D2Aj+2v1fchSRY0UJ2cR4SrcuSPriDEFS5li+?=
 =?us-ascii?Q?MLgTgIpQr3l4u6YZ1vklxB9jB1tdtEc2/auVjTQZBeLsVzLUf9R11WqmCSCn?=
 =?us-ascii?Q?wD7/9w7GUcD1t5Uuyko/kSBdGOHKurZAq+J3SqYukGfKLCVyZw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NiZE3+CXv1wS2fGeYAEg9D7+vdFWYjxB74i+tS0XlDGo3IjMivlNjN2A5lCl?=
 =?us-ascii?Q?mEKNqoFllxoXRjOa85l4DdDyhh8a/YUQJlTju2uiW8sfn6oduc0Mrhumtm8v?=
 =?us-ascii?Q?xfHa+cJNcAzpeLwlzMG/0nCKXlZmAQgVXxWe9Y3Gjvj8fQ41f+v7NZviI38C?=
 =?us-ascii?Q?Kgq5mwxue2fv+1vZP9/Q5n8KlLWYmZPgFD2JN9IxlEf+B5xCe+yTjo7bdsf5?=
 =?us-ascii?Q?/vv1p2a9Ug1CpvFjK+ycGzf5QDwbUuZ2/GVmo1ulT8tb2hu/tVcX2gj04S1J?=
 =?us-ascii?Q?ZVasLDB5YpwK06RNoTqJG13FcXMr6UxEiD+yTTsIZSjpNKUO/3O63FqHJT2W?=
 =?us-ascii?Q?a3CFh8xrLechqsJ3K8w9QnwoYkRebBARv3tlcy4J1PBLDekSawmSuXWRH2x5?=
 =?us-ascii?Q?yv3uBJBRW26egdN6mLo1zns+G72rB2etC+9K+vIKtJWYfYZ+SHAVMr8S/rwT?=
 =?us-ascii?Q?ODgHBbpN/6zniutc2a/fDS6+pX4Qdm0SSsUFahb+g24q/ESl2AwtE8m236fH?=
 =?us-ascii?Q?gJ4NAf3uPnZAS72sPZ/muNM+y6QGBbEdzoG/5XeON1VruLbIn/FtsOWUkW6R?=
 =?us-ascii?Q?jZPc5rQZ2vo8t3BLodND6VhHddzh/xzVaCbX9j8vrXWwq0BO4DV+QDOWKBUj?=
 =?us-ascii?Q?W0p2d+44AglsvfGzZN8eSpo2VeNbGIU7rX9cR56vfkLl1s9cxpK5tzuTWqLQ?=
 =?us-ascii?Q?jejZgtiZ7dfEwIZ1G3SRwKVDOrzII4sMVF7PnCvsNd8A4cGXYPPA5KLggC2B?=
 =?us-ascii?Q?QZ+AIW1RyB9WHIYSiaDM3tqX/qy2de4ORIdH4I1h7v2fqhPocIdFO0KOBvKC?=
 =?us-ascii?Q?La69XTuFsehsVBKbaTrpaEVYmes9n6DbAOTJ4v5CyvoRdF6xqWKSPW04dYIm?=
 =?us-ascii?Q?+eykpuxX+6xyvXVRRFBYdunlf3umoZwMLVehUy8E0A8BTWV+4mjcqyK7zQIR?=
 =?us-ascii?Q?oCZZnN2KuXQQahfgk7KkAyzXciLuY0ftEBIT4ShfVdKMh7bGfSXF4DzD00Z0?=
 =?us-ascii?Q?L+0sp6iipddQ13aqJjhDLAQ+Oo5GPgftPUtW0XhV1f9lKgEn0dG4+S0WbKYk?=
 =?us-ascii?Q?zaMIu8k2nINb5gIVqnFd03Yt3bwin5XsehqkskSPz1UNp8k0GaLiawgxi+wq?=
 =?us-ascii?Q?q2SXr24dhcF1FQOd1Gj+YGNt7oCikUZUJxJ+P8tPPwIiV/HGzYfXNJkKsL1X?=
 =?us-ascii?Q?Bx3yieUEjCyM9Gv+1f0bzdDUCM5hjyrX4kHcmunLL/SpPYmZmYNenQJWTQZU?=
 =?us-ascii?Q?7wd612piPKtbhiyhMtDdeu6JgJCzzsLVF8k8zGmrbOmiaqmM7QZAUeGhxpRm?=
 =?us-ascii?Q?/hQsXWjfH6o1ytHP9LTAFngFa64gM35mLPMvIr06fSXrIKzuUVMt7sztlmr5?=
 =?us-ascii?Q?Wv+g3OzD5D7ICAgD2vOAiB6UP5sBuwJ37Bxv7+OKKGZu/+6qrV3Sd5a+rnCB?=
 =?us-ascii?Q?/T4aZknknTetjNJWXO3nIzXjdspCVnHdueztmnjzJeFerkIrZuYKjOwPKgYc?=
 =?us-ascii?Q?Q16an3X4LZbptZVcdFxdnL8ElAgGt8keEoTwhu2YSY1z+W6Q+U5YFPqb/hFW?=
 =?us-ascii?Q?nEHx65x7P08uj+WC4qvOw7OWtkkXy+zX3+h2RVO0AEXFsuxyDIFNAZdRYXHe?=
 =?us-ascii?Q?eA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6741cdc-524d-4b90-051a-08dcbb807752
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 10:12:41.1230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +rmP4xFGdLM9fHtuqJzb4fOe25CVEQHzqCK0ciLoNsM0G6mH3qGIaNO76yBAhEHI0ev8Dy0YroGkfdfBZR5UNyxEPMa0iXvDrPAPpwT++po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6563
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

LGTM
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> sai.gowtham.ch@intel.com
> Sent: Tuesday, August 13, 2024 1:12 AM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [PATCH 2/2] tests/intel: Adopt igt_sysfs_engines dependent tests=
 to use
> query engine class
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Adopt igt_sysfs_engines denpendent tests to query engine class based on t=
he
> updated sysfs engines queried.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_queue_property.c |  7 ++++---
>  tests/intel/xe_sysfs_defaults.c      |  5 +++--
>  tests/intel/xe_sysfs_scheduler.c     | 10 ++++++----
>  3 files changed, 13 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_queue_property.c
> b/tests/intel/xe_exec_queue_property.c
> index 3edab0af5..25a7e7abb 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -64,7 +64,8 @@ static void test_set_property(int xe, int property_name=
,
>  					     &exec_queue_id), err_val);
>  }
>=20
> -static void test_property_min_max(int xe, int engine, const char **prope=
rty)
> +static void test_property_min_max(int xe, int engine, const char **prope=
rty,
> +				  uint16_t class, int gt)
>  {
>  	unsigned int max;
>  	unsigned int min;
> @@ -198,7 +199,7 @@ igt_main
>  {
>  	static const struct {
>  		const char *name;
> -		void (*fn)(int, int, const char **);
> +		void (*fn)(int, int, const char **, uint16_t, int);
>  	} tests[] =3D {{"property-min-max", test_property_min_max}, {} };
>=20
>  	const char *property[][3] =3D { {"timeslice_duration_us",
> "timeslice_duration_min", "timeslice_duration_max"}, @@ -257,7 +258,7 @@
> igt_main
>  						engines_fd =3D openat(gt_fd,
> "engines", O_RDONLY);
>  						igt_require(engines_fd !=3D -1);
>=20
> -						igt_sysfs_engines(xe,
> engines_fd, property[i], t->fn);
> +						igt_sysfs_engines(xe,
> engines_fd, 0, 0, property[i], t->fn);
>  						close(engines_fd);
>  						close(gt_fd);
>  					}
> diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defau=
lts.c
> index 1777158d5..393e56651 100644
> --- a/tests/intel/xe_sysfs_defaults.c
> +++ b/tests/intel/xe_sysfs_defaults.c
> @@ -28,7 +28,8 @@
>  #include "xe_drm.h"
>  #include "xe/xe_query.h"
>=20
> -static void test_defaults(int xe, int engine, const char **property)
> +static void test_defaults(int xe, int engine, const char **property,
> +			  uint16_t class, int gt)
>  {
>  	struct dirent *de;
>  	uint64_t property_value;
> @@ -81,7 +82,7 @@ igt_main
>  			engines_fd =3D openat(gt_fd, "engines", O_RDONLY);
>  			igt_require(engines_fd !=3D -1);
>=20
> -			igt_sysfs_engines(xe, engines_fd, NULL, test_defaults);
> +			igt_sysfs_engines(xe, engines_fd, 0, 0, NULL,
> test_defaults);
>=20
>  			close(engines_fd);
>  			 close(gt_fd);
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_sche=
duler.c
> index 979ce95d2..947dbdbc9 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -37,7 +37,8 @@
>  #include "xe_drm.h"
>  #include "xe/xe_query.h"
>=20
> -static void test_invalid(int xe, int engine, const char **property)
> +static void test_invalid(int xe, int engine, const char **property,
> +			 uint16_t class, int gt)
>  {
>  	unsigned int saved, set;
>  	unsigned int min, max;
> @@ -57,7 +58,8 @@ static void test_invalid(int xe, int engine, const char
> **property)
>  	igt_assert_eq(set, saved);
>  }
>=20
> -static void test_min_max(int xe, int engine, const char **property)
> +static void test_min_max(int xe, int engine, const char **property,
> +			 uint16_t class, int gt)
>  {
>  	unsigned int default_max, max;
>  	unsigned int default_min, min;
> @@ -113,7 +115,7 @@ igt_main
>  {
>  	static const struct {
>  		const char *name;
> -		void (*fn)(int, int, const char **);
> +		void (*fn)(int, int, const char **, uint16_t, int);
>  	} tests[] =3D {
>  		{ "invalid", test_invalid },
>  		{ "min-max", test_min_max },
> @@ -150,7 +152,7 @@ igt_main
>  					engines_fd =3D openat(gt_fd, "engines",
> O_RDONLY);
>  					igt_require(engines_fd !=3D -1);
>=20
> -					igt_sysfs_engines(xe, engines_fd,
> property[i], t->fn);
> +					igt_sysfs_engines(xe, engines_fd, 0, 0,
> property[i], t->fn);
>  					close(engines_fd);
>  					close(gt_fd);
>  				}
> --
> 2.39.1

