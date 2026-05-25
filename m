Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FDBCD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 14:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E3F10E14B;
	Mon, 25 May 2026 14:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRsb4GmS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251FB10E112
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779718968; x=1811254968;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=hRVJ2SJzxz31szz7Vv8tqW4V6qg9l9PsvsKqoCQiWE4=;
 b=lRsb4GmSCecOtSNEHdkbh8igw0ogLrNQf53z3FgE6jNmT/+LhJ2M0eeq
 wZtl3MK/cJISynAD7iHx0uRxRpmMycDcdVnIvzgHduDhB/T6K8OD5nLgU
 /MgYuB2nLbhTFRxWear65QMOY4B8xL5YbWaPEwN0k0r2tDvaQ0EZ8Dwdt
 14ldLhGMIxcXcSaaMH4cAoYM6N6QzJl7Fz2AhDnW/Kvnfd4QGPDloCPmA
 DkaSG+PRYIOfrNimyE+WleQCezirISupKk6plECSp5Vso4WSnuha3LTu6
 6D0eiVNz0owqpG+eoI5HdTik99HPlWWQAA+u/NndZthCYwdV68I8kUEsp Q==;
X-CSE-ConnectionGUID: 8qB2cjUlT0uFCM1sdfa53g==
X-CSE-MsgGUID: e7q7YcmJTRePOLG84cgE1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="79574753"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208,217";a="79574753"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:22:47 -0700
X-CSE-ConnectionGUID: 3KyAdBiXQCiHOtACWpjQ8Q==
X-CSE-MsgGUID: Lky48/5bSXC1lWm4zi7xyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
 d="scan'208,217";a="245899587"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:22:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 07:22:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 07:22:46 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 07:22:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmHcE+R0S/rJw8THynhEQ7OEytFc1zI8DUfcphg9nKCKPHVhRPCVU7Oz8KTB0mHJUdEJvAadMJLSDQzVL2jg3Qb+CS+qfG5kwbQZtliVb2dKOfLCWtPp4aDuu5ZSPOtsBU5L7KB35lVeKYDlnmIzKr75JmV7Ap/6SLB+VmoxCtkY25JQRnf9JY4F9Sgbl5l3eo+E6pQzxJu7Oasezcd4ilJDHfcdh3PEJeUTulVwc82ypJtRbM3oTzfxxvonMmeUk2RK9FMnqPU9x3f1qiY/keDNF3z3ulXDaU9oPJkqCr5guix1aRjaAvFXoRTZE9OVzAQpHzC+m0Z3uF5n8pgcig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTRD4nJES7s0hz6qpG8Jc+QMKKvC7HtjSRBr7sVDBMk=;
 b=JMrW059xUNB4iQcGXMNG58OnZYI0l5ENtszMCqgEav6afQsOcTDY4aHW3PoIM7pn1PHnWuSluFfsqwHFZpKgdEdkDoyOzZ7iel5tglLa87zXldTHmifOm69513b6ijxHd3pQrTNqzxGVfQHF+QXPRFEXxjlkQICnFcbICiltEAwSBNLNTsyuUafP1FGawQP8GGYn+pRu1jSXkuMBU2cqpDNAlK8cBsCQTMLn2Ky+Mdu/8yrIyyaWI7UDOERW6RX6XVodp/g7s1x4Vj0RoaIvaymA49EHGr6lNiFLDrobD/A3TTGMWb58IojdoK3RNMCCs1lGhmWRGluF57H5TtPdFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by PHXPR11MB9661.namprd11.prod.outlook.com (2603:10b6:510:3cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 14:22:42 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece%4]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 14:22:42 +0000
Content-Type: multipart/alternative;
 boundary="------------sDbzWJFC3Ewy0mEu2p6BtLSv"
Message-ID: <864708d3-40c0-4519-a011-1194af04d171@intel.com>
Date: Mon, 25 May 2026 16:22:38 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel?=
 =?UTF-8?Q?-ci=3A_Update_VF_and_VM_blocklists?=
To: <igt-dev@lists.freedesktop.org>
References: <20260514165723.10559-1-jakub1.kolakowski@intel.com>
 <177884491494.75062.15895179908110958981@5ab824fced77>
