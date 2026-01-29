Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD33BD61020
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 15:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B1D10E156;
	Thu, 29 Jan 2026 15:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3Ni6+g6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996C410E156
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769699943; x=1801235943;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=VEWiqxtad14Uxw/6fpbyX0phoFOg2DsqxZ8Y15LYzYQ=;
 b=i3Ni6+g6qvoweltmV+DYCa/D/efxaN0Q15hw6fL6wXQkzOGTQfimSvwx
 JfyPx2qpbZIFNhFbbuPGlMwhEJlj2BKLa08fN/6IAak3j2O4fOdOCwI9c
 4EWNeM5o5uKux7J4CX9QXuijXBguWYLz/mIJTrHn8fuHN2FeHADCkgu+E
 zUNjcS/8qhDDHG9pwAvgujoWZ7M6y+yK2f1R3wtDbu6GgHe7UWvNZn3yy
 mDPOBuMwzZBJeLbTuB3a2vflOlXg55BYrLWccHWWiDktTgGnTONNe4vbF
 bugLNa7hMOlnP9DQkPCNYANZ38EWn+domSABeIQ/sxJ8dqWHnufch9Cdk g==;
X-CSE-ConnectionGUID: mDSoBGO5SxSgOtMR+oZODw==
X-CSE-MsgGUID: ovVS1WtKRCm6TWLGM9uWow==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74793409"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208,217";a="74793409"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 07:19:02 -0800
X-CSE-ConnectionGUID: dwOMFVvVT22mU4KHBlavdg==
X-CSE-MsgGUID: Tr8BvGlmRNm3iRgoOJzUyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
 d="scan'208,217";a="231519206"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 07:19:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 07:19:01 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 07:19:01 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.36)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 07:19:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBAUhFyZ1+n1JgDmDGcfnPeLHXQ79bad2lr6CyKdEjVCpPux4QrNoZM371SbZyRANNuXfZU0NXP62p7iYaY5pXkVAqyit9c/Kgs/WT3mbS0yAa9p8FgUCLhESftjO1WMf2EofvXqjWgTA7uQgEFTIiLUGVoVGQUy5clL3LMSP7wybgq0AYP/cZVPYC0jc7b3MEc/TAxhnIamuGmziD8IgUrHQpY/d3/28YRh+SkIJExgts+2OYbVEUDMyIk85AQYdS8f6uZf6VkOtfB69BNdD1USktowY2qBXHw8FM84oU4xZw+ZtlI5YM8NeyDrVg19o6IhiT4s7+13VIHpF5K3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tFog1E7DKc8ZC7A0MdbtWZFDX4UDLFERoZoWwnTA0E=;
 b=rFzGN26mPnm6nrjkdxsl5rAlG8de+rGRyMNMykbq8Js/Q3ucIm7v2xxRmHUPUhbdeO2TppwvPg1sJOqUbu9fqvrZ1tf9XPX6Xfb8IlPCTDD/OS8uTBO+3m15wikL2lHJJkaOSJrg4zWDNMWLZp7TUAHF/3hLSvcDBHEyd6SfalvoJPji/GwDRM63vN7XDilgsSKrEiKKBoUwsyD6iqPPm8qUJsD3Qh86QWCQktnn7I8WTr5eskeiO3vUSAGIBs5tMGCpqfODpA76y7RVF/jW+qBBSs4PNcKZBaayIN0/TFImsEjXD26AjV8rpAtc52hRbuoax35rMCJsTYc3e/E2Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 15:18:51 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 15:18:51 +0000
Content-Type: multipart/alternative;
 boundary="------------IlhNl15uU9EDCAPRNTMNuYus"
Message-ID: <724625bb-cc38-4c28-b4f0-4c99d4d47ec3@intel.com>
Date: Thu, 29 Jan 2026 20:48:44 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/kms?=
 =?UTF-8?Q?=5Fflip=5Fscaled=5Fcrc=3A_Move_require_checks_at_the_beginning_of?=
 =?UTF-8?Q?_the_subtest?=
To: <igt-dev@lists.freedesktop.org>
References: <20260121052158.491159-1-karthik.b.s@intel.com>
 <176901833393.179413.6167470932274016673@a3b018990fe9>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <176901833393.179413.6167470932274016673@a3b018990fe9>
