Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24219C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 20:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865B210F8F4;
	Fri,  3 Jul 2026 20:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ew3vH1vk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD6E10F8F4
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 20:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783110714; x=1814646714;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2irCV2ZVr4agBXorAMq52Ja+cxCDe1TwSP/eajW1tkM=;
 b=Ew3vH1vkCpVS0+RH+hcnVUAHcnAKWW1Fyrplif2fvfRyqR/J1OZivGRZ
 byyld7CKBfom2bWoUROnKSCPRbW0KqaJjXRak5IRcxgNxI++VZBJwD1OC
 iYavQMpurzVKCiov+74iSPKyltB8n7YYci56kMK1ktV+ASHsBh0RepVhj
 sYCaqPtRfrCRUVmmhdFzNFI2fvjC8gFKWuio0dTSfOniwxF7/5h/iW+yv
 aZHs+c4jEj7fz1ythpPyb/+tF5yHQKlpnyRQ2udeon2+Fbjm46R6bWkFW
 IGLnWNMMirnkHwoH5jSjAZokTtps97luvjlYAkbVJAFQF3xrpRtlauhfD A==;
X-CSE-ConnectionGUID: ORud1pSUTeOfWCe3+fQurg==
X-CSE-MsgGUID: 1EGf2jA5QECxMnnNnESZZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83988124"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83988124"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:31:52 -0700
X-CSE-ConnectionGUID: 4nl8qmlHQF+eK5ysuG+WKA==
X-CSE-MsgGUID: 8ANO6fZpS+uVz+U0QkCJxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="257076245"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:31:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:31:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 13:31:50 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:31:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQw1f7HGfTPuJ4zmaanqpJUS3LdZ1J30fJdSu/s9WjawZkg94bBn10OgKG22YXe/5X1iMingk//0h2f4i6EQQe0bvchqDgFqLfSEh0rQV75GdHKqxRqRN85N2kTi+wKHzXFL9rI6lLRyoQbZuWWIxJc8v6xrnWCe7b0WzthdC6T3ryhY/xBSbvM3LQQA30qRIjlGEAcyl6wkQZ4kuXagkHnevEWHn994hWANJGo4byba0vXZB6xrbb7gz4/T9KshxOnLZEuw/EUGkCiGITHbK1GCJnnphys4R2RBcCAzmWXsrT69BvK4Tniqhgou0qt6auIL7ex40zeE37KME/rTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8RozOKwmdNSf/33gwZgEQSlFej/wgIv6d52OpS2fE0=;
 b=YOQSrm8vAb5YbNDYK2oxmI8HaYDHRzgGRKFo9vBwigP6GH6lEbeevx09HDYBPIuyARWejW7aEqd9qMq7Wl26eZ5UqTojbV0sP8UnMN3zpbb70JPmZDReFuSYLhlsP1c6gljIfC1pBOE1Gy22uLIvA8/rKhfY9gkEb8b9AV1+hTgOjzaLyJ10JetgD4J/qWDsO9+qH6Hbyy42+lYa7hvcq9sD1B4eORC+UHr0plTNB9qbDgq2m7usFTDya38Xk+3SdOG5DMEggsuZ5VoatAZjG9XuV+wcxSgpRnHCRyTIdabqWXBbjO+k4VKSrj0m+bP2tRbilRmKJThSSH5P4GoElw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CH2PR11MB8868.namprd11.prod.outlook.com (2603:10b6:610:284::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 20:31:45 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 20:31:45 +0000
Date: Fri, 3 Jul 2026 22:31:35 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 06/31] lib/igt_drm_stub: introduce for tools
 needing driver detection
