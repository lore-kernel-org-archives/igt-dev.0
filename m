Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53658C35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 08:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0686C10E2E8;
	Wed, 19 Mar 2025 08:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8+VPXr0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7BF10E2E8
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 08:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742371649; x=1773907649;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=twn+xZizAibFDAqXow2uijdl178JAFVnYg427/lMP6k=;
 b=c8+VPXr02RLDgdZ3EdLqeyRBzmmR00Oj3VQG5kRfkdCsuL/PPurb78Eg
 wmQulxnzQu5nisHo6DWK+UvXctoRJY6N1coBwgz+ndV0+2QyLUqF2yggB
 cqG11gh0YxXycxir8Gll3uwwE6XGSlNVwgbzuD6cUqp2KBTBJ2v6JLQ8b
 89uHkvFqX1fgB7FmV6L9CzIQxoiMS/4jM13w//K1tc05xQ1F3uYifF7bc
 gt1s7vEgWknoTU6dWIPmR2b0eYaZQgtWmARAyhdqh2IUdTXx8wH8ec9Dq
 ffaZjhrAF6+N1NZjvxstEr1zuhX2y3BfWttsnlHtjTE4dK+TZ1PpkDwMc g==;
X-CSE-ConnectionGUID: jCT11mZlR2apIJQQdgAnQg==
X-CSE-MsgGUID: 1Yor5diRQ/Gx56N498cFOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43733430"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208,217";a="43733430"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 01:07:27 -0700
X-CSE-ConnectionGUID: HWecOvYFQcuvPrjAaiFewQ==
X-CSE-MsgGUID: LIRFjZikTbuzPOwaEUM87w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
 d="scan'208,217";a="127333275"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2025 01:07:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Mar 2025 01:07:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 01:07:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 01:06:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhl/w9q1MRwVzP8n31+qA0mNW7BEh3S+kGch3OsqpwrqHedIY+2q4pHsRTBq9IrKcewtpsZ58hTvdZH31O6O0heLU2pq9j3YNsIYuB68e3yVaYkv2mWTkPeSaYJGM8PDZsoH01ocf2ZVLu8vqimLmFfdFaAkYwQ2lFNOKqMlBEjf8J7FgUqwhU3Rkclztgh4hqVcIf2gELUVNeUmWPTWDhy406ug5aFHrTzEGkWhMpN2922VOfqDR/JqOi6k7sD6bOT6PRm4qAOv08hhWQutI7pcUMEHzQ83rW/74MJ5mEwiyl2PtBx/vmpLVKFGSVJrqLyTtHceIeX/qerG3qlojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zx4Vp0NyUtKfM71uqRIifVr3XU8ZsZCMDVMGtxdNQj0=;
 b=XGd5vRpBZHuG3wdAFr3KaMHEw3n6UtPMp38gdyDXezEtTgOCFqFhDhgM6WthTXu/QlM1SldYGn9+rJCdUerqzg6thsTSA0Uyh0VhR0lUVQOS8HAKn3FX60ebzsNCDDiCPljxBOtgRqCWMM0wQBMzB29MASgnvXvGUgILxH6emIzqY5nFIZYDnHOchK8rq3B3T1MuV+RCzkBbnLdiyVDSnBNXHBjzzOvl1iPXXhNN0ZnnVnhljdQzlJFAewoz7xzLZXv2gjBTLtcmpFCY2gB0qFOQH2liWQUYM0nYvpcrTHy6zJQcJWFQBNSDRaV3yB29NlmMh3et/zVUbbRCh0cGBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SN7PR11MB6557.namprd11.prod.outlook.com (2603:10b6:806:26f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Wed, 19 Mar 2025 08:05:29 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 08:05:29 +0000
Content-Type: multipart/alternative;
 boundary="------------0HCvfeyDpYXNjOyOlM9eSORH"
Message-ID: <30298e71-5dc6-477a-b3ef-73f0996b9e35@intel.com>
Date: Wed, 19 Mar 2025 13:35:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] tests/intel/xe_pm: Add a check for power
 management capability
