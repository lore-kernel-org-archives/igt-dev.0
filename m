Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4959C61DC2
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 10:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D66910E3E0;
	Thu, 27 Aug 2026 10:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2evfHF5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2485810E3E0
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 10:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787826156; x=1819362156;
 h=date:message-id:cc:subject:from:to:
 content-transfer-encoding:references:in-reply-to: mime-version;
 bh=HDOTFKRtSehzQ0mOluScwBUFHpX3bCZZfUKjZDVVGfU=;
 b=B2evfHF50vyWzlHkAXaPyMxY0uP90aNW9QTu30q2zIjEZF+wk/leLYTt
 a0JGPyMb1tiz+74i0rTyLXN4O9rG9/ZGNBUgjGlqtxWimncH9BGm2SN2x
 Mr/I0OLBl3IMrY5Tqo72EuVlhBDJMuLffUy21QR+q07bfA5L4TCDU3II1
 ASfrxamcyBucUfskY6/I1nGVcxFW6xkjR44H2bDDRbZ84lZKetnKyuNbP
 kV4DwAB+yHFGBR+1+yuccmK6NydNg4NRlSoCHEXDzaNGLVp8xmk0PLVoR
 mVjyLxRQj1V/kafAJKVmMwMwt4SIAbmS1irXa1kzCEJlzDndUkTmLbuWx w==;
