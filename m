Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4052CA5FD4
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 11:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A607010E45B;
	Fri,  2 Oct 2026 11:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nR3icNAT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DB010E0E1
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 11:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790940860; x=1822476860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=v8+oyqYaaxJgeIpKgQEiofj8/e2bOhiapQC8QK9p/0g=;
 b=nR3icNATDAmzPgrX5Gli5lpikBBq6LwmVCb7DdnIqyOwCsLCTgkVp34N
 MpqaLk57xrfrusa2/A8Za3HjvwGyhBnWAFxvsmQbTlkE3K729VUmPFeOg
 KC3KNFitTMI+D+AFBqRvWK+PKTUSmVp1B0wtKRyROy6UppvI0bdx9tQcE
 03DOI4jqMzLHbxQfS2aYi4aRD0UnczlrbMQAoiA7Vd8cqanmhCla+p+4V
 DeImfrPGBz+KcrsXg97Pw5NyWSHJP7u+3hjqJFA3A3ugRvCdrtJnGtiM6
 n18LySlnvm6n/0TOdxpX40+SZjt3vZQLEs/lK9zgKo/IlaJ0/cG34MZNF A==;
X-CSE-ConnectionGUID: UJnEdbH+TMuh1fbPZxxaBA==
X-CSE-MsgGUID: unVMs/dOSKGKt9MQ+thVsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="108084592"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="108084592"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 04:34:20 -0700
X-CSE-ConnectionGUID: 2ZPEU4fSTnmuWGcVSaR9eA==
X-CSE-MsgGUID: NxAF6oEGRRahm/Pkgd5UHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="279489009"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 04:34:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 04:34:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 04:34:20 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 04:34:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVl5HklkG/NbIDvXWJAnt4WqaeVGWGj+D3tkqfMolnlJe1nTzEuHlzgiWzIgQQbcvN/tel/l8E0QS993+1T2pm/R5yqFQ3qL49v8ssx6zhUCvtBjqzVi1KwpXzLYzLUdb7eATaYPVKH1Tl7W+blTTYEiYqcAUliiH0zS21KDKBE1zMXwWZwXTYfZnR4V8yL5lyJF6B7ZPlZZLY9/se3nMy48McI/RxqfgsO3yGZ49ILMmhPqukQ7eY6ZWEn0rpdTLMVB+nj0J99FviTTifZg8uJUCO+UrbUnGScB6/bIhk4fx67tuawFUMVdv4MBWpx94wKmD7YtT64wyCXr4nVp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bs/O2cHR/dRf9BBdPHt4ubVqPIjaPVvD0AINzp3+rAA=;
 b=LYamzFqfLgNGnIhcIqEnxFNl5URHsLV3JBL1nT6mzpPwqekxhCI/NZgAIfuF3VH2RnydaOaMNWLDLVs9qc7awtMrleHIfomhPXI3bnQTY44svkqVnM/1zkMG0/VKOaM347HoLuvX4qzYcL0YRU+PxPHkK0lyCf5somZCQy7tqSi8YeQKu8lGg+cBnjzmF5hl8j+nMTkRAnH7hDnAtrlEjpaSJsyOgYpch1NoyCKKpUJDjJcywtq+cGNj3jtPwhgIbdM6PsVcRhqKam0op8KZ8BrnJJwdwY7dr8t0MF5RrgxyEatORuWxEjsN4un1vR3cMKfmzJe8pqbkrBGQQJwaeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Fri, 2 Oct
 2026 11:34:18 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 11:34:18 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: [PATCH v4 3/4] tests/sriov_pci_config: Add optional capability checks
