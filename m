Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022A6C44515
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 07:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EFC10E7AD;
	Mon, 20 Jul 2026 07:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABUTxTuv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9F010E6DC
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 07:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784531714; x=1816067714;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zG0hcHEWKuht6sGP/FQb5AjvZvu/WNVLWuZqOFmx07E=;
 b=ABUTxTuvg0vtLH//n0Yum5qOy3LyimhIy/Mm4jo2SmtdDpYTvKbJNhHI
 Ei1DCun4AX5sXQdW8imF5Xdfhs+D8SUD+6sJ/nP40/Vh2FvOUk/Qki1UL
 Eg3q8HAXgpM3pmrYexAWpP0u1JMfgyj/cNyDI6RyftjayUqt9HOl0l+AQ
 KRFhPg1f442n1Eqll0pKD3SXFHt/OULhMPThdGtNm1vl7dJugkO1p80rl
 Q7hHhAI7S70DzcbmuLngAl1adJVIj90aTtjSl6t90chj/CnDdPYnL2KMx
 wMwsdgBr/LxkzDh2W2OT1EGerjwUMjQYa4/+n42oiynPpDrVkDyom3eI7 Q==;
X-CSE-ConnectionGUID: 2+lhYUNeT0msm+1JGfUGcA==
X-CSE-MsgGUID: FGgo4yuSQ3eZcZ9qcQSnSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="85201960"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="85201960"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 00:15:14 -0700
X-CSE-ConnectionGUID: pplsbuiSQj+AE/yrJeN5Uw==
X-CSE-MsgGUID: KDy2Rqd0SnqzkNchld8G5Q==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 00:15:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 00:15:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 00:15:13 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 00:15:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVuskzCd5JLfjj1meFM7+v85+uVMVVCAAEeOvK1/T3iW0MNAAkSI5OGwWejp3m+1qtiXxLf1ossTxDXw5jzFH726Egi8jPHMtNb1C7v49YXJedmoZz54K3kMNSndPKu3/oq3Hr5amzto/zZr1V+x8nVsIR+3nqtq2edkaA5uDS/fwZ5D538pxOKuBJ2kp5gjt04Hfd6ZkcOl69yjGERGMcbwhO3G74fLKZcimbNw/PGWars6QLU7jTGAKbob6LJG/CDmtKGsyafqD9zZOy2zwXmDk9eN8ZF7wxieeFbwL2aZFWqgWcC8ZkK2p0ZSHLklPPopLyCmDdb7gjPjWx4awQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Son3XGDdX2RgsAefDx31mjwktkOXMASeBLbOQmPLUM=;
 b=yemfCeZfurRUlP+H/7f8nERmhxKgL7BDYrssHGrypMKkCNLn4eh2El9VMU+VDqK4BdURwmdjYsu+ZZmqYJQAfOb8hZKBLIJSdimOOu2xPUD+KzPuHLCnehSJfIfzWfdB9wwCM+4h7uBwOK+WZ5OqLW0J3mBf/yNDfKnANGDdZWWCnx+76qF4CG8dIPXnvH+70Oya+uBmDno7ncZS+XQqS7ipb1tVS2F5v/cBIKQfsnVHAHW4HubakZ1yL86gK5tdf6upll2V+P01QUNnoUT3A0s8o2JBP2oUPXCuYxcuN0tSbg0Z/0sRM/B69m0mpYUjGAzGNSmSN1s+Gj064UkW1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SA1PR11MB7064.namprd11.prod.outlook.com (2603:10b6:806:2b7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 07:15:10 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Mon, 20 Jul 2026
 07:15:10 +0000
Date: Mon, 20 Jul 2026 07:15:00 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 20/31] tools/intel_lid: link with minimal
 sub-libraries
