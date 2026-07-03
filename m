Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B355C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7E810F929;
	Fri,  3 Jul 2026 21:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UaIwLih6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE3D10F92C
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 20:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112364; x=1814648364;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+5JcLKIFLQcYIeYuJyhP1KQV3Z/4l2Q1CE6mM0RCv08=;
 b=UaIwLih6HbvKiukYdhPmtoJVkZhd8pSrsyZH3juihwfVESA6Y08k+Ji2
 aeqVap04ggDzzTl9tb/EGkuI/QVUml9Epxz+ojmHOYM8kh8pgbVA0XDOU
 Dwckgs9o7+g17AnLSWwMzYHoQag9D6uwci0ThejLK7AWY3lUnVmyryqJ3
 BPZDT6Kw5ZZQPisEr/Bi3YCgnLCdoNUmRb7nP7vFWMszYfN0245pBlegW
 WYZM/iEwsEK5rmih3EFls3B5hY23JYn9VlqBOxb9GbbzzwylM/jncgXxu
 Id4FnSdeKJnRDSozXfjlL08/moTDh81JyKp1JTaBCCdgijiUcTNZBlYsW A==;
X-CSE-ConnectionGUID: wdUp5aDwSpOcJdSZHM+F+g==
X-CSE-MsgGUID: YCU1XAmWQ5a7uteP9BLxPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83637564"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83637564"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:59:24 -0700
X-CSE-ConnectionGUID: 3g5qy+bhTqChlov09qAqgQ==
X-CSE-MsgGUID: FfXphPOKTASM0//6U7vtqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="248735024"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:59:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:59:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 13:59:22 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:59:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8VflHf3sh/skhRep0E++1cITlDCKZZXLhtohbRPIu4QW6f+t23524GttEsl9EbMaE+mApi+4lTjAhkrEOtxqcnGG6GdlEdXfL9hwQdIF2krhbc0fjUqHXDFS1qIxcxhA+IxMoRuBnZnHzdLPHvkMVpBhKmUEzyv6y5AWnaifqLmZGQgwTLlDmCWPvm7Q/zzaQBnr4KkdgaKbc24Vbn+MM9WeDTU/URZzaf7EgNBD/qjmpp3vOn4mdTr/TNdoPVG5ygar+TMYK+xq8K85cfy/j/60YEta6nAGumlCyuyyq4hOYHrHT10mDSGLTAy/kcj5ss/Kf1NC5xjtwyDyg13Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3z8yTz7214HmtggzYFSQewCrfOk/d+1r+zT7HEQZjsI=;
 b=I+95zetGVIMGO8FYs4Je8A3tmSuMgvAtO4lqhn8f/OK4uUX+hZpplTO36540Suln1ArejZXodeK7Qlq+K1XbkF0Dgg4pehN0TkIJBLaiAoRjAykcyIxREKQpv0PPrFwAyakUQD36gx5Nf0w8Uw6p9/Meshi3B51wjI60f7sQWSjaWQ5MYuufeF0JrwhYSVDqq3XcnoZ2XAl2p66Q/GYLqJ4wh31ZHyoLqZlF0EbRDJEclUGXBJfcaXEoa46EZCZiFhPYRHzn8zHBxdxBTcmrGAW+3R0cjRZkk5XsXtfGyzN3IkKEathBjpLZ1au4LrLnpt8Ix3HsssB/+esnKNASdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 20:59:20 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 20:59:20 +0000
Date: Fri, 3 Jul 2026 22:59:14 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 11/31] lib/intel_mmio: introduce
 lib_igt_reg_tools static sub-library for tools
