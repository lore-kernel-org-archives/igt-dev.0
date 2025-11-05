Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A17CCFA0D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 10:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6705510E6FD;
	Wed,  5 Nov 2025 10:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hn7fZAh9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6826F10E6F1
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 10:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762339587; x=1793875587;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dCFyFtiAP82O/zSNnOcmosH+PGVqYGv1ByOYrX2rQeY=;
 b=hn7fZAh9UWuoSNNIt28QuPjd5X88aRfa4ZhWoIJ4UmCjwZ1ppFUmmw1H
 l93K9w4OEiseTUhVlaUn2RGC2MLA3c0OBk8hpuiZ+fr/ng1tfOMwrO6oP
 tuu3eGXAUf1Yy2bBDXEoJkG5lncjzVMmZ8oiFY4AWQ5ZTtcccWdf71ARi
 CLGTxAshmKA6sDxDwMXcWhRC0/FV/TAAZAaDE57otzU5Q32ArFXDyAQ+6
 Cen7xmKDAEsFjpjFcRYcJTeddJ6IQDklt0j289cfPs9dlvrPvdoVLHk7E
 6XrGdKS50DzuxwMwb4tjWKVr5+h1M0/PSxVH6cuQTPnpMDJwxo/PigBPj g==;
X-CSE-ConnectionGUID: 3wmxM+ZWTjySKucAuCpBYw==
X-CSE-MsgGUID: 1UVDqOxlTpOO9kARpzdpwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="82077688"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="82077688"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 02:46:27 -0800
X-CSE-ConnectionGUID: tEydrBe1QISUfBWuWOhW8w==
X-CSE-MsgGUID: BVT3D8u9QKCqDh3JyTO2Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187874175"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 02:46:27 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 02:46:26 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 02:46:26 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 02:46:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEOp9smh2kptiAqA150X3LIOaWk/8un1jEPuTm8spiueqefVVqv1D8IUGD+ghORpuBKLnFKrTPgemYzEq8rve1a8Fxc5oyykZsqCwd5+7ubSZwlbxUZOkUDPKtcwwssRBVZE3zRyUTQfB03Bk8Tw3QYVq7HFHmpXi6W820VqZpJJF12hhHNYX5doE90z2+sIq8LkTyc190LJ3SS9JLxsU3Yful8kKHQa9J06U3bhIMVfrpfR+uT6pRSYpJHCKtx1kgosGlrK9H9dP0WA9ku/5khpiL6peLsAtmteLP6380smbmyCIZUC/o7pFcdz70S0hSIHtTD8MOg5MWcetBuVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p50Jvr57OWcwEcUFKDjP02LJfxnaHSOr40VXz6+zoJ8=;
 b=Wyc/2QyRYGc6cCbI0P4hXYZUf4jtPPOPrbYAqDJCc8RMNrm+FlLqKuoOuU7ueWVKQkD3qKcBcy44CFu7v/9unnnq0LzdEF2PScKFFEMKe82z07/fr7w3rHltbRgYBQdsh/qfR1tNzEQmoCDGc7riCRpn/tkchpYkcpqmfSPG0+9Wr9QvnhnetD/t86rAh1/RsMxt9yjbSNOEa9ohS+IDQ5wnlNuNJmMVn0LHvaddAGylL9ykfB3jafZ3COzxqJOcvflkbszUUhH1tVVZFKOUAMyAz+iogfg7dWG6qj3jFchy9tHv/fMioTVW2m6jDqMqfFsY+4/ooTK3EAN/lWnCbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 IA0PR11MB7789.namprd11.prod.outlook.com (2603:10b6:208:400::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 10:46:24 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.9275.013; Wed, 5 Nov 2025
 10:46:24 +0000
Message-ID: <65a053b0-12c3-4fb8-a8a2-837ba8c10c44@intel.com>
Date: Wed, 5 Nov 2025 16:16:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] tests/kms_vrr: Start virtual RR test above
 midpoint to avoid mode fallback
