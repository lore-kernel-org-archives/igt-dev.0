Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58764D43357
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 21:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB5010E300;
	Thu, 11 Dec 2025 21:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GXT7LON7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECD110E300
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 21:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765488909; x=1797024909;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=56AD5Oj38I8E6gTy1w4IRwX79JW39csaX3rJppyTCAs=;
 b=GXT7LON7C+R0xu7UoKYuCMrMNUq5/9L8tlFAEJPMoEPjYsfpP8ET9W1R
 BItOfAUEdzAT23UnonH3rzFwd+7mCRcyIY2qYVrzIO5KbP/FYxkwHydhO
 uDwPTUmI5q3z+1vY2kVcsAlcHOK/MCwks1SqtmUo/G2crUheSlpeyXkUv
 lJFNvaTCykhPPo9bw8L7lG3dALX/Ak5xiIkOmgx52WaBb+vOdgOMdgJdl
 95UHm7FQbrXRV/N6ipVdv7taLUIFSj/eIy2mdBqfS4dljeZ9HB5LWyk7Z
 1DJTjWpEaAiDFtuuW81kNlN0iXWtT8Ndn5ue+Bhh8clRy+uFjBpZGZGWD A==;
X-CSE-ConnectionGUID: 9V7SdcjISPmZs+aaPJQ5YQ==
X-CSE-MsgGUID: LhFSGotMQvqEmdqbz2BryA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67367283"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67367283"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:35:08 -0800
X-CSE-ConnectionGUID: LSCAZ8BDRPmNrcEeuNRhWQ==
X-CSE-MsgGUID: KxcYxM7mRpy+3NArTDnjwA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:35:08 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 13:35:08 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 13:35:08 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 13:35:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mb/jS3EayViTSgQaTN+wsUfIx73TplG8XFF9rVl1dMJbKwGx26cjIncwihOpGcK+3czhVqaueNYBi+cU5xRqBdi+yX2VNYRpFWtK4Z82CpbIkBS5cLI6cA3BTD11M1+DQyF1T97xWjE5u/cdsXNzjBhr1t89FVrAaq3pQLmOVotAUCagGOyDyHXEMdNMJmj/nmmHsgfV1o5wNqnFcy2UcoWLKOwVIN7CaItPyKd00P/bhnTnUuAD0xgX3KEuTfuMIA7JPK//LD8DV6Ccpgb3Z0uMSDKRctW87R/a1tB+CATe3+D+c63fuFmUS8TKkA9qtKIgIA5dOyOTb7Jx9hmbkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Rtm3L7jl/XjBiyIvJh4/4rINmMINATz+MsTkFMTiNc=;
 b=zT4sk3MUrX2ShpcjcCHgzMr1kLbZYLQoQoB0yf+pJ2nXgfmUR2SUGUi+WLb/TCUxHeTd98+9e5o/Hmc+nA3hwltt9gI1pPhPjq+1t0+86Wyv/sDhiOjqQPm2uJC7bERYmc9lxwIhb9El9TCZBNJsAC01/3Bbj4FsoHUlJSvKWIEzGjgeNaPK+Sw0rv7U51O36cwZ1yuUy+pwfyCSmzFd7na7gfMhnA/DTshgKLdQ05O6bgDfWmnY5dvW8EceCJ2nYdnILuyM13KDevRMbreTrBsNY5umuU3bTo9+hHCYb0t42WoTU01QdHW+thH9y7q1ktSec2fQuiEtwWEBSZXUMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 21:35:05 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%6]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 21:35:05 +0000
Message-ID: <38eb811e-fc44-45f0-8b55-788bb3621ecd@intel.com>
Date: Thu, 11 Dec 2025 13:35:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/xe/xe_spin: Introduce xe_spin_reset
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <kamil.konieczny@intel.com>
References: <20251104055129.3826274-1-soham.purkait@intel.com>
 <20251104055129.3826274-2-soham.purkait@intel.com>
