Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD826CA5FED
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 10:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6257610F285;
	Tue,  6 Oct 2026 10:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5bO1yks";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC6810E29A
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 10:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791280993; x=1822816993;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=5gZXCx3A/kLpyBl29poD7N7mQvsvTr+zxs8yIZeUQI0=;
 b=m5bO1yksa5oFb+i+IretLVlKDzAvswF32YF01OglLjBqwCzLZY+nRjcB
 gACVR9rzdbzM80gGjJ5us/J6LmfpBpV079e42VYAYIEaTT0bXIsBW8DJe
 ERAL2j1dxQD9PTGuncII6FxkP6ouVaOAUuuty1G4QLYpumPJcHays/2l1
 0yGvHYJbkFdMwCb0IFBPyO/X4tD5axdOrkn6T+K+hvyU8xcV9xwRvXTaG
 zM2VCUFpmKTBFsldG1CCFO38gdgdCIC31mBUojuMzKkjxgjk23gSkgYut
 5olAz64o+48RjdOpNnx+d3lfUrnJdH2GqqL2AOgD2QQV+13MxJzXtSS0X A==;
X-CSE-ConnectionGUID: 4Mp6AU7BS0yBAGQOAVG0OA==
X-CSE-MsgGUID: bPQtv885S3+XClCS58mAsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="108339299"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
 d="scan'208,217";a="108339299"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 03:03:11 -0700
X-CSE-ConnectionGUID: 86uJbP9LQIKFmaZruc8CNA==
X-CSE-MsgGUID: DfA8qFA/RHSDKgOs8d4IBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
 d="scan'208,217";a="280355433"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 03:03:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 03:03:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 03:03:10 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 03:03:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9GYdwnr3TK+XKh2WIOwLd0eoTmkb8eQNnAyEEif/ahiH6JLwlDRj5qmA7x6rG5mBDcKcyrIOet+izK97yNSQW8gYP0UBUBinKqDPyIy8Ei5TqndNUBS2VK12L40rtatjG2BH8PAoHRvQZEORbgTnvkSqaLEfUU2sI3bjQ+Yr8aVkeXd/E2LMwi31k658LIpDW7QQRCuQj6BI13RZXngG/RCkno/knh8jKn7RviIsKpCt+/SvNJUvdNRjAHaAJv2zOhkAvkgNAse6vzlBQaDQwiLQo44XiBtR7icrpkkN06y/9HmIxJNiUpJJU5XbfyMu8Rju3e8hrZvWPjc5rYxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1to7hqC2ntmcJSXiz1VGnftwruvjVchv7SobYEf+rU=;
 b=WOv3cqN/xU6BR87ulNGvdzprYiGnF5TAvmjWQFER7TnKQaic9qxb2QmVkpUT8eBNJGwpEkyc6iuwfAM6uTylCmGeGThbTCvaCvVxvT/SeI9LVQRXoTbEUnND5EM7tBr18cQS98t9058/3pN7Bcp0pW2qUO6W3yBv4Ye/KOsaf+nwlESBHvg5LlMes77lChGFg7MaJHb6E7aZtpeoydTn/vVUddqLA97Qic5loNeg4fHTDqjslyYck2elD8kktjJJsJzcRP4kc2bS+RF4R0tVXvZPWqbEd/RUArun6ehkAEvRIQFrhi8FB6Jy4QZm39YfJHnCwhtgmfXGn+AkfC/omA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA3PPF8627DB357.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::c9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 10:03:08 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0472.015; Tue, 6 Oct 2026
 10:03:08 +0000
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Patil, Shivtej Eknath"
 <shivtej.eknath.patil@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>, "Balasubramanyam, Smitha"
 <smitha.balasubramanyam@intel.com>, "Ramadeva, Dwarakanath"
 <dwarakanath.ramadeva@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH v8 2/3] tests/intel/xe_pm: add coverage for xe_device_sysfs
Thread-Topic: [PATCH v8 2/3] tests/intel/xe_pm: add coverage for
 xe_device_sysfs
