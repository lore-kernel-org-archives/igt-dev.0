Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF011C61DD6
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 23:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4855910E03A;
	Tue,  1 Sep 2026 23:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cAiMcU+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26E510E03A
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 23:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788303983; x=1819839983;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=r+k+yPD+vUb0HFL5SZJGS+tjzNbW+X2dVc83rXMEaAk=;
 b=cAiMcU+cbQJbIW5/b1sUCqqRWRKclC1RQkLecg0Q2/6Ie5nKZbeBaT0T
 Rr9bI06HQY18jsla/Qq6dvIYn8kxX8NzM/KUBqVqNQW/D0R52T2eoeB/p
 DjqrtMMtQJVaw0VPayKw6NH+8fRX59FrKBySUlrKjPXic9rlAAYcoytDT
 XdotuoHEMxeqUcsUVSVB5qRahSre5ZCCNKgU6ceRjZZfmF8P9QBH4ZcNk
 rCOxrMFWu0z+lVkIw+KMnJMoR+7UgGG8iwjXOkSJ+A//778f6f0TCA5lG
 lBoqJn9Roe1bc5VeEtWagOB4NGM+FXiPfRL31gpHqxgx5VDf2mQRPu9FH A==;
X-CSE-ConnectionGUID: zM3SnpvLSZSMBgJgt2UbjQ==
X-CSE-MsgGUID: EGYrmmeQSWaVko2vyT+zzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92449234"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="92449234"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 16:06:21 -0700
X-CSE-ConnectionGUID: gq9Dh8BBTsy4jtha5kox6w==
X-CSE-MsgGUID: w827ejUPToCRkceHAa3fmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="269817253"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 16:06:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 16:06:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 16:06:19 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 16:06:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ef1aP6n2mWyTr614CcGh8Ze9lcsIZY8YrFNWdS6Jyo/8tuwJ4ELx21tt8mzgniTwz1YSge8E44PvYkbUz11IZCMuWAUYClzduqnQm32shNzHtSOQmGwuHvQZmtMRbLnx7DtG06nNaInjIORBl2q8eu0X+eQo9QrP7xe1OlgP9BE7w1iueuC7xTQF2u+abmlpIzY09WtrxPIkzPAfypDb2QCDlcw7k+/AKwoTDsxgMogp7/7fW8AxQKWyOfTbcvXbEhyOzkKZiB1daEoLDPR4nHTSO9lg/M0J0Ysfn7hJcEIXv6Gm+JTslbs35RQBXolFMJzQvqccU0dGaKkzWLR97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjN6qVNjuDtfMDOUBPCN8LLNXhVxOxqoaNzodzZZy0s=;
 b=FJlimwmf+4+ICzhcAqGh1V6dZ5pumvp8/RCQJvcjM0Qm7oCUGUJbauvKUAhVOG8WYPirWwQvRJDJWZN0nPifc/zhiyf51zHzba2WHRw60BR5cEA28mIfrb4YV6pdVFGM6ayQX3GWSWZVatLjp5UeyAqyxYXP+/VTGn2oWjkudy1jh3JdFC1O96KeGyAXif9L7mB3PhvhJ2htv0Ej2tP7k6sirBiVkP74hC4kUmX3mVjILMY5n8h+yDpFyk+jrAYHQdufQDjaqWmQ5q/IxYZPympafeLDA/nVERLrt2LXMxfIo+fMNs4w9k5MtzBSAhOR463Ww0L9t+YcKx+wl4Nxgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA4PR11MB8889.namprd11.prod.outlook.com (2603:10b6:208:565::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 23:06:17 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 23:06:17 +0000
Date: Tue, 1 Sep 2026 16:06:15 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_tests=2Fintel=2Fxe=5Foa?= =?utf-8?Q?=3A?= Add test to
 ensure entire report has landed (rev2)
Message-ID: <apdaZ6RZqVb5mc7g@soc-5CG1426VCC.clients.intel.com>
References: <20260826044209.1498337-2-umesh.nerlige.ramappa@intel.com>
 <178772720290.85082.1686747611063721414@61270ab9df2a>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <178772720290.85082.1686747611063721414@61270ab9df2a>
X-ClientProxiedBy: MW4PR04CA0170.namprd04.prod.outlook.com
 (2603:10b6:303:85::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA4PR11MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 858cd98f-6f8b-4bd2-c499-08df087da095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|4143699003|10067099003|5023799004|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: k+14EQz0u8V16ZPmLdiTiBvjFghOlxCwpUOF5PJzSWMGiRhMh8ys/LbvQK3YLMsdEv9fEz/hnTQJYJTmPAWAv86tXaInDxd3E3SmLnTPcwn6gFC9eYvudhvgPjcOUUsXTjN66R4FHhRU9ES/YfBnC1yBjyjZvEDcdoGbSOySj+zjUwcObymhL0Gm8jJA7r5kl5Pml1TT78AdfgwjwlsT/0YGIAT+oaSpTQZtNHfHsrGqCKlO1mHq1pzgcOm9mOw4laecdeNxaDqx9ko8lo4w589XUfe1tVCykIiXLSszFbl2KNN/hpMgkZdKv5LP7B4zZ3NTsia/opWD3OT0PesT/NJcBrOsQ7Mc7FussZofNT96AIe/JwTQA4eiD4oxtDredyVit202d7P7voDUzYjbWWvwj3HCi3uq7LkX1G7WJZ1hpYOKD47MUEoMzXwjCqMLybSwZLuq9lYgMLzGo0RGaU7Tmz2qR/5drcp5bJVw1C2sF3rBcMX0xZhrQKFZPqbb1kfkZN7Ki89GMwVvI3GPFAKj7jQQC3SJ7p82ajFlVrzjZER91D219tLNJ39sHlLGnnzCwTlTQJQQ2cTdFWWccoQYc2QMdESmL7HNvwOb/uA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(10067099003)(5023799004)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEQ5MXQxYmtBNnBPRW4wZFBYU0VwUmYxSUJ0UjdTcE5hSjlHeHBMZEhXdnp2?=
 =?utf-8?B?MldBZitVaUQrWmJLSzRxYnU5YkF0YmxjQ0lzSERTK2tMUTlOejVTVUFuN0o4?=
 =?utf-8?B?YXFoQ3lSNFRDMmQzd25KcUpRRWlaeTNETmk5WmVtWWJyRUZLYjltK3M2a0pL?=
 =?utf-8?B?T3Q3MVZhREpPMkRveXJVTVgwczdub3pTalNucVBnamlGR041cnJqdTNlMkNS?=
 =?utf-8?B?dVQ1aFo2NGQxRWR5aVJtNXZ1L09DOGRPNzQ0TkNJUUNtWk5aQ2N5T3hQanl5?=
 =?utf-8?B?NENxUDFCbGJRSUNSRlpiUk1veEdLUWh0cFJsRzl2RENUS2lVRDliNmg2VzRS?=
 =?utf-8?B?RzcvOEhXbmg0Y2Z0OCtMSG5rTW5QLzZ3Ym9LOUlQNVpTeTVxZzcraEZHbWdL?=
 =?utf-8?B?cEFPNWFyWU54N3RnSVNTeG5aeHFmSmNJbGtHdTZ6REg2U0JObXR3R0lHaWpp?=
 =?utf-8?B?VmI2Zk1UNTc5T2M3R2RneVkzSlZhRDRZNDJFQTlKZUowNTQvdElGMExPd1Nq?=
 =?utf-8?B?QTZ2UEphdG5lSlhyK1UzQmw1WjVFQjNKZkYySUtOM0o2MTdlSVltOXVrZGZF?=
 =?utf-8?B?eEljSlozd2hxT1NBRFFDN1ArczJPVDVsSlpiKzNLeC9KbUdQZ3hjd2NZd3BF?=
 =?utf-8?B?YS9raGs4ZUJDZHlGelZyaS9nL21VbnFvaFVZaU1XNWVmOU9OR2xNSUFMOWtP?=
 =?utf-8?B?WGJ6Q0hILzZGNXNNVWVpMjFvL3hmYWRGMkFoQWRlSWNRMkw4UEdzLzRSRllJ?=
 =?utf-8?B?VmNTRndaUEIwVGpqOEswUml0cDRBdkZvQStuNjFKRCtOUEZjRjU1RXhxY041?=
 =?utf-8?B?dVR4VVRCRnk2MC9HUjR6aVl0N0szWFVHRnlMY3hiY3N1MjNOendySm5QN2Fu?=
 =?utf-8?B?TXdoc2ExQ3lSb0lVWWNld2RWNEc2NmtNc3VNdkJXR0tTVmxYVHpqRkVRV041?=
 =?utf-8?B?M1NIS0RyM2UwNmNndjdOdHovQ2EyS0pvRHlCTFFvUzdHdWdnUitnd1hlc3gz?=
 =?utf-8?B?RHRTMHVnNkZ6WldITFVzdGQxakptWC9ONHh4NEQ4ZHoraTFwWHpUTTZBbGI5?=
 =?utf-8?B?bGRKQmRZb0F0L0U5MExYaWNhR3NKdXdVQ1pIM3I3dzhPY1I5Z3JIb2I5TFVl?=
 =?utf-8?B?bXFDaUJNUUtWRDdKSFFocEUyQ0NyY1FwWWhTYUoyWXo0VWl4TVhxdlhKejY2?=
 =?utf-8?B?QzBwdUFuenRSNS9qTHRhT01qc2lZWFVXbllMOW9EbW02T3dqRmQ2TzFWbVA3?=
 =?utf-8?B?ZUdpMkxOK2NYQ2N1UlhvN01ieC9zdXVsM21TUHpyTlZKSnY4WmtNUEJFbzNt?=
 =?utf-8?B?dG5VR0FBWlNwQnpSWUxOU2diNXlkS0lRU0dvbHRVZEdhR3JIZk9aNC9ieGFq?=
 =?utf-8?B?YkZybjI2MnVrR2RnNnpkenVaY0c0RkozWkRMZmM0NXM2V3JrenhoNlhONG1Z?=
 =?utf-8?B?VEpldmkzeWNvK3hRWnpFZE1oV3JQN3JJYW1HM1JRZkZCdGhlQTMvRGxwaGEr?=
 =?utf-8?B?Yk9mczRuZnNTZjNHVUg4VExpKzhGeHF4QnpUa3I2bVV5K2xlYWJQYVU1c1E5?=
 =?utf-8?B?eUsxYkJMNlVUN3lSMjltQVBMcWR6dXpKZXJRTHdBbmhTb2NuZ2ljandqQzZU?=
 =?utf-8?B?OXUyb2ZsUlhSNFJTSFIvSTJmQ2tBSFVuMTZic3orZWRERnY2UWk1ZmppNEFo?=
 =?utf-8?B?UlVPWWJHS0NEVytBTFBjdVg2M1pUa3JJcXlFUTJKSXZTWk5vK0ZxaEpib014?=
 =?utf-8?B?aEtzODUrK2dSQ1JtUXA0L2Z1UkRscUFUK0tzd2ZDdEhaWDd2di9mN3BKWVdG?=
 =?utf-8?B?Qm5vRzFLZTFhckExdEJ6dnVoQ0RYbEF5SEIrckZMVGtBdS9rVWlDbHMrZnh3?=
 =?utf-8?B?c0xld0hYSkcwUy9sazNXMGVGQkVIcE5OaGx2Mm40dnZETXZ2VWZ3SlJ5SWlZ?=
 =?utf-8?B?SGxYSFpPYkw0TTYrUm5rRjBrQVEra016Q01Za0FZUUZ1QnNXdjNTdjlTaHor?=
 =?utf-8?B?VEFVS2JXSlhBOTJMeDIxS0xuYzlnZFhOZE4rbk1NaWhRZTg4ZDlheUNGVmlI?=
 =?utf-8?B?SUVRWlcrdzd0MktoY3NFZXY5ekNJRVVwRXY1QjVNV0RrWFFnVFo3UnQyZjVX?=
 =?utf-8?B?SUF6bUdzRmNvUXM3dzVCMzFwMUhaMk0vWWlGT2RsQ3pqU04xQlBSR2dKaGNP?=
 =?utf-8?B?bTRqOEx6cE02N2ZUdzFHSkNLT3l4WnBRdy9hczhmTHp3ZHI1UXhsaDl0WnNK?=
 =?utf-8?B?Y0lranBKTlJWOUdicUk1YStnb1hhVFREZGhlNjcwV0hYN0h6eWFNVENTL1VR?=
 =?utf-8?B?aVpwK1cwcm9lM1ZDQ1lKZzlVNWVGV29VQjZXVXRoNnM5ODlxWHNQcERkMkh3?=
 =?utf-8?Q?ANBwUebX79n6l+C946dxCSwjNi6Ih28N1g642?=
X-Exchange-RoutingPolicyChecked: EkBvrxwlYC7zFhDyqMAxyezoVw1bj2AzR0n+zt+J4bjDUzRrdGxjWxPxbxkeWc2xZF0lminpefpetr6uTJv1bagn2hWdwsq620l0ONkEnKJRLnBxxW7r2MGl18GT8w/18e72aU8zc/90r96eyYbg84y3Wc4QUklbr1neI5kTwUh0QI5zNBME8TIVz9Wc+RXOyzWpLLmLS6ekQYnpT3c1r8wnXoYAHs28mUuDDZTYyUD5iRUOK2QtOy804KFCnAOkwVaRUfm1p633NoYLrb18ucGdHbGZeFfv1DJF67mahF0aaopTBdlBbRYkHlAjcy+4pQhjsYWhbqbKGnO+66zqSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 858cd98f-6f8b-4bd2-c499-08df087da095
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 23:06:17.0757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdRLJhAUJeUiFGPMIXpv/5fF1zjierKu8GHnzTpWvyBS3kiGpJgGUbblL0n8DRX17cu7cDmSxR4WV/AhAwk68hHSCiwQ2PrEGqymfD4A0po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8889
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

On Wed, Aug 26, 2026 at 06:53:22AM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  tests/intel/xe_oa: Add test to ensure entire report has landed    
>            (rev2)                                                            
>   URL:     https://patchwork.freedesktop.org/series/172599/                  
>   State:   failure                                                           
>   Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15735/index.html  
>
>        CI Bug Log - changes from XEIGT_9074_FULL -> XEIGTPW_15735_FULL
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with XEIGTPW_15735_FULL absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15735_FULL, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (2 -> 2)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   XEIGTPW_15735_FULL:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-dp-2:
>
>          * shard-bmg: PASS -> ABORT
>     * {igt@xe_oa@non-zero-reports} (NEW):
>
>          * shard-lnl: NOTRUN -> FAIL +1 other test fail
>
>New tests
>
>   New tests have been introduced between XEIGT_9074_FULL and
>   XEIGTPW_15735_FULL:
>
>  New IGT tests (2)
>
>     * igt@xe_oa@non-zero-reports:
>
>          * Statuses : 1 fail(s)
>          * Exec time: [0.49] s
>     * igt@xe_oa@non-zero-reports@oag-0:
>
>          * Statuses : 1 fail(s)
>          * Exec time: [0.46] s

Looks like the failure here in LNL is a different (new) issue. The oa 
config does not seem to have applied correctly in this case, so the 
report is using bad PES values. The test may have to wait on a fence for 
the config to be applied fully.

Thanks,
Umesh