Content-Language: en-US
From: Harish Chegondi <harish.chegondi@intel.com>
In-Reply-To: <20251104055129.3826274-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|CH3PR11MB8701:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5d1666-2755-4811-c9dd-08de38fd2657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlQ2YVp2VG9ZSHRmeXlWQ1VpK2NMN05FZmc5YWxvcGNhWjRHb0VzMEdQRDFl?=
 =?utf-8?B?TWw5V0lnMFhrTDEzNU1WVU9JWkZiRVk4TExPMlZPT1ZjaW5HZjhpRHlZdHlC?=
 =?utf-8?B?WmFQaXFzWHR0TWdka2k2b3F4bk1FbnBDT3dSQWl3NEExcXVJSkQveTJBc2t6?=
 =?utf-8?B?TW00enNCYU9GZDB3VVh6bllHa3FIZGpnR0ZOcEdPdEc0NmZDc3g5SGhreTVv?=
 =?utf-8?B?ajgwb2pCSGRiRzdCaGIrdm1PMnpNMjFFSzdIYnM1bDBwcTB5cVVSUTk4bVRk?=
 =?utf-8?B?TFl6cndNRzNaSjRXWGlNQzY1anBqL2N5ZFFVdzg2ZU0rb2Naa1Z3YzZlcXBy?=
 =?utf-8?B?NnVoN2xsR21TUjB3enY0SGlrVTVIdXhOcSs0MFJiWEpqenVWbzBUemU0SG13?=
 =?utf-8?B?R2pxWVhYaGtSZDFBM0pOVG8yaXZ3VE50K1JuZ3JyRytDQkhkdjBmY2lUZ0g5?=
 =?utf-8?B?bVcrM3pEMHBDT3cyTG9HYWp3ajZCQkVzU1YwZFZZUzY0VWFRSGdaSEJmdG9m?=
 =?utf-8?B?NjljRzdmRlRuemtzQVpkM0M3VXJOQU1HeU9hWjdKaXNmZm9qeVEvc2dvdXN3?=
 =?utf-8?B?ZFFVYmZPbW01US9FUTlTbDhsTzdHbUJna1dDbEczWUNVLy9IZ1d5RUhvNWk4?=
 =?utf-8?B?NGlmcnU3b0cvWm1nTjZIOWNYTk10a0VGSlhKR2RtbngrWWFDaXV1RlkrZ0lh?=
 =?utf-8?B?WUNWQVNDbXpRcjdEbDg2NmZLVEZtSzRoZkZLS295dk15MUlNMkFyck0yaFVB?=
 =?utf-8?B?SDhCZUdKSGtGSUdxTEI2SjEvcEpWR0ljYytVd28rRUc3ZVBNSGlvYjEzSGsy?=
 =?utf-8?B?M2NiZk4zeFljTzU2Vm9rVzJ0aUU0N0phajJLcmdqSk02cXJBVmVkQ3JFbkZp?=
 =?utf-8?B?aTEvdDFCdWprU09VSmhUZndubmpwL3p2VUxCLytUQ0pUeWsvbDd3OEoxd3Ex?=
 =?utf-8?B?cTJHci9reDJHR2Rad3ZpYWtsTW5seUxwcy9MMGpPZzF0OURRMFMwY3BPRFh0?=
 =?utf-8?B?VkFKTHRWL3A3eUhzQW9mRFc1TmVoWkN4RW1XaVlYZjczYUpnc1RaMW5KeEFz?=
 =?utf-8?B?Q2NuZ0gyek04S0NYaHpYK0VBa0MzS1JHcWtLUVhDQXhRb2R5QlNtQ1dhRHhL?=
 =?utf-8?B?Tnl6ZHRnM0xYNGZCaHIvb3FFNzJtcCtwSHZNYzFFYWIwODJLMlBOS3B3c1pJ?=
 =?utf-8?B?VExVUVIyUXcwUUhoMUJ1MElFNVB2aktockNlelJjK0J0NklkUnkra08vZnZa?=
 =?utf-8?B?YkZIeHJRNEkvMUhabG1reHUwMmx4ZThsd0k3K2xidWxFRjVpZG8vSWo5emw1?=
 =?utf-8?B?Y3FEK2VhNHFNamErK0FEVzIzMEc4eU12Ny9sM2VJdXNzK0drYW1TdkpMdmo4?=
 =?utf-8?B?bGVGSnY4bSt3TytkNzJsYk1nYzdGVEY0aE1HYjg0SFVTSWlYQ3hUdzNaWHU0?=
 =?utf-8?B?Z1VpT0V1dXUySGpYTmlOKzN6WVFmZ2NRT1hjc3FtOXljVEFMK3hZRDB0VWVk?=
 =?utf-8?B?MWFTdFFHOFNCNm1qK2taVGw5eFhjN1N0dXFkL1YyUnYrai9EemZlMUpQcmh1?=
 =?utf-8?B?MHdqQzJrK3hyNDAvRGQvUisycFU3SHJ5dytuT2JuQ2NSUGEvc2JURVJWQkFx?=
 =?utf-8?B?RVVEa2F0Z21pRUJpWEF2YjYzUmRwNFp3YVBBR0doTVlpT0dqMHRyZ0tnSUxm?=
 =?utf-8?B?cE9adlVEZmNtSExBQTBlaTRmZ09oNDNUVFE4UjF3Q2hTckFmWFRWcVJjeVVQ?=
 =?utf-8?B?N253cndmeE1VcmlZYldETU5RU1JLeGhkVDhuSWRzcmF4QmdSWFUycEFxdUEv?=
 =?utf-8?B?LzM2UjN3VzRZMGtIVVdmZnVMTWdYWHR5NGp1TGN4RUVGWEVvNy9QbjJsbDhJ?=
 =?utf-8?B?TWM2M2NWd3JoRFlGZ3ZMRTQ5Z1J3dllja0lINmo0Wjh4NHIyQzFpcERJbGM2?=
 =?utf-8?Q?UUex+Mehn8qhbFUutwvheX86/1Kl3tym?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm11RUk3SmdvQUpiQm9oNitKcTlwMHRPcHpOeldJcFVJbDlXc1F5NS9DY1kx?=
 =?utf-8?B?YVJ1SzIxbHNvWGYrRTFTN3ZQOVk3dHllRVRhdDhBdzNQTUlWWmlsT3FJUjJJ?=
 =?utf-8?B?Wkc0UURlRnA0T0daN0lRSUk5NW9INVBCaTAwYXlISnRMaU5Sc1I0RGNkMzZC?=
 =?utf-8?B?eElEcXRnbW5seEJsYlJRRkkxT2JTNEJaK21GNXU1UmJackpQd0lNTERQSGZw?=
 =?utf-8?B?L0JZTmZFbHVGTDA0V0xzUXdGWmYyMzNTOU8zU1M0Y0hTaHFYNnY0cmRSeGsv?=
 =?utf-8?B?amNwcmhWVlk5SWFrdjNwajFSNnF5K09ENUFXUkJ2KzFsRytZa0dUQitNSGpJ?=
 =?utf-8?B?TVUvNjNTRXlaYkExRXR6RExxcThPNSs5UEZZcnVrZ1VKWU5Kdi9taThSdjho?=
 =?utf-8?B?b2llNzdHSVR2MUpQOVNTazZVLzM2SDljMlB3YzFXYi94aUhOTHhjdGhDN3dj?=
 =?utf-8?B?Ly9mbEc0bEQ3R2hRUmt5U2ZUMjFVTXlzclA1anhEWlY3TzZjSy9wYnU0M3Q0?=
 =?utf-8?B?WEt2TmYvL25DaEZyN2pNclg3aXVtNGRqRlhCTzhuNkx5SUxSNWNWUTNvMnRD?=
 =?utf-8?B?MEhYNGJSTjRhbEJ1Z3UvMTNocHREMVFNaThka2Ewd3lSMkNtcUlDUVZ3MEd0?=
 =?utf-8?B?UHJJU3EyblJYQXdqS1BnWjJWaXo4MGMyYXVNbWYvcnhXMXJZL0lUVEdzMDJZ?=
 =?utf-8?B?QmxKSE5EUFZ5K25CdUFVOE9WQmpqOFVpVDJHSG1RclQ1bWJwY2JMUEJFaWx5?=
 =?utf-8?B?SVN3ZkIxMkhBNnJnLzRETndmTFQxV2hBRVVCOGpDTElSWVMyNlVybnhCVENo?=
 =?utf-8?B?Z04vRXBBaHVsWFp2TzVIa2FyckVhdTVrSXh5ZzFIcGlzN1AwUENjOUF4UlZM?=
 =?utf-8?B?SXpUbG9KN2RTaC9HaEZVbjFUdWwzVzlhM2tPNWFwajhhR3lGSzkvbk14b24r?=
 =?utf-8?B?a1IrUXlXMCsxVFJZNGFZL1JZbmx4UVpNbmFibjNJeGRMQ3l4YkpkTjM2TFhC?=
 =?utf-8?B?SXZOc3JIYmdBbjlIY3VUejFmSytsQlczanI0UW1oeTJVWUFlMm43enJ6dVBr?=
 =?utf-8?B?UUx1RU9sQy9JZS9wRzVPSno3UVIvMmFIR0toTDFHRGtVempmWURKV3hQMjNY?=
 =?utf-8?B?YmhwcDJTQ01CQUNXQ2pVaGk0K00zR20vcW1jc0lxRG9ZTXcxRmVQRlFjVHZr?=
 =?utf-8?B?TzNESGZqclZjaHErTHJoU1BQaDdpYWtmWExhbVlNdnBrUU1tZXNPTFUxc3BL?=
 =?utf-8?B?SHBXSVRPRzlLMm56aEJHZTIzZkF6bnlaLzRFc2UvbkIybzJiZnQwczA2UXR2?=
 =?utf-8?B?YmlaR3dxWjFURU5wajliaTdGV1Q0cDVMcnJmbFVQTVY5bFEwei9mVzNFOUJU?=
 =?utf-8?B?YVlzL1NMeWxxN0RYSDRZaDZPUStyNkxYcjlZRjNZTlJpSnpBQS83NkZDMk96?=
 =?utf-8?B?cTg0MFZ2Y1U0NWhpVkhkcnY2RXAxV2VIWlpjWWFIRzJaeXgxendGOW1WdWRN?=
 =?utf-8?B?VUJxN1h5NlJUTWtIaXNFV0U4RzBuV3VUNmlNSnFXSno2a0FNZC9YTDZKNm9i?=
 =?utf-8?B?RmRHL2ZWMTFJTlhCTlN1WkR5dDloTlR6VGZtZlpkcU1YcFVJUGhyVmRid2VY?=
 =?utf-8?B?VnRnUW83N29uMm5ZWEpDeU50cEd1VHFKZ0NTZXIrZUdhUE5VU0RKTG1nTGxu?=
 =?utf-8?B?dEtUc0o4SklzSmcyVGxpZzRqS0FOMUNkZDAzdE94RzN5UTd5WVRGLzRvSnFU?=
 =?utf-8?B?THZyb1lSTmNERTdkYnRmQzNFYU0yTE54ZytKWEpXczNBTlNoTEQ2V2VaclJK?=
 =?utf-8?B?ZFIyYmZxSSt3MGxhYWVFZWVrOUNxRGplck9iN3ZlT0tTQm9RamxyQWhiMyts?=
 =?utf-8?B?dzNITGE2S0EyV2NRWlErT3JXZnZPTTlSUUtld0V6S2NxWmlLYXEzQlZERE1q?=
 =?utf-8?B?TVVISmJQaXo2Q09pMHkvbDUwK3ZET2ZGdFBydlN6UldDOHVZK1djTGh4RnpD?=
 =?utf-8?B?TlpTOEpqSVNMTlJQOFRlRnMzQXJyNUVBR1V1c09NcmpyVVFMZDhUMVRlYjlY?=
 =?utf-8?B?MEhGUWZxMmR1OHFJU29jdTgrcHJUMEVobGo0Zm9rL0U1MnZtWmZ6KzU1R0R4?=
 =?utf-8?B?TkFpSmFPNXhPU2dIU3M1cTlwaWlVRFpjem1qc095QlVha0hVakczbGRXQjdZ?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5d1666-2755-4811-c9dd-08de38fd2657
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 21:35:05.6666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oah+ZnPc2P383MxNdMiR1bKCeg2Y2C7QDxxSZkyhEDNYnosvhgNWTncboTwRjiJJxzG6u1xx5HIF13IvcLWqbXe7UkRxv9KslxqCHQ4e3Uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8701
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