Thread-Index: AQHdUWpP6bEVK0qUT0aKcCTq0RGbVrbohzIAgAfIKG4=
Date: Tue, 6 Oct 2026 10:03:08 +0000
Message-ID: <CH0PR11MB5249CE0D8F980246C56ECBA6E5952@CH0PR11MB5249.namprd11.prod.outlook.com>
References: <20261001055902.5430-1-shivtej.eknath.patil@intel.com>
 <20261001055902.5430-3-shivtej.eknath.patil@intel.com>
 <20261001110714.3prjjfvzgsu4nyr2@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20261001110714.3prjjfvzgsu4nyr2@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5249:EE_|IA3PPF8627DB357:EE_
x-ms-office365-filtering-correlation-id: 2e1dec80-1143-4e63-a9ff-08df23910595
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|38070700021|4143699003|56012099006|6133799003|10067099003|5023799004|8096899003|11063799006;
x-microsoft-antispam-message-info: rvCrjnOkn3Sv8PvoKJT8FPOQfZ5Uzfx805CPj4z2xXHPrLl4F4xRA+3wkUB3wo97F17EDvV2Bj7vpX6/fs0/EJcN3UoKdjMKGdy1++xoxBP9BoDSuRMRWxlpAnjT7j/8ZW34u+vuVhkt1KGgwtUlKcwefIsHm0z5CrpkcRzfpLNbV9/UfoSlS1MJbxdw+yk/Jmd4cskxQEBHaxQDP2M1//S5RVm40kJKfcz7iEULaOzZGtfFEbH6Nki+iHDHCM6hdJ6H9i8TuI3gh4DadTDfbmE0I62lvUQc4E0MH6iK+zLKydkLRqpmj7Ggmcw6gb4A6KSQXZ4tVJ6Db2bkZPxzAQ8crFA+g8jvb1mjsZ6DOhgi8sJzFPzuy2z3XeNYQ1QE3ddIwlS5nAOaDKP1zLLqIzsVSm8pMeGLPTk5n554Pt9H07/hThc9t42IdUKbDsm9T6z/t4XalpXxhTnzlyoE6KWaHqIkfVdjmEJLIACafzLVDDgWe4UrYNsEo17pP7yNZziYkPWZJXJ7m7anzsoYjyZK5Nv7zaISHVyK++ZwBAJd/c8OIb8ZttaHZ6iBv+AKoC6WFpPG0wQasEocdYjHvb10+w3eWmOT/FAXyKTGYkdYwdiWTqdYe0eXoAO/Up+2gx2PPBlVyioi4Qp+QTZpIpk8wdrXZ+xpCWQpXMaIQ+0iFAz8NBvgloiViqwLwJBjjdp6tOZ8stzHVxUqPIcuwatfT5rFD9knMvWcl0es9Ic=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(38070700021)(4143699003)(56012099006)(6133799003)(10067099003)(5023799004)(8096899003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oqhggOQ7jmJ720cGYDuMjfolNFoxiJc8bUKpsZQst7eXyeQuwEryfLGqQl?=
 =?iso-8859-1?Q?4BtaMrAepOlciKb0vSPcJBncrRUVDAVlfgphMfc3NgVKZglZx5m49XaivG?=
 =?iso-8859-1?Q?gFyF3b4TzV+YLEt/MflJyb22tntVRqrJ2Nwihlw297ijqp7u6507+veP2D?=
 =?iso-8859-1?Q?4fAIi37+RqOA3TJ8aWVsZ88gqLNZy04+Fnat97IPBNenODNWDH9nnTkK7b?=
 =?iso-8859-1?Q?UJBu6+mOqiYa7keqth86M2zv5lC0nw6RjtSlf7a/c7oCUVnYR+777y285v?=
 =?iso-8859-1?Q?BVPZHU6DG7WYz9B1Vwv2mCGQY4Nb9uLO6zEHL4Cl1rssqH3K6eU+IndqpL?=
 =?iso-8859-1?Q?lX113Dd/39vbQAT5Ac7mK5sAL7f+pAtHI5NJu9UG8bKlKmQmW6kZEvOYL5?=
 =?iso-8859-1?Q?SXN5vx6TfhxNzW8nwNB8aiToJ4VYJNhypaz7DHnd2vKEbIFBMlUQwjVRV7?=
 =?iso-8859-1?Q?Ag+Ta6udAEbm2fdo2PljQUFqYUSFW9JwHHh3KntH1rdu8qyW5Cj46sZHXJ?=
 =?iso-8859-1?Q?DknVO1ODhP34W+zI0WDlMOFc2Ght+QRrD7ZbDBf4h+8mtMIM6WdcsV1FzN?=
 =?iso-8859-1?Q?87Hx408tQFF07Gkux8hAAtAlSdVcNZxURpgZy2bvReXpV6pFG82QrDvSlH?=
 =?iso-8859-1?Q?fafMSUixrUczkk3qTN3b+DhtwtXEzDsPXzP3S76JC5UAWkGA/rg8laj38k?=
 =?iso-8859-1?Q?Fx8NV5i1BPU15SAG131NJ0u9FdmpSNLRKCA/pzjEaNdy61YogUCAbJsIpV?=
 =?iso-8859-1?Q?/DMQ8I/SUfwR2caZJj58/W1ZmcoFu4WVlN6ILCevQqSyCweWzZUPccQMz3?=
 =?iso-8859-1?Q?71zRabJ94jCAK33zxGIXsOwPIyRomhu6BeNb1+39D6yl7x2JLzztyGpUrX?=
 =?iso-8859-1?Q?W/PFG42FmnMdIrOe8XZYzOMHi+QtPvC/K+LDgrhpMzvhDRcUyYRKtVUWaC?=
 =?iso-8859-1?Q?Bdj5sxRan5+KHoHY9yJHJlBXAfLT1SVBzuEJa7gpzcA1nI2QuyAnVP22xx?=
 =?iso-8859-1?Q?6ZuLZ8fCsyGlB+BZrIvk8OJPGsesOWeIr/E4A+pOh3t/TqdWYcBBVu3UoV?=
 =?iso-8859-1?Q?yY1NTgxX9PEpIWV42/uz70Q/dh5oO6TWx/LM73TZVoWVy5CZKjjOYMd9aq?=
 =?iso-8859-1?Q?wd73LyNIwtAEdPqOgG6gdNC5VbakiULM/pctdUsX7owABs4UC7fw1nBqTf?=
 =?iso-8859-1?Q?W+CV7CU39MQ70X0RYFu2dRUZNFwmzB42kVh+ed9ScpDj8qxmQPIy1D7Afg?=
 =?iso-8859-1?Q?+ZXtgXvlKHmykMvGNxPZUUw6SbIUn08LOaSK2+0fXBIIQHSF/LwDIKqYNz?=
 =?iso-8859-1?Q?AbFTGCKTXWcgH6KgRzJOtyXEqbSNWjyEqil+LxWn+mwDptmhh5a2nt9+2l?=
 =?iso-8859-1?Q?KuxFqoIdaQ3XOcRReTrL0GlL9raEtKWJ7fuQHP5vwdvvjuTKruxQYpqxm5?=
 =?iso-8859-1?Q?ALD6F37v1EisVO3yRIYMU5WIhQ0StJ8/63onzMcfr8HjSJZSUPJZYtNFKO?=
 =?iso-8859-1?Q?clS+lq+atAiF37JBu7I/RJLoxaqP2I6hee/WXIeC/FliPD6jf71+7YsvdU?=
 =?iso-8859-1?Q?71N3TQYWv/xHApNP+HGwSBCpaGn562kkND+YDTxmpMJdGewUT69J9eSiYS?=
 =?iso-8859-1?Q?ivbOLfLuR5UluLyOTdWHZf7jcK3/T6uBAW28bvNd8l3BVae8ZnWhUzKwqD?=
 =?iso-8859-1?Q?33YpySLKQ0KqkpbSRiP0R/FF9ys5rkKdMLN7BuwuPG91FLfxfCBMD6gNA/?=
 =?iso-8859-1?Q?Wd8qlgmvTIiDW6ZGg8gdbeValjN7+9JYlH0HQQ+wNzFVpP0zHwJYUpwpi7?=
 =?iso-8859-1?Q?Kh8RvXVCVg=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB5249CE0D8F980246C56ECBA6E5952CH0PR11MB5249namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VkQOpfMi24pL5e6Q1gIWDfKyjcPIi4g6jlvl3/hW14wp6fsNyI4v4W1q0FU1xLZQjtVMAd8CZtbBbf/Epoh+Q8E/72gE8PekpHsVV5IrHc27BThQ3TErXz9Aaxb/QynaD1ycmtO+D5tFgvd06x9Cdfh+eHLLAPc8CXexw/566eNScHHm4v3v0XUEi0d5BkrNSB+lT6fHkhs95I5c7y4KtfDEn/Y5x2ft96+yaN/nkyMHO7Aq2uCTZSrpI1OUBSfqO8cIQq7oTVKAkJSovgJdq9aZ3Jto4SeyclNgpce+cM77kO226ilK6CD7cl90WnyNdJjDe1HCV0uPbjtHeUXmwg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1dec80-1143-4e63-a9ff-08df23910595
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2026 10:03:08.0778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ds7kt7nDjUAe8R4Zpm0LU04qTIbjRgw+l3QjS5ZN0oCv9UF6AeTn1+70vess6JkMl3F2jNfT3YuOoEbXzRknZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPF8627DB357
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

