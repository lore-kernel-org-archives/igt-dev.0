Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD13C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 12:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0828110E939;
	Thu,  1 Aug 2024 12:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUtKfi8V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D83610E939
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 12:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722515294; x=1754051294;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lTpIeXrH9AM2DkOG7wHzo7DzZZr9LDH3Lqen6llCowY=;
 b=ZUtKfi8VYwjcqBj/RhZ9u/fAlHVTzCTGNpUyhvekiUGgmcuHmmdThmVp
 uqy6KJycbv1pZMslvhWy9VNjk9c84FWQ9X32zKOafNP2ENu1g8IcjPGeM
 QqPR57pRA5CP+3Ag2Ql9U/HxH9IK1ulVHm7z0mQM456MSLd9czcyoarJ5
 PeWpQzW8dVnx1JiRmLuTb0JlYqPZWbYYr6sHB8hVkZsVGzNE/5nzBxdMY
 ybNz6Dzbd3zrc9b80W9LvhP4Kc0wAek8IiuQqBXwA+/1XHT1Wj9fSLmPd
 8m1jkf9hJ8i5MTmZGK15d3Shlsyrv4JtivBrA7SoHQ/DUOBSOlVX5EQBD g==;
X-CSE-ConnectionGUID: KYtdOvfwTpq2iv0xWXh9JA==
X-CSE-MsgGUID: wFQdVxhDRIaEZfdXycR1zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="12827320"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="12827320"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:28:14 -0700
X-CSE-ConnectionGUID: vz/0xcsuTaOtXAodrObtQw==
X-CSE-MsgGUID: atT2G/PsSqC8ZjuitccaRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="85936949"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 05:28:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:28:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:28:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 05:28:13 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 05:28:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZYLj7W031eVRG2dzrZAwR2IYPls5+7NVEiP8a4O+I7Y0sT/QoVDoSXv2/vIlc/ZTfil/Kk3pO4mN6fbgQEdq4j4VzA//uTVzLPere3a691vSvxJZ6WnBklBr/4hi5UakTeCTFXf1gjl4UPgofijDGAbFeoYbjLescQhET6eVuVjjbOPA5Uyb8IgIYZ+VGaMVqG8bW2HRZAlslh1S9kIYOmG4tuEGyLqCdfFI0IJN+Fjc1KQBnLVZQ1x7ALQLr8fZ+jjVn1U3nqxoiMkYcxx0btHgC7zm2wlyg0ym7SgROJZgyhL1PuiYZOXYOEZxyJeP9Rz4YMKFUFSEFcinpENqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyCWpQXwnyFtkH2Ii9kRLpJTstGl8Mnvyuzp0cLlIbo=;
 b=zHI8xWlslPVgm+mhStqhloXXIXOWq6kxgBUfR2mDZsMYs8jf+/9ikYtVjNLVi6au+IOtcuenys1+RmuMIMXmL/lSXk8E85uDFhcgbhwWdNNHyj8CeuhLggExufcqesGuRbRbHksn10DvG/vT1RTCxvWWDMs11pEX2WhZjayV7v16ztz/e1JMV/dDntj+kkX8LeTZJvPaXcmnfXuIb+16jKBOsUXJBF6KtKeqQyTQ2TJdmAANDd2Vyp3poVGi5m5rJvwWXBsUWaoo+fP1TWoLMGXGnr+jrAsMk+iJgl2zFW/rcaGVKz08wj4efnOTwJu2rZfufhP5aczlSB2DfbcASQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.21; Thu, 1 Aug 2024 12:28:11 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 12:28:11 +0000
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
Subject: RE: [PATCH i-g-t v2 22/66] tests/xe_eudebug: Add coverage for sysfs
 debugger toggle
Thread-Topic: [PATCH i-g-t v2 22/66] tests/xe_eudebug: Add coverage for sysfs
 debugger toggle
