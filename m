Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BB6C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A854D10E170;
	Wed, 16 Sep 2026 11:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8LybtBE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A903D10E170
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789559538; x=1821095538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=r27ahDqAxMQ2Cha8mamLPMJ5pomNjTvL5VbrZC4Ymmk=;
 b=Y8LybtBEfkPghefLCOKBaBzfrSRh+db5BoGRUQqkQOEXXECvZ6F+bEA9
 8m8AUbew5ZKP4XUv7ktjUNwETLTwm7m9hvvuGPdQ5J6aUq+E/u8tXgaFQ
 CGN+zAsbS9e14hYH0IyAeuTLzZs+RoVYtx7zR11DGE2QKv9BvMo1be+ji
 KLd0z7ugXRbiHrXHT6y+7vfrLH0FNzCSYqFA4q6D3qmD9nCaEQugPPAz9
 y2ZhyqSPV18dAuyFbMa9tbCn1nrQ2h+N//TOXDspd0AlB66JHZSdaNjSE
 YWpkQ147PKXdy5/k3svIZxpG37IavUJ/lfpmamQAEn/aBqoXC7WjiZDE8 A==;
X-CSE-ConnectionGUID: YtI5hZGpSrW4uguF5PMP7Q==
X-CSE-MsgGUID: p1BJwNG9T3+A3OoH7HRFaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89803672"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89803672"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:52:18 -0700
X-CSE-ConnectionGUID: z0MMgYPgQvyT3e9lPufsew==
X-CSE-MsgGUID: 99aHV2oXSfGkPueS3h142Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="303205155"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:52:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:52:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 04:52:17 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:52:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8U5xUbArvj1C9+7xwJizoTFjhCPp65RX949oxZ9CNemFbRnpprlXtrrvNqFYfj/vkgXAXiL+sbtuoEaw4mSJJ+gAUZuOjMxNMlTSXz022fBKv0DCVn76jNK1lmwKoGGIKaTMKl+cDSvqccLJyy0ktxn/xLeYcw0643+QhMooLufhUR253CXwrnJEosWg6yRkogGg2y9SgQrmBV0E6ZWPVNjgceXzlzMYNDd0sumhDoXgmE2Y8kd1PaiAxHXjBWWeDsD4iT3B427Rs4ZM00cq7gTwwfIo8pxY78id6Y2a/3XhNKElOOSM6UTw9lodA7D5ujBPSvs1ienx7O5iEh+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDwj1Pp/SEcJ+cYJya2TUx6OTS6A1KP/LsNc73aNq4s=;
 b=gAfijXj7G9xDfWDLQY3tCiE4jT4mFv6ON4pmeXZ1gRwnD/Rn7SniLKysyDAqI/kWJQuaq262yHTWfYsOw3XuMOsoiFrOAUXuyHnzB+qpRlvTVFQf1foURqsbvrcFXU1+txpkCebQvWG0sww0iN9a74xFXW3K+noF6yrO1xiZGJPlMQiAaNrulAgysKb+CuedDlx7weSKRfq4TJoABAl0iguAk447Q1tRsM0KeWtgyxSMLzgmrLqa+giaexhU/wFnlLruZBguIlM9jV/wGTH8OT7twDMY4ml/L2/7Labf/plWmZvM9ChR5j1XGgM2LGqpt+PfXP5cICxtZ/FKVVslPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS4PPF821BFB4AC.namprd11.prod.outlook.com (2603:10b6:f:fc02::37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 11:52:14 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 11:52:14 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 1/4] lib/igt_pci: Add raw configuration space helpers