--_000_CH0PR11MB5249CE0D8F980246C56ECBA6E5952CH0PR11MB5249namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> on behalf of Kamil Ko=
nieczny <kamil.konieczny@linux.intel.com>
Sent: Thursday, October 01, 2026 4:37 PM
To: Patil, Shivtej Eknath <shivtej.eknath.patil@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Konieczn=
y, Kamil <kamil.konieczny@intel.com>; Sharma, Nishit <nishit.sharma@intel.c=
om>; Balasubramanyam, Smitha <smitha.balasubramanyam@intel.com>
Subject: Re: [PATCH v8 2/3] tests/intel/xe_pm: add coverage for xe_device_s=
ysfs

Hi,
On 2026-10-01 at 05:59:01 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
>
> Add new subtests to exercise the following
> xe_device_sysfs.c functions:
>
> - vram_d3cold_threshold_show()
> - vram_d3cold_threshold_store()
> - lb_fan_control_version_show()
> - lb_voltage_regulator_version_show()
> - auto_link_downgrade_capable_show()
> - auto_link_downgrade_status_show()
>
> The subtests validate the corresponding sysfs
> attributes and improve code coverage.
>
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Hi kamil,

I think these tests in this patch, need not be part of xe_pm test and these=
 are not exercising any PM related functionality.