To: <igt-dev@lists.freedesktop.org>
References: <20251022185510.1099036-1-ramanaidu.naladala@intel.com>
 <20251022185510.1099036-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20251022185510.1099036-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::12) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|IA0PR11MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: cee95647-0e5c-4386-8f33-08de1c589088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGQyYU5wSERNSHRHVExVdnc4MU8wV1Bxd2locnpENDBwUXFROGcxSlNjcUtz?=
 =?utf-8?B?UFBkNU1PUXNteGpLSExvWDN3WkdmcEEzM0luaVdmaFpncW1FQml0TnVjSi8r?=
 =?utf-8?B?cDdmQTUvalMycjdld050ZWdkbm5vRHltOEpIOUtTSFg1MkNjd2J0WXU3VEhN?=
 =?utf-8?B?azJUMEVlSGJnM3YyNTVCVlhYQVBMbklBS2JGWUNVaVYwblFrRjZLWVd5OWNW?=
 =?utf-8?B?dm9OL2xMV0hxTXU0cnBxN0NEZjNoUUxrMDFsUDlHSW9PRFQxSGgwcTVhQjJr?=
 =?utf-8?B?UXNwQjZiRmhHVWhqdVNpK2hCSWZsaTNpaTNPQ0ZRSXYySGx0K2trd00xRTF0?=
 =?utf-8?B?dWtxSGIydlVNeGMxKzlaN240R09Edk9GRW05VDJsYU9wS0JWNUNwdWdRYndu?=
 =?utf-8?B?S1A0SWVnazcxTDlrb1RSWnRRVHJQeERZcXhtYVJqNWY1cEFMKzZGcVg2K05G?=
 =?utf-8?B?dXQxaGVDaXU5cUtNR1ZCc09LVG1OS2lKNnBGakFadlFsN3IxWmtsZGpHUzFw?=
 =?utf-8?B?dk1uK3FNcUo4TDkvcEk3dTMvODBHVlhWeFBBWTJQWnphTk11WFdjS3BhbkU2?=
 =?utf-8?B?alJnbVZpeEtWLythc242bkdNWFljQ0VuVGFHWTNlL1FUaEU3VzZmekpsOUpl?=
 =?utf-8?B?UXdUaWk4eWcwV1FKQmUzckl6c2xYQXFIMDR6aFE0cnFaQ1RQQVYwT2JOSXAz?=
 =?utf-8?B?YTRPQXh0SzBsSUtpNWNVem9tQVZlVGdDTGJibWE3Z282a3lLVnlpVGJ6UHp6?=
 =?utf-8?B?dFljTmtpbEJQL3NEODVSdTlHSG5EWHJ6VUZrd2JJVklLYkhZOVMrSkVXcDZi?=
 =?utf-8?B?Q3JmWUxqZ0RFSTF1RHJFV2tHaTBoYVJGY1RIY0V6Z0ZMODY2ZTJObG5ZV0dW?=
 =?utf-8?B?MGtYSEZvSitienMxdGI0azFiUmphOVBCd1FIdVhzN1crNGM3cllVODRiZmYv?=
 =?utf-8?B?aVk1Rld6a0dEcDNxU2FjN1JSVnVtV0tYV2JJazJxUkRBWnUvczduVnM5cjNv?=
 =?utf-8?B?bkdWR0E2Q1JZOE81VUJORXMzTVIvdUg2VkdYdmorcUVqbFpicDhsNDJqcm9l?=
 =?utf-8?B?Y1ZpMDJkNDVNeGVkNnVlS1lFQWo0TUVCTUF4RGJpTmFZamhMSG42WGtvZzNV?=
 =?utf-8?B?eCtJcHluakVBMGpZMkswZDJHYm5QNmMra2d0TlMyazZzRkVBNENxZDBWaTVK?=
 =?utf-8?B?QTdVYTZmNkVhaXBBdmdxNTA1STZkNmV6S3ZETXo1dUMvRzc2bkx3UTVHZGJt?=
 =?utf-8?B?MFdTTytpRGdlZ1VWOHpWUXUzMUI2K1VPdVN2S1hlOHMzMVBIemJKZ0dqN3Np?=
 =?utf-8?B?b0liSlBhdDZpTnJ6MHVGZlF0ZFVaaHBiTDArLys3Z0ZqZWl5Mk5ra1pEeW5w?=
 =?utf-8?B?aHRGSW5WMTNCb21uRERlbmJLb0J4SDRZb2VObm4zSmM4N0pwL2N1OW1vc1Ro?=
 =?utf-8?B?b243UmIyWlNRQkRlUFJLaG41bGR3NDhYVXVtYmdDMU43b0J4b2pBdGNLUDNp?=
 =?utf-8?B?VFRTK0VFMkhlZXA1Z0h3UlBKZjZCRWR4MjJqOVNwelFLWWNoaWVLQ1d6NkF4?=
 =?utf-8?B?b0NReTRtSTVDbTV5ckRpMSs3TGczSVd0cjZyQy8veEJHajJqK2ZNUDBHY3RB?=
 =?utf-8?B?RlZMTlZMMnpQeUI5NmJCUGhFeEt6S2JsTkRsOGp6a3hLK1lRL1NJM0g0eTh5?=
 =?utf-8?B?UzYxNFA2SkZ5ckkzVlBndStOL1VRamNSSkZaU1ZreEMzK1BtbVJIQWt4QlNM?=
 =?utf-8?B?MHZSS3BXTkFzUndQMDBXdHRzUkg5ZnpvMlRqSVc3R2NoSlB1cXgxZFRkaTFS?=
 =?utf-8?B?N2EyU3d6YVJaTHFleVRmdHZhZlVYWWNCY2tjWU9NQnExWUNDcVdZb2hpTWwy?=
 =?utf-8?B?N0pNU0p3WFNVYzNkYWx1QmFjNzQ1R0VWOFhDdktjbllUZFQvSDNzbUlmMGVG?=
 =?utf-8?Q?6P6tJDJe5RWH9/NUveVByzejfmQKHmJ+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d05HS1hIQkM4ZFJYSkJsbjdoeTVxSDJ4Zmk5M2RPdmM5WnpJdjlyK2VlWkgz?=
 =?utf-8?B?aGs1NXFQaU5VTGVFdG05TEQvemI4NXFBbENRcS84NlM2Sy9oRHFTeDhBYWds?=
 =?utf-8?B?QWRNMzNwVjhIMXZUTU1YV2s1V09SenpRaUtDV281cnd5T0NmMFVvSnF0Y25W?=
 =?utf-8?B?YlA2aGxuUUxCdmRPU3dsK1ZMSGt6QVEyMElQVTVlVzB2M0Z2WS9tN3BwdmQ2?=
 =?utf-8?B?RzRSUjJDQ1ltNW5QSFh5ZnRZcWFQaVpNOTd6eHh2QU0rWlNQa3VWU0JDUVZw?=
 =?utf-8?B?WWhKK0ZEMWpvSGpQNGxYeEhjOVMxMGJBMkpZdnB4amRNd3Vrd2YyL1Rqc1lt?=
 =?utf-8?B?VEhTd2Z5Snp2V0Z5dUxZcnlGcnBpZzVyQjBhdVIvVVVrUmFnUlRSZFo0aExy?=
 =?utf-8?B?NkxWV2JtZUhDakpjMEpxNFlTdE8yNDNEaG9qbmxSVnVuTGYvRG0yTCtpb1BQ?=
 =?utf-8?B?QWVvNUVwZk0zT203MG5RZTVyTy9FeEFGM3o4dnlyMjE2K0tqNHFIT3R6cDBi?=
 =?utf-8?B?aWZCMmtkWjBEUmpMd1kxeEJseks1bng1STlqYk9EWk1RdmVuOWRaY3hLc0U4?=
 =?utf-8?B?Yk14N0s2OVNEMzVObVBsTmtMOHlFUDJxbVJoSzdxdHpyMHhGeUVVWE9sSVdV?=
 =?utf-8?B?TGhTWk13ZGYvdzlRNDNTVHMydVY4YlVIMjNPVEtlYlAvamYreU9tOUJmYnR1?=
 =?utf-8?B?aDhybWlHSFA4U3NJT0RFeDhVa0RQQnhYanI0eHVVWkxvcGtidjR6T3c3ejJ1?=
 =?utf-8?B?SVVLRUtTYkFoM0c5S3B6V00wSzRnUXpFTmtNY24yUWV4c2duVGZyaGF6M3o1?=
 =?utf-8?B?MWNxUERXRW51dWpHcWt5Y2xBaFY3RisrZ2VNUVFZWHhhYUdCY08xUXNISDJk?=
 =?utf-8?B?UDBpQnplVFZuWkVFOWg0UU9xei9iZVVEbHFKbm5taG9ST2xMNndESEszVWZW?=
 =?utf-8?B?eldVaVZLZndKRHR3dVljRUk1S2kyR3dONG85MjVlMFp1UjBYL203ZGFLRGRP?=
 =?utf-8?B?Uit6U2JtSlpxR20rdjNhbGN0RkIrQkVwVW5hMFhBMnZLeHhEWEtzV2t2QmZ6?=
 =?utf-8?B?b2pzck5Zbkt0cEVDaXorWmZQbkIwVEkzcHFkenJiZHNIN3Y4dWZZTDZjQVdU?=
 =?utf-8?B?QzJWand2cVhVQ2wxaGs4dy9pVkRUUUlQaFpmQTB0TmlpSElRSGp4Yml5d0hC?=
 =?utf-8?B?eU1WZGdDNS9xTE5SYW5weEJFcEtPdGtWQjZFTDQxTFBXMktUK084V05jOWtt?=
 =?utf-8?B?endLdTVzSUd2RVcxNXkwR1hQT3ZLZG5sVkdDWTBFdWFURzJIMlc1anc5SnZ1?=
 =?utf-8?B?aFp6YTErL1BUc0FjcHNmRWJBamhmdTVOamJnQ3hhVld0cVRUUStOVldSZDl6?=
 =?utf-8?B?RmpKeDhzYjZCL0VicmMxUVNScDEzOVZHM2JnNDgxNlFZSEVVRXdPV3J0ZktP?=
 =?utf-8?B?VWJFUWNyY3h6N3dyNWl4cUxKaG0rMmFOdGY2Nnl2OWx3M2l5SG1TL3RmMXpJ?=
 =?utf-8?B?RzZGcVlJaFpmVEdsZWhxTjMrOWxubXpwU2FTMi9XeUpVWmx5MmYzRFhrKzEr?=
 =?utf-8?B?V2g4czdNd0JPN2NoY1EwTzdlMFc5a3FuMnJsenNvc3EySDNiYWJGeE1acUZs?=
 =?utf-8?B?b1U1aEVDVithNTk1cWs1aTRHcHhEUlByTjFwcVRpMVFFdERJVHdkUTN6c0h0?=
 =?utf-8?B?SzhvbmdYY2d6UjVIa3N0YXI0YzkwNUVGdk5mK2ltbnNrNUVESmpaTjdRWVdZ?=
 =?utf-8?B?cWJiWEYreGgydXc4ZzhCdWlQUUN1dm5EbUhRS2J1UFBXM2piSS9JRDJRL0xx?=
 =?utf-8?B?aG9GUXlrZzJ4bzByRjQ2WEs5SFpyUlVuNUVDKzEyNUx5SXBtcWdLN2w2N0t2?=
 =?utf-8?B?UGE4QjJLSnlMWm1hcDh6ZEVYVm1tM0JMZmpJaUszeHZhMFlBM3JrM0hkKzNP?=
 =?utf-8?B?YXI3WURuRU5qYklnUG1BMWxmbHhWRHkxNnB2ZDIvRW1TbXZaTnk5NDFPcFJ4?=
 =?utf-8?B?azhPVDFENnpJRGhYV0w1a3N1RFl4enR0TlFodkd5Y3pWWHV5LzR6cjJNUHlJ?=
 =?utf-8?B?WTBGQkxPRHBxRmc2SE04bFZrT0xia3FMSUdZRHc1cFVJK256YzZFMHRiWEI5?=
 =?utf-8?B?VjcvVDZCcERUamtHRmtCZEIzSm9tbWV4UmM0NWU3K0RPcGRFeWcwbENPdTVT?=
 =?utf-8?Q?BN8yeiznWpZgk1llcz/B7j8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cee95647-0e5c-4386-8f33-08de1c589088
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 10:46:24.8131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjvgTYhUSsnMsLqBziNLtmJHE5Xp2Dv+z/hRvADQdhK+ovdExdLdk/+l3TK6Q+/eijFvH1+Wvjh2D8zQqOk2VmwOgmFTldjriGxaqkYvk5pnI1Ggoc4lYzlSan4O4p1K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7789
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

