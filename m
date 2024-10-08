Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2048DCED266
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 05:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2A810E45A;
	Tue,  8 Oct 2024 05:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FlAmVGQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468D410E45B
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 05:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728363637; x=1759899637;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VByBTmYA+hIfYcPw/jDehdxMcIZzHjCBEfnvdYx27n8=;
 b=FlAmVGQJiLyPRkAUky3fYy5EivLzTrpMfesP3mbI0L+u1Cl5Wv1jLTZG
 NplIpoqLURLaqmmDKo6NuCB+QpBGw93xQz+Wuh4O6Q3twcA0fcNvLPey2
 mXkAFW4r348zYRsvDSLKqPf5UubqgB9J9nYddsn4rlWOT9DfrZrhSPiB+
 ybj6tS04un8THVRSDEJrdM2iBhjArVfFa/0QO1yIWJoO3LAOuPr+i5zdD
 KUCbjQwtmGWH321eoDX7M9MmZ8FfkBF/WaN74czK9RhxF870z5Y9zHOm3
 CFbO4LQ8qzpngIWGkVGeYLuQ54e3nZ0D/2mnCkXzHJYp7uvSk97xpZbvL w==;
X-CSE-ConnectionGUID: L0OxaCmSQUCAETYDiqIPPw==
X-CSE-MsgGUID: IDgLQSAdT+WCd0ucfGP0Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27478263"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="27478263"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 22:00:36 -0700
X-CSE-ConnectionGUID: IqZtM86fQk2KNR0+o+7PZg==
X-CSE-MsgGUID: c/Xq9QdnRlabdxgALWp4LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="76541610"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 22:00:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 22:00:35 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 22:00:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 22:00:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 22:00:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1hA0hTBYG8SylW59wOiGK5+yML4EtPzUApRSyb7h/sC/nb5LgSONs3wN9D0JVxIiZvYeM/2/uEZUqD5+ZNGFuOtjWbPVb2t3yGej6blUL1Km3wwO7jSqHIrzBkzfETU+e9otIEiPYwxFkfQOZ5lOpedWPq1swYJi82C15i+LZDZpgv2xthmF3ZAv/SsgjsZqKhXnK+gxMJB9na3BPGPQvFheXOhgfoDGo31USFuen/TX8cs6q1+IJKmTVyk8Qwsukej7peo3/vyVX9s/a13rs2qV6Ebe3xSlPIQ9gAuYAzec8KSZHitNgUEPogjNC7AlbnZcUebPY2oFsdcwT7m2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nL8rxHG88bKNO4YrBdNOWogKRjJmzSuwObJO8mhTqYo=;
 b=sAvdybyzzPmX1z+P8+eyuvObLfVejmVIiWTH100VxQTYz0aAKeH7U+NuddLI/hqZPebtyAze+EhNkm7B78oqKTKSDgvTc5etvflhWO4hGdjOoECy9K0ds0+vi2zVTfojHiFk93fg6j4TyE4qm5Gaq2wl/VusR0i046KY9MnriSjxdJWKI/qHcyCZ8tT0z6HEWcBjffEPk4Pxeu1L6z8o27i/WI7Y5Hd16GQcjK162kIiKYdsAFNlcyAUhDSGP2L1rLfynXI9O2wspsjDIxLF6wk+W/G4m4s4weq2S/4hlyON1lAmoG0NUZ4xN5Jw9abzdyrjmXMYH84mopF7VXFXbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SA0PR11MB4702.namprd11.prod.outlook.com (2603:10b6:806:92::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.23; Tue, 8 Oct 2024 05:00:33 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 05:00:33 +0000
Message-ID: <26843f3b-2f59-4de5-aa98-5c69def61788@intel.com>
Date: Tue, 8 Oct 2024 10:30:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an
 assertion on MI_STORE execution time"
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
References: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
 <CY5PR11MB62119CD942646EABA7CA5D91957E2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <cc7c6fab-6310-438d-90aa-d7509f06192f@intel.com>
 <CY5PR11MB6211966D197F77629AC4C209957E2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <5f774c6f-e9bd-4c71-9606-bd2ff0117873@intel.com>
 <34395871-0f43-4ffd-8a1b-a077994dfcee@intel.com>
In-Reply-To: <34395871-0f43-4ffd-8a1b-a077994dfcee@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::20) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|SA0PR11MB4702:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b25052-65c7-4323-c6f0-08dce756236e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUZTUUl5UWljSzBoOWJEamVIRW5ORHQrS3BVN1VMWW41ZVJKVm1qK2wxMlY1?=
 =?utf-8?B?U2dVdkwrM2poakVpK3ZJZXhZMnRxak5ZYy9LUUR4VkFlRFBoTDhoQmtJWitX?=
 =?utf-8?B?SXJCenlrR29ycDRrSjZLRWJPbHBQWFdDMUtyWFBIa3pPUFJoN3VSamlxSzVk?=
 =?utf-8?B?aFRMbnA0VmxxVjNCODRLcGFRMGlCK3BLbE1wa2M4YWFwUEg0bGxnL2ZGaWh4?=
 =?utf-8?B?ajFYYklYbENaQnM4RHorWmk5Y0o4MEc2cnBmeWJONFhnNTNYRzZ2ZVhkUzVw?=
 =?utf-8?B?T1p6MGF1aEVWekNHRjBkQ0lIdTl4Qy9WOTdRcFFPQzFrNTQ5bU83cjJEUWsr?=
 =?utf-8?B?Nm95RU1jVWdqdmltczhMOTUzTWFXR1VhM010bWluM1ZsRXBIYzVKOHdhcXBo?=
 =?utf-8?B?ZTZodzhvb2F5SWYwK0RxWDNuSGpFUExQMGFSYjFYUi9PQ2dwK2g3YmZtUXVh?=
 =?utf-8?B?QWlzN1ZCaGJlcktHY3Q3b29TcVQvUEJseVdFZkhDL3RFTDg3dUl3aGRFdVZw?=
 =?utf-8?B?SHQwdkQvWmczb0VVRUN4U0hPSnp5djIralhwZmhqZzVIR212OVE4QzZ6M0xP?=
 =?utf-8?B?ZFRHK3F4cU1IYSsySGwydjNFTTFHN3QvcDdNSXk0V0c0cDVZR3ZMb3UvQmhO?=
 =?utf-8?B?cDVFWkJ6M0ovcHFqU050UTl0SFpucDFqVEhENmlTT0NKUmdWK0Jtc3FQVG1q?=
 =?utf-8?B?ckluRmZsazVaVEFsUWZsVnk3bk50K2RLTndXUzZiL1R2bDc5QUtzK3ZRZ0lr?=
 =?utf-8?B?aEZHNXdtbVdZQlVTdjBEbktCSU9UU0JYYXROOG9hTWFqU2I0WCs2ZlVQZk1w?=
 =?utf-8?B?UHc1a09KWHQwNWtOc3VrU2RUcmZpWVorNzdpVkNrMWVSTkZubDBoaExZZWpy?=
 =?utf-8?B?MTFQTVFhMUw4NkViOFMrdlAwdnpXS1lvVUlJRVRpaDNKaXY5cWk1dlRuTE5M?=
 =?utf-8?B?SC9QQndjcHc3UEF1UWI3YmowSHBZL2NUUnh0OUV5Z3NVelZ1aWdWa2ltbEkr?=
 =?utf-8?B?M0ZFc3BiOSsrYkFEREh1VlNoMmtabmRBREtKU0Y5TVhYL0J4aEI0SUl3TklB?=
 =?utf-8?B?UEErdlVoQjVmdkI0bHBlZldUL0gwSUxJYkJyaDlCS2JsQ09McWdCVmRjQjdy?=
 =?utf-8?B?cWYzV2ZDcTFraE9MZnNqMGUrWW44QzMrWVBEeVVwd0dSTmlLN1E4d0pXOFh0?=
 =?utf-8?B?YjZnYU1pWHZoRlB3UVVpQ05BMmRNSW9sTTRuQjZwOFpyM3kyUWRDZHo3NEtD?=
 =?utf-8?B?ekNlZHhxeW5oeFFVQU9uNEN0c0Z0alY1QytzSHYvTzB5RGdvYXkyV2hGVlVS?=
 =?utf-8?B?YUl0aEREc0s1MTBYQ3NzZTRBMUorcS9zZjBJNzVlblcxYW9zZXRudzlqRWdx?=
 =?utf-8?B?Ni9HN1dON0lHUnF6L3ZEaWNUd0FRdzNJZWk1c3VCRkpKQUY3b25ZUGFYVk9U?=
 =?utf-8?B?a1pHTVIwTCsxQ3hpNzdRR2VSaTBFTml1WFZHNEdEU09uWHJWSmw0WkV1VDI1?=
 =?utf-8?B?blJmQUZhYm5LTGRUZXVhZC9qU2djTkFyUktqRHZnU0VYdWVKUFJWdnpldzlj?=
 =?utf-8?B?NUhFaFNEK011Uk5WR1cvZnVUK2tGWnJqTmpmTGxUTTdRL3krMnZLTncyeTBP?=
 =?utf-8?Q?CYo0v4y3vgfFJNfdXs5B3qWNv3l6ffsjt3I4NCCfXN3Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUxZWXY4Vk5wQThiMysxMzBBZ0VVc2luSC85RXRCVlRnZEEvaWZ2ZEN1RVY0?=
 =?utf-8?B?WHJIMGQ2RHc1ZGdCbjQzSiszMFFCS3c3WVoxT2xZcE9RWjVtd2k5eTFWZFE0?=
 =?utf-8?B?SU9pMzBuSDRxNXJEaHQ0dGYzbVZGeklNOE9vVC9ja0hsVG1OR0UvZGRPNGRX?=
 =?utf-8?B?aVIwZlA4REI3NEtXb3VEWWtOMjI1OGZSRlU5ZjFQTit1NDR1bGxXV1pESFFC?=
 =?utf-8?B?YWdad0RlSEd2cnVPQi8zTTRza0ZsZkNyR2VRblBqbjhYYWZKdEgvM253Zi9U?=
 =?utf-8?B?YU94QlF2VnJRTysrdHFBLzN0dGtqekRIalgxOHVONXJtR2gzUmdDcEgyZmNY?=
 =?utf-8?B?OGJLTFhBMnVYT2FGeFlRbzdYQ0d6eldKUk9vQUxZeGFUSWZtUGhwM1FPZ1Rj?=
 =?utf-8?B?bHJGaGZpQlcyVERZdytremxwL0dIMDQrclNPekc3RWp5dkhVSjhUMDNwRzYv?=
 =?utf-8?B?MC84MWE1bjM2VlhkUjhGNXZXQmVSaFhHWVNEc3VwVURDRUFtUStuS3RlT2xs?=
 =?utf-8?B?eTRMRFk4bzJHc3gxZXBSblRpSmVYSUJpOXVmOUtxaXk4Znc4R1RCMU9wSXUr?=
 =?utf-8?B?TG9WT3dKbnhLdUw2UUJvM2ZEaEk2ZnhiTk51bUJ0ZzhvbEdpU0ZsT0krSmhx?=
 =?utf-8?B?RWZndDNjc0NrRmhLRzRwUzB1d2k3ZVJzakNJaG45QTJrS2M3ZHpWTFFCdFZB?=
 =?utf-8?B?dkxTTFJlakc3bDlEaHlVWXg5QUlUSTVwNFZwNWQ0aEVKSjBtL2pjOGdCQjB3?=
 =?utf-8?B?eXJtV21IMTl3RnJFMXI0dHM1OGtlMDZ1a3BoYVpPSm1lMmp1N0JaVDNhN3hu?=
 =?utf-8?B?b3dac3ArS2JKdkEvWldVWmw4M2dSNE5RSVl2OUNOKzZJV1M3cnNDTHZxaUpa?=
 =?utf-8?B?MmwxSDg1VFVUUHM0Rms3ZFNnNXI2amVZeWdtUnRxb3RnUXRWbms1T3lSWWly?=
 =?utf-8?B?T3I5STBET2VpbjVYbXVtK0ZWUlJEbTJFK0NPQWFFYjltRFFhbkRaSW5Dd0I1?=
 =?utf-8?B?Q1NHb2dKdnAwRHBtYzlVc0pGZW0wUzdUVXlyaW93N1phKzVLLzJtR005eG95?=
 =?utf-8?B?MmduUUZYaCtNOGY2M1ozS29qOXR2eW15VGRxSDdYK2lNMzYvNzAwanpUZmNM?=
 =?utf-8?B?bEx1Z1pPbzg2bWhUdndCKzFQaFZ0djJaeXlYQnlUQVpLZTU3Z2xYM3B2T25j?=
 =?utf-8?B?OGhDMWI1Vm9UL2dWd0h0NnZyOGtTUHBGemlOTGNCemRIaVMyaFRxQUlGRHc1?=
 =?utf-8?B?bFFNRC8rMmkrV2FQVXhBbFlCSy9weUZFWWwyNllkV2JvcXdqUEhFeUwyWFl3?=
 =?utf-8?B?c0VkL01vTWRLSDZvaCtLQWRVYWtoRlB5Y2FyRG01THcwUFo2OGFSNDNsR1cx?=
 =?utf-8?B?bm1FR0RMaE1BbkVIWHYwdFo0NDhoNExZdVFRVDdXNitrcEpRSG5EZVJoWUxz?=
 =?utf-8?B?U0pOeFJaOWxGNXQxV2szMys5dmxWVk44dG45aWFPbmxUUStFeU1NV2hObDlH?=
 =?utf-8?B?c282VzlpazNZWFJXVWd2b0xqMU5VM25hNFBIT01vazIzN3k2c3QvQjJqQ2Zn?=
 =?utf-8?B?dFlTRUxoVVRNY3BUMGxHRVRjVmdGbFVMT3Y3M2VGUjFOLys5a0xVaURJTlJp?=
 =?utf-8?B?enlOblFTb3BpeVozOC8zQ1U3QXlQMnJqcmlzMC9UM1VZYTFGaHAvN3ZaR3lk?=
 =?utf-8?B?WU9uZXk2SFdacU9oelZNYUtGekdJY3ZtY2taSmJPMDNsWitlTGVCQnpXUDli?=
 =?utf-8?B?YUd5U1ljRmFjaFB6Y1B0S09WVklQUUpCa1dEUk5WbmFsWFFxMjhwTUxlUGRF?=
 =?utf-8?B?NGN3VSs4WVpkRW45YVJ1a3hnNHdydmk1WGk1S08ydThydm5KWEVFVVJRWU13?=
 =?utf-8?B?VzZWZlFGQkpLYWxVcVpGdDNrL09ySG9xd3J1VlBmMHFRbGFtWDUveVFNOXhY?=
 =?utf-8?B?UmNkVDFoN2F6V3ZqMTJhTXM1Yy9HRm5CZHZNOUdyVW4zeFZKZnhvUkw3Tmt5?=
 =?utf-8?B?Rlg0Zkc3ZmtPZTdwbU5XaFdFQ1UxSDh5NmlEempFbXlReStsajVONkd0ZVZm?=
 =?utf-8?B?Q3hFZXNwODdObFd4YVBUZUZTNGl6QkxOcmxPRThQK1FLVXN1WWZmaTdmMmtu?=
 =?utf-8?B?M0NVZ1BkeTMwQjFLcWFRUUNROVJpY2ZJbXlLbVY5b2NVMkZJZTNxSEs4SStE?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b25052-65c7-4323-c6f0-08dce756236e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 05:00:33.0741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kieIBW/SK9iGt8JEDNQi5iKVPxzXPyvsVXd0LACVTZZ1RbvMSfXg69r9hKlpYmJWgY3pcA2q91NcUr1/VdPo4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4702
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