X-ClientProxiedBy: PN3PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::23) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 128a1fbd-42dc-48df-1f77-08de5f49b4b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|42112799006|366016|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVdDVlFUU1dXQjRRakE4Z3NlcnZJS2RZRXIzd09OaVRyR0duVmdYOGR5SnZu?=
 =?utf-8?B?REVGUC9xUXpKc1N2cDlreGdYMUtMeUZRN1p6MThRZlN5NkI0a0w1SFhEYnln?=
 =?utf-8?B?VGx1T0s5Ykd1TUxuQlNpSUpYQlhVejR1MmQyQytsaTVaaERWNUo2WTVrdlpX?=
 =?utf-8?B?Y29FNXBUZUI0dEczUWJYanJZRVlTZ3F1ODV5SkE1OGptc0xldVFBWC81U200?=
 =?utf-8?B?Yi91R3N2cW1Wam12Ni9wUmk0aHQ3Nk1MMUU1a2RVdmo5aWVRR1RMSmdpVXJ3?=
 =?utf-8?B?bFpWZ2hNMk01Z3lMVFFqd3dWNmsrYjVFakZSR0RUaFlVdkFNUjNPNUs0Rm1o?=
 =?utf-8?B?NUU2NmEzWVlVbEpScFNlK0lIT21uSU9UUVlaR0ptM1FWbUFpVW1GUEFIRy9K?=
 =?utf-8?B?NjdBd09WbmROSmZkY1pUZ0x1TjNxSmlzY3ZhSkZGSVpoWU9lSmpNV0lYWHI5?=
 =?utf-8?B?WkVQUVlrUXUrTkxubGZUTW9KWjAxWFU0K1ppVnR2RGtxT0lPREVKWFBEdHNU?=
 =?utf-8?B?NXhKQkNLOHlXcGY4NGtOTURKZGs1bkxtbHlDSUxpZkx1aUlwQUVhYUUrb3hL?=
 =?utf-8?B?Ryt3UzdENk9zK055L0paK2lNSXBZRDlzQUtOQjhtRHBSb2NRU01LVDNLcDNY?=
 =?utf-8?B?aDAwdk1MaXVKUk95dnRGUEpiMVM4bDhWOGoyY3RaOTBZa1JvbjhFNWMyR3pU?=
 =?utf-8?B?aXkrVk5UR01jSnV5c2tMTmlrZHJiTE4xSnpteXVzbG14cDRDNE9Pb01PYmdS?=
 =?utf-8?B?VXhVTkxybFJlTmlMdGZqTXAwMjdIR25lZ2F1VCsxLzN1dklmdUxuU0xpZkNE?=
 =?utf-8?B?WkcvcEZmZlB6WmVFcDVodXlXaThmOW1OSERURFNDN3ZDYWVGbThGd2YzRVhk?=
 =?utf-8?B?MjgvdUg0UHR5cDlqMUd2SmgwMVc4NnZ1UWRTckg3NE9vN21veVZhMW5YWHA0?=
 =?utf-8?B?R0IzcjFtNTFzZ3h0R3I5TFpFSFRqeTR2ZE9teUt0Y05EWGtWVFJvZnVhUkQ4?=
 =?utf-8?B?RVpsNGROSjF6MHR0OEVDWGRSWml4UHRKb3N5RVgwN0h1UGtNM01aZHgvV0t3?=
 =?utf-8?B?dGNEK2RRZ1YvSTJLYlFqdHVUYVE3aFFicWxhcTc1UUNXQlduRTVCV1k1cGoz?=
 =?utf-8?B?ZjlrbEFKdkdRV1BoRXNHRGpmUEdKMEFjVmhxaFlWejgzcHNsSmxyYnA3enJr?=
 =?utf-8?B?QU1CWndzVEVvUjhSZDN1azY0dTh3MU9wb3VnUnV6N0xyS2EzTnVsMUppd1Yr?=
 =?utf-8?B?eVUwYW9VV1lxNmhXMG9RNTVzWWp6NGZ1ZVh2OXk2TEZtLzdKZGZ1V20xWXRz?=
 =?utf-8?B?OGFMZXg1WmZpd2kvRDVtSkhwNWdhb3pHbUlsS3FocHZWMmZiMUluMG0vQmhB?=
 =?utf-8?B?UmEzWVhOVkMwVGViNVlJMWphaWFpVXBUMTEzam1SWlFoNW9sMWNwT2hKUjUv?=
 =?utf-8?B?bjBUQWxFa2FBT2lienBhZ1d1by8wT3Y1SkpDYlpkNkx5UGdTZWpQWkF2NFQ5?=
 =?utf-8?B?QU9qbkNmUjBDVUR5OVYwa3lRaCsrODgvWGxIUGxFYndIMHJTYXAySmRmeFdK?=
 =?utf-8?B?NkQvUXBSVnpVQ0pjdEhJQ24xM3JWaVhlYWNSN0c4T2NJTUFidnhoUlo2SWZ4?=
 =?utf-8?B?dVBSMHNpbzVyWjJCckVGR24wNW9VV2VwT1NQelVQSUlUMnBaLzlLVktmSm1L?=
 =?utf-8?B?R1o2R2MvT2ozU3N0cVlPb1hOaFN6L1lNQ2tGZnRGa0RkZ2tLK3hhbnhZbU9i?=
 =?utf-8?B?WTAwRVhrUmw3UzBlakUxRUlYNXNTZ2w4Y1pGSVpiUlNTR1RmSmZacHFpcGRK?=
 =?utf-8?B?djA1U2dnTmpwTThBTHpRc2drRHVtSlhNVXdleHliYWdVYlF2amMvbzJvTHNC?=
 =?utf-8?B?YWt1NTVjZUZBNjc4Q1pSRXRvS01PQ1lPTVlCMlZFbnJYeis2TVIvWDZQbmU2?=
 =?utf-8?B?NUlZUFVvajBHQ3hmY2xUQlFuYkNwWm4xSER2Tkl4T2VNVUhwaVowTWNzd0xy?=
 =?utf-8?B?azc4STFqeklXWFFBU1llbXVnK2s4ZVlqc2o0NjJnc2NUSHlETXA3MUg3Uyt4?=
 =?utf-8?Q?9u5lzh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(42112799006)(366016)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajZpcHNITmZWcFRzOE9yVFBENHpOcUFyMnpwMDBleENLRDJhZDloL0lGbElM?=
 =?utf-8?B?cFdLeWVYU2VuK2t0WHRtSG5YVllrTld2V0Nnc2NIYnFvK2VYLyswOXB1WmVQ?=
 =?utf-8?B?aExjWUZ4MW9tSWNoQlU0RUt0MTRRdkNiUHcweDVsbnpVamw5bXVrcXJHcXVw?=
 =?utf-8?B?YmgzZWZqNTlwTWNJWEMrU1pCSENjc09ncC9KV3ZYYUFxQzNDeDdwWjNCemRY?=
 =?utf-8?B?aVUraHNMOEhYNllycm5LNk1GcUF5bDNXemNRcVBxZjV2V25KSWJsT3ZlZGRX?=
 =?utf-8?B?U0E4dHBvNER1ZzVzU25aM3FEeEgzcTFRczJVWlN2ditMNlFGSzZMWFgrbUV1?=
 =?utf-8?B?NTBsdXI3MlN6Rk82ODZ1WkNTL0t3R0hmZHRPbkUwQ0V5Mzcvekh5Q2RYbVFx?=
 =?utf-8?B?dmR3WFNWVjNUUWR3UEpXY1BYOWs2T1dkN3h0eFFpZC9JRnh3akx3aWhrSDBW?=
 =?utf-8?B?ZnB3WFdLMDJGZlZOQTVVOHdIWmhDN1BpdUxmTlNKd3dSeTNlcGJtcXV6VTFU?=
 =?utf-8?B?MUFoc0VHekVxaTl6Szh5L2NMNGVuMW4vNUtIR2VYSWZaM2trYU85ODJ5a2JJ?=
 =?utf-8?B?dGRiWmNCaHNoem90V1lQNHBPVG1zRGk5UEdqdTlTL0wzRit1MFlqdTB6eTh2?=
 =?utf-8?B?S2RsREN1ZFJadVRISEpXL2VMbmNpcTIzaDl3QXpBWmMyYWZORWtwaXBIYkc5?=
 =?utf-8?B?Q3lEMlNyaXpPc2lJL0taUmp1TFQ1MFkvRUM5VE5ncW0yMmU2akhXSEFmNity?=
 =?utf-8?B?SDZNQjEwZUV4TVMzZmVIUUpyOFNCcmp0ZUltYjFBY2pXZnc2STFmT2lKckFp?=
 =?utf-8?B?NUJUMlNCZkQzUEJxMXNYbHgzcVRHeHlYdXoyNkw2cVJuREYzTjlYNWtsV1lz?=
 =?utf-8?B?SUxFZDlkOEZlWXF2azRKVTh5ZGIxeExwZGRtYVd6SW1XWFFXTndHaDlIa1BU?=
 =?utf-8?B?V1VwbUdwZ280SnpESldKU1pVRXM0RkFDMnFrbXNhYXYxWWpiZE5aczkyL3hw?=
 =?utf-8?B?eGhMaDdoalhrb0Fidm5hWUoxeFpFUlhWanFXZDNtSHR0SzU2WHpmSmJtQUty?=
 =?utf-8?B?aHduYTRzQWJBb2VJK3pJSFJ6WVp6bEtZUG9xOEg1SU4xVEVDa1pYakZHZ3F2?=
 =?utf-8?B?MlNjMDJMNEdHODRzcTQ0SW1pSzhTY1N1NzlpMEp0OG81SE8rQlAxMWNCbnRa?=
 =?utf-8?B?cmRYZ1pZQ1BNWVVsNm5CL3JycHRtTWtIUFBiK1h1ajZiZVZNMUVqRmY0UVJX?=
 =?utf-8?B?SHE5NEtCUDdJcGdJdU9mM1VVR0lTYkFrNGxsYjJLV2FMUks5T1dmM0hYclVK?=
 =?utf-8?B?dnJVVkRnajhEWDZCbm5MZE5TYVdTMWdQUXNHMi9CTXJqRVZTMzFLMUJXZ0VI?=
 =?utf-8?B?ZzVOeEkwNWNSYWR0MDlRNEUyalZKalJqb1RsNUpMR1hyUms2a3V2YVlaQVRn?=
 =?utf-8?B?ZGtRMmRvaE1ldThTSzNZbFh5T3BEUUFHSmRDWTh1dUpZY2ZvR3NWSXorM3V2?=
 =?utf-8?B?ZUFaN3pyaHNTZW1uQ1VVYXF1SDNHUDRrcS9zc0ZGdkNReUM3aGtOczliaU1j?=
 =?utf-8?B?anpUaHp1QlFFYUJDQVNUUWtCYUttUTlTNWVZZlJEUWRtNjhsMTJtdEJrNlln?=
 =?utf-8?B?SDZ0MEF3amFWcFYvdmo4dVgrR0drK1EzdG9CaEZxdlpNVFI2SkdQVE9EbExN?=
 =?utf-8?B?c0RuT2FtRExzamZOa1lLa3A0bnlWSjN1Vm5hZ1RTWWJhbVA1NTkzREoyS1J2?=
 =?utf-8?B?RStnVGlrVHc0K2pWT0tycDZUK25seDU1RUJuMXFuVHV3ZDluWDkxeGQ5L3Bq?=
 =?utf-8?B?RWVnd1ZON1B0RWNqblBDNVlwSTdlWjV2Y2VFY1h2WUREOTNTT3N1aWNFaUw1?=
 =?utf-8?B?K0dGM2Y2bVQ4VXI0SEh6UlhyZjlDTGpwZUd1aGl1QWo5ZnU0b2JpQml2aTd6?=
 =?utf-8?B?Vm8vbFlwV2podW82eStUMDV5c0FwT1Q0R1o2bzJybTZuMTcyMWNteWpwOTJW?=
 =?utf-8?B?L20xTDM1eWtZZWkzUXRMSnE0YlhYYXNKU2JPbzZtTmRxRHNSaEUvZ3VqcWZt?=
 =?utf-8?B?MDVYSWtXYkJJRDR1OVFPOElrY2tyZDU1YTA3MTF6Wm1MWGhncG5NTzJPK1JX?=
 =?utf-8?B?dXBud1FHVTYwbFZ3aVc1aE1DRUFYbGdQcGpqYU95dFpjSld1OHhMOVBJdnh6?=
 =?utf-8?B?dVhuU3p4eGFyNEhPbTE5eUppdUxlSm9LbGM1dG1KYU5jOGxQWWErVWVUVG50?=
 =?utf-8?B?ZkJDclREUURjMFRrV3BVY291eDFnQzNNb0Q2N25xWUlZOWYyTGVibERyK2o5?=
 =?utf-8?B?bWh5UHlCRGNod3VmbjE4TEtzL3RGOGFlVkJIY2hwampHaFkvVnlkQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 128a1fbd-42dc-48df-1f77-08de5f49b4b6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:18:51.5056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e46Qk+5DyuYVp7DgPmOGidcTd6XwJhOykZsn/AMDCteMoYWGYUBcwtPCrTI1siRib9lNl3NWnYb5D74wSxk3aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
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

--------------IlhNl15uU9EDCAPRNTMNuYus
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

The change in output of kms_flip_scaled_crc@.*reflect-x tests is 
expected as test is now skipping before triggering the dynamic subtest. 
So not a genuine failure.

Will go ahead with merge.

Thanks and Regards,
Karthik.B.S