Hi Soham,

On 11/3/25 21:51, Soham Purkait wrote:
> libify spin reset enabling reuse for Xe driver
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   lib/xe/xe_spin.c | 28 ++++++++++++++++++++++++++++
>   lib/xe/xe_spin.h |  1 +
>   2 files changed, 29 insertions(+)
>
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 72b13ef42..9909f4e03 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -179,6 +179,34 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>   	igt_assert(b <= ARRAY_SIZE(spin->batch));
>   }
>   
> +/**
> + * xe_spin_reset:
> + * @spin: spin state from xe_spin_new()
> + *
> + * Reset the state of spin, allowing its reuse.
> + */
> +void xe_spin_reset(int fd, igt_spin_t *spin)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = spin->syncobj,
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +		.exec_queue_id = spin->engine,
> +		.address = spin->address,
> +	};
> +

Would it be a good idea to check here if the spinner is not running? Or 
maybe a comment in the function header above that the caller should make 
sure the spinner is not running?

Thank you

Harish.

> +	xe_spin_init_opts((struct xe_spin *)spin->xe_spin,
> +			  .addr = spin->address,
> +			  .preempt = !(spin->opts.flags & IGT_SPIN_NO_PREEMPTION));
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
> +	xe_spin_wait_started((struct xe_spin *)spin->xe_spin);
> +}
> +
>   /**
>    * xe_spin_started:
>    * @spin: pointer to spinner mapped bo
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index c2199d0aa..af32ab563 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -73,6 +73,7 @@ uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec);
>   void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
>   #define xe_spin_init_opts(fd, ...) \
>   	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
> +void xe_spin_reset(int fd, igt_spin_t *spin);
>   bool xe_spin_started(struct xe_spin *spin);
>   void xe_spin_wait_started(struct xe_spin *spin);
>   void xe_spin_end(struct xe_spin *spin);