Content-Language: en-GB
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Lukasz Laguna
 <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
References: <20250318150108.1055169-1-jakub1.kolakowski@intel.com>
 <20250318150108.1055169-3-jakub1.kolakowski@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250318150108.1055169-3-jakub1.kolakowski@intel.com>
X-ClientProxiedBy: MA1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::25) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|SN7PR11MB6557:EE_
X-MS-Office365-Filtering-Correlation-Id: af638c46-7dda-4a81-3a49-08dd66bcd021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cG9RcEt2QUkrckUwR2NMVDV0bWJvN1NTK2VXVWd6b3dZMGVKTGszY2VNclZk?=
 =?utf-8?B?clF3RVhrVUZLSVBLay9uQzd0ZHc0bzR6dTFwenVyRkJidFJKbkJTZXJxc3lC?=
 =?utf-8?B?OEdrS3NvM3BuTE5WaGp3NnZFRHhHY1V6OUp4Tk1IWElocGNuRndsQzZCQTln?=
 =?utf-8?B?RE8vdDBiWTVsZTFJWXJiVjRrczlFUDY0TUw5TUxlSUNzZ1NicG9YcGt2MW9G?=
 =?utf-8?B?b05nenNuRXQ2eS9hZFppNFA0bE1iWk9kenBWdTlqSHhoZW5GK1NydHl2byts?=
 =?utf-8?B?S2ZOdURFdnU3RjBiMWpQZzErQ1hIVnZsbVhNamFrbGVOcVRLMDhMWGNQNzZv?=
 =?utf-8?B?UDdkMThtdE5FZk5OM1I4VWlodHNueUozRFRtOGdUWjVLalhDV3pPQ2k4RTlS?=
 =?utf-8?B?RjNhM1l3V3RIRnBBTVFGUXJrYTI0TEZtSEp0YnR6aGxubXhMQmJxWWh4bzZD?=
 =?utf-8?B?T25lTFc2OHdZd3piWEw4MHpjWmtqQ2RVS3ZNMnZCclRvWXg3MWlCUDNHelFU?=
 =?utf-8?B?d2d6WjE3MklWK1ZVeGVMYUhueWNTcGVtbHJTdWtLb0orM3hEaEVubUZ6N1Nj?=
 =?utf-8?B?aDMvTThITDVzbWMxeE9QZkJySkM5OW42Y3o2TGRTMi9zM2JWazQwQWNhTVJ6?=
 =?utf-8?B?MVdvdXVSU0Y0bmo5MGN6NlZ5U1grejlXSytUWWpINEtVOVhsU1BMRXlTd3ZW?=
 =?utf-8?B?eUJEMHl6MUI1b05naUtFUWxXdENITEVlRmVXejlEREZuNHRGbHhHbDNKMk01?=
 =?utf-8?B?cE5TTXhjdzBvcHBSRm1vRVVpRjg4YnVFNi9EQWowdTNnQ3lkak1xVEwzelNG?=
 =?utf-8?B?QS9NT0twRitmR1F5YjVJN0dheDIzSVUxQTc0QURzVG1rVlpzb3krNUp6SVdj?=
 =?utf-8?B?NUc2cG12d0JLZGJpaXIwS3RhRnZLUUJDRFBhcEpsWHpiMmw2ajUyWWNvczJt?=
 =?utf-8?B?UU1SMWZ5dVRaclpaR1lvcm1zRndHaUFWWUxnQWlvUkFZcXdUMld6ckxmUGFr?=
 =?utf-8?B?V2h2YWtFUTZ6bG1WVTFncktiSXJOQkRvSXl4VzR3QzZabi9kaHlOQmx4R2tS?=
 =?utf-8?B?VEh0eVpwTDd4WGFEQUZMSFZSVHN6S1BSRlp5K21wOGlseWlRQzh2M2JRdXdK?=
 =?utf-8?B?SThvMWJiVU5KamowbnVSMlF2ekpCYlNyTXczMHRoU1VQM3FCSnpZK3JZOGVW?=
 =?utf-8?B?ZW5pZDY0WTJyM1VuZXBtYm5vYTFFajlBVm9PU0swSjFuaC9ZTkFBZXFFRWtq?=
 =?utf-8?B?SkRkWm9NUXh3d3IxeEpsa29wK291VVBRbGlPeXBmb0ZJM0x1bUc2bFpRWmZv?=
 =?utf-8?B?VGtaSkNuMlV2MFhXUEJFSWdXTkNDWkhaNnlIMVFkcWRHRmw0VG9RUS9kMmNG?=
 =?utf-8?B?UlZ2c21kNDBkRWJ3YnFGcU05aGlVTEh5V2lHRTlQY0ZNYmc4SWp1eDlEMWpz?=
 =?utf-8?B?WFdwUFRHN2JkZ3NjTUxnWE40SjFudzZRUWNOVlNCWEg2TmxYM1BrNDRpVFJO?=
 =?utf-8?B?Q1ZvSVN4MGN1NjlEc3BzZ0gwMUpOMGxjZGhlWE5FNTZpRDV6dnllWXFoNEsr?=
 =?utf-8?B?cHBpWXl4UzhWZUFJNG4wOUdlT2VFclhWeUo5OG11YWMrS1c1elJGbnBRZHJT?=
 =?utf-8?B?Ukp3L3NYZ0tNbE9IVnRncVNpdkJmRjNtUnBQM2xENjJFK3ZKSnNzTnMvVEdr?=
 =?utf-8?B?WWhoM0l6TnZuUzNpS3VNTkRpcGJma0l0b0t4U0VMcDIwVEtYMjBVMGs0eTVT?=
 =?utf-8?B?aTBzQmt0V05mQTEyYkdSS0xrRWZSWWxoZzFHYnZPOFJEV3FkYWt2aHNYelY2?=
 =?utf-8?B?d1kvSWp0eVpxMU5SZnh5dE9ZeVFWWkJ5dGhUelhIc1oxd0d2bjFwVHY3NTFw?=
 =?utf-8?Q?Gxh7aGhX0oiOb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGxZby9XblZZbTJNelg4VlRUTkhTcFZGTmlxMER4Mk9ZWlNSNStPaFAzT042?=
 =?utf-8?B?N1owaEYvL2NWZFc3bnZPR0hZazJva1NlSzdpa3hTb3p5YnNFWXhZYUc0UGls?=
 =?utf-8?B?S1NWUUdRYVdPK0Y3dlVuNjFLZ1BicTN1RVMzbzc3c0RNRk4zK2ZtaGVRWEY2?=
 =?utf-8?B?YXdXVld4OTBqR0svNk80bmNjQXV2S0crVkFUVlJIazl6ZkhESk1YaUlzdTJL?=
 =?utf-8?B?aW9OQzdqTnkzc3VoQ2RNcGxiZTVGaGg2cHloWXRaeXYwTFNYb2wwWTh0bjhO?=
 =?utf-8?B?a05HWnJzaXBETzNXbDBHcDlVd0lIZUprbEcrY0I0ZERCa1grajlPNUlCdlRK?=
 =?utf-8?B?VVF2K2grZVZ2MXlrVFJDNmJ1eHlIdDFxYUlzSWpkdm9XbTdrNTRKZHUrejdL?=
 =?utf-8?B?VHNCMGhnZUFvQ1ZRUjVHZ2VGWnlUeFc0T09MZjJKWDk2THdJRVZFaGliMUdZ?=
 =?utf-8?B?enFXZDlRaGpJZmVFUGgzL2prVFV3NkxsMmpTQUlmTFduc1dLekJhMDZVM0kw?=
 =?utf-8?B?K2NHTUJFM2krRnRKMERwWGl2M05CY1FPSlFaalB1eTZvTWdxSkhKTGlJb040?=
 =?utf-8?B?a09UWVd1S21CQjlTYnFsMG5nS1h3QS9PNytiQnNzdkxKSXV4dFNtRDltajFS?=
 =?utf-8?B?Y2VBbTNwN1BmV3RHelZ4UGZBQmhISXExb2NiUmZsSTV4ZUhsYUlOZGFIQUVx?=
 =?utf-8?B?Wjg5Q0ZxYzVRbjRwWkxweGhXSEFpdkx4TCtveVBOaGIweHVuc3NKRnJZSzJK?=
 =?utf-8?B?dEpOZEhuSGEwSU44dnFNRG9rQVdLUE9IYUNhUXNZczh3blNRSVNlNkU2NFJK?=
 =?utf-8?B?U3c4SXBXRTVPSEgvZ214bytJeUlWMWE1OXZtN1FxSkNJVUFoV2RGVWJkOFhT?=
 =?utf-8?B?VGRRUm5jNE1wZ083WFZXYklvdWJZN25vbWhxWlNvS2QwNGc3VEdxaGtMUmJW?=
 =?utf-8?B?WGdnUVRMYy9WNkdXVENtVEVzZnpxMEpSK0doakdKQWk5eWpWcWZacVpHUktJ?=
 =?utf-8?B?NHRud1B3UjF0NXNlNjdPOTJ0bVpQaVh4OHF0UTR4eFdGZi9kVjJmblpVQURx?=
 =?utf-8?B?ZFlzSFpraGptUVdiSStvYlN1SlhhUUZwYW1qLzdKN3hUekZ6OVFtYVRBMmF2?=
 =?utf-8?B?OUFvMHJVVkRidlVYN0RYdXNYYU9QTFI2c29EWDRaY21DMzJhNndzSzBKY3ll?=
 =?utf-8?B?Q3dxUmQvMG9yYmZCeEZrNTl2MVF6aU41T3NmckpFeUg5dmxRbTRxWUxqaDFF?=
 =?utf-8?B?MEdhbDZoRUJqMDBRa2tEL0ZVazlnUlY1aEtVckpvZnU4MjRXL1o4QWE0YzlZ?=
 =?utf-8?B?d1hTbW91aWVUQ0MrdTIyY1Q1MHZxcmJlc0IyVktxYmVKTHdpTW1uMVY3YlJi?=
 =?utf-8?B?R2QzWE9rM085RUcrNzZlZTdYREFLSDJEMTl6Y0tpNWU1UnlQVmVRWURBR3pL?=
 =?utf-8?B?ejNrRGFrOXJxQ0p5bGJnMVBZWEUyTlFRSVQ5L3lOMEFDQU4zY01KSVI5K2hp?=
 =?utf-8?B?a2xiWGNCSDlNczM3MmV2RWptTUxGSFVnT3QxYWdCTkxvQ2FQazVJanR2Z3hF?=
 =?utf-8?B?Tm52MUdUbHpIOGVLbTFuTFMzSGVoK2JHazNkbFpQMmNTR20yTFY3UDFKWWdQ?=
 =?utf-8?B?Y1B6d012ZE5uWnNpVUNVcVFCOEpuZlNVWTJXRHRWRElOdUhCaWNFOTVHaDRq?=
 =?utf-8?B?T2JGNWovUkcwc1lBZjhRMHRSNHhJVFBwNHB4bTB4VWZKRVh2anloaUluSGgx?=
 =?utf-8?B?RXhtZnJHYmZxQWUzNk8xUndkdHhaUHN0SGJsR2UwQlhOOGt4V3RHQTlpSUFO?=
 =?utf-8?B?YzVmbDZJWktNdzgvNHZyamtLR2s5K2RYRUU2bEpIYlJmRWRVSEp3T1lKTHho?=
 =?utf-8?B?cExRNFNETzVBTVMvSEJZWUk0TlRwVUVIdStMVzRtaENPVFZYNEg2UUU4UVVo?=
 =?utf-8?B?UWJRaS9ydXpqQVhiRG9mbXRjNDBsLzcvMFJNYytUN24zMkJEZXF2ZWlBN0l6?=
 =?utf-8?B?aTA5dVFTaTdqQTRDYnJBUzR6eDYwRW1BSitzTkdtWkdvaWxNWHZTVngyKzNB?=
 =?utf-8?B?anN4SWtscHp6VHc0YWFGblpKTlJaVlV4OFV4UzBLWkViRlNuZHovUUV0WVQy?=
 =?utf-8?B?ejZSS2sxQ3orYjlSUDVJZUpFZnAwOEU4RzFlRTUrc0g4bzh1VFEydFIxNEVX?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af638c46-7dda-4a81-3a49-08dd66bcd021
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 08:05:29.0302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4oFD/kcWCNMkI9yLwoeOBq0d7kclk5rlhyZU6Xu3buiIg+7MI1tPr4uELqq15u8AxP5a5y+lL9I3FFGVfGu5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6557
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

