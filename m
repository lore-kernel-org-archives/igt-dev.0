Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C204EB7ED7
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 12:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AAE10E9DD;
	Wed,  4 Mar 2026 12:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUINHO7V";
	dkim-atps=neutral
Received: from mgamail.intel.com (unknown [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4650810E9DD
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 12:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772625888; x=1804161888;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=Vkb+VDrOTpJzNVqdkDIwlu2uQCuP5ovdqQkiPBVt0EU=;
 b=XUINHO7VpNB3s+Yq4dMewWcC3PtEG7acTml5W5n99NyIz/qz3IQ//dMP
 GjAWIqc4JkykNFWmyAh/T3xzN4yg0YjEH5dUw8GJ1yybV+Fy5RUN22UhS
 Z0BuyCHqjav21lUrGIaG8I9Tf57Y/LB0JB+SKKitffzwh6YwN5wG0YlQ1
 A01bHS8kKHt23GyQFEaAawbJSo4lORe7Hg/bJMQmXSzQqH8aJJO2lXZQS
 kOAiADglbP8lNy9g/IiP6WBoG9q0zFQAeEC4zRingLzPwMMKEmWqDP3Bq
 MbQOXdVDQD6JqqQ3GUZWB3YX38elL9fKsXfUWDcp4m1JKMsQUOOcxWEls w==;
X-CSE-ConnectionGUID: OMrwME87SnGkxdoTn9/Q0A==
X-CSE-MsgGUID: aliZkr8ZRsufsTNARSY77Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="91075246"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208,217";a="91075246"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:02:56 -0800
X-CSE-ConnectionGUID: RHBLR2xwREGPrpCsratXuw==
X-CSE-MsgGUID: 66bvOaMfToWH5HQ1LmwIzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
 d="scan'208,217";a="248796025"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:02:55 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 04:02:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 04:02:54 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 04:02:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8VcyDPA3nckH1UjPc+2JQqYGCU1OdbwQGL4qC2KjeOQPsZvdFZsZckhNTJ6K3kqMfwrFThc8s2IcoAUpqqxgeBy9xroShP6sHHv3Q2r6L5YFNPLW9Fkbo1NS6LllDZEXshrjHV4YScsrqYIOwfVBcgrgNHc596dTEASiLlyNJR23fONfzhKMESQZXmCt58FwJDCiHJ+PkNTJzdd71Q8Xyk6An28xldJLx9805CuSsE28jMefCmtVuMHnrEuLLJVbgTewfzaQCSenpc2UllG9cegw/CejkEIO/IF7eFJ1Ppkc6duEJGYoB4ZtiCgrcuOXqADuFFnWnpOr46x+qWXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMlpyvegH/eKztF0oOsDPnraCyAuoMBpqM97MzYk51A=;
 b=SOyEc29B7qsW9lQYz5GhgTZSMu/p23/iO2CVebCDTnUcD81sFuOl9ajy6Q+6e4j+9RE+srv+ePIz4/qWMD+D0btXCmskWlZ9qaPyaLsIMVLW53fEVgGQFyjL4SGkKSe/YB4wxwcTnCGhzdH7DmmPPHPkJD0eL9Yydb4fQ2qkIicMUww0agCOW/nVGFZbHdR3VzxvjdZZfWMMg/OXJ/pnNmWMH822m/h0/mQIoAFzMy2U4Xcf8TZeLh7qpzKmIn6AScorUEPOrMPQgXGHKGWnR5IYs8gjPmnc6KOqGo0FEPCN3fSpJ5ir1AKjp/KtdUtjrO9V8ZUy7afah0wWM/BcaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by SN7PR11MB6704.namprd11.prod.outlook.com (2603:10b6:806:267::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 12:02:42 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 12:02:42 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Santa, Carlos" <carlos.santa@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v5] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Thread-Topic: [PATCH i-g-t v5] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Thread-Index: AQHcpwSR5VQcUKLF3kmYJMn15CmeJrWd7AmAgABjJn0=
Date: Wed, 4 Mar 2026 12:02:42 +0000
Message-ID: <CH0PR11MB5427668FFFF757756E18B492987CA@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260226093127.2882485-1-s.sebinraj@intel.com>
 <a188379a-d5cd-42d1-9084-88147da592ef@intel.com>
In-Reply-To: <a188379a-d5cd-42d1-9084-88147da592ef@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|SN7PR11MB6704:EE_
x-ms-office365-filtering-correlation-id: 30ac1463-c7fe-41fd-4408-08de79e5f079
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|13003099007|7053199007|8096899003;
x-microsoft-antispam-message-info: 6VZHWhi9eaCwu3eX3MdAm+1WYPiKWmyAk18tCdxt7pVH13/4bk7/sKmeuOYmc+r1j/JscEkgts9vB7jX346k+2QGKaiowlm3rMFVTnndoOUGEB61VyH2xqFtQHaUbrn8sqgCIL7pxe04+ZbAF+JyJxJhRgey/4Rk8RYTwrT8K3X1JbpgEz3Ld6rwBagXbQNZoHBsJWIRgL8J18Mx5qgvSLWLJ6x6+HdhkC/FNxT339FltPE0Hejx2S6XqQHlLLYP5U+qFvYUhxgJffgUM115qTPjEiaD1F5UXfSxiMY620zkBObYj6J4ozna6NujTf0Yytpk+jS8VjLG5HV5U++uTyu9OeAkU2QoSoRfXgPnJmLaAAG9XAjswDoDMDutE3J5CF42r8nI6zPLcXhe5SgLoPawtnCLHVaKoyKYwmvBVJ2zk6kc8Ie6E1m5srJakkmfzuCwldM2oVVuP9iTzF4rDzDTiTScqCP+pARkXHv0OOOVfsTJf0SxICmtQgUdcMG+/PiP0fscNp++YL107i6qTwQGHUFHpzDKXjTVD/qz2/lsOPi3xl6eT2AhrrKru4Nbf2DnxMtFFUjfDLjqurJUrxjDqs0RyGN4q/hZHe7XswKEGqnMvCxURCXj68xmRCGwkTn8IGwsOn78r5JswsjkgjZ4qB+q51sBasLTLUtAc9+IJjgddgizTbmTMhbomPKhneXrSUcTxa294tfCKR3A0iWGSPjtkHuOh44oW/6WEw9O9U1HMBc8iWr+vJYLsrp+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(13003099007)(7053199007)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?P15iWvewj2NjOXcJYSuoEVsVsBGT8MU2U28cN6KKLBtF0X4xE5GPNcrgRE?=
 =?iso-8859-1?Q?sfOhWEHC3FoRFQANAobbMToNUOCfKXNK87zrlZaESNGG0plCrZTNqntonv?=
 =?iso-8859-1?Q?fLNjNcplQQsH1FRLOt7hCGMpKn7ihA4Yhy2Pk828vIeS292IQ/fl3B0A6b?=
 =?iso-8859-1?Q?K3NXEWIPcjAM1R+S2p2opEOyTT9VMw/bGRTvQWluh1hs/iR4vuwVrOrBUt?=
 =?iso-8859-1?Q?lVDiergDSFdCOYQLAZOEwpKH+xXKfUqdoUy9CMAyZe8XXnFGnp5gh+MMxr?=
 =?iso-8859-1?Q?a4RzSjM5BgCns6diIlBkiW0k4nR7EOgRnTQ/v8l5U4fLN7c9umiTiaDeaE?=
 =?iso-8859-1?Q?kLm433k9V3227FA8WtdH+IQvkSdQ0jRdOl3nUyf/6wZIg6Twh3jFEXtDfB?=
 =?iso-8859-1?Q?RVdTQFUAaVAFg6HrbgKpOog991n+tYFhx2su+WEpGVul6Zu0Rx/oHurSM0?=
 =?iso-8859-1?Q?Ioea4gg7iq+eZZzb1UeNrdZNJqins2nRcBFY8VXn64tRmK9woHNvJjbexd?=
 =?iso-8859-1?Q?o1iz/SqO1BQV3FuJp0Exqf97ZjGYdi6G5g4zdnuhSP27Ni7fU1yUCLoldw?=
 =?iso-8859-1?Q?Eh7+42dcRje1WyaeuOctIJpAVQtxj9GsUF15VfsJekJVtXMILUW75tiZZe?=
 =?iso-8859-1?Q?k3xR/EATLqlZcSB3L1vyncoK+EuRJMwj/Vc0a10yaYGea7KO+Q6RsKYLMN?=
 =?iso-8859-1?Q?fhBndW0Y1SI0YtxsfEcAnnVykQ0yQnqaJGYA//vTRAUOhkWLtoK0rdBmwZ?=
 =?iso-8859-1?Q?FrVYIqDNeRUYu0R0Y3Wj4fdWdWapsUwGUOSXLgWif7X/e8vITwQgIbhwoC?=
 =?iso-8859-1?Q?JmkJRZ5b9w8Ft4nny20wKDRYyVBpTVo06uqJnnXH4qBFSsjn77wPfLUDmn?=
 =?iso-8859-1?Q?qU+kWnw4bkkE2OFuKFLbyroXU/v+3P4pnN6C/Yg9RiQGx8QQR6qioE+8EY?=
 =?iso-8859-1?Q?/RNL7uQIY9IEW9aBEzrgn3huhOjq0uH/q7A7EcD6YGIGeaoxy6Y4c+ZsQ9?=
 =?iso-8859-1?Q?HH6U5qPyPgZVvboVUldUgMNKnwfpCeXIZqNvkbKSjKZluDisCG8ONoekTH?=
 =?iso-8859-1?Q?lRT90+wDYNExk7vobKMYgRzmZqRfxV55cKP9Mmj4LvA0UjCOHD/fmrx4my?=
 =?iso-8859-1?Q?f3ahjygIlquOosMEGWq3IY/FgTuZ45q73jMV1bcy9WgGvjz+Z4fnmwJkNG?=
 =?iso-8859-1?Q?z7PvT1Y4g8o4YITgO7Avs+3f1B97HtzfA0cVTJOMHPAL/xF4JzL0GB0ksn?=
 =?iso-8859-1?Q?JO5Tzg9kpRoiz59XFdJfu6i8lXxa7NtEgN2WH3aNZWroWQw4syuILAy2rH?=
 =?iso-8859-1?Q?vjMIclIPPDX9LwSwqK5B9E/I6/cYqRhvJLVWm3AJ2PoodwlXI4N9ShP1/j?=
 =?iso-8859-1?Q?Y9GUqY107REttZg7w96nqMp0J6O68+1H5iu5ehRZM057Ge+YuQHb95cn4w?=
 =?iso-8859-1?Q?oFnoURR9hkyNs+MjxKkMHnFxBJkvCYMzjWrC5Bju9cXFWXKYPbu2kCMrDn?=
 =?iso-8859-1?Q?H+dstb+shoPcnoy+NzQQ1oD5M+r9M11ndEfiDozHMC43uuvLsMnSesvcHh?=
 =?iso-8859-1?Q?kdJcMor/qdvKQmSooQ7F1FvAqYQxEeZd+I/1dqjf//9YcQ64f6+63UC79q?=
 =?iso-8859-1?Q?qnnVy3OJvcUVASR4maj2VkgRByOTHEk/wAfnaWbizgmrZrvrIflrYMfrH/?=
 =?iso-8859-1?Q?n7dyIMqpzLwKzjekqqu88TpJS4FtAP3KcmX4hlSSU7b/A0jKaUHHNSDsT8?=
 =?iso-8859-1?Q?glJuBwNA4Q1y8OhccvDzRSK2t0pugbQnXmZzFcBE2aBpWc?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB5427668FFFF757756E18B492987CACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ac1463-c7fe-41fd-4408-08de79e5f079
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 12:02:42.1291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YFmRZZzGwVVdwfG9mAhJI7OPcLkaHWHtQwmzNoUH9WCrLm0xSatWX+h2V1banZCehaOTADi/SZuKQmyG0ahmNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6704
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

--_000_CH0PR11MB5427668FFFF757756E18B492987CACH0PR11MB5427namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________
From: B S, Karthik <karthik.b.s@intel.com>
Sent: Wednesday, March 4, 2026 11:36 AM
To: Sebinraj, S <s.sebinraj@intel.com>; igt-dev@lists.freedesktop.org <igt-=
dev@lists.freedesktop.org>
Cc: Santa, Carlos <carlos.santa@intel.com>; Karas, Krzysztof <krzysztof.kar=
as@intel.com>; Konieczny, Kamil <kamil.konieczny@intel.com>; Kempczynski, Z=
bigniew <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v5] tests/kms_explict_fence: Add Test for Explici=
t Fencing

Hi Sebinraj,

On 2/26/2026 3:01 PM, S Sebinraj wrote:
> Add a new test to validate explicit fencing.
> This test handles multiple planes in a single atomic commit.
> This test addresses a critical scenario where drivers must correctly
> synchronize planes with mixed fence states.
>
> Test Scenario:
> - Creates three planes: one primary, two overlay
> - Attaches fences with different states:
>     - Primary plane:   signaled fence (simulating completed GPU work)
>     - Overlay-1 plane: signaled fence (simulating completed GPU work)
>     - Overlay-2 plane: unsignaled fence (simulating long-running GPU job)
> - Submits all planes in a single atomic commit with IN_FENCE_FD set
> - Validates that display waits for ALL fences before updating ANY plane
>
> Bug Detection:
> This test catches driver bugs where:
>   - Planes with signaled fences update prematurely before unsignaled
>     fences complete, breaking atomic commit semantics
>   - Fence states are mismanaged across multiple planes causing visual
>     glitches or corruption
>   - The driver fails to wait on all IN_FENCE_FDs atomically
>
> The test uses sw_sync timelines to create controllable fence states,
> allowing precise validation of fence synchronization behavior. An
> OUT_FENCE_PTR is requested to monitor when the display update actually
> completes, enabling detection of premature updates.
>
> Implementation Details:
> - Uses sw_sync for creating fences with controlled signaling
> - Monitors OUT_FENCE to detect premature display updates
> - Validates atomic commit integrity across multiple planes
>
> Background:
> - A bug regressed for Xe driver on PTL (Android) display handling
>    of explicit fences when provided two or more buffers at once,
>    with 1+ already-signaled fences and 1+ not-yet-signaled fences.
>    https://patchwork.freedesktop.org/patch/662982/
> - Adding this test so that IGT contains sufficient testing for the
>    use of explicit fencing in the KMS Atomic Modesetting APIs.
>
> Changes:
> -v5
>    - Make overlay plane validation scalable with
>      overlay count.
>    - Modify commit message.
> -v4
>    - Fix build errors as per latest API name
> -v3
>    - Add crc check on display update
>    - Adding proper License entry
>    - Reduce test description
> -v2
>    - Add crc check instead of visual inspection
>    - Reduce debug logging which are not needed
>    - Add a function for initial modset
>    - Make test not specific to Intel drivers alone
>    - Sort the included libs in alphabetical order
>    - Modify set_output func as we want only one
>      output per pipe
>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>   tests/kms_explicit_fence.c | 348 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build          |   1 +
>   2 files changed, 349 insertions(+)
>   create mode 100644 tests/kms_explicit_fence.c
>
> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
> new file mode 100644
> index 000000000..3d96e0de5
> --- /dev/null
> +++ b/tests/kms_explicit_fence.c
> @@ -0,0 +1,348 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =A9 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms explicit fence multiplane
> + * Category: Display
> + * Description: Test explicit fencing with multiple planes and mixed fen=
ce states
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + *
> + * This test validates correct handling of explicit fences when multiple=
 planes
> + * are updated in a single atomic commit with different fence states. Th=
is is
> + * critical for catching fence synchronization bugs where the driver mig=
ht:
> + * 1. Prematurely display buffers with signaled fences before unsignaled=
 fences complete
> + * 2. Mismanage fence states across multiple planes causing visual glitc=
hes
> + * 3. Fail to wait on all fences atomically before updating the display
> + */
> +
> +#include <errno.h>
> +#include <poll.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/eventfd.h>
> +
> +#include "igt.h"
> +#include "igt_aux.h"
> +#include "sw_sync.h"
> +
> +/**
> + * SUBTEST: multiplane-atomic-fence-wait
> + * Description: Test 3 planes (1 primary, 2 overlay) with mixed fence st=
ates:
> + *              2 planes with signaled fences and 1 plane with unsignale=
d fence.
> + *              Validates that display waits for all fences before updat=
ing any plane.
> + */
> +
> +/* Test configuration macros */
> +#define NUM_PLANES 3
> +#define PLANE_PRIMARY_IDX 0
> +#define PLANE_OVERLAY1_IDX 1
> +#define PLANE_OVERLAY2_IDX 2
> +#define OVERLAY_COUNT (NUM_PLANES - 1)
> +
> +#define FENCE_TIMEOUT_MS 2000
> +
> +#define OVERLAY_SIZE_DIVISOR 3
> +#define OVERLAY1_POS_X 100
> +#define OVERLAY1_POS_Y 100
> +#define OVERLAY2_OFFSET 100
> +
> +typedef struct {
> +     int drm_fd;
> +     igt_display_t display;
> +     igt_output_t *output;
> +     enum pipe pipe;
> +     igt_plane_t *primary;
> +     igt_plane_t *overlay1;
> +     igt_plane_t *overlay2;
> +     struct igt_fb primary_fb;
> +     struct igt_fb overlay1_fb;
> +     struct igt_fb overlay2_fb;
> +     drmModeModeInfo *mode;
> +     int width, height;
> +     igt_pipe_crc_t *pipe_crc;
> +} data_t;
> +
> +static void setup_output(data_t *data)
> +{
> +     igt_display_t *display =3D &data->display;
> +     igt_crtc_t *crtc;
> +     igt_output_t *output;
> +
> +     for_each_crtc_with_single_output(display, crtc, output) {
> +             int overlay_count =3D 0;
> +
> +             data->primary =3D igt_crtc_get_plane_type(crtc, DRM_PLANE_T=
YPE_PRIMARY);
> +
> +             /* Count available overlays - we need at least OVERLAY_COUN=
T */
> +             for (int i =3D 0; i < OVERLAY_COUNT; i++) {
> +                     if (igt_crtc_get_plane_type_index(crtc, DRM_PLANE_T=
YPE_OVERLAY, i))
> +                             overlay_count++;
> +             }
> +
> +             if (overlay_count >=3D OVERLAY_COUNT) {
> +                     data->overlay1 =3D igt_crtc_get_plane_type_index(cr=
tc,
> +                                                                     DRM=
_PLANE_TYPE_OVERLAY,
> +                                                                     0);
> +                     data->overlay2 =3D igt_crtc_get_plane_type_index(cr=
tc,
> +                                                                     DRM=
_PLANE_TYPE_OVERLAY,
> +                                                                     1);
Please fix the alignment here.
> +                     data->output =3D output;
> +                     data->pipe =3D crtc->pipe;
> +                     data->mode =3D igt_output_get_mode(output);
> +                     data->width =3D data->mode->hdisplay;
> +                     data->height =3D data->mode->vdisplay;
> +                     return;
> +             }
> +     }
> +
> +     igt_skip("Need at least %d overlay planes for this test\n", OVERLAY=
_COUNT);
> +}
> +
> +static void cleanup_crtc(data_t *data)
> +{
> +     igt_display_reset(&data->display);
> +
> +     igt_remove_fb(data->drm_fd, &data->primary_fb);
> +     igt_remove_fb(data->drm_fd, &data->overlay1_fb);
> +     igt_remove_fb(data->drm_fd, &data->overlay2_fb);
> +}
> +
> +static void create_fbs(data_t *data)
> +{
> +     int overlay_width =3D data->width / OVERLAY_SIZE_DIVISOR;
> +     int overlay_height =3D data->height / OVERLAY_SIZE_DIVISOR;
> +
> +     /* Primary plane - Blue background */
> +     igt_create_color_fb(data->drm_fd, data->width, data->height,
> +                         DRM_FORMAT_XRGB8888,
> +                         DRM_FORMAT_MOD_LINEAR,
> +                         0.0, 0.0, 1.0, /* Blue */
> +                         &data->primary_fb);
> +
> +     /* Overlay 1 - Red square */
> +     igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
> +                         DRM_FORMAT_XRGB8888,
> +                         DRM_FORMAT_MOD_LINEAR,
> +                         1.0, 0.0, 0.0, /* Red */
> +                         &data->overlay1_fb);
> +
> +     /* Overlay 2 - Green square */
> +     igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
> +                         DRM_FORMAT_XRGB8888,
> +                         DRM_FORMAT_MOD_LINEAR,
> +                         0.0, 1.0, 0.0, /* Green */
> +                         &data->overlay2_fb);
> +}
> +
> +static void setup_initial_modeset(data_t *data)
> +{
> +     /* Initial modeset to establish baseline (no fences) */
> +     igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data->display,=
 data->pipe));
