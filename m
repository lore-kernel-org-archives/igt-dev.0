Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308AFCA5FC4
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 11:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FC610E45B;
	Fri,  2 Oct 2026 11:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0lEpN9G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5016010E45B
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 11:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790940860; x=1822476860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7FL/5NBIO0D+hT/YJR85OEw05lreiyDlaTzyZlbT9hI=;
 b=N0lEpN9GOV+FTOW5tkwTPp/TzQa4Ohiqradb15GfJHce+MpNt7U6ZNf4
 IIVhwjlaUp6HBrlWQU5uRvJFPAWiuPlEXJsPtJgGbIvIsaBCa+yycKGaV
 d/idO2AOkElqGIgcYEyowA/lF7sy0NgiFPSZOmmbX1gLlBwpQSadHIvcZ
 v07STxurQL3AsBcDYvFKa7g2exTYcy8Uo6vzugr7vu/gJlALps09UsEgF
 LnlyYdR4GZo4pQ533BWusanEBSwTpsR3Q8+s2NAfXXpTEbhaKNN2Tk0Mw
 iFnPHCkivE5o3PPlLwNqDLFqN8wVSTC3iDRHf/jZ/KyltrXRp/ZOgNBls Q==;
X-CSE-ConnectionGUID: 5HZTO/tVSwaG6Sw3fiToDA==
X-CSE-MsgGUID: xxy63wgpR+GGitAYGgp0UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="108084578"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="108084578"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 04:34:16 -0700
X-CSE-ConnectionGUID: GGbNf5ojQDaT/wqPONiDjg==
X-CSE-MsgGUID: l7ZVUC2NSUu0qHiFQ/mB8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="279489004"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 04:34:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 04:34:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 04:34:16 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 04:34:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxAkp2yeJCy9g6Bgc+cUCl50zPqWEfAGnHkVCt4akcWIVZXM5Zmu+l3H0kgToXVAkj4UR38hqKHaqsSs3beXSJ/n4mim52eU9S4z8kWr440W0jvkJBLzf7Sna09JIe28TehWsF5aDiBsVoRn+2zwYPgHiLn5ZaSUx3iUewx6s1ichzUPTezkO6ur/cPmmdpMNu9Kb2XmuR+E1IP7P7es1vb5ZgYV0XDup6JY9cdibBddh0R/G62nd0z/3fFkpd55UGOaGlPbIc1VI6JTV8aLXXbqOel8dWmA4xN38TwTfr/gQT9RK2HtWGeQJYtifCeb5S+BuYMbjkNDhu5ooeuJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZ2yyUW0AqnMOPPNJx55gxJQ+t7/2Lyt3kbCLnFrrp0=;
 b=DFPwJiQFfJrk/qJ8ArPcTOx1lRR0NsLdbyp2lHXK5xyCnOTamG1nyPQnLy07CqafCkLn/A+/nh+Lk/JyeTzAB+3j1rvmsCRqrVmXDXw/ILmNnEE9knFZmwU4k7dBmi2nn2Gt+uOOlgTAi0YDk+3LOTfjXIWvzKsioCChGJ+Ay1dtMCmDdZ4DvFK2n1KTcgRzvnEQubBoC5NQ4ZW+MkDrIqGYs8ECG/s9K1UCbIeBAUn8emJRlJVNsnMxgqzkNOzY9r7HQLv3sKtuwef+JMY+b+8K9ltNZAC2U69kynW9qlcIAeaUU2WcLvMFkx0z5GSaRoT8vzddVwAKlFzgjFKzFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Fri, 2 Oct
 2026 11:34:14 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 11:34:14 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 2/4] tests/sriov_pci_config: Add VF core config checks