Message-ID: <genxvfnd5wf2f7y6x3wocewcjhgslmxlcnl2hdiflhitla5t3e@2tygfbcdryul>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <7112af0f8df509f9fa064b093a45f6c4a913e268.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <7112af0f8df509f9fa064b093a45f6c4a913e268.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TLZP290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::11) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SA1PR11MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: df470071-7631-4769-a454-08dee62ea2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|4143699003|11063799006|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: WmRK5FWLZazALRYRjC/+u+mQICUXoG+Z8cf2GDcUob8yBev9AxJubpLoKU+uEwTvQrITGCFw+HsC14iYZ7Mr7kJk/0azo+cwLnCitiJC66HHB0XS6C0+CLuKNtiYpJ4cEedww8Niy/fWeRmiziLaKLXeIWH85JornSI4rQM+iQM6NaVhHUGaISnTPhrksP+p2zWyEIrfmNMXOuirqj+GqV912YJPHd+OQvmYBsZZppV7c0/cxf3dh/jJ+qPBK2Q3fBp5UW9K4fSKwO9yja0H/n8qE7Zv6KB+jNEDMvnVh+yvi3ccPZ7BCM/OAsGhsGH6p/wT9DDFGJiLtHcF00xrpYwpJ/HqnAvvajxwFlQafS3Q6G9+zKgEA5ppDEI4/RkVcFzHp63TBT++mN7yeNrCSdKJaSj0J328JzzH0rYrNlmbAO41WnCLe+uvfemgzu4e0PBnywIpOVWH8fHT/bb2Scf6i2A1ZuSlyJ6LsfjfnxSOfbZAXOuuwyjWib2MxiAqVRZtsLxEVRLDB/XqCJ7+eLNe6/z1UGQVbwlsc0UqiAWM2WdbJ/ygdDPjtfC851lfEGNwuORGZe9Bfv1UpHmvUMXa9moPbgliWR7+UHjAokVyMEZGRfE6E0Drdr6pKJFTKfHfF8sHRqVmwlObNbgApcRkWyX/sUIbVBhnZA3lHvA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c050NmYyTGE0Mkx6VHIwa3lYSTl0NkFNSk9zMHFHbmpGSTNFZDFVNmc4N2E3?=
 =?utf-8?B?NHgvUkdsZjBCNFJtcVN4TklITjhCVlZBLzFjOXBCOGkwWWRjTkhwQUp5L00z?=
 =?utf-8?B?MVFVZkxXbE15eExBZWxuMUY2VDNoaHNyUVd6T3o0ZHJvTUd5UzhFQ3BwenRV?=
 =?utf-8?B?QmhmbWZkMnlGeUFPaFVTNU9tOFZUTENlc1V6ZmFtSWJsTHV0dHFDMmZRZXEx?=
 =?utf-8?B?TDZ3d05KTTBGUk15S0o0WHJ3clpvTGt6M0Y3TTRqUGNJN2NFdkpVckZqMklN?=
 =?utf-8?B?dGpnYmFYanNCcWNnTHFzalhzUTRIdUlINHBXeW9NZHFqdFNKbHE5TEdXb0xn?=
 =?utf-8?B?TmF4d2VvM0tBbWZicjJIKytsTHBrcWtPMVM0MTNRS1ZyUVNUM1hXd1hicXY0?=
 =?utf-8?B?bUh1QzczK01ob0UwajNJY09MRUNpYjJac2xRK3BHNDJTMzdnYkVLTE9FaEth?=
 =?utf-8?B?S2w0QjY0cVRBeXhjblhRV0hsbEJia0tXdjJROEVtMzBtMVROU05DZVZITlFo?=
 =?utf-8?B?WlpvUTNBZmVOalFWZThySzVjOERBZytXRjJUVWFuVGEvMDFaNnhSUWlBRlJk?=
 =?utf-8?B?ODIwY3NvTWZkWkdtdURuU3dNOFJaZ04rZGdycUZJMzFIOEtPbUpaWExubWFl?=
 =?utf-8?B?OEdMVWJoTUg5b1V5R2J0RnVGT3VaS0xJR3doRG5GS1hLT05hVVNoN0FKaFNv?=
 =?utf-8?B?MDRTVWZaUlVsSGhUZ2Z4ZTEyNHJwckQwWVZyOGlrc3BpMldWcmVQbU8rdFdJ?=
 =?utf-8?B?djNwTkRTRm1jWWl6SVhBZ1UxWUhyNnY4Q01ISktKWHRwamFJSHJHMjRFOU51?=
 =?utf-8?B?T2c2TXlWNDN0c0h1ZjRvUFdydDNhUDZCNlVIbEt4aEZBNXVvdkJvT1pYRUd1?=
 =?utf-8?B?MGhnWm9ra0Naa2ZKcXdRU1pWR25WSThBZk03MElYU2RXbGdPUnNWazdWWnd3?=
 =?utf-8?B?bVVVTm1HTkMxdlZzb3F0eFRQam1YOFhNQy9QVm52RThOM0twZXo3bm5mbGRC?=
 =?utf-8?B?WmpvYWRCejJySm9wT01LRXhUdGYzMjRvWGpFSGRSMXA3U2xrVXZqa2F4ZVht?=
 =?utf-8?B?Tjh2ZlY3RSthRGltd2VqV21NZGYxMi9ZMmVTMUFWelJQZ1BGNmFXMGc1VUU0?=
 =?utf-8?B?VndYaE93cTQ2bytyRW9PQWpVei9yaEUzcGZ5UUJzSy9xSnhLeUF4NU1ZV2lo?=
 =?utf-8?B?blVwV1RvQTBRK1ZwM0ZiVnNyNnpTeVQ4MnNIc3Z6Q1cvQ1NHTFFyVUY0andQ?=
 =?utf-8?B?VzBCZ055dk9XVGswQkYvYlhnTzB0MXh5QmlTVi95Q0FUMXRUZGlEcS9wVm9L?=
 =?utf-8?B?dGpxUkt1NFdMc2xTTDhUdzZ3YXMzWEtDTU01VWk5YlI5RGx6b3RKUC9IUy8z?=
 =?utf-8?B?VTV4WU9rTDJKUTdpamNneHp0Mkx3QVRYV0ZvMHBZRC9MekNTRXFDUzAwMGFt?=
 =?utf-8?B?c2RIaTBRMlNmREhaY2tORjFLVU1XSUs2bkdRb0h3TThCMFNSRGtCUFppSVNW?=
 =?utf-8?B?M1Y5NWRWU2FsN0xUd2gyWXpETTNySWhpaGN4bXB5cVFCODFvc284aG1kaHRk?=
 =?utf-8?B?aFpiTHlyK296S2R6T2ZpNUxSem1VVHErK05GRkdSRkxYTjYvZVNTNkZXdzI2?=
 =?utf-8?B?S2hBOFZOd1BzdUlYcHErTmtRYjJmZUkzNDNKcDJ6YXZXTy82VVVSZG1OR2dQ?=
 =?utf-8?B?Z2ZQRjd4ejlubzAvWVV5NkZtdE92L3lhNVd2Z1BmT3IwQ09OWXE2RHUzUFpV?=
 =?utf-8?B?NW56Uy9DZEpTYWFmbGY1ZE1TUkRrbWZpeGxXVWFPTUJPa2tPNVRweW9iaW5X?=
 =?utf-8?B?dEdNMUdrOHB6SFlpeHhxdEZvZXFrZW5WRVMwQXdOMG1hVWJoaGdMWmxWT3FZ?=
 =?utf-8?B?bG5lZ3puOCtXcmFOOGx3NFJDU2RDMGFuMlVoaXhQQWxsZFd4TDQ0N0xwaWRD?=
 =?utf-8?B?VlNxWSs1NW50UCt4T2wyVS93NFF4UkhWaWV1NkIzK09zZk9rbHg2NzdWN2ZS?=
 =?utf-8?B?VURPMy8vUVU3dEgwTVNtQ0JpcmpXMndTWTJ3NXlURE1OTGhrdW42QmJTQ3dH?=
 =?utf-8?B?WTl5REZhbXRpS0g2MjdkUkc3dUs5MDhCNkpUeEZGK245eTBtaEFLOVNGSHo0?=
 =?utf-8?B?a3RMT2lxZDZQR2hsZ0h0bHAyVElMNTh6K3NyRFFpa1NYVUFGRGduM0dmK0dR?=
 =?utf-8?B?a0ZNZzJ5S2E1Nmw2cEltdHVPcjVYeGR2Q2xQc0ZrZGxKcGhhWEtQREYvTXA3?=
 =?utf-8?B?MEF6KzJoMGtJMk44OTVUbThMbTR1REgvQzAyZThMV1EwMy9wYU5mY09XdTln?=
 =?utf-8?B?YURHbUx0RnVZUnpuajFiVUZ0Y3hVMUN6OTFxQThlYlFhaThTMHV3MjFYZHVN?=
 =?utf-8?Q?Uzt+OhIRt3u0E2Tg=3D?=
