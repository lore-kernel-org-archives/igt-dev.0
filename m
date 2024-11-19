Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B586D60D06
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 01:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3C510E1A6;
	Tue, 19 Nov 2024 01:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPsPz8MF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C5C10E1A6
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 01:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731979699; x=1763515699;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F8eKaS+EdatL2XEv1ZGHGXQt6NLdXR/MQ3bU3kdaVoE=;
 b=aPsPz8MFz11AvfmN4NshCgKZmp9sxKhS0R3fEqyJ1S5sOB7y4XCN5TZ2
 6hUM9HstqjIefcUlANq5yMxCxBCI3oxgVmVmpziOroQkby6zzYuN/ORZl
 xjJOvJTlIbFoaxGghcaKXG2p5XQetxe4TQ9LH9Ei8ihPeg1BSWkJxdMfh
 7lPUWTTEc6G9r3OvDO4HzZZQbTCfOjq3oxq5oy+iLGPRfGbwK6/ivC8Q0
 HTTgEuPb0g1cILXdt+VCY5ljgf9kRky0O6GYAZujcGlmYGd+L6Ms5QNzo
 kzR1A/+3aFEell7pava42cn3v7S05Eb4jHR1jEaWNgPWEmZiCpK1LzaGP Q==;
X-CSE-ConnectionGUID: rMLZauDyQZOLjCj+8JQ0tg==
X-CSE-MsgGUID: 6SVEnCV4RAKWavnI9NZNSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35633031"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="35633031"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 17:28:19 -0800
X-CSE-ConnectionGUID: RWN0m/gFTFmV7Wio2KopIg==
X-CSE-MsgGUID: lnq2JDgBQUyP+WzR6MbyiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="88962234"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 17:28:19 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 17:28:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 17:28:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 17:28:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCKK3SNg8idkaqrBmvMMH4SB2dc3plASSs+kMT/dyl2E2ZZugftFuhH5c/liTl5aFR8WUOSYVkJTNII4Y8Jo+9NRR7AVqbPFMHXQ+7/xqB9RMqviBFDhTUF3XFvoRW89IrbGuSPH9OH/UXA6CMR/8FCJ5aANbc6ak6sQcJjpP5sPfIcP16sUJPXJPgO8HdJWA+8Qdfng1XATweIGtKEYQz+idDlfLEX5vQ7HyO5K1uLUezogpuUCHualeBNLwwzP1lekxye3zun/nI9mgrwt1r2VpM1xiDjlOqra/a/AfEs8HhdocScJZeuK932gbVE2Fhf2cJFl+yS967HAeOsROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDS/CSnkPf+C5AS2mqa94BZwDb9ddG8af5yejyd8mho=;
 b=qkeXix9UXAK6sTGWt2YNBgoOyy8Qm4mWEiqIC2FZXYiYdQ+yXBqwP/73X5w+XPSwpCSmo0CZnraY/B9kKjvY+Ms7ci49+40yaEMmB6o7TATbHWC6Vcaql1Cy7BN/F0s2wOFnVxuYc25bTdyzKyRgYGeSygcoVBxPynvU0+4DcmLlDGvZxjl4Sn8j2OmxD9vRbZDkB9st2PkF9cs/exNtSsPu3HkSb5pv7yUMstGvn1HPG4OCdyRJ3WiJ+NIxWQQHfsgs+zqBBzbWaWQx59SeZus53n4q33zB1Ul1sRr5YUovToBaD1VFjMKPX1R3RL2W/w+x7BCxMdcVOFiUMrkT5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Tue, 19 Nov
 2024 01:28:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 01:28:14 +0000
