Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BF0C36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 10:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E6B10E558;
	Tue,  1 Apr 2025 10:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knr8DKJp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB9C10E564
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 10:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743501916; x=1775037916;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LPaxEf6pmC7x6X84TBPF9TCQ6t9ruHG9drVQLHzTbIU=;
 b=knr8DKJpELvuVCivK4oa0O+Zb2jK0vbsKEtHxgzbqJXtxvIHz4uE9kgG
 32mdZL/8IYVXHrKYpBaHcSl44bseW5MB2m1Hpa4WH2pTL6IrLtctna1gx
 OLHlD5IwToQRDhFMCCPavk+KWbKqmqzVlLR8S7wvC2yvrr3Y3eiI6sPn9
 cC0dfEJ61QlAwWWy9rPnSW9IycWRol/N2zzJNgiMYViVYqKX6eg76bFE5
 Ii0GZwLSUVt/wseCqeW2EUI4rBlaJ/nr38poxX5jnRrK15mg3N2zzGVKV
 VVqR8mXo+/Hm70Rmb0JsJAC8fxFibuL3L3GZbRbpWyy8PnXMO8m066Ryo Q==;
X-CSE-ConnectionGUID: 0lZXEA2EQemVUYI7n4sV5w==
X-CSE-MsgGUID: yv8kcs+vTR25iluT03NpfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44829834"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44829834"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 03:05:16 -0700
X-CSE-ConnectionGUID: 8ljsaTWlT+CUf1kZceKNsQ==
X-CSE-MsgGUID: EpJHeGrFTzOXfNF/QsBD0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126861516"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 03:05:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 03:05:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 03:05:15 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 03:05:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmxnBz7Sn+3kc6frNpwva9tew4xfSCBWg+VU3PE5ER7Lyza9zC4/j7DuNZst4RG+FZOzDdfFElENMjHc7FmtoEfnxhZJYqLwM8fejtD7P+/xJ3yKDKCw6/maVNjS+pK4scLUd2V/s7nMZHyE8B/ZO0ffgDJJnaAvYFJjmCTmBjtwHmfLpkon1lIy+/ZiBDjopQJfzaLGlwcJFqAPurCWvfUthqwd0J4B6REX0XqSrsY6LQsXza41WO3K52XtyKzl1BYbSVNxABlXPHyM8TZUn3MG/i0Mp7b9m4YD0A0caQtYoGgtSxN8LzJyFUSAcV6MK4adlhjGxg0634nW1B/w0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUEcNUMQQMpS6LwwH3x0QpsqZaXe5UAN7bTYvgwrHCc=;
 b=dAckcSJw0pNx6ufkd5Cw1uTsGNBN+i4zCSBIC1BLq6HyQ9xsPPPsHDY6YRqzUiqCUKHKby+yvojq4kweT2NkA8gILYVVZ09u2Jp4vmJZ/POpPMTTmlPLZhoP2RswMR2zHcOefT+zwoxGukJgTdRwVLUTsFZiOF2iSvi4Mxxj4FACol5rKSIUsChEI3FYTR2zDWt+34g7GP3jn4mXi3C2YdgW4VijZqrXUFXGJPz/khAFg91VG/Hlwc3MIVwSxhy7cUa2GLLYXbMjQJGZMyBhi6LIpMC8OOmZGC7R2Ci9VSjaHAtyEd3dIcC+Q4woNARbTMps/iSgyJM0HykKMxQ7LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CYXPR11MB8689.namprd11.prod.outlook.com (2603:10b6:930:d8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Tue, 1 Apr
 2025 10:04:41 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 10:04:41 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, Leo Li <sunpeng.li@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Naladala,
 Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v3 0/5] Refactor DRM Debug Severity Handling for
