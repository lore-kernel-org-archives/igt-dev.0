Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD32F30922
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 09:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BC010EBD9;
	Thu,  5 Mar 2026 09:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mChgOU55";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5C610EBD9
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772703947; x=1804239947;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=niQISV3V1Wqsb3c7RIx2x3hANqhDXQ6jGceTvgl7W1o=;
 b=mChgOU55Q1Ptuztbjm5eHvp3C4fKZl5Bp/uBvG69Xy8hLO6HwoRSumZy
 NLnrLB3HtAHKTdi+KyM+yr6SFNWKQSxTD2F9pk1+P47xH0X1Qn1gNWpfK
 F0DtJPTxC+8ekiNAMceXMXoiMHJqliAaLzavB1WHEqVSE2XDE549fc9je
 Xg8KtI7GsJ4j7k2VQOO6UC/odI7cX79M6bwuAPLfhLqGA3JxGd2XVoFy6
 5DWDQ2pZynKQ8rofqt/TvmpDLfUdAABCoIK4klscIPkUg8Lgw7tAqW616
 pn29G23ihUMrcJ39mqh7mRUyusg/ClSj1RLjjEcrksGGHWU/bO9WHyGjI A==;
X-CSE-ConnectionGUID: HcZjpGm4S9GhNIqMTzkLLQ==
X-CSE-MsgGUID: EH/K7vsLRXaousI8vOnx9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91359813"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="91359813"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:45:45 -0800
X-CSE-ConnectionGUID: ZimPSxL3QwGGtau7BGWu7Q==
X-CSE-MsgGUID: cLORkdRFQpSrt2lRC0ALog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="217774166"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:45:45 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 01:45:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 01:45:43 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 01:45:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfnewRnRWlWggRPXO4ix6xp2whcb+Mf4jN8b+zIE24VZMlhl8f8OhewCVbTS8Gs8xrCX33S1O8BQG7rPdxNG+xCSR3k76DcVYJpQgVRUFS/V4zXDjwZ4PYl8apb02/XcgdQ05hRRYqNowk8mNLJkw23t6v237p3WM95Znc4UcJ6CqkkBulYEPI36j0jj6jHA41KKWB4YK55/SAfupNTppfwpnHHF+fbUmtOugmMzLu1UqkgYTo/3SYdkvZIX+S8t0NAEtXz2ab2ZBRT2bph3XZqpkL2xegNGKHf73Ox3Ti+u4pbMNGzdj8y0l4bdDoxjhFgV7Jc5s7L6euHIOtPDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJ5UZZNtOZ4ahhsLR3PhO+8cCjs0cF+oM8uRsPoltdU=;
 b=V/Yu5lVL1zwFkuQKp5g3hgvOiIKfZ+NiEskVTW8ywNadyZdoIuZs73Xj05DNXHG7Uz9vUoyvqyedz0SNpqTKG+BRhOLUr9faCdGazDPq5RSGC5bn9/+HRidSZ4PQiaNUhgSFxGtWjIc4Nb9g5qk/DRx6YU5tOga63xFbzElpUDXJ+WhVe7M69yiGQ4ckRMQEaYXu4ss+ruKm3u3fxUAYCseCSJyHjAE3DNv8OaYNvc0nGlDSPaO/Z/tjdM61xA2ibgA4zO7Fq1gDu6d8Z8OB5WaDov17kK9jn4YE+a3tbvjF1MYExMjK1zs0UhedVXRchkuKK2tumxvsUaqG3oaa1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM4PR11MB7374.namprd11.prod.outlook.com (2603:10b6:8:102::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 09:45:35 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 09:45:35 +0000
Date: Thu, 5 Mar 2026 10:45:31 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/5] tests/intel/xe_exec_system_allocator: Allow
 looping in compute
Message-ID: <aalQu6yX-vP3XWeH@fdugast-desk>
References: <20260128173412.1319610-1-francois.dugast@intel.com>
 <20260128173412.1319610-3-francois.dugast@intel.com>
 <5ms7xdrpvj4vvcoyn5vl4uzwmggd6djvbe6eemxqcvnkyygjso@wxplbrztpzzo>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ms7xdrpvj4vvcoyn5vl4uzwmggd6djvbe6eemxqcvnkyygjso@wxplbrztpzzo>