Date: Wed, 16 Sep 2026 13:51:58 +0200
Message-ID: <20260916115201.1973752-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916115201.1973752-1-piotr.piorkowski@intel.com>
References: <20260916115201.1973752-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0020.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::7) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS4PPF821BFB4AC:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c1712e-1bd6-42f8-d37c-08df13e8f356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|22082099003|10067099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: pNdk6znY6lKKFxMxZ2v0nSiR8HHe+Lt7G05h9ZsLy+bjKilZXkxSywntN6+ce7BzMguX3sP/E4dMKf2uoFMEM9Z/Rz/qi2GtJ6vLwEdFT4m++70uTga56F92K6pnpna2dASWxZZNCIImoJFcG2PlPGrsxztoXB+dvqTwPNX9A/XeFuF342ZACSmgjdnHZGGw0nq413lPyt7ysQfRmcUBc2bdcS99f8n60Wtf28knDPWdZJDSIbGsEFBJVku9wcLGVaNqFtI0SAwaomppFITyLRBSZfcnrJGqHFEMCCa1EV8i0L1fnXL6T10InC61LXUoon6SoBqTVsKsl+Dwf6+CEGBMZdxp8SYR0IOdUkuKSrjzpb/u+tmruNGxFe8ogjSHJXSpAdB6Dbze59NdPYRVwtHbnkzLK0jgBp/Zg0XQxofqyEVcMvlK034TANTw1W6ALzWpaZwsuVie07VveCFNdGPi25QEaDlOkaDuCzOyLS+h2TMAG0ZsrOlwk+0MC2MBSFX18CDg1Z4egtnC8BH/6bZGyCreDPYk9OqWil0ObxAxV59EXE8URjKiuC9RQ8JIvqr0IhgX04WtKSoZdR2PuSVG+o/l/GN5mKIL1hQZZh7VGoqI1EqCxtlQ5C+hVEbVvM1w7e1uuD2m890AQkNwwk2u5lzZAVbwvhnS91co2P4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3RFaS9LWGcva2pycGdtSmZWd1E2Rmc2LzlxQUx1bXVCK2E3VUltNkVHMTlF?=
 =?utf-8?B?Y3JneXpQUlFJeHdqYzl2YnF0S1JyT1JFbWoxNkpxb0JRWFIyZUZEK0hYWFhP?=
 =?utf-8?B?Tk05SFRYcDFINmFFaUVXT2FKb2xqVlVySktyWWh2UUxWVVVNR2RpVndpMzJk?=
 =?utf-8?B?Y2xIeHA2MEs2UWFiSDZYakpWVjRQOUhsSDlveHBXTk1hQjcvVktFcGxzazhs?=
 =?utf-8?B?WnZHSEN0SmQwT3l1Q0VnLzdlMzlnTzBpRnlsaUdkL2NscThHWFYwU296TUVj?=
 =?utf-8?B?bEwxQ3ZlUEVDNFphT21XZW1UZ2I2R2toUXRudnc4WVpKSCtCTkJrRTBjVS9i?=
 =?utf-8?B?dWFsdGQwSXdzMndHMWg1RVJGY0wxNzFvUUROQkVNWlZPTEdqMTFEZnovNG5x?=
 =?utf-8?B?aDVtWmtzeFJrMldmNkRML3lNT0lkUGJ3SU5PV1ZidG02UWVLbHQ5Z042dzVP?=
 =?utf-8?B?VklDbUUreG1FOE1kVm9GZEpQNzJHUDlGYUpKYlVpdUpuTTdISm94aFJPbHRF?=
 =?utf-8?B?UllHbGZlSDFaMXRSQUVMVmZMVCsvZEZlOG0zNTFvb2VzZnVIc0dGZ0phQzc5?=
 =?utf-8?B?MHBKdUdWMy90eitIMm9RSFczN09OTmlTSkVudGxnOHIxME1yVExubFlNV2JG?=
 =?utf-8?B?U3JPaTQyY0IxYkUyQTYwMndQNFFxdmtuS3J4SE0zMTFOSkU3SFVtdE5td3h1?=
 =?utf-8?B?VzE5MFFGZXhscWh0ZUpSSVJRcjdIZTFWY0ExdGpJeEtWMGI3M2JRaVB4SDMx?=
 =?utf-8?B?K3BlbFBWVUtkb1ZpNGxwRmVlL2NOcitBWjR4RlQ2M25KdUdmUm9CNVNTYkR1?=
 =?utf-8?B?bk1oWjhhMlJpVThDemdIUFZmRWUzbVgwR1pZb3dpWXRHOWdsN08wMmRmSXp2?=
 =?utf-8?B?b3VUOG5TWUtXdGZpa2FaandSd1lzYmxhTWpwdWpTeERPYTNnVDNLdE5YMWlv?=
 =?utf-8?B?Unk0MmZyS0lybHc0K0dJUXB0RWFRaFQ4UXUzQUF1RUVvdTdMcWFsMTEzdWo2?=
 =?utf-8?B?bzNRMUl6c0lBRDd2ekdHd2ZoMStjWXUwR09QeEN4VjR2bjVKNFJXLzlBRmQx?=
 =?utf-8?B?SlRQV29pMmlPK0syOXBuWXJIUnRSWkUycjZTelIwQnBoK0dudXZNS0JmZDJx?=
 =?utf-8?B?cHVBTW10Wm1BelMwUklGa0JBVHZrU2VTNXcyblJaWVprSkphODdqRGp5Q1JU?=
 =?utf-8?B?Z1p2ZHQraFl2VExrUUZ0YkdzZmRSMVQvdUZKVUliVk55TFFNdGUvWmFhcTlu?=
 =?utf-8?B?Y3ZiQWlPUDFmUFRjeXJhUEoyRkloUy9BcmVXTzZFSEpCTDZubXVVajdWZXBm?=
 =?utf-8?B?R0JzWkV2R1dzRjhTakdJMnAzckZwWlZEQzJNQTdoNjJDUHN1cU5GQXhNb2d3?=
 =?utf-8?B?b1VsR3MzekdjTHZTS3F6MS9KWWRmTytEaUZTSUxIYXRGbHJkTkc1alNrdlR5?=
 =?utf-8?B?SFNkNEgvdUNvUzhzR1hjZGxiYjl5L1BiVVlZUjkya3pmN3UvSmg3cEMzc2U2?=
 =?utf-8?B?WVVPQWtGWmFZdUVMbEVLaVlkVGpXaGZXa2JDdk1RUlNoMGJJMVV6cytPemlT?=
 =?utf-8?B?RWRXNUREWjJTWXBwUTBCM0k1aGdiZ0cxQ3NlcFpvWXBWd1ZWajRKUXRMaXl1?=
 =?utf-8?B?cWpSdGxBV2tRYm5DREJFUlk4YjBHSTUxUmlWMG4reEtDN0diYVdVUE5aamZR?=
 =?utf-8?B?SVd0Wlo0TlJyOHBBb0tpN0I0RFFGODU2SXRxM2dwWXZ6WHAwOUVxMEZwS2Nt?=
 =?utf-8?B?MDdES1Q2TjVES1BHNmMwb0JMR2FrL2Q3dzI2dkdVZFNrMTIwYkRwTVFCMnNY?=
 =?utf-8?B?R2syTVJHVm96L2JlOGkvTUZ4K1NZcW02SzJwNm95ZGtIZE84L1hUS050RXpu?=
 =?utf-8?B?eTMyZGhHUjNwY0Z5KzN2ZFNkTDdyZjJEa1ozRDNSRHhSZ043bXd6TkJiZEdr?=
 =?utf-8?B?ZHFjelFpRC9FcXN6QktnblRDUDZaWGpVMStYdUgzcktlay9WNGY3dlpLM3My?=
 =?utf-8?B?RjlINGgvRzltaC9TR0hFejFLSG1TcEVDaEdMWVpsZWhKb2owejlpSmJ3NW94?=
 =?utf-8?B?bTZHSzBEcHRpQ3hIM3JiSHlkL3BmZGVRYjZta2xFYjdBMnRqMWZsQzBzWkVN?=
 =?utf-8?B?YzdFQWZvRHZ6NUhXZ2ZrcnVndW9oZXdlaEpyU2JoTGE2VWRUU2hva0tOcVk3?=
 =?utf-8?B?clVNWFIwZkgwOFVNdVFYaERTSGJldC9aUEVmL1k4Q3ptWTdYM1lmZjhDTUxp?=
 =?utf-8?B?WlpUTmdrU1FkMmZEellzUE9DRGsyZG94eXNwM1FvU0dhTE5sM2VmV09oMC9l?=
 =?utf-8?B?dzZhZ0F4RVJNM3BUNEVlQkwrcWV2T2xuMHZrMUZseE1kc0p1SEFXTEcrc3RC?=
 =?utf-8?Q?zHXPYBMiLqlStdwo=3D?=