X-Exchange-RoutingPolicyChecked: G1PCs9iH6nzxV6IuVr2QKvg6Y377zIMllisGxQpmF+Tn3BeJ65gzhde6YT2s5swrBIrUu/3UWjM2acI/nYQjWp2cQMxZaueKKLkqgkKmLQPm7C4bnoM3X43h2aJ5FqgfRib5aQR8DxOXmgb2kFp64YA9gOZgWApoijfCGZpsOTTdQyFCtEiT8T+baZ1A1/N7yNTfbuwlhxAxb35rhnRGPRFUmvpr+tubXr6iITdwM/Q2gy+m5c/xIQFCv+L4e5Dz+JLy/FW10/dmp6H2AqdZ4Uck7llJ35zCcvIGM4QtnvpHEiO5epC0+dXDkuMvQX3f0UEjWCL199OC1MobAbqZ5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: df470071-7631-4769-a454-08dee62ea2ba
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 07:15:10.8025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpuMv52BqSn5Di9GWTc57EFKheR1PY90D2ojFsm9ek8b67k/+ASM+7YWA2icQAFxtkqu+1lr2Dm1ZakEmz5XHzfGXyfBhwWn4ByshNA5rB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7064
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

Hi,

On 2026-07-15 at 14:15:30 +0200, Sebastian Brzezinka wrote:
> intel_lid only needs the register/MMIO helper subset, not the full
> libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 8899a5b49..0978f8f11 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -25,7 +25,6 @@ tools_progs = [
>  	'intel_guc_logger',
>  	'intel_hdcp',
>  	'intel_infoframes',
> -	'intel_lid',
>  	'intel_opregion_decode',
>  	'intel_panel_fitter',
>  	'intel_perf_counters',
> @@ -96,6 +95,11 @@ executable('intel_backlight', 'intel_backlight.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_lid', 'intel_lid.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