Organization: Intel Corporation
X-ClientProxiedBy: DU6P191CA0060.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::10) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM4PR11MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb08100-aeef-4e84-dcf3-08de7a9bf332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: GAK9GEM+1cfxJV/KyVcJTOR8Jvbjx+MpYvAbzFCXsJ7VUFMdhxKeZfCyxNANP9PHnQ7XNIWQe/x7XWLA+h6F887/tz/yn2ZIdEhJfk67tiy+sDdHsGv81+eNq7dMtxFs2pl7DOHSKBF1T2sevJFzYMmgiDk5uuZFAMVPnXkX345BJe9Jxmma1u1VvL60RGBaLrZox/4QeqH1aNP9nZc8O+kWaAkE7AmtTCq6iPG5pJezJ+b9yeR0HQhxeqqKgYu9eC4uXlpOtuWKokqeRAVuBof18dW6+Qp6WyTUC9TjFXH01MEZ+YhZjcUcRpPyswOtXKN5ULzld7mE3iAG5x2YvSpeVKNVUiAl9/x9hdm2abGLCn1MF5xrBSlN9ahmhLHV2N1Vx8VSCOgsp4rFzizSq0TEwBLL6nTv0TmtNbL4nN5F3XW5IrSIs4aO15biB+BWZpUKODmfgGltwPNr3LwBoGzQzPjd5wJFDW5ISlLdpelRPOPKe2M83am3CKsJHlIypJFj3M5njUtmfEzvMf/FJbvlSqv/C2kmLNUwee2nhhEq/FzfaRNbUrvF5I6tBp2yp5MX6aWgsbxrG6MrB27HUuWvTIFytwCwjnpbgBR7vX2UHK4sLnSIifVU9m9OFYeTbBuSuRk8UhXkdwMzCcwGTKS0zemsOAMgw/N7VMg41UfdG4aETCk0Rdui1l0epA2cbCcc0yLGCvLCx6jXZDfCutIs6L5Q+xkp6rLmnL06zJg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnJJZmgwcFJrZkpVM01OeDRDbVFWSGhIZWdjejY1bVI3TWNUUU95RWsxNUZZ?=
 =?utf-8?B?LzNFY0VGUHZtbWJlRTZJRGRVVmlDcGdQREZDUE1nVTgvMjA1TTBwKyt2ZU1C?=
 =?utf-8?B?QjNjU2R2cGJzV3hSaGtKb09QNlMvTjExNUVkdm5hYzVHS0RWVms2clJKbENS?=
 =?utf-8?B?YUhZUURROG5QVVU3aGJ3TTlRbTRtSXVKcUdKd3d4TFN4dlI4WlRHY3dHMk9x?=
 =?utf-8?B?Y2RuQmk2c044M1dqVVNJQ0k1d1MxYWt0ZUN3QVkyVVA5cmdyNk4zRXRWYkli?=
 =?utf-8?B?eWRia1lDN2x3L1VUVC84cmMzeTl3Wm5qNmNMN1cxWTdjN3VPanVWWkYxNTBt?=
 =?utf-8?B?T2tGdmtuL091QWpVc2RKalpCN0daM3JtaEtFVTdaZFVIbW05QUtmbVBCWHJM?=
 =?utf-8?B?Z2U1OTdTbGN4NStDd2JuOTZEM1dtQnlzV1l3QXhKRUFiZUxyckxRRXFldlJ0?=
 =?utf-8?B?LytWbGtwRWFLdG13SXM3ZmJzRWFZMnEyOU93ZW50TllwdHJtQmdEQ2Z6UXQr?=
 =?utf-8?B?Rk93bmNJS1B0SHo1ZmZ6Y29LeFdBQTZzRmtNbXpnYUpHcnlURXBrYjYvV2li?=
 =?utf-8?B?Q3htcEVud0xLQjRjOGRVck9DOENLa1RvZG03UmFYNnJGNzNWVTdwdUIvazRT?=
 =?utf-8?B?d0l4UzRxWFNWeU80TzZjSlFJc2QxalRranJycTd4UldjY3JYUCtNdWdTT1hM?=
 =?utf-8?B?YjNJMUxWRVBibkJ2a2cxM3lHTjdtdGpvSTNCRGcxbFRSSml2M0hQVEp6enhW?=
 =?utf-8?B?N2g2UnM4Y09iOFdsT3pXcG5WWVRyWkJQa1FnUEV0VzROalJTRVYvQ3JQSm03?=
 =?utf-8?B?TVd0U0dFRHNsZ0tpTGw5YmxHVC9JVU4xdEVEQ3QxUUF5VVNPNVNlVDhUayt4?=
 =?utf-8?B?U0xSTmJ4MzdzUXdGUk9VOXNIMURRVDQvSDM1ckIxVVQrU2FZYS9LZXVjdjND?=
 =?utf-8?B?eUZxKzBJcVpnYVJqU1BTczQvemtIZ1IzOWtJRkxKL2FTengvK1F2TWhBUGNa?=
 =?utf-8?B?WllQb2lERnBnWndGNk5GUWkrcWpsQS9naVh2WVlvNW1TK211QW5YQWNVNXJv?=
 =?utf-8?B?cUFJbXRUZXY0SE01VVNLbEUxN1Myakt6MVlOa0kwV1drdmZLWDFTS3ZINnV2?=
 =?utf-8?B?S0JxLzBnWVhhOHZac3cwbERsZm5iMUV2OUVGemgzWnlCRmI5Vm0zRW5Yc3pO?=
 =?utf-8?B?VVlWZGlKbjZ6NEgyQUI4N1pnaTNZMk1DNkx5YTdPT0hQVmpqS1lLQkxjWmpQ?=
 =?utf-8?B?YmNQTENtMXBCc21VcXdyNXV1L1MwdFBLNjJSOXRhelpiZkExL2o4bURacU9y?=
 =?utf-8?B?RmVFQ0l0LzhMeGw3V28vZ2RUTERKcm1rNFQwWGVnSjM0NS9yUC94TFhnSTRx?=
 =?utf-8?B?MWViY3RWanlkaDRoTjhjY3ptQjEwVjIvU3pJUHZWVTdyandXd0RDRkh5em9y?=
 =?utf-8?B?VkZla0lGSDVsVHp0MjhCVHNtcDVVa2ZkQktHbW5GVWpwUzlRM0NYNXZ6djNj?=
 =?utf-8?B?V0RVK3JJdkdKUFhiV3pyblpTQm5lTW5mMWhDSTRFOGx0WUhCc1VCVXhod3NX?=
 =?utf-8?B?YytIczlkek5CcmM3S1NHTTh4Qm5FckhSWFgwYnFYRUZsQVhXdEtiQVFWY2dJ?=
 =?utf-8?B?ZXFrN3QvcVZNZ1dsaDllMUp3OWdGOEZFMWg1aWFsU3psejN3ZWQ5QVllWHA0?=
 =?utf-8?B?Z3FJbmNlWEI0QUlzTjVraEJ4MmZDUjI4c2U4NmtScEtRejZ0bzlpbWp6QUk4?=
 =?utf-8?B?TFdtLytHSGN4Z3JOM1VveFhWN25TMjA1TDlpQW81bkpZeFN4QWJGcE50R3hn?=
 =?utf-8?B?U3FTcVNVbUNVTUdjbUkraHl6cGlBdWhYR3I1OHU0UGxOclpHcUx4NjNSVURZ?=
 =?utf-8?B?eXV4bVE0dWFFY1MxS1Rtdjk1OEVQTlBTaTdBM3NZMUlnbFQwTHpGMUY3WW1C?=
 =?utf-8?B?T0src0l3NTR5K280MnZ1K1p1eDlSNVo1MVlLdUhvNjUxUmVBY0kzQXdtamxJ?=
 =?utf-8?B?bjN0QkJPY1kwd1VHNkJLQUMzR2VtaXJGb0RrV0d5MXRHVTNwdXZ2U1lCNTVP?=
 =?utf-8?B?dHFQbVY4Q1FkUTROT1FwWjQzUHZhRVpOL0FVZlNVdS9XTWZpY08zVEtiK1Jn?=
 =?utf-8?B?YmR6dVRzdktGZVpXUXZoOUJVOFN2SHUyTjhWVFNiaFhDYnJCL1VtTy81V2Jx?=
 =?utf-8?B?S3NLbG9sb0k5MmJ0TWl0dVYwcEgxYWxGSGRIZXQ3VUM2QWgya3VrcFhNd1VT?=
 =?utf-8?B?eC9SQXo3cFY3U2lMazhQQVJUcW1VYkE5ajVDM0o4UzhCSHpOc1dla1A3b2tN?=
 =?utf-8?B?RDJSOURVV0szNmxuRjlGMUJBenJuSmRpR2tuRUJwdFd4MUVTdmVRemRhTVJR?=
 =?utf-8?Q?iyLNId5qECA1ivlg=3D?=