Thread-Index: AQHa4nZdtc4g5nXFZUKRrgoU2j/zBrISVz3A
Date: Thu, 1 Aug 2024 12:28:11 +0000
Message-ID: <DS0PR11MB7264F321B4D055E3D5550244D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-23-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-23-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|CO1PR11MB5108:EE_
x-ms-office365-filtering-correlation-id: 79220ce2-9ea0-46be-83f5-08dcb2256851
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?dYTP1O+FvznjX+90+nkLX07kOYuzNhNeRkqAQ58niXwc1lVJOsuyMsLcwU?=
 =?iso-8859-2?Q?dPkWDwHcaSCoR7TvMbc49o9qjlzLNTsZLsDVwJ26bJLdUbZmWCg9QzE+0e?=
 =?iso-8859-2?Q?NnE8J9bkzIvVUyQQFRsVVh7C6JuiKH/54Quiml0yL0Pm+5fbbIvPt9QBa4?=
 =?iso-8859-2?Q?WFgrtuvrgbI3+NUye2UZgN1NbeonJQ8iRj/ggCf3r2lWdqpvcgBMuOslWj?=
 =?iso-8859-2?Q?9iEd4h0gBNj/uFb+Ul2tKC0XsqjB74s7sm3nI323lY2rxFGtmJwkMD4tYZ?=
 =?iso-8859-2?Q?ZlBIBWWDrXhms75L786Ve7F+e6RlLyGUBsHB8s25eYxkZ+iyS34LMxiZJ+?=
 =?iso-8859-2?Q?ETzdjx1QlSx9SDbyThPI6L880shhrxGPU6ShdVeYkWv4xX1hzNVD4CZ0C/?=
 =?iso-8859-2?Q?9J5kG7lzVnRB35kNtHdyij1Ak+3eozX8Hwio3xor6jua++m/DZocHCWszD?=
 =?iso-8859-2?Q?Izq7Ar3wxPJO+Fr8JGjafJKY83vaBFLNtoTGFKDFzIl0X9rnqfcKLl0RUG?=
 =?iso-8859-2?Q?9Wl/YJmTvQYtp2k8ytXgOrV2cvsZstURjNDycDlLnpSGknvUFBTnSy0QpH?=
 =?iso-8859-2?Q?nwHSI0QPSDAN9rBiHTIkXupsWdSPcD3Vej8XD106KddyGR590yYU2o8qyl?=
 =?iso-8859-2?Q?iDv80AYR4y2hSroNtPSOY43fBGR8UNxtAwFPV/Gu7vMRHQWrvgiWAUx2zl?=
 =?iso-8859-2?Q?hXkA09AAPueQJaTSJlo1I91eYXh9JDrbxAVPaf17YPHCSMCSwCKB2F1Ke4?=
 =?iso-8859-2?Q?/vEXM0ToDL3LDkDj9XJrIYAhF7N026q3ufxoFUOtjjfKI28vBrW7bnPZzi?=
 =?iso-8859-2?Q?b2TmWSQKQoLJVFf0c0ESMQXURyY/EPGefMFfYTkQPow6tuO4xa9BcTQa+W?=
 =?iso-8859-2?Q?2viAd5umCGiLJVYMc891c0aPQgMO68KKLSZaBNkvGb3T9agPlT8xsM35rB?=
 =?iso-8859-2?Q?WKj0dA98FfYkBNPoA//7AVVX9C40KKrR42rP4aeyiHrIxHPruncFWO65+B?=
 =?iso-8859-2?Q?DT2tpouP0gXMw7OCGIxUmvp3lhiFUdsx4eBX2OL7LR25at9gVYmTEpZrVZ?=
 =?iso-8859-2?Q?ACnJrH5kmyC3Us6JpISyIgy/r7xpjGlgO3N9R/kBPDQfH2A8I7Wiy+8Dse?=
 =?iso-8859-2?Q?2mGCOti7OBWWFvWCjipx2skzW9PKlU+W84Xtj5pr6JcXaYrYGoRZeD+i+j?=
 =?iso-8859-2?Q?ljb2Zsn8MBHn/0ZuV+FBdnV8paildYEndec+cOaVfdRMRvNaQfI0LMqU5+?=
 =?iso-8859-2?Q?FwIeZLfdNMIoFDvVO/BSEG95U7J8CM9aGf0LZca4fgRlc0XmQfHjyyA62R?=
 =?iso-8859-2?Q?XkwQ5LY1L7Ltghg1MwMaRL3FhfIHtuftMSyYeX26t8Lt9l80jSVjOoZ9W0?=
 =?iso-8859-2?Q?u14PHS+62RSJ0+CQNximoLqfjENBMs8s72FNBpASHeo9xIETFu5mvkuKW/?=
 =?iso-8859-2?Q?UICoKz9csNXc4U7iaKrG/dtOEG7y9PvMF6yx3w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?tRcbvBFoUdUtjxmkYzVgwvP3lHMnXu00moJ/zLFARmEBYgJspoYOZxEoiF?=
 =?iso-8859-2?Q?nDT9Ujr7iVRwmkOYRL5Jiz7ovbcQYVxobS8G08ozkVJNWmtLApqpFv+mHT?=
 =?iso-8859-2?Q?+0D0+6aWOGJU8CCrqaaMgYllzGE9wl15/8C6JeS9RHuchYLSeE2yx76mOa?=
 =?iso-8859-2?Q?uAPoG0Dg9AVn6FKi8s2vXVKR6aktkBguLgtaEMI2uJlvBgD/Gr+9GFmeOo?=
 =?iso-8859-2?Q?PXnMFR8AM+T2sCgKvJWURJStF5DYbv3celBXwiyvCAFrYIS8iQwi85eRIi?=
 =?iso-8859-2?Q?sXRBY4Kka7wHx++Yzt6+jRUhmEB7bzLk5lQyiurxsWoN2q2H4qFzpSfEfj?=
 =?iso-8859-2?Q?AD/swe2wlzf7LLhrjn8izu8c3bQ3jQqFfS9q0pR5czZMDpeHV60NvW0dU5?=
 =?iso-8859-2?Q?PVUhSmNCXN8WlWeBsLwnO1LfXS9cyBcUQTXuh9Sj3QHzpuLsA/JXc9s3bc?=
 =?iso-8859-2?Q?DAQDR9nCkUtAHZwfVyGCcVjNGBT4Hfe67+9lZesZ3qYX1lgNJ0XEIvRibB?=
 =?iso-8859-2?Q?AFsoasEgcGsHe6ENb3c7q8B4osxXcMFDPMRycs9BFErpYtG0f2+fliKJ05?=
 =?iso-8859-2?Q?AlXPnmV+8QSCZxxCi/rEYMgJqOSJ6/srqTQ6cajPkaQulPsL5S07fXsEmo?=
 =?iso-8859-2?Q?x89NKyIbMiexqz7qmLdCa8h2lFlsf21wV9BLlWWbGEj7d6/TzT7Q6A9Erj?=
 =?iso-8859-2?Q?WLqGG95AgGgdSklF+UFmm341XWYW+95GW+TiEkaFIrNjEtkII39oi0M8rX?=
 =?iso-8859-2?Q?w4eBZ/njwhTJrPUTqOORy4Sox0TpNJz98GZ8zn5wIa1Yedvw6CARlrGh5L?=
 =?iso-8859-2?Q?kO+3edfKtvmXUSNX9c1tT9KYFA3IudJjJ2r73L3B+eFm/xlZF9f4PseV0D?=
 =?iso-8859-2?Q?UisbdE35l9FZHPSKmexc9nKGSbtRaBRumU6jTlDNtJLUxODKHnyeCncljw?=
 =?iso-8859-2?Q?RwlB6TTNDJhPDmcskKVCPAw0x449cWdyLpk9t9axzLqTcASV6ft+qHmvR2?=
 =?iso-8859-2?Q?1GzCBJjZZKlH5HSJElWtoh/HF2eeh4I/bKvBydv5XN/cZDj8hdrY2idFn6?=
 =?iso-8859-2?Q?NWRjIomL8hSoPT8/AaSOhGQwkhyHsSNdNf/z8MED0U2w7RmbLknZJPcg7m?=
 =?iso-8859-2?Q?e1XDUaurUIay5N92XOfir0a0aSb0b2W1vL31QiSYaoXd14SG5TBiax9z2H?=
 =?iso-8859-2?Q?ALTVazSlsUXLv0lq+gwxY5XC7efHmG0v5zXF/jrIOPys46yQUrhvz6GBlx?=
 =?iso-8859-2?Q?9JHE0y89S6rg5R8FO5qnPgBr0umS5bfaJLMOZ/lkhvlF1c99LbyyzUcF7m?=
 =?iso-8859-2?Q?e9qlXuU1sDfI16TnnP+bn/e0p/9FbyLtyzrWr/6RMnW8JY2E16JhY0kmea?=
 =?iso-8859-2?Q?I+jrBleHugPQ8ol7cPCtuUV8Hrzl7UYpzQ8MOlkb/NXH3Kxh//n9sK5Vc3?=
 =?iso-8859-2?Q?iWMcAkbrsN6GcWiV7iE2qb8AtrT/NdKWlAjwQO3YEeFtVaMCN6LZZ4RrKy?=
 =?iso-8859-2?Q?YY+hjcgCpEL2SNnyxodBnkDFrUbTmtN0W/gUjCcwBOynKM34M8Gpzkp+AD?=
 =?iso-8859-2?Q?VvNXNgyBtRqJecIklhiI6TqUXlnkxBOwhOPYcrPgaVCN5+vVdKilxj+g4M?=
 =?iso-8859-2?Q?xK1AYbFwgj5wL1yeuCU0wTwrb7ftG8x9ep/GGxtB1m8Qo1oLcxdzG6RrAB?=
 =?iso-8859-2?Q?etjakG0GaDNp0kJ/+WE=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79220ce2-9ea0-46be-83f5-08dcb2256851
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 12:28:11.3403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 350yb0PV/WpNhomGkfM8AZcNyBKZIthj5vq7kEvs9bmbrHXerWS31owNDvYAoNQYXdQCAq1+41J4s11Tf7Me/eIg7N+pyWaVgDZssv0kIF0ebklHiAriFjMIwv/ZIsV8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
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
> Subject: [PATCH i-g-t v2 22/66] tests/xe_eudebug: Add coverage for sysfs
> debugger toggle
>=20
> Add subtest for checking sysfs debugger toggle logic and debugger state.
>=20
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index
> de8edb485..b565785e3 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -22,6 +22,30 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>=20
> +/**
> + * SUBTEST: sysfs-toggle
> + * Description:
> + *      Excercise the debugger enable/disable sysfs toggle logic

Typo: Exercise

> + */
> +static void test_sysfs_toggle(int fd)
> +{
> +	xe_eudebug_enable(fd, false);
> +	igt_assert(!xe_eudebug_debugger_available(fd));
> +
> +	xe_eudebug_enable(fd, true);
> +	igt_assert(xe_eudebug_debugger_available(fd));
> +	xe_eudebug_enable(fd, true);
> +	igt_assert(xe_eudebug_debugger_available(fd));
> +
> +	xe_eudebug_enable(fd, false);
> +	igt_assert(!xe_eudebug_debugger_available(fd));
> +	xe_eudebug_enable(fd, false);
> +	igt_assert(!xe_eudebug_debugger_available(fd));
> +
> +	xe_eudebug_enable(fd, true);
> +	igt_assert(xe_eudebug_debugger_available(fd));
> +}
> +
>  #define CREATE_VMS (1 << 0)
>  #define CREATE_EXEC_QUEUES (1 << 1)
>  #define VM_BIND (1 << 2)
> @@ -1146,6 +1170,9 @@ igt_main
>  		was_enabled =3D xe_eudebug_enable(fd, true);
>  	}
>=20
> +	igt_subtest("sysfs-toggle")
> +		test_sysfs_toggle(fd);
> +
>  	igt_subtest("basic-connect")
>  		test_connect(fd);
>=20
> --
> 2.34.1

