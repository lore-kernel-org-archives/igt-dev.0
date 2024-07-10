Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF93C3DA41
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 19:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24F610E7E6;
	Wed, 10 Jul 2024 19:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYZ9orQL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFE210E7E6
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 19:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720638241; x=1752174241;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wiHjcDGetCxxFyvx8paWJrLpUHu2nsoUkKnY+6uA40w=;
 b=QYZ9orQLiC+4JWfpJd5gihMicNfLR0qVfpcj9dCLisXpSd0r4xd9CQEh
 xcioieg03q4Ca+OAL+Qdh1sfnMZz/yiP6Es6kN48qCOORBI8vafIyYaxg
 HGDKoAn9zXu1/q2bq7v+agST3SlkEFIT5guw+ltQPcqAKgos23w3iteT5
 CQ7jhgyKn0+z4r6HDKg2ycozzn2HfPloeTCAKoT22vCmjIXcIAaAYHc4c
 hLwHo2NuV1oD0RGyjaFHFTH4Sj5ZdGTMIxXLhahlgT0Wqm0BzbvN/18Ts
 TzkScPf8GSJyYHVzFTlZ2qNXy1bqJoQBoY3TDuz/eicBRLxVEWE/jGl3i A==;
X-CSE-ConnectionGUID: G0JdIYKYQS64fWQGy1cf4g==
X-CSE-MsgGUID: qVoQKYb3SBWfSDrYM+XlrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="29382170"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="29382170"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 12:04:00 -0700
X-CSE-ConnectionGUID: RI82D5reQC2hAFcP0HaX7g==
X-CSE-MsgGUID: zCw6v2KFTL+vgjuQYiltFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48971186"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 12:04:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 12:03:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 12:03:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 12:03:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 12:03:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQ/e3123TvUXWoAWBegXh6EtNR3s55YDYaMg+elQntNA53c/EuEs7CdcOrUn0LMGaOxkWtec6yDT1caoMz1mVwhi13WpLeQnkhuqmcdDOSvY6qb3cf5Mss1Hg4DoUQL/nzS2/JU3TYkCPjFLyuKuqYpict/cvlDXGmdmnHiyn27pHvtlv/lHLhDwOZfrObmEJSyzSi7T+YoLK7TpqV3fGOc26bSD3fgyuui8GIjQmY0+ndNoh6XE7CRLGeyOEHD+C4prHsVXTTG2xuqYL4StGMfkp0BdiexML+VQIMkRrv3BN7ONJb1YP07w8gVHsLJPtj9Rt6h04YjgVcojqQHqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oFItMDSeXZKUp8n+j+pTNcSMOZq3kQR0+SM0DupQDo=;
 b=M2Rz1fdP9EwmeWZmmsRZzpRh8gkbIwiZfAtSVzuJj1RB5RAU8VT65v+pgzEE5n2SvB8Bwz0bo5YbsTIdAPyH76OMYzYBvUrnOP8AHeI4ZKU08NZs5GpIHEqhPXQtKUCTCPEeLfOMR+dbnf5PHzlLgQIJtsp3sLYV4N+DL67OZ1GBwSvURbEhj283vBNKwAAIqphg4c7K/r8RUIb3GBfyzIemX+a7iLDBZy+y0THW8CINnzS+zFjsZ2kn5kqjp+p9teleBLopiFPP8hKgNIiuEC8QEc3CtjbrlMNx1qh15OMk+w2YcK/DOkPUmfTdBF5Lc1VXW8rcfHXjmKProDnNcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by IA1PR11MB7917.namprd11.prod.outlook.com (2603:10b6:208:3fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19; Wed, 10 Jul
 2024 19:03:56 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%5]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 19:03:56 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>, "Kolakowski, Jakub1"
 <jakub1.kolakowski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/sriov_basic: Extract
 enable-vfs-bind-unbind-each-numvfs-all subtest
Thread-Topic: [PATCH i-g-t 2/2] tests/sriov_basic: Extract
 enable-vfs-bind-unbind-each-numvfs-all subtest
