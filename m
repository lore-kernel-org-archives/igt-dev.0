Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA9EC88E53
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 14:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA0D10E278;
	Tue, 15 Sep 2026 14:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRNXxtzT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74C110E27D;
 Tue, 15 Sep 2026 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789482195; x=1821018195;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=v4isA3gd0PsiLi31XeDrimYLL2+bWLDvxbdkQ1/VTBc=;
 b=VRNXxtzTpPgjigUzYx3+lWCpKKB+QXFax7hnoIgSA3IU6MXvfDOllt0Z
 aNKwldxcPVSzE9CGpXnSxa+zkWuN8tVW4DiDxYUjHlkYtXFFCa5L0fkWb
 CahQot6+fEL7uPPaSl9qftdrQk9wsMIGqEPRB2qAkEJiQJBM1G+u/hfA7
 OXurksqQ8ozGxNWi2xjMMhvcF5fO6n9NMB+91NOtvXRjluH6DpBxxxT5s
 0OalLSatvYrynpOK75Q5xv1rtvs44ljLcLGF+kfI1ysARzkMnbFau9baL
 l9Mflqx5AhdIQz59JVgLXdEKas8cDWcIhtvrkhNU93wndICbeGXU0nusg Q==;
X-CSE-ConnectionGUID: 3TZKzI8HQQap/ZTpTeJb6A==
X-CSE-MsgGUID: fvaQT61qSXKQVIGPpfqXIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89689894"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208,217";a="89689894"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 07:23:15 -0700
X-CSE-ConnectionGUID: Iyg/PnUNS/2c6h1Tx69slQ==
X-CSE-MsgGUID: qLwKdOjuTMSspTOmxgn22w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
 d="scan'208,217";a="271593373"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 07:23:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 07:23:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 07:23:14 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 07:23:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTh01e6Hn+qEPGsaD/Ramk8OivZ6a65wWWClgzP3N5Hd61vS0OLlIw63LYYYlpByg7rfGhMetTmRfTWRl5mYGnllf8wIpYzD5aKTsOykZOH/kyQoUJGP3dSAdmr5M9mw3t1YBrEKVxKUJX0a0ccgDL6JgA+oqjGOrBDyqc1O1idcAuzNawBr6VpHiDdfS8qUY9rHhBq1MiYCYxT7RbR+zE85NhOIyaxsl+/jOm3qXajNhcw8xc2LhLxO/gpLKUn1NN5fjvmlHrjExODeYJRwe5eufA26voEB2LSkUB4MtZSLQDiHAxiQ2QC1DO6hv/kMZOyaXDgKJrjxNP3fck3Dug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7e4u+LsgmBsoRKUrSBgws3e2ISw40Am6jwWg7/pmjQ=;
 b=kyhjReK9RzrNB+OCdi/t73xdbepbK2ROrStV46aZnqOqwZKkXIZMx3vuh9AApna1HvuoRSKhJVp5EDZzS8+ugOjr0HlwmVfnowG2cWfsiInytP0FD9DR/jbShj9+XXUsXBjg6xIhaeCGQDRvBp4Pr5f/sQaOpzMJ4/jAmNMLbNi+6c835wKFa6swKBIUCSXHyEZFbGKI89wGu4Mgpfy5nLuzqXsxr3gGKhXtEj0d66uFf6JmJeB4pOxhoA8CcLs268Bclcx9eaHTRQvIqs3rMHZCHTRavnFRx/qNn1KKNymGUMctDMEdRVj1l88OngQ31mMxNBIhxF0TNmjqaUPwzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6164.namprd11.prod.outlook.com (2603:10b6:930:27::10)
 by SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 14:22:50 +0000
