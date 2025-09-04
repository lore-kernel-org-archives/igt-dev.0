Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F2BCA1015
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 13:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B4110EA4B;
	Thu,  4 Sep 2025 13:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VblJ2f4h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3FA10EA4B
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 13:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756994371; x=1788530371;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c36sVXt6USJFTdCxnpHakxF3qRT3rd8tobX/BTAlvpE=;
 b=VblJ2f4h6I0Mz4QaKwO0SgYjkG2e/DPjQaoLIE+KeprDJqrPC/IYaRIq
 qKOz8W+/bkLX/qbt70kQPXzwcqw9/5+IrVLns9h58pznmcwkapOeA8JXZ
 wfZs/vykLARNsh6t683mrqL55wNvaiz7Q1sypTheetIxmxlA5rQz4b8gW
 2nOfH8DoXrWJAhUBo5faNtYrx7Ys78cgo2uiwFyqdvvWL/UwqeFNztzLc
 oj1I092X+rdKm5AqkGwPjmf6Mx80AqxC4vYOwbegxRWF4ViprJJfZkIEi
 PxAch6pWlazVuunbBPHEgnJ5Kl7uKBRjenaDzKVHRmq56j5brIi2N22xN g==;
X-CSE-ConnectionGUID: kW9ASRTSTmS7yUyKYVnNlQ==
X-CSE-MsgGUID: hNvrsLw2QsSq/W9HbI1+2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70707516"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="70707516"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 06:59:30 -0700
X-CSE-ConnectionGUID: R6bYwh2LRoGqDOHYox/1qw==
X-CSE-MsgGUID: TSmXQvWkRmaxIHuDokf8nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="209076258"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 06:59:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 06:59:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 06:59:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.72) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 06:59:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wU6thgJjKEo8/oiX9PgnnsGtNiFTskvdFzP+7kLni/nLGp6GEeoz81+dRJYSsVEygjckgDHWmvel6+WTzUObB9PkjxZsGRfsNq7qVskYcbY5mWWU2pSYdELG/7l+CUIGwLwEPPx1P7NrUATvQipPCzmbLloB7b9f7/4KajRe7aJv4AJug0GXBcZ9XHjOaDuPflidf0zNbOzlAB5AAYSkNLZZc8jU4E4BQfEButI0iAPZrJM8vATN609ZtXjgDXfamywlTGGoNwKV4TCkOViToZ2YopVx8RTI342UHPU2AzlkfTHRp58MRslN6AYMT71ShlNtl5DQH2qU+fInNoWVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3dBqHE2+3x56d/GknigVckKInn9Dz1/YbesCA1HQ1I=;
 b=Fdg/x/DbLhZjJD/nkRwkUpK4Aq5y+Kj9QL8ZHAf+08cGJMVyVlr5bjLX2HMNR9CtDbIk0hhPjwHL6Xr8C++2+WKNNdHXh+O61sXPXvC1oThIHyPrlMMjMjffAUWaeI62+HfUX3YqUCYVCS/RcQDTO/3vJN0Gwj7JM+CEnAZEaI9d5AL077jMmlk7Y2NgpImn6RDD17+Km0tJUIKsPez2enMQFXuFLGcu/GCxQ3Mg5hzTzto1kXj9xj4iI2mBD80+sCG6BRYrUBpR1I3s30JE5EvX8HU2JDwGGYL80eMpabb7Ns+S2MvFlx9oKwXGDyhxq/WXmVOLIuqo7M1zojxsSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 13:59:19 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 13:59:19 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v3] test/intel/xe_pmt: Add testing for BMG crashlog
Thread-Topic: [PATCH v3] test/intel/xe_pmt: Add testing for BMG crashlog
Thread-Index: AQHcCwO53tLyPsAm/kCD8Y7MvdQts7R2nYuAgAyQDYA=
Date: Thu, 4 Sep 2025 13:59:19 +0000
Message-ID: <IA1PR11MB64188C6DB440D9ADD990EFA4C100A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250811210532.1023142-1-michael.j.ruhl@intel.com>
 <aK8Ni4mAojQwUuvE@intel.com>
