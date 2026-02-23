Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DA0E98DFF
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 09:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E72110E2C0;
	Mon, 23 Feb 2026 09:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdZDYGxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490A010E2C0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771839471; x=1803375471;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pNyXcVI5c/K+09PADjCXQm45Jv/4qDmPujaUTyfpjj0=;
 b=cdZDYGxsIRxnvUgFXHTN9YwjelgE67eBrz961WR6UYw7cFXaBfaVZzC+
 txdR0wXlzks8yzgFzme75QaWMXwV8LEyxJk2xSHV4SwePNx3esKIvvpDY
 Nh4gfdbMWdDo0PPS/wp5J0fFAdlbJmr3Yw683M8qHG4nYT+/qukYAsVai
 XAC1VmYS5GUNNp9Vrh1a852obHyNBRcQ8DaqHYGiV2ZdGjj0Ua2tT53FY
 SxysqWyHS8IRDJtonMJJ9adUDFOsVFiD1HVf3FfTGEsD8A8iw/jdQC9aE
 Y4TiBVWv9+eCeM1BPrv3oerL9fJod2CkKPf3UXlXvK3SpqIxVONeOlayD A==;
X-CSE-ConnectionGUID: FIId5BqMRGisuiR5t6EUHg==
X-CSE-MsgGUID: c5TDsRslTXCoJX/TpaYtCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="83146375"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="83146375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:37:50 -0800
X-CSE-ConnectionGUID: XxhKzJhrQwiz8gFe67baEA==
X-CSE-MsgGUID: /slotJYBRuihylqTZjzfMQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:37:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 01:37:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 01:37:50 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 01:37:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytdQv1k8Qq4ysGI2/M33JXg2q3yuG3dgQW5x1JHklOXfMa8SO3RMboftZZUwz4ReSHKfqAnQiWCAtiCLIGraeQ8eQqYbRcGi8mB/I3R/WLNTzNchrbYoR/qFD30yF0im0aCmZlp6Ra5ZGiaxHoX74CVO2pBoYmOITuU8eyJ8dVAGOpKIRDZCQ4QEFi1C/6QwzXL+4VPXEUafPce78h0PL1Bfn7UDfB/MWD2i/I1T1rDo4fg5yY80s3w8EMW//LY1TWkLYqaLxBD1JFCxicwbIQDJ+F9Jg2ABVKlqomO7YEY/6kj1WRAd+mKQtoUqr3J5QP4daVMyV+jiCQxVkKPF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrOuE8tkvMHFTyi3BSau4yAy7H8XS4NrFC6VP/wYDh0=;
 b=Fga3ZaWWaV2nqZCypzk8a/vyNqbcW+wR017Qa/RdIDhlH5QM9AGO6itbI4l69uDn4daMRUuoKZkcyQtKdkD4Q0NkV5pwGxDWBaSSjElaaj/9xbUSbp5UAsxD0MllNxrkPwRhc/gfaE8gSqvmedD0Fu/SsKpAbRrLCt7t/kEUBxYLdi6Ekz9Vz5TQTaDm+HEn7ciSYNuukqqf6ehW33VDyk3F3s2X/oFzP9QJ6yUmZkprx66pvDaQzZWPYOgudgRKbKn9WWIwPOLLfkSn6zYgDkxUVD0Jta8mr60EHtlCq7EaMaRK2tzEkHlBySZjRW7OcyG/rN1QrEg0rv7B0+pubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by MW4PR11MB6713.namprd11.prod.outlook.com (2603:10b6:303:1e8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 09:37:47 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 09:37:47 +0000
Message-ID: <42956771-7298-4bff-b170-d4858722d1cd@intel.com>
Date: Mon, 23 Feb 2026 15:07:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 4/8] tests/intel/xe_madvise: Add
 dontneed-after-mmap subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, "Gurram, Pravalika"
 <pravalika.gurram@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-5-arvind.yadav@intel.com>
 <BL1PR11MB5525815CFC7A3B5CE8F07CB58477A@BL1PR11MB5525.namprd11.prod.outlook.com>
 <3c923dd6-26c0-427c-bb6f-1941e1bca6a4@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <3c923dd6-26c0-427c-bb6f-1941e1bca6a4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::8) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|MW4PR11MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: d92d2974-feee-4d8e-1a83-08de72bf33de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkwzaXlsUkIrc2VPN05mTWpTenlCcTA0TnpvYVkrZ0p6RXNyQSszYlJVR3Fq?=
 =?utf-8?B?b2xXYnZTc3dUb2U4V0V6VUg3dERqcEgrbjZIMHIwU2hBa3VKU3QwMnBqMTNq?=
 =?utf-8?B?aElJWitPTUd6SkJBOE5TRXVTNDVCeEJPczcrZktoTW5rOGUveDhuTlcvc0Nq?=
 =?utf-8?B?eUlMT1pVV3JxWnNyUEJVKzJQUUwzSmpSd0FqYnlzT3B6TkNMWE5aTHRsbjFG?=
 =?utf-8?B?RTlrYW82R21UQmVoWnhyb2xFQlg1dzEwMmRLQXNyKzJyR253TEs2SWNIOHlo?=
 =?utf-8?B?QXhaWnhZNVBpdlBKYVhGVmZKeHdCL3BIYmRQc1RYRTJCNnR4L0VBYm9NOXN5?=
 =?utf-8?B?L1BscEplcnlmdDBEaUlMcGJGNmcvZEhMUjk4eWZieWpHZ2NjNzFvMGFMbVMv?=
 =?utf-8?B?Si9Yclovd1g3SmZpcWo1MmQ2ZjlaaVpxUmk0c3hRWmh0Y2FxNzNtSWVzcXJC?=
 =?utf-8?B?TjdRSnUwUUVaU01acFkzQzJ2VFZLZWJETUJ0M2drMmcvV1ZvQ1FiN21YK01p?=
 =?utf-8?B?YzBySytTZXdXeHNmcUZjOXhnQ2hLUkxIOEJkK2xJeWdRUFU0SVpFeEc3Z0Ez?=
 =?utf-8?B?Vm9CaFM4dkcxWHRsZkZTc0JDL1NCNktGM1kwUUJBZVJsQStBN2hSaEwrdENi?=
 =?utf-8?B?STZPcWtmMlpmdlU3Qkd1VDhNVE5aOEJNenNVMjE2aG5VSWw5RmphN1o2WjVN?=
 =?utf-8?B?cE1pSFd3SnNSb3JBeWJPa1VvbERpeS84V01TR2xGOW5LZm10M3RmeVA2Z3V4?=
 =?utf-8?B?NmlMU2RGNFZldU43TmtydXVkblNtK1lteWE2aDdyUStUL0hzZU5KMWZXZDEx?=
 =?utf-8?B?WjVKcDJ3TURpQlliQTJiV1BrbGhEdnJpelZ5Q2VMOTRJbS9YZDNLd2tkKytN?=
 =?utf-8?B?alhMRFZ6RWVNa0laSU1NYXJlRCtWTDZ1NEZnRFJ3REIvckttZjRpamowREJS?=
 =?utf-8?B?R3lOMWI5TGFzNFYvUmdWQ0xqQ0d4NEV0enc4V0RIMmFSeFRHa0Vyak1xMjM1?=
 =?utf-8?B?RzR1RU1tSFBCNCt4QUhocEdVSTNXRE9od2tCejdQQTExeWtvS1RxWlJhd2hQ?=
 =?utf-8?B?QitCc0ZZNGppMk9wU2ppRVFWMHBaUm52NjBCQkRGNTRLRGZBNDk5djNYckQ5?=
 =?utf-8?B?cytaRmhzZUJGb2NXbjY1cy9JUmN0YVE3bXBRbW00cEVycVJsQ01VeXk1Q25Q?=
 =?utf-8?B?WWNVa2kxS1EwN05hNjcxNU04RHM3eHZKQ1FucHEwbE01Z0RqNTdjeUtzM2lk?=
 =?utf-8?B?YmkxM0VqM3FkejdHY1ZKalRNTUZ5ZDNBSnUzczZML0xRcEY0c1dlZ2RrRThJ?=
 =?utf-8?B?YXpTWmpkeUhyT0h6MUZjRjRzMjNLR2xMTlVvUFo5SEhkVHJDZUlTUm1aTlFl?=
 =?utf-8?B?Tm8vYVM3WDJESDgzcE04TjBrUWx1ZTBtTWRUSW5Ib0l6d3A2NllHYWNWdXhp?=
 =?utf-8?B?aVRWdHZyOFl2RnNTOEt1L2tDN3hFSTIwTVFwUjh6S3hoSVhHM1E0aEJKb05R?=
 =?utf-8?B?M1VFeFlmVE9xUSs4aEhXeTBVNisya2hCU01MaHEyNk9aWVV5WXgxRjNMdU5s?=
 =?utf-8?B?YzMrdDhuV3hpWEpFWWlUdytBUjNCeUhWNWpHL2hDSTlTcC96QXpFc3Blazdv?=
 =?utf-8?B?d0l1UC9tbjlFR0d1TnU4MXV6dWp3Tm5vbkorMndCUzZIeXZSWXJrR29lTWJm?=
 =?utf-8?B?MjZaTS83WDUxcVBSTENyYVJIdWgyQUZNak5VWUJYSDdNWk9WVkYrUjdZdDJV?=
 =?utf-8?B?S3YwUmtNNHJCNlZMYnRUdjAwckZJa29GeWRBd3F2ZEJsbnYrWWZiYTlGNm9V?=
 =?utf-8?B?d2hDZURFZHhWdG9ySndVWDA1WVRBQU1LR0JvU21mK0sySkdCR3hSWm54L0I3?=
 =?utf-8?B?MUl3Z1h6bDVkaTc4YVYvVFRYbFhjUUdNaENHMkYrS1JrUDFIMmZTWGFhOFdI?=
 =?utf-8?B?ME5JdUVOUitVNzdVYldlaWhTTVdhMVRZc0RnN0Y2QWgyV0hkRjk0UDZYdVN4?=
 =?utf-8?B?ZFRVS0E5Qk1Dand5ZWlXb3lXRXplVUNqN3JrbzJxU0FZL21tNVJGY1oyTU1B?=
 =?utf-8?B?djhsZkd6MHBPaEJKb2p2cjVjVEVTWkZyVDd3NTZocFE0V2JBL3k4RTdLSUtq?=
 =?utf-8?Q?ajQ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjY2UUxicTJVV216RmFmR2F2cEhDL1dWTDNZSGVMN1MzTTF4QndmVUlEQ2hM?=
 =?utf-8?B?NDB1WjFrdlBzTmZrb1JBNXJiMTh2VFZ6NHZLZTB1OUpqYVVtU0hEY2Y4eXNo?=
 =?utf-8?B?SURtc3pBek5Ib1I0eDhIZkZDaTNGTGpBVWZTczF6MmpBeFlzRXlmM1hOTk16?=
 =?utf-8?B?dVYrK1pTRDFsRlZGK2VhYjBzUEF6QVhmQkZNYUc2MnlwRTZrS1RQRTNWcHhx?=
 =?utf-8?B?T3h3RkwyU2U1ajdRTm1YZjhMbE1RZytMNkROS1FzeVNsUUpDVlBQWmlETFVK?=
 =?utf-8?B?ZnlEOU83TWlSUlBJcXhOREpXVlIxVGJTeWs5RjUyRHNiNHZvNFBUQzh5UVBT?=
 =?utf-8?B?cXVvSFdrL21MK1JjWExlQjA1T1F2QURpdDNMVm1IR3hSWVhHbE5oRHJkSkhW?=
 =?utf-8?B?TVlXdnRHWndEMmVTUHFUUzZVQlRIWm5qdk1pMVNBUUFzL3Z0ZDk2WTlUUkZv?=
 =?utf-8?B?WnJJWVNUdlR2cENKcU5FOW1YejdEMGx0Zk1sT09FZHZDUEhJV3J4VW5SM3Fp?=
 =?utf-8?B?YnoxR1QvZzJVc0NVVmVpemZSOVNtdHdEelBWSkQyb1lOaUJ2dUtZSVFEV3FW?=
 =?utf-8?B?R2pEcjJTRnNlbVhvbkl0ZXJxSEtEU0ZuK09xWCs1dnBiVGlPeGx6d2I0T0tq?=
 =?utf-8?B?aFZUb3gyNVBaR1g1ZC95aGUybUd1Mk5WRnBlNlg2T2dRV2Y1Q09QU2ZzWk1O?=
 =?utf-8?B?TkluUHNQYnpNQ0JYekxTTHRSZ2ZvZldGclVENERZekoyZ2UrZ2EvNFQ5Ujg5?=
 =?utf-8?B?bHJkRElHQ2htUmdPYk92NCtTenlNZ1VhSGhFTnVkVXhVdUFCYjRIMTJCOVp6?=
 =?utf-8?B?dzhZL25MYm1qalNETmhWcGdqVDRsRThDQnNXS0FmcjJFRlZOMDVvN0FBNU5V?=
 =?utf-8?B?THNDQXFYNE5LeXo1TmNpaGJ5MGtLTWR5KzF2cjc5RTB0ci9FcnB4KzBFcEhV?=
 =?utf-8?B?eGxxUy93QlA5NUIvUENRTE50cC9KRjd3YWhLNFZIZUdwZGJ0UXYxcno2NFRa?=
 =?utf-8?B?cThmajZZUThsUEZpcnovNll2aUZHY2JEeDRXWkJPQ0hPUGNxa2JqNlQ5dmlo?=
 =?utf-8?B?cVNLbU5iSWYvVER5S0RDNU1NSWl5dG1GL2FqZktxN2FMMGFnem9uQ2o1TTRm?=
 =?utf-8?B?TVhrRXFEQVB3R1hHeTk3cGhXUjFhSXF0SFF4WVg1bWpDamQvMjhzM2dBMkhJ?=
 =?utf-8?B?eVNwKzh1VkpjVXoySktHQjhBejVYRHN1YjBvczA5T1BITklJN3B2clByaTJq?=
 =?utf-8?B?Tk5OdjJqVUMzRjFzaXgxQ2JJSTJVTVE0VHF6ZGJERVlPZDFMejVWMHNtTVVp?=
 =?utf-8?B?V2RwcVhtV0NIMUVLRnV0TFg4MlhoK2lzQnkzVnQxSDduWWlPcGFaSGNTcFJu?=
 =?utf-8?B?YW9OWHlsT1BoR0ZFVjVxbmJXMjRNV2FOMlRGWGdZRDhxVGpSU1c1Z21lZW1S?=
 =?utf-8?B?Nkk3ZFJ2UTNlY1hpeW0vK3p4a212TytmT2xGVFBLeHVRMWZjdlF0RjlFSis5?=
 =?utf-8?B?V3B4STEyMVQ1d1h3cGVKQUF3MkN2U2FkOXVLMzRpNW9sNFBhKzVWWUd4Wm5k?=
 =?utf-8?B?em9EL3BHSGNxdDZVMG5lR0xEWGpIYjd5c2ZxK2d5aDNkai9BTUc4YkJtbWU5?=
 =?utf-8?B?WkUxUW9NWCtoZWxDZDZjYlVrb0ZJc0U4V1RZMkpqS2pZWlFxOTRJTVB4TkNR?=
 =?utf-8?B?emo5OS9mbndxcVU3N0FzaVc5WjNzQm1hQWZvdUtsdGlDeVRGM3ZFcGVxaEp6?=
 =?utf-8?B?WUJjQUwrK1lNZjhjcUJ3cGpOQkRiYVZSOVd0cjZVUzVXbFlWeVp4Y2pFVVZ5?=
 =?utf-8?B?L2tDaURyaW43cGJXdm1kRFlFQXAzb3FoV0llRGN3WmhheXppdEN4ZUI5eGxQ?=
 =?utf-8?B?czBoT1d4MG1NVnY4WjFPWVBBU29jRS8yMmJKbHMxT3ZIMzdrdEdUUXFSOGVz?=
 =?utf-8?B?QVJnamF0QWFGRUdyckU3SU9JQWFRVnFSRDRkZXRrbDE4VmJBQTNKNnhBaXUy?=
 =?utf-8?B?UEFHQjhYODVkOEdaSElvekNZOURlc09Bc3V2b1FXOThYUmJLdU9hemRQZG1Z?=
 =?utf-8?B?K2dMc3l2K2M3dnRiSkQwc1RES0ZFVFEwQzZqZ3FFdHc1MERIMm4rWkNHOHl5?=
 =?utf-8?B?V1RxTmpDL1ZHdVR2OER1bms5eXJKR2tPaVVzTmFaVncwQjh6OERRUTFhY3d4?=
 =?utf-8?B?dy9zTi96TVlXR2JZWVVBSWVtY1hlbWJQclgwUFVpSjUyYmFtbC9lR29DV2gr?=
 =?utf-8?B?eTdCSkR2WlZQMmJsVFdIUUd4UmZLbTVWNFJORytmSktaSjMwWXFrTjAwbXN2?=
 =?utf-8?B?b1grYncvYm5xN3RiUWJycVQvOVFnc2xDWnJXUDI1RHU5YS9VSGxEZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d92d2974-feee-4d8e-1a83-08de72bf33de
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:37:47.4702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: de9itAamRJsLeY/L7pii3oi7xqWnAuRdrGKdrK7UfBDRkAVJXm+wd/vDWJuzLHTh5+dpZV39+Z8a/g6QmiKL7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6713
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


