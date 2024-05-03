Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75629C4345F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 13:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48FC10FC41;
	Fri,  3 May 2024 13:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFk1uJmv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188FB10EEA7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 13:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714743177; x=1746279177;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Xk9cPAkYw+JsYrqpIRNnpTxJVj6fVGu9T5K9UkFoiNI=;
 b=CFk1uJmv22GIRvGC4BeWmSmuhBBTnB/M4j/Jb3fUJGbaS+QrQismVUr7
 6N5b5i42jXauPfzscdKy36+63gr94YcbEpt4lqqf82dmtHdfbgG0/PpD4
 Jcw1h9KOGGujNMCu4RX8s8+FjRxqke9k3fGkAuuF/TCGU+dWT33UCT5iR
 QIzFwTjA+gEoeTtQ+S4VSPSD87xA7mGHxGJsz+qI1hpSHAXUXnAwZpPhz
 udSxl80Uildd3JeU3Eg74UQzZRXT4D1m1BDnpPxkIDmuOVOTAgqLgrDzD
 wAmkcTeYPB2PbqL4bOedrbOF2RVvOsgHog7GafoHkKR2omrceZ1JIYnuL w==;
X-CSE-ConnectionGUID: np82tha5RRCrCwAx4L/02A==
X-CSE-MsgGUID: 8cXRIrMxShurX/b5BjUhBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28081338"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="28081338"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:32:56 -0700
X-CSE-ConnectionGUID: q6yIleGJTq2L3uRLVFMpnQ==
X-CSE-MsgGUID: ZbrgjB0BSVyFg82wS1Nv/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="64902257"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 06:32:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 06:32:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 06:32:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 06:32:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 06:32:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWgJgFiZoq2pQAiP6/RE+oDCmqqp/DLedKLdHox85MMoiFLzVqssYxarynh7Ybj7Gihprg7yMNa9zQSRikF+pmBD1axwe54ZYYQKvFIqUkU2CS2b1xVqyPGktNi2F1+2jyF4RcRGEJbBLsRyxPvTM2XzQMFayaEaBApVJfxnX5RFvH7xyDDHhmBKRIbHnaw9cR9Sn/NtkBYTfJfW+jtWE0x4Mr1a5fBGNLbIk82QG/GgXzt71fLO8vMYRh1lbaDFV/hX5bt1Wpn9K1XlSLYHxa8/sFu2PCaJ//T5yNT4dsrbdVpub71bpGWNQQWPk6yLAyZ8Zv/j2Ltqm5kcQErRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwEe1Zl8gAynpTHtcCdGRromevrE+1f0M8Ssz0+giyY=;
 b=EF1l0JCnmQ6mtbtIcGm9/6hUeB91P60XKoyNh5jRQhXVuUKx1ynZGGvJE5i2IwmssaQbI3vj8ATi8TNn4ORn9p+UNetl5wMYkUz8KVwEOEmpNQnqzfxoihsqV0VXv1Pu0UjUBq0FO26832vC++PukGETeKdNjgfyoMUuTO7mizU8gMBqCpJ39r1IGCH4J+QBq1sgXolAxDNf68iPKBUSo9j+wBiHJcM7uyyzz2/KWTnkI8XlS42Ae5awRuCNUeL+9J0KQaDt/AHMEsZoC80bLj2k55mhOEii+Umf6jJekgL8sYklNjgCuKv2q5Av+qJOICk3LGzxgdXpSBznryfQYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5956.namprd11.prod.outlook.com (2603:10b6:208:387::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Fri, 3 May
 2024 13:32:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 13:32:52 +0000
Date: Fri, 3 May 2024 08:32:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.keonig@amd.com>, Rob Clark
 <robdclark@chromium.org>
Subject: Re: [PATCH i-g-t] lib/igt_drm_fdinfo: Handle amdgpu memory stats
Message-ID: <crxjiae2z6mwas6rxq7cwsekfw26llg5oqlk5motte6qt2kb33@6j6plap5mxu6>
References: <20240503123731.9509-1-tursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503123731.9509-1-tursulin@igalia.com>
X-ClientProxiedBy: MW4PR03CA0315.namprd03.prod.outlook.com
 (2603:10b6:303:dd::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e9a917-543c-418c-a6a2-08dc6b758852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NVL1QNU1ApDD54kJf0fFhvAcb8WS1WnGviAVqLAiprW7ZS7EKZxXUm/W0M?=
 =?iso-8859-1?Q?imiNvOU12t2RbeMsrP7DZXLMxw072MA2ZZ72wfVLiNVKo9gTg2MG206o3j?=
 =?iso-8859-1?Q?x5HgSQ0kLf+Rs4zE+5klxP2xsqwAhrJtrAksrN7ZM2h/vEweJYG+fF+hQ7?=
 =?iso-8859-1?Q?Lon9/IJ/2MlRXASIBQR5uEsxAtT9RmH6RVnAaMFnuzdCYUqocxd2EtpZrI?=
 =?iso-8859-1?Q?J7wg9BsdINfIlb8pYILBoWduofBhq7x9vcdg28rZKAwUBga1lQP3AC3zhJ?=
 =?iso-8859-1?Q?jVA5OSzC+rsDhMdhfCH3l9Xb82XVaP30KYOJfxzlnFHqlksuKuqGrRDyzn?=
 =?iso-8859-1?Q?5WyQNntw07kVO7QR0esd9IZQxNO09snKCiW97rtuwrj63J7S65u2NlzQxo?=
 =?iso-8859-1?Q?wKHUCK2Z2Y2fUa7BnrDIAkqXBgkByyzwCBg06J2cM+Ivm7LewkckOLO8et?=
 =?iso-8859-1?Q?TT/ZTJIYKsY7Iz887RMMXuiO8OL/wws1lmZgO0epSYICFNIfBqeXwPEiDV?=
 =?iso-8859-1?Q?5O82KNcpRl/eMgC8vCql78AnObWiuZEFzqhP2a+1al9Y0xVk6lK27n1dHc?=
 =?iso-8859-1?Q?zvXdVIhEf97VokA7Goe+gCeQ4XtcBmm/PgR/u8jYOTwkQMa1GkbxJ67BIt?=
 =?iso-8859-1?Q?XJyMKxR1B1T1BMWOu4FMTtCgQgoCJZFmbvPjjVpI0gZxa/X1MKhxaUgst1?=
 =?iso-8859-1?Q?2nYtFoDSRHTSp1nP6WKe3Jcv7LH7KrqoO8HIbVE+0vE38CsxR/D0GBttiV?=
 =?iso-8859-1?Q?ZiQZRiPF4xKO756bwvM3nKSUis+elockNJhKbQIenJhnSwOhqjgt5EcuHe?=
 =?iso-8859-1?Q?+2wSzFRkWqAJENXYwLdynn5XnA2cTsZs8bM6QdYb7/AxpqBy3SAHSPQtoR?=
 =?iso-8859-1?Q?LlPH+SP3z559Bzf/tq2bDc95OtbGtAI3kXM0cNUwMA103LvN/zrd2ZehEV?=
 =?iso-8859-1?Q?x+C9y/SIdKrV8ex81xx0koqu275FBeRUfCgNYFU1VAf16hQMwryz786SAn?=
 =?iso-8859-1?Q?0hV3X5zoA1zmtQCB8Yt7ISGy+o8z0IO8rw0qewCRJ3DnZ6gCj0CETexBiS?=
 =?iso-8859-1?Q?q8cvmrimzM6Ub3O7C8XkzJpKxe744Vi70lC3B3HheVkPX0gYllQRTNEh6M?=
 =?iso-8859-1?Q?zuyOCjL0IqRmJ6ldzLvXqKWIanxsonr7MmNgo4IpgT3jaYS/XCX3/MtgSX?=
 =?iso-8859-1?Q?b595wj3bWwerQI6A6vSL+hFR7EdeQJoe7pD890VaWBCHjx0t100w/P+x5K?=
 =?iso-8859-1?Q?PJiC9sQUvGf6KA43Qp9jr1RezpqtOVKtBbeM8F7gp9XpDqRAjTdOOiPS3U?=
 =?iso-8859-1?Q?FeswWOb5LeqNQe9OZ9fdiMF3bQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?e/tiWCdNxnIMy6nr46RklTROFFAfv0x68iS9F4P97m3rdMH+/xDAAgyR3u?=
 =?iso-8859-1?Q?aZ+aoZSXuVrYAq5jw5e5tmB6jntZPNzxYf7ZPlJyH5F96HIIWfN65mLsbx?=
 =?iso-8859-1?Q?VhqmhtFfd7rruEPGIeIvg2WmfPxoobAr0Rpc6d8HsKrg0Uck5IHNQShuAP?=
 =?iso-8859-1?Q?qca1u/ZviNeGbpB8wItE3VhzPw2/26Yl6M8v0QorPras0glMY0v5JHq0Yd?=
 =?iso-8859-1?Q?O5WO7Vs3VfJG1l6K3ZM/YxcsT7NetZtUa0VJuQgT83OTut0e7u1Vc9sES8?=
 =?iso-8859-1?Q?WOtslBNgJj8lWzJj5lNnbvQdR33gqWJFaVB7NKQ0ZvbafBlp235HD2hk6X?=
 =?iso-8859-1?Q?GWvyrnPkd9UKhdgxRe0UtIz24mXuNeWqrk/S8o5c+gtSW7UzGf3Yr8/u58?=
 =?iso-8859-1?Q?t7FTa8dZkSdC4mHzu8F4PbJSFKlgoU1wtNbo0Oo+nsrZ1IYzslAOx2kmhd?=
 =?iso-8859-1?Q?GwrEma+DMGrQwTg/i9PBeGaJat1XI/+F0FRyLkyuWkA6kvFpkYKw8O0LJL?=
 =?iso-8859-1?Q?sl2An7oAaz5S3KGOBHIEJBN8U0oq/Id347NFaJY0+KiksAStl7iWrfid5W?=
 =?iso-8859-1?Q?bDUiSfQXR1wXmuRc8k9YbwJhXU66Hv/uIlLpJthirlRGWhWNw4W68XsDMX?=
 =?iso-8859-1?Q?WFv/sUdW+jR0p45oqoDFhMrxn56Qw+PKypb/l7zOXfA728T7JhvGvnanAj?=
 =?iso-8859-1?Q?xv+G/n0O1h3RTh6dpOQtyYyflhamAxzEaudHpz0zuK/KQMfNtH8RMXaDm0?=
 =?iso-8859-1?Q?5Dq88n9YVlms9cRTeEfFq14Hin0UjIKCIJ6IowVoRDCB9BkdVavTLX0Ggf?=
 =?iso-8859-1?Q?hinddPiSD32auN/3VAeWohJ3UHAua6rXXjGiW6w/1naXvfrFrc/C8PYce9?=
 =?iso-8859-1?Q?HT48IMRkOR2ahz+9++ntz8GHuXNjyHEzR/OiPVk0iIVyaRXSltrTIEC9qH?=
 =?iso-8859-1?Q?3BFATUZsvrnoPo8s8bgQQM0GoDWzIbukKW91wiN9zon5wvOW+aIbiEVDNV?=
 =?iso-8859-1?Q?xO04SVbyJt1iK8De5NFtgv1YTgCgYf8wyXLc8Wk+VSiKoxbFBzLHv6JyRq?=
 =?iso-8859-1?Q?rnZOdEFDA7lHDiJHKKbEoDOQLywOhFolieFW0mnh/2DY8pruc4vCDmCWCx?=
 =?iso-8859-1?Q?OFFvIbU42z0xb3ITLdvgteMVwrJMR0WCO8C2PLeApdnJY+v90zVe3Rojvk?=
 =?iso-8859-1?Q?ECMxpbIH0aSaDKTxBee9hzVBl/YvUPfdgXwB/vCAaQzin7F224rJaNbbNb?=
 =?iso-8859-1?Q?HTRlauTJtlUmx6w25TOg07CC1lhuVzpYn94LrIjOwQVLSTJL0slkmkpX94?=
 =?iso-8859-1?Q?H3KYQiBkW01J654Le8oBXftGtYfjH80nUyxUa2oleflI59A+qZshQhS45V?=
 =?iso-8859-1?Q?MDSM6f8IxxTJKRwYiTA3jqcXHcKYYr/0uhixoQiydtqdrZbUwlH9pxMTwA?=
 =?iso-8859-1?Q?I5sp/7u4JXg3T9kjqec15o4rkDf3hBCNq97N6Wx8NQWX2RVD+kjuO8EKa9?=
 =?iso-8859-1?Q?bS9crMWh7j8FIkEZqXzDaDE2K5FAFwEAr0zi6kBpWDApG71hEwn5yC1tfX?=
 =?iso-8859-1?Q?SW+zt77VSPGuxcIWwWA4/65CmuWdgltAY8JWTRBxhLcaxWIUxXVTYlrFrX?=
 =?iso-8859-1?Q?/BDFkF6pbZknwMZO81CKnW63GFeYJDWs09/AB9NG88KoZ1W2t/18TzKg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e9a917-543c-418c-a6a2-08dc6b758852
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 13:32:52.3979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWygsmX937SliBmghABNLqBPJlr3mDrx1BHrCyb44e0l+rYXUGoGsYmaGHk2tfDQ/JE5B2prwdKsLm0rqW1JGQu3J/f3S8Cslig5H6bt69Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5956
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

On Fri, May 03, 2024 at 01:37:31PM GMT, Tvrtko Ursulin wrote:
>From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
>Code so far only handles the clients using the common DRM helper.
>
>Handle the amdgpu driver which uses a slightly different set of keys. More
>specifically, outputs drm-memory-<region> instead of drm-total-<region>.
>
>With this added gputop starts showing total memory usage for amdgpu.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Alex Deucher <alexander.deucher@amd.com>
>Cc: Christian König <christian.keonig@amd.com>
>Cc: Rob Clark <robdclark@chromium.org>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> lib/igt_drm_fdinfo.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index cab677df29a9..89992f1477ec 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -262,6 +262,10 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
> 			idx = parse_region(l, info, strlen("drm-total-"),
> 					   region_map, region_entries, &val);
> 			UPDATE_REGION(idx, total, val);
>+		} else if (!strncmp(l, "drm-memory-", 11)) {
>+			idx = parse_region(l, info, strlen("drm-memory-"),
>+					   region_map, region_entries, &val);
>+			UPDATE_REGION(idx, total, val);

are they the same thing? Should we clarify the doc that a driver can't
use both drm-memory- and drm-total-?

	- drm-memory-<region>: <uint> [KiB|MiB]                                         
											
	Each possible memory type which can be used to store buffer objects by the      
	GPU in question shall be given a stable and unique name to be returned as the   
	string here.  The name "memory" is reserved to refer to normal system memory.   
											
	Value shall reflect the amount of storage currently consumed by the buffer      
	objects belong to this client, in the respective memory region.                 
											
	Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'     
	indicating kibi- or mebi-bytes.                                                 

	- drm-total-<region>: <uint> [KiB|MiB]
									
	The total size of buffers that including shared and private memory.
                                                                    

If they are the same and the total field can just be re-used,


	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> 		} else if (!strncmp(l, "drm-shared-", 11)) {
> 			idx = parse_region(l, info, strlen("drm-shared-"),
> 					   region_map, region_entries, &val);
>-- 
>2.44.0
>