Hi Rama Naidu,

On 23-10-2025 00:25, Naladala Ramanaidu wrote:
> Starting from low_rr + step_size could cause the driver to fall back
> to a lower physical mode due to proximity to the lower bound of the
> VRR range. This results in an unintended clock change, which violates
> the expectation of seamless VRR behavior.
> 
> To address this, the test now starts from above the midpoint of the
> VRR range when multiple modes are available. This ensures the virtual
> refresh rate remains safely within the active mode's VRR range and
> avoids triggering a mode switch.
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_vrr.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 1d9e579b0..b90d0f3c0 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -850,7 +850,17 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
>   	/* Switch to Virtual RR */
>   	virtual_mode = *igt_output_get_mode(output);
>   
> -	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
> +	/*
> +	 * Start virtual RR testing from above the midpoint of the VRR range when multiple
> +	 * modes are available. This avoids the driver mode adjustment. which can cause an
> +	 * unintended clock change.
> +	 */
> +	if (output->config.connector->count_modes > 1)
> +		vrefresh = ((data->range.max + data->range.min) / 2) + step_size;
> +	else
> +		vrefresh = data->range.min + step_size;

> +
> +	for ( ; vrefresh < data->range.max; vrefresh += step_size) {

nit, please consider calculating the vrefresh_start before the loop 
based on modes and use variable in for loop.

vrefresh_start =  (output->config.connector->count_modes > 1)
     ? ((vrr_max + vrr_min) / 2) + step_size
     : vrr_min + step_size;

Also please check BAT results are failing.

Thanks,
Santhosh>   		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
>   
>   		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);