> +     igt_plane_set_fb(data->primary, &data->primary_fb);
> +     igt_plane_set_fb(data->overlay1, &data->overlay1_fb);
> +     igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS=
_Y);
> +     igt_plane_set_fb(data->overlay2, &data->overlay2_fb);
> +     igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSE=
T -
> +                             data->overlay2_fb.width, OVERLAY1_POS_Y);
> +     igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +/**
> + * multiplane_atomic_fence_wait - Test atomic commit with mixed fence st=
ates
> + *
> + * This test reproduces the critical scenario where multiple planes are =
updated
> + * in a single atomic commit with different fence states. The key valida=
tion is
> + * that the display does NOT update any plane until ALL fences are signa=
led.
> + *
> + * Test setup:
> + * - Primary plane: buffer with a signaled fence (already retired)
> + * - Overlay 1 plane: buffer with a signaled fence (already retired)
> + * - Overlay 2 plane: buffer with an UNSIGNALED fence (long-running oper=
ation)
> + *
> + * Expected behavior:
> + * - Atomic commit succeeds immediately (non-blocking)
> + * - Display waits internally for ALL fences before updating
> + * - No plane shows its new buffer until the unsignaled fence completes
> + * - After signaling the last fence, all planes update atomically
> + *
> + * Bug detection:
> + * If the driver has a bug, it will either:
> + * 1. Show the primary and overlay1 buffers prematurely (before overlay2=
's fence signals)
> + * 2. Cause visual glitches from fence mismanagement
> + * 3. Fail the atomic commit
> + */
> +static void multiplane_atomic_fence_wait(data_t *data)
> +{
> +     int timelines[NUM_PLANES];
> +     int fences[NUM_PLANES];
> +     int ret;
> +     int out_fence;
> +     igt_plane_t *planes[NUM_PLANES];
> +     bool should_signal[NUM_PLANES] =3D { true, true, false };
> +     igt_crc_t crc_before, crc_after, crc_final;
> +
> +     igt_require_sw_sync();
> +
> +     setup_initial_modeset(data);
> +
> +     /* Setup arrays for loop-based processing */
> +     planes[PLANE_PRIMARY_IDX] =3D data->primary;
> +     planes[PLANE_OVERLAY1_IDX] =3D data->overlay1;
> +     planes[PLANE_OVERLAY2_IDX] =3D data->overlay2;
> +
> +     /* Start CRC capture to verify no premature display updates */
> +     igt_pipe_crc_start(data->pipe_crc);
> +     igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_before)=
;
> +
> +     /* Create timelines and fences for all planes */
> +     for (int i =3D 0; i < NUM_PLANES; i++) {
> +             /* Create timeline */
> +             timelines[i] =3D sw_sync_timeline_create();
> +             igt_assert(timelines[i] >=3D 0);
> +
> +             /* Create fence at sequence 1 */
> +             fences[i] =3D sw_sync_timeline_create_fence(timelines[i], 1=
);
> +             igt_assert(fences[i] >=3D 0);
> +
> +             /* Signal fence (first 2 planes) */
> +             if (should_signal[i]) {
> +                     sw_sync_timeline_inc(timelines[i], 1);
> +                     igt_assert_eq(sync_fence_status(fences[i]), 1);
> +             } else {
> +                     /* Do not signal this fence yet, 3rd plane */
> +                     igt_assert_eq(sync_fence_status(fences[i]), 0);
> +             }
> +
> +             /* Attach IN_FENCE_FD to plane */
> +             igt_plane_set_fence_fd(planes[i], fences[i]);
> +     }
> +
> +     /* Swap overlay colors to detect scanout changes via CRC */
> +     igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
> +     igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS=
_Y);
> +     igt_plane_set_fb(data->overlay2, &data->overlay1_fb);
> +     igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSE=
T -
> +                             data->overlay1_fb.width, OVERLAY1_POS_Y);
> +
> +     /* Request OUT_FENCE to track when display update completes */
> +     igt_crtc_request_out_fence(igt_crtc_for_pipe(&data->display, data->=
pipe));
> +
> +     /*
> +      * The atomic commit should succeed immediately (NONBLOCK mode),
> +      * but the display should NOT update any plane until ALL fences
> +      * (including the unsignaled overlay2 fence) are signaled.
> +      *
> +      * A buggy driver might:
> +      * - Show primary and overlay1 immediately
> +      * - Cause visual corruption
> +      * - Fail the commit
> +      */
> +     ret =3D igt_display_try_commit_atomic(&data->display,
> +                                         DRM_MODE_ATOMIC_NONBLOCK,
> +                                         NULL);
> +     igt_assert_eq(ret, 0);
> +
> +     /* Get the out fence to monitor completion */
> +     out_fence =3D igt_crtc_for_pipe(&data->display, data->pipe)->out_fe=
nce_fd;
> +     igt_assert(out_fence >=3D 0);
> +
> +     /* Verify overlay2 fence (last one) is still unsignaled */
> +     igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 0);
> +
> +     /* Verify out fence is also unsignaled (display hasn't updated yet)=
 */
