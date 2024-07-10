Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778C3C3DA41
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 19:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D2C10E2B9;
	Wed, 10 Jul 2024 19:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJ+gZLAM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D182A10E7E4
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 19:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720638040; x=1752174040;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KoG6TGxpaI4oAuWEP3rJp8PAEOfQCZUffq/LsUh8nfU=;
 b=SJ+gZLAMzV3sklSDps5X7OMac/SVe/vX8b02YAQAf8fDylrWofSriljZ
 XJx4LYU54qJuk6eG32Go8wzQintphf2wLTRJyCWQm9+ucWzMVP9OALFa7
 HcSASmu4d2xKlUuSjmIWn90K9PuV4vp74MrV/EsuHmP5UwTpXcWxkLWck
 FLqU4+UTQXj0Gof29adtJd8g2w+B2R+IXHvBSOslREpecvae6E3gqvIGs
 gM3fcvaiiTQ0Zsp2g/BlrmVYUDwenu8MhwZVRFPxATzdtDJjFSC96dnV2
 sSkjHzjP16sHMeYhnuDOH9NBzWXlHDOmVYIHq2vRp4HJFtPlQmW1/iPxE w==;
X-CSE-ConnectionGUID: VyCk3lcuTRGyvmsY8hRxMQ==
X-CSE-MsgGUID: +cFjgwstRZ6l3Swbj2PNhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18128343"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="18128343"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 12:00:40 -0700
X-CSE-ConnectionGUID: UNFvFvntQ6eSx091VDre1Q==
X-CSE-MsgGUID: kndbYRCCTkWPJpFAJR6A5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48377971"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 12:00:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 12:00:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 12:00:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 12:00:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 12:00:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ir4a+2NpYq2ikmyj6uB6F78eKZgzEx9eB3GRZ9Jt+CkqJTKt0S4A7jVDYfcjA6lX3NuETLkN5wja3axZC97fKXSYrVbgcT81VTF9vTMjW6tmkJT+QHFA7ozTqqzpl+GhQqwuydOZYMAdI5c4EdyZ0N/MojVwuw8DI2/qk4jAkdQCF55PfyvCRhU3MogWCs1/24izoT5mbWoHmW1vEKpJdrJ0MIgpsXVGYmnDct/QkCid/g4y+kChreRlxBb84rVqiKkUPMSL+JNMqLeAHWpbRk+LUehsjYlTnVM4hkR5bO0l6gIB1HR1EhIBmAsnJ7REzhcoSQL1hrlMiq719pd28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YwU6C1ZvtZDNO7sL9a1HgbFGUoibMwPRWJ2T1HWy/k=;
 b=GIOq4V9H/uXlCJDafpbPwurd4UYhz3fzSNvKgLE0JNA2bIimjoL1ACEu5Y10Sa0SFIH5x+rTGKx4ztwRlvlt8ISPmyalPqRGqabTi9/Xgm2KIRAW5tem08g62Zkzuc5tqDIh9qkzbTsr0TpzMj2LqYq3fiuw2H8ybSM2nI9GdxWnvExERE39DTLySdUDmu/j1jikkJR24fdUqMm0v12d6u2DWnC4f1+6GDplTDqjGieo6r0WUTZqJxMFhRkPbcpFnYe/oCT89g9N9BPfOsmyMMRT3cxwYgOfeB7r2jUgvDDKJcD45NLV7LuwfxCDOor1rYsJp0gjBSGj1NGzbMxCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 19:00:28 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%5]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 19:00:28 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>, "Kolakowski, Jakub1"
 <jakub1.kolakowski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel-ci/xe.blocklist: Blocklist SR-IOV
 stress tests
Thread-Topic: [PATCH i-g-t 1/2] tests/intel-ci/xe.blocklist: Blocklist SR-IOV
 stress tests
Thread-Index: AQHa0t1ceLDq0+ch5EGTYn1K1puQP7HwT/AA
Date: Wed, 10 Jul 2024 19:00:28 +0000
Message-ID: <BL1PR11MB54455EBD1E63A5C23C6D21B0E5A42@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20240710152446.827476-1-marcin.bernatowicz@linux.intel.com>
 <20240710152446.827476-2-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240710152446.827476-2-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|MW5PR11MB5883:EE_
