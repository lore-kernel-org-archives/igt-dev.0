Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169EECA0ED3
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 04:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B69410E190;
	Wed,  4 Sep 2024 04:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkFGSYHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8294E10E190
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 04:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725425385; x=1756961385;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3qdlvw1DDCVw/eqEfX5yZ2zCY2hdziSIN6h1jILzPsk=;
 b=GkFGSYHFfbVUR6SamCk1hRW1MAovfW3c88JIckB6wAwcusaPy5SfDNSA
 nuw26M/e8z7Oiev3SQXHVUsEDNkZ+eV4HaZNMWEs80zSJXYabugS1L1Gn
 eRd9sPTKkz85yKc6fmw/0VvPjHS+u6f3DDsrSDLUsVuc1UbPUrlbO2IO8
 zWijvAOP8NsyehBwgTAR9CfEeqSXH2DgZb/7skmxMSirDQmtVqzRWJigZ
 xH4LS9V03z43pO5V6wxn0fGv7siSu1t9gZpL3ZTbLaC/25TbaOj1a9iBv
 gsTrtVNCbpIwLrqB1zLpgvCqVv0dbthJKSat931qaLSx99iSE2yStixMN g==;
X-CSE-ConnectionGUID: ZCGuvQ1BSfKNbTmhderSwg==
X-CSE-MsgGUID: rV+tfbhXR3Cgv06pDGXgfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24012217"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="24012217"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 21:49:44 -0700
X-CSE-ConnectionGUID: 4DeulY7jRkKq3jkcQ0EkVQ==
X-CSE-MsgGUID: te4pUcSaT9Olt2yOKq2m6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="65489484"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 21:49:45 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 21:49:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 21:49:44 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 21:49:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBXRQCvttZK0XUvlxGXvtdRL/SZQ+h0rPaqYSNaHLHBz9lLSOAasDl2W72N8PV6pdJFGanIIXjek8AzUQrEpuNU/48isNY6T4tqR2bJWzEjE2pop2AOp/SPNdLhVLDgePjRT077wElvms1KxhA+dGh8zPdAy/vqYPwLBfBjWovcowtakdHxVF3SbGKAcp2hg4ut2M/O93IX+vkor/PIKFEJUKN2TBbDuyfS09+1JB5DmU8aLgp1kVsNqbQ5QaB+8GurwHq8tRAnt7u3Sc/bUg2y/ultYlJsKQ4vM7fwu+VR9YqGJPzwcikv7cP+exsjih4QqPVipK7j8qmhUSzvN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/jf+WaC9DHj+AG6lhTOKC0LY+cPNslNG1iDHkcox30=;
 b=JlItwnbOTou57K2+4H5vBl933w5HVldpr7tq7v+B9on1OG6kvIwAp2iupTYaBATHSXlwZL8t7UQGhEz/TprvP+lf7eXOtcavMum4R4frnKwqqO9mxvWAnklFcDW8v6LKMgVx4OwXJcQc38/M3XTLTeC01rNvnaxe2x3mBLAC6kAJ8YzF5UnvDu/9zg5tv2Pi1aaaUwck9hK3Br70aB6fs3NtaZvjX/Fb0ONX0STG8NJoHl0qOvmz+Vrl/GMIcpvKGowISLQivotH+qtBx8MwHMxQDmLkH2X9d4kA8pvhz9Ctb5asPy3TcqNMg2Bp8+hHTa9aVt1BKvr/vzrOOcPlew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA0PR11MB7744.namprd11.prod.outlook.com (2603:10b6:208:409::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 04:49:41 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 04:49:41 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t v4] tests/intel/xe_exec_fault_mode: Don't return
 early
Thread-Topic: [PATCH i-g-t v4] tests/intel/xe_exec_fault_mode: Don't return
 early