It is only verifying on the existence of the sysfs nodes !
For vram-d3cold-threshold-store test, already existing test vram-d3cold-thr=
eshold does that.

-Karthik.

Regards,
Kamil

> ---
>  tests/intel/xe_pm.c | 176 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 145 insertions(+), 31 deletions(-)
>
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 543f46f5b..9a70b1645 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -111,34 +111,9 @@ static bool runtime_usage_available(struct pci_devic=
e *pci)
>        return access(name, F_OK) =3D=3D 0;
>  }
>
> -static uint64_t get_vram_d3cold_threshold(int sysfs)
> +static bool sysfs_exists(int sysfs_fd, const char *path)
>  {
> -     uint64_t threshold;
> -     char path[64];
> -     int ret;
> -
> -     sprintf(path, "device/vram_d3cold_threshold");
> -     igt_require_f(!faccessat(sysfs, path, R_OK, 0), "vram_d3cold_thresh=
old is not present\n");
> -
> -     ret =3D igt_sysfs_scanf(sysfs, path, "%"PRIu64"", &threshold);
> -     igt_assert_lt(0, ret);
> -
> -     return threshold;
> -}
> -
> -static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
> -{
> -     char path[64];
> -     int ret;
> -
> -     sprintf(path, "device/vram_d3cold_threshold");
> -
> -     if (!faccessat(sysfs, path, R_OK | W_OK, 0))
> -             ret =3D igt_sysfs_printf(sysfs, path, "%"PRIu64"", threshol=
d);
> -     else
> -             igt_warn("vram_d3cold_threshold is not present\n");
> -
> -     igt_assert_lt(0, ret);
> +     return !faccessat(sysfs_fd, path, R_OK, 0);
>  }
>
>  static void vram_d3cold_threshold_restore(int sig)
> @@ -148,7 +123,7 @@ static void vram_d3cold_threshold_restore(int sig)
>        fd =3D drm_open_driver_master(DRIVER_XE);
>        sysfs_fd =3D igt_sysfs_open(fd);
>
> -     set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
> +     igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
>
>        close(sysfs_fd);
>        close(fd);
> @@ -620,6 +595,48 @@ test_exec(device_t device, int n_exec_queues, int n_=
execs,
>        active_threads =3D 0;
>  }
>
> +/**
> + * SUBTEST: vram-d3cold-threshold-show
> + * Description:
> + *      Validate reading of vram_d3cold_threshold sysfs entry.
> + * Functionality: pm-d3cold
> + */
> +
> +/**
> + * SUBTEST: vram-d3cold-threshold-store
> + * Description:
> + *      Validate writing and reading back vram_d3cold_threshold sysfs en=
try.
> + * Functionality: pm-d3cold
> + */
> +
> +/**
> + * SUBTEST: lb-fan-control-version-show
> + * Description:
> + *      Validate reading lb_fan_control_version sysfs entry.
> + * Functionality: pm-sysfs
> + */
> +
> +/**
> + * SUBTEST: lb-voltage-regulator-version-show
> + * Description:
> + *      Validate reading lb_voltage_regulator_version sysfs entry.
> + * Functionality: pm-sysfs
> + */
> +
> +/**
> + * SUBTEST: auto-link-downgrade-capable-show
> + * Description:
> + *      Validate reading auto_link_downgrade_capable sysfs entry.
> + * Functionality: pm-sysfs
> + */
> +
> +/**
> + * SUBTEST: auto-link-downgrade-status-show
> + * Description:
> + *      Validate reading auto_link_downgrade_status sysfs entry.
> + * Functionality: pm-sysfs
> + */
> +
>  /**
>   * SUBTEST: vram-d3cold-threshold
>   * Functionality: pm - d3cold
> @@ -670,7 +687,7 @@ static void test_vram_d3cold_threshold(device_t devic=
e, int sysfs_fd)
>        map =3D xe_bo_map(device.fd_xe, bo, SIZE);
>        memset(map, 0, SIZE);
>        munmap(map, SIZE);
> -     set_vram_d3cold_threshold(sysfs_fd, threshold);
> +     igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, threshold);
>
>        /* Setup D3Cold but card should be in D3hot */
>        igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
> @@ -1082,7 +1099,7 @@ int igt_main()
>                }
>
>                igt_describe_f("Validate mmap memory mappings with vram re=
gion,"
> -                          "when device along with parent bridge in %s", =
d->name);
> +                            "when device along with parent bridge in %s"=
, d->name);
>                igt_subtest_f("%s-mmap-vram", d->name) {
>                        int delay_ms;
>
> @@ -1116,11 +1133,108 @@ int igt_main()
>                     "if vram used > vram threshold");
>        igt_subtest("vram-d3cold-threshold") {
>                igt_require_f(has_runtime_pm, "Runtime PM not available\n"=
);
> -             orig_threshold =3D get_vram_d3cold_threshold(sysfs_fd);
> +             orig_threshold =3D igt_sysfs_get_vram_d3cold_threshold(sysf=
s_fd);
>                igt_install_exit_handler(vram_d3cold_threshold_restore);
>                test_vram_d3cold_threshold(device, sysfs_fd);
>        }
>
> +     igt_subtest("vram-d3cold-threshold-show") {
> +             uint64_t threshold;
> +
> +             igt_require(sysfs_exists(sysfs_fd,
> +                                      "device/vram_d3cold_threshold"));
> +
> +             threshold =3D igt_sysfs_get_vram_d3cold_threshold(sysfs_fd)=
;
> +
> +             igt_info("threshold=3D%" PRIu64 "\n", threshold);
> +     }
> +
> +     igt_subtest("vram-d3cold-threshold-store") {
> +             uint64_t old_val;
> +             uint64_t new_val;
> +
> +             igt_require(sysfs_exists(sysfs_fd,
> +                                      "device/vram_d3cold_threshold"));
> +             old_val =3D igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
> +             /*
> +              * Ensure the original threshold is restored even if
> +              * an assertion fails later in the test.
> +              */
> +             orig_threshold =3D old_val;
> +             igt_install_exit_handler(vram_d3cold_threshold_restore);
> +             igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val + 1);
> +             new_val =3D igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
> +             igt_assert_eq(new_val, old_val + 1);
> +             /* restore */
> +             igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val);
> +             igt_info("old=3D%" PRIu64 " new=3D%" PRIu64 "\n",
> +                      old_val, new_val);
> +     }
> +
> +     igt_subtest("lb-fan-control-version-show") {
> +             char version[64];
> +             int ret;
> +
> +             igt_require(sysfs_exists(sysfs_fd,
> +                                      "device/lb_fan_control_version"));
> +
> +             ret =3D igt_sysfs_scanf(sysfs_fd,
> +                                   "device/lb_fan_control_version",
> +                                   "%63s", version);
> +
> +             igt_assert(ret > 0);
> +
> +             igt_info("lb-fan-control-version=3D%s\n", version);
> +     }
> +
> +     igt_subtest("lb-voltage-regulator-version-show") {
> +             char version[64] =3D {};
> +             int ret;
> +
> +             igt_require(sysfs_exists(sysfs_fd,
> +                                      "device/lb_voltage_regulator_versi=
on"));
> +
> +             ret =3D igt_sysfs_scanf(sysfs_fd,
> +                                   "device/lb_voltage_regulator_version"=
,
> +                                   "%63s", version);
> +             igt_debug("ret=3D%d errno=3D%d\n", ret, errno);
> +
> +             igt_assert(ret > 0);
> +             igt_info("lb-voltage-regulator-version=3D%s\n", version);
> +     }
> +
> +     igt_subtest("auto-link-downgrade-capable-show") {
> +             int val;
> +             int ret;
> +
> +             igt_require(sysfs_exists(sysfs_fd,
> +                                      "device/auto_link_downgrade_capabl=
e"));
> +
> +             ret =3D igt_sysfs_scanf(sysfs_fd,
> +                                   "device/auto_link_downgrade_capable",
> +                                   "%d", &val);
> +
> +             igt_assert(ret > 0);
> +             igt_info("auto-link-downgrade-capable=3D%d\n", val);
> +             igt_assert(val =3D=3D 0 || val =3D=3D 1);
> +     }
> +
> +     igt_subtest("auto-link-downgrade-status-show") {
> +             int val;
> +             int ret;
> +
> +             igt_require(sysfs_exists(sysfs_fd,
> +                                      "device/auto_link_downgrade_status=
"));
> +
> +             ret =3D igt_sysfs_scanf(sysfs_fd,
> +                                   "device/auto_link_downgrade_status",
> +                                   "%d", &val);
> +
> +             igt_assert(ret > 0);
> +             igt_info("auto-link-downgrade-status=3D%d\n", val);
> +             igt_assert(val =3D=3D 0 || val =3D=3D 1);
> +     }
> +
>        igt_fixture() {
>                close(sysfs_fd);
>                igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_all=
owed);
> --
> 2.43.0
>

--_000_CH0PR11MB5249CE0D8F980246C56ECBA6E5952CH0PR11MB5249namp_
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
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> igt-dev &lt;igt-dev-bounces@lists.freedesktop.org&gt; on behal=
f of Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<br>
<b>Sent:</b> Thursday, October 01, 2026 4:37 PM<br>
<b>To:</b> Patil, Shivtej Eknath &lt;shivtej.eknath.patil@intel.com&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; Konieczny, Kamil &lt;kamil.konieczny@intel.com&gt;; Sharma, Nishit &lt=
;nishit.sharma@intel.com&gt;; Balasubramanyam, Smitha &lt;smitha.balasubram=
anyam@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH v8 2/3] tests/intel/xe_pm: add coverage for xe_d=
evice_sysfs
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">Hi,<br>
On 2026-10-01 at 05:59:01 +0000, shivtej.eknath.patil@intel.com wrote:<br>
&gt; From: Shivtej Patil &lt;shivtej.eknath.patil@intel.com&gt;<br>
&gt;<br>
&gt; Add new subtests to exercise the following<br>
&gt; xe_device_sysfs.c functions:<br>
&gt; &nbsp;<br>
&gt; - vram_d3cold_threshold_show()<br>
&gt; - vram_d3cold_threshold_store()<br>
&gt; - lb_fan_control_version_show()<br>
&gt; - lb_voltage_regulator_version_show()<br>
&gt; - auto_link_downgrade_capable_show()<br>
&gt; - auto_link_downgrade_status_show()<br>
&gt; &nbsp;<br>
&gt; The subtests validate the corresponding sysfs<br>
&gt; attributes and improve code coverage.<br>
&gt;<br>
&gt; Signed-off-by: Shivtej Patil &lt;shivtej.eknath.patil@intel.com&gt;<br=
>
LGTM<br>
Reviewed-by: Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;</div>
<div style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Hi kamil,&nbsp;</d=
iv>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I think these tests in this patch, need not be part of xe_pm test and these=
 are not exercising any PM related functionality.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
It is only verifying on the existence of the sysfs nodes !</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
For vram-d3cold-threshold-store test, already existing test vram-d3cold-thr=
eshold does that.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
-Karthik.<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; ---<br>
&gt;&nbsp; tests/intel/xe_pm.c | 176 ++++++++++++++++++++++++++++++++++++--=
------<br>
&gt;&nbsp; 1 file changed, 145 insertions(+), 31 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c<br>
&gt; index 543f46f5b..9a70b1645 100644<br>
&gt; --- a/tests/intel/xe_pm.c<br>
&gt; +++ b/tests/intel/xe_pm.c<br>
&gt; @@ -111,34 +111,9 @@ static bool runtime_usage_available(struct pci_de=
vice *pci)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return access(name, F_OK) =
=3D=3D 0;<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; -static uint64_t get_vram_d3cold_threshold(int sysfs)<br>
&gt; +static bool sysfs_exists(int sysfs_fd, const char *path)<br>
&gt;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; uint64_t threshold;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; char path[64];<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; sprintf(path, &quot;device/vram_d3cold_thres=
hold&quot;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_require_f(!faccessat(sysfs, path, R_OK, =
0), &quot;vram_d3cold_threshold is not present\n&quot;);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_sysfs_scanf(sysfs, path, &quot;%=
&quot;PRIu64&quot;&quot;, &amp;threshold);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_lt(0, ret);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; return threshold;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)<=
br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; char path[64];<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; sprintf(path, &quot;device/vram_d3cold_thres=
hold&quot;);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (!faccessat(sysfs, path, R_OK | W_OK, 0))=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_sysfs_printf(sysfs, path, &quot;%&quot;PRIu64&quot;&quot;, =
threshold);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_warn(&quot;vram_d3cold_threshold is not present\n&quot;);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_lt(0, ret);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return !faccessat(sysfs_fd, path, R_OK, 0);<=
br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp; static void vram_d3cold_threshold_restore(int sig)<br>
&gt; @@ -148,7 +123,7 @@ static void vram_d3cold_threshold_restore(int sig)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D drm_open_driver_maste=
r(DRIVER_XE);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysfs_fd =3D igt_sysfs_open(=
fd);<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; set_vram_d3cold_threshold(sysfs_fd, orig_thr=
eshold);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_sysfs_set_vram_d3cold_threshold(sysfs_fd=
, orig_threshold);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(sysfs_fd);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&gt; @@ -620,6 +595,48 @@ test_exec(device_t device, int n_exec_queues, int=
 n_execs,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active_threads =3D 0;<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +/**<br>
&gt; + * SUBTEST: vram-d3cold-threshold-show<br>
&gt; + * Description:<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Validate reading of vram_d3cold_thre=
shold sysfs entry.<br>
&gt; + * Functionality: pm-d3cold<br>
&gt; + */<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * SUBTEST: vram-d3cold-threshold-store<br>
&gt; + * Description:<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Validate writing and reading back vr=
am_d3cold_threshold sysfs entry.<br>
&gt; + * Functionality: pm-d3cold<br>
&gt; + */<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * SUBTEST: lb-fan-control-version-show<br>
&gt; + * Description:<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Validate reading lb_fan_control_vers=
ion sysfs entry.<br>
&gt; + * Functionality: pm-sysfs<br>
&gt; + */<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * SUBTEST: lb-voltage-regulator-version-show<br>
&gt; + * Description:<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Validate reading lb_voltage_regulato=
r_version sysfs entry.<br>
&gt; + * Functionality: pm-sysfs<br>
&gt; + */<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * SUBTEST: auto-link-downgrade-capable-show<br>
&gt; + * Description:<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Validate reading auto_link_downgrade=
_capable sysfs entry.<br>
&gt; + * Functionality: pm-sysfs<br>
&gt; + */<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * SUBTEST: auto-link-downgrade-status-show<br>
&gt; + * Description:<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Validate reading auto_link_downgrade=
_status sysfs entry.<br>
&gt; + * Functionality: pm-sysfs<br>
&gt; + */<br>
&gt; +<br>
&gt;&nbsp; /**<br>
&gt;&nbsp;&nbsp; * SUBTEST: vram-d3cold-threshold<br>
&gt;&nbsp;&nbsp; * Functionality: pm - d3cold<br>
&gt; @@ -670,7 +687,7 @@ static void test_vram_d3cold_threshold(device_t de=
vice, int sysfs_fd)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map =3D xe_bo_map(device.fd_=
xe, bo, SIZE);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(map, 0, SIZE);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; munmap(map, SIZE);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; set_vram_d3cold_threshold(sysfs_fd, threshol=
d);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_sysfs_set_vram_d3cold_threshold(sysfs_fd=
, threshold);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Setup D3Cold but card sho=
uld be in D3hot */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(setup_d3(device, =
IGT_ACPI_D3Cold));<br>
&gt; @@ -1082,7 +1099,7 @@ int igt_main()<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_describe_f(&quot;Validate mmap memory mappings with=
 vram region,&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;when device along with parent bridge in %s&quot;, d-&gt;name);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &quot;when device along with parent bridge in %s&quot;, =
d-&gt;name);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_subtest_f(&quot;%s-mmap-vram&quot;, d-&gt;name) {<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int del=
ay_ms;<br>
&gt;&nbsp;<br>
&gt; @@ -1116,11 +1133,108 @@ int igt_main()<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;if vram used &gt; v=
ram threshold&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;vram-d3col=
d-threshold&quot;) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_require_f(has_runtime_pm, &quot;Runtime PM not avai=
lable\n&quot;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; orig_threshold =3D get_vram_d3cold_threshold(sysfs_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; orig_threshold =3D igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_install_exit_handler(vram_d3cold_threshold_restore)=
;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; test_vram_d3cold_threshold(device, sysfs_fd);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;vram-d3cold-threshold-show=
&quot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint64_t threshold;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(sysfs_exists(sysfs_fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;device/vram_d3cold_threshold&quot;));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; threshold =3D igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;threshold=3D%&quot; PRIu64 &quot;\n&quot;, threshold);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;vram-d3cold-threshold-stor=
e&quot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint64_t old_val;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint64_t new_val;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(sysfs_exists(sysfs_fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;device/vram_d3cold_threshold&quot;));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; old_val =3D igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * Ensure the original threshold is restored even if<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * an assertion fails later in the test.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; orig_threshold =3D old_val;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_install_exit_handler(vram_d3cold_threshold_restore);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val + 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; new_val =3D igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(new_val, old_val + 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* restore */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;old=3D%&quot; PRIu64 &quot; new=3D%&quot; PRIu64 &quot;\=
n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_val, new_val)=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;lb-fan-control-version-sho=
w&quot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char version[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(sysfs_exists(sysfs_fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;device/lb_fan_control_version&quot;));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_sysfs_scanf(sysfs_fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;device/l=
b_fan_control_version&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%63s&quo=
t;, version);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(ret &gt; 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;lb-fan-control-version=3D%s\n&quot;, version);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;lb-voltage-regulator-versi=
on-show&quot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char version[64] =3D {};<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(sysfs_exists(sysfs_fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;device/lb_voltage_regulator_version&quot;));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_sysfs_scanf(sysfs_fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;device/l=
b_voltage_regulator_version&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%63s&quo=
t;, version);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_debug(&quot;ret=3D%d errno=3D%d\n&quot;, ret, errno);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(ret &gt; 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;lb-voltage-regulator-version=3D%s\n&quot;, version);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;auto-link-downgrade-capabl=
e-show&quot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int val;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(sysfs_exists(sysfs_fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;device/auto_link_downgrade_capable&quot;));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_sysfs_scanf(sysfs_fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;device/a=
uto_link_downgrade_capable&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%d&quot;=
, &amp;val);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(ret &gt; 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;auto-link-downgrade-capable=3D%d\n&quot;, val);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(val =3D=3D 0 || val =3D=3D 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;auto-link-downgrade-status=
-show&quot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int val;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(sysfs_exists(sysfs_fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;device/auto_link_downgrade_status&quot;));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_sysfs_scanf(sysfs_fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;device/a=
uto_link_downgrade_status&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%d&quot;=
, &amp;val);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(ret &gt; 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;auto-link-downgrade-status=3D%d\n&quot;, val);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(val =3D=3D 0 || val =3D=3D 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; close(sysfs_fd);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_=
allowed);<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</div>
</body>
</html>

--_000_CH0PR11MB5249CE0D8F980246C56ECBA6E5952CH0PR11MB5249namp_--
