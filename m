Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94231C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 21:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5442610E765;
	Wed, 22 Jan 2025 21:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mfl7aRYy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9375C10E762
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 21:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737580480; x=1769116480;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iFuU7VJy2V4lBHzGRqWuNLvo5x1WdGo06YOxw7m1IQY=;
 b=Mfl7aRYyaptONTqaVV711b9HoANdS8mAksrXhgmrNXTq0PMVVsFKIOXK
 Fi/jpWvhKwAspwdg3ZkAcsoVcaACsOW7tf72/gmNMO8eF/v/jOXIxuaVv
 3oHVV7ock66Ye5A7WWQdImnmxVN5aHSkvo0TOujj90MtcubolZB2Tet0X
 6RpvTJn8YQFB5XF8nlyCfiVN0OVx4q40zyKyAuni9Kka2vY+hEDiWZbfB
 WgWmYes50EN432xI/g7ADVbh2RaXp3gTy6EHSlKQH05ASivbbP9XHRQX1
 HJRBh/7OcII7d+dANjOW6VkzZxryAqWpf2bqmvIuLWTsW2bPiMaDn5t5s w==;
X-CSE-ConnectionGUID: SA+uhu1uT/WjTgboSlLoOw==
X-CSE-MsgGUID: WXNdpueZT2CljQy++/7Sgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38087828"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="38087828"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:14:40 -0800
X-CSE-ConnectionGUID: gjOuf5a2Rv+NtevExcArYQ==
X-CSE-MsgGUID: 7ttkZeprT0y10O50Z9Y0aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="107860476"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 13:14:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 13:14:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 13:14:39 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 13:14:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgZpo3GhlcMI7TKoCnfS2tYJcezYm1/QWM33BBMe9TmDQLEiU4kbwzhTZpdkB3qC0CqCVeaumI/ruAYSyBUwsQn29jpzUxHKd0z6iV6m5oRsMKzdRaBzmloEupTSXYijDJRUmXXUcV+FWjUyCEbgPKSc3XRQ+6J6bRpz1tOlO6izGEqJIAjBTNcKMhp1BDMYCtpcgtFg6N6rEJxK8ehPWp96PBT1R0m12X5ywjFC3YQ+Fc3Iwcwm2LKYxIuAi7cIcemg2KogrpxQZXITyDyQ4nn5h53NxVR9gjc3h+aGNXRqcQtnaxSt9Dm3iX5VR/H6BvpYJCp6nu6p5l9ES9tWCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7LtJeL2leftAkjTrgSjXOQwmO5LinLo2E021LXrYD0=;
 b=d2XjQ48Mj8PAWobKtIEcPUvDFTgA0P7jei1ql8LInKvpO0Z+7cGo8erqrTNgTDX4L5KiJsaPTQzBJQa167aDaSnFQwn+9fGSWZP28Yr/36LGbUdTgXtTTASqnFKjoXM+zm4DJsDeLsfrIg8WHI96PMLlCkHflnYn/4izKoX/UADjfXQqOtHi46XPfOuEQXPm+IDyakMMUHpLJQl+lRWM+0bN2qj+rtLpN12LO5LivOopmHcVXyCe8Y2KioqKWNkqL8zf0n+seFa5woYWBE5gQVaBfLt3n3pOEmkkghfKHEaoTvd7YcFd6YI0MErLy6wubkgbzrbdurbCnBUzxWXXUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 21:14:36 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 21:14:36 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 i-g-t] tests/intel/xe_create: Check negative cases for
 exec_queue create/destroy ioctl
Thread-Topic: [PATCH v2 i-g-t] tests/intel/xe_create: Check negative cases for
 exec_queue create/destroy ioctl
