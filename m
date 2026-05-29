Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626D3CD4F54
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 13:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F2D10FF4D;
	Fri, 29 May 2026 13:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ii84Owxn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198B810FF4B
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780061848; x=1811597848;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9ojGuOaXy/fNwc4ULYuzDAfPUDlUbp2Y5u7VcdrJMyw=;
 b=Ii84OwxnwB6MXqknmZeTA1ygX8dTdRh9q+8aGF3zgORd50ulNiUtqn8O
 bPfpmwM5NrPL0+q7LvvrT0l508koELgs5fqPCiC2rFtYFEvN063wGPiZT
 0Uw61Uw4HqXsECL1qMEmC4BFu7xXC1z/SZguhr34JsX2NTWGzoSadwYtP
 M3ULHzn92jlH1DmX5aWt6PjrFZj0XZ7faoDJwU5mJxI3i8qUqQxPKA/E2
 C1jj+rKTgc4TiohSBpNs5w7qDGzQ16ud9VJlzcl1e2vGoRXsVjxeU+45u
 QdYf3JkdscPQpDsg+EX/NCF6AVkJGKHbxtMGoO91hE/HIMj037CYoIsb6 A==;
X-CSE-ConnectionGUID: /8MA5jfvTdeDRrRv9LBZ2g==
X-CSE-MsgGUID: ytYuB8WTT8GCOKf6kn7spw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91596724"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="91596724"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 06:37:28 -0700
X-CSE-ConnectionGUID: z9xYINZrQs2mEr97aHGbLw==
X-CSE-MsgGUID: bmLOgCbLTKuVleFc04gWkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="239853632"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 06:37:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 06:37:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 06:37:27 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 06:37:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0308xv4HeWugM2V3cp+akZvznOPVHgE2VhbvCLzVlrAdMXh2bZHALLz0ksmaw3C9kxFgLWn/QhBwzaUVHyTSow8yRyTHjSMfyIWoE1fkU/waPzFuCXZ1uh7sav1gR7SHhY0mYS7Oi9ZqzbG71ex081EA7Mj0LoPchPavy+2GytLfCqKVmHk/XuGX2ZMr5VlA5aKpCur4AF/l9stzDXtV+oszwKEKu8gH1z/fHifFqlvxG0r19tPHMA5i8oqtaMlKt7n2MIkuAedfE3NI5JDhyZWxsKRV8JqufIBVGln1r735w8ioVtJlYWNlyS1VhdZ4q3cStrDENwbqa0pxVYG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gV+XngDumc9j8klVzaPt5GyMKgDNxLptpe3zqxtJwbM=;
 b=Yp8fxOcGUQIUKfSR+pV+Z8GOejWd4uWg4pP8wTVYIKJRGP+8iiJpQmgAWgJnMlOc0wZJTqniDDI9U9XENNH31IRGcBFY3jYRhFu6I3/1XUVydB5+YN+2MTeF7S6xOj3kT0XDsRV3osBryDK0HSSLcXD01kuG6bpGvrClVdaArGGpEZtZM1fWSrfvtvONDGhq3eD7PfC+g1ETbLd+qFv936tvN1tiUUkFrAoKAGPyY0d74VQdZHPTGjX7PoFbUi6jKU/zVilpteAvA7EBkC8gA2YUH8a0/usxyFXfqVklvOmt0PCbKB2XYId5q2oZgvL7JJDAfROdj/nmb37iniQf9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DSWPR11MB9956.namprd11.prod.outlook.com (2603:10b6:8:3a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 13:37:24 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 13:37:24 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jani Nikula
 <jani.nikula@intel.com>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <igt-dev@lists.freedesktop.org>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>, Ville =?utf-8?B?U3ly?=
 =?utf-8?B?asOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 1/2] lib/drmtest: add __drm_open_driver_path()