X-Exchange-RoutingPolicyChecked: KjR8ZqE7g1CLf97ex2/NAmdU8ooWoBqTkvgheFMSdeyu4ebVc7vOu3fsOtIyY59BNUjJQ/MCkI0oGqlPUUUHx0te8y8VtpZWQ3C4GwTaL5E5tEcEJdleEzb7suv3Nq051l3CzRWcggi1+r/kPt3g0T25fGl23XSkxbTlzXUBLPOU0USvgLFrQy0va4dNlzdO0I9GeHGvl55dduhzynyEFPShRkdqgYAq/1n3SvpBF9aOZ0Ft+WKbjazjiz02c5d1mUqAlRP7NL1sa7J46hcT48WDlW2EDOvgDAvegZqe24xPK546dxw3H15OE+ITQ1tamqNI2STnZtT/yyyZteLtzw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c1712e-1bd6-42f8-d37c-08df13e8f356
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:52:14.6471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgKbD/onSN1RKZQD+azGPvy27P36mFW1E63YvRdoHZc4AI8lGC+NX4Mb55fYS1Di/EHnQ4QBoRR5L2tWu65v0dnBOvKUJAwVh5pIPXA33P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF821BFB4AC
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
Provide little-endian u16/u32 readers and standard capability lookup
helpers for configuration-space buffers.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GPT-5.6 Luna
---
 lib/igt_pci.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pci.h |  7 +++++
 2 files changed, 93 insertions(+)