--------------0HCvfeyDpYXNjOyOlM9eSORH
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 18-03-2025 20:31, Jakub Kolakowski wrote:
> Add a check for power management capability of device tested in tests
> related to D3 states. Currently if test is started on configuration
> that does not support the PM capability it doesn't skip, instead
> depending on test it may fail, abort or timeout.
> With this change test will skip with a clear message why it did.
>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> ---
>   tests/intel/xe_pm.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index c2026474d..70f0613fb 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -146,6 +146,9 @@ static void vram_d3cold_threshold_restore(int sig)
>   
>   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>   {
> +	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
> +		      "PCI power management capability not found\n");

Hi Jakub,

As per PCIe Base spec, all PCI Express Functions are required to support 
PCI Power Management Capability.

Only legacy PCI devices wouldn't have it.

Can you share details of failures without this capability.

All Xe supported GPUs are PCIe complaint, this check may not be needed 
at all.


> +
>   	dpms_on_off(device, DRM_MODE_DPMS_OFF);
>   
>   	/*
--------------0HCvfeyDpYXNjOyOlM9eSORH
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 18-03-2025 20:31, Jakub Kolakowski
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250318150108.1055169-3-jakub1.kolakowski@intel.com">
      <pre wrap="" class="moz-quote-pre">Add a check for power management capability of device tested in tests
related to D3 states. Currently if test is started on configuration
that does not support the PM capability it doesn't skip, instead
depending on test it may fail, abort or timeout.
With this change test will skip with a clear message why it did.

Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Signed-off-by: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
---
 tests/intel/xe_pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index c2026474d..70f0613fb 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -146,6 +146,9 @@ static void vram_d3cold_threshold_restore(int sig)
 
 static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
+	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
+		      &quot;PCI power management capability not found\n&quot;);</pre>
    </blockquote>
    <p style="margin:0in;font-family:&quot;Intel Clear&quot;;font-size:10.0pt">Hi
      Jakub,</p>
    <p style="margin:0in;font-family:&quot;Intel Clear&quot;;font-size:10.0pt">&nbsp;</p>
    <p style="margin:0in;font-family:&quot;Intel Clear&quot;;font-size:10.0pt">As
      per PCIe
      Base spec, all PCI Express Functions are required to support PCI
      Power
      Management Capability.</p>
    <p style="margin:0in;font-family:&quot;Intel Clear&quot;;font-size:10.0pt">Only
      legacy
      PCI devices wouldn't have it.</p>
    <p style="margin:0in;font-family:&quot;Intel Clear&quot;;font-size:10.0pt">Can
      you share
      details of failures without this capability.</p>
    <p style="margin:0in;font-family:&quot;Intel Clear&quot;;font-size:10.0pt">All
      Xe supported GPUs are PCIe complaint, this check may not be needed
      at all.</p>
    <p style="margin:0in;font-family:&quot;Intel Clear&quot;;font-size:10.0pt"><br>
    </p>
    <blockquote type="cite" cite="mid:20250318150108.1055169-3-jakub1.kolakowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 	dpms_on_off(device, DRM_MODE_DPMS_OFF);
 
 	/*
</pre>
    </blockquote>
  </body>
</html>

--------------0HCvfeyDpYXNjOyOlM9eSORH--
