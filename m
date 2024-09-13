Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F69FA372B
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 08:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD27010ECBE;
	Fri, 13 Sep 2024 08:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5RMZMzo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11B210ECBE
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 08:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726216183; x=1757752183;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JM6BOd5xpyT8/qtceznI+kLRTm4O+zsvtFch9uyRa0U=;
 b=d5RMZMzoEbUlzLNpU3Bg8kB7/k51hlEvFIUma9vQ57/Oms2zZhwPg/+U
 /Jfts9X2spwsPZymCtn3ZPwnsmdbHXvXx/q1Otqato8sPiLWiqhmOpOKc
 TltukXUjmTDOwtHQSqyGZI0vWZEwC2bUXhWrsk+8TX7XuCLgUE0SO2Z2u
 dTwmtiewEWSG9cyLuFeA2eqzTtYy1MkssOzLniksHQzGWwab/alfbcpmE
 DAoMaQXQySIN/NnQRn734XFiP3r6YhanYuc8GYmR56K8Lgt9aZbuX3T1G
 Zy/BnG9z/96z9GAo0p3HoNCL1i+ZFqB+3jBYFyI3uBeSjcAnwTbkmB6aG g==;
X-CSE-ConnectionGUID: 5p1W89rnSpWXR6ws1gYncg==
X-CSE-MsgGUID: m162AljOSuu461zPxDEijg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25303625"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="25303625"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 01:29:42 -0700
X-CSE-ConnectionGUID: B7Y7EufoTfSMZyLzdAtmxQ==
X-CSE-MsgGUID: Sc9unWYMTMa2iBzjC9lY/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="67604106"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 01:29:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 01:29:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 01:29:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 01:29:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+b5RzPIT3cLN9XsDMZzUEXWv0iJCw/KaUHrmK7uAhG44RRSBvYOQZRFyFX8AxxRI3oBPfqnAG6O50CpxMqYQBY4r4jauUeYqgQXMWaZyuvrUff+0fAQl2aLn+I9/iwqrGL3W6010Zd4oUTC9lMwY4ucUM08CmKhAUPu470LiQQJkMICPBTf9tLGcs0g9guom7FYHNURnDotohXjbrTzeMVsFToxE7TrjVqDVZdgh90g6O8Bij+PwIXCodYTT/OBYNVreBMDO/ygZlPLuFu9uhvkugj2D9mlGmzH/ppmJynhmWlmEuRykVi7/eDJ7Bn5iYM3INPVxdoAl7iHP1gTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=509/3LNxmdcSvbMzBOuF4z0DCrQGpX2Ap1Kxb/Mn1Jg=;
 b=EzmANotfn4k/+FgeiEP4VkDRWS4Rai379GMkoxKUOkNZZnZkhy1v9KppbBz5o2lsdOF2nUTiGPiMj2DbJcvN8qDiWe/spKH6UMvVclf7GkBwzj+3B5xJ99scjKJ3PsHNCcsjZee9hQpruYxzWEaOrWAXfjAJZPqxAv+adaCaUs7ykAG3WfyYN5hrzZ3Tneb9sKTu4iK//Hfjsb5o+CwMtJI5a3ti81ANUU7AsJk9hL3hJk5FTh+bq8pYaOy4XPA5FvPX5pLohJrIfUQbrqwJQrm/P/VEoAPS2U0sVHRBen7ZjlDe+533ku/AA10z6tRyLYw7k5bD6liPvzfSau5BlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SN7PR11MB6603.namprd11.prod.outlook.com (2603:10b6:806:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Fri, 13 Sep
 2024 08:29:33 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%7]) with mapi id 15.20.7939.026; Fri, 13 Sep 2024
 08:29:33 +0000
Message-ID: <99543131-86f3-474b-a9c5-6e28eae5c6ba@intel.com>
Date: Fri, 13 Sep 2024 13:59:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for suspend
 without display