Date: Fri, 2 Oct 2026 13:33:54 +0200
Message-ID: <20261002113356.3652805-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002113356.3652805-1-piotr.piorkowski@intel.com>
References: <20261002113356.3652805-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::7) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CY8PR11MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: 756f33e7-55d9-4147-a54e-08df207915d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|260925022911599003|260925021311599003|56012099006|260925021911599003|10067099003|18002099003|11063799006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: MPAz0jX+nDSB6PDS0FJqJBQ11ka7+vVGfB0NfMIVjGegvhbAcK6TLj9MTU1Dp5DQe/+lLW5WO9b+2wwY7Jxyb/AHByY5swjt7vmPU5nsPey26S+HpvvxEfwg8fiTgc1OOmVgZEGmYftOGHHxYEYM9NsVc7S5uW0H/Fkx84YlYyfr8wFBxPUJzsucvqOW3CjZIRoUcEh3GyzSI6mNWUZ7CT2ThpknVjNatbTL+q2qw4FsXdE0SE5jEZUND+p0U3hkDZsieRQmHKdswFX5OpzNQwLZphzViSHx7EewBxrqyHMTin9QCA73q5MpokBteD1FS1FGIhVzffs1YdnZ0ROfI0LN33/vkduLGtOP3sUdNEwyRkzNt67ieFtAo4wMOwvN4KXcyYqkV/+tQJ8ZuAbpklIcfVxTdyGVUmNNN/NEgsiVewRzUHudGLceoEEL5dxs9XhePRkmVA332L8QJCsYmFl5CAK+YPxN54XmYDo5tpIZaxqCng/pZf0kxObP+NJtedOuOkqlZO6ModvxiLY43twnXod5Bb4phzYDMZhAaKOMy+YDOnJSC/53MtLOkC9CDxsfptXJalJogEyeVVHUshaEtYWC33+MAhw/NJ38CiooWaj9nX/Qjom5VTKhi2UAU9RIu5fgtbi4WSmLiwO2y7yqq+77vkSFCpI1OxLE8mk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(260925022911599003)(260925021311599003)(56012099006)(260925021911599003)(10067099003)(18002099003)(11063799006)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXFNUDAzdFNZODlWeWs1eUNCVW1pT3E3SFI1OEJ1RVMxaGlzMHMxc3RUVFlK?=
 =?utf-8?B?ai94WVIyY2JjUGNWais3b3N3QWpWSE90R0R5NGVDUkh5VmdjUnNlOGRQdGxn?=
 =?utf-8?B?alc4SlFiWXp3Rm9LenlCaVZMQzMzQmtIeDRzd1UyWkExZEdFMHpWRkYxdExz?=
 =?utf-8?B?ZHBMc2RWa08rTi9yRTNkYXJSTy9HdVRlMmJvQkI5dVRGVkQ5NGJHQnU1WnVY?=
 =?utf-8?B?bGJsVEdWV1oxd1pVZndzRlYyWVVFTEdwRjY2UWJwMi83dVY5clRZbHdKS1JF?=
 =?utf-8?B?N0toakNsTDFkSXllOWI4R2JHSlkyTUY5WGMxSUNJa2d4cFlKZnYzaDNuQlRp?=
 =?utf-8?B?TkMzRjJuTEovcXZPZllNdVJWNjJrU2Q0akx4SzZKOWM2WFlNT0o2aFhWdmFB?=
 =?utf-8?B?MWRBSWV0ZXIwbjBwM3FLSFh0eHB2b2xRQWNqMCs5Wmp6WEpQVFFGck5XSWEv?=
 =?utf-8?B?VEhPZkRoY0VrekFTK2QvU0xvbFFSdnpESTE2ZE5vYjVwa21FZi9COS9HV3V5?=
 =?utf-8?B?SFhIalFKL0FYTVpBTHRZeGhJUU05U05uZUhSNmdWY1dpeGQ0dzRTc2RtTEIv?=
 =?utf-8?B?UVpRWElCNXNOL0Q1bUdXSmJ4d01ZNG1jN3RVZkVIdnNhckt4R0RRQ0txTDhv?=
 =?utf-8?B?TlNmZ3krUURpdmpqL1VNZWhhZE5xbnZpMlFPU2hVcE10dkRVS3dJNzBOYy8w?=
 =?utf-8?B?TGd2UGZmR2pRSUp3a0VXczdNUms3bkkrOEZDM01jWHJYUjJ3WStVd1BNVVNo?=
 =?utf-8?B?K0FWeENXcEpEdGg5dmVtZysyOTkzbisremRlSGZJVUxjeW1pRmFISXp6dUZw?=
 =?utf-8?B?bm1KZDJoeGh2TUJyeTF1NlptNUJDbG1ib0ExUHF2bkwwT1Y2U01GT29aTjl4?=
 =?utf-8?B?RWpLdUZTemsvMHk0Z1NnYlR6WUhiL08zQUZrdEVPUkQzekkvZFRORUxGNmxS?=
 =?utf-8?B?eTFGUVRqUlV5ZklLUjRwMUxGNFVCMDVodjdkMFVXLzJEc1ptOFpmS05iUEZk?=
 =?utf-8?B?ZStybkN0OTh0MVk5VERFSHIyWXRlRzRrSHpPQlNHOVh1YWtMb0o2WnMwd2pU?=
 =?utf-8?B?QlZGdFNjeDZEUUtobTVUUTd3NjJnamJRTUdvdTh4MGtCa2R2b2lyNThWL2Y0?=
 =?utf-8?B?TkFPMW55T2s4ZWQ1UGV1QlVMOWRFNUVjQ0h3bmtJTUY1MFF4UzRJUlZUQ2Z3?=
 =?utf-8?B?dHZ0L1ZjQlIwd3p3b2h4aEE4SnNOUnorSktVNVdaQmkzWXF1Skx1M1o1cHVD?=
 =?utf-8?B?NXBPT0lVdW5PMlJwbU5Wd09hMk10VzZXdXBnTThKVWFSQ3JWbVF3V0pzbTlO?=
 =?utf-8?B?UUpyZHdHQ2lEV2x3MUxPNXIvM3daUVZXaGtTb24wMk0xaGFGd2YrWS9hcHlI?=
 =?utf-8?B?NENnWDBqNFhiZVo5NEs3czRBR1VkTXNDS3J3NXRXaW1UMUsxQjUvTEErMWYw?=
 =?utf-8?B?RW1KTnllVzVtZlM1NXhSYVcrSzJQbzhOVWNtZGY0R0VndWZPWi9ZdzVnWm5N?=
 =?utf-8?B?bndubDk0OW82WGpra1dMellTTmpLRUFWZ0ZrWE9WQVl0Y0drRUZuTUFwWWdB?=
 =?utf-8?B?N2ZNNE5kaFUvdmtOZXpEcEhrdFBwOHBaeG1qOUV5ek9nRkFvbEU1NnZpVzg5?=
 =?utf-8?B?YXFFeENHQTJzVUo5L3pheXc2NWpsY3RTQzBHd3BwVCtkODFBTDB1VFFzODNY?=
 =?utf-8?B?NmlWbWlKejR2WVFsMnd4USszQzhlV3V2MG81MHZlcGJNcWM3bDh5Y041TTJs?=
 =?utf-8?B?c1BxOWdxSTJnM09zVHhjNnpYUnN6aTRaR2hxMERVdjh3amY5ckl0ZzRKejky?=
 =?utf-8?B?eEdySU5scEdXZnhvYXlmUGVOMyt4MVdhRXVqa2h1My82RDVtamxiQ2RJRjJT?=
 =?utf-8?B?eGZwejdLblJ2QkViT1pBcnhuQWlkdGdtS1lMMndVV21PZHNOdFU0MHFxT1k4?=
 =?utf-8?B?UEU3WUV0S1dDUDIyTWdjNGtzb3g2S2hkTkE1RnpEcFoweXBxVnArMElNcDNk?=
 =?utf-8?B?Rm9IT2UreWZ3TkNHOWhWdzRvZ0x4TytKTGdtS2M3emcvMXBIVkY0dWNqNDc4?=
 =?utf-8?B?WWFFOFUxS2ZtN1N1blZSMzYwNDFuTU9rV0JuQldQL0RyMU53THZTK1BZSFhr?=
 =?utf-8?B?RUNKL3MvU3B2TEhxQjg2NXJMODI1YXhVbTl1cVJ0NEduZFdwTDRHV1VHU1lh?=
 =?utf-8?B?Qm5Wb1J2aDZEb2x2UGlra3did0ZFS0ZZMGc4SzhaYnhQR0hxUVNHTFpYVDFE?=
 =?utf-8?B?eUNqQ253clQyUXpxUGhTK0hjL1A2bUF6Z2xWWDNwWFBXUUdDamU4bFRqbHB1?=
 =?utf-8?B?Wk5hZXRnQXdoSVV0SW1PYmZ6MzE0UFRHai9Gd25pMDFmVURIdnN5dHRoTS9C?=
 =?utf-8?Q?wPdAO8IlWTjDEH0Q=3D?=