Thread-Topic: [PATCH i-g-t v3 0/5] Refactor DRM Debug Severity Handling for
Thread-Index: AQHboudY0hUlS1BXUkSHw1mCV14VibOOk9jQ
Date: Tue, 1 Apr 2025 10:04:41 +0000
Message-ID: <PH7PR11MB60532B5CB62FB9C2CE91E8CCE7AC2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20250401092015.818465-1-pranay.samala@intel.com>
In-Reply-To: <20250401092015.818465-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CYXPR11MB8689:EE_
x-ms-office365-filtering-correlation-id: 4f765726-2db9-432f-d7cb-08dd71049eae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6bAfpvEYIc+TP8zD+z3nv5I1Qwgqs1Ywf6FOPLqKShzvyHXKlpAwkiROowrS?=
 =?us-ascii?Q?VUMYcLhpeN+1V33sD9irKNqI39TLnsuGYYXGqay6wihRE9KhcD9FmmrtBybn?=
 =?us-ascii?Q?8PYLHn9Pe4tPe5oXzRQQPaxyOvA9/5ooHhIQ3ApxASQ39NHLKRf4Ef7wX12g?=
 =?us-ascii?Q?ac2j0H2XJjwA25lpqnCndi/XOX0UjxdlGvkDOWm1LhLDK03hxMkfKFVVGnST?=
 =?us-ascii?Q?RZITJ1uHA8H2EHxgVzHnLVfVsOg30C10MXYJUC8+ciu1QZK97SZp9FUh6HPb?=
 =?us-ascii?Q?/zUQv0RwxVsaUekuQKYNlma8kMPGgbNw+/PbSveDy8iE923O7DZ/pNpKl37+?=
 =?us-ascii?Q?24wpNkO/Qd9j/pyqfVgLljhLTGLGvbdqNUI17jZvW+MWg0oSIXEFf6OI9hGB?=
 =?us-ascii?Q?l5YVbW0a8grx5BsJ6119ZxkoSf4KO/4LxPoKb7ESUi7Jiu83fS/amfDvA3wL?=
 =?us-ascii?Q?xvGm1kr7PDOVf1QlLhk4G1DvOz9uBXKGKBrTnfBUoreUQ7h+sFyTb7UZYsAv?=
 =?us-ascii?Q?WYOZgJuwlMA8ea+Dmx7rgFaWSqzRVH8Qy/lQV7K/PI2uyZhzhp+SI7OP6veo?=
 =?us-ascii?Q?Iqqr7POy+t051/2B1+AL7jEzUFGaESrszJ1+Xg/NMnNW6DxcoL0y2eQxbd/l?=
 =?us-ascii?Q?DqdJpb/X1YIcWaPu3l8vUkXiRL7kOUvUhg33sd041rmzcUr1IFwhQnLZm4oF?=
 =?us-ascii?Q?+yjdoWGDzwMEHM6Prvnw5R55cOYo77DnadgZsBxBlbkvEYFRe9F3cVpUUQN3?=
 =?us-ascii?Q?VgI/+JoWX3+DuB4zt2DOgGqYDws5vRbkKdnZYHjT1Wt3O+G78R5k5gBNMehB?=
 =?us-ascii?Q?LvB8JLobOXoAdCSTsxYMWIxii+XZ4uGq42x/5ot3FauPxFVryqHsOZi79muU?=
 =?us-ascii?Q?8pRtx7839aNYy0wYpJay4X5eJFSBta7enwSSWWprDA4+0Fg7pDNrzSyr6/1d?=
 =?us-ascii?Q?djueSBdUzslcPuMz069V59pbe4iLZQuIVn4rDpPNvS40ahvih9BXtdhxqD0E?=
 =?us-ascii?Q?5tyzcPP3sgi0w6wbsFIlPkG421/4vXKnDk/59j0X4ipQL6Ii+wZIjIO/cIP7?=
 =?us-ascii?Q?rBo10lcuqmFyOvFNSqK+jzbDbhrPzE5W5ATeasqhGdQu+DbobYXzOxsR5M3B?=
 =?us-ascii?Q?Zom2KFTAaPlM/Qpv0lKOkLE6Tbuu17aY9UScy4oQwx+u6J/gFfYvOPwMIQEt?=
 =?us-ascii?Q?Htih6rJ+do4S4paDmaE8H7J2sxyUtnn36mRZkDbrvFnTYN84qs41OfYxjP3c?=
 =?us-ascii?Q?VVVfwf6xx0JgcilgS51leR+k9qaLs3pzKP4vXPWh+H7qRYXlJIHF5XiXVg2r?=
 =?us-ascii?Q?h4GeX282J3Y+QE8J/wePK1zyTNUgBydRY9elLdvjNlAZpA2EuW3S7L3bzExs?=
 =?us-ascii?Q?bKhbZrpGyT05Szuk+SAreNieaLTE4XbnMGoWkzQEBjAKZaUnUZnc4XkyJ/Jh?=
 =?us-ascii?Q?ktoly/kBlA0KOZ/KEZ2TG+0vk1pxJZdO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?g4T9DDkv1UFX6k2oXJ3zCnJy+mw7jjmBSaoQTEaPNGE9GGBY2extc0uslDyH?=
 =?us-ascii?Q?oujAFXh9cUv+Ga6IlOs86bYJbno+2/0DwiFOKO1TKY4qwHIviQqUKnAXtLZv?=
 =?us-ascii?Q?2f4ZhdzNdxypASxmYUQzwXzNxq+lBafLjipA+1hOsuKzGMWMEoTacMOPoIHB?=
 =?us-ascii?Q?iRtbZWs4wUu10xh5KCWfn/dXX+c4W2DjtA1k7QMXl1GOewgQgfQ7DTbKr/pl?=
 =?us-ascii?Q?WmZXwvazKKULOB2QkbxPCDuX5GwVaFiTsfapGroDcF8pQqaselU2M4diSfa6?=
 =?us-ascii?Q?uRpA/a1bw/ELvfjHCDTI0X/MHZTbgRg7H+rBFFlw9+loCCWlY30z7OUpAs4w?=
 =?us-ascii?Q?afZ+KfjXC5rwgZmWx7y7Fuh8+0h3JRGrMs4ChBEtLF0FuxmnOYVSE+zI/AQT?=
 =?us-ascii?Q?4x1P0Zwqzj2JMCn+B+2QMmWdZLeL3Mq2cCQSyBI+HiA/ppwxOIVRwgOzQC4Q?=
 =?us-ascii?Q?C7VJMK9v3DCRhUCMa3RCYYpj+ptcwg5uxH32DEzrmbBALiGEub8CmzX+42R8?=
 =?us-ascii?Q?9LhhONRMnuJEtQ7Y4ywB7phl++Hz1SrzQth2DawYRkThWKB6/d+r4xw362NR?=
 =?us-ascii?Q?GtQ1JPKowq7kHE2VhU+RFO7TTRG1tTQT8CMi6NaiYuj+hd7R2nTdvnPprccv?=
 =?us-ascii?Q?c4+j4F1PMu300xb7i6b1y/9P+4zPZFcM6KnXZaT5pp+mdS+mK3DrKHub68QT?=
 =?us-ascii?Q?m6Cjr09sp30bxdqZVGjemlPR+aI4I32s2ySB/AG+bWiHRAlmP9Xrg992D6ey?=
 =?us-ascii?Q?XxHglNVSQWsfrjjd3/fSw/sMnb/vQIv18uJ2WWq5kVJGfXoDh3hseN3ACYfn?=
 =?us-ascii?Q?5OvxOj+gX27nwms85f1a62qnoxeOjoZgrWWmBU9jZ0m1+cLxRRckmVAnq03N?=
 =?us-ascii?Q?HNV48FZPwM/oKBDBZx86i3I9Nt1s7E7DVLn0MYgyR4rHn+J36qSovAfKDwKO?=
 =?us-ascii?Q?EMuI5nw8qyhBler7yEQRW4Ks3/pcwJiilTir5ctJ9vxw/3guzYDXDRUGvQue?=
 =?us-ascii?Q?VeOpsGjm9AiczQff/rwqwIUVqtMHTbLEm6oODVbSoHvO+atRsvNnuEXTqfyT?=
 =?us-ascii?Q?jZB8G2YVnMtXwhINK8O0KkZNymAb2Ub4WmIIdMbrRgyRCxB2mIZ8sEx4okkj?=
 =?us-ascii?Q?bSkGBpZIhGlPLRJvYFmK5vT8jCc1jZ4/nPyZsHNrd30knCY7FvVBc5EWSyba?=
 =?us-ascii?Q?ur99O3vH+Z20C+kWOKAmzl6r0zBPlTTna9YVkqgyzAlHUdSdlXbO1jV41Tvy?=
 =?us-ascii?Q?rHDeQjDQjln7lepEtpS1NlO8GyHkKweFuwQRwm+Pc0LvBJHFo802zbZb4wNo?=
 =?us-ascii?Q?6RCxuFASRVf7G4gHcxtAv9zqSl1SHhEJQcMBuQ85RyC15IN2kY7gY+Z6pRBR?=
 =?us-ascii?Q?tcK+KDPf1+MeRJ+bLNufsYQm0qdwbXqjckcVeqVT0nXcDraJ8oAbh9LM5xxn?=
 =?us-ascii?Q?rEpn/XzqReR6r4YufjsrSac3LPR1fpAu33zA49Kbx98DT6hg/m3/zCl9Yckc?=
 =?us-ascii?Q?v4cYORyq06vAl7te76ujzy9T1z8dwhOC2aUDZl6683L5QmvXBlaBjLgeCcZj?=
 =?us-ascii?Q?rc8haS56hStAaxANE3mXDzE0Np+18WANgXuN0Gxa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f765726-2db9-432f-d7cb-08dd71049eae
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 10:04:41.2150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xy6zsW31HqR2F4mzxoHGBcqyRECZ62aHwIwAEhqlZMHdcsVGHc0Q8VypT33LMqRCD2LlwCUIslNxjxXBbI++1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8689
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