Date: Fri, 2 Oct 2026 13:33:55 +0200
Message-ID: <20261002113356.3652805-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002113356.3652805-1-piotr.piorkowski@intel.com>
References: <20261002113356.3652805-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR06CA0022.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::27) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CY8PR11MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e94a068-9f1e-4cd2-2b1c-08df20791820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|10067099003|18002099003|11063799006|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 1UBq5/Aw2wQUaDPZ2LgYYkf9n3LvIQ+NYQEVXVne1zDlw8SUXPVEMZ3N0PUK9BIxoL2454Zt8pZq4Yam5uEL4Xe4vIBEHLibv8tlMWxS1SS3u1omIJARR8rCAbsxwarWphgyxdxaUq7D3jOIlleXUDcY+4w7oNG4k558Iew3BNFznuyHjkySd69IViVyaeNyJCMzhVvX8Y8OG1dcl6wvJID2pxE8+0F/UDWQJvZa9VQ9TCcYJQzymB61GfkUWalbdc7lFGWn/a5jJYXYtL/6CJrcT2HiYKGKocPOruUC5c1y9XU4sPhi/VA3d/bZocIywHpn7sPO0/KiCy0CJCcCMPyuo3aY0JTplgALmSJklxZe70k3sB88/Z1VTjKQNH/44CGpNAWs1GkfgH6npIxTsNko1T2PoLYGiree7zHN94viGmdCC5MENHQ9wppMoi2gFRK55++8zG0x84JE5hwF4joDJXZqqkoK6Yi6izbhm5YeWZ8SzAR1AjuwHw8NRBXnvuFYtz8NHiLBBaEjmbhqgScU/QWHtyTUOatMgKN2obmnUb9SUqj9Gc4Uo9QfUmyUhhNzezLMvnyA15qHUSveG1sOP8tlJ3TkRwHwXL2d7vYMw3uiCRPs8AB+E9WY/HgrpS3BGo3sIohYoGyKxXwjXVGWP9AMIUG2aSQPM+q3AvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(10067099003)(18002099003)(11063799006)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWdwRWxaeE1naTBMbjEvQ1UxdW85Y3FNSGVoSnJIWUNYQ2lWMThycVd3b1pZ?=
 =?utf-8?B?Z2ZDM1JtZEdVcEt5QkxISjl0V203V0FiZ0x2T1BJVGZna216STBRWFdyYVdI?=
 =?utf-8?B?SUVyeW9rcDB5UElOeUlrWmJ0c1VUSzR2ZFRwZE1vQjNvRzZTZWVjY3FjZVBW?=
 =?utf-8?B?WGtKOWNwd0VWL0Y3T080NmpkUlFzWEthTlJhNlAwK1lQS3M4S1BpTTdwZFI3?=
 =?utf-8?B?aHBvQjU3U3d0L0g5SjlRT0g2Vy9sbmZKMllETFA5ZHhCa051eEJxK0J6clVM?=
 =?utf-8?B?RHlyMGt6dllNNzF6NkU5b2JTNVljSU43VXRvNnVzYUdPS3hTeG9FZy9URk45?=
 =?utf-8?B?UDNDK3BJUXFOMlFyMEFnYm5CWnRxM29GdzRwTEdmbTRuRmhzTHlUS1NaL2dl?=
 =?utf-8?B?RnM4WERrV3RiZ3BmOGZiSWtZOHNHSmxFbkk2MjkzQnd1VDlsQXY0QnphRW1N?=
 =?utf-8?B?a1UvakpzSDNQQWdZVEFHeVB0Q0VTbXhlU2VqajlQSGFIdkNHWXoxOTU4Q043?=
 =?utf-8?B?cURyd0dPRUdrTFZtd0xEajArazZOdW03dEJhUEtTZ3lkSzNFRTFZbXNEYmts?=
 =?utf-8?B?WVZGZjVNRHJWdnpjZE03ejFQSnExdngvV21BcUNhOFc4bmg2bktXeW4yMGJk?=
 =?utf-8?B?ei92MTRFOU1xeUcyVE14VkFRMHNKMlpjdGl2ZStRMVE5VkZqRWZodmJNbEY3?=
 =?utf-8?B?UUdzM1hBVnU3VTFLYURXV1BkeE1lV25oYk1YQzM3bk1XMFJQTUN3L0FTcjFZ?=
 =?utf-8?B?RzBQWXQ3RVI3YkpIbGlFVklMc1dUazAraWhUeEt0S0krWW1XZUxUWmV3bGpW?=
 =?utf-8?B?N3dHNVg5SEtlN1lJSFl4aVg4U3hPY3JnU2ZmbGRVYWIrWjNaTGo5TzhwMUpz?=
 =?utf-8?B?ekFWSmdRSE1qTGVhVCt2eTZUS0VwajZyR2x6U1R1UXU4aU1lMDk5ZkhQekYv?=
 =?utf-8?B?ZWFNdEJLamxzUmE2ZGpJb04zeXFRNkx1aTQ1QlM3cUVTcGNBSjZvOHQvam9L?=
 =?utf-8?B?OU8vMmw3L0ZyelRyME5mQmRLUHgyM05SaURDQTlDOUFibTdrRmVTKzJpSFp2?=
 =?utf-8?B?cWhzbFJ4ZFVqQ3lpdEVmS0I2ZE1ZMzVDWkVqK2NCelJhYUFLdmNBL1VNMjJi?=
 =?utf-8?B?ampPZjNCZjA5SEFMbktlMGp1bmFpaUE1S21lWUJkdDBNcXIwdmIvamRoS0J0?=
 =?utf-8?B?eE45ZVh2UGt2Mm51ZUkvajlyM2JMR1dtY0YzYnlwaVF4WUo3SU93aGVwM1J1?=
 =?utf-8?B?bXV3NjRvaTN1S1AyRVJlZHVwbEhSZ1kvdTVLMzFyWUxhMVViRWRHbndpRGNa?=
 =?utf-8?B?eGUzODUrL3IvM0VVVVpRSVJDWmVIZXl2a0RhQUpmakQ4VkpReXUyTlppR1hU?=
 =?utf-8?B?bGVhK1UrV3I1VE13eWpabWJ4c1B6THJuWS94a0JYVFJvU3JPblFCYlcyOHYw?=
 =?utf-8?B?UUlxaGNqS3dnMFY1TW5MR0VUNGpPTUU3cjd6ai9XMkoyb2h5THdzbnhJQXlR?=
 =?utf-8?B?cnJYK29CUkRJSW0yQ1V0dXlkUEYremJLUXlldjBRNENEdldNUytTR3Zib01u?=
 =?utf-8?B?ZlgxL25HQ3U3aGh6Z1ZEdk9RTi80eE1SOWlEZTFWNzNHdGFJSlhyVGZMQUp6?=
 =?utf-8?B?QTMvU0JoK0xBOWh1KzA1ajZDMWY2L09sc0dmODVLQlA3UzN5TElGTE5xdkxE?=
 =?utf-8?B?Q1B2ZXRoZUJIbmN5WGVSd2l3VHYrNlZjWXlkSzhjbVkyZFY1YzdxSFVvZ3du?=
 =?utf-8?B?dGp2bVhCRkZYVkN0Z1BFTExnaWE1T2xlMU83anlFNzVQdUtDanVuSm5kYVUw?=
 =?utf-8?B?Y1JmL3lyNkpmRHJTNG5NQVNMMThhL3dqZmduVWg4SnphOU5DMzJteWN6OFor?=
 =?utf-8?B?dlQxM1IvOWgrTmxBZGlhdWNlVEV5WXNucEl6OU9aaDVET3lRb0xPcFBwVDRB?=
 =?utf-8?B?di9WQ201NVpiTFAxZDRMa0lLakZRYjZYR1ozbmlNOVdFWUpXRXhoL0dPdmhP?=
 =?utf-8?B?ditoZE9FU0Jqb0Yyd3dPQy9zOHk0TnB5T3pxYktkbVo4Z0k0aHA0VEhQSkRT?=
 =?utf-8?B?S1lZWWJHeDAxQXUvSjZYTmo5QzhrWmdVK0FBblVEZkFocDlTMkdlbUlmcmc3?=
 =?utf-8?B?SCtDbFRudU9KNENUazQ0NTRvRUJIVkpyOFFMWmJJYm1tRmUyekZsMFdyejhR?=
 =?utf-8?B?QThVSFJIbGUxaVhSUFA3a0M5RllXUUtnc1BtdGpQdEVtYjRiYTBjelJSQ3Rs?=
 =?utf-8?B?K1R5MU0vYjFTeVVEZDBYblBwZHJtSVBoN1pzeEMrUjBEVldJTVpyRDM0cWRC?=
 =?utf-8?B?ejRZbVlwYTkwbGlVOW83Zys5SzgwMVR0Tk5ndFdFY1AxdjRjd2ozK1NtaXFI?=
 =?utf-8?Q?dULSL2jv0/uw3WZc=3D?=