X-CSE-ConnectionGUID: w2m3lGmqSK+FijfIWa2O/Q==
X-CSE-MsgGUID: EUzPKGz4Sju53MefCDOq3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92139437"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="92139437"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:22:35 -0700
X-CSE-ConnectionGUID: hszsLvrtQpiHPIVROciobg==
X-CSE-MsgGUID: jstUkXFDQKyBS9bLNBHVyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="269779492"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:22:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:22:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:22:27 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:22:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwozUSiCzk0W+49owDEMEghGMtrKJ+g/oSUV00n1W4uTDT9QTO8CD5JfYKwGFH9zkWYCQKeWlxmc9jy+ieTjL6pZJb2hVMMfzO/na53IgMMFlJG4aq4b8E2vIxvzYuDRqkWHpr5jYaDqG3KAqtxVvMePWrVAk3P43VDr92mwNNkfODYGFz8ZznADLKXqZpIMGirSOM7dnJwPY3UnjxTYx8S7IJilhewaw0T41IEQ64kIlduJ3ueSdl7ttJ9qYawcjG3HzShC6Hbmmsq4nMMhVHi8bspoIEvUICejmwImiO73SjLFrDpxNFk0ErLQz0qFs4ZOYMZYoVpFJ76eE7MDhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9NEIM7jY41LISNYMg1E5dGAX53n5FZNsUb4QQGrihU=;
 b=bmNAFsuM/ypLVpuHuP0vEl/mfJWtxWdnx1eLD+fIPswxihO3FF1MjxxuA1z7yRJW3C6JBYuxF1n3GZt32WmV+XY/+LEYLCG0eU/eNkuBVhpKmV3TpfOcsIc5DbicdVS8QL6RCRE0UxGC2+xffBEwoRY/jY5o2Y2y8+KxzEnERy1m35tnrb5k0Lal7Tor+Lr12ItsI98zdiflDYvsHjHedrR8C7Gp7rL6C6MzcmgnT3jGdYW7Z13nyKJQr8ImVpJ8Df32c/cemGA1bLtDucatbZsHwx0S+Sh37oRi8r3JVmJoCDWTKB3VjER0idMI4fqAS/v68hL2GJiRuOvpRXgHVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA0PR11MB7259.namprd11.prod.outlook.com (2603:10b6:208:43c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 10:22:23 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 10:22:23 +0000
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 27 Aug 2026 12:24:12 +0200
Message-ID: <DKZNIHW0ASDT.2A8C17ZZK1W57@intel.com>
CC: <kamil.konieczny@linux.intel.com>, <simona@ffwll.ch>,
 <jesse.zhang@amd.com>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>
Subject: Re: [PATCH v5 1/2] tests/intel: Add gem_change_handle_race test suite
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <vitaly.prosyak@amd.com>, <igt-dev@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.22.0
References: <20260806021232.200317-1-vitaly.prosyak@amd.com>
 <20260806021232.200317-2-vitaly.prosyak@amd.com>
In-Reply-To: <20260806021232.200317-2-vitaly.prosyak@amd.com>
X-ClientProxiedBy: DUZPR01CA0189.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::7) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA0PR11MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: fda5a2cc-fb3c-4788-3b8a-08df042515bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|3023799007|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: QgE+PsRBB9i2OUY9tzESE+a9h2UNZQeAZ9vPt2fQYl6S0KFiUHXCSpwba/W8LqrJ1Pyf5UI5NODkueA+1ONMiyQGlp0CPGt9ChddQy1HzW9WRUHIRK4BWnHtS76tiF+RqzeT/zaH31VhijtUCj+Dpxv3xrU0C/s1/Bd6GzjCrrmGbtHeVJlKt/OMbvZ4qv/18bzfIsZaBbdxaZyoEoiSWZhvNuzZgSUdKTLe48fPxIJp8tn9PeNN4oNaej3/26mCDkuTdNaJeAnR2GJPtDW7QyrZYamouwbTzwgEINjEgQTBmc5AwnN3gmEK2YziF/hFcF1HvYfQLXnjmSPVevF8oUgC1p2m8Mky0FS7l4ySBWEaCrW7D4p3UPypa4P3fXK6CUJBbqXZJzJhVtKxQDExSvCbojQK7TFf2vm/W+7N5u+2rlRh30CWUAtwHscDsnOBtsD3hufqRqX9WzzE5VQmSmmtMGmxGYMbC9hk4iZ8z802uVMLRyNfqHUoD2/EC/Mx7tbp9N4ueglxqfzEpcRya/zmzFSUtykUwLZcRoz2jympukYG54yYvehTDB3yzQk7dEaoWwXB8cMjmeokiTj2WwX4u2Es3VxtJXBzFQao1Jor/zT9Q67ZrPKrCLm1Gr2uOapHM7EKZkOJ/fEdGqaS5Bb+XJL2tRIsvOafgjtsVIc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akZ4U0tIL0xxZ0V2R29qajNzQmhXUmtRdjQwbjRDZ053L3Erc21idXA4aXpE?=
 =?utf-8?B?NERmOEVTN0ZvM3NLUkhtWDdwSmpyV1R3YW5jV3UzSVFDRTM3RzY5a012eHpQ?=
 =?utf-8?B?YXdEdldnTG1GWTIzOVprZ0tCTFNwaWplYzR6L0h1VHRnbm4rVmh1Z3pHeFlN?=
 =?utf-8?B?dmlTUmRpVFlQRG1Pd1ArZGJNUHN1QnpHb2Z4VDU4S2dFOGpEdk1HUG5TcEV2?=
 =?utf-8?B?OEMwb1VFOWdvVnY0YnhybDVremJ6MXNOTTNzTlVWYUt6bTZkVkhjcUkxUzJm?=
 =?utf-8?B?cG5DSGJ2M2lKR3ZFdUFWTHVpUklJaTZOLy9tYnRod0tZMk1uYWxWanpEU0dw?=
 =?utf-8?B?QTRsdFdTclpEMmJNQVArcENoWnc4NTB6bGhwamFoZWgvZUtRcVFWd2hLUGMw?=
 =?utf-8?B?aFBaNm01Nm1KYUpyNDZ3UVAxcE9DM1F6N3ZCa0lFZ0h2b0NMYkg0cHljN2tn?=
 =?utf-8?B?Z2hJSHVHWkNXQ0tpY3dBdE1VeDVNeU1tdUpxZVBScHZNeWFhOGNta3hNRTg5?=
 =?utf-8?B?MlZ0akpzaDdNT1dQTU54VlBNQmNlSmtIQy84ejFXdlZpZ25aeVFGeHJ2YlVN?=
 =?utf-8?B?bXplYmh4TlFCVEF1Y2tkbHdrTk9FdHJCanlXWUpkdzc4MUhuc0ZWOUhIbzFY?=
 =?utf-8?B?Wmkxb1hQZW1velQvVVlhVHZ2RkNhaUZpYi9CTVBIVW16aklTNXpBTTZTVTlE?=
 =?utf-8?B?V0dBNk5zZC9adXVycXlJeG1GZ3lWVEFsY0pmalcrcXNZL0VFSHg3TE5KWkdl?=
 =?utf-8?B?WmlsRnVsazFCTnM1SUljQWlrRk1wU0VFcGJrQ1ZUZytwU0NsU0RWTkVQUXVy?=
 =?utf-8?B?bm9WaytJQjIxMklHNTZZR2d4OURycVF2VGtOZzNKcTJKUXlWb2cvWHZERUxV?=
 =?utf-8?B?OWdzWEFoenp2K0gxN1g5eWVFWnphdldRUjhudVhHam9COUNsN0hTbjluTFBG?=
 =?utf-8?B?cWFRbmZFOVpwMzhaNzh1OE5uSElJVDExcUU2OFBPMHRUSmZMZFFqd1kzclcy?=
 =?utf-8?B?WHl5S01zTFRNVnVJYklsWGRudmlJdGhuZmd6UktsVS9BdHFjaGtucHlMUXdo?=
 =?utf-8?B?eVlQSmlrUHJaMVdaOFhhSThMVFAzbk1Yd1h0RlBna0t1SFdENmxQNlZSSEYz?=
 =?utf-8?B?N2dIdGhEUnpYaEZVMjdaZC9IRnZ2a0xCZDc4VWErNDJEV0tJcE0zblE5ZXVx?=
 =?utf-8?B?NzV1bCs0QnA1bXVWYm54aWFqUjhPZkE5VXprdGZVd01BMXRrQWFBWUVSeXRP?=
 =?utf-8?B?NlZpcUl3L1RidmxrMkR6VkU1S01PbGxyajNZWDZNVXJjb3BQSzhEbDBFdmRT?=
 =?utf-8?B?T3dCMlVGajZtWXVHQlNnbkgzdGhYSm1KdzUvQ2ZkeS81N1VOVlJPL0p0aEFR?=
 =?utf-8?B?S0UzVml2Rjgxdk9YY2ppZWU0OWx1MGpLWGhuaEtzYS82NCtWZzFYME9nRjh3?=
 =?utf-8?B?eHlUM3BFb0hSaGdJam9XUHNudjRDMmMwNFJDYnhOQjY4L0ZRY09hVGk4aklo?=
 =?utf-8?B?NVhWNytCTVZIaFRJVXlrMFRYREZxVnZSMmNVRVJsSVdaMTRWOGtJU2E1V0Rx?=
 =?utf-8?B?TkU2K2FyL0JTMjZ6Q2VBbk5UNDhvNmIzNWQ4ODhxNVA3SWY2M1FBeWxNN0ln?=
 =?utf-8?B?QjkxQ2dOS1EwNEhVc2w4eHB6elpvTDRVZFlndmtFUUltUVNmTEkzVEg0SlJq?=
 =?utf-8?B?bmZXMGhDNEZTNm9PWXk4eERiVjBFQ2NXenZPWGVFQUpPREVON1IzekdXUjJn?=
 =?utf-8?B?VVVSeUhjVFZLaENjSkxGSUlkMWtMcDFkcVArOXNUa3VOS0RBc1Axek1WWkx4?=
 =?utf-8?B?UkxibVFmTEw2bEZyYVp0eGZzNzlHKzhOdHVsNy8wUTUzbkl4cXV0RHlXcitN?=
 =?utf-8?B?RjFrWWxpVXJIZEtEZ3RzYUFzL3RKTW5RbFA2bWxaSS9BcHZpYzk1dmpyRTdr?=
 =?utf-8?B?U0NWemRBUDVkODdkRlJuUk0wZm56NnVYa29HelNxSEdsSFFTYmM4d3NGUGJY?=
 =?utf-8?B?QlZMT1RrYUluOG5MYnBnbVFGNVgrckV1REVFclBsblV0a0FQUEw4VVZwUUFT?=
 =?utf-8?B?VEN3K2RCUDA4RGlnNndtMUh6M3FCajNidnAycWRaSTBQU05VVnZIVHdEZENZ?=
 =?utf-8?B?eVlVYjBNeHlldS9zRk1oQkpmNlZLcGVRNXhVcG41S2lENCs1Tk9mTUNMamxD?=
 =?utf-8?B?eHdJVG9CNCtMTlQyK3EvcWdCcDlLUGJGTytsY3orK29YaW9oSGZRMktMWjNT?=
 =?utf-8?B?M2lCRmR1WVRpVHFmQUtLcWZhMmZGTDZSMHlNcnU3QjN3czRoRzVzKzNrbUJC?=
 =?utf-8?B?ZUZZOVh0YTk4NTVtSi94MmhwV254SmxPc3E2T21kaTlUZnhnT3piaVgyWDVJ?=
 =?utf-8?Q?h3SRlNTs6FAMQF+0=3D?=