To: Jani Nikula <jani.nikula@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Sousa, Gustavo" <gustavo.sousa@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Piecielska, Katarzyna"
 <katarzyna.piecielska@intel.com>, <igt-dev@lists.freedesktop.org>,
 <imre.deak@linux.intel.com>
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
 <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
 <172434871596.2055.1015145340873010177@gjsousa-mobl2>
 <4e6gyyd3qf7bfyrtwbun4w42clu55v7r5glgrfikstw5hs5xyn@wdfocxn3uqsg>
 <172468301865.6014.9946879676247551400@gjsousa-mobl2>
 <82a8af36-642a-4747-b085-924c02e6308e@intel.com>
 <CY5PR11MB62119DD080EF001546D7D41C95942@CY5PR11MB6211.namprd11.prod.outlook.com>
 <172476290898.3066.9682588878616653824@gjsousa-mobl2>
 <CY5PR11MB6211B873C18594896BD21FA295942@CY5PR11MB6211.namprd11.prod.outlook.com>
 <44e18951-3b9d-4aff-a590-efd39e0a7a70@intel.com>
 <0368307c-3c7c-4167-a122-8f27a7bc36e3@intel.com> <87y13yi5vb.fsf@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <87y13yi5vb.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::14) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SN7PR11MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: cca77416-ce5e-4a39-9a5d-08dcd3ce317c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3czOUUvZTJnYTJmVEpNTUxGV05IUmx6K3FCdVl1YktUTnZrc01NbWxIcEV1?=
 =?utf-8?B?NUh0ZFVyL05YVzIvTFIwcjZOMktvUU9zR2tmOGhqcWFoUEI2dHpvbllaU2Ns?=
 =?utf-8?B?T1V2VUtzN3ZEZ1lvb0lsM3pzWmFhbWljcUI3ZU9KTmo2RC9sRVVPcHVTZldy?=
 =?utf-8?B?bUlLSTBtc0ZBSnZDMml6Rlh0UUZvUWdZVWZTald3d1JVazZxa1JkbHpOY2tk?=
 =?utf-8?B?VFFodU9VNWtKUWw3UlRUR3A5bmJJNTQ0SXlBb0dHVmZ2UDVBMUVGZ0FXampt?=
 =?utf-8?B?SFFMS2xKWGg5OVA4N21RdkV1NVZORjBjbzJDQ3ArR1hqZ3grR1h5YzNNQjRh?=
 =?utf-8?B?RFNwTnZac0RkMXdON0tDbnRwUXA5YnVSckRZSXJLTStVZ25TUzJQTDlpTTRN?=
 =?utf-8?B?andoTHcyQXp2b3o0NlV0dXFVQXZLVDVxcjQxaGp3ZWk5bXd5SU1xRUU0R0Vs?=
 =?utf-8?B?V0VucGlkbnlaOGZqSnZ4RUpza2N1L083V3Nxd0Q4MkgwK1J5RGcxYUI4Y2pE?=
 =?utf-8?B?TnFuTGwyL1YzcUxIcDZjS3FPOXdsbi96dkpjd0h2Rm9UdTBCc2VKNll5UTRx?=
 =?utf-8?B?bDlBQ1FlLzdTL1Q3K1ZzTGZyckpqQ3RXVHpPRTMyb0c0YUhsSS81YXVqZVpG?=
 =?utf-8?B?SUgwMWZqRlRlVlFPRkZRemc0UEZlZE5ibzJueDdNRndjdWFKNnRyamZ2T3Rn?=
 =?utf-8?B?Qi84c0VQVHVBWUo3MDBLdVlFQ0lGeDdZQ0NpdlpaSzBVN3hmUDNKd1VoOE4r?=
 =?utf-8?B?M1ZsQ1JRQU1IU1BKeEp6WVJjbzBLVVA5Nzc4cW1iQlI1dnZaSC8rVGl1anp1?=
 =?utf-8?B?ajg0ZzhjQWxuUldITXkvdjlYUmV0eDdXakl4Z3kwT2pEVy9WTTVRYVlQTkdL?=
 =?utf-8?B?UGtidlp0Q2ZJaEZHV0JMY3hxbUFSalVVOWs2eVJTdDRiQ0tUQVFEeGdjYnVT?=
 =?utf-8?B?UzU4aU85SHQxcVRBZTVKTmx6aURrWnN6cTU5ekFObEJKSE1zbEIvT3JJSHl0?=
 =?utf-8?B?VnMwdk1VQ2R4em0zYUVKZGVVVEs5UWE5WU5RTlQxQmROZkRacWpycFc2S2Fy?=
 =?utf-8?B?ejRSS1BuZjRXTFZRWjBGcVhGZVp6SXZsUG1pYlBuak5yWUNxVXZYQ1IxWGFM?=
 =?utf-8?B?NUJxTGphNGpxdFVnUHZqSW9mN2Y2dXVvdjdjSmpITWhNeVRackRNdUlBTmxm?=
 =?utf-8?B?R290QkF4Smk0WEhicWpMSHdnaUpSN0d3UlhQcnMvbEl1WmQ5U3R4Y1pYYzJW?=
 =?utf-8?B?RnhyTU1NRnhDV1dTbmhVU0VCTk9lb0N0SzVFdUVxaklzc2hSWjFZeWxmbUhX?=
 =?utf-8?B?YmlpZEVBdktBV3Zsd1E5MWl1WWhpRHl6Vy9FeGVCajhVWDV2eDlnZEVxdHps?=
 =?utf-8?B?VW1yYVlXN1lCRmNjOFh0NVkzYWxPOEltQ0xpZzc4OEpZK2lBekRrM216Ri81?=
 =?utf-8?B?N09ieDlPbEhlYUhDWldMUzhvckF6azNSN3BGWG1zclJMS1BXMnE3WUE3aEVr?=
 =?utf-8?B?TmR5U1hyZlQxVFFraU9INE9LZ2NTdUJmT0JwNXdFa1FRWm9IQUV3dTYvMHdC?=
 =?utf-8?B?RVg5VkowWEhvTDBXemtpdll3NGI3d3V4emVFd3FxcHMrVSt1NUxkeVowSkR3?=
 =?utf-8?B?TGtEYVFFa24zaklEOUNQRzZabVl1a1JWMmZtU3lvdTNJSXBvSWtWQmVGaUhY?=
 =?utf-8?B?NGF6YmlOZkRyU3BzVjR1Y1pYMHJ4Q3l3ejNuWEVJRVZNSVZMTXR1TmIzWTV0?=
 =?utf-8?B?QUxlTHM2ZjhweVYxS0paOEJoTGI5THFuN1MxMU9pb0FQVjlScHlLRE9nYnN2?=
 =?utf-8?B?cjBGWjVZS0hKaVpFOS9KQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1BmdXZpdGRBWklqT0RlT2lFeGQyVjdlazY1MitldWcyR1AwS2pJZGpLK1J1?=
 =?utf-8?B?YUM1OFV2RFBLY3pONWd0RXBJelg3MExKY09pNVdhOVVHTEQ1MkVGcG53cXJF?=
 =?utf-8?B?Z3lMblpWVHNKRCtwbktYVm5wWjdOWWZPRlpJSWFHNXYzbVFQSlNUSWhadmJ2?=
 =?utf-8?B?ekhDc3NMbXN3a1BMTng1RzlLQUlVZm5sWU5RMHRJeVhtdFJ1RmJlVkU3aVd6?=
 =?utf-8?B?dmRoRFJVOGN3VHhKK3hwWVNqZUFYUk16WDVrRlplSXFlam1jRGxuSU10bFdv?=
 =?utf-8?B?b1hoaHg4L2RYbTlFOGxrOEliT0ZKMk1FRjhnWlhwV1hORys2bGROQU0zQ0ZW?=
 =?utf-8?B?djFwUWkrK2k4SEJ5aGJERE5NbVhUM0ZNcGl4aGc1R1c2VWFiK08xNkh4VC9I?=
 =?utf-8?B?V1VSbDF4UU9Ha3kvTGNCMTZGUkJIMjQxdlg2Ujh3ZnhJcklMb1pmMFlyNFc5?=
 =?utf-8?B?SWVYaE5RcTdyTWRjSldjVXFBUXlKUHVCSjVlWWlpUllyemJXTk91UlFnMXJj?=
 =?utf-8?B?K2dmSVRLNWJuOU1YdzZBaUNyTW9JY1pUWlppZHA2Z2hGdmt4WktpNWxKNXZB?=
 =?utf-8?B?VnlwcWMyQXFZWUw0cFd2UGZ0ZjNnYzJDRE1Nd0tUYWpkSkJFVEkwa2FYa2da?=
 =?utf-8?B?eURvZDR2RTdoNmx1ZVlVTlRRQ3ZJTjV4ZGQyU3VQR1A1Y0NROHR6VUNGRDcw?=
 =?utf-8?B?a1lrV010R3JCcnNWTHNiSm9XcFNDb2s0UStXek0ydVVRSE80WTQraGdpRThn?=
 =?utf-8?B?NTJpejlLTjF0K1cvbHAydE8yam5NVll0ZmcybDU1M1c1eVNqVTIvQngrRHBQ?=
 =?utf-8?B?eDI0Mm9ZWTdSZ0picHRlVGRiekt6UVVrTmkvR1o0TVAxV0l0eHc1TkJzRzIy?=
 =?utf-8?B?T2tPMGdqOTdJcmRWYnh5K1BTTXhWMnFBZ00wcTZjSGRQNUxoV0ZmVG4vOXpw?=
 =?utf-8?B?OTVwOHUwUi9ueWxDejd6ZDhUaFV6Y2NLY2pyQnk3TTVST3EyMllvNFZGVW9B?=
 =?utf-8?B?cXpDQ2RacEFMUlFqT1I1TlArcGNpdEJUVWdFcnQwakQxeDl1bDJpTGxRanpH?=
 =?utf-8?B?bUVvRldoTUNhZ3pzYTBBV2x3KzdVazY0RVBtZkdaRkdVeUZjc21ROXV0RjR2?=
 =?utf-8?B?ZDJrbld3RURZbElpSnJ0dHBJT1NnWkttd00zV0Fya1B0NVM3YWtqWFJnOTZK?=
 =?utf-8?B?bXphY2FZZlVZdy9oWU53NldWVFpJWWg0NXRrbkVzNnBoTGIvYzZScDNKRHVh?=
 =?utf-8?B?NWdTaEJBYk5mZi9BellnMWZuRVc3OTNqVk9NVlliTFRNZUdONjJyMVlWRUVF?=
 =?utf-8?B?cjNFRGlSQ0dYR1ZISG9wTzRHcjZSSEovVmRjRm9wTUxwcXdXMHdDb09BRDZO?=
 =?utf-8?B?aTlYRzI0MkQ4NUNQZGxHQmQ4NGhQa1ZCWnRxL3M0M0hReGsveTk1WWhaRXhF?=
 =?utf-8?B?S3N0ekEwNldCZmdPVUV6cW9HLzFPVzkrSEhESnNCNHQyNDdLNldqSER0YVFa?=
 =?utf-8?B?R1l4a3BpSzdqK3J1VitDcG9uZGRna3pUS3lIRU1OMzQ4S2t3c2paRXlGNFNP?=
 =?utf-8?B?V1dCMG9NK1dFMmNubU5qajN1UU43TWtqM0RVTktGSHNPdnpTUzdnbG9BV2h0?=
 =?utf-8?B?c2hCa0FjbWU3RkM0ZkVNdGxwc040bVZvY3FHdWE2SzlMOWVNbENqbW41YmU0?=
 =?utf-8?B?dEtLWFhwczlDYUI4UTV2VlhxblJHTE1URjBGSC9ITUdtSjM0U3lRQW1jTXBj?=
 =?utf-8?B?NFlMbUdrR0ltOTJkZy8wam5CSlhsM3Q1dUFnbWZBZS9KR1Q2aVR4Vm5SRG02?=
 =?utf-8?B?bHBzSE9UWkN6OGFlV2pQNTZrT2o2amdJTUtISFJyYU5pVkU2ckpaelE3YStu?=
 =?utf-8?B?aTdsZmRUSG5jQ0JjZXlUMzZYUFVKMHhVZ1FTVnJGenczK0xhZDVwblZwM3lO?=
 =?utf-8?B?aHoyMC9pekJIdk15K3BHKzJ3dnZpblJQMnRhY2xIVW1KaEZOZTVLRXpaTzly?=
 =?utf-8?B?TDQ2aGdXYkw2TEE2SUFjU3hIbUpZdkc3aGR2WjZkcUt6aEtjQ25yRGE4U2l5?=
 =?utf-8?B?aHR6ZC9VM01JUzh5VWJJT0dPWmwrR1l5V1N4K0ZZcUVxSTZyN2t2S0NxQTZT?=
 =?utf-8?B?Q3ExL1hZSU1rZSt1d2UxMXFISGlZNkpRdnh4NEpBWjZ6cVFOOEhCSEdLaE44?=
 =?utf-8?Q?Slx+YAjvZIoAcd80QpkpQxg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cca77416-ce5e-4a39-9a5d-08dcd3ce317c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 08:29:33.2865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8T4qPnFsvYqjmk30q9phoFAVdtNGlxe7AFB/VO7L6q9HQc6wDfYqTneo6xkDf1NpsxmqHf6/cXDT9f7dlPMvTAVZ+Ix0ozKg92mJf1zkkOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6603
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