On 1/21/2026 11:28 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/kms_flip_scaled_crc: Move require checks at the 
> beginning of the subtest
> *URL:* 	https://patchwork.freedesktop.org/series/160397/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/index.html
>
>
>   CI Bug Log - changes from CI_DRM_17859_full -> IGTPW_14386_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_14386_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_14386_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/index.html
>
>
>     Participating hosts (9 -> 9)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_14386_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html>
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html>
>         +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html>
>         +4 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html>
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html>
>         +1 other test skip
>
>
>         Warnings
>
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         +12 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html>
>         +12 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html>
>         (i915#15573
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15573>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html>
>         +3 other tests skip
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html>
>         (i915#8813
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html>
>         +3 other tests skip
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html>
>         (i915#15573
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15573>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html>
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html>
>         +2 other tests skip
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html>
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html>
>         +11 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html>
>         +16 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8813
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         +24 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-8/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html>
>         (i915#15573
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15573>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html>
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-19/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html>
>         (i915#15573
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15573>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html>
>         +3 other tests skip
>
>
>     New tests
>
> New tests have been introduced between CI_DRM_17859_full and 
> IGTPW_14386_full:
>
>
>       New IGT tests (33)
>
>  *
>
>     igt@i915_pm_rps@4-tiled-8bpp-rotate-0:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@all-busy-idle-check-all:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@bad-size:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@basic-cpu-noreloc:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@cursora-vs-flipb-toggle:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@fbc-1p-offscreen-pri-indfb-draw-render:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@fbc-2p-primscrn-spr-indfb-draw-render:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@int-max-clock:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@invalid-signal-one-illegal-handle:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@linear-16bpp-rotate-180:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@psr-argb161616f-draw-mmap-gtt:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@reset-signaled:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@syncobj-invalid-flags:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@i915_pm_rps@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@alloc_timeline:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@alpha-opaque-fb:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@bad-fence:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@bad-flink:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@coherency-sync:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@crc-primary-basic-4-tiled-dg2-rc-ccs:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@cursor-onscreen-32x10:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@fbc-psr-basic:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@fbcpsr-1p-primscrn-cur-indfb-move:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@invalid-flags:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@nullptr:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@resubmit-new:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@wait-all-complex:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@wait-wedge-10ms:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_cursor_legacy@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o Statuses :
>       o Exec time: [None] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_14386_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@api_intel_bb@object-reloc-keep-cache:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@api_intel_bb@object-reloc-keep-cache.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@api_intel_bb@object-reloc-purge-cache:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@api_intel_bb@object-reloc-purge-cache.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@gem_ccs@block-copy-compressed:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-10/igt@gem_ccs@block-copy-compressed.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_close_race@multigpu-basic-threads:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@gem_close_race@multigpu-basic-threads.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@gem_close_race@multigpu-basic-threads.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>  *
>
>     igt@gem_ctx_isolation@preservation-s3:
>
>       o shard-glk10: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk10/igt@gem_ctx_isolation@preservation-s3.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         +1 other test incomplete
>  *
>
>     igt@gem_ctx_persistence@processes:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-snb6/igt@gem_ctx_persistence@processes.html>
>         (i915#1099
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099>)
>         +3 other tests skip
>  *
>
>     igt@gem_ctx_sseu@engines:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@gem_ctx_sseu@engines.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_ctx_sseu@mmap-args:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-3/igt@gem_ctx_sseu@mmap-args.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_exec_balancer@bonded-pair:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html>
>         (i915#4771
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771>)
>  *
>
>     igt@gem_exec_balancer@parallel-balancer:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-10/igt@gem_exec_balancer@parallel-balancer.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_balancer@sliced:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@gem_exec_balancer@sliced.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@gem_exec_balancer@sliced.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>  *
>
>     igt@gem_exec_flush@basic-batch-kernel-default-uc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>         / i915#4852
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>  *
>
>     igt@gem_exec_flush@basic-uc-prw-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@gem_exec_flush@basic-uc-prw-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>)
>  *
>
>     igt@gem_exec_flush@basic-wb-ro-default:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@gem_exec_flush@basic-wb-ro-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>         / i915#4852
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>  *
>
>     igt@gem_exec_params@secure-non-master:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_exec_params@secure-non-master.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-3/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +5 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +4 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-gtt-active:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@gem_exec_reloc@basic-write-gtt-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +3 other tests skip
>  *
>
>     igt@gem_exec_schedule@preempt-queue-contexts:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@gem_exec_schedule@preempt-queue-contexts.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>         +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-6/igt@gem_exec_schedule@preempt-queue-contexts.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>
>         / i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>  *
>
>     igt@gem_exec_schedule@preempt-queue-contexts-chain:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>
>         / i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>         +1 other test skip
>  *
>
>     igt@gem_fence_thrash@bo-write-verify-y:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@gem_fence_thrash@bo-write-verify-y.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>  *
>
>     igt@gem_fenced_exec_thrash@no-spare-fences:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>         +1 other test skip
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-7/igt@gem_lmem_swapping@heavy-verify-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +1 other test skip
>  *
>
>     igt@gem_lmem_swapping@verify-random-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-5/igt@gem_lmem_swapping@verify-random-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +1 other test skip
>  *
>
>     igt@gem_media_fill@media-fill:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@gem_media_fill@media-fill.html>
>         (i915#8289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289>)
>  *
>
>     igt@gem_media_vme:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@gem_media_vme.html>
>         (i915#284
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284>)
>  *
>
>     igt@gem_mmap_gtt@basic-short:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@gem_mmap_gtt@basic-short.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +3 other tests skip
>  *
>
>     igt@gem_mmap_gtt@cpuset-medium-copy-xy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +7 other tests skip
>  *
>
>     igt@gem_mmap_offset@clear-via-pagefault:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-7/igt@gem_mmap_offset@clear-via-pagefault.html>
>         (i915#14809
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809>)
>         +1 other test abort
>  *
>
>     igt@gem_mmap_wc@coherency:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@gem_mmap_wc@coherency.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +2 other tests skip
>  *
>
>     igt@gem_mmap_wc@read-write-distinct:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@gem_mmap_wc@read-write-distinct.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +1 other test skip
>  *
>
>     igt@gem_partial_pwrite_pread@reads-uncached:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@gem_partial_pwrite_pread@reads-uncached.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +4 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@gem_partial_pwrite_pread@reads-uncached.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +3 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@gem_partial_pwrite_pread@reads-uncached.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +3 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-8/igt@gem_partial_pwrite_pread@reads-uncached.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +1 other test skip
>  *
>
>     igt@gem_pxp@display-protected-crc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@gem_pxp@display-protected-crc.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         +1 other test skip
>  *
>
>     igt@gem_pxp@verify-pxp-stale-ctx-execution:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@gem_pxp@verify-pxp-stale-ctx-execution.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         +1 other test skip
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>
>         / i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>         +5 other tests skip
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html>
>         (i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>         +2 other tests skip
>  *
>
>     igt@gem_render_tiled_blits@basic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@gem_render_tiled_blits@basic.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-19/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>  *
>
>     igt@gem_softpin@noreloc-s3:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk6/igt@gem_softpin@noreloc-s3.html>
>         (i915#13809
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809>)
>  *
>
>     igt@gem_userptr_blits@access-control:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@gem_userptr_blits@access-control.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@dmabuf-sync:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk5/igt@gem_userptr_blits@dmabuf-sync.html>
>         (i915#3323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323>)
>  *
>
>     igt@gem_userptr_blits@readonly-pwrite-unsync:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@gem_userptr_blits@readonly-pwrite-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@readonly-unsync:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@gem_userptr_blits@readonly-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_workarounds@suspend-resume-fd:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-2/igt@gem_workarounds@suspend-resume-fd.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_workarounds@suspend-resume-fd.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>  *
>
>     igt@gen9_exec_parse@allowed-single:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@gen9_exec_parse@allowed-single.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@gen9_exec_parse@allowed-single.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +1 other test skip
>  *
>
>     igt@gen9_exec_parse@bb-secure:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@gen9_exec_parse@bb-secure.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>         / i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +1 other test skip
>  *
>
>     igt@gen9_exec_parse@unaligned-access:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@gen9_exec_parse@unaligned-access.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@gen9_exec_parse@unaligned-access.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +1 other test skip
>  *
>
>     igt@gen9_exec_parse@unaligned-jump:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-6/igt@gen9_exec_parse@unaligned-jump.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>         / i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +6 other tests skip
>  *
>
>     igt@i915_drm_fdinfo@busy-check-all:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-13/igt@i915_drm_fdinfo@busy-check-all.html>
>         (i915#11527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527>)
>         +5 other tests skip
>  *
>
>     igt@i915_module_load@fault-injection:
>
>       o shard-rkl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@i915_module_load@fault-injection.html>
>         (i915#15342
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342>
>         / i915#15481
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481>)
>  *
>
>     igt@i915_module_load@fault-injection@i915_driver_hw_probe:
>
>       o shard-rkl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@i915_module_load@fault-injection@i915_driver_hw_probe.html>
>         (i915#15481
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481>)
>  *
>
>     igt@i915_module_load@fault-injection@intel_connector_register:
>
>       o shard-rkl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@i915_module_load@fault-injection@intel_connector_register.html>
>         (i915#15342
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342>)
>  *
>
>     igt@i915_module_load@fault-injection@intel_gt_init-enodev:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html>
>         (i915#15479
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479>)
>         +4 other tests skip
>  *
>
>     igt@i915_module_load@reload-no-display:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-17/igt@i915_module_load@reload-no-display.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@i915_module_load@reload-no-display.html>
>         (i915#13029
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029>
>         / i915#14545
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545>)
>  *
>
>     igt@i915_module_load@resize-bar:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@i915_module_load@resize-bar.html>
>         (i915#6412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412>)
>  *
>
>     igt@i915_pm_freq_api@freq-basic-api:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html>
>         (i915#8399
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>  *
>
>     igt@i915_pm_freq_api@freq-reset:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8399
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>  *
>
>     igt@i915_pm_freq_api@freq-reset-multiple:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-multiple.html>
>         (i915#8399
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>  *
>
>     igt@i915_pm_rc6_residency@media-rc6-accuracy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html>
>         +9 other tests skip
>  *
>
>     igt@i915_pm_rc6_residency@rc6-accuracy:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +1 other test fail
>  *
>
>     igt@i915_pm_rpm@system-suspend-execbuf:
>
>       o shard-dg2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-3/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>  *
>
>     igt@i915_pm_rps@thresholds-park:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@i915_pm_rps@thresholds-park.html>
>         (i915#11681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>)
>         +1 other test skip
>  *
>
>     igt@i915_suspend@debugfs-reader:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@i915_suspend@debugfs-reader.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@i915_suspend@debugfs-reader.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>         +1 other test incomplete
>  *
>
>     igt@i915_suspend@fence-restore-untiled:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@i915_suspend@fence-restore-untiled.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +4 other tests skip
>  *
>
>     igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-10/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#9531
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#9531
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-addfb-size-overflow:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (i915#5138
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +7 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +3 other tests skip
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>  *
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-16/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +4 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>)
>         +3 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +214 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +56 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +135 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#10434
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +1 other test skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +60 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html>
>         +298 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +39 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (i915#12805
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +5 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +29 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +64 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +8 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html>
>         (i915#13781
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781>)
>         +3 other tests skip
>  *
>
>     igt@kms_cdclk@plane-scaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_cdclk@plane-scaling.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@kms_cdclk@plane-scaling.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>  *
>
>     igt@kms_chamelium_audio@dp-audio:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-5/igt@kms_chamelium_audio@dp-audio.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +9 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@kms_chamelium_audio@dp-audio.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +1 other test skip
>  *
>
>     igt@kms_chamelium_color@ctm-max:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@kms_chamelium_color@ctm-max.html>
>         +1 other test skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +1 other test skip
>  *
>
>     igt@kms_chamelium_frames@dp-crc-fast:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@kms_chamelium_frames@dp-crc-fast.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +3 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-fast.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +4 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +4 other tests skip
>  *
>
>     igt@kms_color@deep-color:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-11/igt@kms_color@deep-color.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-8/igt@kms_color@deep-color.html>
>         (i915#12655
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@kms_content_protection@atomic.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#7116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_content_protection@atomic.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-9/igt@kms_content_protection@atomic-dpms.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#7116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116>
>         / i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@atomic-dpms-hdcp14:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_content_protection@atomic-dpms-hdcp14.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>)
>         +1 other test skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>
>         / i915#3299
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-0-hdcp14:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>)
>         +1 other test skip
>  *
>
>     igt@kms_content_protection@legacy-hdcp14:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-10/igt@kms_content_protection@legacy-hdcp14.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-4/igt@kms_content_protection@legacy-hdcp14.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>)
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@kms_content_protection@lic-type-1.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-3:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-3.html>
>         (i915#7173
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>         +1 other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-32x10:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +5 other tests fail
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-32x10:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-32x32:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-128x42:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-4/igt@kms_cursor_crc@cursor-random-128x42.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +3 other tests fail
>  *
>
>     igt@kms_cursor_crc@cursor-random-64x21:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@kms_cursor_crc@cursor-random-64x21.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_cursor_crc@cursor-random-64x21.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +2 other tests fail
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-15/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x170:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x21:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +4 other tests fail
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>         +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>
>         / i915#4213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>  *
>
>     igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-16/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html>
>         (i915#4391
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         (i915#9809
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         (i915#13046
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>  *
>
>     igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-mtlp-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html>
>         (i915#13562
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (i915#9833
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833>)
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>  *
>
>     igt@kms_display_modes@extended-mode-basic:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html>
>         (i915#13691
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_dp_aux_dev:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-11/igt@kms_dp_aux_dev.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@kms_dp_aux_dev.html>
>         (i915#1257
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257>)
>  *
>
>     igt@kms_dp_link_training@uhbr-mst:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-4/igt@kms_dp_link_training@uhbr-mst.html>
>         (i915#13748
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748>)
>  *
>
>     igt@kms_dp_link_training@uhbr-sst:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_dp_link_training@uhbr-sst.html>
>         (i915#13748
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.html>
>         (i915#13748
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dp-fallback:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (i915#13707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dsc-fallback:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html>
>         (i915#13707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>)
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-9/igt@kms_dsc@dsc-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_feature_discovery@chamelium.html>
>         (i915#4854
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-16/igt@kms_feature_discovery@chamelium.html>
>         (i915#4854
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-6/igt@kms_feature_discovery@display-2x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_feature_discovery@display-3x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-10/igt@kms_flip@2x-absolute-wf_vblank.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-modeset:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-5/igt@kms_flip@2x-flip-vs-modeset.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +11 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-15/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip@2x-modeset-vs-vblank-race:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +5 other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_flip@2x-plain-flip.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +1 other test skip
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk5/igt@kms_flip@flip-vs-suspend.html>
>         (i915#12314
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314>
>         / i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>
>         / i915#4839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>
>         / i915#6113
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113>)
>  *
>
>     igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html>
>         (i915#12314
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314>
>         / i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>
>         / i915#6113
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8810
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810>
>         / i915#8813
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html>
>         (i915#8810
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810>
>         / i915#8813
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (i915#15104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (i915#15104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html>
>         (i915#15389
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15389>
>         / i915#6880
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880>)
>         +1 other test fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-suspend:
>
>       o shard-glk10: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk10/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>         (i915#10056
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (i915#10055
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +16 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +5 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +5 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html>
>         +18 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html>
>         +49 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-gtt:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-gtt.html>
>         (i915#15574
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574>)
>         +4 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15574
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +11 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9766
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +7 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html>
>         +29 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +19 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html>
>         (i915#15574
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html>
>         (i915#15574
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html>
>         (i915#15574
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574>)
>         +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +25 other tests skip
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-6/igt@kms_hdr@invalid-hdr.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_hdr@static-toggle.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@static-toggle-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_hdr@static-toggle-dpms.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@kms_joiner@basic-force-big-joiner.html>
>         (i915#15459
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459>)
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (i915#15458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (i915#15459
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459>)
>  *
>
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (i915#13522
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (i915#13522
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522>)
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (i915#13026
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026>)
>         +1 other test incomplete
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html>
>         (i915#14412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412>)
>         +1 other test incomplete
>  *
>
>     igt@kms_plane_alpha_blend@alpha-opaque-fb:
>
>       o shard-glk10: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html>
>         (i915#10647
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>
>         / i915#12169
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169>)
>  *
>
>     igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:
>
>       o shard-glk10: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1.html>
>         (i915#10647
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>)
>         +1 other test fail
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-4.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>         +1 other test skip
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-none.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>  *
>
>     igt@kms_plane_multiple@tiling-4:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_plane_multiple@tiling-4.html>
>         (i915#14259
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@kms_plane_multiple@tiling-4.html>
>         (i915#14259
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html>
>         (i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>
>         / i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html>
>         (i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>)
>         +3 other tests skip
>  *
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-3/igt@kms_pm_backlight@fade-with-suspend.html>
>         (i915#9812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>)
>         +2 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-15/igt@kms_pm_backlight@fade-with-suspend.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-3/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@kms_pm_dc@dc5-psr.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-6/igt@kms_pm_dc@dc5-retention-flops.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-10/igt@kms_pm_dc@dc5-retention-flops.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@kms_pm_dc@dc5-retention-flops.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-glk10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk10/igt@kms_pm_lpsp@kms-lpsp.html>
>         +54 other tests skip
>  *
>
>     igt@kms_pm_rpm@dpms-non-lpsp:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-3/igt@kms_pm_rpm@dpms-non-lpsp.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         +2 other tests skip
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         +1 other test skip
>  *
>
>     igt@kms_pm_rpm@package-g7:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-7/igt@kms_pm_rpm@package-g7.html>
>         (i915#15403
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403>)
>  *
>
>     igt@kms_pm_rpm@system-suspend-idle:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_pm_rpm@system-suspend-idle.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_pm_rpm@system-suspend-idle.html>
>         (i915#14419
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-19/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +4 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +6 other tests skip
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-snb4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +5 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html>
>         (i915#12316
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +8 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk5/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +7 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +6 other tests skip
>       o shard-glk10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-16/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>         +1 other test skip
>  *
>
>     igt@kms_psr@fbc-psr-dpms:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-8/igt@kms_psr@fbc-psr-dpms.html>
>         (i915#9688
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>         +5 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-no-drrs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-10/igt@kms_psr@fbc-psr-no-drrs.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +21 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-primary-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_psr@fbc-psr-primary-blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +1 other test skip
>  *
>
>     igt@kms_psr@pr-sprite-plane-onoff:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +8 other tests skip
>  *
>
>     igt@kms_psr@psr-cursor-mmap-cpu:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_psr@psr-cursor-mmap-cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +11 other tests skip
>  *
>
>     igt@kms_psr@psr2-cursor-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_psr@psr2-cursor-mmap-gtt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +9 other tests skip
>  *
>
>     igt@kms_psr@psr2-sprite-blt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@kms_psr@psr2-sprite-blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +12 other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>  *
>
>     igt@kms_rotation_crc@bad-pixel-format:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-snb5/igt@kms_rotation_crc@bad-pixel-format.html>
>         +192 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-3/igt@kms_rotation_crc@bad-pixel-format.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>)
>         +1 other test skip
>  *
>
>     igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>         (i915#15492
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-270:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-14/igt@kms_rotation_crc@sprite-rotation-270.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@kms_rotation_crc@sprite-rotation-270.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>)
>         +1 other test skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-2/igt@kms_tiled_display@basic-test-pattern.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>         +1 other test skip
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html>
>         (i915#10959
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>  *
>
>     igt@kms_vrr@lobf:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@kms_vrr@lobf.html>
>         (i915#11920
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920>)
>  *
>
>     igt@kms_vrr@max-min:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_vrr@max-min.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-vrr:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@perf_pmu@all-busy-idle-check-all:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-mtlp-5/igt@perf_pmu@all-busy-idle-check-all.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-2/igt@perf_pmu@all-busy-idle-check-all.html>
>         (i915#15453
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15453>)
>  *
>
>     igt@perf_pmu@module-unload:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-5/igt@perf_pmu@module-unload.html>
>         (i915#14433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433>)
>  *
>
>     igt@prime_vgem@fence-write-hang:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@prime_vgem@fence-write-hang.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
>
>       o shard-tglu-1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html>
>         (i915#12910
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910>)
>         +9 other tests fail
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-on:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@sriov_basic@enable-vfs-autoprobe-on.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@sriov_basic@enable-vfs-bind-unbind-each.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (i915#12910
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>
>
>         Possible fixes
>
>  *
>
>     igt@gem_ccs@suspend-resume:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-5/igt@gem_ccs@suspend-resume.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-8/igt@gem_ccs@suspend-resume.html>
>  *
>
>     igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html>
>         (i915#12392
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392>
>         / i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html>
>  *
>
>     igt@gem_ctx_isolation@preservation-s3@rcs0:
>
>       o shard-snb: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-snb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html>
>         (i915#14871
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14871>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-snb5/igt@gem_ctx_isolation@preservation-s3@rcs0.html>
>         +1 other test pass
>  *
>
>     igt@gem_exec_endless@dispatch@bcs0:
>
>       o shard-dg1: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-15/igt@gem_exec_endless@dispatch@bcs0.html>
>         (i915#3778
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-19/igt@gem_exec_endless@dispatch@bcs0.html>
>         +1 other test pass
>  *
>
>     igt@gem_pxp@create-regular-buffer:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@gem_pxp@create-regular-buffer.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@gem_pxp@create-regular-buffer.html>
>  *
>
>     igt@gem_workarounds@suspend-resume-context:
>
>       o shard-rkl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html>
>  *
>
>     igt@i915_pm_rpm@system-suspend:
>
>       o shard-glk: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-glk3/igt@i915_pm_rpm@system-suspend.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk6/igt@i915_pm_rpm@system-suspend.html>
>  *
>
>     igt@intel_hwmon@hwmon-read:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-19/igt@intel_hwmon@hwmon-read.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@intel_hwmon@hwmon-read.html>
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
>
>       o shard-rkl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html>
>         (i915#15582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html>
>         +1 other test pass
>  *
>
>     igt@kms_color@deep-color:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_color@deep-color.html>
>         (i915#12655
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_color@deep-color.html>
>  *
>
>     igt@kms_cursor_crc@cursor-random-256x85:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@kms_cursor_crc@cursor-random-256x85.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_cursor_crc@cursor-random-256x85.html>
>         +2 other tests pass
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-256x85:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-256x85.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-256x85.html>
>         +3 other tests pass
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-8bpc:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-8/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html>
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-rkl: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-1/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#15132
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_fbcon_fbt@fbc-suspend.html>
>  *
>
>     igt@kms_plane_cursor@primary:
>
>       o shard-dg1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-16/igt@kms_plane_cursor@primary.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@kms_plane_cursor@primary.html>
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         +1 other test pass
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-hdmi-a-1:
>
>       o shard-snb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-snb6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-hdmi-a-1.html>
>         (i915#13899
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13899>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-snb4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-hdmi-a-1.html>
>         +1 other test pass
>  *
>
>     igt@perf_pmu@busy-double-start@rcs0:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html>
>         +3 other tests pass
>  *
>
>     igt@perf_pmu@busy-double-start@vecs1:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-1/igt@perf_pmu@busy-double-start@vecs1.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html>
>         +4 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@api_intel_bb@object-reloc-purge-cache:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-4/igt@api_intel_bb@object-reloc-purge-cache.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>         +1 other test skip
>  *
>
>     igt@gem_ccs@block-multicopy-compressed:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html>
>         (i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_ccs@block-multicopy-inplace:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-2/igt@gem_ccs@block-multicopy-inplace.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         (i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_exec_balancer@parallel:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-5/igt@gem_exec_balancer@parallel.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_exec_balancer@parallel.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_balancer@parallel-out-fence:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@gem_exec_balancer@parallel-out-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>  *
>
>     igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_reloc@basic-scanout:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-5/igt@gem_exec_reloc@basic-scanout.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_exec_reloc@basic-scanout.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +3 other tests skip
>  *
>
>     igt@gem_lmem_evict@dontneed-evict-race:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@gem_lmem_evict@dontneed-evict-race.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>
>         / i915#7582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>
>         / i915#7582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582>)
>  *
>
>     igt@gem_lmem_swapping@verify-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@gem_lmem_swapping@verify-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>  *
>
>     igt@gem_partial_pwrite_pread@write-snoop:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@gem_partial_pwrite_pread@write-snoop.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@gem_partial_pwrite_pread@write-snoop.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>  *
>
>     igt@gem_pread@self:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@gem_pread@self.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_pread@self.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@gem_userptr_blits@access-control:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@gem_userptr_blits@access-control.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@gem_userptr_blits@access-control.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gen9_exec_parse@allowed-all:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@gen9_exec_parse@allowed-all.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>  *
>
>     igt@gen9_exec_parse@bb-oversize:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +1 other test skip
>  *
>
>     igt@i915_pm_rps@reset:
>
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-snb1/igt@i915_pm_rps@reset.html>
>         (i915#13821
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13821>)
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-snb6/igt@i915_pm_rps@reset.html>
>         (i915#13729
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13729>
>         / i915#13821
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13821>)
>  *
>
>     igt@i915_power@sanity:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@i915_power@sanity.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7984
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@i915_power@sanity.html>
>         (i915#7984
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984>)
>  *
>
>     igt@i915_query@hwconfig_table:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-2/igt@i915_query@hwconfig_table.html>
>         (i915#6245
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@i915_query@hwconfig_table.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6245
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245>)
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@intel_hwmon@hwmon-write.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@intel_hwmon@hwmon-write.html>
>         (i915#7707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707>)
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +3 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-hdmi-a-2.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +1 other test skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +7 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +11 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +6 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@kms_cdclk@mode-transition.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_cdclk@mode-transition.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-read:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-read.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-read.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +4 other tests skip
>  *
>
>     igt@kms_chamelium_frames@dp-crc-multiple:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-multiple.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_chamelium_frames@dp-crc-multiple.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +2 other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-4/igt@kms_content_protection@lic-type-1.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_content_protection@lic-type-1.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-8/igt@kms_content_protection@srm.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-10/igt@kms_content_protection@srm.html>
>         (i915#7173
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-11/igt@kms_content_protection@uevent.html>
>         (i915#1339
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339>
>         / i915#7173
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@kms_content_protection@uevent.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@uevent-hdcp14:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-1/igt@kms_content_protection@uevent-hdcp14.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_content_protection@uevent-hdcp14.html>
>         (i915#7173
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +3 other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +8 other tests skip
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html>
>         (i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_dp_link_training@non-uhbr-mst:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-mst.html>
>         (i915#13749
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html>
>         (i915#13749
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-1/igt@kms_dsc@dsc-with-bpc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html>
>         (i915#3955
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3955
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955>)
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_feature_discovery@display-2x.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_feature_discovery@display-2x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>  *
>
>     igt@kms_feature_discovery@psr2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_feature_discovery@psr2.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_feature_discovery@psr2.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>  *
>
>     igt@kms_flip@2x-flip-vs-wf_vblank:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_flip@2x-flip-vs-wf_vblank.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_flip@2x-flip-vs-wf_vblank.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +1 other test skip
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html>
>         (i915#10433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html>
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-cpu:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-cpu.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15574
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-cpu.html>
>         (i915#15574
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-gtt.html>
>         (i915#15574
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15574
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-slowdraw:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html>
>         (i915#10433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-slowdraw.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +1 other test skip
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (i915#15458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458>)
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html>
>         (i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_panel_fitting@legacy.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_panel_fitting@legacy.html>
>         (i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>  *
>
>     igt@kms_pipe_stress@stress-xrgb8888-4tiled:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html>
>         (i915#14712
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#14712
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712>)
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_pm_dc@dc5-psr.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9340
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_pm_rpm@package-g7:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-4/igt@kms_pm_rpm@package-g7.html>
>         (i915#15403
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_pm_rpm@package-g7.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15403
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403>)
>  *
>
>     igt@kms_prime@basic-crc-hybrid:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +2 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>  *
>
>     igt@kms_psr@fbc-pr-primary-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-1/igt@kms_psr@fbc-pr-primary-mmap-gtt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_psr@fbc-pr-primary-mmap-gtt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +9 other tests skip
>  *
>
>     igt@kms_psr@psr-cursor-plane-move:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_psr@psr-cursor-plane-move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_psr@psr-cursor-plane-move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +7 other tests skip
>  *
>
>     igt@kms_psr@psr-sprite-blt:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-13/igt@kms_psr@psr-sprite-blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@kms_psr@psr-sprite-blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-none:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_scaling_modes@scaling-mode-none.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_vrr@flip-basic.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15243
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_vrr@flip-basic.html>
>         (i915#15243
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@prime_vgem@coherency-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@prime_vgem@coherency-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@prime_vgem@coherency-gtt.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>         +1 other test skip
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8709 -> IGTPW_14386
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_17859: b7c3274a57563fc1652889043a6e8d08473e5f31 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_14386: 14386
> IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>
--------------IlhNl15uU9EDCAPRNTMNuYus
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>The change in output of <a class="moz-txt-link-abbreviated" href="mailto:kms_flip_scaled_crc@.*reflect-x">kms_flip_scaled_crc@.*reflect-x</a> tests is
      expected as test is now skipping before triggering the dynamic
      subtest. So not a genuine failure.&nbsp;</p>
    <p>Will go ahead with merge.</p>
    Thanks and Regards,<br>
    Karthik.B.S
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 1/21/2026 11:28 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:176901833393.179413.6167470932274016673@a3b018990fe9">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/kms_flip_scaled_crc: Move require checks at the
              beginning of the subtest</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/160397/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/160397/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_17859_full -&gt;
        IGTPW_14386_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_14386_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_14386_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/index.html</a></p>
      <h2>Participating hosts (9 -&gt; 9)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_14386_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html" moz-do-not-send="true">SKIP</a> +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html" moz-do-not-send="true">SKIP</a> +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> +12 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> +12 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15573" moz-do-not-send="true">i915#15573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html" moz-do-not-send="true">SKIP</a> +3 other tests skip</li>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813" moz-do-not-send="true">i915#8813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html" moz-do-not-send="true">SKIP</a> +3 other tests skip</li>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15573" moz-do-not-send="true">i915#15573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html" moz-do-not-send="true">SKIP</a> +2 other tests skip</li>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html" moz-do-not-send="true">SKIP</a> +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html" moz-do-not-send="true">SKIP</a> +11 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> +16 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813" moz-do-not-send="true">i915#8813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> +24 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-8/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15573" moz-do-not-send="true">i915#15573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-19/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15573" moz-do-not-send="true">i915#15573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html" moz-do-not-send="true">SKIP</a> +3 other tests skip</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between CI_DRM_17859_full and
        IGTPW_14386_full:</p>
      <h3>New IGT tests (33)</h3>
      <ul>
        <li>
          <p>igt@i915_pm_rps@4-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@all-busy-idle-check-all:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@bad-size:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@basic-cpu-noreloc:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@cursora-vs-flipb-toggle:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@fbc-1p-offscreen-pri-indfb-draw-render:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@fbc-2p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@int-max-clock:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@invalid-signal-one-illegal-handle:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@linear-16bpp-rotate-180:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@psr-argb161616f-draw-mmap-gtt:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@reset-signaled:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@syncobj-invalid-flags:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@alloc_timeline:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@alpha-opaque-fb:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@bad-fence:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@bad-flink:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@coherency-sync:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursor-onscreen-32x10:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@fbc-psr-basic:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@fbcpsr-1p-primscrn-cur-indfb-move:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@invalid-flags:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@nullptr:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@resubmit-new:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@wait-all-complex:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@wait-wedge-10ms:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_14386_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@object-reloc-keep-cache:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@api_intel_bb@object-reloc-keep-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@api_intel_bb@object-reloc-purge-cache:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@api_intel_bb@object-reloc-purge-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-copy-compressed:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-10/igt@gem_ccs@block-copy-compressed.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_close_race@multigpu-basic-threads:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@gem_close_race@multigpu-basic-threads.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send="true">i915#7697</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@gem_close_race@multigpu-basic-threads.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send="true">i915#7697</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_isolation@preservation-s3:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk10/igt@gem_ctx_isolation@preservation-s3.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@processes:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-snb6/igt@gem_ctx_persistence@processes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099" moz-do-not-send="true">i915#1099</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@engines:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@gem_ctx_sseu@engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280" moz-do-not-send="true">i915#280</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@mmap-args:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-3/igt@gem_ctx_sseu@mmap-args.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280" moz-do-not-send="true">i915#280</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-pair:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771" moz-do-not-send="true">i915#4771</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-balancer:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-10/igt@gem_exec_balancer@parallel-balancer.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@sliced:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@gem_exec_balancer@sliced.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@gem_exec_balancer@sliced.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852" moz-do-not-send="true">i915#4852</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-prw-default:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@gem_exec_flush@basic-uc-prw-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-wb-ro-default:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@gem_exec_flush@basic-wb-ro-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852" moz-do-not-send="true">i915#4852</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@secure-non-master:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_exec_params@secure-non-master.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-3/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-gtt-active:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@gem_exec_reloc@basic-write-gtt-active.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@gem_exec_schedule@preempt-queue-contexts.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>) +2 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-6/igt@gem_exec_schedule@preempt-queue-contexts.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537" moz-do-not-send="true">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537" moz-do-not-send="true">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fence_thrash@bo-write-verify-y:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@gem_fence_thrash@bo-write-verify-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send="true">i915#4860</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send="true">i915#4860</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-random:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +2 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-7/igt@gem_lmem_swapping@heavy-verify-random.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-random-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-5/igt@gem_lmem_swapping@verify-random-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_media_fill@media-fill:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@gem_media_fill@media-fill.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289" moz-do-not-send="true">i915#8289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_media_vme:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@gem_media_vme.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284" moz-do-not-send="true">i915#284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@basic-short:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@gem_mmap_gtt@basic-short.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_offset@clear-via-pagefault:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-7/igt@gem_mmap_offset@clear-via-pagefault.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809" moz-do-not-send="true">i915#14809</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@coherency:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@gem_mmap_wc@coherency.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@read-write-distinct:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@gem_mmap_wc@read-write-distinct.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@gem_partial_pwrite_pread@reads-uncached.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +4 other tests
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@gem_partial_pwrite_pread@reads-uncached.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +3 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@gem_partial_pwrite_pread@reads-uncached.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +3 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-8/igt@gem_partial_pwrite_pread@reads-uncached.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@display-protected-crc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@gem_pxp@display-protected-crc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@gem_pxp@verify-pxp-stale-ctx-execution.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428" moz-do-not-send="true">i915#8428</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428" moz-do-not-send="true">i915#8428</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_tiled_blits@basic:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@gem_render_tiled_blits@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079" moz-do-not-send="true">i915#4079</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-19/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079" moz-do-not-send="true">i915#4079</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@noreloc-s3:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk6/igt@gem_softpin@noreloc-s3.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809" moz-do-not-send="true">i915#13809</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@access-control:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@gem_userptr_blits@access-control.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-sync:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk5/igt@gem_userptr_blits@dmabuf-sync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323" moz-do-not-send="true">i915#3323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@gem_userptr_blits@readonly-pwrite-unsync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@readonly-unsync:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@gem_userptr_blits@readonly-unsync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_workarounds@suspend-resume-fd:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-2/igt@gem_workarounds@suspend-resume-fd.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_workarounds@suspend-resume-fd.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-single:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@gen9_exec_parse@allowed-single.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@gen9_exec_parse@allowed-single.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-secure:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@gen9_exec_parse@bb-secure.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@unaligned-access:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@gen9_exec_parse@unaligned-access.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) +2 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@gen9_exec_parse@unaligned-access.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@unaligned-jump:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-6/igt@gen9_exec_parse@unaligned-jump.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_drm_fdinfo@busy-check-all:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-13/igt@i915_drm_fdinfo@busy-check-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527" moz-do-not-send="true">i915#11527</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@fault-injection:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@i915_module_load@fault-injection.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342" moz-do-not-send="true">i915#15342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481" moz-do-not-send="true">i915#15481</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@fault-injection@i915_driver_hw_probe:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@i915_module_load@fault-injection@i915_driver_hw_probe.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481" moz-do-not-send="true">i915#15481</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@i915_module_load@fault-injection@intel_connector_register.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342" moz-do-not-send="true">i915#15342</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@fault-injection@intel_gt_init-enodev:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479" moz-do-not-send="true">i915#15479</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-no-display:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-17/igt@i915_module_load@reload-no-display.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@i915_module_load@reload-no-display.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029" moz-do-not-send="true">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545" moz-do-not-send="true">i915#14545</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@resize-bar:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@i915_module_load@resize-bar.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412" moz-do-not-send="true">i915#6412</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-basic-api:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399" moz-do-not-send="true">i915#8399</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-reset:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399" moz-do-not-send="true">i915#8399</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-multiple.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399" moz-do-not-send="true">i915#8399</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html" moz-do-not-send="true">SKIP</a> +9 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-3/igt@i915_pm_rpm@system-suspend-execbuf.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@thresholds-park:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@i915_pm_rps@thresholds-park.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681" moz-do-not-send="true">i915#11681</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@debugfs-reader:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@i915_suspend@debugfs-reader.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@i915_suspend@debugfs-reader.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817" moz-do-not-send="true">i915#4817</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@fence-restore-untiled:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@i915_suspend@fence-restore-untiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-10/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send="true">i915#4212</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531" moz-do-not-send="true">i915#9531</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531" moz-do-not-send="true">i915#9531</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" moz-do-not-send="true">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" moz-do-not-send="true">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138" moz-do-not-send="true">i915#5138</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send="true">i915#3638</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send="true">i915#3638</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-16/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send="true">i915#3638</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +214 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +56 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307" moz-do-not-send="true">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +135 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307" moz-do-not-send="true">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434" moz-do-not-send="true">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>) +1 other test
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +60 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> +298 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +39 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805" moz-do-not-send="true">i915#12805</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +29 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +64 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781" moz-do-not-send="true">i915#13781</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_cdclk@plane-scaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742" moz-do-not-send="true">i915#3742</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@kms_cdclk@plane-scaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742" moz-do-not-send="true">i915#3742</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@dp-audio:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-5/igt@kms_chamelium_audio@dp-audio.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +9 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@kms_chamelium_audio@dp-audio.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-max:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@kms_chamelium_color@ctm-max.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-fast:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@kms_chamelium_frames@dp-crc-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +3 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@deep-color:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-11/igt@kms_color@deep-color.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-8/igt@kms_color@deep-color.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655" moz-do-not-send="true">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116" moz-do-not-send="true">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-9/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116" moz-do-not-send="true">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_content_protection@atomic-dpms-hdcp14.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330" moz-do-not-send="true">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116" moz-do-not-send="true">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299" moz-do-not-send="true">i915#3299</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330" moz-do-not-send="true">i915#15330</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy-hdcp14:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-10/igt@kms_content_protection@legacy-hdcp14.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-4/igt@kms_content_protection@legacy-hdcp14.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173" moz-do-not-send="true">i915#7173</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) +5 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-128x42:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-4/igt@kms_cursor_crc@cursor-random-128x42.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-64x21:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@kms_cursor_crc@cursor-random-64x21.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_cursor_crc@cursor-random-64x21.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-15/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a>) +1 other test skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213" moz-do-not-send="true">i915#4213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-16/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391" moz-do-not-send="true">i915#4391</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809" moz-do-not-send="true">i915#9809</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046" moz-do-not-send="true">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-mtlp-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562" moz-do-not-send="true">i915#13562</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833" moz-do-not-send="true">i915#9833</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723" moz-do-not-send="true">i915#9723</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@extended-mode-basic:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691" moz-do-not-send="true">i915#13691</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_aux_dev:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-11/igt@kms_dp_aux_dev.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@kms_dp_aux_dev.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257" moz-do-not-send="true">i915#1257</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@uhbr-mst:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-4/igt@kms_dp_link_training@uhbr-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748" moz-do-not-send="true">i915#13748</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@uhbr-sst:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_dp_link_training@uhbr-sst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748" moz-do-not-send="true">i915#13748</a>)</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748" moz-do-not-send="true">i915#13748</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@kms_dp_linktrain_fallback@dp-fallback.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707" moz-do-not-send="true">i915#13707</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707" moz-do-not-send="true">i915#13707</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-9/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854" moz-do-not-send="true">i915#4854</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-16/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854" moz-do-not-send="true">i915#4854</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-2x:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-6/igt@kms_feature_discovery@display-2x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839" moz-do-not-send="true">i915#1839</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_feature_discovery@display-3x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839" moz-do-not-send="true">i915#1839</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-absolute-wf_vblank:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-10/igt@kms_flip@2x-absolute-wf_vblank.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-modeset:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-5/igt@kms_flip@2x-flip-vs-modeset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +1 other test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-15/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_flip@2x-plain-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk5/igt@kms_flip@flip-vs-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314" moz-do-not-send="true">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745" moz-do-not-send="true">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839" moz-do-not-send="true">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113" moz-do-not-send="true">i915#6113</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314" moz-do-not-send="true">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745" moz-do-not-send="true">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113" moz-do-not-send="true">i915#6113</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810" moz-do-not-send="true">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813" moz-do-not-send="true">i915#8813</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810" moz-do-not-send="true">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813" moz-do-not-send="true">i915#8813</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104" moz-do-not-send="true">i915#15104</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104" moz-do-not-send="true">i915#15104</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15389" moz-do-not-send="true">i915#15389</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880" moz-do-not-send="true">i915#6880</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk10/igt@kms_frontbuffer_tracking@fbc-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056" moz-do-not-send="true">i915#10056</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439" moz-do-not-send="true">i915#5439</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-tiling-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439" moz-do-not-send="true">i915#5439</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439" moz-do-not-send="true">i915#5439</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055" moz-do-not-send="true">i915#10055</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +16 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +5 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +5 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> +18 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html" moz-do-not-send="true">SKIP</a> +49 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-gtt:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574" moz-do-not-send="true">i915#15574</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574" moz-do-not-send="true">i915#15574</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023" moz-do-not-send="true">i915#3023</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766" moz-do-not-send="true">i915#9766</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> +29 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574" moz-do-not-send="true">i915#15574</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574" moz-do-not-send="true">i915#15574</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574" moz-do-not-send="true">i915#15574</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>) +25 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-6/igt@kms_hdr@invalid-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_hdr@static-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-dpms:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_hdr@static-toggle-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459" moz-do-not-send="true">i915#15459</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458" moz-do-not-send="true">i915#15458</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459" moz-do-not-send="true">i915#15459</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522" moz-do-not-send="true">i915#13522</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522" moz-do-not-send="true">i915#13522</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026" moz-do-not-send="true">i915#13026</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412" moz-do-not-send="true">i915#14412</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647" moz-do-not-send="true">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169" moz-do-not-send="true">i915#12169</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647" moz-do-not-send="true">i915#10647</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958" moz-do-not-send="true">i915#13958</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-none.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958" moz-do-not-send="true">i915#13958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-4:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_plane_multiple@tiling-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259" moz-do-not-send="true">i915#14259</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@kms_plane_multiple@tiling-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259" moz-do-not-send="true">i915#14259</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329" moz-do-not-send="true">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329" moz-do-not-send="true">i915#15329</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-suspend:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-3/igt@kms_pm_backlight@fade-with-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812" moz-do-not-send="true">i915#9812</a>) +2 other tests
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-15/igt@kms_pm_backlight@fade-with-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-3/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-retention-flops:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-6/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-10/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>)</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@kms-lpsp:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk10/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">SKIP</a> +54 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-3/igt@kms_pm_rpm@dpms-non-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073" moz-do-not-send="true">i915#15073</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073" moz-do-not-send="true">i915#15073</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@package-g7:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-7/igt@kms_pm_rpm@package-g7.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403" moz-do-not-send="true">i915#15403</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@system-suspend-idle:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_pm_rpm@system-suspend-idle.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_pm_rpm@system-suspend-idle.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419" moz-do-not-send="true">i915#14419</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-19/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +6 other tests
              skip</li>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-snb4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316" moz-do-not-send="true">i915#12316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk5/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +6 other tests
              skip</li>
            <li>shard-glk10: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-16/igt@kms_psr2_su@page_flip-xrgb8888.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683" moz-do-not-send="true">i915#9683</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-dpms:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-8/igt@kms_psr@fbc-psr-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688" moz-do-not-send="true">i915#9688</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-no-drrs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-10/igt@kms_psr@fbc-psr-no-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +21 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-primary-blt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_psr@fbc-psr-primary-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_psr@psr-cursor-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_psr@psr2-cursor-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-blt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@kms_psr@psr2-sprite-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-pixel-format:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-snb5/igt@kms_rotation_crc@bad-pixel-format.html" moz-do-not-send="true">SKIP</a> +192 other tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-3/igt@kms_rotation_crc@bad-pixel-format.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755" moz-do-not-send="true">i915#12755</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492" moz-do-not-send="true">i915#15492</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send="true">i915#5289</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send="true">i915#5289</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send="true">i915#5289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-270:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-14/igt@kms_rotation_crc@sprite-rotation-270.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@kms_rotation_crc@sprite-rotation-270.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755" moz-do-not-send="true">i915#12755</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-2/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623" moz-do-not-send="true">i915#8623</a>) +1 other test skip</li>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959" moz-do-not-send="true">i915#10959</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623" moz-do-not-send="true">i915#8623</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@lobf:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@kms_vrr@lobf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920" moz-do-not-send="true">i915#11920</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@max-min:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_vrr@max-min.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@all-busy-idle-check-all:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-mtlp-5/igt@perf_pmu@all-busy-idle-check-all.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-2/igt@perf_pmu@all-busy-idle-check-all.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15453" moz-do-not-send="true">i915#15453</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@module-unload:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-5/igt@perf_pmu@module-unload.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433" moz-do-not-send="true">i915#14433</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-write-hang:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@prime_vgem@fence-write-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910" moz-do-not-send="true">i915#12910</a>) +9 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@sriov_basic@enable-vfs-autoprobe-on.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917" moz-do-not-send="true">i915#9917</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@sriov_basic@enable-vfs-bind-unbind-each.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917" moz-do-not-send="true">i915#9917</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910" moz-do-not-send="true">i915#12910</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917" moz-do-not-send="true">i915#9917</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@gem_ccs@suspend-resume:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-5/igt@gem_ccs@suspend-resume.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-8/igt@gem_ccs@suspend-resume.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392" moz-do-not-send="true">i915#12392</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-snb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14871" moz-do-not-send="true">i915#14871</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-snb5/igt@gem_ctx_isolation@preservation-s3@rcs0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_endless@dispatch@bcs0:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-15/igt@gem_exec_endless@dispatch@bcs0.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778" moz-do-not-send="true">i915#3778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-19/igt@gem_exec_endless@dispatch@bcs0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@create-regular-buffer:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@gem_pxp@create-regular-buffer.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@gem_pxp@create-regular-buffer.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_workarounds@suspend-resume-context:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@system-suspend:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-glk3/igt@i915_pm_rpm@system-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk6/igt@i915_pm_rpm@system-suspend.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-read:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-19/igt@intel_hwmon@hwmon-read.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-18/igt@intel_hwmon@hwmon-read.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582" moz-do-not-send="true">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@deep-color:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_color@deep-color.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655" moz-do-not-send="true">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_color@deep-color.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-256x85:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@kms_cursor_crc@cursor-random-256x85.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_cursor_crc@cursor-random-256x85.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-256x85.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-256x85.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346" moz-do-not-send="true">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-8/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-1/igt@kms_fbcon_fbt@fbc-suspend.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132" moz-do-not-send="true">i915#15132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_fbcon_fbt@fbc-suspend.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-16/igt@kms_plane_cursor@primary.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@kms_plane_cursor@primary.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073" moz-do-not-send="true">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">PASS</a></li>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073" moz-do-not-send="true">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073" moz-do-not-send="true">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-snb6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-hdmi-a-1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13899" moz-do-not-send="true">i915#13899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-snb4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-hdmi-a-1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-double-start@rcs0:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349" moz-do-not-send="true">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-double-start@vecs1:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-1/igt@perf_pmu@busy-double-start@vecs1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349" moz-do-not-send="true">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html" moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@object-reloc-purge-cache:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-4/igt@api_intel_bb@object-reloc-purge-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-multicopy-compressed:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-multicopy-inplace:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-2/igt@gem_ccs@block-multicopy-inplace.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@gem_ccs@ctrl-surf-copy-new-ctx.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-5/igt@gem_exec_balancer@parallel.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_exec_balancer@parallel.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-out-fence:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@gem_exec_balancer@parallel-out-fence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-cpu-noreloc:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-scanout:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-5/igt@gem_exec_reloc@basic-scanout.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_exec_reloc@basic-scanout.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_evict@dontneed-evict-race:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@gem_lmem_evict@dontneed-evict-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582" moz-do-not-send="true">i915#7582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582" moz-do-not-send="true">i915#7582</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-ccs:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@gem_lmem_swapping@verify-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@write-snoop:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@gem_partial_pwrite_pread@write-snoop.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@gem_partial_pwrite_pread@write-snoop.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@self:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@gem_pread@self.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gem_pread@self.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@access-control:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@gem_userptr_blits@access-control.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@gem_userptr_blits@access-control.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-all:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@gen9_exec_parse@allowed-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-oversize:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@reset:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-snb1/igt@i915_pm_rps@reset.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13821" moz-do-not-send="true">i915#13821</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-snb6/igt@i915_pm_rps@reset.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13729" moz-do-not-send="true">i915#13729</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13821" moz-do-not-send="true">i915#13821</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_power@sanity:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@i915_power@sanity.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984" moz-do-not-send="true">i915#7984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@i915_power@sanity.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984" moz-do-not-send="true">i915#7984</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@hwconfig_table:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-2/igt@i915_query@hwconfig_table.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245" moz-do-not-send="true">i915#6245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@i915_query@hwconfig_table.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245" moz-do-not-send="true">i915#6245</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707" moz-do-not-send="true">i915#7707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707" moz-do-not-send="true">i915#7707</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send="true">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send="true">i915#3638</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@kms_cdclk@mode-transition.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742" moz-do-not-send="true">i915#3742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_cdclk@mode-transition.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742" moz-do-not-send="true">i915#3742</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-multiple.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_chamelium_frames@dp-crc-multiple.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330" moz-do-not-send="true">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116" moz-do-not-send="true">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330" moz-do-not-send="true">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116" moz-do-not-send="true">i915#3116</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-4/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-8/igt@kms_content_protection@srm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-10/igt@kms_content_protection@srm.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173" moz-do-not-send="true">i915#7173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-11/igt@kms_content_protection@uevent.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339" moz-do-not-send="true">i915#1339</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173" moz-do-not-send="true">i915#7173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-7/igt@kms_content_protection@uevent.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent-hdcp14:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-1/igt@kms_content_protection@uevent-hdcp14.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-11/igt@kms_content_protection@uevent-hdcp14.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173" moz-do-not-send="true">i915#7173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723" moz-do-not-send="true">i915#9723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723" moz-do-not-send="true">i915#9723</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804" moz-do-not-send="true">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804" moz-do-not-send="true">i915#3804</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804" moz-do-not-send="true">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804" moz-do-not-send="true">i915#3804</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@non-uhbr-mst:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749" moz-do-not-send="true">i915#13749</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749" moz-do-not-send="true">i915#13749</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-1/igt@kms_dsc@dsc-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955" moz-do-not-send="true">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955" moz-do-not-send="true">i915#3955</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-2x:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_feature_discovery@display-2x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839" moz-do-not-send="true">i915#1839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_feature_discovery@display-2x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839" moz-do-not-send="true">i915#1839</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr2:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_feature_discovery@psr2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658" moz-do-not-send="true">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_feature_discovery@psr2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658" moz-do-not-send="true">i915#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_flip@2x-flip-vs-wf_vblank.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_flip@2x-flip-vs-wf_vblank.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023" moz-do-not-send="true">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023" moz-do-not-send="true">i915#3023</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433" moz-do-not-send="true">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a> +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023" moz-do-not-send="true">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023" moz-do-not-send="true">i915#3023</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-cpu:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574" moz-do-not-send="true">i915#15574</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574" moz-do-not-send="true">i915#15574</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574" moz-do-not-send="true">i915#15574</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574" moz-do-not-send="true">i915#15574</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433" moz-do-not-send="true">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-slowdraw.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102" moz-do-not-send="true">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-3/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458" moz-do-not-send="true">i915#15458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458" moz-do-not-send="true">i915#15458</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@atomic-fastset:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301" moz-do-not-send="true">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301" moz-do-not-send="true">i915#6301</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_panel_fitting@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301" moz-do-not-send="true">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_panel_fitting@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301" moz-do-not-send="true">i915#6301</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-7/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712" moz-do-not-send="true">i915#14712</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712" moz-do-not-send="true">i915#14712</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@kms-lpsp:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340" moz-do-not-send="true">i915#9340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@package-g7:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-4/igt@kms_pm_rpm@package-g7.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403" moz-do-not-send="true">i915#15403</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_pm_rpm@package-g7.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403" moz-do-not-send="true">i915#15403</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-crc-hybrid:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524" moz-do-not-send="true">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524" moz-do-not-send="true">i915#6524</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-primary-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-1/igt@kms_psr@fbc-pr-primary-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-6/igt@kms_psr@fbc-pr-primary-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-plane-move:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_psr@psr-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-7/igt@kms_psr@psr-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-blt:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-dg1-13/igt@kms_psr@psr-sprite-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-dg1-12/igt@kms_psr@psr-sprite-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-none:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-4/igt@kms_scaling_modes@scaling-mode-none.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243" moz-do-not-send="true">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-5/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243" moz-do-not-send="true">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@coherency-gtt:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17859/shard-rkl-6/igt@prime_vgem@coherency-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544" moz-do-not-send="true">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14386/shard-rkl-3/igt@prime_vgem@coherency-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>) +1 other test skip</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_8709 -&gt; IGTPW_14386</li>
        <li>Piglit: piglit_4509 -&gt; None</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_17859: b7c3274a57563fc1652889043a6e8d08473e5f31 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_14386: 14386<br>
        IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
        git://anongit.freedesktop.org/piglit</p>
    </blockquote>
  </body>
</html>

--------------IlhNl15uU9EDCAPRNTMNuYus--
