Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF97EA7967
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 04:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392E010E7B0;
	Thu,  5 Feb 2026 04:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRfjJtl9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA69610E7AE;
 Thu,  5 Feb 2026 04:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770266325; x=1801802325;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=NVtOinnDz+C61DtouwjUjiE9Mbnj73PRTM8aPlkA6+s=;
 b=dRfjJtl9wqbNrd2M/Dh4I0WvsILWPAnEMcgzPFJzK2cS3r9upOIC6/xT
 mQkSStqIbDlA/LN0tVu5pTbCXcyjmhCHDF5JQLwMH1DkfPgiO4N/S6jRe
 H8qob+PnjtySql1XqcyX6ABB7UT1PYUxtSfTZ15NKt/XOR5TFFae6Yq4U
 IqY9IWHf+xROJy/w40zZzK/QP3aBA5FwXzsb6y6bLwy6qo92H0PX0SVvY
 Dk7VkFCQcwVo29QvE287VZJqqnGy6XFmD4pj+/eBOYjtLaJnPGnLIHmgH
 L62SDm9Csgb+MshRQsj2ymszJY3SSkCAaF7JkUjSeKz1K0gERZ3UHePVI w==;
X-CSE-ConnectionGUID: xRFFclx5QyqE6gIl3iH/cQ==
X-CSE-MsgGUID: 2R4YE3ixSPibYxLEjvNVGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82829933"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208,217";a="82829933"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 20:38:45 -0800
X-CSE-ConnectionGUID: gnS/Ez0qRYGHDyjQ4FvWeQ==
X-CSE-MsgGUID: aQxi6WmzSmCeOyZpK8xztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
 d="scan'208,217";a="209884349"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 20:38:45 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 20:38:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 20:38:45 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 20:38:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySyrgKD0L9AXSei2p6kY3+/+PxQYWnmWkjy+NWYXKi8Td4gJ0M9/yHuaAxQi9pBQOFiBzdN4d+8x5OoohE4XljQbOs3o+BMO07CAOIWt/Blfm7uohZyB4ySL6D0NTdq2ssCKKY7aStGMHDpob/qUIgqBk0t1+Bzcp0NXS2AwfBCiyPcoqb2vIO9T4HHvZwkgGB7NmoEm9fWlHml7ZmqbNt3oqaElyTSfGSqDoihmJCsCVLi0zW8T4kL5LLHGwrYwQGzCxi94O4TPUflNJeyWcj0g6KGNZPyPtEj8dogcWcRaWrLVOlmHWR8c0q9wgUE5rWSOZPdkNxE+QxnxnRgSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHWP+oRUqEJpk1gP89coCV4MNmAXfv/VGyxxO8XpPUY=;
 b=tpdzfPXXezDBs6MW3EoB3M1gWjJCbtIaHZqZ0nLk9MralCrW/axPPP577vpyqvACtSSweT2ld2e081dEtiCanUCjQMFf2BX/tUKlJPmgJgvuEzjioGJW2sipK4z2jmVEAK6UJtUVaiWeuKDCFbKSGechucV0pO9q/kQsSbBuUtAbkmA9ngRpNFkqwlCITpEtr5SK+2YC/hGxcUQlNYKvsVkOQRjRh+Q6aNYxlOggE71MuXrZtNYATvgn5rFTul7tQQK/ORaxr5WK3X+qzUrNZuMBzLcBrx/u1W7pANriouSnO8qj5aA9A8WuwpTFdaIAQtiYlGV6xrxJpf5PS4wvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH7PR11MB5767.namprd11.prod.outlook.com (2603:10b6:510:13a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 5 Feb
 2026 04:38:41 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 04:38:41 +0000
Content-Type: multipart/alternative;
 boundary="------------Qu6gBtFN9PvRb3A2HmZjvmwj"
Message-ID: <c367ec10-df0f-4909-9dea-465497d76663@intel.com>
Date: Thu, 5 Feb 2026 10:08:34 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBsaWIveGVfZ3Q6?=
 =?UTF-8?Q?_Handle_non-C6_states_with_debug_message?=
To: <igt-dev@lists.freedesktop.org>
References: <20260202114640.3366549-2-sk.anirban@intel.com>
 <177012666035.219828.13308517362774765968@a3b018990fe9>
Content-Language: en-US
CC: <I915-ci-infra@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <177012666035.219828.13308517362774765968@a3b018990fe9>
X-ClientProxiedBy: MA5P287CA0270.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::8) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|PH7PR11MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: 5890fa32-8040-4725-b23b-08de64706fec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEcxYlVTcDY4eVViL3pINmp3QXREYllFWDBWTXdCSUppditKNmxmdHI3YzUv?=
 =?utf-8?B?amEyZmlIVzVXaEVTMktSOEw4SzVzUGhkaVF5R2lUOWZZUEpWbTV5WGRPQUFj?=
 =?utf-8?B?MHBKMVZyLzZkYnBIUFZQUEFGSUJFVGtRSTNZRnBpbG93aDJVdVZlZnVyRkha?=
 =?utf-8?B?VlhxMUo3WEVqd1Q4TGt6aGhmMzJMbytGV1ZraStuMFVNV3VqbzlPTEFQL2Rx?=
 =?utf-8?B?bCt0a3Izd1BQWUJDVW5MaThEcDcrK3FPLy82UEIyRmtmamRCRVRLT2VZZnQ3?=
 =?utf-8?B?SDZidHlhRGNIRVhzOVJHN0VEam1weHFqZERkT2NhTUVQbkVWNWcwdkxCVFZU?=
 =?utf-8?B?UW5LNWRqNUlweEJ4Y0cwWU1wOTZxQWVxR3UzNWNwMVFiNVdtcWlKWXZmTm5u?=
 =?utf-8?B?eXZxWG9UVTdKRitGbU1sdmtuaVNrTG11VnlMSjU4RGc0TjNRS1p4WDQvSklN?=
 =?utf-8?B?VDFrdEhTOGFmUDZocHZ1T3QwUEFJMlVZam5xQjdYTWFMdjBSOWFidFg4bkJS?=
 =?utf-8?B?bDdVR1pMUnVoSjBiUWFlVjAvSFhpVVZjUXBUZHlQTzlMdnU2NEFlZTFUaXpE?=
 =?utf-8?B?V3BJcmVKcWliSXlITk5XQzloTVltQlg2NDdsWTFGb25IMHZrbzZCblRhR2Ix?=
 =?utf-8?B?UE05WEFjb3dwTG5OTDhNb210K1NPVWFmOTJtZE1VM0g5cng3N3J3N0FpSm41?=
 =?utf-8?B?Yytzays4K3QxYlhUWkNzMnFJOFNzUjZnOTRRY1A0WnIreFRIcXhWeElTZi9j?=
 =?utf-8?B?UktKQXJpNU5LbXYzNUVGMFM1TVVFWkVXYlJ2d25uY1I5ZHEzdC9vY1RrSGox?=
 =?utf-8?B?cmswSUpPMG5rZmFkaUtkWkNlYjg1R0Y5RTFHQ1AyU3VrYmdoa3UxZVZaeHBF?=
 =?utf-8?B?bjRxMkJ5bG5EZTd2amF1elBIVzhTZGRCSnI3WXhzZS9zdGxZUVdLTU5sY25U?=
 =?utf-8?B?eUttWFNVeHNnVkc5T2pkc2E5Sk8zVXFpRUxjZm9Ka2xJUXZ6M0ZhL3Y3ZGhE?=
 =?utf-8?B?ck52K1JjVnNKd2ZaN1hhV1V0SkllQlBqZGQ2dlVwMFpDcVB1d0VneGdoUWJN?=
 =?utf-8?B?Z2RNdzFoTmxMbUdrTXVaU0czNFlSU3RFOEF1VmNpeHRrNWYzcW5ic2tIZGpn?=
 =?utf-8?B?MGpFdmpQRGdlODg0Y0pqVElzNmZLUEd6Nko3WDl6ejFXeEpneUVTMjVibVA4?=
 =?utf-8?B?TzA5U29zQXRZSkdQMGg0eWNHQTlNNWZRR1M1RHdHUDBRd2RjaTdBR3VzMURL?=
 =?utf-8?B?V1FGdG1ubXk2WGw0TldsWGw1ZzR1cS9Ldnd5RWJQQ3hLTzJ2ZmFWbkJxZmsw?=
 =?utf-8?B?ZTRLMXVXMXNveS83c3dwaXd4MStBVkordHRUZWwrdUZXczFuWllkVGI2cVNj?=
 =?utf-8?B?OWhSaWtpa3hUcjhTbVM1cDdCUzFIaHo4aXl0M2Q2K21yUXNNMXhMNlN6L0xh?=
 =?utf-8?B?Umh6bjJMdFBrSkRmcVhBUTc5ZS9hbHhtcktlZWliU3l3c1JVWEFhQjlTMUEv?=
 =?utf-8?B?Um4rNkRSSTlGZ095UWp3WXpmQmF3Vi9WWEkrYzZlWUNjeFk5RTcxaUlWQWZ5?=
 =?utf-8?B?bE55Qk0rVHdyS2RscldiaHpCaCtJUFh6OXMrMzNwcG9GWms1YWMzS3ZTaFl5?=
 =?utf-8?B?T1NJWTVkdGVhbnJSZW96OWJFdjdrOVRhN1FlMndmTldSVjFpemQzRytaekxZ?=
 =?utf-8?B?bEF6ZnZRYVg3cUVkd2ZHUk1HWWIwNXFTYTlPbkJiR2ROUGxONGhuM2ZaVnhi?=
 =?utf-8?B?V2lERkZaUmdDT0IxaFcxSURWdGs3ODNIT2RxVUlPVURSa0Q4VWFnY3pXM3Nt?=
 =?utf-8?B?NW84c2M3dDVjZXVNMnN1Sm5RUUllYkM4blVnSWluZzVCbVlJR3FOS240aVdU?=
 =?utf-8?B?YVV6V2lUTk0xTWxWaHhkNkhPMjZVUDEzNllrOER4b2xOZnU5c1FvMjhha1Mv?=
 =?utf-8?B?TTBMOVA5ZkpNVU1QQTFDWnJ4bkVMbmliWlk3RkwyMTdiYXF1SHJqNjhWZDgr?=
 =?utf-8?B?OVBIMURlRHVTMTBMckM0Z05pa2ZsQTJzTzI2SU9MUUZWWW1vcVA0QjJvdHNa?=
 =?utf-8?Q?CnNiy0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1RUWFUrYlpMaEUwUEhHTVJHeVRPTnhXWUZHWDZ0ZFJsQ3lhTWVwalhnOFJT?=
 =?utf-8?B?VzRGRWlmT21ZZU8rZHROYk1MT1E0NFZidVVXMzM2YmJaUGIyNmpNNSt3Slpi?=
 =?utf-8?B?MXI5SzduOERXYS8vK1ZIT3RjM2srV3pQUUc5RVhZb1FvQmt4YzBsL0FvVmE5?=
 =?utf-8?B?WEZHR1NHVU11eWZReFdpbEhFeEkvZkliVmRNVWM0TDFhN1NobncxMkF0Ti83?=
 =?utf-8?B?WEN4TnNkbi9QZ2lXRmd1SHh4bERRQVJFYjBLcE9wVW93NHdXTW5GTTRKZ1JL?=
 =?utf-8?B?bnBKWldnbnhSUm9pOUNDRjI3VkRQdmtvQTAzTVNxNFhqQ0ZqdWFuY00yYVZL?=
 =?utf-8?B?Q3MyaFBFQ3d6NW5IV25OSWxNdTRSYWJvVmNIUS9UeTZ0TmEwSENuUU04aXhl?=
 =?utf-8?B?czRQVG1JVzhrTjl6SFdGQkdVZGxyZXg0QWMzWGxSQ2pMUFpUNWRmSWZvUTB3?=
 =?utf-8?B?MXBsd1d5R3NFcStHUXdtZjNvQVF6UVNrdkdLOFducGd4bERyRDd1cE93Y2hG?=
 =?utf-8?B?aE9rMVl0amUybWNBamZsR0tkRE1rY1JGaDR1OTZwMDFiQ0ErQzkyRVh1VDAx?=
 =?utf-8?B?MUJmSHd2K202SGp3Z3RqbmQxU25xbmU5NzNES2pXS2NyS2VONW5KY3BETHRQ?=
 =?utf-8?B?MWZEeWQ3cVJ5V2RnZTQ3TXFCQUdXNDdzVEhxcmtpa0ZqenVJM1luYWFGZTNj?=
 =?utf-8?B?WlJUUThUd3ZWNEJEbE1ITlpkMHhvSWpSaGdvVHgvbVAzOXRmYnNlY3BXdFVS?=
 =?utf-8?B?enFBcVlQdzlUZHNFNUFQbXpMNWNlUGJRdUF6czB3dUlKaGIrRmNxeDlCeDZH?=
 =?utf-8?B?SDBHRGxCZXg0NjQzTytPTEpOOHNqTTQ2c0hNc0ttcCtQVVlrOU1QaE9xamUw?=
 =?utf-8?B?WWl0NTA4dk1vTHdWbFM4NUszVVF3TEJ1TTh1QmpxUldMTk95aXJ6UmlhS0sw?=
 =?utf-8?B?cDdJTzN1T2hWMWZhTVNLZk83WVhsVVhtS2Rta1RUakNkVHN1ZHBFVDJDeU1p?=
 =?utf-8?B?OEJlSHBZWnRsVG4yY1NWYW5iTjhEMVpxNnQ2Tm4zVDkrWnNoZ0FKcG84dFVF?=
 =?utf-8?B?RTgzOWdlbkQ4NXVpc1V1Y0xjcnB0eHIvYjZQNVZ0L1RRL0xUWEpGU2FHdUZB?=
 =?utf-8?B?dTUyNDVDV0JzNG9NYkxiZVc1UDNIcmo3VnBjN1A2QldxY01OVlBYTy9YUXBi?=
 =?utf-8?B?akk3SWl3RG5zWDJqakJsMDhPSEM2bTROK25DWFpHL0pmQzFrV3hVZ3JJblFT?=
 =?utf-8?B?aVpSMFp0L3JjeTNCUEVCUWxSM1V0dWFVcjUyRTdnaU55cVVUWHRCTnNUb3VC?=
 =?utf-8?B?T0lmSzhzSWRBL2Nja0dIbTRGOGF1bjJmUU4zN1JDSy8xek9Lbnh1bkxrQ3pj?=
 =?utf-8?B?NlBCc1RDVHNiT1IxbGZUZmwxZHJlYnlMY2hnUUY3QVVKKyt4ZGdBQ2xZYm1t?=
 =?utf-8?B?a3FPZU9jQitKNGQwejV4QkdUY3pTTjJzQVBza1MydzR0bS81dVJReUVDQmlS?=
 =?utf-8?B?Z0x4Z1p3QitRTXdQK3RBemNCMmpCNjQzeE1nc1pVa3dhQWR5WEZoTkQxek9x?=
 =?utf-8?B?eWJzbXBsSEdXa2g2RmM2SHZ4bitNNEtPSmU1YmxrV3hGMEdUdVB1Y2IvakFr?=
 =?utf-8?B?SEZhMHZ1NHMyUDR1ZjJ5R0R0YVNLM2lnSVZUdmZ0Zk5EUmIrVXo1RkJGVnJB?=
 =?utf-8?B?ZEpmeWdxTys0OTdVKzdycFJGektyaXdmS1RQVk5SWUEyb0RMK2NyR1NmOURW?=
 =?utf-8?B?VzlHSmhuak5MRmhyTGZXM0RZRlhhQTJtZjAwa2lqcXFjQVFWMlVOWmFmZXlv?=
 =?utf-8?B?WkV6WmR3RndEaktXcnhiSU5QOUFXM0oyMHQ4azgvQVJiNEJlSEVLZnNIdGpZ?=
 =?utf-8?B?OTFLR2MxUVpkZ2xWbnUweldiY0V4VHBtSzBwZzQ5UmlZRDU5YUVWeUtxUXZD?=
 =?utf-8?B?ZWZJS2VwbENlQ1VaWWwwVmhEazVkRGhGbFJ4QlVSN0pUMVpLWEpKaE5ITy8x?=
 =?utf-8?B?VTVJQUNGbVNxVkdTbHNVOVZSQ3hTakhSNFBUWnE1K1RqSmRIMWdNMkFLbkhG?=
 =?utf-8?B?OGVzRVlRc2xCZDkyWnlGOTZvVTN2WHdQdmdkOEtiVk9zQlIybXBScHZqNTV4?=
 =?utf-8?B?c2dzTjFiMjhsR0hTQkhDUEhkWnB3ZUNGdXFYN2RDUEh1eUZOcTFmbVRqMEZm?=
 =?utf-8?B?Zk1xdE1qd3ZwckthYVBzdFZMRHI2VkQ5NzRLYTNLV0dDalE5Mi9kbC9ZWVQ3?=
 =?utf-8?B?NkcvMGRBY3pZUi9NdnlMMU9hOGdZT0V3T0Q0Z25qc1VEdjBzMkZ5bDdnakw2?=
 =?utf-8?B?T2N4WGFxQldWOXRCT1ZtMTRhRFpwb3dxcjdjbkg1MXI0QnRNeGJ0UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5890fa32-8040-4725-b23b-08de64706fec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 04:38:41.4735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsRpnMtIyLNGHYwKU1jddZ5Vudh41s5M8+KYj9rh4f1268sZqr0s2yJpWd54HCThZuBY0vcr05SKZ4J7AeLh+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5767
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