X-Exchange-RoutingPolicyChecked: FIdbnTj+5rDkgB+/zeZGN5bYmdaeQlMKuKSr9SFs51h0GfK7HbctA5ZacUwYXG7AdVQDcK1F/L0uaF6cXaWiPFoVvfBkNA0HuvBVDHRfGCt7Wk2GAaeqRlX3NUYmlNuXb4pqgPQFgWdwxu38UrfzIFBhZWHVbjxlU1iU7widEIIHVhsAeiJKawXvuKOFUVsXU5KJ1wjSjQ4Hqj73UaUgu2KG7QbbcO37BMFp9m4z3IiDYapsxHbLwYOwC4UYN1/c4fG76oqn/AforuWrGifTYaRJd3EcDcjUNOpMLiBvdhTJ2hoVMy7f6P0ZbF9Eae6xvHDMW/0dVPkkajBLtxOzqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 756f33e7-55d9-4147-a54e-08df207915d8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 11:34:14.1876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4rryD3xkzhbnf04xmo6h2bR0aTs3gf+1FU6qg8jYSAi+nFT4RRMeB7xwC4xzQQwLkjpB7LIWm6H5LvR7z33qh93xuMY6mVmeTi5yWWCAic=
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

Add checks for PCI configuration fields required by SR-IOV VFs.
Cover the common header, BARs, and PCI Express capability fields.