Thread-Index: AQHa+kFg3kpFM4p+xEWo3ZnvHjSw5rJHFsaQ
Date: Wed, 4 Sep 2024 04:49:40 +0000
Message-ID: <SJ1PR11MB62047B49AD25D72861197DFC819C2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240829180051.3286-1-nirmoy.das@intel.com>
In-Reply-To: <20240829180051.3286-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA0PR11MB7744:EE_
x-ms-office365-filtering-correlation-id: e0c85bfc-dd35-4182-f1f5-08dccc9cfcca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?8rWKqWYSvPkFl3tGLGhBPvMA9935KgDHxcbKjICOrF3RAwKK2VdopUlesIuZ?=
 =?us-ascii?Q?EI/H/GBVc1/Z7AM5hdvkv5KG9ckfiDVTTAd+LqAmHdjj88iozOy60YkwHrMl?=
 =?us-ascii?Q?hz6ijDGufS+yfaeFVRZ6MD003NkVovgXSh7eEBPB4ZrS66lKeLdRN4x375Dn?=
 =?us-ascii?Q?387ZoJfEhm/tzJ6Cupv4X0n8bnVqONKQD60yc05PTyx74V2KWqH4vvmuk/zD?=
 =?us-ascii?Q?uBhTg6XIKreJkcOENvg+i4Wao5PIfzZr2x1c1+bDtHGOVwFbIHm+oxq7fOQr?=
 =?us-ascii?Q?rb6PL13TpYygQN6qO7kt+Tf/kawI07qbzUYLuSNk3X4OHtBt9he8FYZYylbR?=
 =?us-ascii?Q?BwAFS290tjS0867bvxuFhetL6SQFLNKt+d80uWjzXhy62QVF5xSxEuICPmHz?=
 =?us-ascii?Q?DkiruhXky3PPshQP827bSJURpHn3HpMwa/hdbRpz8t3Hse+ku9dvEO/bNB70?=
 =?us-ascii?Q?9sR2cspuHngjr0S6qChtVjellXJqCkGLDVWm1ti704JJjGaltO0J6rzssaTw?=
 =?us-ascii?Q?hPM3lSTWqZdXMbOSuhTVCVWcJS1LYyCcelWjfnAulWDqOsFnDn0K3rjwR1Ts?=
 =?us-ascii?Q?5fVCMkxtkFgHELX3aGBm8a4smQYVqRpv4pz9Z6ihyEXCOvec6N4EARtxAWVz?=
 =?us-ascii?Q?r94sB9Q98alMQUQwy+hWNvtFS9205MseoD6G48mtZFMd8PWrAiOkrQgh7ePG?=
 =?us-ascii?Q?4Fsb2UaAPD132r8+DWIWXfGU1+0zkLroBDBIPU/1SGoGRjD72FwQTbQtDQQm?=
 =?us-ascii?Q?uoBN1CMFsnStt6B89kQ2x/lAagOsSPgU5thywrJRC5BxcYdVDWbyC+glcj9B?=
 =?us-ascii?Q?gFfkXYFiAOfA7Ks+l/Y3QCe9HfZNAi2Qu+uWoiPVIoxcYqWidzUoCPCMvWRS?=
 =?us-ascii?Q?QqvobWHD0+gmN1LNBwGNGbyS92WDMpGzvvljaOm+CpujA0D5dRcmvoqXdk2p?=
 =?us-ascii?Q?gVPD3YP8aDEzATqurl+vijoC6X1Gn+Rq0xnWCcQHhkknK2ycSNDy92wY2S7O?=
 =?us-ascii?Q?DtLuMIgCykbx2ST5HvKtWixiG/p9/FwydTLW1Z+oEmeclTvHNzvWkR07V64h?=
 =?us-ascii?Q?8FTICxsvYXTY0wjfueBPSr3KgJBzGUomgte2G29pVoVXGshZHhfI8ayHIglE?=
 =?us-ascii?Q?9U7YeNqe9NC8vqgLK9huGmrL6gQZ3uUyQQ2No9uqj5TsOyD+xizP3+FeCMcJ?=
 =?us-ascii?Q?yDzGHVzl6xTGm3PunjbZ49xjcCiyxPoEWMm+3XKi2KpyJxPkfrnkyniy5ucZ?=
 =?us-ascii?Q?Wu0Fj2rRDAHSLCdPJyqnXQk3qUzItHD9ynCF45hNuVMwgO+YzTL6kzIWqcQh?=
 =?us-ascii?Q?pTpBxvhIDqo+zDrGfGtPmxabHY5tpnzyOYs45zWRDc4saPO2Yb/WpPLRom/0?=
 =?us-ascii?Q?tETihq4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i5BL17BgdvQ/kXpDmHot6YrKCTMslB4df4YuYMIlko5KVk0Y+NV5MBqU/4Sk?=
 =?us-ascii?Q?q4WozznBdrxv5X9jqWYlSqxfFQHoBlor+o9ccxmMzKmBKs7oXAOz3jjN8gJs?=
 =?us-ascii?Q?tgOyW6E2at8keeRW+yUvHqr5QYR91bNvjHmWPJmWW6SfgctPZyi2iRvk5xgt?=
 =?us-ascii?Q?BrzJcq8uXZjDQjx1dYSV3qTny3xNKy+/BvjHrRsxbxTm9b5K+DWfBAevKWu1?=
 =?us-ascii?Q?BjxfOgbpshxuRm9ROfTNTjaNMp6u382xAnIBmNK6ElMictrWMrcjoJRCUR2i?=
 =?us-ascii?Q?V9zlmF2ue2/LHGAAaXE2Fbj2t1s1aQo/Sd1cJ7t/y7JrhtAbgnPKi5xvR6xz?=
 =?us-ascii?Q?T/WjMvaqqGhOEwMXUDQjbGx2Z0ypg/G/FtQPYVVQEuGAlRH89VMjYROOwe8N?=
 =?us-ascii?Q?2XyLpPedwudKOSk0w8Z22YesnIqF3FYA/5wu3u2iOfYGOcv28u/jY3mJEfuA?=
 =?us-ascii?Q?PLQM0MI5RaTBeabyO9SYLuVineLV/GCI579+J/OeFKMxo5+Iz9fb2D0Ct/gw?=
 =?us-ascii?Q?pD7mHIUa9uWpgRRbpOesp72ZQjIQplmwv19M4mOA4JidXq+ngruzJoVR80i+?=
 =?us-ascii?Q?XjwB4kJYp5n2bzt+IyMkQm6RNcVyEXHcPm5e29WJ42ndqRhJvoUiAlZXCSUL?=
 =?us-ascii?Q?PGYIw5CGVAvVgLsQMtjSpZQZqsWecJT628qjxfj4Yo9tIhaqhL4UzGxBtLTr?=
 =?us-ascii?Q?XR0/msCfrrruCB18LkMKA/rF85wm9k9isXdlnGq99p66mMUlm5lfGzrIBg8G?=
 =?us-ascii?Q?iCvDJh9Z4mpzxekmcxmJG8CMu0K1RwzmTyuE7m5Sbh9J7e271d5YI+waATaz?=
 =?us-ascii?Q?VExvMXEZXPOi37kpCBIMxUddYnfVNxcMO7Z/QQZWe0iwcLMTVHKHYZsDkAS6?=
 =?us-ascii?Q?6u7W9QPdwQsyAdidXg+TO5WkvCYj331blj6plWg1OZ0q8DwcCqOKc08EZG4A?=
 =?us-ascii?Q?l4ZzcdnA6i6cK/ZO5BtRWzgOoM89jmJOdDbO+DAFUkwXriLvKx5QBy/Nt3mm?=
 =?us-ascii?Q?pQmIP7wux/LSi9TFwktO6TKvdZEjfLCaQrOhOKPRYEh0na8iNqHow1egCp9U?=
 =?us-ascii?Q?EfDlnFozdVrtAj7GyLXwfUqA23p6fJD80XkSuhqZCmHSvHLX9votopWDyTOu?=
 =?us-ascii?Q?LimEEzM2e0FxPC9J8AxRVhvNUA9v53YsydGDUD7T+HQmETIoFkkEHO58s8SW?=
 =?us-ascii?Q?JSe3BvJ0ED+68iRH25jgqgaHVHaXQ26qzQLdFlXcQ1eY4SoOlHzxvJ1h+DMV?=
 =?us-ascii?Q?D81wVRGrPFjR1EU/IrhFTCRFl4eWZ9NEKXkJCby9UheFvWPAGtoWjSf0LaDd?=
 =?us-ascii?Q?+uxxLm0zlHDefkcN3n3F21c55JZUDm+33hg0UmNkfXm0MBNqNRfWHOeR9CKK?=
 =?us-ascii?Q?5Ry7vR7NoywnUxJnSC6V++5KGYBdEk+5AGsihFYsU9bQPTJYoX5L0cQbFZzM?=
 =?us-ascii?Q?u74KMU4RXfrTdAwgJ2ETEuAWTYk5vX8+jBEINV4XrdcP1bl83RgwBKqR8dss?=
 =?us-ascii?Q?R3AkAcWoP4nGZfOfFIKLzP9H1YRS1DMykHnLfqQg6IEQrPeP+F0kvBRzRcyQ?=
 =?us-ascii?Q?30QzTMRH5olIscHexLZz7n2D2r5BR6wr5m7kSq9G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c85bfc-dd35-4182-f1f5-08dccc9cfcca
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 04:49:40.7477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bGtpPaHQ6xixBty7m838i0a5703j+xeEtgznfe/m7caSq9dhvdZGgYMyG1MP5KfgJocljMqX4N1k8ffSSRuJNSGcQx1AG1jjzAAOFsTwe3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7744
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