In-Reply-To: <20260527132247.oqxnekctlpttxoyc@kamilkon-DESK.igk.intel.com>
References: <cover.1779793438.git.sebastian.brzezinka@intel.com>
 <ce36517d762c8e1f7e8988df446f12853f2fdda6.1779793676.git.sebastian.brzezinka@intel.com>
 <c7f64283b82bdbf091007180335a3eed6a56c4ba@intel.com>
 <DISLAJF1M2CM.34O1ZGNO7XPCJ@intel.com>
 <52f0ee9cddf9c1efdac53691c82f5a147afb8556@intel.com>
 <20260527132247.oqxnekctlpttxoyc@kamilkon-DESK.igk.intel.com>
Date: Fri, 29 May 2026 10:37:19 -0300
Message-ID: <87cxyes5f4.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::14) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DSWPR11MB9956:EE_
X-MS-Office365-Filtering-Correlation-Id: ec1be645-57c3-4327-48b8-08debd876af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|32116099003|18002099003|22082099003|6133799003|5023799004|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: k+ek1CQtR9bGdZZbnPDbT1LkbBAjGw5/U6HqDU28hadZtbTjQo7hdnzolRPi5wIlegTs+nESgv/sohdeI98EGYsFFQ5GiUCxbCnUGXrEuHAAt5HtbBIGsyUEPQma+HVqLtj0CAmLP8oxSbaNFpRv1MUvmBTO7GsfCUW92XLNU4wNjtBisxOgrHGc55FFwNOcrXGIGedgh2BYiVxIupqz7jypi8s1vIhDurTLozmOJ6p4Tx6KEb7Bjc87hUa3OJBMAgoRqhaLDc0HvYZKBYHM7OuTErhlrHoWb3W+mH+SHHre246amFewy1mKOqckXmFbLY0mz6JMDCj40Og3dtlYbZmlKHHZnxJ8/5va8CBD6BxaX0exCaLTvTe1GShmZmV6vT6q3WnirVRtFbrueaKbo+2i3sNt0N8ByGwJ8IttibsjnmeAP/so6QXTR9Up6Ct5S1JetdvUmd4zymZbEGtdrQxNWVWu3KAMTyLnSAgqpTYjbcpbWFxGmgp5rHPKqCCj2HulQuDVr2isnkJ+ojUfjfPVS3+D7dAfezJi5pASFgonVXRRlzbTiHGCO6HqQKcc+xC24tOsHGvUylDlkfN3WIMzEYpDCZaMxGLKcpd9BMlrQsP+7CjSbmQxcPDsQH6sXDU7dJyhU5KCluRn3NFOnarAHyXLfDTdTKymvSKRWmnhBke6soA7U3szrOoyfLtR/iGnVgSTRT8Hn0Zq75USAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(32116099003)(18002099003)(22082099003)(6133799003)(5023799004)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TnvHplGTwfZi9jl0SUqvhdZATs/4MVLhkANpqcMpUbRATaOFRC1IbLYmKhY1?=
 =?us-ascii?Q?9SRnke/UlXzmOKf4EA5xJU0mfNxGRMfLPjYx9BA+FnlfmUn9R2wj1pusHO9U?=
 =?us-ascii?Q?ys3DM3ELuYu4oM1vcXdt4+QaM6/GiaglY7V8WBW9w9EPJdAJrUOsHmngF3or?=
 =?us-ascii?Q?qjk+PDWbuirMc82ExdYNUoA18L3jvaD8f9SZu3pWlWjhMv23r6HPofzWpyhF?=
 =?us-ascii?Q?5ZeIAcwbmqYFsKMv2EQfiws4eiKIbbPtCYDseCBdntqKPXIybSN+VrRUDBlU?=
 =?us-ascii?Q?j3Z+6iFaOc1GBzSzIuNSP+hthVsbju9Fw6cC3VzclYITaBIAKSy564wXId55?=
 =?us-ascii?Q?cFKcKBMW+EPXZ6axxv//4VY7Ww+rQyRBzkakddpah3/5aBtZxlH6/h/OIEZb?=
 =?us-ascii?Q?GDyd8tZCHX1crZ4XjJx7/qe0dZ5mhSnSMYMG6F/jiLrsxJtyF1GUjjevMU4y?=
 =?us-ascii?Q?T2aova+rXSedJ94Jti38MsG9FzY21NHo1+2RyKFjs6FKmfZBH2lwFBUJaBcu?=
 =?us-ascii?Q?DdJ2vy0BgDN7VGoMmVyVCh7C3oPcnYf5LitmwssLoBvNbDVIFa7OB5pvmgH+?=
 =?us-ascii?Q?6j3OJ9VyJRKNR1TeTfOf69SdXF8u8Sen5S/5yOSrGGKC3q8EI50HqNV/unuy?=
 =?us-ascii?Q?SEFCHISD/CGzdSc/iKbkqsA3YLLK3x73wxmChTKg6wXnAuXVFO4MMLSWuiuK?=
 =?us-ascii?Q?yt8PoeIt/9lfTGNe9qeSpcAqeCJpbyF3IHkskQl6oR3NfMXH+ABL3+7o+qTm?=
 =?us-ascii?Q?BOKL7TnR2hAqrhl6xZZ7tObmcyN40idIXbKXX1ievC9oF+RNGeAs62KxJFOT?=
 =?us-ascii?Q?Ddmk55Jt2Zhbm9SldTbFk01yjRGQ71WOFtx1X//R+pX+JnJm+JJoF9/7R4BS?=
 =?us-ascii?Q?aZsYycT71K9q0RCbbGvCndTu/1EXTRclOB5hs3fPVGcfIfZKePpkvGyDlO5L?=
 =?us-ascii?Q?f5KIFOxdcZtNvnQcii7glEek7aEQStZtd2ylh5GRctmSPoZ9mCKi0FIKrXV3?=
 =?us-ascii?Q?VyTHrqCv283Br/8n5dB9uOSOPsQq+7TpVdK8YOdWwflhy5z6MeuVAYEJZ4/h?=
 =?us-ascii?Q?jNA2mCRjOfUHHnSajKkPe1L+vkv3LhtnhTMHuQw36CdfDE8hp8agySDknP2c?=
 =?us-ascii?Q?JS7/yOaVPDeSjSIeUX1Bw3q8/0ohj7aTqDFYIBtK0qa4+WhFrSTE9BRMUV+8?=
 =?us-ascii?Q?oIV1E1LwX3u59CETUO5dOJ+2NqTZKbXBM25LWBaPQYIfAkjiKoSqD6yFkzk4?=
 =?us-ascii?Q?GgEu7tOdnvmdDudhaSeFfjTcyVM35DDF/Ly3VrdplEPfM6kbLTYqTBErVdDl?=
 =?us-ascii?Q?fPxSYGJvO+2w99yVn9ZaRsBCe9uGoCoDJc/vK76ftAXxHKdH5YWzeto8Mh92?=
 =?us-ascii?Q?rMg+kDvRrl0a2SnhHUMvD3RfSbtcFoPB5+D1vRRDCx+dH/ECl3KR4HTrjy66?=
 =?us-ascii?Q?HhbHbo0exbomxjIZlhNejXUPTWM2k4s7uBtC0Jj/1vJ5tnnwOMHy79I+8vWo?=
 =?us-ascii?Q?Wou0K/GI/5prt6o4VnCsLv0/MXPcxhA4QAkMb6zjNnNDmShb3OYZY6qksKrn?=
 =?us-ascii?Q?uZm+1zbyxJaL4THlwcDHkrKp4/R4yqwvM9pOknFWe8DMA0L68tlRRJlAqoWZ?=
 =?us-ascii?Q?bNn43u6WmBQoPGn2quuvWlkgC4QiZmEQXRr58ToAHAM3qMEbwQWeowzKgWOh?=
 =?us-ascii?Q?9ipzkz8zHlnbFwPUFavZTeTJtUespnaowomQkUjDhYp+nnG4pZGkHdmste0O?=
 =?us-ascii?Q?XWckvaUQfQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: O+yXaAzCGyC1/G8vf0uJlf+wBihsWvjkyGsxv7xkFuz8AyqWgE/lNDFkLtW4WTVhRe3NUIkuIjJk/+olceZBMJEhExZ+INBZYgEn0EyRK7SYc2lQ7P9QZIJwtLhbHcr+dC9vT0IyDiImy7jtIgy6i+ShBYUMXX4XZoFooRH9tZKL1nnWfDFz+fB3xDntCvkSOQMo8MiaoBlsobSDblTlDlBe0kQXmEyodlelDL4ajYyU7wf27OwsYOqxMvS1ms6VEA0/tH2ryE2RE8EpHDXNjtc9c+h7LkP/h+NXmIc4voDpHGbTSGmkbohw91QLgNw4ygiupumFzUim4IuG8uHr5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1be645-57c3-4327-48b8-08debd876af1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 13:37:24.6946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/wuS0n+gfUDeU4V4QdIZ/fJxXrpQmZwyDeOjrII604PwTlxIHZl0+DBoGuhtTxHd/YuDrZYe9fF/ocD/vPJjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9956
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