In-Reply-To: <aK8Ni4mAojQwUuvE@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|MW3PR11MB4539:EE_
x-ms-office365-filtering-correlation-id: 666bb15c-3b24-4881-41aa-08ddebbb3e7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?IrCG9tUwtHzfojirDxeWR/mHtdDQpBIpgJnBZSPJyven8tT6RKVVfoYT39rX?=
 =?us-ascii?Q?Yb/GRx9jDHrCFeyrlqTa5ojGOPN+z18o77jp+Ho+9xYakrqS9hiIcNbESrAC?=
 =?us-ascii?Q?4iNZupZunO2AB/AMb/XnD+GMXVAQ9r9lBD2ABRM5irhtlmzVER1EHFsiA24t?=
 =?us-ascii?Q?gT1Fnc6WGtYzZj6ulcQdDze5rZfax1O/4ETuCIVz68JZUkyEvwvMoaPcgn6h?=
 =?us-ascii?Q?FaBieZocIPOSTwvTOdAzZ8igFUjeBhfHMPhxp3mKYrD3reJw3IywSbafhqEs?=
 =?us-ascii?Q?RJxF7RpCmmRWcGFdvyiKSG7npBtzMoWt0uXvwKzyzs9MWib31sfkKiCu4c0k?=
 =?us-ascii?Q?jCoZwvU4ESKwzmeEbZIMGX4AF1l+Xc4Vg2YFcNGby0j6PGsGMjOXKg8/xaWC?=
 =?us-ascii?Q?ZvP2zqD6ZnKWi+DgIImIQ90yw8v1HB9P5oilD4YWYcl36mrppP75r1O4822x?=
 =?us-ascii?Q?tmoNghmsPx9lWfJiwBSC6ey5C7FbcVfBIbqz8dh7g6vUwDVrVBD3qgEBkf2z?=
 =?us-ascii?Q?xGu4e4BTizZw+PqsOT24+N1wL30ErgXhrak8JWpXuN/sd3lZSIRt5gIzOBQ9?=
 =?us-ascii?Q?+37jhQExldqpwbwPA8LHQ65EOeQfXz4qj/JFtA31E40LgDqiw8UVXkLFnbeW?=
 =?us-ascii?Q?sFZ34Dm4giM7deqDEMbdw81RWi79qUXvtrwNTYPJDUId/c7clQgz0xYnqKOl?=
 =?us-ascii?Q?4+qVxfaEtZNakXMM9NNs8eUj53pkZCKx2rAnMkkLrC9V3I3zZ8ukl1rOKtn0?=
 =?us-ascii?Q?TfsydA9tweeZ957h+KrHy09fLEs0m+ja/bZb+254uzjTGHdLLaKeu2y3sN7h?=
 =?us-ascii?Q?S3WnmNN/a09KjWjMbt21tUzQA/vNN5BM14jJxoqv+whwlKQ5v0UqPw8GDwNC?=
 =?us-ascii?Q?nQ9Pl4pG618YTZAphMr++Mby4vhVXUCEdVFO1SvbB9YEcBuVB4dId5G/O89w?=
 =?us-ascii?Q?I0vIxaaNPzMiFdyIY5IFVQ37tmNaKWtJ1+3rly6mttiXztgTHsRTcsD8/yIh?=
 =?us-ascii?Q?6qAslawAqOYa7SH+RffX5aC/pQoUc+v4+vpzQUIOkg74S6ao26LoJULSsku/?=
 =?us-ascii?Q?GCD+iBec1zpM3rge4Pf5GqmcGI7XCQHJwgDj2QG5sYSV1pg0vMdoCf18prJQ?=
 =?us-ascii?Q?+k4h/WR2wqz8qMZefYiy3vwP14OYphizooPNK9r0nUIWvjs5qFhlKJM+oPhj?=
 =?us-ascii?Q?9LNj8w0Z8x7xTMS9fiwtVvgmnGbwvIjzHlwKRRcSeC60Cb5zcacLxg3PAPIy?=
 =?us-ascii?Q?nVBLcwe2GZkrXa4DdOiWwhPpbmgXM3qSWvvTx+1vUpZ68r5LRSRUhr90vxOs?=
 =?us-ascii?Q?U+qz9eRc3v5c1TaIKDyd1wmVZjsb6G17khIhvbWcqTjAsUkb25yv17BlVZiU?=
 =?us-ascii?Q?eJv+1W+K29v2GIxVCxc+/EMFiV7duUpaKqNYm0TtGMW+FOI0xWsfft9Ewywx?=
 =?us-ascii?Q?+ld19pc7H0X5x62dKWKZ5a6s9xl38Zc5IYX3GyE8vmSWgtl0oK3fEg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PNatzfU7Ad+ijwraYJhmS6s23Rc64ceQDny1IFp2WGCuIQqKnAr6KyJpAhZ3?=
 =?us-ascii?Q?liWU8RVS6WMaIbj8LBf+KBQkIYK6kfTv9U4aZtYhLfLtJQ4qQu/UhMnbiaA2?=
 =?us-ascii?Q?wUKWlVF0R8Hwh5Mxu1HvpE2y2ym8TD7gBD/NfI+osHrGB8jB01UGSPTC5M18?=
 =?us-ascii?Q?9W7R6FVamLzRQcEIoPnSB7yuKOtNZlMSpvn8biBjUieq/zJYQjkD3NCPOgnz?=
 =?us-ascii?Q?RPNObja2KUuqjwHwJZKqy+ngJKzfDA1B76BWujL/2NAjt279gDIL6onmF/mV?=
 =?us-ascii?Q?HWbLGkmmhwhn4lf0K1e8lpyam+c8x06I9zGvm6VHYP7C0b7YSc2HvgZMjKIO?=
 =?us-ascii?Q?eXoxO6f5PL8rEVjyA5+AY4dVjVttHnrVSYKNYUxMXPiv41VnhZXbMUSLKg9C?=
 =?us-ascii?Q?F+iL9e3APYcAN7PKJISh8uUxCrF+Y+9hp6Oj0Am0kTOZFMYNxEDx+CvdesmD?=
 =?us-ascii?Q?ON8JrWPRnrKRQwyJQTA+soLwvPFBp7+C8ZhDlUo0oY1wS+pFNKrmM5T2i8vp?=
 =?us-ascii?Q?0AE439elXIlx2SuM3sn5c4km+cwCJ0BVaKB4wBaui/sS4EQM7fQxR7XUgNJO?=
 =?us-ascii?Q?wiU2hmf7D5d4MbOPRZgdqv4YXHcsJdRgcGD1Bym3EGq0JSe/v5W6rvs/sGxY?=
 =?us-ascii?Q?xdtFydve9IEpjWVaz15FvuBeIgcZbvdtxY7ZgpMNXfjOrhOrWcc6nvg5UcCr?=
 =?us-ascii?Q?Dd2EfagvgILzgr2unre4bJF6Ibwv7FXmh4EXb7vTz4oEcKQzlfzitMW+1rn1?=
 =?us-ascii?Q?tNYqghemY/uX3GdxXn/NqqZGSR9HvE21QeSxk0LF3lTlQf6CgfGzSOJDfTjo?=
 =?us-ascii?Q?vFbVwg7dIXvfr3xgIH88LGVhvCBLukkIOAuY5Tt1rQv8WddcMauZyqJ3QTgJ?=
 =?us-ascii?Q?D7xde6pfSlFZNmKd4KeX6gYKq2AtwDOz6rQ/ud7zLrhTBtUimcLoOuEEEqJg?=
 =?us-ascii?Q?ITJAi62lAhIVs/Zjh4eVR25YmzWkhzopvkiFm420jFFEF/NhmEtX2uSahbHU?=
 =?us-ascii?Q?ZOKhDwJHWhcYLLmqhBrFQtoM+Bxx4YgmYPtvCcJv9hHtUqY0rDSWTATy9N9H?=
 =?us-ascii?Q?QKU8jYZ/L54NLo4JrF2TCMcjWqQnwaAgYOGPkLQsglHAv2BpfI5nRsWxpFut?=
 =?us-ascii?Q?1XZTb9OJkJoOJzFyG8yV7rMEuQYi3uXtYrnnrckMh0AFzpUJbISYN24P62ip?=
 =?us-ascii?Q?y5BR6nBvErOYm0VFd04iuQe48igYEanQX9JVhZHEXEYOfMaqTA5Di9d9MT08?=
 =?us-ascii?Q?s6/20XCx4ukgLnyh+gQKXpGPkzsF+N18GW4ORHvKfIfSt/8lho2T9uE2MguK?=
 =?us-ascii?Q?QfOzmK/2XDKKYQhrPOxEfo9WwxKREobG6wdYrVmgZhdAQGieKKlNjE29IXjQ?=
 =?us-ascii?Q?MLv21Kv2lRbRz+CdKFIo3DNNynKxoQo8k4eyPU0Iqgo7vNuZKPTRBa7rMYSj?=
 =?us-ascii?Q?Z0QhTdAkvfb4XjSGvacus7DYV3ECkCuI7pxgBfO7oHPzmAsMia4RfN3Sju/G?=
 =?us-ascii?Q?g1EVnPNhyCxAgfARhKhxESYbvJGLsI1loxpBInrRvilk6VhjY1ao48SbqnSx?=
 =?us-ascii?Q?Jj2OgUUhAxzaAGYPSilPo3+v6SUEknl32gEIXJkr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666bb15c-3b24-4881-41aa-08ddebbb3e7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 13:59:19.5807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1fJ1W2O1GBOufs7gbIhLZi/v+drqyyU0SwBVXo4ghiiiajO+nz15mBcocEA/mln56C/khg44WgoWSVrpYQq3Iw8dHxMhGocvbnknocJpmbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
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