> +     ret =3D sync_fence_status(out_fence);
> +     igt_assert_f(ret !=3D 1,
> +                  "OUT_FENCE already signaled while overlay2 fence is un=
signaled - "
> +                  "driver did not wait for all IN_FENCEs!");
> +
> +     /*
> +      * Wait briefly and verify display hasn't updated via CRC check.
> +      * In a buggy implementation, the display might update prematurely.
> +      */
> +     usleep(100000); /* 100ms */
> +
> +     /* Check if out fence signaled prematurely */
> +     ret =3D sync_fence_status(out_fence);
> +     igt_assert_f(ret !=3D 1,
> +                  "OUT_FENCE signaled before overlay2 fence - "
> +                  "driver updated display without waiting for all fences=
");
> +
> +     /* CRC verify - check if display has not updated prematurely */
> +     igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_after);
> +     igt_assert_crc_equal(&crc_before, &crc_after);
> +
> +     /* Now signal the blocking fence (overlay2) */
> +     sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
> +
> +     /* Wait for overlay2 fence to be signaled */
> +     ret =3D sync_fence_wait(fences[PLANE_OVERLAY2_IDX], FENCE_TIMEOUT_M=
S);
> +     igt_assert_eq(ret, 0);
> +     igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 1);
> +
> +     /* Now wait for the display update to complete (out fence signals) =
*/
> +     ret =3D sync_fence_wait(out_fence, FENCE_TIMEOUT_MS);
> +     igt_assert_eq(ret, 0);
> +     igt_assert_eq(sync_fence_status(out_fence), 1);
> +
> +     /* Verify display has now updated (CRC should differ from baseline)=
 */
