Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A97AC61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 23:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC1F10E03A;
	Tue,  1 Sep 2026 23:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfT04XM3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E5310E03A
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 23:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788304612; x=1819840612;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NoP3u6iifh+s0B0/aq/HEYA/GYi0veoSYTlKsQ7JZQ0=;
 b=RfT04XM3IOHszI/OWY/3UMdj6puWJ4M1bPnq9f7m+WBacjDGwRFbjoS/
 h7onXESyT7MYMy7sCo40WI3SSXgk7G0YX2CgpNhjHUpTzbcmzKLADdxwa
 QvfhZ51xSpCetmn3ZRcHTHiaNzVS6j2Ge9Fdfv7uHxrhKOqraQOBSF91j
 vsNLMUtVsEOsoZYIuy2Kg8Uu/2CKzRdRrxrpj1wxVUgcimzgvNy5K4UOA
 j4dNX6y7JDqEXJxEYfolTmxONC+JRuPe+K8u73QNT1U7OkuVMK+pO5OMC
 V390zyQ6MTJocFZ+41DLzYB60sia5VvBlgNya9oe7UoU2M7Dgw+3GOJcI Q==;
X-CSE-ConnectionGUID: qz190PGxTs6zm+gLyijoHQ==
X-CSE-MsgGUID: yurbr8T0Rlao78rJ7Tll5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99349761"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="99349761"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 16:16:52 -0700
X-CSE-ConnectionGUID: PGcZavylRluRUvEbIE83yg==
X-CSE-MsgGUID: JH4gRUj9Rk2Co1P8PYxuyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="265525320"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 16:16:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 16:16:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 16:16:51 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 16:16:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G09Iru/IZHgo6mUHsLfDs3GoepDwwTAn0fsgj1w2abh2IIQfjYttsziMHFxLiJ9328lAuJti7zJHIRv5t8r468WFAM2cbatg4KBk6sZLnFu8zbVa3oSz2VqyTYiK+3jOdNOUjT6aIvvmratSbE4tEwAkZGdt1K3Dt9Ypg+gl5Y3Qp4urH5D89Q0k8aMTGnZC4XMaunT0SfacVxUkAUiMpvg8fDC7CYe/j7ck7NCy1x1V1yys07l/u6EVCDDm+N2dQ43bzjmuFh/6nt60+vLj6NJx1YlVqca0ublDJzsGt6Q99yJccvpGZorTmodwce2FS/UlyUTpxT1hM6CO9dGDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FZfUz/l+bZ1okx66d2NidMm70Y2EjlA88wMEDEoQeQ=;
 b=Ab4kLEkMxWvIRUtV04UM9xl+IAl6Jt+RLWXXxrBSKn7QKA6rQqxEyBfId6DeQKCKRm1RRtR7Z17UHhkFdau2AyOL9d4Q0/GYtHDZeMjSTBCNaESL06xO1j/l/ydv1WZAbXvdI2hnE1tf6cGV0t7kEcqtGiADq35TsfLRJbCyqZ8nCfJ4Lrqsfth6t9qljC9X17qTdmY153WggCf12x+5hTGwLDO+KiA9nO6SRIvB6WfY/7mgWz9kF90u0TBojqM75JOoVjCTeo4vHdDysHHZKHZ7gba2xJAILRNjUx02T254lgc9FQ7WNfl2VLHsXxfDEa3pHAT0Ng73ONWGM+OAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV8PR11MB8488.namprd11.prod.outlook.com (2603:10b6:408:1e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 23:16:49 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 23:16:49 +0000
Date: Tue, 1 Sep 2026 16:16:47 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel/xe_oa: Add test to ensure entire report has
 landed
Message-ID: <apdc350ZzySMQwVE@soc-5CG1426VCC.clients.intel.com>
References: <20260826044209.1498337-2-umesh.nerlige.ramappa@intel.com>
 <87v78vcgd9.wl-ashutosh.dixit@intel.com>
 <apDJ+15eU7xo/Yjl@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <apDJ+15eU7xo/Yjl@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW4P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV8PR11MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef78be9-2f32-46b8-a72e-08df087f1958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: /9lvYiQb7jUYM8il0i0sKFitwBbJhk2JgF/XMmVzdzQKtKsHxnJFXa8rEBo3fq4HI8g23WgOmCowO9H9oHCjA9wlezeayEBnoJOS1nj6uvcBtX5jU/SUvP7HlUhcFbmagl/D0mHsop7hN58TwWL3EMw1zG3FVhUrZ7kqyaP1OAOjePO1+d+S/ZcK82KFKQsgGVzG+ZSSnz5DFeTEyAJUeck3/5+TXbh8m9rzwGjpUsBlG4/t3Qi4k0KXOXQzIhDoSIq49W5LYgpdJh8P/zvMrrf6de82itpdD6kt6DmnJghhh6+lYXJon6w+jlmuYjgEvKM8o665JFgdEiTqE4NPeZ9svwoPCUIM/0JL8Ot0+0NrjUUqtvg5nrkjn7SNjmj71/NTehsllJX1veaI6laSybPi4ckqnMNo4MUTWQCzMgQusgJABtRqPwPbA70jffN8pG95PFTLwh0o2nrBduffjNAcbCtT3MDJfq0cO2uRRF/ezvVr9pAZLqQZt2Oj6tk5hEsU/34NjoSS8zLkrH+4j3zs+5ILtTH8rFmQ9Uqk2LuGEFUladyvBB82Chzqdbhmz0jrgPirZgxyYCMoY1MtVMDLecPAHcDnOzZsSOKVU5v2uqe64jUwB5xneoXdLPv1Ydi3a/F6j7GmZduTklg450l4cGuz5PxlPBHZboQs+GQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUNIUVRPdlFsd0owTEdCNWVVSVg4czk0bDhmMEV6eXp2Z0R3YkF5V0JLa2Ix?=
 =?utf-8?B?WE5nWlVXRG1QVk40b3RvU2t2d3MwTWtKM1ZOQVZBKzlrRW9pbm1WTW82UWRM?=
 =?utf-8?B?TlNxY21ET0x0a09vb25IT3E3VXdMdzVRU0tNSW5hVWVibFptbXFXc2NYNXJj?=
 =?utf-8?B?MEg2ZW1NaUduMFRDSVovdGJXd2FKZ3RTbjV6a0hNYUQ4a2dpUGYyL1hZc3Rn?=
 =?utf-8?B?dEdKZVdKV3BybDltNVRVRXorRCtKQ0YvdlpQL284MzZuMy9IMmltL2M0YzBM?=
 =?utf-8?B?VFBYZHFMcm1GY3d2YzM3L1lMazlaUHpUQ0tENlRuWGxZb0FVNVNXdTVRVko2?=
 =?utf-8?B?RjhzbGFxdDBBL2dhQXBvN3l5aExyT2s3SkdkaUtTdXAzc3p5RmsvcmZIWGJt?=
 =?utf-8?B?cXZMb3BIUHEvbkVsN0ZibTZMSEhhSFZKQXdOaHE2UkNsVWwzVGplUHNZcWlR?=
 =?utf-8?B?N1hoUVp6bGJFR1c0QUlwNkFSRURyVjlUdUg0US9GL29sbnV2aWlSMW9zejVt?=
 =?utf-8?B?L2lVWnFnck80RHFUa3dyRzJPcnJEb2EzRk15aUtlMVFmTzFUK0JWMlhScjFF?=
 =?utf-8?B?ZTJtNHd3NEVYQXZsbENaR0VkN2xBZ3c5TnBTanBkZVJHRmRYYnZkWU9lTUlI?=
 =?utf-8?B?Wnp5Rys0ZFpCZnRncG85WTRMZzlxejhmODlMVUcrVzhnNnZHbnVBSUVnL1k3?=
 =?utf-8?B?eGxBUzlKU1VEZ1dUT1Y1MUFRNDIvdmkrS1BBRE5ZV2JBSWRVMmdGa1JDaDA0?=
 =?utf-8?B?K3pIRDVsZWJJc2EvbWllay9Ua0o5YmZCVWhiSEhvVmExRGU2bytET0M0bnFS?=
 =?utf-8?B?TVZzT3RyQzV3RnlvVzJWYnhhOTdML1JDMnY5TnNCOFlqSkFnSnlmZG9STzVT?=
 =?utf-8?B?YXpsa2UrcDMxZ0lKQVBxcG5GL0dRTTZzeW1VN1kyWnovZVFWd1hDNDVGN3B6?=
 =?utf-8?B?OU1TT0hPZHVlNVZPdjk5SnFvak9nMTVIL1lydUgvRU9hWFlrbHFEYmRncm5p?=
 =?utf-8?B?am5iYk9pRlBtS3dUL1NwNFFLRlpDVzlyU1BJZXlYcGdjaUNHVW5VaU14YWwy?=
 =?utf-8?B?cXk4RDlxWG1PRUhObjhFY212NHFoNUY5bmlBUGU0MVp6ZG95UmRFUTBvTEVD?=
 =?utf-8?B?ZkVVME1BeE1WK040MCtqQ0RJTEpCakZBQXdaZ3J4ekNKbnlHTTVYN1dSTlJM?=
 =?utf-8?B?U2VtbEdLR2llZzlHeHRPS2R3Y2Q1YkhsQUJKdVVMSWlsaWRUK2FwbDA3dVdE?=
 =?utf-8?B?WDAxZ3k5UHduWSsyNkhBdngwWGZucHp3cHhYNkFJclc0WkJwbUhKak5tUDRN?=
 =?utf-8?B?TnR5blZCdWxIcjNuMW9zaDFnSTIvT2RrbnI0dVhDUGNkU3M0c2lMQ2Flc2xz?=
 =?utf-8?B?T1RONEhDN0c5S3U2MHkvTVRXVEptSHFPUTZFQWZMYVhzMU42bTN6RFF1dXdQ?=
 =?utf-8?B?R0xzNmRjSEF4cmRzYm5ORHB1cEQ4OG1JOU9OZjJJclQ2dzltSVNkd2VlT0Zh?=
 =?utf-8?B?VVlPVGJwd3p1OXIzVlF3SEFsUWQzemdHVWxUOThyRUN2dG51ZmJKQm1JTVRt?=
 =?utf-8?B?TktIMldoWGVqQWRmMWpkekZvZ2xnRUlaVVl6THNzNDU1YnpTR2Uwd0lEYjBF?=
 =?utf-8?B?c0lCclVRcTljVWJRODdwUmMzWGpRemZYb09CZXE5YXYyczdPMGI4Sk5oZEY5?=
 =?utf-8?B?NE41ay9SZFJmN0tLUmtYemxTeGkwQ3o2b1ROYkk3aldvWXFhdkt4SytXY2lZ?=
 =?utf-8?B?dUdxZzlEUTlqbWpDQlhYYnZOM2VtTy9ZQlExQVhYRHpLd3k0MUVmcHVxVStn?=
 =?utf-8?B?bStiMUFMRlJNK3o1QnpDVUJCZ1hGUGQrZnFhT0NNbjdsaFZqUXVRWVFqOTBi?=
 =?utf-8?B?TTNOZXI5Vy9vVkdvcUkwdDh5eUFkU2dEOEJkNnJXSUZGZVU3SzFWcDJQcEJL?=
 =?utf-8?B?OS9jeXpocFd6V1h5NGtCdjc1N0xveEJ3UnBmbHloS21naGFaNTE0S2d5cnBF?=
 =?utf-8?B?SU96a0diV3NzUk5Gd01jRmU1UXhFWUc1UHVoVS9MNytXdFc4bGVINUV5Ykhu?=
 =?utf-8?B?WklienFObWZ1bXVPRUdOOWVqMW5RS0NXTlBrQmVtemkvSFFza2pnVERFZjh0?=
 =?utf-8?B?dGVtNFB0U0ZybFJOb2pkc25UY0J5cU1UOHMyYm9iQ1VhOXNHZjhFb2lGMzV5?=
 =?utf-8?B?Y2tjTjI0ejdTQmhPYUtpc0w2aTIzd3JOUUxMTFphZldBN3B6OFFVRlY1di9i?=
 =?utf-8?B?U3JZZ0JuNmNtdzZ0MmNmT0o5cit0aG5JcE5SamVmdStWRE9nRlluZzF1L09x?=
 =?utf-8?B?NEplcDJ0SFdqY1RCMTJxcUg1RGtoajVvYW8waENJWHZCMlhuOG5teUhSMjRz?=
 =?utf-8?Q?sv8/c4VVwZ6kpja1ARAg1ZekEPDxPKk64fpwR?=
X-Exchange-RoutingPolicyChecked: tYtpM5tTVOckeZGUsceOdqzirVLGmi0UAcjaF57bPFKy43QGd1ncTpcgj59+b5EAIrOHkvg/zuYHwWA8fMgBdIQcEo86oLDlRhul2773nt/43Um5ahOZuWvKdRK413EZCxSku4FpTD/xDM3Kocyhq7hYENv7QhYWyH6RKMqkK9CqSxlHa/fhxgANbeyc+rwL866OaxkgB4eBuaUK3GxQ8MGh4PXXzo+L863feHzlwoDYun/WhVkMALf2e3Gsdx9YCMWhlqUFdEN9T+Gb/Lxu5D3TfD8ievCpyTBRxsxwlss4DaBXXdfRlbrCdgj1cHxOTaBTxPg9c5JxNWD159jXlQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef78be9-2f32-46b8-a72e-08df087f1958
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 23:16:49.0213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1x5OpTnmbQtvHMC5h8qHkE9nO7CLBS+GGFN05vtWxv5CXDsHF/HJj0vwX1BZwk25brKcMsd4MCFjcWzEfhz6Fy5zmG+PMHwe4iUeUoozkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8488
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

On Thu, Aug 27, 2026 at 04:36:27PM -0700, Umesh Nerlige Ramappa wrote:
>On Thu, Aug 27, 2026 at 04:07:14PM -0700, Dixit, Ashutosh wrote:
>>On Tue, 25 Aug 2026 21:42:10 -0700, Umesh Nerlige Ramappa wrote:
>>>
>>
>>Hi Umesh,
>>
>>>When running the load helper with a fast oa_exponent, sometimes the OA
>>>reports land out of order. Ensure that the kernel fix for such issues is
>>>working by configuring all OA counters and checking validity of the full
>>>report.
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>>v2:
>>>- add a comment on event definitions
>>>- rename report checker for clarity
>>>- remove unnecessary spaces
>>>- u32s in one line
>>>- s/576/report_size
>>>---
>>> tests/intel/xe_oa.c | 217 ++++++++++++++++++++++++++++++++++++++++++++
>>> 1 file changed, 217 insertions(+)
>>>
>>>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>>>index 9ebb18690ec7..58e50bb182a6 100644
>>>--- a/tests/intel/xe_oa.c
>>>+++ b/tests/intel/xe_oa.c
>>>@@ -336,6 +336,88 @@ static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
>>>		.bc_report = 0 },
>>> };
>>>
>>>+/*
>>>+ * test_oa_full defines only 2 events:
>>>+ *
>>>+ * 3e00 is "Number of GPU (gt) clock cycles at every clock period"
>>>+ * 7e00 is "Number of GPU (gt) clock cycles at every other clock period"
>>>+ *
>>
>>Can you please also add here in the comment that we expect all counters in
>>a report to be non-zero with this metric set (or reg/val pairs).
>
>sure, will post another rev.
>
>>
>>Anyway, this test is failing in pre-merge CI, so let's see what we end up
>>with once we fix that issue. I'll hold the R-b till we have a working test.
>
>The test is working as intended. It should fail when cachelines are 
>zero, which is what the CI logs are showing. I am trying a local repro 
>on LNL to make sure the KMD fix addresses it correctly, but the test 
>will not pass in CI until we land the KMD fix!
>
>I would land the IGT test and then report the KMD patches to ensure it 
>runs against this test. Let me know if that works.

The issue that CI caught looks like a different unrelated one. In my 
local runs with LNL, I don't see the issue (with or without the KMD 
patches).

Thanks,
Umesh
>
>Thanks,
>Umesh
>
>>
>>Thanks.
>>--
>>Ashutosh
