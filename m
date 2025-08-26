Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1C9CA0FE9
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 07:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C2010E16D;
	Tue, 26 Aug 2025 07:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dR9wVr6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0A810E16D
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 07:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756194521; x=1787730521;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jWSSOYnG+19HTxvJKW8Tj6SKaoGUmue+ds/pQLNidgU=;
 b=dR9wVr6IRJhV7FxvSbRY0YcAhjDNCZzxMt4PD5TnsIolc40mrL8QkbZL
 LOaKEW0oSg6BOqjL8id6rBsHBGV5Sau/hjSYEpzWmPqeBog+28oJ1UsTC
 IfXTvhUA6DiUdGsr0Jn0b2FBSuaNYYYL8Sm8PIFko7zzoLOHYNAl7cnLl
 zodsCjyYbidJ0dvL+02GHNRSe6AGp/qEH6u8MNGDOVoZxb0SUZ5jSXhQL
 kw9J9h7lCgi++Fxax47a9BwtzvlCNKb9+aBIObhR5a+UKUdx0NIGluVIc
 7jMPf3aTken/sxNzm5874+xHjFhyyj1gRT4VpmhMv3Qlc9nWpC4Xxa5mQ g==;
X-CSE-ConnectionGUID: 1UOzfbLdQTqOXFhaXSSCkA==
X-CSE-MsgGUID: +0Zb8adxQ1CigfNQMrrzuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69521272"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69521272"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 00:48:41 -0700
X-CSE-ConnectionGUID: YFeMOTVVSNmGJbg2FIgVvA==
X-CSE-MsgGUID: RkBzuekVSXuQvJcnnKC3yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170335068"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 00:48:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 00:48:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 00:48:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.76) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 00:48:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnQONRCH6duN024muY0vGW3AY7GslvZe8q01xW6D5O8NshabsKl/ZskxyK9+r8GlDR5omXvkCTCS/JKQ/5hqZDeYaxVt333z7o36nZvMQ2BWObaB/GA4au2hjGKHJ1xHu4bZlJHfzg4Wh5YylA996BjGBEMP2qy+AAKVLsPOEK0+iT7lo+z64w70h+avd6VhjTEfcPFJt0Y5uxP4jcl4KowvxaHsTGy7ObuFS1c+ynyr8vp4zgnzS40S3LGp8JSmtKNBQHx0LfYK9ksq4XDtT1ivwOTpffVvmyPmiPVyyfdS71hQdclgJMNCLyhScTf0X5m8zMOkYG10asiOuny7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QL/00WVXcOIxFlSzf/Gy6ZbHItW9b0dJ0pMNxYrNuI=;
 b=cu0+5bbY0/DWLh/VqCbD8bJ5Ge1WtDXzeIb0zZ0Bn7bYaDdV3hJnTdze4fPLTM8XTbpXkGX8IU5JH1iHYC3BLEaKkEJl7d2tiMApAeuvAZiPqwSwSXeod+kiWzvENK2D7Zf1vUWplaq+Dh9pbe4eT/eNAdrWX3ciAO2wROgIE1SZevdCCu1a6YasrDRWS9titOhaCgP9PSwFfIA682ADgrOaYl4nn9+Im/6ososdOKEsAd2u/6hESCKx5ijAz9HOaqvgdg8x3RVbr6NwIgtjo0FNkXPkp9s6VDW43pMVxf3z1TUxARw6itTycD3vtL5Q2P7bIQMKiZLK4rR/ApoDSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA3PR11MB9112.namprd11.prod.outlook.com (2603:10b6:208:575::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 26 Aug
 2025 07:48:37 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 07:48:37 +0000
Message-ID: <ca2ad08d-e1d7-4687-80c4-8ef82ea6ab77@intel.com>
Date: Tue, 26 Aug 2025 13:18:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/3] lib/igt_fb: Add check before loading PNG file
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Swati Sharma <swati2.sharma@intel.com>
References: <20250819155058.129794-1-kamil.konieczny@linux.intel.com>
 <20250819155058.129794-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250819155058.129794-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA3PR11MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: a798e42e-d8a9-464d-0a70-08dde474f702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|42112799006|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVRJYnRUVkoxVFhaZmJvajdGeloxRzY2NTA3eGMzeTZQa2wwVmgyY1pVQnha?=
 =?utf-8?B?WkEvNFdGQi9ITWFBdkt3T0k1YVVSOXFxYjZHeFlrTGtQdVlRbU96UnFraTJv?=
 =?utf-8?B?eXlBMUE4Y1E1M0xaTTJlNXZiZ2Q0djd3V251bU1LeEV1VEQvb1hlN2Jqbi9K?=
 =?utf-8?B?cEFnWkZPTEt1bzYvVlUrRXhrNHUrK0szZDkxZm8yRWRRT1IzR3dJTnU1MWlL?=
 =?utf-8?B?ZlBzdmFBaDljT2tIeVg1akZCUGxFdDFQWVhOS3l2Q0ZNa1M2TjFRVGNHbGxp?=
 =?utf-8?B?RFJGZ2dZcXkzZStMWGM3ZzZGMU4xQ1Z6T01adGNaMlhMY3kveDB0VTQ3NnVJ?=
 =?utf-8?B?bTBSbGNFcnl1WUZzZlhEbFdpSjMxU1RLcGg3Tmd5bnVDdzNYYWk1Yy9Kd0F5?=
 =?utf-8?B?dlZjd2pjQ0NvYUdjYVdiSnJrZjJOYlo2Y0h1T0xrTWFKOEZoRnU1b3V5dDU5?=
 =?utf-8?B?dDNYRzlJSk1OT0IrTWVyN3dQemVRUmM0eUI3Y21SQ0ZNU3p4S3paY2JyajVM?=
 =?utf-8?B?N1lMNXZVWG5RZVI2QzRZMmJrNzJpVS84Wm44S3piTlBWK2dFaG5CeTYzeEVE?=
 =?utf-8?B?QlluR0QwOHg0ZzhhUysyWVFJOWFsMlE0aDdiRU1vNlAxbDRHOC94N1JIOG5U?=
 =?utf-8?B?NVAydG5QOGZBZys0UWZjcUVCQU01RkhNc0VkSE5EUFpUelUzZzdlYWY2ZGNt?=
 =?utf-8?B?bjFxM00wZk91Uml6VnhWT0lXYXhQUnMvVWV5a3A0WmFHdCtneVJ3Z0xxZk4w?=
 =?utf-8?B?SUI1ZGdYZHQ4OEIzL3NwQVdoRHpMdEI5aDBKSDVzU3QzM1RqUjdrZ3FHaFhC?=
 =?utf-8?B?dHJzVWY3cDFtaHJpMElaS2UxcGVyKzZyaVdZRDY0TGIyNmJGKzlFc1BtZDVa?=
 =?utf-8?B?aHpkcHo2dHVnNXRGb2R4V0FGS2hiWGMwQm8wQktkZHdiZzZHQmZlWC9mdisv?=
 =?utf-8?B?eFkzRnhRemZLSmRtT0tDeVU0Znl4Y0ZxUVFtdTZ4VklsSFNFQ2lxckJ0NEs1?=
 =?utf-8?B?M3NxRVJyMVd3bzZ2SjZqb1VXaFhEY0pSOHJCRnI0VTZNT0g1eVRzTFUxbUZW?=
 =?utf-8?B?aklWbWdXNnlCMTVLSUNBNmtqQmN3eUt2azVZQnJ3a0VYTGZUZk9CemtmTHZu?=
 =?utf-8?B?RTliVU9LSTVSK05nODNnYzI4YjdiSVZsMnZ0Z0ZxOHo0bDQyaW4zTjJPQnY1?=
 =?utf-8?B?aXIrN1o2RFpHOWlPTUJJRGVLSXdxUDlORGZFTjMyb1psMGNXRW4xREx1dDRO?=
 =?utf-8?B?djFmclZiWGtmWVZaY0MzZlNNRXIwK1piVld5U3k2TGpja1h2bTNIUHd1SG4r?=
 =?utf-8?B?Y2J2M1gzVjdPL3YzM3loL09rNTZESHpGZURWdGNXWnpYVDN6bkVMQmpUWita?=
 =?utf-8?B?K0RDSUlyWDhhanNqME9JeEx3YUQ4SWhwNm9xNUNCYjl1cDMvbXVGM2pUQ3Qw?=
 =?utf-8?B?NWdaeVpWeXpNMk0rNUdtTEJYTXVPcDVHRXY1WU9uZnBEUUs5M0E5c0NQNjlh?=
 =?utf-8?B?TDNIV3Q0K3dabDNSZDkrcDU4aGl1OG1rbDgyeW5oaDlpeFVCcXdxakJBSEMv?=
 =?utf-8?B?TG9la2N0R2R4TnJGdlQ0YnJ5djdHQnFNUHdMV09VemJ2TE4zS01IU05UMHVR?=
 =?utf-8?B?M0MxblVGS284ay9SNjZYQmkwY1F5QW01bGVnb0ZqNmlhOEQxTWp0Nm9qM3F4?=
 =?utf-8?B?Wit1SDlReUw5TDFlZG9qbnNuM0d2algvU3AzakRUTXdTUzFuSW5iZXQxTVdN?=
 =?utf-8?B?T1ROelJwN1A0aEFaZGNYUkVJTjErdWRHU0I3V2J2SzIxcmlDa1NTRHlxUEtV?=
 =?utf-8?B?L0drUURIL0RIdjN6TENVL2VOaE5CbDZXRXVVUFBDamxyWk5KRGI3TEtRL3BS?=
 =?utf-8?B?VTkxZ0dMUlZzUDJyNTJCc1pTSzhCMmVkWnE4VlN4RTRKRUc0eFNTcjlEd1Yr?=
 =?utf-8?Q?5YKcW0NY6mQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0lhNFhCZGlLY2lrcTJGOHdSVDNKTDFOVitqaXl2Y0tseENOcEZBaUJCeGRY?=
 =?utf-8?B?TU4relprQk5mTE8zSXdFVW5PS0JiK3lvYmpyRlM4OWlPeG10KzNrR29qSDFC?=
 =?utf-8?B?RlFQbkxYUlJScDFvUE84WTk1ZHA5TVVxeVRoTERlRy9LS0ZTTlhVUjlPVnc5?=
 =?utf-8?B?L0wyY0NLbzRTSWJoa2hBaUdTRE5TeWh0RWllSi9jcG1vdHpBVGlkS0NaZmtN?=
 =?utf-8?B?bWFyY3BJSUFRTlgvTVZ0ck5uVVNPMEE4ZGJ6Sm8xQks0TEtyUDlacHJMNjlB?=
 =?utf-8?B?VDFBWktwaHFUb1N3WkdLUksyQlNNMnJndmF4ZEU5dlJIVkdIQzM4TVIzRXVv?=
 =?utf-8?B?TFpyWmxlQ3luQmQwVEpBUyt3ZEg2SFI0cllCbHhMdFVmRHFjN0g5RTZzNWpp?=
 =?utf-8?B?ZndDWFVCNU5NTEtQQ3libmlBTXREcEVCZkFXV2thYjhkY0QvNW9oWGM0ejha?=
 =?utf-8?B?dFpIczBkclJmaVlGRWs0RytlSi9CL1lNNVlRQnQvSUc4WkM4NWxPaDdJOVVo?=
 =?utf-8?B?WTZjZGV2eHgvWFpFVVk2ZjVsSWRVbDZySzU2UjdyVVM3OEg1UmtrVWpJRUVs?=
 =?utf-8?B?QXdnM2grUDU1dVlRQmNSUE5xaU00Si83R0t5UG5xSW5TNENUWDhOVnRxaXdu?=
 =?utf-8?B?L3plTUtpMnVyY0gzdCtFamhoWURpeUJzdmVJSTV4Nkc3bmVMR2pockJwNWIz?=
 =?utf-8?B?QmMzdWJQSGNHVjdvRDFVUUpLR0NpVS9KYnpxQngrTXZoWTJEUW1pZTBtY3ZU?=
 =?utf-8?B?eEVKVGhIbFVWdXRGRG9KK1E4ZHQ5MEtEWmErV2p2K0ZWQ2trK1k0U1IvUm9V?=
 =?utf-8?B?UjlGd29qR2QzaDNYeGNNV1lWQ1JmMXIvNjZUaE5vTjgrTnk4S25xcGxWRXRL?=
 =?utf-8?B?REFMQlJNTmRFNXFZM3BHUlFvL2s4enBwSGx0Y2VtQ1NYaVFESUZKcEpjTUdP?=
 =?utf-8?B?aU1Za2IrWGFmUlVqcFJoS2tkSWdoMThmd0NsZEVJVHhPRW93bDR0T0lYRzhP?=
 =?utf-8?B?eUFMUkdvLy82SXBsdUVNY0dqMVcremQwd3dTV2FocnM5Ky9ia1d5clp4M0th?=
 =?utf-8?B?SjlpZHdwM3Fyd0F6eDY5eEJhaXlhcFArazA1RFhxRjFXaUk0bHdkNUpVR1pX?=
 =?utf-8?B?UGgzNFVRSWRQVkh2dHJkL2tIbEZTY2xvZWZuWFVXL01tMnJiazh3S3UrdVpC?=
 =?utf-8?B?QnMwRDA0VHZ5ZWxjQ0dsY3lkc2hKT0dsRVJjWmE3dWNSdWh4djl6QXhWSnpD?=
 =?utf-8?B?WE1rR2FPNXE0N2pIb0lHZCtYOEhKNzVlRkNNZFJkVEdsclhBbTFvNC85TGtv?=
 =?utf-8?B?TjF0Z1BNMThsdEpacm1zOTZ6RlRCK1lUU0xnS0wyUW9naE1MMjJmS1l6Tjh4?=
 =?utf-8?B?WEpnNmJia05TNlNqbXdjbFVtRFYyQkRpR1dJM1ljdVFPOHhsTWxaZjFUbG1z?=
 =?utf-8?B?d2hwMFlZMWd3VmR0RjlNcStheDRqV2QwY2R6Y3lEOXB6VUFNY1NpOTE5S2tC?=
 =?utf-8?B?K3RUSmQxbmovczhhV09ib1JoMWJVUEp3WUg3T1FmUUZzYmlzaDhCbFVERXVx?=
 =?utf-8?B?VnBFa0M2MTQxOTZtSWFGQ2I5MVk1cFAyWUdHUkJuWEJhRFhJZnlaZzkyU3Nh?=
 =?utf-8?B?bjBaczI4ckdxeVBtUWdUTzFCOFJGL2kvZjBaaGF3Wk4vTDdPR1JhcDYyMmli?=
 =?utf-8?B?NWQyWVRicmg3MGpFWjhVY1FaRlJFc3N4aDhHL2pzSmpWTUphNytJSVdkeUlo?=
 =?utf-8?B?ZFU5RjZkMnIzRUpHM3d3d0NpQ0pRejZJajIyUm01OVRvbU5ZMVlpT0RlMjJm?=
 =?utf-8?B?ZFRHKzBFTWsrZFQ1OWRxV3A1ZzdsRjErWVlEYUM4M05ZUFphaG1Ma2pvdDM1?=
 =?utf-8?B?UmZBb0I4QjdBMTgwb2FqVHpUbUhyblJtR09wV0c2TW1wTEdZMlM2QldFeTFI?=
 =?utf-8?B?MllRWGV1ampOS1NJeGRBaXBXWHBYeWdwNEIvZGl0M3dlaitTMHdXK1NjeEk3?=
 =?utf-8?B?d29SNGNabnNSTWZSYlFFejNKSDdlRHFaK09rRHNneldwYXdBdjBxMUJxQ3BI?=
 =?utf-8?B?alVoc2NLRFdBNU1wcjhDa3RZNGZDcm5kS2dDK1pUQ0M4SjFTVnhYYUg5N2tY?=
 =?utf-8?Q?RvWdTcYb06Fga06Edki1iIoEB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a798e42e-d8a9-464d-0a70-08dde474f702
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 07:48:37.1604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4qyPzQr9AwJweADk/3ZLE0juWPVYq3uUREZ4n6WdDtuz/F/4hC6aMXz5KbaT+7QkVzJTUg7s6azWJaC4MP7hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9112
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


On 8/19/2025 9:20 PM, Kamil Konieczny wrote:
> In some configurations loading PNG data file fails simply because
> file was not found on path or it wasn't copied during
> installation. This in turn ends up in SIGSEGV error in cairo lib.
> Call cairo lib only when file open actually succeeded.
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_fb.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 9fc1bfc65..f42f37917 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2028,12 +2028,14 @@ stdio_read_func(void *closure, unsigned char* data, unsigned int size)
>   
>   cairo_surface_t *igt_cairo_image_surface_create_from_png(const char *filename)
>   {
> -	cairo_surface_t *image;
> +	cairo_surface_t *image = NULL;
>   	FILE *f;
>   
>   	f = igt_fopen_data(filename);
> -	image = cairo_image_surface_create_from_png_stream(&stdio_read_func, f);
> -	fclose(f);
> +	if (f) {
> +		image = cairo_image_surface_create_from_png_stream(&stdio_read_func, f);
> +		fclose(f);
> +	}
>   
>   	return image;
>   }
