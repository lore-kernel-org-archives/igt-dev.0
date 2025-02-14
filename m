Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EDEC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 07:37:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B35610EBE0;
	Fri, 14 Feb 2025 07:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IqLe85K1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD7410EBE0
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 07:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739518625; x=1771054625;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TKe95LJIcjcyX+LisbNxl3WcJK/wLmKMXseFQqcEbS0=;
 b=IqLe85K1W49hOLDju0AnFxNh9WpOO596TJqZzwV1Ed+flFMwSYeE8KN+
 EkvwbIztbDFoz4BFCAjx319gDjna3WmtbnoHQv0rB91tjaGECeDxR4O8V
 3EN/7D/olxLgApxJoHEJTjgvdJgHUBU7gVwP8IS2lHGDuww7GOy4e/ttj
 2mx1UNsKbNEYvjdYiafeYa4+vEGN2rrP0/CwveXNKctLSzOYaUAcbInZJ
 6L32wYeKThJe8T9/Eyzv+DTymZ7g6PK8n+3wTISMuI10fr+Aii4IvVYTV
 UAQBUQWwAm9R9y8Yde+cLxKCThRCObDRwY/wyYazxOuU1xoYnPXzVDI5X w==;
X-CSE-ConnectionGUID: 44QRet6QRSmJ9d6zG3HUXQ==
X-CSE-MsgGUID: hEELQSSfQaqaB9TehP3q8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40293256"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40293256"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 23:37:05 -0800
X-CSE-ConnectionGUID: sJGYXn74R8Gr9uFsVgz95A==
X-CSE-MsgGUID: sjXjV3KhQziQIId3vYiZ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="113580562"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 23:37:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 23:37:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 23:37:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 23:37:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcVWFogSQEHe0CY39ZOjpIHYkPw9pTuk/1+24vLxmGf2Q/t1DW8S0vg9hG1QHj+2O9LRPFBiQI5HdkYVenDhiMPhVY9FNZpvPJHUUDfpUEcupfoQKnY1lkALh3Ed+AtDOETT2W5DypmCubg7ABY5/cXfXaHDX11NyDiBEiMaCTxCiFjeW/I76zGLpDpCSZOVbnmgUXNOcvVyFRrx08tpr3jTa0yX7V2w60ooMsBcKwQ27hEa4qTB/pCedUCZJzP9w5qwqslJZhupf8JW6I7I9xLzNuxljxKrGFba7v9jZ/DDH8SObNQKDmKSlg08dGiof676qah4MU59ZLiVo+GeFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jZR627VJTjhRPRKdg6i1IqqKDy5/24jv+OkHCkIAX8=;
 b=p8THtutcViIJEXs7GhwkV09GxkDeV8Dy9ARkU7gZedsPxQJieS+BuE85yhqqbHjcyvz54bggeyqIWu3ImKcFsyhCSrKb4oys6Zcimc2FwqVa2TaX+KMXOF2lS9nYsFFOX4ng17HKnjH6+EAXFoEp6lp2CcToeMx9u7NMPVNKMl5V3k1UNyx5YhK5Of3rz2xscNOYHAzsHVXm9eloS/FaHpTF75QlgA9UeXkd6+7oF0D6fmgKRgn6FsZ3EPBEeGxUuONqObTaQDKFLhqCz1PdZlX6Sswq8N1ZRYmFT89v3jX8hIlAeueMgyus2brL6J0unmLq+Sr2OXawUIyRjqdDqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS0PR11MB8115.namprd11.prod.outlook.com (2603:10b6:8:12a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 07:36:48 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 07:36:48 +0000
Message-ID: <47345d63-1927-4871-85ec-5083ca601ba1@intel.com>
Date: Fri, 14 Feb 2025 13:06:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms: Drop 'Functionality' and 'Test category'
 from documentation
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Jari Tahvanainen
 <jari.tahvanainen@intel.com>, Katarzyna Piecielska
 <katarzyna.piecielska@intel.com>
References: <20250210105646.307902-1-swati2.sharma@intel.com>
 <20250211091138.kppr5lzhvnyharsp@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250211091138.kppr5lzhvnyharsp@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::19) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS0PR11MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 447ecf2e-6b44-4171-904f-08dd4cca56e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTZLTGx2ZzRMdmF1UzBtbEhrRWFGMGNuaW42RVFjdTc5QnZlc0tWM21obWNi?=
 =?utf-8?B?V05MYjFsSS9FRzllVjZLVG1zK0twUW91QUtjTS9kMzk3aEJiT3FxRmVWVHJ4?=
 =?utf-8?B?Z3UrSi96dVdJVlJjUk9QNlBKWFlhOERZa2F3VkdDdWRUR3Z0SFg0VHdwVFEx?=
 =?utf-8?B?U2xwOGFLZnQwSW1LZ1kwNTJqa2xjbE41OFlxM3Raci82SURXcldQakRHWHo4?=
 =?utf-8?B?ZEZQdjR5cXJqUzMrbzcvekdLUTRSVWJoR0M0cWd1M3hlc3Q0Qi9ybkk0N0No?=
 =?utf-8?B?MTNyUnd0R3J0UCtLUG5HY084MGIzZlJHeVdEMXk1ZzNhV0NYNnBXakJYbk1i?=
 =?utf-8?B?VXpKdHg5dlN6ZFZ2blBON2tVR3RwS09NejFMbUVWczlHRzh4ZGJEdmlRZnNG?=
 =?utf-8?B?UDlsWEFrK095RjdZSmRab0hrSksyWEZ6dGQ0cEQzQjMrTi9pTEpzMTl5MjBE?=
 =?utf-8?B?SzIyblA3RWxuUjRzNDQxYUlLRll3Wk8zaEgwUTJPTm9NcXo4c2JMdTJFcklH?=
 =?utf-8?B?NGprbzF0aWs2TENNNVZybGZzSkcwT1VyMks5UDJ0TmVvbUtiRXhjVFR0M1FP?=
 =?utf-8?B?c3g5TXAzQjkwMER2ODJkQmZIYWp2SWpFNnhOejdYWDkyTEEvZUlVL3c5dm55?=
 =?utf-8?B?L1crWEo1Zk82OWZKQVBKMHlyWnBEMWRTcjkzS0hHa1ZWM2V5Wm1YaHJNU2pI?=
 =?utf-8?B?b3ZMZnFsMnB0V3hkNjVzWnVORXhkYnM0ang0Z0ozUGVOTG94MTFlcFZ3RjFy?=
 =?utf-8?B?TEFHQzk2cmhJcWlzU3BSaHlEVEhzY3ZJdGNrV3dWZTRxUzZRQmd5QnZWZmc0?=
 =?utf-8?B?Wk9JK1Q2MkR4cGVuTzhrOVExTklqN1lSU0lBaGdsN1lkM2JwcUZFd2hka05n?=
 =?utf-8?B?L3psK1AzYnhrTGQyM2R1K2ZVeWRlZW0xaC9IL0t0aHgwTnNFWS81RkY3Zm1H?=
 =?utf-8?B?SFFxeFBGNXNYNTVYbkhnRnMvU010SUx5cE9vN0dYclZuZjNGRGcvbDd5cVdI?=
 =?utf-8?B?Nm1pVUx0TUV1TDF3NmpYaDUzS0sxcys0ZDBxYTJYdWh3eFJxWTUwOUZzRXhW?=
 =?utf-8?B?Z0xnMWJ2WHg2ajFPdDZTT241RCt2aHhoL2doZGpBamNIVUE2NEZXd1V0Zk5W?=
 =?utf-8?B?M2JXcXJ0SU9sR2hoU3VKU01ydDBHSlhXTCtVYkNTSzVORWgwV3pnMmI4THNJ?=
 =?utf-8?B?dWNTZ2xkR2dET3o0ZzBQNmFvc09NK2Zrak92WDNGcFoyRm1IcWx3Rkx0RXV3?=
 =?utf-8?B?Q3dveHdIRWlxTWh2djUxSExBTUNNUEpYaXBOMVB5OWMyaUJMT2c5TnFsbDJp?=
 =?utf-8?B?cXZ5WmhZV1kwVDA1SlgxY0tXNUh4TkN3a0wwbkpNS0FMeE5vMjRUREFqZk1h?=
 =?utf-8?B?VGVnV291OXlQOER1NUEzZkhORHI3MHBvZGQ0emVGTlZ1ZDZra09Rb2NWelVR?=
 =?utf-8?B?S1BCUmt2VjN1S09KbHltb05WM1djUjF0YWdJRlZEWWhnU2hCdk9xd2h2VWpq?=
 =?utf-8?B?SDI1dW1IUFdSa25ZU0Z0WUR4OTE1blMxUmgzM1RveU9JdHIyVmttM0xFNlRE?=
 =?utf-8?B?cjZDZ3dBZ1k1N3BSblM1RjZmcy9vWG54b3RlWVM0SG9Uc0ljc1lmL3BhU2lt?=
 =?utf-8?B?YVFScDBXeU5NbjFLRExEaGMzdXhCT1dzb1drVytrdDBDcHVzZW12WkZYZ0NR?=
 =?utf-8?B?ZFJkNkVDTThOa1pGSFUxanlhcThCSHRGalNadzlQZTl5ODQ2VTlSeWg4c3J6?=
 =?utf-8?B?Sk1CczEzWUR0WXZwRGk1UTFEWXdJak9vRVlNTnI4R015dlN4bjVDMmNhdWJq?=
 =?utf-8?B?cERraVMycUJGOXZRQ2plRXVXd1I1Z1RZRWZ2aUlqUmtjeno0TGFIcy8vQTNY?=
 =?utf-8?Q?EfGHnhMSbKDoC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aURvTVVuTzhzMkgzaXI3YW85V2QyRUJwc2dMdnhNMHZlVzY3WGRnYkdORkx3?=
 =?utf-8?B?TkFqalpMWFk2bDNXZ01VeEJReW5kQ0lVQ1FrQVRRcGNaSDlhb0k0ZlVzbzBi?=
 =?utf-8?B?b0NseUM0a012aXN1TldUWHlNTDFCOHVncXVzeDRSOHZrelN3MzlnSTFvZTk5?=
 =?utf-8?B?WjNDRlA2cTRJU1hCbEpXUEt0VEZLVXE0aHQ1SUFsN0h4TmdqUGpkdW1IOGE3?=
 =?utf-8?B?MFo2L0NyK09LcFNlUFlqanlFaG0rWlc2cStnQ3dUbFI1MGVOcHZaZnozVnVR?=
 =?utf-8?B?Rm1VNVJabDd1SE5GMzRIRStreU5QYkZyaU9kMDYvN2ZTYnlGWDhnWGYwaEQz?=
 =?utf-8?B?aElDOUxYL2hkUHlidDU1SVZBR2N2ekp3b2Y3NnFxN2pjS0U1UXRPVEJxTTRy?=
 =?utf-8?B?TVBDVmduc1dFeVhLbndSMFdBOThYWlJNbDBQeDZIMkVOY0pZYlY5VTB2Zmxz?=
 =?utf-8?B?Nkt1L0h6eXh3WHhaQ2F6OUp5bTl6L2MzTi8zaThsZGlaVWFEa090TU1aZGw2?=
 =?utf-8?B?ZTZUYzJhRDBWSUhsYTFPZ1NsdjNCTnFVanNuSURBeHMxMzRPS2pMUUdDNkN6?=
 =?utf-8?B?VXNSdDhSRU5DdFZtcVFYV2JPNVNXcjlLWEwrWmNENGtFNnVyMGF6bjdFek1L?=
 =?utf-8?B?OHoyVmd2YjRFSzVzdXZXYXZZTEdCUStlRU51bVE5dGFpOFh1TDNCVlVUSWlj?=
 =?utf-8?B?Q2lmODlvWTN5MmNDYk4rSkR6dytqcVZpT2pob0ZEazRSdjlwS24veUk5eHpX?=
 =?utf-8?B?OStVNXlMaGxFVk9jd1l4TjZYcVp2KytSTytWU3ordVppZGFwb0xySHhSVlNk?=
 =?utf-8?B?Vzd5Q04xUHBXZU5kdG9hWURXTllTbnVBRHp1cWU5Q1czWnJoM3VYRVl0SVZR?=
 =?utf-8?B?SWVwVkF0cHlOY29Ga2hnQ0FtampsYWNBRlV6bE4wcGphSEtUbm84SERJTTdG?=
 =?utf-8?B?cFE3SUZwSGJ2TjFlLzZIM2ZRVmVGcFpiWm5meW1xb2tiUjlpZWJ4WXd6MkR4?=
 =?utf-8?B?dmFubjNpTG5kV3F2djdoNUhpVkM3NnJwblIxMEdnY0s5YWtkQXJiMFZoVmdr?=
 =?utf-8?B?MHVlTFhTK2F4Vm9pWlZTbmlMakZWREJhRUw2aEVYbmJXRmZlUFdwK2wvZVVM?=
 =?utf-8?B?M1NYZHEyWTZ0ZnljQUw5dk5MUnpBRXo2eER5aFlnOTZ1Ty9EanRIbjRhUExR?=
 =?utf-8?B?VklxV3dPSysrMWo4eGwyaC9FdTJiVUVjenYybU9qWm9GYXliK04wbzdtZHM0?=
 =?utf-8?B?b2NEb3NNeE9NTHRHK2FNZnJYQUh0aytsNHljSVZIY1VzMVVPTlhUSlpWQTB6?=
 =?utf-8?B?VnkzQjdneGZxWDJsY1NvcDNRV2lyZHpNRDRBN2RXdmN4ZGdZY0ZjWmY5d2Nn?=
 =?utf-8?B?SzFFcUtLK21CU0l2dUtRamJoeHhhRHovd3FJVGF5WTdZdzdEcnV6eThkaTJL?=
 =?utf-8?B?NlhkeWd0ODY4Q0sxcEUwRnlBU3RZbGo2dXd2WWtyb1NjQ1J4czBkb2pwLzVo?=
 =?utf-8?B?bmlNcHFiNC9XZHBHUHdQVnUxblpNcG1TMnd0d282RFluYjdnRkhoWGpCem5m?=
 =?utf-8?B?djhBSWcxQjJnZEVtRzhPbXJRbTZuUm1YTlJ4SkFPMURlQnpUQnF6Y1FMYkNF?=
 =?utf-8?B?Rlc1b2trMFpSdm5UNGZwajhJREJmSzJkUnNCYlZFN2tKc1ZjZnRCR3VBVFBB?=
 =?utf-8?B?bmN2UUJrVFhubXUwTmR4bHVLMkxwSk4vZ0pKb1Y3cmk1dFVZVXNsYUk3VWpt?=
 =?utf-8?B?U2ZGeGc4enV3UlU2eitJMi9vM2RqTEc4V3laRWVnT2xwRVJlalNJcnJpOFBy?=
 =?utf-8?B?cW5iajdBc1ZhOG5YOUV3ZEZYd1lBU2FnUTlocEFlTmhBWjJmVW5BZ2N1eTVs?=
 =?utf-8?B?OU8zNU1ZWFdzUG96Vm5EaVpnRk9sWlBubG1mVHBjdndBN0RCVXJUWDJJbXJ0?=
 =?utf-8?B?dy9vckdzdVJFT29qVW8vSGxWR2laeEdoanYzWUhXdzJ4UDBZY0NhWXVCcWFq?=
 =?utf-8?B?dC9heWtsUkVCZ0VUUFZJL3Rma1ZmdXB4amRCN2UzdGlFaHdkVjBuTWI2WmFH?=
 =?utf-8?B?UUZoZGM4VlNQUDcwbUhuSnpRdW9Wck43dlhhbFoyRmM3ZDN3ZXFtYTd2aDJT?=
 =?utf-8?B?YWZjeEU1MHhod2krZ0NKZ3BlcitjMlRrdnN6c3JYS2dkdGsxVlQwR1RacTNX?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 447ecf2e-6b44-4171-904f-08dd4cca56e7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 07:36:48.4836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p08ZU1gB0uHJBeEhGdV5MfyMZkIpPiW8ZSWtRk6OhpJkJ/P1Gu5wm08BVkizTS0KZlCL9CGYoxyZkI0ghTDBCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8115
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

