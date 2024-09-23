Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD67CF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 21:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB6510E49A;
	Mon, 23 Sep 2024 21:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSg0PHdB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705C510E49A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 21:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727125288; x=1758661288;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wELK6VuU4E5CQchd7l6s6Ni/mWiITinElr5D0O7X+VE=;
 b=LSg0PHdBgFuvf/34tkoz2HJeBzRkV1K5t4M7aMElLN9vca62djA2T8q9
 OJvFRfYqclHKGv95FG2QY7ZWN6ljyKIknO3mdVuvEIpinYCBPqwyqEAXs
 t0Al8Ui7KyW8XxlqD3LQUopEM7+XMXtFD+XG8a/Fymb3cV/ZGofNYbTUM
 RW2GlCPpXZPbkkODMBTihsz1AKfvXjwMvTS4bR7F3JYYLcsEfwKnUDXHz
 SAREl0ggLuMhLfpl0rmc/XQfMy7mY5TdrMd/yt3YO2tHCSqtIyZ6EBXdX
 Jntu145xLZRvicLbqucWjlt/hUV0dq54xRbu1W9B9aLWQYG0CkjRStGwz w==;
X-CSE-ConnectionGUID: y6bdmfuYTFqa1AwdEU3yGA==
X-CSE-MsgGUID: vmllR+BTT66FEBATRwK2Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26285441"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="26285441"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 14:01:28 -0700
X-CSE-ConnectionGUID: +NuhK98YTFi52fWOwYYEOg==
X-CSE-MsgGUID: w845EFsyQyyDYkNlIRP7Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71631026"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 14:01:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 14:01:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 14:01:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 14:01:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 14:01:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOQGSeyUyN8G4PU41XvJWuRstGF/2ftf79V6Cz1OT8Fb7yWG/LgEDealML42/NSgLcnI2D4zlrpurlGiH8jOI34jMjT1fFcZGqcykyR/4oW3wedF7F9Ix/icklYj9mHpA26Zt2nQoKprs9NQrPjoQJjBoqohFSb4aVE/N3vQasegjfbo9NGaWFdjzPIomxfIff6iRdOHS6mQpwKZq3OAgG4LtEdeo4mPygclefw+I/8prSzvymb0Rg0fnud64VNlaKKH9jySj0lIemeliKX84jrPk/DLbM+CYnuPvpV+jAeLEci6l6uhzHxZVPtv3PPIUzAytkSM6ktJEfNn/zfPVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0lpD9/UEG8rwhp75i7IbFkOpPM8VFCgA9oxLi1karA=;
 b=lVkwAMUl+857Lt8KoJYZzcMsAb0jTUlKi433IQHCODT7OPufyKI7opYDWkLbShY6VnWp7b4WMIHv+H3SMk2BGvw2vjEfF9H+5U4g+Xn7zWPQS+1LskwomJz2re7P+rKG7i2MOe161TkryAZx+rEiSo/9aY+3vDV1QhMjKg0Dv01ix4MrZp5R8hW/YNKqNbgDJ/zLPo06+93h7lp3gE+bFoYyVP/1OsBOcm3QpaLmDMbmJcQN3BlnNDhkFRM+3CabLTsaPlznCMdMps7cG8OFnw4HsxqTIw4sWznEz9flKkgzDPQtGDdMsW20t+Qd7N5v1qUG7hEO5YQFU8smMYx4gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6339.namprd11.prod.outlook.com (2603:10b6:208:3b3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 21:01:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 21:01:23 +0000
Date: Mon, 23 Sep 2024 16:01:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/6] tests/kms_ccs: Use logical && instead of
 bitwise &
