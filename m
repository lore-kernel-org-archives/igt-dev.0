Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A2DCD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 14:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA15D10E79C;
	Mon, 11 May 2026 14:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvd3qZAO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F9A10E1B7
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778510159; x=1810046159;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Kol5+QS7dQd2YXkPLKup5HtXAu+IRLqvwX8a2M1Tt0Q=;
 b=dvd3qZAOzGqh9J5g3Tn/C6d2M9rDJX6Oxu/UwsQdXL5j4H7iz01T1L0H
 P7osbFsFDFgUK9Ojb44lD2YkRi3vUpS5ZY8z/VebS77lwyrq4V04mVpzM
 OJ6z4U8jfcjAwjnVauLoF4OREK+NdEPBwrh2yJgG7nYrFcHkbfjMK056e
 hUzCoty5LTY34vGHBNn4Hu7kA0Z5vjGAnxR10MedvPs2hBqXMLf1iHpPQ
 /SqoXm+2etvHZ75DrYYjT8NK9OCYUMCuXcwpOj2AqkgHDLpgan4VrXCfy
 lrGvXWerpEuh3eDS+RAKme4c5dE0cM7vL+zw90Kl8vC3/EZNnuFubbOWY w==;
X-CSE-ConnectionGUID: 6PKNfhphRfGhw1QxxYEWtw==
X-CSE-MsgGUID: z71eABjgT8GtGPeEltg7WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79259251"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79259251"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 07:35:55 -0700
X-CSE-ConnectionGUID: Bby0EPorS92vQfW0SBRLPQ==
X-CSE-MsgGUID: 3tjToOAMTw+nNHbuKwpSLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="241449738"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 07:35:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 07:35:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 07:35:54 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 07:35:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwEeTQp6wOlcs6QIFpdMP75HqGaaGjdjepbziGzPCYVLaOg62EGNuUgUC3UDuXD9TP+00O16VqDf45vZG6pHBPRKo5WD7oY7XpVxiAJEtEwuDJ791mSM+it3TP3BomjUIg2DAq6lbllWcKaCj6X9jgsjPNULQ8p6a3ZQ9WQkq8/CGjHAulSJVjSiL74Y7kdJjyaZxZUS2kk9hITT4w5DBcIrrn9khq0JX3pRK9iiswVMRi1GzjEfSrr4yMS4KItGCS6cLOxxyjXoY+bnz+Cj8S8FHeISQsiJT8RcfVMwlIuu6/XRdDkt2gBD3e/v2O3pb4EWaZY3Q5n2TZVLneVrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kol5+QS7dQd2YXkPLKup5HtXAu+IRLqvwX8a2M1Tt0Q=;
 b=MdGTaY4MJIwzGqUou6VTBVhjXiTELx4pFOuxxK8x4sUe1OOv6pZ7U48uB5TQb0vzZc1TSeC0rE9lDlrH4P9JFkzuxOd87jLVT/QyFqN92b39j6gVH4vZFxf5pUOtj6XQAfZOwzHstvCz8HJo0S6GXLNZZcu4uhvp7pyqlinudVNjtKSTHJmbqK2wmhAa2+wllg1ztGCOkTbt/3B5ZzLQNEbs8kGxq1HHPNHxWzryuCmFU61+ZOOWt9XBWD5qFvlb8cw8UKpTMmYEIcum4rW9xOzjBhqfDCEnr32WtvhBCa7MJ11qortIMl4ce5AValisawb7bHYRlpxnWiETCyqVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by PH3PPFE994B740C.namprd11.prod.outlook.com (2603:10b6:518:1::d5b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 14:35:50 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 14:35:50 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>, "Tahvanainen, Jari"
 <jari.tahvanainen@intel.com>, "Grabski, Mateusz" <mateusz.grabski@intel.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v3 2/2] lib/igt_core: add timestamps to error logs
Thread-Topic: [PATCH v3 2/2] lib/igt_core: add timestamps to error logs
Thread-Index: AQHc4UWts+eT89nzV0iEWIC5AjqzBrYI5GCA
Date: Mon, 11 May 2026 14:35:50 +0000
Message-ID: <5d37589104f5d972a7aa2b47461d6658261669e7.camel@intel.com>
References: <20260511-add_timestamps_to_logs-v3-0-041130e1f7ef@intel.com>
 <20260511-add_timestamps_to_logs-v3-2-041130e1f7ef@intel.com>