Message-ID: <ffpvyotibdubvshsdzyy4s6hd3y6anmb5o2jxys7lhgmt4y37w@ztidpg4we3rp>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <a7b3a59cfb110b0d7f94552207b2d6b9faae02aa.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7b3a59cfb110b0d7f94552207b2d6b9faae02aa.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::16) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CH2PR11MB8868:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ee3179-9988-47e7-d22c-08ded942196a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|10070799003|376014|3023799007|56012099006|4143699003|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: pKoN7WWyA3NDw6e/AftOp0jqY0NJkFAvPG5MarpQFviGzLVIkPYlpACXQpVkBElrFthuoFTRxXsDQlDLN7pQR7LApNAVgg7fJLuNW3viAuswLiFhIT5fWQZpxZNOyeZxFShokWC0zRoIPxGDc7tNe2VcH9Ku7FBMkyOXtrQZRS9zJyqa+cTvYWW6OiY+9WK8gK0TixsySmxqBcFrFccUBt5/MVwJmTvUeTMlg4PrJrUMU6s26b6Wa60GMAGennCGLrTnZDzqWY+inAMmfRVJCj/UGwragJENeJ0hIMY8mxmBuH74OHjkUQ8OLhU1VIljR9OJ7u+Mv1Ws6Dxw2eXhoMQ5HGoJUXISKMimEd4UuIXGxQfVHTlLqt10N0Gs5gwPJBqMuFlr4pTxEa7Y/nz4SqZPrWsQqog6+DrV+ClbUMh+O4JcAfH+dqYBeKKBiedu4Z7wvQfIPLWTBAxi3cq7o7miUIu6R/YEdN817etjV/Ek3TIPg+KddMMEZyJDgzEXOf3ubouTI8vGxfCglbx63PKHu2rpjx2Ew1dE5eqMjEHkKd6wc72j8wCmh20aKYyukDUhoizP693yq1SWW84+YewHkHyKuT5i/D/qsJkvzfnOswpfC6WA4qUdN+voG6dpaCnVaTMJ8RrLUfZf5iqJPabf9So0sqXLzfVTw3gPF3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(3023799007)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1N0N0Z5RHRITFJKSzJUR1N0VUhyRVBEdWxKRGgySjUxN2wzTExRY1dMVzFH?=
 =?utf-8?B?ZU5jaUYwVFBGYVZaNHdzZmo2VXNKWm5nOUNBcGx4RFNrN0lKK3lxaVQ0RXVx?=
 =?utf-8?B?R2k0SmNLc0FtNStyZWR0MUx1TGNHRU9NaXMyREhab1lOdm8xMUdicUJJWWNS?=
 =?utf-8?B?dlhNY2ZXclFlWDhRUVJjNnB5a3pIV21Jc0dVYXF2eXBsYzhERlM5V2ZwaS8v?=
 =?utf-8?B?eDVadVc3RjFTM1VMaFdITlJkMHBSWTZPMWcyZmp2a2ptUGd6VEFjakFyWU9Y?=
 =?utf-8?B?OHM3dWljTmUrR2lLR3VyYTBaRVFkaGdXN0RZNGtSOUVkMVRwQVJVVVBqeTc3?=
 =?utf-8?B?b1UweHpqeVA5bmJkaWYrOVpQODZMRzRwTzJibVkwVy90cXlxeTFVWWI2YzZF?=
 =?utf-8?B?U1VDSDZkOTR2bGowU3Bxek56M0xtSjg4VnFuaExmT293UHA2L2hzNmtjbXpn?=
 =?utf-8?B?Vyt6NGFWbm45Z0hLV0FvN0lvT09HZTJBR0tiUm5kUG95RWZCSWkvT3BnSTJP?=
 =?utf-8?B?Yy80by9iNW9WZWFYb3V0VVRGWUJubzJRbWl4bXk5SEZsUEZmS3htWGY2Y0x1?=
 =?utf-8?B?M3NHUFlYeDBweDRRUGNQdEdYbjdMcGVtNVJsSnhkMmxWaTh3eFRkdGFvcjVM?=
 =?utf-8?B?TUd1aVIxUS90VWRuQXZralpzSzNLdUtJWEJsZXd0WW9FZXFoMUM2b2d6SWpj?=
 =?utf-8?B?MXZUbDhTMjlrcitWYkVNTHJpRVpRNjhqY3pUem1RWDNvWlkxNkJLaE9vb3RB?=
 =?utf-8?B?TlEzdWd5Skwxb0RqWTBWSmF6YzduTDlUYVF1QjFrVnpHR2ZDd1A2empod1hm?=
 =?utf-8?B?ZXdFbExmRmcybjM2VjNqUFpZZ0F1dUJQRCtlMWY3TzRkNVhERkhNN3RvRTB3?=
 =?utf-8?B?NFBuUHBjUkVyL0srRlhHUzJ2TEY4cml1VURDTE15SmtpQ0VWWXhsNUsrdlJV?=
 =?utf-8?B?ZkZYNDJBb3BlWWNmZjZScGFRa1ZsdXNzanFnMEZreTJmcGtaZ0NXcG5NRTQ3?=
 =?utf-8?B?R1ZyQ2pqUXNPam5sK3FVSGRJd1p6dDJ6L3JRTEdWZ01qSmx6N21WOVdwZDNG?=
 =?utf-8?B?TS93WHplbXBIUWhUYU42STFKdWc4M2Zxdm9tVjJ0ejM3TzNnN0hISWdWZWUx?=
 =?utf-8?B?eGNPcWNEcWlvWnJjZTQ3WkdadGNKWWtSa2NpdVJ6dlh2ZmJtaWhtQVlualRO?=
 =?utf-8?B?em9WK3BNcllMYnFVcVc3bGo3R05vQjY3Si91WEkrVzBYdG44YzJJL0Nvd0Rm?=
 =?utf-8?B?c2JSOGVlSngxeHkvRFdPUlk0SXRBSDRxRWNTRlZrZUJ3dVJMeEJPWU54ZWJH?=
 =?utf-8?B?WndaOURZbkpkV3FGK09lbkRBUng4N3VINHdaMXIzS1hRVlIvNFJRRWxPdnJz?=
 =?utf-8?B?RHA1R1VIdm1BcWJJNm5hR1FVcVFXdUs1UzhhSWVJS0I3Sks2TWh6SFFCNFR1?=
 =?utf-8?B?QlhJb2lIR210S25MMkRaU0hwNG9HZFlROGhwNTFtY2FqaFZyUUR4dVVEUk0r?=
 =?utf-8?B?WElWVXNqb3VrQnpvdTNvZ01kMUJhMmRJb2tGWldWSnNlaTlsOWU0Q0Y0c051?=
 =?utf-8?B?dmpHTU5WOHdlUjN3cjBYbkJWeHE2VXZQZitiNFY3cC90YkVWTURXMk5jMHgr?=
 =?utf-8?B?eWhEV1h3ZjRUTXJXYS9OdklJcGdmcVAxRkc2VHQ4ZVNoRmcxSHdrM0laM3Iz?=
 =?utf-8?B?cW1HamxxVjR1MEppWS84ejlaMjJ4emhMbHdoWXdVOEpjWDNHUENuVnYwallx?=
 =?utf-8?B?YWNzSjJzRTF3MWFhTWtYZmhQeHN6TUtvSG10Q3BNMExjTXV6U2dCVzRSUHJO?=
 =?utf-8?B?TUgzeFRtVXJwYUhnb1VxYmhwMVE4WGh4ZWRVemRNbDg1VS9aV0R2YkpXRmZU?=
 =?utf-8?B?eHV5c2ZYK0FqNVVmU2h1M1Y0NFpWU0czb2NRY0tqSGhnSEVPTm1Zcms4ZTdU?=
 =?utf-8?B?MHMwZzd4bXgxTk1tc1Zic21IeFllU1c4MTdpS2dxYU1ySEdLNnJWVlNDNnBv?=
 =?utf-8?B?RlBvQTdiU3NIcGRXSW1CQk5ubXR2Qnc5T1NaUVlDekFkaXZvQ2FYaVovQjBl?=
 =?utf-8?B?cUtsOUFwSjdjZ3BqSjVTY3pUK3Z4QThYekNnS3lhdXM2eGJmNkhvYVRUTC9x?=
 =?utf-8?B?UjdVYkNJZWkweVhRT1lCTEhGd1RWaW5jeURuSGpnNkFzM1JlMURBTGZlaHlZ?=
 =?utf-8?B?UXRsRTNXMGZTYk42OU5yb2ZJZlA4WHdwSVVuR2E1T3d0OWxESDgrWUpGaTNp?=
 =?utf-8?B?d2tMWitVaFY4d3dYWnpGd0phM2piOUZDcGJRRDBMVFBCMDBvQ1hpblJ5cEEr?=
 =?utf-8?B?SjRnZmIwbXlHby9PSW11cHBpd1lNMVVGTG9BelBTRzFrSTlDUWRuR3FwQnVX?=
 =?utf-8?Q?nO+RWOjBuFhbXkIImw7QDNpfASaqfc4iV0mkzfzDeCjGI?=