On 11-02-2025 02:41 pm, Kamil Konieczny wrote:
> Hi Swati,
> On 2025-02-10 at 16:26:46 +0530, Swati Sharma wrote:
>> 'Functionality' solely depends upon developer's interpretation and
>> 'Test category' is not used. Let's remove them from the kms tests
>> documentation so that documentation can be made precise which
>> is easy to maintain.
>>
> +cc Jari and Katarzyna
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
>
> One more thing is that such change should also update *json
> for example:
>
> grep Functionality tests/intel/*json
>
> tests/intel/i915_test_config.json: "Functionality": {
Change has been done only for KMS documentation.
> tests/intel/kms_test_config.json:  "Functionality": {
For KMS, this field is not "mandatory". So, no change required there.
If needed, I can remove.
> tests/intel/xe_test_config.json:   "Functionality": {
>
> Regards,
> Kamil
>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/chamelium/kms_chamelium_audio.c   |   5 -
>>   tests/chamelium/kms_chamelium_color.c   |   2 -
>>   tests/chamelium/kms_chamelium_edid.c    |  11 --
>>   tests/chamelium/kms_chamelium_frames.c  |  11 --
>>   tests/chamelium/kms_chamelium_hpd.c     |  26 -----
>>   tests/fbdev.c                           |   2 -
>>   tests/intel/i915_pipe_stress.c          |   3 -
>>   tests/intel/kms_big_fb.c                |  11 --
>>   tests/intel/kms_busy.c                  |   3 -
>>   tests/intel/kms_ccs.c                   |   4 -
>>   tests/intel/kms_cdclk.c                 |   2 -
>>   tests/intel/kms_dirtyfb.c               |   3 -
>>   tests/intel/kms_dp_linktrain_fallback.c |   2 -
>>   tests/intel/kms_draw_crc.c              |   2 -
>>   tests/intel/kms_dsc.c                   |   2 -
>>   tests/intel/kms_fb_coherency.c          |   2 -
>>   tests/intel/kms_fbcon_fbt.c             |   5 -
>>   tests/intel/kms_fence_pin_leak.c        |   2 -
>>   tests/intel/kms_flip_scaled_crc.c       |  12 --
>>   tests/intel/kms_flip_tiling.c           |   2 -
>>   tests/intel/kms_frontbuffer_tracking.c  | 147 ------------------------
>>   tests/intel/kms_joiner.c                |   2 -
>>   tests/intel/kms_legacy_colorkey.c       |   2 -
>>   tests/intel/kms_mmap_write_crc.c        |   2 -
>>   tests/intel/kms_pipe_b_c_ivb.c          |   2 -
>>   tests/intel/kms_pm_backlight.c          |   5 -
>>   tests/intel/kms_pm_dc.c                 |   8 --
>>   tests/intel/kms_pm_lpsp.c               |   2 -
>>   tests/intel/kms_pm_rpm.c                |  15 ---
>>   tests/intel/kms_psr.c                   |  33 ------
>>   tests/intel/kms_psr2_sf.c               |  25 ----
>>   tests/intel/kms_psr_stress_test.c       |   2 -
>>   tests/intel/kms_pwrite_crc.c            |   2 -
>>   tests/kms_3d.c                          |   2 -
>>   tests/kms_addfb_basic.c                 |  17 ---
>>   tests/kms_async_flips.c                 |   4 -
>>   tests/kms_atomic.c                      |   4 -
>>   tests/kms_atomic_interruptible.c        |   6 -
>>   tests/kms_atomic_transition.c           |   4 -
>>   tests/kms_bw.c                          |   2 -
>>   tests/kms_color.c                       |   2 -
>>   tests/kms_concurrent.c                  |   2 -
>>   tests/kms_content_protection.c          |   7 --
>>   tests/kms_cursor_crc.c                  |   5 -
>>   tests/kms_cursor_edge_walk.c            |   2 -
>>   tests/kms_cursor_legacy.c               |   2 -
>>   tests/kms_display_modes.c               |   3 -
>>   tests/kms_dither.c                      |   2 -
>>   tests/kms_dp_aux_dev.c                  |   2 -
>>   tests/kms_feature_discovery.c           |   7 --
>>   tests/kms_flip.c                        |  14 ---
>>   tests/kms_flip_event_leak.c             |   2 -
>>   tests/kms_force_connector_basic.c       |   3 -
>>   tests/kms_getfb.c                       |   4 -
>>   tests/kms_hdmi_inject.c                 |   3 -
>>   tests/kms_hdr.c                         |  10 --
>>   tests/kms_invalid_mode.c                |   2 -
>>   tests/kms_lease.c                       |   2 -
>>   tests/kms_multipipe_modeset.c           |   2 -
>>   tests/kms_panel_fitting.c               |   2 -
>>   tests/kms_pipe_crc_basic.c              |   5 -
>>   tests/kms_plane.c                       |   7 --
>>   tests/kms_plane_alpha_blend.c           |   2 -
>>   tests/kms_plane_cursor.c                |   2 -
>>   tests/kms_plane_lowres.c                |   3 -
>>   tests/kms_plane_multiple.c              |   3 -
>>   tests/kms_plane_scaling.c               |   6 -
>>   tests/kms_prop_blob.c                   |   2 -
>>   tests/kms_properties.c                  |   2 -
>>   tests/kms_rotation_crc.c                |   5 -
>>   tests/kms_scaling_modes.c               |   2 -
>>   tests/kms_selftest.c                    |   2 -
>>   tests/kms_sequence.c                    |   2 -
>>   tests/kms_setmode.c                     |   3 -
>>   tests/kms_sysfs_edid_timing.c           |   2 -
>>   tests/kms_tiled_display.c               |   3 -
>>   tests/kms_tv_load_detect.c              |   2 -
>>   tests/kms_vblank.c                      |  10 --
>>   tests/kms_vrr.c                         |   9 --
>>   tests/kms_writeback.c                   |   2 -
>>   tests/testdisplay.c                     |   2 -
>>   81 files changed, 552 deletions(-)
>>
> ...cut...
>

