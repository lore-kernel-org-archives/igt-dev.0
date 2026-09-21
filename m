Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31835C982E6
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 14:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D8210E32D;
	Mon, 21 Sep 2026 14:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kx0x0ses";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FCD10E8A2
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 14:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790001450; x=1821537450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AFd2xW/Ty+rHIe3NDx24LbUGEDFNbQA1JIv3esduQTE=;
 b=kx0x0sesotQVAoHkz4SajDuBdB2HhYKVZDYt63yJwVDgSBZaANa0sIkv
 oQNTmywWlgQe8i14fmbFlq0vGc6ha+vWqwMg+MxtImkHFzUrPlHgA/7ra
 vnWx2XdLugdWRbE1evdcfIOsOID0LBhwIBOHeQ/mImX9/zHFeqqaxC+OB
 S+WdL8V63gaJBhk/VZyVEfFCOyYvVla7QaHbuWEYpJmxhbD0auXYWQpVm
 sHcpza3AIKY9+e01bfcIZgumLZXG2m+QIC8iSU7YFxNtzlK7SAUuwXA4s
 SKKo+VDK07HsZ3FXPPZiHQm+JNgvG8BLNpAfZ8qq9Fp73k+oPNy+3F39s g==;
X-CSE-ConnectionGUID: bzrIdg1vT/2abrFcUpW0OA==
X-CSE-MsgGUID: s/9OaztJQ0agtKQ6cRZvjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101868178"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="101868178"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:37:30 -0700
X-CSE-ConnectionGUID: 31oRUfT8Q7O4htD6ZEGYTA==
X-CSE-MsgGUID: bhPGQcQmQBCzO8XT4iUHHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="272159615"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:37:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:37:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 07:37:29 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:37:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDV3LHIguULiRpn2SuiEka8TWVF1jEr+K5Rd9LYyrhUkvXhN0RANViqLE3dmz1fXfZ8I8+x3aG6TLoVY9D2sQoHLgq1a5S/TLg9/j5y3aPdF3iwkLF2AlEGg3Wf7dc3Qh21ExIFwOu3eQQSCIjq5qNHeqeWfzydWk5fsiXTwmnidoLtYDWbkAJeIpukajLQzMmNcAGbiF93xj1MEUsPa4gWHpWXwn4d0O8WWbG3fJ/dGHyxyps2WmaOJPrtGHQkYbgcoap2vDo2Qbm3Gi0534KD1C2CGYhEkN2/eOgWlNAQ6Hm4Uynnrm2iq3iLaR8rW/HKFkpHIjXkmhTE38FvDgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hOEue56D/Agm6UYl0YfLY4/Z4f7i5TAZJoepErzFGk=;
 b=EAcNx8K1FMij/EXbD/ahLRdJ/hWkhQAcEhNmWnwMD8KdrnWJ0Dn+hvLS2wxw/EAkSqPYA0OH/lWbhMlP+VQejmb7wNJwch/MnLTC9ZKFuuldyQ95zpE9pB6A7rGOxGWDT8wAipSSKmD12GJ2Q51UteKL2HCYXPgd8rXK1uxStFFEiFGWglW1PfPN6pdaMKjNwMP17RnKEcfyid3fhqBhapVJaoUzip3VN8VcCO8oBLPkj+Q4lEniq49XM1cT7sGgPRwthvJMoRQTvpqukznUMkCnbJFBh+jDwrIKuAaje25XijxrwBmzFVjVj/hy/gkwTn61fm+ibRXrh1EfqhwooQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA3PR11MB8919.namprd11.prod.outlook.com (2603:10b6:208:576::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 14:37:27 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 14:37:26 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 1/4] lib/igt_pci: Add raw configuration space helpers