X-Exchange-RoutingPolicyChecked: mBzibmj95Lt6kduwtq3uM8EgTOIwKNAOdBX6prSV4K82jqlVfP3j6RWm+u2Gx5nclcaJ+FiMHS2sJpkBXCEiyZL6fTjODpMHak+G+dQERst34FEXNCAULoGsP8e1SVEsswDTmDD/UVbLXfG7PleqC1qdkWcGy4zIDbKhgjuqmtV3FIWn0uZFWx8QsW0/3kQDr24rKMYPJwwOatcJbYWaw+eFYdgoGNvEmGpjIvxsxyzdnjJ62JBTtRrs1JK8Eo4tBS863Ki+55xzX3dyns1dUpOFDKHxsrPQcHRP3VjYKhkyAlIeUvtbb1B/A5h9VRVfZdNGMBKNLUW+jrSzLuG7ZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb08100-aeef-4e84-dcf3-08de7a9bf332
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 09:45:35.3322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lIjJUiRkN2WaohOPAPhNflQknJz62WlUOR78QVGqHWr47BzDmteYTVulqHeO6XmG1753Yq2JzSUPmmoGjLpVmYmgtHNR6TIVsHLNyFHFos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7374
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

On Wed, Mar 04, 2026 at 05:16:52PM +0100, Zbigniew Kempczyński wrote:
> On Wed, Jan 28, 2026 at 06:29:07PM +0100, Francois Dugast wrote:
> > The default behavior remains unchanged but the user can decide to
> > stress the system by setting this environment variable:
> > IGT_SVM_COMPUTE_LOOPS. For example:
> > 
> >     IGT_SVM_COMPUTE_LOOPS=10 xe_exec_system_allocator --r eu-fault-2m-once-device
> 
> Wouldn't better choice be to use getopt argument? You always have better
> control during parsing input to do sth with this.