Thread-Index: AQHbbREHC6ZOLf11GEWuO+DznSyotrMjSY1w
Date: Wed, 22 Jan 2025 21:14:36 +0000
Message-ID: <CH0PR11MB5444AD774A802C41266EDD24E5E12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250122210255.795600-1-nakshtra.goyal@intel.com>
In-Reply-To: <20250122210255.795600-1-nakshtra.goyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB5821:EE_
x-ms-office365-filtering-correlation-id: 436e54ff-8f1c-4379-1269-08dd3b29c697
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?wxzwj6tK+nbSC+1BJltZFgSI2vVDEofT/IlegOuKZ+HPeWgRK/ywfGV4EwrU?=
 =?us-ascii?Q?7OrW8NZcwGgr04rCvSCRx7Nes29MHdKDTKRXs+j+PUVkK17ONHexMlMiB/xe?=
 =?us-ascii?Q?Jr9gd00SN990wt+h3UqxF8CX9a+Bd2Ef4uhNma38H3P2vKwKXIpye/04LbLo?=
 =?us-ascii?Q?o0LsN++X6tZ6XdLtwFw+inUncbeLgeJ6Z63uqtaHr4taNogM03XjKMVB3Ksz?=
 =?us-ascii?Q?OiEZLKDxQeazCZ0XJdf9qX+lfJXqep6Kwzn1btQvLtzYJgXtnDyBWoP2Q1C+?=
 =?us-ascii?Q?frgj+7alW9ZLDG7ds2JuP44x8PiB7YLZVV1w5KE4n+8untJdAChp3harPPjJ?=
 =?us-ascii?Q?9DmQRqygCE5W5d7LCX+xUUspNChRhdcFjAt8LbQO0+dFkdWwoG3hfus9KP/M?=
 =?us-ascii?Q?kquBRFOkjmOKK5ZwxnzYOUFG1vojLClKvVTm0vjdQjPHB7Kl2RNNPYAM129H?=
 =?us-ascii?Q?vaQL2txb6vxX2/hVyoGEwKUjcCeD9gV975GYfwPGDNefkC/ERlv9p99KssfF?=
 =?us-ascii?Q?SGGwBwKcWUSQKuKkxXAToFkJ+cHKRgBcLBKXcCp78IByyGQA7ytvxoq8WIbv?=
 =?us-ascii?Q?kRmdLOo5AqVCkQEwDBdJ7c+lrAcmAT/5tAIcxxrwxR2Sb1BgLuQbzePYxWp2?=
 =?us-ascii?Q?ZQWxgJPPxuXioHvNe4CwSmu3VzdfYutyLUhmSPb6AkQleqSGcXLWDLvGw0wX?=
 =?us-ascii?Q?CtcxJjqmL6glWbrZPLpZYvXRkuHAsbwpfGys9gjS4H1lcwoMdbTuJv3szWzP?=
 =?us-ascii?Q?c0w7F59hbjY57ceCcWQDx81TNGKK45aFJjoSTwlLUoKvBp14g3J/Wn7cWlMC?=
 =?us-ascii?Q?K2aAmCWE/xjqof5yhj599X927VTYQ14W6IDAiOGWgN0+el0Nn3soWgAMjLr7?=
 =?us-ascii?Q?isO/N0IDIq0B+JpC8gyjd3Tq7dIrNkzXEmmeRV8rOpZX9oIpL4JoP/XFGsl9?=
 =?us-ascii?Q?8XQujFVynCrNRd34KDjQCvCgePRA8Xsxm3eJnvEYnPBl8lcXL/l7soyEmOEG?=
 =?us-ascii?Q?zi5T1nVGjY2fetXL+hNnk+DhJQ9XEJmmIS7DgpdLRPodmyy/49PyOLILk4eh?=
 =?us-ascii?Q?HW0i9LmOpYQIafp2dNLe1PVirS6gCgxVRrL3yH5tT8ECscYFgPFHU7kWngt5?=
 =?us-ascii?Q?kckIE3vcsbI6d+uWHD9LM9CoSGYjgUPZC0khwEH8ECBU+CEJqtiy3BtXudR+?=
 =?us-ascii?Q?0ZYcX6Z2o5wkOFzwGlgxVNDbODt5N1IJKtdWtbJqW6mRFO+vlD9t2EJla776?=
 =?us-ascii?Q?RsWtHcKno0zAfWpQnY/+XfOFpZKulbRyBWF6RppYiBSsqLwxUS4FxXDhGf3f?=
 =?us-ascii?Q?b1afoHFvPhaJZd/qiCnSQDdmft4/x2SPtfxC6bYXfq2SFNXHG2GUfdqI4U0q?=
 =?us-ascii?Q?pGB+jLtO72LWG/s8USDRFn2OGfY9pWzSOSfkXIbFi5R0P4X7BkH9n6GU8smm?=
 =?us-ascii?Q?PS0pl2RT4vrOjkNSPYo7bZnKlBNFYKU3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?S7tkFW+XOSNf7MeS9vM5Zn3gfF+9qfBGIMs3u/JJcx4AElJ7hJEKANV/WpGl?=
 =?us-ascii?Q?jb6zO4mujd5tTdax+jmOA20uF1fSJXi1u+N0orVzk5DiwjD4fB6ZxQu8ue6N?=
 =?us-ascii?Q?PDcI8YlyNyFgtiwwcwoaOeVwqd+Evg/dxmW4Qu/DSlB7fCvGMw6aZj/4PacG?=
 =?us-ascii?Q?PdzFmmgLyRVZ2wPjMAHZP4TxWHQND1cnkx765qLtE+DrFA9Ofjr3uy8MZZnj?=
 =?us-ascii?Q?ZcMZrnyFvy3n+EPnETMKFUk0gYAERnbrHTzA4ANxYIDcyLQO3EQdn17D8e7/?=
 =?us-ascii?Q?uIUj/8BpwrpBrmX3C5/t546RO5w1JOBSPQA3+Iw3ydl45zkSstTZTD1hRREQ?=
 =?us-ascii?Q?gTajTp27Q+8VFIHa+HvOn5yy0J1Q443GQgAAwcHQ7oCz9hR5ozhPwGHDak3T?=
 =?us-ascii?Q?n4GJOFbPUwO6C5yEzXCpwgV+n+kZlOaZEf0xBsVeA/wUwo9gll+u7+eYbsVO?=
 =?us-ascii?Q?q3mz1+OfZhDMBBQmfXVIn+QNufbQzfsBsibdN2xQV2NcDF1CojntCwnm+UzU?=
 =?us-ascii?Q?WWam9IyiXHk5UdMxtHOj6mUxGurN4RBXgp+Emh7Dgd5zwSXqkOVekXnkHI+f?=
 =?us-ascii?Q?KqOzbquF+rz0q7OpUeBylk7SxDVSKF88hbKvFWqZSuhg5L6j9zpswTDVXvH3?=
 =?us-ascii?Q?GD04P5oFHmsIZG9ULxkJPtr7f6UnniaP+4WWWJ4Z8CaMW9b/NK+vCcfF6xQP?=
 =?us-ascii?Q?KJr4hRKTmqaqaDLZnZ/mARZtlOsxDlh2fNeNmwkq3B+dGI9l/h5FDdR3fUqS?=
 =?us-ascii?Q?IjB/X97PEVr/KlUQ0HBg7bIHS0HkwIO0c0FhZ9Z3gTFM6hPY2R5kXN1en8RH?=
 =?us-ascii?Q?FkvqICwe2YmznhS9zw/S6BFQb1KbgKUJPD8t6g8YpGIZuGwKOrjVH3UpkGij?=
 =?us-ascii?Q?vkCJwG8BdZV4WYm9igPUPLlIeNx8Clc5w9iaUvwa7NCAkzSGb9iwCI+NRmcf?=
 =?us-ascii?Q?KLfg2MF452YjvmDWZxsVWjyTF2ZMTnTIfc5hDHJCJwiwyDe3iWF/NhcOoIvT?=
 =?us-ascii?Q?4I2f5r5sGontJVuo6ttGDCW2fD5x6zfPQAvXot/tZgVIx03/jDo65Yp7jYuj?=
 =?us-ascii?Q?oQa2V5Op7c69ueijHHU6y3YW/i9+soJuivfCbSL9VOxWL5s8Lst7DqOUA1kK?=
 =?us-ascii?Q?rOoXLZMt6ZGMPj3EDgOokp4VNPQ/PPxVU7z9x3XF7vpvajKBLAbOp8tzTEQm?=
 =?us-ascii?Q?TZX3LLdLbaWHiMVJdaHBuKiAkjN5DkfyRC1BdCBs4B2S1eh2hHtGLhM/rA3X?=
 =?us-ascii?Q?B4kux6MU54WCR68msKNMHpVDH9NQAB7zaX9juiXmPx/qxBpkuaBnMHZ9mF7A?=
 =?us-ascii?Q?bqW0cjjsWrrN99Okngqn5yVmzeXcpGewOJbwwnkgOqv9Z4k6WmcFk+Gqxknj?=
 =?us-ascii?Q?c2/yJN64Y66EQSdqJIRfbok4yBCcItB+eVhKx36D3Et0qkzHFsyoR0JwR+Go?=
 =?us-ascii?Q?zwacQmpiwJk5PPHcUSh/dnh5aY89Z7uRZxAx+36iO5iVlvmKVfNb8HimGU+6?=
 =?us-ascii?Q?4DXne813k6npCowfpS6NMZ5ETDYBNZDK9Ws41UAa6OuQXCxPFnRXQZ11hZMJ?=
 =?us-ascii?Q?JSIgRsnpq5HD+DR1q8f0eL/qY8cLuo7GFjCTAcOh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 436e54ff-8f1c-4379-1269-08dd3b29c697
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 21:14:36.7607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GS2A0pQ6UViDNjK9WO9KNL8vA+FpqoH3j2V/26kzSGy6zGHwDtNF0GVTcP8tZRXvkFsPjZ2rZt+y5P1Trj6Twrvy3WgWATpjrEzqLL89pII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
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
From: Goyal, Nakshtra <nakshtra.goyal@intel.com>=20
Sent: Wednesday, January 22, 2025 1:03 PM
To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi <ramadevi.gandi@intel.co=
m>
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Konieczny, Kamil <kamil.k=
onieczny@intel.com>
Subject: [PATCH v2 i-g-t] tests/intel/xe_create: Check negative cases for e=
xec_queue create/destroy ioctl
>=20
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
>=20
> Negetive test cases to check expected errors using invalid
> flags, width, pad, reserved bits, num_placements, extensions, exec_queue_=
id
>=20
> v1: Combining width and numplacement test for len,
>  adding width and numplacement in extension,
>  change error type (Jonathan Cavitt)
>=20
> Adding functionality inside subtest description and
>  removing new added TEST section     (Kamil)
>=20
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