X-Exchange-RoutingPolicyChecked: OW2g7msmQXzzhtiwjkKTpQy0G0qHlJipG5wVazXfUIGnd77mEkVjct90jHroD1VvGPrHFdtskjSz72LKhdKme6XwYOxoNlb66Ca8rmM1MEPM6Jybt3ouVl7pdX1aSOKoWMNYD5ExRNQ7NVPDn55m3f5CXOt+wp7Pz4V7kdWP5uVSjqCesvdMrz7Oy1wlWS+B7lYpBSXsiGE6GNwRH4fbZHNlvsA/JKh7h/6wax6o5dU0S8DJoy6x1vYQ/OdehKd+doPOKlioO7jdUSDFK+6OvKIK2giGtf+Sj3nhl0x5NQr2eV7EBddv7pGG0Ob4s41VL+uhGQ8f+eQNE9N5n7QTlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fda5a2cc-fb3c-4788-3b8a-08df042515bd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:22:23.6304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mciSBxeT9rompvcvKiOKBqaEjhfwzgx5p6RgyJBVw0igVrc/Oze50zqn+wVv845QabyyBzA5hrGYGEGEwBZdv/EtfWnYB2lL2VNih8k4K4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
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

Hi Vitaly,

I think it would be good to add this context to the commit message. It
wasn't obvious to me at first that this ioctl is currently wired to
drm_invalid_op apparently landing working IGT tests here is a listed
prerequisite for enabing it.

