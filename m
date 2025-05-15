Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E18C2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 18:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6466010E948;
	Thu, 15 May 2025 18:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYBDMJFF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A1310E948
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 18:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747333466; x=1778869466;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=eJQIf0qaUHtSdl/J9PkiWr9d7ghs6ZNyAUDNmWXD3zg=;
 b=NYBDMJFFRnDfymxSHK/RbH5YSCjdpM4szwrJvvUBjOlPOQAkgkj7Xmcd
 70Ynsj10sPvhPCJE9NUIBBoxlzWWWZpRyhVHx7h6jA5iIU7sXeoFHBUkA
 ukyas4sWVlSVIHyXyLrOTaPKV0AcWvhUo2ZdkA8uqoApguQ9U79hct+QE
 rAuuJl7zsgTcK/FUM6SpEryMyDp85bGltasFh9c9AZDWdwMqVj7WuSyUw
 De8h3unS+VCJihAbhF3SXhaW6onw9m7o4v+5+TyRSF0Y3PviVM3M8sGl/
 0gsco2SST7uUtAScENI9KOuWH80PYhvJRmdsbqF4YLwqXbcN5Ztw26Tb+ Q==;
X-CSE-ConnectionGUID: 6ZBl5bnIQd2IiGEUQ0H2bQ==
X-CSE-MsgGUID: efTaaTJgSG+Ef6qWvTZbQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60685554"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208,217";a="60685554"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 11:24:25 -0700
X-CSE-ConnectionGUID: Kk+hVtrNSla6tjtIBnP+/g==
X-CSE-MsgGUID: 5d2RnB7pSrm/fm1uXw2ECw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
 d="scan'208,217";a="139452021"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 11:24:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 11:24:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 11:24:24 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 11:24:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuvGOluKyTrlF06n2WTCdCP7uNGXDr2e/SvkRxkuC9P8TXDvrghBofBQ7gE9yPW7NK5gBxbNPBUQ+4gyTLqQ3lMbt8lJ+KNmD3UwzHI8fRoR158BA1PqXdHl4JLCdYj9yNrezcWX9aPBQcG/6+VyMLiOF3AixmiHmDT5vmEy2If+5bzMS4UXxGylpbAb5JReu4uEv5+HzKp+HnDxzCgLBz0i1lvuybzxotLSVs01ZVg8SHB+jEQ8J0a7BiJtSXNg8qLhUD1UHDgnqHS2EKn7jPZJwHDqqLsYDH8GV0Qt8ZV2dU34pY6LmIzur4sfKvSF5FcheSev5eaeM1Rl06I62g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+3/OGg9uuh0kHLLxl1aQ5BXBP2+C796kQeyGC77WVU=;
 b=GN6rGLqsNBK8/cdxti/nwozfiu4k6/Q3SvGXUdfnRAM1sOKNRvKOdLnxP78aYgqnE/DAnuiQ1XjJkH+/hCEnFeFTwaOqZ/XrkL4techEHP0VIn73rcJ3wM1kpYTSY0l0y/EdEJv82frUF/UAJYl9bd3OXKXV/JxYKkSwNi+BGw4Ly0S0d1kJlG/z6vWtd6Cq2Xh2y0kLAJBU5lg6+hl7D5f82ndvob3mAu8oiXB+IoL1N/WTcie6t7UYadPesdElBiTcKL8A7/Hl/AoUISoMtOHte+k4mLLYyIOapPelFSwIx+MhA7UzBUeyXKn11YdUaGmEMjrWnPzYkp3PPyMqAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14)
 by PH7PR11MB6953.namprd11.prod.outlook.com (2603:10b6:510:204::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 18:23:34 +0000
Received: from IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240]) by IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 18:23:33 +0000
From: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "markyacoub@google.com" <markyacoub@google.com>, "seanpaul@google.com"
 <seanpaul@google.com>, "Santa, Carlos" <carlos.santa@intel.com>, "Singh,
 Sapna1" <sapna1.singh@intel.com>