>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Wednesday, August 27, 2025 9:52 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: igt-dev@lists.freedesktop.org; De Marchi, Lucas
><lucas.demarchi@intel.com>
>Subject: Re: [PATCH v3] test/intel/xe_pmt: Add testing for BMG crashlog
>
>On Mon, Aug 11, 2025 at 05:05:29PM -0400, Michael J. Ruhl wrote:
>> The BMG devices has the PMT crashlog feature. If the devices present
>> is a BMG, test PMT api.
>>
>> NOTE: the testing order is not flexible and must be done in
>> the currently specified order.
>
>I believe this should be a comment inside the bmg function instead of
>a note in the commit message.

Ok, the test_pmt_bmg says this.  Will remove this comment.

>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  tests/intel/xe_pmt.c | 543
>+++++++++++++++++++++++++++++++++++++++++++
>>  tests/meson.build    |   1 +
>>  2 files changed, 544 insertions(+)
>>  create mode 100644 tests/intel/xe_pmt.c
>>
>> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
>> new file mode 100644
>> index 000000000..c2594730b
>> --- /dev/null
>> +++ b/tests/intel/xe_pmt.c
>> @@ -0,0 +1,543 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright (c) 2025 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Verify Platform Monitoring Technology (PMT) files operations
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: uapi
>> + * Functionality: sysfs
>> + * Description: Verify that the available PMT files (crashlog and telem=
etry)
>> + *   are created, are accessable, and respond as per design.
>> + */
>> +
>> +#include <unistd.h>
>> +#include <dirent.h>
>> +#include <fcntl.h>
>> +#include <limits.h>
>> +#include <string.h>
>> +
>> +#include "igt.h"
>> +#include "igt_sysfs.h"
>> +#include "linux_scaffold.h"
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +
>> +/* base directory names */
>> +#define VSEC_CRASHLOG_DIR "intel_vsec.crashlog."
>> +#define VSEC_TELEMETRY_DIR "intel_vsec.telemetry."
>> +#define CRASHLOG_DIR "crashlog"
>> +#define TELEMETRY_DIR "telem"
>> +
>> +/* itemize the available instances for the specific device */
>> +enum bmg_crashlog_instances {
>> +	bmg_crashlog_punit =3D 0,
>> +	bmg_crashlog_oobmsm,
>> +	bmg_crashlog_max
>> +};
>> +
>> +enum bmg_telemety_instances {
>> +	bmg_telemetry_punit =3D 0,
>> +	bmg_telemetry_oobmsm,
>> +	bmg_telemetry_max
>> +};
>> +
>> +static char dev_path[PATH_MAX];
>> +static char work_path[PATH_MAX * 2];
>> +
>> +/*
>> + * In most case there should be a single instance of the crashlog and
>telemetry
>> + * directories. If DVSEC entries are not contiguos the structure will b=
e
>different,
>> + * and the code will need to reflect the structure.
>> + */
>> +static char crashlog_vsec_dir[32];
>> +static char telemetry_vsec_dir[32];
>> +
>> +/* This needs to be specific for each supported device */
>> +static char crashlog_dir[bmg_crashlog_max][32];
>> +static char telemetry_dir[bmg_telemetry_max][32];
>> +
>> +/* telemetry file names */
>> +static const char *telem =3D "telem";
>> +
>> +/* crashlog filenames and descriptors */
>> +static const char *clear =3D "clear";
>> +static const char *consumed =3D "consumed";
>> +static const char *crashlog =3D "crashlog";
>> +static const char *enable =3D "enable";
>> +static const char *error =3D "error";
>> +static const char *dev_guid =3D "guid";
>> +static const char *rearm =3D "rearm";
>> +static const char *trigger =3D "trigger";
>> +
>> +struct crashlog_v2_info {
>> +	int clear_fd;
>> +	int consumed_fd;
>> +	int crashlog_fd;
>> +	int enable_fd;
>> +	int error_fd;
>> +	int guid_fd;
>> +	int rearm_fd;
>> +	int trigger_fd;
>> +	u_int32_t guid;
>> +} bmg_info[bmg_crashlog_max];
>> +
>> +#define DEV_PATH_LEN 80
>> +
>> +/*
>> + * device_sysfs_path:
>> + * @fd: opened device file descriptor
>> + * @path: buffer to store sysfs path to device directory
>> + *
>> + * Returns:
>> + * On successfull path resolution sysfs path to device directory,
>> + * NULL otherwise
>> + */
>> +static char *device_sysfs_path(int fd, char *path)
>> +{
>> +        char sysfs[DEV_PATH_LEN];
>> +
>> +        if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
>> +                return NULL;
>> +
>> +        if (DEV_PATH_LEN <=3D (strlen(sysfs) + strlen("/device")))
>> +                return NULL;
>> +
>> +        strcat(sysfs, "/device");
>> +
>> +        return realpath(sysfs, path);
>> +}
>> +
>> +/*
>> + * SUBTEST: pmt-directories
>> + * Description: PMT directory structure:
>> + * device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
>> + * device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
>> + * If this is done for a different platform, this could be
>> + * different.
>> + *
>> + */
>> +static void test_pmt_directories(int dev_fd)
>> +{
>> +	struct dirent *ent;
>> +	int index;
>> +	DIR *dir;
>> +
>> +        igt_assert(device_sysfs_path(dev_fd, dev_path));
>> +
>> +	/* verify top level PMT directories */
>> +	dir =3D opendir(dev_path);
>> +	igt_assert_f(dir, "no directories found\n");
>> +
>> +	while ((ent =3D readdir(dir)) !=3D NULL) {
>> +		if (strncmp(VSEC_CRASHLOG_DIR, ent->d_name,
>sizeof(VSEC_CRASHLOG_DIR) - 1) =3D=3D 0)
>> +			strcpy(crashlog_vsec_dir, ent->d_name);
>> +		if (strncmp(VSEC_TELEMETRY_DIR, ent->d_name,
>sizeof(VSEC_TELEMETRY_DIR) - 1) =3D=3D 0)
>> +			strcpy(telemetry_vsec_dir, ent->d_name);
>> +	}
>> +
>> +	closedir(dir);
>> +
>> +	igt_assert_f(strlen(crashlog_vsec_dir), "missing crashlog directory\n"=
);
>> +	igt_assert_f(strlen(telemetry_vsec_dir), "missing telemetry
>directory\n");
>> +
>> +	/* verify crashlog directory structure */
>> +	sprintf(work_path, "%s/%s/%s", dev_path, crashlog_vsec_dir,
>"intel_pmt");
>> +
>> +	dir =3D opendir(work_path);
>> +	igt_assert_f(dir, "no intel_pmt directories found\n");
>> +
>> +	index =3D 0;
>> +	/* find the crashlog<x> directory instances */
>> +	while ((ent =3D readdir(dir)) !=3D NULL) {
>> +		if (strncmp(CRASHLOG_DIR, ent->d_name,
>sizeof(CRASHLOG_DIR) - 1) =3D=3D 0) {
>> +			if (index < bmg_crashlog_max)
>> +				strcpy(crashlog_dir[index], ent->d_name);
>> +			index++;
>> +		}
>> +	}
>> +
>> +	closedir(dir);
>> +
>> +	igt_assert_f(index =3D=3D bmg_crashlog_max, "too many crashlog entries
>%d\n", index);
>> +	for (int i =3D 0; i < ARRAY_SIZE(crashlog_dir); i++)
>> +		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d]
>directory\n", i);
>> +
>> +	/* verify telemetry directory structure */
>> +	sprintf(work_path, "%s/%s/%s", dev_path, telemetry_vsec_dir,
>"intel_pmt");
>> +
>> +	dir =3D opendir(work_path);
>> +	igt_assert_f(dir, "no telemetry intel_pmt directories found\n");
>> +
>> +	index =3D 0;
>> +	while ((ent =3D readdir(dir)) !=3D NULL) {
>> +		if (strncmp(TELEMETRY_DIR, ent->d_name,
>sizeof(TELEMETRY_DIR) - 1) =3D=3D 0) {
>> +			if (index < bmg_telemetry_max)
>> +				strcpy(telemetry_dir[index], ent->d_name);
>> +			index++;
>> +		}
>> +	}
>> +
>> +	closedir(dir);
>> +
>> +	igt_assert_f(index =3D=3D bmg_telemetry_max, "too many telemetry entri=
es
>%d\n", index);
>> +	for (int i =3D 0; i < ARRAY_SIZE(telemetry_dir); i++)
>> +		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d]
>directory\n", i);
>> +
>> +}
>> +
>> +static void find_pmt_file(const char *path, const char *file)
>> +{
>> +	struct dirent *ent;
>> +	bool found;
>> +	DIR *dir;
>> +
>> +	dir =3D opendir(path);
>> +	igt_assert_f(dir, "no intel_pmt directories found\n");
>> +
>> +	found =3D false;
>> +	while ((ent =3D readdir(dir)) !=3D NULL)
>> +		if (strcmp(file, ent->d_name) =3D=3D 0)
>> +			found =3D true;
>> +	closedir(dir);
>> +
>> +	igt_assert_f(found, "missing %s from %s\n", file, path);
>> +}
>> +
>> +static void open_pmt_file(const char *path, const char *file, int *fd, =
int flags)
>> +{
>> +	char file_path[PATH_MAX];
>> +
>> +	sprintf(file_path, "%s/%s", path, file);
>> +
>> +	*fd =3D open(file_path, flags);
>> +	igt_assert_f(*fd > -1, "failed to open %s\n", file_path);
>> +
>> +	/* TODO: match flags to file attributes */
>
>are we really doing this or should we remove this todo?

We should verify the permission bits...I just didn't have time when I was d=
oing this part.

I will remove the todo and put it on my personal list.  When I get "free ti=
me", I will see if I can
update.

>
>> +}
>> +
>> +/*
>> + * SUBTEST: pmt-telemetry-files
>> + * Description: validate the expected telemetry file(s)
>> + * Test category: functionality test
>
>We shouldn't use the SUBTEST documentation for the cases
>that are not actual igt test case.
>You can put some comment here on what this is aiming to
>validate, but without the subtest documentation imho.

I removed all of the igt test case tags...left just the description text.  =
I have done that for all
but the "real" subtest.

Thank you for your comments!

M

>> + *
>> + */
>> +static void test_pmt_telemetry_files(int dev_fd)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < bmg_telemetry_max; i++) {
>> +		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>telemetry_vsec_dir,
>> +			"intel_pmt", telemetry_dir[i]);
>> +		find_pmt_file(work_path, telem);
>> +	}
>> +}
>> +
>> +/*
>> + * SUBTEST: pmt-crashlog-files
>> + * Description: validate the expected crashlog files
>> + * Test category: functionality test
>
>same
>
>> + *
>> + */
>> +static void test_pmt_crashlog_files(int dev_fd)
>> +{
>> +	char buf[64] =3D {};
>> +	int ret;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>crashlog_vsec_dir, "intel_pmt",
>> +			crashlog_dir[i]);
>> +
>> +		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, consumed,
>&bmg_info[i].consumed_fd, O_RDWR);
>> +		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd,
>O_RDWR);
>> +		open_pmt_file(work_path, error, &bmg_info[i].error_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd,
>O_RDWR);
>> +		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd,
>O_RDWR);
>> +
>> +		ret =3D pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
>> +		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
>> +		bmg_info[i].guid =3D strtol(buf, NULL, 16);
>> +		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device
>%d\n", i);
>> +	}
>> +}
>> +
>> +#define ENABLE_MSG "1\n"
>> +#define DISABLE_MSG "0\n"
>> +
>> +static bool send_msg(int fd, const char *msg, const char *file) {
>> +	size_t len =3D strlen(msg);
>> +	int ret;
>> +
>> +	errno =3D 0;
>> +	ret =3D pwrite(fd, msg, len, 0);
>> +	if (ret !=3D len)
>> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
>> +			 errno);
>> +
>> +	return ret =3D=3D len;
>> +}
>> +
>> +static bool verify_msg(int fd, const char *msg, const char *file) {
>> +	size_t len =3D strlen(msg);
>> +	char buf[32] =3D {};
>> +	int ret;
>> +
>> +	errno =3D 0;
>> +	ret =3D pread(fd, buf, sizeof(buf), 0);
>> +	if (ret !=3D len)
>> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
>errno);
>> +
>> +	return ret =3D=3D len && strcmp(buf, msg) =3D=3D 0;
>> +}
>> +
>> +/*
>> + * SUBTEST: pmt-crashlog-enable
>> + * Description: Set enable enable/disable bit and verify usage
>> + * Test category: functionality test
>> + *
>
>same
>
>> + */
>> +static void test_pmt_crashlog_enable(int dev_fd)
>> +{
>> +	u_int32_t guid;
>> +	int fd;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		fd =3D bmg_info[i].enable_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* force enable so we are in a known state */
>> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send
>enable\n", guid);
>> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x:
>verify enable\n", guid);
>> +
>> +		/* disable */
>> +		igt_assert_f(send_msg(fd, DISABLE_MSG, enable), "0x%x: send
>disable\n", guid);
>> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, enable), "0x%x:
>verify disable\n", guid);
>> +
>> +		/* re-enable so we can do more testing */
>> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: re-
>enable\n", guid);
>> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x:
>verify re-enable\n", guid);
>> +	}
>> +
>> +}
>> +
>> +/*
>> + * SUBTEST: pmt-crashlog-clear
>> + * Description:
>> + *   Test the clear crashlog bit. After setting the crashlog data buffe=
r should be
>> + *   set to 0xdeadbeef.
>> + *   "0" (DISABLE_MSG) is written to the trigger file to set the clear =
bit.  BMG
>does
>> + *   writing to the clear file, but once the bit is set it cannot be cl=
eared with a
>> + *   reboot.  "0" to trigger is the "standard" usage, so test it.
>> + *
>> + * Test category: functionality test
>> + *
>> + */
>
>same
>
>> +static void test_pmt_crashlog_clear(int dev_fd)
>> +{
>> +	char buf[64] =3D {};
>> +	u_int32_t guid;
>> +	int crashlog_fd;
>> +	int trigger_fd;
>> +	int clear_fd;
>> +	int *val;
>> +	int len;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		clear_fd =3D bmg_info[i].clear_fd;
>> +		crashlog_fd =3D bmg_info[i].crashlog_fd;
>> +		trigger_fd =3D bmg_info[i].trigger_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* make sure the bit is clear */
>> +		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x:
>verify clear\n", guid);
>> +
>> +		/* set the clear bit (0 -> trigger)*/
>> +		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger),
>"0x%x: send enable\n", guid);
>> +
>> +		/* make sure the bit is set.  sleep() to allow HW to set the bit */
>> +		sleep(1);
>> +		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x:
>clear set\n", guid);
>> +
>> +		len =3D read(crashlog_fd, buf, sizeof(buf));
>> +		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read crashlog
>data\n", guid);
>> +
>> +		/* wa punit issue for first crashlog (NOTE: this is fixed)*/
>> +		if (i =3D=3D 0)
>> +			val =3D (int *) &buf[32];
>> +		else
>> +			val =3D (int *)buf;
>> +
>> +		igt_assert_f(*val =3D=3D 0xdeadbeef, "0x%x: invalid clear data value:
>: 0x%x", guid, *val);
>> +	}
>> +
>> +}
>> +
>> +/*
>> + * SUBTEST: pmt-crashlog-consumed
>> + * Description:
>> + *   After a crashlog has been "consumed" (read), setting this bit can =
be done.
>> + *   Verify that it is set correctly.
>> + * Test category: functionality test
>> + *
>> + */
>
>same
>
>> +static void test_pmt_crashlog_consumed(int dev_fd)
>> +{
>> +	uint32_t guid;
>> +	int fd;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		fd =3D bmg_info[i].consumed_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* check, set, verify */
>> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x:
>consumed clear\n", guid);
>> +		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x:
>set consumed\n", guid);
>> +		/* sleep(1) to allow HW to set the bit */
>> +		sleep(1);
>> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x:
>verify consumed\n", guid);
>> +	}
>> +}
>> +
>> +/*
>> + * SUBTEST: pmt-crashlog-error
>> + * Description:
>> + *    The error bit is set when a crashlog fails in HW.  It is read onl=
y so only
>> + *    need to verify that it is "0".
>> + * Test category: functionality test
>> + *
>> + */
>
>same
>
>> +static void test_pmt_crashlog_error(int dev_fd)
>> +{
>> +	uint32_t guid;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		guid =3D bmg_info[i].guid;
>> +		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG,
>error), "0x%x: error clear\n", guid);
>> +	}
>> +}
>> +
>> +/*
>> + * SUBTEST: pmt-crashlog-rearm
>> + * Description:
>> + *    The rearm bit is set at cold boot.  It cannot be reset unless are=
 real
>crashlog
>> + *    occurs (i.e. setting trigger will not change its value).  Verify =
that it is "1".
>> + * Test category: functionality test
>> + *
>> + */
>
>same
>
>> +static void test_pmt_crashlog_rearm(int dev_fd)
>> +{
>> +	uint32_t guid;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		guid =3D bmg_info[i].guid;
>> +		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG,
>rearm), "0x%x: rearm set\n", guid);
>> +	}
>> +}
>> +
>> +/*
>> + * SUBTEST: pmt-crashlog-trigger
>> + * Description:
>> + *    Set the manual trigger bit and make sure the data is not 0xdeadbe=
ef
>> + * Test category: functionality test
>> + *
>> + */
>
>same
>
>> +static void test_pmt_crashlog_trigger(int dev_fd)
>> +{
>> +	char buf[64] =3D {};
>> +	u_int32_t *val;
>> +	int crashlog_fd;
>> +	int trigger_fd;
>> +	u_int32_t guid;
>> +	int len;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		crashlog_fd =3D bmg_info[i].crashlog_fd;
>> +		trigger_fd =3D bmg_info[i].trigger_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* make sure the bit is clear */
>> +		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger),
>"0x%x: trigger clear\n",
>> +			     guid);
>> +		/* set the trigger bit (1 -> trigger)*/
>> +		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger),
>"0x%x: set trigger\n", guid);
>> +
>> +		/* sleep to let the HW do its thing */
>> +		sleep(1);
>> +
>> +		/* make sure the bit is set */
>> +		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger),
>"0x%x: trigger not set\n",
>> +			     guid);
>> +
>> +		len =3D read(crashlog_fd, buf, sizeof(buf));
>> +		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read crashlog
>data\n", guid);
>> +
>> +		val =3D (u_int32_t *)buf;
>> +
>> +		igt_assert_f(*val !=3D 0xdeadbeef, "0x%x: invalid trigger value: :
>0x%x", guid, *val);
>> +	}
>> +}
>> +
>> +/**
>> + * SUBTEST: pmt-bmg-tests
>> + * Description:
>> + *   Because of how the Crashlog Instances behave, these tests are orde=
red.
>Do not use them
>> + *   individually unless you understand the underlying HW behavior.  Be=
cause
>of this behavior,
>> + *   all of the test will be done in order in one step.
>> + *   NOTE
>> + *     o Testing MUST be done after a cold reset
>> + *     o Once crashlog is triggered the device behavior is undefined an=
d
>requires a cold reset.
>> + *  Test category: functionality test
>> + */
>
>Then you just keep this one that is the actual sub-test.
>
>
>> +static void test_pmt_bmg(int fd)
>> +{
>> +	test_pmt_directories(fd);
>> +	test_pmt_telemetry_files(fd);
>> +	test_pmt_crashlog_files(fd);
>> +	test_pmt_crashlog_error(fd);
>> +	test_pmt_crashlog_enable(fd);
>> +	test_pmt_crashlog_rearm(fd);
>> +	test_pmt_crashlog_trigger(fd);
>> +	test_pmt_crashlog_consumed(fd);
>> +	test_pmt_crashlog_clear(fd);
>> +}
>> +
>> +igt_main
>> +{
>> +	const struct {
>> +		const char *name;
>> +		void (*func)(int);
>> +	} funcs[] =3D {
>> +		{ "pmt-bmg-tests", test_pmt_bmg },
>> +		{ }
>> +	}, *f;
>> +	int dev_fd;
>> +
>> +	igt_fixture {
>> +		uint16_t dev_id;
>> +
>> +		dev_fd =3D drm_open_driver(DRIVER_XE);
>> +		dev_id =3D intel_get_drm_devid(dev_fd);
>> +		igt_require_f(IS_BATTLEMAGE(dev_id), "PMT currently suppot
>only for BMG GPU\n");
>> +	}
>> +
>> +	for (f =3D funcs; f->name; f++) {
>> +		igt_subtest_f("%s", f->name)
>> +			f->func(dev_fd);
>> +	}
>> +
>> +	igt_fixture
>> +		drm_close_driver(dev_fd);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 5c01c64e9..46d36962e 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -318,6 +318,7 @@ intel_xe_progs =3D [
>>  	'xe_peer2peer',
>>  	'xe_pm',
>>  	'xe_pm_residency',
>> +	'xe_pmt',
>>  	'xe_pmu',
>>  	'xe_prime_self_import',
>>  	'xe_pxp',
>> --
>> 2.50.1
>>
