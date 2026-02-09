Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A29FE7E0C3
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 10:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BBD10E3BE;
	Mon,  9 Feb 2026 10:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1F+LeRo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7DB10E14D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770633735; x=1802169735;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iRaCNhObk4Vf111pn9Wnmzi0AhblZ4Shjyorvy6CTkM=;
 b=h1F+LeRolIx0CIV8NAhc1KnRE/dL0EoRkGUwBcXgVqjlNMe1uLskP4FK
 mggpxc2pyZYzdplH+3womdFzGF9yIxS3cPoRD+x9aYKy+/X1By4cASXCt
 pVB60mNzRSjDwhgi7s+EGd6KnJwK85VAb+XG3QN/7SRiQ0294q0liF+Vh
 CxgtrqZqOa5l6hUWY0jfzOap7YNsyqf++r3//oFlhFvreocy14BL/Lb9t
 JXHRdCjZVNuOkL9a92Vc20wjNkBUSmIumvbwWoDZ7sm1/K73kub68+S9l
 1LFQ+zBlNQHNt+9a9BSRZ3CeIUQnKjY54vXGcTZdSLlJokKldog4QX/U8 w==;
X-CSE-ConnectionGUID: tB+ABPXUSGW4FBsirxirGQ==
X-CSE-MsgGUID: 29A3+dF0Qr2iJdLGj2AdaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="89160196"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="89160196"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:42:15 -0800
X-CSE-ConnectionGUID: +GJnmBOqQTqGh7h/9hP4EA==
X-CSE-MsgGUID: CsksV2OJQn2TuAjhgW+1YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="249188556"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:42:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:42:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 02:42:15 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:42:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izEowIeHycPyZuXTE33wK4ceco+qk1hyezMt1Y/blbevePhpM8uswL6fzX1+VhqKN65+rHq3Cs2pkmxHBLPiYN8q8JX+4YXSYkCtJmZfC6oexaiQUDL93TZSR9KHx3KYGKsdKx6oSGqHOSv1qIPYgKjqLlcyUBtJtG/jgE18ss0E1XJtoAJ++zRR1hvo5JgD2RuQJHVH+9kUJR0by5RvOUBhfhu2vInLXXcHf9Q8ZPd8tx8w6vZXdo/Y6MWqFOIicWw9saO6LnLKW/XmqoGOs11IhCdmLdUsmv8/khv8DO/Ih5OcSSL2oSkxHBqj5i34cZt0mNYJL8Fn+zZjQGdFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmsrP2gqW6d2u/ge9TY+6EAVGySelX4E1v5h6vFq9sU=;
 b=OVY1KEwuC4fVaKPMftX7V1xD8Nc+4DY1wwjkMrM06e7huVLBf6LSWyoII2bgoDE73ziwa+Z4hob68sVYXVIsiBvg0hHkdnEKvRdY8WAtAeZo5guhHqHZO5j/nxpy7ZX7b7rVx1POS5ASMbubgdR6Nqt3GMpm5n6QkZye2dRP8aj/u2RKA2CtGjKAJ2wiRv+KQyYp6ZMAwDb4A8jlPOTkSH0EjQai6VJcbCEMc7uWj4h5SrEaTPujyiX0la/L5t0UicOTX+rGREcmddzRaX55qDUq5+7LQfIpEx09DcVmZWfJbR7NEHKcxElCHekjkMBXDRRjgYF31FR1VyZdrs/Gbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Mon, 9 Feb
 2026 10:42:07 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 10:42:07 +0000
Date: Mon, 9 Feb 2026 10:41:57 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 6/6] lib/meson: build core sources as per-file
 static libs with minimal deps
Message-ID: <am7j2so5zujqnsvgrw6wqjfy7vp4uto7pzk3yxcbrqdkm6oumz@jze6kbf72vax>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1770212190.git.sebastian.brzezinka@intel.com>
 <2a664fce3abf544c00e9ae12eaee1ab81215b36d.1770212190.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <2a664fce3abf544c00e9ae12eaee1ab81215b36d.1770212190.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: WA0P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::26) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DM6PR11MB4595:EE_