In-Reply-To: <20260511-add_timestamps_to_logs-v3-2-041130e1f7ef@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|PH3PPFE994B740C:EE_
x-ms-office365-filtering-correlation-id: 9f9c2599-fba4-427f-ecfa-08deaf6a9944
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|11063799003|38070700021|3023799003;
x-microsoft-antispam-message-info: 3QsT2qbf369JiqfSPB0eCsIUb49rOLCvRU5ea7tfrUVd9Oi8jupv+fph2tG6fkWIgtgusUBAhRxtIMEYiEMh8dtE7qB75cLrJVWXUkzlAIbB17nSx0ZHOJRMkWlnz+gysF1+qyoKY/INS/SxphQS+v2zkjM0whjDC+JNIoqohj7BS5WY+W0w5BblIqwjx7xsUYY//8bY6tqXynysB1UaFd7qwL+JCWI7wOLyLJksDm7p4+/e0szxnNns65Y+HwqorJCcXLJmTvMWqnhZaEH8CfUGYEy69Bip29sHlTb8b55Zi8Pc8qIELjlPgOOAs9nroTSmwZivCXQx8j0mQaaL+fBeklzLvjRKQTRJznGD6B66KnKAZAg6gOOwM4Z+e12GLar2eT0OkYWe9VVvJsg0uk01pl53f6L9dNqwDBpw0E2MzTuKC0EZxgYgp8tTBOh/7vPr9f4dpWRAgk4AVzwrjUcrkbhL3Urwik2lBPnEcjD80Kyc1B1xA60OOrt1qd96VXD9jcf2jJ2eded8Zh4C2MCsGWUYf4FAIUEjHqd0XflmR/jcAwMJ5WSQ0b2QqS0Wh5sGDvHROaTdNTTBK6ATXAVmRcXUUjS4Jb0doXgXsGbPj/4jAVC8jAkjn5Igj+aNOVHplfrbhg1NZFWn6OWDjPxnaN9EzNBeBrk0r3hq9eAX3adma9F5Cu9wkL1h2acrW1gJ8EQsw3EoMXtTFhvug5ayQ0RhL3nlgvMuHfkgG0TmzvZotlVWvxkS/lWzEOlp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(11063799003)(38070700021)(3023799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXRDRGxjdXZMbU5lOGR1akJJN1ljMHd4YmkwekVmbmlGSHB3MmZPZTVFQ1Zh?=
 =?utf-8?B?TFpXbzdjRm5mZi9SR2VvcGhNQjB5RVgzNmhmMVlGSHVSdS9EdnRrRjdDeXRB?=
 =?utf-8?B?RitmRk5jL2d1czZZR2RWZ1VJR2JCS2cxZ2FOTFdsdUFvMW0rZmRHcTdxQms1?=
 =?utf-8?B?dVFMTFk1dnRwKy83TlBTK1FCam90RktFOG1oNzVDMGxycFc5TSsvd0ZUT2xQ?=
 =?utf-8?B?OGJlaU5WbkhkYUgyWFN1LzBSS2lrYk1mZmpWNTlISkRlYkJKb2ovbzkxUmox?=
 =?utf-8?B?U1VrbU5sWS9QYVNJV0ErQUFjYkY4K3gvMTlISTEzVjluWXlZRmlBSmIzQTlI?=
 =?utf-8?B?MmVsT2twc2FYdDdMMFNlYmRVaXM1L1F3aGV3VkNzQ0VvcTZzUTY5Q0Nkc1R4?=
 =?utf-8?B?dmQ4bG41eHBxN2w5dE9xRXdaSE8zMU85dWxlTUJXOFZwdGFEZnlvaGNhRFhi?=
 =?utf-8?B?SU16YmdpdUJIYjFKSDZiZGgzZ2dFdHQrd0dmcHN5VXlJQnQ5ZzE4czNIamlZ?=
 =?utf-8?B?czFPeEMwRUV1UHVPUzZhSFk2UmROLzlSWnFlWGVFNVRPb2YwYjNrb2Y1WjdX?=
 =?utf-8?B?SFJSWjdnVmxhZUtMQ3ZlREtoMmJVSTdlUUZZdndURW1ab0pOMzBaT0h6Vm1N?=
 =?utf-8?B?OHg2cVNkVEFoajZsV1h5VVdVN0gyRzNIOW1jRFNEOFp1OVNxVHBIUXpMdXlr?=
 =?utf-8?B?ZVQ3aTcvK1NvNlJOQ2tCcUVTSkhqd0RSN1ZTemdseUs2QkZHelN2SVcraHJF?=
 =?utf-8?B?dHJXZWtqN0ZYTFNBY3ZpWXBYU2lNMFFPZERXZGJzWmRadWtxYllGSHdPK29n?=
 =?utf-8?B?U0kySk1iYTY1dXdwVlFtODViWG1JY0QxaFlGMkx0OHpMWml6eUJxb0p4N0ph?=
 =?utf-8?B?R0xQaHprNG52SHM3c242M3NENk5rdzV5ODRpMm9KUkZBUHcwUGU4RUFSSWZs?=
 =?utf-8?B?WS9iUE1VZzNhUkgzM0hCRkE5WTFHNFRlTGd5VldXMmllQWZJeFdIaUVUUzBG?=
 =?utf-8?B?cWxZNEZEcnR5L0pndE9WYlMzTlFZMjV2L1phUi9PVmw3WjQrWVpMR3YrVHJS?=
 =?utf-8?B?bXJWQUxsRm5xTzZPLzlBNnljRkVwRk5GK2dlR1BIRm5wQ3pOY1VRU243L2Fw?=
 =?utf-8?B?bm90ZElKN01GcjhXOFN0Q2Y5N2FRSVRTOXB5UGp4Vjc5bUxXN0NPS0JSMHNa?=
 =?utf-8?B?Ym5FcXpKL2JLQnhua2JmSjdxblExWnBaUUpnanlnVTNUUmtPWFEvWXBFNUdD?=
 =?utf-8?B?NXJkQ0VpWkZRVk1pRHRBQ2hiSndKcGhaNmx2bWR6UGUvanVUa3U4N3VzNEpa?=
 =?utf-8?B?M3IyK3BWOEgxalFjN3BESXFSVVdqMnRmRmVoaFBqRXp1U0txdmhIdWdNcG84?=
 =?utf-8?B?NWdxWW4wK0ozaTR5UkRtUWxsWWxoTWpzenAyZUxpSGI4NzQzemZFdVE2c09k?=
 =?utf-8?B?Q2ROc25keCtrd21BUmg2QlNUNUIwdjUzWjZNalBpNHM4b0l0RDZRNkdZLzI2?=
 =?utf-8?B?MUxRUCt2cE9zQUNJT2VjK0hPc3A4QllTSXpZZzRMditTbmRoWVkwNVdLOUN1?=
 =?utf-8?B?d2MvSC9MVEtBTHFDekVsNHMzZ2Z0eGwwdEVvVHNSRExuUFVBMk5tcTRVeG9p?=
 =?utf-8?B?Y3NFZUdKV2pkejN6cXBsUzFvaFNpb2NzbW4wakM5dk9hd1psT1ZTaDVXV2NV?=
 =?utf-8?B?SXBCQndxVndmbFMwSnVEVWdZY1doTUVudDRSR0VVTHpUSWUrbHdwMDArdzMz?=
 =?utf-8?B?RUNyM1VmWXVIRTlISUtobUFxZEh4dTB5ZVhSWkplRStLSmpjQ2JXOEFrK3V2?=
 =?utf-8?B?UzRlSTlYTXNaaEhFZ0pSeS9xWnBXc0xSb2M3eGxmbUFjZ1plUXBzK256QTZz?=
 =?utf-8?B?SkI1eGgyOHhqejl4NkJEM29OYlh5ZmVrdXIzakt1MEtvMWdMVGJTd3RDVnFi?=
 =?utf-8?B?dHpzaE5iZVROQTNvOXFiclZyTVZiY3hRaDlZL09uNXJhc05jdFhuUk5jeEMx?=
 =?utf-8?B?bmVUaDZLTFpwdmlBQzJLMldUeXpWOTFCeDYwMExTTlBiU09qWjBQcWZIR1k0?=
 =?utf-8?B?U0NQTktHVUJERlNoTUMxc08yaURlcWE2cVhqR3RFaUprd0FCMC9mbHFpWlVq?=
 =?utf-8?B?cWVDL3pRWktVM2FqVGdwTGExcDF4Mnh3M2FZbHdvNEU1TS9TUzZ5a3VVQmRB?=
 =?utf-8?B?dWRWeWM4akIxSzhldzdEV2c2eVR6OGhJRDJCUng2Zjh3S0hHM1BHaTcvTEtL?=
 =?utf-8?B?czdlWUQ2eHZ6T0JXTy8wUnJYcTQ0d2xDaE96N3JCWTBwSU9NV2FVUFJ1b0c1?=
 =?utf-8?B?ak5XS2cwMWxveHhSZXRWWm8vZ3dnN29wUkRQT0lUZ3cranV6QkpMV1ZTODFj?=
 =?utf-8?Q?bG7V5f/j8bJJyMDY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A799E9C57065CD4399E286550A65D70A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NT/NuS1+qw2ogMhIEA9gs6owheAGcSxteUluPC95sqwmoN5bvaWd/Jk9btVG8axlnsXlFLYBi3OmvnY/w5xMN0DMBxWWo+3XskHmTv5M4qzTzCGvyAlVaBbX1ZY1enHoEl4EIA6lfImL0C8pIW9j6o7ez2klA1HGnT9WGTEdAqR1S+KfVImyu+lttH/MjsS0i+hzbw70/Bk9798N+IbSrCWACicsxlB9EF1yQ9TYMZUjz40GrAUf586Pir+OF/9DvY8m8GWXi4D0IwonSRHjWnV16Ic40QfWWgXn0qNZLTKPenh+ozCfab9k5gIEw+0DhI6p5hzp1V+eZM1L5S9lCQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9c2599-fba4-427f-ecfa-08deaf6a9944
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 14:35:50.5419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDHr2FWT5fhIDPGWICNBmmzYig/qRHCLXL2dzn1UmIMIGGhRonjGw6Dlgpz2Vzs54gFk43kGcGyEQd43KV6oSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE994B740C
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