Not sure if we need more control, or if we should expect more arguments to
xe_exec_system_allocator in the future. This particular knob is not really
a runtime option expected to be set manually by users to influence behavior, 
it is meant as help to get reproducible performance numbers when optimizing
KMD.

Francois

> 
> --
> Zbigniew
> 
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  tests/intel/xe_exec_system_allocator.c | 36 ++++++++++++++++----------
> >  1 file changed, 23 insertions(+), 13 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index 23a429f24..c5193f81e 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -2202,7 +2202,7 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
> >   * @range-device-host:				touch the whole buffer, from the device then from the host
> >   */
> >  static void
> > -test_compute(int fd, size_t size, unsigned int flags)
> > +test_compute(int fd, size_t size, unsigned int flags, int loops)
> >  {
> >  	struct drm_xe_sync sync = {
> >  		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > @@ -2227,19 +2227,22 @@ test_compute(int fd, size_t size, unsigned int flags)
> >  	bind_system_allocator(&sync, 1);
> >  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> >  
> > -	compute_input = aligned_alloc(size, size);
> > -	igt_assert(compute_input);
> > -
> >  	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> >  	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
> > -	env.input_addr = to_user_pointer(compute_input);
> >  	env.vm = vm;
> >  
> > -	memset(compute_input, (rand() & 0xff), size);
> > +	for (int i = 0; i < loops; i++) {
> > +		compute_input = aligned_alloc(size, size);
> > +		igt_assert(compute_input);
> > +		env.input_addr = to_user_pointer(compute_input);
> > +
> > +		memset(compute_input, (rand() & 0xff), size);
> >  
> > -	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> > +		run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> > +
> > +		free(compute_input);
> > +	}
> >  
> > -	free(compute_input);
> >  	unbind_system_allocator();
> >  	xe_vm_destroy(fd, vm);
> >  }
> > @@ -2250,6 +2253,13 @@ struct section {
> >  	uint8_t (*fn)(int pat);
> >  };
> >  
> > +static int getenv_int(const char *var, int def_val)
> > +{
> > +	char *env = getenv(var);
> > +
> > +	return env ? atoi(env) : def_val;
> > +}
> > +
> >  int igt_main()
> >  {
> >  	struct drm_xe_engine_class_instance *hwe;
> > @@ -2420,7 +2430,7 @@ int igt_main()
> >  		{ NULL },
> >  	};
> >  
> > -	int fd;
> > +	int fd, svm_compute_loops = getenv_int("IGT_SVM_COMPUTE_LOOPS", 1);
> >  
> >  	igt_fixture() {
> >  		struct xe_device *xe;
> > @@ -2637,15 +2647,15 @@ int igt_main()
> >  	}
> >  
> >  	igt_subtest("compute")
> > -		test_compute(fd, SZ_2M, 0);
> > +		test_compute(fd, SZ_2M, 0, svm_compute_loops);
> >  
> >  	for (const struct section *s = csections; s->name; s++) {
> >  		igt_subtest_f("eu-fault-4k-%s", s->name)
> > -			test_compute(fd, SZ_4K, s->flags);
> > +			test_compute(fd, SZ_4K, s->flags, svm_compute_loops);
> >  		igt_subtest_f("eu-fault-64k-%s", s->name)
> > -			test_compute(fd, SZ_64K, s->flags);
> > +			test_compute(fd, SZ_64K, s->flags, svm_compute_loops);
> >  		igt_subtest_f("eu-fault-2m-%s", s->name)
> > -			test_compute(fd, SZ_2M, s->flags);
> > +			test_compute(fd, SZ_2M, s->flags, svm_compute_loops);
> >  	}
> >  
> >  	igt_fixture() {
> > -- 
> > 2.43.0
> > 