Kamil Konieczny <kamil.konieczny@linux.intel.com> writes:

> Hi Jani,
> On 2026-05-26 at 15:07:57 +0300, Jani Nikula wrote:
>> On Tue, 26 May 2026, "Sebastian Brzezinka" <sebastian.brzezinka@intel.com> wrote:
>> > Hi Jani,
>> >
>> > On Tue May 26, 2026 at 1:51 PM CEST, Jani Nikula wrote:
>> >> On Tue, 26 May 2026, Sebastian Brzezinka <sebastian.brzezinka@intel.com> wrote:
>> >>> Add __drm_open_driver_path() as a path-based DRM open helper. It opens
>> >>> the given path with O_RDWR, verifies the resulting fd is a DRM device by
>> >>> issuing DRM_IOCTL_VERSION via __get_drm_device_name() before proceeding
>> >>> (returning -1 and closing on failure), logs the opened device path, and
>> >>> populates the xe_device cache when the device is Xe.
>> >>>
>> >>> The __ prefix signals that the function does not throw assertions or
>> >>> igt_require() calls, consistent with the existing __drm_open_driver*
>> >>> family.
>> >>
>> >> FWIW, I think the __ prefix should indicate "implementation detail,
>> >> don't call directly" or something along those lines.
>> >>
>> >> I think it's problematic to encourage tests to call __ prefixed
>> >> functions.
>
>
>> > In general I agree with you, but in v3 Kamil comment on this:
>> > ```
>> >>>Could you rename it into __drm_open_driver_path?
>> >>>The idea is that all __functions should not throw asserts nor
>> >>>require.
>> > ```
>> >
>> > So I added an explanation in the comment.
>> 
>> I obviously disagree with all of that, but *shrug*.
>
> We could implement separete lib functions for tools but
> that will require duplicate effort.
>
> The idea with __function is that it should be implemented
> without any igt_assert nor igt_require so tools could use them.
> We could go with function() but then developers could
> later on change behaviour and break a tool.
>
> Or we could add some suffix to a name? function_safe()?

Given the number of assertions that already exist under lib/, perhaps
this would be somewhat hard to achieve, but I feel like we should go the
other way around: a suffix to denote that a function uses IGT
assertions.

I.o.w., do_something() would be usable from both test and tools code;
do_something_asserting() would be a version of the same function that
contains assertions.

"asserting" is a bit long for a prefix, we could try to come up with
something better.

--
Gustavo Sousa

>
> Btw why tool/igt_power couldn't just read sysfs? Why does it
> needs to open /dev/dri/card* to get any info? +cc Ville
>
> Regards,
> Kamil
>
>> 
>> BR,
>> Jani.
>> 
>> 
>> -- 
>> Jani Nikula, Intel