X-MS-Exchange-AntiSpam-MessageData-1: J3yzvmnOAtw81fSShs/yLhtgEM59K+dkpyg=
X-Exchange-RoutingPolicyChecked: RZVcn6s4ljhw8icOF42sWi+i6rAakfU/sap7yTlz0/JMfk7FrvESYKrwLLPm9ZXRxqCCJ/QTQVJOhEnV7sCVLyOi/Mb4KfnCQC29xEcHGr6f8ZjK8I8sPf+/1SlOWFLUI4RFwmw+Z03JY6m9TfbqpuUqj25OxJRVY6ipUb3Eck2+z36+/0NrQWQ2nI/X3LtJclXcX1o+1EoaH5Yb3WuqGccww7eEIj2Emo25orGLobup8Z/8SbCHnSQLz/lPgrH9N2VynhfY/rOpM9FfwtSAa8VZeAvydKTxupx51RsH/kAjgVfm/ioTMUBWdSJ9SlMXNXvHBGqTDPm7bbcTaRsCLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ee3179-9988-47e7-d22c-08ded942196a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 20:31:45.3740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8U6mm3jvWwOsFXzQPSMERQReJFOAH+Pcvj2WypYw9hHpFCObOZnC6DlYi2gPciVUQu21ei+lAeF+3a+/Of/91KnTsZGqo7eoJCrll3j9p4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8868
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