Date: Mon, 21 Sep 2026 16:37:04 +0200
Message-ID: <20260921143707.2117970-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921143707.2117970-1-piotr.piorkowski@intel.com>
References: <20260921143707.2117970-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0226.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::47) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA3PR11MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e167a78-02b1-4ad5-47e4-08df17eddb6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3udut+Q99TL5mlnbk9V4t2X1cC1r6Z5iETgriaFmI0NF11EX7jPvSdejcgcb+ZxJsIMZORTlesGHg+MUKT+PjvGVHmuO96Q4GYoYgUAKZvgix8SdEGtPU1A++wSCWACH24jD3LGM912LOxRdKwNoO060l3bUy33Q7QOjwmVHz0FnGEN7/kwCI7KA2t92NAMyrJbZOeGaf6mq5E7q/4ryIxMq9t7gLcjxK6dIh2sZ/NED55AXIMrD89aznnqMWpnB3BzcqI2g/ly+VE7NVo/M+IDUq9GK7Ma6bHjBR+ttC1mzSlNeEZV0K0ahw6kYqjyGvEincqBfrSQU6VM1mvp+pxQZ4ErKIUbVKxBS64ugh2gz4f31dYWX7ij0HrzaGDavKfa2raDdD9O42E8csB24tJZqUFoBSZhvViA0qdqn+7uUrY+pW2Yz2RFt4XUQJNDndgmlr85HdbshgUg/MkOTHOF7hkfJTcREOuqRpiC+6EXWhgl/gDIxtz48WOtMzm+PVAk6sHs9Mdss0rVzoXQz1md6AVMPLAxajwQ7OjBTdlPmnxRNuEfs5TzBla0aMEk7yGnSyCfCQLTi/q0c+jobawasnnB+ocZN+wzd4FPSH4tmu4Q9F4/JVLKdgSorY6ut9qdSc3wv1HkAshD7ZlKQ+G7YujQTuLjHnAuIwtyina0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEdQazFZcWx5SDB0KzNvVjZRZjhRT0NSZzBhbHRTa2llMFZOVENWS1lxbXVW?=
 =?utf-8?B?UDRsQk55NkFycW1Ca0Mrd2V4V3ZTSkIySWZKRkUwNnpKUHFWTTlSemMySGZX?=
 =?utf-8?B?Zk4yQjZlU2x1WjViQVE3QTgzaGUwOU82MG9sYk9BZklKZ2h2dVJIbXlrR3dK?=
 =?utf-8?B?UVdQTFBqMDZCdFRIalBjR3g5OWZTWUkzcVkvWUZyTkc4Y0hzdCtjWGlIWU5k?=
 =?utf-8?B?QnZCc0xTbURWS3JUb0ZvYkwwTU1jdnRSNkJHaVFpSGRuc0I3eG5remxoeVNF?=
 =?utf-8?B?dURGTU5TNFNibU13eGJqSVd3QzdNdUVyZzFGOU9xTldib0VmUHhVMWlPbnVv?=
 =?utf-8?B?NUdwL2hmY3JQeWFQRldUR1pIZjVzR1lHTzgvSG5YVlFtOFlmekxwd3RqL0tP?=
 =?utf-8?B?aGFoT0NBazNnMTczVzQxRkFGVWN6V28reWVOMlRnVFpMQkxNQUhKeC9rZmlB?=
 =?utf-8?B?NDdHMzBUUkYvNUkwVlRHd1l2bGVXVFhnNGhua01MVVNrd0ZkV1NCc25XZWpm?=
 =?utf-8?B?SW9TY2xMZm52WW83cWRXRENCQ2pjVEwxalEzWldzblZCb3FtY0NZaEdRMEVa?=
 =?utf-8?B?K0J5aTlEZXVBdE9WU2l3NUJpTEZJbDgrQi9DeEtsUTBKdlo2Zk9zcEZQQXRo?=
 =?utf-8?B?SFovblFvTWtndVRoNjVTQ0V3cHg0d2Q4MlVHQ0hXSzF1YUZWWXVBWUFDMlBp?=
 =?utf-8?B?cSt4KzVUMm1zZzVqSStVa28vSVVLRDc2eFJXeVRITHowVEg1K0pvaHN0WEtT?=
 =?utf-8?B?MS8yYmcvbFBUWE9QUVYzamhHYVRhME5wblhaOHRHOWl4eFlYY3pXbUp0cEpI?=
 =?utf-8?B?TTBzZzJLQm5PRW5SdGNUM3k3WnByU2k4UHZvYWxhWnRKOE5rZHgzMlVJTFo2?=
 =?utf-8?B?THlOaldneFd3UERUbDUwTmQyUjVYTzYwaTZpNVEvZUlDeHo1V25aaUVkUUVN?=
 =?utf-8?B?Mkk1aXpta09oV2R1YXp4bDNQejNMZFdVRmhuK0x2RkZoQ3ZOeWUyd05jTElS?=
 =?utf-8?B?WjA5M1lhVFRNR2hHT1dIRCtVL2pjNE1hRGtsSHA5SkZoQjJPcUxGck5iUGdY?=
 =?utf-8?B?eW01WkZ5R0hnSzZmcG1ZU3dIdWJkRnloUW5zR1RVUnU2WXcvTTIwaTBkUW5Q?=
 =?utf-8?B?K2hjUFlWRzZYbS9icVlkd0NHV0ZJcmtlVVdyMm0yeHBTNTdNK1dQTUovZSt2?=
 =?utf-8?B?TXYwN2F6V0doRUM2SjdzeGFLUTRxMGVUS050M0JZTzNudUhMNW5UZzVDalI0?=
 =?utf-8?B?YUN2Y2NMOVlWS1N3WEd2aC9vK1BYZmlqUUdid2Q4VTM0Y25CNEFpd3J3UXFu?=
 =?utf-8?B?T3lRaHVnb200UEJGZWtXU01yai8zOVB6QnhYMFBCRzFmaGNJU3NXbFFYMmEx?=
 =?utf-8?B?RnBlTk82RXgzNWNoci9YcTVUSGF6cXAzWGJ3S0tVRUUyZ0IySURjZEpkMTB0?=
 =?utf-8?B?TXh4VWYrOEtlNEU2cm9hdzhveWliWk80VHh6U1RnTDFvOGNaUTc1YWY2NXFX?=
 =?utf-8?B?ZHkvUXB1MzVkd3ZRM2x0SDJMNzZlL2NPVFZucEoxdUpWSy84Tk5pNWppYnQ3?=
 =?utf-8?B?bE54MktQem5rT1U2Y3FiTEdyd1prMS9mS1J4dGRmQ05TMk5lVWZJVTBuTDdZ?=
 =?utf-8?B?ekhBdUJTUUR0WUZqaXhYZ2JWbFN1c0VzWlNsQXJEbDRSK0VBekFnVFYzem1W?=
 =?utf-8?B?ZGozRVR0enU1eEs5RktmVm94NkR1bldleFBDdVZLOGpHTS8xTlpJZ1kwV3o5?=
 =?utf-8?B?Y1lTYkdCVUpIZjVWR29kdDdoUzRvODFWNTY0QjliblVzZE5MNGwyb3Y2byt0?=
 =?utf-8?B?Wkk4RnJJbU1ERzdReXZtdUZzMkdDWlBLMnp5REtjaTd2WTZScFdDWk9oNTRN?=
 =?utf-8?B?NkFNK1VWalRRenNNVkZMczRkbzJudkhudDQ1cWtYM0N0K3JpdGQzeDBwSXk3?=
 =?utf-8?B?SE5VK2srdmZWTVNmcjAvMWM3ZGFZQ2YvRndYVVRJWHNpMjMyZkV6OEJBaG82?=
 =?utf-8?B?eFhJajgzTFFwWHk2MHBZeG90K0k0NE02dmZFZHNIRFpvRUM3cDhnTnhlK2RH?=
 =?utf-8?B?N094aFlrN01ZRnBFNlE5clQ3aVFQNVduMDNRUmJRS1NvWUJPcGFKeTVlUXhv?=
 =?utf-8?B?Z0NKSDZWOXhLOUJZeVVteG9Sa0dZYSs5TXd4RnV3Q21nN3pscEYwV0lxcGsy?=
 =?utf-8?B?U2c1VnFZVG9hWVFGS3pSaUJ2MW8rZDlBc2FubWpxMVlwVnVoczduQ09jUEdq?=
 =?utf-8?B?UERpVkx0V0dublVuU1F0eWlkRFRuNU9xeFZNMHIrM29ZOFRKWTE3TDV0b0Iv?=
 =?utf-8?B?VnJmM1JrZ0NvZkJETThJWmJSUm1yNjJGQlY4eDZ6QUpEK095aU5kR1ZiYUVP?=
 =?utf-8?Q?YaxZs7Fk8Mof9nKo=3D?=