Message-ID: <qziedgc6uoxqm4px4jquizuouiznolm3udkbaj7n4mrxtagibe@5rvdyzyuiwwt>
References: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
 <20240923204557.32123-4-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923204557.32123-4-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: MW4P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: b6484e4a-f617-40f6-5395-08dcdc12e1df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?MB2BbyqDbiFPC/jqMsb1AdAE0Os4Dq1KtwPhH1ytURNky/tLkdLQSFAfZ+?=
 =?iso-8859-1?Q?/z1+T5lH5ayii2NMUFUAOtkNpLYVc0pFxjG5xR/HHfm92+CGwmw1nT13p7?=
 =?iso-8859-1?Q?XJvZfAtV+kUt+1siJPUwnsqeLZildPVJc7UBLC/Lfa38GiqbTL65HxD1YQ?=
 =?iso-8859-1?Q?mmEXoSrDKmeKCiH1XFY+OOx9XOiq6amD1UCSrTwjNOo+NBtkkKmeLx85y+?=
 =?iso-8859-1?Q?cXYV/IglQzxVz3rZ9zXIbpb7/wVr6oYidClYUrjrupWszYusCriZfoKLA0?=
 =?iso-8859-1?Q?8psjIz8XOihb+GAuWCCTx6v6R8w6nfcO2Vzgfdw5uit1heLtC8B7goIA6r?=
 =?iso-8859-1?Q?Evrc+q1Vma/o678gHl38BaR3o5lSyRAEkGpylz6UaAWjFKLkbwSRkl9aH9?=
 =?iso-8859-1?Q?3ULgnljrlsRc1WTr9O/JIYY998xOxh6UtCtH5U+7kWrsuyuhZs7MjQXarD?=
 =?iso-8859-1?Q?hYabyOWAKn4yzCMc/GSlh3e/Od+t6h9Aqz0dQDEyvAOzgMltAY6OisJgCw?=
 =?iso-8859-1?Q?vFK08jKUK9bNI912Sd4s0m4VKsTo4/HpkjkIGdj1S38wCC5PjkLLP4Eb2f?=
 =?iso-8859-1?Q?bzHWh9+jEd6OMUIEw+KUI41l154ualrzvbBRDUGIa9etpWCFS5SEYJDWQr?=
 =?iso-8859-1?Q?+sZtIDJvmU7orGOgeVCwcCCV6hFTRZnYO2eZgarPW+ZyQdhImrWbprXmDV?=
 =?iso-8859-1?Q?bmvvpUvtzAkwBWnY8fwG58PrxurcfK9AJ3Du7xjNqBlFvNoBAbONXK/sHa?=
 =?iso-8859-1?Q?J7Ix9o17R6kYPjTjql1vyWxL6RHKS7ibW9kk8uocOmZslJ7LTcwQ1f4yzB?=
 =?iso-8859-1?Q?Hm9g/rjOU/IstT6IBNj+DzSeZH7VDPkXEvPyTitBaURIa6HTmZz6aHN5+y?=
 =?iso-8859-1?Q?mF0vF3SXHdBoRvNMCFl+GV0wZETSSm7HMyMPkCDNLFC3FMSQT+yBD3GpUH?=
 =?iso-8859-1?Q?c3vViVb5kegG2q5ODkoUr2qwRzS+QaRr5oKab5aw3fiHQ96SbF9Yxst7YB?=
 =?iso-8859-1?Q?Qscu89ehZbeCG8up/XQ/aQp8Z/pELGdBgOhVizjmWwiw1DEiqqoEmXX0ac?=
 =?iso-8859-1?Q?653HSW7GKH9rUP1rh+88Zsc0ea1GirDbAD5CmbpLj4MaHAJ6m79/Fnt5TM?=
 =?iso-8859-1?Q?nCsndTe5MW18sky8OqOcUVZRUiCEQC658PtzumcuMfpVBTcW9fwvxNgp/c?=
 =?iso-8859-1?Q?yjmX9IJogfilMHSeE74XOKwIIPct5lMt4RnOymYIE1ZmQR2F52KQ0mmtK8?=
 =?iso-8859-1?Q?3SqcCP8Ox9dz41ba4F39yxrMvtTwhHp0VmrvKjKL5obT+NlhUaiPR30zGa?=
 =?iso-8859-1?Q?vxbSHAiNjMbW/Ktbk8jYyzo1FA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eqrHaMRpvVopy/TNzODdubunhnJyHc5Qt2aOtEGNek/42HjFlevD4OXI4Y?=
 =?iso-8859-1?Q?EVtCf6JkeKYRPMYLJi2964y98LdeTbJmIXStlo69sKgsApuJgLfq0RUPmy?=
 =?iso-8859-1?Q?/+podmCUjFSWwDtdubdmOPX9AVQyh2+MjC9TdwqhKRXooVNFgKpSWr0Hus?=
 =?iso-8859-1?Q?RFxj7QSIvY0ZwfMQtPOqdHBbMF8F9pPmDVI6tCIqO32250cJR3Sn/MNplF?=
 =?iso-8859-1?Q?cY998PgLJwivUCarRTkDKCDIYug7w8uMJpxDz3bC0Umc4260V/f82Z1ZdM?=
 =?iso-8859-1?Q?k/vbKCFTjoifOcKIJbKxGfg0/u2tQ0v9Dw/n0PNcddzgMpyEbmZ2GlijmZ?=
 =?iso-8859-1?Q?aI20YmMN1ER4z5mF2zhZpxzY+Fzt/cw9HfeUx0Fy9F1V1RvHHZeNitK2V8?=
 =?iso-8859-1?Q?FC7oBvT13BVlaEWOHrX9ThZvL1pB2kYVSQUPkCDIIDJPUbDpXsliGjP7nT?=
 =?iso-8859-1?Q?TSUG4ia8Izmp53iFmPK/slFgSRBiFzEAwaPL3x4vbRALj5Sn4DLwovzo/E?=
 =?iso-8859-1?Q?cKi/0dkaT5R4Jg4igKZ0aR4RZfkra+UFdb3R4Q0xDGKR+n6vDslJQPdTOP?=
 =?iso-8859-1?Q?dTm7qtf6zuiyMA3Eogn5EIScX6Uo6KbgH0fbanlbfx1c10YziR/tPhdJEt?=
 =?iso-8859-1?Q?wT+yzSeClEeamOLl5l2uYXcG7lkIsnFjvR+dVQQn10hPeiSbGAOhPyzaPy?=
 =?iso-8859-1?Q?EZaPOWwOJdI+NP/dP72n3ppzXpuYBGf5BP8b7uGNMFblSG/T8j+95Kzj+W?=
 =?iso-8859-1?Q?kHw1dXBGG1nlymr7rXmTJhLSqwCRUjR/ewk/gEQTw57cVTw0N4bU3VHyfJ?=
 =?iso-8859-1?Q?dYyUZAVcKJfopeUzy1D+mUBeFRr0nKBrggthKqfSopeo/UG3Zt3LwmkR97?=
 =?iso-8859-1?Q?o26yy5+0mq3WPm7BS0ytR0yB7oB29634uufSVCigL9ZF9XwSimqO/hrYEZ?=
 =?iso-8859-1?Q?5Lth/Q441tm7lABe8okuQLh7OLGcA9wOAN+6dgYtd4QjymGGVXGhIo4DXE?=
 =?iso-8859-1?Q?jS06iUkCQJr8PtnJ8kuubrf5i9I+IDjJqJ3N8avB671fSkg9uchws6Q6kq?=
 =?iso-8859-1?Q?f69TMoCvpx0JqH3xdy/FKUKeojRuVurzvXYtqEZOcO6WX3srBG51R+zScE?=
 =?iso-8859-1?Q?mzYzHbtL6Hl5pQFFnmvtDG9SW8wdT+LgSsXktM6/9cj0aec28d2UezSIWD?=
 =?iso-8859-1?Q?5SdZOOWcdtXzAkbNltUs2iInEEmiG6HKYriQ079XFqr0ealcNCjRDpqYgq?=
 =?iso-8859-1?Q?dyTYwi2/z7LhWBDtDL7pxYfClmw3ZCvlfJHkIMAZTh8VAGvgWWUq9SZv7p?=
 =?iso-8859-1?Q?KbfITWUGgfPdebRwjfu8otmGoxcxB5UBQS21TbA1aKnrMfwlfeH1DCuLgp?=
 =?iso-8859-1?Q?PIVWmKMgf80PrMDACmlItIwTABlz2oQhlUvCDNrUT+J44Ku0I4JzAjyPHo?=
 =?iso-8859-1?Q?iuziiYxUVy/QtG3CLfxBViyZ0CV18sX/j9KLJfhLZxodx6xEnV6Fl607F9?=
 =?iso-8859-1?Q?6CyGq3YOKMAXjq4yssTEoJ9Y+vTB714G/1Lh3tLWs6XMJwfNCt8qBnb9mo?=
 =?iso-8859-1?Q?7QWxMKUBRQx+9KLZirEbV2IVLgt0OQplLIIg+ozfjVwCjjcUjzhtdWfNjS?=
 =?iso-8859-1?Q?GkCmmv1FsAclWKFFZktis7cAAMXMTiwHL93X8yEY+akWi3FMibjzf9vA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6484e4a-f617-40f6-5395-08dcdc12e1df
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 21:01:23.9126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WYCigV6KMeRXJtak8hgsbm5UB+MN4LFamjrI2mOi1gyE0Fkpv9i1/omhQSCTo5ntA67vQnbs99zgRSXuWlzl76udpiiBEQtvm2rO69mKuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6339
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

On Mon, Sep 23, 2024 at 11:45:54PM GMT, Ville Syrjälä wrote:
>From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
>The code appears to want to use a logical AND instead
>of a bitwise AND. Make it so.
>
>Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>---
> tests/intel/kms_ccs.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
>index 835a3fe5aed2..8be8ac58e576 100644
>--- a/tests/intel/kms_ccs.c
>+++ b/tests/intel/kms_ccs.c
>@@ -394,8 +394,8 @@ static void access_flat_ccs_surface(struct igt_fb *fb, bool verify_compression)
> 	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
> 	uint8_t uc_mocs = intel_get_uc_mocs_index(fb->fd);
> 	uint8_t comp_pat_index = intel_get_pat_idx_wt(fb->fd);
>-	uint32_t region = (AT_LEAST_GEN(intel_get_drm_devid(fb->fd), 20) &
>-						xe_has_vram(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;
>+	uint32_t region = (AT_LEAST_GEN(intel_get_drm_devid(fb->fd), 20) &&
>+			   xe_has_vram(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;

nit: first parenthesis is also pointless and it'd read better without
breaking the line in the middle of the condition.

Anyway,


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
> 	struct drm_xe_engine_class_instance inst = {
> 		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
>-- 
>2.44.2
>