On 08-10-2024 10:17, Poosa, Karthik wrote:
>
> On 08-10-2024 09:17, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 08-10-2024 08:52, Gupta, Anshuman wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>>>> Sent: Tuesday, October 8, 2024 8:44 AM
>>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; igt-
>>>> dev@lists.freedesktop.org
>>>> Cc: Brost, Matthew <matthew.brost@intel.com>; Nilawar, Badal
>>>> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; 
>>>> Poosa,
>>>> Karthik <karthik.poosa@intel.com>
>>>> Subject: Re: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: 
>>>> Add an
>>>> assertion on MI_STORE execution time"
>>>>
>>>>
>>>>
>>>> On 08-10-2024 07:31, Gupta, Anshuman wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>>>>>> Sent: Monday, October 7, 2024 10:54 PM
>>>>>> To: igt-dev@lists.freedesktop.org
>>>>>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
>>>>>> Matthew <matthew.brost@intel.com>; Nilawar, Badal
>>>>>> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>;
>>>>>> Gupta, Anshuman <anshuman.gupta@intel.com>; Poosa, Karthik
>>>>>> <karthik.poosa@intel.com>
>>>>>> Subject: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add
>>>>>> an assertion on MI_STORE execution time"
>>>>>>
>>>>>> The reported time does not reflect the completion time of
>>>>>> MI_STORE_DWORD; instead, it accounts for the delay in the scheduler.
>>>>>> Therefore, it represents the time taken between xe_exec and 
>>>>>> syncobj_wait.
>>>>>    igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>>>>> elapsed = igt_nsec_elapsed(&tv); elapsed is taken right after the
>>>>> syncobj_wait() therefore it represent the time taken by xe_exec +
>>>> syncobj_wait, total time taken for completion of job.
>>>>> Thanks,
>>>>> Anshuman.
>>>>
>>>>
>>>> That's true, while writing "time taken between xe_exec and 
>>>> syncobj_wait"
>>>> , I meant to convey in between start of xe_exec and syncobj_wait 
>>>> completion.
>>>> Will rephrase commit message before pushing.
>>> Why do we want to remove assertion ? We don't want to write IGT to 
>>> make CI happy it is to catch the bugs in KMD. Even in this case as 
>>> well this is a bug from Linux Kernel.
>>> I don't agree with removal of assertion.
>>
>> Few issues with this assertion.
>>
>> 1) IGT has --inactivity-timeout of 90 sec, which means you will not 
>> hit this assertion ever and SIGQUIT will be called if time between 
>> start of xe_exec and syncobj completion is ~0.9 sec.
>>
>> 2) Even 0.9 sec of delay is something huge for kernel. So why IGT 
>> assumes anything less than 1.2 sec is safe. Isn't it just to make 99% 
>> of idle time safe.
>>
>> This assertion solves no purpose, if IGT silently passes for anything 
>> less than 1.2 sec, assume 1.1sec (Isn't it huge delay for wq 
>> submission).
>
> This was added to assert on per-test timeout which can occur even 
> without inactivity timeout.
>
> See: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2484
>
> You can reduce it to assert on inactivity also.