Hi Jani,

I accidently missed 2 words in the series subject and couldn't complete the=
 sentence. Therefore, a new series has created for this v3.
Should I reject this version and re-send the patches as v4 or shall I keep =
this and update it in v4?

Regards,
Pranay

> -----Original Message-----
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Tuesday, April 1, 2025 2:50 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1 <kunal1.joshi@int=
el.com>;
> Lattannavar, Sameer <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>; Leo Li <sunpeng.li@amd.com>; Nikula, Jani
> <jani.nikula@intel.com>; Shankar, Uma <uma.shankar@intel.com>; Naladala,
> Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v3 0/5] Refactor DRM Debug Severity Handling for
>=20
> This update refactors the debug mask handling in the test framework for
> improved readability and addresses logical inconsistencies. Users can now=
 pass a
> bitmask option during execution, enabling dynamic updates to the debug ma=
sk. If
> no bitmask is provided, the default value is set to 0x4.
>=20
> Additionally, the exit handler has been modified to restore the original =
debug
> mask after the test completes, ensuring consistency. These changes enhanc=
e the
> flexibility and robustness of the DRM debug logic, making it easier to co=
ntrol the
> debug mask throughout the test.
>=20
> v2:
> - Implementated to allow flexible bitmask usage during execution. (Jani)
> - Update the commit message (Jani)
> - Using mask to update instead of a single category (Jani)
> - To handle nested updates, exit_handler is set before the update
>   process (Jani)
>=20
> v3:
> - Refactored for readability and address logical comment.
>=20
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
> Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
>=20
> Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debu=
g log
> level")
> Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug logleve=
l
> dynamically")
> Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug
> loglevel dynamically")
> Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel
> dynamically")
>=20
> Pranay Samala (5):
>   lib/igt_sysfs: Usage of Original debug mask to read/reset
>   lib/igt_sysfs: Rename debug level APIs/variables to debug mask
>   lib/igt_sysfs: Update new debug mask requested by user
>   tests/kms: Add parse_bitmask support for user
>   lib/igt_sysfs: Move igt_exit_handler into test
>=20
>  lib/igt_sysfs.c                         | 64 +++++++++++++------------
>  lib/igt_sysfs.h                         |  7 +--
>  tests/intel/kms_dp_linktrain_fallback.c | 38 +++++++++++----
>  tests/kms_atomic_transition.c           | 25 +++++-----
>  tests/kms_cursor_legacy.c               | 38 +++++++++++----
>  5 files changed, 108 insertions(+), 64 deletions(-)
>=20
> --
> 2.34.1

