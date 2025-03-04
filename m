Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4500C021B8
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 17:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8368510E660;
	Tue,  4 Mar 2025 17:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yy69BzTm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6862110E660
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 17:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741107956; x=1772643956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2T0rDAvJ4VdAxN+jWnn5fqOWiW6xUienW2Pb+lMtLlQ=;
 b=Yy69BzTm9BrAtEn56ICxSCT4aSPU/8q2I+u9uMtEnnsfEuCaU7UWpP3E
 zlb5B/9N1lbWz6kzkAtu+vEmDXvxOxNCgw1Poyfj6B80N/2rYV8Oljjpc
 xd4AbaZRnKw27OspqCmbLf+oDNlaBbBV7eo2vm+RlnLyNjORAD50WDyin
 z74ctUi9xGsZWoAb2cZRLD/AJi9lm+u0NV/ZdTjA1Ol4YeYV05ojHWEfF
 rRnWF9E0HR5nqc58nu0IRba8S9Qfz6wlZDHjNcUmpGw1pHIkiqTVCv38q
 RzHrD6DIP9pLgcX6K2c34OmUaSeFbYLG7eH+zRRUBjlA9BqESsDb+GKkJ Q==;
X-CSE-ConnectionGUID: xTybRNupTx27IBHMVXLzoA==
X-CSE-MsgGUID: dqvVFLlJQ4aAqeh4q0UdAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45965282"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="45965282"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 09:05:56 -0800
X-CSE-ConnectionGUID: 9NAcE0IRS+2ne1Lf202Opg==
X-CSE-MsgGUID: uwW5KsLSSiKMhjQ8gdg7aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="118427960"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2025 09:05:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Mar 2025 09:05:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 4 Mar 2025 09:05:55 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 09:05:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHiqqTqEAI4e1z+NH6dPkthbRq63k2RiwS3VET6sqenVRX+FPZIgUoNcdc8IObI02ANshKL+de3OYLaVkKoMyzjdM5wzxSkSRRrYZgCHVzrQhxirB0VhKqCLBidZY4mBW1rC/8SoiZc6WCqNSzKSJ4QYcwQU30LdwS8a3oq8MXBeYq4z1IlwrDdhBD8lqcPqLu0eTBHOlNkeY0kPL2S1yZZnKSK7Y3SS3/cYRWG1hUj/gP0tXf+bCSBxv8/q4cJCR0rx1eo6pXU+wxixp4XXicHqRnkpcZ8K7QHsigug5V7TUqYrEGmkqWOhZFZeL1GYOmAsVEHUG92b8iBUFSodmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhOjs1xaytjH3lyPykN+xJ3tcL6cytP/MENYF3QqYWo=;
 b=oHBu+PgKJbgFDfrW6YJwDZzul44MemFMVEue9fAaiT7gcGS9HK6XTd/5w/sQZYnRmEFerZsjvPGgdwG31lSxpW/S421MnB4+cu1ltU/kuSsKH3RNPEAAl5SZ+sOWV4MpwHZjFLyHaHKqvAFS6w3mBpK5EzPk56J1iabaeYs9C/6erZDE50cIv/Z/bbAxZwvsuGvTSNbt29QWBboGoOGdg7ZwdXbXOQfhhLH3aSbFxOlkIN15SvvTGtrG8n+qLTDLXXU4xA4LqteK8OdFNkJfWYIpPECnFhQ8V+PQQFfKDJRFfNLJB0UxOIaAp+IceNXE9Wb5oy7llJK+uS2T8ojniQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SA1PR11MB8794.namprd11.prod.outlook.com (2603:10b6:806:46a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 17:05:51 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 17:05:51 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v4 1/2] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Thread-Topic: [PATCH i-g-t v4 1/2] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Thread-Index: AQHbiM7UbRTid0SQ+0qp+pLUAsf1dLNjNy0g
Date: Tue, 4 Mar 2025 17:05:51 +0000
Message-ID: <SJ1PR11MB6129D425A9B33E5B4EE2734EB9C82@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250227041545.2465720-1-santhosh.reddy.guddati@intel.com>
 <20250227041545.2465720-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250227041545.2465720-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SA1PR11MB8794:EE_