Subject: Re: [PATCH v4 15/15] lib/igt_device_scan: reuse igt hash
Thread-Topic: [PATCH v4 15/15] lib/igt_device_scan: reuse igt hash
Thread-Index: AQHbv2m2qyIcKSo/xkWdfKVCLFb8fbPSYcEAgAGrbdc=
Date: Thu, 15 May 2025 18:23:33 +0000
Message-ID: <IA0PR11MB7353F8B754EFBB51A2DA3592ED90A@IA0PR11MB7353.namprd11.prod.outlook.com>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-16-jeevaka.badrappan@intel.com>
 <grv3t2jfem5voffjcwst5osi2dlpxsr2wxyeuhm33c4w4tw3wo@rhrj75opoukb>
In-Reply-To: <grv3t2jfem5voffjcwst5osi2dlpxsr2wxyeuhm33c4w4tw3wo@rhrj75opoukb>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7353:EE_|PH7PR11MB6953:EE_
x-ms-office365-filtering-correlation-id: 74de7977-e45f-4458-5a94-08dd93dd9a0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?h/ZT8KAEqFUoQ9m5zSJBA3L4fM46YMcLYxnfIEoTjsKmPWXHO8/ycPBCXO?=
 =?iso-8859-1?Q?Wf3IRlrHq+uTRHC+dviSyeZxch+28df2lbBrdgrfMotdcVjMsfO/mDmwVu?=
 =?iso-8859-1?Q?fnxXZEBkaAcdY175P8VWUrp5hXvP9KAwItKovpTTiOxwhzHsI4CtlCa1Ia?=
 =?iso-8859-1?Q?D+pumZJGrz4C/JRxo9nsvt7B7okkXsIHYD9BP/RGnHqILoFn7JN4xr26di?=
 =?iso-8859-1?Q?LSt6r7+ksOVdauWIjn/UFCgCo3D1CXDJlEbEJv2l0E6NmU3a8mZHQYjZOV?=
 =?iso-8859-1?Q?mOzRWIMqucbLDNCW/wr4F8mDx16IpE5Dy6luzL1zAwP1Yw+hkGYJKC5hpB?=
 =?iso-8859-1?Q?X5PviyfTC9YFtwj4eCoBbjcYkPwIeboBA6bnzTVS5Iy53KdbkpfFxG73RG?=
 =?iso-8859-1?Q?pYY4Iv55ldkRtHBIMzshoGJ2OrMarnWNyANS89j9ERGuppLtb+3UUIAknw?=
 =?iso-8859-1?Q?Jrp7AXMgoaWWZ8xer027vPm0fU2cD8SiNpJo1oNiHqU+RPC5UIh5nxYPNE?=
 =?iso-8859-1?Q?MZ4x/OcJoigQOncAFSa3Oz7KYbxTxgBL5wY7uiN+jMd9sk/FXaM2DE6akl?=
 =?iso-8859-1?Q?w+6f8dRSrVOrLV9EkadfgWGLu5RgGA6NevP4Kx+iqE3nMauMmWfkHB7li/?=
 =?iso-8859-1?Q?czH3NotuN/1npSx3WzqCN8Xd5r1DoiLPI4mJvhlukXhnIfP0WFbnndERXe?=
 =?iso-8859-1?Q?1iKIYKWMuYjFxuf7s3rM812fzO+RLFGLgf4hyDLizVPKX31zbmrkYIq5mW?=
 =?iso-8859-1?Q?TFH0ACrh24PjOX1e426nf/QFbsDSYl7kHm/BNqACHb64YzNjmgzA52XVBy?=
 =?iso-8859-1?Q?ott8aaHdCqDmye3/ympNmf0Ybr4yj1Z35obpejYdqqm4ab3fMdtOhCLH7Z?=
 =?iso-8859-1?Q?14RIGbFWIs0Ar0REHEg1MBHLY1g1a1jH+Z5NZMXJoo8hk8byPE/GK4uBmR?=
 =?iso-8859-1?Q?IQOLRoWaXDaXoj9fftRkota2PCpHLj+CS+kFSAGEIGUAXx9p5dFBR9cE0q?=
 =?iso-8859-1?Q?oL6nlPBrJlDQTTwUtfh4dFhBUQLUWbfUNNcNACNm6BpoejaWgINLjiUsNc?=
 =?iso-8859-1?Q?PIl1uaj6d65ZVqLp2S7DpYEjDy0gSui7RzmtQZxAznaC7SYcrNmwNTfCQ/?=
 =?iso-8859-1?Q?FdYncXKvg+C7Op01ujxA2zWChpRpkcL7+VKSNxG9vsk0jhgo8fR3iFdLHV?=
 =?iso-8859-1?Q?Hv9ZeiABEHvzKsaJzVdgX/6FWQXrV5rwkS13QjkvO+FYu5KermW+APn8nh?=
 =?iso-8859-1?Q?P5lLpWorCpWX2izgS6i303u/P4/p4haa8WwkcHWcBaIUIyvFoT9eDbrHmq?=
 =?iso-8859-1?Q?wHp1BEbrHsFSrQwEmR1IJnUIqlfvKqKhSpx3A9NPYvyi99VxvI+A8QwhNX?=
 =?iso-8859-1?Q?ArxV6Ssj64Xg4Ju9TwAZAicM/CFPQZ/hMzpSgfArRXlEeeujWBeNYY6mUr?=
 =?iso-8859-1?Q?gtWwYOe2fIXnssikf8dn0Qb2+4liQip+GmuU1MZ6SmQi0TIXj+j7ltCzYp?=
 =?iso-8859-1?Q?PeuNkvYG8QLYpdf2G+Ulgmf9NyKyyt+m8YbLdJGfJo1Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7353.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?h9b4tfIP3pzuM32g4WrBTKGhafFfIB7TVryIqXpggEMStDu2OlUEjgMyQW?=
 =?iso-8859-1?Q?UImX47BY00A80XFef97meSTamHnZKyNtupSItST1Ss+w+P+UGNHthxyYz+?=
 =?iso-8859-1?Q?EFKF75sGqkRUHq/Tv1Dj3vcYyiJAWtuaR3T60+X6wUAbj/J3HexEM8IDgY?=
 =?iso-8859-1?Q?zDJQ2AlXMOmPPX07pcVV5BSTfPhEgn9Rud6jZ9lgUSDY/LW+SDLH4JjS71?=
 =?iso-8859-1?Q?EboZ3iYY0s5w9wZRYYvbn3s4F8ECGrT1nht8vTW/qJ4QT6BW30X2JMH7jH?=
 =?iso-8859-1?Q?awzty613v3M9xX22a+ekM9K7y9N+KVPOaBkpWqsxTVNp27hkPTEohjqg2S?=
 =?iso-8859-1?Q?/sNDWAuUEBTGUINnRwQzd5IDVjF/tZCM6BaXiUTY7SMh25ZvVgNbOpxfaX?=
 =?iso-8859-1?Q?DsOKxguu3omJ82vMKIAu2gOIAk1DX+IEKBBrHMsPO/sI3++4EWtD3F9tfr?=
 =?iso-8859-1?Q?OeAHJbsaM/G8vku3ZhR4uUSk+fvlwCoP+MLXJnTpv0prNnGZbEHQpz/oXU?=
 =?iso-8859-1?Q?9RPzkJvQ4g8UYSkkISQI8jlZ6CI3Kdn250/5zHfRDbzaY4QDqTzxvwu2UG?=
 =?iso-8859-1?Q?iYTNx6Q+2kmb6DupsM+biI/q3AepQwWcYGNhTNFVUoYcCqNBlK4wm5BD4i?=
 =?iso-8859-1?Q?8mSxmk4M9H1pZaITL1WGEua9MvQKj8uciJ1xbzc2ACcElD2+oI+gWeVCwn?=
 =?iso-8859-1?Q?XLy6YUKr2AKLfyiBxv+Fnx0EiLVwAEqEEx/dyZ6qEgfZQjx3AKloGnjA6R?=
 =?iso-8859-1?Q?PwvQ5cpRewxLKi+PsL7Cx5IWScMzFfB2mPm8qy7dkTgN55Bqu6MbDVFTlr?=
 =?iso-8859-1?Q?Y7gPslV3ztCaE2ljys1Gwr/bPfdILLuiNvQc2toLK5arFTPrVEv3lcWNrW?=
 =?iso-8859-1?Q?s5X+HzfqvQzt7mhngHd7GUlmikLzEwkmh+9fqPrOPZqXP0YD9VwmQBg0aB?=
 =?iso-8859-1?Q?UaA5rt5oTWj61JCEKNquNn/urbFj0a4/bi3mNGmYpQ1cHjivyIhPCEnPvz?=
 =?iso-8859-1?Q?tvBfk+vXjm6XOdQFY3dWx7Z4+vPeGh5dJ+VLB7DX8cfyJz372Jj5DfPDu/?=
 =?iso-8859-1?Q?RNpuU7BSyGemSxs2Pp6ShhVJgyvsjDYAg61Xh3cEKFPHJ9EwC4hte/nxyY?=
 =?iso-8859-1?Q?LyY8ldKZjTcT7r8+4VC4qgDjhZgtYDu61MwfI7yGEKIelEp0/ZQENAhxTp?=
 =?iso-8859-1?Q?NyeqBNFCaNCdBxw3K3ZHyGgnTwISgk6ByIyDFQHrmOlCnYKXM+XbEKAriT?=
 =?iso-8859-1?Q?p2oq3Stl7qACeNlTAZLoqnu6U9luvqO2MbFCbz6GuRH6DFPeFaJVB3f2kH?=
 =?iso-8859-1?Q?JSEgywzhwl0vR0mDclm0gsvx+6B2qdJrBcRML9zPEsTDUkhSA9/jcF7nTE?=
 =?iso-8859-1?Q?t9v2RF1EuMliVEDJQAzS7HqpL2dYnyon8E6NnP0ukO7C1svRftzQ8EPWS2?=
 =?iso-8859-1?Q?VA+ZsGZDFF8KJxsk7HFzMVr4n/TOmEiiOKIkga+X2GWhFcVhSfFQtLlWWJ?=
 =?iso-8859-1?Q?vv+xGVxwS5+UTuYxLwQJvavNzujjU0GH3WoK+MbBngtxUwUFNn52h2IA3v?=
 =?iso-8859-1?Q?2OOXI35Rirq4bRwRMo2yic4lcIPj4ep9pZG5zE4wPzCKnKYp6Du3XTTYCw?=
 =?iso-8859-1?Q?2cZEx73QmqgvIVZkFXSYtfal65uS/Ptlur?=