Date: Mon, 18 Nov 2024 17:28:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 7/9] lib: Remove unused audio-related helpers
Message-ID: <20241119012812.GA4891@mdroper-desk1.amr.corp.intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
 <20241105061845.2486557-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105061845.2486557-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR17CA0025.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::38) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d54975-fb81-4330-cd0a-08dd08397056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JlyFH8FzpnIqI8oN7FteK9XBb0QRShJ1mHyZIKliicUyn716GvrCFtw+9oyI?=
 =?us-ascii?Q?2lBJE1tbpaSIm22uAk8+tlz0lplWnt8pWC1oi8fnWHIrc7C8UfxMtqdQKs8b?=
 =?us-ascii?Q?sp+OB4jaSCjGfKPaaUA1Iu4JTqAr2GvMm0jH7+IJgNxgKrhWMWEmprdOdTcX?=
 =?us-ascii?Q?QpE54nuZHon3TIygVBDWEtT4GIJdM6Fl0zuPtpWIuz+NWMHrXfPxqersbVbU?=
 =?us-ascii?Q?nItQvjy13DOzMh9ow6AEwAZRVnluCH4k2kCSt/nhcYb436RrkFr7QEoij3Lb?=
 =?us-ascii?Q?jfxrNDuFFER1MZjGje7NfptLHEYWSkJed7jvaCqTIjvvYJXkEds3Mtmd7R5/?=
 =?us-ascii?Q?elw7RoRPc37EaazTBJL2nYdc4rrGbwEiddUFgXGCHhz0Vlaq+/g33qKz99eg?=
 =?us-ascii?Q?2XXQ8GqYiagUfc7oicP88Kdb3vTZXGwnHx7MVolMoa2hROoY0v/C53xWFgRO?=
 =?us-ascii?Q?uIvuZzkKTCYLFCP1TVMrbCnw+7/upWaEPpUaGfb1TooTwRCvdpQOg7YfreOe?=
 =?us-ascii?Q?RAZUKGJ78vL4LE8DyCrrGGZpSuYba74MEW1kSMNp81msS776RgZlE1LGjscp?=
 =?us-ascii?Q?QpkNVSPaIpwpCYbpuRwlZvfotGHkS6HDgyVBIRHQG6+ZbqglMjm5zoIUOcPP?=
 =?us-ascii?Q?7Afr81m7EoH1j6M0G/EfD8l2w7RSGx+GkuOzfqCfBp0XiSWJ1q5GK4dFuQHH?=
 =?us-ascii?Q?LuuWW6lVtm2+n7JUWmVx2O0b2zhYnwNt1h1OmYU/V5FToXPIHATspp8qCsyL?=
 =?us-ascii?Q?QfxSw1JcyzRdAPIyKmgQERGnJjvOedB3MTN934DZnTp5mV5QnNbgKWLCuMQs?=
 =?us-ascii?Q?twKGLgUeIWfoVNkEgWXIu49JaG9Mw+bG148KtLDkF3IR5ZH61nlYpQ8xK0g5?=
 =?us-ascii?Q?93q2BF/quyYpQzdKgKPQO+FbneSUuPK8FZE0WKQpua/5xHyyM3z1Npi7AZyF?=
 =?us-ascii?Q?ngicNkdRyQr1ACXccsCxGjnzdRBuVimbFQoSL19j+ae7ItlZdJXzPW36Tzar?=
 =?us-ascii?Q?vpptcZRcL6MTdaFrApFn4K08vrAOBwqeo2kCcIzs7c6H7aRiXnBVelU9yH7W?=
 =?us-ascii?Q?35TXrjpCZrJ+g9tfzK/2Q/GnfqsdFoXxJuC29bgrOS01+xjvEovaRvznlQDk?=
 =?us-ascii?Q?L5f7aVKk1pwzDumvvYHyOhTsBN+OTxBOEVQjSZBCKhRBBBLnnDGYbXF9MtPX?=
 =?us-ascii?Q?GqQFCo1aN5bKhPWRWCrMiVRv0JJWOr9UEtk3YPp8g7POaLeI2sqBeDWKbHv6?=
 =?us-ascii?Q?vwCpvEbD0nXiQ67Bh4r74W2wQlxP2w5eDZgiCvmvFNDWUmPt7K/XhRY+4yQK?=
 =?us-ascii?Q?m8Er5CHUj0Wx/4HjNXfAMH6a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7BJ4khokQw346mA2ZzIit1OperQs+AFrNVr69qArNVwvaPeRccbFgSuTcX4S?=
 =?us-ascii?Q?PzHf3cUeRxAEtf4U9asM18NzIn5KacxhfRykzq6ld2X++byc1+t2euUuXwMS?=
 =?us-ascii?Q?Bh1TBtRUHqOgrFp3u5PFe3ZhjSbJMb6EvgPTY6Baj3YxRrA/kWbTbpBNeiwa?=
 =?us-ascii?Q?iOUaSMId24S5iXiSA+kZHe08EVIoTOTo5VlcluRNXHRT8IRoefIgvb9TT4HN?=
 =?us-ascii?Q?t4R0uEJHsgYb5Hogm1nNc/XNE06E7evhS3OXSt8PsZ20jTe5Xc7lDpCJlmB0?=
 =?us-ascii?Q?eoyINsySLhMRr7UAG+scQWKiDk5e8069xCh8Wso2yLMqfmPJXNgxvU2LoxL1?=
 =?us-ascii?Q?WZqRSofUi182Xv4QczszCjBGYe0yd8gwACcT8zqSmG20OGE9qs8hviUI+ceJ?=
 =?us-ascii?Q?sZQhGB7qdU/ER2DjNEwWyRu5eqkTg3f8BB/9hFyHVYYB0HsZ1FJkAJD8mmih?=
 =?us-ascii?Q?2Q9CXhP7D1f7JyRduG1ow+0ZFGq5aEJndtg72TY2BlpbOhd0ZSVj3PUBS3uI?=
 =?us-ascii?Q?+u36NY5lTES8CSpUnesXSvLO9Rfu7X2euKS5ytGUO4VV8iOH5AdxFDpLdQYL?=
 =?us-ascii?Q?SQ4Nuf0EFyegwI5xw4i37+ZZQuSp1EPQUdrL3FfRRrhqDdHxyRv3GQZNvhZ9?=
 =?us-ascii?Q?nTtEfHjoykwJ0TEJYjGMvLCCY2qNEYty3RyKB0zq/sq4UoWA9b6IkqHaFCEM?=
 =?us-ascii?Q?eoV5O8NiEyiL4pxM86XY9ki4fu6AofclT6VOoHNaFLBrST9OkWyyrZjhgGab?=
 =?us-ascii?Q?GTTa/1pyV9No7PXFr4L/6sZvWrWpDYfAaHc/RSsiQjuH0v4elDGw6VsAVyp6?=
 =?us-ascii?Q?1gz0795r9LKA7HPhdrJMW1iR+f7BNuEhhgxCpGBoAXOuA0Dv3T6lFQE7Ndp1?=
 =?us-ascii?Q?naORqScZFuhtlLU+LZMoKHpxVEw+KUokrf5L16VZ+PD2X/EWSeGXNAQxb9Q3?=
 =?us-ascii?Q?Ark4+IuZ2ykfH2GMfVnV1/tECLc6AXK7/zmd56cqfImTy+cZiEbfyuY++jrU?=
 =?us-ascii?Q?MqWu6m2wyyv8ZXDsNMFlSTa8XedhWvzE0/6diXrMsuVozDGUvBtPUHgVbnXG?=
 =?us-ascii?Q?zieW/nEcnAKJhm2vZmSqv7yB6Qqr4n4XYOoUPSew3bA0MQameOGLZxUntfVR?=
 =?us-ascii?Q?t2IVLH6cgxrHJ+nrZLH5fOcC8r5/VSpgXkcqrJx9gb+/pE0lMd0j2XOby8hu?=
 =?us-ascii?Q?5oOps5T+TZeQJ6KfbKaAWpsVhNxh3FrfrYaXlqZ9O/ItfPCGTWsmCp1WtRa/?=
 =?us-ascii?Q?0VABzLLwK99J+fEJktdVD9gKOx6FEQyXspF1dVwV1km7Vtwbwg0r2FSohJ28?=
 =?us-ascii?Q?Vr6ijTU7JtvtB/3MJEpvHQkBNnSmy+Vs2nROVqH4tDhmmn9/m3kb4pTov+0b?=
 =?us-ascii?Q?m0fMEQvkql/LpaH8yJhQPAXcR3t6b0UK8kdAgIp5Pj4qtd4JIRHahIpaDaN7?=
 =?us-ascii?Q?Okp0xxeU9KMW60CqjG0b8QgcTskbFIEmE56yKIw4Fqd54ODTH3QEQU3Cwojz?=
 =?us-ascii?Q?FIhSTa7xQ73WKo7XKcqnDrFB11xxJOpahikvNxhEecNhie6nlg1xezeLjd08?=
 =?us-ascii?Q?rsVs2eQJGg2yWVYjBN7t4nhTYOkccZPXqrFXc4i3cmunO+QoF/A72jw0BImQ?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d54975-fb81-4330-cd0a-08dd08397056
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 01:28:14.8697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1VHudLlIwr1XCRvutvgWzfdYJuw3Xak9mU4JUfuWNcgKVL6BDirtEb+dzoMX4zfaIZP3x25qpyCGKANtsf99jEVcg0HNw+T5LTf5FQllGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
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