TEdUTSwgc286DQoNClJldmlld2VkLWJ5OiBSeXN6YXJkIEtub3AgPHJ5c3phcmQua25vcEBpbnRl
bC5jb20+DQoNCk9uIE1vbiwgMjAyNi0wNS0xMSBhdCAxNDo1NSArMDIwMCwgQW5kcnplaiBIYWpk
YSB3cm90ZToNCj4gSUdUIHRlc3RzIHJ1biBvZnRlbiB0aW1lIGNvbnN1bWluZyB0YXNrcy4gVGlt
ZXN0YW1wcyBzaG91bGQgc2ltcGxpZnkNCj4gdGltZSBhbmFseXNpcyBhbmQgbWF0Y2hpbmcgd2l0
aCBrZXJuZWwgbG9ncy4NCj4gU2luY2UgSUdUIGlzIGNsb3NlbHkgY29ubmVjdGVkIHdpdGggdGhl
IGtlcm5lbCBsZXQncyB1c2UgdGhlIHNhbWUgZm9ybWF0Lg0KPiANCj4gdjI6IGFkanVzdGVkIHN0
cmluZyBmb3JtYXQgYW5kIGNvbW1pdCBzdWJqZWN0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
emVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIvaWd0X2Nv
cmUuYyB8IDEzICsrKysrKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9jb3JlLmMgYi9s
aWIvaWd0X2NvcmUuYw0KPiBpbmRleCA1YTBhYjQzNjFlYWEuLjcyYjdkMzQ0OTg4OCAxMDA2NDQN
Cj4gLS0tIGEvbGliL2lndF9jb3JlLmMNCj4gKysrIGIvbGliL2lndF9jb3JlLmMNCj4gQEAgLTMy
MjYsMTAgKzMyMjYsMTUgQEAgdm9pZCBpZ3RfdmxvZyhjb25zdCBjaGFyICpkb21haW4sIGVudW0g
aWd0X2xvZ19sZXZlbCBsZXZlbCwgY29uc3QgY2hhciAqZm9ybWF0LA0KPiAgCQlmb3JtYXR0ZWRf
bGluZSA9IHN0cmR1cChsaW5lKTsNCj4gIAkJaWYgKCFmb3JtYXR0ZWRfbGluZSkNCj4gIAkJCWdv
dG8gb3V0Ow0KPiAtCX0gZWxzZSBpZiAoYXNwcmludGYoJmZvcm1hdHRlZF9saW5lLCAiKCVzOiVk
KSAlcyVzJXMlczogJXMiLCBwcm9ncmFtX25hbWUsDQo+IC0JCSAgICAgZ2V0cGlkKCksIHRocmVh
ZF9pZCwgKGRvbWFpbikgPyBkb21haW4gOiAiIiwgKGRvbWFpbikgPyAiLSIgOiAiIiwNCj4gLQkJ
ICAgICBpZ3RfbG9nX2xldmVsX3N0cltsZXZlbF0sIGxpbmUpID09IC0xKSB7DQo+IC0JCWdvdG8g
b3V0Ow0KPiArCX0gZWxzZSB7DQo+ICsJCXN0cnVjdCB0aW1lc3BlYyB0czsNCj4gKw0KPiArCQlp
Z3RfZ2V0dGltZSgmdHMpOw0KPiArCQlpZiAoYXNwcmludGYoJmZvcm1hdHRlZF9saW5lLCAiWyVs
ZC4lMDZsZF0gKCVzOiVkKSAlcyVzJXMlczogJXMiLCAobG9uZyl0cy50dl9zZWMsDQo+ICsJCQkg
ICAgIHRzLnR2X25zZWMgLyAxMDAwLCBwcm9ncmFtX25hbWUsIGdldHBpZCgpLCB0aHJlYWRfaWQs
DQo+ICsJCQkgICAgIChkb21haW4pID8gZG9tYWluIDogIiIsIChkb21haW4pID8gIi0iIDogIiIs
IGlndF9sb2dfbGV2ZWxfc3RyW2xldmVsXSwNCj4gKwkJCSAgICAgbGluZSkgPT0gLTEpDQo+ICsJ
CQlnb3RvIG91dDsNCj4gIAl9DQo+ICANCj4gIAlpZiAobGluZVtzdHJsZW4obGluZSkgLSAxXSA9
PSAnXG4nKQ0K