On 2026-07-03 at 16:28:40 GMT, Sebastian Brzezinka wrote:
> Add drm/pciaccess-dependent stubs into a new igt_drm_stub.c.  This avoids
> pulling libdrm into tools that only need dep-free logging and exit stubs.
> 
> The new lib_igt_drm_stub static sub-library provides: igt_pci_system_init,
> is_i915_device, is_intel_device, xe_dev_id and __drm_open_driver.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/igt_drm_stub.c | 132 +++++++++++++++++++++++++++++++++++++++++++++
>  lib/meson.build    |   9 ++++
>  2 files changed, 141 insertions(+)
>  create mode 100644 lib/igt_drm_stub.c
> 
> diff --git a/lib/igt_drm_stub.c b/lib/igt_drm_stub.c
> new file mode 100644
> index 000000000..f8ac3a992
> --- /dev/null
> +++ b/lib/igt_drm_stub.c
> @@ -0,0 +1,132 @@
> +/*
> + * Copyright © 2026 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +/*
> + * Minimal DRM/PCI stubs for tools that need driver detection and device
> + * opening but do not link the full libigt.so.  Requires libdrm and pciaccess.
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <pciaccess.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/stat.h>
> +#include <sys/sysmacros.h>
> +#include <unistd.h>
> +#include <xf86drm.h>
> +
> +#include "drmtest.h"
> +
> +int igt_pci_system_init(void)
> +{
> +	return pci_system_init();
> +}
> +
> +static bool driver_name_matches(int fd, const char *name)
> +{
> +	drmVersionPtr version;
> +	bool match = false;
> +
> +	version = drmGetVersion(fd);
> +	if (!version)
> +		return false;
> +
> +	match = version->name_len > 0 && !strcmp(version->name, name);
> +	drmFreeVersion(version);
> +
> +	return match;
> +}
> +
> +bool is_i915_device(int fd)
> +{
> +	return driver_name_matches(fd, "i915");
> +}
> +
> +bool is_intel_device(int fd)
> +{
> +	return is_i915_device(fd) || driver_name_matches(fd, "xe");
> +}
> +
> +static uint16_t read_pci_device_id(int fd)
> +{
> +	char path[PATH_MAX], buf[32];
> +	struct stat st;
> +	int sysfs, len;
> +	unsigned int devid;
> +
> +	if (fstat(fd, &st) || !S_ISCHR(st.st_mode))
> +		return 0;
> +
> +	snprintf(path, sizeof(path), "/sys/dev/char/%d:%d/device/device",
> +		 major(st.st_rdev), minor(st.st_rdev));
> +	sysfs = open(path, O_RDONLY);
> +	if (sysfs < 0)
> +		return 0;
> +
> +	len = read(sysfs, buf, sizeof(buf) - 1);
> +	close(sysfs);
> +	if (len <= 0)
> +		return 0;
> +
> +	buf[len] = '\0';
> +	if (sscanf(buf, "0x%x", &devid) != 1)
> +		return 0;
> +
> +	return devid;
> +}
> +
> +/* Matches the declaration in lib/xe/xe_query.h declared here to satisfy
> + * -Wmissing-prototypes without pulling in the heavy xe_query.h header.
> + */

