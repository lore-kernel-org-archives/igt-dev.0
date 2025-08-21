Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA7DCA0EEB
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 09:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A9410E8C3;
	Thu, 21 Aug 2025 09:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3WLWivw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D5D10E8C3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Aug 2025 09:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755767435; x=1787303435;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2V0hotRC44SaIuRSUQKKnrxHx/6pxWtF/xtFt1GcC8U=;
 b=F3WLWivwMK1PRPNH+3mQ5PYXjt0EuuTvN2oLthMSFp1wKwWpPBtr9LsN
 EUQcO0AsjmScrvbxJkDTdiksFloj5mvKZR++swMOW+wSOW7o/KJ0SZoyN
 DTBeSXpyIiUVQThuAMqvZGpLgl8lE83sAwj5NmhLQz88CH1C7qTI7XZXy
 xw0MaFXAPOMr/zPyDH1N/3r+3uyaaB/YTvSS9HmiGhwuK4CWus466HOop
 JVblo4sGaROpd4cfEkSHBac5Tnak19S9vwkQxQiTw7pkZPyPRBiHN7Xs6
 bqEIZFe5Slvs26AmGoKPtPEk+ejm3PMYtyTO/q6jROjULbsp3T7UlJLOS g==;
X-CSE-ConnectionGUID: KLvsH1BPT0SMX2l0pb6NQQ==
X-CSE-MsgGUID: 9M63TZKUT9i+Wmg7F59STA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58119584"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="58119584"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 02:10:34 -0700
X-CSE-ConnectionGUID: jDnVl6SsSdGQnx+S4JsadA==
X-CSE-MsgGUID: hhPohfBqTqO/1uXfrOPmxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="192045202"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 02:10:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 02:10:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 02:10:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.59)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 02:10:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nehKaGtHbMoEXEOu/ujs7zDZJuhEOtbQDKWVO1L7PnNeoTOsIP0579PzSLOxSdbsR9NVZvNV9E1LZXcKMIv50hVJnq6Ja33NE2oPJ3Fv07EEprQM4D9X/xunBIj4MdhnVV8ACtHO1+Yk7WBLEw/wT9P+G6iDjeb8v0BpExHJGIJODxM0EdrD4/0Vxoz5AprTEfGpWmL+0gwqHlTmNVmXNTjn7xHzutnZDqbMMRhKGj/8lFztLy1BbiXLNFfqUT7knPEHAAElZ772eyXHyJtypUUTyHv6iXKDnQMATsw8TGypRJNzvF8fZfz2rhooIOgB/5pQgxzkk3PhR85bmNIqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2V0hotRC44SaIuRSUQKKnrxHx/6pxWtF/xtFt1GcC8U=;
 b=UG/+nydjZSSRRZRXkEXUMm2BCh4PdVchLFQAf7I6+Om/8lXDEwZN5rNcf0oK1KK7zo8j97+8AUBZQKfeGnZYkQX8lQ+whuxhdtXTsIArHSeAPANqbfW6MISP4dxm0/AzphxsUNQpL/u0TWxoeX0zYyxaCg5G6L4LgYETG+lJght+i1E2NiNGM9b6AzWZSo9r4RODTfD8GeaQK0sgEa7oSwxXga2a7zzQxA1QA4xzT4lyNHG05d/uu9zzzXmfnABop8tCbahxYlVGwo3+CYpzp/WG8znjT78N3dGXrbYvBvt/W1vLIkBXQALaw3kd+rpA/uZY1XqqpzCuXvJzSXqv7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6268.namprd11.prod.outlook.com (2603:10b6:208:3e4::8)
 by IA3PR11MB9274.namprd11.prod.outlook.com (2603:10b6:208:578::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 09:10:27 +0000
Received: from IA1PR11MB6268.namprd11.prod.outlook.com
 ([fe80::7149:569a:183a:f3c9]) by IA1PR11MB6268.namprd11.prod.outlook.com
 ([fe80::7149:569a:183a:f3c9%3]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 09:10:27 +0000
From: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Santa, Carlos" <carlos.santa@intel.com>, "Sebinraj, S"
 <s.sebinraj@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t] tools/xe_gpu_frequency: Add tool to set/get Intel
 GPU frequency for Xe
Thread-Topic: [PATCH i-g-t] tools/xe_gpu_frequency: Add tool to set/get Intel
 GPU frequency for Xe
Thread-Index: AQHcEdVB76OI3OYOX0OdS//gtyYw4LRrvTUAgAEUmi4=
Date: Thu, 21 Aug 2025 09:10:26 +0000
Message-ID: <IA1PR11MB6268A74F8E0560EDE84E03BBED32A@IA1PR11MB6268.namprd11.prod.outlook.com>
References: <20250820125121.1387843-1-jeevaka.badrappan@intel.com>
 <20250820163528.trzmxfbwojmg74p6@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250820163528.trzmxfbwojmg74p6@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6268:EE_|IA3PR11MB9274:EE_
x-ms-office365-filtering-correlation-id: c0c79b6d-5900-4208-697b-08dde09291a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?gwQVOuq9At5v4g4iqv7XuTvaiw4/afni4K7PohYQVY2oY12U0HercaRxVm?=
 =?iso-8859-1?Q?2X6NsySurId1zyLBqmo+mjsC+cMJ7pGXjtoxf6kkvDsHrKnEi4mhV4VLmk?=
 =?iso-8859-1?Q?2e45U4J2h5nEXFNgfwwdOID6+RZbOfGL07Eln9XZK8LUWzEFS9Fw98XDfH?=
 =?iso-8859-1?Q?6wXL/StpLfVFBD0vPWsdKCvQubtPkzQwSIRNsXbOZzLRO/F/ywfYj0eCcW?=
 =?iso-8859-1?Q?C+8dLqvSpJ3zGbQj431WwfWybddpqgsTqGxr0OczkE3NZttobn59U60ZO2?=
 =?iso-8859-1?Q?deZMX4AXuEq3xJyrk9T7TFEdoj8WBcxQ7tHl4wwIyVbarWwS3JamFcIt1c?=
 =?iso-8859-1?Q?zbjKN6eWRcY6kvwC1rUKwT3FwF8r14X4lQNGkNUJz7A+RHdj+3w7fCUV9y?=
 =?iso-8859-1?Q?6bIPksmvIqoDU+D9D2MgmMHJVzyZPL3X1Umu79UBam7OSUFH1/pg6VBK78?=
 =?iso-8859-1?Q?7mZ7PauSfBIThDwI9dSrclRoBXMRNzhmtlCeV2vP+rnsK4PQRGQKrGKaaF?=
 =?iso-8859-1?Q?DyXuYyLP8i/f8ylF9Y2OduCnxoNGowQQSm8lN4dPlWQX790xs05CsUKmX/?=
 =?iso-8859-1?Q?LIcEXK0Yf34OED/Tw0lln/zgZntyPiQ+SnsCI+UOcwfTpgfnKvA1rqtm5H?=
 =?iso-8859-1?Q?KcLJW2iiojZ+DZ+ajf7CTWBPCDMDoUozD7uHuB1nZ/ksK99HoKAWfs7cIQ?=
 =?iso-8859-1?Q?XmOf+QKTDiu0DnW81gzJh1w8iC6GBTmJm9hQswhfXu7E5xLDuDYBJwFvEi?=
 =?iso-8859-1?Q?dcJvNrf9toMKo1iIy3YpBbWz4jDOhcMi8zqPCc+Kp1AK5mIXHDv/YZ/0q9?=
 =?iso-8859-1?Q?xlMLjRaVNgeLFP68IM75bbKSGhvygVILNZJiG36cXsVlRBGCZld4/wMWEh?=
 =?iso-8859-1?Q?VKrmgsZbKr8bSp9d0qUkyWirERoZRmXcmkFsfAr0aJOTXu3AqL4w7e2fLK?=
 =?iso-8859-1?Q?fFXp2J36QclmyU8Nn/hili1FGTwrS/jYfzv+n8BSpSWS5rymeGOUltTIaK?=
 =?iso-8859-1?Q?7XMVpoosYM9Nl4sbYFmqnG+hAM5m8d0RPrHKM/CBYCC6u2bupBTzKS9lZw?=
 =?iso-8859-1?Q?PjjUNo1b62rtngYmEnht/lXVulfswQt62pkOrMTg5fbGr+Z4cwrYM9J2uH?=
 =?iso-8859-1?Q?fwkcAE1G4LFmFWDRLUY8UbIIirkqwBejeAYrgnB4fX6u16ToVk6bZiInkc?=
 =?iso-8859-1?Q?VOSDgL0LdTCdFiYN5CGbBojkbEKdOR4U8jZpioNlfu783jnzJBwe86O2YB?=
 =?iso-8859-1?Q?+dHKODNlXISdKevW+d20ivzO3YRENdEWeKfigb4i1lqbvF9KbXuXo0068X?=
 =?iso-8859-1?Q?s6sf00RzQiMBfifEix2E2R3kmCVfW0ftPtzoVsKJAn92ZrGvVTH2LjvN4V?=
 =?iso-8859-1?Q?OneOJdsPAkVdM8iwjdT74wns4fEhiyDudtuWZ6eepMVmM/vMroRfobsLvY?=
 =?iso-8859-1?Q?uZ3BTD2YihbnY3WrqT4z3Pl1ObIHtY9l6OzcDOkDMWhmDAq2dc7hc/MH5+?=
 =?iso-8859-1?Q?+7TmDcy+KLwAIZxG4dpNMeUzvc6RnwenJpiijd7cHyRQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6268.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Py2uDLdn4vsJROIjFnfmohxN/IOUcKrk26Dr+18zPoeaqH01hRueVN6WJR?=
 =?iso-8859-1?Q?7j6iUTVKz6OQWtLx7O6Y5fyiDKkVPelAsYRJPRQXZNobuXGfOlPWBtZtzw?=
 =?iso-8859-1?Q?SFpDXxPLvLC0dVmvSeeRj9cX83aIziuoWz+7JPMDScTZ4c1j6SQ93TfyOX?=
 =?iso-8859-1?Q?XW8XNv0H0A82hciTgYI1sWosrJ67V3c8XLsfV4IAFdY3NBHVS46tRWSOEP?=
 =?iso-8859-1?Q?FjoIaqWBXnxiBWBdtNxUPjkoDhMqZRUFe4vqDoqxztOLm1Q6d2ohbqoOvY?=
 =?iso-8859-1?Q?gJ7DPRRcP9D4I+vtr83FrH/ypqNi+WBwpdwp1gP0qQ/Xxlar0ETjOQHFvo?=
 =?iso-8859-1?Q?nzAMfWphLmPYmnJkSm06oZmYIWICLL1LCVNm9u52spgZPIrGtSnQZVLSZt?=
 =?iso-8859-1?Q?St01cEdSe/zUzlX1oRQyEuszjGnyqb4gCjTv/cT9PJkBng0HW+GsqiJ4Ni?=
 =?iso-8859-1?Q?OEJpc26U6IeTT4iVOBYbDhtLyH/jwn7kFpzZu6z3ARCt0qFELBqFUWHf13?=
 =?iso-8859-1?Q?UNytA2OwYwaa0JfJA/SOiGi+3a5np0NW2UlFIxOhz9ZEwe3mb+WIZ9W2G4?=
 =?iso-8859-1?Q?OC5GtRhmvv+ZlTeUMJ62kIqd8CBDIL/D4kOQMRHxCv1LtZFJV86z+lfW0E?=
 =?iso-8859-1?Q?6B0+Rc0X2EDWfviWE0En8FwJkbnJcS+C6sJNnpv27cdIWlTD8nm+XQ3/BL?=
 =?iso-8859-1?Q?vptKPgqNIb44Lp2LmPYjir4q4fmonqJRmSalMoW8qmaEx6nmR5MGL91D2l?=
 =?iso-8859-1?Q?yZCiEzhB/ln/OBrGLEUJDDud/38fydmMxO6V1z2hKNvRSxDYWDDfYZKR6E?=
 =?iso-8859-1?Q?KeVTCt23uNgFX14tqusJR+hbJymIfkDwmjkKqc4Q3yoSQ52rXeqdRN4LqW?=
 =?iso-8859-1?Q?zR+HFOKChDBatr7pzTsodEi/ukKGLGZskVk2Gx6IpjcfcD+VvkI3cqhf0s?=
 =?iso-8859-1?Q?tDrqy05qP5DqgIJpfHHHx98xWawAd3pmrVLwYP+V+I7A63stuIzJ+NplvX?=
 =?iso-8859-1?Q?1JMZEpRcDoLJ+Z60EU5/UF/Nvin5qwDlfW4e+7X3bEgU4NpYsnyysZtsZ3?=
 =?iso-8859-1?Q?Vbr6mMEdS/s8c3bmUaiI4yvrXWvXV3kvEkUBre/kGSPO6E+difRxXeox9u?=
 =?iso-8859-1?Q?4Y388oOT8sJ7+D0suuNPNPnwBdlvBBSum9hKKyoF0jG692vIbdh86vxlCu?=
 =?iso-8859-1?Q?hU0iA6+prY0m44ekm8nW9IaxzflFUFuDtOLy3I1B+OErKMKVXNSRvYwOd2?=
 =?iso-8859-1?Q?x3L26Vu+zdXzUS1glagcM/QCcSZDpXrsJfk6NS0GAMxwwHc7T81+jA9HTn?=
 =?iso-8859-1?Q?Az0PjAsYxFL4LJZ9J7a6IFKZJcVx5p4U+P/JhMl+JcRiAYOoJJUNF8qXjL?=
 =?iso-8859-1?Q?8XYhqVaXAv9QwQGN5mGdqtVB+xqhXc3oxagGEcWb9LUuyvxYxOntmLd21+?=
 =?iso-8859-1?Q?cs64TUWOo/AcomK0loKTplOGnsxRM23dbmRlvcb/SuAAfxiyWTFjWOKYzU?=
 =?iso-8859-1?Q?rbBfRIRzdswcZvgeWyu9f8yvlSX+HZMKKPKZeQ4xFU83DeXBynvDe+/Xpf?=
 =?iso-8859-1?Q?cC8h2mfWXpcp7p7wBVXp0XUUNQZgrqoxHCUMzPmH1qyEOppcxM2Egq/aBd?=
 =?iso-8859-1?Q?rNCPYUdhQGawlZ7iNAqinZj8w6PrVt/Brq?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6268.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c79b6d-5900-4208-697b-08dde09291a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 09:10:26.9670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w03F0sXw1N2I9C5Qbo/I3owmTrlWYTpoL5oP5Ep3MeoBX9hm3MhhVYke19JjN1pO8UD8PjzWVQes7t+f7Ehgf4y89DlOgYhjugA8VMulp/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9274
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

Hi Kamil,=0A=
=0A=
> Please consider improving already existing tool intel_gpu_frequency inste=
ad of copy-paste.=0A=
=0A=
There were 2 solutions considered:=0A=
1. Add support for Xe driver to the existing intel_gpu_frequency=0A=
2. Separate tool that will build on intel_gpu_frequency but specific to Xe =
driver=0A=
=0A=
2nd solution was chosen for the below reasons:=0A=
- sysfs frequency path for i915 and Xe is different.=0A=
- tile and gt needs to be taken into consideration.=0A=
- Might not be accepted due to readability because of device type checks, n=
ame based on device types, extending i915 tool to support Xe driver.=0A=
=0A=
If the recommendation is to extend intel_gpu_frequency, can provide a patch=
 that adds supports for Xe driver to existing intel_gpu_frequency tool. Ple=
ase confirm.=0A=
=0A=
> Please do not write exact output here, it could be in cover=0A=
=0A=
> letter but rather not in commit message. You could add how=0A=
=0A=
> it could be called into examples, when program is called with=0A=
=0A=
> --help=0A=
=0A=
Will address in next patch set.=0A=
=0A=
=0A=
> +/*=0A=
=0A=
> + * Copyright =A9 2025 Intel Corporation=0A=
=0A=
> + *=0A=
=0A=
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a=0A=
=0A=
=0A=
=0A=
> We use SPDX licence, please look into few other tools/tests which uses th=
em.=0A=
=0A=
Will address in next patch set.=0A=
=0A=
Regards,=0A=
Jeevaka=0A=
