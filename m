Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22140E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 07:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE4E10E0FD;
	Fri, 20 Dec 2024 07:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMEJ5cv7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1283210E0FD;
 Fri, 20 Dec 2024 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734681221; x=1766217221;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sAb+Cn9TThC6IrMUyWXoKdT580ylLehiby5aYpM9bJw=;
 b=AMEJ5cv7NQU8bTDPOwnaZz+3U0BlB0sSs05rZYyHirBTwG4eFSEvq8Gn
 ezln9Dm2q6WEsg2v5OLp8JyeLPmXkkTPru8dsiNldiA+yN5/QkNtvjVyc
 L/1Hjw7jLseBV4/yCYfjQkNgJKBoSgFwFe0CEunrne0lQGJmDvoUNHAp0
 8h1tdSTUTNu8RZpyDLVZOXqjrpAxrdWSA8SJiP0Ox5Wdy34CvOWynMaqR
 5oVYXWej7+SYJ2JtP6fhB1uvknpcJg9Dy4Rs9VhmnGsJPbVOzpfWK4jiZ
 LXJ5HPKQWM7ulQsKkBU1ZSfN9ffkoj5CDwEB9WoePHuT3jUInV/IqOSaw A==;
X-CSE-ConnectionGUID: NiZqISfGQr2j+nUBAI71Lg==
X-CSE-MsgGUID: XcsCwB1LRZy9X33BFhe9fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46644577"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="46644577"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 23:53:41 -0800
X-CSE-ConnectionGUID: 7rZ1wK6aROiuAMRjwuMVDA==
X-CSE-MsgGUID: iyZpxP7mROq6YEZFS4Q1AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="98508606"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 23:53:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 23:53:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 23:53:39 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 23:52:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BH55oxDLKafZNxGtR1Nt9MT1ev739PJ1Vqsb8PNrKjfeCsE3EiQFhxx1oYZLZZw/QiaOTkd6EEJDxLGh1RjPdD7DhkyVJB1PS57inc0ELgVcfyc8BcjlLaDSn7O5aEEjMB2RZsOmpLo/3wDjE4NgYzA9dyF68zK8ODoJ6VxTpzCv3t9oYqyuSTRwmuiG9t/1FQ5LQmILICQFndxlA0e2+n68/Vo3S9l84zEtMPWAhHRTtWioUo7cI77fqgQRCvQao6+TkBUlFGU2cbzqiU16G+8qchtdFh7DY/7lwibmG+rOqmQ54J+tVKUKz8z0bpDre73hcYq3wvqFgNknmsa8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaRYTpvg70iRhRceWCtHl+GKUUenj+zhrVdRvP4D3fg=;
 b=LVtqamqDQybZP+gk85oQ9dVyy1Wg1uEanhUw8ykl5oqaKn5WEsKxXy9LZssnV3M+ZuUIa5LiUmOalcbIaxQyKB+OcpM+mWIvz6P+AITdzit/AT8a7z/qWwoOsMlFSprMQ9H8/O3WRkrP6UQdUuy2YbUW5EhzWCTDkVop+FHSD+/FYRRC+pAMHPuvu3WPEbHdICmZ0aGm2IrYGsLMGti2ltUMY5ffVynzAdhW02qMqJdhNXHKWONXJjyMDeyx0+gM4f5KKBK8vb2mugG33UvaGLtntzGtuMYtWMRl740kBPnKDJuLNElbmjtVuJjMxKm6nRj5EWQCICee+TnkJYEaww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 07:52:54 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%2]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 07:52:54 +0000
Date: Fri, 20 Dec 2024 08:52:46 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <I915-CI-INFRA@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/i915_hangman: Fix spin engine hang (rev5)
Message-ID: <exkhslbvceuiqvtlzf4b42ql2lzhpusnm3krbtrf72y32ozmi3@tq7dvrvdwtga>
References: <ewfsrzwiwey464lvqix4apzswvmfs4vvwbnndxdbrvtmtyjev5@p3lqcqy6sxve>
 <173454714978.124020.6200474898503408048@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173454714978.124020.6200474898503408048@b555e5b46a47>