Content-Type: multipart/alternative;
 boundary="_000_IA0PR11MB7353F8B754EFBB51A2DA3592ED90AIA0PR11MB7353namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7353.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74de7977-e45f-4458-5a94-08dd93dd9a0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 18:23:33.2702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8QjnC8/y83IzEGHW5XjKfJUcf1VKhyYtJhk0RIylS7FJUyavm2BB+DGpQL31pG7DQIfm4OZiA6zxOCECStyhcM317bhx0CjSPR0MrtBmHrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6953
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

--_000_IA0PR11MB7353F8B754EFBB51A2DA3592ED90AIA0PR11MB7353namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


>  #include <libudev.h>
>  #ifdef __linux__
>  #include <linux/limits.h>
> @@ -224,8 +224,8 @@ struct igt_device {
>        /* Point to vendor spec if can be found */
>
>        /* Properties / sysattrs rewriten from udev lists */
> -     GHashTable *props_ht;
> -     GHashTable *attrs_ht;
> +     struct igt_map *props_map;
> +     struct igt_map *attrs_map;
>
>        /* Most usable variables from udev device */
>        char *subsystem;
> @@ -464,6 +464,11 @@ static bool is_on_blacklist(const char *what)
>
>  }
>
> +static int key_equals(const void *key1, const void *key2)
> +{
> +     return strcmp((char *)key1, (char *)key2) =3D=3D 0;
> +}
> +
>  static struct igt_device *igt_device_new(void)
>  {
>        struct igt_device *dev;
> @@ -472,14 +477,14 @@ static struct igt_device *igt_device_new(void)
>        if (!dev)
>                return NULL;
>
> -     dev->attrs_ht =3D g_hash_table_new_full(g_str_hash, g_str_equal,
> -                                           free, free);
> -     dev->props_ht =3D g_hash_table_new_full(g_str_hash, g_str_equal,
> -                                           free, free);
> +     dev->attrs_map =3D igt_map_create(igt_map_hash_32, key_equals);
> +     dev->props_map =3D igt_map_create(igt_map_hash_32, key_equals);
>
> -     if (dev->attrs_ht && dev->props_ht)
> +     if (dev->attrs_map && dev->props_map)
>                return dev;
>
> +     igt_map_destroy(dev->attrs_map, NULL);
> +     igt_map_destroy(dev->props_map, NULL);

> What for are you freeing the map here?
map and also device is freed if creation of attrs_map  or props_map fails.

Thanks and Regards,
Jeevaka

--_000_IA0PR11MB7353F8B754EFBB51A2DA3592ED90AIA0PR11MB7353namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
&gt;&nbsp; #include &lt;libudev.h&gt;<br>
&gt;&nbsp; #ifdef __linux__<br>
&gt;&nbsp; #include &lt;linux/limits.h&gt;<br>
&gt; @@ -224,8 +224,8 @@ struct igt_device {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Point to vendor spec if c=
an be found */<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Properties / sysattrs rew=
riten from udev lists */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; GHashTable *props_ht;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; GHashTable *attrs_ht;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct igt_map *props_map;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct igt_map *attrs_map;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Most usable variables fro=
m udev device */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *subsystem;<br>
&gt; @@ -464,6 +464,11 @@ static bool is_on_blacklist(const char *what)<br>
&gt;&nbsp;<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +static int key_equals(const void *key1, const void *key2)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return strcmp((char *)key1, (char *)key2) =
=3D=3D 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static struct igt_device *igt_device_new(void)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct igt_device *dev;<br>
&gt; @@ -472,14 +477,14 @@ static struct igt_device *igt_device_new(void)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return NULL;<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; dev-&gt;attrs_ht =3D g_hash_table_new_full(g=
_str_hash, g_str_equal,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free, free);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; dev-&gt;props_ht =3D g_hash_table_new_full(g=
_str_hash, g_str_equal,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free, free);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dev-&gt;attrs_map =3D igt_map_create(igt_map=
_hash_32, key_equals);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dev-&gt;props_map =3D igt_map_create(igt_map=
_hash_32, key_equals);<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (dev-&gt;attrs_ht &amp;&amp; dev-&gt;prop=
s_ht)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (dev-&gt;attrs_map &amp;&amp; dev-&gt;pro=
ps_map)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return dev;<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_map_destroy(dev-&gt;attrs_map, NULL);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_map_destroy(dev-&gt;props_map, NULL);<br=
>
<br>
&gt; What for are you freeing the map here?<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt; color: rgb(0, 0, 0)=
;">map and also device is freed if creation of attrs_map&nbsp; or props_map=
 fails.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt; color: rgb(0, 0, 0)=
;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt; color: rgb(0, 0, 0)=
;">Thanks and Regards,</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt; color: rgb(0, 0, 0)=
;">Jeevaka</div>
</body>
</html>

--_000_IA0PR11MB7353F8B754EFBB51A2DA3592ED90AIA0PR11MB7353namp_--
