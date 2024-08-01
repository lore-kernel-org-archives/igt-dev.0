Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D978DC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 11:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8487810E5E6;
	Thu,  1 Aug 2024 11:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nf8fKHPx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FEE10E5E6
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 11:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722513081; x=1754049081;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ggmlt6tgNCfacy3z6EbEQ8hTLRwztgz1HAeIP87mehI=;
 b=Nf8fKHPx4oOJvZbO8X5i8DaF/1VMU7pt5Yrq/Y3S85/7LELbLBrrZfJq
 lx2OXvPmVm0XkTyoqteTlB5L6OtpgZhkSzf825PEwsyYqQhb3Fgavb631
 9uSoRD6V2Dlwrwn04NkBF3x4w9hKazT57tSxM7Pz6UbDUN3yqaSgky3is
 Sm/AkfAYjbKE7F6tKRVERUbQ/lbg8BdGAJOiCMC7oIugmMtWlDSw52jKH
 X4BeNT/aS5fsQj02iviIRsl1qThpaCWXS4fZLsZbZ+44WvGFhMUSiVMdi
 d7PV41dJjIEqQbPU3q3lbC2sIzQa5VYDyHBWGtok3mHFYoCcTjWqjz+Ut w==;
X-CSE-ConnectionGUID: QLCTR7riQVOU7nb/ixYH6g==
X-CSE-MsgGUID: LWAm40sKT8qY0QcmgDiCvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="45873018"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="45873018"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 04:51:20 -0700
X-CSE-ConnectionGUID: C25ZvfPaRDGvYIm26xvLSg==
X-CSE-MsgGUID: dU9Efg7XQMOei+I3G+G7rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59825310"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 04:51:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 04:51:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 04:51:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 04:51:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 04:51:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlAP3UubP/yjaTOf8PZ5zHXf6G+D71KUrm6afnUVUCC9RXKBCQcF0RnUSG6VH708Q5d7uwLhZid1+syQAsdsLcKzclW/mY2SjjadVhJFarWTnIBu+wI2eflvK8nQ6Ru6Pt9PRvCceY6PBeOjE+ttfcA+lp199pw5DoiS+OUeKnQMGzpJGhAyAIGPOwMDJCctEE9XgNY2J6/yAZtHaRZmYtymQ6l0N+fBclsYJRw8X6uyZNbgOOtLpNL/gba1JF+UXH8bwqNGjk3Yzli49FAWDuoVYYS/fIhba4aeiDeIT7PgQPK5KAgVRtXV84Jsxz34n4q0WiYPVovpt/V6eX6FnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jV2wWKXD5eoEnBQWJ6+cXlbNNBKA3HEXPG17azmMXGo=;
 b=xpWqE4EWpzqWNKPPKs00mbI19xnXaiBEghKR3zO6s9AMjH+o/OH3KKK1BX/cOZNxU9eyKGvZXFqzEI/GNlEz7RihplFfykUcxaPODJ2rWP/naRpY9GcjiDl3+56Cbx8u+HVr8fFIISFlZ2wemmDSbkAr4fB76/eUBcsergEY/cEG/4Y84g0Wqi/hkxekAqoQz5GjiDxEtH5BI0L9hQ34sdqWkWUzCcTgafd2yJdanb48TxoUXpb1nYLecJ77JKSVVSfM3RDNKFa9qk8s7XbKJiNMNjmYazPPJVElqKzDdZ4DeCMhd4rLfLffS5btMt1LH/03HVhNTzk6ITpSaumhcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 IA0PR11MB7305.namprd11.prod.outlook.com (2603:10b6:208:439::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 11:51:16 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 11:51:16 +0000
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
Subject: RE: [PATCH i-g-t v2 11/66] lib/xe_eudebug: Add support for dynamic
 debugger sysfs toggle
Thread-Topic: [PATCH i-g-t v2 11/66] lib/xe_eudebug: Add support for dynamic
 debugger sysfs toggle
Thread-Index: AQHa4nY+eLNQ3cEE10WadYRLutjAhrISTITQ
Date: Thu, 1 Aug 2024 11:51:16 +0000
Message-ID: <DS0PR11MB7264A51F45049B0549092214D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-12-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-12-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|IA0PR11MB7305:EE_
x-ms-office365-filtering-correlation-id: 3d8a29ba-9486-4873-a399-08dcb2204009
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?5ze4rg+ytuPJy7AFm8OJDQvpZKRwdCMOPK0L3Ii0o9CQ3G6la5Z5BEHxUq?=
 =?iso-8859-2?Q?RxAmB4ItCl6XOdMM3DT/LSt0Wh6QrN94PwOWbV2sD2y4nTf7eO0WMC6S9C?=
 =?iso-8859-2?Q?8sOifvaNO4H5UpfH95BtsubnUeI8dkOOmrOvHp/6jXliDuG4A/HEWKeFsw?=
 =?iso-8859-2?Q?NOt2hTw7U2sOv/BqH5uw0lU7z3YzJ/YpmhTdnPVWblxSf0c/zm4LIJKt8x?=
 =?iso-8859-2?Q?tDpNqRfTbaCTVKXsshjBZk+zmVZtgnrXq0N5TIqGShkHU3QzVgmTvTwXoM?=
 =?iso-8859-2?Q?5hTtYT9mWOeTghWHK+Sp80mYho42R/igvTvaJiyW5321B+ck7kxGYDYz8S?=
 =?iso-8859-2?Q?vsdfUWDI3VRzfJjGp9plUuR3mIGgiJRhCBXVc2mHQAYEsifEnwBd3PzHfm?=
 =?iso-8859-2?Q?e8Tk+M7cY1ogoShc6FmRUmiIOCI+LaR/7C5y4W/91937jedR78rI6eobIk?=
 =?iso-8859-2?Q?N5QPnHMdc1Dt+wjY17n7xb4hZaAn6f4nBMV6Fg6BJVwgf9eBlyN+FG/fo+?=
 =?iso-8859-2?Q?DdyBrEG4904RC1sQBBfQp6WRKgnxbz/QINVunmwM36sWFN2MwmEChia9hu?=
 =?iso-8859-2?Q?MfUbwPbQrEcZE04G2kRZaP6Iud+fq61exjqHq39dXz2EK/I+gUXmFB34Po?=
 =?iso-8859-2?Q?LBZYBm3RNAB5+gnJLH2pNFKAsrJqpBzJkgWtfc2V+Y5RJtc80duGtt4Xeb?=
 =?iso-8859-2?Q?jWxKZvYx/fhSaSvngZjBSmlzObYWqrGrJTaVS5x6YKIG1P+k0fJVR+r7R4?=
 =?iso-8859-2?Q?pus8wof4St4W3o0eCogYO6Vp9DouhANKX0creZnUVcl0bZ6q9+nlArMcWH?=
 =?iso-8859-2?Q?xmQwmW76E+f97T4Cfll6Qf+0dwMmnqm9myw1E8aNAUO3GeoSbn8yCfKLUu?=
 =?iso-8859-2?Q?nGtNouXJsN/EaT9FxtdqNWL2NsypCDXd5iOjAuHbqB4breGzaSQQWiyfd2?=
 =?iso-8859-2?Q?7llOT88qAaAtD59ra826U/Oin4imlCltJhypjARKmSFOZxYCGSSNkVYL8Y?=
 =?iso-8859-2?Q?pH4+ecDYzEJ14cRXSmVzDYzNHdQM58angGuBZBuR3Ty2Dbl7twbYWu5D9d?=
 =?iso-8859-2?Q?2CCksLK2iim/dy+LQrMSrYJO1ds4YdwvUGzvc1xDVtnyIC0GAEgLCRi5Vw?=
 =?iso-8859-2?Q?Iauil1DQJu34uV0yRqBYFFb9Q7DlggbvzbXc8eb48cwtkcHyj6JsEVqU2E?=
 =?iso-8859-2?Q?5DfAq3eRURGTsMIVbYIhrVO/2Nncsu2qlqDhCMlMqGY+29I81JaYYobItH?=
 =?iso-8859-2?Q?FXq99fXEIIswfK+vgxaLbQKyEbOgm2RqCyxFPgUxO5H77izQEd4J4zOmzo?=
 =?iso-8859-2?Q?waFWQemc+j9ZecvshMdr2udBUbNdqhL/k9tM27dZ1JFqT4pejQvL+/DKMU?=
 =?iso-8859-2?Q?fk2qZ4bJQzmlQx0Dz22lMkUKg5b7nzKp3FhdnFw0kNO30fVmBOeHWM+D60?=
 =?iso-8859-2?Q?d2OA7QRTZPhtIiluLsvkvrQod4Lo91n+iPgbdA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?3S+Q4UBDsMzfSmype4sjhqkqkQqhwl0gcXx0h8UMwBPYzdcK/57E8kbWqH?=
 =?iso-8859-2?Q?C89zm8yznx70UUKHxRKuNU8rBefihX5mjE3MdHVGfLW4vS+/VqDoUfBS4f?=
 =?iso-8859-2?Q?/7YRtQf56UsrnqJfuwlcEp96GFFr/byWwpk0CmgVQAjn8vPTJuqoZWU+yA?=
 =?iso-8859-2?Q?EbjNtk2cnMCFnXt7py3H3oLibYXnUitrd0oA2+ZHD4eJIBhjb55IIpeQXh?=
 =?iso-8859-2?Q?u2Z0SBfyX+++CHmKn59bE62GDJzgYNdSFb61BJo7Xwh8xKGiHojd2SGI+R?=
 =?iso-8859-2?Q?wEk8GPS2VJ2vzGQXlBspiVjy7dHjnsGr4ULXjyopAg0I6Ij25X8cIQPpnY?=
 =?iso-8859-2?Q?PpTpEUZnZRZ5pt7V2DnF7tFSo3XSnB3FuyOmO/Ds46+Qfwvl++Pq5sc6sY?=
 =?iso-8859-2?Q?9QnxbHSwuTIf0iqALVxGQBH2bQIGRbWkw4ELMnyZURxUJPNizVIyHaz/NQ?=
 =?iso-8859-2?Q?sE3blRWOiwmaJ/Uq3VvvZduqEzJgZJrS5CS68uK6U+QfcIgoI54FwBR81H?=
 =?iso-8859-2?Q?nc6owfucENRXWp/188kHnGfY/UEdlLBOSgow8XyT7fV6JPulH/UgKmfuH9?=
 =?iso-8859-2?Q?iK96GokfTjNruGTxmvKKzmT/YUyeT3/gU7wdAuWOwIMw9zKn+pcBp2fQyB?=
 =?iso-8859-2?Q?13v0DNXnp3C349j8pWjSq4LMUTqPXUHNtTtRTEuK+AS95cdzP14yIhbNBG?=
 =?iso-8859-2?Q?fSShHgLJsvpeXp2N3YPERbfF9/C4HhmMzO2u/UPWfPyHWbD5gO4NgbGHzn?=
 =?iso-8859-2?Q?/32ivb0vGnYDI9QknxeeC2NiyCG2DmZ68lsc5mlebeXGE59aUL6DsTgIk/?=
 =?iso-8859-2?Q?8UWScxsdWaeLqrXg1Ue9rxyW4oPYvffxJnsXM5IRd/tJ7yAXVq4xvfXxpt?=
 =?iso-8859-2?Q?z+s8kWY2Ml857gcDSDbOq4uYMaLvXTxXDR+jERBNA8iO4GCp4f21UtJMel?=
 =?iso-8859-2?Q?rOnn0gc/stClinphlrjCHH13UMZZF8rArRjSSKo8Sb+TtzMBEBP9hHA0Fc?=
 =?iso-8859-2?Q?qWfzySCJwA3YTyxUTcaw4qHeoky4G+YZhOLZL4b4kDmZOcvB12jfp0HV7x?=
 =?iso-8859-2?Q?DhaVbCIzBr+4uV1K+Is26B3oQyPRjnw5jDu7NFU62ik5+ssDV2rvg1qEV4?=
 =?iso-8859-2?Q?U4spt46KDbdR1BfhvqACk/bZKYB9p2bVLI9CqnX2M6yUE6Lt4rSBwQlvO3?=
 =?iso-8859-2?Q?/s1A9XFd7nj54JRJRJwGOxcjApWmQXnD84TEjICMpr3d0WifuDQ0Vesm82?=
 =?iso-8859-2?Q?tkEPb80Q9GdM0H7L3Yy4hipPHBYA7CrwrVjJHsT5hEjO+9Tzk6BAYgUR3T?=
 =?iso-8859-2?Q?YunQwxh2/a6aWbzkY/CwUiuCmdbE+ljFGNxIyF6sKJ6D8hQ9n/pa5MxXWQ?=
 =?iso-8859-2?Q?qxjkKwXDGtH7p0bjzlKG+f/1oAKpLk1CmfJJ/GfK5VL5Xb9W0NGLjXUgjW?=
 =?iso-8859-2?Q?XDtZrU3zAYlu7rLMwQIjiJZUZfrbHk6JWe0W3TOiXWymU9SZtjMibBvy1h?=
 =?iso-8859-2?Q?YSFqSOP2nuUAwH+r9MREeQSu0L2MxhpCXmWkXfPxuweiQirWRIOW4V8Bls?=
 =?iso-8859-2?Q?uVrRBMrWcAWx6bihRRwFlPd3FdGdQNDCsr2F9+KUxFUcTh0myH6VUhixtI?=
 =?iso-8859-2?Q?hGE37j7CYdHPgjQ4R3wO05urZknbhRhmVWrI/ii5knqmKmxDa2xn7gY4Ce?=
 =?iso-8859-2?Q?YXX3FChdS+adYUMyc64=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d8a29ba-9486-4873-a399-08dcb2204009
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 11:51:16.2233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: txyRNZYvwc2WK79CTNjp1gnu1iRPk67Hom746XySiZIZBJlLmvyCjmldYD7r/tpkjU5/TiBq1ClwphgBETKYvWoEG0MRsFpFBylAfZVEf2thHXDqtUei/n/6ow1e7FL/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7305
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

With typo fixed:
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:44 PM
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
> Subject: [PATCH i-g-t v2 11/66] lib/xe_eudebug: Add support for dynamic
> debugger sysfs toggle
>=20
> The debugger now uses a dedicated sysfs entry:
>=20
> /sys/class/drm/card<N>/device/enable_eudebug
>=20
> to toggle the debugger on/off. This change adds helper functons for toggl=
ing

Typo: functions

> the debugger.
>=20
> Signed-off-by: Mika Kuoppala <mika.kuoppala@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 88
> +++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_eudebug.h |  3 ++
>  2 files changed, 91 insertions(+)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c index
> af7cc5fc4..36eef25c7 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -7,10 +7,12 @@
>  #include <poll.h>
>  #include <signal.h>
>  #include <sys/select.h>
> +#include <sys/stat.h>
>  #include <sys/types.h>
>  #include <sys/wait.h>
>=20
>  #include "igt.h"
> +#include "igt_sysfs.h"
>  #include "intel_pat.h"
>  #include "xe_eudebug.h"
>  #include "xe_ioctl.h"
> @@ -1040,6 +1042,24 @@ static void *debugger_worker_loop(void *data)
>  	return NULL;
>  }
>=20
> +/**
> + * xe_eudebug_debugger_available:
> + * @fd: Xe file descriptor
> + *
> + * Returns: true it debugger connection is available, false otherwise.
> + */
> +bool xe_eudebug_debugger_available(int fd) {
> +	struct drm_xe_eudebug_connect param =3D { .pid =3D getpid() };
> +	int debugfd;
> +
> +	debugfd =3D igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT,
> &param);
> +	if (debugfd >=3D 0)
> +		close(debugfd);
> +
> +	return debugfd >=3D 0;
> +}
> +
>  /**
>   * xe_eudebug_debugger_create:
>   * @master_fd: xe client used to open the debugger connection @@ -1563,6
> +1583,74 @@ static void metadata_event(struct xe_eudebug_client *c,
> uint32_t flags,
>  	xe_eudebug_event_log_write(c->log, (void *)&em);  }
>=20
> +static int enable_getset(int fd, bool *old, bool *new) {
> +	static const char * const fname =3D "enable_eudebug";
> +	int ret =3D 0;
> +
> +	int sysfs, device_fd;
> +	bool val_before;
> +	struct stat st;
> +
> +	igt_assert(new || old);
> +
> +	igt_assert_eq(fstat(fd, &st), 0);
> +	sysfs =3D igt_sysfs_open(fd);
> +	if (sysfs < 0)
> +		return -1;
> +
> +	device_fd =3D openat(sysfs, "device", O_DIRECTORY | O_RDONLY);
> +	close(sysfs);
> +	if (device_fd < 0)
> +		return -1;
> +
> +	if (!__igt_sysfs_get_boolean(device_fd, fname, &val_before)) {
> +		ret =3D -1;
> +		goto out;
> +	}
> +
> +	igt_debug("enable_eudebug before: %d\n", val_before);
> +
> +	if (old)
> +		*old =3D val_before;
> +
> +	ret =3D 0;
> +	if (new) {
> +		if (__igt_sysfs_set_boolean(device_fd, fname, *new))
> +			igt_assert_eq(igt_sysfs_get_boolean(device_fd,
> fname), *new);
> +		else
> +			ret =3D -1;
> +	}
> +
> +out:
> +	close(device_fd);
> +	return ret;
> +}
> +
> +/**
> + * xe_eudebug_enable
> + * @fd: xe client
> + * @enable: state toggle - true to enable, false to disable
> + *
> + * Enables/disables eudebug capability by writing to
> + * '/sys/class/drm/card<N>/device/enable_eudebug' sysfs entry.
> + *
> + * Returns: previous toggle value, i.e. true when eudebugging was
> +enabled,
> + * false when eudebugging was disabled.
> + */
> +bool xe_eudebug_enable(int fd, bool enable) {
> +	bool old =3D false;
> +	int ret =3D enable_getset(fd, &old, &enable);
> +
> +	if (ret) {
> +		igt_skip_on(enable);
> +		old =3D false;
> +	}
> +
> +	return old;
> +}
> +
>  /* Eu debugger wrappers around resource creating xe ioctls. */
>=20
>  /**
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h index
> ec75634f5..1343cb25c 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -123,6 +123,7 @@ void xe_eudebug_event_log_compare(struct
> xe_eudebug_event_log *c, struct xe_eude  void
> xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct
> drm_xe_eudebug_event *e);  void
> xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l,
> uint32_t filter);
>=20
> +bool xe_eudebug_debugger_available(int fd);
>  struct xe_eudebug_debugger *
>  xe_eudebug_debugger_create(int xe, uint64_t flags, void *data);  void
> xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d); @@ -146,6
> +147,8 @@ void xe_eudebug_client_wait_stage(struct xe_eudebug_client *c,
> uint64_t stage);  uint64_t xe_eudebug_client_get_seqno(struct
> xe_eudebug_client *c);  void xe_eudebug_client_set_data(struct
> xe_eudebug_client *c, void *ptr);
>=20
> +bool xe_eudebug_enable(int fd, bool enable);
> +
>  int xe_eudebug_client_open_driver(struct xe_eudebug_client *c);  void
> xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd);  uin=
t32_t
> xe_eudebug_client_vm_create(struct xe_eudebug_client *c, int fd,
> --
> 2.34.1