On Thu Aug 6, 2026 at 4:12 AM CEST, vitaly.prosyak wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> This test suite validates concurrent operation handling in GEM handle
> management through the proposed DRM_IOCTL_GEM_CHANGE_HANDLE ioctl.
>
> The test is GPU-agnostic and works with both Intel i915 and AMD amdgpu
> drivers, focusing on proper locking and handle lifecycle management durin=
g
> concurrent GEM operations.
>
> Test coverage (7 race condition subtests):
>  - race-change-vs-close: CHANGE_HANDLE races against GEM_CLOSE
>  - race-change-vs-change: Two CHANGE_HANDLE ops race on same handle
>  - race-change-vs-prime: CHANGE_HANDLE races against PRIME_HANDLE_TO_FD
>  - race-aggressive-change-vs-close: High-iteration close vs change
>  - race-exploit-single-thread: Sequential swap+close pattern
>  - race-exploit-random-handles: Random handle stress test
>  - race-close-before-lock: Close-before-lock scenario with CPU pinning
>
> The test uses i915/gem.h infrastructure while remaining vendor-agnostic
> via DRM core, following IGT convention of placing all gem_* tests in
> tests/intel/ directory.
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
> v5 changes (addressing Kamil Konieczny's review feedback):
>  - Replaced all non-ASCII characters (UTF-8 box-drawing, arrows, emoji)
>    with plain ASCII equivalents throughout
>  - Removed Change-Id from commit message
>  - Moved version changelog to after --- (not in git log)
>
> v4 changes (addressing Kamil Konieczny's review feedback):
>  - Removed running_under_gdb() function entirely
>  - Fixed all double newlines throughout
>  - Removed #define _GNU_SOURCE (already defined by meson build system)
>  - Added header comment explaining tests/intel/ location
>  - Fixed check_kernel_traces() brace style
>  - Enhanced pin_to_cpu() with error handling and ARM compatibility
>  - Fixed variable declarations (C89 style)
>  - Removed unnecessary braces in if statements
>  - Fixed static variable initialization
>  - Added meson.build entry
>
> v3 changes (addressing Kamil Konieczny's review feedback):
>  - Removed reference to external documentation
>  - Sanitized test descriptions and comments
>  - Renamed 'race-darknavy-cve' to 'race-close-before-lock'
>  - Renamed internal functions and variables for clarity
>
> v2 changes (addressing Kamil Konieczny's review feedback):
>  - Added header comment explaining why test is in tests/intel/ directory
>  - ARM compatibility fixes (graceful CPU pinning failure handling)
>  - Made pin_to_cpu() handle failures gracefully with igt_debug()
>
> v1:
>  - Initial submission with 7 race condition subtests
>
>  tests/intel/gem_change_handle_race.c | 1798 ++++++++++++++++++++++++++
>  tests/meson.build                    |    1 +
>  2 files changed, 1799 insertions(+)
>  create mode 100644 tests/intel/gem_change_handle_race.c
>
> diff --git a/tests/intel/gem_change_handle_race.c b/tests/intel/gem_chang=
e_handle_race.c
> new file mode 100644
> index 000000000..f4b00c65e
> --- /dev/null
> +++ b/tests/intel/gem_change_handle_race.c
> @@ -0,0 +1,1798 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + * Copyright 2026 Intel Corporation
> + *
> + * GPU-agnostic race condition tests for GEM_CHANGE_HANDLE ioctl
> + *
> + * NOTE: This test is located in tests/intel/ directory because:
> + * 1. All gem_* tests are traditionally placed in tests/intel/ regardles=
s
> + *    of GPU vendor, following IGT convention for GEM-related tests
> + * 2. The test uses i915/gem.h and i915/gem_create.h for GEM object crea=
tion
> + *    on Intel platforms, though it works vendor-agnostically via DRM co=
re
> + * 3. Some subtest designs (noop-same-handle, invalid-*, edge-*, functio=
nal-*)
> + *    were proposed by Simona Vetter (Intel), hence Intel copyright head=
er
> + *
> + * ARM compatibility: This test uses pthread_setaffinity_np() which requ=
ires
> + * _GNU_SOURCE and may behave differently on ARM due to different CPU to=
pology.
> + * The test gracefully handles CPU pinning failures and continues execut=
ion.
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <pthread.h>
> +#include <sched.h>
> +#include <semaphore.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <sys/stat.h>
> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "i915/gem.h"
> +#include "i915/gem_create.h"
> +
> +/* AMDGPU includes (if available) */
> +#if __has_include("igt_amd.h")
> +#include "lib/amdgpu/amd_memory.h"
> +#include "igt_amd.h"
> +#define HAS_AMDGPU 1
> +#else
> +#define HAS_AMDGPU 0
> +#endif
> +
> +/* Helper to check for concurrent access traces in kernel log */
> +static int check_kernel_traces(void)
> +{
> +	FILE *fp;
> +	char line[1024];
> +	int trace_count =3D 0;
> +
> +	/*
> +	 * concurrent access manifests in kernel logs as:
> +	 * - KASAN reports (if CONFIG_KASAN=3Dy)
> +	 * - Kernel oops/warnings in drm_gem_object_release_handle
> +	 * - Stack traces with drm_gem_object_handle_put_unlocked
> +	 *
> +	 * We grep for function names that appear in the concurrent access path=
.
> +	 */
> +	fp =3D popen("dmesg | grep -c -E '(KASAN.*(drm_gem|change_handle)|"
> +		   "drm_gem_object_release_handle|"
> +		   "drm_gem_object_handle_put_unlocked|"
> +		   "drm_gem_change_handle.*RIP)' 2>/dev/null", "r");
Since a lot of tests here rely on=C2=A0greping dmesg output for validation,
I think it's worth first checking that we actually have access to dmesg
It might be overkill, but otherwise I believe the tests will always pass.

I think igt should have already somthing like this. I'm not sure about
specific function, but maybe Kamil can recomend something.

> +	if (fp =3D=3D NULL)
> +		return 0;
> +
> +	if (fgets(line, sizeof(line), fp) !=3D NULL)
> +		trace_count =3D atoi(line);
> +	pclose(fp);
> +
> +	return trace_count;
> +}
> +
> +static void pin_to_cpu(int cpu)
> +{
> +	cpu_set_t cpuset;
> +	int ret;
> +
> +	CPU_ZERO(&cpuset);
> +	CPU_SET(cpu, &cpuset);
> +	ret =3D pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpus=
et);
> +=09
tab

Other than this, please run checkpatch from the kernel scripts. This
file has multiple style problems.

--=20
Best regards,
Sebastian