x-ms-office365-filtering-correlation-id: 5b4e35d3-9a54-4faa-1db6-08dca112903d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?sMf9YmBpWBoDrLfEi6xYyHyeHRvWDCAMBXX4UqbhH2svoy2f0gXR63aneBLD?=
 =?us-ascii?Q?aQjh6D4GeA2ALDBSf3aYrsbTusMxqbw9qUBdNr0V2fYC+8k5xh0wdsMV35/S?=
 =?us-ascii?Q?0D6ZNYnudEEea4dqg89tTbppbw1V3z9JB5kqRZwGutb7QPSCPN7Dsx3mXuFb?=
 =?us-ascii?Q?4GVPrCSw4kpO6q8PEzDPw5BXhV9IKlD5tpjqZ+aZGXcB22Q/fdH95q47Qm5Y?=
 =?us-ascii?Q?khKT2Ydb9Ub7lQ79BJrkXZQYvLbOqugFFIDD8m9qhSMk7blD+ACDMiW0vxJr?=
 =?us-ascii?Q?8KNSh80DOn6pKayLoDcB5giq5bacc6mBQm/jHyn92Mv4dQasPAYzCS0kg7Js?=
 =?us-ascii?Q?Sr9Dyx4zHlcQaRCIkH7JWtEem+RazKDvW8pGprnnFbrs/NMB3LpXQvYQGyKS?=
 =?us-ascii?Q?hs8cPDWE9Ki8NIwVoKWtmS9Uzh3nxnSltzdw05tt9ohdO/tNOTgRZ1vAB+Mz?=
 =?us-ascii?Q?Ea8Wfrtg/N5fX2hYOeE4GvIxZIMLW+h9T1N4vMD3Ce4MiXpM1nw+rUY2HiYk?=
 =?us-ascii?Q?B2Y3PjbjAqWqCWPmMdOCYlwRT5dcixX7Ezk3Ic+Ss1SKtPNMoB0SfoOzgugD?=
 =?us-ascii?Q?Ela5LXdPrW4qTaJ9P6uvMFZZXNRF7pdQ/0u6dwqe0R1XuMmEk5/fpp0riQKD?=
 =?us-ascii?Q?lA/haWwlQXaY7yCn4KwIKa6fKg3kGfFKhLYNT4TtBhPzBL9cPzvzXe7eUuiL?=
 =?us-ascii?Q?aQpO1HSZgftIJveO8Jn9bzAmZ5e5Flvgx4Jg0DmDMP8PEtixvZywfU0R/Ubl?=
 =?us-ascii?Q?YSTvkjmoMOJnoCGRleCefx6EbNFCKdOlJ8btlnawwtPIK38y3R2PSsZT9tpW?=
 =?us-ascii?Q?oJ199PZnoYHaqe38UUVQ+cSyPR7amE9VJ8ZcasGI3yPsZl4hbPRBVEjjD3Sa?=
 =?us-ascii?Q?Ngd+EhyYSZ7OJIu5HK4erYfrc5/PJqKRG/DCoj+G9DNzYju9RbKir+sg5uuf?=
 =?us-ascii?Q?cozMozNjHS7xBrvYTAjWN/nOdmnz1a4qB41uGarhAzwwqBNn+xWCVUF+Y9sD?=
 =?us-ascii?Q?jqtV9RVTN9qu8SGLvnf3STd9Lh7EXYPqsOILfOHJpRrvUisIEyxDGVlCe2W9?=
 =?us-ascii?Q?+RyOZtSRDucli4rRsftUPg+IPLrOx9ZXx/aiui7zXX9Iu7aQSb8MZVwUvDRK?=
 =?us-ascii?Q?xSFs/zo+XmkDElJsn4XefK+rZBMz+5EihXdWlHVDAKSpEQv2P8h6NZwkBjo0?=
 =?us-ascii?Q?GlhK2zOOu9mzpzVEjFeSt6BmREwEwpaep9pI3kaq0kESeE3FV6FAKeDKtvxk?=
 =?us-ascii?Q?E0TE7CoDukF0IfRRC/dIfZYoQ98anQgwdAZVXPQc2eQiRfARIqjf2lW7lLlj?=
 =?us-ascii?Q?PY8UkU+YQYTBSEUUtT7+AbRAaQtDsqBNMainp0ZOqD31drhLY16Rurrs5jd6?=
 =?us-ascii?Q?mms+2LNDrIZPSB2THN/+ZBFJboeLKKLMD6Gt2KXlirFKNDsJiQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pUwf71vxRLq8ypTphvfVEfnmqKvdK4LaWM9hEbGLSsyLipGA+GfERv7q4gL/?=
 =?us-ascii?Q?HroUpehV6iYWychqUo0Focm/FPslJSUEKfuB6tfw06ZTtCBRygOZULq8gjjI?=
 =?us-ascii?Q?ld1D/OqmkT3bU4RAkeoxX2m+3isdgWrnJdJBZZUpbwskuo7Gu3CK7AsW+eDd?=
 =?us-ascii?Q?Yj5Xc0JYhaMFnag4cwEn17EGkRBjK1Dj7Ujc8qBFhH8nXLe8KX39f0/bLjWI?=
 =?us-ascii?Q?3WsZa+MQ7a2PYH8UWsD5uDWk4I3fJRDtYEDHqG+jU2fcniZZ4SF4z6Kqf/c/?=
 =?us-ascii?Q?2FcNyBJM3HGNOH5VLyttqMjv/oa2D0G9yRtYxpZs/dGk/3RiSLai0Dd7b0//?=
 =?us-ascii?Q?DSc8MBvY2BPPMKM300zluBBVCq/+xxsya+dSyIkl+eVl6BrM/Ib/jf+gF49x?=
 =?us-ascii?Q?lAxoQO/CH3Z55R2ptVukd1mo+VBD4Rfg2MqgD4tMTcxtUOc+0I6AFl4kCjiL?=
 =?us-ascii?Q?s2YYv+C17X39yk7UdG6h767t5ocJ31aquB6I6gvTBu0JsazujD66fzlHIAnB?=
 =?us-ascii?Q?N/RnDYaOl128yMLWGEJtntvrkaU4rpyGIfbITROe6/o05jZfhncLywQrU2Mo?=
 =?us-ascii?Q?Pz71SIpM4no6qWgtxUWXvq3RRDEnhLghKwlOs/ILOtNVuF4VbPS2kuVAumr7?=
 =?us-ascii?Q?J+w9VqUz7WTNN2aA9szFKj9d5/ssFN0SXMLQfjpiW1FAMB4msOS4S0rGO+93?=
 =?us-ascii?Q?stH3rP7cBqdyQGYgD0sHQ5MdXxQhVtQxzbGdc82hxI/qcFqs5eHyP1IbaKF3?=
 =?us-ascii?Q?ktg1GbugsttkpDQRsntusCl8Rae0vk/d+Gd403xS8+Yopb7ogdxVOCxIfo16?=
 =?us-ascii?Q?TeHKw6YjU8LwOTlbi4AXwVmjM4DJ0CryE42da/TXg/42HMv8bjpOwpkt9/Am?=
 =?us-ascii?Q?s7ZiMqDMwX2BJdG51QXArXCuImUPA/KONZGbmfnJRksfc5Lo5bc/FJ49WGkY?=
 =?us-ascii?Q?xKaQhWmUv3C61QyBJU1hlKMDcmpp0TuS7aNlRh16FvJkMzDPq0mexAufL5sq?=
 =?us-ascii?Q?FbIV8SB0zCFH72vFJZkCcd82wEiHfN2Q3utOnpQNTe95a4Vyyr8CW5rERFXH?=
 =?us-ascii?Q?t0wLMbpTgSw8JDCUOm3iDfOSTf9zmT0WVBI/iFqTH8chXWWFqSj7iNZxwz3z?=
 =?us-ascii?Q?//tyEZ7JPgTfNDE677qdegj6LuKaVovcWrLm2cgCVxSxjL0HVeFQwt4dP/Zn?=
 =?us-ascii?Q?NSpeRP8wZtYe3SS6ub6Cdim1/jhZooVtSL4nKbTx3L8W7PjyDUBRo2VjgLY4?=
 =?us-ascii?Q?PYsiIq2FLfBwxHpSggZKaoAjY3olQcEYrUbVpSZbaeLCKp180c49KmSO5o7V?=
 =?us-ascii?Q?uAJdO420G3uXxYXYISA7SgUdZuKxS2UlkLiRhBkEyQwYaXfI8rn1TRE1L3bF?=
 =?us-ascii?Q?9ups7Hy08hQfDspoJ3PY3eUeg/aZ5/e0i6JCSdHuLGAeUHHyhayaMZxG8kCp?=
 =?us-ascii?Q?iU5URt+t8lQzeeSfT/KeAddz3yFh0t5wPQF97JPznee5qZGyW+gppFT8106m?=
 =?us-ascii?Q?ac8kK4Yo29RB73U5MkzHi7HvY10T9Mcpb1rnMTLJn7XTgw+inpRG5VbWOoFV?=
 =?us-ascii?Q?EbrC51LDmrtmth50DOg7vr7cXx/cd63ei5SqtoBt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4e35d3-9a54-4faa-1db6-08dca112903d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 19:00:28.1095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FRTsqjU33FGdybCJmyq/LFntKAIkzSgKTw+yJij992zI8qjoGjt5n4JhKMOQRcdmAn8Pt2Cpj7ZmNUGO4BUjPY0hm+DquQxzZeunGszJfgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Marcin B=
ernatowicz
Sent: Wednesday, July 10, 2024 8:25 AM
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>; Adam Miszczak =
<adam.miszczak@linux.intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>; =
Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>; Wajdeczko, Michal <Michal=
.Wajdeczko@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel-ci/xe.blocklist: Blocklist SR-IOV st=
ress tests
>=20
> Blocklist several SR-IOV tests that are identified as too stressful
> or time-consuming.

It might be better to word this differently as to clarify that we
still plan on running the tests, just not in the normal CI
execution path for the above reasons.  But otherwise:

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklis=
t.txt
> index 828baf324..dd7c05041 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -83,3 +83,9 @@ igt@kms_prime@.*
>  ##################################################################
>  igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
>  ##################################################################
> +# SR-IOV tests that are too stressful or time-consuming
> +##################################################################
> +igt@sriov_basic@enable-vfs-autoprobe-on
> +igt@sriov_basic@enable-vfs-bind-unbind-each$
> +igt@sriov_basic@bind-unbind-vf
> +##################################################################
> --=20
> 2.31.1
>=20
>=20