x-ms-office365-filtering-correlation-id: fe5e99a6-2ddd-4972-78d3-08dd5b3ed15c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pVkeR7WppTk22u7UTefeLqsOHOPV9vyL0gk0fbl9llSYDHuFM6Q8zphyr73p?=
 =?us-ascii?Q?XGCAoItwO7dPs+Es6nwQMyCNAs0/ChV2jibSmzNwlKIXcLEGzq/ZiPZF9Olb?=
 =?us-ascii?Q?AbYe85ObPhZ9gWhUCLbqBzU7yPUH/tjM8N5JKDxi1TLUA+hDgAYbXp+5/tUn?=
 =?us-ascii?Q?TR8UBBWT9TNFLv+0WwHGj+a9PzMQypR/g+zuJA8feB+zRQJE3XklKTnDmxMo?=
 =?us-ascii?Q?VvZm5PPGTM65VLx8+YECIzr2bLRXLeOkpTwKPSX8Sw+hHRahXN2EJg+7ruxi?=
 =?us-ascii?Q?rcaCC0W7TfWr6KRjDoy1efTrFdEKMNvYNfqEZC+UyJud8vSY0vEDRpyPg2TB?=
 =?us-ascii?Q?3meA/pU1HQKiPlKhNb2ziVDEmOEtPkCnyolHs8B+cpTCusb9miC3BbaCUBdj?=
 =?us-ascii?Q?LvypkQ4EH33RUklhRK8x4mttdanGjWhV5PryICKi3MGR7fwlhJq5KAHQe7Oj?=
 =?us-ascii?Q?uelxi2n0kRgcdlWI6qKw6Dl+AWDr/V1gsWm16Tc1AdCvkSTZQqb2HFrucKiL?=
 =?us-ascii?Q?H+CTlO83eV3tdmq54qjFcw/vNhItMirqXUtpoQbYRBTJK5Ycz9Q8MdN9xtxD?=
 =?us-ascii?Q?XHmlH9g+sTUEL6gUXBc56sb7BViHlsW9KN5JspI/kKCG9P6YTsQozbGZuvAw?=
 =?us-ascii?Q?nU+kAUOe4CDPouGnEjP5B4lnoM3QXzv3vcgoN4j3i0QgE3boBvSdS2f9AZIl?=
 =?us-ascii?Q?jeHTfMK62rApHxva78EAnF8NU5s531TC5D7rgeG5IVMoRrSb+d8D8qQ3HTZN?=
 =?us-ascii?Q?+ipg3jBWV9h5UJ8Y5MLM/utGJxvneJbatLJXSi6wfyUy/m6QtpWd52jx+DHW?=
 =?us-ascii?Q?6eCkCAafs5dQtlu9+LMMMGH7mX6FNsGZ116fhWyEJNkv7iel6UO2vFSemDqn?=
 =?us-ascii?Q?MEayu9LrljxIp0eWmUU4cXqG5Al3ApkHLvnPzrqIi9NFA/Ixq9cwZCgPNjIg?=
 =?us-ascii?Q?hIylmAk71zh9oDlcf8BtdL7azrCgN6+E/ymOZXohRTqU1IwWaYdooEohKiiG?=
 =?us-ascii?Q?dxlfoTpj98uk85sZ0fbTKA/S+Fb4jIQ25t+YtJVQVv6aNvMYB1/+LE77L0i4?=
 =?us-ascii?Q?lfoShVL5k3MCa4H0h5EhBJyD+0auqFpTeNVFtsZCZJnmeHU6dB5aMXiMz1x5?=
 =?us-ascii?Q?fotdafq/TT9aizcHx67zWxcThb8Hcq+f+cqea521JMbx370oZaUfKFWYrFqD?=
 =?us-ascii?Q?pUNAL7xZL+o4gQyQZwIuCGG/pdJf1h8sqiv3On2cookK23e+I99rGL3CJ1yQ?=
 =?us-ascii?Q?ZeqIakGeQyZRndy9mpJSHACvkWNa+QpMFPT8Br48BDZY4QO0Av1XFgk4fcSM?=
 =?us-ascii?Q?yvyGPGa3NXRQVVTqpkMzPcaOmY9uXCNi28dTDAtES4O+Qp6xz37rYQb+L4Ho?=
 =?us-ascii?Q?KsNfZEqll7YoWs9knsLVMzBfjkKZCfoXUNQmzQl6YSZP8Gk+Ug=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p6jFzRSOhuL406Bv2bd+5VkrkdDa/KWqHDRHK8wAO0ggSMsr6Wfycx6d58WF?=
 =?us-ascii?Q?3TxHuRVvrXxbkzAXBUyF7kHqHFukI59AzQ8gfqNfFXEod8moxC4rRN5muNIi?=
 =?us-ascii?Q?H/fOL0Me9R5yusVlTLxMUb/pZXpkasB+ErDmg+JpUDTCKCNa1ffLr1Or+Ygb?=
 =?us-ascii?Q?dZ5MO5C2/BTtceTcBGCqd3jk5bXjFu6bCfgsOZW4veoo6gchZe3HLhQ9sLpi?=
 =?us-ascii?Q?I3NZpL+BYjgY8RTFnG/35rfelGQJSYMhlm+bugQOFq4UAbYxZBcbmYrJZH3Z?=
 =?us-ascii?Q?C56bpZ3Oz9rvEZhyIYHWu0ztP0Hrr95xCNDXJIyHnJJDlWbp6Xng5O1JIpK2?=
 =?us-ascii?Q?j7KXg9yIU2vfDs0VbjSvr0/ki8Zlfq4ZkNM+Vzvjpfb7vCtY5yDwYBr1F/AO?=
 =?us-ascii?Q?X/hZAHa2kG+PDs0sv8hSlaSzd1MbqW6CB/6FJxdnWWauZHBQSkc4mb3w2yc1?=
 =?us-ascii?Q?wq/dGynXL8ae1PqoJLEb/VyS12c+81sEON+SBzrz1TjAPM3y6GxrdgWGL2Fa?=
 =?us-ascii?Q?lGWB8twJ8wE5MOqKRO/ZwhD4svpTh1xznZlqOJp/CVpu94exqSxEx2a7n/Ny?=
 =?us-ascii?Q?rta1MTZ6BL/M9CMmTkjGaIgMkBePTUa/vakWCiIp+LqxHokKkjx02tY4AL1k?=
 =?us-ascii?Q?FBNWy1qyWw6QxWgFJvuxWqIF6Uae6QZ0+R8gBNpHWHEPoCjk53Fx1bh4qKMM?=
 =?us-ascii?Q?KbF+N+/jRlTR8VQkHoi08WzLiJSZ7y6Vx0J+kRApp4IJXdxfyHTZA2fuYn1k?=
 =?us-ascii?Q?9aVfrLMsIIctMBrV8tVnjh+dDcfxVZOxmwVBiu4VY3d8vBPzmLBVqVb+99Hp?=
 =?us-ascii?Q?hqdZuu+iHRqy0IBWSjPvSDchkTTznJzON1/g+pwrCuP993SvX23E3wlrIQVV?=
 =?us-ascii?Q?62iOogxLJRoDEcUmGYcY4K8sbhbr1/hs0p2nD8OM+TgnzEnjLwHvMbafSiTf?=
 =?us-ascii?Q?4lci5/Ethne5C/JL4lMaoJJeeAAvVCzDXwq0GShfG+zTibtsdKhjVwItqhql?=
 =?us-ascii?Q?SZk8/sQDz8JHQ8FZAWDA1iY2moOdQLCUMQweyCRoUguVo1oG0voCfArNIF7l?=
 =?us-ascii?Q?BtFy5Zpg7CiMpqluJp30dAFWCsdEbzjvRpJO4APK6J/NZpY/oKv2KeltDnEe?=
 =?us-ascii?Q?Qz3aLsMBwPJptVcS+rGLILtrKgsNY1Ga7o2iQnI7vYmGgZJU0lN91Oy234il?=
 =?us-ascii?Q?Uzf/dz4XLOXVEw5RCdw7prL2c7Tg7yOE/7yWVMpBoCKYV1/QQUWXNwfuMApD?=
 =?us-ascii?Q?e0IkbfF7gJnIHnDPQNE+jaxRVXAwDGQ5ABh+Xb1uut+srQBuxz/YOxqK6cP6?=
 =?us-ascii?Q?OQEnBWOqmb3b7jX+nKpHPlactqahjeOlLzwKaq9YOqprDg8wYemK9V3f3K3y?=
 =?us-ascii?Q?0t6xfALjVgqpgfpVHuw3Bh7jsGZAY0PX3ivj4M7TqpAdE1zmWFsimZ5nqYYn?=
 =?us-ascii?Q?wHwlm9nSATr1S5g/pj3jSh0ftCCDELkj0ZbZIJEc1HQdIf3kOzFcTZKt2xnt?=
 =?us-ascii?Q?3bPBKULG0ujIXdIV5BYPmoiiDv/3xQD8wnfK6bIVbmswJtLa3j8jvPfltOi5?=
 =?us-ascii?Q?erMLabhDrSjeNF6Jdy/qZIV6aePdjch/i/dTtcP/XqGWiFQtqUAJynnE3av7?=
 =?us-ascii?Q?Ag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5e99a6-2ddd-4972-78d3-08dd5b3ed15c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 17:05:51.4848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pY/yVv1ww98sqChK9lE9qSC/bfkCXbKDlwN49nKMhLzHxeKfkOe5xnZzUYyM45uhWT6vgIgAMYgqGuoxThvFKXOurBGCtBENhcBFQ7CZ66w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8794
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