Thread-Index: AQHa0t1iiViHAW+ZdEScLr0aC9WvxrHwUSKQ
Date: Wed, 10 Jul 2024 19:03:56 +0000
Message-ID: <BL1PR11MB54451896924237F2AF1740E8E5A42@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20240710152446.827476-1-marcin.bernatowicz@linux.intel.com>
 <20240710152446.827476-3-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240710152446.827476-3-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|IA1PR11MB7917:EE_
x-ms-office365-filtering-correlation-id: 275a3e6e-cccc-46b9-d1e5-08dca1130c69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?JMn56YqQZCzjzdrdh+73pG+SH9cRaWOqCqsvvUmqCTLAiXwrIkAp/x3cDRVR?=
 =?us-ascii?Q?0V8gQfjlBAk3lDmal1KvDAEaGtViuOJyVS1u7LIH4nJ/knbspJ8ArNy77h9H?=
 =?us-ascii?Q?C/54WvxYsIiK4/hiOikQlenmUp2DpTALU3IdTIeX5D5pdRMq2EyGAYB/dOAp?=
 =?us-ascii?Q?z9AxdIrLns29s5vCGAkS35Jekrq8dDttZZOvXQpN0Q6VykhjGJ8Mr998y7Ed?=
 =?us-ascii?Q?6xDIDzr5+PNiNtctGbCgXnPnKPccQjK+gg+0pM4bStVOF4+56BlEj0+CWcNh?=
 =?us-ascii?Q?HJ7CQTS9qmmsIyX0AMOYXe9VhzY9CwzuQkkgq+WORgtXWIZgdzrpMf4MoypN?=
 =?us-ascii?Q?H5/+c4hn5hAv9ss1Hl1gWC5yFDCQJ8ZIyAUnQN6Vqp7GrKX0g6Cle7gx1NBE?=
 =?us-ascii?Q?R2qnp2QjZ+IwrSrczi3bt4uR6KGkxxsB+0dBTN5XV9wl0SdIJhHIenXHNMTQ?=
 =?us-ascii?Q?sxOMoClEGt/IiD4jPe4sWdg3Vo5ggCs6luBt55EVSmDstdE00kg3LzsFAPSb?=
 =?us-ascii?Q?f4fSUrLbB4JeCqcZBL4+DazgDhJYwVB35WxDTbPHjSYXoVTG2v3lD73U6aTz?=
 =?us-ascii?Q?0uRh/PLuFIHql7+zUFmHrbM+Kw/F5zAYI23d6ULxKLxHfcgHCDFEvGiPJ4NU?=
 =?us-ascii?Q?bhKn5Ic3Gugy44F6VQ1Y/zvmEWWbGtZms6gEPwrgU/HwSqJ0dpu+7+kC05WG?=
 =?us-ascii?Q?4BssceX4HLSwhEc5aYEJ8id/c5MrXfuDfjKPDZ8DP0s8uIGI6iskaOb2nq0W?=
 =?us-ascii?Q?I3J0E9rwmKRHDxVGZrGNv1sAim1OpWygnJkJEibrF08Dnrtn5bV1+KeAQSb6?=
 =?us-ascii?Q?zFo+lVJO6OOO7w/upXf2Cm4uIaCqXXanTYS2I1L/+7/eR0d3OK+n78bTPiUC?=
 =?us-ascii?Q?WjWWe7yumE+zk7GlvV7R1AuHF75mD0Ofl6TjgTxZbyyyqJIGqrd7TUE81tuR?=
 =?us-ascii?Q?rhB1fqktC46zewtSMr4A/DxnMlcBtv+idAh9ZtfsuIVoINAHSf4yYN4NnmZg?=
 =?us-ascii?Q?9d0foZzXSrqNl+SgHTZdqgNjakKN0AsrQFff5Zw86yY0PZDdgnIMwzhFV8YG?=
 =?us-ascii?Q?N0INcmAFnz7GJkS1JedqYBqWa5QkrCFq5c0XZRloRwBiSICxDEqdD19i63cL?=
 =?us-ascii?Q?yy6Tm9cEhMzCjYBrSutoQBLs8B56UMBOBDbyF1/XBPycJbmLV3CBpzxv2YWl?=
 =?us-ascii?Q?Njnn0XGa+qtLGU/sp7Fb9eDBAxIq17cvyuTFUeMRTp7MvZQ3iIlAnhHpADJw?=
 =?us-ascii?Q?X5l7jiAhEjxF5t24+eOtlBbHeJAh/zuO8SJYRQX/OqAg8f7827ZXHBoPfq/E?=
 =?us-ascii?Q?w3x+4GXKwhb7lGLDAyN0eQnJpRO4FyvSvzygksxaUmT2UgxQkCAcwcexA57z?=
 =?us-ascii?Q?KlLjewINeJx6o1u9DiR8+pIemuvXSwTTo0tdwppmnYxHugrLjw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DwPB0QQVab7bypy7PAYrK2a/7+L2639SElJVpKZnlA7pwlxJfTPrAqlN7dn9?=
 =?us-ascii?Q?ghnEz9+KJQp83zDOnIOAWcYbCLqPR1v2R54GCatT4z8YTN7hwB68wzzgeXBE?=
 =?us-ascii?Q?Bv/gIq/HybHeDyQDaRXIt7K5VhWH92Yoq3fVKHg9EHWzgsVpmW6f1U35s+92?=
 =?us-ascii?Q?0ccs3W/hkWFJt4E3agbtI38/oEGxDhfoNuWWD/ArvHb+AYoZlpJ/diBxqmsh?=
 =?us-ascii?Q?x3ZEvXnZwJuZhNCSIhXwxSvBb9fR22/d63JcCUcrtXUmMak7GjQnDaLrhH8P?=
 =?us-ascii?Q?gISpzeW7KE/P4MiS8zKGxVKr4CVfSGbhvrfVG7PkiwmBssUgDkLoeNJsFShA?=
 =?us-ascii?Q?yM23kTJLifKoe70d+O+VCX6yxH8/UeBP460Lu4uATtT5A0ee+lAONcKnTlDc?=
 =?us-ascii?Q?VMQTxp88vKk3iW1N5l8ylC6Ocubim00kweC4ANVhdIcAV0jARpDGhn9o13iL?=
 =?us-ascii?Q?N7X3r0a9SnRbk0FOoImabbGc5nYwEdXz5QQyyu94f3lhSQ6JeLbdmNKLkc+J?=
 =?us-ascii?Q?POm8bf4Ix9XxfqT5jZlPOWTrOAu8aLLQsZuoJ/ZeFIDbeTrQpz3mvO9Ke+kz?=
 =?us-ascii?Q?YiX2elR7MN6vXX9SK/FZ+E6EbvokZOSlVNRE8VBp2O7KhEdjm/CH8y+RxeAm?=
 =?us-ascii?Q?bRXECEAMkQpo42gM5elMDYLflppVaXA7auZ/m2druJWZoUhlBmwSsh1xPS3v?=
 =?us-ascii?Q?44FM4JA89fXKXLjIgUy6Kv9O6K1dnN457mlce8XpSwV3APldhOvC8fgGoB2E?=
 =?us-ascii?Q?bF/Y5iduUnef38/t+WaBF6xN8ZvYbgzM1/zWt6dkbeFsvbGaGyg9uzPpWG9f?=
 =?us-ascii?Q?FwG1sZ8vOAkr7joZ4hMU01NceQsp0wHI8LnS5dCRiZoejIfziR9fDWuNJmqB?=
 =?us-ascii?Q?5OGNlTt4juN4dibhUjA0RT6NX724VgdDzaWH8Jg8qZh1MoCdeO90/Z+cK2xi?=
 =?us-ascii?Q?HYGupJar2imY17aDlUff6mCq/brsuXPzo0ylN4m9yLCm7atNL5IHRW+Dh1ML?=
 =?us-ascii?Q?CkYZHA29EJ5aE61l5dsZUL0DpsYcYUFaTcZSyY3Zu+pV9s7lwj3r4OjEICBW?=
 =?us-ascii?Q?yKJwT+k9z7XMiDdErAC+LME5f86O3za6StUSCPJV0QAi54ZUnQU9ZV3EihEE?=
 =?us-ascii?Q?VJcd7ZtWftyrDISx8xcDzx9awIFgUwZ0UesAWNTGMPM0ZlWfk0iNTwiyLl7i?=
 =?us-ascii?Q?hRDv5tI1jzG1bLYFpQx6/NGBf0hUBrL5eJVZgWv8jXQW6zUhEAjm0tarxoBt?=
 =?us-ascii?Q?j5I6PP/hx8WMOvtKuD/SxxbLFg9LKB1flfcrJnTgsDknMgwAmyIbDDq74NEK?=
 =?us-ascii?Q?TBofSmYqkQr2muFQX4YiMXqdLVnNp6LKc5j6HtBgb9cvYPodUK9cr4+H+cVE?=
 =?us-ascii?Q?PnUKFs3qQg7zV0epOd/ZO6OCknuAvDQLo+jS5sHeAFYe19yVnxmDyyYITsIi?=
 =?us-ascii?Q?49KrnD/Yucxp485f2FoeuNgjmwws4IksLto63W+DdmLIyCwTblyd1C/lXh34?=
 =?us-ascii?Q?levPlhExZ5Fe6mZm7bcP0g1hkqGXEwWuTmWZu+aZ5T1a1oC9ggtU108vzM4t?=
 =?us-ascii?Q?hxoolhMgdiqzcz+6MPkRcDboFq7QdOX0SqUABhmu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 275a3e6e-cccc-46b9-d1e5-08dca1130c69
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 19:03:56.4031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pNHaA+LxyWVRlxSQRyzIVyQQ1WIDj5vMzrFSbSbIupdq4NP9z21sxdAzZn3EapFE6nGMiDtJf664kqq3sAl9dXj++XPqyf10ssOq98HHr2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7917
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
Subject: [PATCH i-g-t 2/2] tests/sriov_basic: Extract enable-vfs-bind-unbin=
d-each-numvfs-all subtest
>=20
> Extract the 'enable-vfs-bind-unbind-each-numvfs-all' subtest to
> simplify blocklist management. Currently, there is no straightforward
> method to block dynamic subsubtests, and running all of them becomes
> too time-consuming.

