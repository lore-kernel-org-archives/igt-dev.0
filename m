Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E40C02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 07:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C1B10E1B9;
	Tue, 18 Feb 2025 07:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bg8YQ8QV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F8E10E1B9
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739863978; x=1771399978;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ez4qMB65ywacopS9JyWXMjUXyYkiuCk82Cn/16M6kpA=;
 b=bg8YQ8QV1g/9E58nKY6n6W1iEwHQK2CWVDA5IBkzpPDTQ5SriUvoupEX
 Zr++syo31qxVE3CWnz1A3721vD6IicrbfGKTPnABnGTvSr4cGk74w7Oji
 SvTu0xKK3T8rNGliVzJMEkGaU5woMEd2phMwMg08/eJLBDfRDHawTVMUw
 g+gO2cBlyLtAW4e/pDzz/EQqh3BKrBsiAdYNH3V2ZFfoJe4yKkp8wYTjR
 XXIAfPIjtqofnRYmtboPyDMIzT83M/FynOBwWqJdZIr7i+Ed3jwerWZTe
 WxN+TwjSnAXAodKtDbY8B7PwLSNvPK3L9Ds/Nt4kFi2Bq5/6WWo8bQzYR A==;
X-CSE-ConnectionGUID: TGBXF8EDTfCXGkHzU2TvgQ==
X-CSE-MsgGUID: zZCyPgtXQeOl12GwIHvFWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40803773"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="40803773"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 23:32:58 -0800
X-CSE-ConnectionGUID: Qvf3zOYmTgey1Pm30h114g==
X-CSE-MsgGUID: aCIlhzNfSASQMZ6NpscadQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114782230"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 23:32:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Feb 2025 23:32:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 23:32:50 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 23:32:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fsbq+fcPC7tAy02vclnyGjqV7XRmvPP4xC0AHiihCespd/A7H1mNlhpTVOTajep1BrUXVZKio4MCbPFncWvdwJEvpAtlCmd02t3hkfovIyodXarPJMenXL/IP5qtehJH/lnlwqhVqskkMY9dW4SKYThw31ubCf3dD5XSMSv9BQdRu9n6Ra2RR5KbUzkTPiPjr/TwVL2lqB1ctp7hY6dmj//btx7vUj7m9x4hmROYQBSx+n+QwdlTUBiuqn41lP58z+C6h0xeOvGGlScGTik6j/1ZDSmu2mVmbHtXd/dIOfB2rIhpXnOJAj7ZUcQl5EB1IgL/UuyCWbuIFONaoOr17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkNWx9TDCt4umomK4OsaEk6MQThtv6UicD7TQRjE1kA=;
 b=ardp6pjcHpPetCfpxD1Z7CkFIU9VLiFyPGS3sKWK+OQinTnknd08u9BrZEePlNg6Sx+isLgwMMkO04OLfhLdyTXTfn0IXNJ+9gvrEAizTvWabz8+onKG8irZ5nhJCHqPYsqeuQKQe2f8O3OMEdBm6mIfFY6UaWJEb804ZXdRRLzxTeQEe+OBaKiQCwOJF9umcE7CKzz8KXrbTALowi8YFYe0/yMVwA+wGNzNaGKcGFN2e4k/UpLOFnB/RnSvxnnZOfMrGAho2aVzhvfjwwiq9iAYld5dYq2Uo4k1P3w4zgVqGjFX0avBAQgwnYJhx3Qmgo6bM2Vlus49rRf1BIxpLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by LV8PR11MB8770.namprd11.prod.outlook.com (2603:10b6:408:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 07:32:48 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 07:32:48 +0000
Message-ID: <b0cc7fba-8b80-4b51-bfef-1f258dd48cbf@intel.com>
Date: Tue, 18 Feb 2025 13:02:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci: Add kms_sysfs_edid_timing to
 blocklist
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
References: <20250213132802.357921-1-swati2.sharma@intel.com>
 <20250214104530.gsqrch2pg6h6owdg@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250214104530.gsqrch2pg6h6owdg@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|LV8PR11MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb34f30-0307-484d-6b6d-08dd4fee719f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWZvQ3F5SkxlU29HTVE5K29RQnZvVUJrMTJkWDdkc0lTdEI0bWZkdCt5bGJu?=
 =?utf-8?B?alJBd0VINFJselB0Y21IZTdQTzlOMHJWeHBJS0hVY0lDSXhBZmJzZUljNUM5?=
 =?utf-8?B?djJVckZ1aVc3cloyWXFPOW9LNXU0QnZnTVlac0h2UmFSbC9oaUM4NThodFpT?=
 =?utf-8?B?bWdoWFNORmpDd29zMy9JTEZheVY4RlVQSEljUEdBU2FZblZ6NytZRVI0dklz?=
 =?utf-8?B?REk3cEt4STkxbHk0L0pTQVhIbGRFL3ZoeGxvTG5zUk5mTFpDNCs4UlZ1SXlX?=
 =?utf-8?B?cTM4dXBiNzdxS2MzbWg3OVB6b3ZPblc3dlBSTENqbjY1TVFhL0dTeFpjUjdy?=
 =?utf-8?B?K0UrRXplV1Vma0dmUkFJNjJiWVRpY2NQWTFOeDBHTmtlR0h3RVh4RDVsWlRm?=
 =?utf-8?B?YVBPMENlZWYwNU9mMG9tbGw3NjlHV2NsR3ZCakNkbVJiR3cxeTRSTnFNQ0I5?=
 =?utf-8?B?cUFmVjVRNmxHNFFSZDlWU1cycFpvT2QzelVINThoVjI2cVRTNmRudFc0eGp4?=
 =?utf-8?B?Zy9MbUlWcnE1QnJwR1daMGZOS0JIbVNGS1MxMCtFS2tTaU9MNk94aWQ3Tnls?=
 =?utf-8?B?aWhZS29zMkpySXVjM09uYmJ2M2gwWE1Xc0wxU21aR0prQ2RIbk9wZVN2YmZ3?=
 =?utf-8?B?UU9ReE03SU5LSU51bGV2SXZUU2I4ZTV0aUgxZVg4NGY2MVBXekVBMDdEZU1X?=
 =?utf-8?B?ZUtFUWpqK3BsS1dkeEVYL2o5eDl0bnpTdUplV0FUY1dlQiszTDVCQmNSNVNP?=
 =?utf-8?B?T2FiYWVwZE8vNCtmWGVGNngwTVA0ZnRDYUZkTmVNaDNNM1lWSlI2Ulc5c0Er?=
 =?utf-8?B?bzZlbFNKODhOQW96T3J0bFVGMTIzVmdRR1Y2Q1doVElBU1NtVWZpVEZPSTFz?=
 =?utf-8?B?Y1ZSRTNUSkE0a1NSTDA1aG04VE9JL0hLbHVtbDlDNWdJV2U3Zi9xa2JJeFJn?=
 =?utf-8?B?Tk4zamtQYmFuOHZVeEI3QzhOcXJsWFFCYjJ1MmJmc0ZsOGtlQk5tdzBoUWNq?=
 =?utf-8?B?Wnk4NHJiVW5RSFpYczJFWjEvMmhGRjVLM1Vsemtoa0NMd210Q3EwZXRDT25L?=
 =?utf-8?B?OFZjWFc5ZTJqaXBleUpKb3VMNjJsNjY1czNCUTZlSjF5aS9hS3ZhVEhHTm9l?=
 =?utf-8?B?dEhac0Zlc1ozT3FoLzFsd3VTVVRjSDZlUHczMUxkSCtjd2lSREFIUmpyWUJK?=
 =?utf-8?B?MVFiODJhZ1lpNEY5RjdyTzhwNnJNaXM3aitzN2F1T09kMDlnQmorUE9yRkRt?=
 =?utf-8?B?RjRMcnRtcENYRUI0UlNHNkl6RFYyZW1zT2s1c3BBMlJaY1VBTTVFeGJTZEts?=
 =?utf-8?B?R2Q2bWVtNW5hMWVtZUhXYlJ6Qk5KTFBPTGdIc1I3amdzaGhMNlloSURRSy9u?=
 =?utf-8?B?cksycHpTTzI5YmxwYXJMTW56aDlQT0dZWmZLNGlKZGFQYXpENFR4RG5TTTBr?=
 =?utf-8?B?L01OK2U2UG5MVnRORkZaMEszOTBBaENxVkY5aFkrL29WZUFVTy85RTNDdDFr?=
 =?utf-8?B?cGNYanlaWWtva2c5M0xMVEI0a01PcWZ6cHFKWCs3eHRNVWl0MnBTR0kyTkNv?=
 =?utf-8?B?Wk9ZWHZFMnNZalhMQmVCZWxteU42anJ4emt3UDkzbFpwTUZSZzBGNE1xQnc4?=
 =?utf-8?B?a2xkMGtTZjM4cVNKTEFrMHJOUHVTVkhhcERzY2lNd0dsR2cwUFJqeGw0a2to?=
 =?utf-8?B?Z1BTQmNtWHBZM3lQMjcrZzlhVzFNeEV3SEpvZjZlNVBDekdVMVRuZnlPVWVB?=
 =?utf-8?B?blUyQXhVZ05USHlubHRCL21yQkRqdzBBaVRLWHpBczJDNndUc29FVk8vcmpT?=
 =?utf-8?B?TUtxcjdLMFBnTDkrOTM1TWt3cXRvSzk3NnpDWlB0cG0rYkpCS0dHT2JJSWds?=
 =?utf-8?Q?Em07z75fvo5Pn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SCtJVXZVWE9nMzZUV0RPNmhCckh2aGxwbHFBZ09JZG5MZGk3bnFCaERTMDd5?=
 =?utf-8?B?d1Y0L0RKYjFaTVB4YTN0bkgyWDI5OGZVUGFSMGY5WnBQeXFMQVpaMUhHK3pn?=
 =?utf-8?B?dG4rcjVGQks2RWR6cFVvMzFpK1lHL0tQbnFUMTNZU3VxMTZVaGNZTFcwbXJo?=
 =?utf-8?B?ZmRjeGUyTlVFdjNxNkdobHk2QmdwUmtRcitQUGVpdW1mSWFXWTZYS244dE1M?=
 =?utf-8?B?UGR5eUJqTUcrMlZXa1JrcFB5YmZLV1RDVVNmeDhVbkp4QmQ5azNQOHY5NDNP?=
 =?utf-8?B?ZlJ0cGw3Tkp5aGc2eG10UE40c3Bxa2RreERXMGlTSktoTHIvQUFLT2RpVjlx?=
 =?utf-8?B?RkFmN2J0SFh4YjJDZitkZk9VSUNIMXluMG9uVElzZFB4TytBeGVicm0vQXU2?=
 =?utf-8?B?KzlkaThraE1yYm9LdklVR2JoRXhzTjdTZDBtdEQvRWdjdWxTMjRERVVoUFdz?=
 =?utf-8?B?NVcvZ0dFd0E4RWlUdHdGWEpVMEt2TmcxRHorZDJvVGZxdEZ2ZkM1bTJ1a3ZM?=
 =?utf-8?B?NWczT1lvV2N2QmwzZXdVS0kvRm94di9pUTdCNFNFMDJiK09Va2VyQmRjdTI2?=
 =?utf-8?B?K3JkdFV4N0tWN0J5bElEdmhRczlDREF2U1MyamY0eEtrSUU3TnJCbUlsOVRr?=
 =?utf-8?B?OS9GdGtkbHorSmpJUFJtSmxzNjF0V09ib1FPRGp4czN3TW5KTUl5Wi9PSWxR?=
 =?utf-8?B?MGxWNUtMSVlaaHdOQzNsdTdYdEJrYkoySHZ5b1BUQjVieXVsb2ZrZ3YyVlRL?=
 =?utf-8?B?SzBYdVBoWUl1NTRSMmJHRXdZSklFWUtSQjdBdzRqcVJFaTkrbVp3NW5udUZJ?=
 =?utf-8?B?K1pEdGZnNmVlMURWbWJRZFNoeEYyY1YrMlN6a0RoQ0ZwYnBXYldrY0dzQjRv?=
 =?utf-8?B?Z3Rad25lTVJqM09YV05tWTdRUHhyWUJhR2hvMjdaOGtwc0dYdXR5UlBJMHFU?=
 =?utf-8?B?dWxWZjI3N25hNDU0bHJxcjJrUFl1enNzaTg3UUNoYzVNSGpGdlRaOExzYmJO?=
 =?utf-8?B?YmM2YVF1ZnBrdlZFcHFvNFgrL2swSUxoRUdkUStydVJ5WkluL3p2WjR0cmlr?=
 =?utf-8?B?bWNvSXJlRnkvYlFyQ1hCM2VqcFdEUzVRQ1N5UlcwcWFCZ0ZuL1JPTjFhTjdI?=
 =?utf-8?B?WnZZYzBTcEtyT01RQ20zSzNWdG1HZWVMYWttYW13OUR1ZzQ0VEgwZXFZaERI?=
 =?utf-8?B?ZEJ3Y2JLelQ1NFdGNzdBVG9DbWlvRFU0N21UeWRkcHYyR1UzT3JSQUluZFNO?=
 =?utf-8?B?V2lTbHZFc2ZCZlRWQVpsTWRtZThJcTVqaHJrektoeDdBZGdDZTRuQnRlc3lo?=
 =?utf-8?B?VW1SRFFFemZtRFRMNHZLTExGN3g1VlViNm9OYkI3MHNRWjdmVlpxTjlJV0Ni?=
 =?utf-8?B?T09BNGdrZjd0SXptTm5YT3pndS96MEVmL2twd0ZkSUF5bGhxTDVzYUJOS3kx?=
 =?utf-8?B?Sm5leXFDQWxQYm1qaXVkSFYwTFZNZ1ZhOU4rVWFESURIY0JPUXptdVpLY0Ru?=
 =?utf-8?B?ZFBmMktSelZHdTFmaEZRcEExYXZRTEhKUXRyT0pud0VOZ1hLRVBaSXpJMWU5?=
 =?utf-8?B?VFgwZ3dLcHV2Nis4K3lYU2NoTDB1TnZ0am9kR1JUM3lJamFscUtrSURqNEI0?=
 =?utf-8?B?SEdXZHlLcDlyN1pFOHRzZEtkWVNSTlZaeXhQVURjR3NETU1wVzVXQWo0Zmls?=
 =?utf-8?B?MU5ZN0ZGeWdDRHk4U2wxWGttamJBOVlJR1ZEcGRVZUpRTG0wZ1VkL3dPd0Ri?=
 =?utf-8?B?SVhLL0QyV1NSQURQLzcwWmtGWGljdTBQVnV2SWxIR0xkSFVEQjNuRDg1QVNN?=
 =?utf-8?B?bzI0amxEQ1NYY0pDMkkxV3J1akRqVit2RUpQVklVREkzc2FmdGI3cUZOWldy?=
 =?utf-8?B?eWFabzRGdGc1dlo1UjViSzZnWjl1RjhwQWk3bDJNSG04V3FNUnBWMFE2Z0R1?=
 =?utf-8?B?Y2hLS3FzOVhzTnVuTW5acjV0Q0dLK28yN2tIdXpUNHBBR1hxQWVQLzdFOXoy?=
 =?utf-8?B?ZHdJRlRaTG5UUlRZcUhaVHRBaE9NN2ZqR0JRWWdPWnJGQ3pYZnNVc2pia1hQ?=
 =?utf-8?B?b1NHbVcxY1FwNzR5ay82WGNlTzlJcllEK25NcVFIZlRCeXl6SnZxRUdWaFVE?=
 =?utf-8?B?aThZckpSazJVaHFUa3BkdjZsaEp1bzY4anFxdVR1Qkp5SjgrallMMnVuSFhn?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb34f30-0307-484d-6b6d-08dd4fee719f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 07:32:48.6732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7xBGnIOXGz8NjzPQ/NcnZkCBYhIfyp7glfw7468dFpFnzjDFydaVtAaG+f5XiVb+mKKKMhVWg88jZNkrF/59w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8770
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

Hi Kamil

On 14-02-2025 04:15 pm, Kamil Konieczny wrote:
> Hi Swati,
> On 2025-02-13 at 18:58:02 +0530, Swati Sharma wrote:
>> Add kms_sysfs_edid_timing to blocklist. Test was written with the
>> idea that edid read shouldn't take an unreasonable amount of time.
>> The timeout is an arbitrary value because it depends on when the
>> display responds and, in some cases, especially when the display
>> is coming back from sleep, it can take quite a while. This test
>> has sporadic behavior across various platforms connected to
>> different displays.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Could such measurements be moved to tools into some generic one,
> like display_wakeup or display_response?
Even I had this proposal to move this test into tools.
@ankit any feedback?
>
> Regards,
> Kamil
>
>> ---
>>   tests/intel-ci/blacklist.txt    | 10 ++++++++++
>>   tests/intel-ci/xe.blocklist.txt |  9 +++++++++
>>   2 files changed, 19 insertions(+)
>>
>> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
>> index 1236b8280..9917bf46a 100644
>> --- a/tests/intel-ci/blacklist.txt
>> +++ b/tests/intel-ci/blacklist.txt
>> @@ -151,3 +151,13 @@ igt@kms_ccs@.*-4-tiled-xe2-ccs
>>   igt@kms_frontbuffer_tracking@plane-fbc-rte
>>   igt@kms_pm_dc@deep-pkgc
>>   igt@kms_vrr@cmrr
>> +
>> +###############################################
>> +# Test was written with the idea that edid read shouldn't take an
>> +# unreasonable amount of time. The timeout is an arbitrary value
>> +# because it depends on when the display responds and, in some cases,
>> +# especially when the display is coming back from sleep, it can take
>> +# quite a while. This test has sporadic behavior across various
>> +# platforms connected to different displays.
>> +###############################################
>> +igt@kms_sysfs_edid_timing
>> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
>> index 6964628f1..80ceba9a5 100644
>> --- a/tests/intel-ci/xe.blocklist.txt
>> +++ b/tests/intel-ci/xe.blocklist.txt
>> @@ -80,6 +80,15 @@ igt@kms_pm_rpm@cursor.*
>>   ##################################################################
>>   igt@kms_prime@.*
>>   ##################################################################
>> +# KMS: Test was written with the idea that edid read shouldn't take an
>> +# unreasonable amount of time. The timeout is an arbitrary value
>> +# because it depends on when the display responds and, in some cases,
>> +# especially when the display is coming back from sleep, it can take
>> +# quite a while. This test has sporadic behavior across various
>> +# platforms connected to different displays.
>> +##################################################################
>> +igt@kms_sysfs_edid_timing
>> +##################################################################
>>   # KMS: Non-Intel tests
>>   ##################################################################
>>   igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
>> -- 
>> 2.25.1
>>