Same thing with comments as in the previous patch; I'll omit pointing
out any other places in the rest of the series - but just for the sake
of brevity, the comments should be unified everywhere.

> +uint16_t xe_dev_id(int fd);
> +uint16_t xe_dev_id(int fd)
> +{
> +	return read_pci_device_id(fd);
> +}
> +

Why can't the users of this function just use read_pci_device_id()
directly? It's not i915-specific. The function declaration looks very hacky.
But I guess it's kind of unavoidable if you don't want a separate .h file.
Ack from me on this if there's not a cleaner way to do this.

> +int __drm_open_driver(int chipset)
> +{
> +	char path[PATH_MAX];
> +	int fd;
> +
> +	for (int i = 0; i < 16; i++) {
> +		snprintf(path, sizeof(path), "/dev/dri/card%d", i);
> +		fd = open(path, O_RDWR | O_CLOEXEC);
> +		if (fd < 0)
> +			continue;
> +
> +		if ((chipset == DRIVER_INTEL && is_i915_device(fd)) ||
> +		    (chipset == DRIVER_XE && driver_name_matches(fd, "xe")) ||
> +		    (chipset == DRIVER_ANY && is_intel_device(fd)))
> +			return fd;
> +
> +		close(fd);
> +	}
> +
> +	errno = ENODEV;
> +	return -1;
> +}
> diff --git a/lib/meson.build b/lib/meson.build
> index a57c1eb8d..484a912d7 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -356,6 +356,15 @@ lib_igt_tools_stub_build = static_library('igt_tools_stub',
>  lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
>  					include_directories : inc)
>  
> +lib_igt_drm_stub_build = static_library('igt_drm_stub',
> +	['igt_drm_stub.c'],
> +	dependencies : [libdrm, pciaccess],
> +	include_directories : inc)
> +
> +lib_igt_drm_stub = declare_dependency(link_with : lib_igt_drm_stub_build,
> +				      dependencies : [libdrm, pciaccess],
> +				      include_directories : inc)
> +
>  scan_dep = [
>  	glib,
>  	libpci,
> -- 

With the comments fixed:

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