My comment for the previous patch applies here as well.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  tests/sriov_basic.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
> index 95a462709..36bca4149 100644
> --- a/tests/sriov_basic.c
> +++ b/tests/sriov_basic.c
> @@ -62,7 +62,12 @@ static void enable_vfs_autoprobe_on(int pf_fd, unsigne=
d int num_vfs)
>  /**
>   * SUBTEST: enable-vfs-bind-unbind-each
>   * Description:
> - *   Verify VFs enabling with binding and unbinding the driver one be on=
e to each of them
> + *   Verify VFs enabling with binding and unbinding the driver one by on=
e to each of them.
> + *   Version includes dynamic subtests that allow specifying the number =
of enabled VFs as numvfs-N.
> + *
> + * SUBTEST: enable-vfs-bind-unbind-each-numvfs-all
> + * Description:
> + *   Verify the enabling of all VFs and the sequential binding and unbin=
ding of the driver to each one.
>   */
>  static void enable_vfs_bind_unbind_each(int pf_fd, unsigned int num_vfs)
>  {
> @@ -176,10 +181,12 @@ igt_main
>  				enable_vfs_bind_unbind_each(pf_fd, num_vfs);
>  			}
>  		}
> +	}
> +
> +	igt_describe("Verify the enabling of all VFs and the sequential binding=
 and unbinding of the driver to each one");
> +	igt_subtest("enable-vfs-bind-unbind-each-numvfs-all") {
>  		for_max_sriov_num_vfs(pf_fd, num_vfs) {
> -			igt_dynamic_f("numvfs-all") {
> -				enable_vfs_bind_unbind_each(pf_fd, num_vfs);
> -			}
> +			enable_vfs_bind_unbind_each(pf_fd, num_vfs);
>  		}
>  	}
> =20
> --=20
> 2.31.1
>=20
>=20