X-Exchange-RoutingPolicyChecked: US0QKaREtWZqMhefIrSLLr9ZUu9UJRYlSn/O6+XhoGUbSlqbh8XLd1UHuS/zN1SWLGf8r9t1Jl7OQjjoF3n7Pf9NeYUKsShvWH+Gc2XLgsgwThgcy653+JKAtzsQOg7Lw0TdfBVsJS3Z2vG8KZVjsDd7Sk3+I4gkqGMMFEc/jPfz82dyPcJLVAuXgTKiJkI/cHrrwY/WjoZAGX3Ep+7s2YVqBUzPdqGTez/XXkfRjgQ+rI4lKCbi3utFelzNEAebIdWAhqNsRnE46A3IX+IdTIDqPwnyZ0xe7YfqFG2t/sFIW73AWsE4kOAX5Mm84GHf9DG1ErVrUKNfgHeRgUR3zw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e94a068-9f1e-4cd2-2b1c-08df20791820
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 11:34:18.0482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpXbYKj0ZN38T12wl3Aei4mYMblbljPC8qVVuhDRN15ydo+Cr9Zlp3IFZRiaXv+LRQ0hwr8j1B+sjKVFaA8B7xSrTh1BQviu/7mvAMjvd4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6868
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add subtests for the optional Power Management, Advanced Error
Reporting, and Address Translation Service capabilities.
Skip an optional-capability subtest when the capability is not exposed
by the VF.
Validate the VF ROZ fields required by the SR-IOV specification,
including Power Management Data Select/Data, AER status/mask/severity
fields, and ATS Queue Depth/STU.