There's probably an argument to be made that we should add code comments to
the subcases in invalid-len and exec_queue_destroy_invalid_reserved, but I =
don't
think it's strictly necessary, so I won't block on it.
My reviewed-by still stands.
-Jonathan Cavitt

> ---
>  tests/intel/xe_create.c | 137 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 137 insertions(+)
>=20
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index 07e11036d..e3be6b774 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -59,6 +59,122 @@ static int __create_bo(int fd, uint32_t vm, uint64_t =
size, uint32_t placement,
>  	return ret;
>  }
> =20
> +/**
> + * SUBTEST: invalid-flag
> + * Functionality: ioctl_input_validation
> + * Description: Check ioctl with invalid flag returns expected error cod=
e
> + *
> + * SUBTEST: exec-queue-create-invalid-reserved
> + * Functionality: ioctl_input_validation
> + * Description: Send query with invalid reserved value for exec_queue_de=
stroy ioctl
> + *
> + * SUBTEST: invalid-len
> + * Functionality: ioctl_input_validation
> + * Description: Check query with invalid length returns expected error c=
ode
> + *
> + * SUBTEST: invalid-extensions
> + * Functionality: ioctl_input_validation
> + * Description: Check query with invalid extensions returns expected err=
or code
> + */
> +
> +static void invalid_flag(int fd)
> +{
> +	struct drm_xe_exec_queue_create create =3D {
> +		.flags =3D -1,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +}
> +
> +static void exec_queue_create_invalid_reserved(int fd)
> +{
> +	struct drm_xe_exec_queue_create create =3D {
> +		.reserved[0] =3D 0xffff,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +
> +	create.reserved[0] =3D 0;
> +	create.reserved[1] =3D 0xffff;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +}
> +
> +static void invalid_len(int fd)
> +{
> +	struct drm_xe_exec_queue_create create =3D {
> +		.width =3D 1,
> +		.num_placements =3D 1,
> +	};
> +
> +	create.width =3D 0;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +	create.width =3D 1;
> +
> +	create.num_placements =3D 0;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +	create.num_placements =3D 1;
> +
> +	create.width =3D 9;
> +	create.num_placements =3D 9;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +}
> +
> +static void invalid_extensions(int fd)
> +{
> +	struct drm_xe_exec_queue_create create =3D {
> +		.width =3D 1,
> +		.num_placements =3D 1,
> +		.extensions =3D -1,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EFAULT);
> +}
> +
> +/**
> + * SUBTEST: invalid-pad
> + * Functionality: ioctl_input_validation
> + * Description: Check query with invalid pad returns expected error code
> + *
> + * SUBTEST: exec-queue-destroy-invalid-reserved
> + * Functionality: ioctl_input_validation
> + * Description: Send query with invalid reserved value for exec_queue_de=
stroy ioctl
> + *
> + * SUBTEST: invalid-exec-queue-id
> + * Functionality: ioctl_input_validation
> + * Description: Check query with invalid exec_queue_id returns expected =
error code
> + */
> +
> +static void invalid_pad(int fd)
> +{
> +	struct drm_xe_exec_queue_destroy destroy =3D {
> +		.pad =3D 1,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy, EINVAL);
> +}
> +
> +static void exec_queue_destroy_invalid_reserved(int fd)
> +{
> +	struct drm_xe_exec_queue_destroy destroy =3D {
> +		.reserved[0] =3D 0xffff,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy, EINVAL);
> +
> +	destroy.reserved[0] =3D 0;
> +	destroy.reserved[1] =3D 0xffff;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy, EINVAL);
> +}
> +
> +static void invalid_exec_queue_id(int xe)
> +{
> +	struct drm_xe_exec_queue_destroy args =3D {
> +		.exec_queue_id =3D 0xffff,
> +	};
> +
> +	do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &args, ENOENT);
> +}
> +
>  /**
>   * SUBTEST: create-invalid-size
>   * Functionality: ioctl
> @@ -392,6 +508,27 @@ igt_main_args("Q:p:", NULL, help_str, opt_handler, N=
ULL)
>  	igt_fixture
>  		xe =3D drm_open_driver(DRIVER_XE);
> =20
> +	igt_subtest("invalid-flag")
> +		invalid_flag(xe);
> +
> +	igt_subtest("exec-queue-create-invalid-reserved")
> +		exec_queue_create_invalid_reserved(xe);
> +
> +	igt_subtest("invalid-len")
> +		invalid_len(xe);
> +
> +	igt_subtest("invalid-extensions")
> +		invalid_extensions(xe);
> +
> +	igt_subtest("invalid-pad")
> +		invalid_pad(xe);
> +
> +	igt_subtest("exec-queue-destroy-invalid-reserved")
> +		exec_queue_destroy_invalid_reserved(xe);
> +
> +	igt_subtest("invalid-exec-queue-id")
> +		invalid_exec_queue_id(xe);
> +
>  	igt_subtest("create-invalid-mbz")
>  		create_invalid_mbz(xe);
> =20
> --=20
> 2.34.1
>=20
>=20