On 23-02-2026 11:22, Sharma, Nishit wrote:
>
> On 2/23/2026 10:40 AM, Gurram, Pravalika wrote:
>>
>>> -----Original Message-----
>>> From: Yadav, Arvind <arvind.yadav@intel.com>
>>> Sent: Tuesday, 17 February, 2026 08:04 AM
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>>> <pravalika.gurram@intel.com>
>>> Subject: [PATCH i-g-t v3 4/8] tests/intel/xe_madvise: Add 
>>> dontneed-after-
>>> mmap subtest
>>>
>>> This test verifies that an existing mmap becomes invalid after the 
>>> BO is marked
>>> as purgeable and purged. The test creates a BO, maps it, writes 
>>> data, then
>>> marks it DONTNEED and triggers memory pressure.
>>> Accessing the previously valid mapping should now trigger SIGBUS or 
>>> SIGSEGV,
>>> confirming that existing mappings are correctly invalidated when the 
>>> backing
>>> store is purged.
>>>
>>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>> ---
>>>   tests/intel/xe_madvise.c | 54
>>> ++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 54 insertions(+)
>>>
>>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c index
>>> 7dbe70f42..5c6a24553 100644
>>> --- a/tests/intel/xe_madvise.c
>>> +++ b/tests/intel/xe_madvise.c
>>> @@ -196,6 +196,54 @@ static void test_dontneed_before_mmap(int fd,
>>> struct drm_xe_engine_class_instanc
>>>       xe_vm_destroy(fd, vm);
>>>   }
>>>
>>> +/**
>>> + * SUBTEST: dontneed-after-mmap
>>> + * Description: Mark BO as DONTNEED after mmap, verify SIGBUS on
>>> +accessing purged mapping
>>> + * Test category: functionality test
>>> + */
>>> +static void test_dontneed_after_mmap(int fd, struct
>>> +drm_xe_engine_class_instance *hwe) {
>>> +    uint32_t bo, vm;
>>> +    uint64_t addr = PURGEABLE_ADDR;
>>> +    size_t bo_size = PURGEABLE_BO_SIZE;
>>> +    void *map;
>>> +
>>> +    purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, true);
>>> +
>>> +    map = xe_bo_map(fd, bo, bo_size);
>>> +    memset(map, 0xAB, bo_size);
>>> +
>>> +    if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
>>> +        igt_skip("Unable to induce purge on this platform/config");
> Same comment as in [Patch- 3/8]