Message-ID: <jahxcgpsj6vn7q6bhcoucpvsnozoo6gvbypfzjvv5gmfbn7qt3@mmmaexp7frac>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <7e226059260f0ebed3806fbedd78b30e56ded955.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <7e226059260f0ebed3806fbedd78b30e56ded955.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DB8P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::28) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH8PR11MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5bed6c-de79-4a81-b614-08ded945f3f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|23010399003|376014|18002099003|22082099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: fvwKTjf/fCYHpluB59MUdQ1+hVA/XSm3sNuXQMRusCWGRmfF2sBtkd29Xn3FXqiBRtu1SuqSXCTdKWLAaX6me3IDHIRD5w7Iv0dwMATJ5IJIxsj65v/8OrvkuMUdXVZKP8e7q0jgl4tgi9ANmMznyQ9k8tSWYGBMUnKsVVhh2L5Tkf64p4ok0p2KN7gD/ND5YfTWieQVDXMIynAifEVy6YG6k5UckQQzzGOiSV2sxpl9Q4i+Rt/5wbaxqwR22TdV3ueHpKESwluscECrsAxAOi9wYX1PlafmvhBBS6UOGEjaoZ4EQv4Ul2xZajhGBPBvLI7KL51gUDz49CF9aW4/j83u2wOjo6kxYoJ52Vhu+Fs0I7hQLbfvsHpAgp5Kr2WHeMjQ+6Dolarfh8YJx9q53op4xbx1M5dKSykmzp8U59DE/SP1QKpqMaSOUetymPveDzU5pWUjk62c1XLvYi2RrNksUggkTpl9lUbYoe+LL5EVvaGNZerUI+uMnOo1ILh/PvEH8k7CGAcAtmfNLWqp+ds4gjcXqLpjLMr/7YWXv/BFjqNYCYGSeqjdgmaCDGYmqQrOKfY+z1uf5AK8HjNUnIy0jAdZIYqv889k0NZa7wHOtmWYNnaSKXOo86x+EhbspjePvU0vl2Vfszr4o951O3pcpfJtEmOrWXIT8WaGxQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2lDbERUdmRzNFZYYVlHWUNtcmprVE4vWHZVREtYKzRldnV2ajJkKzY4dWFl?=
 =?utf-8?B?VXQyTG1STGtoTHNTclZEOHpyMHovQyszM3NyVFU4YklZK1ZYTnRBcDFDN2Zi?=
 =?utf-8?B?eXc0Y0hDVjl5MElycDlRai9pZzB1U2Y1ejV2M3k1RlVCM0M4U0RtVWR5RlJi?=
 =?utf-8?B?akR1Ym5nYlc0c0R1WjlMVTQ3Q1hyd2lMNkI5aUcrcjJReVN6MWwzYm5UM3gw?=
 =?utf-8?B?cEVFajh6Nk15aHVWKzRIZHRNc1lHNUtoOXEwcVQwb3o3RHdoQXRUbjlRWmY0?=
 =?utf-8?B?cFV0R2lUeTdQRldLN0dwMXVka2JuS3VSMVlaRVBybFZqS2Y5Tkk5TnJWdEMy?=
 =?utf-8?B?bXVGYmtHbldXODRQUnA0TmlUd3NHRlUxKytjbGVOMzBqTWVQOHMvMGFqdzVq?=
 =?utf-8?B?T3JSbmN4Tkh0clBDY1p0RUZ3VTF2eWI1R0U4UEtCbCtkU0xkY3RwajZRMVZZ?=
 =?utf-8?B?cXFxZXpTRGtOUE1sVkVlWmNhMHBpQW1GS2lTSlhyQkVjK0cvQ3NjYVMyS1I0?=
 =?utf-8?B?M2NSK3ZzVnlwMWM2eUNZcUxCL0dGRlRvbFFFOWh4MlJFNFZFdFZUUFY2TzM1?=
 =?utf-8?B?TTlWOVdESHhWSVhpQTJZVzh1U1FqRzB5cHJMTHJTR2tOS0IzTlhHVi9tK09J?=
 =?utf-8?B?Z25qbFh2SWFxVlA3eTJiZitHOG9TVEd6LzB4SzQrMnlOUkFJdmNHRXBpalJJ?=
 =?utf-8?B?RzN5ZGpUWGJGcDN4cjd6MjY4cjhNS3BWSUEyVzZwRWFOOTJwWlNySHVESzZi?=
 =?utf-8?B?bUZLemNldXJZQnl5Yi9nMjdtekU0ZHdUcmJHUmxWb2pHeGhJUlZBZjR2bFJh?=
 =?utf-8?B?bS81LzNIQTNETG45eEM2R2gwZ2tjNHVRN1hJbHZ6aDR6M1k4SmVTbFVIQkZW?=
 =?utf-8?B?YldQYWgwQytLZytqY2VwSGRJczk3dzdsbEwydEthMGd2dUJrSlVwSHlFRDJx?=
 =?utf-8?B?cFg3dVVFNXR3MXN0Umc4V010ODVkNjVhN1pxemorR0VGRFZ6ZHVFeHBQaUxB?=
 =?utf-8?B?K0Z6UHN1UUpYZisyb1VTN25GWDlaV2VQb1VLVFNtbkhWRWtRL3BYNnV2Nnh4?=
 =?utf-8?B?c1pPamVaNVF5YWExUzFVSVVjZHl3aFNmN2FnblpHRDYrWDdvMDNtZFNmbWxX?=
 =?utf-8?B?eFk3bktjbHoxdTFXcTNHSERYbml3aForNE1yNytOQjNtcHlUVG1lZHFGSkdp?=
 =?utf-8?B?blMwUjFwUGxWVWRlVkhrM01zbUJXMmZ4ZEd0SVdyNENjSUJYT1pQS3V5cUFl?=
 =?utf-8?B?dktBR3VxRzFNckIvQUVFM0pJTmJpdTNsNEZrZGU5R0JzaDFHdGhVQkJLV1I4?=
 =?utf-8?B?NWJLendRZEF1TjBIQmkyQlQyNk1XTlM1R3VLbWlZdm9EQXdGNHpmTmVZWXVm?=
 =?utf-8?B?ZGhvVjVXL09nN1AxN2NKVGlxa3hLTDVLZGtBcVYzVStJdlV0aTdYSTVCMlZx?=
 =?utf-8?B?c2FUTi9XNkF0cGd1blFVVmVSalZpdUpHSnF4TXhYR1QrRUF4bGFnZHBXdjVy?=
 =?utf-8?B?T3RvTnd0ZkpjZ2N6SjFKdVJaZy9Lbk5YTnA3dENpcEw2MXNJYjByOEt6TEpF?=
 =?utf-8?B?K1VoZHJOOWppQWtITXVXTngzdDdSUmRJTG1Nay9wV3RROU0xaHVvTXFCOGRk?=
 =?utf-8?B?WXY3SkJJVzJ2cXN5QldlMGRmQkNhN1NZNEViZ25HemJlNmZJMDhsODhhTGZG?=
 =?utf-8?B?N3pxbXNvS2pnNVRPZkdySE5IRVZ4RXJpM0paUUxEdmdtR2xYT05Ncmc5dmhH?=
 =?utf-8?B?Ykk2a3BIdU10Yjl0OW9EZFdmRHpVRjh1dUhESXlTZERjYUZCSkhVL1ltR2RQ?=
 =?utf-8?B?S01ITUszUGd1WUJCK3RSalc1aGVDVUIzbXJTTUtvYVh1dWRtQThxem5LR2Fx?=
 =?utf-8?B?RGRsMjNqM2pQdzUwMTFaTlFsWG81S3djTWNEZ0lUblZBc0JJbkFJeEcvKzZs?=
 =?utf-8?B?aGtrNWNKZkNLMU9XYXhCUzgxTkU1QVdJMWsvUkl1ZUZhOE9DZUk3YjVZL29s?=
 =?utf-8?B?QUozWm5sOEhQNkJZSFFGZ3BEMGxlZ0xKc1NBRzdPQnNuc3ZVMTgwYW5BRjRI?=
 =?utf-8?B?bVRBSWFkUDhFWnE5SXRWY24xVlhmQUI0L3AzVUFvUW1BQkk3RFZUc3hPZk1P?=
 =?utf-8?B?S2VtZ2tvYUEwdVdGUEF1aVJ5UnhkeTFGV3ZFZ3pFRmdvanRrcTNVOFI2aFVR?=
 =?utf-8?B?d2k1NFVTMkF0YVlxMXhJQjh0TVNZMjE3eTZ6VGcydytIY1NVdHFUL2dnRVQ5?=
 =?utf-8?B?VEJvbmFZRGNpTTJnbmZHOC9DTGZvbWVMR0R5b1JtQUsrVEdQR05mbE05ZkRZ?=
 =?utf-8?B?T3BDa0ZFSUhobDNpWG5tUFFiS3VIMGNzdWphM3QwT0o3dDhnalpEYUdOL25M?=
 =?utf-8?Q?NdOdPHevXq2efEJ4R5QLBJPXMnqbOA3DB19QAhW2DqdwN?=
