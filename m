Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E93CAC5A5
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 03:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6562410E033;
	Fri, 19 Sep 2025 03:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVdov7z9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F43F10E033
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 03:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758253274; x=1789789274;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=l1wUDdKVQAIM7LMHVlCpCjVDl+FhrCNlwXE6+TgStmM=;
 b=FVdov7z9f4cxce6fW3kOdKNn5Q8t5+q/KlAq7uHf8cs/9xOMpmKahtMI
 l9CkTt0bUwJ+OC4bsY+0niJTPFPQj/eabnIzH12jzMMQaeYXOONvxXOw6
 6hZTErOUncOSdB14MWPSE9PwVQq674K15+yanzphNFh7imOH5kCSpHW52
 kv99VPm8NRfnZF6agvjvwuPMosGQV7WNsIuhBU1+ymUIotr/5s4bEwJAj
 lDATGy0nbE5nVfoQUJ6riF/8+ezwCVFzbahtw7FA9qd4WjhhTIkV2j5+e
 D2YBTh6y4mojqWTgktUqzbTJH6/0qeU2ZusKS3/0gDVBlytPjSEdozYin A==;
X-CSE-ConnectionGUID: 72M11SbITjuUwFdvphcDnw==
X-CSE-MsgGUID: vzu1KZi4QcaNe3BXZIS4Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="59818264"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="59818264"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 20:41:13 -0700
X-CSE-ConnectionGUID: 8gEO5+68RxOaiIlrebmY4g==
X-CSE-MsgGUID: TYIqRbxOSIKoSDDKLTKq7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="174848838"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 20:41:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 20:41:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 20:41:12 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 20:41:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1LnUoHqEdrNe3wsgCeDkXHENFi+h5e2IB/i/hdO0rc6hgm9WmdNdctamUp5pYaYH/veXYYrLLi/GqdBSJbEPffGNm2Cv5jAE1lKbdciDWXj/qygbWuQT6611MZ4akSkKpVzFJhZQ3nWZGEgISx5UC1Qd6TiClqJ1jaCBiYYpyxewZcXH1zZWtarHmtyVn+XijmxEog9ZIJ68x7Ea/qqzl+4EAjnaVl7WMhJduD72CxVZcVQ2qhjvXD87bSPvGJtQvXmF+ja4bD5CLK2irHvqEvKOdVW8PdS4kP6mKV5jFOT+ePseaPoJ8+ER8bd7n5NjDC/332vCqmVOnhVq7Vp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1q+33Ve++xpFP0+99YveseBIKry3cjzrw1iy9O6oSls=;
 b=SyC7Nuvl38uBx+UNx0FMsHsfdnJR8EKKfgMxGGfyGj0y19ioUXt0aDzku7Yu8tC28+wmCYBm7vJi/QP999P3W3dG3EKAPOv/FJKHDIoMFQOdnFnDNpqbMkweM2yTo4h09Qu1AssTUXHJATBagPtPf00tZYiQb2SPJ4WyedDmVFWPqSRTapraAIduaEoADTZ4zgPKqy7c2Ea9JlOn1wS88KLBuCQX5JjwS3MuiWtgwjmOhpQYlCxc1/8d9exqx4McrVPWYxfFRbfvVUfHWPu3pi6SU0eXJ4OZRU03RC0KRs54jqE+9+7xzbcmWLiE3dMHdM8GqgK4DgwBDGRUKTF6yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ2PR11MB8538.namprd11.prod.outlook.com (2603:10b6:a03:578::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 03:41:08 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 03:41:08 +0000
Message-ID: <d43d410d-cd4b-4708-993b-8cbc9e909240@intel.com>
Date: Fri, 19 Sep 2025 09:11:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Update BMG blocklist
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Kunal Joshi
 <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>, Swati Sharma
 <swati2.sharma@intel.com>
References: <20250917094143.2275560-1-kunal1.joshi@intel.com>
 <20250918114724.mklyi3qyxkbhg3od@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250918114724.mklyi3qyxkbhg3od@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ2PR11MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b36f6a-8908-43e8-4897-08ddf72e5e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDFUSTBkVS9PbmQwb2xlcVpyWmsxQ1hqL2h2Z0tpWDFqWDc4OWwwR2NVdGtk?=
 =?utf-8?B?L2p0SExhQUttWHI1OGVSQjNiLys2eDkzWU9lNy9vajQ0OWpRMmVVb01TMnVE?=
 =?utf-8?B?YW55Nmp3YmZXa3R0TU9zaG56OUhPVmJVdk5XNGJ3Um9RNWYyR3dwaTN3S2Zz?=
 =?utf-8?B?T1dWcytyS3A2T3F6YklJdDlrWXFZekFKc3lFMDRYYzNsV1pCUlorWk82YTdH?=
 =?utf-8?B?Rk43cCs2WWJoUllFWHR1dTBneTlZekVSeklKdXkyRDJ6VVRoSmYrV1Bka3d0?=
 =?utf-8?B?UThaTG5oY2FOSHZOTzFob3NWSmtXMHIwMlkybS8yMlUrMWpmL2RBeTd2alpv?=
 =?utf-8?B?cThHcXJNQkR2VmcydDVxMUIxckRoK2cvVEdxZnQ3YkhQcGdId0VMRWpxR1hI?=
 =?utf-8?B?T3NVM0tZZllWTVAyMHl4TjZTQ09FRFBoQUFkM2s2S0MvbFQ0YThSbU04bDJx?=
 =?utf-8?B?WjRKdDUrWUhlSzFXaU1WS05odHJqQzhKajRmMDhBcGN3Z2VhclRIMFR1Sk83?=
 =?utf-8?B?SDEwTU1Nc0ZkVmRrUktiRnF0NzUya3M4Z1BaOWhjTmFXS3IyaFg1ckF3S1JS?=
 =?utf-8?B?VFVLWUVROWs5NkJMelc2aUFDUnk4aXlxbEZ2UzZqWGw4amlPYzAzTUhyNWRr?=
 =?utf-8?B?bGJuMzBta3RKbVNKaUlBWTNYYmVMcGpjaVhLMzhrMHZMVEhNKy9lSXpwZ0Jx?=
 =?utf-8?B?TisxT2NmRXlyVmZKR0dYUlc0eGhIWkRRU3FEOGhhZ1BTWllYZHJSbSttb29R?=
 =?utf-8?B?Z0dqN2RYQVpKOEZaZ2xEOVY0Ymk2Ym4wa0JaOG1KMXNjY1hueHZRRVJ2aGd1?=
 =?utf-8?B?cnZJSE1PeHVFbU1iTThRVWdVMzhWUndRMkMvWVZSMHpoMkxDU0ZpSWpmTkZW?=
 =?utf-8?B?OWt0Zk1FbXJLd21scERmTnoxRkhqdm9QVCt4MHFvUktYekVhSnRxaGZ2RThC?=
 =?utf-8?B?cUR4cFR0cmFmbTlTbHhLVWxEMTVJekFORElRUW9tbnNFcTBFemhBRUVNeHF5?=
 =?utf-8?B?c1dreGI2d2hQTEdUK1plc0hXNjNSbHR1N0duN0tZdHMrOVJFU05VaE9PL2ZC?=
 =?utf-8?B?N2J6M0IvMXVBVDA1SVFmOXNvUmlyT0kycGl5NFJ4bS9BTmZqcnVtNzNDZU9B?=
 =?utf-8?B?dzJwNkxXQlV6SEN2ZUFlSHI4M2l3UjhDTmJiMCs0VXNYSmRScHJtTG9nTEF2?=
 =?utf-8?B?Tnh1MGdicDVvczNnOW1XMUpDY25namR4MnhtS29iYnNOaHhnVmt5OHJjMUpL?=
 =?utf-8?B?S2R2V20xNkwyTVc0Wk5zMGI0L3pCMmhZcjVIbW5UOUEzZVhHOTV6VTMxaUdi?=
 =?utf-8?B?SnNjSkFCNS9nRWJBc0tmOWQ3QytyZlVoaFNwbUtyK2UxeFowZ045N2p5dDBy?=
 =?utf-8?B?YzJTYytybWROUjlkdkJRTlpOWHpJUm80STFxc2hHa3o1bjQ5QTRwYU4xUWlS?=
 =?utf-8?B?cyt5SFYxdnN2LzdCNUlZclZUZkxwL0RoMmZDQkNKTEpOMXVkUVFSdFllUzNy?=
 =?utf-8?B?Q1hlcTlibGZ5MitsTUQzZ2pXaWNEaDVnTS9ieDNaekN1UnFlc2tZbytCVVhn?=
 =?utf-8?B?eUZrbFlEUjQzR29qSEtxWjB0YnVhdWo3VFcvS0pZV1lOYWFWMGZrM1Z1YkVB?=
 =?utf-8?B?YVZ5Z1RkcUg0SVB0bFExNGhYaGFjRXVZeGxpZUtOU1FyQUZWNWNxaTJmelYz?=
 =?utf-8?B?N3ZxcE5kdE56WUkxVXlaTS81UHllNDF2WndIZUdqSVV4eHl5YVlpYndudy9q?=
 =?utf-8?B?M3Yxd3UveU1kT0RrVGd3cEZSV0l5TzFKL2dqSUxNMkRTSmRQSDN3a0ZwU2hp?=
 =?utf-8?B?MmZkam1WMTRFYjVMclJCRlRoVk9taFFyQ25ldXBSOEJQN2FZNFF5RjFYOHhR?=
 =?utf-8?B?RVRxYlFKeEMydXNGaHUzc0RlVzd2WFpBTU5BTENiZnE2WXREQzJNYWt0QTE3?=
 =?utf-8?Q?tx222rFJj3w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejUyT1RNaitabWpra00zbXYzdUg1YmhNQnZLNlF6TTFMRnJvTUZBenh0a2RF?=
 =?utf-8?B?eXFoNmpwdzFiUXMvRjFTdkx0UHBrdzlPeDlpakhwanpZNXQyRGFkbjNlWXp6?=
 =?utf-8?B?NEljSG1EMXM3VE9zaWpZQyt4L08zYlFxRmU0VnovY0RUeGVJZGQyV21LVk1Z?=
 =?utf-8?B?Z3FvcGxJbzFkMExWaGx3ODNVYnkvV1E2b0ROVU9ITVlISmplVGFIdHNrVEln?=
 =?utf-8?B?Yy9DNEJjZEY3dUR4c1k1OVRrWjlSZTRDK0FILzhMZzB1eEU4c0p6SnM5VDJO?=
 =?utf-8?B?aFN3U1ZtUFpTSzJTM1lsOWJZUzFIbzV4T2JxajM1cmpTdHRTQkx4d0VDa2Iv?=
 =?utf-8?B?bGhVTVdDMkRzaUQ2cmVrczlyOE8xWFRUMmVXa1FuZmRURlFkOHp4OFBWYWMy?=
 =?utf-8?B?VTZVWlEzeDZkdmpPTDQ4RGdVRTRxS3Jhc3h0SHBQd0RFeThhYzVXL2JZbTZG?=
 =?utf-8?B?eThUa2tWenFIQkpHakJzS21CTjRmamw3aThjcGhYZFlJck9BR282NFlQZWVx?=
 =?utf-8?B?OEZsMThxaEpDWW9kK0sxL0E3eStDMm5WeXpJMmZpWlk4LzNvb0lkb3RJbHI5?=
 =?utf-8?B?WmRqTnZTRExFQ2ZZT3A3THQ0dTc3eExrNzBxdUNXZFlxNUE1VkdpOXY2V2V4?=
 =?utf-8?B?Wmlib3d4bjZIdSs4clVFQ0lzNkpqWUhjdnpiYWR3cEpFM0xlV0RQOTNIb1px?=
 =?utf-8?B?ME90aEVlbWc5TWM4ZlJmR204UlNic2t5QTBtTjFORXRubzJtVWg5aDdCVXZ1?=
 =?utf-8?B?UUxXQ2RvWkgwVytsUmJleXV0b2h2dHJJSktGWWNPWngwemhHMXZGNEIyT2Vy?=
 =?utf-8?B?bnpsWkNmRkpWUVFJK0lidnFZSnpGbUZ3bTI3Sy8yTDVsQThWZjNlRUtQQVFC?=
 =?utf-8?B?RzJnN2V2cDA2ZVMyOWtHbEVkc29KSlladEFOenptV3U2N2dUNm55OVMwbyt6?=
 =?utf-8?B?eFl4bVJNWTJpbU5QdVdTVHlUcVliM3lVKzFUejVRRXFwdGJWWmxPRm8xODdN?=
 =?utf-8?B?WjBTLzFWMUxhS1JRRUF3L0t3dHRYMkVZWkpXeHozczF2M2kzNFQ4WUh4QXR1?=
 =?utf-8?B?YjFIdFhxZ3Y1c09QWEYyVnZUSk55U1haR2c0SER2d1pQOVMrcFBYaGFndkpS?=
 =?utf-8?B?N3FFMWhEenRIcGt2Rm83dG1maFdYa0xHNUJMbmlvYUI4T0oyNFQyTjJrc3NC?=
 =?utf-8?B?Sm5XSjFFbGxIOHBQN01KQVpqZ2swbkxRNVNqc1IyRkI0aUFPWnB1Q2s3Yno0?=
 =?utf-8?B?SVIzODFFdjR1SnQzd3pTcWtJS2J2L2hSMjhtbEVqUHY5NEU1NXRjRkprWDZW?=
 =?utf-8?B?ZVdqVytIeHVRaGpJKzk4dHAvZDJ6K3Q0RlR6VnozRVRBc28yVVRxNXpnMU9x?=
 =?utf-8?B?V29zVStKTm9ncU02Yy9oaU5obUhIN1JON0VFang1STdweWFDL3hpYklWbUVJ?=
 =?utf-8?B?SzY2UW0zU1JRamQ2ZFl0OGMzTGVpWDZXaUNLY1MzRzZZS21wMWFTeHdEeVFt?=
 =?utf-8?B?WHZoZzNhZ1hvZGhkOHlHTHFubjNheUxSZXJSUk9qTGQ4dk5hN0hiNC9McnJz?=
 =?utf-8?B?enBIcmZSWWxtZXcwcjd0QTBQdldOalQ5SW1KVVpZZE0zdVgyeGRGRTJaU2E4?=
 =?utf-8?B?Z0ltOFdiaCtlOTArZXBscU1YRDdRcmd0emVTZGQ5ZjZaRWRMbDFlbG52a0o5?=
 =?utf-8?B?Y0lpcm1CUlVTckxwcitNa3pGc1pCWFRDalBkdlNybjlQd1NUOExZY0krWTRM?=
 =?utf-8?B?UFp5ejdRbTdhR1d3RXhVcVZYQzl0Y2F2NE4xL294blFjS1dBckV0clVqRlIz?=
 =?utf-8?B?ZmtBb1Y2NVpQcHNrOUcrQktYY2IrL09OdHhxSnMvRW5pVVBlNm9VSmMxVHUz?=
 =?utf-8?B?NnRhRjA1dVRsdU5zYmhWQWRsYStLTXNGQkNlRjFUd0dmaHRXUGJnejMvdTFj?=
 =?utf-8?B?aFEwaXBCM2xqN1V6Z01mMmpQZUx3NjhQdjFaSmxxTG4rd21oY21PWVZBbWl2?=
 =?utf-8?B?Sm4zWUNpRVc4WUJnam1pZXJMejlkbU1BbW04cTU4elBtUkowdXpobDkxM2xS?=
 =?utf-8?B?bU5zS2tiYlEreTF6cUJYb3p3VUV1Y1FzeXhEbldtVkV5eWFQcXpOd2Q5T01S?=
 =?utf-8?Q?kUZ1lC0AlKm4mVwpi9aWVX2yA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b36f6a-8908-43e8-4897-08ddf72e5e93
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 03:41:08.6566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdGGyFFUzz6Z2VkQGWSnVwqneexF2ln22f5957GpAJH6eW4mm05aiK05vp5DLeU9sR1vNcD8hwt5PaoWZEur+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8538
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

Hi,

On 9/18/2025 5:17 PM, Kamil Konieczny wrote:
> Hi Kunal,
> On 2025-09-17 at 15:11:43 +0530, Kunal Joshi wrote:
>
> imho in subject you could add 'display', so it will be:
>
> [PATCH i-g-t] intel-ci: Update BMG display blocklist
>
>> update bmg blocklist with unsupported, while at it
> Start from uppercase, also add a note of unblocking fbdev,
> so description will be:
>
> Update BMG display blocklist: unblock fbdev, add unsupported.
> While at it update descriptions.
>
>> update skip message
>>
>> Cc: Karthik B S <karthik.b.s@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> All of this could be done at merge, no need for resend.
>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Before merge I would like to see ack/r-b from KMS team.
>
> Regards,
> Kamil
>
>> ---
>>   tests/intel-ci/xe.bmg.display.blocklist.txt | 65 ++++++++++++---------
>>   1 file changed, 37 insertions(+), 28 deletions(-)
>>
>> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
>> index f145d6c0d..1686499bd 100644
>> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
>> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
>> @@ -1,8 +1,7 @@
>>   #########################################
>>   # non-KMS tests
>>   #########################################
>> -igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
>> -
>> +igt@(?!.*kms|testdisplay|fbdev|.*display-vs-wb-transient)(.*)
>>   #########################################
>>   # Valid skip :- Y and Yf-Tiling are not supported
>>   #########################################
>> @@ -11,6 +10,7 @@ igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
>>   igt@kms_flip_scaled_crc@.*(yf|y)tile.*
>>   igt@kms_async_flips@invalid-async-flip
>>   igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
>> +igt@kms_pipe_stress@.*ytiled$
>>   #########################################
>>   # Valid skip :- 90/270 rotation is not supported
>>   ##########################################
>> @@ -23,7 +23,7 @@ igt@kms_rotation_crc@sprite-rotation-90-pos-100-0
>>   ##########################################
>>   igt@kms_atomic@plane-primary-overlay-mutable-zpos
>>   ##########################################
>> -# Valid skip :- Requires TV connector not present on BMG
>> +# Valid skip :- Requires TV connector
>>   ##########################################
>>   igt@kms_tv_load_detect@load-detect
>>   ##########################################
>> @@ -43,7 +43,6 @@ igt@kms_cursor_crc@.*-(32x10|32x32|512x)
>>   # Valid skip :- Downscaling factor is not supported
>>   ##########################################
>>   igt@kms_plane_scaling@.*downscale-factor-0-25.*
>> -igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-(5|75)
>>   igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-(5|75)
>>   ##########################################
>>   # Valid skip :- Downscaling is not supported on second plane MTL+
>> @@ -58,21 +57,30 @@ igt@kms_cursor_crc@.*128x42
>>   igt@kms_cursor_crc@.*256x85
>>   igt@kms_cursor_crc@cursor-(offscreen|onscreen|random|rapid-movement|sliding)-512x(512|170)
>>   ##########################################
>> -# Valid skip as BMG doesn't have eDP supported
>> +# Valid skip :- BMG doesn't have eDP support
>>   ##########################################
>>   igt@kms_vrr@seamless-rr-switch-vrr
>> +igt@kms_vrr@cmrr.*
>> +igt@kms_atomic_transition@.*-internal-panels$
>> +igt@.*psr.*
>> +igt@kms_pm_backlight@.*
>> +igt@kms_pm_power_saving@.*
>> +igt@kms_scaling_modes@.*
>> +igt@kms_panel_fitting@.*
>> +igt@.*@.*(?!no-)drrs.*
>>   #########################################
>> -# no VGA connectors in BMG
>> +# Valid skip :- Require VGA connector
>>   #########################################
>>   igt@.*chamelium.*vga.*
>>   ##########################################
>> -# Expected skip as GSC not present in BMG
>> +# Valid skip :- GSC not present in BMG
>>   ##########################################
>>   igt@kms_content_protection@content-type-change
>>   igt@kms_content_protection@lic-type-1
>>   igt@kms_content_protection@type1
>> +igt@kms_content_protection@mei-interface
Although this is valid skip it should be under a different category as 
not skipping due to GSC.
>>   #########################################
>> -# Expected skip as BMG doesn't have PORT_A/B
>> +# Valid skip :- BMG doesn't have PORT_A/B
>>   #########################################
>>   igt@kms_pm_rpm@modeset-lpsp
>>   igt@kms_pm_rpm@modeset-lpsp-stress
>> @@ -81,49 +89,46 @@ igt@kms_pm_rpm@dpms-lpsp
>>   igt@kms_pm_lpsp@kms-lpsp
>>   igt@kms_pm_rpm@modeset-lpsp-stress-no-wait
>>   #########################################
>> -# Expected Skip : flat ccs has only one buffer
>> +# Valid skip :- Flat ccs has only one buffer
>>   #########################################
>>   igt@kms_getfb@getfb-reject-ccs
>>   #########################################
>> -# Expected skip for graphics ver >= 20
>> +# Valid skip :- Valid for graphics ver >= 20
>>   #########################################
>>   igt@kms_getfb@getfb2-accept-ccs
>> +igt@kms_vrr@lobf
>>   ##########################################
>> -# Valid skip :- Feature is not enabled on kernel
>> -##########################################
>> -igt@kms_writeback@.*
>> -##########################################
>> -# Valid skip :- dc6 is not supported by dgfx
>> +# Valid skip :- DC6 is not supported by dgfx
>>   #########################################
>>   igt@kms_pm_dc@deep-pkgc
>>   igt@kms_pm_dc@dc6-dpms
>> -
>> +#########################################
>> +# Valid skip :- BMG has only one cdclk (WA)
>> +#########################################
>> +igt@kms_cdclk@.*
>>   ##########################################
>> -# Valid skip :- DG2 & MTL specific
>> +# Valid skip :- DG2 & MTL specific & LNL specific

Nit: Dg2/MTL/LNL specific

With this minor updates, patch LGTM.

Also this could be done while merging as minor updates.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>>   ##########################################
>>   igt@kms_ccs@.*-dg2-.*
>>   igt@kms_ccs@.*-mtl-.*
>>   igt@kms_flip_scaled_crc@.*dg2rcccs.*
>> +igt@kms_ccs@.*-lnl-.*
>>   ##########################################
>>   # Valid skip :- Simulation specific
>>   ##########################################
>>   igt@kms_pm_dc@dc3co-vpb-simulation
>>   igt@kms_simulation_hpd@sim-hpd
>>   #########################################
>> -# Chamelium v1 HDMI receiver doesn't support 4k
>>   #########################################
>> -igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
>> -#########################################
>> -# Valid skip on non-hybrid configuration
>> +# Valid skip :- Require non-hybrid configuration
>>   #########################################
>>   igt@kms_addfb_basic@invalid-smem-bo-on-discrete
>>   #########################################
>>   # crc-random cases are resource intensive
>>   #########################################
>>   igt@.*chamelium.*random.*
>> -
>>   ##########################################
>> -# Valid skip :- cursor moving doesn't take slowpath
>> +# Valid skip :- Cursor moving doesn't take slowpath
>>   ##########################################
>>   igt@kms_cursor_legacy@(short|basic)-busy-flip-before
>>   igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-(transitions|transitions-varying-size)
>> @@ -139,20 +144,24 @@ igt@kms_setmode@basic-clone-single-crtc
>>   ##########################################
>>   igt@kms_setmode@invalid-clone-exclusive-crtc
>>   ##########################################
>> -# Valid skip for display ver < 20
>> +# Valid skip :- For display ver < 20
>>   ##########################################
>>   igt@kms_frontbuffer_tracking@plane-fbc-rte
>>   #########################################
>> -Unsupported for platform with Wa_16023588340
>> +# Valid skip :- Unsupported for platform with Wa_16023588340
>>   #########################################
>>   igt@kms.*fbc.*
>>   #########################################
>> -# Use either of linear-tiling or
>> -# connected-linear-tiling
>> +# Valid skip :- Use either of linear-tiling or
>> +#               connected-linear-tiling
>>   #########################################
>>   igt@kms_bw@linear-tiling-.*-display.*
>>   #########################################
>> -# Linear + hflip combination is not supported on BMG
>> +# Valid skip :- Linear + hflip combination is not supported on BMG
>>   #########################################
>>   igt@kms_big_fb@linear-max-hw-stride.*hflip
>>   #########################################
>> +# Valid skip :- For display ver >= 30
>> +#########################################
>> +igt@kms_pm_dc@dc5-retention-flops
>> +#########################################
>> -- 
>> 2.25.1
>>