diff --git a/lib/igt_pci.c b/lib/igt_pci.c
index b63550b390..06717fe8eb 100644
--- a/lib/igt_pci.c
+++ b/lib/igt_pci.c
@@ -61,6 +61,92 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
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
+		if (offset < PCI_TYPE0_1_HEADER_SIZE || offset >= PCI_CFG_SPACE_SIZE)
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
+	while (loop--) {
+		uint32_t header = igt_pci_config_raw_read_u32(config, offset);
+
+		if (!header)
+			break;
+		if ((header & 0xffff) == cap_id)
+			return offset;
+
+		offset = (header >> 20) & 0xffc;
+		if (!offset)
+			break;
+		if (offset < PCI_EXT_CAPS_START || offset >= PCI_EXT_CFG_SPACE_SIZE)
+			return -EINVAL;
+	}
+
+	return loop ? 0 : -ELOOP;
+}
+
 static int open_pci_driver_dir(const char *driver)
 {
 	char path[PATH_MAX];
diff --git a/lib/igt_pci.h b/lib/igt_pci.h
index 509345b2d8..787c10fc51 100644
--- a/lib/igt_pci.h
+++ b/lib/igt_pci.h
@@ -16,6 +16,8 @@ struct pci_device;
 #define PCI_TYPE0_1_HEADER_SIZE 0x40
 #define PCI_CAPS_START 0x34
 #define PCI_CFG_SPACE_SIZE 0x100
+#define PCI_EXT_CAPS_START 0x100
+#define PCI_EXT_CFG_SPACE_SIZE 0x1000
 
 enum pci_cap_id {
 	PCI_EXPRESS_CAP_ID = 0x10
@@ -27,6 +29,11 @@ enum pci_cap_id {
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
-- 
2.34.1