X-MS-Exchange-AntiSpam-MessageData-1: AcBoZKS0iztSPfE7V74p9GuZa709hJ7lsI4=
X-Exchange-RoutingPolicyChecked: Ehpi1MDwFrI2y6iAw8mAsEy/HgScLpwo9iXZAgrKQ0NVsYimlH9vw72DoQE6NZ9T8Nc1iP2rpgWtd/D9GzQr4ZTCytXvgMT03vtulAHfzVTI7m1MXDmeg3RSvzNCxx1ldEAsHpxmCCFmUMN+CdQLi3gi/I/BYQ9Q5SOtz1+UShMSHZetHbuXj1KNXhKP8dtOeP11HOb2gYUjawHBBVnBA7qxYuqBI2suchxUYJDRd+KpYIih8jyymPTLgRw4kfP0V4/u3dr/+1b1/eXxvW82VMafSndwZ1TFql+HI5PAT0FuCt0SBzige1m/vUWMLBfUrFcRDwl/GTpZUPYfXbmb0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5bed6c-de79-4a81-b614-08ded945f3f8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 20:59:20.2981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mS+4zTEtfZcU8A7p66R9PhfXkc9jyumVIGpkIvX9CkUIpNhjJ6o4vfvIwY97e/ECsZz1/3FXPdPh+4jwFwzAEU5UZBebDHIvPf1mvi/LL9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8107
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

On 2026-07-03 at 16:28:45 GMT, Sebastian Brzezinka wrote:
> Add lib_igt_reg_tools built from intel_mmio.c, intel_reg_map.c and
> intel_iosf.c.  Tools that need register access (e.g. intel_reg) can link
> this library without pulling in the full libigt.so.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/meson.build | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index ba4ece3a2..43ae4ce66 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -435,6 +435,21 @@ lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
>  				                     lib_igt_tools_stub],
>  				     include_directories : inc)
>  
> +lib_igt_reg_tools_build = static_library('igt_reg_tools',
> +	['intel_mmio.c',
> +	 'intel_reg_map.c',
> +	 'intel_iosf.c',
> +	],
> +	dependencies : [pciaccess, libdrm],
> +	include_directories : inc)
> +
> +lib_igt_reg_tools = declare_dependency(link_with : lib_igt_reg_tools_build,
> +				       dependencies : [lib_igt_chipset,
> +				                       lib_igt_tools_stub,
> +				                       lib_igt_drm_stub,
> +				                       pciaccess, libdrm],
> +				       include_directories : inc)
> +
>  i915_perf_files = [
>    'igt_list.c',
>    'i915/perf.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