On 9/11/2024 8:40 PM, Jani Nikula wrote:
> On Wed, 11 Sep 2024, "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com> wrote:
>> On 8/28/2024 2:16 PM, Sundaresan, Sujaritha wrote:
>>> On 8/27/2024 6:24 PM, Gupta, Anshuman wrote:
>>>>> -----Original Message-----
>>>>> From: Sousa, Gustavo <gustavo.sousa@intel.com>
>>>>> Sent: Tuesday, August 27, 2024 6:18 PM
>>>>> To: De Marchi, Lucas <lucas.demarchi@intel.com>; Gupta, Anshuman
>>>>> <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>>>>> <sujaritha.sundaresan@intel.com>
>>>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; igt-dev@
>>>>> <lists.freedesktop.org igt-dev@lists.freedesktop.org>; Piecielska,
>>>>> Katarzyna
>>>>> <katarzyna.piecielska@intel.com>
>>>>> Subject: RE: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for
>>>>> suspend without
>>>>> display
>>>>>
>>>>> Quoting Gupta, Anshuman (2024-08-27 06:29:06-03:00)
>>>>>
>>>>>> For s0ix DC9 is the pre-requisite rather then DC6, DC9 does not have
>>>>>> any depende ncy on DMC.
>>>>> Maybe DC6 and DC9 are pre-requisites for different S0ix sub-states?
>>>>>
>>>>> - BSpec 68851 says that DC6 is requirement for S0ix.
>>>>> - BSpec 68857 says that DC9 supports S0ix with more power savings than
>>>>>     DC6.
>>>> DC6 is pre-requisite for runtime s0ix with PSR Display On use cases.
>>>> Which is irrelevant for system wide suspend.
>>>> Thanks,
>>>> Anshuman.
>>>>> -- 
>>>>> Gustavo Sousa
>>> Hi all,
>>>
>>> Thanks for the comments. So if I have it right the only final change
>>> here is to switch the param to disable_display right ?
>>>
>>> Thanks,
>>>
>>> Suja
>>>
>> Hi all,
>>
>> Gentle ping on the above question.
> disable_display=1 will still keep running display suspend/resume
> paths. You just have all connectors disconnected.
>
> I'm not sure if you can really fully achieve the goal of testing
> suspend/resume without display.
>
>
> BR,
> Jani.

Hi Jani,

So in this case neither disable_display, nor enable_display will work to 
have a truly display free test run ?

Thanks,

Suja

>
>
>