Hello Santhosh,

> -----Original Message-----
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Thursday, February 27, 2025 9:46 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v4 1/2] lib/igt_kms: Add support to retrieve async
> modifiers and formats
>=20
> Parse "IN_FORMATS_ASYNC" plane property to identify supported format
> modifier pairs for async flips
>=20
> V2: Add new fields async_formats and reset idx.
>=20
> V3: Improve commit message , remove unused declaration (Chaitanya)
>     Introduce structure to hold a format modifier and its
>     associated format list
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  lib/igt_kms.c | 57
> ++++++++++++++++++++++++++++++++++++++++++++++++++-
>  lib/igt_kms.h | 17 ++++++++++++++-
>  2 files changed, 72 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index cc3bb3ae7..c195d7b2d 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -701,6 +701,7 @@ const char * const
> igt_plane_prop_names[IGT_NUM_PLANE_PROPS] =3D {
>  	[IGT_PLANE_FB_DAMAGE_CLIPS] =3D "FB_DAMAGE_CLIPS",
>  	[IGT_PLANE_SCALING_FILTER] =3D "SCALING_FILTER",
>  	[IGT_PLANE_SIZE_HINTS] =3D "SIZE_HINTS",
> +	[IGT_PLANE_IN_FORMATS_ASYNC] =3D "IN_FORMATS_ASYNC",
>  };
>=20
>  const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] =3D { @@ -
> 5758,11 +5759,14 @@ static int igt_count_plane_format_mod(const struct
> drm_format_modifier_blob *blo
>=20
>  static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_=
t
> *plane)  {
> -	const struct drm_format_modifier_blob *blob_data;
> +	const struct drm_format_modifier_blob *blob_data,
> *async_blob_data;
> +	const struct drm_format_modifier *async_modifiers;
>  	drmModePropertyBlobPtr blob;
>  	uint64_t blob_id;
>  	int idx =3D 0;
>  	int count;
> +	int async_count, k;
> +	const uint32_t *async_formats;
>=20
>  	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
>  		drmModePlanePtr p =3D plane->drm_plane; @@ -5822,6
> +5826,57 @@ static void igt_fill_plane_format_mod(igt_display_t *display,
> igt_plane_t *plane
>  	}
>=20
>  	igt_assert_eq(idx, plane->format_mod_count);
> +
> +	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC))
> +		return;
> +
> +	blob_id =3D igt_plane_get_prop(plane,
> IGT_PLANE_IN_FORMATS_ASYNC);
> +	blob =3D drmModeGetPropertyBlob(display->drm_fd, blob_id);
> +
> +	if (!blob)
> +		return;
> +
> +	async_blob_data =3D (const struct drm_format_modifier_blob *)blob-
> >data;
> +	async_count =3D igt_count_plane_format_mod(async_blob_data);
> +
> +	if (!async_count)
> +		return;
> +
> +	plane->format_mod_pair =3D calloc(async_count, sizeof(plane-
> >format_mod_pair[0]));
> +	igt_assert(plane->format_mod_pair);
> +
> +	plane->async_format_mod_count =3D async_blob_data-
> >count_modifiers;
> +	async_modifiers =3D modifiers_ptr(async_blob_data);
> +	async_formats =3D formats_ptr(async_blob_data);
> +
> +	for (int i =3D 0; i < async_blob_data->count_modifiers; i++) {
> +		plane->format_mod_pair[i].modifier =3D
> async_modifiers[i].modifier;
> +		plane->format_mod_pair[i].list.count =3D 0;
> +
> +		// count the number of formats supported by this modifier
> +		for (int j =3D 0; j < 64; j++) {
> +			if (async_modifiers[i].formats & (1ULL << j))
> +				plane->format_mod_pair[i].list.count++;
> +		}
> +
> +		// Allocate memory for the formats array
> +		plane->format_mod_pair[i].list.formats =3D calloc(
> +						plane-
> >format_mod_pair[i].list.count,
> +						sizeof(plane-
> >format_mod_pair[i].list.formats[0])
> +						);
> +		igt_assert(plane->format_mod_pair[i].list.formats);
> +
> +		k =3D 0;
> +		//Fill the formats array
> +		for (int j =3D 0; j < 64; j++) {
> +			if (async_modifiers[i].formats & (1ULL << j)) {
> +				plane->format_mod_pair[i].list.formats[k] =3D
> +
> 	async_formats[async_modifiers[i].offset + j];
> +				k++;
> +			}
> +		}
> +
> +	}
>  }
>=20
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 27b545f52..111b61d7c 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -365,7 +365,8 @@ enum igt_atomic_plane_properties {
>         IGT_PLANE_HOTSPOT_X,
>         IGT_PLANE_HOTSPOT_Y,
>         IGT_PLANE_SIZE_HINTS,
> -       IGT_NUM_PLANE_PROPS
> +       IGT_PLANE_IN_FORMATS_ASYNC,
> +       IGT_NUM_PLANE_PROPS,
>  };
>=20
>  /**
> @@ -405,6 +406,16 @@ static inline bool
> igt_rotation_90_or_270(igt_rotation_t rotation)
>  	return rotation & (IGT_ROTATION_90 | IGT_ROTATION_270);  }
>=20
> +typedef struct {
> +	uint32_t *formats;
> +	int count;
> +} async_format_list;
> +
> +typedef struct {
> +	uint64_t modifier;
> +	async_format_list list;
> +} igt_async_format_mod_t;
> +
>  typedef struct igt_plane {
>  	/*< private >*/
>  	igt_pipe_t *pipe;
> @@ -438,8 +449,12 @@ typedef struct igt_plane {
>  	uint64_t *modifiers;
>  	uint32_t *formats;
>  	int format_mod_count;
> +
> +	igt_async_format_mod_t *format_mod_pair;
> +	int async_format_mod_count;
>  } igt_plane_t;
>=20

While this should work, I think we should keep the implementation similar t=
o the sync format modifier list.

You can have a look at the commit "lib: Parse plane IN_FORMATS blobifiers i=
nto a nicer form"[1] which implements it as
arrays of format-modifier tuples. (We can later think of implementing both =
as hash tables)

This should also simplify your loops in the second patch.

I also came across this commit "tests/kms_plane: Don't test all format+modi=
fier combinations" [2] which tried
to reduce the time needed to execute the test by dividing the pixel formats=
 into some "classes". While we have
a much smaller subset to test, it is still a good idea to profile the time =
taken to execute the test. If it exceeds the igt_runner
watchdog, we can implement something similar.

Also avoid "//" for comments.

Regards

Chaitanya

[1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/98f7614bd725a=
faae48f7b70d18329149075661b
[2] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/1e7d15a65df0c=
1e21912e682b7cbc47d744b270b

> +
>  /*
>   * This struct represents a hardware pipe
>   *
> --
> 2.34.1