Received: from CY5PR11MB6164.namprd11.prod.outlook.com
 ([fe80::f304:388:5424:cda]) by CY5PR11MB6164.namprd11.prod.outlook.com
 ([fe80::f304:388:5424:cda%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 14:22:50 +0000
Content-Type: multipart/alternative;
 boundary="------------iCJ7oaGcCtADnJDQfsh1aRwT"
Message-ID: <91919b28-c59e-4a9d-9cd1-728a9af74280@intel.com>
Date: Tue, 15 Sep 2026 19:52:43 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/perf=5Fpmu=3A_Fix_double_free_of_drpc_in_test=5Frc6_=28rev4=29?=
To: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@intel.com>
References: <20260910082358.8661-1-krishnaveni.palanisamy@intel.com>
 <178905698622.147924.8233945162577879176@61270ab9df2a>
Content-Language: en-US
CC: <I915-ci-infra@lists.freedesktop.org>
From: "Palanisamy, Krishnaveni" <krishnaveni.palanisamy@intel.com>
In-Reply-To: <178905698622.147924.8233945162577879176@61270ab9df2a>
X-ClientProxiedBy: MA5PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::10) To CY5PR11MB6164.namprd11.prod.outlook.com
 (2603:10b6:930:27::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6164:EE_|SJ2PR11MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d1c5c3-2146-4cf4-267d-08df1334d267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|13003099007|10067099003|4143699003|5023799004|56012099006|11063799006|8096899003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: PN0zNruN0gm8jnt1DYs0YLfqpO6oTSVpnEo+11Ao60QTIbaISAMCTMCUEpN6Q594NfhuyHhPGOvYb76ZPBeHSd6iFy1s47On2Otouo1OJsIrP5AKDcNKxU5ieDKHsVuNllijAdJ+bJAhBsscKIOWWkoAHv6+ftJmGrR+3vw6M7Dsaq7My8Ch25gzJevkpRpYmUIZJ+v42rWSl1MccY4Vl7ans2EBhR8B3/NbMiRcVmqUw90gKabxp39AJ4LeS3gNmzd75WtUrrDJ+OO26VZti+/ywzbPxalefXxHUZKMHVvxVr0YM6t5lYUCFuQi0BCDkH+egcEDKQRHktu6wmvb15J+bHsIKIBrh/fI37SEFTrlcR6PUIMdSwJGcaWRrzkg8o6pkjRjgJXkecZRybX4HvW+eXckiOrgMt15PaVkt0XiuzEcCE7qEJ86R23yr+EcZ0kKHF+u43o0QfkqpLemfhiacmuSWIiVNALyFmrwbca1mLOVw86a49iaJaMFH07T+xQpDIsFSKCkuds1w10mszCnFwoEkM1J5oJwSot9A0eeANZ39x/Q9TVbhpY7kTHuM+jPrjUUIqL57Y1XIjgr5nkIaNNgHLIIo0A/EFbjg34=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6164.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(10067099003)(4143699003)(5023799004)(56012099006)(11063799006)(8096899003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDZXU3RMaG9zQmljYytvdXFYWVR0OTV1dnd3aTdGcFFiL2g3WlJGRFdza0NU?=
 =?utf-8?B?dENzc2RqZWc3RVpISjQ4VG5xQXBGVW90WktWQ1Y4OHM0NFhwVVJZNXgvQWJQ?=
 =?utf-8?B?Z3orNHRRZ3BLR0ViRjl5R05RYjVxTUZ4SnhCZ0U0cEpXRzY2d0hLemlQSE43?=
 =?utf-8?B?ckswdXdFM1JwNEE5dzY0Sy9BUmFvR1FqaEdwaEY2aktFNFZCQ21seXF5TFll?=
 =?utf-8?B?bTJnWEFiV2xUUVFOYWQzdkxEaHBEYkMzRUFGdjJtbzR2S2dTcVdLZ3lRNnNh?=
 =?utf-8?B?SWx4R3BvNzdEaTMrVTNXd2syazI2M1FZcnhNQy9iUWxQb1RSM3YzKzJuRHNJ?=
 =?utf-8?B?NDd3dHNwMDRyOFVYRVA0Yit2enNud0tQRUllc1MyL0d0R3dKZ3NXOHliUVV0?=
 =?utf-8?B?ODF4K2l2ZiswYjMxZmhPanJnRm9PTERnbVJSRlZOd2Z1cnpDQldJaGlkMFJo?=
 =?utf-8?B?MnMxTjdPMU9KZm90cFVVQTBRSWI3UEl1RXhTamw0VVcycE5YdTFMUktKVUJ5?=
 =?utf-8?B?T0FRNGV4cG5USnhRd2FyR2wyUUJKMTNBenFQaHBEZytYQ2IvbCtaUk5BRUhD?=
 =?utf-8?B?Z1krT2VJMFJiMi9VTnBkZm9FMnZQQ0lock9zQjlza1BrTkpha1FpL0orWS8z?=
 =?utf-8?B?VmhhcnZlOVhCNkQ4MGdaUytsVGh1eDFDU21CMmlhKytVd3FDb1BUOVZ6RjVU?=
 =?utf-8?B?WmxwajZ2Zy9OYzFSd0xWdFhvTUgyQnJ5Nk5HbUhiTEhDY3p0b2FVYVRkVzVH?=
 =?utf-8?B?b2d4SmhSYXVlNzRabG1QSHVzOWRVZlgrTDVyaHBRNndNeGIycExmLzE3QlFP?=
 =?utf-8?B?OER4emtTaG9pVGVoZWIzR0Y0Q1lWaFRhVVA5SVNnYVV2bGZrMzRON0xSSnll?=
 =?utf-8?B?Tnh1TGx0ZGpIUWdBQ20rTzN1MktYdHVtRlluTU4zNXFqL3JjL3RMZ2pYTWht?=
 =?utf-8?B?b0NMTWFweEY4TWlpWkVycnlMR3RBVWhiLzdXM3RuNlh4enVnRE5BR2pldngx?=
 =?utf-8?B?OU8wR3B3L09hUmtnL3VQUjdiZ0wzS2w2ODc5cGluNnZRUm1JSzkxZ3NZUW5J?=
 =?utf-8?B?UDVIMVB2bTNXc3BZWGR0NlB5Z2ZlSVpiT1pXLzF6NUNMZW5OZ0g3RER1cEpr?=
 =?utf-8?B?QW9CODQ2WU8xdGJ0ZDBNakEvNVJueWNtcWhnRTFjUWNlSUE2T2psRDlVWkFU?=
 =?utf-8?B?TUhNQiszeDlaZnNPbFJnK1YyWDVkT2c4ZXV0Nlk1Y3NZR24xRDBRMndHSjAy?=
 =?utf-8?B?djRvcDJVTGJrV3hReGVCelNGQmxJZUZBVlUxdndjcnFocXJBQnBOY0R5RW1x?=
 =?utf-8?B?QmVSSTE2cGk2MTdRd3dSQ3JacGlqZlN3dFRpU0ZPamxuZDhIMUhFbDFoQzI5?=
 =?utf-8?B?YU9nc1BIcGdJMFo2Z2lvOHRpTFBWWW1UTHY1VlgvaExyZmIvU1NORjRrTCt0?=
 =?utf-8?B?OGVoeGpyK2FkSVp5R3hBdXdKSmxwMUdJWXh6TUtlcGhvWTIzYmhaQUpmdm9i?=
 =?utf-8?B?Z1RWMFRJamh0eldUT2E1MTlzV2E3WHFXU1JCVjJleCtqNXprUHc4N1k0VmJr?=
 =?utf-8?B?a1d4WFEvYnJSR2pvMjNZYUFQWU5lSWY4TW1pUTNCTFJpZC9pU0VwZVZJOGtt?=
 =?utf-8?B?WkhCNys5T05TVTNGdmxSK1R0bmU0OFR4YUtyd1FVVTF4ZnVNdjRFMG5wU2h3?=
 =?utf-8?B?cytWTmFERzF5VmppZm14WUtYSkJrWTZrMFhKY1dEMGZUQ2xOTk16dXVJaVJK?=
 =?utf-8?B?aEUzTU54ekR5OEcrL25pOXMyblk0QnVFNm9taGJ6OTBmTGx3Z01IbmgxeXJ0?=
 =?utf-8?B?MDhzMUxLcmVNOGNYL0dyVXBaWkU4eWxpK0tjZnRGdG9EQVZqN3JzeE55OWFR?=
 =?utf-8?B?b0xvblpFd2NMZCszRVRTcS9sQ0Z0azNLWXE0b1BWemdHaEdIS1UrWjlrWnZK?=
 =?utf-8?B?WGdwUkVTZGF5eVBIem12QlNyMmh0S3JJTU01cmNydDBpRkhyckRkaFF4b0lS?=
 =?utf-8?B?MHdxNHdzd3ZyVzdHUzhHOC9tU0NwMCtEdHVYSjM1UCtFMDh5bEJab3hNRnFq?=
 =?utf-8?B?R1lsLzNQME9Wa2t2OGsvaFF4VjBVYmlmc2c0eHVPVGk3dGZiNWhHaGlKeERI?=
 =?utf-8?B?OFI2Ym5ZRVlYbld6bHp6NXNCVW1DT1BJSGRweVNqNDFEaTFleHE3Mk05NWd2?=
 =?utf-8?B?YTJRMHViVUNGSS9uNThWV2M5dDlrYWZRR0RwcFQ5bTNGMVBreVlRN0JPdXg3?=
 =?utf-8?B?MFNZMzJOMSs5ZDMySE4wVE5idzcvb1BvQ2VXRHVsK2NmbENIREtlVThQZTVv?=
 =?utf-8?B?bG0wSkZEYnV3Nkw2WXhiSDJrNXY3dVR5RXk3YVh0dGRrOXJZT0RtbTRleGNS?=
 =?utf-8?Q?8isUnfICFt+pkuMVWjgAFd9yPtdvOruQVoM+n?=
X-Exchange-RoutingPolicyChecked: FDXdQ3ztu1FhClTpRKhHrsNM7ZOArSRthR/07iAsckWQXvLPyU1WW84EaC4xa8302wu+/Gjoz2pxKuF1EwQ4M7l6p2CdxYziTiV5IA9S0QFNZnAycyvm+fusur5qrRyi6/+PyVQ+n/AyAE4UCMyakyuUHZyrF6pg9Ns8mPEe4klXiGe83yEi/bnqjGVEDZFYwGJ9+6lF8/uFl4apASk3miBWEVDuu3KVl3/PcDmB93G2P9xctd37wYXQ2uns0UgXrVFvPr5a2G50pWcUXE2f9ED2fySI3c3ETdntuTiq0isMrsBHa2LmeU2EVumTNk7kK/xh/ArIXCfgTY4BnXrwjw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d1c5c3-2146-4cf4-267d-08df1334d267
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6164.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:22:50.2894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Dfs1BQ4FuAq/+obookQmqwVp+6WRzbwtjWTMntrc91GuRvtBeaHALZkkO4zVY41x2LgOIov4FPe2iCgoeMxxF3VRZNBIBWibTEoxVSZkGnM+rYNHyoZ1Ikr4Y7rsaGs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7619
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

--------------iCJ7oaGcCtADnJDQfsh1aRwT
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi ,

      These failures are not related to the changes which I had made. 
Please re-report.

Thanks and regards,

Krishnaveni P

On 10/09/2026 9:46 pm, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/perf_pmu: Fix double free of drpc in test_rc6 
> (rev4)
> *URL:* 	https://patchwork.freedesktop.org/series/173664/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15824/index.html
>
>
>   CI Bug Log - changes from XEIGT_9088_FULL -> XEIGTPW_15824_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_15824_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_15824_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_15824_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@runner@aborted:
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15824/shard-lnl-8/igt@runner@aborted.html>
>
>
>     Known issues
>
>
--------------iCJ7oaGcCtADnJDQfsh1aRwT
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi ,</p>
    <p>&nbsp; &nbsp; &nbsp;These failures are not related to the changes which I had
      made. Please re-report.</p>
    <p>Thanks and regards,</p>
    <p>Krishnaveni P</p>
    <div class="moz-cite-prefix">On 10/09/2026 9:46 pm, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:178905698622.147924.8233945162577879176@61270ab9df2a">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">@scope { td { padding: 2pt; } }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/perf_pmu: Fix double free of drpc in
              test_rc6 (rev4)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/173664/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/173664/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15824/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15824/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_9088_FULL -&gt;
        XEIGTPW_15824_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_15824_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_15824_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_15824_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@runner@aborted:
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15824/shard-lnl-8/igt@runner@aborted.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <br>
    </blockquote>
  </body>
</html>

--------------iCJ7oaGcCtADnJDQfsh1aRwT--