Noted,

>>> +
>>> +    /* Access purged mapping - should trigger SIGBUS/SIGSEGV */
>>> +    {
>>> +        sighandler_t old_sigsegv, old_sigbus;
>>> +        char *ptr = (char *)map;
>>> +        int sig;
>>> +
>>> +        old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
>>> +        old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
>>> +
>>> +        sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
>>> +        if (sig == SIGBUS || sig == SIGSEGV) {
>>> +            /* Expected - purged mapping access failed */
>>> +        } else if (sig == 0) {
>>> +            *ptr = 0;
>>> +            igt_assert_f(false, "Access to purged mapping should
>>> trigger signal\n");
>>> +        } else {
>>> +            igt_assert_f(false, "unexpected signal %d\n", sig);
>>> +        }
> same comment as in [Patch-3/8]


Noted,

Thanks,
Arvind

>>> +
>>> +        signal(SIGBUS, old_sigbus);
>>> +        signal(SIGSEGV, old_sigsegv);
>>> +    }
>>> +
>>> +    munmap(map, bo_size);
>>> +    gem_close(fd, bo);
>>> +    xe_vm_destroy(fd, vm);
>>> +}
>>> +
>> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
>>>   int igt_main()
>>>   {
>>>       struct drm_xe_engine_class_instance *hwe; @@ -212,6 +260,12 @@
>>> int igt_main()
>>>               break;
>>>           }
>>>
>>> +    igt_subtest("dontneed-after-mmap")
>>> +        xe_for_each_engine(fd, hwe) {
>>> +            test_dontneed_after_mmap(fd, hwe);
>>> +            break;
>>> +        }
>>> +
>>>       igt_fixture() {
>>>           xe_device_put(fd);
>>>           drm_close_driver(fd);
>>> -- 
>>> 2.43.0