--------------Qu6gBtFN9PvRb3A2HmZjvmwj
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

These failures are not related to my changes. Could someone please 
re-report?

Thanks,

Anirban

On 03-02-2026 07:21 pm, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	lib/xe_gt: Handle non-C6 states with debug message
> *URL:* 	https://patchwork.freedesktop.org/series/161011/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/index.html
>
>
>   CI Bug Log - changes from XEIGT_8729_FULL -> XEIGTPW_14468_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_14468_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14468_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14468_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_atomic@plane-invalid-params:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8729/shard-bmg-2/igt@kms_atomic@plane-invalid-params.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/shard-bmg-5/igt@kms_atomic@plane-invalid-params.html>
>         +5 other tests skip
>  *
>
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8729/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html>
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8729/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html>
>  *
>
>     igt@kms_content_protection@atomic-hdcp14:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8729/shard-bmg-10/igt@kms_content_protection@atomic-hdcp14.html>
>         (Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/shard-bmg-5/igt@kms_content_protection@atomic-hdcp14.html>
>  *
>
>     igt@kms_scaling_modes@scaling-mode-full-aspect:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8729/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html>
>
>
>     Known issues
>
--------------Qu6gBtFN9PvRb3A2HmZjvmwj
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>These failures are not related to my changes. Could someone
      please re-report?</p>
    <p>Thanks,</p>
    <p>Anirban</p>
    <div class="moz-cite-prefix">On 03-02-2026 07:21 pm, Patchwork
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:177012666035.219828.13308517362774765968@a3b018990fe9">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>lib/xe_gt: Handle non-C6 states with debug message</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/161011/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/161011/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8729_FULL -&gt;
        XEIGTPW_14468_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_14468_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_14468_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_14468_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_atomic@plane-invalid-params:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8729/shard-bmg-2/igt@kms_atomic@plane-invalid-params.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/shard-bmg-5/igt@kms_atomic@plane-invalid-params.html" moz-do-not-send="true">SKIP</a> +5 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8729/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8729/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-hdcp14:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8729/shard-bmg-10/igt@kms_content_protection@atomic-hdcp14.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304" moz-do-not-send="true">Intel XE#3304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/shard-bmg-5/igt@kms_content_protection@atomic-hdcp14.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8729/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413" moz-do-not-send="true">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14468/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
    </blockquote>
  </body>
</html>

--------------Qu6gBtFN9PvRb3A2HmZjvmwj--