X-Exchange-RoutingPolicyChecked: EJdRbm/AgBcBKyM3RwCkxIXqcLyaHJDjCIr3RB+P7zNiyjA6TSF9FVP0ZdsPtKewX1q1SyNU6o5/NEzqfHkljh0wzeD0TEt+i+f8njY8jiEOYEqabUkcoeuevl+xo/82ZP0SUx5Iv0/ScSo19YYU00Aw9JzdbCvi+ndhHaquW1gkXK4M7O3I1xQn/HZrv5/RxAggHGf54OKefKxPIA89BHr/YgVI4LurTj3YVuVRuzUS6na+r+eykspv7YxKYz4heGiwtWdudEvXgsWQ1+hT6pWo8MvQpWoicoSImmiuhEOKo0TYUK+/2tVzeOi9ATgiJLT/cca/xUO4mg0PEJzMDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e167a78-02b1-4ad5-47e4-08df17eddb6e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:37:26.7815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 859f7v2fYOUQc1vGuPvqc1eaD1uOZ39hqB6Gb/l/yR4WvSNqah1S2wQLurgC/2HZW/RkV4g1qb/m8lShXkBKFx9WKP4BgH0D9VKW1odOZuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8919
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

Add helpers to read raw PCI configuration space from sysfs and access
its contents.
Provide little-endian u16/u32 readers and standard and extended
capability lookup helpers for configuration-space buffers.