v2:
- Enable the VF and read its configuration once in the fixture.
- Restore driver autoprobe state and disable the VF during cleanup.
- Clarify test documentation and shorten runtime descriptions.
- Remove redundant informational messages.

v3:
- Move test state from globals to igt_main().
- Add missing blank lines in the test.
- Reject a 64-bit memory BAR type in BAR5.

v4:
- Add the PCI register definitions used by the test to igt_pci_regs.h
  instead of relying on linux/pci_regs.h.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GitHub Copilot:GPT-5.6 Luna
---
 lib/igt_pci_regs.h       |  35 +++++++
 tests/meson.build        |   1 +
 tests/sriov_pci_config.c | 215 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 251 insertions(+)
 create mode 100644 tests/sriov_pci_config.c

diff --git a/lib/igt_pci_regs.h b/lib/igt_pci_regs.h
index 5d6fece776..9ec548f8d8 100644
--- a/lib/igt_pci_regs.h
+++ b/lib/igt_pci_regs.h
@@ -14,4 +14,39 @@
 #define PCI_CFG_SPACE_SIZE	256
 #define PCI_CFG_SPACE_EXP_SIZE	4096
 
+#define PCI_VENDOR_ID		0x00	/* 16 bits */
+#define PCI_DEVICE_ID		0x02	/* 16 bits */
+#define PCI_COMMAND		0x04	/* 16 bits */
+#define  PCI_COMMAND_IO		0x1	/* Enable response in I/O space */
+#define  PCI_COMMAND_MEMORY	0x2	/* Enable response in Memory space */
+#define  PCI_COMMAND_INTX_DISABLE 0x400 /* INTx Emulation Disable */
+#define PCI_STATUS		0x06	/* 16 bits */
+#define  PCI_STATUS_IMM_READY	0x01	/* Immediate Readiness */
+#define  PCI_STATUS_INTERRUPT	0x08	/* Interrupt status */
+#define PCI_HEADER_TYPE		0x0e	/* 8 bits */
+#define  PCI_HEADER_TYPE_MASK		0x7f
+#define PCI_BIST		0x0f	/* 8 bits */
+#define  PCI_BIST_CODE_MASK	0x0f	/* Return result */
+#define PCI_BASE_ADDRESS_0	0x10	/* 32 bits */
+#define  PCI_BASE_ADDRESS_SPACE		0x01	/* 0 = memory, 1 = I/O */
+#define  PCI_BASE_ADDRESS_MEM_TYPE_MASK	0x06
+#define  PCI_BASE_ADDRESS_MEM_TYPE_64	0x04	/* 64 bit address */
+
+/* Capability IDs */
+#define  PCI_CAP_ID_EXP		0x10	/* PCI Express */
+
+/* PCI Express capability */
+#define PCI_EXP_FLAGS		2	/* Capabilities register */
+#define  PCI_EXP_FLAGS_VERS	0x000f	/* Capability version */
+#define PCI_EXP_DEVCAP		4	/* Device capabilities */
+#define  PCI_EXP_DEVCAP_PHANTOM	0x00000018 /* Phantom functions */
+#define  PCI_EXP_DEVCAP_FLR     0x10000000 /* Function Level Reset */
+#define PCI_EXP_DEVSTA		10	/* Device Status */
+#define  PCI_EXP_DEVSTA_AUXPD	0x0010	/* AUX Power Detected */
+#define PCI_EXP_LNKSTA		18	/* Link Status */
+#define  PCI_EXP_LNKSTA_CLS	0x000f	/* Current Link Speed */
+#define  PCI_EXP_LNKSTA_NLW	0x03f0	/* Negotiated Link Width */
+#define  PCI_EXP_LNKSTA_LABS	0x8000	/* Link Autonomous Bandwidth Status */
+#define PCI_EXP_LNKSTA2		50	/* Link Status 2 */
+
 #endif /* __IGT_PCI_REGS_H__ */