On Mon, Nov 04, 2024 at 10:18:43PM -0800, Lucas De Marchi wrote:
> Now that xe and i915 are just doing unbind + rmmod, remove all the dead
> code trying to workaround interaction with the sound modules.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/igt_aux.c  | 284 -------------------------------------------------
>  lib/igt_aux.h  |   3 -
>  lib/igt_kmod.c | 119 ---------------------
>  lib/igt_kmod.h |   2 -
>  4 files changed, 408 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 3407cc4f2..64dbe61a2 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -1653,290 +1653,6 @@ igt_lsof(const char *dpath)
>  	free(sanitized);
>  }
>  
> -static void pulseaudio_unload_module(const uid_t euid, const gid_t egid)
> -{
> -	struct igt_helper_process pa_proc = {};
> -	char xdg_dir[PATH_MAX];
> -	const char *homedir;
> -	struct passwd *pw;
> -
> -	igt_fork_helper(&pa_proc) {
> -		pw = getpwuid(euid);
> -		homedir = pw->pw_dir;
> -		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", euid);
> -
> -		igt_info("Request pulseaudio to stop using audio device\n");
> -
> -		setgid(egid);
> -		setuid(euid);
> -		clearenv();
> -		setenv("HOME", homedir, 1);
> -		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
> -
> -		system("for i in $(pacmd list-sources|grep module:|cut -d : -f 2); do pactl unload-module $i; done");
> -	}
> -	igt_wait_helper(&pa_proc);
> -}
> -
> -static int pipewire_pulse_pid = 0;
> -static int pipewire_pw_reserve_pid = 0;
> -static struct igt_helper_process pw_reserve_proc = {};
> -
> -
> -static void pipewire_reserve_wait(void)
> -{
> -	char xdg_dir[PATH_MAX];
> -	const char *homedir;
> -	struct passwd *pw;
> -	int tid = 0, euid, egid;
> -
> -	igt_fork_helper(&pw_reserve_proc) {
> -		struct igt_process pc;
> -
> -		igt_info("Preventing pipewire-pulse to use the audio drivers\n");
> -		open_process(&pc);
> -		while (get_process_ids(&pc)) {
> -			tid = pc.tid;
> -			euid = pc.euid;
> -			egid = pc.egid;
> -			if (pipewire_pulse_pid == tid)
> -				break;
> -		}
> -		close_process(&pc);
> -
> -		/* Sanity check: if it can't find the process, it means it has gone */
> -		if (pipewire_pulse_pid != tid)
> -			exit(0);
> -
> -		pw = getpwuid(euid);
> -		homedir = pw->pw_dir;
> -		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", euid);
> -		setgid(egid);
> -		setuid(euid);
> -		clearenv();
> -		setenv("HOME", homedir, 1);
> -		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
> -
> -		/*
> -		 * pw-reserve will run in background. It will only exit when
> -		 * igt_kill_children() is called later on. So, it shouldn't
> -		 * call igt_waitchildren(). Instead, just exit with the return
> -		 * code from pw-reserve.
> -		 */
> -		exit(system("pw-reserve -n Audio0 -r"));
> -	}
> -}
> -
> -/* Maximum time waiting for pw-reserve to start running */
> -#define PIPEWIRE_RESERVE_MAX_TIME 1000 /* milisseconds */
> -
> -int pipewire_pulse_start_reserve(void)
> -{
> -	bool is_pw_reserve_running = false;
> -	int attempts = 0;
> -
> -	if (!pipewire_pulse_pid)
> -		return 0;
> -
> -	pipewire_reserve_wait();
> -
> -	/*
> -	 * Note: using pw-reserve to stop using audio only works with
> -	 * pipewire version 0.3.50 or upper.
> -	 */
> -	for (attempts = 0; attempts < PIPEWIRE_RESERVE_MAX_TIME; attempts++) {
> -		struct igt_process pc;
> -
> -		usleep(1000);
> -		open_process(&pc);
> -		while (get_process_ids(&pc)) {
> -			if (!strcmp(pc.comm, "pw-reserve")) {
> -				is_pw_reserve_running = true;
> -				pipewire_pw_reserve_pid = pc.tid;
> -				break;
> -			}
> -		}
> -		close_process(&pc);
> -
> -		if (is_pw_reserve_running)
> -			break;
> -	}
> -	if (!is_pw_reserve_running) {
> -		igt_warn("Failed to remove audio drivers from pipewire\n");
> -		return 1;
> -	}
> -	/* Let's grant some time for pw_reserve to notify pipewire via D-BUS */
> -	usleep(50000);
> -
> -	/*
> -	 * pw-reserve is running, and should have stopped using the audio
> -	 * drivers. We can now remove the driver.
> -	 */
> -
> -	return 0;
> -}
> -
> -void pipewire_pulse_stop_reserve(void)
> -{
> -	if (!pipewire_pulse_pid)
> -		return;
> -
> -	igt_stop_helper(&pw_reserve_proc);
> -}
> -
> -/**
> - * __igt_lsof_audio_and_kill_proc() - check if a given process is using an
> - *	audio device. If so, stop or prevent them to use such devices.
> - *
> - * @proc_info: process struct, as returned by readproc()
> - * @proc_path: path of the process under procfs
> - * @pipewire_pulse_pid: PID of pipewire-pulse process
> - *
> - * No processes can be using an audio device by the time it gets removed.
> - * This function checks if a process is using an audio device from /dev/snd.
> - * If so, it will check:
> - * 	- if the process is pulseaudio, it can't be killed, as systemd will
> - * 	  respawn it. So, instead, send a request for it to stop bind the
> - * 	  audio devices.
> - *	- if the process is pipewire-pulse, it can't be killed, as systemd will
> - *	  respawn it. So, instead, the caller should call pw-reserve, remove
> - *	  the kernel driver and then stop pw-reserve. On such case, this
> - *	  function returns the PID of pipewire-pulse, but won't touch it.
> - * If the check fails, it means that the process can simply be killed.
> - */
> -static int
> -__igt_lsof_audio_and_kill_proc(const pid_t tid, const char *cmd, const uid_t euid, const gid_t egid, char *proc_path)
> -{
> -	const char *audio_dev = "/dev/snd/";
> -	char path[PATH_MAX * 2];
> -	struct dirent *d;
> -	struct stat st;
> -	char *fd_lnk;
> -	int fail = 0;
> -	ssize_t read;
> -	DIR *dp;
> -
> -	/*
> -	 * Terminating pipewire-pulse require an special procedure, which
> -	 * is only available at version 0.3.50 and upper. Just trying to
> -	 * kill pipewire will start a race between IGT and systemd. If IGT
> -	 * wins, the audio driver will be unloaded before systemd tries to
> -	 * reload it, but if systemd wins, the audio device will be re-opened
> -	 * and used before IGT has a chance to remove the audio driver.
> -	 * Pipewire version 0.3.50 should bring a standard way:
> -	 *
> -	 * 1) start a thread running:
> -	 *	 pw-reserve -n Audio0 -r
> -	 * 2) unload/unbind the the audio driver(s);
> -	 * 3) stop the pw-reserve thread.
> -	 */
> -	if (!strcmp(cmd, "pipewire-pulse")) {
> -		igt_info("process %d (%s) is using audio device. Should be requested to stop using them.\n",
> -			 tid, cmd);
> -		pipewire_pulse_pid = tid;
> -		return 0;
> -	}
> -	/*
> -	 * pipewire-pulse itself doesn't hook into a /dev/snd device. Instead,
> -	 * the actual binding happens at the Pipewire Session Manager, e.g.
> -	 * either wireplumber or pipewire media-session.
> -	 *
> -	 * Just killing such processes won't produce any effect, as systemd
> -	 * will respawn them. So, just ignore here, they'll honor pw-reserve,
> -	 * when the time comes.
> -	 */
> -	if (!strcmp(cmd, "pipewire-media-session"))
> -		return 0;
> -	if (!strcmp(cmd, "wireplumber"))
> -		return 0;
> -
> -	dp = opendir(proc_path);
> -	if (!dp && errno == ENOENT)
> -		return 0;
> -	if (!dp)
> -		return 1;
> -
> -	while ((d = readdir(dp))) {
> -		if (*d->d_name == '.')
> -			continue;
> -
> -		memset(path, 0, sizeof(path));
> -		snprintf(path, sizeof(path), "%s/%s", proc_path, d->d_name);
> -
> -		if (lstat(path, &st) == -1)
> -			continue;
> -
> -		fd_lnk = malloc(st.st_size + 1);
> -
> -		igt_assert((read = readlink(path, fd_lnk, st.st_size + 1)));
> -		fd_lnk[read] = '\0';
> -
> -		if (strncmp(audio_dev, fd_lnk, strlen(audio_dev))) {
> -			free(fd_lnk);
> -			continue;
> -		}
> -
> -		free(fd_lnk);
> -
> -		/*
> -		 * In order to avoid racing against pa/systemd, ensure that
> -		 * pulseaudio will close all audio files. This should be
> -		 * enough to unbind audio modules and won't cause race issues
> -		 * with systemd trying to reload it.
> -		 */
> -		if (!strcmp(cmd, "pulseaudio")) {
> -			pulseaudio_unload_module(euid, egid);
> -			break;
> -		}
> -
> -		/* For all other processes, just kill them */
> -		igt_info("process %d (%s) is using audio device. Should be terminated.\n",
> -				tid, cmd);
> -
> -		if (kill(tid, SIGTERM) < 0) {
> -			igt_info("Fail to terminate %s (pid: %d) with SIGTERM\n",
> -				cmd, tid);
> -			if (kill(tid, SIGABRT) < 0) {
> -				fail++;
> -				igt_info("Fail to terminate %s (pid: %d) with SIGABRT\n",
> -					cmd, tid);
> -			}
> -		}
> -
> -		break;
> -	}
> -
> -	closedir(dp);
> -	return fail;
> -}
> -
> -/*
> - * This function identifies each process running on the machine that is
> - * opening an audio device and tries to stop it.
> - *
> - * Special care should be taken with pipewire and pipewire-pulse, as those
> - * daemons are respanned if they got killed.
> - */
> -int
> -igt_lsof_kill_audio_processes(void)
> -{
> -	char path[PATH_MAX];
> -	int fail = 0;
> -	struct igt_process pc;
> -
> -	open_process(&pc);
> -	pipewire_pulse_pid = 0;
> -	while (get_process_ids(&pc)) {
> -		if (snprintf(path, sizeof(path), "/proc/%d/fd", pc.tid) < 1)
> -			fail++;
> -		else
> -			fail += __igt_lsof_audio_and_kill_proc(pc.tid, pc.comm, pc.euid, pc.egid, path);
> -	}
> -	close_process(&pc);
> -
> -	return fail;
> -}
> -
>  static struct igt_siglatency {
>  	timer_t timer;
>  	struct timespec target;
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index bfd83adca..8bc0106d2 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -317,9 +317,6 @@ bool igt_allow_unlimited_files(void);
>  int igt_is_process_running(const char *comm);
>  int igt_terminate_process(int sig, const char *comm);
>  void igt_lsof(const char *dpath);
> -int igt_lsof_kill_audio_processes(void);
> -int pipewire_pulse_start_reserve(void);
> -void pipewire_pulse_stop_reserve(void);
>  
>  #define igt_hweight(x) \
>  	__builtin_choose_expr(sizeof(x) == 8, \
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 972dc490d..3944669e7 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -459,15 +459,6 @@ igt_kmod_list_loaded(void)
>  	kmod_module_unref_list(list);
>  }
>  
> -static void *strdup_realloc(char *origptr, const char *strdata)
> -{
> -	size_t nbytes = strlen(strdata) + 1;
> -	char *newptr = realloc(origptr, nbytes);
> -
> -	memcpy(newptr, strdata, nbytes);
> -	return newptr;
> -}
> -
>  /**
>   * igt_intel_driver_load:
>   * @opts: options to pass to Intel driver
> @@ -495,116 +486,6 @@ igt_intel_driver_load(const char *opts, const char *driver)
>  	return 0;
>  }
>  
> -/**
> - * kick_snd_hda_intel:
> - *
> - * This function unbinds the snd_hda_intel driver so the module can be
> - * unloaded.
> - *
> - */
> -static void kick_snd_hda_intel(void)
> -{
> -	DIR *dir;
> -	struct dirent *snd_hda;
> -	int fd; size_t len;
> -
> -	const char *dpath = "/sys/bus/pci/drivers/snd_hda_intel";
> -	const char *path = "/sys/bus/pci/drivers/snd_hda_intel/unbind";
> -	const char *devid = "0000:";
> -
> -	fd = open(path, O_WRONLY);
> -	if (fd < 0) {
> -		return;
> -	}
> -
> -	dir = opendir(dpath);
> -	if (!dir)
> -		goto out;
> -
> -	len = strlen(devid);
> -	while ((snd_hda = readdir(dir))) {
> -		struct stat st;
> -		char fpath[PATH_MAX];
> -
> -		if (*snd_hda->d_name == '.')
> -			continue;
> -
> -		snprintf(fpath, sizeof(fpath), "%s/%s", dpath, snd_hda->d_name);
> -		if (lstat(fpath, &st))
> -			continue;
> -
> -		if (!S_ISLNK(st.st_mode))
> -			continue;
> -
> -		if (!strncmp(devid, snd_hda->d_name, len)) {
> -			igt_ignore_warn(write(fd, snd_hda->d_name,
> -					strlen(snd_hda->d_name)));
> -		}
> -	}
> -
> -	closedir(dir);
> -out:
> -	close(fd);
> -}
> -
> -static int igt_always_unload_audio_driver(char **who)
> -{
> -	int ret;
> -	const char *sound[] = {
> -		"snd_hda_intel",
> -		"snd_hdmi_lpe_audio",
> -		NULL,
> -	};
> -
> -	/*
> -	 * With old Kernels, the dependencies between audio and DRM drivers
> -	 * are not shown. So, it may not be mandatory to remove the audio
> -	 * driver before unload/unbind the DRM one. So, let's print warnings,
> -	 * but return 0 on errors, as, if the dependency is mandatory, this
> -	 * will be detected later when trying to unbind/unload the DRM driver.
> -	 */
> -	for (const char **m = sound; *m; m++) {
> -		if (igt_kmod_is_loaded(*m)) {
> -			if (who)
> -				*who = strdup_realloc(*who, *m);
> -
> -			ret = igt_lsof_kill_audio_processes();
> -			if (ret) {
> -				igt_warn("Could not stop %d audio process(es)\n", ret);
> -				igt_kmod_list_loaded();
> -				igt_lsof("/dev/snd");
> -				return 0;
> -			}
> -
> -			ret = pipewire_pulse_start_reserve();
> -			if (ret)
> -				igt_warn("Failed to notify pipewire_pulse\n");
> -			kick_snd_hda_intel();
> -			ret = igt_kmod_unload(*m);
> -			pipewire_pulse_stop_reserve();
> -			if (ret) {
> -				igt_warn("Could not unload audio driver %s\n", *m);
> -				igt_kmod_list_loaded();
> -				igt_lsof("/dev/snd");
> -				return 0;
> -			}
> -		}
> -	}
> -	return 0;
> -}
> -
> -int igt_audio_driver_unload(char **who)
> -{
> -	/*
> -	 * Currently, there's no way to check if the audio driver binds into the
> -	 * DRM one. So, always remove audio drivers that  might be binding.
> -	 * This may change in future, once kernel/module gets fixed. So, let's
> -	 * keep this boilerplace, in order to make easier to add the new code,
> -	 * once upstream is fixed.
> -	 */
> -	return igt_always_unload_audio_driver(who);
> -}
> -
>  /*
>   * Unbind driver from devices. Currently supports only PCI bus
>   */
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index 67ae6833f..152606a60 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -38,8 +38,6 @@ int igt_kmod_unload(const char *mod_name);
>  
>  int igt_kmod_unbind(const char *mod_name);
>  
> -int igt_audio_driver_unload(char **whom);
> -
>  int igt_intel_driver_load(const char *opts, const char *driver);
>  int igt_intel_driver_unload(const char *driver);
>  
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