2. Also, with this assert, we get below print in log to know submission 
and execution times taken, which would help in debug.

                 igt_debug("Execution took %.3fms (submit %.1fus, wait 
%.1fus)\n",
                           1e-6 * elapsed,
                           1e-3 * submit,
                           1e-3 * (elapsed - submit));

As this issue was sporadic and seen only on upstream CI, having this 
assert helps to know why timeout occurred.

So I'd suggest to keep the assert.


>>
>>
>> BR
>> Himal
>>
>>
>>> Thanks,
>>> Anshuman.
>>>>
>>>> Thanks for pointing this.
>>>>
>>>> Himal
>>>>
>>>>
>>>>>>
>>>>>> This reverts commit 92825ed72be61c5419d95db944fef1c9dda2215a.
>>>>>>
>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>>>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>>>>> Cc: Karthik Poosa <karthik.poosa@intel.com>
>>>>>> Signed-off-by: Himal Prasad Ghimiray
>>>>>> <himal.prasad.ghimiray@intel.com>
>>>>>> ---
>>>>>>    tests/intel/xe_pm_residency.c | 9 ---------
>>>>>>    1 file changed, 9 deletions(-)
>>>>>>
>>>>>> diff --git a/tests/intel/xe_pm_residency.c
>>>>>> b/tests/intel/xe_pm_residency.c index 772fe9b57..f4d05889c 100644
>>>>>> --- a/tests/intel/xe_pm_residency.c
>>>>>> +++ b/tests/intel/xe_pm_residency.c
>>>>>> @@ -144,15 +144,6 @@ static void exec_load(int fd, struct
>>>>>> drm_xe_engine_class_instance *hwe, unsigned
>>>>>>                  1e-3 * submit,
>>>>>>                  1e-3 * (elapsed - submit));
>>>>>>
>>>>>> -        /*
>>>>>> -         * MI_STORE_DWORD generally completes within couple of
>>>>>> ms.
>>>>>> -         * Assert if it takes more than 1.2 seconds, as it will 
>>>>>> cause
>>>>>> -         * IGT test to timeout due to sleep of 120 seconds which is
>>>>>> -         * the current per test timeout. Currently there is no 
>>>>>> way to
>>>>>> -         * read this timeout from IGT test.
>>>>>> -         */
>>>>>> -        igt_assert((uint64_t)elapsed < (uint64_t)(1.2 *
>>>>>> NSEC_PER_SEC));
>>>>>> -
>>>>>>            syncobj_reset(fd, &syncobj, 1);
>>>>>>
>>>>>>            /*
>>>>>> -- 
>>>>>> 2.34.1
>>>>>
>>>
>>