> -----Original Message-----
> From: Das, Nirmoy <nirmoy.das@intel.com>
> Sent: Thursday, August 29, 2024 11:31 PM
> To: igt-dev@lists.freedesktop.org
> Cc: kamil.konieczny@linux.intel.com; Das, Nirmoy <nirmoy.das@intel.com>;
> Hajda, Andrzej <andrzej.hajda@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH i-g-t v4] tests/intel/xe_exec_fault_mode: Don't return ea=
rly
>=20
> Tests that are causing pagefaults should wait for exec to queue ban/finis=
h
> otherwise pending engine resets because of on-going pagefaults would caus=
e
> failure in subsequent tests to fail.
>=20
> Not all execs will generate page faults and in such case reading ban prop=
erty
> is not enough but the signal should either -EIO or 0.
> so read that instead.
>=20
> v2: specify timeout reason and iterate over exec_queues(Andrzej)
> v3: increase timeout
> v4: check for signal status to be -EIO/0.
>=20
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_fault_mode.c
> b/tests/intel/xe_exec_fault_mode.c
> index 1f1f1e50b..fa050d0dc 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -329,6 +329,17 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				igt_assert_eq(data[i].data, 0xc0ffee);
>  	}
>=20
> +	if ((flags & INVALID_FAULT)) {

Nit: double bracket (( not needed I think=20

Tejas
> +		for (i =3D 0; i < n_execs; i++) {
> +			int ret;
> +			int64_t timeout =3D NSEC_PER_SEC;
> +
> +			ret =3D __xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> +					       exec_queues[i % n_exec_queues],
> &timeout);
> +			igt_assert(ret =3D=3D -EIO || ret =3D=3D0);
> +		}
> +	}
> +
>  	for (i =3D 0; i < n_exec_queues; i++) {
>  		xe_exec_queue_destroy(fd, exec_queues[i]);
>  		if (bind_exec_queues[i])
> --
> 2.42.0

