Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA11C6FD35
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 08:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7C710E614;
	Thu, 29 Aug 2024 08:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eh+X7K30";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC6A10E548
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724855658; x=1756391658;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=aALgDbJDeNL3Kn6I5CbfaJ6/a/Um6MtzxruIiEaxjG8=;
 b=eh+X7K30ZRCllkDRXbk2jnckGGWKGWG4V0LpbLvij0mosJnElR8/suRJ
 /GfSElui3LhWPV1EtG4Lkj/dOxLs3bH/Qdq8Xox34lfDli5fEPV+Uv4TV
 2A7SSfXdAVgciIPfBAl7tpjSizl/2aXXS8/+uqhok481XGRYzC9Bqobmd
 es/jQ6yNz1LdvRwbnMWYWTnkMIBzJ0CJxoj+C5K4v42y82AicSsUl94NF
 KfubRIkWmHVybjG3dItMkaDxT5Ur+EXH+EXiEafE/PNo2qOsVwdsTznsv
 3v+c9z/MylLMG9JoyRranPtnGV7yt1pt4xOcQhH/cqH+p3W0TrG8UakDj A==;
X-CSE-ConnectionGUID: 0LdlWPmGS2e2vHgVj18Ixg==
X-CSE-MsgGUID: Folip8tWQ8qUj6Q6Eca9MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34767985"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="34767985"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:34:18 -0700
X-CSE-ConnectionGUID: Q2CsGKq1TO2xJ0+xyw/ZSg==
X-CSE-MsgGUID: NUQZvieiQvO0BPJH7ywGBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63945193"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 07:34:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 07:34:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 07:34:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 07:34:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 07:34:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iL8s0olBXvamhgtJp8nnSaJFB18PPtmsroHFLATqVk8iMEwJhF2+vA82uGT8S272Mypo9o36F31bbBcgU+VlQAgwroGk0CVXhOgB2rayFSUCpwSUdUSOTfNfU0keiyxddQ6OjllXYa9EmcDWQIIclXU2HUGgfQl8DpyBQXCt+9IJUM8L/dlfZ0MkAeH6jjY+eVUUyc0vPdX/mRnmkHOT6aqBJqsdBNGpcw6fnCPa5GFh3TT2k9CP9M0iY68jzh61fwOAISZ/2CgBtuj87agI10OvopWbVhc4K4w94L/ftWNZiAxDRBQ+qi6gVJrxe212BNlg/FWE9XNGdZ60rV4b/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tw9EXrq/cTwLD37m9Gqep9IJi/lXspZYeT20l2YFaRQ=;
 b=xdypU4fHEI18ZA+ADtjQzxdoIIOl86tHhG1XpcGV72eiPKipAoIOx5ZYJogqrSXQdzqbINazVnbeKKKhu4++NCtXUtgYNyK93KcUGCBVTivfezq1Tk8pCy8/qiH3KQ8bRYY3iq/va0kDad1N9qRan46SuhYzDBOYz52GQhVHqmmzbAqfQwhBeStBsaEZVzEpzjLNC2ozx3/m4I/FIKrk9N7ltsueaEKn5/0LkEGJUFv6fbv+t4hnhA0RP+0yDRdyqWdqjL9Pj8pGAxuHLi1bXfE8+j1CUIAME97Hedfp87F0vIvSck1EGlcOkIXCJ22ryKzSY68Fu+gsyX5QjSM29A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 by CY5PR11MB6367.namprd11.prod.outlook.com (2603:10b6:930:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Wed, 28 Aug
 2024 14:34:13 +0000
Received: from IA1PR11MB7824.namprd11.prod.outlook.com
 ([fe80::71b1:fad1:6598:f147]) by IA1PR11MB7824.namprd11.prod.outlook.com
 ([fe80::71b1:fad1:6598:f147%4]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 14:34:11 +0000
Message-ID: <67b55532-3c64-4eb0-ac3c-3f840f1f8f55@intel.com>
Date: Wed, 28 Aug 2024 16:34:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] runner/settings: set PRUNE_KEEP_ALL as default
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Ewelina Musial <ewelina.musial@intel.com>, Helen Koike
 <helen.koike@collabora.com>, Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Rob Clark <robdclark@gmail.com>
References: <20240620130216.85074-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@intel.com>
In-Reply-To: <20240620130216.85074-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: ZR0P278CA0053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::22) To IA1PR11MB7824.namprd11.prod.outlook.com
 (2603:10b6:208:3f9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7824:EE_|CY5PR11MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b01df64-a863-4a46-9f86-08dcc76e7a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVZnY0NRcm1ZRnVsVTB3d09OemdBeHYzc1V3QWxjMGdvMlZkajZwV3hNKzZh?=
 =?utf-8?B?NjJhUHAxNGF0YTFPUmZHcFVHQkZyNG9FYk1wMjBIOUhRRThRd1VBUSsySUFX?=
 =?utf-8?B?NjQxb3FSakE4Q1JFVUZRNVNzY2NOU1NwcVpLRWsvbVl4c2dsVURWdnphbVJC?=
 =?utf-8?B?eEFwbkNMb2FhNkJIL1Y3STVvYi8va0k1a3JZenZRK1dHQU1VbDhqanhUZXRT?=
 =?utf-8?B?V0EyUnJpeDVhRWVBUXoxN2ZuZEZwUXEzTVRtNWowdjNrcjdjOGNwTVk2bk5q?=
 =?utf-8?B?bmpYdGlSRFZSMXBvQnJnMEhzTVV3ckJaN3hPbDNwYm5zVnI0c0ZUcjl6bm5R?=
 =?utf-8?B?enFYUWs5SlhoTVNaY3BsaDFhRGlIRmV0Qzh3Mi9OZUZSL2RYd2JaQ1BhcCto?=
 =?utf-8?B?S211TUlSYUNXRGcyQUQ4SmdlS2d1T3ZyMnFmVHRZZitLVTRjdWZ4RFNicFZo?=
 =?utf-8?B?UFFhNlFneWN4WC9FNTVZYk13dUJrQ1pUeVlVNE5RNnFrd0Uvamh3UVZ0U3li?=
 =?utf-8?B?TXhNR3hIRTdyNGZKWnExbzlFbGlrd1YzbktkWFp6ZG9zcjBXUUhGY253ckhH?=
 =?utf-8?B?ZEFZQW5yS3QvclZtbWRCdmZPRU5iYmVVMS9Xc3BZL2FxVXFod2RUNWdBRlZw?=
 =?utf-8?B?ZHpGL2JvSW8vNkpvNVFqVERhSUJFcEM5K0hmTkhBeTFib0hPVTBsY21adngw?=
 =?utf-8?B?aTI1ekFvZkZQRDVLQUNJSXg2aXltem1vSEJMTE1YeWZBWnVtRzBJNjVoQzA0?=
 =?utf-8?B?ZTFjUFRjMHRuK3J0elNJRm5RUldGemk3RkdkVStnbHkwTjB6bmU0bjcwalQ4?=
 =?utf-8?B?UHIvcUc1RW9sMTU1SVhrWENHTi84RXZSSTlqeExsb3VSUzRzKzdBVEdydVVz?=
 =?utf-8?B?LzBXL0RXM1BSWHBVbURFZjc4cTdPSWNyR0w1eVZZT0x5dExnUXpBT1FGQkFR?=
 =?utf-8?B?Q3pMbUsrUlZRU0ZlMGJoWkRCSGRUeGFPdHlhcFlSS1ZoZUJMRkw1ZXJzTUhr?=
 =?utf-8?B?L3Z1ZFJXQWpLMEUvQU5CdW9BVjNGa245WCtlRXBzdm5weTJRRzVHWkV2eXpK?=
 =?utf-8?B?U1ZZd0lVakFmZmJITU10QzJRdk9EdC81Z1JNb2J6cnVTOEhtdkUvRzNjUzFE?=
 =?utf-8?B?TUI0ZUttQ0grbFVVR0VPTFkwY0QzRWdqRisyWUhEZDhldzlPbUxzdjFOV2dn?=
 =?utf-8?B?bHBDVlRXRDM5MFp5cmxWTzZBcFNMbjRiZTkwM1N2Tit5ZDFHTGxDOFgzckl2?=
 =?utf-8?B?QXJvZERSSDJZWFJUYUtVdW95YlpnRHozN3JPaHNBaURWb3VpeU9wdGRna21S?=
 =?utf-8?B?SGdaTmdnTjlpeS9yNzBYRVRGNlRqanNsdEZFQXcyVlFaVXZHOVREbmduSVQ2?=
 =?utf-8?B?Sm1xRzlSd0NIczFRbWRBUHIwVHhFMFJlL0IvVTB0N3dVbmpuK2dERnJDclNG?=
 =?utf-8?B?bTRJd3Mzb3BJeUVpU3g3YndzcDZMZ0cyc0JLSXBaZWtrb0ZJTEo2b1orWUZD?=
 =?utf-8?B?b0NUVUpLYXRiUDhOdVBqc0NKUUEyM3lFb1NNL3hmNXhqdm5wUHFPdG10Q00x?=
 =?utf-8?B?TFFJQkNwdi9YSmJrUjduV010dXkyaTYySk9EZjhFd2dYc2pWdWlGbXJxWk1p?=
 =?utf-8?B?ZHZvNFdKT0g3cnVPSGZvVURrcDNzaXovN3BxU2dEVGZXUjFkUFVxK1FYZkVZ?=
 =?utf-8?B?T2d4SGJyYytaRVRhQnRscXEwVkxTRlp5NnFVVWZUTjRnYmNTaWN6NlQ2aFhB?=
 =?utf-8?B?a0VrdGRiWEp1WTZqYWpwczZXY0RXTW5qMGkxZVR0YXg5TmovZFdtU1RVVU9V?=
 =?utf-8?B?Tm1xcUJpb1phbGZucE00Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OURNVDRSbFRORmdjRlg5NVNNYklPMENSaWFTZ3ErU1hqa09saVJGNURnZXBL?=
 =?utf-8?B?U2xGRWdrODRFSEtxa2NOZVAwZ1FNUlVzMmswRUpEK0I4b0J0TEJHbEJEUHJQ?=
 =?utf-8?B?KzF6dnVjZ0tHNDh3UHcvT3QwcVlSbGZ4MXhhdXF2anByRXVrTHU5eXJPVGsz?=
 =?utf-8?B?Q0FBWWt3NEczWFN4TzFLclQwSExuSHdDYXRTbnRLRVYrV3pHdGxHUVI2dngy?=
 =?utf-8?B?RjlkbjQ4RGtrdkphRFRXNjRSVjM1VWNtbVNGQWhFWWVEZkx4dGZLMEQ4YU9S?=
 =?utf-8?B?TkxnWjg1ZnlOYnFpSzFkbW15c3JjdmRCWDdlZWI4R0EvbUxVSE5XcWhHcTdO?=
 =?utf-8?B?WHJLKzlQK01XUjhSNkVNOFhBeDVybVJrVkJLNklBWVVkTkZIdmhWWTJnbVpz?=
 =?utf-8?B?Q1AxYkhPaE5IMHBFRjhSY3NXZEtWclNHRWJ5WUNIZ2RQTHNSbzNDMmFMZW1u?=
 =?utf-8?B?dDB6ZVhWY2w2OVNGVUxwaXJtQXFXc3pNaEJnUXA2UEtWL21YaG0xRm45NHJV?=
 =?utf-8?B?N2dmWWF1ZmRsU3p2WHZXNWZ2UmhoWnk5TW5ya0xUQ1k2b1FQSmkyMkZzcjRa?=
 =?utf-8?B?MXRmRG9XUFhLSzV1UVV4SlY2dkt3R21UZUphNlNSek1Xd2NheUJWM1RTcnRU?=
 =?utf-8?B?TG8yeEo3enNsaUN6NXl6TkY4UHVUL0dGQU5CSnRwb3BvMXArMzFqN1pGSWIz?=
 =?utf-8?B?d1JQazh6dUFUamN1dFp2bEpJekJCMSt6L3RPQVVwWkZ6OGx0WEY5R3JqU0wx?=
 =?utf-8?B?KytOdnp4alplNENzWjd6eStoNFVqT204WmtrMXlWSEpFRlhvcGJwOTI0bmRW?=
 =?utf-8?B?YjdabEJZQzlaejNOTmtwK095azNBZVV1Y1ZRWmhXdnN6bVZqby9NVXVoQWVN?=
 =?utf-8?B?UStzK0lYSGZ5KzFrdC90czM2WTc4VWhubVErZTh1aWt4cUYzYVVJT1YxbHJu?=
 =?utf-8?B?Yk41U0pOTkRTb0c2ZXMzaitPNjNxREJaeW5BR0Y0eE8ydVI2TFREc2ZxYmVP?=
 =?utf-8?B?ZTNYM3ZBRGhMUzVxUGZybEJ3c1dtcTQ1Q2dmS1pLbVQ2M1BQWCtWQjh5b0Qv?=
 =?utf-8?B?akRDd3BOWnV0c1ltRHZ5WCtrdkcya01RTW5xbm9RNkEvNDdPRXhpZnF3MkF3?=
 =?utf-8?B?K2RRdTF6ampab3doeUg2Q3RPek9QYk1QZ3RTUU5nWTh0M2FxaGtGR2F5N1NS?=
 =?utf-8?B?bmQ3TW5pOXJYMjhWRCsyOE5uYWJTVWxSRzdNNWR2MjFHdEV3dGo0bERIeGhY?=
 =?utf-8?B?dTc5Y3d2NWQ4QUtZb1ZMUkZMRXhEeWtjendqTWtqekRTZStNZ1A4Mnd4TTRi?=
 =?utf-8?B?SFp5VVpvVEVEN1dMc1VqY29vdkNMU3RFdXZMaWRUTEtjTEFualZ0T2JRQU5q?=
 =?utf-8?B?RVNBYmdFdmIzOGZ3cE5CRjdWZFUvb2lrMG8yanZxL21YQ0x0clZLUW5NOXcy?=
 =?utf-8?B?YzZtM1h3MnJMUVF6aW9sUGVnVFRwd2hMSEZLZER0MDFIbVN4a0JaYnBZTG1D?=
 =?utf-8?B?ZnQyWmRTWTZRMU1oOTZERlhLbzA2LzlQdGZVaEZjUG1xRmptby9qMG14SHBy?=
 =?utf-8?B?d2xqWkRLRDBCS3p2MnByOG53QjFWeWdkOXhib1lMQXFqMDJVNFBpSmorUk15?=
 =?utf-8?B?REo0RUpQbjVjamdTdGMxYzVvVkpvS285d2VqamhkYjFkWXRZbUhYcW93ZjU4?=
 =?utf-8?B?ekJqMUV0SElpamRXaWNMVDU2UzB0cUhVYUltR0FmbXRlZWt2WGFkSVI2TVlr?=
 =?utf-8?B?RDVacENZbVduQiszUUMrdFVpdk04UjEybzJuT0JRbUR4OGk0dG4xbHNScmJN?=
 =?utf-8?B?SjFlekUvdW4xZ2RkcWhlUy9DTitmVE9xa2J0cklvbjRLdGxwMnhOVDFmVWpW?=
 =?utf-8?B?WXZVNWZ3V3F6VThvZFZFdDJJWXUySkMvMlRsbjJPUUFjNXprQXRpeTFQRUhD?=
 =?utf-8?B?cWtLbmJCVTdrYXlvRlcySW95bFVUdHRwVGFPb2Ftdm5FY0QrY2UrTkNQOEJa?=
 =?utf-8?B?U1dwd3EyNE9qQ2U5TENwcGpRRGlBK1ozUG1IcG9DNnRjaXVzM3p5T242c01K?=
 =?utf-8?B?YzA4aUNBVkQ1amtjNXhGT2NVVldIb1dISWxmcFpjOXRMS284UWtReFMwQ2Vu?=
 =?utf-8?B?dmwyeVJEQ0RQZGFzQkYwZkVWZkhKdDltQVZqdllzb3QyaG9GeUFxNkVsdVEv?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b01df64-a863-4a46-9f86-08dcc76e7a48
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 14:34:10.2054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYnwjlJcAsdlEm9gn/spakgf86P4Q4ZNHKWLq2PKOa1Ld8owEa7hqYsTO9aSAC1cITriZGfF/HPizeC/avqMsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6367
X-OriginatorOrg: intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Thu, 29 Aug 2024 08:24:39 +0000
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

VGVzdGVkIGJ5IGNvbXBpbGF0aW9uLW9ubHkuCgpPbiAyMC4wNi4yMDI0IDE1OjAyLCBLYW1pbCBL
b25pZWN6bnkgd3JvdGU6Cj4gSW4gdGVzdGluZyBkcm0tdGlwIGl0IGlzIGhlbHBmdWwgdG8gaGF2
ZSByZXBvcnRlZCBhbGwgdGVzdHMKPiByZXN1bHRzLCBlc3BlY2lhbGx5IHdoZW4gb25lIGhhdmUg
bWFueSBkeW5hbWljIG9uZXMgd2Ugd2FudAo+IHRvIGdldCBhIHBhcmVudCByZXN1bHQuCj4gCj4g
Q2M6IEV3ZWxpbmEgTXVzaWFsIDxld2VsaW5hLm11c2lhbEBpbnRlbC5jb20+Cj4gQ2M6IEhlbGVu
IEtvaWtlIDxoZWxlbi5rb2lrZUBjb2xsYWJvcmEuY29tPgo+IENjOiBKYXJpIFRhaHZhbmFpbmVu
IDxqYXJpLnRhaHZhbmFpbmVuQGludGVsLmNvbT4KPiBDYzogUGV0cmkgTGF0dmFsYSA8YWRyaW5h
ZWxAYWRyaW5hZWwubmV0Pgo+IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+ClJl
dmlld2VkLWJ5OiBQZXRlciBTZW5uYSBUc2NodWRpbiA8cGV0ZXIuc2VubmFAaW50ZWwuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4Lmlu
dGVsLmNvbT4KPiAtLS0KPiAgcnVubmVyL3NldHRpbmdzLmMgfCA4ICsrKysrKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3J1bm5lci9zZXR0aW5ncy5jIGIvcnVubmVyL3NldHRpbmdzLmMKPiBpbmRleCA0MmQ4MTM3
ZjEuLmVlY2FkYWY4MCAxMDA2NDQKPiAtLS0gYS9ydW5uZXIvc2V0dGluZ3MuYwo+ICsrKyBiL3J1
bm5lci9zZXR0aW5ncy5jCj4gQEAgLTI3NCwxMSArMjc0LDExIEBAIHN0YXRpYyBjb25zdCBjaGFy
ICp1c2FnZV9zdHIgPQo+ICAJIiAgICAgICAgICAgICAgICAgICAgICAgIHJlc3VsdHMgdGhhdCBh
cmUgcmVtb3ZlZCBmcm9tIHRoZSBmaW5hbCByZXN1bHRzIHNldC5cbiIKPiAgCSIgICAgICAgICAg
ICAgICAgICAgICAgICBQb3NzaWJsZSBvcHRpb25zOlxuIgo+ICAJIiAgICAgICAgICAgICAgICAg
ICAgICAgICBrZWVwLWR5bmFtaWMtc3VidGVzdHMgIC0gUmVtb3ZlIHN1YnRlc3RzIHRoYXQgaGF2
ZSBkeW5hbWljXG4iCj4gLQkiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdWJ0ZXN0cy4gKGRlZmF1bHQpXG4iCj4gKwkiICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdWJ0ZXN0cy5cbiIKPiAgCSIgICAgICAg
ICAgICAgICAgICAgICAgICAga2VlcC1keW5hbWljICAgICAgICAgICAtIEFsaWFzIGZvciB0aGUg
YWJvdmVcbiIKPiAgCSIgICAgICAgICAgICAgICAgICAgICAgICAga2VlcC1zdWJ0ZXN0cyAgICAg
ICAgICAtIFJlbW92ZSBkeW5hbWljIHN1YnRlc3RzLFxuIgo+ICAJIiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGVhdmluZyBqdXN0IHRoZSBwYXJlbnQg
c3VidGVzdC5cbiIKPiAtCSIgICAgICAgICAgICAgICAgICAgICAgICAga2VlcC1hbGwgICAgICAg
ICAgICAgICAtIERvbid0IHJlbW92ZSBhbnl0aGluZ1xuIgo+ICsJIiAgICAgICAgICAgICAgICAg
ICAgICAgICBrZWVwLWFsbCAgICAgICAgICAgICAgIC0gRG9uJ3QgcmVtb3ZlIGFueXRoaW5nIChk
ZWZhdWx0KVxuIgo+ICAJIiAgICAgICAgICAgICAgICAgICAgICAgICBrZWVwLXJlcXVlc3RlZCAg
ICAgICAgIC0gUmVtb3ZlIHJlcG9ydGVkIHJlc3VsdHMgdGhhdCBhcmVcbiIKPiAgCSIgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5vdCBpbiB0aGUgcmVx
dWVzdGVkIHRlc3Qgc2V0LlxuIgo+ICAJIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgVXNlZnVsIHdoZW4geW91IGhhdmUgYSBoYW5kLXdyaXR0ZW5cbiIK
PiBAQCAtNjcyLDYgKzY3Miw3IEBAIGJvb2wgcGFyc2Vfb3B0aW9ucyhpbnQgYXJnYywgY2hhciAq
KmFyZ3YsCj4gIAlvcHRpbmQgPSAxOwo+ICAKPiAgCXNldHRpbmdzLT5kbWVzZ193YXJuX2xldmVs
ID0gLTE7Cj4gKwlzZXR0aW5ncy0+cHJ1bmVfbW9kZSA9IC0xOwo+ICAKPiAgCXdoaWxlICgoYyA9
IGdldG9wdF9sb25nKGFyZ2MsIGFyZ3YsICJobjpkdDp4OmU6c2w6b21iOkwiLAo+ICAJCQkJbG9u
Z19vcHRpb25zLCBOVUxMKSkgIT0gLTEpIHsKPiBAQCAtNzkxLDYgKzc5Miw5IEBAIGJvb2wgcGFy
c2Vfb3B0aW9ucyhpbnQgYXJnYywgY2hhciAqKmFyZ3YsCj4gIAlpZiAoc2V0dGluZ3MtPmRtZXNn
X3dhcm5fbGV2ZWwgPCAwKQo+ICAJCXNldHRpbmdzLT5kbWVzZ193YXJuX2xldmVsID0gNDsgLyog
S0VSTl9XQVJOICovCj4gIAo+ICsJaWYgKHNldHRpbmdzLT5wcnVuZV9tb2RlIDwgMCkKPiArCQlz
ZXR0aW5ncy0+cHJ1bmVfbW9kZSA9IFBSVU5FX0tFRVBfQUxMOwo+ICsKPiAgCWlmIChzZXR0aW5n
cy0+bGlzdF9hbGwpIHsgLyogLS1saXN0LWFsbCBkb2Vzbid0IHJlcXVpcmUgcmVzdWx0cyBwYXRo
ICovCj4gIAkJc3dpdGNoIChhcmdjIC0gb3B0aW5kKSB7Cj4gIAkJY2FzZSAxOgpJbnRlbCBTZW1p
Y29uZHVjdG9yIEFHDQpSZWdpc3RlcmVkIE5vLiAwMjAuMzAuOTEzLjc4Ni03DQpSZWdpc3RlcmVk
IE9mZmljZTogRHVmb3Vyc3RyYXNzZSAxMDEgLCA4MDA4IFp1cmljaCwgU3dpdHplcmxhbmQK