v2:
- Reuse the VF configuration captured by the common fixture.
- Use PCI register definitions available from linux/pci_regs.h.
- Simplify optional-capability skips and runtime descriptions.
- Remove redundant informational messages.

v3:
- Add the PCI register definitions used by the new checks to
  igt_pci_regs.h instead of relying on linux/pci_regs.h.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GitHub Copilot:GPT-5.6 Luna
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/igt_pci_regs.h       |  32 ++++++++++++
 tests/sriov_pci_config.c | 109 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/lib/igt_pci_regs.h b/lib/igt_pci_regs.h
index 9ec548f8d8..5d81f875ff 100644
--- a/lib/igt_pci_regs.h
+++ b/lib/igt_pci_regs.h
@@ -33,8 +33,14 @@
 #define  PCI_BASE_ADDRESS_MEM_TYPE_64	0x04	/* 64 bit address */
 
 /* Capability IDs */
+#define  PCI_CAP_ID_PM		0x01	/* Power Management */
 #define  PCI_CAP_ID_EXP		0x10	/* PCI Express */
 
+/* Power Management */
+#define PCI_PM_CTRL		4	/* PM control and status register */
+#define  PCI_PM_CTRL_DATA_SEL_MASK	0x1e00	/* Data select (??) */
+#define PCI_PM_DATA_REGISTER	7	/* (??) */
+
 /* PCI Express capability */
 #define PCI_EXP_FLAGS		2	/* Capabilities register */
 #define  PCI_EXP_FLAGS_VERS	0x000f	/* Capability version */
@@ -49,4 +55,30 @@
 #define  PCI_EXP_LNKSTA_LABS	0x8000	/* Link Autonomous Bandwidth Status */
 #define PCI_EXP_LNKSTA2		50	/* Link Status 2 */
 