X-MS-Office365-Filtering-Correlation-Id: f2faf043-9ccc-43a6-2889-08de67c7ded6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHgxbHo2SUFhcjN1ZlVmczk1MkRackRxamkzZDUrT3dTemN2S2h6aVJ3TFpJ?=
 =?utf-8?B?ckRvL0pycW4rWmJyUjRzbnlwNkRJM2VhR0FkQ0RhSXNNOGdsZDl5OVJaN1Yz?=
 =?utf-8?B?bTdudjA1UVpWaWxpaHJQWUEwZlUzakliVmlWaVhaY3QrVk5lWStUTkwxSWpv?=
 =?utf-8?B?Sm04ZFMwTFBBaHg0am9YelEwbUppSzRmc0NxR2FtY1JzazlTRGswN3BXZ1Jh?=
 =?utf-8?B?MllqSmN5WDkzdW10emJsU0VwSUVwdHQ0ekp0MG9oMlJUdnoxOUNNbThmbG5N?=
 =?utf-8?B?M2kwUVQwWjBCV09xMG5FQkhzWW1zTlFEaW5oOXloTkFZTFhrM0hISFlUZCsx?=
 =?utf-8?B?VEhlNnFYSWt6N0Q4VElLb05CUG1MQ29uQmpLZklPSkhNWGR0c3o5ZFlIcFYz?=
 =?utf-8?B?UHIwRUVGTkUvTnVtNXl4dXorZWZtVGh0VTNIc0NMRlhOc1dIRi9hRjVIRWJ6?=
 =?utf-8?B?L01CZnNYZnVYcXJYOUlpZUx0aTRrL3RjbmxiZktTK1Y3aHJicm5XVjNzU3Jh?=
 =?utf-8?B?LzhxTzJvUStqSEw2V1dkRU53ZXhJTzZYcjNPbW5wMzJ0ZEEwbC9oUldVQ0xJ?=
 =?utf-8?B?Z0tjNEJ6c3FMSVE0WHdTeGtSRkxyb0Q3MlpDMlc4b3FpSW9zMkwweGVBczJs?=
 =?utf-8?B?UVdSVUV6R0RibWlNUE5uNVN5U2tLRGpWOURWS1NYdUZLcGNPOXc5bkVBcXFi?=
 =?utf-8?B?KzFqSWpucStjRVNkelNOOEtnc3R6Uzc2bjY0RXBzU3gvVjlKWGw1cGFqNnpG?=
 =?utf-8?B?cUFSNXlxREs0ODRzMVR3U0R6YWJGTXBOamFTcHFFSHA5ZXQ5bHNpZ0tBeGQx?=
 =?utf-8?B?ajZoVzhzWEJSRzdpTS9qMW53RU1vdE4wWmZSR3JIVXpuM0VXV0d5L01YbWFt?=
 =?utf-8?B?NFArcVFjbDZ4UE8wNDJtNTg5Q0pFN1VUZHF5bkVRTnV6VzRWWHJmR3VPRXVN?=
 =?utf-8?B?NTFzWW5GYm1CTGVFckI5QjYzd1ZFYkNacXVXSlltdFRxWXkreTBkZm9FV0gz?=
 =?utf-8?B?Z0RTdk9UeHc1Q0haSDlaVmRyUmw1WmxRRHkxd0x1RFRRMG9FRVAyQ3A0U2lw?=
 =?utf-8?B?cHZaclRPRXVodEt5bnhndmUwK0R1eDUvMnNvMlBaZlBQcW9zd3Vvanppc1pH?=
 =?utf-8?B?aUFyMDc0UmFoUGZLNFhCc2ZVdjl2d0N0L3hWQkV1WEJld3REa1dSUTVkRloy?=
 =?utf-8?B?MUZrWXRreUdTVEhBaG0zdE1VU0Q4dXM0SjV5VkVYNlVPWEZpVzZScVhhb21j?=
 =?utf-8?B?VE5GK3paVDNkV2wwalRYQ29Jc01IeHJaR0VkNTRvRlJXN1lxaGFEbWtkNGRC?=
 =?utf-8?B?S3BmM0p3LzBOdytpQ3ErVS85Z0E4NjJjR2dYM2pxMWZBNW9qK0RBdFdJV2xF?=
 =?utf-8?B?VHFrN0wyWHI5bFE3S0NlZnJFQUVZVTFtcDFhMUJPd1FNU2ZHZVpucnF6MEQ2?=
 =?utf-8?B?ejZzWGFkSjdmR1VFellEdEU3UnZYUDNHUkxvTUhleGsxMDJuQTlUYTVXaHFo?=
 =?utf-8?B?TlRPSWdjMVc5WXRvRU9pc2lYK3VEWGZpZU5NajZBd1JIdTAzYitNZ1hDWFNE?=
 =?utf-8?B?MzJseWRuMm5pcHFwN3h0L3pPWEJRYnpyWDEzNElwbFBMU0Y5OTZqRlVYSWV0?=
 =?utf-8?B?OXZaU0J1MW5uMlVBc05vU1ZQQmtmQWpWNGZaL2VtbDZvTHR6WFZUdjFNVEkv?=
 =?utf-8?B?YlQ0NFFmVko0NTNCOHhTd3o1emV6ZGlGd3IzVzEwNisyUjNQTVhkMWcvRGp1?=
 =?utf-8?B?bk5hYjQycjZ3UjRNcFc0VlJlRFBDWUtDUXBlQTE3Wm5OQnF1NEF0TlNVM2pt?=
 =?utf-8?B?SWswUXkxVWVFeW9Jell1WG1Wa2F5bUFiSXM2WmJCT3BORXNNK3NSUXlTazhn?=
 =?utf-8?B?dlBFVmlyTW52NklzMUR2WTk1SFh1ZVp4dmFKM21xY2E5MmV0Y1gzd2lOcXpp?=
 =?utf-8?B?SE1MNnZ4bG8vTjhYdks0STJENzREb2wvMkJKNTNsWUM3L3M0elRlSm45MkFz?=
 =?utf-8?B?OFdnRkkxWVZSMkNCNkVxWmEwci9td3lFT2Y3VjA5Y2xrR0J6eDF0NmhZTzBO?=
 =?utf-8?B?V3Y1Mi80V3g3bk9ySEMzc01GSnlUamV4L3lVRmlETlZmcEZBdGJIdjNXUXVL?=
 =?utf-8?Q?MjU0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmxzbkxnSndva3pOcEMxUEtxcUlkd1p0T09uRnU1dGZtdmg5STl3ZEUvVGlR?=
 =?utf-8?B?OW8vQitxY3lrZkNUek5KOEZQUnREYXpDRm43NWd4Z1RreUdlcFRkWTAwU1Nl?=
 =?utf-8?B?YVRlMGRndk92YnN0ZXM4aTFRRm9YclRYS1poMVpEd3BzTDlUV04ycDUwbFV0?=
 =?utf-8?B?Qm9FR0pjYWRsMHM0VStBWndCeFdCRG5ZbjJiS0k0Vlh4R1NIdjVQaHk2cS91?=
 =?utf-8?B?eXo1WDlRdjFyNGpVVDRkd3l0S3Z0NGhJQ0swUE8yTW5WSjRKUGF3ODY4TWxa?=
 =?utf-8?B?b3M0VWZna0ZUNzhPTVlLZkZ5TDJwSmRhclE3TXF3aHZMbm4rQ2JaYnVCbXlj?=
 =?utf-8?B?WklxU0t3dTRBUVZpckJSY1pDYWtnVmp1YTBJSm9vUDZjLzRGblk4L2pWN243?=
 =?utf-8?B?eFdBUUx6V0k2WENYbFdXRDVEaUdGVHM3Q1J0UXVaRjY3L2tWbk9wbGFvZzdh?=
 =?utf-8?B?cnBaNCtzemV2QUJka1dQbkZyMEY1T3pBUVNGNEV5em1UbTk0dDVTTExXRDZa?=
 =?utf-8?B?NUVtemovMzQ4Z2JtOUZZR0lWQUdML0JVSW90eVBMeWMvS1I5MHBlVWo0ODhi?=
 =?utf-8?B?Y1p5VmVtMzNjZmx6THl5QmphdkNRbzRRNFNSbGF6WGE5UDd0N3FudDJNZ29q?=
 =?utf-8?B?bU5sZkVBbzJsTFZNbFo5L21DR2haK2lyek0zTDJRc2krdGpRVzdBc2RTcm50?=
 =?utf-8?B?OGswa1RFWEhUYjcyK0dENEpMMUN3d3JOdHNVMHNMVFRVZzUzU0o0Z0UvdW9q?=
 =?utf-8?B?bG11SHhiTTIzYWZVK3hDY00wYXlTNURhMXdXckhNdlpKRWZTc0ViWmJNK25H?=
 =?utf-8?B?R0ZuNUJVOFZ3c21QTU9LK0dkMG9MLzROR3BSbDJwYnN0MGRrRDE2U3dMdk1F?=
 =?utf-8?B?aFNJZlM3cEQ3NEUwYzN5N0xNZzNZelc4NUE1akJFVjBPSlltcHRsM2tvV3Bq?=
 =?utf-8?B?TVhjZTRsYW81ajBUekZwSjY3NUIwT21VeWVFSWtoVTdtdW1hbi9kelFzMnZ6?=
 =?utf-8?B?dW5xTGRDR1Vyakl3NUlIRTZqT1ZpRy90RStJaXBFQkJOZDM0L3RiTitQQnN0?=
 =?utf-8?B?WlhXVllwQlhtUE5QL0FkTy9ISkxDT0p6cno1ZDNScm1VM0pZR0hud1NoK3Rn?=
 =?utf-8?B?TkhaT1FKdy92alZXS0tqOVZQTmFKNlJIVDhaSUc2NCtoU3psRUJ5YUdqbHpH?=
 =?utf-8?B?UXMzTlFXRUlHUlR0YW9hVmNpUythSUZFQkZVL3BlSXl6NHZVa2JHaklQZEJL?=
 =?utf-8?B?NGV0bVVFeG5XK0dWa09FYUlVa21NT1Q2WU12TlFMZlo3MFl3OUlIczRmUTVJ?=
 =?utf-8?B?K1lzOVNvOFF1ZzFtcGF0bll1OGpjUCtRTmRwZXNTcTlDWExraGJJNmMwZXRH?=
 =?utf-8?B?VVViQ2psa0dTblVpWUxtK1Y5dEVpUCt5ZDBnUFpxUE81SFJtcnlTQ0lydjJx?=
 =?utf-8?B?eVVRWTF2VVBqUlpVV1RWYnBpZnkvcFBZNmlzQ2syWndCazFLU0VhSlp5Q2hz?=
 =?utf-8?B?U2JCSXR4T2FGNmljdm5Pc0RsZVdPR3F0eWtXTnFFbHdveHlOZGhJVHNibjJ1?=
 =?utf-8?B?OVJGeUxVOW5sU3dlbCsyNWk3emdhN3JEYWVmc3JDSHlRNlY5ZUlOWm5VcDFu?=
 =?utf-8?B?cnhzbkg1TWdEVHdVMmVydTFFZzRKYlRJWXFWQ1dlU3QvTUlyMk1sSmp6YXk5?=
 =?utf-8?B?dmNxMXVYbGtQQ1ZrZGNhZGpTdkN5amsyMjFJanhJWlQ2R3BBR2E3MXJZcGN6?=
 =?utf-8?B?NWZuTVFjQlY2ZzJOSTRrTzhZa09nZUZsMUd3WS9MNVpKVWtvVjkvODRRM21W?=
 =?utf-8?B?Q2NvbVg1dlhrdGlyQllUcFRqNWNkTGlEWDBScW1LUWlhNG5GS3VVMVpGN3da?=
 =?utf-8?B?TGpKckxza3Y0ZGp2ejlHbmc2dFd1RVNpUERVaUtSYmEydllwbytlSEhrTGpu?=
 =?utf-8?B?Z0k5YlJrUy9ObGNWeTViK2JlbVBFYUJGR3FvQmdhWS9oQXl6WnJuQVR1SWph?=
 =?utf-8?B?RVIyQ1hScmhkUjZzT3pHc2FPOXNRaFhkbkt2ZTcrOTVQQWVCaVhkSDZ3b0Fz?=
 =?utf-8?B?dTE2bEtheFdDNVFFZTlNc0c1T2VzNE9GUEFiM3g0SzBkQUF6V3p4WkQycXN0?=
 =?utf-8?B?RGtOQ214RWNOSWEzOFRWbXAwZmViTUhQZUNuT25iN1UzRlRVYzN4UEREMlpV?=
 =?utf-8?B?UEZRUjhEdUgxcmxHRjFKQmtlTmJrUzQ3UjhKRFF0THZDMTVOTUpKZGFramRL?=
 =?utf-8?B?T0F5WjhIUHRvUEtIalF4LzR2cDBMa0xUV3BVOWZYWk85djN4RmwvL1RtQy9y?=
 =?utf-8?B?SHVFMkhZRVdxMGc5RjZvVkJsMGN2aWZlcW5kbGo1MFpVTittZkYrTUdLK1p3?=
 =?utf-8?Q?2VrqPI1J6fXizoog=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2faf043-9ccc-43a6-2889-08de67c7ded6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:42:07.1116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/D6OGByXE3eDVrj83dyTnl/cITOD1bbW3RfGbGBS/7pqkaBd1q9kGdsX3z+OpWDCTtgpwm1+d7/0VTSOmFEhqkexvtrPW0Z4pq5Tcd6/DE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
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

Hi Sebastian,

On 2026-02-04 at 15:16:08 +0100, Sebastian Brzezinka wrote:
> Introduce a new lib_core_sources list to isolate low-level/common code
> (basic data structures, device scanning/info, and basic utilities) and
> build each file as a small static library.
> 
> These per-file static libs are linked via a new declare_dependency()
> (lib_core_igt) and use a minimal dependency set (glib, libudev,
> pciaccess).
> 
> This improves modularity and keeps core components lightweight.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---

I checked that this builds just fine on my end and I do not have
anything against the code, so:

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