X-ClientProxiedBy: VI1PR06CA0195.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::16) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3d939b-e018-480a-b7a0-08dd20cb4f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rkd4QkJjZ3BpbktnYmNMRWE2K1lzT1ZiRUM2REt1TVhvam5YanN6VEl4MUh4?=
 =?utf-8?B?QzlseWFub1NTemIyeUtBenRnc00rNFdLZ2xyakxONWpRSy9rTzVYK3Z2VkVp?=
 =?utf-8?B?Z3VsWnYxVDBGVlNlSGlYNEtubVhtWlhZYVRRdjRGUlBHOWUvSDMwZWoyUzdY?=
 =?utf-8?B?ZjRlbmJIdEhWMjVRbndTMjllQVVyVDJtSFhMS3hZZW1qbmtiOVN1MmY3b2xL?=
 =?utf-8?B?a01qWjZyczZkT3YwelNPODAxNE5LU0NIWmRHWnRTSGg1T2wwU0wzcCtKajZI?=
 =?utf-8?B?dzA5S21JbWZwRG44M0hqeTNrd3dVeGdIbEIrbDFwQkUwWVd4eElVNXBtSFJX?=
 =?utf-8?B?cXJJTDdJU3pCWTJaN3BDOVBoTlZ1MkZQN0FodDNsU2lrZGo0b0VvbVVlblJD?=
 =?utf-8?B?aGFFQXVheTJjMVh5cGdScDhzZldGVGxHdTYydmxhMWtOT1hXTWNOK2hOckVw?=
 =?utf-8?B?S1dxTUV0TUttK0dXalV0bGFYc2Y1UCt3MjNYVUtzOG9qQUE2T1hOeG1ZQ25D?=
 =?utf-8?B?Nkh5SjNGcGxIcXZXenFyL1k2SWpaREVDN1BIdklMUUdUWm5HeWI4RDBZL0dQ?=
 =?utf-8?B?ZU5TT3hFMWFEa1IzZytCUjZDeWQxQzVwbUltV1FRanRrQmZnb1UxS2NZT0tm?=
 =?utf-8?B?OTNVeVQvS2dGR1ZTK0RoZFMxY1pNRGFtbXVSWVl1V0dRYUpYc2pSalBwVTM1?=
 =?utf-8?B?cDc3M0l3bk5LQktzMFVpM1loSTg0cFdnWmZuaUNybUlKaE1IeUFaTFl2RTIr?=
 =?utf-8?B?dHZseEtwSDM3K2E3ckRJcEJuY25NOTV6cjYza1YzSGVDcm9QZTIrYWFxSk56?=
 =?utf-8?B?UldyMVJ3eFNFME1TczVzM043KzIzS29PdHU0V2ViSW85bGQyOEI1dVJLdjJq?=
 =?utf-8?B?UHNyck1ieVN2dThnTnNhMWxRaWZuS2crektXZzQxNnhCMjhpQ2dsMDltSDVl?=
 =?utf-8?B?Z2E1cWpOa2ZLM3o5TkFFak5hSFhXY1AzWVVNSmZrL1VjVWEyMXBCN0cyZk9z?=
 =?utf-8?B?M1lFaE1nNWRkWWxvcUoyUmV4VUt5SjViU2cweUpnb0tGNDFpcGIxQXZTcUxB?=
 =?utf-8?B?S0lDTmpWNGJlNWEwS2ZLemRPQ2U1TTZvZ0JZMmNpb3pFNjRkNDh0cVhPTGd4?=
 =?utf-8?B?cVkrRzY3NklSZ01jQWJwcGdJRVc3NFNPVTh6b21zRjFXTmdCVEMwMy8reVg2?=
 =?utf-8?B?aHJzQXBidy9mMnZOMG42STF4MUVxUS9KVmlLQU9FQ1IrdjEvUEJxTWZrV1JV?=
 =?utf-8?B?Z2VYZzlXbitFU0pRcE81aU1uQlowVWoralpJS3FydTM0azVGalFoTEVkUDdJ?=
 =?utf-8?B?bm55MnNSNnhtNDFVWkpFcnFhKzVMZUxxQjBiY1BienRmL0R4cUNuNmU3ZVl4?=
 =?utf-8?B?Qk04TmZVRnBrUXEyYzQ2ZDl4TGk1Z3FzMHliWjhMS01nTCtTYUVDVHZrYWpI?=
 =?utf-8?B?R1FJSElENm1LT3lST3JOakZUWk9rVm9uTW9DK2hwZHZBYXIwK2N5Sm9lZlY1?=
 =?utf-8?B?NXJFTkJsMUtCTE5yTitjM2ZUNm0vYThyNmxiR0pJMy85Qkg5VVNWR1UyYith?=
 =?utf-8?B?TUJnVzRQT3BkMXR4Y2xMVXdsazlqenRoSlQyUUNvQUJGd0JmRnhoQVA2UERl?=
 =?utf-8?B?bnRPblVHVjBqYmwvbFgrZWtIaDlnRTYxV1l0NnpDN2ZIWElnVTFuVlQxRWk5?=
 =?utf-8?B?U0s4Vk1XVkJYcHVpSUM0YXBERmVtaDBvNkU2QjB0WmN5ZU9WbzZHMWM1NVRy?=
 =?utf-8?B?SDFCZGdEaFpIT1g4UXRDNnduM1ZGdHUrblhNblcreXhPTkJmaDVjOFpEN0xM?=
 =?utf-8?B?azdIaktpNkdPM1NRdXBmQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDRDMGRaVVU5ZjJxZ3VHUXo3U2FPeGFWL2dPQ1RKUWxhZFB5UXpwdktoN2lp?=
 =?utf-8?B?L0pUZGM3OCsyamc3RHRpeTc1M3dJemNIOFh1MVErR0NmS05yOEppUTdnUVc1?=
 =?utf-8?B?L2lwUm5NbUlrSHhDbVhQM3pvUGtNMCt1WVBnMTVIWWJLTXEwTituMHFONStC?=
 =?utf-8?B?bGF1bVYvNWRJa1NHQVdtN2dVZHVaQU1IckN0S21HUDJBcE82TXM2SkkvaUtU?=
 =?utf-8?B?WmxrTGFJZm5tc1NwYjM2eURCSXBmQ2hVNkhtU3hIRFZWWkYvSWxmc2FVYTZv?=
 =?utf-8?B?Z0Y1N3hlZllMclZiMmU2eU0rSVgzRnNQbEZmbEhKMzlzTHVQcDFHc2JMUnhL?=
 =?utf-8?B?WWhGYTlzdTZqeDEzb3JERzdldi9uNEszdG5WN3dmM2g0aHZtdHc3ZG1HSVBE?=
 =?utf-8?B?cWsyR3kyeUdYV0t2WHhCZXBtT29nRWhzQ1JMRFYzbnZZdGQ5Ukd4c0sxN2ZL?=
 =?utf-8?B?ZG1EbUxpMklQb2NTZmtiQnNPN3ltUENMd0ZiNkcwL1lvTzU0QlhqcnVWa0FD?=
 =?utf-8?B?bU9uOTEzTTZpSnVWcjRXd3Y4UnBFREpRYXJNSzFaM0ZaeHpUSTd0UHpGZHkx?=
 =?utf-8?B?LzAzTnorU2F3VXlVcEdBRnI4WmxGZ3ZmdnBSTEsxc0lsWE5sTElmVERYbXpz?=
 =?utf-8?B?d1l3TmVJcEVXRzRob2NFTFRjbUkySkVPS0NBUTZCSktOeFVNeTVIUnVLSlhw?=
 =?utf-8?B?bGd1Vk5OM2tYVUNMdEErRHVxcXFrNnJwakI3UlNrN1RtQlpJcE5IZm9Eajcy?=
 =?utf-8?B?cXBEZUxTTnAwSkx3UDdZL0pOM0JoeDdmdXNCWkV0NXRaVTByaDZOSFN3aHgr?=
 =?utf-8?B?d0ZLYW9zb2hQZGpERGdUamlRZ1hLamduUEMrd1U4Q2VhcUROZE1NOU1IanVT?=
 =?utf-8?B?NlN0Qm1DZkNBREFjOVo4UFF5Ym9mYURzNDFnYnVwTVQzOGo1QmhVbExMN3ov?=
 =?utf-8?B?cUFrTzNkcWNFNm9HdTJRcTBieUdJZjFJdXo1VjNJOFZMVW5hK0hocjFORms5?=
 =?utf-8?B?Y0tRQXRYZFZLSm1yT2FRUkxQQUg0VEJoNUliWHBURXRDVkE2akFDa0J5bWt2?=
 =?utf-8?B?amtYT3dHWUlnSWxRL0hOcjFsY2tHNzRNTlhMdFUrTzRhYm85Z2l3NlhTM2Jp?=
 =?utf-8?B?dVI2K3dWOGhGQjRoR3FadHU5c0NUVjU5OUg1WUpmMXl3Zks3UFVIQ01Mekxi?=
 =?utf-8?B?NkREQzVjSi9wN3dVQXdOT0U2THhJcjlvWVYxUTltSjhQZlhWbm9qb2tQTHZK?=
 =?utf-8?B?Q3E2djhySjdMc2g1ZUQ4UjZPSTVleTVsQjE2Z0VXMTZ0VlBhYUwwa3M2MHJn?=
 =?utf-8?B?MWlTUWJndmZnMlc5ckZCNWRqZmJUSkRzdWcyYjJzdkl2R2pudUFYNmNScTEz?=
 =?utf-8?B?bm1EMG91Qmc3dHQzZnRiNDFzMEFsYkNCQ1daNEVnTFYxbk9xdHpZZXVMZkt4?=
 =?utf-8?B?MUoxdkh4K1hvaTJCQTZqWDRWREI1NjZVQWoxZEh4VTFERk1iVmZYN1hTZGZR?=
 =?utf-8?B?dXFCUWdsczBBVkV6SEVaUnUzczhWcjJaZUtmLzFwZUtmMndENFFlVmJDZnZP?=
 =?utf-8?B?bEhRU2kyVGVrV1d5Sy92OEpqSDJDeVpiVSt2UkVGd3JwS0RES3B4cTFkaDZN?=
 =?utf-8?B?eHpBd1o1cllNZ1RwYjBwMFlpVHZTOTJJWXcrazRNVU9iZjlQWkwrZzE4aHho?=
 =?utf-8?B?MXJxa1RsNGthVnB2YmlvK1VFWHpEV1VkZVJpV3VQbmhnUFNTZHVxNXNPdlI1?=
 =?utf-8?B?WExScS9kRmR0QXRsZVROL1RVMnBEYVJLT0xobEdMRVp3YjhKbEhFT21RSjBm?=
 =?utf-8?B?eGUwSE05M2QzdmxaMUVYZm9FNXhpRnJlZjBoQUxlV2Q1Y3Qzcys4bjJWNmdl?=
 =?utf-8?B?THZmb280bFphNmRwVGpYTTY2MW9mUThJaDJRWDY0bXlKZFhKb2xCRmJCaVVI?=
 =?utf-8?B?dllpZCtmU2ZTRWFSVU13OTA3VFQzL1E3Wm9FdGcrdSt4RzA5d0JBZFN1YTNH?=
 =?utf-8?B?b203TVZpai9JZnVGZ003cFRoU2dJZmliaGxiaTh0TEVkRUZuQ0diTm10YldQ?=
 =?utf-8?B?d1l0UFdMYm1ZYVNNSEtjMFg4VFVPWjFDWm5ReDNYU2k0SEkzY1BPbWRHa0U1?=
 =?utf-8?B?NGVJeUNkU09ZaHFLUFJib2ptNjFiY0JMNExlNGdNazJmZnZrcWRSNXdyNTlz?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3d939b-e018-480a-b7a0-08dd20cb4f9d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 07:52:54.3894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jI8BslI198Jrzry3dkRJhTjo/cAt2kND2tuuj5gL4LfAcg71Gw+27laloSfKRZvaWihmr3UOByMq33uxNHlNIf4UYgWa61i/W89FqQ1/eCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
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

On 2024-12-18 at 18:39:09 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/i915_hangman: Fix spin engine hang (rev5)
> URL   : https://patchwork.freedesktop.org/series/141694/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15862_full -> IGTPW_12334_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12334_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12334_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12334_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@crc-atomic:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][1] +3 other tests incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk2/igt@kms_async_flips@crc-atomic.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          [PASS][2] -> [INCOMPLETE][3] +1 other test incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-mtlp:         [PASS][4] -> [FAIL][5] +2 other tests fail
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-mtlp-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_pm_rpm@pm-caching:
>     - shard-rkl:          [PASS][6] -> [SKIP][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-rkl-4/igt@kms_pm_rpm@pm-caching.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-1/igt@kms_pm_rpm@pm-caching.html

Hi I915 CI Infra,
These regressions are unrelated as the patch changes only i915 hangman.
Please update filters and rereport.
Mikolaj