> +     igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_final);
> +     igt_assert_f(!igt_check_crc_equal(&crc_before, &crc_final),
> +                  "Display did not update after all fences signaled");

>This does confirm that the CRC changed after fence is signaled, but IMHO
it would be better to do a positive check with the reference CRC of the
expected frame after signaling, to ensure that we don't have any
corruptions?

>Thanks and Regards,
>Karthik.B.S

Okay got it, I'll add the change accordingly.
Thanks for pointing out.

With Regards,
Sebin

> +
> +     igt_pipe_crc_stop(data->pipe_crc);
> +
> +     /* Cleanup */
> +     for (int i =3D 0; i < NUM_PLANES; i++) {
> +             close(fences[i]);
> +             close(timelines[i]);
> +             igt_plane_set_fence_fd(planes[i], -1);
> +     }
> +     close(out_fence);
> +     igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd =3D -1;
> +}
> +
> +static void reset_display_state(data_t *data)
> +{
> +     igt_plane_set_fb(data->primary, NULL);
> +     igt_plane_set_fb(data->overlay1, NULL);
> +     igt_plane_set_fb(data->overlay2, NULL);
> +     igt_output_set_crtc(data->output, NULL);
> +     igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +int igt_main()
> +{
> +     data_t data =3D {};
> +
> +     igt_fixture() {
> +             data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> +             kmstest_set_vt_graphics_mode();
> +             igt_display_require(&data.display, data.drm_fd);
> +             igt_display_require_output(&data.display);
> +
> +             setup_output(&data);
> +             create_fbs(&data);
> +
> +             data.pipe_crc =3D igt_pipe_crc_new(data.drm_fd, data.pipe,
> +                                              IGT_PIPE_CRC_SOURCE_AUTO);
> +     }
> +
> +     igt_describe("Test atomic commit with 3 planes (1 primary, 2 overla=
y) "
> +                  "where 2 planes have signaled fences and 1 plane has a=
n "
> +                  "unsignaled fence. Validates that display does not upd=
ate "
> +                  "any plane until all fences are signaled");
> +     igt_subtest("multiplane-atomic-fence-wait")
> +             multiplane_atomic_fence_wait(&data);
> +
> +     igt_fixture() {
> +             reset_display_state(&data);
> +             igt_pipe_crc_free(data.pipe_crc);
> +             cleanup_crtc(&data);
> +             igt_display_fini(&data.display);
> +             drm_close_driver(data.drm_fd);
> +     }
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 7f356de9b..eb7c8b13b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -36,6 +36,7 @@ test_progs =3D [
>        'kms_dither',
>        'kms_display_modes',
>        'kms_dp_aux_dev',
> +     'kms_explicit_fence',
>        'kms_feature_discovery',
>        'kms_flip',
>        'kms_flip_event_leak',

--_000_CH0PR11MB5427668FFFF757756E18B492987CACH0PR11MB5427namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;B S, Karthik &lt;karthik.b.s@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, March 4, 2026 11:36 AM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;; igt-dev@lists.fre=
edesktop.org &lt;igt-dev@lists.freedesktop.org&gt;<br>
<b>Cc:</b>&nbsp;Santa, Carlos &lt;carlos.santa@intel.com&gt;; Karas, Krzysz=
tof &lt;krzysztof.karas@intel.com&gt;; Konieczny, Kamil &lt;kamil.konieczny=
@intel.com&gt;; Kempczynski, Zbigniew &lt;zbigniew.kempczynski@intel.com&gt=
;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v5] tests/kms_explict_fence: Add Test=
 for Explicit Fencing
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi Sebinraj,<br>
<br>
On 2/26/2026 3:01 PM, S Sebinraj wrote:<br>
&gt; Add a new test to validate explicit fencing.<br>
&gt; This test handles multiple planes in a single atomic commit.<br>
&gt; This test addresses a critical scenario where drivers must correctly<b=
r>
&gt; synchronize planes with mixed fence states.<br>
&gt;<br>
&gt; Test Scenario:<br>
&gt; - Creates three planes: one primary, two overlay<br>
&gt; - Attaches fences with different states:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Primary plane:&nbsp;&nbsp; signaled fence (s=
imulating completed GPU work)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Overlay-1 plane: signaled fence (simulating =
completed GPU work)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Overlay-2 plane: unsignaled fence (simulatin=
g long-running GPU job)<br>
&gt; - Submits all planes in a single atomic commit with IN_FENCE_FD set<br=
>
&gt; - Validates that display waits for ALL fences before updating ANY plan=
e<br>
&gt;<br>
&gt; Bug Detection:<br>
&gt; This test catches driver bugs where:<br>
&gt;&nbsp;&nbsp; - Planes with signaled fences update prematurely before un=
signaled<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; fences complete, breaking atomic commit semant=
ics<br>
&gt;&nbsp;&nbsp; - Fence states are mismanaged across multiple planes causi=
ng visual<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; glitches or corruption<br>
&gt;&nbsp;&nbsp; - The driver fails to wait on all IN_FENCE_FDs atomically<=
br>
&gt;<br>
&gt; The test uses sw_sync timelines to create controllable fence states,<b=
r>
&gt; allowing precise validation of fence synchronization behavior. An<br>
&gt; OUT_FENCE_PTR is requested to monitor when the display update actually=
<br>
&gt; completes, enabling detection of premature updates.<br>
&gt;<br>
&gt; Implementation Details:<br>
&gt; - Uses sw_sync for creating fences with controlled signaling<br>
&gt; - Monitors OUT_FENCE to detect premature display updates<br>
&gt; - Validates atomic commit integrity across multiple planes<br>
&gt;<br>
&gt; Background:<br>
&gt; - A bug regressed for Xe driver on PTL (Android) display handling<br>
&gt;&nbsp;&nbsp;&nbsp; of explicit fences when provided two or more buffers=
 at once,<br>
&gt;&nbsp;&nbsp;&nbsp; with 1+ already-signaled fences and 1+ not-yet-signa=
led fences.<br>
&gt;&nbsp;&nbsp;&nbsp; <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink"=
 id=3D"OWAe39fb0af-34b1-8b71-2f74-73bd9a4ec72c" href=3D"https://patchwork.f=
reedesktop.org/patch/662982/">
https://patchwork.freedesktop.org/patch/662982/</a><br>
&gt; - Adding this test so that IGT contains sufficient testing for the<br>
&gt;&nbsp;&nbsp;&nbsp; use of explicit fencing in the KMS Atomic Modesettin=
g APIs.<br>
&gt;<br>
&gt; Changes:<br>
&gt; -v5<br>
&gt;&nbsp;&nbsp;&nbsp; - Make overlay plane validation scalable with<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; overlay count.<br>
&gt;&nbsp;&nbsp;&nbsp; - Modify commit message.<br>
&gt; -v4<br>
&gt;&nbsp;&nbsp;&nbsp; - Fix build errors as per latest API name<br>
&gt; -v3<br>
&gt;&nbsp;&nbsp;&nbsp; - Add crc check on display update<br>
&gt;&nbsp;&nbsp;&nbsp; - Adding proper License entry<br>
&gt;&nbsp;&nbsp;&nbsp; - Reduce test description<br>
&gt; -v2<br>
&gt;&nbsp;&nbsp;&nbsp; - Add crc check instead of visual inspection<br>
&gt;&nbsp;&nbsp;&nbsp; - Reduce debug logging which are not needed<br>
&gt;&nbsp;&nbsp;&nbsp; - Add a function for initial modset<br>
&gt;&nbsp;&nbsp;&nbsp; - Make test not specific to Intel drivers alone<br>
&gt;&nbsp;&nbsp;&nbsp; - Sort the included libs in alphabetical order<br>
&gt;&nbsp;&nbsp;&nbsp; - Modify set_output func as we want only one<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output per pipe<br>
&gt;<br>
&gt; Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; tests/kms_explicit_fence.c | 348 +++++++++++++++++++++++++=
++++++++++++<br>
&gt;&nbsp;&nbsp; tests/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp;&nbsp; 2 files changed, 349 insertions(+)<br>
&gt;&nbsp;&nbsp; create mode 100644 tests/kms_explicit_fence.c<br>
&gt;<br>
&gt; diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c<b=
r>
&gt; new file mode 100644<br>
&gt; index 000000000..3d96e0de5<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/kms_explicit_fence.c<br>
&gt; @@ -0,0 +1,348 @@<br>
&gt; +// SPDX-License-Identifier: MIT<br>
&gt; +/*<br>
&gt; + * Copyright =A9 2026 Intel Corporation<br>
&gt; + */<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * TEST: kms explicit fence multiplane<br>
&gt; + * Category: Display<br>
&gt; + * Description: Test explicit fencing with multiple planes and mixed =
fence states<br>
&gt; + * Driver requirement: i915, xe<br>
&gt; + * Mega feature: General Display Features<br>
&gt; + *<br>
&gt; + * This test validates correct handling of explicit fences when multi=
ple planes<br>
&gt; + * are updated in a single atomic commit with different fence states.=
 This is<br>
&gt; + * critical for catching fence synchronization bugs where the driver =
might:<br>
&gt; + * 1. Prematurely display buffers with signaled fences before unsigna=
led fences complete<br>
&gt; + * 2. Mismanage fence states across multiple planes causing visual gl=
itches<br>
&gt; + * 3. Fail to wait on all fences atomically before updating the displ=
ay<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;errno.h&gt;<br>
&gt; +#include &lt;poll.h&gt;<br>
&gt; +#include &lt;stdbool.h&gt;<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt; +#include &lt;string.h&gt;<br>
&gt; +#include &lt;sys/eventfd.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;igt.h&quot;<br>
&gt; +#include &quot;igt_aux.h&quot;<br>
&gt; +#include &quot;sw_sync.h&quot;<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * SUBTEST: multiplane-atomic-fence-wait<br>
&gt; + * Description: Test 3 planes (1 primary, 2 overlay) with mixed fence=
 states:<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 2 planes with signaled fences and 1 plane with unsignaled fence=
.<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; Validates that display waits for all fences before updating any=
 plane.<br>
&gt; + */<br>
&gt; +<br>
&gt; +/* Test configuration macros */<br>
&gt; +#define NUM_PLANES 3<br>
&gt; +#define PLANE_PRIMARY_IDX 0<br>
&gt; +#define PLANE_OVERLAY1_IDX 1<br>
&gt; +#define PLANE_OVERLAY2_IDX 2<br>
&gt; +#define OVERLAY_COUNT (NUM_PLANES - 1)<br>
&gt; +<br>
&gt; +#define FENCE_TIMEOUT_MS 2000<br>
&gt; +<br>
&gt; +#define OVERLAY_SIZE_DIVISOR 3<br>
&gt; +#define OVERLAY1_POS_X 100<br>
&gt; +#define OVERLAY1_POS_Y 100<br>
&gt; +#define OVERLAY2_OFFSET 100<br>
&gt; +<br>
&gt; +typedef struct {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int drm_fd;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t display;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; enum pipe pipe;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *primary;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *overlay1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *overlay2;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb primary_fb;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb overlay1_fb;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb overlay2_fb;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *mode;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int width, height;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_t *pipe_crc;<br>
&gt; +} data_t;<br>
&gt; +<br>
&gt; +static void setup_output(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D &amp;data-&gt;dis=
play;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_t *crtc;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_crtc_with_single_output(display, cr=
tc, output) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int overlay_count =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;primary =3D igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMA=
RY);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Count available overlays - we need at least OVERLAY_COUNT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; for (int i =3D 0; i &lt; OVERLAY_COUNT; i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (igt_crtc_get_plane_=
type_index(crtc, DRM_PLANE_TYPE_OVERLAY, i))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; overlay_count++;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (overlay_count &gt;=3D OVERLAY_COUNT) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;overlay1 =3D i=
gt_crtc_get_plane_type_index(crtc,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_PLANE_TYPE_OVERLAY,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;overlay2 =3D i=
gt_crtc_get_plane_type_index(crtc,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_PLANE_TYPE_OVERLAY,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1);<br>
Please fix the alignment here.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;output =3D out=
put;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;pipe =3D crtc-=
&gt;pipe;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;mode =3D igt_o=
utput_get_mode(output);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;width =3D data=
-&gt;mode-&gt;hdisplay;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;height =3D dat=
a-&gt;mode-&gt;vdisplay;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_skip(&quot;Need at least %d overlay plan=
es for this test\n&quot;, OVERLAY_COUNT);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void cleanup_crtc(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_reset(&amp;data-&gt;display);<br=
>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt=
;primary_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt=
;overlay1_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt=
;overlay2_fb);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void create_fbs(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int overlay_width =3D data-&gt;width / OVERL=
AY_SIZE_DIVISOR;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int overlay_height =3D data-&gt;height / OVE=
RLAY_SIZE_DIVISOR;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Primary plane - Blue background */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_create_color_fb(data-&gt;drm_fd, data-&g=
t;width, data-&gt;height,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_XRGB8888,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_MOD_LINEAR,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0.0, 0.0, 1.0, /* Blue */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &amp;data-&gt;primary_fb);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Overlay 1 - Red square */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_create_color_fb(data-&gt;drm_fd, overlay=
_width, overlay_height,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_XRGB8888,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_MOD_LINEAR,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 1.0, 0.0, 0.0, /* Red */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &amp;data-&gt;overlay1_fb);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Overlay 2 - Green square */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_create_color_fb(data-&gt;drm_fd, overlay=
_width, overlay_height,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_XRGB8888,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_MOD_LINEAR,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0.0, 1.0, 0.0, /* Green */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &amp;data-&gt;overlay2_fb);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void setup_initial_modeset(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Initial modeset to establish baseline (no=
 fences) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_crtc(data-&gt;output, igt_crt=
c_for_pipe(&amp;data-&gt;display, data-&gt;pipe));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary, &amp;data=
-&gt;primary_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay1, &amp;dat=
a-&gt;overlay1_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay1, OV=
ERLAY1_POS_X, OVERLAY1_POS_Y);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay2, &amp;dat=
a-&gt;overlay2_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay2, da=
ta-&gt;width - OVERLAY2_OFFSET -<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;overlay2_fb.width, OVERLAY1_POS_Y);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit2(&amp;data-&gt;display, C=
OMMIT_ATOMIC);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * multiplane_atomic_fence_wait - Test atomic commit with mixed fence=
 states<br>
&gt; + *<br>
&gt; + * This test reproduces the critical scenario where multiple planes a=
re updated<br>
&gt; + * in a single atomic commit with different fence states. The key val=
idation is<br>
&gt; + * that the display does NOT update any plane until ALL fences are si=
gnaled.<br>
&gt; + *<br>
&gt; + * Test setup:<br>
&gt; + * - Primary plane: buffer with a signaled fence (already retired)<br=
>
&gt; + * - Overlay 1 plane: buffer with a signaled fence (already retired)<=
br>
&gt; + * - Overlay 2 plane: buffer with an UNSIGNALED fence (long-running o=
peration)<br>
&gt; + *<br>
&gt; + * Expected behavior:<br>
&gt; + * - Atomic commit succeeds immediately (non-blocking)<br>
&gt; + * - Display waits internally for ALL fences before updating<br>
&gt; + * - No plane shows its new buffer until the unsignaled fence complet=
es<br>
&gt; + * - After signaling the last fence, all planes update atomically<br>
&gt; + *<br>
&gt; + * Bug detection:<br>
&gt; + * If the driver has a bug, it will either:<br>
&gt; + * 1. Show the primary and overlay1 buffers prematurely (before overl=
ay2's fence signals)<br>
&gt; + * 2. Cause visual glitches from fence mismanagement<br>
&gt; + * 3. Fail the atomic commit<br>
&gt; + */<br>
&gt; +static void multiplane_atomic_fence_wait(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int timelines[NUM_PLANES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int fences[NUM_PLANES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int out_fence;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *planes[NUM_PLANES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool should_signal[NUM_PLANES] =3D { true, t=
rue, false };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_crc_t crc_before, crc_after, crc_final;<=
br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_require_sw_sync();<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; setup_initial_modeset(data);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Setup arrays for loop-based processing */=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; planes[PLANE_PRIMARY_IDX] =3D data-&gt;prima=
ry;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; planes[PLANE_OVERLAY1_IDX] =3D data-&gt;over=
lay1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; planes[PLANE_OVERLAY2_IDX] =3D data-&gt;over=
lay2;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Start CRC capture to verify no premature =
display updates */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_start(data-&gt;pipe_crc);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_get_current(data-&gt;drm_fd, da=
ta-&gt;pipe_crc, &amp;crc_before);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Create timelines and fences for all plane=
s */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; NUM_PLANES; i++) {<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Create timeline */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; timelines[i] =3D sw_sync_timeline_create();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(timelines[i] &gt;=3D 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Create fence at sequence 1 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fences[i] =3D sw_sync_timeline_create_fence(timelines[i], 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(fences[i] &gt;=3D 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Signal fence (first 2 planes) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (should_signal[i]) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sw_sync_timeline_inc(ti=
melines[i], 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fenc=
e_status(fences[i]), 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Do not signal this f=
ence yet, 3rd plane */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fenc=
e_status(fences[i]), 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Attach IN_FENCE_FD to plane */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_plane_set_fence_fd(planes[i], fences[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Swap overlay colors to detect scanout cha=
nges via CRC */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay1, &amp;dat=
a-&gt;overlay2_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay1, OV=
ERLAY1_POS_X, OVERLAY1_POS_Y);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay2, &amp;dat=
a-&gt;overlay1_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay2, da=
ta-&gt;width - OVERLAY2_OFFSET -<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;overlay1_fb.width, OVERLAY1_POS_Y);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Request OUT_FENCE to track when display u=
pdate completes */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_request_out_fence(igt_crtc_for_pipe=
(&amp;data-&gt;display, data-&gt;pipe));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The atomic commit should succeed imm=
ediately (NONBLOCK mode),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * but the display should NOT update an=
y plane until ALL fences<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (including the unsignaled overlay2 f=
ence) are signaled.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * A buggy driver might:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - Show primary and overlay1 immediat=
ely<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - Cause visual corruption<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - Fail the commit<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_display_try_commit_atomic(&amp;d=
ata-&gt;display,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; DRM_MODE_ATOMIC_NONBLOCK,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; NULL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Get the out fence to monitor completion *=
/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; out_fence =3D igt_crtc_for_pipe(&amp;data-&g=
t;display, data-&gt;pipe)-&gt;out_fence_fd;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(out_fence &gt;=3D 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Verify overlay2 fence (last one) is still=
 unsignaled */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fence_status(fences[PLANE=
_OVERLAY2_IDX]), 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Verify out fence is also unsignaled (disp=
lay hasn't updated yet) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D sync_fence_status(out_fence);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;OUT_FENCE already signaled while ov=
erlay2 fence is unsignaled - &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;driver did not wait for all IN_FENC=
Es!&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Wait briefly and verify display hasn=
't updated via CRC check.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * In a buggy implementation, the displ=
ay might update prematurely.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; usleep(100000); /* 100ms */<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Check if out fence signaled prematurely *=
/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D sync_fence_status(out_fence);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;OUT_FENCE signaled before overlay2 =
fence - &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;driver updated display without wait=
ing for all fences&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* CRC verify - check if display has not upd=
ated prematurely */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_get_current(data-&gt;drm_fd, da=
ta-&gt;pipe_crc, &amp;crc_after);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_crc_equal(&amp;crc_before, &amp;c=
rc_after);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Now signal the blocking fence (overlay2) =
*/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sw_sync_timeline_inc(timelines[PLANE_OVERLAY=
2_IDX], 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Wait for overlay2 fence to be signaled */=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D sync_fence_wait(fences[PLANE_OVERLAY=
2_IDX], FENCE_TIMEOUT_MS);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fence_status(fences[PLANE=
_OVERLAY2_IDX]), 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Now wait for the display update to comple=
te (out fence signals) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D sync_fence_wait(out_fence, FENCE_TIM=
EOUT_MS);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fence_status(out_fence), =
1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Verify display has now updated (CRC shoul=
d differ from baseline) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_get_current(data-&gt;drm_fd, da=
ta-&gt;pipe_crc, &amp;crc_final);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(!igt_check_crc_equal(&amp;crc_b=
efore, &amp;crc_final),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Display did not update after all fe=
nces signaled&quot;);<br>
<br>
&gt;This does confirm that the CRC changed after fence is signaled, but IMH=
O<br>
it would be better to do a positive check with the reference CRC of the<br>
expected frame after signaling, to ensure that we don't have any<br>
corruptions?<br>
<br>
&gt;Thanks and Regards,<br>
&gt;Karthik.B.S</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Okay got it, I'll add the change accordingly.&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for pointing out.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
With Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Sebin</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_stop(data-&gt;pipe_crc);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Cleanup */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; NUM_PLANES; i++) {<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close(fences[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close(timelines[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_plane_set_fence_fd(planes[i], -1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; close(out_fence);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_for_pipe(&amp;data-&gt;display, dat=
a-&gt;pipe)-&gt;out_fence_fd =3D -1;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void reset_display_state(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary, NULL);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay1, NULL);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay2, NULL);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_crtc(data-&gt;output, NULL);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit2(&amp;data-&gt;display, C=
OMMIT_ATOMIC);<br>
&gt; +}<br>
&gt; +<br>
&gt; +int igt_main()<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; data_t data =3D {};<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kmstest_set_vt_graphics_mode();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_display_require(&amp;data.display, data.drm_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_display_require_output(&amp;data.display);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; setup_output(&amp;data);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; create_fbs(&amp;data);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data.pipe_crc =3D igt_pipe_crc_new(data.drm_fd, data.pipe,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IGT_PIPE_CRC_SOURCE_AUT=
O);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Test atomic commit with 3=
 planes (1 primary, 2 overlay) &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;where 2 planes have signaled fences=
 and 1 plane has an &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;unsignaled fence. Validates that di=
splay does not update &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;any plane until all fences are sign=
aled&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;multiplane-atomic-fence-wa=
it&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; multiplane_atomic_fence_wait(&amp;data);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; reset_display_state(&amp;data);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_pipe_crc_free(data.pipe_crc);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cleanup_crtc(&amp;data);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_display_fini(&amp;data.display);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_close_driver(data.drm_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; diff --git a/tests/meson.build b/tests/meson.build<br>
&gt; index 7f356de9b..eb7c8b13b 100644<br>
&gt; --- a/tests/meson.build<br>
&gt; +++ b/tests/meson.build<br>
&gt; @@ -36,6 +36,7 @@ test_progs =3D [<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_dither',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_display_modes',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_dp_aux_dev',<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; 'kms_explicit_fence',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_feature_discovery',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_flip',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_flip_event_leak',<br>
</div>
</body>
</html>

--_000_CH0PR11MB5427668FFFF757756E18B492987CACH0PR11MB5427namp_--