+/* Extended Capability IDs */
+#define PCI_EXT_CAP_ID_ERR	0x01	/* Advanced Error Reporting */
+#define PCI_EXT_CAP_ID_ATS	0x0F	/* Address Translation Services */
+
+/* Advanced Error Reporting */
+#define PCI_ERR_UNCOR_STATUS	4	/* Uncorrectable Error Status */
+#define  PCI_ERR_UNC_DLP	0x00000010	/* Data Link Protocol */
+#define  PCI_ERR_UNC_SURPDN	0x00000020	/* Surprise Down */
+#define  PCI_ERR_UNC_FCP	0x00002000	/* Flow Control Protocol */
+#define  PCI_ERR_UNC_RX_OVER	0x00020000	/* Receiver Overflow */
+#define  PCI_ERR_UNC_MALF_TLP	0x00040000	/* Malformed TLP */
+#define  PCI_ERR_UNC_ECRC	0x00080000	/* ECRC Error Status */
+#define PCI_ERR_UNCOR_MASK	8	/* Uncorrectable Error Mask */
+#define PCI_ERR_UNCOR_SEVER	12	/* Uncorrectable Error Severity */
+#define PCI_ERR_COR_STATUS	16	/* Correctable Error Status */
+#define  PCI_ERR_COR_RCVR	0x00000001	/* Receiver Error Status */
+#define  PCI_ERR_COR_BAD_TLP	0x00000040	/* Bad TLP Status */
+#define  PCI_ERR_COR_REP_ROLL	0x00000100	/* REPLAY_NUM Rollover */
+#define  PCI_ERR_COR_REP_TIMER	0x00001000	/* Replay Timer Timeout */
+
+/* Address Translation Service */
+#define PCI_ATS_CAP		0x04	/* ATS Capability Register */
+#define  PCI_ATS_CAP_QDEP(x)	((x) & 0x1f)	/* Invalidate Queue Depth */
+#define PCI_ATS_CTRL		0x06	/* ATS Control Register */
+#define  PCI_ATS_CTRL_STU(x)	((x) & 0x1f)	/* Smallest Translation Unit */
+
 #endif /* __IGT_PCI_REGS_H__ */
diff --git a/tests/sriov_pci_config.c b/tests/sriov_pci_config.c
index 925235783d..913edaa532 100644
--- a/tests/sriov_pci_config.c
+++ b/tests/sriov_pci_config.c
@@ -42,6 +42,21 @@
  * Description: Validate that the Current De-emphasis Level field in Link
  * Status 2 is RsvdZ and therefore reads as zero for PCIe Capability Version 2
  * and later.
+ *
+ * SUBTEST: vf-power-management-capability
+ * Description: Validate that Data Select in Power Management Control and
+ * Power Management Data are ROZ and therefore read as zero when the optional
+ * Power Management capability is present.
+ *
+ * SUBTEST: vf-advanced-error-reporting
+ * Description: Validate that the specified ROZ bits in AER Uncorrectable
+ * Error Status, Mask, and Severity, and Correctable Error Status read as zero
+ * when the optional AER capability is present.
+ *
+ * SUBTEST: vf-ats-capability
+ * Description: Validate that ATS Queue Depth and the Smallest Translation Unit
+ * (STU) are ROZ and therefore read as zero when the optional ATS capability
+ * is present.
  */
 
 IGT_TEST_DESCRIPTION("Validate PCI configuration fields required for SR-IOV, "
@@ -160,6 +175,85 @@ static void check_vf_pcie_capabilities_2(const uint8_t *config)
 		     lnksta2);
 }
 
