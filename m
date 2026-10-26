Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B346D606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 20:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=auc6cL6X
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5869410E362;
	Mon, 26 Oct 2026 20:11:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A87510E362
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 20:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793045433; x=1824581433;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4c0F76Eg5Qd/4v4fuvOxNsqBfBTX7JPR2x4339MX2JQ=;
 b=auc6cL6XBtwnu4yVhXZygZ826bOGhLbHLmLAtvrDk/0Ge125yywe+kyU
 tUq71oKM+bl5/eGcCLQhQ2L5Z//lhtltLEnC1hzWpOV51QkNaDuroX814
 z+pE2cyh/L2II4zmXacnC2R8TO1hqxOcJCKQAD7KjiLlna2Tylz2YVlMS
 yXZU4K82KaZeTCY0LqmRmL9/oPfBRXGwiphP15O8J86+J7ZqUyqOdhEk0
 Q6OeSlSGtaPu8/Z/K3somxMSZeye0+54uhJvA4UAcS/ToDkDjoBI1+PJt
 GYtRfwMrhVRq21EDPVy+6EXuNklzA4N9M0QjB2yHXcbb5Iblner0DyMJY w==;
X-CSE-ConnectionGUID: hQnIDwboRzq2MEDy5wJ+yw==
X-CSE-MsgGUID: JexV7CKqR7mWbv5d29R76w==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1744695"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1744695"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 13:10:32 -0700
X-CSE-ConnectionGUID: WzxYboBaQjuwKDqUQVr+Cg==
X-CSE-MsgGUID: MFSefpkaRDygodLHI9LdZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4310956"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 13:10:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 13:10:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 13:10:31 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 13:10:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9Q2Milg0Z8PcgImmYljbEoVG0imvNZWBOdhyffvh8k1DssvZRP66yOvWqxg0Kce8lJWCwYEJ+GeweUWe/p4lgtLSiaSffG0J+q/7m34RcmEymnUKZPFHt+96oUvxS+7ZQ2cpafF2qJ2L0KRsJ+xI3E/kgp5zOj/KpNUuGDPcGCypBsM/45/Fw/9C6xgINexJQ4tgHcNOAJNgQOscRFUB5tVVponxAd+Tar5pmSnNMvnXkDOEito0H68Wd4lMI7Xm93YCpaYzxinRJmBSckgplsOj/EkRSDnsn82S/jXd2dIu97m1G7PdboUfEMMUN/+Z5oUmKt32IBJIChhB9ZQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pI3YJsnLnyAVnnwj1c+0PDA1KqruRhRO3rLuw9KSBUQ=;
 b=uHU2POBM0oNwmuBBUci3Pt+3eQUR4o2slhooer/GeQN055M0VLXtOB7ZA/KW6BIiQk2odUNyuEhgvW82LgM1Siw5IfcQFyBYTjBLpMXlaP4drynM3O8YMVhqTBvQoT+l/OKZfzG6ACjPcfqtf8pefva1X7UpOL7nPyNLPkZsPQB1mu5PzjETQDedGJ1q34Wa8wXq/dnH11cUWxqXujLB7ZJY+0wlF2Tvcjrq0W9JL+mJDmaweiLeogBqDiduBZapZwnHYXwOaPvNxQBbaPi0mn1rOm+TWb8+2h6vUuDYRCDCg49y2bwlOohrvJ9qWUeyVpN9QlgNxnZYmNioAFZxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by DSSPR11MB9619.namprd11.prod.outlook.com (2603:10b6:8:376::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 20:10:29 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 20:10:28 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Matt Atwood
 <matthew.s.atwood@intel.com>
Subject: Re: [PATCH i-g-t v3 00/11] Implement Wa_14026539277
In-Reply-To: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
References: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
Date: Mon, 26 Oct 2026 17:10:23 -0300
Message-ID: <87o6cg9qa8.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:a03:333::16) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|DSSPR11MB9619:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5d4237-9570-4cf7-ee36-08df339d2dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|261026121527099003|3023799007|22082099003|11063799006|261022113327099003|56012099006|261021121427099003|10067099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: InR/YaKdMwKP1I9+UGOAzV28ZrEK6KhAxlHSO5Pv+lT0gLiofW5hjME0pmfSbSVNAiKgrssSs9T7B4StjEaKzR9X7rJLSzMzSy+Cxx4xjZ9Le/kwccQg19KFMrdaNVw+YOWxUFBMoc+RLwrIVusMjh/XOYJjr7UJH7sAjsVePbFh9qv+ubaBzgx4gS0QvOrdmvr9tm2YFXRqseAFsBSnBvUgFEU+4u7cQ0tUsQai2Mzgh9TRpyJ+XbqfxK0L13+tTEcgRp+hhXHAOKM6qfdV6jFvAuiotQr3bDqHxXReQUFoRWAIRJILWkoPgjyG4FJT5rALbdoYiWVr5EVLpivrPSgFJDcHRy/Kej5DfH9PeE6C4SaH47F3Yux49oFWM01MhqnVT6G9zZ+Q9w2kh8oafb7f6o4C4FoymRp88ynS+mfD0If8nREpLKvs49GdbuUxI8CpKZ6JTCs7tnt6FC6dIt8I+mvqzr+D4BEt/WE9CuiLRfv4T8uFcHUaee06IvrvGiv96ofMvXfoULdpOOfuNaZ3w42ElC7RfcvrSL6PXAM4z0d4TnA1LwGTwGUz2WhRpGykEhTMkz0gzmVnkkAsHroi2b2s2YgjMH7t553LV6Ri8kp44RWbfccDsP4NHGW1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(261026121527099003)(3023799007)(22082099003)(11063799006)(261022113327099003)(56012099006)(261021121427099003)(10067099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(260925021911599003)(260925021311599003)(260925022911599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MJ6fKFdAuNu+m1QwtxXft3jz4ioEnOeu3TXb8JC+F0+97XZU0WTTuWQaNFUv?=
 =?us-ascii?Q?Lyxtj2iw7hjry0FjuZtkfWN8jgQcU23TVkl8KOV7A/N2BqEA0QJdZ3PZhQqi?=
 =?us-ascii?Q?ZUp6ziR/lHHaw4hKbGHENOUU/hb9dZJuLqulIhBhg7amtytEVwUsoNnUSy62?=
 =?us-ascii?Q?LWR7JHp2Iy5JcTiQaYLt0gl6ihPevGLH9CpOKZKC2JbYcpMKiIRzBImNo0G0?=
 =?us-ascii?Q?oOD7iOfHhifDXHg+BuSuzY6ECfqyVxHks+LYDWSod3/OlbdGBIr0gu1zgjCH?=
 =?us-ascii?Q?yc53W/h/QzshoHycqiet9WkFBe++2bSheS9oM5GlWBeV4GPLpab/IKsSUlUN?=
 =?us-ascii?Q?ug6HqLaWy0Vi8aE92U5EHnObAmKrJGnxubKq3hxUeDkEKIUMfTRbXIYcDgsX?=
 =?us-ascii?Q?abcNhhWa9TlovzcAufHcyQYoo5NJgIsaqWUW0RUDnXLiFYw/SmkepCwRFJZk?=
 =?us-ascii?Q?PkPtJl9BnwsFeJvOHdE9w9/ZG0drhp/DoZeErb9iiK6gXfiXPH5hrdOd4icB?=
 =?us-ascii?Q?TMxi4F9fuvOan8OVVBfIqhDFXAYD9d64elo/blLNsxLRGG4oxr1RKzwxMaBS?=
 =?us-ascii?Q?cezMP3xs+o7ifJGkCp0B++4Q+cc15ISNpIPMqi5qUuUHLmaLgtw98q9G8sFX?=
 =?us-ascii?Q?GUfH4Px8e3Cn3Yp5s54EL6+4jriOffMNUMW95gQtoBj664oJ8JsNAdGm3gkC?=
 =?us-ascii?Q?vMgSCbQVs1QrhXg+P2Z7EonGg/YDj4QZOXBFGM8R4WajgNajpkOXPWJGQzN4?=
 =?us-ascii?Q?NRkllLA9MsHbXgP9bjcY+cZQUVW71ZVj5foJwwSETlrMNMz0QzU8+dwokez4?=
 =?us-ascii?Q?dkCg3UWR9/4IEwqjcQgYuwIGDPIE7iVCeBIO/TKiwFsiXftZIJVkblQOz+gC?=
 =?us-ascii?Q?0D+CLOa/gpcqUc4N9d4dyc/gxDZubRdcmaDC0djfGToSAZpkfOUMmdV++mfI?=
 =?us-ascii?Q?OfMi6zSunnywKqrrgfez37/JnnBmLbI1QAsEcqL4hlY+4ckG/5LEKeIUerHY?=
 =?us-ascii?Q?ZIhCiCPbILzi0rIq5eXHvvISTaYQAF2Ee3EZ1mJWn1OcyL2EBz2y6S9XAABV?=
 =?us-ascii?Q?tAhgnSsMk7dckFw5wI6siOpV/czb3bDdTx3MveoBJTVb5+cu+EOHvWGJCUD9?=
 =?us-ascii?Q?g09wzLfF34ojFu5KebCakMbNSwAuZAJCrPFbT3z2SjCHYdlgKjqL6WVjU1mV?=
 =?us-ascii?Q?pRQyFWDsbATcnCEaI25htKsQuSS3kIzmPQZW43WPb1ZnjAzG4Hn7v+5MCedm?=
 =?us-ascii?Q?Wvy2l0eUJtcqNHt9j772EBsA63a5kmZGwzaoig51xy30RFWP35mRKBT3yM1r?=
 =?us-ascii?Q?0rsMF8cGHq3kjynBb6VQtM5yPNJZ077ZoZskRQgosFSoikP49fFFCIiXjJgn?=
 =?us-ascii?Q?bcS5VRYHNbkq7p/6TXvfotXTGY5w1NDXFLTcpXTDkkPM2rbqnHjeynRJqUf4?=
 =?us-ascii?Q?NQMDO4GsOhl0/slMO+bNxnDvXpAnJwggTUkOPDyx/hhptTP2WUFkKrHC+THi?=
 =?us-ascii?Q?LdzvBXFBC4gogMeYRpTWZiEqJpoXIgr2fIKCaQmSAagByOFyNowCSNJtdahI?=
 =?us-ascii?Q?Dj/pDpurGXJ6b/Q+dw2kZ8frf7x7p3iYeTcNhAvYSzWSPCgyx3A1RHkWrZMp?=
 =?us-ascii?Q?sYJuL7fUZvBbjyFLFSyTPGFfyPPLw6+uEqItB7MK5ZUV6LiTY4B0SRSMgXBG?=
 =?us-ascii?Q?wivHDyzanqdCsQNlmjeiyflNaYYMEiE3Tc1GQdHNZ4FQFlYicuGpfeuGXc60?=
 =?us-ascii?Q?rdAbB4GI0g=3D=3D?=
X-Exchange-RoutingPolicyChecked: RqnlgxJaNTGoJ5OXazZpUn6onjUkZdDi3Ote7/gTQoAd+tXJlfBzrULkcZ8jUOBg+N7uT0bUA4WAlkPqHfYtrsF+kVffpMIo9/BpJITl57iaDK3StsqcpT7Mx1MXaB2SbjJzwHXI5asKkW/4Z+WfdApjfXenxP8Z8pdaV807ddWByrUtLwUAPzrbqKUDruLXYTcWi9bSgnMHQs+XEhwyTm6c/LlunR4N+LhFUJvN2jAy/SKSApCFO4Olscm7YBWWmtEFTzN+S4kqa6l8idrSXf+BfS9YN5gu50RIgzPlHV2SnadmN39Ljdd4y97dN74eL3tJ3/DF+8aSTexq4bt9EA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5d4237-9570-4cf7-ee36-08df339d2dc7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 20:10:28.5804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BAnWJws25AvU2uP7ON7mgDHNyGYH3MYq8rg/H5KBj16y6OFEc3BcW+4A/OvFkNDU8OKlI8XeOai82QM6kOxCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9619
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> Wa_14026539277 requires handling from both KMD and userspace (which
> includes IGT).  Do the required changes in IGT for Wa_14026539277.
>
> Since we need to check for Wa_14026539277 as early as during IGT's
> xe_device initialization (i.e. xe_device_get()), some preparatory
> steps are required before the changes specific to the workaround.
>
> So this series does that preliminary work with the initial set of
> patches and then adds the workaround implementation as the final
> patch.
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
> Changes in v3:
> - Add tweaks related to igt_warn_on() to avoid CI noise like
>   https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15892/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html .
> - Link to v2: https://patch.msgid.link/20260923-wa_14026539277-v2-0-528b575299d2@intel.com
>
> Changes in v2:
> - The approach remains basically the same, but there were some changes
>   on how the debugfs dumps are cached: now a new struct called
>   xe_wa_cache is used.
> - Besides that, feedback from v1 was incorportated. See the changelogs
>   in individual patches for details.
> - Link to v1: https://patch.msgid.link/20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com
>
> ---
> Gustavo Sousa (11):
>       lib/xe: Move lib/intel_wa to lib/xe/xe_wa
>       lib/xe: Make debugfs_file_has_wa() aware of the debugfs file layout
>       lib/xe: Gather workarounds debugfs dumps in a cache struct
>       lib/xe: Cache workaround information in xe_device
>       lib/xe: Return boolean from xe_wa()
>       lib/xe: Assert that cache is available for xe_wa()
>       tests/intel/xe_pat: Adapt pat_entry_is_wb() to Xe3p
>       lib/xe: Add xe_wa_from_cache()
>       lib/intel_pat: Encapsulate management of xe_device's pat_cache
>       lib/intel_pat: Pass xe_device to xe_get_pat_config()
>       intel: Implement Wa_14026539277
>
>  lib/intel_pat.c       |  43 +++++++--
>  lib/intel_pat.h       |   5 ++
>  lib/intel_wa.c        |  66 --------------
>  lib/intel_wa.h        |  11 ---
>  lib/meson.build       |   2 +-
>  lib/tests/meson.build |   1 +
>  lib/tests/xe_wa.c     |  42 +++++++++
>  lib/tests/xe_wa.h     |  12 +++
>  lib/xe/xe_query.c     |  15 ++--
>  lib/xe/xe_query.h     |  10 ++-
>  lib/xe/xe_wa.c        | 240 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_wa.h        |  19 ++++
>  tests/intel/xe_oa.c   |   4 +-
>  tests/intel/xe_pat.c  |  35 ++++++--
>  14 files changed, 403 insertions(+), 102 deletions(-)
> ---
> base-commit: e40d80d42f9b8f1d22475b7f609252a34cd7355b
> change-id: 20260714-wa_14026539277-c79e97449287

Pushed.  Thanks Matt Atwood and Matt Roper for the reviews!

--
Gustavo Sousa