diff --git a/tests/meson.build b/tests/meson.build
index 4f5c9be7b4..0e1a3faf32 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -74,6 +74,7 @@ test_progs = [
 	'meta_test',
 	'prime_vgem',
 	'sriov_basic',
+	'sriov_pci_config',
 	'syncobj_basic',
 	'syncobj_eventfd',
 	'syncobj_wait',
diff --git a/tests/sriov_pci_config.c b/tests/sriov_pci_config.c
new file mode 100644
index 0000000000..925235783d
--- /dev/null
+++ b/tests/sriov_pci_config.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#include "drmtest.h"
+#include "igt.h"
+#include "igt_pci.h"
+#include "igt_pci_regs.h"
+#include "igt_sriov_device.h"
+
+#define VF_PCI_EXP_DEVSTA_EPRD		(1 << 6)
+#define VF_PCI_EXP_LNKSTA2_DEEMPHASIS	(1 << 0)
+
+/**
+ * TEST: SR-IOV PCI configuration
+ * Category: Core
+ * Mega feature: SR-IOV
+ * Sub-category: PCI configuration
+ * Functionality: SR-IOV-related PCI configuration space
+ * Description: Validate PCI configuration fields required for SR-IOV,
+ * including Virtual Functions.
+ *
+ * SUBTEST: vf-common-header
+ * Description: Validate that the VF Vendor ID and Device ID read as 0xffff,
+ * and that the I/O, Memory, and INTx Disable bits in Command, the Immediate
+ * Readiness and Interrupt Status bits in Status, the Header Layout bits in
+ * Header Type, and the BIST Completion Code are all zero.
+ *
+ * SUBTEST: vf-bars
+ * Description: Validate that VF BAR address bits read as zero. The BAR type
+ * and attribute bits are static and may remain set; the upper dword of a
+ * 64-bit BAR must read as zero.
+ *
+ * SUBTEST: vf-pcie-capabilities
+ * Description: Validate that FLR is supported, and Phantom Functions Supported,
+ * Auxiliary Power Detected, Emergency Power Reduction Detected, Current Link
+ * Speed, Negotiated Link Width, and Link Autonomous Bandwidth Status are all
+ * zero.
+ *
+ * SUBTEST: vf-pcie-capabilities-2
+ * Description: Validate that the Current De-emphasis Level field in Link
+ * Status 2 is RsvdZ and therefore reads as zero for PCIe Capability Version 2
+ * and later.
+ */
+
+IGT_TEST_DESCRIPTION("Validate PCI configuration fields required for SR-IOV, "
+		     "including Virtual Functions");
+
+static void read_vf_config(int pf_fd, uint8_t *config)
+{
+	char *vf_slot;
+	int ret;
+
+	vf_slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, 1);
+	igt_assert(vf_slot);
+	ret = igt_pci_config_raw_read(vf_slot, config, PCI_CFG_SPACE_EXP_SIZE);
+	free(vf_slot);
+	igt_assert_f(!ret, "Failed to read VF config space (%d)\n", ret);
+}
+
+static void check_vf_common_header(const uint8_t *config)
+{
+	uint16_t command = igt_pci_config_raw_read_u16(config, PCI_COMMAND);
+	uint16_t status = igt_pci_config_raw_read_u16(config, PCI_STATUS);
+	uint16_t vendor_id = igt_pci_config_raw_read_u16(config, PCI_VENDOR_ID);
+	uint16_t device_id = igt_pci_config_raw_read_u16(config, PCI_DEVICE_ID);
+
+	igt_assert_f(vendor_id == 0xffff, "Vendor ID: expected 0xffff, got 0x%04x\n", vendor_id);
+	igt_assert_f(device_id == 0xffff, "Device ID: expected 0xffff, got 0x%04x\n", device_id);
+	igt_assert_f(!(command & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
+				  PCI_COMMAND_INTX_DISABLE)),
+		     "Command: expected I/O, Memory, and INTx Disable bits clear, got 0x%04x\n",
+		     command);
+	igt_assert_f(!(status & (PCI_STATUS_IMM_READY | PCI_STATUS_INTERRUPT)),
+		     "Status: expected Immediate Readiness and Interrupt Status bits clear, got 0x%04x\n",
+		     status);
+	igt_assert_f(!(config[PCI_HEADER_TYPE] & PCI_HEADER_TYPE_MASK),
+		     "Header Type: expected Header Layout 0, got 0x%02x\n",
+		     config[PCI_HEADER_TYPE]);
+	igt_assert_f(!(config[PCI_BIST] & PCI_BIST_CODE_MASK),
+		     "BIST: expected Completion Code 0, got 0x%02x\n", config[PCI_BIST]);
+}
+
+static void check_vf_bars(const uint8_t *config)
+{
+	for (int bar = 0; bar < 6; bar++) {
+		uint32_t value =
+			igt_pci_config_raw_read_u32(config,
+						    PCI_BASE_ADDRESS_0 + bar * sizeof(uint32_t));
+		bool is_io = value & PCI_BASE_ADDRESS_SPACE;
+		uint32_t attr_mask = is_io ? PCI_BASE_ADDRESS_SPACE : 0xfu;
+		bool is_mem64 = !is_io &&
+				(value & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
+				PCI_BASE_ADDRESS_MEM_TYPE_64;
+
+		/* Only the address bits are hardwired to zero; attributes are static. */
+		igt_assert_f(!(value & ~attr_mask), "BAR%d: expected address 0x00000000, got 0x%08x\n",
+			     bar, value);
+
+		/* The upper dword of a 64-bit BAR holds pure address bits, no type bits. */
+		if (is_mem64) {
+			unsigned int upper_offset = PCI_BASE_ADDRESS_0 +
+						    (bar + 1) * sizeof(uint32_t);
+			uint32_t upper =
+				igt_pci_config_raw_read_u32(config, upper_offset);
+
+			igt_assert_f(bar < 5, "BAR%d: 64-bit memory type in the last BAR (0x%08x)\n",
+				     bar, value);
+			igt_assert_f(!upper, "BAR%d (upper): expected 0x00000000, got 0x%08x\n",
+				     bar + 1, upper);
+			bar++;
+		}
+	}
+}
+
+static int get_pcie_cap(const uint8_t *config)
+{
+	int pcie_cap = igt_pci_config_raw_find_cap_offset(config, PCI_CAP_ID_EXP);
+
+	igt_assert_f(pcie_cap > 0, "VF has no PCI Express capability (%d)\n", pcie_cap);
+
+	return pcie_cap;
+}
+
+static void check_vf_pcie_capabilities(const uint8_t *config)
+{
+	int pcie_cap = get_pcie_cap(config);
+	uint32_t pcie_devcap = igt_pci_config_raw_read_u32(config, pcie_cap + PCI_EXP_DEVCAP);
+	uint16_t pcie_devsta = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_DEVSTA);
+	uint16_t pcie_lnksta = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_LNKSTA);
+
+	igt_assert_f(pcie_devcap & PCI_EXP_DEVCAP_FLR,
+		     "Device Capabilities: FLR bit is clear (0x%08x)\n", pcie_devcap);
+	igt_assert_f(!(pcie_devcap & PCI_EXP_DEVCAP_PHANTOM),
+		     "Device Capabilities: Phantom Functions Supported must be zero (0x%08x)\n",
+		     pcie_devcap);
+	igt_assert_f(!(pcie_devsta & (PCI_EXP_DEVSTA_AUXPD |
+					  VF_PCI_EXP_DEVSTA_EPRD)),
+		     "Device Status: Aux Power Detected or Emergency Power Reduction Detected is set (0x%04x)\n",
+		     pcie_devsta);
+	igt_assert_f(!(pcie_lnksta & (PCI_EXP_LNKSTA_CLS | PCI_EXP_LNKSTA_NLW |
+					 PCI_EXP_LNKSTA_LABS)),
+		     "Link Status: Current Link Speed, Negotiated Link Width, or Link Autonomous Bandwidth Status is set (0x%04x)\n",
+		     pcie_lnksta);
+}
+
+static void check_vf_pcie_capabilities_2(const uint8_t *config)
+{
+	int pcie_cap = get_pcie_cap(config);
+	uint16_t flags = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_FLAGS);
+	uint16_t lnksta2;
+
+	if ((flags & PCI_EXP_FLAGS_VERS) < 2)
+		igt_skip("PCI Express Capability Version 2 is not present\n");
+
+	lnksta2 = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_LNKSTA2);
+	igt_assert_f(!(lnksta2 & VF_PCI_EXP_LNKSTA2_DEEMPHASIS),
+		     "Link Status 2: Current De-emphasis Level must be zero (0x%04x)\n",
+		     lnksta2);
+}
+
+int igt_main()
+{
+	uint8_t vf_config[PCI_CFG_SPACE_EXP_SIZE];
+	int pf_fd = -1;
+	bool autoprobe = false;
+
+	igt_fixture() {
+		pf_fd = drm_open_driver(DRIVER_ANY);
+		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_vfs_supported(pf_fd));
+		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
+
+		igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_sriov_enable_vfs(pf_fd, 1);
+		igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
+		read_vf_config(pf_fd, vf_config);
+	}
+
+	igt_describe("Validate the VF PCI common header");
+	igt_subtest("vf-common-header") {
+		check_vf_common_header(vf_config);
+	}
+
+	igt_describe("Validate the VF BARs");
+	igt_subtest("vf-bars") {
+		check_vf_bars(vf_config);
+	}
+
+	igt_describe("Validate the VF PCI Express capability");
+	igt_subtest("vf-pcie-capabilities") {
+		check_vf_pcie_capabilities(vf_config);
+	}
+
+	igt_describe("Validate the VF PCI Express Capability Version 2 fields");
+	igt_subtest("vf-pcie-capabilities-2") {
+		check_vf_pcie_capabilities_2(vf_config);
+	}
+
+	igt_fixture() {
+		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
+		igt_sriov_disable_vfs(pf_fd);
+		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
+			       "Failed to disable VF(s)\n");
+		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
+			    igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
+			       "Failed to restore sriov_drivers_autoprobe value\n");
+		igt_sriov_clear_exit_handler();
+		close(pf_fd);
+	}
+}
-- 
2.34.1