Content-Language: pl
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
In-Reply-To: <177884491494.75062.15895179908110958981@5ab824fced77>
X-ClientProxiedBy: VI1P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::25) To IA3PR11MB9304.namprd11.prod.outlook.com
 (2603:10b6:208:57d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9304:EE_|PHXPR11MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: f81209b1-8cfe-42a5-310f-08deba691544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003|13003099007|8096899003|4143699003|6133799003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: muG4TJvolfSuqWaw/7XIw54LQXmysqWdvh4VsmPfnLMrLDbEaL+H4XLh+PDqLaeaolMpYXreUAbImEwk8j3d2sE9YcCAaxvb6/MDGZ3f4vjkVxHp5+i9l+PBct3yhUx9oDoMhE3uiMeYJnp3rp6V0I/ay3PbGuCyb18FdwsR2KMStZT21yzjJgoLeHw0O4dyxQNnA0KIZlciXf6PBIKCkj938NKodhmyUqeQsNG+ghYp2lRdW0bTnCaEC+AL2UV90vVfjKgjyN1YX2DUjxoQEeY5tjx3Mob7WqDKLLeMPQpO8kjwoj+T6LH5Y5+QlwqskGtukIiCULWjROO/6Encb6j387ToPlifxw1EOnfPXhSgjTgCz/nSWK5VzNHaBOsRIaqYeDUfIvUquOpxTfpsJ8nZegGiWcxEAtM6jak43HvP4m+ZZxEog2NeFcJAiXbQ6SMcpzEJxdWQni2ghHHIOFd5CDP0PjM7UZ5IH5KhEK8aqne2wlMZYWIBDMiFgPatKQVEGfrY/v+g8Jk4qqNLNHTs1Br2bZUfJYcqNT8FVRScpZUyf2qA9yuiwSbSSpI5oTuIRb7OAK8Nlx1vJTcc68p/XThnvofOv7ErZzU6KJKywa7hHoUsVIy0w6/MPbCJLoj0KSv/8ice7TMKx/yo2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(13003099007)(8096899003)(4143699003)(6133799003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9IOU14dUswVEtUc3NRK3ZIUHF5OXU4Ujd5YlN0WHR6M2JUTEJpMnMyczgz?=
 =?utf-8?B?WXJPOVdGUkFuRmU2VHk0OW4yYkxvaTlkTEw4OWQxVGlQRCtWVHo2K0svQzFJ?=
 =?utf-8?B?dzQzQUxMZE04alVJUEdkM3lZYVdBbU9sOUJyU0xRWW55RlpPdzJ3ckNXV1FH?=
 =?utf-8?B?Q1p6THdYVElESFNiVEZQTUFqSHJKTHdDL3ZpdkxTclZGVlFTdW5VOVZ5NGJh?=
 =?utf-8?B?TExpQmJvY2RBWTFCTXA4RnlPRTAySnFESzlrU01nZUxiVnFFeFJuZ0RMVncr?=
 =?utf-8?B?c1IyazN2U0tBcVNCOG92V2QzdWlRdVFrdTBXVkc1VFhIbEZsOGF2VGNDamVE?=
 =?utf-8?B?eUxIZWNUQmJBRTg5cGZHbSt2TFZDTHhZd3NrdC9tUGlmajNPL2EwNmt0WUVq?=
 =?utf-8?B?L1ZKUXlFcmx5NFMweThNWnFoM1RvdkY0TEZtV1ZhV0tFelk4eGJtb0xsRit0?=
 =?utf-8?B?dkdIZHZpUnBDTE5pM1JXNlkzMGtaNSszZkoxS3E4azJreHJkVjkvenBtTHN5?=
 =?utf-8?B?OENtWE9mUU1zRjJyU05scHBIUXdUNWJpT2lvL2xCM0h5eUVxOHB5NStYands?=
 =?utf-8?B?YVI0ODdUUGU0SlN4cXBjVGJDTUlCazdmVGl0VFpnbXZKSEszVjRkUVgzb0FL?=
 =?utf-8?B?Mlhha202UUpTZXhjMEpyKzgyN0wxYlhzQmRJbDQxZ2pwZ09rdXZVYVoxT1o4?=
 =?utf-8?B?Z1R1WVQxSUp0TVYrcStMOWlmandDVG1mYzRaLzFFNURxOFVQWFFCZ3FMWGQ1?=
 =?utf-8?B?RFViWSs4VlZNYnNKdTh1V0NPTVZibGRZUGptcU5PMWtOKzR6VEIyVk1lY1RY?=
 =?utf-8?B?MmgvQWJ0dWtXNSthTURRcURKcHllQkVuWDdJSzZnSXkvS2p3YVFUdUdIcEta?=
 =?utf-8?B?andtamtxNE1Bei9idFEyZlBEc2JtbDRrQXhMelRWaTVsenpsQkhtZFJKZDND?=
 =?utf-8?B?SHNna2FqMTU1MklLUWN6YnZVN0QxREZ6V3k2di9Ib2NNNEpLUVowOVFmQXo5?=
 =?utf-8?B?ajcwK05RUEJFU0hpRTlCYWs5RmI1VzFUa0VhSjVlZGlEQW1udUg1SWlTVTI1?=
 =?utf-8?B?KzE1OEFXSG9zT2dWUHh5WkZWN29VK0RtQWJyUDROTkx6NmJlbWxxL3RTblVU?=
 =?utf-8?B?ZEtJeXVuUmtvY1JoKzY1VHovUk5MckpUS25RV0UxcVJnNzlQNGI3Mzl1bnky?=
 =?utf-8?B?YUdyNGlla3JVbSs1cGNQQ1Fkd2NOYjlTY1I5b1R1eHdscTlnMUtsZDh6cVM0?=
 =?utf-8?B?anFBN3FuSEZoZmJIaWtZRW9qcm9xSFpkOVBpem85czByemoyWE0xZUtkNk9q?=
 =?utf-8?B?YXBkWUNIY0MwdkQybEtMeWZCWFhLTGQ0Umdrd2VIdU8xRFUzdmxzNjBzamN5?=
 =?utf-8?B?Qkl3eFhHYWUwakZvbG9BQksxSHNOMEZ4aFhJdXdEK3M3ZnRNbGZxaU9IZm1s?=
 =?utf-8?B?QjE5U29XWGFaS0VPcHZvdisrdC85N2E1WER2NGZBbGhCRmJ6aWltWW5YcWVx?=
 =?utf-8?B?YmlackRUaFUyWEZnRTYvaWc2OWNRVVVHbU1ocE9uSm80ak1SVGxPY2Q3MUhm?=
 =?utf-8?B?VVNweUtmR2lqSHlCR3luOGRrZEVmSzYza1I2SUxPdGxIMzUyZks4SDl6REpK?=
 =?utf-8?B?dERjSGpKUmthZ1dlYUZSa1VtMkZmeVJ3RUFvTmQxbm14ditLSHdmNG1ZL2VW?=
 =?utf-8?B?eDVDOU9YRlRCaHUwRVNlNmxpOUJ6bkFxaUlJVnV6V05yd3BSa2IyR2hEcTUv?=
 =?utf-8?B?SFpycmNDa1pUWlN2WEpKcExQWjU5T21ZYUZXQnNzVVlXY0RJcmJuOWtab3p0?=
 =?utf-8?B?clE3bWdYd2lkcllEQ1cwVlUxM1VTcWtDT3RhanBvMy9kWmJ1WllqSSt2UEs5?=
 =?utf-8?B?YUZ5dWtzT2M0cCtHNnhwL3puLytPY1d4WVB5a2J2Y3kwMS9JNXczL1V2QWhL?=
 =?utf-8?B?R3YySmVOUWtCRU1PQmg1WDRZam9hL3F6VURWVlhVbVFTUzQ4YXdFVE02VG1s?=
 =?utf-8?B?KzlkbVVFTGpWQXJGMjBmQ0VpaktvZ3EvNkthb3NGVVV5SkpYMTNOcXljYkpT?=
 =?utf-8?B?cmJ6Z1RhWjZrb3lzMkp5cTVSWC9Cc2duRjV0RjFzTGJxTGtzM3E4eW5GdHl5?=
 =?utf-8?B?YldTbEFCcW9ka1ordnBsakQ0N3ZFdkFuMHNIbXRKbDRVLzdVYU9ZUkd6UDBR?=
 =?utf-8?B?REwrZ0RrUSt1dThhTmtWaXhKNEFJSVFCWjc4RlRpUENuQWx0eEhuN3UrRjZ6?=
 =?utf-8?B?SmtKREREU0Ntb0VJazd5SDlaanVmakZOTUtwS2ExdXJpNUptODRVZG5mR1Yz?=
 =?utf-8?B?Ym5nM0tJSXVLcDNjQmxjSUx6alVUUVAwcjVOYWY3N2h2U2I3bS9BV1NWQ202?=
 =?utf-8?Q?LO661E6nhxb+IQJ4=3D?=
X-Exchange-RoutingPolicyChecked: Cd/Iy9OTx73ym+Ow1fJeipboSzAonC8dREtkcqLHgHbt2ibSkXBiNQP4mWW1c/vPvPjpaBRKtDmBQuWiWrnMz5raAB/ZdaEInw73pq1+riLUiwtGmbDkZDV/PTCUWRJoFafC5LbT/FT7Pp27JJ38vnzlybc4A5vh0eeyGGW+fIJLaQXYVzUQ0ViCzmgY1dSwTw3zT1OGMsPF+bfFnNqqUbdR6AVSma5U+CKvvMHF61s5gi3/ZqX3nRYl7Lcb46yV2OmxlJI4eGNHw1RpNyTlsEeBUxdon7CEgwF0fAJ+TfTP5orj5WiVPeDj6tT/1KBXV0Xi4IkPGrauIcO1/p7rtg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f81209b1-8cfe-42a5-310f-08deba691544
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 14:22:42.7683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OFgKN9iu4aVVbRt5QVcLvrekXCjqYMtjUhUPRPB5uFb/xIX1A7G7Zyd3kH/IRMKNNx5XSPqoBtVTLf7TcUjnevakW+jV/Qf29RlqaA8xeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR11MB9661
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

--------------sDbzWJFC3Ewy0mEu2p6BtLSv
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 5/15/2026 1:35 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel-ci: Update VF and VM blocklists
> *URL:* 	https://patchwork.freedesktop.org/series/166584/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/index.html
>
>
>   CI Bug Log - changes from XEIGT_8912_FULL -> XEIGTPW_15185_FULL
>
>
>     Summary
>
> *WARNING*
>
> Minor unknown changes coming with XEIGTPW_15185_FULL need to be verified
> manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_15185_FULL, please notify your bug team 
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
> XEIGTPW_15185_FULL:
>
>
>       IGT changes
>
>
>         Warnings
>
>   * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt:
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#7905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt.html>
>
unrelated to this patch
>
>  *
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_15185_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_setmaster@master-drop-set-root:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@core_setmaster@master-drop-set-root.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html>
>         (Intel XE#7808
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7808>)
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@intel_hwmon@hwmon-write.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@intel_hwmon@hwmon-write.html>
>         (Intel XE#7445
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (Intel XE#2370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370>)
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (Intel XE#7059
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059> /
>         Intel XE#7085
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085>)
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html>
>         (Intel XE#7679
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +6
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-max:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-10/igt@kms_chamelium_color@ctm-max.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325> /
>         Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>)
>  *
>
>     igt@kms_chamelium_frames@dp-crc-single:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-single.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +2
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-8/igt@kms_chamelium_frames@dp-crc-single.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-6/igt@kms_content_protection@legacy.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178> /
>         Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304> /
>         Intel XE#7374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321> /
>         Intel XE#7355
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x21:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-64x21.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dsc-fallback:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html>
>         (Intel XE#4331
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331> /
>         Intel XE#7227
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227>)
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373> /
>         Intel XE#7448
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656> /
>         Intel XE#7905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +26 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-blt.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +27 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-1/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff.html>
>         (Intel XE#7905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905>) +2
>         other tests skip
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_hdr@invalid-hdr.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html>
>         (Intel XE#7922
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922>) +1
>         other test skip
>  *
>
>     igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html>
>         (Intel XE#7915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915>) +1
>         other test skip
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-7/igt@kms_panel_fitting@atomic-fastset.html>
>         (Intel XE#2486
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +1
>         other test skip
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html>
>         (Intel XE#7130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130>) +1
>         other test skip
>  *
>
>     igt@kms_plane_lowres@tiling-x:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-6/igt@kms_plane_lowres@tiling-x.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_plane_lowres@tiling-x.html>
>         (Intel XE#5681
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5681>)
>  *
>
>     igt@kms_plane_lowres@tiling-x@pipe-c-dp-2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-6/igt@kms_plane_lowres@tiling-x@pipe-c-dp-2.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_plane_lowres@tiling-x@pipe-c-dp-2.html>
>         (Intel XE#5545
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545> /
>         Intel XE#7774
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774>)
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_plane_scaling@intel-max-src-size.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html>
>         (Intel XE#2685
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685> /
>         Intel XE#3307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>)
>         +12 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) +3
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#7340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340>)
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html>
>         (Intel XE#2499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3
>         other tests skip
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387> /
>         Intel XE#7429
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429>)
>  *
>
>     igt@kms_psr@psr2-sprite-plane-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-10/igt@kms_psr@psr2-sprite-plane-onoff.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +2
>         other tests skip
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#7795
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795>)
>  *
>
>     igt@kms_rotation_crc@bad-pixel-format:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html>
>         (Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904> /
>         Intel XE#7342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342>) +2
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>         (Intel XE#7129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7129> /
>         Intel XE#7774
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774>)
>  *
>
>     igt@kms_sharpness_filter@invalid-filter-with-scaler:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-scaler.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>)
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-10/igt@kms_vrr@flip-basic.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html>
>         (Intel XE#7636
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug_online@single-step-one:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-9/igt@xe_eudebug_online@single-step-one.html>
>         (Intel XE#7636
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636>) +5
>         other tests skip
>  *
>
>     igt@xe_evict@evict-small-multi-queue-priority:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-priority.html>
>         (Intel XE#7140
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140>)
>  *
>
>     igt@xe_exec_balancer@twice-parallel-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-4/igt@xe_exec_balancer@twice-parallel-basic.html>
>         (Intel XE#7482
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-userptr-rebind:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-1/igt@xe_exec_basic@multigpu-once-userptr-rebind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd-smem:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd-smem.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>)
>         +11 other tests skip
>  *
>
>     igt@xe_exec_reset@cm-multi-queue-gt-reset:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-gt-reset.html>
>         (Intel XE#7866
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866>)
>  *
>
>     igt@xe_exec_system_allocator@many-large-execqueues-new-race:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-new-race.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +17 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@process-many-large-malloc-race:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-malloc-race.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-malloc-race.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +164 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +2
>         other tests skip
>  *
>
>     igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html>
>         (Intel XE#7736
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7736>) +2
>         other tests fail
>  *
>
>     igt@xe_multigpu_svm@mgpu-coherency-prefetch:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-9/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>  *
>
>     igt@xe_page_reclaim@binds-full-pd:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@xe_page_reclaim@binds-full-pd.html>
>         (Intel XE#7793
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-4/igt@xe_page_reclaim@binds-full-pd.html>
>         (Intel XE#7793
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793>)
>  *
>
>     igt@xe_pat@pat-sw-hw-compare:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-7/igt@xe_pat@pat-sw-hw-compare.html>
>         (Intel XE#7695
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695>)
>  *
>
>     igt@xe_prefetch_fault@prefetch-fault-svm:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-8/igt@xe_prefetch_fault@prefetch-fault-svm.html>
>         (Intel XE#7599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599>)
>  *
>
>     igt@xe_pxp@pxp-termination-key-update-post-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-suspend.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733> /
>         Intel XE#7417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417>) +1
>         other test skip
>  *
>
>     igt@xe_sriov_flr@flr-each-isolation:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html>
>         (Intel XE#6569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569>)
>  *
>
>     igt@xe_sriov_vram@vf-access-after-resize-up:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-1/igt@xe_sriov_vram@vf-access-after-resize-up.html>
>         (Intel XE#6376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376> /
>         Intel XE#7330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330> /
>         Intel XE#7422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422>)
>  *
>
>     igt@xe_survivability@i2c-functionality:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-4/igt@xe_survivability@i2c-functionality.html>
>         (Intel XE#6529
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529> /
>         Intel XE#7331
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7331> /
>         Intel XE#7388
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7388>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_cursor_crc@cursor-size-hints:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-2/igt@kms_cursor_crc@cursor-size-hints.html>
>         (Intel XE#5545
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545> /
>         Intel XE#7814
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-5/igt@kms_cursor_crc@cursor-size-hints.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-2/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2.html>
>         (Intel XE#7774
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-5/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html>
>         (Intel XE#7915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-4/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html>
>         +3 other tests pass
>  *
>
>     igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-8/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3.html>
>         +1 other test pass
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>  *
>
>     igt@xe_exec_basic@twice-userptr-rebind@rcs0:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-5/igt@xe_exec_basic@twice-userptr-rebind@rcs0.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-7/igt@xe_exec_basic@twice-userptr-rebind@rcs0.html>
>         +1 other test pass
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html>
>  *
>
>     igt@xe_sriov_flr@flr-vfs-parallel:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html>
>         (Intel XE#6569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-4/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325> /
>         Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html>
>         (Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-32x32:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309> /
>         Intel XE#7343
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309> /
>         Intel XE#7343
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343> /
>         Intel XE#7935
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935>)
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +16 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +15 other tests skip
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#2486
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +3
>         other tests skip
>  *
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-6/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (Intel XE#2938
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938> /
>         Intel XE#7376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (Intel XE#2938
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938> /
>         Intel XE#7376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376> /
>         Intel XE#7760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760>)
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-7/igt@kms_pm_backlight@fade.html>
>         (Intel XE#7376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-6/igt@kms_pm_backlight@fade.html>
>         (Intel XE#7376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376> /
>         Intel XE#7760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) +4
>         other tests skip
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141> /
>         Intel XE#7383
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +3
>         other tests skip
>  *
>
>     igt@kms_sharpness_filter@invalid-plane-with-filter:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-7/igt@kms_sharpness_filter@invalid-plane-with-filter.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_sharpness_filter@invalid-plane-with-filter.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509> /
>         Intel XE#7437
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437>)
>  *
>
>     igt@xe_eudebug_online@interrupt-other:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@xe_eudebug_online@interrupt-other.html>
>         (Intel XE#7636
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_eudebug_online@interrupt-other.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +7
>         other tests skip
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@xe_page_reclaim@random:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@xe_page_reclaim@random.html>
>         (Intel XE#7793
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_page_reclaim@random.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>
>
>     Build changes
>
>   * IGT: IGT_8912 -> IGTPW_15185
>   * Linux: xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976 ->
>     xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88
>
> IGTPW_15185: 7a072a8ba404bc6f06457d2ff1fee4ecf0b71124 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8912: 22222b7d987067331459c2a866e6387a669b7f70 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976: 
> dee34cfbffbfe2196a9332f966b006cd2e54e976
> xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88: 
> 121c16f9d8c56ea07263df84ab971cc10870fe88
>
--------------sDbzWJFC3Ewy0mEu2p6BtLSv
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/15/2026 1:35 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:177884491494.75062.15895179908110958981@5ab824fced77">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">@scope { td { padding: 2pt; } }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel-ci: Update VF and VM blocklists</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/166584/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/166584/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8912_FULL -&gt;
        XEIGTPW_15185_FULL</h1>
      <h2>Summary</h2>
      <p><strong>WARNING</strong></p>
      <p>Minor unknown changes coming with XEIGTPW_15185_FULL need to be
        verified<br>
        manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_15185_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_15185_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Warnings</h4>
      <ul>
        <li>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt:
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905" moz-do-not-send="true">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    unrelated to this patch
    <blockquote type="cite" cite="mid:177884491494.75062.15895179908110958981@5ab824fced77">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_15185_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@core_setmaster@master-drop-set-root:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@core_setmaster@master-drop-set-root.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7808" moz-do-not-send="true">Intel XE#7808</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445" moz-do-not-send="true">Intel XE#7445</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370" moz-do-not-send="true">Intel XE#2370</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send="true">Intel XE#2327</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059" moz-do-not-send="true">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085" moz-do-not-send="true">Intel XE#7085</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679" moz-do-not-send="true">Intel XE#7679</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-max:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-10/igt@kms_chamelium_color@ctm-max.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358" moz-do-not-send="true">Intel XE#7358</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-single:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-single.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) +2 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-8/igt@kms_chamelium_frames@dp-crc-single.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-6/igt@kms_content_protection@legacy.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304" moz-do-not-send="true">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374" moz-do-not-send="true">Intel XE#7374</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send="true">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355" moz-do-not-send="true">Intel XE#7355</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-64x21.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331" moz-do-not-send="true">Intel XE#4331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227" moz-do-not-send="true">Intel XE#7227</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@kms_feature_discovery@display-3x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373" moz-do-not-send="true">Intel XE#2373</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448" moz-do-not-send="true">Intel XE#7448</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178" moz-do-not-send="true">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351" moz-do-not-send="true">Intel XE#7351</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905" moz-do-not-send="true">Intel XE#7905</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send="true">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356" moz-do-not-send="true">Intel XE#7356</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" moz-do-not-send="true">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +26 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send="true">Intel XE#7061</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" moz-do-not-send="true">Intel XE#6312</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +27 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-1/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905" moz-do-not-send="true">Intel XE#7905</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_hdr@invalid-hdr.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_hdr@invalid-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503" moz-do-not-send="true">Intel XE#1503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922" moz-do-not-send="true">Intel XE#7922</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915" moz-do-not-send="true">Intel XE#7915</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@atomic-fastset:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-7/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486" moz-do-not-send="true">Intel XE#2486</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283" moz-do-not-send="true">Intel XE#7283</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130" moz-do-not-send="true">Intel XE#7130</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-6/igt@kms_plane_lowres@tiling-x.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_plane_lowres@tiling-x.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5681" moz-do-not-send="true">Intel XE#5681</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x@pipe-c-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-6/igt@kms_plane_lowres@tiling-x@pipe-c-dp-2.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_plane_lowres@tiling-x@pipe-c-dp-2.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545" moz-do-not-send="true">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774" moz-do-not-send="true">Intel XE#7774</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685" moz-do-not-send="true">Intel XE#2685</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307" moz-do-not-send="true">Intel XE#3307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886" moz-do-not-send="true">Intel XE#6886</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886" moz-do-not-send="true">Intel XE#6886</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340" moz-do-not-send="true">Intel XE#7340</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@kms-lpsp:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499" moz-do-not-send="true">Intel XE#2499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387" moz-do-not-send="true">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429" moz-do-not-send="true">Intel XE#7429</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-10/igt@kms_psr@psr2-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795" moz-do-not-send="true">Intel XE#7795</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-pixel-format:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904" moz-do-not-send="true">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342" moz-do-not-send="true">Intel XE#7342</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7129" moz-do-not-send="true">Intel XE#7129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774" moz-do-not-send="true">Intel XE#7774</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-scaler.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-send="true">Intel XE#6503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-10/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636" moz-do-not-send="true">Intel XE#7636</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@single-step-one:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-9/igt@xe_eudebug_online@single-step-one.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636" moz-do-not-send="true">Intel XE#7636</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-multi-queue-priority:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-priority.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140" moz-do-not-send="true">Intel XE#7140</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@twice-parallel-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-4/igt@xe_exec_balancer@twice-parallel-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482" moz-do-not-send="true">Intel XE#7482</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372" moz-do-not-send="true">Intel XE#7372</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-1/igt@xe_exec_basic@multigpu-once-userptr-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136" moz-do-not-send="true">Intel XE#7136</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd-smem:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd-smem.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send="true">Intel XE#6874</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send="true">Intel XE#6874</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cm-multi-queue-gt-reset:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-gt-reset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866" moz-do-not-send="true">Intel XE#7866</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-large-execqueues-new-race:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-new-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-malloc-race.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-malloc-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +164 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-file-mlock.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557" moz-do-not-send="true">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138" moz-do-not-send="true">Intel XE#7138</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7736" moz-do-not-send="true">Intel XE#7736</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-9/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964" moz-do-not-send="true">Intel XE#6964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_page_reclaim@binds-full-pd:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@xe_page_reclaim@binds-full-pd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793" moz-do-not-send="true">Intel XE#7793</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-4/igt@xe_page_reclaim@binds-full-pd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793" moz-do-not-send="true">Intel XE#7793</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-sw-hw-compare:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-7/igt@xe_pat@pat-sw-hw-compare.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695" moz-do-not-send="true">Intel XE#7695</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-8/igt@xe_prefetch_fault@prefetch-fault-svm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599" moz-do-not-send="true">Intel XE#7599</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send="true">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417" moz-do-not-send="true">Intel XE#7417</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-each-isolation:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569" moz-do-not-send="true">Intel XE#6569</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-1/igt@xe_sriov_vram@vf-access-after-resize-up.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376" moz-do-not-send="true">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330" moz-do-not-send="true">Intel XE#7330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422" moz-do-not-send="true">Intel XE#7422</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_survivability@i2c-functionality:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-4/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529" moz-do-not-send="true">Intel XE#6529</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7331" moz-do-not-send="true">Intel XE#7331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7388" moz-do-not-send="true">Intel XE#7388</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_cursor_crc@cursor-size-hints:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-2/igt@kms_cursor_crc@cursor-size-hints.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545" moz-do-not-send="true">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814" moz-do-not-send="true">Intel XE#7814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-5/igt@kms_cursor_crc@cursor-size-hints.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-2/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774" moz-do-not-send="true">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-5/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321" moz-do-not-send="true">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915" moz-do-not-send="true">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-4/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-8/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321" moz-do-not-send="true">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@twice-userptr-rebind@rcs0:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-5/igt@xe_exec_basic@twice-userptr-rebind@rcs0.html" moz-do-not-send="true">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-7/igt@xe_exec_basic@twice-userptr-rebind@rcs0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569" moz-do-not-send="true">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send="true">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-4/igt@kms_chamelium_color@ctm-red-to-blue.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358" moz-do-not-send="true">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974" moz-do-not-send="true">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343" moz-do-not-send="true">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343" moz-do-not-send="true">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935" moz-do-not-send="true">Intel XE#7935</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508" moz-do-not-send="true">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178" moz-do-not-send="true">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351" moz-do-not-send="true">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send="true">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_panel_fitting@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486" moz-do-not-send="true">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_panel_fitting@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283" moz-do-not-send="true">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@brightness-with-dpms:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-6/igt@kms_pm_backlight@brightness-with-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938" moz-do-not-send="true">Intel XE#2938</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376" moz-do-not-send="true">Intel XE#7376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938" moz-do-not-send="true">Intel XE#2938</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376" moz-do-not-send="true">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760" moz-do-not-send="true">Intel XE#7760</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-7/igt@kms_pm_backlight@fade.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376" moz-do-not-send="true">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send="true">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-6/igt@kms_pm_backlight@fade.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376" moz-do-not-send="true">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760" moz-do-not-send="true">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send="true">Intel XE#870</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439" moz-do-not-send="true">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141" moz-do-not-send="true">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383" moz-do-not-send="true">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836" moz-do-not-send="true">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-7/igt@kms_sharpness_filter@invalid-plane-with-filter.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-send="true">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@kms_sharpness_filter@invalid-plane-with-filter.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send="true">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848" moz-do-not-send="true">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509" moz-do-not-send="true">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437" moz-do-not-send="true">Intel XE#7437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@interrupt-other:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@xe_eudebug_online@interrupt-other.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636" moz-do-not-send="true">Intel XE#7636</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_eudebug_online@interrupt-other.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372" moz-do-not-send="true">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136" moz-do-not-send="true">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send="true">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138" moz-do-not-send="true">Intel XE#7138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_page_reclaim@random:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@xe_page_reclaim@random.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793" moz-do-not-send="true">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15185/shard-bmg-2/igt@xe_page_reclaim@random.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8912 -&gt; IGTPW_15185</li>
        <li>Linux: xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976
          -&gt; xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88</li>
      </ul>
      <p>IGTPW_15185: 7a072a8ba404bc6f06457d2ff1fee4ecf0b71124 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8912: 22222b7d987067331459c2a866e6387a669b7f70 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976:
        dee34cfbffbfe2196a9332f966b006cd2e54e976<br>
        xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88:
        121c16f9d8c56ea07263df84ab971cc10870fe88</p>
    </blockquote>
  </body>
</html>

--------------sDbzWJFC3Ewy0mEu2p6BtLSv--