+static int get_optional_cap(const uint8_t *config, uint8_t cap_id, const char *name)
+{
+	int cap = igt_pci_config_raw_find_cap_offset(config, cap_id);
+
+	igt_assert_f(cap >= 0, "Invalid VF PCI capability list (%d)\n", cap);
+	if (!cap)
+		igt_skip("%s\n", name);
+
+	return cap;
+}
+
+static int get_optional_ext_cap(const uint8_t *config, uint16_t cap_id, const char *name)
+{
+	int cap = igt_pci_config_raw_find_ext_cap_offset(config, cap_id);
+
+	igt_assert_f(cap >= 0, "Invalid VF extended capability list (%d)\n", cap);
+	if (!cap)
+		igt_skip("%s\n", name);
+
+	return cap;
+}
+
+static void check_vf_power_management_capability(const uint8_t *config)
+{
+	int pm_cap = get_optional_cap(config, PCI_CAP_ID_PM,
+				     "Power Management capability is not present");
+	uint16_t pm_ctrl = igt_pci_config_raw_read_u16(config, pm_cap + PCI_PM_CTRL);
+	uint8_t pm_data = config[pm_cap + PCI_PM_DATA_REGISTER];
+
+	igt_assert_f(!(pm_ctrl & PCI_PM_CTRL_DATA_SEL_MASK),
+		     "Power Management Control: Data Select must be zero (0x%04x)\n", pm_ctrl);
+	igt_assert_f(!pm_data, "Power Management Data: expected 0x00, got 0x%02x\n", pm_data);
+}
+
+static void check_vf_advanced_error_reporting(const uint8_t *config)
+{
+	const uint32_t uncor_roz = PCI_ERR_UNC_DLP | PCI_ERR_UNC_SURPDN |
+				   PCI_ERR_UNC_FCP | PCI_ERR_UNC_RX_OVER |
+				   PCI_ERR_UNC_MALF_TLP | PCI_ERR_UNC_ECRC;
+	const uint32_t cor_roz = PCI_ERR_COR_RCVR | PCI_ERR_COR_BAD_TLP |
+					 PCI_ERR_COR_REP_ROLL | PCI_ERR_COR_REP_TIMER;
+	int aer_cap = get_optional_ext_cap(config, PCI_EXT_CAP_ID_ERR,
+					   "Advanced Error Reporting capability is not present");
+	uint32_t uncor_status = igt_pci_config_raw_read_u32(config,
+							     aer_cap + PCI_ERR_UNCOR_STATUS);
+	uint32_t uncor_mask = igt_pci_config_raw_read_u32(config,
+							   aer_cap + PCI_ERR_UNCOR_MASK);
+	uint32_t uncor_severity = igt_pci_config_raw_read_u32(config,
+							       aer_cap + PCI_ERR_UNCOR_SEVER);
+	uint32_t cor_status = igt_pci_config_raw_read_u32(config,
+							   aer_cap + PCI_ERR_COR_STATUS);
+
+	igt_assert_f(!(uncor_status & uncor_roz),
+		     "AER Uncorrectable Error Status: VF ROZ bits are set (0x%08x)\n",
+		     uncor_status);
+	igt_assert_f(!(uncor_mask & uncor_roz),
+		     "AER Uncorrectable Error Mask: VF ROZ bits are set (0x%08x)\n",
+		     uncor_mask);
+	igt_assert_f(!(uncor_severity & uncor_roz),
+		     "AER Uncorrectable Error Severity: VF ROZ bits are set (0x%08x)\n",
+		     uncor_severity);
+	igt_assert_f(!(cor_status & cor_roz),
+		     "AER Correctable Error Status: VF ROZ bits are set (0x%08x)\n",
+		     cor_status);
+}
+
+static void check_vf_ats_capability(const uint8_t *config)
+{
+	int ats_cap = get_optional_ext_cap(config, PCI_EXT_CAP_ID_ATS,
+					   "ATS capability is not present");
+	uint16_t ats_capability = igt_pci_config_raw_read_u16(config, ats_cap + PCI_ATS_CAP);
+	uint16_t ats_control = igt_pci_config_raw_read_u16(config, ats_cap + PCI_ATS_CTRL);
+
+	igt_assert_f(!PCI_ATS_CAP_QDEP(ats_capability),
+		     "ATS Capability: Queue Depth must be zero (0x%04x)\n", ats_capability);
+	igt_assert_f(!PCI_ATS_CTRL_STU(ats_control),
+		     "ATS Control: STU must be zero (0x%04x)\n", ats_control);
+}
+
 int igt_main()
 {
 	uint8_t vf_config[PCI_CFG_SPACE_EXP_SIZE];
@@ -200,6 +294,21 @@ int igt_main()
 		check_vf_pcie_capabilities_2(vf_config);
 	}
 
+	igt_describe("Validate the optional VF Power Management capability");
+	igt_subtest("vf-power-management-capability") {
+		check_vf_power_management_capability(vf_config);
+	}
+
+	igt_describe("Validate the optional VF AER capability");
+	igt_subtest("vf-advanced-error-reporting") {
+		check_vf_advanced_error_reporting(vf_config);
+	}
+
+	igt_describe("Validate the optional VF ATS capability");
+	igt_subtest("vf-ats-capability") {
+		check_vf_ats_capability(vf_config);
+	}
+
 	igt_fixture() {
 		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
 		igt_sriov_disable_vfs(pf_fd);
-- 
2.34.1