v2:
- Validate malformed and cyclic capability chains.
- Add unit tests for capability lookup and malformed chains.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GPT-5.6 Luna
---
 lib/igt_pci.c         | 90 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pci.h         |  8 +++-
 lib/tests/igt_pci.c   | 66 +++++++++++++++++++++++++++++++
 lib/tests/meson.build |  1 +
 4 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 lib/tests/igt_pci.c

diff --git a/lib/igt_pci.c b/lib/igt_pci.c
index b63550b390..7cc9f2dfd6 100644
--- a/lib/igt_pci.c
+++ b/lib/igt_pci.c
@@ -8,6 +8,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
+#include <linux/pci_regs.h>
 #include <string.h>
 #include <unistd.h>
 #include <pciaccess.h>
@@ -61,6 +62,95 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
 	return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
 }
 
+/**
+ * igt_pci_config_raw_read:
+ * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
+ * @buffer: destination buffer
+ * @length: number of configuration-space bytes to read
+ *
+ * Read raw PCI configuration space through the device sysfs config attribute.
+ *
+ * Returns 0 on success, otherwise a negative errno-like value.
+ */
+int igt_pci_config_raw_read(const char *pci_slot, void *buffer, size_t length)
+{
+	char path[PATH_MAX];
+	ssize_t ret;
+	int err;
+	int fd;
+
+	if (!pci_slot || !buffer || !length)
+		return -EINVAL;
+
+	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/config", pci_slot);
+	fd = open(path, O_RDONLY | O_CLOEXEC);
+	if (fd < 0)
+		return -errno;
+
+	ret = pread(fd, buffer, length, 0);
+	err = errno;
+	close(fd);
+	if (ret < 0)
+		return -err;
+
+	return (size_t)ret == length ? 0 : -EIO;
+}
+
+uint16_t igt_pci_config_raw_read_u16(const uint8_t *config, unsigned int offset)
+{
+	return config[offset] | (config[offset + 1] << 8);
+}
+
+uint32_t igt_pci_config_raw_read_u32(const uint8_t *config, unsigned int offset)
+{
+	return igt_pci_config_raw_read_u16(config, offset) |
+	       ((uint32_t)igt_pci_config_raw_read_u16(config, offset + 2) << 16);
+}
+
+int igt_pci_config_raw_find_cap_offset(const uint8_t *config, uint8_t cap_id)
+{
+	unsigned int offset = config[PCI_CAPS_START];
+	unsigned int loop = (PCI_CFG_SPACE_SIZE - PCI_TYPE0_1_HEADER_SIZE) / 2;
+
+	while (offset && loop--) {
+		if (offset < PCI_TYPE0_1_HEADER_SIZE ||
+		    offset > PCI_CFG_SPACE_SIZE - 2 || offset & 3)
+			return -EINVAL;
+
+		if (config[offset] == cap_id)
+			return offset;
+
+		offset = config[offset + 1];
+	}
+
+	return offset ? -ELOOP : 0;
+}
+
+int igt_pci_config_raw_find_ext_cap_offset(const uint8_t *config, uint16_t cap_id)
+{
+	unsigned int offset = PCI_EXT_CAPS_START;
+	unsigned int loop = (PCI_EXT_CFG_SPACE_SIZE - offset) / 4;
+
+	while (loop) {
+		uint32_t header = igt_pci_config_raw_read_u32(config, offset);
+
+		loop--;
+
+		if (!header)
+			return 0;
+		if ((header & 0xffff) == cap_id)
+			return offset;
+
+		offset = (header >> 20) & 0xffc;
+		if (!offset)
+			return 0;
+		if (offset < PCI_EXT_CAPS_START || offset >= PCI_EXT_CFG_SPACE_SIZE)
+			return -EINVAL;
+	}
+
+	return -ELOOP;
+}
+
 static int open_pci_driver_dir(const char *driver)
 {
 	char path[PATH_MAX];
diff --git a/lib/igt_pci.h b/lib/igt_pci.h
index 509345b2d8..628cc24766 100644
--- a/lib/igt_pci.h
+++ b/lib/igt_pci.h
@@ -15,7 +15,8 @@ struct pci_device;
 
 #define PCI_TYPE0_1_HEADER_SIZE 0x40
 #define PCI_CAPS_START 0x34
-#define PCI_CFG_SPACE_SIZE 0x100
+#define PCI_EXT_CAPS_START 0x100
+#define PCI_EXT_CFG_SPACE_SIZE 0x1000
 
 enum pci_cap_id {
 	PCI_EXPRESS_CAP_ID = 0x10
@@ -27,6 +28,11 @@ enum pci_cap_id {
 #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
 
 int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
+int igt_pci_config_raw_read(const char *pci_slot, void *buffer, size_t length);
+uint16_t igt_pci_config_raw_read_u16(const uint8_t *config, unsigned int offset);
+uint32_t igt_pci_config_raw_read_u32(const uint8_t *config, unsigned int offset);
+int igt_pci_config_raw_find_cap_offset(const uint8_t *config, uint8_t cap_id);
+int igt_pci_config_raw_find_ext_cap_offset(const uint8_t *config, uint16_t cap_id);
 int igt_pci_device_unbind(const char *pci_slot);
 int igt_pci_driver_bind(const char *driver, const char *pci_slot);
 int igt_pci_driver_unbind(const char *driver, const char *pci_slot);
diff --git a/lib/tests/igt_pci.c b/lib/tests/igt_pci.c
new file mode 100644
index 0000000000..191edb95c5
--- /dev/null
+++ b/lib/tests/igt_pci.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <errno.h>
+#include <linux/pci_regs.h>
+#include <stdint.h>
+#include <string.h>
+
+#include "igt_core.h"
+#include "igt_pci.h"
+
+static void write_u32(uint8_t *config, unsigned int offset, uint32_t value)
+{
+	config[offset] = value;
+	config[offset + 1] = value >> 8;
+	config[offset + 2] = value >> 16;
+	config[offset + 3] = value >> 24;
+}
+
+static void test_cap(void)
+{
+	uint8_t config[PCI_CFG_SPACE_SIZE] = {};
+
+	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE;
+	config[PCI_TYPE0_1_HEADER_SIZE] = 0xaa;
+	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa),
+		      PCI_TYPE0_1_HEADER_SIZE);
+
+	config[PCI_CAPS_START] = 0xff;
+	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa), -EINVAL);
+
+	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE;
+	config[PCI_TYPE0_1_HEADER_SIZE] = 0xbb;
+	config[PCI_TYPE0_1_HEADER_SIZE + 1] = PCI_TYPE0_1_HEADER_SIZE;
+	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa), -ELOOP);
+}
+
+static void test_ext_cap(void)
+{
+	uint8_t config[PCI_EXT_CFG_SPACE_SIZE] = {};
+	unsigned int offset;
+
+	write_u32(config, PCI_EXT_CAPS_START, 0xaa);
+	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa),
+		      PCI_EXT_CAPS_START);
+
+	write_u32(config, PCI_EXT_CAPS_START,
+		  0xbb | (PCI_EXT_CAPS_START << 20));
+	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa), -ELOOP);
+
+	memset(config, 0, sizeof(config));
+	for (offset = PCI_EXT_CAPS_START;
+	     offset < PCI_EXT_CFG_SPACE_SIZE - sizeof(uint32_t);
+	     offset += sizeof(uint32_t))
+		write_u32(config, offset, 0xbb | ((offset + sizeof(uint32_t)) << 20));
+
+	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa), 0);
+}
+
+int igt_simple_main()
+{
+	test_cap();
+	test_ext_cap();
+}
\ No newline at end of file
diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index f1db66d07c..0a7c903f16 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -19,6 +19,7 @@ lib_tests = [
 	'igt_invalid_subtest_name',
 	'igt_nesting',
 	'igt_no_exit',
+	'igt_pci',
 	'igt_runnercomms_packets',
 	'igt_segfault',
 	'igt_simulation',
-- 
2.34.1

